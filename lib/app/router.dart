import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/app/app_shell.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/current_affairs/presentation/current_affairs_screen.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';
import 'package:kadro/features/topic_lessons/presentation/topic_lesson_screen.dart';

/// Test ekranına gönderilebilecek opsiyonel parametreler.
///
/// Angular'daki route `data` veya navigation `state` parametrelerine benzer.
class QuizRouteArgs {
  final List<Question>? questions;
  final Duration? examDuration;
  final String? customTitle;
  final String? lessonFilter;
  final String? topicFilter;
  final bool fetchAllFromPool;

  const QuizRouteArgs({
    this.questions,
    this.examDuration,
    this.customTitle,
    this.lessonFilter,
    this.topicFilter,
    this.fetchAllFromPool = false,
  });
}

/// Aktif `GoRouter` örneğinin 6 alt sekme dalına (`StatefulShellBranch`) ait
/// navigator anahtarları. Her `createAppRouter()` çağrısında taze anahtarlar
/// üretilir ve `popBranchToRoot` bu aktif anahtarları sıfırlar.
List<GlobalKey<NavigatorState>> _activeBranchNavigatorKeys = List.generate(
  6,
  (index) => GlobalKey<NavigatorState>(debugLabel: 'branch_nav_$index'),
);

/// Belirtilen sekme dalındaki (veya tüm dallardaki) imperatif alt sayfaları
/// (`LessonTopicsScreen`, `TopicTestsScreen`, `QuizHistoryScreen` vb.) kök sayfaya döndürür.
void popBranchToRoot([int? branchIndex]) {
  if (branchIndex != null &&
      branchIndex >= 0 &&
      branchIndex < _activeBranchNavigatorKeys.length) {
    final nav = _activeBranchNavigatorKeys[branchIndex].currentState;
    if (nav != null && nav.canPop()) {
      nav.popUntil((route) => route.isFirst);
    }
    return;
  }
  for (final key in _activeBranchNavigatorKeys) {
    final nav = key.currentState;
    if (nav != null && nav.canPop()) {
      nav.popUntil((route) => route.isFirst);
    }
  }
}

/// Uygulamanın merkezi yönlendirme (routing) tablosu.
///
/// Angular'daki `app.routes.ts` ve `<router-outlet>` mimarisinin karşılığıdır.
/// `StatefulShellRoute.indexedStack` kullanarak 6 alt menü sekmesinin (branches)
/// durumunu (state) kaybetmeden korunmasını sağlar (Angular tabs / nested routes gibi).
GoRouter createAppRouter({String initialLocation = '/'}) {
  final branchKeys = List.generate(
    6,
    (index) => GlobalKey<NavigatorState>(debugLabel: 'branch_nav_$index'),
  );
  _activeBranchNavigatorKeys = branchKeys;

  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      // Alt Menü Kabuğu (Tabs Shell - 6 Sekmeli Dock)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          // 0: Ana Sayfa
          StatefulShellBranch(
            navigatorKey: branchKeys[0],
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // 1: Dersler
          StatefulShellBranch(
            navigatorKey: branchKeys[1],
            routes: [
              GoRoute(
                path: '/lessons',
                builder: (context, state) => const LessonsScreen(),
              ),
            ],
          ),
          // 2: Pratik
          StatefulShellBranch(
            navigatorKey: branchKeys[2],
            routes: [
              GoRoute(
                path: '/practice',
                builder: (context, state) => const PracticeHubScreen(),
              ),
            ],
          ),
          // 3: Denemeler
          StatefulShellBranch(
            navigatorKey: branchKeys[3],
            routes: [
              GoRoute(
                path: '/exams',
                builder: (context, state) => const ExamsScreen(),
              ),
            ],
          ),
          // 4: İstatistik
          StatefulShellBranch(
            navigatorKey: branchKeys[4],
            routes: [
              GoRoute(
                path: '/stats',
                builder: (context, state) => const StatsScreen(),
              ),
            ],
          ),
          // 5: Profil
          StatefulShellBranch(
            navigatorKey: branchKeys[5],
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // Kabuk dışı bağımsız ekranlar (Full Screen Routes)
      GoRoute(
        path: '/quiz',
        builder: (context, state) {
          if (state.extra is QuizRouteArgs) {
            final args = state.extra as QuizRouteArgs;
            return QuizScreen(
              questions: args.questions,
              examDuration: args.examDuration,
              customTitle: args.customTitle,
              lessonFilter: args.lessonFilter,
              topicFilter: args.topicFilter,
              fetchAllFromPool: args.fetchAllFromPool,
            );
          } else if (state.extra is List<Question>) {
            return QuizScreen(questions: state.extra as List<Question>);
          }
          return const QuizScreen();
        },
      ),
      GoRoute(
        path: '/flashcards',
        builder: (context, state) => const FlashcardsScreen(),
      ),
      GoRoute(
        path: '/mistakes',
        builder: (context, state) => const MistakesScreen(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
      GoRoute(path: '/planner', redirect: (context, state) => '/'),
      GoRoute(
        path: '/true-false',
        builder: (context, state) => const TrueFalseBlitzScreen(),
      ),
      GoRoute(
        path: '/concept-match',
        builder: (context, state) => const ConceptMatchScreen(),
      ),
      GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/calculator',
        builder: (context, state) => KpssScoreCalculatorScreen(
          initialExamParam: state.uri.queryParameters['exam'],
        ),
      ),
      GoRoute(
        path: '/current-affairs',
        builder: (context, state) => CurrentAffairsScreen(
          initialMonthParam: state.uri.queryParameters['ay'],
        ),
      ),
      GoRoute(
        path: '/lessons/:lesson/topics/:topic/anlatim',
        builder: (context, state) {
          final lesson = Uri.decodeComponent(
            state.pathParameters['lesson'] ?? '',
          );
          final topic = Uri.decodeComponent(
            state.pathParameters['topic'] ?? '',
          );
          return TopicLessonScreen(lessonName: lesson, topic: topic);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Sayfa bulunamadı')),
      body: EmptyStateView(
        icon: PhosphorIconsRegular.compass,
        title: 'Aradığın sayfa burada değil',
        description: 'Bağlantı değişmiş veya kaldırılmış olabilir. Ana sayfaya dönerek çalışmana devam edebilirsin.',
        actionLabel: 'Ana sayfaya dön',
        onAction: () => context.go('/'),
      ),
    ),
  );
}

/// Uygulama genelinde paylaşılan varsayılan router nesnesi.
final GoRouter appRouter = createAppRouter();
