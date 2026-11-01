/// "60 Saniyede Pençe" Doğru / Yanlış hızlı düello oyunu önerme modeli.
///
/// Web/Angular benzetmesi: Quiz Item / Boolean Fact Statement Model.
class TrueFalseItem {
  final String id;
  final String lesson; // 'Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler'
  final String topic;
  final String statement;
  final bool isTrue;
  final String explanation;

  const TrueFalseItem({
    required this.id,
    required this.lesson,
    required this.topic,
    required this.statement,
    required this.isTrue,
    required this.explanation,
  });
}

/// 8 adet özgün KPSS Genel Kültür doğru/yanlış örnek önermesi.
const List<TrueFalseItem> sampleTrueFalseItems = [
  TrueFalseItem(
    id: 'tf_1',
    lesson: 'Tarih',
    topic: 'İlk Türk Devletleri',
    statement: 'Orhun Yazıtları; Bilge Kağan, Kültigin ve Vezir Tonyukuk adına dikilmiştir.',
    isTrue: true,
    explanation: 'Doğru! II. Göktürk (Kutluk) Devleti döneminde bu üç devlet adamı adına dikilmiştir.',
  ),
  TrueFalseItem(
    id: 'tf_2',
    lesson: 'Tarih',
    topic: 'Kurtuluş Savaşı ve Antlaşmalar',
    statement:
        'Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen kaldırılmıştır.',
    isTrue: false,
    explanation: 'Yanlış! Boğazlar Komisyonu 1923 Lozan\'da başkanlığını bir Türk\'ün yaptığı uluslararası bir komisyon olarak kaldı; komisyon 1936 Montrö Boğazlar Sözleşmesi ile tamamen kaldırıldı.',
  ),
  TrueFalseItem(
    id: 'tf_3',
    lesson: 'Coğrafya',
    topic: 'Madenler ve Enerji Kaynakları',
    statement:
        'Türkiye\'de bor rezervinin en fazla olduğu bölge Güney Marmara\'dır.',
    isTrue: true,
    explanation: 'Doğru! Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa) ve Kütahya (Emet) ile Eskişehir (Seyitgazi) çevresinde yoğunlaşmıştır.',
  ),
  TrueFalseItem(
    id: 'tf_4',
    lesson: 'Coğrafya',
    topic: 'Türkiye\'nin Akarsuları',
    statement:
        'Çoruh Nehri sularını Karadeniz yerine Hazar Denizi\'ne boşaltır.',
    isTrue: false,
    explanation: 'Yanlış! Çoruh Nehri Türkiye topraklarından doğup Gürcistan (Batum) üzerinden Karadeniz\'e dökülür. Hazar Denizi\'ne dökülenler Aras ve Kura nehirleridir.',
  ),
  TrueFalseItem(
    id: 'tf_5',
    lesson: 'Vatandaşlık',
    topic: 'Yasama Organı',
    statement:
        '1982 Anayasası\'na göre TBMM genel seçimleri 5 yılda bir yapılır.',
    isTrue: true,
    explanation: 'Doğru! 2017 anayasa değişikliği ile Cumhurbaşkanlığı ve TBMM seçimleri 5 yılda bir aynı gün yapılır.',
  ),
  TrueFalseItem(
    id: 'tf_6',
    lesson: 'Vatandaşlık',
    topic: 'Yargı Organı',
    statement: 'Anayasa Mahkemesi üyelerinin görev süresi 8 yıldır.',
    isTrue: false,
    explanation: 'Yanlış! 2010 anayasa değişikliği ile Anayasa Mahkemesi üyeleri 12 yıl için seçilir ve bir kimse iki defa AYM üyesi seçilemez.',
  ),
  TrueFalseItem(
    id: 'tf_7',
    lesson: 'Güncel Bilgiler',
    topic: 'Bilim ve Teknoloji',
    statement: 'Türkiye\'nin ilk yerli ve milli gözlem uydularından İMECE uzaya fırlatılmıştır.',
    isTrue: true,
    explanation: 'Doğru! TÜBİTAK UZAY tarafından geliştirilen İMECE, yüksek çözünürlüklü yerli gözlem uydumuzdur.',
  ),
  TrueFalseItem(
    id: 'tf_8',
    lesson: 'Tarih',
    topic: 'Milli Mücadele Hazırlık Dönemi',
    statement: 'Amasya Genelgesi\'nde ilk kez milli egemenliğe dayalı yeni bir devlet kurmaktan bahsedilmiştir.',
    isTrue: true,
    explanation: 'Doğru! "Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır" maddesiyle üstü kapalı olarak milli egemenliğe vurgu yapılmıştır.',
  ),
];
