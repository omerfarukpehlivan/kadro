import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/lessons/presentation/widgets/lesson_progress_ring.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
                icon: LucideIcons.bookOpen,
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
      expect(find.byIcon(LucideIcons.bookOpen), findsOneWidget);
      // Henüz %100 tamamlanmadığı için checkCheck ikonu olmamalı
      expect(find.byIcon(LucideIcons.checkCheck), findsNothing);

      // 800ms'lik Tween animasyonunu tamamla
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('%100 tamamlanma durumunda rozet ve checkCheck ikonu belirir', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: LessonProgressRing(
                icon: LucideIcons.globe,
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
      expect(find.byIcon(LucideIcons.globe), findsOneWidget);
      // %100 tamamlanma rozeti
      expect(find.byIcon(LucideIcons.checkCheck), findsOneWidget);
    });
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
}
