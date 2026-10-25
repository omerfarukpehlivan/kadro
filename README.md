# 🎯 Kadro

**KPSS Lisans hazırlık uygulaması.** Konu testi çöz, bilgi kartlarıyla tekrar et, yanlışlarını biriktirip yeniden çöz, süreli denemelerle netini takip et.

![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Android-3DDC84?logo=android&logoColor=white)
![Durum](https://img.shields.io/badge/durum-geli%C5%9Ftiriliyor-orange)

---

## 📖 Proje hakkında

Kadro, Angular ile web geliştirme deneyimi olan bir geliştiricinin **Flutter ve mobil uygulama geliştirmeyi sıfırdan öğrenmek** için yaptığı bir projedir. Hedef kitle KPSS Lisans (Genel Yetenek - Genel Kültür) adayları. Her özellik, öğrenme rehberindeki bir faza karşılık gelir.

Yol haritası ve fazların detayı: [`docs/flutter-ogrenme-rehberi.md`](docs/flutter-ogrenme-rehberi.md)

> Proje "Günışığı" adlı bir günlük uygulaması olarak başladı ve KPSS uygulamasına dönüştü. Eski hali Git geçmişinde.

## 📚 Sınav kapsamı

| Bölüm | Dersler | Soru |
|---|---|---|
| Genel Yetenek | Türkçe (30), Matematik (30) | 60 |
| Genel Kültür | Tarih (27), Coğrafya (18), Vatandaşlık (9), Güncel Bilgiler (6) | 60 |
| **Toplam** | 130 dakika · 4 yanlış 1 doğruyu götürür | **120** |

## ✨ Çalışma türleri

| Tür | Ne yapar | Durum |
|---|---|---|
| 📝 **Konu testi** | Ders → konu seç, test çöz, her sorudan sonra açıklamayı gör | ⏳ |
| 🃏 **Bilgi kartları** | Önünde soru, arkasında cevap; hızlı tekrar | ⏳ |
| 📕 **Yanlış defteri** | Yanlış yapılan sorular birikir, sonra yalnızca onlar çözülür | ⏳ |
| ⏱️ **Deneme sınavı** | 120 soru, 130 dakika, sonunda ders bazında net | ⏳ |
| 📊 **İstatistik** | Ders bazında doğru oranı ve en zayıf konular | ⏳ |
| 🔥 **Günlük hedef** | Günlük soru hedefi, seri ve hatırlatma | ⏳ |

## 🧱 Şu an neler var

- Alt menülü uygulama kabuğu (`AppShell`): **Ana Sayfa · Dersler · Denemeler · İstatistik · Profil**
- Ana sayfada günlük hedef kartı ve çalışma türleri
- Dersler sekmesinde 6 ders, Genel Yetenek ve Genel Kültür olarak gruplu
- Denemeler sekmesinde sınav düzeni
- Lacivert tonlarında açık ve koyu tema
- Widget testi ve ders listesi için unit test

Sorular henüz eklenmedi; ekranlar iskelet halinde.

## 🗂️ Proje yapısı

Kod **feature-first** düzende: her özellik kendi klasöründe, ortak parçalar `app/` ve `shared/` altında.

```text
lib/
├── main.dart                         # Giriş noktası: MaterialApp
├── app/
│   ├── app_shell.dart                # Uygulama kabuğu: üst bar + sayfa + alt menü
│   ├── theme.dart                    # Açık ve koyu tema
│   └── widgets/
│       ├── app_top_bar.dart          # Üst bar (top app bar)
│       └── app_navigation_bar.dart   # Alt menü (navigation bar)
├── features/
│   ├── home/presentation/            # Ana Sayfa
│   ├── lessons/
│   │   ├── data/                     # KPSS dersleri ve soru sayıları
│   │   └── presentation/             # Dersler
│   ├── exams/presentation/           # Denemeler
│   ├── stats/presentation/           # İstatistik
│   └── profile/presentation/         # Profil
└── shared/
    └── widgets/                      # PageHeader, SectionTitle
```

## 🧭 Sayfa geçişi nasıl çalışıyor

`AppShell` bir `StatefulWidget`. Seçili sekmenin numarasını (`_selectedIndex`) tutuyor ve `Scaffold`'un ortasına o numaradaki sayfayı koyuyor:

```dart
static const List<Widget> _pages = [
  HomeScreen(),
  LessonsScreen(),
  ExamsScreen(),
  StatsScreen(),
  ProfileScreen(),
];

// build() içinde
body: _pages[_selectedIndex],
```

Alt menüde bir sekmeye dokunulunca `setState` ile numara güncelleniyor, `build()` yeniden çalışıyor ve ortadaki sayfa değişiyor. Üst bar ve alt menü `Scaffold`'un kendi yuvalarında durduğu için yerinde kalıyor. Angular'daki layout component + `<router-outlet>` yapısının basit bir karşılığı. Faz 5'te bunun yerine `go_router` kullanılacak.

## 🚀 Çalıştırma

**Gerekenler:** [Flutter SDK](https://docs.flutter.dev/get-started/install) ve bir Android emülatörü ya da gerçek cihaz.

```bash
git clone https://github.com/omerfarukpehlivan/kadro.git
cd kadro
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

| Faz | Konu | KPSS'de karşılığı | Durum |
|---|---|---|---|
| 1 | Dart temelleri | `Question` sınıfı, net hesabı | 🚧 |
| 2 | İlk proje ve widget mantığı | Ana sayfa | ✅ |
| 3 | Layout ve arayüz | Ders listesi, statik soru ekranı | 🚧 |
| 4 | Etkileşim ve state | Soru çözme, bilgi kartı | ⏳ |
| 5 | Navigasyon | Ders → konu → test | 🚧 |
| 6 | Kod organizasyonu | Sorular JSON dosyalarında | ⏳ |
| 7 | Kalıcı veri | Yanlış defteri, ilerleme | ⏳ |
| 8 | State management | Günlük hedef, deneme sayacı | ⏳ |
| 9 | İnternetten veri | Uzaktan soru bankası | ⏳ |
| 10 | İstatistik ve grafik | Ders bazında netler | ⏳ |
| 11 | Bildirimler | Günlük hatırlatma | ⏳ |
| 12 | Cilalama | Animasyon, ikon, tablet | ⏳ |
| 13 | Test | Net hesabı testleri | 🚧 |
| 14 | Yayın | Play Store | ⏳ |

✅ tamamlandı · 🚧 devam ediyor · ⏳ sırada

## ⚖️ İçerik

Uygulamadaki sorular özgündür. ÖSYM'nin çıkmış sorularının telif hakkı ÖSYM'ye aittir ve bu projede kullanılmaz.

## 🔁 Angular'dan Flutter'a kısa sözlük

| Angular / Web | Flutter |
|---|---|
| Component | `Widget` |
| Template | `build()` metodu |
| `signal.set()` / change detection | `setState()` |
| `input()` / `output()` | Constructor parametresi / callback (`ValueChanged<T>`) |
| `<ng-content>` | `child` / `children` |
| `<router-outlet>` | `Navigator`, `go_router` |
| `@for` | Liste içinde `for` |
| `display: flex` | `Row`, `Column` |
| CSS değişkenleriyle tema | `ThemeData` + `Theme.of(context)` |

## 👤 Geliştirici

**Ömer Faruk Pehlivan** · [@omerfarukpehlivan](https://github.com/omerfarukpehlivan)

Bu bir kişisel öğrenme projesidir; öneri ve geri bildirimlere açığım.
