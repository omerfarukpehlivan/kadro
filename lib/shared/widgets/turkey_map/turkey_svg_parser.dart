import 'dart:ui';

/// SVG Path Komut Ayrıştırıcısı (Zero-Dependency)
///
/// Angular/Web benzetmesi: Bu yardımcı sınıf, tarayıcının native SVG `<path d="...">`
/// komutlarını HTML5 Canvas `Path2D` nesnesine çeviren parser gibi çalışır.
/// Hiçbir harici pakete ihtiyaç duymadan 'M', 'L' ve 'Z' komutlarını Flutter `Path`'ine dönüştürür.
class TurkeySvgParser {
  TurkeySvgParser._();

  static final Map<String, Path> _cache = {};

  /// Verilen SVG path d dizesini Flutter [Path] nesnesine dönüştürür.
  ///
  /// Sonuçları bellekte önbelleğe alarak (Memoization) 60 FPS yeniden çizim (repaint)
  /// performansını garanti eder.
  static Path parse(String d) {
    final cached = _cache[d];
    if (cached != null) return cached;

    final path = Path();
    path.fillType = PathFillType.evenOdd;

    var i = 0;
    final length = d.length;

    while (i < length) {
      final char = d[i];
      if (char == 'M' || char == 'm') {
        i++;
        final coords = _readCoords(d, i);
        if (coords != null) {
          path.moveTo(coords.$1, coords.$2);
          i = coords.$3;
        }
      } else if (char == 'L' || char == 'l') {
        i++;
        final coords = _readCoords(d, i);
        if (coords != null) {
          path.lineTo(coords.$1, coords.$2);
          i = coords.$3;
        }
      } else if (char == 'Z' || char == 'z') {
        path.close();
        i++;
      } else {
        i++;
      }
    }

    _cache[d] = path;
    return path;
  }

  /// Koordinat çiftini (x, y) okur ve sonraki karakter indeksini döner
  static (double, double, int)? _readCoords(String str, int startIndex) {
    var i = startIndex;
    final length = str.length;

    while (i < length && (str[i] == ' ' || str[i] == ',')) {
      i++;
    }
    if (i >= length) return null;

    final xStart = i;
    while (i < length && _isNumberChar(str[i])) {
      i++;
    }
    if (xStart == i) return null;
    final x = double.tryParse(str.substring(xStart, i)) ?? 0.0;

    while (i < length && (str[i] == ' ' || str[i] == ',')) {
      i++;
    }
    if (i >= length) return null;

    final yStart = i;
    while (i < length && _isNumberChar(str[i])) {
      i++;
    }
    if (yStart == i) return null;
    final y = double.tryParse(str.substring(yStart, i)) ?? 0.0;

    return (x, y, i);
  }

  static bool _isNumberChar(String char) {
    final code = char.codeUnitAt(0);
    return (code >= 48 && code <= 57) || code == 46 || code == 45; // 0-9, ., -
  }

  /// Testler için önbelleği boşaltır
  static void clearCache() => _cache.clear();

  /// Önbellekteki path sayısı
  static int get cachedCount => _cache.length;
}
