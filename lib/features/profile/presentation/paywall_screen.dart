import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Kadro PRO abonelik ve ödüllü reklam tanıtım ekranı (Paywall).
///
/// Angular'daki `PaywallModalComponent` karşılığıdır.
/// Kullanıcı günlük soru limitine ulaştığında veya Profil sekmesinden açılır.
class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Kadro PRO')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Üst Vurgu 3D Kartı (Kraliyet Taçlı Kadro Koçu)
              TactileCard(
                backgroundColor: colorScheme.primaryContainer,
                borderColor: colorScheme.primary.withAlpha(120),
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: colorScheme.tertiary,
                          width: 2.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/mascot/tugrul_pro.png',
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            LucideIcons.crown,
                            size: 40,
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
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Günlük soru limitine takılmadan, tam kapsamlı çalış.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // PRO Özellikleri Listesi
              Expanded(
                child: ListView(
                  children: const [
                    _ProFeatureTile(
                      icon: LucideIcons.check,
                      title: 'Sınırsız Soru Çözümü & Deneme',
                      description:
                          'Tüm ders ve konularda sınırsızca test çözün.',
                    ),
                    _ProFeatureTile(
                      icon: LucideIcons.check,
                      title: 'Akıllı Yanlış Defteri',
                      description: 'Yanlış yapılan soruları tam öğrenene kadar pekiştirin.',
                    ),
                    _ProFeatureTile(
                      icon: LucideIcons.check,
                      title: 'Haftalık Güncel Bilgiler Kartları',
                      description: '2024 ve 2025 müfredatına uygun hap bilgiler cebinizde.',
                    ),
                    _ProFeatureTile(
                      icon: LucideIcons.check,
                      title: 'Reklamsız, Kesintisiz Çalışma',
                      description: 'Dikkatiniz dağılmadan doğrudan derslerinize odaklanın.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Kadro PRO Satın Alma Butonu
              FilledButton.icon(
                onPressed: () {
                  ref.read(userPreferencesProvider.notifier).upgradeToPro();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Tebrikler! Kadro PRO üyeliğin aktifleşti.',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.star),
                label: const Text('Kadro PRO\'ya Geç (Aylık 79,90 TL)'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 8),

              // Ödüllü Reklam ile Soru Kazanma Butonu
              OutlinedButton.icon(
                onPressed: () {
                  ref
                      .read(userPreferencesProvider.notifier)
                      .rewardExtraQuestions(20);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('+20 soru hakkı tanımlandı!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.play_circle_outline),
                label: const Text('Kısa Reklam İzle (+20 Soru Hakkı Kazan)'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// PRO avantaj satırı bileşeni.
class _ProFeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ProFeatureTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: colorScheme.surfaceContainerHighest,
            child: Icon(icon, size: 20, color: colorScheme.primary),
          ),
          const SizedBox(width: 14),
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
