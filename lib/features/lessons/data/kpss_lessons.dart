import 'package:flutter/material.dart'; // IconData için
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Karakteristik Phosphor Duotone ikon seti

/// KPSS Lisans Genel Kültür'deki bir ders.
/// Şimdilik sabit bir liste; sorular ve konular eklendikçe burası bir
/// repository'ye dönüşecek (Faz 7).
class Lesson {
  final String id;
  final String name;
  final String section; // 'Genel Kültür'
  final int questionCount; // Sınavda bu dersten kaç soru çıkıyor
  final IconData icon;
  final List<String> topics;
  final String? badgeText;

  const Lesson({
    required this.id,
    required this.name,
    required this.section,
    required this.questionCount,
    required this.icon,
    required this.topics,
    this.badgeText,
  });
}

/// Sınavdaki Genel Kültür dersleri ve soru sayıları (toplam 60 soru).
/// Her yıl ÖSYM kılavuzundan kontrol et.
const List<Lesson> kpssLessons = [
  Lesson(
    id: 'tarih',
    name: 'Tarih',
    section: 'Genel Kültür',
    questionCount: 27,
    icon: PhosphorIconsDuotone.scroll,
    badgeText: null,
    topics: [
      'İslamiyet Öncesi Türk Tarihi',
      'İlk Türk-İslam Devletleri',
      'Osmanlı Kültür ve Uygarlığı',
      'Osmanlı Dağılma Dönemi',
      'Kurtuluş Savaşı Hazırlık ve Cepheler',
      'Atatürk İlke ve İnkılapları',
      'Çağdaş Türk ve Dünya Tarihi',
    ],
  ),
  Lesson(
    id: 'cografya',
    name: 'Coğrafya',
    section: 'Genel Kültür',
    questionCount: 18,
    icon: PhosphorIconsDuotone.globeHemisphereEast,
    badgeText: null,
    topics: [
      'Türkiye\'nin Coğrafi Konumu',
      'Türkiye\'nin Yer Şekilleri ve İklimi',
      'Türkiye\'de Nüfus ve Yerleşme',
      'Türkiye\'de Tarım ve Hayvancılık',
      'Madenler ve Enerji Kaynakları',
      'Sanayi, Ticaret ve Ulaşım',
    ],
  ),
  Lesson(
    id: 'vatandaslik',
    name: 'Vatandaşlık',
    section: 'Genel Kültür',
    questionCount: 9,
    icon: PhosphorIconsDuotone.scales,
    badgeText: null,
    topics: [
      'Temel Hukuk Kavramları',
      '1982 Anayasası ve Temel İlkeler',
      'Temel Hak ve Ödevler',
      'Yasama, Yürütme ve Yargı',
      'İdare Hukuku',
      'Uluslararası Kuruluşlar',
    ],
  ),
  Lesson(
    id: 'guncel',
    name: 'Güncel Bilgiler',
    section: 'Genel Kültür',
    questionCount: 6,
    icon: PhosphorIconsDuotone.newspaperClipping,
    badgeText: 'Her Hafta Yeni',
    topics: [
      'Türkiye ve Dünya Gündemi',
      'Kültür, Sanat ve Edebiyat',
      'Bilim ve Teknoloji Gelişmeleri',
      'Spor ve Olimpiyatlar',
      'UNESCO Miras Listesi',
      'Önemli Günler ve Zirveler',
    ],
  ),
];

/// Belirli bir ders ve konunun SQL soru havuzundaki veya varsayılan test sayısını döner.
///
/// Her test 10 sorudan oluşur. Tarih soru havuzundaki 620 soruya göre:
/// - İslamiyet Öncesi Türk Tarihi: 9 test (90 soru)
/// - İlk Türk-İslam Devletleri: 9 test (90 soru)
/// - Osmanlı Kültür ve Uygarlığı: 10 test (100 soru)
/// - Osmanlı Dağılma Dönemi: 9 test (90 soru)
/// - Kurtuluş Savaşı Hazırlık ve Cepheler: 10 test (100 soru)
/// - Atatürk İlke ve İnkılapları: 8 test (80 soru)
/// - Çağdaş Türk ve Dünya Tarihi: 7 test (70 soru)
/// Coğrafya (4 test), Vatandaşlık (5 test) ve Güncel Bilgiler (4 test) havuzlarına göre varsayılan döner.
int defaultTopicTestCount(String lessonName, String topic) {
  if (lessonName == 'Tarih') {
    switch (topic) {
      case 'İslamiyet Öncesi Türk Tarihi':
        return 9;
      case 'İlk Türk-İslam Devletleri':
        return 9;
      case 'Osmanlı Kültür ve Uygarlığı':
        return 10;
      case 'Osmanlı Dağılma Dönemi':
        return 9;
      case 'Kurtuluş Savaşı Hazırlık ve Cepheler':
        return 10;
      case 'Atatürk İlke ve İnkılapları':
        return 8;
      case 'Çağdaş Türk ve Dünya Tarihi':
        return 7;
    }
  } else if (lessonName == 'Coğrafya') {
    return 4;
  } else if (lessonName == 'Vatandaşlık') {
    return 5;
  } else if (lessonName == 'Güncel Bilgiler') {
    return 4;
  }
  return 5;
}
