import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/main.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

void main() {
  group('AppTheme Tests', () {
    test('Açık tema primary rengi seedColor ile eşleşir', () {
      expect(AppTheme.light.colorScheme.primary, AppTheme.seedColor);
    });

    test('Karanlık tema parlaklığı Brightness.dark değerindedir', () {
      expect(AppTheme.dark.brightness, Brightness.dark);
    });
  });

  group('Shell Modernizasyon Testleri', () {
    testWidgets('AppNavigationBar içinde LucideIcons ikonları render edilir', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(LucideIcons.house), findsOneWidget);
      expect(find.byIcon(LucideIcons.bookOpen), findsOneWidget);
      expect(find.byIcon(LucideIcons.timer), findsOneWidget);
      expect(find.byIcon(LucideIcons.chartColumn), findsOneWidget);
      expect(find.byIcon(LucideIcons.user), findsOneWidget);
      expect(find.byIcon(LucideIcons.crown), findsOneWidget);
      expect(find.text('PRO'), findsOneWidget);
    });
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
  });
}
