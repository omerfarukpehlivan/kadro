import 'dart:async';

import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Testlerde yanlış çözülen soruları bellekte (in-memory) ve yerel depoda (LocalStorage)
/// tutan repository sınıfı.
///
/// Angular'daki `@Injectable({ providedIn: 'root' })` singleton servis yapısının
/// saf Dart karşılığıdır.
class MistakeRepository {
  static final List<Question> _mistakes = [];
  static final LocalStorageService _storage = LocalStorageService();

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

  /// Soru doğru çözüldüğünde veya kullanıcı sildiğinde listeden çıkarır.
  void removeMistake(String questionId) {
    _mistakes.removeWhere((q) => q.id == questionId);
    unawaited(_storage.saveMistakes(_mistakes));
  }

  /// Yerel depodan kaydedilmiş yanlış soruları belleğe yükler.
  Future<void> loadFromStorage() async {
    final saved = await _storage.loadMistakes();
    if (saved.isNotEmpty) {
      _mistakes.clear();
      _mistakes.addAll(saved);
    }
  }

  /// Birim ve widget testlerinde state izolasyonu sağlamak için listeyi temizler.
  void clearForTest() {
    _mistakes.clear();
    unawaited(_storage.saveMistakes(_mistakes));
  }
}
