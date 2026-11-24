import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:kadro/core/utils/math_text.dart';

/// Matematik içerebilen metni gösteren bileşen (TASK-172).
///
/// Metindeki `$...$` parçaları satır içinde, `$$...$$` parçaları ayrı satırda
/// ortalanmış olarak LaTeX ile çizilir (`flutter_math_fork`). Matematik içermeyen
/// metin doğrudan [Text] ile gösterilir; yani mevcut sözel içerik için davranış
/// ve performans değişmez.
///
/// Web/Angular Karşılığı: `<span [innerHTML]="text | katex">` — web istemcisi
/// aynı işi KaTeX ile yapar (`src/components/math-text.tsx`).
///
/// Yeni paket notu: `flutter_math_fork` KaTeX'in Flutter'a taşınmış hâlidir;
/// `Math.tex('\\frac{1}{2}')` bir widget döndürür (web'deki `katex.render`).
class MathText extends StatelessWidget {
  /// Gösterilecek metin (ör. `r'$\sqrt{2}$ kaçtır?'`).
  final String text;

  /// Yazı stili; matematik de aynı boyut ve renkte çizilir.
  final TextStyle? style;

  /// Paragraf hizası.
  final TextAlign? textAlign;

  /// Yalnızca matematik içermeyen metinde uygulanır (özet kartları için).
  final int? maxLines;

  /// Yalnızca matematik içermeyen metinde uygulanır.
  final TextOverflow? overflow;

  const MathText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  Widget _plain(String value) => Text(
    value,
    style: style,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  @override
  Widget build(BuildContext context) {
    // Hızlı yol: dolar işareti yoksa matematik de yoktur.
    if (!text.contains(r'$')) return _plain(text);

    final segments = parseMathSegments(text);
    if (!segments.any((s) => s.isMath)) {
      // Yalnızca kaçışlı dolar (\$) vardı; ayrıştırıcı onu düz "$" yaptı.
      return _plain(segments.map((s) => s.value).join());
    }

    final effectiveStyle = DefaultTextStyle.of(context).style.merge(style);

    // Ayrık ($$) matematik varsa metin paragraflara bölünür ve formül kendi
    // satırında ortalanır; yoksa tek bir Text.rich yeterlidir.
    final blocks = <Widget>[];
    var inline = <MathSegment>[];

    void flushInline() {
      if (inline.isEmpty) return;
      final paragraph = _trimParagraph(inline);
      inline = [];
      if (paragraph.isEmpty) return;
      blocks.add(
        Text.rich(
          TextSpan(
            style: style,
            children: [
              for (final s in paragraph)
                if (s.isMath)
                  ..._mathSpans(s.value, effectiveStyle)
                else
                  TextSpan(text: s.value),
            ],
          ),
          textAlign: textAlign,
        ),
      );
    }

    for (final s in segments) {
      if (s.isMath && s.display) {
        flushInline();
        blocks.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _DisplayMath(s.value, style: effectiveStyle),
              ),
            ),
          ),
        );
      } else {
        inline.add(s);
      }
    }
    flushInline();

    if (blocks.length == 1) return blocks.single;
    return Column(
      crossAxisAlignment: switch (textAlign) {
        TextAlign.center => CrossAxisAlignment.center,
        TextAlign.right || TextAlign.end => CrossAxisAlignment.end,
        _ => CrossAxisAlignment.start,
      },
      mainAxisSize: MainAxisSize.min,
      children: blocks,
    );
  }

  /// Ayrık formülün önündeki/arkasındaki tek satır sonlarını kırpar; aksi
  /// hâlde formül ile metin arasında boş satır oluşur.
  static List<MathSegment> _trimParagraph(List<MathSegment> parts) {
    final out = [...parts];
    if (out.isNotEmpty && !out.first.isMath) {
      final v = out.first.value.replaceFirst(RegExp(r'^[ \t]*\n'), '');
      out[0] = MathSegment.text(v);
    }
    if (out.isNotEmpty && !out.last.isMath) {
      final v = out.last.value.replaceFirst(RegExp(r'\n[ \t]*$'), '');
      out[out.length - 1] = MathSegment.text(v);
    }
    out.removeWhere((s) => !s.isMath && s.value.isEmpty);
    return out;
  }
}

/// Bir metin parçasını (ör. konu anlatımındaki **kalın** bir bölüm) yazı ve
/// satır içi matematik span'lerine çevirir. Matematik [style] ile aynı boyut ve
/// renkte çizilir; `$$` ayrık formül burada satır içi ama büyük stille çizilir.
///
/// `InlineFormattedText` önce `**kalın**` / `*italik*` biçimini ayırır, sonra her
/// parçayı bu fonksiyondan geçirir; böylece `**($x$) değeri**` gibi biçimli metnin
/// içindeki formül de doğru çizilir.
List<InlineSpan> buildMathInlineSpans(String text, TextStyle style) {
  if (!text.contains(r'$')) return [TextSpan(text: text, style: style)];
  return [
    for (final s in parseMathSegments(text))
      if (s.isMath)
        ..._mathSpans(s.value, style, display: s.display)
      else
        TextSpan(text: s.value, style: style),
  ];
}

/// Formülü `=`, `+`, `-` gibi ilişki/işlem işaretlerinden parçalara böler
/// (`texBreak`); her parça ayrı [WidgetSpan] olduğu için uzun formül dar ekranda
/// taşmak yerine metin gibi alt satıra kayar.
List<InlineSpan> _mathSpans(
  String tex,
  TextStyle style, {
  bool display = false,
}) {
  final math = Math.tex(
    tex,
    mathStyle: display ? MathStyle.display : MathStyle.text,
    textStyle: style,
    onErrorFallback: (error) => Text(tex, style: style),
  );
  List<Widget> parts;
  try {
    parts = math.parseError == null ? math.texBreak().parts : [math];
  } catch (_) {
    parts = [math];
  }
  return [
    for (var i = 0; i < parts.length; i++)
      WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        // Ekran okuyucu formülün tamamını ilk parçada bir kez okur.
        child: i == 0
            ? Semantics(
                label: mathToPlainText('\$$tex\$'),
                child: ExcludeSemantics(child: parts[i]),
              )
            : ExcludeSemantics(child: parts[i]),
      ),
  ];
}

/// Ayrık (`$$`) LaTeX ifadesini çizer; hatalı ifadede ham metni gösterir.
class _DisplayMath extends StatelessWidget {
  final String tex;
  final TextStyle style;

  const _DisplayMath(this.tex, {required this.style});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: mathToPlainText('\$$tex\$'),
      child: ExcludeSemantics(
        child: Math.tex(
          tex,
          mathStyle: MathStyle.display,
          textStyle: style,
          onErrorFallback: (error) => Text(tex, style: style),
        ),
      ),
    );
  }
}
