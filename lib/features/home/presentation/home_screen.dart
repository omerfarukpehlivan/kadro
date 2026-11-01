import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

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
          icon: Icons.school,
          title: 'Hoş geldin',
          subtitle: 'KPSS Lisans Genel Kültür hazırlığın burada. Bugün nereden devam edelim?',
        ),
        const SizedBox(height: 16),
        // Riverpod ile anlık güncellenen günlük hedef kartı
        _DailyGoalCard(solved: stats.totalSolved, goal: stats.dailyGoal),
        const SizedBox(height: 16),
        const SectionTitle('Çalışma türleri'),
        _StudyTypeTile(
          icon: Icons.quiz_outlined,
          title: 'Konu testi',
          description: 'Bir konu seç, 10-20 soruluk test çöz.',
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
          },
        ),
        _StudyTypeTile(
          icon: Icons.style_outlined,
          title: 'Bilgi kartları',
          description: 'Önünde soru, arkasında cevap. Hızlı tekrar için.',
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const FlashcardsScreen()));
          },
        ),
        _StudyTypeTile(
          icon: Icons.bookmark_border,
          title: 'Yanlış defteri',
          description: 'Yanlış yaptığın soruları tekrar çöz.',
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
          },
        ),
        _StudyTypeTile(
          icon: Icons.timer_outlined,
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
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bugünkü hedefin', style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('$solved / $goal soru', style: textTheme.headlineSmall),
            const SizedBox(height: 12),
            // İlerleme çubuğu: hedefe göre 0.0 ile 1.0 arasına kenetlenir (clamp)
            LinearProgressIndicator(
              value: goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bir çalışma türünü tanıtan satır. Henüz hiçbiri açılmıyor.
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
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(title),
        subtitle: Text(description),
        trailing: onTap != null
            ? Icon(Icons.chevron_right, color: colorScheme.outline)
            : Text(
                'Yakında',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
      ),
    );
  }
}
