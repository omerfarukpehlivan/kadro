import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Profil sekmesi: Kadro PRO durumu, hedef sınav ve uygulama tercihleri.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  void _showDailyGoalDialog(
    BuildContext context,
    WidgetRef ref,
    int currentGoal,
  ) {
    showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Günlük Hedef Belirle'),
          children: [30, 50, 100].map((goal) {
            return SimpleDialogOption(
              onPressed: () {
                ref.read(studyStatsProvider.notifier).updateDailyGoal(goal);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$goal soru'),
                    if (goal == currentGoal)
                      Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  void _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) {
    showDialog<ThemeMode>(
      context: context,
      builder: (context) {
        const options = [
          (ThemeMode.system, 'Sistem'),
          (ThemeMode.light, 'Açık'),
          (ThemeMode.dark, 'Koyu'),
        ];

        return SimpleDialog(
          title: const Text('Tema Tercihi'),
          children: options.map((option) {
            final mode = option.$1;
            final label = option.$2;
            return SimpleDialogOption(
              onPressed: () {
                ref.read(userPreferencesProvider.notifier).setThemeMode(mode);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(label),
                    if (mode == currentMode)
                      Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  String _themeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Sistem';
      case ThemeMode.light:
        return 'Açık';
      case ThemeMode.dark:
        return 'Koyu';
    }
  }

  void _showQuizModeDialog(
    BuildContext context,
    WidgetRef ref,
    QuizMode currentMode,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Soru Çözüm Modu'),
          children: QuizMode.values.map((mode) {
            final isSelected = mode == currentMode;
            final colorScheme = Theme.of(context).colorScheme;
            final textTheme = Theme.of(context).textTheme;
            return SimpleDialogOption(
              onPressed: () {
                ref.read(userPreferencesProvider.notifier).setQuizMode(mode);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mode.label,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isSelected ? colorScheme.primary : null,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            mode.description,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Icon(Icons.check, color: colorScheme.primary, size: 20),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  String _quizModeLabel(QuizMode mode) {
    switch (mode) {
      case QuizMode.learning:
        return 'Öğrenme';
      case QuizMode.exam:
        return 'Sınav';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final prefs = ref.watch(userPreferencesProvider);
    final stats = ref.watch(studyStatsProvider);
    final auth = ref.watch(authProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: Icons.person,
          title: 'Profilin',
          subtitle: 'Hedef sınavın, abonelik durumun ve uygulama ayarların.',
        ),
        const SizedBox(height: 16),

        // Bulut Hesap Durumu Kartı (Giriş yapılmışsa kullanıcı bilgisi, yapılmamışsa giriş butonu)
        _AccountCard(auth: auth),
        const SizedBox(height: 16),

        // KPSS Hedef Sihirbazı Kartı
        _StudyGoalWizardCard(prefs: prefs),
        const SizedBox(height: 16),

        // PRO Durum Kartı (PRO değilse tanıtım banner'ı, PRO ise üyelik kartı)
        if (!prefs.isPro)
          _ProBannerCard(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
            },
          )
        else
          const _ProBadgeCard(),
        const SizedBox(height: 16),

        const SectionTitle('Hedef'),
        TactileCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.outlineVariant,
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.flag_outlined),
                title: Text('Hedef sınav'),
                trailing: Text('KPSS Lisans'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.today_outlined),
                title: const Text('Günlük hedef'),
                trailing: Text('${stats.dailyGoal} soru'),
                onTap: () =>
                    _showDailyGoalDialog(context, ref, stats.dailyGoal),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        const SectionTitle('Uygulama'),
        TactileCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.outlineVariant,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: const Text('Tema'),
                trailing: Text(_themeModeLabel(prefs.themeMode)),
                onTap: () => _showThemeDialog(context, ref, prefs.themeMode),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.tune_outlined),
                title: const Text('Soru Çözüm Modu'),
                trailing: Text(_quizModeLabel(prefs.defaultQuizMode)),
                onTap: () =>
                    _showQuizModeDialog(context, ref, prefs.defaultQuizMode),
              ),
              const Divider(height: 1),
              const ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text('Günlük hatırlatma'),
                trailing: Text('Kapalı'),
              ),
              const Divider(height: 1),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Hakkında'),
                subtitle: Text('Kadro 1.0.0'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Kullanıcının Supabase bulut oturum durumunu gösteren hesap kartı.
class _AccountCard extends ConsumerWidget {
  final AuthUserState auth;

  const _AccountCard({required this.auth});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (!auth.isAuthenticated) {
      return TactileCard(
        backgroundColor: colorScheme.surface,
        borderColor: colorScheme.primary.withAlpha(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LucideIcons.cloud,
                    color: colorScheme.onPrimaryContainer,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'İlerlemeni Buluta Kaydet',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Çözdüğün testleri ve doğru/yanlışlarını kaybetmemek için giriş yap.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const AuthScreen()));
              },
              child: const Text('Giriş Yap / Kayıt Ol'),
            ),
          ],
        ),
      );
    }

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              LucideIcons.userCheck,
              color: colorScheme.onPrimaryContainer,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auth.displayName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (auth.email != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    auth.email!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          TextButton(
            onPressed: () => ref.read(authProvider.notifier).signOut(),
            child: const Text('Çıkış Yap'),
          ),
        ],
      ),
    );
  }
}

/// PRO olmayan kullanıcılar için satın alma teşvik kartı (Kraliyet Taçlı Kadro Koçu ile).
class _ProBannerCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ProBannerCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      onTap: onTap,
      backgroundColor: colorScheme.primaryContainer.withAlpha(110),
      borderColor: colorScheme.primary.withAlpha(120),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: colorScheme.tertiary, width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/mascot/tugrul_pro.png',
                width: 52,
                height: 52,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.star, color: colorScheme.primary),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kadro PRO\'ya Yükselt',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Sınırsız soru, akıllı yanlış defteri ve reklamsız çalışma.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}

/// Kadro PRO abonesi kullanıcılara gösterilen rozet kartı (Kraliyet Taçlı Kadro Koçu ile).
class _ProBadgeCard extends StatelessWidget {
  const _ProBadgeCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.secondaryContainer,
      borderColor: colorScheme.outlineVariant,
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: colorScheme.tertiary, width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/mascot/tugrul_pro.png',
                width: 52,
                height: 52,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.workspace_premium, color: colorScheme.primary),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kadro PRO Üyesi 👑',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
                Text(
                  'Tüm özellikler ve sınırsız soru çözümü aktif.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
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

class _StudyGoalWizardCard extends StatelessWidget {
  final UserPreferencesState prefs;

  const _StudyGoalWizardCard({required this.prefs});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.compass,
                  color: colorScheme.onTertiaryContainer,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KPSS Hedefim: ${prefs.targetKpssScore}+ Puan',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Odak Ders: ${prefs.focusLesson} · Günlük Hedef: ${prefs.targetDailyStudyGoal} Soru',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton.tonalIcon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OnboardingScreen()),
              );
            },
            icon: const Icon(LucideIcons.compass, size: 18),
            label: const Text('Hedef Sihirbazını Aç'),
          ),
        ],
      ),
    );
  }
}
