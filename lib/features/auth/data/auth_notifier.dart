import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';

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
  @override
  AuthUserState build() {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (user != null) {
      return AuthUserState(
        isAuthenticated: true,
        userId: user.id,
        email: user.email,
        displayName:
            user.userMetadata?['display_name'] as String? ?? 'Memur Adayı',
      );
    }
    return const AuthUserState();
  }

  /// E-posta ve şifre ile giriş yapar.
  Future<bool> signIn({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      // Yerel / Demo veya Test modu fallback
      if (email.trim().isNotEmpty && password.length >= 6) {
        state = state.copyWith(
          isAuthenticated: true,
          userId: 'demo_user',
          email: email.trim(),
          displayName: email.trim().split('@').first,
          isLoading: false,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Geçersiz e-posta veya şifre (en az 6 karakter).',
        );
        return false;
      }
    }

    try {
      final response = await client.auth.signInWithPassword(
        email: email.trim(),
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
              email.trim().split('@').first,
          isLoading: false,
        );
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

  /// Yeni kullanıcı kaydı oluşturur.
  Future<bool> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      state = state.copyWith(
        isAuthenticated: true,
        userId: 'demo_user',
        email: email.trim(),
        displayName: displayName.trim().isNotEmpty
            ? displayName.trim()
            : 'Memur Adayı',
        isLoading: false,
      );
      return true;
    }

    try {
      final response = await client.auth.signUp(
        email: email.trim(),
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

  /// Oturumu kapatır.
  Future<void> signOut() async {
    try {
      await SupabaseConfig.clientOrNull?.auth.signOut();
    } catch (_) {}
    state = const AuthUserState();
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
