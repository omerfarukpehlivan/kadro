import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:kadro/shared/widgets/workshop_scope_bridge_banner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// "60 Saniyede Doğru / Yanlış" Hızlı Alıştırma Ekranı.
///
/// Web/Angular benzetmesi: Gamified Rapid Quiz / Duel Component.
/// Zamana karşı refleks, kombo puanlama ve KPSS Genel Kültür pekiştirme sağlar.
class TrueFalseBlitzScreen extends ConsumerStatefulWidget {
  final List<TrueFalseItem> items;
  final int initialSeconds;
  final VoidCallback? onCompleted;

  const TrueFalseBlitzScreen({
    super.key,
    this.items = sampleTrueFalseItems,
    this.initialSeconds = 60,
    this.onCompleted,
  });

  @override
  ConsumerState<TrueFalseBlitzScreen> createState() =>
      _TrueFalseBlitzScreenState();
}

class _TrueFalseBlitzScreenState extends ConsumerState<TrueFalseBlitzScreen> {
  late int _remainingSeconds;
  Timer? _timer;

  int _currentIndex = 0;
  int _correctCount = 0;
  int _wrongCount = 0;
  int _combo = 0;
  int _maxCombo = 0;
  int _earnedXp = 0;

  bool? _lastAnswerWasCorrect;
  bool _isFinished = false;

  WorkshopScopeResolution<TrueFalseItem> _resolveItems({bool watch = true}) {
    final selection = readOrWatchExamSelection(ref, watch: watch);
    return WorkshopScopeResolution.resolve<TrueFalseItem>(
      selection: selection,
      allItems: widget.items,
      matchesSelection: (item, sel) => item.matchesSelection(sel),
      matchesGkBridge: (item) =>
          item.matchesSelection(const ExamSelection.bGrubuLisans()),
    );
  }

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    if (_resolveItems(watch: false).items.isNotEmpty) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingSeconds > 1) {
        setState(() => _remainingSeconds--);
      } else {
        setState(() => _remainingSeconds = 0);
        _finishGame();
      }
    });
  }

  void _finishGame() {
    _timer?.cancel();
    try {
      widget.onCompleted?.call();
    } catch (_) {}
    if (_correctCount + _wrongCount > 0) {
      final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;
      final net = _correctCount - (_wrongCount / 4.0);
      ref
          .read(studyStatsProvider.notifier)
          .recordQuizSession(
            QuizSessionRecord(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              title: '60 Saniyede Doğru / Yanlış',
              lesson: 'Genel Kültür',
              examScope: scopeKey,
              totalQuestions: _correctCount + _wrongCount,
              correctCount: _correctCount,
              wrongCount: _wrongCount,
              emptyCount: 0,
              netScore: net,
              earnedXp: _earnedXp,
              durationSeconds: widget.initialSeconds - _remainingSeconds,
              completedAt: DateTime.now(),
            ),
          );
    }
    setState(() => _isFinished = true);
  }

  void _restartGame() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = widget.initialSeconds;
      _currentIndex = 0;
      _correctCount = 0;
      _wrongCount = 0;
      _combo = 0;
      _maxCombo = 0;
      _earnedXp = 0;
      _lastAnswerWasCorrect = null;
      _isFinished = false;
    });
    _startTimer();
  }

  void _submitChoice(bool userChoice) {
    final items = _resolveItems(watch: false).items;
    if (_lastAnswerWasCorrect != null || _isFinished || items.isEmpty) return;

    final safeIndex = _currentIndex.clamp(0, items.length - 1);
    final currentItem = items[safeIndex];
    final isCorrect = userChoice == currentItem.isTrue;
    final scopeKey = readOrWatchExamSelection(ref, watch: false).scopeKey;

    ref
        .read(studyStatsProvider.notifier)
        .recordAnswer(
          lesson: currentItem.lesson,
          isCorrect: isCorrect,
          examScope: scopeKey,
        );

    setState(() {
      if (isCorrect) {
        _correctCount++;
        _combo++;
        if (_combo > _maxCombo) {
          _maxCombo = _combo;
        }
        _earnedXp += 10 * _combo;
      } else {
        _wrongCount++;
        _combo = 0;
      }
      _lastAnswerWasCorrect = isCorrect;
    });
  }

  void _nextItem() {
    final items = _resolveItems(watch: false).items;
    if (_currentIndex >= items.length - 1) {
      _finishGame();
    } else {
      setState(() {
        _currentIndex++;
        _lastAnswerWasCorrect = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selection = readOrWatchExamSelection(ref);
    final resolution = _resolveItems();
    final items = resolution.items;

    if (items.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('60 Saniyede Doğru / Yanlış'),
          centerTitle: false,
        ),
        body: const EmptyStateView(
          mascotMood: TugrulMood.practice,
          icon: PhosphorIconsRegular.info,
          title: 'Bu kapsamda hızlı pratik öğesi bulunmuyor',
          description: 'Farklı bir sınav türü veya ders seçebilirsin.',
        ),
      );
    }

    final safeIndex = _currentIndex.clamp(0, items.length - 1);
    final currentItem = items[safeIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('60 Saniyede Doğru / Yanlış'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 820,
          padding: EdgeInsets.zero,
          child: _isFinished
              ? _BlitzSummaryView(
                  earnedXp: _earnedXp,
                  maxCombo: _maxCombo,
                  correctCount: _correctCount,
                  wrongCount: _wrongCount,
                  onRestart: _restartGame,
                )
              : Padding(
                  padding: AppSpacing.pagePadding(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (resolution.isUsingGkFallback)
                        WorkshopScopeBridgeBanner(
                          examTitle: selection.displayTitle,
                          margin: const EdgeInsets.only(bottom: 12),
                        ),
                      // 1. Üst Bilgi Rozetleri Şeridi (Süre - Kombo - XP)
                      _TopMetricBar(
                        remainingSeconds: _remainingSeconds,
                        combo: _combo,
                        earnedXp: _earnedXp,
                      ),
                      const SizedBox(height: 16),

                      // 2. Orta: Soru Önerme Kartı
                      Expanded(
                        child: _StatementCard(
                          item: currentItem,
                          currentIndex: safeIndex,
                          totalCount: items.length,
                          lastAnswerWasCorrect: _lastAnswerWasCorrect,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 3. Alt: Butonlar veya Açıklama Alanı
                      if (_lastAnswerWasCorrect != null) ...[
                        _ExplanationCard(
                          isCorrect: _lastAnswerWasCorrect!,
                          explanation: currentItem.explanation,
                        ),
                        const SizedBox(height: 12),
                        FilledButton.icon(
                          onPressed: _nextItem,
                          icon: const PhosphorIcon(
                            PhosphorIconsBold.arrowRight,
                          ),
                          label: Text(
                            safeIndex < items.length - 1
                                ? 'Sonraki İfade'
                                : 'Oturumu Bitir',
                          ),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ] else ...[
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _submitChoice(false),
                                icon: const PhosphorIcon(PhosphorIconsBold.x),
                                label: const Text('YANLIŞ'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: colorScheme.error,
                                  side: BorderSide(
                                    color: colorScheme.error,
                                    width: 2,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: () => _submitChoice(true),
                                icon: const PhosphorIcon(
                                  PhosphorIconsBold.check,
                                ),
                                label: const Text('DOĞRU'),
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
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

/// Üst metrik şeridi (Süre, Kombo ve XP göstergeleri).
class _TopMetricBar extends StatelessWidget {
  final int remainingSeconds;
  final int combo;
  final int earnedXp;

  const _TopMetricBar({
    required this.remainingSeconds,
    required this.combo,
    required this.earnedXp,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Süre Rozeti
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: remainingSeconds <= 10
                ? colorScheme.errorContainer
                : colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: remainingSeconds <= 10
                  ? colorScheme.error
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsBold.timer,
                size: 16,
                color: remainingSeconds <= 10
                    ? colorScheme.onErrorContainer
                    : colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: 6),
              Text(
                '$remainingSeconds sn',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: remainingSeconds <= 10
                      ? colorScheme.onErrorContainer
                      : colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),

        // Kombo Rozeti
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: combo > 1
                ? colorScheme.tertiaryContainer
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: combo > 1
                  ? colorScheme.tertiary
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.lightning,
                size: 16,
                color: combo > 1
                    ? colorScheme.onTertiaryContainer
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                '${combo}x Kombo',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: combo > 1
                      ? colorScheme.onTertiaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        // XP Rozeti
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colorScheme.primary.withAlpha(90)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.lightning,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 4),
              Text(
                '+$earnedXp XP',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Ortadaki KPSS önermesi kartı.
class _StatementCard extends StatelessWidget {
  final TrueFalseItem item;
  final int currentIndex;
  final int totalCount;
  final bool? lastAnswerWasCorrect;

  const _StatementCard({
    required this.item,
    required this.currentIndex,
    required this.totalCount,
    required this.lastAnswerWasCorrect,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: lastAnswerWasCorrect == null
          ? colorScheme.outlineVariant
          : (lastAnswerWasCorrect! ? colorScheme.tertiary : colorScheme.error),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${item.lesson} · ${item.topic}',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '${currentIndex + 1} / $totalCount',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: Text(
              item.statement,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.4,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

/// Anlık doğru/yanlış dönütü ve açıklama kutusu.
class _ExplanationCard extends StatelessWidget {
  final bool isCorrect;
  final String explanation;

  const _ExplanationCard({required this.isCorrect, required this.explanation});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bgColor = isCorrect
        ? colorScheme.tertiaryContainer.withAlpha(90)
        : colorScheme.errorContainer.withAlpha(90);
    final borderColor = isCorrect ? colorScheme.tertiary : colorScheme.error;

    return TactileCard(
      backgroundColor: bgColor,
      borderColor: borderColor,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                isCorrect
                    ? PhosphorIconsFill.checkCircle
                    : PhosphorIconsFill.xCircle,
                size: 18,
                color: borderColor,
              ),
              const SizedBox(width: 8),
              Text(
                isCorrect ? 'Doğru' : 'Yanlış',
                style: textTheme.labelLarge?.copyWith(
                  color: borderColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            explanation,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

/// Oyun tamamlandığında gösterilen skor ve özet ekranı.
class _BlitzSummaryView extends StatelessWidget {
  final int earnedXp;
  final int maxCombo;
  final int correctCount;
  final int wrongCount;
  final VoidCallback onRestart;

  const _BlitzSummaryView({
    required this.earnedXp,
    required this.maxCombo,
    required this.correctCount,
    required this.wrongCount,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      children: [
        TactileCard(
          backgroundColor: Color.alphaBlend(
            colorScheme.secondaryContainer.withAlpha(110),
            colorScheme.surface,
          ),
          borderColor: colorScheme.secondary,
          lipColor: colorScheme.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              TugrulAvatar(
                mood: TugrulMood.victory,
                size: 62,
                ringColor: colorScheme.secondary,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oturum Tamamlandı',
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Toplam $earnedXp XP ve en yüksek ${maxCombo}x seri kaydedildi.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Skor kartları 2x2 (Kompakt Single-Viewport - TASK-70)
        Row(
          children: [
            Expanded(
              child: TactileCard(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsDuotone.checkCircle,
                      color: colorScheme.tertiary,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$correctCount',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Doğru',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TactileCard(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsDuotone.xCircle,
                      color: colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$wrongCount',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Yanlış',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: TactileCard(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsFill.lightning,
                      color: colorScheme.tertiary,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${maxCombo}x',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onTertiaryContainer,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    Text(
                      'Maksimum Kombo',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TactileCard(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsFill.lightning,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+$earnedXp XP',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Kazanılan XP',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Yan yana kompakt aksiyon butonları (TASK-70)
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: onRestart,
                icon: const PhosphorIcon(
                  PhosphorIconsBold.arrowsCounterClockwise,
                  size: 18,
                ),
                label: const Text('Tekrar Oyna'),
                style: FilledButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const PhosphorIcon(PhosphorIconsBold.house, size: 18),
                label: const Text('Ana Sayfaya Dön'),
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
