/// KPSS Coğrafya iklim grafiklerinde her bir ayı temsil eden veri noktası.
class ClimateDataPoint {
  /// Ay sırası (1: Ocak .. 12: Aralık)
  final int month;

  /// Ay kısa etiketi (O, Ş, M, N, M, H, T, A, E, E, K, A)
  final String label;

  /// Aylık toplam yağış miktarı (milimetre / mm)
  final double precipitation;

  /// Aylık ortalama sıcaklık (Santigrat derece / °C)
  final double temperature;

  const ClimateDataPoint({
    required this.month,
    required this.label,
    required this.precipitation,
    required this.temperature,
  });

  Map<String, dynamic> toJson() => {
    'month': month,
    'label': label,
    'precipitation': precipitation,
    'temperature': temperature,
  };

  factory ClimateDataPoint.fromJson(Map<String, dynamic> json) {
    return ClimateDataPoint(
      month: (json['month'] as num?)?.toInt() ?? 1,
      label: json['label'] as String? ?? '',
      precipitation: (json['precipitation'] as num?)?.toDouble() ?? 0.0,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

/// İklim grafiği konfigürasyon modeli.
/// Yağış-sıcaklık diyagramı (Hythergraph) için 12 aylık veriyi ve özet istatistikleri tutar.
class ClimateChartConfig {
  /// Grafik başlığı (örn. "Akdeniz İklimi - Antalya")
  final String title;

  /// Alt açıklama veya ipucu
  final String? subtitle;

  /// 12 aylık iklim verisi
  final List<ClimateDataPoint> monthlyData;

  /// Belirtilmişse özel en yüksek yağış ölçeği (yoksa veriden otomatik hesaplanır)
  final double? maxPrecipitationOverride;

  const ClimateChartConfig({
    required this.title,
    required this.monthlyData,
    this.subtitle,
    this.maxPrecipitationOverride,
  });

  /// Yıllık toplam yağış miktarı (mm)
  double get totalPrecipitation {
    return monthlyData.fold(0.0, (acc, p) => acc + p.precipitation);
  }

  /// Yıllık ortalama sıcaklık (°C)
  double get averageTemperature {
    if (monthlyData.isEmpty) return 0.0;
    final total = monthlyData.fold(0.0, (acc, p) => acc + p.temperature);
    return total / monthlyData.length;
  }

  /// En çok yağış alan mevsimi tespit eder (KPSS soru kalıbı)
  String get wettestSeason {
    if (monthlyData.length < 12) return 'Belirsiz';

    // Kış: Aralık(12), Ocak(1), Şubat(2)
    final winter =
        monthlyData[11].precipitation +
        monthlyData[0].precipitation +
        monthlyData[1].precipitation;
    // İlkbahar: Mart(3), Nisan(4), Mayıs(5)
    final spring =
        monthlyData[2].precipitation +
        monthlyData[3].precipitation +
        monthlyData[4].precipitation;
    // Yaz: Haziran(6), Temmuz(7), Ağustos(8)
    final summer =
        monthlyData[5].precipitation +
        monthlyData[6].precipitation +
        monthlyData[7].precipitation;
    // Sonbahar: Eylül(9), Ekim(10), Kasım(11)
    final autumn =
        monthlyData[8].precipitation +
        monthlyData[9].precipitation +
        monthlyData[10].precipitation;

    if (winter >= spring && winter >= summer && winter >= autumn) {
      return 'Kış (Akdeniz Karakteri)';
    }
    if (autumn >= spring && autumn >= summer && autumn >= winter) {
      return 'Sonbahar (Karadeniz Karakteri)';
    }
    if (spring >= winter && spring >= summer && spring >= autumn) {
      return 'İlkbahar (İç Anadolu Karakteri)';
    }
    return 'Yaz (Erzurum-Kars Karakteri)';
  }

  /// Sıfır derecenin (don olayının) altına düşülüp düşülmediği
  bool get hasFrostRisk {
    return monthlyData.any((p) => p.temperature <= 0.0);
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    if (subtitle != null) 'subtitle': subtitle,
    'monthlyData': monthlyData.map((e) => e.toJson()).toList(),
    if (maxPrecipitationOverride != null)
      'maxPrecipitationOverride': maxPrecipitationOverride,
  };

  factory ClimateChartConfig.fromJson(Map<String, dynamic> json) {
    final rawList =
        json['monthlyData'] as List? ?? json['points'] as List? ?? [];
    final points = rawList
        .map((e) => ClimateDataPoint.fromJson(e as Map<String, dynamic>))
        .toList();

    return ClimateChartConfig(
      title: json['title'] as String? ?? 'İklim Grafiği',
      subtitle: json['subtitle'] as String?,
      monthlyData: points,
      maxPrecipitationOverride: (json['maxPrecipitationOverride'] as num?)
          ?.toDouble(),
    );
  }
}

/// ÖSYM KPSS'de en çok sorulan 5 ana iklim tipinin standart referans grafikleri.
class ClimatePresets {
  static const List<String> _monthLabels = [
    'O',
    'Ş',
    'M',
    'N',
    'M',
    'H',
    'T',
    'A',
    'E',
    'E',
    'K',
    'A',
  ];

  /// 1. Akdeniz İklimi (Antalya / Kıyı Ege)
  /// - Kışlar ılık (>10°C) ve çok yağışlı
  /// - Yazlar sıcak (>28°C) ve aşırı kurak
  /// - Don olayı ve kar yağışı neredeyse hiç görülmez
  static ClimateChartConfig akdeniz = ClimateChartConfig(
    title: 'Akdeniz İklimi (Antalya)',
    subtitle: 'Kışları ılık ve yağışlı, yazları sıcak ve kurak',
    monthlyData: _buildPoints(
      precip: [225, 160, 95, 45, 25, 8, 3, 5, 15, 65, 135, 240],
      temp: [
        10.0,
        11.2,
        13.5,
        16.8,
        21.2,
        26.0,
        28.8,
        28.5,
        25.2,
        20.5,
        15.5,
        11.5,
      ],
    ),
  );

  /// 2. Karadeniz İklimi (Rize / Doğu Karadeniz)
  /// - Her mevsim yağışlı, en fazla yağış Sonbaharda
  /// - Yıllık sıcaklık farkı en az olan iklim (nem yüksek)
  /// - Kışlar ılık (6-7°C), yazlar serin (22-23°C)
  static ClimateChartConfig karadeniz = ClimateChartConfig(
    title: 'Karadeniz İklimi (Rize)',
    subtitle: 'Her mevsim yağışlı, en fazla yağış sonbaharda',
    monthlyData: _buildPoints(
      precip: [220, 180, 150, 100, 110, 140, 160, 200, 260, 290, 250, 240],
      temp: [
        6.5,
        6.8,
        8.5,
        12.0,
        16.5,
        20.5,
        23.0,
        23.5,
        20.5,
        16.5,
        12.5,
        8.5,
      ],
    ),
  );

  /// 3. İç Anadolu Karasal / Step İklimi (Konya / Ankara)
  /// - En fazla yağış İlkbaharda (Kırkikindi konveksiyonel yağışları)
  /// - Yazlar sıcak ve kurak, kışlar soğuk ve kar yağışlı
  /// - Don olayı görülür, yıllık yağış 300-400 mm civarı
  static ClimateChartConfig karasal = ClimateChartConfig(
    title: 'İç Anadolu Karasal İklimi (Konya)',
    subtitle: 'En fazla yağış ilkbaharda, yazlar sıcak ve kurak',
    monthlyData: _buildPoints(
      precip: [35, 30, 35, 48, 55, 28, 12, 10, 15, 30, 35, 47],
      temp: [0.0, 1.5, 5.5, 11.0, 16.0, 20.5, 23.5, 23.0, 18.5, 12.5, 6.5, 2.0],
    ),
  );

  /// 4. Sert Karasal İklim (Erzurum - Kars Platosu)
  /// - En fazla yağış Yaz mevsiminde (Mayıs-Haziran) konveksiyonel çayır yağışları
  /// - Kışlar çok sert ve donlu (-10°C altına iner), kar yerde uzun kalır
  static ClimateChartConfig sertKarasal = ClimateChartConfig(
    title: 'Sert Karasal İklim (Erzurum-Kars)',
    subtitle: 'En fazla yağış yazın, kışlar aşırı soğuk ve donlu',
    monthlyData: _buildPoints(
      precip: [20, 22, 35, 52, 75, 82, 60, 40, 30, 48, 30, 25],
      temp: [
        -10.5,
        -9.0,
        -3.5,
        4.5,
        10.5,
        15.0,
        19.5,
        19.5,
        14.5,
        8.0,
        0.5,
        -7.0,
      ],
    ),
  );

  /// 5. Güneydoğu Anadolu İklimi (Şanlıurfa)
  /// - Yaz sıcaklıkları Türkiye rekoru (>33°C), aşırı buharlaşma ve kuraklık
  /// - Kış yağışları Akdeniz'e benzer şekilde yoğun
  static ClimateChartConfig guneydogu = ClimateChartConfig(
    title: 'Güneydoğu Anadolu İklimi (Şanlıurfa)',
    subtitle: 'Yaz sıcaklığı ve kuraklığı en şiddetli olan iklim',
    monthlyData: _buildPoints(
      precip: [100, 90, 75, 55, 30, 4, 1, 1, 4, 35, 65, 90],
      temp: [
        5.5,
        7.0,
        11.0,
        16.5,
        22.5,
        28.5,
        33.0,
        32.5,
        27.5,
        21.0,
        13.5,
        7.5,
      ],
    ),
  );

  static List<ClimateDataPoint> _buildPoints({
    required List<double> precip,
    required List<double> temp,
  }) {
    final list = <ClimateDataPoint>[];
    for (var i = 0; i < 12; i++) {
      list.add(
        ClimateDataPoint(
          month: i + 1,
          label: _monthLabels[i],
          precipitation: precip[i],
          temperature: temp[i],
        ),
      );
    }
    return list;
  }
}
