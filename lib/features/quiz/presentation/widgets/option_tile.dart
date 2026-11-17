import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Test ekranındaki şıkların durumunu temsil eden enum.
///
/// Angular'daki `type OptionStatus = 'normal' | 'selected' | 'correct' | 'wrong'`
/// türünün Dart karşılığıdır.
enum OptionStatus { normal, selected, correct, wrong }

/// Sade, kâğıt/kitapçık estetiğinde etkileşimli soru şıkkı bileşeni.
///
/// Masaüstü ve Web'de (`TASK-147`, `TASK-149`): fare hover vurgusu, klavye
/// kısayol rozeti (`[A]..[E]`) ve çeldirici şıkkın üstünü çizme (`isEliminated`)
/// desteğini taşır.
class OptionTile extends StatefulWidget {
  final String label;
  final String text;
  final OptionStatus status;
  final VoidCallback? onTap;
  final bool highContrast;
  final bool isEliminated;
  final VoidCallback? onToggleEliminate;
  final String? shortcutHint;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    this.status = OptionStatus.normal,
    this.onTap,
    this.highContrast = false,
    this.isEliminated = false,
    this.onToggleEliminate,
    this.shortcutHint,
  });

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    final interactive = widget.onTap != null;

    final Color borderColor;
    final Color backgroundColor;
    final Color badgeBg;
    final Color badgeFg;
    final FontWeight textWeight;
    Widget? trailingIcon;

    switch (widget.status) {
      case OptionStatus.normal:
        borderColor = widget.highContrast
            ? colorScheme.outline
            : colorScheme.outlineVariant;
        backgroundColor = widget.isEliminated
            ? colorScheme.surfaceContainerLow
            : colorScheme.surface;
        badgeBg = colorScheme.surfaceContainerLow;
        badgeFg = colorScheme.onSurfaceVariant;
        textWeight = FontWeight.w400;
        trailingIcon = null;
      case OptionStatus.selected:
        borderColor = colorScheme.primary;
        backgroundColor = Color.alphaBlend(
          colorScheme.primaryContainer.withAlpha(150),
          colorScheme.surface,
        );
        badgeBg = colorScheme.primary;
        badgeFg = colorScheme.onPrimary;
        textWeight = FontWeight.w600;
        trailingIcon = null;
      case OptionStatus.correct:
        borderColor = colorScheme.secondary;
        backgroundColor = Color.alphaBlend(
          colorScheme.secondaryContainer.withAlpha(170),
          colorScheme.surface,
        );
        badgeBg = colorScheme.secondary;
        badgeFg = colorScheme.onSecondary;
        textWeight = FontWeight.w600;
        trailingIcon = PhosphorIcon(
          PhosphorIconsFill.checkCircle,
          color: colorScheme.secondary,
          size: 20,
        );
      case OptionStatus.wrong:
        borderColor = colorScheme.error;
        backgroundColor = Color.alphaBlend(
          colorScheme.errorContainer.withAlpha(170),
          colorScheme.surface,
        );
        badgeBg = colorScheme.error;
        badgeFg = colorScheme.onError;
        textWeight = FontWeight.w600;
        trailingIcon = PhosphorIcon(
          PhosphorIconsFill.xCircle,
          color: colorScheme.error,
          size: 20,
        );
    }

    final effectiveBorder = (interactive && _isFocused)
        ? (widget.status == OptionStatus.selected
              ? colorScheme.onSurface
              : colorScheme.primary)
        : (interactive && widget.status == OptionStatus.normal && _isHovered)
        ? colorScheme.primary
        : borderColor;

    final effectiveBg =
        (interactive && widget.status == OptionStatus.normal && _isHovered)
        ? Color.alphaBlend(colorScheme.primary.withAlpha(10), backgroundColor)
        : backgroundColor;

    final statusSummary = switch (widget.status) {
      OptionStatus.selected => 'Seçili şık',
      OptionStatus.correct => 'Doğru cevap',
      OptionStatus.wrong => 'Yanlış cevap',
      OptionStatus.normal =>
        widget.isEliminated ? 'Üstü çizili şık' : 'Seçenek',
    };

    final canShowEliminate =
        widget.onToggleEliminate != null &&
        (widget.status == OptionStatus.normal ||
            widget.status == OptionStatus.selected);

    final tileBody = Padding(
      padding: EdgeInsets.only(bottom: isDesktop ? 7 : 10),
      child: AnimatedContainer(
        duration: disableAnimations
            ? Duration.zero
            : const Duration(milliseconds: 120),
        decoration: BoxDecoration(
          color: effectiveBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: effectiveBorder,
            width: (interactive && _isFocused)
                ? 2.2
                : widget.highContrast
                ? 2.0
                : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.status == OptionStatus.normal && !_isHovered
                  ? colorScheme.outlineVariant
                  : effectiveBorder,
              offset: const Offset(0, 3),
              blurRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: colorScheme.surface.withAlpha(0),
          child: InkWell(
            onTap: widget.onTap,
            onSecondaryTap: widget.onToggleEliminate,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 10 : 14,
                vertical: isDesktop ? 8 : (isCompact ? 10 : 12),
              ),
              child: Row(
                children: [
                  ExcludeSemantics(
                    child: Container(
                      width: isDesktop ? 28 : 30,
                      height: isDesktop ? 28 : 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: badgeBg,
                        borderRadius: BorderRadius.circular(9),
                        border: widget.status == OptionStatus.normal
                            ? Border.all(
                                color: colorScheme.outlineVariant,
                                width: 1.5,
                              )
                            : null,
                      ),
                      child: Text(
                        widget.label,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: badgeFg,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.text,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: widget.isEliminated
                            ? colorScheme.onSurfaceVariant.withAlpha(185)
                            : colorScheme.onSurface,
                        fontWeight: textWeight,
                        decoration: widget.isEliminated
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                  if (canShowEliminate) ...[
                    const SizedBox(width: 4),
                    Tooltip(
                      message: widget.isEliminated
                          ? '${widget.label} şıkkının elemesini kaldır'
                          : '${widget.label} şıkkını ele (üstü çiz)',
                      child: IconButton(
                        key: ValueKey('option_eliminate_${widget.label}'),
                        onPressed: widget.onToggleEliminate,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        style: isDesktop
                            ? IconButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size(28, 28),
                                padding: EdgeInsets.zero,
                              )
                            : null,
                        constraints: BoxConstraints(
                          minWidth: isDesktop ? 28 : 36,
                          minHeight: isDesktop ? 28 : 36,
                        ),
                        icon: PhosphorIcon(
                          widget.isEliminated
                              ? PhosphorIconsFill.eyeSlash
                              : PhosphorIconsRegular.eyeSlash,
                          size: 16,
                          color: widget.isEliminated
                              ? colorScheme.error
                              : colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                  if (trailingIcon != null) ...[
                    const SizedBox(width: 8),
                    ExcludeSemantics(child: trailingIcon),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );

    final semanticTile = Semantics(
      button: interactive,
      selected: widget.status == OptionStatus.selected,
      label: '${widget.label} şıkkı ($statusSummary): ${widget.text}',
      child: tileBody,
    );

    if (!interactive) return semanticTile;

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
      child: semanticTile,
    );
  }
}
