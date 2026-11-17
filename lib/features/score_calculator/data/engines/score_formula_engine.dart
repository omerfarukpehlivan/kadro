import 'dart:math' as math;

import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/score_calculator/data/engines/a_group_score_engine.dart';
import 'package:kadro/features/score_calculator/data/engines/dhbt_score_engine.dart';
import 'package:kadro/features/score_calculator/data/engines/ekpss_score_engine.dart';
import 'package:kadro/features/score_calculator/data/engines/meb_ags_score_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';

/// Çoklu KPSS & MEB-AGS puan hesaplama motorlarının modlarını tanımlar.
///
/// Angular/Web Karşılığı: Strateji desenindeki (`ScoreFormulaEngine`) seçili
/// hesaplayıcı stratejisini belirleyen `ScoreEngineMode` enum'u (`TASK-132`).
enum ScoreEngineMode {
  bGrubuLisans(
    code: 'P3',
    title: 'KPSS Lisans (P3)',
    shortTitle: 'Lisans · P1/P2/P3',
    subtitle: 'B Grubu Kadrolar · 60 GY + 60 GK',
    examFamily: KpssExamFamily.bGrubu,
  ),
  bGrubuOnLisans(
    code: 'P93',
    title: 'KPSS Ön Lisans (P93)',
    shortTitle: 'Ön Lisans · P93',
    subtitle: '2 Yıllık Mezun Kadroları · 60 GY + 60 GK',
    examFamily: KpssExamFamily.bGrubu,
  ),
  bGrubuOrtaogretim(
    code: 'P94',
    title: 'KPSS Ortaöğretim (P94)',
    shortTitle: 'Ortaöğretim · P94',
    subtitle: 'Lise Mezun Kadroları · 60 GY + 60 GK',
    examFamily: KpssExamFamily.bGrubu,
  ),
  ekpss(
    code: 'EKPSS',
    title: 'E-KPSS (P1 / P2 / P3)',
    shortTitle: 'E-KPSS',
    subtitle: 'Engelli Kamu Personeli · 30 GY + 30 GK',
    examFamily: KpssExamFamily.ekpss,
  ),
  dhbt(
    code: 'DHBT',
    title: 'KPSS DHBT (P122 / P123 / P124)',
    shortTitle: 'DHBT',
    subtitle: 'GY + GK + DHBT-1 (20) + DHBT-2 (20)',
    examFamily: KpssExamFamily.dhbt,
  ),
  mebAgs(
    code: 'MEB_AGS',
    title: 'MEB-AGS / ÖABT (P1 / P2 / P3)',
    shortTitle: 'MEB-AGS',
    subtitle: '80 AGS + 50 ÖABT veya YDS (P3)',
    examFamily: KpssExamFamily.mebAgs,
  ),
  aGrubu(
    code: 'A_GRUBU',
    title: 'KPSS A Grubu (P4 – P48)',
    shortTitle: 'A Grubu',
    subtitle: '60 GY + 60 GK + 40\'ar Alan Testleri',
    examFamily: KpssExamFamily.aGrubu,
  );

  final String code;
  final String title;
  final String shortTitle;
  final String subtitle;
  final KpssExamFamily examFamily;

  const ScoreEngineMode({
    required this.code,
    required this.title,
    required this.shortTitle,
    required this.subtitle,
    required this.examFamily,
  });

  /// Ekrandaki mevcut `KpssScoreType` ile eşleşen B Grubu enum değeri (varsa).
  KpssScoreType? get legacyBGroupScoreType {
    switch (this) {
      case ScoreEngineMode.bGrubuLisans:
        return KpssScoreType.p3Lisans;
      case ScoreEngineMode.bGrubuOnLisans:
        return KpssScoreType.p93OnLisans;
      case ScoreEngineMode.bGrubuOrtaogretim:
        return KpssScoreType.p94Ortaogretim;
      case ScoreEngineMode.ekpss:
      case ScoreEngineMode.dhbt:
      case ScoreEngineMode.mebAgs:
      case ScoreEngineMode.aGrubu:
        return null;
    }
  }
}

/// Hesaplama motorunun UI'da istediği tek bir test/puan giriş alanı tanımı.
class ScoreInputField {
  final String key;
  final String label;
  final String? subtitle;
  final int maxQuestions;
  final bool isRawScoreInput;

  const ScoreInputField({
    required this.key,
    required this.label,
    this.subtitle,
    required this.maxQuestions,
    this.isRawScoreInput = false,
  });
}

/// Kullanıcının tek bir bölüm/test için girdiği Doğru/Yanlış veya ham puan verisi.
class ScoreSectionInput {
  final int correct;
  final int wrong;
  final double? rawScore;

  const ScoreSectionInput({this.correct = 0, this.wrong = 0, this.rawScore});
}

/// Tek bir puan türünün (`P1`, `P2`, `P3`, `P122`, `AGS-P2`, `P48` vb.) sonuç satırı.
class ScoreOutputRow {
  final String code;
  final String label;
  final String formulaNote;
  final double? score;
  final String? blockReason;

  const ScoreOutputRow({
    required this.code,
    required this.label,
    required this.formulaNote,
    required this.score,
    this.blockReason,
  });

  bool get isCalculated => score != null;
}

/// Tüm sınav motorlarının ortak döndürdüğü normalize edilmiş puan hesaplama sonucu.
class ScoreEngineCalculationResult {
  final ScoreEngineMode mode;
  final String primaryCode;
  final String primaryLabel;
  final double primaryScore;
  final bool isThresholdMet;
  final String? thresholdWarning;
  final double totalNet;
  final Map<String, KpssSectionCounts> sectionCounts;
  final List<ScoreOutputRow> scoreOutputs;
  final List<KpssYearScoreResult> historicalResults;
  final String disclaimer;

  const ScoreEngineCalculationResult({
    required this.mode,
    required this.primaryCode,
    required this.primaryLabel,
    required this.primaryScore,
    required this.isThresholdMet,
    this.thresholdWarning,
    required this.totalNet,
    required this.sectionCounts,
    required this.scoreOutputs,
    this.historicalResults = const [],
    this.disclaimer = 'ÖSYM resmî ağırlık oranlarına göre simüle edilen tahmini puan aralığıdır.',
  });
}

/// Strategy Pattern: Her KPSS/MEB-AGS sınav ailesi kendi formül motorunu uygular.
abstract class ScoreFormulaEngine {
  ScoreEngineMode get mode;

  /// Seçili sınava göre UI'da gösterilecek dinamik giriş alanlarını döner.
  List<ScoreInputField> fieldsFor(ExamSelection selection);

  /// Girilen doğru/yanlış veya ham puanlara göre puan sonuçlarını hesaplar.
  ScoreEngineCalculationResult calculate({
    required ExamSelection selection,
    required Map<String, ScoreSectionInput> inputs,
  });

  /// Verilen bölüm girişini `[0..maxQuestions]` sınırları içine çeker ve ham neti döner.
  static KpssSectionCounts clampForMax(
    ScoreSectionInput? input,
    int maxQuestions,
  ) {
    final safeCorrect = (input?.correct ?? 0).clamp(0, maxQuestions);
    final maxWrong = math.max(0, maxQuestions - safeCorrect);
    final safeWrong = (input?.wrong ?? 0).clamp(0, maxWrong);
    final empty = maxQuestions - safeCorrect - safeWrong;
    final net = KpssScoreCalculator.calculateNet(safeCorrect, safeWrong);
    return KpssSectionCounts(
      correct: safeCorrect,
      wrong: safeWrong,
      empty: empty,
      net: net,
    );
  }
}

/// KPSS B Grubu (`P1`, `P2`, `P3`, `P93`, `P94`) Strateji Motoru (`TASK-132` & `TASK-133`).
class BGroupScoreEngine implements ScoreFormulaEngine {
  @override
  final ScoreEngineMode mode;

  const BGroupScoreEngine({required this.mode});

  @override
  List<ScoreInputField> fieldsFor(ExamSelection selection) => const [
    ScoreInputField(
      key: 'gy',
      label: 'Genel Yetenek (GY)',
      subtitle: 'Türkçe 30 + Matematik 30',
      maxQuestions: KpssScoreCalculator.maxQuestionsPerSection,
    ),
    ScoreInputField(
      key: 'gk',
      label: 'Genel Kültür (GK)',
      subtitle: 'Tarih 27 + Coğrafya 18 + Vatandaşlık 9 + Güncel 6',
      maxQuestions: KpssScoreCalculator.maxQuestionsPerSection,
    ),
  ];

  @override
  ScoreEngineCalculationResult calculate({
    required ExamSelection selection,
    required Map<String, ScoreSectionInput> inputs,
  }) {
    final gyIn = inputs['gy'] ?? const ScoreSectionInput();
    final gkIn = inputs['gk'] ?? const ScoreSectionInput();
    final scoreType = mode.legacyBGroupScoreType ?? KpssScoreType.p3Lisans;

    final summary = KpssScoreCalculator.calculate(
      scoreType: scoreType,
      gyCorrect: gyIn.correct,
      gyWrong: gyIn.wrong,
      gkCorrect: gkIn.correct,
      gkWrong: gkIn.wrong,
    );

    final gyCount = KpssSectionCounts(
      correct: summary.gyCorrect,
      wrong: summary.gyWrong,
      empty: summary.gyEmpty,
      net: summary.gyNet,
    );
    final gkCount = KpssSectionCounts(
      correct: summary.gkCorrect,
      wrong: summary.gkWrong,
      empty: summary.gkEmpty,
      net: summary.gkNet,
    );

    final outputs = <ScoreOutputRow>[];
    if (scoreType == KpssScoreType.p3Lisans) {
      final cfg = KpssScoreCalculator.configsFor(KpssScoreType.p3Lisans).first;
      final effGy = math.max(0.0, summary.gyNet);
      final effGk = math.max(0.0, summary.gkNet);

      double? weightedScore(double gyRatio, double gkRatio) {
        if (!summary.isThresholdMet) return null;
        return (cfg.baseScore +
                effGy * cfg.gyCoeff * (gyRatio / 0.50) +
                effGk * cfg.gkCoeff * (gkRatio / 0.50))
            .clamp(0.0, 100.0);
      }

      outputs.addAll([
        ScoreOutputRow(
          code: 'KPSSP1',
          label: 'KPSS Lisans P1',
          formulaNote: '%70 GY + %30 GK',
          score: weightedScore(0.70, 0.30),
          blockReason: summary.isThresholdMet
              ? null
              : 'GY veya GK testinden en az 1.0 ham net gerekli.',
        ),
        ScoreOutputRow(
          code: 'KPSSP2',
          label: 'KPSS Lisans P2',
          formulaNote: '%60 GY + %40 GK',
          score: weightedScore(0.60, 0.40),
          blockReason: summary.isThresholdMet
              ? null
              : 'GY veya GK testinden en az 1.0 ham net gerekli.',
        ),
        ScoreOutputRow(
          code: 'KPSSP3',
          label: 'KPSS Lisans P3 (Ana)',
          formulaNote: '%50 GY + %50 GK',
          score: summary.isThresholdMet ? summary.primaryScore : null,
          blockReason: summary.isThresholdMet
              ? null
              : 'GY veya GK testinden en az 1.0 ham net gerekli.',
        ),
      ]);
    } else {
      outputs.add(
        ScoreOutputRow(
          code: scoreType == KpssScoreType.p93OnLisans ? 'KPSSP93' : 'KPSSP94',
          label: scoreType.title,
          formulaNote: '%50 GY + %50 GK',
          score: summary.isThresholdMet ? summary.primaryScore : null,
          blockReason: summary.isThresholdMet
              ? null
              : 'GY veya GK testinden en az 1.0 ham net gerekli.',
        ),
      );
    }

    return ScoreEngineCalculationResult(
      mode: mode,
      primaryCode: scoreType.code,
      primaryLabel: scoreType.title,
      primaryScore: summary.primaryScore,
      isThresholdMet: summary.isThresholdMet,
      thresholdWarning: summary.isThresholdMet ? null : 'ÖSYM kuralı: Puan hesaplanabilmesi için GY veya GK testlerinden en az birinde en az 1.0 ham net çıkarılmalıdır.',
      totalNet: summary.totalNet,
      sectionCounts: {'gy': gyCount, 'gk': gkCount},
      scoreOutputs: outputs,
      historicalResults: summary.historicalResults,
    );
  }
}

/// Tüm KPSS & MEB-AGS hesaplama motorlarını tek çatı altında yöneten kayıt merkezi.
///
/// Faz B-E adımlarında eklenecek E-KPSS, DHBT, MEB-AGS ve A Grubu motorları da
/// bu kayıt defteri üzerinden UI'ya bağlanır.
class ScoreEngineRegistry {
  ScoreEngineRegistry._();

  static final Map<ScoreEngineMode, ScoreFormulaEngine> _engines = {
    ScoreEngineMode.bGrubuLisans: const BGroupScoreEngine(
      mode: ScoreEngineMode.bGrubuLisans,
    ),
    ScoreEngineMode.bGrubuOnLisans: const BGroupScoreEngine(
      mode: ScoreEngineMode.bGrubuOnLisans,
    ),
    ScoreEngineMode.bGrubuOrtaogretim: const BGroupScoreEngine(
      mode: ScoreEngineMode.bGrubuOrtaogretim,
    ),
    ScoreEngineMode.ekpss: const EkpssScoreEngine(),
    ScoreEngineMode.dhbt: const DhbtScoreEngine(),
    ScoreEngineMode.mebAgs: const MebAgsScoreEngine(),
    ScoreEngineMode.aGrubu: const AGroupScoreEngine(),
  };

  /// Ek sınav motorlarını kaydetmek veya testlerde geçersiz kılmak için.
  static void register(ScoreFormulaEngine engine) {
    _engines[engine.mode] = engine;
  }

  /// Seçili [ExamSelection] için uygun [ScoreEngineMode] değerini döner.
  static ScoreEngineMode modeForSelection(ExamSelection selection) {
    switch (selection.family) {
      case KpssExamFamily.bGrubu:
        switch (selection.educationLevel) {
          case EducationLevel.onlisans:
            return ScoreEngineMode.bGrubuOnLisans;
          case EducationLevel.ortaogretim:
            return ScoreEngineMode.bGrubuOrtaogretim;
          case EducationLevel.lisans:
            return ScoreEngineMode.bGrubuLisans;
        }
      case KpssExamFamily.ekpss:
        return ScoreEngineMode.ekpss;
      case KpssExamFamily.dhbt:
        return ScoreEngineMode.dhbt;
      case KpssExamFamily.mebAgs:
        return ScoreEngineMode.mebAgs;
      case KpssExamFamily.aGrubu:
        return ScoreEngineMode.aGrubu;
    }
  }

  /// Kayıtlı bir mod için motoru döner; henüz fazı yüklenmemişse B Grubu güvenli yedeğini döner.
  static ScoreFormulaEngine engineForMode(ScoreEngineMode mode) {
    return _engines[mode] ?? _engines[ScoreEngineMode.bGrubuLisans]!;
  }

  /// Aktif sınav seçimine göre doğrudan puan hesaplama motorunu çözer.
  static ScoreFormulaEngine engineForSelection(ExamSelection selection) {
    final targetMode = modeForSelection(selection);
    return engineForMode(targetMode);
  }

  /// Sistemde kayıtlı tüm desteklenen motor modlarını döner.
  static List<ScoreEngineMode> get registeredModes => _engines.keys.toList();
}
