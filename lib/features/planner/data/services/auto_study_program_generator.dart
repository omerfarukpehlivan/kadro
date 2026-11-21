import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/map_practice/data/map_practice_data.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';

/// Haftalık görsel takvimde bir günün baskın çalışma türünü belirler (`TASK-159`).
enum WeeklyActivityKind { quiz, review, sprintExam, rest }

/// Haftalık görsel takvim şeridindeki tekil bir günün önizleme özeti (`TASK-159`).
class WeeklyPlanDayPreview {
  final int weekday;
  final String shortLabel;
  final bool isRestDay;
  final int estimatedMinutes;
  final int taskCount;
  final WeeklyActivityKind primaryKind;
  final String focusSummary;

  const WeeklyPlanDayPreview({
    required this.weekday,
    required this.shortLabel,
    required this.isRestDay,
    required this.estimatedMinutes,
    required this.taskCount,
    required this.primaryKind,
    required this.focusSummary,
  });
}

/// Kaçırılan günlerin telafi dağıtımı sonrası bugüne ve gelecek günlere atanan
/// yeniden dengelenmiş görev sonucu (`TASK-159`).
class CatchUpRebalancePlan {
  final List<StudyTask> todayTasks;
  final Map<int, List<StudyTask>> futureDayTasks;
  final int carriedCount;

  const CatchUpRebalancePlan({
    required this.todayTasks,
    required this.futureDayTasks,
    required this.carriedCount,
  });
}

/// Müfredat içi tek bir 10 soruluk konu testi birimi.
class CurriculumTestUnit {
  final String lesson;
  final String topic;
  final int testNumber;
  final int totalTestsInTopic;

  const CurriculumTestUnit({
    required this.lesson,
    required this.topic,
    required this.testNumber,
    required this.totalTestsInTopic,
  });
}

/// Seçilen KPSS sınavı, günlük ayrılan süre (`15–90 dk`) ve odak dersine göre
/// uygulamadaki gerçek içerikleri (konu testleri, hap bilgi kartları, harita soruları,
/// kavram oyunları ve denemeler) sıralı günlük çalışma paketlerine dönüştüren servis.
class AutoStudyProgramGenerator {
  static int get totalTopicTestsCount => totalCurriculumTestCount;
  static int get totalFlashcardsCount => sampleFlashcards.length;
  static int get totalPredefinedMapCount =>
      MapPracticeData.predefinedChallenges.length;

  /// Belirtilen odak dersini önceleyen, seçili müfredattaki dersler arasında
  /// soru ağırlığına göre dengeli dönüşümlü gerçek test kuyruğu üretir.
  static List<CurriculumTestUnit> buildOrderedCurriculum({
    String? focusLesson,
    ExamCurriculum? curriculum,
  }) {
    if (curriculum != null) {
      return _buildFromExamCurriculum(curriculum, focusLesson: focusLesson);
    }

    final lessonQueues = <String, List<CurriculumTestUnit>>{};
    for (final lesson in kpssLessons) {
      final units = <CurriculumTestUnit>[];
      for (final topic in lesson.topics) {
        final count = defaultTopicTestCount(lesson.name, topic);
        for (var i = 1; i <= count; i++) {
          units.add(
            CurriculumTestUnit(
              lesson: lesson.name,
              topic: topic,
              testNumber: i,
              totalTestsInTopic: count,
            ),
          );
        }
      }
      lessonQueues[lesson.name] = units;
    }

    final order = _lessonRotation(focusLesson);
    final interleaved = <CurriculumTestUnit>[];
    var added = true;
    var index = 0;

    while (added) {
      added = false;
      for (final lessonName in order) {
        final list = lessonQueues[lessonName];
        if (list != null && index < list.length) {
          interleaved.add(list[index]);
          added = true;
        }
      }
      index++;
    }

    return interleaved;
  }

  static List<CurriculumTestUnit> _buildFromExamCurriculum(
    ExamCurriculum curriculum, {
    String? focusLesson,
  }) {
    final specs = curriculum.activeLessons.isNotEmpty
        ? curriculum.activeLessons
        : curriculum.upcomingLessons;
    if (specs.isEmpty) return const [];

    final lessonQueues = <String, List<CurriculumTestUnit>>{};
    final weightedSlots = <String>[];

    final orderedSpecs = <LessonSpec>[
      if (focusLesson != null) ...specs.where((s) => s.name == focusLesson),
      ...specs.where((s) => s.name != focusLesson),
    ];

    for (final spec in orderedSpecs) {
      final units = <CurriculumTestUnit>[];
      for (final topic in spec.topics) {
        final count = spec.testCountForTopic(topic);
        for (var i = 1; i <= count; i++) {
          units.add(
            CurriculumTestUnit(
              lesson: spec.name,
              topic: topic,
              testNumber: i,
              totalTestsInTopic: count,
            ),
          );
        }
      }
      if (units.isEmpty) continue;
      lessonQueues[spec.name] = units;

      // Dersin soru ağırlığına göre tur içi slot sayısını belirle (1..3).
      final baseWeight = (spec.questionCount / 15).ceil().clamp(1, 3);
      final slots = spec.name == focusLesson ? baseWeight + 1 : baseWeight;
      for (var i = 0; i < slots; i++) {
        weightedSlots.add(spec.name);
      }
    }

    if (lessonQueues.isEmpty) return const [];

    final cursors = <String, int>{for (final k in lessonQueues.keys) k: 0};
    final interleaved = <CurriculumTestUnit>[];
    var progressed = true;

    while (progressed) {
      progressed = false;
      for (final lessonName in weightedSlots) {
        final queue = lessonQueues[lessonName];
        final cursor = cursors[lessonName] ?? 0;
        if (queue != null && cursor < queue.length) {
          interleaved.add(queue[cursor]);
          cursors[lessonName] = cursor + 1;
          progressed = true;
        }
      }
    }

    return interleaved;
  }

  static List<String> _lessonRotation(
    String? focusLesson, {
    ExamCurriculum? curriculum,
  }) {
    final base = curriculum != null
        ? (curriculum.activeLessons.isNotEmpty
                  ? curriculum.activeLessons
                  : curriculum.upcomingLessons)
              .map((l) => l.name)
              .toList()
        : const ['Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler'];
    if (base.isEmpty) return const ['Genel'];
    if (focusLesson == null || !base.contains(focusLesson)) {
      return base;
    }
    return [focusLesson, ...base.where((l) => l != focusLesson)];
  }

  /// Gün ve seçili günlük süre varyasyonuna göre gerçek hedefli günlük görev paketini üretir.
  static List<StudyTask> generateDailyTasks({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    int cycleDay = 1,
    ExamCurriculum? curriculum,
    String examScope = 'lisans_gk',
    bool Function(String lesson, String topic, int testNumber)? isTestSolved,
    bool ignoreOffsetWhenSolvedFiltered = false,
    bool isSprintMode = false,
  }) {
    final safeDay = cycleDay < 1 ? 1 : cycleDay;
    final effectiveScope = examScope != 'lisans_gk'
        ? examScope
        : (curriculum?.scopeKey ?? 'lisans_gk');
    final idPrefix = effectiveScope == 'lisans_gk'
        ? 'auto_${pace.name}_d$safeDay'
        : 'auto_${effectiveScope}_${pace.name}_d$safeDay';
    final orderedUnits = buildOrderedCurriculum(
      focusLesson: focusLesson,
      curriculum: curriculum,
    );
    final lessonsOrder = _lessonRotation(focusLesson, curriculum: curriculum);
    final flashLesson = lessonsOrder[(safeDay - 1) % lessonsOrder.length];
    final supportsFlashcards = curriculum?.supportsFlashcards ?? true;
    final supportsMap = curriculum?.supportsTurkeyMapWorkshop ?? true;
    final supportsGames = curriculum?.supportsMiniGames ?? true;

    // Eğer çözülmüş testleri kontrol eden fonksiyon verilmişse ve çözülmemiş testler varsa
    // adayın önüne daha önce çözdüğü testleri tekrar çıkarmayıp çözülmemişleri atar.
    final candidateUnits = (isTestSolved != null)
        ? orderedUnits
              .where((u) => !isTestSolved(u.lesson, u.topic, u.testNumber))
              .toList()
        : orderedUnits;
    final activeCurriculum = candidateUnits.isNotEmpty
        ? candidateUnits
        : orderedUnits;

    final testsOffset = (isTestSolved != null && ignoreOffsetWhenSolvedFiltered)
        ? 0
        : _cumulativeTestsBeforeDay(pace, safeDay);
    final testsTodayCount = _testsCountForDay(pace, safeDay);

    final tasks = <StudyTask>[];

    // 1. Gerçek 10'ar soruluk Konu Testleri (Müfredat kuyruğundan sıralı)
    if (activeCurriculum.isNotEmpty) {
      for (var i = 0; i < testsTodayCount; i++) {
        final unit =
            activeCurriculum[(testsOffset + i) % activeCurriculum.length];
        tasks.add(
          StudyTask(
            id: '${idPrefix}_quiz_${i + 1}',
            title: '${unit.topic} · Test ${unit.testNumber}',
            lessonTag: unit.lesson,
            estimatedMinutes: pace == StudyProgramPace.dk15 ? 9 : 13,
            actionType: StudyTaskActionType.quiz,
            targetTopic: unit.topic,
            targetTestNumber: unit.testNumber,
            targetCount: 10,
            examScope: effectiveScope,
          ),
        );
      }
    }

    StudyTask buildSupplementalReviewTask({
      required String suffix,
      required int count,
      required int minutes,
    }) {
      if (supportsFlashcards) {
        return _flashcardTask(
          id: '${idPrefix}_$suffix',
          lesson: flashLesson,
          count: count,
          day: safeDay,
          minutes: minutes,
          examScope: effectiveScope,
        );
      }
      return StudyTask(
        id: '${idPrefix}_$suffix',
        title: '$flashLesson · Özet ve Çeldirici Tekrarı',
        lessonTag: flashLesson,
        estimatedMinutes: minutes,
        actionType: StudyTaskActionType.mistakes,
        targetCount: count,
        examScope: effectiveScope,
      );
    }

    // 2. Süre paketine göre Hap Bilgi Kartı, Harita Sorusu, Oyun / Deneme / Yanlış Defteri
    switch (pace) {
      case StudyProgramPace.dk15:
        if (safeDay.isOdd || !supportsMap) {
          tasks.add(
            buildSupplementalReviewTask(suffix: 'fc', count: 6, minutes: 6),
          );
        } else {
          tasks.add(
            _mapTask(
              id: '${idPrefix}_map',
              count: 4,
              day: safeDay,
              minutes: 6,
              examScope: effectiveScope,
            ),
          );
        }
        break;

      case StudyProgramPace.dk30:
        tasks.add(
          buildSupplementalReviewTask(suffix: 'fc', count: 10, minutes: 9),
        );
        if (safeDay % 2 == 0 && supportsMap) {
          tasks.add(
            _mapTask(
              id: '${idPrefix}_map',
              count: 4,
              day: safeDay,
              minutes: 7,
              examScope: effectiveScope,
            ),
          );
        } else {
          tasks.add(
            StudyTask(
              id: '${idPrefix}_mistakes',
              title: 'Yanlış Defteri & Çeldirici Tekrarı',
              lessonTag: 'Genel',
              estimatedMinutes: 8,
              actionType: StudyTaskActionType.mistakes,
              targetCount: 5,
              examScope: effectiveScope,
            ),
          );
        }
        break;

      case StudyProgramPace.dk45:
        if (safeDay % 2 == 1 || !supportsMap) {
          tasks.add(
            buildSupplementalReviewTask(suffix: 'fc', count: 12, minutes: 15),
          );
        } else {
          tasks.add(
            _mapTask(
              id: '${idPrefix}_map',
              count: 5,
              day: safeDay,
              minutes: 15,
              examScope: effectiveScope,
            ),
          );
        }
        break;

      case StudyProgramPace.dk60:
        tasks.add(
          buildSupplementalReviewTask(suffix: 'fc', count: 15, minutes: 14),
        );
        if (safeDay % 3 == 0) {
          tasks.add(
            StudyTask(
              id: '${idPrefix}_mistakes',
              title: 'Yanlış Defterindeki Çeldiricileri Temizle',
              lessonTag: 'Genel',
              estimatedMinutes: 14,
              actionType: StudyTaskActionType.mistakes,
              targetCount: 10,
              examScope: effectiveScope,
            ),
          );
        } else if (safeDay % 2 == 0 && supportsGames) {
          tasks.add(
            StudyTask(
              id: '${idPrefix}_game',
              title: 'Kavram Eşleştirme Hızlı Tekrar Seti',
              lessonTag: flashLesson,
              estimatedMinutes: 12,
              actionType: StudyTaskActionType.game,
              targetCount: 1,
              examScope: effectiveScope,
            ),
          );
        } else if (supportsMap) {
          tasks.add(
            _mapTask(
              id: '${idPrefix}_map',
              count: 5,
              day: safeDay,
              minutes: 14,
              examScope: effectiveScope,
            ),
          );
        } else {
          tasks.add(
            StudyTask(
              id: '${idPrefix}_mistakes',
              title: '$flashLesson Çeldirici Tekrarı',
              lessonTag: flashLesson,
              estimatedMinutes: 14,
              actionType: StudyTaskActionType.mistakes,
              targetCount: 8,
              examScope: effectiveScope,
            ),
          );
        }
        break;

      case StudyProgramPace.dk90:
        tasks.add(
          buildSupplementalReviewTask(suffix: 'fc', count: 20, minutes: 15),
        );
        if (safeDay % 4 == 0) {
          final examCount = curriculum?.totalQuestions ?? 60;
          final examTitle =
              (effectiveScope == 'lisans_gk' || curriculum == null)
              ? '60 Soruluk Genel Kültür Deneme Simülasyonu'
              : '$examCount Soruluk ${curriculum.title} Denemesi';
          tasks.add(
            StudyTask(
              id: '${idPrefix}_exam',
              title: examTitle,
              lessonTag: 'Genel',
              estimatedMinutes: 30,
              actionType: StudyTaskActionType.exam,
              targetExamNumber: 1,
              targetCount: examCount,
              examScope: effectiveScope,
            ),
          );
        } else {
          if (supportsMap) {
            tasks.add(
              _mapTask(
                id: '${idPrefix}_map',
                count: 6,
                day: safeDay,
                minutes: 14,
                examScope: effectiveScope,
              ),
            );
          } else {
            tasks.add(
              buildSupplementalReviewTask(
                suffix: 'review2',
                count: 12,
                minutes: 14,
              ),
            );
          }
          tasks.add(
            StudyTask(
              id: '${idPrefix}_mistakes',
              title: 'Yanlış Defteri & ÖSYM Tuzakları İncelemesi',
              lessonTag: 'Genel',
              estimatedMinutes: 12,
              actionType: StudyTaskActionType.mistakes,
              targetCount: 10,
              examScope: effectiveScope,
            ),
          );
        }
        break;
    }

    if (isSprintMode && safeDay.isEven) {
      if (!tasks.any((t) => t.actionType == StudyTaskActionType.exam)) {
        final examCount = curriculum?.totalQuestions ?? 60;
        final examTitle = (effectiveScope == 'lisans_gk' || curriculum == null)
            ? '60 Soruluk Genel Kültür Sprint Denemesi'
            : '$examCount Soruluk ${curriculum.title} Sprint Denemesi';
        tasks.add(
          StudyTask(
            id: '${idPrefix}_sprint_exam',
            title: examTitle,
            lessonTag: 'Genel',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.exam,
            targetExamNumber: 1,
            targetCount: examCount,
            examScope: effectiveScope,
          ),
        );
      }
      if (!tasks.any((t) => t.actionType == StudyTaskActionType.mistakes)) {
        tasks.add(
          StudyTask(
            id: '${idPrefix}_sprint_mistakes',
            title: 'Sprint: Yanlış Defteri & ÖSYM Çeldirici Tekrarı',
            lessonTag: 'Genel',
            estimatedMinutes: 10,
            actionType: StudyTaskActionType.mistakes,
            targetCount: 10,
            examScope: effectiveScope,
          ),
        );
      }
    }

    return tasks;
  }

  /// Seçili sınava 30 gün veya daha az kaldığında Sprint Modu önerilip önerilmeyeceğini döner (`TASK-159`).
  static bool isWithinSprintWindow(ExamSelection selection, {DateTime? now}) {
    final remainingDays = selection.detailedRemaining(now: now).totalDays;
    return remainingDays >= 0 && remainingDays <= 30;
  }

  /// Kaçırılan/biriken görevleri bugünün kapasitesini aşmayacak şekilde gelecek günlere
  /// dengeli dağıtan telafi planlayıcısı (`TASK-159`).
  static CatchUpRebalancePlan rebalanceMissedTasks({
    required List<StudyTask> currentDayTasks,
    required int currentDay,
    required StudyProgramPace pace,
    required KpssExamTarget examTarget,
    String? focusLesson,
    ExamCurriculum? curriculum,
    String examScope = 'lisans_gk',
    bool isSprintMode = false,
  }) {
    final completed = currentDayTasks.where((t) => t.isCompleted).toList();
    final pending = currentDayTasks.where((t) => !t.isCompleted).toList();
    final maxPerDay = _maxTasksPerDayForPace(pace);

    final todaySlots = (maxPerDay - completed.length).clamp(0, pending.length);
    final todayTasks = <StudyTask>[...completed, ...pending.take(todaySlots)];

    final overflow = pending.skip(todaySlots).toList();
    final futureDayTasks = <int, List<StudyTask>>{};
    var dayCursor = (currentDay < 1 ? 1 : currentDay) + 1;

    for (final task in overflow) {
      while (true) {
        final existing = futureDayTasks.putIfAbsent(dayCursor, () {
          final generated = generateDailyTasks(
            examTarget: examTarget,
            pace: pace,
            focusLesson: focusLesson,
            cycleDay: dayCursor,
            curriculum: curriculum,
            examScope: examScope,
            isSprintMode: isSprintMode,
          );
          // Gelecek güne taşınan görev için yer açmak adına temel listeyi sınırla
          return generated.take(maxPerDay - 1).toList();
        });
        if (existing.length < maxPerDay) {
          existing.add(task);
          break;
        }
        dayCursor++;
      }
    }

    return CatchUpRebalancePlan(
      todayTasks: todayTasks,
      futureDayTasks: futureDayTasks,
      carriedCount: pending.length,
    );
  }

  static int _maxTasksPerDayForPace(StudyProgramPace pace) {
    switch (pace) {
      case StudyProgramPace.dk15:
        return 3;
      case StudyProgramPace.dk30:
        return 4;
      case StudyProgramPace.dk45:
        return 4;
      case StudyProgramPace.dk60:
        return 5;
      case StudyProgramPace.dk90:
        return 6;
    }
  }

  /// Haftalık 7 günlük (`Pzt–Paz`) çalışma ve dinlenme önizlemesini üretir (`TASK-159`).
  static List<WeeklyPlanDayPreview> buildWeeklyPreview({
    required ExamSelection selection,
    required StudyProgramPace pace,
    List<int> weeklyStudyDays = const [1, 2, 3, 4, 5, 6],
    String? focusLesson,
    ExamCurriculum? curriculum,
    int startCycleDay = 1,
    bool isSprintMode = false,
  }) {
    const dayLabels = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
    final activeSet = weeklyStudyDays.toSet();
    final result = <WeeklyPlanDayPreview>[];
    var cycleCursor = startCycleDay < 1 ? 1 : startCycleDay;

    for (var weekday = 1; weekday <= 7; weekday++) {
      final shortLabel = dayLabels[weekday - 1];
      if (!activeSet.contains(weekday)) {
        result.add(
          WeeklyPlanDayPreview(
            weekday: weekday,
            shortLabel: shortLabel,
            isRestDay: true,
            estimatedMinutes: 0,
            taskCount: 0,
            primaryKind: WeeklyActivityKind.rest,
            focusSummary: '$shortLabel · Dinlenme & Mola Günü',
          ),
        );
        continue;
      }

      final dayTasks = generateDailyTasks(
        examTarget: selection.toLegacyTarget(),
        pace: pace,
        focusLesson: focusLesson,
        cycleDay: cycleCursor,
        curriculum: curriculum,
        examScope: selection.scopeKey,
        isSprintMode: isSprintMode,
      );
      cycleCursor++;

      final totalMinutes = dayTasks.fold<int>(
        0,
        (sum, t) => sum + t.estimatedMinutes,
      );
      final hasExam = dayTasks.any(
        (t) => t.actionType == StudyTaskActionType.exam,
      );
      final hasQuiz = dayTasks.any(
        (t) => t.actionType == StudyTaskActionType.quiz,
      );
      final primaryKind = hasExam
          ? WeeklyActivityKind.sprintExam
          : (hasQuiz ? WeeklyActivityKind.quiz : WeeklyActivityKind.review);
      final focusSummary = dayTasks.isNotEmpty
          ? dayTasks.first.title
          : '$shortLabel · Çalışma Günü';

      result.add(
        WeeklyPlanDayPreview(
          weekday: weekday,
          shortLabel: shortLabel,
          isRestDay: false,
          estimatedMinutes: totalMinutes,
          taskCount: dayTasks.length,
          primaryKind: primaryKind,
          focusSummary: focusSummary,
        ),
      );
    }

    return result;
  }

  static int _testsCountForDay(StudyProgramPace pace, int cycleDay) {
    switch (pace) {
      case StudyProgramPace.dk15:
        return 1;
      case StudyProgramPace.dk30:
        return cycleDay % 3 == 0 ? 2 : 1;
      case StudyProgramPace.dk45:
        return 2;
      case StudyProgramPace.dk60:
        return cycleDay.isOdd ? 3 : 2;
      case StudyProgramPace.dk90:
        return cycleDay % 4 == 0 ? 2 : 3;
    }
  }

  static int _cumulativeTestsBeforeDay(StudyProgramPace pace, int cycleDay) {
    var total = 0;
    for (var d = 1; d < cycleDay; d++) {
      total += _testsCountForDay(pace, d);
    }
    return total;
  }

  /// Belirli bir tempo ve gün sırasına kadar tamamlanan kümülatif konu testi adedini döner.
  static int cumulativeTestsBeforeDay(StudyProgramPace pace, int cycleDay) {
    return _cumulativeTestsBeforeDay(pace, cycleDay);
  }

  /// Belirli bir tempo ve gün numarasına göre o gün çözülecek konu testi sayısını döner.
  static int testsCountForDay(StudyProgramPace pace, int cycleDay) =>
      _testsCountForDay(pace, cycleDay);

  /// Verilen tamamlanmış test ofsetine (ör. 7 test çözülmüş) yeni tempoda karşılık gelen
  /// gün numarasını (1-tabanlı) hesaplar.
  static int findCycleDayForCurriculumOffset({
    required StudyProgramPace pace,
    required int offset,
  }) {
    if (offset <= 0) return 1;
    var accumulated = 0;
    var day = 1;
    while (true) {
      final testsToday = _testsCountForDay(pace, day);
      if (accumulated + testsToday > offset) {
        return day;
      }
      accumulated += testsToday;
      day++;
      if (day > 1000) return day;
    }
  }

  /// Verilen tempo değişikliğinde (ör. 30 dk -> 60 dk) kullanıcının mevcut gününü
  /// çözülen test adedine göre yeni tempodaki eşdeğer güne dönüştürür.
  static int adaptCycleDayToNewPace({
    required StudyProgramPace oldPace,
    required StudyProgramPace newPace,
    required int currentCycleDay,
  }) {
    if (oldPace == newPace) return currentCycleDay;
    final completedTests = _cumulativeTestsBeforeDay(oldPace, currentCycleDay);
    return findCycleDayForCurriculumOffset(
      pace: newPace,
      offset: completedTests,
    );
  }

  static StudyTask _flashcardTask({
    required String id,
    required String lesson,
    required int count,
    required int day,
    required int minutes,
    String examScope = 'lisans_gk',
  }) {
    final startIdx = ((day - 1) * count) % 50;
    return StudyTask(
      id: id,
      title: '$lesson: $count Hap Bilgi Kartı Tekrarı',
      lessonTag: lesson,
      estimatedMinutes: minutes,
      actionType: StudyTaskActionType.flashcards,
      targetCount: count,
      startIndex: startIdx,
      examScope: examScope,
    );
  }

  static StudyTask _mapTask({
    required String id,
    required int count,
    required int day,
    required int minutes,
    String examScope = 'lisans_gk',
  }) {
    final startIdx = ((day - 1) * count) % 52;
    return StudyTask(
      id: id,
      title: 'Türkiye Harita Pratiği · $count Soru',
      lessonTag: 'Coğrafya',
      estimatedMinutes: minutes,
      actionType: StudyTaskActionType.map,
      targetCount: count,
      startIndex: startIdx,
      examScope: examScope,
    );
  }
}
