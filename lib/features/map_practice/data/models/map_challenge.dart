import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map_models.dart';

/// Harita tabanlı pratik kategorileri.
///
/// Angular/Web benzetmesi: Bu enum, filtreleme ve kategori yönlendirmesi sağlayan
/// tip güvenli bir `MapChallengeCategory` sabitidir.
enum MapPracticeCategory {
  /// 81 İl Dilsiz Harita Bulmacası (Şehirlerin yerini haritada bulma)
  provinces(
    id: 'provinces',
    title: 'Dilsiz Harita (81 İl)',
    subtitle: 'Haritada parlayan illeri tanı veya istenen ili bul',
    iconName: 'mapPin',
    badgeText: '81 İl Refleksi',
  ),

  /// Tarım ve Hayvancılık Haritası
  agriculture(
    id: 'agriculture',
    title: 'Tarım & Hayvancılık',
    subtitle: 'Üretim lideri iller, mikroklima ve yetiştirilmeyen alanlar',
    iconName: 'wheat',
    badgeText: 'Üretim Havzaları',
  ),

  /// Madenler ve Enerji Kaynakları
  mines(
    id: 'mines',
    title: 'Madenler & Enerji',
    subtitle: 'Maden yatakları, rafineriler ve jeotermal/rüzgar santralleri',
    iconName: 'pickaxe',
    badgeText: 'Stratejik Yataklar',
  ),

  /// Fiziki Coğrafya (Platolar, Dağlar, Göller ve Ovalar)
  physical(
    id: 'physical',
    title: 'Plato, Dağ & Göller',
    subtitle: 'Horst-graben, karstik ve volkanik arazi haritaları',
    iconName: 'mountain',
    badgeText: 'Fiziki Harita',
  ),

  /// Sanayi, Ticaret, Ulaşım ve Limanlar
  industry(
    id: 'industry',
    title: 'Sanayi & Limanlar',
    subtitle: 'Hinterlandı dar/geniş limanlar, demir-çelik ve serbest bölgeler',
    iconName: 'factory',
    badgeText: 'Ticaret & Ulaşım',
  ),

  /// Tarih Haritası (Kurtuluş Savaşı Cepheleri, Kongreler, İlk Başkentler)
  history(
    id: 'history',
    title: 'Tarih Haritası',
    subtitle: 'Kurtuluş Savaşı cepheleri, kongre rotası ve kilit merkezler',
    iconName: 'scroll',
    badgeText: 'Millî Mücadele',
  ),

  /// Karışık KPSS Harita Maratonu
  marathon(
    id: 'marathon',
    title: 'Genel Harita Maratonu',
    subtitle: 'Tüm konulardan rastgele seçilen harita soruları',
    iconName: 'trophy',
    badgeText: 'Karışık Deneme',
  );

  final String id;
  final String title;
  final String subtitle;
  final String iconName;
  final String badgeText;

  const MapPracticeCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconName,
    required this.badgeText,
  });

  static MapPracticeCategory fromId(String id) {
    return MapPracticeCategory.values.firstWhere(
      (c) => c.id == id,
      orElse: () => MapPracticeCategory.provinces,
    );
  }
}

/// Harita etkileşim türü.
enum MapInteractionType {
  /// 1. Haritada Doğrudan İle Dokun (Örn: "Haritada Batman iline dokunun")
  tapProvince,

  /// 2. Parlayan İli veya İlleri Tanı (4 çoktan seçmeli buton üzerinden)
  identifyHighlighted,

  /// 3. Hangisi Hariç / İstisna İl? (Haritada 4 il işaretli, olmayana dokunulur veya seçilir)
  excludeTarget,

  /// 4. Romen Rakamlı İşaretçiye Dokun (I, II, III, IV, V)
  tapMarker,
}

/// Tek bir interaktif harita sorusu / pratik görevi modeli.
///
/// Angular/Web benzetmesi: Bu model, zengin SVG harita pratik görevini temsil eden
/// tip güvenli bir `MapChallengeDto` arayüzüdür.
class MapChallenge {
  final String id;
  final MapPracticeCategory category;
  final MapInteractionType interactionType;
  final int difficulty; // 1: Kolay, 2: Orta, 3: İleri
  final String title;
  final String questionText;

  /// Doğru cevap olarak hedeflenen il id'si (örn. 'adana', 'sanliurfa')
  final String targetProvinceId;

  /// Birden fazla ilin doğru kabul edildiği durumlar (örn. Doğu Karadeniz illerinden biri)
  final List<String> validProvinceIds;

  /// Haritada başlangıçta vurgulanacak il id'leri (örn. Ege'deki çöküntü ovaları)
  final List<String> highlightedProvinceIds;

  /// Vurgulanan illerin özel dolgu rengi (null ise tema vurgu rengi kullanılır)
  final Color? highlightColor;

  /// Harita üzerinde gösterilecek özel Romen rakamlı dairesel işaretçiler
  final List<TurkeyMapMarker> markers;

  /// Çoktan seçmeli modda adayların seçeceği seçenekler (4 şık)
  final List<String> options;

  /// Doğru seçeneğin indeksi (0..3)
  final int correctOptionIndex;

  /// Aday takıldığında gösterilecek akıllı ipucu
  final String hint;

  /// Soru sonrasında gösterilecek UWorld tarzı eğitici açıklama ve ÖSYM püf noktası
  final String explanation;

  /// ÖSYM Çeldirici Tuzağı analizi (varsa)
  final String? distractorTrap;

  /// Konu etiketi (örn: "Pamuk", "GAP", "Bor")
  final String tag;

  const MapChallenge({
    required this.id,
    required this.category,
    required this.interactionType,
    this.difficulty = 2,
    required this.title,
    required this.questionText,
    required this.targetProvinceId,
    this.validProvinceIds = const [],
    this.highlightedProvinceIds = const [],
    this.highlightColor,
    this.markers = const [],
    this.options = const [],
    this.correctOptionIndex = 0,
    required this.hint,
    required this.explanation,
    this.distractorTrap,
    required this.tag,
  });

  /// Kullanıcının dokunduğu ilin doğru olup olmadığını kontrol eder.
  bool isProvinceCorrect(String provinceId) {
    final normalized = provinceId.toLowerCase().trim();
    if (normalized == targetProvinceId.toLowerCase().trim()) return true;
    return validProvinceIds.any((id) => id.toLowerCase().trim() == normalized);
  }

  /// Kullanıcının seçtiği seçeneğin doğru olup olmadığını kontrol eder.
  bool isOptionCorrect(int optionIndex) {
    return optionIndex == correctOptionIndex;
  }

  /// JSON serileştirme desteği (Gelecekte Supabase veya REST API entegrasyonu için)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category.id,
      'interactionType': interactionType.name,
      'difficulty': difficulty,
      'title': title,
      'questionText': questionText,
      'targetProvinceId': targetProvinceId,
      'validProvinceIds': validProvinceIds,
      'highlightedProvinceIds': highlightedProvinceIds,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
      'hint': hint,
      'explanation': explanation,
      'distractorTrap': distractorTrap,
      'tag': tag,
    };
  }

  /// JSON'dan nesne üretme
  factory MapChallenge.fromJson(Map<String, dynamic> json) {
    return MapChallenge(
      id: json['id'] as String,
      category: MapPracticeCategory.fromId(json['category'] as String),
      interactionType: MapInteractionType.values.firstWhere(
        (t) => t.name == json['interactionType'],
        orElse: () => MapInteractionType.tapProvince,
      ),
      difficulty: json['difficulty'] as int? ?? 2,
      title: json['title'] as String,
      questionText: json['questionText'] as String,
      targetProvinceId: json['targetProvinceId'] as String,
      validProvinceIds:
          (json['validProvinceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      highlightedProvinceIds:
          (json['highlightedProvinceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      correctOptionIndex: json['correctOptionIndex'] as int? ?? 0,
      hint: json['hint'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
      distractorTrap: json['distractorTrap'] as String?,
      tag: json['tag'] as String? ?? 'Genel',
    );
  }
}
