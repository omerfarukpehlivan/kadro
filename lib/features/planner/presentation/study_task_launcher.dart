import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/exams/presentation/widgets/blueprint_exam_launcher.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/map_practice/data/map_practice_repository.dart';
import 'package:kadro/features/map_practice/presentation/map_challenge_screen.dart';
import 'package:kadro/features/map_practice/presentation/map_practice_hub_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

/// Çalışma planlayıcıdaki herhangi bir [StudyTask] öğesini doğrudan ilgili
/// gerçek KPSS testine, hap bilgi kartı setine, harita oturumuna veya denemeye
/// yönlendiren ve oturum bitiminde görevi otomatik tamamlayan ortak yardımcı.
class StudyTaskLauncher {
  StudyTaskLauncher._();

  static Future<void> launch(
    BuildContext context,
    WidgetRef ref,
    StudyTask task,
  ) async {
    void markDone() {
      ref.read(studyPlannerProvider.notifier).markTaskCompleted(task.id);
    }

    switch (task.actionType) {
      case StudyTaskActionType.quiz:
        await _launchQuizTask(context, ref, task, markDone);
        break;

      case StudyTaskActionType.flashcards:
        if (!context.mounted) return;
        await Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => FlashcardsScreen(
              initialLesson: task.lessonTag == 'Genel' ? null : task.lessonTag,
              startIndex: task.startIndex ?? 0,
              sessionLimit: task.targetCount ?? 10,
              onCompleted: markDone,
              taskId: task.id,
            ),
          ),
        );
        break;

      case StudyTaskActionType.map:
        await _launchMapTask(context, ref, task, markDone);
        break;

      case StudyTaskActionType.exam:
        if (!context.mounted) return;
        final selection = readOrWatchExamSelection(ref);
        if (selection.family != KpssExamFamily.bGrubu ||
            selection.bGroupProfile != BGroupProfile.onlyGk) {
          final blueprint = ExamBlueprintRegistry.primaryFullExamFor(selection);
          await launchBlueprintExamWithGuard(
            context: context,
            ref: ref,
            blueprint: blueprint,
            selection: selection,
            onCompleted: markDone,
            taskId: task.id,
          );
          break;
        }
        await Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => task.targetExamNumber != null
                ? QuizScreen(
                    mockExamNumber: task.targetExamNumber,
                    examSelection: selection,
                    examDuration: const Duration(minutes: 65),
                    mode: QuizMode.exam,
                    customTitle: task.title,
                    onCompleted: markDone,
                    taskId: task.id,
                  )
                : const ExamsScreen(),
          ),
        );
        break;

      case StudyTaskActionType.game:
        if (!context.mounted) return;
        await Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => ConceptMatchScreen(
              initialSetIndex: task.startIndex ?? 0,
              onCompleted: markDone,
              taskId: task.id,
            ),
          ),
        );
        break;

      case StudyTaskActionType.mistakes:
        if (!context.mounted) return;
        await Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) =>
                MistakesScreen(onCompleted: markDone, taskId: task.id),
          ),
        );
        break;

      case StudyTaskActionType.custom:
        if (!context.mounted) return;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Görev: ${task.title}')));
        break;
    }
  }

  static Future<void> _launchQuizTask(
    BuildContext context,
    WidgetRef ref,
    StudyTask task,
    VoidCallback markDone,
  ) async {
    final lesson = task.lessonTag == 'Genel' ? null : task.lessonTag;
    final topic = task.targetTopic;
    final testNo = task.targetTestNumber;
    final selection = readOrWatchExamSelection(ref);

    if (!context.mounted) return;
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          lessonFilter: lesson,
          topicFilter: topic,
          topicTestNumber: testNo,
          examSelection: selection,
          limit: testNo == null ? (task.targetCount ?? 10) : null,
          customTitle: lesson != null ? '$lesson · ${task.title}' : task.title,
          onCompleted: markDone,
          taskId: task.id,
        ),
      ),
    );
  }

  static Future<void> _launchMapTask(
    BuildContext context,
    WidgetRef ref,
    StudyTask task,
    VoidCallback markDone,
  ) async {
    try {
      final repo = ref.read(mapPracticeRepositoryProvider);
      final challenges = await repo.getDailyMarathonChallenges(
        count: task.targetCount ?? 5,
      );
      if (challenges.isNotEmpty && context.mounted) {
        await Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => MapChallengeScreen(
              challenges: challenges,
              sessionTitle: task.title,
              onCompleted: markDone,
            ),
          ),
        );
        return;
      }
    } catch (_) {
      // Hata olursa Harita Atölyesi merkezine yönlendir
    }

    if (!context.mounted) return;
    await Navigator.of(
      context,
      rootNavigator: true,
    ).push(MaterialPageRoute(builder: (_) => const MapPracticeHubScreen()));
  }
}
