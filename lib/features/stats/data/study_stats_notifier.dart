import 'dart:async';
import 'dart:math' as math;

import 'package:kadro/core/services/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';

/// Belirli bir sınav kapsamı (`examScope`) veya tüm çalışmalar için filtrelenmiş
/// istatistik özeti görünümü.
///
/// Angular/Web Karşılığı: Redux/Signal Selector çıktısı (`selectStatsSummaryForScope`).
class ScopedStatsSummary {
  final String? examScope;
  final int totalSolved;
  final int totalCorrect;
  final int totalWrong;
  final Map<String, int> wrongByLesson;
  final Map<String, int> solvedByLesson;
  final Map<String, int> correctByLesson;
  final List<QuizSessionRecord> sessions;

  const ScopedStatsSummary({
    required this.examScope,
    required this.totalSolved,
    required this.totalCorrect,
    required this.totalWrong,
    required this.wrongByLesson,
    required this.solvedByLesson,
    required this.correctByLesson,
    required this.sessions,
  });

  int get accuracyPercent =>
      totalSolved == 0 ? 0 : ((totalCorrect / totalSolved) * 100).round();

  String get weakestLesson {
    if (wrongByLesson.isEmpty) return 'Henüz veri yok';

    String? maxLesson;
    int maxWrong = 0;

    for (final entry in wrongByLesson.entries) {
      if (entry.value > maxWrong) {
        maxWrong = entry.value;
        maxLesson = entry.key;
      }
    }

    return (maxLesson != null && maxWrong > 0) ? maxLesson : 'Henüz veri yok';
  }

  int lessonAccuracyPercent(String lesson) {
    final solved = solvedByLesson[lesson] ?? 0;
    if (solved == 0) return 0;
    final correct = correctByLesson[lesson] ?? 0;
    return ((correct / solved) * 100).round();
  }

  String lessonMasteryLabel(String lesson) {
    final solved = solvedByLesson[lesson] ?? 0;
    if (solved == 0) return 'Başlanmadı';
    final acc = lessonAccuracyPercent(lesson);
    if (acc >= 80) return 'Usta (%$acc)';
    if (acc >= 50) return 'Gelişiyor (%$acc)';
    return 'Kritik (%$acc)';
  }
}

/// Kullanıcının soru çözme istatistiklerini, XP/Lig düzeyini ve günlük hedefini tutan durum (state) modeli.
///
/// Angular'daki `interface StudyStatsState` veya NgRx/Signal state nesnesinin karşılığıdır.
class StudyStatsState {
  final int totalSolved;
  final int totalCorrect;
  final int totalWrong;
  final int dailyGoal;
  final int dailySolvedCount;
  final DateTime? lastStudyDate;
  final Map<String, int> wrongByLesson;
  final Map<String, int> solvedByLesson;
  final Map<String, int> correctByLesson;
  final Map<String, Map<String, int>> solvedByScopeLesson;
  final Map<String, Map<String, int>> correctByScopeLesson;
  final Map<String, Map<String, int>> wrongByScopeLesson;
  final int totalXp;
  final int streakDays;
  final int totalTimeSeconds;
  final List<QuizSessionRecord> sessionHistory;

  const StudyStatsState({
    this.totalSolved = 0,
    this.totalCorrect = 0,
    this.totalWrong = 0,
    this.dailyGoal = 30,
    this.dailySolvedCount = 0,
    this.lastStudyDate,
    this.wrongByLesson = const {},
    this.solvedByLesson = const {},
    this.correctByLesson = const {},
    this.solvedByScopeLesson = const {},
    this.correctByScopeLesson = const {},
    this.wrongByScopeLesson = const {},
    this.totalXp = 0,
    this.streakDays = 1,
    this.totalTimeSeconds = 0,
    this.sessionHistory = const [],
  });

  /// İki tarihin aynı takvim gününe (yıl-ay-gün) ait olup olmadığını kontrol eder.
  static bool isSameDay(DateTime? a, DateTime b) {
    if (a == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Verilen tarih için `YYYY-MM-DD` anahtarı üretir.
  static String dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  /// Bugün çözülen geçerli soru sayısını döner; önceki günden kaldıysa `0` kabul eder.
  int effectiveDailySolvedCount([DateTime? now]) {
    final targetNow = now ?? DateTime.now();
    return isSameDay(lastStudyDate, targetNow) ? dailySolvedCount : 0;
  }

  /// Başarı / doğru oranı yüzdesi (0 - 100).
  int get accuracyPercent =>
      totalSolved == 0 ? 0 : ((totalCorrect / totalSolved) * 100).round();

  /// En çok yanlış yapılan dersin adı. Yanlış yoksa 'Henüz veri yok' döner.
  String get weakestLesson {
    if (wrongByLesson.isEmpty) return 'Henüz veri yok';

    String? maxLesson;
    int maxWrong = 0;

    for (final entry in wrongByLesson.entries) {
      if (entry.value > maxWrong) {
        maxWrong = entry.value;
        maxLesson = entry.key;
      }
    }

    return (maxLesson != null && maxWrong > 0) ? maxLesson : 'Henüz veri yok';
  }

  /// Belirli bir ders için başarı yüzdesi (0 - 100).
  int lessonAccuracyPercent(String lesson) {
    final solved = solvedByLesson[lesson] ?? 0;
    if (solved == 0) return 0;
    final correct = correctByLesson[lesson] ?? 0;
    return ((correct / solved) * 100).round();
  }

  /// Toplam XP puanına göre hesaplanan Lig kademesi.
  String get leagueTier {
    if (totalXp >= 1000) return 'Müsteşar Ligi';
    if (totalXp >= 500) return 'Altın Kadro';
    if (totalXp >= 200) return 'Gümüş Kadro';
    return 'Bronz Kadro';
  }

  /// Soru başına harcanan ortalama süre (saniye).
  int get averageSecondsPerQuestion =>
      totalSolved == 0 ? 0 : (totalTimeSeconds / totalSolved).round();

  /// Ders ustalık seviyesi etiketi.
  String lessonMasteryLabel(String lesson) {
    final solved = solvedByLesson[lesson] ?? 0;
    if (solved == 0) return 'Başlanmadı';
    final acc = lessonAccuracyPercent(lesson);
    if (acc >= 80) return 'Usta (%$acc)';
    if (acc >= 50) return 'Gelişiyor (%$acc)';
    return 'Kritik (%$acc)';
  }

  /// Belirli bir sınav kapsamına (`examScope`) ait tamamlanmış oturumları döner.
  List<QuizSessionRecord> sessionsForScope(String? examScope) {
    if (examScope == null || examScope.trim().isEmpty) {
      return sessionHistory;
    }
    return sessionHistory
        .where((s) => s.examScope == examScope)
        .toList(growable: false);
  }

  /// Belirli bir sınav kapsamı (veya `null` ise tüm çalışmalar) için birleştirilmiş
  /// doğruluk, zayıf ders ve ders ustalık özetini üretir (`TASK-132`).
  ScopedStatsSummary statsSummaryForScope(String? examScope) {
    if (examScope == null || examScope.trim().isEmpty) {
      return ScopedStatsSummary(
        examScope: null,
        totalSolved: totalSolved,
        totalCorrect: totalCorrect,
        totalWrong: totalWrong,
        wrongByLesson: wrongByLesson,
        solvedByLesson: solvedByLesson,
        correctByLesson: correctByLesson,
        sessions: sessionHistory,
      );
    }

    final scopedSessions = sessionsForScope(examScope);
    final scopedSolved = solvedByScopeLesson[examScope];
    final scopedCorrect = correctByScopeLesson[examScope] ?? const {};
    final scopedWrong = wrongByScopeLesson[examScope] ?? const {};

    if (scopedSolved != null && scopedSolved.isNotEmpty) {
      final sumSolved = scopedSolved.values.fold<int>(0, (a, b) => a + b);
      final sumCorrect = scopedCorrect.values.fold<int>(0, (a, b) => a + b);
      final sumWrong = scopedWrong.values.fold<int>(0, (a, b) => a + b);
      return ScopedStatsSummary(
        examScope: examScope,
        totalSolved: sumSolved,
        totalCorrect: sumCorrect,
        totalWrong: sumWrong,
        wrongByLesson: scopedWrong,
        solvedByLesson: scopedSolved,
        correctByLesson: scopedCorrect,
        sessions: scopedSessions,
      );
    }

    if (scopedSessions.isNotEmpty) {
      final aggSolved = <String, int>{};
      final aggCorrect = <String, int>{};
      final aggWrong = <String, int>{};
      var sumSolved = 0;
      var sumCorrect = 0;
      var sumWrong = 0;

      for (final s in scopedSessions) {
        final sessionSolved = s.correctCount + s.wrongCount;
        if (s.lesson.trim().isNotEmpty && sessionSolved > 0) {
          aggSolved[s.lesson] = (aggSolved[s.lesson] ?? 0) + sessionSolved;
          aggCorrect[s.lesson] = (aggCorrect[s.lesson] ?? 0) + s.correctCount;
          aggWrong[s.lesson] = (aggWrong[s.lesson] ?? 0) + s.wrongCount;
        }
        sumSolved += sessionSolved;
        sumCorrect += s.correctCount;
        sumWrong += s.wrongCount;
      }

      return ScopedStatsSummary(
        examScope: examScope,
        totalSolved: sumSolved,
        totalCorrect: sumCorrect,
        totalWrong: sumWrong,
        wrongByLesson: aggWrong,
        solvedByLesson: aggSolved,
        correctByLesson: aggCorrect,
        sessions: scopedSessions,
      );
    }

    // Geriye dönük uyumluluk: Sadece scope map'i boş olup eski GK verisi olan hesaplar
    if (examScope == 'lisans_gk' &&
        solvedByScopeLesson.isEmpty &&
        sessionHistory.isEmpty) {
      return ScopedStatsSummary(
        examScope: examScope,
        totalSolved: totalSolved,
        totalCorrect: totalCorrect,
        totalWrong: totalWrong,
        wrongByLesson: wrongByLesson,
        solvedByLesson: solvedByLesson,
        correctByLesson: correctByLesson,
        sessions: scopedSessions,
      );
    }

    return ScopedStatsSummary(
      examScope: examScope,
      totalSolved: 0,
      totalCorrect: 0,
      totalWrong: 0,
      wrongByLesson: const {},
      solvedByLesson: const {},
      correctByLesson: const {},
      sessions: const [],
    );
  }

  /// Seçili kapsama göre en zayıf dersi döner.
  String weakestLessonForScope(String? examScope) =>
      statsSummaryForScope(examScope).weakestLesson;

  /// Belirli bir derse, konuya ve test numarasına ait en son oturum kaydını döner.
  QuizSessionRecord? findLatestSessionForTest({
    required String lesson,
    required String topic,
    required int testNumber,
    String? examScope,
  }) {
    final prefix = '$lesson · $topic · Test $testNumber';
    for (final s in sessionHistory) {
      if (examScope != null && s.examScope != examScope) {
        continue;
      }
      if (s.title.contains(prefix)) {
        return s;
      }
    }
    return null;
  }

  /// Belirli bir ders ve konuya ait kaç farklı testin çözüldüğünü hesaplar.
  int countSolvedTestsForTopic({
    required String lesson,
    required String topic,
  }) {
    final targetPattern = '$lesson · $topic · Test ';
    final regex = RegExp(r'Test (\d+)');
    final solvedNumbers = <int>{};

    for (final s in sessionHistory) {
      if (s.title.contains(targetPattern)) {
        final match = regex.firstMatch(s.title);
        if (match != null) {
          final number = int.tryParse(match.group(1)!);
          if (number != null) {
            solvedNumbers.add(number);
          }
        }
      }
    }

    return solvedNumbers.length;
  }

  /// Başlığı verilen önekle başlayan en son oturum kaydını döner (örn. deneme sınavları).
  QuizSessionRecord? findLatestSessionForTitle(String titlePrefix) {
    for (final s in sessionHistory) {
      if (s.title.startsWith(titlePrefix)) {
        return s;
      }
    }
    return null;
  }

  StudyStatsState copyWith({
    int? totalSolved,
    int? totalCorrect,
    int? totalWrong,
    int? dailyGoal,
    int? dailySolvedCount,
    DateTime? lastStudyDate,
    Map<String, int>? wrongByLesson,
    Map<String, int>? solvedByLesson,
    Map<String, int>? correctByLesson,
    Map<String, Map<String, int>>? solvedByScopeLesson,
    Map<String, Map<String, int>>? correctByScopeLesson,
    Map<String, Map<String, int>>? wrongByScopeLesson,
    int? totalXp,
    int? streakDays,
    int? totalTimeSeconds,
    List<QuizSessionRecord>? sessionHistory,
  }) {
    return StudyStatsState(
      totalSolved: totalSolved ?? this.totalSolved,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalWrong: totalWrong ?? this.totalWrong,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      dailySolvedCount: dailySolvedCount ?? this.dailySolvedCount,
      lastStudyDate: lastStudyDate ?? this.lastStudyDate,
      wrongByLesson: wrongByLesson ?? this.wrongByLesson,
      solvedByLesson: solvedByLesson ?? this.solvedByLesson,
      correctByLesson: correctByLesson ?? this.correctByLesson,
      solvedByScopeLesson: solvedByScopeLesson ?? this.solvedByScopeLesson,
      correctByScopeLesson: correctByScopeLesson ?? this.correctByScopeLesson,
      wrongByScopeLesson: wrongByScopeLesson ?? this.wrongByScopeLesson,
      totalXp: totalXp ?? this.totalXp,
      streakDays: streakDays ?? this.streakDays,
      totalTimeSeconds: totalTimeSeconds ?? this.totalTimeSeconds,
      sessionHistory: sessionHistory ?? this.sessionHistory,
    );
  }

  static Map<String, Map<String, int>> _parseNestedLessonMap(dynamic raw) {
    if (raw is! Map) return const {};
    final out = <String, Map<String, int>>{};
    for (final entry in raw.entries) {
      if (entry.value is Map) {
        out[entry.key.toString()] = (entry.value as Map).map(
          (k, v) => MapEntry(k.toString(), (v as num).toInt()),
        );
      }
    }
    return out;
  }

  /// JSON formatına dönüştürür (LocalStorageService için).
  Map<String, dynamic> toJson() {
    return {
      'totalSolved': totalSolved,
      'totalCorrect': totalCorrect,
      'totalWrong': totalWrong,
      'dailyGoal': dailyGoal,
      'dailySolvedCount': dailySolvedCount,
      'lastStudyDate': lastStudyDate?.toIso8601String(),
      'wrongByLesson': wrongByLesson,
      'solvedByLesson': solvedByLesson,
      'correctByLesson': correctByLesson,
      if (solvedByScopeLesson.isNotEmpty)
        'solvedByScopeLesson': solvedByScopeLesson,
      if (correctByScopeLesson.isNotEmpty)
        'correctByScopeLesson': correctByScopeLesson,
      if (wrongByScopeLesson.isNotEmpty)
        'wrongByScopeLesson': wrongByScopeLesson,
      'totalXp': totalXp,
      'streakDays': streakDays,
      'totalTimeSeconds': totalTimeSeconds,
      'sessionHistory': sessionHistory.map((s) => s.toMap()).toList(),
    };
  }

  /// JSON formatından StudyStatsState nesnesi üretir.
  factory StudyStatsState.fromJson(Map<String, dynamic> json) {
    final sessionList =
        (json['sessionHistory'] as List?)
            ?.map((s) => QuizSessionRecord.fromMap(s as Map<String, dynamic>))
            .toList() ??
        const [];

    final wrongMap =
        (json['wrongByLesson'] as Map?)?.map(
          (k, v) => MapEntry(k.toString(), (v as num).toInt()),
        ) ??
        const {};

    final solvedMap =
        (json['solvedByLesson'] as Map?)?.map(
          (k, v) => MapEntry(k.toString(), (v as num).toInt()),
        ) ??
        const {};

    final correctMap =
        (json['correctByLesson'] as Map?)?.map(
          (k, v) => MapEntry(k.toString(), (v as num).toInt()),
        ) ??
        const {};

    return StudyStatsState(
      totalSolved: (json['totalSolved'] as num?)?.toInt() ?? 0,
      totalCorrect: (json['totalCorrect'] as num?)?.toInt() ?? 0,
      totalWrong: (json['totalWrong'] as num?)?.toInt() ?? 0,
      dailyGoal: (json['dailyGoal'] as num?)?.toInt() ?? 30,
      dailySolvedCount: (json['dailySolvedCount'] as num?)?.toInt() ?? 0,
      lastStudyDate: json['lastStudyDate'] != null
          ? DateTime.tryParse(json['lastStudyDate'].toString())
          : null,
      wrongByLesson: wrongMap,
      solvedByLesson: solvedMap,
      correctByLesson: correctMap,
      solvedByScopeLesson: _parseNestedLessonMap(json['solvedByScopeLesson']),
      correctByScopeLesson: _parseNestedLessonMap(json['correctByScopeLesson']),
      wrongByScopeLesson: _parseNestedLessonMap(json['wrongByScopeLesson']),
      totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 1,
      totalTimeSeconds: (json['totalTimeSeconds'] as num?)?.toInt() ?? 0,
      sessionHistory: sessionList,
    );
  }
}

/// Soru istatistiklerini, oturum arşivini ve XP/Lig durumunu yöneten Riverpod Notifier'ı.
class StudyStatsNotifier extends Notifier<StudyStatsState> {
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();
  final LocalStorageService _storage = LocalStorageService();
  String? _accountKey;

  /// Oturum açmış kullanıcının hesap anahtarını belirler.
  void setAccountKey(String? key) {
    _accountKey = key?.trim().toLowerCase();
  }

  @override
  StudyStatsState build() {
    unawaited(_loadFromStorage());
    return const StudyStatsState();
  }

  Future<void> _loadFromStorage() async {
    final saved = await _storage.loadStudyStats();
    final deviceQuota = await _storage.loadDeviceDailyQuota();
    if (!ref.mounted) return;
    final now = DateTime.now();
    final todayKey = StudyStatsState.dateKey(now);

    var deviceTodaySolved = 0;
    if (deviceQuota != null && deviceQuota['date'] == todayKey) {
      deviceTodaySolved = (deviceQuota['solved'] as num?)?.toInt() ?? 0;
    }

    if (saved != null) {
      final savedToday = saved.effectiveDailySolvedCount(now);
      final mergedToday = math.max(savedToday, deviceTodaySolved);
      final effectiveDate = mergedToday > 0
          ? (StudyStatsState.isSameDay(saved.lastStudyDate, now)
                ? saved.lastStudyDate
                : now)
          : saved.lastStudyDate;
      state = saved.copyWith(
        dailySolvedCount: mergedToday,
        lastStudyDate: effectiveDate,
      );
    } else if (deviceTodaySolved > 0) {
      state = state.copyWith(
        dailySolvedCount: deviceTodaySolved,
        lastStudyDate: now,
      );
    }
  }

  /// Her soru onaylandığında istatistikleri ve XP/süre puanını günceller.
  void recordAnswer({
    required String lesson,
    required bool isCorrect,
    int timeSpentSeconds = 20,
    String? topic,
    String? questionText,
    String examScope = 'lisans_gk',
  }) {
    final newWrongByLesson = Map<String, int>.from(state.wrongByLesson);
    if (!isCorrect) {
      newWrongByLesson[lesson] = (newWrongByLesson[lesson] ?? 0) + 1;
    }

    final newSolvedByLesson = Map<String, int>.from(state.solvedByLesson);
    newSolvedByLesson[lesson] = (newSolvedByLesson[lesson] ?? 0) + 1;

    final newCorrectByLesson = Map<String, int>.from(state.correctByLesson);
    if (isCorrect) {
      newCorrectByLesson[lesson] = (newCorrectByLesson[lesson] ?? 0) + 1;
    }

    final newSolvedByScope = <String, Map<String, int>>{
      for (final e in state.solvedByScopeLesson.entries)
        e.key: Map<String, int>.from(e.value),
    };
    final scopeSolved = newSolvedByScope.putIfAbsent(examScope, () => {});
    scopeSolved[lesson] = (scopeSolved[lesson] ?? 0) + 1;

    final newCorrectByScope = <String, Map<String, int>>{
      for (final e in state.correctByScopeLesson.entries)
        e.key: Map<String, int>.from(e.value),
    };
    if (isCorrect) {
      final scopeCorrect = newCorrectByScope.putIfAbsent(examScope, () => {});
      scopeCorrect[lesson] = (scopeCorrect[lesson] ?? 0) + 1;
    }

    final newWrongByScope = <String, Map<String, int>>{
      for (final e in state.wrongByScopeLesson.entries)
        e.key: Map<String, int>.from(e.value),
    };
    if (!isCorrect) {
      final scopeWrong = newWrongByScope.putIfAbsent(examScope, () => {});
      scopeWrong[lesson] = (scopeWrong[lesson] ?? 0) + 1;
    }

    final earnedXp = isCorrect ? 15 : 5;

    // Gün dönümü & seri (streak) hesaplaması
    final now = DateTime.now();
    int newDailySolved;
    int newStreak = state.streakDays;

    if (state.lastStudyDate == null) {
      newDailySolved = 1;
      newStreak = state.streakDays <= 0 ? 1 : state.streakDays;
    } else {
      final last = state.lastStudyDate!;
      final isSameDay =
          last.year == now.year &&
          last.month == now.month &&
          last.day == now.day;
      if (isSameDay) {
        newDailySolved = state.dailySolvedCount + 1;
      } else {
        newDailySolved = 1;
        final todayMidnight = DateTime(now.year, now.month, now.day);
        final lastMidnight = DateTime(last.year, last.month, last.day);
        final diffDays = todayMidnight.difference(lastMidnight).inDays;
        if (diffDays == 1) {
          newStreak = state.streakDays + 1;
        } else {
          newStreak = 1;
        }
      }
    }

    state = state.copyWith(
      totalSolved: state.totalSolved + 1,
      dailySolvedCount: newDailySolved,
      lastStudyDate: now,
      streakDays: newStreak,
      totalCorrect: isCorrect ? state.totalCorrect + 1 : state.totalCorrect,
      totalWrong: !isCorrect ? state.totalWrong + 1 : state.totalWrong,
      wrongByLesson: newWrongByLesson,
      solvedByLesson: newSolvedByLesson,
      correctByLesson: newCorrectByLesson,
      solvedByScopeLesson: newSolvedByScope,
      correctByScopeLesson: newCorrectByScope,
      wrongByScopeLesson: newWrongByScope,
      totalXp: state.totalXp + earnedXp,
      totalTimeSeconds: state.totalTimeSeconds + timeSpentSeconds,
    );

    // Yerel depolama (misafir ve hesap bazlı kalıcılık + cihaz kotası)
    final todayKey = StudyStatsState.dateKey(now);
    unawaited(_storage.saveStudyStats(state));
    unawaited(
      _storage.saveDeviceDailyQuota(
        dateKey: todayKey,
        solvedCount: newDailySolved,
        freeLimit: 30,
      ),
    );
    if (_accountKey != null) {
      unawaited(_storage.saveAccountStudyStats(_accountKey!, state));
    }

    // Supabase arka plan senkronizasyonu
    final effectiveTopic = (topic == null || topic.isEmpty) ? 'Genel' : topic;
    _cloudSync.saveQuestionAttempt(
      questionText: questionText ?? '$lesson Sorusu',
      lesson: lesson,
      topic: effectiveTopic,
      isCorrect: isCorrect,
      timeSpentSeconds: timeSpentSeconds,
      examScope: examScope,
    );
    final shouldForceDailySync =
        newDailySolved == 1 || newDailySolved % 5 == 0 || newDailySolved >= 30;
    _cloudSync.syncProfileStats(
      totalXp: state.totalXp,
      leagueTier: state.leagueTier,
      dailyGoalQuestions: state.dailyGoal,
      currentStreakDays: state.streakDays,
      dailySolvedCount: newDailySolved,
      force: shouldForceDailySync,
    );
    _cloudSync.upsertTopicMastery(
      lesson: lesson,
      topic: effectiveTopic,
      totalSolved: scopeSolved[lesson] ?? newSolvedByLesson[lesson] ?? 1,
      totalCorrect:
          newCorrectByScope[examScope]?[lesson] ??
          newCorrectByLesson[lesson] ??
          (isCorrect ? 1 : 0),
      totalTimeSeconds: state.totalTimeSeconds,
      examScope: examScope,
    );
  }

  /// Tamamlanan bir test oturumunu arşive kaydeder ve XP kazancını ekler.
  void recordQuizSession(QuizSessionRecord session) {
    state = state.copyWith(
      totalXp: state.totalXp + session.earnedXp,
      sessionHistory: [session, ...state.sessionHistory],
    );

    final now = DateTime.now();
    final todaySolved = state.effectiveDailySolvedCount(now);
    unawaited(_storage.saveStudyStats(state));
    unawaited(
      _storage.saveDeviceDailyQuota(
        dateKey: StudyStatsState.dateKey(now),
        solvedCount: todaySolved,
        freeLimit: 30,
      ),
    );
    if (_accountKey != null) {
      unawaited(_storage.saveAccountStudyStats(_accountKey!, state));
    }

    // Supabase oturum ve profil senkronizasyonu
    _cloudSync.saveQuizSession(session);
    _cloudSync.syncProfileStats(
      totalXp: state.totalXp,
      leagueTier: state.leagueTier,
      dailyGoalQuestions: state.dailyGoal,
      currentStreakDays: state.streakDays,
      dailySolvedCount: todaySolved,
      force: true,
    );
  }

  /// Kullanıcının profilinden belirlediği günlük hedefi günceller.
  void updateDailyGoal(int newGoal) {
    state = state.copyWith(dailyGoal: newGoal);
    _cloudSync.syncProfileStats(
      totalXp: state.totalXp,
      leagueTier: state.leagueTier,
      dailyGoalQuestions: newGoal,
      currentStreakDays: state.streakDays,
    );
  }

  /// Supabase bulut veritabanından kullanıcının profil, XP, seri, oturum ve günlük kotasını yükler.
  ///
  /// Çoklu Cihaz Akıllı Birleştirme (Smart Merge) & High-Water Mark:
  /// Günlük çözülen soru sayısı; yerel, hesap yedeği, cihaz kotası, bulut profili ve
  /// bugün tamamlanan oturumların maksimumuna göre geri yüklenir.
  Future<void> loadFromCloud({
    String? accountKey,
    Map<String, dynamic>? cloudProfileOverride,
    List<QuizSessionRecord>? cloudSessionsOverride,
  }) async {
    if (accountKey != null && accountKey.trim().isNotEmpty) {
      _accountKey = accountKey.trim().toLowerCase();
    }

    final now = DateTime.now();
    final todayKey = StudyStatsState.dateKey(now);

    StudyStatsState? accountStats;
    if (_accountKey != null) {
      accountStats = await _storage.loadAccountStudyStats(_accountKey!);
      if (!ref.mounted) return;
    }
    final deviceQuota = await _storage.loadDeviceDailyQuota();
    if (!ref.mounted) return;

    // 1. Profil tablosundan XP, seri, lig seviyesi, günlük hedef ve günlük kotayı çek
    final profile = cloudProfileOverride ?? await _cloudSync.fetchUserProfile();
    if (!ref.mounted) return;
    int mergedXp = math.max(state.totalXp, accountStats?.totalXp ?? 0);
    int mergedStreak = math.max(
      state.streakDays,
      accountStats?.streakDays ?? 1,
    );
    int mergedDailyGoal = state.dailyGoal;
    DateTime? mergedLastStudyDate = state.lastStudyDate;
    if (accountStats?.lastStudyDate != null &&
        (mergedLastStudyDate == null ||
            accountStats!.lastStudyDate!.isAfter(mergedLastStudyDate))) {
      mergedLastStudyDate = accountStats!.lastStudyDate;
    }

    var cloudProfileToday = 0;
    if (profile != null) {
      final cloudXp = (profile['total_xp'] as num?)?.toInt() ?? 0;
      if (cloudXp > mergedXp) {
        mergedXp = cloudXp;
      }
      final cloudStreak =
          (profile['current_streak_days'] as num?)?.toInt() ?? 0;
      if (cloudStreak > mergedStreak) {
        mergedStreak = cloudStreak;
      }
      final cloudGoal = (profile['daily_goal_questions'] as num?)?.toInt() ?? 0;
      if (cloudGoal > 0) {
        mergedDailyGoal = cloudGoal;
      }
      final cloudLastDateStr = profile['last_study_date'] as String?;
      if (cloudLastDateStr != null) {
        if (cloudLastDateStr.length >= 10 &&
            cloudLastDateStr.substring(0, 10) == todayKey) {
          cloudProfileToday =
              (profile['daily_solved_count'] as num?)?.toInt() ?? 0;
        }
        try {
          final parsed = DateTime.parse(cloudLastDateStr);
          if (mergedLastStudyDate == null ||
              parsed.isAfter(mergedLastStudyDate)) {
            mergedLastStudyDate = parsed;
          }
        } catch (_) {}
      }
    }

    // 2. Geçmiş oturumları çek ve yerel/hesap oturumlarıyla birleştir
    final cloudSessions =
        cloudSessionsOverride ?? await _cloudSync.fetchSessionHistory();
    if (!ref.mounted) return;
    final sessionByKey = <String, QuizSessionRecord>{};
    for (final s in cloudSessions) {
      final key = s.id.isNotEmpty
          ? s.id
          : '${s.title}_${s.completedAt.toIso8601String()}';
      sessionByKey[key] = s;
    }
    for (final s in state.sessionHistory) {
      final key = s.id.isNotEmpty
          ? s.id
          : '${s.title}_${s.completedAt.toIso8601String()}';
      sessionByKey.putIfAbsent(key, () => s);
    }
    if (accountStats != null) {
      for (final s in accountStats.sessionHistory) {
        final key = s.id.isNotEmpty
            ? s.id
            : '${s.title}_${s.completedAt.toIso8601String()}';
        sessionByKey.putIfAbsent(key, () => s);
      }
    }
    final mergedSessions = sessionByKey.values.toList()
      ..sort((a, b) => b.completedAt.compareTo(a.completedAt));

    // 3. Konu ustalıklarını çekip ders bazlı çözülen/doğru sayılarını hesapla
    final topicMasteries = cloudProfileOverride != null
        ? const <Map<String, dynamic>>[]
        : await _cloudSync.fetchTopicMastery();
    if (!ref.mounted) return;
    final solvedMap = Map<String, int>.from(state.solvedByLesson);
    final correctMap = Map<String, int>.from(state.correctByLesson);
    final wrongMap = Map<String, int>.from(state.wrongByLesson);

    for (final item in topicMasteries) {
      final lesson = item['lesson'] as String? ?? '';
      final solved = (item['total_solved'] as num?)?.toInt() ?? 0;
      final correct = (item['total_correct'] as num?)?.toInt() ?? 0;
      if (lesson.isNotEmpty) {
        if (solved > (solvedMap[lesson] ?? 0)) {
          solvedMap[lesson] = solved;
        }
        if (correct > (correctMap[lesson] ?? 0)) {
          correctMap[lesson] = correct;
        }
        final wrong = (solved - correct).clamp(0, 99999);
        if (wrong > (wrongMap[lesson] ?? 0)) {
          wrongMap[lesson] = wrong;
        }
      }
    }

    int totalSolvedCount = math.max(
      state.totalSolved,
      accountStats?.totalSolved ?? 0,
    );
    int totalCorrectCount = math.max(
      state.totalCorrect,
      accountStats?.totalCorrect ?? 0,
    );
    int totalWrongCount = math.max(
      state.totalWrong,
      accountStats?.totalWrong ?? 0,
    );

    final calcSolved = solvedMap.values.fold<int>(0, (sum, val) => sum + val);
    final calcCorrect = correctMap.values.fold<int>(0, (sum, val) => sum + val);
    final calcWrong = wrongMap.values.fold<int>(0, (sum, val) => sum + val);

    if (calcSolved > totalSolvedCount) totalSolvedCount = calcSolved;
    if (calcCorrect > totalCorrectCount) totalCorrectCount = calcCorrect;
    if (calcWrong > totalWrongCount) totalWrongCount = calcWrong;

    // 4. Bugün çözülen soru sayısı için 5 kaynaktan High-Water Mark hesapla
    final localToday = state.effectiveDailySolvedCount(now);
    final accountToday = accountStats?.effectiveDailySolvedCount(now) ?? 0;
    final deviceToday = (deviceQuota != null && deviceQuota['date'] == todayKey)
        ? ((deviceQuota['solved'] as num?)?.toInt() ?? 0)
        : 0;
    final todaySessionsQuestions = mergedSessions
        .where((s) => StudyStatsState.isSameDay(s.completedAt.toLocal(), now))
        .fold<int>(0, (sum, s) => sum + s.totalQuestions);

    final mergedDailySolved = [
      localToday,
      accountToday,
      deviceToday,
      cloudProfileToday,
      todaySessionsQuestions,
    ].reduce(math.max);

    if (mergedDailySolved > 0 &&
        !StudyStatsState.isSameDay(mergedLastStudyDate, now)) {
      mergedLastStudyDate = now;
    }

    state = state.copyWith(
      totalXp: mergedXp,
      streakDays: mergedStreak,
      dailyGoal: mergedDailyGoal,
      dailySolvedCount: mergedDailySolved,
      lastStudyDate: mergedLastStudyDate,
      sessionHistory: mergedSessions,
      solvedByLesson: solvedMap,
      correctByLesson: correctMap,
      wrongByLesson: wrongMap,
      totalSolved: totalSolvedCount,
      totalCorrect: totalCorrectCount,
      totalWrong: totalWrongCount,
    );

    // Yerel belleğe, hesap yedeğine ve cihaz kotasına kaydet
    unawaited(_storage.saveStudyStats(state));
    unawaited(
      _storage.saveDeviceDailyQuota(
        dateKey: todayKey,
        solvedCount: mergedDailySolved,
        freeLimit: 30,
      ),
    );
    if (_accountKey != null) {
      unawaited(_storage.saveAccountStudyStats(_accountKey!, state));
    }
    if (mergedDailySolved > cloudProfileToday) {
      unawaited(
        _cloudSync.syncProfileStats(
          totalXp: state.totalXp,
          leagueTier: state.leagueTier,
          dailyGoalQuestions: state.dailyGoal,
          currentStreakDays: state.streakDays,
          dailySolvedCount: mergedDailySolved,
          force: true,
        ),
      );
    }
  }

  /// Oturum kapatıldığında veya misafir moduna geçildiğinde istatistikleri sıfırlar;
  /// ancak bugüne ait çözülen soru kotası suistimali önlemek için cihazda korunur.
  void reset() {
    _accountKey = null;
    final now = DateTime.now();
    final preservedTodaySolved = state.effectiveDailySolvedCount(now);
    state = StudyStatsState(
      dailySolvedCount: preservedTodaySolved,
      lastStudyDate: preservedTodaySolved > 0 ? now : null,
    );
    unawaited(_storage.saveStudyStats(state));
    unawaited(_mergeDeviceDailyQuotaOnReset());
  }

  Future<void> _mergeDeviceDailyQuotaOnReset() async {
    final now = DateTime.now();
    final todayKey = StudyStatsState.dateKey(now);
    final deviceQuota = await _storage.loadDeviceDailyQuota();
    if (!ref.mounted) return;
    if (deviceQuota != null && deviceQuota['date'] == todayKey) {
      final deviceSolved = (deviceQuota['solved'] as num?)?.toInt() ?? 0;
      if (deviceSolved > state.effectiveDailySolvedCount(now)) {
        state = state.copyWith(
          dailySolvedCount: deviceSolved,
          lastStudyDate: now,
        );
        unawaited(_storage.saveStudyStats(state));
      }
    }
  }
}

/// Uygulama genelinde çalışma istatistiklerini yayınlayan küresel Provider.
final studyStatsProvider =
    NotifierProvider<StudyStatsNotifier, StudyStatsState>(
      StudyStatsNotifier.new,
    );
