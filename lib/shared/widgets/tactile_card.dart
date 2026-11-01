import 'package:flutter/material.dart';

/// Duolingo / Brilliant tarzı 3D alt gölgeli fiziksel basılabilir kart (Tactile Card).
///
/// Web/CSS karşılığı:
/// ```css
/// .tactile-card {
///   border: 1.5px solid var(--border-color);
///   box-shadow: 0 3px 0 var(--border-color);
///   border-radius: 18px;
///   cursor: pointer;
///   transition: transform 0.1s;
/// }
/// ```
/// Kullanıcı dokunduğunda InkWell dalgalanması sunar ve katı alt gölgesiyle
/// basılabilir derinlik hissi sağlar.
/// Arka plandaki alt dudak gölgesinin yarı saydam zeminlerden sızmasını önlemek için
/// Color.alphaBlend ile zemin rengi %100 opak harmanlanır.
class TactileCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;

  const TactileCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final rawBg = backgroundColor ?? colorScheme.surface;
    final effectiveBg = rawBg.a < 1.0
        ? Color.alphaBlend(rawBg, colorScheme.surface)
        : rawBg;

    final rawBorder = borderColor ?? colorScheme.outlineVariant;
    final effectiveBorder = rawBorder.a < 1.0
        ? Color.alphaBlend(rawBorder, colorScheme.surface)
        : rawBorder;

    return Container(
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: effectiveBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: effectiveBorder,
            offset: const Offset(0, 3.0),
            blurRadius: 0,
          ),
        ],
      ),
      child: Material(
        // GEMINI.md kuralı: Sabit Colors.transparent yerine tema rengi alpha=0 kullanılır
        color: colorScheme.surface.withAlpha(0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
