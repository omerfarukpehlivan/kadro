import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

void main() {
  group('UserPreferencesNotifier ve Profile/Paywall Testleri', () {
    test('UserPreferencesNotifier metodları doğru çalışmalı', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(userPreferencesProvider.notifier);

      expect(container.read(userPreferencesProvider).isPro, isFalse);
      expect(
        container.read(userPreferencesProvider).dailyFreeQuestionLimit,
        equals(30),
      );
      expect(
        container.read(userPreferencesProvider).themeMode,
        equals(ThemeMode.system),
      );

      // PRO'ya yükselt
      notifier.upgradeToPro();
      expect(container.read(userPreferencesProvider).isPro, isTrue);

      // Ödüllü reklam ile +20 soru kazan
      notifier.rewardExtraQuestions(20);
      expect(
        container.read(userPreferencesProvider).dailyFreeQuestionLimit,
        equals(50),
      );

      // Tema modunu koyu yap
      notifier.setThemeMode(ThemeMode.dark);
      expect(
        container.read(userPreferencesProvider).themeMode,
        equals(ThemeMode.dark),
      );
    });

    testWidgets(
      'ProfileScreen üzerinden PaywallScreen açılmalı ve PRO yükseltmesi yapılabilmeli',
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
            child: const MaterialApp(home: ProfileScreen()),
          ),
        );

        // Başlangıçta PRO değil, tanıtım kartı görünmeli
        expect(find.text('Kadro PRO\'ya Yükselt'), findsOneWidget);
        expect(find.text('Kadro PRO Üyesi 👑'), findsNothing);

        // Tanıtım kartına tıkla -> PaywallScreen açılmalı
        await tester.tap(find.text('Kadro PRO\'ya Yükselt'));
        await tester.pumpAndSettle();

        expect(find.text('Kadro PRO'), findsOneWidget);
        expect(find.text('KPSS Hazırlığını Zirveye Taşı'), findsOneWidget);

        // PRO Satın Alma butonuna tıkla
        final proButtonFinder = find.text('Kadro PRO\'ya Geç (Aylık 79,90 TL)');
        expect(proButtonFinder, findsOneWidget);
        await tester.tap(proButtonFinder);
        await tester.pumpAndSettle();

        // Ekran kapandıktan sonra PRO rozeti görünmeli
        expect(find.text('Kadro PRO Üyesi 👑'), findsOneWidget);
        expect(container.read(userPreferencesProvider).isPro, isTrue);
      },
    );

    testWidgets('Günlük hedef ve tema seçimi başarıyla güncellenmeli', (
      WidgetTester tester,
    ) async {
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
          child: const MaterialApp(home: ProfileScreen()),
        ),
      );

      // 1. Günlük hedef satırına dokun ve 50 soru seç
      await tester.tap(find.text('Günlük hedef'));
      await tester.pumpAndSettle();

      expect(find.text('Günlük Hedef Belirle'), findsOneWidget);
      await tester.tap(find.text('50 soru'));
      await tester.pumpAndSettle();

      expect(find.text('50 soru'), findsOneWidget);
      expect(container.read(studyStatsProvider).dailyGoal, equals(50));

      // 2. Tema satırına dokun ve Koyu tema seç
      await tester.tap(find.text('Tema'));
      await tester.pumpAndSettle();

      expect(find.text('Tema Tercihi'), findsOneWidget);
      await tester.tap(find.text('Koyu'));
      await tester.pumpAndSettle();

      expect(find.text('Koyu'), findsOneWidget);
      expect(
        container.read(userPreferencesProvider).themeMode,
        equals(ThemeMode.dark),
      );
    });
  });
}
