import 'package:flutter/material.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

/// Kullanıcının testlerde yanlış çözdüğü soruları gösteren Yanlış Defteri ekranı.
///
/// Angular'daki `MistakesComponent` karşılığıdır.
/// Yanlış sorular listeden silinebilir veya toplu olarak yeniden çözülebilir.
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
  Future<void> _solveMistakes(List<Question> mistakes) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: mistakes,
          mistakeRepository: widget.mistakeRepository,
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

    return Scaffold(
      appBar: AppBar(title: const Text('Yanlış Defteri')),
      body: mistakes.isEmpty
          ? const _EmptyMistakesView()
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Üst Bilgi Kartı ve Tekrar Çöz Butonu (Dedektif Koç ile)
                  _MistakeHeaderCard(
                    mistakeCount: mistakes.length,
                    onSolveAll: () => _solveMistakes(mistakes),
                  ),
                  const SizedBox(height: 16),

                  // Yanlış Soruların Listesi
                  Expanded(
                    child: ListView.builder(
                      itemCount: mistakes.length,
                      itemBuilder: (context, index) {
                        final question = mistakes[index];
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
          ],
        ),
      ),
    );
  }
}

/// Yanlış sayısını, Dedektif Kadro Koçu avatarını ve 'Tüm Yanlışları Tekrar Çöz' butonunu içeren 3D kart.
class _MistakeHeaderCard extends StatelessWidget {
  final int mistakeCount;
  final VoidCallback onSolveAll;

  const _MistakeHeaderCard({
    required this.mistakeCount,
    required this.onSolveAll,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                      '$mistakeCount Yanlış Soru',
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
              onPressed: onSolveAll,
              icon: const Icon(Icons.quiz_outlined),
              label: const Text('Tüm Yanlışları Tekrar Çöz'),
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
