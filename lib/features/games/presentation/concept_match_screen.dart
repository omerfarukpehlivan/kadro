import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Quizlet Match tarzı "Kavram Eşleştirme Tahtası" ekranı.
///
/// Web/Angular benzetmesi: Drag & Drop / Match Board Interactive Widget.
class ConceptMatchScreen extends ConsumerStatefulWidget {
  final List<ConceptMatchSet> sets;

  const ConceptMatchScreen({super.key, this.sets = sampleConceptMatchSets});

  @override
  ConsumerState<ConceptMatchScreen> createState() => _ConceptMatchScreenState();
}

class _ConceptMatchScreenState extends ConsumerState<ConceptMatchScreen> {
  int _selectedSetIndex = 0;
  String? _selectedLeftId;
  String? _selectedRightId;
  final Set<String> _matchedIds = {};
  int _moves = 0;

  late List<ConceptPair> _shuffledRightPairs;

  ConceptMatchSet get _currentSet => widget.sets[_selectedSetIndex];

  @override
  void initState() {
    super.initState();
    _resetBoard();
  }

  void _resetBoard() {
    _selectedLeftId = null;
    _selectedRightId = null;
    _matchedIds.clear();
    _moves = 0;
    // Sağ sütunu karıştırarak hafıza oyununu zevkli hale getiriyoruz
    _shuffledRightPairs = List<ConceptPair>.from(_currentSet.pairs)..shuffle();
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
        _matchedIds.add(_selectedLeftId!);
        ref
            .read(studyStatsProvider.notifier)
            .recordAnswer(lesson: _currentSet.lesson, isCorrect: true);

        if (_matchedIds.length == _currentSet.pairs.length) {
          ref
              .read(studyStatsProvider.notifier)
              .recordQuizSession(
                QuizSessionRecord(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  title: 'Kavram Eşleştir · ${_currentSet.title}',
                  lesson: _currentSet.lesson,
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
    final isFinished = _matchedIds.length == _currentSet.pairs.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Kavram Eşleştir'), centerTitle: false),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Set Seçim Şeridi
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(widget.sets.length, (index) {
                  final set = widget.sets[index];
                  final isSelected = _selectedSetIndex == index;
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withAlpha(90),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        LucideIcons.puzzle,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${_matchedIds.length} / ${_currentSet.pairs.length} Eşleşti',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w800,
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
              MascotCoachBanner(
                mood: MascotMood.victory,
                badgeLabel: 'EŞLEŞTİRME USTASI',
                title: 'Tüm Kavramlar Eşleşti!',
                message: 'Tebrikler! $_moves hamlede tabloyu temizledin.',
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () => setState(_resetBoard),
                icon: const Icon(LucideIcons.rotateCcw),
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
                                    setState(() => _selectedLeftId = pair.id);
                                    _checkMatch();
                                  },
                            backgroundColor: isMatched
                                ? colorScheme.tertiaryContainer.withAlpha(70)
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
                                        ? FontWeight.w800
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
                                    setState(() => _selectedRightId = pair.id);
                                    _checkMatch();
                                  },
                            backgroundColor: isMatched
                                ? colorScheme.tertiaryContainer.withAlpha(70)
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
                                        ? FontWeight.w800
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
    );
  }
}
