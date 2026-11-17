import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';

void main() {
  group('StudyPlannerScreen Kilit ve Görev Tekrarı Testleri', () {
    testWidgets(
      'görevler bitmeden sonraki güne geçiş kilitli olmalı, bitince Tekrar Çöz butonu görünmeli ve önceki güne dönülebilmeli',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        // 1. Programı 30 dk tempo ile kur (3 görev)
        final notifier = container.read(studyPlannerProvider.notifier);
        notifier.setupAutoProgram(
          examTarget: KpssExamTarget.lisans,
          pace: StudyProgramPace.dk30,
        );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(body: StudyPlannerScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // 2. Başlangıçta Gün 1'deyiz ve sonraki güne geçiş alanı henüz görünmemeli
        expect(find.text('Gün 1'), findsOneWidget);
        expect(
          find.textContaining('Günü Tamamladın! Sonraki Güne Geç'),
          findsNothing,
        );
        expect(
          find.textContaining('Tüm Görevleri Tamamlayınca Açılır'),
          findsNothing,
        );

        // Görevler listesine scroll yap
        await tester.drag(find.byType(ListView), const Offset(0, -300));
        await tester.pumpAndSettle();
        expect(find.text('Başla'), findsWidgets);

        // 3. Görevlerin tamamını tamamlayalım
        final tasks = container.read(studyPlannerProvider).tasks;
        for (final t in tasks) {
          notifier.markTaskCompleted(t.id);
        }
        await tester.pumpAndSettle();

        // 4. Görevler tamamlandığında 'Başla' yerine 'Tekrar Çöz' butonları görünmeli
        expect(find.text('Tekrar Çöz'), findsWidgets);

        // Tekrar en üste scroll yapıp summary kartındaki butonu görelim
        await tester.drag(find.byType(ListView), const Offset(0, 300));
        await tester.pumpAndSettle();

        expect(
          find.textContaining('Günü Tamamladın! Sonraki Güne Geç (Gün 2)'),
          findsOneWidget,
        );

        await tester.tap(
          find.textContaining('Günü Tamamladın! Sonraki Güne Geç (Gün 2)'),
        );
        await tester.pumpAndSettle();

        // 6. Artık Gün 2'deyiz
        expect(find.text('Gün 2'), findsOneWidget);

        // 7. Gün 2'deyken 'Önceki Günün Görevlerine Dön' butonu çıkmalı
        expect(
          find.textContaining('Önceki Günün Görevlerine Dön (Gün 1)'),
          findsOneWidget,
        );

        // Önceki güne dönelim
        await tester.tap(
          find.textContaining('Önceki Günün Görevlerine Dön (Gün 1)'),
        );
        await tester.pumpAndSettle();

        // Gün 1 tekrar modunda olmalı
        expect(find.text('Gün 1 · Tekrar'), findsOneWidget);

        // Görevlere doğru kaydır
        await tester.drag(find.byType(ListView), const Offset(0, -300));
        await tester.pumpAndSettle();
        expect(find.text('Tekrar Çöz'), findsWidgets);
      },
    );
  });
}
