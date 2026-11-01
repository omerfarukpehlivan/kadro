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
