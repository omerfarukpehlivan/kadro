# Kadro Design System — Master Source of Truth (`ui-ux-pro-max`)

> **MİMARİ KURAL:** Kadro uygulamasındaki her ekran, bileşen veya stil düzenlemesi öncelikle bu anayasa belgesine (`MASTER.md`) uymak zorundadır. Varsa sayfa bazlı `design-system/kadro/pages/[page-name].md` kuralları buradaki genel kuralları özelleştirir.

---

## 🏛️ 1. Ürün Kimliği ve Tasarım Paradigması

- **Uygulama Adı:** Kadro (`com.omer.kadro`)
- **Kategori:** Yetişkin Oyunlaştırılmış EdTech (Adult Gamified EdTech) — KPSS Lisans Genel Kültür (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler — Toplam 60 Soru)
- **Tasarım Paradigması:** **"Prestijli Devlet & Akademi Kimliği"** + **"Tactile & Gamified" (Duolingo / Brilliant stili fiziksel derinlik)** + **"Canlı Kadro Koçu (Tuğrul — Anadolu Kartalı)"**
- **De-AI Restorasyonu:** Jenerik yapay zeka morları (`#4F46E5`, `#818CF8`), anlamsız parıltı (`sparkles ✨`) ikon enflasyonu ve neon efektler tamamen temizlenmiştir. Yerine köklü kamu ve akademi ciddiyetine yakışan asil **Devlet & Akademi Gece Laciverti (`#1E3A5F`)**, steril fildişi/buz beyazı kağıt dokusu (`#F0F4F8`), **Akademik Zümrüt (`#0D9488`)** ve **Tok Başarı Altını (`#D97706`)** hakimdir.

---

## 📱 2. Duyarlı & Uyarlanabilir Ekran Stratejisi (Responsive & Adaptive Breakpoints)

Kadro; en küçük kompakt telefonlardan (iPhone SE, mini, 360px Android) büyük katlanabilir cihazlara ve 10-12 inç tabletlere kadar **sıfır taşma (`RenderFlex overflow`)** ve **cihaza özel en iyi ergonomi** sunar.

### 📐 Ekran Kırılım Noktaları (Breakpoints)

| Profil | Genişlik (`width`) | Yükseklik (`height`) | Hedef Cihazlar | Düzen & Ergonomi Stratejisi |
|---|---|---|---|---|
| **Compact Phone** | `< 380px` | `< 720px` | iPhone SE, mini, 360x640 Android | **Ultra-Kompakt & Sıkışmasız:**<br>• Sayfa yatay dolgusu: `12px` (16px yerine)<br>• Maskot boyutu: `72-80px` (içeriği kat altına itmemesi için)<br>• Bento Grid aralıkları: `8px`<br>• Üst bar rozetleri kompakt font (`labelSmall`) ve esnek `Flexible`<br>• Dokunmatik alanlar min `48x48dp` korunur |
| **Standard Phone** | `380px - 599px` | Geniş | iPhone 14/15/16, Galaxy S23/S24 | **Varsayılan Tasarım:**<br>• Sayfa dolgusu: `16px`<br>• Maskot boyutu: `88-92px` borderlı pop-out<br>• 2x2 Tactile Bento Grid<br>• Standart tipografi ölçeği |
| **Tablet & Large** | `>= 600px` | Geniş | iPad, Android Tablet, Katlanabilir | **Geniş Ekran Odaklanma & Grid Genişlemesi:**<br>• **Maksimum Okuma Genişliği:** Kartlar ve sorular 1000px yayılmaz; `maxWidth: 720px` kısıtıyla ortalanır.<br>• Bento Grid 2 sütun yerine **3 veya 4 sütuna** genişler.<br>• Dialog ve BottomSheet'ler ekrana yayılmaz; `maxWidth: 480-520px` modal olarak açılır. |

### 🛡️ Taşma (Overflow) ve Metin Ölçekleme Kuralları
1. **Dinamik İçerik Alanlarına Asla Sabit `height` Verme:** Soru metinleri, başlıklar ve kart içerikleri kullanıcının sistem yazı tipi boyutu ayarına (Dynamic Type / `textScaler`) göre uzayabilir. Her zaman esnek (`minHeight`, dikey `padding`) kullan.
2. **`Row` İçinde Değişken Metinler `Expanded` / `Flexible` ile Sarılmalı:** Yan yana duran buton, başlık veya sayaçlarda metin uzarsa taşma yapmaması için `Flexible(child: Text(..., overflow: TextOverflow.ellipsis))` zorunludur.
3. **Küçük Ekranda Kat Altı (Fold) Koruması:** `MascotCoachBanner` gibi büyük başlık öğeleri küçük ekranlarda dikeyde çok fazla yer kaplamamalı; adayın ilk ekranda çalışma butonlarını görebilmesi sağlanmalıdır.

---

## 🎨 3. Renk Paleti (Devlet & Akademi Gece Laciverti + Zümrüt + Altın)

> **KESİN KURAL:** Sabit `Color(0xFF...)` tanımları **YALNIZCA** `lib/app/theme.dart` (`AppTheme`) içinde yer alabilir. Tüm ekranlar ve widget'lar renkleri dinamik olarak `Theme.of(context).colorScheme` üzerinden almalıdır.

| Renk Rolü | Açık Tema (Light) | Koyu Tema (Dark) | Flutter Token | Pedagojik / Psikolojik Anlam |
|---|---|---|---|---|
| **Primary (Devlet & Akademi Laciverti)** | `#1E3A5F` | `#38BDF8` | `colorScheme.primary` | Ciddi, saygın, köklü devlet kurumu ve akademi prestiji. Ana butonlar, aktif sekmeler. |
| **Primary Container** | `#F0F4F8` | `#172A45` | `colorScheme.primaryContainer` | Steril, göz yormayan sınav kağıdı/fildişi tonu. Seçili şıklar, konuşma balonları. |
| **Secondary (Akademik Zümrüt)** | `#0D9488` | `#2DD4BF` | `colorScheme.secondary` | Çalışma, odaklanma, ders modu ve doğru cevap zümrütü. |
| **Secondary Container** | `#CCFBF1` | `#134E4A` | `colorScheme.secondaryContainer` | Konu yol haritası düğümleri, başarı hapları. |
| **Tertiary (Tok Başarı Altını)** | `#D97706` | `#FBBF24` | `colorScheme.tertiary` | Günlük seri alevi, Kadro PRO tacı, derece rozetleri ve ÖSYM Çeldirici Tuzağı. |
| **Tertiary Container** | `#FEF3C7` | `#78350F` | `colorScheme.tertiaryContainer` | Seri hapı arka planı, net sıçratan test rozeti. |
| **Error (Hata / Yanlış)** | `#DC2626` | `#F87171` | `colorScheme.error` | Yanlış cevap vurgusu, Yanlış Defteri sayacı, Kurtlar Sofrası zorluk rozeti. |
| **Surface / Scaffold** | `#F8FAFC` | `#0B1120` | `colorScheme.surface` | Temiz sınav masası zemini (Açıkta beyaz/buz, koyuda derin antrasit gece mavisi). |
| **Card Yüzeyi** | `#FFFFFF` | `#1E293B` | `colorScheme.surface` / `cardColor` | Yüksek kontrastlı, pürüzsüz kart gövdesi. |
| **Nötr Bordür** | `#E2E8F0` | `#334155` | `colorScheme.outlineVariant` | Abartısız, temiz 1px ayrım çizgisi. |

---

## 🦅 4. Marka Maskotu: Kadro Koçu Tuğrul (Anadolu Kartalı)

Kadro Koçu Tuğrul; Selçuklu çift başlı kartalı ve Anadolu mirasını temsil eden, bilge, motive edici ve adayın hedefine kilitlenmesini sağlayan koçtur.

### Maskot Varyasyonları (`MascotMood`) ve Kullanım Yerleri

| Mood | PNG Dosya Yolu | Rol & Sahne | Ses Tonu & Mesaj |
|---|---|---|---|
| `coach` | `assets/images/mascot/tugrul_coach.png` | `HomeScreen`, Genel Rehber | *"Hedefe pençe atma vakti! Bugün hangi dersten net topluyoruz?"* |
| `victory` | `assets/images/mascot/tugrul_victory.png` | `QuizResultScreen`, Zafer Karnesi | *"Harika uçuş! Her çözdüğün test seni kadroya bir adım yaklaştırıyor."* |
| `detective` | `assets/images/mascot/tugrul_detective.png` | `MistakesScreen`, Yanlış Defteri | *"Hiçbir yanlış gözümden kaçmaz! Eksikleri birlikte kapatalım."* |
| `pro` | `assets/images/mascot/tugrul_pro.png` | `PaywallScreen`, Profil | *"Kadro PRO ile kanatlarını tam aç, günlük sınırları ortadan kaldır!"* |
| `history` | `assets/images/mascot/tugrul_history.png` | Tarih Konu Testleri & Denemeler | Selçuklu miğferli, fermanlı Tuğrul Alp: *"Tarihi bilmeyen geleceği inşa edemez!"* |
| `geography` | `assets/images/mascot/tugrul_geography.png` | Coğrafya Konu Testleri | Safari yelekli, pusulalı Kâşif Tuğrul: *"Türkiye'nin her karış toprağını ezberliyoruz."* |
| `citizenship` | `assets/images/mascot/tugrul_citizenship.png` | Vatandaşlık Konu Testleri | Hukukçu cübbeli Hakim Tuğrul: *"Anayasa ve kanunlar bizim rehberimiz."* |
| `current` | `assets/images/mascot/tugrul_current.png` | Güncel Bilgiler Testleri | Gazeteci mikrofonlu Haberci Tuğrul: *"Gündemi en yakından takip eden kazanır."* |

---

## 🎯 5. 4 Seviyeli Motive Edici Test Zorluk Rozetleri (`TASK-58`)

Konu testleri listesinde (`TopicTestsScreen`) ve soru çözüm ekranında (`QuizScreen`) sıkıcı dershane etiketleri yerine adayı içine çeken şu rozetler kullanılır:

1. 🌱 **Basit Alıştırma (Isınma Turu)** (`<= 1.4` ortalama zorluk):
   - *Açıklama:* "Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları."
   - *Tema:* `colorScheme.secondaryContainer` (Zümrüt Yeşili) + `LucideIcons.sprout`
2. 🏛️ **Tam Sınav Ayarı (ÖSYM Formatı)** (`1.4 - 2.2` ortalama zorluk):
   - *Açıklama:* "Gerçek KPSS kitapçığında karşına çıkacak standart soru kalıpları."
   - *Tema:* `colorScheme.primaryContainer` (Devlet & Akademi Laciverti) + `LucideIcons.target`
3. ⚡ **Net Sıçratan (Derece Soruları)** (`2.2 - 2.6` ortalama zorluk):
   - *Açıklama:* "Adayların %70'ini eleyen, puanı doğrudan yukarı taşıyan ayırt edici sorular."
   - *Tema:* `colorScheme.tertiaryContainer` (Tok Başarı Altını) + `LucideIcons.zap`
4. 🔥 **Kurtlar Sofrası (ÖSYM Mayın Tarlası)** (`> 2.6` ortalama zorluk):
   - *Açıklama:* "En çok düşülen çeldirici tuzaklar ve ters köşe yapan ÖSYM soruları."
   - *Tema:* `colorScheme.errorContainer` (Tok Kırmızı) + `LucideIcons.flame`

---

## 🔲 6. "Tactile & Gamified" Arayüz Geometrisi

Material Design'ın düz kartları yerine Duolingo / Brilliant hissi veren fiziksel kartlar kullanılır:
- **`TactileCard` Geometrisi:**
  - `borderRadius: BorderRadius.circular(18)`
  - Üst/Yan kenarlıklar: `1.5px` (`colorScheme.outlineVariant` veya `colorScheme.primary.withAlpha(80)`)
  - Alt 3D Derinlik Dudak Gölgelendirmesi: `BoxShadow(color: colorScheme.outlineVariant, offset: const Offset(0, 3), blurRadius: 0)` (Bulanık çamurlu gölge yerine net 3D basılabilirlik hissi).
- **Yüzen Kapsül Alt Menü (`AppNavigationBar`):**
  - Standart alt çubuk yerine ekranın altında havada asılı duran zarif kapsül bar (`Floating Pill`), aktif sekmede zümrüt/lacivert tactile gösterge.

---

## ✍️ 7. Tipografi Hiyerarşisi (`google_fonts`)

- **Başlıklar & Skorlar (`display*`, `headline*`, `title*`):** `GoogleFonts.plusJakartaSans` (`FontWeight.w700` veya `w800` — Kendinden emin, dolgun kurumsal duruş).
- **Gövde Metinleri & Sorular (`body*`, `label*`):** `GoogleFonts.inter` (`FontWeight.w400` / `w500` / `w600` — Yüksek okunaklılık, optik harf aralıkları).
- **Test Güvenlik Kilidi:** `AppTheme._buildTextTheme` içinde test ortamında (`Platform.environment['FLUTTER_TEST']`) dış ağdan font indirilmesi engellenir.

---

## 🚦 8. Teslim Öncesi Doğrulama Kontrol Listesi

- [ ] **Responsive Test:** 360x640 (Kompakt), 390x844 (Standart) ve 768x1024 (Tablet) ekranlarda sıfır taşma (`RenderFlex`) kontrolü yapıldı mı?
- [ ] **Tablette Genişlik Kısıtı:** Tablette kartlar ve soru ekranı `maxWidth: 720` ile merkezlendi mi?
- [ ] **Sıfır Hardcoded Renk:** `lib/app/theme.dart` haricinde hiçbir yerde `Color(0xFF...)` veya `Colors.*` kullanılmadı mı?
- [ ] **Sıfır Hardcoded FontSize:** Yazı tipleri yalnızca `Theme.of(context).textTheme` üzerinden mi alındı?
- [ ] **De-AI Standartları:** Mor zeminler veya gereksiz `sparkles` ikonları temizlendi mi?
- [ ] `dart format lib test` -> Sıfır değişiklik
- [ ] `flutter analyze` -> `No issues found!`
- [ ] `flutter test` -> Tüm testler yeşil (0 hata)
