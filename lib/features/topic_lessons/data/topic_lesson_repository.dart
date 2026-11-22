import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';

/// Uzak veri kaynağından (`public.topic_lesson_units`) konu anlatımı bölümlerini
/// çeken test edilebilir fonksiyon imzası.
typedef TopicLessonUnitsRemoteFetcher =
    Future<List<Map<String, dynamic>>> Function({
      required String lesson,
      required String topic,
    });

/// Konu anlatımı bölümlerini (`public.topic_lesson_units`) Supabase ve yerel
/// önbellekten yöneten repository (`TASK-168`).
///
/// Angular/Web Karşılığı: `TopicLessonService` — widget katmanını doğrudan
/// Supabase veya JSON çağrılarından soyutlar.
class TopicLessonRepository {
  final LocalStorageService? _storageOverride;
  final TopicLessonUnitsRemoteFetcher? remoteFetcherOverride;

  LocalStorageService get _storage => _storageOverride ?? LocalStorageService();

  static final Map<String, (DateTime, List<TopicLessonUnit>)> _memoryCache = {};
  static const Duration _cacheTtl = Duration(minutes: 15);

  const TopicLessonRepository({
    LocalStorageService? storage,
    this.remoteFetcherOverride,
  }) : _storageOverride = storage;

  /// Test izolasyonu için bellek önbelleğini sıfırlar.
  @visibleForTesting
  static void clearMemoryCache() {
    _memoryCache.clear();
  }

  static String _cacheKey(String lesson, String topic) =>
      '${lesson.trim().toLowerCase()}::${topic.trim().toLowerCase()}';

  /// Verilen [lesson] ve [topic] için yayınlanmış (`is_published = true`)
  /// konu anlatımı bölümlerini `unit_order` sırasıyla döner.
  ///
  /// Öncelik sırası:
  /// 1. Bellek içi TTL önbelleği (`!forceRefresh` ise)
  /// 2. Supabase `public.topic_lesson_units` (veya [remoteFetcherOverride])
  /// 3. Yerel `SharedPreferences` önbelleği
  Future<List<TopicLessonUnit>> fetchUnits({
    required String lesson,
    required String topic,
    ExamSelection? selection,
    bool forceRefresh = false,
  }) async {
    final key = _cacheKey(lesson, topic);
    final now = DateTime.now();

    if (!forceRefresh && _memoryCache.containsKey(key)) {
      final cached = _memoryCache[key]!;
      if (now.difference(cached.$1) < _cacheTtl) {
        return _filterBySelection(cached.$2, selection);
      }
    }

    List<TopicLessonUnit>? units;

    try {
      final remoteRows = await _fetchRemoteRows(lesson: lesson, topic: topic);
      if (remoteRows.isNotEmpty) {
        final parsed =
            remoteRows
                .map(TopicLessonUnit.fromJson)
                .where((u) => u.id.isNotEmpty && u.isPublished)
                .toList()
              ..sort((a, b) => a.unitOrder.compareTo(b.unitOrder));
        if (parsed.isNotEmpty) {
          units = parsed;
          unawaited(_storage.saveTopicLessonUnitsCache(lesson, topic, parsed));
        }
      }
    } catch (e) {
      debugPrint(
        '[TopicLessonRepository] Uzak konu anlatımı okunamadı, yerel önbelleğe düşülüyor: $e',
      );
    }

    if (units == null || units.isEmpty) {
      final localCached = await _storage.loadTopicLessonUnitsCache(
        lesson,
        topic,
      );
      if (localCached.isNotEmpty) {
        units = localCached;
      }
    }

    units ??= const [];

    _memoryCache[key] = (now, units);
    return _filterBySelection(units, selection);
  }

  List<TopicLessonUnit> _filterBySelection(
    List<TopicLessonUnit> units,
    ExamSelection? selection,
  ) {
    if (selection == null || units.isEmpty) return units;
    final accepted = selection.acceptedQuestionScopes;
    final filtered = units.where((u) {
      if (u.examScopes.isEmpty) return true;
      return u.examScopes.any((s) => accepted.contains(s.trim().toLowerCase()));
    }).toList();
    return filtered;
  }

  Future<List<Map<String, dynamic>>> _fetchRemoteRows({
    required String lesson,
    required String topic,
  }) async {
    if (remoteFetcherOverride != null) {
      return await remoteFetcherOverride!(lesson: lesson, topic: topic);
    }
    final client = SupabaseConfig.clientOrNull;
    if (client == null) return const [];

    try {
      final response = await client
          .from('topic_lesson_units')
          .select()
          .eq('lesson', lesson)
          .eq('topic', topic)
          .eq('is_published', true)
          .order('unit_order', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('[TopicLessonRepository] Supabase sorgu hatası: $e');
      return const [];
    }
  }
}

/// Kullanıcının konu anlatımı bölüm ilerlemelerini (`public.user_topic_lesson_progress`)
/// yerel hafıza ve Supabase bulutuyla senkron yöneten repository (`TASK-168`).
class TopicLessonProgressRepository {
  static final Map<String, TopicLessonUnitProgress> _byUnitId = {};
  static final LocalStorageService _storage = LocalStorageService();
  static const CloudSyncRepository _cloudSync = CloudSyncRepository();

  const TopicLessonProgressRepository();

  /// Tüm kayıtlı ilerlemelerin anlık kopyasını döner.
  Map<String, TopicLessonUnitProgress> get allProgress =>
      Map<String, TopicLessonUnitProgress>.unmodifiable(_byUnitId);

  /// Belirli bir bölüm (`unitId`) için mevcut ilerlemeyi döner.
  TopicLessonUnitProgress? progressFor(String unitId) =>
      _byUnitId[unitId.trim()];

  /// Bölümün tamamlanıp tamamlanmadığını döner.
  bool isUnitCompleted(String unitId) =>
      progressFor(unitId)?.isCompleted ?? false;

  /// Bir konunun yayınlanmış bölümleri için tamamlanan bölüm sayısını döner.
  int completedCountForUnits(List<TopicLessonUnit> units) {
    var count = 0;
    for (final unit in units) {
      if (isUnitCompleted(unit.id)) {
        count += 1;
      }
    }
    return count;
  }

  /// Bir konunun yayınlanmış bölümleri için ilerleme yüzdesini (`0..100`) döner.
  int progressPercentForUnits(List<TopicLessonUnit> units) {
    final published = units.where((u) => u.isPublished).toList();
    return TopicLessonDomain.computeProgressPercent(
      completedCount: completedCountForUnits(published),
      totalPublishedCount: published.length,
    );
  }

  /// Bölüm açıldığında `last_opened_at` zaman damgasını günceller (tamamlanma durumunu korur).
  TopicLessonUnitProgress recordUnitOpened({
    required String unitId,
    String examScope = 'lisans_gygk',
    DateTime? now,
  }) {
    final trimmed = unitId.trim();
    final effectiveNow = (now ?? DateTime.now()).toUtc();
    final existing = _byUnitId[trimmed];
    final updated = TopicLessonUnitProgress(
      unitId: trimmed,
      examScope: examScope.trim().isEmpty ? 'lisans_gygk' : examScope.trim(),
      completedAt: existing?.completedAt,
      lastOpenedAt: effectiveNow,
    );
    _byUnitId[trimmed] = updated;
    unawaited(_storage.saveTopicLessonProgressMap(_byUnitId));
    unawaited(_cloudSync.upsertTopicLessonProgress(updated));
    return updated;
  }

  /// Kullanıcı "Bölümü Bitir"e bastığında bölümü tamamlandı olarak işaretler.
  TopicLessonUnitProgress markUnitCompleted({
    required String unitId,
    String examScope = 'lisans_gygk',
    DateTime? now,
  }) {
    final trimmed = unitId.trim();
    final effectiveNow = (now ?? DateTime.now()).toUtc();
    final existing = _byUnitId[trimmed];
    final updated = TopicLessonUnitProgress(
      unitId: trimmed,
      examScope: examScope.trim().isEmpty ? 'lisans_gygk' : examScope.trim(),
      completedAt: existing?.completedAt ?? effectiveNow,
      lastOpenedAt: effectiveNow,
    );
    _byUnitId[trimmed] = updated;
    unawaited(_storage.saveTopicLessonProgressMap(_byUnitId));
    unawaited(_cloudSync.upsertTopicLessonProgress(updated));
    return updated;
  }

  /// Yerel depodan kayıtlı ilerlemeleri yükler.
  Future<void> loadFromStorage() async {
    final loaded = await _storage.loadTopicLessonProgressMap();
    if (loaded.isNotEmpty) {
      _byUnitId.addAll(loaded);
    }
  }

  /// Giriş yapıldığında yerel misafir ilerlemesini buluta taşır ve buluttaki
  /// kayıtları yerel havuzla birleştirir.
  Future<void> hydrateFromCloud({CloudSyncRepository? cloudSync}) async {
    await loadFromStorage();
    final syncRepo = cloudSync ?? _cloudSync;
    final remoteList = await syncRepo.fetchTopicLessonProgress();
    final remoteByUnit = <String, TopicLessonUnitProgress>{
      for (final item in remoteList) item.unitId: item,
    };

    // Yerelde tamamlanmış ama bulutta olmayan (misafirde okunan) bölümleri buluta gönder
    for (final localEntry in _byUnitId.values) {
      final remote = remoteByUnit[localEntry.unitId];
      if (remote == null ||
          (localEntry.isCompleted && !remote.isCompleted) ||
          localEntry.lastOpenedAt.isAfter(remote.lastOpenedAt)) {
        unawaited(syncRepo.upsertTopicLessonProgress(localEntry));
      }
    }

    // Buluttaki kayıtları yerel havuzla birleştir (High-Water Mark: tamamlanmış olan kazanır)
    for (final remote in remoteList) {
      final local = _byUnitId[remote.unitId];
      if (local == null) {
        _byUnitId[remote.unitId] = remote;
      } else {
        final mergedCompletedAt = local.completedAt ?? remote.completedAt;
        final mergedLastOpened = remote.lastOpenedAt.isAfter(local.lastOpenedAt)
            ? remote.lastOpenedAt
            : local.lastOpenedAt;
        _byUnitId[remote.unitId] = local.copyWith(
          completedAt: mergedCompletedAt,
          lastOpenedAt: mergedLastOpened,
        );
      }
    }

    if (_byUnitId.isNotEmpty) {
      unawaited(_storage.saveTopicLessonProgressMap(_byUnitId));
    }
  }

  /// Oturum kapatıldığında bellekteki ilerleme haritasını temizler.
  void clearLocal() {
    _byUnitId.clear();
  }
}

/// Konu anlatımı ilerlemesini reaktif olarak UI'a sunan Riverpod Notifier.
class TopicLessonProgressNotifier
    extends Notifier<Map<String, TopicLessonUnitProgress>> {
  static const TopicLessonProgressRepository _repo =
      TopicLessonProgressRepository();

  @override
  Map<String, TopicLessonUnitProgress> build() {
    unawaited(_initFromStorage());
    return _repo.allProgress;
  }

  Future<void> _initFromStorage() async {
    await _repo.loadFromStorage();
    if (!ref.mounted) return;
    state = _repo.allProgress;
  }

  void recordOpened(String unitId, {String examScope = 'lisans_gygk'}) {
    _repo.recordUnitOpened(unitId: unitId, examScope: examScope);
    state = _repo.allProgress;
  }

  void markCompleted(String unitId, {String examScope = 'lisans_gygk'}) {
    _repo.markUnitCompleted(unitId: unitId, examScope: examScope);
    state = _repo.allProgress;
  }

  void refresh() {
    state = _repo.allProgress;
  }
}

/// [TopicLessonRepository] Riverpod sağlayıcısı.
final topicLessonRepositoryProvider = Provider<TopicLessonRepository>((ref) {
  return const TopicLessonRepository();
});

/// [TopicLessonProgressNotifier] Riverpod sağlayıcısı.
final topicLessonProgressProvider =
    NotifierProvider<
      TopicLessonProgressNotifier,
      Map<String, TopicLessonUnitProgress>
    >(TopicLessonProgressNotifier.new);

/// Belirli bir `(scopeKey, lessonName, topic)` üçlüsü için konu anlatımı sorgu anahtarı.
class TopicLessonQueryKey {
  final String scopeKey;
  final String lessonName;
  final String topic;

  const TopicLessonQueryKey({
    required this.scopeKey,
    required this.lessonName,
    required this.topic,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicLessonQueryKey &&
          other.scopeKey == scopeKey &&
          other.lessonName == lessonName &&
          other.topic == topic;

  @override
  int get hashCode => Object.hash(scopeKey, lessonName, topic);
}

/// Bir konunun yayınlanmış konu anlatımı bölümlerini getiren `FutureProvider.family`.
final topicLessonUnitsProvider =
    FutureProvider.family<List<TopicLessonUnit>, TopicLessonQueryKey>((
      ref,
      queryKey,
    ) async {
      final repo = ref.watch(topicLessonRepositoryProvider);
      return repo.fetchUnits(
        lesson: queryKey.lessonName,
        topic: queryKey.topic,
      );
    });
