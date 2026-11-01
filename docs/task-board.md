# 🧠 Kadro (KPSS Lisans Genel Kültür) — Kesinleşmiş Mimari & Alt Ajan Görev Panosu

## 📌 1. Kesinleşen Mimari ve Ürün Kararları (Anayasamız)

Projemizin temel direkleri ([GEMINI.md](file:///d:/projelerim/gunisigi/GEMINI.md) içinde de kayıtlıdır):

1. **Ürün Odağı (Niş & Yüksek Dönüşüm):**
   - **Sadece KPSS Lisans Genel Kültür (60 Soru / 65 Dakika):**
     - **Tarih:** 27 Soru
     - **Coğrafya:** 18 Soru
     - **Vatandaşlık:** 9 Soru
     - **Güncel Bilgiler:** 6 Soru
2. **Backend & Veri Mimarisi:**
   - **Aşama 1:** Local JSON + Bellek İçi (In-Memory / Mock) Repository. Çevrimdışı veritabanı (`sqflite`/`hive`) şimdilik **kullanılmayacak**.
   - **Aşama 2:** **.NET Web API + PostgreSQL (Supabase DB)**. Flutter tarafında Repository Pattern kullandığımız için API'ye geçerken ekran kodları hiç değişmeyecek.
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
| **TASK-09** | **Faz 8: `flutter_riverpod` + Canlı Hedef & İstatistik** | Çözülen soruların global state ile takibi; Ana Sayfa `Bugünkü hedefin (X / 30)` ve `StatsScreen` ekranının gerçek verilerle canlanması | ✅ **Tamamlandı** |
| **TASK-10** | **Para Kazanma (Kadro PRO Paywall & Ödüllü Reklam) + Profil Ayarları** | Günlük 30 soru limiti dolunca çıkan *"Reklam İzle (+20 Soru) / Kadro PRO"* ekranı, `ProfileScreen`'de Açık/Koyu Tema ve Hedef seçimi | 🟢 **Başlamaya Hazır** |

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



