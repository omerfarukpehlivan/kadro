# KPSS GY Türkçe Soru Havuzu — Bağımsız Denetim Raporu (Aşama A)

**Denetim Tarihi:** 2026-11-21  
**Kapsam:** `docs/soru_havuzu/turkce/` altındaki 25 tekil `.sql` dosyasında yer alan **530 özgün soru** *(Not: `00_tum_turkce_sorulari_tek_dosya.sql`, `01_`–`11_` arası 11 dosyanın birebir birleşimidir; 110 soru içerir ve ayrı soru olarak sayılmamıştır. Aynı veritabanına hem `00_` hem `01_`–`11_` yüklenirse 110 soru çiftlenir.)*  
**Soru ve Konu Dağılımı Doğrulaması:** 530 sorunun tamamında `lesson = 'Türkçe'`, `question_type = 'multiple_choice'`, 5 seçenek (A–E) ve resmî `topic` adları harfi harfine uyumludur. Doğru şık dağılımı dengelidir (A: 105, B: 106, C: 107, D: 106, E: 106). Zorluk dağılımı: `1` (94), `2` (260), `3` (176).  
**Telif / Özgünlük Kontrolü Notu:** Onaylı DOCX kaynaklarıyla (`57- deneme sınavı 2.docx`, `77- deneme sınavı - 3.docx`, `87- deneme sınavı 4.docx`) 6-gram düzeyinde metin karşılaştırmasında yalnızca standart ÖSYM soru kökleri eşleşmiş, parça/içerik kopyalanması görülmemiştir. Yerel ortamda `pdftotext` veya Python PDF kütüphanesi kurulu olmadığı için onaylı PDF kaynaklarıyla otomatik tam metin karşılaştırması yapılamamıştır (**emin değilim** — yalnızca biçim ve üslup üzerinden incelendi).

---

## 1. Özet Tablo

| Dosya Adı | Soru Sayısı | Sorunlu Soru Sayısı |
|---|---:|---:|
| `00_tum_turkce_sorulari_tek_dosya.sql` | *(110 — `01`–`11` tekrarı)* | *(Bkz. `01`–`11`)* |
| `01_sozcukte_anlam.sql` | 10 | 0 |
| `02_cumlede_anlam.sql` | 10 | 0 |
| `03_paragrafta_anlam_ve_yapi.sql` | 10 | 0 |
| `04_sozcukte_yapi_ve_ekler.sql` | 10 | 0 |
| `05_sozcuk_turleri.sql` | 10 | 0 |
| `06_ses_bilgisi_ve_ses_olaylari.sql` | 10 | 2 |
| `07_yazim_kurallari.sql` | 10 | 0 |
| `08_noktalama_isaretleri.sql` | 10 | 4 |
| `09_cumlenin_ogeleri_ve_cumle_turleri.sql` | 10 | 1 |
| `10_anlatim_bozukluklari.sql` | 10 | 2 |
| `11_sozel_mantik_ve_muhakeme.sql` | 10 | 3 |
| `cumlede_anlam_01_parti.sql` | 30 | 6 |
| `cumlede_anlam_02_parti.sql` | 30 | 7 |
| `dilbilgisi_01_parti.sql` | 30 | 12 |
| `karma_01_yazim_noktalama_sozcuk_mantik.sql` | 30 | 6 |
| `paragraf_01_parti.sql` | 30 | 2 |
| `paragraf_02_parti.sql` | 30 | 1 |
| `paragraf_03_parti.sql` | 30 | 1 |
| `paragraf_04_parti.sql` | 30 | 2 |
| `paragraf_05_parti.sql` | 30 | 3 |
| `paragraf_06_parti.sql` | 30 | 2 |
| `paragraf_07_parti.sql` | 30 | 4 |
| `sozcukte_anlam_01_parti.sql` | 30 | 3 |
| `sozel_mantik_01_parti.sql` | 30 | 11 |
| `zor_01_parti.sql` | 30 | 5 |
| **Toplam (Tekil Havuz)** | **530** | **77** |

---

## 2. Öncelik 1 — Cevabı Hatalı, Doğru Şıkkı Olmayan veya Birden Çok Doğrusu Bulunan Sorular

### 1. `06_ses_bilgisi_ve_ses_olaylari.sql` (#6)
- **İlk 8 kelime:** `Aşağıdaki sözcüklerden hangisi küçük ünlü uyumuna uymaz?`
- **Sorun türü:** Cevap hatalı (doğru şık yok) / TDK kuralı hatası
- **Gerekçe:** Seçenekler `oda`, `kuzu`, `oyun`, `odun`, `kutu` sözcükleridir ve doğru cevap A (`oda`) olarak işaretlenmiştir. Ancak küçük ünlü uyumuna göre yuvarlak ünlülerden (`o, ö, u, ü`) sonra ya düz-geniş (`a, e`) ya da dar-yuvarlak (`u, ü`) ünlüler gelir; dolayısıyla `oda` (`o → a`) küçük ünlü uyumuna uyar ve şıkların hiçbirinde kural ihlali yoktur.
- **Önerilen düzeltme:** `oda` yerine `o/ö` veya `u/ü` sonrasında `ı, i, o, ö` gelen gerçek bir aykırı sözcük (ör. `horoz`, `motor`, `radyo`, `karpuz` değil — ör. `horoz`: `o → o`, `kamyon`: `a → o`, `tavuk`: `a → u` veya `yağmur`: `a → u`) konulmalı ve `explanation` düzeltilmelidir.

### 2. `dilbilgisi_01_parti.sql` (#3)
- **İlk 8 kelime:** `Aşağıdaki sözcüklerden hangisi küçük ünlü uyumuna uyar?`
- **Sorun türü:** Birden çok doğru (5 şıkkın tamamı doğru) / TDK kuralı hatası
- **Gerekçe:** Seçenekler `oda`, `odun`, `gömlek`, `kolay`, `dolap` sözcükleridir ve yalnızca B (`odun`) doğru sayılmıştır. Açıklamada *"yuvarlak ünlüden sonra düz geniş ünlü (a, e) gelirse uyum bozulur"* denmektedir; oysa TDK'ya göre yuvarlak ünlüden sonra düz-geniş (`a, e`) gelmesi kurala uygundur, yani beş sözcüğün tamamı küçük ünlü uyumuna uyar.
- **Önerilen düzeltme:** Dört çeldirici `horoz`, `kamyon`, `tavuk`, `kalorifer` gibi küçük ünlü uyumuna gerçekten uymayan sözcüklerle değiştirilmeli ve açıklama TDK kuralına göre yeniden yazılmalıdır.

### 3. `06_ses_bilgisi_ve_ses_olaylari.sql` (#9)
- **İlk 8 kelime:** `Aşağıdaki sözcüklerden hangisinde ünsüz benzeşmesi vardır?`
- **Sorun türü:** Birden çok doğru
- **Gerekçe:** Doğru cevap D (`kitapçı` ← `kitap-cı`) olarak işaretlenmiştir; ancak A şıkkındaki `çalışkan` (`çalış-gan` → `çalışkan`) sözcüğünde de aynı ünsüz benzeşmesi (sertleşme) vardır.
- **Önerilen düzeltme:** A şıkkındaki `çalışkan` sözcüğü sertleşme içermeyen bir sözcükle (ör. `sevecen`, `durgun`, `olgun`) değiştirilmelidir.

### 4. `08_noktalama_isaretleri.sql` (#9)
- **İlk 8 kelime:** `Aşağıdaki cümlelerin hangisinde noktalama yönünden bir yanlışlık yoktur?`
- **Sorun türü:** TDK hatası / Cevap hatalı (doğru şık yok)
- **Gerekçe:** Doğru sayılan D şıkkında `"Yarın erkenden yola çıkacağız," dedi.` yazımı kullanılmıştır. TDK kurallarına göre tırnak içine alınan alıntı cümlenin sonundaki virgül tırnağın **içine** değil **dışına** konur (veya cümlenin kendi noktası tırnak içinde kalır: `"Yarın erkenden yola çıkacağız." dedi.` ya da `"Yarın erkenden yola çıkacağız", dedi.`).
- **Önerilen düzeltme:** D şıkkı `"Yarın erkenden yola çıkacağız." dedi.` veya `"Yarın erkenden yola çıkacağız", dedi.` biçiminde düzeltilmelidir.

### 5. `cumlede_anlam_02_parti.sql` (#19)
- **İlk 8 kelime:** `Aşağıdaki cümlelerin hangisinde zaman anlamı vardır?`
- **Sorun türü:** Birden çok doğru
- **Gerekçe:** Doğru cevap D (`Ders biter bitmez kapıya koştular.`) olarak verilmiştir; ancak A şıkkında da (`Ders bitince çok yoruldukları için uyudular.`) `-ince` zarf-fiili açıkça zaman anlamı taşımaktadır.
- **Önerilen düzeltme:** A şıkkındaki `"Ders bitince"` zaman yan cümlesi çıkarılarak yalnızca neden bildiren bir cümle (`Çok yoruldukları için hemen uyudular.`) yazılmalıdır.

### 6. `paragraf_06_parti.sql` (#4)
- **İlk 8 kelime:** `I. Bu nedenle devletler, para basma yetkisini kendi`
- **Sorun türü:** Cevap/metin hatalı (anlam çelişkisi)
- **Gerekçe:** II. cümlede `"Ticaret geliştikçe takas, taşıması ve değer biçmesi zor bir yöntem olmaktan çıktı."` denmektedir; oysa `"zor bir yöntem olmaktan çıktı"` ifadesi takasın kolaylaştığı anlamına gelir ve devamındaki `"İnsanlar zamanla herkesçe kabul gören bir değişim aracına ihtiyaç duydu."` (III) cümlesiyle ters düşer.
- **Önerilen düzeltme:** II. cümle `"Ticaret geliştikçe takas, taşıması ve değer biçmesi zor bir yöntem hâline geldi."` olarak düzeltilmelidir.

### 7. `paragraf_02_parti.sql` (#17)
- **İlk 8 kelime:** `I. Böylece bir yazıyı baştan sona okumadan önce`
- **Sorun türü:** Cevap hatalı / Sıralama mantıksız
- **Gerekçe:** Çözüm `V - II - III - IV - I` (son cümle I) kabul edilmiştir; ancak IV. cümle `"okuma sırasında"` yapılacak eylemi anlatırken I. cümle `"Böylece bir yazıyı baştan sona okumadan önce vereceğiniz kararlar..."` diyerek okuma öncesine dönmektedir. Okuma sırasındaki bir işlemin sonucu okuma öncesindeki kararı etkileyemez.
- **Önerilen düzeltme:** I. cümledeki `"baştan sona okumadan önce"` ifadesi `"okuma sırasında"` biçiminde değiştirilmeli ya da I. cümle III'ten sonra gelecek şekilde soru kurgusu yenilenmelidir.

---

## 3. Öncelik 2 — Sıralaması Tekil Olmayan, Cevabı Soruda Verilen veya Kavramsal/Mantıksal Açıdan Zayıf Sorular

### 8. `karma_01_yazim_noktalama_sozcuk_mantik.sql` (#25)
- **İlk 8 kelime:** `Furkan, Gökçe, Hülya, İsmail, Jale, Kerem adlı 6`
- **Sorun türü:** Cevap soruda verilmiş (kusurlu kurgu)
- **Gerekçe:** Soru kökünde `"Hülya 6. sıradadır."` bilgisi açıkça verildiği hâlde soru `"Buna göre baştan 6. sırada kim vardır?"` diye sorulmakta ve cevap E (`Hülya`) olmaktadır.
- **Önerilen düzeltme:** Soru kökü 6. sırayı değil, çıkarsanması gereken başka bir sırayı (ör. `"baştan 3. sırada kim vardır?"`) sormalıdır.

### 9. `sozel_mantik_01_parti.sql` (#5)
- **İlk 8 kelime:** `Selim, Tuna, Umut, Yasemin, Zeynep adlı 5 kişi`
- **Sorun türü:** Cevap soruda verilmiş (kusurlu kurgu)
- **Gerekçe:** Soru metninde `"Selim 1. sıradadır."` bilgisi verilmişken `"Buna göre baştan 1. sırada kim vardır?"` sorulmaktadır.
- **Önerilen düzeltme:** Soru `"baştan 2. / 3. sırada kim vardır?"` biçiminde değiştirilmelidir.

### 10. `sozel_mantik_01_parti.sql` (#6)
- **İlk 8 kelime:** `Barış, Dilara, Erkan, Funda, Gökhan adlı 5 kişi`
- **Sorun türü:** Cevap soruda verilmiş (kusurlu kurgu)
- **Gerekçe:** Metinde `"Dilara 5. sıradadır."` bilgisi doğrudan verildiği hâlde `"baştan 5. sırada kim vardır?"` sorulmaktadır.
- **Önerilen düzeltme:** Soru `"baştan 2. / 3. / 4. sırada kim vardır?"` biçiminde değiştirilmelidir.

### 11. `sozel_mantik_01_parti.sql` (#9)
- **İlk 8 kelime:** `Deniz, Ece, Fatih adlı üç arkadaşın her biri`
- **Sorun türü:** Zayıf soru / Aşırı kolay kurgu + zayıf çeldirici
- **Gerekçe:** `"Fatih maviyi sever"` ve `"Maviyi seven kişi kuş besler"` öncülleri birlikte verildiğinden soru tek adımda çözülmektedir; ayrıca seçeneklerde metinde hiç olmayan `balık` ve `hamster` yer almaktadır.
- **Önerilen düzeltme:** Soru çok adımlı çıkarım gerektirecek şekilde yeniden kurgulanmalı ve şıklar yalnızca kedi/köpek/kuş veya tutarlı kombinasyonlardan oluşturulmalıdır.

### 12. `paragraf_01_parti.sql` (#16)
- **İlk 8 kelime:** `I. Zaman ise bir kez harcandı mı geri`
- **Sorun türü:** Sıralama tekil değil (birden çok doğru savunulabilir)
- **Gerekçe:** Çözüm `IV - V - II - I - III` (3. cümle II) olarak verilmiştir; ancak `IV - II - I - V - III` (3. cümle I) veya `IV - I - II - V - III` sıralamaları da `"Para, enerji ve dikkat... Oysa çoğumuz zamanı... Zaman ise..."` karşıtlığıyla savunulabilir niteliktedir (**emin değilim**, anahtar sırası bağlama açısından daha güçlü olsa da çeldirici sıranın elenmesi tam kesin değildir).
- **Önerilen düzeltme:** `V` cümlesinin `IV`'e bağını tekilleştirmek için `II` ve `I` arasındaki `Oysa / ise` geçişi netleştirilmelidir.

### 13. `paragraf_03_parti.sql` (#4)
- **İlk 8 kelime:** `I. Sonuçta ortaya çıkan kâğıt, yazının yayılmasını hızlandıran`
- **Sorun türü:** Sıralama tekil değil (birden çok doğru savunulabilir)
- **Gerekçe:** Çözüm `II - III - IV - I - V` (4. cümle I) olarak verilmiştir; ancak `II - III - IV - V - I` (`"...yeni bir yazı yüzeyi üretildi. Üretim yöntemi zamanla başka toplumlara da yayıldı. Sonuçta ortaya çıkan kâğıt..."` -> 4. cümle V) sıralaması da mantıksal olarak savunulabilir.
- **Önerilen düzeltme:** `V` cümlesine `"Bu buluşun..."` veya `"Kâğıdın bu üretim yöntemi..."` gibi `I`'den sonraya sabitleyen bir gönderim eklenmelidir.

### 14. `paragraf_04_parti.sql` (#11)
- **İlk 8 kelime:** `I. Roma'nın su kemerleri, suyu kilometrelerce uzaktan kente`
- **Sorun türü:** Sıralama tekil değil (birden çok doğru savunulabilir)
- **Gerekçe:** Çözüm `I - III - IV - II - V` (2. cümle III) kabul edilmiştir; ancak `I - II - III - IV - V` (2. cümle II) sıralamasında hem `II` (`"Böylece kent halkı..."`) `I`'i hemen izler hem de `IV` ile `V` (`"ince bir eğimi korumak zorundaydı... bu hesabın..."`) arasına başka cümle girmemiş olur.
- **Önerilen düzeltme:** `II` cümlesini IV sonrasına sabitlemek için `"Bu eğim sayesinde..."` benzeri açık bir bağ kurulmalıdır.

### 15. `paragraf_07_parti.sql` (#18)
- **İlk 8 kelime:** `I. Bu nedenle yetişkin eğitimi programları, katılımcıların mevcut`
- **Sorun türü:** Sıralama tekil değil + TDK hatası (`önyargı`)
- **Gerekçe:** Çözüm `II - III - IV - V - I` (4. cümle V) olarak verilmiştir; ancak `II - III - I - IV - V` (4. cümle IV) sırası da son derece tutarlıdır, hatta `V`'teki `"hem değerlendirmek hem de gerektiğinde sorgulatmaktır"` ifadesi `I` ve `IV`'ü birlikte özetleyerek sona daha güçlü oturur. Ayrıca IV. cümlede `ön yargı` bitişik (`önyargı`) yazılmıştır.
- **Önerilen düzeltme:** `I` ile `V` arasındaki öncelik-sonralık ilişkisi netleştirilmeli ve `önyargı` → `ön yargı` olarak düzeltilmelidir.

### 16. `zor_01_parti.sql` (#25)
- **İlk 8 kelime:** `Aşağıdaki cümlelerin hangisinde anlatım bozukluğu vardır?`
- **Sorun türü:** Tartışmalı/zayıf dil bilgisi ölçütü
- **Gerekçe:** C şıkkındaki `"Sınava girerken kalemi kırıldı."` cümlesi zarf-fiil öznesi ile yüklem öznesi uyuşmadığı gerekçesiyle bozuk sayılmıştır. Ancak `"kalemi"` iyelik ekiyle kişi belli olduğu için bu yapı günlük ve ölçünlü Türkçede yaygın kabul görür; KPSS standartlarında çatı/özne uyuşmazlığı için yetersiz/tartışmalı bir örnektir.
- **Önerilen düzeltme:** C şıkkı KPSS düzeyinde tartışmasız bir özne/çatı uyuşmazlığı örneğiyle (ör. `"Sorular dikkatle okuyup çözülmelidir."`) değiştirilmelidir.

### 17. `zor_01_parti.sql` (#26)
- **İlk 8 kelime:** `Aşağıdaki cümlelerin hangisinde anlam belirsizliği vardır?`
- **Sorun türü:** Açıklama yanlış / Zorlama bozukluk
- **Gerekçe:** B şıkkındaki `"Öğretmen, öğrencisini sınıfta gördüğünde sevindi."` cümlesinde `"sınıfta"` sözcüğünün öğretmene mi öğrenciye mi ait olduğunun belirsiz olduğu savunulmuştur. Oysa `"gördüğünde"` eylemi tek bir ortamda gerçekleşen karşılaşmayı bildirir; bu cümlede KPSS'de aranan türden bir anlam belirsizliği yoktur.
- **Önerilen düzeltme:** B şıkkı gerçek bir anlam belirsizliği örneğiyle (ör. zamir/virgül eksikliği: `"Genç doktora şikâyetlerini tek tek anlattı."` veya `"Arkadaşını dün çarşıda görmedim."`) değiştirilmelidir.

---

## 4. Öncelik 3 — TDK Kuralları, Kavram Adlandırması, Kapsam Dışı (Sayısal) Sorular ve Zayıf Çeldiriciler

### A. TDK / Noktalama / Kavram Kullanımı Hataları
18. **`08_noktalama_isaretleri.sql` (#2)** — `Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?`  
    - **Sorun türü:** TDK kuralı açısından zayıf örnek + açıklama konumsal hatası  
    - **Gerekçe:** Doğru sayılan E şıkkında (`Sabah erkenden kalktık; hava çok soğuktu.`) sıralı cümle ögeleri arasında virgül yoktur; TDK'ya göre içinde virgül bulunmayan sıralı cümlelerde noktalı virgül değil virgül kullanılır. Ayrıca `explanation` içinde `"İlk cümlenin"` denmiştir (cevap E).  
    - **Önerilen düzeltme:** Ögeleri arasında virgül bulunan gerçek bir sıralı cümle verilmeli ve açıklama içerikle güncellenmelidir.

19. **`karma_01_yazim_noktalama_sozcuk_mantik.sql` (#13)** — `Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?`  
    - **Sorun türü:** TDK kuralı açısından zayıf örnek + açıklama konumsal hatası  
    - **Gerekçe:** Doğru sayılan B şıkkında (`Sabah erkenden kalktım; kahvaltı hazırladım; yola çıktım.`) hiç virgül yoktur; TDK kuralına göre burada virgül kullanılmalıdır. Ayrıca `explanation` `"İlk cümlede"` demektedir (cevap B).  
    - **Önerilen düzeltme:** İçinde virgül bulunan sıralı cümleyle değiştirilmeli ve açıklama düzeltilmelidir.

20. **`08_noktalama_isaretleri.sql` (#10)** — `Aşağıdaki cümlelerin hangisinde virgül, kendinden önceki ögeleri sıralamak`  
    - **Sorun türü:** Soru kökü ifade bozukluğu + açıklama konumsal hatası  
    - **Gerekçe:** `"kendinden önceki ögeleri sıralamak"` ifadesi kavramsal olarak yanlıştır (`ekmek, süt, yumurta` sıralamasında virgül eş görevli sözcüklerin **arasına** konur). Ayrıca `explanation` `"İlk cümlede"` demektedir (cevap C).  
    - **Önerilen düzeltme:** Soru kökü `"eş görevli sözcükleri ayırmak için"` olarak düzeltilmeli, açıklama güncellenmelidir.

21. **`10_anlatim_bozukluklari.sql` (#5)** — `Aşağıdaki cümlelerin hangisinde ortak yüklem kullanımından kaynaklanan bir`  
    - **Sorun türü:** Kavram hatası + zayıf çeldirici  
    - **Gerekçe:** C şıkkında (`Ahmet'i çok severim ve saygı duyarım.`) **ortak yüklem** değil iki ayrı yüklem (`severim`, `saygı duyarım`) vardır; hata **nesnenin ortak kullanılmasından kaynaklanan dolaylı tümleç eksikliğidir** (`ona`). Ayrıca B ve C şıkları tek sözcük (`ona`) farkıyla neredeyse aynıdır.  
    - **Önerilen düzeltme:** Soru kökü `"tümleç eksikliğinden"` / `"nesnenin ortak kullanılmasından"` diye düzeltilmeli, B şıkkı yapısal olarak farklılaştırılmalıdır.

22. **`cumlede_anlam_02_parti.sql` (#4)** — `Aşağıdaki cümlelerin hangisinde gerçekleşmemiş bir durum (varsayım) anlatılmaktadır?`  
    - **Sorun türü:** Kavram adlandırma hatası  
    - **Gerekçe:** Doğru sayılan D şıkkı (`Yağmur yağmasaydı pikniğe gidecektik.`) gerçekleşmemiş koşul/beklenti cümlesidir; KPSS'de "varsayım cümlesi" `diyelim ki, tut ki, farz edelim` gibi ifadelerle kurulur.  
    - **Önerilen düzeltme:** Parantez içindeki `(varsayım)` ifadesi kaldırılmalı veya gerçek bir varsayım cümlesi yazılmalıdır.

23. **`dilbilgisi_01_parti.sql` (#7)** — `Aşağıdaki fiillerden hangisi bileşik fiildir?`  
    - **Sorun türü:** TDK / Terim yazım hatası  
    - **Gerekçe:** TDK yazım kılavuzuna ve dil bilgisi terimlerine göre doğrusu **`birleşik fiil`**dir (`bileşik` kimyada kullanılır). Aynı terim hatası `explanation` ve `distractor_trap` alanlarında da geçmektedir.  
    - **Önerilen düzeltme:** `bileşik` → `birleşik` olarak değiştirilmelidir.

24. **`dilbilgisi_01_parti.sql` (#22)** — `Aşağıdaki cümlelerin hangisinde yüklem bileşik fiildir?`  
    - **Sorun türü:** TDK / Terim yazım hatası  
    - **Gerekçe:** Soru kökünde, açıklamada ve tuzakta `bileşik fiil` yazılmıştır; doğrusu `birleşik fiil`dir.  
    - **Önerilen düzeltme:** `bileşik` → `birleşik` olarak değiştirilmelidir.

25. **`paragraf_05_parti.sql` (#14)** — `I. Bu nedenle sağlık kuruluşları, sabunla el yıkamayı`  
    - **Sorun türü:** TDK yazım hatası  
    - **Gerekçe:** V. cümlede `"Ağıza ya da yüze dokunulduğunda"` yazılmıştır. TDK'ya göre `ağız` sözcüğü ünlüyle başlayan ek aldığında ünlü düşmesine uğrar: doğrusu **`Ağza`**dır.  
    - **Önerilen düzeltme:** `Ağıza` → `Ağza` olarak düzeltilmelidir.

26. **`paragraf_05_parti.sql` (#21)** — `Evde elektrik tasarrufunun en kolay yolu, kullanılmayan cihazları`  
    - **Sorun türü:** TDK yazım hatası  
    - **Gerekçe:** Metinde, açıklamada ve C şıkkında `Led ampuller` yazılmıştır. TDK'ya göre büyük harfli kısaltmaların tümü büyük harfle yazılır (`LED`).  
    - **Önerilen düzeltme:** `Led` / `led` → `LED` olarak düzeltilmelidir.

27. **`paragraf_07_parti.sql` (#19)** — `Hataları utanılacak şeyler olarak görmek, insanı yeni denemelerden`  
    - **Sorun türü:** TDK yazım hatası  
    - **Gerekçe:** Metinde ve açıklamada `hammaddesi` bitişik yazılmıştır; TDK Güncel Türkçe Sözlük'e göre **`ham madde`** ayrı yazılır.  
    - **Önerilen düzeltme:** `hammaddesi...` → `ham maddesi...` olarak düzeltilmelidir.

28. **`zor_01_parti.sql` (#17)** — `"Kitabı bitirmeden önce eleştirmeye kalkanlar, aslında kitabı değil`  
    - **Sorun türü:** TDK yazım hatası  
    - **Gerekçe:** Soru kökünde, A/C şıklarında, açıklamada ve tuzakta `önyargı` bitişik yazılmıştır; TDK'ya göre **`ön yargı`** ayrı yazılır.  
    - **Önerilen düzeltme:** Tüm `önyargı` kullanımları `ön yargı` biçiminde düzeltilmelidir.

29. **`paragraf_01_parti.sql` (#30)** — `Bir dil, yalnızca konuşanlarının sayısıyla yaşamaz; o dilde`  
    - **Sorun türü:** Yazım hatası (`distractor_trap` içinde)  
    - **Gerekçe:** `distractor_trap` sonunda `"önerdir"` dizgi hatası vardır (`öneridir` olmalı).  
    - **Önerilen düzeltme:** `önerdir` → `öneridir` olarak düzeltilmelidir.

30. **`paragraf_07_parti.sql` (#28)** — `Bazı insanlar, başkalarının sözünü kesmeyi tartışmada ilgi göstermenin`  
    - **Sorun türü:** Biçim eksikliği  
    - **Gerekçe:** Soru kökü `"Bu parçadaki II. cümlenin işlevi..."` diye sormasına karşın parça cümleleri `(I), (II), (III)` şeklinde numaralandırılmamıştır.  
    - **Önerilen düzeltme:** Parça cümlelerinin başına `(I)`, `(II)`, `(III)` numaraları eklenmelidir.

---

### B. Alan Dışı (Sayısal/Matematik) "Sözel Mantık" Soruları
KPSS GY'de sayı dizileri, denklem kurma, işçi-havuz ve kesir/yaş/küme problemleri **Sayısal Bölüm (Matematik)** kapsamındadır; **Türkçe (Sözel Mantık)** testinde sorulmaz.

31. **`11_sozel_mantik_ve_muhakeme.sql` (#9)** — `2, 6, 12, 20, 30 sayı dizisinde sıradaki` (Konu etiketi / Alan dışı: sayı dizisi)
32. **`karma_01_yazim_noktalama_sozcuk_mantik.sql` (#29)** — `Bir sayının 3 katının 5 fazlası 29'dur. Buna` (Konu etiketi / Alan dışı: 1. derece denklem)
33. **`sozel_mantik_01_parti.sql` (#22)** — `30 kişilik bir sınıfta 18 kişi İngilizce, 15` (Konu etiketi / Alan dışı: küme problemi)
34. **`sozel_mantik_01_parti.sql` (#25)** — `Baba, anneden 3 yaş büyüktür. Anne, çocuğun yaşının` (Konu etiketi / Alan dışı: yaş problemi)
35. **`sozel_mantik_01_parti.sql` (#26)** — `Bir havuzu A musluğu tek başına 6 saatte,` (Konu etiketi / Alan dışı: işçi-havuz problemi)
36. **`sozel_mantik_01_parti.sql` (#28)** — `Bir sınıfta kızların sayısı erkeklerin sayısının 2/3'ü kadardır.` (Konu etiketi / Alan dışı: kesir problemi)
37. **`sozel_mantik_01_parti.sql` (#29)** — `3, 4, 6, 9, 13, ... sayı dizisinde` (Konu etiketi / Alan dışı: sayı dizisi)
38. **`sozel_mantik_01_parti.sql` (#30)** — `2, 3, 5, 9, 17, ... sayı dizisinde` (Konu etiketi / Alan dışı: sayı dizisi)
39. **`zor_01_parti.sql` (#29)** — `Her saat başına 5 dakika geri kalan bir` (Konu etiketi / Alan dışı: saat/oran problemi)

- **Önerilen düzeltme (31–39):** Bu 9 soru Türkçe havuzundan çıkarılıp Matematik havuzuna taşınmalı; yerlerine ÖSYM tarzında çoklu değişkenli sözel mantık/muhakeme soruları yazılmalıdır.

---

### C. Zayıf Çeldiriciler ve Kalıp Tekrarları
40. **`11_sozel_mantik_ve_muhakeme.sql` (#3)** — `Ayşe, Burak ve Can; Pazartesi, Salı ve Çarşamba` → Metinde yalnızca Pazartesi, Salı, Çarşamba varken `Pazar` ve `Perşembe` şıkları saçma/kolay elenen çeldiricilerdir.
41. **`11_sozel_mantik_ve_muhakeme.sql` (#10)** — `Ada, Barış, Cem ve Defne dört ayrı odada` → Metinde `"Ada 4. odada değildir."` verildiği hâlde E şıkkı `"Ada 4. odadadır."` olarak konulmuş; anında elenir.
42. **`karma_01_yazim_noktalama_sozcuk_mantik.sql` (#26)** — `Mine, Nehir, Onur adlı üç arkadaşın her biri` → Metinde yalnızca `kedi, köpek, kuş` varken D (`balık`) ve E (`hamster`) saçma çeldiricilerdir; ayrıca `karma_01 #27` ve `sozel_mantik_01 #8, #9, #10` ile neredeyse aynı kalıp tekrarıdır.
43. **`karma_01_yazim_noktalama_sozcuk_mantik.sql` (#27)** — `Pınar, Rüya, Sarp adlı üç arkadaşın her biri` → Aynı şekilde `balık` ve `hamster` saçma çeldiricidir; kalıp tekrarıdır.
44. **`sozel_mantik_01_parti.sql` (#8)** — `Ada, Burcu, Cem adlı üç arkadaşın her biri` → Aynı şekilde `balık` ve `hamster` saçma çeldiricidir; kalıp tekrarıdır.
45. **`sozel_mantik_01_parti.sql` (#10)** — `Gizem, Halil, İpek adlı üç arkadaşın her biri` → Aynı şekilde `balık` ve `hamster` saçma çeldiricidir; kalıp tekrarıdır.
46. **`paragraf_04_parti.sql` (#29)** — `Sabah erkenden evden çıktı. Durakta bir süre bekledikten` → E şıkkı `"Bilimsel anlatım"` ÖSYM anlatım biçimleri sınıflamasında yer almayan zayıf bir çeldiricidir.
47. **`paragraf_05_parti.sql` (#30)** — `Rüzgâr, yüksek basınç alanından alçak basınç alanına doğru` → D şıkkı `"Gezi anlatımı"` zayıf/uydurma çeldiricidir.
48. **`paragraf_06_parti.sql` (#29)** — `Limanda sabahın ilk ışıklarıyla birlikte tekneler birer birer` → D şıkkı `"Bilimsel anlatım"` zayıf çeldiricidir.
49. **`paragraf_07_parti.sql` (#30)** — `Sabahın erken saatinde bahçeye çıktı. Kovayı çeşmenin altına` → E şıkkı `"Bilimsel anlatım"` zayıf çeldiricidir.

---

## 5. Öncelik 4 — Açıklama / Tuzak Metinlerinde Bozuk Konum Gönderimleri (`"İlk cümlede / İlk şıkta"`)

Seçenekler karıştırıldığı hâlde `explanation` (veya `distractor_trap`) metninde doğru şıktan **"İlk cümle / İlk şık"** diye söz edilen, oysa doğru cevabı **A (0) olmayan** 31 soru tespit edilmiştir *(bu 31 sorudan 4'ü yukarıda da başka sorunlarla yer aldığı için tekil toplam 77'dir; aşağıda tamamı listelenmiştir)*:

| Dosya ve Soru | Doğru Şık | İlk 8 Kelime | Hatalı Gönderim |
|---|---|---|---|
| `08_noktalama_isaretleri.sql` (#2) | E | `Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?` | `expl`: `"İlk cümlenin iki yargısı..."` |
| `08_noktalama_isaretleri.sql` (#7) | E | `Aşağıdaki cümlelerin hangisinde tırnak işareti, başkasından aktarılan söz` | `expl`: `"Tırnak işareti ilk şıkta..."` |
| `08_noktalama_isaretleri.sql` (#10) | C | `Aşağıdaki cümlelerin hangisinde virgül, kendinden önceki ögeleri sıralamak` | `expl`: `"İlk cümlede 'ekmek, süt...'..."` |
| `09_cumlenin_ogeleri_ve_cumle_turleri.sql` (#2) | E | `Aşağıdaki cümlelerin hangisinde zarf tümleci yoktur?` | `expl`: `"İlk cümlede belirtili nesne..."` |
| `10_anlatim_bozukluklari.sql` (#8) | B | `Aşağıdaki cümlelerin hangisinde anlatım bozukluğu yoktur?` | `expl`: `"İlk cümle anlam, uyum..."` |
| `cumlede_anlam_01_parti.sql` (#4) | D | `Aşağıdaki cümlelerin hangisinde neden-sonuç ilişkisi yoktur?` | `expl`: `"İlk cümle iki varlığın..."` |
| `cumlede_anlam_01_parti.sql` (#5) | E | `Aşağıdaki cümlelerin hangisinde koşul (şart) anlamı vardır?` | `expl`: `"İlk cümlede başvurunun..."` |
| `cumlede_anlam_01_parti.sql` (#6) | C | `Aşağıdaki cümlelerin hangisinde eylemin amacı belirtilmemiştir?` | `expl`: `"İlk cümlede sarılma ve ağlama..."` |
| `cumlede_anlam_01_parti.sql` (#24) | D | `Aşağıdaki cümlelerin hangisinde karşıtlık (-e rağmen) anlamı vardır?` | `trap`: `"...tek cümle ilk şıktır."` |
| `cumlede_anlam_01_parti.sql` (#25) | E | `Aşağıdaki cümlelerin hangisinde önce genel bir yargı, ardından` | `expl`: `"İlk cümle önce genel..."` |
| `cumlede_anlam_01_parti.sql` (#26) | C | `Aşağıdaki cümlelerin hangisinde bir öneri ya da öğüt` | `expl`: `"İlk cümle yalnızca bir olguyu..."` |
| `cumlede_anlam_02_parti.sql` (#5) | E | `Aşağıdaki cümlelerden hangisi bir tanım cümlesidir?` | `expl`: `"İlk cümle, merceğin ne olduğunu..."` |
| `cumlede_anlam_02_parti.sql` (#9) | D | `Aşağıdaki cümlelerden hangisi diğerlerinden anlamca farklıdır?` | `expl`: `"İlk cümlede ise sabırlı..."` |
| `cumlede_anlam_02_parti.sql` (#10) | E | `Aşağıdaki cümlelerin hangisinde hem neden hem amaç belirtilmiştir?` | `expl`: `"İlk cümlede izin almanın..."` |
| `cumlede_anlam_02_parti.sql` (#15) | E | `Aşağıdaki cümlelerin hangisinde öneri vardır?` | `expl`: `"İlk cümle 'iyi olur'..."` |
| `cumlede_anlam_02_parti.sql` (#29) | D | `Aşağıdaki cümlelerin hangisinde amaç bildirilmiştir?` | `expl`: `"İlk cümlede yeniden okumanın..."` |
| `dilbilgisi_01_parti.sql` (#9) | D | `Aşağıdaki cümlelerin hangisinde "ancak" sözcüğü bağlaç görevindedir?` | `expl`: `"İlk cümlede 'ancak'..."` |
| `dilbilgisi_01_parti.sql` (#15) | E | `Aşağıdaki cümlelerin hangisinde "ki" bağlaç görevindedir?` | `expl`: `"İlk cümlede 'ki'..."` |
| `dilbilgisi_01_parti.sql` (#16) | C | `Aşağıdaki cümlelerin hangisinde nesne yoktur?` | `expl`: `"İlk cümledeki 'bahçede'..."` |
| `dilbilgisi_01_parti.sql` (#18) | B | `Aşağıdaki cümlelerden hangisi devrik cümledir?` | `expl`: `"İlk cümlede yüklem..."` |
| `dilbilgisi_01_parti.sql` (#19) | D | `Aşağıdaki cümlelerden hangisi şartlı birleşik cümledir?` | `expl`: `"İlk cümledeki 'çıkarsan'..."` |
| `dilbilgisi_01_parti.sql` (#21) | C | `Aşağıdaki cümlelerin hangisinde hem dolaylı tümleç hem zarf` | `expl`: `"İlk cümlede 'yarın'..."` |
| `dilbilgisi_01_parti.sql` (#24) | D | `Aşağıdaki cümlelerin hangisinde mantık hatası vardır?` | `expl`: `"İlk cümlede neden-sonuç..."` |
| `dilbilgisi_01_parti.sql` (#29) | D | `Aşağıdaki cümlelerin hangisinde karşılaştırmadan kaynaklanan bir anlatım bozukluğu` | `expl`: `"İlk cümlede 'havası'..."` |
| `dilbilgisi_01_parti.sql` (#30) | E | `Aşağıdaki cümlelerin hangisinde anlatım bozukluğu yoktur?` | `expl` & `trap`: `"İlk cümle..."`, `"yalnızca ilk cümle..."` |
| `karma_01_...sql` (#11) | C | `Aşağıdaki cümlelerin hangisinde hitap sözünden sonra yanlış noktalama` | `expl`: `"İlk cümlede iki nokta..."` |
| `karma_01_...sql` (#13) | B | `Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?` | `expl`: `"İlk cümlede üç bağımsız yargı..."` |
| `sozcukte_anlam_01_parti.sql` (#1) | C | `Aşağıdaki cümlelerin hangisinde "baş" sözcüğü gerçek anlamıyla kullanılmıştır?` | `expl` & `trap`: `"İlk cümlede 'baş'..."` |
| `sozcukte_anlam_01_parti.sql` (#23) | B | `Aşağıdaki cümlelerin hangisinde "tatlı" sözcüğü mecaz anlamda kullanılmıştır?` | `trap`: `"...ilk cümlededir."` |
| `sozcukte_anlam_01_parti.sql` (#28) | B | `Aşağıdaki cümlelerin hangisinde "sıcak" sözcüğü gerçek anlamda kullanılmıştır?` | `expl`: `"İlk cümlede 'sıcak'..."` |
| `zor_01_parti.sql` (#24) | E | `Aşağıdaki cümlelerin hangisi hem birleşik hem de isim` | `expl`: `"İlk cümlede 'kalkmak'..."` |

- **Önerilen düzeltme:** Bu 31 sorunun (ayrıca doğru cevabı tesadüfen A olan ancak yine `"İlk cümlede"` diyen `02_cumlede_anlam #1`, `09_cumlenin_ogeleri #6`, `cumlede_anlam_01 #7, #27`, `karma_01 #7, #17`, `zor_01 #18` sorularının) açıklama ve tuzak metinleri sıra numarası yerine doğrudan şık içeriğine gönderme yapacak biçimde yenilenmelidir.

---

## 6. Genel Havuz Değerlendirmesi (Zorluk, Tekrar ve Aşama B'ye Notlar)

1. **Zorluk Etiketleri (`difficulty`):** `cumlede_anlam_01_parti.sql`, `cumlede_anlam_02_parti.sql` ve `dilbilgisi_01_parti.sql` içindeki `difficulty = 3` etiketli soruların önemli bir kısmı KPSS Lisans düzeyine göre aslında `1` veya `2` düzeyindedir (ör. tek cümleli basit anlam ilişkisi veya temel öge soruları).
2. **Sözel Mantık Tekrarları ve Kopyala-Yapıştır Tuzaklar:** `sozel_mantik_01_parti.sql` (#1–7) ve `karma_01` (#24–25) aynı 5–6 kişilik doğrusal sıralama kalıbını kullanmakta ve hepsi neredeyse aynı `distractor_trap` cümlesini tekrarlamaktadır (hatta #5, #6, #7 ve `karma_01 #25` sorularında metinde geçmeyen `"en önde değil"` ifadesi tuzak metninde kopya olarak kalmıştır). `sozel_mantik_01 #8–10` ve `karma_01 #26–27` de aynı 3×3 renk-hayvan eşleştirme şablonunun tekrarıdır.
3. **Konu Bazlı Güçlü/Zayıf Alanlar:** `paragraf_01`–`07` ve `zor_01` içindeki paragraf soruları dil ve kurgu bakımından genel olarak en temiz gruptur; buna karşılık dil bilgisi (özellikle ses bilgisi, noktalama, anlatım bozukluğu) ve sözel mantık sorularında ciddi eleme ve telafi ihtiyacı vardır.
