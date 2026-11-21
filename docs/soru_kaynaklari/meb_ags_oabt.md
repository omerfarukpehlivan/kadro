# MEB-AGS + ÖABT — `TASK-143`

**Kod karşılığı:** `_resolveMebAgs` → `meb_ags_1` (80 soru / 110 dk, 11 konu başlığı), ÖABT 50 soru (`_oabtTopicsByBranch`, 30 Alan + 20 Alan Eğitimi bölünmesi `hasFieldEducationSplit`), YDS → P3.

## Resmî Kaynaklar

| Kaynak | URL | Ne verir | Durum |
|---|---|---|---|
| **ÖSYM/MEB 2026 AGS + ÖABT konu dağılımı (08.01.2026)** | [konudagilimi08012026.pdf](https://dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/konudagilimi08012026.pdf) · [ÖSYM duyurusu](https://osym.gov.tr/mill-egitim-bakanligi-akademi-giris-sinavi-mebags-2026-akademi-giris-sinavi-ags-ile-2026-ogretmenlik-alan-bilgisi-testi-oabt-konu-dagilimlari) · [MEB haberi](https://www.meb.gov.tr/milli-egitim-bakanligi-akademi-giris-sinavi-konu-dagilimlari-aciklandi/haber/39480/tr) | **Resmî bölüm ve alt konu soru sayıları** | 📥 🔴 En öncelikli indirme |
| 2025 konu dağılımı (karşılaştırma) | [konudagilimi16012025.pdf](https://dokuman.osym.gov.tr/pdfdokuman/2025/MEB-AGS/konudagilimi16012025.pdf) | 2025→2026 değişimi | 📥 İsteğe bağlı |
| 2026 AGS kılavuzu | [kilavuz_agsd08052026.pdf](https://dokuman.osym.gov.tr/pdfdokuman/2026/MEB-AGS/kilavuz_agsd08052026.pdf) | Puan türleri, süreler | 📥 |
| ÖABT Özel Eğitim örnek sorular (04.03.2026) | [ÖSYM sayfası](https://osym.gov.tr/2026mebags-ogretmenlik-alan-bilgisi-testi-oabt-ozel-egitim-alani-ornek-sorular) · [PDF](https://dokuman.osym.gov.tr/pdfdokuman/2026/GENEL/oeo-sk_agsd04032026.pdf) | Yeni eklenen alanın soru tarzı | 🟡 Referans (telifli) |
| 2025 / 2026 AGS-ÖABT temel kitapçıklar | [2026](https://osym.gov.tr/2026-ags-ve-2026-oabt-temel-soru-kitapciklari-ve-cevap-anahtarlari-yayimlandi) · [2025](https://osym.gov.tr/2025ags-ve-2025oabt-temel-soru-kitapciklari-ve-cevap-anahtarlari-yayimlandi) | ~%10 soru | 🟡 Referans |
| TYMM Öğretim Programları Ortak Metni | [tymm.meb.gov.tr/ortak-metin](https://tymm.meb.gov.tr/ortak-metin) · [temel yaklaşım](https://tymm.meb.gov.tr/temel-yaklasim) | Modelin kavramları (beceri çerçevesi, erdem-değer-eylem, öğrenme-öğretme yaklaşımı) | 🟡 Referans · TYMM sorularının **tek resmî içerik kaynağı** |
| TYMM raporları (1, 3) | [Rapor 1](https://tymm.meb.gov.tr/dokuman/25/turkiyenin-gelecegi-icin-ozgun-bir-tasarim-turkiye-yuzyili-maarif-modeli-rapor-1) · [Rapor 3](https://tymm.meb.gov.tr/dokuman/39/turkiyenin-gelecegi-icin-ozgun-bir-tasarim-turkiye-yuzyili-maarif-modeli-rapor-3) | Felsefi temeller | 🟡 Referans |

### MEB sayfasından doğrulanan bilgiler (08.01.2026)

- **AGS:** 80 soru, 110 dk; ÖABT ile aynı gün iki oturum (2026 sınavı: 12 Temmuz 2026).
- **ÖABT:** 50 soru. **90 dk:** İlköğretim Matematik, Fen Bilimleri, Fizik, Kimya. **70 dk:** Biyoloji, Türkçe, Sosyal Bilgiler, Türk Dili ve Edebiyatı, Tarih, Coğrafya, DKAB/İHL Meslek Dersleri, Rehberlik, Sınıf, Okul Öncesi, Beden Eğitimi, **Özel Eğitim (2026'da eklendi)**.
- **Yabancı dil alanları** (Almanca, Arapça, Çince, Farsça, Fransızca, İngilizce, İspanyolca, İtalyanca, Japonca, Korece, Rusça): ÖABT yok, YDS/e-YDS puanı kullanılır. → Koddaki `OabtBranch.ydsDil` ile uyumlu.
- **"Eğitim Bilimleri ve Türk Millî Eğitim Sistemi" kapsamı genişletildi:** eğitimin tarihî/felsefi/toplumsal/ekonomik/politik temelleri, öğretim teknolojileri, öğretim yöntem-teknikleri, sınıf yönetimi, **program okuryazarlığı**, ölçme-değerlendirme, öğrenme psikolojisi, gelişim psikolojisi, rehberlik, TMES'in genel yapısı, TYMM.
- ⚠️ Mevzuat başlığı ve kanun listesi HTML sayfada **yok**. İkincil kaynaklar "Mevzuat %10 = 8 soru: Anayasa, İnsan Hakları, 1739, 222, 7528" diyor → PDF'le teyit edilmeli. Koddaki `Mevzuat (8 Soru)` ve `TYMM … (30 Soru)` etiketleri buna dayanıyor.
- ⚠️ ÖABT süre listesinde Matematik (Lise) yok; koddaki `OabtBranch.matematikLise` PDF'le kontrol edilmeli.

## Doğrudan Kullanılabilir (Mevzuat — FSEK m.31)

| Metin | Eşleşme |
|---|---|
| 1739 sayılı Millî Eğitim Temel Kanunu | `Mevzuat (8 Soru)` |
| 222 sayılı İlköğretim ve Eğitim Kanunu | `Mevzuat (8 Soru)` |
| 7528 sayılı Öğretmenlik Meslek Kanunu | `Mevzuat (8 Soru)` · Millî Eğitim Akademisi bağlamı |
| T.C. Anayasası (eğitim hakkı md. 42 vb.) + İnsan hakları sözleşmeleri | `Mevzuat (8 Soru)` |
| MEB Ortaöğretim / Okul Öncesi ve İlköğretim Kurumları Yönetmelikleri | TMES genel yapısı |
| Özel Eğitim Hizmetleri Yönetmeliği | ÖABT Özel Eğitim: `Özel Eğitim Mevzuatı ve BEP Hazırlama` |

Tümü: [mevzuat.gov.tr](https://www.mevzuat.gov.tr) (güncel değişikliklerle birlikte; her soruya mevzuat tarihi notu).

## Öncelikli ÖABT Branşları — Referans Haritası

| Branş (`OabtBranch`) | Alan Eğitimi referansı (resmî program) | Alan Bilgisi referansı |
|---|---|---|
| `sinifOgretmenligi` | TYMM ilkokul öğretim programları (Türkçe, Mat, Fen, Hayat Bilgisi, Sosyal) | MEB ilkokul ders kitapları (telifli, referans) |
| `okulOncesi` | MEB Okul Öncesi Eğitim Programı | Gelişim psikolojisi akademik literatürü |
| `ozelEgitim` | Özel Eğitim Hizmetleri Yönetmeliği (✅ mevzuat), BEP | ÖSYM 2026 örnek sorular (🟡 tarz) |
| `turkce` | TYMM Türkçe programı | TDK (kural), dil bilgisi literatürü |
| `ilkogretimMatematik` | TYMM ortaokul matematik programı | Parametrik üretim uygun |
| `sosyalBilgiler` | TYMM Sosyal Bilgiler programı | GK Tarih/Coğrafya havuzuyla kısmi paylaşım mümkün |
| `dkabIhl` | TYMM DKAB + İHL meslek dersleri programları | DHBT havuzuyla kısmi paylaşım ([dhbt.md](dhbt.md)) |
| `pdr` | MEB Rehberlik ve Psikolojik Danışma Hizmetleri Yönetmeliği (✅ mevzuat) | AGS rehberlik başlığıyla örtüşür |

**Yeniden kullanım fırsatı:** AGS'nin Tarih (6) ve Türkiye Coğrafyası (6) bölümleri mevcut KPSS GK havuzundan `exam_scopes` etiketiyle beslenebilir — yeni soru yazmadan önce zorluk uygunluğu kontrol edilmeli.

## Kullanıcı Kaynakları

| URL / Ad | Yayıncı | Tür | ~Soru | Kapsam | Lisans | Eşleşme |
|---|---|---|---|---|---|---|
| *(boş)* | | | | | | |
