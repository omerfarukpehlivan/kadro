import 'package:kadro/core/utils/leitner_scheduler.dart';

/// Tekil bir Hap Bilgi Kartının (`Flashcard`) seçili sınav kapsamındaki Leitner
/// aralıklı tekrar ilerlemesini temsil eder (`TASK-158`).
///
/// Angular/Web Karşılığı: Sabit içerik modelinden bağımsız kullanıcı ilerleme
/// kaydı (`FlashcardReviewState`).
class FlashcardReviewProgress {
  final String cardId;
  final String examScope;
  final int reviewBox;
  final DateTime nextReviewAt;
  final DateTime? lastReviewedAt;
  final int box4ConsecutiveCorrect;
  final bool isGraduated;

  const FlashcardReviewProgress({
    required this.cardId,
    required this.examScope,
    this.reviewBox = LeitnerScheduler.minBox,
    required this.nextReviewAt,
    this.lastReviewedAt,
    this.box4ConsecutiveCorrect = 0,
    this.isGraduated = false,
  });

  /// Vadesinin gelip gelmediğini kontrol eder; mezun olmuş kartlar günlük zorunlu
  /// tekrar kuyruğuna tekrar sokulmaz.
  bool isDue({DateTime? now}) {
    if (isGraduated) return false;
    return LeitnerScheduler.isDue(nextReviewAt, now: now);
  }

  FlashcardReviewProgress copyWith({
    String? cardId,
    String? examScope,
    int? reviewBox,
    DateTime? nextReviewAt,
    DateTime? lastReviewedAt,
    int? box4ConsecutiveCorrect,
    bool? isGraduated,
  }) {
    return FlashcardReviewProgress(
      cardId: cardId ?? this.cardId,
      examScope: examScope ?? this.examScope,
      reviewBox: (reviewBox ?? this.reviewBox).clamp(
        LeitnerScheduler.minBox,
        LeitnerScheduler.maxBox,
      ),
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      box4ConsecutiveCorrect:
          box4ConsecutiveCorrect ?? this.box4ConsecutiveCorrect,
      isGraduated: isGraduated ?? this.isGraduated,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card_id': cardId,
      'exam_scope': examScope,
      'review_box': reviewBox,
      'next_review_at': nextReviewAt.toIso8601String(),
      if (lastReviewedAt != null)
        'last_reviewed_at': lastReviewedAt!.toIso8601String(),
      'box4_consecutive_correct': box4ConsecutiveCorrect,
      'is_graduated': isGraduated,
    };
  }

  factory FlashcardReviewProgress.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();
    return FlashcardReviewProgress(
      cardId: (json['card_id'] as String? ?? '').trim(),
      examScope: (json['exam_scope'] as String? ?? 'lisans_gk').trim(),
      reviewBox: ((json['review_box'] as num?)?.toInt() ?? 1).clamp(
        LeitnerScheduler.minBox,
        LeitnerScheduler.maxBox,
      ),
      nextReviewAt: json['next_review_at'] is String
          ? (DateTime.tryParse(json['next_review_at'] as String) ?? now)
          : now,
      lastReviewedAt: json['last_reviewed_at'] is String
          ? DateTime.tryParse(json['last_reviewed_at'] as String)
          : null,
      box4ConsecutiveCorrect:
          ((json['box4_consecutive_correct'] as num?)?.toInt() ?? 0).clamp(
            0,
            10,
          ),
      isGraduated: json['is_graduated'] as bool? ?? false,
    );
  }
}
