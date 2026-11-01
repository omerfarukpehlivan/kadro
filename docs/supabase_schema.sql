-- ============================================================================
-- KADRO (KPSS Lisans Genel Kültür) — Supabase PostgreSQL Veritabanı Şeması
-- Doğrudan Supabase SQL Editor üzerinde çalıştırılabilir (Auth + RLS + Analitik)
-- ============================================================================

-- 1. KULLANICI PROFİLLERİ, SERİ (STREAK), XP VE LİG TABLOSU
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Memur Adayı',
  daily_goal_questions int not null default 30,
  current_streak_days int not null default 0,
  longest_streak_days int not null default 0,
  total_xp int not null default 0,
  league_tier text not null default 'Bronz Kadro', -- Bronz Kadro, Gümüş Kadro, Altın Kadro, Müsteşar Ligi
  is_pro boolean not null default false,
  last_study_date date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- 2. SORU VE ETKİLEŞİMLİ OYUN HAVUZU (5 Şıklı, Doğru/Yanlış, Kavram Eşleştirme)
create table if not exists public.questions (
  id uuid primary key default gen_random_uuid(),
  lesson text not null, -- 'Tarih', 'Coğrafya', 'Vatandaşlık', 'Güncel Bilgiler'
  topic text not null,
  question_type text not null default 'multiple_choice', -- 'multiple_choice', 'true_false', 'matching'
  difficulty int not null default 2, -- 1: Kolay, 2: Orta, 3: Zor
  prompt_text text not null,
  -- JSONB interaction_data:
  -- multiple_choice: {"options": ["A","B","C","D","E"], "correctIndex": 0}
  -- true_false: {"isTrue": false}
  -- matching: {"pairs": [{"left": "Lozan", "right": "Kapitülasyonlar"}, ...]}
  interaction_data jsonb not null,
  explanation text not null,
  created_at timestamptz not null default now()
);

-- 3. ÇÖZÜLEN TESTLER & OYUN OTURUMLARI ARŞİVİ (Raporlama Ana Tablosu)
create table if not exists public.quiz_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  session_title text not null, -- Örn: 'Tarih Konu Testi', '60 Saniyede Pençe', 'Kavram Eşleştirme'
  session_mode text not null,  -- 'topic_quiz', 'full_exam_60', 'true_false_blitz', 'concept_match', 'mistake_review'
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
  session_id uuid not null references public.quiz_sessions(id) on delete cascade,
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
  mastery_percent int not null default 0, -- 0..100 (Kırmızı <50, Sarı 50-79, Yeşil 80+)
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

-- ROW LEVEL SECURITY (RLS) POLİTİKALARI
alter table public.profiles enable row level security;
alter table public.questions enable row level security;
alter table public.quiz_sessions enable row level security;
alter table public.question_attempt_logs enable row level security;
alter table public.user_topic_mastery enable row level security;
alter table public.study_tasks enable row level security;

create policy "Herkes aktif soruları okuyabilir" on public.questions
  for select using (true);

create policy "Kullanıcı kendi profilini okuyup güncelleyebilir" on public.profiles
  for all using (auth.uid() = id);

create policy "Kullanıcı kendi test geçmişini yönetebilir" on public.quiz_sessions
  for all using (auth.uid() = user_id);

create policy "Kullanıcı kendi soru loglarını yönetebilir" on public.question_attempt_logs
  for all using (auth.uid() = user_id);

create policy "Kullanıcı kendi konu ustalığını yönetebilir" on public.user_topic_mastery
  for all using (auth.uid() = user_id);

create policy "Kullanıcı kendi çalışma görevlerini yönetebilir" on public.study_tasks
  for all using (auth.uid() = user_id);
