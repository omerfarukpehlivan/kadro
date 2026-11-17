import 'dart:math' as math;

import 'package:kadro/core/utils/exam_calendar_utils.dart';

/// KPSS merkezi sınav puan türlerini tanımlar.
///
/// Angular/Web karşılığı: KPSS sınav düzeyine göre puan hesaplama katsayılarını
/// ve etiketlerini belirleyen `enum ScoreTypeConfig`.
enum KpssScoreType {
  p3Lisans(
    code: 'P3',
    title: 'KPSS Lisans (P3)',
    shortTitle: 'Lisans (P3)',
    subtitle: 'B Grubu Kadrolar · 60 GY + 60 GK',
  ),
  p93OnLisans(
    code: 'P93',
    title: 'KPSS Ön Lisans (P93)',
    shortTitle: 'Ön Lisans (P93)',
    subtitle: '2 Yıllık Mezun Kadroları · 60 GY + 60 GK',
  ),
  p94Ortaogretim(
    code: 'P94',
    title: 'KPSS Ortaöğretim (P94)',
    shortTitle: 'Ortaöğretim (P94)',
    subtitle: 'Lise Mezun Kadroları · 60 GY + 60 GK',
  ),
  p122Dhbt(
    code: 'P122',
    title: 'KPSS DHBT (P122)',
    shortTitle: 'DHBT (P122)',
    subtitle: 'Din Hizmetleri · GY + GK + DHBT-1 + DHBT-2',
  );

  /// ÖSYM puan türü kodu (ör. `P3`).
  final String code;

  /// Tam başlık (ör. `KPSS Lisans (P3)`).
  final String title;

  /// Seçici ve çiplerde kullanılan kısa başlık (ör. `Lisans (P3)`).
  final String shortTitle;

  /// Hedef kadro ve soru dağılımı alt açıklaması.
  final String subtitle;

  const KpssScoreType({
    required this.code,
    required this.title,
    required this.shortTitle,
    required this.subtitle,
  });

  /// Kullanıcının kayıtlı sınav hedefini (`KpssExamTarget`) ilgili KPSS puan türüne eşler.
  static KpssScoreType fromExamTarget(KpssExamTarget target) {
    switch (target) {
      case KpssExamTarget.onlisans:
        return KpssScoreType.p93OnLisans;
      case KpssExamTarget.ortaogretim:
        return KpssScoreType.p94Ortaogretim;
      case KpssExamTarget.dhbt:
        return KpssScoreType.p122Dhbt;
      case KpssExamTarget.lisans:
      case KpssExamTarget.lisans2028:
        return KpssScoreType.p3Lisans;
    }
  }
}

/// Tek bir test bölümü (Genel Yetenek veya Genel Kültür) için sınırlandırılmış sayıları taşır.
///
/// Web/Angular karşılığı: Form alanından doğrulanan immutable `SectionCountsDTO`.
class KpssSectionCounts {
  final int correct;
  final int wrong;
  final int empty;
  final double net;

  const KpssSectionCounts({
    required this.correct,
    required this.wrong,
    required this.empty,
    required this.net,
  });
}

/// Belirli bir KPSS sınav yılına ait ÖSYM istatistik ve katsayı kalibrasyon verileri.
///
/// Web/Angular karşılığı: Yıla göre puan ağırlık ve standart sapma katsayılarını tutan
/// `HistoricalExamCalibration` modeli.
class KpssHistoricalYearConfig {
  final int year;
  final KpssScoreType scoreType;
  final double baseScore;
  final double gyCoeff;
  final double gkCoeff;
  final double gyMean;
  final double gyStdDev;
  final double gkMean;
  final double gkStdDev;
  final String difficultyNote;

  const KpssHistoricalYearConfig({
    required this.year,
    required this.scoreType,
    required this.baseScore,
    required this.gyCoeff,
    required this.gkCoeff,
    required this.gyMean,
    required this.gyStdDev,
    required this.gkMean,
    required this.gkStdDev,
    required this.difficultyNote,
  });
}

/// Belirli bir geçmiş KPSS sınav yılı için hesaplanan tahmini puan ve standart skor sonucu.
///
/// Web/Angular karşılığı: Karşılaştırma tablosunun her bir satırını besleyen `HistoricalYearScoreViewModel`.
class KpssYearScoreResult {
  final int year;
  final KpssScoreType scoreType;
  final double score;
  final double gyStandardScore;
  final double gkStandardScore;
  final double gyMean;
  final double gkMean;
  final String difficultyNote;

  const KpssYearScoreResult({
    required this.year,
    required this.scoreType,
    required this.score,
    required this.gyStandardScore,
    required this.gkStandardScore,
    required this.gyMean,
    required this.gkMean,
    required this.difficultyNote,
  });
}

/// Adayın girdiği doğru/yanlış sayılarının tüm KPSS hesaplama ve 3 yıllık karşılaştırma özeti.
///
/// Web/Angular karşılığı: Hesaplama servisinin UI katmanına döndürdüğü tekil `ScoreCalculationSummary`.
class KpssCalculationSummary {
  final KpssScoreType scoreType;
  final int gyCorrect;
  final int gyWrong;
  final int gyEmpty;
  final double gyNet;
  final int gkCorrect;
  final int gkWrong;
  final int gkEmpty;
  final double gkNet;
  final double totalNet;
  final bool isThresholdMet;
  final double primaryScore;
  final int primaryYear;
  final double averageThreeYearScore;
  final double minScore;
  final double maxScore;
  final List<KpssYearScoreResult> historicalResults;

  const KpssCalculationSummary({
    required this.scoreType,
    required this.gyCorrect,
    required this.gyWrong,
    required this.gyEmpty,
    required this.gyNet,
    required this.gkCorrect,
    required this.gkWrong,
    required this.gkEmpty,
    required this.gkNet,
    required this.totalNet,
    required this.isThresholdMet,
    required this.primaryScore,
    required this.primaryYear,
    required this.averageThreeYearScore,
    required this.minScore,
    required this.maxScore,
    required this.historicalResults,
  });
}

/// ÖSYM KPSS (P3 / P93 / P94) puan ve Son 3 KPSS Yılı karşılaştırma motoru.
///
/// Pure Dart statik servis sınıfıdır; Angular tarafındaki state'siz bir
/// `ScoreCalculationService` karşılığı olarak çalışır.
class KpssScoreCalculator {
  KpssScoreCalculator._();

  /// Her bir test bölümündeki (Genel Yetenek / Genel Kültür) toplam soru sayısı.
  static const int maxQuestionsPerSection = 60;

  /// ÖSYM puan hesaplama ham net barajı (testlerden en az birinde >= 1.0 net).
  static const double minimumRawNetThreshold = 1.0;

  /// Son 3 KPSS sınav yılına ait ÖSYM istatistik ve katsayı konfigürasyonları.
  static const Map<KpssScoreType, List<KpssHistoricalYearConfig>>
  _historicalConfigs = {
    KpssScoreType.p3Lisans: [
      KpssHistoricalYearConfig(
        year: 2026,
        scoreType: KpssScoreType.p3Lisans,
        baseScore: 50.60,
        gyCoeff: 0.445,
        gkCoeff: 0.390,
        gyMean: 19.44,
        gyStdDev: 8.86,
        gkMean: 20.08,
        gkStdDev: 12.15,
        difficultyNote: 'Güncel 2026 KPSS Lisans dağılımı.',
      ),
      KpssHistoricalYearConfig(
        year: 2025,
        scoreType: KpssScoreType.p3Lisans,
        baseScore: 52.30,
        gyCoeff: 0.452,
        gkCoeff: 0.418,
        gyMean: 17.43,
        gyStdDev: 9.11,
        gkMean: 14.30,
        gkStdDev: 9.26,
        difficultyNote: 'GK ortalamasının düşük kaldığı 2025 Lisans dağılımı.',
      ),
      KpssHistoricalYearConfig(
        year: 2024,
        scoreType: KpssScoreType.p3Lisans,
        baseScore: 51.20,
        gyCoeff: 0.455,
        gkCoeff: 0.395,
        gyMean: 16.73,
        gyStdDev: 9.10,
        gkMean: 18.86,
        gkStdDev: 10.52,
        difficultyNote: '2024 KPSS Lisans dağılımı.',
      ),
    ],
    KpssScoreType.p93OnLisans: [
      KpssHistoricalYearConfig(
        year: 2026,
        scoreType: KpssScoreType.p93OnLisans,
        baseScore: 53.10,
        gyCoeff: 0.438,
        gkCoeff: 0.388,
        gyMean: 15.20,
        gyStdDev: 8.50,
        gkMean: 17.90,
        gkStdDev: 10.25,
        difficultyNote: 'Güncel 2026 Ön Lisans dağılımı.',
      ),
      KpssHistoricalYearConfig(
        year: 2024,
        scoreType: KpssScoreType.p93OnLisans,
        baseScore: 53.40,
        gyCoeff: 0.435,
        gkCoeff: 0.385,
        gyMean: 14.80,
        gyStdDev: 8.40,
        gkMean: 17.60,
        gkStdDev: 10.10,
        difficultyNote: '2024 Ön Lisans dağılımı.',
      ),
      KpssHistoricalYearConfig(
        year: 2022,
        scoreType: KpssScoreType.p93OnLisans,
        baseScore: 52.80,
        gyCoeff: 0.442,
        gkCoeff: 0.390,
        gyMean: 15.40,
        gyStdDev: 8.65,
        gkMean: 18.10,
        gkStdDev: 10.35,
        difficultyNote: '2022 Ön Lisans dağılımı.',
      ),
    ],
    KpssScoreType.p94Ortaogretim: [
      KpssHistoricalYearConfig(
        year: 2026,
        scoreType: KpssScoreType.p94Ortaogretim,
        baseScore: 53.90,
        gyCoeff: 0.428,
        gkCoeff: 0.382,
        gyMean: 13.80,
        gyStdDev: 8.00,
        gkMean: 16.40,
        gkStdDev: 9.90,
        difficultyNote: 'Güncel 2026 Ortaöğretim dağılımı.',
      ),
      KpssHistoricalYearConfig(
        year: 2024,
        scoreType: KpssScoreType.p94Ortaogretim,
        baseScore: 54.20,
        gyCoeff: 0.425,
        gkCoeff: 0.380,
        gyMean: 13.50,
        gyStdDev: 7.90,
        gkMean: 16.20,
        gkStdDev: 9.80,
        difficultyNote: '2024 Ortaöğretim dağılımı.',
      ),
      KpssHistoricalYearConfig(
        year: 2022,
        scoreType: KpssScoreType.p94Ortaogretim,
        baseScore: 53.60,
        gyCoeff: 0.432,
        gkCoeff: 0.385,
        gyMean: 14.10,
        gyStdDev: 8.20,
        gkMean: 16.80,
        gkStdDev: 10.05,
        difficultyNote: '2022 Ortaöğretim dağılımı.',
      ),
    ],
    KpssScoreType.p122Dhbt: [
      KpssHistoricalYearConfig(
        year: 2024,
        scoreType: KpssScoreType.p122Dhbt,
        baseScore: 51.80,
        gyCoeff: 0.415,
        gkCoeff: 0.405,
        gyMean: 13.80,
        gyStdDev: 8.05,
        gkMean: 17.10,
        gkStdDev: 9.85,
        difficultyNote: '2024 DHBT GY-GK temel dağılım referansı.',
      ),
      KpssHistoricalYearConfig(
        year: 2022,
        scoreType: KpssScoreType.p122Dhbt,
        baseScore: 52.40,
        gyCoeff: 0.410,
        gkCoeff: 0.398,
        gyMean: 14.20,
        gyStdDev: 8.15,
        gkMean: 17.50,
        gkStdDev: 9.95,
        difficultyNote: '2022 DHBT GY-GK temel dağılım referansı.',
      ),
    ],
  };

  /// Seçilen KPSS puan türüne ait son 3 sınav yılı konfigürasyonlarını döndürür.
  static List<KpssHistoricalYearConfig> configsFor(KpssScoreType scoreType) {
    return List.unmodifiable(_historicalConfigs[scoreType] ?? const []);
  }

  /// ÖSYM "4 yanlış 1 doğruyu götürür" kuralıyla ham neti hesaplar.
  static double calculateNet(int correct, int wrong) {
    return correct - (wrong / 4.0);
  }

  /// Doğru ve yanlış sayılarını 60 soruluk test sınırına (`Doğru + Yanlış <= 60`) oturtur.
  static KpssSectionCounts clampSectionCounts(int correct, int wrong) {
    final clampedCorrect = correct.clamp(0, maxQuestionsPerSection);
    final maxAllowedWrong = maxQuestionsPerSection - clampedCorrect;
    final clampedWrong = wrong.clamp(0, maxAllowedWrong);
    final empty = maxQuestionsPerSection - clampedCorrect - clampedWrong;
    final net = calculateNet(clampedCorrect, clampedWrong);

    return KpssSectionCounts(
      correct: clampedCorrect,
      wrong: clampedWrong,
      empty: empty,
      net: net,
    );
  }

  /// Adayın GY ve GK netine göre seçilen KPSS puan türünü ve son 3 sınav yılı sonuçlarını hesaplar.
  static KpssCalculationSummary calculate({
    required KpssScoreType scoreType,
    required int gyCorrect,
    required int gyWrong,
    required int gkCorrect,
    required int gkWrong,
  }) {
    final gy = clampSectionCounts(gyCorrect, gyWrong);
    final gk = clampSectionCounts(gkCorrect, gkWrong);
    final totalNet = gy.net + gk.net;

    // ÖSYM kuralı: GY veya GK testlerinin en az birinde 1.0 ham net çıkarılmalıdır.
    final isThresholdMet =
        gy.net >= minimumRawNetThreshold || gk.net >= minimumRawNetThreshold;

    final effectiveGyNet = math.max(0.0, gy.net);
    final effectiveGkNet = math.max(0.0, gk.net);
    final configs = configsFor(scoreType);

    final results = configs
        .map((config) {
          final gyStdScore = config.gyStdDev > 0
              ? 50.0 + 10.0 * ((gy.net - config.gyMean) / config.gyStdDev)
              : 50.0;
          final gkStdScore = config.gkStdDev > 0
              ? 50.0 + 10.0 * ((gk.net - config.gkMean) / config.gkStdDev)
              : 50.0;

          final score = !isThresholdMet
              ? 0.0
              : (config.baseScore +
                        (effectiveGyNet * config.gyCoeff) +
                        (effectiveGkNet * config.gkCoeff))
                    .clamp(0.0, 100.0);

          return KpssYearScoreResult(
            year: config.year,
            scoreType: scoreType,
            score: score,
            gyStandardScore: gyStdScore,
            gkStandardScore: gkStdScore,
            gyMean: config.gyMean,
            gkMean: config.gkMean,
            difficultyNote: config.difficultyNote,
          );
        })
        .toList(growable: false);

    final primaryResult = results.first;
    final scores = results.map((r) => r.score).toList(growable: false);
    final averageScore =
        scores.reduce((sum, value) => sum + value) / scores.length;
    final minScore = scores.reduce(math.min);
    final maxScore = scores.reduce(math.max);

    return KpssCalculationSummary(
      scoreType: scoreType,
      gyCorrect: gy.correct,
      gyWrong: gy.wrong,
      gyEmpty: gy.empty,
      gyNet: gy.net,
      gkCorrect: gk.correct,
      gkWrong: gk.wrong,
      gkEmpty: gk.empty,
      gkNet: gk.net,
      totalNet: totalNet,
      isThresholdMet: isThresholdMet,
      primaryScore: primaryResult.score,
      primaryYear: primaryResult.year,
      averageThreeYearScore: averageScore,
      minScore: minScore,
      maxScore: maxScore,
      historicalResults: results,
    );
  }
}
