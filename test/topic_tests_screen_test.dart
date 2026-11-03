import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

class MockQuestionRepository extends QuestionRepository {
  final List<Question> mockQuestions;
  const MockQuestionRepository(this.mockQuestions);

  @override
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
  }) async => mockQuestions;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // 25 adet karışık zorlukta test sorusu üret
  final sampleQuestions = List.generate(
    25,
    (index) => Question(
      id: 'q_$index',
      lesson: 'Tarih',
      topic: 'İslamiyet Öncesi Türk Tarihi',
      text: 'Soru metni $index',
      options: const ['A', 'B', 'C', 'D', 'E'],
      correctIndex: 0,
      explanation: 'Açıklama $index',
      // İlk 10 soru karışık zorluk (3, 2, 1)
      difficulty: (index % 3 + 1).toString(),
    ),
  );

  testWidgets(
    'TopicTestsScreen soruları 10arlı paketlere bölmeli ve kolaydan zora sıralamalı',
    (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            questionRepositoryProvider.overrideWithValue(
              MockQuestionRepository(sampleQuestions),
            ),
          ],
          child: const MaterialApp(
            home: TopicTestsScreen(
              lessonName: 'Tarih',
              topic: 'İslamiyet Öncesi Türk Tarihi',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 25 soru -> 10 + 10 + 5 olmak üzere 3 test oluşmalı
      expect(find.text('TEST 1'), findsOneWidget);
      expect(find.text('TEST 2'), findsOneWidget);
      expect(find.text('TEST 3'), findsOneWidget);

      // İlk teste tıkla
      await tester.tap(find.text('TEST 1'));
      await tester.pumpAndSettle();

      // QuizScreen açılmalı ve başlığında 'Test 1' yazmalı
      expect(find.byType(QuizScreen), findsOneWidget);
      expect(
        find.text('Tarih · İslamiyet Öncesi Türk Tarihi · Test 1'),
        findsOneWidget,
      );
    },
  );
}
