import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// 6 sekmeli canlı EdTech alt gezinme çubuğu.
///
/// Üstünde net `1.5px` kenarlık, seçili sekmede kobalt kapsül ve dolgun `PhosphorIconsFill`
/// ikonlarla yüksek dokunsal netlik sağlar.
class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 400;

    final labelStyle = WidgetStateProperty.resolveWith<TextStyle?>((states) {
      final base = Theme.of(context).textTheme.labelSmall;
      final isSelected = states.contains(WidgetState.selected);
      return base?.copyWith(
        letterSpacing: isCompact ? -0.3 : 0.0,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
      );
    });

    final iconTheme = WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      final isSelected = states.contains(WidgetState.selected);
      return IconThemeData(
        size: isCompact ? 21 : 23,
        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
      );
    });

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: labelStyle,
            iconTheme: iconTheme,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: NavigationBar(
            height: 64,
            elevation: 0,
            backgroundColor: colorScheme.surface,
            surfaceTintColor: colorScheme.surface.withAlpha(0),
            indicatorColor: colorScheme.primaryContainer,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: const [
              NavigationDestination(
                icon: PhosphorIcon(PhosphorIconsRegular.house),
                selectedIcon: PhosphorIcon(PhosphorIconsFill.house),
                label: 'Ana Sayfa',
              ),
              NavigationDestination(
                icon: PhosphorIcon(PhosphorIconsRegular.books),
                selectedIcon: PhosphorIcon(PhosphorIconsFill.books),
                label: 'Dersler',
              ),
              NavigationDestination(
                icon: PhosphorIcon(PhosphorIconsRegular.target),
                selectedIcon: PhosphorIcon(PhosphorIconsFill.target),
                label: 'Pratik',
              ),
              NavigationDestination(
                icon: PhosphorIcon(PhosphorIconsRegular.timer),
                selectedIcon: PhosphorIcon(PhosphorIconsFill.timer),
                label: 'Denemeler',
              ),
              NavigationDestination(
                icon: PhosphorIcon(PhosphorIconsRegular.chartBar),
                selectedIcon: PhosphorIcon(PhosphorIconsFill.chartBar),
                label: 'İstatistik',
              ),
              NavigationDestination(
                icon: PhosphorIcon(PhosphorIconsRegular.userCircle),
                selectedIcon: PhosphorIcon(PhosphorIconsFill.userCircle),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
