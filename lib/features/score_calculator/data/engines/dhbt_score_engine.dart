import 'dart:math' as math;

import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';

/// KPSS DHBT (`KPSSP122`, `KPSSP123`, `KPSSP124`) puan hesaplama motoru (`TASK-135`).
///
/// ÖSYM ağırlık dağılımı: `%15 GY (60) + %15 GK (60) + %30 DHBT-1 (20) + %40 DHBT-2 (20)`.
/// Angular/Web Karşılığı: DHBT dört oturum netlerini birleştiren `DhbtCalculatorService`.
class DhbtScoreEngine implements ScoreFormulaEngine {
  static const int maxGyGkQuestions = 60;
  static const int maxDhbtSectionQuestions = 20;

  const DhbtScoreEngine();

  @override
  ScoreEngineMode get mode => ScoreEngineMode.dhbt;

  @override
  List<ScoreInputField> fieldsFor(ExamSelection selection) => [
    const ScoreInputField(
      key: 'gy',
      label: 'Genel Yetenek (GY)',
      subtitle: 'KPSS Sabah Oturumu · %15 Ağırlık',
      maxQuestions: maxGyGkQuestions,
    ),
    const ScoreInputField(
      key: 'gk',
      label: 'Genel Kültür (GK)',
      subtitle: 'KPSS Sabah Oturumu · %15 Ağırlık',
      maxQuestions: maxGyGkQuestions,
    ),
    const ScoreInputField(
      key: 'dhbt1',
      label: 'DHBT-1 (Temel Alan)',
      subtitle: 'Ortak Temel Din Bilgisi · %30 Ağırlık',
      maxQuestions: maxDhbtSectionQuestions,
    ),
    ScoreInputField(
      key: 'dhbt2',
      label: 'DHBT-2 (${_levelTitle(selection.educationLevel)})',
      subtitle: 'Öğrenim Düzeyine Göre Alan · %40 Ağırlık',
      maxQuestions: maxDhbtSectionQuestions,
    ),
  ];

  static String _levelTitle(EducationLevel level) {
    switch (level) {
      case EducationLevel.ortaogretim:
        return 'İHL / Ortaöğretim';
      case EducationLevel.onlisans:
        return 'Ön Lisans';
      case EducationLevel.lisans:
        return 'Lisans İlahiyat';
    }
  }

  @override
  ScoreEngineCalculationResult calculate({
    required ExamSelection selection,
    required Map<String, ScoreSectionInput> inputs,
  }) {
    final gyCount = ScoreFormulaEngine.clampForMax(
      inputs['gy'],
      maxGyGkQuestions,
    );
    final gkCount = ScoreFormulaEngine.clampForMax(
      inputs['gk'],
      maxGyGkQuestions,
    );
    final dhbt1Count = ScoreFormulaEngine.clampForMax(
      inputs['dhbt1'],
      maxDhbtSectionQuestions,
    );
    final dhbt2Count = ScoreFormulaEngine.clampForMax(
      inputs['dhbt2'],
      maxDhbtSectionQuestions,
    );

    final hasGyGk = gyCount.net >= 1.0 || gkCount.net >= 1.0;
    final hasDhbt = dhbt1Count.net >= 1.0 || dhbt2Count.net >= 1.0;
    final isThresholdMet = hasGyGk && hasDhbt;

    String? blockReason;
    if (!hasGyGk) {
      blockReason = 'GY veya GK testinden en az 1.0 ham net gerekli.';
    } else if (!hasDhbt) {
      blockReason = 'DHBT-1 veya DHBT-2 testinden en az 1.0 ham net gerekli.';
    }

    final gyRatio = math.max(0.0, gyCount.net) / maxGyGkQuestions;
    final gkRatio = math.max(0.0, gkCount.net) / maxGyGkQuestions;
    final dhbt1Ratio = math.max(0.0, dhbt1Count.net) / maxDhbtSectionQuestions;
    final dhbt2Ratio = math.max(0.0, dhbt2Count.net) / maxDhbtSectionQuestions;

    final weightedRatio =
        (gyRatio * 0.15) +
        (gkRatio * 0.15) +
        (dhbt1Ratio * 0.30) +
        (dhbt2Ratio * 0.40);

    double? computeForBase(double baseScore) {
      if (!isThresholdMet) return null;
      return (baseScore + weightedRatio * (100.0 - baseScore)).clamp(
        0.0,
        100.0,
      );
    }

    final p122 = computeForBase(42.0);
    final p123 = computeForBase(41.0);
    final p124 = computeForBase(40.0);

    final (
      primaryCode,
      primaryLabel,
      primaryScore,
    ) = switch (selection.educationLevel) {
      EducationLevel.ortaogretim => (
        'KPSSP122',
        'KPSS DHBT Ortaöğretim İHL (P122)',
        p122,
      ),
      EducationLevel.onlisans => (
        'KPSSP123',
        'KPSS DHBT Ön Lisans (P123)',
        p123,
      ),
      EducationLevel.lisans => ('KPSSP124', 'KPSS DHBT Lisans (P124)', p124),
    };

    return ScoreEngineCalculationResult(
      mode: mode,
      primaryCode: primaryCode,
      primaryLabel: primaryLabel,
      primaryScore: primaryScore ?? 0.0,
      isThresholdMet: isThresholdMet,
      thresholdWarning: blockReason != null
          ? 'ÖSYM DHBT kuralı: $blockReason'
          : null,
      totalNet: gyCount.net + gkCount.net + dhbt1Count.net + dhbt2Count.net,
      sectionCounts: <String, KpssSectionCounts>{
        'gy': gyCount,
        'gk': gkCount,
        'dhbt1': dhbt1Count,
        'dhbt2': dhbt2Count,
      },
      scoreOutputs: [
        ScoreOutputRow(
          code: 'KPSSP122',
          label: 'KPSS DHBT Ortaöğretim (İHL)',
          formulaNote: '%15 GY + %15 GK + %30 DHBT-1 + %40 DHBT-2',
          score: p122,
          blockReason: blockReason,
        ),
        ScoreOutputRow(
          code: 'KPSSP123',
          label: 'KPSS DHBT Ön Lisans',
          formulaNote: '%15 GY + %15 GK + %30 DHBT-1 + %40 DHBT-2',
          score: p123,
          blockReason: blockReason,
        ),
        ScoreOutputRow(
          code: 'KPSSP124',
          label: 'KPSS DHBT Lisans',
          formulaNote: '%15 GY + %15 GK + %30 DHBT-1 + %40 DHBT-2',
          score: p124,
          blockReason: blockReason,
        ),
      ],
      disclaimer: 'ÖSYM DHBT ağırlıkları (%15 GY + %15 GK + %30 DHBT-1 + %40 DHBT-2) esas alınarak simüle edilmiştir.',
    );
  }
}
