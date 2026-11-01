import 'package:flutter/material.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/shared/widgets/page_header.dart';

/// KPSS Hap Bilgi Kartları (Flashcards) Ekranı.
///
/// Angular'daki `FlashcardsComponent` karşılığıdır.
/// StatefulWidget olarak kartın ön/arka yüz çevrilme durumunu ve
/// öğrenilen/tekrar edilecek sayaçlarını kendi içinde yönetir.
class FlashcardsScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  const FlashcardsScreen({super.key, this.flashcards = sampleFlashcards});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int _currentIndex = 0;
  bool _isBackVisible = false;
  int _learnedCount = 0;
  int _repeatCount = 0;

  bool get _isCompleted => _currentIndex >= widget.flashcards.length;
  Flashcard get _currentCard => widget.flashcards[_currentIndex];

  void _flipCard() {
    setState(() {
      _isBackVisible = !_isBackVisible;
    });
  }

  void _onRepeat() {
    setState(() {
      _repeatCount++;
      _currentIndex++;
      _isBackVisible = false;
    });
  }

  void _onLearned() {
    setState(() {
      _learnedCount++;
      _currentIndex++;
      _isBackVisible = false;
    });
  }

  void _restart() {
    setState(() {
      _currentIndex = 0;
      _isBackVisible = false;
      _learnedCount = 0;
      _repeatCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hap Bilgi Kartları')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _isCompleted
              ? _FlashcardsSummaryView(
                  totalCards: widget.flashcards.length,
                  learnedCount: _learnedCount,
                  repeatCount: _repeatCount,
                  onRestart: _restart,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Üst İlerleme ve Sayaç Bilgisi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _currentCard.lesson,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Kart ${_currentIndex + 1} / ${widget.flashcards.length}',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (_currentIndex + 1) / widget.flashcards.length,
                    ),
                    const SizedBox(height: 16),

                    // Karta Dokunulduğunda Ön/Arka Yüz Geçişi
                    // AnimatedSwitcher: Web'deki CSS transition/flip efektine benzer;
                    // child widget değiştiğinde yumuşak fade ve scale geçişi uygular.
                    Expanded(
                      child: GestureDetector(
                        onTap: _flipCard,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleTransition(
                                scale: Tween<double>(
                                  begin: 0.95,
                                  end: 1.0,
                                ).animate(animation),
                                child: child,
                              ),
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

                    // Alt Butonlar (Tekrar Et & Biliyorum)
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _onRepeat,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Tekrar Et'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: _onLearned,
                            icon: const Icon(Icons.check),
                            label: const Text('Biliyorum'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Bilgi kartının ön veya arka yüzünü çizen bileşen.
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

    return Card(
      elevation: 2,
      color: isBack
          ? colorScheme.primaryContainer.withAlpha(70)
          : colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isBack ? colorScheme.primary : colorScheme.outlineVariant,
          width: isBack ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Rozet / Etiket
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
                        : colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isBack ? 'HAP BİLGİ' : 'SORU / KAVRAM',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isBack
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
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

            // Kartın Ana Metni
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  height: 1.5,
                  fontWeight: isBack ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            const Spacer(),

            // Alt Çevirme İpucu
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.touch_app_outlined,
                  size: 16,
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
      ),
    );
  }
}

/// Tüm kartlar tamamlandığında gösterilen sonuç özeti.
class _FlashcardsSummaryView extends StatelessWidget {
  final int totalCards;
  final int learnedCount;
  final int repeatCount;
  final VoidCallback onRestart;

  const _FlashcardsSummaryView({
    required this.totalCards,
    required this.learnedCount,
    required this.repeatCount,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const PageHeader(
          icon: Icons.check_circle_outline,
          title: 'Tebrikler!',
          subtitle: 'Tüm bilgi kartlarını tamamladın.',
        ),
        const SizedBox(height: 24),
        Card(
          color: colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Kart Çalışması Özeti',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '$totalCards Kart',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Card(
                color: colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: colorScheme.tertiary,
                        size: 28,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$learnedCount',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Öğrenildi', style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Card(
                color: colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(Icons.replay, color: colorScheme.error, size: 28),
                      const SizedBox(height: 8),
                      Text(
                        '$repeatCount',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Tekrar Edilecek', style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: onRestart,
          icon: const Icon(Icons.refresh),
          label: const Text('Yeniden Başla'),
        ),
        const SizedBox(height: 8),
        FilledButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.home),
          label: const Text('Ana Sayfaya Dön'),
        ),
      ],
    );
  }
}
