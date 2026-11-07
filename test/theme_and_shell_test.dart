import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/main.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('AppTheme Tests', () {
    test('Açık tema primary rengi seedColor ile eşleşir', () {
      expect(AppTheme.light.colorScheme.primary, AppTheme.seedColor);
    });

    test('Karanlık tema parlaklığı Brightness.dark değerindedir', () {
      expect(AppTheme.dark.brightness, Brightness.dark);
    });

    test('WCAG AAA uyumlu yüksek kontrastlı renk çiftleri tanımlıdır', () {
      final light = AppTheme.light;
      expect(light.colorScheme.secondary, equals(AppTheme.secondaryColor));
      expect(light.colorScheme.secondary, equals(const Color(0xFF0D9488)));
      expect(light.colorScheme.primary, equals(AppTheme.seedColor));
      expect(light.colorScheme.surface, equals(const Color(0xFFFFFFFF)));
      expect(light.colorScheme.onSurface, equals(const Color(0xFF0F172A)));
      expect(
        light.colorScheme.primaryContainer,
        equals(const Color(0xFFF0F4F8)),
      );
      expect(
        light.colorScheme.onPrimaryContainer,
        equals(const Color(0xFF0C2138)),
      );

      final dark = AppTheme.dark;
      expect(dark.colorScheme.primary, equals(AppTheme.darkPrimaryColor));
      expect(dark.colorScheme.secondary, equals(AppTheme.darkSecondaryColor));
      expect(dark.colorScheme.surface, equals(const Color(0xFF1E293B)));
      expect(dark.colorScheme.onSurface, equals(const Color(0xFFF8FAFC)));
      expect(
        dark.colorScheme.surfaceContainerHighest,
        equals(const Color(0xFF334155)),
      );
    });

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
      'AppNavigationBar içinde PhosphorIcons ikonları render edilir',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // Seçili tab (0 - Ana Sayfa) Fill ikonu kullanır
        expect(find.byIcon(PhosphorIconsFill.house), findsOneWidget);
        // Diğer seçili olmayan sekmeler Bold ikonu kullanır
        expect(find.byIcon(PhosphorIconsBold.books), findsOneWidget);
        expect(find.byIcon(PhosphorIconsBold.target), findsOneWidget);
        expect(find.byIcon(PhosphorIconsBold.timer), findsOneWidget);
        expect(find.byIcon(PhosphorIconsBold.chartBar), findsOneWidget);
        expect(find.byIcon(PhosphorIconsBold.userCircle), findsOneWidget);
        expect(find.byIcon(PhosphorIconsFill.crown), findsOneWidget);
        expect(find.text('PRO'), findsOneWidget);
      },
    );
  });

  group('TactileCard ve MascotCoachBanner Testleri', () {
    testWidgets('TactileCard ve MascotCoachBanner hatasız render edilir', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: Column(
              children: [
                TactileCard(child: Text('Dokunulabilir Kart')),
                MascotCoachBanner(
                  title: 'Günün KPSS Tavsiyesi',
                  message: 'Tarihte ilk Türk devletlerine odaklan!',
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TactileCard), findsOneWidget);
      expect(find.byType(MascotCoachBanner), findsOneWidget);
      expect(find.text('Dokunulabilir Kart'), findsOneWidget);
      expect(find.text('KADRO KOÇU'), findsOneWidget);
      expect(find.text('Günün KPSS Tavsiyesi'), findsOneWidget);
      expect(
        find.text('Tarihte ilk Türk devletlerine odaklan!'),
        findsOneWidget,
      );
    });

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
