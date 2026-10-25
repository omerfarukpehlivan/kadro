import 'package:flutter/material.dart';
import 'package:gunisigi/shared/widgets/page_header.dart';

/// İstatistik sayfası. Şimdilik örnek sayılar var; grafikler Faz 10'da gelecek.
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
          subtitle: 'Kayıtların çoğaldıkça burası dolacak. Şimdilik örnek sayılar var.',
        ),
        SizedBox(height: 16),
        // İki kart yan yana; Expanded ikisine eşit genişlik verir (flex: 1 + flex: 1)
        Row(
          children: [
            Expanded(
              child: _StatCard(label: 'Toplam kayıt', value: '12'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(label: 'Seri', value: '3 gün'),
            ),
          ],
        ),
        SizedBox(height: 12),
        _StatCard(label: 'En sık ruh hali', value: '😊 Mutlu'),
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
