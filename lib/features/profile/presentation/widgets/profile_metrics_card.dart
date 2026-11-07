import 'package:flutter/material.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Memur adayının 4 temel performans metriğini (Seri, Soru, İsabet %, XP)
/// ve Lig / Unvan durumunu özetleyen Duolingo tarzı dashboard bileşeni.
///
/// Web/Angular Karşılığı: `CandidateStatsSnapshotComponent`.
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
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Üst Satır: 4'lü Performans Grid'i
          Row(
            children: [
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsFill.fire,
                  iconColor: colorScheme.error,
                  value: '${stats.streakDays} Gün',
                  label: 'Çalışma Serisi',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsFill.checkCircle,
                  iconColor: colorScheme.primary,
                  value: '${stats.totalSolved}',
                  label: 'Çözülen Soru',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsBold.target,
                  iconColor: colorScheme.tertiary,
                  value: stats.totalSolved == 0
                      ? '–'
                      : '%${stats.accuracyPercent}',
                  label: 'Doğru Oranı',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  icon: PhosphorIconsFill.lightning,
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

          // 2. Alt Satır: Lig & Unvan Kademesi İlerleme Çubuğu
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PhosphorIcon(
                  PhosphorIconsDuotone.shieldCheck,
                  size: 20,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
              AppSpacing.gapHorizontalSm,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${stats.leagueTier} Kadro Ligi',
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 6,
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
        PhosphorIcon(icon, color: iconColor, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
