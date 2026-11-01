import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

/// Denemeler sekmesi: sınav düzeni ve (ileride) süreli deneme başlatma.
class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      // Liste const değil, çünkü FilledButton.icon const oluşturulamıyor;
      // bu yüzden const'u diğer elemanlara tek tek yazıyoruz.
      children: [
        const PageHeader(
          icon: Icons.timer,
          title: 'Deneme sınavları',
          subtitle: 'Gerçek sınav düzeninde, süreli denemeler.',
        ),
        const SizedBox(height: 16),
        const SectionTitle('Sınav düzeni'),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.format_list_numbered),
                title: Text('Soru sayısı'),
                trailing: Text('60'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Süre'),
                trailing: Text('65 dakika'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text('Net hesabı'),
                subtitle: Text('4 yanlış 1 doğruyu götürür'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // onPressed: null olan buton otomatik olarak pasif (gri) görünür
        FilledButton.icon(
          onPressed: null,
          icon: const Icon(Icons.play_arrow),
          label: const Text('Deneme başlat (yakında)'),
        ),
      ],
    );
  }
}
