import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/data/flashcard_review_repository.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/shared/widgets/workshop_scope_bridge_banner.dart';

/// Seçili sınav kapsamında o gün tekrar vadesi gelmiş Yanlış Defteri soruları
/// ve Hap Bilgi Kartlarının toplu özetini hesaplayan salt-okunur yardımcı (`TASK-158`).
class LeitnerQueueSummary {
  final int dueMistakesCount;
  final int dueFlashcardsCount;

  const LeitnerQueueSummary({
    required this.dueMistakesCount,
    required this.dueFlashcardsCount,
  });

  int get totalDueCount => dueMistakesCount + dueFlashcardsCount;
  bool get hasDueItems => totalDueCount > 0;

  /// Aktif sınav seçimi için vadesi gelen soru ve bilgi kartı adetlerini hesaplar.
  factory LeitnerQueueSummary.compute({
    required ExamSelection selection,
    MistakeRepository mistakeRepository = const MistakeRepository(),
    FlashcardReviewRepository flashcardReviewRepository =
        const FlashcardReviewRepository(),
    DateTime? now,
  }) {
    final reference = now ?? DateTime.now();
    final dueMistakes = mistakeRepository.getDueEntries(now: reference).length;

    final scopedCards = WorkshopScopeResolution.resolve<Flashcard>(
      selection: selection,
      allItems: sampleFlashcards,
      matchesSelection: (card, sel) => card.matchesSelection(sel),
      matchesGkBridge: (card) =>
          card.matchesSelection(const ExamSelection.bGrubuLisans()),
    ).items;

    final dueCards = flashcardReviewRepository.dueCountFor(
      scopedCards,
      examScope: selection.scopeKey,
      now: reference,
    );

    return LeitnerQueueSummary(
      dueMistakesCount: dueMistakes,
      dueFlashcardsCount: dueCards,
    );
  }
}
