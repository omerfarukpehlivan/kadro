import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
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
      'Cevabı Onayla butonuna basıldığında Çözüm Açıklaması ve Yanlış Defteri Kartı görünmeli',
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
        expect(find.textContaining('Kut inancı'), findsOneWidget);

        // Yanlış cevap verildiği için zarif Yanlış Defteri kartı çıktığını doğrula
        expect(find.text('Yanlış Defterine Eklendi'), findsOneWidget);
        expect(
          find.textContaining('Bu soru Ana Sayfa > Yanlış Defteri'),
          findsOneWidget,
        );
      },
    );

    testWidgets('Sonraki Soru butonuna basıldığında 2. soruya geçmeli', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const MaterialApp(home: QuizScreen()));

      expect(find.text('Soru 1 / 3'), findsOneWidget);

      // 1. sorunun şıkkını seç ve onayla
      await tester.tap(find.text('Tapınak ve saray mimarisinin gelişmesi'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
      await tester.pumpAndSettle();

      // Butonun metni "Sonraki Soru" olmalı
      final nextButtonFinder = find.widgetWithText(
        FilledButton,
        'Sonraki Soru',
      );
      expect(nextButtonFinder, findsOneWidget);

      // Sonraki Soru'ya bas
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();

      // 2. soruya geçtiğini doğrula
      expect(find.text('Soru 2 / 3'), findsOneWidget);
      expect(find.text('Türkiye\'nin Fiziki Özellikleri'), findsOneWidget);
      expect(
        find.widgetWithText(FilledButton, 'Cevabı Onayla'),
        findsOneWidget,
      );
    });

    testWidgets(
      'Tüm sorular tamamlandığında QuizResultScreen açılmalı ve sonuç gösterilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // Testi hızlandırmak ve izolasyon için 2 soruluk özel liste ile çalışalım
        const testQuestions = [
          Question(
            id: 'q1',
            lesson: 'Tarih',
            topic: 'Konu 1',
            text: 'Soru 1 Metni',
            options: ['A1', 'B1'],
            correctIndex: 0,
            explanation: 'Açıklama 1',
          ),
          Question(
            id: 'q2',
            lesson: 'Tarih',
            topic: 'Konu 2',
            text: 'Soru 2 Metni',
            options: ['A2', 'B2'],
            correctIndex: 1,
            explanation: 'Açıklama 2',
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(home: QuizScreen(questions: testQuestions)),
        );

        // 1. Soru (Doğru şıkkı seç: A1)
        await tester.tap(find.text('A1'));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
        await tester.pumpAndSettle();

        // Sonraki soruya geç
        await tester.tap(find.widgetWithText(FilledButton, 'Sonraki Soru'));
        await tester.pumpAndSettle();

        // 2. Soru (Son soru): Yanlış şıkkı seç: A2 (Doğru B2 idi)
        expect(find.text('Soru 2 / 2'), findsOneWidget);
        await tester.tap(find.text('A2'));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
        await tester.pumpAndSettle();

        // Buton 'Testi Bitir ve Sonucu Gör' olmalı
        final finishButtonFinder = find.widgetWithText(
          FilledButton,
          'Testi Bitir ve Sonucu Gör',
        );
        expect(finishButtonFinder, findsOneWidget);

        // Bitir butonuna bas
        await tester.tap(finishButtonFinder);
        await tester.pumpAndSettle();

        // QuizResultScreen açılmalı
        expect(find.text('Test Tamamlandı!'), findsOneWidget);
        expect(find.text('Test Sonucu'), findsOneWidget);
        expect(find.text('Net Puanın'), findsOneWidget);
        // 1 doğru, 1 yanlış => 1 - 0.25 = 0.75 Net
        expect(find.text('0.75'), findsOneWidget);
        expect(find.text('%50 Başarı'), findsOneWidget);
        expect(find.text('Ana Sayfaya Dön'), findsOneWidget);
      },
    );

    testWidgets('Sorular arasında geriye ve ileriye gezinti doğru çalışmalı', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const MaterialApp(home: QuizScreen()));

      // Soru 1: Şık seç ve onayla
      await tester.tap(find.text('Tapınak ve saray mimarisinin gelişmesi'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
      await tester.pumpAndSettle();

      // Sonraki soruya geç (Soru 2)
      await tester.tap(find.widgetWithText(FilledButton, 'Sonraki Soru'));
      await tester.pumpAndSettle();
      expect(find.text('Soru 2 / 3'), findsOneWidget);

      // Soru 2'deyken sol tarafta 'Önceki Soru' butonu olmalı
      expect(
        find.widgetWithText(OutlinedButton, 'Önceki Soru'),
        findsOneWidget,
      );

      // 'Önceki Soru'ya tıkla -> Soru 1'e geri dönmeli
      await tester.tap(find.widgetWithText(OutlinedButton, 'Önceki Soru'));
      await tester.pumpAndSettle();
      expect(find.text('Soru 1 / 3'), findsOneWidget);
      // Soru 1'de daha önce verilen cevabın açıklaması görünmeli
      expect(find.text('Çözüm Açıklaması'), findsOneWidget);

      // Şimdi sağda 'Sonraki Soru' butonu olmalı ve 2'ye geri dönülebilmeli
      await tester.tap(find.widgetWithText(FilledButton, 'Sonraki Soru'));
      await tester.pumpAndSettle();
      expect(find.text('Soru 2 / 3'), findsOneWidget);
    });

    testWidgets(
      'TASK-46: QuizMode.exam modunda şıklar gizli tutulmalı, geri dönüldüğünde şık değiştirilebilmeli ve sonuçlar test sonunda hesaplanmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const examQuestions = [
          Question(
            id: 'exam_1',
            lesson: 'Tarih',
            topic: 'İlk Türk Devletleri',
            text: 'Soru 1',
            options: ['A1', 'B1'],
            correctIndex: 0,
            explanation: 'Açıklama 1',
          ),
          Question(
            id: 'exam_2',
            lesson: 'Tarih',
            topic: 'Selçuklular',
            text: 'Soru 2',
            options: ['A2', 'B2'],
            correctIndex: 1,
            explanation: 'Açıklama 2',
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: QuizScreen(questions: examQuestions, mode: QuizMode.exam),
          ),
        );

        // 1. Soru: Şıkka dokun (B1 - yanlış şık)
        await tester.tap(find.text('B1'));
        await tester.pumpAndSettle();

        // Sınav modunda "Cevabı Onayla" butonu OLMAZ, doğrudan "Sonraki Soru" görünür
        expect(find.text('Cevabı Onayla'), findsNothing);
        expect(find.text('Çözüm Açıklaması'), findsNothing);
        expect(find.text('Yanlış Defterine Eklendi'), findsNothing);

        // Sonraki soruya geç
        await tester.tap(find.widgetWithText(FilledButton, 'Sonraki Soru'));
        await tester.pumpAndSettle();

        expect(find.text('Soru 2 / 2'), findsOneWidget);

        // Geri dön (Önceki Soru)
        await tester.tap(find.widgetWithText(OutlinedButton, 'Önceki Soru'));
        await tester.pumpAndSettle();

        expect(find.text('Soru 1 / 2'), findsOneWidget);
        // Soru 1'de açıklama yine çıkmamalı (sınav devam ediyor)
        expect(find.text('Çözüm Açıklaması'), findsNothing);

        // Şıkkı değiştir: B1 yerine A1 (doğru şık) işaretle
        await tester.tap(find.text('A1'));
        await tester.pumpAndSettle();

        // Tekrar Soru 2'ye geç
        await tester.tap(find.widgetWithText(FilledButton, 'Sonraki Soru'));
        await tester.pumpAndSettle();

        expect(find.text('Soru 2 / 2'), findsOneWidget);
        // 2. soruyu boş bırak ve testi bitir
        final finishBtn = find.widgetWithText(
          FilledButton,
          'Testi Bitir ve Sonucu Gör',
        );
        expect(finishBtn, findsOneWidget);
        await tester.tap(finishBtn);
        await tester.pumpAndSettle();

        // QuizResultScreen açılmalı: 1 Doğru (A1), 0 Yanlış, 1 Boş
        expect(find.text('Test Tamamlandı!'), findsOneWidget);
        expect(find.text('Net Puanın'), findsOneWidget);
        // 1 doğru, 0 yanlış => 1.0 Net
        expect(find.text('1.00'), findsOneWidget);
      },
    );

    testWidgets(
      'TASK-46: QuizScreen limit parametresi soru adedini sınırlamalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // defaultSampleQuestions 3 sorudur, limit: 1 ile 1 soru olmalı
        await tester.pumpWidget(const MaterialApp(home: QuizScreen(limit: 1)));
        await tester.pumpAndSettle();

        expect(find.text('Soru 1 / 1'), findsOneWidget);
      },
    );
    testWidgets(
      'TASK-49: QuizScreen mode parametresi null gelse dahi çökmeksizin varsayılan Öğrenme modu ile render edilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(home: QuizScreen(mode: null)),
        );
        await tester.pumpAndSettle();

        expect(find.text('Öğrenme'), findsOneWidget);
        expect(find.byType(QuizScreen), findsOneWidget);
      },
    );

    testWidgets(
      'TASK-51: Soru cevaplandığında ÖSYM Çeldirici Tuzağı kartı render edilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(const MaterialApp(home: QuizScreen()));
        await tester.pumpAndSettle();

        // Henüz cevaplanmadan önce çeldirici tuzağı görünmemeli
        expect(find.text('ÖSYM ÇELDİRİCİ TUZAĞI'), findsNothing);

        // Bir şık seç
        await tester.tap(find.text('Tapınak ve saray mimarisinin gelişmesi'));
        await tester.pumpAndSettle();

        // Cevabı Onayla butonuna bas
        final buttonFinder = find.widgetWithText(FilledButton, 'Cevabı Onayla');
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();

        // Çözüm Açıklaması ve ÖSYM Çeldirici Tuzağı görünmeli
        expect(find.text('Çözüm Açıklaması'), findsOneWidget);
        expect(find.text('ÖSYM ÇELDİRİCİ TUZAĞI'), findsOneWidget);
        expect(
          find.textContaining('din değiştiyse yönetim anlayışı da değişmiştir'),
          findsOneWidget,
        );
      },
    );
  });
}
