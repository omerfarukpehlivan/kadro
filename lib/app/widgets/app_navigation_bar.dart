import 'package:flutter/material.dart'; // Material Design bileşenleri

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
        // Alt menüdeki her bir sekme butonunun listesi
        NavigationDestination(
          // 1. Buton: Ana Sayfa
          icon: Icon(
            Icons.home_outlined,
          ), // Seçili değilken gösterilecek çizgi ikon
          selectedIcon: Icon(Icons.home), // Seçildiğinde gösterilecek dolu ikon
          label: 'Ana Sayfa', // İkonun altındaki etiket metni
        ),
        NavigationDestination(
          // 2. Buton: Dersler
          icon: Icon(Icons.menu_book_outlined), // Çizgi kitap ikonu
          selectedIcon: Icon(Icons.menu_book), // Dolu kitap ikonu
          label: 'Dersler', // Etiket metni
        ),
        NavigationDestination(
          // 3. Buton: Denemeler
          icon: Icon(Icons.timer_outlined), // Çizgi kronometre ikonu
          selectedIcon: Icon(Icons.timer), // Dolu kronometre ikonu
          label: 'Denemeler', // Etiket metni
        ),
        NavigationDestination(
          // 4. Buton: İstatistik
          icon: Icon(Icons.bar_chart_outlined), // Çizgi grafik ikonu
          selectedIcon: Icon(Icons.bar_chart), // Dolgulu grafik ikonu
          label: 'İstatistik', // Etiket metni
        ),
        NavigationDestination(
          // 5. Buton: Profil
          icon: Icon(Icons.person_outline), // Çizgi kişi ikonu
          selectedIcon: Icon(Icons.person), // Dolu kişi ikonu
          label: 'Profil', // Etiket metni
        ),
      ],
    );
  }
}
