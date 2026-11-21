# 🧭 Sınav Türü Konu Matrisi (Resmî Kaynaklı)

> **Makine tarafından okunabilir sürüm:** [konu_matrisi.json](konu_matrisi.json). Uygunluk taraması betiği ve ileride `TASK-139` linter'ı bu dosyayı okur.
> **Hazırlanma:** 2026-11-20. Kaynaklar ÖSYM'nin 2026 kılavuzlarındaki resmî **"Testlerin Kapsamları"** tablolarıdır. PDF'ler kullanıcı onayıyla indirildi, metinleri `pdftotext` ile çıkarıldı ve her testin ağırlık toplamının %100 ettiği betikle doğrulandı.

**Güven seviyeleri:**
- ✅ **Resmî:** ÖSYM/MEB tablosunda birebir yazıyor.
- 🟡 **Gelenek:** ÖSYM yayımlamıyor; çıkmış sorulardan oturmuş bir dağılım. Sayımla teyit gerekir.
- ❓ **Teyitsiz:** Kaynak bulunamadı.

## 1. Resmî Kaynaklar

| Kaynak | Kapsadığı bilgi | Durum |
|---|---|---|
| [2026-KPSS Lisans Kılavuzu](https://dokuman.osym.gov.tr/pdfdokuman/2026/KPSS/LISANS/kilavuz_Ld01072026.pdf), Tablo-1 | GY, GK ve 9 A Grubu testinin alt konu ağırlıkları + DHBT konu başlıkları | ✅ Okundu |
| [2026-EKPSS Kılavuzu](https://dokuman.osym.gov.tr/pdfdokuman/2026/EKPSS/kilavuz_ekpd0402026.pdf), 3.1 | Ders bazında soru sayıları, kitapçık türleri, ek süreler | ✅ Okundu |
| [2026-MEB-AGS Kılavuzu](https://dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/kilavuz_agsd08052026.pdf), Tablo-1 | AGS + 17 ÖABT alanının alt konu ağırlıkları, puan türü ağırlıkları | ✅ Okundu |
| [2026 AGS Konu Dağılımı](https://dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/konudagilimi08012026.pdf) | AGS + ÖABT Özel Eğitim (kılavuzla aynı) | ✅ Okundu |
| 2026-KPSS Ön Lisans ve Ortaöğretim Kılavuzları ([1](https://dokuman.osym.gov.tr/web/2026/8/basvuru-kilavuzu-fqs59p-13083438.pdf), [2](https://dokuman.osym.gov.tr/web/2026/8/basvuru-kilavuzu-ci4pae-27090228.pdf)) | Bu düzeylerin GY-GK tablosu ve DHBT konuları | ✅ Okundu. **Lisans'la kelimesi kelimesine aynı.** (ÖSYM sayfasındaki bağlantı adları dosyalarla ters eşleşiyor olabilir; içerik kılavuz başlığından teyit edildi.) |

## 2. KPSS GY-GK (Lisans · Ön Lisans · Ortaöğretim) — ✅ Resmî

> Üç düzeyin 2026 kılavuzlarındaki Tablo-1 **birebir aynı**. Düzeyler ayrı sınavlarda, ayrı kitapçıklarla yapılır. Fark konu kapsamında değil, **zorluk düzeyinde**. Bu yüzden `education_level` etiketi konu listesini değil, zorluk ve soru seçimini belirlemeli. Puan türleri: Lisans P1–P3, Ön Lisans **P93**, Ortaöğretim **P94** (GY %50 + GK %50).

**Genel Yetenek (60 soru):** ÖSYM yalnızca iki bölüm tanımlıyor.

| Bölüm | Ağırlık | ~Soru | Resmî kapsam |
|---|---|---|---|
| Sözel | %50 | 30 | "Sözel akıl yürütme (muhakeme) becerileri, dil bilgisi ve yazım kuralları" |
| Sayısal | %50 | 30 | "Sayısal ve mantıksal akıl yürütme (muhakeme) becerileri" |

🟡 Türkçe'nin alt konuları (paragraf, sözcükte anlam, ses bilgisi...) ve matematik/geometri ayrımı **resmî değil**. Bunlar çıkmış soru sayımıyla teyit edilmeli (bkz. §8).

**Genel Kültür (60 soru):**

| Ders | Ağırlık | ~Soru | Resmî alt konular (ağırlık → ~soru) |
|---|---|---|---|
| Tarih | %45 | 27 | Osmanlı Öncesi Türk Devletleri %5 → 3 · Osmanlı Tarihi %15 → 9 · **Atatürk İlkeleri ve İnkılap Tarihi %20 → 12** · Çağdaş Türk ve Dünya Tarihi %5 → 3 |
| Türkiye Coğrafyası | %30 | 18 | Fiziki %12 → 7 · Beşerî %5 → 3 · Ekonomik %13 → 8 |
| Temel Yurttaşlık Bilgisi | %15 | 9 | Hukuk başlangıcı %5 → 3 · Anayasa, İnsan Hakları Hukuku %5 → 3 · İdare %5 → 3 |
| Güncel (Türkiye ve Dünya ile İlgili Genel, Kültürel ve Sosyoekonomik Konular) | %10 | 6 | — |

## 3. E-KPSS — ✅ Resmî (tüm düzeyler ve engel grupları için aynı tablo)

| Test | Ders | Soru |
|---|---|---|
| Genel Yetenek (30) | Türkçe · Matematik | 15 · 15 |
| Genel Kültür (30) | **Atatürk İlkeleri ve İnkılap Tarihi** | 10 |
| | Temel Yurttaşlık Bilgisi | 6 |
| | **Türk Kültür ve Medeniyetleri** | 3 |
| | Türkiye Coğrafyası | 5 |
| | Türkiye ve Dünya ile İlgili Genel, Kültürel ve Güncel Sosyoekonomik Konular | 6 |

**Kitapçıklar (her öğrenim düzeyi için ayrı):**

| Kitapçık | Kim kullanır | İçerik kuralı |
|---|---|---|
| Genel, Görme ve İşitme-2 Testi | Genel engelli, görme engelli, ilköğretim sonrası işitme engelli, dil ve konuşma | Aynı içerik. Görme engellilere **grafik ve şekilli soru sorulmaz**. İşitme-2 için karmaşık ve uzun paragraf yok. |
| İşitme-1 Testi | İlköğretime başlama yaşından önce işitme engelli olanlar | **Ayrı test.** "Günlük ve yaygın olarak kullanılan kelimelerden" oluşan sorular. |
| Zihinsel Engelli Testi | Zihinsel engelliler | **Ayrı test.** |

**Ek süreler:** Temel süre 60 dk. Ek süre gruba göre 0 / +20 / +30 / +40 dk (ayrıntı JSON'da).

## 4. DHBT — ✅ Konular resmî, ❓ ağırlıklar teyitsiz

40 soru, 60 dk. Konu başlıkları resmî; konu başına soru sayısı ÖSYM tarafından yayımlanmıyor.

- **DHBT-1 (ilk 20 soru, tüm düzeyler ortak):** İslam İnanç Esasları · İslam İbadet Esasları · Kur'an Bilgisi (Kur'an tarihi, tecvid, **Kur'an'ı anlama ve meal bilgisi**) · Siyer · İslam Ahlakı.
- **DHBT-2 (son 20 soru):** Tefsir · Fıkıh · Hadis · Akaid ve Kelam · İslam Tarihi · Dinler ve Mezhepler Tarihi · Dini Hitabet.
  - **Düzeye göre müfredat:** Lisans → İlahiyat Fakültesi · Ön Lisans → İlahiyat ön lisans programı · Ortaöğretim → **İmam Hatip Okulları müfredatı**.
- ⚠️ **İçerik kuralı:** Sınavdaki Kur'an metinleri ve mealleri **TDV Yayın No: 86/A "Kur'an-ı Kerim ve Açıklamalı Meali"**nden alınıyor. Bu meal telifli, uygulamada metin yerine sure:ayet künyesi verilmeli. Meal üslubu ve terimleri bu baskıyla uyumlu tutulmalı.

## 5. MEB-AGS — ✅ Resmî

AGS 80 soru, 110 dk:

| Bölüm | Ağırlık | Soru | Resmî alt konular |
|---|---|---|---|
| Sözel Yetenek | %18,75 | 15 | Sözcükte Anlam, Cümlede Anlam, Anlatımın Oluşması, Paragrafta Anlam, Sözel Mantık · ⚠️ **Dil bilgisi ve yazım YOK** |
| Sayısal Yetenek | %18,75 | 15 | Temel Matematik, Grafik ve Tablo Yorumlama, Mantıksal Muhakeme Problemleri · ⚠️ **Geometri YOK** |
| Tarih | %7,5 | 6 | KPSS GK ile aynı 4 dönem |
| Türkiye Coğrafyası | %7,5 | 6 | Fiziki · Beşerî ve Ekonomik |
| Eğitim Bilimleri ve TMES | %37,5 | 30 | Eğitimin Tarihî, Felsefi, Toplumsal, Ekonomik ve Politik Temelleri · Öğretim Yöntem ve Teknikleri · Sınıf Yönetimi · **Program Okuryazarlığı** · Ölçme ve Değerlendirme · Öğrenme Psikolojisi · Gelişim Psikolojisi · Rehberlik · Eğitim ve Öğretim Teknolojileri · **TMES'in Genel Yapısı** · **Türkiye Yüzyılı Maarif Modeli** |
| Mevzuat | %10 | 8 | Anayasa (2709) ve İnsan Hakları Hukuku · 1739 · 222 · **7528** |

**ÖABT (50 soru):**
- **Süre:** 90 dk (İlköğretim Matematik, Fen Bilimleri, Matematik, Fizik, Kimya) · 70 dk (diğer 12 alan).
- **Alan Eğitimi bölümü yalnızca 3 alanda var:** Sınıf Öğretmenliği (%34 alan bilgisi + **%66 alan eğitimi**), Okul Öncesi (%60 + %40), Özel Eğitim (%60 + %40). Diğer 14 alanın tamamı alan bilgisi.
- 17 alanın tüm alt konu ağırlıkları JSON'da.
- **DKAB/İHL:** Ortak %20 + Temel İslam Bilimleri %46 + İslam Tarihi, Felsefe ve Din Bilimleri %34. PDF tablo düzeni bozuk çıktı; toplamlar tutarlı ama görsel teyit önerilir.

## 6. KPSS A Grubu — ✅ Resmî (her test 40 soru)

| Test | Resmî alt konular (%) |
|---|---|
| Hukuk | Anayasa 10 · İdare + İdari Yargı 15 · Ceza (Genel Hükümler + CMK) 15 · Medeni 15 · Borçlar (Genel Hükümler) 15 · Ticaret 15 · İcra-İflas 15 |
| İktisat | **İktisadi Doktrinler Tarihi 5** · Mikro 30 · Makro 25 · Para-Banka-Kredi 10 · Uluslararası 10 · Kalkınma-Büyüme 10 · Türkiye Ekonomisi 10 |
| Maliye | Maliye Teorisi 10 · Kamu Gelirleri 15 · Kamu Giderleri 15 · Kamu Borçları 15 · Bütçe 15 · Vergi Hukuku 15 · Maliye Politikası 15 |
| Muhasebe | **Genel Muhasebe 70** · Mali Tablolar Analizi 20 · İhtisas (Maliyet, Yönetim, **Denetim, TFRS, TMS**) 10 |
| İşletme | **Temel Kavramlar 10** · İşletme Yönetimi 25 · Üretim 25 · Pazarlama 20 · Finansal 20 |
| Kamu Yönetimi | Siyaset Bilimi 20 · **Anayasa 15** · Yönetim Bilimleri 20 · **Yönetim Hukuku 20** · Kentleşme ve Çevre 15 · Türk Siyasi Hayatı 10 |
| Uluslararası İlişkiler | Teori 20 · Uluslararası Hukuk 25 · Siyasi Tarih 20 · **Uluslararası Güncel Sorunlar 10** · Uluslararası Örgütler 10 · Türk Dış Politikası 15 |
| ÇEKO | İş Hukuku 20 · Sosyal Güvenlik 25 · Sosyal Politika 10 · Çalışma Ekonomisi 30 · Çalışma Psikolojisi ve Sosyolojisi 15 |
| İstatistik (60 dk) | Olasılık ve Stokastik Süreçler 15 · Matematiksel İst. 15 · **Yöneylem 5** · **Çok Değişkenli 10** · **Parametrik Olmayan 5** · Uygulamalı 15 · **Zaman Serileri 5** · **Deney Tasarımı ve ANOVA 10** · Örnekleme 10 · Regresyon 10 |

## 7. ⚠️ Kodla Uyuşmazlıklar (`CurriculumRegistry` / `kpss_lessons.dart`)

> Bu oturum kod değiştirmez. Aşağıdakiler ayrı bir görev olarak düzeltilmeli. Konu listeleri ortak sözleşme sayılır, bu yüzden düzeltmede Web kolonu `❌` kalır ve `docs/parity_fixtures` güncellenir.

| # | Öncelik | Yer | Kodda | Resmî | Kullanıcıya etkisi |
|---|---|---|---|---|---|
| 1 | 🔴 | `_oabtTopicsByBranch`: Türkçe, İlköğretim Mat, Matematik, Fen, Fizik, Kimya, Biyoloji, Sosyal, TDE, Tarih, Coğrafya, DKAB, PDR | Her birinde "… **Alan Eğitimi**" konusu var | Bu 13 alanda 2026 ÖABT'de alan eğitimi bölümü **yok** | Kullanıcı sınavda çıkmayacak konuya çalışır |
| 2 | 🔴 | `_resolveEkpss` Tarih konuları | Osmanlı Devleti Siyasi ve Kültür Tarihi, Çağdaş Türk ve Dünya Tarihi | Yalnızca İnkılap Tarihi (10) + Türk Kültür ve Medeniyetleri (3) | E-KPSS adayına kapsam dışı soru gider. Toplam 13 doğru, konular yanlış. |
| 3 | 🔴 | `_resolveMebAgs` splitLabel / Sınıf Öğretmenliği konuları | "30 Alan + 20 Alan Eğitimi" | Sınıf: %34 + %66 (~17 + 33). Okul Öncesi ve Özel Eğitim 30 + 20 doğru. | Deneme dağılımı yanlış |
| 4 | 🟠 | `_oabtTopicsByBranch` tüm alanlar | Serbest yazılmış 4-5 başlık | Resmî 3-16 alt konu (JSON'da). Ör. Türkçe'de "Edebiyat Bilgi ve Kuramları", Tarih'te "Osmanlı Türkçesi", Beden'de 16 başlık eksik. | Konu kapsamı eksik |
| 5 | 🟠 | `_aGrubuCatalog` | İktisat'ta Doktrinler Tarihi yok · Muhasebe'de "Şirketler Muhasebesi" var, Denetim/TFRS/TMS yok · İşletme'de "İnsan Kaynakları" var, "Temel Kavramlar" yok · Kamu Yön.'de Anayasa ve Yönetim Hukuku yok · Uİ'de Güncel Sorunlar yok · İstatistik'te 10 konudan 4'ü var | Tablo §6 | Kapsam eksik veya fazla |
| 6 | 🟠 | AGS havuzu | `meb_ags_1` başlıkları doğru | Sözel'de dil bilgisi yok, Sayısal'da geometri yok | KPSS GY havuzu AGS'ye `exam_scopes` ile açılırken dil bilgisi ve geometri soruları **hariç tutulmalı** |
| 7 | 🟠 | `DisabilityGroup.standardExtraMinutes` | genel 0, görme 30, işitme-1 20, zihinsel 20 | Alt duruma göre: genel 0/20/40, görme 0/30/40, işitme 20, zihinsel 20/40 | Ek süreli deneme süresi bazı adaylar için yanlış |
| 8 | 🟡 | E-KPSS Vatandaşlık | "Engelli Hakları Mevzuatı (5378)" ayrı konu | Resmî tabloda yalnızca "Temel Yurttaşlık Bilgisi" | Konunun sınavda çıktığı teyitsiz. Çıkmış kitapçık sayımıyla doğrulanmalı. |
| 9 | 🟡 | GK Vatandaşlık ve E-KPSS | "Uluslararası Kuruluşlar" Vatandaşlık altında | Resmî Yurttaşlık = hukuk başlangıcı + anayasa/insan hakları + idare. Uluslararası kuruluşlar Güncel kapsamında. | Etiket yeri |
| 10 | 🟡 | `_tarihTopicTestCounts` | Osmanlı öncesi 2 konu × 8 = 16 test; İnkılap 2 konu × 8 = 16 test | Osmanlı öncesi %5 (3 soru), İnkılap %20 (12 soru) | Test sayısı ağırlıkla orantısız. Deneme üretimi resmî ağırlığı kullanmalı. |
| 11 | 🟡 | DHBT-1 | "Kur'an-ı Kerim Bilgisi (Tecvit ve **Kıraat**)" | "Kur'an tarihi, tecvid, Kur'an'ı anlama ve **meal bilgisi**" | Etiket |

✅ **Uyuşanlar:** GK ders soru sayıları (27/18/9/6) · E-KPSS 15+15 ve toplam GK 30 · DHBT 5+7 konu yapısı · AGS 15/15/6/6/30/8 · ÖABT süreleri ve `hasFieldEducationSplit` bayrakları · A Grubu test süreleri (İstatistik 60 dk) · 17 ÖABT alanı ve YDS dilleri.

## 8. Hâlâ Açık Olanlar

| Konu | Neden açık | Önerilen yöntem |
|---|---|---|
| GY Türkçe/Matematik **alt konu** dağılımı | ÖSYM yayımlamıyor | ÖSYM'nin yayımladığı temel kitapçıklardaki soruları konuya göre say (birincil kanıt). YouTube ve site tabloları yalnızca çapraz kontrol için. |
| DHBT konu başına soru sayısı | ÖSYM yayımlamıyor | 2022 ve 2024 DHBT temel kitapçık sayımı |
| E-KPSS'te 5378 sayılı kanun çıkıyor mu, İşitme-1/Zihinsel sadeleştirme düzeyi | Kılavuz yalnızca kuralı veriyor | 2024 Genel / İşitme-1 / Zihinsel kitapçıklarını karşılaştır |
| DKAB ÖABT ağırlıkları | PDF tablo düzeni | Kılavuz s. 35'e görsel bakış |
