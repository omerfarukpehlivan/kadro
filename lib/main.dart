import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';

void main() {
  // Uygulama genelinde Riverpod durum yönetimini etkinleştirir
  runApp(const ProviderScope(child: MyApp()));
}

/// Uygulamanın kök bileşeni.
///
/// Angular'daki `AppComponent` veya `bootstrapApplication` karşılığıdır.
/// `MaterialApp.router` ile merkezi `GoRouter` konfigürasyonunu ve kullanıcı temasını dinler.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dışarıda ProviderScope yoksa (örn. doğrudan MyApp() çalıştıran izole testlerde)
    // otomatik ProviderScope ile sararak testlerin kırılmasını önler.
    try {
      ProviderScope.containerOf(context);
      return const _MyAppContent();
    } catch (_) {
      return const ProviderScope(child: _MyAppContent());
    }
  }
}

class _MyAppContent extends ConsumerWidget {
  const _MyAppContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(userPreferencesProvider).themeMode;

    return MaterialApp.router(
      title: 'Kadro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme:
          AppTheme.dark, // Telefon karanlık moddaysa otomatik bu kullanılır
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
