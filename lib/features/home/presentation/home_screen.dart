import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Ana sayfa: günlük hedef ve çalışma türleri.
/// Kapsayıcı Scaffold, üst bar ve alt menü `AppShell` içinde yönetilir.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: LucideIcons.graduationCap,
          title: 'Hoş geldin',
          subtitle: 'KPSS Lisans Genel Kültür hazırlığın burada. Bugün nereden devam edelim?',
        ),
        const SizedBox(height: 16),
        // Riverpod ile anlık güncellenen günlük hedef kartı (gamified + animated)
        _DailyGoalCard(solved: stats.totalSolved, goal: stats.dailyGoal),
        const SizedBox(height: 16),
        const SectionTitle('Çalışma türleri'),
        _StudyTypeTile(
          icon: LucideIcons.target,
          title: 'Konu testi',
          description: 'Bir konu seç, 10-20 soruluk test çöz.',
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
          },
        ),
        _StudyTypeTile(
          icon: LucideIcons.layers,
          title: 'Bilgi kartları',
          description: 'Önünde soru, arkasında cevap. Hızlı tekrar için.',
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const FlashcardsScreen()));
          },
        ),
        _StudyTypeTile(
          icon: LucideIcons.bookmark,
          title: 'Yanlış defteri',
          description: 'Yanlış yaptığın soruları tekrar çöz.',
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
          },
        ),
        _StudyTypeTile(
          icon: LucideIcons.timer,
          title: 'Deneme sınavı',
          description: '60 soru, 65 dakika. Gerçek Genel Kültür sınav düzeni.',
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
      ],
    );
  }
}

/// Bugün kaç soru çözüldüğünü ve hedefe ne kadar kaldığını gösteren kart.
class _DailyGoalCard extends StatelessWidget {
  final int solved;
  final int goal;

  const _DailyGoalCard({required this.solved, required this.goal});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
          color: colorScheme.primaryContainer.withAlpha(90),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colorScheme.primary.withAlpha(60)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
          ),
        )
        .animate()
        .fadeIn(duration: 200.ms)
        .slideY(begin: 0.04, end: 0, duration: 200.ms);
  }
}

/// Bir çalışma türünü tanıtan satır (Bento/Özellik kartı).
class _StudyTypeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const _StudyTypeTile({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: colorScheme.primary),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: onTap != null
            ? Icon(LucideIcons.chevronRight, color: colorScheme.outline)
            : Text(
                'Yakında',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
