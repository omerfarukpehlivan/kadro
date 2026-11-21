import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/branch_mock_exam_generator.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/exams/presentation/widgets/blueprint_exam_launcher.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_filter_chips.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Denemeler sekmesi: optik formlu Tuğrul sınav merkezi, aktif sınav türüne göre
/// dinamik süre/soru düzeni ve hazır deneme paketleri.
class ExamsScreen extends ConsumerWidget {
  const ExamsScreen({super.key});

  String _formatHeroDuration(
    MockExamBlueprint primary,
    ExamSelection selection,
  ) {
    final extra = primary.extraMinutesFor(selection);
    if (extra > 0) {
      return '${primary.standardDurationMinutes} (+$extra) dk';
    }
    return '${primary.standardDurationMinutes} dakika';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selection = readOrWatchExamSelection(ref);
    final curriculum = readOrWatchCurriculum(ref);
    final blueprints = ExamBlueprintRegistry.forSelection(
      selection,
      curriculum: curriculum,
    );
    final primaryBlueprint = ExamBlueprintRegistry.primaryFullExamFor(
      selection,
      curriculum: curriculum,
    );
    final heroTitle = primaryBlueprint.id == 'gk_deneme_1'
        ? 'Genel Kültür Denemesi #1'
        : primaryBlueprint.title;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);
    final isWideHero = ResponsiveBreakpoints.usesDialogOverlay(context);
    final gridColumns = screenWidth >= 1200 ? 3 : (screenWidth >= 760 ? 2 : 1);

    final primaryActionButton = FilledButton.icon(
      onPressed: () => launchBlueprintExamWithGuard(
        context: context,
        ref: ref,
        blueprint: primaryBlueprint,
        selection: selection,
        customTitle: heroTitle,
      ),
      icon: PhosphorIcon(
        primaryBlueprint.isComingSoon
            ? PhosphorIconsRegular.lockSimple
            : PhosphorIconsFill.play,
        size: 16,
      ),
      label: Text(primaryBlueprint.primaryButtonLabel),
    );

    final heroMetricsRow = Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.primary.withAlpha(70)),
            ),
            child: Column(
              children: [
                Text(
                  '${primaryBlueprint.totalQuestionCount}',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.primary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Soru sayısı',
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.primary.withAlpha(70)),
            ),
            child: Column(
              children: [
                Text(
                  _formatHeroDuration(primaryBlueprint, selection),
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Süre',
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final heroRuleBadge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withAlpha(180),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Net hesabı',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              '4 yanlış 1 doğruyu götürür',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );

    return ResponsiveContentWrapper(
      maxWidth: isLargeTablet ? 1240 : 720,
      padding: EdgeInsets.zero,
      child: Scrollbar(
        child: ListView(
          padding: AppSpacing.pagePadding(context),
          children: [
            // Sınav Simülasyonu Hero Kartı (Tuğrul optik form ve kronometre ile)
            TactileCard(
              backgroundColor: colorScheme.primaryContainer,
              borderColor: colorScheme.primary.withAlpha(130),
              lipColor: colorScheme.primary.withAlpha(170),
              padding: EdgeInsets.all(isWideHero ? 20 : 16),
              child: isWideHero
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deneme sınavları',
                                style: textTheme.headlineMedium?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${selection.displayTitle} düzenine uygun süre ve 4 yanlış 1 doğru kuralıyla sınav kondisyonu kazan.',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onPrimaryContainer
                                      .withAlpha(210),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Wrap(
                                spacing: 12,
                                runSpacing: 10,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [primaryActionButton, heroRuleBadge],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Sınav düzeni',
                                      style: textTheme.labelMedium?.copyWith(
                                        color: colorScheme.onPrimaryContainer,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    heroMetricsRow,
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              TugrulAvatar(
                                mood: TugrulMood.exam,
                                size: 92,
                                ringColor: colorScheme.primary,
                                tooltip: 'Deneme Sınavı Kuralları',
                                onTap: () => TugrulTipsSheet.show(
                                  context,
                                  mood: TugrulMood.exam,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deneme sınavları',
                                    style: textTheme.headlineMedium?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${selection.displayTitle} düzenine uygun süre ve 4 yanlış 1 doğru kuralıyla sınav kondisyonu kazan.',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onPrimaryContainer
                                          .withAlpha(200),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            TugrulAvatar(
                              mood: TugrulMood.exam,
                              size: 68,
                              ringColor: colorScheme.primary,
                              tooltip: 'Deneme Sınavı Kuralları',
                              onTap: () => TugrulTipsSheet.show(
                                context,
                                mood: TugrulMood.exam,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Sınav düzeni',
                          style: textTheme.labelMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        heroMetricsRow,
                        const SizedBox(height: 10),
                        heroRuleBadge,
                        const SizedBox(height: 14),
                        primaryActionButton,
                      ],
                    ),
            ),
            AppSpacing.gapXl,
            const SectionTitle('Hazır Deneme Paketleri'),
            ResponsiveGrid(
              columns: gridColumns,
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final blueprint in blueprints)
                  _ExamPackCard(blueprint: blueprint, selection: selection),
              ],
            ),
            AppSpacing.gapXl,
            _BranchExamsSection(
              selection: selection,
              curriculum: curriculum,
              gridColumns: gridColumns,
            ),
            AppSpacing.gapLg,
            const SectionTitle('Puan & Analiz'),
            const _ScoreCalculatorShortcutCard(),
          ],
        ),
      ),
    );
  }
}

class _ExamPackCard extends ConsumerWidget {
  final MockExamBlueprint blueprint;
  final ExamSelection selection;

  const _ExamPackCard({required this.blueprint, required this.selection});

  String get packageId => blueprintPackageIdFor(blueprint);

  String get title => blueprint.title;

  String get subtitle {
    final totalDuration =
        blueprint.standardDurationMinutes +
        blueprint.extraMinutesFor(selection);
    return '$totalDuration Dakika · ${blueprint.totalQuestionCount} Soru';
  }

  String get description => blueprint.subtitle;

  String get badgeText => blueprint.badgeLabel;

  bool get isProOnly => blueprint.isProOnly;

  IconData _resolveIcon() {
    if (blueprint.isProOnly) return PhosphorIconsFill.crown;
    if (blueprint.isMiniPractice) return PhosphorIconsFill.lightning;
    if (blueprint.id.contains('kamp')) return PhosphorIconsFill.fire;
    return PhosphorIconsFill.trophy;
  }

  Color _accentColor(ColorScheme colorScheme) {
    if (blueprint.isProOnly) return colorScheme.tertiary;
    if (blueprint.id.contains('kamp')) return colorScheme.secondary;
    return colorScheme.primary;
  }

  Color _accentContainerColor(ColorScheme colorScheme) {
    if (blueprint.isProOnly) return colorScheme.tertiaryContainer;
    if (blueprint.id.contains('kamp')) return colorScheme.secondaryContainer;
    return colorScheme.primaryContainer;
  }

  Color _onAccentContainerColor(ColorScheme colorScheme) {
    if (blueprint.isProOnly) return colorScheme.onTertiaryContainer;
    if (blueprint.id.contains('kamp')) return colorScheme.onSecondaryContainer;
    return colorScheme.onPrimaryContainer;
  }

  Future<void> _handleDownload(BuildContext context, WidgetRef ref) async {
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

    try {
      final questionRepo = ref.read(questionRepositoryProvider);
      final questions = packageId.contains('gk_prova')
          ? await questionRepo.generateGeneralCultureMockExam(
              examNumber: blueprint.mockNumber ?? 1,
            )
          : (await questionRepo.generateMockExamFromBlueprint(
              blueprint,
              selection: selection,
            )).questions;
      await ref
          .read(downloadedPackagesProvider.notifier)
          .downloadPackage(
            packageId: packageId,
            questions: questions,
            isPro: isPro,
          );
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title çevrimdışı çözüm için indirildi.')),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('İndirme hatası: $e')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accentColor = _accentColor(colorScheme);
    final accentContainerColor = _accentContainerColor(colorScheme);
    final onAccentContainerColor = _onAccentContainerColor(colorScheme);
    final icon = _resolveIcon();

    final isUserPro = ref.watch(userPreferencesProvider).isPro;
    final downloadedPackages = ref.watch(downloadedPackagesProvider);
    final isDownloaded = downloadedPackages.contains(packageId);

    final solvedExam = ref
        .watch(studyStatsProvider)
        .findLatestSessionForTitle(title);

    return TactileCard(
      onTap: () => launchBlueprintExamWithGuard(
        context: context,
        ref: ref,
        blueprint: blueprint,
        selection: selection,
      ),
      backgroundColor: solvedExam != null
          ? colorScheme.secondaryContainer.withAlpha(45)
          : colorScheme.surface,
      borderColor: solvedExam != null
          ? colorScheme.secondary.withAlpha(150)
          : accentColor.withAlpha(80),
      lipColor: solvedExam != null
          ? colorScheme.secondary.withAlpha(160)
          : accentColor.withAlpha(90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accentContainerColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accentColor.withAlpha(80)),
                ),
                child: PhosphorIcon(icon, color: accentColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (blueprint.isComingSoon)
                const KadroBadge(
                  label: 'Yakında',
                  tone: KadroBadgeTone.tertiary,
                  icon: PhosphorIconsRegular.lockSimple,
                )
              else if (isDownloaded)
                const Tooltip(
                  message: 'Cihazda Hazır',
                  child: KadroBadge(
                    label: 'Cihazda',
                    tone: KadroBadgeTone.secondary,
                  ),
                )
              else
                Tooltip(
                  message: 'Çevrimdışı İndir',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => _handleDownload(context, ref),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: PhosphorIcon(
                        PhosphorIconsRegular.downloadSimple,
                        size: 18,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              KadroBadge(
                label: badgeText,
                backgroundColor: accentContainerColor,
                foregroundColor: onAccentContainerColor,
              ),
              if (isProOnly)
                KadroBadge(
                  label: isUserPro ? 'Kadro PRO Açık' : 'Kadro PRO',
                  icon: isUserPro
                      ? PhosphorIconsFill.checkCircle
                      : PhosphorIconsFill.crown,
                  backgroundColor: isUserPro
                      ? colorScheme.secondaryContainer
                      : colorScheme.tertiaryContainer,
                  foregroundColor: isUserPro
                      ? colorScheme.onSecondaryContainer
                      : colorScheme.onTertiaryContainer,
                ),
              if (solvedExam != null)
                KadroBadge(
                  label:
                      'Çözüldü (${solvedExam.netScore.toStringAsFixed(1)} Net)',
                  tone: KadroBadgeTone.secondary,
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  isDownloaded
                      ? 'Çevrimdışı Kullanıma Hazır'
                      : 'Kadro PRO Çevrimdışı Desteği',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isDownloaded
                        ? colorScheme.secondary
                        : colorScheme.outline,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    blueprint.isComingSoon
                        ? 'Yakında'
                        : (isProOnly && !isUserPro
                              ? 'PRO ile Başlat'
                              : 'Denemeyi Başlat'),
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: blueprint.isComingSoon
                          ? colorScheme.outline
                          : accentColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  PhosphorIcon(
                    blueprint.isComingSoon
                        ? PhosphorIconsRegular.lockSimple
                        : (isProOnly && !isUserPro
                              ? PhosphorIconsFill.crown
                              : PhosphorIconsBold.arrowRight),
                    size: 15,
                    color: blueprint.isComingSoon
                        ? colorScheme.outline
                        : accentColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Denemeler ekranından doğrudan KPSS Puan Hesaplama Robotu'na geçiş kartı.
class _ScoreCalculatorShortcutCard extends StatelessWidget {
  const _ScoreCalculatorShortcutCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(builder: (_) => const KpssScoreCalculatorScreen()),
        );
      },
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: PhosphorIcon(
              PhosphorIconsFill.calculator,
              size: 20,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KPSS Puan Hesaplama Robotu',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Son 3 KPSS (2026 · 2025 · 2024) katsayılarıyla netlerini puana çevir',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            PhosphorIconsRegular.caretRight,
            size: 16,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

/// Aktif müfredattaki hazır dersler için set seçicili (Deneme #1–#3)
/// branş denemeleri sunan bölüm (`TASK-154`).
class _BranchExamsSection extends ConsumerStatefulWidget {
  final ExamSelection selection;
  final ExamCurriculum curriculum;
  final int gridColumns;

  const _BranchExamsSection({
    required this.selection,
    required this.curriculum,
    required this.gridColumns,
  });

  @override
  ConsumerState<_BranchExamsSection> createState() =>
      _BranchExamsSectionState();
}

class _BranchExamsSectionState extends ConsumerState<_BranchExamsSection> {
  int _selectedSetNumber = 1;

  @override
  Widget build(BuildContext context) {
    final blueprints = BranchMockExamGenerator.blueprintsForCurriculum(
      selection: widget.selection,
      curriculum: widget.curriculum,
      branchMockNumber: _selectedSetNumber,
    );
    if (blueprints.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle('Branş Denemeleri'),
        KadroFilterChips<int>(
          wrap: true,
          selectedValue: _selectedSetNumber,
          options: const [
            KadroFilterOption(
              key: ValueKey('branch_set_chip_1'),
              value: 1,
              label: 'Branş #1 · Ücretsiz',
            ),
            KadroFilterOption(
              key: ValueKey('branch_set_chip_2'),
              value: 2,
              label: 'Branş #2 · PRO',
            ),
            KadroFilterOption(
              key: ValueKey('branch_set_chip_3'),
              value: 3,
              label: 'Branş #3 · PRO',
            ),
          ],
          onSelected: (setNum) => setState(() => _selectedSetNumber = setNum),
        ),
        AppSpacing.gapMd,
        ResponsiveGrid(
          columns: widget.gridColumns,
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final blueprint in blueprints)
              _BranchExamCard(
                blueprint: blueprint,
                selection: widget.selection,
              ),
          ],
        ),
      ],
    );
  }
}

class _BranchExamCard extends ConsumerWidget {
  final MockExamBlueprint blueprint;
  final ExamSelection selection;

  const _BranchExamCard({required this.blueprint, required this.selection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final lessonName = blueprint.sections.isNotEmpty
        ? blueprint.sections.first.lesson
        : blueprint.title;
    final mood = TugrulMoodExtension.fromLesson(lessonName);
    final accent = mood.accentColor(colorScheme);
    final isUserPro = ref.watch(userPreferencesProvider).isPro;
    final solvedSession = ref
        .watch(studyStatsProvider)
        .findLatestSessionForTitle(blueprint.title);
    final totalMinutes =
        blueprint.standardDurationMinutes +
        blueprint.extraMinutesFor(selection);

    return TactileCard(
      key: ValueKey('branch_exam_card_${blueprint.id}'),
      onTap: () => launchBlueprintExamWithGuard(
        context: context,
        ref: ref,
        blueprint: blueprint,
        selection: selection,
        isBranchMock: true,
      ),
      backgroundColor: solvedSession != null
          ? colorScheme.secondaryContainer.withAlpha(45)
          : colorScheme.surface,
      borderColor: solvedSession != null
          ? colorScheme.secondary.withAlpha(150)
          : accent.withAlpha(90),
      lipColor: solvedSession != null
          ? colorScheme.secondary.withAlpha(160)
          : accent.withAlpha(105),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: accent.withAlpha(24),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: accent.withAlpha(80)),
                ),
                child: PhosphorIcon(
                  blueprint.isProOnly
                      ? PhosphorIconsFill.crown
                      : PhosphorIconsFill.exam,
                  color: accent,
                  size: 19,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blueprint.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$totalMinutes Dakika · ${blueprint.totalQuestionCount} Soru',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              KadroBadge(
                label: blueprint.badgeLabel,
                tone: blueprint.isProOnly
                    ? KadroBadgeTone.tertiary
                    : KadroBadgeTone.primary,
              ),
              if (solvedSession != null)
                KadroBadge(
                  label:
                      'Çözüldü (${solvedSession.netScore.toStringAsFixed(1)} Net)',
                  tone: KadroBadgeTone.secondary,
                  icon: PhosphorIconsFill.checkCircle,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  '4 yanlış 1 doğru · Konu kırılımlı karne',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    blueprint.isProOnly && !isUserPro
                        ? 'PRO ile Çöz'
                        : 'Branşı Başlat',
                    style: textTheme.labelLarge?.copyWith(color: accent),
                  ),
                  const SizedBox(width: 4),
                  PhosphorIcon(
                    blueprint.isProOnly && !isUserPro
                        ? PhosphorIconsFill.crown
                        : PhosphorIconsBold.arrowRight,
                    size: 15,
                    color: accent,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
