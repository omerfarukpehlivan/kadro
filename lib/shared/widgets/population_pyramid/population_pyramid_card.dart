import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'population_pyramid.dart';

/// KPSS Nüfus Piramidi Taşıyıcı Kart Bileşeni
class PopulationPyramidCard extends StatelessWidget {
  final PopulationPyramidConfig config;
  final String? title;

  const PopulationPyramidCard({super.key, required this.config, this.title});

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
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.users,
                          size: 13,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          title ?? 'KPSS Demografi & Nüfus Piramidi',
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

            // Görsel Piramit Tuvali
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
              child: PopulationPyramid(config: config, height: 220),
            ),

            // İstatistik Rozetleri (Ortanca Yaş, Aktif, Yaşlı)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                alignment: WrapAlignment.center,
                children: [
                  _buildStatBadge(
                    context: context,
                    icon: PhosphorIconsRegular.calendar,
                    label: 'Ortanca Yaş: ${config.medianAge}',
                    color: colorScheme.primary,
                  ),
                  _buildStatBadge(
                    context: context,
                    icon: PhosphorIconsRegular.briefcase,
                    label: '15-64 Aktif: %${config.workingAgePercent}',
                    color: colorScheme.secondary,
                  ),
                  _buildStatBadge(
                    context: context,
                    icon: PhosphorIconsRegular.heartbeat,
                    label: '65+ Yaşlı: %${config.elderlyPercent}',
                    color: colorScheme.error,
                  ),
                ],
              ),
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
                      color: colorScheme.primary,
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

  Widget _buildStatBadge({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
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
            constraints: const BoxConstraints(maxWidth: 580, maxHeight: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Başlık
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 12, 8),
                  child: Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIconsRegular.users,
                        size: 16,
                        color: ctxScheme.primary,
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

                // Yakınlaştırılabilir Piramit Alanı
                Expanded(
                  child: InteractiveViewer(
                    minScale: 1.0,
                    maxScale: 3.5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: PopulationPyramid(config: config, height: 320),
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
                          'Çift parmakla yakınlaştırabilirsiniz',
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
