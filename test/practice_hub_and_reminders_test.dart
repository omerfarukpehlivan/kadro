import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

void main() {
  group('PracticeHubScreen Widget Testleri', () {
    testWidgets(
      'PracticeHubScreen maskot, 4 temel çalışma modu, çeldirici avı ve mini oyunları eksiksiz gösterir',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: PracticeHubScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // 1. Kadro Koçu Antrenman Sahası brifing kartı
        expect(find.text('ANTRENMAN SAHASI'), findsOneWidget);
        expect(find.text('Çalışma Türleri'), findsOneWidget);

        // 2. 4 Temel Çalışma Modu
        expect(find.text('Çalışma türleri'), findsOneWidget);
        expect(find.text('Konu testi'), findsOneWidget);
        expect(find.text('Bilgi kartları'), findsOneWidget);
        expect(find.text('Yanlış defteri'), findsOneWidget);
        expect(find.text('Deneme sınavı'), findsOneWidget);

        // 3. Özel Antrenman: ÖSYM Çeldirici Avı
        expect(find.text('Özel Antrenman'), findsOneWidget);
        expect(find.text('ÖSYM Çeldirici Avı'), findsOneWidget);
        expect(find.text('Tuzak Sorular'), findsOneWidget);

        // 4. Hızlı Tekrar & Refleks Antrenmanı
        expect(find.text('Hızlı Tekrar & Refleks Antrenmanı'), findsOneWidget);
        expect(find.text('60 Saniyede Pençe'), findsOneWidget);
        expect(find.text('Kavram Eşleştir'), findsOneWidget);
        expect(find.text('Kavram Pekiştirme'), findsOneWidget);
      },
    );

    testWidgets(
      'ÖSYM Çeldirici Avı kartına tıklanınca 10 soruluk tuzak sınavı açılır',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: PracticeHubScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Çeldirici avı kartına dokun
        await tester.tap(find.text('ÖSYM Çeldirici Avı'));
        await tester.pumpAndSettle();

        // QuizScreen ekranının ilgili özel başlıkla açıldığını doğrula
        expect(find.text('ÖSYM Çeldirici Avı (Tuzak Sorular)'), findsOneWidget);
        expect(find.byType(QuizScreen), findsOneWidget);
      },
    );
  });

  group('HomeScreen Akıllı Hatırlatıcılar Testleri', () {
    testWidgets(
      'HomeScreen üzerinde Görev & Durum Hatırlatıcıları 3 madde ile listelenir ve yönlendirir',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: HomeScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Hatırlatıcı başlığı
        expect(find.text('Görev & Durum Hatırlatıcıları'), findsOneWidget);

        // 1. Çalışma Planı satırı
        expect(find.text('Çalışma Planı'), findsOneWidget);
        expect(find.textContaining('çalışma görevin var'), findsOneWidget);

        // 2. Seri & Hedef satırı
        expect(find.text('Seri & Hedef'), findsOneWidget);
        expect(
          find.textContaining('serini korumak için kalan'),
          findsOneWidget,
        );

        // 3. Hızlı Pratik satırı
        expect(find.text('Hızlı Pratik'), findsOneWidget);
        expect(
          find.text('Yanlış defteri ve çalışma modlarıyla netlerini artır'),
          findsOneWidget,
        );

        // Hızlı Pratik satırına tıklandığında MistakesScreen açılmalı
        await tester.tap(find.text('Hızlı Pratik'));
        await tester.pumpAndSettle();

        expect(find.byType(MistakesScreen), findsOneWidget);
      },
    );

    testWidgets(
      'Çalışma Planı hatırlatıcısına tıklandığında StudyPlannerScreen açılır',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: HomeScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Çalışma Planı'));
        await tester.pumpAndSettle();

        expect(find.byType(StudyPlannerScreen), findsOneWidget);
      },
    );
  });
}
