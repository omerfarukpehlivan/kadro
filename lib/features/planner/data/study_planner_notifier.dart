import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

/// Uygulama başlangıcında `SharedPreferences` içinden önceden okunan paket gün numarası.
final initialPlannerCycleDayProvider = Provider<int?>((ref) => null);

/// Uygulama başlangıcında `SharedPreferences` içinden önceden okunan çalışma planı durumu.
final initialPlannerStateProvider = Provider<StudyPlannerState?>((ref) => null);

/// Çalışma planlayıcı durum sınıfı (Immutable State).
///
/// Web/Angular benzetmesi: Redux/NgRx/Signals store state.
class StudyPlannerState {
  final List<StudyTask> tasks;

  /// Şu anda ekranda görüntülenen ve çalışılan gün numarası (1-tabanlı).
  final int cycleDay;

  /// Kullanıcının başarıyla ulaştığı ve kilidi açılmış en yüksek gün numarası.
  ///
  /// Günlük görevlerin tamamı bitmeden (`allCompleted == false`) yeni bir günün
  /// kilidi açılamaz; ancak daha önce kilidi açılmış geçmiş günlere dönüldüğünde
  /// bu günlere tekrar serbestçe geçilebilir.
  final int maxUnlockedDay;

  /// Kullanıcının daha önce tamamlanmış geçmiş bir günü mü inceliyor/tekrar ediyor?
  bool get isViewingPastDay => cycleDay < maxUnlockedDay;

  /// Planın bağlı olduğu aktif sınav kapsamı (`'lisans_gk'`, `'ekpss_lisans'` vb.).
  final String examScope;

  /// Planın en son aktif olduğu takvim günü (Telafi Modu gecikme tespiti için).
  final DateTime? lastPlannedDate;

  /// Sınava `<= 30` gün kala veya kullanıcı tercihiyle açılan yoğun Sprint Modu.
  final bool isSprintModeActive;

  /// Kullanıcının seçtiği haftalık çalışma günleri (`1` = Pzt ... `7` = Paz).
  final List<int> weeklyStudyDays;

  const StudyPlannerState({
    this.tasks = const [],
    this.cycleDay = 1,
    this.maxUnlockedDay = 1,
    this.examScope = 'lisans_gk',
    this.lastPlannedDate,
    this.isSprintModeActive = false,
    this.weeklyStudyDays = const [1, 2, 3, 4, 5, 6, 7],
  });

  /// Son planlı çalışma tarihinden bugüne kaç aktif çalışma günü geciktiğini döner (`TASK-159`).
  int missedDaysCount({DateTime? now}) {
    final lastDate = lastPlannedDate;
    if (lastDate == null || remainingCount == 0) return 0;
    final refNow = now ?? DateTime.now();
    final today = DateTime(refNow.year, refNow.month, refNow.day);
    final plannedDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
    final diffDays = today.difference(plannedDay).inDays;
    if (diffDays <= 0) return 0;

    final activeDays = weeklyStudyDays.toSet();
    var missed = 0;
    for (var i = 0; i < diffDays; i++) {
      final cursor = plannedDay.add(Duration(days: i));
      if (activeDays.isEmpty || activeDays.contains(cursor.weekday)) {
        missed++;
      }
    }
    return missed;
  }

  /// Telafi gerektiren en az 1 gecikmiş gün olup olmadığını döner.
  bool hasMissedDays({DateTime? now}) => missedDaysCount(now: now) > 0;

  int get totalCount => tasks.length;
  int get completedCount => tasks.where((t) => t.isCompleted).length;
  int get remainingCount => totalCount - completedCount;
  int get totalEstimatedMinutes =>
      tasks.fold(0, (sum, t) => sum + t.estimatedMinutes);
  double get completionProgress =>
      totalCount == 0 ? 0.0 : (completedCount / totalCount).clamp(0.0, 1.0);
  bool get allCompleted => totalCount > 0 && completedCount == totalCount;

  /// Belirli bir ders ve konuya ait çalışma planında tamamlanmış olarak işaretlenen
  /// konu testi numaraları kümesini döner.
  Set<int> completedTestNumbersForTopic({
    required String lesson,
    required String topic,
  }) {
    final result = <int>{};
    for (final t in tasks) {
      if (t.isCompleted &&
          t.actionType == StudyTaskActionType.quiz &&
          t.lessonTag == lesson &&
          t.targetTopic == topic &&
          t.targetTestNumber != null) {
        result.add(t.targetTestNumber!);
      }
    }
    return result;
  }

  /// Günlük tüm görevler bittiğinde VEYA zaten kilidi açılmış bir gün aralığındayken
  /// sonraki güne geçişe izin verilir.
  bool get canAdvanceToNextDay => allCompleted || cycleDay < maxUnlockedDay;

  /// Kullanıcı 1. günden ilerideyse geçmiş günlere geri dönebilir.
  bool get hasPreviousDay => cycleDay > 1;

  StudyPlannerState copyWith({
    List<StudyTask>? tasks,
    int? cycleDay,
    int? maxUnlockedDay,
    String? examScope,
    DateTime? lastPlannedDate,
    bool clearLastPlannedDate = false,
    bool? isSprintModeActive,
    List<int>? weeklyStudyDays,
  }) {
    return StudyPlannerState(
      tasks: tasks ?? this.tasks,
      cycleDay: cycleDay ?? this.cycleDay,
      maxUnlockedDay: maxUnlockedDay ?? this.maxUnlockedDay,
      examScope: examScope ?? this.examScope,
      lastPlannedDate: clearLastPlannedDate
          ? null
          : (lastPlannedDate ?? this.lastPlannedDate),
      isSprintModeActive: isSprintModeActive ?? this.isSprintModeActive,
      weeklyStudyDays: weeklyStudyDays ?? this.weeklyStudyDays,
    );
  }
}

/// KPSS Günlük Çalışma Planlayıcı Notifier.
///
/// Web/Angular benzetmesi: Injectable Service + State Machine.
class StudyPlannerNotifier extends Notifier<StudyPlannerState> {
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();
  final LocalStorageService _storage = LocalStorageService();
  bool _isDisposed = false;

  /// Bellek içi gün bazlı görev önbelleği (0ms anlık sayfa geçişleri için).
  final Map<int, List<StudyTask>> _dayTasksCache = {};

  /// Tamamlanmış tüm görevlerin ID kümesi (Tüm günler arası kalıcı).
  final Set<String> _completedTaskIds = {};

  /// Kullanıcının kendi eklediği özel görevlerin gün bazlı haritası.
  final Map<int, List<StudyTask>> _customTasksByDay = {};

  /// Çoklu oturum önbellek anahtarı (Kullanıcı e-postası veya id).
  String? _accountKey;

  /// Aktif planın sınav kapsamı anahtarı (`'lisans_gk'`, `'b_grubu_full_lisans'` vb.).
  String _activeExamScope = 'lisans_gk';

  /// Sınav türü değiştirildiğinde önceki kapsama ait tamamlanmış çalışma arşivleri.
  final Map<String, PlannerSyncSnapshot> _archivedSnapshotsByScope = {};

  /// Belirli bir sınav kapsamı için arşivlenmiş plan anlık görüntüsünü döner.
  PlannerSyncSnapshot? archivedSnapshotForScope(String scopeKey) =>
      _archivedSnapshotsByScope[scopeKey];

  /// Arşivlenmiş tüm sınav kapsamlarının salt okunur görünümü.
  Map<String, PlannerSyncSnapshot> get archivedSnapshotsByScope =>
      Map.unmodifiable(_archivedSnapshotsByScope);

  /// Oturum açmış kullanıcının hesap anahtarını belirler.
  void setAccountKey(String? key) {
    _accountKey = key?.trim().toLowerCase();
  }

  static const List<StudyTask> _defaultTasks = [
    StudyTask(
      id: 'task_1',
      title: 'İslamiyet Öncesi Türk Tarihi · Test 1',
      lessonTag: 'Tarih',
      estimatedMinutes: 15,
      actionType: StudyTaskActionType.quiz,
      targetTopic: 'İslamiyet Öncesi Türk Tarihi',
      targetTestNumber: 1,
      targetCount: 10,
    ),
    StudyTask(
      id: 'task_2',
      title: 'Coğrafya: 10 Hap Bilgi Kartı Tekrarı',
      lessonTag: 'Coğrafya',
      estimatedMinutes: 10,
      actionType: StudyTaskActionType.flashcards,
      targetCount: 10,
      startIndex: 0,
    ),
    StudyTask(
      id: 'task_3',
      title: 'Türkiye Harita Pratiği · 4 Soru',
      lessonTag: 'Coğrafya',
      estimatedMinutes: 10,
      actionType: StudyTaskActionType.map,
      targetCount: 4,
      startIndex: 0,
    ),
  ];

  @override
  StudyPlannerState build() {
    _isDisposed = false;
    ref.onDispose(() => _isDisposed = true);

    // İstatistik durumunu dinle: Kullanıcı bağımsız test çözdüğünde veya buluttan yüklendiğinde
    // çalışma planındaki ilgili görevleri otomatik eşle ve senkronize et.
    // Web/Angular Benzetmesi: Effect / Store listener.
    ref.listen<StudyStatsState>(
      studyStatsProvider,
      (_, next) => syncCompletedFromStats(next),
    );

    // 1. main.dart üzerinden önceden yüklenmiş tam durum varsa anında ilk karede göster
    final preloadedState = ref.watch(initialPlannerStateProvider);
    if (preloadedState != null) {
      _dayTasksCache[preloadedState.cycleDay] = preloadedState.tasks;
      for (final t in preloadedState.tasks) {
        if (t.isCompleted) _completedTaskIds.add(t.id);
      }
      unawaited(_loadFromStorage());
      return preloadedState;
    }

    final preloadedDay = ref.watch(initialPlannerCycleDayProvider);
    _dayTasksCache[preloadedDay ?? 1] = _defaultTasks;
    unawaited(_loadFromStorage());
    return StudyPlannerState(
      tasks: _defaultTasks,
      cycleDay: preloadedDay ?? 1,
      maxUnlockedDay: preloadedDay ?? 1,
    );
  }

  Future<void> _loadFromStorage() async {
    final savedSnapshot = await _storage.loadPlannerSnapshot(
      accountKey: _accountKey,
    );
    final savedDay = await _storage.loadPlannerCycleDay();
    final savedMaxDay = await _storage.loadPlannerMaxUnlockedDay();
    if (_isDisposed) return;

    if (savedSnapshot != null && !savedSnapshot.isEmptyProgress) {
      _completedTaskIds.addAll(savedSnapshot.completedTaskIds);
      for (final entry in savedSnapshot.customTasksByDay.entries) {
        _customTasksByDay[entry.key] = List<StudyTask>.from(entry.value);
      }
      for (final entry in savedSnapshot.tasksByDay.entries) {
        _dayTasksCache[entry.key] = List<StudyTask>.from(entry.value);
      }

      final targetDay = savedDay ?? savedSnapshot.cycleDay;
      final maxDay = math.max<int>(
        savedMaxDay ?? 1,
        savedSnapshot.maxUnlockedDay,
      );

      final dayTasks = await _storage.loadPlannerDayTasks(targetDay);
      if (_isDisposed) return;

      if (dayTasks != null && dayTasks.isNotEmpty) {
        final syncedTasks = dayTasks.map((t) {
          final isDone = t.isCompleted || _completedTaskIds.contains(t.id);
          if (isDone) _completedTaskIds.add(t.id);
          return isDone ? t.copyWith(isCompleted: true) : t;
        }).toList();

        _dayTasksCache[targetDay] = syncedTasks;
        state = state.copyWith(
          tasks: syncedTasks,
          cycleDay: targetDay,
          maxUnlockedDay: maxDay,
        );
        syncCompletedFromStats(ref.read(studyStatsProvider));
        return;
      } else {
        // Kayıtlı dayTasks yoksa snapshot üzerinden tüm günleri hidrate et
        final prefs = ref.read(userPreferencesProvider);
        applySnapshot(
          savedSnapshot,
          examTarget: prefs.targetExam,
          pace: prefs.studyProgramPace,
          focusLesson: prefs.focusLesson,
          syncToCloud: false,
        );
        return;
      }
    }

    // Herhangi bir snapshot yoksa (varsayılan akış)
    final currentDay = savedDay ?? state.cycleDay;
    final maxDay = savedMaxDay ?? (currentDay > 1 ? currentDay : 1);

    final dayTasks = await _storage.loadPlannerDayTasks(currentDay);
    if (_isDisposed) return;

    if (dayTasks != null && dayTasks.isNotEmpty) {
      _dayTasksCache[currentDay] = dayTasks;
      for (final t in dayTasks) {
        if (t.isCompleted) _completedTaskIds.add(t.id);
      }
      state = state.copyWith(
        tasks: dayTasks,
        cycleDay: currentDay,
        maxUnlockedDay: maxDay,
      );
      syncCompletedFromStats(ref.read(studyStatsProvider));
      return;
    }

    final saved = await _storage.loadStudyTasks();
    if (_isDisposed) return;

    if (saved != null && saved.isNotEmpty) {
      _dayTasksCache[currentDay] = saved;
      for (final t in saved) {
        if (t.isCompleted) _completedTaskIds.add(t.id);
      }
      state = state.copyWith(
        tasks: saved,
        cycleDay: currentDay,
        maxUnlockedDay: maxDay,
      );
      unawaited(_storage.savePlannerDayTasks(currentDay, saved));
    } else {
      state = state.copyWith(cycleDay: currentDay, maxUnlockedDay: maxDay);
    }
    syncCompletedFromStats(ref.read(studyStatsProvider));
  }

  static final Set<String> _defaultTaskIds = _defaultTasks
      .map((t) => t.id)
      .toSet();

  static String _formatDateKey(DateTime dt) {
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '${dt.year}-$m-$d';
  }

  static DateTime? _parseDateKey(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    return DateTime.tryParse(raw.trim());
  }

  static DateTime _todayDateOnly([DateTime? now]) {
    final refNow = now ?? DateTime.now();
    return DateTime(refNow.year, refNow.month, refNow.day);
  }

  bool _isOnlyUntouchedDefaultTasks() {
    if (_activeExamScope != 'lisans_gk' ||
        state.cycleDay > 1 ||
        state.maxUnlockedDay > 1 ||
        state.isSprintModeActive ||
        state.lastPlannedDate != null ||
        _completedTaskIds.isNotEmpty ||
        _customTasksByDay.isNotEmpty) {
      return false;
    }
    final listsToCheck = <List<StudyTask>>[
      state.tasks,
      ..._dayTasksCache.values,
    ];
    for (final list in listsToCheck) {
      for (final task in list) {
        if (task.isCompleted || !_defaultTaskIds.contains(task.id)) {
          return false;
        }
      }
    }
    return true;
  }

  /// Mevcut çalışma planı durumunu bulut ve yerel senkronizasyon için dışa aktarır.
  ///
  /// Web/Angular Benzetmesi: State serialization / Redux selector to DTO.
  PlannerSyncSnapshot exportSnapshot() {
    if (_isOnlyUntouchedDefaultTasks()) {
      return PlannerSyncSnapshot(
        cycleDay: 1,
        maxUnlockedDay: 1,
        completedTaskIds: const {},
        customTasksByDay: const {},
        tasksByDay: const {},
        updatedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      );
    }

    final allKnownTasks = <StudyTask>{...state.tasks};
    for (final list in _dayTasksCache.values) {
      allKnownTasks.addAll(list);
    }
    for (final t in allKnownTasks) {
      if (t.isCompleted) {
        _completedTaskIds.add(t.id);
      } else {
        _completedTaskIds.remove(t.id);
      }
    }

    final customCopy = <int, List<StudyTask>>{};
    for (final entry in _customTasksByDay.entries) {
      if (entry.value.isNotEmpty) {
        customCopy[entry.key] = List<StudyTask>.from(entry.value);
      }
    }

    final tasksByDayCopy = <int, List<StudyTask>>{};
    for (final entry in _dayTasksCache.entries) {
      if (entry.value.isNotEmpty) {
        tasksByDayCopy[entry.key] = List<StudyTask>.from(entry.value);
      }
    }
    if (state.tasks.isNotEmpty) {
      tasksByDayCopy[state.cycleDay] = List<StudyTask>.from(state.tasks);
    }

    return PlannerSyncSnapshot(
      cycleDay: state.cycleDay,
      maxUnlockedDay: state.maxUnlockedDay,
      completedTaskIds: Set<String>.from(_completedTaskIds),
      customTasksByDay: customCopy,
      tasksByDay: tasksByDayCopy,
      examScope: _activeExamScope,
      lastPlannedDate: state.lastPlannedDate != null
          ? _formatDateKey(state.lastPlannedDate!)
          : null,
      isSprintModeActive: state.isSprintModeActive,
      weeklyStudyDays: state.weeklyStudyDays,
      updatedAt: DateTime.now().toUtc(),
    );
  }

  /// Snapshot'ı hem yerel depolamaya hem de isteğe bağlı olarak buluta kaydeder.
  void _persistAndSyncSnapshot({bool syncCloud = true}) {
    final snapshot = exportSnapshot();
    unawaited(_storage.savePlannerSnapshot(snapshot, accountKey: _accountKey));
    if (syncCloud) {
      unawaited(_cloudSync.syncPlannerSnapshot(snapshot));
    }
  }

  /// Görevin tamamlandı/tamamlanmadı durumunu değiştirir.
  void toggleTask(String id) {
    StudyTask? updatedTask;

    final updatedTasks = state.tasks.map((task) {
      if (task.id == id) {
        final toggled = task.copyWith(isCompleted: !task.isCompleted);
        updatedTask = toggled;
        if (toggled.isCompleted) {
          _completedTaskIds.add(id);
        } else {
          _completedTaskIds.remove(id);
        }
        return toggled;
      }
      return task;
    }).toList();

    // Özel görev ise _customTasksByDay içinde de güncelle
    final dayCustom = _customTasksByDay[state.cycleDay];
    if (dayCustom != null && updatedTask != null) {
      final idx = dayCustom.indexWhere((t) => t.id == id);
      if (idx != -1) {
        dayCustom[idx] = updatedTask!;
      }
    }

    state = state.copyWith(tasks: updatedTasks);
    _dayTasksCache[state.cycleDay] = updatedTasks;

    unawaited(_storage.saveStudyTasks(updatedTasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, updatedTasks));
    _persistAndSyncSnapshot();

    if (updatedTask != null) {
      unawaited(
        _cloudSync.updateStudyTaskCompletion(
          title: updatedTask!.title,
          isCompleted: updatedTask!.isCompleted,
        ),
      );
    }
  }

  /// İlgili görev oturumu (test, kart, harita vb.) bittiğinde görevi otomatik tamamlar.
  void markTaskCompleted(String id) {
    StudyTask? completedTask;
    var changed = false;

    final nextTasks = state.tasks.map((task) {
      if (task.id == id && !task.isCompleted) {
        changed = true;
        completedTask = task.copyWith(isCompleted: true);
        _completedTaskIds.add(id);
        return completedTask!;
      }
      return task;
    }).toList();

    if (!changed) return;

    // Özel görev ise _customTasksByDay içinde de güncelle
    final dayCustom = _customTasksByDay[state.cycleDay];
    if (dayCustom != null && completedTask != null) {
      final idx = dayCustom.indexWhere((t) => t.id == id);
      if (idx != -1) {
        dayCustom[idx] = completedTask!;
      }
    }

    state = state.copyWith(tasks: nextTasks);
    _dayTasksCache[state.cycleDay] = nextTasks;

    unawaited(_storage.saveStudyTasks(nextTasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, nextTasks));
    _persistAndSyncSnapshot();

    if (completedTask != null) {
      unawaited(
        _cloudSync.updateStudyTaskCompletion(
          title: completedTask!.title,
          isCompleted: true,
        ),
      );
    }
  }

  static bool _matchesCompletedTestTask(
    StudyTask task, {
    required String lesson,
    String? topic,
    int? testNumber,
    int? mockExamNumber,
    required bool isBranchMock,
  }) {
    if (task.isCompleted) return false;
    final matchesQuiz =
        task.actionType == StudyTaskActionType.quiz &&
        topic != null &&
        testNumber != null &&
        task.lessonTag == lesson &&
        task.targetTopic == topic &&
        task.targetTestNumber == testNumber;

    final matchesExam =
        task.actionType == StudyTaskActionType.exam &&
        (isBranchMock
            ? task.lessonTag == lesson &&
                  (mockExamNumber == null ||
                      task.targetExamNumber == null ||
                      task.targetExamNumber == mockExamNumber)
            : mockExamNumber != null &&
                  task.targetExamNumber == mockExamNumber);

    return matchesQuiz || matchesExam;
  }

  /// Görev dışından (ör. Dersler veya Denemeler sekmesinden) bağımsız olarak çözülen
  /// bir testin veya denemenin, çalışma planındaki eşleşen görevlerini otomatik tamamlar.
  ///
  /// Web/Angular Benzetmesi: Cross-store event reaction (Quiz tamamlanınca Planner store'unu güncelleme).
  void markMatchingTestCompleted({
    required String lesson,
    String? topic,
    int? testNumber,
    int? mockExamNumber,
    bool isBranchMock = false,
  }) {
    var changed = false;

    // 1. Önce aktif günün görevlerini kontrol et ve güncelle
    final currentTasks = state.tasks;
    final updatedCurrentTasks = currentTasks.map((t) {
      if (_matchesCompletedTestTask(
        t,
        lesson: lesson,
        topic: topic,
        testNumber: testNumber,
        mockExamNumber: mockExamNumber,
        isBranchMock: isBranchMock,
      )) {
        changed = true;
        _completedTaskIds.add(t.id);
        return t.copyWith(isCompleted: true);
      }
      return t;
    }).toList();

    if (changed) {
      state = state.copyWith(tasks: updatedCurrentTasks);
      _dayTasksCache[state.cycleDay] = updatedCurrentTasks;
      unawaited(_storage.saveStudyTasks(updatedCurrentTasks));
      unawaited(
        _storage.savePlannerDayTasks(state.cycleDay, updatedCurrentTasks),
      );
    }

    // 2. _dayTasksCache içindeki 1 .. state.maxUnlockedDay günlerini tara ve güncelle
    for (var d = 1; d <= state.maxUnlockedDay; d++) {
      if (d == state.cycleDay && changed) {
        continue;
      }
      final cachedDayTasks = _dayTasksCache[d];
      if (cachedDayTasks == null) continue;

      var dayChanged = false;
      final updatedDayTasks = cachedDayTasks.map((t) {
        if (_matchesCompletedTestTask(
          t,
          lesson: lesson,
          topic: topic,
          testNumber: testNumber,
          mockExamNumber: mockExamNumber,
          isBranchMock: isBranchMock,
        )) {
          dayChanged = true;
          changed = true;
          _completedTaskIds.add(t.id);
          return t.copyWith(isCompleted: true);
        }
        return t;
      }).toList();

      if (dayChanged) {
        _dayTasksCache[d] = updatedDayTasks;
        unawaited(_storage.savePlannerDayTasks(d, updatedDayTasks));
      }
    }

    if (changed) {
      _persistAndSyncSnapshot();
    }
  }

  /// Tamamlanmış quiz oturumları istatistiklerini (`StudyStatsState`) inceleyerek,
  /// daha önce bağımsız olarak çözülmüş testlerle eşleşen plan görevlerini otomatik tamamlar.
  ///
  /// Web/Angular Benzetmesi: State reconciliation / Store synchronization effect.
  void syncCompletedFromStats(StudyStatsState stats) {
    var changed = false;

    // 1. Aktif gün görevlerini tara
    final currentTasks = state.tasks;
    final updatedCurrentTasks = currentTasks.map((t) {
      if (t.actionType == StudyTaskActionType.quiz &&
          !t.isCompleted &&
          t.targetTopic != null &&
          t.targetTestNumber != null) {
        final session = stats.findLatestSessionForTest(
          lesson: t.lessonTag,
          topic: t.targetTopic!,
          testNumber: t.targetTestNumber!,
          examScope: t.examScope,
        );
        if (session != null) {
          changed = true;
          _completedTaskIds.add(t.id);
          return t.copyWith(isCompleted: true);
        }
      }
      return t;
    }).toList();

    if (changed) {
      state = state.copyWith(tasks: updatedCurrentTasks);
      _dayTasksCache[state.cycleDay] = updatedCurrentTasks;
      unawaited(_storage.saveStudyTasks(updatedCurrentTasks));
      unawaited(
        _storage.savePlannerDayTasks(state.cycleDay, updatedCurrentTasks),
      );
    }

    // 2. Önbellekteki diğer günleri tara (1 .. state.maxUnlockedDay)
    for (var d = 1; d <= state.maxUnlockedDay; d++) {
      if (d == state.cycleDay && changed) continue;
      final cachedDayTasks = _dayTasksCache[d];
      if (cachedDayTasks == null) continue;

      var dayChanged = false;
      final updatedDayTasks = cachedDayTasks.map((t) {
        if (t.actionType == StudyTaskActionType.quiz &&
            !t.isCompleted &&
            t.targetTopic != null &&
            t.targetTestNumber != null) {
          final session = stats.findLatestSessionForTest(
            lesson: t.lessonTag,
            topic: t.targetTopic!,
            testNumber: t.targetTestNumber!,
          );
          if (session != null) {
            dayChanged = true;
            changed = true;
            _completedTaskIds.add(t.id);
            return t.copyWith(isCompleted: true);
          }
        }
        return t;
      }).toList();

      if (dayChanged) {
        _dayTasksCache[d] = updatedDayTasks;
        unawaited(_storage.savePlannerDayTasks(d, updatedDayTasks));
      }
    }

    // 3. Değişiklik olduysa snapshot'ı kaydet ve buluta senkronize et
    if (changed) {
      _persistAndSyncSnapshot();
    }
  }

  /// Yeni bir KPSS çalışma görevi ekler.
  void addTask({
    required String title,
    required String lessonTag,
    int estimatedMinutes = 25,
    StudyTaskActionType actionType = StudyTaskActionType.custom,
    String? targetTopic,
    int? targetTestNumber,
    int? targetExamNumber,
    int? targetCount,
  }) {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty) return;

    final newTask = StudyTask(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: cleanTitle,
      lessonTag: lessonTag,
      estimatedMinutes: estimatedMinutes,
      actionType: actionType,
      targetTopic: targetTopic,
      targetTestNumber: targetTestNumber,
      targetExamNumber: targetExamNumber,
      targetCount: targetCount,
      examScope: _activeExamScope,
    );

    final nextTasks = [...state.tasks, newTask];
    state = state.copyWith(tasks: nextTasks);
    _dayTasksCache[state.cycleDay] = nextTasks;

    final currentCustom = _customTasksByDay[state.cycleDay] ?? [];
    _customTasksByDay[state.cycleDay] = [...currentCustom, newTask];

    unawaited(_storage.saveStudyTasks(nextTasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, nextTasks));
    _persistAndSyncSnapshot();
    unawaited(_cloudSync.insertStudyTask(newTask));
  }

  /// Sıradaki günlerin (`cycleDay + 1` ve devamı) gerçek [StudyTask] öğelerini
  /// önizler; halihazırda bugünkü listede bulunan veya tamamlanmış görevleri eler.
  List<StudyTask> previewUpcomingTasks({int limit = 6}) {
    final prefs = ref.read(userPreferencesProvider);
    final effectiveScope = prefs.examSelection.scopeKey.isNotEmpty
        ? prefs.examSelection.scopeKey
        : _activeExamScope;
    final effectiveCurriculum = _resolveCurriculumForCall(null, effectiveScope);
    final existingIds = state.tasks.map((t) => t.id).toSet();
    final upcoming = <StudyTask>[];

    for (var offset = 1; offset <= 2 && upcoming.length < limit; offset++) {
      final day = state.cycleDay + offset;
      final dayTasks =
          _dayTasksCache[day] ??
          AutoStudyProgramGenerator.generateDailyTasks(
            examTarget: prefs.targetExam,
            pace: prefs.studyProgramPace,
            focusLesson: prefs.focusLesson,
            cycleDay: day,
            curriculum: effectiveCurriculum,
            examScope: effectiveScope,
          );

      for (final task in dayTasks) {
        if (existingIds.contains(task.id)) continue;
        if (_completedTaskIds.contains(task.id) || task.isCompleted) continue;
        if (upcoming.any((u) => u.id == task.id)) continue;
        upcoming.add(task);
        if (upcoming.length >= limit) break;
      }
    }

    return upcoming;
  }

  /// Sıradaki günlerden seçilen gerçek bir [StudyTask] öğesini kendi `id` ve
  /// hedef alanlarıyla bugünün görev listesine tek tıkla aktarır.
  void pullUpcomingTaskToToday(StudyTask task) {
    if (state.tasks.any((t) => t.id == task.id)) return;

    final pulledTask = task.copyWith(isCompleted: false);
    final nextTasks = [...state.tasks, pulledTask];
    state = state.copyWith(tasks: nextTasks);
    _dayTasksCache[state.cycleDay] = nextTasks;

    final currentCustom = _customTasksByDay[state.cycleDay] ?? [];
    _customTasksByDay[state.cycleDay] = [...currentCustom, pulledTask];

    unawaited(_storage.saveStudyTasks(nextTasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, nextTasks));
    _persistAndSyncSnapshot();
    unawaited(_cloudSync.insertStudyTask(pulledTask));
  }

  ExamCurriculum? _resolveCurriculumForCall(
    ExamCurriculum? explicit,
    String scopeKey,
  ) {
    if (explicit != null) return explicit;
    if (scopeKey == 'lisans_gk') return null;
    final prefs = ref.read(userPreferencesProvider);
    if (prefs.examSelection.scopeKey == scopeKey) {
      return CurriculumRegistry.resolve(prefs.examSelection);
    }
    return null;
  }

  /// Seçili KPSS hedef sınavı ve günlük süreye göre otomatik çalışma programı kurar.
  void setupAutoProgram({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
    int cycleDay = 1,
    bool? isSprintMode,
    List<int>? weeklyStudyDays,
    bool Function(String lesson, String topic, int testNumber)? isTestSolved,
  }) {
    final safeDay = cycleDay < 1 ? 1 : cycleDay;
    final effectiveScope = examScope ?? curriculum?.scopeKey ?? 'lisans_gk';
    final effectiveCurriculum = _resolveCurriculumForCall(
      curriculum,
      effectiveScope,
    );
    _activeExamScope = effectiveScope;
    final effectiveSprint = isSprintMode ?? state.isSprintModeActive;
    final effectiveWeeklyDays =
        (weeklyStudyDays != null && weeklyStudyDays.isNotEmpty)
        ? List<int>.unmodifiable(weeklyStudyDays)
        : state.weeklyStudyDays;

    if (safeDay == 1) {
      _completedTaskIds.clear();
      _dayTasksCache.clear();
      _customTasksByDay.clear();
    }

    final generatedTasks = AutoStudyProgramGenerator.generateDailyTasks(
      examTarget: examTarget,
      pace: pace,
      focusLesson: focusLesson,
      cycleDay: safeDay,
      curriculum: effectiveCurriculum,
      examScope: effectiveScope,
      isTestSolved: isTestSolved,
      isSprintMode: effectiveSprint,
    );

    _dayTasksCache[safeDay] = generatedTasks;
    final maxDay = safeDay > state.maxUnlockedDay
        ? safeDay
        : state.maxUnlockedDay;
    state = state.copyWith(
      tasks: generatedTasks,
      cycleDay: safeDay,
      maxUnlockedDay: maxDay,
      examScope: effectiveScope,
      lastPlannedDate: _todayDateOnly(),
      isSprintModeActive: effectiveSprint,
      weeklyStudyDays: effectiveWeeklyDays,
    );

    unawaited(_storage.saveStudyTasks(generatedTasks));
    unawaited(_storage.savePlannerDayTasks(safeDay, generatedTasks));
    unawaited(_storage.savePlannerCycleDay(safeDay));
    unawaited(_storage.savePlannerMaxUnlockedDay(maxDay));
    _persistAndSyncSnapshot();
    syncCompletedFromStats(ref.read(studyStatsProvider));
  }

  /// Kullanıcı hedef KPSS/MEB-AGS sınavını değiştirdiğinde mevcut kapsamdaki
  /// tamamlanmış görev geçmişini arşivler ve yeni müfredat kapsamına uygun
  /// taze görev listesi oluşturur (`TASK-132`).
  void adaptCurriculumScope({
    required ExamSelection newSelection,
    required ExamCurriculum newCurriculum,
    StudyProgramPace? pace,
    String? focusLesson,
    bool Function(String lesson, String topic, int testNumber)? isTestSolved,
  }) {
    final prefs = ref.read(userPreferencesProvider);
    final prevScope = _activeExamScope;
    final newScope = newSelection.scopeKey;
    final effectivePace = pace ?? prefs.studyProgramPace;
    final validLessons = newCurriculum.primaryLessonNames;
    final effectiveFocus =
        focusLesson ??
        (validLessons.contains(prefs.focusLesson)
            ? prefs.focusLesson
            : (validLessons.isNotEmpty
                  ? validLessons.first
                  : prefs.focusLesson));

    if (prevScope != newScope && !_isOnlyUntouchedDefaultTasks()) {
      _archivedSnapshotsByScope[prevScope] = exportSnapshot();
    }

    _activeExamScope = newScope;

    final restoredArchive = prevScope != newScope
        ? _archivedSnapshotsByScope[newScope]
        : null;
    if (restoredArchive != null && !restoredArchive.isEmptyProgress) {
      applySnapshot(
        restoredArchive,
        examTarget: newSelection.toLegacyTarget(),
        pace: effectivePace,
        focusLesson: effectiveFocus,
        curriculum: newCurriculum,
        syncToCloud: true,
      );
      return;
    }

    _dayTasksCache.clear();
    _customTasksByDay.clear();

    final generatedTasks = AutoStudyProgramGenerator.generateDailyTasks(
      examTarget: newSelection.toLegacyTarget(),
      pace: effectivePace,
      focusLesson: effectiveFocus,
      cycleDay: 1,
      curriculum: newCurriculum,
      examScope: newScope,
      isTestSolved: isTestSolved,
    );

    _dayTasksCache[1] = generatedTasks;
    state = StudyPlannerState(
      tasks: generatedTasks,
      cycleDay: 1,
      maxUnlockedDay: 1,
      examScope: newScope,
    );

    unawaited(_storage.saveStudyTasks(generatedTasks));
    unawaited(_storage.savePlannerDayTasks(1, generatedTasks));
    unawaited(_storage.savePlannerCycleDay(1));
    unawaited(_storage.savePlannerMaxUnlockedDay(1));
    _persistAndSyncSnapshot();
    syncCompletedFromStats(ref.read(studyStatsProvider));
  }

  /// Kullanıcı günlük çalışma süresini değiştirdiğinde (ör. 30 dk -> 60 dk):
  /// Çözülmüş testleri ve mevcut gün ilerlemesini korur; gün sayacını geriye düşürmez!
  /// Geçmiş günleri mühürler, bugünün tamamlanmış görevlerini %100 muhafaza eder
  /// ve yeni tempoya göre eksik görevleri sıralı ekleyerek kesintisiz adapte eder.
  ///
  /// Web/Angular Benzetmesi: State re-hydration with forward-only state preservation.
  void adaptStudyProgramPace({
    required KpssExamTarget examTarget,
    required StudyProgramPace oldPace,
    required StudyProgramPace newPace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
    bool? isSprintMode,
    List<int>? weeklyStudyDays,
    bool Function(String lesson, String topic, int testNumber)? isTestSolved,
  }) {
    final effectiveScope =
        examScope ?? curriculum?.scopeKey ?? _activeExamScope;
    final effectiveCurriculum = _resolveCurriculumForCall(
      curriculum,
      effectiveScope,
    );
    _activeExamScope = effectiveScope;
    final effectiveSprint = isSprintMode ?? state.isSprintModeActive;
    final effectiveWeeklyDays =
        (weeklyStudyDays != null && weeklyStudyDays.isNotEmpty)
        ? List<int>.unmodifiable(weeklyStudyDays)
        : state.weeklyStudyDays;

    // 1. Gün sayacını koru (asla geriye düşürme!)
    final currentDay = state.cycleDay < 1 ? 1 : state.cycleDay;
    final currentMax = state.maxUnlockedDay >= currentDay
        ? state.maxUnlockedDay
        : currentDay;

    // 2. Geçmiş günleri (1 .. currentDay - 1) mühürle ve önbelleğe/depolamaya kaydet
    for (var d = 1; d < currentDay; d++) {
      final cachedDayTasks = _dayTasksCache[d];
      if (cachedDayTasks == null || cachedDayTasks.isEmpty) {
        final generated = AutoStudyProgramGenerator.generateDailyTasks(
          examTarget: examTarget,
          pace: oldPace,
          focusLesson: focusLesson,
          cycleDay: d,
          curriculum: effectiveCurriculum,
          examScope: effectiveScope,
        );
        final custom = _customTasksByDay[d] ?? const <StudyTask>[];
        final sealedTasks = [...generated, ...custom].map((t) {
          _completedTaskIds.add(t.id);
          return t.copyWith(isCompleted: true);
        }).toList();
        _dayTasksCache[d] = sealedTasks;
        unawaited(_storage.savePlannerDayTasks(d, sealedTasks));
      } else {
        final sealedTasks = cachedDayTasks.map((t) {
          _completedTaskIds.add(t.id);
          return t.isCompleted ? t : t.copyWith(isCompleted: true);
        }).toList();
        _dayTasksCache[d] = sealedTasks;
        unawaited(_storage.savePlannerDayTasks(d, sealedTasks));
      }
    }

    // 3. Geçmiş günlerde ve bugünün tamamlananlarında çözülen testleri topla
    final coveredTests = <String>{};
    for (var d = 1; d < currentDay; d++) {
      final dayTasks = _dayTasksCache[d] ?? const <StudyTask>[];
      for (final t in dayTasks) {
        if (t.actionType == StudyTaskActionType.quiz &&
            t.targetTopic != null &&
            t.targetTestNumber != null) {
          coveredTests.add(
            '${t.lessonTag}|${t.targetTopic}|${t.targetTestNumber}',
          );
        }
      }
    }
    for (final t in state.tasks) {
      if (t.isCompleted &&
          t.actionType == StudyTaskActionType.quiz &&
          t.targetTopic != null &&
          t.targetTestNumber != null) {
        coveredTests.add(
          '${t.lessonTag}|${t.targetTopic}|${t.targetTestNumber}',
        );
      }
    }

    bool combinedIsTestSolved(String lesson, String topic, int testNumber) =>
        coveredTests.contains('$lesson|$topic|$testNumber') ||
        (isTestSolved?.call(lesson, topic, testNumber) ?? false);

    // 4. Yeni tempo için bugünün aday görevlerini üret
    final newCandidateTasks = AutoStudyProgramGenerator.generateDailyTasks(
      examTarget: examTarget,
      pace: newPace,
      focusLesson: focusLesson,
      cycleDay: currentDay,
      curriculum: effectiveCurriculum,
      examScope: effectiveScope,
      isTestSolved: combinedIsTestSolved,
      ignoreOffsetWhenSolvedFiltered: true,
      isSprintMode: effectiveSprint,
    );

    // 5. Bugünün (currentDay) tamamlanmış görev item'larını %100 koru
    final completedToday = state.tasks.where((t) => t.isCompleted).toList();
    final customToday = _customTasksByDay[currentDay] ?? const <StudyTask>[];
    List<StudyTask> mergedTasks;

    if (completedToday.isEmpty) {
      mergedTasks = [...newCandidateTasks, ...customToday].map((t) {
        final isDone = _completedTaskIds.contains(t.id);
        return isDone ? t.copyWith(isCompleted: true) : t;
      }).toList();
    } else {
      mergedTasks = List<StudyTask>.from(completedToday);
      final targetQuizCount = AutoStudyProgramGenerator.testsCountForDay(
        newPace,
        currentDay,
      );
      final completedQuizCount = completedToday
          .where((t) => t.actionType == StudyTaskActionType.quiz)
          .length;
      final neededExtraQuizzes = math.max(
        0,
        targetQuizCount - completedQuizCount,
      );

      var addedExtraQuizzes = 0;
      for (final cand in newCandidateTasks) {
        if (cand.actionType == StudyTaskActionType.quiz) {
          if (addedExtraQuizzes < neededExtraQuizzes) {
            final matchesExisting = mergedTasks.any(
              (m) => m.isSameTaskItem(cand),
            );
            if (!matchesExisting) {
              final isDone = _completedTaskIds.contains(cand.id);
              mergedTasks.add(isDone ? cand.copyWith(isCompleted: true) : cand);
              addedExtraQuizzes++;
            }
          }
        } else {
          final matchesExisting = completedToday.any(
            (c) => c.actionType == cand.actionType || c.isSameTaskItem(cand),
          );
          if (!matchesExisting) {
            final isDone = _completedTaskIds.contains(cand.id);
            mergedTasks.add(isDone ? cand.copyWith(isCompleted: true) : cand);
          }
        }
      }

      for (final c in customToday) {
        if (!mergedTasks.any((m) => m.id == c.id)) {
          mergedTasks.add(c);
        }
      }
    }

    // 6. Güncellenen görev listesini ve sayaçları kaydet
    _dayTasksCache[currentDay] = mergedTasks;
    state = state.copyWith(
      tasks: mergedTasks,
      cycleDay: currentDay,
      maxUnlockedDay: currentMax,
      examScope: effectiveScope,
      lastPlannedDate: _todayDateOnly(),
      isSprintModeActive: effectiveSprint,
      weeklyStudyDays: effectiveWeeklyDays,
    );

    unawaited(_storage.saveStudyTasks(mergedTasks));
    unawaited(_storage.savePlannerDayTasks(currentDay, mergedTasks));
    unawaited(_storage.savePlannerCycleDay(currentDay));
    unawaited(_storage.savePlannerMaxUnlockedDay(currentMax));
    _persistAndSyncSnapshot();
  }

  /// Haftalık aktif çalışma günlerini (`1` = Pzt ... `7` = Paz) günceller (`TASK-159`).
  void setWeeklyStudyDays(List<int> days) {
    final cleaned = days.where((d) => d >= 1 && d <= 7).toSet().toList()
      ..sort();
    if (cleaned.isEmpty) return;
    state = state.copyWith(weeklyStudyDays: List<int>.unmodifiable(cleaned));
    _persistAndSyncSnapshot();
  }

  /// Kaçırılan/gecikmiş çalışma günlerini kalan günlere dengeli yeniden dağıtır (`TASK-159`).
  ///
  /// Döndürdüğü değer bugünden ileriye dengelenen görev sayısıdır.
  int applyCatchUpRebalance({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
  }) {
    final effectiveScope =
        examScope ?? curriculum?.scopeKey ?? _activeExamScope;
    final effectiveCurriculum = _resolveCurriculumForCall(
      curriculum,
      effectiveScope,
    );
    _activeExamScope = effectiveScope;

    final plan = AutoStudyProgramGenerator.rebalanceMissedTasks(
      currentDayTasks: state.tasks,
      currentDay: state.cycleDay,
      pace: pace,
      examTarget: examTarget,
      focusLesson: focusLesson,
      curriculum: effectiveCurriculum,
      examScope: effectiveScope,
      isSprintMode: state.isSprintModeActive,
    );

    _dayTasksCache[state.cycleDay] = plan.todayTasks;
    for (final entry in plan.futureDayTasks.entries) {
      _dayTasksCache[entry.key] = entry.value;
      unawaited(_storage.savePlannerDayTasks(entry.key, entry.value));
    }

    state = state.copyWith(
      tasks: plan.todayTasks,
      lastPlannedDate: _todayDateOnly(),
      examScope: effectiveScope,
    );

    unawaited(_storage.saveStudyTasks(plan.todayTasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, plan.todayTasks));
    _persistAndSyncSnapshot();
    return plan.carriedCount;
  }

  /// Son 30 gün kala yoğun deneme & yanlış tekrarı odaklı Sprint Modunu açar (`TASK-159`).
  void activateSprintMode({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
  }) {
    final effectiveScope =
        examScope ?? curriculum?.scopeKey ?? _activeExamScope;
    adaptStudyProgramPace(
      examTarget: examTarget,
      oldPace: pace,
      newPace: pace,
      focusLesson: focusLesson,
      curriculum: curriculum,
      examScope: effectiveScope,
      isSprintMode: true,
    );
  }

  /// Testlerde gecikmiş gün senaryolarını deterministik doğrulamak için son planlı tarihi ayarlar.
  void debugSetLastPlannedDateForTest(DateTime? date) {
    state = state.copyWith(
      lastPlannedDate: date,
      clearLastPlannedDate: date == null,
    );
  }

  /// Sıradaki güne geçiş yapar.
  ///
  /// O günün tüm görevleri tamamlanmadan (`canAdvanceToNextDay == false`) sonraki güne geçiş kilitlidir.
  /// Geçiş başarılıysa `true`, kilitliyse `false` döner.
  bool advanceToNextDay({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
  }) {
    if (!state.canAdvanceToNextDay) {
      return false;
    }

    final nextDay = state.cycleDay + 1;
    final nextMax = nextDay > state.maxUnlockedDay
        ? nextDay
        : state.maxUnlockedDay;
    if (nextMax != state.maxUnlockedDay) {
      unawaited(_storage.savePlannerMaxUnlockedDay(nextMax));
    }

    goToDay(
      nextDay,
      examTarget: examTarget,
      pace: pace,
      focusLesson: focusLesson,
      curriculum: curriculum,
      examScope: examScope,
      targetMaxUnlockedDay: nextMax,
    );
    return true;
  }

  /// Önceki günün görevlerine ve tekrarına geri döner.
  void goToPreviousDay({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
  }) {
    if (!state.hasPreviousDay) return;
    goToDay(
      state.cycleDay - 1,
      examTarget: examTarget,
      pace: pace,
      focusLesson: focusLesson,
      curriculum: curriculum,
      examScope: examScope,
    );
  }

  /// Kilidi açılmış belirli bir güne anında geçiş yapar ve o günün görevlerini yükler.
  void goToDay(
    int targetDay, {
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String? examScope,
    int? targetMaxUnlockedDay,
  }) {
    final effectiveScope =
        examScope ?? curriculum?.scopeKey ?? _activeExamScope;
    final effectiveCurriculum = _resolveCurriculumForCall(
      curriculum,
      effectiveScope,
    );
    _activeExamScope = effectiveScope;

    final effectiveMax = targetMaxUnlockedDay ?? state.maxUnlockedDay;
    final safeTarget = targetDay.clamp(1, effectiveMax);
    if (safeTarget == state.cycleDay &&
        state.tasks.isNotEmpty &&
        effectiveMax == state.maxUnlockedDay) {
      return;
    }

    // Mevcut günün durumunu önbelleğe ve depolamaya kaydet
    _dayTasksCache[state.cycleDay] = state.tasks;
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, state.tasks));

    // Hedef günün görevlerini önbellekten oku veya yeniden üret
    final cached = _dayTasksCache[safeTarget];
    List<StudyTask> nextTasks;
    if (cached != null) {
      nextTasks = cached;
    } else {
      final generated = AutoStudyProgramGenerator.generateDailyTasks(
        examTarget: examTarget,
        pace: pace,
        focusLesson: focusLesson,
        cycleDay: safeTarget,
        curriculum: effectiveCurriculum,
        examScope: effectiveScope,
      );
      final custom = _customTasksByDay[safeTarget] ?? const [];
      final allTasks = [...generated, ...custom];
      final hasAnyIdForDay = _completedTaskIds.any(
        (id) => id.contains('_d${safeTarget}_'),
      );

      nextTasks = allTasks.map((t) {
        final isDone =
            _completedTaskIds.contains(t.id) ||
            (safeTarget < effectiveMax && !hasAnyIdForDay);
        if (isDone) {
          _completedTaskIds.add(t.id);
          return t.copyWith(isCompleted: true);
        }
        return t;
      }).toList();
    }

    _dayTasksCache[safeTarget] = nextTasks;
    state = state.copyWith(
      tasks: nextTasks,
      cycleDay: safeTarget,
      maxUnlockedDay: effectiveMax,
      examScope: effectiveScope,
    );

    unawaited(_storage.saveStudyTasks(nextTasks));
    unawaited(_storage.savePlannerDayTasks(safeTarget, nextTasks));
    unawaited(_storage.savePlannerCycleDay(safeTarget));
    _persistAndSyncSnapshot();
    syncCompletedFromStats(ref.read(studyStatsProvider));
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

    _completedTaskIds.remove(id);
    _customTasksByDay[state.cycleDay]?.removeWhere((t) => t.id == id);

    state = state.copyWith(
      tasks: state.tasks.where((task) => task.id != id).toList(),
    );
    _dayTasksCache[state.cycleDay] = state.tasks;

    unawaited(_storage.saveStudyTasks(state.tasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, state.tasks));
    _persistAndSyncSnapshot();

    if (removedTask != null) {
      unawaited(_cloudSync.deleteStudyTaskByTitle(removedTask.title));
    }
  }

  /// Tamamlanmış tüm görevleri listeden temizler.
  void clearCompleted() {
    final completedTasks = state.tasks.where((t) => t.isCompleted).toList();
    for (final t in completedTasks) {
      _completedTaskIds.remove(t.id);
    }
    _customTasksByDay[state.cycleDay]?.removeWhere((t) => t.isCompleted);

    state = state.copyWith(
      tasks: state.tasks.where((task) => !task.isCompleted).toList(),
    );
    _dayTasksCache[state.cycleDay] = state.tasks;

    unawaited(_storage.saveStudyTasks(state.tasks));
    unawaited(_storage.savePlannerDayTasks(state.cycleDay, state.tasks));
    _persistAndSyncSnapshot();

    for (final task in completedTasks) {
      unawaited(_cloudSync.deleteStudyTaskByTitle(task.title));
    }
  }

  /// Snapshot verisini alarak tüm günlerin görevlerini ve kilit durumunu deterministik olarak kurar.
  ///
  /// Web/Angular Benzetmesi: NgRx store hydration / state restoration.
  void applySnapshot(
    PlannerSyncSnapshot snapshot, {
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    ExamCurriculum? curriculum,
    bool syncToCloud = true,
  }) {
    final effectiveScope = snapshot.examScope;
    final effectiveCurriculum = _resolveCurriculumForCall(
      curriculum,
      effectiveScope,
    );
    _activeExamScope = effectiveScope;

    final safeMax = snapshot.maxUnlockedDay < 1 ? 1 : snapshot.maxUnlockedDay;
    final safeCycle = snapshot.cycleDay.clamp(1, safeMax);

    _dayTasksCache.clear();
    _completedTaskIds.clear();
    _completedTaskIds.addAll(snapshot.completedTaskIds);
    _customTasksByDay.clear();

    for (var d = 1; d <= safeMax; d++) {
      final customForDay = snapshot.customTasksByDay[d] ?? const [];
      if (customForDay.isNotEmpty) {
        _customTasksByDay[d] = List<StudyTask>.from(customForDay);
      }

      final savedDayTasks = snapshot.tasksByDay[d];
      List<StudyTask> restoredDayTasks;

      if (savedDayTasks != null && savedDayTasks.isNotEmpty) {
        final hasCompletedInSaved = savedDayTasks.any((t) => t.isCompleted);
        final hasAnyIdInCompletedSet = snapshot.completedTaskIds.any(
          (id) => id.contains('_d${d}_'),
        );
        final hasAnyCompletedInSavedOrIds =
            hasCompletedInSaved || hasAnyIdInCompletedSet;

        final dayTasks = List<StudyTask>.from(savedDayTasks);
        for (final c in customForDay) {
          if (!dayTasks.any((t) => t.id == c.id)) {
            dayTasks.add(c);
          }
        }

        restoredDayTasks = dayTasks.map((t) {
          final isDone =
              t.isCompleted ||
              snapshot.completedTaskIds.contains(t.id) ||
              (d < safeMax && !hasAnyCompletedInSavedOrIds);
          if (isDone) {
            _completedTaskIds.add(t.id);
            return t.copyWith(isCompleted: true);
          }
          return t;
        }).toList();
      } else {
        final baseTasks = AutoStudyProgramGenerator.generateDailyTasks(
          examTarget: examTarget,
          pace: pace,
          focusLesson: focusLesson,
          cycleDay: d,
          curriculum: effectiveCurriculum,
          examScope: effectiveScope,
        );

        final allDayTasks = [...baseTasks, ...customForDay];
        final hasAnyIdForDay = snapshot.completedTaskIds.any(
          (id) => id.contains('_d${d}_'),
        );

        restoredDayTasks = allDayTasks.map((t) {
          final isDone =
              snapshot.completedTaskIds.contains(t.id) ||
              (d < safeMax && !hasAnyIdForDay);
          if (isDone) {
            _completedTaskIds.add(t.id);
            return t.copyWith(isCompleted: true);
          }
          return t;
        }).toList();
      }

      _dayTasksCache[d] = restoredDayTasks;
      unawaited(_storage.savePlannerDayTasks(d, restoredDayTasks));
    }

    final activeTasks = _dayTasksCache[safeCycle] ?? const [];
    state = StudyPlannerState(
      tasks: activeTasks,
      cycleDay: safeCycle,
      maxUnlockedDay: safeMax,
      examScope: effectiveScope,
      lastPlannedDate: _parseDateKey(snapshot.lastPlannedDate),
      isSprintModeActive: snapshot.isSprintModeActive,
      weeklyStudyDays: snapshot.weeklyStudyDays,
    );

    unawaited(_storage.saveStudyTasks(activeTasks));
    unawaited(_storage.savePlannerCycleDay(safeCycle));
    unawaited(_storage.savePlannerMaxUnlockedDay(safeMax));
    unawaited(
      _storage.savePlannerSnapshot(exportSnapshot(), accountKey: _accountKey),
    );
    if (syncToCloud) {
      unawaited(_cloudSync.syncPlannerSnapshot(exportSnapshot()));
    }
    syncCompletedFromStats(ref.read(studyStatsProvider));
  }

  /// Buluttaki ve hesaba ait yerel kayıtlı çalışma planını yükler ve birleştirir.
  Future<void> loadTasksFromCloud({
    String? accountKey,
    PlannerSyncSnapshot? cloudSnapshotOverride,
  }) async {
    if (accountKey != null && accountKey.trim().isNotEmpty) {
      _accountKey = accountKey.trim().toLowerCase();
    }

    final cloudSnapshot =
        cloudSnapshotOverride ?? await _cloudSync.fetchPlannerSnapshot();
    if (_isDisposed) return;

    final accountSnapshot = _accountKey != null
        ? await _storage.loadPlannerSnapshot(accountKey: _accountKey)
        : null;
    if (_isDisposed) return;

    final currentLocal = exportSnapshot();
    final hasLocalProgress = !currentLocal.isEmptyProgress;

    PlannerSyncSnapshot? merged =
        (cloudSnapshot != null && !cloudSnapshot.isEmptyProgress)
        ? cloudSnapshot
        : null;
    if (accountSnapshot != null && !accountSnapshot.isEmptyProgress) {
      merged = merged == null
          ? accountSnapshot
          : merged.mergeWith(accountSnapshot);
    }
    if (hasLocalProgress) {
      merged = merged == null ? currentLocal : merged.mergeWith(currentLocal);
    }

    final prefs = ref.read(userPreferencesProvider);
    if (merged != null && !merged.isEmptyProgress) {
      final shouldSyncBack =
          (cloudSnapshot == null || cloudSnapshot.isEmptyProgress) ||
          hasLocalProgress ||
          (accountSnapshot != null && !accountSnapshot.isEmptyProgress);
      applySnapshot(
        merged,
        examTarget: prefs.targetExam,
        pace: prefs.studyProgramPace,
        focusLesson: prefs.focusLesson,
        syncToCloud: shouldSyncBack,
      );
      return;
    }

    final remoteTasks = await _cloudSync.fetchStudyTasks();
    if (_isDisposed) return;
    if (remoteTasks.isNotEmpty) {
      _dayTasksCache[1] = remoteTasks;
      for (final t in remoteTasks) {
        if (t.isCompleted) _completedTaskIds.add(t.id);
      }
      state = state.copyWith(tasks: remoteTasks);
      unawaited(_storage.saveStudyTasks(state.tasks));
      return;
    }

    // Bulutta kullanıcının kurulu programı/tercihi var ama planner_state henüz boşsa
    // (ör. eski sürüm kayıtlı kullanıcı veya yarım kalmış bulut kaydı),
    // tercihlerine göre programı deterministik olarak üretip bulutla eşitler.
    if (prefs.hasCompletedOnboarding || prefs.hasActiveStudyProgram) {
      final resolvedCurriculum = CurriculumRegistry.resolve(
        prefs.examSelection,
      );
      setupAutoProgram(
        examTarget: prefs.targetExam,
        pace: prefs.studyProgramPace,
        focusLesson: prefs.focusLesson,
        curriculum: resolvedCurriculum,
        examScope: prefs.examSelection.scopeKey,
      );
    }
  }

  /// Oturum kapatıldığında veya kullanıcı değiştiğinde varsayılan görevlere sıfırlar.
  void reset() {
    _accountKey = null;
    _activeExamScope = 'lisans_gk';
    _archivedSnapshotsByScope.clear();
    _completedTaskIds.clear();
    _customTasksByDay.clear();
    _dayTasksCache.clear();
    state = const StudyPlannerState(
      tasks: _defaultTasks,
      cycleDay: 1,
      maxUnlockedDay: 1,
      examScope: 'lisans_gk',
      lastPlannedDate: null,
      isSprintModeActive: false,
      weeklyStudyDays: [1, 2, 3, 4, 5, 6, 7],
    );
    unawaited(_storage.clearActivePlannerCache());
  }
}

/// Global StudyPlanner State Provider'ı.
final studyPlannerProvider =
    NotifierProvider<StudyPlannerNotifier, StudyPlannerState>(
      StudyPlannerNotifier.new,
    );
