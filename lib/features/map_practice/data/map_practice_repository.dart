import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/map_practice/data/map_practice_data.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';

/// Harita Pratik Deposu Soyut Arayüzü (Repository Pattern)
///
/// Angular/Web benzetmesi: Bu arayüz, harita sorularını yerel veri havuzundan
/// veya gelecekte Supabase REST API/PostgreSQL kaynağından soyutlayan `MapPracticeRepository` servisidir.
abstract class MapPracticeRepository {
  /// Belirli bir kategoriye ait harita sorularını döner
  Future<List<MapChallenge>> getChallengesByCategory(
    MapPracticeCategory category, {
    int count = 10,
  });

  /// 81 il dilsiz harita antrenmanı için dinamik rastgele soru seti döner
  Future<List<MapChallenge>> getDynamicProvinceChallenges({
    int count = 10,
    MapInteractionType type = MapInteractionType.tapProvince,
  });

  /// Karışık harita maratonu döner (tüm kategorilerden dengeli soru)
  Future<List<MapChallenge>> getDailyMarathonChallenges({int count = 10});

  /// ID ile tekil soru sorgular
  Future<MapChallenge?> getChallengeById(String id);
}

/// Yerel (Offline-First) Harita Deposu Uygulaması
class LocalMapPracticeRepository implements MapPracticeRepository {
  final List<MapChallenge> _predefined = MapPracticeData.predefinedChallenges;

  @override
  Future<List<MapChallenge>> getChallengesByCategory(
    MapPracticeCategory category, {
    int count = 10,
  }) async {
    // 1. Dilsiz harita kategorisi ise dinamik 81 il soruları üret
    if (category == MapPracticeCategory.provinces) {
      return getDynamicProvinceChallenges(count: count);
    }

    // 2. Maraton kategorisi ise tüm konulardan karma getir
    if (category == MapPracticeCategory.marathon) {
      return getDailyMarathonChallenges(count: count);
    }

    // 3. Önceden hazırlanmış uzman KPSS sorularından filtrele
    final filtered = _predefined.where((c) => c.category == category).toList();
    if (filtered.isEmpty) {
      // Eğer kategoride soru az ise dinamik sorularla destekle
      return getDynamicProvinceChallenges(count: count);
    }

    filtered.shuffle();
    return filtered.take(count).toList();
  }

  @override
  Future<List<MapChallenge>> getDynamicProvinceChallenges({
    int count = 10,
    MapInteractionType type = MapInteractionType.tapProvince,
  }) async {
    return MapPracticeData.generateDynamicProvinceChallenges(
      count: count,
      type: type,
    );
  }

  @override
  Future<List<MapChallenge>> getDailyMarathonChallenges({
    int count = 10,
  }) async {
    final list = <MapChallenge>[..._predefined];
    // Yanına birkaç dinamik il sorusu da ekle
    list.addAll(
      MapPracticeData.generateDynamicProvinceChallenges(
        count: 5,
        type: MapInteractionType.tapProvince,
      ),
    );
    list.shuffle(Random());
    return list.take(count).toList();
  }

  @override
  Future<MapChallenge?> getChallengeById(String id) async {
    for (final c in _predefined) {
      if (c.id == id) return c;
    }
    return null;
  }
}

/// Riverpod Provider Tanımı (Faz 8 mimarisiyle tam uyumlu)
final mapPracticeRepositoryProvider = Provider<MapPracticeRepository>((ref) {
  return LocalMapPracticeRepository();
});
