-- =============================================================================
-- 🎯 KADRO KPSS GENEL KÜLTÜR — GÜVENLİK, RATE-LIMIT VE RLS ZIRHI
-- Dosya: 02_security_ratelimit_hardening.sql
-- Amaç: Kötü niyetli kullanıcıların/botların sunucuya spam istek atarak sistemi
--       yavaşlatmasını, veritabanını şişirmesini veya maliyet artırmasını engellemek.
-- =============================================================================

BEGIN;

-- -----------------------------------------------------------------------------
-- 1. VERİTABANI SEVİYESİNDE RATE-LIMIT MOTORU (PostgreSQL Sliding Window)
-- -----------------------------------------------------------------------------

-- Rate-limit kovası (bucket) takip tablosu
create table if not exists public.rate_limits (
  id uuid primary key default gen_random_uuid(),
  bucket_key text not null,       -- Kullanıcı ID veya anonim istemci belirteci
  action text not null,           -- 'submit_report', 'save_quiz_session', vb.
  request_count int not null default 1,
  window_start timestamptz not null default now()
);

-- Hızlı sorgulama için indeksler
create index if not exists idx_rate_limits_lookup
  on public.rate_limits (bucket_key, action, window_start desc);

-- Güvenlik: rate_limits tablosu sadece sunucu içi fonksiyonlar tarafından yönetilir
alter table public.rate_limits enable row level security;
drop policy if exists "No direct public access to rate_limits" on public.rate_limits;
create policy "No direct public access to rate_limits" on public.rate_limits
  for all using (false);

-- Rate-limit kontrol fonksiyonu (PL/pgSQL Security Definer)
create or replace function public.check_rate_limit(
  p_bucket_key text,
  p_action text,
  p_max_requests int,
  p_window_seconds int
)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare
  v_current_count int;
  v_window_start timestamptz;
  v_cutoff timestamptz;
begin
  v_cutoff := now() - (p_window_seconds || ' seconds')::interval;

  -- 1. Süresi dolmuş eski kayıtları temizle (tablonun şişmesini önler)
  delete from public.rate_limits
  where window_start < (now() - interval '1 hour');

  -- 2. Aktif penceredeki mevcut istek sayısını al
  select request_count, window_start
  into v_current_count, v_window_start
  from public.rate_limits
  where bucket_key = p_bucket_key
    and action = p_action
    and window_start >= v_cutoff
  order by window_start desc
  limit 1;

  -- 3. Eğer bu pencerede ilk istek ise yeni kova aç
  if not found then
    insert into public.rate_limits (bucket_key, action, request_count, window_start)
    values (p_bucket_key, p_action, 1, now());
    return true;
  end if;

  -- 4. Limit aşıldıysa REDDET
  if v_current_count >= p_max_requests then
    return false;
  end if;

  -- 5. Limit aşılmadıysa sayacı 1 artır ve ONAYLA
  update public.rate_limits
  set request_count = request_count + 1
  where bucket_key = p_bucket_key
    and action = p_action
    and window_start = v_window_start;

  return true;
end;
$$;


-- -----------------------------------------------------------------------------
-- 2. HATALI SORU RAPORLAMA SPAM KORUMASI (Trigger)
-- Kural: 1 kullanıcı 1 dakikada en fazla 3 rapor, 1 saatte en fazla 15 rapor atabilir.
-- -----------------------------------------------------------------------------

create or replace function public.trg_rate_limit_question_reports()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_key text;
  v_allowed boolean;
begin
  -- Giriş yapmış kullanıcı ise user_id, değilse anonim etiket kullanılır
  v_key := coalesce(auth.uid()::text, coalesce(new.user_id::text, 'anonymous_guest'));

  -- 60 saniyede en fazla 3 rapor
  v_allowed := public.check_rate_limit(v_key, 'submit_report', 3, 60);

  if not v_allowed then
    raise exception 'Kadro Güvenlik Kalkanı: Çok hızlı soru bildirimi gönderiyorsunuz. Lütfen 1 dakika bekleyip tekrar deneyin.'
      using errcode = 'P0001';
  end if;

  return new;
end;
$$;

drop trigger if exists trg_check_report_rate_limit on public.question_reports;
create trigger trg_check_report_rate_limit
  before insert on public.question_reports
  for each row execute procedure public.trg_rate_limit_question_reports();


-- -----------------------------------------------------------------------------
-- 3. TEST / DENEME SINAVI OTURUMU FLOOD KORUMASI (Trigger)
-- Kural: 1 kullanıcı 60 saniyede en fazla 2 sınav oturumu kaydedebilir.
-- -----------------------------------------------------------------------------

create or replace function public.trg_rate_limit_quiz_sessions()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_key text;
  v_allowed boolean;
begin
  v_key := coalesce(auth.uid()::text, new.user_id::text);

  if v_key is not null then
    -- 60 saniyede en fazla 2 oturum tamamlama kaydı
    v_allowed := public.check_rate_limit(v_key, 'save_quiz_session', 2, 60);

    if not v_allowed then
      raise exception 'Kadro Güvenlik Kalkanı: Sınav oturumu kaydetme hız limiti aşıldı. Lütfen bekleyin.'
        using errcode = 'P0001';
    end if;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_check_quiz_session_rate_limit on public.quiz_sessions;
create trigger trg_check_quiz_session_rate_limit
  before insert on public.quiz_sessions
  for each row execute procedure public.trg_rate_limit_quiz_sessions();


-- -----------------------------------------------------------------------------
-- 4. KULLANICI PROFİLİ XP & LİDERLİK TABLOSU HİLE KORUMASI (Trigger)
-- Kural: İstemci doğrudan PATCH/UPDATE ile total_xp'yi tek seferde 250 XP'den
--        fazla artıramaz veya düşüremez. Sadece resmi sınav/test skorları XP kazandırır.
-- -----------------------------------------------------------------------------

create or replace function public.prevent_xp_and_league_tampering()
returns trigger
language plpgsql
security definer
as $$
begin
  -- Service role veya postgres harici doğrudan istemci güncellemelerini denetle
  if (current_user not in ('service_role', 'postgres')) then
    -- Tek bir istekte 250'den fazla XP sıçraması engellenir (Deneme sınavı dahi max 60-100 XP verir)
    if (new.total_xp - old.total_xp) > 250 then
      raise exception 'Kadro Güvenlik Kalkanı: Geçersiz XP artışı tespit edildi. İşlem durduruldu.';
    end if;

    -- XP'nin sıfırlanması veya eksiye düşürülmesi engellenir
    if new.total_xp < old.total_xp then
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
-- 5. ROW LEVEL SECURITY (RLS) POLİTİKALARININ KESİNLEŞTİRİLMESİ
-- -----------------------------------------------------------------------------

-- public.questions: Sadece SELECT yapılabilir. INSERT, UPDATE, DELETE kesinlikle yasaktır!
alter table public.questions enable row level security;
drop policy if exists "Questions read only" on public.questions;
drop policy if exists "Herkes aktif soruları okuyabilir" on public.questions;
create policy "Questions read only" on public.questions
  for select using (true);

-- public.flashcards: Sadece SELECT yapılabilir.
alter table public.flashcards enable row level security;
drop policy if exists "Flashcards public read" on public.flashcards;
create policy "Flashcards public read" on public.flashcards
  for select using (true);

-- public.map_challenges: Sadece SELECT yapılabilir.
alter table public.map_challenges enable row level security;
drop policy if exists "Map challenges public read" on public.map_challenges;
create policy "Map challenges public read" on public.map_challenges
  for select using (true);

-- public.question_reports: Kullanıcılar bildirim yapabilir, fakat başkalarının raporlarını asla göremez!
alter table public.question_reports enable row level security;
drop policy if exists "Anyone can submit question report" on public.question_reports;
drop policy if exists "Users can read their own reports or admin all" on public.question_reports;

create policy "Users can submit reports" on public.question_reports
  for insert with check (true);

create policy "Users can read only own reports" on public.question_reports
  for select using (
    auth.uid() is not null and auth.uid() = user_id
  );

COMMIT;
