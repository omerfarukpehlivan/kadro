import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    return DiagramCardShell(
      icon: PhosphorIconsRegular.mapTrifold,
      badgeLabel: title ?? 'KPSS Harita İnceleme',
      onZoom: () => _openZoomDialog(context),
      children: [
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
          shape: diagramDialogShape(ctxScheme),
          clipBehavior: Clip.antiAlias,
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
                                ResponsiveBreakpoints.zoomHintText(ctx),
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
