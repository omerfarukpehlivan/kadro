import 'package:flutter/material.dart'; // Material Design renk, font ve widget kütüphanesi

/// Web'deki `<app-navbar>` (Header) bileşeninin karşılığıdır.
/// PreferredSizeWidget arabirimi, Scaffold'un AppBar alanına özel yükseklik bilgisi sunar.
class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String
  title; // Header kısmında görüntülenecek olan başlık metni değişkeni

  const AppNavbar({
    super.key, // Üst sınıfa (StatelessWidget) benzersiz kimlik anahtarını iletir
    this.title = 'Günışığı 🌅', // Dışarıdan başlık verilmezse kullanılacak varsayılan metin
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Material Design standart üst bar widget'ı
      title: Text(title), // Başlık metnini çizer
      centerTitle:
          false, // Başlığı üst barda tam ortalar (iOS tarzı şık görünüm)
      backgroundColor: Theme.of(context)
          .colorScheme
          .inversePrimary, // Temadaki uyumlu ana rengi çeker
    );
  }

  @override
  // Scaffold'un AppBar yüksekliğini hesaplayabilmesi için varsayılan standart toolbar yüksekliği (56px) veriyoruz.
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
