import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

void main() {
  const repository = MistakeRepository();

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    repository.clearForTest();
  });

  tearDown(() {
    repository.clearForTest();
  });

  group('MistakesScreen ve MistakeRepository Testleri', () {
    const sampleQuestion = Question(
      id: 'test_q1',
      lesson: 'Tarih',
      topic: 'İlk Türk Devletleri',
      text: 'Uygurlar yerleşik hayata geçmiştir.',
      options: [
        'Seçenek A',
        'Seçenek B',
        'Seçenek C',
        'Seçenek D',
        'Seçenek E',
      ],
      correctIndex: 0,
      explanation: 'Açıklama',
    );

    testWidgets('Yanlış defteri boşken temiz durum (Empty State) görünmeli', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MistakesScreen()));

      expect(find.text('Yanlış defterin tertemiz!'), findsOneWidget);
      expect(
        find.text(
          'Testlerde yanlış yaptığın sorular otomatik olarak burada birikir.',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      'Soru eklendiğinde ekranda listelenmeli ve silme butonuna basılınca silinmeli',
      (WidgetTester tester) async {
        repository.addMistake(sampleQuestion);

        await tester.pumpWidget(const MaterialApp(home: MistakesScreen()));

        // Listedeki soruyu doğrula
        expect(find.text('1 Yanlış Soru'), findsOneWidget);
        expect(find.text('Tarih · İlk Türk Devletleri'), findsOneWidget);
        expect(
          find.text('Uygurlar yerleşik hayata geçmiştir.'),
          findsOneWidget,
        );

        // Silme butonuna bas
        await tester.tap(find.byIcon(Icons.delete_outline));
        await tester.pumpAndSettle();

        // Defterin tekrar tertemiz olduğunu doğrula
        expect(find.text('Yanlış defterin tertemiz!'), findsOneWidget);
        expect(repository.getMistakes(), isEmpty);
      },
    );

    testWidgets(
      'QuizScreen içinde soru yanlış cevaplandığında MistakeRepository ye eklenmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(home: QuizScreen(questions: [sampleQuestion])),
        );

        // Yanlış şıkkı (Seçenek B - index 1) seç
        await tester.tap(find.text('Seçenek B'));
        await tester.pumpAndSettle();

        // Onayla
        await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
        await tester.pumpAndSettle();

        // MistakeRepository'ye eklendiğini doğrula
        expect(repository.getMistakes().length, equals(1));
        expect(repository.getMistakes().first.id, equals('test_q1'));
      },
    );

    testWidgets(
      'QuizScreen içinde yanlış defterindeki soru doğru çözüldüğünde depodan silinmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // Önceden yanlış defterine ekle
        repository.addMistake(sampleQuestion);
        expect(repository.getMistakes().length, equals(1));

        await tester.pumpWidget(
          const MaterialApp(home: QuizScreen(questions: [sampleQuestion])),
        );

        // Doğru şıkkı (Seçenek A - index 0) seç
        await tester.tap(find.text('Seçenek A'));
        await tester.pumpAndSettle();

        // Onayla
        await tester.tap(find.widgetWithText(FilledButton, 'Cevabı Onayla'));
        await tester.pumpAndSettle();

        // Doğru çözüldüğü için defterden silindiğini doğrula
        expect(repository.getMistakes(), isEmpty);
      },
    );
  });
}
