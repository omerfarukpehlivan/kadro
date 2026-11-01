import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/main.dart';
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
      expect(find.byIcon(LucideIcons.graduationCap), findsWidgets);
    });
  });
}
