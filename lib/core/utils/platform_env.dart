import 'package:flutter/foundation.dart' show kIsWeb, visibleForTesting;

import 'platform_env_stub.dart'
    if (dart.library.io) 'platform_env_io.dart'
    as impl;

/// Çalışma zamanı platform ve test ortamı sorgulama yardımcısı (`TASK-145`).
///
/// Dart `if (dart.library.io)` koşullu içe aktarımı sayesinde `flutter build web --wasm`
/// derlemesinde `dart:io` bağımlılığı olmadan derlenir.
/// Web/Angular karşılığı: `PLATFORM_ID` / `isPlatformBrowser()` enjeksiyon belirtecidir.
class PlatformEnv {
  PlatformEnv._();

  /// Birim testlerinde canlı Web tarayıcısı davranışını simüle etmek için kullanılır.
  @visibleForTesting
  static bool? debugOverrideIsWebForTest;

  /// Uygulamanın Web tarayıcısında çalışıp çalışmadığını döner.
  static bool get isWeb => debugOverrideIsWebForTest ?? kIsWeb;

  /// Android cihazında çalışılıp çalışılmadığını döner (Web'de her zaman `false`).
  static bool get isAndroid => !isWeb && impl.isAndroidPlatform;

  /// iOS cihazında çalışılıp çalışılmadığını döner (Web'de her zaman `false`).
  static bool get isIos => !isWeb && impl.isIosPlatform;

  /// Mobil platform (Android veya iOS) olup olmadığını döner.
  static bool get isMobile => isAndroid || isIos;

  /// Yerel `flutter test` (`FLUTTER_TEST`) ortamında çalışılıp çalışılmadığını döner.
  static bool get isFlutterTest => !isWeb && impl.isFlutterTestEnvironment;

  /// Testler arası sahte Web bayrağını temizler.
  @visibleForTesting
  static void resetForTest() {
    debugOverrideIsWebForTest = null;
  }
}
