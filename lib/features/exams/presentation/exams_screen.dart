import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Denemeler sekmesi: sınav düzeni, süreli prova paketleri ve deneme başlatma.
class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                  fetchAllFromPool: true,
                ),
              ),
            );
          },
          icon: const Icon(LucideIcons.play),
          label: const Text('Genel Kültür Denemesi Başlat'),
        ).animate().fadeIn(duration: 200.ms),
        const SizedBox(height: 24),
        const SectionTitle('Hazır Deneme Paketleri'),
        _ExamPackCard(
          title: 'Türkiye Geneli GK Provası #1',
          subtitle: '65 Dakika · 60 Soru',
          description: 'Gerçek sınav simülasyonu. Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler.',
          badgeText: 'ÖSYM Standardı',
          icon: LucideIcons.award,
          accentColor: colorScheme.primary,
          accentContainerColor: colorScheme.primaryContainer,
          onAccentContainerColor: colorScheme.onPrimaryContainer,
          duration: const Duration(minutes: 65),
        ),
        const SizedBox(height: 12),
        _ExamPackCard(
          title: 'Tarih & Coğrafya Kamp Denemesi',
          subtitle: '40 Dakika · 45 Soru',
          description: 'Ağırlıklı derslere özel maraton kamp denemesi ile netlerini artır.',
          badgeText: 'Lokomotif Kamp',
          icon: LucideIcons.flame,
          accentColor: colorScheme.tertiary,
          accentContainerColor: colorScheme.tertiaryContainer,
          onAccentContainerColor: colorScheme.onTertiaryContainer,
          duration: const Duration(minutes: 40),
        ),
        const SizedBox(height: 12),
        _ExamPackCard(
          title: '15 Dakika Hızlı Mola Denemesi',
          subtitle: '15 Dakika · 15 Soru',
          description:
              'Çay veya kahve molasında hızlı pratik yap, tempoyu koru.',
          badgeText: 'Hızlı Mola',
          icon: LucideIcons.zap,
          accentColor: colorScheme.secondary,
          accentContainerColor: colorScheme.secondaryContainer,
          onAccentContainerColor: colorScheme.onSecondaryContainer,
          duration: const Duration(minutes: 15),
        ),
      ],
    );
  }
}

/// Deneme sınavı paket kartı.
class _ExamPackCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String badgeText;
  final IconData icon;
  final Color accentColor;
  final Color accentContainerColor;
  final Color onAccentContainerColor;
  final Duration duration;

  const _ExamPackCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.badgeText,
    required this.icon,
    required this.accentColor,
    required this.accentContainerColor,
    required this.onAccentContainerColor,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => QuizScreen(
              examDuration: duration,
              customTitle: title,
              fetchAllFromPool: true,
            ),
          ),
        );
      },
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentContainerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: onAccentContainerColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: accentContainerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  badgeText,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: onAccentContainerColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Denemeyi Başlat',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 4),
              Icon(LucideIcons.arrowRight, size: 16, color: accentColor),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
