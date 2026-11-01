import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/main.dart';

void main() {
  group('StudyPlannerNotifier ve StudyTask Testleri', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'Başlangıçta 3 varsayılan görev gelir ve hiçbiri tamamlanmamıştır',
      () {
        final state = container.read(studyPlannerProvider);

        expect(state.totalCount, 3);
        expect(state.completedCount, 0);
        expect(state.remainingCount, 3);
        expect(state.completionProgress, 0.0);
        expect(state.totalEstimatedMinutes, 50); // 20 + 15 + 15
        expect(
          state.tasks.first.title,
          contains('İslamiyet Öncesi Türk Tarihi'),
        );
      },
    );

    test('toggleTask çağrıldığında görevin tamamlanma durumu güncellenir', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.toggleTask('task_1');

      var state = container.read(studyPlannerProvider);
      expect(state.completedCount, 1);
      expect(state.remainingCount, 2);
      expect(state.completionProgress, closeTo(1 / 3, 0.01));
      expect(
        state.tasks.firstWhere((t) => t.id == 'task_1').isCompleted,
        isTrue,
      );

      // Tekrar tıklandığında geri alınmalı
      notifier.toggleTask('task_1');
      state = container.read(studyPlannerProvider);
      expect(state.completedCount, 0);
      expect(
        state.tasks.firstWhere((t) => t.id == 'task_1').isCompleted,
        isFalse,
      );
    });

    test('addTask yeni görev ekler ve boş başlıkları reddeder', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.addTask(
        title: 'Vatandaşlık Temel Haklar Testi',
        lessonTag: 'Vatandaşlık',
        estimatedMinutes: 30,
        actionType: StudyTaskActionType.quiz,
      );

      var state = container.read(studyPlannerProvider);
      expect(state.totalCount, 4);
      expect(state.tasks.last.title, 'Vatandaşlık Temel Haklar Testi');
      expect(state.tasks.last.lessonTag, 'Vatandaşlık');
      expect(state.tasks.last.estimatedMinutes, 30);
      expect(state.tasks.last.actionType, StudyTaskActionType.quiz);

      // Boş başlık eklenmemeli
      notifier.addTask(title: '   ', lessonTag: 'Genel');
      state = container.read(studyPlannerProvider);
      expect(state.totalCount, 4);
    });

    test('removeTask görevi listeden çıkarır', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.removeTask('task_2');

      final state = container.read(studyPlannerProvider);
      expect(state.totalCount, 2);
      expect(state.tasks.any((t) => t.id == 'task_2'), isFalse);
    });

    test('clearCompleted sadece tamamlanmış görevleri siler', () {
      final notifier = container.read(studyPlannerProvider.notifier);

      notifier.toggleTask('task_1');
      notifier.toggleTask('task_3');

      var state = container.read(studyPlannerProvider);
      expect(state.completedCount, 2);

      notifier.clearCompleted();

      state = container.read(studyPlannerProvider);
      expect(state.totalCount, 1);
      expect(state.tasks.single.id, 'task_2');
      expect(state.completedCount, 0);
    });
  });

  group('StudyPlanner Widget & Entegrasyon Testleri', () {
    testWidgets(
      'HomeScreen üzerinde Bugünün Çalışma Planı kartı ve StudyPlannerScreen entegrasyonu',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // 1. Ana sayfada Bugünün Çalışma Planı kartını doğrula
        expect(find.text('Bugünün Çalışma Planı'), findsOneWidget);
        expect(
          find.text('İslamiyet Öncesi Türk Tarihi 15 Soru Çöz'),
          findsOneWidget,
        );
        expect(find.text('Planlayıcıyı Aç & Görev Ekle'), findsOneWidget);

        // 2. 'Tümünü Gör' butonuna bas ve StudyPlannerScreen ekranına geçişi doğrula
        await tester.tap(find.text('Tümünü Gör'));
        await tester.pumpAndSettle();

        expect(find.byType(StudyPlannerScreen), findsOneWidget);
        expect(find.text('Çalışma Planlayıcın'), findsOneWidget);
        expect(find.text('Görev Listesi (3)'), findsOneWidget);

        // 3. Hızlı şablonlardan '+ 20 Tarih Sorusu'na tıkla ve görev sayısının 4 olduğunu doğrula
        await tester.tap(find.text('+ 20 Tarih Sorusu'));
        await tester.pumpAndSettle();

        expect(find.text('Görev Listesi (4)'), findsOneWidget);
        await tester.drag(find.text('Görev Listesi (4)'), const Offset(0, -400));
        await tester.pumpAndSettle();
        expect(find.text('20 Tarih Sorusu Çöz'), findsOneWidget);
      },
    );
  });
}
