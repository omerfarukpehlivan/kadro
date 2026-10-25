import 'package:flutter/material.dart';
import 'package:kadro/app/app_shell.dart';
import 'package:kadro/app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kadro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme:
          AppTheme.dark, // Telefon karanlık moddaysa otomatik bu kullanılır
      home: const AppShell(), // Hangi sayfanın gösterileceğine AppShell karar veriyor
    );
  }
}
