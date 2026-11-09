import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/widgets/auto_study_program_modal.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';

void main() {
  group('StudyProgramPace & AutoStudyProgramGenerator Birim Testleri', () {
    test('3 tempo seçeneğinin günlük soru, süre ve görev sayıları doğru tanımlanmalı', () {
      expect(StudyProgramPace.hafif.tasksPerDay, 2);
      expect(StudyProgramPace.hafif.dailyGoalQuestions, 25);

      expect(StudyProgramPace.orta.tasksPerDay, 3);
      expect(StudyProgramPace.orta.dailyGoalQuestions, 45);

      expect(StudyProgramPace.hizli.tasksPerDay, 4);
      expect(StudyProgramPace.hizli.dailyGoalQuestions, 85);
    });

    test('fromKey metodu güvenli varsayılan değer dönmeli', () {
      expect(StudyProgramPace.fromKey('hafif'), StudyProgramPace.hafif);
      expect(StudyProgramPace.fromKey('orta'), StudyProgramPace.orta);
      expect(StudyProgramPace.fromKey('hizli'), StudyProgramPace.hizli);
      expect(StudyProgramPace.fromKey(null), StudyProgramPace.orta);
      expect(StudyProgramPace.fromKey('bilinmeyen'), StudyProgramPace.orta);
    });

    test(
      'calculatePacingSummary sınav hedefine göre gün ve tur tahmini üretmeli',
      () {
        const target = KpssExamTarget.onlisans;
        final summary = StudyProgramPace.orta.calculatePacingSummary(target);

        expect(summary, contains('gün kala:'));
        expect(summary, contains('1. Tur konu bitirme'));
        expect(summary, contains('tam tur'));
      },
    );

    test('AutoStudyProgramGenerator hafif tempoda 2 görev üretmeli', () {
      final tasks = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.hafif,
        focusLesson: 'Coğrafya',
      );

      expect(tasks.length, 2);
      expect(tasks.first.lessonTag, 'Coğrafya');
      expect(
        tasks.any((t) => t.actionType == StudyTaskActionType.quiz),
        isTrue,
      );
    });

    test('AutoStudyProgramGenerator orta tempoda 3 dengeli görev üretmeli', () {
      final tasks = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.onlisans,
        pace: StudyProgramPace.orta,
        focusLesson: 'Tarih',
      );

      expect(tasks.length, 3);
      expect(
        tasks.any((t) => t.actionType == StudyTaskActionType.quiz),
        isTrue,
      );
      expect(
        tasks.any((t) => t.actionType == StudyTaskActionType.flashcards),
        isTrue,
      );
      expect(
        tasks.any((t) => t.actionType == StudyTaskActionType.mistakes),
        isTrue,
      );
    });

    test(
      'AutoStudyProgramGenerator hızlı tempoda yoğun görev ve deneme üretmeli',
      () {
        final tasks = AutoStudyProgramGenerator.generateDailyTasks(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.hizli,
          focusLesson: 'Tarih',
        );

        expect(tasks.length, greaterThanOrEqualTo(4));
        expect(
          tasks.any((t) => t.actionType == StudyTaskActionType.exam),
          isTrue,
        );
      },
    );
  });

  group(
    'StudyPlannerNotifier & UserPreferences Otomatik Program Entegrasyonu',
    () {
      test(
        'setupAutoProgram seçilen tempo ve hedef sınava göre görevleri kurmalı',
        () {
          final container = ProviderContainer();
          addTearDown(container.dispose);

          final notifier = container.read(studyPlannerProvider.notifier);

          notifier.setupAutoProgram(
            examTarget: KpssExamTarget.onlisans,
            pace: StudyProgramPace.hizli,
            focusLesson: 'Vatandaşlık',
          );

          final state = container.read(studyPlannerProvider);
          expect(state.tasks.length, greaterThanOrEqualTo(4));
          expect(state.completedCount, 0);
          expect(state.remainingCount, state.totalCount);
        },
      );

      test('setStudyProgramPace kullanıcı tercihlerine tempoyu kaydetmeli', () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        container
            .read(userPreferencesProvider.notifier)
            .setStudyProgramPace(StudyProgramPace.hizli);

        final prefs = container.read(userPreferencesProvider);
        expect(prefs.studyProgramPace, StudyProgramPace.hizli);
        expect(prefs.hasActiveStudyProgram, isTrue);
        expect(prefs.targetDailyStudyGoal, 85);
      });
    },
  );

  group('AutoStudyProgramModal & HomeDailyPlanCard UI Testleri', () {
    testWidgets(
      'AutoStudyProgramModal 3 tempoyu ve program başlatma butonunu render etmeli',
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
        expect(find.text('Hafif Tempo'), findsOneWidget);
        expect(find.text('Orta Tempo (Önerilen)'), findsOneWidget);
        expect(find.text('Hızlı Tempo (Kamp Modu)'), findsOneWidget);

        expect(find.text('Konu Testi'), findsOneWidget);
        expect(find.text('Flashcards'), findsOneWidget);
        expect(find.text('Yanlış Defteri'), findsOneWidget);

        // Hafif tempoyu seç
        await tester.tap(find.text('Hafif Tempo'));
        await tester.pumpAndSettle();

        // Programı başlat
        await tester.tap(find.textContaining('Programını Başlat'));
        await tester.pumpAndSettle();

        expect(
          container.read(userPreferencesProvider).studyProgramPace,
          StudyProgramPace.hafif,
        );
        expect(container.read(studyPlannerProvider).tasks.length, 2);
      },
    );

    testWidgets(
      'HomeDailyPlanCard üzerinde otomatik program ayar butonu modalı açmalı',
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
        expect(find.text('Ayarla ▾'), findsOneWidget);

        await tester.tap(find.text('Ayarla ▾'));
        await tester.pumpAndSettle();

        expect(find.byType(AutoStudyProgramModal), findsOneWidget);
      },
    );
  });
}
