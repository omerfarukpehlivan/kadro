import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kullanıcının hazırlandığı KPSS sınavını (Lisans, Ön Lisans, Ortaöğretim, DHBT)
/// seçmesini veya değiştirmesini sağlayan modern alt menü (Bottom Sheet).
///
/// Web/Angular Karşılığı: Target Exam Selection Modal / BottomSheet Component.
class TargetExamSelectorBottomSheet extends ConsumerWidget {
  final KpssExamTarget? selectedTarget;

  const TargetExamSelectorBottomSheet({super.key, this.selectedTarget});

  /// Modal alt sayfayı kullanıcıya sunar ve seçilen hedef sınavı döndürür.
  static Future<KpssExamTarget?> show(
    BuildContext context, {
    KpssExamTarget? currentTarget,
  }) {
    return showModalBottomSheet<KpssExamTarget>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          TargetExamSelectorBottomSheet(selectedTarget: currentTarget),
    );
  }

  IconData _iconForTarget(KpssExamTarget target) {
    switch (target) {
      case KpssExamTarget.lisans:
      case KpssExamTarget.lisans2028:
        return PhosphorIconsDuotone.graduationCap;
      case KpssExamTarget.onlisans:
        return PhosphorIconsDuotone.certificate;
      case KpssExamTarget.ortaogretim:
        return PhosphorIconsDuotone.books;
      case KpssExamTarget.dhbt:
        return PhosphorIconsDuotone.scroll;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final activeTarget =
        selectedTarget ?? ref.watch(userPreferencesProvider).targetExam;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Çekme çizgisi (Handle bar)
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

          // Başlık ve Açıklama
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PhosphorIcon(
                  PhosphorIconsDuotone.target,
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
                      'KPSS Sınav Hedefini Seç',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Geri sayım sayacın ve çalışma planın bu sınava göre kurulur.',
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

          // Kaydırılabilir Sınav Seçenekleri Listesi
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...KpssExamTarget.values.map((target) {
                    final isSelected = target == activeTarget;
                    final remaining = target.detailedRemaining();

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TactileCard(
                        onTap: () {
                          ref
                              .read(userPreferencesProvider.notifier)
                              .setTargetExam(target);
                          ref
                              .read(pomodoroProvider.notifier)
                              .selectExamTarget(target);
                          Navigator.of(context).pop(target);
                        },
                        backgroundColor: isSelected
                            ? colorScheme.primaryContainer.withAlpha(90)
                            : colorScheme.surface,
                        borderColor: isSelected
                            ? colorScheme.primary
                            : colorScheme.outlineVariant.withAlpha(80),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        child: Row(
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
                                _iconForTarget(target),
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
                                          target.title,
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: isSelected
                                                ? colorScheme.primary
                                                : colorScheme.onSurface,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    target.subtitle,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '⏳ ${remaining.formattedRemaining}',
                                    style: textTheme.labelSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.primary,
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

                  // ÖSYM Resmi Takvim Bilgilendirme Notu
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withAlpha(120),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.outlineVariant.withAlpha(80),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsDuotone.info,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            KpssExamTarget.osymDisclaimer,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 11.5,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
