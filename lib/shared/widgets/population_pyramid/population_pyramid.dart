import 'package:flutter/material.dart';

import 'population_pyramid_models.dart';
import 'population_pyramid_painter.dart';

export 'population_pyramid_card.dart';
export 'population_pyramid_models.dart';
export 'population_pyramid_painter.dart';

/// KPSS Coğrafya Nüfus Piramidi Görsel Bileşeni
class PopulationPyramid extends StatelessWidget {
  final PopulationPyramidConfig config;
  final double height;

  const PopulationPyramid({
    super.key,
    required this.config,
    this.height = 230.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: PopulationPyramidPainter(config: config, isDark: isDark),
        size: Size.infinite,
      ),
    );
  }
}
