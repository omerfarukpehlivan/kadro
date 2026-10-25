import 'package:flutter/material.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

/// Dersler sekmesi: KPSS dersleri, Genel Yetenek ve Genel Kültür olarak gruplu.
class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // where: listeyi filtreler (JS'teki filter). toList() sonucu tekrar listeye çevirir.
    final generalAbility = kpssLessons
        .where((lesson) => lesson.section == 'Genel Yetenek')
        .toList();
    final generalCulture = kpssLessons
        .where((lesson) => lesson.section == 'Genel Kültür')
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: Icons.menu_book,
          title: 'KPSS Lisans GY-GK',
          subtitle: 'Bir derse dokunarak konu testlerine, bilgi kartlarına ve özetlere ulaşacaksın.',
        ),
        const SizedBox(height: 16),
        const SectionTitle('Genel Yetenek · 60 soru'),
        // Liste içinde for: her ders için bir kart üretir (Angular'daki @for gibi)
        for (final lesson in generalAbility) _LessonCard(lesson: lesson),
        const SizedBox(height: 8),
        const SectionTitle('Genel Kültür · 60 soru'),
        for (final lesson in generalCulture) _LessonCard(lesson: lesson),
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
