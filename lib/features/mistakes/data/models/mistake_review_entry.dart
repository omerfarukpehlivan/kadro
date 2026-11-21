import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Yanlış Defteri içindeki bir sorunun Leitner (`1·3·7·14 gün`) aralıklı tekrar
/// durumunu tutan veri modeli (`TASK-158`).
///
/// Angular/Web Karşılığı: Yanlış soru nesnesini `reviewBox` ve `nextReviewAt`
/// meta verisiyle saran `MistakeReviewItem` DTO'sudur.
class MistakeReviewEntry {
  final Question question;
  final String examScope;
  final int reviewBox;
  final DateTime nextReviewAt;
  final DateTime? lastReviewedAt;
  final int box4ConsecutiveCorrect;

  const MistakeReviewEntry({
    required this.question,
    this.examScope = 'lisans_gk',
    this.reviewBox = LeitnerScheduler.minBox,
    required this.nextReviewAt,
    this.lastReviewedAt,
    this.box4ConsecutiveCorrect = 0,
  });

  /// Yeni yanlış yapılan bir soru için Kutu 1'de hemen vadesi gelmiş kayıt üretir.
  factory MistakeReviewEntry.initial({
    required Question question,
    String examScope = 'lisans_gk',
    DateTime? now,
  }) {
    return MistakeReviewEntry(
      question: question,
      examScope: examScope,
      reviewBox: LeitnerScheduler.minBox,
      nextReviewAt: now ?? DateTime.now(),
      box4ConsecutiveCorrect: 0,
    );
  }

  /// Tekrar kuyruğunda vadesinin gelip gelmediğini döner.
  bool isDue({DateTime? now}) => LeitnerScheduler.isDue(nextReviewAt, now: now);

  MistakeReviewEntry copyWith({
    Question? question,
    String? examScope,
    int? reviewBox,
    DateTime? nextReviewAt,
    DateTime? lastReviewedAt,
    int? box4ConsecutiveCorrect,
  }) {
    return MistakeReviewEntry(
      question: question ?? this.question,
      examScope: examScope ?? this.examScope,
      reviewBox: (reviewBox ?? this.reviewBox).clamp(
        LeitnerScheduler.minBox,
        LeitnerScheduler.maxBox,
      ),
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      box4ConsecutiveCorrect:
          box4ConsecutiveCorrect ?? this.box4ConsecutiveCorrect,
    );
  }

  /// JSON formatına serileştirir.
  Map<String, dynamic> toJson() {
    return {
      'question': question.toJson(),
      'exam_scope': examScope,
      'review_box': reviewBox,
      'next_review_at': nextReviewAt.toIso8601String(),
      if (lastReviewedAt != null)
        'last_reviewed_at': lastReviewedAt!.toIso8601String(),
      'box4_consecutive_correct': box4ConsecutiveCorrect,
    };
  }

  /// Hem yeni Leitner sarmalı JSON formatını hem eski düz `Question` JSON
  /// kaydını geriye dönük uyumlu biçimde ayrıştırır.
  factory MistakeReviewEntry.fromJson(
    Map<String, dynamic> json, {
    DateTime? fallbackNow,
  }) {
    final now = fallbackNow ?? DateTime.now();

    if (json['question'] is Map<String, dynamic>) {
      final question = Question.fromJson(
        json['question'] as Map<String, dynamic>,
      );
      final rawScope = json['exam_scope'] as String?;
      final parsedNext = json['next_review_at'] is String
          ? DateTime.tryParse(json['next_review_at'] as String)
          : null;
      final parsedLast = json['last_reviewed_at'] is String
          ? DateTime.tryParse(json['last_reviewed_at'] as String)
          : null;
      final rawBox = (json['review_box'] as num?)?.toInt() ?? 1;
      final rawStreak =
          (json['box4_consecutive_correct'] as num?)?.toInt() ?? 0;

      return MistakeReviewEntry(
        question: question,
        examScope: (rawScope != null && rawScope.trim().isNotEmpty)
            ? rawScope.trim()
            : (question.examScopes.isNotEmpty
                  ? question.examScopes.first
                  : 'lisans_gk'),
        reviewBox: rawBox.clamp(
          LeitnerScheduler.minBox,
          LeitnerScheduler.maxBox,
        ),
        nextReviewAt: parsedNext ?? now,
        lastReviewedAt: parsedLast,
        box4ConsecutiveCorrect: rawStreak.clamp(0, 10),
      );
    }

    // Eski düz List<Question> JSON formatından Kutu 1 olarak otomatik geçiş
    final legacyQuestion = Question.fromJson(json);
    return MistakeReviewEntry.initial(
      question: legacyQuestion,
      examScope: legacyQuestion.examScopes.isNotEmpty
          ? legacyQuestion.examScopes.first
          : 'lisans_gk',
      now: now,
    );
  }
}
