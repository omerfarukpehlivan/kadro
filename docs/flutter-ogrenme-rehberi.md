# 📱 Flutter Öğrenme Rehberi: "Günışığı" Uygulaması

> **Not:** Bu doküman Peyoto projesinden bağımsızdır. Web tarafında junior seviyedeki bir geliştiricinin Flutter'ı sıfırdan, gerçek bir uygulama yaparak öğrenmesi için hazırlanmış kişisel bir yol haritasıdır.

---

## 🌅 Proje Fikri: Günışığı, Minik İyilikler Günlüğü

**Tek cümleyle:** Her gün sana iyi gelen **3 küçük şeyi** yazdığın, ruh halini seçtiğin, seri (streak) tuttuğun ve her sabah umut veren bir sözle karşılandığın sade bir günlük uygulaması.

**Neden bu fikir?**

- **Öğrenmeyi zorlamaz:** Temel yapı "liste + form + detay sayfası". Her yeni Flutter konusu bu iskelete tek tek eklenir.
- **Her konuyu kapsar:** UI, state, navigasyon, yerel veritabanı, API, grafik, bildirim, test, yayın.
- **İç açıcı:** Kullandıkça kendine iyi gelir; bitirdiğinde telefonunda gerçekten kullanacağın bir uygulaman olur.
- **Portfolyoya uygun:** Küçük ama "bitmiş" bir ürün, yarım kalmış büyük bir projeden daha değerlidir.

**Ana ekranlar (nihai hali):**

| Ekran | İçerik |
|---|---|
| Ana sayfa | Günün sözü, bugünkü kayıt kartı, seri sayacı 🔥 |
| Yeni kayıt | Ruh hali seçimi (😞 😐 🙂 😊 🤩) + 3 güzel şey |
| Geçmiş | Önceki günlerin listesi, dokununca detay |
| İstatistik | Haftalık ruh hali grafiği, toplam gün |
| Ayarlar | Tema (açık/koyu), hatırlatma saati |

---

## 🧰 Bölüm 0: Neleri İndirmen Lazım? (Windows)

| Araç | Ne işe yarar | Not |
|---|---|---|
| **Flutter SDK** | Flutter + Dart dilinin kendisi | [docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows) |
| **Git** | Flutter kurulumu ve sürüm kontrolü için gerekli | Muhtemelen zaten kurulu |
| **Android Studio** | Android SDK, emülatör ve build araçları | Kodu burada yazmak zorunda değilsin, SDK için şart |
| **VS Code** | Kod editörü (önerilen) | Eklentiler: **Flutter** ve **Dart** (Dart-Code) |
| **Gerçek Android telefon** (opsiyonel) | Emülatörden çok daha hızlı | Geliştirici seçenekleri > USB hata ayıklama |

> ⚠️ **iOS:** iPhone için uygulama derlemek Mac gerektirir. Windows'ta Android + Web + Windows masaüstü hedeflerini kullanabilirsin. Öğrenme için bu fazlasıyla yeterli.

### Kurulum adımları

1. Flutter SDK zip'ini indir, **boşluk ve Türkçe karakter içermeyen** bir klasöre çıkar (örn. `C:\dev\flutter`).
2. `C:\dev\flutter\bin` yolunu **PATH** ortam değişkenine ekle.
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

## 🤖 Bölüm 0.5: AI Agent Kuralları (Projeyi Oluşturur Oluşturmaz)

`flutter create gunisigi` komutundan hemen sonra, ilk satır kodu yazmadan önce bu kurulumu yap. Amaç: AI asistanı (Claude Code) bu projede tutarlı, temiz ve **senin öğrenmeni engellemeyen** kod yazsın.

### Neyi neden böyle seçtik?

İnternette dolaşan hazır "Flutter agent kuralları" şablonları genelde büyük ekipler için yazılmıştır. Öğrenme projesi için ayarlanmış hali:

| Hazır şablondaki öneri | Kararımız | Neden |
|---|---|---|
| `.clinerules`, `.cursorrules` | **`CLAUDE.md` + `.claude/skills/`** | Claude Code `CLAUDE.md` dosyasını her oturumda otomatik okur. Cursor/Cline kullanırsan aynı içeriği onların dosyasına da kopyalarsın. |
| 6 ayrı kural dosyası | **Kısa tek `CLAUDE.md` + 2 skill** | Her zaman geçerli kurallar `CLAUDE.md`'ye, belirli anlarda çalışan iş akışları skill'e. Az ve net kural daha iyi uygulanır. |
| `data / domain / presentation` (Clean Architecture) | **Önce `data / presentation`**, `domain` gerekirse sonra | Günlük uygulaması için domain katmanı tören olur; önce farkı hissetmen lazım. |
| Baştan `freezed` + `json_serializable` + `riverpod_generator` | **Faz 8'e kadar yok** | Kod üretimini anlamadan kullanırsan sihir gibi gelir. Önce `toJson/fromJson`'u elle yaz, sonra otomatiğe geç. |
| "Sabit renk/font yok, `Theme.of(context)` kullan" | **Aynen ✅** | Koyu tema eklerken hayat kurtarır. |
| "Overflow önle: `Expanded`/`Flexible`" | **Aynen ✅**, ama sabit ölçü tamamen yasak değil | İkon, avatar gibi öğelerde sabit boyut normaldir. |
| `pubspec.yaml` koruması, `flutter pub add` | **Aynen ✅** | |
| `context.mounted` kontrolü, `try-catch` | **Aynen ✅** | En sık yapılan iki Flutter hatası. |
| Teslim öncesi `flutter analyze` + `dart format` | **Aynen ✅**, `flutter test` eklendi | |
| *(şablonda yok)* | **Öğrenme modu kuralı eklendi** | AI her şeyi yazarsa sen öğrenemezsin. En önemli kural bu. |

### Kurulacak dosyalar

```text
gunisigi/
├── CLAUDE.md                          # her oturumda okunan kurallar
├── analysis_options.yaml              # linter kuralları
└── .claude/
    └── skills/
        ├── flutter-verify/SKILL.md    # teslim öncesi kontrol
        └── flutter-feature/SKILL.md   # yeni feature iskeleti
```

#### 1. `CLAUDE.md`

```markdown
# Günışığı: Flutter öğrenme projesi

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
```

#### 2. `.claude/skills/flutter-verify/SKILL.md`

```markdown
---
name: flutter-verify
description: Flutter kodunda değişiklik yaptıktan sonra, işi teslim etmeden önce analiz, format ve testleri çalıştırır.
---

Sırasıyla çalıştır:

1. `dart format lib test`
2. `flutter analyze`: hata veya uyarı varsa düzelt ve tekrar çalıştır; 0 sorun olana kadar.
3. `flutter test`: test klasöründe test varsa. Kırılan test varsa nedenini bul ve düzelt;
   testi silerek veya gevşeterek geçirme.

Sonunda bana kısa bir rapor ver: kaç dosya formatlandı, analiz sonucu, kaç test geçti.
Düzelttiğin her analiz uyarısını bir cümleyle açıkla (öğreniyorum).
```

#### 3. `.claude/skills/flutter-feature/SKILL.md`

```markdown
---
name: flutter-feature
description: Yeni bir feature (ekran) eklenirken klasör iskeletini kurar ve yaklaşımı açıklar.
---

1. Feature adını snake_case olarak al (ör. new_entry).
2. lib/features/<ad>/data/ ve lib/features/<ad>/presentation/ klasörlerini oluştur.
3. presentation/<ad>_screen.dart içinde boş bir ekran (Scaffold + AppBar) oluştur.
4. Ekranı router'a ekle.
5. Ekranda hangi widget'ların gerekeceğini ve lib/shared/widgets/ içinden hangilerinin
   tekrar kullanılabileceğini listele. Gövdeyi yazma; CLAUDE.md'deki öğrenme modu geçerli.
```

#### 4. `analysis_options.yaml`

`flutter create` bu dosyayı `flutter_lints` ile oluşturur. `avoid_print` ve `use_build_context_synchronously` o sette zaten açık; `const` kuralları ise güncel sürümlerde varsayılan değil, elle açıyoruz:

```yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"

linter:
  rules:
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
    prefer_const_declarations: true
    avoid_print: true
    use_build_context_synchronously: true
    prefer_single_quotes: true
    require_trailing_commas: true
```

### Kurulum görevleri

- [ ] `flutter create gunisigi` ve proje klasörünü VS Code'da aç
- [ ] `CLAUDE.md` dosyasını oluştur
- [ ] İki skill dosyasını oluştur
- [ ] `analysis_options.yaml` dosyasını güncelle
- [ ] `flutter analyze` çalıştır; hazır sayaç kodunda çıkan const uyarılarını **kendin** düzelt (ilk Flutter alıştırman)
- [ ] İlk commit: `git commit -m "chore: proje iskeleti ve agent kuralları"`

> Bu dosyalar da projeyle büyür. Faz 6'da klasör yapısı kesinleşince, Faz 8'de Riverpod gelince `CLAUDE.md`'yi güncelle. AI bir hatayı ikinci kez yaparsa o hatayı bir kural cümlesi olarak ekle.

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
| Service + RxJS / Signals | **Provider** / **Riverpod** |
| `HttpClient` | `http` / `dio` paketi |
| Promise / async-await | `Future` / async-await (neredeyse aynı) |
| Observable | `Stream` |
| localStorage | `shared_preferences` |
| `ng serve` + hot reload | `flutter run` + **Hot Reload** (`r`) |

**En önemli fikir:** Flutter'da *her şey widget'tır*. Ekran bir widget, buton bir widget, boşluk (`SizedBox`) bile bir widget.

---

## 🗺️ Yol Haritası (Görevler)

Her faz bir öncekinin üzerine kurulur. Her fazın sonunda **çalışan bir uygulaman** olur. Bir fazı bitirmeden diğerine geçme; her faz sonunda Git commit at.

Tahmini süreler, günde 1-2 saat çalışma içindir.

---

### 🟢 Faz 1: Dart Temelleri (3-5 gün)

**Amaç:** Flutter'a geçmeden dili tanımak. Kurulum gerekmez, tarayıcıda [dartpad.dev](https://dartpad.dev) yeterli.

- [ ] Değişkenler: `var`, `final`, `const`, tipler (`int`, `double`, `String`, `bool`)
- [ ] **Null safety:** `String?`, `!`, `??`, `?.` (Flutter'da en çok hata buradan çıkar)
- [ ] Koleksiyonlar: `List`, `Map`, `Set`; `map`, `where`, `forEach`
- [ ] Fonksiyonlar: isimli parametreler `{required String title}`, ok fonksiyonları `=>`
- [ ] Sınıflar: constructor, isimli constructor, `factory`, getter
- [ ] `enum` (ruh hali için kullanacağız)
- [ ] `Future`, `async` / `await`

**Mini görev:** DartPad'de `Entry` (kayıt) sınıfı yaz: `date`, `mood`, `items` (3 maddelik liste). 3 örnek kayıt oluştur ve konsola yazdır.

---

### 🟢 Faz 2: İlk Proje ve Widget Mantığı (3-4 gün)

**Amaç:** Projeyi oluşturmak, yapıyı tanımak, ilk ekranı çizmek.

```bash
flutter create gunisigi
```

```bash
flutter run
```

- [ ] Proje klasörlerini incele: `lib/main.dart`, `pubspec.yaml`, `android/`, `test/`
- [ ] Hazır sayaç uygulamasını çalıştır, **Hot Reload** (`r`) ve **Hot Restart** (`R`) farkını gör
- [ ] `main.dart` içini temizle, kendi `MaterialApp` + `Scaffold` + `AppBar` yapını kur
- [ ] **StatelessWidget** ile "Günaydın ☀️" yazan statik bir ana sayfa yap
- [ ] Temel widget'lar: `Text`, `Icon`, `Image`, `Container`, `Padding`, `SizedBox`, `Center`

**Çıktı:** Başlığı "Günışığı" olan, ortasında karşılama mesajı bulunan tek sayfalık uygulama.

---

### 🟢 Faz 3: Layout ve Güzel Bir Arayüz (4-5 gün)

**Amaç:** Flexbox bilgini Flutter'a taşımak, uygulamayı göze hoş göstermek.

- [ ] `Row`, `Column`, `Expanded`, `Stack` ile yerleşim
- [ ] `Card`, `ListTile`, `ListView.builder` ile sahte (hardcoded) kayıt listesi
- [ ] `ThemeData` ile renk paleti: sıcak tonlar (gün doğumu turuncusu, krem, yumuşak sarı)
- [ ] `google_fonts` paketi ile yazı tipi (`flutter pub add google_fonts`)
- [ ] **Kendi widget'larını çıkar:** `MoodChip`, `EntryCard`, `StreakBadge` (Angular'daki reusable component mantığı aynen geçerli)

**Çıktı:** Sahte verilerle dolu, şık bir ana sayfa ve geçmiş listesi.

---

### 🟡 Faz 4: Etkileşim ve State (4-5 gün)

**Amaç:** Kullanıcının bir şey yapabilmesi.

- [ ] **StatefulWidget** ve `setState` mantığı
- [ ] "Yeni kayıt" formu: `TextField` / `TextFormField`, `TextEditingController`
- [ ] Ruh hali seçimi: 5 emojiden birine dokununca seçili görünsün
- [ ] Form doğrulama (`Form` + `validator`): 3 madde boş geçilemesin
- [ ] Kaydet'e basınca liste güncellensin (şimdilik bellekte, uygulama kapanınca silinir)
- [ ] `SnackBar` ile "Kaydedildi 🌼" bildirimi

**Çıktı:** Kayıt eklenebilen, canlı güncellenen bir liste.

---

### 🟡 Faz 5: Navigasyon (2-3 gün)

**Amaç:** Birden fazla sayfa arasında gezinmek.

- [ ] Önce temel: `Navigator.push` / `Navigator.pop`
- [ ] Sonra **go_router** paketine geç (Angular Router'a çok benzer)
- [ ] Rotalar: `/`, `/new`, `/history`, `/entry/:id`, `/settings`
- [ ] Alt menü: `NavigationBar` (Ana sayfa, Geçmiş, İstatistik, Ayarlar)
- [ ] Sayfalar arası veri taşıma (detay sayfasına kayıt id'si gönderme)

**Çıktı:** Alt menülü, çok sayfalı uygulama.

---

### 🟡 Faz 6: Kod Organizasyonu (1-2 gün)

**Amaç:** Proje büyümeden düzeni kurmak.

```text
lib/
├── main.dart
├── app/            # MaterialApp, tema, router
├── models/         # Entry, Mood
├── data/           # repository: veriye erişim
├── features/
│   ├── home/
│   ├── new_entry/
│   ├── history/
│   ├── stats/
│   └── settings/
└── shared/
    └── widgets/    # MoodChip, EntryCard, StreakBadge...
```

- [ ] Dosyaları bu yapıya taşı; her feature içinde `data/` (repository, kaynak) ve `presentation/` (ekran, widget, provider) alt klasörleri olsun
- [ ] Bu fazda `CLAUDE.md` içindeki klasör kuralını güncelle (bkz. Bölüm 0.5)
- [ ] `Entry` modeline `toJson()` / `fromJson()` ekle (bir sonraki faz için şart)
- [ ] `flutter analyze` çalıştır, uyarıları temizle

---

### 🟠 Faz 7: Kalıcı Veri (Yerel Depolama) (4-5 gün)

**Amaç:** Uygulama kapansa da kayıtlar kaybolmasın.

- [ ] **shared_preferences** ile basit ayarlar: tema tercihi, kullanıcı adı
- [ ] Kayıtlar için bir yerel veritabanı seç ve öğren:
  - **sqflite**: SQL biliyorsan en tanıdık olanı (öneri)
  - **Hive CE**: anahtar-değer tabanlı, kurulumu çok basit
- [ ] `EntryRepository` sınıfı: `getAll()`, `add()`, `update()`, `delete()`
- [ ] UI'ı doğrudan veritabanına değil, repository'ye bağla
- [ ] Yükleniyor durumu: `FutureBuilder` + `CircularProgressIndicator`
- [ ] Kayıt silme: listede kaydırarak silme (`Dismissible`) + onay dialog'u

**Çıktı:** Kapatıp açınca verileri hatırlayan gerçek bir uygulama. 🎉 *Burası ilk büyük kilometre taşın.*

---

### 🟠 Faz 8: State Management (4-6 gün)

**Amaç:** `setState` ile her yere veri taşıma derdinden kurtulmak.

- [ ] Sorunu hisset: ana sayfadaki seri sayacı, yeni kayıt eklenince neden güncellenmiyor?
- [ ] **Riverpod** (`flutter_riverpod`) öğren. Angular servislerine en yakın mantık budur.
  - `Provider`, `NotifierProvider`, `FutureProvider`
  - `ConsumerWidget`, `ref.watch` vs `ref.read`
- [ ] `EntriesNotifier`: tüm kayıt listesini yönetsin
- [ ] Seri (streak) hesabını ayrı bir provider'a koy (art arda kaç gün yazılmış)
- [ ] Tema (açık/koyu) ayarını provider ile tüm uygulamaya yay

> Alternatif: Riverpod zor gelirse önce daha basit olan `provider` paketiyle başla, sonra geç.

**Çıktı:** Her ekranın otomatik senkron olduğu, temiz state yapısı.

---

### 🔵 Faz 9: İnternetten Veri (API) (3-4 gün)

**Amaç:** "Günün sözü" özelliği.

- [ ] `http` (veya `dio`) paketiyle ücretsiz bir alıntı API'sine istek at (örn. ZenQuotes, ya da kendi JSON listen)
- [ ] JSON'u modele çevir (`Quote.fromJson`)
- [ ] 3 durumu ele al: **yükleniyor**, **hata** (internet yok), **başarılı**
- [ ] Söz günde bir kez çekilsin, yerelde saklansın (önbellek mantığı)
- [ ] İnternet yoksa yerel, gömülü Türkçe söz listesinden göster
- [ ] Android internet izni: `android/app/src/main/AndroidManifest.xml` içinde `INTERNET` izni (release build için şart)

**Çıktı:** Her sabah değişen, çevrimdışı da çalışan söz kartı.

---

### 🔵 Faz 10: İstatistik ve Grafik (2-3 gün)

- [ ] **fl_chart** paketi ile son 7 günün ruh hali çizgi grafiği
- [ ] Toplam kayıt, en uzun seri, en sık ruh hali kartları
- [ ] Ay görünümü: yazılan günleri renkli gösteren takvim (`table_calendar` paketi)

---

### 🔵 Faz 11: Bildirimler (2-3 gün)

- [ ] **flutter_local_notifications** ile her akşam hatırlatma: "Bugün sana iyi gelen 3 şey neydi? 🌙"
- [ ] Ayarlardan bildirim saatini seçme (`showTimePicker`)
- [ ] Android 13+ bildirim izni isteme

---

### 🟣 Faz 12: Cilalama (3-4 gün)

**Amaç:** "Ödev projesi" görüntüsünden "gerçek uygulama" görüntüsüne geçiş.

- [ ] Koyu tema
- [ ] Animasyonlar: `AnimatedContainer`, `Hero` (listeden detaya geçiş), kayıt eklenince küçük bir kutlama
- [ ] Boş durum ekranları: "Henüz kayıt yok, ilk güzel anını yaz ✨"
- [ ] Uygulama ikonu: `flutter_launcher_icons`
- [ ] Açılış ekranı: `flutter_native_splash`
- [ ] Farklı ekran boyutlarında test (küçük telefon, tablet)
- [ ] Erişilebilirlik: yazı boyutu büyütülünce taşma var mı?

---

### 🟣 Faz 13: Test (2-3 gün)

- [ ] **Unit test:** seri (streak) hesaplama fonksiyonu (en kritik iş mantığı)
- [ ] **Unit test:** `Entry.fromJson` / `toJson`
- [ ] **Widget test:** form boşken kaydet butonu hata gösteriyor mu?
- [ ] Testleri çalıştır:

```bash
flutter test
```

---

### 🏁 Faz 14: Yayın (2-3 gün)

- [ ] Uygulama adı, paket adı (`com.seninadin.gunisigi`), sürüm numarası
- [ ] İmzalama anahtarı (keystore) oluştur. **Bu dosyayı ve şifresini asla kaybetme ve Git'e ekleme.**
- [ ] Release build al:

```bash
flutter build appbundle --release
```

- [ ] Kendi telefonuna kur ve en az bir hafta gerçekten kullan, hataları not al
- [ ] (Opsiyonel) Google Play Console hesabı açıp yayınla (tek seferlik ücretli). Alternatif: APK'yı GitHub Releases'e koy.
- [ ] GitHub README: ekran görüntüleri, özellik listesi, kullanılan paketler

---

### 🚀 Bonus Fazlar (İleri Seviye)

İstersen proje bittikten sonra:

- [ ] **Bulut senkronizasyonu:** Firebase (Auth + Firestore) ya da kendi Node.js backend'in
- [ ] **Giriş sistemi:** e-posta / Google ile giriş
- [ ] **Çoklu dil:** Türkçe + İngilizce (`flutter_localizations`, `intl`)
- [ ] **Fotoğraf ekleme:** `image_picker` ile güne bir fotoğraf
- [ ] **Ana ekran widget'ı:** telefon ana ekranında seri sayacı (`home_widget`)
- [ ] **CI:** GitHub Actions ile her push'ta `flutter analyze` + `flutter test`

---

## 📦 Paket Özeti

| Faz | Paket | Amaç |
|---|---|---|
| 3 | `google_fonts` | Yazı tipi |
| 5 | `go_router` | Navigasyon |
| 7 | `shared_preferences` | Basit ayarlar |
| 7 | `sqflite` veya `hive_ce` | Kayıtlar |
| 8 | `flutter_riverpod` | State management |
| 9 | `http` veya `dio` | API istekleri |
| 10 | `fl_chart`, `table_calendar` | Grafik, takvim |
| 11 | `flutter_local_notifications` | Hatırlatma |
| 12 | `flutter_launcher_icons`, `flutter_native_splash` | İkon, açılış ekranı |

Paket eklemek için:

```bash
flutter pub add go_router
```

> Paket seçerken pub.dev'de **Likes**, **Pub Points**, **son güncelleme tarihi** ve **Flutter Favorite** rozetine bak.

---

## 📚 Kaynaklar

- **Resmi dokümantasyon:** [docs.flutter.dev](https://docs.flutter.dev) (özellikle "Learn" ve "Cookbook" bölümleri)
- **Dart dili turu:** [dart.dev/language](https://dart.dev/language)
- **DartPad:** [dartpad.dev](https://dartpad.dev) (kurulumsuz deneme)
- **Widget of the Week:** Flutter'ın resmi YouTube kanalındaki kısa widget videoları
- **Riverpod:** [riverpod.dev](https://riverpod.dev)
- **Paketler:** [pub.dev](https://pub.dev)

---

## 💡 Altın Kurallar

1. **Her fazın sonunda çalışan bir uygulama olsun.** Yarım bırakılmış 5 özellik yerine bitmiş 1 özellik.
2. **Her faz sonunda commit at.** `git commit -m "faz 4: kayıt ekleme formu"`
3. **Kopyala-yapıştır değil, yaz.** Kodu elle yazmak öğrenmenin yarısıdır.
4. **Hata mesajını sonuna kadar oku.** Flutter hata mesajları genellikle çözümü de söyler.
5. **`flutter doctor` ve `flutter analyze` en iyi arkadaşın.**
6. **Takılınca 30 dakika kuralı:** 30 dakika uğraş, çözemezsen dokümantasyona, sonra topluluğa / yapay zekaya sor.
7. **Kendine iyi davran.** Bu uygulamanın konusu da bu zaten. 🌅

---

**Toplam tahmini süre:** Günde 1-2 saatle yaklaşık **8-10 hafta** (bonus fazlar hariç).
