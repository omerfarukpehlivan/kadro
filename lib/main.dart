import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/services/ad_service.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/core/services/notification_service.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/core/utils/web_url_strategy.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureWebUrlStrategy();
  await SupabaseConfig.initializeSafely();
  await PurchaseService.initializeSafely();
  await AdService.initializeSafely();
  await NotificationService.initializeSafely();

  final hasSupabaseSession =
      !SupabaseConfig.isReady ||
      SupabaseConfig.clientOrNull?.auth.currentUser != null;

  final storage = LocalStorageService();
  final savedPrefs = hasSupabaseSession
      ? await storage.loadUserPreferences()
      : null;
  final savedCycleDay = hasSupabaseSession
      ? await storage.loadPlannerCycleDay()
      : null;
  final savedMaxDay = hasSupabaseSession
      ? await storage.loadPlannerMaxUnlockedDay()
      : null;
  final savedDayTasks = !hasSupabaseSession
      ? null
      : (savedCycleDay != null
            ? await storage.loadPlannerDayTasks(savedCycleDay)
            : await storage.loadStudyTasks());
  final savedSnapshot = hasSupabaseSession
      ? await storage.loadPlannerSnapshot()
      : null;

  StudyPlannerState? initialPlannerState;
  if ((savedDayTasks != null && savedDayTasks.isNotEmpty) ||
      (savedSnapshot != null && !savedSnapshot.isEmptyProgress)) {
    final effectiveDay = savedCycleDay ?? savedSnapshot?.cycleDay ?? 1;
    final effectiveMax =
        savedMaxDay ?? savedSnapshot?.maxUnlockedDay ?? effectiveDay;
    final tasks = savedDayTasks ?? const [];
    initialPlannerState = StudyPlannerState(
      tasks: tasks,
      cycleDay: effectiveDay,
      maxUnlockedDay: effectiveMax,
    );
  }

  final overrides = [
    if (savedPrefs != null)
      initialUserPreferencesProvider.overrideWithValue(savedPrefs),
    if (savedCycleDay != null)
      initialPlannerCycleDayProvider.overrideWithValue(savedCycleDay),
    if (initialPlannerState != null)
      initialPlannerStateProvider.overrideWithValue(initialPlannerState),
  ];

  const sentryDsn = String.fromEnvironment('SENTRY_DSN', defaultValue: '');

  if (sentryDsn.isNotEmpty) {
    await SentryFlutter.init(
      (options) {
        options.dsn = sentryDsn;
        options.tracesSampleRate = 1.0;
      },
      appRunner: () =>
          runApp(ProviderScope(overrides: overrides, child: const MyApp())),
    );
  } else {
    // Uygulama genelinde Riverpod durum yönetimini etkinleştirir
    runApp(ProviderScope(overrides: overrides, child: const MyApp()));
  }
}

/// Uygulamanın kök bileşeni.
///
/// Angular'daki `AppComponent` veya `bootstrapApplication` karşılığıdır.
/// `MaterialApp.router` ile merkezi `GoRouter` konfigürasyonunu ve kullanıcı temasını dinler.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dışarıda ProviderScope yoksa (örn. doğrudan MyApp() çalıştıran izole testlerde)
    // otomatik ProviderScope ile sararak testlerin kırılmasını önler.
    try {
      ProviderScope.containerOf(context);
      return const _MyAppContent();
    } catch (_) {
      return const ProviderScope(child: _MyAppContent());
    }
  }
}

class _MyAppContent extends ConsumerWidget {
  const _MyAppContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(userPreferencesProvider).themeMode;

    return MaterialApp.router(
      title: 'Kadro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme:
          AppTheme.dark, // Telefon karanlık moddaysa otomatik bu kullanılır
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
