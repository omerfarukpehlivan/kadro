import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/main.dart';

class _TestAuthNotifier extends AuthNotifier {
  @override
  AuthUserState build() =>
      const AuthUserState(isAuthenticated: true, email: 'test@kadro.app');
}

class _TestPlannerNotifier extends StudyPlannerNotifier {
  final StudyPlannerState initial;
  _TestPlannerNotifier(this.initial);

  @override
  StudyPlannerState build() => initial;
}

Widget _onboardedApp() => ProviderScope(
  overrides: [
    authProvider.overrideWith(() => _TestAuthNotifier()),
    initialUserPreferencesProvider.overrideWithValue(
      const UserPreferencesState(
        hasCompletedOnboarding: true,
        hasActiveStudyProgram: true,
      ),
    ),
  ],
  child: const MyApp(),
);

void main() {
  group('GoRouter Navigasyon Testleri', () {
    testWidgets('Uygulama açılışında rota "/" ve başlık "Kadro" olmalı', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(_onboardedApp());
      await tester.pumpAndSettle();

      expect(find.text('Kadro'), findsOneWidget);
      expect(find.text('Hoş geldin'), findsOneWidget);
    });

    testWidgets(
      'createAppRouter alt sekmeler arası rota geçişlerini desteklemeli',
      (WidgetTester tester) async {
        final testRouter = createAppRouter(initialLocation: '/');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        // Dersler sekmesine git
        testRouter.go('/lessons');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Dersler'), findsOneWidget);

        // Pratik sekmesine git
        testRouter.go('/practice');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Çalışma Türleri'), findsOneWidget);

        // Denemeler sekmesine git
        testRouter.go('/exams');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Denemeler'), findsOneWidget);

        // İstatistik sekmesine git
        testRouter.go('/stats');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'İstatistik'), findsOneWidget);

        // Profil sekmesine git
        testRouter.go('/profile');
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Profil'), findsOneWidget);
      },
    );

    testWidgets(
      'TASK-162: /planner rotası doğrudan ana sayfaya ("/") yönlendirmeli',
      (WidgetTester tester) async {
        final testRouter = createAppRouter(initialLocation: '/planner');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Kadro'), findsOneWidget);
        expect(find.text('Hoş geldin'), findsOneWidget);
      },
    );

    testWidgets(
      'Günlük görevler tam ekran (rootNavigator) olarak açılmalı ve alt NavigationBar gizlenmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const tasks = [
          StudyTask(
            id: 'task_fc',
            title: 'Tarih: 5 Hap Bilgi Kartı',
            lessonTag: 'Tarih',
            estimatedMinutes: 5,
            actionType: StudyTaskActionType.flashcards,
            targetCount: 1,
          ),
        ];

        final testRouter = createAppRouter(initialLocation: '/');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authProvider.overrideWith(() => _TestAuthNotifier()),
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
              studyPlannerProvider.overrideWith(
                () => _TestPlannerNotifier(
                  const StudyPlannerState(tasks: tasks, cycleDay: 1),
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        // Ana sayfadayken alt menü görünür olmalı
        expect(find.byType(AppNavigationBar), findsOneWidget);

        // Günlük görevdeki 'Başla' butonuna tıkla
        await tester.scrollUntilVisible(
          find.text('Tarih: 5 Hap Bilgi Kartı'),
          200,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(find.text('Tarih: 5 Hap Bilgi Kartı'));
        await tester.pumpAndSettle();

        // FlashcardsScreen rootNavigator üzerinde tam ekran açıldığı için alt menü gizlenmiş olmalı
        expect(find.byType(FlashcardsScreen), findsOneWidget);
        expect(find.byType(AppNavigationBar), findsNothing);

        // Kartı tamamla ('Biliyorum')
        await tester.tap(find.text('Biliyorum'));
        await tester.pumpAndSettle();

        // 'Ana Sayfaya Dön' butonuna basıldığında gerçek Ana Sayfaya dönülmeli
        await tester.tap(find.text('Ana Sayfaya Dön'));
        await tester.pumpAndSettle();

        expect(find.byType(FlashcardsScreen), findsNothing);
        expect(find.byType(AppNavigationBar), findsOneWidget);
        expect(find.text('Bugünün Çalışma Planı'), findsOneWidget);
      },
    );

    testWidgets(
      'Eşleştirme (ConceptMatchScreen) görevi bittiğinde Ana Sayfaya Dön butonu çıkmalı ve ana sayfaya yönlendirmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const tasks = [
          StudyTask(
            id: 'task_game',
            title: 'Kavram Eşleştirme Seti',
            lessonTag: 'Tarih',
            estimatedMinutes: 10,
            actionType: StudyTaskActionType.game,
          ),
        ];

        final testRouter = createAppRouter(initialLocation: '/');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authProvider.overrideWith(() => _TestAuthNotifier()),
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
              studyPlannerProvider.overrideWith(
                () => _TestPlannerNotifier(
                  const StudyPlannerState(tasks: tasks, cycleDay: 1),
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        await tester.scrollUntilVisible(
          find.text('Kavram Eşleştirme Seti'),
          200,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(find.text('Kavram Eşleştirme Seti'));
        await tester.pumpAndSettle();

        expect(find.byType(ConceptMatchScreen), findsOneWidget);
        expect(find.byType(AppNavigationBar), findsNothing);
      },
    );

    testWidgets(
      'Dersler sekmesinde alt konuya girildikten sonra tekrar Dersler sekmesine basıldığında ana Dersler listesine dönülmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final testRouter = createAppRouter(initialLocation: '/lessons');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authProvider.overrideWith(() => _TestAuthNotifier()),
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        // Tarih dersine tıkla -> LessonTopicsScreen açılır (Dersler sekmesi içinde)
        await tester.tap(find.text('Tarih').first);
        await tester.pumpAndSettle();
        expect(find.byType(LessonTopicsScreen), findsOneWidget);

        // Başka bir sekmeye (Ana Sayfa) geç ve tekrar Dersler sekmesine bas
        await tester.tap(find.text('Ana Sayfa'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Dersler'));
        await tester.pumpAndSettle();

        // Alt sayfada takılı kalmayıp ana Dersler listesine dönülmüş olmalı
        expect(find.byType(LessonTopicsScreen), findsNothing);
        expect(find.text('Tarih'), findsWidgets);
      },
    );

    testWidgets(
      'QuizResultScreen üzerinde Ana Sayfaya Dön basıldığında yığın temizlenip doğrudan Ana Sayfa açılmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final testRouter = createAppRouter(initialLocation: '/lessons');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authProvider.overrideWith(() => _TestAuthNotifier()),
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  hasCompletedOnboarding: true,
                  hasActiveStudyProgram: true,
                ),
              ),
            ],
            child: MaterialApp.router(routerConfig: testRouter),
          ),
        );
        await tester.pumpAndSettle();

        // Dersler sekmesindeyken rootNavigator üzerine QuizResultScreen itelim
        final lessonsContext = tester.element(find.text('Tarih').first);
        Navigator.of(lessonsContext, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => const QuizResultScreen(
              result: QuizResult(
                totalQuestions: 10,
                correctCount: 8,
                wrongCount: 2,
                emptyCount: 0,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(QuizResultScreen), findsOneWidget);
        expect(find.byType(QuizScreen), findsNothing);

        // Ana Sayfaya Dön butonuna tıkla
        await tester.tap(find.text('Ana Sayfaya Dön'));
        await tester.pumpAndSettle();

        // QuizResultScreen kapanmalı ve doğrudan Ana Sayfa ('Hoş geldin') görünmeli
        expect(find.byType(QuizResultScreen), findsNothing);
        expect(find.text('Hoş geldin'), findsOneWidget);
      },
    );
  });
}
