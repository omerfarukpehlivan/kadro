import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Memur Adayı Kimlik & Rütbe Kartı ve Canlı 2026 KPSS Geri Sayım Şeridi.
///
/// Web/Angular Karşılığı: `CandidateProfileHeroComponent` / User Identity Card.
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Ana Aday Kimlik Kartı
        TactileCard(
          backgroundColor: colorScheme.surface,
          borderColor: auth.isAuthenticated
              ? colorScheme.primary.withAlpha(120)
              : colorScheme.outlineVariant,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Aday Avatarı (Tuğrul Maskotu veya Baş Harf)
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.primary.withAlpha(90),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/images/mascot/tugrul_coach.png',
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Text(
                            displayName.isNotEmpty
                                ? displayName[0].toUpperCase()
                                : 'K',
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.gapHorizontalSm,
                  // Aday İsim, E-posta ve Katılım
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
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onSurface,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (prefs.isPro)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.tertiaryContainer,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'PRO VIP',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onTertiaryContainer,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          auth.isAuthenticated
                              ? 'Hesap: $emailText'
                              : emailText,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '2027 KPSS Lisans Genel Kültür Hazırlığı',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.outline,
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
              // Hedef Sınav & Hedef Puan Bilgisi (Onboarding Sihirbazı Köprüsü)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KPSS Hedefim: ${prefs.targetKpssScore}+ Puan',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
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
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const OnboardingScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                    ),
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.compass,
                      size: 14,
                    ),
                    label: const Text('Hedef Sihirbazını Aç'),
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacing.gapSm,

        // 2. Canlı 2027 KPSS Geri Sayım Şeridi
        const _KpssCountdownStrip(),
      ],
    );
  }
}

/// 2027 KPSS Lisans sınav tarihine kalan günleri motive edici dille sayan şerit.
class _KpssCountdownStrip extends StatelessWidget {
  const _KpssCountdownStrip();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // 2027 KPSS Lisans Genel Yetenek - Genel Kültür Hedef Tarihi (ÖSYM Takvimi Temsili Projeksiyon: 5 Eylül 2027)
    final targetDate = DateTime(2027, 9, 5);
    final now = DateTime.now();
    final remainingDays = targetDate.difference(now).inDays.clamp(0, 999);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withAlpha(90),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.primary.withAlpha(60), width: 1),
      ),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsBold.timer,
            size: 20,
            color: colorScheme.primary,
          ),
          AppSpacing.gapHorizontalSm,
          Expanded(
            child: Text.rich(
              TextSpan(
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
                children: [
                  const TextSpan(
                    text: '⏳ 2027 KPSS Lisans: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '$remainingDays Gün Kaldı',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: colorScheme.primary,
                    ),
                  ),
                  const TextSpan(text: ' · Her gün 1 net, zirveye adım!'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
