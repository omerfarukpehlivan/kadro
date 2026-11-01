import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(userPreferencesProvider);
    final stats = ref.watch(studyStatsProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: Icons.person,
          title: 'Profilin',
          subtitle: 'Hedef sınavın, abonelik durumun ve uygulama ayarların.',
        ),
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
        Card(
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
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: const Text('Tema'),
                trailing: Text(_themeModeLabel(prefs.themeMode)),
                onTap: () => _showThemeDialog(context, ref, prefs.themeMode),
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

/// PRO olmayan kullanıcılar için satın alma teşvik kartı.
class _ProBannerCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ProBannerCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: colorScheme.surface,
                child: Icon(Icons.star, color: colorScheme.primary),
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
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sınırsız soru, akıllı yanlış defteri ve reklamsız çalışma.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Kadro PRO abonesi kullanıcılara gösterilen rozet kartı.
class _ProBadgeCard extends StatelessWidget {
  const _ProBadgeCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: colorScheme.surface,
              child: Icon(Icons.workspace_premium, color: colorScheme.primary),
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
      ),
    );
  }
}
