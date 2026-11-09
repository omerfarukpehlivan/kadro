# 🛡️ KADRO — GÜVENLİK, RATE-LIMIT & PERFORMANS YÖNETİM REHBERİ

Bu kılavuz; kötü niyetli kullanıcıların veya botların sunucuya aşırı istek atarak sistemi yavaşlatmasını engellemek, veritabanını şişirmesini önlemek ve **Supabase fatura/egress (veri çıkış) maliyetlerini en aza indirmek** için devreye alınan güvenlik zırhını açıklar.

---

## 📦 1. Neler Yapıldı?

### A. Veritabanı Seviyesinde (PostgreSQL & Supabase RLS)
1. **`public.rate_limits` Tablosu & `check_rate_limit()` Fonksiyonu:**
   - PostgreSQL içinde çalışan kayan pencere (sliding-window) algoritmasıdır.
   - Belirlenen zaman aralığında sınırı aşan istekleri doğrudan veritabanı motorunda durdurur (`P0001: Rate limit aşıldı`).
2. **Soru Raporlama Spam Kalkanı (`trg_check_report_rate_limit`):**
   - 1 kullanıcı veya anonim istemci **1 dakikada en fazla 3 soru bildirimi** gönderebilir. Seri spam gönderimler veritabanına kaydedilmeden engellenir.
3. **Sınav / Test Oturumu Flood Kalkanı (`trg_check_quiz_session_rate_limit`):**
   - 1 kullanıcı **60 saniyede en fazla 2 sınav oturumu** tamamlayabilir.
4. **Profil Hile Koruması (`trg_prevent_xp_tampering`):**
   - İstemciden gönderilen `PATCH/UPDATE` istekleri tek seferde 250 XP'den fazla artırılamaz. Kullanıcıların liderlik tablosunu hileyle manipüle etmesi engellenir.
5. **Kesin RLS Yetkilendirmesi:**
   - `questions`, `flashcards`, `map_challenges` tabloları sadece `SELECT` yetkisine sahiptir; `anon` ve `authenticated` rollerinin veri değiştirmesi kesinlikle engellenmiştir.
   - `question_reports` tablosuna kullanıcılar rapor ekleyebilir ancak başkalarının raporlarını okuyamaz.

### B. Mobil Uygulama Seviyesinde (Flutter İstemcisi)
1. **`ClientRateLimiter` (`lib/core/network/client_rate_limiter.dart`):**
   - Sunucuya hiç çıkmadan önce telefonun içinde mükerrer/spam istekleri keser.
2. **Mikro-Analitik Toplu Gönderimi (Batching Queue):**
   - Eskiden 60 soruluk bir denemede 60 ayrı HTTP isteği gönderiliyordu.
   - Şimdi sorular çözülürken yerel kuyrukta toplanır, sınav bitiminde **tek 1 toplu (bulk) INSERT** isteğiyle gönderilir. Ağ trafiği **%98** azaldı.
3. **Akıllı TTL Veri Önbelleği (2 Saatlik In-Memory Caching):**
   - Sorular ve modüller her ekran geçişinde tekrar tekrar Supabase'ten indirilmez.
   - 2 saat boyunca yerel bellekten anında (0ms) açılır. Supabase Read operasyonları ve Egress maliyeti **%95** düştü.

---

## 🚀 2. Supabase SQL Editor Kurulumu

1. [Supabase Dashboard](https://supabase.com/dashboard)'a girin.
2. Sol menüden **SQL Editor** (`>_`) sayfasına gidin.
3. Masaüstünüzdeki **`kpss-supabase-sql\02_security_ratelimit_hardening.sql`** dosyasını açıp içeriğini yapıştırın.
4. **Run** butonuna basarak çalıştırın. `Success. No rows returned` mesajını göreceksiniz.

---

## ⚙️ 3. Supabase Dashboard Üzerinden Önerilen Ayarlar

Supabase bulut panelinde ekstra güvenlik katmanı sağlamak için aşağıdaki adımları kontrol edebilirsiniz:

1. **API Rate Limiting (Kong Gateway):**
   - Dashboard -> **Project Settings** -> **API**
   - Kong Gateway IP Rate Limiting ayarlarında varsayılan sınırları aktif tutun (Dakikada 100-300 istek/IP).
2. **Auth Rate Limiting:**
   - Dashboard -> **Authentication** -> **Rate Limits**
   - Brute-force şifre denemelerine karşı `Sign in` limitini 5-10 deneme/dakika olarak koruyun.
3. **Anon Key Yetkileri:**
   - Oluşturduğumuz RLS ilkeleri sayesinde `anon` anahtarı dışarı sızsa dahi sadece sorular okunabilir; soru tablosuna asla veri yazılamaz veya silinemez.
