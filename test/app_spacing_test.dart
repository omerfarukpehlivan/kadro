import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppSpacing Design Token Birim Testleri', () {
    test('Temel scalar token değerleri 8pt/4pt mimarisine uygun olmalı', () {
      expect(AppSpacing.xxs, equals(4.0));
      expect(AppSpacing.xs, equals(8.0));
      expect(AppSpacing.sm, equals(12.0));
      expect(AppSpacing.md, equals(16.0));
      expect(AppSpacing.lg, equals(20.0));
      expect(AppSpacing.xl, equals(24.0));
      expect(AppSpacing.xxl, equals(32.0));
    });

    test('Kart ve konteyner dolgu token değerleri doğru olmalı', () {
      expect(AppSpacing.cardPadding, equals(const EdgeInsets.all(16.0)));
      expect(AppSpacing.cardPaddingCompact, equals(const EdgeInsets.all(12.0)));
      expect(
        AppSpacing.cardMarginBottom,
        equals(const EdgeInsets.only(bottom: 12.0)),
      );
    });

    test(
      'Dikey ve yatay gap SizedBox boyutları token değerleriyle eşleşmeli',
      () {
        expect(AppSpacing.gapXs.height, equals(8.0));
        expect(AppSpacing.gapSm.height, equals(12.0));
        expect(AppSpacing.gapMd.height, equals(16.0));
        expect(AppSpacing.gapLg.height, equals(20.0));
        expect(AppSpacing.gapXl.height, equals(24.0));
        expect(AppSpacing.gapXxl.height, equals(32.0));

        expect(AppSpacing.gapHorizontalXs.width, equals(8.0));
        expect(AppSpacing.gapHorizontalSm.width, equals(12.0));
        expect(AppSpacing.gapHorizontalMd.width, equals(16.0));
        expect(AppSpacing.gapHorizontalLg.width, equals(20.0));
      },
    );
  });

  group('AppSpacing.pagePadding Zero-Shift Testleri', () {
    testWidgets(
      'Kompakt ekranda (360x640) dikey 16px, yatay 12px dolgu vermeli',
      (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final padding = AppSpacing.pagePadding(context);
                expect(padding.left, equals(12.0));
                expect(padding.right, equals(12.0));
                expect(padding.top, equals(16.0));
                expect(padding.bottom, equals(16.0));
                return const SizedBox();
              },
            ),
          ),
        );
      },
    );

    testWidgets(
      'Standart ekranda (400x850) dikey 16px, yatay 16px dolgu vermeli',
      (tester) async {
        tester.view.physicalSize = const Size(400, 850);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final padding = AppSpacing.pagePadding(context);
                expect(padding.left, equals(16.0));
                expect(padding.right, equals(16.0));
                expect(padding.top, equals(16.0));
                expect(padding.bottom, equals(16.0));
                return const SizedBox();
              },
            ),
          ),
        );
      },
    );

    testWidgets('Tablette (800x1280) dikey 16px, yatay 24px dolgu vermeli', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1280);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final padding = AppSpacing.pagePadding(context);
              expect(padding.left, equals(24.0));
              expect(padding.right, equals(24.0));
              expect(padding.top, equals(16.0));
              expect(padding.bottom, equals(16.0));
              return const SizedBox();
            },
          ),
        ),
      );
    });
  });

  group('5 Ana Tab Ekranı Zero Overflow & Spacing Render Testleri', () {
    testWidgets(
      'HomeScreen AppSpacing ile hatasız ve taşmasız render edilmeli',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: HomeScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Hoş geldin'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'LessonsScreen AppSpacing ile hatasız ve taşmasız render edilmeli',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('KPSS Genel Kültür'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'ExamsScreen AppSpacing ile hatasız ve taşmasız render edilmeli',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: ExamsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Deneme sınavları'), findsOneWidget);
        expect(find.text('Sınav düzeni'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'StatsScreen AppSpacing ile hatasız ve taşmasız render edilmeli',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: StatsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('İstatistiklerin'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'ProfileScreen AppSpacing ile hatasız ve taşmasız render edilmeli',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: ProfileScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Profilin'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });

  group('TASK-74 Dikey Hizalama & Kenar Kılavuz Çizgisi Testleri', () {
    testWidgets(
      'Standart telefonda (390x844) AppTopBar sol avatarı ve sağ PRO rozeti, gövdedeki MascotCoachBanner ile milimetrik hizada (16px) olmalı',
      (tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                appBar: AppTopBar(title: 'Ana Sayfa'),
                body: HomeScreen(),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // 1. AppTopBar sol avatar Container'ının sol başlangıç X koordinatı 16.0 olmalı
        final topBarRowFinder = find
            .descendant(of: find.byType(AppTopBar), matching: find.byType(Row))
            .first;
        final avatarContainerFinder = find
            .descendant(of: topBarRowFinder, matching: find.byType(Container))
            .first;
        final avatarTopLeft = tester.getTopLeft(avatarContainerFinder);
        expect(avatarTopLeft.dx, equals(16.0));

        // 2. AppTopBar sağ PRO rozetinin sağ bitiş X koordinatı 390.0 - 16.0 = 374.0 olmalı
        final proFinder = find.text('PRO');
        expect(proFinder, findsOneWidget);
        final proContainerFinder = find
            .ancestor(of: proFinder, matching: find.byType(Container))
            .first;
        final proTopRight = tester.getTopRight(proContainerFinder);
        expect(proTopRight.dx, equals(374.0));

        // 3. Gövdedeki ilk MascotCoachBanner kartının sol başlangıç X koordinatı 16.0 ve sağ bitişi 374.0 olmalı
        final bannerFinder = find.byType(MascotCoachBanner).first;
        final bannerTopLeft = tester.getTopLeft(bannerFinder);
        final bannerTopRight = tester.getTopRight(bannerFinder);
        expect(bannerTopLeft.dx, equals(16.0));
        expect(bannerTopRight.dx, equals(374.0));

        expect(tester.takeException(), isNull);
      },
    );
  });
}
