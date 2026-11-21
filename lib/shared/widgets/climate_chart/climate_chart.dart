import 'package:flutter/material.dart';

import 'climate_chart_models.dart';
import 'climate_chart_painter.dart';

export 'climate_chart_card.dart';
export 'climate_chart_models.dart';
export 'climate_chart_painter.dart';

/// KPSS Coğrafya iklim grafiklerini (Yağış & Sıcaklık) çizen görsel bileşen.
class ClimateChart extends StatelessWidget {
  final ClimateChartConfig config;
  final double height;

  const ClimateChart({super.key, required this.config, this.height = 195.0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryTextColor = isDark
        ? const Color(0xFFF1F5F9)
        : const Color(0xFF1E293B);
    final secondaryTextColor = isDark
        ? const Color(0xFF94A3B8)
        : const Color(0xFF64748B);
    final gridLineColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.07);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Lejant (Gösterge Alanı: Yağış & Sıcaklık)
        Padding(
          padding: const EdgeInsets.only(left: 36, right: 36, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _LegendItem(
                color: const Color(0xFF2563EB),
                label: 'Aylık Yağış (mm)',
                isSquare: true,
                textColor: secondaryTextColor,
              ),
              _LegendItem(
                color: const Color(0xFFDC2626),
                label: 'Sıcaklık (°C)',
                isSquare: false,
                textColor: secondaryTextColor,
              ),
            ],
          ),
        ),

        // Grafik Tuvali (CustomPaint)
        SizedBox(
          height: height,
          child: CustomPaint(
            painter: ClimateChartPainter(
              config: config,
              isDark: isDark,
              primaryTextColor: primaryTextColor,
              secondaryTextColor: secondaryTextColor,
              gridLineColor: gridLineColor,
            ),
            size: Size.infinite,
          ),
        ),
      ],
    );
  }
}

/// İklim grafiği lejant öğesi (yağış için kare, sıcaklık için çizgi + nokta).
///
/// Seri renkleri tuvaldeki (`ClimateChartPainter`) çizimle eşleşmek zorunda
/// olduğundan bilimsel çizim istisnası kapsamında sabittir; yazı stili ise
/// `textTheme.labelSmall` üzerinden gelir.
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final bool isSquare;
  final Color textColor;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.isSquare,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSquare)
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          )
        else
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 8, height: 2, color: color),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              Container(width: 8, height: 2, color: color),
            ],
          ),
        const SizedBox(width: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall
              ?.copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ],
    );
  }
}
