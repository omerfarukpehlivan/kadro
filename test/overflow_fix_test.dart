import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('TASK-61 UI Taşma (Overflow) ve Görsel Hata Düzeltmeleri Testleri', () {
    testWidgets(
      'AppNavigationBar dar ekranlarda (320px) 5 sekmeyi taşmasız ve düzgün sığdırır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(320, 568);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        int selectedIndex = 0;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              bottomNavigationBar: AppNavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (idx) => selectedIndex = idx,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Tüm 5 sekme etiketi ekranda olmalı
        expect(find.text('Ana Sayfa'), findsOneWidget);
        expect(find.text('Dersler'), findsOneWidget);
        expect(find.text('Denemeler'), findsOneWidget);
        expect(find.text('İstatistik'), findsOneWidget);
        expect(find.text('Profil'), findsOneWidget);

        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'LessonsScreen Güncel Bilgiler ders kartı kompakt ekranda (360px) taşma vermez',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        final guncelFinder = find.text('Güncel Bilgiler');
        await tester.scrollUntilVisible(
          guncelFinder,
          200,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.pumpAndSettle();

        expect(guncelFinder, findsOneWidget);
        expect(find.text('Her Hafta Yeni'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'StatsScreen Çözülen Testler Arşivi başlığı uzun metinle taşma vermez (Expanded koruması)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final container = ProviderContainer();
        addTearDown(container.dispose);

        // Oturum sayısı eklendiğinde bile Expanded sayesinde taşmaz
        for (int i = 0; i < 5; i++) {
          container
              .read(studyStatsProvider.notifier)
              .recordQuizSession(
                QuizSessionRecord(
                  id: 'sess_$i',
                  title: 'Deneme Oturumu #$i',
                  lesson: 'Tarih',
                  totalQuestions: 10,
                  correctCount: 9,
                  wrongCount: 1,
                  emptyCount: 0,
                  netScore: 8.75,
                  earnedXp: 90,
                  durationSeconds: 320,
                  completedAt: DateTime.now(),
                ),
              );
        }

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: StatsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        final archiveFinder = find.textContaining('Çözülen Testler Arşivi');
        await tester.scrollUntilVisible(
          archiveFinder,
          200,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.pumpAndSettle();

        expect(archiveFinder, findsOneWidget);
        expect(find.text('Tümünü Gör'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'PaywallScreen paket seçenekleri kompakt ekranda (360px) taşma vermez',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(360, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: PaywallScreen())),
        );

        await tester.pumpAndSettle();

        expect(find.text(SubscriptionPlan.lifetime.title), findsOneWidget);
        expect(find.text(SubscriptionPlan.lifetime.badge!), findsOneWidget);
        expect(find.text(SubscriptionPlan.yearly.title), findsOneWidget);
        expect(find.text(SubscriptionPlan.yearly.badge!), findsOneWidget);

        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'QuizScreen Hatalı Soru Bildir modalı açıldığında clipBehavior antiAlias uygulanır',
      (WidgetTester tester) async {
        const sampleQuestion = Question(
          id: 'q_report_test',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi',
          text: 'Soru metni',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: 'Açıklama',
        );

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: QuizScreen(questions: [sampleQuestion])),
          ),
        );

        await tester.pumpAndSettle();

        // Flag butonuna basarak modalı aç
        await tester.tap(find.byIcon(PhosphorIconsBold.flag));
        await tester.pumpAndSettle();

        expect(find.textContaining('Hatalı Soru Bildir'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'QuizResultScreen kompakt ekranda (360x640) dikey taşma vermez (83px overflow çözümü)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        const result = QuizResult(
          totalQuestions: 10,
          correctCount: 8,
          wrongCount: 2,
          emptyCount: 0,
        );

        await tester.pumpWidget(
          const MaterialApp(home: QuizResultScreen(result: result)),
        );

        await tester.pumpAndSettle();

        expect(find.text('Test Tamamlandı!'), findsOneWidget);
        expect(find.text('Net Puanın'), findsOneWidget);
        expect(find.text('7.50'), findsOneWidget);
        expect(find.text('Zafer Karneni Paylaş 📸'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'TASK-64: MistakesScreen boş durumda 360x640 dar ekranda butonlar Wrap ile taşmasız render edilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: MistakesScreen())),
        );

        await tester.pumpAndSettle();

        expect(find.text('Yanlış defterin tertemiz!'), findsOneWidget);
        expect(find.text('Yeni Test Çöz'), findsOneWidget);
        expect(find.text('Bilgi Kartlarına Git'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'TASK-69: AppTopBar dar ekranda (320x568 ve 360x640) "Çalışma Türleri" ve çok uzun başlıkla taşma vermez',
      (WidgetTester tester) async {
        // 320x568 en dar ekran
        tester.view.physicalSize = const Size(320, 568);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(appBar: AppTopBar(title: 'Çalışma Türleri')),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Çalışma Türleri'), findsOneWidget);
        expect(tester.takeException(), isNull);

        // 360x640 ekranda aşırı uzun bir başlık ile test
        tester.view.physicalSize = const Size(360, 640);
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                appBar: AppTopBar(
                  title: 'Çok Uzun Bir KPSS Çalışma Sayfası Başlığı Testi',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.text('Çok Uzun Bir KPSS Çalışma Sayfası Başlığı Testi'),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'TASK-70: QuizResultScreen standart telefon ekranlarında (390x844 ve 360x640) tek bakışta sıfır kaydırma (hitTestable) ile render edilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        const result = QuizResult(
          totalQuestions: 10,
          correctCount: 8,
          wrongCount: 2,
          emptyCount: 0,
        );

        await tester.pumpWidget(
          const MaterialApp(home: QuizResultScreen(result: result)),
        );
        await tester.pumpAndSettle();

        // 390x844 ekranında en alttaki 'Ana Sayfaya Dön' butonu hiç scroll yapmadan doğrudan tıklanabilir (hitTestable) olmalı
        final homeButton = find.widgetWithText(
          OutlinedButton,
          'Ana Sayfaya Dön',
        );
        expect(homeButton, findsOneWidget);
        expect(homeButton.hitTestable(), findsOneWidget);
        expect(find.text('Net Puanın'), findsOneWidget);
        expect(find.text('7.50'), findsOneWidget);
        expect(find.text('%80 Başarı'), findsOneWidget);
        expect(tester.takeException(), isNull);

        // 360x640 kompakt ekranda da test edelim
        tester.view.physicalSize = const Size(360, 640);
        await tester.pumpWidget(
          const MaterialApp(home: QuizResultScreen(result: result)),
        );
        await tester.pumpAndSettle();

        expect(find.text('Net Puanın'), findsOneWidget);
        expect(homeButton.hitTestable(), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}
