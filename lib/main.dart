import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';

void main() {
  // Uygulama genelinde Riverpod durum yönetimini etkinleştirir
  runApp(const ProviderScope(child: MyApp()));
}

/// Uygulamanın kök bileşeni.
///
/// Angular'daki `AppComponent` veya `bootstrapApplication` karşılığıdır.
/// `MaterialApp.router` ile merkezi `GoRouter` konfigürasyonunu dinler.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp.router(
      title: 'Kadro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme:
          AppTheme.dark, // Telefon karanlık moddaysa otomatik bu kullanılır
      routerConfig: appRouter,
    );

    // Dışarıda ProviderScope yoksa (örn. doğrudan MyApp() çalıştıran widget testlerinde)
    // otomatik ProviderScope ile sararak testlerin kırılmasını önler.
    try {
      ProviderScope.containerOf(context);
      return app;
    } catch (_) {
      return ProviderScope(child: app);
    }
  }
}
