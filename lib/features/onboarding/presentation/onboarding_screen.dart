import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/exam_target_picker_view.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// 3 adımlı kişiselleştirilmiş KPSS / MEB-AGS sınav, süre ve çalışma rotası kurulum ekranı.
///
/// [isMandatory] true olduğunda kullanıcı ilk girişte kurulumu tamamlamadan
/// uygulamaya devam edemez (geri/atla kapalıdır); Profil ekranından açıldığında
/// ise serbest düzenleme yapılabilir.
class OnboardingScreen extends ConsumerStatefulWidget {
  final bool isMandatory;

  const OnboardingScreen({super.key, this.isMandatory = false});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _step = 0;
  late ExamSelection _selectedExam;
  late StudyProgramPace _selectedPace;
  late int _selectedScore;
  late String _selectedLesson;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(userPreferencesProvider);
    _selectedExam = prefs.examSelection;
    _selectedPace = prefs.studyProgramPace;
    _selectedScore = prefs.targetKpssScore;
    _selectedLesson = prefs.focusLesson;
  }

  void _onExamSelectionChanged(ExamSelection next) {
    final nextCurriculum = CurriculumRegistry.resolve(next);
    final validLessons = nextCurriculum.primaryLessonNames;
    setState(() {
      _selectedExam = next;
      if (validLessons.isNotEmpty && !validLessons.contains(_selectedLesson)) {
        _selectedLesson = validLessons.first;
      }
    });
  }

  void _completeOnboarding() {
    final dailyQuestions = _selectedPace.dailyGoalQuestions;
    final legacyTarget = _selectedExam.toLegacyTarget();

    ref
        .read(userPreferencesProvider.notifier)
        .saveOnboardingGoals(
          targetKpssScore: _selectedScore,
          focusLesson: _selectedLesson,
          dailyGoalQuestions: dailyQuestions,
          examSelection: _selectedExam,
          studyProgramPace: _selectedPace,
        );

    ref.read(studyStatsProvider.notifier).updateDailyGoal(dailyQuestions);

    ref
        .read(studyPlannerProvider.notifier)
        .setupAutoProgram(
          examTarget: legacyTarget,
          pace: _selectedPace,
          focusLesson: _selectedLesson,
          curriculum: CurriculumRegistry.resolve(_selectedExam),
          examScope: _selectedExam.scopeKey,
          cycleDay: 1,
        );

    if (mounted && !widget.isMandatory && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: !widget.isMandatory,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: !widget.isMandatory,
          title: Text(
            widget.isMandatory ? 'Çalışma Programını Kur' : 'Çalışma Hedefi',
          ),
        ),
        body: SafeArea(
          child: ResponsiveContentWrapper(
            maxWidth: 820,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    ResponsiveBreakpoints.horizontalPadding(context),
                    12,
                    ResponsiveBreakpoints.horizontalPadding(context),
                    8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adım ${_step + 1} / 3',
                            style: textTheme.labelLarge?.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          Text(
                            _step == 0
                                ? 'Sınav Seçimi'
                                : (_step == 1
                                      ? 'Günlük Süre'
                                      : 'Hedef & Odak Ders'),
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          value: (_step + 1) / 3,
                          minHeight: 8,
                          backgroundColor: colorScheme.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Scrollbar(
                    child: ListView(
                      padding: AppSpacing.pagePadding(context),
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 16),
                        _buildStepContent(),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveBreakpoints.horizontalPadding(
                      context,
                    ),
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: colorScheme.outlineVariant,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (_step > 0) ...[
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () => setState(() => _step--),
                            child: const Text('Geri'),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        flex: 2,
                        child: _step < 2
                            ? FilledButton(
                                onPressed: () => setState(() => _step++),
                                child: const Text('Devam Et'),
                              )
                            : FilledButton.icon(
                                onPressed: _completeOnboarding,
                                icon: const PhosphorIcon(
                                  PhosphorIconsFill.rocketLaunch,
                                  size: 18,
                                ),
                                label: Text(
                                  widget.isMandatory
                                      ? 'Programımı Kur ve Başla'
                                      : 'Rotamı Oluştur',
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final mood = switch (_step) {
      0 => TugrulMood.exam,
      1 => TugrulMood.practice,
      _ => TugrulMood.coach,
    };
    final title = switch (_step) {
      0 => 'Hangi KPSS Sınavına Gireceksin?',
      1 => 'Günde Kaç Dakika Ayırabilirsin?',
      _ => 'Hedef Puan & Öncelikli Dersin',
    };
    final subtitle = switch (_step) {
      0 => 'Sınavına kalan güne göre tüm test, bilgi kartı ve harita içeriğimizi planlayacağız.',
      1 => '5 sabit süreden birini seç; sınav yakınlığına göre yetiştirme durumunu anlık kontrol edelim.',
      _ => 'Günlük görev listeni oluştururken öncelik vereceğimiz dersi ve puan hedefini seç.',
    };

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TugrulAvatar(
          mood: mood,
          size: 62,
          ringColor: mood.accentColor(colorScheme),
          onTap: () => TugrulTipsSheet.show(context, mood: mood),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _focusLessonSubtitle(LessonSpec spec) {
    switch (spec.name) {
      case 'Tarih':
        return 'İlk Türk Devletleri, Osmanlı ve İnkılap Tarihi';
      case 'Coğrafya':
        return 'Fiziki Özellikler, İklim, Nüfus ve Ekonomik Coğrafya';
      case 'Vatandaşlık':
        return 'Temel Hukuk, Anayasa, Yasama, Yürütme ve İdare';
      case 'Güncel Bilgiler':
        return 'Uluslararası Kuruluşlar, Bilim, Kültür ve Sanat';
      default:
        return '${spec.topics.length} ana konu · ${spec.questionCount} soruluk bölüm';
    }
  }

  Widget _buildStepContent() {
    final selectedCurriculum = CurriculumRegistry.resolve(_selectedExam);

    switch (_step) {
      case 0:
        return ExamTargetPickerView(
          value: _selectedExam,
          onChanged: _onExamSelectionChanged,
          showQuickPresets: true,
        );

      case 1:
        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;
        final advisory = _selectedPace.evaluateScheduleForSelection(
          _selectedExam,
          curriculum: selectedCurriculum,
        );
        final advisoryColor = advisory.canFinishInTime
            ? colorScheme.secondary
            : colorScheme.tertiary;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TactileCard(
              backgroundColor: Color.alphaBlend(
                advisoryColor.withAlpha(28),
                colorScheme.surface,
              ),
              borderColor: advisoryColor,
              lipColor: advisoryColor,
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PhosphorIcon(
                        advisory.canFinishInTime
                            ? PhosphorIconsFill.checkCircle
                            : PhosphorIconsFill.warningCircle,
                        size: 18,
                        color: advisoryColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          advisory.canFinishInTime
                              ? 'Tuğrul Planı Onayladı'
                              : 'Sınav Yakınlık Tavsiyesi',
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    advisory.message,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.4,
                    ),
                  ),
                  if (!advisory.canFinishInTime &&
                      advisory.recommendedPace != _selectedPace) ...[
                    const SizedBox(height: 10),
                    FilledButton.tonal(
                      onPressed: () => setState(
                        () => _selectedPace = advisory.recommendedPace,
                      ),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 38),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: Text(
                        '${advisory.recommendedPace.estimatedMinutesPerDay} Dk Önerisine Geç',
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...StudyProgramPace.values.map((pace) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _SelectableOptionCard(
                  title: pace.label,
                  subtitle: pace.packageSummary,
                  badgeText: '~${pace.estimatedCompletionDays} Günde Bitirir',
                  icon: _iconForPace(pace),
                  isSelected: _selectedPace == pace,
                  onTap: () => setState(() => _selectedPace = pace),
                ),
              );
            }),
          ],
        );

      case 2:
      default:
        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hedef KPSS Puanın',
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [80, 85, 90].map((score) {
                final isSelected = _selectedScore == score;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: score == 90 ? 0 : 8),
                    child: TactileCard(
                      onTap: () => setState(() => _selectedScore = score),
                      backgroundColor: isSelected
                          ? Color.alphaBlend(
                              colorScheme.primaryContainer.withAlpha(140),
                              colorScheme.surface,
                            )
                          : colorScheme.surface,
                      borderColor: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
                      lipColor: isSelected ? colorScheme.primary : null,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$score+ Puan',
                            style: textTheme.titleSmall?.copyWith(
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            score == 80
                                ? 'Memurluk'
                                : (score == 85 ? 'Merkez Kadro' : 'Derece'),
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            Text(
              'Öncelikli Odak Dersin',
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            for (final spec
                in (selectedCurriculum.activeLessons.isNotEmpty
                    ? selectedCurriculum.activeLessons
                    : selectedCurriculum.upcomingLessons)) ...[
              Builder(
                builder: (context) {
                  final denom = selectedCurriculum.activeQuestionDenominator;
                  final weightPct = denom > 0
                      ? ((spec.questionCount / denom) * 100).round()
                      : 0;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _SelectableOptionCard(
                      title:
                          '${spec.name} · ${spec.questionCount} Soru (%$weightPct Ağırlık)',
                      subtitle: _focusLessonSubtitle(spec),
                      icon: spec.icon,
                      isSelected: _selectedLesson == spec.name,
                      onTap: () => setState(() => _selectedLesson = spec.name),
                    ),
                  );
                },
              ),
            ],
          ],
        );
    }
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
}

class _SelectableOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? badgeText;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableOptionCard({
    required this.title,
    required this.subtitle,
    this.badgeText,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: onTap,
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(
              icon,
              size: 19,
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
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleSmall?.copyWith(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (badgeText != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colorScheme.primary
                              : colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          badgeText!,
                          style: textTheme.labelSmall?.copyWith(
                            color: isSelected
                                ? colorScheme.onPrimary
                                : colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
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
    );
  }
}
