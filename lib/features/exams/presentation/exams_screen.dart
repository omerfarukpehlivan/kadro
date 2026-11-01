import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

/// Denemeler sekmesi: sınav düzeni ve süreli deneme başlatma.
class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: Icons.timer,
          title: 'Deneme sınavları',
          subtitle: 'Gerçek sınav düzeninde, süreli denemeler.',
        ),
        const SizedBox(height: 16),
        const SectionTitle('Sınav düzeni'),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.format_list_numbered),
                title: Text('Soru sayısı'),
                trailing: Text('60'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Süre'),
                trailing: Text('65 dakika'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text('Net hesabı'),
                subtitle: Text('4 yanlış 1 doğruyu götürür'),
              ),
            ],
          ),
        ),
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
          icon: const Icon(Icons.play_arrow),
          label: const Text('Genel Kültür Denemesi Başlat'),
        ),
      ],
    );
  }
}
