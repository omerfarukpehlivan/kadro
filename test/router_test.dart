import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/main.dart';

Widget _onboardedApp() => ProviderScope(
  overrides: [
    initialUserPreferencesProvider.overrideWithValue(
      const UserPreferencesState(
        hasCompletedOnboarding: true,
        hasActiveStudyProgram: true,
      ),
    ),
  ],
  child: const MyApp(),
);

void main() {
  group('GoRouter Navigasyon Testleri', () {
    testWidgets('Uygulama açılışında rota "/" ve başlık "Kadro" olmalı', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(_onboardedApp());
      await tester.pumpAndSettle();

      expect(find.text('Kadro'), findsOneWidget);
      expect(find.text('Hoş geldin'), findsOneWidget);
    });

    testWidgets(
      'createAppRouter alt sekmeler arası rota geçişlerini desteklemeli',
      (WidgetTester tester) async {
        final testRouter = createAppRouter(initialLocation: '/');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        // Dersler sekmesine git
        testRouter.go('/lessons');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Dersler'), findsOneWidget);

        // Pratik sekmesine git
        testRouter.go('/practice');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Çalışma Türleri'), findsOneWidget);

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
