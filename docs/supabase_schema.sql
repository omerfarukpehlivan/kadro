-- ============================================================================
-- 🎯 KADRO (KPSS Lisans Genel Kültür) — TAM SUPABASE KURULUM SCRİPTİ
-- Supabase Dashboard -> SQL Editor -> "New Query" içine yapıştırıp "RUN"a bas.
-- ============================================================================

-- 1. KULLANICI PROFİLLERİ, SERİ (STREAK), XP VE LİG TABLOSU
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Memur Adayı',
  daily_goal_questions int not null default 30,
  current_streak_days int not null default 1,
  longest_streak_days int not null default 1,
  total_xp int not null default 0,
  league_tier text not null default 'Bronz Kadro',
  is_pro boolean not null default false,
  last_study_date date default current_date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- YENİ KAYIT OLAN KULLANICI İÇİN OTOMATİK PROFİL OLUŞTURMA TRIGGER'I
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = ''
as $$
begin
  insert into public.profiles (id, display_name)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'display_name', 'Memur Adayı')
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- 2. SORU VE ETKİLEŞİMLİ OYUN HAVUZU (5 Şıklı, Doğru/Yanlış, Kavram Eşleştirme)
create table if not exists public.questions (
  id uuid primary key default gen_random_uuid(),
  lesson text not null, -- 'Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler'
  topic text not null,
  question_type text not null default 'multiple_choice', -- 'multiple_choice', 'true_false', 'matching'
  difficulty int not null default 2, -- 1: Kolay, 2: Orta, 3: Zor
  prompt_text text not null,
  interaction_data jsonb not null,
  explanation text not null,
  created_at timestamptz not null default now()
);

-- 3. ÇÖZÜLEN TESTLER & OYUN OTURUMLARI ARŞİVİ (Raporlama Ana Tablosu)
create table if not exists public.quiz_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  session_title text not null,
  session_mode text not null, -- 'topic_quiz', 'full_exam_60', 'true_false_blitz', 'concept_match', 'mistake_review'
  lesson text not null default 'Genel Kültür',
  topic text,
  total_questions int not null,
  correct_count int not null,
  wrong_count int not null,
  empty_count int not null default 0,
  net_score numeric(5,2) not null,
  earned_xp int not null default 0,
  duration_seconds int not null default 0,
  completed_at timestamptz not null default now()
);

-- 4. SORU BAZLI DETAYLI CEVAP VE SÜRE KAYITLARI (Mikro-Analitik & Yanlış Defteri)
create table if not exists public.question_attempt_logs (
  id uuid primary key default gen_random_uuid(),
  session_id uuid references public.quiz_sessions(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  question_id uuid references public.questions(id) on delete set null,
  question_text text not null,
  lesson text not null,
  topic text not null,
  is_correct boolean not null,
  is_empty boolean not null default false,
  selected_answer text,
  correct_answer text,
  time_spent_seconds int not null default 0,
  is_resolved_in_mistakes boolean not null default false,
  attempted_at timestamptz not null default now()
);

-- 5. KONU USTALIK ISI HARİTASI (Mastery Heatmap & Aralıklı Tekrar)
create table if not exists public.user_topic_mastery (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  lesson text not null,
  topic text not null,
  total_solved int not null default 0,
  total_correct int not null default 0,
  total_time_seconds int not null default 0,
  mastery_percent int not null default 0,
  last_studied_at timestamptz not null default now(),
  unique(user_id, lesson, topic)
);

-- 6. GÜNLÜK ÇALIŞMA PLANLAYICI GÖREVLERİ
create table if not exists public.study_tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  title text not null,
  lesson_tag text not null,
  estimated_minutes int not null default 25,
  action_type text not null default 'custom',
  is_completed boolean not null default false,
  scheduled_date date not null default current_date,
  created_at timestamptz not null default now()
);

-- 7. PERFORMANS İNDEKSLERİ
create index if not exists idx_questions_lesson_type on public.questions(lesson, question_type);
create index if not exists idx_quiz_sessions_user_date on public.quiz_sessions(user_id, completed_at desc);
create index if not exists idx_attempt_logs_user_mistakes on public.question_attempt_logs(user_id, is_correct, is_resolved_in_mistakes);
create index if not exists idx_topic_mastery_user on public.user_topic_mastery(user_id, lesson);
create index if not exists idx_study_tasks_user_date on public.study_tasks(user_id, scheduled_date);

-- 8. ROW LEVEL SECURITY (RLS) GÜVENLİK POLİTİKALARI
alter table public.profiles enable row level security;
alter table public.questions enable row level security;
alter table public.quiz_sessions enable row level security;
alter table public.question_attempt_logs enable row level security;
alter table public.user_topic_mastery enable row level security;
alter table public.study_tasks enable row level security;

drop policy if exists "Herkes aktif soruları okuyabilir" on public.questions;
create policy "Herkes aktif soruları okuyabilir" on public.questions
  for select using (true);

drop policy if exists "Kullanıcı kendi profilini okuyup güncelleyebilir" on public.profiles;
create policy "Kullanıcı kendi profilini okuyup güncelleyebilir" on public.profiles
  for all using (auth.uid() = id);

-- GÜVENLİK: İstemcinin doğrudan `is_pro` alanını true yapmasını önleyen trigger
create or replace function public.prevent_direct_is_pro_escalation()
returns trigger
language plpgsql
security definer
as $$
begin
  -- Eğer istemci (anon veya authenticated rolü) is_pro'yu değiştirmeye çalışırsa reddet
  if (current_user not in ('service_role', 'postgres')) and (new.is_pro is distinct from old.is_pro) then
    raise exception 'is_pro alanı doğrudan istemci tarafından güncellenemez. Webhook veya In-App Purchase doğrulaması gereklidir.';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_prevent_direct_is_pro on public.profiles;
create trigger trg_prevent_direct_is_pro
  before update on public.profiles
  for each row execute procedure public.prevent_direct_is_pro_escalation();

drop policy if exists "Kullanıcı kendi test geçmişini yönetebilir" on public.quiz_sessions;
create policy "Kullanıcı kendi test geçmişini yönetebilir" on public.quiz_sessions
  for all using (auth.uid() = user_id);

drop policy if exists "Kullanıcı kendi soru loglarını yönetebilir" on public.question_attempt_logs;
create policy "Kullanıcı kendi soru loglarını yönetebilir" on public.question_attempt_logs
  for all using (auth.uid() = user_id);

drop policy if exists "Kullanıcı kendi konu ustalığını yönetebilir" on public.user_topic_mastery;
create policy "Kullanıcı kendi konu ustalığını yönetebilir" on public.user_topic_mastery
  for all using (auth.uid() = user_id);

drop policy if exists "Kullanıcı kendi çalışma görevlerini yönetebilir" on public.study_tasks;
create policy "Kullanıcı kendi çalışma görevlerini yönetebilir" on public.study_tasks
  for all using (auth.uid() = user_id);

-- 9. RPC GÜVENLİK VE RAPORLAMA FONKSİYONLARI
-- Top 10 haftalık aday sıralamasını RLS kısıtlamasına takılmadan sadece anonim/genel alanlarla döndürür.
create or replace function public.get_weekly_leaderboard()
returns table (
    display_name text,
    total_xp integer,
    league_tier text
)
language sql
security definer
as $$
    select
        display_name,
        coalesce(total_xp, 0) as total_xp,
        coalesce(league_tier, 'Bronz Kadro') as league_tier
    from public.profiles
    order by total_xp desc
    limit 10;
$$;

-- 10. BAŞLANGIÇ KPSS GENEL KÜLTÜR VERİLERİ (SEED DATA)
insert into public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation)
values
  (
    'Tarih',
    'İslamiyet Öncesi Türk Tarihi',
    'multiple_choice',
    2,
    'Aşağıdakilerden hangisi İslamiyet öncesi Türk devletlerinde hükümdarlık sembollerinden biri değildir?',
    '{"options": ["Otağ (Çadır)", "Nevbet (Davul)", "Tuğ (Sancak)", "Hutbe okutmak", "Kotuz (Sorguç)"], "correctIndex": 3}'::jsonb,
    'Hutbe okutmak, Türklerin İslamiyet''i kabul etmesinden sonra başlayan İslami bir hükümdarlık sembolüdür.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Türkiye''de güneyden kuzeye doğru gidildikçe aşağıdakilerden hangisinin artması beklenir?',
    '{"options": ["Güneş ışınlarının geliş açısı", "Deniz suyu tuzluluk oranı", "Gece ile gündüz arasındaki süre farkı", "Kalıcı kar alt sınırı", "Çizgisel hız"], "correctIndex": 2}'::jsonb,
    'Ekvator''dan kutuplara (Türkiye''de güneyden kuzeye) gidildikçe gece-gündüz süre farkı artar.'
  ),
  (
    'Vatandaşlık',
    'Yasama',
    'multiple_choice',
    2,
    '1982 Anayasası''na göre Türkiye Büyük Millet Meclisi genel seçimleri kaç yılda bir yapılır?',
    '{"options": ["3 yıl", "4 yıl", "5 yıl", "6 yıl", "7 yıl"], "correctIndex": 2}'::jsonb,
    '2017 Anayasa değişikliği ile TBMM ve Cumhurbaşkanlığı seçimleri 5 yılda bir birlikte yapılır.'
  ),
  (
    'Tarih',
    'Kurtuluş Savaşı',
    'true_false',
    2,
    'Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen kaldırılmıştır.',
    '{"isTrue": false}'::jsonb,
    'Boğazlar Komisyonu Lozan''da değil, 1936 Montrö Boğazlar Sözleşmesi ile kaldırılmıştır.'
  ),
  (
    'Coğrafya',
    'Türkiye''de Madencilik',
    'matching',
    2,
    'Maden çıkarım merkezlerini ilgili maden türüyle eşleştirin.',
    '{"pairs": [{"left": "Divriği & Hekimhan", "right": "Demir"}, {"left": "Murgul & Küre", "right": "Bakır"}, {"left": "Seydişehir & Mortaş", "right": "Boksit"}, {"left": "Kırka & Emet", "right": "Bor"}]}'::jsonb,
    'Divriği demir, Murgul bakır, Seydişehir boksit (alüminyum), Kırka ise bor çıkarım merkezidir.'
  );
