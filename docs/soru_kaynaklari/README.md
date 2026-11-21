# 📚 Soru Kaynakları Envanteri (TASK-140 – TASK-144)

> **Amaç:** Kadro'da henüz sorusu olmayan sınav türleri için **müfredat/dağılım kaynaklarını** ve **soru referanslarını** tek yerde toplamak.
> **Kapsam dışı:** Soru üretimi ve SQL seed yazımı (bunlar `TASK-139` linter'ı bittikten sonra `TASK-140`–`TASK-144` içinde yapılır).
> **Son güncelleme:** 2026-11-20 · Hazırlayan: Claude (araştırma oturumu) · Hiçbir PDF indirilmedi; yalnızca HTML sayfalar okundu.

## ⚖️ Telif Kuralı (Önce Bunu Oku)

| Kaynak sınıfı | Hukuki durum | Uygulamada kullanım |
|---|---|---|
| **Kanun, yönetmelik, tebliğ, genelge, mahkeme kararı** (mevzuat.gov.tr, Resmî Gazete) | 5846 sayılı FSEK **m.31**: çoğaltılması ve yayımlanması serbest *(madde metni mevzuat.gov.tr'den ayrıca teyit edilmeli)* | ✅ **Metin doğrudan alıntılanabilir.** Soru gövdesinde madde metni, açıklamada madde numarası kullanılabilir. Soru *kendisi* yine özgün yazılır. |
| **ÖSYM çıkmış soruları / temel soru kitapçıkları / örnek sorular** | ÖSYM, soruların FSEK kapsamında eser olduğunu ve izinsiz çoğaltma/yayımın yasak olduğunu duyurdu ([ÖSYM 2016-YGS duyurusu](https://osym.gov.tr/2016ygs-sorularinin-sinav-sonrasi-yayimlanmasi), [telif hakları duyurusu](https://osym.gov.tr/adaya-ozgu-soru-kitapcigi-tasarruflar-telif-haklari-ve-2012-yili-sinav-ucretleri)) | 🟡 **Yalnızca referans:** konu dağılımı, soru kökü kalıbı, zorluk, çeldirici mantığı. Birebir/yakın parafraz **yasak** (`GEMINI.md`). |
| **MEB materyalleri** (OGM Materyal, MEBİ, ders kitapları, TYMM programları) | MEB genel bildirimi: telif MEB'e ait ([MEB telif sayfası](https://www.meb.gov.tr/gizlilik-kullanim-ve-telif-haklari/duyuru/28029/tr)); ticari kullanım için açık izin bulunamadı | 🟡 **Referans.** Öğretim programı/kazanım listeleri müfredat eşlemesi için kullanılır; soru ve metin kopyalanmaz. |
| **Ticari yayınevleri, kurs siteleri, blog dağılım tabloları** | Telifli | 🟡 **Yalnızca konu/zorluk referansı.** Dağılım tabloları çoğu zaman tahmindir; resmî kaynakla doğrula. |
| **Açık lisanslı kaynaklar** (OpenStax vb.) | Lisans kitaptan kitaba değişiyor (CC BY 4.0 ↔ CC BY-NC-SA); OpenStax ticari kullanım için izin formu öneriyor | ⚠️ **Kitap bazında lisans teyidi şart.** Teyit edilene kadar referans say. |
| **Vikipedi / Vikikitap** | CC BY-SA 4.0 (paylaşımda aynı lisans zorunluluğu) | ⚠️ Metin kopyalama yok (SA yükümlülüğü ticari uygulamaya uymaz); olgu kontrolü için kullan. |

**Pratik sonuç:** Uygulamaya *doğrudan* girebilecek tek içerik sınıfı **mevzuat metinleridir**. Geri kalan her şey özgün soru yazarken *referanstır*. Her özgün soru `distractorTrap` alanı içerir.

## 🗂️ Özet Tablo

| # | Sınav | Görev | Resmî dağılım kaynağı | Konu bazlı resmî dağılım var mı? | Doğrudan kullanılabilir | Yalnızca referans | Detay |
|---|---|---|---|---|---|---|---|
| 1 | KPSS GY (Türkçe, Mat-Geo) | `TASK-140` | ÖSYM KPSS kılavuzları | ❌ Yalnızca test düzeyi (GY 60 / GK 60) | TDK Yazım Kılavuzu kuralları (olgu olarak) | ÖSYM temel kitapçıklar, MEB OGM/MEBİ, yayınevleri | [kpss_gy.md](kpss_gy.md) |
| 2 | E-KPSS | `TASK-141` | ÖSYM 2026 EKPSS kılavuzu | ❌ (engel grubu bazlı tablo bulunamadı) | 5378 sayılı Engelliler Hakkında Kanun + yönetmelikler | ÖSYM EKPSS temel kitapçıklar, engel grubu kılavuzları (format) | [ekpss.md](ekpss.md) |
| 3 | KPSS DHBT | `TASK-142` | ÖSYM DHBT kılavuzu | ❌ ÖSYM konu sayısı yayımlamıyor | 633 sayılı DİB Kanunu (mevzuat) | ÖSYM 2014 örnek sorular, 2022/2024 temel kitapçıklar, Diyanet yayınları | [dhbt.md](dhbt.md) |
| 4 | MEB-AGS + ÖABT | `TASK-143` | ÖSYM/MEB 08.01.2026 konu dağılımı PDF'i | ✅ Var (PDF'te; henüz okunmadı) | 1739, 222, 7528 sayılı kanunlar, Anayasa, ilgili yönetmelikler | TYMM Ortak Metni, öğretim programları, ÖSYM Özel Eğitim örnek soruları | [meb_ags_oabt.md](meb_ags_oabt.md) |
| 5 | KPSS A Grubu | `TASK-144` | ÖSYM KPSS (A) kılavuzu | ❌ Yalnızca test düzeyi (40'ar soru) | Anayasa, TCK, TMK, TBK, TTK, İYUK, VUK, 213 GVK, MSUGT (THP) vb. | Anadolu Üni. AÖF ders içerikleri, OpenStax (lisans teyidi), yayınevleri | [a_grubu.md](a_grubu.md) |

> 🔍 **Kaynak inceleme planı (kaynaklar kullanıma girmeden önce):** [kaynak_inceleme_plani.md](kaynak_inceleme_plani.md)
>
> 🧭 **Resmî konu matrisi ve kodla uyuşmazlıklar (önce bunu oku):** [konu_matrisi.md](konu_matrisi.md) · [konu_matrisi.json](konu_matrisi.json)
>
> 🔎 **İndirilebilir kaynak listesi (sınav türü başına, hedef klasörlü):** [bulunan_kaynaklar.md](bulunan_kaynaklar.md) · **GK dosyalarının geldiği site (alonot.com) için yazı bazlı liste:** [alonot.md](alonot.md)

## 📥 İndirme Onayı Bekleyen Resmî PDF'ler

> ✅ **Güncelleme (2026-11-20):** 1–4 numaralı dosyalar kullanıcı onayıyla indirildi ve okundu. Sonuçlar [konu_matrisi.md](konu_matrisi.md)'de. 5–6 hâlâ indirilmedi. Ön Lisans ve Ortaöğretim kılavuzları da indirilip okundu (GY-GK tablosu Lisans'la aynı).

İlk taramada bunlar **indirilmedi**. Boyutlar indirmeden bilinmiyor; onay verirsen önce `HEAD` isteğiyle boyutu ölçüp söylerim, sonra scratchpad'e indirip yalnızca dağılım/konu listelerini çıkarırım.

| Öncelik | Dosya | Kaynak | Ne için |
|---|---|---|---|
| 🔴 1 | `konudagilimi08012026.pdf` | [dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/](https://dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/konudagilimi08012026.pdf) | AGS bölüm/alt konu soru sayıları + 17 ÖABT dağılımı (TASK-143'ün temeli) |
| 🔴 2 | `kilavuz_Ld01072026.pdf` | [dokuman.osym.gov.tr/pdfdokuman/2026/KPSS/LISANS/](https://dokuman.osym.gov.tr/pdfdokuman/2026/KPSS/LISANS/kilavuz_Ld01072026.pdf) | GY-GK ve A Grubu test yapısı, oturum süreleri |
| 🟠 3 | `kilavuz_ekpd0402026.pdf` | [dokuman.osym.gov.tr/pdfdokuman/2026/EKPSS/](https://dokuman.osym.gov.tr/pdfdokuman/2026/EKPSS/kilavuz_ekpd0402026.pdf) | Engel grubu kitapçık yapısı, ek süre, soru dağılımı |
| 🟠 4 | `kilavuz_agsd08052026.pdf` | [dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/](https://dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/kilavuz_agsd08052026.pdf) | AGS/ÖABT puan türleri (P1/P2/P3), süreler |
| 🟡 5 | `DHBTOrnekSorular03042014.pdf` | [dokuman.osym.gov.tr/pdfdokuman/2014/KPSSDHBT/](https://dokuman.osym.gov.tr/pdfdokuman/2014/KPSSDHBT/DHBTOrnekSorular03042014.pdf) | DHBT soru tarzı (yalnızca referans) |
| 🟡 6 | `oeo-sk_agsd04032026.pdf` | [dokuman.osym.gov.tr/pdfdokuman/2026/GENEL/](https://dokuman.osym.gov.tr/pdfdokuman/2026/GENEL/oeo-sk_agsd04032026.pdf) | ÖABT Özel Eğitim örnek soruları (yalnızca referans) |

> KPSS Ön Lisans / Ortaöğretim ve DHBT 2026 kılavuzlarının PDF adresleri henüz bulunmadı; ÖSYM [KPSS sınav grubu sayfasından](https://osym.gov.tr/SinavGrubu/Index/3) bakılacak.

## ✅ Öneriler (Sıralı)

1. **Önce dağılım PDF'lerini (1–4) onayla.** Konu-başı soru sayısı olmadan havuz boyutu ve `exam_scopes` etiketlemesi tahmine kalır. Özellikle AGS için resmî alt konu dağılımı var ve mevcut `CurriculumRegistry` başlıklarının (`Mevzuat (8 Soru)`, `TYMM (30 Soru)`) bu PDF'le teyidi gerekiyor.
2. **Mevzuat-ağırlıklı havuzlarla başla** (en düşük telif riski, en yüksek doğruluk): E-KPSS Engelli Hakları (5378), AGS Mevzuat (1739/222/7528), A Grubu Hukuk. Soru kökü özgün, açıklama madde numarası + metniyle.
3. **GY Türkçe / Matematik** tamamen özgün üretim: kaynak yalnızca konu listesi + ÖSYM tarzı. Matematik soruları için sayıları parametrik üretip (Node betiği) çözümü otomatik doğrulamak `TASK-139` linter'ıyla iyi örtüşür.
4. **DHBT** için dinî metinlerin (meal, hadis) çevirileri Diyanet/TDV telifli; ayet/hadis *referansı* (sure:ayet, kaynak künyesi) verip kendi cümlenle anlat.
5. **Rakamsal/kronolojik olgular** (Türkiye ekonomisi, vergi oranları, eşik tutarlar) **yıllık değişir**: her soruya `valid_from`/kaynak tarihi notu eklenmesi `TASK-139` kapsamında değerlendirilmeli.
6. Rehberpanda, SınavTime vb. dağılım tabloları **resmî değildir** ve birbiriyle çelişir (ör. KPSS Tarih soru sayısında). Mevcut GK dağılımı (`Tarih 27 / Coğrafya 18 / Vatandaşlık 9 / Güncel 6`) ÖSYM Lisans kılavuzundan yeniden teyit edilmeli.

## 🧰 Mevcut İş Akışı (GK'da Kullanılan) ve Yeni Sınavlara Uyarlanması

GK havuzu şöyle üretildi: kopyalanabilir (metin katmanlı) PDF/Word ders notları ve test PDF'leri `Desktop\KPSS\Ders Notlari\kpss-<ders>\` altına toplandı → AI ile soru üretildi. Kopyalanamayanlar `kullanilmayanlar/` alt klasörüne ayrıldı. (Örn. `kpss-tarih`: 15 dosya, ~13 MB; ders notları + test/soru bankası PDF'leri + bir "ÖSYM Çıkmış Sorular" PDF'i.)

**GK kaynaklarının kökeni (2026-11-20 taraması):** 49 dosyanın metadata'sında indirildiği toplama sitesinin adı yok. Dosyaların neredeyse tamamı iLovePDF'ten geçirilmiş, bu da tek bir sitenin dosyaları yeniden işlediğine işaret ediyor (dosya adı kalıbı osymli.com'a benziyor ama doğrulanmadı). Sıkıştırılmış PDF akışları açıldığında **asıl üreticilerin** izleri çıktı:

| Dosya | İçinde geçen kaynak | Risk |
|---|---|---|
| `kpss-tarih/Türk-İslam-Tarihi-Test-2-Ösym-Çıkmış-Sorular-.pdf` | **Yargı Yayınevi "KPSS Tarihsavar" soru bankası** (kitapsec, nkitap, yargiyayinevi bağlantıları, yadi.sk paylaşımı) | 🔴 Ticari kitaptan korsan alıntı + ÖSYM çıkmış soruları. Bundan üretilen sorular öncelikli denetlenmeli. |
| `kpss-tarih/Kpss-Tarih-Ders-Notlari-11.pdf`, `kullanilmayanlar/…Kronolojisi…` | facebook.com/kpsskaynakarsivi, "KPSS Doküman Arşivi" sayfası | 🔴 Paylaşım grubu, asıl yazar belirsiz |
| `kpss-tarih/ramazanyetginkpssdersnotlari.pdf` | kpsscini.com (+ dosya adında yazar: Ramazan Yetgin) | 🔴 Kişi eseri |
| `kpss-cografya/…Ders-Notlari-Test-Sorulari…` (Cograyfya) | izmirkpsskursu.net (68 kez, sayfa altlığı) | 🔴 Kurs materyali |
| `kpss-cografya/Kpss-Genel-Kültür-Coğrafya-Çıkmış-Sorular.pdf` | maximumbilgi.com | 🔴 ÖSYM çıkmış soruları |
| `kpss-cografya/…Ders-Notlari-2.pdf` · `…-6.pdf` · `…Test…-5.pdf`, `…Tesy…` | kpsskonu.com · kpssnotlar.com · turkiyecografyasi.com | 🟡 Site içerikleri |
| `kpss-cografya/Kpss-Coğrafya-Soruları.docx` | kpssrehber.com | 🟡 |
| `kpss-vatandaslik/kpss-lisans-vatandaslik-hap-bilgiler.pdf`, `kpss-guncel/KPSS_Digital_Deneme…` | kpss.digital | 🟡 |
| Diğerleri | İz yok (yalnızca bilgisayar kullanıcı adları: "Asus", "FFG", "yasavur" vb.) | Bilinmiyor |

**Aynı klasör düzeni önerisi (yeni sınavlar):**

```
Ders Notlari/
  kpss-gy-turkce/        kpss-gy-matematik/      kpss-gy-geometri/
  ekpss-engelli-haklari/ dhbt-1/                 dhbt-2-<duzey>/
  ags-egitim-bilimleri/  ags-tymm/               ags-mevzuat/
  oabt-<brans>/          a-hukuk/  a-iktisat/  a-maliye/  a-muhasebe/
    notlar/       ← ders notu, konu özeti (bilgi kaynağı)
    sorular/      ← test PDF'leri, soru bankaları, çıkmış sorular (yalnızca tarz referansı)
    mevzuat/      ← mevzuat.gov.tr'den kanun metinleri (doğrudan kullanılabilir)
    kullanilmayanlar/
```

**Telif açısından kritik ayrım:**

| Klasör | AI'ya nasıl verilir | Risk |
|---|---|---|
| `notlar/` | "Bu metindeki **olgulardan** yeni soru yaz" | Düşük — olgular telifli değil; metin cümleleri soruya taşınmamalı |
| `sorular/` | **Soru üretim girdisi olarak verilmez.** Yalnızca "bu konudan kaç soru, hangi kök kalıbı, hangi çeldirici türü" analizi için | Yüksek — AI, girdi soruları yakın parafrazla yeniden üretir; ÖSYM ve yayınevi soruları telifli |
| `mevzuat/` | Madde metni + madde no ile | Yok (FSEK m.31) |

**Öneri — `TASK-139` linter'ına benzerlik kontrolü:** Üretilen her soru, ilgili klasördeki kaynak metinlere karşı n-gram (ör. 8 kelimelik dizi) örtüşmesiyle taranır; eşik üstü sorular reddedilir. Bu, GK havuzu için de geriye dönük bir denetim olur.

**Kopyalanabilir kaynak ararken:** Google'da `"<konu>" filetype:pdf` / `filetype:docx` + `ders notları` / `konu anlatımı`; kamu kurumu ve üniversite siteleri (`site:edu.tr`, `site:gov.tr`) öncelikli. Kişi/yayınevi adı taşıyan notlar (ör. kurs hocası notları) telifli kabul edilir → yalnızca olgu kaynağı.

## 🤝 Kullanıcıdan Gelecek Kaynaklar

Getirdiğin kaynakları ilgili sınav dosyasının **"Kullanıcı Kaynakları"** tablosuna ekleyeceğim: URL, yayıncı, tür, yaklaşık soru sayısı, konu kapsamı, lisans durumu, `CurriculumRegistry` eşleşmesi.
