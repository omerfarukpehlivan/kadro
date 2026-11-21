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
import 'package:kadro/shared/widgets/kadro_confirm_dialog.dart';
import 'package:kadro/shared/widgets/kadro_option_picker_modal.dart';
import 'package:kadro/shared/widgets/kadro_settings_card.dart';
import 'package:kadro/shared/widgets/legal_document_viewer_screen.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Profil sekmesi: Kadro PRO durumu, hedef sınav ve uygulama tercihleri.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _showDeleteAccountDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await KadroConfirmDialog.confirm(
      context,
      icon: PhosphorIconsRegular.trash,
      title: 'Hesabımı ve Verilerimi Sil',
      message:
          'Hesabınızı ve tüm verilerinizi kalıcı olarak silmek istediğinizden emin misiniz?\n\n'
          'Bu işlem geri alınamaz:\n'
          '• Çözdüğünüz tüm testler ve net geçmişiniz\n'
          '• Yanlış Defteri havuzunuz\n'
          '• Günlük çalışma seriniz (streak) ve XP puanlarınız\n'
          '• Varsa bulut hesabınız kalıcı olarak silinecektir.',
      cancelLabel: 'Vazgeç',
      confirmLabel: 'Kalıcı Olarak Sil',
      isDestructive: true,
    );

    if (confirmed && context.mounted) {
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
  }

  Future<void> _showDailyGoalDialog(
    BuildContext context,
    WidgetRef ref,
    int currentGoal,
  ) async {
    final selected = await KadroOptionPickerModal.show<int>(
      context,
      title: 'Günlük Hedef Belirle',
      subtitle: 'Her gün ulaşmak istediğin soru çözme hedefini seç:',
      dialogMaxWidth: 440,
      selectedValue: currentGoal,
      options: const [
        KadroPickerOption(
          value: 30,
          label: '30 soru',
          description: 'Temel tempo · Günde yaklaşık 20–25 dk',
          icon: PhosphorIconsRegular.target,
          selectedIcon: PhosphorIconsFill.target,
        ),
        KadroPickerOption(
          value: 50,
          label: '50 soru',
          description: 'Dengeli tempo · Günde yaklaşık 35–45 dk',
          icon: PhosphorIconsRegular.fire,
          selectedIcon: PhosphorIconsFill.fire,
        ),
        KadroPickerOption(
          value: 100,
          label: '100 soru',
          description: 'Yoğun kamp · Günde 60+ dk seri hazırlık',
          icon: PhosphorIconsRegular.trophy,
          selectedIcon: PhosphorIconsFill.trophy,
        ),
      ],
    );
    if (selected != null) {
      ref.read(studyStatsProvider.notifier).updateDailyGoal(selected);
    }
  }

  Future<void> _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) async {
    final selected = await KadroOptionPickerModal.show<ThemeMode>(
      context,
      title: 'Tema Tercihi',
      subtitle: 'Göz konforuna uygun görünüm modunu seç:',
      dialogMaxWidth: 440,
      selectedValue: currentMode,
      options: const [
        KadroPickerOption(
          value: ThemeMode.system,
          label: 'Sistem',
          description: 'Cihazının açık / koyu temasını otomatik izler',
          icon: PhosphorIconsRegular.deviceMobile,
          selectedIcon: PhosphorIconsFill.deviceMobile,
        ),
        KadroPickerOption(
          value: ThemeMode.light,
          label: 'Açık',
          description: 'Serin gündüz çalışma yüzeyi',
          icon: PhosphorIconsRegular.sun,
          selectedIcon: PhosphorIconsFill.sun,
        ),
        KadroPickerOption(
          value: ThemeMode.dark,
          label: 'Koyu',
          description: 'Gece odaklı düşük göz yorgunluğu',
          icon: PhosphorIconsRegular.moon,
          selectedIcon: PhosphorIconsFill.moon,
        ),
      ],
    );
    if (selected != null) {
      ref.read(userPreferencesProvider.notifier).setThemeMode(selected);
    }
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

  Future<void> _showQuizModeDialog(
    BuildContext context,
    WidgetRef ref,
    QuizMode? currentMode,
  ) async {
    final effectiveCurrentMode = currentMode ?? QuizMode.learning;
    final selected = await KadroOptionPickerModal.show<QuizMode>(
      context,
      title: 'Soru Çözüm Modu',
      subtitle: 'Varsayılan test çözme deneyiminizi seçin:',
      dialogMaxWidth: 480,
      selectedValue: effectiveCurrentMode,
      options: [
        for (final mode in QuizMode.values)
          KadroPickerOption<QuizMode>(
            key: ValueKey('quiz_mode_option_${mode.name}'),
            value: mode,
            label: mode.label,
            description: mode.description,
            icon: mode == QuizMode.learning
                ? PhosphorIconsRegular.lightbulb
                : PhosphorIconsRegular.fileText,
            selectedIcon: mode == QuizMode.learning
                ? PhosphorIconsFill.lightbulb
                : PhosphorIconsFill.fileText,
          ),
      ],
      footerBuilder: (modalCtx) => FilledButton.tonalIcon(
        onPressed: () {
          Navigator.of(modalCtx).pop();
          Navigator.of(context, rootNavigator: true).push(
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
    );
    if (selected != null) {
      ref.read(userPreferencesProvider.notifier).setQuizMode(selected);
    }
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

    const pageHeader = Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: PageHeader(
        title: 'Profilin',
        subtitle: 'Hedef sınavın, abonelik durumun ve uygulama ayarların.',
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
            Navigator.of(
              context,
              rootNavigator: true,
            ).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
          },
        )
      else
        const _ProBadgeCard(),
      AppSpacing.gapMd,
      const SectionTitle('Hedef'),
      KadroSettingsCard(
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
      AppSpacing.gapSm,
      const SectionTitle('Uygulama'),
      KadroSettingsCard(
        children: [
          ListTile(
            leading: const PhosphorIcon(PhosphorIconsRegular.palette, size: 20),
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
          ListTile(
            leading: const PhosphorIcon(PhosphorIconsRegular.sliders, size: 20),
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
          const ListTile(
            leading: PhosphorIcon(PhosphorIconsRegular.bell, size: 20),
            title: Text('Günlük hatırlatma'),
            subtitle: Text('Kapalı'),
          ),
          const ListTile(
            leading: PhosphorIcon(PhosphorIconsRegular.info, size: 20),
            title: Text('Hakkında'),
            subtitle: Text('Kadro 1.0.0'),
          ),
        ],
      ),
      AppSpacing.gapSm,
      const SectionTitle('İçerik Yönetimi'),
      KadroSettingsCard(
        children: [
          ListTile(
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
        ],
      ),
      AppSpacing.gapSm,
      const SectionTitle('Hukuki & Gizlilik'),
      KadroSettingsCard(
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
            onTap: () => LegalDocumentViewerScreen.showTermsOfService(context),
          ),
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
                  rootNavigator: true,
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
