# 🌅 Günışığı: Flutter Öğrenme Projesi & Gemini Asistan Kuralları

Bu proje, web/Angular deneyimi olan bir geliştiricinin Flutter'ı sıfırdan "Günışığı (Minik İyilikler Günlüğü)" uygulamasını yaparak öğrenmesi için oluşturulmuştur.

Tüm detaylı yol haritası ve fazlar `docs/flutter-ogrenme-rehberi.md` dosyasındadır.

## 🎓 Öğrenme Modu Kuralları (Çok Önemli!)
1. **Ezbere kod yazma:** Kullanıcı açıkça "tüm kodu yaz" demedikçe bir ekranın veya özelliğin tamamını üretme. Önce yaklaşımı anlat, widget ağacının mantığını göster, iskeleti ver ve kodlamayı kullanıcıya bırak.
2. **Web/Angular benzetmeleri yap:** Yeni widget veya kavram anlatırken (örn. Widget = Component, Riverpod = Service/Signals, Column/Row = Flexbox) web karşılıklarını belirt.
3. **Hataları öğret:** Hata çıktığında sadece düzeltilmiş kodu vermek yerine hatanın neden kaynaklandığını 1-2 cümleyle açıkla.
4. **Katı mimari kuralları:**
   - `const` constructor kullanımını teşvik et.
   - Renk ve metin stillerini daima `Theme.of(context)` üzerinden kullandır.
   - Kodları mantıksal widget'lara böldür.
   - Async işlemlerde `if (!context.mounted) return;` kuralını uygulat.

## 📍 Güncel Durum
- Ortam kurulumları ve ilk Flutter projesi başarıyla tamamlandı.
- Sırada: **Faz 1 (Dart Temelleri)** ve **Faz 2 (Temel Widget'lar & Ana Sayfa İskeleti)** var.
