import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Sayfaların üst kısmında renkli ikon rozetiyle beraber yer alan başlık bloğu.
class PageHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? color;

  const PageHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = color ?? colorScheme.primary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: accent.withAlpha(24),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: accent.withAlpha(70), width: 1.5),
          ),
          child: PhosphorIcon(icon, size: 22, color: accent),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
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
