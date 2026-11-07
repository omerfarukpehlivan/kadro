import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

/// "Kadro Koçu" maskot konuşma balonu ve rehberlik bileşeni.
///
/// Web/Angular karşılığı:
/// Gamification bildirim bileşeni (Duolingo banner/speech bubble).
/// 92x92 boyutundaki çift katmanlı altın/indigo çerçeveli avatar yapısı ve
/// zıplamaları önleyen sabit dikey baseline'ı ile tüm sekmelerde kusursuz
/// görsel akıcılık sunar.
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
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final avatarSize = isCompact ? 72.0 : 92.0;
    final minHeight = isCompact ? 96.0 : 122.0;

    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
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
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 10 : 14,
            vertical: isCompact ? 8 : 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sol: Çift Katmanlı Borderlı Maskot Çerçevesi + Rozet
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: avatarSize,
                    height: avatarSize,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(isCompact ? 16 : 20),
                      border: Border.all(
                        color: colorScheme.primary.withAlpha(90),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(isCompact ? 14 : 18),
                      child: Image.asset(
                        mood.assetPath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            PhosphorIcon(
                              PhosphorIconsDuotone.trophy,
                              color: colorScheme.primary,
                              size: isCompact ? 32 : 40,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -2,
                    bottom: -2,
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
                      child: PhosphorIcon(
                        PhosphorIconsFill.trophy,
                        size: isCompact ? 10 : 12,
                        color: colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: isCompact ? 10 : 14),

              // Sağ: Rozet, Başlık ve Tam Genişlik Konuşma Balonu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Üst Rozet Hapı (badgeLabel)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isCompact ? 8 : 10,
                        vertical: isCompact ? 2 : 3,
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
                          fontSize: isCompact ? 10 : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Başlık (Tek satır, sayfalar arası dikey zıplamayı önler)
                    Text(
                      title,
                      style:
                          (isCompact
                                  ? textTheme.titleSmall
                                  : textTheme.titleMedium)
                              ?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w800,
                              ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Konuşma Balonu (Tam genişlik ve 2 satır sabit ritim)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: isCompact ? 10 : 12,
                        vertical: isCompact ? 6 : 8,
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
                          height: 1.3,
                          fontSize: isCompact ? 11 : null,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
