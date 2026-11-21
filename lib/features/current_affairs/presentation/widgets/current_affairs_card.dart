import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/features/current_affairs/data/models/current_affairs_bulletin.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Tek bir aylık güncel bilgiler maddesini kategori etiketi, ÖSYM soru potansiyeli
/// ve okundu/kaydet eylemleriyle sergileyen taktil kart (`TASK-160`).
///
/// Angular/Web karşılığı: `@Input() item` alan `BulletinItemCardComponent`.
class CurrentAffairsCard extends StatelessWidget {
  final CurrentAffairsItem item;
  final bool isRead;
  final bool isBookmarked;
  final VoidCallback onToggleRead;
  final VoidCallback onToggleBookmark;

  const CurrentAffairsCard({
    super.key,
    required this.item,
    required this.isRead,
    required this.isBookmarked,
    required this.onToggleRead,
    required this.onToggleBookmark,
  });

  Color _accentFor(CurrentAffairsCategory category, ColorScheme colorScheme) {
    switch (category) {
      case CurrentAffairsCategory.kulturSanat:
        return colorScheme.tertiary;
      case CurrentAffairsCategory.bilimTeknoloji:
        return colorScheme.primary;
      case CurrentAffairsCategory.spor:
        return colorScheme.secondary;
      case CurrentAffairsCategory.ekonomiKurumlar:
        return colorScheme.primary;
      case CurrentAffairsCategory.cevreDunya:
        return colorScheme.secondary;
    }
  }

  IconData _iconFor(CurrentAffairsCategory category) {
    switch (category) {
      case CurrentAffairsCategory.kulturSanat:
        return PhosphorIconsFill.palette;
      case CurrentAffairsCategory.bilimTeknoloji:
        return PhosphorIconsFill.rocketLaunch;
      case CurrentAffairsCategory.spor:
        return PhosphorIconsFill.trophy;
      case CurrentAffairsCategory.ekonomiKurumlar:
        return PhosphorIconsFill.buildings;
      case CurrentAffairsCategory.cevreDunya:
        return PhosphorIconsFill.globeHemisphereEast;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final accent = _accentFor(item.category, colorScheme);

    return TactileCard(
      padding: const EdgeInsets.all(16),
      backgroundColor: isRead
          ? Color.alphaBlend(
              colorScheme.secondary.withAlpha(14),
              colorScheme.surface,
            )
          : colorScheme.surface,
      borderColor: isRead
          ? colorScheme.secondary.withAlpha(110)
          : accent.withAlpha(105),
      lipColor: isRead
          ? colorScheme.secondary.withAlpha(120)
          : accent.withAlpha(120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              KadroBadge(
                label: item.category.label,
                icon: _iconFor(item.category),
                backgroundColor: accent.withAlpha(24),
                foregroundColor: accent,
                borderColor: accent.withAlpha(90),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.isVerifiedOfficial) ...[
                    PhosphorIcon(
                      PhosphorIconsFill.sealCheck,
                      size: 14,
                      color: colorScheme.secondary,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Flexible(
                    child: Text(
                      item.publishedLabel,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.summary,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          if (item.osymTip.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.alphaBlend(
                  colorScheme.tertiary.withAlpha(24),
                  colorScheme.surfaceContainerLowest,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.tertiary.withAlpha(95)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: PhosphorIcon(
                      PhosphorIconsFill.lightbulb,
                      size: 16,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ÖSYM Soru İpucu',
                          style: textTheme.labelMedium?.copyWith(
                            color: colorScheme.tertiary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item.osymTip,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (item.linkedTags.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final tag in item.linkedTags)
                  KadroBadge(
                    label: '#$tag',
                    backgroundColor: colorScheme.surfaceContainerLow,
                    foregroundColor: colorScheme.onSurfaceVariant,
                  ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              isRead
                  ? FilledButton.tonalIcon(
                      key: ValueKey('current_affairs_read_${item.id}'),
                      onPressed: onToggleRead,
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.secondaryContainer,
                        foregroundColor: colorScheme.onSecondaryContainer,
                      ),
                      icon: const PhosphorIcon(
                        PhosphorIconsFill.checkCircle,
                        size: 16,
                      ),
                      label: const Text('Okundu'),
                    )
                  : OutlinedButton.icon(
                      key: ValueKey('current_affairs_read_${item.id}'),
                      onPressed: onToggleRead,
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.checkCircle,
                        size: 16,
                      ),
                      label: const Text('Okundu İşaretle'),
                    ),
              OutlinedButton.icon(
                key: ValueKey('current_affairs_bookmark_${item.id}'),
                onPressed: onToggleBookmark,
                style: isBookmarked
                    ? OutlinedButton.styleFrom(
                        backgroundColor: colorScheme.primaryContainer.withAlpha(
                          110,
                        ),
                        foregroundColor: colorScheme.primary,
                        side: BorderSide(color: colorScheme.primary),
                      )
                    : null,
                icon: PhosphorIcon(
                  isBookmarked
                      ? PhosphorIconsFill.bookmarkSimple
                      : PhosphorIconsRegular.bookmarkSimple,
                  size: 16,
                ),
                label: Text(isBookmarked ? 'Kaydedildi' : 'Kaydet'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
