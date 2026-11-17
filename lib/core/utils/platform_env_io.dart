import 'dart:io' show Platform;

/// Yerel VM / Mobil (`dart:io`) ortam tespiti.
bool get isAndroidPlatform {
  try {
    return Platform.isAndroid;
  } catch (_) {
    return false;
  }
}

/// Yerel VM / Mobil (`dart:io`) iOS tespiti.
bool get isIosPlatform {
  try {
    return Platform.isIOS;
  } catch (_) {
    return false;
  }
}

/// `FLUTTER_TEST` ortam değişkeni kontrolü.
bool get isFlutterTestEnvironment {
  try {
    return Platform.environment.containsKey('FLUTTER_TEST');
  } catch (_) {
    return false;
  }
}
