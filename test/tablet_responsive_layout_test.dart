import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/app/widgets/app_top_bar.dart';
import 'package:kadro/core/services/ad_service.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart' show Question;
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';
import 'package:kadro/features/reports/data/question_report_repository.dart';
import 'package:kadro/features/reports/presentation/admin_reports_screen.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/stats/presentation/quiz_history_screen.dart';
import 'package:kadro/features/stats/presentation/quiz_session_detail_screen.dart';
import 'package:kadro/main.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
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
        text: 'Örnek tablet split-pane test sorusu',
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
    PurchaseService.resetForTest();
    AdService.resetForTest();
  });

  tearDown(() {
    PurchaseService.resetForTest();
    AdService.resetForTest();
  });

  group('Telefon & Tablet Kabuk Kırılım Testleri', () {
    testWidgets(
      '360x640 kompakt telefon ve 768x1024 dikey tablette AppNavigationBar, 920x700 ile 1280x800 yatay tabletlerde NavigationRail render edilir',
      (WidgetTester tester) async {
        // 360x640 telefon ve 768x1024 dikey tablet -> alt gezinme çubuğu
        for (final size in const [Size(360, 640), Size(768, 1024)]) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          await tester.pumpWidget(_buildOnboardedShellApp());
          await tester.pumpAndSettle();

          expect(find.byType(AppNavigationBar), findsOneWidget);
          expect(find.byType(AppTopBar), findsOneWidget);
          expect(find.byType(NavigationRail), findsNothing);
          expect(tester.takeException(), isNull);

          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        }

        // 920x700, 1024x768 ve 1280x800 yatay tablet -> NavigationRail + AppTopBar
        for (final size in const [
          Size(920, 700),
          Size(1024, 768),
          Size(1280, 800),
        ]) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          await tester.pumpWidget(_buildOnboardedShellApp());
          await tester.pumpAndSettle();

          expect(find.byType(NavigationRail), findsOneWidget);
          expect(find.byType(AppTopBar), findsOneWidget);
          expect(find.byType(AppNavigationBar), findsNothing);
          expect(tester.takeException(), isNull);

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
      'Tablet ve telefonda yakınlaştırma ipucu metinleri dokunmatik iki parmak yönlendirmesi döner',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(
                  ResponsiveBreakpoints.zoomHintText(context),
                  'İki parmağınızla yakınlaştırabilirsiniz',
                );
                expect(
                  ResponsiveBreakpoints.zoomHintText(context, includePan: true),
                  'İki parmağınızla yakınlaştırıp kaydırabilirsiniz',
                );
                expect(
                  ResponsiveBreakpoints.zoomHintText(
                    context,
                    selectProvince: true,
                  ),
                  'İki parmakla yakınlaştırıp ili seçin',
                );
                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  });

  group('Tablet Split-Pane, Master-Detail & Çok Sütunlu Düzen Testleri', () {
    testWidgets(
      '1280x800 tablette QuizScreen şık eleme, çözüm açma ve soru gezinti paleti dokunmatik çalışır',
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
              home: const QuizScreen(
                questions: defaultSampleQuestions,
                mode: QuizMode.learning,
                customTitle: 'Tablet Sınav Testi',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(OptionTile), findsNWidgets(5));
        expect(find.text('Klavye Kısayolları'), findsNothing);

        // İlk şıkkın dokunmatik eleme butonuna dokun
        await tester.tap(find.byKey(const ValueKey('option_eliminate_A')));
        await tester.pumpAndSettle();
        final firstOption = tester.widget<OptionTile>(
          find.byType(OptionTile).first,
        );
        expect(firstOption.isEliminated, isTrue);

        // C şıkkını (index 2) seç ve onayla
        await tester.tap(find.byType(OptionTile).at(2));
        await tester.pumpAndSettle();

        final submitBtn = find.widgetWithText(FilledButton, 'Cevabı Onayla');
        await tester.ensureVisible(submitBtn);
        await tester.tap(submitBtn);
        await tester.pumpAndSettle();

        expect(find.text('Çözüm Açıklaması'), findsOneWidget);
        expect(find.text('ÖSYM ÇELDİRİCİ TUZAĞI'), findsOneWidget);

        // Soru gezinti paletini aç
        await tester.tap(find.byTooltip('Soru Gezinti Paleti'));
        await tester.pumpAndSettle();
        expect(find.text('Optik Form & Soru Gezintisi'), findsOneWidget);
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
      '1280x800 FlashcardsScreen Split-Pane telemetri paneli ve dokunmatik butonlar taşmadan çalışır',
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

        expect(find.text('Klavye Kısayolları'), findsNothing);
        expect(find.text('Kartı Çevir'), findsOneWidget);

        await tester.tap(find.text('Kartı Çevir'));
        await tester.pumpAndSettle();

        await tester.tap(find.widgetWithText(FilledButton, 'Biliyorum'));
        await tester.pumpAndSettle();

        expect(find.textContaining('1 kart incelendi'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      '1280x800 StudyPlannerScreen, QuizHistoryScreen, MistakesScreen, AdminReportsScreen, AuthScreen, Calculator ve TrueFalseBlitzScreen taşmadan render edilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // 1. StudyPlannerScreen 2 sütunlu Bento
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const StudyPlannerScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(FloatingActionButton), findsNothing);
        expect(
          find.byKey(const ValueKey('planner_desktop_add_task_button')),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);

        // 2. QuizHistoryScreen Master-Detail
        final container = ProviderContainer();
        addTearDown(container.dispose);

        container.read(studyStatsProvider.notifier)
          ..recordQuizSession(
            QuizSessionRecord(
              id: 'sess_tablet_1',
              title: 'Tarih Konu Denemesi',
              lesson: 'Tarih',
              totalQuestions: 10,
              correctCount: 9,
              wrongCount: 1,
              emptyCount: 0,
              netScore: 8.75,
              earnedXp: 140,
              durationSeconds: 180,
              completedAt: DateTime(2026, 11, 17, 14, 0),
            ),
          )
          ..recordQuizSession(
            QuizSessionRecord(
              id: 'sess_tablet_2',
              title: 'Coğrafya Harita Tekrarı',
              lesson: 'Coğrafya',
              totalQuestions: 10,
              correctCount: 7,
              wrongCount: 3,
              emptyCount: 0,
              netScore: 6.25,
              earnedXp: 110,
              durationSeconds: 200,
              completedAt: DateTime(2026, 11, 17, 15, 0),
            ),
          );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              key: const ValueKey('history_app'),
              theme: AppTheme.light,
              home: const QuizHistoryScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(
          tester
              .widget<QuizSessionDetailScreen>(
                find.byType(QuizSessionDetailScreen),
              )
              .isEmbedded,
          isTrue,
        );
        expect(tester.takeException(), isNull);

        // 3. MistakesScreen & AdminReportsScreen ResponsiveGrid
        const mistakeRepo = MistakeRepository();
        mistakeRepo.clearForTest();
        const reportRepo = QuestionReportRepository();
        reportRepo.clearForTest();
        addTearDown(() {
          mistakeRepo.clearForTest();
          reportRepo.clearForTest();
        });

        mistakeRepo.addMistake(
          const Question(
            id: 'tab_m1',
            lesson: 'Tarih',
            topic: 'İlk Türk Devletleri',
            text: 'Tablet yanlış sorusu 1',
            options: ['A', 'B', 'C', 'D', 'E'],
            correctIndex: 0,
            explanation: 'Açıklama 1',
          ),
        );

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              key: const ValueKey('mistakes_app'),
              theme: AppTheme.light,
              home: const MistakesScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(ResponsiveGrid), findsOneWidget);
        expect(tester.takeException(), isNull);

        await reportRepo.submitReport(
          QuestionReport(
            id: 'tab_rep_1',
            questionId: 'q1',
            lesson: 'Tarih',
            topic: 'Osmanlı Kültür Medeniyeti',
            testTitle: 'Genel Tekrar Testi 1',
            questionText: 'Örnek bildirim sorusu 1',
            reason: 'Cevap anahtarı hatalı',
            createdAt: DateTime(2026, 11, 17, 10, 0),
          ),
        );

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              key: const ValueKey('reports_app'),
              theme: AppTheme.light,
              home: const AdminReportsScreen(repository: reportRepo),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(ResponsiveGrid), findsOneWidget);
        expect(tester.takeException(), isNull);

        // 4. AuthScreen sade form & TrueFalseBlitzScreen dokunmatik etiketler
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              key: const ValueKey('auth_app'),
              theme: AppTheme.light,
              home: const AuthScreen(isInitialGate: true),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Kadro Masaüstü Çalışma Stüdyosu'), findsNothing);
        expect(
          find.byKey(const ValueKey('auth_guest_calculator_button')),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              key: const ValueKey('tf_app'),
              theme: AppTheme.light,
              home: TrueFalseBlitzScreen(
                items: sampleTrueFalseItems.take(2).toList(),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('DOĞRU'), findsOneWidget);
        expect(find.text('YANLIŞ'), findsOneWidget);
        expect(tester.takeException(), isNull);

        // 5. /calculator rotası uygulama içi puan hesaplama açılışı
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp.router(
              key: const ValueKey('calc_router_app'),
              theme: AppTheme.light,
              routerConfig: createAppRouter(
                initialLocation: '/calculator?exam=p93',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(KpssScoreCalculatorScreen), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });

  group('Mobil & Tablet Servis Kontrolleri', () {
    test(
      'OfflineDownloadService ve PurchaseService mobil akışları çalışır',
      () async {
        final offlineService = OfflineDownloadService();
        await offlineService.downloadPackage(
          packageId: 'test_pkg',
          questions: const <Question>[],
          isPro: true,
        );
        expect(await offlineService.isPackageDownloaded('test_pkg'), isTrue);

        PurchaseService.enableMockMode();
        expect(PurchaseService.availability, PurchaseAvailability.testMock);
        expect(
          await PurchaseService.purchasePlan(SubscriptionPlan.monthly),
          isTrue,
        );
        expect(AdService.isRewardedAdSupported, isTrue);
      },
    );
  });
}
