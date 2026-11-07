import 'package:flutter/material.dart';

/// Liste içindeki küçük bölüm başlığı ("Genel Yetenek", "Çalışma türleri" gibi).
/// Web'deki bir <h3> etiketinin karşılığı.
class SectionTitle extends StatelessWidget {
  final String text;

  // text süslü parantezin dışında: isimsiz (positional) parametre.
  // Kullanımı: SectionTitle('Başlık') — Text('...') gibi.
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 10),
      child: Text(
        text,
        style: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
