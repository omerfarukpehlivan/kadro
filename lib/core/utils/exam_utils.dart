/// KPSS sınav hesaplama yardımcı fonksiyonları.
library;

/// KPSS kuralına göre net hesabı yapar:
/// 4 yanlış 1 doğruyu götürür (`doğru - (yanlış / 4)`).
/// Boş bırakılan sorular neti etkilemez.
double calculateNet({required int correct, required int wrong}) {
  if (correct < 0 || wrong < 0) {
    throw ArgumentError('Doğru ve yanlış sayıları negatif olamaz.');
  }
  return correct - (wrong / 4.0);
}
