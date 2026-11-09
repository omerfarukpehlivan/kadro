import 'dart:async' show StreamSubscription, unawaited;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
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
  final String? errorMessage;

  const AuthUserState({
    this.isAuthenticated = false,
    this.userId,
    this.email,
    this.displayName = 'Memur Adayı',
    this.isLoading = false,
    this.errorMessage,
  });

  AuthUserState copyWith({
    bool? isAuthenticated,
    String? userId,
    String? email,
    String? displayName,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthUserState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

/// Supabase Auth ve yerel oturum durum yöneticisi.
///
/// Web/Angular karşılığı: AuthService / AuthStore (Supabase Auth Wrapper).
class AuthNotifier extends Notifier<AuthUserState> {
  StreamSubscription<AuthState>? _authSubscription;

  /// Yeni cihazda veya ilk oturum açılışında tüm bulut verilerini (XP, seri, oturumlar,
  /// tercihler, hedef sınav, çalışma planı ve yanlış defteri) yerel state ile birleştirir.
  Future<void> _hydrateAllFromCloud() async {
    try {
      await ref.read(studyStatsProvider.notifier).loadFromCloud();
    } catch (_) {}
    try {
      await ref.read(userPreferencesProvider.notifier).loadFromCloud();
    } catch (_) {}
    try {
      await ref.read(studyPlannerProvider.notifier).loadTasksFromCloud();
    } catch (_) {}
    try {
      await const MistakeRepository().hydrateFromCloud();
    } catch (_) {}
  }

  @override
  AuthUserState build() {
    final client = SupabaseConfig.clientOrNull;

    if (client != null && _authSubscription == null) {
      _authSubscription = client.auth.onAuthStateChange.listen((data) {
        final user = data.session?.user;
        if (user != null) {
          state = state.copyWith(
            isAuthenticated: true,
            userId: user.id,
            email: user.email,
            displayName:
                user.userMetadata?['display_name'] as String? ??
                user.userMetadata?['full_name'] as String? ??
                (user.email?.split('@').first ?? 'Memur Adayı'),
            isLoading: false,
            errorMessage: null,
          );
          unawaited(_hydrateAllFromCloud());
        } else if (data.event == AuthChangeEvent.signedOut) {
          state = const AuthUserState();
          ref.read(studyStatsProvider.notifier).reset();
          ref.read(userPreferencesProvider.notifier).reset();
          ref.read(studyPlannerProvider.notifier).reset();
          const MistakeRepository().clearLocal();
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
          userId: 'demo_user',
          email: effectiveEmail,
          displayName: displayName,
          isLoading: false,
        );
        unawaited(_hydrateAllFromCloud());
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
      final user = response.user;
      if (user != null) {
        state = state.copyWith(
          isAuthenticated: true,
          userId: user.id,
          email: user.email,
          displayName:
              user.userMetadata?['display_name'] as String? ??
              (user.email?.split('@').first ?? 'Memur Adayı'),
          isLoading: false,
        );
        unawaited(_hydrateAllFromCloud());
        return true;
      }
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Giriş yapılamadı, lütfen bilgilerinizi kontrol edin.',
      );
      return false;
    } catch (e) {
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
        userId: 'demo_user',
        email: effectiveEmail,
        displayName: displayName.trim().isNotEmpty
            ? displayName.trim()
            : (rawIdentifier.contains('@')
                  ? rawIdentifier.split('@').first
                  : rawIdentifier),
        isLoading: false,
      );
      unawaited(_hydrateAllFromCloud());
      return true;
    }

    try {
      final response = await client.auth.signUp(
        email: effectiveEmail,
        password: password,
        data: {'display_name': displayName.trim()},
      );
      final user = response.user;
      if (user != null) {
        state = state.copyWith(
          isAuthenticated: true,
          userId: user.id,
          email: user.email,
          displayName: displayName.trim(),
          isLoading: false,
        );
        unawaited(_hydrateAllFromCloud());
        return true;
      }
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Kayıt başarısız oldu.',
      );
      return false;
    } catch (e) {
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
        userId: 'google_demo_user',
        email: 'demo_kpss@gmail.com',
        displayName: 'Google ile Giriş Yapan Aday',
        isLoading: false,
      );
      unawaited(_hydrateAllFromCloud());
      return true;
    }
    try {
      final String? effectiveRedirectTo;
      if (kIsWeb) {
        effectiveRedirectTo = Uri.base.origin;
      } else {
        effectiveRedirectTo = 'com.omer.kadro://login-callback';
      }

      final res = await client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: effectiveRedirectTo,
      );
      state = state.copyWith(isLoading: false);
      return res;
    } catch (e) {
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
      state = state.copyWith(
        errorMessage:
            'Şifre sıfırlama bağlantısı gönderilemedi: ${e.toString()}',
      );
      return false;
    }
  }

  /// Oturumu kapatır ve yerel state ile kullanıcı cache'ini temizler.
  Future<void> signOut() async {
    try {
      await SupabaseConfig.clientOrNull?.auth.signOut();
    } catch (_) {}
    state = const AuthUserState();
    ref.read(studyStatsProvider.notifier).reset();
    ref.read(userPreferencesProvider.notifier).reset();
    ref.read(studyPlannerProvider.notifier).reset();
    const MistakeRepository().clearLocal();
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
