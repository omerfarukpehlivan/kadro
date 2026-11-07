import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Çözülen bir test veya mini oyun oturumunun kapsamlı karne ve analitik detay ekranı.
///
/// Web/Angular Karşılığı: QuizSessionDetailComponent / Session Summary Screen.
class QuizSessionDetailScreen extends StatelessWidget {
  final QuizSessionRecord session;

  const QuizSessionDetailScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final accuracy = session.totalQuestions == 0
        ? 0
        : ((session.correctCount / session.totalQuestions) * 100).round();
    final avgSeconds = session.totalQuestions == 0
        ? 0
        : (session.durationSeconds / session.totalQuestions).round();

    return Scaffold(
      appBar: AppBar(title: const Text('Test Oturumu Detayı')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MascotCoachBanner(
            mood: accuracy >= 75 ? MascotMood.victory : MascotMood.coach,
            badgeLabel: session.lesson.toUpperCase(),
            title: session.title,
            message:
                'Bu oturumda ${session.totalQuestions} soruda ${session.netScore.toStringAsFixed(2)} net ve +${session.earnedXp} XP elde ettin.',
          ),
          const SizedBox(height: 16),
          TactileCard(
            backgroundColor: colorScheme.surface,
            borderColor: colorScheme.outlineVariant,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Oturum Karnesi',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '+${session.earnedXp} XP',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
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
                        iconColor: colorScheme.primary,
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
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _MetricTile(
                        icon: PhosphorIconsDuotone.target,
                        iconColor: colorScheme.tertiary,
                        label: 'Net Puan',
                        value: session.netScore.toStringAsFixed(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _MetricTile(
                        icon: PhosphorIconsBold.percent,
                        iconColor: colorScheme.secondary,
                        label: 'Başarı Oranı',
                        value: '%$accuracy',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _MetricTile(
                        icon: PhosphorIconsBold.clock,
                        iconColor: colorScheme.outline,
                        label: 'Toplam Süre',
                        value:
                            '${session.durationSeconds ~/ 60} dk ${session.durationSeconds % 60} sn',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _MetricTile(
                        icon: PhosphorIconsBold.timer,
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
            icon: const PhosphorIcon(PhosphorIconsBold.play, size: 18),
            label: const Text('Aynı Dersten Yeni Test Çöz'),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(90),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(icon, size: 14, color: iconColor),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
