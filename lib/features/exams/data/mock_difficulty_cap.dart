import 'package:kadro/features/exams/data/models/exam_selection.dart';

/// KPSS B Grubu deneme sınavlarında (tam deneme, GK oturum denemesi, branş
/// denemesi, hızlı mola) bölüm bazlı maksimum zor soru (`difficultyLevel == 3`)
/// tavanını hesaplayan saf fonksiyon (`TASK-167`).
///
/// - **Lisans:** Tavan yoktur (`null` döner).
/// - **Ön Lisans / Ortaöğretim:** `floor(sectionQuestionCount * 0.15)` döner
///   (Örn. 30 → 4, 27 → 4, 18 → 2, 9 → 1, 6 → 0).
///
/// Angular/Web Karşılığı: `src/domain/` altındaki saf `maxHardQuestionsForSection(level, count)`
/// yardımcı fonksiyonu ile birebir eşleniktir (`docs/parity_fixtures/mock_difficulty_cap.json`).
int? maxHardQuestionsForSection(
  EducationLevel level,
  int sectionQuestionCount,
) {
  if (level == EducationLevel.lisans) {
    return null;
  }
  final safeCount = sectionQuestionCount < 0 ? 0 : sectionQuestionCount;
  return (safeCount * 0.15).floor();
}
