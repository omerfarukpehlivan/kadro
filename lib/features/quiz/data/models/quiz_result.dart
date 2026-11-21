import 'package:kadro/core/utils/exam_utils.dart';

/// Ders bazlı net ve doğruluk analizi (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler).
class LessonResult {
  final String lesson;
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int emptyCount;

  const LessonResult({
    required this.lesson,
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.emptyCount,
  });

  /// 4 yanlış 1 doğruyu götüren ders neti.
  double get net => calculateNet(correct: correctCount, wrong: wrongCount);

  /// Ders başarı yüzdesi.
  int get successRate =>
      totalQuestions == 0 ? 0 : ((correctCount / totalQuestions) * 100).round();
}

/// Konu bazlı net, doğruluk ve zayıf konu analizi (`TASK-154`).
class TopicResult {
  final String topic;
  final String lesson;
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int emptyCount;

  const TopicResult({
    required this.topic,
    required this.lesson,
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.emptyCount,
  });

  /// 4 yanlış 1 doğruyu götüren konu neti.
  double get net => calculateNet(correct: correctCount, wrong: wrongCount);

  /// Konu başarı yüzdesi.
  int get successRate =>
      totalQuestions == 0 ? 0 : ((correctCount / totalQuestions) * 100).round();
}

/// Test veya deneme tamamlandığında ortaya çıkan sonuç karnesi modeli.
///
/// Angular/TypeScript'teki `interface QuizResult { ... }` yapısına benzer.
/// İstatistiklerin ve net hesabının tek bir merkezden okunmasını sağlar.
class QuizResult {
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int emptyCount;
  final Map<String, LessonResult>? lessonBreakdown;
  final Map<String, TopicResult>? topicBreakdown;

  const QuizResult({
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.emptyCount,
    this.lessonBreakdown,
    this.topicBreakdown,
  });

  /// 4 yanlışın 1 doğruyu götürdüğü KPSS net hesabı.
  double get net => calculateNet(correct: correctCount, wrong: wrongCount);

  /// Testteki başarı yüzdesi (0 - 100 arası).
  int get successRate =>
      totalQuestions == 0 ? 0 : ((correctCount / totalQuestions) * 100).round();

  /// Ders bazında detaylı karne mevcut mu?
  bool get hasLessonBreakdown =>
      lessonBreakdown != null && lessonBreakdown!.isNotEmpty;

  /// Konu bazında detaylı karne mevcut mu?
  bool get hasTopicBreakdown =>
      topicBreakdown != null && topicBreakdown!.isNotEmpty;

  /// En çok geliştirilmesi gereken (en düşük doğruluk / en çok hata-boş içeren) konu.
  TopicResult? get weakestTopic {
    final values = topicBreakdown?.values.toList();
    if (values == null || values.isEmpty) return null;
    values.sort((a, b) {
      final rateDiff = a.successRate.compareTo(b.successRate);
      if (rateDiff != 0) return rateDiff;
      final mistakeDiff = (b.wrongCount + b.emptyCount).compareTo(
        a.wrongCount + a.emptyCount,
      );
      if (mistakeDiff != 0) return mistakeDiff;
      return b.totalQuestions.compareTo(a.totalQuestions);
    });
    return values.first;
  }
}
