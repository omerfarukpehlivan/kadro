import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';
import 'package:kadro/features/topic_lessons/data/topic_lesson_repository.dart';
import 'package:kadro/features/topic_lessons/presentation/topic_lesson_unit_screen.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_error_state.dart';
import 'package:kadro/shared/widgets/kadro_skeleton.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bir konunun yayınlanmış konu anlatımı bölümlerini (`TopicLessonUnit`),
/// toplam okuma süresini ve tamamlanma yüzdesini listeyip okuyucuya veya
/// doğrudan konu testlerine bağlayan ekran (`TASK-168`).
///
/// Angular/Web Karşılığı: `/konu-anlatimi/[ders]/[konu]` sayfa bileşeni.
class TopicLessonScreen extends ConsumerWidget {
  final String lessonName;
  final String topic;
  final ExamSelection? selection;

  const TopicLessonScreen({
    super.key,
    required this.lessonName,
    required this.topic,
    this.selection,
  });

  ExamSelection _resolveSelection(WidgetRef ref) {
    if (selection != null) return selection!;
    try {
      return ref.watch(userPreferencesProvider).examSelection;
    } catch (_) {
      return ExamSelection.initial;
    }
  }

  void _openUnit(
    BuildContext context, {
    required TopicLessonUnit unit,
    required List<TopicLessonUnit> allUnits,
    required ExamSelection activeSelection,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TopicLessonUnitScreen(
          unit: unit,
          allUnits: allUnits,
          selection: activeSelection,
        ),
      ),
    );
  }

  void _openTopicTests(BuildContext context, ExamSelection activeSelection) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TopicTestsScreen(
          lessonName: lessonName,
          topic: topic,
          selection: activeSelection,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeSelection = _resolveSelection(ref);
    final mood = TugrulMoodExtension.fromLesson(lessonName);
    final accent = mood.accentColor(colorScheme);

    final queryKey = TopicLessonQueryKey(
      scopeKey: activeSelection.scopeKey,
      lessonName: lessonName,
      topic: topic,
    );
    final unitsAsync = ref.watch(topicLessonUnitsProvider(queryKey));
    final progressMap = ref.watch(topicLessonProgressProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          '$topic · Konu Anlatımı',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: unitsAsync.when(
        loading: () => const KadroSkeletonList(itemCount: 4),
        error: (_, _) => KadroErrorState.network(
          title: 'Konu anlatımı yüklenemedi',
          description: 'Bağlantını kontrol edip tekrar deneyebilir veya doğrudan bu konunun testlerine geçebilirsin.',
          onRetry: () => ref.invalidate(topicLessonUnitsProvider(queryKey)),
          secondaryActionLabel: 'Konu Testlerine Geç',
          onSecondaryAction: () => _openTopicTests(context, activeSelection),
        ),
        data: (units) {
          if (units.isEmpty) {
            return EmptyStateView(
              icon: PhosphorIconsRegular.bookOpenText,
              title: 'Bu konu için anlatım hazırlanıyor',
              description:
                  '$lessonName · $topic konu anlatımı bölümleri yakında eklenecek. Şimdilik konu testleriyle pratik yapabilirsin.',
              actionLabel: 'Konu Testlerine Geç',
              onAction: () => _openTopicTests(context, activeSelection),
            );
          }

          final completedCount = units
              .where((u) => progressMap[u.id]?.isCompleted ?? false)
              .length;
          final percent = TopicLessonDomain.computeProgressPercent(
            completedCount: completedCount,
            totalPublishedCount: units.length,
          );
          final totalMinutes = units.fold<int>(
            0,
            (sum, u) => sum + u.estimatedMinutes,
          );
          final nextIncomplete = units
              .where((u) => !(progressMap[u.id]?.isCompleted ?? false))
              .firstOrNull;
          final primaryTargetUnit = nextIncomplete ?? units.first;

          return ResponsiveContentWrapper(
            maxWidth: 720,
            padding: EdgeInsets.zero,
            child: ListView(
              padding: AppSpacing.pagePadding(context),
              children: [
                TactileCard(
                  backgroundColor: colorScheme.surfaceContainerLow,
                  borderColor: accent.withAlpha(120),
                  lipColor: accent.withAlpha(150),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 6,
                                  runSpacing: 4,
                                  children: [
                                    KadroBadge(
                                      label:
                                          '${units.length} Bölüm · ~$totalMinutes dk okuma',
                                      backgroundColor: accent.withAlpha(24),
                                      foregroundColor: accent,
                                    ),
                                    KadroBadge(
                                      label:
                                          '%$percent Tamamlandı ($completedCount/${units.length})',
                                      tone: percent >= 100
                                          ? KadroBadgeTone.secondary
                                          : KadroBadgeTone.primary,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  topic,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Önce bölümleri sırayla oku ve bölüm sonundaki mini sorularla kendini yokla; ardından konu testlerine geç.',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    height: 1.45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          TugrulAvatar(
                            mood: mood,
                            size: 62,
                            ringColor: accent,
                            tooltip: '$lessonName Çalışma İpuçları',
                            onTap: () =>
                                TugrulTipsSheet.show(context, mood: mood),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: (percent / 100.0).clamp(0.0, 1.0),
                          minHeight: 8,
                          backgroundColor: colorScheme.surfaceContainerHighest,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            percent >= 100 ? colorScheme.secondary : accent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              key: const ValueKey(
                                'topic_lesson_primary_start_button',
                              ),
                              onPressed: () => _openUnit(
                                context,
                                unit: primaryTargetUnit,
                                allUnits: units,
                                activeSelection: activeSelection,
                              ),
                              icon: PhosphorIcon(
                                completedCount == 0
                                    ? PhosphorIconsBold.bookOpenText
                                    : PhosphorIconsBold.play,
                                size: 16,
                              ),
                              label: Text(
                                completedCount == 0
                                    ? '1. Bölümden Başla'
                                    : (nextIncomplete != null
                                          ? 'Bölüm ${nextIncomplete.unitOrder} ile Devam Et'
                                          : 'Baştan Tekrar Oku'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            key: const ValueKey(
                              'topic_lesson_open_tests_button',
                            ),
                            onPressed: () =>
                                _openTopicTests(context, activeSelection),
                            icon: const PhosphorIcon(
                              PhosphorIconsBold.exam,
                              size: 16,
                            ),
                            label: const Text('Testler'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppSpacing.gapMd,
                for (var i = 0; i < units.length; i++) ...[
                  _TopicLessonUnitCard(
                    unit: units[i],
                    isCompleted: progressMap[units[i].id]?.isCompleted ?? false,
                    onTap: () => _openUnit(
                      context,
                      unit: units[i],
                      allUnits: units,
                      activeSelection: activeSelection,
                    ),
                  ),
                  if (i < units.length - 1) const SizedBox(height: 12),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TopicLessonUnitCard extends StatelessWidget {
  final TopicLessonUnit unit;
  final bool isCompleted;
  final VoidCallback onTap;

  const _TopicLessonUnitCard({
    required this.unit,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      onTap: onTap,
      backgroundColor: isCompleted
          ? colorScheme.secondaryContainer.withAlpha(45)
          : colorScheme.surface,
      borderColor: isCompleted
          ? colorScheme.secondary.withAlpha(150)
          : colorScheme.outlineVariant,
      lipColor: isCompleted
          ? colorScheme.secondary.withAlpha(160)
          : colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isCompleted
                  ? colorScheme.secondary
                  : colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: isCompleted
                ? PhosphorIcon(
                    PhosphorIconsBold.check,
                    size: 16,
                    color: colorScheme.onSecondary,
                  )
                : Text(
                    '${unit.unitOrder}',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    KadroBadge(
                      label: '~${unit.estimatedMinutes} dk okuma',
                      icon: PhosphorIconsRegular.clock,
                      tone: KadroBadgeTone.neutral,
                    ),
                    if (isCompleted)
                      const KadroBadge(
                        label: 'Okundu',
                        icon: PhosphorIconsFill.checkCircle,
                        tone: KadroBadgeTone.secondary,
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  unit.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (unit.summary != null &&
                    unit.summary!.trim().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    unit.summary!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            PhosphorIconsRegular.caretRight,
            size: 18,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
