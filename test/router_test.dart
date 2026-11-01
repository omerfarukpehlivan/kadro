import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/main.dart';

void main() {
  group('GoRouter Navigasyon Testleri', () {
    testWidgets('Uygulama açılışında rota "/" ve başlık "Kadro" olmalı', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Kadro'), findsOneWidget);
      expect(find.text('Hoş geldin'), findsOneWidget);
    });

    testWidgets(
      'createAppRouter alt sekmeler arası rota geçişlerini desteklemeli',
      (WidgetTester tester) async {
        final testRouter = createAppRouter(initialLocation: '/');
        await tester.pumpWidget(MaterialApp.router(routerConfig: testRouter));
        await tester.pumpAndSettle();

        // Dersler sekmesine git
        testRouter.go('/lessons');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Dersler'), findsOneWidget);

        // Denemeler sekmesine git
        testRouter.go('/exams');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Denemeler'), findsOneWidget);

        // İstatistik sekmesine git
        testRouter.go('/stats');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'İstatistik'), findsOneWidget);

        // Profil sekmesine git
        testRouter.go('/profile');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Profil'), findsOneWidget);
      },
    );
  });
}
