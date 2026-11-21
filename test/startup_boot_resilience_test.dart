import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/services/ad_service.dart';
import 'package:kadro/core/services/notification_service.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    PurchaseService.resetForTest();
    AdService.resetForTest();
  });

  tearDown(() {
    PurchaseService.resetForTest();
    AdService.resetForTest();
  });

  group('Açılış Dayanıklılığı ve İlk Kare Render Testleri', () {
    test('Servis başlatıcıları (Supabase, Purchase, Ad, Notification) güvenle ve askıda kalmadan tamamlanır', () async {
      await expectLater(SupabaseConfig.initializeSafely(), completes);
      await expectLater(PurchaseService.initializeSafely(), completes);
      await expectLater(AdService.initializeSafely(), completes);
      await expectLater(NotificationService.initializeSafely(), completes);
    });

    testWidgets(
      'MyApp ilk açılışta (onboarding=false) telefon ve tablette açık/koyu temada görünür içerik çizer',
      (WidgetTester tester) async {
        for (final size in const [Size(360, 640), Size(1280, 800)]) {
          for (final mode in const [ThemeMode.light, ThemeMode.dark]) {
            tester.view.physicalSize = size;
            tester.view.devicePixelRatio = 1.0;

            await tester.pumpWidget(
              ProviderScope(
                key: UniqueKey(),
                overrides: [
                  initialUserPreferencesProvider.overrideWithValue(
                    UserPreferencesState(
                      hasCompletedOnboarding: false,
                      themeMode: mode,
                    ),
                  ),
                ],
                child: const MyApp(),
              ),
            );
            await tester.pumpAndSettle();

            expect(find.byType(OnboardingScreen), findsOneWidget);
            expect(tester.takeException(), isNull);
          }
        }

        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      },
    );

    testWidgets(
      'MyApp kurulum sonrası (onboarding=true) ve bozuk yerel JSON durumunda HomeScreen çizer',
      (WidgetTester tester) async {
        SharedPreferences.setMockInitialValues({
          'kadro_user_preferences': '{bozuk_json',
          'kadro_study_tasks': 'not_a_list',
          'kadro_planner_snapshot': '42',
          'kadro_mistakes': '{"invalid": true}',
        });

        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                  themeMode: ThemeMode.dark,
                ),
              ),
            ],
            child: const MyApp(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(HomeScreen), findsOneWidget);
        expect(find.text('Hoş geldin'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}
