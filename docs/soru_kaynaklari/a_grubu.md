# KPSS A Grubu (Alan Bilgisi) — `TASK-144`

**Kod karşılığı:** `_aGrubuCatalog` (`curriculum_registry.dart`) → 9 alan, her biri 40 soru (`Alan Hukuk`, `Alan İktisat`, `Alan Maliye`, `Alan Muhasebe` önce; sonra İşletme, Kamu Yönetimi, Uluslararası İlişkiler, ÇEKO, İstatistik).

## Resmî Kaynaklar

| Kaynak | URL | Ne verir | Durum |
|---|---|---|---|
| ÖSYM 2026 KPSS Lisans Kılavuzu | [kilavuz_Ld01072026.pdf](https://dokuman.osym.gov.tr/pdfdokuman/2026/KPSS/LISANS/kilavuz_Ld01072026.pdf) | Alan Bilgisi testleri, oturumlar, P1–P48 puan türleri | 📥 Onay bekliyor |
| ÖSYM KPSS A Grubu temel kitapçıkları (yıllık) | [osym.gov.tr/SinavGrubu/Index/3](https://osym.gov.tr/SinavGrubu/Index/3) | Tarz, zorluk | 🟡 Referans (telifli) |

> ÖSYM alan testlerinde **alt dal bazlı** soru sayısı yayımlamaz (ör. Hukuk'ta Anayasa/İdare/Ceza/Medeni/Borçlar/Ticaret/İcra dağılımı tahmindir).

## Doğrudan Kullanılabilir (Mevzuat — FSEK m.31) — Kaynak: [mevzuat.gov.tr](https://www.mevzuat.gov.tr)

| Alan | Metinler | ↔ `_aGrubuCatalog` konusu |
|---|---|---|
| **Hukuk** | 2709 T.C. Anayasası | `Anayasa Hukuku` |
| | 2577 İYUK, 2575 Danıştay K., Cumhurbaşkanlığı kararnameleri | `İdare Hukuku ve İdari Yargı` |
| | 5237 TCK, 5271 CMK | `Ceza Hukuku ve Muhakeme` |
| | 4721 TMK | `Medeni Hukuk` |
| | 6098 TBK | `Borçlar Hukuku` |
| | 6102 TTK, 2004 İİK | `Ticaret ve İcra İflas Hukuku` |
| | Yargıtay/Danıştay/AYM kararları ([karararama.yargitay.gov.tr](https://karararama.yargitay.gov.tr), [kararlarbilgibankasi.anayasa.gov.tr](https://kararlarbilgibankasi.anayasa.gov.tr)) | Vaka tabanlı sorular (karar metinleri m.31 kapsamında) |
| **Maliye** | 213 VUK, 193 GVK, 5520 KVK, 3065 KDVK, 6183 AATUHK, 5018 KMYKK | `Vergi Hukuku ve Türk Vergi Sistemi`, `Devlet Bütçesi ve Kamu Borçlanması` |
| **Muhasebe** | Muhasebe Sistemi Uygulama Genel Tebliği (Tekdüzen Hesap Planı), VUK değerleme hükümleri | `Genel Muhasebe ve Tekdüzen Hesap Planı`, `Dönem İçi İşlemler ve Envanter` |
| **ÇEKO** | 4857 İş K., 5510 SSGSSK, 6356 Sendikalar ve TİS K. | `İş Hukuku ve Sosyal Güvenlik Hukuku` |
| **Kamu Yönetimi** | 657 DMK, 5393 Belediye K., 5302 İl Özel İdaresi K. | `Türk Yönetim Tarihi` dışındaki idari yapı soruları |

⚠️ **Güncellik riski en yüksek alan:** vergi oranları, had/eşik tutarlar, CBK ile değişen teşkilat yapısı. Her mevzuat sorusuna yürürlük tarihi notu eklenmeli.

## Referans İçerik (Kopyalanmaz)

| Kaynak | Yayıncı | Tür | Kapsam | Lisans | Kullanım |
|---|---|---|---|---|---|
| Anadolu Üniversitesi AÖF ders içerik sayfaları ([İktisada Giriş I](https://anadolu.edu.tr/akademik/fakulteler/ders/239998/iktisada-giris-i/ders-icerik), [İktisada Giriş II](https://www.anadolu.edu.tr/akademik/fakulteler/ders/240003/iktisada-giris-ii/ders-icerik), [Kamu Maliyesi](https://www.anadolu.edu.tr/akademik/fakulteler/ders/239844/kamu-maliyesi/ders-tanitim), [Maliyeye Giriş](https://anadolu.edu.tr/akademik/fakulteler/ders/240005/maliyeye-giris/ders-icerik)) | Anadolu Üni. | Web | Haftalık konu listeleri | Telifli | 🟡 Konu kapsamı / sıralama |
| AÖF e-kitapları ve çıkmış sorular | Anadolu Üni. | PDF/web | İktisat, Maliye, Muhasebe, İşletme, Kamu Yön. | Telifli (ücretsiz erişim ≠ serbest kullanım) | 🟡 Referans |
| OpenStax *Principles of Economics 2e/3e*, *Introductory Statistics 2e*, *Introductory Business Statistics* ([lisans bilgisi](https://help.openstax.org/s/article/Licensing-information-of-OpenStax-textbooks)) | OpenStax (Rice Üni.) | Web/PDF (İngilizce) | Mikro/Makro İktisat, İstatistik | ⚠️ Çelişkili: kitap sayfaları CC BY 4.0, yardım sayfası CC BY-NC-SA + ticari izin formu | ⚠️ Kitap bazında lisans teyidi yapılana kadar referans. CC BY teyit edilirse bölüm sonu alıştırmaları **atıfla uyarlanabilir** |
| TCMB, TÜİK, Hazine ve Maliye Bakanlığı istatistikleri | Kamu kurumları | Web | `Türkiye Ekonomisi`, `Devlet Bütçesi` | Veriler olgu; metinler telifli olabilir | ✅ Rakamlar olgu olarak (tarih notu şart) |
| GİB vergi rehberleri ([gib.gov.tr](https://www.gib.gov.tr)) | GİB | Web/PDF | Vergi uygulaması | Resmî kurum yayını (m.31 kapsamı belirsiz) | 🟡 Referans |

## Kullanıcı Kaynakları

| URL / Ad | Yayıncı | Tür | ~Soru | Kapsam | Lisans | Eşleşme |
|---|---|---|---|---|---|---|
| *(boş)* | | | | | | |
