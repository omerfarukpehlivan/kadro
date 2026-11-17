import 'package:flutter/foundation.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Çoklu ders veya tek oturumluk deneme sınavının tek bir bölüm/ders dilimini tanımlar.
///
/// Angular/Web Karşılığı: Dinamik deneme oluşturucusuna (`MockExamBuilderService`)
/// geçilen `ExamSectionConfig` şema parçası.
@immutable
class ExamSectionSpec {
  final String id;
  final String lesson;
  final String title;
  final int questionCount;
  final String? topicFilter;
  final String? subBranch;

  const ExamSectionSpec({
    required this.id,
    required this.lesson,
    required this.title,
    required this.questionCount,
    this.topicFilter,
    this.subBranch,
  });
}

/// Oluşturulmuş bir deneme sınavı içinde hangi soru aralıklarının hangi bölüme
/// ait olduğunu tutan palet hızlı geçiş (quick-jump) haritası.
@immutable
class BlueprintSectionRange {
  final ExamSectionSpec section;

  /// Flattened soru listesindeki başlangıç indeksi (dahil, 0-tabanlı).
  final int startIndex;

  /// Flattened soru listesindeki bitiş indeksi (hariç, 0-tabanlı).
  final int endIndex;

  const BlueprintSectionRange({
    required this.section,
    required this.startIndex,
    required this.endIndex,
  });

  int get actualCount => endIndex - startIndex;

  bool get isComplete => actualCount >= section.questionCount;
}

/// Şablondan üretilen soru listesini, bölüm sınırlarını ve eksik/yetersiz
/// havuz raporunu bir arada döndüren sonuç nesnesi.
@immutable
class GeneratedBlueprintExam {
  final MockExamBlueprint blueprint;
  final List<Question> questions;
  final List<BlueprintSectionRange> sectionRanges;

  /// Hiç soru bulunamayan bölüm başlıkları (ör. `['Türkçe', 'Matematik & Geometri']`).
  final List<String> missingSections;

  /// Hedef soru sayısının altında kalan bölümler (`bölümAdı -> mevcutSoru`).
  final Map<String, int> partialSections;

  const GeneratedBlueprintExam({
    required this.blueprint,
    required this.questions,
    required this.sectionRanges,
    this.missingSections = const [],
    this.partialSections = const {},
  });

  bool get hasMissingSections => missingSections.isNotEmpty;

  bool get hasShortfalls =>
      missingSections.isNotEmpty || partialSections.isNotEmpty;

  /// Verilen 0-tabanlı soru indeksinin hangi [sectionRanges] dilimine düştüğünü döner.
  int sectionIndexForQuestion(int questionIndex) {
    for (var i = 0; i < sectionRanges.length; i++) {
      final range = sectionRanges[i];
      if (questionIndex >= range.startIndex && questionIndex < range.endIndex) {
        return i;
      }
    }
    return 0;
  }
}

/// ÖSYM sınav mimarisine göre kaç bölümden, hangi ders dağılımından ve kaç dakikadan
/// oluşan bir deneme sınavı üretileceğini tarif eden değişmez (immutable) şablon.
///
/// Angular/Web Karşılığı: Sabit kodlanmış "60 soru / 65 dakika" kontrollerinin yerini
/// alan `MockExamBlueprint` yapılandırma nesnesi.
@immutable
class MockExamBlueprint {
  final String id;
  final String title;
  final String subtitle;
  final String badgeLabel;
  final String primaryButtonLabel;
  final KpssExamFamily family;
  final String scopeKey;
  final List<ExamSectionSpec> sections;
  final int standardDurationMinutes;
  final int? mockNumber;
  final bool isPrimaryFullExam;
  final bool isMiniPractice;
  final bool isProOnly;
  final bool supportsExtraTime;

  const MockExamBlueprint({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.badgeLabel,
    this.primaryButtonLabel = 'Denemeyi Başlat',
    required this.family,
    required this.scopeKey,
    required this.sections,
    required this.standardDurationMinutes,
    this.mockNumber,
    this.isPrimaryFullExam = false,
    this.isMiniPractice = false,
    this.isProOnly = false,
    this.supportsExtraTime = false,
  });

  /// Şablondaki tüm bölümlerin toplam hedef soru sayısı.
  int get totalQuestionCount =>
      sections.fold<int>(0, (sum, section) => sum + section.questionCount);

  /// Sınav paletinde bölüm hızlı geçiş sekmelerinin gösterilip gösterilmeyeceği.
  bool get isMultiSection => sections.length > 1;

  /// Seçilen sınav profiline (özellikle E-KPSS engel grubuna) göre ek süreyi hesaplar.
  int extraMinutesFor(
    ExamSelection selection, {
    bool? applyExtraTime,
    int? customExtraMinutes,
  }) {
    final enabled = applyExtraTime ?? selection.includeExtraTime;
    if (!enabled) return 0;
    if (customExtraMinutes != null && customExtraMinutes >= 0) {
      return customExtraMinutes;
    }
    if (selection.family == KpssExamFamily.ekpss || supportsExtraTime) {
      final standard = selection.disabilityGroup.standardExtraMinutes;
      return standard > 0 ? standard : 20;
    }
    return 0;
  }

  /// Standart süre ve aktifse ek süre toplamını [Duration] olarak döner.
  Duration resolveDuration(
    ExamSelection selection, {
    bool? applyExtraTime,
    int? customExtraMinutes,
  }) {
    final extra = extraMinutesFor(
      selection,
      applyExtraTime: applyExtraTime,
      customExtraMinutes: customExtraMinutes,
    );
    return Duration(minutes: standardDurationMinutes + extra);
  }
}

/// Kullanıcının seçtiği [ExamSelection] profiline uygun deneme şablonlarını
/// deterministik olarak üreten kayıt defteri.
///
/// Angular/Web Karşılığı: Aktif sınav ailesine göre deneme listesini çözümleyen
/// `ExamBlueprintRegistry` fabrika servisi.
class ExamBlueprintRegistry {
  ExamBlueprintRegistry._();

  static const List<ExamSectionSpec> _bGroupGkSections = [
    ExamSectionSpec(
      id: 'tarih',
      lesson: 'Tarih',
      title: 'Tarih',
      questionCount: 27,
    ),
    ExamSectionSpec(
      id: 'cografya',
      lesson: 'Coğrafya',
      title: 'Coğrafya',
      questionCount: 18,
    ),
    ExamSectionSpec(
      id: 'vatandaslik',
      lesson: 'Vatandaşlık',
      title: 'Vatandaşlık',
      questionCount: 9,
    ),
    ExamSectionSpec(
      id: 'guncel',
      lesson: 'Güncel Bilgiler',
      title: 'Güncel',
      questionCount: 6,
    ),
  ];

  static const List<ExamSectionSpec> _bGroupGyGkSections = [
    ExamSectionSpec(
      id: 'turkce',
      lesson: 'Türkçe',
      title: 'Türkçe',
      questionCount: 30,
    ),
    ExamSectionSpec(
      id: 'matematik',
      lesson: 'Matematik & Geometri',
      title: 'Matematik',
      questionCount: 30,
    ),
    ..._bGroupGkSections,
  ];

  /// Klasik KPSS Lisans/Ortak Genel Kültür 60 soru / 65 dk şablonunu üretir.
  static MockExamBlueprint generalCultureTrial({
    int examNumber = 1,
    ExamSelection selection = ExamSelection.initial,
  }) {
    final isFirst = examNumber == 1;
    return MockExamBlueprint(
      id: 'gk_deneme_$examNumber',
      title: 'Türkiye Geneli GK Provası #$examNumber',
      subtitle: isFirst
          ? 'Tarih (27), Coğrafya (18), Vatandaşlık (9) ve Güncel Bilgiler (6) karma sınavı'
          : examNumber == 2
          ? 'Tarih ve Coğrafya ağırlıklı zorlu ÖSYM simülasyon paketi'
          : 'Güncel mevzuat ve çeldiricisi güçlü karma genel tekrar sınavı',
      badgeLabel: isFirst
          ? 'ÖSYM Standardı (Ücretsiz)'
          : 'ÖSYM Prova #$examNumber',
      primaryButtonLabel: 'Genel Kültür Denemesi Başlat',
      family: selection.family,
      scopeKey: selection.scopeKey,
      sections: _bGroupGkSections,
      standardDurationMinutes: 65,
      mockNumber: examNumber,
      isPrimaryFullExam: isFirst,
      isProOnly: !isFirst,
    );
  }

  /// Seçili sınav profiline ait ana deneme sınavı kartlarını döner.
  static List<MockExamBlueprint> forSelection(
    ExamSelection selection, {
    ExamCurriculum? curriculum,
  }) {
    switch (selection.family) {
      case KpssExamFamily.bGrubu:
        if (selection.bGroupProfile == BGroupProfile.fullGyGk) {
          return [
            MockExamBlueprint(
              id: 'b_gygk_tam_1',
              title: '${selection.educationLevel.label} Tam GY-GK Deneme #1',
              subtitle: '30 Türkçe · 30 Matematik · 27 Tarih · 18 Coğrafya · 9 Vatandaşlık · 6 Güncel',
              badgeLabel: 'ÖSYM Tam Oturum (Ücretsiz)',
              primaryButtonLabel: 'Tam GY-GK Denemesi Başlat',
              family: selection.family,
              scopeKey: selection.scopeKey,
              sections: _bGroupGyGkSections,
              standardDurationMinutes: 130,
              mockNumber: 1,
              isPrimaryFullExam: true,
            ),
            MockExamBlueprint(
              id: 'b_gygk_tam_2',
              title: '${selection.educationLevel.label} Tam GY-GK Deneme #2',
              subtitle: 'Zaman yönetimi ve tam oturum dayanıklılığı için ikinci tam deneme',
              badgeLabel: 'ÖSYM Tam Prova #2',
              primaryButtonLabel: 'Tam GY-GK Başlat',
              family: selection.family,
              scopeKey: selection.scopeKey,
              sections: _bGroupGyGkSections,
              standardDurationMinutes: 130,
              mockNumber: 2,
              isProOnly: true,
            ),
            MockExamBlueprint(
              id: 'b_gk_oturum_1',
              title: 'Genel Kültür Bölümü Denemesi #1',
              subtitle: 'Sadece 60 soruluk GK oturumu (Hazır soru havuzuyla tam uyumlu)',
              badgeLabel: 'Hazır Havuz · 65 dk',
              primaryButtonLabel: 'Genel Kültür Denemesi Başlat',
              family: selection.family,
              scopeKey: '${selection.educationLevel.key}_gk',
              sections: _bGroupGkSections,
              standardDurationMinutes: 65,
              mockNumber: 1,
            ),
            MockExamBlueprint(
              id: 'b_gk_sprint_15',
              title: '15 Dakika Hızlı Mola Denemesi',
              subtitle: 'Tarih, Coğrafya ve Güncel konularından 15 soruluk mini prova',
              badgeLabel: '15 Soru · 15 dk',
              primaryButtonLabel: 'Hızlı Mola Başlat',
              family: selection.family,
              scopeKey: '${selection.educationLevel.key}_gk',
              sections: const [
                ExamSectionSpec(
                  id: 'tarih',
                  lesson: 'Tarih',
                  title: 'Tarih',
                  questionCount: 6,
                ),
                ExamSectionSpec(
                  id: 'cografya',
                  lesson: 'Coğrafya',
                  title: 'Coğrafya',
                  questionCount: 4,
                ),
                ExamSectionSpec(
                  id: 'vatandaslik',
                  lesson: 'Vatandaşlık',
                  title: 'Vatandaşlık',
                  questionCount: 3,
                ),
                ExamSectionSpec(
                  id: 'guncel',
                  lesson: 'Güncel Bilgiler',
                  title: 'Güncel',
                  questionCount: 2,
                ),
              ],
              standardDurationMinutes: 15,
              mockNumber: 3,
              isMiniPractice: true,
            ),
          ];
        }
        return [
          generalCultureTrial(examNumber: 1, selection: selection),
          generalCultureTrial(examNumber: 2, selection: selection),
          generalCultureTrial(examNumber: 3, selection: selection),
          MockExamBlueprint(
            id: 'b_gk_tarih_cografya_kamp',
            title: 'Tarih & Coğrafya Kamp Denemesi',
            subtitle:
                'Sınavın en yüksek ağırlıklı 45 sorusu (Tarih + Coğrafya)',
            badgeLabel: '45 Soru · 40 dk',
            primaryButtonLabel: 'Kamp Denemesi Başlat',
            family: selection.family,
            scopeKey: selection.scopeKey,
            sections: const [
              ExamSectionSpec(
                id: 'tarih',
                lesson: 'Tarih',
                title: 'Tarih',
                questionCount: 27,
              ),
              ExamSectionSpec(
                id: 'cografya',
                lesson: 'Coğrafya',
                title: 'Coğrafya',
                questionCount: 18,
              ),
            ],
            standardDurationMinutes: 40,
            mockNumber: 1,
          ),
          MockExamBlueprint(
            id: 'b_gk_sprint_15',
            title: '15 Dakika Hızlı Mola Denemesi',
            subtitle:
                'Tarih, Coğrafya ve Güncel konularından 15 soruluk mini prova',
            badgeLabel: '15 Soru · 15 dk',
            primaryButtonLabel: 'Hızlı Mola Başlat',
            family: selection.family,
            scopeKey: selection.scopeKey,
            sections: const [
              ExamSectionSpec(
                id: 'tarih',
                lesson: 'Tarih',
                title: 'Tarih',
                questionCount: 6,
              ),
              ExamSectionSpec(
                id: 'cografya',
                lesson: 'Coğrafya',
                title: 'Coğrafya',
                questionCount: 4,
              ),
              ExamSectionSpec(
                id: 'vatandaslik',
                lesson: 'Vatandaşlık',
                title: 'Vatandaşlık',
                questionCount: 3,
              ),
              ExamSectionSpec(
                id: 'guncel',
                lesson: 'Güncel Bilgiler',
                title: 'Güncel',
                questionCount: 2,
              ),
            ],
            standardDurationMinutes: 15,
            mockNumber: 3,
            isMiniPractice: true,
          ),
        ];

      case KpssExamFamily.ekpss:
        const ekpssSections = [
          ExamSectionSpec(
            id: 'turkce',
            lesson: 'Türkçe',
            title: 'Türkçe',
            questionCount: 15,
          ),
          ExamSectionSpec(
            id: 'matematik',
            lesson: 'Matematik',
            title: 'Matematik',
            questionCount: 15,
          ),
          ExamSectionSpec(
            id: 'tarih',
            lesson: 'Tarih',
            title: 'Tarih',
            questionCount: 13,
          ),
          ExamSectionSpec(
            id: 'cografya',
            lesson: 'Coğrafya',
            title: 'Coğrafya',
            questionCount: 5,
          ),
          ExamSectionSpec(
            id: 'vatandaslik',
            lesson: 'Vatandaşlık',
            title: 'Vatandaşlık',
            questionCount: 6,
          ),
          ExamSectionSpec(
            id: 'guncel',
            lesson: 'Güncel Bilgiler',
            title: 'Güncel',
            questionCount: 6,
          ),
        ];
        final extraText = selection.disabilityGroup.standardExtraMinutes > 0
            ? ' (+${selection.disabilityGroup.standardExtraMinutes} dk Ek Süre)'
            : '';
        return [
          MockExamBlueprint(
            id: 'ekpss_deneme_1',
            title: 'E-KPSS ${selection.educationLevel.label} Denemesi #1',
            subtitle:
                '30 Genel Yetenek + 30 Genel Kültür · ${selection.disabilityGroup.label}$extraText',
            badgeLabel: 'E-KPSS Standardı (Ücretsiz)',
            primaryButtonLabel: 'E-KPSS Denemesi Başlat',
            family: selection.family,
            scopeKey: selection.scopeKey,
            sections: ekpssSections,
            standardDurationMinutes: 60,
            mockNumber: 1,
            isPrimaryFullExam: true,
            supportsExtraTime: true,
          ),
          MockExamBlueprint(
            id: 'ekpss_deneme_2',
            title: 'E-KPSS ${selection.educationLevel.label} Denemesi #2',
            subtitle: 'Uyarlanmış kitapçık ve yüksek okunabilirlik desteğiyle tam prova',
            badgeLabel: 'E-KPSS Prova #2',
            primaryButtonLabel: 'E-KPSS Denemesi Başlat',
            family: selection.family,
            scopeKey: selection.scopeKey,
            sections: ekpssSections,
            standardDurationMinutes: 60,
            mockNumber: 2,
            isProOnly: true,
            supportsExtraTime: true,
          ),
        ];

      case KpssExamFamily.dhbt:
        const dhbtSections = [
          ExamSectionSpec(
            id: 'dhbt_1',
            lesson: 'DHBT-1 (Ortak Temel İslam)',
            title: 'DHBT-1',
            questionCount: 20,
          ),
          ExamSectionSpec(
            id: 'dhbt_2',
            lesson: 'DHBT-2 (Öğrenim Düzeyi)',
            title: 'DHBT-2',
            questionCount: 20,
          ),
        ];
        return [
          MockExamBlueprint(
            id: 'dhbt_deneme_1',
            title: 'DHBT ${selection.educationLevel.label} Denemesi #1',
            subtitle: '20 DHBT-1 Ortak Temel İslam + 20 DHBT-2 Düzey Alanı',
            badgeLabel: 'DHBT Standardı (Ücretsiz)',
            primaryButtonLabel: 'DHBT Denemesi Başlat',
            family: selection.family,
            scopeKey: selection.scopeKey,
            sections: dhbtSections,
            standardDurationMinutes: 60,
            mockNumber: 1,
            isPrimaryFullExam: true,
          ),
          MockExamBlueprint(
            id: 'dhbt_gk_kopru',
            title: 'Ortak KPSS Genel Kültür Provası #1',
            subtitle:
                'P122/P123/P124 için %15 GK katkılı hazır 60 soruluk sınav',
            badgeLabel: 'Ortak GK · 65 dk',
            primaryButtonLabel: 'Genel Kültür Denemesi Başlat',
            family: KpssExamFamily.bGrubu,
            scopeKey: '${selection.educationLevel.key}_gk',
            sections: _bGroupGkSections,
            standardDurationMinutes: 65,
            mockNumber: 1,
          ),
        ];

      case KpssExamFamily.mebAgs:
        const ags1Sections = [
          ExamSectionSpec(
            id: 'sozel',
            lesson: 'Sözel Yetenek',
            title: 'Sözel',
            questionCount: 15,
          ),
          ExamSectionSpec(
            id: 'sayisal',
            lesson: 'Sayısal Yetenek',
            title: 'Sayısal',
            questionCount: 15,
          ),
          ExamSectionSpec(
            id: 'tarih',
            lesson: 'Tarih',
            title: 'Tarih',
            questionCount: 6,
          ),
          ExamSectionSpec(
            id: 'cografya',
            lesson: 'Türkiye Coğrafyası',
            title: 'Coğrafya',
            questionCount: 6,
          ),
          ExamSectionSpec(
            id: 'egitim_tymm',
            lesson: 'Eğitimin Temelleri & TYMM',
            title: 'Eğitim & TYMM',
            questionCount: 30,
          ),
          ExamSectionSpec(
            id: 'mevzuat',
            lesson: 'Mevzuat',
            title: 'Mevzuat',
            questionCount: 8,
          ),
        ];
        final list = <MockExamBlueprint>[
          MockExamBlueprint(
            id: 'meb_ags_oturum_1',
            title: 'MEB-AGS 1. Oturum Denemesi #1',
            subtitle: 'Sözel (15) · Sayısal (15) · Tarih (6) · Coğrafya (6) · Eğitim & TYMM (30) · Mevzuat (8)',
            badgeLabel: 'AGS 1. Oturum · 110 dk',
            primaryButtonLabel: 'AGS 1. Oturumu Başlat',
            family: selection.family,
            scopeKey: 'meb_ags',
            sections: ags1Sections,
            standardDurationMinutes: 110,
            mockNumber: 1,
            isPrimaryFullExam: !selection.oabtBranch.isOabtExam,
          ),
        ];
        if (selection.oabtBranch.isOabtExam) {
          final branchLesson = 'ÖABT ${selection.oabtBranch.label}';
          list.insert(
            0,
            MockExamBlueprint(
              id: 'meb_oabt_${selection.oabtBranch.key}',
              title: '${selection.oabtBranch.label} ÖABT Denemesi #1',
              subtitle: selection.oabtBranch.hasFieldEducationSplit
                  ? '30 Alan Bilgisi + 20 Alan Eğitimi (50 Soru)'
                  : '50 Soruluk Branş Alan Bilgisi Testi',
              badgeLabel: 'ÖABT · ${selection.oabtBranch.durationMinutes} dk',
              primaryButtonLabel: 'ÖABT Denemesi Başlat',
              family: selection.family,
              scopeKey: selection.scopeKey,
              sections: selection.oabtBranch.hasFieldEducationSplit
                  ? [
                      ExamSectionSpec(
                        id: 'oabt_alan_bilgisi',
                        lesson: branchLesson,
                        title: 'Alan Bilgisi',
                        questionCount: 30,
                        subBranch: 'oabt_${selection.oabtBranch.key}',
                      ),
                      ExamSectionSpec(
                        id: 'oabt_alan_egitimi',
                        lesson: branchLesson,
                        title: 'Alan Eğitimi',
                        questionCount: 20,
                        topicFilter: 'Alan Eğitimi',
                        subBranch: 'oabt_${selection.oabtBranch.key}',
                      ),
                    ]
                  : [
                      ExamSectionSpec(
                        id: 'oabt_alan',
                        lesson: branchLesson,
                        title: selection.oabtBranch.label,
                        questionCount: 50,
                        subBranch: 'oabt_${selection.oabtBranch.key}',
                      ),
                    ],
              standardDurationMinutes: selection.oabtBranch.durationMinutes,
              mockNumber: 1,
              isPrimaryFullExam: true,
            ),
          );
        }
        return list;

      case KpssExamFamily.aGrubu:
        final chosenFields = selection.selectedFieldLessons.isNotEmpty
            ? selection.selectedFieldLessons
            : ExamSelection.defaultAGroupP48Lessons;
        return [
          for (var i = 0; i < chosenFields.length; i++)
            MockExamBlueprint(
              id: 'a_grubu_alan_$i',
              title: '${chosenFields[i]} Alan Sınavı #1',
              subtitle: 'ÖSYM A Grubu 40 soruluk tekil alan testi simülasyonu',
              badgeLabel:
                  'A Grubu · ${chosenFields[i].toLowerCase().contains('istatistik') ? 60 : 50} dk',
              primaryButtonLabel: '${chosenFields[i]} Başlat',
              family: selection.family,
              scopeKey: selection.scopeKey,
              sections: [
                ExamSectionSpec(
                  id: 'alan_$i',
                  lesson: chosenFields[i],
                  title: chosenFields[i].replaceFirst('Alan ', ''),
                  questionCount: 40,
                ),
              ],
              standardDurationMinutes:
                  chosenFields[i].toLowerCase().contains('istatistik')
                  ? 60
                  : 50,
              mockNumber: 1,
              isPrimaryFullExam: i == 0,
            ),
          const MockExamBlueprint(
            id: 'a_grubu_gk_kopru',
            title: 'Ortak Genel Kültür Provası #1',
            subtitle: 'A Grubu puan türleri için hazır 60 soruluk GK oturumu',
            badgeLabel: 'Ortak GK · 65 dk',
            primaryButtonLabel: 'Genel Kültür Denemesi Başlat',
            family: KpssExamFamily.bGrubu,
            scopeKey: 'lisans_gk',
            sections: _bGroupGkSections,
            standardDurationMinutes: 65,
            mockNumber: 1,
          ),
        ];
    }
  }

  /// Seçili sınavın birincil tam deneme şablonunu döner.
  static MockExamBlueprint primaryFullExamFor(
    ExamSelection selection, {
    ExamCurriculum? curriculum,
  }) {
    final candidates = forSelection(selection, curriculum: curriculum);
    for (final blueprint in candidates) {
      if (blueprint.isPrimaryFullExam) return blueprint;
    }
    return candidates.first;
  }

  /// Pratik Merkezi deneme seçici sheet'i için şablon listesini döner.
  static List<MockExamBlueprint> practicePacksFor(
    ExamSelection selection, {
    ExamCurriculum? curriculum,
  }) {
    if (selection.family == KpssExamFamily.bGrubu &&
        selection.bGroupProfile == BGroupProfile.onlyGk) {
      final base1 = generalCultureTrial(examNumber: 1, selection: selection);
      return [
        MockExamBlueprint(
          id: 'practice_gk_1',
          title: 'Genel Kültür Denemesi #1',
          subtitle: '60 Soru · 65 Dakika (ÖSYM Standart Dağılım)',
          badgeLabel: '60 Soru · 65 dk',
          family: selection.family,
          scopeKey: selection.scopeKey,
          sections: _bGroupGkSections,
          standardDurationMinutes: 65,
          mockNumber: 1,
          isPrimaryFullExam: true,
        ),
        MockExamBlueprint(
          id: 'practice_gk_2',
          title: 'Genel Kültür Denemesi #2',
          subtitle: '60 Soru · 65 Dakika (Alternatif Konu Dengesi)',
          badgeLabel: '60 Soru · 65 dk',
          family: selection.family,
          scopeKey: selection.scopeKey,
          sections: _bGroupGkSections,
          standardDurationMinutes: 65,
          mockNumber: 2,
          isProOnly: true,
        ),
        MockExamBlueprint(
          id: 'practice_gk_3',
          title: 'Genel Kültür Denemesi #3',
          subtitle: '60 Soru · 65 Dakika (Zorlayıcı Karma Paket)',
          badgeLabel: '60 Soru · 65 dk',
          family: selection.family,
          scopeKey: selection.scopeKey,
          sections: _bGroupGkSections,
          standardDurationMinutes: 65,
          mockNumber: 3,
          isProOnly: true,
        ),
        _scaleBlueprint(
          base: base1,
          id: 'practice_gk_mini',
          title: 'Hızlı Mini Deneme',
          subtitle: '20 Soru · 20 Dakika (Karma Hızlı Tekrar)',
          badgeLabel: '20 Soru · 20 dk',
          targetTotal: 20,
          durationMinutes: 20,
          mockNumber: 2,
        ),
      ];
    }

    final primary = primaryFullExamFor(selection, curriculum: curriculum);
    final available = forSelection(
      selection,
      curriculum: curriculum,
    ).where((b) => !b.isMiniPractice).toList(growable: false);
    return [
      ...available,
      _scaleBlueprint(
        base: primary,
        id: '${primary.id}_mini_20',
        title: 'Hızlı Mini Deneme',
        subtitle:
            '20 Soru · 20 Dakika (${primary.sections.length} Bölümlü Karma)',
        badgeLabel: '20 Soru · 20 dk',
        targetTotal: 20,
        durationMinutes: 20,
        mockNumber: 2,
      ),
    ];
  }

  static MockExamBlueprint _scaleBlueprint({
    required MockExamBlueprint base,
    required String id,
    required String title,
    required String subtitle,
    required String badgeLabel,
    required int targetTotal,
    required int durationMinutes,
    required int mockNumber,
  }) {
    final baseTotal = base.totalQuestionCount;
    if (base.sections.isEmpty || baseTotal <= 0) {
      return base;
    }

    final allocations = <int>[];
    var assigned = 0;
    for (var i = 0; i < base.sections.length; i++) {
      final raw = ((base.sections[i].questionCount / baseTotal) * targetTotal)
          .round();
      final count = raw < 1 ? 1 : raw;
      allocations.add(count);
      assigned += count;
    }

    while (assigned != targetTotal && allocations.isNotEmpty) {
      var targetIdx = 0;
      for (var i = 1; i < allocations.length; i++) {
        if (assigned > targetTotal && allocations[i] > allocations[targetIdx]) {
          targetIdx = i;
        } else if (assigned < targetTotal &&
            base.sections[i].questionCount >
                base.sections[targetIdx].questionCount) {
          targetIdx = i;
        }
      }
      if (assigned > targetTotal) {
        if (allocations[targetIdx] <= 1) break;
        allocations[targetIdx] -= 1;
        assigned -= 1;
      } else {
        allocations[targetIdx] += 1;
        assigned += 1;
      }
    }

    final scaledSections = [
      for (var i = 0; i < base.sections.length; i++)
        ExamSectionSpec(
          id: base.sections[i].id,
          lesson: base.sections[i].lesson,
          title: base.sections[i].title,
          questionCount: allocations[i],
          topicFilter: base.sections[i].topicFilter,
          subBranch: base.sections[i].subBranch,
        ),
    ];

    return MockExamBlueprint(
      id: id,
      title: title,
      subtitle: subtitle,
      badgeLabel: badgeLabel,
      family: base.family,
      scopeKey: base.scopeKey,
      sections: scaledSections,
      standardDurationMinutes: durationMinutes,
      mockNumber: mockNumber,
      isMiniPractice: true,
      supportsExtraTime: base.supportsExtraTime,
    );
  }
}
