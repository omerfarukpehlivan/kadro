import 'package:flutter/material.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';

void main() {
  runApp(const MyApp());
}

/// Uygulamanın kök bileşeni.
///
/// Angular'daki `AppComponent` veya `bootstrapApplication` karşılığıdır.
/// `MaterialApp.router` ile merkezi `GoRouter` konfigürasyonunu dinler.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kadro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme:
          AppTheme.dark, // Telefon karanlık moddaysa otomatik bu kullanılır
      routerConfig: appRouter,
    );
  }
}
