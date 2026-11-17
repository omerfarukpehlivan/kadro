-- =============================================================================
-- 🎯 KADRO KPSS EKOSİSTEMİ — ÇOKLU SINAV MİMARİSİ, İNDEKSLEME & RLS/RPC ZIRHI
-- Dosya: docs/supabase_migrations/05_multi_exam_architecture.sql (TASK-128)
-- Amaç: KPSS B Grubu (GY-GK), KPSS A Grubu, DHBT, MEB-AGS/ÖABT ve E-KPSS
--       çoklu sınav yapısını PostgreSQL katmanında geri uyumlu, indeksli,
--       çakışmasız ve RLS korumalı hâle getirmek.
-- Not: Tamamen idempotenttir (tekrar çalıştırılabilir) ve mevcut verileri korur.
-- =============================================================================

BEGIN;

-- -----------------------------------------------------------------------------
-- 1. public.questions: Çoklu Sınav Kapsam Sütunları & Veri Bütünlüğü Kısıtları
-- -----------------------------------------------------------------------------
alter table public.questions
  add column if not exists distractor_trap text,
  add column if not exists image_url text,
  add column if not exists order_index integer,
  add column if not exists is_active boolean not null default true,
  add column if not exists exam_scopes text[] not null default array['lisans_gk']::text[],
  add column if not exists sub_branch text null,
  add column if not exists education_level text null,
  add column if not exists disability_variant text null,
  add column if not exists source_variant text null;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_questions_exam_scopes_nonempty'
      and conrelid = 'public.questions'::regclass
  ) then
    alter table public.questions
      add constraint chk_questions_exam_scopes_nonempty
      check (cardinality(exam_scopes) >= 1);
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_questions_education_level'
      and conrelid = 'public.questions'::regclass
  ) then
    alter table public.questions
      add constraint chk_questions_education_level
      check (
        education_level is null
        or education_level in ('lisans', 'onlisans', 'ortaogretim')
      );
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_questions_disability_variant'
      and conrelid = 'public.questions'::regclass
  ) then
    alter table public.questions
      add constraint chk_questions_disability_variant
      check (
        disability_variant is null
        or disability_variant in ('genel', 'gorme', 'isitme1', 'zihinsel')
      );
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_questions_source_variant'
      and conrelid = 'public.questions'::regclass
  ) then
    alter table public.questions
      add constraint chk_questions_source_variant
      check (
        source_variant is null
        or source_variant in ('standard', 'simplified')
      );
  end if;
end $$;

-- -----------------------------------------------------------------------------
-- 2. public.questions: GIN, Composite ve Partial Performans İndeksleri
-- -----------------------------------------------------------------------------
create index if not exists idx_questions_exam_scopes_gin
  on public.questions using gin (exam_scopes);

create index if not exists idx_questions_scope_lesson_topic
  on public.questions (lesson, topic, order_index);

create index if not exists idx_questions_sub_branch
  on public.questions (sub_branch)
  where sub_branch is not null;

create index if not exists idx_questions_active_lesson_type
  on public.questions (lesson, question_type)
  where is_active = true;

-- -----------------------------------------------------------------------------
-- 3. public.user_topic_mastery: Sınav Kapsamı Bazlı Tekil Anahtar Düzeltmesi
--    (Örn. B Grubu 'Tarih' ile E-KPSS / MEB-AGS 'Tarih' kayıtlarının çakışmaması)
-- -----------------------------------------------------------------------------
alter table public.user_topic_mastery
  add column if not exists exam_scope text not null default 'lisans_gk';

do $$
declare
  v_legacy_conname text;
begin
  -- Eski (user_id, lesson, topic) UNIQUE kısıtını adına bakmaksızın güvenle kaldır
  select c.conname
  into v_legacy_conname
  from pg_constraint c
  where c.conrelid = 'public.user_topic_mastery'::regclass
    and c.contype = 'u'
    and (
      select array_agg(a.attname::text order by a.attname::text)
      from unnest(c.conkey) as k(attnum)
      join pg_attribute a
        on a.attrelid = c.conrelid
       and a.attnum = k.attnum
    ) = array['lesson', 'topic', 'user_id']::text[]
  limit 1;

  if v_legacy_conname is not null then
    execute format(
      'alter table public.user_topic_mastery drop constraint if exists %I',
      v_legacy_conname
    );
  end if;

  if not exists (
    select 1
    from pg_constraint c
    where c.conrelid = 'public.user_topic_mastery'::regclass
      and c.contype = 'u'
      and (
        select array_agg(a.attname::text order by a.attname::text)
        from unnest(c.conkey) as k(attnum)
        join pg_attribute a
          on a.attrelid = c.conrelid
         and a.attnum = k.attnum
      ) = array['exam_scope', 'lesson', 'topic', 'user_id']::text[]
  ) then
    alter table public.user_topic_mastery
      add constraint user_topic_mastery_user_scope_lesson_topic_key
      unique (user_id, exam_scope, lesson, topic);
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_topic_mastery_exam_scope_nonempty'
      and conrelid = 'public.user_topic_mastery'::regclass
  ) then
    alter table public.user_topic_mastery
      add constraint chk_topic_mastery_exam_scope_nonempty
      check (char_length(trim(exam_scope)) > 0);
  end if;
end $$;

create index if not exists idx_topic_mastery_user_scope_lesson
  on public.user_topic_mastery (user_id, exam_scope, lesson);

-- -----------------------------------------------------------------------------
-- 4. Oturum, Log & Çalışma Görevleri: exam_scope İzolasyonu ve İndeksler
-- -----------------------------------------------------------------------------
alter table public.quiz_sessions
  add column if not exists exam_scope text not null default 'lisans_gk';

alter table public.question_attempt_logs
  add column if not exists exam_scope text not null default 'lisans_gk';

alter table public.study_tasks
  add column if not exists exam_scope text not null default 'lisans_gk';

create index if not exists idx_quiz_sessions_user_scope_date
  on public.quiz_sessions (user_id, exam_scope, completed_at desc);

create index if not exists idx_attempt_logs_user_scope_mistakes
  on public.question_attempt_logs (user_id, exam_scope, is_correct, is_resolved_in_mistakes);

create index if not exists idx_study_tasks_user_scope_date
  on public.study_tasks (user_id, exam_scope, scheduled_date);

-- -----------------------------------------------------------------------------
-- 5. public.profiles: Çoklu Sınav Tercihi, JSONB Boyut Kısıtı & Trigger Zırhı
-- -----------------------------------------------------------------------------
alter table public.profiles
  add column if not exists exam_selection jsonb not null default '{}'::jsonb,
  add column if not exists sub_exam_branch text null;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_profiles_exam_selection_object'
      and conrelid = 'public.profiles'::regclass
  ) then
    alter table public.profiles
      add constraint chk_profiles_exam_selection_object
      check (
        jsonb_typeof(exam_selection) = 'object'
        and octet_length(exam_selection::text) <= 4096
      );
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'chk_profiles_sub_exam_branch_len'
      and conrelid = 'public.profiles'::regclass
  ) then
    alter table public.profiles
      add constraint chk_profiles_sub_exam_branch_len
      check (
        sub_exam_branch is null
        or char_length(sub_exam_branch) <= 120
      );
  end if;
end $$;

-- Güvenlik Trigger Doğrulaması:
-- Anon/authenticated istemciler exam_selection & sub_exam_branch güncelleyebilir;
-- ancak is_pro ve yetkisiz XP sıçraması korumaları arama yolu kilitli şekilde zorunlu kalır.
create or replace function public.prevent_direct_is_pro_escalation()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if (current_user not in ('service_role', 'postgres'))
     and (new.is_pro is distinct from old.is_pro) then
    raise exception 'is_pro alanı doğrudan istemci tarafından güncellenemez. Webhook veya In-App Purchase doğrulaması gereklidir.';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_prevent_direct_is_pro on public.profiles;
create trigger trg_prevent_direct_is_pro
  before update on public.profiles
  for each row execute procedure public.prevent_direct_is_pro_escalation();

create or replace function public.prevent_xp_and_league_tampering()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if (current_user not in ('service_role', 'postgres')) then
    if (coalesce(new.total_xp, 0) - coalesce(old.total_xp, 0)) > 250 then
      raise exception 'Kadro Güvenlik Kalkanı: Geçersiz XP artışı tespit edildi. İşlem durduruldu.';
    end if;

    if coalesce(new.total_xp, 0) < coalesce(old.total_xp, 0) then
      new.total_xp := old.total_xp;
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_prevent_xp_tampering on public.profiles;
create trigger trg_prevent_xp_tampering
  before update on public.profiles
  for each row execute procedure public.prevent_xp_and_league_tampering();

-- -----------------------------------------------------------------------------
-- 6. public.app_config: Dinamik Çoklu Sınav Takvimi (exam_date_overrides)
-- -----------------------------------------------------------------------------
alter table if exists public.app_config
  add column if not exists exam_date_overrides jsonb not null default '{}'::jsonb;

do $$
begin
  if to_regclass('public.app_config') is not null
     and not exists (
       select 1 from pg_constraint
       where conname = 'chk_app_config_exam_date_overrides_object'
         and conrelid = 'public.app_config'::regclass
     ) then
    alter table public.app_config
      add constraint chk_app_config_exam_date_overrides_object
      check (
        jsonb_typeof(exam_date_overrides) = 'object'
        and octet_length(exam_date_overrides::text) <= 16384
      );
  end if;
end $$;

-- -----------------------------------------------------------------------------
-- 7. public.get_weekly_leaderboard(p_exam_family text default null) RPC
--    Tek imzalı varsayılan parametre: hem get_weekly_leaderboard() hem de
--    get_weekly_leaderboard('dhbt') / get_weekly_leaderboard('b_grubu') çalışır.
-- -----------------------------------------------------------------------------
drop function if exists public.get_weekly_leaderboard();

create or replace function public.get_weekly_leaderboard(
  p_exam_family text default null
)
returns table (
  display_name text,
  total_xp integer,
  league_tier text
)
language sql
security definer
set search_path = ''
as $$
  select
    p.display_name,
    coalesce(p.total_xp, 0) as total_xp,
    coalesce(p.league_tier, 'Bronz Kadro') as league_tier
  from public.profiles as p
  where
    p_exam_family is null
    or trim(p_exam_family) = ''
    or (p.exam_selection ->> 'family') = p_exam_family
    or (
      coalesce(p.exam_selection ->> 'family', '') = ''
      and (
        p.target_exam = p_exam_family
        or (
          p_exam_family = 'b_grubu'
          and coalesce(p.target_exam, 'lisans') in (
            'lisans',
            'lisans2028',
            'onlisans',
            'ortaogretim'
          )
        )
      )
    )
  order by coalesce(p.total_xp, 0) desc, p.created_at asc
  limit 10;
$$;

revoke all on function public.get_weekly_leaderboard(text) from public, anon;
grant execute on function public.get_weekly_leaderboard(text) to authenticated;

-- -----------------------------------------------------------------------------
-- 8. public.questions RLS Sertleştirmesi (Salt-Okunur & Sadece Aktif Sorular)
-- -----------------------------------------------------------------------------
alter table public.questions enable row level security;

drop policy if exists "Questions read only" on public.questions;
drop policy if exists "Herkes aktif soruları okuyabilir" on public.questions;

create policy "Herkes aktif soruları okuyabilir" on public.questions
  for select
  using (is_active = true);

COMMIT;
