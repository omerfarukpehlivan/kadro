# Kadro: KPSS hazırlık uygulaması (Flutter öğrenme projesi)

Kadro, KPSS Lisans (GY-GK) adayları için konu testi, bilgi kartı, yanlış defteri
ve deneme sınavı içeren bir çalışma uygulaması. Paket adı: kadro, Android: com.omer.kadro.
Sorular özgün olmalı; ÖSYM'nin çıkmış sorularını içerik olarak ekleme.

Ben web tarafında junior bir geliştiriciyim ve Flutter'ı bu projeyle öğreniyorum.
Rehber: docs/flutter-ogrenme-rehberi.md (hangi fazda olduğumu oradan takip et).

## Öğrenme modu (en önemli kural)
- Benden açıkça "yaz" denmedikçe bütün bir feature'ı yazma. Önce yaklaşımı ve
  kullanılacak widget'ları anlat, iskeleti göster, gövdeyi bana bırak.
- Yazdığın her yeni kavramı (widget, paket, Dart özelliği) 1-2 cümleyle açıkla;
  biliyorsam Angular/web karşılığını söyle.
- Hatamı düzeltirken sadece düzeltme; nedenini söyle.
- Henüz gelmediğim bir fazın konusunu (ör. Faz 4'teyken Riverpod) önermeden kullanma.

## Mimari
- Feature-first: lib/app/ (tema, router), lib/core/ (ortak yardımcılar),
  lib/shared/widgets/ (tekrar kullanılan widget'lar),
  lib/features/<feature>/{data, presentation}.
- Widget dosyalarında iş mantığı, veritabanı veya API çağrısı yok; bunlar
  repository / provider'da.
- Büyük build metotlarını ayrı StatelessWidget sınıflarına böl
  (_buildX() helper metotları yerine). Yeni widget yazmadan önce
  lib/shared/widgets/ içinde benzeri var mı bak.
- Mümkün olan her yerde const constructor.

## Arayüz
- Renk ve yazı stili her zaman Theme.of(context).colorScheme ve .textTheme'den;
  Color(0xFF...) ve sabit fontSize yalnızca lib/app/theme.dart içinde.
- Row/Column içindeki dinamik metin ve listelerde Expanded/Flexible kullan;
  kart, liste gibi içerik alanlarına sabit yükseklik verme.

## Paketler
- Yeni paket eklemeden önce pubspec.yaml'ı oku; aynı işi yapan varsa onu kullan.
- Paketi her zaman `flutter pub add <paket>` ile ekle, sürümü elle yazma.
- Yeni paket eklemeden önce bana sor.

## Async ve hata yönetimi
- await'ten sonra BuildContext kullanmadan önce: if (!context.mounted) return;
- Veritabanı ve API çağrıları repository katmanında try/catch ile sarılır;
  UI'a anlamlı bir hata durumu döner, ham exception değil.
- print yok; gerekirse debugPrint.

## Kod üretimi (Faz 8 ve sonrası)
- *.g.dart, *.freezed.dart dosyalarını asla elle düzenleme.
- freezed/json_serializable/riverpod_generator kullanan bir dosyayı değiştirince:
  dart run build_runner build --delete-conflicting-outputs

## Teslim
- "Bitti" demeden önce flutter-verify skill'ini çalıştır.
