import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Dersler sekmesi: KPSS Genel Kültür dersleri (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler).
class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: LucideIcons.bookOpen,
          title: 'KPSS Genel Kültür',
          subtitle: 'Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler konu testleri ve hap bilgiler.',
        ),
        const SizedBox(height: 16),
        const SectionTitle('Genel Kültür Dersleri · 60 soru'),
        // Liste içinde for: her ders için bir kart üretir (Angular'daki @for gibi)
        for (final lesson in kpssLessons) _LessonCard(lesson: lesson),
      ],
    );
  }
}

/// Tek bir dersin kartı.
///
/// Stack widget'ı Web'deki `position: relative` kapsayıcısı gibidir;
/// içindeki Positioned ise `position: absolute` gibi çalışarak bileşenleri
/// üst üste katmanlar halinde hizalar.
class _LessonCard extends StatelessWidget {
  final Lesson lesson;

  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colorScheme.outlineVariant),
          ),
          child: ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(lesson.icon, color: colorScheme.onPrimaryContainer),
            ),
            title: Text(lesson.name),
            subtitle: Text(
              'Sınavda ${lesson.questionCount} soru · ${lesson.topics.length} konu',
            ),
            trailing: const Icon(LucideIcons.chevronRight),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LessonTopicsScreen(lesson: lesson),
                ),
              );
            },
          ),
        ),
        // Eğer dersin rozet metni (badgeText) varsa sağ üst köşeye rozet konduruyoruz
        if (lesson.badgeText != null)
          Positioned(
            top: 6,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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
          ),
      ],
    ).animate().fadeIn(duration: 200.ms);
  }
}
