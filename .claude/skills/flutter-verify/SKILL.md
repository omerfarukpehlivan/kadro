---
name: flutter-verify
description: Flutter kodunda değişiklik yaptıktan sonra, işi teslim etmeden önce analiz, format ve testleri çalıştırır.
---

Sırasıyla çalıştır:

1. `dart format lib test`
2. `flutter analyze`: hata veya uyarı varsa düzelt ve tekrar çalıştır; 0 sorun olana kadar.
3. `flutter test`: test klasöründe test varsa. Kırılan test varsa nedenini bul ve düzelt; testi silerek veya gevşeterek geçirme.

Sonunda bana kısa bir rapor ver: kaç dosya formatlandı, analiz sonucu, kaç test geçti.
Düzelttiğin her analiz uyarısını bir cümleyle açıkla (öğreniyorum).
