import 'package:flutter/material.dart'; // Temel Flutter arayüz kütüphanesi
import 'package:gunisigi/app/widgets/app_footer.dart'; // <app-footer> bileşenimiz
import 'package:gunisigi/app/widgets/app_navbar.dart'; // <app-navbar> bileşenimiz
import 'package:gunisigi/features/history/presentation/history_screen.dart';
import 'package:gunisigi/features/home/presentation/home_screen.dart';
import 'package:gunisigi/features/settings/presentation/settings_screen.dart';
import 'package:gunisigi/features/stats/presentation/stats_screen.dart';

/// Web'deki App Shell (Kapsayıcı Layout) bileşeninin karşılığıdır.
/// Tıklanan alt menü sekmesinin durumunu (state) kendi içinde yönetebilmek için StatefulWidget'tır.
class MainLayout extends StatefulWidget {
  const MainLayout({
    super.key, // Widget kimlik anahtarı
  });

  @override
  State<MainLayout> createState() => _MainLayoutState(); // State (durum) nesnesini oluşturur
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0; // Seçili olan alt menü sekmesinin sıra numarası (0: Ana Sayfa ile başlar)

  // Alt menüdeki sekmelerle aynı sırada sayfalar: 0 Ana Sayfa, 1 Geçmiş, 2 İstatistik, 3 Ayarlar.
  // Basit bir "route tablosu": index = rota, değer = gösterilecek sayfa.
  static const List<Widget> _pages = [
    HomeScreen(),
    HistoryScreen(),
    StatsScreen(),
    SettingsScreen(),
  ];

  // Her sayfanın üst barda görünecek başlığı (yine aynı sırada)
  static const List<String> _titles = [
    'Günışığı 🌅',
    'Geçmiş',
    'İstatistik',
    'Ayarlar',
  ];

  @override
  Widget build(BuildContext context) {
    // Mobil sayfanın ana ızgarası (Layout Grid)
    return Scaffold(
      // Üst Bar: başlık seçili sayfaya göre değişir
      appBar: AppNavbar(title: _titles[_selectedIndex]),

      // Orta İçerik Alanı (<router-outlet> gibi): seçili sekmenin sayfası
      body: _pages[_selectedIndex],

      // Alt Menü (<app-footer> bileşenini yerleştirir)
      bottomNavigationBar: AppFooter(
        // Aktif sekme indeksini footer'a gönderir
        selectedIndex: _selectedIndex,
        // Kullanıcı alt menüden başka bir sekmeye tıkladığında:
        onDestinationSelected: (index) {
          // Flutter'a "durum değişti, ekranı yeniden çiz" emri verir
          setState(() {
            // Yeni sekme kaydedilir; build() tekrar çalışınca body ve başlık değişir
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
