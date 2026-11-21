import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Sayfaların üst kısmında isteğe bağlı renkli ikon rozetiyle beraber yer alan başlık bloğu (`TASK-153`).
class PageHeader extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final Color? color;
  final bool isCompact;

  const PageHeader({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    this.color,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = color ?? colorScheme.primary;
    final titleStyle =
        (isCompact
                ? theme.textTheme.titleLarge
                : theme.textTheme.headlineMedium)
            ?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accent.withAlpha(24),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: accent.withAlpha(70), width: 1.5),
            ),
            child: PhosphorIcon(icon!, size: 22, color: accent),
          ),
          const SizedBox(width: 14),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
