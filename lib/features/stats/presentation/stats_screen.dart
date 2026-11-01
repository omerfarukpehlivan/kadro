import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/page_header.dart';

/// İstatistik sayfası: Riverpod üzerinden canlı soru ve başarı metriklerini gösterir.
class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageHeader(
          icon: Icons.bar_chart,
          title: 'İstatistiklerin',
          subtitle: 'Soru çözdükçe ders bazında netlerin burada görünecek.',
        ),
        const SizedBox(height: 16),
        // İki kart yan yana; Expanded ikisine eşit genişlik verir (flex: 1 + flex: 1)
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: 'Çözülen soru',
                value: '${stats.totalSolved}',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: 'Doğru oranı',
                value: stats.totalSolved == 0
                    ? '–'
                    : '%${stats.accuracyPercent}',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _StatCard(label: 'En zayıf ders', value: stats.weakestLesson),
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
