import 'package:kadro/features/quiz/data/models/question.dart';

/// Testlerde yanlış çözülen soruları bellekte (in-memory) tutan repository sınıfı.
///
/// Angular'daki `@Injectable({ providedIn: 'root' })` singleton servis yapısının
/// saf Dart karşılığıdır.
/// Faz 1'de in-memory static liste ile çalışır; Faz 2'de (Backend Fazı) bu sınıf
/// .NET Web API ve PostgreSQL (Supabase) veritabanına bağlanacaktır.
class MistakeRepository {
  static final List<Question> _mistakes = [];

  const MistakeRepository();

  /// Yanlış defterindeki soruların değiştirilemez (unmodifiable) kopyasını döner.
  List<Question> getMistakes() => List.unmodifiable(_mistakes);

  /// Soru daha önce eklenmemişse (aynı id yoksa) listeye ekler.
  void addMistake(Question question) {
    if (!_mistakes.any((q) => q.id == question.id)) {
      _mistakes.add(question);
    }
  }

  /// Soru doğru çözüldüğünde veya kullanıcı sildiğinde listeden çıkarır.
  void removeMistake(String questionId) {
    _mistakes.removeWhere((q) => q.id == questionId);
  }

  /// Birim ve widget testlerinde state izolasyonu sağlamak için listeyi temizler.
  void clearForTest() {
    _mistakes.clear();
  }
}
