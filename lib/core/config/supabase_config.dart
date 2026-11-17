import 'package:kadro/core/utils/platform_env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase proje bağlantı yapılandırması.
class SupabaseConfig {
  SupabaseConfig._();

  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://axfxciyuvcdbavhzsfwu.supabase.co',
  );

  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZnhjaXl1dmNkYmF2aHpzZnd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTM1NjU4NTcsImV4cCI6MjEwOTE0MTg1N30.irV-ZOP2Ii1Y8k0ksC-KOF7D811avX6GXRbsxvMC78M',
  );

  static bool _initialized = false;

  static bool get _isFlutterTest => PlatformEnv.isFlutterTest;

  /// Test ortamında (`FLUTTER_TEST`) çalışılıp çalışılmadığını döner.
  ///
  /// Web/Angular karşılığı: `environment.isTest` bayrağı.
  static bool get isFlutterTest => _isFlutterTest;

  /// URL ve Anon Key tanımlıysa ve Supabase başarıyla başlatıldıysa true döner.
  static bool get isReady =>
      !_isFlutterTest && _initialized && url.isNotEmpty && anonKey.isNotEmpty;

  /// Uygulama açılışında (`main.dart`) güvenli şekilde Supabase'i başlatır.
  /// Test ortamında hata fırlatmadan yerel modda devam eder.
  static Future<void> initializeSafely() async {
    if (_isFlutterTest || url.isEmpty || anonKey.isEmpty || _initialized) {
      return;
    }
    try {
      await Supabase.initialize(url: url, publishableKey: anonKey);
      _initialized = true;
    } catch (_) {
      _initialized = false;
    }
  }

  /// Güvenli SupabaseClient erişimi (hazır değilse null döner).
  static SupabaseClient? get clientOrNull =>
      isReady ? Supabase.instance.client : null;
}
