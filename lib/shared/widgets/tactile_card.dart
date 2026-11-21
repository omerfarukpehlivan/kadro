import 'package:flutter/material.dart';

/// Fiziksel basılabilirlik ve net alt derinlik ("tactile lip") sunan kart bileşeni.
///
/// Yarı saydam arka plan renkleri geçirildiğinde kartı opak `surface` rengiyle harmanlar (`Color.alphaBlend`).
class TactileCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? lipColor;
  final double borderRadius;
  final double borderWidth;
  final bool isElevated;

  const TactileCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.borderColor,
    this.lipColor,
    this.borderRadius = 16.0,
    this.borderWidth = 1.5,
    this.isElevated = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final rawBg = backgroundColor ?? colorScheme.surface;
    final baseBg = rawBg.a < 1.0
        ? Color.alphaBlend(rawBg, colorScheme.surface)
        : rawBg;

    final rawBorder = borderColor ?? colorScheme.outlineVariant;
    final baseBorder = rawBorder.a < 1.0
        ? Color.alphaBlend(rawBorder, colorScheme.surface)
        : rawBorder;

    final rawLip = lipColor ?? baseBorder;
    final baseLip = rawLip.a < 1.0
        ? Color.alphaBlend(rawLip, colorScheme.surface)
        : rawLip;

    return Container(
      decoration: BoxDecoration(
        color: baseBg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: baseBorder, width: borderWidth),
        boxShadow: isElevated
            ? [
                BoxShadow(
                  color: baseLip,
                  offset: const Offset(0, 3),
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      child: Material(
        color: colorScheme.surface.withAlpha(0),
        borderRadius: BorderRadius.circular(borderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
