import 'package:flutter/material.dart';

/// Sayfaların en üstündeki ikon + başlık + açıklama bloğu.
/// Geçmiş, İstatistik ve Ayarlar sayfaları bunu ortak kullanır
/// (Angular'da shared modüldeki tekrar kullanılan bir component gibi).
class PageHeader extends StatelessWidget {
  final IconData icon; // İkon tanımı
  final String title;
  final String subtitle;

  const PageHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(width: 16),
        // Expanded: metin uzunsa satırı taşırmak yerine kalan genişliğe sığar (flex: 1 gibi)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle,
                // copyWith: temadaki stili alıp sadece rengini değiştirir
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
