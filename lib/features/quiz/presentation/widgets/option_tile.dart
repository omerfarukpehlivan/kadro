import 'package:flutter/material.dart';

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

    // Renkleri ve sağdaki durum ikonunu status değerine göre belirliyoruz
    final Color borderColor;
    final Color backgroundColor;
    Widget? trailingIcon;

    switch (status) {
      case OptionStatus.normal:
        borderColor = colorScheme.outlineVariant;
        backgroundColor = colorScheme.surface;
        trailingIcon = null;
      case OptionStatus.selected:
        borderColor = colorScheme.primary;
        backgroundColor = colorScheme.primaryContainer.withAlpha(70);
        trailingIcon = null;
      case OptionStatus.correct:
        borderColor = colorScheme.tertiary;
        backgroundColor = colorScheme.tertiaryContainer.withAlpha(120);
        trailingIcon = Icon(Icons.check_circle, color: colorScheme.tertiary);
      case OptionStatus.wrong:
        borderColor = colorScheme.error;
        backgroundColor = colorScheme.errorContainer.withAlpha(120);
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
        onTap: onTap,
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: status == OptionStatus.selected
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: status == OptionStatus.selected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        title: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        trailing: trailingIcon,
      ),
    );
  }
}
