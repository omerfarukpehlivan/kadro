import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'climate_chart_models.dart';

/// KPSS Coğrafya iklim grafiğini (Hythergraph) çizen yüksek performanslı CustomPainter.
/// Sol eksende Yağış (mm - mavi sütunlar), sağ eksende Sıcaklık (°C - kırmızı çizgi).
class ClimateChartPainter extends CustomPainter {
  final ClimateChartConfig config;
  final bool isDark;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color gridLineColor;

  const ClimateChartPainter({
    required this.config,
    required this.isDark,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.gridLineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (config.monthlyData.isEmpty) return;

    // Kenar boşlukları (Eksen etiketleri ve ay isimleri için)
    const leftMargin = 38.0;
    const rightMargin = 38.0;
    const topMargin = 20.0;
    const bottomMargin = 26.0;

    final chartWidth = size.width - leftMargin - rightMargin;
    final chartHeight = size.height - topMargin - bottomMargin;

    if (chartWidth <= 0 || chartHeight <= 0) return;

    // 1. Dinamik Ölçek Hesaplama
    var maxPrecip = 100.0;
    var minTemp = 0.0;
    var maxTemp = 30.0;

    for (final p in config.monthlyData) {
      if (p.precipitation > maxPrecip) maxPrecip = p.precipitation;
      if (p.temperature < minTemp) minTemp = p.temperature;
      if (p.temperature > maxTemp) maxTemp = p.temperature;
    }

    // Yağış üst sınırını 50 veya 100'ün katına yuvarla
    final targetMaxPrecip =
        config.maxPrecipitationOverride ??
        ((maxPrecip / 50.0).ceil() * 50.0).clamp(100.0, 400.0);

    // Sıcaklık sınırlarını 5 veya 10'un katına yuvarla
    final targetMinTemp = minTemp < 0 ? (minTemp / 5.0).floor() * 5.0 : 0.0;
    final targetMaxTemp = ((maxTemp + 3) / 5.0).ceil() * 5.0;
    final tempRange = targetMaxTemp - targetMinTemp;

    // 2. Kılavuz Çizgileri ve Eksen Etiketleri (5 Yatay Seviye)
    final gridPaint = Paint()
      ..color = gridLineColor
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    const gridSteps = 4;
    for (var i = 0; i <= gridSteps; i++) {
      final ratio = i / gridSteps;
      final y = topMargin + chartHeight * (1.0 - ratio);

      // Kılavuz çizgisi
      canvas.drawLine(
        Offset(leftMargin, y),
        Offset(size.width - rightMargin, y),
        gridPaint,
      );

      // Sol Y-Ekseni (Yağış - mm)
      final precipVal = (targetMaxPrecip * ratio).round();
      _drawText(
        canvas: canvas,
        text: '$precipVal',
        offset: Offset(leftMargin - 6, y),
        color: const Color(0xFF2563EB),
        fontSize: 10,
        fontWeight: FontWeight.w600,
        align: TextAlign.right,
      );

      // Sağ Y-Ekseni (Sıcaklık - °C)
      final tempVal = (targetMinTemp + tempRange * ratio).round();
      _drawText(
        canvas: canvas,
        text: '$tempVal°',
        offset: Offset(size.width - rightMargin + 6, y),
        color: const Color(0xFFDC2626),
        fontSize: 10,
        fontWeight: FontWeight.w600,
        align: TextAlign.left,
      );
    }

    // 3. Sıfır Derece Don Çizgisi (Eğer sıcaklık eksiye düşüyorsa vurgula)
    if (targetMinTemp < 0 && targetMaxTemp > 0) {
      final zeroRatio = (0.0 - targetMinTemp) / tempRange;
      final zeroY = topMargin + chartHeight * (1.0 - zeroRatio);

      final zeroLinePaint = Paint()
        ..color = const Color(0xFF3B82F6).withValues(alpha: 0.6)
        ..strokeWidth = 1.2
        ..style = PaintingStyle.stroke;

      // Kesikli çizgi
      var startX = leftMargin;
      while (startX < size.width - rightMargin) {
        canvas.drawLine(
          Offset(startX, zeroY),
          Offset(math.min(startX + 4, size.width - rightMargin), zeroY),
          zeroLinePaint,
        );
        startX += 8;
      }

      // "0°C Don Sınırı" etiketi
      _drawText(
        canvas: canvas,
        text: '0°C Don',
        offset: Offset(leftMargin + 4, zeroY - 11),
        color: const Color(0xFF3B82F6),
        fontSize: 8.5,
        fontWeight: FontWeight.bold,
        align: TextAlign.left,
      );
    }

    // 4. Aylık Yağış Sütunları (Mavi Bar Chart)
    final slotWidth = chartWidth / 12.0;
    final barWidth = slotWidth * 0.58;

    final tempPoints = <Offset>[];

    for (var i = 0; i < 12 && i < config.monthlyData.length; i++) {
      final point = config.monthlyData[i];
      final slotCenterX = leftMargin + (i + 0.5) * slotWidth;

      // Bar hesaplama
      final precipRatio = (point.precipitation / targetMaxPrecip).clamp(
        0.0,
        1.0,
      );
      final barHeight = chartHeight * precipRatio;
      final barLeft = slotCenterX - barWidth / 2.0;
      final barTop = topMargin + chartHeight - barHeight;

      final barRect = Rect.fromLTWH(barLeft, barTop, barWidth, barHeight);

      // Gradyan dolgu
      final barPaint = Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
        ).createShader(barRect);

      final rrect = RRect.fromRectAndCorners(
        barRect,
        topLeft: const Radius.circular(2.5),
        topRight: const Radius.circular(2.5),
      );
      canvas.drawRRect(rrect, barPaint);

      // Sıcaklık noktası hesaplama
      final tempRatio = ((point.temperature - targetMinTemp) / tempRange).clamp(
        0.0,
        1.0,
      );
      final tempY = topMargin + chartHeight * (1.0 - tempRatio);
      tempPoints.add(Offset(slotCenterX, tempY));

      // Alt X-Ekseni Ay İsmi
      _drawText(
        canvas: canvas,
        text: point.label,
        offset: Offset(slotCenterX, size.height - bottomMargin + 6),
        color: secondaryTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        align: TextAlign.center,
      );
    }

    // 5. Sıcaklık Eğrisi (Kırmızı / Kızıl Spline & Çizgi)
    if (tempPoints.length > 1) {
      final linePaint = Paint()
        ..color = const Color(0xFFEF4444)
        ..strokeWidth = 2.4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      final path = Path();
      path.moveTo(tempPoints[0].dx, tempPoints[0].dy);

      for (var i = 0; i < tempPoints.length - 1; i++) {
        final p0 = tempPoints[i];
        final p1 = tempPoints[i + 1];
        final midX = (p0.dx + p1.dx) / 2.0;
        path.cubicTo(midX, p0.dy, midX, p1.dy, p1.dx, p1.dy);
      }

      canvas.drawPath(path, linePaint);

      // Sıcaklık Veri Noktaları (Kırmızı daire + beyaz halka)
      final nodeFillPaint = Paint()
        ..color = const Color(0xFFDC2626)
        ..style = PaintingStyle.fill;
      final nodeBorderPaint = Paint()
        ..color = isDark ? const Color(0xFF1E293B) : Colors.white
        ..strokeWidth = 1.4
        ..style = PaintingStyle.stroke;

      for (final p in tempPoints) {
        canvas.drawCircle(p, 3.8, nodeFillPaint);
        canvas.drawCircle(p, 3.8, nodeBorderPaint);
      }
    }

    // 6. Eksen Başlıkları (Sol Üst: Yağış (mm), Sağ Üst: Sıcaklık (°C))
    _drawText(
      canvas: canvas,
      text: 'mm',
      offset: const Offset(leftMargin - 2, 4),
      color: const Color(0xFF2563EB),
      fontSize: 9,
      fontWeight: FontWeight.w800,
      align: TextAlign.left,
    );

    _drawText(
      canvas: canvas,
      text: '°C',
      offset: Offset(size.width - rightMargin + 2, 4),
      color: const Color(0xFFDC2626),
      fontSize: 9,
      fontWeight: FontWeight.w800,
      align: TextAlign.right,
    );
  }

  void _drawText({
    required Canvas canvas,
    required String text,
    required Offset offset,
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    required TextAlign align,
  }) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Inter',
        ),
      ),
      textAlign: align,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    double x = offset.dx;
    if (align == TextAlign.center) {
      x -= tp.width / 2.0;
    } else if (align == TextAlign.right) {
      x -= tp.width;
    }

    final y = offset.dy - tp.height / 2.0;
    tp.paint(canvas, Offset(x, y));
  }

  @override
  bool shouldRepaint(covariant ClimateChartPainter oldDelegate) {
    return oldDelegate.config != config ||
        oldDelegate.isDark != isDark ||
        oldDelegate.primaryTextColor != primaryTextColor ||
        oldDelegate.secondaryTextColor != secondaryTextColor ||
        oldDelegate.gridLineColor != gridLineColor;
  }
}
