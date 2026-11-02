import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_history_screen.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// İstatistik sayfası: Riverpod üzerinden canlı soru, XP/Lig, Ustalık Haritası,
/// Başarım Rozetleri (Achievements), Haftalık Kadro Ligi ve Test Geçmişini gösterir.
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
        if (stats.weakestLesson != 'Henüz veri yok') ...[
          const SizedBox(height: 12),
          _WeakLessonActionCard(stats: stats),
        ],
        const SizedBox(height: 16),

        // 3. KPSS Başarım Rozetleri (Achievements)
        _AchievementsCard(stats: stats),
        const SizedBox(height: 16),

        // 4. Haftalık Kadro Lig Sıralaması (Leaderboard)
        _LeaderboardCard(stats: stats),
        const SizedBox(height: 16),

        // 5. Ders Bazlı Başarı Oranı Grafiği (fl_chart BarChart)
        _LessonAccuracyChartCard(stats: stats),
        const SizedBox(height: 16),

        // 6. Ders Ustalık Isı Haritası
        _MasteryHeatmapCard(stats: stats),
        const SizedBox(height: 16),

        // 7. Çözülen Testler Arşivi
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
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.flame,
                      size: 14,
                      color: colorScheme.onTertiaryContainer,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${stats.streakDays} Gün Seri',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onTertiaryContainer,
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

/// KPSS Başarım Rozetleri (Achievements) Kartı
class _AchievementsCard extends StatelessWidget {
  final StudyStatsState stats;

  const _AchievementsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final badges = [
      _AchievementData(
        title: 'İlk Pençe',
        description: '1 soru çöz',
        icon: LucideIcons.flame,
        isUnlocked: stats.totalSolved >= 1,
      ),
      _AchievementData(
        title: 'Keskin Nişancı',
        description: '%70+ Doğruluk',
        icon: LucideIcons.target,
        isUnlocked: stats.totalSolved >= 5 && stats.accuracyPercent >= 70,
      ),
      _AchievementData(
        title: 'Deneme Fatihi',
        description: '1 Deneme bitir',
        icon: LucideIcons.trophy,
        isUnlocked: stats.sessionHistory.isNotEmpty,
      ),
      _AchievementData(
        title: 'Gümüş Kadro Adayı',
        description: '250+ XP topla',
        icon: LucideIcons.shieldCheck,
        isUnlocked: stats.totalXp >= 250 || stats.leagueTier != 'Bronz Kadro',
      ),
    ];

    final unlockedCount = badges.where((b) => b.isUnlocked).length;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    LucideIcons.medal,
                    color: colorScheme.tertiary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'KPSS Başarım Rozetleri',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$unlockedCount / 4 Açık',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _BadgeTile(data: badges[0])),
              const SizedBox(width: 8),
              Expanded(child: _BadgeTile(data: badges[1])),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _BadgeTile(data: badges[2])),
              const SizedBox(width: 8),
              Expanded(child: _BadgeTile(data: badges[3])),
            ],
          ),
        ],
      ),
    );
  }
}

class _AchievementData {
  final String title;
  final String description;
  final IconData icon;
  final bool isUnlocked;

  const _AchievementData({
    required this.title,
    required this.description,
    required this.icon,
    required this.isUnlocked,
  });
}

class _BadgeTile extends StatelessWidget {
  final _AchievementData data;

  const _BadgeTile({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final bgColor = data.isUnlocked
        ? colorScheme.primaryContainer.withAlpha(90)
        : colorScheme.surfaceContainerHighest.withAlpha(90);
    final iconColor = data.isUnlocked
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant.withAlpha(120);
    final titleColor = data.isUnlocked
        ? colorScheme.onSurface
        : colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: data.isUnlocked
              ? colorScheme.primary.withAlpha(100)
              : colorScheme.outlineVariant.withAlpha(60),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(data.icon, color: iconColor, size: 20),
              Icon(
                data.isUnlocked ? LucideIcons.circleCheck : LucideIcons.lock,
                size: 14,
                color: data.isUnlocked
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant.withAlpha(120),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            data.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            data.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Haftalık Kadro Lig Sıralaması (Leaderboard) Kartı
class _LeaderboardCard extends StatefulWidget {
  final StudyStatsState stats;

  const _LeaderboardCard({required this.stats});

  @override
  State<_LeaderboardCard> createState() => _LeaderboardCardState();
}

class _LeaderboardCardState extends State<_LeaderboardCard> {
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();
  late Future<List<LeaderboardEntry>> _leaderboardFuture;

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = _cloudSync.fetchLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    LucideIcons.crown,
                    color: colorScheme.tertiary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Haftalık Kadro Ligi',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Bu Hafta',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FutureBuilder<List<LeaderboardEntry>>(
            future: _leaderboardFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final entries = List<LeaderboardEntry>.from(snapshot.data ?? []);

              // Kullanıcının kendi kaydını ekleyip sıralayalım
              final userEntry = LeaderboardEntry(
                displayName: 'Sen (Kadro Adayı)',
                totalXp: widget.stats.totalXp,
                leagueTier: widget.stats.leagueTier,
              );

              final allEntries = [...entries, userEntry];
              allEntries.sort((a, b) => b.totalXp.compareTo(a.totalXp));

              return Column(
                children: allEntries.take(5).toList().asMap().entries.map((
                  entry,
                ) {
                  final rank = entry.key + 1;
                  final item = entry.value;
                  final isCurrentUser = item.displayName.startsWith('Sen');

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isCurrentUser
                          ? colorScheme.primaryContainer.withAlpha(80)
                          : colorScheme.surfaceContainerHighest.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                      border: isCurrentUser
                          ? Border.all(
                              color: colorScheme.primary.withAlpha(120),
                            )
                          : null,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 28,
                          child: Text(
                            rank == 1
                                ? '🥇'
                                : rank == 2
                                ? '🥈'
                                : rank == 3
                                ? '🥉'
                                : '#$rank',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.displayName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: isCurrentUser
                                      ? FontWeight.w800
                                      : FontWeight.w600,
                                  color: isCurrentUser
                                      ? colorScheme.primary
                                      : colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                item.leagueTier,
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${item.totalXp} XP',
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
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
                label,
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              if (icon != null)
                Icon(icon, size: 18, color: colorScheme.primary),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
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

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ders Bazlı Başarı Oranı (%)',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
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
                        toY: stats.lessonAccuracyPercent('Coğrafya').toDouble(),
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
    ).animate().fadeIn(duration: 200.ms);
  }
}

/// Kullanıcının en çok zorlandığı dersten 10 hedef soru çözmesini sağlayan eylem kartı.
class _WeakLessonActionCard extends StatelessWidget {
  final StudyStatsState stats;

  const _WeakLessonActionCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.error.withAlpha(140),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              LucideIcons.flame,
              color: colorScheme.onErrorContainer,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zayıf Konuyu Güçlendir (10 Soru)',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${stats.weakestLesson} dersindeki eksiklerini kapat.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    lessonFilter: stats.weakestLesson,
                    customTitle: '${stats.weakestLesson} — Zayıf Konu Testi',
                    limit: 10,
                  ),
                ),
              );
            },
            child: const Text('10 Soru'),
          ),
        ],
      ),
    );
  }
}
