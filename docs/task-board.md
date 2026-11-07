# 🧠 Kadro (KPSS Lisans Genel Kültür) — Kesinleşmiş Mimari & Alt Ajan Görev Panosu

## 📌 1. Kesinleşen Mimari ve Ürün Kararları (Anayasamız)

Projemizin temel direkleri ([GEMINI.md](file:///d:/projelerim/gunisigi/GEMINI.md) içinde de kayıtlıdır):

1. **Ürün Odağı (Niş & Yüksek Dönüşüm):**
   - **Sadece KPSS Lisans Genel Kültür (60 Soru / 65 Dakika):**
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

| Kod | Görev Adı | Kapsam | Durum |
|---|---|---|---|
| **TASK-01** | **Mimari Hizalama & Genel Kültür (60 Soru) Dönüşümü** | Klasör ihlallerini düzeltme (`lib/core/`, `lib/features/quiz/data/`), Türkçe/Matematik'i kaldırıp uygulamayı **KPSS Lisans Genel Kültür (60 soru)** yapısına çekme, `QuestionRepository` oluşturma | ✅ **Tamamlandı** (`ed398cd`) |
| **TASK-02** | **Ders Konuları (`Topics`) & Konu Seçim Ekranı** | 4 Genel Kültür dersine gerçek KPSS konularını ekleme, `Stack` ile *"Güncel"* rozeti, derse tıklayınca `LessonTopicsScreen` (`ListView.builder`) açılması | ✅ **Tamamlandı** (`93615ec`) |
| **TASK-03** | **Etkileşimli Soru Çözüm Motoru (`QuizScreen`)** | `StatefulWidget` dönüşümü, şık seçimi, "Cevabı Onayla", doğru/yanlış renklendirmesi ve çözüm açıklaması (`_ExplanationCard`) | ✅ **Tamamlandı** (`a31a92f`) |
| **TASK-04** | **Çoklu Soru İlerlemesi & Test Sonu Karnesi (`QuizResultScreen`)** | JSON'dan gelen sorularla çoklu soru akışı (`1 / N`), test bitiminde Doğru/Yanlış/Boş ve **Genel Kültür Neti** özet ekranı | ✅ **Tamamlandı** (`07b62b6`) |
| **TASK-05** | **Hap Bilgi Kartları (`FlashcardsScreen`)** | `AnimatedSwitcher` ile ön/arka yüz dönen bilgi kartları, "Öğrendim / Tekrar Et" sayaçları ve Ana Sayfa bağlantısı | ✅ **Tamamlandı** (`d7d5450`) |
| **TASK-06** | **Yanlış Defteri (`MistakesScreen`) & Bellek İçi Havuz** | Testte yanlış yapılan soruların `MistakeRepository` (in-memory) içine kaydedilmesi, Ana Sayfadan Yanlış Defteri'ni açıp yanlışları tekrar çözme | ✅ **Tamamlandı** |
| **TASK-07** | **Süreli Genel Kültür Denemesi (`ExamSessionScreen`)** | `Timer.periodic` ile geri sayım sayacı, `ExamsScreen` ve `HomeScreen` üzerinden süreli deneme başlatma ve bitirme | ✅ **Tamamlandı** |
| **TASK-08** | **Faz 5: `go_router` & `StatefulShellRoute` Navigasyon** | Tüm ekranların (`Home`, `Lessons`, `Topics`, `Quiz`, `Flashcards`, `Mistakes`, `Exams`, `Stats`, `Profile`) URL/rota tabanlı profesyonel navigasyona geçişi | ✅ **Tamamlandı** |
| **TASK-09** | **Faz 8: `flutter_riverpod` + Canlı Hedef & İstatistik** | Çözülen soruların global state ile takibi; Ana Sayfa `Bugünkü hedefin (X / 30)` ve `StatsScreen` ekranının gerçek verilerle canlanması | ✅ **Tamamlandı** (`4d46fcc`) |
| **TASK-10** | **Para Kazanma (Kadro PRO Paywall & Ödüllü Reklam) + Profil Ayarları** | Günlük 30 soru limiti dolunca çıkan *"Reklam İzle (+20 Soru) / Kadro PRO"* ekranı, `ProfileScreen`'de Açık/Koyu Tema ve Hedef seçimi | ✅ **Tamamlandı** (`114d2cd`) |
| **TASK-11** | **Kurumsal Marka Teması (`FlexColorScheme` + `GoogleFonts`) & `LucideIcons` Kabuk Dönüşümü** | `design-system/kadro/MASTER.md` doğrultusunda Academic Indigo + Gold renk sistemi, `Plus Jakarta Sans` + `Inter` fontları, `AppTopBar` ve `AppNavigationBar` modernizasyonu | ✅ **Tamamlandı** (`7dffb02`) |
| **TASK-12** | **Bento Grid Ana Sayfa, Gamified Hedef Kartı & `flutter_animate` Mikro Etkileşimler** | `HomeScreen` Hero hedef kartı, Bento çalışma kartları, `LessonsScreen` ve `ExamsScreen` `LucideIcons` + `flutter_animate` geçişleri | ✅ **Tamamlandı** (`f98fc6b`) |
| **TASK-13** | **Görsel Analitik (`StatsScreen` + `fl_chart` `BarChart`) & Karne/Paywall Marka Cilası** | `StatsScreen` içine ders bazlı başarı çubuğu grafiği (`BarChart`), `QuizResultScreen` ve `PaywallScreen` premium görsel dokunuşları | ✅ **Tamamlandı** (`d2fc73b`) |
| **TASK-14** | **"Kadro Koçu" (Anadolu Kartalı) Maskot Sistemi (`MascotCoachBanner`), 3D `TactileCard` & Gamified Üst Bar** | 4 farklı ifadeli (`coach`, `victory`, `detective`, `pro`) **Kadro Koçu** konuşma balonlu maskot bileşeni, Duolingo/Brilliant tarzı 3D alt gölgeli `TactileCard` ve `AppTopBar` canlı seri/PRO rozetleri | ✅ **Tamamlandı** (`f4cfe7c`) |
| **TASK-15** | **Duolingo/Brilliant Tarzı 2x2 Tactile Bento Ana Sayfa & Görsel Ders Kartları** | `HomeScreen`'de düz liste yerine **Kadro Koçu** konuşma balonu + **2x2 Tactile Bento Grid** çalışma kutuları, `LessonsScreen`'de soru ağırlık barlı 3D ders kartları | ✅ **Tamamlandı** (`d6738a7`) |
| **TASK-16** | **Canlı Kadro Koçu Sahne Entegrasyonu (`QuizResultScreen`, `MistakesScreen`, `PaywallScreen`, `ProfileScreen`)** | Sınav karnesinde **Zafer (`victory`)**, Yanlış Defteri'nde **Dedektif (`detective`)**, Kadro PRO ekranında **Kraliyet Taçlı (`pro`)** maskot sahneleri | ✅ **Tamamlandı** (`3dede1b`) |
| **TASK-17** | **Havada Duran (Floating Pill) Alt Menü (`AppNavigationBar`) & Sinematik Gradient/Pop-Out `MascotCoachBanner`** | Standart alt bar yerine iOS/Linear tarzı havada asılı kapsül alt menü, `MascotCoachBanner` içinde Derin İndigo Gradient arka plan, dekoratif ışık halkaları ve `96x96` büyük Pop-Out maskot sahnesi | ✅ **Tamamlandı** (`7442b77`) |
| **TASK-18** | **Super-App Ana Sayfa (`HomeScreen`) — Dairesel Hedef Halkası (`Circular Gauge`) & Canlı Rozetli Gradient Bento Kartları** | `_DailyGoalCard` içinde `84x84` dairesel ilerleme halkası (`CircularProgressIndicator` gauge) + mini metrik hapları, 2x2 Bento kartlarında duotone/gradient yüzey ve `'65 Dakika'` / `'Başla →'` aksiyon rozetleri | ✅ **Tamamlandı** (`5739510`) |
| **TASK-19** | **Duolingo Tarzı "Konu Yol Haritası (Learning Path / Skill Tree)" (`LessonTopicsScreen`) & Zengin Modül Kartları (`LessonsScreen`)** | `LessonTopicsScreen` içindeki düz `ListTile` listesini kaldırıp dikey bağlantılı düğümlerden (`01`, `02`, `03`...) oluşan **Duolingo Yol Haritası**'na dönüştürme ve `LessonsScreen` modül kartlarını zenginleştirme | ✅ **Tamamlandı** (`02ac8cf`) |
| **TASK-20** | **Akıllı KPSS Çalışma Planlayıcı Veri Katmanı (`StudyTask` Modeli & `StudyPlannerNotifier` Riverpod State)** | Ders etiketli (`Tarih`, `Coğrafya` vb.), tahmini süreli (`15-65 dk`) ve doğrudan aksiyon tipli (`quiz`, `flashcards`, `mistakes`, `custom`) görev modeli + Riverpod state yönetimi ve birim testleri | ✅ **Tamamlandı** (`62b378c`) |
| **TASK-21** | **Hibrit Çalışma Planlayıcı Arayüzü (`HomeDailyPlanCard` + Tam Ekran `StudyPlannerScreen` + Hazır Şablonlar & "Başla ▶")** | `HomeScreen`'de anında tiklenebilen **"Bugünün Çalışma Planı"** kompakt widget'ı, tam ekran `StudyPlannerScreen` (`/planner`), tek tıkla hazır KPSS görev şablonları ve görevden doğrudan teste geçiren **"Başla ▶"** aksiyonu | ✅ **Tamamlandı** (`df884d2`) |
| **TASK-22** | **Etkileşimli Oyun Modu 1: "60 Saniyede Pençe" Doğru / Yanlış Hızlı Düello (`TrueFalseBlitzScreen`)** | 60 saniye geri sayımlı, kombo çarpanlı (`2x`, `3x`, `5x Kombo!`) ve anlık çözüm açıklamalı KPSS Doğru/Yanlış hızlı düello modu | ✅ **Tamamlandı** (`c7a463d`) |
| **TASK-23** | **Etkileşimli Oyun Modu 2: "Kavram Eşleştirme Tahtası" (`ConceptMatchScreen`) & `HomeScreen` Oyun Vitrini** | Quizlet Match tarzı 4'e 4 Tarih/Coğrafya/Vatandaşlık kavram eşleştirme tahtası ve `HomeScreen` üzerine **"Etkileşimli Mini Oyunlar"** Bento vitrini | ✅ **Tamamlandı** (`5e32ae6`) |
| **TASK-24** | **Güçlü Raporlama & Retention: Çözülen Testler Arşivi (`QuizSessionRecord`), Ustalık Isı Haritası & XP/Lig Sistemi** | Supabase şemasına uyumlu çözülen testler geçmişi (`QuizHistoryScreen`), Ders Ustalık Isı Haritası (`Usta`/`Gelişiyor`/`Kritik`), soru başına ortalama süre analizi ve `Bronz -> Müsteşar Ligi` XP sistemi | ✅ **Tamamlandı** |
| **TASK-25** | **Supabase Kurulumu (`supabase_flutter`), Yapılandırma (`SupabaseConfig`) & Giriş / Kayıt Ekranı (`AuthScreen`)** | `supabase_flutter` entegrasyonu, `SupabaseConfig`, `AuthNotifier` (Giriş Yap / Kayıt Ol / Misafir Modu), `AuthScreen` (`/auth`) ve `ProfileScreen` hesap kartı | ✅ **Tamamlandı** |
| **TASK-26** | **Bulut Soru & Oyun Havuzu Entegrasyonu (`QuestionRepository` +Ders/Konu Filtreleme + Offline Fallback)** | Soruların (`multiple_choice`, `true_false`, `matching`) seçilen ders/konuya göre Supabase `public.questions` tablosundan çekilmesi ve çevrimdışı durumda yerel JSON/sample yedeğine düşmesi | ✅ **Tamamlandı** |
| **TASK-27** | **Bulut Raporlama & İlerleme Senkronizasyonu (`quiz_sessions`, `question_attempt_logs`, `user_topic_mastery`)** | Çözülen testlerin, soru bazlı doğru/yanlış ve süre loglarının, konu ustalık ısı haritasının ve kullanıcı XP/Seri verilerinin Supabase PostgreSQL tablolarına kaydedilmesi ve giriş yapıldığında buluttan geri yüklenmesi | ✅ **Tamamlandı** (`c9daabc`) |
| **TASK-28** | **Çalışma Planlayıcı (`public.study_tasks`) & Konu Ustalık Matrisi (`public.user_topic_mastery`) Bulut Senkronizasyonu** | `StudyTask` serileştirmesi (`toMap`/`fromMap`), `CloudSyncRepository` üzerinden günlük görevlerin ve konu bazlı ustalık yüzdelerinin Supabase tablolarına senkronize edilmesi | ✅ **Tamamlandı** |
| **TASK-29** | **Bulut Destekli Mini Oyunlar (`TrueFalseBlitz` & `ConceptMatch` Supabase) + Test Oturumu Detay Ekranı (`QuizSessionDetailScreen`)** | Mini oyunların Supabase `public.questions` (`true_false` & `matching`) tablosundan beslenmesi, oyun sonuçlarının arşive kaydedilmesi ve arşivdeki testlere tıklanınca detaylı karne analiz ekranının (`QuizSessionDetailScreen`) açılması | ✅ **Tamamlandı** |
| **TASK-30** | **3 Adımlı Kişiselleştirilmiş KPSS Hedef Sihirbazı (`OnboardingScreen`) & Odak Ders Koçluğu** | Kadro Koçu eşliğinde Hedef KPSS Puanı (`80+`, `85+`, `90+`), Odak Ders ve Günlük Soru Hedefi seçimi (`OnboardingScreen`), seçilen odak derse göre otomatik çalışma görevi ataması ve `ProfileScreen` hedef kartı | ✅ **Tamamlandı** (`c27bb9c`) |
| **TASK-31** | **Yüksek Kontrastlı Renk Paleti (`AppTheme`), Opak Yüzeyli `TactileCard` & Ferah `MascotCoachBanner` Revizyonu** | `TactileCard` içindeki şeffaf zemin + `BoxShadow` renk sızması hatasının `Color.alphaBlend` ile giderilmesi, `AppTheme` içinde `secondary` rengin siyah (`#0F172A`) yerine canlı Zümrüt/Teal (`#0D9488`) yapılması, `on*Container` WCAG AAA kontrast çiftlerinin tanımlanması ve `MascotCoachBanner`'ın yüksek okunaklı yüzeye kavuşturulması | ✅ **Tamamlandı** |
| **TASK-32** | **`HomeScreen` Bento Kartları & `LessonsScreen` / `LessonTopicsScreen` Kart Kontrast ve Renk Uyumu Düzeltmesi** | `HomeScreen` 2x2 Bento ve Mini Oyun kartlarındaki kirli yarı-saydam arka planların kaldırılıp saf opak kart zemini (`surface`) + yüksek kontrastlı `Container/onContainer` rozet çiftlerine geçilmesi, `LessonsScreen` ve `LessonTopicsScreen` kartlarının netleştirilmesi | ✅ **Tamamlandı** |
| **TASK-33** | **`QuizScreen`, `FlashcardsScreen`, `StatsScreen`, `ProfileScreen` & Oyun Ekranları Kart Bütünlüğü ve Kontrast Cilası** | Tüm ekranlardaki düz `Card` ve `TactileCard` bileşenlerinde yazı (`onSurface` / `onSurfaceVariant` / `on*Container`) ve arka plan (`surface` / `*Container`) uyumunun %100 standartlaştırılması | ✅ **Tamamlandı** (`1f77473`) |
| **TASK-34** | **Kritik Mimari & Gelir Düzeltmesi: Günlük Soru Limiti vs Hedef Ayrımı & Gün Dönümü Sıfırlama** | `UserPreferencesNotifier` içinde `targetDailyStudyGoal` ile `dailyFreeQuestionLimit` (30 soru) ayrımı, `StudyStatsNotifier` içinde gün dönümü (`lastStudyDate`) kontrolü ve `ProfileScreen` hedef kartı | ✅ **Tamamlandı** (`885351a`) |
| **TASK-35** | **Supabase Güvenliği (RLS) & Haftalık Liderlik Tablosu RPC Fonksiyonu (`docs/supabase_schema.sql` + `CloudSyncRepository`)** | `profiles` tablosunda `is_pro` kısıtlaması, `get_weekly_leaderboard()` RPC fonksiyonu ve `markMistakeResolved` bulut senkronizasyonu | ✅ **Tamamlandı** (`64b6532`) |
| **TASK-36** | **Zengin Deneme Sınavı Merkezi (`ExamsScreen` Prova Paketleri) & `QuizScreen` Tam Havuz (`fetchAllFromPool`) Bağlantısı** | `ExamsScreen` içine 3 farklı deneme paketi (Türkiye Geneli 65 Dk Prova, Tarih & Coğrafya Kamp Denemesi, 15 Dk Hızlı Mola Denemesi) eklenmesi ve `QuizScreen` üzerinden tüm soru havuzunun çekilmesi | ✅ **Tamamlandı** |
| **TASK-37** | **Ders Filtreli Hap Bilgi Kartları (`FlashcardsScreen` + 4 Ders + XP Kazanımı)** | `sample_flashcards.dart` zenginleştirmesi, `FlashcardsScreen` içine 4 ders filtresi ve öğrenilen kart başına `+15 XP` ödülü eklenmesi | ✅ **Tamamlandı** |
| **TASK-38** | **KPSS Başarım Rozetleri (`Achievements`) & Haftalık Kadro Lig Sıralaması (`Leaderboard` — `StatsScreen`)** | `StatsScreen` üzerine 4 KPSS Başarım Rozeti (`İlk Pençe`, `Keskin Nişancı`, `Deneme Fatihi`, `Gümüş Kadro`) ve RPC destekli Liderlik Tablosu kartı | ✅ **Tamamlandı** |
| **TASK-39** | **Kalıcı Yerel Depolama Katmanı (`LocalStorageService` + `shared_preferences`)** | Misafir modunda dahi XP, Seri, Günlük Soru Sayısı, Hedefler, Yanlış Defteri ve Çalışma Planı verilerinin cihazda kalıcı saklanması | ✅ **Tamamlandı** |
| **TASK-40** | **Kadro PRO 3'lü Paywall & RevenueCat (`purchases_flutter`) Entegrasyonu** | Aylık (89 ₺), İndirimli Yıllık (499 ₺) ve Sınava Kadar Tek Seferlik (349 ₺) satın alma ve PRO durum senkronizasyonu | ✅ **Tamamlandı** |
| **TASK-41** | **AdMob Ödüllü Video Reklam Motoru (`google_mobile_ads`)** | Günlük 30 soru limiti bittiğinde izlenen reklam ile +20 soru hakkı kazandıran gerçek AdMob Rewarded Ad motoru | ✅ **Tamamlandı** |
| **TASK-42** | **200 Soruluk Zengin Çekirdek KPSS Genel Kültür Havuzu** | Tarih (50), Coğrafya (50), Vatandaşlık (50), Güncel Bilgiler (50) özgün soru JSON ve Supabase seed verisinin oluşturulması | ✅ **Tamamlandı** |
| **TASK-43** | **Akıllı Çalışma Bildirimleri (`flutter_local_notifications`) & Çökme Takibi (`sentry_flutter`)** | Günlük soru çözme ve seri koruma bildirimleri ile Sentry hata takip entegrasyonu | ✅ **Tamamlandı** |
| **TASK-44** | **`QuizScreen` İki Yönlü Soru Gezintisi (Önceki/Sonraki Soru) & Zarif Yanlış Bildirimi** | Test içinde geriye doğru 1'e kadar ve ileriye doğru en son soruya gidebilme (`_userAnswers` geçmişi) + İlk yanlışta tek seferlik dismissible Koç bilgilendirme kartı | ✅ **Tamamlandı** (`64b1a2b`) |
| **TASK-45** | **`MistakesScreen` Ders Bazlı Filtreleme & Derse Özel Yanlış Çözüm Akışı** | Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler sekme/çip filtreleri, her dersin yanlış sayısı rozeti ve sadece seçilen dersin yanlışlarını test olarak başlatma | ✅ **Tamamlandı** (`ae86af6`) |
| **TASK-46** | **Kadro Çalışma Modları (Öğrenme/Anında Çözüm vs. Sınav/Gizli Çözüm & Zayıf Konu Testi)** | Anında doğru/yanlış gösteren öğrenme modu ile sonuçları karneye saklayan sınav modu; moda duyarlı geriye dönük şık değiştirme kuralı; zayıf konudan otomatik 10 soru çıkarma | ✅ **Tamamlandı** (`d62695b`) |
| **TASK-47** | **Hatalı Soru Raporlama & Yönetici İnceleme Paneli (`question_reports` + Supabase + UI)** | Test esnasında kullanıcının hatalı soruyu tek tıkla sebep ve notla bildirmesi (`ReportQuestionBottomSheet`); Supabase tablosu ve yöneticinin ders/test/soru bazlı inceleme ekranı | ✅ **Tamamlandı** (`d8b3b3a`) |
| **TASK-48** | **Canlı Soru Çözüm Modu Rozeti (`QuizScreen`) & Profil Mod Seçiminden Test Başlatma** | Soru ekranı AppBar'ına anında mod gösteren/değiştiren `_QuizModeBadge` eklenmesi ve Profil diyalogundan 'Bu Modla Hemen 10 Soru Çöz' butonuyla teste geçiş | ✅ **Tamamlandı** |
| **TASK-49** | **`QuizScreen` QuizMode Null-Safety & Geriye Dönük Uyumluluk Yaması (Hot-Reload / Web TypeError Fix)** | Web ve eski yerel depolama verilerinde `QuizMode` değerinin `null` dönmesiyle AppBar'da oluşan `TypeError: null is not a subtype of type QuizMode` hatasını gideren defansif kontrol ve yedekleme | ✅ **Tamamlandı** |
| **TASK-50** | **Kesintisiz Çalışma Döngüsü & Akıllı Sayfa İçi Yönlendirmeler (Zero Dead-Ends UX)** | Test karnesinde yanlış varsa tek tıkla Yanlış Defteri'ne yönlendirme; Yanlış Defteri boşken teste yönlendirme; Bilgi kartları bitince konu testine geçiş köprüsü | ✅ **Tamamlandı** |
| **TASK-51** | **"ÖSYM Çeldirici Tuzağı" (UWorld Modeli) Açıklama Formatı & Çözüm Kartı Revizyonu** | `Question` modeline `distractorTrap` eklenmesi, soru çözüm açıklaması içine altın/kehribar vurgulu '⚠️ ÖSYM Çeldirici Tuzağı' analizi ve örnek soruların zenginleştirilmesi | ✅ **Tamamlandı** (`84bbe59`) |
| **TASK-52** | **Instagram & WhatsApp Uyumlu 9:16 "Zafer Karnesi" Hikaye Paylaşım Kartı (`ShareVictoryCard`)** | Test sonu karnesinde tek tıkla açılan 9:16 Story formatında viral karne kartı, net/başarı özeti, Koç Tuğrul görseli, pano kopyalama ve native paylaşım köprüsü | ✅ **Tamamlandı** (`82a9429`) |
| **TASK-53** | **Çerçevesiz & Büyük Pop-Out Maskot Tasarımı ve Derse Özel Tuğrul Varyasyonları** | Tuğrul maskotunu 84x84'lük kısıtlayıcı kutudan çıkarıp büyük (100px) çerçevesiz pop-out yapıya kavuşturma; Tarih, Coğrafya, Vatandaşlık ve Güncel Bilgiler için 4 yeni tematik Tuğrul karakteri entegrasyonu | ✅ **Tamamlandı** |
| **TASK-54** | **Mağaza Yayın Hazırlığı (App Icon, Splash Screen & Production Release Setup)** | Tuğrul maskotundan Android/iOS adaptive app icon (`flutter_launcher_icons`), derin indigo açılış ekranı (`flutter_native_splash`), Android v2 embedding / app label ve release build altyapısı | ✅ **Tamamlandı** |
| **TASK-55** | **Kadro PRO Çevrimdışı Soru & Deneme İndirme Motoru (Offline-First Sync & Pro Paywall Kilidi)** | Sadece Kadro PRO üyelerine özel soru paketlerini ve denemeleri çevrimdışı kullanım için cihaza indirme (`OfflineDownloadService`), internet yokken indirilmemiş içerikte PRO Paywall yönlendirmesi | ✅ **Tamamlandı** |
| **TASK-56** | **"De-AI" Tasarım ve Renk Restorasyonu: Yapay Zeka Morundan Kurtulma, Prestijli Devlet & Akademi Laciverti (`#1E3A5F`) ve Pedagojik UI Standartları** | Jenerik Tailwind/ChatGPT AI morunun (`#4F46E5`, `#818CF8`) tamamen sökülmesi; yerine ciddi, saygın ve göz yormayan Devlet & Akademi Gece Laciverti (`#1E3A5F`) + Zümrüt Teal (`#0D9488`) + Tok Altın (`#D97706`) paletine geçiş; `LucideIcons.sparkles` parıltı ikon enflasyonunun ve neon/violet parıltıların temizlenmesi | ✅ **Tamamlandı** |
| **TASK-57** | **Gelişmiş Kimlik Doğrulama: Google ile Giriş (OAuth), E-posta / Kullanıcı Adı ile Esnek Giriş-Kayıt & Şifre Sıfırlama** | Tek tıkla Google ile Giriş (`signInWithOAuth`), tek alanda hem e-posta hem kullanıcı adı desteği, şık 'Şifremi Unuttum' modalı, misafir çalışma verilerini hesaba aktaran bulut birleştirme köprüsü | ✅ **Tamamlandı** |
| **TASK-58** | **Dikkat Çekici & Motive Edici Test Zorluk Rozetleri (Basit Alıştırma, Sınav Ayarı, Net Sıçratan, Kurtlar Sofrası / ÖSYM Tuzağı)** | Sıkıcı akademik zorluk etiketlerinin yerine adayın ilgisini çeken 4 seviyeli vurucu rozet sistemi ('Basit Alıştırma (Isınma)', 'Tam Sınav Ayarı', 'Net Sıçratan', 'Kurtlar Sofrası'); kart altı motive edici mini açıklamalar ve ColorScheme standardizasyonu | ✅ **Tamamlandı** |
| **TASK-59** | **Tüm Sistemde Duyarlı & Uyarlanabilir Ekran (Responsive & Adaptive) Mimarisi (Kompakt Telefon, Standart Telefon, Tablet & Katlanabilir)** | `ui-ux-pro-max` disipliniyle küçük ekranlar (<380px) için sıfır taşma (overflow), esnek padding/font ölçeklemesi ve kat altı koruması; tabletler (>=600px) için maxWidth kısıtı (720px) ve adaptif 3-4 sütunlu grid yapısı | ✅ **Tamamlandı** |
| **TASK-60** | **Ders Kartlarında Dairesel İlerleme Halkası (Animated Lesson Progress Ring) & Çözülen Test Oranı Göstergesi** | `LessonsScreen` ders kartlarındaki ikonların etrafına çözülen test / toplam test oranını gösteren animasyonlu dairesel ilerleme halkası (`LessonProgressRing`); kart içinde 'X / Y Test Tamamlandı' ve yüzde ilerleme rozeti | ✅ **Tamamlandı** |
| **TASK-61** | **UI Taşma (RenderFlex Overflow) ve Görsel Hata Düzeltme Paketi (Test Sonucu, Dersler, İstatistik, Paywall, Navbar & BottomSheet)** | Test Sonucu ekranındaki 83px dikey taşmanın `ListView` ile çözülmesi; Güncel Bilgiler ders kartındaki 6.1px taşmanın `Flexible`/`Wrap` ile çözülmesi; İstatistik çözülen testler başlığının `Expanded` ile sarılması; Paywall plan kartlarında `Wrap` düzeltmesi; AppNavigationBar 'Ana Sayfa' taşmasının kompakt padding ile giderilmesi; Hatalı soru bildirme BottomSheet'inde `clipBehavior: Clip.antiAlias` ile köşe sızıntısının önlenmesi | ✅ **Tamamlandı** |
| **TASK-62** | **UI & İçerik Sadeleştirme Paketi: Bilgi Kirliliğini Önleme, Gereksiz Rozet ve Tekrarların Temizlenmesi (Dersler, Konular, Konu Testleri)** | Tarih kartındaki '27 Soru · Kritik' rozetinin ve '7 Adımlı Yol Haritası' alt metninin kaldırılması; Konular ekranında mükerrer 'ADIM 1' rozeti ve 'Tarih · Konu Testi' metninin temizlenmesi; Konu testlerinde zorluk rozetlerindeki parantez içi açıklamaların, mükerrer 'Test 1' başlığının ve '10 Soru / 10 Soruluk Konu Testi' tekrarlarının temizlenmesi | ✅ **Tamamlandı** |
| **TASK-63** | **Proje Genelinde Standart Spacing & Padding/Margin Sistemi (AppSpacing Tokens & Zero-Shift Sayfa Geçişleri)** | Uygulamadaki dağınık padding ve marginlerin (10, 14, 16, 20, 24px) 8pt/4pt sisteminde `AppSpacing` design token sınıfına bağlanması; 5 ana tab ekranında (Home, Lessons, Exams, Stats, Profile) kenar dolgularının ve üst/alt aralıkların eşitlenerek sayfa geçişlerindeki zıplamaların (Zero Layout Shift) önlenmesi | ✅ **Tamamlandı** |
| **TASK-64** | **Yanlış Defteri 59px Taşma Düzeltmesi & Çevrimdışı İndirme UI/UX Dönüşümü (Zarif & Sade İndirme Modeli)** | Yanlış Defteri boş durumundaki butonların dar ekranda taşmasını önleyen `Wrap` düzeltmesi; her test/konu kartındaki göz yoran büyük 'İndir' butonlarının kaldırılarak Spotify/Duolingo stili zarif minimal rozet/mikro-ikon modeline geçilmesi ve üst başlığa 'Tümünü İndir' opsiyonunun eklenmesi | ✅ **Tamamlandı** |
| **TASK-65** | **Profil Ekranı Evrimi: Aday Kimlik Kartı, KPSS 2026 Geri Sayımı, Lig & Başarı Rozetleri Vitrini ve Bulut Eşitleme Merkezi** | Profil ekranının sıradan bir 'Ayarlar' listesi olmaktan çıkarılıp Duolingo/UWorld seviyesinde zenginleştirilmesi: Aday kimliği & avatarı, hedef puan & atama rotası, canlı 2026 KPSS geri sayımı, 4'lü metrik snapshot'ı (Seri, Soru, Net %, XP), Lig & Unvan vitrini, 6 adet motivasyon madalyası ve modern hesap ayarları | ✅ **Tamamlandı** |
| **TASK-66** | **Bağımsız Çalışma Türleri & Antrenman Ekranı (`PracticeHubScreen`), Zenginleştirilmiş Alt Menü (`AppNavigationBar`) ve Görev Hatırlatıcılı Yeni Ana Sayfa** | Çalışma türlerinin (Konu Testi, Bilgi Kartları, Yanlış Defteri, Deneme, Mini Oyunlar, Çeldirici Avı) ana sayfadan ayrılıp bağımsız 'Pratik' sekmesine (`PracticeHubScreen`) taşınması; `AppNavigationBar`'ın 6 sekmeli zengin ve taşmasız dock yapısına yükseltilmesi; `HomeScreen`'in görev hatırlatıcıları, seri uyarıları, son kalınan yer ve günlük çalışma planı odaklı kişisel komuta merkezine dönüştürülmesi | ✅ **Tamamlandı** |
| **TASK-67** | **Özgün İkon Mimarisi Dönüşümü: Sıradan Lucide İkonlarından `phosphor_flutter` (Duotone, Fill & Bold) Karakteristik İkon Sistemine Geçiş** | Her projede kullanılan sıradan tek çizgili `LucideIcons` ve `Icons.*` kullanımlarının kaldırılarak `phosphor_flutter` paketine geçilmesi; kart ve rozetlerde çift katmanlı `PhosphorIconsDuotone`, alt menü aktif sekmelerinde tok dolgulu `PhosphorIconsFill`, pasif sekme ve aksiyonlarda `PhosphorIconsBold` kullanılması | ✅ **Tamamlandı** |
| **TASK-68** | **"Tuğrul Evreni" Maskot Çeşitlendirme (12 Özgün Karakter Modu), Etkileşimli Dokun-Konuş (`Tap-to-Inspire`) ve Dinamik Mood Aurası** | Kopya maskot görsellerinin yerine `image-generator` ile Tarihçi, Kâşif, Hukukçu, Haberci, Antrenör, Baş Gözetmen, Analist ve Ateşli Seri Tuğrul illüstrasyonlarının üretilmesi; `MascotCoachBanner` bileşeninin üzerine dokunulduğunda zıplayıp derse/ekrana özel KPSS strateji tüyoları veren etkileşimli (`StatefulWidget`) yapıya ve mood bazlı dinamik aura renklerine yükseltilmesi | ✅ **Tamamlandı** (`ede6127`) |
| **TASK-69** | **`AppTopBar` / `AppBar` Uzun Başlık Taşması (Overflow) Düzeltmesi & Pratik Sekmesi Akademik İkon/Maskot/Söylem Revizyonu (Oyun Kolu İkonunun Kaldırılması)** | `AppTopBar` içindeki sayfa başlığı (`Row` -> `Text`) sığmadığında oluşan `RenderFlex overflow` hatasının `Flexible` + `TextOverflow.ellipsis` ve kompakt font ölçeklemesiyle giderilmesi; diğer tüm `AppBar` başlıklarının taşmaya karşı korunması; Pratik sekmesindeki ve `MascotMood.practice` modundaki `gameController` (oyun kolu) ikonunun ve oyun söylemlerinin kaldırılarak ciddi akademik hedef/antrenman (`PhosphorIconsBold.target` / `PhosphorIconsFill.target`) ikonuna ve soru çözüm odaklı Tuğrul görseline dönüştürülmesi | ✅ **Tamamlandı** (`865e05f`) |
| **TASK-70** | **Sonuç Ekranlarında "Tek Bakışta Sıfır Kaydırma" (`Zero-Scroll Single-Viewport`) Kompakt UI/UX Dönüşümü (`QuizResultScreen`, `_BlitzSummaryView`, `_FlashcardsSummaryView`)** | Test Sonu Karnesi (`QuizResultScreen`), 60 Saniyede Pençe Özeti (`_BlitzSummaryView`) ve Bilgi Kartları Özeti (`_FlashcardsSummaryView`) ekranlarındaki aşırı büyük kart dolgularının (`padding: 24`), devasa fontların (`displayMedium` / `headlineMedium`) ve geniş boşlukların (`gapLg`) kompaktlaştırılması; tüm skorların ve aksiyon butonlarının kullanıcıya scroll yaptırmadan tek ekranda görünmesi | ✅ **Tamamlandı** (`9862149`) |
| **TASK-71** | **Mobil Ekranlar İçin `AppBar` ve Alt Detay Sayfası Başlık Tipografisi Ölçeklemesi (Kesilmeleri Önleyen Kompakt Başlık Sistemi)** | M3 varsayılan `22px` (`titleLarge`) `AppBar` başlıklarının Türkçe ders/konu adlarında (`'Tarih Konuları'`, `'Güncel Bilgiler Konuları'`, `'İslamiyet Öncesi Türk Tarihi'`) aşırı büyük durup kesilmesini (`...`) önlemek için global `AppBarTheme` başlık stilinin (`16px`), `titleSpacing: 0` boşluğunun, `TopicTestsScreen` / `LessonTopicsScreen` / `QuizScreen` / `AppTopBar` ve `MascotCoachBanner` başlık boyutlarının mobil ekranlara uygun zarif ölçeğe çekilmesi | ✅ **Tamamlandı** (`d8f663b`) |
| **TASK-72** | **Proje Genelinde Standart Tipografi & Font-Size Ölçek Sistemi (`AppTheme` 12 Seviyeli Modüler Tipografi Standardı & Sıfır Hardcoded `fontSize`)** | `lib/app/theme.dart` içinde `displayLarge`'dan `labelSmall`'a kadar tüm 15 M3 metin stilinin birbiriyle uyumlu matematiksel mobil ölçeğe (`28 / 22 / 19 / 17 / 15.5 / 14 / 15 / 13.5 / 12 / 13 / 11.5 / 10.5 px`) bağlanması; `lib/app/theme.dart` dışındaki tüm ekranlarda dağınık `fontSize:` ezme (override) kullanımlarının temizlenmesi ve ekranlar arası başlık/kart/metrik tipografi rollerinin standartlaştırılması | ✅ **Tamamlandı** (`57c0804`) |
| **TASK-73** | **`ui-ux-pro-max` Mobil Tipografi (`Base 16px`: `28-24-20-18-16-15-14-12-11 px`) ve 3 Kademeli Padding Hiyerarşisi Revizyonu** | Küçük kalan başlık ve gövde yazılarının iOS HIG / Material 3 / `ui-ux-pro-max` gerçek mobil ölçeğine (`titleLarge: 18px`, `titleMedium: 16px`, `titleSmall: 15px`, `bodyLarge: 16px`, `bodyMedium: 14px`, `bodySmall: 12px`, `labelLarge: 14px`, `labelMedium: 12px`, `labelSmall: 11px`) yükseltilmesi; `SectionTitle` (`18px`), `LessonsScreen` (`18px`), `MascotCoachBanner` (`16px` başlık + `14px` konuşma balonu), `PracticeHubScreen` (`15px` başlık + `14px` padding) ve `LessonTopicsScreen` (`16px` kesilmeyen başlık) hiyerarşisinin uygulanması | ✅ **Tamamlandı** (`b77e3f8`) |
| **TASK-74** | **Dikey Hizalama & Kenar Kılavuz Çizgisi Standardizasyonu (`AppTopBar`, `Body`, `SectionTitle`, `AppNavigationBar` ve `AppBarTheme` Sol/Sağ Flush Alignment)** | `AppBarTheme` içindeki `titleSpacing: 4` nedeniyle üst barın (`AppTopBar`) sol kenarının `4px`'ten başlayıp alt gövdenin (`16px`) dışına taşması hatasının düzeltilmesi; `AppTopBar` sol `titleSpacing` ve sağ `actions` boşluğunun, `SectionTitle` sol hizasının (`horizontal: 0`) ve `AppNavigationBar` yan boşluklarının `ResponsiveBreakpoints.horizontalPadding(context)` (`12px / 16px / 24px`) ile milimetrik olarak aynı dikey hizaya getirilmesi | ✅ **Tamamlandı** (`01178d3`) |
| **TASK-75** | **Çözülen Test / Konu / Deneme Kartlarında Tamamlanma Durumu (`✅ Çözüldü` Rozeti, Son Net Özeti & `Tekrar Çöz` Aksiyonu) + Konu Kartı İndir İkonlarının ve Test Kartı Gereksiz Açıklamalarının Temizlenmesi** | Kullanıcı bir testi veya denemeyi bitirdiğinde (`studyStatsProvider.sessionHistory`), uygulamaya tekrar girdiğinde `TopicTestsScreen`, `LessonTopicsScreen` ve `ExamsScreen` kartlarında zümrüt yeşili kenarlık/arka plan tonu, `✅ Çözüldü · XD YY (Z.Z Net)` rozeti ve `Tekrar Çöz` butonunun gösterilmesi; `LessonTopicsScreen` konu kartlarındaki tekil indirme ikonlarının kaldırılıp sadece üstteki `Tümünü İndir` butonunun bırakılması; `TopicTestsScreen` test kartlarındaki mükerrer seviye başlığı ve `'Konuyu yeni bitirdiysen...'` açıklama metinlerinin kaldırılması | ✅ **Tamamlandı** |
| *[GELECEK FAZ]* | **"Pazar 20:00" Türkiye Geneli Canlı KPSS Denemesi (Canlı Etkinlik)** | Tüm adayların aynı anda başladığı, canlı geri sayımlı Türkiye sıralaması çıkaran eş zamanlı canlı deneme ekranı | ⏸️ **Kullanıcı Kesin Onayı Bekleniyor (İleri Faz)** |

---

## 🤖 3. Alt Ajana Verilecek Detaylı Görev Paketleri

Alt ajanın **hiçbir mimari karar almadan** doğrudan uygulayabilmesi için her dosya yolunu, sınıf adını ve metot imzasını net olarak yazdım. Sırayla kopyalayıp alt ajana verebilirsin.

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

### 🔮 [GELECEK FAZ] "Pazar 20:00" Türkiye Geneli Canlı KPSS Denemesi (Canlı Etkinlik)

- **Sıra No:** *Sıra No'suz (İleri Faz)*
- **Durum:** ⏸️ **Kullanıcı Kesin Onayı Bekleniyor (İleri Faz)**
- **Açıklama:**
  - Kullanıcı kararıyla şimdilik uygulanmayacak, projenin ileri aşamalarına ertelenmiştir.
  - **Kullanıcıdan kesin onay alınmadan bu göreve başlanmayacaktır.**
  - **Kapsam Özeti:** Her hafta belirlenen gün/saatte tüm KPSS adaylarının aynı anda başladığı, canlı geri sayımlı, süresi bitince otomatik toplanan ve Türkiye geneli canlı sıralama çıkaran eş zamanlı sınav motoru ve etkinlik ekranı.
