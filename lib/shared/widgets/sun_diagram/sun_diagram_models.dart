/// Güneş konumu ve mevsim şemaları türü
enum SunDiagramType {
  /// 21 Haziran Yaz Gündönümü (Yengeç Dönencesi dik, kuzeye gidildikçe gündüz uzar)
  haziran21,

  /// 21 Aralık Kış Gündönümü (Oğlak Dönencesi dik, kuzeye gidildikçe gece uzar)
  aralik21,

  /// 21 Mart - 23 Eylül Ekinoks (Ekvator dik, gece=gündüz 12 saat eşitliği)
  ekinoks,

  /// Türkiye'de Gölge Yönü ve Boyu (Dönenceler dışı, öğle vakti gölge daima KUZEYİ gösterir)
  golgeYonu,
}

/// Güneş açısı ve mevsim şeması konfigürasyon modeli
class SunDiagramConfig {
  final SunDiagramType type;
  final String title;
  final String? subtitle;
  final List<String> badges;
  final String educationalNote;

  const SunDiagramConfig({
    required this.type,
    required this.title,
    this.subtitle,
    required this.badges,
    required this.educationalNote,
  });

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'title': title,
    if (subtitle != null) 'subtitle': subtitle,
    'badges': badges,
    'educationalNote': educationalNote,
  };

  factory SunDiagramConfig.fromJson(Map<String, dynamic> json) {
    final typeName = json['type'] as String? ?? 'haziran21';
    final type = SunDiagramType.values.firstWhere(
      (e) => e.name == typeName,
      orElse: () => SunDiagramType.haziran21,
    );

    return SunDiagramConfig(
      type: type,
      title: json['title'] as String? ?? 'Güneş Açısı ve Mevsim Şeması',
      subtitle: json['subtitle'] as String?,
      badges: List<String>.from(json['badges'] as List? ?? []),
      educationalNote: json['educationalNote'] as String? ?? '',
    );
  }
}

/// ÖSYM KPSS Referans Güneş ve Mevsim Şemaları
class SunPresets {
  /// 1. 21 Haziran (Yaz Gündönümü)
  static const haziran21 = SunDiagramConfig(
    type: SunDiagramType.haziran21,
    title: '21 Haziran (Yaz Gündönümü)',
    subtitle:
        'Güneş ışınları Yengeç Dönencesi'
        'ne (23°27'
        ' K) dik açıyla düşer',
    badges: [
      'En Uzun Gündüz',
      'Kuzeye Gidildikçe Gündüz Uzar',
      'Sinop > Hatay (Gündüz)',
    ],
    educationalNote:
        '21 Haziran'
        'da Türkiye'
        'de en uzun gündüz yaşanır.\nGüneyden kuzeye gidildikçe gündüz süresi uzar (Sinop: 15 sa 15 dk > Hatay: 14 sa 40 dk).\nKuzey Kutup Dairesi 24 saat gündüz yaşar.',
  );

  /// 2. 21 Aralık (Kış Gündönümü)
  static const aralik21 = SunDiagramConfig(
    type: SunDiagramType.aralik21,
    title: '21 Aralık (Kış Gündönümü)',
    subtitle:
        'Güneş ışınları Oğlak Dönencesi'
        'ne (23°27'
        ' G) dik açıyla düşer',
    badges: [
      'En Uzun Gece',
      'Kuzeye Gidildikçe Gece Uzar',
      'Sinop > Hatay (Gece)',
    ],
    educationalNote:
        '21 Aralık'
        'ta Türkiye'
        'de en uzun gece yaşanır.\nGüneyden kuzeye gidildikçe gece süresi uzar (En uzun gece Sinop'
        'ta, en uzun gündüz Hatay'
        'dadır).\nTürkiye'
        'de gölge boyu yılın en uzun seviyesindedir.',
  );

  /// 3. Ekinoks (21 Mart - 23 Eylül)
  static const ekinoks = SunDiagramConfig(
    type: SunDiagramType.ekinoks,
    title: '21 Mart & 23 Eylül (Ekinoks)',
    subtitle:
        'Güneş ışınları Ekvator'
        'a dik düşer, aydınlanma çemberi kutuplardan geçer',
    badges: [
      'Gece = Gündüz (12 Saat)',
      'Aynı Boylamda Güneş Aynı Anda Doğar',
      'Kutup Noktalarında Alacakaranlık',
    ],
    educationalNote: 'Ekinoks tarihlerinde tüm dünyada 12 saat gece, 12 saat gündüz yaşanır.\nAynı meridyen üzerindeki tüm noktalarda Güneş aynı anda doğar ve aynı anda batar.',
  );

  /// 4. Türkiye'de Gölge Yönü ve Boyu (Dönenceler Dışı Matematiksel Konum)
  static const golgeYonu = SunDiagramConfig(
    type: SunDiagramType.golgeYonu,
    title:
        'Türkiye'
        'de Gölge Yönü ve Boyu Kuralı',
    subtitle:
        'Yengeç Dönencesi'
        'nin kuzeyinde yer almanın (Orta Kuşak) kesin kanıtı',
    badges: [
      'Öğle Vakti Gölge Daima KUZEYİ Gösterir',
      'Gölge Boyu Asla Sıfır Olmaz',
      'Bakı Yönü Daima GÜNEYDİR',
    ],
    educationalNote:
        'Türkiye Yengeç Dönencesi'
        'nin (23°27'
        ' K) kuzeyinde yer aldığı için;\n1. Güneş ışınları hiçbir zaman 90° dik açıyla düşmez.\n2. Gölge boyu asla sıfır olmaz.\n3. Öğle vakti (12:00) gölge yönü DAİMA KUZEYİ gösterir.',
  );
}
