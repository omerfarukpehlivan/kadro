import 'package:flutter/widgets.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';

/// Müfredat veya tekil ders modülünün içerik ve çözülebilirlik durumunu ifade eder.
///
/// Angular/Web Karşılığı: Bir modülün feature-flag / yayın durumunu tutan
/// `AvailabilityStatus` enum sabitleri.
enum CurriculumAvailability {
  ready(key: 'ready', label: 'Aktif'),
  partial(key: 'partial', label: 'Kısmi'),
  comingSoon(key: 'coming_soon', label: 'Yakında');

  final String key;
  final String label;

  const CurriculumAvailability({required this.key, required this.label});
}

/// Sınav türüne özgü tek bir ders tanımı, konu listesi ve konu başı test sayıları.
///
/// Angular/Web Karşılığı: Dinamik ders kartlarını ve müfredat ağacını besleyen
/// değişmez (immutable) `LessonSpec` DTO arayüzü.
@immutable
class LessonSpec {
  final String id;
  final String name;
  final String section;
  final int questionCount;
  final IconData icon;
  final List<String> topics;
  final Map<String, int> defaultTestCountsByTopic;
  final int fallbackTestCount;
  final String? badgeText;
  final CurriculumAvailability availability;

  const LessonSpec({
    required this.id,
    required this.name,
    required this.section,
    required this.questionCount,
    required this.icon,
    required this.topics,
    this.defaultTestCountsByTopic = const {},
    this.fallbackTestCount = 5,
    this.badgeText,
    this.availability = CurriculumAvailability.ready,
  });

  /// Mevcut eski `Lesson` sabitinden `LessonSpec` türeten yardımcı fabrika.
  factory LessonSpec.fromLegacyLesson(
    Lesson lesson, {
    Map<String, int> defaultTestCountsByTopic = const {},
    int fallbackTestCount = 5,
    int? questionCountOverride,
    CurriculumAvailability? availabilityOverride,
  }) {
    final effectiveAvailability =
        availabilityOverride ??
        (lesson.isComingSoon
            ? CurriculumAvailability.comingSoon
            : CurriculumAvailability.ready);
    return LessonSpec(
      id: lesson.id,
      name: lesson.name,
      section: lesson.section,
      questionCount: questionCountOverride ?? lesson.questionCount,
      icon: lesson.icon,
      topics: lesson.topics,
      defaultTestCountsByTopic: defaultTestCountsByTopic,
      fallbackTestCount: fallbackTestCount,
      badgeText: lesson.badgeText,
      availability: effectiveAvailability,
    );
  }

  /// Dersin henüz soru havuzu açılmamış ("Yakında") modül olup olmadığını döner.
  bool get isComingSoon => availability == CurriculumAvailability.comingSoon;

  /// Belirli bir konunun varsayılan 10 soruluk test sayısını veri haritasından çözer.
  int testCountForTopic(String topic) =>
      defaultTestCountsByTopic[topic] ?? fallbackTestCount;

  /// Bu dersteki tüm konuların toplam 10 soruluk test sayısı.
  int get totalTestCount =>
      topics.fold<int>(0, (sum, topic) => sum + testCountForTopic(topic));

  /// Seçili alanları güncelleyerek yeni bir [LessonSpec] kopyası üretir.
  LessonSpec copyWith({
    String? id,
    String? name,
    String? section,
    int? questionCount,
    IconData? icon,
    List<String>? topics,
    Map<String, int>? defaultTestCountsByTopic,
    int? fallbackTestCount,
    String? badgeText,
    CurriculumAvailability? availability,
  }) {
    return LessonSpec(
      id: id ?? this.id,
      name: name ?? this.name,
      section: section ?? this.section,
      questionCount: questionCount ?? this.questionCount,
      icon: icon ?? this.icon,
      topics: topics ?? this.topics,
      defaultTestCountsByTopic:
          defaultTestCountsByTopic ?? this.defaultTestCountsByTopic,
      fallbackTestCount: fallbackTestCount ?? this.fallbackTestCount,
      badgeText: badgeText ?? this.badgeText,
      availability: availability ?? this.availability,
    );
  }

  /// Mevcut alt ekranlarla (`LessonTopicsScreen` vb.) uyumlu [Lesson] modeline dönüştürür.
  Lesson toLesson() => Lesson(
    id: id,
    name: name,
    section: section,
    questionCount: questionCount,
    icon: icon,
    topics: topics,
    badgeText: badgeText,
    isComingSoon: isComingSoon,
  );
}

/// Aktif sınav seçimine göre üretilen eksiksiz müfredat sözleşmesi.
///
/// Angular/Web Karşılığı: `CurriculumService` üzerinden sağlanan çalışma alanı
/// şeması; ders kartlarını, filtre çiplerini ve çalışma hızını veri odaklı yönetir.
@immutable
class ExamCurriculum {
  final String scopeKey;
  final String title;
  final String summaryLabel;
  final int totalQuestions;
  final int standardDurationMinutes;
  final CurriculumAvailability availability;
  final String activeSectionTitle;
  final String upcomingSectionTitle;
  final List<LessonSpec> activeLessons;
  final List<LessonSpec> upcomingLessons;
  final bool supportsTurkeyMapWorkshop;
  final bool supportsMiniGames;
  final bool supportsFlashcards;
  final String upcomingContextLabel;

  const ExamCurriculum({
    required this.scopeKey,
    required this.title,
    required this.summaryLabel,
    required this.totalQuestions,
    required this.standardDurationMinutes,
    required this.availability,
    required this.activeSectionTitle,
    required this.upcomingSectionTitle,
    required this.activeLessons,
    this.upcomingLessons = const [],
    this.supportsTurkeyMapWorkshop = true,
    this.supportsMiniGames = true,
    this.supportsFlashcards = true,
    this.upcomingContextLabel = 'KPSS Genel Yetenek',
  });

  /// Aktif ve yaklaşan tüm derslerin birleşik listesi.
  List<LessonSpec> get allLessons => [...activeLessons, ...upcomingLessons];

  /// Aktif ders adlarını sıralı biçimde döner; aktif ders yoksa yaklaşan ders adlarını döner.
  List<String> get primaryLessonNames {
    final source = activeLessons.isNotEmpty ? activeLessons : upcomingLessons;
    return source.map((l) => l.name).toList(growable: false);
  }

  /// Aktif müfredattaki toplam 10 soruluk test sayısı.
  ///
  /// Aktif soru havuzu henüz açılmamış sınav ailelerinde (ör. DHBT / A Grubu iskeleti)
  /// planlama motorunun 0'a bölünme yaşamaması için yaklaşan ders hacmini baz alır.
  int get totalTestCount {
    final source = activeLessons.isNotEmpty ? activeLessons : upcomingLessons;
    return source.fold<int>(0, (sum, lesson) => sum + lesson.totalTestCount);
  }

  /// Aktif ders ağırlık barının payda değeri (0 bölünmesine karşı güvenli).
  int get activeQuestionDenominator {
    final activeSum = activeLessons.fold<int>(
      0,
      (sum, lesson) => sum + lesson.questionCount,
    );
    if (activeSum > 0) return activeSum;
    return totalQuestions > 0 ? totalQuestions : 1;
  }

  /// Bilgi Kartları ve Yanlış Defteri filtre çiplerini dinamik üretir.
  ///
  /// Aktif müfredat derslerini sırada tutar, ardından kayıtlardan gelen
  /// ek ders adlarını ('Tümü' öne gelecek şekilde) tekrarsız ekler.
  List<String> buildFilterLessons(
    Iterable<String> extraLessons, {
    bool includeUpcomingIfNoActive = true,
    bool includeAllOption = true,
  }) {
    final filters = <String>[if (includeAllOption) 'Tümü'];
    final seen = <String>{};

    void addIfUnique(String raw) {
      final trimmed = raw.trim();
      if (trimmed.isEmpty || trimmed == 'Tümü') return;
      if (seen.add(trimmed)) {
        filters.add(trimmed);
      }
    }

    for (final lesson in activeLessons) {
      addIfUnique(lesson.name);
    }
    if (includeUpcomingIfNoActive && activeLessons.isEmpty) {
      for (final lesson in upcomingLessons) {
        addIfUnique(lesson.name);
      }
    }
    for (final extra in extraLessons) {
      addIfUnique(extra);
    }
    return filters;
  }

  /// Belirli bir ders ve konu için bu müfredata özel test sayısını döner.
  int topicTestCount(String lessonName, String topic) {
    final normalized = lessonName.trim().toLowerCase();
    for (final lesson in allLessons) {
      if (lesson.name.toLowerCase() == normalized) {
        return lesson.testCountForTopic(topic);
      }
    }
    return 5;
  }
}
