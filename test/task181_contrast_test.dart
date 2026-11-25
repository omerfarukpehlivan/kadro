import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/shared/widgets/kadro_error_state.dart';

/// İki opak (veya arka plan üzerine harmanlanmış) renk arasındaki WCAG 2.1
/// kontrast oranını (`1.0` – `21.0`) hesaplar.
double wcagContrastRatio(Color foreground, Color background) {
  final fg = foreground.a < 1.0
      ? Color.alphaBlend(foreground, background)
      : foreground;
  final l1 = fg.computeLuminance();
  final l2 = background.computeLuminance();
  final lighter = math.max(l1, l2);
  final darker = math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

void main() {
  group('TASK-181: Açık ve Koyu Tema WCAG AA Kontrast Doğrulaması', () {
    void verifyScheme(String themeName, ColorScheme scheme) {
      final pairs = <({String label, Color fg, Color bg, double minRatio})>[
        (
          label: 'Soru kartı (onSurface / surface)',
          fg: scheme.onSurface,
          bg: scheme.surface,
          minRatio: 4.5,
        ),
        (
          label: 'Çözüm ikincil metin (onSurfaceVariant / surface)',
          fg: scheme.onSurfaceVariant,
          bg: scheme.surface,
          minRatio: 4.5,
        ),
        (
          label: 'Şık normal rozet (onSurfaceVariant / surfaceContainerLow)',
          fg: scheme.onSurfaceVariant,
          bg: scheme.surfaceContainerLow,
          minRatio: 4.5,
        ),
        (
          label: 'Şık seçili rozet (onPrimary / primary)',
          fg: scheme.onPrimary,
          bg: scheme.primary,
          minRatio: 4.5,
        ),
        (
          label: 'Şık seçili metin (onSurface / primaryContainer blend)',
          fg: scheme.onSurface,
          bg: Color.alphaBlend(
            scheme.primaryContainer.withAlpha(150),
            scheme.surface,
          ),
          minRatio: 4.5,
        ),
        (
          label: 'Şık doğru rozet (onSecondary / secondary)',
          fg: scheme.onSecondary,
          bg: scheme.secondary,
          minRatio: 4.5,
        ),
        (
          label: 'Şık doğru metin (onSurface / secondaryContainer blend)',
          fg: scheme.onSurface,
          bg: Color.alphaBlend(
            scheme.secondaryContainer.withAlpha(170),
            scheme.surface,
          ),
          minRatio: 4.5,
        ),
        (
          label: 'Şık yanlış rozet (onError / error)',
          fg: scheme.onError,
          bg: scheme.error,
          minRatio: 4.5,
        ),
        (
          label: 'Şık yanlış metin (onSurface / errorContainer blend)',
          fg: scheme.onSurface,
          bg: Color.alphaBlend(
            scheme.errorContainer.withAlpha(170),
            scheme.surface,
          ),
          minRatio: 4.5,
        ),
        (
          label:
              'Elenmiş şık metni (onSurfaceVariant@185 / surfaceContainerLow)',
          fg: scheme.onSurfaceVariant.withAlpha(185),
          bg: scheme.surfaceContainerLow,
          minRatio: 3.0,
        ),
        (
          label: 'ÖSYM Çeldirici Tuzağı / Tuzak callout (onTertiaryContainer / tertiaryContainer)',
          fg: scheme.onTertiaryContainer,
          bg: scheme.tertiaryContainer,
          minRatio: 4.5,
        ),
        (
          label: 'Konu anlatımı bilgi callout (onPrimaryContainer / primaryContainer)',
          fg: scheme.onPrimaryContainer,
          bg: scheme.primaryContainer,
          minRatio: 4.5,
        ),
        (
          label: 'Konu anlatımı kodlama callout (onSecondaryContainer / secondaryContainer)',
          fg: scheme.onSecondaryContainer,
          bg: scheme.secondaryContainer,
          minRatio: 4.5,
        ),
        (
          label: 'Tablo başlığı (onSurface / primaryContainer@110 blend)',
          fg: scheme.onSurface,
          bg: Color.alphaBlend(
            scheme.primaryContainer.withAlpha(110),
            scheme.surface,
          ),
          minRatio: 4.5,
        ),
        (
          label: 'KadroBadge error (onErrorContainer / errorContainer)',
          fg: scheme.onErrorContainer,
          bg: scheme.errorContainer,
          minRatio: 4.5,
        ),
        (
          label:
              'KadroBadge neutral (onSurfaceVariant / surfaceContainerHighest)',
          fg: scheme.onSurfaceVariant,
          bg: scheme.surfaceContainerHighest,
          minRatio: 4.5,
        ),
        (
          label: 'Alt gezinme seçili sekme (primary / surface)',
          fg: scheme.primary,
          bg: scheme.surface,
          minRatio: 4.5,
        ),
        (
          label: 'Alt gezinme pasif sekme (onSurfaceVariant / surface)',
          fg: scheme.onSurfaceVariant,
          bg: scheme.surface,
          minRatio: 4.5,
        ),
      ];

      for (final p in pairs) {
        final ratio = wcagContrastRatio(p.fg, p.bg);
        expect(
          ratio,
          greaterThanOrEqualTo(p.minRatio),
          reason:
              '[$themeName] ${p.label} kontrastı ${ratio.toStringAsFixed(2)}:1 '
              '(beklenen >= ${p.minRatio}:1)',
        );
      }
    }

    test('Açık tema (AppTheme.light) WCAG AA kontrastını sağlar', () {
      verifyScheme('Light', AppTheme.light.colorScheme);
    });

    test('Koyu tema (AppTheme.dark) WCAG AA kontrastını sağlar', () {
      verifyScheme('Dark', AppTheme.dark.colorScheme);
    });
  });

  group('TASK-181: Dokunma Hedefleri (>= 48x48 dp)', () {
    testWidgets(
      'OptionTile, şık eleme düğmesi, KadroErrorState ve alt gezinme >= 48dp',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: Scaffold(
              body: Column(
                children: [
                  OptionTile(
                    label: 'A',
                    text: 'Birinci şık metni',
                    onTap: () {},
                    onToggleEliminate: () {},
                  ),
                  KadroErrorState.network(onRetry: () {}),
                ],
              ),
              bottomNavigationBar: AppNavigationBar(
                selectedIndex: 0,
                onDestinationSelected: (_) {},
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final tileSize = tester.getSize(find.byType(OptionTile));
        expect(tileSize.height, greaterThanOrEqualTo(48));

        final eliminateSize = tester.getSize(
          find.byKey(const ValueKey('option_eliminate_A')),
        );
        expect(eliminateSize.width, greaterThanOrEqualTo(48));
        expect(eliminateSize.height, greaterThanOrEqualTo(48));

        final retrySize = tester.getSize(find.text('Tekrar Dene'));
        final retryBtnSize = tester.getSize(
          find.ancestor(
            of: find.text('Tekrar Dene'),
            matching: find.bySubtype<ButtonStyleButton>(),
          ),
        );
        expect(retrySize.width, greaterThan(0));
        expect(retryBtnSize.height, greaterThanOrEqualTo(48));

        final navSize = tester.getSize(find.byType(AppNavigationBar));
        expect(navSize.height, greaterThanOrEqualTo(48));
      },
    );
  });
}
