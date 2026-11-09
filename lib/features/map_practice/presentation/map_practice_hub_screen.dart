import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/map_practice/data/map_practice_repository.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';
import 'package:kadro/features/map_practice/presentation/map_challenge_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Harita ile Öğren & Dilsiz Harita Atölyesi Ana Ekranı
///
/// Angular/Web benzetmesi: Bu ekran, adayın dilsiz harita ve görsel coğrafya
/// modüllerini seçtiği `MapPracticeHubComponent` dashboard görünümüdür.
class MapPracticeHubScreen extends ConsumerWidget {
  const MapPracticeHubScreen({super.key});

  Future<void> _startPractice(
    BuildContext context,
    WidgetRef ref,
    MapPracticeCategory category, {
    MapInteractionType? customType,
  }) async {
    final repo = ref.read(mapPracticeRepositoryProvider);
    List<MapChallenge> challenges;

    if (category == MapPracticeCategory.provinces && customType != null) {
      challenges = await repo.getDynamicProvinceChallenges(
        count: 10,
        type: customType,
      );
    } else {
      challenges = await repo.getChallengesByCategory(category, count: 10);
    }

    if (!context.mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => MapChallengeScreen(
              challenges: challenges,
              sessionTitle: category.title,
            ),
      ),
    );
  }

  void _showProvinceModeSheet(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Dilsiz Harita Antrenman Modu',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Nasıl pratik yapmak istersin?',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                _buildModeTile(
                  context: ctx,
                  icon: LucideIcons.hand,
                  title: 'Haritada İle Dokun (Zor)',
                  subtitle:
                      'Ekranda ilin adı yazar, sen Türkiye haritasında o ile dokunursun.',
                  color: const Color(0xFF2563EB),
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _startPractice(
                      context,
                      ref,
                      MapPracticeCategory.provinces,
                      customType: MapInteractionType.tapProvince,
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildModeTile(
                  context: ctx,
                  icon: LucideIcons.sparkles,
                  title: 'Parlayan İli Tanı (Çoktan Seçmeli)',
                  subtitle:
                      'Haritada rastgele bir il parlar, sen 4 seçenek arasından doğru ili seçersin.',
                  color: const Color(0xFFD97706),
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _startPractice(
                      context,
                      ref,
                      MapPracticeCategory.provinces,
                      customType: MapInteractionType.identifyHighlighted,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildModeTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, size: 18, color: color),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final gridSpacing = isCompact ? AppSpacing.xs : AppSpacing.sm;

    return Scaffold(
      appBar: AppBar(title: const Text('Harita Atölyesi')),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: ListView(
          padding: AppSpacing.pagePadding(context),
          children: [
            // 1. Maskot Koç Karşılama Kartı
            const MascotCoachBanner(
              mood: MascotMood.geography,
              badgeLabel: 'GÖRSEL COĞRAFYA',
              title: 'Harita ile Öğren',
              message:
                  'KPSS Coğrafya\'da dilsiz harita sorularını kaçırmaya son! İlleri, madenleri, tarım havzalarını ve platoları interaktif haritada keşfet.',
            ),

            AppSpacing.gapMd,

            // 2. Vitrin Kartı: Dilsiz Harita (81 İl Refleksi)
            const SectionTitle('Şehir & Konum Hafızası'),
            TactileCard(
              onTap: () => _showProvinceModeSheet(context, ref),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      PhosphorIconsDuotone.mapPin,
                      size: 26,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Dilsiz Harita (81 İl)',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF10B981,
                                ).withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Sonsuz Pratik',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF10B981),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Haritada rastgele parlayan illeri tanı veya istenen ili haritada dokunarak bul.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    LucideIcons.chevronRight,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),

            AppSpacing.gapMd,

            // 3. Konu Bazlı Harita Havzaları (2x2 Grid)
            const SectionTitle('Tematik Harita Havzaları'),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _buildCategoryCard(
                      context: context,
                      title: 'Tarım & Hayvancılık',
                      subtitle: 'Lider iller, mikroklima ve yetiştirilmeyenler',
                      badgeText: 'Tarım',
                      icon: PhosphorIconsDuotone.plant,
                      color: const Color(0xFF10B981),
                      onTap:
                          () => _startPractice(
                            context,
                            ref,
                            MapPracticeCategory.agriculture,
                          ),
                    ),
                  ),
                  SizedBox(width: gridSpacing),
                  Expanded(
                    child: _buildCategoryCard(
                      context: context,
                      title: 'Madenler & Enerji',
                      subtitle: 'Bor, petrol, taş kömürü ve santraller',
                      badgeText: 'Madenler',
                      icon: PhosphorIconsDuotone.hammer,
                      color: const Color(0xFF2563EB),
                      onTap:
                          () => _startPractice(
                            context,
                            ref,
                            MapPracticeCategory.mines,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: gridSpacing),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _buildCategoryCard(
                      context: context,
                      title: 'Plato, Dağ & Göller',
                      subtitle: 'Karstik göller, horst-graben ve platolar',
                      badgeText: 'Fiziki',
                      icon: PhosphorIconsDuotone.mountains,
                      color: const Color(0xFFD97706),
                      onTap:
                          () => _startPractice(
                            context,
                            ref,
                            MapPracticeCategory.physical,
                          ),
                    ),
                  ),
                  SizedBox(width: gridSpacing),
                  Expanded(
                    child: _buildCategoryCard(
                      context: context,
                      title: 'Sanayi & Limanlar',
                      subtitle: 'Hinterlandı dar/geniş limanlar ve tesisler',
                      badgeText: 'Sanayi',
                      icon: PhosphorIconsDuotone.factory,
                      color: const Color(0xFF8B5CF6),
                      onTap:
                          () => _startPractice(
                            context,
                            ref,
                            MapPracticeCategory.industry,
                          ),
                    ),
                  ),
                ],
              ),
            ),

            AppSpacing.gapSm,

            // 4. Tarih Haritası (Kurtuluş Savaşı & Kongreler)
            TactileCard(
              onTap:
                  () => _startPractice(
                    context,
                    ref,
                    MapPracticeCategory.history,
                  ),
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDC2626).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      PhosphorIconsDuotone.scroll,
                      size: 24,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Tarih: Millî Mücadele Haritası',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFDC2626,
                                ).withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Kurtuluş Savaşı',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFDC2626),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Doğu/Güney/Batı cepheleri, genelgeler, kongre rotası ve ilk kurşun.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    LucideIcons.chevronRight,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 18,
                  ),
                ],
              ),
            ),

            AppSpacing.gapMd,

            // 5. Genel Harita Maratonu
            const SectionTitle('Sınav Düzeni'),
            TactileCard(
              onTap:
                  () => _startPractice(
                    context,
                    ref,
                    MapPracticeCategory.marathon,
                  ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD97706).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      PhosphorIconsFill.trophy,
                      size: 22,
                      color: Color(0xFFD97706),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Genel Harita Maratonu',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Tüm konulardan ve 81 ilden karma 10 soruluk hızlı görsel deneme.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed:
                        () => _startPractice(
                          context,
                          ref,
                          MapPracticeCategory.marathon,
                        ),
                    child: const Text('Başla'),
                  ),
                ],
              ),
            ),

            AppSpacing.gapLg,
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String badgeText,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return TactileCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 20, color: color),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 11,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
