import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Ana sayfa: Kadro Koçu konuşma balonu, günlük hedef ve 2x2 Tactile Bento Grid çalışma türleri.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Kadro Koçu maskot konuşma balonu
        MascotCoachBanner(
          mood: MascotMood.coach,
          title: 'Hoş geldin',
          message: stats.dailySolvedCount == 0
              ? 'Ben Kadro Koçun! KPSS Genel Kültür maratonunda bugün ilk pençeyi hangi konuya atıyoruz?'
              : 'Harika uçuş! Bugün ${stats.dailySolvedCount} soru çözdün, kadro hedefine adım adım yaklaşıyoruz!',
        ),
        const SizedBox(height: 16),
        // Riverpod ile anlık güncellenen 3D Tactile günlük hedef kartı
        _DailyGoalCard(solved: stats.dailySolvedCount, goal: stats.dailyGoal),
        const SizedBox(height: 16),
        // Akıllı KPSS Günlük Çalışma Planı Kompakt Kartı
        const HomeDailyPlanCard(),
        if (stats.weakestLesson != 'Henüz veri yok') ...[
          const SizedBox(height: 16),
          _WeakLessonHomeBanner(weakestLesson: stats.weakestLesson),
        ],
        const SizedBox(height: 16),
        const SectionTitle('Çalışma türleri'),
        // 2x2 Tactile Bento Grid
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _StudyTypeTile(
                icon: LucideIcons.target,
                title: 'Konu testi',
                description: 'Bir konu seç, 10-20 soruluk test çöz.',
                badgeText: '10-20 Soru',
                actionText: 'Başla',
                accentColor: colorScheme.primary,
                accentContainerColor: colorScheme.primaryContainer,
                onAccentContainerColor: colorScheme.onPrimaryContainer,
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const QuizScreen()));
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StudyTypeTile(
                icon: LucideIcons.layers,
                title: 'Bilgi kartları',
                description: 'Önünde soru, arkasında cevap. Hızlı tekrar için.',
                badgeText: 'Hızlı Tekrar',
                actionText: 'Başla',
                accentColor: colorScheme.tertiary,
                accentContainerColor: colorScheme.tertiaryContainer,
                onAccentContainerColor: colorScheme.onTertiaryContainer,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FlashcardsScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _StudyTypeTile(
                icon: LucideIcons.bookmark,
                title: 'Yanlış defteri',
                description: 'Yanlış yaptığın soruları tekrar çöz.',
                badgeText: 'Akıllı Havuz',
                actionText: 'Başla',
                accentColor: colorScheme.error,
                accentContainerColor: colorScheme.errorContainer,
                onAccentContainerColor: colorScheme.onErrorContainer,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const MistakesScreen()),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StudyTypeTile(
                icon: LucideIcons.timer,
                title: 'Deneme sınavı',
                description:
                    '60 soru, 65 dakika. Gerçek Genel Kültür sınav düzeni.',
                badgeText: '65 Dakika',
                actionText: 'Başla',
                accentColor: colorScheme.secondary,
                accentContainerColor: colorScheme.secondaryContainer,
                onAccentContainerColor: colorScheme.onSecondaryContainer,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const QuizScreen(
                        examDuration: Duration(minutes: 65),
                        customTitle: 'Genel Kültür Denemesi',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SectionTitle('Etkileşimli Mini Oyunlar'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _StudyTypeTile(
                icon: LucideIcons.zap,
                title: '60 Saniyede Pençe',
                description: 'Doğru / Yanlış hızlı düello ile kombo yap.',
                badgeText: 'Kombo XP',
                actionText: 'Düelloya Gir',
                accentColor: colorScheme.tertiary,
                accentContainerColor: colorScheme.tertiaryContainer,
                onAccentContainerColor: colorScheme.onTertiaryContainer,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const TrueFalseBlitzScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StudyTypeTile(
                icon: LucideIcons.puzzle,
                title: 'Kavram Eşleştir',
                description:
                    'Tarih, Coğrafya ve Vatandaşlık kavramlarını eşleştir.',
                badgeText: 'Hafıza Oyunu',
                actionText: 'Eşleştir',
                accentColor: colorScheme.primary,
                accentContainerColor: colorScheme.primaryContainer,
                onAccentContainerColor: colorScheme.onPrimaryContainer,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ConceptMatchScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Bugün kaç soru çözüldüğünü ve hedefe ne kadar kaldığını dairesel halka (gauge) ile gösteren dashboard kartı.
class _DailyGoalCard extends StatelessWidget {
  final int solved;
  final int goal;

  const _DailyGoalCard({required this.solved, required this.goal});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final progress = goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0);
    final percent = (progress * 100).round();

    return TactileCard(
          borderRadius: 22,
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.primary.withAlpha(90),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sol: Metrikler ve yatay çubuk
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.flame,
                            size: 14,
                            color: colorScheme.onTertiaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Hedef Takibi',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onTertiaryContainer,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bugünkü hedefin',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$solved / $goal soru',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        minHeight: 8,
                        value: progress,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Sağ: Dairesel Halka / Gauge (80x80)
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 76,
                      height: 76,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 8,
                        backgroundColor: colorScheme.primaryContainer.withAlpha(
                          90,
                        ),
                        color: colorScheme.primary,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.flame,
                          size: 18,
                          color: colorScheme.tertiary,
                        ),
                        Text(
                          '%$percent',
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 200.ms)
        .slideY(begin: 0.04, end: 0, duration: 200.ms);
  }
}

/// 3D basılabilir, canlı rozetli ve aksiyon butonlu dikey Bento çalışma kartı.
class _StudyTypeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final Color? accentColor;
  final Color? accentContainerColor;
  final Color? onAccentContainerColor;
  final String badgeText;
  final String actionText;

  const _StudyTypeTile({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.accentColor,
    this.accentContainerColor,
    this.onAccentContainerColor,
    required this.badgeText,
    this.actionText = 'Başla',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveAccent = accentColor ?? colorScheme.primary;
    final effectiveAccentContainer =
        accentContainerColor ?? colorScheme.primaryContainer;
    final effectiveOnAccentContainer =
        onAccentContainerColor ?? colorScheme.onPrimaryContainer;

    return TactileCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      backgroundColor: colorScheme.surface,
      borderColor: effectiveAccent.withAlpha(110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: effectiveAccentContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: effectiveOnAccentContainer, size: 24),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: effectiveAccentContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badgeText,
                    style: textTheme.labelSmall?.copyWith(
                      color: effectiveOnAccentContainer,
                      fontWeight: FontWeight.w800,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                actionText,
                style: textTheme.labelMedium?.copyWith(
                  color: effectiveAccent,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 4),
              Icon(LucideIcons.chevronRight, size: 16, color: effectiveAccent),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}

/// Ana sayfada en zayıf derse özel 10 soruluk hızlı güçlendirme kartı.
class _WeakLessonHomeBanner extends StatelessWidget {
  final String weakestLesson;

  const _WeakLessonHomeBanner({required this.weakestLesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.error.withAlpha(140),
      padding: const EdgeInsets.all(14),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => QuizScreen(
              lessonFilter: weakestLesson,
              customTitle: '$weakestLesson — Zayıf Konuyu Güçlendir',
              limit: 10,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              LucideIcons.flame,
              color: colorScheme.onErrorContainer,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Zayıf Konuyu Güçlendir',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '10 Soru',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onErrorContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '$weakestLesson dersindeki eksiklerini kapatmak için hemen başla.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            LucideIcons.chevronRight,
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ],
      ),
    );
  }
}
