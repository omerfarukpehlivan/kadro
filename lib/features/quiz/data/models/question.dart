import 'dart:ui';

import 'package:kadro/shared/widgets/turkey_map/turkey_map_models.dart';

/// KPSS çalışma uygulamasındaki tek bir soruyu temsil eden model.
///
/// Angular/TypeScript'teki `interface Question { ... }` veya DTO sınıfının
/// Dart karşılığıdır.
class Question {
  final String id;
  final String lesson;
  final String topic;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String difficulty;

  /// UWorld modeline uygun olarak sorudaki en güçlü çeldiriciyi
  /// ve adayın neden bu şıkka düşebileceğini deşifre eden açıklama.
  final String? distractorTrap;

  /// Coğrafya ve diğer derslerdeki harita, tablo, grafik veya şekil görseli URL'si.
  /// Boş veya null ise soru yalnızca metin olarak render edilir.
  final String? imageUrl;

  /// Soruda yer alan dinamik ve interaktif Türkiye vektör haritası konfigürasyonu.
  /// (İl/bölge boyama, Romen rakamlı marker'lar, koordinat işaretleyicileri).
  final TurkeyMapConfig? mapConfig;

  const Question({
    required this.id,
    required this.lesson,
    required this.topic,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.difficulty = 'medium',
    this.distractorTrap,
    this.imageUrl,
    this.mapConfig,
  });

  /// Kullanıcının seçtiği şıkkın doğru olup olmadığını kontrol eden yardımcı metot.
  bool isCorrect(int? selectedIndex) => selectedIndex == correctIndex;

  /// Sayısal zorluk seviyesi (1: Kolay, 2: Orta, 3: Zor).
  int get difficultyLevel {
    if (difficulty == '1' || difficulty == 'easy') return 1;
    if (difficulty == '3' || difficulty == 'hard') return 3;
    return 2;
  }

  /// Nesnenin belirli alanlarını güncelleyerek kopyasını üreten yardımcı metot.
  Question copyWith({
    String? id,
    String? lesson,
    String? topic,
    String? text,
    List<String>? options,
    int? correctIndex,
    String? explanation,
    String? difficulty,
    String? distractorTrap,
    String? imageUrl,
    TurkeyMapConfig? mapConfig,
  }) {
    return Question(
      id: id ?? this.id,
      lesson: lesson ?? this.lesson,
      topic: topic ?? this.topic,
      text: text ?? this.text,
      options: options ?? this.options,
      correctIndex: correctIndex ?? this.correctIndex,
      explanation: explanation ?? this.explanation,
      difficulty: difficulty ?? this.difficulty,
      distractorTrap: distractorTrap ?? this.distractorTrap,
      imageUrl: imageUrl ?? this.imageUrl,
      mapConfig: mapConfig ?? this.mapConfig,
    );
  }

  /// Aktif harita konfigürasyonunu döner.
  /// Doğrudan mapConfig tanımlıysa onu, yoksa imageUrl içindeki 'map://'
  /// URI şemasını ayrıştırarak üretilen haritayı döner.
  TurkeyMapConfig? get effectiveMapConfig {
    if (mapConfig != null) return mapConfig;
    if (imageUrl != null && imageUrl!.startsWith('map:')) {
      return parseMapUri(imageUrl!);
    }
    return null;
  }

  /// 'map://turkey/...' URI şemasını TurkeyMapConfig nesnesine dönüştüren parser
  static TurkeyMapConfig? parseMapUri(String uriString) {
    try {
      final uri = Uri.parse(uriString);
      final path = uri.path.toLowerCase();
      final host = uri.host.toLowerCase();

      // 1. Taş Kömürü Madeni ve Batı Karadeniz Haritası (ÖSYM Klasik Soru Tipi)
      if (path.contains('tas_komuru') ||
          path.contains('komur') ||
          host.contains('tas_komuru')) {
        return const TurkeyMapConfig(
          markers: [
            TurkeyMapMarker(
              id: '0',
              label: 'I',
              offset: Offset(358.1, 36.1),
            ), // Batı Karadeniz / Zonguldak
            TurkeyMapMarker(
              id: '1',
              label: 'II',
              offset: Offset(525.4, 232.2),
            ), // İç Anadolu / Nevşehir-Niğde
            TurkeyMapMarker(
              id: '2',
              label: 'III',
              offset: Offset(719.4, 225.9),
            ), // Doğu Anadolu / Elazığ-Malatya
            TurkeyMapMarker(
              id: '3',
              label: 'IV',
              offset: Offset(63.1, 143.8),
            ), // Marmara / Çanakkale
            TurkeyMapMarker(
              id: '4',
              label: 'V',
              offset: Offset(102.1, 162.4),
            ), // Balıkesir
          ],
        );
      }

      // 2. Karstik Araziler (Teke & Taşeli Platoları)
      if (path.contains('karstik') || host.contains('karstik')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'antalya': Color(0xFFD97706),
            'mersin': Color(0xFFD97706),
            'burdur': Color(0xFFF59E0B),
            'mugla': Color(0xFFF59E0B),
          },
          markers: [
            TurkeyMapMarker(id: '1', label: 'I', offset: Offset(215.0, 360.0)),
            TurkeyMapMarker(id: '2', label: 'II', offset: Offset(335.0, 370.0)),
          ],
        );
      }

      // 3. Volkanik Araziler ve Dağlar
      if (path.contains('volkanik') || host.contains('volkanik')) {
        return const TurkeyMapConfig(
          highlightedProvinces: {
            'nevsehir': Color(0xFFDC2626),
            'kayseri': Color(0xFFDC2626),
            'nigde': Color(0xFFDC2626),
            'aksaray': Color(0xFFDC2626),
            'agri': Color(0xFFDC2626),
            'van': Color(0xFFDC2626),
            'bitlis': Color(0xFFDC2626),
          },
        );
      }

      // 4. Genel Query Parametreleri: map://turkey?provinces=zonguldak,karabuk&markers=I:358.1,36.1;II:525.4,232.2
      final provParam =
          uri.queryParameters['provinces'] ?? uri.queryParameters['highlight'];
      final markerParam = uri.queryParameters['markers'];

      final highlighted = <String, Color>{};
      if (provParam != null && provParam.isNotEmpty) {
        for (final p in provParam.split(',')) {
          final cleanP = p.trim().toLowerCase();
          if (cleanP.isNotEmpty) {
            highlighted[cleanP] = const Color(0xFFD97706);
          }
        }
      }

      final parsedMarkers = <TurkeyMapMarker>[];
      if (markerParam != null && markerParam.isNotEmpty) {
        final items = markerParam.split(';');
        for (final item in items) {
          final parts = item.split(':');
          if (parts.length == 2) {
            final label = parts[0].trim();
            final coords = parts[1].split(',');
            if (coords.length == 2) {
              final x = double.tryParse(coords[0].trim()) ?? 0.0;
              final y = double.tryParse(coords[1].trim()) ?? 0.0;
              parsedMarkers.add(
                TurkeyMapMarker(id: label, label: label, offset: Offset(x, y)),
              );
            }
          }
        }
      }

      return TurkeyMapConfig(
        highlightedProvinces: highlighted,
        markers: parsedMarkers,
      );
    } catch (_) {
      return null;
    }
  }

  /// JSON (`Map<String, dynamic>`) verisinden Question nesnesi üreten factory constructor.
  /// Angular'daki `Object.assign(new Question(), json)` veya mapper fonksiyonu gibi düşünebilirsin.
  /// Soru metinlerindeki LaTeX ($\rightarrow$, arrow), Markdown (**...**) ve
  /// gereksiz tırnak/boşluk kalıntılarını temizleyen sağlam sanitizer metodu.
  static String cleanText(String raw) {
    if (raw.isEmpty) return raw;

    var text = raw;

    // 1. Ok işaretleri ve LaTeX yön göstergeleri
    // $\rightarrow$, $\Rightarrow$, \rightarrow, \Rightarrow, \to, -->, ->, &rarr;
    text = text.replaceAll(
      RegExp(r'\$(\\rightarrow|\\Rightarrow|\\to)\$'),
      ' → ',
    );
    text = text.replaceAll(RegExp(r'\\(rightarrow|Rightarrow|to)\b'), ' → ');
    text = text.replaceAll('&rarr;', ' → ');
    text = text.replaceAll('-->', ' → ');
    text = text.replaceAll('->', ' → ');

    // Sol ok işaretleri: $\leftarrow$, \leftarrow, <--, <-
    text = text.replaceAll(RegExp(r'\$(\\leftarrow|\\Leftarrow)\$'), ' ← ');
    text = text.replaceAll(RegExp(r'\\(leftarrow|Leftarrow)\b'), ' ← ');
    text = text.replaceAll('&larr;', ' ← ');
    text = text.replaceAll('<--', ' ← ');
    text = text.replaceAll('<-', ' ← ');

    // 2. LaTeX inline math dolar işaretleri: $x$ -> x
    text = text.replaceAllMapped(RegExp(r'\$([^\$]+)\$'), (m) => m.group(1)!);

    // 3. Markdown kalın ve altı çizili: **metin** -> metin, __metin__ -> metin
    text = text.replaceAllMapped(RegExp(r'\*\*(.+?)\*\*'), (m) => m.group(1)!);
    text = text.replaceAllMapped(RegExp(r'__(.+?)__'), (m) => m.group(1)!);
    // Başıboş kalan ** veya __ temizliği
    text = text.replaceAll('**', '');

    // 4. Markdown italik ve tırnak temizliği: *"metin"* -> "metin", *metin* -> metin
    text = text
        .replaceAllMapped(RegExp(r'\*"(.+?)"\*'), (m) => '"${m.group(1)}"')
        .replaceAllMapped(RegExp(r'\*([^\*\n]+)\*'), (m) => m.group(1)!);

    // 5. Çiftlenmiş veya kaçışlı tırnaklar: \" -> ", "" -> ", '' -> '
    text = text.replaceAll(r'\"', '"');
    text = text.replaceAll(RegExp(r'"{2,}'), '"');
    text = text.replaceAll(RegExp(r"'{2,}"), "'");

    // 6. Satır içi çoklu boşlukları ([ \t]{2,}) tek boşluğa indirge, paragraf sonlarını (\n\n) koru
    final lines = text.split('\n');
    final cleanedLines = lines.map((line) {
      return line.replaceAll(RegExp(r'[ \t]{2,}'), ' ').trim();
    });
    text = cleanedLines.join('\n');

    return text.trim();
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    final rawText = json['text'] as String? ?? '';
    final rawExplanation = json['explanation'] as String? ?? '';
    final rawTrap =
        json['distractor_trap'] as String? ?? json['distractorTrap'] as String?;
    final rawOptions = List<String>.from(json['options'] as List? ?? const []);
    final rawImage =
        json['image_url'] as String? ?? json['imageUrl'] as String?;

    TurkeyMapConfig? mapConfig;
    if (json['map_config'] is Map<String, dynamic>) {
      mapConfig = TurkeyMapConfig.fromJson(
        json['map_config'] as Map<String, dynamic>,
      );
    } else if (json['mapConfig'] is Map<String, dynamic>) {
      mapConfig = TurkeyMapConfig.fromJson(
        json['mapConfig'] as Map<String, dynamic>,
      );
    }

    return Question(
      id: json['id'] as String,
      lesson: json['lesson'] as String,
      topic: json['topic'] as String,
      text: cleanText(rawText),
      options: rawOptions.map(cleanText).toList(),
      correctIndex: json['correctIndex'] as int,
      explanation: cleanText(rawExplanation),
      difficulty: json['difficulty'] as String? ?? 'medium',
      distractorTrap: rawTrap != null ? cleanText(rawTrap) : null,
      imageUrl: (rawImage != null && rawImage.isNotEmpty && rawImage != 'null')
          ? rawImage
          : null,
      mapConfig: mapConfig,
    );
  }

  /// Supabase `public.questions` tablosundaki satırdan Question nesnesi üretir.
  factory Question.fromSupabase(Map<String, dynamic> row) {
    final interaction = row['interaction_data'] is Map<String, dynamic>
        ? row['interaction_data'] as Map<String, dynamic>
        : <String, dynamic>{};
    final optionsList =
        (interaction['options'] as List?)
            ?.map((e) => cleanText(e.toString()))
            .toList() ??
        <String>[];

    final rawText = (row['prompt_text'] ?? row['text'])?.toString() ?? '';
    final rawExplanation = row['explanation']?.toString() ?? '';
    final rawTrap =
        row['distractor_trap'] as String? ?? row['distractorTrap'] as String?;
    final rawImage =
        row['image_url']?.toString() ?? row['imageUrl']?.toString();

    TurkeyMapConfig? mapConfig;
    if (interaction['map_config'] is Map<String, dynamic>) {
      mapConfig = TurkeyMapConfig.fromJson(
        interaction['map_config'] as Map<String, dynamic>,
      );
    }

    return Question(
      id: row['id']?.toString() ?? '',
      lesson: row['lesson']?.toString() ?? 'Genel Kültür',
      topic: row['topic']?.toString() ?? 'Genel',
      text: cleanText(rawText),
      options: optionsList,
      correctIndex: interaction['correctIndex'] as int? ?? 0,
      explanation: cleanText(rawExplanation),
      difficulty: row['difficulty']?.toString() ?? 'medium',
      distractorTrap: rawTrap != null ? cleanText(rawTrap) : null,
      imageUrl: (rawImage != null && rawImage.isNotEmpty && rawImage != 'null')
          ? rawImage
          : null,
      mapConfig: mapConfig,
    );
  }

  /// Question nesnesini JSON formatına (Map) çevirir (LocalStorage veya veritabanı için).
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'lesson': lesson,
      'topic': topic,
      'text': text,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
      'difficulty': difficulty,
      'distractor_trap': distractorTrap,
    };
    if (imageUrl != null) {
      map['image_url'] = imageUrl;
    }
    if (mapConfig != null) {
      map['map_config'] = mapConfig!.toJson();
    }
    return map;
  }
}

/// Varsayılan olarak gösterilen özgün KPSS Lisans Genel Kültür soruları (Çevrimdışı acil durum yedeği).
const List<Question> defaultSampleQuestions = [
  Question(
    id: 'tar_001',
    lesson: 'Tarih',
    topic: 'İlk Türk Devletleri',
    text: 'Uygurların yerleşik hayata geçmesiyle birlikte Türk kültür ve devlet yapısında önemli değişimler yaşanmıştır.\n\nAşağıdakilerden hangisi bu değişimlerin doğrudan bir sonucu olarak gösterilemez?',
    options: [
      'Tapınak ve saray mimarisinin gelişmesi',
      'Kalıcı yazılı eserlerin ve kütüphanelerin ortaya çıkması',
      'Hükümdarlığın kut inancına dayandırılması geleneğinin sona ermesi',
      'Minyatür ve fresk gibi süsleme sanatlarının yaygınlaşması',
      'Tarım faaliyetlerinin temel geçim kaynağı hâline gelmesi',
    ],
    correctIndex: 2,
    explanation: 'Kut inancı (hükümdarlığın tanrısal kaynaklı olduğuna inanılması) Türk devlet geleneğinde varlığını sürdürmüştür. Yerleşik hayat bu inancı sona erdirmemiştir.',
    distractorTrap: 'Uygurların yerleşik hayata geçmesiyle din ve alfabe değişmiş, tapınak mimarisi başlamıştır. Ancak Kut anlayışı (egemenliğin kaynağının ilahi olması) İslamiyet öncesi Türk devletlerinin tamamında olduğu gibi Uygurlarda da aynen devam etmiştir. ÖSYM adayın \'din değiştiyse yönetim anlayışı da değişmiştir\' ön yargısını en büyük çeldirici olarak kullanır.',
  ),
  Question(
    id: 'cog_001',
    lesson: 'Coğrafya',
    topic: 'Türkiye\'nin Fiziki Özellikleri',
    text: 'Türkiye\'de karstik şekiller en yaygın olarak Akdeniz Bölgesi\'nde, özellikle Teke ve Taşeli platolarında görülür.\n\nBu durumun ortaya çıkmasında bölgenin hangi temel özelliği en fazla etkili olmuştur?',
    options: [
      'Yıllık yağış miktarının fazla olması',
      'Kolay eriyebilen kalkerli (kireçtaşı) kayaç yapısına sahip olması',
      'Ortalama yükseltisinin fazla olması',
      'Bitki örtüsünün maki olması',
      'Fay hatlarının yoğun bulunması',
    ],
    correctIndex: 1,
    explanation: 'Karstik şekillerin oluşabilmesi için kimyasal tortul kayaçların (kalker, jips gibi eriyebilen taşların) bulunması şarttır. Akdeniz\'deki temel etken kalkerli kayaç yapısıdır.',
    distractorTrap: 'Akdeniz Bölgesi\'nde karstik şekillerin varlığı yağış miktarına DEĞİL, arazinin kolay eriyebilen kalkerli (kireçtaşı) kimyasal tortul kayaç yapısına bağlıdır. Karadeniz Akdeniz\'den çok daha fazla yağış almasına rağmen karstik şekil azdır. ÖSYM \'yağış fazlalığı\' şıkkını en sık kullanılan tuzak olarak koyar.',
  ),
  Question(
    id: 'vat_001',
    lesson: 'Vatandaşlık',
    topic: 'Temel Hak ve Ödevler',
    text: '1982 Anayasası\'na göre aşağıdakilerden hangisi \'Kişinin Hakları ve Ödevleri\' (Koruyucu / Negatif Statü Hakları) arasında yer alır?',
    options: [
      'Din ve vicdan hürriyeti',
      'Çalışma ve sözleşme hürriyeti',
      'Dilekçe hakkı',
      'Eğitim ve öğrenim hakkı ve ödevi',
      'Vergi ödevi',
    ],
    correctIndex: 0,
    explanation: 'Din ve vicdan hürriyeti kişinin temel hak ve ödevleri (koruyucu/negatif statü) arasındadır. Çalışma ve eğitim sosyal-ekonomik haklar; dilekçe ve vergi ise siyasi haklardır.',
    distractorTrap: 'Çalışma ve sözleşme hürriyeti ile eğitim hakkı sosyal ve ekonomik haklardır (pozitif statü). Dilekçe ve vergi ise siyasi haklardır (aktif statü). Din ve vicdan hürriyeti ise devletin dahi dokunamayacağı negatif (koruyucu) statü hakkıdır. ÖSYM hak kategorilerini birbiriyle karıştırmayı çok sever.',
  ),
];
