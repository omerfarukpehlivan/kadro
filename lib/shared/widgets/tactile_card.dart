import 'package:flutter/material.dart';

/// Fiziksel basılabilirlik ve net alt derinlik ("tactile lip") sunan kart bileşeni.
///
/// Masaüstü ve Web tarayıcılarda (`onTap != null`) fare imleci değişimi (`click`),
/// layout kaydırmayan hover renk tepkisi ve WCAG klavye odak halkası sağlar (`TASK-147`).
///
/// Web/CSS karşılığı:
/// ```css
/// .tactile-card {
///   background: var(--surface);
///   border: 1.5px solid var(--border);
///   border-radius: 16px;
///   box-shadow: 0 3px 0 0 var(--lip);
/// }
/// ```
/// Yarı saydam arka plan renkleri geçirildiğinde kartı opak `surface` rengiyle harmanlar (`Color.alphaBlend`).
class TactileCard extends StatefulWidget {
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
  State<TactileCard> createState() => _TactileCardState();
}

class _TactileCardState extends State<TactileCard> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final interactive = widget.onTap != null;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);

    final rawBg = widget.backgroundColor ?? colorScheme.surface;
    final baseBg = rawBg.a < 1.0
        ? Color.alphaBlend(rawBg, colorScheme.surface)
        : rawBg;

    final rawBorder = widget.borderColor ?? colorScheme.outlineVariant;
    final baseBorder = rawBorder.a < 1.0
        ? Color.alphaBlend(rawBorder, colorScheme.surface)
        : rawBorder;

    final rawLip = widget.lipColor ?? baseBorder;
    final baseLip = rawLip.a < 1.0
        ? Color.alphaBlend(rawLip, colorScheme.surface)
        : rawLip;

    final effectiveBg = (interactive && (_isHovered || _isFocused))
        ? Color.alphaBlend(colorScheme.primary.withAlpha(10), baseBg)
        : baseBg;

    final effectiveBorder = (interactive && _isFocused)
        ? colorScheme.primary
        : (interactive && _isHovered)
        ? Color.alphaBlend(colorScheme.primary.withAlpha(130), baseBorder)
        : baseBorder;

    final effectiveLip = (interactive && (_isHovered || _isFocused))
        ? Color.alphaBlend(colorScheme.primary.withAlpha(140), baseLip)
        : baseLip;

    final effectiveBorderWidth = (interactive && _isFocused)
        ? widget.borderWidth + 0.5
        : widget.borderWidth;

    final card = AnimatedContainer(
      duration: disableAnimations
          ? Duration.zero
          : const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: effectiveBorder, width: effectiveBorderWidth),
        boxShadow: widget.isElevated
            ? [
                BoxShadow(
                  color: effectiveLip,
                  offset: const Offset(0, 3),
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      child: Material(
        color: colorScheme.surface.withAlpha(0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: widget.onTap,
          focusColor: colorScheme.primary.withAlpha(18),
          hoverColor: colorScheme.primary.withAlpha(8),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Padding(padding: widget.padding, child: widget.child),
        ),
      ),
    );

    if (!interactive) return card;

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (hovered) {
        if (_isHovered != hovered) {
          setState(() => _isHovered = hovered);
        }
      },
      onShowFocusHighlight: (focused) {
        if (_isFocused != focused) {
          setState(() => _isFocused = focused);
        }
      },
      child: card,
    );
  }
}
