/// Leitner 4-Kutu (`1 · 3 · 7 · 14 gün`) aralıklı tekrar algoritmasının
/// sabit kural ve tarih hesaplama yardımcısı (`TASK-158`).
///
/// Angular/Web Karşılığı: Tekrar aralığını hesaplayan saf TypeScript domain
/// servisi (`LeitnerSchedulerService`).
library;

/// Bir soru veya bilgi kartı tekrarlandıktan sonra oluşan yeni Leitner kutusu durumu.
class LeitnerTransition {
  final int reviewBox;
  final DateTime nextReviewAt;
  final DateTime lastReviewedAt;
  final int box4ConsecutiveCorrect;
  final bool isGraduated;

  const LeitnerTransition({
    required this.reviewBox,
    required this.nextReviewAt,
    required this.lastReviewedAt,
    required this.box4ConsecutiveCorrect,
    required this.isGraduated,
  });
}

/// 1 · 3 · 7 · 14 günlük Leitner kutu geçişlerini ve vade kontrollerini yönetir.
class LeitnerScheduler {
  LeitnerScheduler._();

  /// Kutu 1..4 için gün cinsinden tekrar bekleme süreleri.
  static const List<int> boxIntervalDays = [1, 3, 7, 14];

  /// En düşük ve en yüksek Leitner kutu numaraları.
  static const int minBox = 1;
  static const int maxBox = 4;

  /// Verilen kutu numarası (`1..4`) için kaç gün sonra tekrar çıkacağını döner.
  static int intervalForBox(int box) {
    final safeBox = box.clamp(minBox, maxBox);
    return boxIntervalDays[safeBox - 1];
  }

  /// Verilen kutu ve referans zamana göre bir sonraki tekrar zamanını hesaplar.
  static DateTime nextReviewDateForBox(int box, {DateTime? from}) {
    final base = from ?? DateTime.now();
    return base.add(Duration(days: intervalForBox(box)));
  }

  /// Öğenin şu anki zamanda tekrar vadesinin gelip gelmediğini döner.
  static bool isDue(DateTime nextReviewAt, {DateTime? now}) {
    final reference = now ?? DateTime.now();
    return !nextReviewAt.isAfter(reference);
  }

  /// Kullanıcının doğru ("Biliyorum") veya yanlış ("Tekrar Et") yanıtına göre
  /// bir sonraki kutuyu, Kutu-4 seri sayacını ve mezuniyet durumunu hesaplar.
  static LeitnerTransition advance({
    required int currentBox,
    required int currentBox4Streak,
    required bool isCorrect,
    bool requireDoubleBox4ToGraduate = true,
    DateTime? now,
  }) {
    final timestamp = now ?? DateTime.now();
    final safeBox = currentBox.clamp(minBox, maxBox);

    if (!isCorrect) {
      return LeitnerTransition(
        reviewBox: minBox,
        nextReviewAt: nextReviewDateForBox(minBox, from: timestamp),
        lastReviewedAt: timestamp,
        box4ConsecutiveCorrect: 0,
        isGraduated: false,
      );
    }

    if (safeBox < maxBox) {
      final nextBox = safeBox + 1;
      return LeitnerTransition(
        reviewBox: nextBox,
        nextReviewAt: nextReviewDateForBox(nextBox, from: timestamp),
        lastReviewedAt: timestamp,
        box4ConsecutiveCorrect: 0,
        isGraduated: false,
      );
    }

    final nextStreak = currentBox4Streak + 1;
    final graduated = !requireDoubleBox4ToGraduate || nextStreak >= 2;
    return LeitnerTransition(
      reviewBox: maxBox,
      nextReviewAt: nextReviewDateForBox(maxBox, from: timestamp),
      lastReviewedAt: timestamp,
      box4ConsecutiveCorrect: nextStreak,
      isGraduated: graduated,
    );
  }

  /// Kart ve rozetlerde gösterilen kısa kutu etiketi (`Kutu 1 · 1g`).
  static String boxBadgeLabel(int box) {
    final safeBox = box.clamp(minBox, maxBox);
    return 'Kutu $safeBox · ${intervalForBox(safeBox)}g';
  }

  /// Vade tarihine göre kullanıcı dostu Türkçe kalan gün metni döner.
  static String formatRemainingReviewLabel(
    DateTime nextReviewAt, {
    DateTime? now,
  }) {
    final reference = now ?? DateTime.now();
    if (!nextReviewAt.isAfter(reference)) {
      return 'Bugün tekrar edilmeli';
    }
    final diffHours = nextReviewAt.difference(reference).inHours;
    final remainingDays = (diffHours / 24).ceil().clamp(1, 365);
    if (remainingDays == 1) {
      return '1 gün sonra';
    }
    return '$remainingDays gün sonra';
  }
}
