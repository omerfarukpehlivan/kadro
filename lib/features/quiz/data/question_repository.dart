import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Soru verilerini yerel JSON dosyasından veya Supabase bulut veritabanından (`public.questions`)
/// okuyan veri erişim katmanı.
///
/// Web/Angular Karşılığı: `QuestionService` / Repository.
/// UI bileşenleri verinin nereden geldiğini (Supabase veya JSON) bilmez; sadece bu katmanı çağırır.
class QuestionRepository {
  final String assetPath;

  /// Bellek içi (In-Memory) TTL önbellek deposu (TASK-92).
  /// Ağ isteklerini ve Supabase çıkış bant genişliğini (egress) en aza indirir.
  static final Map<String, (DateTime, List<Question>)> _cachedQuestions = {};
  static final Map<String, (DateTime, List<TrueFalseItem>)> _cachedTrueFalse =
      {};
  static (DateTime, List<ConceptMatchSet>)? _cachedConceptMatchSets;

  /// Önbellek geçerlilik süresi (varsayılan: 2 saat).
  static const Duration cacheTtl = Duration(hours: 2);

  const QuestionRepository({
    this.assetPath = 'assets/data/questions/sample_questions.json',
  });

  /// Tüm soruları yerel JSON dosyasından yükler.
  Future<List<Question>> loadAllQuestions() async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final dynamic decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'Beklenen JSON formatı dizi (Array) olmalı.',
        );
      }

      return decoded
          .map((item) => Question.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Sorular yüklenemedi: $e');
    }
  }

  /// `loadAllQuestions` için alias (geriye dönük uyumluluk).
  Future<List<Question>> loadSampleQuestions() => loadAllQuestions();

  /// Havuzdaki tüm soruları (varsa Supabase, yoksa yerel JSON) yükler.
  Future<List<Question>> fetchAllFromPool() => fetchQuestions();

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

  /// Belirli bir derse (`lessonName`) ait soruları yerel dosyadan filtreleyerek döner.
  Future<List<Question>> getQuestionsByLesson(String lessonName) async {
    final allQuestions = await loadAllQuestions();
    return allQuestions
        .where((question) => question.lesson == lessonName)
        .toList();
  }

  /// Supabase `public.questions` tablosundan ders ve konu bazında soruları çeker.
  /// Bulut bağlantısı yoksa veya hata alınırsa güvenli şekilde yerel JSON yedeğine düşer (Offline Fallback).
  ///
  /// Performans & Maliyet: [cacheTtl] süresi boyunca veriyi bellekten (0ms gecikme) döner.
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
    bool forceRefresh = false,
    int limit = 60,
  }) async {
    final cacheKey = '${lesson ?? 'all'}:${topic ?? 'all'}:$limit';
    if (!forceRefresh && _cachedQuestions.containsKey(cacheKey)) {
      final cached = _cachedQuestions[cacheKey]!;
      if (DateTime.now().difference(cached.$1) < cacheTtl &&
          cached.$2.isNotEmpty) {
        return cached.$2;
      }
    }

    List<Question>? resolved;
    final client = SupabaseConfig.clientOrNull;
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

        // Deterministik ve sabit sıralama: Önce order_index'e göre artan,
        // Anti-Scraping: Tek seferde en fazla [limit] (varsayılan: 60) soru çekilebilir.
        final List<dynamic> response = await filterQuery
            .order('order_index', ascending: true, nullsFirst: false)
            .limit(limit);
        if (response.isNotEmpty) {
          final cloudQuestions = response
              .map((row) => Question.fromSupabase(row as Map<String, dynamic>))
              .where((q) => q.options.isNotEmpty)
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
        final localQuestions = await loadSampleQuestions();
        if (lesson != null && lesson.isNotEmpty) {
          final lessonQuestions = localQuestions
              .where((q) => q.lesson == lesson)
              .toList();

          if (topic != null && topic.isNotEmpty) {
            final topicQuestions = lessonQuestions
                .where((q) => q.topic == topic)
                .toList();
            if (topicQuestions.isNotEmpty) {
              resolved = topicQuestions;
            }
          }

          resolved ??= (lessonQuestions.isNotEmpty
              ? lessonQuestions
              : localQuestions);
        } else {
          resolved = localQuestions;
        }
      } catch (_) {
        resolved = defaultSampleQuestions;
      }
    }

    _cachedQuestions[cacheKey] = (DateTime.now(), resolved);
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

  /// Testler için bellek içi önbelleği sıfırlar.
  static void clearCacheForTest() {
    _cachedQuestions.clear();
    _cachedTrueFalse.clear();
    _cachedConceptMatchSets = null;
  }

  /// Belirli bir derse ait soruları çekip her konudaki mevcut test sayısını
  /// (her test 10 soru olacak şekilde `(count / 10).ceil()`) hesaplar.
  Future<Map<String, int>> fetchTopicTestCounts(String lessonName) async {
    try {
      final questions = await fetchQuestions(lesson: lessonName);
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

/// [QuestionRepository] Riverpod sağlayıcısı.
final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return const QuestionRepository();
});

/// Belirli bir dersin konularındaki test sayılarını (`Map<String, int>`) asenkron sağlayan provider.
final lessonTopicTestCountsProvider =
    FutureProvider.family<Map<String, int>, String>((ref, lessonName) async {
      final repo = ref.watch(questionRepositoryProvider);
      return repo.fetchTopicTestCounts(lessonName);
    });
