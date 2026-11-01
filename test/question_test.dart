import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/utils/exam_utils.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

void main() {
  group('Question Model', () {
    test('JSON dönüşümü (fromJson ve toJson) eksiksiz çalışmalı', () {
      final json = {
        'id': 'tar_001',
        'lesson': 'Tarih',
        'topic': 'İlk Türk Devletleri',
        'text': 'Uygurlar hakkında bir soru',
        'options': ['A', 'B', 'C', 'D', 'E'],
        'correctIndex': 2,
        'explanation': 'Açıklama metni',
        'difficulty': 'medium',
      };

      final question = Question.fromJson(json);

      expect(question.id, 'tar_001');
      expect(question.lesson, 'Tarih');
      expect(question.options.length, 5);
      expect(question.isCorrect(2), true);
      expect(question.isCorrect(0), false);
      expect(question.isCorrect(null), false);

      expect(question.toJson(), json);
    });
  });

  group('KPSS Net Hesabı (calculateNet)', () {
    test('4 yanlış 1 doğruyu götürmeli', () {
      // 20 doğru, 4 yanlış -> 19 net
      expect(calculateNet(correct: 20, wrong: 4), 19.0);

      // 60 soru: 50 doğru, 10 yanlış -> 50 - 2.5 = 47.5 net
      expect(calculateNet(correct: 50, wrong: 10), 47.5);
    });

    test('Tüm sorular doğru veya boş olduğunda net doğru sayısına eşittir', () {
      expect(calculateNet(correct: 30, wrong: 0), 30.0);
    });

    test('Negatif değer girildiğinde hata fırlatmalı', () {
      expect(
        () => calculateNet(correct: -1, wrong: 0),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
