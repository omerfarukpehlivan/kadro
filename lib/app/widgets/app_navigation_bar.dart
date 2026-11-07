import 'package:flutter/material.dart'; // Material Design bileşenleri
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Karakteristik Phosphor ikon seti (Bold & Fill)

/// Alttaki havada duran 6 sekmeli dock menüsü (Floating Pill/Dock Bottom Navigation Bar).
/// Web'deki modern SaaS ve mobil uygulamalardaki floating navigation bar mimarisine karşılık gelir.
/// Seçili olmayan sekmelerde `PhosphorIconsBold`, seçili sekmelerde tok `PhosphorIconsFill` kullanılır.
class AppNavigationBar extends StatelessWidget {
  final int
  selectedIndex; // Şu an hangi sekmenin aktif/seçili olduğu sıra numarası (0-5)
  final ValueChanged<int> onDestinationSelected; // Kullanıcı bir sekmeye dokunduğunda çalışan bildirim fonksiyonu

  const AppNavigationBar({
    super.key, // Widget kimlik anahtarı
    required this.selectedIndex, // Zorunlu parametre: Aktif sekme indeksi
    required this.onDestinationSelected, // Zorunlu parametre: Tıklama olayı bildirici fonksiyon
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 400;

    final labelStyle = WidgetStateProperty.resolveWith<TextStyle?>((states) {
      final base = Theme.of(context).textTheme.labelSmall;
      return base?.copyWith(
        fontSize: isCompact ? 9.5 : 11.0,
        letterSpacing: isCompact ? -0.5 : -0.2,
        fontWeight: states.contains(WidgetState.selected)
            ? FontWeight.w800
            : FontWeight.w600,
      );
    });

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          isCompact ? 6 : 14,
          4,
          isCompact ? 6 : 14,
          12,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: colorScheme.primary.withAlpha(45),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withAlpha(28),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: labelStyle,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              ),
              child: NavigationBar(
                height: 66,
                elevation: 0,
                backgroundColor: colorScheme.surface,
                indicatorColor: colorScheme.primaryContainer,
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                destinations: const [
                  // 0: Ana Sayfa
                  NavigationDestination(
                    icon: PhosphorIcon(PhosphorIconsBold.house),
                    selectedIcon: PhosphorIcon(PhosphorIconsFill.house),
                    label: 'Ana Sayfa',
                  ),
                  // 1: Dersler
                  NavigationDestination(
                    icon: PhosphorIcon(PhosphorIconsBold.books),
                    selectedIcon: PhosphorIcon(PhosphorIconsFill.books),
                    label: 'Dersler',
                  ),
                  // 2: Pratik
                  NavigationDestination(
                    icon: PhosphorIcon(PhosphorIconsBold.gameController),
                    selectedIcon: PhosphorIcon(
                      PhosphorIconsFill.gameController,
                    ),
                    label: 'Pratik',
                  ),
                  // 3: Denemeler
                  NavigationDestination(
                    icon: PhosphorIcon(PhosphorIconsBold.timer),
                    selectedIcon: PhosphorIcon(PhosphorIconsFill.timer),
                    label: 'Denemeler',
                  ),
                  // 4: İstatistik
                  NavigationDestination(
                    icon: PhosphorIcon(PhosphorIconsBold.chartBar),
                    selectedIcon: PhosphorIcon(PhosphorIconsFill.chartBar),
                    label: 'İstatistik',
                  ),
                  // 5: Profil
                  NavigationDestination(
                    icon: PhosphorIcon(PhosphorIconsBold.userCircle),
                    selectedIcon: PhosphorIcon(PhosphorIconsFill.userCircle),
                    label: 'Profil',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
