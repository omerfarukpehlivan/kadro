# E-KPSS — `TASK-141`

**Kod karşılığı:** `_resolveEkpss` (`curriculum_registry.dart`) → GK 30 (`Tarih 13 / Coğrafya 5 / Vatandaşlık 6 / Güncel 6`) + GY 30 (`Türkçe 15 / Matematik 15`); Vatandaşlık'ta `Engelli Hakları Mevzuatı (5378 Sayılı Kanun)` konusu; engel grubu `disability_variant` (`Genel`, `Görme`, `İşitme-1`, `Zihinsel`).

> ⚠️ Koddaki 13/5/6/6 ve 15/15 sayıları ÖSYM kılavuzundan **teyit edilmedi**; kılavuz PDF'i okunduğunda kontrol edilmeli.

## Resmî Kaynaklar

| Kaynak | URL | Ne verir | Durum |
|---|---|---|---|
| ÖSYM 2026 EKPSS Kılavuzu | [kilavuz_ekpd0402026.pdf](https://dokuman.osym.gov.tr/pdfdokuman/2026/EKPSS/kilavuz_ekpd0402026.pdf) | "Sınavda Kullanılacak Soru Kitapçığı" bölümü: engel grubu ve öğrenim düzeyine göre kitapçık yapısı (yönetmelik + Aile ve Sosyal Hizmetler / Sağlık Bakanlığı protokolüne dayanır) | 📥 İndirme onayı bekliyor |
| Görme engelli adaylar için 2026 EKPSS kılavuzu | [osym.gov.tr](https://osym.gov.tr/gorme-engelli-adaylar-icin-hazirlanmis-2026-ekpss-ve-kura-kilavuzu) | Punto seçimi (eski belgede 9/14 punto), okuyucu desteği | Okunacak |
| İşitme engelli adaylar kılavuzu (2016) | [osym.gov.tr](https://osym.gov.tr/isitme-engelli-adaylar-icin-hazirlanmis-2016-ekpss-kilavuzu) | Sadeleştirilmiş metin yaklaşımı (eski) | Okunacak |
| 2026 EKPSS temel soru kitapçıkları (19.04.2026) | [osym.gov.tr](https://osym.gov.tr/2026ekpss-temel-soru-kitapciklari-ve-cevap-anahtarlari-yayimlandi) | Engel grubu kitapçıkları arasındaki dil/uzunluk farkı | 🟡 Referans (telifli). **`İşitme-1` / `Zihinsel` sadeleştirme kalıbını öğrenmek için en değerli kaynak** |
| EKPSS sınav grubu sayfası | [osym.gov.tr/SinavGrubu/Menu/353](https://osym.gov.tr/SinavGrubu/Menu/353) | Arşiv | — |

## Doğrudan Kullanılabilir (Mevzuat — FSEK m.31)

| Metin | URL | Eşleşme |
|---|---|---|
| 5378 sayılı Engelliler Hakkında Kanun | [mevzuat.gov.tr](https://www.mevzuat.gov.tr) (Kanun No: 5378) | `Engelli Hakları Mevzuatı (5378 Sayılı Kanun)` |
| Engelli Kamu Personeli Seçme Sınavı ve Engellilerin Devlet Memurluğuna Atanmaları Hakkında Yönetmelik | mevzuat.gov.tr | Bağlam/bilgi kartı |
| BM Engelli Haklarına Dair Sözleşme (Türkiye onaylı, Resmî Gazete) | mevzuat.gov.tr / resmigazete.gov.tr | `İdare Hukuku ve Uluslararası Kuruluşlar` |
| T.C. Anayasası | mevzuat.gov.tr | `T.C. Anayasası (Yasama, Yürütme, Yargı)` |

## Sadeleştirilmiş Varyant Notu

ÖSYM'nin engel grubu kitapçıklarında soru sayısı aynı kalıp metin kısalıyor mu, yoksa soru seti mi değişiyor — bu, kılavuz + temel kitapçık karşılaştırmasıyla netleşmeli. Sonuç `disability_variant` başına **ayrı soru** mu yoksa **aynı sorunun sade metin alanı** mı tutulacağını belirler (şema kararı → Web kolonunu etkiler).

## Kullanıcı Kaynakları

| URL / Ad | Yayıncı | Tür | ~Soru | Kapsam | Lisans | Eşleşme |
|---|---|---|---|---|---|---|
| *(boş)* | | | | | | |
