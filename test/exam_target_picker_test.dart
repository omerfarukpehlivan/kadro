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

  group('ExamTargetPickerView & KPSS B Grubu Sınav Kilidi (TASK-179)', () {
    testWidgets(
      'Yalnızca KPSS B Grubu seçilebilir; diğer 4 sınav kilitli olup bakım mesajı gösterir',
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

        // B Grubu öğrenim düzeyi değiştirilebilir (Ön Lisans)
        final bLevelDropdown = find.byKey(const ValueKey('b_level_dropdown'));
        await tester.ensureVisible(bLevelDropdown);
        await tester.tap(bLevelDropdown);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Ön Lisans').last);
        await tester.pumpAndSettle();
        expect(current.family, KpssExamFamily.bGrubu);
        expect(current.educationLevel, EducationLevel.onlisans);

        // 2. Kilitli aileler (E-KPSS, DHBT, MEB-AGS, A Grubu) "Çok Yakında" rozeti taşır;
        // tıklandığında seçimi değiştirmez ve bakım/geliştirme uyarısı gösterir
        final familyDropdown = find.byKey(
          const ValueKey('picker_family_dropdown'),
        );
        for (final lockedFamily in const [
          KpssExamFamily.ekpss,
          KpssExamFamily.dhbt,
          KpssExamFamily.mebAgs,
          KpssExamFamily.aGrubu,
        ]) {
          await tester.ensureVisible(familyDropdown);
          await tester.tap(familyDropdown);
          await tester.pumpAndSettle();

          expect(find.text('Çok Yakında'), findsNWidgets(4));

          await tester.tap(
            find.byKey(ValueKey('picker_family_${lockedFamily.key}')).last,
          );
          await tester.pumpAndSettle();

          expect(current.family, KpssExamFamily.bGrubu);
          expect(current.educationLevel, EducationLevel.onlisans);
          expect(
            find.byKey(const ValueKey('picker_locked_family_banner')),
            findsOneWidget,
          );
          expect(
            find.text(KpssExamFamily.lockedMaintenanceMessage),
            findsOneWidget,
          );
          expect(find.text('${lockedFamily.label} · Kilitli'), findsOneWidget);
        }
      },
    );

    testWidgets(
      'TargetExamSelectorBottomSheet kilitli sınavı engeller ve aktif B Grubu seçimini uygular',
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
        expect(
          find.byKey(const ValueKey('picker_locked_family_banner')),
          findsOneWidget,
        );

        final bLevelDropdown = find.byKey(const ValueKey('b_level_dropdown'));
        await tester.ensureVisible(bLevelDropdown);
        await tester.tap(bLevelDropdown);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Ortaöğretim').last);
        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(const ValueKey('exam_selector_confirm_button')),
        );
        await tester.pumpAndSettle();

        expect(returned?.family, KpssExamFamily.bGrubu);
        expect(returned?.educationLevel, EducationLevel.ortaogretim);
        expect(
          container.read(userPreferencesProvider).examSelection.family,
          KpssExamFamily.bGrubu,
        );
        expect(
          container.read(userPreferencesProvider).examSelection.educationLevel,
          EducationLevel.ortaogretim,
        );
      },
    );
  });
}
