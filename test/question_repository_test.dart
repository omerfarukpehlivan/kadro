import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QuestionRepository', () {
    const repository = QuestionRepository();

    test('loadAllQuestions tüm soruları yükler', () async {
      final questions = await repository.loadAllQuestions();

      expect(questions.isNotEmpty, true);
      expect(questions.length >= 12, true);

      final lessons = questions.map((q) => q.lesson).toSet();
      expect(lessons.contains('Tarih'), true);
      expect(lessons.contains('Coğrafya'), true);
      expect(lessons.contains('Vatandaşlık'), true);
      expect(lessons.contains('Güncel Bilgiler'), true);
    });

    test('getQuestionsByLesson ders adına göre filtreler', () async {
      final tarihQuestions = await repository.getQuestionsByLesson('Tarih');
      expect(tarihQuestions.length, 3);
      expect(tarihQuestions.first.lesson, 'Tarih');
      expect(tarihQuestions.first.id, 'tar_001');

      final vatandaslikQuestions = await repository.getQuestionsByLesson(
        'Vatandaşlık',
      );
      expect(vatandaslikQuestions.length, 3);
      expect(vatandaslikQuestions.first.lesson, 'Vatandaşlık');
      expect(vatandaslikQuestions.first.id, 'vat_001');

      final olmayanDers = await repository.getQuestionsByLesson('Fizik');
      expect(olmayanDers.isEmpty, true);
    });

    test('fetchQuestions(lesson: "Coğrafya") yalnızca Coğrafya sorularını getirmeli', () async {
      final cografyaQuestions = await repository.fetchQuestions(
        lesson: 'Coğrafya',
      );

      expect(cografyaQuestions.isNotEmpty, true);
      expect(cografyaQuestions.length, 3);
      expect(cografyaQuestions.every((q) => q.lesson == 'Coğrafya'), true);
      expect(
        cografyaQuestions.any(
          (q) => q.topic == 'Türkiye\'nin Fiziki Özellikleri',
        ),
        true,
      );
    });

    test('fetchQuestions konu bazlı filtreleme ve güvenli fallback', () async {
      final topicQuestions = await repository.fetchQuestions(
        lesson: 'Tarih',
        topic: 'İlk Türk Devletleri',
      );
      expect(topicQuestions.isNotEmpty, true);
      expect(topicQuestions.first.lesson, 'Tarih');
      expect(topicQuestions.first.topic, 'İlk Türk Devletleri');

      // Olmayan konu verildiğinde dersin genel sorularına düşmeli
      final fallbackQuestions = await repository.fetchQuestions(
        lesson: 'Tarih',
        topic: 'Bilinmeyen Konu XYZ',
      );
      expect(fallbackQuestions.isNotEmpty, true);
      expect(fallbackQuestions.every((q) => q.lesson == 'Tarih'), true);
    });

    test('Hatalı dosya yolunda Exception fırlatmalı', () async {
      const invalidRepo = QuestionRepository(
        assetPath: 'assets/non_existing.json',
      );
      expect(
        () async => await invalidRepo.loadAllQuestions(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
