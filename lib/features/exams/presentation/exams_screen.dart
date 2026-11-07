import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Denemeler sekmesi: sınav düzeni, süreli prova paketleri ve deneme başlatma.
///
/// TASK-55 kapsamında Kadro PRO çevrimdışı indirme motoru ve internetsiz açılış kontrolü entegre edilmiştir.
class ExamsScreen extends ConsumerWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ResponsiveContentWrapper(
      maxWidth: 720,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: AppSpacing.pagePadding(context),
        children: [
          const MascotCoachBanner(
            mood: MascotMood.exam,
            badgeLabel: 'BAŞ GÖZETMEN',
            title: 'Deneme sınavları',
            message: 'Gerçek sınav provası! 60 soru, 65 dakika ve 4 yanlış 1 doğru kuralıyla netini test et.',
          ),
          AppSpacing.gapMd,
          const SectionTitle('Sınav düzeni'),
          const TactileCard(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: PhosphorIcon(PhosphorIconsBold.listNumbers),
                  title: Text('Soru sayısı'),
                  trailing: Text('60'),
                ),
                Divider(height: 1),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: PhosphorIcon(PhosphorIconsBold.clock),
                  title: Text('Süre'),
                  trailing: Text('65 dakika'),
                ),
                Divider(height: 1),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: PhosphorIcon(PhosphorIconsBold.calculator),
                  title: Text('Net hesabı'),
                  subtitle: Text('4 yanlış 1 doğruyu götürür'),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 200.ms),
          AppSpacing.gapMd,
          // 65 dakikalık süreli Genel Kültür denemesini başlatır
          FilledButton.icon(
            onPressed: () async {
              final isOnline = ref.read(isOnlineProvider);
              final isDownloaded = ref
                  .read(downloadedPackagesProvider)
                  .contains('exam_gk_prova_1');

              if (!isOnline) {
                if (isDownloaded) {
                  final questions = await ref
                      .read(offlineDownloadServiceProvider)
                      .getDownloadedQuestions('exam_gk_prova_1');
                  if (!context.mounted) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(
                        questions: questions ?? [],
                        examDuration: const Duration(minutes: 65),
                        customTitle: 'Genel Kültür Denemesi (Çevrimdışı)',
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (dialogCtx) => AlertDialog(
                      title: const Row(
                        children: [
                          PhosphorIcon(PhosphorIconsBold.wifiSlash),
                          SizedBox(width: 8),
                          Text('İnternet Bağlantısı Yok'),
                        ],
                      ),
                      content: const Text(
                        'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(dialogCtx).pop(),
                          child: const Text('Tamam'),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(dialogCtx).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const PaywallScreen(),
                              ),
                            );
                          },
                          child: const Text("Kadro PRO'ya Geç"),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const QuizScreen(
                      examDuration: Duration(minutes: 65),
                      customTitle: 'Genel Kültür Denemesi',
                      fetchAllFromPool: true,
                    ),
                  ),
                );
              }
            },
            icon: const PhosphorIcon(PhosphorIconsFill.play),
            label: const Text('Genel Kültür Denemesi Başlat'),
          ).animate().fadeIn(duration: 200.ms),
          AppSpacing.gapXl,
          const SectionTitle('Hazır Deneme Paketleri'),
          _ExamPackCard(
            packageId: 'exam_gk_prova_1',
            title: 'Türkiye Geneli GK Provası #1',
            subtitle: '65 Dakika · 60 Soru',
            description: 'Gerçek sınav simülasyonu. Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler.',
            badgeText: 'ÖSYM Standardı',
            icon: PhosphorIconsDuotone.trophy,
            accentColor: colorScheme.primary,
            accentContainerColor: colorScheme.primaryContainer,
            onAccentContainerColor: colorScheme.onPrimaryContainer,
            duration: const Duration(minutes: 65),
          ),
          AppSpacing.gapSm,
          _ExamPackCard(
            packageId: 'exam_tarih_cografya_kamp',
            title: 'Tarih & Coğrafya Kamp Denemesi',
            subtitle: '40 Dakika · 45 Soru',
            description: 'Ağırlıklı derslere özel maraton kamp denemesi ile netlerini artır.',
            badgeText: 'Lokomotif Kamp',
            icon: PhosphorIconsDuotone.fire,
            accentColor: colorScheme.tertiary,
            accentContainerColor: colorScheme.tertiaryContainer,
            onAccentContainerColor: colorScheme.onTertiaryContainer,
            duration: const Duration(minutes: 40),
          ),
          AppSpacing.gapSm,
          _ExamPackCard(
            packageId: 'exam_hizli_mola',
            title: '15 Dakika Hızlı Mola Denemesi',
            subtitle: '15 Dakika · 15 Soru',
            description:
                'Çay veya kahve molasında hızlı pratik yap, tempoyu koru.',
            badgeText: 'Hızlı Mola',
            icon: PhosphorIconsDuotone.lightning,
            accentColor: colorScheme.secondary,
            accentContainerColor: colorScheme.secondaryContainer,
            onAccentContainerColor: colorScheme.onSecondaryContainer,
            duration: const Duration(minutes: 15),
          ),
        ],
      ),
    );
  }
}

/// Deneme sınavı paket kartı.
class _ExamPackCard extends ConsumerWidget {
  final String packageId;
  final String title;
  final String subtitle;
  final String description;
  final String badgeText;
  final IconData icon;
  final Color accentColor;
  final Color accentContainerColor;
  final Color onAccentContainerColor;
  final Duration duration;

  const _ExamPackCard({
    required this.packageId,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.badgeText,
    required this.icon,
    required this.accentColor,
    required this.accentContainerColor,
    required this.onAccentContainerColor,
    required this.duration,
  });

  Future<void> _handleDownload(BuildContext context, WidgetRef ref) async {
    final isPro = ref.read(userPreferencesProvider).isPro;
    if (!isPro) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '🔒 Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
          ),
        ),
      );
      return;
    }

    try {
      final questionRepo = ref.read(questionRepositoryProvider);
      final questions = await questionRepo.loadAllQuestions();
      await ref
          .read(downloadedPackagesProvider.notifier)
          .downloadPackage(
            packageId: packageId,
            questions: questions,
            isPro: isPro,
          );
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ $title paketi çevrimdışı kullanım için hazır!'),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('İndirme sırasında hata oluştu: $e')),
      );
    }
  }

  Future<void> _startExam(BuildContext context, WidgetRef ref) async {
    final isOnline = ref.read(isOnlineProvider);
    final downloadedPackages = ref.read(downloadedPackagesProvider);
    final isDownloaded = downloadedPackages.contains(packageId);

    if (!isOnline) {
      if (isDownloaded) {
        final downloadedQuestions = await ref
            .read(offlineDownloadServiceProvider)
            .getDownloadedQuestions(packageId);
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => QuizScreen(
              questions: downloadedQuestions ?? [],
              examDuration: duration,
              customTitle: '$title (Çevrimdışı)',
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (dialogCtx) => AlertDialog(
            title: const Row(
              children: [
                PhosphorIcon(PhosphorIconsBold.wifiSlash),
                SizedBox(width: 8),
                Text('İnternet Bağlantısı Yok'),
              ],
            ),
            content: const Text(
              'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogCtx).pop(),
                child: const Text('Tamam'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(dialogCtx).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PaywallScreen()),
                  );
                },
                child: const Text("Kadro PRO'ya Geç"),
              ),
            ],
          ),
        );
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => QuizScreen(
            examDuration: duration,
            customTitle: title,
            fetchAllFromPool: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final downloadedPackages = ref.watch(downloadedPackagesProvider);
    final isDownloaded = downloadedPackages.contains(packageId);

    return TactileCard(
      onTap: () => _startExam(context, ref),
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentContainerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: PhosphorIcon(
                  icon,
                  color: onAccentContainerColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Sağ Üst: Kategori Rozeti ve Çevrimdışı İndirme Butonu
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: accentContainerColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badgeText,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: onAccentContainerColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  isDownloaded
                      ? Tooltip(
                          message: 'Cihazda Hazır',
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PhosphorIcon(
                                  PhosphorIconsFill.checkCircle,
                                  size: 13,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Cihazda',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Tooltip(
                          message: 'Çevrimdışı İndir',
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => _handleDownload(context, ref),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: PhosphorIcon(
                                PhosphorIconsBold.downloadSimple,
                                size: 16,
                                color: colorScheme.onSurfaceVariant.withAlpha(
                                  150,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Sol: Çevrimdışı durum veya rehber bilgi
              if (isDownloaded)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PhosphorIcon(
                      PhosphorIconsBold.hardDrive,
                      size: 13,
                      color: colorScheme.secondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Çevrimdışı Kullanıma Hazır',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  'Kadro PRO Çevrimdışı Desteği',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.outline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              // Sağ: Denemeyi Başlat
              Row(
                children: [
                  Text(
                    'Denemeyi Başlat',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 4),
                  PhosphorIcon(
                    PhosphorIconsBold.arrowRight,
                    size: 16,
                    color: accentColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
