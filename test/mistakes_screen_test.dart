import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: MistakesScreen())),
      );

      expect(find.text('Yanlış defterinde bekleyen soru yok'), findsOneWidget);
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

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: MistakesScreen())),
        );

        // Listedeki soruyu doğrula
        expect(find.text('1 Yanlış Soru'), findsOneWidget);
        expect(find.text('Tarih · İlk Türk Devletleri'), findsOneWidget);
        expect(
          find.text('Uygurlar yerleşik hayata geçmiştir.'),
          findsOneWidget,
        );

        // Silme butonuna bas
        await tester.tap(find.byIcon(PhosphorIconsRegular.trash));
        await tester.pumpAndSettle();

        // Defterin tekrar boş olduğunu doğrula
        expect(
          find.text('Yanlış defterinde bekleyen soru yok'),
          findsOneWidget,
        );
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
          const ProviderScope(
            child: MaterialApp(home: QuizScreen(questions: [sampleQuestion])),
          ),
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
          const ProviderScope(
            child: MaterialApp(home: QuizScreen(questions: [sampleQuestion])),
          ),
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

    testWidgets(
      'MistakesScreen ders filtre şeridi ile ilgili dersin yanlışlarını filtrelemeli',
      (WidgetTester tester) async {
        const tarihQuestion = Question(
          id: 'm_tar',
          lesson: 'Tarih',
          topic: 'İlk Türk Devletleri',
          text: 'Tarih yanlış sorusu',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: '',
        );
        const cografyaQuestion = Question(
          id: 'm_cog',
          lesson: 'Coğrafya',
          topic: 'İklim',
          text: 'Coğrafya yanlış sorusu',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 1,
          explanation: '',
        );

        repository.addMistake(tarihQuestion);
        repository.addMistake(cografyaQuestion);

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: MistakesScreen())),
        );

        // Tümü seçili: 2 soru görünür
        expect(find.text('2 Yanlış Soru'), findsOneWidget);
        expect(find.text('Tarih yanlış sorusu'), findsOneWidget);
        expect(find.text('Coğrafya yanlış sorusu'), findsOneWidget);

        // 'Coğrafya (1)' çipine dokun
        await tester.tap(find.text('Coğrafya (1)'));
        await tester.pumpAndSettle();

        // Artık sadece Coğrafya sorusu görünmeli
        expect(find.text('Coğrafya: 1 Yanlış'), findsOneWidget);
        expect(
          find.text('Coğrafya Yanlışlarından Test Üret (PRO)'),
          findsOneWidget,
        );
        expect(find.text('Coğrafya yanlış sorusu'), findsOneWidget);
        expect(find.text('Tarih yanlış sorusu'), findsNothing);

        // 'Vatandaşlık (0)' çipine dokun -> Boş durum mesajı çıkmalı
        await tester.tap(find.text('Vatandaşlık (0)'));
        await tester.pumpAndSettle();

        expect(
          find.text('Vatandaşlık dersinden yanlışın bulunmuyor.'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Kadro PRO Kapısı: Ücretsiz kullanıcı yanlışlardan test üretmek isteyince Paywall açılmalı',
      (WidgetTester tester) async {
        repository.addMistake(sampleQuestion);

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: MistakesScreen())),
        );

        expect(
          find.text('Yanlışlarımdan Özel Test Üret (PRO)'),
          findsOneWidget,
        );

        await tester.tap(find.text('Yanlışlarımdan Özel Test Üret (PRO)'));
        await tester.pumpAndSettle();

        // PaywallScreen açılmalı ve akıllı yanlış defteri sebebi gösterilmeli
        expect(find.byType(PaywallScreen), findsOneWidget);
        expect(
          find.text(
            'Akıllı Yanlış Defteri Test Üretici: Yanlış yaptığın sorulardan özel testler üretip çözmek Kadro PRO üyelerine özeldir.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Kadro PRO Kapısı: PRO kullanıcı yanlışlardan test üretebilmeli ve QuizScreen başlamalı',
      (WidgetTester tester) async {
        repository.addMistake(sampleQuestion);

        final container = ProviderContainer();
        addTearDown(container.dispose);
        container.read(userPreferencesProvider.notifier).upgradeToPro();

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: MistakesScreen()),
          ),
        );

        expect(find.text('Tüm Yanlışları Tekrar Çöz'), findsOneWidget);

        await tester.tap(find.text('Tüm Yanlışları Tekrar Çöz'));
        await tester.pumpAndSettle();

        // QuizScreen başlamalı
        expect(find.byType(QuizScreen), findsOneWidget);
        expect(find.text('Yanlış Defteri Testi'), findsOneWidget);
      },
    );
  });
}
