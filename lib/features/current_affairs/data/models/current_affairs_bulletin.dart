import 'package:flutter/foundation.dart';

/// Aylık Güncel Bilgiler bülteni haber ve bilgi kartı kategorileri (`TASK-160`).
///
/// Web/Angular karşılığı: Haber/bülten filtrelemede kullanılan string enum birliği (`NewsCategory`).
enum CurrentAffairsCategory {
  kulturSanat,
  bilimTeknoloji,
  spor,
  ekonomiKurumlar,
  cevreDunya;

  /// Veritabanı (`public.current_affairs_bulletins.category`) ile uyumlu snake_case anahtarı.
  String get wireKey {
    switch (this) {
      case CurrentAffairsCategory.kulturSanat:
        return 'kultur_sanat';
      case CurrentAffairsCategory.bilimTeknoloji:
        return 'bilim_teknoloji';
      case CurrentAffairsCategory.spor:
        return 'spor';
      case CurrentAffairsCategory.ekonomiKurumlar:
        return 'ekonomi_kurumlar';
      case CurrentAffairsCategory.cevreDunya:
        return 'cevre_dunya';
    }
  }

  /// Kullanıcı arayüzünde gösterilen okunaklı Türkçe kategori etiketi.
  String get label {
    switch (this) {
      case CurrentAffairsCategory.kulturSanat:
        return 'Kültür & Sanat';
      case CurrentAffairsCategory.bilimTeknoloji:
        return 'Bilim & Teknoloji';
      case CurrentAffairsCategory.spor:
        return 'Spor';
      case CurrentAffairsCategory.ekonomiKurumlar:
        return 'Ekonomi & Kurumlar';
      case CurrentAffairsCategory.cevreDunya:
        return 'Çevre & Dünya';
    }
  }

  /// Ham JSON veya Supabase satırından kategori değerini güvenli çözer.
  static CurrentAffairsCategory fromWire(String? raw) {
    final normalized = (raw ?? '').trim().toLowerCase();
    for (final value in CurrentAffairsCategory.values) {
      if (value.wireKey == normalized ||
          value.name.toLowerCase() == normalized) {
        return value;
      }
    }
    return CurrentAffairsCategory.cevreDunya;
  }
}

/// Tek bir aylık güncel bilgiler maddesini temsil eden değişmez veri modeli (`TASK-160`).
///
/// Angular/Web karşılığı: Bülten akış kartına (`BulletinCardComponent`) bağlanan DTO interface'i.
@immutable
class CurrentAffairsItem {
  final String id;
  final String yearMonth;
  final String monthTitle;
  final String title;
  final String summary;
  final CurrentAffairsCategory category;
  final String osymTip;
  final String publishedLabel;
  final List<String> linkedTags;
  final List<String> examScopes;
  final bool isVerifiedOfficial;
  final int orderIndex;

  const CurrentAffairsItem({
    required this.id,
    required this.yearMonth,
    this.monthTitle = '',
    required this.title,
    required this.summary,
    required this.category,
    required this.osymTip,
    required this.publishedLabel,
    this.linkedTags = const [],
    this.examScopes = const ['lisans_gk', 'b_grubu', 'ekpss', 'meb_ags'],
    this.isVerifiedOfficial = true,
    this.orderIndex = 0,
  });

  /// Hem camelCase yerel JSON hem snake_case Supabase satırlarından örnek üretir.
  factory CurrentAffairsItem.fromJson(Map<String, dynamic> json) {
    List<String> parseStringList(dynamic value, List<String> fallback) {
      if (value is List) {
        final items = value
            .map((e) => e.toString().trim())
            .where((e) => e.isNotEmpty)
            .toList();
        return items.isEmpty ? fallback : items;
      }
      return fallback;
    }

    return CurrentAffairsItem(
      id: (json['id'] as String? ?? '').trim(),
      yearMonth: (json['yearMonth'] ?? json['year_month'] ?? '')
          .toString()
          .trim(),
      monthTitle: (json['monthTitle'] ?? json['month_title'] ?? '')
          .toString()
          .trim(),
      title: (json['title'] as String? ?? '').trim(),
      summary: (json['summary'] as String? ?? '').trim(),
      category: CurrentAffairsCategory.fromWire(json['category'] as String?),
      osymTip: (json['osymTip'] ?? json['osym_tip'] ?? '').toString().trim(),
      publishedLabel: (json['publishedLabel'] ?? json['published_label'] ?? '')
          .toString()
          .trim(),
      linkedTags: parseStringList(
        json['linkedTags'] ?? json['linked_tags'],
        const <String>[],
      ),
      examScopes: parseStringList(
        json['examScopes'] ?? json['exam_scopes'],
        const ['lisans_gk', 'b_grubu', 'ekpss', 'meb_ags'],
      ),
      isVerifiedOfficial:
          (json['isVerifiedOfficial'] ?? json['is_verified_official'])
              as bool? ??
          true,
      orderIndex: (json['orderIndex'] ?? json['order_index'] as num? ?? 0)
          .toInt(),
    );
  }

  /// JSON formatına dönüştürür (yerel önbellek ve test doğrulamaları için).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'yearMonth': yearMonth,
      if (monthTitle.isNotEmpty) 'monthTitle': monthTitle,
      'title': title,
      'summary': summary,
      'category': category.wireKey,
      'osymTip': osymTip,
      'publishedLabel': publishedLabel,
      'linkedTags': linkedTags,
      'examScopes': examScopes,
      'isVerifiedOfficial': isVerifiedOfficial,
      'orderIndex': orderIndex,
    };
  }
}

/// Bir aya ait Güncel Bilgiler bülteni grubunu temsil eder (`TASK-160`).
///
/// Angular/Web karşılığı: Ay sekmesi seçildiğinde render edilen dergi/bülten bölümü (`MonthlyIssueModel`).
@immutable
class CurrentAffairsBulletin {
  final String yearMonth;
  final String monthTitle;
  final String subtitle;
  final List<CurrentAffairsItem> items;

  const CurrentAffairsBulletin({
    required this.yearMonth,
    required this.monthTitle,
    required this.subtitle,
    required this.items,
  });

  /// Ay seçici şeritte kompakt görünüm için yalnızca ay adını döndürür (`'Temmuz 2026'` -> `'Temmuz'`).
  String get shortMonthLabel {
    final trimmed = monthTitle.trim();
    if (trimmed.isEmpty) return yearMonth;
    return trimmed.split(' ').first;
  }

  /// Bu bültende kullanıcının okuduğu madde sayısını hesaplar.
  int readCountFor(Set<String> readIds) {
    var count = 0;
    for (final item in items) {
      if (readIds.contains(item.id)) count++;
    }
    return count;
  }

  /// Kategori ve kaydetme (bookmark) filtrelerine göre bülten maddelerini süzer.
  List<CurrentAffairsItem> filteredItems({
    CurrentAffairsCategory? category,
    bool bookmarkedOnly = false,
    Set<String> bookmarkedIds = const {},
  }) {
    return items.where((item) {
      if (category != null && item.category != category) return false;
      if (bookmarkedOnly && !bookmarkedIds.contains(item.id)) return false;
      return true;
    }).toList();
  }

  factory CurrentAffairsBulletin.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] as List<dynamic>? ?? const [];
    final ym = (json['yearMonth'] ?? json['year_month'] ?? '')
        .toString()
        .trim();
    final title = (json['monthTitle'] ?? json['month_title'] ?? ym)
        .toString()
        .trim();
    return CurrentAffairsBulletin(
      yearMonth: ym,
      monthTitle: title,
      subtitle: (json['subtitle'] as String? ?? '').trim(),
      items: rawItems
          .whereType<Map<String, dynamic>>()
          .map(
            (row) => CurrentAffairsItem.fromJson({
              'yearMonth': ym,
              'monthTitle': title,
              ...row,
            }),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'yearMonth': yearMonth,
      'monthTitle': monthTitle,
      'subtitle': subtitle,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}
