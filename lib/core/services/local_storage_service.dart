import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kadro/features/flashcards/data/models/flashcard_review_progress.dart';
import 'package:kadro/features/mistakes/data/models/mistake_review_entry.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Misafir modunda ve çevrimdışıyken bile verilerin cihazda kalıcı olarak saklanmasını sağlayan servis.
///
/// Angular'daki `localStorage` veya `Ionic Storage` sarmalayıcısının karşılığıdır.
/// [SharedPreferences] kullanarak JSON formatında yerel depolama yapar.
class LocalStorageService {
  static const String _keyUserPreferences = 'kadro_user_preferences';
  static const String _keyStudyStats = 'kadro_study_stats';
  static const String _keyMistakes = 'kadro_mistakes';
  static const String _keyStudyTasks = 'kadro_study_tasks';
  static const String _keyPlannerCycleDay = 'kadro_planner_cycle_day';
  static const String _keyPlannerMaxUnlockedDay =
      'kadro_planner_max_unlocked_day';
  static String _keyPlannerDayTasks(int day) => 'kadro_planner_day_tasks_$day';
  static const String _keyPlannerSnapshot = 'kadro_planner_snapshot';
  static String _keyAccountPlannerSnapshot(String accountKey) =>
      'kadro_planner_snapshot_${accountKey.trim().toLowerCase()}';
  static String _keyAccountUserPrefs(String accountKey) =>
      'kadro_user_prefs_${accountKey.trim().toLowerCase()}';
  static String _keyFlashcardReviews(String scopeNamespace) =>
      'kadro_flashcard_reviews_${scopeNamespace.trim().toLowerCase()}';
  static const String _keyCurrentAffairsReadIds =
      'kadro_current_affairs_read_ids';
  static const String _keyCurrentAffairsBookmarkedIds =
      'kadro_current_affairs_bookmarked_ids';
  static const String _keyDownloadedPackages = 'kadro_downloaded_packages';
  static String _keyOfflinePackage(String packageId) =>
      'offline_pkg_$packageId';

  /// Çoklu KPSS & MEB-AGS kapsamları arasındaki ad uzayı çakışmasını önleyen
  /// kanonik çevrimdışı konu paket kimliği üreticisi.
  ///
  /// Web/Angular Karşılığı: IndexedDB cache key factory (`CacheKeyFactory.topic(...)`).
  static String topicPackageId({
    required String scopeNamespace,
    required String lesson,
    required String topic,
  }) => 'topic_${scopeNamespace}_${lesson}_$topic';

  /// Eski `lisans_gk` sürümündeki `topic_<ders>_<konu>` paket anahtarını döner.
  /// Diğer sınav kapsamları için `null` dönerek veri sızıntısını önler.
  static String? legacyTopicPackageIdIfApplicable({
    required String scopeNamespace,
    required String lesson,
    required String topic,
  }) {
    if (scopeNamespace != 'lisans_gk') return null;
    return 'topic_${lesson}_$topic';
  }

  static String? _deriveLegacyLisansGkPackageId(String packageId) {
    const prefix = 'topic_lisans_gk_';
    if (!packageId.startsWith(prefix)) return null;
    final remainder = packageId.substring(prefix.length);
    if (remainder.isEmpty) return null;
    return 'topic_$remainder';
  }

  static String? _resolveExistingPackageStorageKey(
    SharedPreferences prefs,
    String packageId,
  ) {
    final primaryKey = _keyOfflinePackage(packageId);
    final rawPrimary = prefs.getString(primaryKey);
    if (rawPrimary != null && rawPrimary.isNotEmpty) {
      return primaryKey;
    }
    final legacyId = _deriveLegacyLisansGkPackageId(packageId);
    if (legacyId != null) {
      final legacyKey = _keyOfflinePackage(legacyId);
      final rawLegacy = prefs.getString(legacyKey);
      if (rawLegacy != null && rawLegacy.isNotEmpty) {
        return legacyKey;
      }
    }
    return null;
  }

  SharedPreferences? _prefs;

  LocalStorageService({SharedPreferences? prefs}) {
    _prefs = prefs;
  }

  Future<SharedPreferences?> _getPrefs() async {
    if (_prefs != null) return _prefs;
    try {
      _prefs = await SharedPreferences.getInstance();
      return _prefs;
    } catch (e) {
      debugPrint('SharedPreferences alma hatası: $e');
      return null;
    }
  }

  // --- 1. Kullanıcı Tercihleri (UserPreferences) ---

  /// Kullanıcı tercihlerini (PRO, tema, soru hedefi vb.) yerel hafızaya kaydeder.
  Future<void> saveUserPreferences(UserPreferencesState state) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final jsonStr = jsonEncode(state.toJson());
      await prefs.setString(_keyUserPreferences, jsonStr);
    } catch (e) {
      debugPrint('saveUserPreferences hatası: $e');
    }
  }

  /// Cihazda kayıtlı kullanıcı tercihlerini okur. Bulunamazsa `null` döner.
  Future<UserPreferencesState?> loadUserPreferences() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyUserPreferences);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        return UserPreferencesState.fromJson(map);
      }
    } catch (e) {
      debugPrint('loadUserPreferences hatası: $e');
    }
    return null;
  }

  // --- 2. Çalışma İstatistikleri & XP (StudyStats) ---

  /// İstatistik ve XP durumunu yerel hafızaya kaydeder.
  Future<void> saveStudyStats(StudyStatsState state) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final jsonStr = jsonEncode(state.toJson());
      await prefs.setString(_keyStudyStats, jsonStr);
    } catch (e) {
      debugPrint('saveStudyStats hatası: $e');
    }
  }

  /// Cihazda kayıtlı çalışma istatistiklerini okur. Bulunamazsa `null` döner.
  Future<StudyStatsState?> loadStudyStats() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyStudyStats);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        return StudyStatsState.fromJson(map);
      }
    } catch (e) {
      debugPrint('loadStudyStats hatası: $e');
    }
    return null;
  }

  // --- 3. Yanlış Defteri & Leitner Aralıklı Tekrar (Mistakes & Flashcards) ---

  /// Yanlış defterindeki soruları Leitner kutu ve vade meta verileriyle kaydeder.
  Future<void> saveMistakeEntries(List<MistakeReviewEntry> entries) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final list = entries.map((e) => e.toJson()).toList();
      final jsonStr = jsonEncode(list);
      await prefs.setString(_keyMistakes, jsonStr);
    } catch (e) {
      debugPrint('saveMistakeEntries hatası: $e');
    }
  }

  /// Cihazda kayıtlı yanlış defteri Leitner kayıtlarını (eski düz `Question`
  /// JSON listesiyle geriye dönük uyumlu şekilde) okur.
  Future<List<MistakeReviewEntry>> loadMistakeEntries() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return [];
      final jsonStr = prefs.getString(_keyMistakes);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final list = jsonDecode(jsonStr) as List;
        return list
            .whereType<Map<String, dynamic>>()
            .map(MistakeReviewEntry.fromJson)
            .toList();
      }
    } catch (e) {
      debugPrint('loadMistakeEntries hatası: $e');
    }
    return [];
  }

  /// Geriye dönük uyumlu düz soru kaydı: her soruyu Kutu 1 Leitner kaydı olarak saklar.
  Future<void> saveMistakes(List<Question> mistakes) async {
    final now = DateTime.now();
    await saveMistakeEntries(
      mistakes
          .map((q) => MistakeReviewEntry.initial(question: q, now: now))
          .toList(),
    );
  }

  /// Cihazda kayıtlı yanlış defteri sorularını okur.
  Future<List<Question>> loadMistakes() async {
    final entries = await loadMistakeEntries();
    return entries.map((e) => e.question).toList();
  }

  /// Seçili sınav kapsamındaki bilgi kartı Leitner ilerlemelerini kaydeder.
  Future<void> saveFlashcardReviews(
    String scopeNamespace,
    Map<String, FlashcardReviewProgress> reviews,
  ) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final list = reviews.values.map((r) => r.toJson()).toList();
      await prefs.setString(
        _keyFlashcardReviews(scopeNamespace),
        jsonEncode(list),
      );
    } catch (e) {
      debugPrint('saveFlashcardReviews hatası: $e');
    }
  }

  /// Seçili sınav kapsamındaki bilgi kartı Leitner ilerlemelerini okur.
  Future<Map<String, FlashcardReviewProgress>> loadFlashcardReviews(
    String scopeNamespace,
  ) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return {};
      final raw = prefs.getString(_keyFlashcardReviews(scopeNamespace));
      if (raw != null && raw.isNotEmpty) {
        final list = jsonDecode(raw) as List;
        final result = <String, FlashcardReviewProgress>{};
        for (final item in list.whereType<Map<String, dynamic>>()) {
          final parsed = FlashcardReviewProgress.fromJson(item);
          if (parsed.cardId.isNotEmpty) {
            result[parsed.cardId] = parsed;
          }
        }
        return result;
      }
    } catch (e) {
      debugPrint('loadFlashcardReviews hatası: $e');
    }
    return {};
  }

  // --- 4. Çalışma Planlayıcı Görevleri (StudyTasks) ---

  /// Çalışma planlayıcıdaki görevleri yerel hafızaya kaydeder.
  Future<void> saveStudyTasks(List<StudyTask> tasks) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final list = tasks.map((t) => t.toJson()).toList();
      final jsonStr = jsonEncode(list);
      await prefs.setString(_keyStudyTasks, jsonStr);
    } catch (e) {
      debugPrint('saveStudyTasks hatası: $e');
    }
  }

  /// Cihazda kayıtlı çalışma planı görevlerini okur.
  Future<List<StudyTask>?> loadStudyTasks() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyStudyTasks);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final list = jsonDecode(jsonStr) as List;
        return list
            .map((item) => StudyTask.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('loadStudyTasks hatası: $e');
    }
    return null;
  }

  /// Çalışma planındaki mevcut gün/paket sırasını yerel hafızaya kaydeder.
  Future<void> savePlannerCycleDay(int cycleDay) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      await prefs.setInt(_keyPlannerCycleDay, cycleDay);
    } catch (e) {
      debugPrint('savePlannerCycleDay hatası: $e');
    }
  }

  /// Cihazda kayıtlı çalışma planı gün/paket sırasını okur.
  Future<int?> loadPlannerCycleDay() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      return prefs.getInt(_keyPlannerCycleDay);
    } catch (e) {
      debugPrint('loadPlannerCycleDay hatası: $e');
      return null;
    }
  }

  /// Çalışma planında kilidi açılmış en yüksek gün numarasını kaydeder.
  Future<void> savePlannerMaxUnlockedDay(int maxDay) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      await prefs.setInt(_keyPlannerMaxUnlockedDay, maxDay);
    } catch (e) {
      debugPrint('savePlannerMaxUnlockedDay hatası: $e');
    }
  }

  /// Çalışma planında kilidi açılmış en yüksek gün numarasını okur.
  Future<int?> loadPlannerMaxUnlockedDay() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      return prefs.getInt(_keyPlannerMaxUnlockedDay);
    } catch (e) {
      debugPrint('loadPlannerMaxUnlockedDay hatası: $e');
      return null;
    }
  }

  /// Belirli bir günün görev listesini ve tamamlama durumlarını gün bazında kaydeder.
  Future<void> savePlannerDayTasks(int cycleDay, List<StudyTask> tasks) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final list = tasks.map((t) => t.toJson()).toList();
      await prefs.setString(_keyPlannerDayTasks(cycleDay), jsonEncode(list));
    } catch (e) {
      debugPrint('savePlannerDayTasks hatası: $e');
    }
  }

  /// Belirli bir günün kaydedilmiş görev listesini okur.
  Future<List<StudyTask>?> loadPlannerDayTasks(int cycleDay) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyPlannerDayTasks(cycleDay));
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final list = jsonDecode(jsonStr) as List;
        return list
            .map((item) => StudyTask.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('loadPlannerDayTasks hatası: $e');
    }
    return null;
  }

  /// Çalışma planı senkronizasyon anlık görüntüsünü (snapshot) yerel hafızaya kaydeder.
  ///
  /// Belirtilmişse oturum açmış kullanıcı hesabına özel bir anahtarla da
  /// (`kadro_planner_snapshot_<accountKey>`) yedekler; böylece oturum kapatılıp açıldığında
  /// ilerleme kaybolmaz.
  ///
  /// Web/Angular Benzetmesi: `localStorage.setItem('user_planner_snapshot', ...)`
  Future<void> savePlannerSnapshot(
    PlannerSyncSnapshot snapshot, {
    String? accountKey,
  }) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final jsonStr = jsonEncode(snapshot.toJson());
      await prefs.setString(_keyPlannerSnapshot, jsonStr);
      if (accountKey != null && accountKey.trim().isNotEmpty) {
        await prefs.setString(_keyAccountPlannerSnapshot(accountKey), jsonStr);
      }
    } catch (e) {
      debugPrint('savePlannerSnapshot hatası: $e');
    }
  }

  /// Cihazda kayıtlı çalışma planı senkronizasyon görüntüsünü okur.
  ///
  /// [accountKey] verilmişse yalnızca o hesaba ait snapshot'ı okur;
  /// farklı bir oturumun genel cihaz önbelleğiyle karışmasını engeller.
  Future<PlannerSyncSnapshot?> loadPlannerSnapshot({String? accountKey}) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;

      String? jsonStr;
      if (accountKey != null && accountKey.trim().isNotEmpty) {
        jsonStr = prefs.getString(_keyAccountPlannerSnapshot(accountKey));
      } else {
        jsonStr = prefs.getString(_keyPlannerSnapshot);
      }

      if (jsonStr != null && jsonStr.isNotEmpty) {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        return PlannerSyncSnapshot.fromJson(map);
      }
    } catch (e) {
      debugPrint('loadPlannerSnapshot hatası: $e');
    }
    return null;
  }

  /// Oturum kapatıldığında genel cihaz planlayıcı önbelleğini (günlük görevler dahil) temizler.
  ///
  /// Hesaba özel (`kadro_planner_snapshot_<email>`) ve cihaz kota kayıtları korunur.
  Future<void> clearActivePlannerCache() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      await prefs.remove(_keyStudyTasks);
      await prefs.remove(_keyPlannerCycleDay);
      await prefs.remove(_keyPlannerMaxUnlockedDay);
      await prefs.remove(_keyPlannerSnapshot);

      final dayKeys = prefs
          .getKeys()
          .where((k) => k.startsWith('kadro_planner_day_tasks_'))
          .toList();
      for (final key in dayKeys) {
        await prefs.remove(key);
      }
    } catch (e) {
      debugPrint('clearActivePlannerCache hatası: $e');
    }
  }

  /// Hesap bazlı kullanıcı tercihlerini kaydeder.
  Future<void> saveAccountUserPreferences(
    String accountKey,
    UserPreferencesState state,
  ) async {
    if (accountKey.trim().isEmpty) return;
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final jsonStr = jsonEncode(state.toJson());
      await prefs.setString(_keyAccountUserPrefs(accountKey), jsonStr);
    } catch (e) {
      debugPrint('saveAccountUserPreferences hatası: $e');
    }
  }

  /// Hesap bazlı kaydedilmiş kullanıcı tercihlerini okur.
  Future<UserPreferencesState?> loadAccountUserPreferences(
    String accountKey,
  ) async {
    if (accountKey.trim().isEmpty) return null;
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyAccountUserPrefs(accountKey));
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        return UserPreferencesState.fromJson(map);
      }
    } catch (e) {
      debugPrint('loadAccountUserPreferences hatası: $e');
    }
    return null;
  }

  // --- 5. Çevrimdışı İndirilen Soru Paketleri (Offline Packages) ---

  /// Kadro PRO çevrimdışı paketini cihaz hafızasına kaydeder.
  Future<void> saveDownloadedPackage(
    String packageId,
    List<Question> questions,
  ) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final list = questions.map((q) => q.toJson()).toList();
      await prefs.setString(_keyOfflinePackage(packageId), jsonEncode(list));

      final existingIds = (await getDownloadedPackageIds()).toSet();
      existingIds.add(packageId);
      await prefs.setStringList(_keyDownloadedPackages, existingIds.toList());
    } catch (e) {
      debugPrint('saveDownloadedPackage hatası: $e');
    }
  }

  /// Cihazda saklanan çevrimdışı soru paketini okur. Bulunamazsa `null` döner.
  /// `lisans_gk` kapsamında eski `topic_<ders>_<konu>` anahtarlarını da geriye dönük destekler.
  Future<List<Question>?> loadDownloadedPackage(String packageId) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final storageKey = _resolveExistingPackageStorageKey(prefs, packageId);
      if (storageKey == null) return null;
      final jsonStr = prefs.getString(storageKey);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final list = jsonDecode(jsonStr) as List;
        return list
            .map((item) => Question.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('loadDownloadedPackage hatası: $e');
    }
    return null;
  }

  /// İndirilen paketi cihaz hafızasından kaldırır (varsa eski `lisans_gk` anahtarı dahil).
  Future<void> removeDownloadedPackage(String packageId) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      await prefs.remove(_keyOfflinePackage(packageId));
      final existingIds = (await getDownloadedPackageIds()).toSet();
      existingIds.remove(packageId);

      final legacyId = _deriveLegacyLisansGkPackageId(packageId);
      if (legacyId != null) {
        await prefs.remove(_keyOfflinePackage(legacyId));
        existingIds.remove(legacyId);
      }

      await prefs.setStringList(_keyDownloadedPackages, existingIds.toList());
    } catch (e) {
      debugPrint('removeDownloadedPackage hatası: $e');
    }
  }

  /// İndirilmiş tüm paket ID'lerini listeler.
  Future<List<String>> getDownloadedPackageIds() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return [];
      return prefs.getStringList(_keyDownloadedPackages) ?? [];
    } catch (e) {
      debugPrint('getDownloadedPackageIds hatası: $e');
      return [];
    }
  }

  /// Belirtilen paketin indirilip indirilmediğini kontrol eder.
  /// `lisans_gk` için eski sürüm `topic_<ders>_<konu>` yedeğini de tanır.
  Future<bool> hasDownloadedPackage(String packageId) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return false;
      return _resolveExistingPackageStorageKey(prefs, packageId) != null;
    } catch (e) {
      debugPrint('hasDownloadedPackage hatası: $e');
      return false;
    }
  }

  // --- 6. Hesap Bazlı İstatistikler & Cihaz Günlük Kota Koruması ---

  static String _keyAccountStudyStats(String accountKey) =>
      'kadro_study_stats_account_${accountKey.trim().toLowerCase()}';

  static const String _keyDeviceDailyQuota = 'kadro_device_daily_quota';

  /// Oturum kapansa bile geri dönebilmek için istatistikleri hesap bazlı yedekler.
  ///
  /// Angular'da hesap kimliğiyle anahtarlanmış kalıcı `localStorage` kaydına benzer.
  Future<void> saveAccountStudyStats(
    String accountKey,
    StudyStatsState state,
  ) async {
    final trimmed = accountKey.trim();
    if (trimmed.isEmpty) return;
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final jsonStr = jsonEncode(state.toJson());
      await prefs.setString(_keyAccountStudyStats(trimmed), jsonStr);
    } catch (e) {
      debugPrint('saveAccountStudyStats hatası: $e');
    }
  }

  /// Hesap bazlı yedeklenmiş çalışma istatistiklerini okur.
  Future<StudyStatsState?> loadAccountStudyStats(String accountKey) async {
    final trimmed = accountKey.trim();
    if (trimmed.isEmpty) return null;
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyAccountStudyStats(trimmed));
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        return StudyStatsState.fromJson(map);
      }
    } catch (e) {
      debugPrint('loadAccountStudyStats hatası: $e');
    }
    return null;
  }

  /// Aynı cihazda çıkış yapıp tekrar girilse bile günlük kotayı High-Water Mark (`max`) ile korur.
  ///
  /// Angular/Web'de oturum silinse dahi cihaz tarayıcı depolamasında tutulan günlük kullanım sayacına benzer.
  Future<void> saveDeviceDailyQuota({
    required String dateKey,
    required int solvedCount,
    required int freeLimit,
  }) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      var mergedSolved = solvedCount;
      var mergedLimit = freeLimit;

      final existingRaw = prefs.getString(_keyDeviceDailyQuota);
      if (existingRaw != null && existingRaw.isNotEmpty) {
        final existing = jsonDecode(existingRaw) as Map<String, dynamic>;
        if (existing['date'] == dateKey) {
          final existingSolved = (existing['solved'] as num?)?.toInt() ?? 0;
          final existingLimit = (existing['limit'] as num?)?.toInt() ?? 30;
          if (existingSolved > mergedSolved) mergedSolved = existingSolved;
          if (existingLimit > mergedLimit) mergedLimit = existingLimit;
        }
      }

      await prefs.setString(
        _keyDeviceDailyQuota,
        jsonEncode({
          'date': dateKey,
          'solved': mergedSolved,
          'limit': mergedLimit,
        }),
      );
    } catch (e) {
      debugPrint('saveDeviceDailyQuota hatası: $e');
    }
  }

  /// Cihazda kayıtlı günlük kota (`date`, `solved`, `limit`) verisini okur.
  Future<Map<String, dynamic>?> loadDeviceDailyQuota() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final raw = prefs.getString(_keyDeviceDailyQuota);
      if (raw != null && raw.isNotEmpty) {
        return jsonDecode(raw) as Map<String, dynamic>;
      }
    } catch (e) {
      debugPrint('loadDeviceDailyQuota hatası: $e');
    }
    return null;
  }

  // --- 7. Aylık Güncel Bilgiler Bülteni Okuma & Kaydetme (`TASK-160`) ---

  /// Verilen anahtar altında kullanıcıya ait kimlik kümesini JSON/StringList olarak saklar.
  Future<void> _saveStringIdSet(String key, Set<String> ids) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final normalized = ids.where((id) => id.trim().isNotEmpty).toList()
        ..sort();
      await prefs.setStringList(key, normalized);
    } catch (e) {
      debugPrint('_saveStringIdSet($key) hatası: $e');
    }
  }

  /// Verilen anahtardan kimlik kümesini güvenli şekilde yükler.
  Future<Set<String>> _loadStringIdSet(String key) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return <String>{};
      final list = prefs.getStringList(key);
      if (list == null) return <String>{};
      return list.where((id) => id.trim().isNotEmpty).toSet();
    } catch (e) {
      debugPrint('_loadStringIdSet($key) hatası: $e');
      return <String>{};
    }
  }

  /// Okundu olarak işaretlenen güncel bülten madde kimliklerini kaydeder.
  Future<void> saveCurrentAffairsReadIds(Set<String> ids) =>
      _saveStringIdSet(_keyCurrentAffairsReadIds, ids);

  /// Okundu olarak işaretlenen güncel bülten madde kimliklerini okur.
  Future<Set<String>> loadCurrentAffairsReadIds() =>
      _loadStringIdSet(_keyCurrentAffairsReadIds);

  /// Kaydedilen (bookmark) güncel bülten madde kimliklerini saklar.
  Future<void> saveCurrentAffairsBookmarkedIds(Set<String> ids) =>
      _saveStringIdSet(_keyCurrentAffairsBookmarkedIds, ids);

  /// Kaydedilen (bookmark) güncel bülten madde kimliklerini okur.
  Future<Set<String>> loadCurrentAffairsBookmarkedIds() =>
      _loadStringIdSet(_keyCurrentAffairsBookmarkedIds);

  /// Test izolasyonu veya fabrika ayarlarına dönüş için aktif oturum anahtarlarını temizler.
  /// Cihaz günlük kota sayacı (`kadro_device_daily_quota`) suistimali önlemek için korunur.
  Future<void> clearAll() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final ids = await getDownloadedPackageIds();
      for (final id in ids) {
        await prefs.remove(_keyOfflinePackage(id));
      }
      await prefs.remove(_keyDownloadedPackages);
      await prefs.remove(_keyUserPreferences);
      await prefs.remove(_keyStudyStats);
      await prefs.remove(_keyMistakes);
      await prefs.remove(_keyStudyTasks);
      await prefs.remove(_keyPlannerCycleDay);
      await prefs.remove(_keyPlannerMaxUnlockedDay);
      await prefs.remove(_keyPlannerSnapshot);
      await prefs.remove(_keyCurrentAffairsReadIds);
      await prefs.remove(_keyCurrentAffairsBookmarkedIds);
      final allKeys = prefs.getKeys();
      for (final key in allKeys) {
        if (key.startsWith('kadro_planner_day_tasks_') ||
            key.startsWith('kadro_planner_snapshot_') ||
            key.startsWith('kadro_user_prefs_') ||
            key.startsWith('kadro_study_stats_account_') ||
            key.startsWith('kadro_flashcard_reviews_')) {
          await prefs.remove(key);
        }
      }
    } catch (e) {
      debugPrint('clearAll hatası: $e');
    }
  }
}
