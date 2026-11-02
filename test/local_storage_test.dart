import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalStorageService & Yerel Kalıcılık Testleri (TASK-39)', () {
    late LocalStorageService storage;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      storage = LocalStorageService();
      await storage.clearAll();
      const MistakeRepository().clearForTest();
    });

    test(
      'UserPreferences yerel depolamaya kaydedilmeli ve okunabilmeli',
      () async {
        const state = UserPreferencesState(
          isPro: true,
          dailyFreeQuestionLimit: 50,
          targetDailyStudyGoal: 45,
          themeMode: ThemeMode.dark,
          targetKpssScore: 92,
          focusLesson: 'Coğrafya',
          hasCompletedOnboarding: true,
        );

        await storage.saveUserPreferences(state);
        final loaded = await storage.loadUserPreferences();

        expect(loaded, isNotNull);
        expect(loaded!.isPro, isTrue);
        expect(loaded.dailyFreeQuestionLimit, equals(50));
        expect(loaded.targetDailyStudyGoal, equals(45));
        expect(loaded.themeMode, equals(ThemeMode.dark));
        expect(loaded.targetKpssScore, equals(92));
        expect(loaded.focusLesson, equals('Coğrafya'));
        expect(loaded.hasCompletedOnboarding, isTrue);
      },
    );

    test(
      'StudyStatsState yerel depolamaya kaydedilmeli ve okunabilmeli',
      () async {
        final now = DateTime.now();
        final state = StudyStatsState(
          totalSolved: 15,
          totalCorrect: 12,
          totalWrong: 3,
          dailyGoal: 40,
          dailySolvedCount: 15,
          lastStudyDate: now,
          wrongByLesson: const {'Tarih': 2, 'Coğrafya': 1},
          solvedByLesson: const {'Tarih': 10, 'Coğrafya': 5},
          correctByLesson: const {'Tarih': 8, 'Coğrafya': 4},
          totalXp: 210,
          streakDays: 3,
          totalTimeSeconds: 450,
        );

        await storage.saveStudyStats(state);
        final loaded = await storage.loadStudyStats();

        expect(loaded, isNotNull);
        expect(loaded!.totalSolved, equals(15));
        expect(loaded.totalCorrect, equals(12));
        expect(loaded.totalWrong, equals(3));
        expect(loaded.totalXp, equals(210));
        expect(loaded.streakDays, equals(3));
        expect(loaded.wrongByLesson['Tarih'], equals(2));
        expect(loaded.correctByLesson['Coğrafya'], equals(4));
      },
    );

    test(
      'Yanlış sorular listesi (Mistakes) kaydedilmeli ve okunabilmeli',
      () async {
        const q1 = Question(
          id: 'q_test_1',
          lesson: 'Vatandaşlık',
          topic: 'Temel Haklar',
          text: 'Vatandaşlık test sorusu 1',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 1,
          explanation: 'Açıklama 1',
        );

        await storage.saveMistakes([q1]);
        final loaded = await storage.loadMistakes();

        expect(loaded.length, equals(1));
        expect(loaded.first.id, equals('q_test_1'));
        expect(loaded.first.lesson, equals('Vatandaşlık'));
        expect(loaded.first.correctIndex, equals(1));
      },
    );

    test(
      'Çalışma Planlayıcı Görevleri (StudyTasks) kaydedilmeli ve okunabilmeli',
      () async {
        const task = StudyTask(
          id: 'task_custom_1',
          title: 'Özel KPSS Coğrafya Harita Çalışması',
          lessonTag: 'Coğrafya',
          estimatedMinutes: 30,
          isCompleted: true,
          actionType: StudyTaskActionType.custom,
        );

        await storage.saveStudyTasks([task]);
        final loaded = await storage.loadStudyTasks();

        expect(loaded, isNotNull);
        expect(loaded!.length, equals(1));
        expect(loaded.first.id, equals('task_custom_1'));
        expect(
          loaded.first.title,
          equals('Özel KPSS Coğrafya Harita Çalışması'),
        );
        expect(loaded.first.isCompleted, isTrue);
      },
    );

    test('MistakeRepository yerel depolama entegrasyonu çalışmalı', () async {
      const repo = MistakeRepository();
      repo.clearForTest();

      const q = Question(
        id: 'q_mistake_1',
        lesson: 'Tarih',
        topic: 'Osmanlı Devleti',
        text: 'Tarih yanlış sorusu',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
      );

      repo.addMistake(q);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(repo.getMistakes().length, equals(1));

      // Depoya yazıldığını doğrula
      final stored = await storage.loadMistakes();
      expect(stored.length, equals(1));
      expect(stored.first.id, equals('q_mistake_1'));

      // Soruyu sil
      repo.removeMistake('q_mistake_1');
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(repo.getMistakes(), isEmpty);
    });

    test(
      'UserPreferencesNotifier verileri güncelledikçe yerel depoya kaydetmeli',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(userPreferencesProvider.notifier);
        notifier.upgradeToPro();
        notifier.setThemeMode(ThemeMode.dark);

        // Async write
        await Future<void>.delayed(const Duration(milliseconds: 50));

        final stored = await storage.loadUserPreferences();
        expect(stored, isNotNull);
        expect(stored!.isPro, isTrue);
        expect(stored.themeMode, equals(ThemeMode.dark));
      },
    );

    test(
      'StudyPlannerNotifier görev tiklendiğinde yerel depoya kaydetmeli',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(studyPlannerProvider.notifier);
        final firstTaskId = container.read(studyPlannerProvider).tasks.first.id;

        notifier.toggleTask(firstTaskId);

        // Async write
        await Future<void>.delayed(const Duration(milliseconds: 50));

        final stored = await storage.loadStudyTasks();
        expect(stored, isNotNull);
        expect(
          stored!.firstWhere((t) => t.id == firstTaskId).isCompleted,
          isTrue,
        );
      },
    );
  });
}
