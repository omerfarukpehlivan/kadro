import 'dart:async';

import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/features/mistakes/data/models/mistake_review_entry.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';

/// Testlerde yanlış çözülen soruları Leitner (`1·3·7·14 gün`) kutu durumlarıyla
/// bellekte, yerel depoda ([LocalStorageService]) ve Supabase'de yöneten repository.
///
/// Angular'daki `@Injectable({ providedIn: 'root' })` singleton servis yapısının
/// saf Dart karşılığıdır.
class MistakeRepository {
  static final List<MistakeReviewEntry> _entries = [];
  static final LocalStorageService _storage = LocalStorageService();
  static const CloudSyncRepository _cloudSync = CloudSyncRepository();

  const MistakeRepository();

  /// Yanlış defterindeki soruların değiştirilemez (unmodifiable) listesini döner.
  List<Question> getMistakes() =>
      List.unmodifiable(_entries.map((entry) => entry.question));

  static Set<String> _equivalentScopesFor(String examScope) {
    final trimmed = examScope.trim();
    if (trimmed.isEmpty) return const {};
    for (final level in const ['lisans', 'onlisans', 'ortaogretim']) {
      if (trimmed == '${level}_gk' || trimmed == '${level}_gygk') {
        return {'${level}_gk', '${level}_gygk'};
      }
    }
    return {trimmed};
  }

  /// Leitner kutu ve vade meta verilerini içeren tüm yanlış defteri kayıtlarını döner.
  List<MistakeReviewEntry> getReviewEntries({String? examScope}) {
    if (examScope == null) {
      return List.unmodifiable(_entries);
    }
    final accepted = _equivalentScopesFor(examScope);
    final source = _entries.where(
      (e) =>
          accepted.contains(e.examScope) ||
          e.question.examScopes.any(accepted.contains),
    );
    return List.unmodifiable(source);
  }

  /// Vadesi gelmiş ("Bugün Tekrar Edilecek") kayıtları en acilden başa sıralı döner.
  List<MistakeReviewEntry> getDueEntries({String? examScope, DateTime? now}) {
    final reference = now ?? DateTime.now();
    final due =
        getReviewEntries(examScope: examScope)
            .where((entry) => entry.isDue(now: reference))
            .toList()
          ..sort((a, b) {
            final dateOrder = a.nextReviewAt.compareTo(b.nextReviewAt);
            if (dateOrder != 0) return dateOrder;
            return a.reviewBox.compareTo(b.reviewBox);
          });
    return List.unmodifiable(due);
  }

  /// Vadesi gelmiş yanlış soruların yalnızca [Question] listesini döner.
  List<Question> getDueMistakes({String? examScope, DateTime? now}) =>
      List.unmodifiable(
        getDueEntries(examScope: examScope, now: now).map((e) => e.question),
      );

  /// Belirli bir soru ID'si için varsa aktif Leitner kaydını döner.
  MistakeReviewEntry? entryFor(String questionId) {
    for (final entry in _entries) {
      if (entry.question.id == questionId) return entry;
    }
    return null;
  }

  /// Yanlış çözülen bir soruyu deftere ekler (zaten varsa Kutu 1'e geri düşürür).
  void addMistake(
    Question question, {
    String examScope = 'lisans_gk',
    DateTime? now,
  }) {
    final effectiveNow = now ?? DateTime.now();
    final existingIdx = _entries.indexWhere(
      (entry) => entry.question.id == question.id,
    );

    if (existingIdx == -1) {
      final entry = MistakeReviewEntry.initial(
        question: question,
        examScope: examScope,
        now: effectiveNow,
      );
      _entries.add(entry);
      unawaited(_storage.saveMistakeEntries(_entries));
      unawaited(
        _cloudSync.syncMistakeReviewState(
          questionText: question.text,
          reviewBox: entry.reviewBox,
          nextReviewAt: entry.nextReviewAt,
          box4Streak: entry.box4ConsecutiveCorrect,
          isResolved: false,
        ),
      );
      return;
    }

    final existing = _entries[existingIdx];
    final transition = LeitnerScheduler.advance(
      currentBox: existing.reviewBox,
      currentBox4Streak: existing.box4ConsecutiveCorrect,
      isCorrect: false,
      now: effectiveNow,
    );
    final updated = existing.copyWith(
      question: question,
      reviewBox: transition.reviewBox,
      nextReviewAt: transition.nextReviewAt,
      lastReviewedAt: transition.lastReviewedAt,
      box4ConsecutiveCorrect: transition.box4ConsecutiveCorrect,
    );
    _entries[existingIdx] = updated;
    unawaited(_storage.saveMistakeEntries(_entries));
    unawaited(
      _cloudSync.syncMistakeReviewState(
        questionText: updated.question.text,
        reviewBox: updated.reviewBox,
        nextReviewAt: updated.nextReviewAt,
        box4Streak: updated.box4ConsecutiveCorrect,
        isResolved: false,
      ),
    );
  }

  /// Soru tekrar çözüldüğünde Leitner kutusunu (`1·3·7·14 gün`) ilerletir veya
  /// yanlışta Kutu 1'e düşürür; Kutu 4'te 2 doğru tamamlanınca mezun eder.
  LeitnerTransition? recordReviewOutcome(
    String questionId, {
    required bool isCorrect,
    String examScope = 'lisans_gk',
    DateTime? now,
    Question? fallbackQuestion,
  }) {
    final effectiveNow = now ?? DateTime.now();
    final idx = _entries.indexWhere((entry) => entry.question.id == questionId);
    if (idx == -1) {
      if (!isCorrect && fallbackQuestion != null) {
        addMistake(fallbackQuestion, examScope: examScope, now: effectiveNow);
      }
      return null;
    }

    final existing = _entries[idx];
    final transition = LeitnerScheduler.advance(
      currentBox: existing.reviewBox,
      currentBox4Streak: existing.box4ConsecutiveCorrect,
      isCorrect: isCorrect,
      now: effectiveNow,
    );

    if (transition.isGraduated) {
      _entries.removeAt(idx);
      unawaited(_storage.saveMistakeEntries(_entries));
      unawaited(
        _cloudSync.syncMistakeReviewState(
          questionText: existing.question.text,
          reviewBox: transition.reviewBox,
          nextReviewAt: transition.nextReviewAt,
          box4Streak: transition.box4ConsecutiveCorrect,
          isResolved: true,
        ),
      );
      return transition;
    }

    final updated = existing.copyWith(
      reviewBox: transition.reviewBox,
      nextReviewAt: transition.nextReviewAt,
      lastReviewedAt: transition.lastReviewedAt,
      box4ConsecutiveCorrect: transition.box4ConsecutiveCorrect,
    );
    _entries[idx] = updated;
    unawaited(_storage.saveMistakeEntries(_entries));
    unawaited(
      _cloudSync.syncMistakeReviewState(
        questionText: updated.question.text,
        reviewBox: updated.reviewBox,
        nextReviewAt: updated.nextReviewAt,
        box4Streak: updated.box4ConsecutiveCorrect,
        isResolved: false,
      ),
    );
    return transition;
  }

  /// Kullanıcı çöp kutusu ikonuyla manuel sildiğinde soruyu kalıcı olarak çıkarır
  /// ve Supabase üzerinde `is_resolved_in_mistakes = true` yapar.
  void removeMistake(String questionId) {
    MistakeReviewEntry? resolvedEntry;
    for (final entry in _entries) {
      if (entry.question.id == questionId) {
        resolvedEntry = entry;
        break;
      }
    }

    _entries.removeWhere((entry) => entry.question.id == questionId);
    unawaited(_storage.saveMistakeEntries(_entries));

    if (resolvedEntry != null) {
      unawaited(
        _cloudSync.markMistakeResolved(
          questionText: resolvedEntry.question.text,
        ),
      );
    }
  }

  /// Yerel depodan kaydedilmiş Leitner yanlış defteri kayıtlarını yükler.
  Future<void> loadFromStorage() async {
    final saved = await _storage.loadMistakeEntries();
    if (saved.isNotEmpty) {
      _entries
        ..clear()
        ..addAll(saved);
    }
  }

  /// Buluttaki çözülmemiş yanlış soruları ve Leitner kutu/vade alanlarını çeker.
  ///
  /// Performans & Egress (`TASK-129`): Tüm soru havuzunu indirmek yerine
  /// yalnızca eksik `question_id` listesini [QuestionRepository.fetchQuestionsByIds]
  /// ile nokta atışı çeker; ID bulunamazsa yerel JSON üzerinden `text` eşleşmesine düşer.
  Future<void> hydrateFromCloud([
    QuestionRepository questionRepository = const QuestionRepository(),
    CloudSyncRepository? cloudSync,
  ]) async {
    final syncRepo = cloudSync ?? _cloudSync;
    final unresolvedLogs = await syncRepo.fetchUnresolvedMistakes();
    if (unresolvedLogs.isEmpty) return;

    final pendingLogs = <Map<String, dynamic>>[];
    final missingIds = <String>[];
    final seenMissingIds = <String>{};

    for (final log in unresolvedLogs) {
      final qId = (log['question_id'] as String?)?.trim();
      final qText = (log['question_text'] as String?)?.trim();

      final alreadyExists = _entries.any(
        (m) =>
            (qId != null && qId.isNotEmpty && m.question.id == qId) ||
            (qText != null &&
                qText.isNotEmpty &&
                m.question.text.trim() == qText),
      );
      if (alreadyExists) continue;

      pendingLogs.add(log);
      if (qId != null && qId.isNotEmpty && seenMissingIds.add(qId)) {
        missingIds.add(qId);
      }
    }

    if (pendingLogs.isEmpty) return;

    final fetchedById = <String, Question>{};
    if (missingIds.isNotEmpty) {
      try {
        final matchedByIds = await questionRepository.fetchQuestionsByIds(
          missingIds,
        );
        for (final q in matchedByIds) {
          fetchedById[q.id] = q;
        }
      } catch (_) {}
    }

    final needsTextFallback = pendingLogs.any((log) {
      final qId = (log['question_id'] as String?)?.trim();
      final qText = (log['question_text'] as String?)?.trim();
      final resolvedById = qId != null && fetchedById.containsKey(qId);
      return !resolvedById && qText != null && qText.isNotEmpty;
    });

    List<Question> localPool = const <Question>[];
    if (needsTextFallback) {
      try {
        localPool = await questionRepository.loadAllQuestions();
      } catch (_) {
        localPool = defaultSampleQuestions;
      }
    }

    final localByText = <String, Question>{
      for (final q in localPool) q.text.trim(): q,
    };

    final now = DateTime.now();
    for (final log in pendingLogs) {
      final qId = (log['question_id'] as String?)?.trim();
      final qText = (log['question_text'] as String?)?.trim();

      final matched =
          (qId != null ? fetchedById[qId] : null) ??
          (qText != null ? localByText[qText] : null);
      if (matched == null) continue;

      final duplicate = _entries.any(
        (m) =>
            m.question.id == matched.id ||
            m.question.text.trim() == matched.text.trim(),
      );
      if (!duplicate) {
        final rawScope = (log['exam_scope'] as String?)?.trim();
        final reviewBox = ((log['review_box'] as num?)?.toInt() ?? 1).clamp(
          LeitnerScheduler.minBox,
          LeitnerScheduler.maxBox,
        );
        final nextReview = log['next_review_at'] is String
            ? (DateTime.tryParse(log['next_review_at'] as String) ?? now)
            : now;
        final streak = ((log['box4_streak'] as num?)?.toInt() ?? 0).clamp(
          0,
          10,
        );
        _entries.add(
          MistakeReviewEntry(
            question: matched,
            examScope: (rawScope != null && rawScope.isNotEmpty)
                ? rawScope
                : (matched.examScopes.isNotEmpty
                      ? matched.examScopes.first
                      : 'lisans_gk'),
            reviewBox: reviewBox,
            nextReviewAt: nextReview,
            box4ConsecutiveCorrect: streak,
          ),
        );
      }
    }

    unawaited(_storage.saveMistakeEntries(_entries));
  }

  /// Oturum kapatıldığında veya kullanıcı değiştiğinde yerel yanlış defterini temizler.
  void clearLocal() {
    _entries.clear();
    unawaited(_storage.saveMistakeEntries([]));
  }

  /// Birim ve widget testlerinde state izolasyonu sağlamak için listeyi temizler.
  void clearForTest() {
    _entries.clear();
  }
}
