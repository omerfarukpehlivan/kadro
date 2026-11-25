# Matematik & Geometri Soru Üretim Raporu (TASK-173 · 10'un Katı / 59 Test Tamamlandı)

## Özet Tablo (Parti 1–10 · Toplam 590 Soru · 59 Test)

| Dosya | Soru Sayısı | Hedef (10'un Katı) | Test (10'lu) | Kaynak Kapasitesi (Özgün) | Zorluk (1 / 2 / 3) | Doğru Şık (A / B / C / D / E) | Şekilli | Sayısal Doğrulanan | `dogrulama: yok` |
|---|---|---|---|---|---|---|---|---|---|
| `01_temel_kavramlar_ve_sayi_basamaklari.md` | 40 | 40 | 4 | 55–70 | 12 / 20 / 8 | 7 / 8 / 9 / 9 / 7 | 1 | 34 | 6 |
| `02_bolme_bolunebilme_ve_ebob_ekok.md` | 40 | 40 | 4 | 40–55 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 4 | 39 | 1 |
| `03_rasyonel_ve_ondalik_sayilar.md` | 30 | 30 | 3 | 30–40 | 9 / 15 / 6 | 6 / 6 / 6 / 6 / 6 | 2 | 27 | 3 |
| `04_basit_esitsizlikler_ve_mutlak_deger.md` | 30 | 30 | 3 | 35–45 | 9 / 15 / 6 | 6 / 6 / 6 / 6 / 6 | 2 | 28 | 2 |
| `05_uslu_ve_koklu_ifadeler.md` | 40 | 40 | 4 | 45–60 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 5 | 38 | 2 |
| `06_carpanlara_ayirma_ve_oran_oranti.md` | 40 | 40 | 4 | 40–55 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 5 | 38 | 2 |
| `07_denklem_cozme_ve_sayi_kesir_problemleri.md` | 50 | 50 | 5 | 65–85 | 15 / 25 / 10 | 10 / 10 / 10 / 10 / 10 | 0 | 50 | 0 |
| `08_yas_isci_hareket_yuzde_ve_karisim_problemleri.md` | 70 | 70 | 7 | 90–120 | 21 / 35 / 14 | 14 / 14 / 14 / 14 / 14 | 0 | 70 | 0 |
| `09_kumeler_baginti_fonksiyon_ve_moduler_aritmetik.md` | 40 | 40 | 4 | 40–50 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 13 | 38 | 2 |
| `10_permutasyon_kombinasyon_ve_olasilik.md` | 40 | 40 | 4 | 40–50 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 5 | 40 | 0 |
| `11_sayisal_mantik_ve_tablo_grafik_yorumlama.md` | 60 | 60 | 6 | 80–110 | 18 / 30 / 12 | 12 / 12 / 12 / 12 / 12 | 44 | 60 | 0 |
| `12_dogruda_ve_ucgende_acilar_ucgenler.md` | 40 | 40 | 4 | 45–60 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 35 | 40 | 0 |
| `13_cokgenler_dortgenler_ve_cember_daire.md` | 40 | 40 | 4 | 40–55 | 12 / 20 / 8 | 8 / 8 / 8 / 8 / 8 | 34 | 40 | 0 |
| `14_analitik_geometri_ve_kati_cisimler.md` | 30 | 30 | 3 | 30–40 | 9 / 15 / 6 | 6 / 6 / 6 / 6 / 6 | 18 | 30 | 0 |
| **Toplam** | **590** | **590** | **59** | **675–890** | **177 / 295 / 118 (%30 / %50 / %20)** | **117 / 118 / 119 / 119 / 117** | **168** | **572** | **18** |

## `dogrulama: yok` Olan Sorular ve Gerekçesi

| Kimlik | Gerekçe |
|---|---|
| `mat-01-002`, `mat-01-011` | Şıklar öncül birleşimi (`Yalnız I`, `I ve III` vb.). |
| `mat-01-003` | Şıklar işaret üçlüsü (`-, -, +` vb.). |
| `mat-01-015`, `mat-01-029` | Şıklar değişkenli cebirsel parite ifadeleri ($a + b$, $x \cdot y$ vb.). |
| `mat-01-027` | Şıklar değişkenli cebirsel işaret ifadeleri ($a + b$, $(b - a) \cdot c$ vb.). |
| `mat-02-010`, `mat-09-020` | Şıklar haftanın günleri (sözel). |
| `mat-03-004`, `mat-03-014`, `mat-05-012`, `mat-05-018` | Şıklar üçlü sıralama eşitsizliği. |
| `mat-03-009`, `mat-04-007`, `mat-04-013`, `mat-06-005`, `mat-06-017` | Şıklar değişkenli cebirsel ifadeler. |
| `mat-09-021` | Şıklar periyodik harf dizisi elemanları (`K`, `A`, `R`, `D`, `O`). |

## Son Doğrulama Sonuçları

- `node tools/math/compile_questions.mjs --preview`: **14 dosya · 590 soru · 572 sayısal doğrulandı · 168 şekilli · 0 hata · 0 uyarı** (KaTeX render denetimi açık).
- `node tools/math/bundle_sql.mjs`: [00_tum_matematik_sorulari_tek_dosya.sql](file:///c:/Users/omere/projelerim/gunisigi/docs/soru_havuzu/matematik/00_tum_matematik_sorulari_tek_dosya.sql) (**14 dosya · 590 soru · 937.2 KB**) üretildi.
- `node --test tools/math/`: **19/19** birim testi geçti.
- Parti 10'da eklenen tüm 29 yeni SVG şekli çakışma/taşma denetiminden (`overlaps=[]`, `clipped=[]`) ve tarayıcı görsel kontrolünden temiz geçti.
