import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';
import 'package:kadro/features/topic_lessons/data/topic_lesson_repository.dart';
import 'package:kadro/features/topic_lessons/presentation/widgets/topic_lesson_block_widgets.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Tek bir konu anlatımı bölümünün (`TopicLessonUnit`) bloklarını sırayla
/// okunaklı kitapçık düzeninde (`maxWidth: 720`, `line-height >= 1.5`) çizen ekran (`TASK-168`).
///
/// Bölüm tamamlama kuralı (Ortak Sözleşme):
/// - Kullanıcı son bloğa kadar kaydırıp "Bölümü Bitir"e bastığında bölüm tamamlanır
///   (kontrol sorularını çözmek zorunlu değildir).
/// - Tamamlandığında alt barda varsa "Sonraki Bölüm", son bölümdeyse
///   "Konu Testine Geç →" aksiyonu gösterilir.
class TopicLessonUnitScreen extends ConsumerStatefulWidget {
  final TopicLessonUnit unit;
  final List<TopicLessonUnit> allUnits;
  final ExamSelection? selection;
  final List<Question>? topicQuestionsOverride;

  const TopicLessonUnitScreen({
    super.key,
    required this.unit,
    this.allUnits = const [],
    this.selection,
    this.topicQuestionsOverride,
  });

  @override
  ConsumerState<TopicLessonUnitScreen> createState() =>
      _TopicLessonUnitScreenState();
}

class _TopicLessonUnitScreenState extends ConsumerState<TopicLessonUnitScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _hasReachedBottom = false;
  List<Question> _topicQuestions = const [];

  TopicLessonUnit get unit => widget.unit;

  int get _currentUnitIndex {
    final idx = widget.allUnits.indexWhere((u) => u.id == unit.id);
    return idx >= 0 ? idx : 0;
  }

  TopicLessonUnit? get _nextUnit {
    if (widget.allUnits.isEmpty) return null;
    final idx = _currentUnitIndex;
    if (idx + 1 < widget.allUnits.length) {
      return widget.allUnits[idx + 1];
    }
    return null;
  }

  ExamSelection _effectiveSelection() {
    if (widget.selection != null) return widget.selection!;
    try {
      return ref.read(userPreferencesProvider).examSelection;
    } catch (_) {
      return ExamSelection.initial;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    if (widget.topicQuestionsOverride != null) {
      _topicQuestions = widget.topicQuestionsOverride!;
    } else {
      unawaited(_loadTopicQuestions());
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkScrollExtent();
      _recordOpened();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _recordOpened() {
    if (!mounted) return;
    try {
      final scopeKey = _effectiveSelection().scopeKey;
      ref
          .read(topicLessonProgressProvider.notifier)
          .recordOpened(unit.id, examScope: scopeKey);
    } catch (_) {}
  }

  Future<void> _loadTopicQuestions() async {
    try {
      final repo = ref.read(questionRepositoryProvider);
      final selection = _effectiveSelection();
      final fetched = await repo.fetchQuestions(
        lesson: unit.lesson,
        topic: unit.topic,
        selection: selection,
        limit: 500,
      );
      if (!mounted) return;
      setState(() {
        _topicQuestions = fetched;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _checkScrollExtent());
    } catch (_) {}
  }

  void _onScroll() {
    _checkScrollExtent();
  }

  void _checkScrollExtent() {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    final isAtBottom = position.pixels >= (position.maxScrollExtent - 48);
    if (isAtBottom && !_hasReachedBottom) {
      setState(() {
        _hasReachedBottom = true;
      });
    }
  }

  Future<void> _handleCompleteUnit() async {
    if (!_hasReachedBottom && _scrollController.hasClients) {
      final maxExtent = _scrollController.position.maxScrollExtent;
      if (maxExtent > 0) {
        await _scrollController.animateTo(
          maxExtent,
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
        );
      }
      if (!mounted) return;
      setState(() {
        _hasReachedBottom = true;
      });
    }

    final scopeKey = _effectiveSelection().scopeKey;
    ref
        .read(topicLessonProgressProvider.notifier)
        .markCompleted(unit.id, examScope: scopeKey);
  }

  void _openNextUnit(TopicLessonUnit next) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => TopicLessonUnitScreen(
          unit: next,
          allUnits: widget.allUnits,
          selection: _effectiveSelection(),
          topicQuestionsOverride: widget.topicQuestionsOverride,
        ),
      ),
    );
  }

  void _openTopicTests() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => TopicTestsScreen(
          lessonName: unit.lesson,
          topic: unit.topic,
          selection: _effectiveSelection(),
        ),
      ),
    );
  }

  Widget _buildBlockWidget(TopicLessonBlock block, String examScope) {
    return switch (block) {
      TopicLessonHeadingBlock() => TopicLessonHeadingWidget(block: block),
      TopicLessonParagraphBlock() => TopicLessonParagraphWidget(block: block),
      TopicLessonBulletsBlock() => TopicLessonBulletsWidget(block: block),
      TopicLessonTableBlock() => TopicLessonTableWidget(block: block),
      TopicLessonTimelineBlock() => TopicLessonTimelineWidget(block: block),
      TopicLessonCalloutBlock() => TopicLessonCalloutWidget(block: block),
      TopicLessonKeyPointsBlock() => TopicLessonKeyPointsWidget(block: block),
      TopicLessonCheckQuestionsBlock() => TopicLessonCheckQuestionsWidget(
        questions: TopicLessonDomain.selectCheckQuestions(
          topicQuestions: _topicQuestions,
          unitOrder: unit.unitOrder,
          explicitQuestionIds: block.questionIds,
        ),
        examScope: examScope,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selection = _effectiveSelection();
    final progressMap = ref.watch(topicLessonProgressProvider);
    final isCompleted = progressMap[unit.id]?.isCompleted ?? false;
    final nextUnit = _nextUnit;
    final totalUnits = widget.allUnits.isNotEmpty ? widget.allUnits.length : 1;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              unit.topic,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Bölüm ${unit.unitOrder} / $totalUnits · ~${unit.estimatedMinutes} dk okuma',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: AppSpacing.pagePadding(context),
            children: [
              TactileCard(
                backgroundColor: colorScheme.surfaceContainerLow,
                borderColor: colorScheme.primary.withAlpha(110),
                lipColor: colorScheme.primary.withAlpha(140),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        KadroBadge(
                          label: '${unit.lesson} · Bölüm ${unit.unitOrder}',
                          tone: KadroBadgeTone.primary,
                        ),
                        KadroBadge(
                          label: '${unit.estimatedMinutes} dk okuma',
                          icon: PhosphorIconsRegular.clock,
                          tone: KadroBadgeTone.neutral,
                        ),
                        if (isCompleted)
                          const KadroBadge(
                            label: 'Tamamlandı',
                            icon: PhosphorIconsFill.checkCircle,
                            tone: KadroBadgeTone.secondary,
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      unit.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (unit.summary != null &&
                        unit.summary!.trim().isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        unit.summary!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < unit.blocks.length; i++) ...[
                _buildBlockWidget(unit.blocks[i], selection.scopeKey),
                if (i < unit.blocks.length - 1) const SizedBox(height: 16),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
          ),
          child: Align(
            heightFactor: 1,
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: !isCompleted
                  ? FilledButton.icon(
                      key: const ValueKey('complete_unit_button'),
                      onPressed: _handleCompleteUnit,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      icon: const PhosphorIcon(
                        PhosphorIconsBold.checkCircle,
                        size: 18,
                      ),
                      label: Text(
                        _hasReachedBottom
                            ? 'Bölümü Bitir'
                            : 'Sona Kaydır ve Bölümü Bitir',
                      ),
                    )
                  : (nextUnit != null
                        ? FilledButton.icon(
                            key: const ValueKey('next_unit_button'),
                            onPressed: () => _openNextUnit(nextUnit),
                            style: FilledButton.styleFrom(
                              minimumSize: const Size(double.infinity, 48),
                            ),
                            icon: const PhosphorIcon(
                              PhosphorIconsBold.arrowRight,
                              size: 18,
                            ),
                            label: const Text('Sonraki Bölüm'),
                          )
                        : FilledButton.icon(
                            key: const ValueKey(
                              'go_to_topic_tests_from_unit_button',
                            ),
                            onPressed: _openTopicTests,
                            style: FilledButton.styleFrom(
                              backgroundColor: colorScheme.secondary,
                              foregroundColor: colorScheme.onSecondary,
                              minimumSize: const Size(double.infinity, 48),
                            ),
                            icon: const PhosphorIcon(
                              PhosphorIconsBold.arrowRight,
                              size: 18,
                            ),
                            label: const Text('Konu Testine Geç →'),
                          )),
            ),
          ),
        ),
      ),
    );
  }
}
