import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/app_config_service.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/planner/presentation/widgets/home_daily_plan_card.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Ana sayfa: Tuğrul koçluk sahnesi, günlük hedef barı, sınav takvimi, çalışma planı ve hatırlatıcılar.
///
/// Web/Angular benzetmesi: KPSS adayının günlük ilerlemesini ve araçlarını yöneten `HomeDashboardComponent`.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);
    final plannerState = ref.watch(studyPlannerProvider);
    final pendingCount = plannerState.remainingCount;
    final remaining = (stats.dailyGoal - stats.dailySolvedCount).clamp(
      0,
      stats.dailyGoal,
    );
    final isGoalMet =
        stats.dailySolvedCount >= stats.dailyGoal && stats.dailyGoal > 0;
    final showDesktopBento = ResponsiveBreakpoints.usesSidebar(context);

    if (showDesktopBento) {
      return ResponsiveContentWrapper(
        maxWidth: 1240,
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: AppSpacing.pagePadding(context),
            child: _DesktopHomeBentoLayout(
              solved: stats.dailySolvedCount,
              goal: stats.dailyGoal,
              streakDays: stats.streakDays,
              isGoalMet: isGoalMet,
              remaining: remaining,
              pendingCount: pendingCount,
              weakestLesson: stats.weakestLesson,
            ),
          ),
        ),
      );
    }

    return ResponsiveContentWrapper(
      maxWidth: 720,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: AppSpacing.pagePadding(context),
        children: [
          // 1. Tuğrul Karşılama & Günlük Hedef Sahnesi (tek bütünleşik hero bloğu)
          _HomeHeroStage(
            solved: stats.dailySolvedCount,
            goal: stats.dailyGoal,
            streakDays: stats.streakDays,
            isGoalMet: isGoalMet,
            remaining: remaining,
          ),
          AppSpacing.gapMd,

          // 2. Sınav Takvimi (ana kontrol paneli)
          const _ExamCountdownBanner(),
          AppSpacing.gapMd,

          // 3. Zayıf Konu Önerisi (yanlış verisi oluştuğunda öne çıkar)
          if (stats.weakestLesson.isNotEmpty &&
              stats.weakestLesson != 'Henüz veri yok') ...[
            _WeakLessonHomeBanner(weakestLesson: stats.weakestLesson),
            AppSpacing.gapMd,
          ],

          // 4. Bugünün Çalışma Planı
          const HomeDailyPlanCard(),
          AppSpacing.gapMd,

          // 5. Hatırlatıcılar
          const SectionTitle('Hatırlatıcılar'),
          _SmartRemindersCard(
            pendingCount: pendingCount,
            remainingQuestions: remaining,
            streakDays: stats.streakDays,
            isGoalMet: isGoalMet,
            weakestLesson: stats.weakestLesson,
          ),
        ],
      ),
    );
  }
}

/// Web/Masaüstü (`>= 1024px`) için 12 kolon mantığında 2 sütunlu Bento kokpit düzeni.
///
/// Sol ana akış (`flex: 7`) Tuğrul hedef kartı, zayıf ders radarını ve günlük
/// çalışma planını; sağ aksiyon sütunu (`flex: 5`) ise sınav geri sayımı ile
/// akıllı hatırlatıcıları sergiler.
class _DesktopHomeBentoLayout extends StatelessWidget {
  final int solved;
  final int goal;
  final int streakDays;
  final bool isGoalMet;
  final int remaining;
  final int pendingCount;
  final String weakestLesson;

  const _DesktopHomeBentoLayout({
    required this.solved,
    required this.goal,
    required this.streakDays,
    required this.isGoalMet,
    required this.remaining,
    required this.pendingCount,
    required this.weakestLesson,
  });

  @override
  Widget build(BuildContext context) {
    final hasWeakLesson =
        weakestLesson.isNotEmpty && weakestLesson != 'Henüz veri yok';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HomeHeroStage(
                solved: solved,
                goal: goal,
                streakDays: streakDays,
                isGoalMet: isGoalMet,
                remaining: remaining,
              ),
              if (hasWeakLesson) ...[
                AppSpacing.gapMd,
                _WeakLessonHomeBanner(weakestLesson: weakestLesson),
              ],
              AppSpacing.gapMd,
              const HomeDailyPlanCard(),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _ExamCountdownBanner(),
              AppSpacing.gapMd,
              const SectionTitle('Hatırlatıcılar'),
              _SmartRemindersCard(
                pendingCount: pendingCount,
                remainingQuestions: remaining,
                streakDays: streakDays,
                isGoalMet: isGoalMet,
                weakestLesson: weakestLesson,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Tuğrul portresini günlük hedef çubuğu ve seri durumuyla tek sahnede buluşturan hero kartı.
class _HomeHeroStage extends StatelessWidget {
  final int solved;
  final int goal;
  final int streakDays;
  final bool isGoalMet;
  final int remaining;

  const _HomeHeroStage({
    required this.solved,
    required this.goal,
    required this.streakDays,
    required this.isGoalMet,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final progress = goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0);
    final percent = (progress * 100).round();
    final mood = isGoalMet ? TugrulMood.victory : TugrulMood.coach;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: isGoalMet
          ? colorScheme.secondary.withAlpha(120)
          : colorScheme.outlineVariant,
      lipColor: isGoalMet
          ? colorScheme.secondary.withAlpha(150)
          : colorScheme.outlineVariant.withAlpha(180),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsFill.flame,
                            size: 13,
                            color: colorScheme.tertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$streakDays Gün Seri',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isGoalMet ? 'Günlük hedef tamamlandı' : 'Hoş geldin',
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      solved == 0
                          ? 'Günün ilk testiyle KPSS ritmini yakala.'
                          : isGoalMet
                          ? '$solved soruyla bugünkü hedefi tamamladın.'
                          : 'Bugün $solved soru çözdün, hedefe $remaining soru kaldı.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              TugrulAvatar(
                mood: mood,
                size: ResponsiveBreakpoints.isDesktop(context) ? 88 : 70,
                ringColor: isGoalMet
                    ? colorScheme.secondary
                    : colorScheme.primary,
                tooltip: 'Tuğrul Çalışma Özeti',
                onTap: () => TugrulTipsSheet.show(context, mood: mood),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Sakin, yüksek kontrastlı ve nötr hedef kapsülü
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bugünkü hedefin',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$solved / $goal soru',
                            style: textTheme.titleLarge?.copyWith(
                              color: colorScheme.onSurface,
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '%$percent',
                        style: textTheme.labelLarge?.copyWith(
                          color: isGoalMet
                              ? colorScheme.secondary
                              : colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    minHeight: 8,
                    value: progress,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isGoalMet ? colorScheme.secondary : colorScheme.primary,
                    ),
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

class _SmartRemindersCard extends StatelessWidget {
  final int pendingCount;
  final int remainingQuestions;
  final int streakDays;
  final bool isGoalMet;
  final String weakestLesson;

  const _SmartRemindersCard({
    required this.pendingCount,
    required this.remainingQuestions,
    required this.streakDays,
    required this.isGoalMet,
    required this.weakestLesson,
  });

  @override
  Widget build(BuildContext context) {
    return TactileCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Column(
        children: [
          _ReminderItem(
            icon: PhosphorIconsRegular.clipboardText,
            title: 'Çalışma Planı',
            message: pendingCount > 0
                ? 'Bugün tamamlanmayı bekleyen $pendingCount çalışma görevin var'
                : 'Bugünkü çalışma planı görevlerinin tamamı bitti',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const StudyPlannerScreen()),
              );
            },
          ),
          const Divider(height: 1),
          _ReminderItem(
            icon: PhosphorIconsRegular.flame,
            title: 'Seri & Hedef',
            message: !isGoalMet
                ? '$streakDays günlük serini korumak için kalan: $remainingQuestions soru'
                : 'Günlük soru hedefini tamamladın, serin güvende',
            onTap: () {
              final dynamicLimit = remainingQuestions > 0
                  ? remainingQuestions.clamp(5, 20)
                  : 10;
              final targetLesson =
                  (weakestLesson.isNotEmpty &&
                      weakestLesson != 'Henüz veri yok')
                  ? weakestLesson
                  : null;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    fetchAllFromPool: true,
                    lessonFilter: targetLesson,
                    limit: dynamicLimit,
                    customTitle: 'Günlük Seri & Hedef Testi',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),
          _ReminderItem(
            icon: PhosphorIconsRegular.bookmarks,
            title: 'Hızlı Pratik',
            message: 'Yanlış defteri ve tekrar modlarıyla eksiklerini kapat',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class _ReminderItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final VoidCallback onTap;

  const _ReminderItem({
    required this.icon,
    required this.title,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: PhosphorIcon(
                icon,
                size: 18,
                color: colorScheme.onSurfaceVariant,
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
                    style: textTheme.titleSmall?.copyWith(
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
            const SizedBox(width: 8),
            PhosphorIcon(
              PhosphorIconsRegular.caretRight,
              size: 16,
              color: colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }
}

/// Ana sayfada en zayıf derse özel 10 soruluk güçlendirme önerisi.
class _WeakLessonHomeBanner extends StatelessWidget {
  final String weakestLesson;

  const _WeakLessonHomeBanner({required this.weakestLesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      lipColor: colorScheme.outlineVariant.withAlpha(180),
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
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(
              PhosphorIconsRegular.trendDown,
              size: 20,
              color: colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zayıf Konuyu Güçlendir · 10 Soru',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$weakestLesson dersindeki eksiklerini kapatmak için kısa test başlat.',
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
            color: colorScheme.outline,
            size: 16,
          ),
        ],
      ),
    );
  }
}

/// KPSS hedef sınav takvimi geri sayım kartı.
class _ExamCountdownBanner extends ConsumerWidget {
  const _ExamCountdownBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final prefs = ref.watch(userPreferencesProvider);
    final remoteConfig =
        ref.watch(appRemoteConfigProvider).asData?.value ??
        AppRemoteConfig.fallback;
    final selection = ExamSelection.fromLegacyTarget(prefs.targetExam);
    final remaining = selection.detailedRemaining(config: remoteConfig);

    return TactileCard(
      onTap: () => TargetExamSelectorBottomSheet.show(context),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorScheme.outlineVariant),
                ),
                alignment: Alignment.center,
                child: PhosphorIcon(
                  PhosphorIconsFill.calendarBlank,
                  size: 20,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selection.displayTitle,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      selection.subtitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => TargetExamSelectorBottomSheet.show(context),
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                child: const Text('Değiştir'),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Fiziksel takvim taşlarıyla YIL / AY / GÜN sayaç sırası (sakin, tek tip ve prestijli)
          Row(
            children: [
              Expanded(
                child: _CountdownMetricTile(
                  value: remaining.years.toString(),
                  label: 'YIL',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _CountdownMetricTile(
                  value: remaining.months.toString(),
                  label: 'AY',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _CountdownMetricTile(
                  value: remaining.days.toString(),
                  label: 'GÜN',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            'Toplam ${remaining.totalDays} gün kaldı',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            KpssExamTarget.osymDisclaimer,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _CountdownMetricTile extends StatelessWidget {
  final String value;
  final String label;

  const _CountdownMetricTile({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
