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
| **TASK-04** | **Çoklu Soru İlerlemesi & Test Sonu Karnesi (`QuizResultScreen`)** | JSON'dan gelen sorularla çoklu soru akışı (`1 / N`), test bitiminde Doğru/Yanlış/Boş ve **Genel Kültür Neti** özet ekranı | ✅ **Tamamlandı** (`9fb5827`) |
| **TASK-05** | **Hap Bilgi Kartları (`FlashcardsScreen`)** | `AnimatedSwitcher` ile ön/arka yüz dönen bilgi kartları, "Öğrendim / Tekrar Et" sayaçları ve Ana Sayfa bağlantısı | 🟢 **Başlamaya Hazır** |

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
