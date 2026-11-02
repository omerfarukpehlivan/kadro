import 'dart:convert';

import 'package:flutter/foundation.dart';
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
  static const String _keyDownloadedPackages = 'kadro_downloaded_packages';
  static String _keyOfflinePackage(String packageId) =>
      'offline_pkg_$packageId';

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

  // --- 3. Yanlış Defteri (Mistakes) ---

  /// Yanlış defterindeki soruları yerel hafızaya kaydeder.
  Future<void> saveMistakes(List<Question> mistakes) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      final list = mistakes.map((q) => q.toJson()).toList();
      final jsonStr = jsonEncode(list);
      await prefs.setString(_keyMistakes, jsonStr);
    } catch (e) {
      debugPrint('saveMistakes hatası: $e');
    }
  }

  /// Cihazda kayıtlı yanlış defteri sorularını okur.
  Future<List<Question>> loadMistakes() async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return [];
      final jsonStr = prefs.getString(_keyMistakes);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final list = jsonDecode(jsonStr) as List;
        return list
            .map((item) => Question.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('loadMistakes hatası: $e');
    }
    return [];
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
  Future<List<Question>?> loadDownloadedPackage(String packageId) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return null;
      final jsonStr = prefs.getString(_keyOfflinePackage(packageId));
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

  /// İndirilen paketi cihaz hafızasından kaldırır.
  Future<void> removeDownloadedPackage(String packageId) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return;
      await prefs.remove(_keyOfflinePackage(packageId));
      final existingIds = (await getDownloadedPackageIds()).toSet();
      existingIds.remove(packageId);
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
  Future<bool> hasDownloadedPackage(String packageId) async {
    try {
      final prefs = await _getPrefs();
      if (prefs == null) return false;
      return prefs.containsKey(_keyOfflinePackage(packageId));
    } catch (e) {
      debugPrint('hasDownloadedPackage hatası: $e');
      return false;
    }
  }

  /// Test izolasyonu veya fabrika ayarlarına dönüş için tüm anahtarları temizler.
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
    } catch (e) {
      debugPrint('clearAll hatası: $e');
    }
  }
}
