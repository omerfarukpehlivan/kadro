# ⚖️ Kadro KPSS Vatandaşlık Soru Havuzu — Supabase SQL Kurulum Rehberi

Bu klasör, **Kadro: KPSS Lisans Genel Kültür** uygulaması için hazırlanan **300 adet %100 özgün, pedagojik açıklamalı ve 'ÖSYM Çeldirici Tuzağı' (UWorld modeli)** içeren Vatandaşlık sorularının Supabase veritabanına aktarılması için hazırlanmış SQL dosyalarını içerir.

---

## 📊 Soru Havuzu İstatistikleri ve Konu Dağılımı

| Dosya Adı | Konu | Kolay (Z1) | Orta (Z2) | Zor (Z3) | Toplam |
|:---|:---|:---:|:---:|:---:|:---:|
| `01_temel_hukuk_kavramlari.sql` | Temel Hukuk Kavramları | 10 | 20 | 10 | **40** |
| `02_1982_anayasasi_ve_temel_ilkeler.sql` | 1982 Anayasası ve Temel İlkeler | 10 | 20 | 10 | **40** |
| `03_temel_hak_ve_odevler.sql` | Temel Hak ve Ödevler | 10 | 20 | 10 | **40** |
| `04_yasama_yurutme_ve_yargi.sql` | Yasama, Yürütme ve Yargı | 10 | 20 | 10 | **40** |
| `05_idare_hukuku.sql` | İdare Hukuku | 10 | 20 | 10 | **40** |
| `06_uluslararasi_kuruluslar.sql` | Uluslararası Kuruluşlar | 10 | 20 | 10 | **40** |
| **00_tum_vatandaslik_sorulari_tek_dosya.sql** | **TÜM VATANDAŞLIK (BİRLEŞİK)** | **60** | **120** | **60** | **300** |

---

## 🚀 Supabase'e Yükleme Adımları (Tek Tıkla Kurulum)

### Yöntem A: Tüm Soruları Tek Seferde Yükleme (Önerilen)
1. **Supabase Dashboard**'unuza (`https://supabase.com/dashboard`) gidin ve projenizi açın.
2. Sol menüden **"SQL Editor"** sekmesine tıklayın.
3. **"New Query"** butonuna basarak boş bir SQL editörü açın.
4. Bu klasördeki `00_tum_vatandaslik_sorulari_tek_dosya.sql` dosyasının içeriğini kopyalayıp editöre yapıştırın.
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
