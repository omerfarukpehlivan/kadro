import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  group('UserPreferencesNotifier ve Profile/Paywall Testleri', () {
    test('UserPreferencesNotifier metodları doğru çalışmalı', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(userPreferencesProvider.notifier);
      await Future<void>.delayed(Duration.zero);

      expect(container.read(userPreferencesProvider).isPro, isFalse);
      expect(
        container.read(userPreferencesProvider).dailyFreeQuestionLimit,
        equals(30),
      );
      expect(
        container.read(userPreferencesProvider).themeMode,
        equals(ThemeMode.system),
      );
      expect(
        container.read(userPreferencesProvider).defaultQuizMode,
        equals(QuizMode.learning),
      );

      // PRO'ya yükselt
      notifier.upgradeToPro();
      expect(container.read(userPreferencesProvider).isPro, isTrue);

      // Ödüllü reklam ile +20 soru kazan
      notifier.rewardExtraQuestions(20);
      expect(
        container.read(userPreferencesProvider).dailyFreeQuestionLimit,
        equals(50),
      );

      // Tema modunu koyu yap
      notifier.setThemeMode(ThemeMode.dark);
      expect(
        container.read(userPreferencesProvider).themeMode,
        equals(ThemeMode.dark),
      );

      // Soru çözüm modunu Sınav modu yap
      notifier.setQuizMode(QuizMode.exam);
      expect(
        container.read(userPreferencesProvider).defaultQuizMode,
        equals(QuizMode.exam),
      );
    });

    testWidgets(
      'ProfileScreen üzerinden PaywallScreen açılmalı ve PRO yükseltmesi yapılabilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: ProfileScreen()),
          ),
        );

        // Başlangıçta PRO değil, tanıtım kartı görünmeli
        expect(find.text('Kadro PRO\'ya Yükselt'), findsOneWidget);
        expect(find.text('Kadro PRO Üyesi'), findsNothing);

        // Tanıtım kartına tıkla -> PaywallScreen açılmalı
        await tester.tap(find.text('Kadro PRO\'ya Yükselt'));
        await tester.pumpAndSettle();

        expect(find.text('Kadro PRO'), findsOneWidget);
        expect(find.text('Sınırsız KPSS Hazırlığı'), findsOneWidget);

        // 3 Paket seçeneğinin render edildiğini doğrula
        expect(find.text('Aylık Abonelik'), findsOneWidget);
        expect(find.text('Yıllık Abonelik'), findsOneWidget);
        expect(find.text('2026 Sınava Kadar'), findsOneWidget);
        expect(find.text('En Çok Tercih Edilen'), findsOneWidget);

        // 'Aylık Abonelik' seç
        await tester.tap(find.text('Aylık Abonelik'));
        await tester.pumpAndSettle();

        // CTA butonu seçilen pakete göre güncellenmeli
        expect(find.text('Kadro PRO\'ya Geç (89 ₺ / Ay)'), findsOneWidget);

        // PRO Satın Alma butonuna tıkla
        final proButtonFinder = find.byKey(
          const ValueKey('paywall_cta_button'),
        );
        expect(proButtonFinder, findsOneWidget);
        await tester.tap(proButtonFinder);
        await tester.pumpAndSettle();

        // Ekran kapandıktan sonra PRO rozeti görünmeli
        expect(find.text('Kadro PRO Üyesi'), findsOneWidget);
        expect(container.read(userPreferencesProvider).isPro, isTrue);
      },
    );

    testWidgets('Günlük hedef ve tema seçimi başarıyla güncellenmeli', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: ProfileScreen()),
        ),
      );

      // 1. Günlük hedef satırına dokun ve 50 soru seç
      await tester.tap(find.text('Günlük hedef'));
      await tester.pumpAndSettle();

      expect(find.text('Günlük Hedef Belirle'), findsOneWidget);
      await tester.tap(find.text('50 soru'));
      await tester.pumpAndSettle();

      expect(find.text('50 soru'), findsOneWidget);
      expect(container.read(studyStatsProvider).dailyGoal, equals(50));

      // 2. Tema satırına dokun ve Koyu tema seç
      await tester.tap(find.text('Tema'));
      await tester.pumpAndSettle();

      expect(find.text('Tema Tercihi'), findsOneWidget);
      await tester.tap(find.text('Koyu'));
      await tester.pumpAndSettle();

      expect(find.text('Koyu'), findsOneWidget);
      expect(
        container.read(userPreferencesProvider).themeMode,
        equals(ThemeMode.dark),
      );
    });

    testWidgets(
      'TASK-46: ProfileScreen üzerinden Soru Çözüm Modu seçilebilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: ProfileScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Soru Çözüm Modu'), findsOneWidget);
        expect(find.text('Öğrenme'), findsOneWidget);

        // Satıra dokun -> Tıklanabilir mod kartları içeren seçici açılsın
        await tester.tap(find.text('Soru Çözüm Modu'));
        await tester.pumpAndSettle();

        expect(
          find.text('Varsayılan test çözme deneyiminizi seçin:'),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('quiz_mode_option_learning')),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('quiz_mode_option_exam')),
          findsOneWidget,
        );
        expect(find.text('Seçili'), findsOneWidget);
        expect(find.text('Sınav Modu (Gizli Çözüm)'), findsOneWidget);
        await tester.tap(find.text('Sınav Modu (Gizli Çözüm)'));
        await tester.pumpAndSettle();

        expect(
          container.read(userPreferencesProvider).defaultQuizMode,
          equals(QuizMode.exam),
        );
        expect(find.text('Sınav'), findsOneWidget);
      },
    );

    testWidgets(
      'ProfileScreen üzerinden OnboardingScreen açılmalı ve hedef rotası kurulabilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: ProfileScreen()),
          ),
        );
        await tester.pumpAndSettle();

        // Hedef düzenle butonu görünmeli
        expect(find.text('Hedefi Düzenle'), findsOneWidget);
        expect(find.text('KPSS Hedefim: 85+ Puan'), findsOneWidget);

        // Hedef düzenlemeye tıkla
        await tester.tap(find.text('Hedefi Düzenle'));
        await tester.pumpAndSettle();

        expect(find.byType(OnboardingScreen), findsOneWidget);
        expect(find.text('Çalışma Hedefi'), findsOneWidget);
        expect(find.text('Hangi KPSS Sınavına Gireceksin?'), findsOneWidget);

        // Adım 1: Sınav türü seç
        await tester.tap(find.text('2028 KPSS Ön Lisans'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Devam Et'));
        await tester.pumpAndSettle();

        // Adım 2: Günlük çalışma süresi (45 dk) seç
        expect(find.text('Günde Kaç Dakika Ayırabilirsin?'), findsOneWidget);
        await tester.tap(find.text('45 Dk · Dengeli Tempo'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Devam Et'));
        await tester.pumpAndSettle();

        // Adım 3: Hedef puan 90+ ve odak ders Coğrafya seç
        expect(find.text('Hedef Puan & Öncelikli Dersin'), findsOneWidget);
        await tester.tap(find.text('90+ Puan'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Coğrafya · 18 Soru (%30 Ağırlık)'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Rotamı Oluştur'));
        await tester.pumpAndSettle();

        // Sihirbaz kapanıp ProfileScreen'e dönmeli ve hedefler güncellenmeli
        expect(find.byType(OnboardingScreen), findsNothing);
        expect(find.text('KPSS Hedefim: 90+ Puan'), findsOneWidget);
        expect(
          find.text('Odak Ders: Coğrafya · Günlük Hedef: 30 Soru'),
          findsOneWidget,
        );

        expect(container.read(userPreferencesProvider).targetKpssScore, 90);
        expect(container.read(userPreferencesProvider).focusLesson, 'Coğrafya');
        expect(
          container.read(userPreferencesProvider).targetDailyStudyGoal,
          30,
        );
        expect(
          container.read(userPreferencesProvider).targetExamKey,
          'onlisans',
        );
        expect(
          container.read(userPreferencesProvider).dailyFreeQuestionLimit,
          30,
        );
      },
    );

    testWidgets(
      'PaywallScreen üzerinde ödüllü reklam butonuna basıldığında +20 soru hakkı tanımlanmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: ProfileScreen()),
          ),
        );

        expect(
          container.read(userPreferencesProvider).dailyFreeQuestionLimit,
          30,
        );

        // Tanıtım kartına tıkla -> PaywallScreen açılmalı
        await tester.tap(find.text('Kadro PRO\'ya Yükselt'));
        await tester.pumpAndSettle();

        // Ödüllü reklam butonuna tıkla
        final adButtonFinder = find.byKey(
          const ValueKey('paywall_rewarded_ad_button'),
        );
        expect(adButtonFinder, findsOneWidget);
        await tester.tap(adButtonFinder);
        await tester.pumpAndSettle();

        // +20 soru hakkı verilmiş olmalı
        expect(
          container.read(userPreferencesProvider).dailyFreeQuestionLimit,
          50,
        );
      },
    );
  });
}
