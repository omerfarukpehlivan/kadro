import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/current_affairs/presentation/current_affairs_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/widgets/lesson_progress_ring.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Dersler sekmesi: 4 KPSS Genel Kültür dersinin kendi karakter dünyası ve ağırlık dağılımı.
class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curriculum = ref.watch(activeCurriculumProvider);
    final activeLessons = curriculum.activeLessons;
    final upcomingLessons = curriculum.upcomingLessons;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);
    final columns = screenWidth >= 1200 ? 3 : (screenWidth >= 720 ? 2 : 1);
    final gridRunSpacing = columns == 1 ? 10.0 : 12.0;

    return ResponsiveContentWrapper(
      maxWidth: isLargeTablet ? 1240 : 720,
      padding: EdgeInsets.zero,
      child: Scrollbar(
        child: ListView(
          padding: AppSpacing.pagePadding(context),
          children: [
            if (activeLessons.isNotEmpty) ...[
              SectionTitle(curriculum.activeSectionTitle),
              ResponsiveGrid(
                columns: columns,
                spacing: 12,
                runSpacing: gridRunSpacing,
                children: [
                  for (final lesson in activeLessons)
                    _LessonCard(
                      lesson: lesson.toLesson(),
                      margin: EdgeInsets.zero,
                    ),
                ],
              ),
            ],
            if (upcomingLessons.isNotEmpty) ...[
              AppSpacing.gapLg,
              SectionTitle(curriculum.upcomingSectionTitle),
              ResponsiveGrid(
                columns: columns,
                spacing: 12,
                runSpacing: gridRunSpacing,
                children: [
                  for (final lesson in upcomingLessons)
                    _ComingSoonLessonCard(
                      lesson: lesson.toLesson(),
                      examContextLabel: curriculum.upcomingContextLabel,
                      margin: EdgeInsets.zero,
                    ),
                ],
              ),
            ],
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Color _lessonColor(String lessonName, ColorScheme scheme) {
  final n = lessonName.toLowerCase();
  if (n.contains('tarih') || n.contains('matematik')) return scheme.tertiary;
  if (n.contains('coğrafya') || n.contains('cografya')) {
    return scheme.secondary;
  }
  if (n.contains('vatandaşlık') ||
      n.contains('vatandaslik') ||
      n.contains('türkçe') ||
      n.contains('turkce')) {
    return scheme.primary;
  }
  if (n.contains('güncel') || n.contains('guncel')) return scheme.error;
  final palette = [scheme.primary, scheme.secondary, scheme.tertiary];
  return palette[n.hashCode.abs() % palette.length];
}

class _LessonCard extends ConsumerWidget {
  final Lesson lesson;
  final EdgeInsetsGeometry margin;

  const _LessonCard({
    required this.lesson,
    this.margin = AppSpacing.cardMarginBottom,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final stats = ref.watch(studyStatsProvider);

    final sessionSolved = stats.sessionHistory
        .where((s) => s.lesson.toLowerCase() == lesson.name.toLowerCase())
        .length;
    final questionBasedSolved = ((stats.solvedByLesson[lesson.name] ?? 0) / 10)
        .floor();
    final solvedCount = sessionSolved > questionBasedSolved
        ? sessionSolved
        : questionBasedSolved;
    final totalTests = lesson.topics.isNotEmpty
        ? lesson.topics.fold<int>(
            0,
            (sum, topic) => sum + defaultTopicTestCount(lesson.name, topic),
          )
        : 0;
    final progress = totalTests > 0
        ? (solvedCount / totalTests).clamp(0.0, 1.0)
        : 0.0;
    final percent = (progress * 100).toInt();

    final accent = _lessonColor(lesson.name, colorScheme);
    final mood = TugrulMoodExtension.fromLesson(lesson.name);

    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);
    final ringSize = isLargeTablet ? 82.0 : 62.0;

    return Padding(
      padding: margin,
      child: TactileCard(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => LessonTopicsScreen(lesson: lesson),
            ),
          );
        },
        borderColor: accent.withAlpha(110),
        lipColor: accent.withAlpha(130),
        child: Row(
          children: [
            LessonProgressRing(
              icon: lesson.icon,
              mascotMood: mood,
              accentColor: accent,
              progress: progress,
              solvedCount: solvedCount,
              totalCount: totalTests,
              size: ringSize,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Text(
                        lesson.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (lesson.badgeText != null)
                        Tooltip(
                          message: 'Her hafta yeni sorularla güncellenir',
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: accent.withAlpha(20),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: accent.withAlpha(65)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PhosphorIcon(
                                  PhosphorIconsRegular.arrowsClockwise,
                                  size: 11,
                                  color: accent,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  lesson.badgeText!,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: accent,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sınavda ${lesson.questionCount} soru · ${lesson.topics.length} konu',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    solvedCount > 0
                        ? '$solvedCount / $totalTests Test Çözüldü (%$percent)'
                        : '0 / $totalTests Test (%0)',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: progress > 0 ? colorScheme.secondary : accent,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                  if (lesson.name.toLowerCase().contains('güncel') ||
                      lesson.name.toLowerCase().contains('guncel')) ...[
                    const SizedBox(height: 8),
                    ActionChip(
                      key: const ValueKey(
                        'lessons_current_affairs_bulletin_cta',
                      ),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      avatar: PhosphorIcon(
                        PhosphorIconsFill.newspaper,
                        size: 14,
                        color: accent,
                      ),
                      label: Text(
                        'Aylık Bülten Akışı →',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => const CurrentAffairsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
            PhosphorIcon(
              PhosphorIconsRegular.caretRight,
              size: 18,
              color: accent,
            ),
          ],
        ),
      ),
    );
  }
}

class _ComingSoonLessonCard extends StatelessWidget {
  final Lesson lesson;
  final String examContextLabel;
  final EdgeInsetsGeometry margin;

  const _ComingSoonLessonCard({
    required this.lesson,
    required this.examContextLabel,
    this.margin = AppSpacing.cardMarginBottom,
  });

  void _showComingSoonSheet(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = _lessonColor(lesson.name, colorScheme);

    AdaptiveOverlay.showModal<void>(
      context: context,
      title: lesson.name,
      dialogMaxWidth: 520,
      showMobileHeader: true,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                TugrulAvatar(
                  mood: TugrulMood.coach,
                  size: ResponsiveBreakpoints.isLargeTablet(context) ? 68 : 52,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            lesson.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Çok Yakında',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onTertiaryContainer,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Tuğrul Hazırlıyor! · ${lesson.questionCount} Soru',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '$examContextLabel kapsamındaki ${lesson.name} dersi için ÖSYM formatında özgün soru havuzu, yeni nesil soru açıklamaları ve interaktif çalışma modülleri titizlikle hazırlanmaktadır. Çok yakında Kadro\'da aktif olacaktır.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Hazırlanan Konu Modülleri:',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: lesson.topics.map((t) {
                return Chip(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  labelPadding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: colorScheme.surfaceContainerLow,
                  label: Text(
                    t,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Anladım, Takipteyim'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = _lessonColor(lesson.name, colorScheme);

    return Padding(
      padding: margin,
      child: TactileCard(
        onTap: () => _showComingSoonSheet(context),
        borderColor: colorScheme.outlineVariant.withAlpha(120),
        lipColor: colorScheme.outlineVariant.withAlpha(80),
        backgroundColor: colorScheme.surfaceContainerLowest,
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: accent.withAlpha(22),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: accent.withAlpha(50)),
              ),
              alignment: Alignment.center,
              child: PhosphorIcon(lesson.icon, size: 26, color: accent),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      Text(
                        lesson.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: colorScheme.tertiary.withAlpha(80),
                          ),
                        ),
                        child: Text(
                          'Yakında',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Sınavda ${lesson.questionCount} soru · ${lesson.topics.length} konu modülü',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            PhosphorIcon(
              PhosphorIconsRegular.lockSimple,
              size: 18,
              color: colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }
}
