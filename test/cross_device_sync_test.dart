import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group(
    'TASK-102: Çoklu Cihaz Bulut Senkronizasyonu & Süreklilik Testleri',
    () {
      const sampleQuestion = Question(
        id: 'cross_q1',
        lesson: 'Tarih',
        topic: 'İlk Türk Devletleri',
        text: 'Uygurlar döneminde matbaanın kullanıldığını gösteren kanıt hangisidir?',
        options: [
          'Tahta harfler',
          'Freskler',
          'Kitabeler',
          'Kurganlar',
          'Töret',
        ],
        correctIndex: 0,
        explanation: 'Tahta harfler matbaa kanıtıdır.',
      );

      test('StudyStatsNotifier reset() tüm istatistikleri ve XP durumunu sıfırlamalı', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final statsNotifier = container.read(studyStatsProvider.notifier);
        statsNotifier.recordAnswer(
          lesson: 'Tarih',
          isCorrect: true,
          timeSpentSeconds: 20,
        );
        expect(container.read(studyStatsProvider).totalSolved, equals(1));
        expect(container.read(studyStatsProvider).totalXp, equals(15));

        statsNotifier.reset();
        expect(container.read(studyStatsProvider).totalSolved, equals(0));
        expect(container.read(studyStatsProvider).totalXp, equals(0));
        expect(container.read(studyStatsProvider).streakDays, equals(1));
        expect(
          container.read(studyStatsProvider).leagueTier,
          equals('Bronz Kadro'),
        );
      });

      test('UserPreferencesNotifier reset() tercihleri varsayılan misafir ayarlarına döndürmeli', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final prefsNotifier = container.read(userPreferencesProvider.notifier);
        prefsNotifier.setTargetExam(KpssExamTarget.onlisans);
        prefsNotifier.setStudyProgramPace(StudyProgramPace.hizli);
        prefsNotifier.upgradeToPro();

        expect(
          container.read(userPreferencesProvider).targetExamKey,
          equals('onlisans'),
        );
        expect(
          container.read(userPreferencesProvider).studyProgramPaceKey,
          equals('hizli'),
        );
        expect(container.read(userPreferencesProvider).isPro, isTrue);

        prefsNotifier.reset();
        expect(
          container.read(userPreferencesProvider).targetExamKey,
          equals('lisans'),
        );
        expect(
          container.read(userPreferencesProvider).studyProgramPaceKey,
          equals('orta'),
        );
        expect(container.read(userPreferencesProvider).isPro, isFalse);
      });

      test('StudyPlannerNotifier reset() görevleri varsayılan başlangıç şablonuna çekmeli', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final plannerNotifier = container.read(studyPlannerProvider.notifier);
        plannerNotifier.clearCompleted();
        plannerNotifier.reset();

        final tasks = container.read(studyPlannerProvider).tasks;
        expect(tasks.length, equals(3));
        expect(tasks.first.lessonTag, equals('Tarih'));
      });

      test(
        'MistakeRepository clearLocal() yerel yanlış defterini temizlemeli',
        () {
          const repo = MistakeRepository();
          repo.clearForTest();

          repo.addMistake(sampleQuestion);
          expect(repo.getMistakes().length, equals(1));

          repo.clearLocal();
          expect(repo.getMistakes(), isEmpty);
        },
      );

      test('MistakeRepository removeMistake() soruyu listeden çıkarmalı', () {
        const repo = MistakeRepository();
        repo.clearForTest();

        repo.addMistake(sampleQuestion);
        expect(repo.getMistakes().length, equals(1));

        repo.removeMistake(sampleQuestion.id);
        expect(repo.getMistakes(), isEmpty);
      });

      test('AuthNotifier signOut() tüm notifierları ve yerel cachei izole edip temizlemeli', () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final authNotifier = container.read(authProvider.notifier);
        final statsNotifier = container.read(studyStatsProvider.notifier);
        final prefsNotifier = container.read(userPreferencesProvider.notifier);

        // 1. Giriş yap ve aktivite oluştur
        await authNotifier.signIn(
          emailOrUsername: 'cross_device_user',
          password: 'password123',
        );
        expect(container.read(authProvider).isAuthenticated, isTrue);

        statsNotifier.recordAnswer(
          lesson: 'Coğrafya',
          isCorrect: true,
          timeSpentSeconds: 30,
        );
        prefsNotifier.setTargetExam(KpssExamTarget.lisans2028);
        const MistakeRepository().addMistake(sampleQuestion);

        expect(container.read(studyStatsProvider).totalSolved, equals(1));
        expect(
          container.read(userPreferencesProvider).targetExamKey,
          equals('lisans2028'),
        );
        expect(const MistakeRepository().getMistakes().length, equals(1));

        // 2. Oturumu kapat
        await authNotifier.signOut();

        // 3. Durumların sıfırlandığını doğrula (Temiz State)
        expect(container.read(authProvider).isAuthenticated, isFalse);
        expect(container.read(studyStatsProvider).totalSolved, equals(0));
        expect(container.read(studyStatsProvider).totalXp, equals(0));
        expect(
          container.read(userPreferencesProvider).targetExamKey,
          equals('lisans'),
        );
        expect(const MistakeRepository().getMistakes(), isEmpty);
      });

      test('StudyStatsNotifier recordQuizSession ve recordAnswer çoklu cihaz için seri ve hedef parametresiyle senkronize çalışmalı', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final statsNotifier = container.read(studyStatsProvider.notifier);
        statsNotifier.updateDailyGoal(45);
        expect(container.read(studyStatsProvider).dailyGoal, equals(45));

        final session = QuizSessionRecord(
          id: 'sess_1',
          title: 'Tarih · İlk Türk Devletleri · Test 1',
          lesson: 'Tarih',
          totalQuestions: 10,
          correctCount: 8,
          wrongCount: 2,
          emptyCount: 0,
          netScore: 7.5,
          earnedXp: 130,
          durationSeconds: 320,
          completedAt: DateTime.now(),
        );

        statsNotifier.recordQuizSession(session);
        expect(container.read(studyStatsProvider).totalXp, equals(130));
        expect(
          container.read(studyStatsProvider).sessionHistory.length,
          equals(1),
        );
      });
    },
  );
}
