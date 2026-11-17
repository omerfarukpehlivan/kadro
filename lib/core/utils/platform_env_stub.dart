/// Tarayıcı (Wasm / JS) ortamı için `dart:io` bulunmayan varsayılan stub.
bool get isAndroidPlatform => false;

/// Tarayıcı ortamı için iOS kontrolü (`false`).
bool get isIosPlatform => false;

/// Tarayıcı ortamında `FLUTTER_TEST` her zaman `false`.
bool get isFlutterTestEnvironment => false;
