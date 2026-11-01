import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
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
          message: stats.totalSolved == 0
              ? 'Ben Kadro Koçun! KPSS Genel Kültür maratonunda bugün ilk pençeyi hangi konuya atıyoruz?'
              : 'Harika uçuş! Bugün ${stats.totalSolved} soru çözdün, kadro hedefine adım adım yaklaşıyoruz!',
        ),
        const SizedBox(height: 16),
        // Riverpod ile anlık güncellenen 3D Tactile günlük hedef kartı
        _DailyGoalCard(solved: stats.totalSolved, goal: stats.dailyGoal),
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
                accentColor: colorScheme.primary,
                accentContainerColor: colorScheme.primaryContainer,
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
                accentColor: colorScheme.tertiary,
                accentContainerColor: colorScheme.tertiaryContainer,
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
                accentColor: colorScheme.error,
                accentContainerColor: colorScheme.errorContainer,
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
                accentColor: colorScheme.secondary,
                accentContainerColor: colorScheme.secondaryContainer,
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
      ],
    );
  }
}

/// Bugün kaç soru çözüldüğünü ve hedefe ne kadar kaldığını gösteren 3D Tactile kart.
class _DailyGoalCard extends StatelessWidget {
  final int solved;
  final int goal;

  const _DailyGoalCard({required this.solved, required this.goal});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
          backgroundColor: colorScheme.primaryContainer.withAlpha(90),
          borderColor: colorScheme.primary.withAlpha(110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bugünkü hedefin',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.flame,
                          size: 16,
                          color: colorScheme.onTertiaryContainer,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Hedef Takibi',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '$solved / $goal soru',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              // İlerleme çubuğu: hedefe göre 0.0 ile 1.0 arasına kenetlenir (clamp)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0),
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

/// 3D basılabilir dikey Bento çalışma kartı.
class _StudyTypeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final Color? accentColor;
  final Color? accentContainerColor;

  const _StudyTypeTile({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.accentColor,
    this.accentContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentContainerColor ?? colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: accentColor ?? colorScheme.primary,
                  size: 26,
                ),
              ),
              Icon(
                LucideIcons.chevronRight,
                size: 18,
                color: colorScheme.outline,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
