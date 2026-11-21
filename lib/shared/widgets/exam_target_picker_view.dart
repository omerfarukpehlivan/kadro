import 'package:flutter/material.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/shared/widgets/kadro_dropdown.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// 5 KPSS/MEB-AGS sınav ailesini, öğrenim düzeyini, kapsam profilini, E-KPSS
/// engel grubunu, 17 ÖABT branşını ve A Grubu alan derslerini seçtiren ortak görünüm.
///
/// Angular/Web Karşılığı: Tek boyutlu dropdown yerine koşullu alt adımlar sunan
/// yeniden kullanılabilir `<app-exam-target-picker>` bileşeni (`TASK-131`).
class ExamTargetPickerView extends StatefulWidget {
  final ExamSelection value;
  final ValueChanged<ExamSelection> onChanged;

  const ExamTargetPickerView({
    super.key,
    required this.value,
    required this.onChanged,
  });

  /// KPSS A Grubu 9 resmî alan bilgisi testi listesi.
  static const List<String> aGrubuFieldLessons = [
    'Alan Hukuk',
    'Alan İktisat',
    'Alan Maliye',
    'Alan Muhasebe',
    'Alan İşletme',
    'Alan Kamu Yönetimi',
    'Alan Uluslararası İlişkiler',
    'Alan ÇEKO',
    'Alan İstatistik',
  ];

  @override
  State<ExamTargetPickerView> createState() => _ExamTargetPickerViewState();
}

class _ExamTargetPickerViewState extends State<ExamTargetPickerView> {
  IconData _familyIcon(KpssExamFamily family) {
    switch (family) {
      case KpssExamFamily.bGrubu:
        return PhosphorIconsRegular.graduationCap;
      case KpssExamFamily.aGrubu:
        return PhosphorIconsRegular.briefcase;
      case KpssExamFamily.dhbt:
        return PhosphorIconsRegular.bookOpenText;
      case KpssExamFamily.mebAgs:
        return PhosphorIconsRegular.chalkboardTeacher;
      case KpssExamFamily.ekpss:
        return PhosphorIconsRegular.wheelchair;
    }
  }

  void _selectFamily(KpssExamFamily family) {
    final current = widget.value;
    switch (family) {
      case KpssExamFamily.bGrubu:
        widget.onChanged(
          current.copyWith(
            family: KpssExamFamily.bGrubu,
            bGroupProfile: BGroupProfile.fullGyGk,
            oabtBranch: OabtBranch.none,
            disabilityGroup: DisabilityGroup.genel,
            selectedFieldLessons: const [],
            includeExtraTime: false,
          ),
        );
      case KpssExamFamily.aGrubu:
        widget.onChanged(
          current.copyWith(
            family: KpssExamFamily.aGrubu,
            educationLevel: EducationLevel.lisans,
            bGroupProfile: BGroupProfile.fullGyGk,
            oabtBranch: OabtBranch.none,
            disabilityGroup: DisabilityGroup.genel,
            selectedFieldLessons: current.selectedFieldLessons.isNotEmpty
                ? current.selectedFieldLessons
                : ExamSelection.defaultAGroupP48Lessons,
            includeExtraTime: false,
          ),
        );
      case KpssExamFamily.dhbt:
        widget.onChanged(
          current.copyWith(
            family: KpssExamFamily.dhbt,
            oabtBranch: OabtBranch.none,
            disabilityGroup: DisabilityGroup.genel,
            selectedFieldLessons: const [],
            examCycleYear: current.examCycleYear.isEven
                ? current.examCycleYear
                : 2028,
            includeExtraTime: false,
          ),
        );
      case KpssExamFamily.mebAgs:
        widget.onChanged(
          current.copyWith(
            family: KpssExamFamily.mebAgs,
            educationLevel: EducationLevel.lisans,
            disabilityGroup: DisabilityGroup.genel,
            selectedFieldLessons: const [],
            includeExtraTime: false,
          ),
        );
      case KpssExamFamily.ekpss:
        widget.onChanged(
          current.copyWith(
            family: KpssExamFamily.ekpss,
            oabtBranch: OabtBranch.none,
            selectedFieldLessons: const [],
            examCycleYear: current.examCycleYear.isEven
                ? current.examCycleYear
                : 2028,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selection = widget.value;
    final remaining = selection.detailedRemaining();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KadroDropdown<KpssExamFamily>(
          dropdownKey: const ValueKey('picker_family_dropdown'),
          label: '1. Sınav Ailesi',
          leadingIcon: _familyIcon(selection.family),
          value: selection.family,
          items: KpssExamFamily.values,
          itemKeyBuilder: (family) => ValueKey('picker_family_${family.key}'),
          itemLabelBuilder: (family) => family.shortLabel,
          onChanged: _selectFamily,
        ),
        const SizedBox(height: 12),

        // 2. Koşullu Alt Boyut Kartı
        TactileCard(
          padding: const EdgeInsets.all(14),
          backgroundColor: colorScheme.surfaceContainerLow,
          borderColor: colorScheme.outlineVariant,
          child: _buildFamilyOptions(context, selection),
        ),
        const SizedBox(height: 12),

        // 3. Aktif Seçim Özet Bandı
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withAlpha(85),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.primary.withAlpha(90)),
          ),
          child: Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.checkCircle,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selection.displayTitle,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${selection.subtitle} · ${remaining.formattedRemaining}',
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
      ],
    );
  }

  Widget _buildFamilyOptions(BuildContext context, ExamSelection selection) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    switch (selection.family) {
      case KpssExamFamily.bGrubu:
        final currentBLevel = _BGroupLevelOption.fromSelection(selection);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KadroDropdown<_BGroupLevelOption>(
              dropdownKey: const ValueKey('b_level_dropdown'),
              label: 'Öğrenim Düzeyi ve Dönem',
              value: currentBLevel,
              items: _BGroupLevelOption.values,
              itemLabelBuilder: (opt) => opt.label,
              onChanged: (opt) => widget.onChanged(
                selection.copyWith(
                  educationLevel: opt.educationLevel,
                  bGroupProfile: BGroupProfile.fullGyGk,
                  examCycleYear: opt.examCycleYear,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  PhosphorIcon(
                    PhosphorIconsRegular.exam,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'GY-GK · 120 Soru · 130 dk',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case KpssExamFamily.ekpss:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KadroDropdown<EducationLevel>(
              dropdownKey: const ValueKey('ekpss_level_dropdown'),
              label: 'Öğrenim Düzeyi',
              value: selection.educationLevel,
              items: EducationLevel.values,
              itemLabelBuilder: (level) => level.label,
              onChanged: (level) =>
                  widget.onChanged(selection.copyWith(educationLevel: level)),
            ),
            const SizedBox(height: 12),
            KadroDropdown<DisabilityGroup>(
              dropdownKey: const ValueKey('ekpss_group_dropdown'),
              label: 'E-KPSS Kitapçık & Engel Grubu',
              value: selection.disabilityGroup,
              items: DisabilityGroup.values,
              itemKeyBuilder: (g) => ValueKey('ekpss_group_${g.key}'),
              itemLabelBuilder: (g) => g.label,
              onChanged: (group) => widget.onChanged(
                selection.copyWith(
                  disabilityGroup: group,
                  includeExtraTime: group.standardExtraMinutes > 0
                      ? true
                      : selection.includeExtraTime,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile.adaptive(
              key: const ValueKey('ekpss_extra_time_switch'),
              contentPadding: EdgeInsets.zero,
              title: const Text('Ek Süre Uygula'),
              subtitle: Text(
                selection.disabilityGroup.standardExtraMinutes > 0
                    ? '60 dk standart süreye +${selection.disabilityGroup.standardExtraMinutes} dk eklenir'
                    : 'Aday tercihine göre +20 dk ek süre ekler',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              value: selection.includeExtraTime,
              onChanged: (enabled) => widget.onChanged(
                selection.copyWith(includeExtraTime: enabled),
              ),
            ),
          ],
        );

      case KpssExamFamily.dhbt:
        return KadroDropdown<EducationLevel>(
          dropdownKey: const ValueKey('dhbt_level_dropdown'),
          label: 'DHBT-2 Öğrenim Düzeyi',
          value: selection.educationLevel,
          items: const [
            EducationLevel.ortaogretim,
            EducationLevel.onlisans,
            EducationLevel.lisans,
          ],
          itemLabelBuilder: (level) => level == EducationLevel.ortaogretim
              ? 'Ortaöğretim (İHL)'
              : level.label,
          onChanged: (level) =>
              widget.onChanged(selection.copyWith(educationLevel: level)),
        );

      case KpssExamFamily.mebAgs:
        final allAgsOptions = <OabtBranch>[
          OabtBranch.none,
          OabtBranch.ydsDil,
          ...OabtBranch.officialOabtBranches,
        ];
        return KadroDropdown<OabtBranch>(
          dropdownKey: const ValueKey('meb_ags_branch_dropdown'),
          label: 'MEB-AGS Puan Türü & 2. Oturum / ÖABT Branşı',
          value: selection.oabtBranch,
          items: allAgsOptions,
          itemKeyBuilder: (branch) {
            if (branch == OabtBranch.none) {
              return const ValueKey('ags_mode_p1');
            }
            if (branch == OabtBranch.ydsDil) {
              return const ValueKey('ags_mode_p3');
            }
            return ValueKey('oabt_branch_${branch.key}');
          },
          itemLabelBuilder: (branch) {
            if (branch == OabtBranch.none) return 'Yalnızca AGS (P1)';
            if (branch == OabtBranch.ydsDil) return 'AGS + YDS Dil (P3)';
            return '${branch.label} (${branch.durationMinutes} dk)';
          },
          onChanged: (branch) =>
              widget.onChanged(selection.copyWith(oabtBranch: branch)),
        );

      case KpssExamFamily.aGrubu:
        final activeFields = selection.selectedFieldLessons.isNotEmpty
            ? selection.selectedFieldLessons
            : ExamSelection.defaultAGroupP48Lessons;

        bool matchesPreset(List<String> preset) {
          final a = activeFields.toSet();
          final b = preset.toSet();
          return a.length == b.length && a.containsAll(b);
        }

        const siyasalPreset = [
          'Alan Hukuk',
          'Alan İktisat',
          'Alan Maliye',
          'Alan Kamu Yönetimi',
          'Alan Uluslararası İlişkiler',
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hedef Puan Paketleri',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ChoiceChip(
                  key: const ValueKey('a_group_preset_p48'),
                  label: const Text('P48 Çekirdek (4 Ders)'),
                  selected: matchesPreset(
                    ExamSelection.defaultAGroupP48Lessons,
                  ),
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      selectedFieldLessons:
                          ExamSelection.defaultAGroupP48Lessons,
                    ),
                  ),
                ),
                ChoiceChip(
                  key: const ValueKey('a_group_preset_siyasal'),
                  label: const Text('Siyasal / Yönetim'),
                  selected: matchesPreset(siyasalPreset),
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(selectedFieldLessons: siyasalPreset),
                  ),
                ),
                ChoiceChip(
                  key: const ValueKey('a_group_preset_all'),
                  label: const Text('Tam 9 Alan'),
                  selected: matchesPreset(
                    ExamTargetPickerView.aGrubuFieldLessons,
                  ),
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      selectedFieldLessons:
                          ExamTargetPickerView.aGrubuFieldLessons,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Alan Bilgisi Derslerini Özelleştir (En az 1)',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: ExamTargetPickerView.aGrubuFieldLessons.map((lesson) {
                final isSelected = activeFields.contains(lesson);
                return FilterChip(
                  key: ValueKey('a_field_$lesson'),
                  label: Text(lesson.replaceFirst('Alan ', '')),
                  selected: isSelected,
                  onSelected: (checked) {
                    final next = List<String>.from(activeFields);
                    if (checked) {
                      if (!next.contains(lesson)) next.add(lesson);
                    } else if (next.length > 1) {
                      next.remove(lesson);
                    }
                    widget.onChanged(
                      selection.copyWith(selectedFieldLessons: next),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
    }
  }
}

enum _BGroupLevelOption {
  lisans2027('Lisans 2027', EducationLevel.lisans, 2027),
  lisans2028('Lisans 2028', EducationLevel.lisans, 2028),
  onlisans('Ön Lisans', EducationLevel.onlisans, 2028),
  ortaogretim('Ortaöğretim', EducationLevel.ortaogretim, 2028);

  final String label;
  final EducationLevel educationLevel;
  final int examCycleYear;

  const _BGroupLevelOption(this.label, this.educationLevel, this.examCycleYear);

  static _BGroupLevelOption fromSelection(ExamSelection selection) {
    if (selection.educationLevel == EducationLevel.onlisans) {
      return _BGroupLevelOption.onlisans;
    }
    if (selection.educationLevel == EducationLevel.ortaogretim) {
      return _BGroupLevelOption.ortaogretim;
    }
    return selection.examCycleYear <= 2027
        ? _BGroupLevelOption.lisans2027
        : _BGroupLevelOption.lisans2028;
  }
}
