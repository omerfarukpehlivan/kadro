import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Gamified üst başlık barı (Material Design: Top App Bar).
///
/// Sol tarafta Kadro Koçu avatarı ve ekran başlığını,
/// sağ tarafta canlı soru hedefi/seri rozetini ve PRO abonelik durumunu gösterir.
///
/// TASK-69 kapsamında dar ekranlarda (<380px) ve uzun başlıklarda (örn: 'Çalışma Türleri')
/// taşmaları önlemek için Flexible + ellipsis ve dinamik boyutlandırma eklenmiştir.
class AppTopBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const AppTopBar({super.key, this.title = 'Kadro'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = MediaQuery.sizeOf(context).width < 380;

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
          // Kavisli kare Kadro Koçu avatarı (altın çerçeveli, hata durumunda fallback ikon)
          Container(
            width: isCompact ? 32 : 36,
            height: isCompact ? 32 : 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.tertiary, width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/mascot/tugrul_coach.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: colorScheme.primaryContainer,
                  child: PhosphorIcon(
                    PhosphorIconsDuotone.graduationCap,
                    size: isCompact ? 16 : 18,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: isCompact ? 8 : 10),
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: isCompact ? 17 : null,
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Günlük Hedef / Seri rozeti
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 8 : 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.fire,
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
        SizedBox(width: isCompact ? 6 : 8),
        // PRO rozet butonu (PaywallScreen açar)
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            margin: EdgeInsets.only(right: isCompact ? 8 : 12),
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 8 : 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: prefs.isPro
                  ? colorScheme.tertiary
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PhosphorIcon(
                  PhosphorIconsFill.crown,
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
