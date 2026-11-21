import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_task_launcher.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Ana Sayfa sadeleştirilmiş çalışma planı kartı.
///
/// Web/Angular benzetmesi: Kullanıcının yalnızca bugünkü görevlerini, günlük
/// ilerleme çubuğunu ve tek dokunuşla başlatma aksiyonlarını gösteren
/// kompakt `<app-home-daily-plan-card>` bileşenidir.
class HomeDailyPlanCard extends ConsumerWidget {
  const HomeDailyPlanCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final planner = ref.watch(studyPlannerProvider);
    final notifier = ref.read(studyPlannerProvider.notifier);
    final prefs = ref.watch(userPreferencesProvider);
    final activeCurriculum = readOrWatchCurriculum(ref);

    final progress = planner.totalCount == 0
        ? 0.0
        : (planner.completedCount / planner.totalCount).clamp(0.0, 1.0);
    final isAllDone =
        planner.totalCount > 0 && planner.completedCount == planner.totalCount;

    return TactileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Üst Başlık ve Kompakt İlerleme Rozeti
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: PhosphorIcon(
                  PhosphorIconsFill.listChecks,
                  color: colorScheme.primary,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Bugünün Çalışma Planı',
                  softWrap: true,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              KadroBadge(
                label: '${planner.completedCount}/${planner.totalCount}',
                backgroundColor: isAllDone
                    ? colorScheme.secondaryContainer
                    : colorScheme.surfaceContainerHighest,
                foregroundColor: isAllDone
                    ? colorScheme.onSecondaryContainer
                    : colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 2. Program Özeti Satırı
          Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              KadroBadge(
                label: 'Gün ${planner.cycleDay}',
                backgroundColor: colorScheme.surfaceContainerLow,
                foregroundColor: planner.isViewingPastDay
                    ? colorScheme.tertiary
                    : colorScheme.onSurface,
                borderColor: planner.isViewingPastDay
                    ? colorScheme.tertiary.withAlpha(140)
                    : colorScheme.outlineVariant,
              ),
              if (planner.isViewingPastDay)
                const KadroBadge(
                  label: 'Tekrar',
                  tone: KadroBadgeTone.tertiary,
                ),
              Text(
                prefs.hasActiveStudyProgram
                    ? prefs.studyProgramPace.label
                    : 'Program Seç',
                softWrap: true,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 3. Günlük İlerleme Çubuğu
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    minHeight: 6,
                    value: progress,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isAllDone ? colorScheme.secondary : colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${planner.completedCount}/${planner.totalCount} görev',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 4. Okunaklı Görev Kutuları (Tüm Görevler Eksiksiz)
          if (planner.tasks.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Bugün için planlanan tüm görevleri tamamladınız veya henüz görev bulunmuyor.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            ...planner.tasks.map((task) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _DailyPlanTaskItem(
                  task: task,
                  onToggle: () => notifier.toggleTask(task.id),
                  onLaunch: () => StudyTaskLauncher.launch(context, ref, task),
                ),
              );
            }),

          // 5. Gün Geçiş Aksiyonları
          if (planner.canAdvanceToNextDay) ...[
            const SizedBox(height: 4),
            FilledButton.icon(
              onPressed: () {
                notifier.advanceToNextDay(
                  examTarget: prefs.targetExam,
                  pace: prefs.studyProgramPace,
                  focusLesson: prefs.focusLesson,
                  curriculum: activeCurriculum,
                  examScope: prefs.examSelection.scopeKey,
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              icon: const PhosphorIcon(PhosphorIconsBold.arrowRight, size: 16),
              label: Text(
                planner.isViewingPastDay
                    ? 'Sıradaki Güne Dön (Gün ${planner.cycleDay + 1}) →'
                    : 'Günü Tamamladın! Sonraki Güne Geç (Gün ${planner.cycleDay + 1}) →',
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ] else if (planner.isViewingPastDay &&
              planner.cycleDay < planner.maxUnlockedDay) ...[
            const SizedBox(height: 4),
            OutlinedButton.icon(
              onPressed: () => notifier.goToDay(
                planner.cycleDay + 1,
                examTarget: prefs.targetExam,
                pace: prefs.studyProgramPace,
                focusLesson: prefs.focusLesson,
                curriculum: activeCurriculum,
                examScope: prefs.examSelection.scopeKey,
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
              icon: const PhosphorIcon(
                PhosphorIconsRegular.arrowRight,
                size: 15,
              ),
              label: Text(
                'Sonraki Açık Güne Git (Gün ${planner.cycleDay + 1})',
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
          if (planner.hasPreviousDay) ...[
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: () {
                notifier.goToPreviousDay(
                  examTarget: prefs.targetExam,
                  pace: prefs.studyProgramPace,
                  focusLesson: prefs.focusLesson,
                  curriculum: activeCurriculum,
                  examScope: prefs.examSelection.scopeKey,
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 4),
                minimumSize: const Size(0, 32),
              ),
              icon: const PhosphorIcon(
                PhosphorIconsRegular.arrowLeft,
                size: 15,
              ),
              label: Text(
                'Önceki Güne Dön (Gün ${planner.cycleDay - 1} Tekrarı)',
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Ana sayfa günlük plan kartı içindeki okunaklı tekil görev satırı.
///
/// Web/Angular karşılığı: Başlığı, ders etiketini, tahmini süresini ve durum aksiyonunu
/// küçük ekranlarda bile kesilmeden (`softWrap: true`) çerçeveli kutu olarak sunan
/// `<app-daily-plan-task-item>` bileşenidir.
class _DailyPlanTaskItem extends StatelessWidget {
  final StudyTask task;
  final VoidCallback onToggle;
  final VoidCallback onLaunch;

  const _DailyPlanTaskItem({
    required this.task,
    required this.onToggle,
    required this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: task.isCompleted
              ? colorScheme.secondary.withAlpha(100)
              : colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 14, 6, 14),
              child: PhosphorIcon(
                task.isCompleted
                    ? PhosphorIconsFill.checkCircle
                    : PhosphorIconsRegular.circle,
                size: 20,
                color: task.isCompleted
                    ? colorScheme.secondary
                    : colorScheme.outline,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onLaunch,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 10, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            task.title,
                            softWrap: true,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: task.isCompleted
                                  ? colorScheme.onSurfaceVariant
                                  : colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                task.lessonTag,
                                softWrap: true,
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (task.estimatedMinutes > 0)
                                Text(
                                  '· ${task.estimatedMinutes} dk',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (task.actionType != StudyTaskActionType.custom) ...[
                      const SizedBox(width: 8),
                      if (task.isCompleted)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PhosphorIcon(
                              PhosphorIconsRegular.arrowCounterClockwise,
                              size: 13,
                              color: colorScheme.onSecondaryContainer,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Tekrar',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Başla',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 2),
                            PhosphorIcon(
                              PhosphorIconsRegular.caretRight,
                              size: 13,
                              color: colorScheme.primary,
                            ),
                          ],
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
