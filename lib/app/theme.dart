import 'dart:io' show Platform;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Kadro uygulamasının kurumsal tasarım sistemi ve tema yapılandırması.
///
/// Renkler: Academic & State Navy (#1E3A5F), Academic Emerald Teal (#0D9488) ve Achievement Amber Gold (#D97706).
/// Tipografi: Başlıklarda Plus Jakarta Sans, gövde metinlerinde Inter.
///
/// Web karşılığı: CSS custom properties (:root design tokens) ve global font-family importları.
class AppTheme {
  AppTheme._();

  // Marka Renk Sabitleri (Academic Navy + Emerald Teal + Achievement Gold - "De-AI" Prestij Paleti)
  static const Color seedColor = Color(0xFF1E3A5F); // Academic & State Navy
  static const Color secondaryColor = Color(
    0xFF0D9488,
  ); // Academic Emerald Teal
  static const Color tertiaryColor = Color(
    0xFFD97706,
  ); // Achievement Amber Gold

  static const Color darkPrimaryColor = Color(0xFF38BDF8); // Sky/Steel Blue
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
          return base.copyWith(
            displayLarge: base.displayLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -0.5,
            ),
            displayMedium: base.displayMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -0.4,
            ),
            displaySmall: base.displaySmall?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              height: 1.20,
              letterSpacing: -0.35,
            ),
            headlineLarge: base.headlineLarge?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              height: 1.20,
              letterSpacing: -0.3,
            ),
            headlineMedium: base.headlineMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1.25,
              letterSpacing: -0.25,
            ),
            headlineSmall: base.headlineSmall?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.25,
              letterSpacing: -0.2,
            ),
            titleLarge: base.titleLarge?.copyWith(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              height: 1.30,
              letterSpacing: -0.2,
            ),
            titleMedium: base.titleMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 1.30,
              letterSpacing: -0.15,
            ),
            titleSmall: base.titleSmall?.copyWith(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              height: 1.30,
              letterSpacing: -0.1,
            ),
            bodyLarge: base.bodyLarge?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.45,
            ),
            bodyMedium: base.bodyMedium?.copyWith(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
            bodySmall: base.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
            labelLarge: base.labelLarge?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.20,
              letterSpacing: 0.1,
            ),
            labelMedium: base.labelMedium?.copyWith(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              height: 1.20,
              letterSpacing: 0.1,
            ),
            labelSmall: base.labelSmall?.copyWith(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              height: 1.15,
              letterSpacing: 0.1,
            ),
          );
        }
      } catch (_) {
        // Platform.environment desteklenmeyen ortamlarda normal akışa devam edilir.
      }
    }

    final bodyTheme = GoogleFonts.interTextTheme(base).copyWith(
      bodyLarge: GoogleFonts.inter(
        textStyle: base.bodyLarge,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 1.45,
      ),
      bodyMedium: GoogleFonts.inter(
        textStyle: base.bodyMedium,
        fontSize: 13.5,
        fontWeight: FontWeight.w400,
        height: 1.40,
      ),
      bodySmall: GoogleFonts.inter(
        textStyle: base.bodySmall,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.35,
      ),
      labelLarge: GoogleFonts.inter(
        textStyle: base.labelLarge,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        height: 1.20,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.inter(
        textStyle: base.labelMedium,
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        height: 1.20,
        letterSpacing: 0.1,
      ),
      labelSmall: GoogleFonts.inter(
        textStyle: base.labelSmall,
        fontSize: 10.5,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: 0.1,
      ),
    );

    return bodyTheme.copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.displayLarge,
        fontSize: 32,
        fontWeight: FontWeight.w800,
        height: 1.15,
        letterSpacing: -0.5,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.displayMedium,
        fontSize: 28,
        fontWeight: FontWeight.w800,
        height: 1.15,
        letterSpacing: -0.4,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.displaySmall,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        height: 1.20,
        letterSpacing: -0.35,
      ),
      headlineLarge: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.headlineLarge,
        fontSize: 22,
        fontWeight: FontWeight.w800,
        height: 1.20,
        letterSpacing: -0.3,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.headlineMedium,
        fontSize: 20,
        fontWeight: FontWeight.w800,
        height: 1.25,
        letterSpacing: -0.25,
      ),
      headlineSmall: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.headlineSmall,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.2,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.titleLarge,
        fontSize: 16.5,
        fontWeight: FontWeight.w700,
        height: 1.30,
        letterSpacing: -0.2,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.titleMedium,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        height: 1.30,
        letterSpacing: -0.15,
      ),
      titleSmall: GoogleFonts.plusJakartaSans(
        textStyle: bodyTheme.titleSmall,
        fontSize: 13.5,
        fontWeight: FontWeight.w700,
        height: 1.30,
        letterSpacing: -0.1,
      ),
    );
  }

  /// Açık Tema (Light Theme)
  static ThemeData get light {
    final baseLight = FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: seedColor,
        primaryContainer: Color(0xFFF0F4F8),
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
      primaryContainer: const Color(0xFFF0F4F8),
      onPrimaryContainer: const Color(0xFF0C2138),
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
      outlineVariant: const Color(0xFFE2E8F0),
    );

    final textTheme = _buildTextTheme(baseLight.textTheme);

    return baseLight.copyWith(
      colorScheme: highContrastScheme,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      cardColor: const Color(0xFFFFFFFF),
      textTheme: textTheme,
      appBarTheme: baseLight.appBarTheme.copyWith(
        titleSpacing: 4,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: highContrastScheme.onSurface,
        ),
      ),
    );
  }

  /// Koyu Tema (Dark Theme)
  static ThemeData get dark {
    final baseDark = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: darkPrimaryColor,
        primaryContainer: Color(0xFF172A45),
        secondary: darkSecondaryColor,
        secondaryContainer: Color(0xFF134E4A),
        tertiary: darkTertiaryColor,
        tertiaryContainer: Color(0xFF78350F),
        appBarColor: Color(0xFF0B1120),
        error: Color(0xFFF87171),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 4,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    final highContrastDarkScheme = baseDark.colorScheme.copyWith(
      primary: darkPrimaryColor,
      onPrimary: const Color(0xFF0B1120),
      primaryContainer: const Color(0xFF172A45),
      onPrimaryContainer: const Color(0xFFE0F2FE),
      secondary: darkSecondaryColor,
      onSecondary: const Color(0xFF0B1120),
      secondaryContainer: const Color(0xFF134E4A),
      onSecondaryContainer: const Color(0xFFCCFBF1),
      tertiary: darkTertiaryColor,
      onTertiary: const Color(0xFF0B1120),
      tertiaryContainer: const Color(0xFF78350F),
      onTertiaryContainer: const Color(0xFFFEF3C7),
      error: const Color(0xFFF87171),
      onError: const Color(0xFF0B1120),
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

    final textTheme = _buildTextTheme(baseDark.textTheme);

    return baseDark.copyWith(
      colorScheme: highContrastDarkScheme,
      scaffoldBackgroundColor: const Color(0xFF0B1120),
      cardColor: const Color(0xFF1E293B),
      textTheme: textTheme,
      appBarTheme: baseDark.appBarTheme.copyWith(
        titleSpacing: 4,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: highContrastDarkScheme.onSurface,
        ),
      ),
    );
  }
}
