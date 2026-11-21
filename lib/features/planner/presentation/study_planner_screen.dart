import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_task_launcher.dart';
import 'package:kadro/features/planner/presentation/widgets/auto_study_program_modal.dart';
import 'package:kadro/features/planner/presentation/widgets/weekly_planner_calendar_grid.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Tam ekran KPSS çalışma planlayıcısı.
///
/// Web/Angular karşılığı: Task Management / Study Planner Component.
class StudyPlannerScreen extends ConsumerWidget {
  const StudyPlannerScreen({super.key});

  void _showAddTaskSheet(BuildContext context) {
    AdaptiveOverlay.showModal<void>(
      context: context,
      title: 'Yeni Çalışma Görevi',
      dialogMaxWidth: 520,
      builder: (_) => const _AddTaskBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planner = ref.watch(studyPlannerProvider);
    final notifier = ref.read(studyPlannerProvider.notifier);
    final prefs = ref.watch(userPreferencesProvider);
    final stats = ref.watch(studyStatsProvider);
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);
    final upcomingTasks = notifier.previewUpcomingTasks();
    final activeSelection = prefs.examSelection;
    final activeCurriculum = CurriculumRegistry.resolve(activeSelection);
    final showSprintSuggestion = AutoStudyProgramGenerator.isWithinSprintWindow(
      activeSelection,
    );
    final weeklyPreview = AutoStudyProgramGenerator.buildWeeklyPreview(
      selection: activeSelection,
      pace: prefs.studyProgramPace,
      weeklyStudyDays: planner.weeklyStudyDays,
      focusLesson: prefs.focusLesson,
      curriculum: activeCurriculum,
      startCycleDay: planner.cycleDay,
      isSprintMode: planner.isSprintModeActive,
    );

    final introHeader = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TugrulAvatar(
          mood: TugrulMood.streak,
          size: isSplitPane ? 62 : 56,
          onTap: () => TugrulTipsSheet.show(context, mood: TugrulMood.streak),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bugünkü Görevlerin',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                'Planlanan çalışma görevlerini sırayla tamamla ve süreni takip et.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (isSplitPane) ...[
          const SizedBox(width: 16),
          FilledButton.icon(
            key: const ValueKey('planner_desktop_add_task_button'),
            onPressed: () => _showAddTaskSheet(context),
            icon: const PhosphorIcon(PhosphorIconsBold.plus, size: 16),
            label: const Text('Görev Ekle'),
          ),
        ],
      ],
    );

    final summaryCard = _PlannerSummaryCard(
      planner: planner,
      onAdvanceNextDay: () {
        final prefs = ref.read(userPreferencesProvider);
        final curriculum = readOrWatchCurriculum(ref);
        final success = notifier.advanceToNextDay(
          examTarget: prefs.targetExam,
          pace: prefs.studyProgramPace,
          focusLesson: prefs.focusLesson,
          curriculum: curriculum,
          examScope: prefs.examSelection.scopeKey,
        );
        if (!success) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sonraki güne geçmek için bugünün tüm görevlerini tamamlamalısın! (Kalan: ${planner.remainingCount} görev)',
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      onPreviousDay: planner.hasPreviousDay
          ? () {
              final prefs = ref.read(userPreferencesProvider);
              final curriculum = readOrWatchCurriculum(ref);
              notifier.goToPreviousDay(
                examTarget: prefs.targetExam,
                pace: prefs.studyProgramPace,
                focusLesson: prefs.focusLesson,
                curriculum: curriculum,
                examScope: prefs.examSelection.scopeKey,
              );
            }
          : null,
    );

    final autoProgramBanner = _AutoStudyProgramBanner(
      prefs: prefs,
      target: prefs.targetExam,
    );

    final catchUpBanner = planner.hasMissedDays()
        ? _CatchUpPlannerBanner(
            missedDays: planner.missedDaysCount(),
            onRebalance: () {
              final carried = notifier.applyCatchUpRebalance(
                examTarget: prefs.targetExam,
                pace: prefs.studyProgramPace,
                focusLesson: prefs.focusLesson,
                curriculum: activeCurriculum,
                examScope: activeSelection.scopeKey,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '$carried bekleyen görev kalan günlere dengeli şekilde dağıtıldı.',
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          )
        : null;

    final sprintBanner = (showSprintSuggestion || planner.isSprintModeActive)
        ? _SprintModeBanner(
            isActive: planner.isSprintModeActive,
            remainingDays: activeSelection.detailedRemaining().totalDays,
            onActivate: planner.isSprintModeActive
                ? null
                : () {
                    notifier.activateSprintMode(
                      examTarget: prefs.targetExam,
                      pace: prefs.studyProgramPace,
                      focusLesson: prefs.focusLesson,
                      curriculum: activeCurriculum,
                      examScope: activeSelection.scopeKey,
                    );
                  },
          )
        : null;

    final weeklyCalendarWidget = WeeklyPlannerCalendarGrid(days: weeklyPreview);

    final tasksColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle('Görev Listesi (${planner.tasks.length})'),
        AppSpacing.gapXs,
        if (planner.tasks.isEmpty)
          const TactileCard(
            child: EmptyStateView(
              icon: PhosphorIconsRegular.calendarCheck,
              title: 'Planlanmış görev yok',
              description: 'Sıradaki görevlerden veya Görev Ekle butonundan yeni hedef ekleyebilirsin.',
            ),
          )
        else
          for (final task in planner.tasks)
            Padding(
              padding: AppSpacing.cardMarginBottom,
              child: _PlannerTaskTile(
                task: task,
                isPreviouslySolved:
                    task.actionType == StudyTaskActionType.quiz &&
                    task.targetTopic != null &&
                    task.targetTestNumber != null &&
                    stats.findLatestSessionForTest(
                          lesson: task.lessonTag,
                          topic: task.targetTopic!,
                          testNumber: task.targetTestNumber!,
                        ) !=
                        null,
                onToggle: () => notifier.toggleTask(task.id),
                onStart: () => StudyTaskLauncher.launch(context, ref, task),
                onRemove: () => notifier.removeTask(task.id),
              ),
            ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Çalışma Planlayıcın'),
        actions: [
          if (planner.completedCount > 0)
            TextButton.icon(
              onPressed: () => notifier.clearCompleted(),
              icon: const PhosphorIcon(PhosphorIconsRegular.trash, size: 16),
              label: const Text('Tamamlananları Sil'),
            ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: isSplitPane ? 1200 : 720,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: isSplitPane
              ? SingleChildScrollView(
                  padding: AppSpacing.pagePadding(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      introHeader,
                      AppSpacing.gapMd,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (catchUpBanner != null) ...[
                                  catchUpBanner,
                                  AppSpacing.gapMd,
                                ],
                                if (sprintBanner != null) ...[
                                  sprintBanner,
                                  AppSpacing.gapMd,
                                ],
                                summaryCard,
                                AppSpacing.gapMd,
                                autoProgramBanner,
                                AppSpacing.gapMd,
                                weeklyCalendarWidget,
                                if (upcomingTasks.isNotEmpty) ...[
                                  AppSpacing.gapMd,
                                  const SectionTitle(
                                    'Sıradaki Görevlerden Ekle (Tek Tıkla)',
                                  ),
                                  AppSpacing.gapXs,
                                  _UpcomingTasksStrip(
                                    tasks: upcomingTasks,
                                    onPullTask:
                                        notifier.pullUpcomingTaskToToday,
                                    wrapItems: true,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(flex: 7, child: tasksColumn),
                        ],
                      ),
                    ],
                  ),
                )
              : ListView(
                  padding: AppSpacing.pagePadding(context),
                  children: [
                    introHeader,
                    AppSpacing.gapMd,
                    if (catchUpBanner != null) ...[
                      catchUpBanner,
                      AppSpacing.gapMd,
                    ],
                    if (sprintBanner != null) ...[
                      sprintBanner,
                      AppSpacing.gapMd,
                    ],
                    summaryCard,
                    AppSpacing.gapMd,
                    autoProgramBanner,
                    AppSpacing.gapMd,
                    if (upcomingTasks.isNotEmpty) ...[
                      const SectionTitle(
                        'Sıradaki Görevlerden Ekle (Tek Tıkla)',
                      ),
                      AppSpacing.gapXs,
                      _UpcomingTasksStrip(
                        tasks: upcomingTasks,
                        onPullTask: notifier.pullUpcomingTaskToToday,
                      ),
                      AppSpacing.gapMd,
                    ],
                    tasksColumn,
                    AppSpacing.gapMd,
                    weeklyCalendarWidget,
                    const SizedBox(height: 64),
                  ],
                ),
        ),
      ),
      floatingActionButton: isSplitPane
          ? null
          : FloatingActionButton.extended(
              onPressed: () => _showAddTaskSheet(context),
              icon: const PhosphorIcon(PhosphorIconsBold.plus),
              label: const Text('Görev Ekle'),
            ),
    );
  }
}

class _PlannerSummaryCard extends StatelessWidget {
  final StudyPlannerState planner;
  final VoidCallback onAdvanceNextDay;
  final VoidCallback? onPreviousDay;

  const _PlannerSummaryCard({
    required this.planner,
    required this.onAdvanceNextDay,
    this.onPreviousDay,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      lipColor: colorScheme.primary,
      borderColor: colorScheme.primary.withAlpha(130),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (onPreviousDay != null) ...[
                IconButton(
                  icon: const PhosphorIcon(
                    PhosphorIconsBold.caretLeft,
                    size: 14,
                  ),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                  tooltip: 'Önceki Güne Dön',
                  onPressed: onPreviousDay,
                ),
                const SizedBox(width: 4),
              ],
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: planner.isViewingPastDay
                      ? colorScheme.tertiaryContainer
                      : colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  planner.isViewingPastDay
                      ? 'Gün ${planner.cycleDay} · Tekrar'
                      : 'Gün ${planner.cycleDay}',
                  style: textTheme.labelSmall?.copyWith(
                    color: planner.isViewingPastDay
                        ? colorScheme.onTertiaryContainer
                        : colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${planner.completedCount} / ${planner.totalCount} Görev Tamamlandı',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colorScheme.tertiary.withAlpha(100),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PhosphorIcon(
                      PhosphorIconsFill.clock,
                      size: 13,
                      color: colorScheme.onTertiaryContainer,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Toplam ${planner.totalEstimatedMinutes} dk',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: planner.completionProgress,
              backgroundColor: colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            ),
          ),
          if (planner.canAdvanceToNextDay) ...[
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: onAdvanceNextDay,
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
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
          ],
          if (onPreviousDay != null) ...[
            const SizedBox(height: 6),
            TextButton.icon(
              onPressed: onPreviousDay,
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(vertical: 4),
              ),
              icon: const PhosphorIcon(
                PhosphorIconsRegular.arrowLeft,
                size: 14,
              ),
              label: Text(
                'Önceki Günün Görevlerine Dön (Gün ${planner.cycleDay - 1})',
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Sıradaki günlerin gerçek [StudyTask] öğelerini tek tıkla bugünün listesine
/// aktaran yatay hızlı ekleme şeridi.
class _UpcomingTasksStrip extends StatelessWidget {
  final List<StudyTask> tasks;
  final void Function(StudyTask task) onPullTask;
  final bool wrapItems;

  const _UpcomingTasksStrip({
    required this.tasks,
    required this.onPullTask,
    this.wrapItems = false,
  });

  Color _accentFor(StudyTaskActionType actionType, ColorScheme colorScheme) {
    switch (actionType) {
      case StudyTaskActionType.flashcards:
      case StudyTaskActionType.map:
      case StudyTaskActionType.game:
        return colorScheme.tertiary;
      case StudyTaskActionType.mistakes:
        return colorScheme.error;
      case StudyTaskActionType.quiz:
      case StudyTaskActionType.exam:
      case StudyTaskActionType.custom:
        return colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final chips = [
      for (var i = 0; i < tasks.length; i++)
        Tooltip(
          message: '${tasks[i].lessonTag} · ${tasks[i].estimatedMinutes} dk',
          child: ActionChip(
            key: ValueKey('upcoming_quick_task_$i'),
            avatar: PhosphorIcon(
              PhosphorIconsRegular.plus,
              size: 15,
              color: _accentFor(tasks[i].actionType, colorScheme),
            ),
            label: Text('+ ${tasks[i].title}'),
            onPressed: () => onPullTask(tasks[i]),
          ),
        ),
    ];

    if (wrapItems) {
      return Wrap(spacing: 8, runSpacing: 8, children: chips);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < chips.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            chips[i],
          ],
        ],
      ),
    );
  }
}

class _PlannerTaskTile extends StatelessWidget {
  final StudyTask task;
  final VoidCallback onToggle;
  final VoidCallback onStart;
  final VoidCallback onRemove;
  final bool isPreviouslySolved;

  const _PlannerTaskTile({
    required this.task,
    required this.onToggle,
    required this.onStart,
    required this.onRemove,
    this.isPreviouslySolved = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: task.actionType != StudyTaskActionType.custom ? onStart : null,
      backgroundColor: task.isCompleted
          ? colorScheme.surfaceContainerLow
          : colorScheme.surface,
      borderColor: task.isCompleted
          ? colorScheme.outlineVariant
          : colorScheme.primary.withAlpha(80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: PhosphorIcon(
                task.isCompleted
                    ? PhosphorIconsFill.checkCircle
                    : PhosphorIconsRegular.circle,
                color: task.isCompleted
                    ? colorScheme.secondary
                    : colorScheme.outline,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      task.lessonTag,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      '· ${task.estimatedMinutes} dk',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (isPreviouslySolved)
                      Text(
                        '· Önceden çözüldü',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  task.title,
                  style: textTheme.titleSmall?.copyWith(
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                    color: task.isCompleted
                        ? colorScheme.onSurfaceVariant
                        : colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (task.actionType != StudyTaskActionType.custom)
            OutlinedButton.icon(
              onPressed: onStart,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: task.isCompleted
                    ? colorScheme.secondary
                    : null,
              ),
              icon: PhosphorIcon(
                task.isCompleted
                    ? PhosphorIconsRegular.arrowCounterClockwise
                    : PhosphorIconsRegular.play,
                size: 14,
              ),
              label: Text(task.isCompleted ? 'Tekrar Çöz' : 'Başla'),
            ),
          IconButton(
            icon: PhosphorIcon(
              PhosphorIconsRegular.trash,
              size: 18,
              color: colorScheme.error,
            ),
            onPressed: onRemove,
            tooltip: 'Görevi Sil',
          ),
        ],
      ),
    );
  }
}

class _AddTaskBottomSheet extends ConsumerStatefulWidget {
  const _AddTaskBottomSheet();

  @override
  ConsumerState<_AddTaskBottomSheet> createState() =>
      _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends ConsumerState<_AddTaskBottomSheet> {
  final _titleController = TextEditingController();
  String _selectedLesson = 'Tarih';
  int _selectedMinutes = 25;

  final _lessons = const [
    'Tarih',
    'Coğrafya',
    'Vatandaşlık',
    'Güncel Bilgiler',
    'Genel',
  ];
  final _durations = const [15, 25, 40, 65];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _titleController.text.trim();
    if (text.isEmpty) return;

    ref
        .read(studyPlannerProvider.notifier)
        .addTask(
          title: text,
          lessonTag: _selectedLesson,
          estimatedMinutes: _selectedMinutes,
          actionType: StudyTaskActionType.quiz,
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Yeni Görev Ekle', style: textTheme.headlineSmall),
              IconButton(
                icon: const PhosphorIcon(PhosphorIconsBold.x, size: 18),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Görev Başlığı',
              hintText: 'Örn: Osmanlı Yükselme Dönemi 2 Test',
              prefixIcon: PhosphorIcon(PhosphorIconsRegular.pencilSimple),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          Text(
            'Ders Seçimi',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _lessons.map((lesson) {
              return ChoiceChip(
                label: Text(lesson),
                selected: _selectedLesson == lesson,
                onSelected: (selected) {
                  if (selected) setState(() => _selectedLesson = lesson);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            'Tahmini Süre',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _durations.map((duration) {
              return ChoiceChip(
                label: Text('$duration dk'),
                selected: _selectedMinutes == duration,
                onSelected: (selected) {
                  if (selected) setState(() => _selectedMinutes = duration);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _submit,
            icon: const PhosphorIcon(PhosphorIconsRegular.calendarPlus),
            label: const Text('Plana Ekle'),
          ),
        ],
      ),
    );
  }
}

class _AutoStudyProgramBanner extends StatelessWidget {
  final UserPreferencesState prefs;
  final KpssExamTarget target;

  const _AutoStudyProgramBanner({required this.prefs, required this.target});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final pace = prefs.studyProgramPace;
    final remaining = target.detailedRemaining();
    final advisory = pace.evaluateSchedule(target);
    final accent = advisory.canFinishInTime
        ? colorScheme.primary
        : colorScheme.tertiary;

    return TactileCard(
      onTap: () => AutoStudyProgramModal.show(context),
      borderColor: accent.withAlpha(110),
      lipColor: accent.withAlpha(130),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              PhosphorIcon(
                advisory.canFinishInTime
                    ? PhosphorIconsRegular.slidersHorizontal
                    : PhosphorIconsFill.warningCircle,
                size: 20,
                color: accent,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prefs.hasActiveStudyProgram
                          ? '${pace.label} (${pace.badgeText})'
                          : 'Otomatik KPSS Programı',
                      style: textTheme.titleSmall?.copyWith(color: accent),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '${target.shortTitle} · ${remaining.formattedRemaining}',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => AutoStudyProgramModal.show(context),
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  minimumSize: const Size(0, 34),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
                icon: const PhosphorIcon(
                  PhosphorIconsRegular.slidersHorizontal,
                  size: 13,
                ),
                label: Text(
                  prefs.hasActiveStudyProgram ? 'Düzenle' : 'Program Kur',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            advisory.message,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _CatchUpPlannerBanner extends StatelessWidget {
  final int missedDays;
  final VoidCallback onRebalance;

  const _CatchUpPlannerBanner({
    required this.missedDays,
    required this.onRebalance,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: Color.alphaBlend(
        colorScheme.tertiaryContainer.withAlpha(110),
        colorScheme.surface,
      ),
      borderColor: colorScheme.tertiary,
      lipColor: colorScheme.tertiary,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.clockCountdown,
                size: 20,
                color: colorScheme.tertiary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$missedDays Günlük Çalışma Gecikmesi Tespit Edildi',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Yığılmayı önlemek için kalan görevleri önümüzdeki günlere dengeli yayabilirsin.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          FilledButton.tonalIcon(
            key: const ValueKey('planner_catch_up_button'),
            onPressed: onRebalance,
            icon: const PhosphorIcon(
              PhosphorIconsBold.arrowsClockwise,
              size: 16,
            ),
            label: const Text(
              'Kaçırdığım Günleri Telafi Et',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _SprintModeBanner extends StatelessWidget {
  final bool isActive;
  final int remainingDays;
  final VoidCallback? onActivate;

  const _SprintModeBanner({
    required this.isActive,
    required this.remainingDays,
    this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final accent = isActive ? colorScheme.secondary : colorScheme.primary;

    return TactileCard(
      backgroundColor: Color.alphaBlend(
        accent.withAlpha(24),
        colorScheme.surface,
      ),
      borderColor: accent,
      lipColor: accent,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.lightning,
                size: 20,
                color: accent,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isActive
                          ? 'Son 30 Gün Sprint Modu Aktif'
                          : 'Sınava $remainingDays Gün Kaldı · Sprint Hazır',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      isActive
                          ? 'Deneme simülasyonu ve yanlış tekrar ağırlığı otomatik artırıldı.'
                          : 'Son düzlüğe özel deneme ve çeldirici tekrar yoğunluğunu aktifleştir.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!isActive && onActivate != null) ...[
            const SizedBox(height: 10),
            FilledButton.icon(
              key: const ValueKey('planner_sprint_button'),
              onPressed: onActivate,
              icon: const PhosphorIcon(PhosphorIconsBold.lightning, size: 16),
              label: const Text(
                'Son 30 Gün Sprint Moduna Geç',
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
