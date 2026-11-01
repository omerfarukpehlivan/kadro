import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';

void main() {
  group('QuizResult Model Testleri', () {
    test('Net hesabı 4 yanlış 1 doğruyu götürecek şekilde hesaplanmalı', () {
      const result = QuizResult(
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 4,
        emptyCount: 2, // 8 - (4 / 4) = 7.0
      );

      expect(result.net, equals(7.0));
    });

    test('Başarı yüzdesi doğru hesaplanmalı', () {
      const result = QuizResult(
        totalQuestions: 4,
        correctCount: 3,
        wrongCount: 1,
        emptyCount: 0,
      );

      expect(result.successRate, equals(75));
    });

    test('Toplam soru 0 ise başarı yüzdesi 0 dönmeli', () {
      const result = QuizResult(
        totalQuestions: 0,
        correctCount: 0,
        wrongCount: 0,
        emptyCount: 0,
      );

      expect(result.successRate, equals(0));
    });
  });
}
