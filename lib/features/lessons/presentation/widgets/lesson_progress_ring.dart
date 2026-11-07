import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Ders kartlarında dersin çözülen test oranını ve ikonunu dairesel bir ray üzerinde
/// animasyonlu olarak gösteren bileşen.
///
/// Web/Angular Karşılığı:
/// `<app-radial-progress-bar [value]="progress" [icon]="icon">` (Radial / Circular Progress Ring).
class LessonProgressRing extends StatelessWidget {
  /// Dersin görselini temsil eden ikon (örn. PhosphorIconsDuotone.scroll).
  final IconData icon;

  /// Çözülme oranı (0.0 ile 1.0 arasında değer alır).
  final double progress;

  /// Çözülen test adedi.
  final int solvedCount;

  /// Toplam test adedi.
  final int totalCount;

  /// Dairesel halkanın genişlik ve yükseklik boyutu (varsayılan: 52.0).
  final double size;

  const LessonProgressRing({
    super.key,
    required this.icon,
    required this.progress,
    required this.solvedCount,
    required this.totalCount,
    this.size = 52.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final targetProgress = progress.clamp(0.0, 1.0);
    final isCompleted = targetProgress >= 1.0;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: targetProgress),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, child) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // 1. Dairesel Ray ve İlerleme Göstergesi
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: animatedValue,
                strokeWidth: 3.5,
                strokeCap: StrokeCap.round,
                backgroundColor: colorScheme.surfaceContainerHighest,
                color: isCompleted
                    ? colorScheme.secondary
                    : (animatedValue > 0
                          ? colorScheme.secondary
                          : colorScheme.surfaceContainerHighest),
              ),
            ),

            // 2. Merkez İkon Kutusu - PhosphorIcon ile çift katmanlı Duotone render edilir
            Container(
              width: size - 10,
              height: size - 10,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: PhosphorIcon(
                  icon,
                  size: 22,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),

            // 3. %100 Tamamlanma Rozeti (Dersin tüm testleri çözüldüğünde minik tik rozeti)
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
                    size: 11,
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
