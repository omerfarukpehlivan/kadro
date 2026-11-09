-- =============================================================================
-- 🎯 KADRO KPSS GENEL KÜLTÜR — UZAKTAN YAPILANDIRMA & BAKIM MODU
-- Dosya: 03_remote_config_and_maintenance.sql
-- Amaç: Uygulama açılışında zorunlu sürüm güncellemesi (Force Update),
--       mağaza yönlendirmesi ve acil durumlarda dinamik bakım modu kontrolü.
-- =============================================================================

BEGIN;

create table if not exists public.app_config (
  id text primary key default 'global_config',
  min_supported_version text not null default '1.0.0',
  latest_version text not null default '1.0.0',
  is_maintenance_mode boolean not null default false,
  maintenance_message text default 'Kadro bakımda! KPSS soru havuzumuzu güncelliyoruz. Çok yakında tekrar yayındayız.',
  store_url text default 'https://play.google.com/store/apps/details?id=com.omer.kadro',
  updated_at timestamptz default now()
);

alter table public.app_config enable row level security;

-- Herkes konfigürasyonu okuyabilir
drop policy if exists "App config public read" on public.app_config;
create policy "App config public read" on public.app_config
  for select using (true);

-- Sadece service_role / postgres konfigürasyonu değiştirebilir
drop policy if exists "App config admin write" on public.app_config;
create policy "App config admin write" on public.app_config
  for all using (current_user in ('service_role', 'postgres'));

-- Varsayılan başlangıç konfigürasyonu
insert into public.app_config (
  id,
  min_supported_version,
  latest_version,
  is_maintenance_mode,
  maintenance_message,
  store_url
)
values (
  'global_config',
  '1.0.0',
  '1.0.0',
  false,
  'Kadro bakımda! KPSS soru havuzumuzu ve deneme motorumuzu güncelliyoruz. Lütfen kısa bir süre sonra tekrar deneyin.',
  'https://play.google.com/store/apps/details?id=com.omer.kadro'
)
on conflict (id) do nothing;

COMMIT;
