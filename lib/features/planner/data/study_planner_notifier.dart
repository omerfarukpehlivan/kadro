import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';

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
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();
  final LocalStorageService _storage = LocalStorageService();

  @override
  StudyPlannerState build() {
    unawaited(_loadFromStorage());
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

  Future<void> _loadFromStorage() async {
    final saved = await _storage.loadStudyTasks();
    if (saved != null && saved.isNotEmpty) {
      state = state.copyWith(tasks: saved);
    }
  }

  /// Görevin tamamlandı/tamamlanmadı durumunu değiştirir.
  void toggleTask(String id) {
    StudyTask? updatedTask;

    state = state.copyWith(
      tasks: state.tasks.map((task) {
        if (task.id == id) {
          final toggled = task.copyWith(isCompleted: !task.isCompleted);
          updatedTask = toggled;
          return toggled;
        }
        return task;
      }).toList(),
    );

    unawaited(_storage.saveStudyTasks(state.tasks));

    if (updatedTask != null) {
      unawaited(
        _cloudSync.updateStudyTaskCompletion(
          title: updatedTask!.title,
          isCompleted: updatedTask!.isCompleted,
        ),
      );
    }
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
    unawaited(_storage.saveStudyTasks(state.tasks));
    unawaited(_cloudSync.insertStudyTask(newTask));
  }

  /// Görevi listeden siler.
  void removeTask(String id) {
    StudyTask? removedTask;
    for (final t in state.tasks) {
      if (t.id == id) {
        removedTask = t;
        break;
      }
    }

    state = state.copyWith(
      tasks: state.tasks.where((task) => task.id != id).toList(),
    );

    unawaited(_storage.saveStudyTasks(state.tasks));

    if (removedTask != null) {
      unawaited(_cloudSync.deleteStudyTaskByTitle(removedTask.title));
    }
  }

  /// Tamamlanmış tüm görevleri listeden temizler.
  void clearCompleted() {
    final completedTasks = state.tasks.where((t) => t.isCompleted).toList();
    state = state.copyWith(
      tasks: state.tasks.where((task) => !task.isCompleted).toList(),
    );

    unawaited(_storage.saveStudyTasks(state.tasks));

    for (final task in completedTasks) {
      unawaited(_cloudSync.deleteStudyTaskByTitle(task.title));
    }
  }

  /// Buluttaki kayıtlı görevleri yükler.
  Future<void> loadTasksFromCloud() async {
    final remoteTasks = await _cloudSync.fetchStudyTasks();
    if (remoteTasks.isNotEmpty) {
      state = state.copyWith(tasks: remoteTasks);
      unawaited(_storage.saveStudyTasks(state.tasks));
    }
  }
}

/// Global StudyPlanner State Provider'ı.
final studyPlannerProvider =
    NotifierProvider<StudyPlannerNotifier, StudyPlannerState>(
      StudyPlannerNotifier.new,
    );
