import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TASK-87: 60 Soru, 65 Dakika Gerçek KPSS Genel Kültür Deneme Sınavı Motoru & Net Karnesi', () {
    const repository = QuestionRepository();

    test('generateGeneralCultureMockExam tam 60 soru ve doğru ders dağılımı üretmeli', () async {
      final exam = await repository.generateGeneralCultureMockExam(
        examNumber: 1,
      );

      expect(exam.length, equals(60), reason: 'Deneme tam 60 soru olmalıdır');

      // 1..27 Tarih
      final tarihQuestions = exam.sublist(0, 27);
      expect(tarihQuestions.every((q) => q.lesson == 'Tarih'), isTrue);

      // 28..45 Coğrafya
      final cografyaQuestions = exam.sublist(27, 45);
      expect(cografyaQuestions.every((q) => q.lesson == 'Coğrafya'), isTrue);

      // 46..54 Vatandaşlık
      final vatandaslikQuestions = exam.sublist(45, 54);
      expect(
        vatandaslikQuestions.every((q) => q.lesson == 'Vatandaşlık'),
        isTrue,
      );

      // 55..60 Güncel Bilgiler
      final guncelQuestions = exam.sublist(54, 60);
      expect(
        guncelQuestions.every((q) => q.lesson == 'Güncel Bilgiler'),
        isTrue,
      );

      // orderIndex sıralı olmalı (1..60)
      for (var i = 0; i < exam.length; i++) {
        expect(exam[i].orderIndex, equals(i + 1));
        expect(exam[i].options.length, equals(5));
        expect(exam[i].correctIndex, inInclusiveRange(0, 4));
        expect(exam[i].text.trim(), isNotEmpty);
      }
    });

    test(
      'Farklı examNumber farklı soru setleri getirmeli (tekrara düşmeme)',
      () async {
        final exam1 = await repository.generateGeneralCultureMockExam(
          examNumber: 1,
        );
        final exam2 = await repository.generateGeneralCultureMockExam(
          examNumber: 2,
        );

        expect(exam1.length, equals(60));
        expect(exam2.length, equals(60));

        final ids1 = exam1.map((q) => q.id).toSet();
        final ids2 = exam2.map((q) => q.id).toSet();

        // Farklı denemelerin soruları tamamen aynı olmamalı
        final commonIds = ids1.intersection(ids2);
        expect(commonIds.length < 60, isTrue);
      },
    );

    test('QuizResult ve LessonResult 4 yanlış 1 doğru net hesabını ders bazında doğru yapmalı', () {
      final lessonBreakdown = {
        'Tarih': const LessonResult(
          lesson: 'Tarih',
          totalQuestions: 27,
          correctCount: 20,
          wrongCount: 4,
          emptyCount: 3,
        ),
        'Coğrafya': const LessonResult(
          lesson: 'Coğrafya',
          totalQuestions: 18,
          correctCount: 15,
          wrongCount: 2,
          emptyCount: 1,
        ),
        'Vatandaşlık': const LessonResult(
          lesson: 'Vatandaşlık',
          totalQuestions: 9,
          correctCount: 7,
          wrongCount: 1,
          emptyCount: 1,
        ),
        'Güncel Bilgiler': const LessonResult(
          lesson: 'Güncel Bilgiler',
          totalQuestions: 6,
          correctCount: 5,
          wrongCount: 1,
          emptyCount: 0,
        ),
      };

      // Tarih: 20 - (4 / 4) = 19.00 Net
      expect(lessonBreakdown['Tarih']!.net, equals(19.0));
      // Coğrafya: 15 - (2 / 4) = 14.50 Net
      expect(lessonBreakdown['Coğrafya']!.net, equals(14.5));
      // Vatandaşlık: 7 - (1 / 4) = 6.75 Net
      expect(lessonBreakdown['Vatandaşlık']!.net, equals(6.75));
      // Güncel Bilgiler: 5 - (1 / 4) = 4.75 Net
      expect(lessonBreakdown['Güncel Bilgiler']!.net, equals(4.75));

      final result = QuizResult(
        totalQuestions: 60,
        correctCount: 47,
        wrongCount: 8,
        emptyCount: 5,
        lessonBreakdown: lessonBreakdown,
      );

      // Toplam: 47 - (8 / 4) = 45.00 Net
      expect(result.net, equals(45.0));
      expect(result.hasLessonBreakdown, isTrue);
    });

    testWidgets('QuizResultScreen ders bazlı net karnesini başarıyla çizmeli', (
      tester,
    ) async {
      final lessonBreakdown = {
        'Tarih': const LessonResult(
          lesson: 'Tarih',
          totalQuestions: 27,
          correctCount: 20,
          wrongCount: 4,
          emptyCount: 3,
        ),
        'Coğrafya': const LessonResult(
          lesson: 'Coğrafya',
          totalQuestions: 18,
          correctCount: 15,
          wrongCount: 2,
          emptyCount: 1,
        ),
        'Vatandaşlık': const LessonResult(
          lesson: 'Vatandaşlık',
          totalQuestions: 9,
          correctCount: 7,
          wrongCount: 1,
          emptyCount: 1,
        ),
        'Güncel Bilgiler': const LessonResult(
          lesson: 'Güncel Bilgiler',
          totalQuestions: 6,
          correctCount: 5,
          wrongCount: 1,
          emptyCount: 0,
        ),
      };

      final result = QuizResult(
        totalQuestions: 60,
        correctCount: 47,
        wrongCount: 8,
        emptyCount: 5,
        lessonBreakdown: lessonBreakdown,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: QuizResultScreen(
            result: result,
            testTitle: 'Genel Kültür Denemesi #1',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Ders Bazlı Net Karnesi'), findsOneWidget);
      expect(find.text('Tarih (27 Soru)'), findsOneWidget);
      expect(find.text('19.00 Net'), findsOneWidget);
      expect(find.text('Coğrafya (18 Soru)'), findsOneWidget);
      expect(find.text('14.50 Net'), findsOneWidget);
      expect(find.text('Vatandaşlık (9 Soru)'), findsOneWidget);
      expect(find.text('6.75 Net'), findsOneWidget);
      expect(find.text('Güncel Bilgiler (6 Soru)'), findsOneWidget);
      expect(find.text('4.75 Net'), findsOneWidget);
    });
  });
}
