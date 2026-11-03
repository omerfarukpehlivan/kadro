import 'package:flutter/material.dart';

/// Tüm uygulama genelinde duyarlı (responsive) ve uyarlanabilir (adaptive)
/// kırılım noktalarını (breakpoints) yöneten yardımcı sınıf.
///
/// Web/Angular Karşılığı:
/// `@media` breakpoint utility & Angular CDK BreakpointObserver.
class ResponsiveBreakpoints {
  ResponsiveBreakpoints._();

  /// Küçük/kompakt telefonlar (< 380px genişlik veya < 720px dikey yükseklik).
  /// Örn: iPhone SE, 360px Android cihazlar.
  static bool isCompact(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width < 380 || size.height < 720;
  }

  /// Tablet ve katlanabilir büyük ekranlar (>= 600px genişlik).
  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600;
  }

  /// Ekran boyutuna göre uygun yatay sayfa dolgusu (Kompakt: 12px, Standart: 16px, Tablet: 24px).
  static double horizontalPadding(BuildContext context) {
    if (isCompact(context)) return 12.0;
    if (isTablet(context)) return 24.0;
    return 16.0;
  }
}

/// Tablet ve büyük ekranlarda içeriğin aşırı sündürülmesini önleyen,
/// içeriği maksimum 720px genişlik ile ortalayan ve yatay dolguyu
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

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: effectivePadding, child: child),
      ),
    );
  }
}
