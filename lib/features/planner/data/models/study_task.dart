/// Görevin tetikleyeceği uygulama içi çalışma ekranı türü.
///
/// Web/Angular benzetmesi: Router link veya action dispatcher türü.
enum StudyTaskActionType { quiz, flashcards, mistakes, custom }

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
}
