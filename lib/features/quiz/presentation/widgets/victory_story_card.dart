import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';

/// Tuğrul zafer madalyonu ve KPSS başarı özetini sunan paylaşılabilir sonuç kartı.
class VictoryStoryCard extends StatelessWidget {
  final QuizResult result;
  final String? testTitle;

  const VictoryStoryCard({super.key, required this.result, this.testTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final netDisplay = result.net % 1 == 0
        ? result.net.toInt().toString()
        : result.net.toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withAlpha(110),
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colorScheme.outlineVariant, width: 1.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TugrulAvatar(
                  mood: TugrulMood.victory,
                  size: 46,
                  ringColor: colorScheme.tertiary,
                  hasShadow: false,
                ),
                const SizedBox(height: 6),
                Text(
                  'KADRO · KPSS GENEL KÜLTÜR',
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.tertiary,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  testTitle ?? 'Genel Kültür Testi',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: colorScheme.primary.withAlpha(80),
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '$netDisplay NET',
                    textAlign: TextAlign.center,
                    style: textTheme.displayMedium?.copyWith(
                      color: colorScheme.primary,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${result.totalQuestions} soru üzerinden',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: _CertificateMetric(
                          label: 'Doğru',
                          value: '${result.correctCount}',
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                        color: colorScheme.outlineVariant,
                      ),
                      Expanded(
                        child: _CertificateMetric(
                          label: 'Yanlış',
                          value: '${result.wrongCount}',
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                        color: colorScheme.outlineVariant,
                      ),
                      Expanded(
                        child: _CertificateMetric(
                          label: 'Başarı',
                          value: '%${result.successRate}',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    result.net >= 45 ? 'KADRO DERECE ADAYI' : 'HEDEF 60\'TA 60',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'kadro.app · KPSS Genel Kültür',
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.outline,
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
}

class _CertificateMetric extends StatelessWidget {
  final String label;
  final String value;

  const _CertificateMetric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
