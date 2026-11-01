import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Kullanıcının soru çözme istatistiklerini ve günlük hedefini tutan durum (state) modeli.
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

  const StudyStatsState({
    this.totalSolved = 0,
    this.totalCorrect = 0,
    this.totalWrong = 0,
    this.dailyGoal = 30,
    this.wrongByLesson = const {},
    this.solvedByLesson = const {},
    this.correctByLesson = const {},
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

  StudyStatsState copyWith({
    int? totalSolved,
    int? totalCorrect,
    int? totalWrong,
    int? dailyGoal,
    Map<String, int>? wrongByLesson,
    Map<String, int>? solvedByLesson,
    Map<String, int>? correctByLesson,
  }) {
    return StudyStatsState(
      totalSolved: totalSolved ?? this.totalSolved,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalWrong: totalWrong ?? this.totalWrong,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      wrongByLesson: wrongByLesson ?? this.wrongByLesson,
      solvedByLesson: solvedByLesson ?? this.solvedByLesson,
      correctByLesson: correctByLesson ?? this.correctByLesson,
    );
  }
}

/// Soru istatistiklerini ve günlük hedef ilerlemesini yöneten Riverpod Notifier'ı.
///
/// Angular'daki `BehaviorSubject` veya `writable signal` barındıran Singleton
/// servis mantığı ile birebir örtüşür. State değiştiğinde arayüzü dinleyen tüm
/// ConsumerWidget'lar otomatik güncellenir.
class StudyStatsNotifier extends Notifier<StudyStatsState> {
  @override
  StudyStatsState build() {
    return const StudyStatsState();
  }

  /// Her soru onaylandığında istatistikleri günceller.
  void recordAnswer({required String lesson, required bool isCorrect}) {
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

    state = state.copyWith(
      totalSolved: state.totalSolved + 1,
      totalCorrect: isCorrect ? state.totalCorrect + 1 : state.totalCorrect,
      totalWrong: !isCorrect ? state.totalWrong + 1 : state.totalWrong,
      wrongByLesson: newWrongByLesson,
      solvedByLesson: newSolvedByLesson,
      correctByLesson: newCorrectByLesson,
    );
  }

  /// Kullanıcının profilinden belirlediği günlük hedefi günceller.
  void updateDailyGoal(int newGoal) {
    state = state.copyWith(dailyGoal: newGoal);
  }
}

/// Uygulama genelinde çalışma istatistiklerini yayınlayan küresel Provider.
final studyStatsProvider =
    NotifierProvider<StudyStatsNotifier, StudyStatsState>(
      StudyStatsNotifier.new,
    );
