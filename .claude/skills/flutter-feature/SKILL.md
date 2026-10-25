---
name: flutter-feature
description: Yeni bir feature (ekran) eklenirken klasör iskeletini kurar ve yaklaşımı açıklar.
---

1. Feature adını snake_case olarak al (ör. new_entry).
2. lib/features/<ad>/data/ ve lib/features/<ad>/presentation/ klasörlerini oluştur.
3. presentation/<ad>_screen.dart içinde boş bir ekran oluştur. Alt menü sekmesiyse Scaffold
   kullanma (AppShell'in body'sine girer); sekmeden açılan ayrı bir sayfaysa Scaffold + AppBar kullan.
4. Ekranı AppShell'deki sayfa listesine ya da (Faz 5'ten sonra) router'a ekle.
5. Ekranda hangi widget'ların gerekeceğini ve lib/shared/widgets/ içinden hangilerinin tekrar kullanılabileceğini listele. Gövdeyi yazma; CLAUDE.md'deki öğrenme modu geçerli.
