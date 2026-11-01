import 'package:kadro/core/utils/exam_utils.dart';

/// Test veya deneme tamamlandığında ortaya çıkan sonuç karnesi modeli.
///
/// Angular/TypeScript'teki `interface QuizResult { ... }` yapısına benzer.
/// İstatistiklerin ve net hesabının tek bir merkezden okunmasını sağlar.
class QuizResult {
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int emptyCount;

  const QuizResult({
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.emptyCount,
  });

  /// 4 yanlışın 1 doğruyu götürdüğü KPSS net hesabı.
  double get net => calculateNet(correct: correctCount, wrong: wrongCount);

  /// Testteki başarı yüzdesi (0 - 100 arası).
  int get successRate =>
      totalQuestions == 0 ? 0 : ((correctCount / totalQuestions) * 100).round();
}
