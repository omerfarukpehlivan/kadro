import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/data/models/mistake_review_entry.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_task_launcher.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/kadro_filter_chips.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:kadro/shared/widgets/math_text.dart';
import 'package:kadro/shared/widgets/question_figure.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Yanlış yapılan soruların biriktiği ve tekrar çözülebildiği Yanlış Defteri ekranı.
class MistakesScreen extends ConsumerStatefulWidget {
  final MistakeRepository mistakeRepository;
  final VoidCallback? onCompleted;
  final String? taskId;

  const MistakesScreen({
    super.key,
    this.mistakeRepository = const MistakeRepository(),
    this.onCompleted,
    this.taskId,
  });

  @override
  ConsumerState<MistakesScreen> createState() => _MistakesScreenState();
}

class _MistakesScreenState extends ConsumerState<MistakesScreen> {
  String _selectedLesson = 'Tümü';
  bool _hasNotifiedCompletion = false;

  @override
  void initState() {
    super.initState();
    if (widget.onCompleted != null &&
        widget.mistakeRepository.getMistakes().isEmpty) {
      _hasNotifiedCompletion = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onCompleted?.call();
      });
    }
  }

  void _notifyDone() {
    if (!_hasNotifiedCompletion) {
      _hasNotifiedCompletion = true;
      widget.onCompleted?.call();
    }
  }

  Future<void> _solveMistakes(List<Question> mistakes) async {
    if (mistakes.isEmpty) return;

    bool isPro = false;
    try {
      isPro = ref.read(userPreferencesProvider).isPro;
    } catch (_) {
      // ProviderScope bulunmayan izole test fallback
    }

    if (!isPro) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Kadro PRO ile yanlış yaptığın sorulardan dilediğin an özel testler üretebilirsin.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      await Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => const PaywallScreen(
            reasonMessage: 'Akıllı Yanlış Defteri Test Üretici: Yanlış yaptığın sorulardan özel testler üretip çözmek Kadro PRO üyelerine özeldir.',
          ),
        ),
      );
      if (mounted) setState(() {});
      return;
    }

    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: mistakes,
          mistakeRepository: widget.mistakeRepository,
          customTitle: _selectedLesson == 'Tümü'
              ? 'Yanlış Defteri Testi'
              : '$_selectedLesson Yanlışları Testi',
          onCompleted: _notifyDone,
          taskId: widget.taskId,
        ),
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _startDueReview(List<Question> dueQuestions) async {
    if (dueQuestions.isEmpty) return;

    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: dueQuestions,
          mistakeRepository: widget.mistakeRepository,
          customTitle: 'Günlük Leitner Tekrarı (${dueQuestions.length} Soru)',
          onCompleted: _notifyDone,
          taskId: widget.taskId,
        ),
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  void _removeMistake(String questionId) {
    setState(() {
      widget.mistakeRepository.removeMistake(questionId);
    });
    if (widget.mistakeRepository.getMistakes().isEmpty) {
      _notifyDone();
    }
  }

  void _goToHome() {
    popBranchToRoot();

    final rootNav = Navigator.maybeOf(context, rootNavigator: true);
    final branchNav = Navigator.maybeOf(context);

    if (branchNav != null && branchNav != rootNav && branchNav.canPop()) {
      branchNav.popUntil((route) => route.isFirst);
    }

    if (rootNav != null && rootNav.canPop()) {
      rootNav.popUntil((route) => route.isFirst);
    }

    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.go('/');
    }
  }

  StudyTask? _resolveNextDailyTask() {
    if (widget.taskId == null && widget.onCompleted == null) return null;
    try {
      final planner = ref.watch(studyPlannerProvider);
      return planner.tasks
          .where((t) => !t.isCompleted && t.id != widget.taskId)
          .firstOrNull;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.mistakeRepository.getReviewEntries();
    final nextTask = _resolveNextDailyTask();
    final isDailyFlow = widget.taskId != null || widget.onCompleted != null;

    if (entries.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Yanlış Defteri')),
        body: _EmptyMistakesView(
          onGoHome: _goToHome,
          nextTask: isDailyFlow ? nextTask : null,
          onNextTask: (isDailyFlow && nextTask != null)
              ? () {
                  final nav = Navigator.maybeOf(context);
                  if (nav != null && nav.canPop()) {
                    nav.pop();
                  }
                  StudyTaskLauncher.launch(context, ref, nextTask);
                }
              : null,
        ),
      );
    }

    final lessonCounts = <String, int>{};
    for (final entry in entries) {
      final lesson = entry.question.lesson;
      lessonCounts[lesson] = (lessonCounts[lesson] ?? 0) + 1;
    }

    final curriculum = readOrWatchCurriculum(ref);
    final filterLessons = curriculum.buildFilterLessons(
      entries.map((e) => e.question.lesson),
    );
    final effectiveSelected = filterLessons.contains(_selectedLesson)
        ? _selectedLesson
        : 'Tümü';

    final filteredEntries = effectiveSelected == 'Tümü'
        ? entries
        : entries.where((e) => e.question.lesson == effectiveSelected).toList();
    final filteredQuestions = filteredEntries
        .map((e) => e.question)
        .toList(growable: false);
    final dueEntries = widget.mistakeRepository.getDueEntries();
    final dueQuestions = dueEntries
        .map((e) => e.question)
        .toList(growable: false);

    bool isPro = false;
    try {
      isPro = ref.watch(userPreferencesProvider).isPro;
    } catch (_) {
      // ProviderScope bulunmayan izole test fallback
    }

    final filterOptions = filterLessons
        .map(
          (lessonName) => KadroFilterOption<String>(
            value: lessonName,
            label: lessonName == 'Tümü'
                ? 'Tümü (${entries.length})'
                : '$lessonName (${lessonCounts[lessonName] ?? 0})',
          ),
        )
        .toList(growable: false);

    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Yanlış Defteri')),
      body: ResponsiveContentWrapper(
        maxWidth: isSplitPane ? 1200 : 720,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: AppSpacing.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              KadroFilterChips<String>(
                options: filterOptions,
                selectedValue: effectiveSelected,
                wrap: isSplitPane,
                onSelected: (selectedLesson) {
                  setState(() {
                    _selectedLesson = selectedLesson;
                  });
                },
              ),
              AppSpacing.gapSm,

              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (dueQuestions.isNotEmpty) ...[
                          _LeitnerDueReviewBanner(
                            dueCount: dueQuestions.length,
                            onStartReview: () => _startDueReview(dueQuestions),
                          ),
                          AppSpacing.gapSm,
                        ],

                        _MistakeHeaderCard(
                          mistakeCount: filteredQuestions.length,
                          lessonName: effectiveSelected,
                          totalMistakes: entries.length,
                          onSolveAll: () => _solveMistakes(filteredQuestions),
                          isPro: isPro,
                        ),
                        AppSpacing.gapMd,

                        if (filteredEntries.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Center(
                              child: Text(
                                '$effectiveSelected dersinden yanlışın bulunmuyor.',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                            ),
                          )
                        else if (isSplitPane)
                          ResponsiveGrid(
                            columns: 2,
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              for (final entry in filteredEntries)
                                _MistakeQuestionCard(
                                  entry: entry,
                                  margin: EdgeInsets.zero,
                                  onDelete: () =>
                                      _removeMistake(entry.question.id),
                                ),
                            ],
                          )
                        else
                          for (final entry in filteredEntries)
                            _MistakeQuestionCard(
                              entry: entry,
                              onDelete: () => _removeMistake(entry.question.id),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyMistakesView extends StatelessWidget {
  final VoidCallback onGoHome;
  final StudyTask? nextTask;
  final VoidCallback? onNextTask;

  const _EmptyMistakesView({
    required this.onGoHome,
    this.nextTask,
    this.onNextTask,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const EmptyStateView(
          mascotMood: TugrulMood.detective,
          icon: PhosphorIconsRegular.checkCircle,
          title: 'Yanlış defterinde bekleyen soru yok',
          description: 'Testlerde yanlış yaptığın sorular otomatik olarak burada birikir.',
        ),
        if (nextTask != null && onNextTask != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: FilledButton.icon(
              onPressed: onNextTask,
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
              ),
              icon: const PhosphorIcon(PhosphorIconsBold.arrowRight, size: 16),
              label: Text(
                'Sıradaki Göreve Geç: ${nextTask!.title} →',
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 10,
          children: [
            FilledButton.tonalIcon(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
              icon: const PhosphorIcon(PhosphorIconsBold.play, size: 16),
              label: const Text('Yeni Test Çöz'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(builder: (_) => const FlashcardsScreen()),
                );
              },
              icon: const PhosphorIcon(PhosphorIconsRegular.cards, size: 16),
              label: const Text('Bilgi Kartlarına Git'),
            ),
            OutlinedButton.icon(
              onPressed: onGoHome,
              icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 16),
              label: const Text('Ana Sayfaya Dön'),
            ),
          ],
        ),
      ],
    );
  }
}

class _LeitnerDueReviewBanner extends StatelessWidget {
  final int dueCount;
  final VoidCallback onStartReview;

  const _LeitnerDueReviewBanner({
    required this.dueCount,
    required this.onStartReview,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isWide = ResponsiveBreakpoints.usesSplitPane(context);

    final infoRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: PhosphorIcon(
            PhosphorIconsFill.repeat,
            size: 18,
            color: colorScheme.onTertiaryContainer,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bugün Tekrar Etmen Gereken $dueCount Soru',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                'Leitner 1·3·7·14 gün kutularından vadesi gelenler hazır.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final actionButton = FilledButton.tonalIcon(
      key: const ValueKey('mistakes_start_due_review_button'),
      onPressed: onStartReview,
      icon: const PhosphorIcon(PhosphorIconsBold.clockClockwise, size: 16),
      label: const Text('Günlük Tekrarı Başlat'),
    );

    return TactileCard(
      backgroundColor: Color.alphaBlend(
        colorScheme.tertiaryContainer.withAlpha(110),
        colorScheme.surface,
      ),
      borderColor: colorScheme.tertiary,
      lipColor: colorScheme.tertiary,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: isWide
          ? Row(
              children: [
                Expanded(child: infoRow),
                const SizedBox(width: 12),
                actionButton,
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [infoRow, const SizedBox(height: 10), actionButton],
            ),
    );
  }
}

class _MistakeHeaderCard extends StatelessWidget {
  final int mistakeCount;
  final String lessonName;
  final int totalMistakes;
  final VoidCallback onSolveAll;
  final bool isPro;

  const _MistakeHeaderCard({
    required this.mistakeCount,
    required this.onSolveAll,
    this.lessonName = 'Tümü',
    this.totalMistakes = 0,
    this.isPro = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final titleText = lessonName == 'Tümü'
        ? '$mistakeCount Yanlış Soru'
        : '$lessonName: $mistakeCount Yanlış';

    final buttonText = isPro
        ? (lessonName == 'Tümü'
              ? 'Tüm Yanlışları Tekrar Çöz'
              : '$lessonName Yanlışlarını Çöz ($mistakeCount)')
        : (lessonName == 'Tümü'
              ? 'Yanlışlarımdan Özel Test Üret (PRO)'
              : '$lessonName Yanlışlarından Test Üret (PRO)');

    final subtitleText = isPro
        ? 'Tekrar çözerek doğrula, defterden otomatik çıksın.'
        : 'Kadro PRO: Yanlışlarından tek tıkla özel tekrar testleri üret.';

    return TactileCard(
      backgroundColor: Color.alphaBlend(
        colorScheme.errorContainer.withAlpha(110),
        colorScheme.surface,
      ),
      borderColor: colorScheme.error,
      lipColor: colorScheme.error,
      child: Column(
        children: [
          Row(
            children: [
              TugrulAvatar(
                mood: TugrulMood.detective,
                size: 56,
                ringColor: colorScheme.error,
                onTap: () =>
                    TugrulTipsSheet.show(context, mood: TugrulMood.detective),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitleText,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: mistakeCount > 0 ? onSolveAll : null,
              icon: PhosphorIcon(
                isPro ? PhosphorIconsBold.play : PhosphorIconsFill.crown,
                size: 16,
              ),
              label: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}

class _MistakeQuestionCard extends StatelessWidget {
  final MistakeReviewEntry entry;
  final VoidCallback onDelete;
  final EdgeInsetsGeometry margin;

  const _MistakeQuestionCard({
    required this.entry,
    required this.onDelete,
    this.margin = const EdgeInsets.only(bottom: 12),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final question = entry.question;
    final isDueNow = entry.isDue();

    return Padding(
      padding: margin,
      child: TactileCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      KadroBadge(
                        label: '${question.lesson} · ${question.topic}',
                        tone: KadroBadgeTone.secondary,
                      ),
                      KadroBadge(
                        label:
                            '${LeitnerScheduler.boxBadgeLabel(entry.reviewBox)} · ${LeitnerScheduler.formatRemainingReviewLabel(entry.nextReviewAt)}',
                        backgroundColor: isDueNow
                            ? colorScheme.tertiaryContainer
                            : colorScheme.primaryContainer.withAlpha(110),
                        foregroundColor: isDueNow
                            ? colorScheme.onTertiaryContainer
                            : colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const PhosphorIcon(
                    PhosphorIconsRegular.trash,
                    size: 18,
                  ),
                  color: colorScheme.error,
                  tooltip: 'Defterden Sil',
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8),

            MathText(
              question.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            if (question.figureSvg != null) ...[
              const SizedBox(height: 10),
              QuestionFigure(svg: question.figureSvg!, maxScale: 1),
            ],
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: PhosphorIcon(
                          PhosphorIconsFill.checkCircle,
                          color: colorScheme.secondary,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: MathText(
                          'Doğru Cevap: ${question.options[question.correctIndex]}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (question.explanation.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    MathText(
                      question.explanation,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (question.distractorTrap != null &&
                      question.distractorTrap!.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(6),
                        border: Border(
                          left: BorderSide(
                            color: colorScheme.tertiary,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              PhosphorIcon(
                                PhosphorIconsBold.warningCircle,
                                color: colorScheme.onTertiaryContainer,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'ÖSYM Çeldirici Tuzağı:',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onTertiaryContainer,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          MathText(
                            question.distractorTrap!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
