import 'package:flutter/material.dart';

/// Konu anlatımı metinlerindeki satır içi `**kalın**` ve `*italik*` biçimlendirmesini
/// ekstra paket gerektirmeden `RichText` / `TextSpan` ağacına dönüştüren bileşen (`TASK-168`).
///
/// Angular/Web Karşılığı: Satır içi markdown parçacıklarını güvenli şekilde
/// `<strong>` ve `<em>` düğümlerine çeviren hafif `InlineRichTextComponent`.
class InlineFormattedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const InlineFormattedText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  /// Verilen metni düz, kalın (`**...**`) ve italik (`*...*`) segmentlere ayırır.
  static List<TextSpan> parseSpans(String input, TextStyle baseStyle) {
    if (input.isEmpty) return const <TextSpan>[];

    final regex = RegExp(r'\*\*(.+?)\*\*|\*(.+?)\*');
    final spans = <TextSpan>[];
    var cursor = 0;

    for (final match in regex.allMatches(input)) {
      if (match.start > cursor) {
        spans.add(
          TextSpan(
            text: input.substring(cursor, match.start),
            style: baseStyle,
          ),
        );
      }

      final boldContent = match.group(1);
      final italicContent = match.group(2);
      if (boldContent != null) {
        spans.add(
          TextSpan(
            text: boldContent,
            style: baseStyle.copyWith(fontWeight: FontWeight.w700),
          ),
        );
      } else if (italicContent != null) {
        spans.add(
          TextSpan(
            text: italicContent,
            style: baseStyle.copyWith(fontStyle: FontStyle.italic),
          ),
        );
      }

      cursor = match.end;
    }

    if (cursor < input.length) {
      spans.add(TextSpan(text: input.substring(cursor), style: baseStyle));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveStyle =
        style ??
        Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.55) ??
        const TextStyle(height: 1.55);

    return Text.rich(
      TextSpan(
        style: effectiveStyle,
        children: parseSpans(text, effectiveStyle),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
