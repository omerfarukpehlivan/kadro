import 'package:flutter/material.dart'; // IconData için
import 'package:lucide_icons_flutter/lucide_icons.dart'; // Modern çizgisel ikon seti

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
    icon: LucideIcons.bookOpen,
    badgeText: '27 Soru · Kritik',
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
    icon: LucideIcons.globe,
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
    icon: LucideIcons.scale,
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
    icon: LucideIcons.sparkles,
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
