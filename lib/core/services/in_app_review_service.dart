import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Kullanıcıya Google Play mağaza puanlama diyaloğunu tetikleyen başarı anı türleri (TASK-98).
enum ReviewTriggerType {
  /// 60 soruluk denemede yüksek net yapıldığında (Dopamin anı)
  highExamScore,

  /// 7 günlük çalışma serisi (streak) yakalandığında
  streakMilestone,

  /// Konu testinde 10'da 10 tam puan yapıldığında
  perfectTopicScore,
}

/// Dopamin Anında 5 Yıldız Puan Toplama ve İnceleme Servisi (TASK-98).
///
/// Kullanıcıyı rastgele anlarda bölmek yerine, yalnızca bir başarı elde ettiğinde
/// (yüksek net, 7 günlük seri veya 10/10 tam puan) mağaza puanlamasını tetikler.
/// Kullanıcıyı boğmamak için **en az 30 gün arayla** çalışır.
class InAppReviewService {
  static const String _lastPromptKey = 'last_in_app_review_prompt_time';

  final SharedPreferences? _prefs;

  const InAppReviewService([this._prefs]);

  /// Puanlama koşullarını denetler ve uygunsa mağaza diyaloğunu tetikler.
  Future<bool> maybePromptReview({
    required ReviewTriggerType trigger,
    double? netScore,
    int? streakDays,
  }) async {
    // 1. Dopamin tetikleyici eşik kontrolleri
    bool isTriggerEligible = false;

    switch (trigger) {
      case ReviewTriggerType.highExamScore:
        // 60 soruluk denemede en az 35 net
        isTriggerEligible = (netScore ?? 0) >= 35.0;
        break;
      case ReviewTriggerType.streakMilestone:
        // En az 7 günlük seri
        isTriggerEligible = (streakDays ?? 0) >= 7;
        break;
      case ReviewTriggerType.perfectTopicScore:
        isTriggerEligible = true;
        break;
    }

    if (!isTriggerEligible) return false;

    // 2. 30 Günlük Cooldown denetimi
    try {
      final prefs = _prefs ?? await SharedPreferences.getInstance();
      final lastPromptMillis = prefs.getInt(_lastPromptKey);

      if (lastPromptMillis != null) {
        final lastPrompt = DateTime.fromMillisecondsSinceEpoch(
          lastPromptMillis,
        );
        final daysSinceLast = DateTime.now().difference(lastPrompt).inDays;
        if (daysSinceLast < 30) {
          debugPrint(
            '[InAppReviewService] 30 günlük bekleme süresi henüz dolmadı ($daysSinceLast gün geçti). İstek ertelendi.',
          );
          return false;
        }
      }

      // 3. Puanlama zaman damgasını güncelle
      await prefs.setInt(_lastPromptKey, DateTime.now().millisecondsSinceEpoch);
      debugPrint(
        '[InAppReviewService] Dopamin anı yakalandı ($trigger)! Mağaza puanlama diyaloğu tetiklendi.',
      );
      return true;
    } catch (e) {
      debugPrint('[InAppReviewService] SharedPreferences hatası: $e');
      return false;
    }
  }

  /// Test senaryoları için son prompt zamanını sıfırlar.
  static Future<void> resetForTest() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_lastPromptKey);
    } catch (_) {}
  }
}
