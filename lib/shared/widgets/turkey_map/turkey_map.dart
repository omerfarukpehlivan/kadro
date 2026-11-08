import 'package:flutter/material.dart';

import 'turkey_map_data.dart';
import 'turkey_map_models.dart';
import 'turkey_svg_parser.dart';

export 'turkey_map_card.dart';
export 'turkey_map_data.dart';
export 'turkey_map_models.dart';
export 'turkey_svg_parser.dart';

/// 🇹🇷 Dinamik ve İnteraktif Türkiye Vektör Haritası Bileşeni
///
/// Angular/Web benzetmesi: Bu bileşen, SVG `<path>` ve `<circle>` etiketlerini
/// HTML5 Canvas / SVG DOM ağacı gibi reaktif olarak yöneten bir `<app-turkey-map>` componentidir.
///
/// Özellikler:
/// - 81 ilin gerçek koordinat sınırları (viewBox: 1000x427)
/// - İl ve Bölge bazında dinamik renklendirme (`highlightedProvinces`, `highlightedRegions`)
/// - KPSS tipi Romen rakamlı ('I', 'II', 'III', 'IV', 'V') dairesel alan işaretçileri
/// - İl veya İşaretçi dokunma olayları (`onProvinceTap`, `onMarkerTap`)
/// - Vektörel CustomPainter ile 60 FPS GPU-accelerated çizim
class TurkeyMap extends StatelessWidget {
  /// Harita boyama ve işaretçi ayarları
  final TurkeyMapConfig config;

  /// Bir ile dokunulduğunda tetiklenir (parametre: 'adana', 'ankara' gibi il id'si)
  final ValueChanged<String>? onProvinceTap;

  /// Bir dairesel işaretçiye dokunulduğunda tetiklenir
  final ValueChanged<TurkeyMapMarker>? onMarkerTap;

  /// Arka plan dolgusu (null ise şeffaf)
  final Color? backgroundColor;

  /// Haritanın kenarlık payı (Padding)
  final EdgeInsetsGeometry padding;

  const TurkeyMap({
    super.key,
    this.config = const TurkeyMapConfig(),
    this.onProvinceTap,
    this.onMarkerTap,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(4.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Varsayılan zemin ve çizgi renkleri (Açık temada yüksek kontrastlı belirgin tonlar)
    final defaultBaseFill = config.baseFillColor ??
        (isDark ? const Color(0xFF334155) : const Color(0xFFC8D7E6));
    final defaultStrokeColor =
        config.strokeColor ?? (isDark ? const Color(0xFF475569) : Colors.white);

    return AspectRatio(
      aspectRatio: TurkeyMapConstants.aspectRatio,
      child: Padding(
        padding: padding,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final canvasWidth = constraints.maxWidth;
            final canvasHeight = canvasWidth / TurkeyMapConstants.aspectRatio;

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (details) =>
                  _handleTap(details.localPosition, canvasWidth, canvasHeight),
              child: CustomPaint(
                size: Size(canvasWidth, canvasHeight),
                painter: _TurkeyMapPainter(
                  config: config,
                  baseFillColor: defaultBaseFill,
                  strokeColor: defaultStrokeColor,
                  isDark: isDark,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleTap(Offset localPos, double canvasWidth, double canvasHeight) {
    if (onProvinceTap == null && onMarkerTap == null) return;

    final scaleX = canvasWidth / TurkeyMapConstants.originalWidth;
    final scaleY = canvasHeight / TurkeyMapConstants.originalHeight;
    final origPoint = Offset(localPos.dx / scaleX, localPos.dy / scaleY);

    // 1. Önce marker tıklamalarını kontrol et (küçük hit alanı)
    if (onMarkerTap != null) {
      for (final marker in config.markers.reversed) {
        final dist = (origPoint - marker.offset).distance;
        // Dokunmayı kolaylaştırmak için hit-alanını 1.5 katı al
        if (dist <= marker.radius * 1.5) {
          onMarkerTap!(marker);
          return;
        }
      }
    }

    // 2. İl sınırlarını kontrol et
    if (onProvinceTap != null) {
      for (final prov in TurkeyMapData.provinces.values) {
        final path = TurkeySvgParser.parse(prov.pathData);
        if (path.contains(origPoint)) {
          onProvinceTap!(prov.id);
          return;
        }
      }
    }
  }
}

/// Haritayı Canvas üzerine çizen yüksek performanslı CustomPainter
class _TurkeyMapPainter extends CustomPainter {
  final TurkeyMapConfig config;
  final Color baseFillColor;
  final Color strokeColor;
  final bool isDark;

  _TurkeyMapPainter({
    required this.config,
    required this.baseFillColor,
    required this.strokeColor,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / TurkeyMapConstants.originalWidth;
    final scaleY = size.height / TurkeyMapConstants.originalHeight;

    canvas.save();
    canvas.scale(scaleX, scaleY);

    // Boyama araçları
    final fillPaint = Paint()..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = strokeColor
      ..strokeWidth = config.strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // 1. Önce standart (vurgulanmamış) illeri çiz
    final highlightedList = <(ProvinceData, Color)>[];

    for (final prov in TurkeyMapData.provinces.values) {
      Color? specialColor;
      if (config.selectedProvinceId == prov.id) {
        specialColor = const Color(0xFF4F46E5); // Academic Indigo
      } else if (config.highlightedProvinces.containsKey(prov.id)) {
        specialColor = config.highlightedProvinces[prov.id]!;
      } else if (config.highlightedRegions.containsKey(prov.region)) {
        specialColor = config.highlightedRegions[prov.region]!;
      }

      if (specialColor != null) {
        highlightedList.add((prov, specialColor));
      } else {
        final path = TurkeySvgParser.parse(prov.pathData);
        fillPaint.color = baseFillColor;
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
      }
    }

    // 2. Vurgulanmış illeri üst katmanda çiz (Sınır çizgileri komşular tarafından ezilmez)
    final highlightStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = config.strokeWidth + 0.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (final item in highlightedList) {
      final path = TurkeySvgParser.parse(item.$1.pathData);
      fillPaint.color = item.$2;
      canvas.drawPath(path, fillPaint);
      canvas.drawPath(path, highlightStrokePaint);
    }

    // 2. Dairesel İşaretçileri (Markers) Çiz
    for (final marker in config.markers) {
      _drawMarker(canvas, marker);
    }

    canvas.restore();
  }

  void _drawMarker(Canvas canvas, TurkeyMapMarker marker) {
    final center = marker.offset;
    final radius = marker.radius;

    // Gölge efekti
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.5);
    canvas.drawCircle(center.translate(0, 1.5), radius, shadowPaint);

    // Daire Zemin Dolgusu (Varsayılan Koyu Lacivert/Slate #1E293B)
    final markerBg =
        marker.backgroundColor ??
        (config.selectedMarkerId == marker.id
            ? const Color(0xFFD97706) // Achievement Gold
            : const Color(0xFF1E293B));
    final circlePaint = Paint()
      ..color = markerBg
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, circlePaint);

    // Daire Beyaz Kenarlık
    final borderPaint = Paint()
      ..color = marker.borderColor ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;
    canvas.drawCircle(center, radius, borderPaint);

    // Romen Rakamı veya Metin Etiketi
    final textStyle = TextStyle(
      color: marker.textColor ?? Colors.white,
      fontSize: radius * 0.95,
      fontWeight: FontWeight.w800,
      fontFamily: 'Inter',
      letterSpacing: -0.5,
    );

    final textSpan = TextSpan(text: marker.label, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textOffset = Offset(
      center.dx - (textPainter.width / 2),
      center.dy - (textPainter.height / 2),
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant _TurkeyMapPainter oldDelegate) {
    return oldDelegate.config != config ||
        oldDelegate.baseFillColor != baseFillColor ||
        oldDelegate.strokeColor != strokeColor ||
        oldDelegate.isDark != isDark;
  }
}
