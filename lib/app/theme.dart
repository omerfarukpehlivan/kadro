import 'dart:io' show Platform;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Kadro uygulamasının kurumsal tasarım sistemi ve tema yapılandırması.
///
/// Renkler: Academic Royal Indigo (#4F46E5), Deep Slate (#0F172A) ve Achievement Gold (#D97706).
/// Tipografi: Başlıklarda Plus Jakarta Sans, gövde metinlerinde Inter.
///
/// Web karşılığı: CSS custom properties (:root design tokens) ve global font-family importları.
class AppTheme {
  AppTheme._();

  // Marka Renk Sabitleri
  static const Color seedColor = Color(0xFF4F46E5); // Academic Royal Indigo
  static const Color secondaryColor = Color(0xFF0F172A); // Deep Slate
  static const Color tertiaryColor = Color(
    0xFFD97706,
  ); // Achievement Amber Gold

  static const Color darkPrimaryColor = Color(0xFF818CF8);
  static const Color darkSecondaryColor = Color(0xFF94A3B8);
  static const Color darkTertiaryColor = Color(0xFFFBBF24);

  // M3 Alt Bileşen Geometrisi ve Renk Şeması
  static const FlexSubThemesData _subThemesData = FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    blendOnLevel: 10,
    useM2StyleDividerInM3: true,
    defaultRadius: 16.0,
    cardRadius: 16.0,
    filledButtonRadius: 12.0,
    outlinedButtonRadius: 12.0,
    inputDecoratorRadius: 12.0,
    cardElevation: 0.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarSelectedIconSchemeColor: SchemeColor.primary,
    navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
  );

  /// Tipografi hiyerarşisi: Gövde için Inter, başlıklar için Plus Jakarta Sans.
  static TextTheme _buildTextTheme(TextTheme base) {
    // KRİTİK TEST GÜVENLİĞİ: Test ortamında HTTP ile dış ağdan font indirmeyi önler.
    // Web ortamında (kIsWeb) Platform.environment çağrısı desteklenmediğinden short-circuit yapılır.
    if (!kIsWeb) {
      try {
        if (Platform.environment.containsKey('FLUTTER_TEST')) {
          return base;
        }
      } catch (_) {
        // Platform.environment desteklenmeyen ortamlarda normal akışa devam edilir.
      }
    }

    final bodyTheme = GoogleFonts.interTextTheme(base);

    return bodyTheme.copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.displayLarge,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.displayMedium,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.displaySmall,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.headlineLarge,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.headlineMedium,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.headlineSmall,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.titleLarge,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.titleMedium,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.titleSmall,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Açık Tema (Light Theme)
  static ThemeData get light {
    final baseLight = FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: seedColor,
        primaryContainer: Color(0xFFE0E7FF),
        secondary: secondaryColor,
        secondaryContainer: Color(0xFFF1F5F9),
        tertiary: tertiaryColor,
        tertiaryContainer: Color(0xFFFEF3C7),
        appBarColor: Color(0xFFF8FAFC),
        error: Color(0xFFDC2626),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 4,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    return baseLight.copyWith(textTheme: _buildTextTheme(baseLight.textTheme));
  }

  /// Koyu Tema (Dark Theme)
  static ThemeData get dark {
    final baseDark = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: darkPrimaryColor,
        primaryContainer: Color(0xFF312E81),
        secondary: darkSecondaryColor,
        secondaryContainer: Color(0xFF1E293B),
        tertiary: darkTertiaryColor,
        tertiaryContainer: Color(0xFF78350F),
        appBarColor: Color(0xFF0B0F19),
        error: Color(0xFFF87171),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 8,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    return baseDark.copyWith(textTheme: _buildTextTheme(baseDark.textTheme));
  }
}
