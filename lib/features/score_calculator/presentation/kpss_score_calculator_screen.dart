import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';
import 'package:kadro/shared/widgets/kadro_dropdown.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// KPSS Puan Hesaplama Robotu (P3 / P93 / P94) & Son 3 Sınav Karşılaştırma ekranı.
///
/// Angular/Web karşılığı: Reaktif form kontrolleri üzerinden canlı KPSS puanı ve
/// geçmiş yıl karşılaştırması üreten sade `KpssScoreCalculatorComponent`.
class KpssScoreCalculatorScreen extends ConsumerStatefulWidget {
  final String? initialExamParam;
  final bool isGuestMode;

  const KpssScoreCalculatorScreen({
    super.key,
    this.initialExamParam,
    this.isGuestMode = false,
  });

  @override
  ConsumerState<KpssScoreCalculatorScreen> createState() =>
      _KpssScoreCalculatorScreenState();
}

class _KpssScoreCalculatorScreenState
    extends ConsumerState<KpssScoreCalculatorScreen> {
  late ScoreEngineMode _engineMode;
  OabtBranch? _mebAgsBranchOverride;
  final Map<String, ScoreSectionInput> _inputs = <String, ScoreSectionInput>{};

  @override
  void initState() {
    super.initState();
    final fromParam = _parseInitialExamParam(widget.initialExamParam);
    if (fromParam != null) {
      _engineMode = fromParam;
      return;
    }
    final prefs = ref.read(userPreferencesProvider);
    final selection = prefs.examSelection;
    final fromSelection = ScoreEngineRegistry.modeForSelection(selection);
    if (selection.family == KpssExamFamily.bGrubu &&
        selection.educationLevel == EducationLevel.lisans &&
        prefs.targetExam != KpssExamTarget.lisans) {
      _engineMode = _modeFromLegacyTarget(prefs.targetExam);
    } else {
      _engineMode = fromSelection;
    }
  }

  ScoreEngineMode? _parseInitialExamParam(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    final normalized = raw.trim().toLowerCase();
    if (normalized.contains('p93') || normalized.contains('onlisans')) {
      return ScoreEngineMode.bGrubuOnLisans;
    }
    if (normalized.contains('p94') || normalized.contains('ortaogretim')) {
      return ScoreEngineMode.bGrubuOrtaogretim;
    }
    if (normalized.contains('ekpss')) return ScoreEngineMode.ekpss;
    if (normalized.contains('dhbt')) return ScoreEngineMode.dhbt;
    if (normalized.contains('ags')) return ScoreEngineMode.mebAgs;
    if (normalized.contains('a_grubu') || normalized.contains('agrubu')) {
      return ScoreEngineMode.aGrubu;
    }
    if (normalized.contains('p3') || normalized.contains('lisans')) {
      return ScoreEngineMode.bGrubuLisans;
    }
    return null;
  }

  void _openAuth(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.go('/');
      return;
    }
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  ScoreEngineMode _modeFromLegacyTarget(KpssExamTarget target) {
    switch (target) {
      case KpssExamTarget.onlisans:
        return ScoreEngineMode.bGrubuOnLisans;
      case KpssExamTarget.ortaogretim:
        return ScoreEngineMode.bGrubuOrtaogretim;
      case KpssExamTarget.dhbt:
        return ScoreEngineMode.dhbt;
      case KpssExamTarget.lisans:
      case KpssExamTarget.lisans2028:
        return ScoreEngineMode.bGrubuLisans;
    }
  }

  ExamSelection _effectiveSelection(ExamSelection current) {
    if (_engineMode.examFamily == current.family) {
      switch (_engineMode) {
        case ScoreEngineMode.bGrubuLisans:
          return current.copyWith(educationLevel: EducationLevel.lisans);
        case ScoreEngineMode.bGrubuOnLisans:
          return current.copyWith(educationLevel: EducationLevel.onlisans);
        case ScoreEngineMode.bGrubuOrtaogretim:
          return current.copyWith(educationLevel: EducationLevel.ortaogretim);
        case ScoreEngineMode.ekpss:
        case ScoreEngineMode.dhbt:
        case ScoreEngineMode.mebAgs:
          return _mebAgsBranchOverride != null
              ? current.copyWith(oabtBranch: _mebAgsBranchOverride)
              : current;
        case ScoreEngineMode.aGrubu:
          return current;
      }
    }

    switch (_engineMode) {
      case ScoreEngineMode.bGrubuLisans:
        return const ExamSelection.bGrubuLisans();
      case ScoreEngineMode.bGrubuOnLisans:
        return const ExamSelection.bGrubu(
          educationLevel: EducationLevel.onlisans,
        );
      case ScoreEngineMode.bGrubuOrtaogretim:
        return const ExamSelection.bGrubu(
          educationLevel: EducationLevel.ortaogretim,
        );
      case ScoreEngineMode.ekpss:
        return const ExamSelection.ekpss();
      case ScoreEngineMode.dhbt:
        return const ExamSelection.dhbt();
      case ScoreEngineMode.mebAgs:
        return ExamSelection.mebAgs(
          oabtBranch: _mebAgsBranchOverride ?? OabtBranch.turkce,
        );
      case ScoreEngineMode.aGrubu:
        return const ExamSelection.aGrubu();
    }
  }

  void _updateSection({
    required String fieldKey,
    required int maxQuestions,
    required int nextCorrect,
    required int nextWrong,
  }) {
    final clamped = ScoreFormulaEngine.clampForMax(
      ScoreSectionInput(correct: nextCorrect, wrong: nextWrong),
      maxQuestions,
    );
    setState(() {
      _inputs[fieldKey] = ScoreSectionInput(
        correct: clamped.correct,
        wrong: clamped.wrong,
      );
    });
  }

  void _updateRawScore({required String fieldKey, required double nextScore}) {
    final clamped = nextScore.clamp(0.0, 100.0);
    setState(() {
      _inputs[fieldKey] = ScoreSectionInput(rawScore: clamped);
    });
  }

  void _reset() {
    setState(_inputs.clear);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final baseSelection = ref.watch(
      userPreferencesProvider.select((s) => s.examSelection),
    );
    final effectiveSelection = _effectiveSelection(baseSelection);
    final engine = ScoreEngineRegistry.engineForMode(_engineMode);
    final fields = engine.fieldsFor(effectiveSelection);
    final result = engine.calculate(
      selection: effectiveSelection,
      inputs: _inputs,
    );
    final primarySubtitle = result.historicalResults.isNotEmpty
        ? '${result.historicalResults.first.year} KPSS tahmini'
        : _engineMode.subtitle;
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    final selectorSection = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ScoreTypeSelector(
          selected: _engineMode,
          onSelected: (nextMode) {
            setState(() {
              _engineMode = nextMode;
              _mebAgsBranchOverride = null;
            });
          },
        ),
        if (_engineMode == ScoreEngineMode.mebAgs) ...[
          AppSpacing.gapSm,
          _MebAgsModeChips(
            currentBranch: effectiveSelection.oabtBranch,
            fallbackOabtBranch: baseSelection.oabtBranch.isOabtExam
                ? baseSelection.oabtBranch
                : OabtBranch.turkce,
            onChanged: (branch) {
              setState(() => _mebAgsBranchOverride = branch);
            },
          ),
        ],
      ],
    );

    final resultSummaryWidgets = <Widget>[
      _PrimaryScoreHeroCard(
        result: result,
        subtitle: primarySubtitle,
        fields: fields,
      ),
      if (result.scoreOutputs.length > 1 ||
          result.historicalResults.isEmpty) ...[
        AppSpacing.gapMd,
        _CalculatedScoreOutputsCard(outputs: result.scoreOutputs),
      ],
      if (result.historicalResults.isNotEmpty) ...[
        AppSpacing.gapMd,
        _HistoricalComparisonSection(
          historicalResults: result.historicalResults,
        ),
      ],
      AppSpacing.gapSm,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          '4 yanlış 1 doğruyu götürür · ${result.disclaimer}',
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    ];

    final inputCards = <Widget>[
      for (var i = 0; i < fields.length; i++) ...[
        if (i > 0) AppSpacing.gapSm,
        if (fields[i].isRawScoreInput)
          _RawScoreInputCard(
            field: fields[i],
            value: _inputs[fields[i].key]?.rawScore ?? 0.0,
            onChanged: (next) =>
                _updateRawScore(fieldKey: fields[i].key, nextScore: next),
          )
        else
          Builder(
            builder: (_) {
              final field = fields[i];
              final counts =
                  result.sectionCounts[field.key] ??
                  ScoreFormulaEngine.clampForMax(
                    _inputs[field.key],
                    field.maxQuestions,
                  );
              return _TestNetInputCard(
                sectionKeyPrefix: field.key,
                title: '${field.label} (${field.maxQuestions} Soru)',
                subtitle: field.subtitle,
                maxQuestions: field.maxQuestions,
                correct: counts.correct,
                wrong: counts.wrong,
                empty: counts.empty,
                net: counts.net,
                onCorrectChanged: (value) => _updateSection(
                  fieldKey: field.key,
                  maxQuestions: field.maxQuestions,
                  nextCorrect: value,
                  nextWrong: counts.wrong,
                ),
                onWrongChanged: (value) => _updateSection(
                  fieldKey: field.key,
                  maxQuestions: field.maxQuestions,
                  nextCorrect: counts.correct,
                  nextWrong: value,
                ),
              );
            },
          ),
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('KPSS Puan Hesaplama'),
        actions: [
          TextButton(onPressed: _reset, child: const Text('Sıfırla')),
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
      body: isSplitPane
          ? ResponsiveContentWrapper(
              maxWidth: 1260,
              padding: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveBreakpoints.horizontalPadding(context),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Scrollbar(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(0, 16, 20, 24),
                          children: [
                            if (widget.isGuestMode) ...[
                              _CalculatorGuestCallout(
                                onSignIn: () => _openAuth(context),
                              ),
                              AppSpacing.gapMd,
                            ],
                            selectorSection,
                            AppSpacing.gapMd,
                            const SectionTitle('Test Netlerini Gir'),
                            ...inputCards,
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      thickness: 1.5,
                      color: colorScheme.outlineVariant,
                    ),
                    Expanded(
                      flex: 5,
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 16, 0, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: resultSummaryWidgets,
                          ),
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
                  if (widget.isGuestMode) ...[
                    _CalculatorGuestCallout(onSignIn: () => _openAuth(context)),
                    AppSpacing.gapMd,
                  ],
                  selectorSection,
                  AppSpacing.gapMd,
                  _PrimaryScoreHeroCard(
                    result: result,
                    subtitle: primarySubtitle,
                    fields: fields,
                  ),
                  if (result.scoreOutputs.length > 1 ||
                      result.historicalResults.isEmpty) ...[
                    AppSpacing.gapMd,
                    _CalculatedScoreOutputsCard(outputs: result.scoreOutputs),
                  ],
                  AppSpacing.gapMd,
                  const SectionTitle('Test Netlerini Gir'),
                  ...inputCards,
                  if (result.historicalResults.isNotEmpty) ...[
                    AppSpacing.gapMd,
                    _HistoricalComparisonSection(
                      historicalResults: result.historicalResults,
                    ),
                  ],
                  AppSpacing.gapSm,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '4 yanlış 1 doğruyu götürür · ${result.disclaimer}',
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _MebAgsModeChips extends StatelessWidget {
  final OabtBranch currentBranch;
  final OabtBranch fallbackOabtBranch;
  final ValueChanged<OabtBranch> onChanged;

  const _MebAgsModeChips({
    required this.currentBranch,
    required this.fallbackOabtBranch,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ChoiceChip(
          key: const ValueKey('meb_ags_chip_p1'),
          label: const Text('AGS-P1 (Genel)'),
          selected: currentBranch == OabtBranch.none,
          onSelected: (_) => onChanged(OabtBranch.none),
        ),
        ChoiceChip(
          key: const ValueKey('meb_ags_chip_p2'),
          label: const Text('AGS-P2 (ÖABT 50)'),
          selected: currentBranch.isOabtExam,
          onSelected: (_) => onChanged(fallbackOabtBranch),
        ),
        ChoiceChip(
          key: const ValueKey('meb_ags_chip_p3'),
          label: const Text('AGS-P3 (YDS Dil)'),
          selected: currentBranch == OabtBranch.ydsDil,
          onSelected: (_) => onChanged(OabtBranch.ydsDil),
        ),
      ],
    );
  }
}

/// Kompakt puan türü açılır seçicisi (B Grubu, E-KPSS, DHBT, MEB-AGS, A Grubu).
///
/// Angular/Web karşılığı: Az yer kaplayan `<select>` / `<mat-select>` açılır menüsüdür.
class _ScoreTypeSelector extends StatelessWidget {
  final ScoreEngineMode selected;
  final ValueChanged<ScoreEngineMode> onSelected;

  const _ScoreTypeSelector({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return KadroDropdown<ScoreEngineMode>(
      dropdownKey: const ValueKey('score_type_dropdown'),
      value: selected,
      items: ScoreEngineMode.values,
      leadingIcon: PhosphorIconsRegular.graduationCap,
      label: 'Sınav Türü',
      alignEnd: true,
      itemLabelBuilder: (mode) => mode.shortTitle,
      itemKeyBuilder: (mode) => ValueKey('score_type_${mode.code}'),
      onChanged: onSelected,
    );
  }
}

/// Canlı KPSS & MEB-AGS puan özetini ve baraj durumunu gösteren kahraman kart.
///
/// Angular/Web karşılığı: Hesaplanan ana puanı ve net dağılımını gösteren `ScoreSummaryCard`.
class _PrimaryScoreHeroCard extends StatelessWidget {
  final ScoreEngineCalculationResult result;
  final String subtitle;
  final List<ScoreInputField> fields;

  const _PrimaryScoreHeroCard({
    required this.result,
    required this.subtitle,
    required this.fields,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final visibleSections = fields.where((f) => !f.isRawScoreInput).toList();

    return TactileCard(
      isElevated: false,
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.primaryLabel,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
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
              Text(
                result.primaryScore.toStringAsFixed(2),
                key: const ValueKey('kpss_primary_score_text'),
                style: textTheme.headlineLarge?.copyWith(
                  color: result.isThresholdMet
                      ? colorScheme.primary
                      : colorScheme.error,
                  fontWeight: FontWeight.w700,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          if (!result.isThresholdMet && result.thresholdWarning != null) ...[
            const SizedBox(height: 12),
            Text(
              result.thresholdWarning!,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const Divider(height: 24),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 16,
              runSpacing: 10,
              alignment: visibleSections.length <= 3
                  ? WrapAlignment.spaceAround
                  : WrapAlignment.spaceBetween,
              children: [
                if (visibleSections.length <= 3) ...[
                  if (result.sectionCounts.containsKey('gk'))
                    _SimpleNetColumn(
                      label: 'GK Net',
                      value: result.sectionCounts['gk']!.net.toStringAsFixed(2),
                    ),
                  if (result.sectionCounts.containsKey('gy'))
                    _SimpleNetColumn(
                      label: 'GY Net',
                      value: result.sectionCounts['gy']!.net.toStringAsFixed(2),
                    ),
                  for (final f in visibleSections.where(
                    (f) => f.key != 'gk' && f.key != 'gy',
                  ))
                    _SimpleNetColumn(
                      label: f.label,
                      value: (result.sectionCounts[f.key]?.net ?? 0.0)
                          .toStringAsFixed(2),
                    ),
                ] else
                  for (final f in visibleSections)
                    _SimpleNetColumn(
                      label: f.key.toUpperCase(),
                      value: (result.sectionCounts[f.key]?.net ?? 0.0)
                          .toStringAsFixed(2),
                    ),
                _SimpleNetColumn(
                  label: 'Toplam Net',
                  value: result.totalNet.toStringAsFixed(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Seçili sınav motorunun aynı anda ürettiği tüm puan türlerini gösteren kart.
///
/// Angular/Web karşılığı: `KPSSP1/P2/P3`, `P122–P124`, `AGS-P1/P2/P3` veya
/// A Grubu puan matrisini listeleyen `ScoreOutputsCard`.
class _CalculatedScoreOutputsCard extends StatelessWidget {
  final List<ScoreOutputRow> outputs;

  const _CalculatedScoreOutputsCard({required this.outputs});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle('Puan Türleri'),
        TactileCard(
          isElevated: false,
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.outlineVariant,
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              for (var i = 0; i < outputs.length; i++) ...[
                if (i > 0) const Divider(height: 18),
                _ScoreOutputTile(
                  row: outputs[i],
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoreOutputTile extends StatelessWidget {
  final ScoreOutputRow row;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _ScoreOutputTile({
    required this.row,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isBlocked = !row.isCalculated;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isBlocked
                ? colorScheme.errorContainer
                : colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            row.code,
            style: textTheme.labelSmall?.copyWith(
              color: isBlocked
                  ? colorScheme.onErrorContainer
                  : colorScheme.onPrimaryContainer,
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
                row.label,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                isBlocked
                    ? (row.blockReason ?? 'Hesaplanmadı')
                    : row.formulaNote,
                style: textTheme.bodySmall?.copyWith(
                  color: isBlocked
                      ? colorScheme.error
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          row.isCalculated ? row.score!.toStringAsFixed(2) : '—',
          key: ValueKey('score_output_${row.code}'),
          style: textTheme.titleMedium?.copyWith(
            color: isBlocked ? colorScheme.error : colorScheme.primary,
            fontWeight: FontWeight.w700,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

/// Ham puan girişi gerektiren testler (ör. MEB-AGS P3 için YDS 0–100 puanı) kartı.
class _RawScoreInputCard extends StatelessWidget {
  final ScoreInputField field;
  final double value;
  final ValueChanged<double> onChanged;

  const _RawScoreInputCard({
    required this.field,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final safeValue = value.clamp(0.0, 100.0);

    return TactileCard(
      isElevated: false,
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      field.label,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (field.subtitle != null)
                      Text(
                        field.subtitle!,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${safeValue.toStringAsFixed(1)} Puan',
                key: ValueKey('${field.key}_raw_badge'),
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Slider(
            key: ValueKey('${field.key}_raw_slider'),
            value: safeValue,
            min: 0,
            max: 100,
            divisions: 100,
            activeColor: colorScheme.primary,
            onChanged: (next) => onChanged(next.roundToDouble()),
          ),
        ],
      ),
    );
  }
}

class _SimpleNetColumn extends StatelessWidget {
  final String label;
  final String value;

  const _SimpleNetColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: textTheme.titleSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

/// Tek bir test bölümü (GK veya GY) için sade Doğru ve Yanlış giriş kartı.
///
/// Angular/Web karşılığı: Doğru ve yanlış sayılarını ayarlayan çift slider'lı `TestInputSection`.
class _TestNetInputCard extends StatelessWidget {
  final String sectionKeyPrefix;
  final String title;
  final String? subtitle;
  final int maxQuestions;
  final int correct;
  final int wrong;
  final int empty;
  final double net;
  final ValueChanged<int> onCorrectChanged;
  final ValueChanged<int> onWrongChanged;

  const _TestNetInputCard({
    required this.sectionKeyPrefix,
    required this.title,
    this.subtitle,
    required this.maxQuestions,
    required this.correct,
    required this.wrong,
    required this.empty,
    required this.net,
    required this.onCorrectChanged,
    required this.onWrongChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final maxWrongForCurrentCorrect = (maxQuestions - correct).clamp(
      0,
      maxQuestions,
    );

    return TactileCard(
      isElevated: false,
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${net.toStringAsFixed(2)} Net · $empty Boş',
                key: ValueKey('${sectionKeyPrefix}_net_badge'),
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _StepAdjustmentRow(
            rowKeyPrefix: '${sectionKeyPrefix}_correct',
            label: 'Doğru',
            value: correct,
            maxValue: maxQuestions,
            activeColor: colorScheme.primary,
            onChanged: onCorrectChanged,
          ),
          const SizedBox(height: 8),
          _StepAdjustmentRow(
            rowKeyPrefix: '${sectionKeyPrefix}_wrong',
            label: 'Yanlış',
            value: wrong,
            maxValue: maxWrongForCurrentCorrect,
            activeColor: colorScheme.error,
            onChanged: onWrongChanged,
          ),
        ],
      ),
    );
  }
}

/// Sol etiket + Slider + sağda kompakt [-] değer [+] adımlama butonları.
///
/// Angular/Web karşılığı: Input stepper + range slider bileşeni.
class _StepAdjustmentRow extends StatelessWidget {
  final String rowKeyPrefix;
  final String label;
  final int value;
  final int maxValue;
  final Color activeColor;
  final ValueChanged<int> onChanged;

  const _StepAdjustmentRow({
    required this.rowKeyPrefix,
    required this.label,
    required this.value,
    required this.maxValue,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final sliderMax = maxValue > 0 ? maxValue.toDouble() : 1.0;

    return Row(
      children: [
        SizedBox(
          width: 52,
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
            ),
            child: Slider(
              value: value.clamp(0, maxValue).toDouble(),
              min: 0,
              max: sliderMax,
              divisions: maxValue > 0 ? maxValue : 1,
              activeColor: activeColor,
              onChanged: maxValue == 0
                  ? null
                  : (rawValue) => onChanged(rawValue.round()),
            ),
          ),
        ),
        const SizedBox(width: 4),
        InkWell(
          key: ValueKey('${rowKeyPrefix}_minus_1'),
          onTap: value > 0
              ? () => onChanged((value - 1).clamp(0, maxValue))
              : null,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: value > 0
                  ? colorScheme.surfaceContainerLow
                  : colorScheme.surfaceContainerLow.withAlpha(90),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: value > 0
                    ? colorScheme.outlineVariant
                    : colorScheme.outlineVariant.withAlpha(80),
              ),
            ),
            child: PhosphorIcon(
              PhosphorIconsRegular.minus,
              size: 14,
              color: value > 0
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant.withAlpha(90),
            ),
          ),
        ),
        SizedBox(
          width: 30,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ),
        InkWell(
          key: ValueKey('${rowKeyPrefix}_plus_1'),
          onTap: value < maxValue
              ? () => onChanged((value + 1).clamp(0, maxValue))
              : null,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: value < maxValue
                  ? colorScheme.surfaceContainerLow
                  : colorScheme.surfaceContainerLow.withAlpha(90),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: value < maxValue
                    ? colorScheme.outlineVariant
                    : colorScheme.outlineVariant.withAlpha(80),
              ),
            ),
            child: PhosphorIcon(
              PhosphorIconsRegular.plus,
              size: 14,
              color: value < maxValue
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant.withAlpha(90),
            ),
          ),
        ),
      ],
    );
  }
}

/// "Son 3 KPSS'de Kaç Puan Alırdın?" sade karşılaştırma bölümü.
///
/// Angular/Web karşılığı: Geçmiş sınav puanlarını listeleyen `HistoricalComparisonCard`.
class _HistoricalComparisonSection extends StatelessWidget {
  final List<KpssYearScoreResult> historicalResults;

  const _HistoricalComparisonSection({required this.historicalResults});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle("Son 3 KPSS'de Kaç Puan Alırdın?"),
        TactileCard(
          isElevated: false,
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.outlineVariant,
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              for (var i = 0; i < historicalResults.length; i++) ...[
                if (i > 0) const Divider(height: 20),
                _HistoricalYearRow(result: historicalResults[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _HistoricalYearRow extends StatelessWidget {
  final KpssYearScoreResult result;

  const _HistoricalYearRow({required this.result});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${result.year} KPSS',
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'TR Ort: GY ${result.gyMean.toStringAsFixed(1)} · GK ${result.gkMean.toStringAsFixed(1)}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              result.score.toStringAsFixed(2),
              key: ValueKey('historical_score_${result.year}'),
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: (result.score / 100.0).clamp(0.0, 1.0),
            minHeight: 5,
            backgroundColor: colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class _CalculatorGuestCallout extends StatelessWidget {
  final VoidCallback onSignIn;

  const _CalculatorGuestCallout({required this.onSignIn});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surfaceContainerLow,
      borderColor: colorScheme.primary.withAlpha(110),
      lipColor: colorScheme.primary.withAlpha(130),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsFill.sparkle,
            size: 18,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Misafir Modu: Netlerini ücretsiz hesapla; ilerlemeni kaydetmek için giriş yap.',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            onPressed: onSignIn,
            child: const Text('Giriş Yap'),
          ),
        ],
      ),
    );
  }
}
