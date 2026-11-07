import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bir derse ait KPSS konularını Duolingo/Brilliant tarzı dikey yol haritası (learning path)
/// olarak listeleyen ekran.
///
/// TASK-55 kapsamında Kadro PRO çevrimdışı konu indirme ve internetsiz açılış desteği eklenmiştir.
class LessonTopicsScreen extends ConsumerWidget {
  final Lesson lesson;

  const LessonTopicsScreen({super.key, required this.lesson});

  Future<void> _downloadAllTopics(BuildContext context, WidgetRef ref) async {
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
      final downloadedNotifier = ref.read(downloadedPackagesProvider.notifier);

      int count = 0;
      for (final topic in lesson.topics) {
        final packageId = 'topic_${lesson.name}_$topic';
        final questions = await questionRepo.fetchQuestions(
          lesson: lesson.name,
          topic: topic,
        );
        final finalQuestions = questions.isNotEmpty
            ? questions
            : await questionRepo.getQuestionsByLesson(lesson.name);

        await downloadedNotifier.downloadPackage(
          packageId: packageId,
          questions: finalQuestions,
          isPro: isPro,
        );
        count++;
      }

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ ${lesson.name} dersine ait $count konu indirildi!'),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('İndirme hatası: $e')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${lesson.name} Konuları'),
        actions: [
          Tooltip(
            message: '${lesson.name} Tüm Konuları İndir (PRO)',
            child: TextButton.icon(
              onPressed: () => _downloadAllTopics(context, ref),
              icon: const PhosphorIcon(
                PhosphorIconsBold.downloadSimple,
                size: 16,
              ),
              label: const Text('Tümünü İndir'),
            ),
          ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: ListView(
          padding: AppSpacing.pagePadding(context),
          children: [
            // Derse özel Tuğrul karakteri ile Koç Karşılama Kartı (TASK-53)
            MascotCoachBanner(
              mood: MascotMoodExtension.fromLesson(lesson.name),
              badgeLabel: '${lesson.name.toUpperCase()} REHBERİ',
              title: '${lesson.name} Yol Haritası',
              message:
                  '${lesson.topics.length} kritik konudan oluşan KPSS yol haritası. Konuları sırayla tamamla, netlerini zirveye taşı!',
            ),
            AppSpacing.gapMd,

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
                PhosphorIcon(PhosphorIconsBold.wifiSlash),
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
                    // Üst Satır: Çevrimdışı İndirme Butonu / Rozeti (Sağa Yaslı)
                    Align(
                      alignment: Alignment.centerRight,
                      child: isDownloaded
                          ? Tooltip(
                              message: 'Cihazda Hazır',
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PhosphorIcon(
                                      PhosphorIconsFill.checkCircle,
                                      size: 13,
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Cihazda',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: colorScheme.onSecondaryContainer,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Tooltip(
                              message: 'Çevrimdışı İndir',
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () => _handleDownload(context, ref),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: PhosphorIcon(
                                    PhosphorIconsBold.downloadSimple,
                                    size: 16,
                                    color: colorScheme.onSurfaceVariant
                                        .withAlpha(150),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 6),
                    // Orta: Konu Başlığı (Tam Genişlik)
                    Text(
                      topic,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Alt Satır: Sağa Yaslı Test Çöz Butonu
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.tonal(
                        onPressed: () => _startTopicTest(context, ref),
                        style: FilledButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                        ),
                        child: const Text('Test Çöz'),
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
