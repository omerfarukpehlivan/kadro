import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Bağımsız çözülen testlerin çalışma planıyla otomatik senkronizasyonunu doğrulayan testler.
///
/// Web/Angular Benzetmesi: Cross-store event integration test (Örn. Quiz Store -> Planner Store reaction).
void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('StudyPlanner Bağımsız Test Çözümü ve Senkronizasyon Testleri', () {
    test('1. Senaryo: Aktif günde çözülmemiş konu testi görevi varken, test bağımsız çözüldüğünde görev otomatik tamamlanmalı', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Planner'ı başlat ve ilk durumunu oku
      final plannerNotifier = container.read(studyPlannerProvider.notifier);
      final statsNotifier = container.read(studyStatsProvider.notifier);

      var plannerState = container.read(studyPlannerProvider);
      final targetTask = plannerState.tasks.firstWhere(
        (t) =>
            t.actionType == StudyTaskActionType.quiz &&
            t.lessonTag == 'Tarih' &&
            t.targetTopic == 'İslamiyet Öncesi Türk Tarihi' &&
            t.targetTestNumber == 1,
      );

      // Başlangıçta test görevi tamamlanmamış olmalı
      expect(targetTask.isCompleted, isFalse);

      // Kullanıcı bu testi bağımsız bir ekrandan çözsün ve istatistik kaydı oluşsun
      final record = QuizSessionRecord(
        id: 'test_session_1',
        title: 'Tarih · İslamiyet Öncesi Türk Tarihi · Test 1',
        lesson: 'Tarih',
        totalQuestions: 10,
        correctCount: 9,
        wrongCount: 1,
        emptyCount: 0,
        netScore: 8.75,
        earnedXp: 140,
        durationSeconds: 240,
        completedAt: DateTime.now(),
      );

      statsNotifier.recordQuizSession(record);

      // ref.listen sayesinde planner otomatik olarak güncellenmiş olmalı
      plannerState = container.read(studyPlannerProvider);
      final updatedTask = plannerState.tasks.firstWhere(
        (t) => t.id == targetTask.id,
      );

      expect(
        updatedTask.isCompleted,
        isTrue,
        reason: 'Bağımsız çözülen konu testi görevi otomatik isCompleted: true olmalı',
      );

      // Ayrıca markMatchingTestCompleted doğrudan çağrıldığında da çalışmalı
      plannerNotifier.addTask(
        title: 'İslamiyet Öncesi Türk Tarihi · Test 2',
        lessonTag: 'Tarih',
        estimatedMinutes: 15,
        actionType: StudyTaskActionType.quiz,
        targetTopic: 'İslamiyet Öncesi Türk Tarihi',
        targetTestNumber: 2,
      );

      plannerNotifier.markMatchingTestCompleted(
        lesson: 'Tarih',
        topic: 'İslamiyet Öncesi Türk Tarihi',
        testNumber: 2,
      );

      final task2 = container
          .read(studyPlannerProvider)
          .tasks
          .firstWhere((t) => t.targetTestNumber == 2);
      expect(task2.isCompleted, isTrue);
    });

    test('2. Senaryo: Kullanıcı önce testi bağımsız çözüp ardından çalışma programını kurduğunda/o güne geçtiğinde görev tamamlanmış gelmeli', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final statsNotifier = container.read(studyStatsProvider.notifier);
      final plannerNotifier = container.read(studyPlannerProvider.notifier);

      // Kullanıcı henüz program kurmadan önce Tarih Test 1'i bağımsız olarak çözüyor
      statsNotifier.recordQuizSession(
        QuizSessionRecord(
          id: 'pre_session_1',
          title: 'Tarih · İslamiyet Öncesi Türk Tarihi · Test 1',
          lesson: 'Tarih',
          totalQuestions: 10,
          correctCount: 10,
          wrongCount: 0,
          emptyCount: 0,
          netScore: 10.0,
          earnedXp: 150,
          durationSeconds: 180,
          completedAt: DateTime.now(),
        ),
      );

      // Şimdi otomatik çalışma programı kurulsun
      plannerNotifier.setupAutoProgram(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk30,
      );

      final plannerState = container.read(studyPlannerProvider);
      final test1Task = plannerState.tasks.firstWhere(
        (t) =>
            t.actionType == StudyTaskActionType.quiz &&
            t.lessonTag == 'Tarih' &&
            t.targetTopic == 'İslamiyet Öncesi Türk Tarihi' &&
            t.targetTestNumber == 1,
      );

      expect(
        test1Task.isCompleted,
        isTrue,
        reason: 'Önceden çözülmüş test, yeni güne geçildiğinde veya program kurulduğunda tamamlanmış olmalı',
      );
    });

    testWidgets(
      '3. Senaryo: StudyPlannerScreen üzerinde önceden çözülmüş görev üstü çizili, Tekrar Çöz butonu ve Önceden çözüldü etiketiyle görünmeli',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final statsNotifier = container.read(studyStatsProvider.notifier);
        final plannerNotifier = container.read(studyPlannerProvider.notifier);

        // 1. Testi çözülmüş olarak kaydet
        statsNotifier.recordQuizSession(
          QuizSessionRecord(
            id: 'widget_session_1',
            title: 'Tarih · İslamiyet Öncesi Türk Tarihi · Test 1',
            lesson: 'Tarih',
            totalQuestions: 10,
            correctCount: 9,
            wrongCount: 1,
            emptyCount: 0,
            netScore: 8.75,
            earnedXp: 140,
            durationSeconds: 210,
            completedAt: DateTime.now(),
          ),
        );

        // 2. Programı kur
        plannerNotifier.setupAutoProgram(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );

        // 3. Ekranı render et
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(body: StudyPlannerScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Görevler listesine kaydır
        await tester.drag(find.byType(ListView), const Offset(0, -300));
        await tester.pumpAndSettle();

        // "Önceden çözüldü" etiketinin görünür olduğunu doğrula
        expect(find.textContaining('Önceden çözüldü'), findsOneWidget);

        // "Tekrar Çöz" butonunun görünür olduğunu doğrula
        expect(find.text('Tekrar Çöz'), findsWidgets);

        // Başlığın üstü çizili (lineThrough) olduğunu doğrula
        final taskTitleFinder = find.text(
          'İslamiyet Öncesi Türk Tarihi · Test 1',
        );
        expect(taskTitleFinder, findsOneWidget);

        final textWidget = tester.widget<Text>(taskTitleFinder);
        expect(
          textWidget.style?.decoration,
          equals(TextDecoration.lineThrough),
          reason:
              'Tamamlanmış görevin başlığı üstü çizili (lineThrough) olmalı',
        );
      },
    );
  });
}
