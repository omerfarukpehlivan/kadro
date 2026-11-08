-- ==========================================================================
-- TEST 1 - SORU 1 İÇİN ANINDA HARİTA GÖRSELİ TANIMLAMA
-- Bu SQL, Coğrafya dersinin ilk testlerinin 1. sorularına yerel harita görsellerini bağlar.
-- ==========================================================================

-- 1. Türkiye'nin Coğrafi Konumu -> Test 1, Soru 1 (Koordinat Haritası)
UPDATE public.questions
SET image_url = 'assets/images/mascot/cografya_koordinat_haritasi.png'
WHERE lesson = 'Coğrafya' 
  AND topic = 'Türkiye''nin Coğrafi Konumu' 
  AND prompt_text LIKE 'Türkiye, 36°-42° Kuzey%';

-- 2. Türkiye'nin Yer Şekilleri ve İklimi -> Test 1, Soru 1 (Fiziki / Jeomorfoloji Haritası)
UPDATE public.questions
SET image_url = 'assets/images/mascot/cografya_karstik_harita.png'
WHERE lesson = 'Coğrafya' 
  AND topic = 'Türkiye''nin Yer Şekilleri ve İklimi' 
  AND prompt_text LIKE '%III. ve IV. jeolojik zamanlarda%';
