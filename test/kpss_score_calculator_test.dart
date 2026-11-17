import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  group('KpssScoreCalculator Birim Testleri', () {
    test('4 yanlış 1 doğru kuralıyla ham neti doğru hesaplar', () {
      expect(KpssScoreCalculator.calculateNet(40, 8), closeTo(38.0, 0.001));
      expect(KpssScoreCalculator.calculateNet(41, 3), closeTo(40.25, 0.001));
      expect(KpssScoreCalculator.calculateNet(0, 0), equals(0.0));
    });

    test('Doğru + Yanlış > 60 durumunda sayıları 60 soruya sınırlandırır', () {
      final clamped = KpssScoreCalculator.clampSectionCounts(50, 20);
      expect(clamped.correct, equals(50));
      expect(clamped.wrong, equals(10));
      expect(clamped.empty, equals(0));
      expect(clamped.net, closeTo(47.5, 0.001));

      final negativeClamped = KpssScoreCalculator.clampSectionCounts(-5, 70);
      expect(negativeClamped.correct, equals(0));
      expect(negativeClamped.wrong, equals(60));
      expect(negativeClamped.empty, equals(0));
    });

    test('ÖSYM 1.0 net barajı altında puan hesaplanmaz ve isThresholdMet false döner', () {
      final zeroSummary = KpssScoreCalculator.calculate(
        scoreType: KpssScoreType.p3Lisans,
        gyCorrect: 0,
        gyWrong: 0,
        gkCorrect: 1,
        gkWrong: 1, // 0.75 net (< 1.0)
      );
      expect(zeroSummary.isThresholdMet, isFalse);
      expect(zeroSummary.primaryScore, equals(0.0));
      expect(
        zeroSummary.historicalResults.every((r) => r.score == 0.0),
        isTrue,
      );

      final thresholdMetSummary = KpssScoreCalculator.calculate(
        scoreType: KpssScoreType.p3Lisans,
        gyCorrect: 0,
        gyWrong: 0,
        gkCorrect: 1,
        gkWrong: 0, // 1.0 net (>= 1.0)
      );
      expect(thresholdMetSummary.isThresholdMet, isTrue);
      expect(thresholdMetSummary.primaryScore, greaterThan(50.0));
    });

    test('Lisans (P3) son 3 sınav (2026, 2025, 2024) puanlarını üretir ve 2025 aynı netle 2026 üzerindedir', () {
      final summary = KpssScoreCalculator.calculate(
        scoreType: KpssScoreType.p3Lisans,
        gyCorrect: 40,
        gyWrong: 0,
        gkCorrect: 40,
        gkWrong: 0,
      );

      expect(
        summary.historicalResults.map((e) => e.year).toList(),
        equals([2026, 2025, 2024]),
      );

      final score2026 = summary.historicalResults
          .firstWhere((r) => r.year == 2026)
          .score;
      final score2025 = summary.historicalResults
          .firstWhere((r) => r.year == 2025)
          .score;
      final score2024 = summary.historicalResults
          .firstWhere((r) => r.year == 2024)
          .score;

      expect(score2026, closeTo(84.00, 0.01));
      expect(score2025, greaterThan(score2026));
      expect(score2025, greaterThan(score2024));
    });

    test('Ön Lisans (P93) ve Ortaöğretim (P94) son 3 sınav (2026, 2024, 2022) yıllarını döndürür', () {
      final p93 = KpssScoreCalculator.calculate(
        scoreType: KpssScoreType.p93OnLisans,
        gyCorrect: 35,
        gyWrong: 4,
        gkCorrect: 38,
        gkWrong: 4,
      );
      final p94 = KpssScoreCalculator.calculate(
        scoreType: KpssScoreType.p94Ortaogretim,
        gyCorrect: 35,
        gyWrong: 4,
        gkCorrect: 38,
        gkWrong: 4,
      );

      expect(
        p93.historicalResults.map((e) => e.year).toList(),
        equals([2026, 2024, 2022]),
      );
      expect(
        p94.historicalResults.map((e) => e.year).toList(),
        equals([2026, 2024, 2022]),
      );
      expect(p93.primaryScore, inInclusiveRange(75.0, 90.0));
      expect(p94.primaryScore, inInclusiveRange(75.0, 90.0));
    });

    test('Tam doğru (60 GY + 60 GK) durumunda puan 100.00 ile sınırlanır', () {
      final perfect = KpssScoreCalculator.calculate(
        scoreType: KpssScoreType.p3Lisans,
        gyCorrect: 60,
        gyWrong: 0,
        gkCorrect: 60,
        gkWrong: 0,
      );
      expect(perfect.primaryScore, equals(100.0));
      expect(perfect.historicalResults.every((r) => r.score <= 100.0), isTrue);
    });
  });

  group('KpssScoreCalculatorScreen Widget Testleri', () {
    testWidgets(
      'Puan hesaplama ekranı varsayılan sıfır netlerle 0.00 puan, dropdown seçici ve Son 3 KPSS listesini gösterir',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const KpssScoreCalculatorScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('KPSS Puan Hesaplama'), findsOneWidget);
        expect(
          find.byKey(const ValueKey('score_type_dropdown')),
          findsOneWidget,
        );
        expect(
          tester
              .widget<Text>(
                find.byKey(const ValueKey('kpss_primary_score_text')),
              )
              .data,
          equals('0.00'),
        );
        expect(find.text('KPSS Lisans (P3)'), findsOneWidget);
        expect(find.text("Son 3 KPSS'de Kaç Puan Alırdın?"), findsOneWidget);
        expect(find.text('2026 KPSS'), findsOneWidget);
        expect(find.text('2025 KPSS'), findsOneWidget);
        expect(find.text('2024 KPSS'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'Puan türü dropdown üzerinden P93 / P94 arasında değiştirildiğinde yıllar 2026 · 2024 · 2022 olarak güncellenir',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const KpssScoreCalculatorScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const ValueKey('score_type_dropdown')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const ValueKey('score_type_P93')).last);
        await tester.pumpAndSettle();

        expect(find.text('KPSS Ön Lisans (P93)'), findsOneWidget);
        expect(find.text('2022 KPSS'), findsOneWidget);
        expect(find.text('2025 KPSS'), findsNothing);

        await tester.tap(find.byKey(const ValueKey('score_type_dropdown')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const ValueKey('score_type_P94')).last);
        await tester.pumpAndSettle();

        expect(find.text('KPSS Ortaöğretim (P94)'), findsOneWidget);
        expect(find.text('2022 KPSS'), findsOneWidget);
      },
    );

    testWidgets(
      'Net artırma ve Sıfırla butonları puanı ve baraj uyarısını canlı günceller',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const KpssScoreCalculatorScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final initialScoreText =
            tester
                .widget<Text>(
                  find.byKey(const ValueKey('kpss_primary_score_text')),
                )
                .data ??
            '';
        expect(initialScoreText, equals('0.00'));

        // GK doğru sayısını 0'dan +1 artır (1.00 Net barajını geçer)
        final plusOneFinder = find.byKey(const ValueKey('gk_correct_plus_1'));
        await tester.scrollUntilVisible(plusOneFinder, 200);
        await tester.tap(plusOneFinder);
        await tester.pumpAndSettle();

        final updatedScoreText =
            tester
                .widget<Text>(
                  find.byKey(const ValueKey('kpss_primary_score_text')),
                )
                .data ??
            '';
        expect(updatedScoreText, isNot(equals('0.00')));
        expect(double.parse(updatedScoreText), greaterThan(50.0));

        // Sıfırla butonuna basınca baraj uyarısı ve 0.00 görünmeli
        final resetFinder = find.text('Sıfırla');
        await tester.tap(resetFinder);
        await tester.pumpAndSettle();

        expect(
          tester
              .widget<Text>(
                find.byKey(const ValueKey('kpss_primary_score_text')),
              )
              .data,
          equals('0.00'),
        );
        expect(
          find.textContaining('en az 1.0 ham net çıkarılmalıdır'),
          findsOneWidget,
        );
      },
    );
  });

  group('Uygulama İçi Yönlendirme Testleri', () {
    testWidgets(
      'PracticeHubScreen üzerinden KPSS Puan Hesaplama ekranı açılır',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const Scaffold(body: PracticeHubScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final cardFinder = find.text('KPSS Puan Hesaplama');
        await tester.scrollUntilVisible(cardFinder, 250);
        await tester.tap(cardFinder);
        await tester.pumpAndSettle();

        expect(find.byType(KpssScoreCalculatorScreen), findsOneWidget);
      },
    );

    testWidgets('ExamsScreen üzerinden KPSS Puan Hesaplama Robotu açılır', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const Scaffold(body: ExamsScreen()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final shortcutFinder = find.text('KPSS Puan Hesaplama Robotu');
      await tester.scrollUntilVisible(shortcutFinder, 250);
      await tester.tap(shortcutFinder);
      await tester.pumpAndSettle();

      expect(find.byType(KpssScoreCalculatorScreen), findsOneWidget);
    });
  });
}
