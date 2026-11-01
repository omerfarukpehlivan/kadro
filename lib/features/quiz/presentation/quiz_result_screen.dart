import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/shared/widgets/page_header.dart';

/// Test tamamlandığında net ve başarı oranını gösteren karne ekranı.
///
/// Angular'daki `QuizResultComponent` karşılığıdır.
/// Kullanıcının test performansını özetleyen salt okunur (StatelessWidget) bir ekrandır.
class QuizResultScreen extends StatelessWidget {
  final QuizResult result;

  const QuizResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Sonucu'),
        automaticallyImplyLeading: false, // Geri butonunu gizler
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sayfa başlığı ve başarı ikonu
              const PageHeader(
                icon: Icons.emoji_events,
                title: 'Test Tamamlandı!',
                subtitle: 'KPSS Genel Kültür konu testi sonucun aşağıda.',
              ),
              const SizedBox(height: 24),

              // Ana Net & Başarı Oranı Kartı
              _NetScoreCard(result: result),
              const SizedBox(height: 16),

              // Doğru, Yanlış ve Boş istatistikleri
              Row(
                children: [
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Doğru',
                      count: result.correctCount,
                      icon: Icons.check_circle_outline,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Yanlış',
                      count: result.wrongCount,
                      icon: Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Boş',
                      count: result.emptyCount,
                      icon: Icons.help_outline,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Ana sayfaya / listeye dönüş butonu
              FilledButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.home),
                label: const Text('Ana Sayfaya Dön'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Büyük Net ve Başarı yüzdesini vurgulayan kart bileşeni.
class _NetScoreCard extends StatelessWidget {
  final QuizResult result;

  const _NetScoreCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Text(
              'Net Puanın',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              result.net.toStringAsFixed(2),
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '%${result.successRate} Başarı',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Doğru, Yanlış veya Boş sayılarını gösteren tekil istatistik kutusu.
class _ResultStatItem extends StatelessWidget {
  final String label;
  final int count;
  final IconData icon;
  final Color color;

  const _ResultStatItem({
    required this.label,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
