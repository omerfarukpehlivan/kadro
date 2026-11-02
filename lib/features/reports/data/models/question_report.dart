/// Soru raporlama veri modeli.
///
/// Kullanıcıların test esnasında bildirdiği hatalı veya itirazlı soruların
/// detaylarını taşır. Supabase `question_reports` tablosu ile çift yönlü
/// JSON serileştirmesini destekler.
///
/// Angular Karşılığı: `interface QuestionReport` veri kontratı modelidir.
class QuestionReport {
  final String id;
  final String? userId;
  final String questionId;
  final String lesson;
  final String topic;
  final String testTitle;
  final String questionText;
  final String reason;
  final String? userNote;
  final String status;
  final DateTime createdAt;

  const QuestionReport({
    required this.id,
    this.userId,
    required this.questionId,
    required this.lesson,
    required this.topic,
    required this.testTitle,
    required this.questionText,
    required this.reason,
    this.userNote,
    this.status = 'pending',
    required this.createdAt,
  });

  /// Supabase ve yerel depolama için Map/JSON temsili oluşturur.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'question_id': questionId,
      'lesson': lesson,
      'topic': topic,
      'test_title': testTitle,
      'question_text': questionText,
      'reason': reason,
      'user_note': userNote,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }

  /// Supabase veritabanı ekleme sorguları için harita döner.
  Map<String, dynamic> toMap() => toJson();

  /// JSON/Map verisinden model nesnesi üretir.
  factory QuestionReport.fromJson(Map<String, dynamic> json) {
    return QuestionReport(
      id: (json['id'] as String?) ?? '',
      userId: json['user_id'] as String?,
      questionId: (json['question_id'] as String?) ?? '',
      lesson: (json['lesson'] as String?) ?? '',
      topic: (json['topic'] as String?) ?? '',
      testTitle: (json['test_title'] as String?) ?? '',
      questionText: (json['question_text'] as String?) ?? '',
      reason: (json['reason'] as String?) ?? '',
      userNote: json['user_note'] as String?,
      status: (json['status'] as String?) ?? 'pending',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
