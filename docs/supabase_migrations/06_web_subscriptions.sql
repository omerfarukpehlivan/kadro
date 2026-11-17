-- =============================================================================
-- 🌐 KADRO — ÇAPRAZ PLATFORM (WEB & MOBİL) ABONELİK & PRO YETKİ ŞEMASI
-- Dosya: docs/supabase_migrations/06_web_subscriptions.sql (TASK-145, TASK-152)
-- Amaç:
--   1. iyzico / Stripe / RevenueCat Webhook üzerinden gelen abonelikleri
--      tek doğruluk kaynağı olan public.subscriptions tablosunda tutmak.
--   2. İstemcinin doğrudan kendini PRO yapmasını (privilege escalation)
--      yalnızca service_role yazma yetkisi ve RLS ile engellemek.
--   3. Aktif abonelik eklendiğinde veya güncellendiğinde public.profiles.is_pro
--      alanını veritabanı tetikleyicisiyle otomatik senkronize etmek.
-- =============================================================================

BEGIN;

create table if not exists public.subscriptions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  entitlement_id text not null default 'kadro_pro',
  plan_id text not null,
  status text not null check (status in ('active', 'canceled', 'expired', 'past_due')),
  provider text not null check (provider in ('apple', 'google', 'stripe', 'iyzico')),
  provider_subscription_id text null,
  amount_try numeric(10, 2) null,
  expires_at timestamptz null,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default timezone('utc'::text, now()),
  updated_at timestamptz not null default timezone('utc'::text, now())
);

create index if not exists idx_subscriptions_user_status
  on public.subscriptions (user_id, status, expires_at desc);

create unique index if not exists idx_subscriptions_provider_ref
  on public.subscriptions (provider, provider_subscription_id)
  where provider_subscription_id is not null;

alter table public.subscriptions enable row level security;

-- Yalnızca kullanıcı kendi abonelik kayıtlarını okuyabilir; yazma yalnızca Edge Function / service_role içindir.
drop policy if exists "Kullanıcılar yalnızca kendi aboneliklerini okuyabilir" on public.subscriptions;
create policy "Kullanıcılar yalnızca kendi aboneliklerini okuyabilir"
  on public.subscriptions
  for select
  to authenticated
  using (user_id = (select auth.uid()));

revoke insert, update, delete on public.subscriptions from anon, authenticated;

-- Abonelik durumu değiştiğinde public.profiles.is_pro sütununu güvenli biçimde senkronize eden tetikleyici.
create or replace function public.sync_profile_pro_from_subscriptions()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_target_user uuid;
  v_has_active boolean;
begin
  v_target_user := coalesce(new.user_id, old.user_id);
  if v_target_user is null then
    return null;
  end if;

  select exists(
    select 1
    from public.subscriptions as s
    where s.user_id = v_target_user
      and s.status = 'active'
      and (s.expires_at is null or s.expires_at > timezone('utc'::text, now()))
  )
  into v_has_active;

  update public.profiles
  set is_pro = v_has_active
  where id = v_target_user;

  return coalesce(new, old);
end;
$$;

drop trigger if exists trg_sync_profile_pro_on_subscription on public.subscriptions;
create trigger trg_sync_profile_pro_on_subscription
  after insert or update or delete on public.subscriptions
  for each row
  execute function public.sync_profile_pro_from_subscriptions();

-- Kullanıcı hesap silme RPC'sine subscriptions temizliği eklenerek KVKK tam uyumu korunur.
create or replace function public.delete_user_account()
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid uuid := (select auth.uid());
begin
  if v_uid is null then
    raise exception 'Oturum açılmamış.';
  end if;

  delete from public.subscriptions where user_id = v_uid;
  delete from public.question_attempt_logs where user_id = v_uid;
  delete from public.quiz_sessions where user_id = v_uid;
  delete from public.user_topic_mastery where user_id = v_uid;
  delete from public.study_tasks where user_id = v_uid;
  delete from public.question_reports where user_id = v_uid;
  delete from public.profiles where id = v_uid;
  delete from auth.users where id = v_uid;
end;
$$;

revoke execute on function public.delete_user_account() from public, anon;
grant execute on function public.delete_user_account() to authenticated;

COMMIT;
