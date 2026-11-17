import 'dart:math' as math;

import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';

class _AFieldMeta {
  final String key;
  final String catalogName;
  final String shortLabel;
  final String label;
  final String subtitle;

  const _AFieldMeta({
    required this.key,
    required this.catalogName,
    required this.shortLabel,
    required this.label,
    required this.subtitle,
  });

  int get maxQuestions => AGroupScoreEngine._maxQuestionsByKey[key] ?? 40;
}

class _AFormulaSpec {
  final String code;
  final String label;
  final String formulaNote;
  final Map<String, double> weights;

  const _AFormulaSpec({
    required this.code,
    required this.label,
    required this.formulaNote,
    required this.weights,
  });
}

/// KPSS A Grubu (`P4 – P48`) puan hesaplama motoru (`TASK-137`).
///
/// ÖSYM Tablo-2 ağırlıklarına göre `P4, P12, P13, P14, P19, P20, P21, P24, P29, P34, P35, P48`
/// puanlarını canlı hesaplar; herhangi bir katsayılı testte `< 1.0` ham net varsa
/// `'Hesaplanmadı: <Test> < 1 Net'` kuralıyla ilgili puan türünü kilitler.
class AGroupScoreEngine implements ScoreFormulaEngine {
  static const double baseScore = 40.0;

  static const List<_AFieldMeta> _fieldCatalog = [
    _AFieldMeta(
      key: 'hukuk',
      catalogName: 'Alan Hukuk',
      shortLabel: 'Hukuk',
      label: 'Alan Hukuk',
      subtitle: 'Anayasa, İdare, Ceza, Medeni, Borçlar, Ticaret · 40 Soru',
    ),
    _AFieldMeta(
      key: 'iktisat',
      catalogName: 'Alan İktisat',
      shortLabel: 'İktisat',
      label: 'Alan İktisat',
      subtitle: 'Mikro, Makro, Para-Banka, Uluslararası İktisat · 40 Soru',
    ),
    _AFieldMeta(
      key: 'maliye',
      catalogName: 'Alan Maliye',
      shortLabel: 'Maliye',
      label: 'Alan Maliye',
      subtitle: 'Kamu Maliyesi, Vergi, Bütçe, Maliye Politikası · 40 Soru',
    ),
    _AFieldMeta(
      key: 'muhasebe',
      catalogName: 'Alan Muhasebe',
      shortLabel: 'Muhasebe',
      label: 'Alan Muhasebe',
      subtitle: 'Genel Muhasebe, Mali Tablolar, Maliyet · 40 Soru',
    ),
    _AFieldMeta(
      key: 'isletme',
      catalogName: 'Alan İşletme',
      shortLabel: 'İşletme',
      label: 'Alan İşletme',
      subtitle: 'Yönetim, Üretim, Pazarlama, Finansman, İK · 40 Soru',
    ),
    _AFieldMeta(
      key: 'kamu_yonetimi',
      catalogName: 'Alan Kamu Yönetimi',
      shortLabel: 'Kamu Yön.',
      label: 'Alan Kamu Yönetimi',
      subtitle: 'Yönetim Bilimi, Siyaset, Türk Yönetim Tarihi · 40 Soru',
    ),
    _AFieldMeta(
      key: 'uluslararasi_iliskiler',
      catalogName: 'Alan Uluslararası İlişkiler',
      shortLabel: 'Ulus. İliş.',
      label: 'Alan Uluslararası İlişkiler',
      subtitle: 'Uİ Kuramları, Siyasi Tarih, Ulus. Hukuk · 40 Soru',
    ),
    _AFieldMeta(
      key: 'ceko',
      catalogName: 'Alan ÇEKO',
      shortLabel: 'ÇEKO',
      label: 'Alan ÇEKO',
      subtitle: 'İş Hukuku, Sosyal Güvenlik, Çalışma Ekonomisi · 40 Soru',
    ),
    _AFieldMeta(
      key: 'istatistik',
      catalogName: 'Alan İstatistik',
      shortLabel: 'İstatistik',
      label: 'Alan İstatistik',
      subtitle: 'Olasılık, Dağılımlar, Tahmin, Regresyon · 40 Soru',
    ),
  ];

  static const Map<String, String> _shortLabelsByKey = {
    'gy': 'GY',
    'gk': 'GK',
    'hukuk': 'Hukuk',
    'iktisat': 'İktisat',
    'maliye': 'Maliye',
    'muhasebe': 'Muhasebe',
    'isletme': 'İşletme',
    'kamu_yonetimi': 'Kamu Yönetimi',
    'uluslararasi_iliskiler': 'Uluslararası İlişkiler',
    'ceko': 'ÇEKO',
    'istatistik': 'İstatistik',
  };

  static const Map<String, int> _maxQuestionsByKey = {
    'gy': 60,
    'gk': 60,
    'hukuk': 40,
    'iktisat': 40,
    'maliye': 40,
    'muhasebe': 40,
    'isletme': 40,
    'kamu_yonetimi': 40,
    'uluslararasi_iliskiler': 40,
    'ceko': 40,
    'istatistik': 40,
  };

  static const List<_AFormulaSpec> _formulas = [
    _AFormulaSpec(
      code: 'KPSSP48',
      label: 'KPSS P48 (İİBF / VDK / GUY)',
      formulaNote: '%10 GY + %10 GK + %20 Hukuk + %20 İktisat + %20 Maliye + %20 Muhasebe',
      weights: {
        'gy': 0.10,
        'gk': 0.10,
        'hukuk': 0.20,
        'iktisat': 0.20,
        'maliye': 0.20,
        'muhasebe': 0.20,
      },
    ),
    _AFormulaSpec(
      code: 'KPSSP4',
      label: 'KPSS P4 (Hukuk Odaklı)',
      formulaNote: '%20 GY + %20 GK + %60 Hukuk',
      weights: {'gy': 0.20, 'gk': 0.20, 'hukuk': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP12',
      label: 'KPSS P12 (İstatistik Odaklı)',
      formulaNote: '%20 GY + %20 GK + %60 İstatistik',
      weights: {'gy': 0.20, 'gk': 0.20, 'istatistik': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP13',
      label: 'KPSS P13 (İktisat + İstatistik)',
      formulaNote: '%20 GY + %10 GK + %30 İktisat + %40 İstatistik',
      weights: {'gy': 0.20, 'gk': 0.10, 'iktisat': 0.30, 'istatistik': 0.40},
    ),
    _AFormulaSpec(
      code: 'KPSSP14',
      label: 'KPSS P14 (İktisat Odaklı)',
      formulaNote: '%20 GY + %20 GK + %60 İktisat',
      weights: {'gy': 0.20, 'gk': 0.20, 'iktisat': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP19',
      label: 'KPSS P19 (Maliye Odaklı)',
      formulaNote: '%20 GY + %20 GK + %60 Maliye',
      weights: {'gy': 0.20, 'gk': 0.20, 'maliye': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP20',
      label: 'KPSS P20 (Maliye + Hukuk)',
      formulaNote: '%15 GY + %15 GK + %20 Hukuk + %50 Maliye',
      weights: {'gy': 0.15, 'gk': 0.15, 'hukuk': 0.20, 'maliye': 0.50},
    ),
    _AFormulaSpec(
      code: 'KPSSP21',
      label: 'KPSS P21 (Maliye + İktisat + Hukuk)',
      formulaNote: '%15 GY + %10 GK + %15 Hukuk + %20 İktisat + %40 Maliye',
      weights: {
        'gy': 0.15,
        'gk': 0.10,
        'hukuk': 0.15,
        'iktisat': 0.20,
        'maliye': 0.40,
      },
    ),
    _AFormulaSpec(
      code: 'KPSSP24',
      label: 'KPSS P24 (İşletme Odaklı)',
      formulaNote: '%20 GY + %20 GK + %60 İşletme',
      weights: {'gy': 0.20, 'gk': 0.20, 'isletme': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP29',
      label: 'KPSS P29 (Kamu Yönetimi Odaklı)',
      formulaNote: '%20 GY + %20 GK + %60 Kamu Yönetimi',
      weights: {'gy': 0.20, 'gk': 0.20, 'kamu_yonetimi': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP34',
      label: 'KPSS P34 (Uluslararası İlişkiler)',
      formulaNote: '%20 GY + %20 GK + %60 Uluslararası İlişkiler',
      weights: {'gy': 0.20, 'gk': 0.20, 'uluslararasi_iliskiler': 0.60},
    ),
    _AFormulaSpec(
      code: 'KPSSP35',
      label: 'KPSS P35 (Uluslararası İlişkiler + Hukuk)',
      formulaNote: '%10 GY + %10 GK + %30 Hukuk + %50 Uluslararası İlişkiler',
      weights: {
        'gy': 0.10,
        'gk': 0.10,
        'hukuk': 0.30,
        'uluslararasi_iliskiler': 0.50,
      },
    ),
  ];

  const AGroupScoreEngine();

  @override
  ScoreEngineMode get mode => ScoreEngineMode.aGrubu;

  @override
  List<ScoreInputField> fieldsFor(ExamSelection selection) {
    final chosen = selection.selectedFieldLessons.toSet();
    final prioritized = [
      ..._fieldCatalog.where((meta) => chosen.contains(meta.catalogName)),
      ..._fieldCatalog.where((meta) => !chosen.contains(meta.catalogName)),
    ];

    return [
      const ScoreInputField(
        key: 'gy',
        label: 'Genel Yetenek (GY)',
        subtitle: 'Türkçe 30 + Matematik 30 · 60 Soru',
        maxQuestions: 60,
      ),
      const ScoreInputField(
        key: 'gk',
        label: 'Genel Kültür (GK)',
        subtitle: 'Tarih 27 + Coğrafya 18 + Vatandaşlık 9 + Güncel 6',
        maxQuestions: 60,
      ),
      for (final meta in prioritized)
        ScoreInputField(
          key: meta.key,
          label: meta.label,
          subtitle: meta.subtitle,
          maxQuestions: meta.maxQuestions,
        ),
    ];
  }

  @override
  ScoreEngineCalculationResult calculate({
    required ExamSelection selection,
    required Map<String, ScoreSectionInput> inputs,
  }) {
    final sectionCounts = <String, KpssSectionCounts>{};
    for (final entry in _maxQuestionsByKey.entries) {
      sectionCounts[entry.key] = ScoreFormulaEngine.clampForMax(
        inputs[entry.key],
        entry.value,
      );
    }

    final totalNet = sectionCounts.values.fold<double>(
      0.0,
      (sum, counts) => sum + counts.net,
    );

    final outputs = <ScoreOutputRow>[];
    for (final spec in _formulas) {
      String? firstMissingTest;
      var weightedRatio = 0.0;

      for (final weightEntry in spec.weights.entries) {
        final key = weightEntry.key;
        final weight = weightEntry.value;
        final counts = sectionCounts[key]!;
        if (counts.net < 1.0 && firstMissingTest == null) {
          firstMissingTest = _shortLabelsByKey[key] ?? key;
        }
        final maxQ = _maxQuestionsByKey[key] ?? 40;
        weightedRatio += (math.max(0.0, counts.net) / maxQ) * weight;
      }

      if (firstMissingTest != null) {
        outputs.add(
          ScoreOutputRow(
            code: spec.code,
            label: spec.label,
            formulaNote: spec.formulaNote,
            score: null,
            blockReason: 'Hesaplanmadı: $firstMissingTest < 1 Net',
          ),
        );
      } else {
        final computed = (baseScore + weightedRatio * (100.0 - baseScore))
            .clamp(0.0, 100.0);
        outputs.add(
          ScoreOutputRow(
            code: spec.code,
            label: spec.label,
            formulaNote: spec.formulaNote,
            score: computed,
          ),
        );
      }
    }

    final p48 = outputs.first;
    final calculated = outputs.where((o) => o.isCalculated).toList();
    final primaryRow = p48.isCalculated
        ? p48
        : (calculated.isNotEmpty ? calculated.first : p48);

    return ScoreEngineCalculationResult(
      mode: mode,
      primaryCode: primaryRow.code,
      primaryLabel: primaryRow.label,
      primaryScore: primaryRow.score ?? 0.0,
      isThresholdMet: calculated.isNotEmpty,
      thresholdWarning: calculated.isNotEmpty
          ? null
          : 'ÖSYM A Grubu kuralı: İlgili puan türüne etki eden her testten en az 1.0 ham net çıkarılmalıdır (${p48.blockReason}).',
      totalNet: totalNet,
      sectionCounts: sectionCounts,
      scoreOutputs: outputs,
      disclaimer: 'KPSS A Grubu (P4–P48) ÖSYM Tablo-2 test ağırlıklarına göre simüle edilmiştir.',
    );
  }
}
