import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/current_affairs/data/models/current_affairs_bulletin.dart';
import 'package:kadro/features/current_affairs/data/sample_current_affairs.dart';

/// Uzak veri kaynağından (`public.current_affairs_bulletins`) satır listesi döndüren
/// test edilebilir fetcher fonksiyon imzası.
typedef CurrentAffairsRemoteFetcher =
    Future<List<Map<String, dynamic>>> Function();

/// Aylık Güncel Bilgiler bülteni verisini ve okuma/kaydetme durumunu yöneten repository (`TASK-160`).
///
/// Angular'daki `CurrentAffairsService` + `BehaviorSubject`/TTL önbellek katmanının karşılığıdır:
/// widget'lar doğrudan Supabase/JSON ayrıştırması yapmaz, yalnızca bu repository ile konuşur.
class CurrentAffairsRepository {
  final LocalStorageService? _storageServiceOverride;
  final CurrentAffairsRemoteFetcher? remoteFetcherOverride;

  LocalStorageService get storageService =>
      _storageServiceOverride ?? LocalStorageService();

  /// Bellek içi (RAM) TTL önbelleği.
  static List<CurrentAffairsBulletin>? _cachedBulletins;
  static DateTime? _cacheTimestamp;
  static const Duration _cacheTtl = Duration(minutes: 15);

  const CurrentAffairsRepository({
    LocalStorageService? storageService,
    this.remoteFetcherOverride,
  }) : _storageServiceOverride = storageService;

  /// Test izolasyonu için bellek önbelleğini sıfırlar.
  @visibleForTesting
  static void clearMemoryCache() {
    _cachedBulletins = null;
    _cacheTimestamp = null;
  }

  /// Aylık bülten listesini döndürür.
  ///
  /// Uzak Supabase tablosu (`current_affairs_bulletins`) aktif satırlar döndürürse
  /// bunları yerel çekirdek arşivle birleştirir; çevrimdışı durumda yerel veriye düşer.
  Future<List<CurrentAffairsBulletin>> fetchBulletins({
    bool forceRefresh = false,
  }) async {
    final now = DateTime.now();
    if (!forceRefresh &&
        _cachedBulletins != null &&
        _cacheTimestamp != null &&
        now.difference(_cacheTimestamp!) < _cacheTtl) {
      return _cachedBulletins!;
    }

    var bulletins = List<CurrentAffairsBulletin>.from(
      sampleCurrentAffairsBulletins,
    );

    try {
      final remoteRows = await _fetchRemoteRows();
      if (remoteRows.isNotEmpty) {
        final remoteItems = remoteRows
            .map(CurrentAffairsItem.fromJson)
            .where((item) => item.id.isNotEmpty && item.yearMonth.isNotEmpty)
            .toList();
        if (remoteItems.isNotEmpty) {
          bulletins = mergeBulletins(
            baseBulletins: bulletins,
            remoteItems: remoteItems,
          );
        }
      }
    } catch (e) {
      debugPrint(
        '[CurrentAffairsRepository] Uzak bülten okunamadı, yerel arşiv kullanılıyor: $e',
      );
    }

    bulletins.sort((a, b) => a.yearMonth.compareTo(b.yearMonth));
    _cachedBulletins = bulletins;
    _cacheTimestamp = now;
    return bulletins;
  }

  Future<List<Map<String, dynamic>>> _fetchRemoteRows() async {
    if (remoteFetcherOverride != null) {
      return await remoteFetcherOverride!();
    }
    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      return const [];
    }
    try {
      final response = await client
          .from('current_affairs_bulletins')
          .select()
          .eq('is_active', true)
          .order('year_month', ascending: true)
          .order('order_index', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('[CurrentAffairsRepository] Supabase sorgu hatası: $e');
      return const [];
    }
  }

  /// Yerel başlangıç bültenlerini uzak `CurrentAffairsItem` satırlarıyla id bazlı birleştirir.
  @visibleForTesting
  static List<CurrentAffairsBulletin> mergeBulletins({
    required List<CurrentAffairsBulletin> baseBulletins,
    required List<CurrentAffairsItem> remoteItems,
  }) {
    final byMonth = <String, _MutableMonthGroup>{};

    for (final bulletin in baseBulletins) {
      byMonth[bulletin.yearMonth] = _MutableMonthGroup(
        yearMonth: bulletin.yearMonth,
        monthTitle: bulletin.monthTitle,
        subtitle: bulletin.subtitle,
        itemsById: {for (final item in bulletin.items) item.id: item},
      );
    }

    for (final item in remoteItems) {
      final existing = byMonth[item.yearMonth];
      if (existing != null) {
        existing.itemsById[item.id] = item;
        if (item.monthTitle.isNotEmpty && existing.monthTitle.isEmpty) {
          existing.monthTitle = item.monthTitle;
        }
      } else {
        byMonth[item.yearMonth] = _MutableMonthGroup(
          yearMonth: item.yearMonth,
          monthTitle: item.monthTitle.isEmpty
              ? item.yearMonth
              : item.monthTitle,
          subtitle: 'Güncel bülten akışı ve ÖSYM soru potansiyeli notları',
          itemsById: {item.id: item},
        );
      }
    }

    final result = byMonth.values.map((group) {
      final items = group.itemsById.values.toList()
        ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
      return CurrentAffairsBulletin(
        yearMonth: group.yearMonth,
        monthTitle: group.monthTitle,
        subtitle: group.subtitle,
        items: items,
      );
    }).toList()..sort((a, b) => a.yearMonth.compareTo(b.yearMonth));

    return result;
  }

  /// Seçili bülteni sınav kapsamına ve filtrelere göre süzer.
  List<CurrentAffairsItem> filterItems(
    CurrentAffairsBulletin bulletin, {
    String? examScope,
    CurrentAffairsCategory? category,
    bool bookmarkedOnly = false,
    Set<String> bookmarkedIds = const {},
  }) {
    final normalizedScope = examScope?.trim().toLowerCase();
    return bulletin
        .filteredItems(
          category: category,
          bookmarkedOnly: bookmarkedOnly,
          bookmarkedIds: bookmarkedIds,
        )
        .where((item) {
          if (normalizedScope == null ||
              normalizedScope.isEmpty ||
              item.examScopes.isEmpty) {
            return true;
          }
          // Güncel Bilgiler tüm ilgili kapsamlar + doğrudan inceleyen adaylar için
          // ortak erişime açıktır; ancak daraltılmış özel bültenlerde kapsam eşleşir.
          return item.examScopes.any(
                (s) => s.toLowerCase() == normalizedScope,
              ) ||
              item.examScopes.contains('lisans_gk');
        })
        .toList();
  }

  /// Okunan güncel bülten madde kimliklerini yerelden yükler.
  Future<Set<String>> loadReadIds() =>
      storageService.loadCurrentAffairsReadIds();

  /// Kaydedilen (bookmark) güncel bülten madde kimliklerini yerelden yükler.
  Future<Set<String>> loadBookmarkedIds() =>
      storageService.loadCurrentAffairsBookmarkedIds();

  /// Verilen bülten maddesinin "Okundu" durumunu tersine çevirir ve kalıcı kaydeder.
  Future<Set<String>> toggleRead(
    String itemId, {
    Set<String>? currentIds,
  }) async {
    final next = Set<String>.from(currentIds ?? await loadReadIds());
    if (!next.add(itemId)) {
      next.remove(itemId);
    }
    await storageService.saveCurrentAffairsReadIds(next);
    return next;
  }

  /// Verilen bülten maddesinin "Kaydet" (bookmark) durumunu tersine çevirir ve kalıcı kaydeder.
  Future<Set<String>> toggleBookmark(
    String itemId, {
    Set<String>? currentIds,
  }) async {
    final next = Set<String>.from(currentIds ?? await loadBookmarkedIds());
    if (!next.add(itemId)) {
      next.remove(itemId);
    }
    await storageService.saveCurrentAffairsBookmarkedIds(next);
    return next;
  }
}

class _MutableMonthGroup {
  final String yearMonth;
  String monthTitle;
  final String subtitle;
  final Map<String, CurrentAffairsItem> itemsById;

  _MutableMonthGroup({
    required this.yearMonth,
    required this.monthTitle,
    required this.subtitle,
    required this.itemsById,
  });
}
