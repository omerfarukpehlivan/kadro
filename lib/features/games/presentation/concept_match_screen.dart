import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:kadro/shared/widgets/workshop_scope_bridge_banner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Quizlet Match tarzı "Kavram Eşleştirme Tahtası" ekranı.
///
/// Web/Angular benzetmesi: Drag & Drop / Match Board Interactive Widget.
class ConceptMatchScreen extends ConsumerStatefulWidget {
  final List<ConceptMatchSet> sets;
  final int initialSetIndex;
  final VoidCallback? onCompleted;

  const ConceptMatchScreen({
    super.key,
    this.sets = sampleConceptMatchSets,
    this.initialSetIndex = 0,
    this.onCompleted,
  });

  @override
  ConsumerState<ConceptMatchScreen> createState() => _ConceptMatchScreenState();
}

class _ConceptMatchScreenState extends ConsumerState<ConceptMatchScreen> {
  late int _selectedSetIndex;
  String? _selectedLeftId;
  String? _selectedRightId;
  final Set<String> _matchedIds = {};
  int _moves = 0;

  late List<ConceptPair> _shuffledRightPairs;
  String? _shuffledForSetId;

  WorkshopScopeResolution<ConceptMatchSet> _resolveSets({bool watch = true}) {
    final selection = readOrWatchExamSelection(ref, watch: watch);
    return WorkshopScopeResolution.resolve<ConceptMatchSet>(
      selection: selection,
      allItems: widget.sets,
      matchesSelection: (setItem, sel) => setItem.matchesSelection(sel),
      matchesGkBridge: (setItem) =>
          setItem.matchesSelection(const ExamSelection.bGrubuLisans()),
    );
  }

  List<ConceptMatchSet> get _sets => _resolveSets(watch: false).items;

  ConceptMatchSet get _currentSet {
    final sets = _sets;
    final safeIndex = _selectedSetIndex < sets.length ? _selectedSetIndex : 0;
    return sets[safeIndex];
  }

  @override
  void initState() {
    super.initState();
    final sets = _sets;
    _selectedSetIndex = sets.isEmpty ? 0 : widget.initialSetIndex % sets.length;
    if (sets.isNotEmpty) {
      _resetBoard();
    } else {
      _shuffledRightPairs = const [];
    }
  }

  void _resetBoard([ConceptMatchSet? targetSet]) {
    final set = targetSet ?? _currentSet;
    _selectedLeftId = null;
    _selectedRightId = null;
    _matchedIds.clear();
    _moves = 0;
    _shuffledForSetId = set.id;
    // Sağ sütunu karıştırarak hafıza oyununu zevkli hale getiriyoruz
    _shuffledRightPairs = List<ConceptPair>.from(set.pairs)..shuffle();
  }

  void _changeSet(int index) {
    if (_selectedSetIndex == index) return;
    setState(() {
      _selectedSetIndex = index;
      _resetBoard();
    });
  }

  void _checkMatch() {
    if (_selectedLeftId != null && _selectedRightId != null) {
      _moves++;
      if (_selectedLeftId == _selectedRightId) {
        final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;
        _matchedIds.add(_selectedLeftId!);
        ref
            .read(studyStatsProvider.notifier)
            .recordAnswer(
              lesson: _currentSet.lesson,
              isCorrect: true,
              examScope: scopeKey,
            );

        if (_matchedIds.length == _currentSet.pairs.length) {
          try {
            widget.onCompleted?.call();
          } catch (_) {}
          ref
              .read(studyStatsProvider.notifier)
              .recordQuizSession(
                QuizSessionRecord(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  title: 'Kavram Eşleştir · ${_currentSet.title}',
                  lesson: _currentSet.lesson,
                  examScope: scopeKey,
                  totalQuestions: _currentSet.pairs.length,
                  correctCount: _currentSet.pairs.length,
                  wrongCount: 0,
                  emptyCount: 0,
                  netScore: _currentSet.pairs.length.toDouble(),
                  earnedXp: 40,
                  durationSeconds: _moves * 4,
                  completedAt: DateTime.now(),
                ),
              );
        }

        _selectedLeftId = null;
        _selectedRightId = null;
      } else {
        _selectedLeftId = null;
        _selectedRightId = null;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Eşleşme yanlış, tekrar dene!'),
            duration: Duration(milliseconds: 600),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final selection = readOrWatchExamSelection(ref);
    final resolution = _resolveSets();
    final sets = resolution.items;

    if (sets.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Kavram Eşleştir'),
          centerTitle: false,
        ),
        body: const EmptyStateView(
          mascotMood: TugrulMood.practice,
          icon: PhosphorIconsRegular.info,
          title: 'Bu kapsamda kavram eşleştirme seti bulunmuyor',
          description: 'Diğer çalışma modlarından devam edebilirsin.',
        ),
      );
    }

    final safeSetIndex = _selectedSetIndex < sets.length
        ? _selectedSetIndex
        : 0;
    final activeSet = sets[safeSetIndex];
    if (_shuffledForSetId != activeSet.id) {
      _resetBoard(activeSet);
    }
    final isFinished = _matchedIds.length == activeSet.pairs.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Kavram Eşleştir'), centerTitle: false),
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 920,
          padding: EdgeInsets.zero,
          child: Scrollbar(
            child: ListView(
              padding: AppSpacing.pagePadding(context),
              children: [
                if (resolution.isUsingGkFallback)
                  WorkshopScopeBridgeBanner(
                    examTitle: selection.displayTitle,
                    margin: const EdgeInsets.only(bottom: 12),
                  ),
                // 1. Set Seçim Şeridi
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(sets.length, (index) {
                      final set = sets[index];
                      final isSelected = safeSetIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(set.title),
                          selected: isSelected,
                          onSelected: (_) => _changeSet(index),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 16),

                // 2. İlerleme & Hamle Sayacı
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withAlpha(90),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          PhosphorIcon(
                            PhosphorIconsDuotone.puzzlePiece,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${_matchedIds.length} / ${activeSet.pairs.length} Eşleşti',
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Hamle: $_moves',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Oyun Tahtası veya Tamamlandı Özeti
                if (isFinished) ...[
                  TactileCard(
                    backgroundColor: Color.alphaBlend(
                      colorScheme.secondaryContainer.withAlpha(110),
                      colorScheme.surface,
                    ),
                    borderColor: colorScheme.secondary,
                    lipColor: colorScheme.secondary,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TugrulAvatar(
                          mood: TugrulMood.victory,
                          size: 84,
                          ringColor: colorScheme.secondary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Tüm Kavramlar Eşleşti',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$_moves hamlede tüm çiftleri doğru eşleştirdin.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () => setState(_resetBoard),
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.arrowsCounterClockwise,
                    ),
                    label: const Text('Seti Sıfırla'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ] else ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sol Sütun (Kavramlar)
                      Expanded(
                        child: Column(
                          children: _currentSet.pairs.map((pair) {
                            final isMatched = _matchedIds.contains(pair.id);
                            final isSelected = _selectedLeftId == pair.id;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TactileCard(
                                onTap: isMatched
                                    ? null
                                    : () {
                                        setState(
                                          () => _selectedLeftId = pair.id,
                                        );
                                        _checkMatch();
                                      },
                                backgroundColor: isMatched
                                    ? colorScheme.tertiaryContainer.withAlpha(
                                        70,
                                      )
                                    : (isSelected
                                          ? colorScheme.primaryContainer
                                          : colorScheme.surface),
                                borderColor: isMatched
                                    ? colorScheme.tertiary
                                    : (isSelected
                                          ? colorScheme.primary
                                          : colorScheme.outlineVariant),
                                padding: const EdgeInsets.all(12),
                                child: SizedBox(
                                  height: 64,
                                  child: Center(
                                    child: Text(
                                      pair.leftTerm,
                                      textAlign: TextAlign.center,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: isSelected
                                            ? FontWeight.w700
                                            : FontWeight.w600,
                                        decoration: isMatched
                                            ? TextDecoration.lineThrough
                                            : null,
                                        color: isMatched
                                            ? colorScheme.onSurfaceVariant
                                            : colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Sağ Sütun (Karşılıklar)
                      Expanded(
                        child: Column(
                          children: _shuffledRightPairs.map((pair) {
                            final isMatched = _matchedIds.contains(pair.id);
                            final isSelected = _selectedRightId == pair.id;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TactileCard(
                                onTap: isMatched
                                    ? null
                                    : () {
                                        setState(
                                          () => _selectedRightId = pair.id,
                                        );
                                        _checkMatch();
                                      },
                                backgroundColor: isMatched
                                    ? colorScheme.tertiaryContainer.withAlpha(
                                        70,
                                      )
                                    : (isSelected
                                          ? colorScheme.primaryContainer
                                          : colorScheme.surface),
                                borderColor: isMatched
                                    ? colorScheme.tertiary
                                    : (isSelected
                                          ? colorScheme.primary
                                          : colorScheme.outlineVariant),
                                padding: const EdgeInsets.all(12),
                                child: SizedBox(
                                  height: 64,
                                  child: Center(
                                    child: Text(
                                      pair.rightMatch,
                                      textAlign: TextAlign.center,
                                      style: textTheme.bodySmall?.copyWith(
                                        fontWeight: isSelected
                                            ? FontWeight.w700
                                            : FontWeight.w600,
                                        decoration: isMatched
                                            ? TextDecoration.lineThrough
                                            : null,
                                        color: isMatched
                                            ? colorScheme.onSurfaceVariant
                                            : colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
