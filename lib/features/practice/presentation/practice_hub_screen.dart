import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bağımsız Çalışma Türleri ve Antrenman Sahası ekranı (`PracticeHubScreen`).
///
/// Web/Angular benzetmesi: Çok sekmeli bir eğitim portalında alıştırma ve sınav
/// modüllerinin listelendiği `PracticeHubComponent` (Angular dashboard view).
/// Adayın test çözme, flaş kart tekrarı, yanlış havuzu, deneme sınavı ve mini oyunlara
/// tek merkezden erişmesini sağlar.
class PracticeHubScreen extends ConsumerWidget {
  const PracticeHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);
    final gridSpacing = isCompact ? AppSpacing.xs : AppSpacing.sm;

    // Temel Çalışma Modları (Bento Grid Elemanları)
    final tile1 = _PracticeTile(
      icon: PhosphorIconsDuotone.target,
      title: 'Konu testi',
      description: 'Bir konu seç, 10-20 soruluk test çöz.',
      badgeText: '10-20 Soru',
      actionText: 'Başla',
      accentColor: colorScheme.primary,
      accentContainerColor: colorScheme.primaryContainer,
      onAccentContainerColor: colorScheme.onPrimaryContainer,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
      },
    );

    final tile2 = _PracticeTile(
      icon: PhosphorIconsDuotone.cards,
      title: 'Bilgi kartları',
      description: 'Önünde soru, arkasında cevap. Hızlı tekrar için.',
      badgeText: 'Hızlı Tekrar',
      actionText: 'Başla',
      accentColor: colorScheme.tertiary,
      accentContainerColor: colorScheme.tertiaryContainer,
      onAccentContainerColor: colorScheme.onTertiaryContainer,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const FlashcardsScreen()));
      },
    );

    final tile3 = _PracticeTile(
      icon: PhosphorIconsDuotone.bookmarks,
      title: 'Yanlış defteri',
      description: 'Yanlış yaptığın soruları tekrar çöz.',
      badgeText: 'Akıllı Havuz',
      actionText: 'Başla',
      accentColor: colorScheme.error,
      accentContainerColor: colorScheme.errorContainer,
      onAccentContainerColor: colorScheme.onErrorContainer,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
      },
    );

    final tile4 = _PracticeTile(
      icon: PhosphorIconsDuotone.timer,
      title: 'Deneme sınavı',
      description: '60 soru, 65 dakika. Gerçek Genel Kültür sınav düzeni.',
      badgeText: '65 Dakika',
      actionText: 'Başla',
      accentColor: colorScheme.secondary,
      accentContainerColor: colorScheme.secondaryContainer,
      onAccentContainerColor: colorScheme.onSecondaryContainer,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const QuizScreen(
              examDuration: Duration(minutes: 65),
              customTitle: 'Genel Kültür Denemesi',
            ),
          ),
        );
      },
    );

    return ResponsiveContentWrapper(
      maxWidth: 720,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: AppSpacing.pagePadding(context),
        children: [
          // 1. Kadro Koçu Maskot Karşılama Kartı
          const MascotCoachBanner(
            mood: MascotMood.practice,
            badgeLabel: 'ANTRENMAN SAHASI',
            title: 'Çalışma Türleri',
            message: 'Bugün hangi modda pratik yapmak istersin? Test çöz, kartlarla tekrar yap veya oyunlarla hafızanı tazele!',
          ),
          AppSpacing.gapMd,

          // 2. Temel Çalışma Modları (2x2 Bento Grid / Tablette 4 sütun)
          const SectionTitle('Çalışma türleri'),
          if (isTablet) ...[
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: tile1),
                  SizedBox(width: gridSpacing),
                  Expanded(child: tile2),
                  SizedBox(width: gridSpacing),
                  Expanded(child: tile3),
                  SizedBox(width: gridSpacing),
                  Expanded(child: tile4),
                ],
              ),
            ),
          ] else ...[
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: tile1),
                  SizedBox(width: gridSpacing),
                  Expanded(child: tile2),
                ],
              ),
            ),
            SizedBox(height: gridSpacing),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: tile3),
                  SizedBox(width: gridSpacing),
                  Expanded(child: tile4),
                ],
              ),
            ),
          ],
          AppSpacing.gapMd,

          // 3. Özel Antrenman (ÖSYM Çeldirici Avı)
          const SectionTitle('Özel Antrenman'),
          const _DistractorHuntSpecialCard(),
          AppSpacing.gapMd,

          // 4. Etkileşimli Mini Oyunlar (2'li Bento Grid)
          const SectionTitle('Etkileşimli Mini Oyunlar'),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _PracticeTile(
                    icon: PhosphorIconsFill.lightning,
                    title: '60 Saniyede Pençe',
                    description: 'Doğru / Yanlış hızlı düello ile kombo yap.',
                    badgeText: 'Kombo XP',
                    actionText: 'Düelloya Gir',
                    accentColor: colorScheme.tertiary,
                    accentContainerColor: colorScheme.tertiaryContainer,
                    onAccentContainerColor: colorScheme.onTertiaryContainer,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const TrueFalseBlitzScreen(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: gridSpacing),
                Expanded(
                  child: _PracticeTile(
                    icon: PhosphorIconsDuotone.puzzlePiece,
                    title: 'Kavram Eşleştir',
                    description:
                        'Tarih, Coğrafya ve Vatandaşlık kavramlarını eşleştir.',
                    badgeText: 'Hafıza Oyunu',
                    actionText: 'Eşleştir',
                    accentColor: colorScheme.primary,
                    accentContainerColor: colorScheme.primaryContainer,
                    onAccentContainerColor: colorScheme.onPrimaryContainer,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ConceptMatchScreen(),
                        ),
                      );
                    },
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

/// 3D basılabilir, canlı rozetli ve aksiyon butonlu dikey Bento pratik kartı.
///
/// Web/Angular benzetmesi: `@Component` ile tanımlanan flex-box tabanlı kart bileşeni.
class _PracticeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final Color accentColor;
  final Color accentContainerColor;
  final Color onAccentContainerColor;
  final String badgeText;
  final String actionText;

  const _PracticeTile({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    required this.accentColor,
    required this.accentContainerColor,
    required this.onAccentContainerColor,
    required this.badgeText,
    this.actionText = 'Başla',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);

    return TactileCard(
      onTap: onTap,
      padding: EdgeInsets.all(isCompact ? 10 : 14),
      backgroundColor: colorScheme.surface,
      borderColor: accentColor.withAlpha(110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Üst Bölüm: İkon, Rozet, Başlık ve Açıklama
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(isCompact ? 8 : 10),
                    decoration: BoxDecoration(
                      color: accentContainerColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: PhosphorIcon(
                      icon,
                      color: onAccentContainerColor,
                      size: isCompact ? 20 : 24,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isCompact ? 6 : 8,
                        vertical: isCompact ? 2 : 3,
                      ),
                      decoration: BoxDecoration(
                        color: accentContainerColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badgeText,
                        style: textTheme.labelSmall?.copyWith(
                          color: onAccentContainerColor,
                          fontWeight: FontWeight.w800,
                          fontSize: isCompact ? 10 : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isCompact ? 8 : 12),
              Text(
                title,
                style:
                    (isCompact ? textTheme.titleSmall : textTheme.titleMedium)
                        ?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                  fontSize: isCompact ? 11 : null,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Alt Bölüm: Aksiyon yönlendirmesi
          Row(
            children: [
              Flexible(
                child: Text(
                  actionText,
                  style: textTheme.labelMedium?.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: isCompact ? 11 : null,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: isCompact ? 14 : 16,
                color: accentColor,
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}

/// ÖSYM Çeldirici Avı (Tuzak Sorular) için kehribar/tertiary vurgulu özel antrenman kartı.
///
/// Web/Angular benzetmesi: Öne çıkarılmış "Featured Banner Card" bileşeni.
class _DistractorHuntSpecialCard extends StatelessWidget {
  const _DistractorHuntSpecialCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.tertiary.withAlpha(140),
      padding: EdgeInsets.all(isCompact ? 12 : 16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const QuizScreen(
              customTitle: 'ÖSYM Çeldirici Avı (Tuzak Sorular)',
              limit: 10,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Kehribar renkli ikaz ikonu
          Container(
            padding: EdgeInsets.all(isCompact ? 10 : 12),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(14),
            ),
            child: PhosphorIcon(
              PhosphorIconsDuotone.warning,
              color: colorScheme.onTertiaryContainer,
              size: isCompact ? 24 : 28,
            ),
          ),
          SizedBox(width: isCompact ? 10 : 14),
          // Başlık, rozet ve açıklama
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'ÖSYM Çeldirici Avı',
                      style:
                          (isCompact
                                  ? theme.textTheme.titleSmall
                                  : theme.textTheme.titleMedium)
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onSurface,
                              ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Tuzak Sorular',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onTertiaryContainer,
                          fontWeight: FontWeight.w800,
                          fontSize: isCompact ? 10 : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Adayların en çok düştüğü çeldirici tuzaklı sorularla netlerini garantiye al.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                    fontSize: isCompact ? 11 : null,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            PhosphorIconsBold.caretRight,
            color: colorScheme.tertiary,
            size: 22,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
