import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Kadro Koçu'nun ruh hali (mood) ve derse özel görsel varyasyonları.
///
/// Angular/Web karşılığı:
/// Gamification avatar model varyasyonları (Duolingo/Babbel karakter durumları).
enum MascotMood {
  coach,
  victory,
  detective,
  pro,
  history,
  geography,
  citizenship,
  current,
}

/// [MascotMood] için dosya yolu ve ders eşleştirme yardımcı fonksiyonları.
extension MascotMoodExtension on MascotMood {
  /// Her mood için ilgili görsel varlığın dosya yolu.
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
      case MascotMood.history:
        return 'assets/images/mascot/tugrul_history.png';
      case MascotMood.geography:
        return 'assets/images/mascot/tugrul_geography.png';
      case MascotMood.citizenship:
        return 'assets/images/mascot/tugrul_citizenship.png';
      case MascotMood.current:
        return 'assets/images/mascot/tugrul_current.png';
    }
  }

  /// Verilen KPSS ders adına göre uygun Tuğrul karakterini seçer.
  ///
  /// Örnek:
  /// - 'Tarih' -> [MascotMood.history] (Selçuklu miğferli Tuğrul Alp)
  /// - 'Coğrafya' -> [MascotMood.geography] (Kâşif Tuğrul)
  /// - 'Vatandaşlık' -> [MascotMood.citizenship] (Hukukçu Tuğrul)
  /// - 'Güncel Bilgiler' -> [MascotMood.current] (Haberci Tuğrul)
  static MascotMood fromLesson(String? lesson) {
    final normalized = (lesson ?? '').toLowerCase().trim();
    if (normalized.contains('tarih')) return MascotMood.history;
    if (normalized.contains('coğrafya') || normalized.contains('cografya')) {
      return MascotMood.geography;
    }
    if (normalized.contains('vatandaşlık') ||
        normalized.contains('vatandaslik')) {
      return MascotMood.citizenship;
    }
    if (normalized.contains('güncel') || normalized.contains('guncel')) {
      return MascotMood.current;
    }
    return MascotMood.coach;
  }
}

/// "Kadro Koçu" çerçevesiz pop-out maskot konuşma balonu ve rehberlik bileşeni.
///
/// Web/Angular karşılığı:
/// Gamification bildirim bileşeni (Duolingo banner/speech bubble).
/// 84x84 kısıtlayıcı kutulardan arındırılmış, 100x100 büyük çerçevesiz yapısıyla
/// karakterin doğrudan konuşma balonunun yanından fırlamasını (pop-out) sağlar.
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

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: colorScheme.primary.withAlpha(110),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.alphaBlend(
              colorScheme.primary.withAlpha(70),
              colorScheme.surface,
            ),
            offset: const Offset(0, 3.5),
            blurRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sol: Çerçevesiz Pop-Out 100x100 Maskot Sahnesi + Minyatür Yıldız Rozeti
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      mood.assetPath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        LucideIcons.award,
                        color: colorScheme.primary,
                        size: 48,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        LucideIcons.sparkles,
                        size: 12,
                        color: colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),

              // Sağ: Rozet, Başlık ve Konuşma Balonu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Üst Rozet Hapı (badgeLabel)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        badgeLabel,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Başlık
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Konuşma Balonu
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: Text(
                        message,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
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
    );
  }
}
