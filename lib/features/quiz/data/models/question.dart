import 'dart:ui';

import 'package:kadro/core/utils/figure_svg.dart';
import 'package:kadro/core/utils/math_text.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/shared/widgets/climate_chart/climate_chart_models.dart';
import 'package:kadro/shared/widgets/geo_diagram/geo_diagram_models.dart';
import 'package:kadro/shared/widgets/population_pyramid/population_pyramid_models.dart';
import 'package:kadro/shared/widgets/sun_diagram/sun_diagram_models.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map_models.dart';

/// KPSS çalışma uygulamasındaki tek bir soruyu temsil eden model.
///
/// Angular/TypeScript'teki `interface Question { ... }` veya DTO sınıfının
/// Dart karşılığıdır.
class Question {
  final String id;
  final String lesson;
  final String topic;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String difficulty;

  /// UWorld modeline uygun olarak sorudaki en güçlü çeldiriciyi
  /// ve adayın neden bu şıkka düşebileceğini deşifre eden açıklama.
  final String? distractorTrap;

  /// Coğrafya ve diğer derslerdeki harita, tablo, grafik veya şekil görseli URL'si.
  /// Boş veya null ise soru yalnızca metin olarak render edilir.
  final String? imageUrl;

  /// TASK-172: Matematik/geometri sorularının şekli (güvenli, `currentColor`
  /// kullanan SVG; Supabase `figure_svg`). Elle yazılmaz, JSON tariften
  /// `tools/math/compile_questions.mjs` üretir. `QuestionFigureCard` gösterir.
  final String? figureSvg;

  /// Soruda yer alan dinamik ve interaktif Türkiye vektör haritası konfigürasyonu.
  /// (İl/bölge boyama, Romen rakamlı marker'lar, koordinat işaretleyicileri).
  final TurkeyMapConfig? mapConfig;

  /// Soruda yer alan iklim grafiği (Yağış-Sıcaklık Hythergraph) konfigürasyonu.
  final ClimateChartConfig? climateConfig;

  /// Soruda yer alan jeomorfoloji ve yer şekilleri kesit diyagramı konfigürasyonu.
  final GeoDiagramConfig? geoConfig;

  /// Soruda yer alan nüfus piramidi (Demografik yaş ve cinsiyet) konfigürasyonu.
  final PopulationPyramidConfig? pyramidConfig;

  /// Soruda yer alan Güneş açısı, ekinoks ve gölge şeması konfigürasyonu.
  final SunDiagramConfig? sunConfig;

  /// Sorunun test ve konu içindeki sabit sıra numarası (1..60).
  /// Veritabanındaki `order_index` alanı ile eşlenir ve test paketlerinin
  /// kaymayan, deterministik sırada oluşmasını sağlar.
  final int? orderIndex;

  /// Sorunun ait olduğu KPSS / MEB-AGS sınav kapsamları (PostgreSQL `exam_scopes`).
  /// Varsayılan `['lisans_gk']` mevcut Lisans Genel Kültür çekirdek havuzuyla uyumludur.
  final List<String> examScopes;

  /// Alt branş veya oturum ayrıştırıcısı (`'oabt_tarih'`, `'dhbt_lisans'`, vb.).
  final String? subBranch;

  /// Hedeflenen öğrenim düzeyi (`'lisans'`, `'onlisans'`, `'ortaogretim'`).
  final String? educationLevel;

  /// E-KPSS kitapçık uyarlama grubu (`'genel'`, `'gorme'`, `'isitme1'`, `'zihinsel'`).
  final String? disabilityVariant;

  /// E-KPSS İşitme-1 vb. kaynak metin varyantı (`'standard'`, `'simplified'`).
  final String? sourceVariant;

  const Question({
    required this.id,
    required this.lesson,
    required this.topic,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.difficulty = 'medium',
    this.distractorTrap,
    this.imageUrl,
    this.figureSvg,
    this.mapConfig,
    this.climateConfig,
    this.geoConfig,
    this.pyramidConfig,
    this.sunConfig,
    this.orderIndex,
    this.examScopes = const ['lisans_gk'],
    this.subBranch,
    this.educationLevel,
    this.disabilityVariant,
    this.sourceVariant,
  });

  /// Kullanıcının seçtiği şıkkın doğru olup olmadığını kontrol eden yardımcı metot.
  bool isCorrect(int? selectedIndex) => selectedIndex == correctIndex;

  /// Kullanıcının seçtiği [selection] sınav profiline bu sorunun kapsam,
  /// öğrenim düzeyi, alt branş, engel grubu ve metin varyantı açısından uyup
  /// uymadığını kontrol eden saf alan metodu.
  bool matchesSelection(
    ExamSelection selection, {
    String? preferredSourceVariant,
  }) {
    final normalizedScopes = examScopes
        .map((s) => s.trim().toLowerCase())
        .where((s) => s.isNotEmpty)
        .toSet();
    final effectiveScopes = normalizedScopes.isEmpty
        ? const {'lisans_gk'}
        : normalizedScopes;

    final acceptedScopes = <String>{
      ...selection.acceptedQuestionScopes,
      if (selection.family == KpssExamFamily.mebAgs &&
          selection.oabtBranch != OabtBranch.none &&
          (subBranch == null || subBranch!.trim().isEmpty))
        'meb_ags',
    };

    if (effectiveScopes.intersection(acceptedScopes).isEmpty) {
      return false;
    }

    final normalizedEdu = _normalizeOptionalTag(educationLevel);
    if (normalizedEdu != null &&
        normalizedEdu != selection.educationLevel.key) {
      return false;
    }

    final normalizedSubBranch = _normalizeOptionalTag(subBranch);
    if (normalizedSubBranch != null &&
        !_matchesSubBranch(normalizedSubBranch, selection)) {
      return false;
    }

    final normalizedDisability = _normalizeOptionalTag(disabilityVariant);
    if (normalizedDisability != null) {
      if (selection.family != KpssExamFamily.ekpss) {
        return false;
      }
      if (normalizedDisability != selection.disabilityGroup.key.toLowerCase()) {
        return false;
      }
    }

    final normalizedSource = _normalizeOptionalTag(sourceVariant);
    final normalizedPreferred = _normalizeOptionalTag(preferredSourceVariant);
    if (normalizedPreferred != null) {
      if (normalizedSource != null && normalizedSource != normalizedPreferred) {
        return false;
      }
    } else if (normalizedSource == 'simplified') {
      final isHearingAdapted =
          selection.family == KpssExamFamily.ekpss &&
          selection.disabilityGroup == DisabilityGroup.isitme1;
      if (!isHearingAdapted) {
        return false;
      }
    }

    return true;
  }

  static bool _matchesSubBranch(
    String normalizedSubBranch,
    ExamSelection selection,
  ) {
    switch (selection.family) {
      case KpssExamFamily.mebAgs:
        if (selection.oabtBranch == OabtBranch.none) {
          return normalizedSubBranch == 'meb_ags';
        }
        if (selection.oabtBranch == OabtBranch.ydsDil) {
          return normalizedSubBranch == 'yds' ||
              normalizedSubBranch == 'meb_ags_yds' ||
              normalizedSubBranch == 'meb_ags';
        }
        return normalizedSubBranch == 'oabt_${selection.oabtBranch.key}' ||
            normalizedSubBranch == 'meb_ags_oabt_${selection.oabtBranch.key}' ||
            normalizedSubBranch == 'meb_ags';
      case KpssExamFamily.dhbt:
        return normalizedSubBranch == 'dhbt_${selection.educationLevel.key}' ||
            normalizedSubBranch == 'dhbt_1' ||
            normalizedSubBranch == 'dhbt_common' ||
            normalizedSubBranch == selection.scopeKey;
      case KpssExamFamily.aGrubu:
        final chosenFields = selection.selectedFieldLessons.isEmpty
            ? ExamSelection.defaultAGroupP48Lessons
            : selection.selectedFieldLessons;
        final acceptedFieldSlugs = chosenFields
            .map((name) {
              final slug = _asciiTagSlug(name);
              return slug.startsWith('alan_') ? slug.substring(5) : slug;
            })
            .where((s) => s.isNotEmpty)
            .expand((slug) => {'a_grubu_$slug', 'alan_$slug', slug})
            .toSet();
        return normalizedSubBranch == selection.scopeKey ||
            normalizedSubBranch == 'a_grubu_p48' ||
            acceptedFieldSlugs.contains(normalizedSubBranch);
      case KpssExamFamily.bGrubu:
      case KpssExamFamily.ekpss:
        return normalizedSubBranch == selection.scopeKey ||
            normalizedSubBranch == selection.curriculumNamespace;
    }
  }

  static String _asciiTagSlug(String raw) {
    return raw
        .trim()
        .toLowerCase()
        .replaceAll('ç', 'c')
        .replaceAll('ğ', 'g')
        .replaceAll('ı', 'i')
        .replaceAll('ö', 'o')
        .replaceAll('ş', 's')
        .replaceAll('ü', 'u')
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');
  }

  static String? _normalizeOptionalTag(dynamic raw) {
    if (raw == null) return null;
    final trimmed = raw.toString().trim();
    if (trimmed.isEmpty || trimmed == 'null') return null;
    return trimmed.toLowerCase();
  }

  /// Boş/`'null'` değerleri ve güvenlik denetiminden geçmeyen SVG'leri eler.
  static String? _normalizeFigureSvg(String? raw) {
    if (raw == null) return null;
    final trimmed = raw.trim();
    if (trimmed.isEmpty || trimmed == 'null') return null;
    return isSafeFigureSvg(trimmed) ? trimmed : null;
  }

  static List<String> _parseExamScopes(dynamic raw) {
    if (raw is List) {
      final parsed = raw
          .map((e) => e?.toString().trim() ?? '')
          .where((s) => s.isNotEmpty)
          .toList(growable: false);
      if (parsed.isNotEmpty) return List<String>.unmodifiable(parsed);
    } else if (raw is String && raw.trim().isNotEmpty) {
      return List<String>.unmodifiable([raw.trim()]);
    }
    return const ['lisans_gk'];
  }

  /// Sayısal zorluk seviyesi (1: Kolay, 2: Orta, 3: Zor).
  int get difficultyLevel {
    if (difficulty == '1' || difficulty == 'easy') return 1;
    if (difficulty == '3' || difficulty == 'hard') return 3;
    return 2;
  }

  /// Nesnenin belirli alanlarını güncelleyerek kopyasını üreten yardımcı metot.
  Question copyWith({
    String? id,
    String? lesson,
    String? topic,
    String? text,
    List<String>? options,
    int? correctIndex,
    String? explanation,
    String? difficulty,
    String? distractorTrap,
    String? imageUrl,
    String? figureSvg,
    TurkeyMapConfig? mapConfig,
    ClimateChartConfig? climateConfig,
    GeoDiagramConfig? geoConfig,
    PopulationPyramidConfig? pyramidConfig,
    SunDiagramConfig? sunConfig,
    int? orderIndex,
    List<String>? examScopes,
    String? subBranch,
    String? educationLevel,
    String? disabilityVariant,
    String? sourceVariant,
  }) {
    return Question(
      id: id ?? this.id,
      lesson: lesson ?? this.lesson,
      topic: topic ?? this.topic,
      text: text ?? this.text,
      options: options ?? this.options,
      correctIndex: correctIndex ?? this.correctIndex,
      explanation: explanation ?? this.explanation,
      difficulty: difficulty ?? this.difficulty,
      distractorTrap: distractorTrap ?? this.distractorTrap,
      imageUrl: imageUrl ?? this.imageUrl,
      figureSvg: figureSvg ?? this.figureSvg,
      mapConfig: mapConfig ?? this.mapConfig,
      climateConfig: climateConfig ?? this.climateConfig,
      geoConfig: geoConfig ?? this.geoConfig,
      pyramidConfig: pyramidConfig ?? this.pyramidConfig,
      sunConfig: sunConfig ?? this.sunConfig,
      orderIndex: orderIndex ?? this.orderIndex,
      examScopes: examScopes ?? this.examScopes,
      subBranch: subBranch ?? this.subBranch,
      educationLevel: educationLevel ?? this.educationLevel,
      disabilityVariant: disabilityVariant ?? this.disabilityVariant,
      sourceVariant: sourceVariant ?? this.sourceVariant,
    );
  }

  /// Aktif nüfus piramidi konfigürasyonunu döner.
  /// Doğrudan pyramidConfig tanımlıysa onu, yoksa imageUrl içindeki 'pyramid://'
  /// URI şemasını ayrıştırarak üretilen piramidi döner.
  PopulationPyramidConfig? get effectivePyramidConfig {
    if (pyramidConfig != null) return pyramidConfig;
    if (imageUrl != null && imageUrl!.startsWith('pyramid:')) {
      return parsePyramidUri(imageUrl!);
    }
    return null;
  }

  /// 'pyramid://...' URI şemasını PopulationPyramidConfig nesnesine dönüştüren parser
  static PopulationPyramidConfig? parsePyramidUri(String uriString) {
    try {
      if (!uriString.startsWith('pyramid:')) return null;
      final uri = Uri.parse(uriString);
      final path = uri.path.toLowerCase();
      final host = uri.host.toLowerCase();

      if (path.contains('turkey') ||
          host.contains('turkey') ||
          path.contains('nufus') ||
          host.contains('nufus') ||
          uriString.startsWith('pyramid://')) {
        return PopulationPresets.turkeyCurrent;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Aktif Güneş açısı ve mevsim şeması konfigürasyonunu döner.
  /// Doğrudan sunConfig tanımlıysa onu, yoksa imageUrl içindeki 'sun://'
  /// URI şemasını ayrıştırarak üretilen şemayı döner.
  SunDiagramConfig? get effectiveSunConfig {
    if (sunConfig != null) return sunConfig;
    if (imageUrl != null && imageUrl!.startsWith('sun:')) {
      return parseSunUri(imageUrl!);
    }
    return null;
  }

  /// 'sun://...' URI şemasını SunDiagramConfig nesnesine dönüştüren parser
  static SunDiagramConfig? parseSunUri(String uriString) {
    try {
      final uri = Uri.parse(uriString);
      final path = uri.path.toLowerCase();
      final host = uri.host.toLowerCase();

      if (path.contains('haziran') ||
          host.contains('haziran') ||
          path.contains('21_06')) {
        return SunPresets.haziran21;
      }
      if (path.contains('aralik') ||
          host.contains('aralik') ||
          path.contains('21_12')) {
        return SunPresets.aralik21;
      }
      if (path.contains('ekinoks') ||
          host.contains('ekinoks') ||
          path.contains('mart') ||
          path.contains('eylul')) {
        return SunPresets.ekinoks;
      }
      if (path.contains('golge') ||
          host.contains('golge') ||
          path.contains('donence')) {
        return SunPresets.golgeYonu;
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  /// Aktif jeomorfoloji kesit konfigürasyonunu döner.
  /// Doğrudan geoConfig tanımlıysa onu, yoksa imageUrl içindeki 'geo://'
  /// URI şemasını ayrıştırarak üretilen şemayı döner.
  GeoDiagramConfig? get effectiveGeoConfig {
    if (geoConfig != null) return geoConfig;
    if (imageUrl != null && imageUrl!.startsWith('geo:')) {
      return parseGeoUri(imageUrl!);
    }
    return null;
  }

  /// 'geo://...' URI şemasını GeoDiagramConfig nesnesine dönüştüren parser
  static GeoDiagramConfig? parseGeoUri(String uriString) {
    try {
      final uri = Uri.parse(uriString);
      final path = uri.path.toLowerCase();
      final host = uri.host.toLowerCase();

      if (path.contains('horst') ||
          host.contains('horst') ||
          path.contains('graben')) {
        return GeoPresets.horstGraben;
      }
      if (path.contains('antiklinal') ||
          host.contains('antiklinal') ||
          path.contains('senklinal') ||
          path.contains('kivrim')) {
        return GeoPresets.antiklinalSenklinal;
      }
      if (path.contains('vadi') ||
          host.contains('vadi') ||
          path.contains('kanyon') ||
          path.contains('centik')) {
        return GeoPresets.vadiTipleri;
      }
      if (path.contains('karstik') ||
          host.contains('karstik') ||
          path.contains('obruk') ||
          path.contains('magara')) {
        return GeoPresets.karstikKesit;
      }
      if (path.contains('tombolo') ||
          host.contains('tombolo') ||
          path.contains('lagun') ||
          path.contains('sapli_ada')) {
        return GeoPresets.tombolo;
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  /// Aktif iklim grafiği konfigürasyonunu döner.
  /// Doğrudan climateConfig tanımlıysa onu, yoksa imageUrl içindeki 'climate://'
  /// URI şemasını ayrıştırarak üretilen iklim grafiğini döner.
  ClimateChartConfig? get effectiveClimateConfig {
    if (climateConfig != null) return climateConfig;
    if (imageUrl != null && imageUrl!.startsWith('climate:')) {
      return parseClimateUri(imageUrl!);
    }
    return null;
  }

  /// 'climate://...' URI şemasını ClimateChartConfig nesnesine dönüştüren parser
  static ClimateChartConfig? parseClimateUri(String uriString) {
    try {
      final uri = Uri.parse(uriString);
      final path = uri.path.toLowerCase();
      final host = uri.host.toLowerCase();

      if (path.contains('akdeniz') ||
          host.contains('akdeniz') ||
          path.contains('antalya')) {
        return ClimatePresets.akdeniz;
      }
      if (path.contains('karadeniz') ||
          host.contains('karadeniz') ||
          path.contains('rize')) {
        return ClimatePresets.karadeniz;
      }
      if (path.contains('sert_karasal') ||
          host.contains('sert_karasal') ||
          path.contains('erzurum') ||
          path.contains('kars')) {
        return ClimatePresets.sertKarasal;
      }
      if (path.contains('karasal') ||
          host.contains('karasal') ||
          path.contains('konya') ||
          path.contains('step') ||
          path.contains('ankara')) {
        return ClimatePresets.karasal;
      }
      if (path.contains('guneydogu') ||
          host.contains('guneydogu') ||
          path.contains('urfa') ||
          path.contains('sanliurfa')) {
        return ClimatePresets.guneydogu;
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  /// Aktif harita konfigürasyonunu döner.
  /// Doğrudan mapConfig tanımlıysa onu, yoksa imageUrl içindeki 'map://'
  /// URI şemasını ayrıştırarak üretilen haritayı döner.
  TurkeyMapConfig? get effectiveMapConfig {
    if (mapConfig != null) return mapConfig;
    if (imageUrl != null && imageUrl!.startsWith('map:')) {
      return parseMapUri(imageUrl!);
    }
    return null;
  }

  /// 'map://turkey/...' URI şemasını TurkeyMapConfig nesnesine dönüştüren parser
  static TurkeyMapConfig? parseMapUri(String uriString) {
    try {
      final uri = Uri.parse(uriString);
      final path = uri.path.toLowerCase();
      final host = uri.host.toLowerCase();

      // 0. Türkiye Matematiksel Konumu ve Uç Noktalar (Sinop, Hatay, Çanakkale, Iğdır)
      if (path.contains('koordinat') || host.contains('koordinat')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'sinop': Color(0xFFD97706),
            'hatay': Color(0xFFD97706),
            'canakkale': Color(0xFFD97706),
            'igdir': Color(0xFFD97706),
          },
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(490.0, 30.0),
            ), // Sinop (En Kuzey)
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(540.0, 395.0),
            ), // Hatay (En Güney)
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(55.0, 130.0),
            ), // Çanakkale (En Batı)
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(965.0, 160.0),
            ), // Iğdır (En Doğu)
          ],
        );
      }

      // 1. Yerel Saat ve Boylam Farkları
      if (path.contains('yerel_saat') || host.contains('yerel_saat')) {
        return const TurkeyMapConfig(
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(55.0, 130.0),
            ), // Çanakkale (26° D)
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(360.0, 160.0),
            ), // Ankara (33° D)
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(590.0, 170.0),
            ), // Sivas (37° D)
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(800.0, 135.0),
            ), // Erzurum (41° D)
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(965.0, 160.0),
            ), // Iğdır (45° D - +3 Saat)
          ],
        );
      }

      // 2. Taş Kömürü Madeni ve Batı Karadeniz Haritası (ÖSYM Klasik Soru Tipi)
      if (path.contains('tas_komuru') ||
          path.contains('komur') ||
          host.contains('tas_komuru')) {
        return const TurkeyMapConfig(
          markers: [
            TurkeyMapMarker(
              id: '0',
              label: 'I',
              offset: Offset(358.1, 36.1),
            ), // Batı Karadeniz / Zonguldak
            TurkeyMapMarker(
              id: '1',
              label: 'II',
              offset: Offset(525.4, 232.2),
            ), // İç Anadolu / Nevşehir-Niğde
            TurkeyMapMarker(
              id: '2',
              label: 'III',
              offset: Offset(719.4, 225.9),
            ), // Doğu Anadolu / Elazığ-Malatya
            TurkeyMapMarker(
              id: '3',
              label: 'IV',
              offset: Offset(63.1, 143.8),
            ), // Marmara / Çanakkale
            TurkeyMapMarker(
              id: '4',
              label: 'V',
              offset: Offset(102.1, 162.4),
            ), // Balıkesir
          ],
        );
      }

      // 3. Karstik Araziler (Teke & Taşeli Platoları)
      if (path.contains('karstik') || host.contains('karstik')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'antalya': Color(0xFFD97706),
            'mersin': Color(0xFFD97706),
            'burdur': Color(0xFFF59E0B),
            'mugla': Color(0xFFF59E0B),
          },
          markers: [
            TurkeyMapMarker(id: '1', label: 'I', offset: Offset(215.0, 360.0)),
            TurkeyMapMarker(id: '2', label: 'II', offset: Offset(335.0, 370.0)),
          ],
        );
      }

      // 4. Kıyı Tipleri Dağılışı (Dalmaçya, Enine, Boyuna, Ria)
      if (path.contains('kiyi_tipleri') || host.contains('kiyi_tipleri')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {'antalya': Color(0xFFD97706)},
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(500.0, 30.0),
            ), // Karadeniz / Boyuna Kıyı
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(60.0, 105.0),
            ), // Çanakkale Boğazı / Ria Kıyı
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(70.0, 240.0),
            ), // Ege / Enine Kıyı
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(225.0, 395.0),
            ), // Kaş-Finike / Dalmaçya Kıyı
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(505.0, 365.0),
            ), // Çukurova / Limanlı-Delta Kıyı
          ],
        );
      }

      // 5. Türkiye'nin Seyrek ve Yoğun Nüfuslu Alanları
      if (path.contains('seyrek_nufus') || host.contains('seyrek_nufus')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'kirklareli': Color(0xFFEF4444),
            'canakkale': Color(0xFFEF4444),
            'mugla': Color(0xFFEF4444),
            'hakkari': Color(0xFFEF4444),
            'istanbul': Color(0xFF10B981),
          },
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(120.0, 40.0),
            ), // Yıldız Dağları
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(65.0, 140.0),
            ), // Biga Yarımadası
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(120.0, 330.0),
            ), // Menteşe Yöresi
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(955.0, 320.0),
            ), // Hakkari Bölümü
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(185.0, 65.0),
            ), // Çatalca-Kocaeli (Yoğun Nüfus)
          ],
        );
      }

      // 6. Net Göç Alan ve Veren Merkezler
      if (path.contains('goc_alan_merkezler') || host.contains('goc')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'bursa': Color(0xFF10B981),
            'izmir': Color(0xFF10B981),
            'antalya': Color(0xFF10B981),
            'gaziantep': Color(0xFF10B981),
            'bayburt': Color(0xFFEF4444),
          },
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(165.0, 140.0),
            ), // Bursa
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(70.0, 240.0),
            ), // İzmir
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(250.0, 355.0),
            ), // Antalya
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(630.0, 345.0),
            ), // Gaziantep
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(720.0, 115.0),
            ), // Bayburt
          ],
        );
      }

      // 7. Başlıca İhraç Tarım Ürünleri Yetişme Alanları
      if (path.contains('tarim_urunleri') || host.contains('tarim')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {'aydin': Color(0xFFD97706)},
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(110.0, 295.0),
            ), // Aydın / Ege (İncir & Zeytin)
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(610.0, 80.0),
            ), // Ordu-Giresun (Fındık)
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(765.0, 65.0),
            ), // Rize (Çay)
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(700.0, 345.0),
            ), // Şanlıurfa (Pamuk)
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(400.0, 280.0),
            ), // Konya (Tahıl & Şekerpancarı)
          ],
        );
      }

      // 8. Hayvancılık Türleri ve Meralar
      if (path.contains('hayvancilik') || host.contains('hayvancilik')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'erzurum': Color(0xFFD97706),
            'kars': Color(0xFFD97706),
          },
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(855.0, 110.0),
            ), // Erzurum-Kars (Büyükbaş Mera)
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(275.0, 365.0),
            ), // Teke-Taşeli (Kıl Keçisi)
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(390.0, 275.0),
            ), // Konya (Küçükbaş Koyun)
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(360.0, 160.0),
            ), // Ankara (Tiftik Keçisi)
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(790.0, 60.0),
            ), // Rize Yaylaları (Arıcılık)
          ],
        );
      }

      // 9. Bor Mineralleri Havzası (Dünya Rezervinin %72'si)
      if (path.contains('bor_mineralleri') || host.contains('bor')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'balikesir': Color(0xFFD97706),
            'bursa': Color(0xFFD97706),
            'kutahya': Color(0xFFD97706),
            'eskisehir': Color(0xFFD97706),
          },
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(125.0, 120.0),
            ), // Balıkesir / Bandırma
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(190.0, 210.0),
            ), // Kütahya / Emet
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(260.0, 195.0),
            ), // Eskişehir / Kırka
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(660.0, 190.0),
            ), // Sivas / Divriği (Demir)
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(735.0, 235.0),
            ), // Elazığ / Guleman (Krom)
          ],
        );
      }

      // 10. Hinterlandı Geniş / Dar Limanlar ve Ulaşım
      if (path.contains('limanlar_ulasim') || host.contains('liman')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {'sinop': Color(0xFFD97706)},
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(505.0, 28.0),
            ), // Sinop Limanı (Hinterlandı Dar)
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(560.0, 60.0),
            ), // Samsun Limanı (Gelişmiş)
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(65.0, 235.0),
            ), // İzmir Limanı
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(495.0, 345.0),
            ), // Mersin Limanı
            TurkeyMapMarker(
              id: '5',
              label: 'V',
              offset: Offset(720.0, 68.0),
            ), // Trabzon Limanı
          ],
        );
      }

      // 11. Demir-Çelik Ağır Sanayi Merkezleri
      if (path.contains('demir_celik') || host.contains('sanayi')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'karabuk': Color(0xFFD97706),
            'zonguldak': Color(0xFFD97706),
            'hatay': Color(0xFFD97706),
          },
          markers: [
            TurkeyMapMarker(
              id: '1',
              label: 'I',
              offset: Offset(345.0, 55.0),
            ), // Karabük & Ereğli (Enerjiye Yakınlık)
            TurkeyMapMarker(
              id: '2',
              label: 'II',
              offset: Offset(535.0, 375.0),
            ), // İskenderun (Ulaşım & Liman)
            TurkeyMapMarker(
              id: '3',
              label: 'III',
              offset: Offset(660.0, 190.0),
            ), // Sivas / Divriği (Hammadde)
            TurkeyMapMarker(
              id: '4',
              label: 'IV',
              offset: Offset(410.0, 155.0),
            ), // Kırıkkale (Savunma Güvenliği)
          ],
        );
      }

      // 12. Volkanik Araziler ve Dağlar
      if (path.contains('volkanik') || host.contains('volkanik')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'nevsehir': Color(0xFFDC2626),
            'kayseri': Color(0xFFDC2626),
            'nigde': Color(0xFFDC2626),
            'aksaray': Color(0xFFDC2626),
            'agri': Color(0xFFDC2626),
            'van': Color(0xFFDC2626),
            'bitlis': Color(0xFFDC2626),
          },
        );
      }

      // 4. Genel Query Parametreleri: map://turkey?provinces=zonguldak,karabuk&markers=I:358.1,36.1;II:525.4,232.2
      final provParam =
          uri.queryParameters['provinces'] ?? uri.queryParameters['highlight'];
      final markerParam = uri.queryParameters['markers'];

      final highlighted = <String, Color>{};
      if (provParam != null && provParam.isNotEmpty) {
        for (final p in provParam.split(',')) {
          final cleanP = p.trim().toLowerCase();
          if (cleanP.isNotEmpty) {
            highlighted[cleanP] = const Color(0xFFD97706);
          }
        }
      }

      final parsedMarkers = <TurkeyMapMarker>[];
      if (markerParam != null && markerParam.isNotEmpty) {
        final items = markerParam.split(';');
        for (final item in items) {
          final parts = item.split(':');
          if (parts.length == 2) {
            final label = parts[0].trim();
            final coords = parts[1].split(',');
            if (coords.length == 2) {
              final x = double.tryParse(coords[0].trim()) ?? 0.0;
              final y = double.tryParse(coords[1].trim()) ?? 0.0;
              parsedMarkers.add(
                TurkeyMapMarker(id: label, label: label, offset: Offset(x, y)),
              );
            }
          }
        }
      }

      return TurkeyMapConfig(
        highlightedProvinces: highlighted,
        markers: parsedMarkers,
      );
    } catch (_) {
      return null;
    }
  }

  /// JSON (`Map<String, dynamic>`) verisinden Question nesnesi üreten factory constructor.
  /// Angular'daki `Object.assign(new Question(), json)` veya mapper fonksiyonu gibi düşünebilirsin.
  /// Soru metinlerindeki LaTeX ($\rightarrow$, arrow), Markdown (**...**) ve
  /// gereksiz tırnak/boşluk kalıntılarını temizleyen sağlam sanitizer metodu.
  ///
  /// TASK-172'den itibaren matematik parçaları (`$...$`, `$$...$$`) korunur ve
  /// ekranda `MathText` ile render edilir; temizlik yalnızca yazı parçalarına
  /// uygulanır. Kurallar: `docs/parity_fixtures/math_text.json`.
  static String cleanText(String raw) => cleanQuestionText(raw);

  factory Question.fromJson(Map<String, dynamic> json) {
    final rawText = json['text'] as String? ?? '';
    final rawExplanation = json['explanation'] as String? ?? '';
    final rawTrap =
        json['distractor_trap'] as String? ?? json['distractorTrap'] as String?;
    final rawOptions = List<String>.from(json['options'] as List? ?? const []);
    final rawImage =
        json['image_url'] as String? ?? json['imageUrl'] as String?;
    final rawFigure =
        json['figure_svg'] as String? ?? json['figureSvg'] as String?;

    TurkeyMapConfig? mapConfig;
    if (json['map_config'] is Map<String, dynamic>) {
      mapConfig = TurkeyMapConfig.fromJson(
        json['map_config'] as Map<String, dynamic>,
      );
    } else if (json['mapConfig'] is Map<String, dynamic>) {
      mapConfig = TurkeyMapConfig.fromJson(
        json['mapConfig'] as Map<String, dynamic>,
      );
    }

    ClimateChartConfig? climateConfig;
    if (json['climate_config'] is Map<String, dynamic>) {
      climateConfig = ClimateChartConfig.fromJson(
        json['climate_config'] as Map<String, dynamic>,
      );
    } else if (json['climateConfig'] is Map<String, dynamic>) {
      climateConfig = ClimateChartConfig.fromJson(
        json['climateConfig'] as Map<String, dynamic>,
      );
    }

    GeoDiagramConfig? geoConfig;
    if (json['geo_config'] is Map<String, dynamic>) {
      geoConfig = GeoDiagramConfig.fromJson(
        json['geo_config'] as Map<String, dynamic>,
      );
    } else if (json['geoConfig'] is Map<String, dynamic>) {
      geoConfig = GeoDiagramConfig.fromJson(
        json['geoConfig'] as Map<String, dynamic>,
      );
    }

    PopulationPyramidConfig? pyramidConfig;
    if (json['pyramid_config'] is Map<String, dynamic>) {
      pyramidConfig = PopulationPyramidConfig.fromJson(
        json['pyramid_config'] as Map<String, dynamic>,
      );
    } else if (json['pyramidConfig'] is Map<String, dynamic>) {
      pyramidConfig = PopulationPyramidConfig.fromJson(
        json['pyramidConfig'] as Map<String, dynamic>,
      );
    }

    SunDiagramConfig? sunConfig;
    if (json['sun_config'] is Map<String, dynamic>) {
      sunConfig = SunDiagramConfig.fromJson(
        json['sun_config'] as Map<String, dynamic>,
      );
    } else if (json['sunConfig'] is Map<String, dynamic>) {
      sunConfig = SunDiagramConfig.fromJson(
        json['sunConfig'] as Map<String, dynamic>,
      );
    }

    return Question(
      id: json['id'] as String,
      lesson: json['lesson'] as String,
      topic: json['topic'] as String,
      text: cleanText(rawText),
      options: rawOptions.map(cleanText).toList(),
      correctIndex: json['correctIndex'] as int,
      explanation: cleanText(rawExplanation),
      difficulty: json['difficulty'] as String? ?? 'medium',
      distractorTrap: rawTrap != null ? cleanText(rawTrap) : null,
      imageUrl: (rawImage != null && rawImage.isNotEmpty && rawImage != 'null')
          ? rawImage
          : null,
      figureSvg: _normalizeFigureSvg(rawFigure),
      mapConfig: mapConfig,
      climateConfig: climateConfig,
      geoConfig: geoConfig,
      pyramidConfig: pyramidConfig,
      sunConfig: sunConfig,
      orderIndex:
          (json['order_index'] as num?)?.toInt() ??
          (json['orderIndex'] as num?)?.toInt(),
      examScopes: _parseExamScopes(json['exam_scopes'] ?? json['examScopes']),
      subBranch: _normalizeOptionalTag(json['sub_branch'] ?? json['subBranch']),
      educationLevel: _normalizeOptionalTag(
        json['education_level'] ?? json['educationLevel'],
      ),
      disabilityVariant: _normalizeOptionalTag(
        json['disability_variant'] ?? json['disabilityVariant'],
      ),
      sourceVariant: _normalizeOptionalTag(
        json['source_variant'] ?? json['sourceVariant'],
      ),
    );
  }

  /// Supabase `public.questions` tablosundaki satırdan Question nesnesi üretir.
  factory Question.fromSupabase(Map<String, dynamic> row) {
    final interaction = row['interaction_data'] is Map<String, dynamic>
        ? row['interaction_data'] as Map<String, dynamic>
        : <String, dynamic>{};
    final optionsList =
        (interaction['options'] as List?)
            ?.map((e) => cleanText(e.toString()))
            .toList() ??
        <String>[];

    final rawText = (row['prompt_text'] ?? row['text'])?.toString() ?? '';
    final rawExplanation = row['explanation']?.toString() ?? '';
    final rawTrap =
        row['distractor_trap'] as String? ?? row['distractorTrap'] as String?;
    final rawImage =
        row['image_url']?.toString() ?? row['imageUrl']?.toString();
    final rawFigure =
        row['figure_svg']?.toString() ?? row['figureSvg']?.toString();

    TurkeyMapConfig? mapConfig;
    if (interaction['map_config'] is Map<String, dynamic>) {
      mapConfig = TurkeyMapConfig.fromJson(
        interaction['map_config'] as Map<String, dynamic>,
      );
    }

    ClimateChartConfig? climateConfig;
    if (interaction['climate_config'] is Map<String, dynamic>) {
      climateConfig = ClimateChartConfig.fromJson(
        interaction['climate_config'] as Map<String, dynamic>,
      );
    }

    GeoDiagramConfig? geoConfig;
    if (interaction['geo_config'] is Map<String, dynamic>) {
      geoConfig = GeoDiagramConfig.fromJson(
        interaction['geo_config'] as Map<String, dynamic>,
      );
    }

    PopulationPyramidConfig? pyramidConfig;
    if (interaction['pyramid_config'] is Map<String, dynamic>) {
      pyramidConfig = PopulationPyramidConfig.fromJson(
        interaction['pyramid_config'] as Map<String, dynamic>,
      );
    }

    SunDiagramConfig? sunConfig;
    if (interaction['sun_config'] is Map<String, dynamic>) {
      sunConfig = SunDiagramConfig.fromJson(
        interaction['sun_config'] as Map<String, dynamic>,
      );
    }

    return Question(
      id: row['id']?.toString() ?? '',
      lesson: row['lesson']?.toString() ?? 'Genel Kültür',
      topic: row['topic']?.toString() ?? 'Genel',
      text: cleanText(rawText),
      options: optionsList,
      correctIndex: interaction['correctIndex'] as int? ?? 0,
      explanation: cleanText(rawExplanation),
      difficulty: row['difficulty']?.toString() ?? 'medium',
      distractorTrap: rawTrap != null ? cleanText(rawTrap) : null,
      imageUrl: (rawImage != null && rawImage.isNotEmpty && rawImage != 'null')
          ? rawImage
          : null,
      figureSvg: _normalizeFigureSvg(rawFigure),
      mapConfig: mapConfig,
      climateConfig: climateConfig,
      geoConfig: geoConfig,
      pyramidConfig: pyramidConfig,
      sunConfig: sunConfig,
      orderIndex:
          (row['order_index'] as num?)?.toInt() ??
          (row['orderIndex'] as num?)?.toInt(),
      examScopes: _parseExamScopes(row['exam_scopes'] ?? row['examScopes']),
      subBranch: _normalizeOptionalTag(row['sub_branch'] ?? row['subBranch']),
      educationLevel: _normalizeOptionalTag(
        row['education_level'] ?? row['educationLevel'],
      ),
      disabilityVariant: _normalizeOptionalTag(
        row['disability_variant'] ?? row['disabilityVariant'],
      ),
      sourceVariant: _normalizeOptionalTag(
        row['source_variant'] ?? row['sourceVariant'],
      ),
    );
  }

  /// Question nesnesini JSON formatına (Map) çevirir (LocalStorage veya veritabanı için).
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'lesson': lesson,
      'topic': topic,
      'text': text,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
      'difficulty': difficulty,
      'distractor_trap': distractorTrap,
    };
    if (orderIndex != null) {
      map['order_index'] = orderIndex;
    }
    if (imageUrl != null) {
      map['image_url'] = imageUrl;
    }
    if (figureSvg != null) {
      map['figure_svg'] = figureSvg;
    }
    if (examScopes.length != 1 || examScopes.first != 'lisans_gk') {
      map['exam_scopes'] = examScopes;
    }
    if (subBranch != null && subBranch!.isNotEmpty) {
      map['sub_branch'] = subBranch;
    }
    if (educationLevel != null && educationLevel!.isNotEmpty) {
      map['education_level'] = educationLevel;
    }
    if (disabilityVariant != null && disabilityVariant!.isNotEmpty) {
      map['disability_variant'] = disabilityVariant;
    }
    if (sourceVariant != null && sourceVariant!.isNotEmpty) {
      map['source_variant'] = sourceVariant;
    }
    if (mapConfig != null) {
      map['map_config'] = mapConfig!.toJson();
    }
    if (climateConfig != null) {
      map['climate_config'] = climateConfig!.toJson();
    }
    if (geoConfig != null) {
      map['geo_config'] = geoConfig!.toJson();
    }
    if (pyramidConfig != null) {
      map['pyramid_config'] = pyramidConfig!.toJson();
    }
    if (sunConfig != null) {
      map['sun_config'] = sunConfig!.toJson();
    }
    return map;
  }
}

/// Varsayılan olarak gösterilen özgün KPSS Lisans Genel Kültür soruları (Çevrimdışı acil durum yedeği).
const List<Question> defaultSampleQuestions = [
  Question(
    id: 'tar_001',
    lesson: 'Tarih',
    topic: 'İlk Türk Devletleri',
    text: 'Uygurların yerleşik hayata geçmesiyle birlikte Türk kültür ve devlet yapısında önemli değişimler yaşanmıştır.\n\nAşağıdakilerden hangisi bu değişimlerin doğrudan bir sonucu olarak gösterilemez?',
    options: [
      'Tapınak ve saray mimarisinin gelişmesi',
      'Kalıcı yazılı eserlerin ve kütüphanelerin ortaya çıkması',
      'Hükümdarlığın kut inancına dayandırılması geleneğinin sona ermesi',
      'Minyatür ve fresk gibi süsleme sanatlarının yaygınlaşması',
      'Tarım faaliyetlerinin temel geçim kaynağı hâline gelmesi',
    ],
    correctIndex: 2,
    explanation: 'Kut inancı (hükümdarlığın tanrısal kaynaklı olduğuna inanılması) Türk devlet geleneğinde varlığını sürdürmüştür. Yerleşik hayat bu inancı sona erdirmemiştir.',
    distractorTrap: 'Uygurların yerleşik hayata geçmesiyle din ve alfabe değişmiş, tapınak mimarisi başlamıştır. Ancak Kut anlayışı (egemenliğin kaynağının ilahi olması) İslamiyet öncesi Türk devletlerinin tamamında olduğu gibi Uygurlarda da aynen devam etmiştir. ÖSYM adayın \'din değiştiyse yönetim anlayışı da değişmiştir\' ön yargısını en büyük çeldirici olarak kullanır.',
  ),
  Question(
    id: 'cog_001',
    lesson: 'Coğrafya',
    topic: 'Türkiye\'nin Fiziki Özellikleri',
    text: 'Türkiye\'de karstik şekiller en yaygın olarak Akdeniz Bölgesi\'nde, özellikle Teke ve Taşeli platolarında görülür.\n\nBu durumun ortaya çıkmasında bölgenin hangi temel özelliği en fazla etkili olmuştur?',
    options: [
      'Yıllık yağış miktarının fazla olması',
      'Kolay eriyebilen kalkerli (kireçtaşı) kayaç yapısına sahip olması',
      'Ortalama yükseltisinin fazla olması',
      'Bitki örtüsünün maki olması',
      'Fay hatlarının yoğun bulunması',
    ],
    correctIndex: 1,
    explanation: 'Karstik şekillerin oluşabilmesi için kimyasal tortul kayaçların (kalker, jips gibi eriyebilen taşların) bulunması şarttır. Akdeniz\'deki temel etken kalkerli kayaç yapısıdır.',
    distractorTrap: 'Akdeniz Bölgesi\'nde karstik şekillerin varlığı yağış miktarına DEĞİL, arazinin kolay eriyebilen kalkerli (kireçtaşı) kimyasal tortul kayaç yapısına bağlıdır. Karadeniz Akdeniz\'den çok daha fazla yağış almasına rağmen karstik şekil azdır. ÖSYM \'yağış fazlalığı\' şıkkını en sık kullanılan tuzak olarak koyar.',
  ),
  Question(
    id: 'vat_001',
    lesson: 'Vatandaşlık',
    topic: 'Temel Hak ve Ödevler',
    text: '1982 Anayasası\'na göre aşağıdakilerden hangisi \'Kişinin Hakları ve Ödevleri\' (Koruyucu / Negatif Statü Hakları) arasında yer alır?',
    options: [
      'Din ve vicdan hürriyeti',
      'Çalışma ve sözleşme hürriyeti',
      'Dilekçe hakkı',
      'Eğitim ve öğrenim hakkı ve ödevi',
      'Vergi ödevi',
    ],
    correctIndex: 0,
    explanation: 'Din ve vicdan hürriyeti kişinin temel hak ve ödevleri (koruyucu/negatif statü) arasındadır. Çalışma ve eğitim sosyal-ekonomik haklar; dilekçe ve vergi ise siyasi haklardır.',
    distractorTrap: 'Çalışma ve sözleşme hürriyeti ile eğitim hakkı sosyal ve ekonomik haklardır (pozitif statü). Dilekçe ve vergi ise siyasi haklardır (aktif statü). Din ve vicdan hürriyeti ise devletin dahi dokunamayacağı negatif (koruyucu) statü hakkıdır. ÖSYM hak kategorilerini birbiriyle karıştırmayı çok sever.',
  ),
];
