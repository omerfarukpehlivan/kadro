import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeQuestionRepository extends QuestionRepository {
  const _FakeQuestionRepository();

  @override
  Future<List<Question>> generateGeneralCultureMockExam({
    int examNumber = 1,
  }) async {
    return List.generate(
      60,
      (index) => Question(
        id: 'mock_${examNumber}_$index',
        lesson: 'Tarih',
        topic: 'Genel',
        text: 'Deneme $examNumber Soru ${index + 1}',
        options: const ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
      ),
    );
  }
}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  group(
    'Kadro PRO: Cömert Temel Deneyim + Güçlü 4 PRO Ayrıcalığı Testleri',
    () {
      testWidgets(
        'KAPI 1: Günlük limit (30 soru) dolduğunda PaywallScreen açılmalı ve ödüllü reklamla +20 soru hakkı kazanılabilmeli',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final container = ProviderContainer();
          addTearDown(container.dispose);

          // Kullanıcı 30 soruluk limite ulaştı
          for (var i = 0; i < 30; i++) {
            container
                .read(studyStatsProvider.notifier)
                .recordAnswer(lesson: 'Tarih', isCorrect: true);
          }

          expect(
            container.read(studyStatsProvider).dailySolvedCount,
            greaterThanOrEqualTo(30),
          );
          expect(container.read(userPreferencesProvider).isPro, isFalse);

          // PaywallScreen'i doğrudan açıp ödüllü reklam butonunu test et
          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(home: PaywallScreen()),
            ),
          );

          expect(find.text('Kadro PRO'), findsOneWidget);
          expect(
            find.text('Kısa Reklam İzle (+20 Soru Hakkı Kazan)'),
            findsOneWidget,
          );

          // Ödüllü reklama tıkla
          final adButton = find.byKey(
            const ValueKey('paywall_rewarded_ad_button'),
          );
          expect(adButton, findsOneWidget);
          await tester.tap(adButton);
          await tester.pumpAndSettle();

          // Limit 30'dan 50'ye yükselmeli
          expect(
            container.read(userPreferencesProvider).dailyFreeQuestionLimit,
            equals(50),
          );
        },
      );

      testWidgets(
        'KAPI 2: Deneme #1 ücretsiz açılabilmeli; Deneme #2 PRO korumalı olup ücretsiz kullanıcıya PaywallScreen göstermeli',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final container = ProviderContainer(
            overrides: [
              questionRepositoryProvider.overrideWithValue(
                const _FakeQuestionRepository(),
              ),
            ],
          );
          addTearDown(container.dispose);

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
            ),
          );

          // Deneme 1 ve Deneme 2 kartlarının listelendiğini doğrula
          expect(find.text('Türkiye Geneli GK Provası #1'), findsOneWidget);
          expect(find.text('ÖSYM Standardı (Ücretsiz)'), findsOneWidget);
          expect(find.text('Türkiye Geneli GK Provası #2'), findsOneWidget);
          expect(find.text('ÖSYM Prova #2'), findsOneWidget);
          expect(find.text('PRO ile Başlat'), findsWidgets);

          // PRO Deneme #2'ye dokun
          await tester.tap(find.text('Türkiye Geneli GK Provası #2'));
          await tester.pumpAndSettle();

          // PaywallScreen açılmalı ve neden bilgisi verilmeli
          expect(find.byType(PaywallScreen), findsOneWidget);
          expect(
            find.text(
              'Türkiye Geneli GK Provası #2 ve tüm Türkiye Geneli KPSS Deneme Sınavları Kadro PRO üyelerine özeldir.',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'KAPI 2: PRO kullanıcı Deneme #2 ye tıkladığında doğrudan QuizScreen sınav modu başlatılabilmeli',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final container = ProviderContainer(
            overrides: [
              questionRepositoryProvider.overrideWithValue(
                const _FakeQuestionRepository(),
              ),
            ],
          );
          addTearDown(container.dispose);

          // PRO abonesi yap
          container.read(userPreferencesProvider.notifier).upgradeToPro();

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
            ),
          );

          expect(find.text('Kadro PRO Açık'), findsWidgets);

          // Deneme #2'ye dokun
          await tester.tap(find.text('Türkiye Geneli GK Provası #2'));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 300));

          // QuizScreen açılmalı
          expect(find.byType(QuizScreen), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(QuizScreen),
              matching: find.text('Türkiye Geneli GK Provası #2'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'KAPI 3: Çevrimdışı indirme butonuna basan ücretsiz kullanıcıya PaywallScreen açılmalı',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final container = ProviderContainer(
            overrides: [
              questionRepositoryProvider.overrideWithValue(
                const _FakeQuestionRepository(),
              ),
            ],
          );
          addTearDown(container.dispose);

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
            ),
          );

          // İlk denemedeki indirme butonunu bul ve tıkla
          final downloadButtons = find.byTooltip('Çevrimdışı İndir');
          expect(downloadButtons, findsWidgets);

          await tester.tap(downloadButtons.first);
          await tester.pumpAndSettle();

          // PaywallScreen açılmalı
          expect(find.byType(PaywallScreen), findsOneWidget);
          expect(
            find.text(
              'Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'KAPI 4: Yanlış Defterinde sorular ücretsiz incelenebilmeli; Akıllı test üretici butonuna basınca Paywall açılmalı',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          const mistakeRepo = MistakeRepository();
          mistakeRepo.clearForTest();
          addTearDown(mistakeRepo.clearForTest);

          const testMistake = Question(
            id: 'mistake_tar_1',
            lesson: 'Tarih',
            topic: 'İlk Türk Devletleri',
            text: 'Göktürkler hakkında hangisi doğrudur?',
            options: ['A', 'B', 'C', 'D', 'E'],
            correctIndex: 0,
            explanation: 'Göktürkler Orhun Kitabelerini bırakmıştır.',
            distractorTrap:
                'Uygurlar ile Göktürkler alfabe konusunda karıştırılır.',
          );
          mistakeRepo.addMistake(testMistake);

          final container = ProviderContainer();
          addTearDown(container.dispose);

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(
                home: MistakesScreen(mistakeRepository: mistakeRepo),
              ),
            ),
          );

          // Soru ve çeldirici tuzağı ücretsiz görüntülenebilir (Cömert temel)
          expect(
            find.text('Göktürkler hakkında hangisi doğrudur?'),
            findsOneWidget,
          );
          expect(find.text('⚠️ ÖSYM Çeldirici Tuzağı:'), findsOneWidget);

          // Ancak akıllı test üretimi PRO kapısına bağlıdır
          expect(
            find.text('Yanlışlarımdan Özel Test Üret (PRO)'),
            findsOneWidget,
          );

          await tester.tap(find.text('Yanlışlarımdan Özel Test Üret (PRO)'));
          await tester.pumpAndSettle();

          // PaywallScreen açılmalı
          expect(find.byType(PaywallScreen), findsOneWidget);
          expect(
            find.text(
              'Akıllı Yanlış Defteri Test Üretici: Yanlış yaptığın sorulardan özel akıllı testler üretip çözmek Kadro PRO üyelerine özeldir.',
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
