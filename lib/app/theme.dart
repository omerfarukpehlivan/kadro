import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Kadro uygulamasının "Tuğrul Kobaltı & Anadolu Altını" tasarım tokenları ve tema yapılandırması.
///
/// Renk dünyası doğrudan Tuğrul karakter illüstrasyonlarından türetilmiştir:
/// Canlı Kobalt Mavisi (#2140D4), Zümrüt Yeşili (#0E9F6E), Anadolu Altını (#E28400)
/// ve aydınlık seramik zemin (#F4F7FC).
/// Tipografi: Başlıklarda ve büyük rakamlarda `Outfit`, gövde ve soru metinlerinde `DM Sans`.
class AppTheme {
  AppTheme._();

  // Marka Renk Sabitleri (Tuğrul Karakter Dünyası Paleti)
  static const Color seedColor = Color(0xFF2140D4); // Tuğrul Kobalt Mavisi
  static const Color secondaryColor = Color(0xFF0E9F6E); // Canlı Zümrüt
  static const Color tertiaryColor = Color(0xFFE28400); // Tuğrul Altını / Amber

  static const Color darkPrimaryColor = Color(0xFF6C8CFF); // Parlak Safir
  static const Color darkSecondaryColor = Color(0xFF34D399); // Açık Zümrüt
  static const Color darkTertiaryColor = Color(0xFFFBBF24); // Sıcak Altın

  // Açık ve Koyu Tema Yüzey Sabitleri
  static const Color lightScaffoldBg = Color(0xFFF4F7FC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceLow = Color(0xFFEDF1FC);
  static const Color lightSurfaceHighest = Color(0xFFE0E7F6);
  static const Color lightOnSurface = Color(0xFF141928);
  static const Color lightOnSurfaceVariant = Color(0xFF505A74);
  static const Color lightOutline = Color(0xFF8B95B0);
  static const Color lightOutlineVariant = Color(0xFFD4DDF0);
  static const Color lightError = Color(0xFFDC2626);

  static const Color darkScaffoldBg = Color(0xFF0C101C);
  static const Color darkSurface = Color(0xFF151B2E);
  static const Color darkSurfaceLow = Color(0xFF1C243D);
  static const Color darkSurfaceHighest = Color(0xFF273152);
  static const Color darkOnSurface = Color(0xFFF1F5FE);
  static const Color darkOnSurfaceVariant = Color(0xFFA3AEC8);
  static const Color darkOutline = Color(0xFF667394);
  static const Color darkOutlineVariant = Color(0xFF2B3554);
  static const Color darkError = Color(0xFFF87171);

  // M3 Alt Bileşen Geometrisi
  static const FlexSubThemesData _subThemesData = FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    blendOnLevel: 6,
    useM2StyleDividerInM3: true,
    defaultRadius: 14.0,
    cardRadius: 16.0,
    filledButtonRadius: 14.0,
    outlinedButtonRadius: 14.0,
    inputDecoratorRadius: 12.0,
    dialogRadius: 20.0,
    bottomSheetRadius: 24.0,
    cardElevation: 0.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarSelectedIconSchemeColor: SchemeColor.primary,
    navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
  );

  /// Tipografi hiyerarşisi: Başlık ve skorlarda Outfit, gövde ve şıklarda DM Sans.
  static TextTheme _buildTextTheme(TextTheme base) {
    // Test ortamında Google Fonts HTTP ağ çağrılarını engeller; TASK-73 ölçeğini korur.
    // Web ortamında Platform.environment çağrısı kIsWeb kontrolü olmadan UnsupportedOperation hatası fırlatır.
    if (!kIsWeb && Platform.environment.containsKey('FLUTTER_TEST')) {
      return base.copyWith(
        displayLarge: base.displayLarge?.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.12,
          letterSpacing: -0.6,
        ),
        displayMedium: base.displayMedium?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.15,
          letterSpacing: -0.4,
        ),
        displaySmall: base.displaySmall?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.18,
          letterSpacing: -0.3,
        ),
        headlineLarge: base.headlineLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.18,
          letterSpacing: -0.3,
        ),
        headlineMedium: base.headlineMedium?.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          height: 1.22,
          letterSpacing: -0.25,
        ),
        headlineSmall: base.headlineSmall?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.24,
          letterSpacing: -0.15,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.25,
          letterSpacing: -0.15,
        ),
        titleMedium: base.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.30,
          letterSpacing: -0.1,
        ),
        titleSmall: base.titleSmall?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          height: 1.30,
          letterSpacing: 0.0,
        ),
        bodyLarge: base.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.50,
        ),
        bodyMedium: base.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.45,
        ),
        bodySmall: base.bodySmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 1.20,
          letterSpacing: 0.1,
        ),
        labelMedium: base.labelMedium?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.20,
          letterSpacing: 0.15,
        ),
        labelSmall: base.labelSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1.15,
          letterSpacing: 0.25,
        ),
      );
    }

    final bodyTheme = GoogleFonts.dmSansTextTheme(base).copyWith(
      titleSmall: GoogleFonts.dmSans(
        textStyle: base.titleSmall,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.30,
        letterSpacing: 0.0,
      ),
      bodyLarge: GoogleFonts.dmSans(
        textStyle: base.bodyLarge,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.50,
      ),
      bodyMedium: GoogleFonts.dmSans(
        textStyle: base.bodyMedium,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.45,
      ),
      bodySmall: GoogleFonts.dmSans(
        textStyle: base.bodySmall,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.40,
      ),
      labelLarge: GoogleFonts.dmSans(
        textStyle: base.labelLarge,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.20,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.dmSans(
        textStyle: base.labelMedium,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.20,
        letterSpacing: 0.15,
      ),
      labelSmall: GoogleFonts.dmSans(
        textStyle: base.labelSmall,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.15,
        letterSpacing: 0.25,
      ),
    );

    return bodyTheme.copyWith(
      displayLarge: GoogleFonts.outfit(
        textStyle: bodyTheme.displayLarge,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.12,
        letterSpacing: -0.6,
      ),
      displayMedium: GoogleFonts.outfit(
        textStyle: bodyTheme.displayMedium,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: -0.4,
      ),
      displaySmall: GoogleFonts.outfit(
        textStyle: bodyTheme.displaySmall,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.18,
        letterSpacing: -0.3,
      ),
      headlineLarge: GoogleFonts.outfit(
        textStyle: bodyTheme.headlineLarge,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.18,
        letterSpacing: -0.3,
      ),
      headlineMedium: GoogleFonts.outfit(
        textStyle: bodyTheme.headlineMedium,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.22,
        letterSpacing: -0.25,
      ),
      headlineSmall: GoogleFonts.outfit(
        textStyle: bodyTheme.headlineSmall,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.24,
        letterSpacing: -0.15,
      ),
      titleLarge: GoogleFonts.outfit(
        textStyle: bodyTheme.titleLarge,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.15,
      ),
      titleMedium: GoogleFonts.outfit(
        textStyle: bodyTheme.titleMedium,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.30,
        letterSpacing: -0.1,
      ),
    );
  }

  static ThemeData _applyProductSubThemes(
    ThemeData base,
    ColorScheme scheme,
    TextTheme textTheme,
    Color scaffoldBg,
  ) {
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffoldBg,
      cardColor: scheme.surface,
      textTheme: textTheme,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: scheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 1.8),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: scheme.outlineVariant, width: 1.2),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.onSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: scheme.surface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          side: BorderSide(color: scheme.outlineVariant, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scheme.surface,
        surfaceTintColor: scheme.surface.withAlpha(0),
        titleSpacing: 16,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: scheme.onSurface,
        ),
      ),
    );
  }

  /// Açık Tema (Gündüz Çalışma Stüdyosu)
  static ThemeData get light {
    final baseLight = FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: seedColor,
        primaryContainer: Color(0xFFE4EBFF),
        secondary: secondaryColor,
        secondaryContainer: Color(0xFFDCFCEB),
        tertiary: tertiaryColor,
        tertiaryContainer: Color(0xFFFFF1D0),
        appBarColor: lightSurface,
        error: lightError,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 0,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    final productScheme = baseLight.colorScheme.copyWith(
      primary: seedColor,
      onPrimary: lightSurface,
      primaryContainer: const Color(0xFFE4EBFF),
      onPrimaryContainer: const Color(0xFF102070),
      secondary: secondaryColor,
      onSecondary: lightOnSurface,
      secondaryContainer: const Color(0xFFDCFCEB),
      onSecondaryContainer: const Color(0xFF064E35),
      tertiary: tertiaryColor,
      onTertiary: lightOnSurface,
      tertiaryContainer: const Color(0xFFFFF1D0),
      onTertiaryContainer: const Color(0xFF753D00),
      error: lightError,
      onError: lightSurface,
      errorContainer: const Color(0xFFFEE2E2),
      onErrorContainer: const Color(0xFF7F1D1D),
      surface: lightSurface,
      onSurface: lightOnSurface,
      surfaceContainerLow: lightSurfaceLow,
      surfaceContainerHighest: lightSurfaceHighest,
      onSurfaceVariant: lightOnSurfaceVariant,
      outline: lightOutline,
      outlineVariant: lightOutlineVariant,
    );

    final textTheme = _buildTextTheme(baseLight.textTheme);
    return _applyProductSubThemes(
      baseLight,
      productScheme,
      textTheme,
      lightScaffoldBg,
    );
  }

  /// Koyu Tema (Gece Odak Modu)
  static ThemeData get dark {
    final baseDark = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: darkPrimaryColor,
        primaryContainer: Color(0xFF1D2C66),
        secondary: darkSecondaryColor,
        secondaryContainer: Color(0xFF123D2E),
        tertiary: darkTertiaryColor,
        tertiaryContainer: Color(0xFF47310B),
        appBarColor: darkSurface,
        error: darkError,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 0,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    final productDarkScheme = baseDark.colorScheme.copyWith(
      primary: darkPrimaryColor,
      onPrimary: const Color(0xFF0A133B),
      primaryContainer: const Color(0xFF1D2C66),
      onPrimaryContainer: const Color(0xFFDDE5FF),
      secondary: darkSecondaryColor,
      onSecondary: const Color(0xFF052E1F),
      secondaryContainer: const Color(0xFF123D2E),
      onSecondaryContainer: const Color(0xFFD1FAE5),
      tertiary: darkTertiaryColor,
      onTertiary: const Color(0xFF3B2000),
      tertiaryContainer: const Color(0xFF47310B),
      onTertiaryContainer: const Color(0xFFFEF3C7),
      error: darkError,
      onError: const Color(0xFF3B0A0A),
      errorContainer: const Color(0xFF4C1616),
      onErrorContainer: const Color(0xFFFEE2E2),
      surface: darkSurface,
      onSurface: darkOnSurface,
      surfaceContainerLow: darkSurfaceLow,
      surfaceContainerHighest: darkSurfaceHighest,
      onSurfaceVariant: darkOnSurfaceVariant,
      outline: darkOutline,
      outlineVariant: darkOutlineVariant,
    );

    final textTheme = _buildTextTheme(baseDark.textTheme);
    return _applyProductSubThemes(
      baseDark,
      productDarkScheme,
      textTheme,
      darkScaffoldBg,
    );
  }
}
