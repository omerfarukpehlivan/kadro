/// Görevin tetikleyeceği uygulama içi çalışma ekranı türü.
///
/// Web/Angular benzetmesi: Router link veya action dispatcher türü.
enum StudyTaskActionType { quiz, flashcards, mistakes, custom, exam, map, game }

/// KPSS çalışma planı görevi veri modeli.
///
/// Web/Angular benzetmesi: Todo/Task Interface & Model (Immutable Data Structure).
class StudyTask {
  final String id;
  final String title;
  final String
  lessonTag; // 'Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler', 'Genel'
  final int estimatedMinutes;
  final bool isCompleted;
  final StudyTaskActionType actionType;

  const StudyTask({
    required this.id,
    required this.title,
    required this.lessonTag,
    this.estimatedMinutes = 25,
    this.isCompleted = false,
    this.actionType = StudyTaskActionType.custom,
  });

  StudyTask copyWith({
    String? id,
    String? title,
    String? lessonTag,
    int? estimatedMinutes,
    bool? isCompleted,
    StudyTaskActionType? actionType,
  }) {
    return StudyTask(
      id: id ?? this.id,
      title: title ?? this.title,
      lessonTag: lessonTag ?? this.lessonTag,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
      actionType: actionType ?? this.actionType,
    );
  }

  /// Supabase `study_tasks` tablosuna uygun Map çıktısı üretir.
  Map<String, dynamic> toMap(String userId) {
    return {
      'user_id': userId,
      'title': title,
      'lesson_tag': lessonTag,
      'estimated_minutes': estimatedMinutes,
      'action_type': actionType.name,
      'is_completed': isCompleted,
    };
  }

  /// Supabase `study_tasks` tablosundan veya JSON çıktısından StudyTask nesnesi üretir.
  factory StudyTask.fromMap(Map<String, dynamic> map) {
    final actionName = (map['action_type'] as String?) ?? 'custom';
    final actionType = StudyTaskActionType.values.firstWhere(
      (e) => e.name == actionName,
      orElse: () => StudyTaskActionType.custom,
    );
    return StudyTask(
      id: (map['id'] ?? '').toString(),
      title: (map['title'] as String?) ?? '',
      lessonTag: (map['lesson_tag'] as String?) ?? 'Genel',
      estimatedMinutes: (map['estimated_minutes'] as num?)?.toInt() ?? 25,
      actionType: actionType,
      isCompleted: (map['is_completed'] as bool?) ?? false,
    );
  }

  /// Yerel depolama için JSON Haritası üretir.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'lessonTag': lessonTag,
      'estimatedMinutes': estimatedMinutes,
      'isCompleted': isCompleted,
      'actionType': actionType.name,
    };
  }

  /// Yerel depolamadan JSON ile nesne üretir.
  factory StudyTask.fromJson(Map<String, dynamic> json) {
    final actionName = (json['actionType'] as String?) ?? 'custom';
    final actionType = StudyTaskActionType.values.firstWhere(
      (e) => e.name == actionName,
      orElse: () => StudyTaskActionType.custom,
    );
    return StudyTask(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] as String?) ?? '',
      lessonTag: (json['lessonTag'] as String?) ?? 'Genel',
      estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt() ?? 25,
      actionType: actionType,
      isCompleted: (json['isCompleted'] as bool?) ?? false,
    );
  }
}
