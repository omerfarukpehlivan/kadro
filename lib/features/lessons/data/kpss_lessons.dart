import 'package:flutter/material.dart'; // IconData için
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Karakteristik Phosphor Duotone ikon seti

/// KPSS Lisans Genel Kültür'deki bir ders.
/// Şimdilik sabit bir liste; sorular ve konular eklendikçe burası bir
/// repository'ye dönüşecek (Faz 7).
class Lesson {
  final String id;
  final String name;
  final String section; // 'Genel Kültür' veya 'Genel Yetenek'
  final int questionCount; // Sınavda bu dersten kaç soru çıkıyor
  final IconData icon;
  final List<String> topics;
  final String? badgeText;
  final bool isComingSoon;

  const Lesson({
    required this.id,
    required this.name,
    required this.section,
    required this.questionCount,
    required this.icon,
    required this.topics,
    this.badgeText,
    this.isComingSoon = false,
  });
}

/// **Kullanımdan Kaldırılacak (Legacy Fallback):** Yeni kodlarda
/// [CurriculumRegistry.resolve] veya `activeCurriculumProvider` kullanın.
/// Sınavdaki Genel Kültür dersleri ve soru sayıları (toplam 60 soru).
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

/// **Kullanımdan Kaldırılacak (Legacy Fallback):** Yeni kodlarda
/// [CurriculumRegistry.resolve] veya `activeCurriculumProvider` kullanın.
/// KPSS Lisans Genel Yetenek dersleri (toplam 60 soru, şimdilik "Yakında").
const List<Lesson> kpssGeneralAbilityLessons = [
  Lesson(
    id: 'turkce',
    name: 'Türkçe',
    section: 'Genel Yetenek',
    questionCount: 30,
    icon: PhosphorIconsDuotone.bookOpenText,
    badgeText: 'Yakında',
    isComingSoon: true,
    topics: [
      'Sözcükte Anlam',
      'Cümlede Anlam',
      'Paragrafta Anlam ve Yapı',
      'Sözcükte Yapı ve Ekler',
      'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
      'Ses Bilgisi ve Ses Olayları',
      'Yazım Kuralları',
      'Noktalama İşaretleri',
      'Cümlenin Ögeleri ve Cümle Türleri',
      'Anlatım Bozuklukları',
      'Sözel Mantık ve Muhakeme',
    ],
  ),
  Lesson(
    id: 'matematik',
    name: 'Matematik & Geometri',
    section: 'Genel Yetenek',
    questionCount: 30,
    icon: PhosphorIconsDuotone.function,
    badgeText: 'Yakında',
    isComingSoon: true,
    topics: [
      'Temel Kavramlar ve Sayı Basamakları',
      'Bölme-Bölünebilme ve EBOB-EKOK',
      'Rasyonel ve Ondalık Sayılar',
      'Basit Eşitsizlikler ve Mutlak Değer',
      'Üslü ve Köklü İfadeler',
      'Çarpanlara Ayırma ve Oran-Orantı',
      'Denklem Çözme ve Sayı-Kesir Problemleri',
      'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri',
      'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik',
      'Permütasyon, Kombinasyon ve Olasılık',
      'Sayısal Mantık ve Tablo-Grafik Yorumlama',
      'Doğruda ve Üçgende Açılar, Üçgenler',
      'Çokgenler, Dörtgenler ve Çember-Daire',
      'Analitik Geometri ve Katı Cisimler',
    ],
  ),
];

/// **Kullanımdan Kaldırılacak (Legacy Fallback):** Yeni kodlarda
/// `activeCurriculumProvider.allLessons` kullanın.
const List<Lesson> allKpssLessons = [
  ...kpssLessons,
  ...kpssGeneralAbilityLessons,
];

/// Belirli bir ders ve konunun merkezi [CurriculumRegistry] veri tablosundaki
/// varsayılan 10 soruluk test sayısını döner.
int defaultTopicTestCount(String lessonName, String topic) =>
    CurriculumRegistry.defaultTopicTestCount(lessonName, topic);

/// Varsayılan Lisans Genel Kültür müfredatındaki toplam 10 soruluk test sayısı.
int get totalCurriculumTestCount =>
    CurriculumRegistry.resolve(ExamSelection.initial).totalTestCount;
