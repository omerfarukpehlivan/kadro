# 🌍 Kadro KPSS Coğrafya Soru Havuzu — Supabase SQL Kurulum Rehberi

Bu klasör, **Kadro: KPSS Lisans Genel Kültür** uygulaması için hazırlanan **240 adet %100 özgün, pedagojik açıklamalı ve 'ÖSYM Çeldirici Tuzağı' (UWorld modeli)** içeren Coğrafya sorularının Supabase veritabanına aktarılması için hazırlanmış SQL dosyalarını içerir.

---

## 📊 Soru Havuzu İstatistikleri ve Konu Dağılımı

| Dosya Adı | Konu | Kolay (Z1) | Orta (Z2) | Zor (Z3) | Toplam |
|:---|:---|:---:|:---:|:---:|:---:|
| `01_turkiyenin_cografi_konumu.sql` | Türkiye'nin Coğrafi Konumu | 10 | 20 | 10 | **40** |
| `02_turkiyenin_yer_sekilleri_ve_iklimi.sql` | Türkiye'nin Yer Şekilleri ve İklimi | 10 | 20 | 10 | **40** |
| `03_turkiyede_nufus_ve_yerlesme.sql` | Türkiye'de Nüfus ve Yerleşme | 10 | 20 | 10 | **40** |
| `04_turkiyede_tarim_ve_hayvancilik.sql` | Türkiye'de Tarım ve Hayvancılık | 10 | 20 | 10 | **40** |
| `05_madenler_ve_enerji_kaynaklari.sql` | Madenler ve Enerji Kaynakları | 10 | 20 | 10 | **40** |
| `06_sanayi_ticaret_ve_ulasim.sql` | Sanayi, Ticaret ve Ulaşım | 10 | 20 | 10 | **40** |
| **00_tum_cografya_sorulari_tek_dosya.sql** | **TÜM COĞRAFYA (BİRLEŞİK)** | **60** | **120** | **60** | **240** |

---

## 🚀 Supabase'e Yükleme Adımları (Tek Tıkla Kurulum)

### Yöntem A: Tüm Soruları Tek Seferde Yükleme (Önerilen)
1. **Supabase Dashboard**'unuza (`https://supabase.com/dashboard`) gidin ve projenizi açın.
2. Sol menüden **"SQL Editor"** sekmesine tıklayın.
3. **"New Query"** butonuna basarak boş bir SQL editörü açın.
4. Bu klasördeki `00_tum_cografya_sorulari_tek_dosya.sql` dosyasının içeriğini kopyalayıp editöre yapıştırın.
5. Sağ alttaki yeşil **"RUN"** butonuna tıklayın.
6. Birkaç saniye içinde **"Success. No rows returned"** mesajını göreceksiniz. Tüm 240 soru veritabanınıza başarıyla eklenmiş olacaktır!

### Yöntem B: Konu Konu Parça Parça Yükleme
- İsterseniz `01_...sql` dosyasından başlayarak sırasıyla her konuyu ayrı birer query olarak çalıştırabilirsiniz.
- Her dosya kendi içinde `BEGIN;` ve `COMMIT;` transaction bloklarıyla koruma altındadır; işlem yarıda kalırsa rollback yapılır, veri bozulmaz.

---

## 🛡️ Soru Kalitesi ve Pedagojik Standartlar
1. **Telif Garantisi:** Soruların tamamı KPSS müfredatı ve kaynak dokümanlar analiz edilerek sıfırdan özgün olarak yazılmıştır; ÖSYM'nin çıkmış sorularının birebir kopyası değildir.
2. **"⚠️ ÖSYM Çeldirici Tuzağı" (UWorld Modeli):** Her soruda, adayın sınav anında en çok çelişkiye düşebileceği şıkkın neden yanıltıcı olduğu ve neden doğru sanıldığı psikolojik ve kavramsal olarak analiz edilmiştir.
3. **Zorluk Seviyesi:** Her konu 4 dengeli testten (1 Isınma, 2 Standart ÖSYM Ayarı, 1 Kurtlar Sofrası / Net Sıçratan) oluşur.
