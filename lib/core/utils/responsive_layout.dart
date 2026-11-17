import 'package:flutter/material.dart';

/// Ekran genişliği kırılım katmanları (`TASK-146`).
///
/// Angular CDK `Breakpoints` ve Tailwind CSS kırılım sisteminin karşılığıdır.
enum ScreenLayoutTier {
  compactMobile,
  standardMobile,
  tablet,
  desktop,
  wideDesktop,
}

/// Tüm uygulama genelinde duyarlı (responsive) ve uyarlanabilir (adaptive)
/// kırılım noktalarını (breakpoints) yöneten yardımcı sınıf.
///
/// Web/Angular Karşılığı:
/// `@media` breakpoint utility & Angular CDK BreakpointObserver.
class ResponsiveBreakpoints {
  ResponsiveBreakpoints._();

  static const double compactMaxWidth = 380.0;
  static const double tabletMinWidth = 600.0;
  static const double railMinWidth = 900.0;
  static const double splitPaneMinWidth = 960.0;
  static const double desktopMinWidth = 1024.0;
  static const double wideDesktopMinWidth = 1440.0;

  /// `1080x2400` gibi fiziksel piksel çözünürlüğünde çalışan dikey telefon
  /// görünümünün veya dar mobil ekranların yanlışlıkla masaüstü sayılmasını engeller.
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
    if (size.width >= wideDesktopMinWidth) return ScreenLayoutTier.wideDesktop;
    if (size.width >= desktopMinWidth) return ScreenLayoutTier.desktop;
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

  /// Masaüstü / Web tarayıcı çalışma düzeni (>= 1024px genişlik).
  static bool isDesktop(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= desktopMinWidth && !_isPortraitPhoneSimulation(size);
  }

  /// Geniş monitör / ultra-wide masaüstü düzeni (>= 1440px genişlik).
  static bool isWideDesktop(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= wideDesktopMinWidth &&
        !_isPortraitPhoneSimulation(size);
  }

  /// Kalıcı sol `KadroSidebar` menüsünün kullanılacağı masaüstü kırılımı (>= 1024px).
  static bool usesSidebar(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= desktopMinWidth && !_isPortraitPhoneSimulation(size);
  }

  /// Orta genişlikli tarayıcı / yatay tabletlerde dar `NavigationRail` kırılımı (900px–1023px).
  static bool usesNavigationRail(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (_isPortraitPhoneSimulation(size)) return false;
    return size.width >= railMinWidth && size.width < desktopMinWidth;
  }

  /// İki panelli Split-Pane (QuizScreen, Harita, Konu-Test) kırılımı (>= 960px).
  static bool usesSplitPane(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= splitPaneMinWidth && !_isPortraitPhoneSimulation(size);
  }

  /// Alt çekmece (`BottomSheet`) yerine ortalanmış `Dialog` / sağ `SideDrawer`
  /// açılacak masaüstü web kırılımı (>= 900px).
  static bool usesDialogOverlay(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width >= railMinWidth && !_isPortraitPhoneSimulation(size);
  }

  /// Ekran boyutuna göre uygun yatay sayfa dolgusu
  /// (Kompakt: 12px, Standart: 16px, Tablet/Masaüstü: 24px, Geniş: 32px).
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1280) return 32.0;
    if (isCompact(context)) return 12.0;
    if (isTablet(context)) return 24.0;
    return 16.0;
  }

  /// Harita, grafik ve görsel büyütme modalında cihaz/ekran boyutuna göre
  /// yakınlaştırma ipucu metnini döner (PC'de fare tekerleği, mobil/tablette parmak).
  static String zoomHintText(
    BuildContext context, {
    bool includePan = false,
    bool selectProvince = false,
  }) {
    final desktop = isDesktop(context);
    if (selectProvince) {
      return desktop
          ? 'Fare tekerleğiyle yakınlaştırıp ili seçin'
          : 'İki parmakla yakınlaştırıp ili seçin';
    }
    if (includePan) {
      return desktop
          ? 'Fare tekerleğiyle yakınlaştırıp sürükleyebilirsiniz'
          : 'İki parmağınızla yakınlaştırıp kaydırabilirsiniz';
    }
    return desktop
        ? 'Fare tekerleğiyle yakınlaştırabilirsiniz'
        : 'İki parmağınızla yakınlaştırabilirsiniz';
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
