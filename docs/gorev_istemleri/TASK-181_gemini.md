# TASK-181 — Gemini İstemleri (Mobil & Web UI/UX Cila Paketi)

İki istem birbirinden bağımsızdır; ayrı oturumlarda (veya sırayla) verilebilir. Her biri bitince Gemini durur, Claude inceler, kullanıcı onaylarsa commit edilir.

---

## 📱 İstem 1 — Mobil (`gunisigi`, Flutter)

````text
Sen Kadro (KPSS hazırlık uygulaması) projesinin mobil istemcisinde (`gunisigi`, Flutter) çalışan bir UI/UX geliştiricisisin. Görev: TASK-181 Mobil UI/UX Cila Paketi. Türkçe yaz ve Türkçe konuş.

## 0. Önce oku
1. `GEMINI.md` (mimari ve UI kuralları — tek kaynak).
2. `design-system/kadro/MASTER.md`, `design-system/kadro/aiSlopless.md` ve `.agents/skills/ui-ux-pro-max/SKILL.md`.
3. `docs/task-board.md` içinde yalnızca "TASK-181" bölümü.
4. Mevcut ortak bileşenler: `lib/shared/widgets/` (özellikle `empty_state_view.dart`, `tactile_card.dart`, `tugrul_avatar.dart`, `page_header.dart`, `math_text.dart`, `question_figure.dart`, `diagram_card_shell.dart`, `adaptive_overlay.dart`) ve `lib/app/theme.dart`.

## 1. Değişmez kurallar
- Supabase şemasına, `docs/parity_fixtures/`, `docs/soru_havuzu/`, `docs/konu_anlatimi/` ve `tools/` altına DOKUNMA. İş kuralı (kota, puan, Leitner, soru seçimi) DEĞİŞMEZ; bu görev yalnızca görünüm, durum ekranları ve erişilebilirliktir.
- YENİ PAKET EKLEME (`shimmer` dahil). İskelet animasyonunu Flutter'ın kendi araçlarıyla (`AnimationController` + `FadeTransition`/`Opacity`) yaz.
- Renk ve yazı tipi yalnızca `Theme.of(context).colorScheme` / `.textTheme`'den; sabit `Color(0xFF...)` ve `fontSize` yalnızca `lib/app/theme.dart` içinde. İkonlar yalnızca `phosphor_flutter`. Dekoratif emoji yok.
- Liste/kart girişlerine `.animate().fadeIn().slideY()` gibi yapay animasyon EKLEME.
- Commit yapma, branch değiştirme. Her yeni widget'a Türkçe `///` açıklama + 1 cümle Web/Angular karşılığı yaz.
- Var olan testleri "geçsin diye" gevşetme; davranış değişiyorsa testi yeni davranışı doğrulayacak şekilde güncelle ve raporda gerekçesini yaz.

## 2. Yapılacaklar

### ADIM 1 — Ortak durum bileşenleri (`lib/shared/widgets/`)
a) `kadro_skeleton.dart`: `KadroSkeletonBox` (genişlik/yükseklik/köşe yarıçapı alan, `surfaceContainerHighest` tonunda, 1,2 sn'lik yumuşak opaklık nabzı; `MediaQuery.disableAnimations` açıksa animasyonsuz) ve hazır kompozisyonlar: `KadroSkeletonList` (n adet kart satırı), `KadroSkeletonCardGrid` (responsive_grid ile). `Semantics(label: 'Yükleniyor')` ekle.
b) `kadro_error_state.dart`: `KadroErrorState` — `TugrulAvatar` (uygun ruh hâli), başlık, açıklama, "Tekrar Dene" (`onRetry`) düğmesi; ağ hatası ve genel hata için iki hazır kurucu (`.network()`, `.generic()`). Görsel dil `EmptyStateView` ile aynı olsun (aynı boşluklar, aynı tipografi).
c) Gerekirse `EmptyStateView`'i bu ikisiyle tutarlı hale getir (API'yi bozmadan).

### ADIM 2 — Ham yükleme/hata durumlarını değiştir
Şu dosyalarda ekran gövdesindeki ham `CircularProgressIndicator` ve kırık metin hata durumlarını ADIM 1 bileşenleriyle değiştir (düğme içindeki küçük işlem göstergeleri ve `lesson_progress_ring.dart` gibi ilerleme halkaları KALIR):
`lib/app/app_shell.dart`, `lib/features/current_affairs/presentation/current_affairs_screen.dart`, `lib/features/lessons/presentation/topic_tests_screen.dart`, `lib/features/profile/presentation/paywall_screen.dart`, `lib/features/quiz/presentation/quiz_screen.dart` (soru yükleme), `lib/features/reports/presentation/admin_reports_screen.dart`, `lib/features/stats/presentation/stats_screen.dart`, `lib/features/topic_lessons/presentation/topic_lesson_screen.dart` ve topic_lesson_unit_screen.dart. Ayrıca Ana Sayfa, Dersler, Konular, Deneme, Karne, Profil akışlarında `AsyncValue.when(loading/error)` kullanan her yeri tara ve aynı bileşenlere bağla. Hata durumunda her zaman "Tekrar Dene" olsun (provider'ı `ref.invalidate` ile yenile).

### ADIM 3 — Taşma taraması (3 boyut × ana akışlar)
`360×640`, `412×915` ve `768×1024` (tablet) boyutlarında şu ekranları widget testiyle aç ve `RenderFlex overflow` / taşma olmadığını doğrula: Ana Sayfa, Dersler, Konu Listesi, Konu Testleri, Konu Anlatımı okuyucusu (tablo, `:::tuzak`, `:::ornek`, `:::sekil`, uzun formül), Soru Çözümü (Matematik sorusu: uzun satır içi formül + `$$` ayrık formül + şekil), Deneme listesi, Karne/Sonuç, İstatistik, Profil, Yanlış Defteri.
- Matematik için test verisi: `docs/soru_havuzu/matematik/ornek/` dosyalarındaki sorulardan birkaçının metnini ve şıklarını `Question(...)` olarak teste göm; `figureSvg` için `docs/parity_fixtures/math_text.json → figureSvg.cases` içindeki güvenli örnek SVG'yi kullan.
- Yeni test dosyası: `test/task181_responsive_polish_test.dart`. Taşma bulursan kökünü düzelt (`Expanded`/`Flexible`, `Wrap`, metin `maxLines` + `overflow`), sabit yükseklik verme.

### ADIM 4 — Koyu tema kontrastı ve dokunma hedefleri
- Açık ve koyu temada (`AppTheme.light` / `AppTheme.dark`) şu yüzeylerde metin/arka plan kontrastını WCAG AA (normal metin ≥ 4.5:1, büyük metin ≥ 3:1) için ölç: soru kartı, şık durumları (normal/seçili/doğru/yanlış/elenmiş), çözüm açıklaması, ÖSYM Çeldirici Tuzağı kutusu (`tertiaryContainer`), konu anlatımı callout'ları (bilgi/kodlama/tuzak/örnek), tablo başlığı, rozetler (`KadroBadge`), alt gezinme.
- Ölçümü testle yap: `test/task181_contrast_test.dart` içinde `Color.computeLuminance()` ile kontrast oranı hesaplayan küçük bir yardımcı yaz ve yukarıdaki renk çiftlerini iki temada doğrula. Başarısız çifti `lib/app/theme.dart` içinde düzelt (marka renkleri Tuğrul Kobaltı `#2140D4`, Anadolu Zümrüt `#0E9F6E`, Anadolu Altını `#E28400` korunur; gerekirse yalnızca ton/`on*` rengi ayarlanır).
- Dokunulabilir öğeler (şık satırı, şık eleme düğmesi, kart, ikon düğmeleri, alt çekmece eylemleri) en az `48×48` dp dokunma alanına sahip olsun; testte `tester.getSize` ile doğrula.

### ADIM 5 — Alt çekmece ve diyalog ergonomisi
`adaptive_overlay.dart`, `kadro_option_picker_modal.dart`, `kadro_confirm_dialog.dart`, `report_question_bottom_sheet.dart`, `target_exam_selector_bottom_sheet.dart`: küçük ekranda klavye açıkken içerik kaydırılabilir mi (`viewInsets`), tutamaç ve başlık tutarlı mı, birincil eylem en altta ve tam genişlikte mi, kapatma yolu (geri, dışına dokunma, kapat düğmesi) her yerde aynı mı? Tutarsızlıkları ortak bileşen üzerinden düzelt.

### ADIM 6 — Doğrulama
- `dart format lib test` (0 değişiklik kalana kadar), `flutter analyze` (0 sorun).
- `flutter test` (TÜM paket; yalnızca ilgili dosyalar değil). Tamamı yeşil olmalı.
- `graphify update .`

## 3. Bitirince
- `docs/task-board.md` içinde yalnızca TASK-181 satırındaki **Mobil de Yapıldı** kolonunu `✅` yap, Durum'u (Web `❌` ise) `🟡 Kısmi (Web bekliyor)` yap.
- Kısa rapor yaz (sohbete): değiştirilen dosyalar, bulunan taşmalar ve düzeltmeleri, kontrast ölçüm tablosu (çift | açık | koyu | sonuç), değiştirilen/eklenen testler ve tam `flutter test` sonucu (geçen/kalan sayısı). Emin olmadığın noktaları açıkça yaz.
- DUR: "TASK-181 mobil tamamlandı, Claude incelemesi bekleniyor."
````

---

## 🌐 İstem 2 — Web (`kadro-web`, Next.js)

````text
Sen Kadro (KPSS hazırlık uygulaması) projesinin web istemcisinde (`../kadro-web`, Next.js App Router + Tailwind + shadcn/ui) çalışan bir UI/UX geliştiricisisin. Görev: TASK-181 Web UI/UX Cila Paketi. Türkçe yaz ve Türkçe konuş.

## 0. Önce oku
1. `kadro-web/AGENTS.md` (web kuralları; Next.js sürümüne özgü notlar dahil).
2. `../gunisigi/design-system/kadro/MASTER.md` ve `aiSlopless.md`.
3. `../gunisigi/docs/task-board.md` içinde yalnızca "TASK-181" bölümü.
4. Mevcut yapı: `src/app/(app)/loading.tsx`, `src/app/(app)/coz/loading.tsx`, `src/app/(public)/loading.tsx`, `src/components/ui/*`, `src/components/math-text.tsx`, `src/components/question-figure.tsx`, `src/app/globals.css` (açık/koyu tema değişkenleri).

## 1. Değişmez kurallar
- Supabase şeması, `src/domain/*` iş kuralları, `tests/parity/*` ve eşleniklik fikstürleri DEĞİŞMEZ. Bu görev yalnızca görünüm, durum ekranları ve erişilebilirliktir.
- Yeni npm paketi ekleme. Mevcut shadcn bileşenlerini ve Tailwind'i kullan; renkler yalnızca `globals.css` değişkenleri (`bg-card`, `text-foreground`, `text-muted-foreground`…) üzerinden. Sabit hex renk yazma.
- SEO sayfalarının (`(public)`) metadata, JSON-LD, sitemap ve URL'leri değişmez.
- Commit yapma, branch değiştirme.

## 2. Yapılacaklar

### ADIM 1 — Ortak durum bileşenleri (`src/components/`)
a) `skeleton.tsx`: `Skeleton` (shadcn tarzı, `animate-pulse`, `motion-reduce:animate-none`, `aria-hidden`) + bir kapsayıcıda `role="status"` ve görünmez "Yükleniyor" metni.
b) `state-panels.tsx`: `EmptyState` ve `ErrorState` (başlık, açıklama, Tuğrul görseli `src/components/tugrul-avatar.tsx`, birincil eylem). `ErrorState` "Tekrar Dene" için `reset()` veya `router.refresh()` alır.
Mevcut sayfalardaki el yazımı boş/hata blokları (ör. "Henüz veri yok" kutuları) bunlarla değiştirilir.

### ADIM 2 — `loading.tsx` ve `error.tsx` kapsaması
- `(app)` altındaki ana rotalar için sayfa düzenine BENZEYEN iskeletler: `/panel`, `/dersler`, `/dersler/[ders]`, `/dersler/[ders]/[konu]/anlatim` ve `/[bolum]`, `/coz` (zaten var, düzene uydur), `/denemeler`, `/yanlislar`, `/istatistik`, `/pratik`, `/profil`. Genel `(app)/loading.tsx` yalnızca yedek olarak kalsın.
- `(app)/error.tsx` ve `(public)/error.tsx` ("use client", `ErrorState` + `reset`), ayrıca `src/app/not-found.tsx` (Kadro diliyle, ana sayfa/panele dönüş bağlantısı) yoksa ekle. Hata ayrıntısını kullanıcıya gösterme; `digest` varsa küçük gri metin olarak gösterilebilir.

### ADIM 3 — Duyarlı görünüm ve taşma denetimi
`375px`, `768px`, `1440px` genişliklerde şu sayfaları tarayıcıda aç (`npm run dev`) ve yatay kaydırma/taşma, sıkışan başlık, kırılan tablo olmadığını kontrol et: Landing (`/`), `/panel`, `/dersler`, konu anlatımı okuyucusu (Matematik konusu: KaTeX satır içi + `$$` ayrık formül + `figure` bloğu + tablo), `/coz` soru stüdyosu (Matematik sorusu, şekilli soru, uzun şık), `/yanlislar`, `/denemeler`, `/profil`.
- KaTeX: uzun ayrık formül yatay kaydırılabilir kapta kalsın (`.math-display` zaten `overflow-x-auto`); satır içi formül satırı taşırmasın. Gerekirse `globals.css`'e `.katex { font-size: 1.05em }` gibi küçük ayar.
- Şekiller (`QuestionFigure`) mobilde kartı taşırmasın, masaüstünde aşırı büyümesin.
- Bulunan her sorunu kök nedeninden düzelt (min-w-0, flex-wrap, overflow-x-auto tablo sarmalayıcısı, `break-words`).

### ADIM 4 — Erişilebilirlik ve kontrast
- Klavye: tüm etkileşimli öğelerde görünür odak halkası (`focus-visible:ring-2 ring-ring ring-offset-2`), sekme sırası mantıklı; soru şıkları ok tuşları/Enter ile seçilebilir (mevcut `role="radiogroup"` korunur), diyaloglarda odak tuzağı ve Esc.
- Açık/koyu temada WCAG AA: `text-muted-foreground` üzerinde `bg-card`/`bg-muted`, tuzak kutusu (`amber-trap`), rozetler, devre dışı düğmeler. Yetersiz olanları `globals.css` değişkenlerinden düzelt.
- Görsellerde `alt`, ikon düğmelerinde `aria-label`; dekoratif ikonlarda `aria-hidden`.

### ADIM 5 — Doğrulama
- `npm run lint`, `npx tsc --noEmit`, `npm run test:parity`, `npm run build` — hepsi yeşil.
- Mümkünse Lighthouse (mobil) ile `/panel` ve bir konu anlatımı sayfasında Erişilebilirlik puanını raporla (hedef ≥ 95).

## 3. Bitirince
- `../gunisigi/docs/task-board.md` içinde yalnızca TASK-181 satırındaki **Web de Yapıldı** kolonunu `✅` yap ve Durum'u yeniden hesapla (Mobil de `✅` ise `🟢 Tamamlandı`).
- Kısa rapor: eklenen/değiştirilen dosyalar, her genişlikte bulunan sorun ve düzeltmesi, kontrast düzeltmeleri, komut sonuçları.
- DUR: "TASK-181 web tamamlandı, Claude incelemesi bekleniyor."
````
