# 🌍 Kadro KPSS Güncel Bilgiler & Genel Kültür Soru Havuzu — Supabase SQL Kurulum Rehberi

Bu klasör, **Kadro: KPSS Lisans Genel Kültür** uygulaması için hazırlanan **240 adet %100 özgün, pedagojik açıklamalı ve 'ÖSYM Çeldirici Tuzağı' (UWorld modeli)** içeren Güncel Bilgiler sorularının Supabase veritabanına aktarılması için hazırlanmış SQL dosyalarını içerir.

---

## 📊 Soru Havuzu İstatistikleri ve Konu Dağılımı

| Dosya Adı | Konu | Kolay (Z1) | Orta (Z2) | Zor (Z3) | Toplam |
|:---|:---|:---:|:---:|:---:|:---:|
| `01_turkiye_ve_dunya_gundemi.sql` | Türkiye ve Dünya Gündemi | 10 | 20 | 10 | **40** |
| `02_kultur_sanat_ve_edebiyat.sql` | Kültür, Sanat ve Edebiyat | 10 | 20 | 10 | **40** |
| `03_bilim_ve_teknoloji_gelismeleri.sql` | Bilim ve Teknoloji Gelişmeleri | 10 | 20 | 10 | **40** |
| `04_spor_ve_olimpiyatlar.sql` | Spor ve Olimpiyatlar | 10 | 20 | 10 | **40** |
| `05_unesco_miras_listesi.sql` | UNESCO Miras Listesi | 10 | 20 | 10 | **40** |
| `06_onemli_gunler_ve_zirveler.sql` | Önemli Günler ve Zirveler | 10 | 20 | 10 | **40** |
| **00_tum_guncel_bilgiler_sorulari_tek_dosya.sql** | **TÜM GÜNCEL BİLGİLER (BİRLEŞİK)** | **60** | **120** | **60** | **240** |

---

## 🚀 Supabase'e Yükleme Adımları (Tek Tıkla Kurulum)

### Yöntem A: Tüm Soruları Tek Seferde Yükleme (Önerilen)
1. **Supabase Dashboard**'unuza (`https://supabase.com/dashboard`) gidin ve projenizi açın.
2. Sol menüden **"SQL Editor"** sekmesine tıklayın.
3. **"New Query"** butonuna basarak boş bir SQL editörü açın.
4. Bu klasördeki `00_tum_guncel_bilgiler_sorulari_tek_dosya.sql` dosyasının içeriğini kopyalayıp editöre yapıştırın.
5. Sağ alttaki yeşil **"RUN"** butonuna tıklayın.
6. Birkaç saniye içinde **"Success. No rows returned"** mesajını göreceksiniz. Tüm 240 soru veritabanınıza başarıyla eklenmiş olacaktır!

### Yöntem B: Konu Konu Parça Parça Yükleme
- İsterseniz `01_...sql` dosyasından başlayarak sırasıyla her konuyu ayrı birer query olarak çalıştırabilirsiniz.
- Her dosya kendi içinde `BEGIN;` ve `COMMIT;` transaction bloklarıyla koruma altındadır; işlem yarıda kalırsa rollback yapılır, veri bozulmaz.

---

## 🛡️ Soru Kalitesi ve Pedagojik Standartlar
1. **2024-2026 Güncel Veriler:** 2026 Ankara NATO Zirvesi, 2024 Paris Olimpiyatları (Yusuf Dikeç, Buse Naz Çakıroğlu), Alper Gezeravcı ve Tuva Cihangir Atasever uzay misyonları, KAAN ve Kızılelma uçuşları, Türksat 6A ve İMECE uyduları, Gordion ve Ahşap Hipostil Camileri (20. ve 21. UNESCO mirasları), 2024 Nobel ödülleri (Han Kang, Yapay Zeka - AlphaFold, Nihon Hidankyo) gibi en son resmi verilerle sıfırdan hazırlanmıştır.
2. **"⚠️ ÖSYM Çeldirici Tuzağı" (UWorld Modeli):** Her soruda, adayın sınav anında en çok çelişkiye düşebileceği şıkkın neden yanıltıcı olduğu ve neden doğru sanıldığı psikolojik ve kavramsal olarak analiz edilmiştir.
3. **4 Dengeli Test Yapısı:** Her konu 4 dengeli testten (1 Isınma, 2 Standart ÖSYM Ayarı, 1 Kurtlar Sofrası / Net Sıçratan) oluşur.
