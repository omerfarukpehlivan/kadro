/// Matematik gösterimi yardımcıları — TASK-172 ortak sözleşmesi.
///
/// Davranış `docs/parity_fixtures/math_text.json` dosyasıyla tanımlıdır; web
/// (`src/domain/math-text.ts`) ve içerik araçları (`tools/math/mathtext.mjs`)
/// aynı kuralları birebir uygular.
///
/// Web/Angular Karşılığı: Şablonda `[innerHTML]="text | mathPipe"` ile kullanılan
/// saf (pure) bir pipe'ın ayrıştırma mantığı.
library;

/// Metnin yazı veya matematik parçası.
class MathSegment {
  /// Parçanın ham içeriği (matematikte `$` ayraçları olmadan LaTeX).
  final String value;

  /// `true` ise [value] LaTeX'tir.
  final bool isMath;

  /// `$$...$$` ayrık (ortalanmış, ayrı satır) matematik mi?
  final bool display;

  const MathSegment.text(this.value) : isMath = false, display = false;

  const MathSegment.math(this.value, {this.display = false}) : isMath = true;

  @override
  bool operator ==(Object other) =>
      other is MathSegment &&
      other.value == value &&
      other.isMath == isMath &&
      other.display == display;

  @override
  int get hashCode => Object.hash(value, isMath, display);

  @override
  String toString() => isMath
      ? 'MathSegment.math($value, display: $display)'
      : 'MathSegment.text($value)';
}

/// Metinde en az bir geçerli matematik parçası var mı? (hızlı yol için)
bool containsMath(String input) =>
    input.contains(r'$') && parseMathSegments(input).any((s) => s.isMath);

/// Metni yazı ve matematik parçalarına böler.
///
/// * `$...$` satır içi, `$$...$$` ayrık matematiktir.
/// * `\$` düz dolar işaretidir.
/// * Kapanmayan, boş veya satır sonu içeren matematik yazı olarak kalır.
List<MathSegment> parseMathSegments(String input) {
  final out = <MathSegment>[];
  final buf = StringBuffer();

  void flushText() {
    if (buf.isEmpty) return;
    final s = buf.toString();
    buf.clear();
    if (out.isNotEmpty && !out.last.isMath) {
      out[out.length - 1] = MathSegment.text(out.last.value + s);
    } else {
      out.add(MathSegment.text(s));
    }
  }

  var i = 0;
  final n = input.length;
  while (i < n) {
    final ch = input[i];
    if (ch == r'\' && i + 1 < n && input[i + 1] == r'$') {
      buf.write(r'$');
      i += 2;
      continue;
    }
    if (ch == r'$') {
      final display = i + 1 < n && input[i + 1] == r'$';
      final open = display ? 2 : 1;
      final close = _findClose(input, i + open, display);
      if (close > i + open) {
        final body = input.substring(i + open, close);
        if (body.trim().isNotEmpty && !body.contains('\n')) {
          flushText();
          out.add(MathSegment.math(body, display: display));
          i = close + open;
          continue;
        }
      }
      buf.write(display ? r'$$' : r'$');
      i += open;
      continue;
    }
    buf.write(ch);
    i++;
  }
  flushText();
  return out;
}

int _findClose(String s, int from, bool display) {
  for (var j = from; j < s.length; j++) {
    if (s[j] == r'\') {
      j++;
      continue;
    }
    if (s[j] == r'$') {
      if (!display) return j;
      if (j + 1 < s.length && s[j + 1] == r'$') return j;
    }
  }
  return -1;
}

final RegExp _legacyArrowMath = RegExp(
  r'\$\s*(→|←|\\rightarrow|\\Rightarrow|\\to|\\leftarrow|\\Leftarrow)\s*\$',
);

/// Yalnızca yazı parçalarına uygulanan ok, Markdown ve tırnak temizliği.
String _cleanPlain(String text) {
  return text
      .replaceAll(RegExp(r'\\(rightarrow|Rightarrow|to)\b'), ' → ')
      .replaceAll(RegExp(r'&rarr;|-->|->'), ' → ')
      .replaceAll(RegExp(r'\\(leftarrow|Leftarrow)\b'), ' ← ')
      .replaceAll(RegExp(r'&larr;|<--|<-'), ' ← ')
      .replaceAllMapped(RegExp(r'\*\*(.+?)\*\*'), (m) => m.group(1)!)
      .replaceAllMapped(RegExp(r'__(.+?)__'), (m) => m.group(1)!)
      .replaceAll('**', '')
      .replaceAllMapped(RegExp(r'\*"(.+?)"\*'), (m) => '"${m.group(1)}"')
      .replaceAllMapped(RegExp(r'\*([^*\n]+)\*'), (m) => m.group(1)!)
      .replaceAll(r'\"', '"')
      .replaceAll(RegExp(r'"{2,}'), '"')
      .replaceAll(RegExp(r"'{2,}"), "'");
}

/// Soru, şık, açıklama ve tuzak metinlerinin ortak temizleyicisi.
///
/// Matematik parçaları olduğu gibi korunur ve `$...$` / `$$...$$` ayraçlarıyla
/// geri yazılır; eski içerikteki `$ → $` gibi yalnızca ok içeren parçalar düz
/// oka çevrilir. Aynı metne iki kez uygulanması sonucu değiştirmez.
String cleanQuestionText(String raw) {
  if (raw.isEmpty) return raw;
  var text = raw.replaceAll('\r', '');
  text = text.replaceAllMapped(_legacyArrowMath, (m) {
    final a = m.group(1)!;
    return (a == '←' || a.toLowerCase().contains('left')) ? ' ← ' : ' → ';
  });

  // Kaçışlı doları ayrıştırmada kaybetmemek için geçici işarete çevir.
  const esc = '\u0000';
  final segments = parseMathSegments(text.replaceAll(r'\$', esc));
  final joined = segments.map((s) {
    if (s.isMath) return s.display ? '\$\$${s.value}\$\$' : '\$${s.value}\$';
    // Kaçışlı "\n" yalnızca yazıda satır sonuna çevrilir (\neq bozulmasın).
    return _cleanPlain(s.value.replaceAll(r'\n', '\n'));
  }).join();

  return joined
      .split('\n')
      .map((line) => line.replaceAll(RegExp(r'[ \t]{2,}'), ' ').trim())
      .join('\n')
      .trim()
      .replaceAll(esc, r'\$');
}

/// Matematik ayraçlarını kaldırıp düz metin özeti üretir (bildirim, paylaşım,
/// ekran okuyucu etiketi gibi LaTeX render edilemeyen yerler için).
String mathToPlainText(String input) {
  return parseMathSegments(input).map((s) {
    if (!s.isMath) return s.value;
    return s.value
        .replaceAllMapped(
          RegExp(r'\\[dt]?frac\{([^{}]*)\}\{([^{}]*)\}'),
          (m) => '${m.group(1)}/${m.group(2)}',
        )
        .replaceAllMapped(
          RegExp(r'\\sqrt\[([^\]]*)\]\{([^{}]*)\}'),
          (m) => '${m.group(1)}√(${m.group(2)})',
        )
        .replaceAllMapped(
          RegExp(r'\\sqrt\{([^{}]*)\}'),
          (m) => '√(${m.group(1)})',
        )
        .replaceAll(RegExp(r'\\(cdot|times)'), '·')
        .replaceAll(r'\div', '÷')
        .replaceAll(RegExp(r'\\(leq|le)\b'), '≤')
        .replaceAll(RegExp(r'\\(geq|ge)\b'), '≥')
        .replaceAll(RegExp(r'\\(neq|ne)\b'), '≠')
        .replaceAll(r'\pi', 'π')
        .replaceAll(r'^\circ', '°')
        .replaceAll(RegExp(r'\\(left|right)'), '')
        .replaceAll(RegExp(r'\\[a-zA-Z]+'), '')
        .replaceAll(RegExp(r'[{}]'), '')
        .replaceAllMapped(RegExp(r'\\(.)'), (m) => m.group(1)!);
  }).join();
}
