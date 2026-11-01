import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Kullanıcının abonelik (PRO/Freemium), soru limiti ve tema tercihlerini tutan state modeli.
///
/// Angular'daki `interface UserPreferences` veya NgRx Preferences state nesnesinin karşılığıdır.
class UserPreferencesState {
  final bool isPro;
  final int dailyFreeQuestionLimit;
  final ThemeMode themeMode;
  final int targetKpssScore;
  final String focusLesson;
  final bool hasCompletedOnboarding;

  const UserPreferencesState({
    this.isPro = false,
    this.dailyFreeQuestionLimit = 30,
    this.themeMode = ThemeMode.system,
    this.targetKpssScore = 85,
    this.focusLesson = 'Tarih',
    this.hasCompletedOnboarding = false,
  });

  UserPreferencesState copyWith({
    bool? isPro,
    int? dailyFreeQuestionLimit,
    ThemeMode? themeMode,
    int? targetKpssScore,
    String? focusLesson,
    bool? hasCompletedOnboarding,
  }) {
    return UserPreferencesState(
      isPro: isPro ?? this.isPro,
      dailyFreeQuestionLimit:
          dailyFreeQuestionLimit ?? this.dailyFreeQuestionLimit,
      themeMode: themeMode ?? this.themeMode,
      targetKpssScore: targetKpssScore ?? this.targetKpssScore,
      focusLesson: focusLesson ?? this.focusLesson,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
    );
  }
}

/// Kullanıcı tercihlerini ve abonelik durumunu yöneten Riverpod Notifier'ı.
class UserPreferencesNotifier extends Notifier<UserPreferencesState> {
  @override
  UserPreferencesState build() {
    return const UserPreferencesState();
  }

  /// Kadro PRO aboneliğini aktifleştirir (sınırsız soru).
  void upgradeToPro() {
    state = state.copyWith(isPro: true);
  }

  /// Ödüllü reklam izlendiğinde ek soru hakkı tanımlar (varsayılan +20 soru).
  void rewardExtraQuestions([int amount = 20]) {
    state = state.copyWith(
      dailyFreeQuestionLimit: state.dailyFreeQuestionLimit + amount,
    );
  }

  /// Uygulama temasını (Sistem, Açık veya Koyu) günceller.
  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
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
      dailyFreeQuestionLimit: dailyGoalQuestions,
      hasCompletedOnboarding: true,
    );
  }
}

/// Kullanıcı tercihlerini dinleyen küresel Provider.
final userPreferencesProvider =
    NotifierProvider<UserPreferencesNotifier, UserPreferencesState>(
      UserPreferencesNotifier.new,
    );
