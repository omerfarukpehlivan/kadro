import 'package:flutter/material.dart';

import 'population_pyramid_models.dart';

/// KPSS Nüfus Piramidini (Yaş ve Cinsiyet Dağılımı) çizen vektörel CustomPainter
class PopulationPyramidPainter extends CustomPainter {
  final PopulationPyramidConfig config;
  final bool isDark;

  const PopulationPyramidPainter({required this.config, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    const labelColW = 42.0;
    const topMargin = 22.0;
    const bottomMargin = 22.0;

    final sideW = (w - labelColW - 16) / 2.0;
    final chartH = h - topMargin - bottomMargin;

    final groups = config.ageGroups;
    if (groups.isEmpty) return;

    final rowH = chartH / groups.length;
    const maxVal = 4.5; // Maksimum yüzde skalası (%4.5)

    const maleColor = Color(0xFF2563EB);
    const femaleColor = Color(0xFFE11D48);

    // 1. Üst Cinsiyet Başlıkları
    _drawText(
      canvas,
      '♂ Erkek (%)',
      Offset(sideW * 0.50, 8),
      maleColor,
      10,
      FontWeight.bold,
      TextAlign.center,
    );
    _drawText(
      canvas,
      '♀ Kadın (%)',
      Offset(w - sideW * 0.50, 8),
      femaleColor,
      10,
      FontWeight.bold,
      TextAlign.center,
    );

    // 2. Kılavuz Çizgileri (%1, %2, %3, %4)
    final gridPaint = Paint()
      ..color = isDark ? Colors.white10 : Colors.black12
      ..strokeWidth = 0.8;

    for (var pct = 1.0; pct <= 4.0; pct += 1.0) {
      final ratio = pct / maxVal;
      // Sol kılavuz (Erkek)
      final leftX = sideW * (1.0 - ratio);
      canvas.drawLine(
        Offset(leftX, topMargin),
        Offset(leftX, h - bottomMargin),
        gridPaint,
      );
      _drawText(
        canvas,
        '$pct%',
        Offset(leftX, h - bottomMargin + 6),
        isDark ? Colors.grey : const Color(0xFF64748B),
        8,
        FontWeight.normal,
        TextAlign.center,
      );

      // Sağ kılavuz (Kadın)
      final rightX = w - sideW + sideW * ratio;
      canvas.drawLine(
        Offset(rightX, topMargin),
        Offset(rightX, h - bottomMargin),
        gridPaint,
      );
      _drawText(
        canvas,
        '$pct%',
        Offset(rightX, h - bottomMargin + 6),
        isDark ? Colors.grey : const Color(0xFF64748B),
        8,
        FontWeight.normal,
        TextAlign.center,
      );
    }

    // Orta çizgi
    canvas.drawLine(
      Offset(sideW + labelColW / 2, topMargin),
      Offset(sideW + labelColW / 2, h - bottomMargin),
      Paint()
        ..color = isDark ? Colors.white24 : Colors.black26
        ..strokeWidth = 1.0,
    );

    // 3. Yaş Grupları Barları
    for (var i = 0; i < groups.length; i++) {
      final g = groups[i];
      final y = topMargin + i * rowH;
      final barH = rowH * 0.72;
      final barY = y + (rowH - barH) / 2.0;

      // Sol Bar (Erkek - Sağa dayalı)
      final maleBarW = (g.malePercent / maxVal).clamp(0.0, 1.0) * sideW;
      final maleRect = Rect.fromLTWH(sideW - maleBarW, barY, maleBarW, barH);
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          maleRect,
          topLeft: const Radius.circular(2),
          bottomLeft: const Radius.circular(2),
        ),
        Paint()..color = maleColor,
      );

      // Sağ Bar (Kadın - Sola dayalı)
      final femaleBarW = (g.femalePercent / maxVal).clamp(0.0, 1.0) * sideW;
      final femaleRect = Rect.fromLTWH(w - sideW, barY, femaleBarW, barH);
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          femaleRect,
          topRight: const Radius.circular(2),
          bottomRight: const Radius.circular(2),
        ),
        Paint()..color = femaleColor,
      );

      // Orta Yaş Grubu Etiketi (80+, 75-79, ...)
      _drawText(
        canvas,
        g.label,
        Offset(sideW + labelColW / 2, y + rowH / 2),
        isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155),
        7.5,
        FontWeight.w700,
        TextAlign.center,
      );
    }

    // 4. Yaş Kuşakları Göstergesi (Sol Taraf: 65+ Yaşlı, 15-64 Aktif, 0-14 Çocuk)
    // 0..3: 65+ (4 grup), 4..13: 15-64 (10 grup), 14..16: 0-14 (3 grup)
    const elderlyTop = topMargin;
    final elderlyH = 4 * rowH;
    final workingTop = topMargin + elderlyH;
    final workingH = 10 * rowH;
    final childTop = workingTop + workingH;
    final childH = 3 * rowH;

    _drawSideBracket(
      canvas,
      2,
      elderlyTop,
      elderlyH,
      '65+ Yaşlı',
      const Color(0xFFDC2626),
    );
    _drawSideBracket(
      canvas,
      2,
      workingTop,
      workingH,
      '15-64 Aktif',
      const Color(0xFF0284C7),
    );
    _drawSideBracket(
      canvas,
      2,
      childTop,
      childH,
      '0-14 Çocuk',
      const Color(0xFF059669),
    );
  }

  void _drawSideBracket(
    Canvas canvas,
    double x,
    double y,
    double h,
    String label,
    Color color,
  ) {
    canvas.drawLine(
      Offset(x, y + 2),
      Offset(x, y + h - 2),
      Paint()
        ..color = color
        ..strokeWidth = 2,
    );
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset center,
    Color color,
    double size,
    FontWeight weight,
    TextAlign align,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          fontFamily: 'Inter',
        ),
      ),
      textAlign: align,
      textDirection: TextDirection.ltr,
    )..layout();

    double x = center.dx;
    if (align == TextAlign.center) {
      x -= tp.width / 2.0;
    } else if (align == TextAlign.right) {
      x -= tp.width;
    }

    final y = center.dy - tp.height / 2.0;
    tp.paint(canvas, Offset(x, y));
  }

  @override
  bool shouldRepaint(covariant PopulationPyramidPainter oldDelegate) {
    return oldDelegate.config != config || oldDelegate.isDark != isDark;
  }
}
