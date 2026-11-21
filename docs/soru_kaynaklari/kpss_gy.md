# KPSS Genel Yetenek (Türkçe · Matematik & Geometri) — `TASK-140`

**Kod karşılığı:** `kpssGeneralAbilityLessons` (`lib/features/lessons/data/kpss_lessons.dart`) → `turkce` (30 soru, 11 konu), `matematik` (30 soru, 14 konu). E-KPSS'te `_ekpssGyQuestionOverrides` ile 15 + 15.

## Resmî Kaynaklar

| Kaynak | URL | Ne verir | Durum |
|---|---|---|---|
| ÖSYM 2026 KPSS Lisans Kılavuzu | [kilavuz_Ld01072026.pdf](https://dokuman.osym.gov.tr/pdfdokuman/2026/KPSS/LISANS/kilavuz_Ld01072026.pdf) | GY-GK oturumu 130 dk (6 Eylül 2026); test yapısı | 📥 İndirme onayı bekliyor |
| ÖSYM KPSS sınav grubu sayfası | [osym.gov.tr/SinavGrubu/Index/3](https://osym.gov.tr/SinavGrubu/Index/3) | Ön Lisans / Ortaöğretim kılavuzları, temel soru kitapçıkları | Okunacak |
| ÖSYM 2026 KPSS Lisans GY-GK temel kitapçık duyurusu | [osym.gov.tr duyuru](https://osym.gov.tr/2026-kpss-lisans-sinavi-genel-yetenek-genel-kultur-oturumunun-temel-soru-kitapcigi-ve-cevap-anahtari-yayimlandi) | Soruların ~%10'u yayımlanır | 🟡 Yalnızca tarz/zorluk referansı (ÖSYM telifli) |
| TDK Yazım Kılavuzu / Güncel Türkçe Sözlük | [tdk.gov.tr](https://tdk.gov.tr), [sozluk.gov.tr](https://sozluk.gov.tr) | Yazım, noktalama kuralları | ✅ Kurallar olgu olarak kullanılabilir; metin/örnek cümleler kopyalanmaz |

> ⚠️ ÖSYM GY için **konu bazlı** soru sayısı yayımlamaz. Konu dağılımı çıkmış soruların analizinden (yayınevi/kurs tabloları) türetilir ve **tahmindir**.

## Soru Referansları (Hiçbiri Doğrudan Kopyalanmaz)

| Kaynak | Yayıncı | Tür | ~Soru | Kapsam | Lisans | Kullanım |
|---|---|---|---|---|---|---|
| ÖSYM KPSS temel soru kitapçıkları (yıllık) | ÖSYM | PDF | yıl başına ~%10 | GY + GK | Telifli (ÖSYM) | 🟡 Tarz, kök kalıbı, çeldirici mantığı |
| OGM Materyal Mobil Soru Bankası | MEB OGM | Uygulama/web | ~14.130 (tüm dersler) | Lise Türkçe/Edebiyat, Matematik | Telif MEB; ticari izin yok | 🟡 Lise düzeyi matematik konu kapsamı (Ortaöğretim varyantı) |
| MEBİ (YKS hazırlık) | MEB | Web/PDF | Çok sayıda | TYT Türkçe, TYT Matematik | Telif MEB | 🟡 TYT ≈ KPSS GY zorluk ölçeği referansı |
| [SınavTime KPSS konu dağılımı](https://sinavtime.com/kpss-konulari-ve-soru-dagilimi), [Rehberpanda](https://rehberpanda.com/blog/2026-kpss-soru-dagilimi-tum-seviyeler/), [osymli](https://www.osymli.com/kpss/kpss-ortaogretim-lise-konulari-ve-soru-dagilimi.html) | Özel siteler | Web | — | Konu dağılım tahmini | Telifli | 🟡 Yalnızca çapraz kontrol; tablolar birbiriyle çelişiyor |

## Müfredat Eşlemesi (Türkçe)

| `CurriculumRegistry` konusu | Referans kaynağı | Not |
|---|---|---|
| Sözcükte / Cümlede / Paragrafta Anlam | ÖSYM kitapçıkları (tarz) | Paragraf metinleri **özgün** yazılmalı (en çok soru buradan; ~%60 civarı tahmin) |
| Yazım Kuralları, Noktalama | TDK Yazım Kılavuzu | Kural tabanlı; linter ile otomatik kontrol edilebilir |
| Ses Bilgisi, Sözcükte Yapı, Sözcük Türleri, Cümlenin Ögeleri | MEB ortaöğretim Dil ve Anlatım programı | Dil bilgisi terminolojisi MEB programıyla uyumlu tutulmalı |
| Anlatım Bozuklukları | ÖSYM kitapçıkları (tarz) | — |
| Sözel Mantık ve Muhakeme | ÖSYM kitapçıkları (tarz) | Parametrik üretime uygun |

## Müfredat Eşlemesi (Matematik & Geometri)

| `CurriculumRegistry` konusu | Referans | Not |
|---|---|---|
| Temel Kavramlar … Üslü-Köklü, Çarpanlara Ayırma, Oran-Orantı | MEB ortaöğretim matematik programı | **Parametrik üretim önerisi:** sayılar betikle seçilir, doğru cevap hesaplanır, çeldiriciler tipik hatalardan türetilir |
| Problemler (Yaş, İşçi, Hareket, Yüzde, Karışım) | ÖSYM kitapçıkları (tarz) | KPSS'nin en yoğun bloğu (tahmin) |
| Kümeler, Fonksiyon, Modüler Aritmetik, PKO | MEB programı | — |
| Sayısal Mantık, Tablo-Grafik | ÖSYM kitapçıkları | Grafik soruları için görsel üretim gerekir (`fl_chart` veya SVG) |
| Geometri (Açılar, Üçgen, Çokgen, Çember, Analitik, Katı Cisimler) | MEB programı | **Şekil gerekir** — görsel varlık hattı ayrıca planlanmalı (TASK-140 kapsamına not) |

**Düzey varyantı:** Ortaöğretim (P94) ve Ön Lisans (P93) soruları aynı konu listesiyle ama daha düşük zorlukta; `education_level` ile ayrıştırılır.

## Kullanıcı Kaynakları

| URL / Ad | Yayıncı | Tür | ~Soru | Kapsam | Lisans | Eşleşme |
|---|---|---|---|---|---|---|
| *(boş)* | | | | | | |
