import 'package:flutter/material.dart'; // Material Design bileşenleri
import 'package:lucide_icons_flutter/lucide_icons.dart'; // Modern çizgisel ikon seti

/// Alttaki sekme menüsü (Material Design: navigation bar).
/// Web'deki ana menünün (navbar) mobil karşılığıdır; mobilde başparmağa yakın olsun diye altta durur.
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
    return NavigationBar(
      // Material 3 standart alt navigasyon çubuğu widget'ı
      selectedIndex:
          selectedIndex, // Aktif olan butonun görsel ışığını/vurgusunu yakar
      onDestinationSelected: onDestinationSelected, // Tıklanınca yeni seçilen indeksi uygulama kabuğuna (AppShell) bildirir
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
    );
  }
}
