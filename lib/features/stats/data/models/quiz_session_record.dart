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

  /// Supabase `quiz_sessions` tablosundan veya JSON haritasından QuizSessionRecord üretir.
  factory QuizSessionRecord.fromMap(Map<String, dynamic> map) {
    return QuizSessionRecord(
      id: map['id']?.toString() ?? '',
      title:
          (map['session_title'] ?? map['title'])?.toString() ??
          'Genel Kültür Testi',
      lesson: map['lesson']?.toString() ?? 'Genel Kültür',
      totalQuestions: (map['total_questions'] as num?)?.toInt() ?? 0,
      correctCount: (map['correct_count'] as num?)?.toInt() ?? 0,
      wrongCount: (map['wrong_count'] as num?)?.toInt() ?? 0,
      emptyCount: (map['empty_count'] as num?)?.toInt() ?? 0,
      netScore: (map['net_score'] as num?)?.toDouble() ?? 0.0,
      earnedXp: (map['earned_xp'] as num?)?.toInt() ?? 0,
      durationSeconds: (map['duration_seconds'] as num?)?.toInt() ?? 0,
      completedAt: map['completed_at'] != null
          ? DateTime.tryParse(map['completed_at'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  /// Veritabanı ve yerel depolama için Map çıktısı verir.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'session_title': title,
      'lesson': lesson,
      'total_questions': totalQuestions,
      'correct_count': correctCount,
      'wrong_count': wrongCount,
      'empty_count': emptyCount,
      'net_score': netScore,
      'earned_xp': earnedXp,
      'duration_seconds': durationSeconds,
      'completed_at': completedAt.toIso8601String(),
    };
  }
}
