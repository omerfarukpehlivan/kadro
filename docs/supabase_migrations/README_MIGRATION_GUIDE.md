# 🏛️ Kadro KPSS — Supabase Veritabanı ve Soru Havuzu Tam Migrasyon Rehberi

Bu rehber, **Kadro: KPSS Lisans Genel Kültür** uygulaması için geliştirilen tüm soru havuzunun, interaktif oyunların ve hafıza kartlarının **Supabase PostgreSQL** veritabanına tek tıkla yüklenmesi için hazırlanmıştır.

Tüm dosyalar hem repo içinde `docs/supabase_migrations/` klasöründe hem de kolay erişim için masaüstünüzde `C:\Users\omere\Desktop\kpss-supabase-sql\` klasöründe hazır bulunmaktadır.

---

## 📊 Veritabanına Aktarılacak Toplam İçerik Özeti

| İçerik Türü | Hedef Tablo | Soru / Kart Sayısı | Açıklama & Pedagojik Standart |
|:---|:---|:---:|:---|
| **Hap Bilgi Kartları** | `public.flashcards` | **200 Kart** | Tarih (50), Coğrafya (50), Vatandaşlık (50), Güncel Bilgiler (50) — Akrostiş şifreler (*KAYIP SAKAL*, *TAKKEM*, *0-3-4 B-M-V* vb.) |
| **60 Saniyede Pençe** | `public.questions` (`true_false`) | **100 Önerme** | 4 dersten 25'er adet hızlı şimşek refleks sorusu + `⚠️ ÖSYM Çeldirici Tuzağı` deşifreleri |
| **Kavram Eşleştirme** | `public.questions` (`matching`) | **20 Set (80 Çift)** | Padişah-Islahat, Antlaşma-Önem, Maden-Şehir, Ova-Oluşum, Kurum-Üye Sayısı eşleştirmeleri |
| **Harita Atölyesi** | `public.map_challenges` | **50 Uzman Soru** | Tarım, Maden, Sanayi, Doğu/Güney/Batı Cepheleri, Kongre rotası interaktif il dokunma pratikleri |
| **Tarih Soru Havuzu** | `public.questions` (`multiple_choice`) | **620 Soru** | 7 Konu × Değişen testler (62 test), `order_index: 1..N` ile sabitlenmiş, UWorld çeldirici analizli |
| **Vatandaşlık Soru Havuzu** | `public.questions` (`multiple_choice`) | **300 Soru** | 6 Konu × 50 Soru (30 test), `order_index: 1..50` ile sabitlenmiş |
| **Güncel Bilgiler Havuzu** | `public.questions` (`multiple_choice`) | **240 Soru** | 6 Konu × 40 Soru (24 test), 2024-2026 güncel verileri, TÜRKSOY, UNESCO, Nobel, Uzay |
| **GENEL TOPLAM** | — | **1.530+ Soru & Kart** | **%100 Özgün, Pedagojik Açıklamalı ve Eksiksiz Havuz** |

---

## 🚀 Supabase Dashboard Yükleme Sırası (Adım Adım)

Supabase projenizde (`https://supabase.com/dashboard/project/<project-id>/sql`):

### 1. Adım: İnteraktif Öğrenme & Oyunlar Migrasyonu
- **Dosya:** `docs/supabase_migrations/01_interactive_learning_seed.sql`
- **İçerik:** `flashcards` tablosu, `map_challenges` tablosu, güvenlik (RLS) politikaları ve 370 adet oyun/kart verisi.
- **İşlem:** SQL Editör'e yapıştırıp **RUN** butonuna basın.

### 2. Adım: Tarih Soru Havuzu (620 Soru)
- **Dosya:** `docs/soru_havuzu/tarih/00_tum_tarih_sorulari_tek_dosya.sql`
- **İçerik:** 7 konudaki tüm 620 soru, 5 şık, detaylı açıklama ve `order_index`.
- **İşlem:** SQL Editör'e yapıştırıp **RUN** butonuna basın.

### 3. Adım: Vatandaşlık Soru Havuzu (300 Soru)
- **Dosya:** `docs/soru_havuzu/vatandaslik/00_tum_vatandaslik_sorulari_tek_dosya.sql`
- **İçerik:** 6 konudaki tüm 300 soru, anayasa süreleri, mahkeme üye sayıları ve `order_index`.
- **İşlem:** SQL Editör'e yapıştırıp **RUN** butonuna basın.

### 4. Adım: Güncel Bilgiler Soru Havuzu (240 Soru)
- **Dosya:** `docs/soru_havuzu/guncel/00_tum_guncel_bilgiler_sorulari_tek_dosya.sql`
- **İçerik:** 6 konudaki tüm 240 soru, UNESCO, TÜRKSOY, teknoloji/spor başarıları ve `order_index`.
- **İşlem:** SQL Editör'e yapıştırıp **RUN** butonuna basın.

### 5. Adım: Çoklu KPSS & MEB-AGS Mimari Migrasyonu (`TASK-128`)
- **Dosya:** `docs/supabase_migrations/05_multi_exam_architecture.sql`
- **İçerik:** `questions` için `exam_scopes` (GIN indeksi + partial/composite indeksler), `user_topic_mastery` kapsam bazlı `unique(user_id, exam_scope, lesson, topic)` düzeltmesi, `profiles.exam_selection` JSONB CHECK kısıtı, `is_pro` / XP trigger zırhı, `app_config.exam_date_overrides` ve `get_weekly_leaderboard(p_exam_family)` RPC güncellemesi.
- **Not:** Mevcut `03_remote_config_and_maintenance.sql` (`app_config`) ve `04_data_retention_and_auto_purge.sql` sonrasında çalıştırılmalıdır; tamamen idempotenttir ve canlı veriyi korur.
- **İşlem:** SQL Editör'e yapıştırıp **RUN** butonuna basın.

---

## 🛡️ Çevrimdışı ve Offline-First Güvencesi
Uygulama, **Offline-First** mimarisi sayesinde internet bağlantısı olmadığında veya Supabase'e erişilemediğinde otomatik olarak yerel `sample_questions.json`, `sample_flashcards.dart`, `true_false_item.dart`, `concept_match_set.dart` ve `map_practice_data.dart` kaynaklarını kullanır. Kullanıcı hiçbir zaman beyaz ekran veya bağlantı hatasıyla karşılaşmaz.
