import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/ad_service.dart';
import 'package:kadro/core/services/purchase_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Kadro PRO 3'lü karma abonelik ve ödüllü reklam tanıtım ekranı (Paywall).
///
/// Angular'daki `PaywallModalComponent` karşılığıdır.
/// Kullanıcı günlük soru limitine ulaştığında veya Profil sekmesinden açılır.
/// Aylık (89 ₺), Yıllık (499 ₺) ve Sınava Kadar (349 ₺) paket seçeneklerini sunar.
class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  SubscriptionPlan _selectedPlan = SubscriptionPlan.yearly;
  bool _isLoading = false;

  Future<void> _handlePurchase() async {
    setState(() => _isLoading = true);

    final success = await PurchaseService.purchasePlan(_selectedPlan);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      ref.read(userPreferencesProvider.notifier).upgradeToPro();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tebrikler! ${_selectedPlan.title} aktifleşti.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Satın alma işlemi tamamlanamadı veya iptal edildi.'),
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
          content: Text('Kadro PRO aboneliğin başarıyla geri yüklendi!'),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Kadro PRO')),
      body: SafeArea(
        child: ResponsiveContentWrapper(
          maxWidth: 720,
          padding: EdgeInsets.zero,
          child: ListView(
            padding: AppSpacing.pagePadding(context),
            children: [
              // 1. Üst Vurgu 3D Kartı (Kraliyet Taçlı Kadro Koçu)
              TactileCard(
                backgroundColor: colorScheme.primaryContainer.withAlpha(110),
                borderColor: colorScheme.primary.withAlpha(120),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorScheme.tertiary,
                          width: 2.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/images/mascot/tugrul_pro.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            LucideIcons.crown,
                            size: 38,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'KPSS Hazırlığını Zirveye Taşı',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Günlük soru limitine takılmadan, tam kapsamlı çalış.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.gapMd,

              // 2. Paket Seçenekleri Başlığı
              Text(
                'Abonelik Paketini Seç',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.gapXs,

              // 3. 3 Seçenekli Paket Kartları
              ...SubscriptionPlan.values.map((plan) {
                final isSelected = _selectedPlan == plan;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedPlan = plan);
                    },
                    child: TactileCard(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: isSelected
                          ? Color.alphaBlend(
                              colorScheme.primaryContainer.withAlpha(80),
                              colorScheme.surface,
                            )
                          : colorScheme.surface,
                      borderColor: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? LucideIcons.circleCheck
                                : LucideIcons.circle,
                            color: isSelected
                                ? colorScheme.primary
                                : colorScheme.onSurfaceVariant.withAlpha(120),
                            size: 22,
                          ),
                          const SizedBox(width: 14),
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
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: colorScheme.onSurface,
                                          ),
                                    ),
                                    if (plan.badge != null)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorScheme.tertiaryContainer,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          plan.badge!,
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: colorScheme
                                                    .onTertiaryContainer,
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
                              fontWeight: FontWeight.w800,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 8),

              // 4. PRO Avantajları Listesi
              TactileCard(
                padding: const EdgeInsets.all(16),
                backgroundColor: colorScheme.surface,
                borderColor: colorScheme.outlineVariant,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kadro PRO Avantajları',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const _ProFeatureRow(
                      title: 'Sınırsız Soru & Deneme Çözümü',
                      description:
                          '60 Genel Kültür sorusunda hiçbir limite takılma.',
                    ),
                    const _ProFeatureRow(
                      title: 'Akıllı Yanlış Defteri',
                      description: 'Tüm yanlışlarını hafızada tut ve tam öğrenene kadar çöz.',
                    ),
                    const _ProFeatureRow(
                      title: 'Haftalık Güncel Bilgiler Kartları',
                      description:
                          '2025 müfredatına uygun yeni hap bilgi kartları.',
                    ),
                    const _ProFeatureRow(
                      title: 'Reklamsız Kesintisiz Odaklanma',
                      description:
                          'Sıfır bekleme süresiyle kesintisiz KPSS maratonu.',
                    ),
                  ],
                ),
              ),
              AppSpacing.gapMd,

              // 5. Kadro PRO Satın Alma Butonu (CTA)
              FilledButton.icon(
                key: const ValueKey('paywall_cta_button'),
                onPressed: _isLoading ? null : _handlePurchase,
                icon: _isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.star),
                label: Text(
                  _isLoading
                      ? 'İşlem yapılıyor...'
                      : "Kadro PRO'ya Geç (${_selectedPlan.priceText})",
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 6),

              // Satın Almaları Geri Yükle Butonu
              TextButton(
                onPressed: _isLoading ? null : _handleRestore,
                child: const Text('Satın Almaları Geri Yükle'),
              ),
              const SizedBox(height: 4),

              // 6. Ödüllü Reklam ile Ücretsiz Soru Kazanma
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
                            content: Text(
                              '+20 soru hakkı başarıyla tanımlandı!',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                  );
                },
                icon: const Icon(Icons.play_circle_outline),
                label: const Text('Kısa Reklam İzle (+20 Soru Hakkı Kazan)'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 12),

              // Alt Açıklama
              Text(
                'Abonelikler Google Play / App Store üzerinden yönetilir. İstediğin zaman iptal edebilirsin.',
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// PRO avantaj satırı.
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
          Icon(LucideIcons.check, size: 16, color: colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
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
