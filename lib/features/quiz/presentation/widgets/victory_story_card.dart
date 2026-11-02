import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Instagram ve WhatsApp hikayelerine uygun 9:16 formatında Zafer Karnesi paylaşım kartı.
///
/// Angular'daki `ShareStoryCardComponent` karşılığıdır.
/// Kullanıcının test sonucunu sosyal medyada paylaşarak organik viral döngü
/// (word-of-mouth growth) oluşturmasını sağlar.
class VictoryStoryCard extends StatelessWidget {
  final QuizResult result;
  final String? testTitle;

  const VictoryStoryCard({super.key, required this.result, this.testTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final netDisplay = result.net % 1 == 0
        ? result.net.toInt().toString()
        : result.net.toStringAsFixed(2);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.surfaceContainerHighest],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.tertiary, width: 2),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withAlpha(50),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Üst Rozet
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LucideIcons.sparkles,
                    color: colorScheme.tertiary,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'KADRO · KPSS GENEL KÜLTÜR',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 2. Maskot
              Image.asset(
                'assets/images/mascot/tugrul_victory.png',
                height: 84,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  LucideIcons.trophy,
                  size: 72,
                  color: colorScheme.tertiary,
                ),
              ),

              // 3. Test Başlığı
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  testTitle ?? 'Genel Kültür Testi',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // 4. Dev Net Göstergesi
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$netDisplay NET',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: colorScheme.tertiary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    '60 Soru Üzerinden',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              // 5. 3'lü Metrik Çubuğu
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withAlpha(220),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withAlpha(120),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Doğru: ${result.correctCount}  |  Yanlış: ${result.wrongCount}  |  Başarı: %${result.successRate}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // 6. Derece Rozeti
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colorScheme.tertiary, width: 1.2),
                ),
                child: Text(
                  result.net >= 45
                      ? '🦅 KADRO DERECE ADAYI'
                      : '🎯 HEDEF 60\'TA 60',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),

              // 7. Alt Çağrı (Call-to-Action)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withAlpha(150),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Benimle KPSS düellosuna var mısın? 📲 com.omer.kadro',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
