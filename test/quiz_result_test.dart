import 'package:kadro/features/quiz/presentation/widgets/victory_story_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('QuizResult Model Testleri', () {
    test('Net hesabı 4 yanlış 1 doğruyu götürecek şekilde hesaplanmalı', () {
      const result = QuizResult(
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 4,
        emptyCount: 2, // 8 - (4 / 4) = 7.0
      );

      expect(result.net, equals(7.0));
    });

    test('Başarı yüzdesi doğru hesaplanmalı', () {
      const result = QuizResult(
        totalQuestions: 4,
        correctCount: 3,
        wrongCount: 1,
        emptyCount: 0,
      );

      expect(result.successRate, equals(75));
    });

    test('Toplam soru 0 ise başarı yüzdesi 0 dönmeli', () {
      const result = QuizResult(
        totalQuestions: 0,
        correctCount: 0,
        wrongCount: 0,
        emptyCount: 0,
      );

      expect(result.successRate, equals(0));
    });
  });

  group('TASK-50: QuizResultScreen & Zero Dead-Ends Köprü Testleri', () {
    testWidgets(
      'wrongCount > 0 olduğunda Yanlış Defterine Git butonu görünmeli ve yönlendirmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const resultWithMistakes = QuizResult(
          totalQuestions: 10,
          correctCount: 7,
          wrongCount: 2,
          emptyCount: 1,
        );

        await tester.pumpWidget(
          const MaterialApp(home: QuizResultScreen(result: resultWithMistakes)),
        );
        await tester.pumpAndSettle();

        expect(find.text('Yanlış Defterine Git (2 Yanlış)'), findsOneWidget);
        expect(find.text('Ana Sayfaya Dön'), findsOneWidget);

        await tester.tap(find.text('Yanlış Defterine Git (2 Yanlış)'));
        await tester.pumpAndSettle();

        expect(find.byType(MistakesScreen), findsOneWidget);
      },
    );

    testWidgets(
      'wrongCount == 0 olduğunda Bilgi Kartlarıyla Hızlı Tekrar butonu görünmeli ve yönlendirmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const perfectResult = QuizResult(
          totalQuestions: 10,
          correctCount: 10,
          wrongCount: 0,
          emptyCount: 0,
        );

        await tester.pumpWidget(
          const MaterialApp(home: QuizResultScreen(result: perfectResult)),
        );
        await tester.pumpAndSettle();

        expect(find.text('Bilgi Kartlarıyla Hızlı Tekrar'), findsOneWidget);
        expect(find.text('Ana Sayfaya Dön'), findsOneWidget);

        await tester.tap(find.text('Bilgi Kartlarıyla Hızlı Tekrar'));
        await tester.pumpAndSettle();

        expect(find.byType(FlashcardsScreen), findsOneWidget);
      },
    );
  });

  group('TASK-52: Zafer Karnesi Paylaşım Modalı Testleri', () {
    testWidgets(
      'QuizResultScreen üzerinde Zafer Karneni Paylaş butonu bulunmalı ve tıklandığında modal açılmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const result = QuizResult(
          totalQuestions: 10,
          correctCount: 9,
          wrongCount: 1,
          emptyCount: 0,
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: QuizResultScreen(
              result: result,
              testTitle: 'Tarih Deneme Testi',
            ),
          ),
        );
        await tester.pumpAndSettle();

        // 1. 'Sonucu Paylaş' butonunu doğrula
        final shareButton = find.text('Sonucu Paylaş');
        expect(shareButton, findsOneWidget);

        // 2. Butona tıkla
        await tester.tap(shareButton);
        await tester.pumpAndSettle();

        // 3. VictoryStoryCard modal içeriğini doğrula
        expect(find.byType(VictoryStoryCard), findsOneWidget);
        expect(find.text('KADRO · KPSS GENEL KÜLTÜR'), findsOneWidget);
        expect(find.textContaining('NET'), findsWidgets);
        expect(find.text('Tarih Deneme Testi'), findsOneWidget);
        expect(find.text('Skorumu & Metni Kopyala'), findsOneWidget);

        expect(find.text('Kapat'), findsOneWidget);

        // 4. Kapat butonuna basıldığında modal kapanmalı
        await tester.tap(find.text('Kapat'));
        await tester.pumpAndSettle();
        expect(find.byType(VictoryStoryCard), findsNothing);
      },
    );

    testWidgets(
      'TASK-155: Misafir kullanıcı testi bitirdiğinde ilerleme kayıt uyarı popupı açılır',
      (WidgetTester tester) async {
        const result = QuizResult(
          totalQuestions: 10,
          correctCount: 8,
          wrongCount: 2,
          emptyCount: 0,
        );

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: QuizResultScreen(result: result)),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('İlerlemeniz Kaydedilmiyor'), findsOneWidget);
        expect(
          find.textContaining('Profil sekmesinden giriş yapabilirsiniz'),
          findsOneWidget,
        );
        expect(find.text('Giriş Yap / Kayıt Ol'), findsOneWidget);
        expect(find.text('Şimdilik Devam Et'), findsOneWidget);

        await tester.tap(find.text('Şimdilik Devam Et'));
        await tester.pumpAndSettle();
        expect(find.text('İlerlemeniz Kaydedilmiyor'), findsNothing);
      },
    );

    testWidgets(
      'TASK-155: Giriş yapmış kullanıcıda misafir kayıt uyarı popupı açılmaz',
      (WidgetTester tester) async {
        const result = QuizResult(
          totalQuestions: 10,
          correctCount: 8,
          wrongCount: 2,
          emptyCount: 0,
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authProvider.overrideWith(() => _AuthenticatedTestAuthNotifier()),
            ],
            child: const MaterialApp(home: QuizResultScreen(result: result)),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('İlerlemeniz Kaydedilmiyor'), findsNothing);
      },
    );
  });

  group(
    'TASK-163: QuizResultScreen Günlük Görev Akışı & Sıradaki Görev Testleri',
    () {
      const testResult = QuizResult(
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 2,
        emptyCount: 0,
      );

      const task1 = StudyTask(
        id: 'task-1',
        title: 'Tarih - İlk Türk Devletleri',
        lessonTag: 'Tarih',
        estimatedMinutes: 15,
        actionType: StudyTaskActionType.quiz,
        isCompleted: true,
      );

      const task2 = StudyTask(
        id: 'task-2',
        title: 'Coğrafya - Dağlar ve Platolar',
        lessonTag: 'Coğrafya',
        estimatedMinutes: 20,
        actionType: StudyTaskActionType.quiz,
        isCompleted: false,
      );

      const task3 = StudyTask(
        id: 'task-3',
        title: 'Vatandaşlık - Temel Kavramlar',
        lessonTag: 'Vatandaşlık',
        estimatedMinutes: 10,
        actionType: StudyTaskActionType.flashcards,
        isCompleted: false,
      );

      testWidgets(
        'Sırada tamamlanmamış görev varken rozet, dinamik akış bandı ve Sıradaki Göreve Geç birincil butonu gösterilmeli',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          const stateWithNext = StudyPlannerState(
            tasks: [task1, task2, task3],
            cycleDay: 1,
          );

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                authProvider.overrideWith(
                  () => _AuthenticatedTestAuthNotifier(),
                ),
                initialUserPreferencesProvider.overrideWithValue(
                  const UserPreferencesState(hasActiveStudyProgram: true),
                ),
                studyPlannerProvider.overrideWith(
                  () => _TestStudyPlannerNotifier(stateWithNext),
                ),
              ],
              child: const MaterialApp(
                home: QuizResultScreen(result: testResult, taskId: 'task-1'),
              ),
            ),
          );
          await tester.pumpAndSettle();

          // 1. Karne Başlığı Rozeti
          expect(
            find.text('✓ Günlük Görev Tamamlandı · 1/3 Görev'),
            findsOneWidget,
          );

          // 2. Dinamik Görev Akış Bandı
          expect(
            find.text('Tebrikler! Bu görev tamamlandı (1/3).'),
            findsOneWidget,
          );
          expect(
            find.text(
              'Sırada Coğrafya - Dağlar ve Platolar görevi seni bekliyor.',
            ),
            findsOneWidget,
          );
          expect(find.text('Sıradaki Göreve Başla →'), findsOneWidget);

          // 3. Birincil ve İkincil Butonlar
          expect(
            find.text('Sıradaki Göreve Geç: Coğrafya - Dağlar ve Platolar →'),
            findsOneWidget,
          );
          expect(find.text('Ana Sayfaya Dön'), findsOneWidget);
        },
      );

      testWidgets(
        'Günün tüm görevleri bittiğinde tebrik bandı ve Günü Tamamladın! Ana Sayfaya Dön butonu gösterilmeli',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final stateAllDone = StudyPlannerState(
            tasks: [
              task1,
              task2.copyWith(isCompleted: true),
              task3.copyWith(isCompleted: true),
            ],
            cycleDay: 2,
          );

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                authProvider.overrideWith(
                  () => _AuthenticatedTestAuthNotifier(),
                ),
                initialUserPreferencesProvider.overrideWithValue(
                  const UserPreferencesState(hasActiveStudyProgram: true),
                ),
                studyPlannerProvider.overrideWith(
                  () => _TestStudyPlannerNotifier(stateAllDone),
                ),
              ],
              child: const MaterialApp(
                home: QuizResultScreen(result: testResult, taskId: 'task-3'),
              ),
            ),
          );
          await tester.pumpAndSettle();

          // 1. Rozet
          expect(
            find.text('✓ Günlük Görev Tamamlandı · 3/3 Görev'),
            findsOneWidget,
          );

          // 2. Dinamik Görev Akış Bandı
          expect(find.text('Harika bir disiplin!'), findsOneWidget);
          expect(
            find.text('Gün 2 için planlanan tüm görevleri tamamladın! 🎉'),
            findsOneWidget,
          );

          // 3. Birincil Buton
          expect(find.text('Günü Tamamladın! Ana Sayfaya Dön'), findsOneWidget);
        },
      );

      testWidgets(
        'Günlük görev dışındaki serbest test çözümlerinde akış bandı ve rozet görünmez',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                authProvider.overrideWith(
                  () => _AuthenticatedTestAuthNotifier(),
                ),
              ],
              child: const MaterialApp(
                home: QuizResultScreen(
                  result: testResult,
                  testTitle: 'Rastgele Serbest Test',
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          // Akış rozeti ve bandı olmamalı
          expect(
            find.textContaining('✓ Günlük Görev Tamamlandı'),
            findsNothing,
          );
          expect(find.textContaining('Sıradaki Göreve Geç'), findsNothing);
          expect(
            find.textContaining('Günü Tamamladın! Ana Sayfaya Dön'),
            findsNothing,
          );

          // Normal butonlar olmalı
          expect(find.text('Ana Sayfaya Dön'), findsOneWidget);
          expect(find.text('Sonucu Paylaş'), findsOneWidget);
        },
      );
    },
  );
}

class _TestStudyPlannerNotifier extends StudyPlannerNotifier {
  final StudyPlannerState initialState;
  _TestStudyPlannerNotifier(this.initialState);

  @override
  StudyPlannerState build() => initialState;
}

class _AuthenticatedTestAuthNotifier extends AuthNotifier {
  @override
  AuthUserState build() =>
      const AuthUserState(isAuthenticated: true, email: 'aday@kadro.app');
}
