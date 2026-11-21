import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/widgets/weekly_planner_calendar_grid.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/exam_target_picker_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kullanıcının hedef KPSS / MEB-AGS sınavını ve günlük çalışma süresi varyasyonunu (`15–90 dk`)
/// seçip sınav yakınlığına göre akıllı yetiştirme önerisi aldığı alt sayfa.
class AutoStudyProgramModal extends ConsumerStatefulWidget {
  const AutoStudyProgramModal({super.key});

  static Future<void> show(BuildContext context) {
    return AdaptiveOverlay.showModal<void>(
      context: context,
      dialogMaxWidth: 680,
      transparentSheetBackground: true,
      builder: (_) => const AutoStudyProgramModal(),
    );
  }

  @override
  ConsumerState<AutoStudyProgramModal> createState() =>
      _AutoStudyProgramModalState();
}

class _AutoStudyProgramModalState extends ConsumerState<AutoStudyProgramModal> {
  late StudyProgramPace _selectedPace;
  late ExamSelection _selectedSelection;
  late List<int> _weeklyStudyDays;
  late bool _isSprintMode;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(userPreferencesProvider);
    final planner = ref.read(studyPlannerProvider);
    _selectedPace = prefs.studyProgramPace;
    _selectedSelection = prefs.examSelection;
    _weeklyStudyDays = List<int>.from(planner.weeklyStudyDays);
    _isSprintMode =
        planner.isSprintModeActive ||
        AutoStudyProgramGenerator.isWithinSprintWindow(_selectedSelection);
  }

  void _toggleWeekday(int weekday) {
    setState(() {
      if (_weeklyStudyDays.contains(weekday)) {
        if (_weeklyStudyDays.length > 1) {
          _weeklyStudyDays.remove(weekday);
        }
      } else {
        _weeklyStudyDays.add(weekday);
        _weeklyStudyDays.sort();
      }
    });
  }

  void _applyProgram(UserPreferencesState prefs) {
    final oldPace = prefs.studyProgramPace;
    final hasActive = prefs.hasActiveStudyProgram;
    final stats = ref.read(studyStatsProvider);
    final selectedTarget = _selectedSelection.toLegacyTarget();
    final selectedCurriculum = CurriculumRegistry.resolve(_selectedSelection);
    final effectiveFocusLesson =
        selectedCurriculum.primaryLessonNames.contains(prefs.focusLesson)
        ? prefs.focusLesson
        : (selectedCurriculum.primaryLessonNames.isNotEmpty
              ? selectedCurriculum.primaryLessonNames.first
              : prefs.focusLesson);

    bool isTestSolved(String lesson, String topic, int testNumber) {
      return stats.findLatestSessionForTest(
            lesson: lesson,
            topic: topic,
            testNumber: testNumber,
          ) !=
          null;
    }

    ref
        .read(userPreferencesProvider.notifier)
        .setExamSelection(_selectedSelection);
    ref
        .read(userPreferencesProvider.notifier)
        .setStudyProgramPace(_selectedPace);
    ref
        .read(studyStatsProvider.notifier)
        .updateDailyGoal(_selectedPace.dailyGoalQuestions);

    if (hasActive) {
      // Zaten aktif programı olan kullanıcı süresini güncellediğinde
      // ilerlemesi sıfırlanmaz, çözülmüş testleri koruyarak yeni tempoya uyarlanır.
      ref
          .read(studyPlannerProvider.notifier)
          .adaptStudyProgramPace(
            examTarget: selectedTarget,
            oldPace: oldPace,
            newPace: _selectedPace,
            focusLesson: effectiveFocusLesson,
            curriculum: selectedCurriculum,
            examScope: _selectedSelection.scopeKey,
            isSprintMode: _isSprintMode,
            weeklyStudyDays: _weeklyStudyDays,
            isTestSolved: isTestSolved,
          );
    } else {
      ref
          .read(studyPlannerProvider.notifier)
          .setupAutoProgram(
            examTarget: selectedTarget,
            pace: _selectedPace,
            focusLesson: effectiveFocusLesson,
            curriculum: selectedCurriculum,
            examScope: _selectedSelection.scopeKey,
            cycleDay: 1,
            isSprintMode: _isSprintMode,
            weeklyStudyDays: _weeklyStudyDays,
            isTestSolved: isTestSolved,
          );
    }

    Navigator.of(context).pop();

    final isPaceChanged = hasActive && oldPace != _selectedPace;
    final snackText = isPaceChanged
        ? '${_selectedPace.label} temposuna uyarlandı. İlerlemen korundu!'
        : '${_selectedSelection.shortTitle} için ${_selectedPace.label} programın kuruldu.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            PhosphorIcon(
              PhosphorIconsFill.checkCircle,
              color: Theme.of(context).colorScheme.onInverseSurface,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(snackText)),
          ],
        ),
      ),
    );
  }

  IconData _iconForPace(StudyProgramPace pace) {
    switch (pace) {
      case StudyProgramPace.dk15:
        return PhosphorIconsRegular.timer;
      case StudyProgramPace.dk30:
        return PhosphorIconsRegular.plant;
      case StudyProgramPace.dk45:
        return PhosphorIconsRegular.compass;
      case StudyProgramPace.dk60:
        return PhosphorIconsRegular.lightning;
      case StudyProgramPace.dk90:
        return PhosphorIconsRegular.fire;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final prefs = ref.watch(userPreferencesProvider);
    final selectedCurriculum = CurriculumRegistry.resolve(_selectedSelection);
    final remaining = _selectedSelection.detailedRemaining();
    final advisory = _selectedPace.evaluateScheduleForSelection(
      _selectedSelection,
      curriculum: selectedCurriculum,
    );
    final advisoryColor = advisory.canFinishInTime
        ? colorScheme.primary
        : colorScheme.tertiary;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!ResponsiveBreakpoints.usesDialogOverlay(context)) ...[
            const KadroSheetHandle(),
            const SizedBox(height: 14),
          ],

          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.slidersHorizontal,
                size: 20,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otomatik Çalışma Programı',
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sınavına ve günlük ayırdığın süreye göre gerçek içerik planı.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const PhosphorIcon(PhosphorIconsBold.x, size: 18),
                tooltip: 'Kapat',
              ),
            ],
          ),
          const SizedBox(height: 12),

          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ExamTargetPickerView(
                    value: _selectedSelection,
                    onChanged: (next) =>
                        setState(() => _selectedSelection = next),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.outlineVariant,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.calendarCheck,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedSelection.displayTitle,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${remaining.formattedRemaining} (${remaining.totalDays} Gün Kaldı)',
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...StudyProgramPace.values.map((pace) {
                    final isSelected = _selectedPace == pace;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TactileCard(
                        onTap: () => setState(() => _selectedPace = pace),
                        backgroundColor: isSelected
                            ? Color.alphaBlend(
                                colorScheme.primaryContainer.withAlpha(115),
                                colorScheme.surface,
                              )
                            : colorScheme.surface,
                        borderColor: isSelected
                            ? colorScheme.primary
                            : colorScheme.outlineVariant,
                        lipColor: isSelected ? colorScheme.primary : null,
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: PhosphorIcon(
                                _iconForPace(pace),
                                size: 20,
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 4,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        pace.label,
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: isSelected
                                              ? colorScheme.primary
                                              : colorScheme.onSurface,
                                        ),
                                      ),
                                      KadroBadge(
                                        label: pace.badgeText,
                                        backgroundColor: isSelected
                                            ? colorScheme.primary
                                            : colorScheme.secondaryContainer,
                                        foregroundColor: isSelected
                                            ? colorScheme.onPrimary
                                            : colorScheme.onSecondaryContainer,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${pace.packageSummary} · ~${pace.estimatedCompletionDays} gün',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    pace.description,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            PhosphorIcon(
                              isSelected
                                  ? PhosphorIconsFill.checkCircle
                                  : PhosphorIconsRegular.circle,
                              size: 20,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.outlineVariant,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 6),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.alphaBlend(
                        advisoryColor.withAlpha(24),
                        colorScheme.surfaceContainerLow,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: advisoryColor.withAlpha(120)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            PhosphorIcon(
                              advisory.canFinishInTime
                                  ? PhosphorIconsRegular.chartLineUp
                                  : PhosphorIconsFill.warningCircle,
                              size: 16,
                              color: advisoryColor,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                advisory.canFinishInTime
                                    ? 'Sınava Yayma & Tur Projeksiyonu'
                                    : 'Sınav Yakınlık Tavsiyesi',
                                style: textTheme.labelMedium?.copyWith(
                                  color: advisoryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          advisory.message,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface,
                            height: 1.38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  if (AutoStudyProgramGenerator.isWithinSprintWindow(
                    _selectedSelection,
                  )) ...[
                    SwitchListTile.adaptive(
                      key: const ValueKey('modal_sprint_mode_switch'),
                      value: _isSprintMode,
                      onChanged: (v) => setState(() => _isSprintMode = v),
                      title: const Text('Son 30 Gün Sprint Modu'),
                      subtitle: const Text(
                        'Deneme sınavı ve yanlış tekrar sıklığını artırır.',
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    const SizedBox(height: 8),
                  ],

                  WeeklyPlannerCalendarGrid(
                    title: 'Haftalık Çalışma Takvimi Önizlemesi',
                    days: AutoStudyProgramGenerator.buildWeeklyPreview(
                      selection: _selectedSelection,
                      pace: _selectedPace,
                      weeklyStudyDays: _weeklyStudyDays,
                      focusLesson: prefs.focusLesson,
                      curriculum: selectedCurriculum,
                      isSprintMode: _isSprintMode,
                    ),
                    onToggleWeekday: _toggleWeekday,
                  ),
                  const SizedBox(height: 10),

                  const Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _ActivityChip(
                        icon: PhosphorIconsRegular.pencilSimple,
                        label: 'Konu Testi',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsRegular.cards,
                        label: 'Flashcards',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsRegular.warningCircle,
                        label: 'Yanlış Defteri',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsRegular.mapTrifold,
                        label: 'Harita Pratiği',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsRegular.puzzlePiece,
                        label: 'Kavram Oyunu',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsRegular.trophy,
                        label: 'Mini Deneme',
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),

          FilledButton.icon(
            onPressed: () => _applyProgram(prefs),
            icon: const PhosphorIcon(PhosphorIconsBold.play, size: 16),
            label: Text('${_selectedPace.label} Programını Başlat'),
          ),
        ],
      ),
    );
  }
}

class _ActivityChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActivityChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return KadroBadge(
      label: label,
      icon: icon,
      iconColor: colorScheme.primary,
      backgroundColor: colorScheme.surfaceContainerLow,
      foregroundColor: colorScheme.onSurfaceVariant,
      borderColor: colorScheme.outlineVariant,
    );
  }
}
