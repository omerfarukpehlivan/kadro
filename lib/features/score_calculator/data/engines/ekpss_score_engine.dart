import 'dart:math' as math;

import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';

/// E-KPSS (`EKPSSP1`, `EKPSSP2`, `EKPSSP3`) puan hesaplama motoru (`TASK-134`).
///
/// ÖSYM E-KPSS sisteminde 30 Genel Yetenek + 30 Genel Kültür (toplam 60 soru)
/// üzerinden 40–100 puan aralığında hesaplama yapılır.
/// Angular/Web Karşılığı: `ScoreFormulaEngine` arayüzünü uygulayan `EkpssCalculatorService`.
class EkpssScoreEngine implements ScoreFormulaEngine {
  static const int maxQuestionsPerSection = 30;
  static const double baseScore = 40.0;

  const EkpssScoreEngine();

  @override
  ScoreEngineMode get mode => ScoreEngineMode.ekpss;

  @override
  List<ScoreInputField> fieldsFor(ExamSelection selection) => const [
    ScoreInputField(
      key: 'gk',
      label: 'E-KPSS Genel Kültür',
      subtitle: 'Tarih 13 + Coğrafya 5 + Vatandaşlık 6 + Güncel 6',
      maxQuestions: maxQuestionsPerSection,
    ),
    ScoreInputField(
      key: 'gy',
      label: 'E-KPSS Genel Yetenek',
      subtitle: 'Türkçe 15 + Matematik 15',
      maxQuestions: maxQuestionsPerSection,
    ),
  ];

  @override
  ScoreEngineCalculationResult calculate({
    required ExamSelection selection,
    required Map<String, ScoreSectionInput> inputs,
  }) {
    final gyCount = ScoreFormulaEngine.clampForMax(
      inputs['gy'],
      maxQuestionsPerSection,
    );
    final gkCount = ScoreFormulaEngine.clampForMax(
      inputs['gk'],
      maxQuestionsPerSection,
    );

    final isThresholdMet = gyCount.net >= 1.0 || gkCount.net >= 1.0;
    final effGy = math.max(0.0, gyCount.net);
    final effGk = math.max(0.0, gkCount.net);

    double? levelScore({
      required double gyWeight,
      required double gkWeight,
      required double offset,
    }) {
      if (!isThresholdMet) return null;
      final normalizedTotal =
          ((effGy * gyWeight + effGk * gkWeight) / 0.50) * 1.0;
      return (baseScore + offset + normalizedTotal).clamp(40.0, 100.0);
    }

    final p1Score = levelScore(gyWeight: 0.50, gkWeight: 0.50, offset: 0.0);
    final p2Score = levelScore(gyWeight: 0.50, gkWeight: 0.50, offset: 0.0);
    final p3Score = levelScore(gyWeight: 0.50, gkWeight: 0.50, offset: 0.0);

    final (
      primaryCode,
      primaryLabel,
      selectedScore,
    ) = switch (selection.educationLevel) {
      EducationLevel.ortaogretim => (
        'EKPSSP1',
        'E-KPSS Ortaöğretim (EKPSSP1)',
        p1Score,
      ),
      EducationLevel.onlisans => (
        'EKPSSP2',
        'E-KPSS Ön Lisans (EKPSSP2)',
        p2Score,
      ),
      EducationLevel.lisans => ('EKPSSP3', 'E-KPSS Lisans (EKPSSP3)', p3Score),
    };

    const blockReason = 'GY veya GK testinden en az 1.0 ham net gerekli.';

    return ScoreEngineCalculationResult(
      mode: mode,
      primaryCode: primaryCode,
      primaryLabel: primaryLabel,
      primaryScore: selectedScore ?? 0.0,
      isThresholdMet: isThresholdMet,
      thresholdWarning: isThresholdMet ? null : 'ÖSYM E-KPSS kuralı: Puan hesaplanabilmesi için GY veya GK testlerinden en az birinde 1.0 ham net çıkarılmalıdır.',
      totalNet: gyCount.net + gkCount.net,
      sectionCounts: <String, KpssSectionCounts>{'gk': gkCount, 'gy': gyCount},
      scoreOutputs: [
        ScoreOutputRow(
          code: 'EKPSSP1',
          label: 'E-KPSS Ortaöğretim P1',
          formulaNote: '30 GY (%50) + 30 GK (%50) · 40–100 Ölçeği',
          score: p1Score,
          blockReason: isThresholdMet ? null : blockReason,
        ),
        ScoreOutputRow(
          code: 'EKPSSP2',
          label: 'E-KPSS Ön Lisans P2',
          formulaNote: '30 GY (%50) + 30 GK (%50) · 40–100 Ölçeği',
          score: p2Score,
          blockReason: isThresholdMet ? null : blockReason,
        ),
        ScoreOutputRow(
          code: 'EKPSSP3',
          label: 'E-KPSS Lisans P3',
          formulaNote: '30 GY (%50) + 30 GK (%50) · 40–100 Ölçeği',
          score: p3Score,
          blockReason: isThresholdMet ? null : blockReason,
        ),
      ],
      disclaimer: 'E-KPSS 30 GY + 30 GK (40–100 ölçeği) esas alınarak hesaplanan yaklaşık puandır.',
    );
  }
}
