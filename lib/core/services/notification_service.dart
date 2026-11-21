import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// KPSS Günlük Çalışma ve Seri Hatırlatıcı Bildirim Servisi.
///
/// Akşam saat 20:00'de veya günlük çalışma saatlerinde kullanıcıya
/// motivasyonel bildirim gönderir.
/// Test ortamında otomatik olarak sessiz mock moduna geçer.
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool _isInitialized = false;
  static bool _mockMode = false;

  static bool get _isMobileDevice =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// Test senaryolarında mock modunu etkinleştirir.
  static void enableMockMode() {
    _mockMode = true;
  }

  /// Bildirim eklentisini güvenli şekilde başlatır.
  static Future<void> initializeSafely() async {
    if (_mockMode) return;
    try {
      if (!_isMobileDevice) {
        _isInitialized = false;
        return;
      }

      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          );

      const InitializationSettings initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _notificationsPlugin
          .initialize(settings: initSettings)
          .timeout(const Duration(seconds: 4));
      _isInitialized = true;

      // Hatırlatma planlamaları ilk açılış karesini bekletmeden arka planda çalışır.
      await Future.wait([
        scheduleDailyStudyReminder(),
        scheduleWeeklyExamReminder(),
      ]).timeout(const Duration(seconds: 4));
    } catch (e) {
      debugPrint(
        'NotificationService initialize hatası (Mock moda geçiliyor): $e',
      );
      _isInitialized = false;
    }
  }

  /// Günlük akşam çalışma ve seri koruma hatırlatıcısını planlar.
  static Future<void> scheduleDailyStudyReminder() async {
    if (_mockMode || !_isInitialized) return;

    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            'daily_study_channel',
            'Günlük Çalışma Hatırlatıcı',
            channelDescription:
                'KPSS günlük soru hedefi ve seri hatırlatıcı bildirimler',
            importance: Importance.high,
            priority: Priority.high,
          );

      const NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(),
      );

      // Her gün tekrarlanan bildirim
      await _notificationsPlugin.periodicallyShow(
        id: 1001,
        title: 'Kadro',
        body: 'Bugünkü serini korumak ve günlük hedefini tamamlamak için birkaç soru çözebilirsin.',
        repeatInterval: RepeatInterval.daily,
        notificationDetails: platformDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    } catch (e) {
      debugPrint('scheduleDailyStudyReminder hatası: $e');
    }
  }

  /// Anlık test veya tebrik bildirimi gösterir.
  static Future<void> showNotification({
    required String title,
    required String body,
    int id = 0,
  }) async {
    if (_mockMode || !_isInitialized) {
      debugPrint('[Mock Notification] $title: $body');
      return;
    }

    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            'instant_alerts_channel',
            'Anlık Bildirimler',
            channelDescription: 'Ödül ve başarım bildirimleri',
            importance: Importance.max,
            priority: Priority.high,
          );

      const NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(),
      );

      await _notificationsPlugin.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: platformDetails,
      );
    } catch (e) {
      debugPrint('showNotification hatası: $e');
    }
  }

  /// Pazar günleri haftalık 60 soruluk Genel Kültür Denemesi hatırlatıcısı planlar (TASK-97).
  static Future<void> scheduleWeeklyExamReminder() async {
    if (_mockMode || !_isInitialized) return;

    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            'weekly_exam_channel',
            'Haftalık Deneme Hatırlatıcı',
            channelDescription:
                'Pazar günü KPSS Genel Kültür deneme sınavı davetleri',
            importance: Importance.high,
            priority: Priority.high,
          );

      const NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(),
      );

      await _notificationsPlugin.periodicallyShow(
        id: 1002,
        title: 'Haftalık KPSS Deneme Vakti',
        body: 'Bugün 60 soruluk KPSS Genel Kültür denemesiyle netlerini kontrol edebilirsin.',
        repeatInterval: RepeatInterval.weekly,
        notificationDetails: platformDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    } catch (e) {
      debugPrint('scheduleWeeklyExamReminder hatası: $e');
    }
  }

  /// Kullanıcının çalışma serisi (streak) tehlikeye girdiğinde anlık hatırlatma gönderir (TASK-97).
  static Future<void> triggerStreakProtectionAlert(int streakDays) async {
    await showNotification(
      id: 1003,
      title: '$streakDays günlük serini koru',
      body:
          'Günü kapatmadan birkaç soru çözerek çalışma serini sürdürebilirsin.',
    );
  }

  /// Planlanan tüm bildirimleri iptal eder.
  static Future<void> cancelAll() async {
    if (_mockMode || !_isInitialized) return;
    try {
      await _notificationsPlugin.cancelAll();
    } catch (e) {
      debugPrint('cancelAll hatası: $e');
    }
  }
}
