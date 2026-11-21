import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_filter_chips.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_history_screen.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

String _abbreviateLesson(String lessonName) {
  switch (lessonName) {
    case 'Tarih':
      return 'TAR';
    case 'Coğrafya':
      return 'COĞ';
    case 'Vatandaşlık':
      return 'VAT';
    case 'Güncel Bilgiler':
      return 'GÜN';
    case 'Türkçe':
      return 'TÜR';
    case 'Matematik':
    case 'Matematik & Geometri':
      return 'MAT';
    case 'Sözel Yetenek':
      return 'SÖZ';
    case 'Sayısal Yetenek':
      return 'SAY';
    case 'Mevzuat':
      return 'MEV';
    case 'Alan Hukuk':
      return 'HUK';
    case 'Alan İktisat':
      return 'İKT';
    case 'Alan Maliye':
      return 'MAL';
    case 'Alan Muhasebe':
      return 'MUH';
    case 'Alan İşletme':
      return 'İŞL';
    case 'Alan Kamu Yönetimi':
      return 'KYÖ';
    case 'Alan Uluslararası İlişkiler':
      return 'UİL';
    case 'Alan ÇEKO':
      return 'ÇEK';
    case 'Alan İstatistik':
      return 'İST';
    default:
      final cleaned = lessonName
          .replaceFirst('Alan ', '')
          .replaceFirst('ÖABT ', '')
          .trim();
      if (cleaned.length <= 3) return cleaned.toUpperCase();
      return cleaned.substring(0, 3).toUpperCase();
  }
}

/// İstatistik sayfası: analist Tuğrul sahnesi, kapsam filtresi, lig/seri özeti,
/// KPI metrikleri, rozetler, haftalık sıralama, ders başarı grafiği, ustalık durumu ve test arşivi.
class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({super.key});

  @override
  ConsumerState<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen> {
  bool _onlyActiveScope = true;

  @override
  Widget build(BuildContext context) {
    final stats = ref.watch(studyStatsProvider);
    final selection = readOrWatchExamSelection(ref);
    final curriculum = readOrWatchCurriculum(ref);
    final activeScope = _onlyActiveScope ? selection.scopeKey : null;
    final summary = stats.statsSummaryForScope(activeScope);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);

    final headerRow = Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'İstatistiklerin',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Ders bazlı doğruluk oranların ve haftalık sıralama gelişimin.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          TugrulAvatar(
            mood: TugrulMood.analyst,
            size: 62,
            tooltip: 'İstatistik & Ölçme Notları',
            onTap: () =>
                TugrulTipsSheet.show(context, mood: TugrulMood.analyst),
          ),
        ],
      ),
    );

    final scopeChips = Material(
      type: MaterialType.transparency,
      child: KadroFilterChips<bool>(
        wrap: true,
        runSpacing: 6,
        selectedValue: _onlyActiveScope,
        onSelected: (value) => setState(() => _onlyActiveScope = value),
        options: [
          KadroFilterOption(
            key: const ValueKey('stats_scope_filter_active'),
            value: true,
            label: 'Aktif Sınav · ${selection.family.shortLabel}',
          ),
          const KadroFilterOption(
            key: ValueKey('stats_scope_filter_all'),
            value: false,
            label: 'Tüm Çalışmalar',
          ),
        ],
      ),
    );

    final solvedStatCard = _StatCard(
      label: 'Çözülen soru',
      value: '${summary.totalSolved}',
      icon: PhosphorIconsRegular.check,
    );
    final accuracyStatCard = _StatCard(
      label: 'Doğru oranı',
      value: summary.totalSolved == 0 ? '–' : '%${summary.accuracyPercent}',
      icon: PhosphorIconsRegular.target,
    );
    final weakStatCard = _StatCard(
      label: 'En zayıf ders',
      value: summary.weakestLesson,
      icon: PhosphorIconsRegular.warningCircle,
    );

    if (isLargeTablet) {
      return ResponsiveContentWrapper(
        maxWidth: 1240,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: ListView(
            padding: AppSpacing.pagePadding(context),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: headerRow),
                  const SizedBox(width: 16),
                  scopeChips,
                ],
              ),
              AppSpacing.gapMd,
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _LeagueAndStreakCard(stats: stats),
                    ),
                    const SizedBox(width: 12),
                    Expanded(flex: 2, child: solvedStatCard),
                    const SizedBox(width: 12),
                    Expanded(flex: 2, child: accuracyStatCard),
                    const SizedBox(width: 12),
                    Expanded(flex: 3, child: weakStatCard),
                  ],
                ),
              ),
              AppSpacing.gapMd,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (summary.weakestLesson != 'Henüz veri yok') ...[
                          _WeakLessonActionCard(
                            weakestLesson: summary.weakestLesson,
                            selection: selection,
                          ),
                          AppSpacing.gapMd,
                        ],
                        _LessonAccuracyChartCard(
                          summary: summary,
                          curriculum: curriculum,
                          includeAllSolvedLessons: !_onlyActiveScope,
                        ),
                        AppSpacing.gapMd,
                        _MasteryHeatmapCard(
                          summary: summary,
                          curriculum: curriculum,
                          includeAllSolvedLessons: !_onlyActiveScope,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _AchievementsCard(stats: stats),
                        AppSpacing.gapMd,
                        _LeaderboardCard(
                          stats: stats,
                          examFamily: selection.family,
                        ),
                        AppSpacing.gapMd,
                        _RecentSessionsCard(stats: stats, summary: summary),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return ResponsiveContentWrapper(
      maxWidth: 720,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: AppSpacing.pagePadding(context),
        children: [
          headerRow,
          const SizedBox(height: 8),
          scopeChips,
          AppSpacing.gapMd,
          _LeagueAndStreakCard(stats: stats),
          AppSpacing.gapMd,
          Row(
            children: [
              Expanded(child: solvedStatCard),
              AppSpacing.gapHorizontalSm,
              Expanded(child: accuracyStatCard),
            ],
          ),
          AppSpacing.gapSm,
          weakStatCard,
          if (summary.weakestLesson != 'Henüz veri yok') ...[
            AppSpacing.gapSm,
            _WeakLessonActionCard(
              weakestLesson: summary.weakestLesson,
              selection: selection,
            ),
          ],
          AppSpacing.gapMd,
          _AchievementsCard(stats: stats),
          AppSpacing.gapMd,
          _LeaderboardCard(stats: stats, examFamily: selection.family),
          AppSpacing.gapMd,
          _LessonAccuracyChartCard(
            summary: summary,
            curriculum: curriculum,
            includeAllSolvedLessons: !_onlyActiveScope,
          ),
          AppSpacing.gapMd,
          _MasteryHeatmapCard(
            summary: summary,
            curriculum: curriculum,
            includeAllSolvedLessons: !_onlyActiveScope,
          ),
          AppSpacing.gapMd,
          _RecentSessionsCard(stats: stats, summary: summary),
        ],
      ),
    );
  }
}

class _LeagueAndStreakCard extends StatelessWidget {
  final StudyStatsState stats;

  const _LeagueAndStreakCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsRegular.trophy,
                  color: colorScheme.tertiary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stats.leagueTier,
                        style: textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${stats.totalXp} XP',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              KadroBadge(
                label: '${stats.streakDays} Gün Seri',
                icon: PhosphorIconsFill.fire,
                tone: KadroBadgeTone.tertiary,
              ),
              const SizedBox(height: 4),
              Text(
                'Ort. ${stats.averageSecondsPerQuestion} sn/soru',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
        title: 'İlk Adım',
        description: '1 soru çöz',
        icon: PhosphorIconsRegular.footprints,
        isUnlocked: stats.totalSolved >= 1,
      ),
      _AchievementData(
        title: 'Yüksek İsabet',
        description: '%70+ doğruluk',
        icon: PhosphorIconsRegular.target,
        isUnlocked: stats.totalSolved >= 5 && stats.accuracyPercent >= 70,
      ),
      _AchievementData(
        title: 'Deneme Tamamlandı',
        description: '1 deneme bitir',
        icon: PhosphorIconsRegular.trophy,
        isUnlocked: stats.sessionHistory.isNotEmpty,
      ),
      _AchievementData(
        title: 'Gümüş Kadro',
        description: '250+ XP topla',
        icon: PhosphorIconsRegular.shieldCheck,
        isUnlocked: stats.totalXp >= 250 || stats.leagueTier != 'Bronz Kadro',
      ),
    ];

    final unlockedCount = badges.where((b) => b.isUnlocked).length;

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsRegular.medal,
                      color: colorScheme.tertiary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'KPSS Başarım Rozetleri',
                        style: textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$unlockedCount / 4 Açık',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
        ? colorScheme.primaryContainer.withAlpha(110)
        : colorScheme.surfaceContainerLow;
    final iconColor = data.isUnlocked
        ? colorScheme.primary
        : colorScheme.outline;
    final titleColor = data.isUnlocked
        ? colorScheme.onSurface
        : colorScheme.onSurfaceVariant;

    return Tooltip(
      message: '${data.title}: ${data.description}',
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.5,
            color: data.isUnlocked
                ? colorScheme.primary.withAlpha(130)
                : colorScheme.outlineVariant,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PhosphorIcon(data.icon, color: iconColor, size: 18),
                PhosphorIcon(
                  data.isUnlocked
                      ? PhosphorIconsFill.checkCircle
                      : PhosphorIconsRegular.lock,
                  size: 13,
                  color: data.isUnlocked
                      ? colorScheme.secondary
                      : colorScheme.outline,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelMedium?.copyWith(color: titleColor),
            ),
            const SizedBox(height: 2),
            Text(
              data.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeaderboardCard extends StatefulWidget {
  final StudyStatsState stats;
  final KpssExamFamily examFamily;

  const _LeaderboardCard({required this.stats, required this.examFamily});

  @override
  State<_LeaderboardCard> createState() => _LeaderboardCardState();
}

class _LeaderboardCardState extends State<_LeaderboardCard> {
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();
  late Future<List<LeaderboardEntry>> _leaderboardFuture;

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = _cloudSync.fetchLeaderboard(
      examFamily: widget.examFamily.key,
    );
  }

  @override
  void didUpdateWidget(covariant _LeaderboardCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.examFamily != widget.examFamily) {
      _leaderboardFuture = _cloudSync.fetchLeaderboard(
        examFamily: widget.examFamily.key,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsRegular.crown,
                      color: colorScheme.tertiary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Haftalık Kadro Ligi',
                        style: textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              KadroBadge(
                label: '${widget.examFamily.shortLabel} · Bu Hafta',
                tone: KadroBadgeTone.secondary,
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

              if (snapshot.hasError) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Sıralama yüklenemedi. Yerel ilerlemen güvende.',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _leaderboardFuture = _cloudSync.fetchLeaderboard(
                            examFamily: widget.examFamily.key,
                          );
                        });
                      },
                      child: const Text('Yenile'),
                    ),
                  ],
                );
              }

              final entries = List<LeaderboardEntry>.from(snapshot.data ?? []);

              final userEntry = LeaderboardEntry(
                displayName: 'Sen (Kadro Adayı)',
                totalXp: widget.stats.totalXp,
                leagueTier: widget.stats.leagueTier,
              );

              final allEntries = [...entries, userEntry];
              allEntries.sort((a, b) => b.totalXp.compareTo(a.totalXp));

              final visibleEntries = allEntries.take(5).toList();
              return Column(
                children: [
                  for (var i = 0; i < visibleEntries.length; i++) ...[
                    if (i > 0) const Divider(height: 1),
                    _LeaderboardRow(
                      rank: i + 1,
                      item: visibleEntries[i],
                      isCurrentUser: visibleEntries[i].displayName.startsWith(
                        'Sen',
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LeaderboardRow extends StatelessWidget {
  final int rank;
  final LeaderboardEntry item;
  final bool isCurrentUser;

  const _LeaderboardRow({
    required this.rank,
    required this.item,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? colorScheme.primaryContainer.withAlpha(90)
            : colorScheme.surface.withAlpha(0),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '$rank.',
              style: textTheme.titleSmall?.copyWith(
                color: rank <= 3
                    ? colorScheme.onTertiaryContainer
                    : colorScheme.onSurfaceVariant,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          const SizedBox(width: 6),
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
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: isCurrentUser
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                  ),
                ),
                Text(
                  item.leagueTier,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${item.totalXp} XP',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

class _MasteryHeatmapCard extends StatelessWidget {
  final ScopedStatsSummary summary;
  final ExamCurriculum curriculum;
  final bool includeAllSolvedLessons;

  const _MasteryHeatmapCard({
    required this.summary,
    required this.curriculum,
    this.includeAllSolvedLessons = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final seenNames = <String>{};
    final lessons = <(String, String)>[];
    for (final spec in curriculum.allLessons) {
      if (seenNames.add(spec.name)) {
        lessons.add((
          '${_abbreviateLesson(spec.name)} · ${spec.name}',
          spec.name,
        ));
      }
    }
    if (includeAllSolvedLessons) {
      for (final name in summary.solvedByLesson.keys) {
        if (seenNames.add(name)) {
          lessons.add(('${_abbreviateLesson(name)} · $name', name));
        }
      }
    }

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.shieldCheck,
                color: colorScheme.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Ders Ustalık Isı Haritası',
                  style: textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...lessons.map((item) {
            final displayName = item.$1;
            final keyName = item.$2;
            final label = summary.lessonMasteryLabel(keyName);

            Color badgeBg;
            Color badgeText;
            if (label.startsWith('Usta')) {
              badgeBg = colorScheme.secondaryContainer;
              badgeText = colorScheme.onSecondaryContainer;
            } else if (label.startsWith('Gelişiyor')) {
              badgeBg = colorScheme.primaryContainer;
              badgeText = colorScheme.onPrimaryContainer;
            } else if (label.startsWith('Kritik')) {
              badgeBg = colorScheme.errorContainer;
              badgeText = colorScheme.onErrorContainer;
            } else {
              badgeBg = colorScheme.surfaceContainerLow;
              badgeText = colorScheme.onSurfaceVariant;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      displayName,
                      style: textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  KadroBadge(
                    label: label,
                    backgroundColor: badgeBg,
                    foregroundColor: badgeText,
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

class _RecentSessionsCard extends StatelessWidget {
  final StudyStatsState stats;
  final ScopedStatsSummary summary;

  const _RecentSessionsCard({required this.stats, required this.summary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final sessions = summary.sessions;

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Çözülen Testler Arşivi (${sessions.length})',
                  style: textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
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
          const SizedBox(height: 6),
          if (sessions.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Bu sınav kapsamı için henüz tamamlanmış bir test oturumu yok.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            ...sessions.take(3).map((s) {
              return InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => QuizSessionDetailScreen(session: s),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 2,
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Net: ${s.netScore.toStringAsFixed(2)}  (+${s.earnedXp} XP)',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontFeatures: const [FontFeature.tabularFigures()],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 4),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: PhosphorIcon(
                    icon!,
                    size: 15,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonAccuracyChartCard extends StatelessWidget {
  final ScopedStatsSummary summary;
  final ExamCurriculum curriculum;
  final bool includeAllSolvedLessons;

  const _LessonAccuracyChartCard({
    required this.summary,
    required this.curriculum,
    this.includeAllSolvedLessons = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final lessonNames = <String>[];
    final seen = <String>{};
    for (final spec in curriculum.allLessons) {
      if (seen.add(spec.name)) {
        lessonNames.add(spec.name);
      }
    }
    if (includeAllSolvedLessons) {
      for (final name in summary.solvedByLesson.keys) {
        if (seen.add(name)) {
          lessonNames.add(name);
        }
      }
    }
    if (lessonNames.isEmpty) {
      lessonNames.addAll(const [
        'Tarih',
        'Coğrafya',
        'Vatandaşlık',
        'Güncel Bilgiler',
      ]);
    }

    final barColors = [
      colorScheme.tertiary,
      colorScheme.secondary,
      colorScheme.primary,
      colorScheme.error,
    ];

    final accessibleSummary = summary.totalSolved == 0
        ? 'Ders bazlı başarı oranı grafiği: Henüz çözülmüş soru bulunmuyor.'
        : lessonNames
              .map(
                (name) => '$name yüzde ${summary.lessonAccuracyPercent(name)}',
              )
              .join(', ');

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Ders Bazlı Başarı Oranı (%)',
                  style: textTheme.titleMedium,
                ),
              ),
              if (summary.totalSolved == 0)
                Text(
                  'Henüz veri yok',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
          if (summary.totalSolved == 0) ...[
            const SizedBox(height: 4),
            Text(
              'İlk testini çözdüğünde ders doğruluk sütunları burada görünecek.',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: 16),
          Semantics(
            label: accessibleSummary,
            child: SizedBox(
              height: 200,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final minWidth = math.max(
                    constraints.maxWidth,
                    lessonNames.length * 56.0,
                  );
                  final chart = SizedBox(
                    width: minWidth,
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        maxY: 100,
                        barTouchData: BarTouchData(
                          enabled: true,
                          handleBuiltInTouches: true,
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipColor: (_) => colorScheme.onSurface,
                            tooltipBorderRadius: BorderRadius.circular(10),
                            fitInsideHorizontally: true,
                            fitInsideVertically: true,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              if (groupIndex < 0 ||
                                  groupIndex >= lessonNames.length) {
                                return null;
                              }
                              final lessonName = lessonNames[groupIndex];
                              final pct = summary.lessonAccuracyPercent(
                                lessonName,
                              );
                              final solved =
                                  summary.solvedByLesson[lessonName] ?? 0;
                              return BarTooltipItem(
                                '$lessonName\n%$pct · $solved soru',
                                (textTheme.labelSmall ?? const TextStyle())
                                    .copyWith(
                                      color: colorScheme.surface,
                                      fontWeight: FontWeight.w600,
                                    ),
                              );
                            },
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: 25,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: colorScheme.outlineVariant,
                            strokeWidth: 0.8,
                          ),
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              interval: 50,
                              getTitlesWidget: (value, meta) => Text(
                                '${value.toInt()}',
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontFeatures: const [
                                    FontFeature.tabularFigures(),
                                  ],
                                ),
                              ),
                            ),
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
                                final idx = value.toInt();
                                final label =
                                    (idx >= 0 && idx < lessonNames.length)
                                    ? _abbreviateLesson(lessonNames[idx])
                                    : '';
                                return SideTitleWidget(
                                  meta: meta,
                                  child: Text(
                                    label,
                                    style: textTheme.labelMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        barGroups: [
                          for (var i = 0; i < lessonNames.length; i++)
                            BarChartGroupData(
                              x: i,
                              barRods: [
                                BarChartRodData(
                                  toY: summary
                                      .lessonAccuracyPercent(lessonNames[i])
                                      .toDouble(),
                                  color: barColors[i % barColors.length],
                                  width: 22,
                                  borderRadius: BorderRadius.circular(6),
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 100,
                                    color: colorScheme.surfaceContainerHighest,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                  if (lessonNames.length > 5) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: chart,
                    );
                  }
                  return chart;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeakLessonActionCard extends StatelessWidget {
  final String weakestLesson;
  final ExamSelection selection;

  const _WeakLessonActionCard({
    required this.weakestLesson,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      borderColor: colorScheme.tertiary.withAlpha(140),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsRegular.warningCircle,
            color: colorScheme.tertiary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zayıf Konuyu Güçlendir (10 Soru)',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$weakestLesson dersindeki eksiklerini kapat.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    lessonFilter: weakestLesson,
                    examSelection: selection,
                    customTitle: '$weakestLesson — Zayıf Konu Testi',
                    limit: 10,
                  ),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 36),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: const Text('10 Soru'),
          ),
        ],
      ),
    );
  }
}
