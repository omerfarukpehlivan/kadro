import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Denemeler sekmesi: sınav düzeni ve süreli deneme başlatma.
class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: LucideIcons.timer,
          title: 'Deneme sınavları',
          subtitle: 'Gerçek sınav düzeninde, süreli denemeler.',
        ),
        const SizedBox(height: 16),
        const SectionTitle('Sınav düzeni'),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colorScheme.outlineVariant),
          ),
          child: const Column(
            children: [
              ListTile(
                leading: Icon(LucideIcons.listOrdered),
                title: Text('Soru sayısı'),
                trailing: Text('60'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(LucideIcons.clock),
                title: Text('Süre'),
                trailing: Text('65 dakika'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(LucideIcons.calculator),
                title: Text('Net hesabı'),
                subtitle: Text('4 yanlış 1 doğruyu götürür'),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 200.ms),
        const SizedBox(height: 16),
        // 65 dakikalık süreli Genel Kültür denemesini başlatır
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const QuizScreen(
                  examDuration: Duration(minutes: 65),
                  customTitle: 'Genel Kültür Denemesi',
                ),
              ),
            );
          },
          icon: const Icon(LucideIcons.play),
          label: const Text('Genel Kültür Denemesi Başlat'),
        ).animate().fadeIn(duration: 200.ms),
      ],
    );
  }
}
