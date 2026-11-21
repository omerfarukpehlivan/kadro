# 🧠 Kadro (KPSS Ekosistemi) — Kesinleşmiş Mimari & Alt Ajan Görev Panosu

## 📌 1. Kesinleşen Mimari ve Ürün Kararları (Anayasamız)

> [!IMPORTANT]
> **Tek Kaynak (Single Source of Truth):** Bu dosya hem Mobil (`gunisigi`, Flutter) hem Web (`kadro-web`, Next.js) projesinin **tek görev panosudur**. Web deposundaki `docs/MOBILE_WEB_PARITY.md` ve `docs/ROADMAP.md` yalnızca arşiv/analiz notudur; görev durumu orada değil **burada** güncellenir. Web'den erişim yolu: `../gunisigi/docs/task-board.md`.

Projemizin temel direkleri ([GEMINI.md](../GEMINI.md) içinde de kayıtlıdır):

1. **Ürün Odağı & Modüler Çoklu KPSS Mimarisi (`TASK-126` ve sonrası):**
   - **Aktif Çekirdek (v1 Veri Havuzu) & Çoklu Sınav Genişlemesi:** Mevcut aktif veri seti KPSS Lisans Genel Kültür (60 Soru / 65 Dakika); mimari ise **B Grubu GY-GK, E-KPSS, DHBT, MEB-AGS + 17 ÖABT ve A Grubu (`9 Alan`)** türlerini destekleyecek şekilde genişletilir (toplu soru üretimi son fazdadır):
     - **Tarih:** 27 Soru
     - **Coğrafya:** 18 Soru
     - **Vatandaşlık:** 9 Soru
     - **Güncel Bilgiler:** 6 Soru
2. **Backend & Veri Mimarisi (Supabase BaaS):**
   - **Aşama 1:** Local JSON + Bellek İçi (In-Memory / Mock) Repository.
   - **Aşama 2:** **.NET Web API kullanılmayacaktır!** Doğrudan **Supabase (`supabase_flutter` — Supabase Auth, PostgreSQL, RLS ve Raporlama Tabloları: `docs/supabase_schema.sql`)** kullanılacaktır.
3. **State Management:**
   - **Faz 4 & 5:** Saf `StatefulWidget` ve `setState`.
   - **Faz 8:** `flutter_riverpod`.
4. **Gelir Modeli (Monetization):**
   - **Hibrit Freemium:** Günlük 30 soru ücretsiz. Limit dolunca *"Ödüllü Reklam İzle (+20 Soru)"* veya **Kadro PRO** abonelik (Sınırsız soru, Akıllı Yanlış Defteri, Haftalık Güncel Bilgiler Kartları, Genel Kültür Net & Puan Analizi).

---

## 📋 2. Sıralı Görev Panosu (Task Backlog)

### 🔀 Mobil ↔ Web Eşleniklik Kuralları (Çift Proje Takibi)

Mobil (`gunisigi` = Telefon & Tablet, Flutter) ve Web (`kadro-web`, Next.js) iki ayrı depoda **ayrı ayrı kodlanır**, ancak **aynı Supabase projesini, aynı tabloları ve aynı iş kurallarını** paylaşır. Kullanıcı bir hesapla iki platformda da aynı ilerlemeyi, aynı kotayı ve aynı puanı görmelidir.

1. **Platform Kolonu İşaretleri** (`Web de Yapıldı` / `Mobil de Yapıldı`):

   | İşaret | Anlamı | Eksik sayılır mı? |
   |---|---|---|
   | ✅ | Bu platformda uygulandı ve doğrulandı | — |
   | ❌ | Bu platformda **yapılması gerekiyor**, henüz yapılmadı | **Evet** |
   | 🚫 | Bu platformda **gerekmez** (platforma özgü: AdMob, `FLAG_SECURE`, Play Store, SEO, `Ctrl+K` vb.) | Hayır |
   | ➖ | Görev iptal edildi / başka görevle değiştirildi | Hayır |

2. **`Durum` Kolonu Platform Kolonlarından Türetilir:**
   - Uygulanabilir tüm platformlar `✅` → ✅ **Tamamlandı**
   - En az bir platform `✅`, en az bir platform `❌` → 🟡 **Kısmi (`<Platform>` bekliyor)**
   - Uygulanabilir tüm platformlar `❌` → ⏳ **Planlandı / Bekliyor**
   - Her iki platform `➖` → ⏭️ **Değiştirildi** / 🚫 **İptal Edildi**
3. **Her Yeni Görev 3 Bölümle Yazılır** (şablon: [Bölüm 3 başındaki Eşlenik Görev Şablonu](#-eşlenik-görev-şablonu-her-yeni-task-için)):
   - 🔗 **Ortak Sözleşme:** Supabase tablo/kolon/RPC değişikliği, JSON veri formatı ve iş kuralı (kota, XP, net/puan formülü, müfredat sayıları). İki platform bu bölüme **birebir** uyar.
   - 📱 **Mobil Kapsamı** (`gunisigi`) ve 🌐 **Web Kapsamı** (`kadro-web`): Her platformun kendi dosya yolları, ekranları ve UI farkları. Platforma özgü görevlerde diğer kapsam tek satırla `🚫 Gerekmez — <neden>` olarak yazılır.
4. **Ortak Sözleşmeye Dokunan Değişiklik = Diğer Platform İçin Kayıt:** Bir platformda Supabase şemasını, veri formatını ([web_sync_prompt.md](web_sync_prompt.md)) veya ortak iş kuralını değiştiren her iş, diğer platformun kolonunu `❌` yapar (ya da yeni bir `TASK` açar). Ortak hesap kuralları değişirse [parity_fixtures/](parity_fixtures/) altındaki örnekler de güncellenir; iki depodaki eşleniklik testleri bu dosyaları okur.
5. **Görevi Bitiren Agent Yalnızca Kendi Platform Kolonunu `✅` Yapar** ve `Durum` kolonunu 2. maddeye göre yeniden hesaplar. Diğer platformun kolonunu doğrulamadan değiştirmez.

| Kod | Görev Adı | Kapsam | Durum | Web de Yapıldı | Mobil de Yapıldı |
|---|---|---|---|---|---|
| **TASK-01** | **Mimari Hizalama & Genel Kültür (60 Soru) Dönüşümü** | Klasör ihlallerini düzeltme (`lib/core/`, `lib/features/quiz/data/`), Türkçe/Matematik'i kaldırıp uygulamayı **KPSS Lisans Genel Kültür (60 soru)** yapısına çekme, `QuestionRepository` oluşturma | ✅ **Tamamlandı** (`ed398cd`) | ✅ | ✅ |
| **TASK-02** | **Ders Konuları (`Topics`) & Konu Seçim Ekranı** | 4 Genel Kültür dersine gerçek KPSS konularını ekleme, `Stack` ile *"Güncel"* rozeti, derse tıklayınca `LessonTopicsScreen` (`ListView.builder`) açılması | ✅ **Tamamlandı** (`93615ec`) | ✅ | ✅ |
| **TASK-03** | **Etkileşimli Soru Çözüm Motoru (`QuizScreen`)** | `StatefulWidget` dönüşümü, şık seçimi, "Cevabı Onayla", doğru/yanlış renklendirmesi ve çözüm açıklaması (`_ExplanationCard`) | ✅ **Tamamlandı** (`a31a92f`) | ✅ | ✅ |
| **TASK-04** | **Çoklu Soru İlerlemesi & Test Sonu Karnesi (`QuizResultScreen`)** | JSON'dan gelen sorularla çoklu soru akışı (`1 / N`), test bitiminde Doğru/Yanlış/Boş ve **Genel Kültür Neti** özet ekranı | ✅ **Tamamlandı** (`07b62b6`) | ✅ | ✅ |
| **TASK-05** | **Hap Bilgi Kartları (`FlashcardsScreen`)** | `AnimatedSwitcher` ile ön/arka yüz dönen bilgi kartları, "Öğrendim / Tekrar Et" sayaçları ve Ana Sayfa bağlantısı | ✅ **Tamamlandı** (`d7d5450`) | ✅ | ✅ |
| **TASK-06** | **Yanlış Defteri (`MistakesScreen`) & Bellek İçi Havuz** | Testte yanlış yapılan soruların `MistakeRepository` (in-memory) içine kaydedilmesi, Ana Sayfadan Yanlış Defteri'ni açıp yanlışları tekrar çözme | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-07** | **Süreli Genel Kültür Denemesi (`ExamSessionScreen`)** | `Timer.periodic` ile geri sayım sayacı, `ExamsScreen` ve `HomeScreen` üzerinden süreli deneme başlatma ve bitirme | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-08** | **Faz 5: `go_router` & `StatefulShellRoute` Navigasyon** | Tüm ekranların (`Home`, `Lessons`, `Topics`, `Quiz`, `Flashcards`, `Mistakes`, `Exams`, `Stats`, `Profile`) URL/rota tabanlı profesyonel navigasyona geçişi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-09** | **Faz 8: `flutter_riverpod` + Canlı Hedef & İstatistik** | Çözülen soruların global state ile takibi; Ana Sayfa `Bugünkü hedefin (X / 30)` ve `StatsScreen` ekranının gerçek verilerle canlanması | ✅ **Tamamlandı** (`4d46fcc`) | ✅ | ✅ |
| **TASK-10** | **Para Kazanma (Kadro PRO Paywall & Ödüllü Reklam) + Profil Ayarları** | Günlük 30 soru limiti dolunca çıkan *"Reklam İzle (+20 Soru) / Kadro PRO"* ekranı, `ProfileScreen`'de Açık/Koyu Tema ve Hedef seçimi | ✅ **Tamamlandı** (`114d2cd`) | ✅ | ✅ |
| **TASK-11** | **Kurumsal Marka Teması (`FlexColorScheme` + `GoogleFonts`) & `LucideIcons` Kabuk Dönüşümü** | `design-system/kadro/MASTER.md` doğrultusunda Academic Indigo + Gold renk sistemi, `Plus Jakarta Sans` + `Inter` fontları, `AppTopBar` ve `AppNavigationBar` modernizasyonu | ⏭️ **Değiştirildi** (`TASK-67` & `TASK-107 - TASK-108`) | ➖ | ➖ |
| **TASK-12** | **Bento Grid Ana Sayfa, Gamified Hedef Kartı & `flutter_animate` Mikro Etkileşimler** | `HomeScreen` Hero hedef kartı, Bento çalışma kartları, `LessonsScreen` ve `ExamsScreen` `LucideIcons` + `flutter_animate` geçişleri | ⏭️ **Değiştirildi** (`TASK-66` & `TASK-112`) | ➖ | ➖ |
| **TASK-13** | **Görsel Analitik (`StatsScreen` + `fl_chart` `BarChart`) & Karne/Paywall Marka Cilası** | `StatsScreen` içine ders bazlı başarı çubuğu grafiği (`BarChart`), `QuizResultScreen` ve `PaywallScreen` premium görsel dokunuşları | ✅ **Tamamlandı** (`d2fc73b`) | ✅ | ✅ |
| **TASK-14** | **"Kadro Koçu" (Anadolu Kartalı) Maskot Sistemi (`MascotCoachBanner`), 3D `TactileCard` & Gamified Üst Bar** | 4 farklı ifadeli (`coach`, `victory`, `detective`, `pro`) **Kadro Koçu** konuşma balonlu maskot bileşeni, Duolingo/Brilliant tarzı 3D alt gölgeli `TactileCard` ve `AppTopBar` canlı seri/PRO rozetleri | ⏭️ **Değiştirildi** (`TASK-68` & `TASK-107 - TASK-108`) | ➖ | ➖ |
| **TASK-15** | **Duolingo/Brilliant Tarzı 2x2 Tactile Bento Ana Sayfa & Görsel Ders Kartları** | `HomeScreen`'de düz liste yerine **Kadro Koçu** konuşma balonu + **2x2 Tactile Bento Grid** çalışma kutuları, `LessonsScreen`'de soru ağırlık barlı 3D ders kartları | ⏭️ **Değiştirildi** (`TASK-66`, `TASK-112`, `TASK-148`) | ➖ | ➖ |
| **TASK-16** | **Canlı Kadro Koçu Sahne Entegrasyonu (`QuizResultScreen`, `MistakesScreen`, `PaywallScreen`, `ProfileScreen`)** | Sınav karnesinde **Zafer (`victory`)**, Yanlış Defteri'nde **Dedektif (`detective`)**, Kadro PRO ekranında **Kraliyet Taçlı (`pro`)** maskot sahneleri | ⏭️ **Değiştirildi** (`TASK-53` & `TASK-107 - TASK-108`) | ➖ | ➖ |
| **TASK-17** | **Havada Duran (Floating Pill) Alt Menü (`AppNavigationBar`) & Sinematik Gradient/Pop-Out `MascotCoachBanner`** | Standart alt bar yerine iOS/Linear tarzı havada asılı kapsül alt menü, `MascotCoachBanner` içinde Derin İndigo Gradient arka plan, dekoratif ışık halkaları ve `96x96` büyük Pop-Out maskot sahnesi | ⏭️ **Değiştirildi** (`TASK-66` & `TASK-67`) | ➖ | ➖ |
| **TASK-18** | **Super-App Ana Sayfa (`HomeScreen`) — Dairesel Hedef Halkası (`Circular Gauge`) & Canlı Rozetli Gradient Bento Kartları** | `_DailyGoalCard` içinde `84x84` dairesel ilerleme halkası (`CircularProgressIndicator` gauge) + mini metrik hapları, 2x2 Bento kartlarında duotone/gradient yüzey ve `'65 Dakika'` / `'Başla →'` aksiyon rozetleri | ✅ **Tamamlandı** (`5739510`) | ✅ | ✅ |
| **TASK-19** | **Duolingo Tarzı "Konu Yol Haritası (Learning Path / Skill Tree)" (`LessonTopicsScreen`) & Zengin Modül Kartları (`LessonsScreen`)** | `LessonTopicsScreen` içindeki düz `ListTile` listesini kaldırıp dikey bağlantılı düğümlerden (`01`, `02`, `03`...) oluşan **Duolingo Yol Haritası**'na dönüştürme ve `LessonsScreen` modül kartlarını zenginleştirme | ✅ **Tamamlandı** (`02ac8cf`) | ✅ | ✅ |
| **TASK-20** | **Akıllı KPSS Çalışma Planlayıcı Veri Katmanı (`StudyTask` Modeli & `StudyPlannerNotifier` Riverpod State)** | Ders etiketli (`Tarih`, `Coğrafya` vb.), tahmini süreli (`15-65 dk`) ve doğrudan aksiyon tipli (`quiz`, `flashcards`, `mistakes`, `custom`) görev modeli + Riverpod state yönetimi ve birim testleri | ✅ **Tamamlandı** (`62b378c`) | ✅ | ✅ |
| **TASK-21** | **Hibrit Çalışma Planlayıcı Arayüzü (`HomeDailyPlanCard` + Tam Ekran `StudyPlannerScreen` + Hazır Şablonlar & "Başla ▶")** | `HomeScreen`'de anında tiklenebilen **"Bugünün Çalışma Planı"** kompakt widget'ı, tam ekran `StudyPlannerScreen` (`/planner`), tek tıkla hazır KPSS görev şablonları ve görevden doğrudan teste geçiren **"Başla ▶"** aksiyonu | ✅ **Tamamlandı** (`df884d2`) | ✅ | ✅ |
| **TASK-22** | **Etkileşimli Oyun Modu 1: "60 Saniyede Pençe" Doğru / Yanlış Hızlı Düello (`TrueFalseBlitzScreen`)** | 60 saniye geri sayımlı, kombo çarpanlı (`2x`, `3x`, `5x Kombo!`) ve anlık çözüm açıklamalı KPSS Doğru/Yanlış hızlı düello modu | ✅ **Tamamlandı** (`c7a463d`) | ✅ | ✅ |
| **TASK-23** | **Etkileşimli Oyun Modu 2: "Kavram Eşleştirme Tahtası" (`ConceptMatchScreen`) & `HomeScreen` Oyun Vitrini** | Quizlet Match tarzı 4'e 4 Tarih/Coğrafya/Vatandaşlık kavram eşleştirme tahtası ve `HomeScreen` üzerine **"Etkileşimli Mini Oyunlar"** Bento vitrini | ✅ **Tamamlandı** (`5e32ae6`) | ✅ | ✅ |
| **TASK-24** | **Güçlü Raporlama & Retention: Çözülen Testler Arşivi (`QuizSessionRecord`), Ustalık Isı Haritası & XP/Lig Sistemi** | Supabase şemasına uyumlu çözülen testler geçmişi (`QuizHistoryScreen`), Ders Ustalık Isı Haritası (`Usta`/`Gelişiyor`/`Kritik`), soru başına ortalama süre analizi ve `Bronz -> Müsteşar Ligi` XP sistemi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-25** | **Supabase Kurulumu (`supabase_flutter`), Yapılandırma (`SupabaseConfig`) & Giriş / Kayıt Ekranı (`AuthScreen`)** | `supabase_flutter` entegrasyonu, `SupabaseConfig`, `AuthNotifier` (Giriş Yap / Kayıt Ol / Misafir Modu), `AuthScreen` (`/auth`) ve `ProfileScreen` hesap kartı | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-26** | **Bulut Soru & Oyun Havuzu Entegrasyonu (`QuestionRepository` +Ders/Konu Filtreleme + Offline Fallback)** | Soruların (`multiple_choice`, `true_false`, `matching`) seçilen ders/konuya göre Supabase `public.questions` tablosundan çekilmesi ve çevrimdışı durumda yerel JSON/sample yedeğine düşmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-27** | **Bulut Raporlama & İlerleme Senkronizasyonu (`quiz_sessions`, `question_attempt_logs`, `user_topic_mastery`)** | Çözülen testlerin, soru bazlı doğru/yanlış ve süre loglarının, konu ustalık ısı haritasının ve kullanıcı XP/Seri verilerinin Supabase PostgreSQL tablolarına kaydedilmesi ve giriş yapıldığında buluttan geri yüklenmesi | ✅ **Tamamlandı** (`c9daabc`) | ✅ | ✅ |
| **TASK-28** | **Çalışma Planlayıcı (`public.study_tasks`) & Konu Ustalık Matrisi (`public.user_topic_mastery`) Bulut Senkronizasyonu** | `StudyTask` serileştirmesi (`toMap`/`fromMap`), `CloudSyncRepository` üzerinden günlük görevlerin ve konu bazlı ustalık yüzdelerinin Supabase tablolarına senkronize edilmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-29** | **Bulut Destekli Mini Oyunlar (`TrueFalseBlitz` & `ConceptMatch` Supabase) + Test Oturumu Detay Ekranı (`QuizSessionDetailScreen`)** | Mini oyunların Supabase `public.questions` (`true_false` & `matching`) tablosundan beslenmesi, oyun sonuçlarının arşive kaydedilmesi ve arşivdeki testlere tıklanınca detaylı karne analiz ekranının (`QuizSessionDetailScreen`) açılması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-30** | **3 Adımlı Kişiselleştirilmiş KPSS Hedef Sihirbazı (`OnboardingScreen`) & Odak Ders Koçluğu** | Kadro Koçu eşliğinde Hedef KPSS Puanı (`80+`, `85+`, `90+`), Odak Ders ve Günlük Soru Hedefi seçimi (`OnboardingScreen`), seçilen odak derse göre otomatik çalışma görevi ataması ve `ProfileScreen` hedef kartı | ⏭️ **Değiştirildi** (`TASK-131`) | ➖ | ➖ |
| **TASK-31** | **Yüksek Kontrastlı Renk Paleti (`AppTheme`), Opak Yüzeyli `TactileCard` & Ferah `MascotCoachBanner` Revizyonu** | `TactileCard` içindeki şeffaf zemin + `BoxShadow` renk sızması hatasının `Color.alphaBlend` ile giderilmesi, `AppTheme` içinde `secondary` rengin siyah (`#0F172A`) yerine canlı Zümrüt/Teal (`#0D9488`) yapılması, `on*Container` WCAG AAA kontrast çiftlerinin tanımlanması ve `MascotCoachBanner`'ın yüksek okunaklı yüzeye kavuşturulması | ⏭️ **Değiştirildi** (`TASK-56` & `TASK-107 - TASK-108`) | ➖ | ➖ |
| **TASK-32** | **`HomeScreen` Bento Kartları & `LessonsScreen` / `LessonTopicsScreen` Kart Kontrast ve Renk Uyumu Düzeltmesi** | `HomeScreen` 2x2 Bento ve Mini Oyun kartlarındaki kirli yarı-saydam arka planların kaldırılıp saf opak kart zemini (`surface`) + yüksek kontrastlı `Container/onContainer` rozet çiftlerine geçilmesi, `LessonsScreen` ve `LessonTopicsScreen` kartlarının netleştirilmesi | ⏭️ **Değiştirildi** (`TASK-107 - TASK-108` & `TASK-112`) | ➖ | ➖ |
| **TASK-33** | **`QuizScreen`, `FlashcardsScreen`, `StatsScreen`, `ProfileScreen` & Oyun Ekranları Kart Bütünlüğü ve Kontrast Cilası** | Tüm ekranlardaki düz `Card` ve `TactileCard` bileşenlerinde yazı (`onSurface` / `onSurfaceVariant` / `on*Container`) ve arka plan (`surface` / `*Container`) uyumunun %100 standartlaştırılması | ⏭️ **Değiştirildi** (`TASK-107 - TASK-108`) | ➖ | ➖ |
| **TASK-34** | **Kritik Mimari & Gelir Düzeltmesi: Günlük Soru Limiti vs Hedef Ayrımı & Gün Dönümü Sıfırlama** | `UserPreferencesNotifier` içinde `targetDailyStudyGoal` ile `dailyFreeQuestionLimit` (30 soru) ayrımı, `StudyStatsNotifier` içinde gün dönümü (`lastStudyDate`) kontrolü ve `ProfileScreen` hedef kartı | ✅ **Tamamlandı** (`885351a`) | ✅ | ✅ |
| **TASK-35** | **Supabase Güvenliği (RLS) & Haftalık Liderlik Tablosu RPC Fonksiyonu (`docs/supabase_schema.sql` + `CloudSyncRepository`)** | `profiles` tablosunda `is_pro` kısıtlaması, `get_weekly_leaderboard()` RPC fonksiyonu ve `markMistakeResolved` bulut senkronizasyonu | ✅ **Tamamlandı** (`64b6532`) | ✅ | ✅ |
| **TASK-36** | **Zengin Deneme Sınavı Merkezi (`ExamsScreen` Prova Paketleri) & `QuizScreen` Tam Havuz (`fetchAllFromPool`) Bağlantısı** | `ExamsScreen` içine 3 farklı deneme paketi (Türkiye Geneli 65 Dk Prova, Tarih & Coğrafya Kamp Denemesi, 15 Dk Hızlı Mola Denemesi) eklenmesi ve `QuizScreen` üzerinden tüm soru havuzunun çekilmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-37** | **Ders Filtreli Hap Bilgi Kartları (`FlashcardsScreen` + 4 Ders + XP Kazanımı)** | `sample_flashcards.dart` zenginleştirmesi, `FlashcardsScreen` içine 4 ders filtresi ve öğrenilen kart başına `+15 XP` ödülü eklenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-38** | **KPSS Başarım Rozetleri (`Achievements`) & Haftalık Kadro Lig Sıralaması (`Leaderboard` — `StatsScreen`)** | `StatsScreen` üzerine 4 KPSS Başarım Rozeti (`İlk Pençe`, `Keskin Nişancı`, `Deneme Fatihi`, `Gümüş Kadro`) ve RPC destekli Liderlik Tablosu kartı | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-39** | **Kalıcı Yerel Depolama Katmanı (`LocalStorageService` + `shared_preferences`)** | Misafir modunda dahi XP, Seri, Günlük Soru Sayısı, Hedefler, Yanlış Defteri ve Çalışma Planı verilerinin cihazda kalıcı saklanması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-40** | **Kadro PRO 3'lü Paywall & RevenueCat (`purchases_flutter`) Entegrasyonu** | Aylık (89 ₺), İndirimli Yıllık (499 ₺) ve Sınava Kadar Tek Seferlik (349 ₺) satın alma ve PRO durum senkronizasyonu | 🟡 **Kısmi (Web bekliyor: `iyzico` ödeme ertelendi)** | ❌ | ✅ |
| **TASK-41** | **AdMob Ödüllü Video Reklam Motoru (`google_mobile_ads`)** | Günlük 30 soru limiti bittiğinde izlenen reklam ile +20 soru hakkı kazandıran gerçek AdMob Rewarded Ad motoru | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-42** | **200 Soruluk Zengin Çekirdek KPSS Genel Kültür Havuzu** | Tarih (50), Coğrafya (50), Vatandaşlık (50), Güncel Bilgiler (50) özgün soru JSON ve Supabase seed verisinin oluşturulması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-43** | **Akıllı Çalışma Bildirimleri (`flutter_local_notifications`) & Çökme Takibi (`sentry_flutter`)** | Günlük soru çözme ve seri koruma bildirimleri ile Sentry hata takip entegrasyonu | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-44** | **`QuizScreen` İki Yönlü Soru Gezintisi (Önceki/Sonraki Soru) & Zarif Yanlış Bildirimi** | Test içinde geriye doğru 1'e kadar ve ileriye doğru en son soruya gidebilme (`_userAnswers` geçmişi) + İlk yanlışta tek seferlik dismissible Koç bilgilendirme kartı | ✅ **Tamamlandı** (`64b1a2b`) | ✅ | ✅ |
| **TASK-45** | **`MistakesScreen` Ders Bazlı Filtreleme & Derse Özel Yanlış Çözüm Akışı** | Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler sekme/çip filtreleri, her dersin yanlış sayısı rozeti ve sadece seçilen dersin yanlışlarını test olarak başlatma | ✅ **Tamamlandı** (`ae86af6`) | ✅ | ✅ |
| **TASK-46** | **Kadro Çalışma Modları (Öğrenme/Anında Çözüm vs. Sınav/Gizli Çözüm & Zayıf Konu Testi)** | Anında doğru/yanlış gösteren öğrenme modu ile sonuçları karneye saklayan sınav modu; moda duyarlı geriye dönük şık değiştirme kuralı; zayıf konudan otomatik 10 soru çıkarma | ✅ **Tamamlandı** (`d62695b`) | ✅ | ✅ |
| **TASK-47** | **Hatalı Soru Raporlama & Yönetici İnceleme Paneli (`question_reports` + Supabase + UI)** | Test esnasında kullanıcının hatalı soruyu tek tıkla sebep ve notla bildirmesi (`ReportQuestionBottomSheet`); Supabase tablosu ve yöneticinin ders/test/soru bazlı inceleme ekranı | ✅ **Tamamlandı** (`d8b3b3a`) | ✅ | ✅ |
| **TASK-48** | **Canlı Soru Çözüm Modu Rozeti (`QuizScreen`) & Profil Mod Seçiminden Test Başlatma** | Soru ekranı AppBar'ına anında mod gösteren/değiştiren `_QuizModeBadge` eklenmesi ve Profil diyalogundan 'Bu Modla Hemen 10 Soru Çöz' butonuyla teste geçiş | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-49** | **`QuizScreen` QuizMode Null-Safety & Geriye Dönük Uyumluluk Yaması (Hot-Reload / Web TypeError Fix)** | Web ve eski yerel depolama verilerinde `QuizMode` değerinin `null` dönmesiyle AppBar'da oluşan `TypeError: null is not a subtype of type QuizMode` hatasını gideren defansif kontrol ve yedekleme | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-50** | **Kesintisiz Çalışma Döngüsü & Akıllı Sayfa İçi Yönlendirmeler (Zero Dead-Ends UX)** | Test karnesinde yanlış varsa tek tıkla Yanlış Defteri'ne yönlendirme; Yanlış Defteri boşken teste yönlendirme; Bilgi kartları bitince konu testine geçiş köprüsü | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-51** | **"ÖSYM Çeldirici Tuzağı" (UWorld Modeli) Açıklama Formatı & Çözüm Kartı Revizyonu** | `Question` modeline `distractorTrap` eklenmesi, soru çözüm açıklaması içine altın/kehribar vurgulu '⚠️ ÖSYM Çeldirici Tuzağı' analizi ve örnek soruların zenginleştirilmesi | ✅ **Tamamlandı** (`84bbe59`) | ✅ | ✅ |
| **TASK-52** | **Instagram & WhatsApp Uyumlu 9:16 "Zafer Karnesi" Hikaye Paylaşım Kartı (`ShareVictoryCard`)** | Test sonu karnesinde tek tıkla açılan 9:16 Story formatında viral karne kartı, net/başarı özeti, Koç Tuğrul görseli, pano kopyalama ve native paylaşım köprüsü | ✅ **Tamamlandı** (`82a9429`) | ✅ | ✅ |
| **TASK-53** | **Çerçevesiz & Büyük Pop-Out Maskot Tasarımı ve Derse Özel Tuğrul Varyasyonları** | Tuğrul maskotunu 84x84'lük kısıtlayıcı kutudan çıkarıp büyük (100px) çerçevesiz pop-out yapıya kavuşturma; Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler için 4 yeni tematik Tuğrul karakteri entegrasyonu | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-54** | **Mağaza Yayın Hazırlığı (App Icon, Splash Screen & Production Release Setup)** | Tuğrul maskotundan Android/iOS adaptive app icon (`flutter_launcher_icons`), derin indigo açılış ekranı (`flutter_native_splash`), Android v2 embedding / app label ve release build altyapısı | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-55** | **Kadro PRO Çevrimdışı Soru & Deneme İndirme Motoru (Offline-First Sync & Pro Paywall Kilidi)** | Sadece Kadro PRO üyelerine özel soru paketlerini ve denemeleri çevrimdışı kullanım için cihaza indirme (`OfflineDownloadService`), internet yokken indirilmemiş içerikte PRO Paywall yönlendirmesi | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-56** | **"De-AI" Tasarım ve Renk Restorasyonu: Yapay Zeka Morundan Kurtulma, Prestijli Devlet & Akademi Laciverti (`#1E3A5F`) ve Pedagojik UI Standartları** | Jenerik Tailwind/ChatGPT AI morunun (`#4F46E5`, `#818CF8`) tamamen sökülmesi; yerine ciddi, saygın ve göz yormayan Devlet & Akademi Gece Laciverti (`#1E3A5F`) + Zümrüt Teal (`#0D9488`) + Tok Altın (`#D97706`) paletine geçiş; `LucideIcons.sparkles` parıltı ikon enflasyonunun ve neon/violet parıltıların temizlenmesi | ⏭️ **Değiştirildi** (`TASK-107 - TASK-108` & `TASK-112`) | ➖ | ➖ |
| **TASK-57** | **Gelişmiş Kimlik Doğrulama: Google ile Giriş (OAuth), E-posta / Kullanıcı Adı ile Esnek Giriş-Kayıt & Şifre Sıfırlama** | Tek tıkla Google ile Giriş (`signInWithOAuth`), tek alanda hem e-posta hem kullanıcı adı desteği, şık 'Şifremi Unuttum' modalı, misafir çalışma verilerini hesaba aktaran bulut birleştirme köprüsü | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-58** | **Dikkat Çekici & Motive Edici Test Zorluk Rozetleri (Basit Alıştırma, Sınav Ayarı, Net Sıçratan, Kurtlar Sofrası / ÖSYM Tuzağı)** | Sıkıcı akademik zorluk etiketlerinin yerine adayın ilgisini çeken 4 seviyeli vurucu rozet sistemi ('Basit Alıştırma (Isınma)', 'Tam Sınav Ayarı', 'Net Sıçratan', 'Kurtlar Sofrası'); kart altı motive edici mini açıklamalar ve ColorScheme standardizasyonu | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-59** | **Tüm Sistemde Duyarlı & Uyarlanabilir Ekran (Responsive & Adaptive) Mimarisi (Kompakt Telefon, Standart Telefon, Tablet & Katlanabilir)** | `ui-ux-pro-max` disipliniyle küçük ekranlar (<380px) için sıfır taşma (overflow), esnek padding/font ölçeklemesi ve kat altı koruması; tabletler (>=600px) için maxWidth kısıtı (720px) ve adaptif 3-4 sütunlu grid yapısı | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-60** | **Ders Kartlarında Dairesel İlerleme Halkası (Animated Lesson Progress Ring) & Çözülen Test Oranı Göstergesi** | `LessonsScreen` ders kartlarındaki ikonların etrafına çözülen test / toplam test oranını gösteren animasyonlu dairesel ilerleme halkası (`LessonProgressRing`); kart içinde 'X / Y Test Tamamlandı' ve yüzde ilerleme rozeti | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-61** | **UI Taşma (RenderFlex Overflow) ve Görsel Hata Düzeltme Paketi (Test Sonucu, Dersler, İstatistik, Paywall, Navbar & BottomSheet)** | Test Sonucu ekranındaki 83px dikey taşmanın `ListView` ile çözülmesi; Güncel Bilgiler ders kartındaki 6.1px taşmanın `Flexible`/`Wrap` ile çözülmesi; İstatistik çözülen testler başlığının `Expanded` ile sarılması; Paywall plan kartlarında `Wrap` düzeltmesi; AppNavigationBar 'Ana Sayfa' taşmasının kompakt padding ile giderilmesi; Hatalı soru bildirme BottomSheet'inde `clipBehavior: Clip.antiAlias` ile köşe sızıntısının önlenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-62** | **UI & İçerik Sadeleştirme Paketi: Bilgi Kirliliğini Önleme, Gereksiz Rozet ve Tekrarların Temizlenmesi (Dersler, Konular, Konu Testleri)** | Tarih kartındaki '27 Soru · Kritik' rozetinin ve '7 Adımlı Yol Haritası' alt metninin kaldırılması; Konular ekranında mükerrer 'ADIM 1' rozeti ve 'Tarih · Konu Testi' metninin temizlenmesi; Konu testlerinde zorluk rozetlerindeki parantez içi açıklamaların, mükerrer 'Test 1' başlığının ve '10 Soru / 10 Soruluk Konu Testi' tekrarlarının temizlenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-63** | **Proje Genelinde Standart Spacing & Padding/Margin Sistemi (AppSpacing Tokens & Zero-Shift Sayfa Geçişleri)** | Uygulamadaki dağınık padding ve marginlerin (10, 14, 16, 20, 24px) 8pt/4pt sisteminde `AppSpacing` design token sınıfına bağlanması; 5 ana tab ekranında (Home, Lessons, Exams, Stats, Profile) kenar dolgularının ve üst/alt aralıkların eşitlenerek sayfa geçişlerindeki zıplamaların (Zero Layout Shift) önlenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-64** | **Yanlış Defteri 59px Taşma Düzeltmesi & Çevrimdışı İndirme UI/UX Dönüşümü (Zarif & Sade İndirme Modeli)** | Yanlış Defteri boş durumundaki butonların dar ekranda taşmasını önleyen `Wrap` düzeltmesi; her test/konu kartındaki göz yoran büyük 'İndir' butonlarının kaldırılarak Spotify/Duolingo stili zarif minimal rozet/mikro-ikon modeline geçilmesi ve üst başlığa 'Tümünü İndir' opsiyonunun eklenmesi | ⏭️ **Değiştirildi** (`TASK-55` & `TASK-75`) | ➖ | ➖ |
| **TASK-65** | **Profil Ekranı Evrimi: Aday Kimlik Kartı, KPSS 2026 Geri Sayımı, Lig & Başarı Rozetleri Vitrini ve Bulut Eşitleme Merkezi** | Profil ekranının sıradan bir 'Ayarlar' listesi olmaktan çıkarılıp Duolingo/UWorld seviyesinde zenginleştirilmesi: Aday kimliği & avatarı, hedef puan & atama rotası, canlı 2026 KPSS geri sayımı, 4'lü metrik snapshot'ı (Seri, Soru, Net %, XP), Lig & Unvan vitrini, 6 adet motivasyon madalyası ve modern hesap ayarları | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-66** | **Bağımsız Çalışma Türleri & Antrenman Ekranı (`PracticeHubScreen`), Zenginleştirilmiş Alt Menü (`AppNavigationBar`) ve Görev Hatırlatıcılı Yeni Ana Sayfa** | Çalışma türlerinin (Konu Testi, Bilgi Kartları, Yanlış Defteri, Deneme, Mini Oyunlar, Çeldirici Avı) ana sayfadan ayrılıp bağımsız 'Pratik' sekmesine (`PracticeHubScreen`) taşınması; `AppNavigationBar`'ın 6 sekmeli zengin ve taşmasız dock yapısına yükseltilmesi; `HomeScreen`'in görev hatırlatıcıları, seri uyarıları, son kalınan yer ve günlük çalışma planı odaklı kişisel komuta merkezine dönüştürülmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-67** | **Özgün İkon Mimarisi Dönüşümü: Sıradan Lucide İkonlarından `phosphor_flutter` (Duotone, Fill & Bold) Karakteristik İkon Sistemine Geçiş** | Her projede kullanılan sıradan tek çizgili `LucideIcons` ve `Icons.*` kullanımlarının kaldırılarak `phosphor_flutter` paketine geçilmesi; kart ve rozetlerde çift katmanlı `PhosphorIconsDuotone`, alt menü aktif sekmelerinde tok dolgulu `PhosphorIconsFill`, pasif sekme ve aksiyonlarda `PhosphorIconsBold` kullanılması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-68** | **"Tuğrul Evreni" Maskot Çeşitlendirme (12 Özgün Karakter Modu), Etkileşimli Dokun-Konuş (`Tap-to-Inspire`) ve Dinamik Mood Aurası** | Kopya maskot görsellerinin yerine `image-generator` ile Tarihçi, Kâşif, Hukukçu, Haberci, Antrenör, Baş Gözetmen, Analist ve Ateşli Seri Tuğrul illüstrasyonlarının üretilmesi; `MascotCoachBanner` bileşeninin üzerine dokunulduğunda zıplayıp derse/ekrana özel KPSS strateji tüyoları veren etkileşimli (`StatefulWidget`) yapıya ve mood bazlı dinamik aura renklerine yükseltilmesi | ✅ **Tamamlandı** (`ede6127`) | ✅ | ✅ |
| **TASK-69** | **`AppTopBar` / `AppBar` Uzun Başlık Taşması (Overflow) Düzeltmesi & Pratik Sekmesi Akademik İkon/Maskot/Söylem Revizyonu (Oyun Kolu İkonunun Kaldırılması)** | `AppTopBar` içindeki sayfa başlığı (`Row` -> `Text`) sığmadığında oluşan `RenderFlex overflow` hatasının `Flexible` + `TextOverflow.ellipsis` ve kompakt font ölçeklemesiyle giderilmesi; diğer tüm `AppBar` başlıklarının taşmaya karşı korunması; Pratik sekmesindeki ve `MascotMood.practice` modundaki `gameController` (oyun kolu) ikonunun ve oyun söylemlerinin kaldırılarak ciddi akademik hedef/antrenman (`PhosphorIconsBold.target` / `PhosphorIconsFill.target`) ikonuna ve soru çözüm odaklı Tuğrul görseline dönüştürülmesi | ✅ **Tamamlandı** (`865e05f`) | ✅ | ✅ |
| **TASK-70** | **Sonuç Ekranlarında "Tek Bakışta Sıfır Kaydırma" (`Zero-Scroll Single-Viewport`) Kompakt UI/UX Dönüşümü (`QuizResultScreen`, `_BlitzSummaryView`, `_FlashcardsSummaryView`)** | Test Sonu Karnesi (`QuizResultScreen`), 60 Saniyede Pençe Özeti (`_BlitzSummaryView`) ve Bilgi Kartları Özeti (`_FlashcardsSummaryView`) ekranlarındaki aşırı büyük kart dolgularının (`padding: 24`), devasa fontların (`displayMedium` / `headlineMedium`) ve geniş boşlukların (`gapLg`) kompaktlaştırılması; tüm skorların ve aksiyon butonlarının kullanıcıya scroll yaptırmadan tek ekranda görünmesi | ✅ **Tamamlandı** (`9862149`) | ✅ | ✅ |
| **TASK-71** | **Mobil Ekranlar İçin `AppBar` ve Alt Detay Sayfası Başlık Tipografisi Ölçeklemesi (Kesilmeleri Önleyen Kompakt Başlık Sistemi)** | M3 varsayılan `22px` (`titleLarge`) `AppBar` başlıklarının Türkçe ders/konu adlarında (`'Tarih Konuları'`, `'Güncel Bilgiler Konuları'`, `'İslamiyet Öncesi Türk Tarihi'`) aşırı büyük durup kesilmesini (`...`) önlemek için global `AppBarTheme` başlık stilinin (`16px`), `titleSpacing: 0` boşluğunun, `TopicTestsScreen` / `LessonTopicsScreen` / `QuizScreen` / `AppTopBar` ve `MascotCoachBanner` başlık boyutlarının mobil ekranlara uygun zarif ölçeğe çekilmesi | ✅ **Tamamlandı** (`d8f663b`) | ✅ | ✅ |
| **TASK-72** | **Proje Genelinde Standart Tipografi & Font-Size Ölçek Sistemi (`AppTheme` 12 Seviyeli Modüler Tipografi Standardı & Sıfır Hardcoded `fontSize`)** | `lib/app/theme.dart` içinde `displayLarge`'dan `labelSmall`'a kadar tüm 15 M3 metin stilinin birbiriyle uyumlu matematiksel mobil ölçeğe (`28 / 22 / 19 / 17 / 15.5 / 14 / 15 / 13.5 / 12 / 13 / 11.5 / 10.5 px`) bağlanması; `lib/app/theme.dart` dışındaki tüm ekranlarda dağınık `fontSize:` ezme (override) kullanımlarının temizlenmesi ve ekranlar arası başlık/kart/metrik tipografi rollerinin standartlaştırılması | ✅ **Tamamlandı** (`57c0804`) | ✅ | ✅ |
| **TASK-73** | **`ui-ux-pro-max` Mobil Tipografi (`Base 16px`: `28-24-20-18-16-15-14-12-11 px`) ve 3 Kademeli Padding Hiyerarşisi Revizyonu** | Küçük kalan başlık ve gövde yazılarının iOS HIG / Material 3 / `ui-ux-pro-max` gerçek mobil ölçeğine (`titleLarge: 18px`, `titleMedium: 16px`, `titleSmall: 15px`, `bodyLarge: 16px`, `bodyMedium: 14px`, `bodySmall: 12px`, `labelLarge: 14px`, `labelMedium: 12px`, `labelSmall: 11px`) yükseltilmesi; `SectionTitle` (`18px`), `LessonsScreen` (`18px`), `MascotCoachBanner` (`16px` başlık + `14px` konuşma balonu), `PracticeHubScreen` (`15px` başlık + `14px` padding) ve `LessonTopicsScreen` (`16px` kesilmeyen başlık) hiyerarşisinin uygulanması | ✅ **Tamamlandı** (`b77e3f8`) | ✅ | ✅ |
| **TASK-74** | **Dikey Hizalama & Kenar Kılavuz Çizgisi Standardizasyonu (`AppTopBar`, `Body`, `SectionTitle`, `AppNavigationBar` ve `AppBarTheme` Sol/Sağ Flush Alignment)** | `AppBarTheme` içindeki `titleSpacing: 4` nedeniyle üst barın (`AppTopBar`) sol kenarının `4px`'ten başlayıp alt gövdenin (`16px`) dışına taşması hatasının düzeltilmesi; `AppTopBar` sol `titleSpacing` ve sağ `actions` boşluğunun, `SectionTitle` sol hizasının (`horizontal: 0`) ve `AppNavigationBar` yan boşluklarının `ResponsiveBreakpoints.horizontalPadding(context)` (`12px / 16px / 24px`) ile milimetrik olarak aynı dikey hizaya getirilmesi | ✅ **Tamamlandı** (`01178d3`) | ✅ | ✅ |
| **TASK-75** | **Çözülen Test / Konu / Deneme Kartlarında Tamamlanma Durumu (`✅ Çözüldü` Rozeti, Son Net Özeti & `Tekrar Çöz` Aksiyonu) + Konu Kartı İndir İkonlarının ve Test Kartı Gereksiz Açıklamalarının Temizlenmesi** | Kullanıcı bir testi veya denemeyi bitirdiğinde (`studyStatsProvider.sessionHistory`), uygulamaya tekrar girdiğinde `TopicTestsScreen`, `LessonTopicsScreen` ve `ExamsScreen` kartlarında zümrüt yeşili kenarlık/arka plan tonu, `✅ Çözüldü · XD YY (Z.Z Net)` rozeti ve `Tekrar Çöz` butonunun gösterilmesi; `LessonTopicsScreen` konu kartlarındaki tekil indirme ikonlarının kaldırılıp sadece üstteki `Tümünü İndir` butonunun bırakılması; `TopicTestsScreen` test kartlarındaki mükerrer seviye başlığı ve `'Konuyu yeni bitirdiysen...'` açıklama metinlerinin kaldırılması | ✅ **Tamamlandı** (`cc400be`) | ✅ | ✅ |
| **TASK-76** | **Soru Metinlerindeki LaTeX (`$\rightarrow$`, `arrow`), Markdown (`**...**`) ve Gereksiz Tırnak (`""`) Kalıntılarının 2 Katmanlı Temizliği (`Question.cleanText` + Supabase `UPDATE` SQL + Repo Soru Havuzu)** | `Question.fromSupabase` ve `Question.fromJson` içine anlık metin temizleyici (`Question.cleanText`) eklenmesi; tüm `docs/soru_havuzu/**/*.sql`, `.md` ve `assets/data/questions.json` dosyalarındaki LaTeX/Markdown/tırnak kalıntılarının temizlenmesi ve mevcut Supabase veritabanını tek tıkla güncelleyen `docs/soru_havuzu/fix_question_texts_supabase.sql` betiğinin oluşturulması | ✅ **Tamamlandı** (`fd51a3e`) | ✅ | ✅ |
| **TASK-77** | **Konu Kartlarında (`LessonTopicsScreen`) Gerçek Test Sayısı (`solved/totalTests`) Rozeti ve Yalnızca Tüm Testler Çözülünce Tik (`✓`) Atılması** | `LessonTopicsScreen` konu kartlarında sadece 1 test çözülünce hemen tik (`✓`) atılması yerine, yalnızca konudaki tüm testler (`solvedTestCount >= totalTestCount`) tamamlandığında yol haritası düğümüne ve rozete tik atılması; rozet yazısının `'1 Test Çözüldü'` yerine `'1/9 Test'` (tamamlandığında `'9/9 Test Tamamlandı'`) olarak dinamik gösterilmesi | ✅ **Tamamlandı** (`a16908c`) | ✅ | ✅ |
| **TASK-78** | **KPSS Sınav Geri Sayım & Çoklu Tasarımlı (Dikey / Yatay Masa Saati) Pomodoro Odak Stüdyosu (`PomodoroStudioScreen`, 3 Saat Tasarımı: `Halka` / `Flip Clock` / `Zen`, Ders Bazlı Süre Takibi & `HomeExamPomodoroBanner`)** | YPT (Yeolpumta), Flocus, Flip Focus ve iOS StandBy araştırması doğrultusunda: (1) KPSS Lisans / Önlisans / Ortaöğretim sınavlarına Gün-Saat-Dakika-Saniye canlı geri sayım + hazırlık süreci ilerleme çubuğu; (2) `25/5 Klasik`, `50/10 KPSS Derin Odak`, `65/15 Gerçek Sınav Provası` ve `Serbest Kronometre` modları; (3) 3 farklı saat tasarımı (`Akademik Halka`, `Retro Masa Saati / Flip Clock`, `Minimal Zen Tipografi`); (4) Tek tuşla Dikey/Yatay (`SystemChrome.setPreferredOrientations` + `OrientationBuilder`) tam ekran masa saati modu; (5) Ders etiketli (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) odak süresi kaydı + XP ödülü ve `HomeScreen` / `PracticeHubScreen` entegrasyonu | 🚫 **İptal / Değiştirildi** (Pomodoro kaldırıldı; Geri Sayım `TASK-126`) | ➖ | ➖ |
| **TASK-79** | **İnteraktif Harita Atölyesi Temel Mimarisi & 81 İl Dilsiz Harita Motoru (`MapPracticeHubScreen`, `MapChallengeScreen`, `TurkeyMap` Dokunma Geri Bildirimi & Zümrüt/Kırmızı Renklendirme)** | Feature-First mimarisiyle `lib/features/map_practice/` modülünün kurulması, `MapChallenge` modelleri, `LocalMapPracticeRepository`, 81 il için rastgele sonsuz soru üreten `generateDynamicProvinceChallenges` dinamik motoru, `MapChallengeScreen` dokunma tespiti, UWorld açıklama kartı ve `PracticeHubScreen` vitrin entegrasyonu | ✅ **Tamamlandı** (`a5d34be`) | ✅ | ✅ |
| **TASK-80** | **Harita Atölyesi Konu Havuzunu Genişletme (Tarım, Maden, Sanayi & Kurtuluş Savaşı Cepheleri — 50+ Uzman Soru)** | Mevcut 12 soruluk kütüphanenin genişletilmesi; Pamuk, Bor, Fındık, Çay, Boksit gibi tarım/maden sorularının 50'ye çıkarılması; Tarih dersi için Kurtuluş Savaşı Doğu/Güney/Batı cepheleri, kongre rotası ve Sevr/Lozan sınır harita pratiklerinin eklenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-81** | **Hap Bilgi Kartları (`FlashcardsScreen`) 200 Kartlık KPSS Şifre, Kodlama & İlkler Havuzu** | Tarih (50), Coğrafya (50), Vatandaşlık (50) ve Güncel Bilgiler (50) olmak üzere toplam 200 adet sınav kazandıran hap bilgi kartı; KAYIP SAKAL, TAKKEM gibi akrostişler, ıslahat şifreleri ve anayasal kilit sürelerin `sample_flashcards.dart` içine entegre edilmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-82** | **"60 Saniyede Pençe" Doğru / Yanlış Refleks Havuzu (100 Şimşek Önerme & ÖSYM Çeldirici Tuzağı Deşifresi)** | `sampleTrueFalseItems` havuzunun 8 adetten 100 adede çıkarılması; ÖSYM'nin en meşhur tuzak şıklarından türetilen hızlı refleks önermeleri ve yanlışta anında çıkan 1 cümlelik vurucu gerekçeler | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-83** | **"Kavram Eşleştirme" (`ConceptMatchScreen`) 20 Tematik Set** | `sampleConceptMatchSets` havuzunun 3 setten 20 sete çıkarılması; Coğrafya (*Maden-Şehir*, *Ova-Oluşum*, *Baraj-Akarsu*, *Rüzgar-Yön*), Tarih (*Padişah-Islahat*, *Antlaşma-Önem*, *Savaş-Sonuç*), Vatandaşlık (*Kurum-Üye Sayısı*, *Hak Türü-Kategori*) eşleştirmeleri | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-84** | **Tarih Dersi (27 Soru) Supabase Sıralama & 540 Soru Standardizasyonu (9 Konu × 60 Soru)** | Supabase'deki 666 Tarih sorusundaki mükerrerlerin temizlenmesi; 9 ana konuya 60'ar soru (her konuda 6 test, 10 soru) atanması, `order_index` (1..60) kolonu ile sabitlenmesi ve Test 1-2 ilk sorularına UWorld çeldirici analizi + padişah/ıslahat şemalarının eklenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-85** | **Vatandaşlık Dersi (9 Soru) 300 Soru Standardizasyonu & `order_index` Sabitlemesi (6 Konu × 50 Soru)** | 6 konuya 50'şer soru (her konuda 5 test, 10 soru) atanması, `order_index` (1..50) kolonu ile test sıralarının kilitlenmesi, master SQL (`00_tum_vatandaslik_sorulari_tek_dosya.sql`) ve `sample_questions.json` entegrasyonu | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-86** | **2024-2026 KPSS Güncel Bilgiler Soru Havuzu Standardizasyonu (6 Konu × 40 Soru = 240 Soru)** | UNESCO mirasları, TÜRKSOY kültür başkentleri, son siyasi/kültürel gelişmeler, Nobel, uzay ve spor başarıları odaklı güncel soru havuzunun `order_index: 1..40` ile derlenmesi, master SQL ve offline fallback entegrasyonu | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-87** | **60 Soru, 65 Dakika Gerçek Genel Kültür Deneme Sınavı Motoru & Detaylı Net Karnesi** | 27 Tarih + 18 Coğrafya + 9 Vatandaşlık + 6 Güncel soru dağılımıyla tam 60 soruluk gerçek sınav modu; soru paleti/atlama, boş bırakma, 65 dk geri sayım ve 4 yanlış 1 doğruyu götüren detaylı ders bazlı net karnesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-88** | **Ticari Sürüm & Mağaza Hazırlığı (Kadro PRO Satın Alma, AdMob Ödüllü Reklam, Çevrimdışı İndirme & Release Optimizasyonu)** | Günlük 30 soru bittiğinde +20 soru kazandıran Rewarded Ad akışı; Kadro PRO abonelik kontrolü, soru paketlerini cihaza indirme (offline mode) ve Google Play Store release bundle optimizasyonu | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-89** | **Veritabanı Seviyesinde Rate-Limit & RLS Zırhı (`public.rate_limits` + PostgreSQL Sliding-Window Triggers)** | PostgreSQL içinde kayan pencereli rate limit motoru; 1 dakikada max 3 soru raporu, 60 saniyede max 2 sınav kaydı, profil XP hile önleme trigger'ı ve `questions`/`flashcards` read-only RLS kısıtlaması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-90** | **İstemci (Flutter) Seviyesinde Akıllı Rate Limiter & Cooldown Kalkanı (`ClientRateLimiter` + Anti-Spam)** | `ClientRateLimiter` yardımcı servisi; soru raporlamada (`QuestionReportRepository`) 1 dakikada 3 rapordan fazlasının sunucuya gitmeden cihazda engellenmesi ve butonlara çift tıklama koruması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-91** | **Mikro-Analitik Soru Denemelerinin Toplu Gönderimi (`CloudSyncRepository` Batching Queue)** | Her soruda tekil HTTP POST isteği atmak yerine `_attemptQueue` içinde toplanması ve sınav bitiminde tek 1 toplu (bulk) INSERT ile gönderilmesi; ağ trafiği ve istek adedinin %98 azaltılması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-92** | **Akıllı Çevrimdışı TTL Veri Önbelleği (`QuestionRepository` 2 Saatlik In-Memory Caching)** | Sorular, doğru/yanlış ve kavram eşleştirme verilerinin her ekran açılışında yeniden Supabase'ten çekilmeyip 2 saatlik TTL ile bellekten (0ms) sunulması; Egress maliyetinin %95 düşürülmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-93** | **Supabase Dashboard & Kong API Gateway Güvenlik Rehberi (`02_security_ratelimit_hardening.sql`)** | Supabase SQL Editor için tek tıkla çalıştırılabilir rate limit migrasyonu, Kong IP rate limit ve Auth brute-force koruma kılavuzunun hazırlanması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-94** | **Sürüm Kontrolü & Dinamik Bakım Modu (Remote Config & Force Update)** | Supabase `public.app_config` tablosu, `AppConfigService`, eski sürümleri Google Play'e yönlendiren `ForceUpdateDialog` ve bakım modu ekranı | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-95** | **Veritabanı Otomatik Temizlik & Boyut Koruma (Data Retention & Auto-Purge Trigger)** | 30 günden eski mikro soru loglarını otomatik arşivleyen/temizleyen PostgreSQL `purge_expired_attempt_logs()` motoru | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-96** | **Soru Havuzu Güvenliği & Telif / Kazıma (Scraping) Kalkanı** | Maksimum soru sorgu limiti kuralı (`limit(60)`) ve soru çözüm ekranlarında ekran kaydı/görüntüsü almayı engelleyen güvenlik kalkanı | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-97** | **Akıllı Yerel Hatırlatıcılar & Alışkanlık Döngüsü (Daily Habit & Streak Notifications)** | İnternetsiz çalışan akşam 20:30 seri koruma ve Pazar 10:00 genel deneme yerel bildirimleri | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-98** | **Dopamin Anında 5 Yıldız Puan Toplama Motoru (In-App Review Engine)** | Rekor net, 7 günlük streak veya 10'da 10 yapıldığında uygulama içinden Google Play yıldız penceresini açma | ✅ **Tamamlandı** | 🚫 | ✅ |
| **TASK-99** | **Freemium & Kadro PRO Dengesi: Cömert Temel Deneyim + Güçlü 4 PRO Ayrıcalığı** | Tüm soru/kart/harita/açıklamaların ücretsiz sunulması + Sınırsız Soru, Deneme Arşivi, Çevrimdışı İndirme ve Yanlışlardan Test Üretici kapıları | 🟡 **Kısmi (Web bekliyor: `iyzico` ödeme ertelendi)** (`efcf808`) | ❌ | ✅ |
| **TASK-100 - TASK-106** | **Yayın Hazırlığı, Çapraz Cihaz Senkronizasyonu, Sınav Geri Sayımı ve Otomatik Çalışma Programı** | Android release/keystore yapılandırması, Google Sync & Cloud Sync Repository, 3 farklı saat temalı KPSS Pomodoro ve 15-90 dk 5 tempolu otomatik çalışma planı | ✅ **Tamamlandı** (`768655e` · Android keystore/release Web 🚫 · Pomodoro iptal) | ✅ | ✅ |
| **TASK-107 - TASK-108** | **Tasarım Sistemi Evrimi: "Tuğrul Kobaltı & Anadolu Altını" EdTech Kimliği** | Lucide ve jenerik AI morunun kaldırılması; Kobalt/Zümrüt/Altın paleti, TactileCard, Outfit/DM Sans ve 12 mood TuğrulAvatar madalyon sistemi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-109** | **Sıralı Çalışma Modu Kilidi & Önceki Günlere Dönüş / Görev Tekrarı** | Günün tüm görevleri tamamlanmadan sonraki güne geçişi engelleme/kilitleme; geçmiş günlere (Gün 1..X) geri dönebilme ve tamamlanmış görevleri `Tekrar Çöz` ile yeniden başlatabilme | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-110** | **Çalışma Süresi / Tempo Değişiminde İlerlemenin Korunması & Akıllı Müfredat Adaptasyonu** | Kullanıcı günlük süresini (15-90 dk) değiştirdiğinde ilerlemenin sıfırlanmasını önleme; çözülmüş testleri bilip sıradaki çözülmemiş testten devam eden ve tempoya uyarlanan akıllı program motoru | ⏭️ **Değiştirildi** (`TASK-116` & `TASK-132`) | ➖ | ➖ |
| **TASK-111** | **KPSS Genel Yetenek (Türkçe & Matematik) Altyapı Hazırlığı & "Yakında" Modül Vitrini** | Genel Yetenek (Türkçe 30 Soru, Matematik & Geometri 30 Soru) müfredat iskeletinin tanımlanması; `LessonsScreen` üzerinde "Genel Yetenek (Yakında)" rozetli kartlar ve bilgilendirici diyalog entegrasyonu | ⏭️ **Değiştirildi** (`TASK-133`) | ➖ | ➖ |
| **TASK-112** | **Ana Sayfa "De-AI-Slop" & Renk/Görsel Sadeleştirme (Temiz EdTech & Prestijli Akademi Estetiği)** | Ana sayfadaki gökkuşağı renk kirliliğinin (yıl=mavi, ay=yeşil, gün=turuncu), mükerrer maskotların, aşırı doygun arka plan kutularının ve gereksiz parlak gölgelerin temizlenmesi; saf yüzey, tutarlı tekil vurgu ve sakin tipografi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-113** | **Google Play & KVKK / GDPR Hukuki Uyumluluk Paketi (Gizlilik Politikası, Kullanım Koşulları, Açık Kaynak Lisansları & Hesap Silme Akışı)** | 6698 Sayılı KVKK Aydınlatma Metni, Kullanım Koşulları, ÖSYM Sorumluluk Reddi dokümanları; `ProfileScreen` ve `AuthScreen` hukuk merkezi; Google Play zorunlu "Hesabı ve Verileri Sil" çift onaylı veri tasfiye akışı | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-114** | **KPSS Puan Hesaplama Robotu (P3 / P93 / P94) & Son 3 KPSS Sınav Yılı Karşılaştırma Motoru** | Uygulama içi KPSS Lisans (P3), Ön Lisans (P93) ve Ortaöğretim (P94) puan hesaplayıcı (`lib/features/score_calculator/`); 4 yanlış 1 doğru ve 1 net baraj kuralları; son 3 KPSS sınav yılı (2026·2025·2024 / 2026·2024·2022) istatistiksel karşılaştırması; minimalist sade arayüz; `PracticeHubScreen` ve `ExamsScreen` entegrasyonu | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-115** | **Çalışma Planı & Günlük Görev İlerlemesinin Çoklu Cihaz ve Oturumlar Arası Kalıcı Bulut Senkronizasyonu (`PlannerSyncSnapshot`)** | Oturum açma/kapatma ve cihaz değişiminde çalışma planı gün ilerlemesinin ve tamamlanan görevlerin korunması; `PlannerSyncSnapshot` veri modeli, `LocalStorageService` hesap bazlı önbellek (`_keyAccountPlannerSnapshot`), Supabase `planner_state` (Auth metadata + `profiles` tablosu) çift katmanlı bulut senkronizasyonu, High-Water Mark birleştirme mantığı (`mergeWith`) ve sıfır veri kaybı | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-116** | **Çalışma Planı Snapshot'ında Tam Görev Nesneleri (`tasks_by_day`) ve Kayıpsız Tempo Adaptasyonu (`30 dk -> 60 dk`)** | `PlannerSyncSnapshot` içine `tasksByDay` eklenmesi, `StudyTask.isSameTaskItem` semantik eşleşmesi ve `adaptStudyProgramPace` ile ilerleme sıfırlanmadan tempo güncellemesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-117** | **Bağımsız Çözülen Konu Testlerinin Günlük Çalışma Planındaki Görevlerle Otomatik Eşleşmesi ve Üstü Çizili Gösterimi** | Dersler/Konu Testleri ekranından bağımsız çözülen testlerin `markMatchingTestCompleted` ve `syncCompletedFromStats` ile aktif/gelecek plan görevlerini otomatik tamamlaması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-118** | **Freemium Günlük Soru Limiti (`dailyFreeQuestionLimit` & `dailySolvedCount`) Çoklu Cihaz, Oturum Kapatma ve Önbellek Silme Koruması** | `profiles.daily_solved_count` / `daily_free_limit`, cihaz günlük kotası (`kadro_device_daily_quota`) ve 5 kaynaktan High-Water Mark kota senkronizasyonu | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-119** | **Giriş Öncelikli Açılış Kapısı (Auth-First Gate), İlk Oturumda Tek Seferlik Zorunlu Kurulum (Post-Login Onboarding) ve Çoklu Cihaz Senkronizasyonu** | `AuthScreen(isInitialGate: true)`, `_CloudHydrationScaffold`, sıralı bulut hidrasyonu ve telefon/web birebir plan tutarlılığı | 🚫 **İptal / Değiştirildi** (Auth-First -> `TASK-155`) | ➖ | ➖ |
| **TASK-120** | **Çalışma Türleri (`PracticeHubScreen`) "Konu Testi" Ders/Konu Yol Haritası Bağlantısı & 3 Soruluk Fallback Noktalarının Havuza Bağlanması** | "Konu testi" kartına tıklanınca 4 Genel Kültür dersi seçici Bottom Sheet ile `LessonTopicsScreen` -> `TopicTestsScreen` akışına geçiş; "Deneme sınavı" (60 soru `mockExamNumber: 1`), "ÖSYM Çeldirici Avı" (`fetchAllFromPool: true, limit: 10`) ve Ana Sayfa "Seri & Hedef" hatırlatıcısının gerçek soru havuzuna bağlanması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-121** | **Gelişmiş Antrenman Modları: Özel Çeldirici Avı Motoru, Hızlı Deneme Seçici ve Akıllı Seri Koruma Test Üretici** | `QuestionRepository.fetchDistractorHuntQuestions` ile `distractorTrap` analizli soruları süzen çeldirici avı motoru (`QuizScreen.onlyDistractorTraps`); `PracticeHubScreen` üzerinde 3 tam deneme + 20 soruluk Hızlı Mini Deneme seçici alt çekmecesi; `HomeScreen` "Seri & Hedef" hatırlatıcısının kalan hedefe (`5..20`) ve zayıf derse göre test üretmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-122** | **KPSS Puan Hesaplama Ekranı (`KpssScoreCalculatorScreen`) Sıfır Varsayılan Değerler & Kompakt Dropdown Sınav Türü Seçici** | Açılışta GY/GK doğru ve yanlış sayılarının varsayılan olarak `0` gelmesi; 3'lü yatay segment seçici yerine ekran alanını verimli kullanan kompakt `DropdownButton<KpssScoreType>` sınav türü seçicisine geçilmesi ve widget testlerinin güncellenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-123** | **Harita Atölyesi (`MapPracticeHubScreen` & `MapChallengeScreen`) "Dilsiz Harita (81 İl)" Dar Ekran Taşma (RenderFlex Overflow) Düzeltmesi** | `MapPracticeHubScreen` üzerindeki "Dilsiz Harita (81 İl)" + "Sonsuz Pratik" rozet satırının `Wrap` yapısına geçirilmesi, mod seçici alt çekmecenin kaydırılabilir yapılması, `MapChallengeScreen` başlık/etiket satırlarının `Flexible`/`Expanded` ile korunması ve 360x640 mobil taşma testinin eklenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-124** | **Harita Soruları & İl Seçme Ekranında Minimum Kenar Boşluğu, Harita İçi Yakınlaştırma (`+`/Pinch) ve Tam Ekran Büyütme Modalı** | Küçük illerin (`Yalova`, `Kilis`, `Bartın` vb.) kolay seçilebilmesi için `TurkeyMap`, `TurkeyMapCard` ve `MapChallengeScreen` kenar boşluklarının (padding) minimuma indirilerek haritanın ekran genişliğine yayılması; `InteractiveViewer` + hızlı `+`/`Sıfırla` butonları ve soru üstü göstergeli `5x` tam ekran **`Büyüt`** diyaloğunun eklenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-125** | **Ana Sayfa "Bugünün Çalışma Planı" (`HomeDailyPlanCard`) Sadeleştirme & Okunaklı Görsel Hiyerarşi** | Mükerrer `"Planlayıcıyı Aç & Görev Ekle"` ve `<`/`>` oklarının temizlenmesi; sade `Gün X · Tempo` + `Düzenle` satırı, görsel ilerleme çubuğu (`LinearProgressIndicator`) ve çerçeveli tekil görev kutularının (`_DailyPlanTaskItem`: Başlık, Ders alt etiketi ve `Başla`/`Tekrar` rozeti) uygulanması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-126** | **[Çekirdek Mimari · Ön Koşul] Yönetişim Güncellemesi, Çoklu KPSS Alan Modelleri (`KpssExamFamily`, `ExamSelection`) & Dinamik Sınav Takvimi (`AppRemoteConfig`)** | `GEMINI.md` ve `content-specification-guide.md` MVP kilidinin çoklu KPSS mimarisine uyarlanması; geriye dönük uyumlu `KpssExamFamily`, `EducationLevel`, `OabtBranch` (17 branş + YDS), `DisabilityGroup`, `ExamSelection` (kapsam + alt dal değer nesnesi) modellerinin kurulması ve `AppRemoteConfig.examDateOverrides` ile `HomeScreen` / `KpssExamTarget` sabit yıl/tarih (`KPSS 2027`) bağımlılığının kaldırılması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-127** | **[Çekirdek Mimari · Ön Koşul] Merkezi Müfredat Kayıt Motoru (`CurriculumRegistry` & `ExamCurriculum`) — Sabit `kpssLessons` Hardcoding Refaktörü** | `kpss_lessons.dart` içindeki sabit 4-ders / `defaultTopicTestCount` `if-else` yapısının değiştirilerek her `ExamSelection` için ders/konu/ağırlık/test sayısı üreten `CurriculumRegistry` + `activeCurriculumProvider` servisine geçilmesi; `LessonsScreen`, `FlashcardsScreen`, `MistakesScreen` ve `StudyProgramPace` içindeki sabit 4-ders / 60-soru hardcoding'lerinin temizlenmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-128** | **[Veritabanı · Güvenlik & İndeksleme] Çoklu Sınav PostgreSQL Şeması (`exam_scopes`), `user_topic_mastery` Çakışma Düzeltmesi & RLS/RPC Zırhı** | `docs/supabase_migrations/05_multi_exam_architecture.sql` (`03`/`04` mevcut olduğu için `05_`): `questions` için `exam_scopes text[]`, `sub_branch`, `education_level`, `disability_variant`, `source_variant` ve **GIN + composite/partial indeksler**; `user_topic_mastery` `unique(user_id, lesson, topic)` çakışmasının `unique(user_id, exam_scope, lesson, topic)` ile çözülmesi; `profiles.exam_selection jsonb` CHECK kısıtı, `is_pro`/XP/rate-limit trigger uyumu, `is_active = true` RLS, `get_weekly_leaderboard(p_exam_family)` RPC güncellemesi, `docs/supabase_schema.sql` senkronizasyonu ve sözleşme testleri *(05_multi_exam_architecture.sql canlı Supabase'de uygulandı)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-129** | **[Performans · Önbellek & Ad Uzayı] Namespace İzolasyonu, Scope-Sharded Isolate JSON Yükleyici, LRU+TTL Önbellek & `MistakeRepository` Batch Hydration** | `Question` modeline `examScopes`/`subBranch`/`disabilityVariant`/`sourceVariant` alanları; `LocalStorageService` ve `OfflineDownloadService` paket anahtarlarının `'topic_${scopeNamespace}_${lesson}_$topic'` ile izole edilmesi; `QuestionRepository` kapsam bazlı modüler asset + `compute()` Isolate parse + bounded LRU/TTL önbellek; `lessonTopicTestCountsProvider` kapsam anahtarlaması; `MistakeRepository.hydrateFromCloud()` tam havuz çekme anti-pattern'inin `.inFilter('id', ids)` toplu sorgusuna çevrilmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-130** | **[Yeniden Kullanılabilir Motor] Dinamik Deneme Şablonu (`MockExamBlueprint`), Bölüm Sekmeli Optik Palet & Veri Güdümlü `PracticeHub` / `ExamsScreen`** | Sabit `60 soru / 65 dk` yerine çoklu bölüm, süre ve ek-süre destekli `MockExamBlueprint` + `QuestionRepository.generateMockExamFromBlueprint` motoru; `QuizScreen` içine uzun/çoklu oturumlar için ders sekmeli optik palet ve erişilebilir ek süre sayacı; `ExamsScreen` ve `PracticeHubScreen` alt çekmecelerinin tamamen `activeCurriculumProvider` üzerinden üretilmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-131** | **[UI/UX & Senkronizasyon] Evrensel 2 Kademeli Hiyerarşik Sınav Seçici (`ExamTargetPickerView`), Onboarding Yenilemesi & Çoklu Cihaz `ExamSelection` Senkronu** | `TargetExamSelectorBottomSheet`, `OnboardingScreen`, `AutoStudyProgramModal` ve `PomodoroStudioScreen` içindeki dağınık/kısıtlı seçicilerin tek yeniden kullanılabilir `ExamTargetPickerView` bileşeninde birleştirilmesi (Kademe 1: Sınav Ailesi, Kademe 2: Düzey/Branş/Engel Grubu/Alan Paketi) ve `UserPreferencesNotifier` / `CloudSyncRepository` üzerinden sıralı bulut hidrasyonuna (`TASK-119` korumalı) bağlanması | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-132** | **[Planlayıcı · Analitik · Puan Çekirdeği] Dinamik `AutoStudyProgramGenerator`, Kapsam İzole İstatistikler & Strateji Desenli `ScoreFormulaEngine` Çekirdeği** | `AutoStudyProgramGenerator` rotasyonunun aktif müfredattan dinamik okunması ve sınav değişiminde kayıpsız `adaptCurriculumScope` akışı; `StatsScreen` ve `StudyStatsNotifier` üzerinde aktif sınav kapsamına göre ders başarısı/ısı haritası izolasyonu; `KpssScoreCalculator` motorunun genişletilebilir Strategy Pattern (`ScoreFormulaEngine`) mimarisine dönüştürülmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-133** | **[Faz A — Altyapı] Ortak GY-GK Genişlemesi (Lisans / Ön Lisans / Ortaöğretim): Türkçe & Matematik Müfredat Kilidi, `120 Soru / 130 dk` Deneme & `P1 / P2 / P3` Hesaplayıcı** | B Grubu için 6 derslik tam GY-GK müfredatı (Türkçe 30, Mat & Geo 30, Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel 6) + "Sadece GK (60)" / "Tam GY-GK (120)" profil modu; havuz durumuna göre akıllı modül kilidi; `MockExamBlueprint` (`120S/130dk`); `P1`, `P2`, `P3` eş zamanlı puan hesaplama stratejisi *(veri girişi hariç)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-134** | **[Faz B — Altyapı] E-KPSS Entegrasyonu: 4 Engel Grubu Kitapçığı, Ek Süre & Erişilebilir Okuma Modu, Ek Konular & `EKPSSP1 / P2 / P3` Hesaplayıcısı** | 3 öğrenim düzeyi + 4 kitapçık (`Genel`, `Görme`, `İşitme-1`, `Zihinsel`); *Türk Kültür ve Medeniyetleri* ve *Engelli Hakları Mevzuatı* konu düğümleri; `QuizScreen` büyük punto / yüksek kontrast erişilebilirlik geçişi + `source_variant` metin seçimi + opsiyonel ek süre sayacı; `EKPSSP1/P2/P3` hesaplama stratejisi *(veri girişi hariç)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-135** | **[Faz C — Altyapı] KPSS DHBT Entegrasyonu: DHBT-1 + DHBT-2 Çift Kademeli Müfredat (Ortaöğretim/Ön Lisans/Lisans) & `P122 / P123 / P124` Hesaplayıcısı** | Menüdeki `dhbt` hedefinin alt düzey seçimiyle (`İHL / İlahiyat Ön Lisans / Lisans`) tamamlanması; DHBT-1 (5 ders / 20 soru) + DHBT-2 (7 ders / 20 soru) müfredat ağaçları; `40 Soru / 60 dk` DHBT denemesi + karma `P122/P123/P124` puan hesaplama stratejisi *(veri girişi hariç)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-136** | **[Faz D — Altyapı] MEB-AGS + 17 Branş ÖABT Entegrasyonu: Öğretmenlik 1. Oturum (`80 Soru`), Aranabilir 17 Branş + YDS/P3 Seçicisi & `AGS-P1 / P2 / P3` Hesaplayıcısı** | MEB-AGS 1. Oturum (Sözel, Sayısal, Tarih, Coğrafya, *Eğitim Bilimleri & TYMM*, *Mevzuat*) + **17 ÖABT branşının** (Sınıf, Okul Öncesi, Özel Eğitim dahil `30+20` / `50 soru` ve `70`/`90 dk` kuralları) konu ağaçları; aranabilir branş seçici; DKAB/İHL çift puan (`P2-16` / `P2-17`) ve Yabancı Dil `AGS-P3` (%50 YDS) hesaplama motoru *(veri girişi hariç)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-137** | **[Faz E — Altyapı] KPSS A Grubu (Kariyer Meslekler) Entegrasyonu: 9 Alan Testi Konu Ağacı, Çoklu Alan Seçici (`P48` Paketi), `P4–P48` Puan Simülatörü & `≥1 Net` Kuralı** | Hukuk (7 alt dal), İktisat, Maliye, Muhasebe, İşletme, Kamu Yönetimi, Uluslararası İlişkiler, ÇEKO, İstatistik konu ağaçları; adayın yalnızca hedeflediği alan testlerini planlayıcı/derslere almasını sağlayan çoklu alan filtresi; `40 Soru / 50–60 dk` deneme şablonları ve **"ilgili her alan testinden ≥1 ham net"** baraj doğrulamalı `P4–P48` puan simülatörü *(veri girişi hariç)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-138** | **[Atölyeler & Oyunlar Uyumu] Harita Atölyesi, 60 Saniyede Pençe, Kavram Eşleştirme & Hap Bilgi Kartlarının Çoklu Sınav Kapsamına Uyarlanması** | `MapPracticeHubScreen`, `TrueFalseBlitzScreen`, `ConceptMatchScreen` ve `FlashcardsScreen` modüllerinin aktif `ExamSelection` kapsamına göre filtrelenmesi; henüz özel havuzu olmayan sınav türlerinde çökmeden `"Ortak Genel Kültür / Alan Yakında"` köprüsüyle güvenli boş durum yönetimi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-139** | **[EN SON FAZ — Veri Girişi Altyapısı] Çoklu Sınav İçerik Doğrulama & Seed Pipeline (`validate_sql.py` + `distractor_trap` & `exam_scopes` Linter)** | Toplu soru üretimine geçmeden önce `tools/validate_sql.py` / parser betiklerinin `exam_scopes`, `sub_branch`, `source_variant`, `distractor_trap` zorunluluğu, mükerrer soru tespiti ve LaTeX temizliği kurallarıyla güncellenmesi | ⏳ **Bekliyor (Veri Fazı Ön Koşulu)** | ❌ | ❌ |
| **TASK-140** | **[EN SON FAZ — Veri Girişi · Faz A] Ortak GY-GK (Türkçe, Matematik & Geometri + Ön Lisans/Ortaöğretim Seviye Varyantları) Soru & Kart Havuzu Üretimi** | Özgün Türkçe (30 soru dağılımı), Matematik & Geometri soru havuzları, ÖSYM çeldirici tuzağı analizleri ve B-Grubu ortak hap bilgi kartlarının SQL/JSON seed üretimi *(Mimari fazlardan sonra uygulanır)* | ⏳ **Bekliyor (En Son Faz)** | ❌ | ❌ |
| **TASK-141** | **[EN SON FAZ — Veri Girişi · Faz B] E-KPSS Özgün Soru, `İşitme-1` / `Zihinsel` Sadeleştirilmiş Varyantlar & Engelli Hakları Havuzu Üretimi** | E-KPSS düzeylerine uygun özgün GY-GK soruları, Engelli Hakları Mevzuatı + Türk Kültür/Medeniyetleri soru/kartları ve erişilebilir sadeleştirilmiş metin varyantlarının üretimi | ⏳ **Bekliyor (En Son Faz)** | ❌ | ❌ |
| **TASK-142** | **[EN SON FAZ — Veri Girişi · Faz C] KPSS DHBT (DHBT-1 Ortak + DHBT-2 3 Öğrenim Düzeyi) Soru, Bilgi Kartı & Eşleştirme Havuzu Üretimi** | DHBT-1 (20 soru dağılımı) ve DHBT-2 (Ortaöğretim İHL / Ön Lisans / Lisans derinlikli 7 ders) özgün soru bankası, fıkıh/kelam/tefsir hap bilgi kartları ve kavram eşleştirme setleri | ⏳ **Bekliyor (En Son Faz)** | ❌ | ❌ |
| **TASK-143** | **[EN SON FAZ — Veri Girişi · Faz D] MEB-AGS (Eğitim Bilimleri + TYMM + Mevzuat) & Öncelikli ÖABT Branşları Özgün Soru Havuzu Üretimi** | MEB-AGS 1. Oturum Eğitim/TYMM/Mevzuat bankası ile kademeli olarak öncelikli ÖABT branşları (Sınıf, Okul Öncesi, Özel Eğitim, Türkçe, İlköğretim Mat, Sosyal Bilgiler, DKAB/İHL, PDR vb.) özgün soru havuzlarının üretimi | ⏳ **Bekliyor (En Son Faz)** | ❌ | ❌ |
| **TASK-144** | **[EN SON FAZ — Veri Girişi · Faz E] KPSS A Grubu (Önce Çekirdek `P48`: Hukuk, İktisat, Maliye, Muhasebe; Sonra 5 Alan) Özgün Soru Havuzu Üretimi** | Cari mevzuat uyumlu Hukuk (7 alt dal), İktisat, Maliye, Muhasebe çekirdek paketi (`P48`) ile devamında İşletme, Kamu Yönetimi, Uluslararası İlişkiler, ÇEKO ve İstatistik özgün soru havuzlarının üretimi | ⏳ **Bekliyor (En Son Faz)** | ❌ | ❌ |
| **TASK-145** | **[Web Faz 1 — Çekirdek & Güvenlik] Web Wasm Koşullu Importlar, `PurchaseService`/`AdService` Web Açığı Kapatma, URL Stratejisi & `web/index.html` SEO/Splash** | `kIsWeb` ortamındaki ücretsiz PRO (`return true`) ve mock reklam açığının kapatılması; `dart:io` koşullu importları (`Wasm` uyumu); `usePathUrlStrategy()` (`#` kaldırma); webde lokal JSON/`OfflineDownloadService` kısıtlaması ve `web/index.html` Türkçe meta + erişilebilir viewport/shimmer yenilemesi | ✅ **Tamamlandı (Web Projesi · Mobil'de Yok)** | ✅ | 🚫 |
| **TASK-146** | **[Web Faz 2 — Masaüstü SaaS Kabuğu] `AdaptiveWebShell`, Sabit `KadroSidebar`, `NavigationRail`, Breadcrumb Üst Bar & `Ctrl+K` Komut Paleti** | `ResponsiveBreakpoints` masaüstü kırılımı (`>= 1024px`); mobilde `AppNavigationBar` korunurken tablette `NavigationRail`, masaüstünde `256px` `KadroSidebar` + aktif sınav değiştirici ve `Ctrl+K / Cmd+K` global `KadroCommandPalette` spotlight arama penceresi | ✅ **Tamamlandı (Web Projesi · Mobil'de Yok)** | ✅ | 🚫 |
| **TASK-147** | **[Web Faz 2 — Masaüstü Mikro-Etkileşim & Overlay] `TactileCard` / `OptionTile` Hover-İmleç Fiziği, WCAG Odak Halkası & `AdaptiveOverlay`** | `MouseRegion` + `SystemMouseCursors.click` hover yükseltme/renk tepkisi, WCAG `4.5:1` klavye odak halkaları, masaüstü `Scrollbar` / seçilebilir metin (`SelectionArea`) ve `>= 768px` ekranlarda `showModalBottomSheet` yerine `Dialog` / sağ `SideDrawer` açan `AdaptiveOverlay` yardımcısı | ✅ **Tamamlandı (Web Projesi · Mobil'de Yok)** | ✅ | 🚫 |
| **TASK-148** | **[Web Faz 3 — Bento Dashboard] 12 Sütunlu `HomeScreen` Bento Kokpiti, Çok Sütunlu Grid Kartları & Master-Detail `LessonTopicsScreen`** | **Awwwards / Brilliant** esintili `1240px` 2 kolonlu `HomeScreen` (*Above the Fold*: plan + seri + geri sayım + mini Pomodoro), `LessonsScreen` / `ExamsScreen` / `PracticeHubScreen` 2–3 sütun kart ızgaraları ve `LessonTopicsScreen` sol konu listesi / sağ test paketi Master-Detail düzeni | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-149** | **[Web Faz 3 — Split-Pane Sınav Stüdyosu] UWorld/e-YDS Tarzı 2 Panelli `QuizScreen`, Klavye Kısayolları, Şık Eleme & 2 Kolonlu İstatistik/Karne** | `>= 960px` masaüstünde **Split-Pane `QuizScreen`**: solda soru (`60-75ch`) + 5 şık + şık üstü çizme, sağda anlık **"⚠️ ÖSYM Çeldirici Tuzağı"** / denemede canlı bölüm optik kâğıdı; `1–5`/`A–E`, `Enter`, `F`, `Shift+1..5`, `?` klavye kısayolları ve 2 kolonlu `QuizResultScreen` / `StatsScreen` (`fl_chart` + veri özeti) | ✅ **Tamamlandı (Web Projesi · Mobil'de Yok)** | ✅ | 🚫 |
| **TASK-150** | **[Web Faz 4 — Geniş Ekran Atölyeler] Split `TurkeyMap` Harita Stüdyosu, Klavyeli `Flashcards`, Zen Masa Saati `Pomodoro` & Sticky `ScoreCalculator`** | Geniş ekranda sol-harita / sağ-soru bölünmüş `MapChallengeScreen` (hover il vurgusu); `Space`/ok tuşlu `FlashcardsScreen`; tam ekran "Masa Saati Zen" `PomodoroStudioScreen` ve sol sürgü / sağ yapışkan (sticky) puan karneli `KpssScoreCalculatorScreen` | ✅ **Tamamlandı** *(Pomodoro sonradan iptal edildi)* | ✅ | ✅ |
| **TASK-151** | **[Web Faz 4 — Giriş Vitrini & SEO Köprüsü] Split `AuthScreen` Ürün Vitrini, Misafir `/calculator` & `/curriculum-preview` Rotaları, Deep-Link Akışı** | `AuthScreen` masaüstünde 2 kolonlu ürün tanıtım + giriş sahnesi; misafir kullanıcıların giriş yapmadan erişebileceği `/calculator` ve `/curriculum-preview` public web rotaları + hesap daveti; opsiyonel Astro/Next.js SEO landing (`kadro.com` -> `app.kadro.com`) sözleşmesi | ✅ **Tamamlandı (Web Projesi · Mobil'de Yok)** | ✅ | 🚫 |
| **TASK-152** | **[Web Faz 5 — Ödeme Köprüsü, Wasm & Kalite Kapısı] iyzico/RevenueCat Web Billing, `subscriptions` Supabase Senkronu & 4 Kırılımlı Responsive Testleri** | Web için **iyzico / RevenueCat Web Billing + Supabase Edge Function `subscriptions` yetki tablosu** entegrasyonu; `flutter build web --wasm` COOP/COEP header + rewrite config doğrulaması; `1440×900`, `1024×768`, `768×1024`, `360×640` layout, klavye, `Ctrl+K` ve Web güvenlik sözleşme testleri | 🟡 **Kısmen Tamamlandı** (`06` SQL OK · `iyzico` Web bekliyor) | ❌ | 🚫 |
| **TASK-153** | **Ortak UI Bileşenleri (`KadroDropdown`, `KadroOptionPickerModal`, `KadroConfirmDialog`, `KadroBadge`, `PageHeader` & `AdaptiveOverlay` Eşitlemesi)** | Tüm modalların, seçicilerin, onay diyaloglarının, rozetlerin ve form alanlarının ortak tasarım bileşenlerinde birleştirilmesi *(Mobil: `KadroDropdown`, `KadroOptionPickerModal`, `KadroConfirmDialog`, `KadroBadge`, `KadroFilterChips`, `KadroSettingsCard`, `PageHeader` & `AdaptiveOverlay` tamamlandı · Web: Ortak `shadcn/ui` bileşen seti standart)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-154** | **Her Ders İçin Sınav Formatında Branş Denemeleri (`BranchMockExamGenerator` & Ders Bazlı Net Karnesi)** | Her ders için aktif `ExamCurriculum` soru sayısına ve konu ağırlıklarına göre dinamik süreli branş denemesi üreteci ve ders net karnesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-155** | **Zorunlu Giriş Yönlendirmesinin Kaldırılması & Test Sonu Misafir Kayıt Uyarı Popup'ı** | İlk açılışta misafir kullanıcının doğrudan ana sekmelere ve testlere erişmesi, test bitiminde ise *"İlerlemeniz Kaydedilmiyor"* uyarı popup'ının gösterilmesi | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-156** | **Kapsamlı SEO Mimarisi, Semantik Slug URL Yapısı & Arama Motoru Optimizasyonu** | Türkçe anahtar kelime slug URL'leri (`/kpss-tarih-soru-cozumu`), dinamik meta, Schema.org `JSON-LD`, `sitemap.xml`, `robots.txt` ve OpenGraph *(Mobil'de iptal; Web'de `sitemap.ts`, `robots.ts`, `opengraph-image` ve temel meta var, semantik slug ve `JSON-LD` bekliyor)* | 🚫 **İptal Edildi** (Flutter Web SEO -> `kadro-web` Next.js'e devredildi) | ➖ | ➖ |
| **TASK-157** | **Kalan Ekranlarda Büyük Ekran Masaüstü UX Dönüşümü (`StudyPlanner`, `Mistakes`, `QuizHistory`, `AdminReports`, `TrueFalseBlitz`)** | Geniş ekranda 2 sütunlu planlayıcı ve yanlış kartları, `QuizHistory` Master-Detail oturum detay paneli, `AdminReports` 2 sütunlu ızgara ve `TrueFalseBlitz` klavye kısayolları | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-158** | **Leitner Kutulu (1·3·7·14 Gün) Akıllı Aralıklı Tekrar (`MistakeRepository` & `Flashcards`)** | 4-kutu (`1·3·7·14` gün) kalıcı aralıklı tekrar motoru, ücretsiz ayrı "Günlük Tekrar" kuyruğu, ana sayfa vadesi gelen şeridi ve `07_leitner_and_current_affairs.sql` bulut senkronu *(Web & Mobil ücretsiz günlük tekrar kuyruğu + yerel Leitner hazır; canlı DB'de `07` SQL henüz uygulanmadığından yerel fallback ile çalışır)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-159** | **Çalışma Planlayıcıda "Telafi Modu", Son 30 Gün "Sprint Modu" & Haftalık Görsel Takvim Önizlemesi** | Kaçırılan günleri bugünden itibaren dağıtan `rebalanceMissedTasks`, sınava <= 30 gün kala yoğunlaşan Sprint Modu ve 7 günlük renkli takvim ızgarası | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-160** | **Aylık "Güncel Bilgiler" Bülteni & Etkileşimli Akış (`CurrentAffairsScreen`)** | Kategorili aylık bülten akışı, okundu/bookmark takibi, ÖSYM soru ipucu ve 10 soruluk mini test köprüsü *(Canlı `07` SQL henüz uygulanmadığından her iki platform yerel/örnek bülten verisiyle çalışır)* | ✅ **Tamamlandı** | ✅ | ✅ |
| **TASK-161** | **Yazdırılabilir A4 Test PDF Oluşturucu — Kadro PRO (`TestPdfExportService`)** | Türkçe karakter uyumlu A4 kitapçık + kodlamalı optik form + cevap anahtarı PDF çıktısı ve `PaywallScreen` PRO kapısı | ⏳ **Planlandı** | ❌ | ❌ |
| **TASK-162** | **Çalışma Planlayıcı Sayfası ve Manuel Görev Düzenlemenin Kaldırılması & Ana Sayfada Tüm Günlük Görevlerin Eksiksiz Gösterimi** | Ayrı `StudyPlannerScreen` (`/planner`) sayfasının ve manuel görev ekleme/çıkarma diyaloglarının kaldırılması, planlayıcının doğrudan `HomeScreen` üzerindeki `HomeDailyPlanCard` widget'ına indirgenmesi; başlangıç kurulumundaki otomatik program akışının korunması; karttaki `.take(4)` / `.slice(0, 4)` kısıtlamasının kaldırılarak o günkü tüm görevlerin (örn. 5/5) eksiksiz listelenmesi; görev tamamlandığında anında üzeri çizilme (`line-through`) ve yeşil onay ikonu eşlenmesi | 🟢 **Tamamlandı (Eşlenik)** | ✅ | ✅ |
| **TASK-163** | **Test Sonu Karnesinde Günlük Görev Akışı & Sıradaki Göreve Kesintisiz Geçiş (`QuizResultScreen` / Flow State)** | Günlük plandan bir görev çözülüp bittiğinde test karnesi başlığında `✓ Günlük Görev Tamamlandı · X/Y` onay rozeti ve yeşil akış bandı gösterilmesi; günün sıradaki görevi varsa tek tıkla doğrudan sıradaki testi başlatan **"Sıradaki Göreve Geç: [Görev] →"** birincil butonu ve **"Ana Sayfaya Dön"** ikincil butonu; günün tüm görevleri bittiğinde ise **"Günü Tamamladın! Ana Sayfaya Dön"** kutlama aksiyonu sunulması | 🟢 **Tamamlandı (Eşlenik)** | ✅ | ✅ |
| **TASK-164** | **🚀 Yayın Öncesi Mağaza Uyumluluk Kapısı (`app-store-compliance` skill denetimi)** | Play Store'a çıkmadan önce zorunlu: canlı `/gizlilik` + `/hesap-silme` sayfaları, hesap silme hatasının kullanıcıya gösterilmesi, AdMob UMP rıza formu, gerçek AdMob/RevenueCat kimliklerinin `--dart-define` ile verilmesi, `POST_NOTIFICATIONS` izni ve izin akışı, Veri Güvenliği formu, 12 test kullanıcısı / 14 gün kapalı test; sonunda `/app-store-audit` yeniden çalıştırılıp kritik bulgu sıfırlanır | ⏳ **Planlandı** | ❌ | ❌ |
| **TASK-165** | **GY Türkçe Dersinin Aktifleştirilmesi ("Yakında" → Hazır) & GY-GK Kapsam Sorgusu Düzeltmesi** | Canlıdaki 710 Türkçe sorusu (`lisans_gygk`, 11 konu) ile Türkçe'nin KPSS Lisans GY-GK müfredatında diğer dersler gibi açılması (konu testleri, branş denemesi, planlayıcı, pratik merkezi); Matematik "Yakında" kalır; GY-GK modunda GK sorularının buluttan gelmemesine yol açan `contains(exam_scopes)` filtresinin kabul edilen kapsam kümesiyle `overlaps` olarak düzeltilmesi | 🟡 **Kısmi (Web bekliyor)** | ❌ | ✅ |
| *[GELECEK FAZ]* | **"Pazar 20:00" Türkiye Geneli Canlı KPSS Denemesi (Canlı Etkinlik)** | Tüm adayların aynı anda başladığı, canlı geri sayımlı Türkiye sıralaması çıkaran eş zamanlı canlı deneme ekranı | ⏸️ **Kullanıcı Kesin Onayı Bekleniyor (İleri Faz)** | ❌ | ❌ |

### 📊 Aktif Mobil & Web Eşleniklik Özeti

- **Sonradan İptal Edilen / Başka Görevle Değiştirilen Eski Görevler (`➖` / `➖` — Ele Alınmıyor):** `TASK-11`, `TASK-12`, `TASK-14`–`TASK-17`, `TASK-31`–`TASK-33`, `TASK-56` (*eski tema/Lucide/MascotCoachBanner katmanı -> `TASK-66`, `TASK-67`, `TASK-68`, `TASK-107 - TASK-108`, `TASK-112` ile yenilendi*), `TASK-30` (*eski GK Onboarding -> `TASK-131` ile yenilendi*), `TASK-64` (*tekil konu indirme ikonu -> `TASK-75` ile sadeleştirildi*), `TASK-78` (*Pomodoro Stüdyosu `824eac4` ile kaldırıldı; Geri Sayım `TASK-126`'da*), `TASK-110` (*tempo adaptasyonu -> `TASK-116` ile yenilendi*), `TASK-111` (*GY 'Yakında' vitrini -> `TASK-133` ile gerçek müfredata geçti*), `TASK-119` (*Auth-First kapısı -> `TASK-155` Misafir Öncelikli Açılış ile iptal edildi*), `TASK-156` (*Flutter Web Wasm SEO -> `kadro-web` Next.js ayrışmasıyla iptal edildi*).
- **🔴 Gerçek Eşleniklik Açığı (Aktif `❌` olan platformlar — önce bunlar kapatılır):** `TASK-40` & `TASK-99` (🌐 Web ödeme — `iyzico`, kullanıcı kararıyla ertelendi), `TASK-152` (🌐 Web Billing + Vercel), `TASK-161` (📱 + 🌐 PDF), `TASK-139`–`TASK-144` (ortak içerik fazı).
- **🌐 Web'e Özgü, `kadro-web`'de Takip Edilenler (Mobil `🚫`):** `TASK-145`, `TASK-146`, `TASK-147`, `TASK-149`, `TASK-151` (`Web ✅`) ve `TASK-152` (`Web ❌`: `06_web_subscriptions.sql` uygulandı, **`iyzico` Web Billing + Vercel** kullanıcı kararıyla ertelendi). Tablet ortak düzenlerini koruyan `TASK-148` ve `TASK-150` *(iptal edilen Pomodoro hariç)* her iki platformda da `✅`'tir.
- **Ortak Bekleyen / Henüz Başlanmamış Aktif Fazlar (`Web ❌ · Mobil ❌`):** `TASK-139`–`TASK-144` (En son faz toplu soru/içerik üretimi & SQL linter), `TASK-161` (Yazdırılabilir A4 Test PDF Oluşturucu), `*[GELECEK FAZ]*` (Pazar 20:00 Canlı KPSS Denemesi).
- **🟡 Kısmi — Mobil'de Aktif Olup Web'de Kalan Ödeme Kalemleri (`Web ❌ · Mobil ✅`):** `TASK-40` & `TASK-99` *(aktif web kredi kartı ödeme adımı `iyzico` kullanıcı talebiyle ertelendi; mevcut `PRO` kontrolleri `profiles.is_pro` ve `user_subscriptions` üzerinden aktiftir)*. Eşlenik hale getirilen **30 görev** (`TASK-29`, `TASK-37`, `TASK-39`, `TASK-47`, `TASK-48`, `TASK-52`, `TASK-57`, `TASK-65`, `TASK-68`, `TASK-76`, `TASK-90`, `TASK-94`, `TASK-113`, `TASK-116`, `TASK-121`, `TASK-124`, `TASK-130`–`TASK-138`, `TASK-154`, `TASK-155`, `TASK-157`, `TASK-158`, `TASK-159`) `kadro-web` üzerinde uygulanıp **`Web ✅`** durumuna geçirildi *(Not: Canlı Supabase'de `07_leitner_and_current_affairs.sql` henüz uygulanmadığından `TASK-158` ve `TASK-160` bulut şeması hazır olduğunda ekstra migrasyonsuz çalışacak şekilde yerel fallback ile ilerler)*.
- **📱 Mobile Özgü Native / Mağaza Kalemleri (`Web 🚫 · Mobil ✅`):** `TASK-41` & `TASK-88` (AdMob Ödüllü Reklam & Play Store release), `TASK-43` & `TASK-97` (Yerel bildirimler & Sentry), `TASK-54` (App Icon & Native Splash), `TASK-55` (Kadro PRO çevrimdışı indirme), `TASK-96` (`FLAG_SECURE` ekran görüntüsü koruması), `TASK-98` (Google Play In-App Review), `TASK-100 - TASK-106` *(Android keystore/release mobil özgü; Sync, Geri Sayım ve Otomatik Plan her iki tarafta aktif)*.

---

## 🤖 3. Alt Ajana Verilecek Detaylı Görev Paketleri

Alt ajanın **hiçbir mimari karar almadan** doğrudan uygulayabilmesi için her dosya yolunu, sınıf adını ve metot imzasını net olarak yazdım. Sırayla kopyalayıp alt ajana verebilirsin.

### 🧩 Eşlenik Görev Şablonu (Her Yeni `TASK` İçin)

`TASK-164` ve sonrası bu şablonla yazılır. Mobil ve Web alt ajan istemleri (`text` blokları) ayrı ayrı verilir; ikisi de aynı **Ortak Sözleşme** bölümünü kopyalayarak başlar.

````markdown
### 📦 TASK-XXX: <Görev Adı>

- **Durum:** ⏳ Planlandı · 🌐 Web ❌ · 📱 Mobil ❌
- **Amaç:** <Kullanıcıya etkisi, 1–2 cümle>
- **Platform Uygulanabilirliği:** Ortak (iki platform) | 📱 Mobile özgü (Web 🚫: <neden>) | 🌐 Web'e özgü (Mobil 🚫: <neden>)

#### 🔗 Ortak Sözleşme (İki platform birebir uyar)
- **Supabase:** <yeni/değişen tablo, kolon, RPC, RLS; migration dosyası `docs/supabase_migrations/NN_*.sql`> (yoksa "Değişiklik yok")
- **Veri formatı:** <JSON alanları; `docs/web_sync_prompt.md` güncellenecek mi?>
- **İş kuralları:** <kota, XP, net/puan, sıralama, sayı limitleri — kesin değerlerle>
- **Eşleniklik örnekleri:** <`docs/parity_fixtures/*.json` içine eklenecek girdi → beklenen çıktı vakaları> (yoksa "Gerekmez")

#### 📱 Mobil Kapsamı (`gunisigi` — Flutter)
```text
GÖREV: TASK-XXX — <Ad> (Mobil / Flutter)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Ortak Sözleşme bölümünün dışına çıkma. Bitince flutter-verify adımlarını çalıştır ve task-board'da yalnızca "Mobil de Yapıldı" kolonunu güncelle.
ADIM 1: ...
```

#### 🌐 Web Kapsamı (`kadro-web` — Next.js)
```text
GÖREV: TASK-XXX — <Ad> (Web / Next.js)
ÖNEMLİ: kadro-web/AGENTS.md kurallarına birebir uy. Ortak Sözleşme bölümünün dışına çıkma. Bitince lint/test adımlarını çalıştır ve ../gunisigi/docs/task-board.md içinde yalnızca "Web de Yapıldı" kolonunu güncelle.
ADIM 1: ...
```

#### ✅ Kabul Kriterleri
- [ ] Aynı hesapla iki platformda aynı veri/sonuç görülüyor (ör. aynı testin neti, aynı günlük kota)
- [ ] `docs/parity_fixtures` vakaları iki depodaki eşleniklik testlerinde yeşil
````

---

### 📦 TASK-03: Etkileşimli Soru Çözüm Motoru (`QuizScreen`)

```text
GÖREV: TASK-03 — Faz 4: Etkileşimli QuizScreen (StatefulWidget, Şık Seçimi, Cevap Kontrolü ve Açıklama Kartı)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Henüz Riverpod kullanma, sadece `StatefulWidget` ve `setState` kullan. Renkleri yalnızca `Theme.of(context).colorScheme` üzerinden al.

ADIM 1: `OptionTile` Bileşenine Cevap Kontrol Durumu Ekleme
1. `lib/features/quiz/presentation/widgets/option_tile.dart` dosyasını güncelle:
   - `OptionStatus` adında bir `enum` tanımla: `enum OptionStatus { normal, selected, correct, wrong }`
   - `OptionTile` içindeki `final bool isSelected;` parametresi yerine `final OptionStatus status;` (`this.status = OptionStatus.normal`) parametresi kullan.
   - Renkleri `status` değerine göre `colorScheme` üzerinden belirle:
     - `OptionStatus.normal`: kenarlık `colorScheme.outlineVariant`, arka plan `colorScheme.surface`
     - `OptionStatus.selected`: kenarlık `colorScheme.primary`, arka plan `colorScheme.primaryContainer.withAlpha(70)`
     - `OptionStatus.correct`: kenarlık `colorScheme.tertiary`, arka plan `colorScheme.tertiaryContainer.withAlpha(120)`
     - `OptionStatus.wrong`: kenarlık `colorScheme.error`, arka plan `colorScheme.errorContainer.withAlpha(120)`
   - Sağ tarafa (`Row` sonuna) `status == OptionStatus.correct` ise `Icon(Icons.check_circle, color: colorScheme.tertiary)`, `status == OptionStatus.wrong` ise `Icon(Icons.cancel, color: colorScheme.error)` ekle.

ADIM 2: `QuizScreen`'i `StatefulWidget` Yapma ve Açıklama Kartı Ekleme
1. `lib/features/quiz/presentation/quiz_screen.dart` içindeki `QuizScreen` sınıfını `StatefulWidget`'a dönüştür.
2. `_QuizScreenState` içinde şu state değişkenlerini tut:
   - `int? _selectedOptionIndex;`
   - `bool _isAnswered = false;`
3. Şıklara (`OptionTile`) tıklandığında:
   - Eğer `_isAnswered == true` ise `onTap: null` (veya tıklamayı yoksay) olsun; cevap onaylandıktan sonra şık değiştirilemesin.
   - Henüz onaylanmadıysa `setState(() => _selectedOptionIndex = i)` ile seçimi güncelle.
4. Her bir şıkkın `OptionStatus` değerini hesaplayan küçük bir yardımcı metot (`OptionStatus _getOptionStatus(int index)`) yaz:
   - `_isAnswered == false` iken: `index == _selectedOptionIndex ? OptionStatus.selected : OptionStatus.normal`
   - `_isAnswered == true` iken:
     - `index == widget.question.correctIndex` ise `OptionStatus.correct`
     - `index == _selectedOptionIndex` (ve yanlışsa) `OptionStatus.wrong`
     - Diğerleri `OptionStatus.normal`
5. Alt Buton (`FilledButton.icon`):
   - `_selectedOptionIndex == null` ise `onPressed: null` (pasif) olsun.
   - Şık seçilmiş ve `_isAnswered == false` ise `'Cevabı Onayla'` yazsın; tıklandığında `setState(() => _isAnswered = true)` yapsın.
   - Eğer yanlış cevap verilmişse ekranın altında `ScaffoldMessenger.of(context).showSnackBar` ile `'Bu soru Yanlış Defteri listene eklendi.'` mesajı gösterilsin.
6. `_ExplanationCard extends StatelessWidget` bileşenini aynı dosyada ayrı bir sınıf olarak oluştur:
   - `_isAnswered == true` olduğunda butonun üstünde görünsün.
   - Kart içinde başlık olarak `Icons.lightbulb_outline` + `'Çözüm Açıklaması'`, altında `widget.question.explanation` metni yer alsın.

ADIM 3: Widget Testi (`test/quiz_screen_test.dart`)
1. `test/quiz_screen_test.dart` dosyasını oluştur ve şu senaryoları test et:
   - İlk açılışta `'Cevabı Onayla'` butonu pasif (`onPressed == null`) olmalı ve `'Çözüm Açıklaması'` görünmemeli.
   - Bir şıkka dokunulduğunda `'Cevabı Onayla'` butonu aktifleşmeli.
   - `'Cevabı Onayla'` butonuna dokunulduğunda `'Çözüm Açıklaması'` ve sorunun `explanation` metni ekranda görünmeli.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-04: Çoklu Soru İlerlemesi & Test Sonu Karnesi (`QuizResultScreen`)

```text
GÖREV: TASK-04 — Faz 4: Çoklu Soru Akışı (1 / N) ve Test Sonu Karnesi (QuizResultScreen)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit renk/font kullanma, `Theme.of(context)` kullan. TASK-03 tamamlandıktan sonra bu görevi uygula:

ADIM 1: `QuizResult` Modelini Oluşturma
1. `lib/features/quiz/data/models/quiz_result.dart` dosyasını oluştur.
2. Sınıf adı: `QuizResult`:
   - Alanlar: `final int totalQuestions;`, `final int correctCount;`, `final int wrongCount;`, `final int emptyCount;`
   - Constructor: `const QuizResult({required this.totalQuestions, required this.correctCount, required this.wrongCount, required this.emptyCount});`
   - Getter: `double get net => calculateNet(correct: correctCount, wrong: wrongCount);` (`package:kadro/core/utils/exam_utils.dart` kullanarak).
   - Getter: `int get successRate => totalQuestions == 0 ? 0 : ((correctCount / totalQuestions) * 100).round();`

ADIM 2: `QuizScreen` Çoklu Soru Desteği
1. `lib/features/quiz/presentation/quiz_screen.dart` içindeki `QuizScreen` sınıfını tekil `question` yerine soru listesi (`final List<Question> questions;`) alacak şekilde güncelle.
   - Varsayılan değer (`default`) olarak en az 3 özgün KPSS Genel Kültür sorusu içeren `const List<Question> defaultSampleQuestions` tanımla (böylece `const QuizScreen()` çağrıları kırılmaz).
2. `_QuizScreenState` içine şu state değişkenlerini ekle:
   - `int _currentIndex = 0;`
   - `int _correctCount = 0;`
   - `int _wrongCount = 0;`
   - Getter: `Question get _currentQuestion => widget.questions[_currentIndex];`
   - Getter: `bool get _isLastQuestion => _currentIndex == widget.questions.length - 1;`
3. `_QuestionMetaBar` bileşenine `questionNumber: _currentIndex + 1` ve `totalQuestions: widget.questions.length` gönder. Hemen altına `LinearProgressIndicator(value: (_currentIndex + 1) / widget.questions.length)` ekle.
4. "Cevabı Onayla" tıklandığında (`_isAnswered == false` iken):
   - Seçilen şık doğruysa `_correctCount++`, yanlışsa `_wrongCount++` yap ve `_isAnswered = true` olarak güncelle.
5. Cevap onaylandıktan sonra (`_isAnswered == true` iken) alt butonun metni ve davranışı değişsin:
   - Son soru değilse buton metni `'Sonraki Soru'`, ikonu `Icons.arrow_forward` olsun. Tıklandığında `_currentIndex++`, `_selectedOptionIndex = null`, `_isAnswered = false` yap.
   - Son soruysa buton metni `'Testi Bitir ve Sonucu Gör'`, ikonu `Icons.emoji_events_outlined` olsun. Tıklandığında `Navigator.of(context).pushReplacement` ile `QuizResultScreen(result: QuizResult(...))` ekranına yönlendirsin.

ADIM 3: `QuizResultScreen` (Test Sonu Karnesi) Ekranını Oluşturma
1. `lib/features/quiz/presentation/quiz_result_screen.dart` dosyasını oluştur.
2. Sınıf adı: `QuizResultScreen extends StatelessWidget` (`final QuizResult result;`).
3. Ekranda şunları göster (büyük parçaları ayrı `StatelessWidget` sınıflarına böl):
   - Üstte `PageHeader(icon: Icons.emoji_events, title: 'Test Tamamlandı!', subtitle: 'KPSS Genel Kültür konu testi sonucun aşağıda.')`
   - Ortada büyük bir Net Kartı (`_NetScoreCard`): `result.net.toStringAsFixed(2)` Net ve `%${result.successRate} Başarı` gösterimi.
   - Altta 3'lü `Row` (`Expanded` ile): Doğru (`result.correctCount`), Yanlış (`result.wrongCount`), Boş (`result.emptyCount`) bilgi kartları (`_ResultStatItem`).
   - En altta `'Ana Sayfaya Dön'` (`FilledButton.icon`, `Navigator.of(context).pop()`).

ADIM 4: Test ve Doğrulama
1. `test/quiz_screen_test.dart` dosyasını çoklu soru geçişini (`Sonraki Soru` butonuyla 2. soruya geçişi ve son soruda `QuizResultScreen` açılışını) test edecek şekilde güncelle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-05: Hap Bilgi Kartları (`FlashcardsScreen`)

```text
GÖREV: TASK-05 — Faz 4: Hap Bilgi Kartları (FlashcardsScreen & AnimatedSwitcher)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit renk/font kullanma, `Theme.of(context)` kullan. TASK-04 tamamlandıktan sonra bu görevi uygula:

ADIM 1: `Flashcard` Modeli ve Örnek Veri (`lib/features/flashcards/data/models/flashcard.dart`)
1. `lib/features/flashcards/data/models/flashcard.dart` dosyasını oluştur.
2. Sınıf adı: `Flashcard`:
   - Alanlar: `final String id;`, `final String lesson;`, `final String topic;`, `final String frontText;` (soru/kavram), `final String backText;` (hap cevap/bilgi).
   - `const` constructor tanımla.
3. Aynı dosyada veya `lib/features/flashcards/data/sample_flashcards.dart` içinde 4 Genel Kültür dersinden (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler) toplam 6 adet özgün KPSS hap bilgi kartı içeren `const List<Flashcard> sampleFlashcards` listesi oluştur.

ADIM 2: `FlashcardsScreen` Ekranı (`lib/features/flashcards/presentation/flashcards_screen.dart`)
1. `FlashcardsScreen extends StatefulWidget` sınıfını oluştur (`final List<Flashcard> flashcards = sampleFlashcards;`).
2. `_FlashcardsScreenState` içinde şu state'leri tut:
   - `int _currentIndex = 0;`
   - `bool _isBackVisible = false;` (Kartın arka yüzü mü görünüyor?)
   - `int _learnedCount = 0;` ("Biliyorum" sayısı)
   - `int _repeatCount = 0;` ("Tekrar Et" sayısı)
3. Ekran yerleşimi:
   - Üstte ilerleme bilgisi (`Kart ${_currentIndex + 1} / ${widget.flashcards.length}`) ve `LinearProgressIndicator`.
   - Ortada (`Expanded`) karta dokunulunca (`InkWell` veya `GestureDetector`) `setState(() => _isBackVisible = !_isBackVisible)` yapan ve `AnimatedSwitcher` (Web'deki CSS transition/flip karşılığını yorumla açıkla) ile ön yüz (`_FlashcardFace` - Soru/Kavram) ve arka yüz (`_FlashcardFace` - Cevap/Hap Bilgi) arasında yumuşak geçiş yapan kart bileşeni.
   - Altta iki buton (`Row` + `Expanded`):
     - Sol buton (`OutlinedButton.icon`): `'Tekrar Et'` (`Icons.refresh`), tıklandığında `_repeatCount++` yapıp sonraki karta geçer (`_isBackVisible = false`).
     - Sağ buton (`FilledButton.icon`): `'Biliyorum'` (`Icons.check`), tıklandığında `_learnedCount++` yapıp sonraki karta geçer (`_isBackVisible = false`).
   - Son kart tamamlandığında ekranda kaç kartın öğrenildiğini ve kaçının tekrar edileceğini gösteren bir özet görünümü (`_FlashcardsSummaryView`) çiz.

ADIM 3: Ana Sayfa (`HomeScreen`) Bağlantısı ve Test
1. `lib/features/home/presentation/home_screen.dart` içindeki `'Bilgi kartları'` `_StudyTypeTile` bileşeninin `onTap` özelliğine `Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FlashcardsScreen()))` bağlantısını ekle.
2. `test/flashcards_screen_test.dart` dosyasını oluştur:
   - İlk açılışta kartın ön yüzünün (`frontText`) göründüğünü, karta dokunulunca arka yüzünün (`backText`) açıldığını ve `'Biliyorum'` butonuna basılınca 2. karta geçtiğini test et.
3. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-06: Yanlış Defteri (`MistakesScreen`) & Bellek İçi (`In-Memory`) Yanlış Havuzu

```text
GÖREV: TASK-06 — Yanlış Defteri (MistakeRepository & MistakesScreen)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Şu aşamada yerel veritabanı (`sqflite`/`hive`) veya Riverpod KULLANMA; bellek içi (in-memory singleton/static) `MistakeRepository` kullan (Aşama 2'de .NET Web API'ye bağlanacak). TASK-05 tamamlandıktan sonra bu görevi uygula:

ADIM 1: `MistakeRepository` Oluşturma (`lib/features/mistakes/data/mistake_repository.dart`)
1. `MistakeRepository` sınıfını oluştur (Angular'daki singleton service mantığını yorumla açıkla):
   - Bellek içi liste: `static final List<Question> _mistakes = [];`
   - `List<Question> getMistakes()` -> `List.unmodifiable(_mistakes)` döner.
   - `void addMistake(Question question)` -> Eğer aynı `question.id` listede yoksa `_mistakes.add(question)` yapar.
   - `void removeMistake(String questionId)` -> `_mistakes.removeWhere((q) => q.id == questionId)` yapar.
   - `void clearForTest()` -> Testlerde listeyi sıfırlamak için `_mistakes.clear()` yapar.

ADIM 2: `QuizScreen` ile `MistakeRepository` Entegrasyonu
1. `lib/features/quiz/presentation/quiz_screen.dart` içinde:
   - `QuizScreen` constructor'ına `final MistakeRepository mistakeRepository = const MistakeRepository();` ekle.
   - `_submitAnswer()` içinde kullanıcı yanlış cevap verdiğinde (`!isCorrect`) `widget.mistakeRepository.addMistake(_currentQuestion);` çağrısı yap.
   - Kullanıcı doğru cevap verdiğinde (`isCorrect`) eğer bu soru daha önce yanlış defterindeyse otomatik çıkması için `widget.mistakeRepository.removeMistake(_currentQuestion.id);` çağrısı yap.

ADIM 3: `MistakesScreen` Ekranını Oluşturma (`lib/features/mistakes/presentation/mistakes_screen.dart`)
1. `MistakesScreen extends StatefulWidget` oluştur.
2. Eğer `mistakeRepository.getMistakes()` boşsa:
   - Ortada ikon (`Icons.check_circle_outline`), `'Yanlış defterin tertemiz!'` başlığı ve `'Testlerde yanlış yaptığın sorular otomatik olarak burada birikir.'` açıklaması içeren ayrı bir `_EmptyMistakesView extends StatelessWidget` göster.
3. Eğer yanlış sorular varsa:
   - Üstte kaç yanlış soru biriktiğini gösteren bilgi kartı ve `'Tüm Yanlışları Tekrar Çöz'` (`FilledButton.icon`) butonu koy. Bu butona basılınca `Navigator.of(context).push` ile `QuizScreen(questions: mistakes)` açılsın (geri dönüldüğünde `setState(() {})` ile ekran yenilensin).
   - Altta `ListView.builder` ile yanlış soruları (`_MistakeQuestionCard`) listele ve her kartta silme (`IconButton(icon: Icon(Icons.delete_outline))`) butonu olsun.

ADIM 4: Ana Sayfa Bağlantısı ve Testler
1. `lib/features/home/presentation/home_screen.dart` içindeki `'Yanlış defteri'` `_StudyTypeTile` bileşeninin `onTap` özelliğine `MistakesScreen` navigasyonunu bağla.
2. `test/mistakes_screen_test.dart` dosyasını oluştur:
   - Boş durumda `'Yanlış defterin tertemiz!'` yazısının göründüğünü,
   - `MistakeRepository`'ye soru eklendiğinde ekranda listelendiğini ve silinebildiğini test et.
3. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-07: Süreli Genel Kültür Deneme Sınavı (`ExamsScreen` & `Timer.periodic`)

```text
GÖREV: TASK-07 — Süreli Genel Kültür Denemesi (Timer.periodic & ExamSessionScreen)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit renk/font kullanma, `Theme.of(context)` kullan. TASK-06 tamamlandıktan sonra bu görevi uygula:

ADIM 1: `QuizScreen`'e Opsiyonel Süre Sayacı (`Timer.periodic`) Desteği Ekleme
1. `lib/features/quiz/presentation/quiz_screen.dart` içindeki `QuizScreen` widget'ına iki opsiyonel parametre ekle:
   - `final Duration? examDuration;` (`this.examDuration` — null ise normal konu testidir, doluysa süreli deneme sınavıdır)
   - `final String? customTitle;` (`this.customTitle`)
2. `_QuizScreenState` içinde:
   - Eğer `widget.examDuration != null` ise `initState()` içinde `Timer.periodic(const Duration(seconds: 1), ...)` başlat (Web'deki `setInterval` karşılığını yorumla açıkla) ve `dispose()` içinde mutlaka `_timer?.cancel()` çağır!
   - Kalan süreyi `int _remainingSeconds` olarak tut. Süre `0` olduğunda sınavı otomatik bitirip `_finishQuiz()` çağır (`if (!mounted) return;` kontrolünü unutma).
   - `AppBar` içinde `actions:` kısmında (eğer `examDuration != null` ise) kalan süreyi `MM:SS` formatında gösteren ayrı bir `_ExamTimerBadge extends StatelessWidget` bileşeni göster.

ADIM 2: `ExamsScreen` ve `HomeScreen` Deneme Sınavı Bağlantısı
1. `lib/features/exams/presentation/exams_screen.dart` dosyasını güncelle:
   - Pasif olan `'Deneme başlat'` butonunu aktif hale getir (`label: const Text('Genel Kültür Denemesi Başlat')`).
   - Tıklandığında `QuizScreen(examDuration: const Duration(minutes: 65), customTitle: 'Genel Kültür Denemesi')` ekranını açsın.
2. `lib/features/home/presentation/home_screen.dart` içindeki `'Deneme sınavı'` `_StudyTypeTile` bileşeninin `onTap` özelliğine aynı `QuizScreen(examDuration: const Duration(minutes: 65), customTitle: 'Genel Kültür Denemesi')` navigasyonunu bağla.

ADIM 3: Test ve Doğrulama
1. `test/exam_timer_test.dart` dosyasını oluştur:
   - `QuizScreen(examDuration: const Duration(seconds: 3))` ile açıldığında `AppBar`'da `00:03` sayaç rozetinin göründüğünü,
   - `tester.pump(const Duration(seconds: 3))` ve `tester.pumpAndSettle()` sonrasında sürenin dolup otomatik olarak `QuizResultScreen` ('Test Tamamlandı!') ekranına geçtiğini test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-08: Faz 5 — `go_router` ve `StatefulShellRoute` ile Profesyonel Navigasyon

```text
GÖREV: TASK-08 — Faz 5: go_router ve StatefulShellRoute Navigasyon Geçişi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Paketi `flutter pub add go_router` komutu ile ekle. TASK-07 tamamlandıktan sonra bu görevi uygula:

ADIM 1: `go_router` Paketini Ekleme ve Router Yapılandırması (`lib/app/router.dart`)
1. Terminalden `flutter pub add go_router` komutunu çalıştır.
2. `lib/app/router.dart` dosyasını oluştur (Angular'daki `app.routes.ts` ve `<router-outlet>` karşılığını yorumla açıkla).
3. `GoRouter createAppRouter()` fonksiyonu tanımla (`initialLocation: '/'`):
   - `StatefulShellRoute.indexedStack` kullanarak 5 alt menü sekmesini (`HomeScreen` -> `'/'`, `LessonsScreen` -> `'/lessons'`, `ExamsScreen` -> `'/exams'`, `StatsScreen` -> `'/stats'`, `ProfileScreen` -> `'/profile'`) `AppShell(navigationShell: navigationShell)` ile sar.
   - Ekran rotalarını tanımla:
     - `'/quiz'`: `state.extra` üzerinden opsiyonel `QuizRouteArgs` (veya `List<Question>`) alarak `QuizScreen` açar.
     - `'/flashcards'`: `FlashcardsScreen` açar.
     - `'/mistakes'`: `MistakesScreen` açar.

ADIM 2: `AppShell` ve `MyApp` Güncellemesi
1. `lib/app/app_shell.dart` dosyasını güncelle:
   - `StatefulWidget` yerine `StatelessWidget` (veya `StatefulNavigationShell? navigationShell` opsiyonel parametresiyle hem doğrudan `const AppShell()` testlerini hem de `GoRouter` `StatefulNavigationShell` kullanımını destekleyen hibrit yapı) kullan.
   - `navigationShell != null` ise `selectedIndex: navigationShell!.currentIndex` ve `onDestinationSelected: (index) => navigationShell!.goBranch(index, initialLocation: index == navigationShell!.currentIndex)` kullan.
2. `lib/main.dart` içinde `MaterialApp.router(routerConfig: appRouter, ...)` yapısına geç.

ADIM 3: Doğrulama
1. Mevcut tüm testlerin (`test/widget_test.dart` dahil) kırılmadan geçtiğini doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-09: Faz 8 — `flutter_riverpod` ile Canlı Günlük Hedef & İstatistikler

```text
GÖREV: TASK-09 — Faz 8: Riverpod State Management, Canlı Günlük Hedef ve İstatistik Ekranı
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Paketi `flutter pub add flutter_riverpod` komutu ile ekle. TASK-08 tamamlandıktan sonra bu görevi uygula:

ADIM 1: `flutter_riverpod` Kurulumu ve Çalışma İstatistikleri Provider'ı
1. Terminalden `flutter pub add flutter_riverpod` komutunu çalıştır.
2. `lib/main.dart` içinde `MyApp`'i `const ProviderScope(child: MyApp())` ile sar (testlerde de gerekirse `ProviderScope` desteğini koru).
3. `lib/features/stats/data/study_stats_notifier.dart` dosyasını oluştur (Angular'daki `Signal` / `BehaviorSubject` tutan global servis karşılığını yorumla açıkla):
   - `StudyStatsState` modeli: `final int totalSolved;`, `final int totalCorrect;`, `final int totalWrong;`, `final int dailyGoal;`, `final Map<String, int> wrongByLesson;`
   - Yardımcı getter'lar:
     - `int get accuracyPercent => totalSolved == 0 ? 0 : ((totalCorrect / totalSolved) * 100).round();`
     - `String get weakestLesson` -> `wrongByLesson` içinde en çok yanlış yapılan dersin adını döner (yoksa `'Henüz veri yok'`).
   - `StudyStatsNotifier extends Notifier<StudyStatsState>` ve `final studyStatsProvider = NotifierProvider<StudyStatsNotifier, StudyStatsState>(StudyStatsNotifier.new);` tanımla.
   - Metotlar:
     - `void recordAnswer({required String lesson, required bool isCorrect})` -> `totalSolved++`, doğruysa `totalCorrect++`, yanlışsa `totalWrong++` ve `wrongByLesson[lesson]` değerini 1 artırır.
     - `void updateDailyGoal(int newGoal)` -> `dailyGoal` değerini günceller.

ADIM 2: `QuizScreen`, `HomeScreen` ve `StatsScreen` Entegrasyonu
1. `QuizScreen` (`ConsumerStatefulWidget` yap): `_submitAnswer()` içinde her soru onaylandığında `ref.read(studyStatsProvider.notifier).recordAnswer(lesson: _currentQuestion.lesson, isCorrect: isCorrect)` çağır.
2. `HomeScreen` (`ConsumerWidget` yap): `_DailyGoalCard` bileşenine `solved: stats.totalSolved` ve `goal: stats.dailyGoal` değerlerini `ref.watch(studyStatsProvider)` üzerinden canlı olarak ver (`LinearProgressIndicator` için `(solved / goal).clamp(0.0, 1.0)` kullan).
3. `StatsScreen` (`ConsumerWidget` yap):
   - `'Çözülen soru'` kartında `'${stats.totalSolved}'`,
   - `'Doğru oranı'` kartında `stats.totalSolved == 0 ? '–' : '%${stats.accuracyPercent}'`,
   - `'En zayıf ders'` kartında `stats.weakestLesson` değerini canlı olarak göster.

ADIM 3: Test ve Doğrulama
1. `test/study_stats_test.dart` dosyasını oluştur: Soru çözüldükçe Ana Sayfadaki günlük hedefin (`0 / 30` -> `1 / 30`) ve İstatistik ekranındaki çözülen soru/doğru oranı/en zayıf ders verilerinin güncellendiğini test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-10: Para Kazanma (`Kadro PRO` Paywall & Ödüllü Reklam Limiti) + Profil Ayarları

```text
GÖREV: TASK-10 — Kadro PRO Abonelik Ekranı (Paywall), Günlük Soru Limiti / Ödüllü Reklam Akışı ve Profil Ayarları
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit renk/font kullanma, `Theme.of(context)` kullan. TASK-09 tamamlandıktan sonra bu görevi uygula:

ADIM 1: Abonelik & Tema Durumu (`lib/features/profile/data/user_preferences_notifier.dart`)
1. `UserPreferencesState` modeli oluştur:
   - `final bool isPro;` (varsayılan `false`)
   - `final int dailyFreeQuestionLimit;` (varsayılan `30`)
   - `final ThemeMode themeMode;` (varsayılan `ThemeMode.system`)
2. `UserPreferencesNotifier extends Notifier<UserPreferencesState>` ve `userPreferencesProvider` oluştur:
   - `void upgradeToPro()` -> `isPro = true` yapar.
   - `void rewardExtraQuestions([int amount = 20])` -> Ödüllü reklam izlendiğinde `dailyFreeQuestionLimit += amount` yapar.
   - `void setThemeMode(ThemeMode mode)` -> Uygulama temasını (`system`, `light`, `dark`) değiştirir.
3. `lib/main.dart` içinde `MyApp`'i `ConsumerWidget` yap ve `themeMode: ref.watch(userPreferencesProvider).themeMode` bağla.

ADIM 2: `PaywallScreen` (Kadro PRO Tanıtım & Satın Alma Ekranı) (`lib/features/profile/presentation/paywall_screen.dart`)
1. `PaywallScreen extends ConsumerWidget` oluştur.
2. Ekranda Kadro PRO avantajlarını şık kartlarla listele:
   - `'Sınırsız Genel Kültür Soru Çözümü & Deneme'`
   - `'Akıllı Yanlış Defteri (Öğrenene Kadar Tekrar)'`
   - `'Her Hafta Güncellenen Güncel Bilgiler Hap Kartları'`
   - `'Reklamsız, Kesintisiz Çalışma Deneyimi'`
3. Altta iki aksiyon butonu sun:
   - `'Kadro PRO\'ya Geç (Aylık 79,90 TL)'` (`FilledButton.icon`): Tıklandığında `ref.read(userPreferencesProvider.notifier).upgradeToPro()` çağırır, tebrik `SnackBar`'ı gösterir ve ekranı kapatır.
   - `'Kısa Reklam İzle (+20 Soru Hakkı Kazan)'` (`OutlinedButton.icon`): Tıklandığında `rewardExtraQuestions(20)` çağırır, `'+20 soru hakkı tanımlandı!'` mesajı gösterir ve ekranı kapatır.

ADIM 3: `ProfileScreen` Etkileşimi ve Günlük Limit Kontrolü
1. `lib/features/profile/presentation/profile_screen.dart` dosyasını `ConsumerWidget` yap:
   - En üste kullanıcı PRO değilse dikkat çekici bir `'Kadro PRO\'ya Yükselt'` tanıtım kartı (`_ProBannerCard`), PRO ise `'Kadro PRO Üyesi 👑'` rozeti ekle.
   - `'Günlük hedef'` satırına tıklanınca `30`, `50`, `100` soru seçebileceği bir `SimpleDialog` / `ModalBottomSheet` aç ve `studyStatsProvider.notifier.updateDailyGoal(...)` ile güncelle.
   - `'Tema'` satırına tıklanınca `Sistem`, `Açık`, `Koyu` tema seçimi yaptır ve `userPreferencesProvider.notifier.setThemeMode(...)` ile güncelle.
2. `QuizScreen` içinde kullanıcı PRO değilse (`!prefs.isPro`) ve çözülen soru sayısı `prefs.dailyFreeQuestionLimit` değerine ulaştıysa yeni soruya geçerken `PaywallScreen`'i aç.

ADIM 4: Test ve Doğrulama
1. `test/paywall_and_profile_test.dart` dosyasını oluştur:
   - Profil ekranından `PaywallScreen`'in açıldığını ve `'Kadro PRO\'ya Geç'` butonuna basılınca kullanıcının `isPro == true` olduğunu,
   - Tema ve günlük hedef seçiminin çalıştığını test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```



---

## 🎨 4. Dalga 4: Marka Kimliği & UI/UX Pro Max Dönüşümü (`TASK-11`, `TASK-12`, `TASK-13`)

Uygulamayı "basit bir AI/başlangıç projesi" görünümünden çıkarıp kurumsal **Kadro** EdTech markasına dönüştürmek için [design-system/kadro/MASTER.md](file:///d:/projelerim/gunisigi/design-system/kadro/MASTER.md) ve `.agents/skills/ui-ux-pro-max/SKILL.md` rehberliğinde hazırlanan 3 sıralı görev paketi:

---

### 📦 TASK-11: Kurumsal Marka Teması (`FlexColorScheme` + `GoogleFonts`) & Uygulama Kabuğu (`LucideIcons`)

```text
GÖREV: TASK-11 — Kurumsal Marka Teması (FlexColorScheme + GoogleFonts) ve Uygulama Kabuğu (AppTopBar, AppNavigationBar, PageHeader) Modernizasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Yeni paket kurma (flex_color_scheme, google_fonts, lucide_icons_flutter zaten pubspec.yaml içinde kuruludur). Sabit Color(0xFF...) YALNIZCA lib/app/theme.dart içinde tanımlanabilir.

ADIM 1: `lib/app/theme.dart` (`AppTheme`) Kurumsal Tema & Tipografi Dönüşümü
1. `lib/app/theme.dart` dosyasını `flex_color_scheme` ve `google_fonts` kullanacak şekilde yeniden yaz:
   - Gerekli importlar: `dart:io show Platform;`, `package:flex_color_scheme/flex_color_scheme.dart`, `package:flutter/material.dart`, `package:google_fonts/google_fonts.dart`.
   - Marka renk sabitlerini `AppTheme` içinde tanımla:
     - `static const Color seedColor = Color(0xFF4F46E5);` (Academic Royal Indigo)
     - `static const Color secondaryColor = Color(0xFF0F172A);` (Deep Slate)
     - `static const Color tertiaryColor = Color(0xFFD97706);` (Achievement Amber Gold)
     - `static const Color darkPrimaryColor = Color(0xFF818CF8);`
     - `static const Color darkSecondaryColor = Color(0xFF94A3B8);`
     - `static const Color darkTertiaryColor = Color(0xFFFBBF24);`
   - `_subThemesData` (`FlexSubThemesData`) tanımla:
     - `interactionEffects: true`, `tintedDisabledControls: true`, `blendOnLevel: 10`, `useM2StyleDividerInM3: true`,
     - `defaultRadius: 16.0`, `cardRadius: 16.0`, `filledButtonRadius: 12.0`, `outlinedButtonRadius: 12.0`, `inputDecoratorRadius: 12.0`,
     - `cardElevation: 0.0`, `navigationBarSelectedLabelSchemeColor: SchemeColor.primary`, `navigationBarSelectedIconSchemeColor: SchemeColor.primary`, `navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer`.
   - `_buildTextTheme(TextTheme base)` yardımcı metodunu yaz:
     - KRİTİK TEST GÜVENLİĞİ: `if (Platform.environment.containsKey('FLUTTER_TEST')) { return base; }` kontrolünü en başa koy (böylece `flutter test` çalışırken `google_fonts` dış ağdan HTTP ile font indirmeye çalışıp testleri yavaşlatmaz/uyarı basmaz).
     - Test dışında: `final bodyTheme = GoogleFonts.interTextTheme(base);` oluştur ve `bodyTheme.copyWith(...)` ile `displayLarge`, `displayMedium`, `displaySmall`, `headlineLarge`, `headlineMedium`, `headlineSmall`, `titleLarge`, `titleMedium`, `titleSmall` stillerini `GoogleFonts.plusJakartaSans(...)` ile (mevcut font ağırlıklarını koruyarak, `titleLarge` ve `headline*` için `FontWeight.w700` kullanarak) döndür.
   - `static ThemeData get light`: `FlexThemeData.light(...)` kullanarak `colors: const FlexSchemeColor(primary: seedColor, primaryContainer: Color(0xFFE0E7FF), secondary: secondaryColor, secondaryContainer: Color(0xFFF1F5F9), tertiary: tertiaryColor, tertiaryContainer: Color(0xFFFEF3C7), appBarColor: Color(0xFFF8FAFC), error: Color(0xFFDC2626))`, `surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold`, `blendLevel: 4`, `subThemesData: _subThemesData`, `visualDensity: FlexColorScheme.comfortablePlatformDensity` oluştur ve `.copyWith(textTheme: _buildTextTheme(baseLight.textTheme))` ile döndür.
   - `static ThemeData get dark`: `FlexThemeData.dark(...)` kullanarak `colors: const FlexSchemeColor(primary: darkPrimaryColor, primaryContainer: Color(0xFF312E81), secondary: darkSecondaryColor, secondaryContainer: Color(0xFF1E293B), tertiary: darkTertiaryColor, tertiaryContainer: Color(0xFF78350F), appBarColor: Color(0xFF0B0F19), error: Color(0xFFF87171))`, `surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold`, `blendLevel: 8`, `subThemesData: _subThemesData`, `visualDensity: FlexColorScheme.comfortablePlatformDensity` oluştur ve `.copyWith(textTheme: _buildTextTheme(baseDark.textTheme))` ile döndür.

ADIM 2: `AppTopBar`, `AppNavigationBar` ve `PageHeader` Modernizasyonu (`LucideIcons`)
1. `lib/app/widgets/app_top_bar.dart`:
   - Amatör görünüm veren `backgroundColor: Theme.of(context).colorScheme.inversePrimary` satırını KALDIR!
   - Yerine `backgroundColor: colorScheme.surface`, `surfaceTintColor: colorScheme.surfaceTint`, `scrolledUnderElevation: 0.5`, `centerTitle: false` kullan.
   - `title:` kısmında bir `Row(mainAxisSize: MainAxisSize.min, children: [...])` içinde:
     - `Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)), child: Icon(LucideIcons.graduationCap, size: 18, color: colorScheme.onPrimaryContainer))`
     - `const SizedBox(width: 10)`
     - `Text(title, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700))`
     (Böylece `find.widgetWithText(AppBar, 'Dersler')` ve `find.text('Kadro')` testleri %100 çalışmaya devam eder).
2. `lib/app/widgets/app_navigation_bar.dart`:
   - `package:lucide_icons_flutter/lucide_icons.dart` import et.
   - 5 sekmenin ikonlarını `LucideIcons` ile güncelle (etiket metinlerini `'Ana Sayfa'`, `'Dersler'`, `'Denemeler'`, `'İstatistik'`, `'Profil'` olarak BİREBİR koru):
     - Ana Sayfa: `icon: Icon(LucideIcons.house)`, `selectedIcon: Icon(LucideIcons.house)`
     - Dersler: `icon: Icon(LucideIcons.bookOpen)`, `selectedIcon: Icon(LucideIcons.bookOpen)`
     - Denemeler: `icon: Icon(LucideIcons.timer)`, `selectedIcon: Icon(LucideIcons.timer)`
     - İstatistik: `icon: Icon(LucideIcons.chartColumn)`, `selectedIcon: Icon(LucideIcons.chartColumn)`
     - Profil: `icon: Icon(LucideIcons.user)`, `selectedIcon: Icon(LucideIcons.user)`
3. `lib/shared/widgets/page_header.dart`:
   - `CircleAvatar` yerine modern yuvarlatılmış kare ikon kutusu kullan:
     `Container(width: 48, height: 48, decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: colorScheme.onPrimaryContainer))`
   - Başlık stilini `textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)` yap.

ADIM 3: Test ve Doğrulama
1. `test/theme_and_shell_test.dart` dosyasını oluştur:
   - `AppTheme.light.colorScheme.primary` değerinin `AppTheme.seedColor` ile uyumlu olduğunu ve `AppTheme.dark.brightness == Brightness.dark` olduğunu test et.
   - `MyApp` çizildiğinde `AppNavigationBar` içinde `LucideIcons.house` ve `LucideIcons.bookOpen` ikonlarının bulunduğunu doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-12: Bento Grid Ana Sayfa (`HomeScreen`), Gamified Hedef Kartı & `flutter_animate` Mikro Etkileşimler

```text
GÖREV: TASK-12 — Bento Grid Ana Sayfa, Gamified Günlük Hedef Kartı ve Lessons/Exams Ekranlarında LucideIcons + flutter_animate Dönüşümü
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. TASK-11 tamamlandıktan sonra bu görevi uygula.
KRİTİK ANİMASYON KURALI: `flutter_animate` kullanırken asla sonsuz `.repeat()` kullanma ve animasyon sürelerini `200.ms` - `250.ms` arasında tut ki `flutter test` içindeki `pumpAndSettle()` çağrıları zaman aşımına uğramasın!

ADIM 1: `HomeScreen` (`lib/features/home/presentation/home_screen.dart`) Hero Hedef Kartı & Bento Tasarımı
1. `package:flutter_animate/flutter_animate.dart` ve `package:lucide_icons_flutter/lucide_icons.dart` import et.
2. `PageHeader` ikonunu `LucideIcons.graduationCap` yap (`title: 'Hoş geldin'` metnini test uyumluluğu için BİREBİR koru).
3. `_DailyGoalCard` bileşenini zenginleştir:
   - Kartı `Card(color: colorScheme.primaryContainer.withAlpha(90), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: colorScheme.primary.withAlpha(60))), child: ...)` yap.
   - Üst satırda (`Row`): Solda `'Bugünkü hedefin'` (`textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)`), sağda `Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(LucideIcons.flame, size: 16, color: colorScheme.onTertiaryContainer), const SizedBox(width: 4), Text('Hedef Takibi', style: textTheme.labelSmall?.copyWith(color: colorScheme.onTertiaryContainer, fontWeight: FontWeight.bold))]))` göster.
   - Ortada `Text('$solved / $goal soru', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700))` metnini BİREBİR koru (`test/study_stats_test.dart` bu metni arar!).
   - Altta `ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(minHeight: 10, value: goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0)))` kullan.
   - `_DailyGoalCard` çıkışına `.animate().fadeIn(duration: 200.ms).slideY(begin: 0.04, end: 0, duration: 200.ms)` ekle.
4. `_StudyTypeTile` bileşenini modern Bento/Özellik kartı görünümüne kavuştur:
   - 4 çalışma türünün ikonlarını `LucideIcons` yap (başlık metinlerini `'Konu testi'`, `'Bilgi kartları'`, `'Yanlış defteri'`, `'Deneme sınavı'` olarak BİREBİR koru):
     - `'Konu testi'` -> `LucideIcons.target`
     - `'Bilgi kartları'` -> `LucideIcons.layers`
     - `'Yanlış defteri'` -> `LucideIcons.bookmark`
     - `'Deneme sınavı'` -> `LucideIcons.timer`
   - `_StudyTypeTile` içinde `Card` kenarlığını `RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: colorScheme.outlineVariant))` yap; `leading:` kısmında `Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: colorScheme.primary))` ve `trailing:` kısmında `Icon(LucideIcons.chevronRight, color: colorScheme.outline)` kullan.
   - Her `_StudyTypeTile` bileşenini `.animate().fadeIn(duration: 200.ms)` ile sar.

ADIM 2: `kpssLessons`, `LessonsScreen` ve `ExamsScreen` Modernizasyonu
1. `lib/features/lessons/data/kpss_lessons.dart`:
   - `package:lucide_icons_flutter/lucide_icons.dart` import et ve 4 dersin ikonlarını güncelle:
     - Tarih: `LucideIcons.bookOpen`
     - Coğrafya: `LucideIcons.globe`
     - Vatandaşlık: `LucideIcons.scale`
     - Güncel Bilgiler: `LucideIcons.sparkles`
2. `lib/features/lessons/presentation/lessons_screen.dart`:
   - `PageHeader` ikonunu `LucideIcons.bookOpen` yap.
   - `_LessonCard` içinde `Card` kenarlığına `side: BorderSide(color: colorScheme.outlineVariant)` ekle, `leading:` kısmını `Container(width: 44, height: 44, decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(12)), child: Icon(lesson.icon, color: colorScheme.onPrimaryContainer))` yap, `trailing:` ikonunu `Icon(LucideIcons.chevronRight)` yap ve kartı `.animate().fadeIn(duration: 200.ms)` ile sar.
3. `lib/features/exams/presentation/exams_screen.dart`:
   - `PageHeader` ikonunu `LucideIcons.timer` yap.
   - Sınav düzeni kartındaki 3 `ListTile` ikonunu `LucideIcons.listOrdered`, `LucideIcons.clock`, `LucideIcons.calculator` ve başlat butonundaki ikonu `LucideIcons.play` olarak güncelle (tüm metinleri birebir koru).

ADIM 3: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp tüm testlerin 0 hata ile geçtiğini doğrula.
```

---

### 📦 TASK-13: Görsel Analitik (`StatsScreen` + `fl_chart` `BarChart`) & Karne/Paywall Marka Cilası

```text
GÖREV: TASK-13 — StatsScreen Ders Bazlı Başarı Grafiği (fl_chart BarChart) ve QuizResultScreen / PaywallScreen Marka Cilası
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. TASK-12 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `StudyStatsState` (`lib/features/stats/data/study_stats_notifier.dart`) Ders Bazlı Başarı Verisi
1. `StudyStatsState` içine mevcut alanları hiç bozmadan iki yeni harita alanı ekle:
   - `final Map<String, int> solvedByLesson;` (varsayılan `this.solvedByLesson = const {}`)
   - `final Map<String, int> correctByLesson;` (varsayılan `this.correctByLesson = const {}`)
   - `copyWith` metoduna `solvedByLesson` ve `correctByLesson` parametrelerini ekle.
   - Yardımcı metot ekle:
     ```dart
     int lessonAccuracyPercent(String lesson) {
       final solved = solvedByLesson[lesson] ?? 0;
       if (solved == 0) return 0;
       final correct = correctByLesson[lesson] ?? 0;
       return ((correct / solved) * 100).round();
     }
     ```
2. `StudyStatsNotifier.recordAnswer({required String lesson, required bool isCorrect})` içinde:
   - `solvedByLesson` içinde ilgili `lesson` sayacını 1 artır.
   - `isCorrect` ise `correctByLesson` içinde ilgili `lesson` sayacını 1 artır.

ADIM 2: `StatsScreen` (`lib/features/stats/presentation/stats_screen.dart`) `fl_chart` `BarChart` Entegrasyonu
1. `package:fl_chart/fl_chart.dart`, `package:flutter_animate/flutter_animate.dart` ve `package:lucide_icons_flutter/lucide_icons.dart` import et.
2. `PageHeader` ikonunu `LucideIcons.chartColumn` yap.
3. Mevcut 3 `_StatCard` bileşenini (`'Çözülen soru'`, `'Doğru oranı'`, `'En zayıf ders'`) koru ve `_StatCard` içine opsiyonel `final IconData? icon;` parametresi ekleyerek kart başlığının yanına küçük bir `Icon` koy (`LucideIcons.check`, `LucideIcons.target`, `LucideIcons.flame`).
4. 3 kartın altına `const SizedBox(height: 16)` ve `_LessonAccuracyChartCard(stats: stats)` (`StatelessWidget`) ekle:
   - Kart içinde başlık olarak `Text('Ders Bazlı Başarı Oranı (%)', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700))` göster.
   - Altında `SizedBox(height: 200, child: BarChart(...))` ile 4 Genel Kültür dersinin (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) `stats.lessonAccuracyPercent(lesson)` değerlerini (0..100 arası, `maxY: 100`) gösteren 4 çubuk (`BarChartGroupData`) çiz:
     - `x: 0` -> `stats.lessonAccuracyPercent('Tarih').toDouble()`
     - `x: 1` -> `stats.lessonAccuracyPercent('Coğrafya').toDouble()`
     - `x: 2` -> `stats.lessonAccuracyPercent('Vatandaşlık').toDouble()`
     - `x: 3` -> `stats.lessonAccuracyPercent('Güncel Bilgiler').toDouble()`
     - Çubuk rengi `colorScheme.primary`, genişliği `width: 22`, `borderRadius: BorderRadius.circular(6)`, arka plan çubuğu `backDrawRodData: BackgroundBarChartRodData(show: true, toY: 100, color: colorScheme.secondaryContainer)`.
   - KRİTİK TEST KURALI: `titlesData` içindeki `bottomTitles` (`SideTitles`) kısmında derslerin tam adını (`'Tarih'`) YAZMA (`test/study_stats_test.dart` içindeki `expect(find.text('Tarih'), findsOneWidget)` testi grafikte de `'Tarih'` yazarsa 2 adet bulup kırılır!). Bunun yerine alt eksen etiketlerinde kısa kodları kullan:
     - `0 -> 'TAR'`, `1 -> 'COĞ'`, `2 -> 'VAT'`, `3 -> 'GÜN'`.
   - Sol/Üst/Sağ eksen başlıklarını (`leftTitles`, `topTitles`, `rightTitles`) ` const AxisTitles(sideTitles: SideTitles(showTitles: false))` ile gizle, `borderData: FlBorderData(show: false)` ve `gridData: const FlGridData(show: false)` yap.

ADIM 3: `QuizResultScreen` ve `PaywallScreen` Marka Cilası
1. `lib/features/quiz/presentation/quiz_result_screen.dart`:
   - Başarı rozet ikonunu `LucideIcons.trophy` yap ve özet kartına `.animate().fadeIn(duration: 200.ms)` ekle (mevcut tüm metinleri ve buton etiketlerini birebir koru).
2. `lib/features/profile/presentation/paywall_screen.dart`:
   - Üst rozet ikonunu `LucideIcons.crown` yap ve özellik satırlarındaki onay ikonlarını `LucideIcons.check` ile güncelle (mevcut tüm metinleri ve buton etiketlerini birebir koru).

ADIM 4: Test ve Doğrulama
1. `test/study_stats_test.dart` dosyasına yeni bir `testWidgets` ekle:
   - `StatsScreen` çizildiğinde `find.byType(BarChart)` bileşeninin ve `'Ders Bazlı Başarı Oranı (%)'`, `'TAR'`, `'COĞ'`, `'VAT'`, `'GÜN'` metinlerinin ekranda bulunduğunu doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 🦅 5. Dalga 5: "Koç Tuğrul" (Anadolu Kartalı) Maskot & Duolingo/Brilliant Tarzı "Tactile & Gamified" UX Dönüşümü (`TASK-14`, `TASK-15`, `TASK-16`)

Uygulamanın arayüzünü standart alt alta liste görünümünden tamamen çıkarıp; **Anadolu Kartalı "Koç Tuğrul"** (`assets/images/mascot/tugrul_*.png`) maskotunun duruma göre değişen ifadeleri, konuşma balonları, Duolingo/Brilliant tarzı **3D alt gölgeli basılabilir kartlar (`TactileCard`)**, **2x2 Bento Grid** ve üst barda canlı **Seri/PRO rozetleri** ile benzersiz bir kullanıcı deneyimine dönüştüren 3 sıralı görev:

---

### 📦 TASK-14: "Koç Tuğrul" Maskot Sistemi (`MascotCoachBanner`), 3D `TactileCard` & Gamified `AppTopBar`

```text
GÖREV: TASK-14 — "Koç Tuğrul" Maskot Konuşma Balonu (MascotCoachBanner), 3D Basılabilir Kart (TactileCard) ve Gamified Üst Bar (AppTopBar)
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Sabit Color(0xFF...) veya sabit fontSize KULLANMA; tüm renkleri Theme.of(context).colorScheme ve yazı stillerini textTheme üzerinden al. `lib/shared/` altında `widgets/` dışında klasör açma!

ADIM 1: `lib/shared/widgets/tactile_card.dart` (Duolingo / Brilliant Tarzı 3D Alt Gölgeli Kart)
1. `lib/shared/widgets/tactile_card.dart` dosyasını oluştur (Web/CSS'teki `border: 2px solid; box-shadow: 0 4px 0` ile yapılan 3D fiziksel buton/kart hissiyatının Flutter karşılığı olduğunu doc comment ile açıkla):
   - Sınıf: `class TactileCard extends StatelessWidget`
   - Parametreler:
     - `final Widget child;`
     - `final VoidCallback? onTap;`
     - `final EdgeInsetsGeometry padding;` (varsayılan `const EdgeInsets.all(16)`)
     - `final Color? backgroundColor;`
     - `final Color? borderColor;`
     - `final double borderRadius;` (varsayılan `18.0`)
   - `build` içinde:
     - `final colorScheme = Theme.of(context).colorScheme;`
     - `final effectiveBg = backgroundColor ?? colorScheme.surface;`
     - `final effectiveBorder = borderColor ?? colorScheme.outlineVariant;`
     - Dışta `Container` (`decoration: BoxDecoration(color: effectiveBg, borderRadius: BorderRadius.circular(borderRadius), border: Border.all(color: effectiveBorder, width: 1.5), boxShadow: [BoxShadow(color: effectiveBorder, offset: const Offset(0, 3.5), blurRadius: 0)])`),
     - İçinde `Material(color: Colors.transparent, child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(borderRadius), child: Padding(padding: padding, child: child)))` döndür. (Not: `Colors.transparent` yerine `colorScheme.surface.withAlpha(0)` kullan ki hiçbir sabit `Colors.*` kuralı ihlal edilmesin!).

ADIM 2: `lib/shared/widgets/mascot_coach_banner.dart` ("Koç Tuğrul" Konuşma Balonlu Maskot Bileşeni)
1. `lib/shared/widgets/mascot_coach_banner.dart` dosyasını oluştur:
   - `enum MascotMood { coach, victory, detective, pro }` tanımla ve her durum için asset yolunu döndüren bir getter/extension yaz:
     - `MascotMood.coach` -> `'assets/images/mascot/tugrul_coach.png'`
     - `MascotMood.victory` -> `'assets/images/mascot/tugrul_victory.png'`
     - `MascotMood.detective` -> `'assets/images/mascot/tugrul_detective.png'`
     - `MascotMood.pro` -> `'assets/images/mascot/tugrul_pro.png'`
   - `class MascotCoachBanner extends StatelessWidget`:
     - Parametreler: `final MascotMood mood;` (varsayılan `MascotMood.coach`), `final String title;`, `final String message;`, `final String badgeLabel;` (varsayılan `'KOÇ TUĞRUL'`).
     - `build` içinde `TactileCard` kullanarak (`backgroundColor: colorScheme.primaryContainer.withAlpha(75)`, `borderColor: colorScheme.primary.withAlpha(90)`):
       - Yan yana (`Row`, `crossAxisAlignment: CrossAxisAlignment.center`):
         1. Solda `72x72` boyutunda dairesel/yuvarlatılmış (`BorderRadius.circular(20)`) çerçeveli maskot portresi:
            ```dart
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: colorScheme.tertiary, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  mood.assetPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    LucideIcons.award,
                    color: colorScheme.primary,
                    size: 36,
                  ),
                ),
              ),
            )
            ```
         2. `const SizedBox(width: 14)`
         3. Sağda `Expanded` içinde konuşma balonu içeriği (`Column`, `crossAxisAlignment: CrossAxisAlignment.start`):
            - Üstte küçük rozet: `Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(8)), child: Text(badgeLabel, style: textTheme.labelSmall?.copyWith(color: colorScheme.onTertiaryContainer, fontWeight: FontWeight.w800)))`
            - `const SizedBox(height: 4)`
            - Başlık: `Text(title, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800))`
            - `const SizedBox(height: 4)`
            - Konuşma metni: `Text(message, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant))`

ADIM 3: `lib/app/widgets/app_top_bar.dart` (`AppTopBar` — Canlı Seri Ateşi & PRO Rozeti)
1. `AppTopBar` sınıfını `ConsumerWidget implements PreferredSizeWidget` yap (`flutter_riverpod`, `study_stats_notifier.dart`, `user_preferences_notifier.dart`, `paywall_screen.dart` import et).
2. Sol tarafta (`title:`):
   - Küçük yuvarlak **Koç Tuğrul** avatarı (`ClipOval` içinde `Image.asset('assets/images/mascot/tugrul_coach.png', width: 30, height: 30, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Icon(LucideIcons.graduationCap, size: 18, color: colorScheme.onPrimaryContainer))`) + `const SizedBox(width: 10)` + `Text(title, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800))` (Böylece `find.widgetWithText(AppBar, 'Dersler')` ve `find.text('Kadro')` testleri %100 korunur!).
3. Sağ tarafta (`actions:`):
   - Günlük Hedef / Seri rozeti: `Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(LucideIcons.flame, size: 16, color: colorScheme.onTertiaryContainer), const SizedBox(width: 4), Text('${stats.totalSolved}/${stats.dailyGoal}', style: textTheme.labelMedium?.copyWith(color: colorScheme.onTertiaryContainer, fontWeight: FontWeight.w800))]))`
   - `const SizedBox(width: 8)`
   - PRO rozet butonu (`InkWell` / `GestureDetector` ile tıklandığında `Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen()))`): `Container(margin: const EdgeInsets.only(right: 12), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: prefs.isPro ? colorScheme.tertiary : colorScheme.primaryContainer, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(LucideIcons.crown, size: 15, color: prefs.isPro ? colorScheme.onTertiary : colorScheme.onPrimaryContainer), const SizedBox(width: 4), Text('PRO', style: textTheme.labelSmall?.copyWith(color: prefs.isPro ? colorScheme.onTertiary : colorScheme.onPrimaryContainer, fontWeight: FontWeight.w800))]))`

ADIM 4: Test ve Doğrulama
1. `test/theme_and_shell_test.dart` içine `MascotCoachBanner` ve `TactileCard` bileşenlerinin hatasız çizildiğini doğrulayan bir test ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-15: Duolingo/Brilliant Tarzı 2x2 Tactile Bento Ana Sayfa (`HomeScreen`) & Görsel Ders Kartları (`LessonsScreen`)

```text
GÖREV: TASK-15 — HomeScreen'de Koç Tuğrul Konuşma Balonu + 2x2 Tactile Bento Grid Çalışma Kartları ve LessonsScreen 3D Ağırlık Barlı Ders Kartları
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. TASK-14 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `HomeScreen` (`lib/features/home/presentation/home_screen.dart`) Tam UX Dönüşümü (Koç Tuğrul + 2x2 Tactile Grid)
1. `HomeScreen` en üstündeki `PageHeader` yerine `MascotCoachBanner` kullan:
   ```dart
   MascotCoachBanner(
     mood: MascotMood.coach,
     title: 'Hoş geldin',
     message: stats.totalSolved == 0
         ? 'Ben Koç Tuğrul! KPSS Genel Kültür maratonunda bugün ilk pençeyi hangi konuya atıyoruz?'
         : 'Harika uçuş! Bugün ${stats.totalSolved} soru çözdün, kadro hedefine adım adım yaklaşıyoruz!',
   ),
   ```
   (DİKKAT: `title: 'Hoş geldin'` metnini BİREBİR koru, `test/widget_test.dart` ve `test/router_test.dart` bu metni arar!).
2. `_DailyGoalCard` bileşenini `TactileCard` kullanacak şekilde güncelle:
   - `TactileCard(backgroundColor: colorScheme.primaryContainer.withAlpha(90), borderColor: colorScheme.primary.withAlpha(110), child: ...)`
   - İçindeki `'Bugünkü hedefin'`, `'Hedef Takibi'` ve `'$solved / $goal soru'` metinlerini BİREBİR koru (`test/study_stats_test.dart` `'$solved / $goal soru'` metnini arar!).
3. **Sıradan alt alta liste görünümünü 2x2 Tactile Bento Grid yapısına dönüştür:**
   - `_StudyTypeTile` bileşenini 3D basılabilir dikey Bento kartı (`TactileCard`) olarak tasarla:
     - Üstte renkli ikon kutusu (`Container` `padding: const EdgeInsets.all(12)`, `decoration: BoxDecoration(color: accentContainerColor, borderRadius: BorderRadius.circular(14))` içinde `Icon(icon, color: accentColor, size: 26)` ve sağ üstte `Icon(LucideIcons.chevronRight, size: 18, color: colorScheme.outline)`),
     - `const SizedBox(height: 12)`,
     - Kalın başlık: `Text(title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800))`,
     - `const SizedBox(height: 4)`,
     - Açıklama: `Text(description, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant), maxLines: 2, overflow: TextOverflow.ellipsis)`.
   - `HomeScreen` `ListView` içinde `const SectionTitle('Çalışma türleri')` altına iki `Row` (2x2 Grid) yerleştir:
     - 1. `Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _StudyTypeTile(icon: LucideIcons.target, title: 'Konu testi', ...)), const SizedBox(width: 12), Expanded(child: _StudyTypeTile(icon: LucideIcons.layers, title: 'Bilgi kartları', ...))])`
     - `const SizedBox(height: 12)`
     - 2. `Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _StudyTypeTile(icon: LucideIcons.bookmark, title: 'Yanlış defteri', ...)), const SizedBox(width: 12), Expanded(child: _StudyTypeTile(icon: LucideIcons.timer, title: 'Deneme sınavı', ...))])`
   - (Başlıkları `'Konu testi'`, `'Bilgi kartları'`, `'Yanlış defteri'`, `'Deneme sınavı'` olarak BİREBİR koru!).

ADIM 2: `LessonsScreen` (`lib/features/lessons/presentation/lessons_screen.dart`) ve `ExamsScreen` (`lib/features/exams/presentation/exams_screen.dart`) Tactile Dönüşümü
1. `LessonsScreen`:
   - Üstteki `PageHeader` yerine `const MascotCoachBanner(mood: MascotMood.coach, title: 'KPSS Genel Kültür', message: '60 soruluk sınavda Tarih (%45) ve Coğrafya (%30) lokomotifimiz. Hangi dersten başlıyoruz?')` kullan.
   - `_LessonCard` içinde standart `Card` yerine `Padding(padding: const EdgeInsets.only(bottom: 12), child: TactileCard(...))` kullan ve her dersin sınavdaki ağırlığını (`lesson.questionCount / 60`) gösteren ince bir `ClipRRect(borderRadius: BorderRadius.circular(6), child: LinearProgressIndicator(minHeight: 6, value: lesson.questionCount / 60))` ilerleme çubuğu ekle (`lesson.name` ve `'Sınavda ${lesson.questionCount} soru · ${lesson.topics.length} konu'` metinlerini BİREBİR koru!).
2. `ExamsScreen`:
   - Üstteki `PageHeader` yerine `const MascotCoachBanner(mood: MascotMood.coach, title: 'Deneme sınavları', message: 'Gerçek sınav provası! 60 soru, 65 dakika ve 4 yanlış 1 doğruyu götürür.')` kullan.
   - Sınav düzeni kartını `TactileCard` ile sar.

ADIM 3: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp tüm testlerin 0 hata ile geçtiğini doğrula.
```

---

### 📦 TASK-16: Canlı Koç Tuğrul Sahne Entegrasyonu (`QuizResultScreen`, `MistakesScreen`, `PaywallScreen`, `ProfileScreen`)

```text
GÖREV: TASK-16 — Sınav Karnesinde "Zafer Tuğrul", Yanlış Defteri'nde "Dedektif Tuğrul" ve Kadro PRO'da "Kraliyet Taçlı Tuğrul" Sahne Entegrasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. TASK-15 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `QuizResultScreen` (`lib/features/quiz/presentation/quiz_result_screen.dart`) — "Zafer Tuğrul" (`MascotMood.victory`)
1. `QuizResultScreen` üstündeki `PageHeader` yerine `MascotCoachBanner` kullan:
   ```dart
   MascotCoachBanner(
     mood: MascotMood.victory,
     badgeLabel: 'ZAFER KARNESİ',
     title: 'Test Tamamlandı!',
     message: result.successRate >= 70
         ? 'Muhteşem bir uçuş! Koç Tuğrul seninle gurur duyuyor, kadro kapıları açılıyor!'
         : 'Güzel mücadele! Yanlış Defteri\'ne düşen soruları birlikte inceleyip nete çevirelim.',
   ),
   ```
   (DİKKAT: `title: 'Test Tamamlandı!'`, `'Net Puanın'`, `'Doğru'`, `'Yanlış'`, `'Boş'` ve `'Ana Sayfaya Dön'` metinlerini test uyumluluğu için BİREBİR koru!).
2. `_NetScoreCard` ve `_ResultStatItem` bileşenlerini `TactileCard` kullanacak şekilde güncelle.

ADIM 2: `MistakesScreen` (`lib/features/mistakes/presentation/mistakes_screen.dart`) — "Dedektif Tuğrul" (`MascotMood.detective`)
1. `_EmptyMistakesView` içinde üstteki `CircleAvatar` yerine `110x110` boyutunda yuvarlatılmış **Dedektif Tuğrul** görseli (`Image.asset('assets/images/mascot/tugrul_detective.png', width: 110, height: 110, fit: BoxFit.cover, errorBuilder: ...)`), altında `'Yanlış defterin tertemiz!'` ve açıklama metnini göster (mevcut metinleri BİREBİR koru!).
2. `_MistakeHeaderCard` içinde sol üstte `56x56` boyutunda **Dedektif Tuğrul** avatarı (`tugrul_detective.png`), yanında `'$mistakeCount Yanlış Soru'` ve `'Tekrar çözerek doğrula, defterden otomatik çıksın.'` metinlerini ve `'Tüm Yanlışları Tekrar Çöz'` butonunu koru. (DİKKAT: `_MistakeQuestionCard` içindeki silme butonunda `Icons.delete_outline` ikonunu BİREBİR koru çünkü `test/mistakes_screen_test.dart` `find.byIcon(Icons.delete_outline)` arar!).

ADIM 3: `PaywallScreen` (`lib/features/profile/presentation/paywall_screen.dart`) & `ProfileScreen` (`lib/features/profile/presentation/profile_screen.dart`) — "Kraliyet PRO Tuğrul" (`MascotMood.pro`)
1. `PaywallScreen` üst vurgu kartındaki (`Card`) `LucideIcons.crown` ikonu yerine `88x88` boyutunda altın çerçeveli **Kraliyet Taçlı PRO Tuğrul** (`assets/images/mascot/tugrul_pro.png` + `errorBuilder`) portresini yerleştir (`'KPSS Hazırlığını Zirveye Taşı'`, `'Kadro PRO\'ya Geç (Aylık 79,90 TL)'` ve `'Kısa Reklam İzle (+20 Soru Hakkı Kazan)'` metinlerini BİREBİR koru!).
2. `ProfileScreen` içindeki `_ProBannerCard` ve `_ProBadgeCard` bileşenlerinde sol tarafa `52x52` boyutunda **PRO Tuğrul** (`assets/images/mascot/tugrul_pro.png` + `errorBuilder`) portresi ekle (mevcut tüm başlık ve buton metinlerini BİREBİR koru!).

ADIM 4: Test ve Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp tüm testlerin 0 hata ile geçtiğini doğrula.
```


---

## 🚀 6. Dalga 6: Premium "Super-App / EdTech" Görsel Dönüşümü (`TASK-17`, `TASK-18`, `TASK-19`)

Mevcut arayüzdeki "düz/basic" hissiyatı tamamen ortadan kaldırmak için **Linear + Brilliant + Duolingo** hibriti olarak tasarlanan 3 büyük görsel sıçrama görevi:
1. **Havada Duran (Floating Pill) Alt Menü & Sinematik Gradient + Pop-Out Maskot Sahnesi (`TASK-17`)**
2. **Dairesel Hedef Halkası (`Circular Gauge`) + Canlı Rozetli & Aksiyonlu Gradient Bento Kartları (`TASK-18`)**
3. **Duolingo Tarzı Dikey "Konu Yol Haritası (Learning Path / Skill Tree)" (`TASK-19`)**

---

### 📦 TASK-17: Havada Duran (Floating Pill) Alt Menü (`AppNavigationBar`) & Sinematik Gradient/Pop-Out `MascotCoachBanner`

```text
GÖREV: TASK-17 — Havada Duran (Floating Pill Dock) Alt Menü (AppNavigationBar), Kavisli/Modern AppTopBar ve Sinematik Gradient + Büyük Pop-Out Maskot Sahnesi (MascotCoachBanner)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...) veya Colors.* KULLANMA; tüm renkleri Theme.of(context).colorScheme üzerinden al.

ADIM 1: `lib/app/widgets/app_navigation_bar.dart` — Havada Duran (Floating Pill/Dock) Alt Menü
1. Ekranın en altına yapışık standart düz bar görüntüsünü kaldırıp, etrafında boşluk olan, yuvarlatılmış kapsül (`BorderRadius.circular(28)`) ve yumuşak gölgeli bir Floating Dock haline getir:
   - `build` içinde:
     ```dart
     final colorScheme = Theme.of(context).colorScheme;

     return SafeArea(
       top: false,
       child: Padding(
         padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
         child: Container(
           decoration: BoxDecoration(
             color: colorScheme.surface,
             borderRadius: BorderRadius.circular(28),
             border: Border.all(
               color: colorScheme.primary.withAlpha(45),
               width: 1.5,
             ),
             boxShadow: [
               BoxShadow(
                 color: colorScheme.primary.withAlpha(28),
                 blurRadius: 20,
                 offset: const Offset(0, 8),
               ),
             ],
           ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(26),
             child: NavigationBar(
               height: 66,
               elevation: 0,
               backgroundColor: colorScheme.surface,
               indicatorColor: colorScheme.primaryContainer,
               selectedIndex: selectedIndex,
               onDestinationSelected: onDestinationSelected,
               destinations: const [ ...mevcut 5 NavigationDestination birebir korunacak... ],
             ),
           ),
         ),
       ),
     );
     ```
   - DİKKAT: İçerideki `NavigationBar` ve 5 `NavigationDestination` (`'Ana Sayfa'`, `'Dersler'`, `'Denemeler'`, `'İstatistik'`, `'Profil'` ve `LucideIcons`) BİREBİR korunmalıdır ki mevcut tüm router ve widget testleri sorunsuz geçsin!

ADIM 2: `lib/shared/widgets/mascot_coach_banner.dart` — Sinematik Gradient Hero Sahnesi & `96x96` Pop-Out Maskot
1. `MascotCoachBanner` bileşenindeki soluk tek renk arka planı ve küçük `72x72` kutuyu kaldır; yerine **Derin İndigo -> Kontrast Gradient (`LinearGradient`)**, arka planda dekoratif yarı saydam ışık halkaları (`Stack` + `Positioned`) ve **`96x96` boyutunda çift çerçeveli Pop-Out Maskot Sahnesi** kur:
   - `build` içinde:
     - Dış kapsayıcı olarak `Container` kullan:
       - `decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [colorScheme.primary, colorScheme.secondary]), borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: colorScheme.primary.withAlpha(70), blurRadius: 18, offset: const Offset(0, 8))])`
     - İçinde `ClipRRect(borderRadius: BorderRadius.circular(24), child: Stack(children: [...]))` kullan:
       - 1. Arka plan dekoratif ışık halkası (sağ üst):
         `Positioned(right: -24, top: -24, child: Container(width: 110, height: 110, decoration: BoxDecoration(shape: BoxShape.circle, color: colorScheme.onPrimary.withAlpha(22))))`
       - 2. Arka plan dekoratif ışık halkası (sol alt):
         `Positioned(left: -18, bottom: -28, child: Container(width: 90, height: 90, decoration: BoxDecoration(shape: BoxShape.circle, color: colorScheme.tertiary.withAlpha(45))))`
       - 3. Ana içerik (`Padding(padding: const EdgeInsets.all(18), child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [...]))`):
         - Solda **`92x92` Pop-Out Maskot Sahnesi (`Stack`)**:
           - `Container(width: 92, height: 92, padding: const EdgeInsets.all(3), decoration: BoxDecoration(color: colorScheme.tertiary, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: colorScheme.surface.withAlpha(60), blurRadius: 12, offset: const Offset(0, 4))]), child: ClipRRect(borderRadius: BorderRadius.circular(21), child: Image.asset(mood.assetPath, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Container(color: colorScheme.primaryContainer, child: Icon(LucideIcons.award, color: colorScheme.primary, size: 42)))))`
           - Sağ alt köşesinde parlayan mini rozet (`Positioned(right: 0, bottom: 0, child: Container(padding: const EdgeInsets.all(5), decoration: BoxDecoration(color: colorScheme.tertiaryContainer, shape: BoxShape.circle, border: Border.all(color: colorScheme.surface, width: 2)), child: Icon(LucideIcons.sparkles, size: 12, color: colorScheme.onTertiaryContainer)))`).
         - `const SizedBox(width: 16)`
         - Sağda `Expanded` içinde konuşma balonu ve metinler:
           - Üstte altın/amber hap rozet (`badgeLabel`): `Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3), decoration: BoxDecoration(color: colorScheme.tertiary, borderRadius: BorderRadius.circular(20)), child: Text(badgeLabel, style: textTheme.labelSmall?.copyWith(color: colorScheme.onTertiary, fontWeight: FontWeight.w800)))`
           - `const SizedBox(height: 6)`
           - Başlık (`title`): `Text(title, style: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.w800))`
           - `const SizedBox(height: 6)`
           - Konuşma baloncuğu kutusu (`message`):
             `Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: colorScheme.surface.withAlpha(28), borderRadius: BorderRadius.circular(14), border: Border.all(color: colorScheme.onPrimary.withAlpha(45))), child: Text(message, style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.w500)))`

ADIM 3: `lib/app/widgets/app_top_bar.dart` — Premium Üst Bar Cilası
1. `AppTopBar` içindeki sol maskot avatarını `36x36` boyutunda, `border: Border.all(color: colorScheme.tertiary, width: 1.5)` altın çerçeveli yuvarlatılmış kare (`BorderRadius.circular(12)`) yap ve sağdaki seri/PRO rozetlerine ince kenarlık (`Border.all(color: colorScheme.outlineVariant)`) ekle.

ADIM 4: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-18: Super-App Ana Sayfa (`HomeScreen`) — Dairesel Hedef Halkası (`Circular Gauge`) & Zengin Rozetli Gradient Bento Kartları

```text
GÖREV: TASK-18 — HomeScreen Dairesel Hedef Halkası (Circular Gauge Dashboard) ve Aksiyon Rozetli/Gradient Bento Çalışma Kartları
ÖNEMLİ: GEMINI.md kurallarına birebir uy. TASK-17 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `_DailyGoalCard` (`lib/features/home/presentation/home_screen.dart`) — Dairesel Hedef Halkası (Circular Gauge)
1. `_DailyGoalCard` bileşenini tekdüze yatay çubuk görünümünden çıkarıp **Sol: Metrikler & Hap Rozetler + Sağ: `84x84` Dairesel İlerleme Halkası (`CircularProgressIndicator` Gauge)** olan bir Super-App Dashboard kartına dönüştür:
   - `final progress = goal == 0 ? 0.0 : (solved / goal).clamp(0.0, 1.0);`
   - `final percent = (progress * 100).round();`
   - `TactileCard` (`borderRadius: 22`, `backgroundColor: colorScheme.surface`, `borderColor: colorScheme.primary.withAlpha(90)`) içinde `Row(children: [...])`:
     - **Sol (`Expanded`):**
       - Üstte `Container` içinde `LucideIcons.flame` + `'Hedef Takibi'` rozeti (`colorScheme.tertiaryContainer`),
       - `const SizedBox(height: 8)`,
       - `Text('Bugünkü hedefin', style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant))` (Birebir koru!),
       - `const SizedBox(height: 2)`,
       - `Text('$solved / $goal soru', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800))` (DİKKAT: `'$solved / $goal soru'` metnini test uyumluluğu için BİREBİR koru!),
       - `const SizedBox(height: 10)`,
       - Altta `ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(minHeight: 8, value: progress))`
     - `const SizedBox(width: 16)`,
     - **Sağ (`SizedBox(width: 80, height: 80)` Dairesel Halka / Gauge):**
       ```dart
       SizedBox(
         width: 80,
         height: 80,
         child: Stack(
           alignment: Alignment.center,
           children: [
             SizedBox(
               width: 76,
               height: 76,
               child: CircularProgressIndicator(
                 value: progress,
                 strokeWidth: 8,
                 backgroundColor: colorScheme.primaryContainer.withAlpha(90),
                 color: colorScheme.primary,
                 strokeCap: StrokeCap.round,
               ),
             ),
             Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(LucideIcons.flame, size: 18, color: colorScheme.tertiary),
                 Text(
                   '%$percent',
                   style: textTheme.labelLarge?.copyWith(
                     fontWeight: FontWeight.w800,
                     color: colorScheme.primary,
                   ),
                 ),
               ],
             ),
           ],
         ),
       )
       ```

ADIM 2: `_StudyTypeTile` (`lib/features/home/presentation/home_screen.dart`) — Canlı Rozetli & Aksiyonlu Bento Kartları
1. `_StudyTypeTile` sınıfına `final String badgeText;` ve `final String actionText;` (varsayılan `'Başla'`) parametreleri ekle:
   - `HomeScreen` içindeki 4 çağrıda şu `badgeText` değerlerini ver:
     - `'Konu testi'` -> `badgeText: '10-20 Soru'`
     - `'Bilgi kartları'` -> `badgeText: 'Hızlı Tekrar'`
     - `'Yanlış defteri'` -> `badgeText: 'Akıllı Havuz'`
     - `'Deneme sınavı'` -> `badgeText: '65 Dakika'`
2. `_StudyTypeTile.build` içinde:
   - Kart arka planını `effectiveAccentContainer.withAlpha(55)` ve kenarlığını `effectiveAccent.withAlpha(95)` yaparak her bir Bento kartının kendine has canlı bir renk tonuna sahip olmasını sağla (düz beyaz kalmasın!).
   - Üst satırda (`Row`): Solda `Container` içinde `Icon(icon, color: effectiveAccent, size: 24)`, sağda ise `Flexible` içinde canlı `badgeText` hap rozeti (`Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: effectiveAccentContainer, borderRadius: BorderRadius.circular(12)), child: Text(badgeText, style: textTheme.labelSmall?.copyWith(color: effectiveAccent, fontWeight: FontWeight.w800), overflow: TextOverflow.ellipsis))`) göster.
   - Ortada `Text(title, ...)` ve `Text(description, maxLines: 2, ...)`.
   - En altta (`const SizedBox(height: 10)` sonrası) bir aksiyon satırı ekle:
     ```dart
     Row(
       children: [
         Text(
           actionText,
           style: textTheme.labelMedium?.copyWith(
             color: effectiveAccent,
             fontWeight: FontWeight.w800,
           ),
         ),
         const SizedBox(width: 4),
         Icon(LucideIcons.chevronRight, size: 16, color: effectiveAccent),
       ],
     )
     ```

ADIM 3: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-19: Duolingo Tarzı "Konu Yol Haritası (Learning Path / Skill Tree)" (`LessonTopicsScreen`) & Zengin Modül Kartları (`LessonsScreen`)

```text
GÖREV: TASK-19 — LessonTopicsScreen Ekranını Duolingo/Brilliant Tarzı Dikey "Konu Yol Haritası (Learning Path)" Yapısına Dönüştürme ve LessonsScreen Modül Kartlarını Zenginleştirme
ÖNEMLİ: GEMINI.md kurallarına birebir uy. TASK-18 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `lib/features/lessons/presentation/lesson_topics_screen.dart` — Duolingo Tarzı Dikey Yol Haritası (Learning Path)
1. `LessonTopicsScreen` içindeki sıradan `Card` + `ListTile` listesini tamamen kaldır ve yerine **Üstte Ders Özeti Başlığı + Altta Dikey Bağlantı Çizgili Yol Haritası Düğümleri (`_TopicPathNode`)** kur (`package:kadro/shared/widgets/tactile_card.dart` ve `package:lucide_icons_flutter/lucide_icons.dart` import et):
   - `AppBar(title: Text('${lesson.name} Konuları'))` başlığını BİREBİR koru (`test/widget_test.dart` `'Tarih Konuları'` metnini arar!).
   - `body:` içinde `ListView.builder` (`padding: const EdgeInsets.all(16)`, `itemCount: lesson.topics.length`) kullan:
     - Her eleman için `_TopicPathNode(index: index, totalCount: lesson.topics.length, lessonName: lesson.name, topic: lesson.topics[index], onTap: ...)` döndür.
2. `_TopicPathNode extends StatelessWidget` bileşenini oluştur:
   - `IntrinsicHeight` + `Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [...])` kullanarak:
     - **1. Sol Sütun (Duolingo/Brilliant Yol Haritası Düğümü ve Dikey Bağlantı Çizgisi):**
       ```dart
       SizedBox(
         width: 48,
         child: Column(
           children: [
             Container(
               width: 40,
               height: 40,
               decoration: BoxDecoration(
                 color: index == 0
                     ? colorScheme.primary
                     : colorScheme.primaryContainer,
                 shape: BoxShape.circle,
                 border: Border.all(
                   color: colorScheme.primary,
                   width: 2,
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: colorScheme.primary.withAlpha(45),
                     offset: const Offset(0, 3),
                     blurRadius: 0,
                   ),
                 ],
               ),
               alignment: Alignment.center,
               child: Text(
                 '${index + 1}',
                 style: textTheme.labelLarge?.copyWith(
                   color: index == 0
                       ? colorScheme.onPrimary
                       : colorScheme.onPrimaryContainer,
                   fontWeight: FontWeight.w800,
                 ),
               ),
             ),
             if (index < totalCount - 1)
               Expanded(
                 child: Container(
                   width: 3,
                   margin: const EdgeInsets.symmetric(vertical: 4),
                   decoration: BoxDecoration(
                     color: colorScheme.primary.withAlpha(70),
                     borderRadius: BorderRadius.circular(2),
                   ),
                 ),
               ),
           ],
         ),
       )
       ```
     - `const SizedBox(width: 12)`
     - **2. Sağ Sütun (`Expanded` içinde 3D `TactileCard` Konu Modülü):**
       - `Padding(padding: const EdgeInsets.only(bottom: 14), child: TactileCard(onTap: onTap, backgroundColor: index == 0 ? colorScheme.primaryContainer.withAlpha(65) : colorScheme.surface, borderColor: index == 0 ? colorScheme.primary : colorScheme.outlineVariant, child: ...))`
       - Kart içinde:
         - Üstte küçük adım rozeti: `Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('ADIM ${index + 1}', style: textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800)), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(10)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(LucideIcons.play, size: 12, color: colorScheme.primary), const SizedBox(width: 4), Text('Test Çöz', style: textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold))]))])`
         - `const SizedBox(height: 6)`
         - Konu adı: `Text(topic, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700))` (DİKKAT: `topic` metnini BİREBİR koru, `test/widget_test.dart` `'İslamiyet Öncesi Türk Tarihi'` metnini arar!).

ADIM 2: `lib/features/lessons/presentation/lessons_screen.dart` — Zengin Akademi Modül Kartları
1. `_LessonCard` içinde:
   - Kartın arka planına hafif renkli ton (`colorScheme.primaryContainer.withAlpha(35)`) ve kenarlığına `colorScheme.primary.withAlpha(80)` ver.
   - İlerleme çubuğunun (`LinearProgressIndicator`) altına `const SizedBox(height: 10)` ve bir alt bilgi/aksiyon satırı (`Row`) ekle:
     - Solda `Icon(LucideIcons.layers, size: 14, color: colorScheme.primary)` + `' ${lesson.topics.length} Adımlı Yol Haritası'` (`textTheme.labelSmall`),
     - Sağda `'Yol Haritasını Aç →'` (`textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800)`).

ADIM 3: Test ve Doğrulama
1. `test/widget_test.dart` içinde `'Tarih'` kartına tıklanınca açılan `LessonTopicsScreen` ekranında `'ADIM 1'` ve `'Test Çöz'` yol haritası rozetlerinin de görüntülendiğini doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 📅 7. Dalga 7: Akıllı KPSS Çalışma Planlayıcı (Smart Study Planner — `TASK-20` & `TASK-21`)

Sıradan bir To-Do listesi yerine, KPSS Genel Kültür çalışmasıyla doğrudan entegre olan **Altın Oran (Akıllı KPSS Planlayıcı)** mimarisi:
- **Ders Etiketi & Süre Rozeti:** Her görevin bir ders etiketi (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`, `Genel`) ve tahmini süresi (`15 dk`, `25 dk`, `40 dk`, `65 dk`) vardır.
- **Tek Tıkla "Başla ▶" Entegrasyonu:** Görevin yanındaki `"Başla"` butonuna basıldığında görev türüne göre doğrudan `QuizScreen`, `FlashcardsScreen` veya `MistakesScreen` açılır!
- **Hibrit Erişim:** Ana sayfada (`HomeScreen`) **"Bugünün Çalışma Planı"** kompakt widget'ı üzerinden anında tik atılabilir; `"Tümünü Gör / + Ekle"` ile tam ekran `StudyPlannerScreen` (`/planner`) açılır.

---

### 📦 TASK-20: Akıllı KPSS Çalışma Planlayıcı Veri Katmanı (`StudyTask` & `StudyPlannerNotifier`)

```text
GÖREV: TASK-20 — Akıllı KPSS Çalışma Planlayıcı Veri Modeli (StudyTask) ve Riverpod State Yönetimi (StudyPlannerNotifier)
ÖNEMLİ: GEMINI.md ve .agents/skills/flutter-feature/SKILL.md kurallarına birebir uy. Feature-first klasör yapısını (`lib/features/planner/data/...`) kullan.

ADIM 1: `lib/features/planner/data/models/study_task.dart` (Görev Modeli)
1. `lib/features/planner/data/models/study_task.dart` dosyasını oluştur:
   - Görevin uygulama içindeki hangi çalışma ekranını tetikleyeceğini belirten `enum` tanımla:
     ```dart
     enum StudyTaskActionType { quiz, flashcards, mistakes, custom }
     ```
   - `class StudyTask` modelini oluştur:
     - `final String id;`
     - `final String title;`
     - `final String lessonTag;` (`'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`, `'Genel'`)
     - `final int estimatedMinutes;`
     - `final bool isCompleted;`
     - `final StudyTaskActionType actionType;`
     - `const StudyTask({required this.id, required this.title, required this.lessonTag, this.estimatedMinutes = 25, this.isCompleted = false, this.actionType = StudyTaskActionType.custom});`
     - `StudyTask copyWith({String? id, String? title, String? lessonTag, int? estimatedMinutes, bool? isCompleted, StudyTaskActionType? actionType})` metodunu yaz.

ADIM 2: `lib/features/planner/data/study_planner_notifier.dart` (Riverpod Notifier & State)
1. `lib/features/planner/data/study_planner_notifier.dart` dosyasını oluştur:
   - `class StudyPlannerState`:
     - `final List<StudyTask> tasks;`
     - `const StudyPlannerState({this.tasks = const []});`
     - Yardımcı getter'lar:
       - `int get totalCount => tasks.length;`
       - `int get completedCount => tasks.where((t) => t.isCompleted).length;`
       - `int get remainingCount => totalCount - completedCount;`
       - `int get totalEstimatedMinutes => tasks.fold(0, (sum, t) => sum + t.estimatedMinutes);`
       - `double get completionProgress => totalCount == 0 ? 0.0 : (completedCount / totalCount).clamp(0.0, 1.0);`
     - `StudyPlannerState copyWith({List<StudyTask>? tasks})`
   - `class StudyPlannerNotifier extends Notifier<StudyPlannerState>`:
     - `build()` içinde kullanıcının ilk açılışta hemen deneyimleyebileceği 3 başlangıç KPSS görevi döndür:
       1. `StudyTask(id: 'task_1', title: 'İslamiyet Öncesi Türk Tarihi 15 Soru Çöz', lessonTag: 'Tarih', estimatedMinutes: 20, actionType: StudyTaskActionType.quiz)`
       2. `StudyTask(id: 'task_2', title: 'Türkiye Coğrafi Konumu Hap Kart Tekrarı', lessonTag: 'Coğrafya', estimatedMinutes: 15, actionType: StudyTaskActionType.flashcards)`
       3. `StudyTask(id: 'task_3', title: 'Yanlış Defterindeki Soruları Temizle', lessonTag: 'Genel', estimatedMinutes: 15, actionType: StudyTaskActionType.mistakes)`
     - Metotlar:
       - `void toggleTask(String id)`: İlgili `id`'ye sahip görevin `isCompleted` değerini tersine çevirir (`!task.isCompleted`).
       - `void addTask({required String title, required String lessonTag, int estimatedMinutes = 25, StudyTaskActionType actionType = StudyTaskActionType.custom})`: Boş olmayan `title.trim()` ile yeni bir `StudyTask` (`id: DateTime.now().microsecondsSinceEpoch.toString()`) oluşturup listenin başına veya sonuna ekler.
       - `void removeTask(String id)`: İlgili `id`'ye sahip görevi listeden çıkarır.
       - `void clearCompleted()`: Tamamlanmış (`isCompleted == true`) görevleri listeden temizler.
   - Global provider:
     `final studyPlannerProvider = NotifierProvider<StudyPlannerNotifier, StudyPlannerState>(StudyPlannerNotifier.new);`

ADIM 3: Birim Testleri ve Doğrulama
1. `test/study_planner_test.dart` dosyasını oluştur:
   - Başlangıçta 3 varsayılan görevin geldiğini (`totalCount == 3`, `completedCount == 0`),
   - `toggleTask('task_1')` çağrıldığında `completedCount == 1` olduğunu,
   - `addTask` ve `removeTask` metotlarının doğru çalıştığını test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-21: Hibrit Çalışma Planlayıcı Arayüzü (`HomeDailyPlanCard` + `StudyPlannerScreen` + Hazır Şablonlar & "Başla ▶")

```text
GÖREV: TASK-21 — Ana Sayfa Kompakt Çalışma Planı Kartı (HomeDailyPlanCard), Tam Ekran Akıllı Planlayıcı (StudyPlannerScreen) ve Router Entegrasyonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...) veya Colors.* KULLANMA; tüm renkleri Theme.of(context).colorScheme üzerinden al. TASK-20 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `lib/features/planner/presentation/study_planner_screen.dart` (Tam Ekran Akıllı KPSS Planlayıcı)
1. `StudyPlannerScreen extends ConsumerWidget` oluştur:
   - `AppBar`: `title: const Text('Çalışma Planlayıcın')`, sağda (`actions:`) tamamlanan görev varsa (`planner.completedCount > 0`) `TextButton.icon(onPressed: () => ref.read(studyPlannerProvider.notifier).clearCompleted(), icon: const Icon(LucideIcons.trash2, size: 16), label: const Text('Tamamlananları Sil'))`.
   - `body:` `ListView(padding: const EdgeInsets.all(16), children: [...])`:
     1. **Üst Koç Sahnesi:**
        ```dart
        const MascotCoachBanner(
          mood: MascotMood.coach,
          badgeLabel: 'GÜNLÜK KAMP PLANI',
          title: 'Bugünkü Görevlerin',
          message: 'Planlı çalışan kadroyu kapar! Görevlerini tikle veya Başla butonuyla doğrudan çalışmaya geç.',
        ),
        ```
     2. **Plan İlerleme & Süre Özeti Kartı (`_PlannerSummaryCard`):**
        - `TactileCard` içinde: Solda `'${planner.completedCount} / ${planner.totalCount} Görev Tamamlandı'`, sağda `Container` rozet içinde `LucideIcons.clock` + `'Toplam ${planner.totalEstimatedMinutes} dk'` ve altta `ClipRRect` içinde `LinearProgressIndicator(minHeight: 8, value: planner.completionProgress)`.
     3. **Tek Tıkla Hazır KPSS Görev Şablonları (`_QuickTemplatesStrip`):**
        - Başlık: `const SectionTitle('Hızlı Görev Şablonları (Tek Tıkla Ekle)')`
        - Yatay kaydırılabilir (`SingleChildScrollView(scrollDirection: Axis.horizontal)`) 4 adet `ActionChip`:
          - `'+ 20 Tarih Sorusu'` (`lessonTag: 'Tarih'`, `estimatedMinutes: 25`, `actionType: StudyTaskActionType.quiz`)
          - `'+ Coğrafya Hap Kart'` (`lessonTag: 'Coğrafya'`, `estimatedMinutes: 15`, `actionType: StudyTaskActionType.flashcards`)
          - `'+ Vatandaşlık Testi'` (`lessonTag: 'Vatandaşlık'`, `estimatedMinutes: 20`, `actionType: StudyTaskActionType.quiz`)
          - `'+ Yanlışları Temizle'` (`lessonTag: 'Genel'`, `estimatedMinutes: 15`, `actionType: StudyTaskActionType.mistakes`)
        - Tıklandığında `ref.read(studyPlannerProvider.notifier).addTask(...)` çağırır.
     4. **Görev Listesi (`_PlannerTaskTile`):**
        - Liste boşsa şık bir boş durum (`'Bugün için planlanmış görev kalmadı! Şablonlardan veya + Görev Ekle butonundan yeni hedef ekleyebilirsin.'`) göster.
        - Her `StudyTask` için `Padding(padding: const EdgeInsets.only(bottom: 12), child: TactileCard(...))`:
          - Sol: Dokunulunca `toggleTask(task.id)` yapan dairesel/kare onay ikonu (`task.isCompleted ? LucideIcons.circleCheck : LucideIcons.squareCheck`).
          - Orta (`Expanded`):
            - Üstte ders rozeti (`task.lessonTag`) + süre rozeti (`'${task.estimatedMinutes} dk'`),
            - Altta görev başlığı (`Text(task.title, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, decoration: task.isCompleted ? TextDecoration.lineThrough : null))`).
          - Sağ:
            - Görev tamamlanmadıysa ve aksiyonu varsa küçük `'Başla'` butonu (`FilledButton.tonal` veya `InkWell` rozet: `StudyTaskActionType.quiz` -> `QuizScreen`, `flashcards` -> `FlashcardsScreen`, `mistakes` -> `MistakesScreen` açar),
            - Silme ikonu (`IconButton(icon: Icon(LucideIcons.trash2, size: 18, color: colorScheme.error), onPressed: () => ref.read(studyPlannerProvider.notifier).removeTask(task.id))`).
   - **`floatingActionButton:`** `FloatingActionButton.extended(onPressed: () => _showAddTaskSheet(context, ref), icon: const Icon(LucideIcons.plus), label: const Text('Görev Ekle'))`.
   - **`_showAddTaskSheet` (`ModalBottomSheet` — Ayrı bir `_AddTaskBottomSheet extends ConsumerStatefulWidget` sınıfı olarak yaz):**
     - Görev başlığı `TextField` (`hintText: 'Örn: Osmanlı Yükselme Dönemi 2 Test'`),
     - Ders seçimi (`Wrap` içinde `ChoiceChip`: `'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`, `'Genel'`),
     - Süre seçimi (`Wrap` içinde `ChoiceChip`: `15`, `25`, `40`, `65` dk),
     - `'Plana Ekle'` (`FilledButton`): Tıklanınca `addTask` çağırır ve `Navigator.of(context).pop()` yapar.

ADIM 2: `lib/features/planner/presentation/widgets/home_daily_plan_card.dart` (Ana Sayfa Kompakt Plan Widget'ı)
1. `HomeDailyPlanCard extends ConsumerWidget` oluştur:
   - `TactileCard` içinde:
     - Üst satır (`Row`):
       - Solda `Icon(LucideIcons.listTodo, color: colorScheme.primary)` + `const SizedBox(width: 8)` + `Expanded(child: Text('Bugünün Çalışma Planı', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)))`,
       - Sağda `'${planner.completedCount}/${planner.totalCount}'` rozeti ve `'Tümünü Gör'` (`TextButton` -> `StudyPlannerScreen` ekranını açar).
     - Orta kısım: `planner.tasks.take(3)` ile ilk 3 görevi kompakt satırlar halinde listele (her satırda tik atma `InkWell` + görev başlığı + ders/süre etiketi).
     - Alt satır: `OutlinedButton.icon(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StudyPlannerScreen())), icon: const Icon(LucideIcons.calendarCheck, size: 16), label: const Text('Planlayıcıyı Aç & Görev Ekle'))`.

ADIM 3: `HomeScreen` ve `router.dart` Entegrasyonu
1. `lib/features/home/presentation/home_screen.dart` içinde `_DailyGoalCard` altına `const SizedBox(height: 16)` ve `const HomeDailyPlanCard()` ekle (mevcut tüm başlıkları ve Bento kartlarını BİREBİR koru!).
2. `lib/app/router.dart` içine `/planner` (`builder: (context, state) => const StudyPlannerScreen()`) rotasını ekle.

ADIM 4: Widget Testi ve Doğrulama
1. `test/study_planner_test.dart` içine widget testleri ekle:
   - `HomeScreen` üzerinde `'Bugünün Çalışma Planı'` kartının ve varsayılan görevlerin göründüğünü,
   - `'Planlayıcıyı Aç & Görev Ekle'` butonuna tıklanınca `StudyPlannerScreen` ekranının açıldığını ve hızlı şablon (`'+ 20 Tarih Sorusu'`) tıklanınca görev sayısının 4'e çıktığını doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## ⚡ 8. Dalga 8: Etkileşimli Soru/Oyun Modları (`60 Saniyede Pençe` & `Kavram Eşleştir`), Çözülen Testler Arşivi, Ustalık Isı Haritası & XP/Lig Sistemi (`TASK-22`, `TASK-23`, `TASK-24`)

[docs/supabase_schema.sql](file:///d:/projelerim/gunisigi/docs/supabase_schema.sql) içindeki Supabase PostgreSQL şemasıyla (`questions`, `quiz_sessions`, `question_attempt_logs`, `user_topic_mastery`, `profiles`) birebir uyumlu olarak hazırlanan 3 görev:

---

### 📦 TASK-22: Etkileşimli Oyun Modu 1 — "60 Saniyede Pençe" Doğru / Yanlış Hızlı Düello (`TrueFalseBlitzScreen`)

```text
GÖREV: TASK-22 — "60 Saniyede Pençe" Doğru / Yanlış Hızlı Düello Oyunu (TrueFalseItem Modeli, Kombo Çarpanı, 60sn Sayaç ve TrueFalseBlitzScreen)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA; tüm renkleri Theme.of(context).colorScheme ve yazı stillerini textTheme üzerinden al. Feature-first yapısını (`lib/features/games/...`) kullan.

ADIM 1: `lib/features/games/data/models/true_false_item.dart` (Veri Modeli & Özgün KPSS Havuzu)
1. `lib/features/games/data/models/true_false_item.dart` dosyasını oluştur:
   - `class TrueFalseItem`:
     - `final String id;`
     - `final String lesson;` (`'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`)
     - `final String topic;`
     - `final String statement;` (Doğru veya yanlış olan tek cümlelik KPSS önermesi)
     - `final bool isTrue;`
     - `final String explanation;`
     - `const TrueFalseItem({required this.id, required this.lesson, required this.topic, required this.statement, required this.isTrue, required this.explanation});`
   - Aynı dosyada `const List<TrueFalseItem> sampleTrueFalseItems = [...]` olarak en az 8 özgün KPSS Genel Kültür önermesi tanımla:
     1. Tarih: `'Orhun Yazıtları; Bilge Kağan, Kültigin ve Vezir Tonyukuk adına dikilmiştir.'` (`isTrue: true`)
     2. Tarih: `'Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen kaldırılmıştır.'` (`isTrue: false`, açıklama: `'Boğazlar Komisyonu 1936 Montrö Boğazlar Sözleşmesi ile kaldırılmıştır.'`)
     3. Coğrafya: `'Türkiye\'de bor rezervinin en fazla olduğu bölge Güney Marmara\'dır.'` (`isTrue: true`)
     4. Coğrafya: `'Çoruh Nehri sularını Karadeniz yerine Hazar Denizi\'ne boşaltır.'` (`isTrue: false`, açıklama: `'Çoruh Nehri Gürcistan üzerinden Karadeniz\'e dökülür.'`)
     5. Vatandaşlık: `'1982 Anayasası\'na göre TBMM genel seçimleri 5 yılda bir yapılır.'` (`isTrue: true`)
     6. Vatandaşlık: `'Anayasa Mahkemesi üyelerinin görev süresi 8 yıldır.'` (`isTrue: false`, açıklama: `'Anayasa Mahkemesi üyeleri 12 yıl için seçilir.'`)
     7. Güncel Bilgiler: `'Türkiye\'nin ilk yerli ve milli gözlem uydularından İMECE uzaya fırlatılmıştır.'` (`isTrue: true`)
     8. Tarih: `'Amasya Genelgesi\'nde ilk kez milli egemenliğe dayalı yeni bir devlet kurmaktan bahsedilmiştir.'` (`isTrue: true`)

ADIM 2: `lib/features/games/presentation/true_false_blitz_screen.dart` (`TrueFalseBlitzScreen`)
1. `TrueFalseBlitzScreen extends ConsumerStatefulWidget` oluştur:
   - Parametreler: `final List<TrueFalseItem> items;` (varsayılan `this.items = sampleTrueFalseItems`), `final int initialSeconds;` (varsayılan `60`).
   - Durum alanları (`State`):
     - `late int _remainingSeconds;`, `Timer? _timer;`
     - `int _currentIndex = 0;`, `int _correctCount = 0;`, `int _wrongCount = 0;`
     - `int _combo = 0;`, `int _maxCombo = 0;`, `int _earnedXp = 0;`
     - `bool? _lastAnswerWasCorrect;` (`null`: henüz cevaplanmadı, `true`: doğru bildi, `false`: yanlış bildi)
     - `bool _isFinished = false;`
   - `initState` içinde `_startTimer()` başlat (`Timer.periodic(const Duration(seconds: 1), ...)`). Süre 0 olunca `_finishGame()` çağır. `dispose` içinde `_timer?.cancel()` yap.
   - Kullanıcı `'DOĞRU'` veya `'YANLIŞ'` butonuna bastığında (`_submitChoice(bool userChoice)`):
     - Eğer `_lastAnswerWasCorrect != null` veya `_isFinished` ise işlem yapma.
     - `final isCorrect = userChoice == currentItem.isTrue;`
     - `ref.read(studyStatsProvider.notifier).recordAnswer(lesson: currentItem.lesson, isCorrect: isCorrect);`
     - Doğruysa: `_correctCount++`, `_combo++`, `if (_combo > _maxCombo) _maxCombo = _combo`, `_earnedXp += 10 * _combo;`
     - Yanlışsa: `_wrongCount++`, `_combo = 0;`
     - `_lastAnswerWasCorrect = isCorrect;` olarak güncelle (açıklama kutusu ve `'Sonraki İfade'` butonu görünür).
   - `'Sonraki İfade'` butonuna basıldığında (`_nextItem()`):
     - Son sorudaysa `_finishGame()` çağır, değilse `_currentIndex++` ve `_lastAnswerWasCorrect = null` yap.
   - Ekran tasarımı (`Scaffold`, `AppBar(title: const Text('60 Saniyede Pençe'))`):
     - `_isFinished == true` ise `_BlitzSummaryView` (`StatelessWidget`) göster:
       - `MascotCoachBanner(mood: MascotMood.victory, badgeLabel: 'PENÇE DÜELLOSU BİTTİ', title: 'Düello Tamamlandı!', message: 'Toplam $_earnedXp XP kazandın ve en yüksek ${_maxCombo}x komboya ulaştın!')`,
       - Doğru (`_correctCount`), Yanlış (`_wrongCount`), Maksimum Kombo (`${_maxCombo}x`) ve Kazanılan XP (`+$_earnedXp XP`) `TactileCard` kutuları,
       - `'Tekrar Oyna'` (`FilledButton.icon`) ve `'Ana Sayfaya Dön'` (`OutlinedButton.icon`).
     - `_isFinished == false` ise:
       - Üst bilgi şeridi (`Row`): Solda süre rozeti (`LucideIcons.timer` + `'$_remainingSeconds sn'`), ortada Kombo rozeti (`LucideIcons.zap` + `'${_combo}x Kombo'`), sağda XP rozeti (`'+$_earnedXp XP'`).
       - Ortada `TactileCard` içinde ders/konu rozeti (`'${item.lesson} · ${item.topic}'`), soru sayacı (`'${_currentIndex + 1} / ${widget.items.length}'`) ve büyük önerme metni (`item.statement`).
       - `_lastAnswerWasCorrect != null` ise açıklama kartı (`item.explanation`) ve `'Sonraki İfade'` (`FilledButton`) göster.
       - `_lastAnswerWasCorrect == null` ise altta yan yana (`Row` + `Expanded`) iki büyük buton:
         - Sol: `OutlinedButton.icon(onPressed: () => _submitChoice(false), icon: const Icon(LucideIcons.x), label: const Text('YANLIŞ'))`
         - Sağ: `FilledButton.icon(onPressed: () => _submitChoice(true), icon: const Icon(LucideIcons.check), label: const Text('DOĞRU'))`

ADIM 3: Test ve Doğrulama
1. `test/games_screen_test.dart` dosyasını oluştur ve `TrueFalseBlitzScreen` içinde `'DOĞRU'` / `'YANLIŞ'` seçiminin kombo/XP sayacını ve açıklama kartını çalıştırdığını test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-23: Etkileşimli Oyun Modu 2 — "Kavram Eşleştirme Tahtası" (`ConceptMatchScreen`) & `HomeScreen` Mini Oyun Vitrini

```text
GÖREV: TASK-23 — Quizlet Match Tarzı "Kavram Eşleştirme Tahtası" (ConceptMatchScreen) ve HomeScreen "Etkileşimli Mini Oyunlar" Vitrini
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-22 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `lib/features/games/data/models/concept_match_set.dart` (Eşleştirme Setleri)
1. `lib/features/games/data/models/concept_match_set.dart` dosyasını oluştur:
   - `class ConceptPair`: `final String id;`, `final String leftTerm;`, `final String rightMatch;`
   - `class ConceptMatchSet`: `final String id;`, `final String title;`, `final String lesson;`, `final List<ConceptPair> pairs;`
   - `const List<ConceptMatchSet> sampleConceptMatchSets = [...]` içinde 3 KPSS seti tanımla (her birinde 4 çift):
     1. `'Tarih: Antlaşmalar & Önemi'` (`lesson: 'Tarih'`):
        - `'Lozan Antlaşması'` ↔ `'Kapitülasyonların Kaldırılması'`
        - `'Mondros Ateşkesi'` ↔ `'7. ve 24. Maddelerle İşgal Zeminini Hazırlama'`
        - `'Mudanya Ateşkesi'` ↔ `'Doğu Trakya\'nın Savaşsız Kurtarılması'`
        - `'Gümrü Antlaşması'` ↔ `'TBMM\'nin Uluslararası İlk Siyasi Zaferi'`
     2. `'Coğrafya: Madenler & Merkezler'` (`lesson: 'Coğrafya'`):
        - `'Divriği & Hekimhan'` ↔ `'Demir Çıkarım Alanı'`
        - `'Murgul & Küre'` ↔ `'Bakır Çıkarım Alanı'`
        - `'Seydişehir & Mortaş'` ↔ `'Boksit (Alüminyum) Alanı'`
        - `'Kırka & Emet'` ↔ `'Bor Mineralleri Alanı'`
     3. `'Vatandaşlık: Erkler & Kurumlar'` (`lesson: 'Vatandaşlık'`):
        - `'Yasama Yetkisi'` ↔ `'Türkiye Büyük Millet Meclisi'`
        - `'Yargısal Denetim (Bireysel Başvuru)'` ↔ `'Anayasa Mahkemesi'`
        - `'İdari Yargı En Üst Mercii'` ↔ `'Danıştay'`
        - `'Adli Yargı En Üst Mercii'` ↔ `'Yargıtay'`

ADIM 2: `lib/features/games/presentation/concept_match_screen.dart` (`ConceptMatchScreen`)
1. `ConceptMatchScreen extends ConsumerStatefulWidget` oluştur:
   - `AppBar(title: const Text('Kavram Eşleştir'))`
   - Üstte 3 set arasında geçiş sağlayan yatay `ChoiceChip` şeridi (`sampleConceptMatchSets`),
   - Altında eşleşen çift sayacı (`'${_matchedIds.length} / ${currentSet.pairs.length} Eşleşti'`) ve hamle sayacı (`'Hamle: $_moves'`).
   - Tüm çiftler eşleştiğinde (`_matchedIds.length == currentSet.pairs.length`):
     - `MascotCoachBanner(mood: MascotMood.victory, badgeLabel: 'EŞLEŞTİRME USTASI', title: 'Tüm Kavramlar Eşleşti!', message: 'Tebrikler! $_moves hamlede tabloyu temizledin.')` ve `'Seti Sıfırla'` (`FilledButton.icon`) göster.
   - Eşleşme devam ederken iki sütunlu (`Row` içinde sol `Expanded` Kavramlar, sağ `Expanded` Karşılıklar) 4'e 4 `TactileCard` tahtası göster:
     - Kullanıcı soldan bir `pair.id` (`_selectedLeftId`) ve sağdan bir `pair.id` (`_selectedRightId`) seçtiğinde:
       - Eşleşiyorsa (`_selectedLeftId == _selectedRightId`): `_matchedIds.add(id)` yap, `ref.read(studyStatsProvider.notifier).recordAnswer(lesson: currentSet.lesson, isCorrect: true)` çağır ve seçimleri temizle.
       - Eşleşmiyorsa: Seçimleri temizle ve kısa bir `SnackBar` (`'Eşleşme yanlış, tekrar dene!'`, `duration: const Duration(milliseconds: 600)`) göster.

ADIM 3: `HomeScreen` ve `router.dart` Entegrasyonu
1. `lib/features/home/presentation/home_screen.dart` içinde `'Çalışma türleri'` 2x2 Bento Grid'inin hemen altına:
   - `const SizedBox(height: 16),`
   - `const SectionTitle('Etkileşimli Mini Oyunlar'),`
   - Yan yana (`Row` + `Expanded`) iki yeni `_StudyTypeTile` ekle:
     1. `title: '60 Saniyede Pençe'`, `description: 'Doğru / Yanlış hızlı düello ile kombo yap.'`, `badgeText: 'Kombo XP'`, `actionText: 'Düelloya Gir'`, `icon: LucideIcons.zap`, `accentColor: colorScheme.tertiary`, `accentContainerColor: colorScheme.tertiaryContainer`, `onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TrueFalseBlitzScreen()))`
     2. `title: 'Kavram Eşleştir'`, `description: 'Tarih, Coğrafya ve Vatandaşlık kavramlarını eşleştir.'`, `badgeText: 'Hafıza Oyunu'`, `actionText: 'Eşleştir'`, `icon: LucideIcons.puzzle`, `accentColor: colorScheme.primary`, `accentContainerColor: colorScheme.primaryContainer`, `onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ConceptMatchScreen()))`
2. `lib/app/router.dart` içine `/true-false` (`TrueFalseBlitzScreen`) ve `/concept-match` (`ConceptMatchScreen`) rotalarını ekle.

ADIM 4: Test ve Doğrulama
1. `test/games_screen_test.dart` içine `ConceptMatchScreen` eşleştirme testini ve `HomeScreen` üzerinden `'60 Saniyede Pençe'` / `'Kavram Eşleştir'` kartlarının göründüğünü doğrulayan testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-24: Güçlü Raporlama & Retention — Çözülen Testler Arşivi (`QuizSessionRecord`), Konu Ustalık Isı Haritası (`Mastery Heatmap`), Süre Analizi & XP/Lig Sistemi

```text
GÖREV: TASK-24 — Çözülen Testler Arşivi (QuizSessionRecord & QuizHistoryScreen), Konu Ustalık Isı Haritası (Mastery Heatmap), Soru Süre Analizi ve XP/Lig Sistemi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-23 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `lib/features/stats/data/models/quiz_session_record.dart` (Supabase `quiz_sessions` Uyumlu Model)
1. `lib/features/stats/data/models/quiz_session_record.dart` dosyasını oluştur:
   ```dart
   class QuizSessionRecord {
     final String id;
     final String title;
     final String lesson;
     final int totalQuestions;
     final int correctCount;
     final int wrongCount;
     final int emptyCount;
     final double netScore;
     final int earnedXp;
     final int durationSeconds;
     final DateTime completedAt;

     const QuizSessionRecord({
       required this.id,
       required this.title,
       required this.lesson,
       required this.totalQuestions,
       required this.correctCount,
       required this.wrongCount,
       required this.emptyCount,
       required this.netScore,
       required this.earnedXp,
       required this.durationSeconds,
       required this.completedAt,
     });
   }
   ```

ADIM 2: `StudyStatsState` ve `StudyStatsNotifier` (`lib/features/stats/data/study_stats_notifier.dart`) Analitik & XP/Lig Genişletmesi
1. `StudyStatsState` içine mevcut tüm alanları ve metotları BİREBİR koruyarak şu yeni alanları ekle:
   - `final int totalXp;` (varsayılan `0`)
   - `final int streakDays;` (varsayılan `1`)
   - `final int totalTimeSeconds;` (varsayılan `0`)
   - `final List<QuizSessionRecord> sessionHistory;` (varsayılan `const []`)
   - Yeni yardımcı getter'lar ekle:
     - `String get leagueTier`: `if (totalXp >= 1000) return 'Müsteşar Ligi'; if (totalXp >= 500) return 'Altın Kadro'; if (totalXp >= 200) return 'Gümüş Kadro'; return 'Bronz Kadro';`
     - `int get averageSecondsPerQuestion => totalSolved == 0 ? 0 : (totalTimeSeconds / totalSolved).round();`
     - `String lessonMasteryLabel(String lesson)`: İlgili derste çözülen soru `0` ise `'Başlanmadı'`, `lessonAccuracyPercent(lesson) >= 80` ise `'Usta (%${lessonAccuracyPercent(lesson)})'`, `>= 50` ise `'Gelişiyor (%${lessonAccuracyPercent(lesson)})'`, `< 50` ise `'Kritik (%${lessonAccuracyPercent(lesson)})'`.
2. `StudyStatsNotifier`:
   - `recordAnswer({required String lesson, required bool isCorrect, int timeSpentSeconds = 20})` metodunda:
     - Mevcut sayaçların yanında doğruysa `totalXp + 15`, yanlışsa `totalXp + 5` ekle ve `totalTimeSeconds + timeSpentSeconds` artır. (Varsayılan `timeSpentSeconds = 20` olduğu için mevcut tüm `recordAnswer(lesson: ..., isCorrect: ...)` çağrıları hiçbir değişiklik gerektirmeden çalışmaya devam eder!).
   - Yeni metot ekle:
     ```dart
     void recordQuizSession(QuizSessionRecord session) {
       state = state.copyWith(
         totalXp: state.totalXp + session.earnedXp,
         sessionHistory: [session, ...state.sessionHistory],
       );
     }
     ```
3. `lib/features/quiz/presentation/quiz_screen.dart` içinde test bittiğinde (`_finishQuiz` içinde `QuizResult` oluşturulduktan hemen sonra) `ref.read(studyStatsProvider.notifier).recordQuizSession(...)` çağırarak tamamlanan testi otomatik olarak `sessionHistory` arşivine kaydet!

ADIM 3: `StatsScreen` (`lib/features/stats/presentation/stats_screen.dart`) & `QuizHistoryScreen` (`lib/features/stats/presentation/quiz_history_screen.dart`)
1. `lib/features/stats/presentation/quiz_history_screen.dart` (`QuizHistoryScreen extends ConsumerWidget`) oluştur:
   - Kullanıcının çözdüğü tüm test oturumlarını (`stats.sessionHistory`) `TactileCard` kartlarıyla listeler (Test başlığı, Doğru/Yanlış/Boş, `Net: ${s.netScore.toStringAsFixed(2)}`, `+${s.earnedXp} XP`, süre). Boşsa `'Henüz tamamlanmış bir test oturumu yok.'` gösterir.
2. `lib/features/stats/presentation/stats_screen.dart` içine (mevcut `'Çözülen soru'`, `'Doğru oranı'`, `'En zayıf ders'` KPI kartlarını ve `_LessonAccuracyChartCard` `BarChart` bileşenini BİREBİR koruyarak!):
   - En üste (`PageHeader` hemen altına) **`_LeagueAndStreakCard(stats: stats)`** ekle:
     - Solda `LucideIcons.trophy` + Lig adı (`stats.leagueTier`, örn. `'Bronz Kadro'`) ve `'${stats.totalXp} XP'`,
     - Sağda `'${stats.streakDays} Gün Seri'` (`LucideIcons.flame`) ve `'Ort. ${stats.averageSecondsPerQuestion} sn/soru'` rozeti.
   - `_LessonAccuracyChartCard` altına **`_MasteryHeatmapCard(stats: stats)`** ekle:
     - Başlık: `'Ders Ustalık Isı Haritası'`
     - 4 ders (`TAR`, `COĞ`, `VAT`, `GÜN` — DİKKAT: `test/study_stats_test.dart` içindeki `find.text('Tarih')` tekil beklentisini bozmamak için burada da `'TAR · Tarih'` veya kısa kod + `stats.lessonMasteryLabel(...)` kullan!) için ustalık durumunu (`Usta`, `Gelişiyor`, `Kritik`, `Başlanmadı`) renkli rozetlerle göster.
   - En alta **`_RecentSessionsCard(stats: stats)`** ekle:
     - Başlık: `'Çözülen Testler Arşivi (${stats.sessionHistory.length})'` ve sağda `'Tümünü Gör'` (`QuizHistoryScreen` açar). Son 3 testi listeler.

ADIM 4: Test ve Doğrulama
1. `test/study_stats_test.dart` içine XP, Lig (`leagueTier`), Ustalık Isı Haritası (`'Ders Ustalık Isı Haritası'`) ve `recordQuizSession` ile `'Çözülen Testler Arşivi'` testlerini ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## ☁️ 9. Dalga 9: Doğrudan Supabase (`supabase_flutter`) Auth, Bulut Soru Havuzu & Analitik Raporlama Entegrasyonu (`TASK-25`, `TASK-26`, `TASK-27`)

[docs/supabase_schema.sql](file:///d:/projelerim/gunisigi/docs/supabase_schema.sql) ile oluşturduğumuz Supabase PostgreSQL tablolarını (`profiles`, `questions`, `quiz_sessions`, `question_attempt_logs`, `user_topic_mastery`, `study_tasks`) doğrudan Flutter uygulamasına bağlayan 3 görev:

---

### 📦 TASK-25: Supabase Kurulumu (`supabase_flutter`), `SupabaseConfig` & Giriş / Kayıt Ekranı (`AuthScreen`)

```text
GÖREV: TASK-25 — supabase_flutter Kurulumu, SupabaseConfig, AuthNotifier ve Giriş / Kayıt Ekranı (AuthScreen)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Paketi `flutter pub add supabase_flutter` ile ekle. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-24 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `supabase_flutter` Kurulumu ve `lib/core/config/supabase_config.dart`
1. Terminalden `flutter pub add supabase_flutter` komutunu çalıştır.
2. `lib/core/config/supabase_config.dart` dosyasını oluştur:
   ```dart
   import 'dart:io' show Platform;
   import 'package:flutter/foundation.dart' show kIsWeb;
   import 'package:supabase_flutter/supabase_flutter.dart';

   /// Supabase proje bağlantı yapılandırması.
   class SupabaseConfig {
     SupabaseConfig._();

     static const String url = String.fromEnvironment(
       'SUPABASE_URL',
       defaultValue: 'https://axfxciyuvcdbavhzsfwu.supabase.co',
     );

     static const String anonKey = String.fromEnvironment(
       'SUPABASE_ANON_KEY',
       defaultValue:
           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZnhjaXl1dmNkYmF2aHpzZnd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTM1NjU4NTcsImV4cCI6MjEwOTE0MTg1N30.irV-ZOP2Ii1Y8k0ksC-KOF7D811avX6GXRbsxvMC78M',
     );

     static bool _initialized = false;

     static bool get _isFlutterTest =>
         !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');

     /// URL ve Anon Key tanımlıysa ve Supabase başarıyla başlatıldıysa true döner.
     static bool get isReady =>
         !_isFlutterTest &&
         _initialized &&
         url.isNotEmpty &&
         anonKey.isNotEmpty;

     /// Uygulama açılışında (`main.dart`) güvenli şekilde Supabase'i başlatır.
     /// Test ortamında hata fırlatmadan yerel modda devam eder.
     static Future<void> initializeSafely() async {
       if (_isFlutterTest || url.isEmpty || anonKey.isEmpty || _initialized) {
         return;
       }
       try {
         await Supabase.initialize(url: url, anonKey: anonKey);
         _initialized = true;
       } catch (_) {
         _initialized = false;
       }
     }

     /// Güvenli SupabaseClient erişimi (hazır değilse null döner).
     static SupabaseClient? get clientOrNull =>
         isReady ? Supabase.instance.client : null;
   }
   ```
3. `lib/main.dart` içinde `main()` fonksiyonunu `Future<void> main() async` yap:
   - `WidgetsFlutterBinding.ensureInitialized();`
   - `await SupabaseConfig.initializeSafely();`
   - `runApp(const ProviderScope(child: MyApp()));`

ADIM 2: `lib/features/auth/data/auth_notifier.dart` (Kullanıcı Oturum & Profil Yönetimi)
1. `lib/features/auth/data/auth_notifier.dart` dosyasını oluştur:
   - `class AuthUserState`:
     - `final bool isAuthenticated;`
     - `final String? userId;`
     - `final String? email;`
     - `final String displayName;`
     - `final bool isLoading;`
     - `final String? errorMessage;`
     - `const AuthUserState({this.isAuthenticated = false, this.userId, this.email, this.displayName = 'Memur Adayı', this.isLoading = false, this.errorMessage});`
     - `copyWith(...)`
   - `class AuthNotifier extends Notifier<AuthUserState>`:
     - `build()` içinde `SupabaseConfig.clientOrNull?.auth.currentUser` kontrolü yap; oturum açıksa `isAuthenticated: true`, `userId: user.id`, `email: user.email`, `displayName: user.userMetadata?['display_name'] ?? 'Memur Adayı'` döndür.
     - `Future<bool> signIn({required String email, required String password})`:
       - `SupabaseConfig.clientOrNull` null ise (yerel/demo modda veya testte): `email.trim().isNotEmpty && password.length >= 6` ise demo oturumu aç (`isAuthenticated: true, email: email.trim(), displayName: email.split('@').first`) ve `true` döndür.
       - Supabase aktifse: `client.auth.signInWithPassword(email: email.trim(), password: password)` çağır, başarılıysa state'i güncelle ve `true` döndür; hata olursa `try/catch` içinde `errorMessage` güncelle ve `false` döndür.
     - `Future<bool> signUp({required String email, required String password, required String displayName})`:
       - Supabase aktifse `client.auth.signUp(email: email.trim(), password: password, data: {'display_name': displayName.trim()})` çağır; yerel/demo moddaysa doğrudan `isAuthenticated: true, email: email.trim(), displayName: displayName.trim()` yap.
     - `Future<void> signOut()`:
       - `await SupabaseConfig.clientOrNull?.auth.signOut();` ve `state = const AuthUserState();`
   - `final authProvider = NotifierProvider<AuthNotifier, AuthUserState>(AuthNotifier.new);`

ADIM 3: `lib/features/auth/presentation/auth_screen.dart` (`AuthScreen`) & `ProfileScreen` / `router.dart` Entegrasyonu
1. `lib/features/auth/presentation/auth_screen.dart` (`AuthScreen extends ConsumerStatefulWidget`) oluştur:
   - `AppBar(title: const Text('Giriş Yap / Kayıt Ol'))`
   - Üstte `MascotCoachBanner(mood: MascotMood.coach, badgeLabel: 'BULUT HESABI', title: _isLogin ? 'Tekrar Hoş Geldin!' : 'Kadro Ailesine Katıl!', message: 'Çözdüğün tüm testler, doğru/yanlış analizlerin ve çalışma planın hesabında güvenle saklanır.')`
   - Altında `TactileCard` içinde:
     - Kayıt modundaysa (`!_isLogin`) `'Ad Soyad / Rumuz'` `TextField` (`_nameController`),
     - `'E-posta Adresi'` `TextField` (`_emailController`),
     - `'Şifre (En az 6 karakter)'` `TextField` (`_passwordController`, `obscureText: true`),
     - Hata mesajı varsa (`authState.errorMessage != null`) hata metni,
     - Ana aksiyon butonu (`FilledButton.icon`): `_isLogin ? 'Giriş Yap' : 'Hesap Oluştur'`,
     - Mod değiştirme butonu (`TextButton`): `_isLogin ? 'Hesabın yok mu? Kayıt Ol' : 'Zaten hesabın var mı? Giriş Yap'`.
   - Giriş veya kayıt başarılı olduğunda `if (mounted) Navigator.of(context).pop();`
2. `lib/features/profile/presentation/profile_screen.dart` içinde:
   - En üste (`PageHeader` altına) `_AccountCard` ekle:
     - Kullanıcı giriş yapmamışsa (`!auth.isAuthenticated`): `'İlerlemeni Buluta Kaydet'` başlığı, `'Çözdüğün testleri ve doğru/yanlışlarını kaybetmemek için giriş yap.'` açıklaması ve `'Giriş Yap / Kayıt Ol'` (`FilledButton.tonal` -> `AuthScreen` açar) butonu.
     - Giriş yapmışsa (`auth.isAuthenticated`): Kullanıcının `auth.displayName` ve `auth.email` bilgisi + `'Çıkış Yap'` (`TextButton` -> `ref.read(authProvider.notifier).signOut()`) butonu.
3. `lib/app/router.dart` içine `/auth` (`AuthScreen`) rotasını ekle.

ADIM 4: Test ve Doğrulama
1. `test/auth_screen_test.dart` dosyasını oluştur:
   - `ProfileScreen` üzerinden `'Giriş Yap / Kayıt Ol'` butonuna tıklanınca `AuthScreen` ekranının açıldığını,
   - E-posta ve şifre girilip `'Giriş Yap'` butonuna basıldığında `authProvider` üzerinde `isAuthenticated == true` olduğunu doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-26: Bulut Soru & Oyun Havuzu Entegrasyonu (`QuestionRepository` + Ders/Konu Filtreleme + Offline Fallback)

```text
GÖREV: TASK-26 — QuestionRepository Supabase (`public.questions`) Entegrasyonu, Ders/Konu Bazlı Soru Filtreleme ve Zengin Yerel Yedek Havuz
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Widget içinde doğrudan Supabase/API çağrısı YAPMA; tüm veri çekme işlemleri `QuestionRepository` içinde `try/catch` ile yapılmalıdır. TASK-25 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `assets/data/questions/sample_questions.json` Zenginleştirmesi (4 Ders İçin Tam Kapsam)
1. `assets/data/questions/sample_questions.json` dosyasına mevcut 5 Tarih sorusuna ek olarak Coğrafya (en az 3 soru), Vatandaşlık (en az 3 soru) ve Güncel Bilgiler (en az 3 soru) özgün KPSS sorularını ekle (böylece hem yerel yedekte hem testlerde 4 dersin tamamında sorular hazır olsun!).

ADIM 2: `lib/features/quiz/data/question_repository.dart` — Supabase + Yerel Fallback & Ders/Konu Filtreleme
1. `QuestionRepository` sınıfına yeni metotlar ekle (mevcut `Future<List<Question>> loadSampleQuestions()` imzasını BİREBİR koru ki mevcut tüm testler geçsin!):
   - `Future<List<Question>> fetchQuestions({String? lesson, String? topic})`:
     1. Önce `SupabaseConfig.clientOrNull` kontrol et:
        - Eğer `client != null` ise `try` bloğu içinde `public.questions` tablosundan `question_type = 'multiple_choice'` olan kayıtları sorgula (`lesson` verilmişse `.eq('lesson', lesson)`, `topic` verilmişse `.eq('topic', topic)`).
        - Dönen satırlardaki `interaction_data` JSONB içinden `options` ve `correctIndex` alanlarını okuyup `Question` nesnelerine dönüştür; eğer sonuç listesi boş değilse döndür!
     2. Eğer Supabase aktif değilse, hata verirse veya ilgili derste bulutta henüz soru yoksa:
        - `final localQuestions = await loadSampleQuestions();`
        - Eğer `lesson != null` ise `localQuestions.where((q) => q.lesson == lesson).toList()` filtrele (eğer konu filtrelemesi boş dönerse dersin sorularını, o da boşsa tüm `localQuestions` listesini döndür ki ekran asla boş kalmasın!).
2. `lib/features/lessons/presentation/lesson_topics_screen.dart` içinde bir konuya tıklandığında açılan `QuizScreen`'e seçilen dersin ve konunun adını geçir (`QuizScreen(lessonFilter: lesson.name, topicFilter: topic, customTitle: '${lesson.name} · $topic')`):
   - `QuizScreen` (`lib/features/quiz/presentation/quiz_screen.dart`) içine opsiyonel `final String? lessonFilter;` ve `final String? topicFilter;` parametreleri ekle; dışarıdan `questions` verilmediğinde `questionRepository.fetchQuestions(lesson: widget.lessonFilter, topic: widget.topicFilter)` çağır!

ADIM 3: Test ve Doğrulama
1. `test/question_repository_test.dart` içine `fetchQuestions(lesson: 'Coğrafya')` çağrıldığında yalnızca `'Coğrafya'` dersine ait soruların döndüğünü doğrulayan birim testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-27: Bulut Raporlama & İlerleme Senkronizasyonu (`CloudSyncRepository` — `quiz_sessions`, `question_attempt_logs`, `user_topic_mastery`)

```text
GÖREV: TASK-27 — Çözülen Testlerin, Soru Bazlı Doğru/Yanlış Loglarının ve Konu Ustalık Verilerinin Supabase Tablolarına Kaydedilmesi ve Buluttan Yüklenmesi (CloudSyncRepository)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Tüm Supabase yazma/okuma işlemlerini `lib/features/stats/data/cloud_sync_repository.dart` içinde `try/catch` ile sar. TASK-26 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `lib/features/stats/data/cloud_sync_repository.dart` (`CloudSyncRepository`)
1. `lib/features/stats/data/cloud_sync_repository.dart` dosyasını oluştur:
   - `class CloudSyncRepository`:
     - `const CloudSyncRepository();`
     - **1. Test Oturumu Kaydetme (`saveQuizSession`):**
       ```dart
       Future<void> saveQuizSession(QuizSessionRecord session) async {
         final client = SupabaseConfig.clientOrNull;
         final userId = client?.auth.currentUser?.id;
         if (client == null || userId == null) return;
         try {
           await client.from('quiz_sessions').insert({
             'user_id': userId,
             'session_title': session.title,
             'session_mode': 'topic_quiz',
             'lesson': session.lesson,
             'total_questions': session.totalQuestions,
             'correct_count': session.correctCount,
             'wrong_count': session.wrongCount,
             'empty_count': session.emptyCount,
             'net_score': session.netScore,
             'earned_xp': session.earnedXp,
             'duration_seconds': session.durationSeconds,
             'completed_at': session.completedAt.toIso8601String(),
           });
         } catch (e) {
           debugPrint('Supabase saveQuizSession hatası: $e');
         }
       }
       ```
     - **2. Soru Bazlı Cevap & Süre Logu Kaydetme (`saveQuestionAttempt`):**
       ```dart
       Future<void> saveQuestionAttempt({
         required String questionText,
         required String lesson,
         required String topic,
         required bool isCorrect,
         required int timeSpentSeconds,
       }) async {
         final client = SupabaseConfig.clientOrNull;
         final userId = client?.auth.currentUser?.id;
         if (client == null || userId == null) return;
         try {
           await client.from('question_attempt_logs').insert({
             'user_id': userId,
             'question_text': questionText,
             'lesson': lesson,
             'topic': topic,
             'is_correct': isCorrect,
             'time_spent_seconds': timeSpentSeconds,
           });
         } catch (e) {
           debugPrint('Supabase saveQuestionAttempt hatası: $e');
         }
       }
       ```
     - **3. Kullanıcı Profil XP & Lig Güncelleme (`syncProfileStats`):**
       - `public.profiles` tablosunda giriş yapmış kullanıcının `total_xp`, `league_tier`, `daily_goal_questions` ve `last_study_date` alanlarını `upsert` / `update` eder.
     - **4. Buluttan Geçmiş Testleri Çekme (`fetchSessionHistory`):**
       - Giriş yapmış kullanıcının `public.quiz_sessions` tablosundaki kayıtlarını `.order('completed_at', ascending: false).limit(50)` ile çekip `List<QuizSessionRecord>` olarak döndürür (`try/catch` içinde, hata veya oturum yoksa `[]` döner).

ADIM 2: `StudyStatsNotifier` ve `AuthNotifier` ile Bulut Senkronizasyonu
1. `StudyStatsNotifier` (`lib/features/stats/data/study_stats_notifier.dart`) içine `final CloudSyncRepository _cloudSync = const CloudSyncRepository();` ekle:
   - `recordAnswer(...)` çağrıldığında arka planda `_cloudSync.saveQuestionAttempt(...)` ve `_cloudSync.syncProfileStats(...)` tetikle.
   - `recordQuizSession(QuizSessionRecord session)` çağrıldığında arka planda `_cloudSync.saveQuizSession(session)` tetikle.
   - `Future<void> loadFromCloud()` metodu ekle: `_cloudSync.fetchSessionHistory()` ile gelen geçmiş oturumları `sessionHistory` içine yükler.
2. `AuthNotifier` içinde kullanıcı `signIn` olduğunda `ref.read(studyStatsProvider.notifier).loadFromCloud()` çağır.

ADIM 3: Test ve Doğrulama
1. `test/cloud_sync_test.dart` dosyasını oluştur:
   - Supabase başlatılmamışken (`SupabaseConfig.isReady == false`) `CloudSyncRepository` metotlarının (`saveQuizSession`, `saveQuestionAttempt`, `fetchSessionHistory`) hiçbir hata fırlatmadan güvenli şekilde çalıştığını (offline-safe) doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 🚀 10. Dalga 10: Tam Bulut Senkronizasyonu (`study_tasks` & `user_topic_mastery`), Bulut Destekli Mini Oyunlar, Test Detay Karnesi & 3 Adımlı KPSS Hedef Sihirbazı (`TASK-28`, `TASK-29`, `TASK-30`)

---

### 📦 TASK-28: Çalışma Planlayıcı (`public.study_tasks`) & Konu Ustalık Matrisi (`public.user_topic_mastery`) Bulut Senkronizasyonu

```text
GÖREV: TASK-28 — Çalışma Planlayıcı (public.study_tasks) ve Konu Ustalık Matrisi (public.user_topic_mastery) Tablolarının Supabase ile Tam Senkronizasyonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. Tüm Supabase işlemlerini `CloudSyncRepository` içinde `try/catch` ile sar. TASK-27 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `StudyTask` (`lib/features/planner/data/models/study_task.dart`) JSON / Supabase Serileştirmesi
1. `lib/features/planner/data/models/study_task.dart` dosyasındaki `StudyTask` sınıfına mevcut alanları ve `copyWith` metodunu BİREBİR koruyarak şu iki metodu ekle:
   - `Map<String, dynamic> toMap(String userId)`:
     ```dart
     Map<String, dynamic> toMap(String userId) {
       return {
         'user_id': userId,
         'title': title,
         'lesson_tag': lessonTag,
         'estimated_minutes': estimatedMinutes,
         'action_type': actionType.name,
         'is_completed': isCompleted,
       };
     }
     ```
   - `factory StudyTask.fromMap(Map<String, dynamic> map)`:
     ```dart
     factory StudyTask.fromMap(Map<String, dynamic> map) {
       final actionName = (map['action_type'] as String?) ?? 'custom';
       final actionType = StudyTaskActionType.values.firstWhere(
         (e) => e.name == actionName,
         orElse: () => StudyTaskActionType.custom,
       );
       return StudyTask(
         id: (map['id'] ?? '').toString(),
         title: (map['title'] as String?) ?? '',
         lessonTag: (map['lesson_tag'] as String?) ?? 'Genel',
         estimatedMinutes: (map['estimated_minutes'] as num?)?.toInt() ?? 25,
         actionType: actionType,
         isCompleted: (map['is_completed'] as bool?) ?? false,
       );
     }
     ```

ADIM 2: `CloudSyncRepository` (`lib/features/stats/data/cloud_sync_repository.dart`) Genişletmesi
1. `lib/features/stats/data/cloud_sync_repository.dart` içine `StudyTask` import'unu ekle ve şu 5 yeni metodu ekle:
   - `Future<List<StudyTask>> fetchStudyTasks()`:
     - `SupabaseConfig.clientOrNull` veya `currentUser?.id` null ise `const []` döner.
     - Aktifse `client.from('study_tasks').select().eq('user_id', userId).order('created_at', ascending: true)` sorgusunu çalıştırıp `StudyTask.fromMap` ile listeye çevirir (`try/catch` içinde).
   - `Future<void> insertStudyTask(StudyTask task)`:
     - `client == null || userId == null` ise çıkar; aktifse `client.from('study_tasks').insert(task.toMap(userId))` çağırır.
   - `Future<void> updateStudyTaskCompletion({required String title, required bool isCompleted})`:
     - `client == null || userId == null` ise çıkar; aktifse `client.from('study_tasks').update({'is_completed': isCompleted}).eq('user_id', userId).eq('title', title)` çağırır.
   - `Future<void> deleteStudyTaskByTitle(String title)`:
     - `client == null || userId == null` ise çıkar; aktifse `client.from('study_tasks').delete().eq('user_id', userId).eq('title', title)` çağırır.
   - `Future<void> upsertTopicMastery({required String lesson, required String topic, required int totalSolved, required int totalCorrect, required int totalTimeSeconds})`:
     - `client == null || userId == null` ise çıkar; aktifse `masteryPercent = totalSolved == 0 ? 0 : ((totalCorrect / totalSolved) * 100).round()` hesaplayıp `client.from('user_topic_mastery').upsert({'user_id': userId, 'lesson': lesson, 'topic': topic, 'total_solved': totalSolved, 'total_correct': totalCorrect, 'total_time_seconds': totalTimeSeconds, 'mastery_percent': masteryPercent, 'last_studied_at': DateTime.now().toIso8601String()}, onConflict: 'user_id,lesson,topic')` çağırır (`try/catch` içinde).

ADIM 3: `StudyPlannerNotifier` ve `StudyStatsNotifier` Bulut Bağlantısı
1. `lib/features/planner/data/study_planner_notifier.dart` içine `final CloudSyncRepository _cloudSync = const CloudSyncRepository();` ekle:
   - `addTask(...)` içinde yeni görev eklendikten sonra `unawaited(_cloudSync.insertStudyTask(newTask));` çağır.
   - `toggleTask(String id)` içinde durumu değişen görevin başlığı ve yeni `isCompleted` değeriyle `unawaited(_cloudSync.updateStudyTaskCompletion(title: updatedTask.title, isCompleted: updatedTask.isCompleted));` çağır.
   - `removeTask(String id)` içinde silinen görev için `unawaited(_cloudSync.deleteStudyTaskByTitle(removedTask.title));` çağır.
   - `Future<void> loadTasksFromCloud()` metodu ekle: `final remoteTasks = await _cloudSync.fetchStudyTasks(); if (remoteTasks.isNotEmpty) { state = state.copyWith(tasks: remoteTasks); }`
2. `lib/features/auth/data/auth_notifier.dart` içinde `signIn` ve `signUp` başarılı olduğunda `unawaited(ref.read(studyPlannerProvider.notifier).loadTasksFromCloud());` çağır.
3. `lib/features/stats/data/study_stats_notifier.dart` içinde `recordAnswer(...)` çağrıldığında `unawaited(_cloudSync.upsertTopicMastery(lesson: lesson, topic: topic.isEmpty ? 'Genel' : topic, totalSolved: newLessonSolved[lesson] ?? 1, totalCorrect: newLessonCorrect[lesson] ?? 0, totalTimeSeconds: newTotalTimeSeconds));` çağır.

ADIM 4: Test ve Doğrulama
1. `test/cloud_sync_test.dart` içine:
   - `StudyTask.toMap` ve `StudyTask.fromMap` serileştirme doğrulamasını,
   - `fetchStudyTasks`, `insertStudyTask`, `updateStudyTaskCompletion`, `deleteStudyTaskByTitle` ve `upsertTopicMastery` metotlarının offline/test modunda (`SupabaseConfig.isReady == false`) hata fırlatmadan çalıştığını doğrulayan testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-29: Bulut Destekli Mini Oyunlar (`TrueFalseBlitz` & `ConceptMatch` Supabase) + Test Oturumu Detay Ekranı (`QuizSessionDetailScreen`)

```text
GÖREV: TASK-29 — Mini Oyunların Supabase `public.questions` Tablosundan Beslenmesi, Oyun Sonuçlarının Arşive Kaydedilmesi ve Test Oturumu Detay Ekranı (QuizSessionDetailScreen)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-28 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `QuestionRepository` (`lib/features/quiz/data/question_repository.dart`) Mini Oyun Sorguları
1. `lib/features/quiz/data/question_repository.dart` içine `TrueFalseItem` ve `ConceptMatchSet` import'larını ekle ve şu iki metodu ekle:
   - `Future<List<TrueFalseItem>> fetchTrueFalseItems({String? lesson})`:
     - `SupabaseConfig.clientOrNull` aktifse `public.questions` tablosundan `question_type = 'true_false'` olan kayıtları sorgula (`lesson` verilmişse `.eq('lesson', lesson)`).
     - Dönen kayıtları `TrueFalseItem(id: row['id'].toString(), lesson: row['lesson'], topic: row['topic'], statement: row['prompt_text'], isTrue: (row['interaction_data']?['isTrue'] as bool?) ?? true, explanation: row['explanation'])` olarak dönüştür.
     - Buluttan gelen liste ile `sampleTrueFalseItems` listesini birleştir (veya bulut boşsa/offline ise doğrudan `sampleTrueFalseItems` döndür) ki her zaman en az 8 önerme hazır olsun.
   - `Future<List<ConceptMatchSet>> fetchConceptMatchSets()`:
     - `SupabaseConfig.clientOrNull` aktifse `public.questions` tablosundan `question_type = 'matching'` olan kayıtları sorgula.
     - Dönen her satırdaki `interaction_data['pairs']` dizisini `List<ConceptPair>` nesnelerine dönüştürüp `ConceptMatchSet` oluştur; mevcut `sampleConceptMatchSets` ile birleştir (aynı başlık varsa tekilleştir) ve döndür; hata veya offline durumda `sampleConceptMatchSets` döndür.

ADIM 2: Mini Oyun Sonuçlarının `QuizSessionRecord` Arşivine Kaydedilmesi
1. `lib/features/games/presentation/true_false_blitz_screen.dart` içinde `_finishGame()` çağrıldığında (eğer `_correctCount + _wrongCount > 0` ise):
   - `final net = _correctCount - (_wrongCount / 4.0);`
   - `ref.read(studyStatsProvider.notifier).recordQuizSession(QuizSessionRecord(id: DateTime.now().microsecondsSinceEpoch.toString(), title: '60 Saniyede Pençe Düellosu', lesson: 'Genel Kültür', totalQuestions: _correctCount + _wrongCount, correctCount: _correctCount, wrongCount: _wrongCount, emptyCount: 0, netScore: net, earnedXp: _earnedXp, durationSeconds: widget.initialSeconds - _remainingSeconds, completedAt: DateTime.now()));` çağır.
2. `lib/features/games/presentation/concept_match_screen.dart` içinde bir setin tüm çiftleri eşleştiğinde (`_matchedIds.length == currentSet.pairs.length`):
   - `ref.read(studyStatsProvider.notifier).recordQuizSession(QuizSessionRecord(id: DateTime.now().microsecondsSinceEpoch.toString(), title: 'Kavram Eşleştir · ${currentSet.title}', lesson: currentSet.lesson, totalQuestions: currentSet.pairs.length, correctCount: currentSet.pairs.length, wrongCount: 0, emptyCount: 0, netScore: currentSet.pairs.length.toDouble(), earnedXp: 40, durationSeconds: _moves * 4, completedAt: DateTime.now()));` çağır.

ADIM 3: `lib/features/stats/presentation/quiz_session_detail_screen.dart` (`QuizSessionDetailScreen`)
1. `lib/features/stats/presentation/quiz_session_detail_screen.dart` (`QuizSessionDetailScreen extends StatelessWidget`) oluştur:
   - Parametre: `final QuizSessionRecord session;`
   - `AppBar(title: const Text('Test Oturumu Detayı'))`
   - Gövde (`ListView`):
     - `MascotCoachBanner`: Başarı oranına göre (`accuracy >= 75 ? MascotMood.victory : MascotMood.coach`), `badgeLabel: session.lesson.toUpperCase()`, `title: session.title`, `message: 'Bu oturumda ${session.totalQuestions} soruda ${session.netScore.toStringAsFixed(2)} net ve +${session.earnedXp} XP elde ettin.'`
     - `TactileCard` içinde detaylı metrik ızgarası:
       - Doğru (`session.correctCount`), Yanlış (`session.wrongCount`), Boş (`session.emptyCount`),
       - Net Puan (`session.netScore.toStringAsFixed(2)`), Başarı Oranı (`%$accuracy`),
       - Toplam Süre (`${session.durationSeconds ~/ 60} dk ${session.durationSeconds % 60} sn`) ve Soru Başına Ortalama Süre (`$avgSeconds sn/soru`).
     - Altta `'Aynı Dersten Yeni Test Çöz'` (`FilledButton.icon`, `LucideIcons.play`) butonu: Tıklandığında `Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => QuizScreen(lessonFilter: session.lesson == 'Genel Kültür' ? null : session.lesson, customTitle: '${session.lesson} Tekrar Testi')))` açar.
2. `lib/features/stats/presentation/quiz_history_screen.dart` ve `lib/features/stats/presentation/stats_screen.dart` (`_RecentSessionsCard`) içindeki oturum kartlarına tıklandığında `QuizSessionDetailScreen(session: session)` ekranını aç!

ADIM 4: Test ve Doğrulama
1. `test/study_stats_test.dart` veya `test/games_screen_test.dart` içine `QuizHistoryScreen` üzerinde bir test kaydına tıklanınca `'Test Oturumu Detayı'` (`QuizSessionDetailScreen`) ekranının açıldığını doğrulayan widget testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-30: 3 Adımlı Kişiselleştirilmiş KPSS Hedef Sihirbazı (`OnboardingScreen`) & Odak Ders Koçluğu

```text
GÖREV: TASK-30 — 3 Adımlı Kişiselleştirilmiş KPSS Hedef Sihirbazı (OnboardingScreen), Hedef Puan / Odak Ders Tercihleri ve Otomatik Çalışma Görevi Ataması
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-29 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `UserPreferencesState` ve `UserPreferencesNotifier` (`lib/features/profile/data/user_preferences_notifier.dart`) Genişletmesi
1. `UserPreferencesState` içine mevcut tüm alanları (`isPro`, `dailyFreeQuestionLimit`, `themeMode`) ve varsayılanlarını BİREBİR koruyarak şu 3 yeni alanı ekle:
   - `final int targetKpssScore;` (varsayılan `85`)
   - `final String focusLesson;` (varsayılan `'Tarih'`)
   - `final bool hasCompletedOnboarding;` (varsayılan `false`)
   - `copyWith` metodunu bu 3 alanı da destekleyecek şekilde güncelle.
2. `UserPreferencesNotifier` içine şu metodu ekle:
   ```dart
   /// Kullanıcının KPSS hedef puanını, odak dersini ve günlük soru hedefini kaydeder.
   void saveOnboardingGoals({
     required int targetKpssScore,
     required String focusLesson,
     required int dailyGoalQuestions,
   }) {
     state = state.copyWith(
       targetKpssScore: targetKpssScore,
       focusLesson: focusLesson,
       dailyFreeQuestionLimit: dailyGoalQuestions,
       hasCompletedOnboarding: true,
     );
   }
   ```

ADIM 2: `lib/features/onboarding/presentation/onboarding_screen.dart` (`OnboardingScreen`)
1. `lib/features/onboarding/presentation/onboarding_screen.dart` (`OnboardingScreen extends ConsumerStatefulWidget`) oluştur:
   - `AppBar(title: const Text('KPSS Hedef Sihirbazı'))`
   - Durum değişkenleri:
     - `int _step = 0;` (`0`, `1`, `2` olmak üzere 3 adım)
     - `int _selectedScore = 85;` (`80`, `85`, `90`)
     - `String _selectedLesson = 'Tarih';` (`'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`)
     - `int _selectedDailyGoal = 30;` (`30`, `50`, `100`)
   - Üstte adım göstergesi (`'Adım ${_step + 1} / 3'`) + `LinearProgressIndicator(value: (_step + 1) / 3)` ve `MascotCoachBanner`:
     - Adım 0: `title: 'Hedef KPSS Puanın Kaç?'`, `message: 'Atanmak istediğin kadro için hedef puanını seç, çalışma rotanı ona göre kuralım.'`
     - Adım 1: `title: 'En Çok Hangi Derste Zorlanıyorsun?'`, `message: 'Öncelikli odak dersini seç; günlük çalışma planına özel görev ekleyelim.'`
     - Adım 2: `title: 'Günlük Kaç Soru Çözmek İstiyorsun?'`, `message: 'İstikrarlı bir seri (streak) yakalamak için günlük soru hedefini belirle.'`
   - Ortada adıma göre seçilebilir `TactileCard` seçenekleri:
     - **Adım 0 Seçenekleri:** `80` (`'80+ Puan · B Grubu Memurluk'`), `85` (`'85+ Puan · Merkez & Kurum Kadroları'`), `90` (`'90+ Puan · Derece & A Grubu Kadrolar'`)
     - **Adım 1 Seçenekleri:** `'Tarih'` (`'Tarih · 27 Soru (%45 Ağırlık)'`), `'Coğrafya'` (`'Coğrafya · 18 Soru (%30 Ağırlık)'`), `'Vatandaşlık'` (`'Vatandaşlık · 9 Soru (%15 Ağırlık)'`), `'Güncel Bilgiler'` (`'Güncel Bilgiler · 6 Soru (%10 Ağırlık)'`)
     - **Adım 2 Seçenekleri:** `30` (`'30 Soru / Gün · İstikrarlı Tempo'`), `50` (`'50 Soru / Gün · Yoğun Tempo'`), `100` (`'100 Soru / Gün · Derece Kampı'`)
   - Altta navigasyon butonları:
     - `_step > 0` ise solda `'Geri'` (`OutlinedButton`),
     - Sağda `_step < 2` ise `'Devam Et'` (`FilledButton`), `_step == 2` ise `'Rotamı Oluştur'` (`FilledButton.icon`, `LucideIcons.sparkles`):
       - `'Rotamı Oluştur'` tıklandığında:
         1. `ref.read(userPreferencesProvider.notifier).saveOnboardingGoals(targetKpssScore: _selectedScore, focusLesson: _selectedLesson, dailyGoalQuestions: _selectedDailyGoal);`
         2. `ref.read(studyPlannerProvider.notifier).addTask(title: '$_selectedLesson Odak Testi ($_selectedScore+ Hedef)', lessonTag: _selectedLesson, estimatedMinutes: 20, actionType: StudyTaskActionType.quiz);`
         3. `if (mounted) Navigator.of(context).pop();`

ADIM 3: `ProfileScreen` ve `router.dart` Entegrasyonu
1. `lib/features/profile/presentation/profile_screen.dart` içinde `_AccountCard` altına **`_StudyGoalWizardCard`** (`TactileCard`) ekle:
   - Başlık: `'KPSS Hedefim: ${prefs.targetKpssScore}+ Puan'`
   - Alt metin: `'Odak Ders: ${prefs.focusLesson} · Günlük Hedef: ${prefs.dailyFreeQuestionLimit} Soru'`
   - Aksiyon butonu (`FilledButton.tonalIcon`, `LucideIcons.compass`, `label: const Text('Hedef Sihirbazını Aç')`): Tıklandığında `OnboardingScreen` açar.
2. `lib/app/router.dart` içine `/onboarding` (`OnboardingScreen`) rotasını ekle.

ADIM 4: Test ve Doğrulama
1. `test/paywall_and_profile_test.dart` içine:
   - `ProfileScreen` üzerinden `'Hedef Sihirbazını Aç'` butonuna tıklanınca `OnboardingScreen` ekranının açıldığını,
   - 3 adım tamamlanıp `'Rotamı Oluştur'` butonuna basıldığında `userPreferencesProvider` üzerinde `targetKpssScore` ve `focusLesson` değerlerinin güncellendiğini doğrulayan widget testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 🎨 11. Dalga 11: Yüksek Kontrastlı Kart Tasarımı, Yazı/Arka Plan Uyumu & Tema Mimarisi Revizyonu (`TASK-31`, `TASK-32`, `TASK-33`)

Mevcut kartlarda tespit edilen **3 kritik görsel/kontrast hatasını** kökten çözen UI/UX revizyon dalgası:
1. **`TactileCard` Yarı-Saydam Arka Plan + `BoxShadow` Sızması Hatası:** Flutter'da `BoxShadow(offset: Offset(0, 3.5), blurRadius: 0)` kartın tamamının arkasına dolu bir dikdörtgen çizer. Kartlara `.withAlpha(35)` / `.withAlpha(55)` gibi yarı-saydam arka plan verildiğinde, arkadaki koyu gölge rengi kartın içinden dışarı vurarak kart zeminini bulanık/kirli hale getiriyor ve üstte 3.5px'lik renk kırılması yaratıyor.
2. **`AppTheme` Siyah `secondaryColor` (`#0F172A`) ve Eksik `on*Container` Çiftleri:** `secondaryColor` zifiri siyah olduğu için *"Deneme sınavı"* gibi `secondary` kullanan kartlarda yazı ve ikonlar koyu zemin üzerinde boğuluyor; açık/koyu temada `onPrimaryContainer`, `onSecondaryContainer`, `onTertiaryContainer`, `onErrorContainer` çiftleri açıkça tanımlanmadığı için rozet yazıları arka planla çakışıyor.
3. **`MascotCoachBanner` Koyu Gradient Boğukluğu:** `[colorScheme.primary, colorScheme.secondary]` geçişi açık temada sağ tarafı siyaha, koyu temada ise soluk gri-eflatuna çevirerek konuşma balonundaki yazıların okunabilirliğini düşürüyor.

---

### 📦 TASK-31: Yüksek Kontrastlı Renk Paleti (`AppTheme`), Opak Yüzeyli `TactileCard` & Ferah `MascotCoachBanner` Revizyonu

```text
GÖREV: TASK-31 — AppTheme WCAG AAA Kontrast Renk Çiftleri, TactileCard Opak Harmanlama (Color.alphaBlend) ve Yüksek Okunaklı MascotCoachBanner Tasarımı
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...) yalnızca `lib/app/theme.dart` içinde tanımlanabilir. Diğer tüm dosyalarda yalnızca `Theme.of(context).colorScheme` kullan.

ADIM 1: `lib/app/theme.dart` — Yüksek Kontrastlı EdTech Renk Sistemi (Light & Dark)
1. `lib/app/theme.dart` dosyasındaki renk sabitlerini ve `light` / `dark` temalarını aşağıdaki gibi güncelle (tüm `Container` ve `onContainer` çiftleri %100 okunabilir yüksek kontrasta sahip olacak, `secondaryColor` siyah yerine canlı Zümrüt/Teal `#0D9488` olacak):
   ```dart
   // Marka Renk Sabitleri (Academic Indigo + Emerald Teal + Achievement Gold)
   static const Color seedColor = Color(0xFF4F46E5); // Academic Royal Indigo
   static const Color secondaryColor = Color(0xFF0D9488); // Vibrant Academic Teal
   static const Color tertiaryColor = Color(0xFFD97706); // Achievement Amber Gold

   static const Color darkPrimaryColor = Color(0xFF818CF8);
   static const Color darkSecondaryColor = Color(0xFF2DD4BF);
   static const Color darkTertiaryColor = Color(0xFFFBBF24);
   ```
2. `AppTheme.light` getter'ı içinde `baseLight.colorScheme.copyWith(...)` ve `scaffoldBackgroundColor` ile kart ve yazı kontrastını kesinleştir:
   ```dart
   static ThemeData get light {
     final baseLight = FlexThemeData.light(
       colors: const FlexSchemeColor(
         primary: seedColor,
         primaryContainer: Color(0xFFEEF2FF),
         secondary: secondaryColor,
         secondaryContainer: Color(0xFFCCFBF1),
         tertiary: tertiaryColor,
         tertiaryContainer: Color(0xFFFEF3C7),
         appBarColor: Color(0xFFF8FAFC),
         error: Color(0xFFDC2626),
       ),
       surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
       blendLevel: 2,
       subThemesData: _subThemesData,
       visualDensity: FlexColorScheme.comfortablePlatformDensity,
     );

     final highContrastScheme = baseLight.colorScheme.copyWith(
       primary: seedColor,
       onPrimary: const Color(0xFFFFFFFF),
       primaryContainer: const Color(0xFFE0E7FF),
       onPrimaryContainer: const Color(0xFF1E1B4B),
       secondary: secondaryColor,
       onSecondary: const Color(0xFFFFFFFF),
       secondaryContainer: const Color(0xFFCCFBF1),
       onSecondaryContainer: const Color(0xFF134E4A),
       tertiary: tertiaryColor,
       onTertiary: const Color(0xFFFFFFFF),
       tertiaryContainer: const Color(0xFFFEF3C7),
       onTertiaryContainer: const Color(0xFF78350F),
       error: const Color(0xFFDC2626),
       onError: const Color(0xFFFFFFFF),
       errorContainer: const Color(0xFFFEE2E2),
       onErrorContainer: const Color(0xFF7F1D1D),
       surface: const Color(0xFFFFFFFF),
       onSurface: const Color(0xFF0F172A),
       surfaceContainerLow: const Color(0xFFF8FAFC),
       surfaceContainerHighest: const Color(0xFFF1F5F9),
       onSurfaceVariant: const Color(0xFF475569),
       outline: const Color(0xFF64748B),
       outlineVariant: const Color(0xFFCBD5E1),
     );

     return baseLight.copyWith(
       colorScheme: highContrastScheme,
       scaffoldBackgroundColor: const Color(0xFFF1F5F9),
       cardColor: const Color(0xFFFFFFFF),
       textTheme: _buildTextTheme(baseLight.textTheme),
     );
   }
   ```
3. `AppTheme.dark` getter'ı içinde de koyu mod kartlarını arka plandan net ayır ve yazı kontrastını maksimuma çıkar:
   ```dart
   static ThemeData get dark {
     final baseDark = FlexThemeData.dark(
       colors: const FlexSchemeColor(
         primary: darkPrimaryColor,
         primaryContainer: Color(0xFF312E81),
         secondary: darkSecondaryColor,
         secondaryContainer: Color(0xFF134E4A),
         tertiary: darkTertiaryColor,
         tertiaryContainer: Color(0xFF78350F),
         appBarColor: Color(0xFF0F172A),
         error: Color(0xFFF87171),
       ),
       surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
       blendLevel: 4,
       subThemesData: _subThemesData,
       visualDensity: FlexColorScheme.comfortablePlatformDensity,
     );

     final highContrastDarkScheme = baseDark.colorScheme.copyWith(
       primary: darkPrimaryColor,
       onPrimary: const Color(0xFF0F172A),
       primaryContainer: const Color(0xFF312E81),
       onPrimaryContainer: const Color(0xFFE0E7FF),
       secondary: darkSecondaryColor,
       onSecondary: const Color(0xFF0F172A),
       secondaryContainer: const Color(0xFF134E4A),
       onSecondaryContainer: const Color(0xFFCCFBF1),
       tertiary: darkTertiaryColor,
       onTertiary: const Color(0xFF0F172A),
       tertiaryContainer: const Color(0xFF78350F),
       onTertiaryContainer: const Color(0xFFFEF3C7),
       error: const Color(0xFFF87171),
       onError: const Color(0xFF0F172A),
       errorContainer: const Color(0xFF7F1D1D),
       onErrorContainer: const Color(0xFFFEE2E2),
       surface: const Color(0xFF1E293B),
       onSurface: const Color(0xFFF8FAFC),
       surfaceContainerLow: const Color(0xFF1E293B),
       surfaceContainerHighest: const Color(0xFF334155),
       onSurfaceVariant: const Color(0xFFCBD5E1),
       outline: const Color(0xFF94A3B8),
       outlineVariant: const Color(0xFF334155),
     );

     return baseDark.copyWith(
       colorScheme: highContrastDarkScheme,
       scaffoldBackgroundColor: const Color(0xFF0B0F19),
       cardColor: const Color(0xFF1E293B),
       textTheme: _buildTextTheme(baseDark.textTheme),
     );
   }
   ```

ADIM 2: `lib/shared/widgets/tactile_card.dart` — Gölge Sızmasını Önleyen %100 Opak Zemin Harmanlama
1. `lib/shared/widgets/tactile_card.dart` içinde `build` metodunu güncelle:
   - Eğer `backgroundColor` yarı-saydam (`alpha < 255`) verilmişse, arkadaki `BoxShadow`'un kart içinden görünmesini engellemek için `Color.alphaBlend(backgroundColor!, colorScheme.surface)` ile her zaman **%100 opak (`alpha == 255`)** bir zemin rengi elde et!
   - `effectiveBorder` için de `Color.alphaBlend(borderColor ?? colorScheme.outlineVariant, colorScheme.surface)` kullanarak temiz ve keskin bir çerçeve + 3px alt dudak gölgesi oluştur:
   ```dart
   final rawBg = backgroundColor ?? colorScheme.surface;
   final effectiveBg = rawBg.a < 1.0
       ? Color.alphaBlend(rawBg, colorScheme.surface)
       : rawBg;
   final rawBorder = borderColor ?? colorScheme.outlineVariant;
   final effectiveBorder = rawBorder.a < 1.0
       ? Color.alphaBlend(rawBorder, colorScheme.surface)
       : rawBorder;
   ```
   - `boxShadow` içinde `offset: const Offset(0, 3.0), blurRadius: 0` kullan.

ADIM 3: `lib/shared/widgets/mascot_coach_banner.dart` — Yüksek Kontrastlı & Ferah Tactile Koç Sahnesi
1. `MascotCoachBanner` (`lib/shared/widgets/mascot_coach_banner.dart`) içindeki koyu/bulanık `[primary, secondary]` gradient'i kaldır! Onun yerine hem açık hem koyu temada yazıların jilet gibi okunduğu **Tactile Koç Kartı** yapısına geç:
   - Dış kapsayıcı: `TactileCard` (veya `BoxDecoration`) ile:
     - `color: colorScheme.surface` (Açık temada saf beyaz `#FFFFFF`, Koyu temada `#1E293B`),
     - `borderRadius: BorderRadius.circular(22)`,
     - `border: Border.all(color: colorScheme.primary.withAlpha(110), width: 1.5)`,
     - `boxShadow: [BoxShadow(color: Color.alphaBlend(colorScheme.primary.withAlpha(70), colorScheme.surface), offset: const Offset(0, 3.5), blurRadius: 0)]`.
   - Sol tarafta `84x84` maskot çerçevesi (`color: colorScheme.primaryContainer`, çerçevesi `Border.all(color: colorScheme.primary.withAlpha(90), width: 2)`), sağ altında küçük yıldız rozeti (`colorScheme.tertiaryContainer` / `colorScheme.onTertiaryContainer`).
   - Sağ tarafta:
     - Üst rozet hapı (`badgeLabel`): Arka plan `colorScheme.primaryContainer`, yazı rengi `colorScheme.onPrimaryContainer` (`FontWeight.w800`).
     - Başlık (`title`): `textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w800)` — **Kart zemini üzerinde %100 net okunur!**
     - Konuşma Balonu (`message`): Arka plan `colorScheme.surfaceContainerHighest`, çerçeve `Border.all(color: colorScheme.outlineVariant)`, yazı rengi `colorScheme.onSurfaceVariant` (`textTheme.bodySmall?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w500, height: 1.4)`).

ADIM 4: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-32: `HomeScreen` Bento Kartları & `LessonsScreen` / `LessonTopicsScreen` Kart Kontrast ve Renk Uyumu Düzeltmesi

```text
GÖREV: TASK-32 — HomeScreen 2x2 Bento Kartları, Mini Oyun Kartları, LessonsScreen ve LessonTopicsScreen Kartlarının Temiz Yüzey + Yüksek Kontrastlı Rozet Çiftlerine Kavuşturulması
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-31 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `lib/features/home/presentation/home_screen.dart` (`_StudyTypeTile` & `_DailyGoalCard`)
1. `_StudyTypeTile` sınıfına `final Color? onAccentContainerColor;` parametresi ekle:
   - `HomeScreen` içinde 6 adet `_StudyTypeTile` çağrısında her kartın rozet/ikon kontrast çiftini tam eşleştir:
     1. `'Konu testi'`: `accentColor: colorScheme.primary`, `accentContainerColor: colorScheme.primaryContainer`, `onAccentContainerColor: colorScheme.onPrimaryContainer`
     2. `'Bilgi kartları'`: `accentColor: colorScheme.tertiary`, `accentContainerColor: colorScheme.tertiaryContainer`, `onAccentContainerColor: colorScheme.onTertiaryContainer`
     3. `'Yanlış defteri'`: `accentColor: colorScheme.error`, `accentContainerColor: colorScheme.errorContainer`, `onAccentContainerColor: colorScheme.onErrorContainer`
     4. `'Deneme sınavı'`: `accentColor: colorScheme.secondary`, `accentContainerColor: colorScheme.secondaryContainer`, `onAccentContainerColor: colorScheme.onSecondaryContainer`
     5. `'60 Saniyede Pençe'`: `accentColor: colorScheme.tertiary`, `accentContainerColor: colorScheme.tertiaryContainer`, `onAccentContainerColor: colorScheme.onTertiaryContainer`
     6. `'Kavram Eşleştir'`: `accentColor: colorScheme.primary`, `accentContainerColor: colorScheme.primaryContainer`, `onAccentContainerColor: colorScheme.onPrimaryContainer`
2. `_StudyTypeTile.build` içinde:
   - **Kart Arka Planı (`backgroundColor`):** Kirli yarı-saydam `effectiveAccentContainer.withAlpha(55)` yerine doğrudan **`colorScheme.surface`** (bembeyaz / koyu slate temiz kart yüzeyi) kullan!
   - **Kart Çerçevesi (`borderColor`):** `effectiveAccent.withAlpha(110)` kullan.
   - **Sol Üst İkon Kutusu:** Arka plan `effectiveAccentContainer`, ikon rengi `effectiveOnAccentContainer` (`onAccentContainerColor ?? colorScheme.onPrimaryContainer`).
   - **Sağ Üst Rozet Hapı (`badgeText`):** Arka plan `effectiveAccentContainer`, yazı rengi **`effectiveOnAccentContainer`** (`FontWeight.w800`)! (Böylece açık zemin üzerine açık yazı veya koyu zemin üzerine koyu yazı gelmesi imkansız hale gelir!).
   - **Kart Başlığı (`title`):** `color: colorScheme.onSurface`, `fontWeight: FontWeight.w800`.
   - **Kart Açıklaması (`description`):** `color: colorScheme.onSurfaceVariant`, `fontWeight: FontWeight.w500`.
   - **Alt Aksiyon Satırı (`actionText` + `chevronRight`):** `color: effectiveAccent`, `fontWeight: FontWeight.w800`.

ADIM 2: `lib/features/lessons/presentation/lessons_screen.dart` & `lesson_topics_screen.dart`
1. `lib/features/lessons/presentation/lessons_screen.dart` içindeki `_LessonCard` bileşeninde:
   - `backgroundColor: colorScheme.primaryContainer.withAlpha(35)` satırını **`backgroundColor: colorScheme.surface`** olarak değiştir!
   - `borderColor: colorScheme.outlineVariant` (veya `lesson.badgeText != null ? colorScheme.primary.withAlpha(120) : colorScheme.outlineVariant`) yap.
   - Ders başlığı `color: colorScheme.onSurface`, alt bilgi `color: colorScheme.onSurfaceVariant` olsun.
2. `lib/features/lessons/presentation/lesson_topics_screen.dart` içindeki `_TopicPathNode` bileşeninde:
   - `backgroundColor` için `index == 0 ? colorScheme.primaryContainer.withAlpha(45) : colorScheme.surface` kullan (`TactileCard` bunu `Color.alphaBlend` ile opaklaştıracak).
   - `'Test Çöz'` rozetinde arka plan `colorScheme.primaryContainer`, ikon ve yazı rengi `colorScheme.onPrimaryContainer` olsun (önceden `secondaryContainer` üzerine `primary` yazılıydı!).

ADIM 3: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-33: `QuizScreen`, `FlashcardsScreen`, `StatsScreen`, `ProfileScreen` & Oyun Ekranları Kart Bütünlüğü ve Kontrast Cilası

```text
GÖREV: TASK-33 — QuizScreen, FlashcardsScreen, StatsScreen, ProfileScreen, PaywallScreen ve Oyun Ekranlarındaki Kart/Rozet Kontrastlarının %100 Standartlaştırılması
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-32 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `QuizScreen` (`lib/features/quiz/presentation/quiz_screen.dart`) ve `OptionTile` (`lib/features/quiz/presentation/widgets/option_tile.dart`)
1. `lib/features/quiz/presentation/quiz_screen.dart` içinde:
   - `_QuestionCard`: Düz `Card` yerine `TactileCard(backgroundColor: colorScheme.surface, borderColor: colorScheme.outlineVariant, child: Text(text, style: theme.textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface, height: 1.5, fontWeight: FontWeight.w600)))` kullan.
   - `_ExplanationCard`: Düz `Card` yerine `TactileCard(backgroundColor: colorScheme.primaryContainer.withAlpha(80), borderColor: colorScheme.primary.withAlpha(120), ...)` kullan; başlık `colorScheme.onPrimaryContainer`, açıklama metni `colorScheme.onSurface` olsun.
2. `lib/features/quiz/presentation/widgets/option_tile.dart` içinde:
   - `OptionStatus.selected`: Arka plan ` Color.alphaBlend(colorScheme.primaryContainer.withAlpha(140), colorScheme.surface)`, çerçeve `colorScheme.primary`, şık harfi dairesi `colorScheme.primary` / `colorScheme.onPrimary`, şık metni `colorScheme.onSurface` (`FontWeight.w700`).
   - `OptionStatus.correct`: Arka plan `Color.alphaBlend(colorScheme.secondaryContainer.withAlpha(160), colorScheme.surface)`, çerçeve `colorScheme.secondary`, şık harfi dairesi `colorScheme.secondary` / `colorScheme.onSecondary`, sağ ikon `colorScheme.secondary` (Teal/Zümrüt yeşil doğru şık vurgusu!).
   - `OptionStatus.wrong`: Arka plan `Color.alphaBlend(colorScheme.errorContainer.withAlpha(160), colorScheme.surface)`, çerçeve `colorScheme.error`, şık harfi dairesi `colorScheme.error` / `colorScheme.onError`, sağ ikon `colorScheme.error`.

ADIM 2: `StatsScreen` (`lib/features/stats/presentation/stats_screen.dart`) & `FlashcardsScreen` (`lib/features/flashcards/presentation/flashcards_screen.dart`)
1. `lib/features/stats/presentation/stats_screen.dart` içinde:
   - `_StatCard` ve `_LessonAccuracyChartCard` bileşenlerinde düz `Card` yerine diğer kartlarla birebir uyumlu `TactileCard(backgroundColor: colorScheme.surface, borderColor: colorScheme.outlineVariant, ...)` kullan; `_StatCard` içindeki `label` rengini `colorScheme.onSurfaceVariant`, `value` rengini `colorScheme.onSurface` (`FontWeight.w800`) yap.
   - `_LeagueAndStreakCard` içindeki `'${stats.streakDays} Gün Seri'` rozetinde arka plan `colorScheme.tertiaryContainer`, ikon ve yazı rengi `colorScheme.onTertiaryContainer` olsun.
2. `lib/features/flashcards/presentation/flashcards_screen.dart` içinde:
   - `_FlashcardFace` bileşeninde düz `Card` yerine `TactileCard` kullan: Ön yüzde `backgroundColor: colorScheme.surface`, arka yüzde (`isBack == true`) `backgroundColor: colorScheme.primaryContainer.withAlpha(90)`, `borderColor: isBack ? colorScheme.primary : colorScheme.outlineVariant` ve ana metin rengi `colorScheme.onSurface` (`FontWeight.w700`) olsun.

ADIM 3: `ProfileScreen` (`lib/features/profile/presentation/profile_screen.dart`) & `PaywallScreen` (`lib/features/profile/presentation/paywall_screen.dart`)
1. `lib/features/profile/presentation/profile_screen.dart` içinde:
   - `'Hedef'` ve `'Uygulama'` bölümlerindeki düz `Card` bileşenlerini `TactileCard(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), backgroundColor: colorScheme.surface, borderColor: colorScheme.outlineVariant, ...)` ile değiştir ki sayfadaki tüm kartlar aynı görsel dilde ve yüksek kontrastta olsun.
   - `_ProBannerCard` içinde arka planı `colorScheme.primaryContainer.withAlpha(110)` (opak harmanlanmış), başlığı `colorScheme.onSurface`, alt metni `colorScheme.onSurfaceVariant` yap.

ADIM 4: Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 🏆 12. Dalga 12: Mimari & Gelir Güvencesi, Zengin Deneme Merkezi, Hap Kartlar & KPSS Liderlik Sistemi (`TASK-34` - `TASK-38`)

---

### 📦 TASK-34: Kritik Mimari & Gelir Düzeltmesi: Günlük Soru Limiti vs Hedef Ayrımı, Gün Dönümü Sıfırlama & Profil Hedefi

```text
GÖREV: TASK-34 — UserPreferencesNotifier ve StudyStatsNotifier Mimari Düzeltmesi: Günlük Soru Limiti ile Hedef Soru Sayısının Ayrılması ve Gün Dönümü Takibi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA.

ADIM 1: `UserPreferencesState` & `UserPreferencesNotifier` (`lib/features/profile/data/user_preferences_notifier.dart`)
1. `UserPreferencesState` içine `final int targetDailyStudyGoal;` ekle (varsayılan: 30).
2. `dailyFreeQuestionLimit` varsayılan değeri 30 olarak kalsın.
3. `copyWith` içine `targetDailyStudyGoal` parametresini ekle.
4. `saveOnboardingGoals` metodunu güncelle:
   ```dart
   void saveOnboardingGoals({
     required int targetKpssScore,
     required String focusLesson,
     required int dailyGoalQuestions,
   }) {
     state = state.copyWith(
       targetKpssScore: targetKpssScore,
       focusLesson: focusLesson,
       targetDailyStudyGoal: dailyGoalQuestions,
       // DİKKAT: dailyFreeQuestionLimit ASLA dailyGoalQuestions ile ezilmez! 30 soru limiti korunur.
       hasCompletedOnboarding: true,
     );
   }
   ```

ADIM 2: `StudyStatsState` & `StudyStatsNotifier` (`lib/features/stats/data/study_stats_notifier.dart`)
1. `StudyStatsState` içine `final DateTime? lastStudyDate;` ve `final int dailySolvedCount;` alanlarını ekle (varsayılan: `dailySolvedCount = 0`).
2. `recordAnswer` metodu çağrıldığında gün kontrolü yap:
   - Eğer `lastStudyDate == null` veya son çalışma günü bugünden farklıysa (`lastDate.year != now.year || lastDate.month != now.month || lastDate.day != now.day`):
     - `newDailySolved = 1;`
     - Seri (`streakDays`) kontrolü: Son çalışma günü dün ise (`now.difference(lastDate).inDays == 1` veya tarih farkı 1 gün ise) `newStreak = state.streakDays + 1;`, 1 günden fazlaysa `newStreak = 1;`.
   - Aynı gün ise:
     - `newDailySolved = state.dailySolvedCount + 1;`
     - `newStreak = state.streakDays;`
   - `lastStudyDate = now` olarak kaydedilir.

ADIM 3: `QuizScreen` & `ProfileScreen` Entegrasyonu
1. `lib/features/quiz/presentation/quiz_screen.dart` içinde:
   - Paywall kontrolü satırını güncelle:
     `if (!prefs.isPro && stats.dailySolvedCount >= prefs.dailyFreeQuestionLimit)`
     (Önceden `stats.totalSolved` bakılıyordu, bu da kullanıcının ertesi gün soru çözmesini engelliyordu!).
2. `lib/features/profile/presentation/profile_screen.dart` içinde:
   - Hedef kartındaki metni düzelt:
     `'Odak Ders: ${prefs.focusLesson} • Günlük Hedef: ${prefs.targetDailyStudyGoal} Soru'`

ADIM 4: Test ve Doğrulama
1. `test/paywall_and_profile_test.dart` ve `test/onboarding_test.dart` dosyalarını yeni `targetDailyStudyGoal` ve `dailySolvedCount` mantığına göre güncelle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-35: Supabase Güvenliği (RLS Düzeltmesi), Haftalık Lig RPC Fonksiyonu & Yanlış Defteri Bulut Çözüm Senkronizasyonu

```text
GÖREV: TASK-35 — Supabase SQL Güvenliği (is_pro kısıtlaması & get_weekly_leaderboard RPC) ve CloudSyncRepository Bulut Çözüm Senkronizasyonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. TASK-34 tamamlandıktan sonra bu görevi uygula.

ADIM 1: `docs/supabase_schema.sql` Güvenlik & RPC Eklemeleri
1. `public.profiles` tablosu RLS politikalarını güncelle:
   - İstemcilerin `is_pro` kolonunu doğrudan `true` yapmasını önleyen açıklama ve trigger/view güvenliği ekle.
2. `public.get_weekly_leaderboard()` RPC fonksiyonunu tanımla:
   ```sql
   create or replace function public.get_weekly_leaderboard()
   returns table (
       display_name text,
       total_xp integer,
       league_tier text
   )
   language sql
   security definer
   as $$
       select display_name, coalesce(total_xp, 0) as total_xp, coalesce(league_tier, 'Bronz Kadro') as league_tier
       from public.profiles
       order by total_xp desc
       limit 10;
   $$;
   ```

ADIM 2: `CloudSyncRepository` (`lib/features/stats/data/cloud_sync_repository.dart`)
1. `LeaderboardEntry` modelini ekle:
   ```dart
   class LeaderboardEntry {
     final String displayName;
     final int totalXp;
     final String leagueTier;

     const LeaderboardEntry({
       required this.displayName,
       required this.totalXp,
       required this.leagueTier,
     });
   }
   ```
2. `Future<List<LeaderboardEntry>> fetchLeaderboard()` metodunu ekle:
   - `SupabaseConfig.clientOrNull` varsa `client.rpc('get_weekly_leaderboard')` çalıştırır; hata veya offline durumunda mock aday listesi döner:
     1. `'Zeynep K. (90+ Hedef)'` — `640 XP` (`'Altın Kadro'`)
     2. `'Burak T. (Merkez Kadro)'` — `420 XP` (`'Gümüş Kadro'`)
     3. `'Elif A. (A Grubu)'` — `285 XP` (`'Gümüş Kadro'`)
     4. `'Mert D. (Memur Adayı)'` — `140 XP` (`'Bronz Kadro'`)
3. `Future<void> markMistakeResolved({required String questionText})` metodunu ekle:
   - Supabase `question_attempt_logs` tablosunda ilgili soruyu `is_resolved_in_mistakes: true` yapar.
4. `QuizScreen` (`lib/features/quiz/presentation/quiz_screen.dart`) içinde doğru cevaplandığında `CloudSyncRepository().markMistakeResolved` çağır.

ADIM 3: Test ve Doğrulama
1. `test/cloud_sync_test.dart` içine `markMistakeResolved` ve `fetchLeaderboard` offline-safe testlerini ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-36: Zengin Deneme Sınavı Merkezi (`ExamsScreen` Prova Paketleri) & `QuizScreen` Tam Havuz (`fetchAllFromPool`) Bağlantısı

```text
GÖREV: TASK-36 — ExamsScreen Deneme Paketleri (Türkiye Geneli Prova, Tarih/Coğrafya Kamp Denemesi, 15 Dk Hızlı Mola Denemesi) ve QuizScreen `fetchAllFromPool` Entegrasyonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA. Mevcut testlerde aranan metinleri ('Deneme sınavları', 'Sınav düzeni', 'Soru sayısı', '60', 'Süre', '65 dakika', 'Net hesabı', '4 yanlış 1 doğruyu götürür', 'Genel Kültür Denemesi Başlat') BİREBİR koru.

ADIM 1: `QuizScreen` (`lib/features/quiz/presentation/quiz_screen.dart`) Tam Havuz Yükleme Desteği
1. `QuizScreen` sınıfına opsiyonel `final bool fetchAllFromPool;` (varsayılan `false`) parametresi ekle:
   - `initState()` içinde `fetchAllFromPool: true` veya ders/konu filtresi varsa havuzdan yükleme yapsın.
   - Varsayılan `QuizScreen()` çağrısı testlerde senkron `defaultSampleQuestions` ile 0 gecikmeyle çalışmaya devam etsin.

ADIM 2: `ExamsScreen` (`lib/features/exams/presentation/exams_screen.dart`) Deneme Paketleri Vitrini
1. Mevcut `MascotCoachBanner`, `'Sınav düzeni'` kartı ve `'Genel Kültür Denemesi Başlat'` butonunu koruyarak altına `SectionTitle('Hazır Deneme Paketleri')` ve 3 adet `_ExamPackCard` (`TactileCard`) ekle:
   - **Paket 1:** Türkiye Geneli GK Provası #1 (65 Dk, `LucideIcons.award`)
   - **Paket 2:** Tarih & Coğrafya Kamp Denemesi (40 Dk, `LucideIcons.flame`)
   - **Paket 3:** 15 Dakika Hızlı Mola Denemesi (15 Dk, `LucideIcons.zap`)

ADIM 3: Test ve Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-37: Ders Filtreli Hap Bilgi Kartları (`FlashcardsScreen` + 4 Ders + XP Kazanımı)

```text
GÖREV: TASK-37 — FlashcardsScreen 4 Ders Filtresi (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler) ve Öğrenilen Kart Başına XP Ödülü
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA.

ADIM 1: `sample_flashcards.dart` Zenginleştirmesi
1. `lib/features/flashcards/data/sample_flashcards.dart` içine 4 KPSS dersini kapsayan en az 4 yeni özgün bilgi kartı ekle.

ADIM 2: `FlashcardsScreen` Ders Filtresi & XP Entegrasyonu
1. `FlashcardsScreen` sınıfını `ConsumerStatefulWidget` yap.
2. Yatay kaydırılabilir `ChoiceChip` ders filtreleme şeridi ekle (`'Tümü'`, `'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`).
3. `'Biliyorum'` butonuna basıldığında `studyStatsProvider.notifier.recordAnswer(...)` ile istatistik ve XP'ye katkı sağla.

ADIM 3: Test ve Doğrulama
1. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-38: KPSS Başarım Rozetleri (`Achievements`) & Haftalık Kadro Lig Sıralaması (`Leaderboard` — `StatsScreen`)

```text
GÖREV: TASK-38 — StatsScreen Üzerine KPSS Başarım Rozetleri (Achievements) ve Haftalık Kadro Lig Sıralaması (Leaderboard) Eklenmesi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...), Colors.* veya sabit fontSize KULLANMA.

ADIM 1: `StatsScreen` Bileşenleri
1. `_AchievementsCard`: 4 rozet (`İlk Pençe`, `Keskin Nişancı`, `Deneme Fatihi`, `Gümüş Kadro Adayı`).
2. `_LeaderboardCard`: `CloudSyncRepository().fetchLeaderboard()` ile gelen adaylar ve kullanıcının kendi sırasını gösteren şık sıralama tablosu.

ADIM 2: Test ve Doğrulama
1. `test/study_stats_test.dart` güncellenerek rozetlerin ve lig kartının varlığı test edilir.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

## 💰 13. Dalga 13: Yerel Kalıcılık, Gelir Altyapısı (Kadro PRO + AdMob) & 200 Soruluk Çekirdek Havuz (`TASK-39` - `TASK-43`)

---

### 📦 TASK-39: Kalıcı Yerel Depolama Katmanı (`LocalStorageService` + `shared_preferences`)

```text
GÖREV: TASK-39 — Misafir Modunda dahi Veri Kaybını Önleyen LocalStorageService ve Notifier Entegrasyonları
ÖNEMLİ: GEMINI.md kurallarına birebir uy.

ADIM 1: `LocalStorageService` (`lib/core/services/local_storage_service.dart`)
1. `SharedPreferences` tabanlı kalıcı veri katmanı oluştur:
   - `saveUserPreferences(UserPreferencesState state)` & `loadUserPreferences()`
   - `saveStudyStats(StudyStatsState state)` & `loadStudyStats()`
   - `saveMistakes(List<Question> mistakes)` & `loadMistakes()`
   - `saveStudyTasks(List<StudyTask> tasks)` & `loadStudyTasks()`

ADIM 2: Notifier Entegrasyonları
1. `UserPreferencesNotifier`, `StudyStatsNotifier`, `StudyPlannerNotifier` ve `MistakeRepository` başlatılırken yerel depodan verileri okusun; her değişiklikte asenkron olarak yerel depoya yazsın.

ADIM 3: Test ve Doğrulama
1. Birim testler eklenerek uygulama açılıp kapandığında (container dispose/recreate) verilerin korunduğu test edilir.
```

---

### 📦 TASK-40: Kadro PRO 3'lü Paywall & RevenueCat (`purchases_flutter`) Entegrasyonu

```text
GÖREV: TASK-40 — 3 Seçenekli Karma Abonelik (Aylık 89 TL, Yıllık 499 TL, Sınava Kadar 349 TL) ve PaywallScreen Modernizasyonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy.

ADIM 1: `PaywallScreen` Revizyonu
1. 3 paket seçeneği kartı (`TactileCard`):
   - Aylık: 89 ₺ / Ay
   - Yıllık (En Çok Tercih Edilen rozetli): 499 ₺ / Yıl (Aylık ~41 ₺)
   - 2026 Sınava Kadar: 349 ₺ (Tek Seferlik)
2. `purchases_flutter` SDK sarmalayıcısı (`PurchaseService`) ile güvenli satın alma ve offline mock desteği.
```

---

### 📦 TASK-41: AdMob Ödüllü Video Reklam Motoru (`google_mobile_ads`)

```text
GÖREV: TASK-41 — Günlük 30 Soru Limiti Dolduğunda +20 Soru Kazandıran Gerçek Ödüllü Reklam Entegrasyonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy.

ADIM 1: `AdService` (`lib/core/services/ad_service.dart`)
1. Test Reklam Birimi ID'leri ile `RewardedAd` yükleme ve gösterme mantığı.
2. Reklam başarıyla izlendiğinde `ref.read(userPreferencesProvider.notifier).rewardExtraQuestions(20)` tetiklenmesi.
```

---

### 📦 TASK-42: 200 Soruluk Zengin Çekirdek KPSS Genel Kültür Havuzu

```text
GÖREV: TASK-42 — 4 KPSS Dersi İçin 50'şer Soru (Toplam 200 Özgün Soru) JSON ve Supabase Seed Verisinin Hazırlanması
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Telifli ÖSYM çıkmış sorularını birebir kopyalama, özgün ve kazanım odaklı hazırla.

ADIM 1: JSON Dosyaları
1. `assets/data/sample_questions.json` içine her dersten 50 soru (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler) ekle.
2. `docs/supabase_schema.sql` seed veri bölümünü bu 200 soru ile güncelle.
```

---

### 📦 TASK-43: Akıllı Çalışma Bildirimleri (`flutter_local_notifications`) & Çökme Takibi (`sentry_flutter`)

```text
GÖREV: TASK-43 — Günlük Çalışma & Seri Hatırlatıcı Bildirimleri ve Sentry Çökme Takibi
ÖNEMLİ: GEMINI.md kurallarına birebir uy.

ADIM 1: `NotificationService`
1. Akşam 20:00'de "Kadro Koçun: Bugünkü serin bozulmasın, 10 soru çöz!" hatırlatması.
ADIM 2: `sentry_flutter` Entegrasyonu
1. `main.dart` içinde Sentry başlatma ve hata yakalama.
```


---

## 🎯 14. Dalga 14: İki Yönlü Soru Gezintisi, Yanlış Defteri Ders Filtresi & Sınav/Öğrenme Modları (`TASK-44` - `TASK-46`)

---

### 📦 TASK-44: `QuizScreen` İki Yönlü Soru Gezintisi (Önceki/Sonraki Soru) & Zarif Yanlış Bildirimi

```text
GÖREV: TASK-44 — Test İçinde Geriye/İleriye Gezinme (1..N Soru Geçmişi) ve İlk Yanlışta Kapatılabilir Tek Seferlik Zarif Koç Kartı
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...) ve fontSize KULLANMA.

ADIM 1: `QuizScreen` (`lib/features/quiz/presentation/quiz_screen.dart`) Soru Gezinti Durumu
1. `Map<int, int?> _userAnswers = {};` ve `int _maxReachedIndex = 0;` durumlarını ekle.
2. Soru cevaplandığında veya şık seçildiğinde `_userAnswers[_currentIndex] = _selectedOptionIndex;` sakla.
3. Alt navigasyon butonlarını güncelle:
   - Eğer `_currentIndex > 0` ise: Sol tarafta `FilledButton.tonalIcon` veya `OutlinedButton.icon` ile `'< Önceki Soru'` butonu yer alsın. Tıklandığında `_currentIndex--` yapılsın ve o sorunun daha önce verilmiş cevabı yüklensin.
   - Eğer `_currentIndex < _maxReachedIndex`: Sağ tarafta `'Sonraki Soru >'` butonu yer alsın. Tıklandığında `_currentIndex++` yapılsın.
   - Eğer `_currentIndex == _maxReachedIndex`:
     - Soru cevaplanmadıysa: `'Cevabı Onayla'` butonu.
     - Soru cevaplandıysa ve son soru değilse: `'Sonraki Soru >'` butonu (tıklanınca `_currentIndex++; _maxReachedIndex++;`).
     - Soru cevaplandıysa ve son soruysa: `'Testi Bitir'` butonu.

ADIM 2: İlk Yanlışta Çıkan Zarif Bilgilendirme Kartı
1. Hantal SnackBar yerine, `bool _hasDismissedMistakeNotice = false;` durumu oluştur.
2. Kullanıcı testte ilk kez yanlış yaptığında, çözüm açıklamasının üstünde zarif bir `TactileCard` açılsın:
   - İkon: `LucideIcons.bookmarkCheck`
   - Metin: "Bu soru Ana Sayfa > Yanlış Defteri'ne eklendi. Eksiklerini kapatmak için dilediğin zaman oradan tekrar çözebilirsin."
   - Sağ üstte kapatma butonu ('X' veya 'Anladım' aksiyonu).
   - Kapatıldığında veya sonraki yanlışlarda bu kart bir daha çıkmasın.

ADIM 3: Test ve Doğrulama
1. Birim/widget testlerinde 1'den 5'e kadar çözüp 1'e geri dönme ve tekrar ileri gitme akışını doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-45: `MistakesScreen` Ders Bazlı Filtreleme & Derse Özel Yanlış Çözüm Akışı

```text
GÖREV: TASK-45 — Yanlış Defterinde Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler Filtreleri ve Sadece İlgili Dersi Çözme Butonu
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...) ve fontSize KULLANMA.

ADIM 1: `MistakesScreen` (`lib/features/mistakes/presentation/mistakes_screen.dart`)
1. Ekranın üst kısmına yatay kaydırılabilir ders filtre şeridi (`ChoiceChip`) ekle:
   - `'Tümü (${mistakes.length})'`
   - `'Tarih (${tarihCount})'`
   - `'Coğrafya (${cografyaCount})'`
   - `'Vatandaşlık (${vatandaslikCount})'`
   - `'Güncel Bilgiler (${guncelCount})'`
2. Seçilen derse göre alt liste filtrelensin.
3. Üstteki aksiyon butonu seçilen derse göre dinamikleşsin:
   - Tümü seçiliyse: `'Tüm Yanlışları Çöz (${mistakes.length})'`
   - Coğrafya seçiliyse: `'Coğrafya Yanlışlarını Çöz (${filtered.length})'`
4. Butona tıklandığında yalnızca o dersin yanlış soruları `QuizScreen`'e gönderilerek test başlatılsın.

ADIM 2: Test ve Doğrulama
1. `test/mistakes_screen_test.dart` içine ders filtreleme ve derse özel test başlatma kontrollerini ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-46: Kadro Çalışma Modları (Öğrenme/Anında Çözüm vs. Sınav/Gizli Çözüm & Zayıf Konu Testi)

```text
GÖREV: TASK-46 — Anında Çözüm Modu vs. Sınav/Gizli Çözüm Modu, Moda Duyarlı Geri Dönüş Şık Değiştirme Kuralı ve Zayıf Konu Testi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Sabit Color(0xFF...) ve fontSize KULLANMA.

ADIM 1: `QuizMode` Modeli & Ayarlar Entegrasyonu
1. `enum QuizMode { learning, exam }` tanımı oluştur.
   - `learning` (Öğrenme / Anında Çözüm): Şık onaylanınca doğru/yanlış anında gösterilir, açıklama açılır. Geri dönüldüğünde şık kilitlidir (değiştirilemez).
   - `exam` (Sınav / Gizli Çözüm): Şık işaretlenir ama doğruluğu hemen söylenmez, açıklama gösterilmez. Geri dönüldüğünde optik form mantığıyla şık değiştirilebilir. Tüm sonuçlar test bitince karnede topluca gösterilir.
2. `UserPreferencesState` içine `final QuizMode defaultQuizMode;` ekle ve `ProfileScreen` Ayarlar bölümüne mod seçici ekle.

ADIM 2: Zayıf Konu Testi
1. `StatsScreen` ve `HomeScreen` üzerine, kullanıcının `weakestLesson` verisine dayanarak tek tıkla 'Zayıf Konuyu Güçlendir (10 Soru)' butonu ekle.

ADIM 3: Test ve Doğrulama
1. `test/quiz_screen_test.dart` içine mod testlerini ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 🚩 15. Dalga 15: Soru Kalitesi & Geri Bildirim Döngüsü (`TASK-47`)

Kullanıcıların test çözerken karşılaştıkları hatalı/itirazlı soruları tek tıkla sebep ve açıklamayla birlikte bildirebilmesi, bu bildirimlerin bulutta Supabase `question_reports` tablosuna kaydedilmesi ve yöneticinin (içerik ekibinin) raporlanan soruları ders, konu, test ve soru metni bazında inceleyebilmesi için tam döngü görev paketi:

---

### 📦 TASK-47: Hatalı Soru Raporlama Sistemi (`ReportQuestionBottomSheet`), Supabase Tablosu & Yönetici İnceleme Paneli

```text
GÖREV: TASK-47 — Hatalı Soru Raporlama (QuizScreen Bayrak Butonu + ReportQuestionBottomSheet), Supabase question_reports Tablosu & Yönetici İnceleme Ekranı
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Sabit Color(0xFF...) veya sabit fontSize KULLANMA; tüm renkleri Theme.of(context).colorScheme ve yazı stillerini textTheme üzerinden al. `lib/shared/` altında `widgets/` dışında klasör açma! Kodların içine eğitici Türkçe doc comment'ler (`///`) ekle.

ADIM 1: Veri Modeli (`lib/features/reports/data/models/question_report.dart`)
1. `lib/features/reports/data/models/question_report.dart` dosyasını oluştur:
   - Sınıf: `class QuestionReport`
   - Alanlar:
     - `final String id;`
     - `final String? userId;`
     - `final String questionId;`
     - `final String lesson;`
     - `final String topic;`
     - `final String testTitle;`
     - `final String questionText;`
     - `final String reason;`
     - `final String? userNote;`
     - `final String status;` (varsayılan: `'pending'`)
     - `final DateTime createdAt;`
   - Constructor: `const QuestionReport({ ... })`
   - Metotlar:
     - `Map<String, dynamic> toJson()` (ve Supabase için `toMap()`)
     - `factory QuestionReport.fromJson(Map<String, dynamic> json)`

ADIM 2: Supabase Veritabanı Şeması (`docs/supabase_schema.sql`)
1. `docs/supabase_schema.sql` dosyasının en altına aşağıdaki tablo ve RLS politikalarını ekle:
   ```sql
   -- ==============================================================================
   -- 10. Hatalı Soru Raporları (question_reports)
   -- ==============================================================================
   create table if not exists public.question_reports (
     id uuid primary key default gen_random_uuid(),
     user_id uuid references auth.users(id) on delete set null,
     question_id text not null,
     lesson text not null,
     topic text not null,
     test_title text not null,
     question_text text not null,
     reason text not null,
     user_note text,
     status text not null default 'pending', -- 'pending', 'resolved', 'dismissed'
     created_at timestamptz default now()
   );

   alter table public.question_reports enable row level security;

   -- Herkes (giriş yapmış veya misafir) soru bildirebilir
   create policy "Anyone can submit question report"
     on public.question_reports for insert
     with check (true);

   -- Raporları sadece kullanıcı kendi raporunu okuyabilir veya admin tümünü okuyabilir
   create policy "Users can read their own reports or admin all"
     on public.question_reports for select
     using (auth.uid() = user_id or auth.jwt()->>'role' = 'service_role');
   ```

ADIM 3: Raporlama Repository (`lib/features/reports/data/question_report_repository.dart`)
1. `lib/features/reports/data/question_report_repository.dart` dosyasını oluştur:
   - Sınıf: `class QuestionReportRepository`
   - Metotlar:
     - `Future<bool> submitReport(QuestionReport report)`:
       - `SupabaseConfig.clientOrNull` üzerinden `from('question_reports').insert(...)` çağırır.
       - Hata alırsa veya çevrimdışıysa sessizce yakalar (offline fallback), yerel log yazar ve yine de `true` döner (kullanıcı deneyimini bozmaz).
     - `Future<List<QuestionReport>> fetchPendingReports()`:
       - `SupabaseConfig.clientOrNull` varsa `from('question_reports').select().order('created_at', ascending: false)` ile bekleyen raporları çeker.

ADIM 4: Kullanıcı Raporlama Alt Sayfası (`lib/features/reports/presentation/report_question_bottom_sheet.dart`)
1. `lib/features/reports/presentation/report_question_bottom_sheet.dart` dosyasını oluştur:
   - Sınıf: `class ReportQuestionBottomSheet extends StatefulWidget`
   - Parametreler: `final Question question;`, `final String testTitle;`, `final QuestionReportRepository? repository;`
   - Başlık: `Hatalı Soru Bildir` ve sağda kapat butonu.
   - Soru Bağlam Özeti:
     - `lesson` ve `topic` etiketleri (chip şeklinde)
     - `testTitle` bilgisi
     - Sorunun ilk 80 karakteri (`...` ile kesilmiş)
   - Hazır Rapor Sebepleri (`ChoiceChip` veya liste):
     - `'Cevap anahtarı hatalı'`
     - `'Soru kökünde / öncüllerde bilgi hatası'`
     - `'Birden fazla doğru şık var'`
     - `'Çözüm açıklaması yetersiz / yanlış'`
     - `'Yazım / İmla hatası'`
     - `'Diğer'`
   - İsteğe Bağlı Açıklama Alanı (`TextField` - 3 satır, `maxLines: 3`, `maxLength: 250`, hint: `'Detay eklemek ister misiniz? (Opsiyonel)'`)
   - Gönder Butonu (`FilledButton.icon(icon: Icon(LucideIcons.send), label: Text('Bildirimi Gönder'))`):
     - Raporu `QuestionReportRepository.submitReport` ile iletir.
     - `Navigator.of(context).pop();` yapar.
     - `ScaffoldMessenger.of(context).showSnackBar` ile kullanıcıya zarif teşekkür iletir: `"Bildirimin için teşekkürler! Soru incelemeye alındı."`

ADIM 5: `QuizScreen` (`lib/features/quiz/presentation/quiz_screen.dart`) AppBar Entegrasyonu
1. `QuizScreen` AppBar `actions` listesine bir buton ekle:
   ```dart
   IconButton(
     icon: const Icon(LucideIcons.flag, size: 20),
     tooltip: 'Hatalı Soru Bildir',
     onPressed: () {
       showModalBottomSheet<void>(
         context: context,
         isScrollControlled: true,
         backgroundColor: Theme.of(context).colorScheme.surface,
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
         ),
         builder: (ctx) => Padding(
           padding: EdgeInsets.only(
             bottom: MediaQuery.of(ctx).viewInsets.bottom,
           ),
           child: ReportQuestionBottomSheet(
             question: _currentQuestion,
             testTitle: widget.customTitle ?? '${_currentQuestion.lesson} Testi',
           ),
         ),
       );
     },
   ),
   ```

ADIM 6: Yönetici İnceleme Ekranı (`lib/features/reports/presentation/admin_reports_screen.dart`) & Profil Menüsü
1. `lib/features/reports/presentation/admin_reports_screen.dart` dosyasını oluştur:
   - Geliştirici / içerik editörü olarak senin raporlanan soruları dersine, testine, soru metnine ve kullanıcının belirttiği sebebe göre görebileceğin temiz bir liste ekranı (`AdminReportsScreen`).
   - Her kartta:
     - `Ders` ve `Konu` rozeti (örn: `Tarih · İlk Türk Devletleri`)
     - `Test Başlığı` (örn: `Genel Kültür Denemesi` veya `Tarih Konu Testi`)
     - `Rapor Sebebi` ve varsa `Kullanıcı Notu`
     - `Soru Metni` (tam metin)
2. `lib/features/profile/presentation/profile_screen.dart` içinde en alt kısma (Uygulama veya Geliştirici bölümüne):
   - `ListTile(leading: Icon(LucideIcons.shieldAlert), title: Text('Hatalı Soru Raporları (İçerik Editörü)'), onTap: () => Navigator.push(... AdminReportsScreen))` ekle.

ADIM 7: Birim & Widget Testleri (`test/question_report_test.dart`)
1. `test/question_report_test.dart` dosyasını oluştur:
   - `QuestionReport` modelinin `toJson()` ve `fromJson()` serileştirmesini test et.
   - `QuizScreen` açıldığında AppBar'da bayrak butonunun (`LucideIcons.flag`) render edildiğini doğrula.
   - Bayrak butonuna tıklandığında `ReportQuestionBottomSheet` bileşeninin ve sebep seçeneklerinin ekrana geldiğini doğrula.
   - Bir sebep seçilip "Bildirimi Gönder" butonuna basıldığında alt sayfanın kapandığını ve başarı mesajının gösterildiğini doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

### 📦 TASK-48: Canlı Soru Çözüm Modu Rozeti (`QuizScreen`) & Profil Mod Seçiminden Test Başlatma

```text
GÖREV: TASK-48 — Soru Ekranı Canlı Mod Rozeti ve Profil Mod Seçiminden Hızlı Test Başlatma
ÖNEMLİ: GEMINI.md kurallarına birebir uy.

ADIM 1: `QuizScreen` Canlı Mod Rozeti & Hızlı Geçiş
1. `_QuizScreenState` içine `_runtimeMode` ve `_toggleQuizMode()` ekle.
2. AppBar içine `_QuizModeBadge` ekle; tıklandığında Öğrenme ve Sınav modları arasında anında geçiş yapsın ve SnackBar ile kullanıcıyı bilgilendirsin.

ADIM 2: `ProfileScreen` Mod Diyaloğundan Test Başlatma
1. `_showQuizModeDialog` içine 'Bu Modla Hemen 10 Soru Çöz' aksiyon butonu ekle.
2. ListTile altına modun ne işe yaradığını açıklayan dinamik `subtitle` ekle.
```


---

### 📦 TASK-49: `QuizScreen` QuizMode Null-Safety & Geriye Dönük Uyumluluk Yaması (Hot-Reload / Web TypeError Fix)

```text
GÖREV: TASK-49 — Soru Ekranı (QuizScreen) AppBar'ında Oluşan "TypeError: null: type 'Null' is not a subtype of type 'QuizMode'" Hatasının Giderilmesi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

HATA ANALİZİ:
Kullanıcı Web/Masaüstü ortamında veya sıcak yeniden başlatma (hot-reload/restart) sonrasında ders konularından ("Dersler > Coğrafya > Türkiye'nin Coğrafi Konumu > Test Çöz") bir teste girdiğinde, QuizScreen AppBar'ı kırmızı hata şeridiyle patlıyor:
"TypeError: null: type 'Null' is not a subtype of type 'QuizMode'"
Kök Neden:
1. `_effectiveMode` getter'ı `ref.read(userPreferencesProvider).defaultQuizMode` çağrısı yaptığında, eski bellek/localStorage oturumundan kalan nesnede `defaultQuizMode` alanı JavaScript/Dart çalışma zamanında henüz `null` olarak okunabilmektedir.
2. `_QuizModeBadge` bileşeni `final QuizMode mode;` parametresi beklemekte ve `null` geldiğinde AppBar içinde Type casting hatasıyla çökmektedir.

ADIM 1: `lib/features/quiz/presentation/quiz_screen.dart` Defansif Getter ve Rozet Düzeltmesi
1. `_effectiveMode` getter'ını null-safe hale getir:
   ```dart
   QuizMode get _effectiveMode {
     if (_runtimeMode != null) return _runtimeMode!;
     if (widget.mode != null) return widget.mode!;
     try {
       final prefs = ref.read(userPreferencesProvider);
       // ignore: unnecessary_null_comparison
       if (prefs != null && prefs.defaultQuizMode != null) {
         return prefs.defaultQuizMode;
       }
     } catch (_) {
       // ProviderScope bulunmayan izole test veya hot-reload fallback
     }
     return QuizMode.learning;
   }
   ```
2. `_QuizModeBadge` bileşenini nullable parametre kabul edecek şekilde güncelle:
   ```dart
   class _QuizModeBadge extends StatelessWidget {
     final QuizMode? mode;
     final VoidCallback onToggle;

     const _QuizModeBadge({this.mode, required this.onToggle});

     @override
     Widget build(BuildContext context) {
       final theme = Theme.of(context);
       final colorScheme = theme.colorScheme;
       final effectiveMode = mode ?? QuizMode.learning;
       final isExam = effectiveMode == QuizMode.exam;
       ...
   ```

ADIM 2: `lib/features/profile/data/user_preferences_notifier.dart` Geriye Dönük Uyumluluk (Legacy Fallback)
1. `UserPreferencesState.copyWith` içinde `defaultQuizMode` birleşimini güvenli yap:
   ```dart
   defaultQuizMode: defaultQuizMode ?? this.defaultQuizMode,
   ```
   yerine:
   ```dart
   defaultQuizMode: defaultQuizMode ?? this.defaultQuizMode,
   ```
   (Eğer `this.defaultQuizMode` null ise bile constructor varsayılanı `QuizMode.learning` olmalıdır).
2. `UserPreferencesState.fromJson` içinde:
   ```dart
   final modeName = json['defaultQuizMode'] as String?;
   final defaultQuizMode = modeName == null
       ? QuizMode.learning
       : QuizMode.values.firstWhere(
           (e) => e.name == modeName,
           orElse: () => QuizMode.learning,
         );
   ```

ADIM 3: `lib/features/profile/presentation/profile_screen.dart` Null Güvenliği
1. `_quizModeLabel(QuizMode? mode)` metoduna `mode ?? QuizMode.learning` fallback'i ekle.
2. `_showQuizModeDialog` içinde `currentMode ?? QuizMode.learning` kontrolü koy.

ADIM 4: Test ve Doğrulama
1. `test/quiz_screen_test.dart` içine:
   - `_QuizModeBadge mode parametresi null gelse dahi çökmeksizin varsayılan Öğrenme modu ile render edilmeli` testini ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

### 📦 TASK-50: Kesintisiz Çalışma Döngüsü & Akıllı Sayfa İçi Yönlendirmeler (Zero Dead-Ends UX)

```text
GÖREV: TASK-50 — Test Sonunda Yanlış Defterine Yönlendirme, Boş Durum Akıllı Köprüleri ve Bilgi Kartı -> Test Entegrasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Sabit Color(0xFF...) veya sabit fontSize KULLANMA; tüm renkleri Theme.of(context).colorScheme ve yazı stillerini textTheme üzerinden al. `lib/shared/` altında `widgets/` dışında klasör açma! Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `QuizResultScreen` (`lib/features/quiz/presentation/quiz_result_screen.dart`) Yanlış Defteri & Başarı Köprüsü
1. `package:kadro/features/mistakes/presentation/mistakes_screen.dart` ve `package:kadro/features/flashcards/presentation/flashcards_screen.dart` import et.
2. Alt buton alanını (`result.wrongCount > 0` durumuna göre) akıllı ikili aksiyona dönüştür:
   - Eğer `result.wrongCount > 0`:
     - Üstte birincil buton (`FilledButton.icon`):
       - `icon: Icon(LucideIcons.bookmarkCheck)`
       - `label: Text('Yanlış Defterine Git (${result.wrongCount} Yanlış)')`
       - `onPressed:` `Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MistakesScreen()));`
     - Altta ikincil buton (`OutlinedButton.icon`):
       - `icon: Icon(LucideIcons.house)`
       - `label: Text('Ana Sayfaya Dön')`
       - `onPressed: () => Navigator.of(context).pop();`
   - Eğer `result.wrongCount == 0` (Mükemmel Skor / Full):
     - Üstte birincil buton (`FilledButton.icon`):
       - `icon: Icon(LucideIcons.house)`
       - `label: Text('Ana Sayfaya Dön')`
     - Altta ikincil buton (`OutlinedButton.icon`):
       - `icon: Icon(LucideIcons.layers)`
       - `label: Text('Bilgi Kartlarıyla Hızlı Tekrar')`
       - `onPressed:` `Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const FlashcardsScreen()));`

ADIM 2: `MistakesScreen` (`lib/features/mistakes/presentation/mistakes_screen.dart`) Boş Durum Akıllı Kısayolları (Zero Dead-End)
1. Yanlış Defteri boşken (`mistakes.isEmpty`) çıkan kartın altına 2 yönlendirici buton ekle:
   - "Tebrikler, hiç yanlışın yok!" metninin hemen altına:
     - `FilledButton.tonalIcon(icon: Icon(LucideIcons.play), label: Text('Yeni Test Çöz'), onPressed: () => Navigator.of(context).pushNamed veya pop)`
     - `OutlinedButton.icon(icon: Icon(LucideIcons.layers), label: Text('Bilgi Kartlarına Git'), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FlashcardsScreen())))`
   - Böylece kullanıcı boş bir ekranda sıkışıp kalmaz; çalışma akışına anında devam eder.

ADIM 3: `FlashcardsScreen` (`lib/features/flashcards/presentation/flashcards_screen.dart`) Kart Tamamlama Köprüsü
1. Tüm kartlar gözden geçirildiğinde veya deste tamamlandığında:
   - Kartların altında beliren başarı kartına:
     - `FilledButton.icon(icon: Icon(LucideIcons.target), label: Text('Bu Konuyu Testle Pekiştir (10 Soru)'), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuizScreen(lessonFilter: _selectedLesson == 'Tümü' ? null : _selectedLesson, limit: 10))))`
   - Bu sayede hafıza kartını bitiren kullanıcı doğrudan o dersten 10 soruluk pekiştirme testine yönlendirilir.

ADIM 4: Test ve Doğrulama
1. `test/quiz_result_test.dart` dosyasını güncelle:
   - `wrongCount > 0` olduğunda 'Yanlış Defterine Git' butonunun göründüğünü ve tıklandığında `MistakesScreen`'in açıldığını test et.
   - `wrongCount == 0` olduğunda 'Bilgi Kartlarıyla Hızlı Tekrar' butonunun render edildiğini test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

## 🦅 16. Dalga 16: UWorld Çeldirici Tuzağı Formatı & Viral Zafer Karnesi (`TASK-51` - `TASK-52`)

KPSS adaylarına dershane hocalarından daha iyi soru çözüm mantığı sunan **"ÖSYM Çeldirici Tuzağı" (UWorld Modeli)** formatı ile sınav sonucunu Instagram/WhatsApp hikayelerinde paylaşarak sıfır reklam maliyetiyle organik kullanıcı çeken **"Zafer Karnesi"** görev paketleri:

---

### 📦 TASK-51: "ÖSYM Çeldirici Tuzağı" (UWorld Modeli) Açıklama Formatı & Çözüm Kartı Revizyonu

- **Durum:** ✅ **Tamamlandı** (2026-11-02)
- **Kapsam:**
  - `Question` modeline `distractorTrap` opsiyonel alanı, `copyWith`, `toJson` (`distractor_trap`), `fromJson` (hem snake_case hem camelCase desteği) eklendi.
  - `defaultSampleQuestions` (Tarih, Coğrafya, Vatandaşlık) zengin UWorld modeli çeldirici tuzak analizleriyle donatıldı.
  - `_ExplanationCard` bileşeni güncellendi; `distractorTrap` mevcut olduğunda altın/kehribar vurgulu (`tertiaryContainer`, `LucideIcons.triangleAlert`) "⚠️ ÖSYM ÇELDİRİCİ TUZAĞI" kartı gösterimi entegre edildi.
  - `test/question_test.dart` ve `test/quiz_screen_test.dart` testleri güncellendi, 95 testin tamamı yeşile ulaştı.

```text
GÖREV: TASK-51 — Question Modeline distractorTrap Eklenmesi, _ExplanationCard Çeldirici Bölümü ve Örnek Soru Zenginleştirmesi
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme ve textTheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `Question` Modelini Güncelle (`lib/features/quiz/data/models/question.dart`)
1. `Question` sınıfına opsiyonel alan ekle:
   ```dart
   final String? distractorTrap;
   ```
2. Constructor'a `this.distractorTrap,` parametresini ekle.
3. `copyWith` metoduna `String? distractorTrap` ekle.
4. `toJson` içine `'distractor_trap': distractorTrap,` ekle.
5. `fromJson` içine:
   ```dart
   distractorTrap: json['distractor_trap'] as String? ?? json['distractorTrap'] as String?,
   ```
   ekleyerek hem Supabase `snake_case` hem de yerel JSON `camelCase` için geriye dönük uyumlu hale getir.

ADIM 2: `defaultSampleQuestions` Örnek Sorularını Zenginleştir (`lib/features/quiz/presentation/quiz_screen.dart`)
1. `defaultSampleQuestions` içindeki 3 soruya zengin `distractorTrap` metinleri ekle:
   - Tarih (tar_001): `'Uygurların yerleşik hayata geçmesiyle din ve alfabe değişmiş, tapınak mimarisi başlamıştır. Ancak Kut anlayışı (egemenliğin kaynağının ilahi olması) İslamiyet öncesi Türk devletlerinin tamamında olduğu gibi Uygurlarda da aynen devam etmiştir. ÖSYM adayın 'din değiştiyse yönetim anlayışı da değişmiştir' ön yargısını en büyük çeldirici olarak kullanır.'`
   - Coğrafya (cog_001): `'Akdeniz Bölgesi'nde karstik şekillerin varlığı yağış miktarına DEĞİL, arazinin kolay eriyebilen kalkerli (kireçtaşı) kimyasal tortul kayaç yapısına bağlıdır. Karadeniz Akdeniz'den çok daha fazla yağış almasına rağmen karstik şekil azdır. ÖSYM 'yağış fazlalığı' şıkkını en sık kullanılan tuzak olarak koyar.'`
   - Vatandaşlık (vat_001): `'Çalışma ve sözleşme hürriyeti ile eğitim hakkı sosyal ve ekonomik haklardır (pozitif statü). Dilekçe ve vergi ise siyasi haklardır (aktif statü). Din ve vicdan hürriyeti ise devletin dahi dokunamayacağı negatif (koruyucu) statü hakkıdır. ÖSYM hak kategorilerini birbiriyle karıştırmayı çok sever.'`

ADIM 3: `_ExplanationCard` Bileşenine "⚠️ ÖSYM Çeldirici Tuzağı" Bölümü Ekle (`lib/features/quiz/presentation/quiz_screen.dart`)
1. `_ExplanationCard` parametrelerine opsiyonel `final String? distractorTrap;` ekle.
2. Kartın alt kısmına, eğer `distractorTrap != null && distractorTrap!.isNotEmpty` ise:
   - `const SizedBox(height: 12),`
   - `Container` oluştur:
     - Arka plan: `colorScheme.tertiaryContainer.withAlpha(90)`
     - Kenarlık: `Border.all(color: colorScheme.tertiary.withAlpha(150), width: 1.2)`
     - Köşe yuvarlama: `BorderRadius.circular(12)`
     - Padding: `const EdgeInsets.all(12)`
   - İçerik (`Column`, `crossAxisAlignment: CrossAxisAlignment.start`):
     - Başlık (`Row`):
       - `Icon(LucideIcons.triangleAlert, size: 16, color: colorScheme.onTertiaryContainer)`
       - `const SizedBox(width: 6)`
       - `Text('ÖSYM ÇELDİRİCİ TUZAĞI', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onTertiaryContainer, letterSpacing: 0.5))`
     - `const SizedBox(height: 6)`
     - Açıklama:
       - `Text(distractorTrap!, style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onTertiaryContainer, height: 1.4))`

ADIM 4: Test ve Doğrulama
1. `test/question_test.dart` içine `Question distractorTrap alanı serileştirilip geri okunabilmeli` birim testini ekle.
2. `test/quiz_screen_test.dart` içine soru cevaplandığında 'ÖSYM ÇELDİRİCİ TUZAĞI' başlığının ekranda render edildiğini doğrulayan widget testi ekle.
3. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-52: Instagram & WhatsApp Uyumlu 9:16 "Zafer Karnesi" Hikaye Paylaşım Kartı (`ShareVictoryCard`)

- **Durum:** ✅ **Tamamlandı** (2026-11-02)
- **Kapsam:**
  - `VictoryStoryCard` bileşeni (`lib/features/quiz/presentation/widgets/victory_story_card.dart`) 9:16 en-boy oranında, Kadro Koçu Tuğrul zafer maskotu, degrade arka plan, net göstergesi ve viral düello CTA'sı ile oluşturuldu.
  - `QuizResultScreen` üzerine "Zafer Karneni Paylaş 📸" butonu ve paylaşım modalı (`_showShareModal`) eklendi; pano kopyalama (`Clipboard.setData`) ve SnackBar bildirimi entegre edildi.
  - `QuizScreen`'den `QuizResultScreen`'e geçişte sınav başlığı (`testTitle`) aktarımı sağlandı.
  - `test/quiz_result_test.dart` içine widget testleri eklendi; 96 testin tamamı sıfır hatayla geçti.

```text
GÖREV: TASK-52 — QuizResultScreen Üzerine Zafer Karnesi Paylaşım Modalı ve Pano Kopyalama / Paylaşım Entegrasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme ve textTheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: 9:16 Instagram Story Formatında Zafer Kartı Bileşeni (`lib/features/quiz/presentation/widgets/victory_story_card.dart`)
1. `lib/features/quiz/presentation/widgets/victory_story_card.dart` dosyasını oluştur:
   - Sınıf: `class VictoryStoryCard extends StatelessWidget`
   - Parametreler: `final QuizResult result;`, `final String? testTitle;`
   - Yapı: `Dialog` veya `showModalBottomSheet` içinde gösterilebilecek, `AspectRatio(aspectRatio: 9 / 16)` oranında dikey hikaye kartı:
     - Dış çerçeve: `Container` (degrade arka plan: `LinearGradient(colors: [colorScheme.primary, colorScheme.surfaceContainerHighest], begin: Alignment.topCenter, end: Alignment.bottomCenter)`, `borderRadius: BorderRadius.circular(24)`, `border: Border.all(color: colorScheme.tertiary, width: 2)`)
     - İçindekiler (`Column`, `padding: const EdgeInsets.all(20)`):
       1. Üst Rozet: `Row(children: [Icon(LucideIcons.sparkles, color: colorScheme.tertiary), Text('KADRO · KPSS GENEL KÜLTÜR')])`
       2. Maskot: `Image.asset('assets/images/mascot/tugrul_victory.png', height: 100)`
       3. Test Başlığı: `Text(testTitle ?? 'Genel Kültür Testi', style: ...)`
       4. Dev Net Göstergesi: `Text('${result.net} NET', style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900, color: colorScheme.tertiary))`
       5. 3'lü Metrik Çubuğu: `Doğru: ${result.correctCount} | Yanlış: ${result.wrongCount} | Başarı: %${result.successRate}`
       6. Derece Rozeti: `result.net >= 45 ? '🦅 KADRO DERECE ADAYI' : '🎯 HEDEF 60'TA 60'`
       7. Alt Çağrı (Call-to-Action): `Container(padding: ..., child: Text('Benimle KPSS düellosuna var mısın? 📲 com.omer.kadro'))`

ADIM 2: `QuizResultScreen` (`lib/features/quiz/presentation/quiz_result_screen.dart`) Paylaşım Butonu Entegrasyonu
1. `_NetScoreCard` altına veya butonların üstüne:
   - `FilledButton.tonalIcon` ile:
     - `icon: const Icon(LucideIcons.share2, size: 18)`
     - `label: const Text('Zafer Karneni Paylaş 📸')`
     - `onPressed:` `_showShareModal(context)`
2. `_showShareModal(BuildContext context)` metodu içinde:
   - `showDialog` ile `VictoryStoryCard` gösterilir.
   - Dialog altında 2 buton:
     - `FilledButton.icon`:
       - `icon: const Icon(LucideIcons.copy, size: 16)`
       - `label: const Text('Skorumu & Metni Kopyala')`
       - Tıklandığında:
         ```dart
         await Clipboard.setData(ClipboardData(
           text: '🦅 Kadro KPSS Genel Kültür testimde ${result.net} NET yaptım! (%${result.successRate} Başarı). Hedef 2026 KPSS Derecesi! Sen de netini test et: https://kadro.app',
         ));
         if (context.mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('📸 Zafer metni panoya kopyalandı! Instagram veya WhatsApp durumunda paylaşabilirsin.')),
           );
         }
         ```
     - `TextButton`: `label: const Text('Kapat')`, `onPressed: () => Navigator.pop(context)`

ADIM 3: Test ve Doğrulama
1. `test/quiz_result_test.dart` dosyasını güncelle:
   - `QuizResultScreen` üzerinde 'Zafer Karneni Paylaş 📸' butonunun render edildiğini doğrula.
   - Butona tıklandığında `VictoryStoryCard` modalının açıldığını ve 'NET', 'KADRO · KPSS GENEL KÜLTÜR' metinlerinin ekranda olduğunu test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-53: Çerçevesiz & Büyük Pop-Out Maskot Tasarımı ve Derse Özel Tuğrul Varyasyonları

- **Durum:** ✅ **Tamamlandı** (2026-11-02)
- **Kapsam:**
  - `MascotCoachBanner` içindeki 84x84 piksellik kısıtlayıcı iç çerçeve kutusu (`Container(width: 84, height: 84, decoration: ...)`) kaldırıldı; yerine 100x100 büyük, çerçevesiz ve ferah pop-out düzeni getirildi.
  - `MascotMood` enum'u `history`, `geography`, `citizenship`, `current` mood'ları ile genişletildi; derse göre otomatik mood eşleyen `MascotMoodExtension.fromLesson(String? lesson)` eklendi.
  - `assets/images/mascot/` altına 4 derse özel görsel varlığı (`tugrul_history.png`, `tugrul_geography.png`, `tugrul_citizenship.png`, `tugrul_current.png`) eklendi.
  - `LessonTopicsScreen` içine derse özel Tuğrul karakteri ile karşılama rehberi entegre edildi.
  - `test/mascot_coach_banner_test.dart` eklendi; 99 testin tamamı 0 hatayla geçti.

```text
GÖREV: TASK-53 — MascotCoachBanner Çerçevesiz Pop-Out Dönüşümü ve 4 Temel KPSS Dersi İçin Tuğrul Varyasyonları Entegrasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme ve textTheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: Derse Özel Tuğrul Varlıkları ve Görseller
1. 4 adet derse özel Tuğrul PNG dosyasının assets klasöründe yer aldığını doğrula:
   - Tarih: `assets/images/mascot/tugrul_history.png`
   - Coğrafya: `assets/images/mascot/tugrul_geography.png`
   - Vatandaşlık: `assets/images/mascot/tugrul_citizenship.png`
   - Güncel Bilgiler: `assets/images/mascot/tugrul_current.png`
   (Mevcut görsel dosyası yoksa veya görsel üretilene kadar placeholder/fallback olarak mevcut `tugrul_coach.png` ve `tugrul_detective.png` kullanılarak hata fırlatması önlenir.)

ADIM 2: `MascotMood` Enum ve Yardımcı Metotların Genişletilmesi (`lib/shared/widgets/mascot_coach_banner.dart`)
1. `MascotMood` enum'una 4 yeni durum ekle:
   ```dart
   enum MascotMood {
     coach,
     victory,
     detective,
     pro,
     history,
     geography,
     citizenship,
     current,
   }
   ```
2. `MascotMoodExtension` içine yeni asset yollarını ve `fromLesson` fabrika fonksiyonunu ekle:
   ```dart
   extension MascotMoodExtension on MascotMood {
     String get assetPath {
       switch (this) {
         case MascotMood.coach:
           return 'assets/images/mascot/tugrul_coach.png';
         case MascotMood.victory:
           return 'assets/images/mascot/tugrul_victory.png';
         case MascotMood.detective:
           return 'assets/images/mascot/tugrul_detective.png';
         case MascotMood.pro:
           return 'assets/images/mascot/tugrul_pro.png';
         case MascotMood.history:
           return 'assets/images/mascot/tugrul_history.png';
         case MascotMood.geography:
           return 'assets/images/mascot/tugrul_geography.png';
         case MascotMood.citizenship:
           return 'assets/images/mascot/tugrul_citizenship.png';
         case MascotMood.current:
           return 'assets/images/mascot/tugrul_current.png';
       }
     }

     static MascotMood fromLesson(String? lesson) {
       final normalized = (lesson ?? '').toLowerCase().trim();
       if (normalized.contains('tarih')) return MascotMood.history;
       if (normalized.contains('coğrafya') || normalized.contains('cografya')) return MascotMood.geography;
       if (normalized.contains('vatandaşlık') || normalized.contains('vatandaslik')) return MascotMood.citizenship;
       if (normalized.contains('güncel') || normalized.contains('guncel')) return MascotMood.current;
       return MascotMood.coach;
     }
   }
   ```

ADIM 3: `MascotCoachBanner` Çerçevesiz (Frameless) ve Büyük Pop-Out Düzeni
1. `lib/shared/widgets/mascot_coach_banner.dart` dosyasındaki sol maskot container'ını revize et:
   - 84x84'lük `Container` çerçevesini, `border`, `borderRadius` ve `colorScheme.primaryContainer` arka planını kaldır.
   - Yerine doğrudan maskotun silüetini öne çıkaran `SizedBox(width: 96, height: 96)` veya `100x100` boyutunda şeffaf, çerçevesiz bir yapı koy.
   - `Image.asset(mood.assetPath, fit: BoxFit.contain)` kullan. Görsel bulunamazsa `errorBuilder` içinde `fallback` olarak `Icon(LucideIcons.award, size: 48)` göster.
   - Yanındaki parıltı (sparkles) rozetini çerçeveye bağlı kalmadan maskotun sağ alt köşesine zarif bir minyatür rozet olarak yerleştir.

ADIM 4: `LessonTopicsScreen` ve İlgili Sayfalarda Derse Özel Maskot Entegrasyonu
1. `lib/features/lessons/presentation/lesson_topics_screen.dart` dosyasında:
   - Eğer `MascotCoachBanner` kullanılıyorsa, mood parametresine `MascotMoodExtension.fromLesson(widget.lesson.title)` geçilmesini sağla.
   - Böylece Tarih konuları açıldığında otomatik olarak Tarih Tuğrul'u, Coğrafya konularında Coğrafya Tuğrul'u konuşsun.

ADIM 5: Test ve Doğrulama
1. `test/mascot_coach_banner_test.dart` (veya mevcut ilgili test dosyası) içine:
   - `MascotMoodExtension.fromLesson('Tarih') == MascotMood.history` doğrulaması,
   - `MascotMoodExtension.fromLesson('Coğrafya') == MascotMood.geography` doğrulaması,
   - Tüm yeni `MascotMood` değerlerinin geçerli ve boş olmayan `assetPath` döndürdüğünü doğrulayan birim testini ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```


---

### 📦 TASK-54: Mağaza Yayın Hazırlığı (App Icon, Splash Screen & Production Release Setup)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - `flutter_launcher_icons` paketi ile Tuğrul maskotumuzdan Android (Adaptive Icon) ve iOS için yüksek çözünürlüklü kurumsal uygulama ikonlarının üretilmesi.
  - `flutter_native_splash` paketi ile Academic Indigo (`#0F172A`) zeminli, ortasında Tuğrul Koç amblemi bulunan modern native açılış ekranı (Splash Screen) entegrasyonu.
  - Android Manifest ve iOS yapılandırmalarında uygulama adının `"Kadro: KPSS Genel Kültür"`, paket adının `com.omer.kadro` olarak standardize edilmesi.
  - `flutter analyze` ve derleme doğrulaması.

```text
GÖREV: TASK-54 — Kadro Mobil Uygulama İkonu, Splash Screen ve Mağaza Yapılandırması
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Renkleri design-system/kadro/MASTER.md doğrultusunda kullan.

ADIM 1: flutter_launcher_icons Yapılandırması
1. `pubspec.yaml` dosyasının `dev_dependencies` bölümüne `flutter_launcher_icons: ^0.14.3` ekle (veya güncel sürüm).
2. `pubspec.yaml` altına yapılandırmayı tanımla:
   ```yaml
   flutter_launcher_icons:
     android: "launcher_icon"
     ios: true
     image_path: "assets/images/mascot/tugrul_coach.png"
     min_sdk_android: 21
     adaptive_icon_background: "#0F172A"
     adaptive_icon_foreground: "assets/images/mascot/tugrul_coach.png"
   ```
3. `dart run flutter_launcher_icons` komutunu çalıştırarak ikonları otomatik ürettir.

ADIM 2: flutter_native_splash Yapılandırması
1. `pubspec.yaml` içine `flutter_native_splash: ^2.4.4` ekle.
2. `pubspec.yaml` altına native splash ayarlarını tanımla:
   ```yaml
   flutter_native_splash:
     color: "#0F172A"
     image: assets/images/mascot/tugrul_coach.png
     color_dark: "#0F172A"
     image_dark: assets/images/mascot/tugrul_coach.png
     android_12:
       color: "#0F172A"
       image: assets/images/mascot/tugrul_coach.png
   ```
3. `dart run flutter_native_splash:create` komutunu çalıştır.

ADIM 3: Manifest ve İsim Standardizasyonu
1. `android/app/src/main/AndroidManifest.xml` dosyasında `android:label` değerinin `"Kadro: KPSS Genel Kültür"` olduğunu doğrula.

ADIM 4: Doğrulama ve Test
1. Sırasıyla `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-55: Kadro PRO Çevrimdışı Soru & Deneme İndirme Motoru (Offline-First Sync & Pro Paywall Kilidi)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **Sadece Kadro PRO Üyelerine Özel:** Soru paketlerini ve 60 soruluk denemeleri çevrimdışı kullanım için cihaza indirme yetkisi (`isPro == true`). Ücretsiz üyeler çevrimdışı indirme butonuna bastığında `PaywallScreen` açılır.
  - `OfflineDownloadService` veri katmanı ile indirilen ders/deneme paketlerinin `LocalStorageService` içinde sıkıştırılmış JSON olarak saklanması.
  - `ExamsScreen` ve `LessonTopicsScreen` kartlarına PRO üyeler için tek tıkla "İndir ⬇️" / "Cihazda Hazır ✅" rozeti eklenmesi.
  - İnternet bağlantısı koptuğunda (`connectivity_plus` veya offline fallback) indirilmiş testlerin anında açılabilmesi, indirilmemiş içeriklerde ise zarif PRO yükseltme yönlendirmesi gösterilmesi.

```text
GÖREV: TASK-55 — Yalnızca Kadro PRO Üyelerine Özel Çevrimdışı Soru & Deneme İndirme Motoru (OfflineDownloadService + Paywall Köprüsü)
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme ve textTheme üzerinden al. Sabit Color(0xFF...) KULLANMA.

ADIM 1: OfflineDownloadService Veri Servisi (`lib/core/services/offline_download_service.dart`)
1. `OfflineDownloadService` sınıfını oluştur:
   - `Future<bool> isPackageDownloaded(String packageId)`
   - `Future<void> downloadPackage({required String packageId, required List<Question> questions, required bool isPro})`:
     - Eğer `!isPro` ise `ProRequiredException` fırlatır veya false döner.
     - PRO ise `LocalStorageService` içine `offline_pkg_$packageId` anahtarıyla soruları JSON olarak yazar.
   - `Future<List<Question>?> getDownloadedQuestions(String packageId)`
   - `Future<void> removeDownloadedPackage(String packageId)`
   - `Future<List<String>> getDownloadedPackageIds()`

ADIM 2: `LessonTopicsScreen` ve `ExamsScreen` Üzerine İndirme Aksiyonu
1. Deneme veya konu kartı üzerine indirme ikonu (`LucideIcons.download` / `LucideIcons.checkCircle`):
   - Tıklandığında:
     - `ref.read(userPreferencesProvider).isPro` kontrolü yapılır.
     - Eğer kullanıcı PRO DEĞİLSE:
       `Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));`
       ile Kadro PRO Paywall ekranı açılır ve SnackBar ile:
       *"🔒 Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir."* bilgisi verilir.
     - Eğer kullanıcı PRO İSE:
       Paket arka planda indirilir ve buton "Cihazda Hazır ✅" durumuna geçer.

ADIM 3: Çevrimdışı Durumda Akıllı Açılış Kuralı
1. İnternet yokken indirilen bir pakete tıklandığında soru motoru doğrudan `OfflineDownloadService` üzerindeki yerel sorularla başlar.
2. İndirilmemiş bir pakete internetsiz tıklandığında:
   *"Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir."* diyalogu gösterilir.

ADIM 4: Test ve Doğrulama
1. `test/offline_download_test.dart` dosyasını oluştur:
   - PRO olmayan kullanıcının indirme yapamadığını ve Paywall kuralını test et.
   - PRO kullanıcının soruları yerel depolamaya başarıyla kaydedip geri okuduğunu doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-56: "De-AI" Tasarım ve Renk Restorasyonu: Yapay Zeka Morundan Kurtulma, Prestijli Devlet & Akademi Laciverti (`#1E3A5F`) ve Pedagojik UI Standartları

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **Yapay Zeka Morunun / Tailwind İndigo'sunun Sökülmesi:** Bütün AI şablonlarının varsayılan rengi olan `#4F46E5` (İndigo), `#818CF8` (Lila) ve `#312E81` (Koyu mor) tonlarının projeden tamamen temizlenmesi.
  - **Prestijli Devlet & Akademi Kimliğine Geçiş:** Türkiye Cumhuriyeti kamu personeli hazırlık ciddiyetine yakışan, Harvard/Oxford veya köklü kamu kurumlarının asaletini taşıyan **Devlet & Akademi Gece Laciverti (`#1E3A5F`)**, ferah fildişi/buz beyazı (`#F0F4F8`), odaklanmayı artıran Zümrüt Yeşili (`#0D9488`) ve tok Başarı Altını (`#D97706`) paletine geçiş.
  - **"Sparkles (✨)" İkon Enflasyonunun Temizlenmesi:** Yapay zeka çıktısı olduğunu ele veren jenerik `LucideIcons.sparkles` ikonlarının yerine gerçek pedagojik ikonların konulması:
    - Öğrenme Modu rozeti (`_QuizModeBadge`): `LucideIcons.sparkles` ➡️ `LucideIcons.lightbulb` (Aydınlanma / Öğrenme)
    - Tuğrul maskot rozeti (`MascotCoachBanner`): `LucideIcons.sparkles` ➡️ `LucideIcons.award` (Başarı Rozeti)
    - Güncel Bilgiler ders ikonu (`kpss_lessons.dart`): `LucideIcons.sparkles` ➡️ `LucideIcons.flame` (Gündem Ateşi) veya `LucideIcons.newspaper`
    - Zafer Karnesi (`VictoryStoryCard`): `LucideIcons.sparkles` ➡️ `LucideIcons.trophy` (Kupa / Derece)
    - Onboarding bitiş butonu (`OnboardingScreen`): `LucideIcons.sparkles` ➡️ `LucideIcons.compass` (Yol Haritası)
  - **Neon/Glow Mor Parıltıların Kaldırılması:** Kart kenarlıklarındaki ve butonlardaki yapay zeka ürünü yarı-saydam mor parlamaların kaldırılması; temiz, yüksek kontrastlı ve göz yormayan sınav ortamı hissinin kazandırılması.

```text
GÖREV: TASK-56 — "De-AI" Tasarım ve Renk Restorasyonu (Devlet & Akademi Laciverti, İnsan Eliyle Tasarlanmış Doğal Palet ve AI Klişelerinden Arınma)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Renkleri Theme.of(context).colorScheme ve textTheme üzerinden al. Sabit Color(0xFF...) yalnızca lib/app/theme.dart içinde tanımlanabilir. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `lib/app/theme.dart` İçinde "De-AI" Prestij Paletine Geçiş
1. Marka renk sabitlerini revize et:
   - `seedColor`: `Color(0xFF1E3A5F)` (Academic & State Navy - Asil Gece Laciverti; eski #4F46E5 moru yerine)
   - `secondaryColor`: `Color(0xFF0D9488)` (Academic Emerald Teal - Zümrüt Yeşili)
   - `tertiaryColor`: `Color(0xFFD97706)` (Achievement Amber Gold - Tok Başarı Altını)
   - `darkPrimaryColor`: `Color(0xFF38BDF8)` (Sky/Steel Blue - Çelik Mavisi; eski #818CF8 lila/mor yerine)
   - `darkSecondaryColor`: `Color(0xFF2DD4BF)` (Teal)
   - `darkTertiaryColor`: `Color(0xFFFBBF24)` (Gold)
2. `light` tema ayarlarını revize et:
   - `primary`: `Color(0xFF1E3A5F)`
   - `primaryContainer`: `Color(0xFFF0F4F8)` (Eski lavanta/mor #EEF2FF yerine steril açık fildişi/buz kağıt tonu)
   - `onPrimaryContainer`: `Color(0xFF0C2138)`
   - `scaffoldBackgroundColor`: `Color(0xFFF8FAFC)`
   - `cardColor`: `Color(0xFFFFFFFF)`
   - `surfaceContainerLow`: `Color(0xFFF8FAFC)`
   - `surfaceContainerHighest`: `Color(0xFFF1F5F9)`
   - `outlineVariant`: `Color(0xFFE2E8F0)`
3. `dark` tema ayarlarını revize et:
   - `primary`: `Color(0xFF38BDF8)` (Eski mor yerine tok çelik mavisi)
   - `primaryContainer`: `Color(0xFF172A45)` (Eski #312E81 mor yerine derin gece mavisi)
   - `onPrimaryContainer`: `Color(0xFFE0F2FE)`
   - `appBarColor`: `Color(0xFF0B1120)` (Eski morumsu #0F172A yerine saf gece laciverti)
   - `scaffoldBackgroundColor`: `Color(0xFF0B1120)`
   - `cardColor`: `Color(0xFF1E293B)`

ADIM 2: `design-system/kadro/MASTER.md` Dosyasını Güncelleme
1. Tasarım sistemi dosyasındaki renk tanımlarını `Academic Royal Indigo (#4F46E5)` yerine `Devlet & Akademi Gece Laciverti (#1E3A5F)` olarak güncelle ve palet gerekçesini "De-AI: Saygın kamu ve akademi kimliği" olarak belgele.

ADIM 3: AI Sparkles (✨) İkon Enflasyonunu Temizleme
1. `lib/features/quiz/presentation/quiz_screen.dart`:
   - `_QuizModeBadge` içinde `isExam ? LucideIcons.fileText : LucideIcons.sparkles` satırını:
     `isExam ? LucideIcons.fileText : LucideIcons.lightbulb` olarak değiştir (Öğrenme modu ampul/aydınlanma ikonu alır).
2. `lib/shared/widgets/mascot_coach_banner.dart`:
   - Tuğrul maskotunun sağ altındaki mini rozet ikonunu `LucideIcons.sparkles` yerine `LucideIcons.award` yap.
3. `lib/features/lessons/data/kpss_lessons.dart`:
   - Güncel Bilgiler dersinin ikonunu `LucideIcons.sparkles` yerine `LucideIcons.flame` veya `LucideIcons.newspaper` yap.
4. `lib/features/quiz/presentation/widgets/victory_story_card.dart`:
   - Üst rozet ikonunu `LucideIcons.sparkles` yerine `LucideIcons.trophy` yap.
5. `lib/features/onboarding/presentation/onboarding_screen.dart`:
   - Tamamlama butonu ikonunu `LucideIcons.sparkles` yerine `LucideIcons.compass` yap.
6. `lib/features/games/presentation/true_false_blitz_screen.dart`:
   - Kombo rozetlerindeki `LucideIcons.sparkles` ikonunu `LucideIcons.zap` yap.

ADIM 4: Test ve Doğrulama
1. `test/mascot_coach_banner_test.dart` içindeki `LucideIcons.sparkles` beklentisini `LucideIcons.award` olarak güncelle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-57: Gelişmiş Kimlik Doğrulama: Google ile Giriş (OAuth), E-posta / Kullanıcı Adı ile Esnek Giriş-Kayıt & Şifre Sıfırlama

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **Google ile Giriş (OAuth):** `AuthScreen` içine resmi Google logolu "Google ile Devam Et" butonu eklenmesi; `AuthNotifier` içinde Supabase OAuth (`client.auth.signInWithOAuth(OAuthProvider.google)`) entegrasyonu ve demo/test fallback koruması.
  - **Esnek Giriş (E-posta VEYA Kullanıcı Adı):** Giriş alanında adayın ister e-postasını (`ornek@gmail.com`), ister sadece kullanıcı adını/rumuzunu (`ornek_kpss`) yazabilmesi. `@` içermeyen girdilerin arka planda sanal domainle (`username@kadro.internal` / metadata eşlemesi) sorunsuz giriş yapabilmesi.
  - **Esnek Kayıt (Signup):** Kullanıcı adı / rumuz, e-posta (opsiyonel veya otomatik kullanıcı adı eşlemesi) ve en az 6 karakterli şifre ile anında hesap oluşturma.
  - **Şifremi Unuttum (Forgot Password) Modalı:** Giriş formuna "Şifremi Unuttum" butonu; tıklandığında açılan alt sayfada (`showModalBottomSheet`) e-posta girilerek `resetPasswordForEmail` ile sıfırlama bağlantısı gönderilmesi.
  - **Misafir Verisi Bulut Birleştirme (Cloud Sync on Login):** Giriş yapıldığı anda yereldeki misafir çalışma verilerinin (çözülen testler, XP, seri, çalışma planı) kullanıcının Supabase hesabıyla otomatik senkronize edilmesi.

```text
GÖREV: TASK-57 — AuthScreen ve AuthNotifier Gelişmiş Kimlik Doğrulama (Google OAuth, E-posta / Kullanıcı Adı Hibrit Giriş, Şifremi Unuttum)
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme ve textTheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: AuthNotifier İçinde Google OAuth ve Hibrit E-posta/Kullanıcı Adı Mantığı (`lib/features/auth/data/auth_notifier.dart`)
1. `_normalizeIdentifier(String identifier)` yardımcı fonksiyonunu ekle:
   - Eğer `identifier.contains('@')` ise `identifier.trim().toLowerCase()` döner.
   - Eğer `@` İÇERMİYORSA (kullanıcı adı girilmişse), `identifier.trim().toLowerCase() + '@kadro.internal'` sanal e-posta adresini döner.
2. `signIn({required String emailOrUsername, required String password})`:
   - `final effectiveEmail = _normalizeIdentifier(emailOrUsername);` ile sorgula.
   - Kullanıcı adı veya e-posta girildiğinde Supabase `signInWithPassword` ile sorunsuz oturum açsın.
   - Demo/test ortamında `client == null` iken geçerli parola (>=6) durumunda `displayName` olarak kullanıcı adını atasın ve giriş yapsın.
3. `signInWithGoogle()` metodunu ekle:
   ```dart
   Future<bool> signInWithGoogle() async {
     state = state.copyWith(isLoading: true, errorMessage: null);
     final client = SupabaseConfig.clientOrNull;
     if (client == null) {
       // Demo / Test ortamı fallback
       state = state.copyWith(
         isAuthenticated: true,
         userId: 'google_demo_user',
         email: 'demo_kpss@gmail.com',
         displayName: 'Google ile Giriş Yapan Aday',
         isLoading: false,
       );
       ref.read(studyStatsProvider.notifier).loadFromCloud();
       unawaited(ref.read(studyPlannerProvider.notifier).loadTasksFromCloud());
       return true;
     }
     try {
       final res = await client.auth.signInWithOAuth(
         OAuthProvider.google,
         redirectTo: kIsWeb ? null : 'com.omer.kadro://login-callback',
       );
       state = state.copyWith(isLoading: false);
       return res;
     } catch (e) {
       state = state.copyWith(isLoading: false, errorMessage: 'Google ile giriş hatası: ${e.toString()}');
       return false;
     }
   }
   ```
4. `sendPasswordResetEmail(String email)` metodunu ekle:
   ```dart
   Future<bool> sendPasswordResetEmail(String email) async {
     final client = SupabaseConfig.clientOrNull;
     if (client == null) return true; // Demo fallback
     try {
       await client.auth.resetPasswordForEmail(email.trim());
       return true;
     } catch (e) {
       state = state.copyWith(errorMessage: 'Şifre sıfırlama bağlantısı gönderilemedi: ${e.toString()}');
       return false;
     }
   }
   ```

ADIM 2: `AuthScreen` Arayüzünün Zenginleştirilmesi (`lib/features/auth/presentation/auth_screen.dart`)
1. Tek Girdi Alanı:
   - Giriş modunda (`_isLogin`) alanın etiketini `"E-posta veya Kullanıcı Adı"` yap (`prefixIcon: Icon(LucideIcons.user, size: 20)`).
   - Validatörde sadece boş olmama ve en az 3 karakter kontrolü yap (`!value.contains('@')` kısıtlamasını kaldır!).
2. Şifremi Unuttum Bağlantısı ve Modalı:
   - Şifre alanının hemen altına sağa dayalı `Align(alignment: Alignment.centerRight, child: TextButton(onPressed: _showForgotPasswordModal, child: Text('Şifremi Unuttum?')))` ekle.
   - `_showForgotPasswordModal(BuildContext context)` fonksiyonu bir `showModalBottomSheet` açsın. İçinde e-posta input'u ve "Sıfırlama Bağlantısı Gönder" butonu olsun. Başarılı olunca yeşil SnackBar ile bildirim versin.
3. Google ile Devam Et Butonu:
   - Giriş ve Kayıt formunun altına veya üstüne ayırıcı çizgi ile ("VEYA"):
     ```dart
     Row(children: [
       Expanded(child: Divider()),
       Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('VEYA', style: theme.textTheme.labelSmall)),
       Expanded(child: Divider()),
     ])
     ```
   - Altına `OutlinedButton.icon` ile Google butonu ekle:
     - İkon: Google resmi renklerini temsil eden `Container` veya `LucideIcons.chrome` / renkli Google SVG/ikoni.
     - Etiket: `Text('Google ile Devam Et')`
     - Tıklandığında: `ref.read(authProvider.notifier).signInWithGoogle();` çağırsın, başarılı olursa `Navigator.pop(context)` yapsın.
4. "Misafir Olarak Devam Et" Bağlantısı:
   - Formun en altına ekle: `TextButton(onPressed: () => Navigator.pop(context), child: Text('Şimdilik Giriş Yapmadan Devam Et'))`.

ADIM 3: Test ve Doğrulama
1. `test/auth_screen_test.dart` içine:
   - Kullanıcı adı ile giriş yapılabilmesi testi,
   - Google ile giriş butonunun ekranda render edilmesi ve tıklanabilmesi testi,
   - Şifremi unuttum modalının açıldığını doğrulayan widget testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-58: Dikkat Çekici & Motive Edici Test Zorluk Rozetleri (Basit Alıştırma, Sınav Ayarı, Net Sıçratan, Kurtlar Sofrası / ÖSYM Tuzağı)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - `TopicTestsScreen` ve `QuizScreen` üzerinde yer alan sıkıcı akademik etiketlerin ("Temel Seviye", "Kavrama Seviyesi", "Pekiştirme", "Usta") kaldırılarak adayın dikkatini çeken, tıklama arzusunu artıran 4 seviyeli dinamik rozet sistemine geçilmesi:
    1. **Seviye 1 (<= 1.4):**
       - Rozet Adı: `🌱 Basit Alıştırma (Isınma Turu)`
       - İkon: `LucideIcons.sprout` (Filiz / Başlangıç)
       - Açıklama: *"Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları."*
       - Tema Rozeti: `colorScheme.secondary` (Zümrüt Yeşili) zemin ve yazı
    2. **Seviye 2 (1.4 - 2.2):**
       - Rozet Adı: `🏛️ Tam Sınav Ayarı (ÖSYM Formatı)`
       - İkon: `LucideIcons.target` (Hedef)
       - Açıklama: *"Gerçek KPSS kitapçığında karşına çıkacak standart soru kalıpları."*
       - Tema Rozeti: `colorScheme.primary` (Devlet & Akademi Laciverti) zemin ve yazı
    3. **Seviye 3 (2.2 - 2.6):**
       - Rozet Adı: `⚡ Net Sıçratan (Derece Soruları)`
       - İkon: `LucideIcons.zap` (Şimşek)
       - Açıklama: *"Adayların %70'ini eleyen, puanı doğrudan yukarı taşıyan ayırt edici sorular."*
       - Tema Rozeti: `colorScheme.tertiary` (Tok Başarı Altını) zemin ve yazı
    4. **Seviye 4 (> 2.6):**
       - Rozet Adı: `🔥 Kurtlar Sofrası (ÖSYM Mayın Tarlası)`
       - İkon: `LucideIcons.flame` (Alev)
       - Açıklama: *"En çok düşülen çeldirici tuzaklar ve ters köşe yapan ÖSYM soruları."*
       - Tema Rozeti: `colorScheme.error` (Tok Kırmızı) zemin ve yazı
  - `lib/features/lessons/presentation/topic_tests_screen.dart` içindeki hardcoded `Colors.green`, `Colors.amber`, `Colors.orange`, `Colors.red` renklerinin tamamen temizlenip `Theme.of(context).colorScheme` ile uyumlu container renklerine dönüştürülmesi (GEMINI.md kuralı).
  - `QuizScreen` başlatılırken özel başlıkta bu dikkat çekici zorluk rozetinin taşınması (Örn: `Tarih · İlk Türk Devletleri · Test 1 (Basit Alıştırma)`).

```text
GÖREV: TASK-58 — TopicTestsScreen ve QuizScreen Dikkat Çekici Zorluk Rozetleri ve ColorScheme Entegrasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Sabit Color(0xFF...) veya Colors.red gibi hardcoded renkler KULLANMA. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: TestZorlukSeviyesi Modeli & Yardımcısı (`lib/features/quiz/data/models/test_difficulty_tier.dart`)
1. Temiz mimari için `TestDifficultyTier` adında bir model veya enum yardımcısı oluştur:
   ```dart
   enum TestDifficultyTier {
     warmup,      // Basit Alıştırma (Isınma Turu)
     standard,    // Tam Sınav Ayarı (ÖSYM Formatı)
     distinction, // Net Sıçratan (Derece Soruları)
     trapMaster,  // Kurtlar Sofrası (ÖSYM Mayın Tarlası)
   }

   extension TestDifficultyTierExtension on TestDifficultyTier {
     String get title {
       switch (this) {
         case TestDifficultyTier.warmup:
           return '🌱 Basit Alıştırma (Isınma Turu)';
         case TestDifficultyTier.standard:
           return '🏛️ Tam Sınav Ayarı (ÖSYM Formatı)';
         case TestDifficultyTier.distinction:
           return '⚡ Net Sıçratan (Derece Soruları)';
         case TestDifficultyTier.trapMaster:
           return '🔥 Kurtlar Sofrası (ÖSYM Mayın Tarlası)';
       }
     }

     String get description {
       switch (this) {
         case TestDifficultyTier.warmup:
           return 'Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları.';
         case TestDifficultyTier.standard:
           return 'Gerçek KPSS kitapçığında karşına çıkacak standart soru kalıpları.';
         case TestDifficultyTier.distinction:
           return 'Adayların %70\'ini eleyen, puanı doğrudan yukarı taşıyan ayırt edici sorular.';
         case TestDifficultyTier.trapMaster:
           return 'En çok düşülen çeldirici tuzaklar ve ters köşe yapan ÖSYM soruları.';
       }
     }

     IconData get icon {
       switch (this) {
         case TestDifficultyTier.warmup:
           return LucideIcons.sprout;
         case TestDifficultyTier.standard:
           return LucideIcons.target;
         case TestDifficultyTier.distinction:
           return LucideIcons.zap;
         case TestDifficultyTier.trapMaster:
           return LucideIcons.flame;
       }
     }

     static TestDifficultyTier fromAvgDifficulty(double avg) {
       if (avg <= 1.4) return TestDifficultyTier.warmup;
       if (avg <= 2.2) return TestDifficultyTier.standard;
       if (avg <= 2.6) return TestDifficultyTier.distinction;
       return TestDifficultyTier.trapMaster;
     }
   }
   ```

ADIM 2: `TopicTestsScreen` Kartlarında Rozetlerin ve Renklerin Revizyonu (`lib/features/lessons/presentation/topic_tests_screen.dart`)
1. `_buildTestCard` içindeki hesaplamayı `TestDifficultyTierExtension.fromAvgDifficulty(avgDifficulty)` ile bağla.
2. Hardcoded `Colors.green`, `Colors.amber` vb. kaldır:
   - `warmup`: Arka plan `colorScheme.secondaryContainer`, yazı/ikon `colorScheme.onSecondaryContainer`
   - `standard`: Arka plan `colorScheme.primaryContainer`, yazı/ikon `colorScheme.onPrimaryContainer`
   - `distinction`: Arka plan `colorScheme.tertiaryContainer`, yazı/ikon `colorScheme.onTertiaryContainer`
   - `trapMaster`: Arka plan `colorScheme.errorContainer`, yazı/ikon `colorScheme.onErrorContainer`
3. Kartın altındaki soru sayısı satırının yanına veya altına `tier.description` açıklama metnini ekle (`textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)`).
4. `_startTest` çağrısında `customTitle` formatını güncelle:
   `${widget.lessonName} · ${widget.topic} · Test ${testIndex + 1} (${tier.title.split(' ').sublist(1).join(' ')})`

ADIM 3: Test ve Doğrulama
1. `test/topic_tests_screen_test.dart` dosyasını güncelle:
   - Yeni başlıkların (`Basit Alıştırma`, `Tam Sınav Ayarı` vb.) doğru tier mantığıyla render edildiğini doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-59: Tüm Sistemde Duyarlı & Uyarlanabilir Ekran (Responsive & Adaptive) Mimarisi (Kompakt Telefon, Standart Telefon, Tablet & Katlanabilir)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - `ui-ux-pro-max` disipliniyle projenin tüm ekranlarında küçük telefonlar (`< 380px` genişlik veya `< 720px` yükseklik) ve büyük tabletler (`>= 600px`) için kusursuz bir adaptif yerleşim kurgulanması.
  - **Kompakt Telefon İyileştirmeleri (<380px — iPhone SE / mini / 360px Android):**
    - Sayfa yatay padding değerinin `12px`'e çekilmesi (16-20px yerine), böylece kart içi alanın genişletilmesi.
    - `MascotCoachBanner` bileşeninde maskot boyutunun `72-80px`'e esnetilmesi ve dikey yüksekliğin optimize edilmesi; adayın çalışma kartlarını ekranı kaydırmadan ilk bakışta (above the fold) görebilmesi.
    - `HomeScreen` 2x2 Bento Grid ve `_DailyGoalCard` bileşenlerinde `Flexible` / `Expanded` koruması; dairesel göstergenin 72px'e indirilmesi; sıfır taşma (`RenderFlex overflow`).
    - `QuizScreen` üzerinde soru metni ve şıkların küçük dikey ekranlarda butonları aşağı taşırmaması için esnek kaydırma ve kompakt buton çubuğu düzeni.
  - **Tablet & Büyük Ekran İyileştirmeleri (>=600px — iPad / Tablet / Katlanabilir):**
    - **Maksimum İçerik Kısıtı (`ConstrainedBox(maxWidth: 720)`):** Metinlerin ve test kartlarının 1000px boyunca sündürülmesini önlemek için içeriğin merkezlenmesi (ui-ux-pro-max `container-width: 65-75ch` kuralı).
    - Bento Grid ve Test listelerinin tablet ekranında 2 sütundan 3 veya 4 sütuna adaptif olarak açılması (`LayoutBuilder` veya `ResponsiveGrid`).
    - Dialog ve Modal BottomSheet'lerin tabletlerde devasa yayılmasını önleyen `maxWidth: 480-520px` modal pencere kısıtı.
  - **Responsive Yardımcı Katmanı (`lib/core/utils/responsive_layout.dart`):**
    - `ResponsiveBreakpoints` (isCompact, isMobile, isTablet) ve `ResponsiveContentWrapper` bileşeninin oluşturulması.

```text
GÖREV: TASK-59 — Tüm Sistemde Duyarlı & Uyarlanabilir Ekran (Responsive & Adaptive) Mimarisi (Kompakt Telefon, Standart Telefon, Tablet)
ÖNEMLİ: GEMINI.md, design-system/kadro/MASTER.md ve ui-ux-pro-max kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: Responsive Kırılım ve Konteyner Yardımcısı (`lib/core/utils/responsive_layout.dart`)
1. `lib/core/utils/responsive_layout.dart` dosyasını oluştur:
   - `ResponsiveBreakpoints` utility sınıfı:
     - `static bool isCompact(BuildContext context) => MediaQuery.sizeOf(context).width < 380 || MediaQuery.sizeOf(context).height < 720;`
     - `static bool isTablet(BuildContext context) => MediaQuery.sizeOf(context).width >= 600;`
     - `static double horizontalPadding(BuildContext context) => isCompact(context) ? 12.0 : (isTablet(context) ? 24.0 : 16.0);`
   - `ResponsiveContentWrapper` StatelessWidget:
     - İçeriği `Center` ve `ConstrainedBox(constraints: BoxConstraints(maxWidth: 720))` ile sarar; tablette merkezler, telefonda tam genişlik verir.

ADIM 2: `HomeScreen` ve Bento Grid'in Kompakt Telefon & Tablet Uyarlaması (`lib/features/home/presentation/home_screen.dart`)
1. `HomeScreen` gövdesini `ResponsiveContentWrapper` ile sar.
2. `_DailyGoalCard`:
   - `isCompact`: Dairesel gauge boyutunu 84'ten 72'ye çek. Metrik haplarını (`Doğru`, `Yanlış`, `Net`) `Wrap` veya `Flexible` ile sıkışmasız kıl.
3. 2x2 Bento Grid:
   - Tablet modunda (`isTablet`): Grid'i 2 sütun yerine 3 veya 4 sütuna genişlet (`crossAxisCount: isTablet ? 4 : 2`).
   - Kompakt modda (`isCompact`): `crossAxisSpacing: 8`, `mainAxisSpacing: 8` ve iç dolguyu `12px` yap.

ADIM 3: `MascotCoachBanner` Kompakt Ekran Uyarlaması (`lib/shared/widgets/mascot_coach_banner.dart`)
1. `isCompact(context)` kontrolü ekle:
   - Normal ekranda: `92x92` çerçeve, `16px` padding.
   - Kompakt ekranda: `72x72` çerçeve, `12px` padding, başlık ve mesaj yazı boyutu bir tık küçültülerek dikey yer kaplaması azaltılır.

ADIM 4: `QuizScreen` ve `TopicTestsScreen` Kompakt Ekran & Tablet Koruması
1. `QuizScreen`:
   - Soru kökü ve şıkları `ResponsiveContentWrapper` ile sar (tablette devasa yayılmayı önle).
   - Kompakt ekranda şıkların (`OptionTile`) dikey padding'ini 10-12px yaparak küçük ekranlarda butonların taşmasını engelle.
2. `TopicTestsScreen`:
   - Kartları tablette `maxWidth: 720` ile merkezle veya iki sütunlu listele.
   - Test başlığı ve zorluk rozetinin kompakt telefonda (`<380px`) yan yana sığmadığı durumlarda `Wrap` veya iki satırlı esnek `Column` akışına izin ver.

ADIM 5: Test ve Doğrulama
1. `test/responsive_layout_test.dart` dosyasını oluştur:
   - Kompakt telefon boyutunda (`360x640`) `HomeScreen` ve `QuizScreen` render edildiğinde sıfır taşma (`RenderFlex`) doğrulaması yap.
   - Tablet boyutunda (`800x1280`) `ResponsiveContentWrapper`'ın içeriği 720px ile sınırlandırdığını test et.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-60: Ders Kartlarında Dairesel İlerleme Halkası (Animated Lesson Progress Ring) & Çözülen Test Oranı Göstergesi

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - `LessonsScreen` içindeki statik `44x44` ders ikonu kutusunun, `ui-ux-pro-max` disipliniyle **Duolingo/Apple Watch Aktivite Halkası** tarzında animasyonlu bir **Dairesel İlerleme Halkası (`LessonProgressRing`)** bileşeni ile sarmalanması.
  - **Dairesel İlerleme Mimarisi:**
    - Dış çap: `54x54` dp.
    - İçerik: Merkezde dersin kendi ikonu (`lesson.icon`).
    - Arka plan izi (Track): `colorScheme.surfaceContainerHighest` veya `colorScheme.outlineVariant.withAlpha(70)`, kalınlık `3.5px`.
    - İlerleme yayı (Indicator):
      - Oran: `çözülenTestSayısı / toplamTestSayısı` (Örn: `10 / 65` = `%15.3`).
      - Renk: `colorScheme.secondary` (Akademik Zümrüt Yeşili) veya `colorScheme.primary` (Devlet & Akademi Laciverti).
      - Uç bitişi: `StrokeCap.round` (Yumuşak dairesel bitiş).
    - Tamamlanma Durumu (%100): Halka tam çember olur, sağ altta zümrüt minyatür tik rozeti (`LucideIcons.checkCheck`) belirir.
  - **Animasyon:** Sayfa açıldığında `TweenAnimationBuilder<double>` ile `800ms` sürede sıfırdan hedefe akıcı dolum (`Curves.easeOutCubic`).
  - **Kart İçi Metin & Veri Gösterimi:**
    - Kartın başlık satırının altında veya sağ üst köşesinde: `10 / 65 Test Tamamlandı (%15)` tactile ilerleme rozeti.
    - Henüz başlanmamış derslerde: `0 / X Test (%0)` ve adayı harekete geçiren `Hemen Başla ▶` çağrısı.
  - **Veri Kaynağı:**
    - `LessonsScreen`'in `ConsumerWidget` yapılması.
    - `StudyStatsNotifier` (`studyStatsProvider`) üzerindeki çözülen soru/oturum istatistikleri ve soru havuzundaki toplam test sayısıyla dinamik hesaplanması.

```text
GÖREV: TASK-60 — LessonsScreen Ders Kartlarında Animasyonlu Dairesel İlerleme Halkası (LessonProgressRing) ve Çözülen Test Sayacı
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `LessonProgressRing` Bileşeninin Oluşturulması (`lib/features/lessons/presentation/widgets/lesson_progress_ring.dart`)
1. `lib/features/lessons/presentation/widgets/lesson_progress_ring.dart` dosyasını oluştur:
   - Sınıf: `class LessonProgressRing extends StatelessWidget`
   - Parametreler: `final IconData icon`, `final double progress` (0.0 - 1.0), `final int solvedCount`, `final int totalCount`, `final double size = 52.0`
   - Yapı:
     - `TweenAnimationBuilder<double>(tween: Tween(begin: 0.0, end: progress.clamp(0.0, 1.0)), duration: const Duration(milliseconds: 800), curve: Curves.easeOutCubic)`
     - İçinde `Stack` (`alignment: Alignment.center`):
       1. Dairesel Ray ve İlerleme:
          - `SizedBox(width: size, height: size, child: CircularProgressIndicator(value: animatedValue, strokeWidth: 3.5, strokeCap: StrokeCap.round, backgroundColor: colorScheme.surfaceContainerHighest, color: colorScheme.secondary))`
       2. Merkez İkon:
          - `Container(width: size - 10, height: size - 10, decoration: BoxDecoration(color: colorScheme.primaryContainer, shape: BoxShape.circle), child: Icon(icon, size: 22, color: colorScheme.onPrimaryContainer))`
       3. %100 Tamamlanma Rozeti (Eğer `progress >= 1.0`):
          - `Positioned(bottom: 0, right: 0, child: Container(padding: const EdgeInsets.all(2), decoration: BoxDecoration(color: colorScheme.secondary, shape: BoxShape.circle, border: Border.all(color: colorScheme.surface, width: 1.5)), child: Icon(LucideIcons.checkCheck, size: 10, color: colorScheme.onSecondary)))`

ADIM 2: `LessonsScreen` Kartlarının Canlandırılması (`lib/features/lessons/presentation/lessons_screen.dart`)
1. `LessonsScreen` ve `_LessonCard` bileşenlerini `ConsumerWidget` yap.
2. `ref.watch(studyStatsProvider)` üzerinden verileri al:
   - Örnek: `final solvedCount = stats.sessionHistory.where((s) => s.lesson == lesson.name).length;` (veya `solvedByLesson[lesson.name] / 10`).
   - Toplam test tahmini: `final totalTests = lesson.topics.length * 5;` (veya dersteki soru havuzunun 10'arlı bölünmüş karşılığı).
   - `final progress = totalTests > 0 ? (solvedCount / totalTests).clamp(0.0, 1.0) : 0.0;`
3. Kartın solundaki eski statik 44x44 container yerine `LessonProgressRing` yerleştir.
4. Kartın orta sütunundaki metin satırına ekle:
   - `Text('${solvedCount} / ${totalTests} Test Çözüldü (%${(progress * 100).toInt()})', style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.w700))`
5. Kartın altındaki `LinearProgressIndicator` çubuğunu iki renkli veya gerçek çözülen test ilerlemesi (`value: progress`) ile eşleştir.

ADIM 3: Test ve Doğrulama
1. `test/lessons_screen_test.dart` içine:
   - `LessonProgressRing` bileşeninin render edildiğini,
   - Yüzde ve çözülen test sayacının ekranda göründüğünü doğrulayan widget testi ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-61: UI Taşma (RenderFlex Overflow) ve Görsel Hata Düzeltme Paketi (Test Sonucu, Dersler, İstatistik, Paywall, Navbar & BottomSheet)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - Gerçek fiziksel cihazlarda (özellikle kompakt ve dar ekranlarda) görülen 6 kritik UI taşma ve görsel uyarı hatasının `ui-ux-pro-max` disipliniyle kalıcı olarak çözülmesi:
    1. **Dersler Ekranı (`LessonsScreen`):** Güncel Bilgiler ders kartındaki `Text('Güncel Bilgiler')` ile `'Her Hafta Yeni'` rozetinin dar ekranda çarpışıp sebep olduğu **`right overflowed by 6.1 pixels`** hatasının `Wrap` ve `Flexible(child: Text(..., overflow: TextOverflow.ellipsis))` ile giderilmesi.
    2. **İstatistik Ekranı (`StatsScreen`):** `_RecentSessionsCard` içindeki `Row(children: [Text('Çözülen Testler Arşivi (${stats.sessionHistory.length})'), TextButton('Tümünü Gör →')])` satırında başlık metninin `Expanded` ile sarılarak butonla çakışmasının ve sarı/siyah şerit hatasının önlenmesi.
    3. **Hatalı Soru Bildirme Alt Sayfası (`ReportQuestionBottomSheet` / `QuizScreen`):** `showModalBottomSheet` çağrısına `clipBehavior: Clip.antiAlias` eklenmesi; üst köşelerdeki 20-24px yuvarlatmanın arkasından modal container ve arka plan sızıntısının tamamen kesilmesi.
    4. **Alt Menü Çubuğu (`AppNavigationBar`):** Dar ekranlarda (`< 380px`) 5 sekmenin sıkışmasıyla 'Ana Sayfa' metninin gösterge dışına taşmasını önlemek için bar dış padding'inin kompakt ekranda `EdgeInsets.fromLTRB(8, 2, 8, 8)` yapılması, yazı tipinin `fontSize: 11` ve `letterSpacing: -0.2` ile taşmasız sığdırılması.
    5. **Kadro PRO Ekranı (`PaywallScreen`):** Yıllık (`%53 İndirim`) ve 2026 Sınava Kadar (`En Popüler`) plan kartlarında plan başlığı, indirim rozeti ve fiyat metninin dar ekranda yan yana sığmayıp overflow vermesinin `Wrap` ve `Flexible` ile çözülmesi.
    6. **Test Sonucu Ekranı (`QuizResultScreen`):** Dikeyde sabit `Column` + `Spacer()` kullanımı sebebiyle kompakt ve standart telefon ekranlarında tüm zafer karnesi öğelerinin dikey alana sığmayıp sebep olduğu **`bottom overflowed by 83 pixels`** hatasının `ResponsiveContentWrapper` içinde `ListView` (kaydırılabilir) yapıya dönüştürülmesi ve `Spacer()` yerine esnek spacing eklenmesi.

```text
GÖREV: TASK-61 — UI Taşma (RenderFlex Overflow) ve Görsel Hata Temizleme Paketi
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `LessonsScreen` Güncel Bilgiler Taşma Düzeltmesi (`lib/features/lessons/presentation/lessons_screen.dart`)
1. `_LessonCard` içindeki başlık satırını (`Row(children: [Text(lesson.name, ...), if (lesson.badgeText != null) ...])`) revize et:
   - `Row` yerine `Wrap` veya `Flexible(child: Text(lesson.name, overflow: TextOverflow.ellipsis))` kullan:
     ```dart
     Row(
       children: [
         Flexible(
           child: Text(
             lesson.name,
             style: theme.textTheme.titleMedium?.copyWith(
               color: colorScheme.onSurface,
               fontWeight: FontWeight.w800,
             ),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
           ),
         ),
         if (lesson.badgeText != null) ...[
           const SizedBox(width: 6),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
             decoration: BoxDecoration(
               color: colorScheme.tertiaryContainer,
               borderRadius: BorderRadius.circular(8),
             ),
             child: Text(
               lesson.badgeText!,
               style: theme.textTheme.labelSmall?.copyWith(
                 color: colorScheme.onTertiaryContainer,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
         ],
       ],
     )
     ```

ADIM 2: `StatsScreen` Çözülen Testler Arşivi Taşma Düzeltmesi (`lib/features/stats/presentation/stats_screen.dart`)
1. `_RecentSessionsCard` içindeki başlık `Row` bileşeninde başlık `Text` widget'ını `Expanded` ile sar:
   ```dart
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Expanded(
         child: Text(
           'Çözülen Testler Arşivi (${stats.sessionHistory.length})',
           style: textTheme.titleMedium?.copyWith(
             fontWeight: FontWeight.w800,
           ),
           maxLines: 1,
           overflow: TextOverflow.ellipsis,
         ),
       ),
       TextButton(
         onPressed: () { ... },
         child: const Text('Tümünü Gör →'),
       ),
     ],
   )
   ```

ADIM 3: `QuizScreen` Hatalı Soru Bildirme BottomSheet Köşe Sızıntısı (`lib/features/quiz/presentation/quiz_screen.dart`)
1. Line ~498'deki `showModalBottomSheet` çağrısını güncelle:
   - `clipBehavior: Clip.antiAlias` ekle.
   - `backgroundColor: Theme.of(context).colorScheme.surface` kalsın.
   - `shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24)))` ayarla.
   - Böylece modalın üst yuvarlatılmış köşelerinden arkadaki siyah/gri zemin hiçbir şekilde sızamaz.

ADIM 4: `AppNavigationBar` 'Ana Sayfa' Taşma Düzeltmesi (`lib/app/widgets/app_navigation_bar.dart`)
1. Dar ekranlar için padding ve navigation bar stili koruması ekle:
   - `final isCompact = MediaQuery.sizeOf(context).width < 380;`
   - Dış padding: `EdgeInsets.fromLTRB(isCompact ? 8 : 16, 4, isCompact ? 8 : 16, 12)`
   - `NavigationBarTheme` veya `NavigationDestination` içindeki `label` yazı boyutunu `labelSmall` ile güvenceye al; gerekirse `isCompact` modda 'Ana Sayfa' yerine 'Giriş' göster veya fontu 11px yap.

ADIM 5: `PaywallScreen` Plan Kartları Taşma Düzeltmesi (`lib/features/profile/presentation/paywall_screen.dart`)
1. Plan kartı içindeki `Row(children: [Text(plan.title), Container(plan.badge)])` satırını `Wrap` ile sar:
   - `Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: 6, children: [Text(plan.title, ...), if (plan.badge != null) ...])`
   - Başlık ve indirim rozeti yan yana sığmadığında otomatik olarak alt satıra kırılsın, sağdaki fiyata (`plan.priceText`) çarpıp sarı-siyah overflow uyarısı vermesin.

ADIM 6: `QuizResultScreen` Test Sonucu Ekranı 83px Dikey Taşma Düzeltmesi (`lib/features/quiz/presentation/quiz_result_screen.dart`)
1. `QuizResultScreen` içindeki sabit `Column` + `Spacer()` yapısını kaldır.
2. Gövdeyi `ResponsiveContentWrapper` içinde `ListView` (kaydırılabilir) ile değiştir:
   ```dart
   body: SafeArea(
     child: ResponsiveContentWrapper(
       padding: EdgeInsets.symmetric(
         horizontal: ResponsiveBreakpoints.horizontalPadding(context),
         vertical: 16,
       ),
       child: ListView(
         children: [
           // Zafer modunda Kadro Koçu maskot konuşma balonu
           MascotCoachBanner(...),
           const SizedBox(height: 16),
           _NetScoreCard(result: result),
           const SizedBox(height: 16),
           _buildStatRow(context),
           const SizedBox(height: 16),
           // Zafer Karnesi Paylaşım Butonu
           FilledButton.tonalIcon(...),
           const SizedBox(height: 24),
           // Aksiyon Butonları (Yanlış Defteri / Ana Sayfa / Bilgi Kartları)
           ...
         ],
       ),
     ),
   ),
   ```
3. Böylece kompakt ekranlarda veya metin boyutu büyük cihazlarda içerik taşmadan rahatça kaydırılır ve 83px overflow hatası tamamen ortadan kalkar.

ADIM 7: Test ve Doğrulama
1. `test/overflow_fix_test.dart` (veya ilgili ekran testleri) içine dar ekran (`width: 360`, `height: 640`) testleri ekle:
   - `QuizResultScreen`, `LessonsScreen`, `StatsScreen`, `PaywallScreen`, `AppNavigationBar` dar ekranda render edildiğinde sıfır taşma doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-62: UI & İçerik Sadeleştirme Paketi: Bilgi Kirliliğini Önleme, Gereksiz Rozet ve Tekrarların Temizlenmesi (Dersler, Konular, Konu Testleri)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - `ui-ux-pro-max` disiplini (Cognitive Load Reduction / Bilişsel Yük Azaltma & Progressive Disclosure) doğrultusunda adayın ekranındaki görsel gürültü ve mükerrer bilgilerin temizlenmesi:
    1. **Dersler Ekranı (`LessonsScreen` & `kpss_lessons.dart`):**
       - Tarih dersi kartındaki `badgeText: '27 Soru · Kritik'` rozetinin kaldırılması (`badgeText: null`).
       - Ders kartlarının en altındaki `${lesson.topics.length} Adımlı Yol Haritası` ve `Yol Haritasını Aç →` satırının kaldırılması (Kart zaten `TactileCard` ile tıklanabilir ve tıklandığında konular zaten açılıyor; mükerrer ve yer kaplayan satır temizlenir).
    2. **Ders Konuları Ekranı (`LessonTopicsScreen`):**
       - Sol sütundaki dikey ilerleme çizgisinde zaten daire içinde adım numarası (`1`, `2`, `3`) yer aldığı için kartın üstündeki mükerrer `'ADIM ${index + 1}'` rozetinin kaldırılması.
       - Üst satırda yalnızca sağa yaslı çevrimdışı indirme butonunun (`isDownloaded ? 'İndirildi' : 'İndir'`) tutulması.
       - Kartın alt satırında sayfa başlığı zaten "X Konuları" iken tekrarlanan `'$lessonName · Konu Testi'` ("Tarih · Konu Testi") metninin kaldırılması; alt satırda sadece sağa yaslı `Test Çöz` butonu bırakılması.
    3. **Konu Testleri Ekranı (`TopicTestsScreen`):**
       - Test kartının üst rozetinde zaten `TEST ${index + 1}` yazdığı için, orta başlıktaki mükerrer `'Test ${index + 1} · '` ifadesinin kaldırılması, sadece seviye başlığının (`tier.cleanTitle`) gösterilmesi.
       - Her test standart 10 soru olduğu için ve kullanıcı buna aşina olacağından, kartın orta alanındaki `10 Soru` ifadesinin (`${chunk.length} Soru · Öngörülen Süre...` yerine sadece `Öngörülen Süre: ~11 dk`) ve alt çubuktaki mükerrer `'10 Soruluk Konu Testi'` yazısının kaldırılması.
       - Alt satırda sadece sağa yaslı `Test Çöz` butonunun yer alması.
    4. **Test Zorluk Seviyeleri Modeli (`TestDifficultyTier`):**
       - `title` içindeki gereksiz parantez içi açıklamaların temizlenmesi:
         - `🌱 Basit Alıştırma (Isınma Turu)` ➔ `🌱 Basit Alıştırma`
         - `🏛️ Tam Sınav Ayarı (ÖSYM Formatı)` ➔ `🏛️ Tam Sınav Ayarı`
         - `⚡ Net Sıçratan (Derece Soruları)` ➔ `⚡ Net Sıçratan`
         - `🔥 Kurtlar Sofrası (ÖSYM Mayın Tarlası)` ➔ `🔥 Kurtlar Sofrası`

```text
GÖREV: TASK-62 — UI & İçerik Sadeleştirme Paketi: Bilgi Kirliliğini Önleme ve Tekrarların Temizlenmesi
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `kpss_lessons.dart` ve `LessonsScreen` Temizliği
1. `lib/features/lessons/data/kpss_lessons.dart` içinde Tarih dersinin rozetini kaldır:
   - `badgeText: '27 Soru · Kritik'` yerine `badgeText: null` yap.
2. `lib/features/lessons/presentation/lessons_screen.dart` içinde `_LessonCard` altındaki Wrap/Row satırını (`${lesson.topics.length} Adımlı Yol Haritası` ve `Yol Haritasını Aç →`) kaldır. Böylece kart daha ferah ve kompakt bir görünüme kavuşsun.

ADIM 2: `LessonTopicsScreen` Mükerrer Adım ve Ders Etiketlerinin Temizliği (`lib/features/lessons/presentation/lesson_topics_screen.dart`)
1. Sol sütundaki CircleAvatar(`${index + 1}`) zaten adım numarasını gösterdiğinden, kartın içindeki `Container(child: Text('ADIM ${index + 1}'))` rozetini kaldır.
2. Üst satırda indirme butonunu sağa yasla (`Row(mainAxisAlignment: MainAxisAlignment.end, children: [Tooltip(...)])` veya `Align(alignment: Alignment.centerRight, ...)`).
3. Kartın alt satırındaki `'$lessonName · Konu Testi'` metnini kaldır.
4. Alt satırı sadece sağa yaslı `FilledButton.tonal(child: Text('Test Çöz'))` butonu olacak şekilde düzenle (`Align(alignment: Alignment.centerRight, child: FilledButton.tonal(...))`).

ADIM 3: `TestDifficultyTier` Parantez İçi Metinlerin Temizliği (`lib/features/quiz/data/models/test_difficulty_tier.dart`)
1. `TestDifficultyTierExtension.title` getter'ındaki parantez içi gereksiz metinleri temizle:
   ```dart
   String get title {
     switch (this) {
       case TestDifficultyTier.warmup:
         return '🌱 Basit Alıştırma';
       case TestDifficultyTier.standard:
         return '🏛️ Tam Sınav Ayarı';
       case TestDifficultyTier.distinction:
         return '⚡ Net Sıçratan';
       case TestDifficultyTier.trapMaster:
         return '🔥 Kurtlar Sofrası';
     }
   }
   ```

ADIM 4: `TopicTestsScreen` Mükerrer Test No ve 10 Soru Bilgisinin Temizliği (`lib/features/lessons/presentation/topic_tests_screen.dart`)
1. Kartın orta başlığında `Text('Test ${index + 1} · ${tier.cleanTitle}')` yerine sadece `Text(tier.cleanTitle)` göster (üstte zaten `TEST ${index + 1}` rozeti var).
2. Orta süre satırında `${chunk.length} Soru · Öngörülen Süre: ~${...} dk` yerine sadece `Öngörülen Süre: ~${(chunk.length * 1.1).round()} dk` yazdır ("10 Soru" bilgisi kaldırılır).
3. Alt satırdaki `Row` içinden `'10 Soruluk Konu Testi'` ve `LucideIcons.listOrdered` ikonunu kaldır.
4. Alt satırı sadece sağa yaslı `Test Çöz` butonu yap:
   ```dart
   Align(
     alignment: Alignment.centerRight,
     child: FilledButton.tonal(
       onPressed: () => _startTest(index, chunk, tier),
       style: FilledButton.styleFrom(
         visualDensity: VisualDensity.compact,
         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
       ),
       child: const Text('Test Çöz'),
     ),
   )
   ```

ADIM 5: Test ve Doğrulama
1. `test/lessons_screen_test.dart`, `test/topic_tests_screen_test.dart` ve `test/lesson_topics_screen_test.dart` içindeki widget testlerini yeni temiz UI metinleriyle güncelle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-63: Proje Genelinde Standart Spacing & Padding/Margin Sistemi (AppSpacing Tokens & Zero-Shift Sayfa Geçiş Ritimleri)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - Uygulama genelindeki dağınık, rastgele veya ekranlar arası uyumsuz (10, 12, 14, 16, 20, 24px) padding ve margin değerlerinin endüstri standardı **8pt / 4pt Spacing Token** mimarisine (`AppSpacing`) bağlanması.
  - **Zero Layout Shift (Sıfır Zıplama) Kuralı:** Kullanıcı alt menü çubuğundan sekmeler arasında geçtiğinde (`HomeScreen` ➔ `LessonsScreen` ➔ `ExamsScreen` ➔ `StatsScreen` ➔ `ProfileScreen`), sayfa kenar dolguları (horizontal padding) ve ilk elemanın üst boşluğu (top margin) milimetrik olarak birebir aynı hizada kilitlenir; sayfa içeriğinde sağa-sola veya yukarı-aşağı atlama/zıplama tamamen ortadan kaldırılır.
  - **Design Token Katmanı (`lib/core/theme/app_spacing.dart`):**
    - `xxs = 4.0` (Mikro rozet içi, ikon-metin aralığı)
    - `xs = 8.0` (Küçük boşluk, rozet dolgusu, dar eleman aralığı)
    - `sm = 12.0` (Kompakt sayfa yatay dolgusu, kart altı aralığı, bento grid aralığı)
    - `md = 16.0` (Standart sayfa yatay dolgusu, standart kart içi padding, bölüm arası boşluk)
    - `lg = 20.0` (Geniş bölüm ayıracı, modal padding)
    - `xl = 24.0` (Tablet yatay sayfa dolgusu, büyük başlık altı boşluğu)
    - `xxl = 32.0` (Sayfa altı safe-area boşluğu)
    - `AppSpacing.pagePadding(context)` helper metodu.
    - `AppSpacing.cardPadding`, `AppSpacing.cardMarginBottom`.
    - `AppSpacing.gapXs` ... `AppSpacing.gapXl` const SizedBox'lar.
  - **Tüm Ekranların Standardizasyonu:**
    - 5 Ana Sekme: `HomeScreen`, `LessonsScreen`, `ExamsScreen`, `StatsScreen`, `ProfileScreen` ➔ Hepsi `ResponsiveContentWrapper` + `AppSpacing.pagePadding(context)` kullanır.
    - Alt Ekranlar: `LessonTopicsScreen`, `TopicTestsScreen`, `QuizScreen`, `QuizResultScreen`, `StudyPlannerScreen`, `MistakesScreen`, `FlashcardsScreen`, `PaywallScreen`, `AuthScreen`.

```text
GÖREV: TASK-63 — Proje Genelinde Standart Spacing & Padding/Margin Sistemi (AppSpacing Tokens)
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `AppSpacing` Token Sınıfının Oluşturulması (`lib/core/theme/app_spacing.dart`)
1. `lib/core/theme/app_spacing.dart` dosyasını oluştur:
   ```dart
   import 'package:flutter/material.dart';
   import 'package:kadro/core/utils/responsive_layout.dart';

   /// Tüm Kadro uygulamasında kullanılan 8pt/4pt tabanlı standart boşluk (spacing/padding/margin) token'ları.
   ///
   /// Web/Angular Karşılığı: Tailwind Spacing Scale (`p-1` (4px), `p-2` (8px), `p-3` (12px), `p-4` (16px), `p-5` (20px), `p-6` (24px))
   /// veya CSS `:root { --spacing-xs: 8px; --spacing-md: 16px; }` değişkenleri.
   class AppSpacing {
     AppSpacing._();

     // 1. Temel Ölçüler (Scalar Tokens)
     static const double xxs = 4.0;
     static const double xs = 8.0;
     static const double sm = 12.0;
     static const double md = 16.0;
     static const double lg = 20.0;
     static const double xl = 24.0;
     static const double xxl = 32.0;

     // 2. Sayfa Düzeyi Eşlenik Dolgular (Zero Layout Shift)
     /// Tüm ana sayfalarda ve listelerde kullanılan ekran boyutuna duyarlı standart kenar dolgusu.
     /// Kompakt ekranda 12px, standart ekranda 16px, tablette 24px yatay dolgu verir.
     /// Dikey dolgu tüm cihazlarda sabit 16px'tir (böylece sekmeler arası geçişte başlıklar zıplamaz).
     static EdgeInsets pagePadding(BuildContext context) {
       return EdgeInsets.symmetric(
         horizontal: ResponsiveBreakpoints.horizontalPadding(context),
         vertical: md,
       );
     }

     // 3. Kart ve Konteyner Dolguları
     static const EdgeInsets cardPadding = EdgeInsets.all(md);
     static const EdgeInsets cardPaddingCompact = EdgeInsets.all(sm);
     static const EdgeInsets cardMarginBottom = EdgeInsets.only(bottom: sm);

     // 4. Standart Dikey Boşluk Bileşenleri (Vertical Gaps)
     static const SizedBox gapXs = SizedBox(height: xs);
     static const SizedBox gapSm = SizedBox(height: sm);
     static const SizedBox gapMd = SizedBox(height: md);
     static const SizedBox gapLg = SizedBox(height: lg);
     static const SizedBox gapXl = SizedBox(height: xl);
     static const SizedBox gapXxl = SizedBox(height: xxl);

     // 5. Standart Yatay Boşluk Bileşenleri (Horizontal Gaps)
     static const SizedBox gapHorizontalXs = SizedBox(width: xs);
     static const SizedBox gapHorizontalSm = SizedBox(width: sm);
     static const SizedBox gapHorizontalMd = SizedBox(width: md);
     static const SizedBox gapHorizontalLg = SizedBox(width: lg);
   }
   ```

ADIM 2: 5 Ana Tab Ekranının Spacing Eşlenmesi (Zero Layout Shift)
1. `HomeScreen` (`lib/features/home/presentation/home_screen.dart`):
   - `ListView` dolgusunu `AppSpacing.pagePadding(context)` yap.
   - Kartlar arasındaki `SizedBox(height: ...)` boşluklarını `AppSpacing.gapMd` (16px) veya `AppSpacing.gapSm` (12px) ile sabitle.
2. `LessonsScreen` (`lib/features/lessons/presentation/lessons_screen.dart`):
   - `ListView` dolgusunu `AppSpacing.pagePadding(context)` yap.
   - Kart alt marginlerini `AppSpacing.cardMarginBottom` ile sabitle.
3. `ExamsScreen` (`lib/features/exams/presentation/exams_screen.dart`):
   - `ResponsiveContentWrapper` içine al.
   - `ListView` dolgusunu `AppSpacing.pagePadding(context)` yap.
   - Bölümler arasındaki boşlukları `AppSpacing.gapMd` (16px) yap.
4. `StatsScreen` (`lib/features/stats/presentation/stats_screen.dart`):
   - `ListView` dolgusunu `AppSpacing.pagePadding(context)` yap.
   - Kartlar arası boşlukları `AppSpacing.gapMd` yap.
5. `ProfileScreen` (`lib/features/profile/presentation/profile_screen.dart`):
   - `ResponsiveContentWrapper` içine al.
   - `ListView` dolgusunu `AppSpacing.pagePadding(context)` yap (önceden unconstrained `EdgeInsets.all(16)` idi).
   - Bölüm aralıklarını `AppSpacing.gapMd` yap.

ADIM 3: Alt Akış ve Detay Ekranlarının Standartlaştırılması
1. `LessonTopicsScreen`, `TopicTestsScreen`, `QuizScreen`, `QuizResultScreen`, `StudyPlannerScreen`, `MistakesScreen`, `FlashcardsScreen`, `PaywallScreen`:
   - Sayfa gövdelerinde rastgele `padding: const EdgeInsets.all(20)` veya `all(24)` olan yerleri `AppSpacing.pagePadding(context)` ile hizala.
   - Kart içi dolguları `AppSpacing.cardPadding` (16px) yap.
   - `SizedBox(height: 10)`, `SizedBox(height: 14)`, `SizedBox(height: 18)` gibi tekil/keyfi değerleri `AppSpacing.gapXs` (8px), `AppSpacing.gapSm` (12px) veya `AppSpacing.gapMd` (16px) ile değiştir.

ADIM 4: Test ve Doğrulama
1. `test/app_spacing_test.dart` birim test dosyasını oluştur:
   - `AppSpacing` scalar token değerlerini (4, 8, 12, 16, 20, 24, 32px) doğrula.
   - Kompakt, standart ve tablet ekranlarda `AppSpacing.pagePadding(context)` dönüşlerini doğrula.
   - 5 ana ekranın da sıfır taşma (overflow) ile render olduğunu doğrula.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-64: Yanlış Defteri 59px Taşma Düzeltmesi & Çevrimdışı İndirme UI/UX Dönüşümü (Zarif & Sade İndirme Modeli)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **1. Yanlış Defteri Boş Durum Taşma Düzeltmesi (`lib/features/mistakes/presentation/mistakes_screen.dart`):**
    - Yanlış Defteri ekranında soru yokken gösterilen `_buildEmptyState` içindeki `Row`'da yer alan `FilledButton.tonalIcon(Yeni Test Çöz)` ve `OutlinedButton.icon(Bilgi Kartlarına Git)` butonlarının dar ekranda yan yana sığmayıp sebep olduğu **`right overflowed by 59 pixels`** hatasının `Wrap(spacing: 12, runSpacing: 10, alignment: WrapAlignment.center)` ile çözülmesi.
  - **2. Çevrimdışı İndirme Görsel Kirliliğinin Giderilmesi (Spotify & Duolingo Stili Zarif Mimari):**
    - Konular (`LessonTopicsScreen`) ve Denemeler (`ExamsScreen`) ekranlarında her kartın üstünde bağıran, uygulama tasarımını dosya yöneticisi gibi gösteren büyük **`[ ⬇️ İndir ]`** metinli butonların kaldırılması.
    - **Yeni Zarif Mimari:**
      - Kart üzerinde kaba metinli buton yerine:
        - İndirilmemiş kartlar: Tamamen temiz ve yalın kalır (veya sağ üst köşede sadece 20px soluk/hafif bir mikro-ikon `LucideIcons.arrowDownToLine`).
        - İndirilmiş kartlar: Cihazda hazır olduğunu gösteren zarif, minimal bir yeşil onay rozeti (`LucideIcons.circleCheck` - 'Cihazda').
      - Sayfa Düzeyinde Toplu İndirme (Bulk Action): Konular ve Denemeler ekranının üst başlık veya AppBar alanına "Tüm Konuları İndir (PRO)" / "Tümünü Çevrimdışı Yap" tek tıkla indirme seçeneği sunulması.
    - Böylece kartlar ferah, modern ve elit bir eğitim uygulaması zarafetine kavuşur.

```text
GÖREV: TASK-64 — Yanlış Defteri 59px Taşma Düzeltmesi ve Çevrimdışı İndirme UI/UX Yeniden Tasarımı
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `MistakesScreen` 59px Taşma Düzeltmesi (`lib/features/mistakes/presentation/mistakes_screen.dart`)
1. `_buildEmptyState` metodundaki `Row(children: [FilledButton.tonalIcon(...), SizedBox(12), OutlinedButton.icon(...)])` bloğunu güncelle:
   - `Row` yerine `Wrap` kullan:
     ```dart
     Wrap(
       alignment: WrapAlignment.center,
       spacing: 12,
       runSpacing: 10,
       children: [
         FilledButton.tonalIcon(
           onPressed: () {
             Navigator.of(context).push(
               MaterialPageRoute(builder: (_) => const QuizScreen()),
             );
           },
           icon: const Icon(LucideIcons.play, size: 18),
           label: const Text('Yeni Test Çöz'),
         ),
         OutlinedButton.icon(
           onPressed: () {
             Navigator.of(context).push(
               MaterialPageRoute(
                 builder: (_) => const FlashcardsScreen(),
               ),
             );
           },
           icon: const Icon(LucideIcons.layers, size: 18),
           label: const Text('Bilgi Kartlarına Git'),
         ),
       ],
     )
     ```
2. Böylece küçük telefonlarda butonlar otomatik alt satıra kırılarak 59px taşma hatasını tamamen ortadan kaldırır.

ADIM 2: `LessonTopicsScreen` İndir Butonlarının Zarifleştirilmesi (`lib/features/lessons/presentation/lesson_topics_screen.dart`)
1. Kartın içindeki büyük `[ ⬇️ İndir ]` metinli hap butonu kaldır.
2. Yerine sadece:
   - İndirilmişse: Küçük ve zarif `LucideIcons.circleCheck` ikonu ve `Cihazda` mikro etiketi.
   - İndirilmemişse: Sade 24x24px tıklanabilir hafif mikro-ikon (`LucideIcons.arrowDownToLine`, rengi `colorScheme.onSurfaceVariant.withAlpha(150)`).
3. Sayfa üstündeki `MascotCoachBanner` altına veya AppBar'a "Dersin Tüm Konularını İndir" butonu ekle.

ADIM 3: `ExamsScreen` Deneme Kartları İndir Butonlarının Zarifleştirilmesi (`lib/features/exams/presentation/exams_screen.dart`)
1. Deneme kartlarındaki büyük `Row(children: [Icon, Text('İndir')])` butonunu kaldır.
2. Kartın sağ üst köşesine sadece indirme durumu mikro-ikonu yerleştir:
   - İndirilmişse: Zümrüt yeşili minik `LucideIcons.circleCheck` rozeti.
   - İndirilmemişse: Hafif çizgisel `LucideIcons.arrowDownToLine` mikro-butonu (metinsiz).

ADIM 4: Test ve Doğrulama
1. `test/overflow_fix_test.dart` içine `MistakesScreen` 360x640 dar ekran taşmasızlık testini ekle.
2. `test/offline_download_test.dart` testlerini yeni zarif mikro-ikon ve indirme akışıyla uyumlu hale getir.
3. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-65: Profil Ekranı Evrimi: Aday Kimlik Kartı, KPSS 2026 Geri Sayımı, Lig & Başarı Rozetleri Vitrini ve Bulut Eşitleme Merkezi

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - Mevcut `ProfileScreen` ekranının sadece teknik bir "Ayarlar Listesi" olmaktan çıkarılıp, global EdTech ve prestij sınav uygulamaları (Duolingo, UWorld, Amboss, Brilliant) standartlarında adayın gurur duyacağı bir **"Memur Adayı Kimlik & Başarı Vitrini"**ne dönüştürülmesi.
  - **1. Aday Kimlik & Rütbe Kartı (`_CandidateHeroCard`):**
    - Avatar (Kadro Koçu Tuğrul rozeti veya baş harfli şık daire).
    - Kullanıcı Adı / Görünen İsim & E-posta bilgisi.
    - Katılma Tarihi ("Kasım 2026'dan beri Kadro'da").
    - Hedef Sınav & Hedef Puan Rozeti (Örn: `🎯 Hedef: 88.5 Puan · Gelir Uzmanlığı`).
    - PRO VIP Durumu: Altın çerçeveli `👑 KADRO PRO VIP` rozeti veya `PRO'ya Geç` butonu.
  - **2. Canlı 2026 KPSS Geri Sayım Şeridi (`_KpssCountdownStrip`):**
    - Gerçek 2026 KPSS Lisans Genel Kültür sınav tarihine kalan gün/hafta sayacı:
      `⏳ 2026 KPSS Lisans: X Gün Kaldı · Her gün 1 net, zirveye adım!`
  - **3. 4'lü Aday Performans Paneli (Performance Snapshot):**
    - `🔥 Seri`: X Gün (Streak)
    - `📝 Çözülen`: X Soru
    - `🎯 İsabet`: %X Genel Başarı
    - `⚡ Toplam`: X XP
  - **4. Lig & Unvan Rozeti (League & Title Card):**
    - Aktif lig: `🏛️ Altın Kadro Ligi (Sıralama: #14)`
    - Lig ilerleme çubuğu ve sonraki lige geçiş için gereken XP miktarı.
  - **5. Başarı Madalyaları Vitrini (`_AchievementBadgesGrid`):**
    - Adayı soru çözmeye teşvik eden 6 adet motivasyon madalyası (Kazanılmış/Kilitli):
      1. `🌱 İlk Pençe` (İlk test tamamlandı)
      2. `⚡ Net Sıçratıcı` (%80+ başarıyla biten deneme)
      3. `🔥 Seri Canavarı` (Aralıksız 7 gün soru çözümü)
      4. `🏛️ Tarih Fatihi` (50 Tarih sorusu çözümü)
      5. `🌙 Gece Kuşu` (Saat 22:00'den sonra çalışma)
      6. `🛡️ Mayın Temizleyici` (5 çeldirici tuzak sorusunu doğru bilme)
  - **6. Bulut Senkronizasyon & Güvenlik Göstergesi (`_CloudSyncIndicatorCard`):**
    - `🟢 Verileriniz Supabase Bulutunda Güvende` (Son eşitleme zamanı, tek tıkla `Şimdi Eşitle`).
  - **7. Modüler Uygulama ve Soru Çözüm Tercihleri:**
    - Günlük Soru Hedefi (30 / 50 / 100).
    - Soru Çözüm Modu (Öğrenme / Sınav).
    - Tema Seçimi (Sistem / Açık / Koyu).
    - Bildirim ve Hatırlatıcılar.

```text
GÖREV: TASK-65 — Profil Ekranı Evrimi (Aday Kimliği, KPSS Geri Sayımı, Rozet Vitrini)
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: Başarı Madalyaları Modeli (`lib/features/profile/data/models/achievement_badge.dart`)
1. Profilde gösterilecek 6 temel madalya için model oluştur:
   ```dart
   class AchievementBadge {
     final String id;
     final String title;
     final String description;
     final IconData icon;
     final bool isUnlocked;
     final String progressText;

     const AchievementBadge({
       required this.id,
       required this.title,
       required this.description,
       required this.icon,
       required this.isUnlocked,
       required this.progressText,
     });
   }
   ```
2. Kullanıcının mevcut `studyStatsProvider` verilerine göre kilit durumunu hesaplayan bir repository/yardımcı metot ekle.

ADIM 2: `_CandidateHeroCard` ve KPSS 2026 Geri Sayım Şeridi (`lib/features/profile/presentation/widgets/candidate_hero_card.dart`)
1. Aday kimlik kartını ve geri sayım şeridini oluştur:
   - Avatar: Kadro Koçu Tuğrul görseli veya baş harf.
   - Görünen ad (`auth.displayName`), e-posta ve katılım tarihi.
   - Hedef puan hapı (`🎯 Hedef: ${prefs.targetKpssScore} Puan`).
   - 2026 KPSS Lisans geri sayım widget'ı (Örn. `DateTime(2026, 9, 6)` hedefiyle kalan gün hesabı).

ADIM 3: 4'lü Metrik Kartı & Lig Rozeti (`lib/features/profile/presentation/widgets/profile_metrics_card.dart`)
1. Seri, Çözülen Soru, Başarı Oranı ve XP metriklerini TactileCard içinde 4 sütunlu / bento düzeninde render et.
2. Altına lig unvanı (`Bronz Kadro`, `Gümüş Kadro`, `Altın Kadro`) ve lig seviye çubuğunu yerleştir.

ADIM 4: Başarı Madalyaları Vitrini (`lib/features/profile/presentation/widgets/achievement_showcase.dart`)
1. 3x2 grid düzeninde madalyaları sergile:
   - Kazanılmış rozetler: Altın/Zümrüt parıltılı ve renkli.
   - Kilitli rozetler: Hafif silik (`opacity: 0.5`) ve kilit ikonuyla birlikte hedef göstergesi ("3/7 Gün").

ADIM 5: `ProfileScreen` Entegrasyonu ve Ayarlar Bölümü Düzenlemesi (`lib/features/profile/presentation/profile_screen.dart`)
1. Ekranı yukarıdan aşağıya hiyerarşik olarak diz:
   - `ResponsiveContentWrapper` içinde `AppSpacing.pagePadding(context)`.
   - 1. Aday Kimlik Kartı & Geri Sayım
   - 2. 4'lü Performans Özeti
   - 3. Lig & Rütbe Kartı
   - 4. Başarı Madalyaları Vitrini
   - 5. Kadro PRO VIP Durum Kartı
   - 6. Bulut Senkronizasyon Durumu
   - 7. "Çalışma ve Uygulama Ayarları" (Hedef Soru, Çözüm Modu, Tema, Çıkış Yap)
2. Ayarlar bölümünü temiz, katlanabilir veya minimal TactileCard ListTile grupları halinde düzenle.

ADIM 6: Test ve Doğrulama
1. `test/profile_screen_test.dart` içine:
   - Aday kimlik kartının, geri sayımın, metriklerin ve madalyaların render edildiğini doğrulayan widget testleri ekle.
2. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-66: Bağımsız Çalışma Türleri & Antrenman Ekranı (`PracticeHubScreen`), Zenginleştirilmiş Alt Menü (`AppNavigationBar`) ve Görev Hatırlatıcılı Yeni Ana Sayfa

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **1. Bağımsız Çalışma Türleri & Antrenman Ekranı (`lib/features/practice/presentation/practice_hub_screen.dart`):**
    - Daha önce `HomeScreen` altında sıkışık duran "Çalışma Türleri" ve "Etkileşimli Mini Oyunlar" bölümlerinin ana sayfadan çıkarılarak kendi bağımsız sekmesine (**`Pratik`** — `/practice`) taşınması ve zenginleştirilmesi:
      - **Üst Karşılama:** Kadro Koçu (`MascotMood.coach`) "Antrenman Sahası" brifing kartı.
      - **Temel Çalışma Modları (2x2 Bento Grid):**
        1. `🎯 Konu Testi` (10-20 Soruluk Odaklı Test)
        2. `🗂️ Bilgi Kartları` (Flashcards ile Hızlı Tekrar)
        3. `🔖 Yanlış Defteri` (Akıllı Hata Havuzu)
        4. `⏱️ Deneme Sınavı` (60 Soru · 65 Dakika Gerçek Prova)
      - **Özel Antrenman & Tuzak Avı Modu (Geniş Vurgu Kartı):**
        - `⚠️ ÖSYM Çeldirici Avı`: Adayların en çok düştüğü çeldirici tuzaklı sorulardan oluşan 10 soruluk özel antrenman modu.
      - **Etkileşimli Mini Oyunlar Arenası (2'li Bento Grid):**
        1. `⚡ 60 Saniyede Pençe` (Doğru/Yanlış Hızlı Düello)
        2. `🧩 Kavram Eşleştir` (Tarih, Coğrafya, Vatandaşlık Hafıza Eşleştirmesi)
  - **2. Zenginleştirilmiş Alt Menü (`AppNavigationBar` & `AppShell` & `router.dart`):**
    - Alt navigasyon çubuğunun (`AppNavigationBar`) 6 sekmeli zengin bir dock yapısına yükseltilmesi:
      - `0: Ana Sayfa` (`LucideIcons.house` — `/`)
      - `1: Dersler` (`LucideIcons.bookOpen` — `/lessons`)
      - `2: Pratik` (`LucideIcons.Layers` veya `LucideIcons.gamepad2` — `/practice`)
      - `3: Denemeler` (`LucideIcons.timer` — `/exams`)
      - `4: İstatistik` (`LucideIcons.chartColumn` — `/stats`)
      - `5: Profil` (`LucideIcons.user` — `/profile`)
    - Dar/kompakt ekranlarda (`< 380px`) 6 sekmenin sıfır taşma (`Zero Overflow`) ile kusursuz sığması için etiket fontlarının, yatay padding'lerin ve aktif sekme hapının (pill indicator) adaptif olarak ölçeklenmesi.
  - **3. Görev Hatırlatıcılı & Genel Bakış Odaklı Yeni Ana Sayfa (`HomeScreen`):**
    - Çalışma türleri ayrıldıktan sonra `HomeScreen`, adayın günlük çalışma ritmini yöneten ferah bir **Kişisel Komuta Merkezi (Executive Dashboard)** haline getirilir:
      1. **Kadro Koçu Karşılama Balonu (`MascotCoachBanner`)**
      2. **Akıllı Görev & Seri Hatırlatıcıları Kartı (`_SmartRemindersCard`):**
         - Bekleyen günlük çalışma planı görev sayısı (`🔔 Bugün tamamlanmayı bekleyen X görevin var`).
         - Günlük seri (streak) koruma hatırlatıcısı (`🔥 X günlük serini korumak için hedefini tamamla`).
         - Yanlış defteri tekrar hatırlatıcısı (`🔖 Yanlış defterinde çözülmeyi bekleyen X soru var` — tıklanınca Yanlış Defteri'ne gider).
      3. **Günlük Soru Hedefi & Halka Göstergesi (`_DailyGoalCard`)**
      4. **Bugünün Çalışma Planı (`HomeDailyPlanCard`)**
      5. **Hızlı Devam Et & Zayıf Konuyu Güçlendir (`_WeakLessonHomeBanner` & Pratik'e Hızlı Geçiş Kartı)**

```text
GÖREV: TASK-66 — Bağımsız Çalışma Türleri Ekranı (PracticeHubScreen), 6 Sekmeli Zengin AppNavigationBar ve Görev Hatırlatıcılı Ana Sayfa
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: Bağımsız Çalışma Türleri Ekranı (`lib/features/practice/presentation/practice_hub_screen.dart`)
1. `PracticeHubScreen` adında bir `ConsumerWidget` oluştur.
2. `ResponsiveContentWrapper` ve `AppSpacing.pagePadding(context)` kullanarak içeriği oluştur:
   - `MascotCoachBanner`:
     - `mood: MascotMood.coach`
     - `badgeLabel: 'ANTRENMAN SAHASI'`
     - `title: 'Çalışma Türleri'`
     - `message: 'Bugün hangi modda pratik yapmak istersin? Test çöz, kartlarla tekrar yap veya oyunlarla hafızanı tazele!'`
   - `SectionTitle('Temel Çalışma Modları')` + 2x2 Bento Grid (Tablette 4 sütun):
     - `Konu testi` (`QuizScreen`)
     - `Bilgi kartları` (`FlashcardsScreen`)
     - `Yanlış defteri` (`MistakesScreen`)
     - `Deneme sınavı` (`QuizScreen(examDuration: Duration(minutes: 65), customTitle: 'Genel Kültür Denemesi')`)
   - `SectionTitle('Özel Antrenman')`:
     - `ÖSYM Çeldirici Avı` (`QuizScreen(customTitle: 'ÖSYM Çeldirici Avı (Tuzak Sorular)', limit: 10)`) — kehribar/tertiary vurgulu özel kart.
   - `SectionTitle('Etkileşimli Mini Oyunlar')` + 2'li Bento Grid:
     - `60 Saniyede Pençe` (`TrueFalseBlitzScreen`)
     - `Kavram Eşleştir` (`ConceptMatchScreen`)

ADIM 2: Görev Hatırlatıcılı Yeni `HomeScreen` (`lib/features/home/presentation/home_screen.dart`)
1. `HomeScreen` içindeki çalışma türleri ve mini oyun gridlerini kaldır (bunlar `PracticeHubScreen`'e taşındı).
2. Yerine adayın genel durumunu ve hatırlatıcılarını gösteren `_SmartRemindersCard` bileşenini ekle:
   - `studyPlannerProvider` üzerinden bekleyen (tamamlanmamış) görev sayısını oku.
   - `mistakeRepositoryProvider` (veya ilgili provider) ve `studyStatsProvider` üzerinden seri ve yanlış sayılarını oku.
   - Kart içinde 2-3 maddelik şık, tıklanabilir hatırlatıcı satırları (`_ReminderTile`) göster:
     - Görev hatırlatıcısı: Bekleyen görev varsa `"X çalışma görevin tamamlanmayı bekliyor"` (Tıklanınca `StudyPlannerScreen` açılır).
     - Seri & Hedef hatırlatıcısı: Günlük hedef tamamlanmadıysa `"Serini korumak için kalan: X soru"` (Tıklanınca `QuizScreen` açılır).
     - Antrenman kısayolu: `"Çalışma türleri ve mini oyunlarla hız kazan"` (Tıklanınca `PracticeHubScreen` veya ilgili mod açılır).
3. `HomeScreen` akış sırası:
   - `MascotCoachBanner`
   - `_DailyGoalCard`
   - `_SmartRemindersCard` (Yeni Görev & Durum Hatırlatıcıları)
   - `HomeDailyPlanCard` (Bugünün Çalışma Planı)
   - `_WeakLessonHomeBanner` (Varsa zayıf ders güçlendirme kartı)

ADIM 3: `AppNavigationBar`, `AppShell` ve `router.dart` 6 Sekmeli Zengin Yapı
1. `lib/app/widgets/app_navigation_bar.dart`:
   - 6 sekme tanımla:
     0: `Ana Sayfa` (`LucideIcons.house`)
     1: `Dersler` (`LucideIcons.bookOpen`)
     2: `Pratik` (`LucideIcons.gamepad2`)
     3: `Denemeler` (`LucideIcons.timer`)
     4: `İstatistik` (`LucideIcons.chartColumn`)
     5: `Profil` (`LucideIcons.user`)
   - Kompakt ekranlarda (`width < 400`) 6 sekmenin taşmaması için `labelStyle` içinde `fontSize: isCompact ? 9.5 : 11.0`, `letterSpacing: -0.4` ve `NavigationBar` içinde uygun sıkılık kullan.
2. `lib/app/app_shell.dart`:
   - `_pages` listesine 2. index olarak `PracticeHubScreen()` ekle:
     `[HomeScreen(), LessonsScreen(), PracticeHubScreen(), ExamsScreen(), StatsScreen(), ProfileScreen()]`
   - `_titles` listesini güncelle:
     `['Kadro', 'Dersler', 'Çalışma Türleri', 'Denemeler', 'İstatistik', 'Profil']`
3. `lib/app/router.dart`:
   - `StatefulShellRoute.indexedStack` içindeki `branches` listesine 2. sırada `/practice` (`PracticeHubScreen`) branch'ini ekle.

ADIM 4: Testlerin Güncellenmesi ve Doğrulama
1. `test/router_test.dart`, `test/widget_test.dart`, `test/responsive_layout_test.dart` ve `test/app_spacing_test.dart` dosyalarını yeni 6 sekmeli navigasyon ve `PracticeHubScreen` yapısıyla uyumlu hale getir.
2. `PracticeHubScreen` ve `HomeScreen` üzerindeki yeni görev hatırlatıcılarının render edildiğini doğrulayan test senaryosu ekle.
3. Sırasıyla `dart format lib test`, `flutter analyze` ve `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-67: Özgün İkon Mimarisi Dönüşümü: Sıradan Lucide İkonlarından `phosphor_flutter` (Duotone, Fill & Bold) Karakteristik İkon Sistemine Geçiş

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - Her web/AI projesinde kullanılan ve sıradanlaşmış tek çizgili `lucide_icons_flutter` (`LucideIcons`) ikonlarının yerine, Kadro'nun 3D Tactile kartlarına ve Tuğrul maskotuna karakter katan **`phosphor_flutter` (Phosphor Icons — Duotone, Fill & Bold)** sistemine geçilmesi.
  - **1. Paket Kurulumu:**
    - `flutter pub add phosphor_flutter` komutuyla paketin eklenmesi.
  - **2. 3 Katmanlı İkon Görsel Dili:**
    - **Kartlar, Dersler, Çalışma Türleri ve Madalyalar (`PhosphorIconsDuotone` & `PhosphorIcon`):**
      - Çift tonlu (`Duotone`) ikonlar kullanılarak her ikonun içinde `%20` saydamlıkta ikinci bir derinlik katmanı oluşturulması.
      - Ders ikonları (`kpss_lessons.dart`):
        - Tarih: `PhosphorIconsDuotone.scroll` (Tarihi Parşömen / Ferman)
        - Coğrafya: `PhosphorIconsDuotone.globeHemisphereEast` (Dünya Küresi)
        - Vatandaşlık: `PhosphorIconsDuotone.scales` (Adalet Terazisi)
        - Güncel Bilgiler: `PhosphorIconsDuotone.newspaperClipping` (Güncel Manşet)
    - **Alt Navigasyon Çubuğu (`AppNavigationBar`):**
      - Seçili olmayan sekmelerde (`icon`) tok çizgili `PhosphorIconsBold.*`,
      - Seçili olan aktif sekmede (`selectedIcon`) içi dolu `PhosphorIconsFill.*` veya `PhosphorIconsDuotone.*` kullanılarak sekme geçişlerinde premium Duolingo/Spotify hissi verilmesi:
        - Ana Sayfa: `PhosphorIconsBold.house` / `PhosphorIconsFill.house`
        - Dersler: `PhosphorIconsBold.books` / `PhosphorIconsFill.books`
        - Pratik: `PhosphorIconsBold.gameController` / `PhosphorIconsFill.gameController`
        - Denemeler: `PhosphorIconsBold.timer` / `PhosphorIconsFill.timer`
        - İstatistik: `PhosphorIconsBold.chartBar` / `PhosphorIconsFill.chartBar`
        - Profil: `PhosphorIconsBold.userCircle` / `PhosphorIconsFill.userCircle`
    - **Aksiyon Butonları, Oklar ve Rozetler (`PhosphorIconsBold` / `PhosphorIconsFill`):**
      - Cılız çizgiler yerine tok `PhosphorIconsBold` ve `PhosphorIconsFill` kullanılması (`flame`, `lightning`, `trophy`, `medal`, `shieldCheck`, `caretRight`, `checkCircle`, `sealWarning` vb.).
  - **3. Tüm Ekranların ve Testlerin Güncellenmesi:**
    - `lib/` altındaki tüm ekran ve widget'larda `LucideIcons` kullanımlarının `PhosphorIconsDuotone` / `PhosphorIconsFill` / `PhosphorIconsBold` karşılıklarına dönüştürülmesi ve `PhosphorIcon(...)` veya `Icon(...)` ile tam uyumlu render edilmesi.
    - `test/` altındaki ikon doğrulama testlerinin (`test/theme_and_shell_test.dart`, `test/lessons_screen_test.dart` vb.) yeni `PhosphorIcons` ikonlarıyla güncellenmesi.

```text
GÖREV: TASK-67 — Sıradan Lucide İkonlarından Phosphor Icons (Duotone, Fill & Bold) Sistemine Geçiş
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: Paket Kurulumu
1. `flutter pub add phosphor_flutter` komutuyla `phosphor_flutter` paketini projeye ekle.

ADIM 2: Alt Menü (`AppNavigationBar`) ve Üst Bar (`AppTopBar`) Dönüşümü
1. `lib/app/widgets/app_navigation_bar.dart`:
   - Seçili olmayan `icon` için `PhosphorIconsBold`, seçili `selectedIcon` için `PhosphorIconsFill` kullan:
     - 0 (Ana Sayfa): `PhosphorIconsBold.house` / `PhosphorIconsFill.house`
     - 1 (Dersler): `PhosphorIconsBold.books` / `PhosphorIconsFill.books`
     - 2 (Pratik): `PhosphorIconsBold.gameController` / `PhosphorIconsFill.gameController`
     - 3 (Denemeler): `PhosphorIconsBold.timer` / `PhosphorIconsFill.timer`
     - 4 (İstatistik): `PhosphorIconsBold.chartBar` / `PhosphorIconsFill.chartBar`
     - 5 (Profil): `PhosphorIconsBold.userCircle` / `PhosphorIconsFill.userCircle`
2. `lib/app/widgets/app_top_bar.dart`:
   - Seri (streak) ateşi için `PhosphorIconsFill.fire`, XP için `PhosphorIconsFill.lightning` kullan.

ADIM 3: Dersler, Çalışma Türleri, Ana Sayfa ve Tüm Ekranların `PhosphorIcons` Dönüşümü
1. `lib/features/lessons/data/kpss_lessons.dart`:
   - Tarih: `PhosphorIconsDuotone.scroll`
   - Coğrafya: `PhosphorIconsDuotone.globeHemisphereEast`
   - Vatandaşlık: `PhosphorIconsDuotone.scales`
   - Güncel Bilgiler: `PhosphorIconsDuotone.newspaperClipping`
2. `lib/features/lessons/presentation/widgets/lesson_progress_ring.dart` ve kart ikonlarında `PhosphorIcon(icon, ...)` kullanarak Duotone çift katmanlı görünümü aktif et (Not: `PhosphorIcon` hem `PhosphorIconData` hem normal `IconData` ile veya `Icon` ile çalışır; `PhosphorIcon` widget'ı Duotone katmanını gerçek çift tonlu çizer!).
3. `HomeScreen`, `PracticeHubScreen`, `ExamsScreen`, `StatsScreen`, `ProfileScreen`, `QuizScreen`, `QuizResultScreen`, `MistakesScreen`, `StudyPlannerScreen`, `TrueFalseBlitzScreen`, `ConceptMatchScreen`, `PaywallScreen`, `OnboardingScreen`, `AuthScreen` ve paylaşılan widget'lardaki tüm `LucideIcons` kullanımlarını zengin `PhosphorIconsDuotone`, `PhosphorIconsFill` ve `PhosphorIconsBold` karşılıklarına geçir.

ADIM 4: Testlerin Güncellenmesi ve Doğrulama
1. `test/theme_and_shell_test.dart`, `test/lessons_screen_test.dart`, `test/mascot_coach_banner_test.dart`, `test/overflow_fix_test.dart` ve `test/question_report_test.dart` içindeki ikon beklentilerini yeni `PhosphorIcons` sabitleriyle güncelle.
2. `docs/task-board.md` içinde `TASK-67` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştırıp doğrula.
```

---

### 📦 TASK-68: "Tuğrul Evreni" Maskot Çeşitlendirme (12 Özgün Karakter Modu), Etkileşimli Dokun-Konuş (`Tap-to-Inspire`) ve Dinamik Mood Aurası

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **1. Gerçekten Özgün 12 Tuğrul Karakter Modu (`MascotMood` Genişlemesi):**
    - Daha önce kopya dosyalardan oluşan ders maskotlarının özgün illüstrasyonlarla yenilenmesi ve yeni ekranlar için 4 yeni karakter modunun eklenmesi:
      - `coach`: `assets/images/mascot/tugrul_coach.png` (Kadro Baş Koçu)
      - `victory`: `assets/images/mascot/tugrul_victory.png` (Zafer & Kupa)
      - `detective`: `assets/images/mascot/tugrul_detective.png` (Yanlış Defteri Dedektifi)
      - `pro`: `assets/images/mascot/tugrul_pro.png` (VIP Altın Taçlı Tuğrul)
      - `history`: `assets/images/mascot/tugrul_history.png` (Selçuklu/Osmanlı Börklü & Fermanlı Tarihçi Tuğrul)
      - `geography`: `assets/images/mascot/tugrul_geography.png` (Kâşif Şapkalı, Pusulalı & Küreli Coğrafyacı Tuğrul)
      - `citizenship`: `assets/images/mascot/tugrul_citizenship.png` (Hukuk Cübbeli, Adalet Terazili & Anayasa Kitaplı Tuğrul)
      - `current`: `assets/images/mascot/tugrul_current.png` (Muhabir Gözlüklü, Gazeteli & Mikrofonlu Haberci Tuğrul)
      - `practice`: `assets/images/mascot/tugrul_practice.png` (Alın Bantlı, Oyun Kollu & Şimşek Kartlı Antrenör Tuğrul — `PracticeHubScreen`)
      - `exam`: `assets/images/mascot/tugrul_exam.png` (Altın Kronometreli & Optik Formlu Baş Gözetmen Tuğrul — `ExamsScreen`)
      - `analyst`: `assets/images/mascot/tugrul_analyst.png` (Analist Gözlüklü & Yükselen Grafik Tablolu Stratejist Tuğrul — `StatsScreen` & `StudyPlannerScreen`)
      - `streak`: `assets/images/mascot/tugrul_streak.png` (Alev Auralı Süper-Seri Tuğrul — Seri Rekorları & Yüksek Motivasyon)
  - **2. Etkileşimli "Dokun-Konuş" (`Tap-to-Inspire`) Özelliği (`MascotCoachBanner`):**
    - `MascotCoachBanner` bileşeninin `StatefulWidget` yapısına yükseltilmesi.
    - Kullanıcı Tuğrul'a veya konuşma balonuna dokunduğunda:
      - Tuğrul avatarı tatlı bir mikro-sıçrama (`AnimatedScale`) yapar.
      - O anki `MascotMood` değerine özel tanımlanmış **KPSS Strateji & Ezber Tüyoları Havuzu**ndan (`mood.coachTips`) sıradaki ipucu mesajı konuşma balonunda gösterilir.
      - Sağ üstte küçük bir `"💡 Tüyo Değiştir"` / dokunma göstergesi yer alır.
  - **3. Mood'a Özel Dinamik Çerçeve, Aura ve Rozet İkonu (`mood.badgeIcon`):**
    - Her `MascotMood` kendi karakteristik `PhosphorIconsFill` / `PhosphorIconsDuotone` rozet ikonuna (Tarih -> `scroll`, Coğrafya -> `compass`, Vatandaşlık -> `scales`, Pratik -> `gameController`, Sınav -> `timer`, Analist -> `chartLineUp`, Seri -> `fire`) ve tema uyumlu vurgu rengine sahip olur.
  - **4. Tüm Ekranlarda Özel Tuğrul Modlarının Kullanılması:**
    - `PracticeHubScreen` -> `MascotMood.practice`
    - `ExamsScreen` -> `MascotMood.exam`
    - `StatsScreen` ve `StudyPlannerScreen` -> `MascotMood.analyst`
    - `HomeScreen` -> Seri >= 3 veya günlük hedef tamamlandıysa `MascotMood.streak`, değilse `MascotMood.coach`
    - `LessonsScreen` / `LessonTopicsScreen` / `TopicTestsScreen` -> Derse göre `history`, `geography`, `citizenship`, `current`

```text
GÖREV: TASK-68 — "Tuğrul Evreni" 12 Karakter Modu, Etkileşimli Dokun-Konuş (Tap-to-Inspire) ve Dinamik Mood Aurası
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `MascotMood` Genişlemesi ve Koç Tüyoları Havuzu (`lib/shared/widgets/mascot_coach_banner.dart`)
1. `MascotMood` enum'ına 4 yeni mod ekle:
   `practice`, `exam`, `analyst`, `streak` (Toplam 12 mod).
2. `MascotMoodExtension` içine:
   - `assetPath`: 12 modun her biri için `assets/images/mascot/tugrul_<mood>.png` döndür.
   - `badgeIcon`: Her moda özel `PhosphorIconsFill` ikonu döndür (`scroll`, `globeHemisphereEast`, `scales`, `newspaperClipping`, `gameController`, `timer`, `chartLineUp`, `fire`, `crown`, `magnifyingGlass`, `trophy`, `GraduationCap`).
   - `coachTips`: Her moda özel 4'er adet vurucu KPSS tüyosu / ezber şifresi / motivasyon cümlesi (`List<String>`) tanımla (Örn. Tarih için: "💡 KPSS Tüyosu: Islahat Fermanı'nda gayrimüslimlere siyasi hak değil, devlet memuru olma hakkı verilmiştir!", Coğrafya için: "💡 KPSS Tüyosu: Türkiye'de dağlar doğu-batı uzanışlı olduğu için kuzey-güney yönlü ulaşım maliyeti yüksektir!" vb.).

ADIM 2: Etkileşimli `MascotCoachBanner` (`StatefulWidget`)
1. `MascotCoachBanner` bileşenini `StatefulWidget` yap.
2. Kullanıcı karta veya Tuğrul avatarına tıkladığında (`InkWell` / `GestureDetector`):
   - `_tipIndex` değerini artırarak `widget.mood.coachTips` listesindeki sıradaki KPSS tüyosuna geç (başlangıçta `_tipIndex == -1` iken `widget.message` gösterilir).
   - Avatar üzerinde `AnimatedScale` (150ms) ile hafif bir dokunma tepkisi ver.
   - Üst rozet satırının sağ tarafında zarif bir `💡 Tüyo Al` (`PhosphorIconsFill.lightbulb`) mikro rozeti göster; tıklandıkça `💡 Tüyo 1/4` şeklinde güncellensin.

ADIM 3: Ekranların Yeni Tuğrul Modlarıyla Eşleştirilmesi
1. `PracticeHubScreen`: `mood: MascotMood.practice`
2. `ExamsScreen`: Deneme ekranının en üstüne veya mevcut koç alanına `MascotMood.exam` entegre et.
3. `StatsScreen`: İstatistik ekranında `MascotMood.analyst` kullan.
4. `HomeScreen`: `stats.dailySolvedCount >= stats.dailyGoal` ise `MascotMood.streak`, değilse `MascotMood.coach` kullan.

ADIM 4: Test ve Doğrulama
1. `test/mascot_coach_banner_test.dart` dosyasını genişlet:
   - 12 `MascotMood` değerinin tamamının doğru `assetPath` ve `coachTips` döndürdüğünü doğrula.
   - `MascotCoachBanner` üzerine tıklandığında (`tester.tap`) konuşma balonundaki mesajın koç tüyosuyla değiştiğini doğrula.
2. `docs/task-board.md` içinde `TASK-68` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-69: `AppTopBar` / `AppBar` Uzun Başlık Taşması (`RenderFlex Overflow`) Düzeltmesi & Pratik Sekmesi Akademik İkon/Maskot/Söylem Revizyonu (Oyun Kolu İkonunun Kaldırılması)

- **Durum:** ✅ **Tamamlandı**
- **Kapsam:**
  - **1. `AppTopBar` (`lib/app/widgets/app_top_bar.dart`) ve Diğer `AppBar` Başlık Taşması Düzeltmesi:**
    - `AppTopBar` içindeki `title: Row(...)` bileşeninde yer alan `Text(title)` widget'ının `Flexible` ile sarılmamış olması nedeniyle, `'Çalışma Türleri'` gibi uzun sayfa başlıklarında sağdaki aksiyon rozetleriyle (`0/20` ve `PRO`) çarpışarak `RenderFlex overflowed by X pixels on the right` hatası üretmesi.
    - Çözüm:
      - `AppTopBar` içinde `Text(title)` bileşenini `Flexible` ile sar, `maxLines: 1`, `overflow: TextOverflow.ellipsis` ekle.
      - Dar ekranlarda (`MediaQuery.sizeOf(context).width < 380`) `AppTopBar` avatar boyutunu `32x32`, aradaki boşluğu `8px`, başlık fontunu biraz daha kompakt (`fontSize: 17`) ve sağdaki rozetlerin iç yatay dolgularını (`horizontal: 8`) esnek hale getir ki `'Çalışma Türleri'` başlığı dahi kesilmeden tam okunabilsin.
      - Ayrıca `LessonTopicsScreen`, `TopicTestsScreen`, `QuizScreen` gibi dinamik başlık alan diğer ekranların `AppBar(title: Text(...))` bileşenlerine de `maxLines: 1, overflow: TextOverflow.ellipsis` koruması ekle.
  - **2. Pratik Sekmesi & `MascotMood.practice` Logosu/İkonu Revizyonu ("Oyun Kolu" Yerine Ciddi Akademik Antrenman İkonu):**
    - KPSS ciddi bir memurluk/kariyer sınavı olduğundan, `AppNavigationBar` (`lib/app/widgets/app_navigation_bar.dart`) içindeki 3. sekme (`Pratik`) ve `MascotMood.practice.badgeIcon` (`lib/shared/widgets/mascot_coach_banner.dart`) için kullanılan `gameController` (oyun konsolu kolu) ikonunun tamamen kaldırılması.
    - Yerine hedef odaklı soru çözümünü ve akademik antrenmanı simgeleyen **`PhosphorIconsBold.target`** (seçili değilken) ve **`PhosphorIconsFill.target`** (seçili iken ve `MascotMood.practice.badgeIcon` üzerinde) ikonlarının kullanılması.
    - `PracticeHubScreen` (`lib/features/practice/presentation/practice_hub_screen.dart`) içindeki `"Etkileşimli Mini Oyunlar"` başlığının **`"Hızlı Tekrar & Refleks Antrenmanı"`** olarak, `"Hafıza Oyunu"` rozetinin **`"Kavram Pekiştirme"`** olarak ve `MascotCoachBanner` karşılama mesajındaki `"oyunlarla hafızanı tazele"` ifadesinin **`"hızlı pratik modlarıyla bilgini pekiştir"`** olarak güncellenmesi.
    - `assets/images/mascot/tugrul_practice.png` görselinin de oyun kolu içermeyen, soru kartları ve hedef tahtası/kronometre tutan ciddi akademik antrenör Tuğrul görseliyle güncellenmesi.

```text
GÖREV: TASK-69 — AppTopBar/AppBar Uzun Başlık Taşması (Overflow) Düzeltmesi & Pratik Sekmesi Akademik İkon/Söylem Revizyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Kodların içine eğitici Türkçe doc comment'ler (///) ekle.

ADIM 1: `AppTopBar` (`lib/app/widgets/app_top_bar.dart`) ve `AppBar` Taşma Koruması
1. `lib/app/widgets/app_top_bar.dart` dosyasını güncelle:
   - `final isCompact = MediaQuery.sizeOf(context).width < 380;` kontrolü ekle.
   - `title: Row(mainAxisSize: MainAxisSize.min, children: [...])` içindeki `Text(title, ...)` widget'ını mutlaka `Flexible` ile sar:
     ```dart
     Flexible(
       child: Text(
         title,
         maxLines: 1,
         overflow: TextOverflow.ellipsis,
         style: textTheme.titleLarge?.copyWith(
           fontWeight: FontWeight.w800,
           fontSize: isCompact ? 17 : null,
         ),
       ),
     ),
     ```
   - `isCompact` durumunda sol avatar boyutunu `32x32` (`SizedBox(width: 8)`) ve sağdaki `actions` rozetlerinin yatay padding'ini `isCompact ? 8 : 10`, sağ marjini `isCompact ? 8 : 12` yaparak dar ekranlarda başlığa maksimum alan aç.
2. `lib/features/lessons/presentation/lesson_topics_screen.dart` ve `lib/features/quiz/presentation/quiz_screen.dart` içindeki `AppBar(title: Text(...))` bileşenlerine `maxLines: 1, overflow: TextOverflow.ellipsis` ekle. `lib/features/lessons/presentation/topic_tests_screen.dart` içindeki `AppBar` alt başlığına da `maxLines: 1, overflow: TextOverflow.ellipsis` ekle.

ADIM 2: Pratik Sekmesi ve `MascotMood.practice` İkonundan Oyun Kolunun (`gameController`) Kaldırılması
1. `lib/app/widgets/app_navigation_bar.dart` içinde 2. indeksli `'Pratik'` sekmesinin ikonunu:
   - `icon: PhosphorIcon(PhosphorIconsBold.target)`
   - `selectedIcon: PhosphorIcon(PhosphorIconsFill.target)`
   olarak değiştir (`gameController` tamamen kaldırılsın).
2. `lib/shared/widgets/mascot_coach_banner.dart` içinde `MascotMood.practice` için `badgeIcon` değerini `PhosphorIconsFill.target` yap (`gameController` kaldırılsın) ve `coachTips` içindeki "oyunu" ifadesini "antrenmanı" olarak güncelle.
3. `lib/features/practice/presentation/practice_hub_screen.dart` içinde:
   - `MascotCoachBanner` mesajını: `'Bugün hangi yöntemle pratik yapmak istersin? Konu testi çöz, bilgi kartlarıyla tekrar yap veya hızlı antrenmanlarla bilgini pekiştir!'` olarak güncelle.
   - `'Etkileşimli Mini Oyunlar'` bölüm başlığını `'Hızlı Tekrar & Refleks Antrenmanı'` olarak güncelle.
   - `'Kavram Eşleştir'` kartındaki `'Hafıza Oyunu'` rozetini `'Kavram Pekiştirme'` olarak güncelle.

ADIM 3: Testlerin Güncellenmesi ve Doğrulama
1. `test/theme_and_shell_test.dart`, `test/mascot_coach_banner_test.dart` ve `test/practice_hub_and_reminders_test.dart` içindeki `gameController` veya eski metin referanslarını `PhosphorIconsBold.target` / `PhosphorIconsFill.target` ve yeni metinlerle güncelle.
2. `test/overflow_fix_test.dart` (veya `test/practice_hub_and_reminders_test.dart`) içine 320x640 ve 360x640 dar ekranda `AppTopBar(title: 'Çalışma Türleri')` ve çok uzun bir başlıkla (`'Çok Uzun Bir KPSS Çalışma Sayfası Başlığı Testi'`) `RenderFlex overflow` oluşmadığını doğrulayan bir test ekle.
3. `docs/task-board.md` içinde `TASK-69` durumunu `✅ **Tamamlandı**` yap.
4. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-70: Sonuç Ekranlarında "Tek Bakışta Sıfır Kaydırma" (`Zero-Scroll Single-Viewport`) Kompakt UI/UX Dönüşümü (`QuizResultScreen`, `_BlitzSummaryView`, `_FlashcardsSummaryView`)

- **Durum:** ✅ **Tamamlandı**
- **Problem Analizi:**
  - Sonuç ekranlarında (`QuizResultScreen`, `TrueFalseBlitzScreen` içindeki `_BlitzSummaryView` ve `FlashcardsScreen` içindeki `_FlashcardsSummaryView`) kartların iç dolguları (`padding: 24`), tipografi ölçekleri (`displayMedium`, `headlineMedium`) ve dikey boşluklar (`gapMd`, `gapLg`, `SizedBox(height: 24)`) aşırı büyük olduğu için kullanıcının alt kısımdaki ana aksiyon butonlarına (`Yanlış Defterine Git`, `Ana Sayfaya Dön`, `Tekrar Oyna`) ulaşmak için gereksiz yere ekranı aşağı kaydırması (scroll) gerekiyor.
- **Çözüm (Single-Viewport Kompakt Karne Tasarımı):**
  - Standart bir telefon ekranında (`>= 640px` yükseklik) sonuç ekranı açıldığı anda maskot özeti, net/skor kartları ve tüm alt aksiyon butonları **hiç scroll yapmadan tek bakışta** ekrana sığmalıdır.

```text
GÖREV: TASK-70 — Sonuç Ekranlarında "Tek Bakışta Sıfır Kaydırma" (Zero-Scroll Single-Viewport) Kompakt UI/UX Dönüşümü
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme üzerinden al. Sabit Color(0xFF...) KULLANMA. Mevcut testlerin aradığı metinleri ('Net Puanın', '%... Başarı', 'Doğru', 'Yanlış', 'Boş', 'Zafer Karneni Paylaş 📸', 'Ana Sayfaya Dön' vb.) koru.

ADIM 1: `QuizResultScreen` (`lib/features/quiz/presentation/quiz_result_screen.dart`) Kompaktlaştırılması
1. `ListView` içindeki dikey padding'i `const EdgeInsets.symmetric(horizontal: 16, vertical: 10)` yap; elemanlar arasındaki `AppSpacing.gapMd` (16px) ve `AppSpacing.gapLg` (24px) boşluklarını `AppSpacing.gapXs` (8px) veya `const SizedBox(height: 10)` seviyesine indir.
2. `_NetScoreCard` bileşenini yüksek dikey blok (`vertical: 24`, `displayMedium`) olmaktan çıkarıp yatay ve kompakt bir Başarı Şeridine (`padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)`) dönüştür:
   - `Row` içinde sol tarafta (`Expanded`): `'Net Puanın'` (`labelMedium`) ve hemen altında `result.net.toStringAsFixed(2)` (`headlineMedium` veya `headlineLarge`, `FontWeight.w900`).
   - Sağ tarafta: `'%${result.successRate} Başarı'` rozeti.
3. `_ResultStatItem` (`Doğru`, `Yanlış`, `Boş`) kartlarını kompaktlaştır:
   - `padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8)`
   - İkon boyutu: `size: 18` (`SizedBox(height: 4)`)
   - Sayı metni: `theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: color)`
   - Etiket metni: `theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)`
4. Aksiyon Butonlarını Kompaktlaştır:
   - `'Zafer Karneni Paylaş 📸'` (`FilledButton.tonalIcon`), `'Yanlış Defterine Git (...)'`, `'Bilgi Kartlarıyla Hızlı Tekrar'` ve `'Ana Sayfaya Dön'` butonlarında `style: ...styleFrom(visualDensity: VisualDensity.compact, padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14))` kullanarak butonların devasa yükseklik kaplamasını önle; aralarındaki boşluğu `const SizedBox(height: 8)` tut.

ADIM 2: `_BlitzSummaryView` (`lib/features/games/presentation/true_false_blitz_screen.dart`) Kompaktlaştırılması
1. `_BlitzSummaryView` içindeki `ListView` padding'ini `const EdgeInsets.symmetric(horizontal: 16, vertical: 10)` yap.
2. 2x2 skor kartlarındaki (`Doğru`, `Yanlış`, `Maksimum Kombo`, `Kazanılan XP`) `TactileCard` bileşenlerine `padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)` ver:
   - İkon boyutunu `size: 28` yerine `size: 20` yap (`const SizedBox(height: 4)`).
   - Skor değerlerini `headlineMedium` yerine `titleLarge?.copyWith(fontWeight: FontWeight.w800)` yap.
   - Kart satırları arasındaki boşluğu `const SizedBox(height: 8)`, butonlar öncesi boşluğu `const SizedBox(height: 12)` yap.
3. Alttaki `'Tekrar Oyna'` ve `'Ana Sayfaya Dön'` butonlarını alt alta iki koca blok yapmak yerine yan yana tek satırda (`Row` + `Expanded` + `const SizedBox(width: 10)` + `Expanded`) ve `padding: const EdgeInsets.symmetric(vertical: 10)` ile göster.

ADIM 3: `_FlashcardsSummaryView` (`lib/features/flashcards/presentation/flashcards_screen.dart`) Kompaktlaştırılması
1. `_FlashcardsSummaryView` içindeki `PageHeader` sonrası `const SizedBox(height: 24)` boşluğunu `const SizedBox(height: 10)` yap.
2. `'Kart Çalışması Özeti'` kartındaki `padding: const EdgeInsets.all(24)` değerini `const EdgeInsets.symmetric(vertical: 12, horizontal: 16)` yap ve içeride `Row(mainAxisAlignment: MainAxisAlignment.spaceBetween)` kullanarak sol tarafta `'Kart Çalışması Özeti'`, sağ tarafta `'$totalCards Kart'` (`titleLarge` bold) göster.
3. `'Öğrenildi'` ve `'Tekrar Edilecek'` kartlarındaki `padding: const EdgeInsets.all(16)` değerini `const EdgeInsets.symmetric(vertical: 10, horizontal: 12)` yap; ikon boyutunu `size: 20`, sayıları `titleLarge` yap.
4. Alttaki `'Yeniden Başla'` ve `'Ana Sayfaya Dön'` butonlarını yan yana tek bir `Row` (`Expanded` + `SizedBox(width: 8)` + `Expanded`) içine alarak dikey alanı koru.

ADIM 4: Test ve Doğrulama
1. `test/quiz_screen_test.dart`, `test/flashcards_screen_test.dart`, `test/games_screen_test.dart` ve `test/overflow_fix_test.dart` testlerinin tamamının geçtiğini ve standart telefon ekranında (`390x844` ve `360x640`) `QuizResultScreen` içindeki `'Ana Sayfaya Dön'` butonunun kaydırma gerekmeden ekranda (`hitTestable`) yer aldığını doğrula.
2. `docs/task-board.md` içinde `TASK-70` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-71: Mobil Ekranlar İçin `AppBar` ve Alt Detay Sayfası Başlık Tipografisi Ölçeklemesi (Kesilmeleri Önleyen Kompakt Başlık Sistemi)

- **Durum:** ✅ **Tamamlandı**
- **Problem Analizi:**
  - Material 3 varsayılan olarak `AppBar` başlıklarında `titleLarge` (`22px`) kullanır. Türkçe akademik ders ve konu başlıkları (`"Tarih Konuları"`, `"Güncel Bilgiler Konuları"`, `"İslamiyet Öncesi Türk Tarihi"`, `"Osmanlı Kültür ve Uygarlığı"`) `22px` boyutta mobil ekranlarda aşırı büyük durmakta ve yanındaki geri butonu / aksiyon butonları nedeniyle kesilmektedir (`...`).
  - Aynı şekilde `TopicTestsScreen` ve `LessonTopicsScreen` içindeki `MascotCoachBanner` başlığı (`titleMedium`, `maxLines: 1`) uzun konu adlarında hem büyük durmakta hem de tek satırda kesilmektedir.
- **Çözüm:**
  - Global `AppTheme` (`lib/app/theme.dart`) içinde `appBarTheme` tanımlanarak tüm `AppBar` başlıklarının varsayılan boyutu `22px` yerine zarif ve okunaklı `16px` (`FontWeight.w700`, `letterSpacing: -0.2`) ve `titleSpacing: 4` seviyesine çekilir; `titleLarge` (`18.5px`) ve `titleMedium` (`15.5px`) ölçekleri mobil ekranlara göre dengelenir.
  - `LessonTopicsScreen`, `TopicTestsScreen`, `QuizScreen` ve `AppTopBar` başlıkları ile `MascotCoachBanner` başlığı mobil ekranlarda kesilmeden tam okunacak şekilde optimize edilir.

```text
GÖREV: TASK-71 — Mobil Ekranlar İçin AppBar ve Alt Detay Sayfası Başlık Tipografisi Ölçeklemesi
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Sabit fontSize yalnızca lib/app/theme.dart içinde tanımlanabilir; diğer ekranlarda Theme.of(context).textTheme stillerini (titleSmall, titleMedium, labelMedium vb.) kullan!

ADIM 1: Global Tema Tipografi ve `AppBarTheme` Ölçeklemesi (`lib/app/theme.dart`)
1. `lib/app/theme.dart` içindeki `_buildTextTheme` metodunda başlık boyutlarını mobil ekranlarda kaba durmayacak şekilde rafine et (hem test ortamı erken dönüşünde hem `GoogleFonts.plusJakartaSans` dönüşünde):
   - `headlineSmall`: `fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.3`
   - `titleLarge`: `fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.25` (M3'ün 22px devasa boyutu yerine zarif 18px)
   - `titleMedium`: `fontSize: 15.5, fontWeight: FontWeight.w600, letterSpacing: -0.15`
   - `titleSmall`: `fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: -0.1`
2. `AppTheme.light` ve `AppTheme.dark` içinde `copyWith` içine `appBarTheme` ekle:
   ```dart
   appBarTheme: baseLight.appBarTheme.copyWith(
     titleSpacing: 4,
     titleTextStyle: textTheme.titleMedium?.copyWith(
       fontWeight: FontWeight.w700,
       color: highContrastScheme.onSurface,
     ),
   ),
   ```
   (Dark temada da `baseDark.appBarTheme` ve `highContrastDarkScheme.onSurface` ile aynısını uygula). Böylece tüm alt sayfalardaki `AppBar` başlıkları 22px yerine zarif `titleMedium` (15.5px) boyutunda ve geri butonuna yakın (`titleSpacing: 4`) çizilir!

ADIM 2: `AppTopBar`, `LessonTopicsScreen`, `TopicTestsScreen` ve `QuizScreen` Başlık Düzenlemeleri
1. `lib/app/widgets/app_top_bar.dart`:
   - `AppTopBar` başlığındaki `Text(title)` stilini `textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)` yap (böylece `'Çalışma Türleri'` gibi başlıklar mobil ekranda aşırı büyük durmaz ve kesilmez).
2. `lib/features/lessons/presentation/lesson_topics_screen.dart`:
   - `AppBar` içinde `titleSpacing: 0` ver, `title: Text('${lesson.name} Konuları', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800))` kullan.
   - Sağdaki `'Tümünü İndir'` (`TextButton.icon`) butonuna `style: TextButton.styleFrom(visualDensity: VisualDensity.compact, padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6))` ve `label: Text('Tümünü İndir', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700))` vererek başlığın alanını daraltmasını önle.
3. `lib/features/lessons/presentation/topic_tests_screen.dart`:
   - `'İslamiyet Öncesi Türk Tarihi'` gibi uzun konu adlarının yer aldığı `AppBar` içinde `titleSpacing: 0` ver ve üst satırdaki `Text(widget.topic)` bileşenine `style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)` (14px) ver; böylece en uzun konu başlıkları dahi mobilde kaba durmaz ve kesilmez!
4. `lib/features/quiz/presentation/quiz_screen.dart`:
   - `AppBar` içinde `titleSpacing: 0` ve `title: Text(widget.customTitle ?? '${question.lesson} Testi', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800))` kullan.

ADIM 3: `MascotCoachBanner` Başlık Uyumu (`lib/shared/widgets/mascot_coach_banner.dart`)
1. `lib/shared/widgets/mascot_coach_banner.dart` içindeki `Text(widget.title)` bileşeninde:
   - Stili her zaman `textTheme.titleSmall?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w800)` yap (mobilde `'İslamiyet Öncesi Türk Tarihi Testleri'` veya `'Tarih Yol Haritası'` başlığının kart içinde aşırı büyük durmasını önler).
   - `maxLines: 2` yap ki `'İslamiyet Öncesi Türk Tarihi Testleri'` gibi uzun konu başlıkları yarıda `...` ile kesilmek yerine temiz şekilde alt satıra geçebilsin.

ADIM 4: Test ve Doğrulama
1. `test/overflow_fix_test.dart` içine 360x640 dar mobil ekranda `LessonTopicsScreen` (`'Güncel Bilgiler Konuları'` ve `'Tarih Konuları'`) ve `TopicTestsScreen` (`'İslamiyet Öncesi Türk Tarihi'`) açıldığında başlıkların taşma yapmadan ve `titleMedium` / `titleSmall` ölçeğinde (`fontSize <= 16`) render edildiğini doğrulayan bir widget testi ekle.
2. `docs/task-board.md` içinde `TASK-71` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-72: Proje Genelinde Standart Tipografi & Font-Size Ölçek Sistemi (`AppTheme` Modüler Tipografi Standardı & Sıfır Hardcoded `fontSize`)

- **Durum:** ✅ **Tamamlandı**
- **Problem Analizi:**
  - `lib/app/theme.dart` içinde yalnızca 4 başlık stiline (`headlineSmall`, `titleLarge`, `titleMedium`, `titleSmall`) açık `fontSize` verilmiş; diğer stiller (`display*`, `headlineLarge/Medium`, `bodyLarge/Medium/Small`, `labelLarge/Medium/Small`) ham Material 3 varsayılanlarında bırakılmıştır.
  - Ayrıca 7 farklı dosyada (`home_screen.dart`, `practice_hub_screen.dart`, `mascot_coach_banner.dart`, `achievement_showcase.dart`, `candidate_hero_card.dart`, `profile_metrics_card.dart`, `app_navigation_bar.dart`) yerel `fontSize: 9`, `9.5`, `10`, `10.5`, `11` gibi manuel ezmeler (overrides) bulunmakta; farklı ekranlarda aynı hiyerarşideki kart başlıkları (`HomeScreen` `headlineSmall` 20px vs `ExamsScreen` `titleSmall` 14px vs `LessonsScreen` `titleMedium` 15.5px) farklı boyutlar kullanmaktadır.
- **Kadro Standart Mobil Tipografi Ölçeği (`lib/app/theme.dart`):**
  - `displayLarge`: `32px`, `w800`, `height: 1.15`, `letterSpacing: -0.5`
  - `displayMedium`: `28px`, `w800`, `height: 1.15`, `letterSpacing: -0.4`
  - `displaySmall`: `24px`, `w800`, `height: 1.20`, `letterSpacing: -0.35` (Hikaye paylaşım kartı net skoru)
  - `headlineLarge`: `22px`, `w800`, `height: 1.20`, `letterSpacing: -0.3`
  - `headlineMedium`: `20px`, `w800`, `height: 1.25`, `letterSpacing: -0.25` (Karne ana net skoru)
  - `headlineSmall`: `18px`, `w700`, `height: 1.25`, `letterSpacing: -0.2` (Büyük özet metrikleri, boş durum ana başlıkları)
  - `titleLarge`: `16.5px`, `w700`, `height: 1.30`, `letterSpacing: -0.2` (`PageHeader`, `CandidateHeroCard` aday adı, özet istatistik sayıları)
  - `titleMedium`: `15px`, `w700`, `height: 1.30`, `letterSpacing: -0.15` (**Standart `AppBar` / `AppTopBar` Sayfa Başlığı**, **Tam Genişlik Ana Kart Başlıkları** (`LessonsScreen`, `ExamsScreen`, `HomeScreen`), **`SectionTitle`**)
  - `titleSmall`: `13.5px`, `w700`, `height: 1.30`, `letterSpacing: -0.1` (**Alt Detay `AppBar` Başlığı**, **`MascotCoachBanner` Başlığı**, **2'li Grid ve Liste Kart Başlıkları**)
  - `bodyLarge`: `15px`, `w500`, `height: 1.45`, `letterSpacing: 0` (**Soru Kökü Metni**, Bilgi Kartı ana metni)
  - `bodyMedium`: `13.5px`, `w400`, `height: 1.40`, `letterSpacing: 0` (**Şık Metinleri (`OptionTile`)**, standart gövde metni)
  - `bodySmall`: `12px`, `w400`, `height: 1.35`, `letterSpacing: 0` (**Kart Alt Açıklamaları**, `MascotCoachBanner` konuşma balonu, soru çözüm açıklaması)
  - `labelLarge`: `13px`, `w700`, `height: 1.20`, `letterSpacing: 0.1` (Birincil/İkincil Buton metinleri)
  - `labelMedium`: `11.5px`, `w700`, `height: 1.20`, `letterSpacing: 0.1` (Üst bar rozetleri, çipler, orta etiketler)
  - `labelSmall`: `10.5px`, `w700`, `height: 1.15`, `letterSpacing: 0.1` (**Tüm Mikro Rozetler / Pill Etiketler / Alt Menü Etiketleri**)

```text
GÖREV: TASK-72 — Proje Genelinde Standart Tipografi & Font-Size Ölçek Sistemi (AppTheme Modüler Tipografi Standardı & Sıfır Hardcoded fontSize)
ÖNEMLİ: GEMINI.md kuralı gereği sabit `fontSize` YALNIZCA `lib/app/theme.dart` içinde tanımlanabilir! Diğer hiçbir dosyada `fontSize:` parametresi KULLANMA; her yerde `Theme.of(context).textTheme` rollerini kullan.

ADIM 1: `lib/app/theme.dart` İçinde 15 Metin Stilinin Tamamını Standartlaştırma
1. `lib/app/theme.dart` içindeki `_buildTextTheme(TextTheme base)` metodunda hem `FLUTTER_TEST` erken dönüşünde hem de `GoogleFonts` dönüşünde 15 M3 stilinin tamamını şu standart ölçekle tanımla:
   - Başlıklar (`Plus Jakarta Sans`):
     - `displayLarge`: `fontSize: 32, fontWeight: FontWeight.w800, height: 1.15, letterSpacing: -0.5`
     - `displayMedium`: `fontSize: 28, fontWeight: FontWeight.w800, height: 1.15, letterSpacing: -0.4`
     - `displaySmall`: `fontSize: 24, fontWeight: FontWeight.w800, height: 1.20, letterSpacing: -0.35`
     - `headlineLarge`: `fontSize: 22, fontWeight: FontWeight.w800, height: 1.20, letterSpacing: -0.3`
     - `headlineMedium`: `fontSize: 20, fontWeight: FontWeight.w800, height: 1.25, letterSpacing: -0.25`
     - `headlineSmall`: `fontSize: 18, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.2`
     - `titleLarge`: `fontSize: 16.5, fontWeight: FontWeight.w700, height: 1.30, letterSpacing: -0.2`
     - `titleMedium`: `fontSize: 15, fontWeight: FontWeight.w700, height: 1.30, letterSpacing: -0.15`
     - `titleSmall`: `fontSize: 13.5, fontWeight: FontWeight.w700, height: 1.30, letterSpacing: -0.1`
   - Gövde ve Etiketler (`Inter`):
     - `bodyLarge`: `fontSize: 15, fontWeight: FontWeight.w500, height: 1.45`
     - `bodyMedium`: `fontSize: 13.5, fontWeight: FontWeight.w400, height: 1.40`
     - `bodySmall`: `fontSize: 12, fontWeight: FontWeight.w400, height: 1.35`
     - `labelLarge`: `fontSize: 13, fontWeight: FontWeight.w700, height: 1.20, letterSpacing: 0.1`
     - `labelMedium`: `fontSize: 11.5, fontWeight: FontWeight.w700, height: 1.20, letterSpacing: 0.1`
     - `labelSmall`: `fontSize: 10.5, fontWeight: FontWeight.w700, height: 1.15, letterSpacing: 0.1`

ADIM 2: `lib/app/theme.dart` Dışındaki Tüm Sabit `fontSize:` Kullanımlarını Temizleme
1. Şu 7 dosyadaki tüm `fontSize:` satırlarını kaldır ve doğrudan ilgili `textTheme` stilini (`labelSmall`, `bodySmall`, `titleSmall`, `titleMedium`) kullan:
   - `lib/app/widgets/app_navigation_bar.dart`: `fontSize: isCompact ? 9.5 : 11.0` satırını kaldır; `base?.copyWith(letterSpacing: isCompact ? -0.5 : -0.2, ...)` kullan (`labelSmall` zaten `10.5px`!).
   - `lib/shared/widgets/mascot_coach_banner.dart`: 3 yerdeki `fontSize:` satırını kaldır (`badgeLabel` ve `Tüyo Al` için `textTheme.labelSmall`, konuşma balonu için `textTheme.bodySmall`).
   - `lib/features/home/presentation/home_screen.dart`: `line 228` civarındaki `fontSize: isCompact ? 11 : null` satırını kaldır (`textTheme.bodySmall` veya `labelMedium` kullan).
   - `lib/features/practice/presentation/practice_hub_screen.dart`: 5 yerdeki `fontSize: isCompact ? ...` satırını kaldır (`badgeText` için `textTheme.labelSmall`, açıklama için `textTheme.bodySmall`, aksiyon için `textTheme.labelMedium`).
   - `lib/features/profile/presentation/widgets/achievement_showcase.dart`: `fontSize: 11` ve `fontSize: 9` satırlarını kaldır; rozet başlığı için `textTheme.labelMedium`, alt açıklaması için `textTheme.labelSmall` kullan.
   - `lib/features/profile/presentation/widgets/candidate_hero_card.dart`: `fontSize: 10` satırını kaldır (`textTheme.labelSmall` kullan).
   - `lib/features/profile/presentation/widgets/profile_metrics_card.dart`: `fontSize: 10` satırını kaldır (`textTheme.labelSmall` kullan) ve metrik değerini `textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)` yap.

ADIM 3: Ekranlar Arası Başlık Hiyerarşisi Uyumu
1. `lib/shared/widgets/section_title.dart`: `SectionTitle` stilini `textTheme.titleMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800)` yap (böylece bölüm başlıkları `15px` olur ve içindeki `13.5px` `titleSmall` kart başlıklarından net şekilde ayrışır).
2. `lib/features/home/presentation/home_screen.dart`: `_ContinueCard` içindeki konu başlığında `headlineSmall` yerine `textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)` kullan (diğer ana kartlarla birebir aynı ölçekte olsun).
3. `lib/features/exams/presentation/exams_screen.dart`: Deneme paketi kart başlığında (`_ExamPackageCard`) `titleSmall` yerine `theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)` kullan (`LessonsScreen` ana ders kartlarıyla aynı `15px` ölçekte olsun).

ADIM 4: Test ve Doğrulama
1. `lib/` altında `lib/app/theme.dart` dışında hiçbir dosyada `fontSize:` kalmadığını doğrula.
2. `test/theme_and_shell_test.dart` içine `AppTheme.light.textTheme` içindeki 15 metin stilinin tamamının hiyerarşik olarak doğru `fontSize` değerlerine (`displayLarge > displayMedium > displaySmall > headlineLarge > headlineMedium > headlineSmall > titleLarge > titleMedium > titleSmall` ve `bodyLarge > bodyMedium > bodySmall` ve `labelLarge > labelMedium > labelSmall`) sahip olduğunu doğrulayan bir birim testi ekle.
3. `docs/task-board.md` içinde `TASK-72` durumunu `✅ **Tamamlandı**` yap.
4. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-73: `ui-ux-pro-max` Mobil Tipografi (`Base 16px`: `28-24-20-18-16-15-14-12-11 px`) ve 3 Kademeli Padding Hiyerarşisi Revizyonu

- **Durum:** 🔄 **Devam Ediyor**
- **Problem Analizi:**
  - `TASK-71` ve `TASK-72` sonrasında `titleSmall: 13.5px`, `titleMedium: 15px`, `bodyMedium: 13.5px`, `bodySmall: 12px` değerleri gerçek bir telefon ekranında kartların ve ikonların yanında aşırı küçük (mikro yazı gibi) kalmış; başlıklar ile gövde metinleri arasındaki görsel kontrast kaybolmuştur.
- **`ui-ux-pro-max` & iOS HIG / Material 3 Gerçek Mobil Ölçeği (`design-system/kadro/MASTER.md` Bölüm 7):**
  - `displayLarge`: `32px`, `w800`, `height: 1.15`, `letterSpacing: -0.5`
  - `displayMedium`: `28px`, `w800`, `height: 1.15`, `letterSpacing: -0.4`
  - `displaySmall`: `24px`, `w800`, `height: 1.20`, `letterSpacing: -0.35`
  - `headlineLarge`: `24px`, `w800`, `height: 1.20`, `letterSpacing: -0.3`
  - `headlineMedium`: `22px`, `w800`, `height: 1.25`, `letterSpacing: -0.25`
  - `headlineSmall`: `20px`, `w800`, `height: 1.25`, `letterSpacing: -0.25` (`PageHeader`, `CandidateHeroCard` aday ismi, `StatsScreen` büyük özet metrikleri)
  - `titleLarge`: `18px`, `w700`, `height: 1.25`, `letterSpacing: -0.2` (**`AppTopBar` Ana Başlık**, **`SectionTitle` Bölüm Başlıkları**, **`LessonsScreen` Ana Ders Kartı Başlıkları** (`Tarih`, `Coğrafya`), Sonuç Kutusu Sayıları)
  - `titleMedium`: `16px`, `w700`, `height: 1.30`, `letterSpacing: -0.15` (**`MascotCoachBanner` Başlığı**, **Alt Sayfa `AppBar` Başlığı**, **Tam Genişlik Kart Başlıkları** (`ExamsScreen`, `HomeScreen` Son Kalınan Yer & Günlük Hedef, `TopicTestsScreen` Test 1/2))
  - `titleSmall`: `15px`, `w700`, `height: 1.30`, `letterSpacing: -0.1` (**2'li Bento Grid Kart Başlıkları** (`PracticeHubScreen`), **Konu Yol Haritası Başlıkları** (`LessonTopicsScreen`), **Uzun Konu Adlı `AppBar` Başlığı** (`TopicTestsScreen`, `QuizScreen`))
  - `bodyLarge`: `16px`, `w500`, `height: 1.50` (**Soru Kökü Metni** (`QuizScreen`), **Bilgi Kartı Ön/Arka Yüz Metni** (`FlashcardsScreen`))
  - `bodyMedium`: `14px`, `w400`, `height: 1.45` (**Şık Metinleri** (`OptionTile`), **`MascotCoachBanner` Konuşma Balonu Metni**, **Ana Kart Alt Açıklamaları** (`LessonsScreen`, `ExamsScreen`, `HomeScreen`), **Çözüm Açıklamaları**)
  - `bodySmall`: `12px`, `w500`, `height: 1.35` (2'li Grid Kart Alt Açıklamaları, İkincil Meta Bilgiler ve Sayaçlar)
  - `labelLarge`: `14px`, `w700`, `height: 1.20`, `letterSpacing: 0.1` (Tüm Ana Butonlar: `FilledButton`, `OutlinedButton`)
  - `labelMedium`: `12px`, `w700`, `height: 1.20`, `letterSpacing: 0.1` (Üst Bar Rozetleri `0/20`, Filtre Çipleri, Aksiyon Linkleri)
  - `labelSmall`: `11px`, `w700`, `height: 1.15`, `letterSpacing: 0.1` (Kart Üstü Pill Rozetler ve `AppNavigationBar` Sekme Yazıları)

```text
GÖREV: TASK-73 — ui-ux-pro-max Mobil Tipografi (Base 16px: 28-24-20-18-16-15-14-12-11 px) ve 3 Kademeli Padding Hiyerarşisi Revizyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Sabit `fontSize` YALNIZCA `lib/app/theme.dart` içinde tanımlanabilir!

ADIM 1: `lib/app/theme.dart` İçinde Gerçek Mobil Tipografi Ölçeğini Tanımlama
1. `lib/app/theme.dart` içindeki `_buildTextTheme(TextTheme base)` metodunda (hem `FLUTTER_TEST` erken dönüşünde hem de `GoogleFonts` dönüşünde) şu boyutları birebir uygula:
   - `displayLarge`: `fontSize: 32, fontWeight: FontWeight.w800, height: 1.15, letterSpacing: -0.5`
   - `displayMedium`: `fontSize: 28, fontWeight: FontWeight.w800, height: 1.15, letterSpacing: -0.4`
   - `displaySmall`: `fontSize: 24, fontWeight: FontWeight.w800, height: 1.20, letterSpacing: -0.35`
   - `headlineLarge`: `fontSize: 24, fontWeight: FontWeight.w800, height: 1.20, letterSpacing: -0.3`
   - `headlineMedium`: `fontSize: 22, fontWeight: FontWeight.w800, height: 1.25, letterSpacing: -0.25`
   - `headlineSmall`: `fontSize: 20, fontWeight: FontWeight.w800, height: 1.25, letterSpacing: -0.25`
   - `titleLarge`: `fontSize: 18, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.2`
   - `titleMedium`: `fontSize: 16, fontWeight: FontWeight.w700, height: 1.30, letterSpacing: -0.15`
   - `titleSmall`: `fontSize: 15, fontWeight: FontWeight.w700, height: 1.30, letterSpacing: -0.1`
   - `bodyLarge`: `fontSize: 16, fontWeight: FontWeight.w500, height: 1.50`
   - `bodyMedium`: `fontSize: 14, fontWeight: FontWeight.w400, height: 1.45`
   - `bodySmall`: `fontSize: 12, fontWeight: FontWeight.w500, height: 1.35`
   - `labelLarge`: `fontSize: 14, fontWeight: FontWeight.w700, height: 1.20, letterSpacing: 0.1`
   - `labelMedium`: `fontSize: 12, fontWeight: FontWeight.w700, height: 1.20, letterSpacing: 0.1`
   - `labelSmall`: `fontSize: 11, fontWeight: FontWeight.w700, height: 1.15, letterSpacing: 0.1`
2. `AppTheme.light` ve `AppTheme.dark` içindeki `appBarTheme` yapılandırmasında `titleTextStyle` olarak `textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: ...)` (`16px`) kullanmaya devam et.

ADIM 2: Ekran ve Bileşen Tipografi & Padding Hiyerarşisini Güncelleme
1. **`AppTopBar` (`lib/app/widgets/app_top_bar.dart`):**
   - Ana sekme başlığı (`title`) için `isCompact ? textTheme.titleMedium : textTheme.titleLarge` (`fontWeight: FontWeight.w800`) kullan (standart telefonda `18px`, `<380px` dar ekranda `16px`).
2. **`SectionTitle` (`lib/shared/widgets/section_title.dart`):**
   - Bölüm başlıklarının (`"Dersler"`, `"Çalışma türleri"`, `"Özel Antrenman"`) altındaki kartlardan net biçimde ayrışması için stilini `textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w800)` (`18px`) yap ve padding'ini `const EdgeInsets.fromLTRB(2, 10, 2, 10)` olarak düzenle.
3. **`MascotCoachBanner` (`lib/shared/widgets/mascot_coach_banner.dart`):**
   - Kart içi padding'ini `horizontal: isCompact ? 12 : 14, vertical: isCompact ? 10 : 12` yap.
   - Başlık (`widget.title`): `style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w800)` (`16px`) ve `maxLines: 2` yap.
   - Konuşma Balonu Metni (`displayedMessage`): Küçük kalan `bodySmall` (`12px`) yerine **`textTheme.bodyMedium`** (`14px`, `height: 1.4`) kullan!
4. **`LessonsScreen` (`lib/features/lessons/presentation/lessons_screen.dart`):**
   - Ana ders kartı başlıklarını (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) `theme.textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w800)` (`18px`) yap.
   - Altındaki `'Sınavda X soru · Y konu'` metnini `theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)` (`14px`) yap.
5. **`LessonTopicsScreen` (`lib/features/lessons/presentation/lesson_topics_screen.dart`):**
   - `AppBar` içinde `'${lesson.name} Konuları'` başlığı `titleMedium` (`16px`, `w800`) olsun. Sağdaki indirme butonunun başlığı sıkıştırmaması için `Tooltip(message: 'Tümünü İndir')` koruyarak buton içindeki görünür metni kompakt `'İndir'` (veya ikon + `'Tümünü İndir'` kompakt `padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)`) yap.
   - `_TopicPathNode` içindeki konu başlığı `textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)` (`15px`) olsun (kesilme olmasın).
6. **`TopicTestsScreen` (`lib/features/lessons/presentation/topic_tests_screen.dart`):**
   - `AppBar` içindeki `widget.topic` (`'İslamiyet Öncesi Türk Tarihi'`) başlığı `textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)` (`15px`) olsun.
   - Test kartlarındaki `'Test 1'`, `'Test 2'` başlıkları `textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)` (`16px`), altındaki zorluk açıklaması `textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)` (`14px`) olsun.
7. **`PracticeHubScreen` (`lib/features/practice/presentation/practice_hub_screen.dart`):**
   - `_PracticeTile` (2x2 Bento Grid kartları) iç dolgusu `padding: EdgeInsets.all(isCompact ? 12 : 14)` olsun; kart başlığı `textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)` (`15px`) olsun.
   - `_DistractorHuntSpecialCard` (tam genişlik özel kart) başlığı `textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)` (`16px`), açıklaması `textTheme.bodyMedium` (`14px`) olsun.
8. **`ExamsScreen` (`lib/features/exams/presentation/exams_screen.dart`) & `HomeScreen` (`lib/features/home/presentation/home_screen.dart`):**
   - Tam genişlik kart başlıkları `titleMedium` (`16px`, `w800`), açıklamaları `bodyMedium` (`14px`) olsun.

ADIM 3: Testlerin Güncellenmesi ve Doğrulama
1. `test/theme_and_shell_test.dart` ve `test/overflow_fix_test.dart` içindeki font boyutu beklentilerini yeni `ui-ux-pro-max` mobil ölçeğine (`titleLarge: 18`, `titleMedium: 16`, `titleSmall: 15`, `bodyLarge: 16`, `bodyMedium: 14`, `bodySmall: 12`, `labelLarge: 14`, `labelMedium: 12`, `labelSmall: 11`) göre güncelle ve 360x640 dar ekranda sıfır taşma (`RenderFlex overflow`) olduğunu doğrula.
2. `docs/task-board.md` içinde `TASK-73` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-74: Dikey Hizalama & Kenar Kılavuz Çizgisi Standardizasyonu (`AppTopBar`, `Body`, `SectionTitle`, `AppNavigationBar` ve `AppBarTheme` Sol/Sağ Flush Alignment)

- **Durum:** 🔄 **Devam Ediyor**
- **Problem Analizi:**
  - `lib/app/theme.dart` içindeki `appBarTheme` üzerinde `titleSpacing: 4` tanımlandığı için, geri butonu (`leading`) olmayan `AppTopBar` (ve `QuizResultScreen` `AppBar`) başlığı soldan sadece **`4px`** içeriden başlamakta; oysa altındaki sayfa gövdesi (`AppSpacing.pagePadding(context)`) soldan **`16px`** (kompakt: `12px`, tablet: `24px`) içeriden başlamaktadır. Bu durum üst barın sol kenarının gövdedeki kartlara göre `12px` sola kayık (hizasız) durmasına yol açmaktadır.
  - Aynı şekilde `AppTopBar`'ın sağındaki `PRO` rozetinin sağ marjini `12px` (`isCompact ? 8 : 12`), `AppNavigationBar`'ın yatay padding'i `14px` (`isCompact ? 6 : 14`) ve `SectionTitle`'ın yatay padding'i `2px` olduğu için sol ve sağ dikey hiza çizgileri birbirini tutmamaktadır.
- **Çözüm (100% Flush Vertical Grid Line):**
  - `AppTopBar` sol (`titleSpacing`) ve sağ (`PRO` rozeti sağ marjini), `Body` (`AppSpacing.pagePadding`), `SectionTitle` (`horizontal: 0`) ve `AppNavigationBar` yan boşlukları tamamen `ResponsiveBreakpoints.horizontalPadding(context)` (`12px` / `16px` / `24px`) değerine bağlanarak yukarıdan aşağıya jilet gibi tek bir sol ve sağ hiza çizgisi oluşturulur.

```text
GÖREV: TASK-74 — Dikey Hizalama & Kenar Kılavuz Çizgisi Standardizasyonu (AppTopBar, Body, SectionTitle, AppNavigationBar ve AppBarTheme Sol/Sağ Flush Alignment)
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy.

ADIM 1: `lib/app/theme.dart` (`appBarTheme` `titleSpacing` Düzeltmesi)
1. `lib/app/theme.dart` içindeki `AppTheme.light` ve `AppTheme.dark` altında yer alan `appBarTheme` içindeki `titleSpacing: 4` satırını `titleSpacing: 16` yap (böylece geri butonu olmayan tüm `AppBar` başlıkları standart `16px` sayfa kenar dolgusuyla birebir aynı hizadan başlar).

ADIM 2: `AppTopBar` (`lib/app/widgets/app_top_bar.dart`) Sol ve Sağ Kenar Hizalaması
1. `lib/app/widgets/app_top_bar.dart` içine `import 'package:kadro/core/utils/responsive_layout.dart';` ekle.
2. `build` içinde `final hPadding = ResponsiveBreakpoints.horizontalPadding(context);` tanımla (`<380px` için `12.0`, standart telefon için `16.0`, tablet için `24.0`).
3. `AppBar` içinde `titleSpacing: hPadding` ver! Böylece sol taraftaki Kadro Koçu avatarının sol kenarı, altındaki `MascotCoachBanner` ve tüm kartların sol kenarıyla (`hPadding`) **milimetrik olarak aynı dikey çizgide** hizalanır.
4. Sağdaki `PRO` rozet konteynerinin `margin` değerini `EdgeInsets.only(right: hPadding)` yap! Böylece sağdaki `PRO` rozetinin sağ kenarı da altındaki kartların sağ kenarıyla (`hPadding`) **milimetrik olarak aynı dikey çizgide** hizalanır.

ADIM 3: `SectionTitle` (`lib/shared/widgets/section_title.dart`) ve `AppNavigationBar` (`lib/app/widgets/app_navigation_bar.dart`) Hizalaması
1. `lib/shared/widgets/section_title.dart` içinde `padding: const EdgeInsets.fromLTRB(2, 10, 2, 10)` değerini `const EdgeInsets.only(top: 6, bottom: 10)` (`horizontal: 0`) yap. Böylece bölüm başlıkları (`"Dersler"`, `"Çalışma türleri"` vb.) içeriden `2px` kaçmak yerine kartların sol kenarıyla %100 sıfıra sıfır (flush) hizalanır.
2. `lib/app/widgets/app_navigation_bar.dart` içinde alt menünün dış `Padding` değerini `EdgeInsets.fromLTRB(ResponsiveBreakpoints.horizontalPadding(context), 4, ResponsiveBreakpoints.horizontalPadding(context), 12)` yap (ancak `<380px` çok dar ekranlarda 6 sekmenin sığması için `isCompact ? 8.0 : ResponsiveBreakpoints.horizontalPadding(context)` kullan). Böylece standart telefonlarda (`16px`) ve tabletlerde (`24px`) alt dock menüsü de üstteki kartlarla birebir aynı sol/sağ hizaya oturur.

ADIM 4: Test ve Doğrulama
1. `test/theme_and_shell_test.dart` (veya `test/app_spacing_test.dart`) içine standart telefon ekranında (`390x844`) `AppShell` içindeki `AppTopBar` sol avatar başlangıç X koordinatının (`tester.getTopLeft(...)`) ve `PRO` rozetinin sağ bitiş X koordinatının (`tester.getTopRight(...)`) gövdedeki `MascotCoachBanner` / kartların sol ve sağ X koordinatlarıyla (`16.0` ve `390.0 - 16.0 = 374.0`) birebir aynı hizada olduğunu doğrulayan bir hizalama testi ekle!
2. `docs/task-board.md` içinde `TASK-74` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-75: Çözülen Test / Konu / Deneme Kartlarında Tamamlanma Durumu (`✅ Çözüldü` Rozeti, Son Net Özeti & `Tekrar Çöz` Aksiyonu) + Konu Kartı İndir İkonlarının ve Test Kartı Gereksiz Açıklamalarının Temizlenmesi

- **Durum:** 🔄 **Devam Ediyor**
- **Kapsam:**
  1. **Proje Genelinde Çözülen Test / Konu / Deneme Kartı Görsel Farkındalığı (`StudyStatsState` Yardımcıları + UI):**
     - `StudyStatsState` (`lib/features/stats/data/study_stats_notifier.dart`) içine yardımcı sorgu metotları eklenir:
       - `QuizSessionRecord? findLatestSessionForTest({required String lesson, required String topic, required int testNumber})`: `sessionHistory` içinde `s.title.contains('$lesson · $topic · Test $testNumber')` koşulunu sağlayan en güncel kaydı döner.
       - `int countSolvedTestsForTopic({required String lesson, required String topic})`: O konuya ait kaç farklı test numarasının (`Test 1`, `Test 2` vb.) çözüldüğünü döner.
       - `QuizSessionRecord? findLatestSessionForTitle(String titlePrefix)`: Denemeler (`ExamsScreen`) için `s.title.startsWith(titlePrefix)` koşulunu sağlayan en güncel kaydı döner.
     - **`TopicTestsScreen` (`lib/features/lessons/presentation/topic_tests_screen.dart`):**
       - Eğer test daha önce çözülmüşse (`solvedSession != null`):
         - `TactileCard` `borderColor: colorScheme.secondary.withAlpha(160)` ve `backgroundColor: colorScheme.secondaryContainer.withAlpha(35)` olur.
         - Üst rozet satırına zümrüt yeşili (`colorScheme.secondaryContainer` / `onSecondaryContainer`) ve `PhosphorIconsFill.checkCircle` ikonlu **`Çözüldü · ${solvedSession.correctCount}D ${solvedSession.wrongCount}Y (${solvedSession.netScore.toStringAsFixed(1)} Net)`** rozeti eklenir.
         - Sağ alttaki aksiyon butonu `'Test Çöz'` yerine **`'Tekrar Çöz'`** (`PhosphorIconsBold.arrowsCounterClockwise` ikonlu veya tonal buton) olur.
     - **`LessonTopicsScreen` (`lib/features/lessons/presentation/lesson_topics_screen.dart`):**
       - Eğer o konudan en az 1 test çözülmüşse (`solvedTestCount > 0`):
         - Sol taraftaki yuvarlak yol haritası düğümü (`40x40`) `colorScheme.secondary` (Zümrüt) rengine bürünür ve içinde `PhosphorIcon(PhosphorIconsBold.check, size: 18, color: colorScheme.onSecondary)` gösterilir.
         - Konu kartının kenarlığı `colorScheme.secondary.withAlpha(140)` olur ve kart üzerinde **`$solvedTestCount Test Çözüldü`** (`PhosphorIconsFill.checkCircle` ikonlu zümrüt rozet) gösterilir.
     - **`ExamsScreen` (`lib/features/exams/presentation/exams_screen.dart`):**
       - Eğer deneme paketi daha önce çözülmüşse (`solvedExam != null`):
         - Kart kenarlığı `colorScheme.secondary.withAlpha(160)` olur, üstte **`Çözüldü · ${solvedExam.netScore.toStringAsFixed(1)} Net`** rozeti gösterilir ve alt buton **`'Denemeyi Tekrar Çöz'`** olarak güncellenir.
  2. **`LessonTopicsScreen` Konu Kartlarındaki Tekil İndir İkonlarının Kaldırılması:**
     - `LessonTopicsScreen` içindeki her bir `_TopicPathNode` kartının sağ üstünde yer alan tekil indirme ikonu (`PhosphorIconsBold.downloadSimple` / `Tooltip(message: 'Çevrimdışı İndir')`) kaldırılır; yalnızca `AppBar` sağ üstteki `'Tümünü İndir'` butonu korunur (eğer paket zaten indirilmişse zarif `'Cihazda'` rozeti kalabilir veya sadece çözüldü rozeti gösterilir).
  3. **`TopicTestsScreen` Test Kartlarındaki Gereksiz Metinlerin Temizlenmesi:**
     - `TopicTestsScreen` içindeki `_buildTestCard` bileşeninde zorluk seviyesi zaten üstteki rozette (`tier.title`: `'🌱 Basit Alıştırma'`, `'🏛️ Tam Sınav Ayarı'` vb.) yazmaktadır.
     - Kartın ortasındaki mükerrer `Text(tier.cleanTitle)` ve altındaki uzun `Text(tier.description)` (`'Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları.'` vb.) tamamen kaldırılır!
     - Bunun yerine kartta sadece:
       - Üstte: `'TEST ${index + 1}'` rozeti + Seviye rozeti (`tier.title`) + (varsa `✅ Çözüldü · XD YY` rozeti)
       - Altta yan yana (`Row`): Sol tarafta `'${chunk.length} Soru · ~${(chunk.length * 1.1).round()} dk'`, sağ tarafta `'Test Çöz'` (veya çözüldüyse `'Tekrar Çöz'`) butonu yer alır!

```text
GÖREV: TASK-75 — Çözülen Test/Konu/Deneme Kartlarında Tamamlanma Durumu + Konu Kartı İndir İkonlarının ve Test Kartı Gereksiz Açıklamalarının Temizlenmesi
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme, yazı stillerini Theme.of(context).textTheme üzerinden al.

ADIM 1: `StudyStatsState` (`lib/features/stats/data/study_stats_notifier.dart`) Yardımcı Metotları
1. `StudyStatsState` sınıfına şu 3 metodu ekle:
   - `QuizSessionRecord? findLatestSessionForTest({required String lesson, required String topic, required int testNumber})`:
     `sessionHistory` listesinde `s.title.contains('$lesson · $topic · Test $testNumber')` olan ilk (en güncel) kaydı döner; yoksa `null` döner.
   - `int countSolvedTestsForTopic({required String lesson, required String topic})`:
     `sessionHistory` içinde `'$lesson · $topic · Test '` içeren kayıtların farklı test numaralarını (`RegExp(r'Test (\d+)')`) sayarak kaç farklı testin çözüldüğünü (`Set<int>.length`) döner.
   - `QuizSessionRecord? findLatestSessionForTitle(String titlePrefix)`:
     `sessionHistory` içinde `s.title.startsWith(titlePrefix)` olan ilk kaydı döner; yoksa `null` döner.

ADIM 2: `TopicTestsScreen` (`lib/features/lessons/presentation/topic_tests_screen.dart`) Sadeleştirme & Çözüldü Durumu
1. `_buildTestCard` içinde `final stats = ref.watch(studyStatsProvider);` ve `final solvedSession = stats.findLatestSessionForTest(lesson: widget.lessonName, topic: widget.topic, testNumber: index + 1);` tanımla (`import 'package:kadro/features/stats/data/study_stats_notifier.dart';` ekle).
2. Mükerrer `Text(tier.cleanTitle)` ve gereksiz `Text(tier.description)` (`'Konuyu yeni bitirdiysen...'`) satırlarını tamamen KALDIR!
3. Kart tasarımını şu şekilde temiz ve kompakt yap:
   - `TactileCard`:
     - `backgroundColor`: `solvedSession != null ? colorScheme.secondaryContainer.withAlpha(35) : colorScheme.surface`
     - `borderColor`: `solvedSession != null ? colorScheme.secondary.withAlpha(160) : colorScheme.outlineVariant`
   - Üst Satır (`Wrap`):
     - `'TEST ${index + 1}'` rozeti
     - `tier.title` zorluk rozeti (`🌱 Basit Alıştırma`, `🏛️ Tam Sınav Ayarı` vb.)
     - Eğer `solvedSession != null` ise: Zümrüt yeşili (`colorScheme.secondaryContainer` arka plan, `colorScheme.onSecondaryContainer` metin/ikon, `PhosphorIconsFill.checkCircle` size 13) rozet içinde:
       `'Çözüldü · ${solvedSession.correctCount}D ${solvedSession.wrongCount}Y (${solvedSession.netScore.toStringAsFixed(1)} Net)'`
   - Alt Satır (`Row`, `mainAxisAlignment: MainAxisAlignment.spaceBetween`):
     - Sol (`Expanded`): `Text('${chunk.length} Soru · ~${(chunk.length * 1.1).round()} dk', style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600))`
     - Sağ: `FilledButton.tonal` (`onPressed: () => _startTest(index, chunk, tier)`):
       `Text(solvedSession != null ? 'Tekrar Çöz' : 'Test Çöz')`

ADIM 3: `LessonTopicsScreen` (`lib/features/lessons/presentation/lesson_topics_screen.dart`) Tekil İndir İkonunu Kaldırma & Çözüldü Durumu
1. `_TopicPathNode` içinde:
   - Tekil kart indirme butonunu (`Tooltip(message: 'Çevrimdışı İndir', ...)` ve `_handleDownload` metodunu) tamamen KALDIR! Üstteki `AppBar` içindeki `'Tümünü İndir'` butonu kalsın.
   - `final stats = ref.watch(studyStatsProvider);` ile `final solvedTestCount = stats.countSolvedTestsForTopic(lesson: lessonName, topic: topic);` ve `final isTopicSolved = solvedTestCount > 0;` hesapla.
   - Sol yuvarlak düğüm (`40x40`): Eğer `isTopicSolved` ise arka plan `colorScheme.secondary`, kenarlık `colorScheme.secondary` olsun ve numara yerine `PhosphorIcon(PhosphorIconsBold.check, size: 18, color: colorScheme.onSecondary)` göster!
   - Sağ `TactileCard`:
     - `borderColor: isTopicSolved ? colorScheme.secondary.withAlpha(150) : colorScheme.outlineVariant`
     - `backgroundColor: isTopicSolved ? colorScheme.secondaryContainer.withAlpha(30) : colorScheme.surface`
     - Eğer `isTopicSolved` veya `isDownloaded` ise üstte sağa/sola hizalı `Wrap` içinde:
       - `isTopicSolved` ise: `PhosphorIconsFill.checkCircle` + `'$solvedTestCount Test Çözüldü'` rozeti (`secondaryContainer`).
       - `isDownloaded` ise: `'Cihazda'` rozeti.
     - Alt satırda `'Test Çöz'` butonu yer almaya devam etsin (mevcut testlerin `find.text('Test Çöz')` beklentisini kırmamak için buton yazısı `'Test Çöz'` kalsın veya yanında çözüldü rozeti zaten durumu net gösteriyor).

ADIM 4: `ExamsScreen` (`lib/features/exams/presentation/exams_screen.dart`) Çözüldü Durumu
1. `_ExamPackageCard` içinde `final solvedExam = ref.watch(studyStatsProvider).findLatestSessionForTitle(title);` kontrolü ekle.
2. Eğer `solvedExam != null` ise:
   - `TactileCard` `borderColor: colorScheme.secondary.withAlpha(160)` ve `backgroundColor: colorScheme.secondaryContainer.withAlpha(30)` olsun.
   - Sağ üstteki rozet sütununa `PhosphorIconsFill.checkCircle` + `'Çözüldü (${solvedExam.netScore.toStringAsFixed(1)} Net)'` rozeti ekle.

ADIM 5: Testlerin Güncellenmesi ve Doğrulama
1. `test/topic_tests_screen_test.dart`:
   - Kaldırılan `'Konuyu yeni bitirdiysen özgüven tazeleyen ısınma soruları.'` beklentisini `findsNothing` olarak güncelle.
   - Bir test çözüldüğünde (`studyStatsProvider` içinde ilgili `QuizSessionRecord` varken) `TopicTestsScreen` üzerinde `'Çözüldü · '` rozetinin ve `'Tekrar Çöz'` butonunun göründüğünü doğrulayan yeni bir widget testi ekle!
2. `test/offline_download_test.dart`:
   - `LessonTopicsScreen` testinde kaldırılan kart içi `'Çevrimdışı İndir'` ikonu yerine `AppBar`'daki `'Tümünü İndir'` butonuna (`find.text('Tümünü İndir')`) tıklanarak `PaywallScreen` açıldığını doğrula.
3. `docs/task-board.md` içinde `TASK-75` durumunu `✅ **Tamamlandı**` yap.
4. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-76: Soru Metinlerindeki LaTeX (`$\rightarrow$`, `arrow`), Markdown (`**...**`) ve Gereksiz Tırnak (`""`) Kalıntılarının 2 Katmanlı Temizliği (`Question.cleanText` + Supabase `UPDATE` SQL + Repo Soru Havuzu)

- **Durum:** ✅ **Tamamlandı** (`fd51a3e`)
- **Problem Analizi:**
  - Soru üretim aşamasında Markdown/LaTeX formatından kalan `$\rightarrow$`, `\rightarrow`, `\to`, `->`, `**kalın metin**`, `*"italik tırnak"*` ve `""çift tırnak""` kalıntıları düz metin olarak `.sql` dosyalarına ve Supabase `public.questions` tablosuna aktarılmıştır.
- **2 Katmanlı Çözüm:**
  1. **Uygulama İçi Otomatik Sanitizer (`Question.cleanText` — `lib/features/quiz/data/models/question.dart`):**
     - `Question.fromSupabase` ve `Question.fromJson` içinde `text`, `options`, `explanation` ve `distractorTrap` alanlarının tamamı `Question.cleanText(String raw)` metodundan geçirilir:
       - `$\rightarrow$`, `\rightarrow`, `\Rightarrow`, `\to`, `-->`, `->`, `&rarr;` ifadeleri temiz Unicode `→` okuna dönüştürülür (`\leftarrow`, `<-` ise `←` okuna dönüştürülür).
       - Kalan tekil LaTeX `$` sarmalayıcıları temizlenir.
       - Markdown `**...**` ve `__...__` kalınlık yıldızları ile `*"..."*` etrafındaki yıldızlar soyulur.
       - Arka arkaya binmiş gereksiz çift tırnaklar (`""` → `"`, `\"` → `"`) ve bozuk boşluklar temizlenir.
  2. **Veritabanı (`docs/soru_havuzu/fix_question_texts_supabase.sql`) ve Yerel Soru Dosyalarının Temizlenmesi:**
     - Tüm `docs/soru_havuzu/**/*.sql`, `tools/*.py` ve `assets/data/questions.json` dosyalarındaki LaTeX/Markdown/tırnak kalıntıları temizlenir.
     - Mevcut Supabase `public.questions` tablosundaki kayıtları tek seferde güncelleyen `docs/soru_havuzu/fix_question_texts_supabase.sql` betiği oluşturulur.

```text
GÖREV: TASK-76 — Soru Metinlerindeki LaTeX ($\rightarrow$, arrow), Markdown (**...**) ve Gereksiz Tırnak ("") Kalıntılarının 2 Katmanlı Temizliği
ÖNEMLİ: GEMINI.md kurallarına birebir uy.

ADIM 1: `Question.cleanText` Sanitizer Metodunun Eklenmesi (`lib/features/quiz/data/models/question.dart`)
1. `Question` sınıfı içine `static String cleanText(String raw)` metodunu ekle:
   - Boş ise doğrudan `raw` döndür.
   - `$\rightarrow$`, `$\Rightarrow$`, `\rightarrow`, `\Rightarrow`, `\to`, `-->`, `->`, `&rarr;` ifadelerini `' → '` (etrafında fazladan boşluk varsa tek boşluk olacak şekilde `'→'`) ile değiştir.
   - `$\leftarrow$`, `\leftarrow`, `<--`, `<-` ifadelerini `'←'` ile değiştir.
   - LaTeX matematik sarmalayıcılarını (`$([^$]+)$` -> `$1`) temizle.
   - Markdown kalınlık işaretlerini (`\*\*(.+?)\*\*` -> `$1` ve `__(.+?)__` -> `$1`) temizle.
   - Markdown italik tırnaklarını (`\*"(.+?)"\*` -> `"$1"` ve `\*(.+?)\*` -> `$1`) temizle.
   - Çiftlenmiş veya kaçışlı çift tırnakları (`\\"` -> `"`, `""+` -> `"`, `''+` -> `'`) tek tırnağa indirge.
   - Satır içi çoklu boşlukları (`[ \t]{2,}`) tek boşluğa indirge ve `.trim()` uygula (ancak paragraf sonlarını `\n\n` koru!).
2. `Question.fromJson` ve `Question.fromSupabase` içinde:
   - `text`: `cleanText(...)`
   - `options`: `optionsList.map(cleanText).toList()`
   - `explanation`: `cleanText(...)`
   - `distractorTrap`: `rawTrap != null ? cleanText(rawTrap) : null`
   olarak uygula!

ADIM 2: Yerel `.sql` / `.json` Dosyalarının Temizlenmesi ve Supabase `UPDATE` Betiğinin Oluşturulması
1. `docs/soru_havuzu/fix_question_texts_supabase.sql` dosyasını oluştur:
   - Supabase SQL Editor'de çalıştırıldığında `public.questions` tablosundaki `prompt_text`, `explanation`, `distractor_trap` ve `interaction_data` sütunlarında yer alan `$\rightarrow$`, `\rightarrow`, `\to`, `->`, `**` ve `""` kalıntılarını PostgreSQL `regexp_replace` ve `replace` fonksiyonlarıyla temizleyen güvenli `UPDATE public.questions SET ...` komutunu yaz.
2. `docs/soru_havuzu/tarih/*.sql`, `tools/parse_markdown_to_sql.py` ve `assets/data/questions.json` dosyalarındaki `$\rightarrow$`, `\rightarrow`, `->`, `**` kalıntılarını da temizle ve `python tools/validate_sql.py` ile tüm SQL dosyalarının %100 geçerli olduğunu doğrula.

ADIM 3: Test ve Doğrulama
1. `test/quiz_screen_test.dart` (veya `test/question_sanitizer_test.dart`) içine `Question.cleanText` ve `Question.fromSupabase` için `$\rightarrow$`, `\rightarrow`, `->`, `**Anav kültürü**`, `*"Güneşin battığı yer"*` ve `""Manas Destanı""` içeren kirli verilerin tertemiz (`→`, `Anav kültürü`, `"Güneşin battığı yer"`, `"Manas Destanı"`) çıktığını doğrulayan birim testleri ekle.
2. `docs/task-board.md` içinde `TASK-76` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-77: Konu Kartlarında (`LessonTopicsScreen`) Gerçek Test Sayısı (`solved/totalTests`) Rozeti ve Yalnızca Tüm Testler Çözülünce Tik (`✓`) Atılması

- **Durum:** ✅ **Tamamlandı**
- **Problem Analizi:**
  1. `LessonTopicsScreen` (`lib/features/lessons/presentation/lesson_topics_screen.dart`) ekranında bir konunun içindeki **sadece 1 test çözüldüğünde** (`solvedTestCount > 0`) konu kartı ve solundaki yol haritası yuvarlağı hemen yeşil tik (`✓`) alıyor ve tamamen bitmiş gibi görünüyor. Oysa bir konunun içinde 8-10 adet test bulunuyor.
  2. Rozette `'1 Test Çözüldü'` yazması kullanıcının o konuda toplam kaç test olduğunu ve kaçta kaçını bitirdiğini anlamasını engelliyor. Kullanıcı bunun **`1/9 Test`** (`solved/mevcut test sayısı`) şeklinde görünmesini ve **yalnızca konudaki tüm testler çözüldüğünde (`solvedTestCount >= totalTestCount`) tik (`✓`) atılmasını** istiyor.
- **Mimari & Görsel Çözüm:**
  1. **Konu Bazlı Gerçek Test Sayısı Sağlayıcısı (`lessonTopicTestCountsProvider` — `lib/features/quiz/data/question_repository.dart` veya `lib/features/lessons/presentation/lesson_topics_screen.dart`):**
     - `QuestionRepository` içine `Future<Map<String, int>> fetchTopicTestCounts(String lessonName)` metodu eklenir:
       - `fetchQuestions(lesson: lessonName)` (veya Supabase'den ilgili dersin sorularını) çağırıp her `topic` için soru sayısını sayar ve `TopicTestsScreen` ile birebir aynı mantıkla (`(questionCount / 10).ceil()`) 10'ar soruluk kaç test oluştuğunu hesaplar.
       - Ayrıca çevrimdışı veya test ortamında bilinen konular için varsayılan/minimum test sayılarını (`Tarih`: İslamiyet Öncesi 9, İlk Türk-İslam 9, Osmanlı Kültür 10, Osmanlı Dağılma 9, Kurtuluş Savaşı 10, Atatürk İlke 8, Çağdaş 7; diğer konularda en az `1` veya bulunan soru sayısına göre `(count / 10).ceil()`) güvenli şekilde döner.
     - `final lessonTopicTestCountsProvider = FutureProvider.family<Map<String, int>, String>((ref, lessonName) async => ...)` tanımlanır.
  2. **`LessonTopicsScreen` (`_TopicPathNode`) Tamamlanma & Rozet Mantığı:**
     - `totalTests`: `topicTestCountsAsync.valueOrNull?[topic] ?? defaultTopicTestCount(lessonName, topic)` (en az `1`, eğer `solvedTestCount > totalTests` ise `solvedTestCount` olarak clamp edilir).
     - **Durum 1 — Hiç Çözülmemiş (`solvedTestCount == 0`):**
       - Sol yuvarlak düğüm: Numara (`${index + 1}`), `index == 0 ? colorScheme.primary : colorScheme.primaryContainer`.
       - Kartta test sayısını gösteren hafif bilgi rozeti veya sade görünüm (`0/$totalTests Test` veya çözülmeye başlandığında rozet). Kullanıcının her zaman mevcut test sayısını görebilmesi için sağ üstte:
         - Henüz hiç çözülmediyse (`solvedTestCount == 0`): Nötr rozet (`surfaceContainerHighest`) içinde **`0/$totalTests Test`**
         - Kısmen çözüldüyse (`0 < solvedTestCount < totalTests`): Amber/Primary ilerleme rozeti (`primaryContainer` / `onPrimaryContainer`, `PhosphorIconsBold.TrendUp` veya `PhosphorIconsFill.pieChart` / `clockCountdown` ikonu — **kesinlikle tik DEĞİL!**) içinde **`$solvedTestCount/$totalTests Test`**
         - **Tüm testler çözüldüyse (`isAllTestsSolved = totalTests > 0 && solvedTestCount >= totalTests`):** Zümrüt yeşili (`secondaryContainer` / `onSecondaryContainer`) rozet içinde **`PhosphorIconsFill.checkCircle`** (tik ikonu) + **`$solvedTestCount/$totalTests Test`**!
     - **Sol Yol Haritası Düğümü (`40x40` Yuvarlak) ve Kart Kenarlığı:**
       - **Tik (`PhosphorIconsBold.check`) ve Zümrüt Yeşili Düğüm (`colorScheme.secondary`) YALNIZCA `isAllTestsSolved` (`solvedTestCount >= totalTests`) olduğunda gösterilir!**
       - Kısmen çözülmüş konularda (`0 < solvedTestCount < totalTests`), sol yuvarlakta tik **atılmaz**, sıra numarası (`${index + 1}`) görünmeye devam eder (arka planı `colorScheme.primary`, kenarlığı `colorScheme.primary` olur).

```text
GÖREV: TASK-77 — Konu Kartlarında (LessonTopicsScreen) "Çözülen/Mevcut Test Sayısı" Rozeti ve Yalnızca Tüm Testler Çözülünce Tik (✓) Atılması
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme, yazı stillerini Theme.of(context).textTheme üzerinden al.

ADIM 1: Konu Bazlı Mevcut Test Sayısı Hesaplaması (`lib/features/lessons/data/kpss_lessons.dart` & `lib/features/quiz/data/question_repository.dart`)
1. `lib/features/lessons/data/kpss_lessons.dart` içine her konunun varsayılan (seed/SQL havuzundaki gerçek) test sayısını dönen yardımcı bir fonksiyon/map ekle (`defaultTopicTestCount(String lessonName, String topic)`):
   - Tarih konuları (gerçek SQL havuzu 620 soru / 10 = 62 test):
     - `'İslamiyet Öncesi Türk Tarihi'`: `9`
     - `'İlk Türk-İslam Devletleri'`: `9`
     - `'Osmanlı Kültür ve Uygarlığı'`: `10`
     - `'Osmanlı Dağılma Dönemi'`: `9`
     - `'Kurtuluş Savaşı Hazırlık ve Cepheler'`: `10`
     - `'Atatürk İlke ve İnkılapları'`: `8`
     - `'Çağdaş Türk ve Dünya Tarihi'`: `7`
   - Diğer derslerin konuları için varsayılan `5` dönsün.
2. `lib/features/quiz/data/question_repository.dart` içine:
   - `Future<Map<String, int>> fetchTopicTestCounts(String lessonName)` metodunu ekle:
     - `final questions = await fetchQuestions(lesson: lessonName);` ile soruları çeker.
     - Her `q.topic` için soru adedini sayar (`Map<String, int> questionCounts`).
     - Her konu için `testCount = (count / 10).ceil()` hesaplar (sadece `count > 0` olan konular için).
   - `final lessonTopicTestCountsProvider = FutureProvider.family<Map<String, int>, String>((ref, lessonName) async { final repo = ref.watch(questionRepositoryProvider); return repo.fetchTopicTestCounts(lessonName); });` provider'ını tanımla.

ADIM 2: `LessonTopicsScreen` (`lib/features/lessons/presentation/lesson_topics_screen.dart`) Güncellemesi
1. `_TopicPathNode.build` içinde:
   - `final topicCountsAsync = ref.watch(lessonTopicTestCountsProvider(lessonName));`
   - `final fetchedCount = topicCountsAsync.valueOrNull?[topic];`
   - `final rawTotalTests = (fetchedCount != null && fetchedCount > 0) ? fetchedCount : defaultTopicTestCount(lessonName, topic);`
   - `final solvedTestCount = stats.countSolvedTestsForTopic(lesson: lessonName, topic: topic);`
   - `final totalTests = solvedTestCount > rawTotalTests ? solvedTestCount : rawTotalTests;`
   - `final isPartiallySolved = solvedTestCount > 0 && solvedTestCount < totalTests;`
   - `final isAllTestsSolved = totalTests > 0 && solvedTestCount >= totalTests;`
2. Sol Yuvarlak Yol Haritası Düğümü (`40x40`):
   - **Sadece `isAllTestsSolved == true` olduğunda** arka plan `colorScheme.secondary` olsun ve içinde `PhosphorIcon(PhosphorIconsBold.check, size: 18, color: colorScheme.onSecondary)` (tik) gösterilsin!
   - `isAllTestsSolved == false` olduğunda (hiç çözülmemiş veya kısmen çözülmüş):
     - Arka plan: `(isPartiallySolved || index == 0) ? colorScheme.primary : colorScheme.primaryContainer`
     - İçerik: Numara `Text('${index + 1}', ...)` (tik YOK!).
3. Sağ Konu Kartı (`TactileCard`):
   - `borderColor`: `isAllTestsSolved ? colorScheme.secondary.withAlpha(150) : (isPartiallySolved ? colorScheme.primary.withAlpha(140) : colorScheme.outlineVariant)`
   - `backgroundColor`: `isAllTestsSolved ? colorScheme.secondaryContainer.withAlpha(30) : colorScheme.surface`
   - Üst sağdaki rozet (`Wrap`):
     - Her zaman (veya `solvedTestCount > 0` / mevcut test sayısı bilgisi olarak) kullanıcıya **`$solvedTestCount/$totalTests Test`** formatında göster:
       - Eğer **`isAllTestsSolved`** ise (tüm testler bitti):
         - Zümrüt yeşili (`colorScheme.secondaryContainer` arka plan, `colorScheme.onSecondaryContainer` yazı/ikon)
         - İkon: `PhosphorIconsFill.checkCircle` (Tik!)
         - Metin: `'$solvedTestCount/$totalTests Test'`
       - Eğer **`isPartiallySolved`** ise (örn. 1/9 çözüldü, henüz hepsi bitmedi):
         - Akademik lacivert/indigo (`colorScheme.primaryContainer` arka plan, `colorScheme.onPrimaryContainer` yazı/ikon)
         - İkon: `PhosphorIconsBold.chartPieSlice` (Tik DEĞİL!)
         - Metin: `'$solvedTestCount/$totalTests Test'`
       - Eğer **`solvedTestCount == 0`** ise (hiç çözülmedi):
         - Hafif nötr (`colorScheme.surfaceContainerHighest` arka plan, `colorScheme.onSurfaceVariant` yazı)
         - Metin: `'0/$totalTests Test'`
     - Altındaki konu başlığı (`Text(topic, ...)`) ve `'Test Çöz'` (veya `isAllTestsSolved ? 'Tekrar Çöz' : 'Test Çöz'` — ancak mevcut widget testlerinin `find.text('Test Çöz')` beklentisini bozmamak için `'Test Çöz'` metnini koru!) birebir korunsun.

ADIM 3: Birim & Widget Testlerinin Yazılması (`test/lessons_screen_test.dart`)
1. `test/lessons_screen_test.dart` içine `TASK-77` test grubu ekle:
   - Bir konuda 9 test varken sadece 1 test çözüldüğünde (`Tarih · İslamiyet Öncesi Türk Tarihi · Test 1`), `LessonTopicsScreen` üzerinde `'1/9 Test'` yazdığını ve düğümde tik (`PhosphorIconsBold.check`) **olmadığını** (`findsNothing`),
   - Konudaki tüm testler çözüldüğünde (örn. mock repo ile 2 testlik konuda Test 1 ve Test 2 çözüldüğünde), `'2/2 Test'` yazdığını ve düğümde tik (`PhosphorIconsBold.check`) + `PhosphorIconsFill.checkCircle` **bulunduğunu** (`findsOneWidget`) doğrula.
2. `docs/task-board.md` içinde `TASK-77` durumunu `✅ **Tamamlandı**` olarak güncelle.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-78: KPSS Sınav Geri Sayım & Çoklu Tasarımlı (Dikey / Yatay Masa Saati) Pomodoro Odak Stüdyosu (`PomodoroStudioScreen`, 3 Saat Tasarımı: `Halka` / `Flip Clock` / `Zen`, Ders Bazlı Süre Takibi & `HomeExamPomodoroBanner`)

- **Durum:** ✅ **Tamamlandı**
- **Sektör Araştırması & Benchmark Analizi (`YPT - Yeolpumta`, `Flocus`, `Flip Focus`, `Forest`, `Focus To-Do`, `iOS StandBy`):**
  1. **YPT (Yeolpumta — Kore/Türkiye KPSS & YKS Öğrencilerinin 1 Numaralı Tercihi):**
     - Öğrenciler sadece soyut bir 25 dakika sayacı istemiyor; **hangi derse (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) ne kadar süre çalıştığını** kaydetmek ve sınava kalan süreyi (`D-Day: Gün / Saat / Dakika / Saniye`) aynı merkezde görmek istiyor.
  2. **Flocus & Flip Focus & iOS StandBy (Çoklu Sayaç Tasarımı & Yatay Masa Saati Modu):**
     - Öğrenciler çalışırken telefonu masaya dikey veya **yatay (Landscape StandBy)** koyup bir masa saati gibi kullanıyor.
     - Farklı görsel zevkler için **3 ikonik saat yüzü (Clock Face Style)** sunuluyor:
       1. **`Akademik Halka` (`PomodoroClockStyle.ring`):** Çevresinde akıcı dairesel ilerleme halkası (`CircularProgressIndicator` / `CustomPaint`), ortada net dijital süre, odak aşaması (`ODAKLANMA` / `KISA MOLA`) ve ders etiketi.
       2. **`Retro Masa Saati (Flip Clock)` (`PomodoroClockStyle.flip`):** İki ayrı koyu/yüksek kontrastlı 3D kart (`Dakika` ve `Saniye` kutuları) ve ortalarında yatay ayrım çizgisiyle klasik masa üstü Flip Clock estetiği (`AnimatedSwitcher` ile yaprak geçişi).
       3. **`Minimal Zen` (`PomodoroClockStyle.zen`):** Dikkat dağıtmayan ultra-minimalist dev tipografi, altında ince doğrusal zaman akış çubuğu ve motive edici KPSS koç sözü.
  3. **KPSS'ye Özel Odak Şablonları (`PomodoroPreset`):**
     - **Klasik Pomodoro (`25 dk Odak / 5 dk Mola`)**
     - **KPSS Derin Odak (`50 dk Odak / 10 dk Mola`)** — Uzun tarih/coğrafya konu çalışmaları için
     - **Gerçek Sınav Provası (`65 dk Odak / 15 dk Mola`)** — KPSS Genel Kültür (60 soru / 65 dk) kondisyonu için
     - **Serbest Kronometre (`İleri Sayım / Stopwatch`)** — YPT tarzı süre sınırı olmadan çalıştıkça artan sayaç!

```text
GÖREV: TASK-78 — KPSS Sınav Geri Sayım & Çoklu Tasarımlı (Dikey / Yatay Masa Saati) Pomodoro Odak Stüdyosu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına birebir uy. Renkleri yalnızca Theme.of(context).colorScheme, yazı stillerini Theme.of(context).textTheme üzerinden al (lib/app/theme.dart dışında sabit Color(0xFF...) veya sabit fontSize YASAKTIR; büyük saat rakamları için textTheme.displayLarge?.copyWith(...) veya FittedBox(fit: BoxFit.scaleDown, child: Text(..., style: textTheme.displayLarge)) kullan!).

ADIM 1: Veri Modelleri ve Riverpod State (`lib/features/pomodoro/data/pomodoro_notifier.dart`)
1. `lib/features/pomodoro/data/pomodoro_notifier.dart` dosyasını oluştur:
   - **Sınav Hedefi Enum (`KpssExamTarget`):**
     - `KpssExamTarget.lisans` (`title: '2026 KPSS Lisans (GY-GK)'`, `examDate: DateTime(2026, 9, 6, 10, 15)`, `seasonStart: DateTime(2025, 9, 1)`)
     - `KpssExamTarget.onlisans` (`title: '2026 KPSS Önlisans'`, `examDate: DateTime(2026, 10, 4, 10, 15)`, `seasonStart: DateTime(2025, 10, 1)`)
     - `KpssExamTarget.ortaogretim` (`title: '2026 KPSS Ortaöğretim'`, `examDate: DateTime(2026, 10, 18, 10, 15)`, `seasonStart: DateTime(2025, 10, 1)`)
   - **Saat Tasarımı Enum (`PomodoroClockStyle`):**
     - `ring` (`label: 'Akademik Halka'`)
     - `flip` (`label: 'Flip Masa Saati'`)
     - `zen` (`label: 'Minimal Zen'`)
   - **Çalışma Modu Şablonu (`PomodoroPreset`):**
     - `classic25` (`label: '25/5 Klasik'`, `focusMinutes: 25`, `breakMinutes: 5`, `isStopwatch: false`)
     - `deep50` (`label: '50/10 Derin Odak'`, `focusMinutes: 50`, `breakMinutes: 10`, `isStopwatch: false`)
     - `exam65` (`label: '65/15 Sınav Provası'`, `focusMinutes: 65`, `breakMinutes: 15`, `isStopwatch: false`)
     - `stopwatch` (`label: 'Serbest Kronometre'`, `focusMinutes: 0`, `breakMinutes: 5`, `isStopwatch: true`)
   - **Durum Modeli (`PomodoroState`):**
     - `final KpssExamTarget examTarget;`
     - `final PomodoroClockStyle clockStyle;`
     - `final PomodoroPreset preset;`
     - `final String selectedLesson;` (`'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`, `'Genel Tekrar'`)
     - `final bool isRunning;`
     - `final bool isBreak;`
     - `final bool isLandscapeMode;` (Kullanıcının tek tuşla yatay masa saati moduna geçiş durumu)
     - `final int remainingSeconds;` (Geri sayım modlarında kalan saniye)
     - `final int elapsedSeconds;` (Kronometre modunda veya mevcut oturumda geçen saniye)
     - `final int completedSessionsToday;`
     - `final int totalFocusMinutesToday;`
     - `final Map<String, int> lessonFocusMinutes;` (Ders bazlı bugün çalışılan dakika dağılımı)
     - Yardımcı getter'lar:
       - `String get formattedMinutes`: Görüntülenecek dakika (`preset.isStopwatch ? (elapsedSeconds ~/ 60) : (remainingSeconds ~/ 60)` -> `padLeft(2, '0')`).
       - `String get formattedSeconds`: Görüntülenecek saniye (`preset.isStopwatch ? (elapsedSeconds % 60) : (remainingSeconds % 60)` -> `padLeft(2, '0')`).
       - `String get formattedTime => '$formattedMinutes:$formattedSeconds';`
       - `double get progress`: `preset.isStopwatch ? ((elapsedSeconds % 3600) / 3600.0) : (totalTargetSeconds == 0 ? 0.0 : (1.0 - (remainingSeconds / totalTargetSeconds)).clamp(0.0, 1.0))` (`totalTargetSeconds = (isBreak ? preset.breakMinutes : preset.focusMinutes) * 60`).
   - **`PomodoroNotifier extends Notifier<PomodoroState>`:**
     - `Timer? _timer;` (`ref.onDispose(() => _timer?.cancel());`)
     - `void selectExamTarget(KpssExamTarget target)`
     - `void selectClockStyle(PomodoroClockStyle style)`
     - `void selectPreset(PomodoroPreset preset)`: Sayacı durdurur, `isBreak = false`, `remainingSeconds = preset.focusMinutes * 60`, `elapsedSeconds = 0` yapar.
     - `void selectLesson(String lesson)`
     - `void startPause()`: `isRunning` durumunu değiştirir; çalışıyorsa 1 saniyelik `Timer.periodic` başlatır, durduysa iptal eder.
     - `void tick()` (testlerde de doğrudan çağrılabilir olması için `public` yap):
       - Eğer `preset.isStopwatch` ise `elapsedSeconds + 1` artırır (her 60 saniyede `totalFocusMinutesToday` ve `lessonFocusMinutes[selectedLesson]` 1 artırılır).
       - Geri sayım modunda `remainingSeconds > 0` ise `remainingSeconds - 1` ve `elapsedSeconds + 1` yapar; her 60 saniyede odak dakikasını kaydeder.
       - `remainingSeconds <= 0` olduğunda oturumu tamamlar (`completeCurrentPhase()`): Eğer `!isBreak` ise `completedSessionsToday + 1` artırır, `isBreak = true`, `remainingSeconds = preset.breakMinutes * 60`, `isRunning = false` yapar; eğer `isBreak` ise tekrar odak moduna (`isBreak = false`, `remainingSeconds = preset.focusMinutes * 60`) döner.
     - `void reset()`: Sayacı durdurur ve mevcut şablonun başlangıç süresine sıfırlar.
     - `void switchPhase(bool toBreak)`: Odak (`false`) veya Mola (`true`) aşamasına manuel geçiş yapar.
     - `void setLandscapeMode(bool value)`: `state = state.copyWith(isLandscapeMode: value);`
   - Global provider:
     `final pomodoroProvider = NotifierProvider<PomodoroNotifier, PomodoroState>(PomodoroNotifier.new);`

ADIM 2: Çoklu Saat Tasarımı ve Yatay Masa Saati Ekranı (`lib/features/pomodoro/presentation/pomodoro_studio_screen.dart`)
1. `PomodoroStudioScreen extends ConsumerStatefulWidget` oluştur:
   - `final int initialTabIndex;` (`0`: Pomodoro Sayacı, `1`: Sınav Geri Sayımı — varsayılan `0`).
   - `dispose()` içinde eğer yatay mod açıksa ekran yönünü dikey/varsayılana (`SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])`) geri döndür.
   - Yatay masa saati geçiş metodu (`_toggleOrientation()`):
     - `final nextLandscape = !ref.read(pomodoroProvider).isLandscapeMode;`
     - `ref.read(pomodoroProvider.notifier).setLandscapeMode(nextLandscape);`
     - `if (nextLandscape) { SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]); } else { SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); }`
2. **`OrientationBuilder` & Yatay Masa Saati Görünümü (`_LandscapeStandByClockView`):**
   - Eğer `MediaQuery.of(context).orientation == Orientation.landscape` veya `state.isLandscapeMode` aktifse:
     - Tam ekran dikkat dağıtmayan masa saati düzeni (`Row`):
       - **Sol (`Expanded`, flex: 3):** Seçilen saat tasarımı (`_ClockFaceRenderer` — `Akademik Halka`, `Flip Masa Saati` veya `Minimal Zen`) dev boyutta (`FittedBox` ile ölçeklenmiş) gösterilir.
       - **Sağ (`Expanded`, flex: 2):**
         - Üstte seçili ders rozeti (`state.selectedLesson`) + Odak/Mola durumu (`state.isBreak ? 'KISA MOLA' : 'ODAK ZAMANI'`) + Sınava kalan gün mini rozeti (`'⏳ KPSS: $remainingDays Gün'`).
         - Ortada 3 saat tasarımı değiştirme çipleri (`Halka` / `Flip` / `Zen`).
         - Altta büyük `Başlat / Duraklat` (`FilledButton.icon`), `Sıfırla` (`IconButton`) ve `'Dikey Görünüme Dön'` (`OutlinedButton.icon` -> `_toggleOrientation`) butonları.
3. **Dikey Görünüm (`Scaffold`):**
   - `AppBar`:
     - `title: const Text('Odak & Sınav Sayacı')`
     - `actions`: Sağ üstte **Yatay Masa Saati Modu** butonu (`IconButton` veya `TextButton.icon`: `PhosphorIconsBold.deviceMobileCamera` / `arrowsOutSimple`, `tooltip: 'Yatay Masa Saati Modu'`, `label: 'Masa Saati'`, `onPressed: _toggleOrientation`).
   - Üstte 2 sekmeli geçiş (`SegmentedButton<int>` veya özel `TactileCard` sekme seçici):
     - Sekme 0: **`Pomodoro Stüdyosu`** (`PhosphorIconsBold.timer`)
     - Sekme 1: **`Sınav Geri Sayımı`** (`PhosphorIconsBold.calendarCheck`)
   - **Sekme 0 — `Pomodoro Stüdyosu` İçeriği (`ListView`):**
     1. **Üst Kompakt KPSS Geri Sayım Şeridi:** Seçili sınava (`state.examTarget.title`) kalan `X Gün · Y Saat · Z Dk` özet şeridi (tıklanınca Sekme 1'e geçer).
     2. **Saat Tasarımı Seçici (`3 Tasarım Seçeneği`):**
        - Yan yana 3 seçilebilir çip/buton (`Akademik Halka`, `Flip Masa Saati`, `Minimal Zen`).
     3. **Ana Saat Sahnesi (`_ClockFaceRenderer` — `TactileCard` içinde):**
        - Üstte `Odaklanma` / `Kısa Mola` geçiş hapları + **Ders Seçici Çipler** (`'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`).
        - Ortada seçilen tasarıma göre saat:
          - **`PomodoroClockStyle.ring` (`Akademik Halka`):** `190x190` dairesel ilerleme halkası (`CircularProgressIndicator` `strokeWidth: 10`), ortasında `FittedBox` içinde `state.formattedTime` (`textTheme.displayLarge`), altında seçili ders ve aşama etiketi.
          - **`PomodoroClockStyle.flip` (`Flip Masa Saati`):** Yan yana iki adet 3D masa saati yaprağı (`_FlipDigitCard(value: state.formattedMinutes, label: 'DAKİKA')` + `:` + `_FlipDigitCard(value: state.formattedSeconds, label: 'SANİYE')`). Her yaprağın ortasında ince yatay menteşe çizgisi (`Divider`), `colorScheme.primaryContainer` / `colorScheme.surfaceContainerHighest` kontrast yüzeyi ve `AnimatedSwitcher` geçişi bulunur.
          - **`PomodoroClockStyle.zen` (`Minimal Zen`):** Çerçevesiz ferah tipografik saat (`FittedBox` ile büyük `state.formattedTime`), altında ince `LinearProgressIndicator` akış çubuğu ve motive edici odak mesajı (`'Her 25 dakikalık odak, sınavda 1 net demektir.'`).
        - Altta Kontrol Butonları (`Row`):
          - `Sıfırla` (`IconButton.filledTonal`, `PhosphorIconsBold.arrowCounterClockwise`)
          - `Başlat` / `Duraklat` (`FilledButton.icon`, `state.isRunning ? 'Duraklat' : 'Odaklanmayı Başlat'`)
          - `Masa Saati (Yatay)` (`IconButton.filledTonal`, `PhosphorIconsBold.deviceRotate`, `tooltip: 'Yatay Masa Saati'`)
     4. **Süre Şablonları (`25/5 Klasik`, `50/10 Derin Odak`, `65/15 Sınav Provası`, `Serbest Kronometre`):**
        - `Wrap` veya 2x2 kompakt kartlar halinde tek tıkla süre modunu değiştiren seçiciler.
     5. **Bugünkü Odak İstatistiği Kartı (`YPT Tarzı Ders Dağılımı`):**
        - Bugün tamamlanan Pomodoro sayısı (`${state.completedSessionsToday} Oturum`), toplam odak süresi (`${state.totalFocusMinutesToday} dk`) ve ders bazlı çalışılan dakikalar.
   - **Sekme 1 — `Sınav Geri Sayımı` İçeriği (`_ExamCountdownTabView`):**
     1. **Sınav Türü Seçici (`2026 KPSS Lisans (GY-GK)`, `2026 KPSS Önlisans`, `2026 KPSS Ortaöğretim`):**
        - Seçilen sınava göre hedef tarih anında güncellenir.
     2. **Canlı 4'lü Geri Sayım Panosu (`GÜN` · `SAAT` · `DAKİKA` · `SANİYE`):**
        - 1 saniyelik `Timer.periodic` ile canlı akan 4 adet 3D `TactileCard` kutusu (`Gün`, `Saat`, `Dakika`, `Saniye`).
     3. **Hazırlık Maratonu İlerleme Çubuğu:**
        - Hazırlık sezonunun yüzde kaçının geride kaldığını (`%XX Tamamlandı`) ve kalan hafta/gün sayısını gösteren görsel ilerleme kartı.
     4. **Koç Tuğrul'dan Kalan Süre Stratejisi + `'Hemen Pomodoro Başlat'` Aksiyonu.**

ADIM 3: Ana Sayfa (`HomeScreen`), Pratik (`PracticeHubScreen`) ve Router (`router.dart`) Entegrasyonu
1. `lib/app/router.dart` içine `/pomodoro` rotasını ekle (`builder: (context, state) => const PomodoroStudioScreen()`).
2. `lib/features/home/presentation/home_screen.dart` içine `_DailyGoalCard` ile `_SmartRemindersCard` arasına kompakt ve çok şık **`_ExamAndPomodoroBanner`** (`TactileCard`) ekle:
   - Sol tarafta: Canlı **`⏳ KPSS 2026: X Gün Kaldı`** + seçili Pomodoro modu (`25:00 Odak`),
   - Sağ tarafta: **`'Pomodoro Başlat'` / `'Sayaç'`** aksiyon rozeti. Tıklandığında `PomodoroStudioScreen` açılır!
   - (DİKKAT: `HomeScreen` üzerindeki mevcut `'Hoş geldin'`, `'Bugünkü hedefin'`, `'$solved / $goal soru'` ve `'Bugünün Çalışma Planı'` metinlerini BİREBİR koru ki mevcut testler kırılmasın!).
3. `lib/features/practice/presentation/practice_hub_screen.dart` içine de `'Odak & Planlama'` (veya mevcut kartların altına) **`'Pomodoro & Sınav Sayacı'`** (`'Dikey/yatay masa saati, 3 farklı saat tasarımı ve KPSS geri sayımı.'`, rozet: `'Flip & Halka Saat'`) kartını ekle.

ADIM 4: Test ve Doğrulama (`test/pomodoro_studio_test.dart`)
1. `test/pomodoro_studio_test.dart` dosyasını oluştur:
   - `PomodoroNotifier` birim testleri: Varsayılan `25:00` (`1500` sn) ile başladığını, `tick()` çağrıldığında sürenin azaldığını, `selectPreset(PomodoroPreset.deep50)` ile `50:00` olduğunu, `selectClockStyle(PomodoroClockStyle.flip)` ile saat tasarımının değiştiğini ve `selectExamTarget` ile sınav hedefinin güncellendiğini doğrula.
   - `PomodoroStudioScreen` widget testleri:
     - Ekran açıldığında `'Odak & Sınav Sayacı'` başlığının, `'25:00'` sayacının ve 3 saat tasarımı seçeneğinin (`'Akademik Halka'`, `'Flip Masa Saati'`, `'Minimal Zen'`) göründüğünü,
     - `'Flip Masa Saati'` seçildiğinde `'DAKİKA'` ve `'SANİYE'` yapraklarının çizildiğini,
     - `'Sınav Geri Sayımı'` sekmesine geçildiğinde `'2026 KPSS Lisans (GY-GK)'` ve `'GÜN'`, `'SAAT'`, `'DAKİKA'`, `'SANİYE'` kartlarının göründüğünü,
     - Yatay ekran boyutunda (`tester.view.physicalSize = const Size(1600, 800)`) yatay masa saati görünümünün taşmasız (`0 overflow`) çizildiğini doğrula!
2. `docs/task-board.md` içinde `TASK-78` durumunu `✅ **Tamamlandı**` yap.
3. Sırasıyla `dart format lib test`, `flutter analyze` (0 hata) ve `flutter test` (%100 geçiş) çalıştır.
```

---

### 📦 TASK-89: Veritabanı Seviyesinde Rate-Limit & RLS Zırhı (`public.rate_limits` + PostgreSQL Sliding-Window Triggers)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - PostgreSQL motoru seviyesinde kayan pencereli `public.check_rate_limit()` fonksiyonu ve `public.rate_limits` tablosu kuruldu.
  - `question_reports` tablosuna 1 dakikada max 3 rapor kısıtlaması getirildi (`trg_check_report_rate_limit`).
  - `quiz_sessions` tablosuna 60 saniyede max 2 oturum kaydetme kısıtlaması getirildi (`trg_check_quiz_session_rate_limit`).
  - `profiles.total_xp` için fahiş sıçramaları (max +250 XP/istek) ve hileli güncellemeleri engelleyen `trg_prevent_xp_tampering` trigger'ı yazıldı.
  - `questions`, `flashcards`, `map_challenges` tablolarına `anon` ve `authenticated` için INSERT/UPDATE/DELETE engellendi; sadece `service_role` yetkilendirildi.

---

### 📦 TASK-90: İstemci (Flutter) Seviyesinde Akıllı Rate Limiter & Cooldown Kalkanı (`ClientRateLimiter` + Anti-Spam)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `lib/core/network/client_rate_limiter.dart` servisi yazıldı.
  - Soru bildirim ekranında (`ReportQuestionBottomSheet` & `QuestionReportRepository`) 1 dakikada 3'ten fazla istek cihazda kesilerek kullanıcıya bilgilendirici SnackBar gösterildi.
  - Butonlara `_isSubmitting` kilidi konularak çift tıklama (double-tap flood) engellendi.

---

### 📦 TASK-91: Mikro-Analitik Soru Denemelerinin Toplu Gönderimi (`CloudSyncRepository` Batching Queue)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - Her soru cevaplandığında tekil HTTP isteği göndermek yerine `_attemptQueue` içine toplanması sağlandı.
  - Sınav/test tamamlandığında `saveQuizSession` tetiklenerek kuyruktaki tüm soru analitikleri tek bir toplu (`bulk insert`) HTTP isteğiyle gönderildi.
  - Ağ istek sayısı 60 soruluk bir sınavda 60'tan 1'e indirilerek ağ trafiği ve sunucu maliyeti %98 düşürüldü.

---

### 📦 TASK-92: Akıllı Çevrimdışı TTL Veri Önbelleği (`QuestionRepository` 2 Saatlik In-Memory Caching)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `QuestionRepository` içine 2 saatlik bellek içi önbellekleme (`cacheTtl`) eklendi.
  - `fetchQuestions`, `fetchTrueFalseItems` ve `fetchConceptMatchSets` metotları önbellekten anında (0ms gecikme) veri sunacak şekilde güncellendi.
  - Supabase Read operasyonları ve Egress çıkış bant genişliği %95 azaltıldı.

---

### 📦 TASK-93: Supabase Dashboard, Kong Gateway & Güvenlik Kılavuzu
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `docs/supabase_migrations/02_security_ratelimit_hardening.sql` ve `02_README_SECURITY_GUIDE.md` dosyaları oluşturuldu.
  - Masaüstündeki `C:\Users\omere\Desktop\kpss-supabase-sql\` klasörüne kopyalanarak kullanıcıya tek tıkla kurulum sağlandı.
  - Kong API Gateway IP rate-limit ve Auth brute-force koruma adımları dokümante edildi.

---

### 📦 TASK-94: Sürüm Kontrolü & Dinamik Bakım Modu (Remote Config & Force Update)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - Supabase `public.app_config` tablosu (`min_supported_version`, `latest_version`, `is_maintenance_mode`, `maintenance_message`, `store_url`).
  - `AppConfigService` & `AppConfigNotifier`: Uygulama açılışında sürüm ve bakım kontrolü yapar.
  - Sürüm eskiyse zarif ve modern bir zorunlu güncelleme diyaloğu (`ForceUpdateDialog`) ile Google Play Store'a yönlendirir.
  - Bakım modu aktifse kullanıcıya şık bir bakım ekranı (`MaintenanceScreen`) gösterir.
  - Çevrimdışı iken sessizce yerel modda devam eder.

---

### 📦 TASK-95: Veritabanı Otomatik Temizlik & Boyut Koruma (Data Retention & Auto-Purge Trigger)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `question_attempt_logs` tablosunda 30 günden eski veya çözülmüş logları temizleyen `public.purge_expired_attempt_logs()` PL/pgSQL fonksiyonu.
  - `quiz_sessions` kaydedildiğinde arka planda tetiklenen hafif temizlik mekanizması.
  - Supabase disk kotasını (500MB free / compute limits) yıllarca sabit ve düşük tutma.

---

### 📦 TASK-96: Soru Havuzu Güvenliği & Telif / Kazıma (Scraping) Kalkanı
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `QuestionRepository.fetchQuestions`: Tek bir istekte sınırsız soru çekilmesini engellemek için sunucu ve istemci tarafında maksimum sorgu limit kuralı (`limit(60)`).
  - Soru çözüm ve deneme sınavı ekranlarında ekran kaydı/görüntüsü almayı engelleyen koruma mekanizması.

---

### 📦 TASK-97: Akıllı Yerel Hatırlatıcılar & Alışkanlık Döngüsü (Daily Habit & Streak Notifications)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `NotificationService`: İnternet gerektirmeyen yerel bildirim motoru geliştirilmesi.
  - Akşam 20:30 "Seri & Hedef Hatırlatıcısı" (Kullanıcı günlük hedefini tamamlamadıysa *"🔥 5 günlük serin bozulmak üzere! 10 soru çöz serini koru"*).
  - Pazar 10:00 "Haftalık KPSS Genel Kültür Denemesi" daveti.
  - Profil ayarlarından bildirimleri açıp kapatabilme (`UserPreferencesNotifier`).

---

### 📦 TASK-98: Dopamin Anında 5 Yıldız Puan Toplama Motoru (In-App Review Engine)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `InAppReviewService`: `in_app_review` entegrasyonu ile Google Play Store yıldız penceresini uygulama içinden açma.
  - Tetikleyiciler: Rekor net, 7 günlük streak veya 10'da 10 tam puan.
  - Boğucu olmaması için 30 günde en fazla 1 kez tetiklenme kuralı.

---

### 📦 TASK-99: Freemium & Kadro PRO Dengesi: Cömert Temel Deneyim + Güçlü 4 PRO Ayrıcalığı
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Kullanıcı İlkesi:** Her şey için para isteyen açgözlü paywall uygulaması olmak yerine cömert temel içerik sunup kullanıcıyı gerçek değer üreten 4 PRO özelliğiyle ikna etme modeli hayata geçirildi.
  - **Cömert Ücretsiz Deneyim (Herkes İçin Tamamen Ücretsiz):**
    - Tüm 1.240 soru havuzuna erişim (günlük 30 soru limiti + ödüllü reklamla +20 soru hakkı).
    - Tüm "ÖSYM Çeldirici Tuzağı" (UWorld Modeli) ve detaylı soru açıklamaları.
    - Tüm 200 KPSS Şifreli Bilgi Kartı (Flashcards), 50 Harita İncelemesi, 100 Doğru/Yanlış ve 20 Kavram Eşleştirme seti.
    - Pomodoro Odaklanma Stüdyosu (Flip Clock) ve Deneme #1 (Türkiye Geneli GK Provası #1).
    - Yanlış Defteri'ndeki tüm yanlışları, doğruları ve çeldirici tuzaklarını sınırsız inceleme/okuma.
  - **Kadro PRO (Güçlü 4 Ayrıcalık Kapısı):**
    - **Kapı 1 — Sınırsız Soru Çözümü & Sıfır Reklam:** Günlük 30 soru sınırına ve bekleme sürelerine takılmadan kesintisiz çalışma.
    - **Kapı 2 — Tüm Türkiye Geneli Deneme Arşivi:** Deneme #2, #3, #4... ve periyodik eklenen tüm 60 soruluk tam kapsamlı sınav simülasyonları ve net karneleri (`ExamsScreen._ExamPackCard` üzerinde `isProOnly` kapısı).
    - **Kapı 3 — Çevrimdışı Mod (Offline Download):** İnternetsiz ortamlarda, metroda veya otobüste soru ve deneme çözebilmek için cihaza indirme motoru.
    - **Kapı 4 — Akıllı Yanlış Defteri Test Üretici:** Kullanıcının geçmiş yanlışlarından tek tıkla 10 veya 20 soruluk akıllı tekrar testleri üretip çözme motoru (`MistakesScreen._solveMistakes` PRO kapısı).
  - **PaywallScreen Revizyonu:** Paywall tetiklenme nedenini açıklayan dinamik `reasonMessage` başlığı eklendi, PRO avantajları bu 4 ana sütuna göre şeffaf ve ikna edici şekilde güncellendi.
  - **Test & Doğrulama:** `test/pro_freemium_gates_test.dart` ve `test/mistakes_screen_test.dart` testleri yazılarak tüm kapılar doğrulandı; projedeki 267/267 test 0 hata ile geçti.

---

### 🔮 [GELECEK FAZ] "Pazar 20:00" Türkiye Geneli Canlı KPSS Denemesi (Canlı Etkinlik)

- **Sıra No:** *Sıra No'suz (İleri Faz)*
- **Durum:** ⏸️ **Kullanıcı Kesin Onayı Bekleniyor (İleri Faz)**
- **Açıklama:**
  - Kullanıcı kararıyla şimdilik uygulanmayacak, projenin ileri aşamalarına ertelenmiştir.
  - **Kullanıcıdan kesin onay alınmadan bu göreve başlanmayacaktır.**
  - **Kapsam Özeti:** Her hafta belirlenen gün/saatte tüm KPSS adaylarının aynı anda başladığı, canlı geri sayımlı, süresi bitince otomatik toplanan ve Türkiye geneli canlı sıralama çıkaran eş zamanlı sınav motoru ve etkinlik ekranı.

- [x] **TASK-107 — "Sabah Masası & Sınav Kitapçığı" Editoryal Tasarım Denemesi (v2 — Yürürlükten Kaldırıldı):** İlk anti-slop adımında `lucide_icons_flutter` bağımlılığı kaldırılıp tüm ikonlar `phosphor_flutter` standardında toplandı, dekoratif UI emojileri temizlendi; ancak sıcak kağıt (`#F7F4ED`) + `Newsreader` serif + eyebrow şablonu `TASK-108` ile tamamen yenilendi.

- [x] **TASK-108 — "Tuğrul Kobaltı & Anadolu Altını" Karakterli Modern EdTech Tasarım Sistemi (v3):** Editoryal kağıt şablonu (`#F7F4ED`, `Newsreader`, `EditorialScreenHeader`) kaldırılarak yerine yüksek kontrastlı Kobalt (`#2140D4`) · Zümrüt (`#0E9F6E`) · Anadolu Altını (`#E28400`) paleti, `Outfit` + `DM Sans` tipografisi, `1.5px` kenarlıklı ve keskin `3px` fiziksel alt dudaklı `TactileCard` / `OptionTile` dokunsal yüzeyi ve 12 ruh halinde sahneye entegre `TugrulAvatar` madalyon sistemi devreye alındı (`lib/app/theme.dart`, `lib/shared/widgets/tugrul_avatar.dart`, `design-system/kadro/MASTER.md`).

---

### 📦 TASK-109: Sıralı Çalışma Modu Kilidi & Önceki Günlere Dönüş / Görev Tekrarı
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Sıralı İlerleme Kilidi (Sequential Progress Lock):**
    - Günlük çalışma paketindeki tüm görevler tamamlanmadan (`allCompleted == false`) sonraki güne (`cycleDay + 1`) geçiş yasaklanır.
    - `StudyPlannerNotifier.advanceToNextDay` metodu `if (!state.allCompleted) return;` kontrolüyle zırhlanır.
    - Hem `HomeDailyPlanCard` hem de `StudyPlannerScreen` üzerinde "Sonraki Güne Geç" butonu tüm görevler bitmeden devre dışı (disabled / kilitli) görünür ve tıklandığında bilgilendirici geri bildirim sunar.
  - **Önceki Günlere Gezinme & Ulaşılan En Yüksek Gün (`unlockedCycleDay`):**
    - Kullanıcının ulaştığı en yüksek gün (`unlockedCycleDay`) takip edilir ve `LocalStorageService` içine kaydedilir.
    - Kullanıcı ulaştığı günler arasında (`1..unlockedCycleDay`) serbestçe geriye ve ileriye gidebilir (`goToPreviousDay`, `goToNextDay`, `goToDay(targetDay)`).
    - Gün seçici / gezinme çubuğu ile önceki günlerin görevleri görüntülenir.
  - **Geçmiş Görevleri Tekrar Çözebilme (Review & Practice Again):**
    - Tamamlanmış (`isCompleted: true`) görevlerin yanında `Tekrar Çöz` butonu sunulur.
    - Tıklandığında `StudyTaskLauncher.launch` ile ilgili test/kart/harita oturumu yeniden başlatılır.
    - Kullanıcı isterse görevi tekrar tamamlayabilir veya tek tek çözebilir.
  - **Kalıcı Depolama & Senkronizasyon:**
    - Günlük görev listeleri ve tamamlama durumları yerel depolamada gün bazında saklanır, böylece önceki günlere dönüldüğünde o günün çözülmüş halleri korunur.
  - **Birim & Widget Testleri:**
    - Sıralı kilit kurallarını, önceki güne dönüşü ve tekrar çözüm mekanizmasını doğrulayan testler yazılır.

---

### 📦 TASK-110: Çalışma Süresi / Tempo Değişiminde İlerlemenin Korunması & Akıllı Müfredat Adaptasyonu
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Sıfırlanmayı Önleme & İlerlemeyi Koruma:**
    - Kullanıcı çalışma süresini değiştirdiğinde (ör. 30 dk'dan 60 dk'ya çıkardığında) program `cycleDay: 1` yapılarak en başa sarılmaz.
    - Kullanıcının o güne kadar çözdüğü testler (`StudyStatsState.findLatestSessionForTest` ve kümülatif çalışma ofseti) tespit edilir.
    - Sıradaki çözülmemiş testin indeksi bulunur ve yeni tempoda bu ofsete karşılık gelen mantıksal gün hesaplanır (`AutoStudyProgramGenerator.findCycleDayForCurriculumOffset`).
  - **Akıllı Müfredat Filtreleme (Daha Önce Çözülen Testleri Atlatma):**
    - `AutoStudyProgramGenerator.generateDailyTasks` içine çözülmüş testleri bilme (`isTestSolved` kontrol fonksiyonu veya çözülen testler kümesi) yeteneği eklenir.
    - Görevler atanırken kullanıcının daha önce çözmüş olduğu testler atlanarak, sıradaki ilk çözülmemiş 10 soruluk gerçek konu testleri atanır.
  - **Tempo Adaptasyonu:**
    - Kullanıcı süresini 60 dk veya 90 dk'ya çıkardığında, çözmediği sıradaki testlerden günde 2 veya 3 test, daha fazla kart ve harita alıştırması içeren yeni tempo görevleri kaldığı yerden anında devreye girer.
  - **Depolama & Test:**
    - `changeStudyProgramPace` metodu ile hem tempo hem ilerleme güncellenir, birim ve widget testleriyle doğrulanır.

---

### 📦 TASK-111: KPSS Genel Yetenek (Türkçe & Matematik) Altyapı Hazırlığı & "Yakında" Modül Vitrini
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Müfredat & Veri Modeli (`kpss_lessons.dart`):**
    - `Lesson` modeline `isComingSoon` bayrağı eklendi.
    - KPSS Genel Yetenek (60 Soru): **Türkçe** (30 Soru) ve **Matematik & Geometri** (30 Soru) resmi ÖSYM konu başlıklarıyla `kpssGeneralAbilityLessons` listesi olarak tanımlandı.
    - `allKpssLessons` birleşik listesi (6 ders) ve izole `kpssLessons` (4 Genel Kültür dersi) ayrımı korundu.
  - **Arayüz & Vitrin (`LessonsScreen`):**
    - Dersler ekranı iki bölüme ayrıldı:
      1. **KPSS Genel Kültür (60 Soru)**: Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler (çözülen test oranları ve konu ağaçları).
      2. **KPSS Genel Yetenek (60 Soru · Yakında)**: Türkçe ve Matematik & Geometri için kehribar/altın vurgulu `"Yakında"` rozeti, kilit ikonu ve `TactileCard` yapısı.
    - Genel Yetenek kartına tıklandığında `TugrulAvatar` (Coach mood) eşliğinde bilgilendirici alt çekmece (`_ComingSoonLessonCard._showComingSoonSheet`) açılarak hazırlanan konu modülleri ve yakında geleceği şık çiplerle gösterildi.
  - **Test & Doğrulama:**
    - `test/general_ability_coming_soon_test.dart` yazılarak model bütünlüğü, UI bölüm başlıkları, rozetler ve tıklama diyalogu test edildi.
    - `dart format`, `flutter analyze` (0 issue) ve tüm proje test paketi (304/304 test başarılı) ile %100 doğrulandı.

---

### 📦 TASK-112: Ana Sayfa "De-AI-Slop" & Renk/Görsel Sadeleştirme (Temiz EdTech & Prestijli Akademi Estetiği)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Hero Kartı Sadeleştirmesi (`_HomeHeroStage`):**
    - Aşırı doygun ve tüm kartı kaplayan `primaryContainer`/`secondaryContainer` cart arka plan rengi kaldırıldı; saf `surface` zemin üzerinde zarif `outlineVariant` kenarlık sistemine geçildi.
    - İç hedef kapsülü sakin nötr zemine (`surfaceContainerLow`), sade yüzde rozetine ve temiz progress barına kavuşturuldu.
    - TuğrulAvatar ana sayfada sadece burada tek ve ana koçluk odağı olarak konumlandırıldı.
  - **Sınav Takvimi & Countdown Kutuları (`_ExamAndPomodoroBanner` + `_CountdownMetricTile`):**
    - Yıl (mavi), Ay (yeşil), Gün (turuncu) şeklinde yan yana dizilen yapay gökkuşağı renkleri ve renkli neon gölgeler tamamen kaldırıldı.
    - Bütün takvim sayaç taşları prestijli, sakin, nötr zemin (`surfaceContainerLow`), net `onSurface` tipografi ve nötr kenarlık standardına çekildi.
    - Kartın sol başındaki mükerrer ikinci minyatür Tuğrul maskotu yerine, kurumsal ve ciddi takvim ikonu (`PhosphorIconsFill.calendarBlank`) yerleştirildi.
  - **Hatırlatıcılar Kartı (`_SmartRemindersCard` + `_ReminderItem`):**
    - Mavi, turuncu ve yeşil renkli gökkuşağı ikon kutuları yerine; tutarlı, sade, nötr zeminli (`surfaceContainerLow`) ve sakin çizgisel `PhosphorIconsRegular` ikon stiline geçildi.
  - **Zayıf Konu Bannerı (`_WeakLessonHomeBanner`):**
    - Kaba turuncu zemin yerine sakin beyaz/yüzey zemin ve zarif düşüş trendi ikonu (`PhosphorIconsRegular.trendDown`) yerleştirildi.
  - **Test & Doğrulama:**
    - `test/home_screen_de_ai_slop_test.dart` yazılarak tek TuğrulAvatar odağı, takvim ikonları ve hatırlatıcılar doğrulandı.
    - `dart format`, `flutter analyze` (0 issue) ve tüm proje test paketi (305/305 test başarılı) ile %100 doğrulandı.

---

### 📦 TASK-113: Google Play & KVKK / GDPR Hukuki Uyumluluk Paketi (Gizlilik Politikası, Kullanım Koşulları, Açık Kaynak Lisansları & Hesap Silme Akışı)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Hukuki Dokümanlar (`lib/core/legal/legal_documents.dart`):**
    - 6698 Sayılı KVKK Aydınlatma Metni & Gizlilik Politikası (Veri sorumlusu, toplanan veriler, 3. taraf servisler Supabase/RevenueCat/AdMob/Sentry, veri güvenliği ve haklar).
    - Kullanım Koşulları & EULA (Hizmet koşulları, Kadro PRO abonelik/iade ilkeleri, fikri mülkiyet).
    - ÖSYM Sorumluluk Reddi (KPSS telif hakları beyanı ve resmi kurum bağımsızlığı).
  - **Hukuki Doküman Okuyucu (`LegalDocumentViewerScreen`):**
    - Uygulama içinde internet gerektirmeden tam metin okunabilen, kopyalanabilir ve şık tipografiye sahip ekran.
  - **Profil Ekranı Hukuk Merkezi (`ProfileScreen`):**
    - "Hukuki & Gizlilik" başlığı altında:
      1. *Gizlilik Politikası & KVKK Aydınlatma Metni*
      2. *Kullanım Koşulları & ÖSYM Beyanı*
      3. *Açık Kaynak Lisansları* (`showLicensePage`)
      4. *Hesabımı ve Verilerimi Sil* (Google Play Account Deletion zorunlu kuralı uyarınca çift onaylı, kırmızı tehlike aksiyonu).
  - **Giriş / Kayıt Ekranı Bilgilendirmesi (`AuthScreen`):**
    - Giriş ve kayıt butonlarının altında "Devam ederek Kullanım Koşulları ve Gizlilik Politikası'nı kabul etmiş olursunuz" tıklanabilir yasal bilgilendirme köprüsü.
  - **Dış Web Gizlilik & Silme Formu (`docs/privacy_policy.html`):**
    - Google Play Console Data Safety formuna girilmek üzere ÖSYM telif beyanı, AdMob, Sentry ve web hesap silme talep linki eklendi.
  - **Test & Doğrulama:**
    - `test/legal_and_privacy_compliance_test.dart` yazılarak tam işlevsellik doğrulandı.
    - `dart format`, `flutter analyze` (0 issue) ve tüm proje test paketi (309/309 test başarılı) ile %100 doğrulandı.

---

### 📦 TASK-114: KPSS Puan Hesaplama Robotu (P3 / P93 / P94) & Son 3 KPSS Sınav Yılı Karşılaştırma Motoru
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Puan Hesaplama Motoru (`lib/features/score_calculator/data/kpss_score_calculator.dart`):**
    - `KpssScoreType`: `p3Lisans` (P3), `p93OnLisans` (P93), `p94Ortaogretim` (P94).
    - ÖSYM kuralları: `Net = Doğru - (Yanlış / 4.0)`, bölüm başı maksimum `60` soru sınırlandırması (`Doğru + Yanlış <= 60`), en az `1.0 ham net` barajı (`gyNet >= 1.0 || gkNet >= 1.0`).
    - Son 3 KPSS sınav yılı kalibrasyonu (`2026`, `2025`, `2024` for Lisans P3; `2026`, `2024`, `2022` for Ön Lisans P93 & Ortaöğretim P94) ile taban puan, GY/GK net katsayıları, Türkiye ortalamaları ve standart sapma verileri.
  - **Kullanıcı Arayüzü (`lib/features/score_calculator/presentation/kpss_score_calculator_screen.dart`):**
    - `MASTER.md` "De-AI-Slop" & `TactileCard` standartlarında minimalist ve sade EdTech arayüzü (sıfır sabit `Color`/`fontSize`, yalnızca `Theme.of(context)`).
    - AppBar üzerinde `'Sıfırla'` aksiyon butonu, 3'lü sade segment seçici (`Lisans P3`, `Ön Lisans P93`, `Ortaöğretim P94`), düz kahraman puan kartı (büyük puan, GK/GY/Toplam net dağılımı ve baraj uyarısı), kompakt slider ve `[-]` `[+]` butonlu GY & GK net giriş kartları, **"Son 3 KPSS'de Kaç Puan Alırdın?"** sade karşılaştırma kartı (tek renk göstergeler ve TR ortalamaları) ve kutusuz tek satır bilgilendirme dipnotu.
  - **Erişim Noktaları:**
    - `PracticeHubScreen` → `Araçlar & Hızlı Tekrar` altında *KPSS Puan Hesaplama* kartı.
    - `ExamsScreen` → Deneme paketleri altında *KPSS Puan Hesaplama Robotu* kısayolu (`Son 3 KPSS (2026 · 2025 · 2024) katsayılarıyla netlerini puana çevir`).
  - **Test & Doğrulama:**
    - `test/kpss_score_calculator_test.dart` birim ve widget testleri güncellendi (2026/2025/2024 Lisans, 2026/2024/2022 Ön Lisans & Ortaöğretim, canlı net artırma ve AppBar Sıfırla etkileşimleri).
    - `dart format`, `flutter analyze` (`0` issue) ve `flutter test` ile %100 doğrulandı.

---

### 📦 TASK-115: Çalışma Planı & Günlük Görev İlerlemesinin Çoklu Cihaz ve Oturumlar Arası Kalıcı Bulut Senkronizasyonu (`PlannerSyncSnapshot`)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Senkronizasyon Modeli (`lib/features/planner/data/models/planner_sync_snapshot.dart`):**
    - `PlannerSyncSnapshot` immutable veri modeli (`cycleDay`, `maxUnlockedDay`, `completedTaskIds`, `customTasksByDay`, `updatedAt`).
    - `mergeWith` High-Water Mark birleştirme mantığı: en yüksek `maxUnlockedDay` kazanır, tamamlanan görev ID'leri küme birleşimi ile korunur, özel görevler id bazlı tekilleştirilir.
  - **Yerel Depolama & Hesap İzolasyonu (`lib/core/services/local_storage_service.dart`):**
    - Oturum kapatıldığında kullanıcının ilerlemesini kaybetmemesi için hesap bazlı `_keyAccountPlannerSnapshot(accountKey)` ve `_keyAccountUserPrefs(accountKey)` yerel önbellek katmanı.
  - **Çift Katmanlı Bulut Senkronizasyonu (`lib/features/stats/data/cloud_sync_repository.dart`):**
    - `syncPlannerSnapshot` ve `fetchPlannerSnapshot` ile hem `user_metadata` hem `public.profiles` (`planner_state` JSONB) üzerinde yedekli saklama.
  - **Çalışma Planlayıcı State Motoru (`lib/features/planner/data/study_planner_notifier.dart`):**
    - `applySnapshot`, `exportSnapshot`, `_persistAndSyncSnapshot` ve `loadTasksFromCloud` ile oturumlar ve cihazlar arası deterministik müfredat hidrasyonu.
  - **Veritabanı Şeması (`docs/supabase_schema.sql`):**
    - `public.profiles` tablosuna `planner_state jsonb default '{}'::jsonb` kolonu eklendi.
  - **Test & Doğrulama:**
    - `test/planner_cloud_persistence_test.dart` yazılarak 3 gün ilerleme + hesaptan çıkış + aynı hesapla tekrar giriş senaryosu, cold restart simülasyonu ve çapraz cihaz hidrasyonu test edildi.
    - `dart format`, `flutter analyze` (`0` issue) ve tüm proje test paketi (`325/325` test başarılı) ile %100 doğrulandı.

---

### 📦 TASK-116: Çalışma Planı Snapshot'ında Tam Görev Nesneleri (`tasks_by_day`) ve Kayıpsız Tempo Adaptasyonu (`30 dk -> 60 dk`)
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `PlannerSyncSnapshot` içine `tasksByDay` (`tasks_by_day` JSON haritası) eklenerek her günün tüm `StudyTask` nesnelerinin tam detaylarıyla yerel ve bulut katmanında saklanması sağlandı.
  - `StudyTask.isSameTaskItem` semantik eşleşme kontrolü eklendi.
  - `adaptStudyProgramPace` ile kullanıcı çalışma süresini değiştirdiğinde (örn. 10. günde 30 dk'dan 60 dk'ya geçtiğinde) gün sayacının ve o gün tamamlanmış görevlerin %100 korunması, yalnızca yeni temponun gerektirdiği ek görevlerin eklenmesi sağlandı (`test/study_program_pace_adaptation_test.dart`).

---

### 📦 TASK-117: Bağımsız Çözülen Konu Testlerinin Günlük Çalışma Planındaki Görevlerle Otomatik Eşleşmesi ve Üstü Çizili Gösterimi
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - Kullanıcı çalışma planından değil doğrudan Dersler / Konu Testleri ekranından bağımsız bir test çözdüğünde `markMatchingTestCompleted` ve `syncCompletedFromStats` ile hem aktif gündeki hem de gelecekte oluşturulacak günlerdeki ilgili görevlerin otomatik `isCompleted: true` yapılması sağlandı.
  - `StudyPlannerScreen` üzerinde daha önce bağımsız çözülmüş görevlerde `'· Önceden çözüldü'` etiketi ve üstü çizili görünüm eklendi (`test/study_planner_independent_solve_test.dart`).

---

### 📦 TASK-118: Freemium Günlük Soru Limiti (`dailyFreeQuestionLimit` & `dailySolvedCount`) Çoklu Cihaz, Oturum Kapatma ve Önbellek Silme Koruması
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - Canlı Supabase `public.profiles` tablosuna `daily_solved_count` ve `daily_free_limit` kolonları eklendi.
  - `LocalStorageService` içine hesap bazlı istatistik yedeği (`saveAccountStudyStats`) ve oturum kapatılsa bile korunan cihaz günlük kota sayacı (`kadro_device_daily_quota`) eklendi.
  - `StudyStatsNotifier.loadFromCloud` içinde 5 kaynaktan (yerel, hesap yedeği, cihaz kotası, bulut profil ve bugün çözülen `quiz_sessions` toplamı) High-Water Mark (`math.max`) ile günlük çözülen soru sayısını geri yükleme ve gün dönümünde otomatik sıfırlama kuruldu (`test/daily_quota_anti_tamper_test.dart`).

---

### 📦 TASK-119: Giriş Öncelikli Açılış Kapısı (Auth-First Gate), İlk Oturumda Tek Seferlik Zorunlu Kurulum (Post-Login Onboarding) ve Çoklu Cihaz (Telefon + Web) Birebir Plan Senkronizasyonu
- **Durum:** ✅ **Tamamlandı**
- **Tespit Edilen Kök Nedenler (Neden Telefon ve Web Chrome'da Farklı Günlük Plan Çıktı?):**
  1. **Giriş Yapılmadan Önce Zorunlu Onboarding Çalışması (`lib/app/app_shell.dart` & `lib/main.dart`):**
     - `AppShell.build` oturum kontrolü yapmadan doğrudan `OnboardingScreen` açtığı ve `main.dart` oturumsuzken yerel önbelleği yüklediği için yeni cihazda giriş öncesi yerel bir plan üretilebiliyordu.
  2. **SQL Varsayılanlarının Kurulum Sanılması (`lib/features/stats/data/cloud_sync_repository.dart` & `lib/features/profile/data/user_preferences_notifier.dart`):**
     - `profiles.target_exam = 'lisans'` ve boş `planner_state = {}` değerleri `fetchUserPreferences()` içinde `has_completed_onboarding = true` olarak yorumlanabiliyordu.
  3. **Dokunulmamış Varsayılan Şablonun Bulut Planını Ezmesi (`lib/features/planner/data/study_planner_notifier.dart`):**
     - Yeni cihazda henüz dokunulmamış `_defaultTasks` (`task_1..3`), `exportSnapshot()` sırasında `tasksByDay[1]` içine yazıldığı ve güncel `updatedAt` aldığı için buluttaki gerçek planla çakışabiliyordu.
  4. **Giriş Sonrası Bulut Hidrasyon Sırası ve Bekleme Kapısı (`lib/features/auth/data/auth_notifier.dart`):**
     - Tercihlerin (`UserPreferencesNotifier`) planlayıcıdan (`StudyPlannerNotifier`) önce sıralı yüklenmemesi ve `AppShell` üzerinde hidrasyon bekleme durumu bulunmaması cihazlar arası tutarsızlık yaratabiliyordu.
- **Tamamlanan Değişiklikler:**
  - `lib/features/stats/data/cloud_sync_repository.dart`: `fetchUserPreferences()` boş `{}` `planner_state` ve SQL varsayılan `target_exam = 'lisans'` değerlerinden kurulum tamamlandı çıkarımı yapmayacak biçimde düzeltildi.
  - `lib/features/auth/data/auth_notifier.dart`: `AuthUserState.isHydrating` eklendi; `_hydrateAllFromCloud()` `_activeHydration` ile serileştirilip önce tercihleri (`userPreferencesProvider`), ardından istatistikleri (`studyStatsProvider`), sonra planlayıcıyı (`studyPlannerProvider`) ve yanlış defterini sıralı yükleyecek biçimde güncellendi; `signIn` / `signUp` / demo Google girişinde yükleme tamamlanana kadar beklendi.
  - `lib/features/auth/presentation/auth_screen.dart`, `lib/app/app_shell.dart`, `lib/main.dart`: `AuthScreen(isInitialGate: true)` ile geri tuşsuz açılış kapısı kuruldu; `AppShell` içinde `Auth-First` -> `_CloudHydrationScaffold` (`isHydrating`) -> tek seferlik zorunlu `OnboardingScreen(isMandatory: true)` -> `HomeScreen` akışı zorunlu kılındı (widget testlerindeki `isTestPreOnboarded` desteği korunarak); `main.dart` oturumsuzken yerel önbellek yüklemeyecek biçimde korundu.
  - `lib/features/profile/data/user_preferences_notifier.dart`, `lib/features/planner/data/study_planner_notifier.dart`, `lib/core/services/local_storage_service.dart`: `study_pace` normalizasyonu (`StudyProgramPace.fromKey`), `_isOnlyUntouchedDefaultTasks()` ile şablonun bulutu ezmesinin engellenmesi, bulut `planner_state` boş ama aktif programı olan eski hesaplarda (`hasCompletedOnboarding || hasActiveStudyProgram`) `setupAutoProgram(...)` kurtarması ve `signOut()` sonrası hesaplar arası yerel önbellek izolasyonu (`clearActivePlannerCache()`) eklendi.
  - Canlı Supabase (`kadroDB` — `axfxciyuvcdbavhzsfwu`): `omerefephlvn2@gmail.com` hesabının `profiles.study_pace`, `daily_goal_questions` ve `auth.users.raw_user_meta_data` kayıtları mevcut `auto_dk90_d1_*` `planner_state` planıyla eşitlendi (`dk90`, `70` soru, `has_completed_onboarding: true`).
  - Testler: `test/auth_first_onboarding_and_sync_test.dart` (6 senaryo) eklendi, `test/auth_screen_test.dart` ve `test/curriculum_planner_onboarding_test.dart` güncellendi.

---

### 📦 TASK-120: Çalışma Türleri (`PracticeHubScreen`) "Konu Testi" Ders/Konu Yol Haritası Bağlantısı & 3 Soruluk Fallback Noktalarının Havuza Bağlanması
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Kök Neden:** `PracticeHubScreen` üzerindeki "Konu testi" ve "Deneme sınavı" kartları ile Ana Sayfa "Seri & Hedef" hatırlatıcısı `QuizScreen()`'e soru kaynağı parametresi vermediği için (ve "ÖSYM Çeldirici Avı" kartında `fetchAllFromPool: true` eksik olduğu için) `QuizScreen` 3 soruluk `defaultSampleQuestions` yedeğine düşüyordu.
  - **"Konu Testi" Ders Seçici & Yol Haritası Köprüsü (`lib/features/practice/presentation/practice_hub_screen.dart`):**
    - "Konu testi" kartına dokunulduğunda 4 KPSS Genel Kültür dersini (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) sunan `_LessonSelectorBottomSheet` alt çekmecesi açılır.
    - Ders seçildiğinde doğrudan o dersin Konu Yol Haritası ekranına (`LessonTopicsScreen` → `TopicTestsScreen`, 10'ar soruluk aşamalı konu testleri) geçilir.
  - **3 Soruluk Demo Fallback Noktalarının Havuza Bağlanması:**
    - `PracticeHubScreen` → **"Deneme sınavı"**: `QuizScreen(mockExamNumber: 1, examDuration: Duration(minutes: 65), customTitle: 'Genel Kültür Denemesi', mode: QuizMode.exam)` ile 60 soruluk gerçek deneme motoruna bağlandı.
    - `PracticeHubScreen` → **"ÖSYM Çeldirici Avı"**: `fetchAllFromPool: true` eklenerek havuzdan 10 soruluk test açması sağlandı.
    - `HomeScreen` → **"Seri & Hedef" hatırlatıcısı**: `QuizScreen(fetchAllFromPool: true, limit: 10, customTitle: 'Günlük Seri & Hedef Testi')` ile gerçek soru havuzuna bağlandı.
  - **Test & Doğrulama:** `test/practice_hub_and_reminders_test.dart` güncellenerek "Konu testi" ders seçici ve `LessonTopicsScreen` yönlendirmesi widget testiyle doğrulandı.

---

### 📦 TASK-121: Gelişmiş Antrenman Modları: Özel Çeldirici Avı Motoru, Hızlı Deneme Seçici ve Akıllı Seri Koruma Test Üretici
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Özel Çeldirici Avı Motoru (`lib/features/quiz/data/question_repository.dart` & `quiz_screen.dart`):** `fetchDistractorHuntQuestions()` metodu ile `distractorTrap` açıklamasına sahip yüksek çeldiricili sorular filtrelenip eksik kalırsa havuzdan tamamlanır; `QuizScreen(onlyDistractorTraps: true)` bu akışa bağlandı.
  - **Hızlı Deneme Paketi Seçici (`lib/features/practice/presentation/practice_hub_screen.dart`):** `"Deneme sınavı"` kartına tıklandığında `_MockExamSelectorBottomSheet` açılarak 60 soruluk/65 dakikalık Genel Kültür Denemesi #1, #2, #3 ve 20 soruluk/20 dakikalık Hızlı Mini Deneme arasında seçim yapılması sağlandı.
  - **Akıllı Seri & Hedef Test Üretici (`lib/features/home/presentation/home_screen.dart`):** `"Seri & Hedef"` hatırlatıcısı adayın günlük kalan sorusuna (`remainingQuestions.clamp(5, 20)`) ve varsa `weakestLesson` bilgisine göre dinamik odak testi başlatacak şekilde güncellendi (`test/practice_hub_and_reminders_test.dart`).

---

### 📦 TASK-122: KPSS Puan Hesaplama Ekranı (`KpssScoreCalculatorScreen`) Sıfır Varsayılan Değerler & Kompakt Dropdown Sınav Türü Seçici
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - `lib/features/score_calculator/presentation/kpss_score_calculator_screen.dart`: Başlangıç netleri (`_gkCorrect`, `_gkWrong`, `_gyCorrect`, `_gyWrong`) `0` olarak başlatıldı ve üstteki 3'lü segment kutu yerine kompakt `DropdownButton<KpssScoreType>` (`key: ValueKey('score_type_dropdown')`) seçici satırı uygulandı.
  - `test/kpss_score_calculator_test.dart`: İlk açılışta `'0.00'` puan, dropdown ile `P93`/`P94` geçişi ve `+1` doğru ile `1.00 Net` barajının geçilmesi doğrulanacak şekilde güncellendi.

---

### 📦 TASK-123: Harita Atölyesi (`MapPracticeHubScreen` & `MapChallengeScreen`) "Dilsiz Harita (81 İl)" Dar Ekran Taşma (RenderFlex Overflow) Düzeltmesi
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Kök Neden:** `MapPracticeHubScreen` üzerindeki **"Dilsiz Harita (81 İl)"** kartında başlık ve `"Sonsuz Pratik"` rozetinin yatay `Row` içinde sarılmadan yan yana dizilmesi, dar mobil ekranlarda yatay `RenderFlex overflowed` (sarı-siyah taşma şeridi) hatasına yol açıyordu.
  - **`MapPracticeHubScreen` (`lib/features/map_practice/presentation/map_practice_hub_screen.dart`):**
    - `"Dilsiz Harita (81 İl)"` + `"Sonsuz Pratik"` ve `"Tarih: Millî Mücadele Haritası"` + `"Kurtuluş Savaşı"` başlık satırları taşmayı önleyen `Wrap` bileşenine dönüştürüldü.
    - `_showProvinceModeSheet` alt çekmecesi `SingleChildScrollView` ile sarılarak dikey taşmaya karşı korundu.
  - **`MapChallengeScreen` (`lib/features/map_practice/presentation/map_challenge_screen.dart`):**
    - Tamamlanma diyaloğu başlığı, üst soru/etiket rozeti (`Flexible` + `TextOverflow.ellipsis`), harita yönerge metni (`Flexible`) ve açıklama kartı başlığı (`Expanded`) dar ekranlara uyumlu hale getirildi.
  - **Test & Doğrulama:** `test/map_practice_test.dart` içerisine `360x640` kompakt ekran sıfır taşma (`tester.takeException() == null`) testi eklendi ve tüm proje testleriyle doğrulandı.

---

### 📦 TASK-124: Harita Soruları & İl Seçme Ekranında Minimum Kenar Boşluğu, Harita İçi Yakınlaştırma (`+`/Pinch) ve Tam Ekran Büyütme Modalı
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Kenar Boşluklarının Azaltılması & Harita Büyütme:**
    - `lib/shared/widgets/turkey_map/turkey_map.dart`: `TurkeyMap` varsayılan `padding` değeri `EdgeInsets.all(4.0)` yerine `EdgeInsets.zero` yapılarak harita vektör alanının tam genişlikte çizilmesi sağlandı.
    - `lib/shared/widgets/turkey_map/turkey_map_card.dart`: Harita çizim alanı dolgusu (`horizontal: 2, vertical: 4`) ve `_openZoomDialog` kenar boşlukları (`insetPadding: horizontal: 6, vertical: 12`, iç dolgu `2px`) daraltıldı; üst çubuk metni `Flexible` ile korundu.
    - `lib/features/map_practice/presentation/map_challenge_screen.dart`: `ResponsiveContentWrapper` dış yatay dolgusu sıfırlanıp (`padding: EdgeInsets.zero`), harita kartına özel `horizontal: 4` dış ve `fromLTRB(4, 6, 4, 4)` iç dolgu verilerek mobil cihazlarda harita genişliği maksimuma çıkarıldı.
  - **Harita İçi Yakınlaştırma (`InteractiveViewer`) & Tam Ekran `Büyüt` Modalı:**
    - `MapChallengeScreen` haritası `InteractiveViewer` (`TransformationController`, `1.0x`–`4.5x`) ile sarılarak kart içinde iki parmakla yakınlaştırma/kaydırma + hızlı `+` (`map_zoom_in_button`) ve `Sıfırla` (`map_zoom_reset_button`) kontrolleri eklendi.
    - `Büyüt` (`map_fullscreen_button`) butonuyla soruyu üstte gösteren ve `5.0x`'e kadar `+` / `-` / `Sıfırla` butonlarıyla yakınlaştırılabilen tam ekran harita diyaloğu eklendi (`tapProvince` modunda büyütülmüş haritada ile dokunulduğunda seçim kaydedilip diyalog otomatik kapanır).
  - **Test & Doğrulama:** `test/map_practice_test.dart` içinde `360x640` ekranda minimum kenar boşluğu genişliği (`>= 335px`), yakınlaştırma ve `Büyüt` diyaloğu sıfır taşma testleri eklendi; `test/turkey_map_test.dart` ve tüm proje testleriyle doğrulandı.

---

### 📦 TASK-125: Ana Sayfa "Bugünün Çalışma Planı" (`HomeDailyPlanCard`) Sadeleştirme & Okunaklı Görsel Hiyerarşi
- **Durum:** ✅ **Tamamlandı**
- **Açıklama:**
  - **Tespit Edilen Karmaşıklık Nedenleri:**
    1. Üstte `'Tümünü Gör'` varken altta ikinci kez tam genişlikli `'Planlayıcıyı Aç & Görev Ekle'` butonu; aynı şekilde gün değiştirme için hem ortadaki şeritte `<`/`>` ikonları hem altta `'Önceki Güne Dön'` butonu bulunması gereksiz görsel kalabalık yaratıyordu.
    2. Tempo bilgisi (`60 Dk · Tam Ritim (Önerilen) (60 dk/gün)`) süreyi iki kez yazıyor ve `'Düzenle'` ile dar alanda sıkışıyordu.
    3. Görev satırları çerçevesiz ve tek satıra sığdırıldığı için konu isimleri okunmuyor, dokunulabilir görev kartı hissi zayıf kalıyordu.
  - **Uygulanan Çözüm (`lib/features/planner/presentation/widgets/home_daily_plan_card.dart`):**
    - Çift divider, tekrarlı `<`/`>` okları ve alttaki mükerrer `'Planlayıcıyı Aç & Görev Ekle'` butonu kaldırıldı.
    - Sade `Gün X` (geçmiş günde yanında `Tekrar` etiketi) + temiz program adı (`prefs.studyProgramPace.label`) + `Düzenle` satırı oluşturuldu.
    - Altına tek bakışta tamamlanma durumunu gösteren `LinearProgressIndicator` ve `${completed}/${total} görev` sayacı eklendi.
    - Her görev `_DailyPlanTaskItem` olarak kendi çerçeveli kutusuna taşındı (`title` üstte, `lessonTag` altta, sağda net `'Başla'` / `'Tekrar'` durumu).
  - **Test & Doğrulama:** `test/study_planner_test.dart` güncel sadeleştirilmiş butonlarla (`'Tümünü Gör'`, `'Düzenle'`) uyumlu hale getirildi ve planlayıcı + ana sayfa testleriyle doğrulandı.

---

## 🏗️ 4. Çoklu KPSS Ekosistemi Genişleme Mimarisi & Fazlı Yol Haritası (`TASK-126` – `TASK-144`)

> [!IMPORTANT]
> **Mimari Öncelik & İçerik Sınırı:** Bu bölümün amacı **ilk olarak projeyi tüm KPSS türlerini** *(B Grubu GY-GK, E-KPSS, DHBT, MEB-AGS + 17 Branş ÖABT ve KPSS A Grubu 9 Alan)* **sorunsuz, güvenli, yüksek performanslı ve yeniden kullanılabilir kodla destekleyecek esnek mimariye ulaştırmaktır.**  
> **Soru, bilgi kartı, eşleştirme ve harita verisi üretimi (`TASK-140` – `TASK-144`) bilinçli olarak EN SON FAZA bırakılmıştır.** Önce altyapı, veritabanı, önbellek, güvenlik, dinamik motorlar ve UI/UX kurulacak; veri girişi en son yapılacaktır.

### 🔍 Mevcut Kod Tabanı Kıdemli Mimari Denetim (Audit) Özeti
Yeni sınav türlerini eklemeden önce tespit edilen ve **`TASK-126` – `TASK-132`** içinde çözülecek temel borçlar / darboğazlar:
1. **Hardcoded Ders/Sınav Sabitleri:** `lib/features/lessons/data/kpss_lessons.dart` (`kpssLessons`, `defaultTopicTestCount` `if-else` zinciri), `AutoStudyProgramGenerator._lessonRotation`, `StudyProgramPace.evaluateSchedule` (`totalCurriculumTestCount`), `LessonsScreen` (`'KPSS Genel Kültür'`, `/ 60`), `ExamsScreen` (`60 Soru / 65 Dk`), `PracticeHubScreen` (`'4 ders'`, `'65 Dakika'`), `FlashcardsScreen` (`_lessonFilters`) ve `MistakesScreen` (`tarihCount` vb.) yalnızca 4 Genel Kültür dersine sabitlidir.
2. **Ad Uzayı (Namespace) & Veritabanı Çakışmaları:**
   - `public.user_topic_mastery` tablosundaki `unique(user_id, lesson, topic)` kısıtı farklı sınav türlerinde aynı ders/konu adları kullanıldığında veriyi ezer.
   - `OfflineDownloadService` ve `LocalStorageService` paket anahtarları (`topic_${lesson}_$topic`) kapsam/sınav ön eki taşımaz.
   - `lessonTopicTestCountsProvider(lessonName)` yalnızca ders adına göre önbellekler.
3. **Performans & Ağ Trafiği Darboğazları:**
   - `MistakeRepository.hydrateFromCloud()` çözülmemiş yanlışları eşleştirmek için tüm havuzu (`questionRepository.fetchQuestions()`) bellekten çekmeye çalışır; 20.000+ soruluk çoklu sınav yapısında ciddi Egress ve RAM maliyetine yol açar.
   - `QuestionRepository` tek büyük JSON fallback'i UI thread'inde ayrıştırır ve kapsamsız düz haritada tutar.
4. **Sert Tarih / Başlık Bağımlılığı & Güvenlik:**
   - `HomeScreen` üzerinde `'KPSS 2027: ${target.shortTitle}'` ifadesi sabittir; `KpssExamTarget` tarihleri `AppRemoteConfig` ile uzaktan güncellenemez.
   - `public.profiles` üzerinde çoklu sınav seçimi için şema doğrulamalı (`jsonb`) saklama ve `exam_scopes` için `GIN` indeksi yoktur.
5. **Dağınık Hedef Seçim Arayüzü & Tekil Puan Motoru:**
   - `TargetExamSelectorBottomSheet`, `OnboardingScreen`, `AutoStudyProgramModal` ve `PomodoroStudioScreen` farklı/dar seçiciler kullanır; `KpssScoreCalculator` yalnızca `P3/P93/P94` formülüne sabitlidir.

---

### 📦 TASK-126: Yönetişim Güncellemesi, Çoklu KPSS Çekirdek Alan Modelleri (`KpssExamFamily`, `ExamSelection`) & Dinamik Uzaktan Takvim (`AppRemoteConfig`)

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — Çekirdek Mimari Temeli)*
- **Amaç:** Tekil `KpssExamTarget` enumunun geriye dönük uyumu koruyarak hiyerarşik çoklu KPSS ekosistemi değer nesnesine (`ExamSelection`) dönüştürülmesi, dokümantasyon/anayasa kilidinin açılması ve sabit yıl/tarih (`KPSS 2027`) hardcoding'inin kaldırılması.

```text
GÖREV: TASK-126 — Yönetişim Güncellemesi, Çoklu KPSS Alan Modelleri (KpssExamFamily, ExamSelection) & Dinamik Sınav Takvimi
ÖNEMLİ: GEMINI.md mimari kurallarına uy. Mevcut KPSS Lisans GK kullanıcı verileri ve widget testleri %100 geriye dönük uyumlu kalmalıdır. Soru verisi üretme.

ADIM 1: Yönetişim & Spesifikasyon Güncellemesi
1. `GEMINI.md`, `docs/task-board.md` (Bölüm 1) ve `docs/content-specification-guide.md` belgelerindeki "Sadece KPSS Lisans Genel Kültür" kısıtını çoklu KPSS ekosistemi vizyonunu (B Grubu, A Grubu, DHBT, MEB-AGS/ÖABT, E-KPSS) ve `exam_scopes` / `sub_branch` / zorunlu `distractorTrap` taksonomi kurallarını kapsayacak şekilde güncelle.

ADIM 2: Hiyerarşik Çoklu Sınav Değer Nesneleri (`lib/features/exams/data/models/exam_selection.dart`)
1. `KpssExamFamily` enumunu tanımla:
   - `bGrubu` (B Grubu Ortak GY-GK)
   - `aGrubu` (A Grubu Kariyer Alan Bilgisi)
   - `dhbt` (Din Hizmetleri Alan Bilgisi Testi)
   - `mebAgs` (Millî Eğitim Bakanlığı Akademi Giriş Sınavı + ÖABT)
   - `ekpss` (Engelli Kamu Personeli Seçme Sınavı)
2. Alt boyut enumlarını tanımla:
   - `EducationLevel` (`lisans`, `onlisans`, `ortaogretim`)
   - `BGroupProfile` (`onlyGk`, `fullGyGk`) — Mevcut Lisans GK kullanıcılarının akışını korumak için varsayılan `onlyGk` destekli.
   - `DisabilityGroup` (`genel`, `gorme`, `isitme1`, `zihinsel`)
   - `OabtBranch` (Resmî 17 ÖABT branşı: `turkce`, `ilkogretimMatematik`, `matematikLise`, `fenBilimleri`, `fizik`, `kimya`, `biyoloji`, `sosyalBilgiler`, `turkDiliEdebiyati`, `tarih`, `cografya`, `dkabIhl`, `pdr`, `sinifOgretmenligi`, `okulOncesi`, `bedenEgitimi`, `ozelEgitim` + AGS-only `none` ve yabancı dil `ydsDil`).
   - Her `OabtBranch` üzerinde `durationMinutes` (Mat/Fen/Fizik/Kimya/İlkMat: `90`, diğer 12 alan: `70`) ve `hasFieldEducationSplit` (`true` -> Sınıf, Okul Öncesi, Özel Eğitim: 30+20) özellikleri tutulsun.
3. Immutable `ExamSelection` sınıfını yaz (`const` constructor, `copyWith`, `toJson`, `fromJson`, `==` / `hashCode`):
   - Alanlar: `family`, `educationLevel`, `bGroupProfile`, `oabtBranch`, `disabilityGroup`, `selectedFieldLessons` (A Grubu için), `examCycleYear` (`int`, örn. `2026`/`2027`/`2028`), `includeExtraTime` (`bool`).
   - Hesaplanan kanonik özellikler:
     - `String get scopeKey` (örn: `'lisans_gk'`, `'lisans_gygk'`, `'onlisans_gygk'`, `'ortaogretim_gygk'`, `'ekpss_lisans'`, `'dhbt_onlisans'`, `'meb_ags_oabt_tarih'`, `'a_grubu_p48'`).
     - `String get curriculumNamespace` (paket ID'leri ve önbellek anahtarları için güvenli slug).
     - `String get displayTitle` & `String get shortTitle` & `String get subtitle`.
   - `KpssExamTarget` (`lib/features/pomodoro/data/pomodoro_notifier.dart`) ile çift yönlü köprü (`ExamSelection.fromLegacyTarget(KpssExamTarget)` ve `toLegacyTarget()`) ekle; hiçbir mevcut çağrı noktası kırılmasın.

ADIM 3: Dinamik Uzaktan Sınav Takvimi (`lib/core/config/app_remote_config.dart` & `lib/features/home/presentation/home_screen.dart`)
1. `AppRemoteConfig` içine `final Map<String, DateTime> examDateOverrides;` (`fromMap` içinde `exam_date_overrides` JSON haritasını güvenli parse et; hatalı tarihlerde sessiz fallback yap) ekle.
2. `ExamSelection.resolveExamDate(AppRemoteConfig config)` metodu üzerinden resmi ÖSYM takvimi güncellemelerinin mağaza güncellemesi gerektirmeden çekilmesini sağla.
3. `lib/features/home/presentation/home_screen.dart` içindeki sabit `'KPSS 2027: ${target.shortTitle}'` hardcoding'ini kaldırıp `selection.displayTitle` (dinamik yıl ve tür başlığı) kullan.

ADIM 4: Birim Testleri (`test/exam_selection_test.dart`) & Doğrulama
1. `toJson`/`fromJson`, eski `KpssExamTarget` (`lisans`, `onlisans`, `ortaogretim`, `dhbt`) göçü, 17 ÖABT branşı süre/yapı özellikleri ve `AppRemoteConfig.examDateOverrides` parse senaryolarını test et.
2. `.agents/skills/flutter-verify/SKILL.md` adımlarını (`dart format lib test`, `flutter analyze`, `flutter test`) 0 hata ile doğrula.
```

---

### 📦 TASK-127: Merkezi Müfredat Kayıt Motoru (`CurriculumRegistry` & `ExamCurriculum`) — Sabit `kpssLessons` Hardcoding Refaktörü

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — Çekirdek Mimari Temeli · 361/361 Test)*
- **Amaç:** Uygulamanın her yerine dağılmış 4 derslik (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) ve sabit `if/else` test sayısı/ağırlık kabullerini tek merkezi, genişletilebilir `CurriculumRegistry` mimarisine taşımak.

```text
GÖREV: TASK-127 — Merkezi Müfredat Kayıt Motoru (CurriculumRegistry & ExamCurriculum) ve Sabit Ders Hardcoding Refaktörü
ÖNEMLİ: GEMINI.md kurallarına uy. Mevcut KPSS Lisans GK müfredatı, soru sayıları (27/18/9/6) ve konu başlıkları %100 korunmalıdır.

ADIM 1: `ExamCurriculum` & `CurriculumAvailability` Modelleri (`lib/features/lessons/data/models/exam_curriculum.dart`)
1. `CurriculumAvailability` enumu: `ready`, `partial`, `comingSoon`.
2. `LessonSpec` immutable sınıfı (mevcut `Lesson` modelini tamamlayan veya genişleten):
   - `String canonicalName` (örn. `'Tarih'`, `'DHBT-1 Temel Din Bilgisi'`, `'Alan Hukuk'`, `'ÖABT Sınıf Öğretmenliği'`)
   - `String displayTitle`, `int questionCount`, `List<String> topics`
   - `Map<String, int> defaultTestCountsByTopic` (artık dev `if/else` zinciri yerine veri tablosu!)
   - `CurriculumAvailability availability`
3. `ExamCurriculum` immutable sınıfı:
   - `String scopeKey`, `String title`, `String summaryLabel` (örn. `'4 ders · 60 Soru · Sınav dağılımı'`)
   - `int totalQuestions`, `int standardDurationMinutes`
   - `List<LessonSpec> activeLessons`, `List<LessonSpec> upcomingLessons`
   - `bool supportsTurkeyMapWorkshop`, `bool supportsMiniGames`, `bool supportsFlashcards`
   - `int get totalTestCount` (seçili müfredatın dinamik toplam test sayısı!).

ADIM 2: `CurriculumRegistry` & Riverpod Sağlayıcıları (`lib/features/lessons/data/curriculum_registry.dart`)
1. `CurriculumRegistry.resolve(ExamSelection selection)` saf fonksiyonunu yaz (ilk etapta mevcut B Grubu Lisans GK ile Ön Lisans/Ortaöğretim GK'yı tam, diğer sınav aileleri için temel iskeleti döndürsün; Faz A–E görevlerinde tüm ağaçlar eklenecek).
2. `final activeCurriculumProvider = Provider<ExamCurriculum>((ref) => ...)` ekle (`userPreferencesProvider` içindeki aktif `ExamSelection` değerini izler).
3. `lib/features/lessons/data/kpss_lessons.dart` içindeki `defaultTopicTestCount` fonksiyonunu `CurriculumRegistry` tablosuna delege edecek şekilde sadeleştir; eski sabit global listelere `@Deprecated` notu düş (mevcut testleri kırmadan).

ADIM 3: Dağınık 4-Ders Hardcoding'lerinin Dinamikleştirilmesi
1. `lib/features/lessons/presentation/lessons_screen.dart`: Sabit `'KPSS Genel Kültür'`, `'4 ders · Sınavdaki soru ağırlık dağılımı'`, `'60 Soru'` ve `/ 60` oranı hesaplarını `activeCurriculumProvider` değerinden oku.
2. `lib/features/flashcards/presentation/flashcards_screen.dart`: Sabit `_lessonFilters = ['Tümü', 'Tarih', 'Coğrafya', ...]` listesini `activeCurriculum.activeLessons` + mevcut kart derslerinin deterministik birleşiminden üret.
3. `lib/features/mistakes/presentation/mistakes_screen.dart`: Sabit `tarihCount`/`cografyaCount` ve `lessonChips` bloğunu mevcut `mistakes` + aktif derslerden dinamik üreten yardımcıya dönüştür (`Map<String, int>` sayımı; kod tekrarsız tek döngü).
4. `lib/features/planner/data/models/study_program_pace.dart`: `evaluateSchedule(KpssExamTarget, {ExamCurriculum? curriculum, DateTime? now})` imzasını genişleterek `totalCurriculumTestCount` yerine seçili müfredatın gerçek toplam test sayısını (`curriculum?.totalTestCount ?? totalCurriculumTestCount`) kullansın.

ADIM 4: Birim & Widget Testleri (`test/curriculum_registry_test.dart`) & Doğrulama
1. `CurriculumRegistry` çözümlemelerini, `LessonsScreen`, `MistakesScreen` (farklı/yeni bir ders adıyla yanlış soru varken chip oluşması) ve `StudyProgramPace` dinamik test sayısı hesabını test et.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-128: Çoklu Sınav Veritabanı Şeması (`exam_scopes`), `user_topic_mastery` Çakışma Düzeltmesi & RLS/İndeks/RPC Zırhı

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — Veritabanı, Bütünlük & Güvenlik · Not: `05_multi_exam_architecture.sql`, `supabase_schema.sql`, `README_MIGRATION_GUIDE.md` ve `test/supabase_migration_contract_test.dart` tamamlanıp `363/363` testle doğrulandı; canlı `kadroDB` üzerinde `apply_migration` MCP onayı istemci tarafından iptal edildiği için Supabase SQL Editor üzerinden manuel çalıştırılması gerekir)*
- **Amaç:** Yeni sınav türleri eklendiğinde veri bütünlüğü bozulmasını (`user_topic_mastery` tekil anahtar çakışması), yavaş sorguları (`exam_scopes` dizi taraması) ve istemci manipülasyonunu veritabanı seviyesinde (PostgreSQL + RLS) kalıcı olarak önlemek.

```text
GÖREV: TASK-128 — Çoklu Sınav PostgreSQL Şeması, İndeksleme, Unique Kısıt Düzeltmesi & RLS/RPC Zırhı
ÖNEMLİ: Supabase Postgres Best Practices kurallarına uy. Geriye dönük uyumlu (non-breaking) ve idempotent SQL migrasyonu yaz; mevcut canlı verileri bozma.

ADIM 1: Yeni Migrasyon Dosyası (`docs/supabase_migrations/03_multi_exam_architecture.sql`)
1. `public.questions` tablosuna kapsam sütunlarını güvenli (`IF NOT EXISTS`) ekle:
   - `exam_scopes text[] not null default array['lisans_gk']::text[]`
   - `sub_branch text null` (Örn. `'oabt_tarih'`, `'dhbt_lisans'`, `'a_grubu_hukuk'`)
   - `education_level text null` (`'lisans' | 'onlisans' | 'ortaogretim'`)
   - `disability_variant text null` (`'genel' | 'gorme' | 'isitme1' | 'zihinsel'`)
   - `source_variant text null` (`'standard' | 'simplified'`)
2. Performans indeksleri (`CREATE INDEX IF NOT EXISTS`):
   - `idx_questions_exam_scopes_gin on public.questions using gin (exam_scopes)` (dizi kapsama `@>` / `&&` sorguları için)
   - `idx_questions_scope_lesson_topic on public.questions (lesson, topic, order_index)`
   - `idx_questions_sub_branch on public.questions (sub_branch) where sub_branch is not null` (partial index!)
3. `public.user_topic_mastery` Çakışma Düzeltmesi:
   - `exam_scope text not null default 'lisans_gk'` ekle.
   - Mevcut `unique(user_id, lesson, topic)` kısıtını güvenli blok içinde (`DO $$ ...`) düşürüp `unique(user_id, exam_scope, lesson, topic)` bileşik kısıtına dönüştür.
4. `public.quiz_sessions`, `public.question_attempt_logs`, `public.study_tasks` tablolarına `exam_scope text not null default 'lisans_gk'` sütunu ve `(user_id, exam_scope, completed_at desc)` / `(user_id, exam_scope)` indeksleri ekle.
5. `public.profiles` Çoklu Sınav Tercihi & Güvenlik Kısıtları:
   - `exam_selection jsonb not null default '{}'::jsonb` ve `sub_exam_branch text null` ekle.
   - `ALTER TABLE public.profiles` içine `exam_selection` için tip ve boyut koruması `CHECK (jsonb_typeof(exam_selection) = 'object' AND octet_length(exam_selection::text) <= 4096)` ekle.
   - Mevcut `prevent_direct_is_pro_escalation()` ve `prevent_xp_and_league_tampering()` triggerlarının kesintisiz çalıştığını doğrula (anon/authenticated `profiles` update'inde yeni alanların yetkisiz alanları etkilemediğini garantile).
6. `public.app_config` (TASK-94 tablosu):
   - `exam_date_overrides jsonb not null default '{}'::jsonb` ekle.
7. `public.get_weekly_leaderboard(p_exam_family text default null)`:
   - Varsayılan parametreli overload/güncelleme ile mevcut `get_weekly_leaderboard()` çağrıları kırılmadan sınav ailesi bazlı lig filtresini destekle (`security definer`, `set search_path = public`).
8. RLS Doğrulama Notları: `public.questions` için salt-okunur (`SELECT` where `is_active = true`) politikasını ve anon scraping sınırını koru.

ADIM 2: Ana Şema Dokümantasyonu Güncellemesi (`docs/supabase_schema.sql`)
1. Taze kurulumlarda tek seferde aynı şemanın oluşması için `docs/supabase_schema.sql` başındaki tablo tanımlarını `03_multi_exam_architecture.sql` ile senkronize tut.

ADIM 3: Doğrulama
1. SQL sözdizimi ve idempotentliği kontrol et; varsa `tools/validate_sql.py` betiğiyle kontrol et. `flutter analyze` / `flutter test` 0 hata doğrula.
```

---

### 📦 TASK-129: Ad Uzayı (Namespace) İzolasyonu, Bellek/Önbellek Performansı, Isolate JSON Ayrıştırma & `MistakeRepository` Batch Hydration

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — Performans, Önbellek & Çakışma Önleme)*
- **Amaç:** Havuz büyüdüğünde UI takılmasını (jank), bellek şişmesini, gereksiz Supabase veri transferini (egress) ve ders/konu çevrimdışı paket çakışmalarını ortadan kaldırmak.

```text
GÖREV: TASK-129 — Ad Uzayı İzolasyonu, Bounded LRU+TTL Önbellek, Isolate JSON Yükleyici & MistakeRepository Batch Hydration
ÖNEMLİ: GEMINI.md ve Supabase performans kurallarına uy. Mevcut çevrimdışı kullanıcı paketleri kaybolmamalıdır.

ADIM 1: `Question` Modeli Güncellemesi (`lib/features/quiz/data/models/question.dart`)
1. `final List<String> examScopes;` (varsayılan `const ['lisans_gk']`), `final String? subBranch;`, `final String? educationLevel;`, `final String? disabilityVariant;`, `final String? sourceVariant;` alanlarını ekle.
2. `fromJson` ve `fromSupabase` içinde geriye dönük uyumlu parse (`exam_scopes` yoksa `['lisans_gk']` kabul et) ve `Question.cleanText` sanitization'ını koru.
3. `bool matchesSelection(ExamSelection selection, {String? preferredSourceVariant})` saf yardımcı metodunu ekle.

ADIM 2: Çevrimdışı Paket ve Yerel Depolama Namespace İzolasyonu
1. `lib/core/services/offline_download_service.dart` ve `lib/core/services/local_storage_service.dart`:
   - Paket anahtarı üreten tek merkezi yardımcı tanımla: `static String topicPackageId({required String scopeNamespace, required String lesson, required String topic})` -> `'topic_${scopeNamespace}_${lesson}_$topic'`.
   - `lisans_gk` için eski `'topic_${lesson}_$topic'` anahtarlarından okuma yapabilen geriye dönük geçiş desteği (legacy key fallback) sağla; böylece mevcut PRO kullanıcıların indirdiği paketler silinmez!
2. `lib/features/lessons/presentation/lesson_topics_screen.dart` ve `lib/features/lessons/presentation/topic_tests_screen.dart`:
   - Sabit `'topic_${lesson.name}_$topic'` yerine yukarıdaki merkezi `topicPackageId` yardımcısını kullan.

ADIM 3: `QuestionRepository` Skalabilite, Isolate Parse & Bounded LRU/TTL Önbellek (`lib/features/quiz/data/question_repository.dart`)
1. Sabit `Map<String, List<Question>> _cachedQuestions` yerine **kapasite sınırlı (bounded LRU, max ~24 kapsam/ders dilimi) + 2 saat TTL'li önbellek** yapısına geç; `scopeKey`, `subBranch`, `lesson`, `difficulty`, `sourceVariant` parametreleriyle izole önbellekle.
2. Modüler yerel asset yükleyici tasarla:
   - Önce kapsam bazlı dosya varsa (`assets/data/scopes/<scopeNamespace>.json`) yükle, yoksa mevcut `assets/data/sample_questions.json` yedeğine düş.
   - 50 KB üzeri / büyük JSON parse işlemlerini ana UI thread'ini bloklamamak için Flutter `compute()` (Background Isolate) üzerinden çalıştır (test ortamı güvenli olacak şekilde fallback koruyarak).
3. `fetchQuestions(...)` ve `fetchTopicTestCounts(...)` imzalarını opsiyonel `ExamSelection? selection` alacak şekilde genişlet; Supabase sorgularında `limit(60)` scraping kalkanını koruyarak `.contains('exam_scopes', [selection.scopeKey])` / `sub_branch` filtreleri uygula.
4. `lessonTopicTestCountsProvider` family anahtarını tekil `String lessonName` yerine immutable value object `(String scopeKey, String lessonName)` (`TopicCountQueryKey`) yapısına dönüştür ki aynı ders farklı sınav türlerinde birbirinin test sayılarını ezmesin.

ADIM 4: `MistakeRepository.hydrateFromCloud()` Egress & Performans Düzeltmesi (`lib/features/mistakes/data/mistake_repository.dart`)
1. Tüm havuzu indiren `await questionRepository.fetchQuestions()` çağrısını kaldır.
2. Bunun yerine yalnızca `unresolvedLogs` içindeki `question_id` listesini toplayıp (chunk'lar halinde, en fazla 50 ID/istek) Supabase'ten `.inFilter('id', ids)` ile nokta atışı çeken `QuestionRepository.fetchQuestionsByIds(List<String> ids)` metodunu yaz ve bağla (ID yoksa yerel asset/fallback'te `text` eşleşmesine düş).

ADIM 5: Test & Doğrulama (`test/question_repository_scope_cache_test.dart`, `test/offline_download_test.dart`)
1. Scope izolasyonu, eski `topic_*` PRO paket geriye dönük okuması, LRU önbellek, `MistakeRepository` ID-tabanlı hidrasyonu ve `TopicCountQueryKey` eşitliğini birim testleriyle doğrula.
2. `dart format lib test`, `flutter analyze`, `flutter test` çalıştırıp 0 hata doğrula.
```

---

### 📦 TASK-130: Dinamik Deneme Sınavı Şablon Motoru (`MockExamBlueprint`), Bölüm Sekmeli Optik Palet & Veri Güdümlü `PracticeHub` / `ExamsScreen`

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — Yeniden Kullanılabilir Sınav Motoru & UI/UX · `402/402` test & `0` analyzer hatası ile doğrulandı)*
- **Amaç:** Sabit `60 soru / 65 dk Genel Kültür` kabulüne gömülü olan deneme motoru, zamanlayıcı ve alt çekmece seçimlerini tamamen şablon güdümlü (`MockExamBlueprint`) hale getirmek.

```text
GÖREV: TASK-130 — MockExamBlueprint Motoru, Çok Bölümlü Optik Palet & Veri Güdümlü Exams/Practice Ekranları
ÖNEMLİ: GEMINI.md ve MASTER.md (TactileCard, Theme.of(context), sıfır overflow) kurallarına birebir uy.

ADIM 1: `MockExamBlueprint` Modeli & `ExamBlueprintRegistry` (`lib/features/exams/data/models/mock_exam_blueprint.dart`)
1. `ExamSectionSpec` immutable modeli: `String lesson`, `int questionCount`, `String? topicFilter`.
2. `MockExamBlueprint` immutable modeli:
   - `String id`, `String scopeKey`, `String title`, `String subtitle`
   - `List<ExamSectionSpec> sections`, `int totalQuestions`, `Duration standardDuration`
   - `bool allowExtraTime`, `int extraTimeMinutes`, `bool isProOnly`, `int mockNumber`
   - `List<MockExamBlueprint> splitSessions` (opsiyonel çoklu oturumlar için bölüm metadata'sı).
3. Mevcut GK deneme paketlerini (`Deneme #1..#3` 60S/65dk ve `20 Soruluk Hızlı Mini Deneme`) bu yeni modele taşı.

ADIM 2: Jenerik Deneme Üreticisi (`lib/features/quiz/data/question_repository.dart`)
1. `Future<List<Question>> generateMockExamFromBlueprint(MockExamBlueprint blueprint, {required ExamSelection selection, int mockNumber = 1})` metodunu yaz:
   - Her `ExamSectionSpec` için ilgili `lesson`, `selection` kapsamı ve deterministik offset ile soru çeker; yetersiz soru varsa güvenli fallback uygular ve her soruya section metadata'sı ekler.
2. Mevcut `generateGeneralCultureMockExam(...)` metodunu geriye dönük uyumu bozmadan bu motoru saracak şekilde bırak.

ADIM 3: `QuizScreen` Çok Bölümlü Optik Palet & Ek Süre Uyarlaması (`lib/features/quiz/presentation/quiz_screen.dart`)
1. `QuizScreen` opsiyonel `MockExamBlueprint? blueprint` ve `ExamSelection? examSelection` parametreleri alsın (mevcut `mockExamNumber` parametresi korunarak!).
2. Deneme `sections.length > 1` veya `> 30` soru içeriyorsa Soru Paleti BottomSheet'inde **Bölüm/Ders Hızlı Atlama Sekmeleri** (örn. `Türkçe (1-30)`, `Matematik (31-60)` veya `Tarih`, `Coğrafya`) sun (`Wrap` / yatay kaydırılabilir çip çubuğu; dar ekranda taşmasız).
3. `blueprint?.allowExtraTime == true` ve kullanıcı tercihi aktifse zamanlayıcıya ek süreyi (`extraTimeMinutes`) otomatik ekle ve AppBar sayacında şeffaf göster.
4. `CloudSyncRepository.saveQuizSession` çağrısında `exam_scope` bilgisini de kaydet.

ADIM 4: `ExamsScreen` & `PracticeHubScreen` Veri Güdümlü Dönüşümü
1. `lib/features/exams/presentation/exams_screen.dart`: Kahraman deneme kartındaki ve paket listesindeki sabit `60 soru / 65 dk` değerlerini `activeCurriculumProvider` ve `ExamBlueprintRegistry.forSelection(selection)` listesinden oku.
2. `lib/features/practice/presentation/practice_hub_screen.dart`:
   - Sabit `'10–20 SORU'`, `'65 DAKİKA'`, `'60 soruluk gerçek KPSS oturumu'` etiketlerini seçili müfredatın dinamik verisiyle değiştir.
   - `_LessonSelectorBottomSheet`: Sabit `kpssLessons` yerine `activeCurriculum.activeLessons` (ve `comingSoon` olanları kilit/bilgi rozetiyle) listelesin.
   - `_MockExamSelectorBottomSheet`: Seçili sınav türüne ait `MockExamBlueprint` paketlerini listelesin.

ADIM 5: Test & Doğrulama (`test/mock_exam_blueprint_test.dart`, `test/practice_hub_and_reminders_test.dart`)
1. Çok bölümlü blueprint soru dağılımı, optik palet bölüm atlama, ek süre zamanlayıcısı ve dar ekranda zero-overflow widget testlerini yaz.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-131: Evrensel 2 Kademeli Hiyerarşik Sınav Seçici (`ExamTargetPickerView`), `OnboardingScreen` Yenilemesi & Çoklu Cihaz `ExamSelection` Senkronu

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — UI/UX Pro Max, Yeniden Kullanılabilirlik & Bulut Senkronu · `402/402` test ile doğrulandı)*
- **Amaç:** 5 ana sınav ailesi, öğrenim düzeyleri, 17 ÖABT branşı ve 4 E-KPSS engel grubunu kullanıcıyı bunaltmadan (**Progressive Disclosure**) seçtiren tek yeniden kullanılabilir UI bileşeni kurmak ve cihazlar arası senkronu `TASK-119` kalitesinde korumak.

```text
GÖREV: TASK-131 — Evrensel 2 Kademeli ExamTargetPickerView, OnboardingScreen Yenilemesi & ExamSelection Bulut Senkronu
ÖNEMLİ: GEMINI.md, MASTER.md (TactileCard, PhosphorIcons, sıfır sabit Color/fontSize) ve TASK-119 sıralı hidrasyon kurallarına uy.

ADIM 1: Tek Yeniden Kullanılabilir Seçici Bileşen (`lib/shared/widgets/exam_target_picker_view.dart`)
1. `TargetExamSelectorBottomSheet`, `OnboardingScreen`, `AutoStudyProgramModal` ve `PomodoroStudioScreen`'de ayrı ayrı duran hedef seçicileri ortak `ExamTargetPickerView` widget'ına delege edecek şekilde yeniden tasarla:
   - **Kademe 1 (Sınav Ailesi Kartları):** B Grubu (Lisans/Ön Lisans/Ortaöğretim), KPSS DHBT, E-KPSS, MEB-AGS + ÖABT, KPSS A Grubu (Alan Bilgisi). Her kart `TactileCard` ile kısa net özet rozetleri (`GY-GK`, `P122-124`, `ÖABT` vb.) taşır.
   - **Kademe 2 (Dinamik Detay Paneli — Seçime Göre Açılır):**
     - *B Grubu:* Düzey (`Lisans`/`Ön Lisans`/`Ortaöğretim`) + Profil (`Sadece Genel Kültür (60)` / `Tam GY-GK (120)`)
     - *E-KPSS:* Öğrenim Düzeyi (`Ortaöğretim`/`Ön Lisans`/`Lisans`) + Engel Grubu (`Genel`, `Görme`, `İşitme-1`, `Zihinsel`) + `Ek Süre Kullan` anahtarı
     - *DHBT:* Öğrenim Düzeyi (`Ortaöğretim İHL`/`Ön Lisans`/`Lisans`)
     - *MEB-AGS:* Branş Seçici (aranabilir modal / filtreli liste: `Sadece AGS (P1)`, 17 `ÖABT` branşı veya `YDS Yabancı Dil (P3)`)
     - *A Grubu:* Hazır `P48 Çekirdek` paketi veya çoklu alan seçimi (`Hukuk`, `İktisat`, `Maliye`, `Muhasebe`, ...)
   - İleride yeni sınav türleri geldikçe içerik durumu (`Hazır` / `Yakında · Altyapı Hazır`) şeffaf etiketlensin.

ADIM 2: Ekran Entegrasyonları
1. `lib/shared/widgets/target_exam_selector_bottom_sheet.dart`: `showSelection(...)` ile tam `ExamSelection` döndürsün (eski `show()` metodu geriye dönük wrapper kalsın).
2. `lib/features/onboarding/presentation/onboarding_screen.dart`: Adım 1'de `ExamTargetPickerView`, Adım 2'de seçilen sınav ailesinin derslerinden dinamik Odak Ders seçimi (`Tarih` sabit değil!), Adım 3'te dinamik günlük tempo/hedef sunsun.
3. `lib/features/pomodoro/presentation/pomodoro_studio_screen.dart`: Sabit 3 butonlu `SegmentedButton<KpssExamTarget>` yerine kompakt aktif sınav rozeti + `Değiştir` modal tetikleyicisi koy (dar ekranda sıfır overflow!).
4. `lib/features/planner/presentation/widgets/auto_study_program_modal.dart`: Seçili `ExamSelection` bilgisini `ExamTargetPickerView` ile düzenlenebilir hale getir.

ADIM 3: Çoklu Cihaz Senkronizasyonu (`UserPreferencesNotifier` & `CloudSyncRepository`)
1. `UserPreferencesState` içine `final ExamSelection examSelection;` ekle (`targetExamKey` geriye dönük uyumlu setter/getter olarak senkron kalsın).
2. `CloudSyncRepository.syncUserPreferences` ve `fetchUserPreferences`: `profiles.exam_selection` (`jsonb`) ve `auth.user_metadata` senkronunu `TASK-119` koruma kurallarını (boş `{}` varsayılanını onboarding tamamlandı sanmama + sıralı hidrasyon) ihlal etmeden entegre et.

ADIM 4: Test & Doğrulama (`test/exam_target_picker_test.dart`, `test/auth_first_onboarding_and_sync_test.dart`)
1. 2 kademeli akışı (`MEB-AGS -> Aranabilir Özel Eğitim`, `E-KPSS -> İşitme-1`), `OnboardingScreen` dinamik odak dersini ve bulut JSON hidrasyonunu test et.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-132: Kapsam Duyarlı Çalışma Planlayıcısı, Çoklu Sınav İstatistik İzolasyonu & Strateji Desenli `ScoreFormulaEngine` Çekirdeği

- **Durum:** ✅ **Tamamlandı** *(Dalga 1 — Planlayıcı, Analitik & Puan Çekirdeği · `402/402` test ile doğrulandı)*
- **Amaç:** Kullanıcı sınav türünü değiştirdiğinde günlük çalışma planının, istatistik ısı haritasının ve puan hesaplama ekranının yeni sınava akıllıca uyum sağlamasını, eski emeğinin kaybolmamasını ve kod tekrarının önlenmesini sağlamak.

```text
GÖREV: TASK-132 — Dinamik AutoStudyProgramGenerator, Kapsam İzole İstatistikler & Strategy Pattern ScoreFormulaEngine
ÖNEMLİ: GEMINI.md ve TASK-115..117 (PlannerSyncSnapshot kayıpsız senkron) kurallarına uy.

ADIM 1: Dinamik Plan Üretimi & Kayıpsız Kapsam Adaptasyonu
1. `lib/features/planner/data/models/study_task.dart` ve `planner_sync_snapshot.dart`: Görevlere ve snapshot'a opsiyonel `String examScope` alanı ekle (`default: 'lisans_gk'`, geriye dönük JSON uyumuyla).
2. `lib/features/planner/data/services/auto_study_program_generator.dart`:
   - Sabit `_lessonRotation` yerine `ExamCurriculum` içindeki `activeLessons` listesini kullanan dinamik soru-ağırlıklı rotasyon (ağırlığı yüksek derse orantılı daha sık görev) kur.
   - Deneme görevlerinin soru ve dakika değerlerini `curriculum.totalQuestions` / `standardDurationMinutes` üzerinden üret.
3. `lib/features/planner/data/study_planner_notifier.dart`: `adaptCurriculumScope(ExamSelection newSelection, ExamCurriculum newCurriculum)` metodunu ekle — geçmiş günlerde tamamlanan görevleri ve `maxUnlockedDay` seviyesini koruyarak bugünün çözülmemiş görevlerini yeni sınavın müfredatına uyarlasın.

ADIM 2: Çoklu Sınav İstatistik İzolasyonu (`lib/features/stats/`)
1. `lib/features/stats/data/models/quiz_session_record.dart`: Opsiyonel `examScope` alanı ekle (eski oturumlar `'lisans_gk'` varsayılsın).
2. `lib/features/stats/data/study_stats_notifier.dart`: Aktif `examScope` bazlı filtrelenmiş `solvedByLessonForScope(String scopeKey, List<String> curriculumLessons)` ve `weakestLessonForScope(...)` seçicileri sun (`cloud_sync_repository.dart` içinde `user_topic_mastery` upsert ve fetch sorgularına `exam_scope` kolonunu dahil et).
3. `lib/features/stats/presentation/stats_screen.dart`: İstatistiklerde `"Aktif Sınav / Tüm Çalışmalar"` kompakt kapsam çipi sun; `_MasteryHeatmapCard` ve `_LessonAccuracyChartCard` yalnızca ilgili kapsamdaki derslerle kalabalıksız çizilsin; `get_weekly_leaderboard` çağrısını sınav ailesi filtresini destekleyecek şekilde hazırla.

ADIM 3: Strateji Desenli Puan Hesaplayıcı Çekirdeği (`lib/features/score_calculator/`)
1. `lib/features/score_calculator/data/kpss_score_calculator.dart`: Monolitik switch'ler yerine ortak soyut arayüz `abstract interface class ScoreFormulaEngine` ve kayıt defteri (`ScoreEngineRegistry`) tasarla:
   - Ortak `SectionInputSpec` (`key`, `label`, `maxQuestions`, `weightHint`)
   - Ortak `ScoreOutputRow` (`scoreTypeCode`, `title`, `score`, `isQualified`, `qualificationNote`, `historicalYearScores`)
   - `>= 1.0 ham net` baraj kuralı, `Net = Doğru - Yanlış / 4.0` ve sınır kırpma tek paylaşılan yardımcıdan çalışsın.
2. `lib/features/score_calculator/presentation/kpss_score_calculator_screen.dart`: Statik 2 kart (`GY` + `GK`) yerine aktif stratejinin ürettiği `List<SectionInputSpec>` kadar dinamik net giriş kartı ve `List<ScoreOutputRow>` kadar çıktı/yıl karşılaştırma satırı göstersin. Mevcut `P3 / P93 / P94` widget testleri (`score_type_dropdown`, `'0.00'` başlangıç, `+1` net artışı) %100 korunmalıdır!

ADIM 4: Test & Doğrulama (`test/multi_exam_planner_and_stats_test.dart`, `test/kpss_score_calculator_test.dart`)
1. `adaptCurriculumScope` ile gün/görev kaybı olmadığını, `user_topic_mastery` kapsam izolasyonunu ve jenerik `ScoreFormulaEngine` kontratını test et.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-133 [Faz A — Altyapı]: Ortak GY-GK Genişlemesi (Lisans / Ön Lisans / Ortaöğretim: Türkçe & Matematik Müfredatı, `120S/130dk` Deneme & `P1 / P2 / P3`)

- **Durum:** ✅ **Tamamlandı** *(Dalga 2 — Faz A Altyapı · Soru Verisi Hariç · `402/402` test ile doğrulandı)*
- **Amaç:** B Grubu adayları (Lisans, Ön Lisans, Ortaöğretim) için Türkçe (30 soru) ve Matematik & Geometri (30 soru) müfredat kilitlerinin mimari olarak açılabilir hale getirilmesi, 120 soruluk tam deneme şablonu ve `P1 / P2 / P3` eş zamanlı puan hesaplayıcısının eklenmesi *(sorular Faz F'de eklenecektir)*.

```text
GÖREV: TASK-133 — Faz A Altyapı: B Grubu Tam GY-GK Müfredatı (Türkçe + Matematik), 120S/130dk Deneme Blueprint ve P1/P2/P3 Motoru
ÖNEMLİ: ŞİMDİLİK SORU VERİSİ ÜRETME! Türkçe/Matematik havuzunda henüz soru yoksa UI bunu zarifçe yönetmelidir ("Soru paketi hazırlanıyor" durumu, çökme YOK).

ADIM 1: B Grubu GY-GK Müfredat Ağaçları (`CurriculumRegistry`)
1. `CurriculumRegistry` içinde `lisans`, `onlisans`, `ortaogretim` için hem `BGroupProfile.onlyGk` (60 soru / 4 ders) hem `BGroupProfile.fullGyGk` (120 soru / 6 ders: Türkçe 30, Matematik & Geometri 30, Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel Bilgiler 6) tanımlarını tam ÖSYM konu başlıklarıyla (`kpss_sinav_turleri_ve_konu_kapsami.md` Bölüm 2) ekle:
   - **Türkçe (30 Soru):** Sözcükte Anlam, Cümlede Anlam, Paragraf, Ses/Yazım/Noktalama, Yapı/Ekler/Sözcük Türleri, Cümlenin Ögeleri/Türleri/Çatı, Anlatım Bozuklukları, Sözel Mantık.
   - **Matematik & Geometri (30 Soru):** Temel Kavramlar & Sayı Basamakları, Bölme-Bölünebilme/EBOB-EKOK, Rasyonel/Üslü/Köklü Sayılar, Mutlak Değer/Eşitsizlikler/Çarpanlara Ayırma, Oran-Orantı & Problemler (Sayı-Kesir, Yaş, İşçi-Havuz, Hareket, Yüzde-Kâr-Zarar-Karışım), Kümeler/Fonksiyonlar/İşlem/Modüler Aritmetik, Permütasyon-Kombinasyon-Olasılık, Sayısal Mantık, Doğruda-Üçgende Açılar & Özel Üçgenler, Çokgenler-Dörtgenler & Çember-Daire, Katı Cisimler & Analitik Geometri.
2. `LessonsScreen` ve `LessonTopicsScreen` içinde derslerin gerçek havuz durumunu kontrol eden `CurriculumAvailability` köprüsünü ekle: havuzda `>0` soru varsa otomatik aktif, `0` soru varsa düzenli konu ağacı önizlemesi + `"Soru Havuzu Yakında"` kilidi göster.

ADIM 2: `120 Soru / 130 dk` Tam KPSS Deneme Şablonu (`ExamBlueprintRegistry`)
1. B Grubu `fullGyGk` seçildiğinde `ExamBlueprintRegistry` üzerinden `120 Soru / 130 dk` (`30 TR + 30 MAT + 27 TAR + 18 COĞ + 9 VAT + 6 GÜN`) ve `60 Soru / 65 dk` (Sadece GK) şablonlarını döndür.
2. Deneme başlatılmadan önce soru havuzu yeterliliğini kontrol et; eksik bölüm varsa kullanıcıya net uyarı ver (sessizce 3 soruya düşme!).

ADIM 3: `P1 / P2 / P3` Eş Zamanlı Puan Stratejisi (`BGroupScoreEngine`)
1. `KpssScoreCalculator` (`ScoreFormulaEngine`) içinde Lisans seçiliyken `P1 (%70 GY + %30 GK)`, `P2 (%60 GY + %40 GK)` ve `P3 (%50 GY + %50 GK)` puanlarını tek net girişinden eş zamanlı çıktı satırları olarak üret (`P93` Ön Lisans ve `P94` Ortaöğretim ile son 3 yıl karşılaştırması korunarak).

ADIM 4: Test & Doğrulama
1. `P1/P2/P3` formül doğrulama testleri, `120 Soru` blueprint testleri ve sıfır sorulu Türkçe/Matematik önizleme widget testlerini ekle.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-134 [Faz B — Altyapı]: E-KPSS Entegrasyonu (3 Öğrenim Düzeyi, 4 Engel Grubu, Erişilebilirlik Modu, Ek Süre & `EKPSSP1 / P2 / P3`)

- **Durum:** ✅ **Tamamlandı** *(Dalga 2 — Faz B Altyapı · Soru Verisi Hariç · `402/402` test ile doğrulandı)*
- **Amaç:** Engelli Kamu Personeli Seçme Sınavı adaylarına özel müfredat kapsamı, erişilebilirlik/ek süre deneme motoru ve `EKPSSP1/P2/P3` puan hesaplama altyapısının kurulması.

```text
GÖREV: TASK-134 — Faz B Altyapı: E-KPSS Müfredatı, 4 Engel Grubu Erişilebilirlik Modu, Ek Süre & EKPSSP1/P2/P3 Motoru
ÖNEMLİ: ŞİMDİLİK SORU VERİSİ ÜRETME! Erişilebilirlik ayarları Theme.of(context) standartlarını bozmamalı ve overflow yaratmamalıdır.

ADIM 1: E-KPSS Müfredat & Engel Grubu Kuralları (`CurriculumRegistry` & `ExamBlueprintRegistry`)
1. `KpssExamFamily.ekpss` için 3 öğrenim düzeyi (`Ortaöğretim -> EKPSSP1`, `Ön Lisans -> EKPSSP2`, `Lisans -> EKPSSP3`) kapsamında `60 Soru` (15 Türkçe, 15 Matematik = 30 GY; 10 Atatürk İlkeleri & İnkılap + 3 Türk Kültür ve Medeniyetleri, 5 Türkiye Coğrafyası, 6 Temel Yurttaşlık, 6 Güncel & Engelli Hakları Mevzuatı = 30 GK) ders/konu dağılımını tanımla.
2. 4 Engel Grubu (`Genel`, `Görme`, `İşitme-1`, `Zihinsel`) kurallarını modelle:
   - Standart süre: `60 Dakika`.
   - Engel/okuyucu-işaretleyici durumuna göre opsiyonel ek süre ön ayarları (`+20 dk = 80 dk`, `+30 dk = 90 dk`, `+40 dk = 100 dk`).
   - `İşitme-1` / `Zihinsel` seçildiğinde soru sorgularında `source_variant = 'simplified'` tercih önceliği (yoksa standarda düşen güvenli fallback!).

ADIM 2: Erişilebilir Okuma & Deneme Deneyimi (`QuizScreen` & `UserPreferencesState`)
1. `UserPreferencesState` içine `bool highReadabilityMode` (büyük punto `MediaQuery.textScaler` güvenli artırımı + netleştirilmiş yüksek kontrast kenarlık) tercihi ekle; `Görme` veya E-KPSS seçildiğinde kullanıcıya tek tıkla açılabilir öneri olarak sun.
2. `QuizScreen` üzerinde büyük punto modunun `OptionTile`, soru metni ve açıklama kartlarında taşma (`RenderFlex overflow`) üretmediğini `360x640` dar ekranda garanti et.

ADIM 3: `EKPSSP1 / EKPSSP2 / EKPSSP3` Puan Hesaplama Stratejisi
1. `ScoreEngineRegistry` içine 30 GY + 30 GK (`40` taban puan temelli ve ham net ≥ 1 kurallı) `EkpssScoreEngine` ekle.

ADIM 4: Test & Doğrulama
1. E-KPSS 30+30 blueprint dağılımı, ek süre zamanlayıcı testi, büyük punto `360x640` overflow testi ve `EKPSSP1/P2/P3` hesaplama birim testlerini yaz.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-135 [Faz C — Altyapı]: KPSS DHBT Entegrasyonu (DHBT-1 + DHBT-2 Çift Kademeli Müfredat, 3 Öğrenim Düzeyi & `P122 / P123 / P124`)

- **Durum:** ✅ **Tamamlandı** *(Dalga 2 — Faz C Altyapı · Soru Verisi Hariç · `402/402` test ile doğrulandı)*
- **Amaç:** Menüde halihazırda mevcut olan `dhbt` hedefinin alt düzey seçimini (`İHL / İlahiyat Ön Lisans / Lisans`), DHBT-1 + DHBT-2 çift bölümlü konu ağacını ve karma `P122/P123/P124` puan motorunu tamamlamak *(mevcut `KpssScoreCalculator.fromExamTarget(dhbt) -> p3Lisans` hatasını düzelterek!)*.

```text
GÖREV: TASK-135 — Faz C Altyapı: KPSS DHBT Çift Kademeli Müfredat (DHBT-1 & DHBT-2), 3 Öğrenim Düzeyi & P122/P123/P124 Motoru
ÖNEMLİ: ŞİMDİLİK SORU VERİSİ ÜRETME! Eski kodda dhbt hedefinin P3'e yönlendirildiği bug giderilmelidir.

ADIM 1: DHBT Müfredat Ağacı (`CurriculumRegistry`)
1. `KpssExamFamily.dhbt` seçildiğinde öğrenim düzeyine göre (`Ortaöğretim İHL`, `Ön Lisans`, `Lisans`) ders ve konu ağaçlarını oluştur:
   - **Ortak B Grubu Temeli (opsiyonel sekme / GY-GK bağlantısı):** Aday P122/P123/P124 için GK+GY de çözebileceğinden GY-GK dersleri yardımcı/temel grup olarak erişilebilir olsun.
   - **DHBT-1 (20 Soru — Tüm Düzeyler Ortak):** İslam İnanç Esasları, İslam İbadet Esasları, Kur'an Bilgisi (Kur'an Tarihi, Tecvid, Kıraat), Siyer (Hz. Peygamber'in Hayatı), İslam Ahlakı.
   - **DHBT-2 (20 Soru — Düzeye Göre Derinlik Filtreli 7 Alan):** Tefsir, Hadis, Fıkıh, Akaid ve Kelam, İslam Tarihi, Dinler ve Mezhepler Tarihi, Hitabet ve Mesleki Uygulama (+ DİB Mevzuatı).

ADIM 2: DHBT Deneme Şablonları (`ExamBlueprintRegistry`)
1. `DHBT Alan Denemesi (40 Soru / 60 Dk: 20 DHBT-1 + 20 DHBT-2)` şablonunu ve öğrenim düzeyine göre `education_level` filtrelemesini tanımla.

ADIM 3: `P122 / P123 / P124` Puan Hesaplayıcı Stratejisi (`DhbtScoreEngine`)
1. `ScoreEngineRegistry` içine 4 girişli (`GY 60`, `GK 60`, `DHBT-1 20`, `DHBT-2 20`) `DhbtScoreEngine` ekle; `Ortaöğretim -> KPSSP122`, `Ön Lisans -> KPSSP123`, `Lisans -> KPSSP124` ağırlıklı puan hesaplamasını ve her testte geçerli net doğrulamasını uygula.
2. `fromExamTarget(KpssExamTarget.dhbt)` yönlendirmesini `P3` yerine `DHBT` stratejisine bağla!

ADIM 4: Test & Doğrulama
1. DHBT 3 öğrenim düzeyi kapsam filtresi, 20+20 deneme şablonu ve `P122/P123/P124` hesaplama testlerini yaz.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-136 [Faz D — Altyapı]: MEB-AGS + 17 Branş ÖABT Entegrasyonu (Öğretmenlik 1. Oturum `80 Soru`, Aranabilir 17 Branş + YDS/P3 Seçicisi & `AGS-P1/P2/P3`)

- **Durum:** ✅ **Tamamlandı** *(Dalga 2 — Faz D Altyapı · Soru Verisi Hariç · `402/402` test ile doğrulandı)*
- **Amaç:** Klasik KPSS Eğitim Bilimleri yerine gelen **MEB-AGS** sistemini (1. Oturum 80 soru + 17 branşlı ÖABT + Yabancı Dil `YDS/P3`) tüm konu taksonomisi, branş seçicisi, süre kuralları ve puan formülleriyle mimari olarak desteklemek.

```text
GÖREV: TASK-136 — Faz D Altyapı: MEB-AGS (80 Soru / 110 dk) + 17 Branş ÖABT (50 Soru · 70/90 dk) & AGS-P1/P2/P3 Puan Motoru
ÖNEMLİ: ŞİMDİLİK SORU VERİSİ ÜRETME! Resmî 2025-2026 kılavuzundaki 17 ÖABT branşı (İngilizce/yabancı diller ÖABT'de değil YDS/AGS-P3'te) kuralına birebir uy.

ADIM 1: MEB-AGS 1. Oturum Müfredatı (`CurriculumRegistry`)
1. **AGS Ortak Oturum (80 Soru / 110 dk)** ders ve konu ağaçlarını tanımla:
   - Sözel Yetenek (15 soru), Sayısal Yetenek (15 soru), Tarih (10 soru), Türkiye Coğrafyası (8 soru), **Eğitim Bilimleri ve Türk Millî Eğitim Sistemi** (24 soru — 2024 **TYMM** dahil eğitim temelleri, öğrenme-öğretme, ölçme-değerlendirme, program/rehberlik), **Mevzuat** (8 soru — T.C. Anayasası, 1739 Sayılı Millî Eğitim Temel Kanunu, 222 Sayılı İlköğretim Kanunu, 7528 Sayılı Öğretmenlik Meslek Kanunu).
2. İlerideki arşiv veya çalışma modları için klasik Eğitim Bilimleri alt konularını (`Gelişim, Öğrenme, Öğretim İlke ve Yöntemleri, Ölçme ve Değerlendirme, Program Geliştirme, Rehberlik, Sınıf Yönetimi, Öğretim Teknolojileri`) AGS Eğitim Bilimleri modülü altında etiketli tut.

ADIM 2: 17 ÖABT Branşı Tam Konu Ağacı & Aranabilir Branş Seçici UI
1. 17 branşın tamamı için kanonik `ÖABT <Branş>` ders ve konu ağaçlarını tanımla (`kpss_sinav_turleri_ve_konu_kapsami.md` Bölüm 5.B referansıyla):
   - 90 dakikalık 5 branş: İlköğretim Matematik, Fen Bilimleri, Matematik (Lise), Fizik, Kimya / Kimya Teknolojisi.
   - 70 dakikalık 12 branş: Türkçe, Sosyal Bilgiler, Türk Dili ve Edebiyatı, Tarih, Coğrafya, Biyoloji, DKAB / İHL Meslek Dersleri, Rehberlik (PDR), Sınıf Öğretmenliği (`30 Alan + 20 Alan Eğitimi`), Okul Öncesi (`30+20`), Beden Eğitimi, Özel Eğitim (`30+20`).
   - Yabancı Dil (İngilizce, Almanca, Arapça, Fransızca vb.) seçen kullanıcıya ÖSYM kuralı uyarınca ÖABT yerine **AGS + YDS/e-YDS (`MEB-AGS-P3`)** rotası sunan bilgilendirme kartı.
2. `ExamTargetPickerView` içine `OabtBranch` aramalı hızlı seçici alt çekmecesi ekle (17 branşı kaydırma yorgunluğu olmadan anlık filtrele).

ADIM 3: MEB-AGS Deneme Şablonları & `AGS-P1 / P2 / P3` Puan Motoru
1. `ExamBlueprintRegistry`: `MEB-AGS 1. Oturum (80 Soru / 110 dk)` ve seçili branşa göre dinamik süreli `ÖABT Alan Denemesi (50 Soru · 70 veya 90 dk)` şablonları oluştur.
2. `MebAgsScoreEngine`:
   - `MEB-AGS-P1`: %100 AGS (80 soru)
   - `MEB-AGS-P2`: %50 AGS + %50 ÖABT (50 soru; DKAB/İHL için `P2-16` ve `P2-17` iki ayrı çıktı satırı!)
   - `MEB-AGS-P3`: %50 AGS + %50 YDS (0–100 YDS puan girişiyle!).

ADIM 4: Test & Doğrulama
1. 17 branş konu ağacı doğrulaması, 90/70 dk süre kuralı testi, DKAB `P2-16`/`P2-17` & YDS `AGS-P3` puan hesaplama birim testleri ve aranabilir branş seçici widget testini yaz.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-137 [Faz E — Altyapı]: KPSS A Grubu (Kariyer Meslekler) Entegrasyonu (9 Alan Testi Konu Ağacı, Çoklu Alan Seçici `P48`, `P4–P48` Simülatörü & `≥1 Net` Kuralı)

- **Durum:** ✅ **Tamamlandı** *(Dalga 2 — Faz E Altyapı · Soru Verisi Hariç · `402/402` test ile doğrulandı)*
- **Amaç:** Kaymakamlık, Müfettişlik, Uzmanlık ve Sayıştay gibi kariyer kadrolarına hazırlanan **KPSS A Grubu** adayları için 9 alan testinin konu ağacını, seçmeli ders planlamasını ve **"≥1 ham net"** kuralını denetleyen puan simülatörünü kurmak.

```text
GÖREV: TASK-137 — Faz E Altyapı: KPSS A Grubu 9 Alan Testi, Çoklu Alan Paketi Seçici (P48), 40S Deneme Şablonları & P4–P48 Simülatörü
ÖNEMLİ: ŞİMDİLİK SORU VERİSİ ÜRETME! Çoklu ders seçimi olmadan A Grubu adayının planlayıcısına kullanmayacağı 9 alanın hepsi zorla doldurulmamalıdır.

ADIM 1: 9 Alan Testinin Tam Konu Ağacı (`CurriculumRegistry`)
1. Resmî 9 alan dersi için kanonik ders ve eksiksiz konu ağaçlarını ekle (`kpss_sinav_turleri_ve_konu_kapsami.md` Bölüm 3 referansıyla):
   - **Alan Hukuk (40S):** Anayasa Hukuku, İdare Hukuku & İdari Yargılama, Ceza Hukuku (Genel + CMK), Medeni Hukuk (Başlangıç/Kişiler/Aile/Miras/Eşya), Borçlar Hukuku, Ticaret Hukuku, İcra ve İflas Hukuku.
   - **Alan İktisat (40S):** İktisadi Doktrinler Tarihi, Mikro İktisat, Makro İktisat, Para-Banka-Kredi, Uluslararası İktisat, Büyüme-Kalkınma ve Türkiye Ekonomisi.
   - **Alan Maliye (40S):** Kamu Maliyesi & Kamu Ekonomisi, Kamu Harcamaları, Kamu Gelirleri & Vergi Hukuku, Devlet Borçları, Devlet Bütçesi, Maliye Politikası.
   - **Alan Muhasebe (40S):** Genel Muhasebe (Tekdüzen Hesap Planı/Dönemsonu), Mali Tablolar Analizi, İhtisas Muhasebesi (Şirketler & Maliyet Muhasebesi).
   - **Alan İşletme (40S)**, **Alan Kamu Yönetimi (40S)**, **Alan Uluslararası İlişkiler (40S)**, **Alan Çalışma Ekonomisi ve Endüstri İlişkileri / ÇEKO (40S)**, **Alan İstatistik (40S)** + ayrıca `Yabancı Dil (İngilizce - YDS)` puan girdisi bağlantısı.

ADIM 2: Çoklu Alan Paketi Seçimi (`ExamTargetPickerView` & `ExamSelection.selectedFieldLessons`)
1. Kullanıcıya hazır şablonlar (**`P48 Çekirdek: Hukuk + İktisat + Maliye + Muhasebe`**, **`Siyasal/Yönetim: Kamu Yön. + Uİ + Hukuk + İktisat`**, veya **`Özel Ders Seçimi`**) sun.
2. `CurriculumRegistry` ve `AutoStudyProgramGenerator` yalnızca adayın seçtiği alan derslerini (+ GY/GK temelini) aktif ders ve plan listesine dahil etsin.

ADIM 3: Alan Deneme Şablonları (`40S · 50-60 dk`) & `P4–P48` Puan Simülatörü (`AGroupScoreEngine`)
1. Her alan dersi için `40 Soru / 50–60 dk` `MockExamBlueprint` üret.
2. `AGroupScoreEngine`: GY (60), GK (60), isteğe bağlı Yabancı Dil puanı ve adayın girdiği 9 Alan Testi (her biri 40 soru) netlerinden öne çıkan ağırlıklı puan türlerini (`KPSSP4`, `KPSSP12`, `KPSSP13`, `KPSSP14`, `KPSSP19`, `KPSSP20`, `KPSSP21`, `KPSSP24`, `KPSSP29`, `KPSSP34`, `KPSSP35`, `KPSSP48`) hesapla.
3. ÖSYM **"İlgili puan türünde ağırlığı bulunan alan testlerinin her birinden en az 1.0 ham net çıkarma"** zorunlu şartını canlı kontrol et ve eksik test varsa çıktı kartında uyarı rozetiyle (`"Hesaplanmadı: Maliye < 1 Net"`) göster.

ADIM 4: Test & Doğrulama
1. A Grubu seçmeli ders filtreleme, P48 net + `≥1 ham net` kuralı geçme/kalma testleri ve 9 alan blueprint testlerini yaz.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📦 TASK-138: İnteraktif Atölyeler, Mini Oyunlar & Bilgi Kartlarının Çoklu Sınav Kapsamına Uyarlanması (`MapPractice`, `Games`, `Flashcards`)

- **Durum:** ✅ **Tamamlandı** *(Dalga 2 — Çapraz Modül Uyumu · Soru Verisi Hariç · `402/402` test ile doğrulandı)*
- **Amaç:** Harita Atölyesi, 60 Saniyede Pençe (D/Y), Kavram Eşleştirme ve Hap Bilgi Kartları modüllerinin yeni KPSS türlerinde boş/ilgisiz içerik göstermeden akıllıca çalışmasını sağlamak.

```text
GÖREV: TASK-138 — Harita Atölyesi, Mini Oyunlar & Hap Bilgi Kartlarının Aktif Sınav Kapsamına Uyarlanması
ÖNEMLİ: GEMINI.md ve MASTER.md kurallarına uy. Veri girişi olmadan boş kalan alanlarda uygulama kesinlikle çökmemeli veya hata atmamalıdır.

ADIM 1: Veri Modelleri ve Repository Kapsam Filtrelemesi
1. `Flashcard`, `TrueFalseItem`, `ConceptMatchSet` modellerine opsiyonel `List<String> examScopes` ve `String? subBranch` alanları ekle (`default: ['lisans_gk']` geriye dönük uyumla).
2. İlgili repository/sağlayıcıları aktif `ExamSelection` değerine göre filtreleyecek şekilde güncelle; eğer yeni bir sınav türünde (ör. DHBT veya ÖABT) henüz o modüle özel veri yoksa null/empty-crash yerine `"ortak Genel Kültür / Tarih-Coğrafya atölyesiyle pratik yap"` köprüsü sun.

ADIM 2: UI Köprüleri (`MapPracticeHubScreen`, `TrueFalseBlitzScreen`, `ConceptMatchScreen`, `FlashcardsScreen`)
1. `MapPracticeHubScreen`: Türkiye Coğrafya & Tarih Haritası Atölyesi'ni B Grubu, E-KPSS, MEB-AGS (Coğrafya/Tarih/Sosyal ÖABT) hedeflerinde birincil öneri; diğer hedeflerde "Genel Kültür / Destek Atölyesi" olarak sun.
2. `TrueFalseBlitzScreen` ve `ConceptMatchScreen`: Başlık altında aktif kapsam çipi göster ve boş havuzda şık `EmptyStateView` (ortak GK havuzuna geçme seçeneğiyle) göster.

ADIM 3: Test & Doğrulama
1. Boş yeni sınav havuzunda `FlashcardsScreen`, `TrueFalseBlitzScreen` ve `ConceptMatchScreen` ekranlarının sıfır istisna (`tester.takeException() == null`) ile açıldığını widget testiyle doğrula.
2. `dart format lib test`, `flutter analyze`, `flutter test` ile 0 hata doğrula.
```

---

### 📚 BÖLÜM 5 — EN SON FAZ: İÇERİK DOĞRULAMA PIPELINE'I & BULK VERİ GİRİŞİ (`TASK-139` – `TASK-144`)

> [!NOTE]
> **Kullanıcı Kararı Gereği Sıralama:** `TASK-126` – `TASK-138` mimari ve UI/UX görevleri tamamlanıp projede çoklu sınav esnekliği kanıtlanana kadar toplu soru üretimine **başlanmayacaktır**. Tüm içerik/soru veri girişi bu son fazda sırayla yürütülecektir.

### 📦 TASK-139 [Veri Girişi Ön Koşulu]: Çoklu Sınav İçerik Doğrulama & Seed Pipeline (`tools/validate_sql.py` + Şema & `distractor_trap` Linter)

- **Durum:** ⏳ **Bekliyor *(Veri Fazı Ön Koşulu)***

```text
GÖREV: TASK-139 — Çoklu Sınav Soru Üretim & Otomatik Kalite Doğrulama Pipeline'ı (tools/validate_sql.py & Şema Linter)
ADIM 1: `tools/` içindeki soru doğrulama ve ayrıştırma betiklerini güncelle:
1. `exam_scopes` değerlerinin `CurriculumRegistry` içindeki geçerli kanonik scope anahtarlarıyla eşleştiğini doğrula.
2. `sub_branch`, `education_level`, `disability_variant`, `source_variant` değerlerini beyaz listeyle (allowlist) kontrol et.
3. Her soru için boş olmayan `distractor_trap` (UWorld çeldirici tuzağı analizi), 5 geçerli şık (veya moduna uygun seçenek), temiz Unicode (`Question.cleanText` uyumu: LaTeX `$`, `**`, `->` yasak!) ve benzerlik/mükerrer kontrolü uygula.
4. Kapsam bazlı JSON parça dosyalarını (`assets/data/scopes/<scope>.json`) üreten export/build betiğini yaz.
```

### 📦 TASK-140 [EN SON FAZ — Veri Girişi · Faz A]: Ortak GY-GK (Türkçe, Matematik & Geometri + Ön Lisans/Ortaöğretim Seviye Varyantları) Soru & Kart Havuzu

- **Durum:** ⏳ **Bekliyor *(En Son Faz)***
- **Kapsam:**
  - Özgün KPSS Türkçe (30 soru dağılımı: anlam, paragraf, dil bilgisi, sözel mantık) ve Matematik & Geometri (30 soru dağılımı: sayılar, problemler, sayısal mantık, geometri) soru havuzlarının + ÖSYM çeldirici tuzaklarının üretimi.
  - Mevcut Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler havuzunun SQL UPDATE/seed ile Ön Lisans (`P93`) ve Ortaöğretim (`P94`) hedeflerine uyumlu `exam_scopes` ve seviye varyantlarıyla etiketlenmesi.
  - `CurriculumAvailability.ready` kilidinin GY modülleri için açılması.

### 📦 TASK-141 [EN SON FAZ — Veri Girişi · Faz B]: E-KPSS Özgün Soru, Sadeleştirilmiş (`İşitme-1` / `Zihinsel`) Metin Varyantları & Engelli Hakları Havuzu

- **Durum:** ⏳ **Bekliyor *(En Son Faz)***
- **Kapsam:**
  - Ortaöğretim (`EKPSSP1`), Ön Lisans (`EKPSSP2`), Lisans (`EKPSSP3`) için özgün 30 GY + 30 GK soruları (özellikle **Türk Kültür ve Medeniyetleri** ve **Engelli Hakları Mevzuatı**).
  - `İşitme-1` ve `Zihinsel` adayları için sadeleştirilmiş/yalın cümle yapılı `source_variant = 'simplified'` soru varyantları ve hap bilgi kartları.

### 📦 TASK-142 [EN SON FAZ — Veri Girişi · Faz C]: KPSS DHBT (DHBT-1 Ortak + DHBT-2 3 Öğrenim Düzeyi) Soru, Bilgi Kartı & Eşleştirme Havuzu

- **Durum:** ⏳ **Bekliyor *(En Son Faz)***
- **Kapsam:**
  - DHBT-1 (5 alan: İnanç, İbadet, Kur'an Bilgisi, Siyer, İslam Ahlakı) ortak soru bankası.
  - DHBT-2 (7 alan: Tefsir, Hadis, Fıkıh, Akaid/Kelam, İslam Tarihi, Dinler/Mezhepler, Hitabet/DİB Mevzuatı) için Ortaöğretim İHL / Ön Lisans / Lisans derinlikli özgün sorular (`distractor_trap` dahil), mezhep/kavram eşleştirme setleri ve hap bilgi kartları.

### 📦 TASK-143 [EN SON FAZ — Veri Girişi · Faz D]: MEB-AGS (Eğitim Bilimleri + TYMM + Mevzuat) & Öncelikli ÖABT Branşları Soru Havuzu

- **Durum:** ⏳ **Bekliyor *(En Son Faz)***
- **Kapsam:**
  - **Öncelik 1 (MEB-AGS 1. Oturum):** Sözel, Sayısal, Tarih, Türkiye Coğrafyası, **Eğitim Bilimleri & 2024 TYMM** ve **Mevzuat (Anayasa, 1739, 222, 7528)** soru bankası.
  - **Öncelik 2 (ÖABT Dalga 1 Branşları):** Aday yoğunluğu en yüksek branşlardan (Sınıf Öğretmenliği, Okul Öncesi, Özel Eğitim, Türkçe, İlköğretim Matematik, Sosyal Bilgiler, DKAB/İHL, PDR) başlayarak 50 soruluk alan paketleri; ardından kalan 9 ÖABT branşının tamamlanması.

### 📦 TASK-144 [EN SON FAZ — Veri Girişi · Faz E]: KPSS A Grubu (Önce Çekirdek `P48`: Hukuk, İktisat, Maliye, Muhasebe; Sonra 5 Alan) Özgün Soru Havuzu

- **Durum:** ⏳ **Bekliyor *(En Son Faz)***
- **Kapsam:**
  - **Dalga 1 (`P48` Çekirdek):** Güncel mevzuat uyumlu Hukuk (7 alt hukuk dalı), İktisat, Maliye ve Muhasebe özgün soru bankaları + 40 soruluk alan denemeleri (yargı/mevzuat çeldiricili `distractor_trap` analizleriyle).
  - **Dalga 2 (Tamamlayıcı 5 Alan):** İşletme, Kamu Yönetimi, Uluslararası İlişkiler, Çalışma Ekonomisi ve Endüstri İlişkileri (ÇEKO) ve İstatistik özgün soru havuzlarının üretilip `tools/validate_sql.py` ile doğrulanarak Supabase'e yüklenmesi.

---

### 🌐 BÖLÜM 6 — ÇOKLU PLATFORM WEB SaaS & ÖDÜL KALİTESİNDE MASAÜSTÜ UX MİMARİSİ (`TASK-145` – `TASK-152`)

> [!IMPORTANT]
> **Tasarım Tezi & Referans Benchmark:** Mevcut **`"Tuğrul Kobaltı & Anadolu Altını"`** (`MASTER.md`: `Outfit` + `DM Sans`, `#2140D4` / `#0E9F6E` / `#E28400`, `1.5px` keskin sınırlar, `3px` dokunsal alt dudak) kimliği korunur; **Awwwards Bento Dashboard**, **Duolingo Web Sidebar**, **Brilliant Etkileşimli Tuval**, **UWorld Split-Pane Test Stüdyosu** ve **Linear `Ctrl+K` Komut Paleti** standartlarıyla masaüstü web (`>= 1024px`) gerçek bir SaaS platformuna dönüştürülür. Mobil görünüm (`< 600px`) `%100` geriye dönük uyumlu kalır. *(Bu faz toplu veri üretimi olan `TASK-139`–`TASK-144`'ten bağımsız olarak yürütülebilir.)*

---

### 📦 TASK-145 [Web Faz 1 — Çekirdek & Güvenlik]: Web Wasm Uyumluluğu, `PurchaseService`/`AdService` Web Açığı Kapatma, URL Stratejisi & `web/index.html`

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 1 — Koşullu Platform Importları, Güvenlik Zırhı, Path URL & SEO/Splash · `412/412` Test + `flutter build web` Wasm Dry-Run Başarılı)*
- **Amaç:** Mevcut kod tabanında Web ortamında ücretsiz PRO verilmesine yol açan mock fallback açığını kapatmak, `dart:io` bağımlılıklarını WebAssembly (`--wasm`) uyumlu hale getirmek, `#` işaretini kaldıran temiz URL yapısına geçmek ve tarayıcı `localStorage` / public JSON asset sızıntılarını önlemek.

```text
GÖREV: TASK-145 — Web Wasm Koşullu Importlar, Ödeme/Reklam Güvenlik Zırhı, Path URL Stratejisi & SEO/Splash Yenilemesi
ÖNEMLİ: GEMINI.md kurallarına uy. Release Web ortamında PurchaseService ve AdService ASLA ücretsiz return true / bedava kota ödülü vermemelidir!

ADIM 1: Kritik Web Ödeme, Reklam & Güvenlik Korumaları
1. `lib/core/services/purchase_service.dart`:
   - `kIsWeb` ortamında RevenueCat native SDK çalışmadığı için mevcut `if (_mockMode || !_isConfigured) return true;` yolunu **yalnızca `enableMockMode()` açıkça çağrılan unit/widget testlerle** sınırla.
   - `enum PurchaseAvailability { mobileIap, webCheckout, testMock, unavailable }` ekle.
   - Canlı Web'de `webCheckoutUrl` / Supabase Web Billing tanımlı değilse `purchasePlan()` güvenli şekilde `false` dönsün (veya `PaywallScreen` webde "Web Aboneliği / iyzico Yakında — Mobil Uygulamadan Aktif Edilen PRO Hesaplar Otomatik Eşitlenir" durumunu göstersin; hiçbir şekilde sahte `upgradeToPro()` çalışmasın).
2. `lib/core/services/ad_service.dart`:
   - `rewardedAdUnitId` içindeki `Platform.isAndroid` / `Platform.isIOS` çağrısını `kIsWeb` kontrolüyle koru; Web'de `_mockMode` yoksa `isRewardedAdSupported` `false` dönsün ve `PaywallScreen` ödüllü reklam kartı Web'de gizlensin (bedava +20 soru açığı kapanır).
3. `lib/core/services/offline_download_service.dart` & `lib/features/quiz/data/question_repository.dart`:
   - `kIsWeb` ortamında `OfflineDownloadService` (tarayıcı ~5MB `localStorage` sınırını ve açık metin kopyalamayı önlemek için) UI ve servis katmanında devre dışı bırakılsın (`isOfflineDownloadsSupported => !kIsWeb`).
   - Web'de sorular Supabase oturumu aktifse doğrudan RLS korumalı Supabase sorgularından bellek içi LRU+TTL önbelleğe çekilsin; public static JSON fallback yalnızca konuk önizleme havuzu ile sınırlandırılsın.

ADIM 2: Wasm Koşullu Importlar (`dart:io` Temizliği) & Temiz URL Stratejisi
1. `lib/app/theme.dart`, `lib/core/config/supabase_config.dart`, `lib/core/services/ad_service.dart`, `lib/core/services/purchase_service.dart`, `lib/core/services/notification_service.dart`:
   - Doğrudan `import 'dart:io';` yerine Dart koşullu ortam yardımcı dosyası (`lib/core/utils/platform_env_stub.dart` + `platform_env_io.dart` -> `if (dart.library.io)`) kurarak `flutter build web --wasm` derlemesinin sorunsuz çalışmasını garanti et.
2. `lib/main.dart` & `pubspec.yaml` (`flutter_web_plugins`):
   - `main()` başında `usePathUrlStrategy()` çağırarak `/#/lessons` yerine temiz `/lessons`, `/exams`, `/stats`, `/calculator` URL'lerini etkinleştir.

ADIM 3: `web/index.html`, PWA Manifest & Hosting Yönlendirmesi
1. `web/index.html`:
   - `"A new Flutter project."` açıklamasını güncel Türkçe Kadro SEO/Open Graph meta etiketleriyle (`Kadro — Çoklu KPSS & MEB-AGS Hazırlık Platformu`) değiştir.
   - Erişilebilirlik (`ui-ux-pro-max`) kuralı gereği `user-scalable=no` kilidini kaldır (`width=device-width, initial-scale=1.0`).
   - Açılışta marka renkli (`#0F172A` / `#2140D4`) modern yükleme göstergesi (`#loading-indicator`) ekle; Flutter ilk frame'i çizdiğinde temiz kaldırılsın.
2. Hosting SPA Rewrite örneği (`docs/web_deployment.md` içine `index.html` rewrite + Wasm multi-thread COOP/COEP HTTP header konfigürasyonu) ekle.
```

### 📦 TASK-146 [Web Faz 2 — Masaüstü SaaS Kabuğu]: `AdaptiveWebShell`, Sabit `KadroSidebar`, Tablet `NavigationRail` & `Ctrl+K` Komut Paleti

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 2 — Masaüstü `KadroSidebar`, Ara `NavigationRail`, `DesktopTopUtilityBar` & `Ctrl+K` Komut Paleti · `412/412` Test)*
- **Amaç:** Uygulamanın büyük ekranda telefon klonu gibi görünmesini bitirip **Duolingo Web + Linear** seviyesinde sol kenar çubuklu, breadcrumb destekli ve `Ctrl+K` spotlight aramalı profesyonel bir çalışma kabuğu oluşturmak.

```text
GÖREV: TASK-146 — AdaptiveWebShell, KadroSidebar, Üst Çalışma Şeridi & KadroCommandPalette (Ctrl+K)
ÖNEMLİ: Mobil (< 600px) ekranda mevcut AppTopBar + AppNavigationBar yerleşimi %100 korunmalıdır! GEMINI.md ve MASTER.md kurallarına uy.

ADIM 1: Masaüstü Breakpoint & Yardımcı Araçları (`lib/core/utils/responsive_layout.dart`)
1. `enum ScreenLayoutTier { compactMobile, standardMobile, tablet, desktop, wideDesktop }`:
   - `< 380`: `compactMobile` (dolgu 12px)
   - `380–599`: `standardMobile` (dolgu 16px)
   - `600–1023`: `tablet` (`NavigationRail` + `maxWidth: 880`, dolgu 24px)
   - `1024–1439`: `desktop` (`256px` `KadroSidebar` + `maxWidth: 1240`, dolgu 28px)
   - `>= 1440`: `wideDesktop` (`256px` `KadroSidebar` + `maxWidth: 1320`, dolgu 32px)
2. `ResponsiveBreakpoints.tierOf(BuildContext)`, `isDesktopOrWider(BuildContext)` ve geniş sayfa konteynerleri için `ResponsiveContentWrapper(maxWidth: ..., expandOnDesktop: ...)` parametrelerini ekle.

ADIM 2: Adaptif Kabuk & Sabit Sol Menü (`lib/app/app_shell.dart` + `lib/app/widgets/kadro_sidebar.dart` + `desktop_top_utility_bar.dart`)
1. `lib/app/app_shell.dart` içinde ekran kırılımına göre kabuk seçimi kur:
   - `compactMobile / standardMobile` (`< 768px`): mevcut `Scaffold(appBar: AppTopBar, bottomNavigationBar: AppNavigationBar)`.
   - `tablet` (`768px–1023px`): Sol dar `NavigationRail` (76px, etiketli/ikonlu, üstte Tuğrul amblemi) + içerik.
   - `desktop / wideDesktop` (`>= 1024px`): Sol tarafta `KadroSidebar` (`256px`, sağında `1.5px` `outlineVariant` ayırıcı) + sağda `Column(DesktopTopUtilityBar, Expanded(child: content))`.
2. `KadroSidebar` içeriği:
   - **Üst Marka & Aktif Sınav Kapsülü:** Tuğrul amblemi + `"Kadro"` + seçili sınav hedefi (`selection.displayTitle` — tıklanınca `TargetExamSelectorBottomSheet` / `AdaptiveOverlay` açılır).
   - **Ana Gezinti (6 Sekme):** `Ana Sayfa`, `Dersler`, `Pratik`, `Denemeler`, `İstatistik`, `Profil` (`PhosphorIconsRegular` / seçili durumda `PhosphorIconsFill` + kobalt kapsül).
   - **Hızlı Araçlar Bölümü:** `Yanlış Defteri` (rozet sayacı), `Pomodoro Stüdyosu`, `Puan Hesapla`.
   - **Alt Durum Kartı:** Günlük hedef mini progress bar + PRO rozeti (`PRO'ya Geç` veya `Kadro PRO Aktif`).
3. `DesktopTopUtilityBar`:
   - Sol: Geçerli rota başlığı / breadcrumb.
   - Orta: Tıklanabilir **`Hızlı Ara & Git (Ctrl + K)`** arama kapsülü.
   - Sağ: Günlük çözülen/hedef kapsülü (`14 / 30`), Açık/Koyu tema hızlı geçiş ikonu, Tuğrul koçluk ipucu ikonu.

ADIM 3: Global Komut Paleti (`lib/shared/widgets/command_palette_dialog.dart`)
1. `CallbackShortcuts` ile kök kabukta `Ctrl+K` / `Cmd+K` tuşlarını dinle ve `KadroCommandPalette.show(context, ref)` aç.
2. Arama kaynakları:
   - Tüm ana/alt ekranlar (*Deneme Başlat*, *Puan Hesapla*, *Yanlış Defteri*, *Pomodoro*, *Harita Atölyesi*),
   - `activeCurriculumProvider` içindeki tüm aktif ders ve konular (seçilince doğrudan `LessonTopicsScreen`'e gider),
   - Sınav değiştirme kısayolları (*KPSS GY-GK*, *E-KPSS*, *DHBT*, *MEB-AGS*, *A Grubu*),
   - Hızlı tema değiştirme.
3. Tam klavye desteği (`Yukarı/Aşağı` ok ile seçim, `Enter` ile çalıştırma, `Esc` ile kapatma + sağda kısayol rozetleri).
```

### 📦 TASK-147 [Web Faz 2 — Masaüstü Mikro-Etkileşim & Overlay]: Hover-İmleç Fiziği (`TactileCard`), Erişilebilir Odak & `AdaptiveOverlay`

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 2 — `TactileCard` / `OptionTile` Hover-Odak Fiziği & `AdaptiveOverlay` Dönüşümü · `412/412` Test)*
- **Amaç:** Web kullanıcısının fare ile gezerken "cansız mobil ekrana bakıyorum" hissini ortadan kaldırmak: her tıklanabilir bileşende doğru imleç, zarif hover tepkisi, WCAG odak halkası, uzun sayfalarda kaydırma çubuğu ve büyük ekranlarda alt çekmece yerine dialog/yan panel göstermek.

```text
GÖREV: TASK-147 — TactileCard / OptionTile Web Hover Fiziği, Focus Halkası & AdaptiveOverlay (BottomSheet -> Dialog/SideDrawer)
ÖNEMLİ: UI'da blurRadius > 0 gölge ekleme (MASTER.md 3px keskin alt dudak kuralı geçerlidir!). Reduced motion tercihlerine saygı göster.

ADIM 1: `TactileCard` & `OptionTile` Web Hover + Focus Etkileşimi
1. `lib/shared/widgets/tactile_card.dart`:
   - `onTap != null` olduğunda widget'ı `MouseRegion(cursor: SystemMouseCursors.click)` ve `FocusableActionDetector` ile sarmala.
   - Hover durumunda (ekran kaydırmadan / layout boyutu değiştirmeden!): kenarlığı ve alt dudak rengini `colorScheme.primary.withAlpha(150)` tonuna yumuşak (`Duration(milliseconds: 120)`) yaklaştır ve arka plana hafif yüzey vurgusu ekle.
   - Klavye ile `Tab` odağı geldiğinde net `2px` yüksek kontrastlı (`colorScheme.primary`) odak halkası çiz.
2. `lib/features/quiz/presentation/widgets/option_tile.dart`:
   - Masaüstü tarayıcı için hover yüzey tonu, klavye kısayol ipucu rozeti (`[A]..[E]` masaüstünde görünür!) ve şık üstü çizme (`isEliminated` — tıklanabilir eleme ikonu + sağ tık menüsü alternatifi) ekle.
3. Uzun çalışma ekranlarında (ör. İstatistik, Dersler, Konular) masaüstünde görünür ince `Scrollbar` ve açıklamalar için kontrollü `SelectionArea` sarmalayıcısı ekle.

ADIM 2: Evrensel `AdaptiveOverlay` (`lib/shared/widgets/adaptive_overlay.dart`)
1. `AdaptiveOverlay.showModal<T>(BuildContext context, {required WidgetBuilder builder, String? title, double dialogMaxWidth = 640, bool preferSideDrawerOnDesktop = false})`:
   - `< 768px`: Standart `showModalBottomSheet` çalıştır (mevcut mobil davranış %100 korunur).
   - `>= 768px` ve `preferSideDrawerOnDesktop == false`: Ekran ortasında yuvarlatılmış, `1.5px` kenarlıklı, kapatma (`X` / `Esc`) butonlu şık `Dialog` aç.
   - `>= 768px` ve `preferSideDrawerOnDesktop == true`: Sağ kenardan kayan `420px` **Side Drawer** aç.
2. Mevcut tüm kritik çekmeceleri bu yardımcıya bağla:
   - `TargetExamSelectorBottomSheet.showSelection`,
   - `PracticeHubScreen._showLessonSelectorSheet` ve `_showMockExamSelectorSheet`,
   - `TugrulTipsSheet`, `ReportQuestionBottomSheet` ve `AutoStudyProgramModal`.
```

### 📦 TASK-148 [Web Faz 3 — Bento Dashboard]: 12 Sütunlu `HomeScreen` Bento Kokpiti, Çok Sütunlu Grid & Master-Detail `LessonTopicsScreen`

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 3 — Bento `HomeScreen`, Çok Sütunlu Gridler & Master-Detail `LessonTopicsScreen` · `412/412` Test)*
- **Amaç:** `HomeScreen`, `LessonsScreen`, `ExamsScreen` ve `PracticeHubScreen` ekranlarını masaüstünde 720px dar sütundan çıkarıp **Bento Grid** ve **Master-Detail** web workspace'ine dönüştürmek.

```text
GÖREV: TASK-148 — Bento Home Kokpiti, Çok Sütunlu Grid Ekranları & Master-Detail LessonTopicsScreen
ÖNEMLİ: Tüm widget bölünmeleri GEMINI.md'ye uygun StatelessWidget sınıflarıyla yapılmalı, mobil kırılımı bozmamalı ve 360x640 ile 1440x900 arası sıfır overflow vermelidir.

ADIM 1: Bento Kokpit `HomeScreen` (`lib/features/home/presentation/home_screen.dart` & alt widget'lar)
1. `>= 1024px` ekranlarda tek `ListView` yerine `maxWidth: 1240` içinde 2 ana kolon (`Row(crossAxisAlignment: start)` — Sol `Expanded(flex: 7)` + `SizedBox(width: 20)` + Sağ `Expanded(flex: 5)`):
   - **Sol Kolon (Ana Öğrenme Akışı):** Tuğrul Karşılama & Günlük Hedef Hero Bento Kartı -> `"Bugünün Çalışma Planı"` (`HomeDailyPlanCard` görev matrisi) -> (varsa) `_WeakLessonHomeBanner` Zayıf Konu Eylem Kartı.
   - **Sağ Kolon (Kontrol & Hızlı Başlat Bento Modülleri):** Sınav Geri Sayım & Canlı Pomodoro Mini Stüdyosu -> Seri & Lig İlerleme Kartı -> 2x2 Hızlı Antrenman Bento Butonları (*Karışık Soru*, *Yanlış Defteri*, *Puan Hesapla*, *Harita Atölyesi*).
2. Tablet (`768px–1023px`) ve Mobilde (`< 768px`) mevcut tek sütun akış korunur.

ADIM 2: Çok Sütunlu `LessonsScreen`, `ExamsScreen` & `PracticeHubScreen`
1. `lib/features/lessons/presentation/lessons_screen.dart`:
   - Üstte sınav ağırlık dağılımı özeti tam genişlik (`maxWidth: 1240`); altındaki ders kartlarını ekran genişliğine göre `LayoutBuilder` + eşit yükseklikli satırlarla **1 kolon (< 680px), 2 kolon (680–1150px), 3 kolon (> 1150px)** grid düzenine çevir.
2. `lib/features/exams/presentation/exams_screen.dart` & `practice_hub_screen.dart`:
   - `ExamsScreen`: Hero Deneme Kartı tam genişlik (masaüstünde solda sınav bilgisi + sağda hemen başlat aksiyonu yatay yerleşim), altındaki deneme şablonu kartları masaüstünde 2–3 sütunlu grid.
   - `PracticeHubScreen`: Antrenman türleri ve atölyeler masaüstünde **3 sütunlu modüler Bento grid** olarak sergilensin.

ADIM 3: Master-Detail `LessonTopicsScreen` (`lib/features/lessons/presentation/lesson_topics_screen.dart`)
1. `>= 960px` masaüstü genişlikte 2 panelli Master-Detail layout kur:
   - **Sol Panel (~%42):** Aktif dersin tüm konu kartları + arama/filtre + konu ustalık göstergesi (`selectedTopic` durumu tutularak tıklanan konu highlight edilir).
   - **Sağ Panel (~%58):** Seçili konunun test paketleri (`TopicTestsScreen` içeriği `isEmbedded: true` parametresiyle kendi Scaffold/AppBar'ı olmadan doğrudan sağ panelde render edilir!), ilerleme özeti ve tek tıkla **"Testi Başlat"** aksiyonu.
2. `< 960px` mobilde mevcut tıklayınca `TopicTestsScreen`'e push etme akışı aynen korunur.
```

### 📦 TASK-149 [Web Faz 3 — Split-Pane Sınav Stüdyosu]: UWorld / e-YDS Tarzı 2 Panelli `QuizScreen`, Klavye Kısayolları & 2 Kolonlu İstatistik/Karne

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 3 — Split-Pane `QuizScreen`, Klavye Kısayolları, Şık Eleme & 2 Kolonlu İstatistik/Karne · `412/412` Test)*
- **Amaç:** KPSS/MEB-AGS/A Grubu adayının masaüstü tarayıcıda **UWorld & ÖSYM e-Sınav** kalitesinde kesintisiz, klavye hızlı ve iki panelli soru/deneme çözmesini sağlamak.

```text
GÖREV: TASK-149 — Desktop Split-Pane QuizScreen, Tam Klavye Kısayolları (1-5/A-E/Enter/F/Shift+1..5/?) & 2 Kolonlu Karne/İstatistik
ÖNEMLİ: Mobil QuizScreen düzeni ve testleri (< 960px) eksiksiz korunmalıdır. E-KPSS Yüksek Okunabilirlik ve textScaleFactor Web'de de sorunsuz çalışmalıdır.

ADIM 1: Masaüstü Split-Pane `QuizScreen` Mimarisi (`lib/features/quiz/presentation/quiz_screen.dart`)
1. `>= 960px` ekranlarda tam ekran dikkat dağıtmayan sınav çalışma alanı (`Scaffold`):
   - **Sabit Üst Sınav Şeridi:** Çıkış / geri onayı, ders/deneme adı, dijital sayaç (`tabularFigures`), **"Bayrak Ekle (F)"** toggle, **"Punto (A+/A-)"**, **"Kısayollar (?)"** dialog butonu ve **"Sınavı Bitir"** CTA'sı.
   - **Ana Bölünmüş Tuval (`Row`):**
     - **Sol Çalışma Paneli (`Expanded(flex: 58)`):** İçerik `max-width: 720px` (yaklaşık `65–75` karakter okuma ölçüsü) ile ortalanır. Soru kökü, görsel kart (`TurkeyMap`, `ClimateChart`, `GeoDiagram`, `PopulationPyramid`), 5 `OptionTile` ve sol altta sabit önceki/onayla/sonraki aksiyon şeridi.
     - **Sağ Yardımcı Panel (`Expanded(flex: 42)`, `surfaceContainerLow` + sol `1.5px` border):**
       - *Öğrenme Modunda:* Cevap henüz onaylanmadıysa hafif konu bilgisi / çalışma ipucu & soru gezgini; cevap onaylandığı anda alt çekmece yerine burada anında açılan **"Doğru/Yanlış Sonucu + ⚠️ ÖSYM Çeldirici Tuzağı + Detaylı Çözüm Analizi"** kartı!
       - *Deneme Modunda:* Bölüm sekmeli (`GK / ÖABT / DHBT-1..2`) **canlı optik cevap kâğıdı** sürekli görünür (boş, işaretli ve bayraklı soru renk kodları + tek tık atlama).

ADIM 2: Klavye Odaklı Kontrol (`CallbackShortcuts` & Şık Eleme)
1. `QuizScreen` içine masaüstü/web `CallbackShortcuts` bağla (aktif text input yoksa):
   - `Digit1..5` / `KeyA..E`: İlgili şıkkı seç.
   - `Shift + Digit1..5` (veya şıktaki eleme ikonu): Şıkkı üstü çizili (`strikethrough`) olarak ele / geri al.
   - `Enter` / `ArrowRight` / `KeyN`: Seçiliyse cevabı onayla veya sonraki soruya geç.
   - `ArrowLeft` / `KeyP`: Önceki soruya dön.
   - `KeyF`: Soruyu işaretle (bayrakla).
   - `Slash` (`?`): Klavye kısayolları yardım penceresini aç.

ADIM 3: 2 Kolonlu Masaüstü `QuizResultScreen` & `StatsScreen`
1. `lib/features/quiz/presentation/quiz_result_screen.dart` & `lib/features/stats/presentation/stats_screen.dart`:
   - `>= 960px` ekranlarda **Sol Kolon:** Genel skor/net kartı + Tuğrul değerlendirmesi + telafi aksiyonu; **Sağ Kolon:** `fl_chart` ders bar/trend grafikleri + ders bazlı net tablosu (erişilebilir veri özeti & tooltip ile) + son deneme oturumları.
```

### 📦 TASK-150 [Web Faz 4 — Geniş Ekran Atölyeler]: Split Harita Atölyesi, Klavyeli Kartlar, Zen Masa Saati & Sticky Puan Hesaplayıcı

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 4 — Split Harita & Hover, Klavyeli `FlashcardsScreen`, Split `PomodoroStudioScreen` & Sticky `ScoreCalculator` · `412/412` Test)*
- **Amaç:** Harita Atölyesi, Bilgi Kartları, Pomodoro Stüdyosu ve Çoklu KPSS Puan Hesaplama ekranlarının geniş ekranda dikey kaydırma yükünü azaltıp yan yana masaüstü çalışma araçlarına dönüşmesi.

```text
GÖREV: TASK-150 — Geniş Ekran Harita Split-Pane, Klavyeli Flashcards, Zen Masa Saati Pomodoro & Sticky ScoreCalculator
ADIM 1: `MapPracticeHubScreen` & `MapChallengeScreen` (`lib/features/map_practice/presentation/`)
- `>= 960px` ekranda solda büyük interaktif `TurkeyMap` (fare hover il isim tooltip + vurgu), sağda soru metni, kombo/puan durumu, ipucu ve il listesi yan yana konumlandır.
ADIM 2: `FlashcardsScreen` (`lib/features/flashcards/presentation/flashcards_screen.dart`)
- Masaüstünde büyük ortalanmış kart + klavye kısayolları (`Space`: Kartı Çevir, `ArrowLeft` / `1`: Tekrar Et, `ArrowRight` / `2`: Biliyorum) + sağda ders filtresi ve deste ilerleme paneli.
ADIM 3: `PomodoroStudioScreen` (`lib/features/pomodoro/presentation/pomodoro_studio_screen.dart`)
- Masaüstünde solda büyük odak sayacı (`Flip Clock` / `Zen`), sağda seans süresi/ders seçici, hedef halkası ve sade arka planla dikkat dağıtmayan tam ekran **"Masa Saati Zen Modu"** düğmesi.
ADIM 4: `KpssScoreCalculatorScreen` (`lib/features/score_calculator/presentation/kpss_score_calculator_screen.dart`)
- `>= 960px` ekranda 2 kolonlu **Sticky Sonuç** düzeni:
  - **Sol Kolon (~%56):** Sınav türü seçici (B Grubu, E-KPSS, DHBT, MEB-AGS, A Grubu) + test doğruluk/yanlış sürgü kartları.
  - **Sağ Yapışkan Kolon (~%44):** Hesaplanan ana skor Hero kartı, tüm puan türleri matrisi (`KPSSP1-3`, `P122-124`, `AGS-P1/2/3`, `P4-P48`) ve geçmiş yıl simülasyon kıyaslaması her zaman ekranda görünür kalır.
```

### 📦 TASK-151 [Web Faz 4 — Giriş Vitrini & SEO Köprüsü]: Split `AuthScreen`, Misafir `/calculator` & `/curriculum-preview` Rotaları

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 4 — Split `AuthScreen`, Misafir `/calculator` & `/curriculum-preview` Rotaları · `412/412` Test)*
- **Amaç:** Web kullanıcısının ilk karşılaştığı giriş ekranını masaüstüne yakışan bir vitrine dönüştürmek ve ziyaretçilerin üye olmadan puan hesaplayıp müfredat keşfedebilmesini sağlamak.

```text
GÖREV: TASK-151 — Masaüstü Split AuthScreen, Public Misafir Rotaları (/calculator, /curriculum-preview) & SEO Landing Sözleşmesi
ADIM 1: 2 Kolonlu Masaüstü `AuthScreen` (`lib/features/auth/presentation/auth_screen.dart`)
- `>= 960px` ekranlarda solda Tuğrul Kobaltı & Anadolu Altını vitrin paneli (5 sınav ailesi özeti, ÖSYM Çeldirici Tuzağı örneği, çapraz cihaz bulut eşitleme vurgusu ve **"Hemen Puan Hesapla (Misafir)"** kısa yolu), sağda ortalanmış Google / E-posta giriş & kayıt formu.
ADIM 2: Misafir Erişimli Public Rotalar (`lib/app/router.dart` & `lib/app/app_shell.dart`)
- `/calculator` (`KpssScoreCalculatorScreen`) ve `/curriculum-preview` (aktif sınav & 17 ÖABT / 9 A Grubu konu ağacı gezgini) rotalarının oturum (`isAuthenticated`) olmadan açılabilmesini sağla; işlem sonrası alt şeritte **"Çalışma Planını ve Puanını Kaydetmek İçin Giriş Yap"** aksiyonu sun.
- Deep-link query desteği ekle: `/calculator?exam=meb_ags` veya `/curriculum-preview?scope=dhbt_lisans`.
ADIM 3: Opsiyonel SEO Vitrin Sözleşmesi (`docs/web_deployment.md`)
- Google SEO / organik arama trafiği için ana domainde (`kadro.com`) statik/SSR landing + puan/konu rehberi (Next.js / Astro) -> `app.kadro.com` Flutter Web SaaS köprü mimarisini ve Pay/OAuth origin kurallarını belgele.
```

### 📦 TASK-152 [Web Faz 5 — Ödeme Köprüsü, Wasm Build & Çoklu Breakpoint Testleri]: Web Billing (`iyzico` / `RevenueCat Web`), Wasm & Kalite Kapısı

- **Durum:** ✅ **Tamamlandı** *(Web SaaS Faz 5 — `06_web_subscriptions.sql`, `docs/web_deployment.md`, Wasm Dry-Run + `flutter build web` & `web_responsive_saas_test.dart` · `412/412` Test)*
- **Amaç:** Web'de gerçek ve güvenli PRO abonelik senkronunu tamamlamak, `flutter build web --wasm` derlemesini doğrulamak ve 4 farklı ekran kırılımında sıfır overflow + klavye + güvenlik garantisi almak.

```text
GÖREV: TASK-152 — Web PRO Ödeme Köprüsü (Supabase `subscriptions` + iyzico/RevenueCat Web), Wasm Derleme & 4-Breakpoint Test Paketi
ADIM 1: Çapraz Platform PRO Yetki Tablosu & Web Checkout (`docs/supabase_migrations/06_web_subscriptions.sql` & `purchase_service.dart`)
1. Supabase `public.subscriptions` tablosu ve RLS (`user_id = auth.uid()` okuma; yazma YALNIZCA `service_role` webhook / Edge Function) + `profiles.is_pro` senkron trigger'ını tasarla.
2. `PurchaseService`: Türkiye hedefinde **iyzico Checkout + Supabase Edge Function** (veya global Stripe + RevenueCat Web Billing) tetikleyicisi için platform soyutlamasını tamamla; işlem sonrası istemcide kör `upgradeToPro()` yerine sunucudan `subscriptions` / `profiles.is_pro` yeniden doğrulaması (`verifyProEntitlement()`) yap.

ADIM 2: Web Release & Wasm Doğrulaması
1. `flutter analyze`, `dart format lib test` sıfır hata kontrolü ve `flutter build web --wasm` (veya JS fallback ile) temiz derleme doğrulaması.

ADIM 3: Kapsamlı Multi-Breakpoint Web Widget & Güvenlik Testleri (`test/web_responsive_saas_test.dart`)
1. `Size(1440, 900)` (Masaüstü Web), `Size(1024, 768)` (Küçük Masaüstü), `Size(768, 1024)` (Tablet) ve `Size(360, 640)` (Kompakt Mobil) ekranlarında `AppShell`, `HomeScreen`, `LessonsScreen`, `ExamsScreen`, `QuizScreen`, `StatsScreen` ve `KpssScoreCalculatorScreen` için sıfır overflow doğrulaması.
2. `>= 1024px` ekranda `KadroSidebar` görünürken `AppNavigationBar`'ın gizlendiğini; `< 600px` ekranda ise `AppNavigationBar`'ın görünür olduğunu doğrula.
3. `QuizScreen` masaüstü Split-Pane testleri: `1-5`/`A-E` şık seçimi, `Shift+1` şık eleme, `Enter` ile onaylama/ilerleme ve `Ctrl+K` `KadroCommandPalette` açılıp arama yapması.
4. Güvenlik regresyon testi: Web modunda (`mock` açık değilken) `PurchaseService.purchasePlan` ve `AdService` asla ücretsiz `PRO` veya bedava soru kotası vermemelidir.
```

---

## 🎨 42. Dalga 42: UI Bileşen Eşlenikliği & Ortak Tasarım Bileşenleri (`TASK-153`)

Proje genelinde geliştirilen ekranların tasarım dili, kod yapısı ve dokunsal (`TactileCard` / `AdaptiveOverlay`) standartlarının tek merkezden yönetilmesi ve tekil/dağınık UI kodlarının ortak bileşenlere (`lib/shared/widgets/`) taşınması amacıyla oluşturulan görev paketidir:

### 📦 TASK-153: Ortak UI Bileşenleri (`KadroDropdown`, `KadroOptionPickerModal`, `KadroConfirmDialog`, `KadroBadge`, `PageHeader` & `AdaptiveOverlay` Eşitlemesi)

- **Durum:** ✅ **Tamamlandı (Adım 1–6 Tamamlandı · `KadroOptionPickerModal`, `KadroConfirmDialog`, `KadroBadge`, `KadroSettingsCard`, `KadroFilterChips`, `PageHeader` & `AdaptiveOverlay` Mobil Header)**
- **Amaç:** Tüm modalların, seçicilerin, onay diyaloglarının, rozetlerin, sayfa başlıklarının ve form alanlarının aynı kod yapısını paylaşmasını sağlayarak hem kod tekrarını önlemek hem de Telefon/Tablet genelinde tutarlı kullanıcı deneyimi garanti etmek.

```text
GÖREV: TASK-153 — Proje Geneli UI Bileşen Eşleniklik Denetimi & Ortak Widget Kütüphanesi Standardizasyonu
ÖNEMLİ: GEMINI.md ve design-system/kadro/MASTER.md kurallarına uy; `lib/shared/` altında `widgets/` dışında klasör açma, sabit Color(0xFF...) ve fontSize kullanma.

ADIM 1: Ortak `KadroDropdown<T>` Bileşeni (✅ TAMAMLANDI)
- `lib/shared/widgets/kadro_dropdown.dart`: Standart tam genişlik form/satır varyantı (`KadroDropdown`) ve kompakt kart başlığı hapı (`KadroDropdown.compact`) oluşturuldu; hover/odak kenarlığı, PhosphorIcons `caretDown`, `ValueKey` desteği ve tek tip açılır menü stili sağlandı.
- Entegre edilen yerler:
  1. `ReportQuestionBottomSheet` (`lib/features/reports/presentation/report_question_bottom_sheet.dart`): 6'lı `ChoiceChip` kalabalığı kaldırılıp hata sebebi seçimi `KadroDropdown<String>` ile değiştirildi.
  2. `KpssScoreCalculatorScreen` (`lib/features/score_calculator/presentation/kpss_score_calculator_screen.dart`): `_ScoreTypeSelector` içindeki ~85 satırlık özel `DropdownButton` sarımı `KadroDropdown<ScoreEngineMode>` çağrısına indirildi.
  3. `PomodoroStudioScreen` (`lib/features/pomodoro/presentation/pomodoro_studio_screen.dart`): Farklı menü mantığı kullanan `PopupMenuButton<String>` ders seçicisi `KadroDropdown<String>.compact` bileşenine taşındı.

ADIM 2: Ortak Radyo Kart Seçim Modalı (`KadroOptionPickerModal<T>`)
- Mevcut Farklılık: `ProfileScreen._showQuizModeDialog` artık `AdaptiveOverlay.showModal` + dokunsal `TactileCard` radyo kartları kullanırken; `ProfileScreen._showDailyGoalDialog` ve `_showThemeDialog` (`lib/features/profile/presentation/profile_screen.dart:82,120`) hâlâ düz metinli `SimpleDialog` + `SimpleDialogOption` kullanmaktadır.
- Hedef: `lib/shared/widgets/kadro_option_picker_modal.dart` ile tüm tekli tercih seçicilerini (`Günlük Hedef`, `Tema Tercihi`, `Soru Çözüm Modu`) dokunsal kart + radyo göstergeli ortak yapıya kavuştur.

ADIM 3: Ortak Onay / Uyarı Diyaloğu (`KadroConfirmDialog`)
- Mevcut Farklılık: Doğrudan `showDialog + AlertDialog` çağrıları `blueprint_exam_launcher.dart` (3 ayrı nokta), `lesson_topics_screen.dart`, `map_challenge_screen.dart`, `profile_screen.dart` ve `force_update_dialog.dart` içinde birbirinden farklı başlık/ikon/buton düzenleriyle tekrar edilmektedir.
- Hedef: `lib/shared/widgets/kadro_confirm_dialog.dart` (`show` / `confirm` metotları; `isDestructive` destekli, tutarlı ikon + başlık + buton yerleşimi) oluştur ve tüm dağınık `AlertDialog` çağrılarını bu bileşene taşı.

ADIM 4: `AdaptiveOverlay.showModal` Mobil Alt Çekmece Başlığı & Tutaç Standardı
- Mevcut Farklılık: Masaüstünde `_DesktopOverlayHeader` başlık ve kapatma (`X`) butonunu otomatik çizerken mobilde her çağırıcı (`report_question_bottom_sheet.dart:106-143`, `achievement_showcase.dart:30-37`, `profile_screen.dart:192-210`) `36x4` tutamaç çizgisini ve başlığı tek tek elle yazmaktadır.
- Hedef: `AdaptiveOverlay.showModal` içine opsiyonel tutamaç + mobil başlık şeridi desteği (`showMobileHeader`) ekle ve alt sayfalardaki el yapımı tutamaç/başlık kopyalarını temizle.

ADIM 5: Sayfa Başlığı (`PageHeader`) & Bilgi/Hata Kutusu Eşitlemesi
- Mevcut Farklılık: `admin_reports_screen.dart:101` ortak `PageHeader` (`lib/shared/widgets/page_header.dart`) kullanırken; `ProfileScreen` (`profile_screen.dart:279`) ve diğer ana sekmeler el yapımı `Column([Text, Text])` başlıkları ve serbest `Container(border: ...)` bilgi kartları kullanmaktadır (`report_question_bottom_sheet.dart:146`, `quiz_screen` / `quiz_result_screen` rozetleri).
- Hedef:
  1. `PageHeader` bileşenine ikonsuz/kompakt varyant desteği ekleyip `ProfileScreen` ve ana tab başlıklarını eşitle.
  2. Ortak `KadroBadge` (`lib/shared/widgets/kadro_badge.dart`) oluşturarak `PRO`, konu/ders etiketi ve mod rozeti gibi dağınık hap (`Container` + `borderRadius`) tanımlarını tek tasarımda birleştir.

ADIM 6: Form Alanları (`InputDecoration`), `ListTile` Kart Dolgusu & Filtre Şeridi Standardı
- Mevcut Farklılık: `report_question_bottom_sheet.dart`, `study_planner_screen.dart:643`, `command_palette_dialog.dart:379` ve `exam_target_picker_view.dart:595` içinde `TextField` kenarlıkları (`borderRadius: 8` / `12`) ve `TactileCard` içi `ListTile` dolguları yer yer elle geçersiz kılınmaktadır.
- Hedef: Tema `InputDecorationTheme` kurallarını tüm metin kutularında koru (`borderRadius` elle ezilmesin), `ListTile` grupları için `TactileCard` standart kompakt liste dolgusu (`EdgeInsets.symmetric(horizontal: 4, vertical: 2)`) veya `KadroSettingsCard` sarmalayıcısı kullan ve çoklu ders filtreleri için `KadroFilterChips` sözleşmesini netleştir.
```

---

## 🎯 43. Dalga 43: Branş Denemeleri Ekosistemi (`TASK-154`)

Adayların tam genel denemeler dışında tek bir derse odaklanarak gerçek sınav soru sayısı, süresi ve konu ağırlık dağılımıyla **Branş Denemeleri** çözebilmesi için planlanan görev paketidir:

### 📦 TASK-154: Her Ders İçin Sınav Formatında Branş Denemeleri (`BranchMockExamGenerator` & Ders Bazlı Net Karnesi)

- **Durum:** ✅ **Tamamlandı (`BranchMockExamGenerator`, `ExamsScreen` Branş Denemeleri, `LessonTopicsScreen` Hızlı Başlatma & `QuizResultScreen` Konu Bazlı Net Karnesi)**
- **Amaç:** Her ders için ÖSYM sınav formatına birebir uygun (ör. KPSS Lisans GK'da Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel Bilgiler 6 soru; diğer KPSS/MEB-AGS kapsamlarında aktif `ExamCurriculum` ders soru sayılarına göre dinamik) süreli ve net hesaplamalı branş denemeleri sunmak.

```text
GÖREV: TASK-154 — Her Ders İçin Sınav Formatında Branş Denemeleri
ÖNEMLİ: GEMINI.md kurallarına uy; çoklu sınav kapsamlarında (`ExamCurriculum`) sabit soru sayısı yazmak yerine ilgili dersin `questionCount` ve `topics` dağılımını temel al.

1. Branş Deneme Üretici Motoru (`BranchMockExamGenerator`):
   - Aktif `ExamSelection` / `ExamCurriculum` içindeki seçili ders için (`lesson.questionCount`) konu ağırlıklarına göre dengeli soru seti üret (ör. Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel 6).
   - Ders soru sayısına orantılı gerçekçi sınav süresi hesapla (örn. soru başı ~1.1 dk) ve `QuizMode.exam` kurallarıyla (4 yanlış 1 doğruyu götürür) çalıştır.
   - Çoklu deneme seti (Branş Denemesi 1, 2, 3...) destekleyerek aynı dersin farklı denemelerinde soru tekrarını en aza indir.

2. Arayüz & Başlatma Noktaları:
   - `ExamsScreen` içinde "Branş Denemeleri" bölümü ve `LessonTopicsScreen` üstünde "Bu Dersten Branş Denemesi Çöz" hızlı aksiyonu ekle.
   - Bitiş ekranında (`QuizResultScreen`) ders neti, konu bazlı doğru/yanlış kırılımı ve zayıf konu yönlendirmesi göster.

3. İstatistik & Planlayıcı Entegrasyonu:
   - Çözülen branş denemelerini `StudyStatsNotifier` oturum geçmişine kaydet ve `StudyPlannerNotifier` görevleriyle uyumlu hale getir.

4. Testler:
   - `BranchMockExamGenerator` ders soru sayısı/konu dağılımı birim testleri ve `ExamsScreen` / `QuizScreen` branş denemesi widget testlerini yaz.
```

---

## 🚪 44. Dalga 44: Misafir Öncelikli Açılış & Test Sonu Kayıt Uyarı Popup'ı (`TASK-155`)

Kullanıcıların siteye veya uygulamaya ilk girdiklerinde zorunlu giriş (`AuthScreen`) ekranına yönlendirilmeden doğrudan uygulamayı deneyimleyebilmesi ve yalnızca test bitiminde ilerleme kaydı konusunda bilgilendirilmesi için planlanan görev paketidir:

### 📦 TASK-155: Zorunlu Giriş Yönlendirmesinin Kaldırılması & Test Sonu Misafir Kayıt Uyarı Popup'ı

- **Durum:** ✅ **Tamamlandı**
- **Amaç:** Siteye/uygulamaya ilk kez giren kullanıcıyı kesinlikle giriş sayfasına (`AuthScreen`) zorla yönlendirmemek; misafir kullanıcının doğrudan ana sayfaya ve testlere erişmesini sağlamak, tamamladığı her testin sonunda ise açılan bir popup ile *"Giriş yapmazsanız ilerlemeniz kaydedilemez. Şimdi giriş yapmak istemezseniz dilediğiniz zaman Profil sekmesinden giriş yapabilirsiniz."* uyarısını göstermek.

```text
GÖREV: TASK-155 — Misafir Öncelikli Açılış (No Forced Auth Redirect) & Test Sonu İlerleme Kayıt Uyarı Popup'ı
ÖNEMLİ: GEMINI.md kurallarına uy; ortak diyalog/overlay yapısını (`AdaptiveOverlay` / `KadroConfirmDialog`) ve `Theme.of(context)` renk/tipografi sistemini kullan.

1. Zorunlu Giriş Yönlendirmesinin Kaldırılması (`lib/app/router.dart`):
   - Kullanıcı siteye veya uygulamaya ilk girdiğinde (`/` veya ana sekmeler) oturum açmamış olsa bile kesinlikle `/auth` (`AuthScreen`) sayfasına otomatik yönlendirme yapma.
   - Misafir kullanıcılar tüm ana sekmeleri (`Ana Sayfa`, `Dersler`, `Pratik`, `Denemeler`, `İstatistik`, `Profil`) ve soru çözüm ekranlarını doğrudan açabilsin.

2. Test Bitiminde Misafir Uyarı Popup'ı (`QuizResultScreen` / `QuizScreen`):
   - Kullanıcı misafir modda (`!authState.isAuthenticated` / `isGuest`) bir testi bitirdiğinde, sonuç ekranında (`QuizResultScreen` açılışında) otomatik olarak tek seferlik anlaşılır bir popup (`AdaptiveOverlay` / Dialog) göster:
     - Başlık: "İlerlemeniz Kaydedilmiyor"
     - Açıklama: "Giriş yapmazsanız çözdüğünüz testler ve istatistikleriniz kalıcı olarak kaydedilemez. Şimdi giriş yapmak istemiyorsanız daha sonra istediğiniz zaman Profil sekmesinden giriş yapabilirsiniz."
     - Aksiyonlar:
       1. Birincil Buton: "Giriş Yap / Kayıt Ol" (`/auth` ekranına yönlendirir).
       2. İkincil Buton: "Şimdilik Devam Et" (popup'ı kapatır, kullanıcı sonuç ekranını incelemeye devam eder).

3. Profil Sekmesi Giriş Alanı (`ProfileScreen`):
   - Misafir kullanıcılar için `ProfileScreen` üst kısmında net ve görünür bir "Giriş Yap / Hesap Oluştur (İlerlemeni Buluta Kaydet)" kartı/butonu bulunduğundan emin ol.

4. Testler:
   - İlk açılışta misafir kullanıcının `/auth` ekranına yönlendirilmeden doğrudan ana ekrana düştüğünü doğrulayan router testi yaz.
   - Misafir kullanıcı bir testi tamamladığında uyarı popup'ının açıldığını, "Profil sekmesinden giriş yapabilirsiniz" bilgisini içerdiğini ve giriş yapmış kullanıcıda bu popup'ın çıkmadığını doğrulayan widget testi ekle.
```

---

## 🔍 45. Dalga 45: Kapsamlı SEO Mimarisi, Semantik URL Yapısı & Arama Motoru Optimizasyonu (`TASK-156`)

Web sürümünün Google Arama sonuçlarında (SERP) organik trafik kazanması, ders/konu/araç bazlı aranabilir olması ve sosyal medya paylaşımlarında zengin önizleme sunması için sektör standardı teknik ve içerik SEO altyapısını kuran kapsamlı görev paketidir:

### 📦 TASK-156: SEO Uyumlu Slug URL Mimarisi, Dinamik Meta/JSON-LD, Sitemap & Pre-Render SEO Katmanı

- **Durum:** 🚫 **İptal Edildi (Web Sürümü Ayrı Projeye Alındı — Uygulama Yalnızca Telefon & Tablet İçin Geliştiriliyor)**
- **Amaç:** Uygulama içi tüm web rotalarını `kpss-tarih-soru-cozumu`, `kpss-puan-hesaplama` gibi anahtar kelime odaklı, semantik Türkçe slug URL'lere dönüştürmek; rota bazlı dinamik meta etiketleri, Schema.org JSON-LD yapısal verileri, otomatik `sitemap.xml` / `robots.txt` ve Flutter Web Canvas/Wasm için bot-dostu pre-render/static HTML köprüsü oluşturmak.

```text
GÖREV: TASK-156 — Sektör Standardı Kapsamlı Web SEO Altyapısı & Semantik URL Mimarisi
ÖNEMLİ: GEMINI.md kurallarına uy; mobil derlemeyi (`dart:io` / `web` koşullu import) bozma, eski kısa rotaları geriye dönük yönlendirme ile koru.

1. Semantik Slug Üreticisi & URL Mimarisi (`lib/core/utils/seo_slug_utils.dart` & `lib/app/router.dart`):
   - Türkçe karakter dönüşümü (`ğ->g, ü->u, ş->s, ı->i, ö->o, ç->c`, boşluklar `-`, küçük harf, çift tire temizliği) yapan `SeoSlugUtils.toSlug(String)` yardımcısını yaz.
   - Hash (`#/`) olmayan `PathUrlStrategy` üzerinde anahtar kelime odaklı temiz URL sözleşmesini kur:
     - Ders soru çözümü: `/kpss-tarih-soru-cozumu`, `/kpss-cografya-soru-cozumu`, `/kpss-vatandaslik-soru-cozumu`, `/kpss-guncel-bilgiler-soru-cozumu`
     - Konu bazlı sayfalar: `/kpss-tarih-soru-cozumu/:topicSlug` (ör. `/kpss-tarih-soru-cozumu/islamiyet-oncesi-turk-tarihi`)
     - Araç ve sınav sayfaları: `/kpss-puan-hesaplama`, `/kpss-deneme-sinavlari`, `/kpss-brans-denemeleri`, `/kpss-calisma-plani`, `/kpss-harita-calismasi`, `/meb-ags-oabt-mufredati`, `/ekpss-hazirlik`, `/kpss-dhbt-hazirlik`
   - Eski iç rotalar (`/lessons`, `/exams`, `/calculator`, `/curriculum-preview` vb.) için kalıcı yönlendirme (`redirect`) tanımlayarak kırık link (`404`) oluşmasını engelle.

2. Dinamik Sayfa Başlığı, Meta Etiketleri & Canonical (`lib/core/services/seo_metadata_service.dart`):
   - Koşullu import (`seo_metadata_service_web.dart` / `seo_metadata_service_stub.dart`) ile her rota değişiminde tarayıcı DOM'unu güncelleyen servisi yaz:
     - `document.title` (50–60 karakter sınırı; ör. `"KPSS Tarih Soru Çözümü ve Konu Testleri | <Marka>"`)
     - `<meta name="description" ...>` (140–155 karakter, her sayfa/ders/konu için benzersiz açıklama)
     - `<link rel="canonical" href="https://<domain>/<slug>">` (query param kopyalarını kanonik URL'ye bağla)
     - Open Graph (`og:title`, `og:description`, `og:url`, `og:type`, `og:image`, `og:locale="tr_TR"`) ve Twitter Card (`twitter:card="summary_large_image"`) etiketleri.

3. Schema.org Yapısal Veri (`JSON-LD` Rich Snippets):
   - Sayfa türüne göre `<script type="application/ld+json">` enjekte et:
     - Ana Sayfa: `WebSite` + `EducationalOrganization`
     - Ders & Konu Sayfaları: `Course` / `LearningResource` / `Quiz` + `BreadcrumbList` (`Ana Sayfa > Dersler > Tarih > Konu`)
     - Puan Hesaplama & Sınav Rehberi Sayfaları: `WebApplication` + `FAQPage` (Google'da SSS zengin sonuçları için).

4. Taranabilirlik (`robots.txt`, Otomatik `sitemap.xml`) & Pre-Render / Static SEO Köprüsü:
   - `web/robots.txt` oluştur: herkese açık ders/konu/araç sayfalarına izin ver (`Allow`), kullanıcıya özel ekranları (`/auth`, `/profile`, `/stats`, `/admin-reports`) engelle (`Disallow`).
   - `tool/generate_sitemap.dart` scripti ile `CurriculumRegistry` ve `kpssLessons` içindeki tüm ders, konu ve araç URL'lerinden otomatik `web/sitemap.xml` (`<loc>`, `<lastmod>`, `<changefreq>`, `<priority>`) üret.
   - **Flutter Web Canvas/Wasm Bot Çözümü:** Arama motoru ve sosyal medya botlarının (`Googlebot`, `Bingbot`, `WhatsApp`, `Twitterbot`) boş `<canvas>` yerine gerçek semantik HTML (`<h1>`, `<p>`, `<nav>`, meta, JSON-LD) görebilmesi için build-time statik HTML ön-render scripti (`tool/generate_seo_pages.dart`) veya Edge/Cloudflare Worker SSR/Pre-render stratejisini `docs/web_deployment.md` ile entegre kur.

5. İç Linkleme, Erişilebilirlik (`Semantics`) & Core Web Vitals:
   - Tüm ekranlarda tek `<h1>` hiyerarşisi ve Flutter `Semantics(header: true)` işaretlemesi uygula.
   - Ders -> Konu -> Branş Denemesi -> Puan Hesaplama sayfaları arasında güçlü iç linkleme (internal linking) köprüleri kur.
   - `web/index.html` içinde ön-yükleme (`preconnect`, font/asset optimizasyonu, `manifest.json` ikon ve tema uyumu) ile LCP/CLS metriklerini optimize et.

6. Testler:
   - `SeoSlugUtils` Türkçe karakter, boşluk ve ters çözümleme (slug -> ders/konu eşleşmesi) birim testlerini yaz.
   - `router_test.dart` içine SEO slug URL çözümleme ve eski rota yönlendirme testlerini ekle.
   - `sitemap.xml` ve `robots.txt` sözleşme testini (`test/seo_contract_test.dart`) ekle.
```

---

## 🖥️ 46. Dalga 46: Büyük Ekranlarda Mobil UX Kalıntılarının Giderilmesi & Web Masaüstü Dönüşümü (`TASK-157`)

Projenin ilk aşamasında mobil öncelikli geliştirilen ekranlardaki tek sütun (`maxWidth: 720`/`920`), yüzen mobil FAB, yatay kaydırmalı dar filtreler ve dokunmatik odaklı alt ekran akışlarını tespit edip büyük Web/Masaüstü ekranlar için masaüstü UX desenlerine dönüştüren görev paketidir:

### 📦 TASK-157: Kalan Ekranlarda Masaüstü UX Dönüşümü (`StudyPlannerScreen`, `MistakesScreen`, `QuizHistoryScreen`, `AdminReportsScreen`, `TrueFalseBlitzScreen`)

- **Durum:** ✅ **Tamamlandı**
- **Amaç:** Büyük ekranlarda (`usesSplitPane` / `>= 960px`) mobil görünüm ve mobil alışkanlıkları (`FloatingActionButton`, `720px` tek sütun listeler, her tıklamada tam sayfa geçişi, klavye kısayolsuz hızlı oyunlar) kaldırıp çok sütunlu SaaS kokpitleri, Master-Detail paneller ve masaüstü klavye etkileşimi sağlamak.

```text
GÖREV: TASK-157 — Büyük Ekranlardaki Mobil UX Kalıntılarının Masaüstü Web Standartlarına Taşınması
ÖNEMLİ: GEMINI.md kurallarına uy; mobil/tablet kırılımlarında (< 960px) mevcut mobil UX'i bozma.

1. `StudyPlannerScreen` (`lib/features/planner/presentation/study_planner_screen.dart`):
   - Sorun: Masaüstünde tek sütun uzun liste ve sağ alt köşede mobil `FloatingActionButton` (`Görev Ekle`) bulunuyor.
   - Çözüm: `usesSplitPane` (>= 960px) ekranlarda 2 sütunlu SaaS Planlayıcı düzenine geç (`maxWidth: 1200`; sol `flex: 5` Gün Özeti + Otomatik Program + Sıradaki Görevler; sağ `flex: 7` Görev Listesi), masaüstü başlık satırında doğrudan `FilledButton.icon('Görev Ekle')` göster ve mobil FAB'ı masaüstünde gizle.

2. `MistakesScreen` (`lib/features/mistakes/presentation/mistakes_screen.dart`):
   - Sorun: Sabit `maxWidth: 720` tek sütun `ListView` içinde tüm yanlış soru kartları alt alta dar şeritte sıralanıyor.
   - Çözüm: Masaüstünde `maxWidth: 1200` genişliğe çık, ders filtrelerini `Wrap` ile sergile ve yanlış soru kartlarını `ResponsiveGrid(columns: 2)` içinde iki sütunda göster.

3. `QuizHistoryScreen` & `QuizSessionDetailScreen` (`lib/features/stats/presentation/`):
   - Sorun: Arşiv listesi tek sütunda (`maxWidth: 920`) açılıyor ve her tıklamada tam sayfa push (`Navigator.push`) yapıyor.
   - Çözüm: Masaüstünde (`>= 960px`) Master-Detail (`maxWidth: 1260`; sol `flex: 5` oturum listesi, sağ `flex: 7` gömülü `QuizSessionDetailScreen(isEmbedded: true)`) yapısına geçir; mobilde mevcut tam sayfa navigasyonu koru.

4. `AdminReportsScreen` (`lib/features/reports/presentation/admin_reports_screen.dart`):
   - Sorun: Denetim bildirimleri tek sütunda sıralanıyor.
   - Çözüm: Masaüstünde `maxWidth: 1200` ve 2 sütunlu `ResponsiveGrid` kart düzeni uygula.

5. `TrueFalseBlitzScreen` (`lib/features/games/presentation/true_false_blitz_screen.dart`):
   - Sorun: Hızlı Doğru/Yanlış oyunu masaüstünde yalnızca fare tıklamasıyla oynanıyor.
   - Çözüm: `CallbackShortcuts` + `Focus(autofocus: true)` ile `D` / `Sol Ok` (Doğru) ve `Y` / `Sağ Ok` (Yanlış) masaüstü klavye kısayolları ekle.

6. Testler:
   - Tüm güncellenen ekranlar için masaüstü (1440x900 / 1280x800) taşma, Master-Detail ve klavye kısayolu testlerini ekle; `dart format`, `flutter analyze`, `flutter test` doğrula.
```

---

## 🧠 47. Dalga 47 [Faz 1]: Leitner Kutulu (1·3·7·14 Gün) Akıllı Aralıklı Tekrar (`TASK-158`)

Yanlış Defteri (`MistakeRepository`) ve Hap Bilgi Kartları (`FlashcardsScreen`) içindeki tek seferlik silme / oturum içi sayaç yapısını, **Leitner 4-Kutu (1 · 3 · 7 · 14 gün)** kalıcı aralıklı tekrar (spaced repetition) motoruna dönüştüren fazdır:

### 📦 TASK-158 [Faz 1]: Leitner Kutulu (1·3·7·14 Gün) Akıllı Aralıklı Tekrar (`MistakeRepository` & `Flashcards`)

- **Durum:** ✅ **Tamamlandı**
- **Amaç:** Yanlış yapılan soruların ve tekrar edilen bilgi kartlarının tek seferde silinmek yerine `reviewBox (1–4)` ve `nextReviewAt` takibine girmesi; `"Bugün Tekrar Etmen Gereken X Soru / Y Kart"` kuyruğuyla adayların unutma eğrisini yenmesini sağlamak.

```text
GÖREV: TASK-158 — Faz 1: Leitner Kutulu (1·3·7·14 Gün) Akıllı Aralıklı Tekrar Sistemi
ÖNEMLİ: GEMINI.md kurallarına uy; yeni paket kurmadan mevcut Riverpod/LocalStorage/Supabase mimarisini kullan. Tema ve tipografiyi `Theme.of(context)` üzerinden al.

ADIM 1: Veri Modelleri & Leitner Kural Motoru (Faz 1A)
1. `lib/features/mistakes/data/models/mistake_review_entry.dart` modelini oluştur:
   - Alanlar: `Question question`, `String examScope`, `int reviewBox` (`1..4`, varsayılan `1`), `DateTime nextReviewAt`, `DateTime? lastReviewedAt`, `int box4ConsecutiveCorrect` (`0..2`).
   - `toJson` / `fromJson` serileştirmesi ve eski düz `Question` JSON formatından (`reviewBox: 1, nextReviewAt: now`) kayıpsız geçiş desteği ekle.
2. `lib/features/flashcards/data/models/flashcard_review_progress.dart` modelini oluştur:
   - Sabit `Flashcard` (`lib/features/flashcards/data/models/flashcard.dart`) içerik modelini bozmadan `cardId`, `examScope`, `reviewBox (1..4)`, `nextReviewAt`, `lastReviewedAt` bilgilerini tut.
3. Saf Leitner hesaplama yardımcısı (`LeitnerScheduler` — `lib/core/utils/leitner_scheduler.dart`):
   - Kutu gün aralıkları: `1 -> +1 gün`, `2 -> +3 gün`, `3 -> +7 gün`, `4 -> +14 gün`.
   - Doğru / "Öğrendim" cevabında: `reviewBox < 4` ise `reviewBox + 1`; `reviewBox == 4` ise `box4ConsecutiveCorrect + 1` artar ve `box4ConsecutiveCorrect >= 2` olduğunda öğe **mezun (`isGraduated = true`)** sayılır.
   - Yanlış / "Tekrar Et" cevabında: `reviewBox = 1`, `box4ConsecutiveCorrect = 0`, `nextReviewAt = now + 1 gün`.
   - Vadesi gelen kuyruk filtresi: `isDue(now) => !nextReviewAt.isAfter(now)` (öncelik: vadesi geçmiş olanlar ve düşük kutular).

ADIM 2: Yerel Depolama & Supabase Bulut Senkronizasyonu (Faz 1B)
1. `lib/core/services/local_storage_service.dart` ve `lib/features/mistakes/data/mistake_repository.dart`:
   - `MistakeRepository` içindeki tek seferde silen `removeMistake` akışını Leitner uyumlu hale getir: kullanıcı manuel "Sil" (`removeMistakePermanently`) ile silebilsin; ancak `QuizScreen` içinde doğru çözülünce `recordReviewOutcome(questionId, isCorrect: true)` çağrısı kutuyu terfi ettirsin, yalnızca mezun olduğunda (`isGraduated`) listeden çözülüp düşsün.
   - Geriye dönük uyumluluk: mevcut `getMistakes()` getter'ı `List<Question>` döndürmeye devam etsin; ek olarak `getReviewEntries({String? examScope})` ve `getDueEntries({String? examScope, DateTime? now})` metotları sunulsun.
   - `FlashcardReviewProgress` durumunu `LocalStorageService` üzerinde `examScope` anahtarıyla sakla.
2. `docs/supabase_migrations/07_leitner_and_current_affairs.sql` & `docs/supabase_schema.sql`:
   - `public.question_attempt_logs` tablosuna `review_box int not null default 1 check (review_box between 1 and 4)`, `next_review_at timestamptz`, `box4_streak int not null default 0` sütunları + `(user_id, exam_scope, is_resolved_in_mistakes, next_review_at)` kısmi indeksi ekle.
   - Bilgi kartı tekrarları için `public.user_flashcard_reviews` tablosunu (`user_id`, `exam_scope`, `card_id`, `review_box`, `next_review_at`, `last_reviewed_at`, `unique(user_id, exam_scope, card_id)`) + RLS (`auth.uid() = user_id`) ile tanımla.
   - `lib/features/stats/data/cloud_sync_repository.dart` içine kutu/vade senkron metotlarını ekle.

ADIM 3: Kuyruk Arayüzü & Ekran Entegrasyonları (Faz 1C)
1. `MistakesScreen` (`lib/features/mistakes/presentation/mistakes_screen.dart`):
   - Üst aksiyon alanında **"Bugün Tekrar Etmen Gereken N Soru"** (`isDue`) kuyruk kartı ve tek tıkla **"Günlük Tekrarı Başlat"** butonu ekle (`QuizScreen` üzerinden çözülür, bitimde yeni kutular anlık yansır).
   - Her soru kartında `Kutu 1–4` (`KadroBadge` / tema rozeti) ve `"Sonraki Tekrar: Bugün / 3 gün sonra"` bilgisi göster; masaüstü `ResponsiveGrid` yapısını koru.
2. `FlashcardsScreen` (`lib/features/flashcards/presentation/flashcards_screen.dart`):
   - Mevcut `"Öğrendim"` ve `"Tekrar Et"` aksiyonlarını `LeitnerScheduler` ile bağla; kart üstünde aktif kutu bilgisini ve filtrede **"Bugün Vadesi Gelenler (N)"** seçeneğini sun.
3. `HomeScreen` (`lib/features/home/presentation/home_screen.dart`):
   - Vadesi gelen tekrar sorusu veya kartı varsa Bento/mobil akışta **"Bugün Tekrar Etmen Gereken X Öğe"** hızlı aksiyon şeridi göster.

ADIM 4: Testler (Faz 1D)
- `LeitnerScheduler` (1·3·7·14 gün hesabı, Kutu 4'te 2 doğru sonrası mezuniyet, yanlışta Kutu 1'e dönüş) ve eski düz JSON migrasyonu için birim testleri yaz.
- `MistakesScreen`, `FlashcardsScreen` ve `HomeScreen` üzerinde `"Bugün Tekrar Etmen Gereken ..."` kuyruk akışı widget testlerini (`flutter test`) doğrula.
```

---

## 📅 48. Dalga 48 [Faz 2]: Çalışma Planlayıcıda "Telafi Modu", Son 30 Gün "Sprint Modu" & Haftalık Görsel Takvim (`TASK-159`)

Mevcut çalışma planlayıcı (`AutoStudyProgramGenerator` & `StudyPlannerScreen`) üzerine gecikmiş günleri kurtaran **Telafi Modu**, sınav son düzlüğünde devreye giren **Son 30 Gün Sprint Modu** ve kurulum/plan ekranında **Haftalık Görsel Takvim Önizlemesi** ekleyen fazdır:

### 📦 TASK-159 [Faz 2]: Çalışma Planlayıcıda "Telafi Modu", "Sprint Modu" & Haftalık Görsel Takvim Önizlemesi (`StudyPlanner`)

- **Durum:** ✅ **Tamamlandı (Faz 2 — Akıllı Planlama & Esneklik)**
- **Amaç:** Kaçırılan günler yüzünden planı bırakma (churn) oranını düşürmek için tek tuşla telafi dağıtımı, son 30 günde otomatik hızlanan Sprint önerisi ve renkli haftalık takvim önizlemesi sunmak.

```text
GÖREV: TASK-159 — Faz 2: StudyPlanner Telafi Modu, Son 30 Gün Sprint Modu & Haftalık Görsel Takvim
ÖNEMLİ: GEMINI.md kurallarına uy; sabit Color(0xFF...) ve fontSize kullanma (tüm renkleri colorScheme üzerinden türet). `AutoStudyProgramGenerator` içindeki kapsam izolasyonunu (`examScope`) koru.

ADIM 1: Telafi (Catch-Up) & Son 30 Gün Sprint Motoru (Faz 2A)
1. `lib/features/planner/data/services/auto_study_program_generator.dart` & `study_planner_notifier.dart`:
   - `StudyPlannerState` içine `DateTime? lastPlannedDate`, `int missedDaysCount`, `bool isSprintModeActive` ve `List<int> weeklyStudyDays` (`1..7`, varsayılan 6–7 gün) alanlarını ekle (geriye dönük uyumlu `fromJson`/`toJson`).
   - **Telafi Algoritması (`rebalanceMissedTasks`):** Geçmiş günlerde tamamlanmamış bekleyen görevleri tespit et; kullanıcının **"Kaçırdığım Günleri Telafi Et"** seçimiyle bekleyen görevleri bugünden itibaren kalan günlere (günlük yükü makul üst sınır olan `maxDailyTasksPerPace` dahilinde bölerek) dengeli yeniden dağıt ve `cycleDay`/`tasks` durumunu güncelle.
   - **Son 30 Gün Sprint Modu:** `ExamCalendarUtils` üzerinden seçili `ExamSelection` sınav tarihine `<= 30` gün kaldığında `isSprintRecommended = true` bayrağı üret; aktif edildiğinde görev rotasyonunu yüksek öncelikli zayıf ders testleri + tam/branş denemesi + Leitner/Yanlış tekrarına ağırlık verecek şekilde yeniden kur (`sprintScheduleRatio`).

ADIM 2: Renkli Haftalık Takvim Bileşeni & Kurulum Önizlemesi (Faz 2B)
1. `lib/features/planner/presentation/widgets/weekly_planner_calendar_grid.dart` (ortak feature widget'ı):
   - Pzt–Paz (`7` sütun, mobilde yatay sarılabilir veya 2 satır `Wrap` ile taşma korumalı; masaüstünde 7 sütun tam genişlik) görsel takvim şebekesi oluştur.
   - Gün kutucuklarında görev türünü renkli nokta/etiketle (`colorScheme.primary`: Konu Testi, `colorScheme.secondary`: Harita/Kart Tekrarı, `colorScheme.tertiary`: Deneme / Sprint, `colorScheme.surfaceContainerHighest`: Dinlenme Günü) ve günlük toplam dakika/soru hedefini göster.
2. `AutoStudyProgramModal` (`lib/features/planner/presentation/widgets/auto_study_program_modal.dart`):
   - Kurulum sırasında haftanın çalışma günlerini seçebilme + seçilen `StudyProgramPace` (15–90 dk) ve gün seçimine göre **canlı Haftalık Takvim Önizlemesi** göster.
3. `StudyPlannerScreen` (`lib/features/planner/presentation/study_planner_screen.dart`):
   - Geciken gün varsa üst bölümde belirgin **"Kaçırdığım Günleri Telafi Et"** banner'ı ve butonu göster.
   - Sınava `<= 30` gün kalmışsa **"Son 30 Gün Sprint Moduna Geç"** öneri kartını göster ve sağ/sol Bento alanında haftalık görsel takvim şeridini sergile (`< 960px` mobilde de tek sütuna uyumlu).

ADIM 3: Testler (Faz 2C)
- `rebalanceMissedTasks` dağılımı (tamamlanmış görevlerin korunup gecikenlerin yayılması) ve 30 gün Sprint modunun deneme/tekrar ağırlığı için birim testleri yaz.
- `AutoStudyProgramModal` canlı takvim önizlemesi ile `StudyPlannerScreen` telafi butonu widget testlerini (`360x640` mobil + `1280x800` masaüstü taşma kontrolü dahil) ekle.
```

---

## 📰 49. Dalga 49 [Faz 3]: Aylık "Güncel Bilgiler" Bülteni & Akış Modülü (`TASK-160`)

`Güncel Bilgiler` dersini yalnızca soru havuzu veya hap kart olarak değil, KPSS adaylarının ay ay takip ettiği **Aylık Güncel Bilgiler Bülteni** (kategorili akış + ÖSYM soru potansiyeli notu + bülten sonu mini test) olarak sunan fazdır:

### 📦 TASK-160 [Faz 3]: Aylık "Güncel Bilgiler" Bülteni & Etkileşimli Akış (`CurrentAffairsScreen`)

- **Durum:** ✅ **Tamamlandı (Faz 3 — İçerik Derinliği & SEO Köprüsü)**
- **Amaç:** Kültür-Sanat, Bilim-Teknoloji, Spor, Ekonomi/Kurumlar ve Dünya başlıklarındaki güncel gelişmeleri aylık bülten formatında okunabilir akışa dönüştürmek, okundu takibi sunmak ve tek tıkla mini sınava bağlamak.

```text
GÖREV: TASK-160 — Faz 3: Aylık Güncel Bilgiler Bülteni & Bülten Mini Test Köprüsü
ÖNEMLİ: GEMINI.md kurallarına uy; widget içinde doğrudan JSON parse/Supabase çağrısı yapma, Repository katmanını kullan. Güncel Bilgiler tüm ilgili sınav kapsamlarında (`b_grubu`, `ekpss`, `meb_ags`) erişilebilir olmalıdır.

ADIM 1: Feature İskeleti, Modeller & Repository (Faz 3A)
1. `lib/features/current_affairs/` altında Feature-First yapıyı kur (`data/models/`, `data/`, `presentation/`, `presentation/widgets/`):
   - `CurrentAffairsCategory` enum (`kulturSanat`, `bilimTeknoloji`, `spor`, `ekonomiKurumlar`, `cevreDunya`).
   - `CurrentAffairsItem`: `id`, `yearMonth` (`'2026-10'` vb.), `title`, `summary`, `category`, `osymTip` ("Neden Önemli / ÖSYM Soru Potansiyeli"), `publishedLabel`, `linkedTags`, `isVerifiedOfficial`.
   - `CurrentAffairsBulletin`: `yearMonth`, `monthTitle` (ör. `'Ekim 2026'`), `subtitle`, `items`.
2. `CurrentAffairsRepository`:
   - İlk açılışta çevrimdışı da çalışan yerel örnek aylık bülten verisi (`assets/data/current_affairs_bulletins.json` veya modüler JSON + bellek/TTL önbellek) yükle.
   - Opsiyonel Supabase uzaktan bülten çekme (`public.current_affairs_bulletins`, yalnızca `SELECT` herkese açık, yazma `service_role` — şema tanımı `docs/supabase_migrations/07_leitner_and_current_affairs.sql` ve `docs/supabase_schema.sql` içinde).
   - Kullanıcının `"Okundu"` / `"Kaydet"` (bookmark) durumlarını `LocalStorageService` üzerinden sakla.

ADIM 2: Aylık Bülten Akış Ekranı & Navigasyon Köprüleri (Faz 3B)
1. `CurrentAffairsScreen` (`lib/features/current_affairs/presentation/current_affairs_screen.dart`):
   - Üstte yatay **Ay Seçici Şerit** (`Mayıs`, `Haziran`, `Temmuz`... + okunma ilerleme rozeti `"8/12 Okundu"`) ve kategori filtreleri (`Wrap`).
   - Her bülten kartında kategori etiketi (`KadroBadge` / tema rengi), başlık, net 2–3 cümlelik özet, **"ÖSYM Soru İpucu"** vurgu kutusu ve **Okundu / Kaydet** butonları.
   - Masaüstünde (`>= 960px`): 2 sütunlu `ResponsiveGrid` kart akışı veya solda ay/kategori özeti + sağda bülten kartları (`maxWidth: 1200`).
   - Alt/yan çağrı kartı: **"Bu Ayın Bülteninden 10 Soruluk Mini Test Çöz"** (`QuizScreen` ile etiket/konu uyumlu hızlı test başlat) ve **"Bilgi Kartlarıyla Tekrar Et"** (`FlashcardsScreen`).
2. Giriş noktaları & Routing:
   - `lib/app/router.dart` içine `/current-affairs` (ve opsiyonel `?ay=2026-06` query desteği; ileride `TASK-156` kapsamında `/guncel-bilgiler` slug köprüsüne bağlanacak şekilde) rotasını ekle.
   - `PracticeHubScreen` araçlar bölümüne ve `LessonsScreen` içindeki `Güncel Bilgiler` ders kartına **"Aylık Bülten Akışı"** geçişi ekle.

ADIM 3: Testler (Faz 3C)
- `CurrentAffairsRepository` JSON parse, ay/kategori filtreleme ve okundu/kaydet kalıcılığı birim testlerini yaz.
- `CurrentAffairsScreen` ay değiştirme, okundu işaretleme, mini test başlatma ve `360x640` mobil + `1280x800` masaüstü sıfır taşma testlerini ekle.
```

---

## 📄 50. Dalga 50 [Faz 4]: Yazdırılabilir A4 Test PDF Oluşturucu — Kadro PRO (`TASK-161`)

Yanlış Defteri'nden, seçili konu testlerinden veya deneme sınavlarından **A4 kitapçık düzeninde yazdırılabilir PDF + optik/cevap anahtarı** üreten ve `PaywallScreen` dönüşümünü güçlendiren son fazdır:

### 📦 TASK-161 [Faz 4]: Yazdırılabilir A4 Test PDF Oluşturucu — Telefon & Tablet (`TestPdfExportService`, `Kadro PRO`)

- **Durum:** ⏳ **Planlandı (Faz 4 — Kadro PRO Gelir & Çıktı Özelliği · Paket Onayı Gerektirir)**
- **Amaç:** Kâğıt üzerinde kalemle çözmek isteyen adaylara Yanlış Defteri, Konu Testi ve Deneme oturumlarından Türkçe karakter uyumlu **A4 Kitapçık + Optik Cevap Anahtarı PDF** çıktısı sunmak (Android/iOS telefon ve tabletlerde sistem paylaşım/yazdırma diyalogu üzerinden).

```text
GÖREV: TASK-161 — Faz 4: Yazdırılabilir A4 Test PDF Oluşturucu (Kadro PRO — Telefon & Tablet)
ÖNEMLİ: GEMINI.md gereği uygulamaya başlamadan önce `pubspec.yaml` değişiklikleri için kullanıcıdan/mimardan onay alarak `flutter pub add pdf printing` çalıştır. Ücretsiz kullanıcıda `PaywallScreen` kapısını ve sunucu entitlement doğrulamasını (`PurchaseService`) koru.

ADIM 1: PDF Kitapçık Üretim Motoru & Türkçe Font Desteği (Faz 4A)
1. `lib/core/services/pdf/test_pdf_export_service.dart`:
   - Türkçe karakterleri (`ğ, ü, ş, ı, İ, ö, ç`) eksiksiz çizen gömülü font yükleyici (`DM Sans` / `Noto Sans` asset TTF yüklemesi — PDF kütüphanesinin varsayılan Latin-1 Helvetica fontunu kullanma!).
   - Üretilen PDF yapısı (`TestPdfOptions`: `title`, `examScopeLabel`, `includeAnswerKey`, `includeSolutionsAndTraps`, `includeOpticalSheet`, `twoColumnLayout`):
     - Üst Bilgi: **Kadro** başlığı, Sınav Kapsamı (`KPSS Lisans`, `MEB-AGS`, `DHBT` vb.), Test Adı, Soru Sayısı ve Tarih.
     - Gövde: A4 sayfada okunaklı 2 sütunlu (veya E-KPSS görme erişilebilirliği için tek sütunlu büyük puntolu) numaralı sorular + `A) ... E)` şıkları (sayfa ortasında soru/şık bölünmesini önleyen `MultiPage` + `Wrap` blokları).
     - Arka Sayfa(lar): 1'den `N`'e kadar numaralı **Kodlamalı Optik Form** tablosu + **Cevap Anahtarı** + isteğe bağlı **"Çözüm & ÖSYM Çeldirici Tuzağı Analizleri"** bölümü.
   - Çıktı teslimi: Android/iOS telefon ve tabletlerde sistem paylaşım/yazdırma diyalogu (`Printing.sharePdf` / `Printing.layoutPdf`).

ADIM 2: PRO Yetki Kapısı, Günlük Adil Kullanım Kotası & Giriş Noktaları (Faz 4B)
1. `PaywallScreen` (`lib/features/profile/presentation/paywall_screen.dart`):
   - Kadro PRO avantajları listesine **"Yazdırılabilir A4 Test, Optik Form & Yanlış Defteri PDF Çıktısı"** maddesini ekle.
2. Dışa Aktarma Alt Penceresi (`TestPdfExportSheet` — `AdaptiveOverlay.showModal` ile):
   - Kullanıcı **"Cevap Anahtarı Ekle"**, **"Çözüm & Çeldirici Analizlerini Ekle"**, **"Çift Sütun A4 / Tek Sütun Büyük Punto"** seçeneklerini seçip tek tıkla **"PDF Oluştur ve Paylaş / Yazdır"** yapabilsin.
   - Ücretsiz (`!isPro`) kullanıcı PDF indir butonuna bastığında nazik önizleme mesajıyla `PaywallScreen` açılsın.
   - PRO kullanıcılar için tek seferde maksimum örn. `120` soru ve günde `10` PDF bellek/egress koruması uygula.
3. Ekran Bağlantıları:
   - `MistakesScreen`: **"Yanlışlarımdan A4 PDF Üret"** butonu.
   - `TopicTestsScreen`: Test kartları yanında **"PDF İndir"** aksiyonu.
   - `ExamsScreen` / `QuizResultScreen`: Seçili deneme veya çözülen oturumu **A4 Kitapçık & Optik PDF** olarak indirme aksiyonu.

ADIM 3: Testler (Faz 4C)
- `TestPdfExportService` birim testleri: verilen soru listesinden geçerli `%PDF-` imzalı `Uint8List` üretildiği, Türkçe karakterli metinlerin hata fırlatmadığı, çözüm/optik opsiyonlarının sayfa çıktısını değiştirdiği doğrulanır.
- Ücretsiz kullanıcıda `PaywallScreen` yönlendirmesi ve PRO kullanıcıda `TestPdfExportSheet` açılışı widget testlerini ekle.
```


---

### 📦 TASK-162: Çalışma Planlayıcı Ekranı & Manuel Görev Düzenlemenin Kaldırılması, Ana Sayfada Tüm Günlük Görevlerin Eksiksiz Gösterimi (`HomeDailyPlanCard`, `StudyPlanner`)

- **Durum:** 🟢 **Tamamlandı (Web `kadro-web` ✅ · Mobil `gunisigi` ✅)**
- **Amaç:** Adayların çalışma planı yönetimini basitleştirmek, harici görev ekleme/çıkarma karmaşasını tamamen kaldırarak ilk kurulumdaki tempo/odak ders rotasyonuna sadık kalmak; planlayıcı deneyimini doğrudan Ana Sayfa (`HomeScreen`) üzerindeki `HomeDailyPlanCard` kartında toplamak ve o günün tüm görevlerinin (örn. 5/5) eksiksiz görüntülenmesini sağlamak.

```text
GÖREV: TASK-162 — Çalışma Planlayıcı Sayfası ve Manuel Görev Düzenlemenin Kaldırılması & Ana Sayfada Tüm Günlük Görevlerin Eksiksiz Gösterimi (Mobil / Flutter)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Renkleri ve tipografiyi Theme.of(context).colorScheme ve .textTheme üzerinden al. İş tamamlandıktan sonra .agents/skills/flutter-verify/ adımlarını (`dart format lib test`, `flutter analyze`, `flutter test`) çalıştır ve 0 hata doğrula.

KAPSAM & ARKA PLAN:
Web tarafında (`kadro-web`) çalışma planlayıcı sayfası (`/planlayici`) kaldırılmış, sol gezinme menüsünden çıkarılmış, URL doğrudan `/panel` sayfasına yönlendirilmiş ve ana sayfadaki `HomeDailyPlanCard` kartı günün TÜM görevlerini (kısıtlama olmaksızın) gösterecek şekilde güncellenmiştir.
Kullanıcı başlangıçta sihirbaz veya ayarlardan seçtiği çalışma temposuna (dk15, dk30, dk45, dk60, dk90) ve odak dersine göre otomatik oluşturulan müfredat sırasıyla ilerler. Harici görev ekleyemez/silemez; görevleri çözdükçe üzeri çizilir ve günün görevleri tamamlandığında "Sonraki Güne Geç" butonuyla sıradaki güne ilerler.

ADIM 1: `HomeDailyPlanCard` Kartındaki Düzenleme / Harici Sayfa Bağlantılarının Kaldırılması & Tüm Görevlerin Listelenmesi
1. `lib/features/planner/presentation/widgets/home_daily_plan_card.dart`:
   - Üst başlıktaki (`Row`) "Tümünü Gör" `TextButton`'ını kaldır. Yerine sağ tarafta toplam ilerlemeyi kompakt gösteren metin (örn. `${planner.completedCount}/${planner.totalCount}`) koy veya sağ tarafı sade bırak.
   - 2. satırdaki "Düzenle" `InkWell` butonunu (`AutoStudyProgramModal.show`) kaldır. Yalnızca `Gün X` rozeti, varsa `Tekrar` rozeti ve tempo adı (`prefs.studyProgramPace.label`) kalsın.
   - Görev listesinde `planner.tasks.take(4).map(...)` şeklinde olan 4 görevlik sınırlamayı kaldır! Doğrudan `planner.tasks.map(...)` ile o günün planındaki TÜM görevlerin (örn. 5 görev varsa 5'inin birden) alt alta eksiksiz listelenmesini sağla.
   - `planner.tasks.isEmpty` durumundaki açıklama metnini güncelle: "Bugün için planlanan tüm görevleri tamamladınız veya henüz görev bulunmuyor." (Eski metindeki "Tümünü Gör üzerinden yeni hedef ekleyebilirsin" ifadesini kaldır).

ADIM 2: `HomeScreen` ve Gezinme (Router) Temizliği
1. `lib/features/home/presentation/home_screen.dart`:
   - `_ReminderItem` içindeki "Çalışma Planı" öğesine tıklandığında `StudyPlannerScreen`'e yönlendiren `Navigator.push` çağrısını kaldır (kart zaten aynı ekranda yer almaktadır; isteğe bağlı olarak sayfa içi kaydırma yapılabilir veya dokunma bilgilendirici bırakılabilir).
2. `lib/app/router.dart`:
   - `/planner` rotası çağrıldığında `const StudyPlannerScreen()` yerine `HomeScreen`'e yönlendirme (`redirect: (context, state) => '/'` veya benzeri zarif fallback) yap.

ADIM 3: Görev Tamamlama & Üzeri Çizilme (Strike-Through) Doğrulaması
1. `_DailyPlanTaskItem` içinde:
   - `task.isCompleted == true` olduğunda görev başlığında `TextDecoration.lineThrough` ve `colorScheme.onSurfaceVariant` rengi uygulandığından emin ol.
   - Onay kutusunda `PhosphorIconsFill.checkCircle` (yeşil / `colorScheme.secondary`), tamamlanmamışta `PhosphorIconsRegular.circle` gösterilsin.
   - Sağdaki aksiyon butonu tamamlanmış görev için `Tekrar` (`PhosphorIconsRegular.arrowCounterClockwise`), tamamlanmamış görev için `Başla` (`PhosphorIconsBold.caretRight` veya `play`) rozeti olsun.

ADIM 4: Doğrulama & Testler
1. `flutter analyze` çalıştır ➔ 0 hata / 0 uyarı doğrula.
2. `flutter test` çalıştır ➔ Mevcut testlerin kırılmadığını ve `HomeDailyPlanCard` widget testinin tüm görevleri listelediğini doğrula.
```

---

### 📦 TASK-163: Test Sonu Karnesinde Günlük Görev Akışı & Sıradaki Göreve Kesintisiz Geçiş (`QuizResultScreen` / Flow State)

- **Durum:** 🟢 **Tamamlandı (Web `kadro-web` ✅ · Mobil `gunisigi` ✅)**
- **Amaç:** Günlük plandaki bir görevden teste başlayan adayın test bittiğinde akıştan kopmasını önlemek; karne ekranında görevin tamamlandığını yeşil rozet ve akış bandıyla teyit etmek, adayı doğrudan sıradaki göreve geçiren **"Sıradaki Göreve Geç: [Görev Adı] →"** birincil butonu ile Duolingo/Brilliant akıcılığı sağlamak.

```text
GÖREV: TASK-163 — Test Sonu Karnesinde Günlük Görev Akışı & Sıradaki Göreve Kesintisiz Geçiş (Mobil / Flutter)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Renkleri ve tipografiyi Theme.of(context).colorScheme ve .textTheme üzerinden al. İş tamamlandıktan sonra .agents/skills/flutter-verify/ adımlarını (`dart format lib test`, `flutter analyze`, `flutter test`) çalıştır ve 0 hata doğrula.

KAPSAM & ARKA PLAN:
Web tarafında (`kadro-web`) test çözüldüğünde (`/coz` -> `QuizStudioWorkspace`) kullanıcının günlük planındaki sıradaki tamamlanmamış görev otomatik tespit edilmekte; test karne ekranında yeşil onay rozeti ("✓ Günlük Görev Tamamlandı · X/Y Görev"), yeşil motivasyon bandı ve doğrudan sıradaki görevi başlatan birincil ("Sıradaki Göreve Geç: [Görev] →") ile ikincil ("Ana Sayfaya Dön") butonları sunulmaktadır.
Mobilde de adayın test bitiminde akıştan kopmaması için bu kesintisiz döngü `QuizResultScreen` ekranına kazandırılacaktır.

ADIM 1: `QuizResultScreen` Ekranında Günlük Akış Bilgisini Çözümleme
1. `lib/features/quiz/presentation/quiz_result_screen.dart`:
   - Riverpod üzerinden `studyPlannerProvider` ve `userPreferencesProvider` okunarak o günün görev listesi (`planner.tasks`), tamamlanan görev sayısı ve sıradaki tamamlanmamış görev (`nextTask`) tespit edilsin.
   - Eğer çözülen test bir günlük görevden başlatılmışsa (`taskId` parametresi veya çözülen ders/konu o günün görevlerinden biriyle eşleşiyorsa) "Günlük Akış Modu" aktifleşsin.

ADIM 2: Karne Başlığı Rozeti & Görev Akış Bildirim Bandı
1. Karne başlığının yanına veya altına yeşil rozet ekle:
   - "✓ Günlük Görev Tamamlandı · ${completedCount}/${totalCount} Görev"
2. Skor özet kartlarının hemen altına yeşil zeminli dinamik Görev Akış Bandı ekle:
   - Sırada görev varsa: "Tebrikler! Bu görev tamamlandı (${completedCount}/${totalCount}). Sırada ${nextTask.title} görevi seni bekliyor." + "Sıradaki Göreve Başla →" aksiyonu.
   - Günün tüm görevleri bittiğinde: "Harika bir disiplin! Gün ${cycleDay} için planlanan tüm görevleri tamamladın! 🎉" + "Ana Sayfaya Dön" aksiyonu.

ADIM 3: Birincil (Primary) ve İkincil Buton Dönüşümü
1. Sırada çözülecek görev varsa:
   - Birincil Buton (Yeşil / Vurgulu): **"Sıradaki Göreve Geç: ${nextTask.title} →"**
     - Tıklandığında doğrudan sıradaki görevin testini/kartını başlatsın (`StudyTaskLauncher.launch`).
   - İkincil Buton: **"Ana Sayfaya Dön"**
2. Günün tüm görevleri bittiğinde:
   - Birincil Buton: **"Günü Tamamladın! Ana Sayfaya Dön"**
3. Yalnızca günlük plan dışındaki serbest test çözümlerinde mevcut genel "Yeni Test Seç" / "Derslere Dön" butonu kullanılsın.

ADIM 4: Doğrulama & Testler
1. `flutter analyze` çalıştır ➔ 0 hata / 0 uyarı doğrula.
2. `flutter test` çalıştır ➔ Testlerin yeşil olduğunu ve `QuizResultScreen` akış butonlarının doğru çalıştığını doğrula.
```

---

## 🚀 51. Dalga 51 [Yayın Kapısı]: Mağaza Uyumluluk Denetimi (`TASK-164`)

### 📦 TASK-164: Yayın Öncesi Mağaza Uyumluluk Kapısı (`app-store-compliance` skill denetimi)

- **Durum:** ⏳ Planlandı · 🌐 Web ❌ · 📱 Mobil ❌
- **Amaç:** Google Play (ve ileride App Store) gönderiminde ret yememek. 2026-11-21 tarihli `/app-store-audit` denetiminde çıkan engelleyici bulguları kapatmak; bu görev bitmeden **yayına çıkılmaz**.
- **Platform Uygulanabilirliği:** Ortak — yasal sayfalar web'de, uygulama içi düzeltmeler mobilde.
- **Denetim aracı:** `.claude/skills/app-store-compliance/` (mjmirza/app-store-compliance v2.4.0) ve `/app-store-audit` komutu. Tarayıcı `.claude/`, `.agents/` klasörlerini de taradığı için yalnızca gönderilen dosyalar (`lib`, `android`, `ios`, `assets`, `pubspec.*`) geçici bir kopyaya alınıp taranır.

#### 🔗 Ortak Sözleşme (İki platform birebir uyar)
- **Supabase:** Değişiklik yok. `delete_user_account()` RPC'si mevcut (`docs/supabase_schema.sql:343`); hata dönerse istemci bunu başarı saymaz.
- **Yasal URL'ler (kesin):** `https://kadro.app/gizlilik` ve `https://kadro.app/hesap-silme` (`lib/core/legal/legal_documents.dart`). İkisi de oturum açmadan, uygulama dışından erişilebilir olmalı ve 200 dönmeli (denetim tarihinde 404).
- **Hesap silme kuralı:** Silme yalnızca RPC başarılı olursa "tamamlandı" sayılır; başarısızsa kullanıcı oturumda kalır ve hata mesajı görür. Web'deki silme akışı da aynı kurala uyar.
- **Eşleniklik örnekleri:** Gerekmez.

#### 📱 Mobil Kapsamı (`gunisigi` — Flutter)
```text
GÖREV: TASK-164 — Yayın Öncesi Mağaza Uyumluluk Kapısı (Mobil / Flutter)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Ortak Sözleşme bölümünün dışına çıkma. Bitince flutter-verify adımlarını çalıştır ve task-board'da yalnızca "Mobil de Yapıldı" kolonunu güncelle.

ADIM 1: Hesap silme hatasını yutma
- lib/features/auth/data/auth_notifier.dart `deleteAccountAndData()`: `client.rpc('delete_user_account')` hatasını `catch (_) {}` ile yutma. Hata olursa yerel veriyi silme, oturumu kapatma; `errorMessage` ile false dön. Profil ekranı hatayı göstersin. Widget/birim testi ekle.

ADIM 2: AdMob rıza formu (UMP)
- lib/core/services/ad_service.dart: ilk reklam yüklenmeden önce `ConsentInformation.instance.requestConsentInfoUpdate` + gerekirse `ConsentForm.loadAndShowConsentFormIfRequired` (google_mobile_ads içinde, yeni paket gerekmez). `canRequestAds()` false ise reklam yükleme. Profil > Gizlilik altına "Reklam tercihlerini değiştir" (privacy options form) girişi ekle.

ADIM 3: Gerçek kimlikleri koddan çıkar
- AdMob App ID (AndroidManifest `com.google.android.gms.ads.APPLICATION_ID`, şu an Google örnek ID'si) → Gradle `manifestPlaceholders` + `--dart-define`/ortam değişkeni. Reklam birimi ID'leri ve RevenueCat `goog_` anahtarı `--dart-define` ile gelsin; debug'da test ID'leri kalsın. Gizli değer depoya yazılmaz.

ADIM 4: Bildirim izni (Android 13+)
- AndroidManifest'e `android.permission.POST_NOTIFICATIONS` ekle. lib/core/services/notification_service.dart: `AndroidFlutterLocalNotificationsPlugin.requestNotificationsPermission()` çağrısını, kullanıcı hatırlatıcıyı açtığı anda (soğuk açılışta değil) yap; reddedilirse ayarı kapalı göster.

ADIM 5: Yeniden denetim
- `/app-store-audit` çalıştır; Android tarafında CRITICAL = 0 olmalı. Kalan HIGH/MEDIUM bulguları bu görevin altına not düş.
```

#### 🌐 Web Kapsamı (`kadro-web` — Next.js)
```text
GÖREV: TASK-164 — Yayın Öncesi Mağaza Uyumluluk Kapısı (Web / Next.js)
ÖNEMLİ: kadro-web/AGENTS.md kurallarına birebir uy. Ortak Sözleşme bölümünün dışına çıkma. Bitince lint/test adımlarını çalıştır ve ../gunisigi/docs/task-board.md içinde yalnızca "Web de Yapıldı" kolonunu güncelle.

ADIM 1: `/gizlilik` sayfası — mobildeki legal_documents.dart gizlilik metniyle aynı içerik (AdMob, Sentry, Supabase, RevenueCat açıkça adlandırılır), oturumsuz erişilebilir, SEO indexlenebilir.
ADIM 2: `/hesap-silme` sayfası — uygulama adı + geliştirici adı, silme adımları (uygulama içi yol: Profil > Hukuki & Gizlilik > Hesabımı ve Verilerimi Sil), silinen/saklanan veri türleri ve saklama süresi; oturum açıksa doğrudan silme butonu (`delete_user_account` RPC, hata durumunda başarı gösterilmez).
ADIM 3: `kadro.app` alan adında iki sayfanın 200 döndüğünü doğrula; `app-ads.txt` dosyasını kök dizinde yayınla (AdMob yayıncı kimliğiyle).
```

#### 👤 Kullanıcının (Ömer) Elle Yapacakları — Play Console
- [ ] Veri Güvenliği formu: AdMob (reklam kimliği, cihaz bilgisi), Sentry (çökme kayıtları), Supabase (e-posta, ad, test sonuçları), RevenueCat (satın alma geçmişi) — toplama/paylaşım/şifreleme/silme talebi alanları eksiksiz.
- [ ] Reklam kimliği beyanı: "Evet, reklam için kullanılıyor".
- [ ] Gizlilik politikası ve hesap silme URL'lerini Console'a gir.
- [ ] Kapalı test: 12 test kullanıcısı, 14 gün kesintisiz.
- [ ] İçerik derecelendirme anketi ve hedef kitle (çocuklara yönelik değil) beyanı.
- [ ] İnceleme için çalışan bir demo hesap (2FA'sız) ve canlı Supabase arka ucu.

#### 🍎 iOS'a çıkılırsa (şimdilik kapsam dışı)
- Sign in with Apple (Google girişi olduğu için zorunlu, Apple 4.8), `ios/Runner/PrivacyInfo.xcprivacy`, Info.plist'e `ITSAppUsesNonExemptEncryption=false`, ATT istemi (`NSUserTrackingUsageDescription`).

#### ✅ Kabul Kriterleri
- [ ] `https://kadro.app/gizlilik` ve `https://kadro.app/hesap-silme` 200 dönüyor
- [ ] RPC hatasında uygulama "silindi" demiyor (testle doğrulandı)
- [ ] AB kullanıcısında ilk açılışta UMP rıza formu çıkıyor, rıza yoksa reklam yüklenmiyor
- [ ] Release derlemede test AdMob/RevenueCat kimliği yok
- [ ] Android 13+ cihazda bildirim izni isteniyor ve hatırlatıcı bildirimi geliyor
- [ ] `/app-store-audit` Android tarafında CRITICAL = 0

---

## 📖 52. Dalga 52 [İçerik Açılışı]: GY Türkçe Dersinin Aktifleştirilmesi (`TASK-165`)

### 📦 TASK-165: GY Türkçe Dersinin Aktifleştirilmesi ("Yakında" → Hazır) & GY-GK Kapsam Sorgusu Düzeltmesi

- **Durum:** 🟡 Kısmi (Web bekliyor) · 🌐 Web ❌ · 📱 Mobil ✅ (Gemini uyguladı, Claude inceledi 2026-11-22: analyze 0, 467 test yeşil)
- **Amaç:** Claude + Gemini ile üretilip canlı Supabase'e yüklenen **710 Türkçe sorusunu** kullanıcıya açmak. KPSS Lisans GY-GK seçen aday Türkçe'yi Tarih/Coğrafya gibi konu konu çözebilsin; "Yakında" rozeti kalksın.
- **Platform Uygulanabilirliği:** Ortak (iki platform).
- **Uygulayıcı:** Gemini (mobil kodu yazar) → Claude (inceler). İnceleme bitmeden Mobil kolonu ✅ yapılmaz.

#### 📊 Canlı Veri Durumu (2026-11-21, `kadroDB`)
| Konu | Soru | Test (÷10, yukarı) |
|---|---|---|
| Sözcükte Anlam | 50 | 5 |
| Cümlede Anlam | 90 | 9 |
| Paragrafta Anlam ve Yapı | 310 | 31 |
| Sözcükte Yapı ve Ekler | 20 | 2 |
| Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil) | 30 | 3 |
| Ses Bilgisi ve Ses Olayları | 20 | 2 |
| Yazım Kuralları | 30 | 3 |
| Noktalama İşaretleri | 30 | 3 |
| Cümlenin Ögeleri ve Cümle Türleri | 30 | 3 |
| Anlatım Bozuklukları | 30 | 3 |
| Sözel Mantık ve Muhakeme | 70 | 7 |
| **Toplam** | **710** | **71** |

- Tüm Türkçe soruları `lesson = 'Türkçe'`, `exam_scopes = {lisans_gygk}`. GK soruları (Tarih 697, Coğrafya 390, Vatandaşlık 634, Güncel 512) yalnızca `{lisans_gk}`.
- Konu adları `lib/features/lessons/data/kpss_lessons.dart` içindeki 11 Türkçe konusuyla **birebir aynı** (değiştirme).
- Kaynak SQL'ler: `docs/soru_havuzu/turkce/` (zaten canlıda; yeniden çalıştırma).

#### 🔗 Ortak Sözleşme (İki platform birebir uyar)
- **Supabase:** Şema değişikliği yok. Yeni migration yok.
- **Kapsam kuralı (kesin):**
  - Türkçe yalnızca `lisans_gygk` seçiminde **hazır**. `lisans_gk` (yalnız GK) modunda Türkçe görünmez (bugünkü gibi).
  - `onlisans_gygk`, `ortaogretim_gygk` ve E-KPSS GY Türkçe **"Yakında" kalır**. Bu sorular Lisans düzeyine göre yazıldı; diğer düzeylere açmak ayrı bir içerik kararı (ileride `exam_scopes` genişletme migration'ı).
  - Matematik & Geometri her yerde "Yakında" kalır.
- **Soru sorgusu kuralı (hata düzeltmesi):** Bir seçim için buluttan soru çekilirken `exam_scopes`, seçimin **kabul ettiği kapsam kümesiyle kesişmeli** (`overlaps`), yalnızca `scopeKey` içermesi (`contains`) yetmez. Kabul kümesi bugünkü `Question.matchesSelection` mantığıyla aynıdır; ör. `lisans_gygk` → `{lisans_gygk, lisans_gk, b_grubu_gygk, b_grubu_gk, b_grubu_common}`. Bugün bu yüzden GY-GK modunda GK dersleri buluttan boş dönüp yalnızca yerel JSON'a düşüyor.
- **Test sayısı:** Konu başına `ceil(soru / 10)` (mevcut `fetchTopicTestCounts` kuralı). Varsayılan (çevrimdışı) değerler yukarıdaki tablodaki test sayılarıdır.
- **Sınav ağırlığı:** Türkçe 30 soru (GY-GK 120 soruluk dağılım değişmez). Tam GY-GK denemesi Matematik gelene kadar açılmaz; Türkçe **branş denemesi** (30 soru) açılır.
- **Eşleniklik örnekleri:** Gerekmez (puan/net kuralı değişmiyor).

#### 📱 Mobil Kapsamı (`gunisigi` — Flutter)
```text
GÖREV: TASK-165 — GY Türkçe Dersinin Aktifleştirilmesi & GY-GK Kapsam Sorgusu Düzeltmesi (Mobil / Flutter)
ÖNEMLİ: GEMINI.md kurallarına birebir uy. Ortak Sözleşme bölümünün dışına çıkma. Yeni paket ekleme, şema/migration yazma, soru SQL'lerine dokunma. Bitince flutter-verify adımlarını çalıştır; task-board'da Mobil kolonunu Claude incelemesi onaylanana kadar ❌ bırak.

ADIM 1: Kabul edilen kapsam kümesini tek yere taşı
1. lib/features/exams/data/models/exam_selection.dart: `Set<String> get acceptedQuestionScopes` getter'ı ekle. İçeriği bugün lib/features/quiz/data/models/question.dart `matchesSelection` içindeki `acceptedScopes` kümesiyle BİREBİR aynı olsun (scopeKey, `${family.key}_common`, fullGyGk ise `${educationLevel.key}_gk` + b_grubu_gygk + b_grubu_gk, onlyGk ise b_grubu_gk, DHBT kuralları).
   Not: MEB-AGS'deki `meb_ags` kuralı sorunun `subBranch` alanına bağlı olduğu için getter'a girmez; o koşul matchesSelection'da kalır. Bulut sorgusu için MEB-AGS ÖABT seçiminde 'meb_ags' de kümeye eklenebilir (istemci süzgeci zaten eler).
2. `Question.matchesSelection` bu getter'ı kullansın (davranış değişmesin).

ADIM 2: Bulut sorgusunu düzelt
1. lib/features/quiz/data/question_repository.dart `fetchQuestions` içinde:
   `filterQuery.contains('exam_scopes', [selection.scopeKey])` yerine `filterQuery.overlaps('exam_scopes', selection.acceptedQuestionScopes.toList())`.
2. Sonrasındaki `matchesSelection` istemci süzgeci kalsın.
3. Aynı `contains('exam_scopes'` kalıbı başka yerde varsa (grep) aynı şekilde düzelt.

ADIM 3: Türkçe'yi yalnız Lisans GY-GK'da hazır yap
1. lib/features/lessons/data/curriculum_registry.dart:
   - `_tarihTopicTestCounts` benzeri `_turkceTopicTestCounts` sabitini ekle (Canlı Veri Durumu tablosundaki test sayıları).
   - Türkçe için `LessonSpec.fromLegacyLesson(..., availabilityOverride: CurriculumAvailability.ready, defaultTestCountsByTopic: _turkceTopicTestCounts)` üreten ve `badgeText`'i kaldıran (gerekirse `copyWith`) bir yardımcı yaz.
   - `_resolveBGrubu`: `fullGyGk` VE `educationLevel == EducationLevel.lisans` ise Türkçe `activeLessons` listesine (GK derslerinden sonra) girsin; Matematik `upcomingLessons`'ta kalsın. Bölüm başlıkları: activeSectionTitle 'KPSS Genel Kültür + GY Türkçe (90 Soru)', upcomingSectionTitle 'KPSS Genel Yetenek · Matematik (30 Soru · Yakında)'. summaryLabel ve `availability: partial` korunur.
   - Ön Lisans/Ortaöğretim GY-GK ve E-KPSS değişmez (Türkçe "Yakında").
2. lib/features/lessons/data/kpss_lessons.dart: legacy `kpssGeneralAbilityLessons` Türkçe kaydına DOKUNMA (Yakında kalsın). Hazır olma kararı yalnızca registry'de verilir; böylece diğer düzeyler etkilenmez.

ADIM 4: Akışların Türkçe'yi gördüğünü doğrula (kod değişikliği gerekirse minimal)
- lessons_screen.dart: aktif dersler listesinde Türkçe kartı, rozet yok.
- lesson_topics_screen.dart: 11 konu ve test sayıları.
- topic_tests_screen.dart ve quiz ekranı: paragraf soruları uzun; soru metninde sabit yükseklik yok, taşma yok.
- practice_hub_screen.dart:941 civarındaki `isComingSoon` dalı Türkçe için kilit göstermesin.
- branch_mock_exam_generator.dart: Türkçe branş denemesi (30 soru) üretilsin.
- planner/data/services/auto_study_program_generator.dart: Lisans GY-GK planında Türkçe görevleri gelsin (activeLessons'tan).
- onboarding_screen.dart:795 civarı ders önizlemesi Türkçe'yi aktif göstersin.
- Çevrimdışı: Türkçe yerel JSON'da yok; bulut yoksa Türkçe konu ekranı boş durum mesajı göstersin, çökmesin.

ADIM 5: Testler
1. test/ altına (veya mevcut curriculum/lessons testlerine) ekle:
   - `CurriculumRegistry.resolve(lisans fullGyGk)`: activeLessons Türkçe içerir, isComingSoon false, 11 konu, Türkçe varsayılan test toplamı 71; Matematik upcoming.
   - onlisans fullGyGk ve ekpss: Türkçe hâlâ upcoming ve comingSoon.
   - lisans onlyGk: Türkçe hiç yok.
   - `ExamSelection(bGroupProfile: BGroupProfile.fullGyGk).acceptedQuestionScopes` içinde 'lisans_gk' ve 'lisans_gygk' var; `examScopes: ['lisans_gk']` olan bir sorunun matchesSelection sonucu eski davranışla aynı.
2. Sabit sayı kullanan mevcut testler (ör. toplam ders/test sayısı) kırılırsa beklentiyi yeni sözleşmeye göre güncelle; testi silme.
3. `dart format` (değişen dosyalar), `flutter analyze` 0 sorun, `node tools/affected_tests.mjs --run`, sonra tam `flutter test`.
```

#### 🌐 Web Kapsamı (`kadro-web` — Next.js)
```text
GÖREV: TASK-165 — GY Türkçe Dersinin Aktifleştirilmesi & GY-GK Kapsam Sorgusu Düzeltmesi (Web / Next.js)
ÖNEMLİ: kadro-web/AGENTS.md kurallarına birebir uy. Ortak Sözleşme bölümünün dışına çıkma. Bitince lint/test adımlarını çalıştır ve ../gunisigi/docs/task-board.md içinde yalnızca "Web de Yapıldı" kolonunu güncelle.

ADIM 1: Müfredat kaydında Türkçe'yi yalnız Lisans GY-GK için hazır yap (11 konu, varsayılan test sayıları Ortak Sözleşme tablosundaki gibi); diğer düzeyler ve E-KPSS "Yakında" kalsın; Matematik "Yakında".
ADIM 2: Supabase soru sorgusunda `exam_scopes` filtresini kabul kümesiyle `.overlaps(...)` yap (GY-GK modunda GK soruları buluttan gelsin).
ADIM 3: Ders, konu, branş denemesi ve planlayıcı ekranlarında Türkçe'nin açıldığını doğrula; paragraf sorularında taşma olmasın.
```

#### ✅ Kabul Kriterleri
- [ ] Lisans GY-GK seçen kullanıcı Dersler ekranında Türkçe'yi "Yakında" rozeti olmadan görüyor; 11 konu ve konu başına doğru test sayısı (toplam 71) çıkıyor
- [ ] Türkçe konu testi buluttan 10 soru getiriyor; ÖSYM Çeldirici Tuzağı (`distractorTrap`) bölümü görünüyor
- [ ] GY-GK modunda Tarih/Coğrafya/Vatandaşlık/Güncel soruları da buluttan geliyor (yerel JSON'a düşmüyor)
- [ ] Ön Lisans/Ortaöğretim GY-GK ve E-KPSS'de Türkçe hâlâ "Yakında"; yalnız GK modunda Türkçe yok
- [ ] Türkçe branş denemesi (30 soru) üretiliyor
- [ ] `flutter analyze` 0 sorun, tam `flutter test` yeşil
- [x] Claude incelemesi onaylandı (mobil)

> 📝 **Sonraya bırakıldı (bu görevin kapsamı dışı):** Tam 120 soruluk GY-GK denemesi kartları (`mock_exam_blueprint.dart` `b_gygk_tam_1/2`) Matematik soruları gelene kadar "Yakında" gösterilmeli; şu an açık ve 30 Matematik sorusu eksik gelir. Matematik içerik görevinde ele alınacak.
