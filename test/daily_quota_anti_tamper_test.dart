import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('TASK-118: Günlük Kota Anti-Tamper, Çoklu Cihaz & Önbellek Koruması Testleri', () {
    test('Test 1: 30 soru çözdükten sonra reset() / clearAll() veya uygulama yeniden açılışında aynı gün günlük kota sıfırlanmamalı', () async {
      SharedPreferences.setMockInitialValues({});
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final statsNotifier = container.read(studyStatsProvider.notifier);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      for (var i = 0; i < 30; i++) {
        statsNotifier.recordAnswer(lesson: 'Tarih', isCorrect: true);
      }

      expect(
        container.read(studyStatsProvider).effectiveDailySolvedCount(),
        equals(30),
      );

      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Oturum kapatma (signOut) sonrası reset()
      statsNotifier.reset();
      expect(container.read(studyStatsProvider).totalSolved, equals(0));
      expect(
        container.read(studyStatsProvider).effectiveDailySolvedCount(),
        equals(30),
      );

      // Yerel oturum anahtarları temizlense bile cihaz kotası korunmalı
      await LocalStorageService().clearAll();

      final containerAfterRestart = ProviderContainer();
      addTearDown(containerAfterRestart.dispose);
      containerAfterRestart.read(studyStatsProvider);
      await Future<void>.delayed(const Duration(milliseconds: 60));

      expect(
        containerAfterRestart
            .read(studyStatsProvider)
            .effectiveDailySolvedCount(),
        equals(30),
      );
    });

    test('Test 2: Önbellek silinse veya yeni cihazda giriş yapılsa bile bulut profilinden ve bugünün oturumlarından günlük kota geri yüklenmeli', () async {
      // Tamamen boş cihaz (Device B / temizlenmiş önbellek)
      SharedPreferences.setMockInitialValues({});
      final now = DateTime.now();
      final todayKey = StudyStatsState.dateKey(now);
      final yesterday = now.subtract(const Duration(days: 1));

      // 2A: Bulut profilinde daily_solved_count = 30 varsa geri yüklemeli
      final containerProfile = ProviderContainer();
      addTearDown(containerProfile.dispose);
      await containerProfile
          .read(studyStatsProvider.notifier)
          .loadFromCloud(
            accountKey: 'memur1@kadro.app',
            cloudProfileOverride: {
              'total_xp': 450,
              'current_streak_days': 4,
              'daily_goal_questions': 30,
              'daily_solved_count': 30,
              'last_study_date': todayKey,
            },
            cloudSessionsOverride: const [],
          );

      expect(
        containerProfile
            .read(studyStatsProvider)
            .effectiveDailySolvedCount(now),
        equals(30),
      );

      // 2B: Profildeki daily_solved_count düşük kalsa bile bugünkü quiz_sessions toplamı High-Water Mark olarak alınmalı (dünkü sayılmamalı)
      SharedPreferences.setMockInitialValues({});
      final containerSessions = ProviderContainer();
      addTearDown(containerSessions.dispose);
      await containerSessions
          .read(studyStatsProvider.notifier)
          .loadFromCloud(
            accountKey: 'memur2@kadro.app',
            cloudProfileOverride: {
              'total_xp': 900,
              'daily_solved_count': 10,
              'last_study_date': todayKey,
            },
            cloudSessionsOverride: [
              QuizSessionRecord(
                id: 'sess_today_1',
                title: 'Tarih Karma Test 1',
                lesson: 'Tarih',
                totalQuestions: 20,
                correctCount: 16,
                wrongCount: 4,
                emptyCount: 0,
                netScore: 15.0,
                earnedXp: 260,
                durationSeconds: 300,
                completedAt: now,
              ),
              QuizSessionRecord(
                id: 'sess_today_2',
                title: 'Coğrafya Karma Test 1',
                lesson: 'Coğrafya',
                totalQuestions: 12,
                correctCount: 10,
                wrongCount: 2,
                emptyCount: 0,
                netScore: 9.5,
                earnedXp: 160,
                durationSeconds: 180,
                completedAt: now,
              ),
              QuizSessionRecord(
                id: 'sess_yesterday',
                title: 'Dünkü Deneme',
                lesson: 'Genel Kültür',
                totalQuestions: 60,
                correctCount: 50,
                wrongCount: 10,
                emptyCount: 0,
                netScore: 47.5,
                earnedXp: 800,
                durationSeconds: 3000,
                completedAt: yesterday,
              ),
            ],
          );

      expect(
        containerSessions
            .read(studyStatsProvider)
            .effectiveDailySolvedCount(now),
        equals(32),
      );
    });

    test('Test 3: Ödüllü reklam (+20) limiti aynı gün reset/bulut yüklemesi sonrası korunmalı, yeni günde hem çözülen (0) hem limit (30) sıfırlanmalı', () async {
      SharedPreferences.setMockInitialValues({});
      final now = DateTime.now();
      final todayKey = UserPreferencesState.todayDateKey(now);
      final yesterdayKey = UserPreferencesState.todayDateKey(
        now.subtract(const Duration(days: 1)),
      );
      final tomorrow = now.add(const Duration(days: 1));

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final prefsNotifier = container.read(userPreferencesProvider.notifier);
      final statsNotifier = container.read(studyStatsProvider.notifier);

      prefsNotifier.rewardExtraQuestions(20);
      statsNotifier.recordAnswer(lesson: 'Tarih', isCorrect: true);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(
        container.read(userPreferencesProvider).effectiveDailyFreeLimit(),
        equals(50),
      );
      expect(
        container.read(userPreferencesProvider).dailyQuotaDate,
        equals(todayKey),
      );

      // Aynı gün reset() sonrası cihaz günlük limiti korunmalı
      prefsNotifier.reset();
      expect(
        container.read(userPreferencesProvider).effectiveDailyFreeLimit(),
        equals(50),
      );

      // Takvim günü yarına geçtiğinde çözülen 0'a, limit 30'a dönmeli
      expect(
        container.read(studyStatsProvider).effectiveDailySolvedCount(tomorrow),
        equals(0),
      );
      expect(
        container
            .read(userPreferencesProvider)
            .effectiveDailyFreeLimit(tomorrow),
        equals(30),
      );

      // Yeni cihazda bugün +20 reklam izlenmiş bulut tercihi geri yüklenmeli
      SharedPreferences.setMockInitialValues({});
      final containerDeviceB = ProviderContainer();
      addTearDown(containerDeviceB.dispose);
      await containerDeviceB
          .read(userPreferencesProvider.notifier)
          .loadFromCloud(
            accountKey: 'memur3@kadro.app',
            cloudPrefsOverride: {
              'dailyFreeQuestionLimit': 50,
              'dailyQuotaDate': todayKey,
            },
          );
      expect(
        containerDeviceB
            .read(userPreferencesProvider)
            .effectiveDailyFreeLimit(now),
        equals(50),
      );

      // Dün alınmış reklam hakkı (yesterdayKey) bugün 30'a sıfırlanmalı
      SharedPreferences.setMockInitialValues({});
      final containerStaleDay = ProviderContainer();
      addTearDown(containerStaleDay.dispose);
      await containerStaleDay
          .read(userPreferencesProvider.notifier)
          .loadFromCloud(
            accountKey: 'memur4@kadro.app',
            cloudPrefsOverride: {
              'dailyFreeQuestionLimit': 50,
              'dailyQuotaDate': yesterdayKey,
            },
          );
      expect(
        containerStaleDay
            .read(userPreferencesProvider)
            .effectiveDailyFreeLimit(now),
        equals(30),
      );
    });
  });
}
