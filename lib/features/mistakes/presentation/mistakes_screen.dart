import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:flutter/material.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

/// Kullanıcının testlerde yanlış çözdüğü soruları gösteren Yanlış Defteri ekranı.
///
/// Angular'daki `MistakesComponent` karşılığıdır.
/// Yanlış sorular ders bazında filtrelenebilir, silinebilir veya seçilen ders
/// özelinde toplu olarak yeniden çözülebilir.
class MistakesScreen extends StatefulWidget {
  final MistakeRepository mistakeRepository;

  const MistakesScreen({
    super.key,
    this.mistakeRepository = const MistakeRepository(),
  });

  @override
  State<MistakesScreen> createState() => _MistakesScreenState();
}

class _MistakesScreenState extends State<MistakesScreen> {
  String _selectedLesson = 'Tümü';

  Future<void> _solveMistakes(List<Question> mistakes) async {
    if (mistakes.isEmpty) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: mistakes,
          mistakeRepository: widget.mistakeRepository,
          customTitle: _selectedLesson == 'Tümü'
              ? 'Yanlış Defteri Testi'
              : '$_selectedLesson Yanlışları Testi',
        ),
      ),
    );

    // QuizScreen'den geri dönüldüğünde çözülen sorular listeden düşmüş olabileceği için
    // arayüzü güncelliyoruz (Angular change detection / rerender gibi).
    if (mounted) {
      setState(() {});
    }
  }

  void _removeMistake(String questionId) {
    setState(() {
      widget.mistakeRepository.removeMistake(questionId);
    });
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

    final tarihCount = mistakes.where((q) => q.lesson == 'Tarih').length;
    final cografyaCount = mistakes.where((q) => q.lesson == 'Coğrafya').length;
    final vatandaslikCount = mistakes
        .where((q) => q.lesson == 'Vatandaşlık')
        .length;
    final guncelCount = mistakes
        .where((q) => q.lesson == 'Güncel Bilgiler')
        .length;

    final filteredMistakes = _selectedLesson == 'Tümü'
        ? mistakes
        : mistakes.where((q) => q.lesson == _selectedLesson).toList();

    final lessonChips = [
      {'id': 'Tümü', 'label': 'Tümü (${mistakes.length})'},
      {'id': 'Tarih', 'label': 'Tarih ($tarihCount)'},
      {'id': 'Coğrafya', 'label': 'Coğrafya ($cografyaCount)'},
      {'id': 'Vatandaşlık', 'label': 'Vatandaşlık ($vatandaslikCount)'},
      {'id': 'Güncel Bilgiler', 'label': 'Güncel Bilgiler ($guncelCount)'},
    ];

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
              // Ders Filtre Şeridi
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: lessonChips.map((chip) {
                    final isSelected = _selectedLesson == chip['id'];
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

              // Üst Bilgi Kartı ve Tekrar Çöz Butonu (Dedektif Koç ile)
              _MistakeHeaderCard(
                mistakeCount: filteredMistakes.length,
                lessonName: _selectedLesson,
                totalMistakes: mistakes.length,
                onSolveAll: () => _solveMistakes(filteredMistakes),
              ),
              AppSpacing.gapMd,

              // Yanlış Soruların Listesi
              Expanded(
                child: filteredMistakes.isEmpty
                    ? Center(
                        child: Text(
                          '$_selectedLesson dersinden yanlışın bulunmuyor.',
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

/// Yanlış defteri boşken gösterilen Dedektif Kadro Koçu temiz durum görünümü.
class _EmptyMistakesView extends StatelessWidget {
  const _EmptyMistakesView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colorScheme.primary, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  'assets/images/mascot/tugrul_detective.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.check_circle_outline,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Yanlış defterin tertemiz!',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Testlerde yanlış yaptığın sorular otomatik olarak burada birikir.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapXl,
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 10,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                  icon: const Icon(LucideIcons.play, size: 18),
                  label: const Text('Yeni Test Çöz'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FlashcardsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(LucideIcons.layers, size: 18),
                  label: const Text('Bilgi Kartlarına Git'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Yanlış sayısını, Dedektif Kadro Koçu avatarını ve 'Tüm Yanlışları Tekrar Çöz' butonunu içeren 3D kart.
class _MistakeHeaderCard extends StatelessWidget {
  final int mistakeCount;
  final String lessonName;
  final int totalMistakes;
  final VoidCallback onSolveAll;

  const _MistakeHeaderCard({
    required this.mistakeCount,
    required this.onSolveAll,
    this.lessonName = 'Tümü',
    this.totalMistakes = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final titleText = lessonName == 'Tümü'
        ? '$mistakeCount Yanlış Soru'
        : '$lessonName: $mistakeCount Yanlış';

    final buttonText = lessonName == 'Tümü'
        ? 'Tüm Yanlışları Tekrar Çöz'
        : '$lessonName Yanlışlarını Çöz ($mistakeCount)';

    return TactileCard(
      backgroundColor: colorScheme.errorContainer.withAlpha(80),
      borderColor: colorScheme.error.withAlpha(90),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.error, width: 1.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/mascot/tugrul_detective.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.bookmark_remove_outlined,
                      color: colorScheme.error,
                      size: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                    Text(
                      'Tekrar çözerek doğrula, defterden otomatik çıksın.',
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
              icon: const Icon(Icons.quiz_outlined),
              label: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}

/// Yanlış defterindeki tek bir soru kartı (3D Tactile).
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
            // Ders ve Konu Etiketi ile Silme Butonu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${question.lesson} · ${question.topic}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  // DİKKAT: Icons.delete_outline testler tarafından aranır
                  icon: const Icon(Icons.delete_outline),
                  color: colorScheme.error,
                  tooltip: 'Defterden Sil',
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Soru Metni
            Text(
              question.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Doğru Cevap Kutusu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer.withAlpha(120),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorScheme.tertiary.withAlpha(100)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.check_circle,
                          color: colorScheme.onTertiaryContainer,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Doğru Cevap: ${question.options[question.correctIndex]}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (question.explanation.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      question.explanation,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onTertiaryContainer,
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
