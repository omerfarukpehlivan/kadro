import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_task_launcher.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/widgets/victory_story_card.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_confirm_dialog.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Test tamamlandığında Tuğrul kutlama sahnesi ve net karnesini gösteren ekran.
class QuizResultScreen extends StatefulWidget {
  final QuizResult result;
  final String? testTitle;
  final ExamSelection? examSelection;
  final String? taskId;

  const QuizResultScreen({
    super.key,
    required this.result,
    this.testTitle,
    this.examSelection,
    this.taskId,
  });

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  bool _guestPromptShown = false;

  QuizResult get result => widget.result;
  String? get testTitle => widget.testTitle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeShowGuestSaveWarning();
      _maybeMarkDailyTaskCompleted();
    });
  }

  void _maybeMarkDailyTaskCompleted() {
    if (!mounted) return;
    try {
      final container = ProviderScope.containerOf(context, listen: false);
      final planner = container.read(studyPlannerProvider);
      final tasks = planner.tasks;
      if (tasks.isEmpty) return;

      final targetTaskId = widget.taskId;
      StudyTask? taskToMark;
      if (targetTaskId != null) {
        taskToMark = tasks
            .where((t) => t.id == targetTaskId && !t.isCompleted)
            .firstOrNull;
      }
      if (taskToMark == null && widget.testTitle != null) {
        taskToMark = tasks
            .where(
              (t) =>
                  !t.isCompleted &&
                  (t.title == widget.testTitle ||
                      widget.testTitle!.contains(t.title) ||
                      (t.lessonTag != 'Genel' &&
                          widget.testTitle!.contains(t.lessonTag))),
            )
            .firstOrNull;
      }

      if (taskToMark != null) {
        container
            .read(studyPlannerProvider.notifier)
            .markTaskCompleted(taskToMark.id);
      }
    } catch (_) {}
  }

  void _maybeShowGuestSaveWarning() {
    if (!mounted || _guestPromptShown) return;

    final ProviderContainer container;
    try {
      container = ProviderScope.containerOf(context, listen: false);
    } catch (_) {
      return;
    }

    if (container.read(authProvider).isAuthenticated) return;
    _guestPromptShown = true;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => _GuestSaveWarningDialog(
        onLoginPressed: () {
          Navigator.of(dialogContext).pop();
          final router = GoRouter.maybeOf(context);
          if (router != null) {
            router.push('/auth');
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AuthScreen()));
          }
        },
        onContinuePressed: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _showShareModal(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: colorScheme.surface.withAlpha(0),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 320,
                    maxHeight: 540,
                  ),
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: VictoryStoryCard(
                      result: result,
                      testTitle: testTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text:
                            'Kadro KPSS Genel Kültür testimde ${result.net} net yaptım (%${result.successRate} başarı). https://kadro.app',
                      ),
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sonuç metni panoya kopyalandı. İstediğin yerde paylaşabilirsin.',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const PhosphorIcon(PhosphorIconsRegular.copy, size: 16),
                  label: const Text('Skorumu & Metni Kopyala'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Kapat'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _hasProviderScope(BuildContext context) {
    try {
      ProviderScope.containerOf(context, listen: false);
      return true;
    } catch (_) {
      return false;
    }
  }

  void _goToHome() {
    // Önce tüm sekme dallarında ve aktif context/kök Navigator yığınlarında
    // açık kalan imperatif MaterialPageRoute sayfalarını temizle.
    popBranchToRoot();

    final rootNav = Navigator.maybeOf(context, rootNavigator: true);
    final branchNav = Navigator.maybeOf(context);

    if (branchNav != null && branchNav != rootNav && branchNav.canPop()) {
      branchNav.popUntil((route) => route.isFirst);
    }

    if (rootNav != null && rootNav.canPop()) {
      rootNav.popUntil((route) => route.isFirst);
    }

    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasProviderScope(context)) {
      return Consumer(
        builder: (context, ref, _) => _buildContent(context, ref),
      );
    }
    return _buildContent(context, null);
  }

  Widget _buildContent(BuildContext context, WidgetRef? ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isStrongResult = result.successRate >= 60;
    final mood = isStrongResult ? TugrulMood.victory : TugrulMood.coach;
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    StudyPlannerState? planner;
    UserPreferencesState? prefs;
    if (ref != null) {
      planner = ref.watch(studyPlannerProvider);
      prefs = ref.watch(userPreferencesProvider);
    }

    final tasks = planner?.tasks ?? const <StudyTask>[];
    StudyTask? matchedTask;
    if (widget.taskId != null && tasks.isNotEmpty) {
      matchedTask = tasks.where((t) => t.id == widget.taskId).firstOrNull;
    }
    if (matchedTask == null && widget.testTitle != null && tasks.isNotEmpty) {
      matchedTask = tasks.where((t) {
        final title = widget.testTitle!;
        return t.title == title ||
            title.contains(t.title) ||
            (t.lessonTag != 'Genel' && title.contains(t.lessonTag));
      }).firstOrNull;
    }

    final bool isDailyFlow =
        widget.taskId != null ||
        (matchedTask != null &&
            (prefs?.hasActiveStudyProgram ?? true) &&
            tasks.isNotEmpty);

    final nextTask = tasks.where((t) => !t.isCompleted).firstOrNull;
    final int completedCount = planner?.completedCount ?? (isDailyFlow ? 1 : 0);
    final int totalCount =
        planner?.totalCount != null && planner!.totalCount > 0
        ? planner.totalCount
        : (tasks.isNotEmpty ? tasks.length : 1);
    final int cycleDay = planner?.cycleDay ?? 1;

    final heroRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TugrulAvatar(
          mood: mood,
          size: 62,
          ringColor: isStrongResult
              ? colorScheme.tertiary
              : colorScheme.primary,
          tooltip: 'Karne & Tekrar Notları',
          onTap: () => TugrulTipsSheet.show(context, mood: TugrulMood.victory),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test Tamamlandı!',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              if (isDailyFlow) ...[
                const SizedBox(height: 4),
                KadroBadge(
                  label:
                      'Günlük Görev Tamamlandı · $completedCount/$totalCount Görev',
                  icon: PhosphorIconsBold.check,
                  tone: KadroBadgeTone.secondary,
                ),
              ],
              const SizedBox(height: 2),
              Text(
                result.successRate >= 70
                    ? 'Güçlü bir performans çıkardın; yanlışlarını inceleyebilirsin.'
                    : 'Yanlış yaptığın sorular Yanlış Defteri listesine eklendi.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final statSummaryRow = Row(
      children: [
        Expanded(
          child: _ResultStatItem(
            label: 'Doğru',
            count: result.correctCount,
            icon: PhosphorIconsFill.checkCircle,
            color: colorScheme.secondary,
          ),
        ),
        AppSpacing.gapHorizontalXs,
        Expanded(
          child: _ResultStatItem(
            label: 'Yanlış',
            count: result.wrongCount,
            icon: PhosphorIconsFill.xCircle,
            color: colorScheme.error,
          ),
        ),
        AppSpacing.gapHorizontalXs,
        Expanded(
          child: _ResultStatItem(
            label: 'Boş',
            count: result.emptyCount,
            icon: PhosphorIconsFill.question,
            color: colorScheme.outline,
          ),
        ),
      ],
    );

    final dailyFlowBanner = isDailyFlow
        ? _DailyFlowBanner(
            completedCount: completedCount,
            totalCount: totalCount,
            cycleDay: cycleDay,
            nextTask: nextTask,
            onNextTaskPressed: () {
              if (ref != null && nextTask != null) {
                final taskToLaunch = nextTask;
                final nav = Navigator.maybeOf(context);
                if (nav != null && nav.canPop()) {
                  nav.pop();
                }
                StudyTaskLauncher.launch(context, ref, taskToLaunch);
              }
            },
            onHomePressed: _goToHome,
          )
        : null;

    final List<Widget> actionButtons;
    if (isDailyFlow) {
      if (nextTask != null) {
        actionButtons = <Widget>[
          FilledButton.icon(
            onPressed: () {
              if (ref != null) {
                final taskToLaunch = nextTask;
                final nav = Navigator.maybeOf(context);
                if (nav != null && nav.canPop()) {
                  nav.pop();
                }
                StudyTaskLauncher.launch(context, ref, taskToLaunch);
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.secondary,
              foregroundColor: colorScheme.onSecondary,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            icon: const PhosphorIcon(PhosphorIconsBold.arrowRight, size: 18),
            label: Text(
              'Sıradaki Göreve Geç: ${nextTask.title} →',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _goToHome,
            icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 18),
            label: const Text('Ana Sayfaya Dön'),
          ),
          if (result.wrongCount > 0) ...[
            const SizedBox(height: 8),
            FilledButton.tonalIcon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MistakesScreen()),
                );
              },
              icon: const PhosphorIcon(
                PhosphorIconsRegular.bookmarkSimple,
                size: 18,
              ),
              label: Text('Yanlış Defterine Git (${result.wrongCount} Yanlış)'),
            ),
          ],
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: () => _showShareModal(context),
            icon: const PhosphorIcon(
              PhosphorIconsRegular.shareNetwork,
              size: 18,
            ),
            label: const Text('Sonucu Paylaş'),
          ),
        ];
      } else {
        actionButtons = <Widget>[
          FilledButton.icon(
            onPressed: _goToHome,
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.secondary,
              foregroundColor: colorScheme.onSecondary,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            icon: const PhosphorIcon(PhosphorIconsBold.house, size: 18),
            label: const Text('Günü Tamamladın! Ana Sayfaya Dön'),
          ),
          const SizedBox(height: 8),
          if (result.wrongCount > 0) ...[
            FilledButton.tonalIcon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MistakesScreen()),
                );
              },
              icon: const PhosphorIcon(
                PhosphorIconsRegular.bookmarkSimple,
                size: 18,
              ),
              label: Text('Yanlış Defterine Git (${result.wrongCount} Yanlış)'),
            ),
            const SizedBox(height: 8),
          ],
          FilledButton.tonalIcon(
            onPressed: () => _showShareModal(context),
            icon: const PhosphorIcon(
              PhosphorIconsRegular.shareNetwork,
              size: 18,
            ),
            label: const Text('Sonucu Paylaş'),
          ),
        ];
      }
    } else {
      actionButtons = <Widget>[
        FilledButton.tonalIcon(
          onPressed: () => _showShareModal(context),
          icon: const PhosphorIcon(PhosphorIconsRegular.shareNetwork, size: 18),
          label: const Text('Sonucu Paylaş'),
        ),
        const SizedBox(height: 8),
        if (result.wrongCount > 0) ...[
          FilledButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const MistakesScreen()),
              );
            },
            icon: const PhosphorIcon(
              PhosphorIconsRegular.bookmarkSimple,
              size: 18,
            ),
            label: Text('Yanlış Defterine Git (${result.wrongCount} Yanlış)'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _goToHome,
            icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 18),
            label: const Text('Ana Sayfaya Dön'),
          ),
        ] else ...[
          FilledButton.icon(
            onPressed: _goToHome,
            icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 18),
            label: const Text('Ana Sayfaya Dön'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const FlashcardsScreen()),
              );
            },
            icon: const PhosphorIcon(PhosphorIconsRegular.cards, size: 18),
            label: const Text('Bilgi Kartlarıyla Hızlı Tekrar'),
          ),
        ],
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Sonucu'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: isSplitPane
            ? ResponsiveContentWrapper(
                maxWidth: 1200,
                padding: EdgeInsets.zero,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: AppSpacing.pagePadding(context),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              heroRow,
                              AppSpacing.gapMd,
                              _NetScoreCard(result: result),
                              AppSpacing.gapSm,
                              statSummaryRow,
                              if (dailyFlowBanner != null) ...[
                                AppSpacing.gapSm,
                                dailyFlowBanner,
                              ],
                              AppSpacing.gapMd,
                              ...actionButtons,
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (result.hasTopicBreakdown) ...[
                                _TopicBreakdownReportCard(
                                  topicBreakdown: result.topicBreakdown!,
                                  weakestTopic: result.weakestTopic,
                                  selection: widget.examSelection,
                                ),
                                AppSpacing.gapMd,
                              ],
                              if (result.hasLessonBreakdown &&
                                  (!result.hasTopicBreakdown ||
                                      result.lessonBreakdown!.length > 1)) ...[
                                _LessonBreakdownReportCard(
                                  lessonBreakdown: result.lessonBreakdown!,
                                ),
                                AppSpacing.gapMd,
                              ],
                              TactileCard(
                                backgroundColor:
                                    colorScheme.surfaceContainerLow,
                                borderColor: colorScheme.outlineVariant,
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        PhosphorIcon(
                                          isStrongResult
                                              ? PhosphorIconsFill.sparkle
                                              : PhosphorIconsFill.target,
                                          size: 20,
                                          color: isStrongResult
                                              ? colorScheme.secondary
                                              : colorScheme.primary,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            isStrongResult
                                                ? 'Sonraki Adım Önerisi'
                                                : 'Hızlı Toparlanma Planı',
                                            style: textTheme.titleSmall
                                                ?.copyWith(
                                                  color: colorScheme.onSurface,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      result.wrongCount > 0
                                          ? 'Bu oturumda ${result.wrongCount} yanlış ve ${result.emptyCount} boş soru oluştu. Yanlış Defteri üzerinden hatalı sorularını hemen tekrar çözerek net kaybını kalıcı kazanca çevirebilirsin.'
                                          : 'Harika gidiyorsun! Sıfır hatayla tamamladığın bu oturumu Bilgi Kartları ile pekiştirerek kalıcılığı artırabilirsin.',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        height: 1.45,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    OutlinedButton.icon(
                                      onPressed: () => _showShareModal(context),
                                      icon: const PhosphorIcon(
                                        PhosphorIconsRegular.trophy,
                                        size: 16,
                                      ),
                                      label: const Text(
                                        'Zafer Karnesini Görüntüle',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : ResponsiveContentWrapper(
                maxWidth: 720,
                padding: EdgeInsets.zero,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  children: [
                    heroRow,
                    const SizedBox(height: 12),
                    _NetScoreCard(result: result),
                    const SizedBox(height: 8),
                    statSummaryRow,
                    if (dailyFlowBanner != null) ...[
                      const SizedBox(height: 10),
                      dailyFlowBanner,
                    ],
                    const SizedBox(height: 10),
                    if (result.hasLessonBreakdown &&
                        (!result.hasTopicBreakdown ||
                            result.lessonBreakdown!.length > 1)) ...[
                      _LessonBreakdownReportCard(
                        lessonBreakdown: result.lessonBreakdown!,
                      ),
                      const SizedBox(height: 10),
                    ],
                    ...actionButtons,
                    if (result.hasTopicBreakdown) ...[
                      const SizedBox(height: 12),
                      _TopicBreakdownReportCard(
                        topicBreakdown: result.topicBreakdown!,
                        weakestTopic: result.weakestTopic,
                        selection: widget.examSelection,
                      ),
                    ],
                    const SizedBox(height: 10),
                  ],
                ),
              ),
      ),
    );
  }
}

class _NetScoreCard extends StatelessWidget {
  final QuizResult result;

  const _NetScoreCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.primaryContainer,
      borderColor: colorScheme.primary.withAlpha(130),
      lipColor: colorScheme.primary.withAlpha(160),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Net Puanın',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  result.net.toStringAsFixed(2),
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: colorScheme.primary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colorScheme.primary.withAlpha(90),
                width: 1.2,
              ),
            ),
            child: Text(
              '%${result.successRate} Başarı',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultStatItem extends StatelessWidget {
  final String label;
  final int count;
  final IconData icon;
  final Color color;

  const _ResultStatItem({
    required this.label,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TactileCard(
      backgroundColor: theme.colorScheme.surface,
      borderColor: color.withAlpha(80),
      lipColor: color.withAlpha(90),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(
            '$count',
            style: theme.textTheme.titleLarge?.copyWith(
              color: color,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonBreakdownReportCard extends StatelessWidget {
  final Map<String, LessonResult> lessonBreakdown;

  const _LessonBreakdownReportCard({required this.lessonBreakdown});

  IconData _getLessonIcon(String lesson) {
    if (lesson == 'Tarih') return PhosphorIconsRegular.scroll;
    if (lesson == 'Coğrafya') return PhosphorIconsRegular.compass;
    if (lesson == 'Vatandaşlık') return PhosphorIconsRegular.scales;
    return PhosphorIconsRegular.newspaperClipping;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.chartBar,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Ders Bazlı Net Karnesi',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              const KadroBadge(
                label: 'ÖSYM Standardı',
                tone: KadroBadgeTone.primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          ...lessonBreakdown.values.map(
            (item) => _BreakdownProgressItem(
              title: '${item.lesson} (${item.totalQuestions} Soru)',
              leadingIcon: _getLessonIcon(item.lesson),
              totalQuestions: item.totalQuestions,
              correctCount: item.correctCount,
              wrongCount: item.wrongCount,
              emptyCount: item.emptyCount,
              net: item.net,
              accentRatioScore: item.totalQuestions > 0
                  ? (item.net / item.totalQuestions)
                  : 0.0,
            ),
          ),
        ],
      ),
    );
  }
}

/// Branş denemeleri ve çok konulu sınavlar için konu bazlı doğru/yanlış/net kırılımı
/// ile en zayıf konuya doğrudan çalışma köprüsü sunan karne kartı (`TASK-154`).
class _TopicBreakdownReportCard extends StatelessWidget {
  final Map<String, TopicResult> topicBreakdown;
  final TopicResult? weakestTopic;
  final ExamSelection? selection;

  const _TopicBreakdownReportCard({
    required this.topicBreakdown,
    required this.weakestTopic,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final items = topicBreakdown.values.toList()
      ..sort((a, b) => a.successRate.compareTo(b.successRate));
    final weak = weakestTopic;
    final showWeakRedirect =
        weak != null && (weak.wrongCount + weak.emptyCount) > 0;

    return TactileCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.listChecks,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Konu Bazlı Net Karnesi',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              KadroBadge(
                label: '${items.length} Konu',
                tone: KadroBadgeTone.primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          for (final item in items)
            _BreakdownProgressItem(
              title: '${item.topic} (${item.totalQuestions})',
              totalQuestions: item.totalQuestions,
              correctCount: item.correctCount,
              wrongCount: item.wrongCount,
              emptyCount: item.emptyCount,
              net: item.net,
              accentRatioScore: item.successRate / 100.0,
            ),
          if (showWeakRedirect) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer.withAlpha(110),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.tertiary.withAlpha(90)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIconsFill.target,
                        size: 16,
                        color: colorScheme.onTertiaryContainer,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Zayıf Konu Önerisi: ${weak.topic}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => TopicTestsScreen(
                            lessonName: weak.lesson,
                            topic: weak.topic,
                            selection: selection ?? ExamSelection.initial,
                          ),
                        ),
                      );
                    },
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.arrowRight,
                      size: 15,
                    ),
                    label: const Text('Zayıf Konunun Testlerini Aç'),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BreakdownProgressItem extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int emptyCount;
  final double net;
  final double accentRatioScore;

  const _BreakdownProgressItem({
    required this.title,
    this.leadingIcon,
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.emptyCount,
    required this.net,
    required this.accentRatioScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColor = accentRatioScore >= 0.70
        ? colorScheme.secondary
        : accentRatioScore >= 0.40
        ? colorScheme.primary
        : colorScheme.error;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (leadingIcon != null) ...[
                PhosphorIcon(
                  leadingIcon!,
                  size: 16,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${net.toStringAsFixed(2)} Net',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: statusColor,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: totalQuestions > 0
                        ? (correctCount / totalQuestions).clamp(0.0, 1.0)
                        : 0.0,
                    minHeight: 6,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      accentRatioScore >= 0.70
                          ? colorScheme.secondary
                          : colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${correctCount}D  ${wrongCount}Y  ${emptyCount}B',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Misafir kullanıcı testi bitirdiğinde ilerleme kaydı için açılan bilgilendirme popup'ı.
class _GuestSaveWarningDialog extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onContinuePressed;

  const _GuestSaveWarningDialog({
    required this.onLoginPressed,
    required this.onContinuePressed,
  });

  /// Elle yazılmış `Dialog` yerine ortak [KadroConfirmDialog] kullanılır;
  /// kenarlık, köşe ve buton yerleşimi uygulama genelindeki diyaloglarla aynıdır.
  @override
  Widget build(BuildContext context) {
    return KadroConfirmDialog(
      title: 'İlerlemeniz Kaydedilmiyor',
      message: 'Giriş yapmazsanız ilerlemeniz kaydedilemez. Şimdi giriş yapmak istemezseniz dilediğiniz zaman Profil sekmesinden giriş yapabilirsiniz.',
      icon: PhosphorIconsFill.cloudWarning,
      iconColor: Theme.of(context).colorScheme.tertiary,
      confirmLabel: 'Giriş Yap / Kayıt Ol',
      cancelLabel: 'Şimdilik Devam Et',
      onConfirm: onLoginPressed,
      onCancel: onContinuePressed,
    );
  }
}

/// Günlük plan akışında bir görev tamamlandığında test sonucunun hemen altında
/// adayı sıradaki göreve yönlendiren veya gün tamamlanmasını kutlayan motivasyon bandı (`TASK-163`).
class _DailyFlowBanner extends StatelessWidget {
  final int completedCount;
  final int totalCount;
  final int cycleDay;
  final StudyTask? nextTask;
  final VoidCallback onNextTaskPressed;
  final VoidCallback onHomePressed;

  const _DailyFlowBanner({
    required this.completedCount,
    required this.totalCount,
    required this.cycleDay,
    required this.nextTask,
    required this.onNextTaskPressed,
    required this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hasNext = nextTask != null;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withAlpha(120),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.secondary.withAlpha(100),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhosphorIcon(
                hasNext ? PhosphorIconsFill.sparkle : PhosphorIconsFill.trophy,
                size: 22,
                color: colorScheme.secondary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hasNext
                          ? 'Tebrikler! Bu görev tamamlandı ($completedCount/$totalCount).'
                          : 'Harika bir disiplin!',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      hasNext
                          ? 'Sırada ${nextTask!.title} görevi seni bekliyor.'
                          : 'Gün $cycleDay için planlanan tüm görevleri tamamladın!',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (hasNext)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onNextTaskPressed,
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                icon: const PhosphorIcon(
                  PhosphorIconsBold.arrowRight,
                  size: 14,
                ),
                label: Text(
                  'Sıradaki Göreve Başla',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          else
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onHomePressed,
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 14),
                label: Text(
                  'Ana Sayfaya Dön',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
