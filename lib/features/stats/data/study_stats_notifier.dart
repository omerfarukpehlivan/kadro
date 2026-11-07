import 'dart:async';

import 'package:kadro/core/services/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';

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
    this.totalXp = 0,
    this.streakDays = 1,
    this.totalTimeSeconds = 0,
    this.sessionHistory = const [],
  });

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

  /// Belirli bir derse, konuya ve test numarasına ait en son oturum kaydını döner.
  QuizSessionRecord? findLatestSessionForTest({
    required String lesson,
    required String topic,
    required int testNumber,
  }) {
    final prefix = '$lesson · $topic · Test $testNumber';
    for (final s in sessionHistory) {
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
      totalXp: totalXp ?? this.totalXp,
      streakDays: streakDays ?? this.streakDays,
      totalTimeSeconds: totalTimeSeconds ?? this.totalTimeSeconds,
      sessionHistory: sessionHistory ?? this.sessionHistory,
    );
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

  @override
  StudyStatsState build() {
    unawaited(_loadFromStorage());
    return const StudyStatsState();
  }

  Future<void> _loadFromStorage() async {
    final saved = await _storage.loadStudyStats();
    if (saved != null) {
      state = saved;
    }
  }

  /// Her soru onaylandığında istatistikleri ve XP/süre puanını günceller.
  void recordAnswer({
    required String lesson,
    required bool isCorrect,
    int timeSpentSeconds = 20,
    String? topic,
    String? questionText,
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
      totalXp: state.totalXp + earnedXp,
      totalTimeSeconds: state.totalTimeSeconds + timeSpentSeconds,
    );

    // Yerel depolama (misafir modu kalıcılığı)
    unawaited(_storage.saveStudyStats(state));

    // Supabase arka plan senkronizasyonu
    final effectiveTopic = (topic == null || topic.isEmpty) ? 'Genel' : topic;
    _cloudSync.saveQuestionAttempt(
      questionText: questionText ?? '$lesson Sorusu',
      lesson: lesson,
      topic: effectiveTopic,
      isCorrect: isCorrect,
      timeSpentSeconds: timeSpentSeconds,
    );
    _cloudSync.syncProfileStats(
      totalXp: state.totalXp,
      leagueTier: state.leagueTier,
      dailyGoalQuestions: state.dailyGoal,
    );
    _cloudSync.upsertTopicMastery(
      lesson: lesson,
      topic: effectiveTopic,
      totalSolved: newSolvedByLesson[lesson] ?? 1,
      totalCorrect: newCorrectByLesson[lesson] ?? (isCorrect ? 1 : 0),
      totalTimeSeconds: state.totalTimeSeconds,
    );
  }

  /// Tamamlanan bir test oturumunu arşive kaydeder ve XP kazancını ekler.
  void recordQuizSession(QuizSessionRecord session) {
    state = state.copyWith(
      totalXp: state.totalXp + session.earnedXp,
      sessionHistory: [session, ...state.sessionHistory],
    );

    unawaited(_storage.saveStudyStats(state));

    // Supabase oturum ve profil senkronizasyonu
    _cloudSync.saveQuizSession(session);
    _cloudSync.syncProfileStats(
      totalXp: state.totalXp,
      leagueTier: state.leagueTier,
      dailyGoalQuestions: state.dailyGoal,
    );
  }

  /// Kullanıcının profilinden belirlediği günlük hedefi günceller.
  void updateDailyGoal(int newGoal) {
    state = state.copyWith(dailyGoal: newGoal);
    _cloudSync.syncProfileStats(
      totalXp: state.totalXp,
      leagueTier: state.leagueTier,
      dailyGoalQuestions: newGoal,
    );
  }

  /// Supabase bulut veritabanından kullanıcının geçmiş oturumlarını yükler.
  Future<void> loadFromCloud() async {
    final cloudSessions = await _cloudSync.fetchSessionHistory();
    if (cloudSessions.isNotEmpty) {
      state = state.copyWith(sessionHistory: cloudSessions);
    }
  }
}

/// Uygulama genelinde çalışma istatistiklerini yayınlayan küresel Provider.
final studyStatsProvider =
    NotifierProvider<StudyStatsNotifier, StudyStatsState>(
      StudyStatsNotifier.new,
    );
