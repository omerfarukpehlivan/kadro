import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/map_practice/data/map_practice_data.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';
import 'package:kadro/shared/widgets/workshop_scope_bridge_banner.dart';

/// Harita Pratik Deposu Soyut Arayüzü (Repository Pattern)
///
/// Angular/Web benzetmesi: Bu arayüz, harita sorularını yerel veri havuzundan
/// veya gelecekte Supabase REST API/PostgreSQL kaynağından soyutlayan `MapPracticeRepository` servisidir.
abstract class MapPracticeRepository {
  /// Seçili sınav türüne göre atanmış özel harita sorusu olup olmadığını döner.
  bool hasDedicatedChallengesFor(ExamSelection selection);

  /// Belirli bir kategoriye ait harita sorularını döner
  Future<List<MapChallenge>> getChallengesByCategory(
    MapPracticeCategory category, {
    int count = 10,
    ExamSelection? selection,
  });

  /// 81 il dilsiz harita antrenmanı için dinamik rastgele soru seti döner
  Future<List<MapChallenge>> getDynamicProvinceChallenges({
    int count = 10,
    MapInteractionType type = MapInteractionType.tapProvince,
    ExamSelection? selection,
  });

  /// Karışık harita maratonu döner (tüm kategorilerden dengeli soru)
  Future<List<MapChallenge>> getDailyMarathonChallenges({
    int count = 10,
    ExamSelection? selection,
  });

  /// ID ile tekil soru sorgular
  Future<MapChallenge?> getChallengeById(String id);
}

/// Yerel (Offline-First) Harita Deposu Uygulaması
class LocalMapPracticeRepository implements MapPracticeRepository {
  final List<MapChallenge> _predefined;

  LocalMapPracticeRepository({List<MapChallenge>? predefinedChallenges})
    : _predefined =
          predefinedChallenges ?? MapPracticeData.predefinedChallenges;

  WorkshopScopeResolution<MapChallenge> _resolvePredefined(
    ExamSelection? selection,
  ) {
    final target = selection ?? ExamSelection.initial;
    return WorkshopScopeResolution.resolve<MapChallenge>(
      selection: target,
      allItems: _predefined,
      matchesSelection: (c, s) => c.matchesSelection(s),
      matchesGkBridge: (c) =>
          c.matchesSelection(const ExamSelection.bGrubuLisans()),
    );
  }

  @override
  bool hasDedicatedChallengesFor(ExamSelection selection) {
    if (selection.isDefaultLisansGk) return true;
    return _predefined.any((c) => c.matchesSelection(selection));
  }

  bool _allowsDynamicProvincePool(
    ExamSelection target,
    WorkshopScopeResolution<MapChallenge> resolution,
  ) {
    return resolution.isUsingGkFallback ||
        !hasDedicatedChallengesFor(target) ||
        target.isDefaultLisansGk ||
        target.matchesContentMetadata(examScopes: const ['lisans_gk']);
  }

  @override
  Future<List<MapChallenge>> getChallengesByCategory(
    MapPracticeCategory category, {
    int count = 10,
    ExamSelection? selection,
  }) async {
    // 1. Dilsiz harita kategorisi ise dinamik 81 il soruları üret
    if (category == MapPracticeCategory.provinces) {
      return getDynamicProvinceChallenges(count: count, selection: selection);
    }

    // 2. Maraton kategorisi ise tüm konulardan karma getir
    if (category == MapPracticeCategory.marathon) {
      return getDailyMarathonChallenges(count: count, selection: selection);
    }

    // 3. Önceden hazırlanmış uzman KPSS sorularından kapsam + kategoriye göre filtrele
    final target = selection ?? ExamSelection.initial;
    final resolution = _resolvePredefined(target);
    final filtered = resolution.items
        .where((c) => c.category == category)
        .toList();
    if (filtered.isEmpty) {
      if (!_allowsDynamicProvincePool(target, resolution)) {
        return const <MapChallenge>[];
      }
      // Eğer kategoride soru az ise dinamik sorularla destekle
      return getDynamicProvinceChallenges(count: count, selection: target);
    }

    filtered.shuffle();
    return filtered.take(count).toList();
  }

  @override
  Future<List<MapChallenge>> getDynamicProvinceChallenges({
    int count = 10,
    MapInteractionType type = MapInteractionType.tapProvince,
    ExamSelection? selection,
  }) async {
    return MapPracticeData.generateDynamicProvinceChallenges(
      count: count,
      type: type,
    );
  }

  @override
  Future<List<MapChallenge>> getDailyMarathonChallenges({
    int count = 10,
    ExamSelection? selection,
  }) async {
    final target = selection ?? ExamSelection.initial;
    final resolution = _resolvePredefined(target);
    final list = <MapChallenge>[...resolution.items];
    // Özel kapsamlı ve GK dışı sınavlarda (ör. DHBT / ÖABT özel havuzu) GK il havuzunu karıştırma
    if (_allowsDynamicProvincePool(target, resolution)) {
      list.addAll(
        MapPracticeData.generateDynamicProvinceChallenges(
          count: 5,
          type: MapInteractionType.tapProvince,
        ),
      );
    }
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
