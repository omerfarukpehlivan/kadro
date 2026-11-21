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

        // 1. Başlangıçta B Grubu düzey dropdown'ı görünür; 60/120 kapsam seçicisi yoktur (TASK-166)
        expect(find.byKey(const ValueKey('b_level_dropdown')), findsOneWidget);
        expect(find.byKey(const ValueKey('b_profile_dropdown')), findsNothing);
        expect(find.text('GY-GK · 120 Soru · 130 dk'), findsOneWidget);
        expect(current.bGroupProfile, BGroupProfile.fullGyGk);

        // 2. E-KPSS: engel grubu + ek süre anahtarı
        final familyDropdown = find.byKey(
          const ValueKey('picker_family_dropdown'),
        );
        await tester.ensureVisible(familyDropdown);
        await tester.tap(familyDropdown);
        await tester.pumpAndSettle();
        await tester.tap(
          find
              .byKey(ValueKey('picker_family_${KpssExamFamily.ekpss.key}'))
              .last,
        );
        await tester.pumpAndSettle();

        expect(current.family, KpssExamFamily.ekpss);
        final gormeGroup = DisabilityGroup.values.firstWhere(
          (g) => g.label.toLowerCase().contains('görme'),
        );
        final ekpssGroupDropdown = find.byKey(
          const ValueKey('ekpss_group_dropdown'),
        );
        await tester.ensureVisible(ekpssGroupDropdown);
        await tester.tap(ekpssGroupDropdown);
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(ValueKey('ekpss_group_${gormeGroup.key}')).last,
        );
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
        await tester.ensureVisible(familyDropdown);
        await tester.tap(familyDropdown);
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(ValueKey('picker_family_${KpssExamFamily.dhbt.key}')).last,
        );
        await tester.pumpAndSettle();
        expect(current.family, KpssExamFamily.dhbt);
        final dhbtLevelDropdown = find.byKey(
          const ValueKey('dhbt_level_dropdown'),
        );
        await tester.ensureVisible(dhbtLevelDropdown);
        await tester.tap(dhbtLevelDropdown);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Ortaöğretim (İHL)').last);
        await tester.pumpAndSettle();
        expect(current.educationLevel, EducationLevel.ortaogretim);

        // 4. MEB-AGS + ÖABT branşı ve P3 modu
        await tester.ensureVisible(familyDropdown);
        await tester.tap(familyDropdown);
        await tester.pumpAndSettle();
        await tester.tap(
          find
              .byKey(ValueKey('picker_family_${KpssExamFamily.mebAgs.key}'))
              .last,
        );
        await tester.pumpAndSettle();
        expect(current.family, KpssExamFamily.mebAgs);

        final agsDropdown = find.byKey(
          const ValueKey('meb_ags_branch_dropdown'),
        );
        await tester.ensureVisible(agsDropdown);
        await tester.tap(agsDropdown);
        await tester.pumpAndSettle();

        final turkceBranch = OabtBranch.values.firstWhere(
          (b) => b.label.contains('Türkçe'),
        );
        final turkceItem = find
            .byKey(ValueKey('oabt_branch_${turkceBranch.key}'))
            .last;
        await tester.ensureVisible(turkceItem);
        await tester.tap(turkceItem);
        await tester.pumpAndSettle();
        expect(current.oabtBranch, turkceBranch);

        await tester.tap(agsDropdown);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const ValueKey('ags_mode_p3')).last);
        await tester.pumpAndSettle();
        expect(current.includeYdsForAgsP3, isTrue);

        // 5. A Grubu: ön ayarlar ve çoklu ders seçimi
        await tester.ensureVisible(familyDropdown);
        await tester.tap(familyDropdown);
        await tester.pumpAndSettle();
        await tester.tap(
          find
              .byKey(ValueKey('picker_family_${KpssExamFamily.aGrubu.key}'))
              .last,
        );
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

        final familyDropdown = find.byKey(
          const ValueKey('picker_family_dropdown'),
        );
        await tester.ensureVisible(familyDropdown);
        await tester.tap(familyDropdown);
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(ValueKey('picker_family_${KpssExamFamily.dhbt.key}')).last,
        );
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
