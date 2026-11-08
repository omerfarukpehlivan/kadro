import 'package:flutter/material.dart';

import 'turkey_map_data.dart';

/// Harita üzerindeki dairesel işaretçi (Marker / Pin)
///
/// Angular/Web benzetmesi: Leaflet / Google Maps üzerindeki `CustomMarker` bileşenidir.
/// ÖSYM KPSS Coğrafya sorularında yer alan Romen rakamlı ('I', 'II', 'III', 'IV', 'V')
/// alan işaretlemeleri için kullanılır.
class TurkeyMapMarker {
  final String id;
  final String label;
  final Offset offset;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double radius;

  const TurkeyMapMarker({
    required this.id,
    required this.label,
    required this.offset,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.radius = 13.0,
  });

  /// Belirli bir ilin merkez koordinatına otomatik yerleşen marker üretir
  factory TurkeyMapMarker.atProvince(
    String provinceId, {
    required String label,
    String? id,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    double radius = 13.0,
  }) {
    final prov = TurkeyMapData.getProvince(provinceId);
    final targetOffset = prov?.center ?? const Offset(500, 213);
    return TurkeyMapMarker(
      id: id ?? provinceId,
      label: label,
      offset: targetOffset,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
      radius: radius,
    );
  }

  factory TurkeyMapMarker.fromJson(Map<String, dynamic> json) {
    final x =
        (json['x'] as num?)?.toDouble() ??
        (json['cx'] as num?)?.toDouble() ??
        0.0;
    final y =
        (json['y'] as num?)?.toDouble() ??
        (json['cy'] as num?)?.toDouble() ??
        0.0;
    final provId = json['province_id'] as String?;

    Offset offset = Offset(x, y);
    if (provId != null && x == 0.0 && y == 0.0) {
      final prov = TurkeyMapData.getProvince(provId);
      if (prov != null) offset = prov.center;
    }

    Color? parseColor(dynamic val) {
      if (val is String && val.startsWith('#')) {
        final hex = val.replaceFirst('#', '');
        return Color(int.parse(hex.length == 6 ? 'FF$hex' : hex, radix: 16));
      }
      return null;
    }

    return TurkeyMapMarker(
      id: json['id'] as String? ?? json['label'] as String? ?? '0',
      label: json['label'] as String? ?? '',
      offset: offset,
      backgroundColor: parseColor(json['bg_color']),
      textColor: parseColor(json['text_color']),
      borderColor: parseColor(json['border_color']),
      radius: (json['radius'] as num?)?.toDouble() ?? 13.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'x': offset.dx,
      'y': offset.dy,
      if (backgroundColor != null)
        'bg_color':
            '#${backgroundColor!.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}',
      if (textColor != null)
        'text_color':
            '#${textColor!.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}',
      'radius': radius,
    };
  }
}

/// Türkiye Harita Konfigürasyonu (Sorular veya oyunlar için harita durum parametreleri)
///
/// Angular/Web benzetmesi: Bu sınıf bir Map Component `@Input() config: TurkeyMapConfig` modelidir.
class TurkeyMapConfig {
  /// İl id bazında özel boyama renkleri (örn: {'zonguldak': Colors.amber})
  final Map<String, Color> highlightedProvinces;

  /// Coğrafi bölge bazında boyama (örn: {TurkeyRegion.karadeniz: Colors.teal})
  final Map<TurkeyRegion, Color> highlightedRegions;

  /// Harita üzerindeki dairesel işaretçiler (I, II, III...)
  final List<TurkeyMapMarker> markers;

  /// Vurgulanmamış illerin varsayılan zemin rengi
  final Color? baseFillColor;

  /// İl sınır çizgilerinin rengi
  final Color? strokeColor;

  /// İl sınır çizgi kalınlığı
  final double strokeWidth;

  /// Seçili il (varsa)
  final String? selectedProvinceId;

  /// Tıklanan marker id (varsa)
  final String? selectedMarkerId;

  const TurkeyMapConfig({
    this.highlightedProvinces = const {},
    this.highlightedRegions = const {},
    this.markers = const [],
    this.baseFillColor,
    this.strokeColor,
    this.strokeWidth = 0.9,
    this.selectedProvinceId,
    this.selectedMarkerId,
  });

  /// Sadece numaralı işaretçiler (I, II, III...) içeren soru haritası
  factory TurkeyMapConfig.withMarkers(List<TurkeyMapMarker> markers) {
    return TurkeyMapConfig(markers: markers);
  }

  /// Belirli illeri tek bir renkle vurgulayan harita
  factory TurkeyMapConfig.highlightProvinces(
    List<String> provinceIds, {
    Color color = const Color(0xFFD97706),
  }) {
    return TurkeyMapConfig(
      highlightedProvinces: {for (final id in provinceIds) id: color},
    );
  }

  /// JSON'dan TurkeyMapConfig üretir (Supabase veya yerel JSON için)
  factory TurkeyMapConfig.fromJson(Map<String, dynamic> json) {
    Color? parseColor(dynamic val) {
      if (val is String && val.startsWith('#')) {
        final hex = val.replaceFirst('#', '');
        return Color(int.parse(hex.length == 6 ? 'FF$hex' : hex, radix: 16));
      }
      return null;
    }

    // Highlighted provinces
    final provMap = <String, Color>{};
    if (json['highlighted_provinces'] is Map) {
      final rawMap = json['highlighted_provinces'] as Map;
      for (final entry in rawMap.entries) {
        final col = parseColor(entry.value);
        if (col != null) {
          provMap[entry.key.toString()] = col;
        }
      }
    } else if (json['highlighted_provinces'] is List) {
      final list = json['highlighted_provinces'] as List;
      final defaultCol =
          parseColor(json['highlight_color']) ?? const Color(0xFFD97706);
      for (final item in list) {
        provMap[item.toString()] = defaultCol;
      }
    }

    // Markers
    final markerList = <TurkeyMapMarker>[];
    if (json['markers'] is List) {
      for (final m in json['markers'] as List) {
        if (m is Map<String, dynamic>) {
          markerList.add(TurkeyMapMarker.fromJson(m));
        }
      }
    }

    return TurkeyMapConfig(
      highlightedProvinces: provMap,
      markers: markerList,
      baseFillColor: parseColor(json['base_fill_color']),
      strokeColor: parseColor(json['stroke_color']),
      strokeWidth: (json['stroke_width'] as num?)?.toDouble() ?? 0.9,
      selectedProvinceId: json['selected_province_id'] as String?,
      selectedMarkerId: json['selected_marker_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'highlighted_provinces': {
        for (final e in highlightedProvinces.entries)
          e.key:
              '#${e.value.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}',
      },
      'markers': markers.map((m) => m.toJson()).toList(),
      if (baseFillColor != null)
        'base_fill_color':
            '#${baseFillColor!.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}',
      if (strokeColor != null)
        'stroke_color':
            '#${strokeColor!.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}',
      'stroke_width': strokeWidth,
      if (selectedProvinceId != null)
        'selected_province_id': selectedProvinceId,
      if (selectedMarkerId != null) 'selected_marker_id': selectedMarkerId,
    };
  }

  TurkeyMapConfig copyWith({
    Map<String, Color>? highlightedProvinces,
    Map<TurkeyRegion, Color>? highlightedRegions,
    List<TurkeyMapMarker>? markers,
    Color? baseFillColor,
    Color? strokeColor,
    double? strokeWidth,
    String? selectedProvinceId,
    String? selectedMarkerId,
  }) {
    return TurkeyMapConfig(
      highlightedProvinces: highlightedProvinces ?? this.highlightedProvinces,
      highlightedRegions: highlightedRegions ?? this.highlightedRegions,
      markers: markers ?? this.markers,
      baseFillColor: baseFillColor ?? this.baseFillColor,
      strokeColor: strokeColor ?? this.strokeColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      selectedProvinceId: selectedProvinceId ?? this.selectedProvinceId,
      selectedMarkerId: selectedMarkerId ?? this.selectedMarkerId,
    );
  }
}
