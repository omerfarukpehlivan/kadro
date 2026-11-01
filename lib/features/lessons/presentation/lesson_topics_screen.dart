import 'package:flutter/material.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

/// Bir derse ait KPSS konularını listeleyen ekran (Faz 3/Faz 5).
class LessonTopicsScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonTopicsScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${lesson.name} Konuları')),
      // ListView.builder: Web'deki 'virtual scroll' (Angular CDK Virtual Scroll) gibi çalışır.
      // Tüm listeyi tek seferde DOM'a basmak yerine, sadece ekranda görünen öğeleri
      // render ederek bellek ve performans tasarrufu sağlar.
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: lesson.topics.length,
        itemBuilder: (context, index) {
          final topic = lesson.topics[index];
          return _TopicTile(
            index: index,
            topic: topic,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
            },
          );
        },
      ),
    );
  }
}

/// Konu listesindeki tek bir konu satırı bileşeni.
class _TopicTile extends StatelessWidget {
  final int index;
  final String topic;
  final VoidCallback onTap;

  const _TopicTile({
    required this.index,
    required this.topic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.secondaryContainer,
          child: Text(
            '${index + 1}',
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(topic),
        trailing: Icon(Icons.play_circle_outline, color: colorScheme.primary),
        onTap: onTap,
      ),
    );
  }
}
