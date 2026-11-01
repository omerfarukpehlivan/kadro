import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QuestionRepository', () {
    const repository = QuestionRepository();

    test('loadAllQuestions tüm soruları yükler', () async {
      final questions = await repository.loadAllQuestions();

      expect(questions.isNotEmpty, true);
      expect(questions.length, 4);

      final lessons = questions.map((q) => q.lesson).toSet();
      expect(lessons.contains('Tarih'), true);
      expect(lessons.contains('Coğrafya'), true);
      expect(lessons.contains('Vatandaşlık'), true);
      expect(lessons.contains('Güncel Bilgiler'), true);
    });

    test('getQuestionsByLesson ders adına göre filtreler', () async {
      final tarihQuestions = await repository.getQuestionsByLesson('Tarih');
      expect(tarihQuestions.length, 1);
      expect(tarihQuestions.first.lesson, 'Tarih');
      expect(tarihQuestions.first.id, 'tar_001');

      final vatandaslikQuestions = await repository.getQuestionsByLesson(
        'Vatandaşlık',
      );
      expect(vatandaslikQuestions.length, 1);
      expect(vatandaslikQuestions.first.lesson, 'Vatandaşlık');
      expect(vatandaslikQuestions.first.id, 'vat_001');

      final olmayanDers = await repository.getQuestionsByLesson('Fizik');
      expect(olmayanDers.isEmpty, true);
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
