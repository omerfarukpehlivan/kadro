import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/exams/data/branch_mock_exam_generator.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  group('TASK-154: BranchMockExamGenerator Birim Testleri', () {
    test('Orantılı süre hesaplaması soru sayısına göre doğru yuvarlanır', () {
      expect(BranchMockExamGenerator.computeDurationMinutes(27), equals(30));
      expect(BranchMockExamGenerator.computeDurationMinutes(18), equals(20));
      expect(BranchMockExamGenerator.computeDurationMinutes(9), equals(10));
      expect(BranchMockExamGenerator.computeDurationMinutes(6), equals(7));
      expect(BranchMockExamGenerator.computeDurationMinutes(30), equals(33));
      expect(BranchMockExamGenerator.computeDurationMinutes(50), equals(55));
      expect(BranchMockExamGenerator.computeDurationMinutes(2), equals(5));
    });

    test('blueprintsForCurriculum aktif sınav kapsamına göre tüm hazır derslerin branş şablonlarını üretir', () {
      const gkSelection = ExamSelection.initial;
      final gkCurriculum = CurriculumRegistry.resolve(gkSelection);
      final gkBlueprints = BranchMockExamGenerator.blueprintsForCurriculum(
        selection: gkSelection,
        curriculum: gkCurriculum,
      );

      expect(gkBlueprints.length, equals(5));
      expect(
        gkBlueprints.map(
          (b) => (b.sections.first.lesson, b.totalQuestionCount),
        ),
        equals([
          ('Tarih', 27),
          ('Coğrafya', 18),
          ('Vatandaşlık', 9),
          ('Güncel Bilgiler', 6),
          ('Türkçe', 30),
        ]),
      );
      expect(gkBlueprints.first.isProOnly, isFalse);

      const ekpssSelection = ExamSelection(
        family: KpssExamFamily.ekpss,
        disabilityGroup: DisabilityGroup.gorme,
        includeExtraTime: true,
      );
      final ekpssCurriculum = CurriculumRegistry.resolve(ekpssSelection);
      final ekpssBlueprints = BranchMockExamGenerator.blueprintsForCurriculum(
        selection: ekpssSelection,
        curriculum: ekpssCurriculum,
        branchMockNumber: 2,
      );

      expect(ekpssBlueprints.isNotEmpty, isTrue);
      expect(ekpssBlueprints.first.supportsExtraTime, isTrue);
      expect(ekpssBlueprints.first.isProOnly, isTrue);
    });

    test('generateForLesson farklı set numaralarında çakışmayı azaltarak konu dağılımlı sorular çeker', () async {
      final fakeQuestions = [
        for (var i = 1; i <= 15; i++)
          {
            'id': 'tar_t1_$i',
            'lesson': 'Tarih',
            'topic': 'İlk Türk Devletleri',
            'text': 'Soru A $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 0,
            'explanation': 'Açıklama',
          },
        for (var i = 1; i <= 15; i++)
          {
            'id': 'tar_t2_$i',
            'lesson': 'Tarih',
            'topic': 'Osmanlı Kültür ve Uygarlığı',
            'text': 'Soru B $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 1,
            'explanation': 'Açıklama',
          },
      ];

      final repo = QuestionRepository(
        assetLoader: (_) async => jsonEncode(fakeQuestions),
      );
      final tarihLesson = CurriculumRegistry.resolve(ExamSelection.initial)
          .activeLessons
          .firstWhere((l) => l.name == 'Tarih');

      const generator = BranchMockExamGenerator();
      final set1 = await generator.generateForLesson(
        lesson: tarihLesson,
        selection: ExamSelection.initial,
        branchMockNumber: 1,
        questionRepository: repo,
      );
      final set2 = await generator.generateForLesson(
        lesson: tarihLesson,
        selection: ExamSelection.initial,
        branchMockNumber: 2,
        questionRepository: repo,
      );

      expect(set1.questions.length, equals(27));
      expect(set1.questions.map((q) => q.topic).toSet().length, greaterThan(1));
      expect(set2.questions.length, equals(27));
      expect(
        set1.questions.map((q) => q.id).toList(),
        isNot(equals(set2.questions.map((q) => q.id).toList())),
      );
    });

    test(
      'QuizResult konu bazlı kırılım ve weakestTopic zayıf konuyu doğru seçer',
      () {
        const result = QuizResult(
          totalQuestions: 27,
          correctCount: 20,
          wrongCount: 5,
          emptyCount: 2,
          topicBreakdown: {
            'Tarih::İlk Türk Devletleri': TopicResult(
              topic: 'İlk Türk Devletleri',
              lesson: 'Tarih',
              totalQuestions: 10,
              correctCount: 9,
              wrongCount: 1,
              emptyCount: 0,
            ),
            'Tarih::Osmanlı Dağılma Dönemi': TopicResult(
              topic: 'Osmanlı Dağılma Dönemi',
              lesson: 'Tarih',
              totalQuestions: 17,
              correctCount: 11,
              wrongCount: 4,
              emptyCount: 2,
            ),
          },
        );

        expect(result.hasTopicBreakdown, isTrue);
        expect(result.weakestTopic?.topic, equals('Osmanlı Dağılma Dönemi'));
        expect(result.weakestTopic?.net, closeTo(10.0, 0.01));
      },
    );

    test('StudyPlannerNotifier branş denemesi çözümünde Genel deneme görevini yanlışlıkla tamamlamaz', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyPlannerProvider.notifier);
      notifier.addTask(
        title: '60 Soruluk Genel Kültür Deneme Simülasyonu',
        lessonTag: 'Genel',
        estimatedMinutes: 65,
        actionType: StudyTaskActionType.exam,
        targetExamNumber: 1,
      );
      notifier.addTask(
        title: 'Tarih Branş Denemesi #1',
        lessonTag: 'Tarih',
        estimatedMinutes: 30,
        actionType: StudyTaskActionType.exam,
        targetExamNumber: 1,
      );

      notifier.markMatchingTestCompleted(
        lesson: 'Tarih',
        mockExamNumber: 1,
        isBranchMock: true,
      );

      final tasks = container.read(studyPlannerProvider).tasks;
      final generalTask = tasks.firstWhere((t) => t.lessonTag == 'Genel');
      final branchTask = tasks.firstWhere(
        (t) =>
            t.actionType == StudyTaskActionType.exam && t.lessonTag == 'Tarih',
      );

      expect(generalTask.isCompleted, isFalse);
      expect(branchTask.isCompleted, isTrue);
    });
  });

  group('TASK-154: Branş Denemeleri UI & Karne Widget Testleri', () {
    testWidgets(
      'ExamsScreen Branş Denemeleri bölümünü gösterir ve set değiştirme taşmadan çalışır',
      (tester) async {
        tester.view.physicalSize = const Size(360, 740);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: ExamsScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.scrollUntilVisible(
          find.text('Tarih Branş Denemesi #1'),
          300,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.pumpAndSettle();

        expect(find.text('Branş Denemeleri'), findsOneWidget);
        expect(find.text('Tarih Branş Denemesi #1'), findsOneWidget);
        expect(find.text('Coğrafya Branş Denemesi #1'), findsOneWidget);

        final chip2Finder = find.byKey(const ValueKey('branch_set_chip_2'));
        await tester.ensureVisible(chip2Finder);
        await tester.pumpAndSettle();
        await tester.tap(chip2Finder);
        await tester.pumpAndSettle();

        expect(find.text('Tarih Branş Denemesi #2'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'LessonTopicsScreen tablet Split-Pane ve telefonda Bu Dersten Branş Denemesi Çöz butonunu taşmadan gösterir',
      (tester) async {
        final tarih = CurriculumRegistry.resolve(ExamSelection.initial)
            .activeLessons
            .firstWhere((l) => l.name == 'Tarih')
            .toLesson();
        final fakeRepo = QuestionRepository(
          assetLoader: (_) async => jsonEncode([
            {
              'id': 't1',
              'lesson': 'Tarih',
              'topic': tarih.topics.first,
              'text': 'Örnek Soru',
              'options': ['A', 'B', 'C', 'D', 'E'],
              'correctIndex': 0,
              'explanation': 'Açıklama',
            },
          ]),
        );

        for (final size in const [Size(390, 844), Size(1280, 800)]) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                questionRepositoryProvider.overrideWithValue(fakeRepo),
              ],
              child: MaterialApp(
                theme: AppTheme.light,
                home: LessonTopicsScreen(lesson: tarih),
              ),
            ),
          );
          await tester.pumpAndSettle();

          expect(
            find.byKey(const ValueKey('lesson_branch_mock_button')),
            findsOneWidget,
          );
          expect(tester.takeException(), isNull);
        }

        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      },
    );

    testWidgets(
      'QuizResultScreen branş denemesi sonrası konu bazlı net karnesi ve zayıf konu yönlendirmesini çizer',
      (tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const result = QuizResult(
          totalQuestions: 27,
          correctCount: 19,
          wrongCount: 6,
          emptyCount: 2,
          lessonBreakdown: {
            'Tarih': LessonResult(
              lesson: 'Tarih',
              totalQuestions: 27,
              correctCount: 19,
              wrongCount: 6,
              emptyCount: 2,
            ),
          },
          topicBreakdown: {
            'Tarih::İlk Türk Devletleri': TopicResult(
              topic: 'İlk Türk Devletleri',
              lesson: 'Tarih',
              totalQuestions: 10,
              correctCount: 9,
              wrongCount: 1,
              emptyCount: 0,
            ),
            'Tarih::Osmanlı Dağılma Dönemi': TopicResult(
              topic: 'Osmanlı Dağılma Dönemi',
              lesson: 'Tarih',
              totalQuestions: 17,
              correctCount: 10,
              wrongCount: 5,
              emptyCount: 2,
            ),
          },
        );

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const QuizResultScreen(
                result: result,
                testTitle: 'Tarih Branş Denemesi #1',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Misafir uyarısını kapat
        if (find.text('Şimdilik Devam Et').evaluate().isNotEmpty) {
          await tester.tap(find.text('Şimdilik Devam Et'));
          await tester.pumpAndSettle();
        }

        expect(find.text('Konu Bazlı Net Karnesi'), findsOneWidget);
        expect(
          find.text('Zayıf Konu Önerisi: Osmanlı Dağılma Dönemi'),
          findsOneWidget,
        );
        expect(find.text('Zayıf Konunun Testlerini Aç'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}
