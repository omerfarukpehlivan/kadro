import 'package:flutter/material.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

/// Bir derse ait KPSS konularını Duolingo/Brilliant tarzı dikey yol haritası (learning path)
/// olarak listeleyen ekran.
///
/// Angular/Web karşılığı: `TopicHierarchyComponent` veya `SkillTreeComponent`.
/// TASK-53 kapsamında derse özel Tuğrul karakteri (Selçuklu Alp, Kâşif, Hukukçu, Haberci)
/// dinamik olarak konuşma balonunda gösterilir.
class LessonTopicsScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonTopicsScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${lesson.name} Konuları')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Derse özel Tuğrul karakteri ile Koç Karşılama Kartı (TASK-53)
          MascotCoachBanner(
            mood: MascotMoodExtension.fromLesson(lesson.name),
            badgeLabel: '${lesson.name.toUpperCase()} REHBERİ',
            title: '${lesson.name} Yol Haritası',
            message:
                '${lesson.topics.length} kritik konudan oluşan KPSS yol haritası. Konuları sırayla tamamla, netlerini zirveye taşı!',
          ),
          const SizedBox(height: 16),

          // Dikey Yol Haritası Düğümleri
          for (var i = 0; i < lesson.topics.length; i++)
            _TopicPathNode(
              index: i,
              totalCount: lesson.topics.length,
              lessonName: lesson.name,
              topic: lesson.topics[i],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(
                      lessonFilter: lesson.name,
                      topicFilter: lesson.topics[i],
                      customTitle: '${lesson.name} · ${lesson.topics[i]}',
                    ),
                  ),
                );
              },
            ),
        ],
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (index < totalCount - 1)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 3,
                        color: colorScheme.primary.withAlpha(70),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // 2. Sağ Sütun: Konu Başlığı ve Test Çöz Butonu (3D TactileCard)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TactileCard(
                onTap: onTap,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'ADIM ${index + 1}',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            topic,
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$lessonName · Konu Testi',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton.tonal(
                      onPressed: onTap,
                      child: const Text('Test Çöz'),
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
