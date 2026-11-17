import 'package:flutter/material.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Memur adayının 4 temel performans metriğini (Seri, Soru, İsabet %, XP)
/// ve lig ilerleme durumunu özetleyen bileşen.
class ProfileMetricsCard extends StatelessWidget {
  final StudyStatsState stats;

  const ProfileMetricsCard({super.key, required this.stats});

  double _calculateLeagueProgress(int xp) {
    if (xp >= 1000) return 1.0;
    if (xp >= 500) return ((xp - 500) / 500).clamp(0.0, 1.0);
    if (xp >= 200) return ((xp - 200) / 300).clamp(0.0, 1.0);
    return (xp / 200).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final progress = _calculateLeagueProgress(stats.totalXp);

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsRegular.fire,
                  iconColor: colorScheme.tertiary,
                  value: '${stats.streakDays} Gün',
                  label: 'Çalışma Serisi',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsRegular.checkCircle,
                  iconColor: colorScheme.primary,
                  value: '${stats.totalSolved}',
                  label: 'Çözülen Soru',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsRegular.target,
                  iconColor: colorScheme.secondary,
                  value: stats.totalSolved == 0
                      ? '–'
                      : '%${stats.accuracyPercent}',
                  label: 'Doğru Oranı',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsRegular.lightning,
                  iconColor: colorScheme.tertiary,
                  value: '${stats.totalXp}',
                  label: 'Toplam XP',
                ),
              ),
            ],
          ),
          AppSpacing.gapSm,
          const Divider(height: 1),
          AppSpacing.gapSm,

          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.shieldCheck,
                size: 20,
                color: colorScheme.secondary,
              ),
              AppSpacing.gapHorizontalSm,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${stats.leagueTier} Kadro Ligi',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.labelLarge?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _MetricItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: iconColor.withAlpha(24),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: PhosphorIcon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
