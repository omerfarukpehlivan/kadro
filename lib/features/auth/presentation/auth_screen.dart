import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Giriş Yap ve Kayıt Ol ekranı (AuthScreen).
///
/// Web/Angular Karşılığı:
/// `AuthComponent` / Form modülü. E-posta veya kullanıcı adı ile esnek oturum açma,
/// Google OAuth tek tıkla giriş, şifre sıfırlama modalı ve hesap oluşturmayı yönetir.
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isLogin = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final authNotifier = ref.read(authProvider.notifier);
    bool success;

    if (_isLogin) {
      success = await authNotifier.signIn(
        emailOrUsername: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } else {
      success = await authNotifier.signUp(
        emailOrUsername: _emailController.text.trim(),
        password: _passwordController.text,
        displayName: _nameController.text.trim(),
      );
    }

    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _handleGoogleSignIn() async {
    final success = await ref.read(authProvider.notifier).signInWithGoogle();
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
    }
  }

  /// Şifremi Unuttum modalını açar ve e-posta ile sıfırlama bağlantısı gönderir.
  void _showForgotPasswordModal(BuildContext context) {
    final resetEmailController = TextEditingController();
    final resetFormKey = GlobalKey<FormState>();
    bool isSending = false;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalCtx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final colorScheme = Theme.of(context).colorScheme;
            final textTheme = Theme.of(context).textTheme;

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Form(
                key: resetFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          LucideIcons.keyRound,
                          color: colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Şifre Sıfırlama',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Kayıtlı e-posta adresinizi girin, şifre sıfırlama bağlantısını hemen gönderelim.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: resetEmailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'E-posta Adresi',
                        prefixIcon: Icon(LucideIcons.mail, size: 20),
                      ),
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Lütfen geçerli bir e-posta adresi girin.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: isSending
                          ? null
                          : () async {
                              if (!resetFormKey.currentState!.validate()) {
                                return;
                              }
                              setModalState(() => isSending = true);
                              final success = await ref
                                  .read(authProvider.notifier)
                                  .sendPasswordResetEmail(
                                    resetEmailController.text.trim(),
                                  );
                              setModalState(() => isSending = false);
                              if (context.mounted) {
                                Navigator.of(modalCtx).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      success
                                          ? '✅ Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.'
                                          : '❌ Sıfırlama bağlantısı gönderilemedi.',
                                    ),
                                  ),
                                );
                              }
                            },
                      child: isSending
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Sıfırlama Bağlantısı Gönder'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap / Kayıt Ol')),
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 720,
          padding: EdgeInsets.zero,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: AppSpacing.pagePadding(context),
              children: [
                MascotCoachBanner(
                  mood: MascotMood.coach,
                  badgeLabel: 'BULUT HESABI',
                  title: _isLogin
                      ? 'Tekrar Hoş Geldin!'
                      : 'Kadro Ailesine Katıl!',
                  message: 'Çözdüğün tüm testler, doğru/yanlış analizlerin ve çalışma planın hesabında güvenle saklanır.',
                ),
                AppSpacing.gapLg,
                TactileCard(
                  borderRadius: 20,
                  padding: AppSpacing.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _isLogin ? 'Hesabına Giriş Yap' : 'Yeni Hesap Oluştur',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (!_isLogin) ...[
                        TextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Ad Soyad / Rumuz',
                            prefixIcon: Icon(LucideIcons.user, size: 20),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Lütfen bir ad veya rumuz girin.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                      ],
                      TextFormField(
                        controller: _emailController,
                        keyboardType: _isLogin
                            ? TextInputType.text
                            : TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: _isLogin
                              ? 'E-posta veya Kullanıcı Adı'
                              : 'E-posta veya Kullanıcı Adı',
                          prefixIcon: Icon(
                            _isLogin ? LucideIcons.user : LucideIcons.mail,
                            size: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().length < 3) {
                            return 'Lütfen en az 3 karakterli bir e-posta veya kullanıcı adı girin.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submit(),
                        decoration: const InputDecoration(
                          labelText: 'Şifre (En az 6 karakter)',
                          prefixIcon: Icon(LucideIcons.lock, size: 20),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Şifre en az 6 karakter olmalıdır.';
                          }
                          return null;
                        },
                      ),
                      if (_isLogin)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => _showForgotPasswordModal(context),
                            child: const Text('Şifremi Unuttum?'),
                          ),
                        ),
                      if (authState.errorMessage != null) ...[
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.alertCircle,
                                color: colorScheme.onErrorContainer,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  authState.errorMessage!,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onErrorContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: authState.isLoading ? null : _submit,
                        icon: authState.isLoading
                            ? SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: colorScheme.onPrimary,
                                ),
                              )
                            : Icon(
                                _isLogin
                                    ? LucideIcons.logIn
                                    : LucideIcons.userPlus,
                                size: 18,
                              ),
                        label: Text(
                          authState.isLoading
                              ? 'Lütfen bekleyin...'
                              : (_isLogin ? 'Giriş Yap' : 'Hesap Oluştur'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'VEYA',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.outline,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: authState.isLoading
                            ? null
                            : _handleGoogleSignIn,
                        icon: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.outlineVariant,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'G',
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                        label: const Text('Google ile Devam Et'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                          ref.read(authProvider.notifier).clearError();
                        },
                        child: Text(
                          _isLogin
                              ? 'Hesabın yok mu? Kayıt Ol'
                              : 'Zaten hesabın var mı? Giriş Yap',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Şimdilik Giriş Yapmadan Devam Et',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
