import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _PresetStudyStatsNotifier extends StudyStatsNotifier {
  final StudyStatsState preset;

  _PresetStudyStatsNotifier(this.preset);

  @override
  StudyStatsState build() => preset;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('UI/UX Pro Max Denetim & İyileştirme Testleri', () {
    testWidgets(
      'AppTopBar toplam çözülen yerine günlük soru hedefi sayacını gösterir ve TugrulAvatar yardım çekmecesini açar',
      (WidgetTester tester) async {
        const presetStats = StudyStatsState(
          totalSolved: 150,
          dailySolvedCount: 7,
          dailyGoal: 30,
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              studyStatsProvider.overrideWith(
                () => _PresetStudyStatsNotifier(presetStats),
              ),
            ],
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(appBar: AppTopBar(title: 'Ana Sayfa')),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('7/30'), findsOneWidget);
        expect(find.text('150/30'), findsNothing);

        final avatar = find.descendant(
          of: find.byType(AppTopBar),
          matching: find.byType(TugrulAvatar),
        );
        expect(avatar, findsOneWidget);

        await tester.tap(avatar);
        await tester.pumpAndSettle();

        expect(find.text('KPSS Genel Kültür Özeti'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'AuthScreen AutofillGroup ve şifre görünürlük aç/kapa (password-toggle) düğmesini destekler',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(theme: AppTheme.light, home: const AuthScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(AutofillGroup), findsOneWidget);
        final toggleFinder = find.byKey(
          const ValueKey('auth_password_visibility_toggle'),
        );
        expect(toggleFinder, findsOneWidget);

        final passwordFieldBefore = tester.widget<EditableText>(
          find.descendant(
            of: find.widgetWithText(TextFormField, 'Şifre (En az 6 karakter)'),
            matching: find.byType(EditableText),
          ),
        );
        expect(passwordFieldBefore.obscureText, isTrue);

        await tester.tap(toggleFinder);
        await tester.pumpAndSettle();

        final passwordFieldAfter = tester.widget<EditableText>(
          find.descendant(
            of: find.widgetWithText(TextFormField, 'Şifre (En az 6 karakter)'),
            matching: find.byType(EditableText),
          ),
        );
        expect(passwordFieldAfter.obscureText, isFalse);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'OptionTile dokunmatik mobilde şık eleme butonunu doğrudan sunar ve seçili durumda hatasız odaklanır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        var eliminated = false;

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: Scaffold(
              body: Column(
                children: [
                  OptionTile(
                    label: 'A',
                    text: 'Dokunmatik şık metni',
                    status: OptionStatus.selected,
                    onTap: () {},
                    onToggleEliminate: () => eliminated = true,
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final eliminateBtn = find.byKey(const ValueKey('option_eliminate_A'));
        expect(eliminateBtn, findsOneWidget);

        await tester.tap(eliminateBtn);
        await tester.pumpAndSettle();

        expect(eliminated, isTrue);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'ProfileScreen seçili çoklu sınav başlığını dinamik gösterir ve masaüstü 1280x800 iki sütunda taşmasız açılır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // TASK-179: Yalnızca KPSS B Grubu seçilebilir; başlık düzeye göre dinamik değişir.
        const onlisansSelection = ExamSelection(
          family: KpssExamFamily.bGrubu,
          educationLevel: EducationLevel.onlisans,
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  examSelection: onlisansSelection,
                ),
              ),
            ],
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: ProfileScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Scrollbar), findsOneWidget);
        expect(
          find.byKey(const ValueKey('profile_target_exam_tile')),
          findsOneWidget,
        );
        expect(find.text(onlisansSelection.displayTitle), findsWidgets);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'OnboardingScreen 1440x900 masaüstü webde genişliğini sınırlar ve adımlar arası geçişte taşma vermez',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1440, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.dark,
              home: const OnboardingScreen(isMandatory: true),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);

        expect(find.text('Hızlı Başlangıç · Tek Adım'), findsOneWidget);
        expect(find.text('Şimdilik Atla'), findsOneWidget);
        expect(find.text('Sınav & Müfredat'), findsOneWidget);
        await tester.tap(
          find.byKey(const ValueKey('onboarding_customize_button')),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(find.text('Adım 2 / 3'), findsOneWidget);
        expect(find.text('Günde Kaç Dakika Ayırabilirsin?'), findsOneWidget);
        await tester.tap(find.widgetWithText(FilledButton, 'Devam Et'));
        await tester.pumpAndSettle();
        expect(find.text('Adım 3 / 3'), findsOneWidget);
        expect(find.text('Programımı Kur ve Başla'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'StatsScreen BarChart etkileşimli tooltip ve Y ekseni başlıklarıyla render edilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: StatsScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Henüz veri yok'), findsWidgets);
        await tester.scrollUntilVisible(
          find.byType(BarChart),
          200,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.pumpAndSettle();

        final barChart = tester.widget<BarChart>(find.byType(BarChart));
        expect(barChart.data.barTouchData.enabled, isTrue);
        expect(
          barChart.data.titlesData.leftTitles.sideTitles.showTitles,
          isTrue,
        );
        expect(tester.takeException(), isNull);
      },
    );
  });
}
