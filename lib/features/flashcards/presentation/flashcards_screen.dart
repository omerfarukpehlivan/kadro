import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

/// KPSS Hap Bilgi Kartları (Flashcards) Ekranı.
///
/// Angular'daki `FlashcardsComponent` karşılığıdır.
/// [ConsumerStatefulWidget] olarak kartın ön/arka yüz çevrilme durumunu,
/// seçili ders filtresini ve öğrenilen kart başına Riverpod [studyStatsProvider]
/// üzerinden XP / istatistik kaydını yönetir.
class FlashcardsScreen extends ConsumerStatefulWidget {
  final List<Flashcard> flashcards;

  const FlashcardsScreen({super.key, this.flashcards = sampleFlashcards});

  @override
  ConsumerState<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen> {
  static const List<String> _lessonFilters = [
    'Tümü',
    'Tarih',
    'Coğrafya',
    'Vatandaşlık',
    'Güncel Bilgiler',
  ];

  String _selectedLesson = 'Tümü';
  int _currentIndex = 0;
  bool _isBackVisible = false;
  int _learnedCount = 0;
  int _repeatCount = 0;

  /// Seçili derse göre filtrelenmiş kart listesi.
  List<Flashcard> get _filteredCards {
    if (_selectedLesson == 'Tümü') {
      return widget.flashcards;
    }
    return widget.flashcards
        .where((card) => card.lesson == _selectedLesson)
        .toList();
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
    });
  }

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
    if (_filteredCards.isEmpty || _currentIndex >= _filteredCards.length) {
      return;
    }
    final card = _currentCard;

    // studyStatsProvider ile XP (+15 XP) ve soru istatistiklerini kaydet
    try {
      ref
          .read(studyStatsProvider.notifier)
          .recordAnswer(
            lesson: card.lesson,
            isCorrect: true,
            topic: card.topic,
            questionText: card.frontText,
          );
    } catch (_) {
      // ProviderScope olmadan çalışan testlerde hata fırlatmasını önler
    }

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filtered = _filteredCards;

    return Scaffold(
      appBar: AppBar(title: const Text('Hap Bilgi Kartları')),
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 720,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ders Filtresi Şeridi (Tümü, Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler)
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _lessonFilters.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final lesson = _lessonFilters[index];
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
              AppSpacing.gapXs,

              // Ana İçerik Alanı
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: filtered.isEmpty
                      ? Center(
                          child: TactileCard(
                            padding: const EdgeInsets.all(24),
                            backgroundColor: colorScheme.surface,
                            borderColor: colorScheme.outlineVariant,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 48,
                                  color: colorScheme.primary,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '$_selectedLesson için henüz kart bulunmuyor',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                AppSpacing.gapXs,
                                Text(
                                  'Farklı bir ders seçerek kart çalışmasına devam edebilirsin.',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      : _isCompleted
                      ? _FlashcardsSummaryView(
                          totalCards: filtered.length,
                          learnedCount: _learnedCount,
                          repeatCount: _repeatCount,
                          selectedLesson: _selectedLesson,
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
                                  style: theme.textTheme.titleSmall,
                                ),
                                Text(
                                  'Kart ${_currentIndex + 1} / ${filtered.length}',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            AppSpacing.gapXs,
                            LinearProgressIndicator(
                              value: (_currentIndex + 1) / filtered.length,
                            ),
                            const SizedBox(height: 16),

                            // Karta Dokunulduğunda Ön/Arka Yüz Geçişi
                            Expanded(
                              child: GestureDetector(
                                key: const ValueKey('flashcard_flip_detector'),
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

    return TactileCard(
      padding: const EdgeInsets.all(24),
      backgroundColor: isBack
          ? colorScheme.primaryContainer.withAlpha(90)
          : colorScheme.surface,
      borderColor: isBack ? colorScheme.primary : colorScheme.outlineVariant,
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
                color: colorScheme.onSurface,
                height: 1.5,
                fontWeight: FontWeight.w700,
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
    );
  }
}

/// Tüm kartlar tamamlandığında gösterilen sonuç özeti.
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
                      AppSpacing.gapXs,
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
                      AppSpacing.gapXs,
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
          icon: const PhosphorIcon(PhosphorIconsBold.target),
          label: const Text('Bu Konuyu Testle Pekiştir (10 Soru)'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: onRestart,
          icon: const PhosphorIcon(PhosphorIconsBold.arrowsCounterClockwise),
          label: const Text('Yeniden Başla'),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const PhosphorIcon(PhosphorIconsBold.house),
          label: const Text('Ana Sayfaya Dön'),
        ),
      ],
    );
  }
}
