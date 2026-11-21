import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/branch_mock_exam_generator.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/presentation/widgets/blueprint_exam_launcher.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_confirm_dialog.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Seçilen dersin konu başlıklarını dikey yol haritası olarak sunan ekran.
///
/// Geniş masaüstü ve web ekranlarda (`>= 960px`) Master-Detail iki panelli
/// yapıya geçerek solda konu haritasını, sağda seçili konunun testlerini gösterir.
class LessonTopicsScreen extends ConsumerStatefulWidget {
  final Lesson lesson;

  const LessonTopicsScreen({super.key, required this.lesson});

  @override
  ConsumerState<LessonTopicsScreen> createState() => _LessonTopicsScreenState();
}

class _LessonTopicsScreenState extends ConsumerState<LessonTopicsScreen> {
  String? _selectedTopic;

  Lesson get lesson => widget.lesson;

  String? get _effectiveSelectedTopic {
    if (lesson.topics.isEmpty) return null;
    if (_selectedTopic != null && lesson.topics.contains(_selectedTopic)) {
      return _selectedTopic;
    }
    return lesson.topics.first;
  }

  Future<void> _downloadAllTopics(BuildContext context, WidgetRef ref) async {
    final isPro = ref.read(userPreferencesProvider).isPro;
    if (!isPro) {
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => const PaywallScreen(
            reasonMessage: 'Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${lesson.name} konuları cihazına indiriliyor...'),
      ),
    );

    try {
      final questionRepo = ref.read(questionRepositoryProvider);
      final downloadedNotifier = ref.read(downloadedPackagesProvider.notifier);
      final selection = readOrWatchExamSelection(ref, watch: false);

      int count = 0;
      for (final topic in lesson.topics) {
        final packageId = OfflineDownloadService.topicPackageId(
          scopeNamespace: selection.curriculumNamespace,
          lesson: lesson.name,
          topic: topic,
        );
        final questions = await questionRepo.fetchQuestions(
          lesson: lesson.name,
          topic: topic,
          selection: selection,
          limit: 500,
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
          content: Text('${lesson.name} dersine ait $count konu indirildi.'),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('İndirme hatası: $e')));
    }
  }

  Future<void> _startBranchMockExam(BuildContext context, WidgetRef ref) async {
    final selection = readOrWatchExamSelection(ref, watch: false);
    final curriculum = CurriculumRegistry.resolve(selection);
    final matchingSpec = curriculum.activeLessons
        .cast<LessonSpec?>()
        .firstWhere(
          (item) => item?.id == lesson.id || item?.name == lesson.name,
          orElse: () => null,
        );
    final effectiveSpec = matchingSpec ?? LessonSpec.fromLegacyLesson(lesson);
    final blueprint = BranchMockExamGenerator.buildBlueprint(
      lesson: effectiveSpec,
      selection: selection,
      branchMockNumber: 1,
      isProOnly: false,
    );
    await launchBlueprintExamWithGuard(
      context: context,
      ref: ref,
      blueprint: blueprint,
      selection: selection,
      isBranchMock: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final selection = readOrWatchExamSelection(ref);
    final mood = TugrulMoodExtension.fromLesson(lesson.name);
    final accent = mood.accentColor(colorScheme);
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);
    final activeTopic = _effectiveSelectedTopic;
    final canStartBranchMock =
        !lesson.isComingSoon &&
        lesson.questionCount > 0 &&
        lesson.topics.isNotEmpty;

    final heroBanner = TactileCard(
      backgroundColor: colorScheme.surfaceContainerLow,
      borderColor: accent.withAlpha(120),
      lipColor: accent.withAlpha(140),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KadroBadge(
                      label:
                          '${lesson.topics.length} Ünite · Sınavda ${lesson.questionCount} Soru',
                      backgroundColor: accent.withAlpha(24),
                      foregroundColor: accent,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Konu Yol Haritası',
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isSplitPane
                          ? 'Soldan ünite seçin, sağ panelde konu testlerine hemen başlayın.'
                          : 'Üniteleri sırayla aç veya doğrudan test çözmeye başla.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              TugrulAvatar(
                mood: mood,
                size: isSplitPane ? 76 : 62,
                ringColor: accent,
                tooltip: '${lesson.name} İpuçları',
                onTap: () => TugrulTipsSheet.show(context, mood: mood),
              ),
            ],
          ),
          if (canStartBranchMock) ...[
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              key: const ValueKey('lesson_branch_mock_button'),
              onPressed: () => _startBranchMockExam(context, ref),
              icon: const PhosphorIcon(PhosphorIconsBold.exam, size: 16),
              label: Text(
                'Bu Dersten Branş Denemesi Çöz (${lesson.questionCount} Soru)',
              ),
            ),
          ],
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          '${lesson.name} Konuları',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: ResponsiveBreakpoints.horizontalPadding(context) - 8,
            ),
            child: Tooltip(
              message: '${lesson.name} Tüm Konuları İndir (PRO)',
              child: TextButton.icon(
                onPressed: () => _downloadAllTopics(context, ref),
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                ),
                icon: const PhosphorIcon(
                  PhosphorIconsBold.downloadSimple,
                  size: 16,
                ),
                label: Text(
                  'Tümünü İndir',
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: isSplitPane && activeTopic != null
          ? ResponsiveContentWrapper(
              maxWidth: 1320,
              padding: EdgeInsets.zero,
              child: Padding(
                padding: AppSpacing.pagePadding(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Scrollbar(
                        child: ListView(
                          padding: const EdgeInsets.only(right: 10),
                          children: [
                            heroBanner,
                            AppSpacing.gapMd,
                            for (var i = 0; i < lesson.topics.length; i++)
                              _TopicPathNode(
                                index: i,
                                totalCount: lesson.topics.length,
                                lessonName: lesson.name,
                                topic: lesson.topics[i],
                                selection: selection,
                                isSelected: lesson.topics[i] == activeTopic,
                                onSelectTopic: () {
                                  setState(
                                    () => _selectedTopic = lesson.topics[i],
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: colorScheme.outlineVariant,
                            width: 1.5,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: TopicTestsScreen(
                          key: ValueKey('${lesson.name}_$activeTopic'),
                          lessonName: lesson.name,
                          topic: activeTopic,
                          selection: selection,
                          isEmbedded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ResponsiveContentWrapper(
              maxWidth: 720,
              padding: EdgeInsets.zero,
              child: ListView(
                padding: AppSpacing.pagePadding(context),
                children: [
                  heroBanner,
                  AppSpacing.gapMd,
                  for (var i = 0; i < lesson.topics.length; i++)
                    _TopicPathNode(
                      index: i,
                      totalCount: lesson.topics.length,
                      lessonName: lesson.name,
                      topic: lesson.topics[i],
                      selection: selection,
                    ),
                ],
              ),
            ),
    );
  }
}

class _TopicPathNode extends ConsumerWidget {
  final int index;
  final int totalCount;
  final String lessonName;
  final String topic;
  final ExamSelection selection;
  final bool isSelected;
  final VoidCallback? onSelectTopic;

  const _TopicPathNode({
    required this.index,
    required this.totalCount,
    required this.lessonName,
    required this.topic,
    required this.selection,
    this.isSelected = false,
    this.onSelectTopic,
  });

  String get scopeNamespace => selection.curriculumNamespace;

  Future<void> _startTopicTest(BuildContext context, WidgetRef ref) async {
    final isOnline = ref.read(isOnlineProvider);
    final downloadedPackages = ref.read(downloadedPackagesProvider);
    final isDownloaded = OfflineDownloadService.isTopicPackageDownloaded(
      downloadedPackages,
      scopeNamespace: scopeNamespace,
      lesson: lessonName,
      topic: topic,
    );

    if (onSelectTopic != null) {
      if (isOnline || isDownloaded) {
        onSelectTopic!();
        return;
      }
    }

    if (!isOnline) {
      if (isDownloaded) {
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => TopicTestsScreen(
              lessonName: lessonName,
              topic: topic,
              selection: selection,
            ),
          ),
        );
      } else {
        KadroConfirmDialog.alert(
          context,
          icon: PhosphorIconsBold.wifiSlash,
          title: 'İnternet Bağlantısı Yok',
          message: 'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
          buttonLabel: 'Tamam',
          secondaryButtonLabel: "Kadro PRO'ya Geç",
          onSecondaryPressed: () {
            if (!context.mounted) return;
            Navigator.of(
              context,
              rootNavigator: true,
            ).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
          },
        );
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => TopicTestsScreen(
            lessonName: lessonName,
            topic: topic,
            selection: selection,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final downloadedPackages = ref.watch(downloadedPackagesProvider);
    final isDownloaded = OfflineDownloadService.isTopicPackageDownloaded(
      downloadedPackages,
      scopeNamespace: scopeNamespace,
      lesson: lessonName,
      topic: topic,
    );

    final stats = ref.watch(studyStatsProvider);
    final planner = ref.watch(studyPlannerProvider);
    final solvedTestNumbers = <int>{
      ...stats.solvedTestNumbersForTopic(lesson: lessonName, topic: topic),
      ...planner.completedTestNumbersForTopic(lesson: lessonName, topic: topic),
    };
    final solvedTestCount = solvedTestNumbers.length;
    final topicCountsAsync = ref.watch(
      lessonTopicTestCountsProvider(
        TopicCountQueryKey(
          scopeKey: selection.scopeKey,
          lessonName: lessonName,
        ),
      ),
    );
    final fetchedCount = topicCountsAsync.value?[topic];
    final rawTotalTests = (fetchedCount != null && fetchedCount > 0)
        ? fetchedCount
        : CurriculumRegistry.defaultTopicTestCount(
            lessonName,
            topic,
            selection: selection,
          );
    final totalTests = solvedTestCount > rawTotalTests
        ? solvedTestCount
        : rawTotalTests;
    final isPartiallySolved =
        solvedTestCount > 0 && solvedTestCount < totalTests;
    final isAllTestsSolved = totalTests > 0 && solvedTestCount >= totalTests;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sol yol düğümü
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isAllTestsSolved
                        ? colorScheme.secondary
                        : ((isPartiallySolved || index == 0)
                              ? colorScheme.primary
                              : colorScheme.surface),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isAllTestsSolved
                          ? colorScheme.secondary
                          : (isPartiallySolved || index == 0
                                ? colorScheme.primary
                                : colorScheme.outlineVariant),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            (isAllTestsSolved
                                    ? colorScheme.secondary
                                    : (isPartiallySolved || index == 0
                                          ? colorScheme.primary
                                          : colorScheme.outlineVariant))
                                .withAlpha(110),
                        offset: const Offset(0, 2),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: isAllTestsSolved
                      ? PhosphorIcon(
                          PhosphorIconsBold.check,
                          size: 16,
                          color: colorScheme.onSecondary,
                        )
                      : Text(
                          '${index + 1}',
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: (isPartiallySolved || index == 0)
                                ? colorScheme.onPrimary
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                ),
                if (index < totalCount - 1)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 2.5,
                        color:
                            (isAllTestsSolved
                                    ? colorScheme.secondary
                                    : colorScheme.outlineVariant)
                                .withAlpha(170),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TactileCard(
                onTap: () => _startTopicTest(context, ref),
                borderColor: isSelected
                    ? colorScheme.primary
                    : isAllTestsSolved
                    ? colorScheme.secondary.withAlpha(150)
                    : (isPartiallySolved
                          ? colorScheme.primary.withAlpha(140)
                          : colorScheme.outlineVariant),
                lipColor: isSelected
                    ? colorScheme.primary
                    : isAllTestsSolved
                    ? colorScheme.secondary.withAlpha(160)
                    : (isPartiallySolved
                          ? colorScheme.primary.withAlpha(150)
                          : colorScheme.outlineVariant),
                backgroundColor: isSelected
                    ? colorScheme.primaryContainer.withAlpha(75)
                    : isAllTestsSolved
                    ? colorScheme.secondaryContainer.withAlpha(45)
                    : colorScheme.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          if (isAllTestsSolved)
                            KadroBadge(
                              label: '$solvedTestCount/$totalTests Test',
                              icon: PhosphorIconsFill.checkCircle,
                              tone: KadroBadgeTone.secondary,
                            )
                          else if (isPartiallySolved)
                            KadroBadge(
                              label: '$solvedTestCount/$totalTests Test',
                              icon: PhosphorIconsBold.chartPieSlice,
                            )
                          else
                            KadroBadge(
                              label: '0/$totalTests Test',
                              tone: KadroBadgeTone.neutral,
                            ),
                          if (isDownloaded)
                            const KadroBadge(
                              label: 'Cihazda',
                              icon: PhosphorIconsFill.checkCircle,
                              tone: KadroBadgeTone.secondary,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      topic,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.tonal(
                        onPressed: () => _startTopicTest(context, ref),
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(0, 38),
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
