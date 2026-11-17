import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/app/widgets/desktop_top_utility_bar.dart';
import 'package:kadro/app/widgets/kadro_sidebar.dart';
import 'package:kadro/core/services/ad_service.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/core/utils/platform_env.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/curriculum_preview_screen.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart' show Question;
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/main.dart';
import 'package:kadro/shared/widgets/command_palette_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _buildOnboardedShellApp() {
  return ProviderScope(
    overrides: [
      initialUserPreferencesProvider.overrideWithValue(
        const UserPreferencesState(hasCompletedOnboarding: true),
      ),
    ],
    child: const MyApp(),
  );
}

class _FakeTopicQuestionRepository extends QuestionRepository {
  @override
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
    ExamSelection? selection,
    String? difficulty,
    String? preferredSourceVariant,
    bool strictTopicFilter = false,
    bool forceRefresh = false,
    int limit = 60,
  }) async {
    return [
      Question(
        id: 'mock_q_${topic ?? 'all'}',
        lesson: lesson ?? 'Tarih',
        topic: topic ?? 'İslamiyet Öncesi Türk Tarihi',
        text: 'Örnek masaüstü split-pane test sorusu',
        options: const ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Örnek açıklama.',
        distractorTrap: 'Örnek çeldirici analizi.',
      ),
    ];
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    PlatformEnv.resetForTest();
    PurchaseService.resetForTest();
    AdService.resetForTest();
  });

  tearDown(() {
    PlatformEnv.resetForTest();
    PurchaseService.resetForTest();
    AdService.resetForTest();
  });

  group('Çoklu Kırılım (Breakpoint) Kabuk & Taşma Testleri', () {
    testWidgets(
      '1440x900 ve 1024x768 masaüstü genişliklerinde KadroSidebar ile DesktopTopUtilityBar render edilir ve sekme geçişinde taşma olmaz',
      (WidgetTester tester) async {
        for (final size in const [Size(1440, 900), Size(1024, 768)]) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          await tester.pumpWidget(_buildOnboardedShellApp());
          await tester.pumpAndSettle();

          expect(find.byType(KadroSidebar), findsOneWidget);
          expect(find.byType(DesktopTopUtilityBar), findsOneWidget);
          expect(find.byType(AppNavigationBar), findsNothing);
          expect(find.byType(AppTopBar), findsNothing);
          expect(tester.takeException(), isNull);

          // Masaüstü kenar çubuğunda sekmeler arası geçiş yap
          for (final label in const [
            'Dersler',
            'Pratik',
            'Denemeler',
            'İstatistik',
            'Profil',
            'Ana Sayfa',
          ]) {
            await tester.tap(find.text(label).first);
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
          }

          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        }
      },
    );

    testWidgets(
      '768x1024 tablet ve 360x640 kompakt mobilde alt navigasyon çubuğu korunur, 920x700 ara boyutta NavigationRail gösterilir',
      (WidgetTester tester) async {
        // 360x640 ve 768x1024: < 900px Mobil/Dikey Tablet kabuğu korunur
        for (final size in const [Size(360, 640), Size(768, 1024)]) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          await tester.pumpWidget(_buildOnboardedShellApp());
          await tester.pumpAndSettle();

          expect(find.byType(AppNavigationBar), findsOneWidget);
          expect(find.byType(KadroSidebar), findsNothing);
          expect(find.byType(NavigationRail), findsNothing);
          expect(tester.takeException(), isNull);

          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        }

        // 920x700: 900px–1023px aralığında NavigationRail açılır
        tester.view.physicalSize = const Size(920, 700);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(_buildOnboardedShellApp());
        await tester.pumpAndSettle();

        expect(find.byType(NavigationRail), findsOneWidget);
        expect(find.byType(KadroSidebar), findsNothing);
        expect(find.byType(AppNavigationBar), findsNothing);
        expect(tester.takeException(), isNull);
      },
    );
  });

  group('Komut Paleti (Ctrl+K) ve Masaüstü Etkileşimleri', () {
    testWidgets(
      'Masaüstünde üst çubuk tetikleyicisi ve Ctrl+K ile KadroCommandPalette açılır, filtrelenip Puan Hesaplama ekranına gider',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1440, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(_buildOnboardedShellApp());
        await tester.pumpAndSettle();

        // 1. Üst arama barına tıklayınca Komut Paleti açılmalı
        await tester.tap(
          find.byKey(const ValueKey('desktop_command_palette_trigger')),
        );
        await tester.pumpAndSettle();
        expect(find.byType(KadroCommandPalette), findsOneWidget);

        // Esc ile kapat
        await tester.sendKeyEvent(LogicalKeyboardKey.escape);
        await tester.pumpAndSettle();
        expect(find.byType(KadroCommandPalette), findsNothing);

        // 2. Ctrl+K kısayoluyla Komut Paletini aç
        await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
        await tester.sendKeyEvent(LogicalKeyboardKey.keyK);
        await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
        await tester.pumpAndSettle();
        expect(find.byType(KadroCommandPalette), findsOneWidget);

        // 'Puan' filtreleyip KPSS Puan Hesaplama ekranına git
        await tester.enterText(find.byType(TextField).first, 'Puan');
        await tester.pumpAndSettle();
        expect(find.text('KPSS / MEB-AGS Puan Hesaplayıcı'), findsOneWidget);

        await tester.tap(find.text('KPSS / MEB-AGS Puan Hesaplayıcı'));
        await tester.pumpAndSettle();

        expect(find.byType(KpssScoreCalculatorScreen), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });

  group('Split-Pane Quiz, Kısayollar, Üstünü Çizme ve Master-Detail', () {
    testWidgets(
      '1440x900 QuizScreen sadeleştirilmiş tek parça çalışma alanında açılır; soru ve şıklar scrollsuz görünür, Shift+1 üstünü çizer, 3 şık seçer, Enter açıklamayı getirir, G soru paletini popup açar ve F1 yardımı açar',
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
              theme: AppTheme.light,
              home: const QuizScreen(
                questions: defaultSampleQuestions,
                mode: QuizMode.learning,
                customTitle: 'Masaüstü Sınav Testi',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Çözüm alanı ve optik form soru çözülürken sürekli yer kaplamaz
        expect(find.text('Çözüm & Çeldirici Analizi'), findsNothing);
        expect(find.text('Optik Form & Soru Gezintisi'), findsNothing);

        // Sorunun tüm şıkları (5 şık) ve aksiyon butonu aynı anda 900px ekran yüksekliğine sığar
        expect(find.byType(OptionTile), findsNWidgets(5));
        final fifthOptionRect = tester.getRect(find.byType(OptionTile).last);
        final submitBtnRect = tester.getRect(
          find.widgetWithText(FilledButton, 'Cevabı Onayla'),
        );
        expect(fifthOptionRect.bottom, lessThanOrEqualTo(760));
        expect(submitBtnRect.bottom, lessThanOrEqualTo(820));

        // F ile işaretle
        await tester.sendKeyEvent(LogicalKeyboardKey.keyF);
        await tester.pumpAndSettle();
        expect(find.text('İşaretli'), findsOneWidget);

        // Shift + 1 ile ilk şıkkı ele (strikethrough)
        await tester.sendKeyDownEvent(LogicalKeyboardKey.shiftLeft);
        await tester.sendKeyEvent(LogicalKeyboardKey.digit1);
        await tester.sendKeyUpEvent(LogicalKeyboardKey.shiftLeft);
        await tester.pumpAndSettle();

        final firstOption = tester.widget<OptionTile>(
          find.byType(OptionTile).first,
        );
        expect(firstOption.isEliminated, isTrue);

        // 3 (C şıkkı - ilk soru doğru cevabı index 2) ile şık seç
        await tester.sendKeyEvent(LogicalKeyboardKey.digit3);
        await tester.pumpAndSettle();
        final thirdOptionSelected = tester.widget<OptionTile>(
          find.byType(OptionTile).at(2),
        );
        expect(thirdOptionSelected.status, OptionStatus.selected);

        // Enter ile onayla ve çözüm ile ÖSYM Çeldirici Tuzağı'nı gör
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();

        expect(find.text('Çözüm Açıklaması'), findsOneWidget);
        expect(find.text('ÖSYM ÇELDİRİCİ TUZAĞI'), findsOneWidget);

        // G kısayolu ile Soru Gezinti Paletini popup (dialog) olarak aç
        await tester.sendKeyEvent(LogicalKeyboardKey.keyG);
        await tester.pumpAndSettle();

        expect(find.text('Optik Form & Soru Gezintisi'), findsOneWidget);

        // Paleti kapatmak için Escape veya dialog dışı tıklama
        await tester.sendKeyEvent(LogicalKeyboardKey.escape);
        await tester.pumpAndSettle();

        // F1 ile Klavye Kısayolları rehberini aç
        await tester.sendKeyEvent(LogicalKeyboardKey.f1);
        await tester.pumpAndSettle();
        expect(find.text('Klavye Kısayolları'), findsOneWidget);

        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      '1280x800 LessonTopicsScreen Master-Detail yapısında açılır ve TopicTestsScreen sağ panele gömülü kalır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final tarihLesson = kpssLessons.first;

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              questionRepositoryProvider.overrideWithValue(
                _FakeTopicQuestionRepository(),
              ),
            ],
            child: MaterialApp(
              theme: AppTheme.light,
              home: LessonTopicsScreen(lesson: tarihLesson),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(TopicTestsScreen), findsOneWidget);
        final embeddedTests = tester.widget<TopicTestsScreen>(
          find.byType(TopicTestsScreen),
        );
        expect(embeddedTests.isEmbedded, isTrue);
        expect(embeddedTests.topic, tarihLesson.topics.first);

        // Soldan ikinci konuya tıklandığında route itmeden sağ panel güncellenir
        await tester.tap(find.text(tarihLesson.topics[1]).first);
        await tester.pumpAndSettle();

        final updatedEmbedded = tester.widget<TopicTestsScreen>(
          find.byType(TopicTestsScreen),
        );
        expect(updatedEmbedded.topic, tarihLesson.topics[1]);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      '1280x800 FlashcardsScreen Split-Pane telemetri paneli ve Boşluk/Sağ Ok klavye kısayolları çalışır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const FlashcardsScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Klavye Kısayolları'), findsOneWidget);
        expect(find.text('Çevir (Boşluk)'), findsOneWidget);

        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pumpAndSettle();

        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.pumpAndSettle();

        expect(find.textContaining('1 kart incelendi'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });

  group('Auth Vitrin & Misafir Web Rotaları (TASK-151)', () {
    testWidgets(
      '1280x800 AuthScreen split showcase ve misafir kısayol butonlarını gösterir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const AuthScreen(isInitialGate: true),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Kadro Masaüstü Çalışma Stüdyosu'), findsOneWidget);
        expect(
          find.byKey(const ValueKey('auth_desktop_guest_calculator_button')),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('auth_desktop_guest_curriculum_button')),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'Misafir rotaları /calculator?exam=p93 ve /curriculum-preview?scope=meb_ags Auth kapısına takılmadan açılır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp.router(
              theme: AppTheme.light,
              routerConfig: createAppRouter(
                initialLocation: '/calculator?exam=p93',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(KpssScoreCalculatorScreen), findsOneWidget);
        final calc = tester.widget<KpssScoreCalculatorScreen>(
          find.byType(KpssScoreCalculatorScreen),
        );
        expect(calc.isGuestMode, isTrue);
        expect(find.textContaining('Misafir Modu:'), findsOneWidget);

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp.router(
              theme: AppTheme.light,
              routerConfig: createAppRouter(
                initialLocation: '/curriculum-preview?scope=meb_ags',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(CurriculumPreviewScreen), findsOneWidget);
        expect(find.textContaining('MEB-AGS'), findsWidgets);
        expect(tester.takeException(), isNull);
      },
    );
  });

  group('Web Ödeme, Reklam ve Çevrimdışı İndirme Güvenliği', () {
    test('Canlı Web ortamında PurchaseService ve AdService asla ücretsiz PRO veya ücretsiz +20 soru ödülü vermez', () async {
      PlatformEnv.debugOverrideIsWebForTest = true;

      // 1. Checkout URL yokken Web IAP unavailable olmalı
      expect(PurchaseService.availability, PurchaseAvailability.unavailable);
      expect(
        await PurchaseService.purchasePlan(SubscriptionPlan.monthly),
        isFalse,
      );
      expect(await PurchaseService.restorePurchases(), isFalse);

      // 2. Web Checkout URL varken initiatePurchase istemcide tek taraflı PRO açmamalı
      PurchaseService.debugWebCheckoutUrlOverride =
          'https://checkout.kadro.app/checkout';
      expect(PurchaseService.availability, PurchaseAvailability.webCheckout);
      final attempt = await PurchaseService.initiatePurchase(
        SubscriptionPlan.yearly,
      );
      expect(attempt.isProGranted, isFalse);

      // 3. Canlı Web'de ödüllü reklam kapalıdır ve callback tetiklemez
      expect(AdService.isRewardedAdSupported, isFalse);
      var rewarded = false;
      await AdService.showRewardedAd(onUserEarnedReward: () => rewarded = true);
      expect(rewarded, isFalse);

      // 4. Web'de çevrimdışı indirme kapalıdır ve UnsupportedError fırlatır
      expect(OfflineDownloadService.isSupported, isFalse);
      final offlineService = OfflineDownloadService();
      expect(
        () => offlineService.downloadPackage(
          packageId: 'test_pkg',
          questions: const <Question>[],
          isPro: true,
        ),
        throwsUnsupportedError,
      );
    });

    test('06_web_subscriptions.sql tablo, RLS ve entitlement sync sözleşmesini içerir', () {
      final sqlFile = File('docs/supabase_migrations/06_web_subscriptions.sql');
      expect(sqlFile.existsSync(), isTrue);
      final content = sqlFile.readAsStringSync().toLowerCase();
      expect(content, contains('public.subscriptions'));
      expect(content, contains('enable row level security'));
      expect(content, contains('select auth.uid()'));
      expect(content, contains('sync_profile_pro_from_subscriptions'));
    });
  });
}
