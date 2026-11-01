/// Supabase `quiz_sessions` tablosuna ve yerel arşive uygun test oturum kaydı.
///
/// Web/Angular karşılığı: Test Session / Quiz History Record Model.
class QuizSessionRecord {
  final String id;
  final String title;
  final String lesson;
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int emptyCount;
  final double netScore;
  final int earnedXp;
  final int durationSeconds;
  final DateTime completedAt;

  const QuizSessionRecord({
    required this.id,
    required this.title,
    required this.lesson,
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.emptyCount,
    required this.netScore,
    required this.earnedXp,
    required this.durationSeconds,
    required this.completedAt,
  });
}
