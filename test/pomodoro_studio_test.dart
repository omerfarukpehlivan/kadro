import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/pomodoro/presentation/pomodoro_studio_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('PomodoroNotifier Birim Testleri', () {
    test('Başlangıç durumu 25:00 klasik odak ve Lisans hedefi olmalıdır', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(pomodoroProvider);
      expect(state.remainingSeconds, 25 * 60);
      expect(state.formattedTime, '25:00');
      expect(state.isRunning, false);
      expect(state.isBreak, false);
      expect(state.examTarget, KpssExamTarget.lisans);
      expect(state.clockStyle, PomodoroClockStyle.ring);
      expect(state.selectedLesson, 'Tarih');
    });

    test('tick() çağrıldığında süre 1 saniye azalmalıdır', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(pomodoroProvider.notifier);
      notifier.tick();

      final state = container.read(pomodoroProvider);
      expect(state.remainingSeconds, (25 * 60) - 1);
      expect(state.formattedMinutes, '24');
      expect(state.formattedSeconds, '59');
      expect(state.formattedTime, '24:59');
    });

    test('selectPreset(deep50) süreyi 50:00 yapmalıdır', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(pomodoroProvider.notifier);
      notifier.selectPreset(PomodoroPreset.deep50);

      final state = container.read(pomodoroProvider);
      expect(state.remainingSeconds, 50 * 60);
      expect(state.formattedTime, '50:00');
      expect(state.preset, PomodoroPreset.deep50);
    });

    test(
      'selectClockStyle(flip) ve selectExamTarget(onlisans) güncellenmelidir',
      () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(pomodoroProvider.notifier);
        notifier.selectClockStyle(PomodoroClockStyle.flip);
        notifier.selectExamTarget(KpssExamTarget.onlisans);

        final state = container.read(pomodoroProvider);
        expect(state.clockStyle, PomodoroClockStyle.flip);
        expect(state.examTarget, KpssExamTarget.onlisans);
      },
    );

    test(
      'switchPhase(true) mola aşamasına geçirmeli ve süreyi 5:00 yapmalıdır',
      () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(pomodoroProvider.notifier);
        notifier.switchPhase(true);

        final state = container.read(pomodoroProvider);
        expect(state.isBreak, true);
        expect(state.remainingSeconds, 5 * 60);
        expect(state.formattedTime, '05:00');
      },
    );
  });

  group('PomodoroStudioScreen Widget Testleri', () {
    testWidgets(
      'Ekran açıldığında başlık, sayaç ve 3 saat tasarımı seçeneği görünür',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(400, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: PomodoroStudioScreen())),
        );

        await tester.pumpAndSettle();

        expect(find.text('Odak & Sınav Sayacı'), findsOneWidget);
        expect(find.text('25:00'), findsOneWidget);
        expect(find.text('Akademik Halka'), findsOneWidget);
        expect(find.text('Flip Masa Saati'), findsOneWidget);
        expect(find.text('Minimal Zen'), findsOneWidget);
        expect(find.text('Odaklanmayı Başlat'), findsOneWidget);
      },
    );

    testWidgets(
      'Flip Masa Saati seçildiğinde DAKİKA ve SANİYE yaprakları çizilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(400, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: PomodoroStudioScreen())),
        );

        await tester.pumpAndSettle();

        // Flip Masa Saati çipine tıkla
        await tester.tap(find.text('Flip Masa Saati'));
        await tester.pumpAndSettle();

        expect(find.text('DAKİKA'), findsOneWidget);
        expect(find.text('SANİYE'), findsOneWidget);
      },
    );

    testWidgets(
      'Sınav Geri Sayımı sekmesine geçildiğinde 4lü sayaç kutuları çizilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(400, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: PomodoroStudioScreen())),
        );

        await tester.pumpAndSettle();

        // Sınav Geri Sayımı sekmesine geç
        await tester.tap(find.text('Sınav Geri Sayımı'));
        await tester.pumpAndSettle();

        expect(find.text('GÜN'), findsOneWidget);
        expect(find.text('SAAT'), findsOneWidget);
        expect(find.text('DAKİKA'), findsOneWidget);
        expect(find.text('SANİYE'), findsOneWidget);
        expect(find.text('2026 KPSS Lisans (GY-GK)'), findsOneWidget);
        expect(find.text('Hemen Pomodoro Başlat'), findsOneWidget);
      },
    );

    testWidgets(
      'Yatay ekran boyutunda (Landscape StandBy) taşmasız render edilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1600, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: PomodoroStudioScreen())),
        );

        await tester.pumpAndSettle();

        // Yatay ekranda Dikey Mod butonu ve dev saat yüzü bulunmalı
        expect(find.text('Dikey Mod'), findsOneWidget);
        expect(find.text('ODAK ZAMANI'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'HomeScreen üzerindeki Pomodoro bannerı tıklanınca stüdyo açılır',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: HomeScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // KPSS 2026 banner'ı görünmeli
        expect(find.textContaining('KPSS 2026:'), findsOneWidget);
        expect(find.text('Sayaç'), findsOneWidget);

        // Sayaç butonuna basınca stüdyo açılmalı
        await tester.tap(find.text('Sayaç'));
        await tester.pumpAndSettle();

        expect(find.byType(PomodoroStudioScreen), findsOneWidget);
      },
    );

    testWidgets(
      'PracticeHubScreen üzerindeki Pomodoro kartı tıklanınca stüdyo açılır',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: PracticeHubScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // Kartı bulmak için aşağı kaydır
        final pomodoroCardFinder = find.text('Pomodoro & Sınav Sayacı');
        await tester.scrollUntilVisible(pomodoroCardFinder, 200);
        await tester.pumpAndSettle();

        expect(pomodoroCardFinder, findsOneWidget);
        expect(find.text('Flip & Halka Saat'), findsOneWidget);

        // Karta tıkla
        await tester.tap(pomodoroCardFinder);
        await tester.pumpAndSettle();

        expect(find.byType(PomodoroStudioScreen), findsOneWidget);
      },
    );
  });
}
