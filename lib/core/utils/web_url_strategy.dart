import 'web_url_strategy_stub.dart'
    if (dart.library.js_interop) 'web_url_strategy_web.dart'
    as impl;

/// Web tarayıcısında `#` hash işaretini kaldırarak temiz Path URL stratejisini
/// (`/lessons`, `/exams`, `/calculator`) etkinleştirir (`TASK-145`).
///
/// Mobil ve test ortamlarında güvenli boş işlem (no-op) olarak çalışır.
void configureWebUrlStrategy() {
  impl.configureWebUrlStrategy();
}
