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
/// Dokunmatik telefon ve tablette çeldirici şıkkın üstünü çizme (`isEliminated`)
/// desteğini taşır.
class OptionTile extends StatelessWidget {
  final String label;
  final String text;
  final OptionStatus status;
  final VoidCallback? onTap;
  final bool highContrast;
  final bool isEliminated;
  final VoidCallback? onToggleEliminate;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    this.status = OptionStatus.normal,
    this.onTap,
    this.highContrast = false,
    this.isEliminated = false,
    this.onToggleEliminate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final interactive = onTap != null;

    final Color borderColor;
    final Color backgroundColor;
    final Color badgeBg;
    final Color badgeFg;
    final FontWeight textWeight;
    Widget? trailingIcon;

    switch (status) {
      case OptionStatus.normal:
        borderColor = highContrast
            ? colorScheme.outline
            : colorScheme.outlineVariant;
        backgroundColor = isEliminated
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

    final statusSummary = switch (status) {
      OptionStatus.selected => 'Seçili şık',
      OptionStatus.correct => 'Doğru cevap',
      OptionStatus.wrong => 'Yanlış cevap',
      OptionStatus.normal => isEliminated ? 'Üstü çizili şık' : 'Seçenek',
    };

    final canShowEliminate =
        onToggleEliminate != null &&
        (status == OptionStatus.normal || status == OptionStatus.selected);

    final tileBody = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: borderColor,
            width: highContrast ? 2.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: status == OptionStatus.normal
                  ? colorScheme.outlineVariant
                  : borderColor,
              offset: const Offset(0, 3),
              blurRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: colorScheme.surface.withAlpha(0),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 10 : 14,
                vertical: isCompact ? 10 : 12,
              ),
              child: Row(
                children: [
                  ExcludeSemantics(
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: badgeBg,
                        borderRadius: BorderRadius.circular(9),
                        border: status == OptionStatus.normal
                            ? Border.all(
                                color: colorScheme.outlineVariant,
                                width: 1.5,
                              )
                            : null,
                      ),
                      child: Text(
                        label,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: badgeFg,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      text,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isEliminated
                            ? colorScheme.onSurfaceVariant.withAlpha(185)
                            : colorScheme.onSurface,
                        fontWeight: textWeight,
                        decoration: isEliminated
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                  if (canShowEliminate) ...[
                    const SizedBox(width: 4),
                    Tooltip(
                      message: isEliminated
                          ? '$label şıkkının elemesini kaldır'
                          : '$label şıkkını ele (üstü çiz)',
                      child: IconButton(
                        key: ValueKey('option_eliminate_$label'),
                        onPressed: onToggleEliminate,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        icon: PhosphorIcon(
                          isEliminated
                              ? PhosphorIconsFill.eyeSlash
                              : PhosphorIconsRegular.eyeSlash,
                          size: 16,
                          color: isEliminated
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

    return Semantics(
      button: interactive,
      selected: status == OptionStatus.selected,
      label: '$label şıkkı ($statusSummary): $text',
      child: tileBody,
    );
  }
}
