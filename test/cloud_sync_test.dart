import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

void main() {
  group('CloudSyncRepository ve Supabase Entegrasyon Testleri', () {
    const repository = CloudSyncRepository();

    test('Supabase başlatılmamışken (offline) CloudSyncRepository güvenli çalışmalı', () async {
      // Test ortamında Supabase hazır değildir
      expect(SupabaseConfig.isReady, isFalse);

      final session = QuizSessionRecord(
        id: 'test_session_1',
        title: 'Tarih Testi 1',
        lesson: 'Tarih',
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 2,
        emptyCount: 0,
        netScore: 7.5,
        earnedXp: 130,
        durationSeconds: 180,
        completedAt: DateTime.now(),
      );

      // Metotların hata fırlatmadan (offline-safe) sessizce tamamlandığını doğrula
      await expectLater(repository.saveQuizSession(session), completes);

      await expectLater(
        repository.saveQuestionAttempt(
          questionText: 'İlk Türk devletlerinde hükümdarlık sembolleri...',
          lesson: 'Tarih',
          topic: 'İlk Türk Devletleri',
          isCorrect: true,
          timeSpentSeconds: 25,
        ),
        completes,
      );

      await expectLater(
        repository.syncProfileStats(
          totalXp: 150,
          leagueTier: 'Gümüş Kadro',
          dailyGoalQuestions: 30,
        ),
        completes,
      );

      final history = await repository.fetchSessionHistory();
      expect(history, isEmpty);
    });

    test('StudyStatsNotifier bulut senkronizasyonu offline modda yerel state ile çalışır', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final statsNotifier = container.read(studyStatsProvider.notifier);

      expect(container.read(studyStatsProvider).totalSolved, 0);
      expect(container.read(studyStatsProvider).totalXp, 0);

      // recordAnswer çağrısı hem yerel state'i günceller hem de cloud sync'i tetikler
      statsNotifier.recordAnswer(
        lesson: 'Coğrafya',
        topic: 'Türkiye Fiziki',
        questionText: 'Karstik şekiller en çok nerede görülür?',
        isCorrect: true,
        timeSpentSeconds: 20,
      );

      expect(container.read(studyStatsProvider).totalSolved, 1);
      expect(container.read(studyStatsProvider).totalCorrect, 1);
      expect(container.read(studyStatsProvider).totalXp, 15);

      // QuizSession kaydı
      final session = QuizSessionRecord(
        id: 'quiz_123',
        title: 'Coğrafya Genel Test',
        lesson: 'Coğrafya',
        totalQuestions: 5,
        correctCount: 4,
        wrongCount: 1,
        emptyCount: 0,
        netScore: 3.75,
        earnedXp: 65,
        durationSeconds: 100,
        completedAt: DateTime.now(),
      );

      statsNotifier.recordQuizSession(session);
      expect(container.read(studyStatsProvider).totalXp, 15 + 65);
      expect(container.read(studyStatsProvider).sessionHistory.length, 1);

      // loadFromCloud çağrısı offline modda yerel durumu bozmamalı
      await statsNotifier.loadFromCloud();
      expect(container.read(studyStatsProvider).sessionHistory.length, 1);
    });

    test('StudyTask JSON ve Supabase toMap / fromMap serileştirmesi', () {
      const task = StudyTask(
        id: 'task_abc',
        title: 'Vatandaşlık Temel Haklar Testi',
        lessonTag: 'Vatandaşlık',
        estimatedMinutes: 30,
        actionType: StudyTaskActionType.quiz,
        isCompleted: true,
      );

      final map = task.toMap('user_xyz');
      expect(map['user_id'], 'user_xyz');
      expect(map['title'], 'Vatandaşlık Temel Haklar Testi');
      expect(map['lesson_tag'], 'Vatandaşlık');
      expect(map['estimated_minutes'], 30);
      expect(map['action_type'], 'quiz');
      expect(map['is_completed'], true);

      final fromMapTask = StudyTask.fromMap({'id': 'task_remote_1', ...map});

      expect(fromMapTask.id, 'task_remote_1');
      expect(fromMapTask.title, task.title);
      expect(fromMapTask.lessonTag, task.lessonTag);
      expect(fromMapTask.estimatedMinutes, task.estimatedMinutes);
      expect(fromMapTask.actionType, StudyTaskActionType.quiz);
      expect(fromMapTask.isCompleted, true);
    });

    test('CloudSyncRepository study_tasks ve user_topic_mastery metotları offline modda güvenli çalışmalı', () async {
      const task = StudyTask(
        id: 'task_1',
        title: 'Tarih Soru Çöz',
        lessonTag: 'Tarih',
      );

      // Görev ekleme, güncelleme ve silme işlemleri hata fırlatmadan tamamlanmalı
      await expectLater(repository.insertStudyTask(task), completes);
      await expectLater(
        repository.updateStudyTaskCompletion(
          title: 'Tarih Soru Çöz',
          isCompleted: true,
        ),
        completes,
      );
      await expectLater(
        repository.deleteStudyTaskByTitle('Tarih Soru Çöz'),
        completes,
      );

      final tasks = await repository.fetchStudyTasks();
      expect(tasks, isEmpty);

      // Konu ustalık matrisi upsert çağrısı
      await expectLater(
        repository.upsertTopicMastery(
          lesson: 'Tarih',
          topic: 'İlk Türk Devletleri',
          totalSolved: 10,
          totalCorrect: 8,
          totalTimeSeconds: 150,
        ),
        completes,
      );
    });

    test(
      'StudyPlannerNotifier offline modda görev ekleme, toggle ve silme',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final plannerNotifier = container.read(studyPlannerProvider.notifier);

        final initialCount = container.read(studyPlannerProvider).totalCount;

        plannerNotifier.addTask(
          title: 'Güncel Bilgiler 10 Soru',
          lessonTag: 'Güncel Bilgiler',
          estimatedMinutes: 15,
          actionType: StudyTaskActionType.quiz,
        );

        expect(
          container.read(studyPlannerProvider).totalCount,
          initialCount + 1,
        );

        final addedTask = container.read(studyPlannerProvider).tasks.last;
        expect(addedTask.title, 'Güncel Bilgiler 10 Soru');
        expect(addedTask.isCompleted, false);

        // Toggle
        plannerNotifier.toggleTask(addedTask.id);
        expect(
          container
              .read(studyPlannerProvider)
              .tasks
              .firstWhere((t) => t.id == addedTask.id)
              .isCompleted,
          true,
        );

        // Remove
        plannerNotifier.removeTask(addedTask.id);
        expect(container.read(studyPlannerProvider).totalCount, initialCount);

        // loadTasksFromCloud çağrısı offline modda yerel listeyi bozmamalı
        await plannerNotifier.loadTasksFromCloud();
        expect(container.read(studyPlannerProvider).totalCount, initialCount);
      },
    );

    test(
      'markMistakeResolved ve fetchLeaderboard offline modda güvenli çalışmalı',
      () async {
        // Yanlış sorunun çözüldü işaretlenmesi offline modda hata vermemeli
        await expectLater(
          repository.markMistakeResolved(
            questionText: 'Uygurların yerleşik hayata geçmesi...',
          ),
          completes,
        );

        // fetchLeaderboard offline modda varsayılan aday listesini döndürmeli
        final leaderboard = await repository.fetchLeaderboard();
        expect(leaderboard, isNotEmpty);
        expect(leaderboard.length, greaterThanOrEqualTo(4));
        expect(leaderboard.first.displayName, contains('Zeynep K.'));
        expect(leaderboard.first.totalXp, 640);
        expect(leaderboard.first.leagueTier, 'Altın Kadro');
      },
    );
    test('TASK-95: purgeExpiredAttemptLogs offline modda 0 dönmeli ve hata fırlatmamalı', () async {
      final purged = await repository.purgeExpiredAttemptLogs(
        retentionDays: 30,
      );
      expect(purged, equals(0));
    });
  });
}
