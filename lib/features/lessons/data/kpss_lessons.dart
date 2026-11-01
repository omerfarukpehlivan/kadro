import 'package:flutter/material.dart'; // IconData ve Icons için

/// KPSS Lisans Genel Kültür'deki bir ders.
/// Şimdilik sabit bir liste; sorular ve konular eklendikçe burası bir
/// repository'ye dönüşecek (Faz 7).
class Lesson {
  final String id;
  final String name;
  final String section; // 'Genel Kültür'
  final int questionCount; // Sınavda bu dersten kaç soru çıkıyor
  final IconData icon;

  const Lesson({
    required this.id,
    required this.name,
    required this.section,
    required this.questionCount,
    required this.icon,
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
    icon: Icons.account_balance,
  ),
  Lesson(
    id: 'cografya',
    name: 'Coğrafya',
    section: 'Genel Kültür',
    questionCount: 18,
    icon: Icons.public,
  ),
  Lesson(
    id: 'vatandaslik',
    name: 'Vatandaşlık',
    section: 'Genel Kültür',
    questionCount: 9,
    icon: Icons.gavel,
  ),
  Lesson(
    id: 'guncel',
    name: 'Güncel Bilgiler',
    section: 'Genel Kültür',
    questionCount: 6,
    icon: Icons.newspaper,
  ),
];
