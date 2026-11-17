import 'package:flutter/material.dart';

/// Çoklu ekran boyutlarına göre çocuk bileşenleri dikey liste (`columns == 1`)
/// veya eşit yükseklikli satır ızgarası (`columns >= 2`) olarak düzenleyen yardımcı bileşen.
///
/// `GridView` yerine satır bazlı `IntrinsicHeight + Row` kullanır; böylece uzun
/// Türkçe başlıklar veya büyük yazı tipi ölçeklendirmelerinde kart taşması yaşanmaz.
///
/// Angular/Web Karşılığı: CSS Grid (`grid-template-columns: repeat(columns, 1fr)`).
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int columns;
  final double spacing;
  final double runSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.columns,
    this.spacing = 12,
    this.runSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    if (columns <= 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) SizedBox(height: runSpacing),
            children[i],
          ],
        ],
      );
    }

    final rows = <Widget>[];
    for (var start = 0; start < children.length; start += columns) {
      final end = (start + columns).clamp(0, children.length);
      final rowChildren = <Widget>[];
      for (var col = 0; col < columns; col++) {
        if (col > 0) {
          rowChildren.add(SizedBox(width: spacing));
        }
        final itemIndex = start + col;
        if (itemIndex < end) {
          rowChildren.add(Expanded(child: children[itemIndex]));
        } else {
          rowChildren.add(const Expanded(child: SizedBox.shrink()));
        }
      }
      if (rows.isNotEmpty) {
        rows.add(SizedBox(height: runSpacing));
      }
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowChildren,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}
