import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Masaüstü & Web SaaS düzeni için üst çalışma şeridi (`TASK-146`).
///
/// Solda aktif ekran başlığı ve sınav kapsamı, ortada `Ctrl+K` komut paleti
/// tetikleyicisi, sağda günlük soru sayacı, tema anahtarı ve Tuğrul koçu yer alır.
class DesktopTopUtilityBar extends ConsumerWidget {
  final String title;
  final VoidCallback onOpenCommandPalette;

  const DesktopTopUtilityBar({
    super.key,
    required this.title,
    required this.onOpenCommandPalette,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final prefs = ref.watch(userPreferencesProvider);
    final stats = ref.watch(studyStatsProvider);
    final goal = stats.dailyGoal > 0 ? stats.dailyGoal : 30;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        ),
      ),
      child: Row(
        children: [
          // Sol: Bölüm Başlığı
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Text(
                    prefs.examSelection.family.shortLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Orta: Hızlı Ara & Git (Ctrl+K) Kapsülü
          Expanded(
            flex: 4,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Semantics(
                  button: true,
                  label: 'Ders, konu veya komut ara, kısayol Control K',
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      key: const ValueKey('desktop_command_palette_trigger'),
                      onTap: onOpenCommandPalette,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorScheme.outlineVariant,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            PhosphorIcon(
                              PhosphorIconsRegular.magnifyingGlass,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Ders, konu veya komut ara...',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: colorScheme.outlineVariant,
                                ),
                              ),
                              child: Text(
                                'Ctrl + K',
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontFeatures: const [
                                    FontFeature.tabularFigures(),
                                  ],
                                ),
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
          ),

          // Sağ: Seri, Tema Geçişi & Tuğrul İpucu
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Tooltip(
                  message:
                      'Bugünkü soru hedefin (${stats.dailySolvedCount} / $goal)',
                  child: Semantics(
                    label:
                        'Bugünkü soru hedefi ${stats.dailySolvedCount} bölü $goal',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsFill.target,
                            size: 14,
                            color: colorScheme.onSecondaryContainer,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${stats.dailySolvedCount} / $goal',
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  tooltip: isDark ? 'Açık Temaya Geç' : 'Koyu Temaya Geç',
                  onPressed: () => ref
                      .read(userPreferencesProvider.notifier)
                      .setThemeMode(isDark ? ThemeMode.light : ThemeMode.dark),
                  icon: PhosphorIcon(
                    isDark
                        ? PhosphorIconsRegular.sun
                        : PhosphorIconsRegular.moon,
                    size: 19,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 2),
                TugrulAvatar(
                  mood: TugrulMood.coach,
                  size: 32,
                  ringWidth: 2,
                  hasShadow: false,
                  tooltip: 'Tuğrul Çalışma İpuçları',
                  onTap: () =>
                      TugrulTipsSheet.show(context, mood: TugrulMood.coach),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
