import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Kadro Koçu'nun ruh hali (mood) ve görsel varyasyonları.
enum MascotMood { coach, victory, detective, pro }

extension MascotMoodExtension on MascotMood {
  String get assetPath {
    switch (this) {
      case MascotMood.coach:
        return 'assets/images/mascot/tugrul_coach.png';
      case MascotMood.victory:
        return 'assets/images/mascot/tugrul_victory.png';
      case MascotMood.detective:
        return 'assets/images/mascot/tugrul_detective.png';
      case MascotMood.pro:
        return 'assets/images/mascot/tugrul_pro.png';
    }
  }
}

/// "Kadro Koçu" maskot konuşma balonu ve rehberlik bileşeni.
///
/// Web/Angular karşılığı:
/// Gamification bildirim bileşeni (Duolingo banner/speech bubble).
/// Adaya samimi, cesaretlendirici ve stratejik KPSS rehberlik mesajları sunar.
class MascotCoachBanner extends StatelessWidget {
  final MascotMood mood;
  final String title;
  final String message;
  final String badgeLabel;

  const MascotCoachBanner({
    super.key,
    this.mood = MascotMood.coach,
    required this.title,
    required this.message,
    this.badgeLabel = 'KADRO KOÇU',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.primaryContainer.withAlpha(75),
      borderColor: colorScheme.primary.withAlpha(90),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Solda 72x72 çerçeveli maskot portresi
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colorScheme.tertiary, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                mood.assetPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  LucideIcons.award,
                  color: colorScheme.primary,
                  size: 36,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // 2. Sağda konuşma balonu içeriği
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badgeLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
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
