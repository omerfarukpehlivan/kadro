import 'dart:async';

import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';

/// Testlerde yanlış çözülen soruları bellekte (in-memory) ve yerel depoda (LocalStorage)
/// tutan repository sınıfı.
///
/// Angular'daki `@Injectable({ providedIn: 'root' })` singleton servis yapısının
/// saf Dart karşılığıdır.
class MistakeRepository {
  static final List<Question> _mistakes = [];
  static final LocalStorageService _storage = LocalStorageService();
  static const CloudSyncRepository _cloudSync = CloudSyncRepository();

  const MistakeRepository();

  /// Yanlış defterindeki soruların değiştirilemez (unmodifiable) kopyasını döner.
  List<Question> getMistakes() => List.unmodifiable(_mistakes);

  /// Soru daha önce eklenmemişse (aynı id yoksa) listeye ekler ve yerel depoya kaydeder.
  void addMistake(Question question) {
    if (!_mistakes.any((q) => q.id == question.id)) {
      _mistakes.add(question);
      unawaited(_storage.saveMistakes(_mistakes));
    }
  }

  /// Soru doğru çözüldüğünde veya kullanıcı sildiğinde listeden çıkarır
  /// ve Supabase üzerinde `is_resolved_in_mistakes = true` yapar.
  void removeMistake(String questionId) {
    Question? resolvedQuestion;
    for (final q in _mistakes) {
      if (q.id == questionId) {
        resolvedQuestion = q;
        break;
      }
    }

    _mistakes.removeWhere((q) => q.id == questionId);
    unawaited(_storage.saveMistakes(_mistakes));

    if (resolvedQuestion != null) {
      unawaited(
        _cloudSync.markMistakeResolved(questionText: resolvedQuestion.text),
      );
    }
  }

  /// Yerel depodan kaydedilmiş yanlış soruları belleğe yükler.
  Future<void> loadFromStorage() async {
    final saved = await _storage.loadMistakes();
    if (saved.isNotEmpty) {
      _mistakes.clear();
      _mistakes.addAll(saved);
    }
  }

  /// Buluttaki çözülmemiş yanlış soruları çeker ve yerel Yanlış Defteri havuzuyla birleştirir.
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

      final alreadyExists = _mistakes.any(
        (m) =>
            (qId != null && qId.isNotEmpty && m.id == qId) ||
            (qText != null && qText.isNotEmpty && m.text.trim() == qText),
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

    for (final log in pendingLogs) {
      final qId = (log['question_id'] as String?)?.trim();
      final qText = (log['question_text'] as String?)?.trim();

      final matched =
          (qId != null ? fetchedById[qId] : null) ??
          (qText != null ? localByText[qText] : null);
      if (matched == null) continue;

      final duplicate = _mistakes.any(
        (m) => m.id == matched.id || m.text.trim() == matched.text.trim(),
      );
      if (!duplicate) {
        _mistakes.add(matched);
      }
    }

    unawaited(_storage.saveMistakes(_mistakes));
  }

  /// Oturum kapatıldığında veya kullanıcı değiştiğinde yerel yanlış defterini temizler.
  void clearLocal() {
    _mistakes.clear();
    unawaited(_storage.saveMistakes([]));
  }

  /// Birim ve widget testlerinde state izolasyonu sağlamak için listeyi temizler.
  void clearForTest() {
    _mistakes.clear();
  }
}
