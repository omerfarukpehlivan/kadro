import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/profile/presentation/widgets/achievement_showcase.dart';
import 'package:kadro/features/profile/presentation/widgets/candidate_hero_card.dart';
import 'package:kadro/features/profile/presentation/widgets/profile_metrics_card.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/reports/presentation/admin_reports_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/legal_document_viewer_screen.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Profil sekmesi: Kadro PRO durumu, hedef sınav ve uygulama tercihleri.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Hesabımı ve Verilerimi Sil'),
          content: const Text(
            'Hesabınızı ve tüm verilerinizi kalıcı olarak silmek istediğinizden emin misiniz?\n\n'
            'Bu işlem geri alınamaz:\n'
            '• Çözdüğünüz tüm testler ve net geçmişiniz\n'
            '• Yanlış Defteri havuzunuz\n'
            '• Günlük çalışma seriniz (streak) ve XP puanlarınız\n'
            '• Varsa bulut hesabınız kalıcı olarak silinecektir.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Vazgeç'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Kalıcı Olarak Sil'),
            ),
          ],
        );
      },
    ).then((confirmed) async {
      if (confirmed == true && context.mounted) {
        final success = await ref
            .read(authProvider.notifier)
            .deleteAccountAndData();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                success
                    ? 'Hesabınız ve tüm verileriniz başarıyla silindi.'
                    : 'Hesap silinirken bir sorun oluştu.',
              ),
            ),
          );
        }
      }
    });
  }

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
                      PhosphorIcon(
                        PhosphorIconsBold.check,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
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
                      PhosphorIcon(
                        PhosphorIconsBold.check,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
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
    QuizMode? currentMode,
  ) {
    final effectiveCurrentMode = currentMode ?? QuizMode.learning;
    AdaptiveOverlay.showModal<void>(
      context: context,
      title: 'Soru Çözüm Modu',
      dialogMaxWidth: 480,
      builder: (modalCtx) {
        final colorScheme = Theme.of(modalCtx).colorScheme;
        final textTheme = Theme.of(modalCtx).textTheme;
        final isDialog = ResponsiveBreakpoints.usesDialogOverlay(modalCtx);

        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20,
            isDialog ? 16 : 12,
            20,
            isDialog ? 20 : 28,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isDialog) ...[
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
                const SizedBox(height: 12),
                Text(
                  'Soru Çözüm Modu',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                'Varsayılan test çözme deneyiminizi seçin:',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 14),
              for (final mode in QuizMode.values) ...[
                _QuizModeOptionCard(
                  mode: mode,
                  isSelected: mode == effectiveCurrentMode,
                  onTap: () {
                    ref
                        .read(userPreferencesProvider.notifier)
                        .setQuizMode(mode);
                    Navigator.of(modalCtx).pop();
                  },
                ),
                const SizedBox(height: 10),
              ],
              const Divider(height: 20),
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(modalCtx).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(
                        mode: effectiveCurrentMode,
                        customTitle: '${effectiveCurrentMode.label} Testi',
                        limit: 10,
                      ),
                    ),
                  );
                },
                icon: const PhosphorIcon(PhosphorIconsBold.play, size: 16),
                label: const Text('Bu Modla Hemen 10 Soru Çöz'),
              ),
            ],
          ),
        );
      },
    );
  }

  String _quizModeLabel(QuizMode? mode) {
    final effective = mode ?? QuizMode.learning;
    switch (effective) {
      case QuizMode.learning:
        return 'Öğrenme';
      case QuizMode.exam:
        return 'Sınav';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final prefs = ref.watch(userPreferencesProvider);
    final stats = ref.watch(studyStatsProvider);
    final auth = ref.watch(authProvider);

    final pageHeader = Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profilin',
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Hedef sınavın, abonelik durumun ve uygulama ayarların.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );

    final overviewBlocks = <Widget>[
      CandidateHeroCard(auth: auth, prefs: prefs),
      AppSpacing.gapMd,
      ProfileMetricsCard(stats: stats),
      AppSpacing.gapMd,
      AchievementShowcase(stats: stats),
    ];

    final settingsBlocks = <Widget>[
      _AccountCard(auth: auth),
      AppSpacing.gapMd,
      if (!prefs.isPro)
        _ProBannerCard(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
          },
        )
      else
        const _ProBadgeCard(),
      AppSpacing.gapMd,
      const SectionTitle('Hedef'),
      TactileCard(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          children: [
            ListTile(
              key: const ValueKey('profile_target_exam_tile'),
              leading: const PhosphorIcon(PhosphorIconsRegular.flag, size: 20),
              title: const Text('Hedef sınav'),
              subtitle: Text(
                prefs.examSelection.displayTitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () => TargetExamSelectorBottomSheet.showSelection(
                context,
                currentSelection: prefs.examSelection,
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const PhosphorIcon(
                PhosphorIconsRegular.calendar,
                size: 20,
              ),
              title: const Text('Günlük hedef'),
              subtitle: Text(
                '${stats.dailyGoal} soru',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () => _showDailyGoalDialog(context, ref, stats.dailyGoal),
            ),
          ],
        ),
      ),
      AppSpacing.gapSm,
      const SectionTitle('Uygulama'),
      TactileCard(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          children: [
            ListTile(
              leading: const PhosphorIcon(
                PhosphorIconsRegular.palette,
                size: 20,
              ),
              title: const Text('Tema'),
              subtitle: Text(
                _themeModeLabel(prefs.themeMode),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () => _showThemeDialog(context, ref, prefs.themeMode),
            ),
            const Divider(height: 1),
            SwitchListTile(
              key: const ValueKey('profile_high_readability_switch'),
              secondary: const PhosphorIcon(PhosphorIconsRegular.eye, size: 20),
              title: const Text('Yüksek Okunabilirlik (E-KPSS Modu)'),
              subtitle: const Text(
                'Soru ve şık metinlerini büyütür, kontrast çerçevesini güçlendirir.',
              ),
              value: prefs.highReadabilityMode,
              onChanged: (value) => ref
                  .read(userPreferencesProvider.notifier)
                  .setHighReadabilityMode(value),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const PhosphorIcon(
                PhosphorIconsRegular.sliders,
                size: 20,
              ),
              title: const Text('Soru Çözüm Modu'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _quizModeLabel(prefs.defaultQuizMode),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    prefs.defaultQuizMode == QuizMode.learning
                        ? 'Anında doğru/yanlış ve açıklama'
                        : 'Sınav mantığıyla optik gizli çözüm',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () =>
                  _showQuizModeDialog(context, ref, prefs.defaultQuizMode),
            ),
            const Divider(height: 1),
            const ListTile(
              leading: PhosphorIcon(PhosphorIconsRegular.bell, size: 20),
              title: Text('Günlük hatırlatma'),
              subtitle: Text('Kapalı'),
            ),
            const Divider(height: 1),
            const ListTile(
              leading: PhosphorIcon(PhosphorIconsRegular.info, size: 20),
              title: Text('Hakkında'),
              subtitle: Text('Kadro 1.0.0'),
            ),
          ],
        ),
      ),
      AppSpacing.gapSm,
      const SectionTitle('İçerik Yönetimi'),
      TactileCard(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: ListTile(
          leading: const PhosphorIcon(
            PhosphorIconsRegular.warningCircle,
            size: 20,
          ),
          title: const Text('Hatalı Soru Raporları'),
          subtitle: const Text('İçerik editörü inceleme paneli'),
          trailing: const PhosphorIcon(
            PhosphorIconsRegular.caretRight,
            size: 16,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AdminReportsScreen()),
            );
          },
        ),
      ),
      AppSpacing.gapSm,
      const SectionTitle('Hukuki & Gizlilik'),
      TactileCard(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          children: [
            ListTile(
              leading: const PhosphorIcon(
                PhosphorIconsRegular.shieldCheck,
                size: 20,
              ),
              title: const Text('Gizlilik Politikası & KVKK'),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () => LegalDocumentViewerScreen.showPrivacyPolicy(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const PhosphorIcon(
                PhosphorIconsRegular.fileText,
                size: 20,
              ),
              title: const Text('Kullanım Koşulları & Sözleşme'),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () =>
                  LegalDocumentViewerScreen.showTermsOfService(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const PhosphorIcon(
                PhosphorIconsRegular.certificate,
                size: 20,
              ),
              title: const Text('Açık Kaynak Lisansları'),
              trailing: const PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
              ),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: 'Kadro: KPSS Genel Kültür',
                  applicationVersion: '1.0.0',
                  applicationLegalese:
                      '© 2026 Kadro Ekibi. Tüm hakları saklıdır.',
                );
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: PhosphorIcon(
                PhosphorIconsRegular.trash,
                size: 20,
                color: colorScheme.error,
              ),
              title: Text(
                'Hesabımı ve Verilerimi Sil',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text('Google Play & KVKK veri tasfiyesi'),
              onTap: () => _showDeleteAccountDialog(context, ref),
            ),
          ],
        ),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final useTwoColumn =
            constraints.maxWidth >= 880 &&
            !ResponsiveBreakpoints.isCompact(context);

        if (useTwoColumn) {
          return ResponsiveContentWrapper(
            maxWidth: 1240,
            padding: EdgeInsets.zero,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: AppSpacing.pagePadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    pageHeader,
                    AppSpacing.gapMd,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: overviewBlocks,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: settingsBlocks,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        }

        return ResponsiveContentWrapper(
          maxWidth: 720,
          padding: EdgeInsets.zero,
          child: Scrollbar(
            child: ListView(
              padding: AppSpacing.pagePadding(context),
              children: [
                pageHeader,
                AppSpacing.gapMd,
                ...overviewBlocks,
                AppSpacing.gapMd,
                ...settingsBlocks,
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AccountCard extends ConsumerWidget {
  final AuthUserState auth;

  const _AccountCard({required this.auth});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (!auth.isAuthenticated) {
      return TactileCard(
        borderColor: colorScheme.primary.withAlpha(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsRegular.cloud,
                  color: colorScheme.primary,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'İlerlemeni Buluta Kaydet',
                        style: theme.textTheme.titleSmall,
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
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsRegular.userCheck,
            color: colorScheme.secondary,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(auth.displayName, style: theme.textTheme.titleSmall),
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

class _ProBannerCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ProBannerCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      onTap: onTap,
      backgroundColor: Color.alphaBlend(
        colorScheme.tertiaryContainer.withAlpha(110),
        colorScheme.surface,
      ),
      borderColor: colorScheme.tertiary,
      lipColor: colorScheme.tertiary,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.tertiary.withAlpha(110),
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(
              PhosphorIconsFill.crown,
              color: colorScheme.onTertiaryContainer,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kadro PRO\'ya Yükselt',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
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
          PhosphorIcon(
            PhosphorIconsRegular.caretRight,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}

class _ProBadgeCard extends StatelessWidget {
  const _ProBadgeCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.secondaryContainer,
      borderColor: colorScheme.secondary,
      lipColor: colorScheme.secondary,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.secondary.withAlpha(32),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(
              PhosphorIconsFill.crown,
              color: colorScheme.onSecondaryContainer,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kadro PRO Üyesi',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w700,
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

/// Soru Çözüm Modu seçim modalında her modu tıklanabilir, radyo göstergeli
/// dokunsal kart (`TactileCard`) olarak sunan bileşen.
class _QuizModeOptionCard extends StatelessWidget {
  final QuizMode mode;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuizModeOptionCard({
    required this.mode,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isLearning = mode == QuizMode.learning;

    final iconData = isLearning
        ? (isSelected
              ? PhosphorIconsFill.lightbulb
              : PhosphorIconsRegular.lightbulb)
        : (isSelected
              ? PhosphorIconsFill.fileText
              : PhosphorIconsRegular.fileText);

    return Semantics(
      button: true,
      selected: isSelected,
      label: '${mode.label}. ${mode.description}',
      child: TactileCard(
        key: ValueKey('quiz_mode_option_${mode.name}'),
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        backgroundColor: isSelected
            ? Color.alphaBlend(
                colorScheme.primaryContainer.withAlpha(110),
                colorScheme.surface,
              )
            : colorScheme.surface,
        borderColor: isSelected
            ? colorScheme.primary
            : colorScheme.outlineVariant,
        borderWidth: isSelected ? 2.0 : 1.5,
        lipColor: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primaryContainer
                    : colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? colorScheme.primary.withAlpha(90)
                      : colorScheme.outlineVariant,
                ),
              ),
              alignment: Alignment.center,
              child: PhosphorIcon(
                iconData,
                size: 19,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      Text(
                        mode.label,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? colorScheme.primary
                              : colorScheme.onSurface,
                        ),
                      ),
                      if (isSelected)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Seçili',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    mode.description,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (isSelected)
              PhosphorIcon(
                PhosphorIconsFill.checkCircle,
                color: colorScheme.primary,
                size: 22,
              )
            else
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.outline, width: 1.8),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
