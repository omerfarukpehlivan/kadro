import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Denemeler sekmesi: sınav düzeni ve süreli deneme başlatma.
class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const MascotCoachBanner(
          mood: MascotMood.coach,
          title: 'Deneme sınavları',
          message: 'Gerçek sınav provası! 60 soru, 65 dakika ve 4 yanlış 1 doğruyu götürür.',
        ),
        const SizedBox(height: 16),
        const SectionTitle('Sınav düzeni'),
        const TactileCard(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(LucideIcons.listOrdered),
                title: Text('Soru sayısı'),
                trailing: Text('60'),
              ),
              Divider(height: 1),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(LucideIcons.clock),
                title: Text('Süre'),
                trailing: Text('65 dakika'),
              ),
              Divider(height: 1),
              ListTile(
                contentPadding: EdgeInsets.zero,
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
