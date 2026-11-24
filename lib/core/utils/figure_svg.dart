/// Soru ve konu anlatımı şekilleri (SVG) için güvenlik denetimi — TASK-172.
///
/// Kural tek kaynaktadır: `docs/parity_fixtures/math_text.json` → `figureSvg`.
/// Bu dosyadaki listeler o kurala birebir eşittir; `test/math_text_test.dart`
/// eşitliği ve örnek vakaları doğrular. Supabase'de aynı kural `figure_svg`
/// sütununda CHECK kısıtıdır (migration 12).
///
/// Web/Angular Karşılığı: `DomSanitizer` ile `bypassSecurityTrustHtml` öncesinde
/// yapılan beyaz liste denetimi.
library;

/// İzin verilen SVG etiketleri.
const Set<String> kFigureSvgAllowedTags = {
  'svg',
  'g',
  'path',
  'line',
  'polyline',
  'polygon',
  'circle',
  'rect',
  'text',
};

/// İzin verilen SVG öznitelikleri.
const Set<String> kFigureSvgAllowedAttributes = {
  'xmlns',
  'viewBox',
  'width',
  'height',
  'fill',
  'stroke',
  'stroke-width',
  'stroke-dasharray',
  'stroke-linecap',
  'stroke-linejoin',
  'fill-opacity',
  'stroke-opacity',
  'opacity',
  'd',
  'x',
  'y',
  'x1',
  'y1',
  'x2',
  'y2',
  'cx',
  'cy',
  'r',
  'rx',
  'ry',
  'points',
  'font-family',
  'font-size',
  'font-weight',
  'font-style',
  'text-anchor',
  'transform',
};

/// Hiçbir yerde geçmemesi gereken parçalar (küçük harfle aranır).
const List<String> kFigureSvgForbiddenPatterns = [
  '<!',
  '<?',
  'javascript:',
  'data:',
  '&#',
  'url(',
];

/// SVG metninin azami uzunluğu.
const int kFigureSvgMaxLength = 60000;

final RegExp _tagRe = RegExp(r'<\/?([a-zA-Z][a-zA-Z0-9-]*)([^>]*)>');
final RegExp _attrRe = RegExp(r'([a-zA-Z_:][-a-zA-Z0-9_:.]*)\s*=\s*"[^"]*"');
final RegExp _leftoverRe = RegExp(r'[\s/]');

/// SVG yalnızca izinli etiket/öznitelikleri içeriyorsa `true` döner.
bool isSafeFigureSvg(String? svg) {
  if (svg == null || svg.isEmpty || svg.length > kFigureSvgMaxLength) {
    return false;
  }
  if (!svg.startsWith('<svg ')) return false;
  final lower = svg.toLowerCase();
  if (kFigureSvgForbiddenPatterns.any(lower.contains)) return false;

  for (final m in _tagRe.allMatches(svg)) {
    if (!kFigureSvgAllowedTags.contains(m.group(1))) return false;
    final attrs = m.group(2) ?? '';
    for (final a in _attrRe.allMatches(attrs)) {
      if (!kFigureSvgAllowedAttributes.contains(a.group(1))) return false;
    }
    // Tırnaksız öznitelik gibi tanınmayan kalıntı olmamalı.
    final leftover = attrs.replaceAll(_attrRe, '').replaceAll(_leftoverRe, '');
    if (leftover.isNotEmpty) return false;
  }
  final rest = svg.replaceAll(_tagRe, '');
  return !rest.contains('<') && !rest.contains('>');
}

/// SVG'nin `viewBox` en/boy oranı (bulunamazsa `null`).
double? figureSvgAspectRatio(String svg) {
  final m = RegExp(r'viewBox="\s*[-\d.]+\s+[-\d.]+\s+([\d.]+)\s+([\d.]+)\s*"')
      .firstMatch(svg);
  if (m == null) return null;
  final w = double.tryParse(m.group(1)!);
  final h = double.tryParse(m.group(2)!);
  if (w == null || h == null || w <= 0 || h <= 0) return null;
  return w / h;
}

/// SVG'nin doğal genişliği (`width` özniteliği; bulunamazsa `null`).
double? figureSvgIntrinsicWidth(String svg) {
  final m = RegExp(r'<svg [^>]*\bwidth="([\d.]+)"').firstMatch(svg);
  return m == null ? null : double.tryParse(m.group(1)!);
}
