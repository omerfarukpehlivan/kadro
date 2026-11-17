import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Oturum açmamış Web ziyaretçileri ve adaylar için herkese açık KPSS & MEB-AGS
/// müfredat ve soru dağılımı önizleme ekranı (`TASK-151`).
///
/// Angular/Web Karşılığı: `/curriculum-preview` public SEO rotasına bağlı,
/// kayıt duvarı olmadan ders/konu kapsamını gösteren vitrin bileşeni.
class CurriculumPreviewScreen extends StatefulWidget {
  final String? initialScopeParam;
  final bool isGuestMode;

  const CurriculumPreviewScreen({
    super.key,
    this.initialScopeParam,
    this.isGuestMode = true,
  });

  @override
  State<CurriculumPreviewScreen> createState() =>
      _CurriculumPreviewScreenState();
}

class _CurriculumPreviewScreenState extends State<CurriculumPreviewScreen> {
  static final List<_PreviewExamScopeOption> _scopeOptions = [
    const _PreviewExamScopeOption(
      key: 'lisans_gk',
      label: 'KPSS Lisans (GK)',
      examQuery: 'p3',
      selection: ExamSelection.bGrubuLisans(),
    ),
    const _PreviewExamScopeOption(
      key: 'onlisans',
      label: 'Ön Lisans (P93)',
      examQuery: 'p93',
      selection: ExamSelection.bGrubu(educationLevel: EducationLevel.onlisans),
    ),
    const _PreviewExamScopeOption(
      key: 'ortaogretim',
      label: 'Ortaöğretim (P94)',
      examQuery: 'p94',
      selection: ExamSelection.bGrubu(
        educationLevel: EducationLevel.ortaogretim,
      ),
    ),
    const _PreviewExamScopeOption(
      key: 'ekpss',
      label: 'E-KPSS',
      examQuery: 'ekpss',
      selection: ExamSelection.ekpss(),
    ),
    const _PreviewExamScopeOption(
      key: 'dhbt',
      label: 'KPSS DHBT',
      examQuery: 'dhbt',
      selection: ExamSelection.dhbt(),
    ),
    const _PreviewExamScopeOption(
      key: 'meb_ags',
      label: 'MEB-AGS & ÖABT',
      examQuery: 'meb_ags',
      selection: ExamSelection.mebAgs(),
    ),
    const _PreviewExamScopeOption(
      key: 'a_grubu',
      label: 'KPSS A Grubu',
      examQuery: 'a_grubu',
      selection: ExamSelection.aGrubu(),
    ),
  ];

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _resolveInitialIndex(widget.initialScopeParam);
  }

  int _resolveInitialIndex(String? raw) {
    if (raw == null || raw.trim().isEmpty) return 0;
    final normalized = raw.trim().toLowerCase();
    for (var i = 0; i < _scopeOptions.length; i++) {
      final option = _scopeOptions[i];
      if (normalized.contains(option.key) ||
          normalized.contains(option.examQuery)) {
        return i;
      }
    }
    if (normalized.contains('ags')) return 5;
    if (normalized.contains('lisans')) return 0;
    return 0;
  }

  void _openAuth(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.go('/');
      return;
    }
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _openCalculator(BuildContext context, _PreviewExamScopeOption option) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.push('/calculator?exam=${option.examQuery}');
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => KpssScoreCalculatorScreen(
          initialExamParam: option.examQuery,
          isGuestMode: widget.isGuestMode,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentOption = _scopeOptions[_selectedIndex];
    final curriculum = CurriculumRegistry.resolve(currentOption.selection);
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final gridColumns = width >= 1200 ? 3 : (width >= 720 ? 2 : 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KPSS & MEB-AGS Müfredat Rehberi'),
        actions: [
          if (widget.isGuestMode)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: FilledButton.tonalIcon(
                onPressed: () => _openAuth(context),
                icon: const PhosphorIcon(PhosphorIconsRegular.signIn, size: 16),
                label: const Text('Giriş Yap'),
              ),
            ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: isDesktop ? 1240 : 720,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: ListView(
            padding: AppSpacing.pagePadding(context),
            children: [
              if (widget.isGuestMode) ...[
                _GuestCtaBanner(
                  title: 'Ücretsiz Müfredat ve Konu Dağılımı Önizlemesi',
                  subtitle: 'Soruları çözmek, yanlış defteri tutmak ve net gelişimini kaydetmek için giriş yap.',
                  actionLabel: 'Hemen Başla',
                  onPressed: () => _openAuth(context),
                ),
                AppSpacing.gapMd,
              ],
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < _scopeOptions.length; i++)
                    ChoiceChip(
                      label: Text(_scopeOptions[i].label),
                      selected: i == _selectedIndex,
                      onSelected: (_) => setState(() => _selectedIndex = i),
                    ),
                ],
              ),
              AppSpacing.gapMd,
              TactileCard(
                backgroundColor: colorScheme.primaryContainer.withAlpha(90),
                borderColor: colorScheme.primary.withAlpha(110),
                lipColor: colorScheme.primary.withAlpha(130),
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const TugrulAvatar(
                      mood: TugrulMood.coach,
                      size: 62,
                      hasShadow: false,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            curriculum.title,
                            style: textTheme.headlineSmall?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${curriculum.summaryLabel} · ${curriculum.totalQuestions} Soru · ${curriculum.standardDurationMinutes} Dakika',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () => _openCalculator(context, currentOption),
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.calculator,
                        size: 16,
                      ),
                      label: const Text('Puan Hesapla'),
                    ),
                  ],
                ),
              ),
              if (curriculum.activeLessons.isNotEmpty) ...[
                AppSpacing.gapMd,
                SectionTitle(curriculum.activeSectionTitle),
                ResponsiveGrid(
                  columns: gridColumns,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final lesson in curriculum.activeLessons)
                      _CurriculumLessonPreviewCard(lesson: lesson),
                  ],
                ),
              ],
              if (curriculum.upcomingLessons.isNotEmpty) ...[
                AppSpacing.gapLg,
                SectionTitle(curriculum.upcomingSectionTitle),
                ResponsiveGrid(
                  columns: gridColumns,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final lesson in curriculum.upcomingLessons)
                      _CurriculumLessonPreviewCard(
                        lesson: lesson,
                        isUpcoming: true,
                      ),
                  ],
                ),
              ],
              AppSpacing.gapLg,
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewExamScopeOption {
  final String key;
  final String label;
  final String examQuery;
  final ExamSelection selection;

  const _PreviewExamScopeOption({
    required this.key,
    required this.label,
    required this.examQuery,
    required this.selection,
  });
}

class _GuestCtaBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onPressed;

  const _GuestCtaBanner({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surfaceContainerLow,
      borderColor: colorScheme.secondary.withAlpha(110),
      lipColor: colorScheme.secondary.withAlpha(130),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsFill.sparkle,
            size: 20,
            color: colorScheme.secondary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          FilledButton(onPressed: onPressed, child: Text(actionLabel)),
        ],
      ),
    );
  }
}

class _CurriculumLessonPreviewCard extends StatelessWidget {
  final LessonSpec lesson;
  final bool isUpcoming;

  const _CurriculumLessonPreviewCard({
    required this.lesson,
    this.isUpcoming = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: isUpcoming
          ? colorScheme.surfaceContainerLowest
          : colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withAlpha(120),
                  borderRadius: BorderRadius.circular(11),
                ),
                alignment: Alignment.center,
                child: PhosphorIcon(
                  lesson.icon,
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
                      lesson.name,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${lesson.questionCount} soru · ${lesson.topics.length} konu',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? colorScheme.tertiaryContainer
                      : colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isUpcoming ? 'Hazırlanıyor' : 'Aktif',
                  style: textTheme.labelSmall?.copyWith(
                    color: isUpcoming
                        ? colorScheme.onTertiaryContainer
                        : colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final topic in lesson.topics.take(5))
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Text(
                    topic,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
