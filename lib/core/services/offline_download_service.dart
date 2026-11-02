import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Kadro PRO üyeliği gerektiren bir eylem ücretsiz kullanıcı tarafından çağrıldığında fırlatılan özel istisna.
///
/// Angular/Web Karşılığı: `HttpInterceptor` veya `RouteGuard` tarafındaki `403 Forbidden` / `PaymentRequiredException`.
class ProRequiredException implements Exception {
  final String message;

  const ProRequiredException([
    this.message = 'Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
  ]);

  @override
  String toString() => 'ProRequiredException: $message';
}

/// Soru ve deneme sınav paketlerini çevrimdışı (offline) kullanım için yerel hafızaya
/// indiren, sorgulayan ve yöneten servis katmanı.
///
/// Web/Angular Karşılığı: PWA Service Worker / CacheStorage / IndexedDB veri senkronizasyon servisi.
class OfflineDownloadService {
  final LocalStorageService _storage;
  bool isOnline;

  OfflineDownloadService({LocalStorageService? storage, this.isOnline = true})
    : _storage = storage ?? LocalStorageService();

  /// Belirtilen paketin cihaza indirilip indirilmediğini kontrol eder.
  Future<bool> isPackageDownloaded(String packageId) {
    return _storage.hasDownloadedPackage(packageId);
  }

  /// Soru paketini cihaz hafızasına indirir.
  ///
  /// Kullanıcı PRO değilse (`!isPro`) [ProRequiredException] fırlatır.
  Future<void> downloadPackage({
    required String packageId,
    required List<Question> questions,
    required bool isPro,
  }) async {
    if (!isPro) {
      throw const ProRequiredException();
    }
    await _storage.saveDownloadedPackage(packageId, questions);
  }

  /// Cihaza indirilmiş soru paketini döner. İndirilmemişse `null` döner.
  Future<List<Question>?> getDownloadedQuestions(String packageId) {
    return _storage.loadDownloadedPackage(packageId);
  }

  /// İndirilmiş soru paketini cihazdan siler.
  Future<void> removeDownloadedPackage(String packageId) {
    return _storage.removeDownloadedPackage(packageId);
  }

  /// Cihazda bulunan tüm indirilmiş paketlerin kimlik (ID) listesini döner.
  Future<List<String>> getDownloadedPackageIds() {
    return _storage.getDownloadedPackageIds();
  }
}

/// İndirilen paket kimliklerini (ID) reaktif olarak dinleyen ve UI'ı güncelleyen Riverpod Notifier'ı.
class DownloadedPackagesNotifier extends Notifier<Set<String>> {
  late final OfflineDownloadService _service;

  @override
  Set<String> build() {
    _service = ref.watch(offlineDownloadServiceProvider);
    unawaited(_loadDownloadedPackages());
    return <String>{};
  }

  /// Cihazdaki indirilmiş paketleri hafızaya yükler.
  Future<void> _loadDownloadedPackages() async {
    final ids = await _service.getDownloadedPackageIds();
    state = ids.toSet();
  }

  /// Bir paketi Kadro PRO kontrolü ile indirir veya günceller.
  Future<void> downloadPackage({
    required String packageId,
    required List<Question> questions,
    required bool isPro,
  }) async {
    await _service.downloadPackage(
      packageId: packageId,
      questions: questions,
      isPro: isPro,
    );
    state = <String>{...state, packageId};
  }

  /// İndirilmiş paketi yerel hafızadan kaldırır.
  Future<void> removePackage(String packageId) async {
    await _service.removeDownloadedPackage(packageId);
    state = <String>{...state}..remove(packageId);
  }
}

/// Çevrimiçi/Çevrimdışı ağ bağlantı durumunu yöneten Riverpod Notifier'ı.
class OnlineStatusNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  /// Bağlantı durumunu ayarlar.
  void setOnline(bool value) => state = value;
}

/// [OfflineDownloadService] tekil sağlayıcısı.
final offlineDownloadServiceProvider = Provider<OfflineDownloadService>((ref) {
  return OfflineDownloadService();
});

/// İndirilmiş paket setini (`Set<String>`) reaktif olarak sunan provider.
final downloadedPackagesProvider =
    NotifierProvider<DownloadedPackagesNotifier, Set<String>>(
      DownloadedPackagesNotifier.new,
    );

/// Çevrimiçi/Çevrimdışı bağlantı provider'ı (Varsayılan: true).
final isOnlineProvider = NotifierProvider<OnlineStatusNotifier, bool>(
  OnlineStatusNotifier.new,
);
