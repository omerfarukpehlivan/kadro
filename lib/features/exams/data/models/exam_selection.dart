import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';

/// Enum anahtarından tip güvenli şekilde enum değeri çözen ortak yardımcı.
T _enumFromKey<T extends Enum>(
  Iterable<T> values,
  String Function(T value) keyOf,
  String? rawKey,
  T fallback,
) {
  if (rawKey == null || rawKey.trim().isEmpty) return fallback;
  final normalized = rawKey.trim().toLowerCase();
  for (final value in values) {
    if (keyOf(value).toLowerCase() == normalized ||
        value.name.toLowerCase() == normalized) {
      return value;
    }
  }
  return fallback;
}

/// İki string listesinin eleman ve sıra eşitliğini denetleyen saf yardımcı.
bool _stringListsEqual(List<String> a, List<String> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

/// ÖSYM KPSS & MEB-AGS sınav ailesi ana kategorileri.
///
/// Angular/Web Karşılığı: Kullanıcının ana ürün dikeyini (`route workspace`) belirleyen
/// `ExamFamily` enum sabitleri.
enum KpssExamFamily {
  bGrubu(
    key: 'b_grubu',
    label: 'KPSS B Grubu',
    shortLabel: 'B Grubu',
    description: 'Lisans, Ön Lisans & Ortaöğretim (GY-GK)',
  ),
  aGrubu(
    key: 'a_grubu',
    label: 'KPSS A Grubu',
    shortLabel: 'A Grubu',
    description: 'Kariyer Meslekleri · 9 Alan Bilgisi Testi',
  ),
  dhbt(
    key: 'dhbt',
    label: 'KPSS DHBT',
    shortLabel: 'DHBT',
    description: 'Din Hizmetleri Alan Bilgisi Testi (DHBT-1 & 2)',
  ),
  mebAgs(
    key: 'meb_ags',
    label: 'MEB-AGS + ÖABT',
    shortLabel: 'MEB-AGS',
    description: 'Millî Eğitim Akademisi Giriş Sınavı & 17 Branş',
  ),
  ekpss(
    key: 'ekpss',
    label: 'E-KPSS',
    shortLabel: 'E-KPSS',
    description: 'Engelli Kamu Personeli Seçme Sınavı',
  );

  final String key;
  final String label;
  final String shortLabel;
  final String description;

  /// Geliştirme aşamasındaki kilitli sınav aileleri için standart bilgilendirme metni (`TASK-179`).
  static const String lockedMaintenanceMessage =
      'Bakım, onarım ve geliştirme süreçleri devam ediyor… Çok yakında!';

  const KpssExamFamily({
    required this.key,
    required this.label,
    required this.shortLabel,
    required this.description,
  });

  /// Mevcut yayında çalışma hedefi seçicilerinde aktif olup olmadığını döner (`TASK-179`).
  ///
  /// Angular/Web Karşılığı: `src/domain/exam-selection.ts` içindeki
  /// `isExamFamilyActive(family)` güvenlik kapısı ile eşleniktir.
  bool get isActiveForStudy => this == KpssExamFamily.bGrubu;

  static KpssExamFamily fromKey(String? rawKey) => _enumFromKey(
    KpssExamFamily.values,
    (v) => v.key,
    rawKey,
    KpssExamFamily.bGrubu,
  );
}

/// Adayın mezuniyet / başvuru öğrenim düzeyi.
enum EducationLevel {
  lisans(
    key: 'lisans',
    label: 'Lisans',
    subtitle: '4 Yıllık Üniversite Mezunları & Son Sınıf',
  ),
  onlisans(
    key: 'onlisans',
    label: 'Ön Lisans',
    subtitle: '2 Yıllık Meslek Yüksekokulu Mezunları',
  ),
  ortaogretim(
    key: 'ortaogretim',
    label: 'Ortaöğretim',
    subtitle: 'Lise ve Dengi Okul Mezunları',
  );

  final String key;
  final String label;
  final String subtitle;

  const EducationLevel({
    required this.key,
    required this.label,
    required this.subtitle,
  });

  static EducationLevel fromKey(String? rawKey) => _enumFromKey(
    EducationLevel.values,
    (v) => v.key,
    rawKey,
    EducationLevel.lisans,
  );
}

/// B Grubu kapsam profili (`TASK-166`: B Grubu'nda tek profil `full_gygk`'dır;
/// `onlyGk` enum değeri yalnızca eski kayıtlarla geriye dönük uyumluluk için korunur
/// ve `fromKey` / `fromJson` okuma anında `fullGyGk`'ya normalize edilir).
enum BGroupProfile {
  onlyGk(
    key: 'only_gk',
    label: 'Genel Kültür (60 Soru)',
    shortLabel: 'Sadece GK',
  ),
  fullGyGk(
    key: 'full_gygk',
    label: 'Tam GY-GK (120 Soru)',
    shortLabel: 'Tam GY-GK',
  );

  final String key;
  final String label;
  final String shortLabel;

  const BGroupProfile({
    required this.key,
    required this.label,
    required this.shortLabel,
  });

  /// Eski kayıtlı `'only_gk'` değerini otomatik olarak [BGroupProfile.fullGyGk] olarak normalize eder (`TASK-166`).
  static BGroupProfile fromKey(String? rawKey) => BGroupProfile.fullGyGk;
}

/// E-KPSS resmi kitapçık ve engel grubu uyarlama türleri.
enum DisabilityGroup {
  genel(
    key: 'genel',
    label: 'Genel Görme / İşitme-2 / Bedensel',
    standardExtraMinutes: 0,
  ),
  gorme(
    key: 'gorme',
    label: 'Görme (Büyük Punto / Okuyucu)',
    standardExtraMinutes: 30,
  ),
  isitme1(
    key: 'isitme1',
    label: 'İşitme-1 (İlköğretim Öncesi)',
    standardExtraMinutes: 20,
  ),
  zihinsel(
    key: 'zihinsel',
    label: 'Zihinsel (Sadeleştirilmiş Kitapçık)',
    standardExtraMinutes: 20,
  );

  final String key;
  final String label;

  /// ÖSYM ek süre uyarlamalarında sunulan standart ek dakika önerisi.
  final int standardExtraMinutes;

  const DisabilityGroup({
    required this.key,
    required this.label,
    required this.standardExtraMinutes,
  });

  static DisabilityGroup fromKey(String? rawKey) => _enumFromKey(
    DisabilityGroup.values,
    (v) => v.key,
    rawKey,
    DisabilityGroup.genel,
  );
}

/// Güncel 2025–2026 ÖSYM kılavuzuna göre 17 resmî ÖABT branşı ile AGS/YDS rotaları.
///
/// Not: Yabancı diller (İngilizce vb.) ÖSYM düzenlemesiyle ÖABT dışında
/// `MEB-AGS + YDS (AGS-P3)` üzerinden değerlendirilir.
enum OabtBranch {
  none(
    key: 'none',
    label: 'Sadece MEB-AGS (P1)',
    durationMinutes: 0,
    hasFieldEducationSplit: false,
    isOabtExam: false,
  ),
  ydsDil(
    key: 'yds_dil',
    label: 'Yabancı Dil (AGS + YDS · P3)',
    durationMinutes: 0,
    hasFieldEducationSplit: false,
    isOabtExam: false,
  ),
  turkce(
    key: 'turkce',
    label: 'Türkçe',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  ilkogretimMatematik(
    key: 'ilkogretim_matematik',
    label: 'İlköğretim Matematik',
    durationMinutes: 90,
    hasFieldEducationSplit: false,
  ),
  matematikLise(
    key: 'matematik_lise',
    label: 'Matematik (Lise)',
    durationMinutes: 90,
    hasFieldEducationSplit: false,
  ),
  fenBilimleri(
    key: 'fen_bilimleri',
    label: 'Fen Bilimleri',
    durationMinutes: 90,
    hasFieldEducationSplit: false,
  ),
  fizik(
    key: 'fizik',
    label: 'Fizik',
    durationMinutes: 90,
    hasFieldEducationSplit: false,
  ),
  kimya(
    key: 'kimya',
    label: 'Kimya / Kimya Teknolojisi',
    durationMinutes: 90,
    hasFieldEducationSplit: false,
  ),
  biyoloji(
    key: 'biyoloji',
    label: 'Biyoloji',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  sosyalBilgiler(
    key: 'sosyal_bilgiler',
    label: 'Sosyal Bilgiler',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  turkDiliEdebiyati(
    key: 'turk_dili_edebiyati',
    label: 'Türk Dili ve Edebiyatı',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  tarih(
    key: 'tarih',
    label: 'Tarih',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  cografya(
    key: 'cografya',
    label: 'Coğrafya',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  dkabIhl(
    key: 'dkab_ihl',
    label: 'Din Kültürü ve Ahlak Bilgisi / İHL',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  pdr(
    key: 'pdr',
    label: 'Rehberlik / PDR',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  sinifOgretmenligi(
    key: 'sinif_ogretmenligi',
    label: 'Sınıf Öğretmenliği',
    durationMinutes: 70,
    hasFieldEducationSplit: true,
  ),
  okulOncesi(
    key: 'okul_oncesi',
    label: 'Okul Öncesi Öğretmenliği',
    durationMinutes: 70,
    hasFieldEducationSplit: true,
  ),
  bedenEgitimi(
    key: 'beden_egitimi',
    label: 'Beden Eğitimi',
    durationMinutes: 70,
    hasFieldEducationSplit: false,
  ),
  ozelEgitim(
    key: 'ozel_egitim',
    label: 'Özel Eğitim Öğretmenliği',
    durationMinutes: 70,
    hasFieldEducationSplit: true,
  );

  final String key;
  final String label;
  final int durationMinutes;

  /// Sınıf, Okul Öncesi ve Özel Eğitim branşlarında 30 Alan Bilgisi + 20 Alan Eğitimi ayrımı vardır.
  final bool hasFieldEducationSplit;

  /// Gerçek 50 soruluk ÖABT testi uygulanıp uygulanmadığı (`none` ve `ydsDil` hariç 17 alan).
  final bool isOabtExam;

  const OabtBranch({
    required this.key,
    required this.label,
    required this.durationMinutes,
    required this.hasFieldEducationSplit,
    this.isOabtExam = true,
  });

  /// Resmî 17 ÖABT branşı listesi.
  static List<OabtBranch> get officialOabtBranches =>
      OabtBranch.values.where((b) => b.isOabtExam).toList(growable: false);

  static OabtBranch fromKey(String? rawKey) =>
      _enumFromKey(OabtBranch.values, (v) => v.key, rawKey, OabtBranch.none);
}

/// Adayın seçtiği tüm KPSS / MEB-AGS sınav boyutlarını tek bir değiştirilemez (immutable)
/// değer nesnesinde toplayan alan modeli (Value Object).
///
/// Angular/Web Karşılığı: Kullanıcının çalışma alanını belirleyen `ExamWorkspaceSelection`
/// store state / route query context modeli.
@immutable
class ExamSelection {
  /// KPSS A Grubu `KPSSP48` çekirdek alan dersleri.
  static const List<String> defaultAGroupP48Lessons = [
    'Alan Hukuk',
    'Alan İktisat',
    'Alan Maliye',
    'Alan Muhasebe',
  ];

  final KpssExamFamily family;
  final EducationLevel educationLevel;
  final BGroupProfile bGroupProfile;
  final OabtBranch oabtBranch;
  final DisabilityGroup disabilityGroup;
  final List<String> selectedFieldLessons;
  final int examCycleYear;
  final bool includeExtraTime;

  const ExamSelection({
    this.family = KpssExamFamily.bGrubu,
    this.educationLevel = EducationLevel.lisans,
    this.bGroupProfile = BGroupProfile.fullGyGk,
    this.oabtBranch = OabtBranch.none,
    this.disabilityGroup = DisabilityGroup.genel,
    this.selectedFieldLessons = const [],
    this.examCycleYear = 2027,
    this.includeExtraTime = false,
  });

  /// Varsayılan KPSS Lisans GY-GK seçimi (`TASK-166`).
  static const ExamSelection initial = ExamSelection();

  /// Bu seçimin aktif yayındaki çalışma kapsamında açık olup olmadığını döner (`TASK-179`).
  bool get isActiveForStudy => family.isActiveForStudy;

  /// Kilitli (`!isActiveForStudy`) eski kayıtları güvenli biçimde KPSS B Grubu'na düşürür (`TASK-179`).
  ExamSelection normalizeForActiveStudy() =>
      family.isActiveForStudy ? this : ExamSelection.initial;

  /// KPSS Lisans B Grubu kısa kurucusu.
  const ExamSelection.bGrubuLisans({
    BGroupProfile bGroupProfile = BGroupProfile.fullGyGk,
    int examCycleYear = 2027,
  }) : this(
         family: KpssExamFamily.bGrubu,
         educationLevel: EducationLevel.lisans,
         bGroupProfile: bGroupProfile,
         examCycleYear: examCycleYear,
       );

  /// KPSS B Grubu (Lisans / Ön Lisans / Ortaöğretim) kısa kurucusu.
  const ExamSelection.bGrubu({
    EducationLevel educationLevel = EducationLevel.lisans,
    BGroupProfile bGroupProfile = BGroupProfile.fullGyGk,
    int examCycleYear = 2027,
  }) : this(
         family: KpssExamFamily.bGrubu,
         educationLevel: educationLevel,
         bGroupProfile: bGroupProfile,
         examCycleYear: examCycleYear,
       );

  /// E-KPSS kısa kurucusu.
  const ExamSelection.ekpss({
    EducationLevel educationLevel = EducationLevel.lisans,
    DisabilityGroup disabilityGroup = DisabilityGroup.genel,
    bool includeExtraTime = false,
    int examCycleYear = 2027,
  }) : this(
         family: KpssExamFamily.ekpss,
         educationLevel: educationLevel,
         disabilityGroup: disabilityGroup,
         includeExtraTime: includeExtraTime,
         examCycleYear: examCycleYear,
       );

  /// KPSS DHBT kısa kurucusu.
  const ExamSelection.dhbt({
    EducationLevel educationLevel = EducationLevel.onlisans,
    int examCycleYear = 2027,
  }) : this(
         family: KpssExamFamily.dhbt,
         educationLevel: educationLevel,
         examCycleYear: examCycleYear,
       );

  /// MEB-AGS + ÖABT / YDS kısa kurucusu.
  const ExamSelection.mebAgs({
    OabtBranch oabtBranch = OabtBranch.none,
    int examCycleYear = 2027,
  }) : this(
         family: KpssExamFamily.mebAgs,
         oabtBranch: oabtBranch,
         examCycleYear: examCycleYear,
       );

  /// KPSS A Grubu kısa kurucusu.
  const ExamSelection.aGrubu({
    List<String> selectedFieldLessons = defaultAGroupP48Lessons,
    int examCycleYear = 2027,
  }) : this(
         family: KpssExamFamily.aGrubu,
         selectedFieldLessons: selectedFieldLessons,
         examCycleYear: examCycleYear,
       );

  /// Eski tek boyutlu `KpssExamTarget` enumundan geriye dönük uyumlu `ExamSelection` üretir.
  factory ExamSelection.fromLegacyTarget(KpssExamTarget target) {
    switch (target) {
      case KpssExamTarget.lisans:
        return const ExamSelection(
          family: KpssExamFamily.bGrubu,
          educationLevel: EducationLevel.lisans,
          bGroupProfile: BGroupProfile.fullGyGk,
          examCycleYear: 2027,
        );
      case KpssExamTarget.lisans2028:
        return const ExamSelection(
          family: KpssExamFamily.bGrubu,
          educationLevel: EducationLevel.lisans,
          bGroupProfile: BGroupProfile.fullGyGk,
          examCycleYear: 2028,
        );
      case KpssExamTarget.onlisans:
        return const ExamSelection(
          family: KpssExamFamily.bGrubu,
          educationLevel: EducationLevel.onlisans,
          bGroupProfile: BGroupProfile.fullGyGk,
          examCycleYear: 2028,
        );
      case KpssExamTarget.ortaogretim:
        return const ExamSelection(
          family: KpssExamFamily.bGrubu,
          educationLevel: EducationLevel.ortaogretim,
          bGroupProfile: BGroupProfile.fullGyGk,
          examCycleYear: 2028,
        );
      case KpssExamTarget.dhbt:
        return const ExamSelection(
          family: KpssExamFamily.dhbt,
          educationLevel: EducationLevel.onlisans,
          examCycleYear: 2028,
        );
    }
  }

  /// Mevcut tek boyutlu `KpssExamTarget` tüketicileri için geriye dönük eşleme döner.
  KpssExamTarget toLegacyTarget() {
    switch (family) {
      case KpssExamFamily.dhbt:
        return KpssExamTarget.dhbt;
      case KpssExamFamily.bGrubu:
      case KpssExamFamily.ekpss:
        switch (educationLevel) {
          case EducationLevel.onlisans:
            return KpssExamTarget.onlisans;
          case EducationLevel.ortaogretim:
            return KpssExamTarget.ortaogretim;
          case EducationLevel.lisans:
            return examCycleYear >= 2028
                ? KpssExamTarget.lisans2028
                : KpssExamTarget.lisans;
        }
      case KpssExamFamily.aGrubu:
      case KpssExamFamily.mebAgs:
        return examCycleYear >= 2028
            ? KpssExamTarget.lisans2028
            : KpssExamTarget.lisans;
    }
  }

  /// Veritabanı `exam_scopes` sorguları ve müfredat kayıt defteri için kanonik kapsam anahtarı.
  ///
  /// Örnekler: `'lisans_gygk'`, `'onlisans_gygk'`, `'ortaogretim_gygk'`,
  /// `'ekpss_lisans'`, `'dhbt_onlisans'`, `'meb_ags'`, `'meb_ags_oabt_tarih'`, `'a_grubu_p48'`.
  /// Not (`TASK-166`): B Grubu'nda tek profil `full_gygk` olduğu için `scopeKey`
  /// her zaman `<düzey>_gygk` döner.
  String get scopeKey {
    switch (family) {
      case KpssExamFamily.bGrubu:
        return '${educationLevel.key}_gygk';
      case KpssExamFamily.aGrubu:
        if (_isDefaultOrP48FieldSet) {
          return 'a_grubu_p48';
        }
        return 'a_grubu_custom';
      case KpssExamFamily.dhbt:
        return 'dhbt_${educationLevel.key}';
      case KpssExamFamily.mebAgs:
        if (oabtBranch == OabtBranch.none) return 'meb_ags';
        if (oabtBranch == OabtBranch.ydsDil) return 'meb_ags_yds';
        return 'meb_ags_oabt_${oabtBranch.key}';
      case KpssExamFamily.ekpss:
        return 'ekpss_${educationLevel.key}';
    }
  }

  /// Çevrimdışı indirme paketleri ve bellek önbellekleri için çakışmasız ASCII slug.
  String get curriculumNamespace {
    if (family == KpssExamFamily.aGrubu && !_isDefaultOrP48FieldSet) {
      final normalized =
          selectedFieldLessons
              .map(_slugifyAscii)
              .where((s) => s.isNotEmpty)
              .toList()
            ..sort();
      if (normalized.isNotEmpty) {
        return 'a_grubu_${normalized.join('_')}';
      }
    }
    return _slugifyAscii(scopeKey);
  }

  /// Aktif seçimin çekirdek KPSS Lisans B Grubu modu olup olmadığı (`TASK-166`).
  bool get isDefaultLisansGk =>
      family == KpssExamFamily.bGrubu &&
      educationLevel == EducationLevel.lisans;

  /// MEB-AGS seçiminde AGS + YDS (AGS-P3) rotasının aktif olup olmadığı.
  bool get includeYdsForAgsP3 =>
      family == KpssExamFamily.mebAgs && oabtBranch == OabtBranch.ydsDil;

  bool get _isDefaultOrP48FieldSet {
    if (selectedFieldLessons.isEmpty) return true;
    final selectedSet = selectedFieldLessons.toSet();
    final p48Set = defaultAGroupP48Lessons.toSet();
    return selectedSet.length == p48Set.length &&
        selectedSet.containsAll(p48Set);
  }

  /// Ana ekranda ve başlık alanlarında gösterilen tam sınav adı.
  String get displayTitle {
    switch (family) {
      case KpssExamFamily.bGrubu:
        switch (educationLevel) {
          case EducationLevel.lisans:
            return '$examCycleYear KPSS Lisans (GY-GK)';
          case EducationLevel.onlisans:
            return '$examCycleYear KPSS Ön Lisans (GY-GK)';
          case EducationLevel.ortaogretim:
            return '$examCycleYear KPSS Ortaöğretim (GY-GK)';
        }
      case KpssExamFamily.aGrubu:
        return '$examCycleYear KPSS A Grubu (Alan Bilgisi)';
      case KpssExamFamily.dhbt:
        return '$examCycleYear KPSS DHBT (${educationLevel.label})';
      case KpssExamFamily.mebAgs:
        if (oabtBranch == OabtBranch.none) {
          return '$examCycleYear MEB-AGS (P1)';
        }
        if (oabtBranch == OabtBranch.ydsDil) {
          return '$examCycleYear MEB-AGS + YDS (P3)';
        }
        return '$examCycleYear MEB-AGS · ${oabtBranch.label}';
      case KpssExamFamily.ekpss:
        return '$examCycleYear E-KPSS (${educationLevel.label})';
    }
  }

  /// Dar alanlar (rozet, AppBar alt metni) için kısa sınav etiketi.
  String get shortTitle {
    switch (family) {
      case KpssExamFamily.bGrubu:
        return '$examCycleYear KPSS ${educationLevel.label}';
      case KpssExamFamily.aGrubu:
        return '$examCycleYear KPSS A Grubu';
      case KpssExamFamily.dhbt:
        return '$examCycleYear KPSS DHBT';
      case KpssExamFamily.mebAgs:
        return oabtBranch.isOabtExam
            ? '$examCycleYear MEB-AGS / ÖABT'
            : '$examCycleYear MEB-AGS';
      case KpssExamFamily.ekpss:
        return '$examCycleYear E-KPSS';
    }
  }

  /// Kart alt başlığı olarak gösterilen açıklayıcı özet.
  String get subtitle {
    switch (family) {
      case KpssExamFamily.bGrubu:
        if (educationLevel == EducationLevel.lisans && examCycleYear >= 2028) {
          return '4 Yıllık Genel Atama Kadroları';
        }
        return educationLevel.subtitle;
      case KpssExamFamily.aGrubu:
        if (_isDefaultOrP48FieldSet) {
          return 'Kariyer Meslekleri · P48 (Hukuk-İktisat-Maliye-Muhasebe)';
        }
        return 'Kariyer Meslekleri · ${selectedFieldLessons.length} Alan Dersi';
      case KpssExamFamily.dhbt:
        return 'Din Hizmetleri Alan Bilgisi · ${educationLevel.label}';
      case KpssExamFamily.mebAgs:
        if (oabtBranch == OabtBranch.none) {
          return 'Akademi Giriş Sınavı · 1. Oturum (80 Soru)';
        }
        if (oabtBranch == OabtBranch.ydsDil) {
          return '1. Oturum (80 Soru) + YDS (%50)';
        }
        final splitText = oabtBranch.hasFieldEducationSplit
            ? '30 Alan + 20 Eğitim'
            : '50 Soru';
        return 'ÖABT · ${oabtBranch.durationMinutes} dk ($splitText)';
      case KpssExamFamily.ekpss:
        final extraText =
            includeExtraTime && disabilityGroup.standardExtraMinutes > 0
            ? ' (+${disabilityGroup.standardExtraMinutes} dk)'
            : '';
        return '${disabilityGroup.label}$extraText';
    }
  }

  /// ÖSYM sınav tarihini önce [config.examDateOverrides] haritasından en özel anahtardan
  /// en genele doğru arar; bulamazsa yerel projeksiyon tarihine düşer.
  DateTime resolveExamDate([AppRemoteConfig? config]) {
    final overrides = config?.examDateOverrides ?? const <String, DateTime>{};
    if (overrides.isNotEmpty) {
      final legacyGkScope = family == KpssExamFamily.bGrubu
          ? '${educationLevel.key}_gk'
          : null;
      final candidates = <String>[
        '${scopeKey}_$examCycleYear',
        if (legacyGkScope != null) '${legacyGkScope}_$examCycleYear',
        scopeKey,
        ?legacyGkScope,
        '${family.key}_${educationLevel.key}_$examCycleYear',
        '${family.key}_${educationLevel.key}',
        '${family.key}_$examCycleYear',
        family.key,
      ];
      for (final candidate in candidates) {
        final match = overrides[candidate];
        if (match != null) return match;
      }
    }
    return _defaultProjectedExamDate();
  }

  DateTime _defaultProjectedExamDate() {
    switch (family) {
      case KpssExamFamily.bGrubu:
        switch (educationLevel) {
          case EducationLevel.lisans:
            return examCycleYear >= 2028
                ? DateTime(examCycleYear, 9, 3, 10, 15)
                : DateTime(examCycleYear, 9, 5, 10, 15);
          case EducationLevel.onlisans:
            final year = examCycleYear.isEven ? examCycleYear : 2028;
            return DateTime(year, 10, 8, 10, 15);
          case EducationLevel.ortaogretim:
            final year = examCycleYear.isEven ? examCycleYear : 2028;
            return DateTime(year, 10, 22, 10, 15);
        }
      case KpssExamFamily.dhbt:
        final year = examCycleYear.isEven ? examCycleYear : 2028;
        return DateTime(year, 11, 5, 10, 15);
      case KpssExamFamily.aGrubu:
        return DateTime(examCycleYear, 9, 12, 10, 15);
      case KpssExamFamily.mebAgs:
        return DateTime(examCycleYear, 7, 12, 10, 15);
      case KpssExamFamily.ekpss:
        final year = examCycleYear.isEven ? examCycleYear : 2028;
        return DateTime(year, 4, 23, 10, 15);
    }
  }

  /// Hazırlık dönemi başlangıç tarihi projeksiyonu.
  DateTime resolveSeasonStart() {
    if (family == KpssExamFamily.bGrubu &&
        educationLevel == EducationLevel.lisans &&
        examCycleYear <= 2027) {
      return DateTime(2026, 9, 1);
    }
    return DateTime(2026, 10, 1);
  }

  /// Uzaktan takvim güncellemelerini dikkate alarak Yıl / Ay / Gün kırılımı üretir.
  ExamRemainingDetails detailedRemaining({
    AppRemoteConfig? config,
    DateTime? now,
  }) => calculateExamRemainingDetails(resolveExamDate(config), now);

  /// Seçili sınav için hazırlık sezonu tamamlanma oranı (0.0 – 1.0).
  double progressRatio({AppRemoteConfig? config, DateTime? now}) =>
      calculateExamProgressRatio(
        resolveSeasonStart(),
        resolveExamDate(config),
        now,
      );

  ExamSelection copyWith({
    KpssExamFamily? family,
    EducationLevel? educationLevel,
    BGroupProfile? bGroupProfile,
    OabtBranch? oabtBranch,
    DisabilityGroup? disabilityGroup,
    List<String>? selectedFieldLessons,
    int? examCycleYear,
    bool? includeExtraTime,
  }) {
    return ExamSelection(
      family: family ?? this.family,
      educationLevel: educationLevel ?? this.educationLevel,
      bGroupProfile: bGroupProfile ?? this.bGroupProfile,
      oabtBranch: oabtBranch ?? this.oabtBranch,
      disabilityGroup: disabilityGroup ?? this.disabilityGroup,
      selectedFieldLessons: selectedFieldLessons != null
          ? List<String>.unmodifiable(selectedFieldLessons)
          : this.selectedFieldLessons,
      examCycleYear: examCycleYear ?? this.examCycleYear,
      includeExtraTime: includeExtraTime ?? this.includeExtraTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family': family.key,
      'educationLevel': educationLevel.key,
      'bGroupProfile': BGroupProfile.fullGyGk.key,
      'oabtBranch': oabtBranch.key,
      'disabilityGroup': disabilityGroup.key,
      'selectedFieldLessons': selectedFieldLessons,
      'examCycleYear': examCycleYear,
      'includeExtraTime': includeExtraTime,
    };
  }

  /// Yerel JSON veya Supabase `jsonb` (`exam_selection`) verisinden güvenli ayrıştırır.
  factory ExamSelection.fromJson(Map<String, dynamic> json) {
    final rawFields =
        json['selectedFieldLessons'] ?? json['selected_field_lessons'];
    final parsedFields = rawFields is List
        ? List<String>.unmodifiable(
            rawFields
                .map((e) => e.toString().trim())
                .where((s) => s.isNotEmpty),
          )
        : const <String>[];

    final rawYear = json['examCycleYear'] ?? json['exam_cycle_year'];
    final parsedYear = rawYear is num
        ? rawYear.toInt().clamp(2024, 2040)
        : (int.tryParse(rawYear?.toString() ?? '')?.clamp(2024, 2040) ?? 2027);

    return ExamSelection(
      family: KpssExamFamily.fromKey(json['family'] as String?),
      educationLevel: EducationLevel.fromKey(
        (json['educationLevel'] ?? json['education_level']) as String?,
      ),
      bGroupProfile: BGroupProfile.fullGyGk,
      oabtBranch: OabtBranch.fromKey(
        (json['oabtBranch'] ?? json['oabt_branch']) as String?,
      ),
      disabilityGroup: DisabilityGroup.fromKey(
        (json['disabilityGroup'] ?? json['disability_group']) as String?,
      ),
      selectedFieldLessons: parsedFields,
      examCycleYear: parsedYear,
      includeExtraTime:
          (json['includeExtraTime'] ?? json['include_extra_time']) as bool? ??
          false,
    );
  }

  static String _slugifyAscii(String input) {
    final lower = input
        .toLowerCase()
        .replaceAll('ç', 'c')
        .replaceAll('ğ', 'g')
        .replaceAll('ı', 'i')
        .replaceAll('ö', 'o')
        .replaceAll('ş', 's')
        .replaceAll('ü', 'u');
    final buffer = StringBuffer();
    var lastWasUnderscore = false;
    for (final code in lower.codeUnits) {
      final isAlphaNum =
          (code >= 97 && code <= 122) || (code >= 48 && code <= 57);
      if (isAlphaNum) {
        buffer.writeCharCode(code);
        lastWasUnderscore = false;
      } else if (!lastWasUnderscore) {
        buffer.write('_');
        lastWasUnderscore = true;
      }
    }
    return buffer.toString().replaceAll(RegExp(r'^_+|_+$'), '');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExamSelection &&
        other.family == family &&
        other.educationLevel == educationLevel &&
        (family == KpssExamFamily.bGrubu ||
            other.bGroupProfile == bGroupProfile) &&
        other.oabtBranch == oabtBranch &&
        other.disabilityGroup == disabilityGroup &&
        other.examCycleYear == examCycleYear &&
        other.includeExtraTime == includeExtraTime &&
        _stringListsEqual(other.selectedFieldLessons, selectedFieldLessons);
  }

  /// Bu sınav seçimi için veritabanı veya yerel soru havuzunda kabul edilen
  /// `exam_scopes` kapsam etiketleri kümesi (`TASK-165` & `TASK-166`).
  ///
  /// Angular/Web Karşılığı: Supabase `.overlaps('exam_scopes', ...)` sorgusuna ve
  /// istemci tarafı `Question.matchesSelection` süzgecine geçilen kanonik kapsam kümesi.
  /// Not: MEB-AGS'deki `meb_ags` ortak kapsamı sorunun `subBranch` alanına bağlı olduğu
  /// için bu temel kümeye dahil edilmez (`Question.matchesSelection` içinde kontrol edilir).
  Set<String> get acceptedQuestionScopes {
    final targetScope = scopeKey.toLowerCase();
    return <String>{
      targetScope,
      '${family.key}_common',
      if (family == KpssExamFamily.bGrubu) ...{
        '${educationLevel.key}_gk',
        'b_grubu_gygk',
        'b_grubu_gk',
      },
      if (family == KpssExamFamily.dhbt) ...{'dhbt_common', 'dhbt_1'},
    };
  }

  /// `exam_scopes` alanını JSON/DB kayıtlarından güvenle okur (`TASK-138`).
  static List<String> parseExamScopes(dynamic raw) {
    if (raw is List) {
      final cleaned = raw
          .map((e) => e.toString().trim().toLowerCase())
          .where((e) => e.isNotEmpty)
          .toList(growable: false);
      if (cleaned.isNotEmpty) return cleaned;
    }
    return const ['lisans_gk'];
  }

  /// İçeriğin `examScopes` ve `subBranch` etiketlerinin bu seçimle eşleşip
  /// eşleşmediğini tek merkezden denetler (`TASK-138` & `TASK-166`).
  bool matchesContentMetadata({
    required List<String> examScopes,
    String? subBranch,
  }) {
    final normalizedScopes = examScopes
        .map((s) => s.trim().toLowerCase())
        .where((s) => s.isNotEmpty)
        .toSet();
    final effectiveScopes = normalizedScopes.isEmpty
        ? const {'lisans_gk'}
        : normalizedScopes;

    final targetScope = scopeKey.toLowerCase();
    final normalizedSubBranch = subBranch?.trim().toLowerCase();
    final hasSubBranch =
        normalizedSubBranch != null && normalizedSubBranch.isNotEmpty;

    final acceptedScopes = <String>{
      ...acceptedQuestionScopes,
      if (family == KpssExamFamily.mebAgs && oabtBranch != OabtBranch.none) ...{
        if (!hasSubBranch || normalizedSubBranch == 'meb_ags') 'meb_ags',
        if (oabtBranch.isOabtExam) ...{'meb_ags_oabt', 'oabt'},
      },
    };

    if (effectiveScopes.intersection(acceptedScopes).isEmpty) {
      return false;
    }

    if (!hasSubBranch) return true;

    switch (family) {
      case KpssExamFamily.mebAgs:
        if (oabtBranch == OabtBranch.none) {
          return normalizedSubBranch == 'meb_ags';
        }
        if (oabtBranch == OabtBranch.ydsDil) {
          return normalizedSubBranch == 'yds' ||
              normalizedSubBranch == 'meb_ags_yds' ||
              normalizedSubBranch == 'meb_ags';
        }
        return normalizedSubBranch == oabtBranch.key ||
            normalizedSubBranch == 'oabt_${oabtBranch.key}' ||
            normalizedSubBranch == 'meb_ags_oabt_${oabtBranch.key}' ||
            normalizedSubBranch == 'meb_ags';
      case KpssExamFamily.dhbt:
        return normalizedSubBranch == 'dhbt_${educationLevel.key}' ||
            normalizedSubBranch == 'dhbt_1' ||
            normalizedSubBranch == 'dhbt_common' ||
            normalizedSubBranch == targetScope;
      case KpssExamFamily.aGrubu:
        final chosenFields = selectedFieldLessons.isEmpty
            ? defaultAGroupP48Lessons
            : selectedFieldLessons;
        final acceptedFieldSlugs = chosenFields
            .map(
              (name) => 'alan_${_slugifyAscii(name.replaceFirst('Alan ', ''))}',
            )
            .toSet();
        return normalizedSubBranch == targetScope ||
            normalizedSubBranch == 'a_grubu_p48' ||
            acceptedFieldSlugs.contains(normalizedSubBranch);
      case KpssExamFamily.bGrubu:
      case KpssExamFamily.ekpss:
        return normalizedSubBranch == targetScope ||
            normalizedSubBranch == curriculumNamespace;
    }
  }

  @override
  int get hashCode => Object.hash(
    family,
    educationLevel,
    family == KpssExamFamily.bGrubu ? BGroupProfile.fullGyGk : bGroupProfile,
    oabtBranch,
    disabilityGroup,
    examCycleYear,
    includeExtraTime,
    Object.hashAll(selectedFieldLessons),
  );
}
