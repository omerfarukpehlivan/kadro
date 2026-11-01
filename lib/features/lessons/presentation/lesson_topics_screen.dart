import 'package:flutter/material.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Bir derse ait KPSS konularını Duolingo/Brilliant tarzı dikey yol haritası (learning path)
/// olarak listeleyen ekran.
class LessonTopicsScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonTopicsScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${lesson.name} Konuları')),
      // ListView.builder: Dikey öğrenme yolu düğümlerini verimli bir şekilde render eder.
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lesson.topics.length,
        itemBuilder: (context, index) {
          final topic = lesson.topics[index];
          return _TopicPathNode(
            index: index,
            totalCount: lesson.topics.length,
            lessonName: lesson.name,
            topic: topic,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    lessonFilter: lesson.name,
                    topicFilter: topic,
                    customTitle: '${lesson.name} · $topic',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Duolingo/Brilliant tarzı dikey bağlantı çizgili yol haritası düğümü bileşeni.
class _TopicPathNode extends StatelessWidget {
  final int index;
  final int totalCount;
  final String lessonName;
  final String topic;
  final VoidCallback onTap;

  const _TopicPathNode({
    required this.index,
    required this.totalCount,
    required this.lessonName,
    required this.topic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Sol Sütun (Yol Haritası Düğümü ve Dikey Bağlantı Çizgisi)
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? colorScheme.primary
                        : colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.primary, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withAlpha(45),
                        offset: const Offset(0, 3),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: textTheme.labelLarge?.copyWith(
                      color: index == 0
                          ? colorScheme.onPrimary
                          : colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (index < totalCount - 1)
                  Expanded(
                    child: Container(
                      width: 3,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withAlpha(70),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // 2. Sağ Sütun (3D TactileCard Konu Modülü)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: TactileCard(
                onTap: onTap,
                backgroundColor: index == 0
                    ? colorScheme.primaryContainer.withAlpha(65)
                    : colorScheme.surface,
                borderColor: index == 0
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ADIM ${index + 1}',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LucideIcons.play,
                                size: 12,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Test Çöz',
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      topic,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
