import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Konu testleri için pedagojik ve motive edici zorluk seviyeleri.
///
/// Web/Angular Karşılığı:
/// `TestDifficultyTier` enum & UI presentation helper.
/// Akademik ve monoton "Kolay/Orta/Zor" etiketleri yerine adayın soru çözme arzusunu
/// tetikleyen 4 aşamalı dinamik rozet sistemini yönetir.
enum TestDifficultyTier {
  /// Seviye 1 (<= 1.4): Özgüven tazeleyen ısınma soruları.
  warmup,

  /// Seviye 2 (1.4 - 2.2): Standart ÖSYM kitapçık formatı.
  standard,

  /// Seviye 3 (2.2 - 2.6): Sıralamayı doğrudan yukarı taşıyan derece soruları.
  distinction,

  /// Seviye 4 (> 2.6): En çok düşülen çeldirici tuzaklar ve ters köşe sorular.
  trapMaster,
}

/// [TestDifficultyTier] için metin, ikon, renk ve hesaplama yardımcıları.
extension TestDifficultyTierExtension on TestDifficultyTier {
  /// Emojili tam rozet başlığı.
  String get title {
    switch (this) {
      case TestDifficultyTier.warmup:
        return '🌱 Basit Alıştırma';
      case TestDifficultyTier.standard:
        return '🏛️ Tam Sınav Ayarı';
      case TestDifficultyTier.distinction:
        return '⚡ Net Sıçratan';
      case TestDifficultyTier.trapMaster:
        return '🔥 Kurtlar Sofrası';
    }
  }

  /// Emojisiz temiz kısa başlık (Quiz ekranı başlığı vb. için).
  String get cleanTitle {
    switch (this) {
      case TestDifficultyTier.warmup:
        return 'Basit Alıştırma';
      case TestDifficultyTier.standard:
        return 'Tam Sınav Ayarı';
      case TestDifficultyTier.distinction:
        return 'Net Sıçratan';
      case TestDifficultyTier.trapMaster:
        return 'Kurtlar Sofrası';
    }
  }

  /// Adayı motive eden ve testin amacını anlatan mini açıklama.
  String get description {
    switch (this) {
      case TestDifficultyTier.warmup:
        return 'Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları.';
      case TestDifficultyTier.standard:
        return 'Gerçek KPSS kitapçığında karşına çıkacak standart soru kalıpları.';
      case TestDifficultyTier.distinction:
        return 'Adayların %70\'ini eleyen, puanı doğrudan yukarı taşıyan ayırt edici sorular.';
      case TestDifficultyTier.trapMaster:
        return 'En çok düşülen çeldirici tuzaklar ve ters köşe yapan ÖSYM soruları.';
    }
  }

  /// Çizgisel modern Lucide ikonu.
  IconData get icon {
    switch (this) {
      case TestDifficultyTier.warmup:
        return LucideIcons.sprout;
      case TestDifficultyTier.standard:
        return LucideIcons.target;
      case TestDifficultyTier.distinction:
        return LucideIcons.zap;
      case TestDifficultyTier.trapMaster:
        return LucideIcons.flame;
    }
  }

  /// Tema ile uyumlu rozet arka plan rengi.
  Color backgroundColor(ColorScheme colorScheme) {
    switch (this) {
      case TestDifficultyTier.warmup:
        return colorScheme.secondaryContainer;
      case TestDifficultyTier.standard:
        return colorScheme.primaryContainer;
      case TestDifficultyTier.distinction:
        return colorScheme.tertiaryContainer;
      case TestDifficultyTier.trapMaster:
        return colorScheme.errorContainer;
    }
  }

  /// Tema ile uyumlu rozet metin ve ikon rengi.
  Color foregroundColor(ColorScheme colorScheme) {
    switch (this) {
      case TestDifficultyTier.warmup:
        return colorScheme.onSecondaryContainer;
      case TestDifficultyTier.standard:
        return colorScheme.onPrimaryContainer;
      case TestDifficultyTier.distinction:
        return colorScheme.onTertiaryContainer;
      case TestDifficultyTier.trapMaster:
        return colorScheme.onErrorContainer;
    }
  }

  /// Ortalama zorluk katsayısından (1.0 - 3.0) uygun seviyeyi belirler.
  static TestDifficultyTier fromAvgDifficulty(double avg) {
    if (avg <= 1.4) return TestDifficultyTier.warmup;
    if (avg <= 2.2) return TestDifficultyTier.standard;
    if (avg <= 2.6) return TestDifficultyTier.distinction;
    return TestDifficultyTier.trapMaster;
  }
}
