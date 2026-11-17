/// Görevin tetikleyeceği uygulama içi çalışma ekranı türü.
///
/// Web/Angular benzetmesi: Router link veya action dispatcher türü.
enum StudyTaskActionType { quiz, flashcards, mistakes, custom, exam, map, game }

/// KPSS çalışma planı görevi veri modeli.
///
/// Her görev isteğe bağlı olarak doğrudan gerçek bir müfredat içeriğini
/// (ör. `targetTopic` + `targetTestNumber` veya `targetCount` kart/harita sorusu)
/// hedefler; görev açıldığında ilgili oturum doğrudan başlatılır.
class StudyTask {
  final String id;
  final String title;
  final String
  lessonTag; // 'Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler', 'Genel'
  final int estimatedMinutes;
  final bool isCompleted;
  final StudyTaskActionType actionType;

  /// Doğrudan hedeflenen KPSS alt konusu (ör. `'İslamiyet Öncesi Türk Tarihi'`).
  final String? targetTopic;

  /// Konu içindeki 10 soruluk test numarası (1-tabanlı: Test 1, Test 2...).
  final int? targetTestNumber;

  /// Bu oturumda çözülecek soru / bilgi kartı / harita alıştırması adedi.
  final int? targetCount;

  /// Havuz içinde ardışık ilerleme için 0-tabanlı başlangıç indeksi.
  final int? startIndex;

  /// Deneme sınavı görevlerinde hedeflenen deneme numarası (1..6).
  final int? targetExamNumber;

  /// Bu görevin ait olduğu KPSS / MEB-AGS sınav kapsamı anahtarı (ör. `'lisans_gk'`, `'ekpss_lisans'`).
  final String examScope;

  const StudyTask({
    required this.id,
    required this.title,
    required this.lessonTag,
    this.estimatedMinutes = 25,
    this.isCompleted = false,
    this.actionType = StudyTaskActionType.custom,
    this.targetTopic,
    this.targetTestNumber,
    this.targetCount,
    this.startIndex,
    this.targetExamNumber,
    this.examScope = 'lisans_gk',
  });

  StudyTask copyWith({
    String? id,
    String? title,
    String? lessonTag,
    int? estimatedMinutes,
    bool? isCompleted,
    StudyTaskActionType? actionType,
    String? targetTopic,
    int? targetTestNumber,
    int? targetCount,
    int? startIndex,
    int? targetExamNumber,
    String? examScope,
  }) {
    return StudyTask(
      id: id ?? this.id,
      title: title ?? this.title,
      lessonTag: lessonTag ?? this.lessonTag,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
      actionType: actionType ?? this.actionType,
      targetTopic: targetTopic ?? this.targetTopic,
      targetTestNumber: targetTestNumber ?? this.targetTestNumber,
      targetCount: targetCount ?? this.targetCount,
      startIndex: startIndex ?? this.startIndex,
      targetExamNumber: targetExamNumber ?? this.targetExamNumber,
      examScope: examScope ?? this.examScope,
    );
  }

  /// Görevin tempodan bağımsız benzersiz içerik anahtarı.
  ///
  /// Web/Angular Benzetmesi: Angular `trackBy` fonksiyonu veya Redux Entity ID.
  /// Farklı süre paketlerinde (15-90 dk) üretilen aynı ders/konu testini veya denemeyi
  /// benzersiz bir anahtar ile eşleştirmeyi sağlar.
  String get contentIdentity {
    final scopePrefix = examScope == 'lisans_gk' ? '' : '$examScope:';
    if (actionType == StudyTaskActionType.quiz &&
        targetTopic != null &&
        targetTestNumber != null) {
      return '${scopePrefix}quiz:$lessonTag:$targetTopic:$targetTestNumber';
    }
    if (actionType == StudyTaskActionType.exam && targetExamNumber != null) {
      return '${scopePrefix}exam:$targetExamNumber';
    }
    return '$scopePrefix${actionType.name}:$lessonTag:$title';
  }

  /// İki görev nesnesinin aynı müfredat birimini veya günlük aktiviteyi temsil edip etmediğini döner.
  ///
  /// Web/Angular Benzetmesi: Semantic equality (anlamsal eşitlik) kontrolü.
  /// Örneğin ID'ler farklı olsa bile aynı konu testini veya aynı günlük aktivite türünü
  /// (harita pratiği, kavram oyunu vb.) temsil ediyorsa `true` döner.
  bool isSameTaskItem(StudyTask other) {
    if (examScope != other.examScope) return false;
    if (id == other.id) return true;
    if (contentIdentity == other.contentIdentity) return true;
    if (actionType != StudyTaskActionType.quiz &&
        actionType != StudyTaskActionType.custom &&
        actionType == other.actionType) {
      return true;
    }
    return false;
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
      targetTopic: map['target_topic'] as String?,
      targetTestNumber: (map['target_test_number'] as num?)?.toInt(),
      targetCount: (map['target_count'] as num?)?.toInt(),
      startIndex: (map['start_index'] as num?)?.toInt(),
      targetExamNumber: (map['target_exam_number'] as num?)?.toInt(),
      examScope:
          ((map['exam_scope'] ?? map['examScope']) as String?) ?? 'lisans_gk',
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
      if (targetTopic != null) 'targetTopic': targetTopic,
      if (targetTestNumber != null) 'targetTestNumber': targetTestNumber,
      if (targetCount != null) 'targetCount': targetCount,
      if (startIndex != null) 'startIndex': startIndex,
      if (targetExamNumber != null) 'targetExamNumber': targetExamNumber,
      if (examScope != 'lisans_gk') 'examScope': examScope,
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
      targetTopic: json['targetTopic'] as String?,
      targetTestNumber: (json['targetTestNumber'] as num?)?.toInt(),
      targetCount: (json['targetCount'] as num?)?.toInt(),
      startIndex: (json['startIndex'] as num?)?.toInt(),
      targetExamNumber: (json['targetExamNumber'] as num?)?.toInt(),
      examScope:
          ((json['examScope'] ?? json['exam_scope']) as String?) ?? 'lisans_gk',
    );
  }
}
