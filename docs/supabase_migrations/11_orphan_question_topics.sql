-- =============================================================================
-- 11_orphan_question_topics.sql — Müfredat dışı konu adına sahip 4 çoktan
-- seçmeli soruyu kanonik konularına taşır (konu testlerinde görünür olsunlar).
-- =============================================================================
-- Not: Aynı derslerde müfredat dışı konu adı taşıyan diğer 88 kayıt
-- (true_false: 72, matching: 16) konu testi sorusu değil, Doğru-Yanlış ve
-- Kavram Eşleştirme oyun içeriğidir; bunlara dokunulmaz.
-- Idempotent. Supabase SQL Editor'da çalıştırın.
-- =============================================================================

begin;

update public.questions set topic = 'İlk Türk-İslam Devletleri'
 where id = '60b72923-1f30-4478-b243-633559a05099' and topic = 'İlk Türk İslam Devletleri';

update public.questions set topic = 'Kurtuluş Savaşı Hazırlık ve Cepheler'
 where id = '05034b13-88f5-43c7-b596-5cbad9bc6844' and topic = 'Kurtuluş Savaşı Hazırlık Dönemi';

update public.questions set topic = 'Yasama, Yürütme ve Yargı'
 where id in ('86f82a40-2a42-40ae-a139-f2206404bdcc', 'df4ab6f2-81ec-4e4d-a2df-ed9131fe600e')
   and topic in ('Yasama', 'Yürütme');

commit;

-- Doğrulama (beklenen: 0 satır):
-- select id, lesson, topic from public.questions
--  where question_type = 'multiple_choice'
--    and id in ('60b72923-1f30-4478-b243-633559a05099','05034b13-88f5-43c7-b596-5cbad9bc6844',
--               '86f82a40-2a42-40ae-a139-f2206404bdcc','df4ab6f2-81ec-4e4d-a2df-ed9131fe600e')
--    and topic in ('İlk Türk İslam Devletleri','Kurtuluş Savaşı Hazırlık Dönemi','Yasama','Yürütme');
