import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

void main() {
  group('QuizScreen Widget Testleri', () {
    testWidgets(
      'İlk açılışta Cevabı Onayla butonu pasif olmalı ve Çözüm Açıklaması görünmemeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(const MaterialApp(home: QuizScreen()));

        final buttonFinder = find.widgetWithText(FilledButton, 'Cevabı Onayla');
        expect(buttonFinder, findsOneWidget);

        final button = tester.widget<FilledButton>(buttonFinder);
        expect(button.onPressed, isNull);

        expect(find.text('Çözüm Açıklaması'), findsNothing);
      },
    );

    testWidgets('Bir şıkka dokunulduğunda Cevabı Onayla butonu aktifleşmeli', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const MaterialApp(home: QuizScreen()));

      final buttonFinder = find.widgetWithText(FilledButton, 'Cevabı Onayla');
      expect(tester.widget<FilledButton>(buttonFinder).onPressed, isNull);

      // İlk şıkka (A) dokun
      await tester.tap(find.text('Tapınak ve saray mimarisinin gelişmesi'));
      await tester.pumpAndSettle();

      // Butonun aktifleştiğini doğrula
      expect(tester.widget<FilledButton>(buttonFinder).onPressed, isNotNull);
    });

    testWidgets(
      'Cevabı Onayla butonuna basıldığında Çözüm Açıklaması ve SnackBar görünmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(const MaterialApp(home: QuizScreen()));

        // Yanlış şıkkı (A şıkkı - index 0) seç
        await tester.tap(find.text('Tapınak ve saray mimarisinin gelişmesi'));
        await tester.pumpAndSettle();

        // Cevabı Onayla butonuna bas
        final buttonFinder = find.widgetWithText(FilledButton, 'Cevabı Onayla');
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();

        // Çözüm Açıklaması kartının göründüğünü doğrula
        expect(find.text('Çözüm Açıklaması'), findsOneWidget);
        expect(
          find.textContaining('Kut inancı Türk devlet geleneğinde'),
          findsOneWidget,
        );

        // Yanlış cevap verildiği için SnackBar çıktığını doğrula
        expect(
          find.text('Bu soru Yanlış Defteri listene eklendi.'),
          findsOneWidget,
        );
      },
    );
  });
}
