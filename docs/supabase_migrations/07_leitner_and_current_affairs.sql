-- =============================================================================
-- 🧠 KADRO — LEİTNER ARALIKLI TEKRAR SİSTEMİ (`TASK-158`)
-- Dosya: docs/supabase_migrations/07_leitner_and_current_affairs.sql
-- Amaç:
--   1. Yanlış Defteri kayıtlarına (`public.question_attempt_logs`) 1·3·7·14 günlük
--      Leitner kutu takibi (`review_box`, `next_review_at`, `box4_streak`)
--      eklemek ve "Bugün Tekrar Etmen Gerekenler" sorgusu için kısmi indeks kurmak.
--   2. Hap Bilgi Kartlarının (`Flashcard`) kapsam bazlı aralıklı tekrar durumunu
--      `public.user_flashcard_reviews` tablosunda RLS korumasıyla saklamak.
-- =============================================================================

BEGIN;

-- 1. public.question_attempt_logs: Leitner Kutu & Vade Sütunları
alter table if exists public.question_attempt_logs
  add column if not exists review_box int not null default 1,
  add column if not exists next_review_at timestamptz not null default timezone('utc'::text, now()),
  add column if not exists box4_streak int not null default 0;

alter table if exists public.question_attempt_logs
  drop constraint if exists chk_attempt_logs_review_box;
alter table if exists public.question_attempt_logs
  add constraint chk_attempt_logs_review_box
  check (review_box between 1 and 4);

alter table if exists public.question_attempt_logs
  drop constraint if exists chk_attempt_logs_box4_streak;
alter table if exists public.question_attempt_logs
  add constraint chk_attempt_logs_box4_streak
  check (box4_streak between 0 and 10);

-- Bugün tekrar edilmesi gereken çözülmemiş yanlış soruları hızlı çekmek için kısmi indeks
create index if not exists idx_attempt_logs_leitner_due
  on public.question_attempt_logs (user_id, exam_scope, next_review_at, review_box)
  where is_correct = false and is_resolved_in_mistakes = false;

-- 2. public.user_flashcard_reviews: Bilgi Kartı Leitner Tekrar Durumu
create table if not exists public.user_flashcard_reviews (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  exam_scope text not null default 'lisans_gk'
    constraint chk_flashcard_reviews_scope_nonempty check (char_length(trim(exam_scope)) > 0),
  card_id text not null
    constraint chk_flashcard_reviews_card_nonempty check (char_length(trim(card_id)) > 0),
  review_box int not null default 1
    constraint chk_flashcard_reviews_box check (review_box between 1 and 4),
  next_review_at timestamptz not null default timezone('utc'::text, now()),
  last_reviewed_at timestamptz null,
  box4_streak int not null default 0
    constraint chk_flashcard_reviews_streak check (box4_streak between 0 and 10),
  is_graduated boolean not null default false,
  updated_at timestamptz not null default timezone('utc'::text, now()),
  constraint uq_user_flashcard_reviews_user_scope_card unique (user_id, exam_scope, card_id)
);

create index if not exists idx_user_flashcard_reviews_due
  on public.user_flashcard_reviews (user_id, exam_scope, next_review_at)
  where is_graduated = false;

alter table public.user_flashcard_reviews enable row level security;

drop policy if exists "Kullanıcılar kendi bilgi kartı tekrarlarını yönetebilir" on public.user_flashcard_reviews;
create policy "Kullanıcılar kendi bilgi kartı tekrarlarını yönetebilir"
  on public.user_flashcard_reviews
  for all
  to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()));

-- 3. public.current_affairs_bulletins: Aylık Güncel Bilgiler Bülteni (`TASK-160`)
create table if not exists public.current_affairs_bulletins (
  id text primary key
    constraint chk_current_affairs_id_nonempty check (char_length(trim(id)) > 0),
  year_month text not null
    constraint chk_current_affairs_year_month check (year_month ~ '^[0-9]{4}-[0-9]{2}$'),
  month_title text not null
    constraint chk_current_affairs_month_title_nonempty check (char_length(trim(month_title)) > 0),
  subtitle text null,
  title text not null
    constraint chk_current_affairs_title_nonempty check (char_length(trim(title)) > 0),
  summary text not null
    constraint chk_current_affairs_summary_nonempty check (char_length(trim(summary)) > 0),
  category text not null
    constraint chk_current_affairs_category check (
      category in ('kultur_sanat', 'bilim_teknoloji', 'spor', 'ekonomi_kurumlar', 'cevre_dunya')
    ),
  osym_tip text not null,
  published_label text not null,
  linked_tags text[] not null default array[]::text[],
  exam_scopes text[] not null default array['lisans_gk', 'b_grubu', 'ekpss', 'meb_ags']::text[],
  is_verified_official boolean not null default true,
  is_active boolean not null default true,
  order_index integer not null default 0,
  created_at timestamptz not null default timezone('utc'::text, now()),
  updated_at timestamptz not null default timezone('utc'::text, now())
);

create index if not exists idx_current_affairs_active_month
  on public.current_affairs_bulletins (year_month, order_index)
  where is_active = true;

create index if not exists idx_current_affairs_exam_scopes_gin
  on public.current_affairs_bulletins using gin (exam_scopes);

alter table public.current_affairs_bulletins enable row level security;

drop policy if exists "Aktif güncel bültenleri herkes okuyabilir" on public.current_affairs_bulletins;
create policy "Aktif güncel bültenleri herkes okuyabilir"
  on public.current_affairs_bulletins
  for select
  to anon, authenticated
  using (is_active = true);

revoke insert, update, delete on public.current_affairs_bulletins from anon, authenticated;

COMMIT;
