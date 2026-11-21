import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/ad_service.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kadro PRO abonelik seçenekleri ve ödüllü soru hakkı ekranı (Paywall).
///
/// Telefon ve tablet için uygulama içi satın alma ve abonelik geri yükleme sunar.
class PaywallScreen extends ConsumerStatefulWidget {
  final String? reasonMessage;

  const PaywallScreen({super.key, this.reasonMessage});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  SubscriptionPlan _selectedPlan = SubscriptionPlan.yearly;
  bool _isLoading = false;

  Future<void> _handlePurchase() async {
    setState(() => _isLoading = true);
    final auth = ref.read(authProvider);

    final result = await PurchaseService.initiatePurchase(
      _selectedPlan,
      userId: auth.userId,
      email: auth.email,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result.isProGranted) {
      ref.read(userPreferencesProvider.notifier).upgradeToPro();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${_selectedPlan.title} aktifleşti.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            result.errorMessage ??
                'Satın alma işlemi tamamlanamadı veya iptal edildi.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _handleRestore() async {
    setState(() => _isLoading = true);

    final restored = await PurchaseService.restorePurchases();

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (restored) {
      ref.read(userPreferencesProvider.notifier).upgradeToPro();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kadro PRO aboneliğin başarıyla doğrulandı.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Geri yüklenebilecek aktif bir abonelik bulunamadı.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final supportsAds = AdService.isRewardedAdSupported;

    final heroCard = TactileCard(
      backgroundColor: Color.alphaBlend(
        colorScheme.primaryContainer.withAlpha(115),
        colorScheme.surface,
      ),
      borderColor: colorScheme.tertiary,
      lipColor: colorScheme.tertiary,
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          TugrulAvatar(
            mood: TugrulMood.pro,
            size: 92,
            ringColor: colorScheme.tertiary,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colorScheme.tertiary.withAlpha(120)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PhosphorIcon(
                  PhosphorIconsFill.crown,
                  size: 14,
                  color: colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 5),
                Text(
                  'PRO Üyelik',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Sınırsız KPSS Hazırlığı',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Günlük soru limitine takılmadan, tüm deneme arşivine ve akıllı tekrar araçlarına eriş.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );

    final planSection = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Abonelik Paketini Seç', style: theme.textTheme.titleMedium),
        AppSpacing.gapXs,
        ...SubscriptionPlan.values.map((plan) {
          final isSelected = _selectedPlan == plan;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TactileCard(
              onTap: () => setState(() => _selectedPlan = plan),
              padding: const EdgeInsets.all(14),
              backgroundColor: isSelected
                  ? Color.alphaBlend(
                      colorScheme.primaryContainer.withAlpha(110),
                      colorScheme.surface,
                    )
                  : colorScheme.surface,
              borderColor: isSelected
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              lipColor: isSelected ? colorScheme.primary : null,
              child: Row(
                children: [
                  PhosphorIcon(
                    isSelected
                        ? PhosphorIconsFill.checkCircle
                        : PhosphorIconsRegular.circle,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outline,
                    size: 20,
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
                              plan.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            if (plan.badge != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.tertiaryContainer,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  plan.badge!,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onTertiaryContainer,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          plan.subText,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    plan.priceText,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );

    final benefitsAndActions = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TactileCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kadro PRO Avantajları', style: theme.textTheme.titleSmall),
              const SizedBox(height: 10),
              const _ProFeatureRow(
                title: 'Sınırsız Soru Çözümü & Sıfır Reklam',
                description: 'Günlük 30 soru limitine ve bekleme sürelerine takılmadan kesintisiz çalış.',
              ),
              const _ProFeatureRow(
                title: 'Tüm Türkiye Geneli Deneme Arşivi',
                description: 'Tüm çoklu KPSS, MEB-AGS, DHBT, E-KPSS ve A Grubu deneme simülasyonları.',
              ),
              const _ProFeatureRow(
                title: 'Çevrimdışı Soru & Deneme İndirme',
                description: 'İnternet olmayan ortamlarda test ve denemeleri cihazından çöz.',
              ),
              const _ProFeatureRow(
                title: 'Akıllı Yanlış Defteri Test Üretici',
                description: 'Yaptığın yanlışlardan tek tıkla 10 veya 20 soruluk tekrar testleri üret.',
              ),
            ],
          ),
        ),
        AppSpacing.gapMd,
        FilledButton.icon(
          key: const ValueKey('paywall_cta_button'),
          onPressed: _isLoading ? null : _handlePurchase,
          icon: _isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const PhosphorIcon(PhosphorIconsFill.crown, size: 18),
          label: Text(
            _isLoading
                ? 'İşlem yapılıyor...'
                : "Kadro PRO'ya Geç (${_selectedPlan.priceText})",
          ),
        ),
        const SizedBox(height: 6),
        TextButton(
          onPressed: _isLoading ? null : _handleRestore,
          child: const Text('Satın Almaları Geri Yükle'),
        ),
        if (supportsAds) ...[
          const SizedBox(height: 4),
          OutlinedButton.icon(
            key: const ValueKey('paywall_rewarded_ad_button'),
            onPressed: () {
              AdService.showRewardedAd(
                onUserEarnedReward: () {
                  ref
                      .read(userPreferencesProvider.notifier)
                      .rewardExtraQuestions(20);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('+20 soru hakkı tanımlandı.'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              );
            },
            icon: const PhosphorIcon(PhosphorIconsRegular.playCircle, size: 18),
            label: const Text('Kısa Reklam İzle (+20 Soru Hakkı Kazan)'),
          ),
        ],
        const SizedBox(height: 12),
        Text(
          'Abonelikler Google Play / App Store üzerinden yönetilir. İstediğin zaman iptal edebilirsin.',
          textAlign: TextAlign.center,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Kadro PRO')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            return ResponsiveContentWrapper(
              maxWidth: isWide ? 1040 : 720,
              padding: EdgeInsets.zero,
              child: ListView(
                padding: AppSpacing.pagePadding(context),
                children: [
                  if (widget.reasonMessage != null) ...[
                    TactileCard(
                      backgroundColor: colorScheme.tertiaryContainer,
                      borderColor: colorScheme.tertiary,
                      lipColor: colorScheme.tertiary,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 14,
                      ),
                      child: Row(
                        children: [
                          PhosphorIcon(
                            PhosphorIconsFill.crown,
                            color: colorScheme.onTertiaryContainer,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.reasonMessage!,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSpacing.gapMd,
                  ],
                  if (isWide) ...[
                    heroCard,
                    AppSpacing.gapLg,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 6, child: planSection),
                        const SizedBox(width: 24),
                        Expanded(flex: 5, child: benefitsAndActions),
                      ],
                    ),
                  ] else ...[
                    heroCard,
                    AppSpacing.gapMd,
                    planSection,
                    const SizedBox(height: 8),
                    benefitsAndActions,
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProFeatureRow extends StatelessWidget {
  final String title;
  final String description;

  const _ProFeatureRow({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhosphorIcon(
            PhosphorIconsBold.check,
            size: 15,
            color: colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
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
