# KPSS DHBT — `TASK-142`

**Kod karşılığı:** `_resolveDhbt` → `dhbt_1` (20 soru, 5 konu) + `dhbt_2` (20 soru, `_dhbt2TopicsByLevel` ile Ortaöğretim/Ön Lisans/Lisans için 7'şer konu). Toplam 40 soru / 60 dk.

## Resmî Kaynaklar

| Kaynak | URL | Ne verir | Durum |
|---|---|---|---|
| ÖSYM DHBT örnek sorular sayfası | [osym.gov.tr](https://osym.gov.tr/din-hizmetleri-alan-bilgisi-testidhbtornek-sorular) | Tek bağlantı: 2014 tarihli örnek sorular PDF'i | 📥 PDF onay bekliyor · 🟡 Referans |
| 2022 / 2024 DHBT temel soru kitapçıkları | [2022](https://www.osym.gov.tr/2022kpss-din-hizmetleri-alan-bilgisi-dhbt-temel-soru-kitapciklari-ve-cevap-anahtarlari-10), [2024](https://www.osym.gov.tr/2024kpss-din-hizmetleri-alan-bilgisi-dhbt-temel-soru-kitapciklari-ve-cevap-anahtarlari-10) | Güncel soru tarzı | 🟡 Referans (telifli) |
| 2026 DHBT kılavuzu | ÖSYM KPSS sayfası | Sınav 1 Kasım 2026 (ikincil kaynaklara göre) | 🔍 PDF adresi bulunamadı |

> ⚠️ ÖSYM DHBT için **alan bazlı soru sayısı yayımlamaz**. Yapı kesin: 40 soru, ilk 20 DHBT-1 (ortak), son 20 DHBT-2 (öğrenim düzeyine göre).

## Gayriresmî Dağılım (Rehberpanda — Mayıs 2026)

Kaynak: [rehberpanda.com/rehberler/kpss-dhbt/konu-dagilimi](https://rehberpanda.com/rehberler/kpss-dhbt/konu-dagilimi/). Sayfa kendisi "ÖSYM kılavuzunda yer almaz" diyor; 20 soru başlıklara yaklaşık eşit bölünmüş bir **çalışma çerçevesi**.

| DHBT-1 (20) | Soru | ↔ `CurriculumRegistry` |
|---|---|---|
| Kur'an Bilgisi (tarih, tecvit, med-vakıf, meal) | 4 | `Kur'an-ı Kerim Bilgisi (Tecvit ve Kıraat)` |
| İslam İnanç Esasları | 4 | `Akaid ve Temel İnanç Esasları` |
| İslam İbadet Esasları | 4 | `Fıkıh ve İlmihal (İbadetler)` |
| Siyer | 4 | `Siyer-i Nebi ve İlk Dönem İslam Tarihi` |
| İslam Ahlakı | 4 | `İslam Ahlakı ve Kavramlar` |

| DHBT-2 (20) | Soru | ↔ `_dhbt2TopicsByLevel` (Lisans örneği) |
|---|---|---|
| Tefsir | 3 | `Klasik ve Çağdaş Tefsir Usulü ve Kaynakları` |
| Fıkıh | 3 | `İslam Hukuk Felsefesi, Usul-i Fıkıh ve Mukayeseli Fıkıh` |
| Hadis | 3 | `Hadis Metodolojisi, Temel Külliyat ve Rical İlmi` |
| Akaid ve Kelam | 3 | `Kelam İlmi, İslam Mezhepleri Tarihi ve Din Felsefesi` |
| İslam Tarihi | 3 | `Siyer-i Nebi, İslam Tarihi ve İslam Medeniyeti` |
| Dinler ve Mezhepler Tarihi | 3 | `Karşılaştırmalı Dinler Tarihi` |
| Dini Hitabet | 2 | `Din Psikolojisi, Din Sosyolojisi ve Hitabet-İrşat` |

✅ Kodun 5 + 7 konu yapısı bu çerçeveyle birebir örtüşüyor. Lisans etiketi "Din Psikolojisi, Din Sosyolojisi" içeriyor; gayriresmî tablo yalnızca Hitabet diyor → teyit gerekli.

**Düzey kaynakları (ikincil kaynak iddiası, doğrulanmadı):** Lisans → İlahiyat lisans müfredatı; Ön Lisans → İlahiyat ön lisans; Ortaöğretim → İmam Hatip lisesi meslek dersleri programı (MEB, [tymm.meb.gov.tr](https://tymm.meb.gov.tr) / DÖGM).

## Referans İçerik (Telifli — Kopyalanmaz)

| Kaynak | Yayıncı | Not |
|---|---|---|
| Kur'an-ı Kerim Meali ([kuran.diyanet.gov.tr](https://kuran.diyanet.gov.tr)) | DİB | Meal metni telifli; soruda **sure:ayet künyesi** ver, kendi ifadenle anlat |
| İlmihal, Hadislerle İslam | DİB / TDV | Kavram doğruluğu kontrolü |
| İHL meslek dersleri ders kitapları | MEB | Ortaöğretim düzeyi kapsamı |
| 633 sayılı DİB Kuruluş ve Görevleri Hakkında Kanun | mevzuat.gov.tr | ✅ Mevzuat — doğrudan kullanılabilir (mesleki bilgi kartı) |

**Hassasiyet notu:** Mezhep/itikadi farklılık sorularında açıklamalar tarafsız ve kaynak künyeli olmalı; içerik bir ilahiyat uzmanına inceletilmeli (`TASK-142` kabul kriterine öneri).

## Kullanıcı Kaynakları

| URL / Ad | Yayıncı | Tür | ~Soru | Kapsam | Lisans | Eşleşme |
|---|---|---|---|---|---|---|
| *(boş)* | | | | | | |
