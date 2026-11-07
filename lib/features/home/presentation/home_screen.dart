import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/pomodoro/presentation/pomodoro_studio_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Ana sayfa: Kadro Koçu konuşma balonu, günlük hedef, akıllı hatırlatıcılar ve çalışma planı.
///
/// Web/Angular benzetmesi: KPSS adayının günlük çalışma akışını ve hedeflerini
/// koordine eden `HomeDashboardComponent` (Command Center).
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);
    final plannerState = ref.watch(studyPlannerProvider);
    final pendingCount = plannerState.remainingCount;

    return ResponsiveContentWrapper(
      maxWidth: 720,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: AppSpacing.pagePadding(context),
        children: [
          // 1. Kadro Koçu maskot konuşma balonu
          MascotCoachBanner(
            mood:
                (stats.dailySolvedCount >= stats.dailyGoal &&
                    stats.dailyGoal > 0)
                ? MascotMood.streak
                : MascotMood.coach,
            badgeLabel:
                (stats.dailySolvedCount >= stats.dailyGoal &&
                    stats.dailyGoal > 0)
                ? 'SERİ CANAVARI'
                : 'KADRO KOÇU',
            title:
                (stats.dailySolvedCount >= stats.dailyGoal &&
                    stats.dailyGoal > 0)
                ? 'Hedefe Ulaştın!'
                : 'Hoş geldin',
            message: stats.dailySolvedCount == 0
                ? 'Ben Kadro Koçun! KPSS Genel Kültür maratonunda bugün ilk pençeyi hangi konuya atıyoruz?'
                : 'Harika uçuş! Bugün ${stats.dailySolvedCount} soru çözdün, kadro hedefine adım adım yaklaşıyoruz!',
          ),
          AppSpacing.gapMd,

          // 2. Riverpod ile anlık güncellenen 3D Tactile günlük hedef kartı
          _DailyGoalCard(solved: stats.dailySolvedCount, goal: stats.dailyGoal),
          AppSpacing.gapMd,

          // 2.5. KPSS Sınav Geri Sayımı ve Pomodoro Odak Şeridi
          const _ExamAndPomodoroBanner(),
          AppSpacing.gapMd,

          // 3. Akıllı Görev ve Durum Hatırlatıcıları Kartı
          const SectionTitle('Görev & Durum Hatırlatıcıları'),
          _SmartRemindersCard(pendingCount: pendingCount, stats: stats),
          AppSpacing.gapMd,

          // 4. Akıllı KPSS Günlük Çalışma Planı Kompakt Kartı
          const HomeDailyPlanCard(),

          // 5. Zayıf konu güçlendirme kartı (varsa)
          if (stats.weakestLesson != 'Henüz veri yok') ...[
            AppSpacing.gapMd,
            _WeakLessonHomeBanner(weakestLesson: stats.weakestLesson),
          ],
        ],
      ),
    );
  }
}

/// Adayın günlük görevlerini, seri durumunu ve antrenman hatırlatıcılarını
/// özetleyen akıllı komuta merkezi kartı.
///
/// Web/Angular benzetmesi: Dashboard Notification / Smart Alert List component.
class _SmartRemindersCard extends StatelessWidget {
  final int pendingCount;
  final StudyStatsState stats;

  const _SmartRemindersCard({required this.pendingCount, required this.stats});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final remainingQuestions = (stats.dailyGoal - stats.dailySolvedCount).clamp(
      0,
      stats.dailyGoal,
    );
    final isGoalMet = stats.dailySolvedCount >= stats.dailyGoal;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.primary.withAlpha(80),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          // 1. Görev Hatırlatıcısı
          _ReminderItem(
            icon: PhosphorIconsBold.clipboardText,
            title: 'Çalışma Planı',
            message: pendingCount > 0
                ? 'Bugün tamamlanmayı bekleyen $pendingCount çalışma görevin var'
                : 'Bugünkü tüm çalışma planı görevlerini tamamladın!',
            iconBgColor: colorScheme.primaryContainer,
            iconColor: colorScheme.onPrimaryContainer,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const StudyPlannerScreen()),
              );
            },
          ),
          Divider(
            height: 16,
            thickness: 1,
            color: colorScheme.outlineVariant.withAlpha(80),
          ),
          // 2. Seri & Hedef Hatırlatıcısı
          _ReminderItem(
            icon: PhosphorIconsFill.fire,
            title: 'Seri & Hedef',
            message: !isGoalMet
                ? '${stats.streakDays} günlük serini korumak için kalan: $remainingQuestions soru'
                : 'Günlük soru hedefini tamamladın, serin güvende!',
            iconBgColor: colorScheme.tertiaryContainer,
            iconColor: colorScheme.onTertiaryContainer,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
            },
          ),
          Divider(
            height: 16,
            thickness: 1,
            color: colorScheme.outlineVariant.withAlpha(80),
          ),
          // 3. Hızlı Pratik & Yanlış Defteri Hatırlatıcısı
          _ReminderItem(
            icon: PhosphorIconsDuotone.bookmarks,
            title: 'Hızlı Pratik',
            message: 'Yanlış defteri ve çalışma modlarıyla netlerini artır',
            iconBgColor: colorScheme.secondaryContainer,
            iconColor: colorScheme.onSecondaryContainer,
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
            },
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}

/// `_SmartRemindersCard` içindeki her bir tıklanabilir hatırlatıcı satırı.
///
/// Web/Angular benzetmesi: `@Component` list-item bildirim satırı.
class _ReminderItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _ReminderItem({
    required this.icon,
    required this.title,
    required this.message,
    required this.iconBgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(isCompact ? 8 : 10),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: PhosphorIcon(
                icon,
                size: isCompact ? 18 : 20,
                color: iconColor,
              ),
            ),
            SizedBox(width: isCompact ? 10 : 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            PhosphorIcon(
              PhosphorIconsBold.caretRight,
              size: 16,
              color: colorScheme.onSurfaceVariant,
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
                          PhosphorIcon(
                            PhosphorIconsFill.fire,
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
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
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
                        PhosphorIcon(
                          PhosphorIconsFill.fire,
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
            child: PhosphorIcon(
              PhosphorIconsFill.fire,
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
          PhosphorIcon(
            PhosphorIconsBold.caretRight,
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ],
      ),
    );
  }
}

/// Ana sayfada KPSS'ye kalan süreyi ve seçili Pomodoro odak modunu gösteren kompakt komuta şeridi.
class _ExamAndPomodoroBanner extends ConsumerWidget {
  const _ExamAndPomodoroBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final pomodoro = ref.watch(pomodoroProvider);
    final remainingDays = pomodoro.examTarget.remainingDays();

    return TactileCard(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const PomodoroStudioScreen()));
      },
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.primary.withAlpha(70),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: PhosphorIcon(
              PhosphorIconsDuotone.timer,
              size: 20,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '⏳ KPSS 2026: $remainingDays Gün Kaldı',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${pomodoro.formattedTime} Odak · ${pomodoro.selectedLesson}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PhosphorIcon(
                  PhosphorIconsBold.play,
                  size: 13,
                  color: colorScheme.onPrimary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Sayaç',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
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
