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

  const Question({
    required this.id,
    required this.lesson,
    required this.topic,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.difficulty = 'medium',
  });

  /// Kullanıcının seçtiği şıkkın doğru olup olmadığını kontrol eden yardımcı metot.
  bool isCorrect(int? selectedIndex) => selectedIndex == correctIndex;

  /// JSON (`Map<String, dynamic>`) verisinden Question nesnesi üreten factory constructor.
  /// Angular'daki `Object.assign(new Question(), json)` veya mapper fonksiyonu gibi düşünebilirsin.
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      lesson: json['lesson'] as String,
      topic: json['topic'] as String,
      text: json['text'] as String,
      options: List<String>.from(json['options'] as List),
      correctIndex: json['correctIndex'] as int,
      explanation: json['explanation'] as String,
      difficulty: json['difficulty'] as String? ?? 'medium',
    );
  }

  /// Supabase `public.questions` tablosundaki satırdan Question nesnesi üretir.
  factory Question.fromSupabase(Map<String, dynamic> row) {
    final interaction = row['interaction_data'] is Map<String, dynamic>
        ? row['interaction_data'] as Map<String, dynamic>
        : <String, dynamic>{};
    final optionsList =
        (interaction['options'] as List?)?.map((e) => e.toString()).toList() ??
        <String>[];
    return Question(
      id: row['id']?.toString() ?? '',
      lesson: row['lesson']?.toString() ?? 'Genel Kültür',
      topic: row['topic']?.toString() ?? 'Genel',
      text: (row['prompt_text'] ?? row['text'])?.toString() ?? '',
      options: optionsList,
      correctIndex: interaction['correctIndex'] as int? ?? 0,
      explanation: row['explanation']?.toString() ?? '',
      difficulty: row['difficulty']?.toString() ?? 'medium',
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
  ),
];
