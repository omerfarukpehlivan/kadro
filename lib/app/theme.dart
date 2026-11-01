import 'dart:io' show Platform;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Kadro uygulamasının kurumsal tasarım sistemi ve tema yapılandırması.
///
/// Renkler: Academic Royal Indigo (#4F46E5), Vibrant Academic Teal (#0D9488) ve Achievement Amber Gold (#D97706).
/// Tipografi: Başlıklarda Plus Jakarta Sans, gövde metinlerinde Inter.
///
/// Web karşılığı: CSS custom properties (:root design tokens) ve global font-family importları.
class AppTheme {
  AppTheme._();

  // Marka Renk Sabitleri (Academic Indigo + Emerald Teal + Achievement Gold)
  static const Color seedColor = Color(0xFF4F46E5); // Academic Royal Indigo
  static const Color secondaryColor = Color(
    0xFF0D9488,
  ); // Vibrant Academic Teal
  static const Color tertiaryColor = Color(
    0xFFD97706,
  ); // Achievement Amber Gold

  static const Color darkPrimaryColor = Color(0xFF818CF8);
  static const Color darkSecondaryColor = Color(0xFF2DD4BF);
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
        primaryContainer: Color(0xFFEEF2FF),
        secondary: secondaryColor,
        secondaryContainer: Color(0xFFCCFBF1),
        tertiary: tertiaryColor,
        tertiaryContainer: Color(0xFFFEF3C7),
        appBarColor: Color(0xFFF8FAFC),
        error: Color(0xFFDC2626),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 2,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    final highContrastScheme = baseLight.colorScheme.copyWith(
      primary: seedColor,
      onPrimary: const Color(0xFFFFFFFF),
      primaryContainer: const Color(0xFFE0E7FF),
      onPrimaryContainer: const Color(0xFF1E1B4B),
      secondary: secondaryColor,
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFCCFBF1),
      onSecondaryContainer: const Color(0xFF134E4A),
      tertiary: tertiaryColor,
      onTertiary: const Color(0xFFFFFFFF),
      tertiaryContainer: const Color(0xFFFEF3C7),
      onTertiaryContainer: const Color(0xFF78350F),
      error: const Color(0xFFDC2626),
      onError: const Color(0xFFFFFFFF),
      errorContainer: const Color(0xFFFEE2E2),
      onErrorContainer: const Color(0xFF7F1D1D),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF0F172A),
      surfaceContainerLow: const Color(0xFFF8FAFC),
      surfaceContainerHighest: const Color(0xFFF1F5F9),
      onSurfaceVariant: const Color(0xFF475569),
      outline: const Color(0xFF64748B),
      outlineVariant: const Color(0xFFCBD5E1),
    );

    return baseLight.copyWith(
      colorScheme: highContrastScheme,
      scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      cardColor: const Color(0xFFFFFFFF),
      textTheme: _buildTextTheme(baseLight.textTheme),
    );
  }

  /// Koyu Tema (Dark Theme)
  static ThemeData get dark {
    final baseDark = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: darkPrimaryColor,
        primaryContainer: Color(0xFF312E81),
        secondary: darkSecondaryColor,
        secondaryContainer: Color(0xFF134E4A),
        tertiary: darkTertiaryColor,
        tertiaryContainer: Color(0xFF78350F),
        appBarColor: Color(0xFF0F172A),
        error: Color(0xFFF87171),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 4,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    final highContrastDarkScheme = baseDark.colorScheme.copyWith(
      primary: darkPrimaryColor,
      onPrimary: const Color(0xFF0F172A),
      primaryContainer: const Color(0xFF312E81),
      onPrimaryContainer: const Color(0xFFE0E7FF),
      secondary: darkSecondaryColor,
      onSecondary: const Color(0xFF0F172A),
      secondaryContainer: const Color(0xFF134E4A),
      onSecondaryContainer: const Color(0xFFCCFBF1),
      tertiary: darkTertiaryColor,
      onTertiary: const Color(0xFF0F172A),
      tertiaryContainer: const Color(0xFF78350F),
      onTertiaryContainer: const Color(0xFFFEF3C7),
      error: const Color(0xFFF87171),
      onError: const Color(0xFF0F172A),
      errorContainer: const Color(0xFF7F1D1D),
      onErrorContainer: const Color(0xFFFEE2E2),
      surface: const Color(0xFF1E293B),
      onSurface: const Color(0xFFF8FAFC),
      surfaceContainerLow: const Color(0xFF1E293B),
      surfaceContainerHighest: const Color(0xFF334155),
      onSurfaceVariant: const Color(0xFFCBD5E1),
      outline: const Color(0xFF94A3B8),
      outlineVariant: const Color(0xFF334155),
    );

    return baseDark.copyWith(
      colorScheme: highContrastDarkScheme,
      scaffoldBackgroundColor: const Color(0xFF0B0F19),
      cardColor: const Color(0xFF1E293B),
      textTheme: _buildTextTheme(baseDark.textTheme),
    );
  }
}
