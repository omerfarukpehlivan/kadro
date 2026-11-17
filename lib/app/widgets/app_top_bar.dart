import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Uygulamanın marka imzalı üst başlık çubuğu.
///
/// Solda dairesel Tuğrul karakter amblemi ve `Outfit` başlık,
/// sağda günlük çözülen soru sayacı ve altın/kobalt PRO rozeti yer alır.
class AppTopBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const AppTopBar({super.key, this.title = 'Kadro'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = MediaQuery.sizeOf(context).width < 380;
    final hPadding = ResponsiveBreakpoints.horizontalPadding(context);

    final stats = ref.watch(studyStatsProvider);
    final prefs = ref.watch(userPreferencesProvider);
    final goal = stats.dailyGoal > 0 ? stats.dailyGoal : 30;

    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: hPadding,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface.withAlpha(0),
      scrolledUnderElevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.5),
        child: Container(height: 1.5, color: colorScheme.outlineVariant),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TugrulAvatar(
            mood: TugrulMood.coach,
            size: isCompact ? 32 : 36,
            ringWidth: 2,
            hasShadow: false,
            tooltip: 'Tuğrul Çalışma İpuçları',
            onTap: () => TugrulTipsSheet.show(context, mood: TugrulMood.coach),
          ),
          SizedBox(width: isCompact ? 8 : 10),
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  (isCompact ? textTheme.titleLarge : textTheme.headlineSmall)
                      ?.copyWith(color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
      actions: [
        // Günlük hedef sayacı (günlük çözülen soru / hedef, tabular rakamlar)
        Tooltip(
          message: 'Bugünkü soru hedefin (${stats.dailySolvedCount}/$goal)',
          child: Semantics(
            label: 'Bugünkü soru hedefi ${stats.dailySolvedCount} bölü $goal',
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 8 : 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colorScheme.secondary.withAlpha(110),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.secondary.withAlpha(55),
                    offset: const Offset(0, 2),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhosphorIcon(
                    PhosphorIconsFill.checkCircle,
                    size: 14,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${stats.dailySolvedCount}/$goal',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w700,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: isCompact ? 6 : 8),
        // PRO butonu (PaywallScreen açar)
        Padding(
          padding: EdgeInsets.only(right: hPadding),
          child: Semantics(
            button: true,
            label: prefs.isPro ? 'Kadro PRO Üyeliği Aktif' : "Kadro PRO'ya Geç",
            child: Tooltip(
              message: prefs.isPro ? 'Kadro PRO Aktif' : "Kadro PRO'ya Geç",
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const PaywallScreen()),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isCompact ? 8 : 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: prefs.isPro
                          ? colorScheme.tertiaryContainer
                          : colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: prefs.isPro
                            ? colorScheme.tertiary
                            : colorScheme.tertiary.withAlpha(140),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.tertiary.withAlpha(65),
                          offset: const Offset(0, 2),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsFill.crown,
                          size: 13,
                          color: colorScheme.tertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'PRO',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: prefs.isPro
                                ? colorScheme.onTertiaryContainer
                                : colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1.5);
}
