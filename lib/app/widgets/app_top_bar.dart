import 'package:flutter/material.dart'; // Material Design renk, font ve widget kütüphanesi

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
    return AppBar(
      // Material Design standart üst bar widget'ı
      title: Text(title), // Başlık metnini çizer
      centerTitle:
          false, // Başlığı sola hizalar (Android Material 3 standart görünümü)
      backgroundColor: Theme.of(context)
          .colorScheme
          .inversePrimary, // Temadaki uyumlu ana rengi çeker
    );
  }

  @override
  // Scaffold'un AppBar yüksekliğini hesaplayabilmesi için varsayılan standart toolbar yüksekliği (56px) veriyoruz.
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
