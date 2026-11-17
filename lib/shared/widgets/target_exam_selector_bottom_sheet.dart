import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/exam_target_picker_view.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kullanıcının hazırlandığı KPSS / MEB-AGS sınavını ve tüm boyutlarını
/// seçmesini veya değiştirmesini sağlayan alt menü (Bottom Sheet).
///
/// Web/Angular Karşılığı: Çok boyutlu `ExamSelection` seçicisini barındıran
/// `TargetExamSelectorModalComponent`.
class TargetExamSelectorBottomSheet extends ConsumerStatefulWidget {
  final KpssExamTarget? selectedTarget;
  final ExamSelection? selectedSelection;
  final bool returnExamSelection;

  const TargetExamSelectorBottomSheet({
    super.key,
    this.selectedTarget,
    this.selectedSelection,
    this.returnExamSelection = false,
  });

  /// Eski tek boyutlu `KpssExamTarget` sözleşmesiyle geriye dönük uyumlu modal açıcı.
  static Future<KpssExamTarget?> show(
    BuildContext context, {
    KpssExamTarget? currentTarget,
  }) {
    return AdaptiveOverlay.showModal<KpssExamTarget>(
      context: context,
      dialogMaxWidth: 680,
      builder: (_) => TargetExamSelectorBottomSheet(
        selectedTarget: currentTarget,
        returnExamSelection: false,
      ),
    );
  }

  /// Çok boyutlu [ExamSelection] sonucu döndüren modern modal açıcı.
  static Future<ExamSelection?> showSelection(
    BuildContext context, {
    ExamSelection? currentSelection,
  }) {
    return AdaptiveOverlay.showModal<ExamSelection>(
      context: context,
      dialogMaxWidth: 680,
      builder: (_) => TargetExamSelectorBottomSheet(
        selectedSelection: currentSelection,
        returnExamSelection: true,
      ),
    );
  }

  /// Seçilen çok boyutlu [ExamSelection] değerini tercih ve çalışma
  /// planlayıcısı arasında kayıpsız senkronize eder.
  static void applySelection(WidgetRef ref, ExamSelection selection) {
    final prevPrefs = ref.read(userPreferencesProvider);
    ref.read(userPreferencesProvider.notifier).setExamSelection(selection);

    if (prevPrefs.hasActiveStudyProgram &&
        selection.scopeKey != prevPrefs.examSelection.scopeKey) {
      final newCurriculum = CurriculumRegistry.resolve(selection);
      ref
          .read(studyPlannerProvider.notifier)
          .adaptCurriculumScope(
            newSelection: selection,
            newCurriculum: newCurriculum,
            pace: prevPrefs.studyProgramPace,
          );
    }
  }

  @override
  ConsumerState<TargetExamSelectorBottomSheet> createState() =>
      _TargetExamSelectorBottomSheetState();
}

class _TargetExamSelectorBottomSheetState
    extends ConsumerState<TargetExamSelectorBottomSheet> {
  late ExamSelection _draftSelection;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(userPreferencesProvider);
    _draftSelection =
        widget.selectedSelection ??
        (widget.selectedTarget != null
            ? ExamSelection.fromLegacyTarget(widget.selectedTarget!)
            : prefs.examSelection);
  }

  void _applyAndClose(ExamSelection selection) {
    TargetExamSelectorBottomSheet.applySelection(ref, selection);
    final legacy = selection.toLegacyTarget();

    Navigator.of(context)
        .pop<Object>(widget.returnExamSelection ? selection : legacy);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.85;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          14,
          20,
          MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Başlık ve Açıklama
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KPSS Sınav Hedefini Seç',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Müfredatın, geri sayım sayacın ve çalışma planın bu seçime göre kurulur.',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const PhosphorIcon(PhosphorIconsRegular.x, size: 20),
                  tooltip: 'Kapat',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Kaydırılabilir Çok Boyutlu Seçim Alanı
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ExamTargetPickerView(
                      value: _draftSelection,
                      onChanged: (next) =>
                          setState(() => _draftSelection = next),
                    ),
                    const SizedBox(height: 6),

                    // ÖSYM Resmi Takvim Bilgilendirme Notu
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsRegular.info,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              KpssExamTarget.osymDisclaimer,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                height: 1.35,
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
            const SizedBox(height: 12),
            FilledButton.icon(
              key: const ValueKey('exam_selector_confirm_button'),
              onPressed: () => _applyAndClose(_draftSelection),
              icon: const PhosphorIcon(PhosphorIconsFill.checkCircle, size: 18),
              label: const Text('Seçili Sınav Hedefini Uygula'),
            ),
          ],
        ),
      ),
    );
  }
}
