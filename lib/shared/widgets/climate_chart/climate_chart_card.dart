import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'climate_chart.dart';

/// KPSS Soru Kartı veya Çalışma Ekranları için İklim Grafiği Kartı
///
/// Angular/Web benzetmesi: Bu bileşen `<app-climate-chart-card>` bileşenidir.
/// Yağış ve sıcaklık grafiğini (Hythergraph) sunar, yıllık toplam yağış,
/// ortalama sıcaklık ve en yağışlı mevsim özet rozetlerini gösterir ve
/// 'Büyüt' butonuyla tam ekran inceleme olanağı tanır. Çerçeve, başlık ve
/// diyalog ortak [DiagramCardShell] ailesinden gelir.
class ClimateChartCard extends StatelessWidget {
  final ClimateChartConfig config;
  final String? title;

  const ClimateChartCard({super.key, required this.config, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DiagramCardShell(
      icon: PhosphorIconsRegular.cloudRain,
      badgeLabel: title ?? 'KPSS İklim Analizi (Sıcaklık & Yağış)',
      onZoom: () => showDiagramZoomDialog(
        context,
        icon: PhosphorIconsRegular.cloudRain,
        iconColor: colorScheme.primary,
        title: config.title,
        chartBuilder: (_) => ClimateChart(config: config, height: 260),
      ),
      children: [
        // Grafik Gövdesi
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: ClimateChart(config: config, height: 185),
        ),

        // Alt Bilgi Şeritleri (Yıllık Yağış & Ortalama Sıcaklık & Rejim)
        DiagramFooterStrip(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: [
              DiagramStatBadge(
                icon: PhosphorIconsRegular.drop,
                label: 'Yıllık Yağış: ~${config.totalPrecipitation.round()} mm',
                color: colorScheme.primary,
              ),
              DiagramStatBadge(
                icon: PhosphorIconsRegular.thermometer,
                label:
                    'Ort. Sıcaklık: ${config.averageTemperature.toStringAsFixed(1)}°C',
                color: colorScheme.error,
              ),
              DiagramStatBadge(
                icon: PhosphorIconsRegular.calendar,
                label: config.wettestSeason,
                color: colorScheme.tertiary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
