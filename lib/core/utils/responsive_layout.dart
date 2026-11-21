import 'package:flutter/material.dart';

/// Ekran genişliği kırılım katmanları (Telefon & Tablet).
enum ScreenLayoutTier { compactMobile, standardMobile, tablet, largeTablet }

/// Tüm uygulama genelinde telefon ve tablet kırılım noktalarını (breakpoints) yöneten yardımcı sınıf.
class ResponsiveBreakpoints {
  ResponsiveBreakpoints._();

  static const double compactMaxWidth = 380.0;
  static const double tabletMinWidth = 600.0;
  static const double railMinWidth = 900.0;
  static const double splitPaneMinWidth = 960.0;
  static const double largeTabletMinWidth = 1024.0;

  /// `1080x2400` gibi fiziksel piksel çözünürlüğünde çalışan dikey telefon
  /// görünümünün veya dar mobil ekranların yanlışlıkla yatay tablet sayılmasını engeller.
  static bool _isPortraitPhoneSimulation(Size size) {
    return size.height >= size.width * 1.75 && size.width <= 1200.0;
  }

  /// Aktif pencere genişliğine göre yerleştirme katmanını döner.
  static ScreenLayoutTier tierOf(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (_isPortraitPhoneSimulation(size)) {
      return isTablet(context)
          ? ScreenLayoutTier.tablet
          : ScreenLayoutTier.standardMobile;
    }
    if (size.width >= largeTabletMinWidth) return ScreenLayoutTier.largeTablet;
    if (size.width >= tabletMinWidth) return ScreenLayoutTier.tablet;
    if (size.width < compactMaxWidth || size.height < 720) {
      return ScreenLayoutTier.compactMobile;
    }
    return ScreenLayoutTier.standardMobile;
  }

  /// Küçük/kompakt telefonlar (< 380px genişlik veya < 720px dikey yükseklik).
  /// Örn: iPhone SE, 360px Android cihazlar.
  static bool isCompact(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width < compactMaxWidth || size.height < 720;
  }

  /// Tablet ve katlanabilir büyük ekranlar (>= 600px genişlik).
  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= tabletMinWidth;
  }

  /// Geniş / yatay tablet düzeni (>= 1024px genişlik).
  static bool isLargeTablet(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= largeTabletMinWidth &&
        !_isPortraitPhoneSimulation(size);
  }

  /// Yatay / büyük tabletlerde sol `NavigationRail` kırılımı (>= 900px).
  static bool usesNavigationRail(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (_isPortraitPhoneSimulation(size)) return false;
    return size.width >= railMinWidth;
  }

  /// Yatay tabletlerde iki panelli Split-Pane (QuizScreen, Harita, Konu-Test) kırılımı (>= 960px).
  static bool usesSplitPane(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= splitPaneMinWidth && !_isPortraitPhoneSimulation(size);
  }

  /// Alt çekmece (`BottomSheet`) yerine ortalanmış `Dialog` / sağ `SideDrawer`
  /// açılacak büyük tablet kırılımı (>= 900px).
  static bool usesDialogOverlay(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= railMinWidth && !_isPortraitPhoneSimulation(size);
  }

  /// Ekran boyutuna göre uygun yatay sayfa dolgusu
  /// (Kompakt: 12px, Standart: 16px, Tablet: 24px, Büyük Tablet: 28px).
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1280) return 28.0;
    if (isCompact(context)) return 12.0;
    if (isTablet(context)) return 24.0;
    return 16.0;
  }

  /// Harita, grafik ve görsel büyütme modalında dokunmatik yakınlaştırma ipucu metnini döner.
  static String zoomHintText(
    BuildContext context, {
    bool includePan = false,
    bool selectProvince = false,
  }) {
    if (selectProvince) {
      return 'İki parmakla yakınlaştırıp ili seçin';
    }
    if (includePan) {
      return 'İki parmağınızla yakınlaştırıp kaydırabilirsiniz';
    }
    return 'İki parmağınızla yakınlaştırabilirsiniz';
  }
}

/// Tablet ve büyük ekranlarda içeriğin aşırı sündürülmesini önleyen,
/// içeriği maksimum genişlik ile ortalayan ve yatay dolguyu
/// ekrana göre uyarlayan duyarlı sarmalayıcı (wrapper) bileşen.
///
/// Web/Angular Karşılığı:
/// `<div class="container max-w-2xl mx-auto px-4">` (Container / Max-width layout).
class ResponsiveContentWrapper extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  const ResponsiveContentWrapper({
    super.key,
    required this.child,
    this.maxWidth = 720,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectivePadding =
        padding ??
        EdgeInsets.symmetric(
          horizontal: ResponsiveBreakpoints.horizontalPadding(context),
        );

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: effectivePadding, child: child),
      ),
    );
  }
}
