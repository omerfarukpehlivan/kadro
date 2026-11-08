import 'package:flutter/material.dart';

import 'sun_diagram_models.dart';
import 'sun_diagram_painter.dart';

export 'sun_diagram_card.dart';
export 'sun_diagram_models.dart';
export 'sun_diagram_painter.dart';

/// KPSS Coğrafya Güneş Açısı ve Mevsim Şeması Görsel Bileşeni
class SunDiagram extends StatelessWidget {
  final SunDiagramConfig config;
  final double height;

  const SunDiagram({super.key, required this.config, this.height = 190.0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: SunDiagramPainter(config: config, isDark: isDark),
        size: Size.infinite,
      ),
    );
  }
}
