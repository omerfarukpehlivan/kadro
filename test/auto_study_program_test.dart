import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/widgets/auto_study_program_modal.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';

void main() {
  group('StudyProgramPace & AutoStudyProgramGenerator Birim Testleri', () {
    test('5 günlük süre varyasyonunun soru, süre ve görev sayıları doğru tanımlanmalı', () {
      expect(StudyProgramPace.values.length, 5);
      expect(StudyProgramPace.dk15.estimatedMinutesPerDay, 15);
      expect(StudyProgramPace.dk15.dailyGoalQuestions, 10);

      expect(StudyProgramPace.dk30.estimatedMinutesPerDay, 30);
      expect(StudyProgramPace.dk30.dailyGoalQuestions, 20);

      expect(StudyProgramPace.dk45.estimatedMinutesPerDay, 45);
      expect(StudyProgramPace.dk45.dailyGoalQuestions, 30);

      expect(StudyProgramPace.dk60.estimatedMinutesPerDay, 60);
      expect(StudyProgramPace.dk60.dailyGoalQuestions, 45);

      expect(StudyProgramPace.dk90.estimatedMinutesPerDay, 90);
      expect(StudyProgramPace.dk90.dailyGoalQuestions, 70);
    });

    test(
      'fromKey metodu yeni 5 süreyi ve eski anahtarları güvenle dönüştürmeli',
      () {
        expect(StudyProgramPace.fromKey('dk15'), StudyProgramPace.dk15);
        expect(StudyProgramPace.fromKey('dk30'), StudyProgramPace.dk30);
        expect(StudyProgramPace.fromKey('dk45'), StudyProgramPace.dk45);
        expect(StudyProgramPace.fromKey('dk60'), StudyProgramPace.dk60);
        expect(StudyProgramPace.fromKey('dk90'), StudyProgramPace.dk90);

        expect(StudyProgramPace.fromKey('hafif'), StudyProgramPace.dk30);
        expect(StudyProgramPace.fromKey('orta'), StudyProgramPace.dk60);
        expect(StudyProgramPace.fromKey('hizli'), StudyProgramPace.dk90);

        expect(StudyProgramPace.fromKey(null), StudyProgramPace.dk60);
        expect(StudyProgramPace.fromKey('bilinmeyen'), StudyProgramPace.dk60);
      },
    );

    test('evaluateSchedule sınava kalan gün az olduğunda yetiştirme uyarısı ve öneri üretmeli', () {
      const target = KpssExamTarget.lisans; // 2027-09-05
      final closeDate = DateTime(2027, 8, 6); // 30 gün kala
      final advisory = StudyProgramPace.dk30.evaluateSchedule(
        target,
        now: closeDate,
      );

      expect(advisory.remainingDays, 30);
      expect(advisory.canFinishInTime, isFalse);
      expect(advisory.recommendedPace, StudyProgramPace.dk90);
      expect(advisory.message, contains('30 gün kaldı'));
      expect(advisory.message, contains('yetiştiremezsiniz'));

      final relaxedDate = DateTime(2026, 9, 5); // 365 gün kala
      final okAdvisory = StudyProgramPace.dk60.evaluateSchedule(
        target,
        now: relaxedDate,
      );
      expect(okAdvisory.canFinishInTime, isTrue);
      expect(okAdvisory.message, contains('tam tur'));
    });

    test('AutoStudyProgramGenerator gerçek konu ve test numarasıyla günlük paket üretmeli', () {
      final tasks15 = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk15,
        focusLesson: 'Coğrafya',
      );

      expect(tasks15.length, 2);
      expect(tasks15.first.lessonTag, 'Coğrafya');
      expect(tasks15.first.actionType, StudyTaskActionType.quiz);
      expect(tasks15.first.targetTopic, isNotNull);
      expect(tasks15.first.targetTestNumber, 1);
      expect(tasks15.first.targetCount, 10);

      final tasks60 = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.onlisans,
        pace: StudyProgramPace.dk60,
        focusLesson: 'Tarih',
        cycleDay: 1,
      );

      expect(tasks60.length, 5);
      expect(
        tasks60.any((t) => t.actionType == StudyTaskActionType.quiz),
        isTrue,
      );
      expect(
        tasks60.any((t) => t.actionType == StudyTaskActionType.flashcards),
        isTrue,
      );
      expect(
        tasks60.any((t) => t.actionType == StudyTaskActionType.map),
        isTrue,
      );

      final tasks90Day4 = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk90,
        focusLesson: 'Tarih',
        cycleDay: 4,
      );
      expect(
        tasks90Day4.any((t) => t.actionType == StudyTaskActionType.exam),
        isTrue,
      );
    });
  });

  group(
    'StudyPlannerNotifier & UserPreferences Otomatik Program Entegrasyonu',
    () {
      test('günün tüm görevleri tamamlanmadan sonraki güne geçiş kilitli olmalı, bitince geçilebilmeli ve önceki güne dönülebilmeli', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(studyPlannerProvider.notifier);

        notifier.setupAutoProgram(
          examTarget: KpssExamTarget.onlisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Vatandaşlık',
        );

        final day1Initial = container.read(studyPlannerProvider);
        expect(day1Initial.cycleDay, 1);
        expect(day1Initial.tasks.length, 6);
        expect(day1Initial.completedCount, 0);
        expect(day1Initial.allCompleted, isFalse);
        expect(day1Initial.canAdvanceToNextDay, isFalse);

        // 1. Görevler bitmeden sonraki güne geçiş denenirse engellenmeli (kilit kuralı)
        final advanceAttemptBlocked = notifier.advanceToNextDay(
          examTarget: KpssExamTarget.onlisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Vatandaşlık',
        );
        expect(advanceAttemptBlocked, isFalse);
        expect(container.read(studyPlannerProvider).cycleDay, 1);

        // 2. Günün tüm görevleri tamamlanıyor
        for (final task in day1Initial.tasks) {
          notifier.markTaskCompleted(task.id);
        }

        final day1Finished = container.read(studyPlannerProvider);
        expect(day1Finished.allCompleted, isTrue);
        expect(day1Finished.canAdvanceToNextDay, isTrue);

        // 3. Artık sonraki güne geçilebilir
        final advanceSuccess = notifier.advanceToNextDay(
          examTarget: KpssExamTarget.onlisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Vatandaşlık',
        );
        expect(advanceSuccess, isTrue);

        final day2 = container.read(studyPlannerProvider);
        expect(day2.cycleDay, 2);
        expect(day2.maxUnlockedDay, 2);
        expect(day2.hasPreviousDay, isTrue);
        expect(day2.tasks.first.id, isNot(day1Initial.tasks.first.id));

        // 4. Önceki güne geri dönebilme ve görev durumunu koruma
        notifier.goToPreviousDay(
          examTarget: KpssExamTarget.onlisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Vatandaşlık',
        );

        final backToDay1 = container.read(studyPlannerProvider);
        expect(backToDay1.cycleDay, 1);
        expect(backToDay1.isViewingPastDay, isTrue);
        expect(backToDay1.allCompleted, isTrue); // Tamamlanma durumu korundu!
        expect(
          backToDay1.canAdvanceToNextDay,
          isTrue,
        ); // Zaten açılmış olan Gün 2'ye dönebilir

        // 5. Geçmiş günden tekrar Gün 2'ye ilerleme
        final returnToDay2 = notifier.advanceToNextDay(
          examTarget: KpssExamTarget.onlisans,
          pace: StudyProgramPace.dk90,
          focusLesson: 'Vatandaşlık',
        );
        expect(returnToDay2, isTrue);
        expect(container.read(studyPlannerProvider).cycleDay, 2);
      });

      test(
        'setStudyProgramPace kullanıcı tercihlerine günlük süreyi kaydetmeli',
        () {
          final container = ProviderContainer();
          addTearDown(container.dispose);

          container
              .read(userPreferencesProvider.notifier)
              .setStudyProgramPace(StudyProgramPace.dk90);

          final prefs = container.read(userPreferencesProvider);
          expect(prefs.studyProgramPace, StudyProgramPace.dk90);
          expect(prefs.hasActiveStudyProgram, isTrue);
          expect(prefs.targetDailyStudyGoal, 70);
        },
      );
    },
  );

  group('AutoStudyProgramModal & HomeDailyPlanCard UI Testleri', () {
    testWidgets(
      'AutoStudyProgramModal 5 süre varyasyonunu ve program başlatma butonunu render etmeli',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(body: AutoStudyProgramModal()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Otomatik Çalışma Programı'), findsOneWidget);
        expect(find.text('15 Dk · Mikro Ritim'), findsOneWidget);
        expect(find.text('30 Dk · Hafif Tempo'), findsOneWidget);
        expect(find.text('45 Dk · Dengeli Tempo'), findsOneWidget);
        expect(find.text('60 Dk · Tam Ritim (Önerilen)'), findsOneWidget);
        expect(find.text('90 Dk · Kamp Modu'), findsOneWidget);

        final presetFinder = find.text('30 Dk · Hafif Tempo');
        await tester.ensureVisible(presetFinder);
        await tester.tap(presetFinder);
        await tester.pumpAndSettle();

        final startFinder = find.textContaining('Programını Başlat');
        await tester.ensureVisible(startFinder);
        await tester.tap(startFinder);
        await tester.pumpAndSettle();

        expect(
          container.read(userPreferencesProvider).studyProgramPace,
          StudyProgramPace.dk30,
        );
        expect(container.read(studyPlannerProvider).tasks.length, 3);
      },
    );

    testWidgets(
      'HomeDailyPlanCard görevler bitmeden kilitli olmalı, bitince sonraki güne geçebilmeli ve önceki güne dönülebilmeli',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: HomeDailyPlanCard())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Bugünün Çalışma Planı'), findsOneWidget);
        expect(find.text('Gün 1'), findsOneWidget);
        expect(find.text('Düzenle'), findsNothing);

        // Henüz görevler bitmediği için sonraki güne geçiş alanı görünmemeli
        expect(
          find.textContaining('Günü Tamamladın! Sonraki Güne Geç'),
          findsNothing,
        );
        expect(
          find.textContaining('Tüm Görevleri Tamamlayınca Açılır'),
          findsNothing,
        );

        // Görevleri tamamlayalım
        final notifier = container.read(studyPlannerProvider.notifier);
        final currentTasks = container.read(studyPlannerProvider).tasks;
        for (final t in currentTasks) {
          notifier.markTaskCompleted(t.id);
        }
        await tester.pumpAndSettle();

        // Artık "Günü Tamamladın! Sonraki Güne Geç (Gün 2) →" butonu görünmeli
        expect(
          find.textContaining('Günü Tamamladın! Sonraki Güne Geç'),
          findsOneWidget,
        );

        // Sonraki güne geçiş yapalım
        await tester.tap(
          find.textContaining('Günü Tamamladın! Sonraki Güne Geç'),
        );
        await tester.pumpAndSettle();

        expect(find.text('Gün 2'), findsOneWidget);

        // Gün 2'deyken "Önceki Güne Dön" butonu görünmeli ve tıklanınca Gün 1'e dönmeli
        expect(find.textContaining('Önceki Güne Dön'), findsOneWidget);
        await tester.tap(find.textContaining('Önceki Güne Dön'));
        await tester.pumpAndSettle();

        // Gün 1 tekrar moduna döndü
        expect(find.textContaining('Gün 1'), findsOneWidget);
        expect(find.textContaining('Tekrar'), findsWidgets);

        // TASK-162: HomeDailyPlanCard üzerinde Düzenle butonu kaldırılmıştır
        expect(find.text('Düzenle'), findsNothing);
      },
    );
  });
}
