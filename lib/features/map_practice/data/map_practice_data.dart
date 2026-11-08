import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map_data.dart';
import 'models/map_challenge.dart';

/// KPSS Coğrafya Harita Atölyesi Statik ve Dinamik Soru Havuzu
///
/// Angular/Web benzetmesi: Bu sınıf, hem önceden hazırlanmış uzman KPSS sorularını
/// sunan hem de 81 il üzerinden sonsuz pratik üreten bir `MapPracticeDataService` sağlayıcısıdır.
class MapPracticeData {
  MapPracticeData._();

  /// 1. Konu Bazlı Uzman KPSS Harita Soruları
  static const List<MapChallenge> predefinedChallenges = [
    // -------------------------------------------------------------------------
    // TARIM VE HAYVANCILIK
    // -------------------------------------------------------------------------
    MapChallenge(
      id: 'map_agr_01',
      category: MapPracticeCategory.agriculture,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 1,
      title: 'Pamuk Üretiminde Lider İl',
      questionText:
          'GAP projelerinin devreye girmesiyle birlikte Türkiye pamuk üretiminde Ege ve Çukurova\'yı geride bırakarak açık ara birinci sıraya yerleşen ilimize harita üzerinde dokunun.',
      targetProvinceId: 'sanliurfa',
      hint: 'Güneydoğu Anadolu\'da Suriye sınırına komşu olan ilimiz.',
      explanation:
          'Şanlıurfa, sulama imkanlarının artmasıyla (özellikle Harran Ovası) Türkiye pamuk üretiminin %40\'ından fazlasını tek başına karşılayarak açık ara birinci olmuştur.',
      distractorTrap:
          '⚠️ ÖSYM Çeldirici Tuzağı: Adaylar eski alışkanlıkla pamuğu hâlâ Adana (Çukurova) sanabilir; oysa liderlik yıllardır Şanlıurfa\'dadır.',
      tag: 'Pamuk & Sulama',
    ),
    MapChallenge(
      id: 'map_agr_02',
      category: MapPracticeCategory.agriculture,
      interactionType: MapInteractionType.identifyHighlighted,
      difficulty: 2,
      title: 'Kıl Keçisi ve Karstik Platolar',
      questionText:
          'Haritada vurgulanan Teke ve Taşeli platolarında engebeli ve makilik arazi yapısı nedeniyle yaygın olarak yapılan hayvancılık türü hangisidir?',
      targetProvinceId: 'antalya',
      validProvinceIds: ['antalya', 'mersin'],
      highlightedProvinceIds: ['antalya', 'mersin'],
      highlightColor: Color(0xFFD97706),
      options: [
        'Kıl Keçisi Yetiştiriciliği',
        'Büyükbaş Sığır Besiciliği',
        'İpek Böcekçiliği',
        'Tiftik Keçisi Yetiştiriciliği',
      ],
      correctOptionIndex: 0,
      hint: 'Maki çalıları ve sarp kayalık arazide çevik hareket eden hayvan türü.',
      explanation:
          'Akdeniz Bölgesi\'ndeki karstik Teke (Antalya) ve Taşeli (Mersin) platolarında makilik bitki örtüsü ve dağlık yapı nedeniyle Kıl Keçisi yetiştiriciliği 1. sıradadır.',
      distractorTrap:
          '⚠️ ÖSYM Çeldirici Tuzağı: Tiftik Keçisi (Angora) İç Anadolu\'da (Ankara çevresinde); Kıl Keçisi ise Akdeniz kalker platosunda yaygındır.',
      tag: 'Hayvancılık',
    ),
    MapChallenge(
      id: 'map_agr_03',
      category: MapPracticeCategory.agriculture,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 1,
      title: 'Fındık Üretiminde Türkiye Lideri',
      questionText:
          'Türkiye ve dünya fındık üretiminde en yüksek rekolteye sahip olan Doğu Karadeniz ilimize haritada dokunun.',
      targetProvinceId: 'ordu',
      validProvinceIds: ['ordu'],
      hint: 'Samsun ile Giresun arasında yer alan Karadeniz kıyı ilimiz.',
      explanation:
          'Ordu, yıllık fındık üretiminde Giresun ve Trabzon\'u geride bırakarak Türkiye\'nin açık ara 1. fındık üreticisi ilidir.',
      distractorTrap:
          '⚠️ ÖSYM Çeldirici Tuzağı: Fındık anavatanı olarak Giresun bilinse de toplam tonajda Ordu birinci sıradadır.',
      tag: 'Fındık',
    ),
    MapChallenge(
      id: 'map_agr_04',
      category: MapPracticeCategory.agriculture,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 2,
      title: 'Çay Tarımı ve Mikroklima',
      questionText:
          'Yıllık bol yağış ve asidik yıkanmış toprak ihtiyacı nedeniyle Türkiye çay üretiminin yaklaşık %65\'ini tek başına karşılayan ilimize dokunun.',
      targetProvinceId: 'rize',
      hint: 'Kaçkar Dağları\'nın eteklerinde, Doğu Karadeniz kıyısındaki ilimiz.',
      explanation:
          'Rize, her mevsim yağışlı ve nemli iklimi ile kireçsiz toprakları sayesinde Türkiye çay tarımının kalbidir.',
      tag: 'Çay',
    ),

    // -------------------------------------------------------------------------
    // MADENLER VE ENERJİ KAYNAKLARI
    // -------------------------------------------------------------------------
    MapChallenge(
      id: 'map_min_01',
      category: MapPracticeCategory.mines,
      interactionType: MapInteractionType.identifyHighlighted,
      difficulty: 2,
      title: 'Dünya Lideri Olduğumuz Stratejik Maden',
      questionText:
          'Haritada işaretlenen Balıkesir (Bigadiç), Kütahya (Emet), Eskişehir (Seyitgazi) ve Bursa havzalarında çıkarılan ve dünya rezervinin yaklaşık %73\'üne sahip olduğumuz maden hangisidir?',
      targetProvinceId: 'balikesir',
      highlightedProvinceIds: ['balikesir', 'kutahya', 'eskisehir', 'bursa'],
      highlightColor: Color(0xFF2563EB),
      options: ['Bor Mineralleri', 'Krom', 'Boksit (Alüminyum)', 'Linyit'],
      correctOptionIndex: 0,
      hint: 'Roket yakıtından cam ve deterjan sanayisine kadar kullanılan beyaz stratejik maden.',
      explanation:
          'Türkiye, dünya bor rezervlerinin yaklaşık %73\'üne sahiptir ve en zengin havzalar Güney Marmara ile İç Batı Anadolu\'da (Balıkesir, Kütahya, Eskişehir, Bursa) toplanmıştır.',
      tag: 'Bor',
    ),
    MapChallenge(
      id: 'map_min_02',
      category: MapPracticeCategory.mines,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 1,
      title: 'Taş Kömürü Havzası',
      questionText:
          'I. Jeolojik Zaman (Paleozoik) arazisi üzerinde oluşan, yüksek kaloriye sahip Taş Kömürü yataklarının bulunduğu ilimize haritada dokunun.',
      targetProvinceId: 'zonguldak',
      hint: 'Batı Karadeniz kıyısında, Karabük ve Bartın ile komşu olan maden şehrimiz.',
      explanation:
          'Taş kömürü sadece Zonguldak havzasında (Ereğli-Zonguldak-Amasra) çıkarılır ve demir-çelik sanayisinde yüksek ısı enerjisi sağlamak için kullanılır.',
      distractorTrap:
          '⚠️ ÖSYM Çeldirici Tuzağı: Linyit III. Jeolojik Zamanda oluştuğu için tüm Türkiye\'ye yayılmıştır; ancak Taş Kömürü yalnızca I. Zaman arazisi olan Zonguldak\'tadır.',
      tag: 'Taş Kömürü',
    ),
    MapChallenge(
      id: 'map_min_03',
      category: MapPracticeCategory.mines,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 1,
      title: 'Türkiye\'nin İlk Petrol Çıkarılan İli',
      questionText:
          '1940 yılında Raman Dağı\'nda petrolün keşfedildiği ve Türkiye\'nin en büyük petrol rafinerilerinden birine sahip olan ilimize dokunun.',
      targetProvinceId: 'batman',
      hint: 'Güneydoğu Anadolu\'da, Diyarbakır ve Siirt arasında yer alır.',
      explanation:
          'Türkiye\'de yerli petrolün ilk çıkarıldığı yer Batman (Raman Dağı) olup, ham petrolün işlendiği Batman Rafinerisi de hammaddeye yakın kurulmuştur.',
      tag: 'Petrol',
    ),
    MapChallenge(
      id: 'map_min_04',
      category: MapPracticeCategory.mines,
      interactionType: MapInteractionType.identifyHighlighted,
      difficulty: 2,
      title: 'Seydişehir Alüminyum Tesisleri',
      questionText:
          'Haritada vurgulanan Konya (Seydişehir) ve Antalya (Akseki) çevresinde çıkarılan ve Alüminyumun hammaddesi olan maden hangisidir?',
      targetProvinceId: 'konya',
      highlightedProvinceIds: ['konya', 'antalya'],
      highlightColor: Color(0xFF0D9488),
      options: ['Boksit', 'Bakır', 'Manganez', 'Demir'],
      correctOptionIndex: 0,
      hint: 'Hafifliğiyle uçak ve otomotiv sanayisinde kullanılan alüminyum cevheri.',
      explanation:
          'Boksit, alüminyumun hammaddesidir. Türkiye\'nin en önemli boksit çıkarma ve işleme merkezi Konya-Seydişehir ve Antalya-Akseki çevresidir.',
      tag: 'Boksit',
    ),

    // -------------------------------------------------------------------------
    // FİZİKİ COĞRAFYA (PLATOLAR, DAĞLAR VE GÖLLER)
    // -------------------------------------------------------------------------
    MapChallenge(
      id: 'map_phy_01',
      category: MapPracticeCategory.physical,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 2,
      title: 'Karstik Aşınım ve Obruk Platosu',
      questionText:
          'Tuz Gölü\'nün güneyinde yer alan, yer altı sularının kalkerli tabakaları eritmesiyle devasa obrukların oluştuğu ve rüzgar erozyonunun en şiddetli olduğu ilimize dokunun.',
      targetProvinceId: 'konya',
      hint: 'Türkiye\'nin yüz ölçümü en büyük olan ve tahıl ambarı olarak bilinen ilimiz.',
      explanation:
          'Obruk Platosu Konya sınırlarında yer alır. Karstik mağara tavanlarının çökmesiyle meşhur Kızören Obruğu gibi yüzlerce obruk bu platoda meydana gelmiştir.',
      tag: 'Obruk Platosu',
    ),
    MapChallenge(
      id: 'map_phy_02',
      category: MapPracticeCategory.physical,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 2,
      title: 'Volkanik Set Gölü ve Nemrut Kalderası',
      questionText:
          'Türkiye\'nin en büyük kapalı havzası ve soda rezervine sahip sodalı gölü olan Van Gölü\'nün batı kıyısında yer alan ve Nemrut Kalderası\'nı barındıran ilimize dokunun.',
      targetProvinceId: 'bitlis',
      hint: 'Van Gölü\'nün batısında yer alan ve Tatvan ilçesini sınırlarında bulunduran ilimiz.',
      explanation:
          'Nemrut Dağı\'nın patlamasıyla çıkan lavlar Van çanağının önünü kapatmış (volkanik set) ve Van Gölü oluşmuştur. Nemrut Kalderası ve Krater Gölü Bitlis il sınırları içerisindedir.',
      tag: 'Nemrut & Van Gölü',
    ),
    MapChallenge(
      id: 'map_phy_03',
      category: MapPracticeCategory.physical,
      interactionType: MapInteractionType.identifyHighlighted,
      difficulty: 2,
      title: 'Kırık Dağlar (Horst) Bölgesi',
      questionText:
          'Haritada işaretlenen Ege kıyılarında (Kaz, Madra, Yunt, Bozdağlar, Aydın Dağları) dağların oluşum türü aşağıdakilerden hangisidir?',
      targetProvinceId: 'izmir',
      highlightedProvinceIds: ['izmir', 'manisa', 'aydin', 'balikesir'],
      highlightColor: Color(0xFFEF4444),
      options: [
        'Kırılma (Horst - Graben Orojenizi)',
        'Kıvrılma (Antiklinal - Senklinal)',
        'Volkanik Püskürme',
        'Buzul Aşındırması',
      ],
      correctOptionIndex: 0,
      hint: 'Sert kütlelerin yan basınçlarla kırılarak yükselmesi.',
      explanation:
          'Ege Bölgesi arazisi sert tabakalardan oluştuğu için kıvrılamamış ve kırılmıştır. Yükselen kısımlar Horst (dağ), çöken kısımlar Graben (Gediz, Büyük Menderes vadileri) olmuştur.',
      tag: 'Horst-Graben',
    ),

    // -------------------------------------------------------------------------
    // SANAYİ, ULAŞIM VE LİMANLAR
    // -------------------------------------------------------------------------
    MapChallenge(
      id: 'map_ind_01',
      category: MapPracticeCategory.industry,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 2,
      title: 'Hinterlandı En Dar Doğal Liman',
      questionText:
          'Türkiye\'nin en kuzey ucunda yer alan, mükemmel bir doğal liman olmasına rağmen arkasındaki Küre Dağları\'nın ulaşımı engellemesi (hinterlandı dar) nedeniyle gelişemeyen ilimize dokunun.',
      targetProvinceId: 'sinop',
      hint: 'İnceburun\'un bulunduğu, Karadeniz\'in en kuzey noktası.',
      explanation:
          'Sinop Limanı Karadeniz\'in tek doğal limanıdır ancak arkasındaki dağlar demiryolu ve karayolu bağlantısını kısıtladığı için ticaret limanı olarak gelişememiştir.',
      distractorTrap:
          '⚠️ ÖSYM Çeldirici Tuzağı: Samsun limanı yapay olmasına rağmen hinterlandı geniş olduğu için çok gelişmiştir; Sinop ise doğal olmasına rağmen hinterlandı dar olduğu için gelişememiştir.',
      tag: 'Sinop Limanı',
    ),
    MapChallenge(
      id: 'map_ind_02',
      category: MapPracticeCategory.industry,
      interactionType: MapInteractionType.tapProvince,
      difficulty: 2,
      title: 'Hammadde Olmadan Enerjiye Bağlı Sanayi',
      questionText:
          'Kendi bünyesinde demir madeni bulunmadığı halde, Zonguldak taş kömürü havzasına yakınlık (enerji kaynağı) sebebiyle Türkiye\'nin ilk ağır demir-çelik fabrikasının kurulduğu ilimize dokunun.',
      targetProvinceId: 'karabuk',
      hint: 'Zonguldak\'ın komşusu olan, KARDEMİR tesislerine ev sahipliği yapan ilimiz.',
      explanation:
          'Karabük Demir-Çelik Fabrikası hammaddeye değil, taş kömürüne (enerji kaynağına) yakınlık prensibiyle kurulmuştur. Demir cevheri buraya Sivas ve Malatya\'dan taşınır.',
      tag: 'Demir-Çelik',
    ),
  ];

  /// 2. 81 İl Üzerinden Dinamik Soru Fabrikası
  ///
  /// Belirtilen sayıda rastgele dinamik soru üretir. Böylece adaylar hiçbir zaman
  /// soru kıtlığı çekmez ve 81 ili harita üzerinde tam olarak öğrenir.
  static List<MapChallenge> generateDynamicProvinceChallenges({
    required int count,
    MapInteractionType type = MapInteractionType.tapProvince,
    int? seed,
  }) {
    final random = seed != null ? Random(seed) : Random();
    final allProvinces = TurkeyMapData.provinces.values.toList();
    allProvinces.shuffle(random);

    final selected = allProvinces.take(count).toList();
    final challenges = <MapChallenge>[];

    for (var i = 0; i < selected.length; i++) {
      final target = selected[i];

      if (type == MapInteractionType.tapProvince) {
        // "Haritada [İl Adı] iline dokunun"
        challenges.add(
          MapChallenge(
            id: 'dyn_tap_${target.id}_$i',
            category: MapPracticeCategory.provinces,
            interactionType: MapInteractionType.tapProvince,
            difficulty: 1,
            title: '${target.name} Nerede?',
            questionText:
                'Harita üzerinde "${target.name.toUpperCase()}" ilinin bulunduğu alana dokunun.',
            targetProvinceId: target.id,
            hint: '${target.region.title} sınırları içerisinde yer alır.',
            explanation:
                '${target.name}, ${target.region.title}\'nde yer almaktadır. Konumunu zihnine yerleştirerek dilsiz harita pratiğini pekiştir.',
            tag: '81 İl',
          ),
        );
      } else {
        // "Haritada parlayan bu ilimiz hangisidir?" (Çoktan seçmeli 4 şık)
        // Hedef ilin bölgesinden veya komşularından 3 çeldirici seç
        final regionProvinces =
            allProvinces
                .where((p) => p.region == target.region && p.id != target.id)
                .toList();

        final distractors = <String>[];
        regionProvinces.shuffle(random);
        for (final p in regionProvinces) {
          if (distractors.length < 3) distractors.add(p.name);
        }

        // Eğer bölgede yeterli il yoksa diğer illerden tamamla
        if (distractors.length < 3) {
          final otherProvinces =
              allProvinces
                  .where(
                    (p) => p.id != target.id && !distractors.contains(p.name),
                  )
                  .toList();
          otherProvinces.shuffle(random);
          for (final p in otherProvinces) {
            if (distractors.length < 3) distractors.add(p.name);
          }
        }

        // 4 seçeneği harmanla
        final options = [target.name, ...distractors]..shuffle(random);
        final correctIndex = options.indexOf(target.name);

        challenges.add(
          MapChallenge(
            id: 'dyn_id_${target.id}_$i',
            category: MapPracticeCategory.provinces,
            interactionType: MapInteractionType.identifyHighlighted,
            difficulty: 2,
            title: 'Bu İl Hangisi?',
            questionText:
                'Harita üzerinde altın sarısıyla parlayan ilimiz hangisidir?',
            targetProvinceId: target.id,
            highlightedProvinceIds: [target.id],
            highlightColor: const Color(0xFFD97706),
            options: options,
            correctOptionIndex: correctIndex,
            hint: 'Bu ilimiz ${target.region.title} sınırlarında bulunur.',
            explanation:
                'Haritada gösterilen il ${target.name}\'dir (${target.region.title}).',
            tag: '81 İl',
          ),
        );
      }
    }

    return challenges;
  }
}
