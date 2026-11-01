import 'package:go_router/go_router.dart';
import 'package:kadro/app/app_shell.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';

/// Test ekranına gönderilebilecek opsiyonel parametreler.
///
/// Angular'daki route `data` veya navigation `state` parametrelerine benzer.
class QuizRouteArgs {
  final List<Question>? questions;
  final Duration? examDuration;
  final String? customTitle;
  final String? lessonFilter;
  final String? topicFilter;

  const QuizRouteArgs({
    this.questions,
    this.examDuration,
    this.customTitle,
    this.lessonFilter,
    this.topicFilter,
  });
}

/// Uygulamanın merkezi yönlendirme (routing) tablosu.
///
/// Angular'daki `app.routes.ts` ve `<router-outlet>` mimarisinin karşılığıdır.
/// `StatefulShellRoute.indexedStack` kullanarak alt menü sekmelerinin (branches)
/// durumunu (state) kaybetmeden korunmasını sağlar (Angular tabs / nested routes gibi).
GoRouter createAppRouter({String initialLocation = '/'}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      // Alt Menü Kabuğu (Tabs Shell)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          // 0: Ana Sayfa
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // 1: Dersler
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/lessons',
                builder: (context, state) => const LessonsScreen(),
              ),
            ],
          ),
          // 2: Denemeler
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/exams',
                builder: (context, state) => const ExamsScreen(),
              ),
            ],
          ),
          // 3: İstatistik
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/stats',
                builder: (context, state) => const StatsScreen(),
              ),
            ],
          ),
          // 4: Profil
          StatefulShellBranch(
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
      GoRoute(
        path: '/planner',
        builder: (context, state) => const StudyPlannerScreen(),
      ),
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
    ],
  );
}

/// Uygulama genelinde paylaşılan varsayılan router nesnesi.
final GoRouter appRouter = createAppRouter();
