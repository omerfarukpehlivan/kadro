import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bilimsel çizim kartlarının (`ClimateChartCard`, `GeoDiagramCard`,
/// `PopulationPyramidCard`, `SunDiagramCard`, `TurkeyMapCard`) ortak iskeleti.
///
/// Önceden beş kart aynı çerçeveyi (`16px` köşe, `1.5px` kenarlık, `3px` alt
/// dudak), aynı başlık rozetini ve aynı "Büyüt" düğmesini ayrı ayrı kopyalıyordu.
/// Artık çerçeve [TactileCard], başlık rozeti [KadroBadge] üzerinden gelir;
/// kartlar yalnızca kendi gövde bölümlerini ([children]) verir.
///
/// Web/Angular Karşılığı: İçerik yansıtmalı (`<ng-content>`) ortak
/// `<app-diagram-card>` kabuk bileşeni.
class DiagramCardShell extends StatelessWidget {
  /// Başlık rozetindeki ikon (örn. `PhosphorIconsRegular.cloudRain`).
  final IconData icon;

  /// Başlık rozeti metni (örn. "KPSS İklim Analizi").
  final String badgeLabel;

  /// Başlık rozetinin anlamsal tonu.
  final KadroBadgeTone badgeTone;

  /// "Büyüt" düğmesine basıldığında çağrılır.
  final VoidCallback onZoom;

  /// Başlık şeridinin altında sırayla gösterilen gövde bölümleri.
  final List<Widget> children;

  const DiagramCardShell({
    super.key,
    required this.icon,
    required this.badgeLabel,
    required this.onZoom,
    required this.children,
    this.badgeTone = KadroBadgeTone.primary,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TactileCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Başlık ve Büyüt Butonu Çubuğu
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 10, 6),
              child: Row(
                children: [
                  Flexible(
                    child: KadroBadge(
                      label: badgeLabel,
                      icon: icon,
                      tone: badgeTone,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: onZoom,
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
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Diyagram kartlarında çizimin üstündeki şema başlığı satırı.
class DiagramTitle extends StatelessWidget {
  final String title;

  const DiagramTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// Kartın en altındaki `surfaceContainer` zeminli, üst kenarlıklı şerit.
///
/// Web/Angular Karşılığı: `<app-card-footer>` sarmalayıcısı.
class DiagramFooterStrip extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const DiagramFooterStrip({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: child,
    );
  }
}

/// Alt şeritte ikonlu eğitici not (`educationalNote`) satırı.
class DiagramNoteStrip extends StatelessWidget {
  final String note;
  final Color? iconColor;

  const DiagramNoteStrip({super.key, required this.note, this.iconColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return DiagramFooterStrip(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 6),
            child: PhosphorIcon(
              PhosphorIconsRegular.info,
              size: 13,
              color: iconColor ?? colorScheme.tertiary,
            ),
          ),
          Expanded(
            child: Text(
              note,
              style: theme.textTheme.bodySmall?.copyWith(
                height: 1.35,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Diyagram kartlarındaki özet istatistik rozeti (örn. "Yıllık Yağış: ~650 mm").
///
/// Eskiden her kartta ayrı `_buildStatBadge()` yardımcı metodu vardı; artık
/// renk tonlu [KadroBadge] üzerinden tek tasarımda sunulur.
class DiagramStatBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const DiagramStatBadge({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return KadroBadge(
      label: label,
      icon: icon,
      backgroundColor: color.withValues(alpha: 0.08),
      foregroundColor: color,
      borderColor: color.withValues(alpha: 0.25),
    );
  }
}

/// Diyagram yakınlaştırma diyaloglarının ortak kabuk şekli
/// (`20px` köşe + `1.5px` kenarlık; [KadroConfirmDialog] ile aynı).
ShapeBorder diagramDialogShape(ColorScheme colorScheme) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
  );
}

/// Diyagramı pinch-to-zoom (`InteractiveViewer`) destekli tam ekran
/// diyalogda açar. [chartBuilder] büyütülmüş çizimi üretir.
///
/// Web/Angular Karşılığı: `MatDialog.open(DiagramZoomComponent, {data})`.
Future<void> showDiagramZoomDialog(
  BuildContext context, {
  required IconData icon,
  required Color iconColor,
  required String title,
  required WidgetBuilder chartBuilder,
  double maxHeight = 480,
}) {
  return showDialog<void>(
    context: context,
    builder: (ctx) {
      final ctxTheme = Theme.of(ctx);
      final ctxScheme = ctxTheme.colorScheme;
      final ctxText = ctxTheme.textTheme;
      return Dialog(
        backgroundColor: ctxScheme.surface,
        shape: diagramDialogShape(ctxScheme),
        clipBehavior: Clip.antiAlias,
        insetPadding: const EdgeInsets.all(12),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 580, maxHeight: maxHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Modal Başlık
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 12, 8),
                child: Row(
                  children: [
                    PhosphorIcon(icon, size: 16, color: iconColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
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

              // Yakınlaştırılabilir Çizim Alanı
              Expanded(
                child: InteractiveViewer(
                  minScale: 1.0,
                  maxScale: 3.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: chartBuilder(ctx)),
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
