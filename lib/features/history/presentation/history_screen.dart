import 'package:flutter/material.dart';
import 'package:gunisigi/shared/widgets/page_header.dart';

/// Geçmiş kayıtların listelendiği sayfa.
/// Şimdilik örnek (hardcoded) kayıtlar var; gerçek veri Faz 7'de gelecek.
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView: içerik ekrana sığmazsa kaydırılabilir bir liste (overflow-y: auto gibi)
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PageHeader(
          icon: Icons.history,
          title: 'Geçmiş kayıtların',
          subtitle: 'Yazdığın günler burada listelenecek. Şimdilik örnek kayıtlar var.',
        ),
        SizedBox(height: 16),
        _EntryCard(
          date: '24 Ekim 2026',
          mood: '😊',
          summary: 'Sabah kahvesi, uzun yürüyüş, arkadaşla sohbet',
        ),
        _EntryCard(
          date: '23 Ekim 2026',
          mood: '😌',
          summary: 'Kitap okudum, erken uyudum, annemi aradım',
        ),
        _EntryCard(
          date: '22 Ekim 2026',
          mood: '🙂',
          summary: 'Yeni bir şarkı keşfettim, yağmur, sıcak çorba',
        ),
      ],
    );
  }
}

/// Listedeki tek bir kayıt kartı. Alt çizgi: sadece bu dosyada kullanılır.
class _EntryCard extends StatelessWidget {
  final String date;
  final String mood;
  final String summary;

  const _EntryCard({
    required this.date,
    required this.mood,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    // ListTile: solda ikon, ortada başlık + alt başlık olan hazır satır düzeni
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(mood)),
        title: Text(date),
        subtitle: Text(summary),
      ),
    );
  }
}
