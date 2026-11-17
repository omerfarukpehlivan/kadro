import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Yanlış yapılan soruların biriktiği ve tekrar çözülebildiği Yanlış Defteri ekranı.
class MistakesScreen extends ConsumerStatefulWidget {
  final MistakeRepository mistakeRepository;
  final VoidCallback? onCompleted;

  const MistakesScreen({
    super.key,
    this.mistakeRepository = const MistakeRepository(),
    this.onCompleted,
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
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const PaywallScreen(
            reasonMessage: 'Akıllı Yanlış Defteri Test Üretici: Yanlış yaptığın sorulardan özel testler üretip çözmek Kadro PRO üyelerine özeldir.',
          ),
        ),
      );
      if (mounted) setState(() {});
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: mistakes,
          mistakeRepository: widget.mistakeRepository,
          customTitle: _selectedLesson == 'Tümü'
              ? 'Yanlış Defteri Testi'
              : '$_selectedLesson Yanlışları Testi',
          onCompleted: _notifyDone,
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

  @override
  Widget build(BuildContext context) {
    final mistakes = widget.mistakeRepository.getMistakes();

    if (mistakes.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Yanlış Defteri')),
        body: const _EmptyMistakesView(),
      );
    }

    final lessonCounts = <String, int>{};
    for (final question in mistakes) {
      lessonCounts[question.lesson] = (lessonCounts[question.lesson] ?? 0) + 1;
    }

    final curriculum = readOrWatchCurriculum(ref);
    final filterLessons = curriculum.buildFilterLessons(
      mistakes.map((q) => q.lesson),
    );
    final effectiveSelected = filterLessons.contains(_selectedLesson)
        ? _selectedLesson
        : 'Tümü';

    final filteredMistakes = effectiveSelected == 'Tümü'
        ? mistakes
        : mistakes.where((q) => q.lesson == effectiveSelected).toList();

    bool isPro = false;
    try {
      isPro = ref.watch(userPreferencesProvider).isPro;
    } catch (_) {
      // ProviderScope bulunmayan izole test fallback
    }

    final lessonChips = filterLessons
        .map(
          (lessonName) => {
            'id': lessonName,
            'label': lessonName == 'Tümü'
                ? 'Tümü (${mistakes.length})'
                : '$lessonName (${lessonCounts[lessonName] ?? 0})',
          },
        )
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Yanlış Defteri')),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: AppSpacing.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: lessonChips.map((chip) {
                    final isSelected = effectiveSelected == chip['id'];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(chip['label']!),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              _selectedLesson = chip['id']!;
                            });
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              AppSpacing.gapSm,

              _MistakeHeaderCard(
                mistakeCount: filteredMistakes.length,
                lessonName: effectiveSelected,
                totalMistakes: mistakes.length,
                onSolveAll: () => _solveMistakes(filteredMistakes),
                isPro: isPro,
              ),
              AppSpacing.gapMd,

              Expanded(
                child: filteredMistakes.isEmpty
                    ? Center(
                        child: Text(
                          '$effectiveSelected dersinden yanlışın bulunmuyor.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredMistakes.length,
                        itemBuilder: (context, index) {
                          final question = filteredMistakes[index];
                          return _MistakeQuestionCard(
                            question: question,
                            onDelete: () => _removeMistake(question.id),
                          );
                        },
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
  const _EmptyMistakesView();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const EmptyStateView(
          mascotMood: TugrulMood.detective,
          icon: PhosphorIconsRegular.checkCircle,
          title: 'Yanlış defterinde bekleyen soru yok',
          description: 'Testlerde yanlış yaptığın sorular otomatik olarak burada birikir.',
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 10,
          children: [
            FilledButton.tonalIcon(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const QuizScreen()));
              },
              icon: const PhosphorIcon(PhosphorIconsBold.play, size: 16),
              label: const Text('Yeni Test Çöz'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FlashcardsScreen()),
                );
              },
              icon: const PhosphorIcon(PhosphorIconsRegular.cards, size: 16),
              label: const Text('Bilgi Kartlarına Git'),
            ),
          ],
        ),
      ],
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
  final Question question;
  final VoidCallback onDelete;

  const _MistakeQuestionCard({required this.question, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TactileCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${question.lesson} · ${question.topic}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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

            Text(
              question.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
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
                        child: Text(
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
                    Text(
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
                          Text(
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
