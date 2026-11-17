import 'dart:math' as math;

import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';

/// MEB-AGS & ÖABT (`AGS-P1`, `AGS-P2`, `AGS-P3`) puan hesaplama motoru (`TASK-136`).
///
/// Resmî ağırlıklar:
/// - `AGS-P1`: `%100 AGS (80 Soru)`
/// - `AGS-P2`: `%50 AGS (80 Soru) + %50 ÖABT (50 Soru)` (DKAB/İHL dahil tüm branşlar)
/// - `AGS-P3`: `%50 AGS (80 Soru) + %50 YDS / e-YDS (0–100 Puan)`
///
/// Angular/Web Karşılığı: ÖSYM MEB Akademi Giriş Sınavı puan matrisi servisi.
class MebAgsScoreEngine implements ScoreFormulaEngine {
  static const int maxAgsQuestions = 80;
  static const int maxOabtQuestions = 50;
  static const double baseScore = 40.0;

  const MebAgsScoreEngine();

  @override
  ScoreEngineMode get mode => ScoreEngineMode.mebAgs;

  @override
  List<ScoreInputField> fieldsFor(ExamSelection selection) {
    final branch = selection.oabtBranch;
    final fields = <ScoreInputField>[
      const ScoreInputField(
        key: 'ags',
        label: 'MEB-AGS 1. Oturum',
        subtitle: 'Sözel 15 + Sayısal 15 + Tarih 6 + Coğrafya 6 + Eğitim & TYMM 30 + Mevzuat 8',
        maxQuestions: maxAgsQuestions,
      ),
    ];

    if (branch == OabtBranch.ydsDil) {
      fields.add(
        const ScoreInputField(
          key: 'yds',
          label: 'YDS / e-YDS Yabancı Dil Puanı',
          subtitle: 'AGS-P3 (%50 ağırlık) için 0–100 arası ham puan',
          maxQuestions: 100,
          isRawScoreInput: true,
        ),
      );
    } else if (branch.isOabtExam) {
      final subtitle = branch.hasFieldEducationSplit
          ? '30 Alan Bilgisi + 20 Alan Eğitimi · ${branch.durationMinutes} dk'
          : '50 Alan Bilgisi Sorusu · ${branch.durationMinutes} dk';
      fields.add(
        ScoreInputField(
          key: 'oabt',
          label: 'ÖABT ${branch.label}',
          subtitle: subtitle,
          maxQuestions: maxOabtQuestions,
        ),
      );
    }

    return fields;
  }

  @override
  ScoreEngineCalculationResult calculate({
    required ExamSelection selection,
    required Map<String, ScoreSectionInput> inputs,
  }) {
    final branch = selection.oabtBranch;
    final agsCount = ScoreFormulaEngine.clampForMax(
      inputs['ags'],
      maxAgsQuestions,
    );
    final hasAgs = agsCount.net >= 1.0;

    final agsScaled =
        baseScore + (math.max(0.0, agsCount.net) / maxAgsQuestions) * 60.0;
    final double? agsP1 = hasAgs ? agsScaled.clamp(0.0, 100.0) : null;

    final sectionCounts = <String, KpssSectionCounts>{'ags': agsCount};
    final outputs = <ScoreOutputRow>[];

    late final String primaryCode;
    late final String primaryLabel;
    late final double? primaryScore;
    late final bool isThresholdMet;
    String? thresholdWarning;
    var totalNet = agsCount.net;

    if (branch == OabtBranch.ydsDil) {
      final ydsRaw = (inputs['yds']?.rawScore ?? 0.0).clamp(0.0, 100.0);
      final hasYds = ydsRaw > 0.0;
      isThresholdMet = hasAgs && hasYds;
      if (!hasAgs) {
        thresholdWarning =
            'MEB-AGS 1. Oturumdan en az 1.0 ham net çıkarılmalıdır.';
      } else if (!hasYds) {
        thresholdWarning =
            'AGS-P3 hesabı için YDS / e-YDS puanınızı (0–100) giriniz.';
      }
      final double? agsP3 = isThresholdMet
          ? ((0.50 * agsScaled) + (0.50 * ydsRaw)).clamp(0.0, 100.0)
          : null;
      primaryCode = 'AGS-P3';
      primaryLabel = 'MEB-AGS P3 (Yabancı Dil)';
      primaryScore = agsP3;

      outputs.addAll([
        ScoreOutputRow(
          code: 'AGS-P3',
          label: 'MEB-AGS P3 (Yabancı Dil)',
          formulaNote: '%50 AGS (80 Soru) + %50 YDS (0–100)',
          score: agsP3,
          blockReason: isThresholdMet ? null : thresholdWarning,
        ),
        ScoreOutputRow(
          code: 'AGS-P1',
          label: 'MEB-AGS P1 (1. Oturum)',
          formulaNote: '%100 AGS (80 Soru)',
          score: agsP1,
          blockReason: hasAgs
              ? null
              : 'MEB-AGS 1. Oturumdan en az 1.0 ham net gerekli.',
        ),
      ]);
    } else if (branch.isOabtExam) {
      final oabtCount = ScoreFormulaEngine.clampForMax(
        inputs['oabt'],
        maxOabtQuestions,
      );
      sectionCounts['oabt'] = oabtCount;
      totalNet += oabtCount.net;

      final hasOabt = oabtCount.net >= 1.0;
      isThresholdMet = hasAgs && hasOabt;
      if (!hasAgs) {
        thresholdWarning =
            'MEB-AGS 1. Oturumdan en az 1.0 ham net çıkarılmalıdır.';
      } else if (!hasOabt) {
        thresholdWarning =
            'ÖABT ${branch.label} testinden en az 1.0 ham net çıkarılmalıdır.';
      }

      final oabtScaled =
          baseScore + (math.max(0.0, oabtCount.net) / maxOabtQuestions) * 60.0;
      final double? agsP2 = isThresholdMet
          ? ((0.50 * agsScaled) + (0.50 * oabtScaled)).clamp(0.0, 100.0)
          : null;

      primaryCode = 'AGS-P2';
      primaryLabel = 'MEB-AGS P2 (${branch.label})';
      primaryScore = agsP2;

      outputs.addAll([
        ScoreOutputRow(
          code: 'AGS-P2',
          label: 'MEB-AGS P2 (${branch.label})',
          formulaNote: '%50 AGS (80 Soru) + %50 ÖABT (50 Soru)',
          score: agsP2,
          blockReason: isThresholdMet ? null : thresholdWarning,
        ),
        ScoreOutputRow(
          code: 'AGS-P1',
          label: 'MEB-AGS P1 (1. Oturum)',
          formulaNote: '%100 AGS (80 Soru)',
          score: agsP1,
          blockReason: hasAgs
              ? null
              : 'MEB-AGS 1. Oturumdan en az 1.0 ham net gerekli.',
        ),
      ]);
    } else {
      isThresholdMet = hasAgs;
      if (!hasAgs) {
        thresholdWarning =
            'MEB-AGS 1. Oturumdan en az 1.0 ham net çıkarılmalıdır.';
      }
      primaryCode = 'AGS-P1';
      primaryLabel = 'MEB-AGS P1 (Genel Öğretmenlik)';
      primaryScore = agsP1;

      outputs.add(
        ScoreOutputRow(
          code: 'AGS-P1',
          label: 'MEB-AGS P1 (Genel Öğretmenlik)',
          formulaNote: '%100 AGS (80 Soru)',
          score: agsP1,
          blockReason: hasAgs ? null : thresholdWarning,
        ),
      );
    }

    return ScoreEngineCalculationResult(
      mode: mode,
      primaryCode: primaryCode,
      primaryLabel: primaryLabel,
      primaryScore: primaryScore ?? 0.0,
      isThresholdMet: isThresholdMet,
      thresholdWarning: thresholdWarning,
      totalNet: totalNet,
      sectionCounts: sectionCounts,
      scoreOutputs: outputs,
      disclaimer: 'MEB-AGS (%100 AGS / %50 AGS + %50 ÖABT veya YDS) resmî katsayı çerçevesine göre simüle edilmiştir.',
    );
  }
}
