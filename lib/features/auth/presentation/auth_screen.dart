import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/lessons/presentation/curriculum_preview_screen.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/legal_document_viewer_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Giriş Yap ve Kayıt Ol ekranı (AuthScreen).
///
/// Web/Angular karşılığı: AuthComponent / LoginGuard entry component.
class AuthScreen extends ConsumerStatefulWidget {
  /// Uygulama açılış kapısı olarak kullanıldığında true olur (geri tuşu/pop kapatılır).
  final bool isInitialGate;

  const AuthScreen({super.key, this.isInitialGate = false});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isLogin = true;
  bool _obscurePassword = true;
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
    if (success && !widget.isInitialGate && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _handleGoogleSignIn() async {
    final success = await ref.read(authProvider.notifier).signInWithGoogle();
    if (!mounted) return;
    if (success && !widget.isInitialGate && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  void _openGuestCalculator(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.push('/calculator');
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const KpssScoreCalculatorScreen(isGuestMode: true),
      ),
    );
  }

  void _openCurriculumPreview(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.push('/curriculum-preview');
      return;
    }
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const CurriculumPreviewScreen()));
  }

  void _showForgotPasswordModal(BuildContext context) {
    AdaptiveOverlay.showModal<void>(
      context: context,
      dialogMaxWidth: 460,
      builder: (modalCtx) => _ForgotPasswordModalContent(
        initialEmail: _emailController.text.contains('@')
            ? _emailController.text.trim()
            : '',
        onSubmitEmail: (email) =>
            ref.read(authProvider.notifier).sendPasswordResetEmail(email),
        onCompleted: (success) {
          if (modalCtx.mounted) {
            Navigator.of(modalCtx).pop();
          }
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  success
                      ? 'Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.'
                      : 'Sıfırlama bağlantısı gönderilemedi.',
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final authState = ref.watch(authProvider);
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    final authHeader = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TugrulAvatar(
          mood: TugrulMood.coach,
          size: 64,
          ringColor: colorScheme.primary,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isLogin ? 'Hesabına Giriş Yap' : 'Çalışma Geçmişini Eşitle',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Çözdüğün testler, analizlerin ve çalışma planın hesabında güvenle saklanır.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final authCard = TactileCard(
      padding: AppSpacing.cardPadding,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _isLogin ? 'E-posta ile Giriş' : 'Yeni Hesap Oluştur',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            if (!_isLogin) ...[
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.name],
                decoration: const InputDecoration(
                  labelText: 'Ad Soyad / Rumuz',
                  prefixIcon: PhosphorIcon(PhosphorIconsRegular.user, size: 18),
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
                  ? TextInputType.emailAddress
                  : TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: _isLogin
                  ? const [AutofillHints.username, AutofillHints.email]
                  : const [AutofillHints.email],
              decoration: InputDecoration(
                labelText: 'E-posta veya Kullanıcı Adı',
                prefixIcon: PhosphorIcon(
                  _isLogin
                      ? PhosphorIconsRegular.user
                      : PhosphorIconsRegular.envelope,
                  size: 18,
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
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              autofillHints: _isLogin
                  ? const [AutofillHints.password]
                  : const [AutofillHints.newPassword],
              decoration: InputDecoration(
                labelText: 'Şifre (En az 6 karakter)',
                prefixIcon: const PhosphorIcon(
                  PhosphorIconsRegular.lock,
                  size: 18,
                ),
                suffixIcon: IconButton(
                  key: const ValueKey('auth_password_visibility_toggle'),
                  tooltip: _obscurePassword
                      ? 'Şifreyi göster'
                      : 'Şifreyi gizle',
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  icon: PhosphorIcon(
                    _obscurePassword
                        ? PhosphorIconsRegular.eye
                        : PhosphorIconsRegular.eyeSlash,
                    size: 18,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Şifre en az 6 karakter olmalıdır.';
                }
                return null;
              },
              onFieldSubmitted: (_) => _submit(),
            ),
            if (_isLogin) ...[
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: authState.isLoading
                      ? null
                      : () => _showForgotPasswordModal(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    minimumSize: const Size(0, 40),
                  ),
                  child: Text(
                    'Şifremi Unuttum?',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
            if (authState.errorMessage != null) ...[
              const SizedBox(height: 12),
              Semantics(
                liveRegion: true,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    authState.errorMessage!,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 18),
            FilledButton(
              onPressed: authState.isLoading ? null : _submit,
              child: authState.isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.onPrimary,
                      ),
                    )
                  : Text(_isLogin ? 'Giriş Yap' : 'Kayıt Ol'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'veya',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: authState.isLoading ? null : _handleGoogleSignIn,
              icon: Text(
                'G',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              label: const Text('Google ile Devam Et'),
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
    );

    final guestShortcutButtons = Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 8,
      children: [
        OutlinedButton.icon(
          key: const ValueKey('auth_guest_calculator_button'),
          onPressed: () => _openGuestCalculator(context),
          icon: const PhosphorIcon(PhosphorIconsRegular.calculator, size: 16),
          label: const Text('Hemen Puan Hesapla'),
        ),
        OutlinedButton.icon(
          key: const ValueKey('auth_guest_curriculum_button'),
          onPressed: () => _openCurriculumPreview(context),
          icon: const PhosphorIcon(PhosphorIconsRegular.books, size: 16),
          label: const Text('Müfredatı İncele'),
        ),
      ],
    );

    final continueWithoutLogin = Center(
      child: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(
          'Şimdilik Giriş Yapmadan Devam Et',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );

    final legalFooter = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'Devam ederek ',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          InkWell(
            onTap: () => LegalDocumentViewerScreen.showTermsOfService(context),
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: Text(
                'Kullanım Koşulları',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Text(
            ' ve ',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          InkWell(
            onTap: () => LegalDocumentViewerScreen.showPrivacyPolicy(context),
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: Text(
                'Gizlilik Politikası',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Text(
            '\'nı kabul etmiş sayılırsınız.',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !widget.isInitialGate,
        title: const Text('Giriş Yap / Kayıt Ol'),
      ),
      body: SafeArea(
        child: isSplitPane
            ? ResponsiveContentWrapper(
                maxWidth: 1200,
                padding: EdgeInsets.zero,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: AppSpacing.pagePadding(context),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: _DesktopAuthShowcasePanel(
                            onOpenCalculator: () =>
                                _openGuestCalculator(context),
                            onOpenCurriculum: () =>
                                _openCurriculumPreview(context),
                          ),
                        ),
                        const SizedBox(width: 28),
                        Expanded(
                          flex: 5,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                authHeader,
                                AppSpacing.gapMd,
                                authCard,
                                const SizedBox(height: 10),
                                if (!widget.isInitialGate) ...[
                                  continueWithoutLogin,
                                  const SizedBox(height: 10),
                                ],
                                legalFooter,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : ResponsiveContentWrapper(
                maxWidth: 720,
                padding: EdgeInsets.zero,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: AppSpacing.pagePadding(context),
                    children: [
                      authHeader,
                      AppSpacing.gapLg,
                      authCard,
                      const SizedBox(height: 14),
                      guestShortcutButtons,
                      const SizedBox(height: 10),
                      continueWithoutLogin,
                      const SizedBox(height: 16),
                      legalFooter,
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

/// Masaüstü giriş kapısında (`>= 960px`) Kadro'nun çoklu KPSS ekosistemini
/// tanıtan ve oturum açmadan misafir araçlara geçiş sunan sol vitrin paneli (`TASK-151`).
class _DesktopAuthShowcasePanel extends StatelessWidget {
  final VoidCallback onOpenCalculator;
  final VoidCallback onOpenCurriculum;

  const _DesktopAuthShowcasePanel({
    required this.onOpenCalculator,
    required this.onOpenCurriculum,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TactileCard(
          backgroundColor: colorScheme.primaryContainer.withAlpha(110),
          borderColor: colorScheme.primary.withAlpha(120),
          lipColor: colorScheme.primary.withAlpha(150),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TugrulAvatar(
                    mood: TugrulMood.victory,
                    size: 74,
                    ringColor: colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: colorScheme.primary.withAlpha(80),
                            ),
                          ),
                          child: Text(
                            'KPSS · E-KPSS · DHBT · MEB-AGS',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Kadro Masaüstü Çalışma Stüdyosu',
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Sınav hazırlığını telefon, tablet ve masaüstü tarayıcında kesintisiz sürdür; ÖSYM çeldirici tuzaklarını anında analiz et.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  FilledButton.tonalIcon(
                    key: const ValueKey('auth_desktop_guest_calculator_button'),
                    onPressed: onOpenCalculator,
                    icon: const PhosphorIcon(
                      PhosphorIconsRegular.calculator,
                      size: 16,
                    ),
                    label: const Text('Hemen Puan Hesapla (Misafir)'),
                  ),
                  OutlinedButton.icon(
                    key: const ValueKey('auth_desktop_guest_curriculum_button'),
                    onPressed: onOpenCurriculum,
                    icon: const PhosphorIcon(
                      PhosphorIconsRegular.books,
                      size: 16,
                    ),
                    label: const Text('Müfredatı İncele'),
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacing.gapMd,
        const _ShowcaseFeatureTile(
          icon: PhosphorIconsFill.warningCircle,
          title: 'UWorld Modeli ÖSYM Çeldirici Analizi',
          description: 'Her soruda adayı tuzağa düşüren çeldirici şıkkın nedeni sağ panelde anında açıklanır.',
        ),
        AppSpacing.gapSm,
        const _ShowcaseFeatureTile(
          icon: PhosphorIconsFill.mapTrifold,
          title: 'Dilsiz 81 İl Harita & Pratik Atölyesi',
          description: 'Coğrafya, Millî Mücadele haritaları, bilgi kartları ve puan hesaplama tek çatı altında.',
        ),
        AppSpacing.gapSm,
        const _ShowcaseFeatureTile(
          icon: PhosphorIconsFill.keyboard,
          title: 'Klavye Kısayollarıyla Hızlı Çözüm',
          description: 'A–E seçimi, Shift+A–E şık eleme ve Ctrl+K komut paletiyle tarayıcıda akıcı pratik.',
        ),
      ],
    );
  }
}

class _ShowcaseFeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ShowcaseFeatureTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(icon, size: 18, color: colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ForgotPasswordModalContent extends StatefulWidget {
  final String initialEmail;
  final Future<bool> Function(String email) onSubmitEmail;
  final ValueChanged<bool> onCompleted;

  const _ForgotPasswordModalContent({
    required this.initialEmail,
    required this.onSubmitEmail,
    required this.onCompleted,
  });

  @override
  State<_ForgotPasswordModalContent> createState() =>
      _ForgotPasswordModalContentState();
}

class _ForgotPasswordModalContentState
    extends State<_ForgotPasswordModalContent> {
  final _resetFormKey = GlobalKey<FormState>();
  late final TextEditingController _resetEmailController;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _resetEmailController = TextEditingController(text: widget.initialEmail);
  }

  @override
  void dispose() {
    _resetEmailController.dispose();
    super.dispose();
  }

  Future<void> _submitReset() async {
    if (!_resetFormKey.currentState!.validate()) return;
    setState(() => _isSending = true);
    final success = await widget.onSubmitEmail(
      _resetEmailController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _isSending = false);
    widget.onCompleted(success);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: AutofillGroup(
        child: Form(
          key: _resetFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 36,
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
                  PhosphorIcon(
                    PhosphorIconsRegular.key,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text('Şifre Sıfırlama', style: textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Kayıtlı e-posta adresinizi girin, şifre sıfırlama bağlantısını gönderelim.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _resetEmailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  labelText: 'E-posta Adresi',
                  prefixIcon: PhosphorIcon(
                    PhosphorIconsRegular.envelope,
                    size: 18,
                  ),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Lütfen geçerli bir e-posta adresi girin.';
                  }
                  return null;
                },
                onFieldSubmitted: (_) => _isSending ? null : _submitReset(),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _isSending ? null : _submitReset,
                child: _isSending
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
      ),
    );
  }
}
