import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Çözülen tüm test oturumlarını ve denemeleri listeleyen arşiv ekranı.
///
/// Geniş Web/Masaüstü ekranlarda (`>= 960px`) Master-Detail iki panelli
/// inceleme düzeni, mobilde ise tam sayfa liste + detay geçişi sunar.
class QuizHistoryScreen extends ConsumerStatefulWidget {
  const QuizHistoryScreen({super.key});

  @override
  ConsumerState<QuizHistoryScreen> createState() => _QuizHistoryScreenState();
}

class _QuizHistoryScreenState extends ConsumerState<QuizHistoryScreen> {
  String? _selectedSessionId;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final stats = ref.watch(studyStatsProvider);
    final sessions = stats.sessionHistory;
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    if (sessions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Çözülen Testler Arşivi'),
          centerTitle: false,
        ),
        body: const EmptyStateView(
          icon: PhosphorIconsRegular.archive,
          title: 'Arşiv henüz boş',
          description: 'Bir konu testi ya da deneme çözdüğünde sonuçların burada birikir.',
        ),
      );
    }

    final selectedSession = sessions.firstWhere(
      (s) => s.id == _selectedSessionId,
      orElse: () => sessions.first,
    );

    Widget buildSessionCard(QuizSessionRecord session, {required bool active}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TactileCard(
          onTap: () {
            if (isSplitPane) {
              setState(() => _selectedSessionId = session.id);
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => QuizSessionDetailScreen(session: session),
                ),
              );
            }
          },
          backgroundColor: active
              ? Color.alphaBlend(
                  colorScheme.primaryContainer.withAlpha(85),
                  colorScheme.surface,
                )
              : colorScheme.surface,
          borderColor: active
              ? colorScheme.primary
              : colorScheme.outlineVariant,
          lipColor: active ? colorScheme.primary : null,
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
                        color: active
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
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
                  Expanded(
                    child: Text(
                      'Doğru: ${session.correctCount}  ·  Yanlış: ${session.wrongCount}  ·  Boş: ${session.emptyCount}',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Net: ${session.netScore.toStringAsFixed(2)}',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontFeatures: const [FontFeature.tabularFigures()],
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
    }

    if (isSplitPane) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Çözülen Testler Arşivi'),
          centerTitle: false,
        ),
        body: ResponsiveContentWrapper(
          maxWidth: 1260,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Scrollbar(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(right: 12),
                      itemCount: sessions.length,
                      itemBuilder: (context, index) {
                        final session = sessions[index];
                        return buildSessionCard(
                          session,
                          active: session.id == selectedSession.id,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: colorScheme.outlineVariant,
                        width: 1.5,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: QuizSessionDetailScreen(
                      key: ValueKey('history_detail_${selectedSession.id}'),
                      session: selectedSession,
                      isEmbedded: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Çözülen Testler Arşivi'),
        centerTitle: false,
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: ListView.builder(
            padding: AppSpacing.pagePadding(context),
            itemCount: sessions.length,
            itemBuilder: (context, index) =>
                buildSessionCard(sessions[index], active: false),
          ),
        ),
      ),
    );
  }
}
