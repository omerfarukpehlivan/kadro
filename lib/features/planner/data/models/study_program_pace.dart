import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';

/// Seçilen günlük süre ve sınava kalan gün karşılaştırmasının sonucu.
class PaceAdvisory {
  final int remainingDays;
  final int estimatedDaysToFinish;
  final bool canFinishInTime;
  final StudyProgramPace recommendedPace;
  final List<StudyProgramPace> insufficientPaces;
  final String message;

  const PaceAdvisory({
    required this.remainingDays,
    required this.estimatedDaysToFinish,
    required this.canFinishInTime,
    required this.recommendedPace,
    required this.insufficientPaces,
    required this.message,
  });
}

/// Günlük çalışma süresine göre 5 sabit KPSS program varyasyonu.
///
/// Kullanıcı ilk kurulumda günlük ayırabileceği süreyi (`15`, `30`, `45`, `60`, `90` dk)
/// seçer; sistem mevcut müfredatı (konu testleri, bilgi kartları, harita alıştırmaları
/// ve denemeler) seçilen süreye uygun günlük görev paketlerine böler.
enum StudyProgramPace {
  dk15(
    label: '15 Dk · Mikro Ritim',
    subtitle: 'Yoğun Günlerde Hızlı Tekrar',
    dailyGoalQuestions: 10,
    estimatedMinutesPerDay: 15,
    tasksPerDay: 2,
    testsPerDayAverage: 1.0,
    badgeText: '15 Dk / Gün',
    packageSummary: '1 Konu Testi (10 Soru) + 6 Bilgi Kartı / Harita',
    description: 'Çok kısıtlı günlerde bile serini korur; günde 1 test ve kısa kart tekrarlarıyla ilerler.',
  ),
  dk30(
    label: '30 Dk · Hafif Tempo',
    subtitle: 'Sindirerek & Düzenli',
    dailyGoalQuestions: 20,
    estimatedMinutesPerDay: 30,
    tasksPerDay: 3,
    testsPerDayAverage: 1.35,
    badgeText: '30 Dk / Gün',
    packageSummary: '1 Konu Testi + 10 Bilgi Kartı + 4 Harita',
    description: 'Okul veya iş temposunda günde yarım saatle test, hap kart ve haritayı dengeli yürütür.',
  ),
  dk45(
    label: '45 Dk · Dengeli Tempo',
    subtitle: 'Planlı & İstikrarlı',
    dailyGoalQuestions: 30,
    estimatedMinutesPerDay: 45,
    tasksPerDay: 3,
    testsPerDayAverage: 2.0,
    badgeText: '45 Dk / Gün',
    packageSummary: '2 Konu Testi (20 Soru) + 12 Kart / Harita',
    description: 'Sınavı rahat yetiştirmek için her gün 2 farklı konudan test ve destekleyici tekrar içerir.',
  ),
  dk60(
    label: '60 Dk · Tam Ritim (Önerilen)',
    subtitle: '1 Saatlik İdeal KPSS Programı',
    dailyGoalQuestions: 45,
    estimatedMinutesPerDay: 60,
    tasksPerDay: 4,
    testsPerDayAverage: 2.5,
    badgeText: '60 Dk / Gün',
    packageSummary: '2–3 Konu Testi + 15 Kart + 5 Harita / Oyun',
    description: 'KPSS Lisans ve Ön Lisans için ideal günlük 1 saatlik plan; konuları hızlı ve sağlam bitirir.',
  ),
  dk90(
    label: '90 Dk · Kamp Modu',
    subtitle: 'Derece Hedefi & Yakın Sınav',
    dailyGoalQuestions: 70,
    estimatedMinutesPerDay: 90,
    tasksPerDay: 5,
    testsPerDayAverage: 4.0,
    badgeText: '90 Dk / Gün',
    packageSummary: '3–4 Test + 20 Kart + 6 Harita + Deneme / Yanlış',
    description: 'Sınava az süre kalmış veya yüksek puan hedefleyen adaylar için yoğun sprint paketi.',
  );

  final String label;
  final String subtitle;
  final int dailyGoalQuestions;
  final int estimatedMinutesPerDay;
  final int tasksPerDay;
  final double testsPerDayAverage;
  final String badgeText;
  final String packageSummary;
  final String description;

  const StudyProgramPace({
    required this.label,
    required this.subtitle,
    required this.dailyGoalQuestions,
    required this.estimatedMinutesPerDay,
    required this.tasksPerDay,
    required this.testsPerDayAverage,
    required this.badgeText,
    required this.packageSummary,
    required this.description,
  });

  /// Verilen toplam test sayısına göre bu çalışma temposunda tahmini bitiş gününü döner.
  int estimatedDaysForTests(int totalTests) {
    if (totalTests <= 0) return 0;
    return (totalTests / testsPerDayAverage).ceil();
  }

  /// Müfredattaki tüm 10 soruluk testleri tamamlamak için gereken tahmini gün sayısı.
  int get estimatedCompletionDays =>
      estimatedDaysForTests(totalCurriculumTestCount);

  /// Enum anahtarından veya eski sürüm değerlerinden (`hafif`/`orta`/`hizli`) dönüşüm yapar.
  static StudyProgramPace fromKey(String? key) {
    switch (key) {
      case 'dk15':
        return StudyProgramPace.dk15;
      case 'dk30':
      case 'hafif':
        return StudyProgramPace.dk30;
      case 'dk45':
        return StudyProgramPace.dk45;
      case 'dk60':
      case 'orta':
        return StudyProgramPace.dk60;
      case 'dk90':
      case 'hizli':
        return StudyProgramPace.dk90;
      default:
        return StudyProgramPace.dk60;
    }
  }

  /// Seçili sınava ve opsiyonel aktif müfredata göre gerçek içerik bitirme süresi ve
  /// akıllı tavsiye üretir.
  /// Seçilen çok boyutlu [ExamSelection] ve müfredat hacmine göre yetiştirme tavsiyesi üretir.
  PaceAdvisory evaluateScheduleForSelection(
    ExamSelection selection, {
    DateTime? now,
    ExamCurriculum? curriculum,
  }) {
    final remaining = selection
        .detailedRemaining(now: now)
        .totalDays
        .clamp(1, 9999);
    return _evaluateForDays(remaining, curriculum: curriculum);
  }

  /// Sınava kalan gerçek gün sayısını seçili hızın bitirme süresiyle kıyaslayıp
  /// akıllı tavsiye üretir.
  PaceAdvisory evaluateSchedule(
    KpssExamTarget target, {
    DateTime? now,
    ExamCurriculum? curriculum,
  }) {
    final remaining = target.remainingDays(now).clamp(1, 9999);
    return _evaluateForDays(remaining, curriculum: curriculum);
  }

  PaceAdvisory _evaluateForDays(int remaining, {ExamCurriculum? curriculum}) {
    final totalTests = curriculum?.totalTestCount ?? totalCurriculumTestCount;
    final finishDays = estimatedDaysForTests(totalTests);

    final insufficient = StudyProgramPace.values
        .where((p) => p.estimatedDaysForTests(totalTests) > remaining)
        .toList();

    StudyProgramPace recommended = StudyProgramPace.dk90;
    for (final p in StudyProgramPace.values) {
      if (p.estimatedDaysForTests(totalTests) <= remaining) {
        recommended = p;
        break;
      }
    }

    final canFinish = finishDays <= remaining;
    final String msg;

    if (!canFinish) {
      if (insufficient.length > 1 && this != StudyProgramPace.dk90) {
        final minsList = insufficient
            .take(insufficient.length > 3 ? 3 : insufficient.length)
            .map((p) => '${p.estimatedMinutesPerDay}')
            .join(', ');
        msg =
            'Sınava $remaining gün kaldı; $minsList dk çalışma ile tüm konuları ($totalTests test) yetiştiremezsiniz (~$finishDays gün sürer). En az ${recommended.estimatedMinutesPerDay} dk modunu öneririz.';
      } else if (this == StudyProgramPace.dk90) {
        msg =
            'Sınava $remaining gün kaldı; tüm müfredat ($totalTests test) yoğun tempoda ~$finishDays gün sürer. 90 Dk Kamp Modu ile zayıf derslere odaklanmanı öneririz.';
      } else {
        msg =
            'Sınava $remaining gün kaldı; günde $estimatedMinutesPerDay dk ile konular ~$finishDays günde biter. Yetiştirmek için ${recommended.estimatedMinutesPerDay} dk temposuna geçmeni öneririz.';
      }
    } else {
      final safeFinishDays = finishDays <= 0 ? 1 : finishDays;
      final potentialTours = (remaining / safeFinishDays).floor().clamp(1, 20);
      msg =
          'Sınava $remaining gün kala: Günde $estimatedMinutesPerDay dk ile $totalTests test ~$finishDays günde tamamlanır; sınava kadar ~$potentialTours tam tur tekrar yapılabilir.';
    }

    return PaceAdvisory(
      remainingDays: remaining,
      estimatedDaysToFinish: finishDays,
      canFinishInTime: canFinish,
      recommendedPace: recommended,
      insufficientPaces: insufficient,
      message: msg,
    );
  }

  /// Sınava kalan süreye göre okunabilir özet metni döner.
  String calculatePacingSummary(
    KpssExamTarget target, {
    DateTime? now,
    ExamCurriculum? curriculum,
  }) => evaluateSchedule(target, now: now, curriculum: curriculum).message;
}
