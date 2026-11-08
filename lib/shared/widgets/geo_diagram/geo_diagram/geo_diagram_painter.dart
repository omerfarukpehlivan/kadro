import 'package:flutter/material.dart';

import 'geo_diagram_models.dart';

/// KPSS Jeomorfoloji ve Yer Şekilleri kesitlerini çizen vektörel CustomPainter
class GeoDiagramPainter extends CustomPainter {
  final GeoDiagramConfig config;
  final bool isDark;

  const GeoDiagramPainter({required this.config, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    switch (config.type) {
      case GeoDiagramType.horstGraben:
        _paintHorstGraben(canvas, size);
        break;
      case GeoDiagramType.antiklinalSenklinal:
        _paintAntiklinalSenklinal(canvas, size);
        break;
      case GeoDiagramType.vadiTipleri:
        _paintVadiTipleri(canvas, size);
        break;
      case GeoDiagramType.karstikKesit:
        _paintKarstikKesit(canvas, size);
        break;
      case GeoDiagramType.tombolo:
        _paintTombolo(canvas, size);
        break;
    }
  }

  // ---------------------------------------------------------------------------
  // 1. HORST - GRABEN BLOK KESİTİ (Ege Kırık Sistemi)
  // ---------------------------------------------------------------------------
  void _paintHorstGraben(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final leftHorstW = w * 0.32;
    final rightHorstW = w * 0.32;
    final grabenW = w - leftHorstW - rightHorstW;

    final horstTop = h * 0.22;
    final grabenTop = h * 0.52;
    final bottomY = h * 0.90;

    // Renk paleti
    final soilColor = isDark
        ? const Color(0xFF334155)
        : const Color(0xFFCBD5E1);
    final rockColor = isDark
        ? const Color(0xFF1E293B)
        : const Color(0xFF94A3B8);
    final deepColor = isDark
        ? const Color(0xFF0F172A)
        : const Color(0xFF64748B);
    final faultColor = const Color(0xFFEF4444);

    // Sol Horst Bloğu
    final leftPath = Path()
      ..moveTo(0, horstTop)
      ..lineTo(leftHorstW - 12, horstTop)
      ..lineTo(leftHorstW + 12, bottomY)
      ..lineTo(0, bottomY)
      ..close();
    canvas.drawPath(leftPath, Paint()..color = soilColor);

    // Sol Horst İç Katmanlar (Fay kaymasını göstermek için)
    canvas.drawLine(
      Offset(0, horstTop + 24),
      Offset(leftHorstW - 3, horstTop + 24),
      Paint()
        ..color = rockColor
        ..strokeWidth = 3,
    );
    canvas.drawLine(
      Offset(0, horstTop + 48),
      Offset(leftHorstW + 4, horstTop + 48),
      Paint()
        ..color = deepColor
        ..strokeWidth = 3,
    );

    // Sağ Horst Bloğu
    final rightStartX = w - rightHorstW;
    final rightPath = Path()
      ..moveTo(rightStartX - 12, bottomY)
      ..lineTo(rightStartX + 12, horstTop)
      ..lineTo(w, horstTop)
      ..lineTo(w, bottomY)
      ..close();
    canvas.drawPath(rightPath, Paint()..color = soilColor);

    canvas.drawLine(
      Offset(rightStartX + 4, horstTop + 24),
      Offset(w, horstTop + 24),
      Paint()
        ..color = rockColor
        ..strokeWidth = 3,
    );
    canvas.drawLine(
      Offset(rightStartX - 4, horstTop + 48),
      Offset(w, horstTop + 48),
      Paint()
        ..color = deepColor
        ..strokeWidth = 3,
    );

    // Orta Graben Bloğu (Çöken Tabaka)
    final grabenPath = Path()
      ..moveTo(leftHorstW - 10, grabenTop)
      ..lineTo(rightStartX + 10, grabenTop)
      ..lineTo(rightStartX - 10, bottomY)
      ..lineTo(leftHorstW + 10, bottomY)
      ..close();
    canvas.drawPath(
      grabenPath,
      Paint()
        ..color = isDark ? const Color(0xFF065F46) : const Color(0xFFD1FAE5),
    );

    // Graben İç Katmanlar (Aşağı çökmüş durum)
    canvas.drawLine(
      Offset(leftHorstW - 3, grabenTop + 24),
      Offset(rightStartX + 3, grabenTop + 24),
      Paint()
        ..color = rockColor
        ..strokeWidth = 3,
    );

    // Fay Hatları (Kırmızı Kırık Aynaları)
    final faultPaint = Paint()
      ..color = faultColor
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(leftHorstW - 14, horstTop - 4),
      Offset(leftHorstW + 14, bottomY + 4),
      faultPaint,
    );
    canvas.drawLine(
      Offset(rightStartX + 14, horstTop - 4),
      Offset(rightStartX - 14, bottomY + 4),
      faultPaint,
    );

    // Rozetler & Etiketler
    _drawBadge(
      canvas,
      '▲ HORST',
      Offset(leftHorstW * 0.48, horstTop - 12),
      const Color(0xFFD97706),
    );
    _drawBadge(
      canvas,
      '▲ HORST',
      Offset(w - rightHorstW * 0.48, horstTop - 12),
      const Color(0xFFD97706),
    );
    _drawBadge(
      canvas,
      '▼ GRABEN (Çöken Ova)',
      Offset(w * 0.50, grabenTop - 12),
      const Color(0xFF059669),
    );
    _drawText(
      canvas,
      '⚡ FAY',
      Offset(leftHorstW + 8, (horstTop + grabenTop) / 2 + 10),
      faultColor,
      9.5,
      FontWeight.bold,
    );
    _drawText(
      canvas,
      '⚡ FAY',
      Offset(rightStartX - 8, (horstTop + grabenTop) / 2 + 10),
      faultColor,
      9.5,
      FontWeight.bold,
    );
  }

  // ---------------------------------------------------------------------------
  // 2. ANTİKLİNAL - SENKLİNAL (Alp-Himalaya Kıvrım Sistemi)
  // ---------------------------------------------------------------------------
  void _paintAntiklinalSenklinal(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final baseY = h * 0.50;
    final amp = h * 0.24;

    final pTop = Path();
    final pMid = Path();

    pTop.moveTo(0, baseY);
    pMid.moveTo(0, baseY + 24);

    // Sinüs dalgası: Antiklinal (Tepe), Senklinal (Çukur), Antiklinal (Tepe)
    for (double x = 0; x <= w; x += 4) {
      // 0..w -> 0..2*pi
      final rad = (x / w) * 2.0 * 3.14159;
      // -sin: x=0: 0, x=w/4: -amp (Tepe Antiklinal), x=3w/4: +amp (Çukur Senklinal)
      final y =
          baseY -
          amp *
              (x < w * 0.5
                  ? (x / (w * 0.25) - 1.0 < 0
                        ? -(x / (w * 0.25))
                        : (x - w * 0.5) / (w * 0.25))
                  : 0);
      final sinY = baseY - amp * (rad < 3.14159 ? -1 : 1);
      // Pürüzsüz dalga
      final smoothY =
          baseY -
          amp *
              -((x - w * 0.25) /
                  (w * 0.25) *
                  ((x - w * 0.25) / (w * 0.25) - 1.0));
      // Doğrudan matematiksel sinüs:
      final directY = baseY - amp * (x < w * 0.5 ? -1 : 1);
    }

    // Temiz Bezier Eğrisi ile Antiklinal & Senklinal
    final curvePath = Path();
    curvePath.moveTo(0, baseY);
    // Sol Tepe: Antiklinal (w*0.25, baseY - amp)
    curvePath.cubicTo(
      w * 0.08,
      baseY - amp,
      w * 0.18,
      baseY - amp,
      w * 0.28,
      baseY - amp,
    );
    // Orta Geçiş: Çukur Senklinal (w*0.62, baseY + amp)
    curvePath.cubicTo(
      w * 0.40,
      baseY - amp * 0.5,
      w * 0.48,
      baseY + amp,
      w * 0.62,
      baseY + amp,
    );
    // Sağ Yükseliş: Tekrar Antiklinal
    curvePath.cubicTo(
      w * 0.75,
      baseY + amp,
      w * 0.85,
      baseY - amp * 0.6,
      w,
      baseY - amp * 0.6,
    );

    // Dolgu yolu
    final fillPath = Path.from(curvePath)
      ..lineTo(w, h * 0.90)
      ..lineTo(0, h * 0.90)
      ..close();

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
              : [const Color(0xFFE2E8F0), const Color(0xFF94A3B8)],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );

    // Eğri çizgisi
    canvas.drawPath(
      curvePath,
      Paint()
        ..color = isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7)
        ..strokeWidth = 3.0
        ..style = PaintingStyle.stroke,
    );

    // Yan Basınç Okları
    _drawPressureArrow(
      canvas,
      Offset(8, baseY),
      Offset(36, baseY),
      const Color(0xFFEF4444),
    );
    _drawPressureArrow(
      canvas,
      Offset(w - 8, baseY),
      Offset(w - 36, baseY),
      const Color(0xFFEF4444),
    );
    _drawText(
      canvas,
      'Yan Basınç →',
      Offset(30, baseY - 16),
      const Color(0xFFEF4444),
      8.5,
      FontWeight.bold,
    );
    _drawText(
      canvas,
      '← Yan Basınç',
      Offset(w - 30, baseY - 16),
      const Color(0xFFEF4444),
      8.5,
      FontWeight.bold,
    );

    // Rozetler
    _drawBadge(
      canvas,
      '▲ ANTİKLİNAL (Kuzey Anadolu & Toroslar)',
      Offset(w * 0.26, baseY - amp - 14),
      const Color(0xFF2563EB),
    );
    _drawBadge(
      canvas,
      '▼ SENKLİNAL (Çöküntü Oluğu)',
      Offset(w * 0.62, baseY + amp + 14),
      const Color(0xFFD97706),
    );
  }

  // ---------------------------------------------------------------------------
  // 3. VADİ TİPLERİ KARŞILAŞTIRMASI (Çentik, Boğaz, Kanyon, Menderes)
  // ---------------------------------------------------------------------------
  void _paintVadiTipleri(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final boxW = (w - 18) / 2.0;
    final boxH = (h - 18) / 2.0;

    // Panel 1: Çentik (V) Vadi (Sol Üst)
    _drawVadiBox(
      canvas,
      Rect.fromLTWH(0, 0, boxW, boxH),
      '1. Çentik (V) Vadi',
      () {
        final p = Path()
          ..moveTo(6, 18)
          ..lineTo(boxW * 0.50, boxH - 12)
          ..lineTo(boxW - 6, 18);
        canvas.drawPath(
          p,
          Paint()
            ..color = const Color(0xFF0284C7)
            ..strokeWidth = 2.5
            ..style = PaintingStyle.stroke,
        );
        canvas.drawCircle(
          Offset(boxW * 0.50, boxH - 12),
          4,
          Paint()..color = const Color(0xFF38BDF8),
        );
        _drawText(
          canvas,
          'Derine Aşındırma / Hidroelektrik',
          Offset(boxW * 0.50, boxH - 24),
          const Color(0xFF64748B),
          8.0,
          FontWeight.normal,
        );
      },
    );

    // Panel 2: Boğaz (Yarma) Vadi (Sağ Üst)
    _drawVadiBox(
      canvas,
      Rect.fromLTWH(boxW + 18, 0, boxW, boxH),
      '2. Boğaz (Yarma) Vadi',
      () {
        final leftX = boxW + 18;
        final p = Path()
          ..moveTo(leftX + 12, 18)
          ..lineTo(leftX + 16, boxH - 12)
          ..lineTo(leftX + boxW - 16, boxH - 12)
          ..lineTo(leftX + boxW - 12, 18);
        canvas.drawPath(
          p,
          Paint()
            ..color = const Color(0xFF059669)
            ..strokeWidth = 2.5
            ..style = PaintingStyle.stroke,
        );
        _drawText(
          canvas,
          'Ulaşım Geçidi (Doğal Boğaz)',
          Offset(leftX + boxW * 0.50, boxH - 24),
          const Color(0xFF64748B),
          8.0,
          FontWeight.normal,
        );
      },
    );

    // Panel 3: Kanyon Vadi (Sol Alt)
    _drawVadiBox(
      canvas,
      Rect.fromLTWH(0, boxH + 18, boxW, boxH),
      '3. Kanyon Vadi (Karstik)',
      () {
        final topY = boxH + 18;
        final p = Path()
          ..moveTo(6, topY + 12)
          ..lineTo(boxW * 0.25, topY + 12)
          ..lineTo(boxW * 0.25, topY + 24)
          ..lineTo(boxW * 0.42, topY + 24)
          ..lineTo(boxW * 0.42, topY + boxH - 10)
          ..lineTo(boxW * 0.58, topY + boxH - 10)
          ..lineTo(boxW * 0.58, topY + 24)
          ..lineTo(boxW * 0.75, topY + 24)
          ..lineTo(boxW * 0.75, topY + 12)
          ..lineTo(boxW - 6, topY + 12);
        canvas.drawPath(
          p,
          Paint()
            ..color = const Color(0xFFD97706)
            ..strokeWidth = 2.0
            ..style = PaintingStyle.stroke,
        );
        _drawText(
          canvas,
          'Basamaklı Karstik Yamaçlar',
          Offset(boxW * 0.50, topY + boxH - 22),
          const Color(0xFF64748B),
          8.0,
          FontWeight.normal,
        );
      },
    );

    // Panel 4: Tabanlı Menderesli Vadi (Sağ Alt)
    _drawVadiBox(
      canvas,
      Rect.fromLTWH(boxW + 18, boxH + 18, boxW, boxH),
      '4. Tabanlı / Menderes',
      () {
        final leftX = boxW + 18;
        final topY = boxH + 18;
        // Düz alüvyon taban
        canvas.drawLine(
          Offset(leftX + 6, topY + boxH - 14),
          Offset(leftX + boxW - 6, topY + boxH - 14),
          Paint()
            ..color = const Color(0xFF64748B)
            ..strokeWidth = 1.2,
        );
        // Menderes S kıvrımı
        final mPath = Path()
          ..moveTo(leftX + 12, topY + boxH - 14)
          ..cubicTo(
            leftX + boxW * 0.3,
            topY + 14,
            leftX + boxW * 0.4,
            topY + boxH - 6,
            leftX + boxW * 0.65,
            topY + 18,
          )
          ..cubicTo(
            leftX + boxW * 0.8,
            topY + boxH - 8,
            leftX + boxW * 0.9,
            topY + 20,
            leftX + boxW - 12,
            topY + boxH - 14,
          );
        canvas.drawPath(
          mPath,
          Paint()
            ..color = const Color(0xFF2563EB)
            ..strokeWidth = 2.4
            ..style = PaintingStyle.stroke,
        );
        _drawText(
          canvas,
          'Yana Aşındırma & Büklümler (Ege)',
          Offset(leftX + boxW * 0.50, topY + boxH - 26),
          const Color(0xFF64748B),
          8.0,
          FontWeight.normal,
        );
      },
    );
  }

  void _drawVadiBox(
    Canvas canvas,
    Rect r,
    String title,
    VoidCallback drawShape,
  ) {
    final bgPaint = Paint()
      ..color = isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);
    final borderPaint = Paint()
      ..color = isDark ? Colors.white12 : Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawRRect(
      RRect.fromRectAndRadius(r, const Radius.circular(8)),
      bgPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(r, const Radius.circular(8)),
      borderPaint,
    );

    _drawText(
      canvas,
      title,
      Offset(r.left + r.width * 0.50, r.top + 10),
      isDark ? Colors.white : const Color(0xFF1E293B),
      9.0,
      FontWeight.bold,
    );
    drawShape();
  }

  // ---------------------------------------------------------------------------
  // 4. KARSTİK AŞINIM & BİRİKİM KESİTİ (Obruk & Mağara)
  // ---------------------------------------------------------------------------
  void _paintKarstikKesit(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final groundY = h * 0.28;

    // Yeryüzü Toprağı
    final groundPaint = Paint()
      ..color = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
    canvas.drawRect(Rect.fromLTWH(0, groundY, w, h - groundY), groundPaint);

    // 1. Lapya Olukları (Sol Yüzey)
    final lapyaPaint = Paint()
      ..color = isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8)
      ..strokeWidth = 2;
    for (double lx = 14; lx < w * 0.28; lx += 10) {
      canvas.drawLine(
        Offset(lx, groundY),
        Offset(lx + 3, groundY + 8),
        lapyaPaint,
      );
      canvas.drawLine(
        Offset(lx + 3, groundY + 8),
        Offset(lx + 6, groundY),
        lapyaPaint,
      );
    }
    _drawBadge(
      canvas,
      'Lapya (En Küçük)',
      Offset(w * 0.14, groundY - 12),
      const Color(0xFFD97706),
    );

    // 2. Obruk (Orta Silindirik Kuyu Çöküntüsü)
    final obrukLeft = w * 0.36;
    final obrukW = w * 0.24;
    final obrukBottom = h * 0.76;

    final obrukPath = Path()
      ..moveTo(obrukLeft, groundY)
      ..lineTo(obrukLeft, obrukBottom)
      ..lineTo(obrukLeft + obrukW, obrukBottom)
      ..lineTo(obrukLeft + obrukW, groundY)
      ..close();
    canvas.drawPath(
      obrukPath,
      Paint()..color = isDark ? const Color(0xFF0F172A) : Colors.white,
    );
    canvas.drawPath(
      obrukPath,
      Paint()
        ..color = const Color(0xFFEF4444)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8,
    );

    // Obruk dip suyu
    canvas.drawRect(
      Rect.fromLTWH(obrukLeft + 2, obrukBottom - 14, obrukW - 4, 14),
      Paint()..color = const Color(0xFF0284C7),
    );
    _drawBadge(
      canvas,
      'OBRUK (Çöküntü)',
      Offset(obrukLeft + obrukW / 2, groundY - 12),
      const Color(0xFFDC2626),
    );
    _drawText(
      canvas,
      'Dip Suyu',
      Offset(obrukLeft + obrukW / 2, obrukBottom - 7),
      Colors.white,
      8.0,
      FontWeight.bold,
    );

    // 3. Yer Altı Mağarası (Sağ Alt)
    final caveLeft = w * 0.68;
    final caveTop = h * 0.42;
    final caveW = w * 0.28;
    final caveH = h * 0.44;

    final caveRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(caveLeft, caveTop, caveW, caveH),
      const Radius.circular(16),
    );
    canvas.drawRRect(
      caveRect,
      Paint()
        ..color = isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
    );
    canvas.drawRRect(
      caveRect,
      Paint()
        ..color = const Color(0xFF64748B)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Sarkıt (Tavandan sarkan sivri üçgenler)
    final dripPaint = Paint()..color = const Color(0xFFD97706);
    _drawTriangle(
      canvas,
      Offset(caveLeft + 12, caveTop),
      Offset(caveLeft + 20, caveTop),
      Offset(caveLeft + 16, caveTop + 22),
      dripPaint,
    );
    _drawTriangle(
      canvas,
      Offset(caveLeft + caveW - 22, caveTop),
      Offset(caveLeft + caveW - 14, caveTop),
      Offset(caveLeft + caveW - 18, caveTop + 18),
      dripPaint,
    );

    // Dikit (Tabandan yükselen üçgenler)
    _drawTriangle(
      canvas,
      Offset(caveLeft + 12, caveTop + caveH),
      Offset(caveLeft + 20, caveTop + caveH),
      Offset(caveLeft + 16, caveTop + caveH - 18),
      dripPaint,
    );

    // Sütun (Sarkıt ve dikitin birleşmesi)
    final colX = caveLeft + caveW * 0.52;
    canvas.drawRect(Rect.fromLTWH(colX - 4, caveTop, 8, caveH), dripPaint);

    _drawBadge(
      canvas,
      'Mağara (Sarkıt/Dikit/Sütun)',
      Offset(caveLeft + caveW / 2, caveTop - 12),
      const Color(0xFF2563EB),
    );
  }

  // ---------------------------------------------------------------------------
  // 5. TOMBOLO (Saplı Ada & Lagün Kıyı Birikimi)
  // ---------------------------------------------------------------------------
  void _paintTombolo(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Arka plan: Deniz (Mavi Su)
    final seaPaint = Paint()
      ..color = isDark ? const Color(0xFF0F2B48) : const Color(0xFFE0F2FE);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), seaPaint);

    // 1. Ana Kara (Sol Kıyı)
    final landPaint = Paint()
      ..color = isDark ? const Color(0xFF065F46) : const Color(0xFFA7F3D0);
    final landPath = Path()
      ..moveTo(0, 0)
      ..lineTo(w * 0.28, 0)
      ..cubicTo(w * 0.32, h * 0.35, w * 0.22, h * 0.65, w * 0.30, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(landPath, landPaint);
    _drawText(
      canvas,
      'ANA KARA',
      Offset(w * 0.12, h * 0.50),
      isDark ? Colors.white : const Color(0xFF064E3B),
      11,
      FontWeight.bold,
    );

    // 2. Ada (Sağdaki İzole Kütle)
    final islandCenter = Offset(w * 0.78, h * 0.50);
    final islandR = h * 0.28;
    canvas.drawCircle(islandCenter, islandR, landPaint);
    canvas.drawCircle(
      islandCenter,
      islandR,
      Paint()
        ..color = const Color(0xFF059669)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    _drawText(
      canvas,
      'ADA',
      islandCenter,
      isDark ? Colors.white : const Color(0xFF064E3B),
      11,
      FontWeight.bold,
    );

    // 3. Tombolo (Saplı Ada - Adayı Karaya Bağlayan Kumul Kordonu)
    final sandPaint = Paint()..color = const Color(0xFFF59E0B);
    final tomboloPath = Path()
      ..moveTo(w * 0.25, h * 0.44)
      ..lineTo(islandCenter.dx - islandR + 2, h * 0.46)
      ..lineTo(islandCenter.dx - islandR + 2, h * 0.54)
      ..lineTo(w * 0.25, h * 0.56)
      ..close();
    canvas.drawPath(tomboloPath, sandPaint);

    // Dalga hareket çizgileri
    final wavePaint = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(w * 0.40, h * 0.30),
      Offset(w * 0.55, h * 0.35),
      wavePaint,
    );
    canvas.drawLine(
      Offset(w * 0.42, h * 0.68),
      Offset(w * 0.56, h * 0.63),
      wavePaint,
    );

    // Rozetler
    _drawBadge(
      canvas,
      '★ TOMBOLO (Saplı Ada)',
      Offset(w * 0.48, h * 0.50),
      const Color(0xFFD97706),
    );
    _drawBadge(
      canvas,
      'Örnek: Kapıdağ & Sinop',
      Offset(w * 0.48, h * 0.66),
      const Color(0xFF2563EB),
    );
  }

  // ---------------------------------------------------------------------------
  // Yardımcı Çizim Metotları
  // ---------------------------------------------------------------------------
  void _drawBadge(Canvas canvas, String text, Offset center, Color color) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9.5,
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

  void _drawTriangle(
    Canvas canvas,
    Offset p1,
    Offset p2,
    Offset p3,
    Paint paint,
  ) {
    final path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawPressureArrow(Canvas canvas, Offset from, Offset to, Color color) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(from, to, p);
  }

  @override
  bool shouldRepaint(covariant GeoDiagramPainter oldDelegate) {
    return oldDelegate.config != config || oldDelegate.isDark != isDark;
  }
}
