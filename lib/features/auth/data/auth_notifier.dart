import 'dart:async' show StreamSubscription, unawaited;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/flashcards/data/flashcard_review_repository.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/features/topic_lessons/data/topic_lesson_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Girilen e-posta veya kullanıcı adını Supabase auth ile uyumlu e-posta formatına dönüştürür.
///
/// Web/Angular Karşılığı:
/// Auth normalizer pipe/utility. Eğer aday '@' içermeyen bir rumuz girdiyse
/// arka planda '@kadro.internal' sanal alan adı eklenerek standart Supabase e-postası üretilir.
String _normalizeIdentifier(String identifier) {
  final trimmed = identifier.trim().toLowerCase();
  if (trimmed.contains('@')) {
    return trimmed;
  }
  return '$trimmed@kadro.internal';
}

/// Kullanıcı kimlik doğrulama durumu.
///
/// Web/Angular karşılığı: AuthState (CurrentUser, Tokens, Loading, Error).
class AuthUserState {
  final bool isAuthenticated;
  final String? userId;
  final String? email;
  final String displayName;
  final bool isLoading;

  /// Giriş sonrası bulut tercihleri ve plan senkronizasyonu sürerken true olur.
  ///
  /// Web/Angular karşılığı: Route Guard / App Initializer hydration flag.
  final bool isHydrating;
  final String? errorMessage;

  const AuthUserState({
    this.isAuthenticated = false,
    this.userId,
    this.email,
    this.displayName = 'Memur Adayı',
    this.isLoading = false,
    this.isHydrating = false,
    this.errorMessage,
  });

  AuthUserState copyWith({
    bool? isAuthenticated,
    String? userId,
    String? email,
    String? displayName,
    bool? isLoading,
    bool? isHydrating,
    String? errorMessage,
  }) {
    return AuthUserState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      isLoading: isLoading ?? this.isLoading,
      isHydrating: isHydrating ?? this.isHydrating,
      errorMessage: errorMessage,
    );
  }
}

/// Supabase Auth ve yerel oturum durum yöneticisi.
///
/// Web/Angular karşılığı: AuthService / AuthStore (Supabase Auth Wrapper).
class AuthNotifier extends Notifier<AuthUserState> {
  StreamSubscription<AuthState>? _authSubscription;
  Future<void>? _activeHydration;

  /// Yeni cihazda veya ilk oturum açılışında tüm bulut verilerini (tercihler,
  /// XP/seri, çalışma planı ve yanlış defteri) sıralı olarak yerel state ile birleştirir.
  Future<void> _hydrateAllFromCloud() {
    final existing = _activeHydration;
    if (existing != null) return existing;

    final future = _runHydrationSequence();
    _activeHydration = future;
    return future;
  }

  Future<void> _runHydrationSequence() async {
    if (!ref.mounted) return;
    state = state.copyWith(isHydrating: true);
    try {
      final accountKey = state.email ?? state.userId;

      // 1. Önce kullanıcı tercihleri çekilir: hasCompletedOnboarding, targetExam,
      // studyProgramPace ve focusLesson netleşmeden plan üretilmemelidir.
      try {
        await ref
            .read(userPreferencesProvider.notifier)
            .loadFromCloud(accountKey: accountKey);
      } catch (_) {}
      if (!ref.mounted) return;

      // 2. İstatistik ve günlük soru kotası bulutla eşitlenir.
      try {
        await ref
            .read(studyStatsProvider.notifier)
            .loadFromCloud(accountKey: accountKey);
      } catch (_) {}
      if (!ref.mounted) return;

      // 3. Planlayıcı görevleri tercihlerle sıralı ve tutarlı biçimde yüklenir.
      try {
        await ref
            .read(studyPlannerProvider.notifier)
            .loadTasksFromCloud(accountKey: accountKey);
      } catch (_) {}
      if (!ref.mounted) return;

      // 4. Hata defteri, bilgi kartı Leitner tekrarları ve konu anlatımı ilerlemesi buluttan eşitlenir.
      try {
        await const MistakeRepository().hydrateFromCloud();
        final activeScope = ref
            .read(userPreferencesProvider)
            .examSelection
            .scopeKey;
        await const FlashcardReviewRepository().hydrateFromCloud(activeScope);
        await const TopicLessonProgressRepository().hydrateFromCloud();
        if (ref.mounted) {
          ref.read(topicLessonProgressProvider.notifier).refresh();
        }
      } catch (_) {}
    } finally {
      _activeHydration = null;
      if (ref.mounted) {
        state = state.copyWith(isHydrating: false);
      }
    }
  }

  @override
  AuthUserState build() {
    final client = SupabaseConfig.clientOrNull;

    if (client != null && _authSubscription == null) {
      _authSubscription = client.auth.onAuthStateChange.listen((data) {
        if (!ref.mounted) return;
        final user = data.session?.user;
        if (user != null) {
          final shouldHydrate =
              data.event == AuthChangeEvent.signedIn ||
              data.event == AuthChangeEvent.initialSession;
          state = state.copyWith(
            isAuthenticated: true,
            isHydrating: shouldHydrate ? true : state.isHydrating,
            userId: user.id,
            email: user.email,
            displayName:
                user.userMetadata?['display_name'] as String? ??
                user.userMetadata?['full_name'] as String? ??
                (user.email?.split('@').first ?? 'Memur Adayı'),
            isLoading: shouldHydrate ? state.isLoading : false,
            errorMessage: null,
          );
          if (shouldHydrate) {
            unawaited(_hydrateAllFromCloud());
          }
        } else if (data.event == AuthChangeEvent.signedOut) {
          _activeHydration = null;
          state = const AuthUserState();
          ref.read(studyStatsProvider.notifier).reset();
          ref.read(userPreferencesProvider.notifier).reset();
          ref.read(studyPlannerProvider.notifier).reset();
          const MistakeRepository().clearLocal();
          const FlashcardReviewRepository().clearLocal();
          const TopicLessonProgressRepository().clearLocal();
          ref.read(topicLessonProgressProvider.notifier).refresh();
        }
      });

      ref.onDispose(() {
        _authSubscription?.cancel();
        _authSubscription = null;
      });
    }

    final user = client?.auth.currentUser;
    if (user != null) {
      Future.microtask(() => _hydrateAllFromCloud());
      return AuthUserState(
        isAuthenticated: true,
        isHydrating: true,
        userId: user.id,
        email: user.email,
        displayName:
            user.userMetadata?['display_name'] as String? ??
            user.userMetadata?['full_name'] as String? ??
            'Memur Adayı',
      );
    }
    return const AuthUserState();
  }

  /// E-posta veya kullanıcı adı ve şifre ile giriş yapar.
  ///
  /// Web/Angular Karşılığı:
  /// `authService.login(credentials)` — Kullanıcı adı veya e-posta destekler.
  Future<bool> signIn({
    String? emailOrUsername,
    String? email,
    required String password,
  }) async {
    final rawIdentifier = emailOrUsername ?? email ?? '';
    final effectiveEmail = _normalizeIdentifier(rawIdentifier);

    state = state.copyWith(isLoading: true, errorMessage: null);

    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      // Yerel / Demo veya Test modu fallback
      if (rawIdentifier.trim().isNotEmpty && password.length >= 6) {
        final displayName = rawIdentifier.contains('@')
            ? rawIdentifier.trim().split('@').first
            : rawIdentifier.trim();

        state = state.copyWith(
          isAuthenticated: true,
          isHydrating: true,
          userId: 'demo_user',
          email: effectiveEmail,
          displayName: displayName,
        );
        await _hydrateAllFromCloud();
        if (ref.mounted) {
          state = state.copyWith(isLoading: false);
        }
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage:
              'Geçersiz e-posta/kullanıcı adı veya şifre (en az 6 karakter).',
        );
        return false;
      }
    }

    try {
      final response = await client.auth.signInWithPassword(
        email: effectiveEmail,
        password: password,
      );
      if (!ref.mounted) return false;
      final user = response.user;
      if (user != null) {
        state = state.copyWith(
          isAuthenticated: true,
          isHydrating: true,
          userId: user.id,
          email: user.email,
          displayName:
              user.userMetadata?['display_name'] as String? ??
              (user.email?.split('@').first ?? 'Memur Adayı'),
        );
        await _hydrateAllFromCloud();
        if (ref.mounted) {
          state = state.copyWith(isLoading: false);
        }
        return true;
      }
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Giriş yapılamadı, lütfen bilgilerinizi kontrol edin.',
      );
      return false;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Giriş hatası: ${e.toString()}',
      );
      return false;
    }
  }

  /// Yeni kullanıcı kaydı oluşturur (E-posta veya kullanıcı adı ile).
  ///
  /// Web/Angular Karşılığı:
  /// `authService.register(userData)`
  Future<bool> signUp({
    String? emailOrUsername,
    String? email,
    required String password,
    required String displayName,
  }) async {
    final rawIdentifier = emailOrUsername ?? email ?? '';
    final effectiveEmail = _normalizeIdentifier(rawIdentifier);

    state = state.copyWith(isLoading: true, errorMessage: null);

    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      state = state.copyWith(
        isAuthenticated: true,
        isHydrating: true,
        userId: 'demo_user',
        email: effectiveEmail,
        displayName: displayName.trim().isNotEmpty
            ? displayName.trim()
            : (rawIdentifier.contains('@')
                  ? rawIdentifier.split('@').first
                  : rawIdentifier),
      );
      await _hydrateAllFromCloud();
      if (ref.mounted) {
        state = state.copyWith(isLoading: false);
      }
      return true;
    }

    try {
      final response = await client.auth.signUp(
        email: effectiveEmail,
        password: password,
        data: {'display_name': displayName.trim()},
      );
      if (!ref.mounted) return false;
      final user = response.user;
      if (user != null) {
        state = state.copyWith(
          isAuthenticated: true,
          isHydrating: true,
          userId: user.id,
          email: user.email,
          displayName: displayName.trim(),
        );
        await _hydrateAllFromCloud();
        if (ref.mounted) {
          state = state.copyWith(isLoading: false);
        }
        return true;
      }
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Kayıt başarısız oldu.',
      );
      return false;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Kayıt hatası: ${e.toString()}',
      );
      return false;
    }
  }

  /// Google OAuth ile tek tıkla oturum açar.
  ///
  /// Web/Angular Karşılığı:
  /// `authService.loginWithGoogle()` — Supabase OAuth 2.0 flow.
  Future<bool> signInWithGoogle() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      // Demo / Test ortamı fallback
      state = state.copyWith(
        isAuthenticated: true,
        isHydrating: true,
        userId: 'google_demo_user',
        email: 'demo_kpss@gmail.com',
        displayName: 'Google ile Giriş Yapan Aday',
      );
      await _hydrateAllFromCloud();
      if (ref.mounted) {
        state = state.copyWith(isLoading: false);
      }
      return true;
    }
    try {
      final res = await client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'com.omer.kadro://login-callback',
      );
      if (!ref.mounted) return res;
      state = state.copyWith(isLoading: false);
      return res;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Google ile giriş hatası: ${e.toString()}',
      );
      return false;
    }
  }

  /// Şifre sıfırlama e-postası gönderir.
  ///
  /// Web/Angular Karşılığı:
  /// `authService.requestPasswordReset(email)`.
  Future<bool> sendPasswordResetEmail(String email) async {
    final client = SupabaseConfig.clientOrNull;
    if (client == null) return true; // Demo fallback
    try {
      await client.auth.resetPasswordForEmail(email.trim());
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        errorMessage:
            'Şifre sıfırlama bağlantısı gönderilemedi: ${e.toString()}',
      );
      return false;
    }
  }

  /// Oturumu kapatır ve yerel state ile kullanıcı cache'ini temizler.
  Future<void> signOut() async {
    _activeHydration = null;
    final accountKey = state.email ?? state.userId;
    if (accountKey != null && accountKey.trim().isNotEmpty) {
      try {
        final plannerNotifier = ref.read(studyPlannerProvider.notifier);
        final snapshot = plannerNotifier.exportSnapshot();
        final currentPrefs = ref.read(userPreferencesProvider);
        final currentStats = ref.read(studyStatsProvider);
        unawaited(
          LocalStorageService().saveAccountStudyStats(accountKey, currentStats),
        );
        unawaited(
          LocalStorageService().savePlannerSnapshot(
            snapshot,
            accountKey: accountKey,
          ),
        );
        unawaited(
          LocalStorageService().saveAccountUserPreferences(
            accountKey,
            currentPrefs,
          ),
        );
      } catch (_) {}
    }

    try {
      await SupabaseConfig.clientOrNull?.auth.signOut();
    } catch (_) {}
    if (!ref.mounted) return;
    state = const AuthUserState();
    ref.read(studyStatsProvider.notifier).reset();
    ref.read(userPreferencesProvider.notifier).reset();
    ref.read(studyPlannerProvider.notifier).reset();
    const MistakeRepository().clearLocal();
    const FlashcardReviewRepository().clearLocal();
    const TopicLessonProgressRepository().clearLocal();
    ref.read(topicLessonProgressProvider.notifier).refresh();
  }

  /// Google Play Data Safety & KVKK: Hesabı ve ilişkili tüm sınav verilerini kalıcı olarak siler.
  Future<bool> deleteAccountAndData() async {
    _activeHydration = null;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final client = SupabaseConfig.clientOrNull;
      if (client != null && state.userId != null) {
        try {
          await client.rpc('delete_user_account');
        } catch (_) {}
        try {
          await client.auth.signOut();
        } catch (_) {}
      }
      if (!ref.mounted) return true;

      state = const AuthUserState();
      ref.read(studyStatsProvider.notifier).reset();
      ref.read(userPreferencesProvider.notifier).reset();
      ref.read(studyPlannerProvider.notifier).reset();
      const MistakeRepository().clearLocal();
      const FlashcardReviewRepository().clearLocal();
      const TopicLessonProgressRepository().clearLocal();
      ref.read(topicLessonProgressProvider.notifier).refresh();

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
      } catch (_) {}

      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Hesap silinirken bir hata oluştu: ${e.toString()}',
      );
      return false;
    }
  }

  /// Varsa hata mesajını temizler.
  void clearError() {
    if (state.errorMessage != null) {
      state = state.copyWith(errorMessage: null);
    }
  }
}

/// Global Auth State Provider.
final authProvider = NotifierProvider<AuthNotifier, AuthUserState>(
  AuthNotifier.new,
);
