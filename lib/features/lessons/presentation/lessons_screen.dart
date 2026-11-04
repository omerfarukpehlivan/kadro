import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/widgets/lesson_progress_ring.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Dersler sekmesi: KPSS Genel Kültür dersleri (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler).
///
/// Web/Angular Karşılığı:
/// `LessonsComponent` - Ders modülleri, animasyonlu ilerleme halkaları ve konu yol haritaları.
class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveContentWrapper(
      maxWidth: 720,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: AppSpacing.pagePadding(context),
        children: [
          const MascotCoachBanner(
            mood: MascotMood.coach,
            title: 'KPSS Genel Kültür',
            message: '60 soruluk sınavda Tarih (%45) ve Coğrafya (%30) lokomotifimiz. Hangi dersten başlıyoruz?',
          ),
          AppSpacing.gapMd,
          const SectionTitle('Genel Kültür Dersleri · 60 soru'),
          // Liste içinde for: her ders için animasyonlu ilerleme halkalı 3D Tactile kart üretir
          for (final lesson in kpssLessons) _LessonCard(lesson: lesson),
        ],
      ),
    );
  }
}

/// Tek bir dersin animasyonlu ilerleme halkalı ve 3D basılabilir kartı.
class _LessonCard extends ConsumerWidget {
  final Lesson lesson;

  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final stats = ref.watch(studyStatsProvider);

    // Bu derse ait çözülen test adedi (oturum geçmişi veya soru sayısı üzerinden)
    final sessionSolved = stats.sessionHistory
        .where((s) => s.lesson.toLowerCase() == lesson.name.toLowerCase())
        .length;
    final questionBasedSolved = ((stats.solvedByLesson[lesson.name] ?? 0) / 10)
        .floor();
    final solvedCount = sessionSolved > questionBasedSolved
        ? sessionSolved
        : questionBasedSolved;
    final totalTests = lesson.topics.length * 5;
    final progress = totalTests > 0
        ? (solvedCount / totalTests).clamp(0.0, 1.0)
        : 0.0;
    final percent = (progress * 100).toInt();

    return Padding(
      padding: AppSpacing.cardMarginBottom,
      child: TactileCard(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => LessonTopicsScreen(lesson: lesson),
            ),
          );
        },
        backgroundColor: colorScheme.surface,
        borderColor: lesson.badgeText != null
            ? colorScheme.primary.withAlpha(120)
            : colorScheme.outlineVariant,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Sol Bölüm: Animasyonlu dairesel ilerleme halkası ve ders ikonu
                LessonProgressRing(
                  icon: lesson.icon,
                  progress: progress,
                  solvedCount: solvedCount,
                  totalCount: totalTests,
                  size: 52,
                ),
                const SizedBox(width: 14),
                // Orta Bölüm: Ders adı, sınav soru ağırlığı ve çözülen test rozeti
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          Text(
                            lesson.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w800,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (lesson.badgeText != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.tertiaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                lesson.badgeText!,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onTertiaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sınavda ${lesson.questionCount} soru · ${lesson.topics.length} konu',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Çözülen test sayacı ve oran rozeti
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: progress > 0
                              ? colorScheme.secondaryContainer.withAlpha(120)
                              : colorScheme.surfaceContainerHighest.withAlpha(
                                  120,
                                ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          solvedCount > 0
                              ? '$solvedCount / $totalTests Test Çözüldü (%$percent)'
                              : '0 / $totalTests Test (%0) · Hemen Başla ▶',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: progress > 0
                                ? colorScheme.secondary
                                : colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(LucideIcons.chevronRight, color: colorScheme.outline),
              ],
            ),
            const SizedBox(height: 12),
            // Çözülen test veya sınav ağırlığı ilerleme çubuğu
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                minHeight: 6,
                value: progress > 0 ? progress : (lesson.questionCount / 60),
                backgroundColor: colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(
                  progress > 0 ? colorScheme.secondary : colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
