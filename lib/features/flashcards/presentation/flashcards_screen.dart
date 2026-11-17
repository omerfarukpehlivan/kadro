import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
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

  const FlashcardsScreen({
    super.key,
    this.flashcards = sampleFlashcards,
    this.initialLesson,
    this.startIndex = 0,
    this.sessionLimit,
    this.onCompleted,
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
    final initialFilters = _resolveLessonFilters(watch: false);
    _selectedLesson =
        (widget.initialLesson != null &&
            initialFilters.contains(widget.initialLesson))
        ? widget.initialLesson!
        : 'Tümü';
  }

  List<Flashcard> _filteredCardsFor(List<Flashcard> scopedCards) {
    final pool = _selectedLesson == 'Tümü'
        ? scopedCards
        : scopedCards.where((card) => card.lesson == _selectedLesson).toList();

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

  List<Flashcard> get _filteredCards =>
      _filteredCardsFor(_resolveScopedCards(watch: false).items);

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
    setState(() {
      _repeatCount++;
      _currentIndex++;
      _isBackVisible = false;
    });
    _notifyCompletionIfFinished();
  }

  void _onLearned() {
    if (_filteredCards.isEmpty || _currentIndex >= _filteredCards.length) {
      return;
    }
    final card = _currentCard;

    try {
      final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;
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
    setState(() {
      _currentIndex = 0;
      _isBackVisible = false;
      _learnedCount = 0;
      _repeatCount = 0;
      _hasNotifiedCompletion = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selection = readOrWatchExamSelection(ref);
    final scopeResolution = _resolveScopedCards();
    final lessonFilters = _resolveLessonFilters(
      scopedCards: scopeResolution.items,
    );
    final filtered = _filteredCardsFor(scopeResolution.items);

    final activeShortcuts = filtered.isEmpty || _isCompleted
        ? const <ShortcutActivator, VoidCallback>{}
        : <ShortcutActivator, VoidCallback>{
            const SingleActivator(LogicalKeyboardKey.space): _flipCard,
            const SingleActivator(LogicalKeyboardKey.enter): _flipCard,
            const SingleActivator(LogicalKeyboardKey.arrowLeft): _onRepeat,
            const SingleActivator(LogicalKeyboardKey.keyR): _onRepeat,
            const SingleActivator(LogicalKeyboardKey.arrowRight): _onLearned,
            const SingleActivator(LogicalKeyboardKey.keyB): _onLearned,
          };

    return Scaffold(
      appBar: AppBar(title: const Text('Hap Bilgi Kartları')),
      body: SafeArea(
        child: CallbackShortcuts(
          bindings: activeShortcuts,
          child: Focus(
            autofocus: true,
            child: Builder(
              builder: (layoutCtx) {
                final isSplitPane = ResponsiveBreakpoints.usesSplitPane(
                  layoutCtx,
                );
                final hPad = ResponsiveBreakpoints.horizontalPadding(layoutCtx);
                final animDuration = MediaQuery.disableAnimationsOf(layoutCtx)
                    ? Duration.zero
                    : const Duration(milliseconds: 200);

                final Widget activeContent;
                if (filtered.isEmpty) {
                  activeContent = EmptyStateView(
                    mascotMood: TugrulMood.practice,
                    icon: PhosphorIconsRegular.info,
                    title: '$_selectedLesson için henüz kart bulunmuyor',
                    description: 'Farklı bir ders seçerek kart çalışmasına devam edebilirsin.',
                  );
                } else if (_isCompleted) {
                  activeContent = _FlashcardsSummaryView(
                    totalCards: filtered.length,
                    learnedCount: _learnedCount,
                    repeatCount: _repeatCount,
                    selectedLesson: _selectedLesson,
                    onRestart: _restart,
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
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            key: const ValueKey('flashcard_flip_detector'),
                            onTap: _flipCard,
                            child: AnimatedSwitcher(
                              duration: animDuration,
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                              child: _FlashcardFace(
                                key: ValueKey(_isBackVisible),
                                isBack: _isBackVisible,
                                topic: _currentCard.topic,
                                text: _isBackVisible
                                    ? _currentCard.backText
                                    : _currentCard.frontText,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Tooltip(
                              message: 'Kısayol: Sol Ok veya R',
                              child: OutlinedButton.icon(
                                onPressed: _onRepeat,
                                icon: const PhosphorIcon(
                                  PhosphorIconsRegular.arrowsClockwise,
                                  size: 16,
                                ),
                                label: const Text('Tekrar Et'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Tooltip(
                              message: 'Kısayol: Boşluk veya Enter',
                              child: OutlinedButton.icon(
                                onPressed: _flipCard,
                                icon: const PhosphorIcon(
                                  PhosphorIconsRegular.arrowsLeftRight,
                                  size: 16,
                                ),
                                label: const Text('Çevir (Boşluk)'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Tooltip(
                              message: 'Kısayol: Sağ Ok veya B',
                              child: FilledButton.icon(
                                onPressed: _onLearned,
                                icon: const PhosphorIcon(
                                  PhosphorIconsBold.check,
                                  size: 16,
                                ),
                                label: const Text('Biliyorum'),
                              ),
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

                return ResponsiveContentWrapper(
                  maxWidth: isSplitPane ? 1200 : 720,
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: hPad),
                          itemCount: lessonFilters.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) {
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
        ),
      ),
    );
  }
}

/// Masaüstü Split-Pane sağ paneli: Bilgi kartı oturum ilerlemesini ve klavye
/// kısayol rehberini gösterir (`TASK-150`).
class _FlashcardsDesktopTelemetryPanel extends StatelessWidget {
  final int totalCards;
  final int currentIndex;
  final int learnedCount;
  final int repeatCount;
  final String selectedLesson;

  const _FlashcardsDesktopTelemetryPanel({
    required this.totalCards,
    required this.currentIndex,
    required this.learnedCount,
    required this.repeatCount,
    required this.selectedLesson,
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
        AppSpacing.gapMd,
        TactileCard(
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.outlineVariant,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Klavye Kısayolları',
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Boşluk / Enter: Kartı çevir\nSol Ok / R: Tekrar et listesine al\nSağ Ok / B: Biliyorum olarak işaretle',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.55,
                ),
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

  const _FlashcardFace({
    super.key,
    required this.isBack,
    required this.topic,
    required this.text,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  const _FlashcardsSummaryView({
    required this.totalCards,
    required this.learnedCount,
    required this.repeatCount,
    this.selectedLesson = 'Tümü',
    required this.onRestart,
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
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).push(
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
                onPressed: () => Navigator.of(context).pop(),
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
