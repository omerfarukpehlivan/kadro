import 'package:flutter/material.dart';

/// Liste içi bölüm ayracı ("Genel Kültür Dersleri", "Çalışma türleri" vb.).
///
/// Solunda canlı marka aksan çubuğu ve güçlü `Outfit` başlık sunar.
class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? trailing;
  final Color? accentColor;

  const SectionTitle(this.text, {super.key, this.trailing, this.accentColor});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: accentColor ?? colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
