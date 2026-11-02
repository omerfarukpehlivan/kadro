import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/notification_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NotificationService ve Sentry Entegrasyon Testleri (TASK-43)', () {
    setUp(() {
      NotificationService.enableMockMode();
    });

    test('NotificationService güvenli şekilde başlatılabilmeli', () async {
      await expectLater(NotificationService.initializeSafely(), completes);
    });

    test('Günlük çalışma hatırlatıcısı başarıyla planlanabilmeli', () async {
      await expectLater(
        NotificationService.scheduleDailyStudyReminder(),
        completes,
      );
    });

    test('Anlık bildirim ve iptal metotları güvenli çalışmalı', () async {
      await expectLater(
        NotificationService.showNotification(
          title: 'Tebrikler!',
          body: 'Günün soru hedefine ulaştın.',
        ),
        completes,
      );

      await expectLater(NotificationService.cancelAll(), completes);
    });
  });
}
