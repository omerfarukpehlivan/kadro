import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Gamified üst başlık barı (Material Design: Top App Bar).
///
/// Sol tarafta Koç Tuğrul avatarı ve ekran başlığını,
/// sağ tarafta canlı soru hedefi/seri rozetini ve PRO abonelik durumunu gösterir.
class AppTopBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const AppTopBar({super.key, this.title = 'Kadro'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final stats = ref.watch(studyStatsProvider);
    final prefs = ref.watch(userPreferencesProvider);

    return AppBar(
      centerTitle: false,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      scrolledUnderElevation: 0.5,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Küçük yuvarlak Koç Tuğrul avatarı (hata durumunda fallback ikon)
          ClipOval(
            child: Image.asset(
              'assets/images/mascot/tugrul_coach.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.graduationCap,
                  size: 18,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
      actions: [
        // Günlük Hedef / Seri rozeti
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.flame,
                size: 16,
                color: colorScheme.onTertiaryContainer,
              ),
              const SizedBox(width: 4),
              Text(
                '${stats.totalSolved}/${stats.dailyGoal}',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // PRO rozet butonu (PaywallScreen açar)
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: prefs.isPro
                  ? colorScheme.tertiary
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  LucideIcons.crown,
                  size: 15,
                  color: prefs.isPro
                      ? colorScheme.onTertiary
                      : colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 4),
                Text(
                  'PRO',
                  style: textTheme.labelSmall?.copyWith(
                    color: prefs.isPro
                        ? colorScheme.onTertiary
                        : colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
