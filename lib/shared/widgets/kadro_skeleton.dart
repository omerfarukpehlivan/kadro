import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';

/// İçerik yüklenirken kullanılan, Flutter'ın yerleşik animasyonuyla yumuşak
/// opaklık nabzı üreten tekil iskelet kutusu (`TASK-181`).
///
/// `MediaQuery.disableAnimations` etkinse animasyon durdurulur.
///
/// Angular/Web Karşılığı: CSS `@keyframes pulse` kullanan `<Skeleton />` bileşeni.
class KadroSkeletonBox extends StatefulWidget {
  final double? width;
  final double height;
  final double borderRadius;

  const KadroSkeletonBox({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = 8,
  });

  @override
  State<KadroSkeletonBox> createState() => _KadroSkeletonBoxState();
}

class _KadroSkeletonBoxState extends State<KadroSkeletonBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  bool _reduceMotion = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _opacity = Tween<double>(
      begin: 0.45,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    if (disableAnimations != _reduceMotion ||
        (!disableAnimations && !_controller.isAnimating)) {
      _reduceMotion = disableAnimations;
      if (_reduceMotion) {
        _controller.stop();
        _controller.value = 0.5;
      } else if (!_controller.isAnimating) {
        _controller.repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final box = Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
    );

    return Semantics(
      label: 'Yükleniyor',
      child: _reduceMotion
          ? Opacity(opacity: 0.72, child: box)
          : FadeTransition(opacity: _opacity, child: box),
    );
  }
}

/// Liste veya konu satırı görünümünde `n` adet kart iskeleti üreten hazır
/// yükleme bileşeni (`TASK-181`).
///
/// Angular/Web Karşılığı: Liste düzenini taklit eden `SkeletonList` şablonu.
class KadroSkeletonList extends StatelessWidget {
  final int itemCount;
  final EdgeInsetsGeometry padding;
  final double itemSpacing;

  const KadroSkeletonList({
    super.key,
    this.itemCount = 4,
    this.padding = const EdgeInsets.all(16),
    this.itemSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: 'Yükleniyor',
      excludeSemantics: true,
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < itemCount; i++) ...[
              if (i > 0) SizedBox(height: itemSpacing),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.outlineVariant,
                    width: 1.5,
                  ),
                ),
                child: const Row(
                  children: [
                    KadroSkeletonBox(width: 44, height: 44, borderRadius: 12),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KadroSkeletonBox(height: 16, borderRadius: 6),
                          SizedBox(height: 8),
                          KadroSkeletonBox(
                            width: 160,
                            height: 12,
                            borderRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    KadroSkeletonBox(width: 52, height: 24, borderRadius: 10),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Çok sütunlu kart düzenleri (Dersler, Denemeler, İstatistik vb.) için
/// [ResponsiveGrid] tabanlı yükleme iskeleti (`TASK-181`).
///
/// Angular/Web Karşılığı: `ResponsiveGrid` üzerinde `SkeletonCard` ızgarası.
class KadroSkeletonCardGrid extends StatelessWidget {
  final int itemCount;
  final int? columns;
  final EdgeInsetsGeometry padding;

  const KadroSkeletonCardGrid({
    super.key,
    this.itemCount = 4,
    this.columns,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: 'Yükleniyor',
      excludeSemantics: true,
      child: Padding(
        padding: padding,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final resolvedColumns =
                columns ?? (constraints.maxWidth >= 600 ? 2 : 1);
            return ResponsiveGrid(
              columns: resolvedColumns,
              children: [
                for (var i = 0; i < itemCount; i++)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.outlineVariant,
                        width: 1.5,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            KadroSkeletonBox(
                              width: 40,
                              height: 40,
                              borderRadius: 12,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: KadroSkeletonBox(
                                height: 18,
                                borderRadius: 6,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        KadroSkeletonBox(height: 12, borderRadius: 6),
                        SizedBox(height: 8),
                        KadroSkeletonBox(
                          width: 140,
                          height: 12,
                          borderRadius: 6,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
