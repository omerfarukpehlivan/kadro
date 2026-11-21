import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/planner/presentation/widgets/auto_study_program_modal.dart';
import 'package:kadro/features/planner/presentation/widgets/weekly_planner_calendar_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group(
    'TASK-159: Telafi Modu, Sprint Modu & Haftalık Takvim Birim Testleri',
    () {
      test('rebalanceMissedTasks tamamlanmış görevleri koruyup bekleyen yoğunluğu gelecek günlere yayar', () {
        const pace = StudyProgramPace.dk30; // tasksPerDay = 3 -> maxPerDay = 4
        final currentDayTasks = [
          const StudyTask(
            id: 'done_1',
            title: 'Tamamlanan Test',
            lessonTag: 'Tarih',
            estimatedMinutes: 15,
            isCompleted: true,
          ),
          for (var i = 1; i <= 6; i++)
            StudyTask(
              id: 'pending_$i',
              title: 'Bekleyen Görev $i',
              lessonTag: 'Coğrafya',
              estimatedMinutes: 10,
            ),
        ];

        final plan = AutoStudyProgramGenerator.rebalanceMissedTasks(
          currentDayTasks: currentDayTasks,
          currentDay: 2,
          pace: pace,
          examTarget: KpssExamTarget.lisans,
        );

        expect(plan.carriedCount, 6);
        // Tamamlanan görev bugün içinde %100 korunur
        expect(plan.todayTasks.any((t) => t.id == 'done_1'), isTrue);
        // Bugün günlük üst sınırı (3 + 1 = 4) aşmaz
        expect(plan.todayTasks.length, 4);

        // Taşan 3 bekleyen görev sonraki günlerde korunur
        final allFutureIds = plan.futureDayTasks.values
            .expand((list) => list)
            .map((t) => t.id)
            .toSet();
        expect(allFutureIds.contains('pending_4'), isTrue);
        expect(allFutureIds.contains('pending_5'), isTrue);
        expect(allFutureIds.contains('pending_6'), isTrue);
      });

      test('Sprint Modu aktifken çift günlerde deneme ve yanlış tekrar görevleri eklenir', () {
        final tasks = AutoStudyProgramGenerator.generateDailyTasks(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
          cycleDay: 2,
          isSprintMode: true,
        );

        expect(
          tasks.any((t) => t.actionType == StudyTaskActionType.exam),
          isTrue,
        );
        expect(
          tasks.any((t) => t.actionType == StudyTaskActionType.mistakes),
          isTrue,
        );
      });

      test('StudyPlannerState missedDaysCount dinlenme günlerini hariç tutar ve PlannerSyncSnapshot yeni alanları korur', () {
        final monday = DateTime(2026, 11, 16); // Pazartesi (weekday = 1)
        final thursday = DateTime(2026, 11, 19); // Perşembe (weekday = 4)

        final state = StudyPlannerState(
          tasks: const [
            StudyTask(
              id: 't1',
              title: 'Örnek Görev',
              lessonTag: 'Tarih',
              estimatedMinutes: 15,
            ),
          ],
          lastPlannedDate: monday,
          isSprintModeActive: true,
          // Salı (2) dinlenme günü olsun -> Pzt, Çar gecikmeli (2 gün)
          weeklyStudyDays: const [1, 3, 4, 5, 6, 7],
        );

        expect(state.missedDaysCount(now: thursday), 2);
        expect(state.hasMissedDays(now: thursday), isTrue);

        final snapshot = PlannerSyncSnapshot(
          cycleDay: 3,
          maxUnlockedDay: 3,
          lastPlannedDate: '2026-11-16',
          isSprintModeActive: true,
          weeklyStudyDays: const [1, 3, 4, 5, 6, 7],
        );
        final roundtrip = PlannerSyncSnapshot.fromJson(snapshot.toJson());
        expect(roundtrip.lastPlannedDate, '2026-11-16');
        expect(roundtrip.isSprintModeActive, isTrue);
        expect(roundtrip.weeklyStudyDays, const [1, 3, 4, 5, 6, 7]);
      });

      test(
        'buildWeeklyPreview seçilmeyen günleri Dinlenme olarak işaretler',
        () {
          final days = AutoStudyProgramGenerator.buildWeeklyPreview(
            selection: const ExamSelection.bGrubuLisans(),
            pace: StudyProgramPace.dk45,
            weeklyStudyDays: const [1, 2, 3, 4, 5],
          );

          expect(days.length, 7);
          expect(days[5].isRestDay, isTrue); // Cumartesi
          expect(days[6].isRestDay, isTrue); // Pazar
          expect(days[0].isRestDay, isFalse);
          expect(days[0].estimatedMinutes, greaterThan(0));
        },
      );
    },
  );

  group(
    'TASK-159: StudyPlannerScreen & AutoStudyProgramModal Widget Testleri',
    () {
      testWidgets(
        'StudyPlannerScreen gecikme varken Telafi Et bannerı ve 7 günlük takvimi mobil/masaüstünde taşmadan gösterir',
        (WidgetTester tester) async {
          final container = ProviderContainer();
          addTearDown(container.dispose);

          container
              .read(studyPlannerProvider.notifier)
              .debugSetLastPlannedDateForTest(
                DateTime.now().subtract(const Duration(days: 3)),
              );

          for (final size in const [Size(360, 640), Size(1280, 800)]) {
            tester.view.physicalSize = size;
            tester.view.devicePixelRatio = 1.0;

            await tester.pumpWidget(
              UncontrolledProviderScope(
                container: container,
                child: MaterialApp(
                  theme: AppTheme.light,
                  home: const StudyPlannerScreen(),
                ),
              ),
            );
            await tester.pumpAndSettle();

            final catchUpFinder = find.byKey(
              const ValueKey('planner_catch_up_button'),
            );
            expect(catchUpFinder, findsOneWidget);

            final calendarFinder = find.byType(WeeklyPlannerCalendarGrid);
            if (calendarFinder.evaluate().isEmpty) {
              await tester.scrollUntilVisible(
                calendarFinder,
                300,
                scrollable: find.byType(Scrollable).first,
              );
            }
            expect(calendarFinder, findsOneWidget);
            expect(tester.takeException(), isNull);
          }

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.tap(
            find.byKey(const ValueKey('planner_catch_up_button')),
          );
          await tester.pumpAndSettle();

          // Telafi uygulandıktan sonra gecikme banner'ı kalkar
          expect(
            find.byKey(const ValueKey('planner_catch_up_button')),
            findsNothing,
          );
          expect(
            container.read(studyPlannerProvider).missedDaysCount(),
            equals(0),
          );
        },
      );

      testWidgets(
        'AutoStudyProgramModal canlı Haftalık Çalışma Takvimi Önizlemesini günceller',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1280, 800);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            ProviderScope(
              child: MaterialApp(
                theme: AppTheme.light,
                home: const Scaffold(body: AutoStudyProgramModal()),
              ),
            ),
          );
          await tester.pumpAndSettle();

          expect(
            find.text('Haftalık Çalışma Takvimi Önizlemesi'),
            findsOneWidget,
          );
          final sundayTile = find.byKey(
            const ValueKey('weekly_calendar_day_7'),
          );
          await tester.ensureVisible(sundayTile);
          await tester.tap(sundayTile);
          await tester.pumpAndSettle();

          expect(find.text('Mola'), findsOneWidget);
          expect(tester.takeException(), isNull);
        },
      );
    },
  );
}
