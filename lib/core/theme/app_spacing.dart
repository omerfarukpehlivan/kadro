import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';

/// Tüm Kadro uygulamasında kullanılan 8pt/4pt tabanlı standart boşluk (spacing/padding/margin) token'ları.
///
/// Web/Angular Karşılığı:
/// Tailwind Spacing Scale (`p-1` (4px), `p-2` (8px), `p-3` (12px), `p-4` (16px), `p-5` (20px), `p-6` (24px))
/// veya CSS `:root { --spacing-xs: 8px; --spacing-md: 16px; }` tasarım değişkenleri.
class AppSpacing {
  AppSpacing._();

  // 1. Temel Ölçüler (Scalar Tokens)
  /// Mikro rozet içi, ikon-metin aralığı (4px)
  static const double xxs = 4.0;

  /// Küçük boşluk, rozet dolgusu, dar eleman aralığı (8px)
  static const double xs = 8.0;

  /// Kompakt sayfa yatay dolgusu, kart altı aralığı, bento grid aralığı (12px)
  static const double sm = 12.0;

  /// Standart sayfa yatay dolgusu, standart kart içi padding, bölüm arası boşluk (16px)
  static const double md = 16.0;

  /// Geniş bölüm ayıracı, modal padding (20px)
  static const double lg = 20.0;

  /// Tablet yatay sayfa dolgusu, büyük başlık altı boşluğu (24px)
  static const double xl = 24.0;

  /// Sayfa altı safe-area boşluğu (32px)
  static const double xxl = 32.0;

  // 2. Sayfa Düzeyi Eşlenik Dolgular (Zero Layout Shift)
  /// Tüm ana sayfalarda ve listelerde kullanılan ekran boyutuna duyarlı standart kenar dolgusu.
  /// Kompakt ekranda 12px, standart ekranda 16px, tablette 24px yatay dolgu verir.
  /// Dikey dolgu tüm cihazlarda sabit 16px'tir (böylece sekmeler arası geçişte başlıklar zıplamaz).
  static EdgeInsets pagePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: ResponsiveBreakpoints.horizontalPadding(context),
      vertical: md,
    );
  }

  // 3. Kart ve Konteyner Dolguları
  /// Standart kart içi dolgu (16px)
  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  /// Kompakt kart içi dolgu (12px)
  static const EdgeInsets cardPaddingCompact = EdgeInsets.all(sm);

  /// Liste kartlarının altındaki standart ayrım payı (12px)
  static const EdgeInsets cardMarginBottom = EdgeInsets.only(bottom: sm);

  // 4. Standart Dikey Boşluk Bileşenleri (Vertical Gaps)
  /// 8px dikey boşluk
  static const SizedBox gapXs = SizedBox(height: xs);

  /// 12px dikey boşluk
  static const SizedBox gapSm = SizedBox(height: sm);

  /// 16px dikey boşluk
  static const SizedBox gapMd = SizedBox(height: md);

  /// 20px dikey boşluk
  static const SizedBox gapLg = SizedBox(height: lg);

  /// 24px dikey boşluk
  static const SizedBox gapXl = SizedBox(height: xl);

  /// 32px dikey boşluk
  static const SizedBox gapXxl = SizedBox(height: xxl);

  // 5. Standart Yatay Boşluk Bileşenleri (Horizontal Gaps)
  /// 8px yatay boşluk
  static const SizedBox gapHorizontalXs = SizedBox(width: xs);

  /// 12px yatay boşluk
  static const SizedBox gapHorizontalSm = SizedBox(width: sm);

  /// 16px yatay boşluk
  static const SizedBox gapHorizontalMd = SizedBox(width: md);

  /// 20px yatay boşluk
  static const SizedBox gapHorizontalLg = SizedBox(width: lg);
}
