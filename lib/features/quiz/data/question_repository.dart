import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Soru verilerini yerel JSON dosyasından (ileride .NET API'den) okuyan veri erişim katmanı.
///
/// Angular'daki `QuestionService` veya Repository sınıfının karşılığıdır.
/// UI bileşenleri verinin nereden geldiğini (JSON veya API) bilmez, sadece bu repository'yi çağırır.
class QuestionRepository {
  final String assetPath;

  const QuestionRepository({
    this.assetPath = 'assets/data/questions/sample_questions.json',
  });

  /// Tüm soruları yükler.
  ///
  /// Web'deki `HttpClient.get()` benzeri, `rootBundle.loadString` ile dosya okunur.
  Future<List<Question>> loadAllQuestions() async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final dynamic decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'Beklenen JSON formatı dizi (Array) olmalı.',
        );
      }

      return decoded
          .map((item) => Question.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Sorular yüklenemedi: $e');
    }
  }

  /// Belirli bir derse (`lessonName`) ait soruları filtreleyerek döner.
  Future<List<Question>> getQuestionsByLesson(String lessonName) async {
    final allQuestions = await loadAllQuestions();
    return allQuestions
        .where((question) => question.lesson == lessonName)
        .toList();
  }
}
