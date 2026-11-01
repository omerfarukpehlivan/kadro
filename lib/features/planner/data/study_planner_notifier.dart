import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';

/// Çalışma planlayıcı durum sınıfı (Immutable State).
///
/// Web/Angular benzetmesi: Redux/NgRx/Signals store state.
class StudyPlannerState {
  final List<StudyTask> tasks;

  const StudyPlannerState({this.tasks = const []});

  int get totalCount => tasks.length;
  int get completedCount => tasks.where((t) => t.isCompleted).length;
  int get remainingCount => totalCount - completedCount;
  int get totalEstimatedMinutes =>
      tasks.fold(0, (sum, t) => sum + t.estimatedMinutes);
  double get completionProgress =>
      totalCount == 0 ? 0.0 : (completedCount / totalCount).clamp(0.0, 1.0);

  StudyPlannerState copyWith({List<StudyTask>? tasks}) {
    return StudyPlannerState(tasks: tasks ?? this.tasks);
  }
}

/// KPSS Günlük Çalışma Planlayıcı Notifier.
///
/// Web/Angular benzetmesi: Injectable Service + State Machine.
class StudyPlannerNotifier extends Notifier<StudyPlannerState> {
  @override
  StudyPlannerState build() {
    return const StudyPlannerState(
      tasks: [
        StudyTask(
          id: 'task_1',
          title: 'İslamiyet Öncesi Türk Tarihi 15 Soru Çöz',
          lessonTag: 'Tarih',
          estimatedMinutes: 20,
          actionType: StudyTaskActionType.quiz,
        ),
        StudyTask(
          id: 'task_2',
          title: 'Türkiye Coğrafi Konumu Hap Kart Tekrarı',
          lessonTag: 'Coğrafya',
          estimatedMinutes: 15,
          actionType: StudyTaskActionType.flashcards,
        ),
        StudyTask(
          id: 'task_3',
          title: 'Yanlış Defterindeki Soruları Temizle',
          lessonTag: 'Genel',
          estimatedMinutes: 15,
          actionType: StudyTaskActionType.mistakes,
        ),
      ],
    );
  }

  /// Görevin tamamlandı/tamamlanmadı durumunu değiştirir.
  void toggleTask(String id) {
    state = state.copyWith(
      tasks: state.tasks.map((task) {
        if (task.id == id) {
          return task.copyWith(isCompleted: !task.isCompleted);
        }
        return task;
      }).toList(),
    );
  }

  /// Yeni bir KPSS çalışma görevi ekler.
  void addTask({
    required String title,
    required String lessonTag,
    int estimatedMinutes = 25,
    StudyTaskActionType actionType = StudyTaskActionType.custom,
  }) {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty) return;

    final newTask = StudyTask(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: cleanTitle,
      lessonTag: lessonTag,
      estimatedMinutes: estimatedMinutes,
      actionType: actionType,
    );

    state = state.copyWith(tasks: [...state.tasks, newTask]);
  }

  /// Görevi listeden siler.
  void removeTask(String id) {
    state = state.copyWith(
      tasks: state.tasks.where((task) => task.id != id).toList(),
    );
  }

  /// Tamamlanmış tüm görevleri listeden temizler.
  void clearCompleted() {
    state = state.copyWith(
      tasks: state.tasks.where((task) => !task.isCompleted).toList(),
    );
  }
}

/// Global StudyPlanner State Provider'ı.
final studyPlannerProvider =
    NotifierProvider<StudyPlannerNotifier, StudyPlannerState>(
      StudyPlannerNotifier.new,
    );
