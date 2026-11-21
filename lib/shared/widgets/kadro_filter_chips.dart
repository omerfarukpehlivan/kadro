import 'package:flutter/material.dart';

/// [KadroFilterChips] içindeki tek bir filtre seçeneğinin veri sözleşmesi (`TASK-153`).
@immutable
class KadroFilterOption<T> {
  final T value;
  final String label;
  final Key? key;

  const KadroFilterOption({required this.value, required this.label, this.key});
}

/// Ders, zaman aralığı veya kategori filtreleme çiplerini ekran genişliğine göre
/// sarmalayarak veya yatay kaydırmalı olarak sunan ortak şerit (`TASK-153`).
///
/// Web/Angular Karşılığı: Tekrar kullanılabilir `<app-filter-chip-bar>` bileşeni.
class KadroFilterChips<T> extends StatelessWidget {
  final List<KadroFilterOption<T>> options;
  final T selectedValue;
  final ValueChanged<T> onSelected;
  final bool wrap;
  final double spacing;
  final double runSpacing;
  final VisualDensity? visualDensity;

  const KadroFilterChips({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    this.wrap = false,
    this.spacing = 8,
    this.runSpacing = 8,
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    final chips = [
      for (final option in options)
        ChoiceChip(
          key: option.key,
          label: Text(option.label),
          selected: option.value == selectedValue,
          visualDensity: visualDensity,
          onSelected: (_) => onSelected(option.value),
        ),
    ];

    if (wrap) {
      return Wrap(spacing: spacing, runSpacing: runSpacing, children: chips);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < chips.length; i++) ...[
            if (i > 0) SizedBox(width: spacing),
            chips[i],
          ],
        ],
      ),
    );
  }
}
