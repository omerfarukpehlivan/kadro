import 'package:flutter/material.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
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

  /// Seçili aile veya hızlı dönem kartına tek tıkla onay davranışı bağlamak için.
  final ValueChanged<ExamSelection>? onQuickPresetTap;

  /// ÖSYM standart 5 hızlı profil kartını alt bölümde gösterip göstermeyeceği.
  final bool showQuickPresets;

  const ExamTargetPickerView({
    super.key,
    required this.value,
    required this.onChanged,
    this.onQuickPresetTap,
    this.showQuickPresets = true,
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
  final TextEditingController _oabtSearchController = TextEditingController();
  String _oabtQuery = '';

  @override
  void dispose() {
    _oabtSearchController.dispose();
    super.dispose();
  }

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

  String _normalizeTurkish(String input) {
    return input
        .toLowerCase()
        .replaceAll('ç', 'c')
        .replaceAll('ğ', 'g')
        .replaceAll('ı', 'i')
        .replaceAll('ö', 'o')
        .replaceAll('ş', 's')
        .replaceAll('ü', 'u');
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
        Text(
          '1. Sınav Ailesi',
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: KpssExamFamily.values.map((family) {
              final isSelected = selection.family == family;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  key: ValueKey('picker_family_${family.key}'),
                  avatar: PhosphorIcon(
                    _familyIcon(family),
                    size: 16,
                    color: isSelected
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.onSurfaceVariant,
                  ),
                  label: Text(family.shortLabel),
                  selected: isSelected,
                  onSelected: (_) => _selectFamily(family),
                ),
              );
            }).toList(),
          ),
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

        if (widget.showQuickPresets) ...[
          const SizedBox(height: 16),
          Text(
            'Hızlı ÖSYM Dönem Profilleri',
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          ...KpssExamTarget.values.map((target) {
            final presetSelection = ExamSelection.fromLegacyTarget(target);
            final isSelected =
                selection.family == presetSelection.family &&
                selection.educationLevel == presetSelection.educationLevel &&
                selection.examCycleYear == presetSelection.examCycleYear &&
                selection.bGroupProfile == presetSelection.bGroupProfile;
            final targetRemaining = presetSelection.detailedRemaining();

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TactileCard(
                onTap: () {
                  if (widget.onQuickPresetTap != null) {
                    widget.onQuickPresetTap!(presetSelection);
                  } else {
                    widget.onChanged(presetSelection);
                  }
                },
                backgroundColor: isSelected
                    ? colorScheme.primaryContainer.withAlpha(75)
                    : colorScheme.surface,
                borderColor: isSelected
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 11,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            target.title,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${target.subtitle} · ${targetRemaining.formattedRemaining}',
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
                      size: 18,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ],
    );
  }

  Widget _buildFamilyOptions(BuildContext context, ExamSelection selection) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    switch (selection.family) {
      case KpssExamFamily.bGrubu:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Öğrenim Düzeyi ve Dönem',
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
                  label: const Text('Lisans 2027'),
                  selected:
                      selection.educationLevel == EducationLevel.lisans &&
                      selection.examCycleYear <= 2027,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      educationLevel: EducationLevel.lisans,
                      examCycleYear: 2027,
                    ),
                  ),
                ),
                ChoiceChip(
                  label: const Text('Lisans 2028'),
                  selected:
                      selection.educationLevel == EducationLevel.lisans &&
                      selection.examCycleYear >= 2028,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      educationLevel: EducationLevel.lisans,
                      examCycleYear: 2028,
                    ),
                  ),
                ),
                ChoiceChip(
                  label: const Text('Ön Lisans'),
                  selected: selection.educationLevel == EducationLevel.onlisans,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      educationLevel: EducationLevel.onlisans,
                      examCycleYear: 2028,
                    ),
                  ),
                ),
                ChoiceChip(
                  label: const Text('Ortaöğretim'),
                  selected:
                      selection.educationLevel == EducationLevel.ortaogretim,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      educationLevel: EducationLevel.ortaogretim,
                      examCycleYear: 2028,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Sınav Kapsamı',
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
                  key: const ValueKey('b_profile_only_gk'),
                  label: Text(BGroupProfile.onlyGk.label),
                  selected: selection.bGroupProfile == BGroupProfile.onlyGk,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(bGroupProfile: BGroupProfile.onlyGk),
                  ),
                ),
                ChoiceChip(
                  key: const ValueKey('b_profile_full_gygk'),
                  label: Text(BGroupProfile.fullGyGk.label),
                  selected: selection.bGroupProfile == BGroupProfile.fullGyGk,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(bGroupProfile: BGroupProfile.fullGyGk),
                  ),
                ),
              ],
            ),
          ],
        );

      case KpssExamFamily.ekpss:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Öğrenim Düzeyi',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: EducationLevel.values.map((level) {
                return ChoiceChip(
                  label: Text(level.label),
                  selected: selection.educationLevel == level,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(educationLevel: level),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Text(
              'E-KPSS Kitapçık & Engel Grubu',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: DisabilityGroup.values.map((group) {
                return ChoiceChip(
                  key: ValueKey('ekpss_group_${group.key}'),
                  label: Text(group.label),
                  selected: selection.disabilityGroup == group,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      disabilityGroup: group,
                      includeExtraTime: group.standardExtraMinutes > 0
                          ? true
                          : selection.includeExtraTime,
                    ),
                  ),
                );
              }).toList(),
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DHBT-2 Öğrenim Düzeyi',
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
                  label: const Text('Ortaöğretim (İHL)'),
                  selected:
                      selection.educationLevel == EducationLevel.ortaogretim,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(
                      educationLevel: EducationLevel.ortaogretim,
                    ),
                  ),
                ),
                ChoiceChip(
                  label: const Text('Ön Lisans'),
                  selected: selection.educationLevel == EducationLevel.onlisans,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(educationLevel: EducationLevel.onlisans),
                  ),
                ),
                ChoiceChip(
                  label: const Text('Lisans'),
                  selected: selection.educationLevel == EducationLevel.lisans,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(educationLevel: EducationLevel.lisans),
                  ),
                ),
              ],
            ),
          ],
        );

      case KpssExamFamily.mebAgs:
        final normalizedQuery = _normalizeTurkish(_oabtQuery.trim());
        final filteredBranches = OabtBranch.officialOabtBranches
            .where(
              (b) =>
                  normalizedQuery.isEmpty ||
                  _normalizeTurkish(b.label).contains(normalizedQuery) ||
                  b.key.contains(normalizedQuery),
            )
            .toList(growable: false);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MEB-AGS Puan Türü & 2. Oturum',
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
                  key: const ValueKey('ags_mode_p1'),
                  label: const Text('Yalnızca AGS (P1)'),
                  selected: selection.oabtBranch == OabtBranch.none,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(oabtBranch: OabtBranch.none),
                  ),
                ),
                ChoiceChip(
                  key: const ValueKey('ags_mode_p3'),
                  label: const Text('AGS + YDS Dil (P3)'),
                  selected: selection.oabtBranch == OabtBranch.ydsDil,
                  onSelected: (_) => widget.onChanged(
                    selection.copyWith(oabtBranch: OabtBranch.ydsDil),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '17 ÖABT Branşından Seç (AGS-P2)',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              key: const ValueKey('oabt_search_field'),
              controller: _oabtSearchController,
              decoration: InputDecoration(
                hintText: 'ÖABT branşı ara (ör. Matematik, Fizik, Sınıf)...',
                prefixIcon: const PhosphorIcon(
                  PhosphorIconsRegular.magnifyingGlass,
                  size: 18,
                ),
                isDense: true,
                suffixIcon: _oabtQuery.isNotEmpty
                    ? IconButton(
                        icon: const PhosphorIcon(
                          PhosphorIconsRegular.x,
                          size: 16,
                        ),
                        onPressed: () {
                          _oabtSearchController.clear();
                          setState(() => _oabtQuery = '');
                        },
                      )
                    : null,
              ),
              onChanged: (val) => setState(() => _oabtQuery = val),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 168),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: filteredBranches.map((branch) {
                    final isSelected = selection.oabtBranch == branch;
                    return ChoiceChip(
                      key: ValueKey('oabt_branch_${branch.key}'),
                      label: Text(
                        '${branch.label} (${branch.durationMinutes} dk)',
                      ),
                      selected: isSelected,
                      onSelected: (_) => widget.onChanged(
                        selection.copyWith(oabtBranch: branch),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
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
