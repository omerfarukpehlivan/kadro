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
| **TASK-22** | **Etkileşimli Oyun Modu 1: "60 Saniyede Pençe" Doğru / Yanlış Hızlı Düello (`TrueFalseBlitzScreen`)** | 60 saniye geri sayımlı, kombo çarpanlı (`2x`, `3x`, `5x Kombo!`) ve anlık çözüm açıklamalı KPSS Doğru/Yanlış hızlı düello modu | ⏳ **Sırada (Dalga 8)** |
| **TASK-23** | **Etkileşimli Oyun Modu 2: "Kavram Eşleştirme Tahtası" (`ConceptMatchScreen`) & `HomeScreen` Oyun Vitrini** | Quizlet Match tarzı 4'e 4 Tarih/Coğrafya/Vatandaşlık kavram eşleştirme tahtası ve `HomeScreen` üzerine **"Etkileşimli Mini Oyunlar"** Bento vitrini | ⏳ **Sırada (Dalga 8)** |
| **TASK-24** | **Güçlü Raporlama & Retention: Çözülen Testler Arşivi (`QuizSessionRecord`), Ustalık Isı Haritası & XP/Lig Sistemi** | Supabase şemasına uyumlu çözülen testler geçmişi (`QuizHistoryScreen`), Ders Ustalık Isı Haritası (`Usta`/`Gelişiyor`/`Kritik`), soru başına ortalama süre analizi ve `Bronz -> Müsteşar Ligi` XP sistemi | ⏳ **Sırada (Dalga 8)** |

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
