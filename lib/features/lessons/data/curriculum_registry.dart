import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kullanıcının seçili sınav boyutlarını temsil eden merkezi [ExamSelection] provider'ı.
///
/// Angular/Web Karşılığı: Kullanıcının aktif çalışma alanını (`ExamWorkspace`)
/// belirleyen `computed` selector sinyali.
final activeExamSelectionProvider = Provider<ExamSelection>((ref) {
  return ref.watch(
    userPreferencesProvider.select((prefs) => prefs.examSelection),
  );
});

/// Kullanıcının seçili sınav profiline göre aktif müfredat sözleşmesini sunan Riverpod provider'ı.
///
/// Angular/Web Karşılığı: Kullanıcının workspace/exam seçimine reaktif olarak bağlı
/// `computed(() => CurriculumRegistry.resolve(...))` selector sinyali.
final activeCurriculumProvider = Provider<ExamCurriculum>((ref) {
  final selection = ref.watch(activeExamSelectionProvider);
  return CurriculumRegistry.resolve(selection);
});

T _safeReadOrWatch<T>(
  WidgetRef ref,
  Provider<T> provider,
  T fallback, {
  bool watch = true,
}) {
  try {
    return watch ? ref.watch(provider) : ref.read(provider);
  } catch (_) {
    return fallback;
  }
}

/// `ProviderScope` bulunmayan izole widget testlerini kırmadan aktif [ExamSelection] okur/izler.
ExamSelection readOrWatchExamSelection(WidgetRef ref, {bool watch = true}) =>
    _safeReadOrWatch(
      ref,
      activeExamSelectionProvider,
      ExamSelection.initial,
      watch: watch,
    );

/// `ProviderScope` bulunmayan izole widget testlerini kırmadan aktif müfredatı okur/izler.
ExamCurriculum readOrWatchCurriculum(WidgetRef ref, {bool watch = true}) =>
    _safeReadOrWatch(
      ref,
      activeCurriculumProvider,
      CurriculumRegistry.resolve(ExamSelection.initial),
      watch: watch,
    );

/// Tüm KPSS & MEB-AGS sınav aileleri için merkezi müfredat kayıt motoru.
///
/// Angular/Web Karşılığı: Sabit kodlanmış `kpssLessons` listeleri yerine
/// `ExamSelection` değer nesnesini alıp ilgili sınavın derslerini, soru dağılımını,
/// süresini ve modül yeteneklerini çözen saf `CurriculumRegistry` servisi.
abstract final class CurriculumRegistry {
  static const Map<String, int> _tarihTopicTestCounts = {
    'İslamiyet Öncesi Türk Tarihi': 8,
    'İlk Türk-İslam Devletleri': 8,
    'Osmanlı Kültür ve Uygarlığı': 12,
    'Osmanlı Dağılma Dönemi': 10,
    'Kurtuluş Savaşı Hazırlık ve Cepheler': 8,
    'Atatürk İlke ve İnkılapları': 8,
    'Çağdaş Türk ve Dünya Tarihi': 8,
  };

  /// KPSS GY Türkçe 710 soruluk havuzunun 11 konuya göre 10'ar soruluk gerçek test dağılımı (Toplam 71 Test).
  static const Map<String, int> _turkceTopicTestCounts = {
    'Sözcükte Anlam': 5,
    'Cümlede Anlam': 9,
    'Paragrafta Anlam ve Yapı': 31,
    'Sözcükte Yapı ve Ekler': 2,
    'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)': 3,
    'Ses Bilgisi ve Ses Olayları': 2,
    'Yazım Kuralları': 3,
    'Noktalama İşaretleri': 3,
    'Cümlenin Ögeleri ve Cümle Türleri': 3,
    'Anlatım Bozuklukları': 3,
    'Sözel Mantık ve Muhakeme': 7,
  };

  static const Map<String, int> _gkFallbackCountsByLessonId = {
    'tarih': 5,
    'cografya': 6,
    'vatandaslik': 5,
    'guncel': 4,
    'turkce': 5,
  };

  static const Map<String, int> _ekpssGkQuestionOverrides = {
    'tarih': 13,
    'cografya': 5,
    'vatandaslik': 6,
    'guncel': 6,
  };

  static const Map<String, int> _ekpssGyQuestionOverrides = {
    'turkce': 15,
    'matematik': 15,
  };

  static const Map<EducationLevel, List<String>> _dhbt2TopicsByLevel = {
    EducationLevel.ortaogretim: [
      'Tefsir Tarihi ve Usulü (İHL Düzeyi)',
      'Fıkıh ve İlmihal Bilgisi (Ortaöğretim)',
      'Hadis Usulü ve Temel Hadis Metinleri',
      'Siyer ve İslam Tarihi (İHL Müfredatı)',
      'Akaid ve Kelam (Temel İlkeler)',
      'Dinler ve İslam Mezhepleri Tarihi',
      'Hitabet ve Mesleki Uygulama (İHL)',
    ],
    EducationLevel.onlisans: [
      'Tefsir Usulü, Tefsir Tarihi ve Kur’an İlimleri',
      'İslam Hukuku (Fıkıh Usulü ve İbadet-Muamelat)',
      'Hadis Usulü, Cerh-Ta’dil ve Hadis Tarihi',
      'İslam Tarihi, Kültür ve Medeniyeti',
      'Kelam Ekolleri, İtikadi Mezhepler ve Akaid',
      'Yaşayan Dünya Dinleri ve Dinler Tarihi',
      'Din Hizmetlerinde İletişim, İrşat ve Hitabet',
    ],
    EducationLevel.lisans: [
      'Klasik ve Çağdaş Tefsir Usulü ve Kaynakları',
      'İslam Hukuk Felsefesi, Usul-i Fıkıh ve Mukayeseli Fıkıh',
      'Hadis Metodolojisi, Temel Külliyat ve Rical İlmi',
      'Siyer-i Nebi, İslam Tarihi ve İslam Medeniyeti',
      'Kelam İlmi, İslam Mezhepleri Tarihi ve Din Felsefesi',
      'Karşılaştırmalı Dinler Tarihi',
      'Din Psikolojisi, Din Sosyolojisi ve Hitabet-İrşat',
    ],
  };

  static const Map<String, LessonSpec> _aGrubuCatalog = {
    'Alan Hukuk': LessonSpec(
      id: 'alan_hukuk',
      name: 'Alan Hukuk',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsDuotone.scales,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Anayasa Hukuku',
        'İdare Hukuku ve İdari Yargı',
        'Ceza Hukuku ve Muhakeme',
        'Medeni Hukuk',
        'Borçlar Hukuku',
        'Ticaret ve İcra İflas Hukuku',
      ],
    ),
    'Alan İktisat': LessonSpec(
      id: 'alan_iktisat',
      name: 'Alan İktisat',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsRegular.chartLineUp,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Mikro İktisat',
        'Makro İktisat',
        'Para, Banka ve Kredi',
        'Uluslararası İktisat',
        'İktisadi Büyüme ve Kalkınma',
        'Türkiye Ekonomisi',
      ],
    ),
    'Alan Maliye': LessonSpec(
      id: 'alan_maliye',
      name: 'Alan Maliye',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsRegular.chartBar,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Kamu Maliyesine Giriş',
        'Kamu Harcamaları ve Gelirleri',
        'Vergi Hukuku ve Türk Vergi Sistemi',
        'Devlet Bütçesi ve Kamu Borçlanması',
        'Maliye Politikası',
      ],
    ),
    'Alan Muhasebe': LessonSpec(
      id: 'alan_muhasebe',
      name: 'Alan Muhasebe',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsRegular.briefcase,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Genel Muhasebe ve Tekdüzen Hesap Planı',
        'Dönem İçi İşlemler ve Envanter',
        'Mali Tablolar Analizi',
        'Maliyet ve Yönetim Muhasebesi',
        'Şirketler Muhasebesi',
      ],
    ),
    'Alan İşletme': LessonSpec(
      id: 'alan_isletme',
      name: 'Alan İşletme',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsDuotone.factory,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'İşletme Yönetimi ve Organizasyon',
        'Üretim ve İşlemler Yönetimi',
        'Pazarlama Yönetimi',
        'Finansal Yönetim',
        'İnsan Kaynakları Yönetimi',
      ],
    ),
    'Alan Kamu Yönetimi': LessonSpec(
      id: 'alan_kamu_yonetimi',
      name: 'Alan Kamu Yönetimi',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsRegular.certificate,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Yönetim Bilimleri ve Örgüt Kuramları',
        'Siyaset Bilimi',
        'Türk Yönetim Tarihi',
        'Kentleşme, Çevre ve Yerel Yönetimler',
      ],
    ),
    'Alan Uluslararası İlişkiler': LessonSpec(
      id: 'alan_uluslararasi_iliskiler',
      name: 'Alan Uluslararası İlişkiler',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsDuotone.globeHemisphereEast,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Uluslararası İlişkiler Kuramları',
        'Siyasi Tarih ve Diplomasi',
        'Uluslararası Hukuk ve Örgütler',
        'Türk Dış Politikası',
      ],
    ),
    'Alan ÇEKO': LessonSpec(
      id: 'alan_ceko',
      name: 'Alan ÇEKO',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsDuotone.puzzlePiece,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Çalışma Ekonomisi ve Endüstri İlişkileri',
        'İş Hukuku ve Sosyal Güvenlik Hukuku',
        'Sosyal Politika',
        'Çalışma Psikolojisi ve Sosyolojisi',
      ],
    ),
    'Alan İstatistik': LessonSpec(
      id: 'alan_istatistik',
      name: 'Alan İstatistik',
      section: 'Alan Bilgisi',
      questionCount: 40,
      icon: PhosphorIconsDuotone.function,
      badgeText: 'Yakında',
      availability: CurriculumAvailability.comingSoon,
      topics: [
        'Olasılık ve Rassal Değişkenler',
        'Örnekleme ve Tahmin Kuramı',
        'Hipotez Testleri ve Regresyon',
        'Matematiksel İstatistik',
      ],
    ),
  };

  /// Seçili sınava göre eksiksiz [ExamCurriculum] tanımını deterministik biçimde çözer.
  static ExamCurriculum resolve(ExamSelection selection) {
    switch (selection.family) {
      case KpssExamFamily.bGrubu:
        return _resolveBGrubu(selection);
      case KpssExamFamily.ekpss:
        return _resolveEkpss(selection);
      case KpssExamFamily.dhbt:
        return _resolveDhbt(selection);
      case KpssExamFamily.mebAgs:
        return _resolveMebAgs(selection);
      case KpssExamFamily.aGrubu:
        return _resolveAGrubu(selection);
    }
  }

  /// Belirli bir ders/konu ikilisi için müfredat kayıt tablosundan varsayılan test sayısını döner.
  static int defaultTopicTestCount(
    String lessonName,
    String topic, {
    ExamSelection selection = ExamSelection.initial,
  }) {
    final normalizedLesson = lessonName.trim().toLowerCase();
    for (final spec in resolve(selection).allLessons) {
      if (spec.name.toLowerCase() == normalizedLesson) {
        return spec.testCountForTopic(topic);
      }
    }
    return _fallbackTestCountForLessonName(normalizedLesson, topic);
  }

  static int _fallbackTestCountForLessonName(
    String normalizedLesson,
    String topic,
  ) {
    if (normalizedLesson == 'tarih') {
      return _tarihTopicTestCounts[topic] ?? 5;
    }
    if (normalizedLesson == 'coğrafya' || normalizedLesson == 'cografya') {
      return 6;
    }
    if (normalizedLesson == 'vatandaşlık' ||
        normalizedLesson == 'vatandaslik') {
      return 5;
    }
    if (normalizedLesson == 'güncel bilgiler' ||
        normalizedLesson == 'guncel bilgiler') {
      return 4;
    }
    if (normalizedLesson == 'türkçe' || normalizedLesson == 'turkce') {
      return _turkceTopicTestCounts[topic] ?? 5;
    }
    return 5;
  }

  static List<LessonSpec> _buildGkLessons({
    Map<String, int>? questionCountOverrides,
  }) {
    return kpssLessons
        .map(
          (lesson) => LessonSpec.fromLegacyLesson(
            lesson,
            defaultTestCountsByTopic: lesson.id == 'tarih'
                ? _tarihTopicTestCounts
                : const {},
            fallbackTestCount: _gkFallbackCountsByLessonId[lesson.id] ?? 5,
            questionCountOverride: questionCountOverrides?[lesson.id],
          ),
        )
        .toList(growable: false);
  }

  static LessonSpec _buildReadyLisansTurkceSpec() {
    final legacyTurkce = kpssGeneralAbilityLessons.firstWhere(
      (lesson) => lesson.id == 'turkce',
    );
    return LessonSpec.fromLegacyLesson(
      legacyTurkce,
      availabilityOverride: CurriculumAvailability.ready,
      defaultTestCountsByTopic: _turkceTopicTestCounts,
      fallbackTestCount: _gkFallbackCountsByLessonId['turkce'] ?? 5,
    );
  }

  static List<LessonSpec> _buildGyUpcomingLessons({
    Map<String, int>? questionCountOverrides,
    bool excludeTurkce = false,
  }) {
    return kpssGeneralAbilityLessons
        .where((lesson) => !excludeTurkce || lesson.id != 'turkce')
        .map(
          (lesson) => LessonSpec.fromLegacyLesson(
            lesson,
            questionCountOverride: questionCountOverrides?[lesson.id],
          ),
        )
        .toList(growable: false);
  }

  static ExamCurriculum _resolveBGrubu(ExamSelection selection) {
    final gkLessons = _buildGkLessons();
    final activeLessons = [...gkLessons, _buildReadyLisansTurkceSpec()];
    final upcomingLessons = _buildGyUpcomingLessons(excludeTurkce: true);
    return ExamCurriculum(
      scopeKey: selection.scopeKey,
      title: 'KPSS ${selection.educationLevel.label} (GY-GK)',
      summaryLabel: '6 ders · Genel Yetenek & Genel Kültür (120 Soru)',
      totalQuestions: 120,
      standardDurationMinutes: 130,
      availability: CurriculumAvailability.partial,
      activeSectionTitle: 'KPSS Genel Kültür + GY Türkçe (90 Soru)',
      upcomingSectionTitle:
          'KPSS Genel Yetenek · Matematik (30 Soru · Yakında)',
      activeLessons: activeLessons,
      upcomingLessons: upcomingLessons,
    );
  }

  static ExamCurriculum _resolveEkpss(ExamSelection selection) {
    final baseGkLessons = _buildGkLessons(
      questionCountOverrides: _ekpssGkQuestionOverrides,
    );
    final gkLessons = baseGkLessons
        .map((lesson) {
          if (lesson.name == 'Tarih') {
            return lesson.copyWith(
              topics: const [
                'Atatürk İlkeleri ve İnkılap Tarihi',
                'Türk Kültür ve Medeniyetleri',
                'Osmanlı Devleti Siyasi ve Kültür Tarihi',
                'Çağdaş Türk ve Dünya Tarihi (Temel Çerçeve)',
              ],
            );
          }
          if (lesson.name == 'Coğrafya') {
            return lesson.copyWith(
              topics: const [
                'Türkiye’nin Coğrafi Konumu ve Yerşekilleri',
                'Türkiye’nin İklimi ve Doğal Afetler',
                'Türkiye’de Nüfus, Yerleşme ve Ekonomik Coğrafya',
              ],
            );
          }
          if (lesson.name == 'Vatandaşlık') {
            return lesson.copyWith(
              topics: const [
                'Temel Hukuk ve Devlet Kavramları',
                'T.C. Anayasası (Yasama, Yürütme, Yargı)',
                'İdare Hukuku ve Uluslararası Kuruluşlar',
                'Engelli Hakları Mevzuatı (5378 Sayılı Kanun)',
              ],
            );
          }
          return lesson;
        })
        .toList(growable: false);

    final gyLessons = _buildGyUpcomingLessons(
      questionCountOverrides: _ekpssGyQuestionOverrides,
    );
    final levelLabel = selection.educationLevel.label;
    final extraMinutes = selection.includeExtraTime
        ? selection.disabilityGroup.standardExtraMinutes
        : 0;

    return ExamCurriculum(
      scopeKey: selection.scopeKey,
      title: 'E-KPSS ($levelLabel)',
      summaryLabel:
          '6 ders · 30 GY + 30 GK (${selection.disabilityGroup.label})',
      totalQuestions: 60,
      standardDurationMinutes: 60 + extraMinutes,
      availability: CurriculumAvailability.partial,
      activeSectionTitle: 'E-KPSS Genel Kültür (30 Soru)',
      upcomingSectionTitle: 'E-KPSS Genel Yetenek (30 Soru · Yakında)',
      activeLessons: gkLessons,
      upcomingLessons: gyLessons,
      upcomingContextLabel: 'E-KPSS Genel Yetenek',
      supportsTurkeyMapWorkshop: true,
      supportsMiniGames: true,
      supportsFlashcards: true,
    );
  }

  static ExamCurriculum _resolveDhbt(ExamSelection selection) {
    final dhbt2Topics =
        _dhbt2TopicsByLevel[selection.educationLevel] ??
        _dhbt2TopicsByLevel[EducationLevel.onlisans]!;

    final dhbtLessons = [
      const LessonSpec(
        id: 'dhbt_1',
        name: 'DHBT-1 Temel Din Bilgisi',
        section: 'Ortak Alan (20 Soru)',
        questionCount: 20,
        icon: PhosphorIconsRegular.books,
        badgeText: 'Yakında',
        availability: CurriculumAvailability.comingSoon,
        topics: [
          'Kur\'an-ı Kerim Bilgisi (Tecvit ve Kıraat)',
          'Akaid ve Temel İnanç Esasları',
          'Fıkıh ve İlmihal (İbadetler)',
          'Siyer-i Nebi ve İlk Dönem İslam Tarihi',
          'İslam Ahlakı ve Kavramlar',
        ],
      ),
      LessonSpec(
        id: 'dhbt_2',
        name: 'DHBT-2 ${selection.educationLevel.label} Alan',
        section: '${selection.educationLevel.label} Düzeyi (20 Soru)',
        questionCount: 20,
        icon: PhosphorIconsDuotone.bookOpenText,
        badgeText: 'Yakında',
        availability: CurriculumAvailability.comingSoon,
        topics: dhbt2Topics,
      ),
    ];

    return ExamCurriculum(
      scopeKey: selection.scopeKey,
      title: 'KPSS DHBT (${selection.educationLevel.label})',
      summaryLabel: '2 oturum · DHBT-1 (20) + DHBT-2 (20)',
      totalQuestions: 40,
      standardDurationMinutes: 60,
      availability: CurriculumAvailability.comingSoon,
      activeSectionTitle: 'DHBT Konu Modülleri',
      upcomingSectionTitle: 'KPSS DHBT Modülleri (40 Soru · Yakında)',
      activeLessons: const [],
      upcomingLessons: dhbtLessons,
      supportsTurkeyMapWorkshop: false,
      supportsMiniGames: false,
      upcomingContextLabel: 'KPSS DHBT (${selection.educationLevel.label})',
    );
  }

  static const Map<OabtBranch, List<String>> _oabtTopicsByBranch = {
    OabtBranch.turkce: [
      'Anlama ve Anlatma Teknikleri',
      'Dil Bilimi ve Türk Dil Bilgisi',
      'Yeni ve Eski Türk Edebiyatı',
      'Halk Edebiyatı ve Çocuk Edebiyatı',
      'Türkçe Alan Eğitimi ve Öğretim Programı',
    ],
    OabtBranch.ilkogretimMatematik: [
      'Analiz (Limit, Türev, İntegral, Diziler-Seriler)',
      'Soyut Cebir ve Lineer Cebir',
      'Geometri (Öklid ve Analitik Geometri)',
      'Olasılık, İstatistik ve Diferansiyel Denklemler',
      'İlköğretim Matematik Alan Eğitimi',
    ],
    OabtBranch.matematikLise: [
      'Analiz (Tek ve Çok Değişkenli Fonksiyonlar)',
      'Soyut Cebir, Sayılar Teorisi ve Lineer Cebir',
      'Geometri ve Analitik Geometri',
      'Diferansiyel Denklemler, Olasılık ve İstatistik',
      'Ortaöğretim Matematik Alan Eğitimi',
    ],
    OabtBranch.fenBilimleri: [
      'Fizik (Mekanik, Elektrik, Manyetizma, Optik, Modern Fizik)',
      'Kimya (Genel, Analitik, Organik ve Fizikokimya)',
      'Biyoloji (Hücre, Genetik, Ekoloji, Sistemler)',
      'Yer, Gök ve Çevre Bilimleri',
      'Fen Bilimleri Alan Eğitimi ve Laboratuvar',
    ],
    OabtBranch.fizik: [
      'Mekanik, Titreşimler ve Dalgalar',
      'Elektrik ve Manyetizma',
      'Termodinamik, Optik ve Işık',
      'Atom, Çekirdek ve Modern Fizik',
      'Fizik Alan Eğitimi',
    ],
    OabtBranch.kimya: [
      'Genel Kimya ve Anorganik Kimya',
      'Analitik Kimya',
      'Organik Kimya',
      'Fizikokimya ve Elektrokimya',
      'Kimya Alan Eğitimi ve Laboratuvar Güvenliği',
    ],
    OabtBranch.biyoloji: [
      'Hücre Biyolojisi ve Biyokimya',
      'Genetik, Moleküler Biyoloji ve Evrim',
      'Bitki ve Hayvan Sistematiği ile Anatomisi',
      'İnsan Fizyolojisi ve Ekoloji',
      'Biyoloji Alan Eğitimi',
    ],
    OabtBranch.sosyalBilgiler: [
      'Tarih (İlk Çağ’dan Türkiye Cumhuriyeti’ne)',
      'Coğrafya (Fiziki, Beşeri ve Türkiye Coğrafyası)',
      'Siyaset Bilimi, Sosyoloji ve Antropoloji',
      'Ekonomi, Sosyal Psikoloji ve Günümüz Dünya Sorunları',
      'Sosyal Bilgiler Alan Eğitimi ve Değerler Eğitimi',
    ],
    OabtBranch.turkDiliEdebiyati: [
      'Eski Türk Dili ve Yeni Türk Dili',
      'Eski Türk Edebiyatı (Divan Şiiri ve Nesri)',
      'Yeni Türk Edebiyatı (Tanzimat’tan Günümüze)',
      'Türk Halk Edebiyatı ve Edebi Akımlar',
      'Türk Dili ve Edebiyatı Alan Eğitimi',
    ],
    OabtBranch.tarih: [
      'Tarih Bilimi, Metodoloji ve Eski Çağ Tarihi',
      'İlk Türk Devletleri ve İslam Tarihi',
      'Türk-İslam ve Osmanlı Tarihi',
      'Atatürk İlkeleri, İnkılap ve Çağdaş Dünya Tarihi',
      'Tarih Alan Eğitimi',
    ],
    OabtBranch.cografya: [
      'Fiziki Coğrafya (Jeomorfoloji, Klimatoloji, Hidrografya)',
      'Beşeri ve Ekonomik Coğrafya',
      'Bölgeler ve Ülkeler Coğrafyası',
      'Türkiye Coğrafyası ve Coğrafi Bilgi Sistemleri (CBS)',
      'Coğrafya Alan Eğitimi',
    ],
    OabtBranch.dkabIhl: [
      'Kur’an-ı Kerim, Tefsir, Hadis ve Fıkıh',
      'Kelam, İslam Mezhepleri ve Dinler Tarihi',
      'İslam Tarihi, Medeniyeti ve Din Felsefesi',
      'Din Sosyolojisi ve Din Psikolojisi',
      'DKAB / İHL Alan Eğitimi',
    ],
    OabtBranch.pdr: [
      'Temel Psikoloji, Kişilik ve Psikopatoloji',
      'Psikolojik Danışma Kuramları, İlke ve Teknikleri',
      'Grupla Psikolojik Danışma ve Kariyer Rehberliği',
      'Bireyi Tanıma Teknikleri ve Okul PDR Hizmetleri',
      'Meslek Etiği, Özel Eğitim ve Alan Eğitimi',
    ],
    OabtBranch.sinifOgretmenligi: [
      'Alan Bilgisi (30 Soru): Türkçe, Matematik, Fen ve Sosyal Temelleri',
      'Alan Eğitimi (20 Soru): İlk Okuma Yazma ve Türkçe Öğretimi',
      'İlkokul Matematik, Fen ve Hayat Bilgisi Öğretimi',
      'Sosyal Bilgiler, Oyun, Sanat ve Birleştirilmiş Sınıflar Öğretimi',
    ],
    OabtBranch.okulOncesi: [
      'Alan Bilgisi (30 Soru): Erken Çocukluk Gelişimi, Sağlık ve Beslenme',
      'Okul Öncesi Eğitime Giriş, Kuramlar, Oyun ve Çocuk Edebiyatı',
      'Alan Eğitimi (20 Soru): Erken Matematik, Fen, Okuryazarlık ve Sanat',
      'Bireyselleştirilmiş Program (BEP) ve Aile Katılımı',
    ],
    OabtBranch.bedenEgitimi: [
      'Beden Eğitimi ve Sporun Temelleri ile Tarihi',
      'İnsan Anatomisi, Kinezyoloji ve Egzersiz Fizyolojisi',
      'Antrenman Bilgisi, Sağlık ve İlk Yardım',
      'Psikomotor Gelişim ve Branş Spor Kuralları',
      'Beden Eğitimi ve Spor Alan Eğitimi',
    ],
    OabtBranch.ozelEgitim: [
      'Alan Bilgisi (30 Soru): Özel Eğitim Mevzuatı ve BEP Hazırlama',
      'Zihinsel, İşitsel, Görsel Yetersizlik, ÖÖG ve Otizm Spektrumu',
      'Alan Eğitimi (20 Soru): Uygulamalı Davranış Analizi ve Öğretim',
      'Kaynaştırma, Bütünleştirme, Aile Eğitimi ve Yardımcı Teknoloji',
    ],
  };

  static ExamCurriculum _resolveMebAgs(ExamSelection selection) {
    final branch = selection.oabtBranch;
    final lessons = <LessonSpec>[
      const LessonSpec(
        id: 'meb_ags_1',
        name: 'MEB-AGS 1. Oturum',
        section: 'Genel Yetenek, GK, Eğitim & TYMM (80 Soru · 110 dk)',
        questionCount: 80,
        icon: PhosphorIconsDuotone.target,
        badgeText: 'Yakında',
        availability: CurriculumAvailability.comingSoon,
        topics: [
          'Sözel Yetenek (15 Soru)',
          'Sayısal Yetenek (15 Soru)',
          'Tarih (6 Soru)',
          'Türkiye Coğrafyası (6 Soru)',
          'TYMM: Türkiye Yüzyılı Maarif Modeli & Eğitimin Temelleri (30 Soru)',
          'Eğitim Bilimleri Arşiv: Öğretim İlke ve Yöntemleri',
          'Eğitim Bilimleri Arşiv: Gelişim ve Öğrenme Psikolojisi',
          'Eğitim Bilimleri Arşiv: Ölçme ve Değerlendirme',
          'Eğitim Bilimleri Arşiv: Program Geliştirme ve Sınıf Yönetimi',
          'Eğitim Bilimleri Arşiv: Öğretim Teknolojileri ve Rehberlik (PDR)',
          'Mevzuat (8 Soru): T.C. Anayasası, 1739, 222 ve 7528 Sayılı Kanunlar',
        ],
      ),
    ];

    var totalQuestions = 80;
    var title = 'MEB-AGS (P1)';

    if (branch == OabtBranch.ydsDil) {
      totalQuestions = 160;
      title = 'MEB-AGS + YDS (P3)';
      lessons.add(
        const LessonSpec(
          id: 'meb_ags_yds',
          name: 'Yabancı Dil (YDS)',
          section: '2. Oturum (%50)',
          questionCount: 80,
          icon: PhosphorIconsRegular.compass,
          badgeText: 'Yakında',
          availability: CurriculumAvailability.comingSoon,
          topics: [
            'Kelime Bilgisi ve Dil Bilgisi',
            'Cümle Tamamlama, Cloze Test ve Paragraf',
            'Çeviri, Diyalog ve Anlam Bütünlüğü',
            'Akademik Okuma Becerileri',
          ],
        ),
      );
    } else if (branch != OabtBranch.none) {
      totalQuestions = 130;
      title = 'MEB-AGS · ${branch.label}';
      final branchTopics =
          _oabtTopicsByBranch[branch] ??
          (branch.hasFieldEducationSplit
              ? const ['Alan Bilgisi (30 Soru)', 'Alan Eğitimi (20 Soru)']
              : const ['Alan Bilgisi (50 Soru)']);
      final splitLabel = branch.hasFieldEducationSplit
          ? '30 Alan + 20 Alan Eğitimi'
          : '50 Alan Bilgisi';
      lessons.add(
        LessonSpec(
          id: 'oabt_${branch.key}',
          name: 'ÖABT ${branch.label}',
          section: '2. Oturum ($splitLabel · ${branch.durationMinutes} dk)',
          questionCount: 50,
          icon: PhosphorIconsRegular.certificate,
          badgeText: 'Yakında',
          availability: CurriculumAvailability.comingSoon,
          topics: branchTopics,
        ),
      );
    }

    return ExamCurriculum(
      scopeKey: selection.scopeKey,
      title: title,
      summaryLabel: '${lessons.length} oturum · $totalQuestions Soru',
      totalQuestions: totalQuestions,
      standardDurationMinutes: 110,
      availability: CurriculumAvailability.comingSoon,
      activeSectionTitle: 'MEB-AGS Aktif Modüller',
      upcomingSectionTitle: '$title (${lessons.length} Oturum · Yakında)',
      activeLessons: const [],
      upcomingLessons: lessons,
      supportsTurkeyMapWorkshop: false,
      supportsMiniGames: false,
      upcomingContextLabel: title,
    );
  }

  static ExamCurriculum _resolveAGrubu(ExamSelection selection) {
    final chosenNames = selection.selectedFieldLessons.isEmpty
        ? ExamSelection.defaultAGroupP48Lessons
        : selection.selectedFieldLessons;

    final fieldLessons = chosenNames
        .map(
          (name) =>
              _aGrubuCatalog[name] ??
              LessonSpec(
                id: 'alan_${name.toLowerCase().replaceAll(' ', '_')}',
                name: name,
                section: 'Alan Bilgisi',
                questionCount: 40,
                icon: PhosphorIconsRegular.briefcase,
                badgeText: 'Yakında',
                availability: CurriculumAvailability.comingSoon,
                topics: const ['Temel Alan Modülü'],
              ),
        )
        .toList(growable: false);

    final totalQuestions = fieldLessons.fold<int>(
      0,
      (sum, lesson) => sum + lesson.questionCount,
    );

    final totalDurationMinutes = fieldLessons.fold<int>(
      0,
      (sum, lesson) => sum + (lesson.name == 'Alan İstatistik' ? 60 : 50),
    );

    return ExamCurriculum(
      scopeKey: selection.scopeKey,
      title: 'KPSS A Grubu (Alan Bilgisi)',
      summaryLabel: '${fieldLessons.length} alan testi · $totalQuestions Soru',
      totalQuestions: totalQuestions,
      standardDurationMinutes: totalDurationMinutes,
      availability: CurriculumAvailability.comingSoon,
      activeSectionTitle: 'KPSS A Grubu Aktif Modüller',
      upcomingSectionTitle:
          'Alan Bilgisi Testleri ($totalQuestions Soru · Yakında)',
      activeLessons: const [],
      upcomingLessons: fieldLessons,
      supportsTurkeyMapWorkshop: false,
      supportsMiniGames: false,
      upcomingContextLabel: 'KPSS A Grubu Alan Bilgisi',
    );
  }
}
