import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'turkey_map.dart';

/// KPSS Soru Kartı veya Çalışma Ekranları için Harita Taşıyıcı Kartı (Card Wrapper)
///
/// Angular/Web benzetmesi: Bu bileşen `<app-map-modal>` ve `<app-map-card>`
/// ikilisinin Flutter karşılığıdır. Kullanıcıya haritayı kart içinde sunar ve
/// '🔍 Büyüt' butonuna basıldığında çift parmakla yakınlaştırılabilen (pinch-to-zoom)
/// tam ekran diyalog açar.
class TurkeyMapCard extends StatelessWidget {
  final TurkeyMapConfig config;
  final ValueChanged<String>? onProvinceTap;
  final ValueChanged<TurkeyMapMarker>? onMarkerTap;
  final String? title;

  const TurkeyMapCard({
    super.key,
    required this.config,
    this.onProvinceTap,
    this.onMarkerTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Başlık ve Büyüt Butonu Çubuğu
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 10, 6),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.map,
                          size: 13,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          title ?? 'KPSS Harita İnceleme',
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Büyüt Butonu
                  InkWell(
                    onTap: () => _openZoomDialog(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.zoomIn,
                            size: 14,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Büyüt',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Harita Çizim Alanı
            GestureDetector(
              onTap: () => _openZoomDialog(context),
              child: Container(
                color: isDark
                    ? const Color(0xFF0F172A)
                    : const Color(0xFFF8FAFC),
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 10,
                ),
                child: TurkeyMap(
                  config: config,
                  onProvinceTap: onProvinceTap,
                  onMarkerTap: onMarkerTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Tam ekran inceleme ve pinch-to-zoom modal diyaloğu
  void _openZoomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Üst Bar: Kapat Butonu & İpucu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      LucideIcons.zoomIn,
                      color: Colors.white70,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'İki parmağınızla yakınlaştırabilirsiniz',
                      style: Theme.of(ctx).textTheme.bodySmall
                          ?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(LucideIcons.x, color: Colors.white),
                  onPressed: () => Navigator.of(ctx).pop(),
                  tooltip: 'Kapat',
                ),
              ],
            ),
            const SizedBox(height: 8),

            // İnteraktif Yakınlaştırma Alanı (InteractiveViewer)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: const Color(0xFF0F172A),
                padding: const EdgeInsets.all(12),
                child: InteractiveViewer(
                  minScale: 1.0,
                  maxScale: 4.5,
                  child: TurkeyMap(
                    config: config,
                    onProvinceTap: onProvinceTap,
                    onMarkerTap: onMarkerTap,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
