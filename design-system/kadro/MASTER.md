# Kadro — KPSS Hazırlık Platformu Tasarım Sistemi (`MASTER.md`)

Bu doküman, **Kadro (Günışığı)** KPSS hazırlık uygulamasının güncel tasarım dilini, renk sistemini, tipografi hiyerarşisini ve bileşen kurallarını tanımlar. (`TASK-108` ile **"Tuğrul Kobaltı & Anadolu Altını — Karakterli Modern EdTech"** yaklaşımına geçilmiştir; `TASK-107` editöryal kağıt denemesi yürürlükten kaldırılmıştır.)

---

## 1. Tasarım Tezi: "Tuğrul Kobaltı & Anadolu Altını" (Karakterli Modern EdTech)

- **Amaç:** Soluk/renksiz şablonlardan, UPPERCASE eyebrow + ince divider tekrarından ve düz 1px wireframe kutularından uzak; yüksek kontrastlı, canlı ders kodlu, enerjik ve basılabilir fiziksel derinliğe sahip modern bir KPSS öğrenme stüdyosu.
- **Malzeme Hissi:** Crisp beyaz/gece kobalt kart yüzeyleri (`16px` köşe, `1.5px` kenarlık) altında net `3px` fiziksel alt dudak (`BoxShadow(offset: Offset(0, 3), blurRadius: 0)` — sıfır bulanıklık, keskin dokunsal kabartma).
- **Karakter Entegrasyonu (`TugrulAvatar`):** Maskot kartalı **Tuğrul**, tüm ekranların tepesine tekrarlı dikdörtgen banner olarak değil, her ekranın kendi sahnesinin içine dairesel madalyon (`TugrulAvatar`) olarak organik biçimde yerleştirilir ve dokunulduğunda ilgili `TugrulTipsSheet` çalışma ipuçlarını açar.

---

## 2. Duyarlı (Responsive) Yerleşim & Fold Koruması

1. **Responsive Eşik Değerleri:**
   - **Compact Phone (`< 380px`):** `12px` sayfa dolgusu, kompakt boşluklar.
   - **Standard Phone (`380px - 599px`):** `16px` sayfa dolgusu, 2 sütunlu hızlı erişim düzenleri, standart tipografi ölçeği.
   - **Tablet / Geniş Ekran (`>= 600px`):** Maksimum içerik genişliği ile ortalanmış düzen.
2. **Taşma (`RenderFlex overflow`) Yasağı:** Tüm satır ve kart başlıklarında `Expanded` / `Flexible` + `TextOverflow.ellipsis` kullanılır.
3. **Fold Koruması:** Ana sayfa ve antrenman başlangıç sahneleri kompakt tutularak kullanıcının ilk bakışta hedef, seri ve test aksiyonlarına ulaşması sağlanır.

---

## 3. Renk Paleti (Açık & Koyu Mod — `lib/app/theme.dart`)

| Rol | Light (`#`) | Dark (`#`) | Token | Kullanım |
| --- | --- | --- | --- | --- |
| **Scaffold Canvas** | `#F4F7FC` | `#0C101C` | `scaffoldBackgroundColor` | Serin aydınlık / derin gece çalışma zemini |
| **Elevated Card Surface** | `#FFFFFF` | `#151B2E` | `colorScheme.surface` | Kart ve çalışma blokları (`1.5px` kenarlık + `3px` alt dudak) |
| **Surface Low / Highest** | `#EDF1FC` / `#E0E7F6` | `#1C243D` / `#273152` | `surfaceContainerLow` / `Highest` | İkincil paneller, ilerleme barı zemini |
| **Primary (Tuğrul Kobaltı)** | `#2140D4` | `#6C8CFF` | `colorScheme.primary` | Ana CTA, aktif sekme, Vatandaşlık / Deneme vurgusu |
| **Secondary (Anadolu Zümrüt)** | `#0E9F6E` | `#34D399` | `colorScheme.secondary` | Hedef tamamlama, Coğrafya, doğru cevap |
| **Tertiary (Anadolu Altını)** | `#E28400` | `#FBBF24` | `colorScheme.tertiary` | Seri (Streak), PRO taç rozeti, Tarih & ÖSYM tuzakları |
| **Error (Mercan Kırmızı)** | `#DC2626` | `#F87171` | `colorScheme.error` | Yanlış defteri, Güncel Bilgiler vurgusu, hata durumları |
| **Ink Primary / Muted** | `#141928` / `#505A74` | `#F1F5FE` / `#A3AEC8` | `onSurface` / `onSurfaceVariant` | Yüksek kontrastlı ana metin ve ikincil açıklamalar |
| **Outline / Hairline** | `#8B95B0` / `#D4DDF0` | `#667394` / `#2B3554` | `outline` / `outlineVariant` | Kart kenarlıkları ve fiziksel alt dudak tonları |

---

## 4. Tipografi Hiyerarşisi (`lib/app/theme.dart`)

- **Display & Başlıklar (`display*`, `headline*`, `titleLarge`, `titleMedium`):** `GoogleFonts.outfit` (`FontWeight.w600` / `w700` — modern geometrik, dinamik EdTech başlık karakteri).
- **Arayüz, Soru & Gövde (`titleSmall`, `body*`, `label*`):** `GoogleFonts.dmSans` (`FontWeight.w400` / `w500` / `w600` / `w700` — kristal netliğinde okunaklılık; `w800`/`w900` kullanılmaz).
- `FLUTTER_TEST` ortamında `GoogleFonts.config.allowRuntimeFetching = false` ile `TASK-73` M3 ölçeği (`32/28/24`, `24/22/20`, `18/16/15`, `16/14/12`, `14/12/11`) ağsız korunur.
- UI widget'larında hardcoded `fontSize:` veya `Color(0x...)` yerine `Theme.of(context).textTheme.*` ve `Theme.of(context).colorScheme.*` kullanılır.

---

## 5. Arayüz Geometrisi, Maskot & Navigasyon

- **`TactileCard`:** `borderRadius: 16.0`, `1.5px` kenarlık, net `Offset(0, 3)` (`blurRadius: 0`) fiziksel alt dudak gölgesi (`lipColor`, `isElevated`) ve `Color.alphaBlend` opak karışım koruması.
- **`OptionTile` & Butonlar:** `14px` köşe yarıçapı, `1.5px` border, basılabilir `3px` fiziksel dudak derinliği.
- **Üst Çubuk (`AppTopBar`):** Sol başta interaktif `TugrulAvatar(mood: TugrulMood.coach)`, kalın başlık, `secondaryContainer` günlük hedef sayacı ve `PRO` rozeti (`kToolbarHeight + 1.5px` alt sınır).
- **Alt Gezinti (`AppNavigationBar`):** Sabit alt çubuk (`height: 64`, `1.5px` üst sınır), `primaryContainer` seçim kapsülü, `PhosphorIconsFill` / `PhosphorIconsRegular` geçişi.
- **`TugrulAvatar` (12 Ruh Hali):** `assets/images/mascot/tugrul_*.png` varlıkları (`ClipOval` + `1.09x` ölçeklendirme ile köşe artefaktısız dairesel madalyon) ilgili ekran sahnesine organik yerleşir.

---

## 6. İkonografi & Kalite Kuralları

- **Tek İkon Sistemi:** Yalnızca `phosphor_flutter` (`PhosphorIconsRegular.*`, seçili/vurgu durumlarında `PhosphorIconsFill.*` veya `PhosphorIconsBold.*`). `Icons.*` ve `LucideIcons.*` kullanılmaz.
- **Yasaklanan Öğeler:** Dekoratif UI emojileri, `#F7F4ED` / `#1A3A52` / `#B85D19` mat editoryal tonlar, `Newsreader` + `UPPERCASE EYEBROW` + `1px divider` şablon başlıkları, liste/kart `.animate().fadeIn()` giriş efektleri ve bulanık drop-shadow'lar (`blurRadius > 0`).
- **Bilimsel Çizimler Korunur:** `TurkeyMap`, `ClimateChart`, `GeoDiagram`, `PopulationPyramid` ve `SunDiagram` `CustomPainter` tuvalleri ile `PomodoroStudioScreen` Flip Clock mekaniği korunur; dış kart çerçeveleri `16px` yarıçap, `1.5px` kenarlık ve `3px` fiziksel alt dudak ile güncellenmiştir.
