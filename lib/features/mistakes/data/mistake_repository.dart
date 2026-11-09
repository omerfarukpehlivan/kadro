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
  /// Çoklu Cihaz Senkronizasyonu (Cross-Device Mistake Hydration):
  /// Kullanıcı Cihaz B'de oturum açtığında Cihaz A'da biriktirdiği yanlış sorular eksiksiz gelir.
  Future<void> hydrateFromCloud([
    QuestionRepository questionRepository = const QuestionRepository(),
  ]) async {
    final unresolvedLogs = await _cloudSync.fetchUnresolvedMistakes();
    if (unresolvedLogs.isEmpty) return;

    List<Question> questionPool = [];
    try {
      questionPool = await questionRepository.fetchQuestions();
    } catch (_) {}

    for (final log in unresolvedLogs) {
      final qId = log['question_id'] as String?;
      final qText = log['question_text'] as String?;

      // Zaten yerel listede var mı kontrol et
      final alreadyExists = _mistakes.any(
        (m) =>
            (qId != null && m.id == qId) || (qText != null && m.text == qText),
      );
      if (alreadyExists) continue;

      // Soru havuzundan eşleşeni bul
      Question? matched;
      if (qId != null) {
        for (final q in questionPool) {
          if (q.id == qId) {
            matched = q;
            break;
          }
        }
      }
      if (matched == null && qText != null) {
        for (final q in questionPool) {
          if (q.text.trim() == qText.trim()) {
            matched = q;
            break;
          }
        }
      }

      if (matched != null) {
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
