import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kullanıcının hazırlandığı sınav tarihine ve hedefine göre
/// 3 farklı tempo (Hafif, Orta, Hızlı) arasından seçim yaparak
/// otomatik çalışma programı kurmasını sağlayan etkileşimli modal.
///
/// Web/Angular Karşılığı: Auto Study Schedule Setup Modal Component.
class AutoStudyProgramModal extends ConsumerStatefulWidget {
  const AutoStudyProgramModal({super.key});

  /// Modal alt sayfayı kullanıcıya sunar.
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AutoStudyProgramModal(),
    );
  }

  @override
  ConsumerState<AutoStudyProgramModal> createState() =>
      _AutoStudyProgramModalState();
}

class _AutoStudyProgramModalState extends ConsumerState<AutoStudyProgramModal> {
  late StudyProgramPace _selectedPace;

  @override
  void initState() {
    super.initState();
    final currentPace = ref.read(userPreferencesProvider).studyProgramPace;
    _selectedPace = currentPace;
  }

  void _applyProgram(KpssExamTarget target, UserPreferencesState prefs) {
    ref
        .read(userPreferencesProvider.notifier)
        .setStudyProgramPace(_selectedPace);
    ref
        .read(studyStatsProvider.notifier)
        .updateDailyGoal(_selectedPace.dailyGoalQuestions);

    ref
        .read(studyPlannerProvider.notifier)
        .setupAutoProgram(
          examTarget: target,
          pace: _selectedPace,
          focusLesson: prefs.focusLesson,
        );

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const PhosphorIcon(
              PhosphorIconsFill.checkCircle,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${target.shortTitle} için ${_selectedPace.label} programın kuruldu!',
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForPace(StudyProgramPace pace) {
    switch (pace) {
      case StudyProgramPace.hafif:
        return PhosphorIconsDuotone.plant;
      case StudyProgramPace.orta:
        return PhosphorIconsDuotone.lightning;
      case StudyProgramPace.hizli:
        return PhosphorIconsDuotone.fire;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final prefs = ref.watch(userPreferencesProvider);
    final target = prefs.targetExam;
    final remaining = target.detailedRemaining();

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Çekme çizgisi
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant.withAlpha(120),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Başlık
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PhosphorIcon(
                  PhosphorIconsDuotone.sparkle,
                  size: 22,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otomatik Çalışma Programı',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sınav tarihine ve tempona göre kişisel günlük plan.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const PhosphorIcon(PhosphorIconsBold.x, size: 20),
                tooltip: 'Kapat',
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Kaydırılabilir Seçenekler ve Bilgiler
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Sınav Özeti Şeridi
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withAlpha(80),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: colorScheme.primary.withAlpha(60),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIconsBold.calendarCheck,
                          size: 20,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '🎯 ${target.title}',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '⏳ ${remaining.formattedRemaining} (${target.remainingDays()} Gün Kaldı)',
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 3 Tempo Seçeneği
                  ...StudyProgramPace.values.map((pace) {
                    final isSelected = _selectedPace == pace;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TactileCard(
                        onTap: () => setState(() => _selectedPace = pace),
                        backgroundColor: isSelected
                            ? colorScheme.primaryContainer.withAlpha(80)
                            : colorScheme.surface,
                        borderColor: isSelected
                            ? colorScheme.primary
                            : colorScheme.outlineVariant.withAlpha(90),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: PhosphorIcon(
                                _iconForPace(pace),
                                size: 22,
                                color: isSelected
                                    ? colorScheme.onPrimary
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          pace.label,
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: isSelected
                                                ? colorScheme.primary
                                                : colorScheme.onSurface,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? colorScheme.primary
                                              : colorScheme.secondaryContainer,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Text(
                                          pace.badgeText,
                                          style: textTheme.labelSmall?.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800,
                                            color: isSelected
                                                ? colorScheme.onPrimary
                                                : colorScheme
                                                      .onSecondaryContainer,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${pace.dailyGoalQuestions} Soru · ~${pace.estimatedMinutesPerDay} Dk / Gün',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    pace.description,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.outline,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            PhosphorIcon(
                              isSelected
                                  ? PhosphorIconsFill.checkCircle
                                  : PhosphorIconsRegular.circle,
                              size: 22,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.outlineVariant,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 6),

                  // Sınava Yayma Mantığı Açıklaması
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withAlpha(120),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.outlineVariant.withAlpha(80),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            PhosphorIcon(
                              PhosphorIconsDuotone.chartLineUp,
                              size: 16,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Sınava Yayma & Tur Projeksiyonu',
                              style: textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _selectedPace.calculatePacingSummary(target),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 11.5,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Mevcut Çalışma Türlerimiz Rozetleri
                  const Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _ActivityChip(
                        icon: PhosphorIconsDuotone.pencilLine,
                        label: 'Konu Testi',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsDuotone.cards,
                        label: 'Flashcards',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsDuotone.warning,
                        label: 'Yanlış Defteri',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsDuotone.mapTrifold,
                        label: 'Harita Pratiği',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsDuotone.gameController,
                        label: 'Kavram Oyunu',
                      ),
                      _ActivityChip(
                        icon: PhosphorIconsDuotone.trophy,
                        label: 'Mini Deneme',
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),

          // Buton: Programı Başlat
          FilledButton.icon(
            onPressed: () => _applyProgram(target, prefs),
            icon: const PhosphorIcon(PhosphorIconsBold.rocketLaunch, size: 18),
            label: Text(
              '${_selectedPace.label} Programını Başlat',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActivityChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(90),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outlineVariant.withAlpha(60)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, size: 13, color: colorScheme.primary),
          const SizedBox(width: 4),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
