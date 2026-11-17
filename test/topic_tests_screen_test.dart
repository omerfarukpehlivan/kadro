import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/test_difficulty_tier.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

class MockQuestionRepository extends QuestionRepository {
  final List<Question> mockQuestions;
  const MockQuestionRepository(this.mockQuestions);

  @override
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
    ExamSelection? selection,
    String? difficulty,
    String? preferredSourceVariant,
    bool strictTopicFilter = false,
    bool forceRefresh = false,
    int limit = 60,
  }) async => mockQuestions;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TestDifficultyTier Birim Testleri', () {
    test('Zorluk ortalamasına göre doğru tier döndürülmeli', () {
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(1.0),
        equals(TestDifficultyTier.warmup),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(1.4),
        equals(TestDifficultyTier.warmup),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(1.5),
        equals(TestDifficultyTier.standard),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(2.2),
        equals(TestDifficultyTier.standard),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(2.3),
        equals(TestDifficultyTier.distinction),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(2.6),
        equals(TestDifficultyTier.distinction),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(2.7),
        equals(TestDifficultyTier.trapMaster),
      );
      expect(
        TestDifficultyTierExtension.fromAvgDifficulty(3.0),
        equals(TestDifficultyTier.trapMaster),
      );
    });

    test('Her tier için motive edici başlık, kısa başlık ve açıklama mevcut olmalı', () {
      for (final tier in TestDifficultyTier.values) {
        expect(tier.title, isNotEmpty);
        expect(tier.cleanTitle, isNotEmpty);
        expect(tier.description, isNotEmpty);
      }
    });
  });

  group('TopicTestsScreen Widget Testleri', () {
    // 25 adet test sorusu üret
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
        difficulty: (index % 3 + 1).toString(),
      ),
    );

    testWidgets(
      'TopicTestsScreen soruları 10arlı paketlere bölmeli, motive edici rozetleri ve açıklamaları göstermeli',
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

        // İlk test (ortalama 1.1) Basit Alıştırma rozeti taşımalı
        expect(find.text('Basit Alıştırma'), findsOneWidget);
        expect(
          find.text(
            'Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları.',
          ),
          findsNothing,
        );

        // İlk teste tıkla
        await tester.tap(find.text('TEST 1'));
        await tester.pumpAndSettle();

        // QuizScreen açılmalı ve başlığında 'Test 1 (Basit Alıştırma)' yazmalı
        expect(find.byType(QuizScreen), findsOneWidget);
        expect(
          find.text(
            'Tarih · İslamiyet Öncesi Türk Tarihi · Test 1 (Basit Alıştırma)',
          ),
          findsOneWidget,
        );
      },
    );
    testWidgets(
      'TASK-75: Çözülmüş bir test için Çözüldü rozeti ve Tekrar Çöz butonu gösterilmeli',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final container = ProviderContainer(
          overrides: [
            questionRepositoryProvider.overrideWithValue(
              MockQuestionRepository(sampleQuestions),
            ),
          ],
        );
        addTearDown(container.dispose);

        // Test 1 için bir çözüm kaydı ekle
        container
            .read(studyStatsProvider.notifier)
            .recordQuizSession(
              QuizSessionRecord(
                id: 'sess_test_1',
                title: 'Tarih · İslamiyet Öncesi Türk Tarihi · Test 1 (Basit Alıştırma)',
                lesson: 'Tarih',
                totalQuestions: 10,
                correctCount: 9,
                wrongCount: 1,
                emptyCount: 0,
                netScore: 8.75,
                earnedXp: 135,
                durationSeconds: 300,
                completedAt: DateTime.now(),
              ),
            );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: TopicTestsScreen(
                lessonName: 'Tarih',
                topic: 'İslamiyet Öncesi Türk Tarihi',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Test 1 için Çözüldü rozeti ve Tekrar Çöz butonu görünmeli
        expect(
          find.textContaining('Çözüldü · 9D 1Y (8.8 Net)'),
          findsOneWidget,
        );
        expect(find.text('Tekrar Çöz'), findsOneWidget);

        // Çözülmemiş Test 2 ve Test 3 için 'Test Çöz' görünmeli
        expect(find.text('Test Çöz'), findsNWidgets(2));
      },
    );
  });
}
