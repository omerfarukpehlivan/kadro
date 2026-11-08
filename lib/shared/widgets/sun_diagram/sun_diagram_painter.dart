import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'sun_diagram_models.dart';

/// KPSS Güneş Açısı, Dönenceler ve Gölge Boyu Şemalarını çizen CustomPainter
class SunDiagramPainter extends CustomPainter {
  final SunDiagramConfig config;
  final bool isDark;

  const SunDiagramPainter({required this.config, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    switch (config.type) {
      case SunDiagramType.haziran21:
        _paintSolstice(canvas, size, isJune: true);
        break;
      case SunDiagramType.aralik21:
        _paintSolstice(canvas, size, isJune: false);
        break;
      case SunDiagramType.ekinoks:
        _paintEkinoks(canvas, size);
        break;
      case SunDiagramType.golgeYonu:
        _paintGolgeYonu(canvas, size);
        break;
    }
  }

  // ---------------------------------------------------------------------------
  // 1 & 2. GÜNDÖNÜMLERİ (21 Haziran & 21 Aralık)
  // ---------------------------------------------------------------------------
  void _paintSolstice(Canvas canvas, Size size, {required bool isJune}) {
    final w = size.width;
    final h = size.height;

    final globeCenter = Offset(w * 0.40, h * 0.50);
    final globeR = h * 0.38;

    // Dünya Küresi
    final oceanColor = isDark
        ? const Color(0xFF0F2B48)
        : const Color(0xFFE0F2FE);
    final darkHemisphere = isDark
        ? Colors.black.withValues(alpha: 0.5)
        : const Color(0xFF64748B).withValues(alpha: 0.35);

    canvas.drawCircle(globeCenter, globeR, Paint()..color = oceanColor);

    // Eksen Eğikliği Çizgisi (23.5° Eğik)
    final tiltAngle = isJune ? -0.41 : 0.41; // radyan (~23.5 derece)
    final axisPaint = Paint()
      ..color = isDark ? Colors.white38 : Colors.black38
      ..strokeWidth = 1.5;
    final pAxisTop = Offset(
      globeCenter.dx + (globeR + 14) * math.sin(tiltAngle),
      globeCenter.dy - (globeR + 14) * math.cos(tiltAngle),
    );
    final pAxisBottom = Offset(
      globeCenter.dx - (globeR + 14) * math.sin(tiltAngle),
      globeCenter.dy + (globeR + 14) * math.cos(tiltAngle),
    );
    canvas.drawLine(pAxisTop, pAxisBottom, axisPaint);

    _drawText(
      canvas,
      'KKP',
      pAxisTop + const Offset(0, -8),
      isDark ? Colors.white70 : Colors.black87,
      8.5,
      FontWeight.bold,
    );
    _drawText(
      canvas,
      'GKP',
      pAxisBottom + const Offset(0, 8),
      isDark ? Colors.white70 : Colors.black87,
      8.5,
      FontWeight.bold,
    );

    // Ekvator Çizgisi (Eksen çizgisine 90° dik)
    final eqPaint = Paint()
      ..color = isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7)
      ..strokeWidth = 1.2;
    canvas.drawLine(
      Offset(
        globeCenter.dx - globeR * math.cos(tiltAngle),
        globeCenter.dy - globeR * math.sin(tiltAngle),
      ),
      Offset(
        globeCenter.dx + globeR * math.cos(tiltAngle),
        globeCenter.dy + globeR * math.sin(tiltAngle),
      ),
      eqPaint,
    );

    // Aydınlanma Çemberi (Karanlık Yarıçapı)
    final darkPath = Path();
    if (isJune) {
      // 21 Haziran: Sol taraf karanlık, sağ taraf Güneş
      darkPath.addArc(
        Rect.fromCircle(center: globeCenter, radius: globeR),
        math.pi * 0.5,
        math.pi,
      );
      darkPath.close();
    } else {
      // 21 Aralık: Sağ taraf aydınlık, sol taraf karanlık
      darkPath.addArc(
        Rect.fromCircle(center: globeCenter, radius: globeR),
        -math.pi * 0.5,
        math.pi,
      );
      darkPath.close();
    }
    canvas.drawPath(darkPath, Paint()..color = darkHemisphere);

    // Dünya Çember Sınırı
    canvas.drawCircle(
      globeCenter,
      globeR,
      Paint()
        ..color = isDark ? Colors.white24 : Colors.black26
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Güneş Işınları (Sağdan Gelen Sarı/Altın Işınlar)
    final rayPaint = Paint()
      ..color = const Color(0xFFF59E0B)
      ..strokeWidth = 2.0;
    final rayStartX = w * 0.94;
    final targetY = isJune
        ? globeCenter.dy - globeR * 0.38
        : globeCenter.dy + globeR * 0.38;

    for (var i = -2; i <= 2; i++) {
      final ry = targetY + i * 16.0;
      canvas.drawLine(
        Offset(rayStartX, ry),
        Offset(globeCenter.dx + globeR + 4, ry),
        rayPaint,
      );
      // Ok başı
      canvas.drawLine(
        Offset(globeCenter.dx + globeR + 10, ry - 3),
        Offset(globeCenter.dx + globeR + 4, ry),
        rayPaint,
      );
      canvas.drawLine(
        Offset(globeCenter.dx + globeR + 10, ry + 3),
        Offset(globeCenter.dx + globeR + 4, ry),
        rayPaint,
      );
    }

    _drawBadge(
      canvas,
      isJune
          ? '☀️ 21 Haziran: Yengeç Dönencesi Dik'
          : '☀️ 21 Aralık: Oğlak Dönencesi Dik',
      Offset(w * 0.50, h * 0.12),
      const Color(0xFFD97706),
    );

    // Bilgi Kutucuğu (Sağ Alt)
    if (isJune) {
      _drawBadge(
        canvas,
        'Sinop: 15 sa 15 dk (En Uzun)',
        Offset(w * 0.72, h * 0.76),
        const Color(0xFF2563EB),
      );
      _drawBadge(
        canvas,
        'Hatay: 14 sa 40 dk',
        Offset(w * 0.72, h * 0.88),
        const Color(0xFF059669),
      );
    } else {
      _drawBadge(
        canvas,
        'Sinop: 15 sa 10 dk GECE (En Uzun)',
        Offset(w * 0.72, h * 0.76),
        const Color(0xFFDC2626),
      );
      _drawBadge(
        canvas,
        'Hatay: 14 sa 30 dk Gece',
        Offset(w * 0.72, h * 0.88),
        const Color(0xFF059669),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // 3. EKİNOKS (21 Mart & 23 Eylül)
  // ---------------------------------------------------------------------------
  void _paintEkinoks(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final globeCenter = Offset(w * 0.40, h * 0.50);
    final globeR = h * 0.38;

    // Dünya Küresi
    final oceanColor = isDark
        ? const Color(0xFF0F2B48)
        : const Color(0xFFE0F2FE);
    final darkHemisphere = isDark
        ? Colors.black.withValues(alpha: 0.5)
        : const Color(0xFF64748B).withValues(alpha: 0.35);

    canvas.drawCircle(globeCenter, globeR, Paint()..color = oceanColor);

    // Ekinoks: Eksen Düz, Aydınlanma çizgisi tam kutup noktalarından geçer
    final axisPaint = Paint()
      ..color = isDark ? Colors.white38 : Colors.black38
      ..strokeWidth = 1.5;
    canvas.drawLine(
      Offset(globeCenter.dx, globeCenter.dy - globeR - 14),
      Offset(globeCenter.dx, globeCenter.dy + globeR + 14),
      axisPaint,
    );

    _drawText(
      canvas,
      'Kutup (N)',
      Offset(globeCenter.dx, globeCenter.dy - globeR - 18),
      isDark ? Colors.white70 : Colors.black87,
      8.5,
      FontWeight.bold,
    );
    _drawText(
      canvas,
      'Kutup (S)',
      Offset(globeCenter.dx, globeCenter.dy + globeR + 18),
      isDark ? Colors.white70 : Colors.black87,
      8.5,
      FontWeight.bold,
    );

    // Ekvator Çizgisi (Güneş Işınları Ekvator'a 90° Dik)
    canvas.drawLine(
      Offset(globeCenter.dx - globeR, globeCenter.dy),
      Offset(globeCenter.dx + globeR, globeCenter.dy),
      Paint()
        ..color = const Color(0xFF0284C7)
        ..strokeWidth = 1.8,
    );

    // Sol Yarı Karanlık
    final darkPath = Path()
      ..addArc(
        Rect.fromCircle(center: globeCenter, radius: globeR),
        math.pi * 0.5,
        math.pi,
      )
      ..close();
    canvas.drawPath(darkPath, Paint()..color = darkHemisphere);

    // Çember
    canvas.drawCircle(
      globeCenter,
      globeR,
      Paint()
        ..color = isDark ? Colors.white24 : Colors.black26
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Güneş Işınları
    final rayPaint = Paint()
      ..color = const Color(0xFFF59E0B)
      ..strokeWidth = 2.0;
    for (var i = -2; i <= 2; i++) {
      final ry = globeCenter.dy + i * 16.0;
      canvas.drawLine(
        Offset(w * 0.94, ry),
        Offset(globeCenter.dx + globeR + 4, ry),
        rayPaint,
      );
    }

    _drawBadge(
      canvas,
      '☀️ Ekinoks: Ekvator'
      'a Dik (90°)',
      Offset(w * 0.50, h * 0.12),
      const Color(0xFFD97706),
    );
    _drawBadge(
      canvas,
      'Gece = Gündüz (12 Saat Eşit)',
      Offset(w * 0.72, h * 0.78),
      const Color(0xFF2563EB),
    );
    _drawBadge(
      canvas,
      'Aynı Meridyende Güneş Aynı Anda Doğar',
      Offset(w * 0.72, h * 0.90),
      const Color(0xFF059669),
    );
  }

  // ---------------------------------------------------------------------------
  // 4. GÖLGE YÖNÜ VE BOYU (Türkiye'de Öğle Vakti Gölge Daima Kuzeydir)
  // ---------------------------------------------------------------------------
  void _paintGolgeYonu(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final groundY = h * 0.72;
    final stickX = w * 0.48;
    final stickH = h * 0.38;

    // Zemin
    final groundPaint = Paint()
      ..color = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)
      ..strokeWidth = 2;
    canvas.drawLine(Offset(16, groundY), Offset(w - 16, groundY), groundPaint);

    // Çubuk (Dikey Cisim)
    final stickPaint = Paint()
      ..color = isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(stickX, groundY),
      Offset(stickX, groundY - stickH),
      stickPaint,
    );
    _drawText(
      canvas,
      'Gölge Çubuğu',
      Offset(stickX, groundY - stickH - 12),
      isDark ? Colors.white : const Color(0xFF1E293B),
      9.0,
      FontWeight.bold,
    );

    // Güneş (Güneyde Yer Alır - Sol Üst Açıda)
    final sunCenter = Offset(w * 0.18, h * 0.24);
    canvas.drawCircle(sunCenter, 14, Paint()..color = const Color(0xFFF59E0B));
    _drawText(
      canvas,
      'GÜNEY (Öğle Güneşi)',
      sunCenter + const Offset(0, -20),
      const Color(0xFFD97706),
      9.5,
      FontWeight.bold,
    );

    // Güneş Işını (Güneşten çubuğun tepesine ve zemine uzanan ışın)
    final rayPaint = Paint()
      ..color = const Color(0xFFF59E0B).withValues(alpha: 0.8)
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;
    canvas.drawLine(sunCenter, Offset(stickX, groundY - stickH), rayPaint);
    // Zemin kesişimi
    final shadowEnd = Offset(w * 0.84, groundY);
    canvas.drawLine(Offset(stickX, groundY - stickH), shadowEnd, rayPaint);

    // Gölge (Zeminde KUZEYE Doğru Uzanır - Sağ Tarafa)
    final shadowPaint = Paint()
      ..color = isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7)
      ..strokeWidth = 4.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(stickX, groundY), shadowEnd, shadowPaint);

    _drawBadge(
      canvas,
      '★ GÖLGE (KUZEYE Uzanır)',
      Offset((stickX + shadowEnd.dx) / 2, groundY + 14),
      const Color(0xFF0284C7),
    );
    _drawText(
      canvas,
      'KUZEY →',
      Offset(w * 0.88, groundY + 14),
      isDark ? Colors.white70 : Colors.black87,
      10,
      FontWeight.bold,
    );

    // Üst Kural Rozeti
    _drawBadge(
      canvas,
      'Kural: Türkiye'
      'de Öğle Vakti Gölge Daima KUZEYİ Gösterir!',
      Offset(w * 0.50, h * 0.10),
      const Color(0xFFDC2626),
    );
  }

  void _drawBadge(Canvas canvas, String text, Offset center, Color color) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final rect = Rect.fromCenter(
      center: center,
      width: tp.width + 12,
      height: tp.height + 6,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(5)),
      Paint()..color = color,
    );
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset center,
    Color color,
    double size,
    FontWeight weight,
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
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant SunDiagramPainter oldDelegate) {
    return oldDelegate.config != config || oldDelegate.isDark != isDark;
  }
}
