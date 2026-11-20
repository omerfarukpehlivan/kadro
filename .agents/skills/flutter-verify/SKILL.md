---
name: flutter-verify
description: Flutter kodunda değişiklik yaptıktan sonra, işi teslim etmeden önce format, analiz ve YALNIZCA değişiklikten etkilenen testleri çalıştırır; tüm test paketi sadece commit/PR öncesinde koşar.
---

Sırasıyla çalıştır:

1. **Format (yalnızca değişen dosyalar):** `dart format <değişen .dart dosyaları>`. Çok dosya değiştiyse `dart format lib test`.
2. **Analiz:** `flutter analyze` (~10 sn). Hata veya uyarı varsa düzelt ve tekrar çalıştır; 0 sorun olana kadar.
3. **Testler — sadece gerekenler:**
   - Varsayılan: `node tools/affected_tests.mjs --run`
     - Değişen dosyaları `git`'ten okur, import grafiğiyle etkilenen test dosyalarını bulur ve yalnızca onları çalıştırır.
     - Önce neyin seçileceğini görmek için `--run` olmadan çalıştır. Belirli dosyalar için `--files lib/a.dart,lib/b.dart` ver.
   - Yalnızca bir test dosyasını düzelttiysen doğrudan o dosyayı çalıştır: `flutter test test/x_test.dart`.
   - **Tüm paket** (`node tools/affected_tests.mjs --deep --run` veya `flutter test`): yalnızca commit/PR öncesinde, `pubspec.yaml`/`assets/` değiştiğinde ya da kullanıcı isterse. Uzun sürerse arka planda çalıştır ve çıktıyı dosyaya yaz (`| tail` ile boru kullanma; çıktı tampona takılır).
   - Kırılan test varsa nedenini bul ve düzelt; testi silerek veya gevşeterek geçirme.

## Yavaş / takılan test kuralları
- Tek bir test dosyası normalde saniyeler sürer. Bir test 30 sn'yi geçiyorsa büyük ihtimalle **takılıyordur** (Flutter varsayılan zaman aşımı 10 dk'dır ve tüm paketi kilitler).
- `testWidgets` sahte zamanda (FakeAsync) çalışır. Gerçek I/O (asset/JSON okuma, `compute`, ağ) bekleyen kodu `await tester.runAsync(() => ...)` içine al.
- `rootBundle.loadString` Future'ı önbelleğe alır; aynı dosyadaki önceki widget testleri bunu yarıda bırakmış olabilir. Gerçek asset okuyan testten önce `rootBundle.clear()` çağır.
- Sonsuz animasyon (ör. yükleniyor `CircularProgressIndicator`) varken `pumpAndSettle()` hiç bitmez; `pump(const Duration(...))` kullan.

Sonunda kısa bir rapor ver: kaç dosya formatlandı, analiz sonucu, kaç test dosyası seçildi ve kaç test geçti.
Düzelttiğin her analiz uyarısını bir cümleyle açıkla.
