import 'package:flutter/material.dart';
import 'geo_diagram_models.dart';
import 'geo_diagram_painter.dart';

export 'geo_diagram_card.dart';
export 'geo_diagram_models.dart';
export 'geo_diagram_painter.dart';

/// KPSS Coğrafya Jeomorfoloji Kesit Bileşeni
class GeoDiagram extends StatelessWidget {
  final GeoDiagramConfig config;
  final double height;

  const GeoDiagram({super.key, required this.config, this.height = 190.0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: GeoDiagramPainter(config: config, isDark: isDark),
        size: Size.infinite,
      ),
    );
  }
}
