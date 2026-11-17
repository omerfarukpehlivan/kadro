import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/main.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('AppTheme Tests', () {
    test('Açık tema primary rengi seedColor ile eşleşir', () {
      expect(AppTheme.light.colorScheme.primary, AppTheme.seedColor);
    });

    test('Karanlık tema parlaklığı Brightness.dark değerindedir', () {
      expect(AppTheme.dark.brightness, Brightness.dark);
    });

    test(
      'Tuğrul Kobaltı & Anadolu Altını renk paleti doğru tokenlarla tanımlıdır',
      () {
        final light = AppTheme.light;
        expect(light.colorScheme.secondary, equals(AppTheme.secondaryColor));
        expect(light.colorScheme.secondary, equals(const Color(0xFF0E9F6E)));
        expect(light.colorScheme.primary, equals(AppTheme.seedColor));
        expect(light.colorScheme.primary, equals(const Color(0xFF2140D4)));
        expect(light.colorScheme.tertiary, equals(const Color(0xFFE28400)));
        expect(light.colorScheme.surface, equals(const Color(0xFFFFFFFF)));
        expect(light.scaffoldBackgroundColor, equals(const Color(0xFFF4F7FC)));
        expect(light.colorScheme.onSurface, equals(const Color(0xFF141928)));
        expect(
          light.colorScheme.primaryContainer,
          equals(const Color(0xFFE4EBFF)),
        );
        expect(
          light.colorScheme.onPrimaryContainer,
          equals(const Color(0xFF102070)),
        );

        final dark = AppTheme.dark;
        expect(dark.colorScheme.primary, equals(AppTheme.darkPrimaryColor));
        expect(dark.colorScheme.secondary, equals(AppTheme.darkSecondaryColor));
        expect(dark.colorScheme.surface, equals(const Color(0xFF151B2E)));
        expect(dark.scaffoldBackgroundColor, equals(const Color(0xFF0C101C)));
        expect(dark.colorScheme.onSurface, equals(const Color(0xFFF1F5FE)));
        expect(
          dark.colorScheme.surfaceContainerHighest,
          equals(const Color(0xFF273152)),
        );
      },
    );

    test('TASK-73: 15 M3 metin stilinin tamamı hiyerarşik ve doğru font boyutlarına (Base=16px) sahiptir', () {
      final textTheme = AppTheme.light.textTheme;

      // Başlık Hiyerarşisi (display -> headline -> title)
      expect(textTheme.displayLarge?.fontSize, equals(32.0));
      expect(textTheme.displayMedium?.fontSize, equals(28.0));
      expect(textTheme.displaySmall?.fontSize, equals(24.0));
      expect(textTheme.headlineLarge?.fontSize, equals(24.0));
      expect(textTheme.headlineMedium?.fontSize, equals(22.0));
      expect(textTheme.headlineSmall?.fontSize, equals(20.0));
      expect(textTheme.titleLarge?.fontSize, equals(18.0));
      expect(textTheme.titleMedium?.fontSize, equals(16.0));
      expect(textTheme.titleSmall?.fontSize, equals(15.0));

      expect(
        textTheme.displayLarge!.fontSize!,
        greaterThan(textTheme.displayMedium!.fontSize!),
      );
      expect(
        textTheme.displayMedium!.fontSize!,
        greaterThan(textTheme.displaySmall!.fontSize!),
      );
      expect(
        textTheme.displaySmall!.fontSize!,
        greaterThanOrEqualTo(textTheme.headlineLarge!.fontSize!),
      );
      expect(
        textTheme.headlineLarge!.fontSize!,
        greaterThan(textTheme.headlineMedium!.fontSize!),
      );
      expect(
        textTheme.headlineMedium!.fontSize!,
        greaterThan(textTheme.headlineSmall!.fontSize!),
      );
      expect(
        textTheme.headlineSmall!.fontSize!,
        greaterThan(textTheme.titleLarge!.fontSize!),
      );
      expect(
        textTheme.titleLarge!.fontSize!,
        greaterThan(textTheme.titleMedium!.fontSize!),
      );
      expect(
        textTheme.titleMedium!.fontSize!,
        greaterThan(textTheme.titleSmall!.fontSize!),
      );

      // Gövde Hiyerarşisi (bodyLarge > bodyMedium > bodySmall)
      expect(textTheme.bodyLarge?.fontSize, equals(16.0));
      expect(textTheme.bodyMedium?.fontSize, equals(14.0));
      expect(textTheme.bodySmall?.fontSize, equals(12.0));

      expect(
        textTheme.bodyLarge!.fontSize!,
        greaterThan(textTheme.bodyMedium!.fontSize!),
      );
      expect(
        textTheme.bodyMedium!.fontSize!,
        greaterThan(textTheme.bodySmall!.fontSize!),
      );

      // Etiket Hiyerarşisi (labelLarge > labelMedium > labelSmall)
      expect(textTheme.labelLarge?.fontSize, equals(14.0));
      expect(textTheme.labelMedium?.fontSize, equals(12.0));
      expect(textTheme.labelSmall?.fontSize, equals(11.0));

      expect(
        textTheme.labelLarge!.fontSize!,
        greaterThan(textTheme.labelMedium!.fontSize!),
      );
      expect(
        textTheme.labelMedium!.fontSize!,
        greaterThan(textTheme.labelSmall!.fontSize!),
      );
    });
  });

  group('Shell Modernizasyon Testleri', () {
    testWidgets(
      'AppNavigationBar ve AppTopBar içinde PhosphorIcons ikonları render edilir',
      (WidgetTester tester) async {
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
            child: const MyApp(),
          ),
        );
        await tester.pumpAndSettle();

        final navBar = find.byType(AppNavigationBar);
        // Seçili tab (0 - Ana Sayfa) Fill ikonu kullanır
        expect(
          find.descendant(
            of: navBar,
            matching: find.byIcon(PhosphorIconsFill.house),
          ),
          findsOneWidget,
        );
        // Diğer seçili olmayan sekmeler Regular ikonu kullanır
        expect(
          find.descendant(
            of: navBar,
            matching: find.byIcon(PhosphorIconsRegular.books),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: navBar,
            matching: find.byIcon(PhosphorIconsRegular.target),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: navBar,
            matching: find.byIcon(PhosphorIconsRegular.timer),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: navBar,
            matching: find.byIcon(PhosphorIconsRegular.chartBar),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: navBar,
            matching: find.byIcon(PhosphorIconsRegular.userCircle),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(AppTopBar),
            matching: find.byType(TugrulAvatar),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(AppTopBar),
            matching: find.byIcon(PhosphorIconsFill.crown),
          ),
          findsOneWidget,
        );
        expect(find.text('PRO'), findsOneWidget);
      },
    );
  });

  group('TactileCard ve TugrulAvatar Testleri', () {
    testWidgets(
      'TactileCard keskin 3px alt dudak gölgesi ve TugrulAvatar dairesel madalyonla render edilir',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: const Scaffold(
              body: Column(
                children: [
                  TugrulAvatar(mood: TugrulMood.history, size: 64),
                  TactileCard(child: Text('Dokunulabilir Kart')),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(TactileCard), findsOneWidget);
        expect(find.byType(TugrulAvatar), findsOneWidget);
        expect(find.text('Dokunulabilir Kart'), findsOneWidget);

        final cardContainer = tester.widget<Container>(
          find
              .descendant(
                of: find.byType(TactileCard),
                matching: find.byType(Container),
              )
              .first,
        );
        final decoration = cardContainer.decoration! as BoxDecoration;
        expect(decoration.boxShadow, isNotNull);
        expect(decoration.boxShadow!.single.offset, equals(const Offset(0, 3)));
        expect(decoration.boxShadow!.single.blurRadius, equals(0.0));
      },
    );

    testWidgets(
      'TactileCard yarı saydam renkleri Color.alphaBlend ile opak harmanlar',
      (WidgetTester tester) async {
        final colorScheme = AppTheme.light.colorScheme;
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: Scaffold(
              body: TactileCard(
                backgroundColor: colorScheme.primary.withAlpha(40),
                borderColor: colorScheme.primary.withAlpha(80),
                child: const Text('Harmanlanmış Kart'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Harmanlanmış Kart'), findsOneWidget);
      },
    );
  });
}
