import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// KPSS Günlük Çalışma ve Seri Hatırlatıcı Bildirim Servisi.
///
/// Akşam saat 20:00'de veya günlük çalışma saatlerinde kullanıcıya
/// motivasyonel bildirim gönderir.
/// Masaüstü, Web veya test ortamında otomatik olarak sessiz mock moduna geçer.
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool _isInitialized = false;
  static bool _mockMode = false;

  /// Test senaryolarında mock modunu etkinleştirir.
  static void enableMockMode() {
    _mockMode = true;
  }

  /// Bildirim eklentisini güvenli şekilde başlatır.
  static Future<void> initializeSafely() async {
    if (_mockMode) return;
    try {
      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
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

      await _notificationsPlugin.initialize(settings: initSettings);
      _isInitialized = true;

      // Akşam 20:00 günlük hatırlatmasını planla
      await scheduleDailyStudyReminder();
      // Pazar 10:00 haftalık deneme hatırlatmasını planla
      await scheduleWeeklyExamReminder();
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
        title: 'Kadro Koçun 🦅',
        body: 'Bugünkü serin bozulmasın! Hedefine ulaşmak için hemen 10 soru çöz.',
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
        title: 'Pazar KPSS Deneme Saati ☕',
        body: 'Bugün 60 soruluk gerçek KPSS GK deneme günü! Netlerini ölçmek için hemen başla.',
        repeatInterval: RepeatInterval.weekly,
        notificationDetails: platformDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    } catch (e) {
      debugPrint('scheduleWeeklyExamReminder hatası: $e');
    }
  }

  /// Kullanıcının çalışma serisi (streak) tehlikeye girdiğinde anlık motivasyon uyarısı gönderir (TASK-97).
  static Future<void> triggerStreakProtectionAlert(int streakDays) async {
    await showNotification(
      id: 1003,
      title: '🔥 $streakDays Günlük Serin Tehlikede!',
      body: 'Günü kapatmadan birkaç soru çöz, serini koru ve Altın Kadro yarışında öne geç!',
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
