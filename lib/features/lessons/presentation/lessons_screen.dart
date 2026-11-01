import 'package:flutter/material.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

/// Dersler sekmesi: KPSS Genel Kültür dersleri (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler).
class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: Icons.menu_book,
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
class _LessonCard extends StatelessWidget {
  final Lesson lesson;

  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(lesson.icon)),
        title: Text(lesson.name),
        subtitle: Text('Sınavda ${lesson.questionCount} soru'),
        trailing: const Icon(Icons.chevron_right),
        // Faz 5'te: dokununca dersin konu listesi açılacak
        onTap: null,
      ),
    );
  }
}
