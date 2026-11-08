-- ==========================================================================
-- KADRO COĞRAFYA — RESİMLİ / HARİTALI SORU ALTYAPISI & ÖRNEK SORULAR
-- 1. image_url sütunu ekleme (mevcut soruları bozmaz, NULL kabul eder)
-- 2. Haritalı / Görselli Örnek Soru Girişi
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı + Zoom Destekli Görsel
-- ==========================================================================

-- 1. Sütun ekleme (varsa hata vermez)
ALTER TABLE public.questions ADD COLUMN IF NOT EXISTS image_url TEXT;

BEGIN;

-- Haritalı Soru #01 (Türkiye'nin Yer Şekilleri — Karstik Platolar)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  image_url
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Yukarıdaki dilsiz Türkiye haritasında numaralandırılarak gösterilen alanlardan hangisi, kalkerli (kireçtaşı) kimyasal tortul kayaç yapısı nedeniyle lapya, dolin, uvala ve polye gibi karstik aşınım şekillerinin en yaygın görüldüğü Teke ve Taşeli platoları kuşağındadır?',
  '{"options": ["I (Ergene)", "II (Yıldız Dağları)", "III (Teke Platosu)", "IV (Çukurova)", "V (Erzurum-Kars)"], "correctIndex": 2}'::jsonb,
  'Teke ve Taşeli Platoları (III numara) Akdeniz kuşağında kolay eriyebilen kalkerli arazisiyle Türkiye''nin en belirgin karstik sahasıdır. Mağaralar, obruklar ve polyeler burada yoğunlaşmıştır.',
  'ÖSYM adayların Karadeniz kıyılarını bol yağıştan dolayı karstik aşınım sahası sanmasını en büyük çeldirici olarak kullanır. Karstik şekillerin temel şartı yağış değil, eriyebilen kalkerli ana kayaçtır.',
  'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=800&q=80'
);

-- Haritalı Soru #02 (Madenler ve Enerji Kaynakları — Boksit / Seydişehir)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  image_url
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Yukarıdaki Türkiye haritasında konumu kırmızı işaretle gösterilen, hafif ve dayanıklı yapısıyla uçak ve otomotiv sanayisinde kullanılan boksit (alüminyum) madeninin çıkarıldığı ve ülkemizin tek entegre alüminyum tesisine ev sahipliği yapan merkez aşağıdakilerden hangisidir?',
  '{"options": ["Konya — Seydişehir", "Artvin — Murgul", "Sivas — Divriği", "Elazığ — Guleman", "Kütahya — Emet"], "correctIndex": 0}'::jsonb,
  'Boksit madeninin ülkemizdeki en önemli çıkarım ve işleme tesisi Konya Seydişehir Alüminyum Tesisleri''dir. Murgul bakır, Divriği demir, Guleman krom, Emet ise bor sahasıdır.',
  'Adaylar alüminyum ve bor madenlerini karıştırıp Kütahya Emet ya da Balıkesir Bandırma''yı işaretleyebilmektedir. Boksit doğrudan Seydişehir ile özdeşleşmiştir.',
  'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?auto=format&fit=crop&w=800&q=80'
);

-- Haritalı Soru #03 (Türkiye'de Nüfus ve Yerleşme — Tenha Alanlar)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  image_url
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Yukarıdaki haritada işaretlenen kıyı alanlarından hangisi, Marmara Bölgesi sınırları içinde yer almasına karşın ana transit ulaşım akslarına sapa kalması ve engebeli yer şekilleri nedeniyle seyrek nüfuslanmış alanlar arasında yer alır?',
  '{"options": ["Çatalca-Kocaeli Yöresi", "Yıldız Dağları Yöresi (Istranca)", "Güney Marmara Kıyıları", "Ergene Havzası", "Körfez Sanayi Hattı"], "correctIndex": 1}'::jsonb,
  'Yıldız Dağları (Istranca) Bölümü, İstanbul''a yakın olmasına rağmen Bulgaristan sınırında ana ticaret yollarına sapa kaldığı ve engebeli ormanlık araziye sahip olduğu için Türkiye''nin en tenha ve sanayileşmemiş kıyı kuşağıdır.',
  'ÖSYM Marmara Bölgesi''nin tamamının aşırı kalabalık ve sanayileşmiş olduğu algısını adaylara tuzak olarak kurar. Yıldız Dağları ve Biga Yarımadası Marmara''nın en tenha istisnalarıdır.',
  'https://images.unsplash.com/photo-1508873696983-2df5703bc225?auto=format&fit=crop&w=800&q=80'
);

COMMIT;
