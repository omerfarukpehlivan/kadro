import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ResponsiveBreakpoints Birim Testleri', () {
    testWidgets('Kompakt telefon (360x640) kırılım değerleri doğru olmalı', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 640);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(ResponsiveBreakpoints.isCompact(context), isTrue);
              expect(ResponsiveBreakpoints.isTablet(context), isFalse);
              expect(
                ResponsiveBreakpoints.horizontalPadding(context),
                equals(12.0),
              );
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('Standart telefon (400x850) kırılım değerleri doğru olmalı', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 850);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(ResponsiveBreakpoints.isCompact(context), isFalse);
              expect(ResponsiveBreakpoints.isTablet(context), isFalse);
              expect(
                ResponsiveBreakpoints.horizontalPadding(context),
                equals(16.0),
              );
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('Tablet ekranında (800x1280) kırılım değerleri doğru olmalı', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1280);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(ResponsiveBreakpoints.isCompact(context), isFalse);
              expect(ResponsiveBreakpoints.isTablet(context), isTrue);
              expect(
                ResponsiveBreakpoints.horizontalPadding(context),
                equals(24.0),
              );
              return const SizedBox();
            },
          ),
        ),
      );
    });
  });

  group('ResponsiveContentWrapper Widget Testleri', () {
    testWidgets(
      'Tablet ekranında (1000px genişlik) içeriğin genişliğini maksimum 720px ile sınırlandırmalı',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ResponsiveContentWrapper(
                child: Text('Geniş Ekran Test İçeriği'),
              ),
            ),
          ),
        );

        final wrapperFinder = find.byType(ResponsiveContentWrapper);
        expect(wrapperFinder, findsOneWidget);

        final box = tester.widget<ConstrainedBox>(
          find.descendant(
            of: wrapperFinder,
            matching: find.byType(ConstrainedBox),
          ),
        );
        expect(box.constraints.maxWidth, equals(720));
      },
    );
  });

  group('Kompakt Ekran Sıfır Taşma (Zero Overflow) Testleri', () {
    testWidgets('HomeScreen 360x640 kompakt ekranda taşma olmadan çizilmeli', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 640);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: HomeScreen())),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Hoş geldin'), findsOneWidget);
      expect(find.text('Hedef Takibi'), findsOneWidget);

      // Aşağı kaydırarak akıllı hatırlatıcıları görüntüle
      await tester.scrollUntilVisible(
        find.text('Çalışma Planı'),
        150,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Görev & Durum Hatırlatıcıları'), findsOneWidget);
      expect(find.text('Çalışma Planı'), findsOneWidget);

      // RenderFlex overflow hatası olmadığını doğrula
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'PracticeHubScreen 360x640 kompakt ekranda taşma olmadan çizilmeli',
      (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: PracticeHubScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Çalışma Türleri'), findsOneWidget);
        expect(find.text('ANTRENMAN SAHASI'), findsOneWidget);
        expect(find.text('Çalışma türleri'), findsOneWidget);
        expect(find.text('Konu testi'), findsOneWidget);

        // Aşağı kaydırarak çeldirici avı ve mini oyunları görüntüle
        await tester.scrollUntilVisible(
          find.text('ÖSYM Çeldirici Avı'),
          150,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text('ÖSYM Çeldirici Avı'), findsOneWidget);

        await tester.scrollUntilVisible(
          find.text('Hızlı Tekrar & Refleks Antrenmanı'),
          150,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text('Hızlı Tekrar & Refleks Antrenmanı'), findsOneWidget);

        // RenderFlex overflow hatası olmadığını doğrula
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('QuizScreen 360x640 kompakt ekranda taşma olmadan çizilmeli', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 640);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      const sampleQuestion = Question(
        id: 'q_compact_test',
        lesson: 'Tarih',
        topic: 'İslamiyet Öncesi Türk Tarihi',
        text: 'Aşağıdakilerden hangisi İslamiyet öncesi Türk devletlerinde hükümdara verilen unvanlar arasında yer almaz?',
        options: ['Kağan', 'Hakan', 'Sultan', 'Yabgu', 'İlteriş'],
        correctIndex: 2,
        explanation: 'Sultan unvanı ilk kez Gazneli Mahmud tarafından Türk-İslam döneminde kullanılmıştır.',
      );

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: QuizScreen(questions: [sampleQuestion])),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Kağan'), findsOneWidget);
      expect(find.text('Sultan'), findsOneWidget);

      // RenderFlex overflow hatası olmadığını doğrula
      expect(tester.takeException(), isNull);
    });
  });
}
