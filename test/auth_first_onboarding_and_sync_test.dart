import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'TASK-119: Auth-First -> Tek Seferlik Kurulum -> Çoklu Cihaz Eşitliği',
    () {
      setUp(() {
        SharedPreferences.setMockInitialValues({});
      });

      testWidgets(
        '1. Senaryo (Misafir Öncelikli Açılış): İlk açılışta zorunlu AuthScreen açılmaz, doğrudan kurulum ekranı gelir',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          expect(find.byType(AuthScreen), findsNothing);
          expect(find.byType(OnboardingScreen), findsOneWidget);
          expect(find.byType(HomeScreen), findsNothing);
          expect(find.byType(AppNavigationBar), findsNothing);
        },
      );

      testWidgets(
        '2. Senaryo (Misafir Kurulum Akışı): Giriş yapmadan sınav/süre/hedef seçip doğrudan HomeScreen ekranına ulaşır',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          expect(find.byType(AuthScreen), findsNothing);
          expect(find.byType(OnboardingScreen), findsOneWidget);
          expect(find.byType(AppNavigationBar), findsNothing);

          // Adım 1: Sınav
          await tester.tap(find.text(KpssExamTarget.lisans.title));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Devam Et'));
          await tester.pumpAndSettle();

          // Adım 2: Süre
          await tester.tap(find.text('45 Dk · Dengeli Tempo'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Devam Et'));
          await tester.pumpAndSettle();

          // Adım 3: Hedef & Odak
          await tester.tap(find.text('90+ Puan'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Coğrafya · 18 Soru (%30 Ağırlık)'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Programımı Kur ve Başla'));
          await tester.pumpAndSettle();

          expect(find.byType(OnboardingScreen), findsNothing);
          expect(find.byType(HomeScreen), findsOneWidget);
          expect(find.byType(AppNavigationBar), findsOneWidget);
        },
      );

      test('3. Senaryo (İkinci Cihaz / Web Chrome Senkronu): İlk cihaz planı ve ilerlemesi ikinci cihazda birebir yüklenir, varsayılan şablon bulutu ezmez', () async {
        // --- CİHAZ 1 (Telefon): Kullanıcı kurulum yaptı (dk90) ve 1. görevi tamamladı ---
        final phoneContainer = ProviderContainer();
        addTearDown(phoneContainer.dispose);

        phoneContainer
            .read(userPreferencesProvider.notifier)
            .saveOnboardingGoals(
              targetKpssScore: 90,
              focusLesson: 'Tarih',
              dailyGoalQuestions: StudyProgramPace.dk90.dailyGoalQuestions,
              targetExam: KpssExamTarget.lisans,
              studyProgramPace: StudyProgramPace.dk90,
            );

        final phonePlanner = phoneContainer.read(studyPlannerProvider.notifier);
        phonePlanner.setupAutoProgram(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Tarih',
        );

        final phoneDay1Tasks = phoneContainer.read(studyPlannerProvider).tasks;
        expect(phoneDay1Tasks, isNotEmpty);
        phonePlanner.toggleTask(phoneDay1Tasks.first.id);

        final device1State = phoneContainer.read(studyPlannerProvider);
        final device1Snapshot = phonePlanner.exportSnapshot();
        expect(device1Snapshot.isEmptyProgress, isFalse);

        // --- CİHAZ 2 (Web Chrome): Tamamen boş yerel depolama ile giriş ---
        SharedPreferences.setMockInitialValues({});
        final webContainer = ProviderContainer();
        addTearDown(webContainer.dispose);

        // Dokunulmamış varsayılan görevler asla dolu snapshot gibi dışa aktarılmamalı
        final untouchedSnapshot = webContainer
            .read(studyPlannerProvider.notifier)
            .exportSnapshot();
        expect(untouchedSnapshot.isEmptyProgress, isTrue);

        // 1. Adım: Tercihler buluttan yüklenir (onboarding atlanır, dk90 geri gelir)
        await webContainer
            .read(userPreferencesProvider.notifier)
            .loadFromCloud(
              accountKey: 'ayni_hesap@kadro.com',
              cloudPrefsOverride: {
                'has_completed_onboarding': true,
                'has_active_study_program': true,
                'target_exam': 'lisans',
                'study_pace': 'dk90',
                'target_kpss_score': 90,
                'focus_lesson': 'Tarih',
                'daily_goal_questions': 70,
                'planner_state': device1Snapshot.toJson(),
              },
            );

        final webPrefs = webContainer.read(userPreferencesProvider);
        expect(webPrefs.hasCompletedOnboarding, isTrue);
        expect(webPrefs.hasActiveStudyProgram, isTrue);
        expect(webPrefs.studyProgramPace, StudyProgramPace.dk90);

        // 2. Adım: Planlayıcı bulut snapshot'ını yükler
        await webContainer
            .read(studyPlannerProvider.notifier)
            .loadTasksFromCloud(
              accountKey: 'ayni_hesap@kadro.com',
              cloudSnapshotOverride: device1Snapshot,
            );

        final device2State = webContainer.read(studyPlannerProvider);
        expect(device2State.cycleDay, device1State.cycleDay);
        expect(device2State.maxUnlockedDay, device1State.maxUnlockedDay);
        expect(
          device2State.tasks
              .map((t) => '${t.id}|${t.title}|${t.isCompleted}')
              .toList(),
          equals(
            device1State.tasks
                .map((t) => '${t.id}|${t.title}|${t.isCompleted}')
                .toList(),
          ),
        );
      });

      test('4. Senaryo (SQL Varsayılan Tuzağı Koruması): target_exam=lisans ve boş {} planner_state tek başına onboarding tamamlandı sayılmaz', () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        await container
            .read(userPreferencesProvider.notifier)
            .loadFromCloud(
              accountKey: 'yeni_hesap@kadro.com',
              cloudPrefsOverride: {
                'target_exam': 'lisans',
                'study_pace': 'orta',
                'focus_lesson': 'Tarih',
                'has_active_study_program': false,
                'has_completed_onboarding': false,
                'planner_state': <String, dynamic>{},
              },
            );

        final prefs = container.read(userPreferencesProvider);
        expect(prefs.hasCompletedOnboarding, isFalse);
        expect(prefs.hasActiveStudyProgram, isFalse);
        expect(prefs.hasSelectedTargetExam, isFalse);
        expect(prefs.studyProgramPace, StudyProgramPace.dk60);
      });

      test('5. Senaryo (Eski Hesap Kurtarma): Bulutta has_active_study_program=true ama planner_state boşsa seçili tempoya göre plan otomatik üretilir', () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        await container
            .read(userPreferencesProvider.notifier)
            .loadFromCloud(
              accountKey: 'omerfp@kadro.internal',
              cloudPrefsOverride: {
                'has_completed_onboarding': true,
                'has_active_study_program': true,
                'target_exam': 'lisans',
                'study_pace': 'dk30',
                'focus_lesson': 'Tarih',
                'planner_state': <String, dynamic>{},
              },
            );

        await container
            .read(studyPlannerProvider.notifier)
            .loadTasksFromCloud(
              accountKey: 'omerfp@kadro.internal',
              cloudSnapshotOverride: PlannerSyncSnapshot(),
            );

        final plannerState = container.read(studyPlannerProvider);
        expect(plannerState.tasks, isNotEmpty);
        expect(plannerState.tasks.first.id, startsWith('auto_dk30_d1_'));
      });

      test('6. Senaryo (Hesap İzolasyonu): Çıkış yapıldıktan sonra cihazda kalan genel önbellek temizlenir ve farklı hesap önceki kullanıcının planını devralmaz', () async {
        final storage = LocalStorageService();

        final containerA = ProviderContainer();
        addTearDown(containerA.dispose);
        final plannerA = containerA.read(studyPlannerProvider.notifier);
        plannerA.setAccountKey('hesap_a@kadro.com');
        plannerA.setupAutoProgram(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Tarih',
        );
        await storage.savePlannerSnapshot(
          plannerA.exportSnapshot(),
          accountKey: 'hesap_a@kadro.com',
        );
        await storage.savePlannerDayTasks(
          1,
          containerA.read(studyPlannerProvider).tasks,
        );

        await storage.clearActivePlannerCache();

        final cachedForB = await storage.loadPlannerSnapshot(
          accountKey: 'hesap_b@kadro.com',
        );
        final dayTasksAfterClear = await storage.loadPlannerDayTasks(1);
        expect(cachedForB, isNull);
        expect(dayTasksAfterClear, isNull);
      });
    },
  );
}
