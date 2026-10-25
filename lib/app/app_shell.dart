import 'package:flutter/material.dart'; // Temel Flutter arayüz kütüphanesi
import 'package:kadro/app/widgets/app_navigation_bar.dart'; // Alttaki sekme menüsü (Material: navigation bar)
import 'package:kadro/app/widgets/app_top_bar.dart'; // Üstteki başlık barı (Material: top app bar)
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';

/// Uygulama kabuğu (shell): üst bar + seçili sekmenin ekranı + alt menü.
/// Web'deki layout component'inin karşılığıdır.
/// Tıklanan alt menü sekmesinin durumunu (state) kendi içinde yönetebilmek için StatefulWidget'tır.
class AppShell extends StatefulWidget {
  const AppShell({
    super.key, // Widget kimlik anahtarı
  });

  @override
  State<AppShell> createState() => _AppShellState(); // State (durum) nesnesini oluşturur
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0; // Seçili olan alt menü sekmesinin sıra numarası (0: Ana Sayfa ile başlar)

  // Alt menüdeki sekmelerle aynı sırada sayfalar:
  // 0 Ana Sayfa, 1 Dersler, 2 Denemeler, 3 İstatistik, 4 Profil.
  // Basit bir "route tablosu": index = rota, değer = gösterilecek sayfa.
  static const List<Widget> _pages = [
    HomeScreen(),
    LessonsScreen(),
    ExamsScreen(),
    StatsScreen(),
    ProfileScreen(),
  ];

  // Her sayfanın üst barda görünecek başlığı (yine aynı sırada)
  static const List<String> _titles = [
    'Kadro',
    'Dersler',
    'Denemeler',
    'İstatistik',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    // Mobil sayfanın ana ızgarası (Layout Grid)
    return Scaffold(
      // Üst Bar: başlık seçili sayfaya göre değişir
      appBar: AppTopBar(title: _titles[_selectedIndex]),

      // Orta İçerik Alanı (<router-outlet> gibi): seçili sekmenin sayfası
      body: _pages[_selectedIndex],

      // Alt Menü: sekmeler arası geçiş (web'deki ana menünün mobil karşılığı)
      bottomNavigationBar: AppNavigationBar(
        // Aktif sekme indeksini alt menüye gönderir
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
