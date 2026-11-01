import 'package:flutter/material.dart'; // Material Design renk, font ve widget kütüphanesi
import 'package:lucide_icons_flutter/lucide_icons.dart'; // Modern çizgisel ikon seti

/// Üstteki başlık barı (Material Design: top app bar).
/// Web'deki sayfa header'ının karşılığıdır; menü değil, o anki ekranın başlığını gösterir.
/// PreferredSizeWidget arabirimi, Scaffold'un AppBar alanına özel yükseklik bilgisi sunar.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String
  title; // Header kısmında görüntülenecek olan başlık metni değişkeni

  const AppTopBar({
    super.key, // Üst sınıfa (StatelessWidget) benzersiz kimlik anahtarını iletir
    this.title =
        'Kadro', // Dışarıdan başlık verilmezse kullanılacak varsayılan metin
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      centerTitle: false, // Başlığı sola hizalar
      backgroundColor:
          colorScheme.surface, // Kurumsal tema: yüzeyle bütünleşik arka plan
      surfaceTintColor: colorScheme.surfaceTint,
      scrolledUnderElevation: 0.5,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              LucideIcons.graduationCap,
              size: 18,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  // Scaffold'un AppBar yüksekliğini hesaplayabilmesi için varsayılan standart toolbar yüksekliği (56px) veriyoruz.
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
