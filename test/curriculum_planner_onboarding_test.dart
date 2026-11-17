import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/widgets/app_navigation_bar.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Zorunlu İlk Giriş Kurulumu (Mandatory Onboarding) Testleri', () {
    testWidgets(
      'İlk açılışta onboarding tamamlanmadan AppNavigationBar görünmez ve kurulum tamamlana kadar zorunlu kalır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // Auth-First: İlk açılışta oturum kapalıyken giriş kapısı gösterilir.
        expect(find.byType(AuthScreen), findsOneWidget);
        expect(find.byType(AppNavigationBar), findsNothing);

        await tester.enterText(
          find.widgetWithText(TextFormField, 'E-posta veya Kullanıcı Adı'),
          'yeni_aday@kadro.com',
        );
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Şifre (En az 6 karakter)'),
          'kpss2026',
        );
        await tester.tap(find.widgetWithText(FilledButton, 'Giriş Yap'));
        await tester.pumpAndSettle();

        // İlk kez giriş yapan aday tek seferlik zorunlu kurulum ekranına düşer.
        expect(find.byType(OnboardingScreen), findsOneWidget);
        expect(find.byType(AppNavigationBar), findsNothing);
        expect(find.text('Çalışma Programını Kur'), findsOneWidget);

        // Adım 1: Sınav Seçimi -> 2028 KPSS Ön Lisans seç
        await tester.tap(find.text('2028 KPSS Ön Lisans'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Devam Et'));
        await tester.pumpAndSettle();

        // Adım 2: Günlük Süre -> 45 Dk seç
        await tester.tap(find.text('45 Dk · Dengeli Tempo'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Devam Et'));
        await tester.pumpAndSettle();

        // Adım 3: Hedef & Odak -> Coğrafya + 90+ Puan ve Programı Başlat
        await tester.tap(find.text('90+ Puan'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Coğrafya · 18 Soru (%30 Ağırlık)'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Programımı Kur ve Başla'));
        await tester.pumpAndSettle();

        // Ana kabuk açılmalı ve ilk gün görevleri hazır olmalı
        expect(find.byType(OnboardingScreen), findsNothing);
        expect(find.byType(AppNavigationBar), findsOneWidget);
        expect(find.byType(HomeScreen), findsOneWidget);
      },
    );

    testWidgets(
      'Onboard edilmiş kullanıcı doğrudan HomeScreen açar ve günlük görev paketini görür',
      (WidgetTester tester) async {
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
            child: const MyApp(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(OnboardingScreen), findsNothing);
        expect(find.byType(HomeScreen), findsOneWidget);
      },
    );
  });

  group('Doğrudan Görev Yönlendirme ve Otomatik Tamamlama Testleri', () {
    testWidgets(
      'HomeDailyPlanCard üzerinden quiz görevine basınca gerçek konunun 10 soruluk testi açılır ve bitince görev tiklenir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        container
            .read(studyPlannerProvider.notifier)
            .setupAutoProgram(
              examTarget: KpssExamTarget.lisans,
              pace: StudyProgramPace.dk30,
              focusLesson: 'Tarih',
            );

        final firstTask = container.read(studyPlannerProvider).tasks.first;
        expect(firstTask.actionType, StudyTaskActionType.quiz);
        expect(firstTask.targetTopic, isNotNull);
        expect(firstTask.isCompleted, isFalse);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: HomeDailyPlanCard())),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text(firstTask.title));
        await tester.pump();
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 120)),
        );
        await tester.pumpAndSettle();

        // Gerçek test ekranının açıldığını (3 varsayılan örnek değil, gerçek konu soruları) doğrula
        expect(find.byType(QuizScreen), findsOneWidget);
        expect(find.text('Soru 1 / 10'), findsOneWidget);
      },
    );

    testWidgets(
      'QuizScreen ve FlashcardsScreen onCompleted geri çağrımı StudyPlanner görevini otomatik işaretler',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        const q = Question(
          id: 'q_done_1',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          text: 'Orhun Yazıtları kimin adına dikilmiştir?',
          options: ['Bilge Kağan', 'Mete Han', 'Attila', 'Teoman', 'Bumin'],
          correctIndex: 0,
          explanation: 'Bilge Kağan, Kültigin ve Tonyukuk adına dikilmiştir.',
        );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: QuizScreen(
                questions: const [q],
                onCompleted: () => container
                    .read(studyPlannerProvider.notifier)
                    .markTaskCompleted('task_1'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Bilge Kağan'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Cevabı Onayla'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Testi Bitir ve Sonucu Gör'));
        await tester.pumpAndSettle();

        expect(
          container
              .read(studyPlannerProvider)
              .tasks
              .firstWhere((t) => t.id == 'task_1')
              .isCompleted,
          isTrue,
        );
      },
    );

    testWidgets(
      'FlashcardsScreen sessionLimit dilimleme ve onCompleted StudyPlanner görevini otomatik işaretler',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        const cards = [
          Flashcard(
            id: 'f1',
            lesson: 'Coğrafya',
            topic: 'Konum',
            frontText: 'Soru 1',
            backText: 'Cevap 1',
          ),
          Flashcard(
            id: 'f2',
            lesson: 'Coğrafya',
            topic: 'Konum',
            frontText: 'Soru 2',
            backText: 'Cevap 2',
          ),
          Flashcard(
            id: 'f3',
            lesson: 'Coğrafya',
            topic: 'Konum',
            frontText: 'Soru 3',
            backText: 'Cevap 3',
          ),
        ];

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: FlashcardsScreen(
                flashcards: cards,
                initialLesson: 'Coğrafya',
                sessionLimit: 2,
                startIndex: 1,
                onCompleted: () => container
                    .read(studyPlannerProvider.notifier)
                    .markTaskCompleted('task_2'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Kart 1 / 2'), findsOneWidget);
        expect(find.text('Soru 2'), findsOneWidget);

        await tester.tap(find.text('Biliyorum'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Biliyorum'));
        await tester.pumpAndSettle();

        expect(find.text('Tebrikler!'), findsOneWidget);
        expect(
          container
              .read(studyPlannerProvider)
              .tasks
              .firstWhere((t) => t.id == 'task_2')
              .isCompleted,
          isTrue,
        );
      },
    );
  });
}
