import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/page_header.dart';

/// İstatistik sayfası. Soru çözme gelene kadar boş; grafikler Faz 10'da gelecek.
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PageHeader(
          icon: Icons.bar_chart,
          title: 'İstatistiklerin',
          subtitle: 'Soru çözdükçe ders bazında netlerin burada görünecek.',
        ),
        SizedBox(height: 16),
        // İki kart yan yana; Expanded ikisine eşit genişlik verir (flex: 1 + flex: 1)
        Row(
          children: [
            Expanded(
              child: _StatCard(label: 'Çözülen soru', value: '0'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(label: 'Doğru oranı', value: '–'),
            ),
          ],
        ),
        SizedBox(height: 12),
        _StatCard(label: 'En zayıf ders', value: 'Henüz veri yok'),
      ],
    );
  }
}

/// Bir başlık ve büyük bir değer gösteren küçük kart.
class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(value, style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
