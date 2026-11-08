# 🌍 Kadro KPSS Coğrafya Soru Havuzu — Supabase SQL Kurulum Rehberi

Bu klasör, **Kadro: KPSS Lisans Genel Kültür** uygulaması için hazırlanan **360+ adet %100 özgün, pedagojik açıklamalı, 'ÖSYM Çeldirici Tuzağı' (UWorld modeli)** ve **zoom destekli harita/görsel altyapısı** içeren Coğrafya sorularının Supabase veritabanına aktarılması için hazırlanmış SQL dosyalarını içerir.

---

## 📊 Soru Havuzu İstatistikleri ve Konu Dağılımı

| Dosya Adı | Konu | Standart Testler (1-4) | Ek İleri & Check-Up (5-6) | Toplam Soru |
|:---|:---|:---:|:---:|:---:|
| `01_turkiyenin_cografi_konumu.sql` | Türkiye'nin Coğrafi Konumu | 40 Soru | +20 Soru | **60 Soru** |
| `02_turkiyenin_yer_sekilleri_ve_iklimi.sql` | Türkiye'nin Yer Şekilleri ve İklimi | 40 Soru | +20 Soru | **60 Soru** |
| `03_turkiyede_nufus_ve_yerlesme.sql` | Türkiye'de Nüfus ve Yerleşme | 40 Soru | +20 Soru | **60 Soru** |
| `04_turkiyede_tarim_ve_hayvancilik.sql` | Türkiye'de Tarım ve Hayvancılık | 40 Soru | +20 Soru | **60 Soru** |
| `05_madenler_ve_enerji_kaynaklari.sql` | Madenler ve Enerji Kaynakları | 40 Soru | +20 Soru | **60 Soru** |
| `06_sanayi_ticaret_ve_ulasim.sql` | Sanayi, Ticaret ve Ulaşım | 40 Soru | +20 Soru | **60 Soru** |
| **07_ek_testler_test5_ve_test6.sql** | **TÜM KONULAR İÇİN TEST 5 & TEST 6** | — | 120 Soru | **120 Soru** |
| **08_resimli_sorular_ve_image_url_guncellemesi.sql** | **image_url Kolonu & Haritalı Sorular** | — | +3 Örnek | **Haritalı** |
| **00_tum_cografya_sorulari_tek_dosya.sql** | **TÜM COĞRAFYA (360 SORU MASTER)** | **240 Soru** | **120 Soru** | **360 Soru** |

---

## 🚀 Supabase'e Yükleme Adımları

### Senaryo 1: İlk 240 Soruyu Önceden Yüklemiş Olanlar (Hızlı Güncelleme)
Eğer ilk 240 soruyu daha önce Supabase'e yüklediyseniz:
1. Supabase SQL Editor'ü açın.
2. `07_ek_testler_test5_ve_test6.sql` dosyasını çalıştırın (120 yeni soru eklenir).
3. `08_resimli_sorular_ve_image_url_guncellemesi.sql` dosyasını çalıştırın (`image_url` kolonu açılır ve haritalı sorular eklenir).

### Senaryo 2: Sıfırdan Tek Dosya ile Kurulum
1. Supabase SQL Editor'de `08_resimli_sorular_ve_image_url_guncellemesi.sql` içindeki `ALTER TABLE public.questions ADD COLUMN IF NOT EXISTS image_url TEXT;` komutunu çalıştırın.
2. Ardından `00_tum_cografya_sorulari_tek_dosya.sql` dosyasını yapıştırıp **RUN** butonuna tıklayın.

---

## 🗺️ Harita ve Görsel Desteği (Pinch-to-Zoom)
- Uygulama içindeki Soru Çözüm ekranında haritalı sorularda görselin sağ altında **"🔍 Büyüt"** rozeti yer alır.
- Haritaya dokunulduğunda tam ekran **InteractiveViewer** açılarak iki parmakla yakınlaştırma ve harita üzerinde kaydırma imkanı tanınır.
