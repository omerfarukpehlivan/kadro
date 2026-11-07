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
    );
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
    );
  }

  /// Question nesnesini JSON formatına (Map) çevirir (LocalStorage veya veritabanı için).
  Map<String, dynamic> toJson() {
    return {
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
