import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Ana sayfa: Kadro Koçu konuşma balonu, günlük hedef ve 2x2 Tactile Bento Grid çalışma türleri.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);
    final gridSpacing = isCompact ? 8.0 : 12.0;

    final tile1 = _StudyTypeTile(
      icon: LucideIcons.target,
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

    final tile2 = _StudyTypeTile(
      icon: LucideIcons.layers,
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

    final tile3 = _StudyTypeTile(
      icon: LucideIcons.bookmark,
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

    final tile4 = _StudyTypeTile(
      icon: LucideIcons.timer,
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

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveBreakpoints.horizontalPadding(context),
            vertical: 16,
          ),
          children: [
            // Kadro Koçu maskot konuşma balonu
            MascotCoachBanner(
              mood: MascotMood.coach,
              title: 'Hoş geldin',
              message: stats.dailySolvedCount == 0
                  ? 'Ben Kadro Koçun! KPSS Genel Kültür maratonunda bugün ilk pençeyi hangi konuya atıyoruz?'
                  : 'Harika uçuş! Bugün ${stats.dailySolvedCount} soru çözdün, kadro hedefine adım adım yaklaşıyoruz!',
            ),
            const SizedBox(height: 16),
            // Riverpod ile anlık güncellenen 3D Tactile günlük hedef kartı
            _DailyGoalCard(
              solved: stats.dailySolvedCount,
              goal: stats.dailyGoal,
            ),
            const SizedBox(height: 16),
            // Akıllı KPSS Günlük Çalışma Planı Kompakt Kartı
            const HomeDailyPlanCard(),
            if (stats.weakestLesson != 'Henüz veri yok') ...[
              const SizedBox(height: 16),
              _WeakLessonHomeBanner(weakestLesson: stats.weakestLesson),
            ],
            const SizedBox(height: 16),
            const SectionTitle('Çalışma türleri'),
            // Adaptif Bento Grid (Tablette 4 sütun tek satır, mobilde 2x2 eşit yükseklikli grid)
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
            const SizedBox(height: 16),
            const SectionTitle('Etkileşimli Mini Oyunlar'),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _StudyTypeTile(
                      icon: LucideIcons.zap,
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
                    child: _StudyTypeTile(
                      icon: LucideIcons.puzzle,
                      title: 'Kavram Eşleştir',
                      description: 'Tarih, Coğrafya ve Vatandaşlık kavramlarını eşleştir.',
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
      ),
    );
  }
}

/// Bugün kaç soru çözüldüğünü ve hedefe ne kadar kaldığını dairesel halka (gauge) ile gösteren dashboard kartı.
class _DailyGoalCard extends StatelessWidget {
  final int solved;
  final int goal;

  const _DailyGoalCard({required this.solved, required this.goal});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final gaugeSize = isCompact ? 68.0 : 80.0;
    final ringSize = isCompact ? 64.0 : 76.0;
    final strokeWidth = isCompact ? 6.5 : 8.0;

    final progress = goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0);
    final percent = (progress * 100).round();

    return TactileCard(
          borderRadius: 22,
          backgroundColor: colorScheme.surface,
          borderColor: colorScheme.primary.withAlpha(90),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sol: Metrikler ve yatay çubuk
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.flame,
                            size: 14,
                            color: colorScheme.onTertiaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Hedef Takibi',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onTertiaryContainer,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bugünkü hedefin',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$solved / $goal soru',
                      style:
                          (isCompact
                                  ? textTheme.titleMedium
                                  : textTheme.headlineSmall)
                              ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        minHeight: 8,
                        value: progress,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: isCompact ? 10 : 16),
              // Sağ: Dairesel Halka / Gauge
              SizedBox(
                width: gaugeSize,
                height: gaugeSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: ringSize,
                      height: ringSize,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: strokeWidth,
                        backgroundColor: colorScheme.primaryContainer.withAlpha(
                          90,
                        ),
                        color: colorScheme.primary,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.flame,
                          size: isCompact ? 16 : 18,
                          color: colorScheme.tertiary,
                        ),
                        Text(
                          '%$percent',
                          style:
                              (isCompact
                                      ? textTheme.labelMedium
                                      : textTheme.labelLarge)
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme.primary,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 200.ms)
        .slideY(begin: 0.04, end: 0, duration: 200.ms);
  }
}

/// 3D basılabilir, canlı rozetli ve aksiyon butonlu dikey Bento çalışma kartı.
class _StudyTypeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final Color? accentColor;
  final Color? accentContainerColor;
  final Color? onAccentContainerColor;
  final String badgeText;
  final String actionText;

  const _StudyTypeTile({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.accentColor,
    this.accentContainerColor,
    this.onAccentContainerColor,
    required this.badgeText,
    this.actionText = 'Başla',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);

    final effectiveAccent = accentColor ?? colorScheme.primary;
    final effectiveAccentContainer =
        accentContainerColor ?? colorScheme.primaryContainer;
    final effectiveOnAccentContainer =
        onAccentContainerColor ?? colorScheme.onPrimaryContainer;

    return TactileCard(
      onTap: onTap,
      padding: EdgeInsets.all(isCompact ? 10 : 14),
      backgroundColor: colorScheme.surface,
      borderColor: effectiveAccent.withAlpha(110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Üst Bölüm: İkon, Rozet, Başlık ve Açıklama (Üste hizalı)
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
                      color: effectiveAccentContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: effectiveOnAccentContainer,
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
                        color: effectiveAccentContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badgeText,
                        style: textTheme.labelSmall?.copyWith(
                          color: effectiveOnAccentContainer,
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
          // Alt Bölüm: Aksiyon butonu (justify-between ile en alta sabitlenir)
          Row(
            children: [
              Text(
                actionText,
                style: textTheme.labelMedium?.copyWith(
                  color: effectiveAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: isCompact ? 11 : null,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                LucideIcons.chevronRight,
                size: isCompact ? 14 : 16,
                color: effectiveAccent,
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}

/// Ana sayfada en zayıf derse özel 10 soruluk hızlı güçlendirme kartı.
class _WeakLessonHomeBanner extends StatelessWidget {
  final String weakestLesson;

  const _WeakLessonHomeBanner({required this.weakestLesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.error.withAlpha(140),
      padding: const EdgeInsets.all(14),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => QuizScreen(
              lessonFilter: weakestLesson,
              customTitle: '$weakestLesson — Zayıf Konuyu Güçlendir',
              limit: 10,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              LucideIcons.flame,
              color: colorScheme.onErrorContainer,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Zayıf Konuyu Güçlendir',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '10 Soru',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onErrorContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '$weakestLesson dersindeki eksiklerini kapatmak için hemen başla.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            LucideIcons.chevronRight,
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ],
      ),
    );
  }
}
