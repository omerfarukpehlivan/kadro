import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/widgets/victory_story_card.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
                  icon: const PhosphorIcon(PhosphorIconsBold.copy, size: 16),
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
        child: ResponsiveContentWrapper(
          maxWidth: 720,
          padding: EdgeInsets.zero,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
              const SizedBox(height: 10),

              // Ana Net & Başarı Oranı 3D Kartı (Kompakt Başarı Şeridi - TASK-70)
              _NetScoreCard(result: result),
              const SizedBox(height: 8),

              // Doğru, Yanlış ve Boş istatistikleri (3D Tactile)
              Row(
                children: [
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Doğru',
                      count: result.correctCount,
                      icon: PhosphorIconsBold.check,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  AppSpacing.gapHorizontalXs,
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Yanlış',
                      count: result.wrongCount,
                      icon: PhosphorIconsBold.x,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  AppSpacing.gapHorizontalXs,
                  Expanded(
                    child: _ResultStatItem(
                      label: 'Boş',
                      count: result.emptyCount,
                      icon: PhosphorIconsBold.question,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Ders bazında detaylı karne (TASK-87)
              if (result.hasLessonBreakdown) ...[
                _LessonBreakdownReportCard(
                  lessonBreakdown: result.lessonBreakdown!,
                ),
                const SizedBox(height: 8),
              ],

              // Zafer Karnesi Paylaşım Butonu (TASK-52 & TASK-70)
              FilledButton.tonalIcon(
                onPressed: () => _showShareModal(context),
                style: FilledButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 14,
                  ),
                ),
                icon: const PhosphorIcon(
                  PhosphorIconsBold.shareNetwork,
                  size: 18,
                ),
                label: const Text('Zafer Karneni Paylaş 📸'),
              ),
              const SizedBox(height: 8),

              // Akıllı İkili Aksiyon Köprüsü (TASK-50 & TASK-70: Zero Dead-Ends UX)
              if (result.wrongCount > 0) ...[
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MistakesScreen()),
                    );
                  },
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                  ),
                  icon: const PhosphorIcon(
                    PhosphorIconsBold.bookmarkSimple,
                    size: 18,
                  ),
                  label: Text(
                    'Yanlış Defterine Git (${result.wrongCount} Yanlış)',
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                  ),
                  icon: const PhosphorIcon(PhosphorIconsBold.house, size: 18),
                  label: const Text('Ana Sayfaya Dön'),
                ),
              ] else ...[
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                  ),
                  icon: const PhosphorIcon(PhosphorIconsBold.house, size: 18),
                  label: const Text('Ana Sayfaya Dön'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const FlashcardsScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                  ),
                  icon: const PhosphorIcon(PhosphorIconsBold.cards, size: 18),
                  label: const Text('Bilgi Kartlarıyla Hızlı Tekrar'),
                ),
              ],
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

/// Büyük Net ve Başarı yüzdesini vurgulayan kompakt 3D Tactile Başarı Şeridi (TASK-70).
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Net Puanın',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  result.net.toStringAsFixed(2),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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

/// Doğru, Yanlış veya Boş sayılarını gösteren kompakt 3D istatistik kutusu (TASK-70).
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      borderRadius: 14,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(
            '$count',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// 4 Genel Kültür dersinin net ve doğruluk dökümünü gösteren resmi karne kartı (TASK-87).
class _LessonBreakdownReportCard extends StatelessWidget {
  final Map<String, LessonResult> lessonBreakdown;

  const _LessonBreakdownReportCard({required this.lessonBreakdown});

  IconData _getLessonIcon(String lesson) {
    if (lesson == 'Tarih') return PhosphorIconsDuotone.scroll;
    if (lesson == 'Coğrafya') return PhosphorIconsDuotone.compass;
    if (lesson == 'Vatandaşlık') return PhosphorIconsDuotone.scales;
    return PhosphorIconsDuotone.newspaperClipping;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsBold.chartBar,
                size: 20,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Ders Bazlı Net Karnesi',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'ÖSYM Standardı',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          ...lessonBreakdown.values.map((item) {
            final netFormatted = item.net.toStringAsFixed(2);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PhosphorIcon(
                        _getLessonIcon(item.lesson),
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${item.lesson} (${item.totalQuestions} Soru)',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '$netFormatted Net',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: item.net >= (item.totalQuestions * 0.7)
                              ? colorScheme.tertiary
                              : item.net >= (item.totalQuestions * 0.4)
                              ? colorScheme.primary
                              : colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: item.totalQuestions > 0
                                ? (item.correctCount / item.totalQuestions)
                                      .clamp(0.0, 1.0)
                                : 0.0,
                            minHeight: 6,
                            backgroundColor:
                                colorScheme.surfaceContainerHighest,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              item.net >= (item.totalQuestions * 0.7)
                                  ? colorScheme.tertiary
                                  : colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${item.correctCount}D  ${item.wrongCount}Y  ${item.emptyCount}B',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    ).animate().fadeIn(duration: 250.ms);
  }
}
