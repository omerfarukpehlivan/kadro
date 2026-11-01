import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Çözülen tüm test oturumlarını ve denemeleri listeleyen arşiv ekranı.
///
/// Web/Angular karşılığı: Test Session History Table / Archive Screen.
class QuizHistoryScreen extends ConsumerWidget {
  const QuizHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final stats = ref.watch(studyStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Çözülen Testler Arşivi'),
        centerTitle: false,
      ),
      body: stats.sessionHistory.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.archive,
                      size: 48,
                      color: colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Henüz tamamlanmış bir test oturumu yok.',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: stats.sessionHistory.length,
              itemBuilder: (context, index) {
                final session = stats.sessionHistory[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TactileCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              QuizSessionDetailScreen(session: session),
                        ),
                      );
                    },
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                session.title,
                                style: textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '+${session.earnedXp} XP',
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Doğru: ${session.correctCount}  ·  Yanlış: ${session.wrongCount}  ·  Boş: ${session.emptyCount}',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Net: ${session.netScore.toStringAsFixed(2)}',
                              style: textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.clock,
                              size: 12,
                              color: colorScheme.outline,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${session.durationSeconds ~/ 60} dk ${session.durationSeconds % 60} sn',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
