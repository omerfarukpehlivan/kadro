import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// "60 Saniyede Pençe" Doğru / Yanlış Hızlı Düello Oyunu Ekranı.
///
/// Web/Angular benzetmesi: Gamified Rapid Quiz / Duel Component.
/// Zamana karşı refleks, kombo puanlama ve KPSS Genel Kültür pekiştirme sağlar.
class TrueFalseBlitzScreen extends ConsumerStatefulWidget {
  final List<TrueFalseItem> items;
  final int initialSeconds;

  const TrueFalseBlitzScreen({
    super.key,
    this.items = sampleTrueFalseItems,
    this.initialSeconds = 60,
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

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    _startTimer();
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
    if (_lastAnswerWasCorrect != null || _isFinished) return;

    final currentItem = widget.items[_currentIndex];
    final isCorrect = userChoice == currentItem.isTrue;

    ref
        .read(studyStatsProvider.notifier)
        .recordAnswer(lesson: currentItem.lesson, isCorrect: isCorrect);

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
    if (_currentIndex >= widget.items.length - 1) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('60 Saniyede Pençe'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: _isFinished
            ? _BlitzSummaryView(
                earnedXp: _earnedXp,
                maxCombo: _maxCombo,
                correctCount: _correctCount,
                wrongCount: _wrongCount,
                onRestart: _restartGame,
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                        item: widget.items[_currentIndex],
                        currentIndex: _currentIndex,
                        totalCount: widget.items.length,
                        lastAnswerWasCorrect: _lastAnswerWasCorrect,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 3. Alt: Butonlar veya Açıklama Alanı
                    if (_lastAnswerWasCorrect != null) ...[
                      _ExplanationCard(
                        isCorrect: _lastAnswerWasCorrect!,
                        explanation: widget.items[_currentIndex].explanation,
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _nextItem,
                        icon: const Icon(LucideIcons.arrowRight),
                        label: Text(
                          _currentIndex < widget.items.length - 1
                              ? 'Sonraki İfade'
                              : 'Düelloyu Bitir',
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
                              icon: const Icon(LucideIcons.x),
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
                              icon: const Icon(LucideIcons.check),
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
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: remainingSeconds <= 10
                  ? colorScheme.error
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.timer,
                size: 16,
                color: remainingSeconds <= 10
                    ? colorScheme.onErrorContainer
                    : colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: 6),
              Text(
                '$remainingSeconds sn',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
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
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: combo > 1
                  ? colorScheme.tertiary
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.zap,
                size: 16,
                color: combo > 1
                    ? colorScheme.onTertiaryContainer
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                '${combo}x Kombo',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
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
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorScheme.primary.withAlpha(90)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.sparkles,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 4),
              Text(
                '+$earnedXp XP',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
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
                  fontWeight: FontWeight.w800,
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
              Icon(
                isCorrect ? LucideIcons.circleCheck : LucideIcons.circleX,
                size: 18,
                color: borderColor,
              ),
              const SizedBox(width: 8),
              Text(
                isCorrect ? 'Tebrikler, Doğru!' : 'Dikkat, Yanlış!',
                style: textTheme.labelLarge?.copyWith(
                  color: borderColor,
                  fontWeight: FontWeight.w800,
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
      padding: const EdgeInsets.all(16),
      children: [
        MascotCoachBanner(
          mood: MascotMood.victory,
          badgeLabel: 'PENÇE DÜELLOSU BİTTİ',
          title: 'Düello Tamamlandı!',
          message:
              'Toplam $earnedXp XP kazandın ve en yüksek ${maxCombo}x komboya ulaştın!',
        ),
        const SizedBox(height: 16),

        // Skor kartları 2x2
        Row(
          children: [
            Expanded(
              child: TactileCard(
                child: Column(
                  children: [
                    Icon(
                      LucideIcons.checkCircle2,
                      color: colorScheme.tertiary,
                      size: 28,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$correctCount',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
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
            const SizedBox(width: 12),
            Expanded(
              child: TactileCard(
                child: Column(
                  children: [
                    Icon(
                      LucideIcons.xCircle,
                      color: colorScheme.error,
                      size: 28,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$wrongCount',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
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
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: TactileCard(
                child: Column(
                  children: [
                    Icon(
                      LucideIcons.zap,
                      color: colorScheme.tertiary,
                      size: 28,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${maxCombo}x',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.tertiary,
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
            const SizedBox(width: 12),
            Expanded(
              child: TactileCard(
                child: Column(
                  children: [
                    Icon(
                      LucideIcons.sparkles,
                      color: colorScheme.primary,
                      size: 28,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '+$earnedXp XP',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
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
        const SizedBox(height: 24),

        FilledButton.icon(
          onPressed: onRestart,
          icon: const Icon(LucideIcons.rotateCcw),
          label: const Text('Tekrar Oyna'),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        const SizedBox(height: 10),

        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(LucideIcons.house),
          label: const Text('Ana Sayfaya Dön'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ],
    );
  }
}
