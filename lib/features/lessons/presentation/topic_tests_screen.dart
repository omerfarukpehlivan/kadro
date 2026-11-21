import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/test_difficulty_tier.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bir konuya ait soruları 10'ar soruluk aşamalı seviye testlerine bölen ekran.
class TopicTestsScreen extends ConsumerStatefulWidget {
  final String lessonName;
  final String topic;
  final ExamSelection? selection;
  final QuestionRepository questionRepository;

  /// Masaüstü Master-Detail (`LessonTopicsScreen >= 960px`) içinde sağ panel olarak
  /// gömüldüğünde `true` olur; iç içe `Scaffold` ve `AppBar` üretmez.
  final bool isEmbedded;

  const TopicTestsScreen({
    super.key,
    required this.lessonName,
    required this.topic,
    this.selection,
    this.questionRepository = const QuestionRepository(),
    this.isEmbedded = false,
  });

  @override
  ConsumerState<TopicTestsScreen> createState() => _TopicTestsScreenState();
}

class _TopicTestsScreenState extends ConsumerState<TopicTestsScreen> {
  bool _isLoading = true;
  List<Question> _allQuestions = [];
  List<List<Question>> _testChunks = [];

  ExamSelection get _effectiveSelection =>
      widget.selection ?? readOrWatchExamSelection(ref, watch: false);

  String get packageId => OfflineDownloadService.topicPackageId(
    scopeNamespace: _effectiveSelection.curriculumNamespace,
    lesson: widget.lessonName,
    topic: widget.topic,
  );

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  @override
  void didUpdateWidget(covariant TopicTestsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.topic != widget.topic ||
        oldWidget.lessonName != widget.lessonName ||
        oldWidget.selection?.curriculumNamespace !=
            widget.selection?.curriculumNamespace) {
      setState(() => _isLoading = true);
      _loadQuestions();
    }
  }

  Future<void> _loadQuestions() async {
    final selection = _effectiveSelection;
    final isOnline = ref.read(isOnlineProvider);
    final downloadedPackages = ref.read(downloadedPackagesProvider);
    final isDownloaded = OfflineDownloadService.isTopicPackageDownloaded(
      downloadedPackages,
      scopeNamespace: selection.curriculumNamespace,
      lesson: widget.lessonName,
      topic: widget.topic,
    );

    List<Question> fetched = [];

    if (!isOnline && isDownloaded) {
      final local = await ref
          .read(offlineDownloadServiceProvider)
          .getDownloadedQuestions(packageId);
      fetched = local ?? [];
    } else {
      try {
        final repo = ref.read(questionRepositoryProvider);
        fetched = await repo.fetchQuestions(
          lesson: widget.lessonName,
          topic: widget.topic,
          selection: selection,
          limit: 500,
        );
      } catch (_) {
        fetched = await widget.questionRepository.fetchQuestions(
          lesson: widget.lessonName,
          topic: widget.topic,
          selection: selection,
          limit: 500,
        );
      }
    }

    final sorted = QuestionRepository.sortTopicQuestions(fetched);
    final chunks = QuestionRepository.chunkTopicQuestions(sorted);

    if (!mounted) return;
    setState(() {
      _allQuestions = sorted;
      _testChunks = chunks;
      _isLoading = false;
    });
  }

  void _startTest(
    int testIndex,
    List<Question> chunkQuestions,
    TestDifficultyTier tier,
  ) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: chunkQuestions,
          lessonFilter: widget.lessonName,
          topicFilter: widget.topic,
          topicTestNumber: testIndex + 1,
          examSelection: _effectiveSelection,
          customTitle:
              '${widget.lessonName} · ${widget.topic} · Test ${testIndex + 1} (${tier.cleanTitle})',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final mood = TugrulMoodExtension.fromLesson(widget.lessonName);
    final accent = mood.accentColor(colorScheme);

    final content = _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _testChunks.isEmpty
        ? _TopicTestsEmptyState(
            lessonName: widget.lessonName,
            allowBackNavigation: !widget.isEmbedded,
          )
        : ResponsiveContentWrapper(
            maxWidth: widget.isEmbedded ? double.infinity : 720,
            padding: EdgeInsets.zero,
            child: Scrollbar(
              child: ListView(
                padding: widget.isEmbedded
                    ? const EdgeInsets.all(20)
                    : AppSpacing.pagePadding(context),
                children: [
                  TactileCard(
                    backgroundColor: colorScheme.surfaceContainerLow,
                    borderColor: accent.withAlpha(110),
                    lipColor: accent.withAlpha(130),
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        if (!widget.isEmbedded) ...[
                          TugrulAvatar(
                            mood: mood,
                            size: 52,
                            ringColor: accent,
                            tooltip: '${widget.lessonName} İpuçları',
                            onTap: () =>
                                TugrulTipsSheet.show(context, mood: mood),
                          ),
                          const SizedBox(width: 12),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.topic} Testleri',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.isEmbedded
                                    ? '${_testChunks.length} Test · ${_allQuestions.length} Soru · Kolaydan zora'
                                    : 'Kolaydan zora 10\'ar soruluk testler halinde hazırlanmıştır.',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.gapMd,
                  for (var i = 0; i < _testChunks.length; i++)
                    _buildTestCard(
                      context: context,
                      index: i,
                      chunk: _testChunks[i],
                    ),
                ],
              ),
            ),
          );

    if (widget.isEmbedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.topic,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleSmall,
            ),
            Text(
              '${widget.lessonName} · ${_testChunks.length} Test (${_allQuestions.length} Soru)',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: content,
    );
  }

  Widget _buildTestCard({
    required BuildContext context,
    required int index,
    required List<Question> chunk,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final stats = ref.watch(studyStatsProvider);
    final solvedSession = stats.findLatestSessionForTest(
      lesson: widget.lessonName,
      topic: widget.topic,
      testNumber: index + 1,
    );

    final avgDifficulty = chunk.isNotEmpty
        ? chunk.map((q) => q.difficultyLevel).reduce((a, b) => a + b) /
              chunk.length
        : 2.0;

    final tier = TestDifficultyTierExtension.fromAvgDifficulty(avgDifficulty);
    final badgeBg = tier.backgroundColor(colorScheme);
    final badgeFg = tier.foregroundColor(colorScheme);

    return Padding(
      padding: AppSpacing.cardMarginBottom,
      child: TactileCard(
        onTap: () => _startTest(index, chunk, tier),
        backgroundColor: solvedSession != null
            ? colorScheme.secondaryContainer.withAlpha(45)
            : colorScheme.surface,
        borderColor: solvedSession != null
            ? colorScheme.secondary.withAlpha(160)
            : colorScheme.outlineVariant,
        lipColor: solvedSession != null
            ? colorScheme.secondary.withAlpha(170)
            : colorScheme.outlineVariant,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'TEST ${index + 1}',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: badgeBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(tier.icon, size: 12, color: badgeFg),
                        const SizedBox(width: 4),
                        Text(
                          tier.title,
                          style: textTheme.labelSmall?.copyWith(
                            color: badgeFg,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (solvedSession != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
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
                            'Çözüldü · ${solvedSession.correctCount}D ${solvedSession.wrongCount}Y (${solvedSession.netScore.toStringAsFixed(1)} Net)',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.tonal(
              onPressed: () => _startTest(index, chunk, tier),
              style: FilledButton.styleFrom(
                minimumSize: const Size(0, 38),
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
              ),
              child: Text(solvedSession != null ? 'Tekrar Çöz' : 'Test Çöz'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopicTestsEmptyState extends StatelessWidget {
  final String lessonName;
  final bool allowBackNavigation;

  const _TopicTestsEmptyState({
    required this.lessonName,
    required this.allowBackNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateView(
      mascotMood: TugrulMoodExtension.fromLesson(lessonName),
      title: 'Test Bulunamadı',
      description: 'Bu konuya ait henüz soru yüklenmemiş veya çevrimdışı paket indirilmemiş.',
      actionLabel: allowBackNavigation ? 'Geri Dön' : null,
      onAction: allowBackNavigation ? () => Navigator.of(context).pop() : null,
    );
  }
}
