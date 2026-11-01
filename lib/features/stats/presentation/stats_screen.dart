import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// İstatistik sayfası: Riverpod üzerinden canlı soru ve başarı metriklerini gösterir.
class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: LucideIcons.chartColumn,
          title: 'İstatistiklerin',
          subtitle: 'Soru çözdükçe ders bazında netlerin burada görünecek.',
        ),
        const SizedBox(height: 16),
        // İki kart yan yana; Expanded ikisine eşit genişlik verir (flex: 1 + flex: 1)
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: 'Çözülen soru',
                value: '${stats.totalSolved}',
                icon: LucideIcons.check,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: 'Doğru oranı',
                value: stats.totalSolved == 0
                    ? '–'
                    : '%${stats.accuracyPercent}',
                icon: LucideIcons.target,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _StatCard(
          label: 'En zayıf ders',
          value: stats.weakestLesson,
          icon: LucideIcons.flame,
        ),
        const SizedBox(height: 16),
        // Ders Bazlı Başarı Oranı Grafiği (fl_chart BarChart)
        _LessonAccuracyChartCard(stats: stats),
      ],
    );
  }
}

/// Bir başlık, opsiyonel bir ikon ve büyük bir değer gösteren küçük kart.
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const _StatCard({required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: textTheme.labelLarge),
                if (icon != null)
                  Icon(icon, size: 18, color: colorScheme.primary),
              ],
            ),
            const SizedBox(height: 8),
            Text(value, style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}

/// 4 KPSS Genel Kültür dersinin başarı oranını gösteren BarChart kartı.
class _LessonAccuracyChartCard extends StatelessWidget {
  final StudyStatsState stats;

  const _LessonAccuracyChartCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ders Bazlı Başarı Oranı (%)',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  maxY: 100,
                  barTouchData: const BarTouchData(enabled: false),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final label = switch (value.toInt()) {
                            0 => 'TAR',
                            1 => 'COĞ',
                            2 => 'VAT',
                            3 => 'GÜN',
                            _ => '',
                          };
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              label,
                              style: textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: stats.lessonAccuracyPercent('Tarih').toDouble(),
                          color: colorScheme.primary,
                          width: 22,
                          borderRadius: BorderRadius.circular(6),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 100,
                            color: colorScheme.secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: stats
                              .lessonAccuracyPercent('Coğrafya')
                              .toDouble(),
                          color: colorScheme.primary,
                          width: 22,
                          borderRadius: BorderRadius.circular(6),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 100,
                            color: colorScheme.secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: stats
                              .lessonAccuracyPercent('Vatandaşlık')
                              .toDouble(),
                          color: colorScheme.primary,
                          width: 22,
                          borderRadius: BorderRadius.circular(6),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 100,
                            color: colorScheme.secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: stats
                              .lessonAccuracyPercent('Güncel Bilgiler')
                              .toDouble(),
                          color: colorScheme.primary,
                          width: 22,
                          borderRadius: BorderRadius.circular(6),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 100,
                            color: colorScheme.secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
