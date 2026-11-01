import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_history_screen.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// İstatistik sayfası: Riverpod üzerinden canlı soru, XP/Lig, Ustalık Haritası ve Test Geçmişini gösterir.
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

        // 1. En Üst: Lig Kademesi ve Seri Kartı
        _LeagueAndStreakCard(stats: stats),
        const SizedBox(height: 16),

        // 2. KPI Kartları (Çözülen Soru, Doğru Oranı)
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

        // En zayıf ders kartı
        _StatCard(
          label: 'En zayıf ders',
          value: stats.weakestLesson,
          icon: LucideIcons.flame,
        ),
        const SizedBox(height: 16),

        // 3. Ders Bazlı Başarı Oranı Grafiği (fl_chart BarChart)
        _LessonAccuracyChartCard(stats: stats),
        const SizedBox(height: 16),

        // 4. Ders Ustalık Isı Haritası
        _MasteryHeatmapCard(stats: stats),
        const SizedBox(height: 16),

        // 5. Çözülen Testler Arşivi
        _RecentSessionsCard(stats: stats),
      ],
    );
  }
}

/// Lig kademesi, XP puanı, gün serisi ve soru başına ortalama süre kartı.
class _LeagueAndStreakCard extends StatelessWidget {
  final StudyStatsState stats;

  const _LeagueAndStreakCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.primary.withAlpha(90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  LucideIcons.trophy,
                  color: colorScheme.onTertiaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stats.leagueTier,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '${stats.totalXp} XP',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.flame,
                      size: 14,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${stats.streakDays} Gün Seri',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ort. ${stats.averageSecondsPerQuestion} sn/soru',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 4 dersin ustalık durumunu renkli ısı haritası haplarıyla gösteren kart.
class _MasteryHeatmapCard extends StatelessWidget {
  final StudyStatsState stats;

  const _MasteryHeatmapCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final lessons = [
      ('TAR · Tarih', 'Tarih'),
      ('COĞ · Coğrafya', 'Coğrafya'),
      ('VAT · Vatandaşlık', 'Vatandaşlık'),
      ('GÜN · Güncel Bilgiler', 'Güncel Bilgiler'),
    ];

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.shieldCheck,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Ders Ustalık Isı Haritası',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...lessons.map((item) {
            final displayName = item.$1;
            final keyName = item.$2;
            final label = stats.lessonMasteryLabel(keyName);

            Color badgeBg;
            Color badgeText;
            if (label.startsWith('Usta')) {
              badgeBg = colorScheme.tertiaryContainer;
              badgeText = colorScheme.onTertiaryContainer;
            } else if (label.startsWith('Gelişiyor')) {
              badgeBg = colorScheme.primaryContainer;
              badgeText = colorScheme.onPrimaryContainer;
            } else if (label.startsWith('Kritik')) {
              badgeBg = colorScheme.errorContainer;
              badgeText = colorScheme.onErrorContainer;
            } else {
              badgeBg = colorScheme.surfaceContainerHighest;
              badgeText = colorScheme.onSurfaceVariant;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    displayName,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: badgeBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      label,
                      style: textTheme.labelSmall?.copyWith(
                        color: badgeText,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// Son çözülen test oturumlarını gösteren özet kartı.
class _RecentSessionsCard extends StatelessWidget {
  final StudyStatsState stats;

  const _RecentSessionsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Çözülen Testler Arşivi (${stats.sessionHistory.length})',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const QuizHistoryScreen(),
                    ),
                  );
                },
                child: const Text('Tümünü Gör'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (stats.sessionHistory.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Henüz tamamlanmış bir test oturumu yok.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            ...stats.sessionHistory.take(3).map((s) {
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => QuizSessionDetailScreen(session: s),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          s.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'Net: ${s.netScore.toStringAsFixed(2)}  (+${s.earnedXp} XP)',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
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
