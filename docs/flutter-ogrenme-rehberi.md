# 📱 Flutter Öğrenme Rehberi: "Kadro" KPSS Uygulaması

> **Not:** Bu doküman Peyoto projesinden bağımsızdır. Web tarafında junior seviyedeki bir geliştiricinin Flutter'ı sıfırdan, gerçek bir uygulama yaparak öğrenmesi için hazırlanmış kişisel bir yol haritasıdır.
>
> Proje önce "Günışığı" adlı bir günlük uygulaması olarak başladı, Faz 3 civarında KPSS hazırlık uygulaması **Kadro**'ya dönüştü. Eski hali Git geçmişinde duruyor.

---

## 🎯 Proje Fikri: Kadro, KPSS Lisans Hazırlık Uygulaması

**Tek cümleyle:** KPSS Lisans (GY-GK) adaylarının konu testi çözdüğü, bilgi kartlarıyla tekrar yaptığı, yanlışlarını biriktirip yeniden çözdüğü ve süreli denemelerle netini takip ettiği bir çalışma uygulaması.

**Neden bu fikir?**

- **Gerçek bir ihtiyaç:** Bitirdiğinde sen ya da çevrendeki adaylar gerçekten kullanabilir.
- **Her Flutter konusunu kapsar:** Liste, form ve seçim (soru çözme), navigasyon (ders → konu → test), yerel veritabanı (yanlış defteri), state management (günlük hedef), zamanlayıcı (deneme), grafik (netler), bildirim (hatırlatma), test (net hesabı), yayın.
- **Büyümeye açık:** Önce tek ders, tek test türü; sonra yeni çalışma türleri tek tek eklenir.
- **Portfolyoya uygun:** Küçük ama "bitmiş" ve işe yarayan bir ürün, yarım kalmış büyük bir projeden daha değerlidir.

**Sınav bilgisi (KPSS Lisans GY-GK):**

| Bölüm | Ders | Soru |
|---|---|---|
| Genel Yetenek | Türkçe | 30 |
| Genel Yetenek | Matematik (geometri dahil) | 30 |
| Genel Kültür | Tarih | 27 |
| Genel Kültür | Coğrafya | 18 |
| Genel Kültür | Vatandaşlık | 9 |
| Genel Kültür | Güncel Bilgiler | 6 |
| **Toplam** | | **120 soru · 130 dakika · 4 yanlış 1 doğruyu götürür** |

> Soru dağılımı ve süre her yıl ÖSYM kılavuzunda yayımlanır. Değişiklik olursa `lib/features/lessons/data/kpss_lessons.dart` dosyasını güncelle.

**Çalışma türleri (nihai hali):**

| Çalışma türü | İçerik |
|---|---|
| Konu testi | Ders → konu seç, 10-20 soruluk test; her sorudan sonra doğru cevap ve açıklama |
| Bilgi kartları | Önünde soru, arkasında cevap; "Biliyorum" / "Tekrar et" |
| Yanlış defteri | Yanlış yapılan sorular otomatik birikir, sonra yalnızca onlar çözülür |
| Deneme sınavı | 120 soru, 130 dakika, sonunda ders bazında net |
| İstatistik | Ders bazında doğru oranı, en zayıf konular, deneme netlerinin gelişimi |
| Günlük hedef ve seri | "Bugün 30 soru" hedefi, üst üste çalışılan gün sayısı, hatırlatma bildirimi |

**Alt menü:** Ana Sayfa · Dersler · Denemeler · İstatistik · Profil

---

## ⚖️ Soru İçeriği ve Telif

ÖSYM'nin çıkmış sorularının telif hakkı ÖSYM'ye aittir. Kendi çalışman için kullanabilirsin ama uygulamayı yayınlarsan izinsiz dağıtmış olursun. Bu yüzden:

- Soruları **kendin yaz** ya da kaynağını belirterek özgün sorular hazırla.
- Başlangıçta her ders için 10-20 soru yeterli. Uygulamanın asıl öğrettiği şey içerik değil, içeriği gösteren yapı.
- Sorular Faz 6'da bir JSON dosyasına taşınacak. Örnek biçim:

```json
{
  "id": "cografya-001",
  "lesson": "cografya",
  "topic": "Türkiye'nin yer şekilleri",
  "text": "Türkiye'nin en yüksek dağı hangisidir?",
  "options": ["Erciyes", "Ağrı Dağı", "Süphan", "Uludağ", "Kaçkar"],
  "answerIndex": 1,
  "explanation": "Ağrı Dağı 5137 metre ile Türkiye'nin en yüksek dağıdır."
}
```

---

## 🧰 Bölüm 0: Neleri İndirmen Lazım? (Windows)

| Araç | Ne işe yarar | Not |
|---|---|---|
| **Flutter SDK** | Flutter + Dart dilinin kendisi | [docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows) |
| **Git** | Flutter kurulumu ve sürüm kontrolü için gerekli | Muhtemelen zaten kurulu |
| **Android Studio** | Android SDK, emülatör ve build araçları | Flutter ve Dart eklentileriyle kod da burada yazılabilir |
| **VS Code** | Kod editörü (opsiyonel) | Eklentiler: **Flutter** ve **Dart** (Dart-Code) |
| **Gerçek Android telefon** (opsiyonel) | Emülatörden çok daha hızlı | Geliştirici seçenekleri > USB hata ayıklama |

> ⚠️ **iOS:** iPhone için uygulama derlemek Mac gerektirir. Windows'ta Android + Web + Windows masaüstü hedeflerini kullanabilirsin. Öğrenme için bu fazlasıyla yeterli.

### Kurulum adımları

1. Flutter SDK zip'ini indir, **boşluk ve Türkçe karakter içermeyen** bir klasöre çıkar (örn. `D:\dev\flutter`).
2. `D:\dev\flutter\bin` yolunu **PATH** ortam değişkenine ekle.
3. Android Studio'yu kur; ilk açılışta **Android SDK**, **SDK Command-line Tools** ve **Android Emulator** bileşenlerini seç.
4. Android Studio > Device Manager'dan bir emülatör oluştur (örn. Pixel, güncel Android sürümü).
5. Lisansları kabul et ve her şeyi kontrol et:

```bash
flutter doctor --android-licenses
```

```bash
flutter doctor
```

Tüm satırlarda ✅ görene kadar (iOS/Xcode satırı hariç) `flutter doctor` çıktısındaki önerileri uygula.

---

## 🤖 Bölüm 0.5: AI Agent Kuralları

Projeyi oluşturduktan hemen sonra, ilk satır kodu yazmadan önce bu kurulum yapıldı. Amaç: AI asistanı (Claude Code) bu projede tutarlı, temiz ve **senin öğrenmeni engellemeyen** kod yazsın.

### Neyi neden böyle seçtik?

İnternette dolaşan hazır "Flutter agent kuralları" şablonları genelde büyük ekipler için yazılmıştır. Öğrenme projesi için ayarlanmış hali:

| Hazır şablondaki öneri | Kararımız | Neden |
|---|---|---|
| `.clinerules`, `.cursorrules` | **`CLAUDE.md` + `.claude/skills/`** | Claude Code `CLAUDE.md` dosyasını her oturumda otomatik okur. Cursor/Cline kullanırsan aynı içeriği onların dosyasına da kopyalarsın. |
| 6 ayrı kural dosyası | **Kısa tek `CLAUDE.md` + 2 skill** | Her zaman geçerli kurallar `CLAUDE.md`'ye, belirli anlarda çalışan iş akışları skill'e. Az ve net kural daha iyi uygulanır. |
| `data / domain / presentation` (Clean Architecture) | **Önce `data / presentation`**, `domain` gerekirse sonra | Önce farkı hissetmen lazım. Net hesabı gibi iş mantığı büyüyünce domain katmanı düşünülebilir. |
| Baştan `freezed` + `json_serializable` + `riverpod_generator` | **Faz 8'e kadar yok** | Kod üretimini anlamadan kullanırsan sihir gibi gelir. Önce `toJson/fromJson`'u elle yaz, sonra otomatiğe geç. |
| "Sabit renk/font yok, `Theme.of(context)` kullan" | **Aynen ✅** | Koyu tema eklerken hayat kurtarır. |
| "Overflow önle: `Expanded`/`Flexible`" | **Aynen ✅**, ama sabit ölçü tamamen yasak değil | İkon, avatar gibi öğelerde sabit boyut normaldir. |
| `pubspec.yaml` koruması, `flutter pub add` | **Aynen ✅** | |
| `context.mounted` kontrolü, `try-catch` | **Aynen ✅** | En sık yapılan iki Flutter hatası. |
| Teslim öncesi `flutter analyze` + `dart format` | **Aynen ✅**, `flutter test` eklendi | |
| *(şablonda yok)* | **Öğrenme modu kuralı eklendi** | AI her şeyi yazarsa sen öğrenemezsin. En önemli kural bu. |

### Kurulan dosyalar

```text
kadro/
├── CLAUDE.md                          # her oturumda okunan kurallar
├── analysis_options.yaml              # linter kuralları
└── .claude/
    └── skills/
        ├── flutter-verify/SKILL.md    # teslim öncesi kontrol
        └── flutter-feature/SKILL.md   # yeni feature iskeleti
```

`CLAUDE.md` ve skill dosyalarının güncel hali proje kökünde. Kurallar projeyle büyür: Faz 6'da klasör yapısı kesinleşince, Faz 8'de Riverpod gelince `CLAUDE.md`'yi güncelle. AI bir hatayı ikinci kez yaparsa o hatayı bir kural cümlesi olarak ekle.

### Kurulum görevleri

- [x] `flutter create` ile projeyi oluştur ve Android Studio'da aç
- [x] `CLAUDE.md` dosyasını oluştur
- [x] İki skill dosyasını oluştur
- [x] `analysis_options.yaml` dosyasını güncelle
- [x] İlk commit: `chore: proje iskeleti ve agent kurallari`

---

## 🧭 Web'den Gelen Biri İçin Kavram Haritası

Angular/web bildiğin için bu eşleştirmeler işini çok kolaylaştırır:

| Web / Angular | Flutter |
|---|---|
| Component | **Widget** |
| HTML + CSS | Widget ağacı (`Column`, `Row`, `Container`, `Padding`...) |
| Flexbox | `Row` / `Column` + `Expanded` / `Flexible` |
| `package.json` / npm | `pubspec.yaml` / `flutter pub add` |
| npmjs.com | [pub.dev](https://pub.dev) |
| Angular Router | `Navigator` / **go_router** |
| Layout component + `<router-outlet>` | `Scaffold` + `AppShell` (`ShellRoute`) |
| Service + RxJS / Signals | **Provider** / **Riverpod** |
| `HttpClient` | `http` / `dio` paketi |
| Promise / async-await | `Future` / async-await (neredeyse aynı) |
| Observable | `Stream` |
| `setInterval` | `Timer.periodic` (deneme sayacı) |
| localStorage | `shared_preferences` |
| `ng serve` + hot reload | `flutter run` + **Hot Reload** (`r`) |

**Mobil isimlendirme:** Web'deki üst menü mobilde alttaki **navigation bar** olur; üstteki bar menü değil, ekranın başlığını gösteren **top app bar**'dır. Mobilde "footer" kavramı yoktur.

**En önemli fikir:** Flutter'da *her şey widget'tır*. Ekran bir widget, buton bir widget, boşluk (`SizedBox`) bile bir widget.

---

## 🗺️ Yol Haritası (Görevler)

Her faz bir öncekinin üzerine kurulur. Her fazın sonunda **çalışan bir uygulaman** olur. Bir fazı bitirmeden diğerine geçme; her faz sonunda Git commit at.

Tahmini süreler, günde 1-2 saat çalışma içindir. `[x]` işaretli maddeler projede yapıldı.

---

### 🟢 Faz 1: Dart Temelleri (3-5 gün)

**Amaç:** Flutter'a geçmeden dili tanımak. Kurulum gerekmez, tarayıcıda [dartpad.dev](https://dartpad.dev) yeterli.

- [ ] Değişkenler: `var`, `final`, `const`, tipler (`int`, `double`, `String`, `bool`)
- [ ] **Null safety:** `String?`, `!`, `??`, `?.` (Flutter'da en çok hata buradan çıkar). Boş bırakılan soru için `int? selectedIndex` iyi bir örnek.
- [ ] Koleksiyonlar: `List`, `Map`, `Set`; `map`, `where`, `fold`, `forEach`
- [ ] Fonksiyonlar: isimli parametreler `{required String text}`, ok fonksiyonları `=>`
- [ ] Sınıflar: constructor, isimli constructor, `factory`, getter
- [ ] `enum` (cevap durumu için: doğru, yanlış, boş)
- [ ] `Future`, `async` / `await`

**Mini görev:** DartPad'de bir `Question` sınıfı yaz: `text`, `options` (5 şık), `answerIndex`. 5 soru oluştur, bir de "kullanıcının cevapları" listesi yap (bazıları `null`, yani boş). Doğru, yanlış ve boş sayısını bul, **net**'i hesapla (`doğru - yanlış / 4`) ve konsola yazdır.

---

### 🟢 Faz 2: İlk Proje ve Widget Mantığı (3-4 gün)

**Amaç:** Projeyi oluşturmak, yapıyı tanımak, ilk ekranı çizmek.

```bash
flutter run
```

- [x] Proje klasörlerini incele: `lib/main.dart`, `pubspec.yaml`, `android/`, `test/`
- [x] Hazır sayaç uygulamasını çalıştır, **Hot Reload** (`r`) ve **Hot Restart** (`R`) farkını gör
- [x] `main.dart` içini temizle, kendi `MaterialApp` + `Scaffold` + `AppBar` yapını kur
- [x] **StatelessWidget** ile statik bir ana sayfa yap
- [x] Temel widget'lar: `Text`, `Icon`, `Container`, `Padding`, `SizedBox`, `Center`
- [ ] `Image` ile bir görsel göster (ör. uygulama logosu)

**Çıktı:** Başlığı "Kadro" olan, karşılama mesajı bulunan ana sayfa.

---

### 🟢 Faz 3: Layout ve Güzel Bir Arayüz (4-5 gün)

**Amaç:** Flexbox bilgini Flutter'a taşımak, uygulamayı göze hoş göstermek.

- [x] `Row`, `Column`, `Expanded` ile yerleşim
- [x] `Card`, `ListTile` ile ders listesi (Genel Yetenek / Genel Kültür grupları)
- [x] `ThemeData` ile renk paleti (`lib/app/theme.dart`, açık ve koyu tema)
- [x] Kendi widget'larını çıkar: `PageHeader`, `SectionTitle`
- [ ] `Stack` ile bir şey dene (ör. ders kartının köşesine "yeni" rozeti)
- [ ] `ListView.builder` ile uzun bir liste (bir dersin 20 konusu)
- [ ] `google_fonts` paketi ile yazı tipi (`flutter pub add google_fonts`)
- [ ] Soru ekranının **görünümünü** çiz: üstte soru metni, altta A-E şıkları (`OptionTile` widget'ı). Henüz tıklanmasın.

**Çıktı:** Sahte verilerle dolu ana sayfa, ders listesi ve statik bir soru ekranı.

---

### 🟡 Faz 4: Etkileşim ve State (4-5 gün)

**Amaç:** Kullanıcının soru çözebilmesi.

- [x] **StatefulWidget** ve `setState` mantığı (alt menüde seçili sekme)
- [ ] Soru ekranı: şıka dokununca seçili görünsün
- [ ] "Kontrol et": doğru şık yeşil, yanlış şık kırmızı, altında açıklama
- [ ] "Sonraki soru" ile test ilerlesin; üstte "3 / 10" göstergesi
- [ ] Test sonunda özet: doğru, yanlış, boş ve **net**
- [ ] Bilgi kartı: dokununca ön yüzden arka yüze dönsün (`AnimatedSwitcher`)
- [ ] `SnackBar` ile kısa geri bildirim ("Yanlış defterine eklendi")

**Çıktı:** Bellekteki örnek sorularla çözülebilen bir konu testi ve bilgi kartları.

---

### 🟡 Faz 5: Navigasyon (2-3 gün)

**Amaç:** Ders → konu → test akışı.

- [x] Alt menü: `NavigationBar` (Ana Sayfa, Dersler, Denemeler, İstatistik, Profil), şimdilik `setState` + sayfa listesiyle
- [ ] Önce temel: `Navigator.push` / `Navigator.pop` ile dersten konu listesine geçiş
- [ ] Sonra **go_router** paketine geç (Angular Router'a çok benzer)
- [ ] Rotalar: `/`, `/lessons`, `/lessons/:lessonId`, `/quiz/:topicId`, `/exams`, `/stats`, `/profile`
- [ ] `AppShell`'i `ShellRoute` (ya da `StatefulShellRoute`) ile bağla; alt menü rotaya göre seçilsin
- [ ] Sayfalar arası veri taşıma (test ekranına konu id'si gönderme)

**Çıktı:** Bir derse dokununca konuları, konuya dokununca testi açan uygulama.

---

### 🟡 Faz 6: Kod Organizasyonu ve İçerik (2-3 gün)

**Amaç:** Proje büyümeden düzeni kurmak, soruları koddan ayırmak.

```text
lib/
├── main.dart
├── app/            # AppShell, tema, router
├── core/           # net hesabı gibi ortak yardımcılar
├── features/
│   ├── home/
│   ├── lessons/      # dersler ve konular
│   ├── quiz/         # konu testi ekranı
│   ├── flashcards/   # bilgi kartları
│   ├── mistakes/     # yanlış defteri
│   ├── exams/        # deneme sınavı
│   ├── stats/
│   └── profile/
└── shared/
    └── widgets/    # PageHeader, SectionTitle, OptionTile...
```

- [ ] Her feature içinde `data/` (model, repository) ve `presentation/` (ekran, widget) olsun
- [ ] Modeller: `Lesson`, `Topic`, `Question`, `QuizResult`
- [ ] `Question`'a `toJson()` / `fromJson()` ekle
- [ ] Soruları `assets/questions/*.json` dosyalarına taşı, `pubspec.yaml`'da `assets` olarak tanımla, `rootBundle.loadString` ile oku
- [ ] Her ders için en az 10 özgün soru yaz (bkz. Soru İçeriği ve Telif)
- [ ] `CLAUDE.md` içindeki klasör kuralını güncelle
- [ ] `flutter analyze` çalıştır, uyarıları temizle

---

### 🟠 Faz 7: Kalıcı Veri (Yerel Depolama) (4-5 gün)

**Amaç:** Uygulama kapansa da ilerleme kaybolmasın.

- [ ] **shared_preferences** ile basit ayarlar: günlük hedef (ör. 30 soru), tema tercihi
- [ ] Çözülen soruları kaydetmek için bir yerel veritabanı seç ve öğren:
  - **sqflite**: SQL biliyorsan en tanıdık olanı (öneri)
  - **Hive CE**: anahtar-değer tabanlı, kurulumu çok basit
- [ ] `AttemptRepository`: hangi soru, hangi şık, doğru mu, ne zaman
- [ ] **Yanlış defteri:** yanlış cevaplanan sorular listesi; doğru çözülünce defterden çıksın
- [ ] Defterden kaydırarak çıkarma (`Dismissible`) + onay dialog'u
- [ ] UI'ı doğrudan veritabanına değil, repository'ye bağla
- [ ] Yükleniyor durumu: `FutureBuilder` + `CircularProgressIndicator`

**Çıktı:** Kapatıp açınca ilerlemeyi ve yanlışları hatırlayan gerçek bir uygulama. 🎉 *Burası ilk büyük kilometre taşın.*

---

### 🟠 Faz 8: State Management (4-6 gün)

**Amaç:** `setState` ile her yere veri taşıma derdinden kurtulmak.

- [ ] Sorunu hisset: testte soru çözünce ana sayfadaki "bugünkü hedef" neden kendiliğinden güncellenmiyor?
- [ ] **Riverpod** (`flutter_riverpod`) öğren. Angular servislerine en yakın mantık budur.
  - `Provider`, `NotifierProvider`, `FutureProvider`
  - `ConsumerWidget`, `ref.watch` vs `ref.read`
- [ ] `AttemptsNotifier`: çözülen soruları yönetsin
- [ ] Bugün çözülen soru sayısı ve seri (art arda çalışılan gün) ayrı provider'larda
- [ ] **Deneme sınavı:** 130 dakikalık geri sayım (`Timer.periodic`), süre bitince sınav otomatik bitsin
- [ ] Tema (açık/koyu) ayarını provider ile tüm uygulamaya yay

> Alternatif: Riverpod zor gelirse önce daha basit olan `provider` paketiyle başla, sonra geç.

**Çıktı:** Her ekranın otomatik senkron olduğu, temiz state yapısı ve çalışan bir deneme sınavı.

---

### 🔵 Faz 9: İnternetten Veri (API) (3-4 gün)

**Amaç:** Soru bankasını uygulamayı güncellemeden büyütebilmek.

- [ ] Soru JSON'larını internette bir yere koy (ör. kendi GitHub deposunda ayrı bir klasör ya da Firebase)
- [ ] `http` (veya `dio`) paketiyle indir, `Question.fromJson` ile modele çevir
- [ ] 3 durumu ele al: **yükleniyor**, **hata** (internet yok), **başarılı**
- [ ] İndirilen soruları yerelde sakla; internet yoksa uygulamaya gömülü sorularla çalış
- [ ] **Güncel Bilgiler** dersi için ayrı, sık güncellenen bir dosya
- [ ] Android internet izni: `android/app/src/main/AndroidManifest.xml` içinde `INTERNET` izni (release build için şart)

**Çıktı:** Yeni soru eklemek için uygulama güncellemesi gerektirmeyen, çevrimdışı da çalışan soru bankası.

---

### 🔵 Faz 10: İstatistik ve Grafik (2-3 gün)

- [ ] **fl_chart** ile ders bazında doğru oranı (bar grafik)
- [ ] Son 7 günde çözülen soru sayısı (çizgi grafik)
- [ ] En zayıf 3 konu kartı
- [ ] Deneme netlerinin gelişimi
- [ ] (Opsiyonel) Çalışılan günleri gösteren takvim (`table_calendar`)

---

### 🔵 Faz 11: Bildirimler (2-3 gün)

- [ ] **flutter_local_notifications** ile günlük hatırlatma: "Bugünkü 30 sorunu çözdün mü?"
- [ ] Profil'den bildirim saatini seçme (`showTimePicker`)
- [ ] Android 13+ bildirim izni isteme

---

### 🟣 Faz 12: Cilalama (3-4 gün)

**Amaç:** "Ödev projesi" görüntüsünden "gerçek uygulama" görüntüsüne geçiş.

- [ ] Koyu temayı her ekranda kontrol et
- [ ] Animasyonlar: doğru cevapta küçük bir kutlama, `Hero` ile kart geçişleri
- [ ] Boş durum ekranları: "Yanlış defterin boş, harika gidiyorsun!"
- [ ] Uygulama ikonu: `flutter_launcher_icons`
- [ ] Açılış ekranı: `flutter_native_splash`
- [ ] Tablette alt menü yerine yanda `NavigationRail`
- [ ] Erişilebilirlik: yazı boyutu büyütülünce taşma var mı? Uzun soru metinleri kaydırılabiliyor mu?

---

### 🟣 Faz 13: Test (2-3 gün)

- [x] **Unit test:** ders listesinin toplam 120 soru olduğu
- [x] **Widget test:** alt menüden sekmeler arası geçiş
- [ ] **Unit test:** net hesabı (4 yanlış 1 doğruyu götürür; boşlar etkilemez)
- [ ] **Unit test:** seri hesabı ve `Question.fromJson` / `toJson`
- [ ] **Widget test:** şık seçilmeden "Kontrol et" butonu pasif mi?
- [ ] **Widget test:** deneme süresi bitince sınav bitiyor mu? (`fakeAsync`)
- [ ] Testleri çalıştır:

```bash
flutter test
```

---

### 🏁 Faz 14: Yayın (2-3 gün)

- [x] Uygulama adı ve paket adı: **Kadro**, `com.omer.kadro`
- [ ] Sürüm numarası (`pubspec.yaml` → `version`)
- [ ] Soruların tamamının özgün olduğunu kontrol et (ÖSYM sorusu yok)
- [ ] İmzalama anahtarı (keystore) oluştur. **Bu dosyayı ve şifresini asla kaybetme ve Git'e ekleme.**
- [ ] Release build al:

```bash
flutter build appbundle --release
```

- [ ] Kendi telefonuna kur ve en az bir hafta gerçekten çalış, hataları not al
- [ ] (Opsiyonel) Google Play Console hesabı açıp yayınla (tek seferlik ücretli). Alternatif: APK'yı GitHub Releases'e koy.
- [ ] GitHub README: ekran görüntüleri, özellik listesi, kullanılan paketler

---

### 🚀 Bonus Fazlar (İleri Seviye)

İstersen proje bittikten sonra:

- [ ] **Aralıklı tekrar:** bilgi kartları için Leitner kutuları (bilinen kart daha seyrek gelsin)
- [ ] **Konu özetleri:** her konu için kısa, Markdown ile yazılmış anlatım (`flutter_markdown`)
- [ ] **Bulut senkronizasyonu:** Firebase (Auth + Firestore) ya da kendi Node.js backend'in
- [ ] **Giriş sistemi:** e-posta / Google ile giriş
- [ ] **Ana ekran widget'ı:** telefonda günlük hedef ve seri (`home_widget`)
- [ ] **Diğer sınavlar:** Önlisans, Ortaöğretim, Eğitim Bilimleri
- [ ] **CI:** GitHub Actions ile her push'ta `flutter analyze` + `flutter test`
- [ ] **Native tekrar:** uygulamanın küçük bir parçasını Kotlin + Jetpack Compose ile yeniden yaz

---

## 📦 Paket Özeti

| Faz | Paket | Amaç |
|---|---|---|
| 3 | `google_fonts` | Yazı tipi |
| 5 | `go_router` | Navigasyon |
| 7 | `shared_preferences` | Basit ayarlar |
| 7 | `sqflite` veya `hive_ce` | Çözülen sorular, yanlış defteri |
| 8 | `flutter_riverpod` | State management |
| 9 | `http` veya `dio` | Soru bankası indirme |
| 10 | `fl_chart`, `table_calendar` | Grafik, takvim |
| 11 | `flutter_local_notifications` | Hatırlatma |
| 12 | `flutter_launcher_icons`, `flutter_native_splash` | İkon, açılış ekranı |

Paket eklemek için:

```bash
flutter pub add go_router
```

> Paket seçerken pub.dev'de **Likes**, **Pub Points**, **son güncelleme tarihi** ve **Flutter Favorite** rozetine bak. Yeni paket eklemeden önce `CLAUDE.md` gereği önce konuş.

---

## 📚 Kaynaklar

- **Resmi dokümantasyon:** [docs.flutter.dev](https://docs.flutter.dev) (özellikle "Learn" ve "Cookbook" bölümleri)
- **Dart dili turu:** [dart.dev/language](https://dart.dev/language)
- **DartPad:** [dartpad.dev](https://dartpad.dev) (kurulumsuz deneme)
- **Material Design 3 bileşenleri:** [m3.material.io/components](https://m3.material.io/components)
- **Widget of the Week:** Flutter'ın resmi YouTube kanalındaki kısa widget videoları
- **Riverpod:** [riverpod.dev](https://riverpod.dev)
- **Paketler:** [pub.dev](https://pub.dev)
- **KPSS kılavuzu:** [osym.gov.tr](https://www.osym.gov.tr) (soru dağılımı ve süre için)

---

## 💡 Altın Kurallar

1. **Her fazın sonunda çalışan bir uygulama olsun.** Yarım bırakılmış 5 özellik yerine bitmiş 1 özellik.
2. **Her faz sonunda commit at.** `git commit -m "faz 4: konu testi ekrani"`
3. **Kopyala-yapıştır değil, yaz.** Kodu elle yazmak öğrenmenin yarısıdır.
4. **Hata mesajını sonuna kadar oku.** Flutter hata mesajları genellikle çözümü de söyler.
5. **`flutter doctor` ve `flutter analyze` en iyi arkadaşın.**
6. **Takılınca 30 dakika kuralı:** 30 dakika uğraş, çözemezsen dokümantasyona, sonra topluluğa / yapay zekaya sor.
7. **Uygulamayı kendin kullan.** Her gün 10 soru çözerek test et; en iyi hata raporu kullanıcıdan gelir.

---

**Toplam tahmini süre:** Günde 1-2 saatle yaklaşık **10-12 hafta** (bonus fazlar hariç).
