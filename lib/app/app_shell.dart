import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Uygulama kabuğu (shell): ilk açılışta zorunlu kurulum, ardından 6 sekmeli telefon & tablet düzeni.
class AppShell extends ConsumerStatefulWidget {
  final StatefulNavigationShell? navigationShell;

  const AppShell({super.key, this.navigationShell});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
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
    final authState = ref.watch(authProvider);

    // 1. Oturum açıldıktan veya açılışta session geri yüklendikten sonra
    // bulut tercihleri ve plan senkronu bitene kadar yönlendirme bekletilir.
    if (authState.isHydrating) {
      return const _CloudHydrationScaffold();
    }

    final hasCompletedOnboarding = ref.watch(
      userPreferencesProvider.select((prefs) => prefs.hasCompletedOnboarding),
    );

    // 3. İlk kez giriş yapan veya bulutta aktif programı olmayan aday için
    // tek seferlik zorunlu kurulum ekranı açılır.
    if (!hasCompletedOnboarding) {
      return const OnboardingScreen(isMandatory: true);
    }

    final index = _currentIndex;
    final content = widget.navigationShell ?? _pages[index];

    void selectTab(int newIndex) {
      if (widget.navigationShell != null) {
        final currentIndex = widget.navigationShell!.currentIndex;
        // Hem çıkılan hem de gidilen sekmenin içindeki imperatif alt sayfaları
        // (LessonTopicsScreen, TopicTestsScreen, QuizHistoryScreen vb.) kök sayfaya sıfırla.
        popBranchToRoot(currentIndex);
        popBranchToRoot(newIndex);
        widget.navigationShell!.goBranch(newIndex, initialLocation: true);
      } else {
        setState(() {
          _fallbackIndex = newIndex;
        });
      }
    }

    final useRail = ResponsiveBreakpoints.usesNavigationRail(context);

    if (!useRail) {
      return Scaffold(
        appBar: AppTopBar(title: _titles[index]),
        body: content,
        bottomNavigationBar: AppNavigationBar(
          selectedIndex: index,
          onDestinationSelected: selectTab,
        ),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppTopBar(title: _titles[index]),
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                right: BorderSide(
                  color: colorScheme.outlineVariant,
                  width: 1.5,
                ),
              ),
            ),
            child: NavigationRail(
              selectedIndex: index,
              onDestinationSelected: selectTab,
              labelType: NavigationRailLabelType.all,
              backgroundColor: colorScheme.surface,
              indicatorColor: colorScheme.primaryContainer,
              destinations: const [
                NavigationRailDestination(
                  icon: PhosphorIcon(PhosphorIconsRegular.house),
                  selectedIcon: PhosphorIcon(PhosphorIconsFill.house),
                  label: Text('Ana Sayfa'),
                ),
                NavigationRailDestination(
                  icon: PhosphorIcon(PhosphorIconsRegular.books),
                  selectedIcon: PhosphorIcon(PhosphorIconsFill.books),
                  label: Text('Dersler'),
                ),
                NavigationRailDestination(
                  icon: PhosphorIcon(PhosphorIconsRegular.target),
                  selectedIcon: PhosphorIcon(PhosphorIconsFill.target),
                  label: Text('Pratik'),
                ),
                NavigationRailDestination(
                  icon: PhosphorIcon(PhosphorIconsRegular.timer),
                  selectedIcon: PhosphorIcon(PhosphorIconsFill.timer),
                  label: Text('Denemeler'),
                ),
                NavigationRailDestination(
                  icon: PhosphorIcon(PhosphorIconsRegular.chartBar),
                  selectedIcon: PhosphorIcon(PhosphorIconsFill.chartBar),
                  label: Text('İstatistik'),
                ),
                NavigationRailDestination(
                  icon: PhosphorIcon(PhosphorIconsRegular.userCircle),
                  selectedIcon: PhosphorIcon(PhosphorIconsFill.userCircle),
                  label: Text('Profil'),
                ),
              ],
            ),
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}

/// Bulut tercihleri ve günlük plan senkronize edilirken gösterilen ara bekleme ekranı.
///
/// Web/Angular karşılığı: AppInitializer / Route Resolve Loading View.
class _CloudHydrationScaffold extends StatelessWidget {
  const _CloudHydrationScaffold();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: colorScheme.primary),
              const SizedBox(height: 20),
              Text(
                'Verileriniz senkronize ediliyor...',
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Günlük çalışma planınız ve ilerlemeniz hazırlanıyor.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
