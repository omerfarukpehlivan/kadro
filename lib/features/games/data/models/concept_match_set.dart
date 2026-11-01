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

  const ConceptMatchSet({
    required this.id,
    required this.title,
    required this.lesson,
    required this.pairs,
  });
}

/// 3 adet özgün KPSS Genel Kültür eşleştirme seti (Tarih, Coğrafya, Vatandaşlık).
const List<ConceptMatchSet> sampleConceptMatchSets = [
  ConceptMatchSet(
    id: 'set_history',
    title: 'Tarih: Antlaşmalar & Önemi',
    lesson: 'Tarih',
    pairs: [
      ConceptPair(
        id: 'h_1',
        leftTerm: 'Lozan Antlaşması',
        rightMatch: 'Kapitülasyonların Kaldırılması',
      ),
      ConceptPair(
        id: 'h_2',
        leftTerm: 'Mondros Ateşkesi',
        rightMatch: '7. ve 24. Maddelerle İşgal Zeminini Hazırlama',
      ),
      ConceptPair(
        id: 'h_3',
        leftTerm: 'Mudanya Ateşkesi',
        rightMatch: 'Doğu Trakya\'nın Savaşsız Kurtarılması',
      ),
      ConceptPair(
        id: 'h_4',
        leftTerm: 'Gümrü Antlaşması',
        rightMatch: 'TBMM\'nin Uluslararası İlk Siyasi Zaferi',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_geography',
    title: 'Coğrafya: Madenler & Merkezler',
    lesson: 'Coğrafya',
    pairs: [
      ConceptPair(
        id: 'g_1',
        leftTerm: 'Divriği & Hekimhan',
        rightMatch: 'Demir Çıkarım Alanı',
      ),
      ConceptPair(
        id: 'g_2',
        leftTerm: 'Murgul & Küre',
        rightMatch: 'Bakır Çıkarım Alanı',
      ),
      ConceptPair(
        id: 'g_3',
        leftTerm: 'Seydişehir & Mortaş',
        rightMatch: 'Boksit (Alüminyum) Alanı',
      ),
      ConceptPair(
        id: 'g_4',
        leftTerm: 'Kırka & Emet',
        rightMatch: 'Bor Mineralleri Alanı',
      ),
    ],
  ),
  ConceptMatchSet(
    id: 'set_citizenship',
    title: 'Vatandaşlık: Erkler & Kurumlar',
    lesson: 'Vatandaşlık',
    pairs: [
      ConceptPair(
        id: 'c_1',
        leftTerm: 'Yasama Yetkisi',
        rightMatch: 'Türkiye Büyük Millet Meclisi',
      ),
      ConceptPair(
        id: 'c_2',
        leftTerm: 'Yargısal Denetim (Bireysel Başvuru)',
        rightMatch: 'Anayasa Mahkemesi',
      ),
      ConceptPair(
        id: 'c_3',
        leftTerm: 'İdari Yargı En Üst Mercii',
        rightMatch: 'Danıştay',
      ),
      ConceptPair(
        id: 'c_4',
        leftTerm: 'Adli Yargı En Üst Mercii',
        rightMatch: 'Yargıtay',
      ),
    ],
  ),
];
