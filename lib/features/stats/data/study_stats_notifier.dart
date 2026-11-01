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

  StudyStatsState copyWith({
    int? totalSolved,
    int? totalCorrect,
    int? totalWrong,
    int? dailyGoal,
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
      wrongByLesson: wrongByLesson ?? this.wrongByLesson,
      solvedByLesson: solvedByLesson ?? this.solvedByLesson,
      correctByLesson: correctByLesson ?? this.correctByLesson,
      totalXp: totalXp ?? this.totalXp,
      streakDays: streakDays ?? this.streakDays,
      totalTimeSeconds: totalTimeSeconds ?? this.totalTimeSeconds,
      sessionHistory: sessionHistory ?? this.sessionHistory,
    );
  }
}

/// Soru istatistiklerini, oturum arşivini ve XP/Lig durumunu yöneten Riverpod Notifier'ı.
class StudyStatsNotifier extends Notifier<StudyStatsState> {
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();

  @override
  StudyStatsState build() {
    return const StudyStatsState();
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

    state = state.copyWith(
      totalSolved: state.totalSolved + 1,
      totalCorrect: isCorrect ? state.totalCorrect + 1 : state.totalCorrect,
      totalWrong: !isCorrect ? state.totalWrong + 1 : state.totalWrong,
      wrongByLesson: newWrongByLesson,
      solvedByLesson: newSolvedByLesson,
      correctByLesson: newCorrectByLesson,
      totalXp: state.totalXp + earnedXp,
      totalTimeSeconds: state.totalTimeSeconds + timeSpentSeconds,
    );

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
