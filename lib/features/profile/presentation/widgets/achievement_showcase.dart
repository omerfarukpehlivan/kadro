import 'package:flutter/material.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/profile/data/models/achievement_badge.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Memur adayının kazandığı ve hedeflediği KPSS başarı madalyalarını
/// 3x2 grid düzeninde sergileyen vitrin bileşeni.
class AchievementShowcase extends StatelessWidget {
  final StudyStatsState stats;

  const AchievementShowcase({super.key, required this.stats});

  void _showBadgeDetail(BuildContext context, AchievementBadge badge) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    AdaptiveOverlay.showModal<void>(
      context: context,
      title: 'Başarı Madalyası',
      dialogMaxWidth: 420,
      showMobileHeader: true,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              badge.icon,
              size: 36,
              color: badge.isUnlocked
                  ? colorScheme.primary
                  : colorScheme.outline,
            ),
            AppSpacing.gapSm,
            Text(badge.title, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              badge.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            AppSpacing.gapMd,
            KadroBadge(
              label: badge.isUnlocked
                  ? 'Madalya Açıldı'
                  : 'Kilitli · Hedef: ${badge.progressText}',
              tone: badge.isUnlocked
                  ? KadroBadgeTone.secondary
                  : KadroBadgeTone.neutral,
              borderColor: badge.isUnlocked
                  ? colorScheme.secondary.withAlpha(120)
                  : colorScheme.outlineVariant,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              borderRadius: 6,
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
      padding: const EdgeInsets.all(10),
      backgroundColor: badge.isUnlocked
          ? colorScheme.surface
          : colorScheme.surfaceContainerLow,
      borderColor: badge.isUnlocked
          ? colorScheme.primary.withAlpha(110)
          : colorScheme.outlineVariant,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              PhosphorIcon(
                badge.icon,
                size: 24,
                color: badge.isUnlocked
                    ? colorScheme.primary
                    : colorScheme.outline,
              ),
              if (!badge.isUnlocked)
                Positioned(
                  right: -6,
                  bottom: -4,
                  child: PhosphorIcon(
                    PhosphorIconsBold.lock,
                    size: 11,
                    color: colorScheme.outline,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            badge.title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: badge.isUnlocked
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            badge.progressText,
            style: theme.textTheme.labelSmall?.copyWith(
              color: badge.isUnlocked
                  ? colorScheme.secondary
                  : colorScheme.outline,
              fontWeight: FontWeight.w400,
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
