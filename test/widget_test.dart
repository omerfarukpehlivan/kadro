import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
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
  testWidgets('Alt menüden sayfalar arasında geçiş yapılır', (
    WidgetTester tester,
  ) async {
    // Uygulamayı çiz: ilk açılışta ana sayfa görünür.
    await tester.pumpWidget(_onboardedApp());
    expect(find.text('Hoş geldin'), findsOneWidget);

    // Alt menüde "Dersler"e dokun ve animasyonların bitmesini bekle.
    await tester.tap(find.text('Dersler'));
    await tester.pumpAndSettle();
    expect(find.text('Hoş geldin'), findsNothing);
    expect(find.text('Tarih'), findsOneWidget);

    // "Pratik"e geç.
    await tester.tap(find.text('Pratik'));
    await tester.pumpAndSettle();
    expect(find.text('Antrenman Sahası'), findsOneWidget);

    // "Profil"e geç.
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();
    expect(find.text('Profilin'), findsOneWidget);
  });

  testWidgets(
    'Dersler sekmesinde Tarih kartına tıklanınca Tarih Konuları ekranı açılır',
    (WidgetTester tester) async {
      await tester.pumpWidget(_onboardedApp());

      // Alt menüden Dersler sekmesine geç
      await tester.tap(find.text('Dersler'));
      await tester.pumpAndSettle();

      // Tarih kartına tıkla
      await tester.tap(find.text('Tarih'));
      await tester.pumpAndSettle();

      // Tarih Konuları sayfasının açıldığını ve yol haritası düğümlerini doğrula
      expect(find.text('Tarih Konuları'), findsOneWidget);
      expect(find.text('İslamiyet Öncesi Türk Tarihi'), findsOneWidget);
      expect(find.text('1'), findsWidgets);
      expect(find.text('Test Çöz'), findsWidgets);
    },
  );
}
