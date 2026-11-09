-- =============================================================================
-- 🎯 KADRO KPSS GENEL KÜLTÜR — VERİTABANI DİSK TEMİZLİK & RETENTION SİSTEMİ
-- Dosya: 04_data_retention_and_auto_purge.sql
-- Amaç: question_attempt_logs tablosunun şişmesini önlemek, 30 günden eski
--       çözülmüş logları otomatik temizleyerek Supabase disk kotasını korumak.
-- =============================================================================

BEGIN;

-- 1. Süresi dolmuş mikro-analitik kayıtlarını temizleyen fonksiyon
create or replace function public.purge_expired_attempt_logs(p_retention_days int default 30)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_deleted_count int;
begin
  -- 30 günden eski ve doğru çözülmüş ya da Yanlış Defteri'nde telafi edilmiş kayıtları sil
  -- (Hala yanlış olan ve çözülmemiş sorular adayın yanlış defterinde kalmaya devam eder)
  delete from public.question_attempt_logs
  where attempted_at < (now() - (p_retention_days || ' days')::interval)
    and (is_correct = true or is_resolved_in_mistakes = true);

  get diagnostics v_deleted_count = row_count;
  return v_deleted_count;
end;
$$;

-- 2. Her yeni sınav oturumu kaydedildiğinde hafif arka plan temizliği tetikleyen trigger
create or replace function public.trg_auto_purge_on_session()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  -- Olasılıksal hafif temizlik: Veritabanına yük bindirmemek için
  -- her 20 oturumda ortalama 1 kez (%5 ihtimalle) eski logları temizler.
  if (random() < 0.05) then
    perform public.purge_expired_attempt_logs(30);
  end if;
  return new;
end;
$$;

drop trigger if exists trg_cleanup_attempts on public.quiz_sessions;
create trigger trg_cleanup_attempts
  after insert on public.quiz_sessions
  for each row execute procedure public.trg_auto_purge_on_session();

COMMIT;
