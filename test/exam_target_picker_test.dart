import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/exam_target_picker_view.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('ExamTargetPickerView & Çoklu Sınav Seçimi', () {
    testWidgets(
      '5 sınav ailesi arasında geçiş yapar ve koşullu alanları gösterir',
      (tester) async {
        tester.view.physicalSize = const Size(430, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        ExamSelection current = const ExamSelection();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ExamTargetPickerView(
                      value: current,
                      onChanged: (next) => setState(() => current = next),
                    );
                  },
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // 1. Başlangıçta B Grubu görünür
        expect(find.byKey(const ValueKey('b_profile_only_gk')), findsOneWidget);
        expect(
          find.byKey(const ValueKey('b_profile_full_gygk')),
          findsOneWidget,
        );

        await tester.tap(find.byKey(const ValueKey('b_profile_only_gk')));
        await tester.pumpAndSettle();
        expect(current.bGroupProfile, BGroupProfile.onlyGk);

        // 2. E-KPSS: engel grubu + ek süre anahtarı
        final ekpssChip = find.byKey(
          ValueKey('picker_family_${KpssExamFamily.ekpss.key}'),
        );
        await tester.ensureVisible(ekpssChip);
        await tester.tap(ekpssChip);
        await tester.pumpAndSettle();

        expect(current.family, KpssExamFamily.ekpss);
        final gormeGroup = DisabilityGroup.values.firstWhere(
          (g) => g.label.toLowerCase().contains('görme'),
        );
        final gormeChip = find.byKey(ValueKey('ekpss_group_${gormeGroup.key}'));
        await tester.ensureVisible(gormeChip);
        await tester.tap(gormeChip);
        await tester.pumpAndSettle();
        expect(current.disabilityGroup, gormeGroup);

        final extraTimeSwitch = find.byKey(
          const ValueKey('ekpss_extra_time_switch'),
        );
        await tester.ensureVisible(extraTimeSwitch);
        await tester.tap(extraTimeSwitch);
        await tester.pumpAndSettle();
        expect(current.includeExtraTime, isTrue);

        // 3. DHBT: 3 öğrenim düzeyi
        final dhbtChip = find.byKey(
          ValueKey('picker_family_${KpssExamFamily.dhbt.key}'),
        );
        await tester.ensureVisible(dhbtChip);
        await tester.tap(dhbtChip);
        await tester.pumpAndSettle();
        expect(current.family, KpssExamFamily.dhbt);
        final ihlChip = find.text('Ortaöğretim (İHL)');
        await tester.ensureVisible(ihlChip);
        await tester.tap(ihlChip);
        await tester.pumpAndSettle();
        expect(current.educationLevel, EducationLevel.ortaogretim);

        // 4. MEB-AGS + ÖABT arama ve P3 modu
        final agsChip = find.byKey(
          ValueKey('picker_family_${KpssExamFamily.mebAgs.key}'),
        );
        await tester.ensureVisible(agsChip);
        await tester.tap(agsChip);
        await tester.pumpAndSettle();
        expect(current.family, KpssExamFamily.mebAgs);

        final searchField = find.byKey(const ValueKey('oabt_search_field'));
        await tester.ensureVisible(searchField);
        await tester.enterText(searchField, 'Türkçe');
        await tester.pumpAndSettle();

        final turkceBranch = OabtBranch.values.firstWhere(
          (b) => b.label.contains('Türkçe'),
        );
        final turkceChip = find.byKey(
          ValueKey('oabt_branch_${turkceBranch.key}'),
        );
        await tester.ensureVisible(turkceChip);
        await tester.tap(turkceChip);
        await tester.pumpAndSettle();
        expect(current.oabtBranch, turkceBranch);

        final p3Chip = find.byKey(const ValueKey('ags_mode_p3'));
        await tester.ensureVisible(p3Chip);
        await tester.tap(p3Chip);
        await tester.pumpAndSettle();
        expect(current.includeYdsForAgsP3, isTrue);

        // 5. A Grubu: ön ayarlar ve çoklu ders seçimi
        final aChip = find.byKey(
          ValueKey('picker_family_${KpssExamFamily.aGrubu.key}'),
        );
        await tester.ensureVisible(aChip);
        await tester.tap(aChip);
        await tester.pumpAndSettle();
        expect(current.family, KpssExamFamily.aGrubu);

        final siyasalPreset = find.byKey(
          const ValueKey('a_group_preset_siyasal'),
        );
        await tester.ensureVisible(siyasalPreset);
        await tester.tap(siyasalPreset);
        await tester.pumpAndSettle();
        expect(
          current.selectedFieldLessons,
          contains('Alan Uluslararası İlişkiler'),
        );
      },
    );

    testWidgets(
      'TargetExamSelectorBottomSheet seçimi provider stateine uygular',
      (tester) async {
        tester.view.physicalSize = const Size(430, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        late ProviderContainer container;
        ExamSelection? returned;

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Consumer(
                builder: (context, ref, _) {
                  container = ProviderScope.containerOf(context);
                  return Scaffold(
                    body: Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          returned =
                              await TargetExamSelectorBottomSheet.showSelection(
                                context,
                                currentSelection: ref
                                    .read(userPreferencesProvider)
                                    .examSelection,
                              );
                        },
                        child: const Text('Ac'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Ac'));
        await tester.pumpAndSettle();

        final dhbtChip = find.byKey(
          ValueKey('picker_family_${KpssExamFamily.dhbt.key}'),
        );
        await tester.ensureVisible(dhbtChip);
        await tester.tap(dhbtChip);
        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(const ValueKey('exam_selector_confirm_button')),
        );
        await tester.pumpAndSettle();

        expect(returned?.family, KpssExamFamily.dhbt);
        expect(
          container.read(userPreferencesProvider).examSelection.family,
          KpssExamFamily.dhbt,
        );
      },
    );
  });
}
