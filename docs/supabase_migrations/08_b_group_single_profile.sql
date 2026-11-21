-- =============================================================================
-- 08_b_group_single_profile.sql — TASK-166: B Grubu tek profil (full_gygk)
-- =============================================================================
-- B Grubu'nda "Sadece GK" profili kaldırıldı; istemciler artık her zaman
-- `<düzey>_gygk` kapsamıyla yazıyor. Bu migration eski `<düzey>_gk` kullanıcı
-- kayıtlarını yeni kapsama taşır, böylece aynı konu için iki ayrı satır
-- (`lisans_gk` + `lisans_gygk`) oluşmaz ve istatistikler bölünmez.
--
-- ⚠️ Yalnızca KULLANICI verisi taşınır. `public.questions.exam_scopes`
-- etiketlerine DOKUNULMAZ (`lisans_gk` soru etiketi kabul kümesinde kalır).
--
-- Tek seferliktir ve tekrar çalıştırılması güvenlidir (idempotent).
-- Supabase SQL Editor'da tek seferde çalıştırın.
-- =============================================================================

begin;

-- 1) user_topic_mastery: (user_id, exam_scope, lesson, topic) benzersiz.
--    Her iki kapsamda satırı olan konular toplanıp `_gygk` satırına birleştirilir.
with pairs as (
  select gk.id as gk_id,
         gy.id as gy_id,
         gk.total_solved      as gk_solved,
         gk.total_correct     as gk_correct,
         gk.total_time_seconds as gk_time,
         gk.last_studied_at   as gk_last
  from public.user_topic_mastery gk
  join public.user_topic_mastery gy
    on gy.user_id = gk.user_id
   and gy.lesson  = gk.lesson
   and gy.topic   = gk.topic
   and gy.exam_scope = replace(gk.exam_scope, '_gk', '_gygk')
  where gk.exam_scope in ('lisans_gk', 'onlisans_gk', 'ortaogretim_gk')
),
merged as (
  update public.user_topic_mastery gy
     set total_solved       = gy.total_solved + p.gk_solved,
         total_correct      = gy.total_correct + p.gk_correct,
         total_time_seconds = gy.total_time_seconds + p.gk_time,
         last_studied_at    = greatest(gy.last_studied_at, p.gk_last),
         mastery_percent    = case
           when gy.total_solved + p.gk_solved > 0
             then round(100.0 * (gy.total_correct + p.gk_correct)
                        / (gy.total_solved + p.gk_solved))::int
           else 0
         end
    from pairs p
   where gy.id = p.gy_id
  returning p.gk_id
)
delete from public.user_topic_mastery
 where id in (select gk_id from merged);

-- Yalnızca eski kapsamda satırı olan konular doğrudan yeniden adlandırılır.
update public.user_topic_mastery
   set exam_scope = replace(exam_scope, '_gk', '_gygk')
 where exam_scope in ('lisans_gk', 'onlisans_gk', 'ortaogretim_gk');

-- 2) Benzersizlik kısıtı olmayan geçmiş tabloları: doğrudan yeniden adlandır.
update public.quiz_sessions
   set exam_scope = replace(exam_scope, '_gk', '_gygk')
 where exam_scope in ('lisans_gk', 'onlisans_gk', 'ortaogretim_gk');

update public.question_attempt_logs
   set exam_scope = replace(exam_scope, '_gk', '_gygk')
 where exam_scope in ('lisans_gk', 'onlisans_gk', 'ortaogretim_gk');

update public.study_tasks
   set exam_scope = replace(exam_scope, '_gk', '_gygk')
 where exam_scope in ('lisans_gk', 'onlisans_gk', 'ortaogretim_gk');

-- 3) Kolon varsayılanları: kapsam gönderilmeyen eski istemci yazımları da
--    yeni kanonik kapsama düşsün.
alter table public.user_topic_mastery    alter column exam_scope set default 'lisans_gygk';
alter table public.quiz_sessions         alter column exam_scope set default 'lisans_gygk';
alter table public.question_attempt_logs alter column exam_scope set default 'lisans_gygk';
alter table public.study_tasks           alter column exam_scope set default 'lisans_gygk';
-- 07 migration'ı ile gelen tablo (varsa):
alter table if exists public.user_flashcard_reviews alter column exam_scope set default 'lisans_gygk';

-- 4) Profil tercihleri: kayıtlı exam_selection JSON'undaki only_gk değerini çevir
--    (istemciler okurken zaten normalize ediyor; bu adım veriyi temizler).
update public.profiles
   set exam_selection = jsonb_set(exam_selection, '{bGroupProfile}', '"full_gygk"')
 where exam_selection is not null
   and exam_selection ->> 'bGroupProfile' = 'only_gk';

update public.profiles
   set exam_selection = jsonb_set(exam_selection, '{b_group_profile}', '"full_gygk"')
 where exam_selection is not null
   and exam_selection ->> 'b_group_profile' = 'only_gk';

commit;

-- 07 migration'ı (user_flashcard_reviews, mistake/Leitner tabloları) henüz
-- uygulanmadıysa onların kapsamı burada taşınmaz; 07 uygulandıktan sonra
-- istemciler zaten `_gygk` ile yazar, okurken `_gk` eşdeğerini de kabul eder.

-- Doğrulama (beklenen: hiç `_gk` kullanıcı satırı kalmamalı):
-- select 'mastery', exam_scope, count(*) from public.user_topic_mastery group by 2
-- union all select 'sessions', exam_scope, count(*) from public.quiz_sessions group by 2;
