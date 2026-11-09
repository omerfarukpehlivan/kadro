import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';

/// Kullanıcının abonelik (PRO/Freemium), soru limiti, tema, hedef sınav, çalışma programı ve soru çözüm modu tercihlerini tutan state modeli.
///
/// Angular'daki `interface UserPreferences` veya NgRx Preferences state nesnesinin karşılığıdır.
class UserPreferencesState {
  final bool isPro;
  final int dailyFreeQuestionLimit;
  final int targetDailyStudyGoal;
  final ThemeMode themeMode;
  final int targetKpssScore;
  final String focusLesson;
  final bool hasCompletedOnboarding;
  final QuizMode defaultQuizMode;
  final String targetExamKey;
  final bool hasSelectedTargetExam;
  final String studyProgramPaceKey;
  final bool hasActiveStudyProgram;

  const UserPreferencesState({
    this.isPro = false,
    this.dailyFreeQuestionLimit = 30,
    this.targetDailyStudyGoal = 30,
    this.themeMode = ThemeMode.system,
    this.targetKpssScore = 85,
    this.focusLesson = 'Tarih',
    this.hasCompletedOnboarding = false,
    this.defaultQuizMode = QuizMode.learning,
    this.targetExamKey = 'lisans',
    this.hasSelectedTargetExam = false,
    this.studyProgramPaceKey = 'orta',
    this.hasActiveStudyProgram = false,
  });

  /// Seçili hedef sınavın enum nesnesi karşılığı.
  KpssExamTarget get targetExam => KpssExamTarget.fromKey(targetExamKey);

  /// Seçili otomatik çalışma programı temposu.
  StudyProgramPace get studyProgramPace =>
      StudyProgramPace.fromKey(studyProgramPaceKey);

  UserPreferencesState copyWith({
    bool? isPro,
    int? dailyFreeQuestionLimit,
    int? targetDailyStudyGoal,
    ThemeMode? themeMode,
    int? targetKpssScore,
    String? focusLesson,
    bool? hasCompletedOnboarding,
    QuizMode? defaultQuizMode,
    String? targetExamKey,
    bool? hasSelectedTargetExam,
    String? studyProgramPaceKey,
    bool? hasActiveStudyProgram,
  }) {
    return UserPreferencesState(
      isPro: isPro ?? this.isPro,
      dailyFreeQuestionLimit:
          dailyFreeQuestionLimit ?? this.dailyFreeQuestionLimit,
      targetDailyStudyGoal: targetDailyStudyGoal ?? this.targetDailyStudyGoal,
      themeMode: themeMode ?? this.themeMode,
      targetKpssScore: targetKpssScore ?? this.targetKpssScore,
      focusLesson: focusLesson ?? this.focusLesson,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      defaultQuizMode: defaultQuizMode ?? this.defaultQuizMode,
      targetExamKey: targetExamKey ?? this.targetExamKey,
      hasSelectedTargetExam:
          hasSelectedTargetExam ?? this.hasSelectedTargetExam,
      studyProgramPaceKey: studyProgramPaceKey ?? this.studyProgramPaceKey,
      hasActiveStudyProgram:
          hasActiveStudyProgram ?? this.hasActiveStudyProgram,
    );
  }

  /// JSON formatına dönüştürür (LocalStorageService için).
  Map<String, dynamic> toJson() {
    return {
      'isPro': isPro,
      'dailyFreeQuestionLimit': dailyFreeQuestionLimit,
      'targetDailyStudyGoal': targetDailyStudyGoal,
      'themeMode': themeMode.name,
      'targetKpssScore': targetKpssScore,
      'focusLesson': focusLesson,
      'hasCompletedOnboarding': hasCompletedOnboarding,
      'defaultQuizMode': defaultQuizMode.name,
      'targetExamKey': targetExamKey,
      'hasSelectedTargetExam': hasSelectedTargetExam,
      'studyProgramPaceKey': studyProgramPaceKey,
      'hasActiveStudyProgram': hasActiveStudyProgram,
    };
  }

  /// JSON formatından nesne üretir.
  factory UserPreferencesState.fromJson(Map<String, dynamic> json) {
    final themeName = (json['themeMode'] as String?) ?? 'system';
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
    final modeName = json['defaultQuizMode'] as String?;
    final defaultQuizMode = modeName == null
        ? QuizMode.learning
        : QuizMode.values.firstWhere(
            (e) => e.name == modeName,
            orElse: () => QuizMode.learning,
          );
    return UserPreferencesState(
      isPro: (json['isPro'] as bool?) ?? false,
      dailyFreeQuestionLimit:
          (json['dailyFreeQuestionLimit'] as num?)?.toInt() ?? 30,
      targetDailyStudyGoal:
          (json['targetDailyStudyGoal'] as num?)?.toInt() ?? 30,
      themeMode: themeMode,
      targetKpssScore: (json['targetKpssScore'] as num?)?.toInt() ?? 85,
      focusLesson: (json['focusLesson'] as String?) ?? 'Tarih',
      hasCompletedOnboarding:
          (json['hasCompletedOnboarding'] as bool?) ?? false,
      defaultQuizMode: defaultQuizMode,
      targetExamKey: (json['targetExamKey'] as String?) ?? 'lisans',
      hasSelectedTargetExam: (json['hasSelectedTargetExam'] as bool?) ?? false,
      studyProgramPaceKey: (json['studyProgramPaceKey'] as String?) ?? 'orta',
      hasActiveStudyProgram: (json['hasActiveStudyProgram'] as bool?) ?? false,
    );
  }
}

/// Kullanıcı tercihlerini ve abonelik durumunu yöneten Riverpod Notifier'ı.
class UserPreferencesNotifier extends Notifier<UserPreferencesState> {
  final LocalStorageService _storage = LocalStorageService();
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();

  @override
  UserPreferencesState build() {
    unawaited(_loadFromStorage());
    return const UserPreferencesState();
  }

  Future<void> _loadFromStorage() async {
    final saved = await _storage.loadUserPreferences();
    if (saved != null) {
      state = saved;
    }
  }

  /// Kadro PRO aboneliğini aktifleştirir (sınırsız soru).
  void upgradeToPro() {
    state = state.copyWith(isPro: true);
    unawaited(_storage.saveUserPreferences(state));
  }

  /// Ödüllü reklam izlendiğinde ek soru hakkı tanımlar (varsayılan +20 soru).
  void rewardExtraQuestions([int amount = 20]) {
    state = state.copyWith(
      dailyFreeQuestionLimit: state.dailyFreeQuestionLimit + amount,
    );
    unawaited(_storage.saveUserPreferences(state));
  }

  /// Uygulama temasını (Sistem, Açık veya Koyu) günceller.
  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    unawaited(_storage.saveUserPreferences(state));
  }

  /// Varsayılan soru çözüm modunu (Öğrenme / Sınav) günceller.
  void setQuizMode(QuizMode mode) {
    state = state.copyWith(defaultQuizMode: mode);
    unawaited(_storage.saveUserPreferences(state));
  }

  /// Kullanıcının hazırlandığı KPSS hedef sınavını günceller.
  void setTargetExam(KpssExamTarget target) {
    state = state.copyWith(
      targetExamKey: target.name,
      hasSelectedTargetExam: true,
    );
    unawaited(_storage.saveUserPreferences(state));
    unawaited(_cloudSync.syncUserPreferences(targetExam: target.name));
  }

  /// Otomatik çalışma programı temposunu günceller ve aktif eder.
  void setStudyProgramPace(StudyProgramPace pace) {
    state = state.copyWith(
      studyProgramPaceKey: pace.name,
      hasActiveStudyProgram: true,
      targetDailyStudyGoal: pace.dailyGoalQuestions,
    );
    unawaited(_storage.saveUserPreferences(state));
    unawaited(
      _cloudSync.syncUserPreferences(
        studyPace: pace.name,
        hasActiveStudyProgram: true,
      ),
    );
  }

  /// Kullanıcının KPSS hedef puanını, odak dersini, günlük soru hedefini ve opsiyonel hedef sınavını kaydeder.
  void saveOnboardingGoals({
    required int targetKpssScore,
    required String focusLesson,
    required int dailyGoalQuestions,
    KpssExamTarget? targetExam,
    StudyProgramPace? studyProgramPace,
  }) {
    state = state.copyWith(
      targetKpssScore: targetKpssScore,
      focusLesson: focusLesson,
      targetDailyStudyGoal: dailyGoalQuestions,
      targetExamKey: targetExam?.name ?? state.targetExamKey,
      hasSelectedTargetExam: targetExam != null || state.hasSelectedTargetExam,
      studyProgramPaceKey: studyProgramPace?.name ?? state.studyProgramPaceKey,
      hasActiveStudyProgram:
          studyProgramPace != null || state.hasActiveStudyProgram,
      hasCompletedOnboarding: true,
    );
    unawaited(_storage.saveUserPreferences(state));
    unawaited(
      _cloudSync.syncUserPreferences(
        targetExam: state.targetExamKey,
        studyPace: state.studyProgramPaceKey,
        targetKpssScore: targetKpssScore,
        focusLesson: focusLesson,
        hasActiveStudyProgram: state.hasActiveStudyProgram,
        hasCompletedOnboarding: true,
      ),
    );
  }

  /// Buluttaki kullanıcı tercihlerini ve PRO durumunu yükler (Çoklu Cihaz Senkronizasyonu).
  Future<void> loadFromCloud() async {
    final cloudPrefs = await _cloudSync.fetchUserPreferences();
    if (cloudPrefs == null || cloudPrefs.isEmpty) return;

    bool? isPro;
    if (cloudPrefs['is_pro'] != null) {
      isPro = cloudPrefs['is_pro'] as bool?;
    }

    final targetExamStr = cloudPrefs['target_exam'] as String?;
    final studyPaceStr = cloudPrefs['study_pace'] as String?;
    final targetScore = (cloudPrefs['target_kpss_score'] as num?)?.toInt();
    final focus = cloudPrefs['focus_lesson'] as String?;
    final hasActiveProgram = cloudPrefs['has_active_study_program'] as bool?;
    final hasCompletedOnboard = cloudPrefs['has_completed_onboarding'] as bool?;
    final dailyGoal = (cloudPrefs['daily_goal_questions'] as num?)?.toInt();

    state = state.copyWith(
      isPro: isPro ?? state.isPro,
      targetExamKey: targetExamStr ?? state.targetExamKey,
      hasSelectedTargetExam:
          targetExamStr != null || state.hasSelectedTargetExam,
      studyProgramPaceKey: studyPaceStr ?? state.studyProgramPaceKey,
      hasActiveStudyProgram: hasActiveProgram ?? state.hasActiveStudyProgram,
      targetKpssScore: targetScore ?? state.targetKpssScore,
      focusLesson: focus ?? state.focusLesson,
      hasCompletedOnboarding:
          hasCompletedOnboard ?? state.hasCompletedOnboarding,
      targetDailyStudyGoal: dailyGoal ?? state.targetDailyStudyGoal,
    );

    unawaited(_storage.saveUserPreferences(state));
  }

  /// Oturum kapatıldığında veya misafir moduna geçildiğinde tercihleri varsayılana sıfırlar.
  void reset() {
    state = const UserPreferencesState();
    unawaited(_storage.saveUserPreferences(state));
  }
}

/// Kullanıcı tercihlerini dinleyen küresel Provider.
final userPreferencesProvider =
    NotifierProvider<UserPreferencesNotifier, UserPreferencesState>(
      UserPreferencesNotifier.new,
    );
