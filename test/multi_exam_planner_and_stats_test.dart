import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('TASK-132 Çoklu Sınav Planlayıcı & Snapshot', () {
    test('StudyTask ve PlannerSyncSnapshot examScope serileştirmesi geriye dönük uyumludur', () {
      const gkTask = StudyTask(
        id: 't1',
        title: 'İslamiyet Öncesi · Test 1',
        lessonTag: 'Tarih',
        actionType: StudyTaskActionType.quiz,
        targetTopic: 'İslamiyet Öncesi',
        targetTestNumber: 1,
      );
      expect(gkTask.examScope, 'lisans_gk');
      expect(gkTask.contentIdentity, 'quiz:Tarih:İslamiyet Öncesi:1');

      const dhbtTask = StudyTask(
        id: 't2',
        title: 'Temel İslam · Test 1',
        lessonTag: 'DHBT-1 Temel Din',
        actionType: StudyTaskActionType.quiz,
        targetTopic: 'Fıkıh',
        targetTestNumber: 1,
        examScope: 'dhbt_lisans',
      );
      expect(
        dhbtTask.contentIdentity,
        'dhbt_lisans:quiz:DHBT-1 Temel Din:Fıkıh:1',
      );
      expect(gkTask.isSameTaskItem(dhbtTask), isFalse);

      final parsedDhbt = StudyTask.fromJson(dhbtTask.toJson());
      expect(parsedDhbt.examScope, 'dhbt_lisans');

      final snapOld = PlannerSyncSnapshot(
        cycleDay: 4,
        maxUnlockedDay: 4,
        completedTaskIds: {'old_done'},
        examScope: 'lisans_gk',
        updatedAt: DateTime.utc(2026, 1, 1),
      );
      final snapNew = PlannerSyncSnapshot(
        cycleDay: 1,
        maxUnlockedDay: 1,
        completedTaskIds: {'new_done'},
        tasksByDay: {
          1: [dhbtTask],
        },
        examScope: 'dhbt_lisans',
        updatedAt: DateTime.utc(2026, 2, 1),
      );

      final merged = snapOld.mergeWith(snapNew);
      expect(merged.examScope, 'dhbt_lisans');
      expect(merged.cycleDay, 1);
      expect(merged.completedTaskIds, containsAll(['old_done', 'new_done']));

      final roundTrip = PlannerSyncSnapshot.fromJson(merged.toJson());
      expect(roundTrip.examScope, 'dhbt_lisans');
    });

    test('AutoStudyProgramGenerator farklı ExamCurriculum müfredatlarına göre sıfır havuzda bile çökmeden görev üretir', () {
      // DHBT için henüz soru havuzu boş olsa da kendi müfredat derslerinden çalışma planı üretir
      const dhbtSelection = ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.lisans,
      );
      final dhbtCurriculum = CurriculumRegistry.resolve(dhbtSelection);
      final dhbtTasks = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.dhbt,
        pace: StudyProgramPace.dk60,
        cycleDay: 2,
        curriculum: dhbtCurriculum,
        examScope: dhbtSelection.scopeKey,
      );

      expect(dhbtTasks, isNotEmpty);
      expect(
        dhbtTasks.every((t) => t.examScope == dhbtSelection.scopeKey),
        isTrue,
      );
      // DHBT için Türkiye Harita atölyesi görevi üretilmez
      expect(
        dhbtTasks.any((t) => t.actionType == StudyTaskActionType.map),
        isFalse,
      );

      // 90 dk Gün 4 deneme görevi seçili sınavın toplam soru sayısını hedefler
      const agsSelection = ExamSelection(
        family: KpssExamFamily.mebAgs,
        oabtBranch: OabtBranch.turkce,
      );
      final agsCurriculum = CurriculumRegistry.resolve(agsSelection);
      final agsDay4 = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk90,
        cycleDay: 4,
        curriculum: agsCurriculum,
        examScope: agsSelection.scopeKey,
      );
      final examTask = agsDay4.firstWhere(
        (t) => t.actionType == StudyTaskActionType.exam,
      );
      expect(examTask.targetCount, agsCurriculum.totalQuestions);
      expect(examTask.title, contains('${agsCurriculum.totalQuestions}'));
    });

    test('StudyPlannerNotifier.adaptCurriculumScope tamamlanmış görevleri kapsam bazlı arşivler ve yeni kapsam görevlerini kurar', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyPlannerProvider.notifier);
      notifier.setupAutoProgram(
        examTarget: KpssExamTarget.lisans,
        pace: StudyProgramPace.dk30,
      );

      final firstGkTask = container.read(studyPlannerProvider).tasks.first;
      notifier.toggleTask(firstGkTask.id);
      expect(container.read(studyPlannerProvider).completedCount, 1);

      // E-KPSS'ye geçiş
      const ekpssSelection = ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.lisans,
      );
      final ekpssCurriculum = CurriculumRegistry.resolve(ekpssSelection);
      notifier.adaptCurriculumScope(
        newSelection: ekpssSelection,
        newCurriculum: ekpssCurriculum,
        pace: StudyProgramPace.dk30,
      );

      final ekpssState = container.read(studyPlannerProvider);
      expect(ekpssState.examScope, ekpssSelection.scopeKey);
      expect(
        ekpssState.tasks.every((t) => t.examScope == ekpssSelection.scopeKey),
        isTrue,
      );
      // Önceki GK tamamlamaları arşivde korunmuş olmalı
      final archivedGk = notifier.archivedSnapshotForScope('lisans_gk');
      expect(archivedGk, isNotNull);
      expect(archivedGk!.completedTaskIds, contains(firstGkTask.id));

      // Tekrar GK'ya dönünce arşivlenen ilerleme geri yüklenir
      notifier.adaptCurriculumScope(
        newSelection: const ExamSelection(),
        newCurriculum: CurriculumRegistry.resolve(const ExamSelection()),
        pace: StudyProgramPace.dk30,
      );
      expect(container.read(studyPlannerProvider).examScope, 'lisans_gk');
      expect(container.read(studyPlannerProvider).completedCount, 1);
    });
  });

  group('TASK-132 Kapsam İzole İstatistik & Puan Motoru Stratejisi', () {
    test(
      'StudyStatsState examScope bazında özet, doğruluk ve zayıf ders ayırır',
      () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(studyStatsProvider.notifier);
        notifier.recordAnswer(
          lesson: 'Tarih',
          isCorrect: false,
          examScope: 'lisans_gk',
        );
        notifier.recordAnswer(
          lesson: 'Türkçe',
          isCorrect: true,
          examScope: 'b_grubu_full_lisans',
        );
        notifier.recordAnswer(
          lesson: 'Matematik',
          isCorrect: false,
          examScope: 'b_grubu_full_lisans',
        );

        notifier.recordQuizSession(
          QuizSessionRecord(
            id: 's1',
            title: 'DHBT Denemesi',
            lesson: 'DHBT-1 Temel Din',
            totalQuestions: 10,
            correctCount: 8,
            wrongCount: 2,
            emptyCount: 0,
            netScore: 7.5,
            earnedXp: 100,
            durationSeconds: 300,
            completedAt: DateTime.now(),
            examScope: 'dhbt_lisans',
          ),
        );

        final stats = container.read(studyStatsProvider);
        final gkSummary = stats.statsSummaryForScope('lisans_gk');
        final fullSummary = stats.statsSummaryForScope('b_grubu_full_lisans');
        final dhbtSummary = stats.statsSummaryForScope('dhbt_lisans');
        final allSummary = stats.statsSummaryForScope(null);

        expect(gkSummary.totalSolved, 1);
        expect(gkSummary.weakestLesson, 'Tarih');

        expect(fullSummary.totalSolved, 2);
        expect(fullSummary.accuracyPercent, 50);
        expect(fullSummary.weakestLesson, 'Matematik');

        expect(dhbtSummary.totalSolved, 10);
        expect(dhbtSummary.sessions.length, 1);

        expect(allSummary.totalSolved, 3);
      },
    );

    test(
      'ScoreEngineRegistry B Grubu P1/P2/P3 ağırlıklarını tutarlı hesaplar',
      () {
        const lisansSelection = ExamSelection(
          family: KpssExamFamily.bGrubu,
          educationLevel: EducationLevel.lisans,
        );
        final engine = ScoreEngineRegistry.engineForSelection(lisansSelection);

        final gyHeavy = engine.calculate(
          selection: lisansSelection,
          inputs: const {
            'gy': ScoreSectionInput(correct: 50, wrong: 0),
            'gk': ScoreSectionInput(correct: 20, wrong: 0),
          },
        );
        expect(gyHeavy.isThresholdMet, isTrue);
        expect(gyHeavy.scoreOutputs.length, 3);
        final p1 = gyHeavy.scoreOutputs
            .firstWhere((r) => r.code == 'KPSSP1')
            .score!;
        final p2 = gyHeavy.scoreOutputs
            .firstWhere((r) => r.code == 'KPSSP2')
            .score!;
        final p3 = gyHeavy.scoreOutputs
            .firstWhere((r) => r.code == 'KPSSP3')
            .score!;
        expect(p1, greaterThan(p2));
        expect(p2, greaterThan(p3));
      },
    );
  });
}
