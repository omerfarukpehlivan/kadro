import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Bir derse ait KPSS konularını Duolingo/Brilliant tarzı dikey yol haritası (learning path)
/// olarak listeleyen ekran.
///
/// TASK-55 kapsamında Kadro PRO çevrimdışı konu indirme ve internetsiz açılış desteği eklenmiştir.
class LessonTopicsScreen extends ConsumerWidget {
  final Lesson lesson;

  const LessonTopicsScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ),
        ],
      ),
    );
  }
}

/// Duolingo/Brilliant tarzı dikey bağlantı çizgili yol haritası düğümü bileşeni.
class _TopicPathNode extends ConsumerWidget {
  final int index;
  final int totalCount;
  final String lessonName;
  final String topic;

  const _TopicPathNode({
    required this.index,
    required this.totalCount,
    required this.lessonName,
    required this.topic,
  });

  String get packageId => 'topic_${lessonName}_$topic';

  Future<void> _handleDownload(BuildContext context, WidgetRef ref) async {
    final isPro = ref.read(userPreferencesProvider).isPro;
    if (!isPro) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '🔒 Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
          ),
        ),
      );
      return;
    }

    try {
      final questionRepo = ref.read(questionRepositoryProvider);
      final questions = await questionRepo.fetchQuestions(
        lesson: lessonName,
        topic: topic,
      );
      final finalQuestions = questions.isNotEmpty
          ? questions
          : await questionRepo.getQuestionsByLesson(lessonName);

      await ref
          .read(downloadedPackagesProvider.notifier)
          .downloadPackage(
            packageId: packageId,
            questions: finalQuestions,
            isPro: isPro,
          );
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ $topic çevrimdışı kullanım için hazır!')),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('İndirme hatası: $e')));
    }
  }

  Future<void> _startTopicTest(BuildContext context, WidgetRef ref) async {
    final isOnline = ref.read(isOnlineProvider);
    final downloadedPackages = ref.read(downloadedPackagesProvider);
    final isDownloaded = downloadedPackages.contains(packageId);

    if (!isOnline) {
      if (isDownloaded) {
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>
                TopicTestsScreen(lessonName: lessonName, topic: topic),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (dialogCtx) => AlertDialog(
            title: const Row(
              children: [
                Icon(LucideIcons.wifiOff),
                SizedBox(width: 8),
                Text('İnternet Bağlantısı Yok'),
              ],
            ),
            content: const Text(
              'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogCtx).pop(),
                child: const Text('Tamam'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(dialogCtx).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PaywallScreen()),
                  );
                },
                child: const Text("Kadro PRO'ya Geç"),
              ),
            ],
          ),
        );
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              TopicTestsScreen(lessonName: lessonName, topic: topic),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final downloadedPackages = ref.watch(downloadedPackagesProvider);
    final isDownloaded = downloadedPackages.contains(packageId);

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
                onTap: () => _startTopicTest(context, ref),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Üst Satır: ADIM Rozeti (Sol) + Çevrimdışı İndirme Butonu (Sağ)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
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
                        Tooltip(
                          message: isDownloaded
                              ? 'Cihazda Hazır'
                              : 'Çevrimdışı İndir',
                          child: Material(
                            color: isDownloaded
                                ? colorScheme.secondaryContainer
                                : colorScheme.surfaceContainerHighest.withAlpha(
                                    140,
                                  ),
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () => _handleDownload(context, ref),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      isDownloaded
                                          ? LucideIcons.circleCheck
                                          : LucideIcons.arrowDownToLine,
                                      size: 13,
                                      color: isDownloaded
                                          ? colorScheme.onSecondaryContainer
                                          : colorScheme.onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      isDownloaded ? 'İndirildi' : 'İndir',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: isDownloaded
                                            ? colorScheme.onSecondaryContainer
                                            : colorScheme.onSurfaceVariant,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Orta: Konu Başlığı (Tam Genişlik)
                    Text(
                      topic,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Alt Satır: Alt Bilgi ve Test Çöz Butonu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '$lessonName · Konu Testi',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        FilledButton.tonal(
                          onPressed: () => _startTopicTest(context, ref),
                          style: FilledButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                          ),
                          child: const Text('Test Çöz'),
                        ),
                      ],
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
