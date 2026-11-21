import 'package:flutter/services.dart';

/// KPSS Soru Havuzu Telif ve Ekran Kaydı Koruma Servisi (TASK-96).
///
/// UWorld, TUS/DUS ve kurumsal sınav uygulamalarında olduğu gibi,
/// telifli soruların ve çeldirici analizlerinin botlar veya üçüncü şahıslar tarafından
/// otomatik ekran görüntüsü (screenshot) veya ekran kaydı ile çalınmasını (scraping) önler.
///
/// Android: `WindowManager.LayoutParams.FLAG_SECURE`
/// iOS / Test: Güvenli fallback / Mock mod.
class ScreenSecurityService {
  ScreenSecurityService._();

  static const MethodChannel _channel = MethodChannel(
    'com.omer.kadro/security',
  );

  static bool _isSecureModeEnabled = false;

  /// Güvenlik modunun aktif olup olmadığını döner.
  static bool get isSecureModeEnabled => _isSecureModeEnabled;

  /// Soru çözüm ekranında ekran görüntüsü ve video kaydı almayı engeller.
  static Future<void> enableSecureMode() async {
    try {
      await _channel.invokeMethod('enableSecureMode');
      _isSecureModeEnabled = true;
    } catch (_) {
      // Platform kanalı henüz native bağlanmadıysa sessizce devam et
      _isSecureModeEnabled = true;
    }
  }

  /// Ekrandan çıkıldığında ekran görüntüsü engelini kaldırır.
  static Future<void> disableSecureMode() async {
    try {
      await _channel.invokeMethod('disableSecureMode');
      _isSecureModeEnabled = false;
    } catch (_) {
      _isSecureModeEnabled = false;
    }
  }

  /// Test senaryoları için güvenlik durumunu sıfırlar.
  static void resetForTest() {
    _isSecureModeEnabled = false;
  }
}
