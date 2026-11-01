import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Giriş Yap ve Kayıt Ol ekranı (AuthScreen).
///
/// Web/Angular Karşılığı:
/// `AuthComponent` / Form modülü. Kullanıcı oturum açma, yeni hesap oluşturma,
/// doğrulama ve hata geri bildirimlerini Riverpod `authProvider` üzerinden yönetir.
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
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } else {
      success = await authNotifier.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        displayName: _nameController.text.trim(),
      );
    }

    if (success && mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap / Kayıt Ol')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              MascotCoachBanner(
                mood: MascotMood.coach,
                badgeLabel: 'BULUT HESABI',
                title: _isLogin
                    ? 'Tekrar Hoş Geldin!'
                    : 'Kadro Ailesine Katıl!',
                message: 'Çözdüğün tüm testler, doğru/yanlış analizlerin ve çalışma planın hesabında güvenle saklanır.',
              ),
              const SizedBox(height: 20),
              TactileCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(20),
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
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'E-posta Adresi',
                        prefixIcon: Icon(LucideIcons.mail, size: 20),
                      ),
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Geçerli bir e-posta adresi girin.';
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
                    const SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
