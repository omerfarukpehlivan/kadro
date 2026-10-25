import 'package:flutter/material.dart';

/// Uygulamanın teması. Sabit renk (Color(0xFF...)) sadece bu dosyada yazılır;
/// diğer dosyalar renkleri Theme.of(context) ile buradan okur.
/// Web'deki global CSS değişkenlerinin (:root { --primary: ... }) karşılığı.
class AppTheme {
  AppTheme._(); // Alt çizgili private constructor: bu sınıftan nesne oluşturulmasın

  // Kadro'nun ana rengi: güven veren, ders çalışmaya uygun bir lacivert.
  static const Color seedColor = Color(0xFF2E5AAC);

  static ThemeData get light =>
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor));

  // Telefon karanlık moddaysa bu tema kullanılır.
  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
  );
}
