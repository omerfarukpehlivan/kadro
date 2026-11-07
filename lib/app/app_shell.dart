import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';

/// Uygulama kabuğu (shell): üst bar + seçili sekmenin ekranı + 6 sekmeli alt menü.
///
/// Angular'daki master layout component ve `<router-outlet>` karşılığıdır.
/// `go_router` ile kullanıldığında `navigationShell` üzerinden sekmelerin durumunu korur;
/// doğrudan çağrıldığında ise geriye dönük uyumluluk için bellek içi index yönetir.
class AppShell extends StatefulWidget {
  final StatefulNavigationShell? navigationShell;

  const AppShell({super.key, this.navigationShell});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _fallbackIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    LessonsScreen(),
    PracticeHubScreen(),
    ExamsScreen(),
    StatsScreen(),
    ProfileScreen(),
  ];

  static const List<String> _titles = [
    'Kadro',
    'Dersler',
    'Çalışma Türleri',
    'Denemeler',
    'İstatistik',
    'Profil',
  ];

  int get _currentIndex =>
      widget.navigationShell?.currentIndex ?? _fallbackIndex;

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex;

    return Scaffold(
      appBar: AppTopBar(title: _titles[index]),
      body: widget.navigationShell ?? _pages[index],
      bottomNavigationBar: AppNavigationBar(
        selectedIndex: index,
        onDestinationSelected: (newIndex) {
          if (widget.navigationShell != null) {
            widget.navigationShell!.goBranch(
              newIndex,
              initialLocation: newIndex == widget.navigationShell!.currentIndex,
            );
          } else {
            setState(() {
              _fallbackIndex = newIndex;
            });
          }
        },
      ),
    );
  }
}
