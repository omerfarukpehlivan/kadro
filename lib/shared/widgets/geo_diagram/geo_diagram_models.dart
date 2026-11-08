/// KPSS Coğrafya Jeomorfoloji diyagramlarının türleri
enum GeoDiagramType {
  /// Kırılma ile oluşan Horst - Graben blok fay sistemi (Ege Bölgesi)
  horstGraben,

  /// Kıvrılma ile oluşan Antiklinal - Senklinal sistemi (Kuzey Anadolu & Toroslar)
  antiklinalSenklinal,

  /// Akarsu vadi tipleri (Çentik, Boğaz, Kanyon, Menderesli tabanlı)
  vadiTipleri,

  /// Karstik aşınım ve birikim kesiti (Obruk, Mağara, Sarkıt, Dikit, Lapya)
  karstikKesit,

  /// Kıyı birikim şekilleri (Tombolo / Saplı Ada ve Lagün)
  tombolo,
}

/// Jeomorfoloji diyagramı konfigürasyon modeli
class GeoDiagramConfig {
  final GeoDiagramType type;
  final String title;
  final String? subtitle;
  final List<String> badges;
  final String educationalNote;

  const GeoDiagramConfig({
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

  factory GeoDiagramConfig.fromJson(Map<String, dynamic> json) {
    final typeName = json['type'] as String? ?? 'horstGraben';
    final type = GeoDiagramType.values.firstWhere(
      (e) => e.name == typeName,
      orElse: () => GeoDiagramType.horstGraben,
    );

    return GeoDiagramConfig(
      type: type,
      title: json['title'] as String? ?? 'Jeomorfolojik Kesit',
      subtitle: json['subtitle'] as String?,
      badges: List<String>.from(json['badges'] as List? ?? []),
      educationalNote: json['educationalNote'] as String? ?? '',
    );
  }
}

/// ÖSYM KPSS'de her yıl sorulan referans jeomorfolojik kesitler
class GeoPresets {
  /// 1. Kırıklı Dağ Oluşumu (Horst - Graben & Fay Hatları)
  static const horstGraben = GeoDiagramConfig(
    type: GeoDiagramType.horstGraben,
    title: 'Kırıklı Dağ Oluşumu (Horst - Graben)',
    subtitle: 'Sert tabakaların yan basınçlarla kırılması (Ege Sistemi)',
    badges: ['HORST (Yüksekte Kalan)', 'GRABEN (Çöken Ova)', 'FAY HATTI'],
    educationalNote:
        'Kaz, Madra, Yunt, Bozdağlar, Aydın ve Menteşe Dağları birer HORST;\nBakırçay, Gediz, Küçük ve Büyük Menderes ovaları ise birer GRABEN alanıdır.',
  );

  /// 2. Kıvrımlı Dağ Oluşumu (Antiklinal - Senklinal)
  static const antiklinalSenklinal = GeoDiagramConfig(
    type: GeoDiagramType.antiklinalSenklinal,
    title: 'Kıvrımlı Dağ Oluşumu (Antiklinal - Senklinal)',
    subtitle: 'Esnek tortul tabakaların yan basınçla kıvrılması (Alp-Himalaya)',
    badges: ['ANTİKLİNAL (Kıvrım Tepesi)', 'SENKLİNAL (Kıvrım Çukuru)'],
    educationalNote:
        'Kuzey Anadolu Dağları (Kaçkarlar, Canik, Küre) ve Toros Dağları Antiklinal;\naralarındaki çöküntü olukları ve vadi tabanları ise Senklinal sahalarıdır.',
  );

  /// 3. Akarsu Vadi Tipleri Karşılaştırması
  static const vadiTipleri = GeoDiagramConfig(
    type: GeoDiagramType.vadiTipleri,
    title: 'Akarsu Vadi Tipleri Karşılaştırması',
    subtitle: 'Aşındırma gücü, eğim ve kayaç yapısına göre şekillenen vadiler',
    badges: ['Çentik (V) Vadi', 'Boğaz (Yarma) Vadi', 'Kanyon Vadi', 'Menderesli Tabanlı'],
    educationalNote:
        'Çentik: Derine aşındırma, hidroelektrik yüksek (Doğu Anadolu/Karadeniz).\nBoğaz: Dağları enine yaran ulaşım geçidi. Kanyon: Karstik basamaklı.\nMenderes: Eğim az, yana aşındırma, büklümler (Ege).',
  );

  /// 4. Karstik Aşınım ve Birikim Kesiti (Obruk & Mağara)
  static const karstikKesit = GeoDiagramConfig(
    type: GeoDiagramType.karstikKesit,
    title: 'Karstik Yeryüzü ve Yer Altı Şekilleri',
    subtitle: 'Kalker ve jipsin kimyasal erimesiyle oluşan şekiller',
    badges: ['LAPYA & DOLİN', 'OBRUK (Çöküntü)', 'MAĞARA', 'SARKIT & DİKİT'],
    educationalNote:
        'En küçük erime çukuru Lapya, tavan çökmesiyle oluşan dev kuyu Obruk''tur (Cennet-Cehennem, Kızören).\nİçeride kalsiyum karbonat birikimiyle Sarkıt, Dikit ve Sütunlar oluşur.',
  );

  /// 5. Kıyı Birikim Şekilleri (Tombolo & Lagün)
  static const tombolo = GeoDiagramConfig(
    type: GeoDiagramType.tombolo,
    title: 'Dalga Biriktirme Şekilleri (Tombolo & Lagün)',
    subtitle: 'Kıyı kordonlarının bir adayı karaya bağlaması (Saplı Ada)',
    badges: ['TOMBOLO (Saplı Ada)', 'LAGÜN (Kıyı Set Gölü)', 'KIYI OKU'],
    educationalNote:
        'Bir adanın kıyı kordonuyla karaya bağlanmasıyla oluşan TOMBOLO''nun en net örnekleri:\nKapıdağ Yarımadası (Balıkesir) ve Sinop İnceburun Yarımadası''dır.',
  );
}
