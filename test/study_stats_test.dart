import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_history_screen.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';

void main() {
  group('StudyStatsNotifier ve Canlı State Entegrasyon Testleri', () {
    const sampleQuestion = Question(
      id: 'stat_q1',
      lesson: 'Tarih',
      topic: 'İlk Türk Devletleri',
      text: 'Tarih testi soru metni.',
      options: [
        'Doğru Cevap',
        'Yanlış Seçenek',
        'Seçenek C',
        'Seçenek D',
        'Seçenek E',
      ],
      correctIndex: 0,
      explanation: 'Açıklama',
    );

    test(
      'StudyStatsNotifier recordAnswer ve getter mantığı doğru çalışmalı',
      () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(studyStatsProvider.notifier);

        expect(container.read(studyStatsProvider).totalSolved, equals(0));
        expect(container.read(studyStatsProvider).totalXp, equals(0));
        expect(
          container.read(studyStatsProvider).leagueTier,
          equals('Bronz Kadro'),
        );
        expect(
          container.read(studyStatsProvider).weakestLesson,
          equals('Henüz veri yok'),
        );

        // 1 doğru Tarih sorusu çöz
        notifier.recordAnswer(lesson: 'Tarih', isCorrect: true);
        expect(container.read(studyStatsProvider).totalSolved, equals(1));
        expect(container.read(studyStatsProvider).totalCorrect, equals(1));
        expect(container.read(studyStatsProvider).accuracyPercent, equals(100));
        expect(container.read(studyStatsProvider).totalXp, equals(15));
        expect(
          container.read(studyStatsProvider).lessonMasteryLabel('Tarih'),
          equals('Usta (%100)'),
        );

        // 1 yanlış Tarih sorusu çöz
        notifier.recordAnswer(lesson: 'Tarih', isCorrect: false);
        expect(container.read(studyStatsProvider).totalSolved, equals(2));
        expect(container.read(studyStatsProvider).totalWrong, equals(1));
        expect(container.read(studyStatsProvider).accuracyPercent, equals(50));
        expect(
          container.read(studyStatsProvider).totalXp,
          equals(20),
        ); // 15 + 5
        expect(
          container.read(studyStatsProvider).lessonMasteryLabel('Tarih'),
          equals('Gelişiyor (%50)'),
        );
        expect(
          container.read(studyStatsProvider).weakestLesson,
          equals('Tarih'),
        );
      },
    );

    test('recordQuizSession oturum kaydı ve XP güncellemesini sağlamalı', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyStatsProvider.notifier);

      final session = QuizSessionRecord(
        id: 'sess_1',
        title: 'Tarih Deneme Testi',
        lesson: 'Tarih',
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 2,
        emptyCount: 0,
        netScore: 7.5,
        earnedXp: 130,
        durationSeconds: 120,
        completedAt: DateTime.now(),
      );

      notifier.recordQuizSession(session);

      final state = container.read(studyStatsProvider);
      expect(state.sessionHistory.length, equals(1));
      expect(state.sessionHistory.first.title, equals('Tarih Deneme Testi'));
      expect(state.totalXp, equals(130));
    });

    testWidgets(
      'QuizScreen soru çözüldüğünde HomeScreen ve StatsScreen canlı güncellenmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        // 1. Ana Sayfayı çiz ve başlangıç hedefini (0 / 30) doğrula
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: HomeScreen()),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('0 / 30 soru'), findsOneWidget);

        // 2. QuizScreen aç ve yanlış cevap ver
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: QuizScreen(questions: [sampleQuestion]),
            ),
          ),
        );

        // Yanlış seçeneğe dokun
        await tester.tap(find.text('Yanlış Seçenek'));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
        await tester.pumpAndSettle();

        // 3. Ana Sayfayı tekrar çiz -> Artık 1 / 30 soru olmalı
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: HomeScreen()),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('1 / 30 soru'), findsOneWidget);

        // 4. İstatistik Ekranını çiz -> Çözülen 1, Doğru oranı %0, En zayıf Tarih olmalı
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: StatsScreen()),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('1'), findsOneWidget); // Çözülen soru
        expect(find.text('%0'), findsOneWidget); // Doğru oranı
        expect(find.text('Tarih'), findsOneWidget); // En zayıf ders
      },
    );

    testWidgets(
      'StatsScreen üzerinde BarChart, Lig ve Ustalık Isı Haritası render edilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: StatsScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Bronz Kadro'), findsOneWidget);
        expect(find.text('0 XP'), findsOneWidget);
        expect(find.text('1 Gün Seri'), findsOneWidget);
        expect(find.byType(BarChart), findsOneWidget);
        expect(find.text('Ders Bazlı Başarı Oranı (%)'), findsOneWidget);
        expect(find.text('Ders Ustalık Isı Haritası'), findsOneWidget);
        expect(find.text('TAR · Tarih'), findsOneWidget);
        expect(find.text('Çözülen Testler Arşivi (0)'), findsOneWidget);
      },
    );

    testWidgets(
      'QuizHistoryScreen üzerinde oturum kartına tıklandığında QuizSessionDetailScreen açılmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        final session = QuizSessionRecord(
          id: 'test_sess_99',
          title: 'Tarih Öncül Testi',
          lesson: 'Tarih',
          totalQuestions: 10,
          correctCount: 8,
          wrongCount: 2,
          emptyCount: 0,
          netScore: 7.5,
          earnedXp: 130,
          durationSeconds: 150,
          completedAt: DateTime.now(),
        );

        container.read(studyStatsProvider.notifier).recordQuizSession(session);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: QuizHistoryScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Tarih Öncül Testi'), findsOneWidget);
        expect(find.text('+130 XP'), findsOneWidget);

        // Karta tıkla -> QuizSessionDetailScreen açılmalı
        await tester.tap(find.text('Tarih Öncül Testi'));
        await tester.pumpAndSettle();

        expect(find.byType(QuizSessionDetailScreen), findsOneWidget);
        expect(find.text('Test Oturumu Detayı'), findsOneWidget);
        expect(find.text('Oturum Karnesi'), findsOneWidget);
        expect(find.text('Aynı Dersten Yeni Test Çöz'), findsOneWidget);
      },
    );

    test('Gün dönümü ve günlük çözülen soru takibi doğru çalışmalı', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyStatsProvider.notifier);

      // İlk soru çözüldüğünde
      notifier.recordAnswer(lesson: 'Tarih', isCorrect: true);
      expect(container.read(studyStatsProvider).dailySolvedCount, 1);
      expect(container.read(studyStatsProvider).totalSolved, 1);
      expect(container.read(studyStatsProvider).streakDays, 1);

      // Aynı gün 2. soru
      notifier.recordAnswer(lesson: 'Tarih', isCorrect: false);
      expect(container.read(studyStatsProvider).dailySolvedCount, 2);
      expect(container.read(studyStatsProvider).totalSolved, 2);
      expect(container.read(studyStatsProvider).streakDays, 1);
    });
  });
}
