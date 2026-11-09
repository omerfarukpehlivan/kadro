import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/in_app_review_service.dart';
import 'package:kadro/core/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TASK-97 & TASK-98: Büyüme, Bildirimler ve In-App Review Testleri', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      NotificationService.enableMockMode();
    });

    test('NotificationService haftalık deneme ve streak koruma bildirimlerini güvenle tetiklemeli', () async {
      await expectLater(
        NotificationService.scheduleWeeklyExamReminder(),
        completes,
      );
      await expectLater(
        NotificationService.triggerStreakProtectionAlert(5),
        completes,
      );
    });

    test('InAppReviewService dopamin anında tetiklenmeli ve 30 günlük cooldown uygulamalı', () async {
      final prefs = await SharedPreferences.getInstance();
      final service = InAppReviewService(prefs);

      // 1. Düşük nette tetiklenmemeli
      final lowScore = await service.maybePromptReview(
        trigger: ReviewTriggerType.highExamScore,
        netScore: 20.0,
      );
      expect(lowScore, isFalse);

      // 2. Yüksek nette (>=35) tetiklenmeli
      final highScore = await service.maybePromptReview(
        trigger: ReviewTriggerType.highExamScore,
        netScore: 42.5,
      );
      expect(highScore, isTrue);

      // 3. Arka arkaya hemen çağrıldığında 30 günlük cooldown nedeniyle engellenmeli
      final immediateSecondCall = await service.maybePromptReview(
        trigger: ReviewTriggerType.streakMilestone,
        streakDays: 10,
      );
      expect(immediateSecondCall, isFalse);
    });

    test('InAppReviewService 7 günlük seride tetiklenmeli', () async {
      final prefs = await SharedPreferences.getInstance();
      final service = InAppReviewService(prefs);

      // 6 günlük seride tetiklenmemeli
      final belowThreshold = await service.maybePromptReview(
        trigger: ReviewTriggerType.streakMilestone,
        streakDays: 6,
      );
      expect(belowThreshold, isFalse);

      // 7 günlük seride tetiklenmeli
      final eligibleStreak = await service.maybePromptReview(
        trigger: ReviewTriggerType.streakMilestone,
        streakDays: 7,
      );
      expect(eligibleStreak, isTrue);
    });
  });
}
