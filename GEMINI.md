# 🎯 Kadro: KPSS Ekosistemi Hazırlık Uygulaması — Antigravity & Gemini Agent Kuralları

This project (**Kadro**) is a commercial KPSS preparation app built with **Flutter + Supabase (PostgreSQL + Auth + RLS)**, evolving from the **KPSS Lisans Genel Kültür** core into a modular multi-exam architecture supporting all KPSS & MEB-AGS exam families.
- **Paket adı:** `kadro` (`com.omer.kadro`)
- **Ürün Kapsamı & Çoklu KPSS Mimarisi:**
  - **Aktif Çekirdek Veri Havuzu:** KPSS Lisans Genel Kültür (Tarih: 27, Coğrafya: 18, Vatandaşlık: 9, Güncel Bilgiler: 6 — Toplam 60 soru, 65 dakika).
  - **Desteklenen Hedef Sınav Ekosistemi (Aşamalı Altyapı + Son Faz İçerik Üretimi):**
    - **KPSS B Grubu (Lisans P1/P2/P3, Ön Lisans P93, Ortaöğretim P94):** Ortak GY-GK (`Türkçe 30, Matematik & Geometri 30, Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel 6` — Tam 120 soru / 130 dk veya Sadece GK 60 soru / 65 dk).
    - **E-KPSS (`EKPSSP1 / P2 / P3`):** 30 GY + 30 GK, 4 engel grubu kitapçığı (`Genel`, `Görme`, `İşitme-1`, `Zihinsel`) ve erişilebilirlik/ek süre uyarlamaları.
    - **KPSS DHBT (`P122 / P123 / P124`):** DHBT-1 (20 soru ortak) + DHBT-2 (20 soru İHL / Ön Lisans / Lisans düzey filtresi).
    - **MEB-AGS + ÖABT (`AGS-P1 / P2 / P3`):** 1. Oturum (80 soru / 110 dk; Eğitim Bilimleri & TYMM + Mevzuat dahil) + 17 resmî ÖABT branşı (50 soru; 70/90 dk) ve Yabancı Dil (`YDS -> AGS-P3`).
    - **KPSS A Grubu (`P4–P48`):** 9 Alan Bilgisi testi (Hukuk, İktisat, Maliye, Muhasebe, İşletme, Kamu Yönetimi, Uluslararası İlişkiler, ÇEKO, İstatistik; 40'ar soru).
  - **Kapsam & Ad Uzayı Kuralı:** Çoklu sınav içerikleri `exam_scopes`, `sub_branch`, `education_level`, `disability_variant` ve `source_variant` alanlarıyla ayrıştırılır; aynı veya ortak dersler ad uzayı çakışması oluşturmadan kanonik isimlerle yönetilir.
- **Gelir Modeli:** Hibrit Freemium (**Kadro PRO** abonelik + günlük 30 soru limiti sonrası **Ödüllü Reklam** ile +20 soru).
- **Özgün İçerik Kuralı:** Sorular özgün olmalı; ÖSYM'nin telifli çıkmış sorularını birebir içerik olarak ekleme.
- **"ÖSYM Çeldirici Tuzağı" (UWorld Modeli) Kuralı:** Hazırlanan tüm sınav türlerindeki soruların açıklamasında adayın en çok düşebileceği yanıltıcı şıkkı deşifre eden ve neden doğru sanıldığını açıklayan `distractorTrap` ("⚠️ ÖSYM Çeldirici Tuzağı") analizi yer almalıdır. Soru çözüm ekranında bu bölüm özel altın/kehribar uyarı rozetiyle öne çıkarılır.

---

## 🤖 Agent Çalışma Modu (Baş Mimar vs. Uygulayıcı Alt Ajan)
1. **Alt Ajan (Uygulayıcı Agent) Kuralları:**
   - Sana verilen `TASK-XX` görev tanımındaki dosya yollarına, sınıf isimlerine, metot imzalarına ve mimari kurallara **birebir** uy. Kendi başına mimari karar alma, ekstra paket kurma veya görev kapsamı dışına çıkma.
   - Yazdığın kodların içine eğitici ve anlaşılır (Angular/Web benzetmeleri içeren) Türkçe açıklama yorumları (`///` doc comments) ekle.
   - İşi teslim etmeden önce mutlaka `.agents/skills/flutter-verify/SKILL.md` adımlarını (`dart format lib test`, `flutter analyze`, `flutter test`) çalıştır ve `0` hata doğrula.
2. **Öğrenme & Açıklama Kuralı:**
   - Yeni kullanılan her Flutter widget'ı, paketi veya Dart özelliği için 1-2 cümlelik Web/Angular karşılığını (örn. `Widget` = Component, `Riverpod` = Service/Signals, `Row/Column` = Flexbox) belirt.
   - Bir hatayı düzeltirken sadece kodu değiştirme; hatanın neden kaynaklandığını kısaca açıkla.

---

## 🏗️ Mimari & Teknoloji Kararları (Kesinleşmiş Kurallar)
- **Veri ve Backend Stratejisi (Supabase BaaS):**
  - **Aşama 1:** Veriler yerel JSON dosyalarından ve Repository sınıflarından (`QuestionRepository` vb.) okunur.
  - **Aşama 2 (Backend & Bulut Fazı):** **.NET Web API kullanılmayacaktır!** Doğrudan **Supabase (`supabase_flutter` — Supabase Auth, PostgreSQL, Row Level Security ve RPC Raporlama Fonksiyonları)** kullanılacaktır. Sorular, etkileşimli oyun verileri, kullanıcının çözdüğü test oturumları (`quiz_sessions`), soru bazlı doğru/yanlış/boş ve çözüm süresi kayıtları (`question_attempt_logs`), konu ustalık seviyesi (`user_topic_mastery`) ve seri (`streaks`) verileri Supabase PostgreSQL üzerinde tutulacaktır.
- **State Management (Durum Yönetimi):**
  - **Faz 4 ve Faz 5:** Temel mekanizmayı oturtmak için yalnızca `StatefulWidget` ve `setState` kullanılır.
  - **Faz 8 ve sonrası:** `flutter_riverpod` paketine geçilir. Faz 8'den önce Riverpod eklenmez.
- **Feature-First Klasör Yapısı:**
  - `lib/app/` → Tema (`theme.dart`), uygulama kabuğu (`app_shell.dart`), router ve kabuk widget'ları (`widgets/`).
  - `lib/core/` → Ortak yardımcılar (`utils/`), ağ istemcisi, sabitler, hata sınıfları.
  - `lib/shared/widgets/` → Birden fazla ekranda tekrar kullanılan genel UI bileşenleri (`PageHeader`, `SectionTitle` vb.). **`lib/shared/` altında `widgets/` dışında klasör açmak yasaktır!**
  - `lib/features/<feature>/{data, presentation}` → Her özelliğin kendi modelleri (`data/models/`) ve repository sınıfları (`data/`) altında, ekran ve feature'a özel widget'ları (`presentation/`, `presentation/widgets/`) altında durur.
- **Soyutlama (Repository Pattern):**
  - Widget dosyalarında iş mantığı, JSON parse veya HTTP/API çağrısı **kesinlikle yasaktır**; bunlar `repository` katmanında yapılır.
- **Widget Bölünmesi & Performans:**
  - Büyük `build` metotlarını `_buildX()` helper metotları yerine ayrı `StatelessWidget` sınıflarına böl.
  - Yeni widget yazmadan önce `lib/shared/widgets/` içinde benzeri var mı kontrol et.
  - Mümkün olan her yerde `const` constructor kullan.

---

## 🎨 Arayüz (UI/UX) & Marka Kimliği Kuralları (`ui-ux-pro-max`)
- **Tasarım Sistemi (`design-system/kadro/MASTER.md`):** Her ekran veya bileşen geliştirilirken öncelikle `design-system/kadro/MASTER.md` kurallarına ve `.agents/skills/ui-ux-pro-max/SKILL.md` disiplinine uyulur.
- **Onaylı Marka & UI Paketleri ("Tuğrul Kobaltı & Anadolu Altını"):**
  - `flex_color_scheme`: Tuğrul Kobaltı (`#2140D4`), Anadolu Zümrüt (`#0E9F6E`) ve Anadolu Altını (`#E28400`) renk paleti ile `16px` kart / `14px` buton (`TactileCard`: `1.5px` kenarlık + `3px` keskin alt dudak) sistemi.
  - `google_fonts`: Başlıklarda `Outfit` (`w600`/`w700`), soru ve arayüz metinlerinde `DM Sans` (`w400`–`w700`, `FLUTTER_TEST` ortamında `allowRuntimeFetching = false`).
  - `TugrulAvatar` (`lib/shared/widgets/tugrul_avatar.dart`): `assets/images/mascot/tugrul_*.png` maskot varlıklarını 12 ruh halinde ekran sahnelerine dairesel madalyon olarak entegre eder; üstte tekrarlı dikdörtgen banner şablonu yerine sahne içi yerleşim kullanılır.
  - `phosphor_flutter`: Tek tutarlı çizgisel ikon sistemi (`PhosphorIconsRegular.*`, seçili/aktif durumda `PhosphorIconsFill.*`). UI'da `Icons.*`, `LucideIcons.*` ve dekoratif emojiler kullanılmaz.
  - `flutter_animate`: Liste ve kart girişlerinde yapay `.animate().fadeIn().slideY()` efektleri kullanılmaz; yalnızca mikro durum geri bildirimlerinde sade geçişler tercih edilir.
  - `fl_chart`: İstatistik ve karne ekranlarında görsel grafikler (`BarChart` vb.).
- **Tema Zorunluluğu:** Renk ve yazı stili her zaman `Theme.of(context).colorScheme` ve `.textTheme` üzerinden alınır. Sabit `Color(0xFF...)` ve sabit `fontSize` yalnızca `lib/app/theme.dart` içinde tanımlanabilir.
- **Taşma (Overflow) Önleme:** `Row`/`Column` içindeki dinamik metin ve listelerde `Expanded`/`Flexible` kullan; kart ve liste içerik alanlarına sabit yükseklik (`height`) verme.

---

## 📦 Paketler, Async & Hata Yönetimi
- Yeni paket eklemeden önce `pubspec.yaml` dosyasını kontrol et ve kullanıcıdan/mimardan onay al. Paketi her zaman `flutter pub add <paket>` ile ekle.
- `await` işleminden sonra `BuildContext` kullanmadan önce mutlaka `if (!context.mounted) return;` kontrolü koy.
- Dosya okuma ve API çağrıları repository katmanında `try/catch` ile sarılır; UI'a anlamlı bir hata durumu döner.
- `print` kullanma; gerekirse `debugPrint` kullan.
- Kod üretimi (`*.g.dart`, `*.freezed.dart`) dosyalarını asla elle düzenleme.
