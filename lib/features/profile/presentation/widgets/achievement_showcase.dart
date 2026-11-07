import 'package:flutter/material.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/profile/data/models/achievement_badge.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Memur adayının kazandığı ve hedeflediği KPSS motivasyon madalyalarını
/// 3x2 grid düzeninde sergileyen vitrin bileşeni.
///
/// Web/Angular Karşılığı: `AchievementsGridComponent`.
class AchievementShowcase extends StatelessWidget {
  final StudyStatsState stats;

  const AchievementShowcase({super.key, required this.stats});

  void _showBadgeDetail(BuildContext context, AchievementBadge badge) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            AppSpacing.gapMd,
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: badge.isUnlocked
                    ? colorScheme.primaryContainer
                    : colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
                border: Border.all(
                  color: badge.isUnlocked
                      ? colorScheme.primary
                      : colorScheme.outline,
                  width: 2,
                ),
              ),
              child: PhosphorIcon(
                badge.icon,
                size: 32,
                color: badge.isUnlocked
                    ? colorScheme.primary
                    : colorScheme.outline,
              ),
            ),
            AppSpacing.gapSm,
            Text(
              badge.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              badge.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            AppSpacing.gapMd,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: badge.isUnlocked
                    ? colorScheme.secondaryContainer
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge.isUnlocked
                    ? '✅ Madalya Açıldı'
                    : '🔒 Kilitli · Hedef: ${badge.progressText}',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: badge.isUnlocked
                      ? colorScheme.onSecondaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final badges = AchievementBadge.calculateBadges(stats);
    final unlockedCount = badges.where((b) => b.isUnlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle('Başarı Madalyaları ($unlockedCount/${badges.length})'),
        AppSpacing.gapXs,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: badges.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            final badge = badges[index];
            return _BadgeTile(
              badge: badge,
              onTap: () => _showBadgeDetail(context, badge),
            );
          },
        ),
      ],
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final AchievementBadge badge;
  final VoidCallback onTap;

  const _BadgeTile({required this.badge, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      onTap: onTap,
      padding: const EdgeInsets.all(8),
      backgroundColor: badge.isUnlocked
          ? colorScheme.surface
          : colorScheme.surfaceContainerHighest.withAlpha(80),
      borderColor: badge.isUnlocked
          ? colorScheme.primary.withAlpha(90)
          : colorScheme.outlineVariant.withAlpha(60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: badge.isUnlocked
                      ? colorScheme.primaryContainer.withAlpha(120)
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: PhosphorIcon(
                  badge.icon,
                  size: 20,
                  color: badge.isUnlocked
                      ? colorScheme.primary
                      : colorScheme.outline.withAlpha(140),
                ),
              ),
              if (!badge.isUnlocked)
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: PhosphorIcon(
                      PhosphorIconsBold.lock,
                      size: 11,
                      color: colorScheme.outline,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            badge.title,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 11,
              color: badge.isUnlocked
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant.withAlpha(150),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            badge.progressText,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 9,
              color: badge.isUnlocked
                  ? colorScheme.secondary
                  : colorScheme.outline,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
