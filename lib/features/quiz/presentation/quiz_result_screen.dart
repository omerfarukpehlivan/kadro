import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadro/features/quiz/presentation/widgets/victory_story_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Test tamamlandığında net ve başarı oranını gösteren karne ekranı.
///
/// Angular'daki `QuizResultComponent` karşılığıdır.
/// Kullanıcının test performansını özetleyen salt okunur (StatelessWidget) bir ekrandır.
class QuizResultScreen extends StatelessWidget {
  final QuizResult result;
  final String? testTitle;

  const QuizResultScreen({super.key, required this.result, this.testTitle});

  void _showShareModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 320,
                    maxHeight: 540,
                  ),
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: VictoryStoryCard(
                      result: result,
                      testTitle: testTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text:
                            '🦅 Kadro KPSS Genel Kültür testimde ${result.net} NET yaptım! (%${result.successRate} Başarı). Hedef 2026 KPSS Derecesi! Sen de netini test et: https://kadro.app',
                      ),
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            '📸 Zafer metni panoya kopyalandı! Instagram veya WhatsApp durumunda paylaşabilirsin.',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(LucideIcons.copy, size: 16),
                  label: const Text('Skorumu & Metni Kopyala'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Kapat'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
              // Zafer modunda Kadro Koçu maskot konuşma balonu
              MascotCoachBanner(
                mood: MascotMood.victory,
                badgeLabel: 'ZAFER KARNESİ',
                title: 'Test Tamamlandı!',
                message: result.successRate >= 70
                    ? 'Muhteşem bir uçuş! Kadro Koçu seninle gurur duyuyor, kadro kapıları açılıyor!'
                    : 'Güzel mücadele! Yanlış Defteri\'ne düşen soruları birlikte inceleyip nete çevirelim.',
              ),
              const SizedBox(height: 20),

              // Ana Net & Başarı Oranı 3D Kartı
              _NetScoreCard(result: result),
              const SizedBox(height: 16),

              // Doğru, Yanlış ve Boş istatistikleri (3D Tactile)
              Row(
                children: [
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Doğru',
                      count: result.correctCount,
                      icon: LucideIcons.check,
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
              const SizedBox(height: 16),

              // Zafer Karnesi Paylaşım Butonu (TASK-52)
              FilledButton.tonalIcon(
                onPressed: () => _showShareModal(context),
                icon: const Icon(LucideIcons.share2, size: 18),
                label: const Text('Zafer Karneni Paylaş 📸'),
              ),

              const Spacer(),

              // Akıllı İkili Aksiyon Köprüsü (TASK-50: Zero Dead-Ends UX)
              if (result.wrongCount > 0) ...[
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MistakesScreen()),
                    );
                  },
                  icon: const Icon(LucideIcons.bookmarkCheck),
                  label: Text(
                    'Yanlış Defterine Git (${result.wrongCount} Yanlış)',
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(LucideIcons.house),
                  label: const Text('Ana Sayfaya Dön'),
                ),
              ] else ...[
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(LucideIcons.house),
                  label: const Text('Ana Sayfaya Dön'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const FlashcardsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(LucideIcons.layers),
                  label: const Text('Bilgi Kartlarıyla Hızlı Tekrar'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Büyük Net ve Başarı yüzdesini vurgulayan 3D Tactile kart bileşeni.
class _NetScoreCard extends StatelessWidget {
  final QuizResult result;

  const _NetScoreCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.primaryContainer,
      borderColor: colorScheme.primary.withAlpha(120),
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
    ).animate().fadeIn(duration: 200.ms);
  }
}

/// Doğru, Yanlış veya Boş sayılarını gösteren 3D istatistik kutusu.
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

    return TactileCard(
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      borderColor: theme.colorScheme.outlineVariant,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      borderRadius: 14,
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
    );
  }
}
