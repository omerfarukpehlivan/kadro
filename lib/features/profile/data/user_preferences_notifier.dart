import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
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
  final ExamSelection examSelection;
  final bool hasSelectedTargetExam;
  final String studyProgramPaceKey;
  final bool hasActiveStudyProgram;
  final String? dailyQuotaDate;
  final bool highReadabilityMode;

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
    this.examSelection = ExamSelection.initial,
    this.hasSelectedTargetExam = false,
    this.studyProgramPaceKey = 'dk60',
    this.hasActiveStudyProgram = false,
    this.dailyQuotaDate,
    this.highReadabilityMode = false,
  });

  /// Verilen an için `YYYY-MM-DD` formatında günlük kota tarih anahtarı üretir.
  static String todayDateKey([DateTime? now]) {
    final d = now ?? DateTime.now();
    final year = d.year.toString().padLeft(4, '0');
    final month = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  /// Verilen gün için geçerli ücretsiz günlük soru limitini döner; gün değiştiyse `30`a sıfırlar.
  int effectiveDailyFreeLimit([DateTime? now]) {
    final today = todayDateKey(now);
    if (dailyQuotaDate == today) {
      return dailyFreeQuestionLimit < 30 ? 30 : dailyFreeQuestionLimit;
    }
    return 30;
  }

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
    ExamSelection? examSelection,
    bool? hasSelectedTargetExam,
    String? studyProgramPaceKey,
    bool? hasActiveStudyProgram,
    String? dailyQuotaDate,
    bool? highReadabilityMode,
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
      examSelection: examSelection ?? this.examSelection,
      hasSelectedTargetExam:
          hasSelectedTargetExam ?? this.hasSelectedTargetExam,
      studyProgramPaceKey: studyProgramPaceKey ?? this.studyProgramPaceKey,
      hasActiveStudyProgram:
          hasActiveStudyProgram ?? this.hasActiveStudyProgram,
      dailyQuotaDate: dailyQuotaDate ?? this.dailyQuotaDate,
      highReadabilityMode: highReadabilityMode ?? this.highReadabilityMode,
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
      'examSelection': examSelection.toJson(),
      'hasSelectedTargetExam': hasSelectedTargetExam,
      'studyProgramPaceKey': studyProgramPaceKey,
      'hasActiveStudyProgram': hasActiveStudyProgram,
      'dailyQuotaDate': dailyQuotaDate,
      'highReadabilityMode': highReadabilityMode,
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
    final targetExamKey = (json['targetExamKey'] as String?) ?? 'lisans';
    final rawSelection = json['examSelection'];
    final parsedSelection = rawSelection is Map
        ? ExamSelection.fromJson(Map<String, dynamic>.from(rawSelection))
        : ExamSelection.fromLegacyTarget(KpssExamTarget.fromKey(targetExamKey));

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
      targetExamKey: targetExamKey,
      examSelection: parsedSelection,
      hasSelectedTargetExam: (json['hasSelectedTargetExam'] as bool?) ?? false,
      studyProgramPaceKey: (json['studyProgramPaceKey'] as String?) ?? 'orta',
      hasActiveStudyProgram: (json['hasActiveStudyProgram'] as bool?) ?? false,
      dailyQuotaDate: json['dailyQuotaDate'] as String?,
      highReadabilityMode: (json['highReadabilityMode'] as bool?) ?? false,
    );
  }
}

/// Uygulama başlangıcında `SharedPreferences` içinden önceden okunan kullanıcı tercihleri.
final initialUserPreferencesProvider = Provider<UserPreferencesState?>(
  (ref) => null,
);

/// Kullanıcı tercihlerini ve abonelik durumunu yöneten Riverpod Notifier'ı.
class UserPreferencesNotifier extends Notifier<UserPreferencesState> {
  final LocalStorageService _storage = LocalStorageService();
  final CloudSyncRepository _cloudSync = const CloudSyncRepository();
  String? _accountKey;

  /// Oturum açmış kullanıcının hesap anahtarını belirler.
  void setAccountKey(String? key) {
    _accountKey = key?.trim().toLowerCase();
  }

  @override
  UserPreferencesState build() {
    final preloaded = ref.watch(initialUserPreferencesProvider);
    if (preloaded == null) {
      unawaited(_loadFromStorage());
      return const UserPreferencesState();
    }
    unawaited(_mergeDeviceDailyLimit());
    final today = UserPreferencesState.todayDateKey();
    if (preloaded.dailyQuotaDate != null && preloaded.dailyQuotaDate != today) {
      return preloaded.copyWith(
        dailyFreeQuestionLimit: 30,
        dailyQuotaDate: today,
      );
    }
    return preloaded;
  }

  Future<void> _mergeDeviceDailyLimit() async {
    final today = UserPreferencesState.todayDateKey();
    final deviceQuota = await _storage.loadDeviceDailyQuota();
    if (!ref.mounted) return;
    if (deviceQuota != null && deviceQuota['date'] == today) {
      final deviceLimit = (deviceQuota['limit'] as num?)?.toInt() ?? 30;
      final currentEffective = state.effectiveDailyFreeLimit();
      if (deviceLimit > currentEffective) {
        state = state.copyWith(
          dailyFreeQuestionLimit: deviceLimit,
          dailyQuotaDate: today,
        );
      }
    }
  }

  Future<void> _loadFromStorage() async {
    final saved = await _storage.loadUserPreferences();
    final deviceQuota = await _storage.loadDeviceDailyQuota();
    if (!ref.mounted) return;
    final today = UserPreferencesState.todayDateKey();

    var deviceTodayLimit = 30;
    if (deviceQuota != null && deviceQuota['date'] == today) {
      deviceTodayLimit = (deviceQuota['limit'] as num?)?.toInt() ?? 30;
    }

    if (saved != null) {
      final normalizedLimit = math.max(
        saved.effectiveDailyFreeLimit(),
        deviceTodayLimit,
      );
      state = saved.copyWith(
        dailyFreeQuestionLimit: normalizedLimit,
        dailyQuotaDate: today,
      );
    } else if (deviceTodayLimit > state.effectiveDailyFreeLimit()) {
      state = state.copyWith(
        dailyFreeQuestionLimit: deviceTodayLimit,
        dailyQuotaDate: today,
      );
    }
  }

  /// Kadro PRO aboneliğini aktifleştirir (sınırsız soru).
  void upgradeToPro() {
    state = state.copyWith(isPro: true);
    unawaited(_storage.saveUserPreferences(state));
  }

  /// Ödüllü reklam izlendiğinde ek soru hakkı tanımlar (varsayılan +20 soru).
  ///
  /// Yeni soru limiti bugünün tarih damgasıyla hem hesap bazlı yedeğe hem cihaz kotasına hem de buluta işlenir.
  void rewardExtraQuestions([int amount = 20]) {
    final today = UserPreferencesState.todayDateKey();
    final baseLimit = state.effectiveDailyFreeLimit();
    final newLimit = baseLimit + amount;
    state = state.copyWith(
      dailyFreeQuestionLimit: newLimit,
      dailyQuotaDate: today,
    );
    unawaited(_storage.saveUserPreferences(state));
    unawaited(
      _storage.saveDeviceDailyQuota(
        dateKey: today,
        solvedCount: 0,
        freeLimit: newLimit,
      ),
    );
    if (_accountKey != null) {
      unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
    }
    unawaited(
      _cloudSync.syncUserPreferences(
        dailyFreeQuestionLimit: newLimit,
        dailyQuotaDate: today,
      ),
    );
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

  /// Kullanıcının çok boyutlu sınav seçimini ([ExamSelection]) ve uyumlu hedef anahtarını günceller.
  void setExamSelection(ExamSelection selection) {
    final legacyTarget = selection.toLegacyTarget();
    state = state.copyWith(
      examSelection: selection,
      targetExamKey: legacyTarget.name,
      hasSelectedTargetExam: true,
    );
    unawaited(_storage.saveUserPreferences(state));
    if (_accountKey != null) {
      unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
    }
    unawaited(
      _cloudSync.syncUserPreferences(
        targetExam: legacyTarget.name,
        examSelection: selection.toJson(),
      ),
    );
  }

  /// E-KPSS / görme kolaylığı için yüksek okunabilirlik (1.2x ölçek + net kenarlık) modunu açıp kapatır.
  void setHighReadabilityMode(bool enabled) {
    state = state.copyWith(highReadabilityMode: enabled);
    unawaited(_storage.saveUserPreferences(state));
    if (_accountKey != null) {
      unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
    }
  }

  /// Kullanıcının hazırlandığı KPSS hedef sınavını günceller (Geriye dönük uyumluluk sarmalayıcısı).
  void setTargetExam(KpssExamTarget target) {
    setExamSelection(ExamSelection.fromLegacyTarget(target));
  }

  /// Otomatik çalışma programı temposunu günceller ve aktif eder.
  void setStudyProgramPace(StudyProgramPace pace) {
    state = state.copyWith(
      studyProgramPaceKey: pace.name,
      hasActiveStudyProgram: true,
      targetDailyStudyGoal: pace.dailyGoalQuestions,
    );
    unawaited(_storage.saveUserPreferences(state));
    if (_accountKey != null) {
      unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
    }
    unawaited(
      _cloudSync.syncUserPreferences(
        studyPace: pace.name,
        hasActiveStudyProgram: true,
      ),
    );
  }

  /// Kullanıcının KPSS hedef puanını, odak dersini, günlük soru hedefini ve sınav seçimini kaydeder.
  void saveOnboardingGoals({
    required int targetKpssScore,
    required String focusLesson,
    required int dailyGoalQuestions,
    KpssExamTarget? targetExam,
    ExamSelection? examSelection,
    StudyProgramPace? studyProgramPace,
  }) {
    final resolvedSelection =
        examSelection ??
        (targetExam != null
            ? ExamSelection.fromLegacyTarget(targetExam)
            : state.examSelection);
    final resolvedTargetKey = examSelection != null
        ? resolvedSelection.toLegacyTarget().name
        : (targetExam?.name ?? state.targetExamKey);

    state = state.copyWith(
      targetKpssScore: targetKpssScore,
      focusLesson: focusLesson,
      targetDailyStudyGoal: dailyGoalQuestions,
      examSelection: resolvedSelection,
      targetExamKey: resolvedTargetKey,
      hasSelectedTargetExam:
          examSelection != null ||
          targetExam != null ||
          state.hasSelectedTargetExam,
      studyProgramPaceKey: studyProgramPace?.name ?? state.studyProgramPaceKey,
      hasActiveStudyProgram:
          studyProgramPace != null || state.hasActiveStudyProgram,
      hasCompletedOnboarding: true,
    );
    unawaited(_storage.saveUserPreferences(state));
    if (_accountKey != null) {
      unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
    }
    unawaited(
      _cloudSync.syncUserPreferences(
        targetExam: state.targetExamKey,
        examSelection: state.examSelection.toJson(),
        studyPace: state.studyProgramPaceKey,
        targetKpssScore: targetKpssScore,
        focusLesson: focusLesson,
        hasActiveStudyProgram: state.hasActiveStudyProgram,
        hasCompletedOnboarding: true,
      ),
    );
  }

  /// Buluttaki kullanıcı tercihlerini ve PRO durumunu yükler (Çoklu Cihaz Senkronizasyonu).
  Future<void> loadFromCloud({
    String? accountKey,
    Map<String, dynamic>? cloudPrefsOverride,
  }) async {
    if (accountKey != null && accountKey.trim().isNotEmpty) {
      _accountKey = accountKey.trim().toLowerCase();
    }

    UserPreferencesState? localAccountPrefs;
    if (_accountKey != null) {
      localAccountPrefs = await _storage.loadAccountUserPreferences(
        _accountKey!,
      );
      if (!ref.mounted) return;
    }

    final today = UserPreferencesState.todayDateKey();
    final deviceQuota = await _storage.loadDeviceDailyQuota();
    if (!ref.mounted) return;
    var deviceTodayLimit = 30;
    if (deviceQuota != null && deviceQuota['date'] == today) {
      deviceTodayLimit = (deviceQuota['limit'] as num?)?.toInt() ?? 30;
    }

    final localTodayLimit = state.effectiveDailyFreeLimit();
    final accountTodayLimit =
        localAccountPrefs?.effectiveDailyFreeLimit() ?? 30;

    final cloudPrefs =
        cloudPrefsOverride ?? await _cloudSync.fetchUserPreferences();
    if (!ref.mounted) return;

    var cloudTodayLimit = 30;
    if (cloudPrefs != null) {
      final rawLimit =
          (cloudPrefs['dailyFreeQuestionLimit'] as num?)?.toInt() ??
          (cloudPrefs['daily_free_limit'] as num?)?.toInt();
      final rawDate =
          cloudPrefs['dailyQuotaDate']?.toString() ??
          cloudPrefs['daily_quota_date']?.toString();
      if (rawDate == today && rawLimit != null && rawLimit >= 30) {
        cloudTodayLimit = rawLimit;
      }
    }

    final mergedDailyLimit = [
      30,
      localTodayLimit,
      accountTodayLimit,
      deviceTodayLimit,
      cloudTodayLimit,
    ].reduce(math.max);

    if (cloudPrefs == null && localAccountPrefs == null) {
      if (mergedDailyLimit != state.dailyFreeQuestionLimit ||
          state.dailyQuotaDate != today) {
        state = state.copyWith(
          dailyFreeQuestionLimit: mergedDailyLimit,
          dailyQuotaDate: today,
        );
        unawaited(_storage.saveUserPreferences(state));
      }
      if (state.hasCompletedOnboarding) {
        if (_accountKey != null) {
          unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
        }
        unawaited(
          _cloudSync.syncUserPreferences(
            targetExam: state.targetExamKey,
            examSelection: state.examSelection.toJson(),
            studyPace: state.studyProgramPaceKey,
            targetKpssScore: state.targetKpssScore,
            focusLesson: state.focusLesson,
            hasActiveStudyProgram: state.hasActiveStudyProgram,
            hasCompletedOnboarding: state.hasCompletedOnboarding,
            dailyFreeQuestionLimit: mergedDailyLimit,
            dailyQuotaDate: today,
          ),
        );
      }
      return;
    }

    if (localAccountPrefs != null && cloudPrefs == null) {
      state = localAccountPrefs.copyWith(
        dailyFreeQuestionLimit: mergedDailyLimit,
        dailyQuotaDate: today,
      );
      unawaited(_storage.saveUserPreferences(state));
      return;
    }

    if (cloudPrefs != null) {
      bool? isPro;
      if (cloudPrefs['is_pro'] != null) {
        isPro = cloudPrefs['is_pro'] as bool?;
      }

      final targetExamStr = cloudPrefs['target_exam'] as String?;
      final rawCloudSelection = cloudPrefs['exam_selection'];
      final hasCloudSelection =
          rawCloudSelection is Map && rawCloudSelection.isNotEmpty;
      final effectiveSelection = hasCloudSelection
          ? ExamSelection.fromJson(Map<String, dynamic>.from(rawCloudSelection))
          : (targetExamStr != null && targetExamStr.isNotEmpty
                ? ExamSelection.fromLegacyTarget(
                    KpssExamTarget.fromKey(targetExamStr),
                  )
                : state.examSelection);
      final studyPaceStr = cloudPrefs['study_pace'] as String?;
      final normalizedPaceKey = studyPaceStr != null && studyPaceStr.isNotEmpty
          ? StudyProgramPace.fromKey(studyPaceStr).name
          : state.studyProgramPaceKey;
      final targetScore = (cloudPrefs['target_kpss_score'] as num?)?.toInt();
      final focus = cloudPrefs['focus_lesson'] as String?;
      final hasActiveProgram = cloudPrefs['has_active_study_program'] as bool?;
      final hasCompletedOnboard =
          cloudPrefs['has_completed_onboarding'] as bool?;
      final dailyGoal = (cloudPrefs['daily_goal_questions'] as num?)?.toInt();
      final cloudPlanner = cloudPrefs['planner_state'];
      final hasNonEmptyCloudPlanner =
          cloudPlanner is Map && cloudPlanner.isNotEmpty;

      // SQL varsayılan target_exam='lisans' veya boş '{}' planner_state tek başına
      // kurulum sayılmaz; buluttaki gerçek kurulum/program bayrakları esas alınır.
      final effectiveHasActiveProgram =
          (hasActiveProgram ?? false) || hasNonEmptyCloudPlanner;
      final effectiveOnboarding =
          (hasCompletedOnboard ?? false) || effectiveHasActiveProgram;

      state = state.copyWith(
        isPro: isPro ?? state.isPro,
        dailyFreeQuestionLimit: mergedDailyLimit,
        dailyQuotaDate: today,
        examSelection: effectiveSelection,
        targetExamKey: hasCloudSelection
            ? effectiveSelection.toLegacyTarget().name
            : (targetExamStr ?? state.targetExamKey),
        hasSelectedTargetExam:
            effectiveOnboarding ||
            (targetExamStr != null && effectiveHasActiveProgram) ||
            state.hasSelectedTargetExam,
        studyProgramPaceKey: normalizedPaceKey,
        hasActiveStudyProgram: effectiveHasActiveProgram,
        targetKpssScore: targetScore ?? state.targetKpssScore,
        focusLesson: focus ?? state.focusLesson,
        hasCompletedOnboarding: effectiveOnboarding,
        targetDailyStudyGoal: dailyGoal ?? state.targetDailyStudyGoal,
      );

      unawaited(_storage.saveUserPreferences(state));
      unawaited(
        _storage.saveDeviceDailyQuota(
          dateKey: today,
          solvedCount: 0,
          freeLimit: mergedDailyLimit,
        ),
      );
      if (_accountKey != null) {
        unawaited(_storage.saveAccountUserPreferences(_accountKey!, state));
      }
      if (mergedDailyLimit > cloudTodayLimit) {
        unawaited(
          _cloudSync.syncUserPreferences(
            dailyFreeQuestionLimit: mergedDailyLimit,
            dailyQuotaDate: today,
          ),
        );
      }
    }
  }

  /// Oturum kapatıldığında veya misafir moduna geçildiğinde tercihleri varsayılana sıfırlar,
  /// ancak bugüne ait cihaz soru limitini korur.
  void reset() {
    _accountKey = null;
    final today = UserPreferencesState.todayDateKey();
    final preservedTodayLimit = state.effectiveDailyFreeLimit();
    state = UserPreferencesState(
      dailyFreeQuestionLimit: preservedTodayLimit,
      dailyQuotaDate: today,
    );
    unawaited(_storage.saveUserPreferences(state));
    unawaited(_mergeDeviceDailyLimit());
  }
}

/// Kullanıcı tercihlerini dinleyen küresel Provider.
final userPreferencesProvider =
    NotifierProvider<UserPreferencesNotifier, UserPreferencesState>(
      UserPreferencesNotifier.new,
    );
