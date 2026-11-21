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
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kişiselleştirilmiş KPSS / MEB-AGS sınav, süre ve çalışma rotası kurulum ekranı.
///
/// İlk açılışta (`isMandatory == true`) kullanıcıyı yormamak ve terk oranını
/// azaltmak için tek adımlı hızlı kurulum ("Hangi Sınav?" + belirgin
/// **Şimdilik Atla** butonu) sunar; dileyen kullanıcı tek tıkla 3 adımlı
/// detaylı özelleştirmeye geçebilir. Profil sekmesinden ("Hedefi Düzenle")
/// açıldığında ise doğrudan 3 adımlı tam kurulum stüdyosu açılır.
class OnboardingScreen extends ConsumerStatefulWidget {
  final bool isMandatory;

  const OnboardingScreen({super.key, this.isMandatory = false});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _step = 0;
  bool _useDetailedThreeStep = false;
  late ExamSelection _selectedExam;
  late StudyProgramPace _selectedPace;
  late int _selectedScore;
  late String _selectedLesson;

  bool get _isExpressMode => widget.isMandatory && !_useDetailedThreeStep;

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

  TugrulMood get _currentMood => switch (_step) {
    0 => TugrulMood.exam,
    1 => TugrulMood.practice,
    _ => TugrulMood.coach,
  };

  String get _stepShortLabel => switch (_step) {
    0 => 'Sınav Seçimi',
    1 => 'Günlük Süre',
    _ => 'Hedef & Odak Ders',
  };

  String get _stepTitle => switch (_step) {
    0 => 'Hangi KPSS Sınavına Gireceksin?',
    1 => 'Günde Kaç Dakika Ayırabilirsin?',
    _ => 'Hedef Puan & Öncelikli Dersin',
  };

  String get _stepSubtitle => _isExpressMode
      ? 'Sınavını seçip hemen başlayabilirsin. Çalışma süreni ve öncelikli dersini istediğin zaman Plan veya Profil sekmesinden değiştirebilirsin.'
      : switch (_step) {
          0 => 'Sınavına kalan güne göre tüm test, bilgi kartı ve çalışma planını otomatik kuracağız.',
          1 => '5 sabit tempodan birini seç; sınav tarihine göre yetişme durumunu sol panelden canlı takip et.',
          _ => 'Günlük görev listeni oluştururken öncelik vereceğimiz dersi ve puan hedefini belirle.',
        };

  @override
  Widget build(BuildContext context) {
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    return PopScope(
      canPop: !widget.isMandatory,
      child: isSplitPane
          ? _buildTabletStudioScaffold(context)
          : _buildMobileWizardScaffold(context),
    );
  }

  Widget _buildSkipButton(BuildContext context, {bool compact = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
      key: const ValueKey('onboarding_skip_button'),
      onPressed: _completeOnboarding,
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.onSurface,
        side: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 12 : 14,
          vertical: compact ? 6 : 10,
        ),
        minimumSize: Size(0, compact ? 36 : 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(compact ? 'Atla' : 'Şimdilik Atla'),
          const SizedBox(width: 6),
          PhosphorIcon(
            PhosphorIconsRegular.arrowRight,
            size: 15,
            color: colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }

  Widget _buildTabletStudioScaffold(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selectedCurriculum = CurriculumRegistry.resolve(_selectedExam);
    final advisory = _selectedPace.evaluateScheduleForSelection(
      _selectedExam,
      curriculum: selectedCurriculum,
    );
    final remaining = _selectedExam.detailedRemaining();

    return Scaffold(
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 1180,
          padding: EdgeInsets.zero,
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sol Kalıcı Kurulum Özeti & Adım Gezgini
                  Expanded(
                    flex: 4,
                    child: _DesktopSetupSidebar(
                      currentStep: _step,
                      isExpressMode: _isExpressMode,
                      isMandatory: widget.isMandatory,
                      mood: _currentMood,
                      selectedExam: _selectedExam,
                      selectedPace: _selectedPace,
                      selectedScore: _selectedScore,
                      selectedLesson: _selectedLesson,
                      remainingDays: remaining.totalDays,
                      advisory: advisory,
                      onStepSelected: (step) => setState(() => _step = step),
                      onApplyRecommendedPace: () => setState(
                        () => _selectedPace = advisory.recommendedPace,
                      ),
                      onBackExit: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 24),

                  // Sağ Ana Çalışma Alanı Kartı
                  Expanded(
                    flex: 7,
                    child: TactileCard(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 6,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorScheme.primaryContainer,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        _isExpressMode
                                            ? 'Hızlı Başlangıç · Tek Adım'
                                            : 'Adım ${_step + 1} / 3',
                                        style: textTheme.labelMedium?.copyWith(
                                          color: colorScheme.onPrimaryContainer,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    if (!_isExpressMode)
                                      Text(
                                        _stepShortLabel,
                                        style: textTheme.labelMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (widget.isMandatory) ...[
                                const SizedBox(width: 12),
                                _buildSkipButton(context),
                              ],
                            ],
                          ),
                          if (!_isExpressMode) ...[
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: LinearProgressIndicator(
                                value: (_step + 1) / 3,
                                minHeight: 6,
                                backgroundColor:
                                    colorScheme.surfaceContainerHighest,
                              ),
                            ),
                          ],
                          const SizedBox(height: 20),
                          Text(
                            _stepTitle,
                            style: textTheme.headlineMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _stepSubtitle,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildStepContent(useDesktopGrid: true),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.only(top: 18),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: colorScheme.outlineVariant,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: _buildDesktopFooter(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (_isExpressMode) {
      return Row(
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                key: const ValueKey('onboarding_customize_button'),
                onPressed: () => setState(() {
                  _useDetailedThreeStep = true;
                  _step = 1;
                }),
                icon: const PhosphorIcon(
                  PhosphorIconsRegular.slidersHorizontal,
                  size: 16,
                ),
                label: const Text(
                  'Süreyi Özelleştir',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          FilledButton.icon(
            key: const ValueKey('onboarding_start_button'),
            onPressed: _completeOnboarding,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
            icon: const PhosphorIcon(PhosphorIconsFill.rocketLaunch, size: 18),
            label: const Text('Programımı Kur ve Başla'),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_step > 0)
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                if (widget.isMandatory && _step == 1) {
                  _useDetailedThreeStep = false;
                }
                _step--;
              });
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
            icon: const PhosphorIcon(PhosphorIconsRegular.caretLeft, size: 16),
            label: const Text('Geri'),
          )
        else
          const SizedBox.shrink(),
        _step < 2
            ? FilledButton(
                onPressed: () => setState(() => _step++),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Devam Et'),
                    const SizedBox(width: 8),
                    PhosphorIcon(
                      PhosphorIconsRegular.caretRight,
                      size: 16,
                      color: colorScheme.onPrimary,
                    ),
                  ],
                ),
              )
            : FilledButton.icon(
                key: const ValueKey('onboarding_start_button'),
                onPressed: _completeOnboarding,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
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
      ],
    );
  }

  Widget _buildMobileWizardScaffold(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !widget.isMandatory,
        title: Text(
          _isExpressMode
              ? 'Hızlı Kurulum'
              : (widget.isMandatory
                    ? 'Çalışma Programını Kur'
                    : 'Çalışma Hedefi'),
        ),
        actions: [
          if (widget.isMandatory)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(child: _buildSkipButton(context, compact: true)),
            ),
        ],
      ),
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 720,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              if (!_isExpressMode)
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
                            _stepShortLabel,
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
                      _buildMobileHeader(),
                      const SizedBox(height: 16),
                      _buildStepContent(useDesktopGrid: false),
                      if (_isExpressMode) ...[
                        const SizedBox(height: 12),
                        TactileCard(
                          backgroundColor: colorScheme.surfaceContainerLow,
                          borderColor: colorScheme.outlineVariant,
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              PhosphorIcon(
                                PhosphorIconsRegular.lightning,
                                size: 18,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Varsayılan tempo: ${_selectedPace.estimatedMinutesPerDay} Dk / gün (${_selectedPace.dailyGoalQuestions} soru). İstersen özelleştirebilirsin.',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              TextButton(
                                key: const ValueKey(
                                  'onboarding_customize_button',
                                ),
                                onPressed: () => setState(() {
                                  _useDetailedThreeStep = true;
                                  _step = 1;
                                }),
                                child: const Text('Özelleştir'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveBreakpoints.horizontalPadding(context),
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
                child: _isExpressMode
                    ? SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          key: const ValueKey('onboarding_start_button'),
                          onPressed: _completeOnboarding,
                          icon: const PhosphorIcon(
                            PhosphorIconsFill.rocketLaunch,
                            size: 18,
                          ),
                          label: const Text('Programımı Kur ve Başla'),
                        ),
                      )
                    : Row(
                        children: [
                          if (_step > 0) ...[
                            Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    if (widget.isMandatory && _step == 1) {
                                      _useDetailedThreeStep = false;
                                    }
                                    _step--;
                                  });
                                },
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
                                    key: const ValueKey(
                                      'onboarding_start_button',
                                    ),
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
    );
  }

  Widget _buildMobileHeader() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TugrulAvatar(
          mood: _currentMood,
          size: 62,
          ringColor: _currentMood.accentColor(colorScheme),
          onTap: () => TugrulTipsSheet.show(context, mood: _currentMood),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _stepTitle,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _stepSubtitle,
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

  Widget _buildStepContent({required bool useDesktopGrid}) {
    final selectedCurriculum = CurriculumRegistry.resolve(_selectedExam);

    switch (_step) {
      case 0:
        return ExamTargetPickerView(
          value: _selectedExam,
          onChanged: _onExamSelectionChanged,
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

        final paceCards = StudyProgramPace.values
            .map(
              (pace) => _SelectableOptionCard(
                title: pace.label,
                subtitle: pace.packageSummary,
                badgeText: '~${pace.estimatedCompletionDays} Günde Bitirir',
                icon: _iconForPace(pace),
                isSelected: _selectedPace == pace,
                onTap: () => setState(() => _selectedPace = pace),
              ),
            )
            .toList(growable: false);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!useDesktopGrid) ...[
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
            ],
            ResponsiveGrid(
              columns: useDesktopGrid ? 2 : 1,
              spacing: 12,
              runSpacing: 10,
              children: paceCards,
            ),
          ],
        );

      case 2:
      default:
        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;
        final lessons = selectedCurriculum.activeLessons.isNotEmpty
            ? selectedCurriculum.activeLessons
            : selectedCurriculum.upcomingLessons;
        final denom = selectedCurriculum.activeQuestionDenominator;

        final lessonCards = lessons
            .map((spec) {
              final weightPct = denom > 0
                  ? ((spec.questionCount / denom) * 100).round()
                  : 0;
              return _SelectableOptionCard(
                title:
                    '${spec.name} · ${spec.questionCount} Soru (%$weightPct Ağırlık)',
                subtitle: _focusLessonSubtitle(spec),
                icon: spec.icon,
                isSelected: _selectedLesson == spec.name,
                onTap: () => setState(() => _selectedLesson = spec.name),
              );
            })
            .toList(growable: false);

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
                    padding: EdgeInsets.only(right: score == 90 ? 0 : 10),
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
                        vertical: 14,
                        horizontal: 10,
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
            const SizedBox(height: 20),
            Text(
              'Öncelikli Odak Dersin',
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            ResponsiveGrid(
              columns: useDesktopGrid ? 2 : 1,
              spacing: 12,
              runSpacing: 10,
              children: lessonCards,
            ),
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

/// Masaüstü Web kurulum stüdyosunun sol adım gezgini & canlı plan önizleme paneli.
class _DesktopSetupSidebar extends StatelessWidget {
  final int currentStep;
  final bool isExpressMode;
  final bool isMandatory;
  final TugrulMood mood;
  final ExamSelection selectedExam;
  final StudyProgramPace selectedPace;
  final int selectedScore;
  final String selectedLesson;
  final int remainingDays;
  final PaceAdvisory advisory;
  final ValueChanged<int> onStepSelected;
  final VoidCallback onApplyRecommendedPace;
  final VoidCallback onBackExit;

  const _DesktopSetupSidebar({
    required this.currentStep,
    required this.isExpressMode,
    required this.isMandatory,
    required this.mood,
    required this.selectedExam,
    required this.selectedPace,
    required this.selectedScore,
    required this.selectedLesson,
    required this.remainingDays,
    required this.advisory,
    required this.onStepSelected,
    required this.onApplyRecommendedPace,
    required this.onBackExit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final canFinishInTime = advisory.canFinishInTime;
    final advisoryColor = canFinishInTime
        ? colorScheme.secondary
        : colorScheme.tertiary;

    final steps = [
      (index: 0, title: 'Sınav & Müfredat', summary: selectedExam.displayTitle),
      (
        index: 1,
        title: 'Günlük Çalışma Temposu',
        summary:
            '${selectedPace.estimatedMinutesPerDay} Dk · ${selectedPace.dailyGoalQuestions} Soru/Gün',
      ),
      (
        index: 2,
        title: 'Hedef Puan & Odak Ders',
        summary: '$selectedScore+ Puan · $selectedLesson',
      ),
    ];

    return TactileCard(
      backgroundColor: colorScheme.surfaceContainerLow,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              TugrulAvatar(
                mood: mood,
                size: 54,
                ringColor: mood.accentColor(colorScheme),
                onTap: () => TugrulTipsSheet.show(context, mood: mood),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isMandatory ? 'Çalışma Programını Kur' : 'Çalışma Hedefi',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isExpressMode
                          ? 'Tek tıkla hızlı kurulum & akıllı varsayılanlar'
                          : 'Kişiselleştirilmiş 3 adımlı kurulum',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMandatory)
                IconButton(
                  tooltip: 'Kapat',
                  onPressed: onBackExit,
                  icon: const PhosphorIcon(PhosphorIconsRegular.x, size: 18),
                ),
            ],
          ),
          const SizedBox(height: 20),

          for (var i = 0; i < (isExpressMode ? 1 : steps.length); i++) ...[
            if (i > 0) const SizedBox(height: 8),
            _SidebarStepTile(
              stepNumber: steps[i].index + 1,
              title: steps[i].title,
              summary: steps[i].summary,
              isActive: currentStep == steps[i].index,
              isCompleted: currentStep > steps[i].index,
              onTap: () => onStepSelected(steps[i].index),
            ),
          ],

          if (isExpressMode) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Otomatik Atanan Başlangıç Ayarları',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tempo: ${selectedPace.label} (${selectedPace.dailyGoalQuestions} soru/gün)\nHedef: $selectedScore+ Puan · Odak: $selectedLesson',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color.alphaBlend(
                advisoryColor.withAlpha(22),
                colorScheme.surface,
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: advisoryColor.withAlpha(150),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PhosphorIcon(
                      canFinishInTime
                          ? PhosphorIconsFill.checkCircle
                          : PhosphorIconsFill.warningCircle,
                      size: 17,
                      color: advisoryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        canFinishInTime
                            ? 'Tuğrul Planı Onayladı'
                            : 'Sınav Yakınlık Tavsiyesi',
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _BlueprintStatChip(
                      icon: PhosphorIconsRegular.calendar,
                      label: '$remainingDays gün kaldı',
                    ),
                    _BlueprintStatChip(
                      icon: PhosphorIconsRegular.lightning,
                      label:
                          '~${selectedPace.estimatedCompletionDays} günde 1 tur',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  advisory.message,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
                if (!canFinishInTime &&
                    advisory.recommendedPace != selectedPace) ...[
                  const SizedBox(height: 10),
                  FilledButton.tonal(
                    onPressed: onApplyRecommendedPace,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(0, 36),
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
        ],
      ),
    );
  }
}

class _SidebarStepTile extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String summary;
  final bool isActive;
  final bool isCompleted;
  final VoidCallback onTap;

  const _SidebarStepTile({
    required this.stepNumber,
    required this.title,
    required this.summary,
    required this.isActive,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
      color: isActive
          ? colorScheme.primaryContainer.withAlpha(85)
          : colorScheme.surface.withAlpha(isCompleted ? 190 : 120),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              width: isActive ? 1.5 : 1.0,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? colorScheme.secondary
                      : (isActive
                            ? colorScheme.primary
                            : colorScheme.surfaceContainerHighest),
                ),
                alignment: Alignment.center,
                child: isCompleted
                    ? PhosphorIcon(
                        PhosphorIconsBold.check,
                        size: 14,
                        color: colorScheme.onSecondary,
                      )
                    : Text(
                        '$stepNumber',
                        style: textTheme.labelMedium?.copyWith(
                          color: isActive
                              ? colorScheme.onPrimary
                              : colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.labelLarge?.copyWith(
                        color: isActive
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      summary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}

class _BlueprintStatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BlueprintStatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, size: 13, color: colorScheme.primary),
          const SizedBox(width: 5),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
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
