import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Masaüstü Web SaaS düzeni (>= 1024px) için kalıcı sol gezinme kenar çubuğu (`TASK-146`).
///
/// Angular/Web karşılığı: Sol sabit `<aside>` navigasyon ve hızlı çalışma araçları menüsü.
class KadroSidebar extends ConsumerWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const KadroSidebar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  static const double width = 256.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final prefs = ref.watch(userPreferencesProvider);
    final stats = ref.watch(studyStatsProvider);
    final goal = stats.dailyGoal > 0 ? stats.dailyGoal : 30;
    final progress = (stats.dailySolvedCount / goal).clamp(0.0, 1.0);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          right: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        ),
      ),
      child: SafeArea(
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Marka + Aktif Sınav Hedefi Kapsülü
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const TugrulAvatar(
                        mood: TugrulMood.coach,
                        size: 38,
                        ringWidth: 2,
                        hasShadow: false,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Kadro',
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'WEB',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TactileCard(
                    onTap: () => TargetExamSelectorBottomSheet.showSelection(
                      context,
                      currentSelection: prefs.examSelection,
                    ),
                    isElevated: false,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    backgroundColor: colorScheme.surfaceContainerLow,
                    borderColor: colorScheme.outlineVariant,
                    borderRadius: 12,
                    child: Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIconsFill.graduationCap,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            prefs.examSelection.displayTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        PhosphorIcon(
                          PhosphorIconsRegular.caretUpDown,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Ana 6 Sekme + Hızlı Çalışma Araçları
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                children: [
                  _SidebarItem(
                    label: 'Ana Sayfa',
                    icon: PhosphorIconsRegular.house,
                    selectedIcon: PhosphorIconsFill.house,
                    selected: selectedIndex == 0,
                    onTap: () => onDestinationSelected(0),
                  ),
                  _SidebarItem(
                    label: 'Dersler',
                    icon: PhosphorIconsRegular.books,
                    selectedIcon: PhosphorIconsFill.books,
                    selected: selectedIndex == 1,
                    onTap: () => onDestinationSelected(1),
                  ),
                  _SidebarItem(
                    label: 'Pratik',
                    icon: PhosphorIconsRegular.target,
                    selectedIcon: PhosphorIconsFill.target,
                    selected: selectedIndex == 2,
                    onTap: () => onDestinationSelected(2),
                  ),
                  _SidebarItem(
                    label: 'Denemeler',
                    icon: PhosphorIconsRegular.timer,
                    selectedIcon: PhosphorIconsFill.timer,
                    selected: selectedIndex == 3,
                    onTap: () => onDestinationSelected(3),
                  ),
                  _SidebarItem(
                    label: 'İstatistik',
                    icon: PhosphorIconsRegular.chartBar,
                    selectedIcon: PhosphorIconsFill.chartBar,
                    selected: selectedIndex == 4,
                    onTap: () => onDestinationSelected(4),
                  ),
                  _SidebarItem(
                    label: 'Profil',
                    icon: PhosphorIconsRegular.userCircle,
                    selectedIcon: PhosphorIconsFill.userCircle,
                    selected: selectedIndex == 5,
                    onTap: () => onDestinationSelected(5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                    child: Text(
                      'HIZLI ARAÇLAR',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                  _SidebarItem(
                    label: 'Yanlış Defteri',
                    icon: PhosphorIconsRegular.warningCircle,
                    selectedIcon: PhosphorIconsFill.warningCircle,
                    selected: false,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const MistakesScreen()),
                    ),
                  ),
                  _SidebarItem(
                    label: 'Puan Hesapla',
                    icon: PhosphorIconsRegular.calculator,
                    selectedIcon: PhosphorIconsFill.calculator,
                    selected: false,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const KpssScoreCalculatorScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Alt Günlük Hedef & PRO Kartı
            Padding(
              padding: const EdgeInsets.all(12),
              child: TactileCard(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PaywallScreen()),
                ),
                backgroundColor: prefs.isPro
                    ? Color.alphaBlend(
                        colorScheme.tertiaryContainer.withAlpha(110),
                        colorScheme.surface,
                      )
                    : colorScheme.surfaceContainerLow,
                borderColor: prefs.isPro
                    ? colorScheme.tertiary
                    : colorScheme.outlineVariant,
                lipColor: prefs.isPro ? colorScheme.tertiary : null,
                padding: const EdgeInsets.all(12),
                borderRadius: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIconsFill.crown,
                          size: 16,
                          color: prefs.isPro
                              ? colorScheme.tertiary
                              : colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            prefs.isPro
                                ? 'Kadro PRO Aktif'
                                : "Kadro PRO'ya Geç",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Günlük Hedef',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          '${stats.dailySolvedCount}/$goal',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w700,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 6,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bgColor = widget.selected
        ? colorScheme.primaryContainer
        : _hovered
        ? colorScheme.surfaceContainerLow
        : colorScheme.surface.withAlpha(0);

    final fgColor = widget.selected
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowHoverHighlight: (h) {
          if (_hovered != h) setState(() => _hovered = h);
        },
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.selected
                    ? colorScheme.primary.withAlpha(90)
                    : colorScheme.surface.withAlpha(0),
              ),
            ),
            child: Row(
              children: [
                PhosphorIcon(
                  widget.selected ? widget.selectedIcon : widget.icon,
                  size: 19,
                  color: widget.selected ? colorScheme.primary : fgColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: widget.selected
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onSurface,
                      fontWeight: widget.selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
