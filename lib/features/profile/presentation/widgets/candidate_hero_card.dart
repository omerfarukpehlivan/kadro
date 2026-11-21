import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Memur adayı kimlik kartı.
///
/// Web/Angular karşılığı: `CandidateProfileHeroComponent`.
class CandidateHeroCard extends ConsumerWidget {
  final AuthUserState auth;
  final UserPreferencesState prefs;

  const CandidateHeroCard({super.key, required this.auth, required this.prefs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final displayName = auth.isAuthenticated
        ? auth.displayName
        : 'Kadro Misafiri';
    final emailText = auth.isAuthenticated
        ? (auth.email ?? 'E-posta belirtilmedi')
        : 'Hesap Bağlanmadı (Yerel Çalışma)';

    final goalInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KPSS Hedefim: ${prefs.targetKpssScore}+ Puan',
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Odak Ders: ${prefs.focusLesson} · Günlük Hedef: ${prefs.targetDailyStudyGoal} Soru',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );

    final editGoalButton = OutlinedButton.icon(
      onPressed: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).push(MaterialPageRoute(builder: (_) => const OnboardingScreen()));
      },
      style: OutlinedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 36),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),
      icon: const PhosphorIcon(PhosphorIconsRegular.compass, size: 14),
      label: const Text('Hedefi Düzenle'),
    );

    return TactileCard(
      borderColor: auth.isAuthenticated
          ? colorScheme.primary
          : colorScheme.outlineVariant,
      lipColor: auth.isAuthenticated ? colorScheme.primary : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TugrulAvatar(
                mood: prefs.isPro ? TugrulMood.pro : TugrulMood.coach,
                size: 56,
                ringColor: prefs.isPro
                    ? colorScheme.tertiary
                    : colorScheme.primary,
                onTap: () => TugrulTipsSheet.show(
                  context,
                  mood: prefs.isPro ? TugrulMood.pro : TugrulMood.coach,
                ),
              ),
              AppSpacing.gapHorizontalSm,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      children: [
                        Text(
                          displayName,
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (prefs.isPro)
                          const KadroBadge(
                            label: 'PRO',
                            tone: KadroBadgeTone.tertiary,
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      auth.isAuthenticated ? 'Hesap: $emailText' : emailText,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      prefs.examSelection.displayTitle,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.gapSm,
          const Divider(height: 1),
          AppSpacing.gapSm,
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 330) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    goalInfo,
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: editGoalButton,
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: goalInfo),
                  const SizedBox(width: 8),
                  editGoalButton,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
