import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Çözülen tüm test oturumlarını ve denemeleri listeleyen arşiv ekranı.
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
          ? const EmptyStateView(
              icon: PhosphorIconsRegular.archive,
              title: 'Arşiv henüz boş',
              description: 'Bir konu testi ya da deneme çözdüğünde sonuçların burada birikir.',
            )
          : ResponsiveContentWrapper(
              maxWidth: 920,
              padding: EdgeInsets.zero,
              child: Scrollbar(
                child: ListView.builder(
                  padding: AppSpacing.pagePadding(context),
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
                                    style: textTheme.titleSmall,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '+${session.earnedXp} XP',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
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
                                    color: colorScheme.primary,
                                    fontFeatures: const [
                                      FontFeature.tabularFigures(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                PhosphorIcon(
                                  PhosphorIconsRegular.clock,
                                  size: 12,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${session.durationSeconds ~/ 60} dk ${session.durationSeconds % 60} sn',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w500,
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
              ),
            ),
    );
  }
}
