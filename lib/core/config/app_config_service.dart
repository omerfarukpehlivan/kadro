import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:kadro/core/config/supabase_config.dart';

/// Supabase `public.app_config` tablosundan uzaktan konfigürasyonu okuyan servis (TASK-94).
///
/// Angular/Web Karşılığı: `AppConfigService` / Config Loader.
/// Ağ kesintisinde veya çevrimdışıyken [AppRemoteConfig.fallback] dönerek uygulamanın
/// kesintisiz açılmasını garanti eder.
class AppConfigService {
  static AppRemoteConfig? _cachedConfig;
  static DateTime? _lastFetchTime;

  /// Önbellek geçerlilik süresi (1 saat)
  static const Duration cacheTtl = Duration(hours: 1);

  const AppConfigService();

  /// Uzaktan konfigürasyonu çeker. Önbellekte geçerli veri varsa ağ isteği atmaz.
  Future<AppRemoteConfig> fetchConfig({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedConfig != null && _lastFetchTime != null) {
      if (DateTime.now().difference(_lastFetchTime!) < cacheTtl) {
        return _cachedConfig!;
      }
    }

    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      return AppRemoteConfig.fallback;
    }

    try {
      final List<dynamic> response = await client
          .from('app_config')
          .select()
          .eq('id', 'global_config')
          .limit(1);

      if (response.isNotEmpty) {
        final row = response.first as Map<String, dynamic>;
        final config = AppRemoteConfig.fromMap(row);
        _cachedConfig = config;
        _lastFetchTime = DateTime.now();
        return config;
      }
    } catch (e) {
      debugPrint(
        '[AppConfigService] fetchConfig hatası (fallback devrede): $e',
      );
    }

    return AppRemoteConfig.fallback;
  }

  /// Testler için önbelleği temizler.
  static void clearCacheForTest() {
    _cachedConfig = null;
    _lastFetchTime = null;
  }
}

/// [AppConfigService] Riverpod sağlayıcısı.
final appConfigServiceProvider = Provider<AppConfigService>((ref) {
  return const AppConfigService();
});

/// Aktif [AppRemoteConfig] durumunu sağlayan FutureProvider.
final appRemoteConfigProvider = FutureProvider<AppRemoteConfig>((ref) async {
  final service = ref.watch(appConfigServiceProvider);
  return service.fetchConfig();
});
