/// Kadro Uzaktan Yapılandırma ve Sürüm Modeli (TASK-94).
///
/// Angular/Web Karşılığı: `EnvironmentConfig` / Remote Feature Flags.
class AppRemoteConfig {
  final String minSupportedVersion;
  final String latestVersion;
  final bool isMaintenanceMode;
  final String maintenanceMessage;
  final String storeUrl;

  const AppRemoteConfig({
    this.minSupportedVersion = '1.0.0',
    this.latestVersion = '1.0.0',
    this.isMaintenanceMode = false,
    this.maintenanceMessage = 'Kadro bakımda! KPSS soru havuzumuzu güncelliyoruz. Çok yakında tekrar yayındayız.',
    this.storeUrl =
        'https://play.google.com/store/apps/details?id=com.omer.kadro',
  });

  /// Çevrimdışı ve hata durumlarında güvenli varsayılan değer.
  static const AppRemoteConfig fallback = AppRemoteConfig();

  factory AppRemoteConfig.fromMap(Map<String, dynamic> map) {
    return AppRemoteConfig(
      minSupportedVersion: (map['min_supported_version'] ?? '1.0.0').toString(),
      latestVersion: (map['latest_version'] ?? '1.0.0').toString(),
      isMaintenanceMode: (map['is_maintenance_mode'] as bool?) ?? false,
      maintenanceMessage:
          (map['maintenance_message'] ??
                  'Kadro bakımda! KPSS soru havuzumuzu güncelliyoruz. Çok yakında tekrar yayındayız.')
              .toString(),
      storeUrl:
          (map['store_url'] ??
                  'https://play.google.com/store/apps/details?id=com.omer.kadro')
              .toString(),
    );
  }

  /// Mevcut uygulama sürümünün zorunlu güncelleme gerektirip gerektirmediğini denetler.
  ///
  /// Eğer [currentVersion] < [minSupportedVersion] ise `true` döner (Kullanıcı güncellemeye zorlanır).
  bool isForceUpdateRequired(String currentVersion) {
    return _compareVersions(currentVersion, minSupportedVersion) < 0;
  }

  /// Mevcut uygulama sürümünün yeni bir opsiyonel güncellemesi olup olmadığını denetler.
  bool hasOptionalUpdate(String currentVersion) {
    return _compareVersions(currentVersion, latestVersion) < 0 &&
        !isForceUpdateRequired(currentVersion);
  }

  /// Semantik sürüm karşılaştırıcı (örn. "1.0.2" vs "1.1.0").
  ///
  /// - `v1 < v2` ise `-1`
  /// - `v1 == v2` ise `0`
  /// - `v1 > v2` ise `1` döner.
  static int _compareVersions(String v1, String v2) {
    // "+build" eklerini temizle (örn: "1.0.0+1" -> "1.0.0")
    final clean1 = v1.split('+').first.trim();
    final clean2 = v2.split('+').first.trim();

    final parts1 = clean1.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final parts2 = clean2.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    final length = parts1.length > parts2.length
        ? parts1.length
        : parts2.length;

    for (var i = 0; i < length; i++) {
      final p1 = i < parts1.length ? parts1[i] : 0;
      final p2 = i < parts2.length ? parts2[i] : 0;

      if (p1 < p2) return -1;
      if (p1 > p2) return 1;
    }

    return 0;
  }
}
