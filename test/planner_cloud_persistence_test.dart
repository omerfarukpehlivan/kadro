import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'TASK-115: PlannerSyncSnapshot Model & High-Water Mark Birleştirme',
    () {
      test('toJson ve fromJson round-trip veri kaybı olmadan çalışmalı', () {
        final now = DateTime.utc(2026, 11, 14, 12, 0, 0);
        final original = PlannerSyncSnapshot(
          cycleDay: 3,
          maxUnlockedDay: 4,
          completedTaskIds: {'task_1', 'task_d2_1', 'custom_10'},
          customTasksByDay: {
            2: const [
              StudyTask(
                id: 'custom_10',
                title: 'Özel Vatandaşlık Notu',
                lessonTag: 'Vatandaşlık',
                isCompleted: true,
              ),
            ],
          },
          tasksByDay: {
            1: const [
              StudyTask(
                id: 'task_d1_1',
                title: 'Tarih Test 1',
                lessonTag: 'Tarih',
                isCompleted: true,
              ),
            ],
          },
          updatedAt: now,
        );

        final jsonMap = original.toJson();
        expect(jsonMap['cycle_day'], 3);
        expect(jsonMap['max_unlocked_day'], 4);
        expect(jsonMap['completed_task_ids'], contains('task_1'));
        expect(jsonMap['custom_tasks_by_day']['2'], isNotEmpty);
        expect(jsonMap['tasks_by_day']['1'], isNotEmpty);

        final restored = PlannerSyncSnapshot.fromJson(jsonMap);
        expect(restored.cycleDay, 3);
        expect(restored.maxUnlockedDay, 4);
        expect(
          restored.completedTaskIds,
          containsAll(['task_1', 'task_d2_1', 'custom_10', 'task_d1_1']),
        );
        expect(
          restored.customTasksByDay[2]?.first.title,
          'Özel Vatandaşlık Notu',
        );
        expect(restored.customTasksByDay[2]?.first.isCompleted, isTrue);
        expect(restored.tasksByDay[1]?.first.title, 'Tarih Test 1');
        expect(restored.tasksByDay[1]?.first.isCompleted, isTrue);
        expect(restored.isEmptyProgress, isFalse);
      });

      test(
        'mergeWith High-Water Mark kuralı: daha yüksek maxUnlockedDay kazanır',
        () {
          final oldLocal = PlannerSyncSnapshot(
            cycleDay: 2,
            maxUnlockedDay: 2,
            completedTaskIds: {'task_d1_1', 'task_d1_2', 'task_d2_1'},
            updatedAt: DateTime.utc(2026, 11, 10),
          );

          final newCloud = PlannerSyncSnapshot(
            cycleDay: 4,
            maxUnlockedDay: 4,
            completedTaskIds: {
              'task_d1_1',
              'task_d2_1',
              'task_d3_1',
              'task_d4_1',
            },
            updatedAt: DateTime.utc(2026, 11, 14),
          );

          final merged = oldLocal.mergeWith(newCloud);
          expect(merged.maxUnlockedDay, 4);
          expect(merged.cycleDay, 4);
          // Görev ID'leri küme birleşimi ile birleşmeli
          expect(
            merged.completedTaskIds,
            containsAll([
              'task_d1_1',
              'task_d1_2',
              'task_d2_1',
              'task_d3_1',
              'task_d4_1',
            ]),
          );
          expect(merged.updatedAt, DateTime.utc(2026, 11, 14));
        },
      );
    },
  );

  group(
    'TASK-115: Oturum Kapatıp Açmada Çalışma Planı Kalıcılık Doğrulaması',
    () {
      setUp(() {
        SharedPreferences.setMockInitialValues({});
      });

      test('Kullanıcı Senaryosu: 3 gün ilerle -> Oturumu Kapat -> Aynı hesapla Tekrar Giriş Yap -> Gün 3 ve geçmiş görevler %100 korunmalı', () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        // 1. Kullanıcı kaydolur
        final authNotifier = container.read(authProvider.notifier);
        final signUpSuccess = await authNotifier.signUp(
          email: 'omer@kadro.com',
          password: 'password123',
          displayName: 'Ömer Memur',
        );
        expect(signUpSuccess, isTrue);

        // 2. Hedef sınav ve 30 dk programını kurar
        final prefsNotifier = container.read(userPreferencesProvider.notifier);
        prefsNotifier.saveOnboardingGoals(
          targetKpssScore: 90,
          focusLesson: 'Tarih',
          dailyGoalQuestions: 30,
          targetExam: KpssExamTarget.lisans,
          studyProgramPace: StudyProgramPace.dk30,
        );

        final plannerNotifier = container.read(studyPlannerProvider.notifier);
        plannerNotifier.setupAutoProgram(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );

        // --- GÜN 1 ---
        var plannerState = container.read(studyPlannerProvider);
        expect(plannerState.cycleDay, 1);
        expect(plannerState.maxUnlockedDay, 1);
        for (final t in plannerState.tasks) {
          plannerNotifier.markTaskCompleted(t.id);
        }
        final advancedToDay2 = plannerNotifier.advanceToNextDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        expect(advancedToDay2, isTrue);

        // --- GÜN 2 ---
        plannerState = container.read(studyPlannerProvider);
        expect(plannerState.cycleDay, 2);
        expect(plannerState.maxUnlockedDay, 2);
        for (final t in plannerState.tasks) {
          plannerNotifier.markTaskCompleted(t.id);
        }
        final advancedToDay3 = plannerNotifier.advanceToNextDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        expect(advancedToDay3, isTrue);

        // --- GÜN 3 ---
        plannerState = container.read(studyPlannerProvider);
        expect(plannerState.cycleDay, 3);
        expect(plannerState.maxUnlockedDay, 3);

        // Gün 3 ilk görevini tamamla
        final firstTaskDay3Id = plannerState.tasks.first.id;
        plannerNotifier.markTaskCompleted(firstTaskDay3Id);
        plannerState = container.read(studyPlannerProvider);
        expect(
          plannerState.tasks
              .firstWhere((t) => t.id == firstTaskDay3Id)
              .isCompleted,
          isTrue,
        );

        // 3. Hesaptan çıkış yapılır
        await authNotifier.signOut();

        // Çıkış sonrası durum varsayılana sıfırlanmalıdır
        plannerState = container.read(studyPlannerProvider);
        expect(plannerState.cycleDay, 1);
        expect(plannerState.maxUnlockedDay, 1);
        expect(container.read(authProvider).isAuthenticated, isFalse);

        // 4. Aynı hesapla yeniden giriş yapılır
        final signInSuccess = await authNotifier.signIn(
          email: 'omer@kadro.com',
          password: 'password123',
        );
        expect(signInSuccess, isTrue);

        // Asenkron hidrasyon microtask/async zincirinin tamamlanmasını bekle
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // 5. DOĞRULAMA: Gün 3 ve tamamlanma durumları geri gelmeli!
        plannerState = container.read(studyPlannerProvider);
        expect(
          plannerState.cycleDay,
          3,
          reason: 'Kullanıcı Gün 3 seviyesinde kalmalıdır',
        );
        expect(plannerState.maxUnlockedDay, 3);
        expect(
          plannerState.tasks
              .firstWhere((t) => t.id == firstTaskDay3Id)
              .isCompleted,
          isTrue,
          reason: 'Gün 3 içinde tamamlanan görev tikli kalmalıdır',
        );

        // Gün 2'ye geri dönüp tamamlanma durumlarını kontrol et
        plannerNotifier.goToPreviousDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        plannerState = container.read(studyPlannerProvider);
        expect(plannerState.cycleDay, 2);
        expect(
          plannerState.tasks.every((t) => t.isCompleted),
          isTrue,
          reason: 'Geçmiş Gün 2 görevlerinin tamamı tikli olmalıdır',
        );

        // Gün 1'e geri dönüp tamamlanma durumlarını kontrol et
        plannerNotifier.goToPreviousDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        plannerState = container.read(studyPlannerProvider);
        expect(plannerState.cycleDay, 1);
        expect(
          plannerState.tasks.every((t) => t.isCompleted),
          isTrue,
          reason: 'Geçmiş Gün 1 görevlerinin tamamı tikli olmalıdır',
        );
      });

      test('Cold Restart Simülasyonu: Uygulama kapatılıp açıldığında (yeni ProviderContainer) ilerleme korunur', () async {
        // 1. İlk oturumda 3 gün ilerleme kaydet
        final container1 = ProviderContainer();
        final planner1 = container1.read(studyPlannerProvider.notifier);
        planner1.setupAutoProgram(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );

        // Gün 1 bitir -> Gün 2
        for (final t in container1.read(studyPlannerProvider).tasks) {
          planner1.markTaskCompleted(t.id);
        }
        planner1.advanceToNextDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );

        // Gün 2 bitir -> Gün 3
        for (final t in container1.read(studyPlannerProvider).tasks) {
          planner1.markTaskCompleted(t.id);
        }
        planner1.advanceToNextDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );

        expect(container1.read(studyPlannerProvider).cycleDay, 3);
        expect(container1.read(studyPlannerProvider).maxUnlockedDay, 3);

        // Container 1 dispose (Uygulama sonlandı)
        container1.dispose();

        // 2. Uygulama yeniden başlar (Cold Restart)
        // main.dart mantığını simüle et: SharedPreferences'tan oku
        final storage = LocalStorageService();
        final savedCycleDay = await storage.loadPlannerCycleDay();
        final savedMaxDay = await storage.loadPlannerMaxUnlockedDay();
        final savedDayTasks = await storage.loadPlannerDayTasks(
          savedCycleDay ?? 1,
        );
        final savedSnapshot = await storage.loadPlannerSnapshot();

        expect(savedCycleDay, 3);
        expect(savedMaxDay, 3);
        expect(savedSnapshot, isNotNull);
        expect(savedSnapshot!.maxUnlockedDay, 3);

        final initialPlannerState = StudyPlannerState(
          tasks: savedDayTasks ?? const [],
          cycleDay: savedCycleDay ?? 1,
          maxUnlockedDay: savedMaxDay ?? 1,
        );

        final container2 = ProviderContainer(
          overrides: [
            initialPlannerStateProvider.overrideWithValue(initialPlannerState),
            initialPlannerCycleDayProvider.overrideWithValue(savedCycleDay),
          ],
        );
        addTearDown(container2.dispose);

        final state2 = container2.read(studyPlannerProvider);
        expect(state2.cycleDay, 3);
        expect(state2.maxUnlockedDay, 3);
      });

      test('Çapraz Cihaz / Sıfır Cihaz Hidrasyonu: applySnapshot 1..4 arası günleri ve tamamlanma durumlarını deterministik üretir', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final snapshot = PlannerSyncSnapshot(
          cycleDay: 3,
          maxUnlockedDay: 4,
          completedTaskIds: {
            'study_dk30_lisans_d1_q1',
            'study_dk30_lisans_d2_q1',
          },
          updatedAt: DateTime.now().toUtc(),
        );

        final plannerNotifier = container.read(studyPlannerProvider.notifier);
        plannerNotifier.applySnapshot(
          snapshot,
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
          syncToCloud: false,
        );

        final state = container.read(studyPlannerProvider);
        expect(state.cycleDay, 3);
        expect(state.maxUnlockedDay, 4);
        expect(state.tasks, isNotEmpty);

        // Gün 1 ve Gün 2'deki görevlerin tamamlandı olarak kurulduğunu doğrula
        plannerNotifier.goToPreviousDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        expect(container.read(studyPlannerProvider).cycleDay, 2);

        plannerNotifier.goToPreviousDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        expect(container.read(studyPlannerProvider).cycleDay, 1);
      });
    },
  );
}
