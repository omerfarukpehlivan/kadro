# 🎯 Kadro: KPSS Genel Kültür Hazırlık Uygulaması — Antigravity & Gemini Agent Kuralları

This project (**Kadro**) is a commercial KPSS Lisans Genel Kültür (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler — Total 60 Questions) preparation app built with **Flutter + Supabase (PostgreSQL + Auth + RLS)**.
- **Paket adı:** `kadro` (`com.omer.kadro`)
- **İlk Sürüm (MVP) Kapsamı:** Sadece **KPSS Lisans Genel Kültür** (Tarih: 27, Coğrafya: 18, Vatandaşlık: 9, Güncel Bilgiler: 6 — Toplam 60 soru, 65 dakika). İlk etapta Türkçe ve Matematik yer almayacaktır.
- **Gelir Modeli:** Hibrit Freemium (**Kadro PRO** abonelik + günlük 30 soru limiti sonrası **Ödüllü Reklam** ile +20 soru).
- **Özgün İçerik Kuralı:** Sorular özgün olmalı; ÖSYM'nin telifli çıkmış sorularını birebir içerik olarak ekleme.
- **"ÖSYM Çeldirici Tuzağı" (UWorld Modeli) Kuralı:** Hazırlanan soruların açıklamasında adayın en çok düşebileceği yanıltıcı şıkkı deşifre eden ve neden doğru sanıldığını açıklayan `distractorTrap` ("⚠️ ÖSYM Çeldirici Tuzağı") analizi yer almalıdır. Soru çözüm ekranında bu bölüm özel altın/kehribar uyarı rozetiyle öne çıkarılır.

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
- **Tasarım Sistemi (`design-system/kadro/MASTER.md`):** Her ekran veya bileşen geliştirilirken öncelikle `design-system/kadro/MASTER.md` (ve varsa `design-system/kadro/pages/<ekran>.md`) kurallarına ve `.agents/skills/ui-ux-pro-max/SKILL.md` disiplinine uyulur.
- **Onaylı Marka & UI Paketleri:**
  - `flex_color_scheme`: Kurumsal Academic Indigo (`#4F46E5`) & Achievement Gold (`#D97706`) renk paleti ve global bileşen (`Card`, `FilledButton`, `NavigationBar`, `InputDecoration`) alt temaları.
  - `google_fonts`: Başlıklarda `Plus Jakarta Sans`, gövde ve soru metinlerinde `Inter` tipografi ailesi.
  - `lucide_icons_flutter`: Standart Android `Icons.*` yerine modern çizgisel `LucideIcons` ikon seti (testlerde özellikle aranan ikonlar hariç).
  - `flutter_animate`: Kart geçişleri ve ekran açılışlarında mikro etkileşimler (testlerde `pumpAndSettle` zaman aşımını önlemek için animasyon süreleri `<= 300ms` tutulur ve sonsuz `.repeat()` kullanılmaz).
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
