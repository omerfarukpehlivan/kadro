import 'dart:async';

import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/models/flashcard_review_progress.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';

/// Hap bilgi kartlarının (`Flashcard`) seçili sınav kapsamındaki Leitner
/// (`1·3·7·14 gün`) aralıklı tekrar ilerlemesini yöneten repository (`TASK-158`).
///
/// Angular/Web Karşılığı: Kapsam anahtarlı kart tekrar durumunu yerel ve bulut
/// depoyla senkron tutan singleton `FlashcardReviewService`.
class FlashcardReviewRepository {
  static final Map<String, Map<String, FlashcardReviewProgress>> _byScope = {};
  static final LocalStorageService _storage = LocalStorageService();
  static const CloudSyncRepository _cloudSync = CloudSyncRepository();

  const FlashcardReviewRepository();

  static String _canonicalScope(String examScope) {
    final trimmed = examScope.trim();
    if (trimmed.isEmpty || trimmed == 'lisans_gk' || trimmed == 'lisans_gygk') {
      return 'lisans_gygk';
    }
    if (trimmed == 'onlisans_gk' || trimmed == 'onlisans_gygk') {
      return 'onlisans_gygk';
    }
    if (trimmed == 'ortaogretim_gk' || trimmed == 'ortaogretim_gygk') {
      return 'ortaogretim_gygk';
    }
    return trimmed;
  }

  Map<String, FlashcardReviewProgress> _scopeMap(String examScope) {
    final normalized = _canonicalScope(examScope);
    return _byScope.putIfAbsent(
      normalized,
      () => <String, FlashcardReviewProgress>{},
    );
  }

  /// Kartın aktif sınav kapsamındaki mevcut tekrar ilerlemesini döner.
  FlashcardReviewProgress? progressFor(
    String cardId, {
    String examScope = 'lisans_gk',
  }) {
    return _scopeMap(examScope)[cardId];
  }

  /// Kartın gösterdiği Leitner kutu numarasını (`1..4`) döner.
  int boxFor(String cardId, {String examScope = 'lisans_gk'}) {
    return progressFor(cardId, examScope: examScope)?.reviewBox ??
        LeitnerScheduler.minBox;
  }

  /// Kart tekrar edildikçe ("Biliyorum" / "Tekrar Et") Leitner kutusunu günceller.
  FlashcardReviewProgress recordOutcome(
    Flashcard card, {
    required bool isLearned,
    String examScope = 'lisans_gk',
    DateTime? now,
  }) {
    final effectiveNow = now ?? DateTime.now();
    final map = _scopeMap(examScope);
    final existing = map[card.id];
    final currentBox = existing?.reviewBox ?? LeitnerScheduler.minBox;
    final currentStreak = existing?.box4ConsecutiveCorrect ?? 0;

    final transition = LeitnerScheduler.advance(
      currentBox: currentBox,
      currentBox4Streak: currentStreak,
      isCorrect: isLearned,
      now: effectiveNow,
    );

    final updated = FlashcardReviewProgress(
      cardId: card.id,
      examScope: examScope,
      reviewBox: transition.reviewBox,
      nextReviewAt: transition.nextReviewAt,
      lastReviewedAt: transition.lastReviewedAt,
      box4ConsecutiveCorrect: transition.box4ConsecutiveCorrect,
      isGraduated: transition.isGraduated,
    );

    map[card.id] = updated;
    unawaited(_storage.saveFlashcardReviews(examScope, map));
    unawaited(_cloudSync.upsertFlashcardReview(updated));
    return updated;
  }

  /// Verilen kart havuzundan çalışma geçmişine girip tekrar vadesi gelmiş
  /// kartları aciliyet sırasıyla döner.
  List<Flashcard> dueCardsFrom(
    List<Flashcard> pool, {
    String examScope = 'lisans_gk',
    DateTime? now,
  }) {
    final reference = now ?? DateTime.now();
    final map = _scopeMap(examScope);
    final dueEntries = <(Flashcard, FlashcardReviewProgress)>[];

    for (final card in pool) {
      final progress = map[card.id];
      if (progress != null && progress.isDue(now: reference)) {
        dueEntries.add((card, progress));
      }
    }

    dueEntries.sort((a, b) {
      final dateOrder = a.$2.nextReviewAt.compareTo(b.$2.nextReviewAt);
      if (dateOrder != 0) return dateOrder;
      return a.$2.reviewBox.compareTo(b.$2.reviewBox);
    });

    return List.unmodifiable(dueEntries.map((e) => e.$1));
  }

  /// Seçili sınav kapsamında bugün tekrar edilmesi gereken kart sayısını döner.
  int dueCountFor(
    List<Flashcard> pool, {
    String examScope = 'lisans_gk',
    DateTime? now,
  }) {
    final reference = now ?? DateTime.now();
    final map = _scopeMap(examScope);
    var count = 0;
    for (final card in pool) {
      final progress = map[card.id];
      if (progress != null && progress.isDue(now: reference)) {
        count++;
      }
    }
    return count;
  }

  /// Yerel depodan ilgili sınav kapsamının bilgi kartı tekrar durumunu yükler.
  Future<void> loadFromStorage(String examScope) async {
    final canonical = _canonicalScope(examScope);
    final loaded = await _storage.loadFlashcardReviews(examScope);
    if (loaded.isNotEmpty) {
      final map = _byScope.putIfAbsent(
        canonical,
        () => <String, FlashcardReviewProgress>{},
      );
      map.addAll(loaded);
      return;
    }
    if (canonical == 'lisans_gygk') {
      final legacyLoaded = await _storage.loadFlashcardReviews('lisans_gk');
      if (legacyLoaded.isNotEmpty) {
        final map = _byScope.putIfAbsent(
          canonical,
          () => <String, FlashcardReviewProgress>{},
        );
        map.addAll(legacyLoaded);
      }
    }
  }

  /// Supabase bulutundaki kart tekrar kayıtlarını yerel havuzla birleştirir.
  Future<void> hydrateFromCloud(
    String examScope, {
    CloudSyncRepository? cloudSync,
  }) async {
    final syncRepo = cloudSync ?? _cloudSync;
    final remote = await syncRepo.fetchFlashcardReviews(examScope: examScope);
    if (remote.isEmpty) return;

    final map = _scopeMap(examScope);
    for (final item in remote) {
      final local = map[item.cardId];
      if (local == null) {
        map[item.cardId] = item;
      } else {
        final localTs = local.lastReviewedAt;
        final remoteTs = item.lastReviewedAt;
        if (remoteTs != null &&
            (localTs == null || remoteTs.isAfter(localTs))) {
          map[item.cardId] = item;
        }
      }
    }
    unawaited(_storage.saveFlashcardReviews(examScope, map));
  }

  /// Oturum kapatıldığında bellekteki tüm kart tekrar durumlarını sıfırlar.
  void clearLocal() {
    _byScope.clear();
  }

  /// Testler arası izolasyon sağlamak için belleği temizler.
  void clearForTest() {
    _byScope.clear();
  }
}
