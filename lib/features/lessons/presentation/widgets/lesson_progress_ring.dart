import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Ders kartlarında dersin çözülen test oranını ve kostümlü Tuğrul portresini (veya ikonunu)
/// dairesel ilerleme halkasıyla sunan bileşen.
class LessonProgressRing extends StatelessWidget {
  final IconData icon;
  final TugrulMood? mascotMood;
  final Color? accentColor;
  final double progress;
  final int solvedCount;
  final int totalCount;
  final double size;

  const LessonProgressRing({
    super.key,
    required this.icon,
    this.mascotMood,
    this.accentColor,
    required this.progress,
    required this.solvedCount,
    required this.totalCount,
    this.size = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final targetProgress = progress.clamp(0.0, 1.0);
    final isCompleted = targetProgress >= 1.0;
    final ringColor = isCompleted
        ? colorScheme.secondary
        : (accentColor ?? colorScheme.primary);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: targetProgress),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, child) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: animatedValue,
                strokeWidth: 3.5,
                strokeCap: StrokeCap.round,
                backgroundColor: colorScheme.surfaceContainerHighest,
                color: animatedValue > 0
                    ? ringColor
                    : colorScheme.surfaceContainerHighest,
              ),
            ),
            if (mascotMood != null)
              TugrulAvatar(
                mood: mascotMood!,
                size: size - 10,
                ringWidth: 1.5,
                ringColor: ringColor.withAlpha(160),
                hasShadow: false,
              )
            else
              PhosphorIcon(icon, size: size * 0.42, color: ringColor),
            if (isCompleted)
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surface, width: 1.5),
                  ),
                  child: PhosphorIcon(
                    PhosphorIconsFill.checkCircle,
                    size: 12,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
