import 'dart:math' as math;

import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';

/// Tek bir ders için aktif sınav müfredatındaki (`ExamCurriculum`) resmi soru
/// sayısına ve konu dağılımına göre süreli branş denemesi üreten motor (`TASK-154`).
///
/// Angular/Web Karşılığı: `BranchMockExamGeneratorService` — seçili dersin
/// `LessonSpec` sözleşmesini `MockExamBlueprint` şablonuna çevirir ve
/// `QuestionRepository` üzerinden konu ağırlıklı/tekrarsız deneme setleri üretir.
class BranchMockExamGenerator {
  const BranchMockExamGenerator();

  /// Dersin soru sayısına orantılı gerçekçi sınav süresini (yaklaşık soru başı `1.1 dk`)
  /// dakika cinsinden hesaplar (`min 5 dk`, `max 120 dk`).
  static int computeDurationMinutes(int questionCount) {
    final safeCount = math.max(1, questionCount);
    return (safeCount * 1.1).round().clamp(5, 120);
  }

  /// Seçili ders ve sınav profili için [MockExamBlueprint] branş denemesi şablonu kurar.
  ///
  /// `branchMockNumber` (`1, 2, 3...`) her setin farklı soru diliminden çekilmesini
  /// sağlar. Varsayılan kuralda `#1` ücretsiz, `#2` ve sonrası Kadro PRO olarak işaretlenebilir.
  static MockExamBlueprint buildBlueprint({
    required LessonSpec lesson,
    required ExamSelection selection,
    int branchMockNumber = 1,
    bool? isProOnly,
  }) {
    final safeNumber = math.max(1, branchMockNumber);
    final durationMinutes = computeDurationMinutes(lesson.questionCount);
    final topicCount = lesson.topics.length;
    final subBranch = _resolveSectionSubBranch(
      lesson: lesson,
      selection: selection,
    );

    return MockExamBlueprint(
      id: 'branch_${selection.curriculumNamespace}_${lesson.id}_$safeNumber',
      title: '${lesson.name} Branş Denemesi #$safeNumber',
      subtitle: topicCount > 0
          ? '${lesson.questionCount} soruluk ÖSYM formatında ${lesson.name} provası · $topicCount konu dağılımlı'
          : '${lesson.questionCount} soruluk ÖSYM formatında ${lesson.name} provası',
      badgeLabel: 'Branş #$safeNumber · $durationMinutes dk',
      primaryButtonLabel: '${lesson.name} Branş Denemesi Başlat',
      family: selection.family,
      scopeKey: selection.scopeKey,
      sections: [
        ExamSectionSpec(
          id: 'branch_${lesson.id}',
          lesson: lesson.name,
          title: lesson.name,
          questionCount: lesson.questionCount,
          subBranch: subBranch,
        ),
      ],
      standardDurationMinutes: durationMinutes,
      mockNumber: safeNumber,
      isProOnly: isProOnly ?? (safeNumber > 1),
      supportsExtraTime: selection.family == KpssExamFamily.ekpss,
    );
  }

  /// Aktif [ExamCurriculum] içindeki kullanıma hazır (`!isComingSoon`) tüm dersler
  /// için branş denemesi şablon listesini döner.
  static List<MockExamBlueprint> blueprintsForCurriculum({
    required ExamSelection selection,
    required ExamCurriculum curriculum,
    int branchMockNumber = 1,
    bool? isProOnly,
  }) {
    return [
      for (final lesson in curriculum.activeLessons)
        if (!lesson.isComingSoon && lesson.questionCount > 0)
          buildBlueprint(
            lesson: lesson,
            selection: selection,
            branchMockNumber: branchMockNumber,
            isProOnly: isProOnly,
          ),
    ];
  }

  /// Verilen [lesson] ve [selection] için soru havuzundan konu dağılımlı branş denemesi üretir.
  Future<GeneratedBlueprintExam> generateForLesson({
    required LessonSpec lesson,
    ExamSelection selection = ExamSelection.initial,
    int branchMockNumber = 1,
    QuestionRepository questionRepository = const QuestionRepository(),
    String? preferredSourceVariant,
  }) {
    final blueprint = buildBlueprint(
      lesson: lesson,
      selection: selection,
      branchMockNumber: branchMockNumber,
    );
    return questionRepository.generateMockExamFromBlueprint(
      blueprint,
      selection: selection,
      mockNumber: branchMockNumber,
      preferredSourceVariant: preferredSourceVariant,
    );
  }

  static String? _resolveSectionSubBranch({
    required LessonSpec lesson,
    required ExamSelection selection,
  }) {
    if (selection.family == KpssExamFamily.mebAgs &&
        selection.oabtBranch.isOabtExam &&
        lesson.id.startsWith('oabt')) {
      return 'oabt_${selection.oabtBranch.key}';
    }
    if (selection.family == KpssExamFamily.dhbt &&
        lesson.id.startsWith('dhbt_2')) {
      return 'dhbt_${selection.educationLevel.key}';
    }
    return null;
  }
}
