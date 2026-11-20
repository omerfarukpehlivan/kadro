import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Kapasite sınırlı (Bounded LRU) ve süre sınırlı (TTL) bellek içi önbellek.
///
/// Dart'taki standart `Map` (`LinkedHashMap`) ekleme sırasını koruduğu için
/// okuma isabetlerinde anahtarı sona taşıyarak (MRU) ve taşma durumunda ilk
/// anahtarı atarak (LRU) ekstra paket gerektirmeden O(1) tahliye sağlar.
class _LruTtlCache<K, V> {
  final int maxEntries;
  final Duration ttl;
  final Map<K, (DateTime, V)> _entries = {};

  _LruTtlCache({required this.maxEntries, required this.ttl});

  int get length => _entries.length;

  V? get(K key) {
    final entry = _entries[key];
    if (entry == null) return null;

    if (DateTime.now().difference(entry.$1) >= ttl) {
      _entries.remove(key);
      return null;
    }

    // LRU güncellemesi: erişilen anahtarı en güncel konuma (sona) taşı.
    _entries.remove(key);
    _entries[key] = entry;
    return entry.$2;
  }

  void put(K key, V value) {
    _entries.remove(key);
    while (_entries.length >= maxEntries && _entries.isNotEmpty) {
      _entries.remove(_entries.keys.first);
    }
    _entries[key] = (DateTime.now(), value);
  }

  void clear() => _entries.clear();
}

/// `lessonTopicTestCountsProvider` önbellek anahtarı.
///
/// Aynı ders adının (ör. `'Tarih'`) farklı KPSS sınav kapsamlarında
/// birbirinin test sayısını ezmesini önleyen immutable değer nesnesidir.
@immutable
class TopicCountQueryKey {
  final String scopeKey;
  final String lessonName;

  const TopicCountQueryKey({required this.scopeKey, required this.lessonName});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TopicCountQueryKey &&
        other.scopeKey == scopeKey &&
        other.lessonName == lessonName;
  }

  @override
  int get hashCode => Object.hash(scopeKey, lessonName);

  @override
  String toString() =>
      'TopicCountQueryKey(scopeKey: $scopeKey, lessonName: $lessonName)';
}

/// Soru verilerini yerel JSON dosyasından veya Supabase bulut veritabanından (`public.questions`)
/// okuyan veri erişim katmanı.
///
/// Web/Angular Karşılığı: `QuestionService` / Repository.
/// UI bileşenleri verinin nereden geldiğini (Supabase veya JSON) bilmez; sadece bu katmanı çağırır.
class QuestionRepository {
  final String assetPath;

  /// Testlerde veya özel paket yüklemelerinde `rootBundle` yerine geçirilebilen asset okuyucu.
  final Future<String> Function(String path)? assetLoader;

  /// `FLUTTER_TEST` ortamında sahte/kısa zamanlı widget testlerinde Isolate başlatma
  /// gecikmesini önlerken birim testlerde `compute()` yolunu zorlamak için kullanılır.
  final bool forceIsolateParsing;

  /// Bellek içi (In-Memory) bounded LRU + TTL önbellek deposu (`TASK-129`).
  /// Maksimum 24 kapsam/ders dilimi ve 2 saat TTL ile bellek şişmesini ve egress'i sınırlar.
  static const int maxQuestionCacheEntries = 24;
  static const int isolateParseThresholdBytes = 50 * 1024;
  static const int idBatchLimit = 50;

  static const Duration cacheTtl = Duration(hours: 2);

  static const Set<String> _sharedBGroupGkLessonNames = {
    'Tarih',
    'Coğrafya',
    'Vatandaşlık',
    'Güncel Bilgiler',
  };

  static final _LruTtlCache<String, List<Question>> _cachedQuestions =
      _LruTtlCache<String, List<Question>>(
        maxEntries: maxQuestionCacheEntries,
        ttl: cacheTtl,
      );
  static final _LruTtlCache<String, List<Question>> _cachedAssetPools =
      _LruTtlCache<String, List<Question>>(maxEntries: 6, ttl: cacheTtl);
  static final Map<String, (DateTime, List<TrueFalseItem>)> _cachedTrueFalse =
      {};
  static (DateTime, List<ConceptMatchSet>)? _cachedConceptMatchSets;

  const QuestionRepository({
    this.assetPath = 'assets/data/questions/sample_questions.json',
    this.assetLoader,
    this.forceIsolateParsing = false,
  });

  /// Sınav kapsamı için modüler yerel JSON dosya yolunu döner.
  static String scopedAssetPathFor(ExamSelection selection) =>
      'assets/data/scopes/${selection.curriculumNamespace}.json';

  /// JSON metnini saf [Question] listesine dönüştüren top-level/static Isolate fonksiyonu.
  static List<Question> parseQuestionsJsonSync(String jsonString) {
    final dynamic decoded = jsonDecode(jsonString);
    if (decoded is! List) {
      throw const FormatException('Beklenen JSON formatı dizi (Array) olmalı.');
    }
    return decoded
        .map((item) => Question.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<String> _readAssetString(String path) {
    final customLoader = assetLoader;
    if (customLoader != null) {
      return customLoader(path);
    }
    return rootBundle.loadString(path);
  }

  Future<List<Question>> _parseJsonWithIsolateFallback(
    String jsonString,
  ) async {
    final shouldOffload =
        jsonString.length >= isolateParseThresholdBytes &&
        (forceIsolateParsing || !SupabaseConfig.isFlutterTest);
    if (!shouldOffload) {
      return parseQuestionsJsonSync(jsonString);
    }
    try {
      return await compute(parseQuestionsJsonSync, jsonString);
    } catch (_) {
      return parseQuestionsJsonSync(jsonString);
    }
  }

  Future<List<Question>> _loadAndParseAssetFile(String path) async {
    if (assetLoader == null) {
      final cachedPool = _cachedAssetPools.get(path);
      if (cachedPool != null) {
        return cachedPool;
      }
    }

    final jsonString = await _readAssetString(path);
    final parsed = await _parseJsonWithIsolateFallback(jsonString);
    if (assetLoader == null) {
      _cachedAssetPools.put(path, parsed);
    }
    return parsed;
  }

  /// Tüm soruları yerel JSON dosyasından (büyük dosyalarda Isolate üzerinden) yükler.
  Future<List<Question>> loadAllQuestions() async {
    try {
      return await _loadAndParseAssetFile(assetPath);
    } catch (e) {
      throw Exception('Sorular yüklenemedi: $e');
    }
  }

  /// `loadAllQuestions` için alias (geriye dönük uyumluluk).
  Future<List<Question>> loadSampleQuestions() => loadAllQuestions();

  /// Havuzdaki tüm soruları (varsa Supabase, yoksa yerel JSON) yükler.
  Future<List<Question>> fetchAllFromPool() => fetchQuestions();

  /// ÖSYM Çeldirici Avı için `distractorTrap` analizine sahip yüksek çeldiricili
  /// tuzak soruları süzer (`TASK-121`).
  ///
  /// Web/Angular karşılığı: Soru havuzundan çeldirici metadata'sına göre
  /// filtrelenmiş akış döndüren `getDistractorHuntQuestions()` servis metodudur.
  Future<List<Question>> fetchDistractorHuntQuestions({
    String? lesson,
    int limit = 10,
  }) async {
    final pool = await fetchQuestions(lesson: lesson);
    final trapQuestions = pool
        .where(
          (q) =>
              q.distractorTrap != null && q.distractorTrap!.trim().isNotEmpty,
        )
        .toList();

    if (trapQuestions.length >= limit) {
      return trapQuestions.take(limit).toList();
    }

    final trapIds = trapQuestions.map((t) => t.id).toSet();
    final remaining = pool
        .where((q) => !trapIds.contains(q.id))
        .take(limit - trapQuestions.length);
    return [...trapQuestions, ...remaining];
  }

  /// 60 Soruluk Resmi KPSS Lisans Genel Kültür Deneme Sınavı Motoru (TASK-87).
  ///
  /// ÖSYM standart soru dağılımı:
  /// - Tarih: 27 Soru (1..27)
  /// - Coğrafya: 18 Soru (28..45)
  /// - Vatandaşlık: 9 Soru (46..54)
  /// - Güncel Bilgiler: 6 Soru (55..60)
  /// Toplam: 60 Soru, 65 Dakika.
  ///
  /// [examNumber] (1, 2, 3...) parametresiyle her deneme paketi için
  /// tekrara düşmeyen, dengeli konu dağılımlı deterministik soru seti üretir.
  Future<List<Question>> generateGeneralCultureMockExam({
    int examNumber = 1,
  }) async {
    final allQuestions = await loadAllQuestions();

    List<Question> pickTopicQuestions(
      String lesson,
      String topic,
      int count,
      int examIdx,
    ) {
      final matching = allQuestions
          .where((q) => q.lesson == lesson && q.topic == topic)
          .toList();
      if (matching.isEmpty) return [];

      final startIndex = ((examIdx - 1) * count) % matching.length;
      final selected = <Question>[];
      for (var i = 0; i < count; i++) {
        selected.add(matching[(startIndex + i) % matching.length]);
      }
      return selected;
    }

    final examQuestions = <Question>[];

    // 1. Tarih (27 Soru)
    final tarihSpecs = [
      ('İslamiyet Öncesi Türk Tarihi', 4),
      ('İlk Türk-İslam Devletleri', 4),
      ('Osmanlı Kültür ve Uygarlığı', 6),
      ('Osmanlı Dağılma Dönemi', 4),
      ('Kurtuluş Savaşı Hazırlık ve Cepheler', 3),
      ('Atatürk İlke ve İnkılapları', 3),
      ('Çağdaş Türk ve Dünya Tarihi', 3),
    ];
    for (final spec in tarihSpecs) {
      examQuestions.addAll(
        pickTopicQuestions('Tarih', spec.$1, spec.$2, examNumber),
      );
    }

    // 2. Coğrafya (18 Soru)
    final cografyaSpecs = [
      ("Türkiye'nin Coğrafi Konumu", 3),
      ("Türkiye'nin Yer Şekilleri ve İklimi", 3),
      ("Türkiye'de Nüfus ve Yerleşme", 3),
      ("Türkiye'de Tarım ve Hayvancılık", 3),
      ('Madenler ve Enerji Kaynakları', 3),
      ('Sanayi, Ticaret ve Ulaşım', 3),
    ];
    for (final spec in cografyaSpecs) {
      examQuestions.addAll(
        pickTopicQuestions('Coğrafya', spec.$1, spec.$2, examNumber),
      );
    }

    // 3. Vatandaşlık (9 Soru)
    final vatandaslikSpecs = [
      ('Temel Hukuk Kavramları', 2),
      ('1982 Anayasası ve Temel İlkeler', 2),
      ('Temel Hak ve Ödevler', 1),
      ('Yasama, Yürütme ve Yargı', 2),
      ('İdare Hukuku', 1),
      ('Uluslararası Kuruluşlar', 1),
    ];
    for (final spec in vatandaslikSpecs) {
      examQuestions.addAll(
        pickTopicQuestions('Vatandaşlık', spec.$1, spec.$2, examNumber),
      );
    }

    // 4. Güncel Bilgiler (6 Soru)
    final guncelSpecs = [
      ('Türkiye ve Dünya Gündemi', 1),
      ('Kültür, Sanat ve Edebiyat', 1),
      ('Bilim ve Teknoloji Gelişmeleri', 1),
      ('Spor ve Olimpiyatlar', 1),
      ('UNESCO Miras Listesi', 1),
      ('Önemli Günler ve Zirveler', 1),
    ];
    for (final spec in guncelSpecs) {
      examQuestions.addAll(
        pickTopicQuestions('Güncel Bilgiler', spec.$1, spec.$2, examNumber),
      );
    }

    // Sınav içindeki sıra numarasını 1..60 olarak kopyala
    final indexedExam = <Question>[];
    for (var i = 0; i < examQuestions.length; i++) {
      indexedExam.add(examQuestions[i].copyWith(orderIndex: i + 1));
    }

    return indexedExam;
  }

  static const Map<String, List<(String, int)>> _balancedGkTopicQuotas = {
    'Tarih': [
      ('İslamiyet Öncesi Türk Tarihi', 4),
      ('İlk Türk-İslam Devletleri', 4),
      ('Osmanlı Kültür ve Uygarlığı', 6),
      ('Osmanlı Dağılma Dönemi', 4),
      ('Kurtuluş Savaşı Hazırlık ve Cepheler', 3),
      ('Atatürk İlke ve İnkılapları', 3),
      ('Çağdaş Türk ve Dünya Tarihi', 3),
    ],
    'Coğrafya': [
      ("Türkiye'nin Coğrafi Konumu", 3),
      ("Türkiye'nin Yer Şekilleri ve İklimi", 3),
      ("Türkiye'de Nüfus ve Yerleşme", 3),
      ("Türkiye'de Tarım ve Hayvancılık", 3),
      ('Madenler ve Enerji Kaynakları', 3),
      ('Sanayi, Ticaret ve Ulaşım', 3),
    ],
    'Vatandaşlık': [
      ('Temel Hukuk Kavramları', 2),
      ('1982 Anayasası ve Temel İlkeler', 2),
      ('Temel Hak ve Ödevler', 1),
      ('Yasama, Yürütme ve Yargı', 2),
      ('İdare Hukuku', 1),
      ('Uluslararası Kuruluşlar', 1),
    ],
    'Güncel Bilgiler': [
      ('Türkiye ve Dünya Gündemi', 1),
      ('Kültür, Sanat ve Edebiyat', 1),
      ('Bilim ve Teknoloji Gelişmeleri', 1),
      ('Spor ve Olimpiyatlar', 1),
      ('UNESCO Miras Listesi', 1),
      ('Önemli Günler ve Zirveler', 1),
    ],
  };

  /// E-KPSS İşitme-1 ve Zihinsel kitapçıklarında sadeleştirilmiş metin varyantını döndürür.
  static String? preferredSourceVariantFor(ExamSelection selection) {
    if (selection.family == KpssExamFamily.ekpss &&
        (selection.disabilityGroup == DisabilityGroup.isitme1 ||
            selection.disabilityGroup == DisabilityGroup.zihinsel)) {
      return 'simplified';
    }
    return null;
  }

  ExamSelection _selectionForBlueprint(
    ExamSelection base,
    MockExamBlueprint blueprint,
  ) {
    if (blueprint.family == KpssExamFamily.bGrubu &&
        blueprint.scopeKey.endsWith('_gk') &&
        base.scopeKey != blueprint.scopeKey) {
      return ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: base.educationLevel,
        bGroupProfile: BGroupProfile.onlyGk,
        disabilityGroup: base.disabilityGroup,
        examCycleYear: base.examCycleYear,
        includeExtraTime: base.includeExtraTime,
      );
    }
    if (blueprint.id == 'meb_ags_oturum_1' &&
        base.oabtBranch != OabtBranch.none) {
      return base.copyWith(oabtBranch: OabtBranch.none);
    }
    return base;
  }

  /// Verilen [MockExamBlueprint] şablonuna ve aktif [ExamSelection] profiline göre
  /// çok bölümlü deneme sınavı üretir; bölüm sınırlarını ve eksik havuzları raporlar.
  Future<GeneratedBlueprintExam> generateMockExamFromBlueprint(
    MockExamBlueprint blueprint, {
    ExamSelection selection = ExamSelection.initial,
    int? mockNumber,
    String? preferredSourceVariant,
  }) async {
    final effectiveMockNumber = mockNumber ?? blueprint.mockNumber ?? 1;
    final effectiveSelection = _selectionForBlueprint(selection, blueprint);
    final resolvedVariant =
        preferredSourceVariant ?? preferredSourceVariantFor(effectiveSelection);

    final isClassicGkPackage =
        (blueprint.id.startsWith('gk_deneme_') ||
            blueprint.id.startsWith('practice_gk_1') ||
            blueprint.id.startsWith('practice_gk_2') ||
            blueprint.id.startsWith('practice_gk_3')) &&
        effectiveSelection.family == KpssExamFamily.bGrubu &&
        effectiveSelection.bGroupProfile == BGroupProfile.onlyGk &&
        effectiveSelection.educationLevel == EducationLevel.lisans &&
        resolvedVariant == null &&
        assetLoader == null;

    if (isClassicGkPackage) {
      final legacyQuestions = await generateGeneralCultureMockExam(
        examNumber: effectiveMockNumber,
      );
      final ranges = _inferSectionRanges(blueprint.sections, legacyQuestions);
      return GeneratedBlueprintExam(
        blueprint: blueprint,
        questions: legacyQuestions,
        sectionRanges: ranges,
      );
    }

    final collected = <Question>[];
    final sectionRanges = <BlueprintSectionRange>[];
    final missingSections = <String>[];
    final partialSections = <String, int>{};
    final usedIds = <String>{};

    for (final section in blueprint.sections) {
      var sectionPool = await fetchQuestions(
        lesson: section.lesson,
        topic: section.topicFilter,
        strictTopicFilter: section.topicFilter != null,
        selection: effectiveSelection,
        preferredSourceVariant: resolvedVariant,
        limit: math.max(section.questionCount * 3, 120),
      );

      if (section.subBranch != null && section.subBranch!.isNotEmpty) {
        sectionPool = sectionPool
            .where(
              (q) => q.subBranch == null || q.subBranch == section.subBranch,
            )
            .toList();
      }

      final startIndex = collected.length;
      final picked = _pickSectionQuestions(
        pool: sectionPool,
        section: section,
        mockNumber: effectiveMockNumber,
        alreadyUsedIds: usedIds,
      );

      collected.addAll(picked);
      for (final q in picked) {
        usedIds.add(q.id);
      }
      final endIndex = collected.length;

      if (picked.isEmpty) {
        missingSections.add(section.title);
      } else {
        sectionRanges.add(
          BlueprintSectionRange(
            section: section,
            startIndex: startIndex,
            endIndex: endIndex,
          ),
        );
        if (picked.length < section.questionCount) {
          partialSections[section.title] = picked.length;
        }
      }
    }

    final indexedQuestions = <Question>[
      for (var i = 0; i < collected.length; i++)
        collected[i].copyWith(orderIndex: i + 1),
    ];

    return GeneratedBlueprintExam(
      blueprint: blueprint,
      questions: indexedQuestions,
      sectionRanges: sectionRanges,
      missingSections: missingSections,
      partialSections: partialSections,
    );
  }

  List<BlueprintSectionRange> _inferSectionRanges(
    List<ExamSectionSpec> specs,
    List<Question> questions,
  ) {
    if (questions.isEmpty) return const [];
    final ranges = <BlueprintSectionRange>[];
    var cursor = 0;
    for (final spec in specs) {
      var start = -1;
      var end = -1;
      for (var i = cursor; i < questions.length; i++) {
        if (questions[i].lesson == spec.lesson) {
          if (start == -1) start = i;
          end = i + 1;
        } else if (start != -1) {
          break;
        }
      }
      if (start != -1) {
        ranges.add(
          BlueprintSectionRange(
            section: spec,
            startIndex: start,
            endIndex: end,
          ),
        );
        cursor = end;
      }
    }
    if (ranges.isEmpty) {
      ranges.add(
        BlueprintSectionRange(
          section: specs.first,
          startIndex: 0,
          endIndex: questions.length,
        ),
      );
    }
    return ranges;
  }

  List<Question> _pickSectionQuestions({
    required List<Question> pool,
    required ExamSectionSpec section,
    required int mockNumber,
    required Set<String> alreadyUsedIds,
  }) {
    final available = pool
        .where((q) => !alreadyUsedIds.contains(q.id))
        .toList();
    if (available.isEmpty) return const [];

    final targetCount = section.questionCount;
    final picked = <Question>[];
    final pickedIds = <String>{};

    final quotas = _balancedGkTopicQuotas[section.lesson];
    final standardQuotaTotal = quotas?.fold<int>(0, (s, q) => s + q.$2);

    if (quotas != null &&
        section.topicFilter == null &&
        standardQuotaTotal == targetCount) {
      for (final quota in quotas) {
        final topicItems = available
            .where((q) => q.topic == quota.$1 && !pickedIds.contains(q.id))
            .toList();
        if (topicItems.isEmpty) continue;
        final offset = ((mockNumber - 1) * quota.$2) % topicItems.length;
        final takeCount = math.min(quota.$2, topicItems.length);
        for (var i = 0; i < takeCount; i++) {
          final item = topicItems[(offset + i) % topicItems.length];
          if (pickedIds.add(item.id)) {
            picked.add(item);
          }
        }
      }
    } else {
      // Konular arasında eşit dağılım (round-robin) sağlayarak tekrarsız seçim yap.
      final byTopic = <String, List<Question>>{};
      for (final q in available) {
        byTopic.putIfAbsent(q.topic, () => <Question>[]).add(q);
      }
      final topicQueues = byTopic.values.toList();
      final topicCursors = List<int>.generate(topicQueues.length, (i) {
        final qList = topicQueues[i];
        return ((mockNumber - 1) * 2) % qList.length;
      });
      final topicConsumed = List<int>.filled(topicQueues.length, 0);

      var progressed = true;
      while (picked.length < targetCount && progressed) {
        progressed = false;
        for (var t = 0; t < topicQueues.length; t++) {
          if (picked.length >= targetCount) break;
          final list = topicQueues[t];
          if (topicConsumed[t] >= list.length) {
            continue;
          }
          for (var step = 0; step < list.length; step++) {
            final idx = (topicCursors[t] + step) % list.length;
            topicConsumed[t] += 1;
            final candidate = list[idx];
            if (pickedIds.add(candidate.id)) {
              picked.add(candidate);
              topicCursors[t] = (idx + 1) % list.length;
              progressed = true;
              break;
            }
            if (topicConsumed[t] >= list.length) break;
          }
        }
      }
    }

    // Kotadan eksik kalan olursa dersin diğer konularından tamamla.
    if (picked.length < targetCount) {
      final offset = ((mockNumber - 1) * 3) % available.length;
      for (
        var i = 0;
        i < available.length && picked.length < targetCount;
        i++
      ) {
        final candidate = available[(offset + i) % available.length];
        if (pickedIds.add(candidate.id)) {
          picked.add(candidate);
        }
      }
    }

    return picked;
  }

  /// Belirli bir derse (`lessonName`) ait soruları yerel dosyadan filtreleyerek döner.
  Future<List<Question>> getQuestionsByLesson(String lessonName) async {
    final allQuestions = await loadAllQuestions();
    return allQuestions
        .where((question) => question.lesson == lessonName)
        .toList();
  }

  static String? _resolveSubBranchForSelection(ExamSelection selection) {
    if (selection.family == KpssExamFamily.mebAgs &&
        selection.oabtBranch.isOabtExam) {
      return 'oabt_${selection.oabtBranch.key}';
    }
    if (selection.family == KpssExamFamily.dhbt) {
      return 'dhbt_${selection.educationLevel.key}';
    }
    return null;
  }

  static String _buildFetchCacheKey({
    ExamSelection? selection,
    String? lesson,
    String? topic,
    String? difficulty,
    String? preferredSourceVariant,
    required int limit,
  }) {
    final scopeKey = selection?.scopeKey ?? 'all';
    final subBranch = selection == null
        ? 'none'
        : (_resolveSubBranchForSelection(selection) ??
              selection.curriculumNamespace);
    final disabilityKey = selection?.disabilityGroup.key ?? 'none';
    return [
      scopeKey,
      subBranch,
      disabilityKey,
      lesson ?? 'all',
      topic ?? 'all',
      difficulty ?? 'all',
      preferredSourceVariant ?? 'default',
      limit.toString(),
    ].join('|');
  }

  Future<({List<Question> questions, bool isDedicatedScopeAsset})>
  _loadLocalPoolForSelection(ExamSelection? selection) async {
    if (selection != null) {
      try {
        final scoped = await _loadAndParseAssetFile(
          scopedAssetPathFor(selection),
        );
        return (questions: scoped, isDedicatedScopeAsset: true);
      } catch (_) {
        // Kapsam dosyası henüz paketlenmediyse çekirdek JSON yedeğine düş.
      }
    }
    final pool = await loadSampleQuestions();
    return (questions: pool, isDedicatedScopeAsset: false);
  }

  /// Supabase `public.questions` tablosundan ders, konu ve sınav kapsamı bazında soruları çeker.
  /// Bulut bağlantısı yoksa veya hata alınırsa önce `assets/data/scopes/<ns>.json`,
  /// yoksa `sample_questions.json` yedeğine düşer (Offline Fallback).
  ///
  /// Performans & Maliyet: Bounded LRU + [cacheTtl] önbelleğinden 0ms gecikmeyle döner.
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
    ExamSelection? selection,
    String? difficulty,
    String? preferredSourceVariant,
    bool strictTopicFilter = false,
    bool forceRefresh = false,
    int limit = 60,
  }) async {
    final useCache = assetLoader == null;
    final cacheKey = _buildFetchCacheKey(
      selection: selection,
      lesson: lesson,
      topic: topic,
      difficulty: difficulty,
      preferredSourceVariant: preferredSourceVariant,
      limit: limit,
    );
    if (useCache && !forceRefresh) {
      final cached = _cachedQuestions.get(cacheKey);
      if (cached != null) {
        return cached;
      }
    }

    List<Question>? resolved;
    final client = assetLoader == null ? SupabaseConfig.clientOrNull : null;
    if (client != null) {
      try {
        var filterQuery = client
            .from('questions')
            .select()
            .eq('question_type', 'multiple_choice');

        if (lesson != null && lesson.isNotEmpty) {
          filterQuery = filterQuery.eq('lesson', lesson);
        }
        if (topic != null && topic.isNotEmpty) {
          filterQuery = filterQuery.eq('topic', topic);
        }
        if (difficulty != null && difficulty.isNotEmpty) {
          filterQuery = filterQuery.eq('difficulty', difficulty);
        }
        if (selection != null) {
          filterQuery = filterQuery.contains('exam_scopes', [
            selection.scopeKey,
          ]);
          final subBranch = _resolveSubBranchForSelection(selection);
          if (subBranch != null) {
            filterQuery = filterQuery.or(
              'sub_branch.is.null,sub_branch.eq.$subBranch',
            );
          }
        }
        if (preferredSourceVariant != null &&
            preferredSourceVariant.isNotEmpty) {
          filterQuery = filterQuery.or(
            'source_variant.is.null,source_variant.eq.$preferredSourceVariant',
          );
        }

        // Deterministik ve sabit sıralama: Önce order_index'e göre artan,
        // Anti-Scraping: Tek seferde en fazla [limit] (varsayılan: 60) soru çekilebilir.
        final List<dynamic> response = await filterQuery
            .order('order_index', ascending: true, nullsFirst: false)
            .limit(limit);
        if (response.isNotEmpty) {
          final cloudQuestions = response
              .map((row) => Question.fromSupabase(row as Map<String, dynamic>))
              .where(
                (q) =>
                    q.options.isNotEmpty &&
                    (selection == null ||
                        q.matchesSelection(
                          selection,
                          preferredSourceVariant: preferredSourceVariant,
                        )),
              )
              .toList();

          if (cloudQuestions.isNotEmpty) {
            resolved = cloudQuestions;
          }
        }
      } catch (_) {
        // Bulut sorgusu başarısız olursa yerel yedeğe devam et.
      }
    }

    // Yerel JSON fallback mekanizması
    if (resolved == null) {
      try {
        final localResult = await _loadLocalPoolForSelection(selection);
        var scopedPool = localResult.questions;

        if (difficulty != null && difficulty.isNotEmpty) {
          scopedPool = scopedPool
              .where((q) => q.difficulty == difficulty)
              .toList();
        }

        if (selection != null) {
          final matchedScope = scopedPool
              .where(
                (q) => q.matchesSelection(
                  selection,
                  preferredSourceVariant: preferredSourceVariant,
                ),
              )
              .toList();

          if (matchedScope.isNotEmpty) {
            scopedPool = matchedScope;
          } else if (!localResult.isDedicatedScopeAsset &&
              selection.family == KpssExamFamily.bGrubu &&
              (lesson == null || _sharedBGroupGkLessonNames.contains(lesson))) {
            // Ön Lisans / Ortaöğretim B Grubu GK için ortak GK çekirdek havuzu yedeği
            scopedPool = scopedPool
                .where(
                  (q) =>
                      _sharedBGroupGkLessonNames.contains(q.lesson) &&
                      q.examScopes.contains('lisans_gk'),
                )
                .toList();
          } else {
            scopedPool = const <Question>[];
          }
        }

        if (lesson != null && lesson.isNotEmpty) {
          final lessonQuestions = scopedPool
              .where((q) => q.lesson == lesson)
              .toList();

          if (topic != null && topic.isNotEmpty) {
            final topicQuestions = lessonQuestions
                .where((q) => q.topic == topic)
                .toList();
            if (topicQuestions.isNotEmpty || strictTopicFilter) {
              resolved = topicQuestions;
            }
          }

          if (resolved == null) {
            if (lessonQuestions.isNotEmpty) {
              resolved = lessonQuestions;
            } else {
              resolved = selection == null ? scopedPool : const <Question>[];
            }
          }
        } else {
          resolved = scopedPool;
        }
      } catch (_) {
        resolved = selection == null
            ? defaultSampleQuestions
            : const <Question>[];
      }
    }

    if (useCache) {
      _cachedQuestions.put(cacheKey, resolved);
    }
    return resolved;
  }

  /// Supabase `public.questions` tablosundan doğru/yanlış önermelerini çeker.
  /// Çevrimdışı veya hata durumunda yerel `sampleTrueFalseItems` havuzuna düşer.
  Future<List<TrueFalseItem>> fetchTrueFalseItems({
    String? lesson,
    bool forceRefresh = false,
  }) async {
    final cacheKey = lesson ?? 'all';
    if (!forceRefresh && _cachedTrueFalse.containsKey(cacheKey)) {
      final cached = _cachedTrueFalse[cacheKey]!;
      if (DateTime.now().difference(cached.$1) < cacheTtl &&
          cached.$2.isNotEmpty) {
        return cached.$2;
      }
    }

    List<TrueFalseItem>? result;
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        var query = client
            .from('questions')
            .select()
            .eq('question_type', 'true_false');

        if (lesson != null && lesson.isNotEmpty) {
          query = query.eq('lesson', lesson);
        }

        final List<dynamic> response = await query;
        if (response.isNotEmpty) {
          final cloudItems = response
              .map((row) {
                final interaction =
                    row['interaction_data'] is Map<String, dynamic>
                    ? row['interaction_data'] as Map<String, dynamic>
                    : <String, dynamic>{};
                return TrueFalseItem(
                  id: (row['id'] ?? '').toString(),
                  lesson: (row['lesson'] ?? 'Genel Kültür').toString(),
                  topic: (row['topic'] ?? 'Genel').toString(),
                  statement: (row['prompt_text'] ?? row['text'] ?? '')
                      .toString(),
                  isTrue: (interaction['isTrue'] as bool?) ?? true,
                  explanation: (row['explanation'] ?? '').toString(),
                );
              })
              .where((item) => item.statement.isNotEmpty)
              .toList();

          if (cloudItems.isNotEmpty) {
            final existingIds = cloudItems.map((e) => e.id).toSet();
            final merged = [
              ...cloudItems,
              ...sampleTrueFalseItems.where((e) => !existingIds.contains(e.id)),
            ];
            result = lesson != null && lesson.isNotEmpty
                ? merged.where((e) => e.lesson == lesson).toList()
                : merged;
          }
        }
      } catch (_) {
        // Çevrimdışı durumda yerel yedeğe devam et
      }
    }

    if (result == null) {
      if (lesson != null && lesson.isNotEmpty) {
        final filtered = sampleTrueFalseItems
            .where((e) => e.lesson == lesson)
            .toList();
        result = filtered.isNotEmpty ? filtered : sampleTrueFalseItems;
      } else {
        result = sampleTrueFalseItems;
      }
    }

    _cachedTrueFalse[cacheKey] = (DateTime.now(), result);
    return result;
  }

  /// Supabase `public.questions` tablosundan kavram eşleştirme setlerini çeker.
  /// Çevrimdışı veya hata durumunda yerel `sampleConceptMatchSets` havuzuna düşer.
  Future<List<ConceptMatchSet>> fetchConceptMatchSets({
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && _cachedConceptMatchSets != null) {
      final cached = _cachedConceptMatchSets!;
      if (DateTime.now().difference(cached.$1) < cacheTtl &&
          cached.$2.isNotEmpty) {
        return cached.$2;
      }
    }

    List<ConceptMatchSet>? result;
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        final List<dynamic> response = await client
            .from('questions')
            .select()
            .eq('question_type', 'matching');

        if (response.isNotEmpty) {
          final cloudSets = <ConceptMatchSet>[];
          for (final row in response) {
            final interaction = row['interaction_data'] is Map<String, dynamic>
                ? row['interaction_data'] as Map<String, dynamic>
                : <String, dynamic>{};
            final rawPairs = interaction['pairs'] as List?;
            if (rawPairs != null && rawPairs.isNotEmpty) {
              final pairs = rawPairs.map((p) {
                final pairMap = p as Map<String, dynamic>;
                return ConceptPair(
                  id: (pairMap['id'] ?? '').toString(),
                  leftTerm: (pairMap['leftTerm'] ?? '').toString(),
                  rightMatch: (pairMap['rightMatch'] ?? '').toString(),
                );
              }).toList();

              cloudSets.add(
                ConceptMatchSet(
                  id: (row['id'] ?? '').toString(),
                  title:
                      (row['prompt_text'] ??
                              row['topic'] ??
                              'Kavram Eşleştirme')
                          .toString(),
                  lesson: (row['lesson'] ?? 'Genel Kültür').toString(),
                  pairs: pairs,
                ),
              );
            }
          }

          if (cloudSets.isNotEmpty) {
            final seenTitles = cloudSets.map((s) => s.title).toSet();
            result = [
              ...cloudSets,
              ...sampleConceptMatchSets.where(
                (s) => !seenTitles.contains(s.title),
              ),
            ];
          }
        }
      } catch (_) {
        // Çevrimdışı durumda yerel yedeğe devam et
      }
    }

    result ??= sampleConceptMatchSets;
    _cachedConceptMatchSets = (DateTime.now(), result);
    return result;
  }

  /// Testler için bellek içi tüm önbellek havuzlarını sıfırlar.
  static void clearCacheForTest() {
    _cachedQuestions.clear();
    _cachedAssetPools.clear();
    _cachedTrueFalse.clear();
    _cachedConceptMatchSets = null;
  }

  /// Testlerde bounded LRU önbellek doluluk sınırını doğrulamak için kullanılır.
  @visibleForTesting
  static int get questionCacheEntryCountForTest => _cachedQuestions.length;

  /// Belirli kimlik dilimini (`<= 50` ID) Supabase `public.questions` tablosundan nokta atışı çeker.
  ///
  /// Testlerde alt sınıf override'ı ile chunk boyutlarını ve egress tasarrufunu doğrulamak
  /// için ayrılmıştır.
  @visibleForTesting
  Future<List<Question>> fetchQuestionBatchFromCloud(
    List<String> batchIds,
  ) async {
    final client = SupabaseConfig.clientOrNull;
    if (client == null || batchIds.isEmpty) return const <Question>[];
    final List<dynamic> response = await client
        .from('questions')
        .select()
        .inFilter('id', batchIds);
    return response
        .map((row) => Question.fromSupabase(row as Map<String, dynamic>))
        .where((q) => q.id.isNotEmpty && q.options.isNotEmpty)
        .toList();
  }

  /// Yanlış Defteri ve hedefli oturumlar için tüm havuzu çekmeden yalnızca verilen
  /// [ids] kimliklerine ait soruları en fazla 50'şer ID'lik chunk'lar halinde getirir.
  ///
  /// Bulutta bulunamayan veya çevrimdışı durumdaki ID'ler yerel JSON havuzundan tamamlanır.
  Future<List<Question>> fetchQuestionsByIds(List<String> ids) async {
    final uniqueIds = <String>[];
    final seen = <String>{};
    for (final rawId in ids) {
      final trimmed = rawId.trim();
      if (trimmed.isNotEmpty && seen.add(trimmed)) {
        uniqueIds.add(trimmed);
      }
    }
    if (uniqueIds.isEmpty) return const <Question>[];

    final resolvedById = <String, Question>{};
    for (var i = 0; i < uniqueIds.length; i += idBatchLimit) {
      final batch = uniqueIds.sublist(
        i,
        math.min(i + idBatchLimit, uniqueIds.length),
      );
      try {
        final fetchedBatch = await fetchQuestionBatchFromCloud(batch);
        for (final q in fetchedBatch) {
          resolvedById[q.id] = q;
        }
      } catch (_) {
        // Chunk sorgusu başarısız olursa kalan ID'ler yerel yedeğe devredilir.
      }
    }

    final missingIds = uniqueIds
        .where((id) => !resolvedById.containsKey(id))
        .toSet();
    if (missingIds.isNotEmpty) {
      List<Question> localPool;
      try {
        localPool = await loadSampleQuestions();
      } catch (_) {
        localPool = defaultSampleQuestions;
      }
      for (final q in localPool) {
        if (missingIds.contains(q.id)) {
          resolvedById[q.id] = q;
        }
      }
    }

    return [
      for (final id in uniqueIds)
        if (resolvedById.containsKey(id)) resolvedById[id]!,
    ];
  }

  /// Konu sorularını `orderIndex` ve zorluk sırasına göre deterministik sıralar.
  static List<Question> sortTopicQuestions(List<Question> fetched) {
    final sorted = List<Question>.from(fetched);
    sorted.sort((a, b) {
      final aOrder = a.orderIndex;
      final bOrder = b.orderIndex;
      if (aOrder != null && bOrder != null && aOrder > 0 && bOrder > 0) {
        return aOrder.compareTo(bOrder);
      }
      if (aOrder != null && aOrder > 0) return -1;
      if (bOrder != null && bOrder > 0) return 1;
      return a.difficultyLevel.compareTo(b.difficultyLevel);
    });
    return sorted;
  }

  /// Konu sorularını 10'ar soruluk sıralı seviye testlerine böler.
  static List<List<Question>> chunkTopicQuestions(
    List<Question> fetched, {
    int chunkSize = 10,
  }) {
    final sorted = sortTopicQuestions(fetched);
    final chunks = <List<Question>>[];
    for (var i = 0; i < sorted.length; i += chunkSize) {
      final end = (i + chunkSize > sorted.length)
          ? sorted.length
          : i + chunkSize;
      chunks.add(sorted.sublist(i, end));
    }
    return chunks;
  }

  /// Belirli bir derse ve opsiyonel sınav kapsamına ait soruları çekip her konudaki
  /// mevcut test sayısını (her test 10 soru olacak şekilde `(count / 10).ceil()`) hesaplar.
  Future<Map<String, int>> fetchTopicTestCounts(
    String lessonName, {
    ExamSelection? selection,
  }) async {
    try {
      // Bir derste (örn. Tarih: 620 soru, Coğrafya: 364 soru) 60'tan çok daha fazla
      // soru bulunduğu için varsayılan `limit: 60` yerine yüksek limit (`1000`) ile
      // tüm konuların gerçek test sayısını hesaplıyoruz.
      final questions = await fetchQuestions(
        lesson: lessonName,
        selection: selection,
        limit: 1000,
      );
      final counts = <String, int>{};
      for (final q in questions) {
        if (q.topic.isNotEmpty) {
          counts[q.topic] = (counts[q.topic] ?? 0) + 1;
        }
      }
      return counts.map((topic, count) => MapEntry(topic, (count / 10).ceil()));
    } catch (_) {
      return {};
    }
  }
}

ExamSelection _selectionFromScopeKey(
  String scopeKey,
  ExamSelection activeSelection,
) {
  if (activeSelection.scopeKey == scopeKey ||
      activeSelection.curriculumNamespace == scopeKey) {
    return activeSelection;
  }
  switch (scopeKey) {
    case 'lisans_gk':
      return ExamSelection.initial;
    case 'lisans_gygk':
      return const ExamSelection(bGroupProfile: BGroupProfile.fullGyGk);
    case 'onlisans_gk':
      return const ExamSelection(educationLevel: EducationLevel.onlisans);
    case 'onlisans_gygk':
      return const ExamSelection(
        educationLevel: EducationLevel.onlisans,
        bGroupProfile: BGroupProfile.fullGyGk,
      );
    case 'ortaogretim_gk':
      return const ExamSelection(educationLevel: EducationLevel.ortaogretim);
    case 'ortaogretim_gygk':
      return const ExamSelection(
        educationLevel: EducationLevel.ortaogretim,
        bGroupProfile: BGroupProfile.fullGyGk,
      );
    case 'dhbt_lisans':
      return const ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.lisans,
      );
    case 'dhbt_onlisans':
      return const ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.onlisans,
      );
    case 'dhbt_ortaogretim':
      return const ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.ortaogretim,
      );
    case 'ekpss_lisans':
      return const ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.lisans,
      );
    case 'ekpss_onlisans':
      return const ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.onlisans,
      );
    case 'ekpss_ortaogretim':
      return const ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.ortaogretim,
      );
    case 'meb_ags':
      return const ExamSelection(family: KpssExamFamily.mebAgs);
    case 'meb_ags_yds':
      return const ExamSelection(
        family: KpssExamFamily.mebAgs,
        oabtBranch: OabtBranch.ydsDil,
      );
    default:
      if (scopeKey.startsWith('meb_ags_oabt_')) {
        final branchKey = scopeKey.substring('meb_ags_oabt_'.length);
        return ExamSelection(
          family: KpssExamFamily.mebAgs,
          oabtBranch: OabtBranch.fromKey(branchKey),
        );
      }
      if (scopeKey.startsWith('a_grubu')) {
        return const ExamSelection(family: KpssExamFamily.aGrubu);
      }
      return ExamSelection.initial;
  }
}

/// [QuestionRepository] Riverpod sağlayıcısı.
final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return const QuestionRepository();
});

/// Belirli bir (kapsam + ders) çiftinin konularındaki test sayılarını (`Map<String, int>`)
/// kapsam bazlı izole şekilde sağlayan provider (`TopicCountQueryKey`).
final lessonTopicTestCountsProvider =
    FutureProvider.family<Map<String, int>, TopicCountQueryKey>((
      ref,
      queryKey,
    ) async {
      final repo = ref.watch(questionRepositoryProvider);
      final activeSelection = ref.watch(activeExamSelectionProvider);
      final selectionForQuery = _selectionFromScopeKey(
        queryKey.scopeKey,
        activeSelection,
      );
      return repo.fetchTopicTestCounts(
        queryKey.lessonName,
        selection: selectionForQuery,
      );
    });
