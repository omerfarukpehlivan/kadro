import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/data/flashcard_review_repository.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_task_launcher.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:kadro/shared/widgets/workshop_scope_bridge_banner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// KPSS Hap Bilgi Kartları (Flashcards) Ekranı.
class FlashcardsScreen extends ConsumerStatefulWidget {
  final List<Flashcard> flashcards;
  final String? initialLesson;
  final int startIndex;
  final int? sessionLimit;
  final VoidCallback? onCompleted;
  final String? taskId;
  final FlashcardReviewRepository reviewRepository;
  final bool startInDueMode;

  const FlashcardsScreen({
    super.key,
    this.flashcards = sampleFlashcards,
    this.initialLesson,
    this.startIndex = 0,
    this.sessionLimit,
    this.onCompleted,
    this.taskId,
    this.reviewRepository = const FlashcardReviewRepository(),
    this.startInDueMode = false,
  });

  @override
  ConsumerState<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen> {
  late String _selectedLesson;
  int _currentIndex = 0;
  bool _isBackVisible = false;
  int _learnedCount = 0;
  int _repeatCount = 0;
  bool _hasNotifiedCompletion = false;
  late bool _showDueOnly;
  List<String>? _dueSessionIds;
  String? _loadedScopeKey;

  Future<void> _ensureScopeReviewsLoaded(String scopeKey) async {
    if (_loadedScopeKey == scopeKey) return;
    _loadedScopeKey = scopeKey;
    await widget.reviewRepository.loadFromStorage(scopeKey);
    if (!mounted) return;
    if (_showDueOnly) {
      final scoped = _resolveScopedCards(watch: false).items;
      _dueSessionIds = widget.reviewRepository
          .dueCardsFrom(scoped, examScope: scopeKey)
          .map((c) => c.id)
          .toList();
    }
    setState(() {});
  }

  WorkshopScopeResolution<Flashcard> _resolveScopedCards({bool watch = true}) {
    final selection = readOrWatchExamSelection(ref, watch: watch);
    return WorkshopScopeResolution.resolve<Flashcard>(
      selection: selection,
      allItems: widget.flashcards,
      matchesSelection: (card, sel) => card.matchesSelection(sel),
      matchesGkBridge: (card) =>
          card.matchesSelection(const ExamSelection.bGrubuLisans()),
    );
  }

  List<String> _resolveLessonFilters({
    bool watch = true,
    List<Flashcard>? scopedCards,
  }) {
    final curriculum = readOrWatchCurriculum(ref, watch: watch);
    final sourceCards = scopedCards ?? _resolveScopedCards(watch: watch).items;
    return curriculum.buildFilterLessons(
      sourceCards.map((card) => card.lesson),
    );
  }

  @override
  void initState() {
    super.initState();
    _showDueOnly = widget.startInDueMode;
    final initialFilters = _resolveLessonFilters(watch: false);
    _selectedLesson =
        (widget.initialLesson != null &&
            initialFilters.contains(widget.initialLesson))
        ? widget.initialLesson!
        : 'Tümü';
    final initialScope = readOrWatchExamSelection(ref, watch: false).scopeKey;
    if (_showDueOnly) {
      final scoped = _resolveScopedCards(watch: false).items;
      _dueSessionIds = widget.reviewRepository
          .dueCardsFrom(scoped, examScope: initialScope)
          .map((c) => c.id)
          .toList();
    }
    unawaited(_ensureScopeReviewsLoaded(initialScope));
  }

  List<Flashcard> _filteredCardsFor(
    List<Flashcard> scopedCards, {
    String? examScope,
  }) {
    final lessonPool = _selectedLesson == 'Tümü'
        ? scopedCards
        : scopedCards.where((card) => card.lesson == _selectedLesson).toList();

    final List<Flashcard> pool;
    if (_showDueOnly) {
      final effectiveScope =
          examScope ?? readOrWatchExamSelection(ref, watch: false).scopeKey;
      final dueSnapshotIds = _dueSessionIds;
      if (dueSnapshotIds != null) {
        final byId = {for (final c in lessonPool) c.id: c};
        pool = [
          for (final id in dueSnapshotIds)
            if (byId.containsKey(id)) byId[id]!,
        ];
      } else {
        pool = widget.reviewRepository.dueCardsFrom(
          lessonPool,
          examScope: effectiveScope,
        );
      }
    } else {
      pool = lessonPool;
    }

    final limit = widget.sessionLimit;
    final matchesInitialLesson =
        widget.initialLesson == null || _selectedLesson == widget.initialLesson;
    if (limit == null || !matchesInitialLesson || pool.isEmpty) {
      return pool;
    }

    final safeLimit = limit.clamp(1, pool.length);
    final safeStart = widget.startIndex % pool.length;
    final sliced = <Flashcard>[];
    for (var i = 0; i < safeLimit; i++) {
      sliced.add(pool[(safeStart + i) % pool.length]);
    }
    return sliced;
  }

  List<Flashcard> get _filteredCards {
    final scope = readOrWatchExamSelection(ref, watch: false).scopeKey;
    return _filteredCardsFor(
      _resolveScopedCards(watch: false).items,
      examScope: scope,
    );
  }

  bool get _isCompleted =>
      _filteredCards.isNotEmpty && _currentIndex >= _filteredCards.length;

  Flashcard get _currentCard => _filteredCards[_currentIndex];

  void _selectLesson(String lesson) {
    if (_selectedLesson == lesson) return;
    setState(() {
      _selectedLesson = lesson;
      _currentIndex = 0;
      _isBackVisible = false;
      _learnedCount = 0;
      _repeatCount = 0;
      _hasNotifiedCompletion = false;
    });
  }

  void _toggleDueOnly(
    bool showDue,
    List<Flashcard> scopedCards,
    String scopeKey,
  ) {
    setState(() {
      _showDueOnly = showDue;
      _dueSessionIds = showDue
          ? widget.reviewRepository
                .dueCardsFrom(scopedCards, examScope: scopeKey)
                .map((c) => c.id)
                .toList()
          : null;
      _currentIndex = 0;
      _isBackVisible = false;
      _learnedCount = 0;
      _repeatCount = 0;
      _hasNotifiedCompletion = false;
    });
  }

  void _flipCard() {
    setState(() {
      _isBackVisible = !_isBackVisible;
    });
  }

  void _notifyCompletionIfFinished() {
    if (_isCompleted && !_hasNotifiedCompletion) {
      _hasNotifiedCompletion = true;
      try {
        widget.onCompleted?.call();
      } catch (_) {}
    }
  }

  void _onRepeat() {
    final activeDeck = _filteredCards;
    if (activeDeck.isEmpty || _currentIndex >= activeDeck.length) return;
    final card = activeDeck[_currentIndex];
    final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;
    widget.reviewRepository.recordOutcome(
      card,
      isLearned: false,
      examScope: scopeKey,
    );

    setState(() {
      _repeatCount++;
      _currentIndex++;
      _isBackVisible = false;
    });
    _notifyCompletionIfFinished();
  }

  void _onLearned() {
    final activeDeck = _filteredCards;
    if (activeDeck.isEmpty || _currentIndex >= activeDeck.length) {
      return;
    }
    final card = activeDeck[_currentIndex];
    final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;
    widget.reviewRepository.recordOutcome(
      card,
      isLearned: true,
      examScope: scopeKey,
    );

    try {
      ref
          .read(studyStatsProvider.notifier)
          .recordAnswer(
            lesson: card.lesson,
            isCorrect: true,
            topic: card.topic,
            questionText: card.frontText,
            examScope: scopeKey,
          );
    } catch (_) {
      // ProviderScope olmadan çalışan testlerde güvenli fallback
    }

    setState(() {
      _learnedCount++;
      _currentIndex++;
      _isBackVisible = false;
    });
    _notifyCompletionIfFinished();
  }

  void _restart() {
    final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;
    final scoped = _resolveScopedCards(watch: false).items;
    setState(() {
      if (_showDueOnly) {
        _dueSessionIds = widget.reviewRepository
            .dueCardsFrom(scoped, examScope: scopeKey)
            .map((c) => c.id)
            .toList();
      }
      _currentIndex = 0;
      _isBackVisible = false;
      _learnedCount = 0;
      _repeatCount = 0;
      _hasNotifiedCompletion = false;
    });
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
    final selection = readOrWatchExamSelection(ref);
    final nextTask = _resolveNextDailyTask();
    final isDailyFlow = widget.taskId != null || widget.onCompleted != null;
    if (_loadedScopeKey != selection.scopeKey) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) unawaited(_ensureScopeReviewsLoaded(selection.scopeKey));
      });
    }
    final scopeResolution = _resolveScopedCards();
    final lessonFilters = _resolveLessonFilters(
      scopedCards: scopeResolution.items,
    );
    final dueCards = widget.reviewRepository.dueCardsFrom(
      scopeResolution.items,
      examScope: selection.scopeKey,
    );
    final filtered = _filteredCardsFor(
      scopeResolution.items,
      examScope: selection.scopeKey,
    );
    final currentBox = (filtered.isEmpty || _isCompleted)
        ? 1
        : widget.reviewRepository.boxFor(
            _currentCard.id,
            examScope: selection.scopeKey,
          );

    return Scaffold(
      appBar: AppBar(title: const Text('Hap Bilgi Kartları')),
      body: SafeArea(
        child: Builder(
          builder: (layoutCtx) {
            final isSplitPane = ResponsiveBreakpoints.usesSplitPane(layoutCtx);
            final hPad = ResponsiveBreakpoints.horizontalPadding(layoutCtx);
            final animDuration = MediaQuery.disableAnimationsOf(layoutCtx)
                ? Duration.zero
                : const Duration(milliseconds: 200);

            final Widget activeContent;
            if (filtered.isEmpty) {
              activeContent = EmptyStateView(
                mascotMood: TugrulMood.practice,
                icon: PhosphorIconsRegular.info,
                title: _showDueOnly
                    ? 'Bugün tekrar edilmesi gereken kart kalmadı'
                    : '$_selectedLesson için henüz kart bulunmuyor',
                description: _showDueOnly
                    ? 'Tüm vadesi gelen kartları tamamladın. Dilersen tüm kart destesine dönebilirsin.'
                    : 'Farklı bir ders seçerek kart çalışmasına devam edebilirsin.',
                actionLabel: _showDueOnly ? 'Tüm Kartları Göster' : null,
                onAction: _showDueOnly
                    ? () => _toggleDueOnly(
                        false,
                        scopeResolution.items,
                        selection.scopeKey,
                      )
                    : null,
              );
            } else if (_isCompleted) {
              activeContent = _FlashcardsSummaryView(
                totalCards: filtered.length,
                learnedCount: _learnedCount,
                repeatCount: _repeatCount,
                selectedLesson: _selectedLesson,
                onRestart: _restart,
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
              );
            } else if (isSplitPane) {
              final deckColumn = Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _currentCard.lesson,
                        style: Theme.of(layoutCtx).textTheme.titleSmall,
                      ),
                      Text(
                        'Kart ${_currentIndex + 1} / ${filtered.length}',
                        style: Theme.of(layoutCtx).textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  AppSpacing.gapXs,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      value: (_currentIndex + 1) / filtered.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GestureDetector(
                      key: const ValueKey('flashcard_flip_detector'),
                      onTap: _flipCard,
                      child: AnimatedSwitcher(
                        duration: animDuration,
                        transitionBuilder: (child, animation) =>
                            FadeTransition(opacity: animation, child: child),
                        child: _FlashcardFace(
                          key: ValueKey(_isBackVisible),
                          isBack: _isBackVisible,
                          topic: _currentCard.topic,
                          reviewBox: currentBox,
                          text: _isBackVisible
                              ? _currentCard.backText
                              : _currentCard.frontText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _onRepeat,
                          icon: const PhosphorIcon(
                            PhosphorIconsRegular.arrowsClockwise,
                            size: 16,
                          ),
                          label: const Text('Tekrar Et'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _flipCard,
                          icon: const PhosphorIcon(
                            PhosphorIconsRegular.arrowsLeftRight,
                            size: 16,
                          ),
                          label: const Text('Kartı Çevir'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _onLearned,
                          icon: const PhosphorIcon(
                            PhosphorIconsBold.check,
                            size: 16,
                          ),
                          label: const Text('Biliyorum'),
                        ),
                      ),
                    ],
                  ),
                ],
              );

              activeContent = Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 7, child: deckColumn),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: _FlashcardsDesktopTelemetryPanel(
                        totalCards: filtered.length,
                        currentIndex: _currentIndex,
                        learnedCount: _learnedCount,
                        repeatCount: _repeatCount,
                        selectedLesson: _selectedLesson,
                        dueCount: dueCards.length,
                        currentBox: currentBox,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              activeContent = Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _currentCard.lesson,
                        style: Theme.of(layoutCtx).textTheme.titleSmall,
                      ),
                      Text(
                        'Kart ${_currentIndex + 1} / ${filtered.length}',
                        style: Theme.of(layoutCtx).textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  AppSpacing.gapXs,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      value: (_currentIndex + 1) / filtered.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GestureDetector(
                      key: const ValueKey('flashcard_flip_detector'),
                      onTap: _flipCard,
                      child: AnimatedSwitcher(
                        duration: animDuration,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: _FlashcardFace(
                          key: ValueKey(_isBackVisible),
                          isBack: _isBackVisible,
                          topic: _currentCard.topic,
                          reviewBox: currentBox,
                          text: _isBackVisible
                              ? _currentCard.backText
                              : _currentCard.frontText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _onRepeat,
                          icon: const PhosphorIcon(
                            PhosphorIconsRegular.arrowsClockwise,
                            size: 16,
                          ),
                          label: const Text('Tekrar Et'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _onLearned,
                          icon: const PhosphorIcon(
                            PhosphorIconsBold.check,
                            size: 16,
                          ),
                          label: const Text('Biliyorum'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }

            final dueFilterChip = FilterChip(
              key: const ValueKey('flashcards_due_only_chip'),
              avatar: const PhosphorIcon(
                PhosphorIconsRegular.clockClockwise,
                size: 16,
              ),
              label: Text('Bugün Tekrar (${dueCards.length})'),
              selected: _showDueOnly,
              onSelected: (selected) => _toggleDueOnly(
                selected,
                scopeResolution.items,
                selection.scopeKey,
              ),
            );

            return ResponsiveContentWrapper(
              maxWidth: isSplitPane ? 1200 : 720,
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isSplitPane)
                    Padding(
                      padding: EdgeInsets.fromLTRB(hPad, 4, hPad, 6),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final lesson in lessonFilters)
                            ChoiceChip(
                              label: Text(lesson),
                              selected: _selectedLesson == lesson,
                              onSelected: (selected) {
                                if (selected) _selectLesson(lesson);
                              },
                            ),
                          dueFilterChip,
                        ],
                      ),
                    )
                  else
                    SizedBox(
                      height: 48,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: hPad),
                        itemCount: lessonFilters.length + 1,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          if (index == lessonFilters.length) {
                            return dueFilterChip;
                          }
                          final lesson = lessonFilters[index];
                          final isSelected = _selectedLesson == lesson;
                          return ChoiceChip(
                            label: Text(lesson),
                            selected: isSelected,
                            onSelected: (selected) {
                              if (selected) {
                                _selectLesson(lesson);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  if (scopeResolution.isUsingGkFallback)
                    WorkshopScopeBridgeBanner(
                      examTitle: selection.displayTitle,
                    ),
                  AppSpacing.gapXs,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 16),
                      child: activeContent,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Yatay tablet Split-Pane sağ paneli: Bilgi kartı oturum ilerlemesini gösterir.
class _FlashcardsDesktopTelemetryPanel extends StatelessWidget {
  final int totalCards;
  final int currentIndex;
  final int learnedCount;
  final int repeatCount;
  final String selectedLesson;
  final int dueCount;
  final int currentBox;

  const _FlashcardsDesktopTelemetryPanel({
    required this.totalCards,
    required this.currentIndex,
    required this.learnedCount,
    required this.repeatCount,
    required this.selectedLesson,
    required this.dueCount,
    required this.currentBox,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final reviewed = learnedCount + repeatCount;
    final remaining = (totalCards - currentIndex).clamp(0, totalCards);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TactileCard(
          backgroundColor: colorScheme.surfaceContainerLow,
          borderColor: colorScheme.outlineVariant,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TugrulAvatar(
                    mood: TugrulMood.practice,
                    size: 48,
                    hasShadow: false,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oturum Özeti · $selectedLesson',
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '$reviewed kart incelendi · $remaining kart kaldı',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Aktif Kart: ${LeitnerScheduler.boxBadgeLabel(currentBox)} · Bugün Vadesi Gelen: $dueCount',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _TelemetryCounterTile(
                      label: 'Biliyorum',
                      value: '$learnedCount',
                      color: colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TelemetryCounterTile(
                      label: 'Tekrar Et',
                      value: '$repeatCount',
                      color: colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TelemetryCounterTile(
                      label: 'Kalan',
                      value: '$remaining',
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TelemetryCounterTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _TelemetryCounterTile({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _FlashcardFace extends StatelessWidget {
  final bool isBack;
  final String topic;
  final String text;
  final int reviewBox;

  const _FlashcardFace({
    super.key,
    required this.isBack,
    required this.topic,
    required this.text,
    this.reviewBox = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      padding: const EdgeInsets.all(24),
      backgroundColor: isBack
          ? Color.alphaBlend(
              colorScheme.primaryContainer.withAlpha(110),
              colorScheme.surface,
            )
          : colorScheme.surface,
      borderColor: isBack ? colorScheme.primary : colorScheme.outlineVariant,
      lipColor: isBack ? colorScheme.primary : colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isBack
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isBack ? 'HAP BİLGİ' : 'SORU / KAVRAM',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isBack
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer.withAlpha(160),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      LeitnerScheduler.boxBadgeLabel(reviewBox),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                topic,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Spacer(),

          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                height: 1.5,
              ),
            ),
          ),
          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.arrowsClockwise,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                isBack
                    ? 'Ön yüze dönmek için dokun'
                    : 'Cevabı görmek için dokun',
                style: theme.textTheme.bodySmall?.copyWith(
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

class _FlashcardsSummaryView extends StatelessWidget {
  final int totalCards;
  final int learnedCount;
  final int repeatCount;
  final String selectedLesson;
  final VoidCallback onRestart;
  final VoidCallback onGoHome;
  final StudyTask? nextTask;
  final VoidCallback? onNextTask;

  const _FlashcardsSummaryView({
    required this.totalCards,
    required this.learnedCount,
    required this.repeatCount,
    this.selectedLesson = 'Tümü',
    required this.onRestart,
    required this.onGoHome,
    this.nextTask,
    this.onNextTask,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TactileCard(
          backgroundColor: Color.alphaBlend(
            colorScheme.secondaryContainer.withAlpha(110),
            colorScheme.surface,
          ),
          borderColor: colorScheme.secondary,
          lipColor: colorScheme.secondary,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              TugrulAvatar(
                mood: TugrulMood.victory,
                size: 64,
                ringColor: colorScheme.secondary,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tebrikler!',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Tüm bilgi kartlarını tamamladın.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        TactileCard(
          backgroundColor: colorScheme.primaryContainer,
          borderColor: colorScheme.primary,
          lipColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kart Çalışması Özeti',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '$totalCards Kart',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TactileCard(
                backgroundColor: colorScheme.surface,
                borderColor: colorScheme.secondary.withAlpha(140),
                lipColor: colorScheme.secondary,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsFill.checkCircle,
                      color: colorScheme.secondary,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$learnedCount',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Öğrenildi', style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TactileCard(
                backgroundColor: colorScheme.surface,
                borderColor: colorScheme.error.withAlpha(140),
                lipColor: colorScheme.error,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsRegular.arrowsClockwise,
                      color: colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$repeatCount',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Tekrar Edilecek', style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        if (nextTask != null && onNextTask != null) ...[
          FilledButton.icon(
            onPressed: onNextTask,
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.secondary,
              foregroundColor: colorScheme.onSecondary,
            ),
            icon: const PhosphorIcon(PhosphorIconsBold.arrowRight, size: 18),
            label: Text(
              'Sıradaki Göreve Geç: ${nextTask!.title} →',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
        ],
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(
                builder: (_) => QuizScreen(
                  lessonFilter: selectedLesson == 'Tümü'
                      ? null
                      : selectedLesson,
                  customTitle: selectedLesson == 'Tümü'
                      ? 'Pekiştirme Testi'
                      : '$selectedLesson Pekiştirme Testi',
                  limit: 10,
                ),
              ),
            );
          },
          icon: const PhosphorIcon(PhosphorIconsRegular.target, size: 18),
          label: const Text('Bu Konuyu Testle Pekiştir (10 Soru)'),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onRestart,
                icon: const PhosphorIcon(
                  PhosphorIconsRegular.arrowsCounterClockwise,
                  size: 16,
                ),
                label: const Text('Yeniden Başla'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onGoHome,
                icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 16),
                label: const Text('Ana Sayfaya Dön'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
