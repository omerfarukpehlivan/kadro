import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
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
        expect(
          container.read(studyStatsProvider).weakestLesson,
          equals('Henüz veri yok'),
        );

        // 1 doğru Tarih sorusu çöz
        notifier.recordAnswer(lesson: 'Tarih', isCorrect: true);
        expect(container.read(studyStatsProvider).totalSolved, equals(1));
        expect(container.read(studyStatsProvider).totalCorrect, equals(1));
        expect(container.read(studyStatsProvider).accuracyPercent, equals(100));

        // 1 yanlış Tarih sorusu çöz
        notifier.recordAnswer(lesson: 'Tarih', isCorrect: false);
        expect(container.read(studyStatsProvider).totalSolved, equals(2));
        expect(container.read(studyStatsProvider).totalWrong, equals(1));
        expect(container.read(studyStatsProvider).accuracyPercent, equals(50));
        expect(
          container.read(studyStatsProvider).weakestLesson,
          equals('Tarih'),
        );
      },
    );

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
        expect(find.text('1 / 30 soru'), findsOneWidget);

        // 4. İstatistik Ekranını çiz -> Çözülen 1, Doğru oranı %0, En zayıf Tarih olmalı
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: StatsScreen()),
          ),
        );
        expect(find.text('1'), findsOneWidget); // Çözülen soru
        expect(find.text('%0'), findsOneWidget); // Doğru oranı
        expect(find.text('Tarih'), findsOneWidget); // En zayıf ders
      },
    );
  });
}
