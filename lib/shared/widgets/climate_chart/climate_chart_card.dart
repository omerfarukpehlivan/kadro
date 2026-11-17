import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'climate_chart.dart';

/// KPSS Soru Kartı veya Çalışma Ekranları için İklim Grafiği Kartı
///
/// Angular/Web benzetmesi: Bu bileşen `<app-climate-chart-card>` bileşenidir.
/// Yağış ve sıcaklık grafiğini (Hythergraph) sunar, yıllık toplam yağış,
/// ortalama sıcaklık ve en yağışlı mevsim özet rozetlerini gösterir ve
/// 'Büyüt' butonuyla tam ekran inceleme olanağı tanır.
class ClimateChartCard extends StatelessWidget {
  final ClimateChartConfig config;
  final String? title;

  const ClimateChartCard({super.key, required this.config, this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: colorScheme.outlineVariant, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: colorScheme.outlineVariant,
            offset: const Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Başlık ve Büyüt Butonu Çubuğu
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 10, 6),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.cloudRain,
                          size: 13,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          title ?? 'KPSS İklim Analizi (Sıcaklık & Yağış)',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Büyüt Butonu
                  InkWell(
                    onTap: () => _openZoomDialog(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsRegular.magnifyingGlassPlus,
                            size: 14,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Büyüt',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Grafik Gövdesi
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: ClimateChart(config: config, height: 185),
            ),

            // Alt Bilgi Şeritleri (Yıllık Yağış & Ortalama Sıcaklık & Rejim)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                border: Border(
                  top: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                alignment: WrapAlignment.center,
                children: [
                  _buildStatBadge(
                    context: context,
                    icon: PhosphorIconsRegular.drop,
                    label:
                        'Yıllık Yağış: ~${config.totalPrecipitation.round()} mm',
                    color: colorScheme.primary,
                  ),
                  _buildStatBadge(
                    context: context,
                    icon: PhosphorIconsRegular.thermometer,
                    label:
                        'Ort. Sıcaklık: ${config.averageTemperature.toStringAsFixed(1)}°C',
                    color: colorScheme.error,
                  ),
                  _buildStatBadge(
                    context: context,
                    icon: PhosphorIconsRegular.calendar,
                    label: config.wettestSeason,
                    color: colorScheme.tertiary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBadge({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _openZoomDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        final ctxTheme = Theme.of(ctx);
        final ctxScheme = ctxTheme.colorScheme;
        final ctxText = ctxTheme.textTheme;
        return Dialog(
          backgroundColor: ctxScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: ctxScheme.outlineVariant),
          ),
          insetPadding: const EdgeInsets.all(12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580, maxHeight: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Başlık
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 12, 8),
                  child: Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIconsRegular.cloudRain,
                        size: 16,
                        color: ctxScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          config.title,
                          style: ctxText.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const PhosphorIcon(
                          PhosphorIconsRegular.x,
                          size: 18,
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                // Yakınlaştırılabilir Grafik Alanı
                Expanded(
                  child: InteractiveViewer(
                    minScale: 1.0,
                    maxScale: 3.5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: ClimateChart(config: config, height: 260),
                      ),
                    ),
                  ),
                ),

                // Kapat Butonu ve İpucu
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Çift parmakla yakınlaştırabilirsiniz',
                          style: ctxText.bodySmall?.copyWith(
                            color: ctxScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Kapat'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
