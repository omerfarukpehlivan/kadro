import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'turkey_map.dart';

/// KPSS Soru Kartı veya Çalışma Ekranları için Harita Taşıyıcı Kartı (Card Wrapper)
///
/// Angular/Web benzetmesi: Bu bileşen `<app-map-modal>` ve `<app-map-card>`
/// ikilisinin Flutter karşılığıdır. Kullanıcıya haritayı kart içinde sunar ve
/// 'Büyüt' butonuna basıldığında çift parmakla yakınlaştırılabilen (pinch-to-zoom)
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
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: colorScheme.outlineVariant, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: colorScheme.outlineVariant,
            offset: const Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Başlık ve Büyüt Butonu Çubuğu
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 4),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.mapTrifold,
                          size: 13,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          title ?? 'KPSS Harita İnceleme',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Büyüt Butonu
                  InkWell(
                    onTap: () => _openZoomDialog(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsRegular.magnifyingGlassPlus,
                            size: 14,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Büyüt',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
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
                color: colorScheme.surface,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
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
    showDialog<void>(
      context: context,
      barrierColor: Theme.of(context).colorScheme.scrim.withValues(alpha: 0.72),
      builder: (ctx) {
        final ctxTheme = Theme.of(ctx);
        final ctxScheme = ctxTheme.colorScheme;
        final ctxText = ctxTheme.textTheme;
        final viewportHeight = MediaQuery.sizeOf(ctx).height;
        return Dialog(
          backgroundColor: ctxScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: ctxScheme.outlineVariant),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1120,
              maxHeight: viewportHeight * 0.88,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Üst Bar: Kapat Butonu & İpucu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            PhosphorIcon(
                              PhosphorIconsRegular.magnifyingGlassPlus,
                              color: ctxScheme.onSurfaceVariant,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'İki parmağınızla yakınlaştırabilirsiniz',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: ctxText.bodySmall?.copyWith(
                                  color: ctxScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: PhosphorIcon(
                          PhosphorIconsRegular.x,
                          color: ctxScheme.onSurface,
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                        tooltip: 'Kapat',
                      ),
                    ],
                  ),
                  const Divider(height: 1),
                  const SizedBox(height: 8),

                  // İnteraktif Yakınlaştırma Alanı (InteractiveViewer)
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: ctxScheme.surfaceContainerLow,
                        padding: const EdgeInsets.all(8),
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
