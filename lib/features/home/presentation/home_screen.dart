import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

/// Ana sayfa: günlük hedef ve çalışma türleri.
/// Kapsayıcı Scaffold, üst bar ve alt menü `AppShell` içinde yönetilir.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PageHeader(
          icon: Icons.school,
          title: 'Hoş geldin',
          subtitle:
              'KPSS Lisans hazırlığın burada. Bugün nereden devam edelim?',
        ),
        SizedBox(height: 16),
        // Şimdilik sabit değerler; soru çözme gelince gerçek sayı olacak (Faz 4 ve 7)
        _DailyGoalCard(solved: 0, goal: 30),
        SizedBox(height: 16),
        SectionTitle('Çalışma türleri'),
        _StudyTypeTile(
          icon: Icons.quiz_outlined,
          title: 'Konu testi',
          description: 'Bir konu seç, 10-20 soruluk test çöz.',
        ),
        _StudyTypeTile(
          icon: Icons.style_outlined,
          title: 'Bilgi kartları',
          description: 'Önünde soru, arkasında cevap. Hızlı tekrar için.',
        ),
        _StudyTypeTile(
          icon: Icons.bookmark_border,
          title: 'Yanlış defteri',
          description: 'Yanlış yaptığın soruları tekrar çöz.',
        ),
        _StudyTypeTile(
          icon: Icons.timer_outlined,
          title: 'Deneme sınavı',
          description: '120 soru, 130 dakika. Gerçek sınav düzeni.',
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
            // İlerleme çubuğu: value 0.0 ile 1.0 arasında (CSS'te width: %x gibi)
            LinearProgressIndicator(value: solved / goal),
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

  const _StudyTypeTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(
          'Yakında',
          style: textTheme.labelMedium?.copyWith(color: colorScheme.outline),
        ),
      ),
    );
  }
}
