import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';

/// Test ekranındaki şıkların durumunu temsil eden enum.
///
/// Angular'daki `type OptionStatus = 'normal' | 'selected' | 'correct' | 'wrong'`
/// türünün Dart karşılığıdır.
enum OptionStatus { normal, selected, correct, wrong }

/// Sade ve etkileşimli soru şıkkı bileşeni.
class OptionTile extends StatelessWidget {
  final String label;
  final String text;
  final OptionStatus status;
  final VoidCallback? onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    this.status = OptionStatus.normal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);

    // Renkleri ve sağdaki durum ikonunu status değerine göre belirliyoruz
    final Color borderColor;
    final Color backgroundColor;
    final Color avatarBg;
    final Color avatarFg;
    final FontWeight textWeight;
    Widget? trailingIcon;

    switch (status) {
      case OptionStatus.normal:
        borderColor = colorScheme.outlineVariant;
        backgroundColor = colorScheme.surface;
        avatarBg = colorScheme.surfaceContainerHighest;
        avatarFg = colorScheme.onSurfaceVariant;
        textWeight = FontWeight.normal;
        trailingIcon = null;
      case OptionStatus.selected:
        borderColor = colorScheme.primary;
        backgroundColor = Color.alphaBlend(
          colorScheme.primaryContainer.withAlpha(140),
          colorScheme.surface,
        );
        avatarBg = colorScheme.primary;
        avatarFg = colorScheme.onPrimary;
        textWeight = FontWeight.w700;
        trailingIcon = null;
      case OptionStatus.correct:
        borderColor = colorScheme.secondary;
        backgroundColor = Color.alphaBlend(
          colorScheme.secondaryContainer.withAlpha(160),
          colorScheme.surface,
        );
        avatarBg = colorScheme.secondary;
        avatarFg = colorScheme.onSecondary;
        textWeight = FontWeight.w700;
        trailingIcon = Icon(Icons.check_circle, color: colorScheme.secondary);
      case OptionStatus.wrong:
        borderColor = colorScheme.error;
        backgroundColor = Color.alphaBlend(
          colorScheme.errorContainer.withAlpha(160),
          colorScheme.surface,
        );
        avatarBg = colorScheme.error;
        avatarFg = colorScheme.onError;
        textWeight = FontWeight.w700;
        trailingIcon = Icon(Icons.cancel, color: colorScheme.error);
    }

    return Card(
      elevation: 0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: borderColor,
          width: status == OptionStatus.normal ? 1 : 2,
        ),
      ),
      child: ListTile(
        visualDensity: isCompact
            ? VisualDensity.compact
            : VisualDensity.standard,
        contentPadding: EdgeInsets.symmetric(
          horizontal: isCompact ? 10 : 16,
          vertical: isCompact ? 0 : 2,
        ),
        onTap: onTap,
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: avatarBg,
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: avatarFg,
            ),
          ),
        ),
        title: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: textWeight,
          ),
        ),
        trailing: trailingIcon,
      ),
    );
  }
}
