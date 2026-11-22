import 'package:kadro/features/quiz/data/models/question.dart';

/// Konu anlatımı içindeki uyarı/bilgi kutusu (`callout`) türleri (`TASK-168`).
///
/// Angular/Web Karşılığı: `type TopicLessonCalloutKind = 'info' | 'mnemonic' | 'trap' | 'example'`.
enum TopicLessonCalloutKind {
  info('info'),
  mnemonic('mnemonic'),
  trap('trap'),
  example('example');

  final String key;
  const TopicLessonCalloutKind(this.key);

  static TopicLessonCalloutKind fromKey(String? raw) {
    final normalized = raw?.trim().toLowerCase() ?? 'info';
    for (final item in TopicLessonCalloutKind.values) {
      if (item.key == normalized) return item;
    }
    return TopicLessonCalloutKind.info;
  }
}

/// Kronoloji (`timeline`) bloğundaki tekil yıl/dönem satırı.
class TopicLessonTimelineItem {
  final String label;
  final String text;

  const TopicLessonTimelineItem({required this.label, required this.text});

  factory TopicLessonTimelineItem.fromJson(Map<String, dynamic> json) {
    return TopicLessonTimelineItem(
      label: (json['label'] ?? '').toString().trim(),
      text: (json['text'] ?? '').toString().trim(),
    );
  }

  Map<String, dynamic> toJson() => {'label': label, 'text': text};
}

/// Konu anlatımı bölümündeki (`TopicLessonUnit`) tek bir içerik bloğunu temsil
/// eden `sealed` sınıf hiyerarşisi (`TASK-168`).
///
/// Ortak Sözleşme kuralı gereği bilinmeyen `type` değerleri `tryParse` tarafından
/// `null` döndürülerek istemcide çökme olmadan sessizce atlanır.
///
/// Angular/Web Karşılığı: Discriminated union `TopicLessonBlock`.
sealed class TopicLessonBlock {
  String get type;

  const TopicLessonBlock();

  Map<String, dynamic> toJson();

  /// Tek bir JSON nesnesini [TopicLessonBlock] alt sınıfına ayrıştırır.
  /// Bilinmeyen veya bozuk blok türlerinde `null` döner.
  static TopicLessonBlock? tryParse(dynamic raw) {
    if (raw is! Map) return null;
    final json = Map<String, dynamic>.from(raw);
    final type = (json['type'] ?? '').toString().trim();

    switch (type) {
      case 'heading':
        final text = (json['text'] ?? '').toString().trim();
        if (text.isEmpty) return null;
        return TopicLessonHeadingBlock(text: text);

      case 'paragraph':
        final text = (json['text'] ?? '').toString().trim();
        if (text.isEmpty) return null;
        return TopicLessonParagraphBlock(text: text);

      case 'bullets':
        final items = _parseStringList(json['items']);
        if (items.isEmpty) return null;
        return TopicLessonBulletsBlock(items: items);

      case 'table':
        final headers = _parseStringList(json['headers']);
        final rawRows = json['rows'];
        final rows = <List<String>>[];
        if (rawRows is List) {
          for (final row in rawRows) {
            if (row is List) {
              rows.add(
                row.map((cell) => (cell ?? '').toString().trim()).toList(),
              );
            }
          }
        }
        if (headers.isEmpty && rows.isEmpty) return null;
        return TopicLessonTableBlock(headers: headers, rows: rows);

      case 'timeline':
        final rawItems = json['items'];
        final items = <TopicLessonTimelineItem>[];
        if (rawItems is List) {
          for (final item in rawItems) {
            if (item is Map) {
              final parsed = TopicLessonTimelineItem.fromJson(
                Map<String, dynamic>.from(item),
              );
              if (parsed.label.isNotEmpty || parsed.text.isNotEmpty) {
                items.add(parsed);
              }
            }
          }
        }
        if (items.isEmpty) return null;
        return TopicLessonTimelineBlock(items: items);

      case 'callout':
        final text = (json['text'] ?? '').toString().trim();
        if (text.isEmpty) return null;
        final kind = TopicLessonCalloutKind.fromKey(json['kind']?.toString());
        return TopicLessonCalloutBlock(kind: kind, text: text);

      case 'key_points':
        final items = _parseStringList(json['items']);
        if (items.isEmpty) return null;
        return TopicLessonKeyPointsBlock(items: items);

      case 'check_questions':
        final questionIds = _parseStringList(json['question_ids']);
        return TopicLessonCheckQuestionsBlock(questionIds: questionIds);

      default:
        // Bilinmeyen blok türü istemcide sessizce atlanır.
        return null;
    }
  }

  /// JSON dizisini geçerli [TopicLessonBlock] listesine çevirir; bilinmeyenleri atlar.
  static List<TopicLessonBlock> parseList(dynamic rawList) {
    if (rawList is! List) return const <TopicLessonBlock>[];
    final result = <TopicLessonBlock>[];
    for (final raw in rawList) {
      final block = tryParse(raw);
      if (block != null) {
        result.add(block);
      }
    }
    return List<TopicLessonBlock>.unmodifiable(result);
  }

  static List<String> _parseStringList(dynamic raw) {
    if (raw is! List) return const <String>[];
    return List<String>.unmodifiable(
      raw
          .map((e) => (e ?? '').toString().trim())
          .where((s) => s.isNotEmpty)
          .toList(),
    );
  }
}

/// Bölüm içi alt başlık (`### Başlık`) bloğu.
final class TopicLessonHeadingBlock extends TopicLessonBlock {
  final String text;

  const TopicLessonHeadingBlock({required this.text});

  @override
  String get type => 'heading';

  @override
  Map<String, dynamic> toJson() => {'type': type, 'text': text};
}

/// Düz anlatım paragrafı (`**kalın**` ve `*italik*` destekli) bloğu.
final class TopicLessonParagraphBlock extends TopicLessonBlock {
  final String text;

  const TopicLessonParagraphBlock({required this.text});

  @override
  String get type => 'paragraph';

  @override
  Map<String, dynamic> toJson() => {'type': type, 'text': text};
}

/// Madde işaretli liste (`bullets`) bloğu.
final class TopicLessonBulletsBlock extends TopicLessonBlock {
  final List<String> items;

  const TopicLessonBulletsBlock({required this.items});

  @override
  String get type => 'bullets';

  @override
  Map<String, dynamic> toJson() => {'type': type, 'items': items};
}

/// Karşılaştırma ve sınıflandırma tablosu (`table`) bloğu.
final class TopicLessonTableBlock extends TopicLessonBlock {
  final List<String> headers;
  final List<List<String>> rows;

  const TopicLessonTableBlock({required this.headers, required this.rows});

  @override
  String get type => 'table';

  @override
  Map<String, dynamic> toJson() => {
    'type': type,
    'headers': headers,
    'rows': rows,
  };
}

/// Dikey kronoloji / zaman çizgisi (`timeline`) bloğu.
final class TopicLessonTimelineBlock extends TopicLessonBlock {
  final List<TopicLessonTimelineItem> items;

  const TopicLessonTimelineBlock({required this.items});

  @override
  String get type => 'timeline';

  @override
  Map<String, dynamic> toJson() => {
    'type': type,
    'items': items.map((e) => e.toJson()).toList(),
  };
}

/// Vurgulu kutu (`info`, `mnemonic`, `trap`, `example`) bloğu.
final class TopicLessonCalloutBlock extends TopicLessonBlock {
  final TopicLessonCalloutKind kind;
  final String text;

  const TopicLessonCalloutBlock({required this.kind, required this.text});

  @override
  String get type => 'callout';

  @override
  Map<String, dynamic> toJson() => {
    'type': type,
    'kind': kind.key,
    'text': text,
  };
}

/// Bölüm sonu "Akılda Kalsın" özet maddeleri (`key_points`) bloğu.
final class TopicLessonKeyPointsBlock extends TopicLessonBlock {
  final List<String> items;

  const TopicLessonKeyPointsBlock({required this.items});

  @override
  String get type => 'key_points';

  @override
  Map<String, dynamic> toJson() => {'type': type, 'items': items};
}

/// Bölüm sonu mini kontrol soruları (`check_questions`) bloğu.
final class TopicLessonCheckQuestionsBlock extends TopicLessonBlock {
  final List<String> questionIds;

  const TopicLessonCheckQuestionsBlock({required this.questionIds});

  @override
  String get type => 'check_questions';

  @override
  Map<String, dynamic> toJson() => {'type': type, 'question_ids': questionIds};
}

/// Bir konunun 6–12 dakikada okunabilen tek bir konu anlatımı bölümünü (`public.topic_lesson_units`)
/// temsil eden model (`TASK-168`).
class TopicLessonUnit {
  final String id;
  final String lesson;
  final String topic;
  final int unitOrder;
  final String title;
  final String? summary;
  final int estimatedMinutes;
  final List<TopicLessonBlock> blocks;
  final List<String> examScopes;
  final int contentVersion;
  final bool isPublished;
  final DateTime? updatedAt;

  const TopicLessonUnit({
    required this.id,
    required this.lesson,
    required this.topic,
    required this.unitOrder,
    required this.title,
    this.summary,
    required this.estimatedMinutes,
    required this.blocks,
    this.examScopes = const ['b_grubu_gk'],
    this.contentVersion = 1,
    this.isPublished = true,
    this.updatedAt,
  });

  /// Bölümdeki geçerli blokların `type` listesini döner (eşleniklik testi özeti için).
  List<String> get blockTypes =>
      List<String>.unmodifiable(blocks.map((b) => b.type));

  /// Bölümdeki kontrol sorusu bloğunun beklenen soru sayısını döner.
  /// Açık `question_ids` boşsa otomatik seçim kuralı gereği `2` kabul edilir;
  /// hiç `check_questions` bloğu yoksa `0` döner.
  int get checkQuestionCount {
    for (final block in blocks) {
      if (block is TopicLessonCheckQuestionsBlock) {
        return block.questionIds.isEmpty ? 2 : block.questionIds.length;
      }
    }
    return 0;
  }

  factory TopicLessonUnit.fromJson(Map<String, dynamic> json) {
    final rawScopes = json['exam_scopes'] ?? json['examScopes'];
    final scopes = rawScopes is List
        ? rawScopes
              .map((e) => (e ?? '').toString().trim())
              .where((s) => s.isNotEmpty)
              .toList(growable: false)
        : const <String>['b_grubu_gk'];
    final rawOrder = json['unit_order'] ?? json['unitOrder'] ?? 1;
    final rawMinutes =
        json['estimated_minutes'] ?? json['estimatedMinutes'] ?? 5;
    final rawVersion = json['content_version'] ?? json['contentVersion'] ?? 1;
    final rawUpdated = json['updated_at'] ?? json['updatedAt'];

    return TopicLessonUnit(
      id: (json['id'] ?? '').toString().trim(),
      lesson: (json['lesson'] ?? '').toString().trim(),
      topic: (json['topic'] ?? '').toString().trim(),
      unitOrder: (rawOrder as num?)?.toInt() ?? 1,
      title: (json['title'] ?? '').toString().trim(),
      summary: json['summary']?.toString().trim(),
      estimatedMinutes: ((rawMinutes as num?)?.toInt() ?? 5).clamp(1, 120),
      blocks: TopicLessonBlock.parseList(json['blocks']),
      examScopes: scopes.isEmpty ? const ['b_grubu_gk'] : scopes,
      contentVersion: (rawVersion as num?)?.toInt() ?? 1,
      isPublished: (json['is_published'] ?? json['isPublished']) != false,
      updatedAt: rawUpdated != null
          ? DateTime.tryParse(rawUpdated.toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'lesson': lesson,
    'topic': topic,
    'unit_order': unitOrder,
    'title': title,
    'summary': summary,
    'estimated_minutes': estimatedMinutes,
    'blocks': blocks.map((b) => b.toJson()).toList(),
    'exam_scopes': examScopes,
    'content_version': contentVersion,
    'is_published': isPublished,
    if (updatedAt != null) 'updated_at': updatedAt!.toUtc().toIso8601String(),
  };
}

/// Kullanıcının tek bir konu anlatımı bölümündeki (`unit_id`) okuma/tamamlama
/// kaydını temsil eden model (`public.user_topic_lesson_progress`).
class TopicLessonUnitProgress {
  final String unitId;
  final String examScope;
  final DateTime? completedAt;
  final DateTime lastOpenedAt;

  const TopicLessonUnitProgress({
    required this.unitId,
    this.examScope = 'lisans_gygk',
    this.completedAt,
    required this.lastOpenedAt,
  });

  bool get isCompleted => completedAt != null;

  TopicLessonUnitProgress copyWith({
    String? unitId,
    String? examScope,
    DateTime? completedAt,
    DateTime? lastOpenedAt,
  }) {
    return TopicLessonUnitProgress(
      unitId: unitId ?? this.unitId,
      examScope: examScope ?? this.examScope,
      completedAt: completedAt ?? this.completedAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
    );
  }

  factory TopicLessonUnitProgress.fromJson(Map<String, dynamic> json) {
    final rawCompleted = json['completed_at'] ?? json['completedAt'];
    final rawLastOpened = json['last_opened_at'] ?? json['lastOpenedAt'];
    return TopicLessonUnitProgress(
      unitId: (json['unit_id'] ?? json['unitId'] ?? '').toString().trim(),
      examScope: (json['exam_scope'] ?? json['examScope'] ?? 'lisans_gygk')
          .toString()
          .trim(),
      completedAt: rawCompleted != null
          ? DateTime.tryParse(rawCompleted.toString())
          : null,
      lastOpenedAt:
          (rawLastOpened != null
              ? DateTime.tryParse(rawLastOpened.toString())
              : null) ??
          DateTime.now().toUtc(),
    );
  }

  Map<String, dynamic> toJson() => {
    'unit_id': unitId,
    'exam_scope': examScope,
    'completed_at': completedAt?.toUtc().toIso8601String(),
    'last_opened_at': lastOpenedAt.toUtc().toIso8601String(),
  };

  Map<String, dynamic> toSupabaseRow(String userId) => {
    'user_id': userId,
    ...toJson(),
  };
}

/// Konu anlatımı otomatik kontrol sorusu seçimi ve ilerleme yüzdesi hesabı için
/// saf (pure) alan fonksiyonları (`TASK-168` Ortak Sözleşme).
///
/// Angular/Web Karşılığı: `src/domain/topic-lessons.ts` içindeki saf fonksiyonlarla
/// `docs/parity_fixtures/topic_lesson_units.json` üzerinden birebir eşleniktir.
class TopicLessonDomain {
  TopicLessonDomain._();

  /// Otomatik kontrol sorusu seçimi kuralı (`TASK-168` Ortak Sözleşme):
  ///
  /// - [explicitQuestionIds] doluysa havuzdan bu kimliklere sahip soruları aynı
  ///   sırada döner.
  /// - [explicitQuestionIds] boşsa, o konunun çoktan seçmeli sorularından
  ///   `difficultyLevel <= 2` olanlar `orderIndex` (null ise sona, eşitse `id`)
  ///   sırasıyla dizilir; `unitOrder = k` (1'den başlar) olan bölüm bu listenin
  ///   `(k-1)*2` ve `(k-1)*2+1` indeksli sorularını alır (liste kısaysa modulo ile
  ///   başa sarar; tek soru varsa tek soru döner).
  static List<Question> selectCheckQuestions({
    required List<Question> topicQuestions,
    required int unitOrder,
    List<String> explicitQuestionIds = const [],
  }) {
    if (topicQuestions.isEmpty) return const <Question>[];

    if (explicitQuestionIds.isNotEmpty) {
      final byId = <String, Question>{for (final q in topicQuestions) q.id: q};
      final resolved = <Question>[];
      for (final id in explicitQuestionIds) {
        final match = byId[id.trim()];
        if (match != null) {
          resolved.add(match);
        }
      }
      if (resolved.isNotEmpty) {
        return List<Question>.unmodifiable(resolved);
      }
    }

    final candidates =
        topicQuestions.where((q) => q.difficultyLevel <= 2).toList()
          ..sort((a, b) {
            final aOrder = a.orderIndex ?? 1 << 20;
            final bOrder = b.orderIndex ?? 1 << 20;
            final cmp = aOrder.compareTo(bOrder);
            if (cmp != 0) return cmp;
            return a.id.compareTo(b.id);
          });

    if (candidates.isEmpty) return const <Question>[];
    if (candidates.length == 1) {
      return List<Question>.unmodifiable([candidates.first]);
    }

    final safeOrder = unitOrder < 1 ? 1 : unitOrder;
    final firstIdx = ((safeOrder - 1) * 2) % candidates.length;
    final secondIdx = ((safeOrder - 1) * 2 + 1) % candidates.length;
    final first = candidates[firstIdx];
    final second = candidates[secondIdx];
    if (first.id == second.id) {
      return List<Question>.unmodifiable([first]);
    }
    return List<Question>.unmodifiable([first, second]);
  }

  /// Konu ilerleme oranını (`0.0 .. 1.0`) ve yüzdesini (`0 .. 100`) hesaplar.
  ///
  /// Kural: `Konu ilerlemesi = tamamlanan yayınlanmış bölüm / toplam yayınlanmış bölüm`.
  static int computeProgressPercent({
    required int completedCount,
    required int totalPublishedCount,
  }) {
    if (totalPublishedCount <= 0 || completedCount <= 0) return 0;
    final clamped = completedCount > totalPublishedCount
        ? totalPublishedCount
        : completedCount;
    return ((clamped / totalPublishedCount) * 100).round().clamp(0, 100);
  }
}
