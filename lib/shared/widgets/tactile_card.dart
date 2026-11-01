import 'package:flutter/material.dart';

/// Duolingo / Brilliant tarzı 3D alt gölgeli fiziksel basılabilir kart (Tactile Card).
///
/// Web/CSS karşılığı:
/// ```css
/// .tactile-card {
///   border: 1.5px solid var(--border-color);
///   box-shadow: 0 3.5px 0 var(--border-color);
///   border-radius: 18px;
///   cursor: pointer;
///   transition: transform 0.1s;
/// }
/// ```
/// Kullanıcı dokunduğunda InkWell dalgalanması sunar ve katı alt gölgesiyle
/// basılabilir derinlik hissi sağlar.
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
    final effectiveBg = backgroundColor ?? colorScheme.surface;
    final effectiveBorder = borderColor ?? colorScheme.outlineVariant;

    return Container(
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: effectiveBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: effectiveBorder,
            offset: const Offset(0, 3.5),
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
