import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/local_storage_service.dart';

/// Kullanıcının abonelik (PRO/Freemium), soru limiti ve tema tercihlerini tutan state modeli.
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

  const UserPreferencesState({
    this.isPro = false,
    this.dailyFreeQuestionLimit = 30,
    this.targetDailyStudyGoal = 30,
    this.themeMode = ThemeMode.system,
    this.targetKpssScore = 85,
    this.focusLesson = 'Tarih',
    this.hasCompletedOnboarding = false,
  });

  UserPreferencesState copyWith({
    bool? isPro,
    int? dailyFreeQuestionLimit,
    int? targetDailyStudyGoal,
    ThemeMode? themeMode,
    int? targetKpssScore,
    String? focusLesson,
    bool? hasCompletedOnboarding,
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
    };
  }

  /// JSON formatından nesne üretir.
  factory UserPreferencesState.fromJson(Map<String, dynamic> json) {
    final themeName = (json['themeMode'] as String?) ?? 'system';
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
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
    );
  }
}

/// Kullanıcı tercihlerini ve abonelik durumunu yöneten Riverpod Notifier'ı.
class UserPreferencesNotifier extends Notifier<UserPreferencesState> {
  final LocalStorageService _storage = LocalStorageService();

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

  /// Kullanıcının KPSS hedef puanını, odak dersini ve günlük soru hedefini kaydeder.
  void saveOnboardingGoals({
    required int targetKpssScore,
    required String focusLesson,
    required int dailyGoalQuestions,
  }) {
    state = state.copyWith(
      targetKpssScore: targetKpssScore,
      focusLesson: focusLesson,
      targetDailyStudyGoal: dailyGoalQuestions,
      hasCompletedOnboarding: true,
    );
    unawaited(_storage.saveUserPreferences(state));
  }
}

/// Kullanıcı tercihlerini dinleyen küresel Provider.
final userPreferencesProvider =
    NotifierProvider<UserPreferencesNotifier, UserPreferencesState>(
      UserPreferencesNotifier.new,
    );
