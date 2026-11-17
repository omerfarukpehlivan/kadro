import 'package:flutter/material.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Çözülen bir test oturumunun karne ve analitik detay ekranı.
class QuizSessionDetailScreen extends StatelessWidget {
  final QuizSessionRecord session;

  const QuizSessionDetailScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final mood = TugrulMoodExtension.fromLesson(session.lesson);

    final accuracy = session.totalQuestions == 0
        ? 0
        : ((session.correctCount / session.totalQuestions) * 100).round();
    final avgSeconds = session.totalQuestions == 0
        ? 0
        : (session.durationSeconds / session.totalQuestions).round();

    return Scaffold(
      appBar: AppBar(title: const Text('Test Oturumu Detayı')),
      body: ResponsiveContentWrapper(
        maxWidth: 920,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: ListView(
            padding: AppSpacing.pagePadding(context),
            children: [
              TactileCard(
                backgroundColor: colorScheme.surfaceContainerLow,
                borderColor: mood.accentColor(colorScheme).withAlpha(110),
                lipColor: mood.accentColor(colorScheme).withAlpha(130),
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    TugrulAvatar(
                      mood: mood,
                      size: 56,
                      ringColor: mood.accentColor(colorScheme),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.lesson,
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            session.title,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${session.totalQuestions} soruda ${session.netScore.toStringAsFixed(2)} net · +${session.earnedXp} XP',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TactileCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Oturum Karnesi', style: textTheme.titleMedium),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+${session.earnedXp} XP',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsFill.checkCircle,
                            iconColor: colorScheme.secondary,
                            label: 'Doğru',
                            value: '${session.correctCount}',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsFill.xCircle,
                            iconColor: colorScheme.error,
                            label: 'Yanlış',
                            value: '${session.wrongCount}',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsFill.minusCircle,
                            iconColor: colorScheme.outline,
                            label: 'Boş',
                            value: '${session.emptyCount}',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsRegular.target,
                            iconColor: colorScheme.tertiary,
                            label: 'Net Puan',
                            value: session.netScore.toStringAsFixed(2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsRegular.percent,
                            iconColor: colorScheme.secondary,
                            label: 'Başarı Oranı',
                            value: '%$accuracy',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsRegular.clock,
                            iconColor: colorScheme.outline,
                            label: 'Toplam Süre',
                            value:
                                '${session.durationSeconds ~/ 60} dk ${session.durationSeconds % 60} sn',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MetricTile(
                            icon: PhosphorIconsRegular.timer,
                            iconColor: colorScheme.outline,
                            label: 'Soru Başına',
                            value: '$avgSeconds sn/soru',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(
                        lessonFilter: session.lesson == 'Genel Kültür'
                            ? null
                            : session.lesson,
                        customTitle: '${session.lesson} Tekrar Testi',
                      ),
                    ),
                  );
                },
                icon: const PhosphorIcon(PhosphorIconsBold.play, size: 16),
                label: const Text('Aynı Dersten Yeni Test Çöz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _MetricTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          PhosphorIcon(icon, color: iconColor, size: 18),
          const SizedBox(height: 4),
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
