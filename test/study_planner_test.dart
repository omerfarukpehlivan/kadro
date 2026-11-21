import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/main.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('StudyPlannerNotifier ve StudyTask Testleri', () {
    late ProviderContainer container;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'Başlangıçta 3 varsayılan görev gelir ve hiçbiri tamamlanmamıştır',
      () {
        final state = container.read(studyPlannerProvider);

        expect(state.totalCount, 3);
        expect(state.completedCount, 0);
        expect(state.remainingCount, 3);
        expect(state.completionProgress, 0.0);
        expect(state.totalEstimatedMinutes, 35); // 15 + 10 + 10
        expect(
          state.tasks.first.title,
          contains('İslamiyet Öncesi Türk Tarihi'),
        );
      },
    );

    test('toggleTask çağrıldığında görevin tamamlanma durumu güncellenir', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.toggleTask('task_1');

      var state = container.read(studyPlannerProvider);
      expect(state.completedCount, 1);
      expect(state.remainingCount, 2);
      expect(state.completionProgress, closeTo(1 / 3, 0.01));
      expect(
        state.tasks.firstWhere((t) => t.id == 'task_1').isCompleted,
        isTrue,
      );

      // Tekrar tıklandığında geri alınmalı
      notifier.toggleTask('task_1');
      state = container.read(studyPlannerProvider);
      expect(state.completedCount, 0);
      expect(
        state.tasks.firstWhere((t) => t.id == 'task_1').isCompleted,
        isFalse,
      );
    });

    test('addTask yeni görev ekler ve boş başlıkları reddeder', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.addTask(
        title: 'Vatandaşlık Temel Haklar Testi',
        lessonTag: 'Vatandaşlık',
        estimatedMinutes: 30,
        actionType: StudyTaskActionType.quiz,
      );

      var state = container.read(studyPlannerProvider);
      expect(state.totalCount, 4);
      expect(state.tasks.last.title, 'Vatandaşlık Temel Haklar Testi');
      expect(state.tasks.last.lessonTag, 'Vatandaşlık');
      expect(state.tasks.last.estimatedMinutes, 30);
      expect(state.tasks.last.actionType, StudyTaskActionType.quiz);

      // Boş başlık eklenmemeli
      notifier.addTask(title: '   ', lessonTag: 'Genel');
      state = container.read(studyPlannerProvider);
      expect(state.totalCount, 4);
    });

    test('removeTask görevi listeden çıkarır', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.removeTask('task_2');

      final state = container.read(studyPlannerProvider);
      expect(state.totalCount, 2);
      expect(state.tasks.any((t) => t.id == 'task_2'), isFalse);
    });

    test('clearCompleted sadece tamamlanmış görevleri siler', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.toggleTask('task_1');
      notifier.toggleTask('task_3');

      var state = container.read(studyPlannerProvider);
      expect(state.completedCount, 2);

      notifier.clearCompleted();

      state = container.read(studyPlannerProvider);
      expect(state.totalCount, 1);
      expect(state.tasks.single.id, 'task_2');
      expect(state.completedCount, 0);
    });
  });

  group('StudyPlanner Widget & Entegrasyon Testleri', () {
    testWidgets(
      'TASK-162: HomeScreen üzerinde Bugünün Çalışma Planı kartı tüm görevleri gösterir, Tümünü Gör ve Düzenle kaldırılmıştır',
      (WidgetTester tester) async {
        SharedPreferences.setMockInitialValues({});
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
            ],
            child: const MyApp(),
          ),
        );
        await tester.pumpAndSettle();

        // 1. Ana sayfada Bugünün Çalışma Planı kartını doğrula
        await tester.scrollUntilVisible(
          find.text('Bugünün Çalışma Planı'),
          200,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text('Bugünün Çalışma Planı'), findsOneWidget);
        // TASK-162: Tümünü Gör ve Düzenle butonları kaldırıldı
        expect(find.text('Tümünü Gör'), findsNothing);
        expect(find.text('Düzenle'), findsNothing);

        // Kompakt ilerleme rozeti mevcut
        expect(find.text('0/3'), findsOneWidget);
        expect(find.text('0/3 görev'), findsOneWidget);

        await tester.scrollUntilVisible(
          find.text('İslamiyet Öncesi Türk Tarihi · Test 1'),
          100,
          scrollable: find.byType(Scrollable).first,
        );
        expect(
          find.text('İslamiyet Öncesi Türk Tarihi · Test 1'),
          findsOneWidget,
        );

        // 2. İlk görevin onay kutusuna dokun ve tamamlandığını (üzeri çizili) doğrula
        final firstCheckCircle = find.byIcon(PhosphorIconsRegular.circle).first;
        await tester.scrollUntilVisible(
          firstCheckCircle,
          100,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.pumpAndSettle();
        await tester.tap(firstCheckCircle, warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byType(HomeDailyPlanCard),
            matching: find.byIcon(PhosphorIconsFill.checkCircle),
          ),
          findsOneWidget,
        );
        expect(find.text('1/3'), findsOneWidget);
        expect(find.text('1/3 görev'), findsOneWidget);
      },
    );

    test('previewUpcomingTasks ve pullUpcomingTaskToToday sıradaki gerçek görevi id ile aktarır', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyPlannerProvider.notifier);
      final upcoming = notifier.previewUpcomingTasks();
      expect(upcoming, isNotEmpty);

      final targetTask = upcoming.first;
      final initialCount = container.read(studyPlannerProvider).tasks.length;

      notifier.pullUpcomingTaskToToday(targetTask);

      final updatedTasks = container.read(studyPlannerProvider).tasks;
      expect(updatedTasks.length, initialCount + 1);
      expect(updatedTasks.any((t) => t.id == targetTask.id), isTrue);

      // Aynı görev tekrar eklenmez ve önizleme listesinden düşer
      notifier.pullUpcomingTaskToToday(targetTask);
      expect(
        container.read(studyPlannerProvider).tasks.length,
        initialCount + 1,
      );
      expect(
        notifier.previewUpcomingTasks().any((t) => t.id == targetTask.id),
        isFalse,
      );
    });

    testWidgets(
      'Küçük mobil ekranda (320px) uzun görev başlıkları üç nokta (ellipsis) ile kesilmeden tam okunabilir (softWrap) render edilmeli',
      (WidgetTester tester) async {
        SharedPreferences.setMockInitialValues({});
        tester.view.physicalSize = const Size(320, 720);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const longTask = StudyTask(
          id: 'long_task_1',
          title: 'Osmanlı Devleti Kültür ve Medeniyeti · Devlet Yönetimi ve Ordu Teşkilatı · Test 3',
          lessonTag: 'Tarih',
          estimatedMinutes: 15,
          actionType: StudyTaskActionType.quiz,
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
              studyPlannerProvider.overrideWith(
                () => _FixedStudyPlannerNotifier(
                  const StudyPlannerState(tasks: [longTask], cycleDay: 1),
                ),
              ),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: SingleChildScrollView(child: HomeDailyPlanCard()),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final titleFinder = find.text(longTask.title);
        expect(titleFinder, findsOneWidget);

        final titleWidget = tester.widget<Text>(titleFinder);
        expect(titleWidget.maxLines, isNull);
        expect(titleWidget.overflow, isNot(equals(TextOverflow.ellipsis)));
        expect(titleWidget.softWrap, isTrue);
        expect(find.text('· 15 dk'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}

class _FixedStudyPlannerNotifier extends StudyPlannerNotifier {
  final StudyPlannerState initialState;
  _FixedStudyPlannerNotifier(this.initialState);

  @override
  StudyPlannerState build() => initialState;
}
