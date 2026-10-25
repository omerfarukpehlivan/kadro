import 'package:flutter/material.dart'; // IconData ve Icons için

/// KPSS Lisans GY-GK'deki bir ders.
/// Şimdilik sabit bir liste; sorular ve konular eklendikçe burası bir
/// repository'ye dönüşecek (Faz 7).
class Lesson {
  final String name;
  final String section; // 'Genel Yetenek' veya 'Genel Kültür'
  final int questionCount; // Sınavda bu dersten kaç soru çıkıyor
  final IconData icon;

  const Lesson({
    required this.name,
    required this.section,
    required this.questionCount,
    required this.icon,
  });
}

/// Sınavdaki dersler ve soru sayıları (toplam 120 soru).
/// Her yıl ÖSYM kılavuzundan kontrol et.
const List<Lesson> kpssLessons = [
  Lesson(
    name: 'Türkçe',
    section: 'Genel Yetenek',
    questionCount: 30,
    icon: Icons.translate,
  ),
  Lesson(
    name: 'Matematik',
    section: 'Genel Yetenek',
    questionCount: 30,
    icon: Icons.calculate,
  ),
  Lesson(
    name: 'Tarih',
    section: 'Genel Kültür',
    questionCount: 27,
    icon: Icons.account_balance,
  ),
  Lesson(
    name: 'Coğrafya',
    section: 'Genel Kültür',
    questionCount: 18,
    icon: Icons.public,
  ),
  Lesson(
    name: 'Vatandaşlık',
    section: 'Genel Kültür',
    questionCount: 9,
    icon: Icons.gavel,
  ),
  Lesson(
    name: 'Güncel Bilgiler',
    section: 'Genel Kültür',
    questionCount: 6,
    icon: Icons.newspaper,
  ),
];
