-- =============================================================================
-- 09_b_group_shared_question_pool.sql — TASK-167: B Grubu ortak soru havuzu
-- =============================================================================
-- Ürün kararı (2026-11-22): KPSS Lisans, Ön Lisans ve Ortaöğretim aynı GY-GK
-- derslerini ve soru dağılımını paylaşır; ayrı havuz üretilmez. Düzeyler arası
-- fark zorluk kademesiyle (kolay/orta/zor testler) ve alt düzey denemelerindeki
-- zor soru tavanıyla yönetilir.
--
-- Bu migration mevcut soruları tüm B Grubu düzeylerine açar:
--   • GK dersleri (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler):
--     exam_scopes += 'b_grubu_gk'
--   • GY Türkçe: exam_scopes += 'b_grubu_gygk' ve education_level = NULL
--     (education_level dolu kalırsa istemci süzgeci diğer düzeylerde eler).
-- Mevcut 'lisans_gk' / 'lisans_gygk' etiketleri korunur. Mobil ve web kabul
-- kümeleri b_grubu_gk ve b_grubu_gygk'yı tüm B Grubu düzeylerinde zaten içerir
-- (docs/parity_fixtures/exam_scopes.json).
--
-- E-KPSS, DHBT, MEB-AGS ve A Grubu kapsamlarına DOKUNULMAZ.
-- Idempotent: tekrar çalıştırmak etiketi ikinci kez eklemez.
-- Supabase SQL Editor'da tek seferde çalıştırın.
-- =============================================================================

begin;

update public.questions
   set exam_scopes = array_append(exam_scopes, 'b_grubu_gk')
 where lesson in ('Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler')
   and 'lisans_gk' = any(exam_scopes)
   and not ('b_grubu_gk' = any(exam_scopes));

update public.questions
   set exam_scopes = array_append(exam_scopes, 'b_grubu_gygk')
 where lesson = 'Türkçe'
   and 'lisans_gygk' = any(exam_scopes)
   and not ('b_grubu_gygk' = any(exam_scopes));

update public.questions
   set education_level = null
 where lesson = 'Türkçe'
   and education_level = 'lisans';

commit;

-- Doğrulama (beklenen: her derste "etiketsiz" = 0, Türkçe'de education_level dolu = 0):
-- select lesson,
--        count(*) filter (where not ('b_grubu_gk' = any(exam_scopes) or 'b_grubu_gygk' = any(exam_scopes))) as etiketsiz,
--        count(*) filter (where education_level is not null) as duzey_dolu,
--        count(*) as toplam
--   from public.questions group by lesson order by lesson;
