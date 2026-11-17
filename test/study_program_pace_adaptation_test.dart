import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/widgets/auto_study_program_modal.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('AutoStudyProgramGenerator Adaptasyon Birim Testleri', () {
    test('cumulativeTestsBeforeDay ve findCycleDayForCurriculumOffset doğru hesaplanmalı', () {
      // 30 dk: Gün 1 (1), Gün 2 (1), Gün 3 (2) -> Gün 4 öncesi toplam 4 test
      final testsBeforeDay4AtDk30 =
          AutoStudyProgramGenerator.cumulativeTestsBeforeDay(
            StudyProgramPace.dk30,
            4,
          );
      expect(testsBeforeDay4AtDk30, 4);

      // 4 test 60 dk temposunda (Gün 1'de 3, Gün 2'de 2) Gün 2'ye denk gelmeli
      final dayAtDk60 =
          AutoStudyProgramGenerator.findCycleDayForCurriculumOffset(
            pace: StudyProgramPace.dk60,
            offset: 4,
          );
      expect(dayAtDk60, 2);

      // adaptCycleDayToNewPace doğrudan dönüşümü yapmalı
      final adaptedDay = AutoStudyProgramGenerator.adaptCycleDayToNewPace(
        oldPace: StudyProgramPace.dk30,
        newPace: StudyProgramPace.dk60,
        currentCycleDay: 4,
      );
      expect(adaptedDay, 2);
    });

    test('generateDailyTasks çözülmüş testleri atlayarak sıradaki çözülmemiş testleri atamalı', () {
      final curriculum = AutoStudyProgramGenerator.buildOrderedCurriculum();
      final firstTest = curriculum.first;

      // İlk testi çözülmüş olarak simüle edelim
      bool isSolved(String lesson, String topic, int testNumber) {
        return lesson == firstTest.lesson &&
            topic == firstTest.topic &&
            testNumber == firstTest.testNumber;
      }

      final tasksWithSolved = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk30,
        cycleDay: 1,
        isTestSolved: isSolved,
      );

      // Görev listesindeki ilk test çözülmüş olan firstTest OLMAMALI!
      final assignedQuiz = tasksWithSolved.first;
      expect(
        assignedQuiz.title ==
            '${firstTest.topic} · Test ${firstTest.testNumber}',
        isFalse,
      );
    });
  });

  group('StudyPlannerNotifier & AutoStudyProgramModal Adaptasyon Entegrasyonu', () {
    test('tempo 30 dk dan 60 dk ya çıkarıldığında ilerleme sıfırlanmamalı, eşdeğer günden devam etmeli', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyPlannerProvider.notifier);

      // 1. Kullanıcı 30 dk tempo ile başlasın ve 4. güne gelsin
      notifier.setupAutoProgram(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk30,
        cycleDay: 4,
      );

      expect(container.read(studyPlannerProvider).cycleDay, 4);

      // 2. Kullanıcı çalışma süresini 60 dk ya yükseltsin
      notifier.adaptStudyProgramPace(
        examTarget: KpssExamTarget.lisans,
        oldPace: StudyProgramPace.dk30,
        newPace: StudyProgramPace.dk60,
      );

      final stateAfter = container.read(studyPlannerProvider);
      // İlerleme 1'e SIFIRLANMADI ve gün geriye düşürülmedi! Gün 4'te kalarak yeni tempoya adapte oldu
      expect(stateAfter.cycleDay, 4);
      expect(stateAfter.tasks.isNotEmpty, isTrue);
    });

    test('30 dk planla 10 gün tamamla -> 60 dk plana geç -> Gün 1..10 görev itemları, tamamlanan görevler ve snapshot JSON verisi %100 korunmalı', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyPlannerProvider.notifier);

      // 1. 30 dk tempo ile başla
      notifier.setupAutoProgram(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk30,
        cycleDay: 1,
      );

      // 1. günden 9. güne kadar her günün tüm görevlerini tamamla ve ilerle
      for (var day = 1; day <= 9; day++) {
        final currentTasks = container.read(studyPlannerProvider).tasks;
        expect(container.read(studyPlannerProvider).cycleDay, day);
        for (final task in currentTasks) {
          notifier.markTaskCompleted(task.id);
        }
        final advanced = notifier.advanceToNextDay(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );
        expect(
          advanced,
          isTrue,
          reason: 'Gün $day tamamlandıktan sonra gün $day + 1 açılmalı',
        );
      }

      // Gün 10'a ulaşıldığını doğrula
      var stateDay10 = container.read(studyPlannerProvider);
      expect(stateDay10.cycleDay, 10);
      expect(stateDay10.maxUnlockedDay, 10);

      // 10. günün görevlerini tamamla ve başlıklarını kaydet
      final day10TasksBefore = List.of(stateDay10.tasks);
      final day10CompletedTitles = day10TasksBefore.map((t) => t.title).toSet();
      for (final task in day10TasksBefore) {
        notifier.markTaskCompleted(task.id);
      }

      // 2. 60 dk temposuna geçiş yap
      notifier.adaptStudyProgramPace(
        examTarget: KpssExamTarget.lisans,
        oldPace: StudyProgramPace.dk30,
        newPace: StudyProgramPace.dk60,
      );

      final stateAfterAdapt = container.read(studyPlannerProvider);
      // Gün sayacı geriye DÜŞMEMELİ: 10. günde kalmalı
      expect(stateAfterAdapt.cycleDay, 10);
      expect(stateAfterAdapt.maxUnlockedDay, 10);

      // 10. gün görev listesinde daha önce 30 dk ile tamamlanan tüm görevler korunmalı
      for (final title in day10CompletedTitles) {
        final preservedTask = stateAfterAdapt.tasks.firstWhere(
          (t) => t.title == title,
          orElse: () => throw Exception('Görev $title bulunamadı'),
        );
        expect(
          preservedTask.isCompleted,
          isTrue,
          reason:
              '$title görevi adaptasyon sonrasında tamamlanmış olarak kalmalıdır',
        );
      }

      // 60 dk temposunun eklediği yeni ekstra görevler isCompleted == false olmalı
      final extraTasks = stateAfterAdapt.tasks
          .where((t) => !day10CompletedTitles.contains(t.title))
          .toList();
      expect(
        extraTasks.isNotEmpty,
        isTrue,
        reason: '60 dk temposu 30 dk ya göre ilave görev itemları eklemelidir',
      );
      for (final extra in extraTasks) {
        expect(
          extra.isCompleted,
          isFalse,
          reason:
              'Eklenen yeni görev (${extra.title}) henüz tamamlanmamış olmalıdır',
        );
      }

      // 3. Snapshot JSON çıktısının tasks_by_day alanını doğrula
      final snapshot = notifier.exportSnapshot();
      final jsonMap = snapshot.toJson();
      final tasksByDayJson = jsonMap['tasks_by_day'] as Map<String, dynamic>;

      for (var d = 1; d <= 10; d++) {
        expect(
          tasksByDayJson.containsKey('$d'),
          isTrue,
          reason: 'tasks_by_day içinde Gün $d bulunmalıdır',
        );
        final dayList = tasksByDayJson['$d'] as List;
        expect(
          dayList.isNotEmpty,
          isTrue,
          reason: 'Gün $d görev listesi boş olmamalıdır',
        );
        for (final item in dayList) {
          final map = item as Map<String, dynamic>;
          expect(map.containsKey('title'), isTrue);
          expect(map.containsKey('lessonTag'), isTrue);
          expect(map.containsKey('actionType'), isTrue);
          expect(map.containsKey('isCompleted'), isTrue);
        }
      }

      // 4. JSON Round-Trip ve Yeni ProviderContainer üzerinde applySnapshot Doğrulaması
      final restoredSnapshot = PlannerSyncSnapshot.fromJson(jsonMap);
      final container2 = ProviderContainer();
      addTearDown(container2.dispose);

      final notifier2 = container2.read(studyPlannerProvider.notifier);
      notifier2.applySnapshot(
        restoredSnapshot,
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk60,
        syncToCloud: false,
      );

      final stateContainer2 = container2.read(studyPlannerProvider);
      expect(stateContainer2.cycleDay, 10);
      expect(stateContainer2.maxUnlockedDay, 10);
      expect(stateContainer2.tasks.length, stateAfterAdapt.tasks.length);

      // Gün 1..9 görevlerinin tamamının isCompleted == true olduğunu doğrula
      for (var d = 1; d < 10; d++) {
        notifier2.goToDay(
          d,
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk60,
        );
        final dayTasks = container2.read(studyPlannerProvider).tasks;
        expect(
          dayTasks.every((t) => t.isCompleted),
          isTrue,
          reason:
              'Geri yüklenen Gün $d görevlerinin tamamı isCompleted == true olmalıdır',
        );
      }

      // Gün 10'a dön ve korunan + ekstra görevlerin durumunu doğrula
      notifier2.goToDay(
        10,
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk60,
      );
      final day10TasksRestored = container2.read(studyPlannerProvider).tasks;
      for (final title in day10CompletedTitles) {
        final t = day10TasksRestored.firstWhere((task) => task.title == title);
        expect(t.isCompleted, isTrue);
      }
      final extraRestored = day10TasksRestored
          .where((t) => !day10CompletedTitles.contains(t.title))
          .toList();
      expect(extraRestored.isNotEmpty, isTrue);
      for (final extra in extraRestored) {
        expect(extra.isCompleted, isFalse);
      }
    });

    testWidgets(
      'AutoStudyProgramModal aktif programı olan kullanıcıda süreyi değiştirince ilerlemeyi korumalı ve SnackBar göstermeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final container = ProviderContainer();
        addTearDown(container.dispose);

        // Başlangıçta 30 dk aktif program olsun
        container
            .read(userPreferencesProvider.notifier)
            .setStudyProgramPace(StudyProgramPace.dk30);
        container
            .read(studyPlannerProvider.notifier)
            .setupAutoProgram(
              examTarget: KpssExamTarget.lisans,
              pace: StudyProgramPace.dk30,
              cycleDay: 4,
            );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: Builder(
                builder: (ctx) => Scaffold(
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () => AutoStudyProgramModal.show(ctx),
                      child: const Text('Modalı Aç'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Modalı Aç'));
        await tester.pumpAndSettle();

        // 60 dk temposunu seç
        await tester.tap(find.text('60 Dk · Tam Ritim (Önerilen)'));
        await tester.pumpAndSettle();

        // Programı güncelle butonuna tıkla
        await tester.tap(find.textContaining('Programını'));
        await tester.pumpAndSettle();

        // SnackBar içinde 'İlerlemen korundu!' mesajı çıkmalı
        expect(find.textContaining('İlerlemen korundu!'), findsOneWidget);

        // Planner durumu sıfırlanmamış olmalı (Gün 2 olmalı)
        expect(container.read(studyPlannerProvider).cycleDay > 1, isTrue);
      },
    );
  });
}
