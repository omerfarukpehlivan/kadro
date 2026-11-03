import 'package:flutter/material.dart'; // Material Design bileşenleri
import 'package:lucide_icons_flutter/lucide_icons.dart'; // Modern çizgisel ikon seti

/// Alttaki havada duran sekme menüsü (Floating Pill/Dock Bottom Navigation Bar).
/// Web'deki modern SaaS ve mobil uygulamalardaki floating dock tasarımına karşılık gelir.
class AppNavigationBar extends StatelessWidget {
  final int selectedIndex; // Şu an hangi sekmenin (tab) aktif/seçili olduğu sıra numarası (0-4)
  final ValueChanged<int> onDestinationSelected; // Kullanıcı bir sekmeye dokunduğunda çalışan bildirim fonksiyonu

  const AppNavigationBar({
    super.key, // Widget kimlik anahtarı
    required this.selectedIndex, // Zorunlu parametre: Aktif sekme indeksi
    required this.onDestinationSelected, // Zorunlu parametre: Tıklama olayı bildirici fonksiyon
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isCompact = MediaQuery.sizeOf(context).width < 380;

    final labelStyle = WidgetStateProperty.resolveWith<TextStyle?>((states) {
      final base = Theme.of(context).textTheme.labelSmall;
      return base?.copyWith(
        fontSize: isCompact ? 10.5 : 12.0,
        letterSpacing: isCompact ? -0.3 : -0.1,
        fontWeight: states.contains(WidgetState.selected)
            ? FontWeight.w800
            : FontWeight.w600,
      );
    });

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          isCompact ? 8 : 16,
          4,
          isCompact ? 8 : 16,
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
              data: NavigationBarThemeData(labelTextStyle: labelStyle),
              child: NavigationBar(
                height: 66,
                elevation: 0,
                backgroundColor: colorScheme.surface,
                indicatorColor: colorScheme.primaryContainer,
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                destinations: const [
                  // Alt menüdeki her bir sekme butonunun listesi (LucideIcons ile modernleştirildi)
                  NavigationDestination(
                    icon: Icon(LucideIcons.house),
                    selectedIcon: Icon(LucideIcons.house),
                    label: 'Ana Sayfa',
                  ),
                  NavigationDestination(
                    icon: Icon(LucideIcons.bookOpen),
                    selectedIcon: Icon(LucideIcons.bookOpen),
                    label: 'Dersler',
                  ),
                  NavigationDestination(
                    icon: Icon(LucideIcons.timer),
                    selectedIcon: Icon(LucideIcons.timer),
                    label: 'Denemeler',
                  ),
                  NavigationDestination(
                    icon: Icon(LucideIcons.chartColumn),
                    selectedIcon: Icon(LucideIcons.chartColumn),
                    label: 'İstatistik',
                  ),
                  NavigationDestination(
                    icon: Icon(LucideIcons.user),
                    selectedIcon: Icon(LucideIcons.user),
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
