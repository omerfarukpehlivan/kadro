import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// [KadroBadge] rozetinin anlamsal renk tonları (`TASK-153`).
enum KadroBadgeTone {
  /// Yumuşak birincil vurgu (`primaryContainer` / `onPrimaryContainer`).
  primary,

  /// Başarı ve tamamlanma vurgusu (`secondaryContainer` / `onSecondaryContainer`).
  secondary,

  /// Altın / seri / PRO uyarısı (`tertiaryContainer` / `onTertiaryContainer`).
  tertiary,

  /// Hata veya kritik vurgu (`errorContainer` / `onErrorContainer`).
  error,

  /// Nötr bilgi rozeti (`surfaceContainerHighest` / `onSurfaceVariant`).
  neutral,

  /// Dolu birincil rozet (`primary` / `onPrimary`) — seçili durumlar için.
  solidPrimary,
}

/// Uygulama genelinde konu, ders, PRO, tamamlanma ve durum etiketlerini
/// tek bir standart tasarımda sunan kompakt rozet bileşeni (`TASK-153`).
///
/// Web/Angular Karşılığı: Varyant (`tone`) destekli yeniden kullanılabilir
/// `<app-badge>` (`PillBadgeComponent`) bileşeni.
class KadroBadge extends StatelessWidget {
  final String label;
  final KadroBadgeTone tone;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const KadroBadge({
    super.key,
    required this.label,
    this.tone = KadroBadgeTone.primary,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colors = _resolveColors(colorScheme);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.$1,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            PhosphorIcon(icon!, size: 13, color: foregroundColor ?? colors.$2),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelSmall?.copyWith(
                color: foregroundColor ?? colors.$2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  (Color, Color) _resolveColors(ColorScheme scheme) {
    switch (tone) {
      case KadroBadgeTone.primary:
        return (scheme.primaryContainer, scheme.onPrimaryContainer);
      case KadroBadgeTone.secondary:
        return (scheme.secondaryContainer, scheme.onSecondaryContainer);
      case KadroBadgeTone.tertiary:
        return (scheme.tertiaryContainer, scheme.onTertiaryContainer);
      case KadroBadgeTone.error:
        return (scheme.errorContainer, scheme.onErrorContainer);
      case KadroBadgeTone.neutral:
        return (scheme.surfaceContainerHighest, scheme.onSurfaceVariant);
      case KadroBadgeTone.solidPrimary:
        return (scheme.primary, scheme.onPrimary);
    }
  }
}
