import 'dart:math' as math;

import 'package:kadro/features/planner/data/models/study_task.dart';

/// Çalışma planının ve tamamlanan günlük görevlerin cihazlar ve oturumlar
/// arasında kalıcı olarak senkronize edilmesini sağlayan durum anlık görüntüsü (Snapshot).
///
/// Web/Angular Benzetmesi:
/// NgRx / Redux Store üzerindeki `PlannerSyncState` veya bulut senkronizasyon DTO'su (Data Transfer Object).
/// Birden çok cihaz veya tarayıcı sekmesi arasında veri çakışmalarını önlemek için
/// "High-Water Mark" (en yüksek tamamlanan gün) algoritmasını kullanır.
class PlannerSyncSnapshot {
  /// Kullanıcının şu an üzerinde çalıştığı veya görüntülediği gün (1-tabanlı).
  final int cycleDay;

  /// Kullanıcının başarıyla kilidini açtığı ve ulaştığı en yüksek gün numarası.
  final int maxUnlockedDay;

  /// Geçmiş ve mevcut tüm günlerde tamamlanmış görevlerin benzersiz ID kümesi.
  final Set<String> completedTaskIds;

  /// Kullanıcının kendi eklediği özel görevlerin gün bazlı haritası (Gün -> Görevler).
  final Map<int, List<StudyTask>> customTasksByDay;

  /// Her günün tüm görev nesnelerini tam detaylarıyla tutan gün bazlı görev haritası (Gün -> Görevler).
  ///
  /// Web/Angular Benzetmesi: Normalleştirilmiş NgRx Entity tablosu (`entitiesByDay`).
  /// Kullanıcı tempo değiştirdiğinde veya cihazlar arası geçiş yaptığında geçmiş günlerin
  /// orijinal görev tanımlarını ve tamamlama durumlarını %100 korumak için saklanır.
  final Map<int, List<StudyTask>> tasksByDay;

  /// Planın oluşturulduğu aktif KPSS / MEB-AGS sınav kapsamı anahtarı.
  final String examScope;

  /// Planın en son aktif olduğu takvim günü (`'YYYY-MM-DD'`).
  final String? lastPlannedDate;

  /// Son 30 gün yoğunlaştırma (Sprint) modunun açık olup olmadığı.
  final bool isSprintModeActive;

  /// Kullanıcının haftalık çalışma günleri (`1` = Pzt ... `7` = Paz).
  final List<int> weeklyStudyDays;

  /// Son güncelleme zaman damgası (UTC).
  final DateTime updatedAt;

  PlannerSyncSnapshot({
    this.cycleDay = 1,
    this.maxUnlockedDay = 1,
    this.completedTaskIds = const {},
    this.customTasksByDay = const {},
    Map<int, List<StudyTask>>? tasksByDay,
    this.examScope = 'lisans_gk',
    this.lastPlannedDate,
    this.isSprintModeActive = false,
    this.weeklyStudyDays = const [1, 2, 3, 4, 5, 6, 7],
    DateTime? updatedAt,
  }) : tasksByDay = tasksByDay ?? const {},
       updatedAt = updatedAt ?? DateTime.now().toUtc();

  /// İlerlemenin hiç başlamadığını (varsayılan boş durum) belirtir.
  bool get isEmptyProgress =>
      cycleDay <= 1 &&
      maxUnlockedDay <= 1 &&
      completedTaskIds.isEmpty &&
      customTasksByDay.isEmpty &&
      tasksByDay.isEmpty &&
      !isSprintModeActive;

  /// JSON çıktısı üretir (Yerel SharedPreferences ve Supabase JSONB için).
  Map<String, dynamic> toJson() {
    return {
      'cycle_day': cycleDay,
      'max_unlocked_day': maxUnlockedDay,
      'completed_task_ids': completedTaskIds.toList(),
      'custom_tasks_by_day': {
        for (final e in customTasksByDay.entries)
          '${e.key}': e.value.map((t) => t.toJson()).toList(),
      },
      'tasks_by_day': {
        for (final e in tasksByDay.entries)
          if (e.value.isNotEmpty)
            '${e.key}': e.value.map((t) => t.toJson()).toList(),
      },
      'exam_scope': examScope,
      if (lastPlannedDate != null) 'last_planned_date': lastPlannedDate,
      'is_sprint_mode_active': isSprintModeActive,
      'weekly_study_days': weeklyStudyDays,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// JSON haritasından güvenli tip dönüşümleriyle [PlannerSyncSnapshot] nesnesi oluşturur.
  factory PlannerSyncSnapshot.fromJson(Map<String, dynamic> json) {
    final rawCycleDay =
        (json['cycle_day'] ?? json['cycleDay'] as num?)?.toInt() ?? 1;
    final safeCycleDay = rawCycleDay < 1 ? 1 : rawCycleDay;

    final rawMaxDay =
        (json['max_unlocked_day'] ?? json['maxUnlockedDay'] as num?)?.toInt() ??
        safeCycleDay;
    final safeMaxDay = math.max<int>(safeCycleDay, rawMaxDay);

    final rawCompleted = json['completed_task_ids'] ?? json['completedTaskIds'];
    final completedSet = <String>{};
    if (rawCompleted is Iterable) {
      for (final id in rawCompleted) {
        if (id != null) completedSet.add(id.toString());
      }
    }

    final rawCustomMap =
        json['custom_tasks_by_day'] ?? json['customTasksByDay'];
    final customMap = <int, List<StudyTask>>{};
    if (rawCustomMap is Map) {
      for (final entry in rawCustomMap.entries) {
        final day = int.tryParse(entry.key.toString());
        if (day != null && entry.value is List) {
          final list = (entry.value as List)
              .whereType<Map>()
              .map(
                (item) => StudyTask.fromJson(Map<String, dynamic>.from(item)),
              )
              .toList();
          if (list.isNotEmpty) {
            customMap[day] = list;
          }
        }
      }
    }

    final rawTasksByDay = json['tasks_by_day'] ?? json['tasksByDay'];
    final tasksByDayMap = <int, List<StudyTask>>{};
    if (rawTasksByDay is Map) {
      for (final entry in rawTasksByDay.entries) {
        final day = int.tryParse(entry.key.toString());
        if (day != null && entry.value is List) {
          final list = (entry.value as List)
              .whereType<Map>()
              .map(
                (item) => StudyTask.fromJson(Map<String, dynamic>.from(item)),
              )
              .toList();
          if (list.isNotEmpty) {
            tasksByDayMap[day] = list;
            for (final t in list) {
              if (t.isCompleted) {
                completedSet.add(t.id);
              }
            }
          }
        }
      }
    }

    DateTime parsedUpdatedAt;
    final rawUpdatedAt = json['updated_at'] ?? json['updatedAt'];
    if (rawUpdatedAt is String) {
      parsedUpdatedAt =
          DateTime.tryParse(rawUpdatedAt)?.toUtc() ?? DateTime.now().toUtc();
    } else {
      parsedUpdatedAt = DateTime.now().toUtc();
    }

    final rawWeeklyDays = json['weekly_study_days'] ?? json['weeklyStudyDays'];
    final parsedWeeklyDays = <int>[];
    if (rawWeeklyDays is Iterable) {
      for (final d in rawWeeklyDays) {
        final dayInt = (d as num?)?.toInt();
        if (dayInt != null &&
            dayInt >= 1 &&
            dayInt <= 7 &&
            !parsedWeeklyDays.contains(dayInt)) {
          parsedWeeklyDays.add(dayInt);
        }
      }
      parsedWeeklyDays.sort();
    }

    return PlannerSyncSnapshot(
      cycleDay: safeCycleDay,
      maxUnlockedDay: safeMaxDay,
      completedTaskIds: completedSet,
      customTasksByDay: customMap,
      tasksByDay: tasksByDayMap,
      examScope:
          ((json['exam_scope'] ?? json['examScope']) as String?) ?? 'lisans_gk',
      lastPlannedDate:
          (json['last_planned_date'] ?? json['lastPlannedDate']) as String?,
      isSprintModeActive:
          (json['is_sprint_mode_active'] ?? json['isSprintModeActive'])
              as bool? ??
          false,
      weeklyStudyDays: parsedWeeklyDays.isNotEmpty
          ? parsedWeeklyDays
          : const [1, 2, 3, 4, 5, 6, 7],
      updatedAt: parsedUpdatedAt,
    );
  }

  /// İki farklı cihaz veya oturumdan gelen anlık görüntüleri "High-Water Mark"
  /// kuralıyla birleştirir (Merge Conflict Resolution).
  ///
  /// Kurallar:
  /// 1. Farklı sınav kapsamları (`examScope`) çakışırsa daha yeni zaman damgalı kapsam seçilir.
  /// 2. `maxUnlockedDay`: Hangisi daha ilerideyse o kazanır.
  /// 3. `cycleDay`: En yüksek güne sahip olanın aktif günü seçilir; eşitse yüksek olan gün alınır.
  /// 4. `completedTaskIds`: Her iki tarafta bitirilen tüm görev ID'leri birleştirilir (Union).
  /// 5. `customTasksByDay`: Özel görevler ID bazlı tekilleştirilerek korunur.
  /// 6. `tasksByDay`: Her iki taraftaki tüm günlerin görev listeleri korunur ve tamamlanma durumları birleştirilir.
  /// 7. `updatedAt`: Daha yeni olan zaman damgası atanır.
  PlannerSyncSnapshot mergeWith(PlannerSyncSnapshot other) {
    final mergedCompletedTaskIds = {
      ...completedTaskIds,
      ...other.completedTaskIds,
    };

    if (examScope != other.examScope) {
      final useThis = !updatedAt.isBefore(other.updatedAt);
      var winner = useThis ? this : other;
      final loser = useThis ? other : this;
      if (winner.isEmptyProgress && !loser.isEmptyProgress) {
        winner = loser;
      }
      final mergedUpdatedAt = updatedAt.isAfter(other.updatedAt)
          ? updatedAt
          : other.updatedAt;
      return winner.copyWith(
        completedTaskIds: mergedCompletedTaskIds,
        updatedAt: mergedUpdatedAt,
      );
    }

    final mergedMaxUnlockedDay = math.max<int>(
      maxUnlockedDay,
      other.maxUnlockedDay,
    );

    int mergedCycleDay;
    if (maxUnlockedDay > other.maxUnlockedDay) {
      mergedCycleDay = cycleDay;
    } else if (other.maxUnlockedDay > maxUnlockedDay) {
      mergedCycleDay = other.cycleDay;
    } else {
      mergedCycleDay = math.max<int>(cycleDay, other.cycleDay);
    }
    mergedCycleDay = mergedCycleDay.clamp(1, mergedMaxUnlockedDay);

    final allDays = {...customTasksByDay.keys, ...other.customTasksByDay.keys};
    final mergedCustomTasks = <int, List<StudyTask>>{};

    for (final day in allDays) {
      final thisTasks = customTasksByDay[day] ?? const [];
      final otherTasks = other.customTasksByDay[day] ?? const [];

      final uniqueMap = <String, StudyTask>{};
      for (final t in thisTasks) {
        uniqueMap[t.id] = t;
      }
      for (final t in otherTasks) {
        // İki tarafta da varsa, tamamlanmış olan durumu tercih et
        final existing = uniqueMap[t.id];
        if (existing == null) {
          uniqueMap[t.id] = t;
        } else if (!existing.isCompleted && t.isCompleted) {
          uniqueMap[t.id] = t;
        }
      }
      if (uniqueMap.isNotEmpty) {
        mergedCustomTasks[day] = uniqueMap.values.toList();
      }
    }

    final thisIsNewer = !updatedAt.isBefore(other.updatedAt);
    final allTaskDays = {...tasksByDay.keys, ...other.tasksByDay.keys};
    final mergedTasksByDay = <int, List<StudyTask>>{};

    for (final day in allTaskDays) {
      final thisList = tasksByDay[day];
      final otherList = other.tasksByDay[day];

      if (thisList != null && otherList == null) {
        // Yalnızca bu tarafta var: tamamlananları güncelle
        final updatedList = thisList.map((t) {
          final isDone = t.isCompleted || mergedCompletedTaskIds.contains(t.id);
          if (isDone) mergedCompletedTaskIds.add(t.id);
          return isDone ? t.copyWith(isCompleted: true) : t;
        }).toList();
        if (updatedList.isNotEmpty) {
          mergedTasksByDay[day] = updatedList;
        }
      } else if (thisList == null && otherList != null) {
        // Yalnızca diğer tarafta var: tamamlananları güncelle
        final updatedList = otherList.map((t) {
          final isDone = t.isCompleted || mergedCompletedTaskIds.contains(t.id);
          if (isDone) mergedCompletedTaskIds.add(t.id);
          return isDone ? t.copyWith(isCompleted: true) : t;
        }).toList();
        if (updatedList.isNotEmpty) {
          mergedTasksByDay[day] = updatedList;
        }
      } else if (thisList != null && otherList != null) {
        // İki tarafta da var: daha fazla göreve sahip olanı (veya eşitse thisIsNewer) baz al
        final bool pickThisAsBase;
        if (thisList.length != otherList.length) {
          pickThisAsBase = thisList.length > otherList.length;
        } else {
          pickThisAsBase = thisIsNewer;
        }

        final baseList = pickThisAsBase ? thisList : otherList;
        final altList = pickThisAsBase ? otherList : thisList;

        final altCompleted = altList
            .where(
              (altTask) =>
                  altTask.isCompleted ||
                  mergedCompletedTaskIds.contains(altTask.id),
            )
            .toList();

        final mergedList = <StudyTask>[];
        for (final baseTask in baseList) {
          final matchesAltCompleted = altCompleted.any(
            (altTask) => baseTask.isSameTaskItem(altTask),
          );
          final isDone =
              baseTask.isCompleted ||
              mergedCompletedTaskIds.contains(baseTask.id) ||
              matchesAltCompleted;

          if (isDone) {
            mergedCompletedTaskIds.add(baseTask.id);
            mergedList.add(baseTask.copyWith(isCompleted: true));
          } else {
            mergedList.add(baseTask);
          }
        }

        // Diğer listede tamamlanmış olup baz listede hiç eşleşmesi bulunmayan görevleri de koru
        for (final altTask in altCompleted) {
          final hasMatchInBase = baseList.any((b) => b.isSameTaskItem(altTask));
          if (!hasMatchInBase) {
            mergedCompletedTaskIds.add(altTask.id);
            mergedList.add(altTask.copyWith(isCompleted: true));
          }
        }

        if (mergedList.isNotEmpty) {
          mergedTasksByDay[day] = mergedList;
        }
      }
    }

    final mergedUpdatedAt = updatedAt.isAfter(other.updatedAt)
        ? updatedAt
        : other.updatedAt;

    final mergedLastPlanned = thisIsNewer
        ? (lastPlannedDate ?? other.lastPlannedDate)
        : (other.lastPlannedDate ?? lastPlannedDate);
    final mergedSprint = isSprintModeActive || other.isSprintModeActive;
    final mergedWeeklyDays = thisIsNewer
        ? weeklyStudyDays
        : other.weeklyStudyDays;

    return PlannerSyncSnapshot(
      cycleDay: mergedCycleDay,
      maxUnlockedDay: mergedMaxUnlockedDay,
      completedTaskIds: mergedCompletedTaskIds,
      customTasksByDay: mergedCustomTasks,
      tasksByDay: mergedTasksByDay,
      examScope: examScope,
      lastPlannedDate: mergedLastPlanned,
      isSprintModeActive: mergedSprint,
      weeklyStudyDays: mergedWeeklyDays,
      updatedAt: mergedUpdatedAt,
    );
  }

  PlannerSyncSnapshot copyWith({
    int? cycleDay,
    int? maxUnlockedDay,
    Set<String>? completedTaskIds,
    Map<int, List<StudyTask>>? customTasksByDay,
    Map<int, List<StudyTask>>? tasksByDay,
    String? examScope,
    String? lastPlannedDate,
    bool? isSprintModeActive,
    List<int>? weeklyStudyDays,
    DateTime? updatedAt,
  }) {
    return PlannerSyncSnapshot(
      cycleDay: cycleDay ?? this.cycleDay,
      maxUnlockedDay: maxUnlockedDay ?? this.maxUnlockedDay,
      completedTaskIds: completedTaskIds ?? this.completedTaskIds,
      customTasksByDay: customTasksByDay ?? this.customTasksByDay,
      tasksByDay: tasksByDay ?? this.tasksByDay,
      examScope: examScope ?? this.examScope,
      lastPlannedDate: lastPlannedDate ?? this.lastPlannedDate,
      isSprintModeActive: isSprintModeActive ?? this.isSprintModeActive,
      weeklyStudyDays: weeklyStudyDays ?? this.weeklyStudyDays,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
