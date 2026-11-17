import 'package:kadro/features/exams/data/models/exam_selection.dart';

/// Eşleştirme kart çifti modeli.
class ConceptPair {
  final String id;
  final String leftTerm;
  final String rightMatch;

  const ConceptPair({
    required this.id,
    required this.leftTerm,
    required this.rightMatch,
  });
}

/// Kavram eşleştirme soru seti modeli.
class ConceptMatchSet {
  final String id;
  final String title;
  final String lesson;
  final List<ConceptPair> pairs;
  final List<String> examScopes;
  final String? subBranch;

  const ConceptMatchSet({
    required this.id,
    required this.title,
    required this.lesson,
    required this.pairs,
    this.examScopes = const ['lisans_gk'],
    this.subBranch,
  });

  bool matchesSelection(ExamSelection selection) => selection
      .matchesContentMetadata(examScopes: examScopes, subBranch: subBranch);
}

/// 20 adet özgün KPSS Genel Kültür tematik kavram eşleştirme seti.
/// Tarih (6), Coğrafya (5), Vatandaşlık (5) ve Güncel Bilgiler (4) olmak üzere
/// toplam 80 kavram çifti içerir.
const List<ConceptMatchSet> sampleConceptMatchSets = [
  ConceptMatchSet(
    id: 'set_his_01',
    title: 'Tarih: Antlaşmalar & Önemi',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h1_1',
        leftTerm: 'Lozan Antlaşması',
        rightMatch: 'Kapitülasyonların Kaldırılması',
      ),
      ConceptPair(
        id: 'h1_2',
        leftTerm: 'Mondros Ateşkesi',
        rightMatch: '7. ve 24. Maddelerle İşgal Zeminini Hazırlama',
      ),
      ConceptPair(
        id: 'h1_3',
        leftTerm: 'Mudanya Ateşkesi',
        rightMatch: "Doğu Trakya'nın Savaşsız Kurtarılması",
      ),
      ConceptPair(
        id: 'h1_4',
        leftTerm: 'Gümrü Antlaşması',
        rightMatch: "TBMM'nin Uluslararası İlk Siyasi Zaferi",
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_his_02',
    title: 'Tarih: Padişahlar & Islahatlar',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h2_1',
        leftTerm: 'Orhan Bey',
        rightMatch: 'İlk Divan Teşkilatı ve İznik Medresesi',
      ),
      ConceptPair(
        id: 'h2_2',
        leftTerm: 'I. Murat',
        rightMatch: 'Yeniçeri Ocağı (Kapıkulu) ve Tımar Sistemi',
      ),
      ConceptPair(
        id: 'h2_3',
        leftTerm: 'II. Mahmut',
        rightMatch: 'Yeniçeri Ocağının Kaldırılması (Vaka-i Hayriye)',
      ),
      ConceptPair(
        id: 'h2_4',
        leftTerm: 'III. Selim',
        rightMatch: 'Nizam-ı Cedit Ordusu ve İrad-ı Cedit Hazinesi',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_his_03',
    title: 'Tarih: Muharebeler & Sonuçları',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h3_1',
        leftTerm: 'I. İnönü Muharebesi',
        rightMatch: "Teşkilat-ı Esasiye ve İstiklal Marşı'nın Kabulü",
      ),
      ConceptPair(
        id: 'h3_2',
        leftTerm: 'Sakarya Meydan Muharebesi',
        rightMatch: "1683 Viyana Kuşatması'ndan Beri Geri Çekilişin Sonu",
      ),
      ConceptPair(
        id: 'h3_3',
        leftTerm: 'Kütahya-Eskişehir Muharebeleri',
        rightMatch: "Mustafa Kemal'e 3 Aylık Başkomutanlık Verilmesi",
      ),
      ConceptPair(
        id: 'h3_4',
        leftTerm: 'Büyük Taarruz',
        rightMatch: 'Mudanya Ateşkesine ve Kurtuluşa Zemin Hazırlama',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_his_04',
    title: 'Tarih: Genelgeler & Kongreler',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h4_1',
        leftTerm: 'Havza Genelgesi',
        rightMatch: 'İşgallere Karşı İlk Resmî Protesto ve Miting Çağrısı',
      ),
      ConceptPair(
        id: 'h4_2',
        leftTerm: 'Amasya Genelgesi',
        rightMatch: "Millî Mücadele'nin Amacı, Gerekçesi ve Yöntemi",
      ),
      ConceptPair(
        id: 'h4_3',
        leftTerm: 'Erzurum Kongresi',
        rightMatch: 'İlk Kez Misak-ı Millî Sınırları ve Temsil Heyeti',
      ),
      ConceptPair(
        id: 'h4_4',
        leftTerm: 'Sivas Kongresi',
        rightMatch: 'Tüm Millî Cemiyetlerin Tek Çatı Altında Birleşmesi',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_his_05',
    title: 'Tarih: Türk-İslam Eserleri & Yazarları',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h5_1',
        leftTerm: 'Kutadgu Bilig',
        rightMatch: 'Yusuf Has Hacib (İlk Türk-İslam Siyasetnamesi)',
      ),
      ConceptPair(
        id: 'h5_2',
        leftTerm: "Divanü Lugati't-Türk",
        rightMatch: 'Kaşgarlı Mahmud (İlk Türkçe Sözlük ve Harita)',
      ),
      ConceptPair(
        id: 'h5_3',
        leftTerm: "Atabetü'l-Hakayık",
        rightMatch: 'Edip Ahmet Yükneki (Ahlak ve Hakikatler Eşiği)',
      ),
      ConceptPair(
        id: 'h5_4',
        leftTerm: 'Divan-ı Hikmet',
        rightMatch: 'Hoca Ahmet Yesevi (İlk Tasavvuf Eseri)',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_his_06',
    title: 'Tarih: Atatürk İnkılapları & Alanları',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h6_1',
        leftTerm: 'Tevhid-i Tedrisat Kanunu',
        rightMatch: 'Eğitim ve Öğretimin Tek Çatı Altında Birleşmesi',
      ),
      ConceptPair(
        id: 'h6_2',
        leftTerm: "Medeni Kanun'un Kabulü",
        rightMatch: 'Patrikhanenin Dünyevi Yetkilerinin Sona Ermesi',
      ),
      ConceptPair(
        id: 'h6_3',
        leftTerm: 'Kabotaj Kanunu',
        rightMatch: 'Türk Karasularında Deniz Ticareti Bağımsızlığı',
      ),
      ConceptPair(
        id: 'h6_4',
        leftTerm: 'Teşvik-i Sanayi Kanunu',
        rightMatch: 'Özel Sektörü Destekleme ve Sanayileşme Hamlesi',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_geo_01',
    title: 'Coğrafya: Madenler & Merkezler',
    lesson: 'Coğrafya',
    pairs: [
      ConceptPair(
        id: 'g1_1',
        leftTerm: 'Divriği & Hekimhan',
        rightMatch: 'Demir Çıkarım Alanı',
      ),
      ConceptPair(
        id: 'g1_2',
        leftTerm: 'Murgul & Küre',
        rightMatch: 'Bakır Çıkarım Alanı',
      ),
      ConceptPair(
        id: 'g1_3',
        leftTerm: 'Seydişehir & Akseki',
        rightMatch: 'Boksit (Alüminyum) Alanı',
      ),
      ConceptPair(
        id: 'g1_4',
        leftTerm: 'Kırka & Emet',
        rightMatch: 'Bor Mineralleri Alanı',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_geo_02',
    title: 'Coğrafya: Ovalar & Oluşum Kökenleri',
    lesson: 'Coğrafya',
    pairs: [
      ConceptPair(
        id: 'g2_1',
        leftTerm: 'Çukurova & Bafra',
        rightMatch: 'Akarsu Birikimi (Delta Ovası)',
      ),
      ConceptPair(
        id: 'g2_2',
        leftTerm: 'Elmalı & Tefenni',
        rightMatch: 'Karstik Çözünme (Polye Ovası)',
      ),
      ConceptPair(
        id: 'g2_3',
        leftTerm: 'Gediz & Büyük Menderes',
        rightMatch: 'Çöküntü Hendeği (Graben / Tektonik Ova)',
      ),
      ConceptPair(
        id: 'g2_4',
        leftTerm: 'Konya & Ergene Ovaları',
        rightMatch: 'Eski Göl Tabanı ve Tortullanma Ovası',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_geo_03',
    title: 'Coğrafya: Barajlar & Akarsular',
    lesson: 'Coğrafya',
    pairs: [
      ConceptPair(
        id: 'g3_1',
        leftTerm: 'Atatürk & Keban Barajı',
        rightMatch: 'Fırat Nehri',
      ),
      ConceptPair(
        id: 'g3_2',
        leftTerm: 'Ilısu (Veysel Eroğlu) Barajı',
        rightMatch: 'Dicle Nehri',
      ),
      ConceptPair(
        id: 'g3_3',
        leftTerm: 'Deriner & Yusufeli Barajı',
        rightMatch: 'Çoruh Nehri',
      ),
      ConceptPair(
        id: 'g3_4',
        leftTerm: 'Altınkaya & Hirfanlı Barajı',
        rightMatch: 'Kızılırmak',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_geo_04',
    title: 'Coğrafya: Yerel Rüzgârlar & Yönleri',
    lesson: 'Coğrafya',
    pairs: [
      ConceptPair(
        id: 'g4_1',
        leftTerm: 'Karayel',
        rightMatch: 'Kuzeybatıdan Esen Soğuk Rüzgâr',
      ),
      ConceptPair(
        id: 'g4_2',
        leftTerm: 'Poyraz',
        rightMatch: 'Kuzeydoğudan Esen Soğuk ve Kuru Rüzgâr',
      ),
      ConceptPair(
        id: 'g4_3',
        leftTerm: 'Samyeli (Keşişleme)',
        rightMatch: 'Güneydoğudan Esen Sıcak ve Çöl Kökenli Rüzgâr',
      ),
      ConceptPair(
        id: 'g4_4',
        leftTerm: 'Lodos',
        rightMatch: 'Güneybatıdan Esen Ilık ve Denizel Rüzgâr',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_geo_05',
    title: 'Coğrafya: Göller & Oluşum Tipleri',
    lesson: 'Coğrafya',
    pairs: [
      ConceptPair(
        id: 'g5_1',
        leftTerm: 'Abant & Yedigöller',
        rightMatch: 'Heyelan Set Gölü',
      ),
      ConceptPair(
        id: 'g5_2',
        leftTerm: 'Nemrut & Meke Gölü',
        rightMatch: 'Volkanik Krater / Maar Gölü',
      ),
      ConceptPair(
        id: 'g5_3',
        leftTerm: 'Çıldır & Van Gölü',
        rightMatch: 'Volkanik Set Gölü',
      ),
      ConceptPair(
        id: 'g5_4',
        leftTerm: 'Salda & Avlan Gölü',
        rightMatch: 'Karstik Erime Gölü',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_vat_01',
    title: 'Vatandaşlık: Erkler & Kurumlar',
    lesson: 'Vatandaşlık',
    pairs: [
      ConceptPair(
        id: 'v1_1',
        leftTerm: 'Yasama Yetkisi',
        rightMatch: 'Türkiye Büyük Millet Meclisi',
      ),
      ConceptPair(
        id: 'v1_2',
        leftTerm: 'Yargısal Denetim (Bireysel Başvuru)',
        rightMatch: 'Anayasa Mahkemesi',
      ),
      ConceptPair(
        id: 'v1_3',
        leftTerm: 'İdari Yargı En Üst Mercii',
        rightMatch: 'Danıştay',
      ),
      ConceptPair(
        id: 'v1_4',
        leftTerm: 'Adli Yargı En Üst Mercii',
        rightMatch: 'Yargıtay',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_vat_02',
    title: 'Vatandaşlık: Kurumlar & Üye Sayıları',
    lesson: 'Vatandaşlık',
    pairs: [
      ConceptPair(
        id: 'v2_1',
        leftTerm: 'Türkiye Büyük Millet Meclisi',
        rightMatch: '600 Milletvekili',
      ),
      ConceptPair(
        id: 'v2_2',
        leftTerm: 'Anayasa Mahkemesi',
        rightMatch: '15 Asıl Üye (12 Yıllığına)',
      ),
      ConceptPair(
        id: 'v2_3',
        leftTerm: 'Hâkimler ve Savcılar Kurulu',
        rightMatch: '13 Üye (2 Daire Hâlinde)',
      ),
      ConceptPair(
        id: 'v2_4',
        leftTerm: 'Yüksek Seçim Kurulu',
        rightMatch: '7 Asıl, 4 Yedek (11 Üye)',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_vat_03',
    title: 'Vatandaşlık: Hak Türleri & Kategorileri',
    lesson: 'Vatandaşlık',
    pairs: [
      ConceptPair(
        id: 'v3_1',
        leftTerm: 'Konut Dokunulmazlığı & Mülkiyet',
        rightMatch: 'Kişi Hak ve Ödevleri (Koruyucu / Negatif)',
      ),
      ConceptPair(
        id: 'v3_2',
        leftTerm: 'Sendika Kurma & Sağlık Hakkı',
        rightMatch: 'Sosyal ve Ekonomik Haklar (İsteme / Pozitif)',
      ),
      ConceptPair(
        id: 'v3_3',
        leftTerm: 'Kamu Hizmetine Girme & Vergi Ödevi',
        rightMatch: 'Siyasi Haklar ve Ödevler (Katılma / Aktif)',
      ),
      ConceptPair(
        id: 'v3_4',
        leftTerm: 'Yaşama Hakkı & Masumiyet Karinesi',
        rightMatch: "Savaş ve OHAL'de Dokunulamaz Çekirdek Haklar",
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_vat_04',
    title: 'Vatandaşlık: Yargı Mercileri & Görevleri',
    lesson: 'Vatandaşlık',
    pairs: [
      ConceptPair(
        id: 'v4_1',
        leftTerm: 'Danıştay',
        rightMatch: 'İdari İşlemlerin İptali ve İdari Yargı Temyizi',
      ),
      ConceptPair(
        id: 'v4_2',
        leftTerm: 'Yargıtay',
        rightMatch: 'Hukuk ve Ceza Mahkemeleri Adli Yargı Temyizi',
      ),
      ConceptPair(
        id: 'v4_3',
        leftTerm: 'Uyuşmazlık Mahkemesi',
        rightMatch: 'Adli ve İdari Yargı Arasındaki Görev İhtilafları',
      ),
      ConceptPair(
        id: 'v4_4',
        leftTerm: 'Sayıştay',
        rightMatch: 'TBMM Adına Kamu Gelir ve Giderlerinin Kesin Hesabı',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_vat_05',
    title: 'Vatandaşlık: Anayasal Süreler & Nisaplar',
    lesson: 'Vatandaşlık',
    pairs: [
      ConceptPair(
        id: 'v5_1',
        leftTerm: 'Kanunların Şekil İptal Davası',
        rightMatch: 'Resmî Gazete Yayımından İtibaren 10 Gün',
      ),
      ConceptPair(
        id: 'v5_2',
        leftTerm: 'Cumhurbaşkanının Kanun İnceleme Süresi',
        rightMatch: 'TBMM Kabulünden İtibaren 15 Gün',
      ),
      ConceptPair(
        id: 'v5_3',
        leftTerm: 'Anayasa Değişikliği Teklif Sayısı',
        rightMatch: "TBMM Üye Tamsayısının En Az 1/3'ü (200 MV)",
      ),
      ConceptPair(
        id: 'v5_4',
        leftTerm: "AYM'ye Bireysel Başvuru Süresi",
        rightMatch: 'Olağan Kanun Yollarının Tüketilmesinden Sonra 30 Gün',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_gun_01',
    title: 'Güncel Bilgiler: Örgütler & Merkezleri',
    lesson: 'Güncel Bilgiler',
    pairs: [
      ConceptPair(
        id: 'gu1_1',
        leftTerm: 'Türk Devletleri Teşkilatı (TDT)',
        rightMatch: 'İstanbul / Türkiye',
      ),
      ConceptPair(
        id: 'gu1_2',
        leftTerm: 'Uluslararası Adalet Divanı (UAD)',
        rightMatch: 'Lahey (Barış Sarayı) / Hollanda',
      ),
      ConceptPair(
        id: 'gu1_3',
        leftTerm: 'Uluslararası Para Fonu (IMF)',
        rightMatch: 'Washington D.C. / ABD',
      ),
      ConceptPair(
        id: 'gu1_4',
        leftTerm: 'İslam İşbirliği Teşkilatı (İİT)',
        rightMatch: 'Cidde / Suudi Arabistan',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_gun_02',
    title: 'Güncel Bilgiler: Sporcular & Başarıları',
    lesson: 'Güncel Bilgiler',
    pairs: [
      ConceptPair(
        id: 'gu2_1',
        leftTerm: 'Yusuf Dikeç',
        rightMatch: '10m Havalı Tabanca Karışık Takım (Paris 2024 Gümüş)',
      ),
      ConceptPair(
        id: 'gu2_2',
        leftTerm: 'Mete Gazoz',
        rightMatch: 'Klasik Yay Okçuluk (Tokyo 2020 Altın & Paris 2024 Bronz)',
      ),
      ConceptPair(
        id: 'gu2_3',
        leftTerm: 'Arda Güler',
        rightMatch: 'UEFA Şampiyonlar Ligi Kupası (Real Madrid)',
      ),
      ConceptPair(
        id: 'gu2_4',
        leftTerm: 'Melissa Vargas',
        rightMatch: 'CEV Avrupa ve Milletler Ligi VNL Şampiyonluğu (MVP)',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_gun_03',
    title: 'Güncel Bilgiler: Küresel Ödüller & İsimler',
    lesson: 'Güncel Bilgiler',
    pairs: [
      ConceptPair(
        id: 'gu3_1',
        leftTerm: 'Daron Acemoğlu',
        rightMatch: '2024 Nobel Ekonomi Ödülü (Kurumlar ve Refah)',
      ),
      ConceptPair(
        id: 'gu3_2',
        leftTerm: 'Han Kang',
        rightMatch: '2024 Nobel Edebiyat Ödülü (Güney Koreli Yazar)',
      ),
      ConceptPair(
        id: 'gu3_3',
        leftTerm: 'Nihon Hidankyo',
        rightMatch: '2024 Nobel Barış Ödülü (Japon Nükleer Karşıtı Örgüt)',
      ),
      ConceptPair(
        id: 'gu3_4',
        leftTerm: 'Alper Gezeravcı',
        rightMatch: 'Ax-3 Misyonu ile İlk Türk Uzay Yolcusu (ISS)',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_gun_04',
    title: 'Güncel Bilgiler: Mega Projeler & Özellikleri',
    lesson: 'Güncel Bilgiler',
    pairs: [
      ConceptPair(
        id: 'gu4_1',
        leftTerm: '1915 Çanakkale Köprüsü',
        rightMatch: 'Dünyanın En Uzun Orta Açıklıklı Asma Köprüsü (2023 m)',
      ),
      ConceptPair(
        id: 'gu4_2',
        leftTerm: 'Yeni Zigana Tüneli',
        rightMatch: "Avrupa'nın En Uzun Çift Tüplü Kara Yolu Tüneli (14,5 km)",
      ),
      ConceptPair(
        id: 'gu4_3',
        leftTerm: 'Yusufeli Barajı',
        rightMatch: "Türkiye'nin En Yüksek Kemer Barajı (275 m)",
      ),
      ConceptPair(
        id: 'gu4_4',
        leftTerm: 'TCG Anadolu',
        rightMatch: 'Dünyanın İlk SİHA ve İHA Gemisi (L400)',
      ),
    ],
  ),
];
