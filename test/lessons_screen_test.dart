import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/lessons/presentation/widgets/lesson_progress_ring.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('LessonProgressRing Widget Testleri', () {
    testWidgets('İlerleme halkası ve merkez ikonu doğru çizilir', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: LessonProgressRing(
                icon: PhosphorIconsBold.bookOpen,
                progress: 0.5,
                solvedCount: 5,
                totalCount: 10,
                size: 52,
              ),
            ),
          ),
        ),
      );

      // Başlangıçta widget'lar mevcut olmalı
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(PhosphorIconsBold.bookOpen), findsOneWidget);
      // Henüz %100 tamamlanmadığı için checkCircle ikonu olmamalı
      expect(find.byIcon(PhosphorIconsFill.checkCircle), findsNothing);

      // 800ms'lik Tween animasyonunu tamamla
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
      '%100 tamamlanma durumunda rozet ve checkCircle ikonu belirir',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Center(
                child: LessonProgressRing(
                  icon: PhosphorIconsDuotone.globeHemisphereEast,
                  progress: 1.0,
                  solvedCount: 30,
                  totalCount: 30,
                  size: 52,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(
          find.byIcon(PhosphorIconsDuotone.globeHemisphereEast),
          findsOneWidget,
        );
        // %100 tamamlanma rozeti
        expect(find.byIcon(PhosphorIconsFill.checkCircle), findsOneWidget);
      },
    );
  });

  group('LessonsScreen ve Çözülen Test Sayacı Entegrasyonu', () {
    testWidgets(
      'Başlangıçta dersler için 0 test ve "Hemen Başla" çağrısı görünür',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // Ders kartlarındaki dairesel ilerleme halkaları
        expect(find.byType(LessonProgressRing), findsWidgets);

        // Tarih, Coğrafya vb. ders isimleri
        expect(find.text('Tarih'), findsOneWidget);
        expect(find.text('Coğrafya'), findsOneWidget);

        // Başlangıç durumu rozeti
        expect(find.textContaining('Hemen Başla ▶'), findsWidgets);
      },
    );

    testWidgets(
      'Çözülen testler eklendiğinde ilerleme halkası ve sayaç güncellenir',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        // Tarih dersine 5 adet çözülmüş test oturumu ekle
        final now = DateTime.now();
        for (int i = 0; i < 5; i++) {
          container
              .read(studyStatsProvider.notifier)
              .recordQuizSession(
                QuizSessionRecord(
                  id: 'sess_$i',
                  title: 'Tarih Test $i',
                  lesson: 'Tarih',
                  totalQuestions: 10,
                  correctCount: 8,
                  wrongCount: 2,
                  emptyCount: 0,
                  netScore: 7.5,
                  earnedXp: 80,
                  durationSeconds: 300,
                  completedAt: now,
                ),
              );
        }

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // 5 / 35 Test Çözüldü (%14) görünmeli
        expect(
          find.textContaining('5 / 35 Test Çözüldü (%14)'),
          findsOneWidget,
        );
      },
    );
  });

  group('TASK-77: LessonTopicsScreen Çözülen/Mevcut Test Sayısı ve Tamamlanma Rozeti', () {
    testWidgets(
      'Kısmen çözülmüş konuda (1/9) 1/9 Test yazar, sol düğümde tik bulunmaz (numara görünür)',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        // Tarih dersinin ilk konusu için sadece 1 test oturumu kaydet
        final now = DateTime.now();
        container
            .read(studyStatsProvider.notifier)
            .recordQuizSession(
              QuizSessionRecord(
                id: 'sess_tarih_1',
                title: 'Tarih · İslamiyet Öncesi Türk Tarihi · Test 1',
                lesson: 'Tarih',
                totalQuestions: 10,
                correctCount: 9,
                wrongCount: 1,
                emptyCount: 0,
                netScore: 8.75,
                earnedXp: 90,
                durationSeconds: 240,
                completedAt: now,
              ),
            );

        final tarihLesson = kpssLessons.firstWhere((l) => l.name == 'Tarih');

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(home: LessonTopicsScreen(lesson: tarihLesson)),
          ),
        );

        await tester.pumpAndSettle();

        // 1/9 Test rozeti görünmeli (ve henüz hepsi bitmediği için PhosphorIconsBold.chartPieSlice bulunmalı)
        expect(find.text('1/9 Test'), findsOneWidget);
        expect(find.byIcon(PhosphorIconsBold.chartPieSlice), findsOneWidget);

        // Sol yuvarlak düğümde tik OLMAMALI (findsNothing)
        expect(find.byIcon(PhosphorIconsBold.check), findsNothing);

        // Sol yuvarlak düğümde sıra numarası '1' görünmeli
        expect(find.text('1'), findsWidgets);
      },
    );

    testWidgets(
      'Tüm testleri çözülmüş konuda (2/2) 2/2 Test yazar ve sol düğümde tik (✓) görünür',
      (WidgetTester tester) async {
        final container = ProviderContainer(
          overrides: [
            lessonTopicTestCountsProvider(
              'Tarih',
            ).overrideWith((ref) async => {'İslamiyet Öncesi Türk Tarihi': 2}),
          ],
        );
        addTearDown(container.dispose);

        final now = DateTime.now();
        // 2 testin 2'sini de çöz
        for (int i = 1; i <= 2; i++) {
          container
              .read(studyStatsProvider.notifier)
              .recordQuizSession(
                QuizSessionRecord(
                  id: 'sess_tarih_$i',
                  title: 'Tarih · İslamiyet Öncesi Türk Tarihi · Test $i',
                  lesson: 'Tarih',
                  totalQuestions: 10,
                  correctCount: 10,
                  wrongCount: 0,
                  emptyCount: 0,
                  netScore: 10.0,
                  earnedXp: 100,
                  durationSeconds: 200,
                  completedAt: now,
                ),
              );
        }

        final tarihLesson = kpssLessons.firstWhere((l) => l.name == 'Tarih');

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(home: LessonTopicsScreen(lesson: tarihLesson)),
          ),
        );

        await tester.pumpAndSettle();

        // 2/2 Test rozeti görünmeli
        expect(find.text('2/2 Test'), findsOneWidget);

        // Rozette checkCircle ikonu olmalı
        expect(find.byIcon(PhosphorIconsFill.checkCircle), findsOneWidget);

        // Sol yuvarlak düğümde tik (PhosphorIconsBold.check) görünmeli
        expect(find.byIcon(PhosphorIconsBold.check), findsOneWidget);
      },
    );

    testWidgets('Hiç çözülmemiş konularda 0/X Test nötr rozeti görünür', (
      WidgetTester tester,
    ) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final tarihLesson = kpssLessons.firstWhere((l) => l.name == 'Tarih');

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(home: LessonTopicsScreen(lesson: tarihLesson)),
        ),
      );

      await tester.pumpAndSettle();

      // İlk konu hiç çözülmediğinde 0/9 Test görünmeli
      expect(find.text('0/9 Test'), findsWidgets);
    });
  });
}
