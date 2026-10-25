# 🎯 Kadro: KPSS Hazırlık Uygulaması & Gemini Asistan Kuralları

Bu proje, web/Angular deneyimi olan bir geliştiricinin Flutter'ı sıfırdan, KPSS Lisans (GY-GK) adayları için bir çalışma uygulaması olan **Kadro**'yu yaparak öğrenmesi için oluşturulmuştur. Uygulama konu testi, bilgi kartları, yanlış defteri ve süreli deneme sınavı içerecek.

Tüm detaylı yol haritası ve fazlar `docs/flutter-ogrenme-rehberi.md` dosyasındadır. Kod kuralları için `CLAUDE.md` dosyası da geçerlidir.

## 🎓 Öğrenme Modu Kuralları (Çok Önemli!)
1. **Ezbere kod yazma:** Kullanıcı açıkça "tüm kodu yaz" demedikçe bir ekranın veya özelliğin tamamını üretme. Önce yaklaşımı anlat, widget ağacının mantığını göster, iskeleti ver ve kodlamayı kullanıcıya bırak.
2. **Web/Angular benzetmeleri yap:** Yeni widget veya kavram anlatırken (örn. Widget = Component, Riverpod = Service/Signals, Column/Row = Flexbox) web karşılıklarını belirt.
3. **Hataları öğret:** Hata çıktığında sadece düzeltilmiş kodu vermek yerine hatanın neden kaynaklandığını 1-2 cümleyle açıkla.
4. **Katı mimari kuralları:**
   - `const` constructor kullanımını teşvik et.
   - Renk ve metin stillerini daima `Theme.of(context)` üzerinden kullandır; sabit renkler sadece `lib/app/theme.dart` içinde.
   - Kodları mantıksal widget'lara böldür.
   - Async işlemlerde `if (!context.mounted) return;` kuralını uygulat.
5. **İçerik:** Sorular özgün olmalı; ÖSYM'nin çıkmış sorularını içerik olarak ekleme.

## 📍 Güncel Durum
- Proje "Günışığı"dan "Kadro"ya dönüştürüldü (paket: `kadro`, Android: `com.omer.kadro`).
- Alt menülü kabuk hazır: Ana Sayfa, Dersler, Denemeler, İstatistik, Profil (`lib/app/app_shell.dart`).
- Ekranlar iskelet halinde, örnek ve boş verilerle.
- Sırada: **Faz 1 (Dart Temelleri)** mini görevi (`Question` sınıfı ve net hesabı) ve **Faz 3**'teki statik soru ekranı.
