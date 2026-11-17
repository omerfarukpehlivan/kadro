import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'sun_diagram.dart';

/// KPSS Güneş Açısı ve Mevsim Şeması Taşıyıcı Kart Bileşeni
class SunDiagramCard extends StatelessWidget {
  final SunDiagramConfig config;
  final String? title;

  const SunDiagramCard({super.key, required this.config, this.title});

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
              padding: const EdgeInsets.fromLTRB(14, 10, 10, 6),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.sun,
                          size: 13,
                          color: colorScheme.onTertiaryContainer,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          title ?? 'KPSS Güneş Açısı & Mevsim Şeması',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onTertiaryContainer,
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
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Büyüt',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
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

            // Şema Başlığı
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              child: Text(
                config.title,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Görsel Güneş Şeması Tuvali
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 6),
              child: SunDiagram(config: config, height: 185),
            ),

            // Alt Eğitici Not Şeridi
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                border: Border(
                  top: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, right: 6),
                    child: PhosphorIcon(
                      PhosphorIconsRegular.info,
                      size: 13,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      config.educationalNote,
                      style: textTheme.bodySmall?.copyWith(
                        height: 1.35,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openZoomDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        final ctxTheme = Theme.of(ctx);
        final ctxScheme = ctxTheme.colorScheme;
        final ctxText = ctxTheme.textTheme;
        return Dialog(
          backgroundColor: ctxScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: ctxScheme.outlineVariant),
          ),
          insetPadding: const EdgeInsets.all(12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580, maxHeight: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Başlık
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 12, 8),
                  child: Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIconsRegular.sun,
                        size: 16,
                        color: ctxScheme.tertiary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          config.title,
                          style: ctxText.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const PhosphorIcon(
                          PhosphorIconsRegular.x,
                          size: 18,
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                // Yakınlaştırılabilir Şema Alanı
                Expanded(
                  child: InteractiveViewer(
                    minScale: 1.0,
                    maxScale: 3.5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: SunDiagram(config: config, height: 260),
                      ),
                    ),
                  ),
                ),

                // Kapat Butonu ve İpucu
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          ResponsiveBreakpoints.zoomHintText(ctx),
                          style: ctxText.bodySmall?.copyWith(
                            color: ctxScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Kapat'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
