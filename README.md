# 🌅 Günışığı

**Minik İyilikler Günlüğü.** Her gün sana iyi gelen 3 şeyi ve o günkü ruh halini kaydettiğin, sade ve sıcak bir mobil günlük uygulaması.

![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Android-3DDC84?logo=android&logoColor=white)
![Durum](https://img.shields.io/badge/durum-geli%C5%9Ftiriliyor-orange)

---

## 📖 Proje hakkında

Günışığı, Angular ile web geliştirme deneyimi olan bir geliştiricinin **Flutter ve mobil uygulama geliştirmeyi sıfırdan öğrenmek** için yaptığı bir projedir. Her özellik, öğrenme rehberindeki bir faza karşılık gelir. Amaç hem çalışan bir uygulama çıkarmak hem de her adımda Flutter'ın neden öyle çalıştığını anlamaktır.

Yol haritası ve fazların detayı: [`docs/flutter-ogrenme-rehberi.md`](docs/flutter-ogrenme-rehberi.md)

## ✨ Şu an neler var

- Material 3 ve amber tonlarından üretilen tema
- Sabit üst bar ve alt menüden oluşan uygulama kabuğu (`MainLayout`)
- Alt menüyle 4 sayfa arasında geçiş, üst bar başlığı sayfaya göre değişiyor
- Sayfalar arasında ortak kullanılan `PageHeader` widget'ı
- Sayfa geçişlerini kontrol eden widget testi

| Sekme | Ne gösteriyor |
|---|---|
| 🏠 **Ana Sayfa** | Karşılama, günlük seri rozeti ve kayıt ekleme butonu |
| 🕘 **Geçmiş** | Önceki günlerin kayıt kartları *(şimdilik örnek veri)* |
| 📊 **İstatistik** | Toplam kayıt, seri ve en sık ruh hali *(şimdilik örnek veri)* |
| ⚙️ **Ayarlar** | Tema, hatırlatma ve uygulama bilgisi *(şimdilik sadece görünüm)* |

## 🗂️ Proje yapısı

Kod **feature-first** düzende: her özellik kendi klasöründe, ortak parçalar `app/` ve `shared/` altında.

```text
lib/
├── main.dart                     # Giriş noktası: tema ve MaterialApp
├── app/
│   ├── main_layout.dart          # Uygulama kabuğu: üst bar + sayfa + alt menü
│   └── widgets/
│       ├── app_navbar.dart       # Üst bar
│       └── app_footer.dart       # Alt menü (NavigationBar)
├── features/
│   ├── home/presentation/        # Ana Sayfa
│   ├── history/presentation/     # Geçmiş
│   ├── stats/presentation/       # İstatistik
│   └── settings/presentation/    # Ayarlar
└── shared/
    └── widgets/
        └── page_header.dart      # Sayfa başlığı bloğu
```

## 🧭 Sayfa geçişi nasıl çalışıyor

`MainLayout` bir `StatefulWidget`. Seçili sekmenin numarasını (`_selectedIndex`) tutuyor ve `Scaffold`'un ortasına o numaradaki sayfayı koyuyor:

```dart
static const List<Widget> _pages = [
  HomeScreen(),
  HistoryScreen(),
  StatsScreen(),
  SettingsScreen(),
];

// build() içinde
body: _pages[_selectedIndex],
```

Alt menüde bir sekmeye dokunulunca `setState` ile numara güncelleniyor, `build()` yeniden çalışıyor ve ortadaki sayfa değişiyor. Üst bar ve alt menü `Scaffold`'un kendi yuvalarında durduğu için yerinde kalıyor. Angular'daki layout component + `<router-outlet>` yapısının basit bir karşılığı. İleride (Faz 5) bunun yerine `go_router` kullanılacak.

## 🚀 Çalıştırma

**Gerekenler:** [Flutter SDK](https://docs.flutter.dev/get-started/install) ve bir Android emülatörü ya da gerçek cihaz.

```bash
git clone https://github.com/omerfarukpehlivan/gunisigi.git
cd gunisigi
flutter pub get
flutter run
```

Android Studio kullanıyorsan projeyi aç, üstteki cihaz listesinden emülatörü seç ve **Run ▶**'a bas.

### Kontroller

```bash
dart format lib test   # kodu biçimlendir
flutter analyze        # statik analiz
flutter test           # testleri çalıştır
```

## 🗺️ Yol haritası

| Faz | Konu | Durum |
|---|---|---|
| 1 | Dart temelleri | 🚧 |
| 2 | İlk proje ve widget mantığı | ✅ |
| 3 | Layout ve güzel bir arayüz | 🚧 |
| 4 | Etkileşim ve state (form, kayıt ekleme) | ⏳ |
| 5 | Navigasyon (`go_router`) | ⏳ |
| 6 | Kod organizasyonu | ⏳ |
| 7 | Kalıcı veri (yerel depolama) | ⏳ |
| 8 | State management | ⏳ |
| 9 | İnternetten veri (API) | ⏳ |
| 10 | İstatistik ve grafik | ⏳ |
| 11 | Bildirimler | ⏳ |
| 12 | Cilalama | ⏳ |
| 13 | Test | ⏳ |
| 14 | Yayın | ⏳ |

✅ tamamlandı · 🚧 devam ediyor · ⏳ sırada

## 🔁 Angular'dan Flutter'a kısa sözlük

| Angular / Web | Flutter |
|---|---|
| Component | `Widget` |
| Template | `build()` metodu |
| `signal.set()` / change detection | `setState()` |
| `input()` / `output()` | Constructor parametresi / callback (`ValueChanged<T>`) |
| `<ng-content>` | `child` / `children` |
| `<router-outlet>` | `Navigator`, `go_router` |
| `display: flex` | `Row`, `Column` |
| CSS değişkenleriyle tema | `ThemeData` + `Theme.of(context)` |

## 👤 Geliştirici

**Ömer Faruk Pehlivan** · [@omerfarukpehlivan](https://github.com/omerfarukpehlivan)

Bu bir kişisel öğrenme projesidir; öneri ve geri bildirimlere açığım.
