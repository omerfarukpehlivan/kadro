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


-- 10. ÖRNEK SEED VERİ (İlk Kurulum İçin)
insert into public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation)
values
  (
    'Tarih',
    'İlk Türk Devletleri',
    'multiple_choice',
    2,
    'Uygurların yerleşik hayata geçmesiyle birlikte Türk kültür ve devlet yapısında önemli değişimler yaşanmıştır.

Aşağıdakilerden hangisi bu değişimlerin doğrudan bir sonucu olarak gösterilemez?',
    '{"options": ["Tapınak ve saray mimarisinin gelişmesi", "Kalıcı yazılı eserlerin ve kütüphanelerin ortaya çıkması", "Hükümdarlığın kut inancına dayandırılması geleneğinin sona ermesi", "Minyatür ve fresk gibi süsleme sanatlarının yaygınlaşması", "Tarım faaliyetlerinin temel geçim kaynağı hâline gelmesi"], "correctIndex": 2}'::jsonb,
    'Kut inancı (hükümdarlığın tanrısal kaynaklı olduğuna inanılması) Türk devlet geleneğinde varlığını sürdürmüştür. Yerleşik hayat bu inancı sona erdirmemiştir.'
  ),
  (
    'Tarih',
    'İlk Türk Devletleri',
    'multiple_choice',
    2,
    'İlk Türk devletlerinde devlet meselelerinin görüşülüp karara bağlandığı meclise ne ad verilirdi?',
    '{"options": ["Kurultay (Toy)", "Tigin", "Yarlığ", "Şad", "Ayukı"], "correctIndex": 0}'::jsonb,
    'İlk Türk devletlerinde devlet işlerinin görüşüldüğü danışma ve karar meclisine Kurultay veya Toy denirdi.'
  ),
  (
    'Tarih',
    'İlk Türk Devletleri',
    'multiple_choice',
    2,
    'Orhun Yazıtları (Göktürk Kitabeleri) hangi hükümdar ve devlet adamları adına dikilmiştir?',
    '{"options": ["Bumin Kağan - İstemi Yabgu - Mukan Kağan", "Kültigin - Bilge Kağan - Vezir Tonyukuk", "Mete Han - Teoman - Kiok", "Kutluk Kağan - Kapgan Kağan - Bögü Kağan", "Attila - Balamir - Uldız"], "correctIndex": 1}'::jsonb,
    'Orhun Abideleri; Vezir Tonyukuk (725), Kül Tigin (732) ve Bilge Kağan (735) adına dikilmiştir.'
  ),
  (
    'Tarih',
    'İlk Türk Devletleri',
    'multiple_choice',
    2,
    'Avrupa Hun Devleti''nin en parlak dönemini yaşatan ve Avrupalılar tarafından ''Tanrı''nın Kırbacı'' olarak adlandırılan hükümdar kimdir?',
    '{"options": ["Balamir", "Uldız", "Rua", "Attila", "Mukan Kağan"], "correctIndex": 3}'::jsonb,
    'Attila, Margus ve Anatolius Barışları ile Bizans''ı vergiye bağlamış, Batı dünyasında ''Tanrı''nın Kırbacı'' (Flagellum Dei) unvanıyla tanınmıştır.'
  ),
  (
    'Tarih',
    'İlk Türk Devletleri',
    'multiple_choice',
    2,
    'Musevilik dinini benimseyen tek Türk devleti aşağıdakilerden hangisidir?',
    '{"options": ["Avarlar", "Hazarlar", "Peçenekler", "Kumanlar (Kıpçaklar)", "Uygurlar"], "correctIndex": 1}'::jsonb,
    'Hazarlar, yönetici zümresi Musevilik dinini benimseyen ilk ve tek Türk devletidir. Ülkelerinde hoşgörü ortamı (Hazar Barış Çağı) hâkim olmuştur.'
  ),
  (
    'Tarih',
    'İlk Türk Devletleri',
    'multiple_choice',
    2,
    'Bizans ordusunda ücretli askerlik yaparken Malazgirt Savaşı''nda (1071) Büyük Selçuklu saflarına geçerek savaşın kazanılmasında rol oynayan Türk toplulukları hangileridir?',
    '{"options": ["Avarlar ve Bulgarlar", "Peçenekler ve Uzlar", "Hazarlar ve Karluklar", "Kıpçaklar ve Kırgızlar", "Türgişler ve Akhunlar"], "correctIndex": 1}'::jsonb,
    'Peçenekler ve Uzlar (Oğuzlar), Malazgirt Meydan Muharebesi sırasında soydaşları Selçuklular tarafına geçerek savaşın seyrini değiştirmiştir.'
  ),
  (
    'Tarih',
    'İlk Türk-İslam Devletleri',
    'multiple_choice',
    2,
    'İslamiyet''i kabul eden ilk Türk boyu aşağıdakilerden hangisidir?',
    '{"options": ["Karluklar", "Yağmalar", "Çiğiller", "Oğuzlar", "Kıpçaklar"], "correctIndex": 0}'::jsonb,
    'Talas Savaşı''ndan (751) sonra topluca İslamiyet''e geçen ilk Türk boyu Karluklar olmuştur.'
  ),
  (
    'Tarih',
    'İlk Türk-İslam Devletleri',
    'multiple_choice',
    2,
    'Orta Asya''da kurulan ilk Müslüman Türk devleti hangisidir?',
    '{"options": ["Gazneliler", "Karahanlılar", "Büyük Selçuklu Devleti", "Tolunoğulları", "İhşîdîler"], "correctIndex": 1}'::jsonb,
    'Orta Asya''da kurulan ilk Türk-İslam devleti Satuk Buğra Han (Abdülkerim) döneminde Karahanlılar olmuştur.'
  ),
  (
    'Tarih',
    'İlk Türk-İslam Devletleri',
    'multiple_choice',
    2,
    'Yusuf Has Hacib tarafından yazılan ve Türk-İslam edebiyatının ilk siyasetnamesi kabul edilen eser hangisidir?',
    '{"options": ["Divânu Lugâti''t-Türk", "Kutadgu Bilig", "Atabetü''l-Hakayık", "Divan-ı Hikmet", "Muhakemetü''l-Lügateyn"], "correctIndex": 1}'::jsonb,
    'Kutadgu Bilig (Mutluluk Veren Bilgi), Yusuf Has Hacib tarafından Karahanlı hükümdarı Tamgaç Buğra Han''a sunulan ilk siyasetnamedir.'
  ),
  (
    'Tarih',
    'İlk Türk-İslam Devletleri',
    'multiple_choice',
    2,
    'Sultan unvanını ilk kullanan Türk hükümdarı kimdir?',
    '{"options": ["Tuğrul Bey", "Alparslan", "Gazneli Mahmut", "Melikşah", "Satuk Buğra Han"], "correctIndex": 2}'::jsonb,
    'Abbasi Halifesi''ni Şii Büveyhoğulları baskısından kurtaran Gazneli Mahmut, halife tarafından ''Sultan'' unvanı verilen ilk Türk hükümdardır.'
  ),
  (
    'Tarih',
    'İlk Türk-İslam Devletleri',
    'multiple_choice',
    2,
    'Büyük Selçuklu Devleti''nin kurucusu kabul edilen ve 1040 Dandanakan Savaşı sonrasında adına hutbe okutan hükümdar kimdir?',
    '{"options": ["Tuğrul Bey", "Çağrı Bey", "Alparslan", "Melikşah", "Sultan Sencer"], "correctIndex": 0}'::jsonb,
    'Tuğrul Bey, 1040 Dandanakan Zaferi sonrasında Nişabur''da adına hutbe okutarak bağımsızlığını ilan etmiştir.'
  ),
  (
    'Tarih',
    'İlk Türk-İslam Devletleri',
    'multiple_choice',
    2,
    'Nizamiye Medreselerini kuran ve ünlü eseri ''Siyasetname''yi kaleme alan Büyük Selçuklu veziri kimdir?',
    '{"options": ["Kemaleddin İsmail", "Nizamülmülk", "Sadreddin Konevi", "Pervane Muinüddin", "Cüveyni"], "correctIndex": 1}'::jsonb,
    'Nizamülmülk, Alparslan ve Melikşah dönemlerinde vezirlik yapmış, Bâtınîlik tehlikesine karşı Nizamiye Medreselerini kurmuştur.'
  ),
  (
    'Tarih',
    'Anadolu Selçuklu ve Beylikler',
    'multiple_choice',
    2,
    '1071 Malazgirt Zaferi''nden sonra Anadolu''da kurulan ilk Türk beyliği hangisidir?',
    '{"options": ["Danişmentliler", "Saltuklular", "Mengücekliler", "Artuklular", "Çaka Beyliği"], "correctIndex": 1}'::jsonb,
    'Ebulkasım Saltuk tarafından Erzurum ve çevresinde kurulan Saltuklular, Anadolu''da kurulan ilk Türk beyliğidir.'
  ),
  (
    'Tarih',
    'Anadolu Selçuklu ve Beylikler',
    'multiple_choice',
    2,
    'Anadolu Selçuklu Devleti''nin ''Yurt Tutan'' olarak bilinen ve Anadolu''nun Türk yurdu olduğunu kesinleştiren savaşı hangisidir?',
    '{"options": ["Pasinler Savaşı (1048)", "Malazgirt Savaşı (1071)", "Miryokefalon Savaşı (1176)", "Yassıçemen Savaşı (1230)", "Kösedağ Savaşı (1243)"], "correctIndex": 2}'::jsonb,
    'II. Kılıç Arslan döneminde Bizans''a karşı kazanılan 1176 Miryokefalon Zaferi ile Anadolu kesin olarak Türk yurdu olmuştur.'
  ),
  (
    'Tarih',
    'Anadolu Selçuklu ve Beylikler',
    'multiple_choice',
    2,
    'Anadolu Selçuklu Devleti''nde esnaf ve zanaatkârların mesleki, ahlaki ve iktisadi teşkilatlanmasını sağlayan kurum hangisidir?',
    '{"options": ["Ahilik Teşkilatı", "İkta Teşkilatı", "Divan-ı İnşa", "Lonca", "Gulamhane"], "correctIndex": 0}'::jsonb,
    'Ahi Evran tarafından Kırşehir merkezli kurulan Ahilik Teşkilatı, esnafın ahlaki ve mesleki dayanışmasını sağlamıştır.'
  ),
  (
    'Tarih',
    'Anadolu Selçuklu ve Beylikler',
    'multiple_choice',
    2,
    '1243 Kösedağ Savaşı ile Anadolu Selçuklu Devleti''ni mağlup ederek Anadolu''da Moğol hâkimiyetini başlatan devlet hangisidir?',
    '{"options": ["Altın Orda", "İlhanlılar", "Çağatay Hanlığı", "Timur Devleti", "Memlükler"], "correctIndex": 1}'::jsonb,
    'Hülagü Han tarafından İran''da kurulan İlhanlılar, 1243 Kösedağ Savaşı''nda Anadolu Selçuklu ordusunu mağlup etmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Kuruluş ve Yükselme',
    'multiple_choice',
    2,
    'Osmanlı Devleti''nin Rumeli''ye geçişinde üs olarak kullandığı Çimpe Kalesi hangi padişah döneminde alınmıştır?',
    '{"options": ["Osman Bey", "Orhan Bey", "I. Murad", "Yıldırım Bayezid", "Çelebi Mehmed"], "correctIndex": 1}'::jsonb,
    'Bizans imparatoru Kantakuzen''e yardım karşılığında Orhan Bey döneminde (1353) Çimpe Kalesi alınmış ve Rumeli''de ilk üs olmuştur.'
  ),
  (
    'Tarih',
    'Osmanlı Kuruluş ve Yükselme',
    'multiple_choice',
    2,
    'Osmanlı tarihinde ilk kez Yeniçeri Ocağı''nı kuran ve Tımar sistemini teşkilatlandıran padişah kimdir?',
    '{"options": ["Orhan Bey", "I. Murad", "Yıldırım Bayezid", "II. Murad", "Fatih Sultan Mehmet"], "correctIndex": 1}'::jsonb,
    'I. Murad (Hüdavendigâr), Kapıkulu Ocaklarını, Pençik sistemini ve Rumeli Beylerbeyliği''ni kurmuştur.'
  ),
  (
    'Tarih',
    'Osmanlı Kuruluş ve Yükselme',
    'multiple_choice',
    2,
    '1402 Ankara Savaşı''nda Yıldırım Bayezid''in Timur''a yenilmesiyle başlayan ve 11 yıl süren iç karışıklık dönemine ne ad verilir?',
    '{"options": ["Lale Devri", "Fetret Devri", "Duraklama Dönemi", "Cem Sultan Olayı", "İstibdat Dönemi"], "correctIndex": 1}'::jsonb,
    '1402-1413 yılları arasında şehzadeler arasında taht mücadeleleriyle geçen döneme Fetret Devri denir. Çelebi Mehmed devleti toparlamıştır.'
  ),
  (
    'Tarih',
    'Osmanlı Kuruluş ve Yükselme',
    'multiple_choice',
    2,
    'Karadeniz''in bir ''Türk Gölü'' hâline gelmesi hangi fethin tamamlanmasıyla gerçekleşmiştir?',
    '{"options": ["Trabzon''un Fethi", "Kırım''ın Fethi", "Sinop''un Alınması", "Amasra''nın Fethi", "Kefe Seferi"], "correctIndex": 1}'::jsonb,
    'Fatih Sultan Mehmet döneminde Gedik Ahmet Paşa komutasında 1475 yılında Kırım''ın fethedilmesiyle Karadeniz Türk gölü olmuştur.'
  ),
  (
    'Tarih',
    'Osmanlı Kuruluş ve Yükselme',
    'multiple_choice',
    2,
    'Yavuz Sultan Selim''in Memlükleri mağlup ederek Suriye, Filistin ve Mısır''ı fethettiği ve halifeliğin Osmanlı''ya geçtiği savaşlar hangileridir?',
    '{"options": ["Çaldıran ve Turnadağ", "Mercidabık ve Ridaniye", "Mohaç ve Preveze", "Otlukbeli ve Çaldıran", "Varna ve II. Kosova"], "correctIndex": 1}'::jsonb,
    '1516 Mercidabık (Suriye) ve 1517 Ridaniye (Mısır) zaferleriyle Memlük Devleti yıkılmış ve hilafet Osmanlı''ya intikal etmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Kuruluş ve Yükselme',
    'multiple_choice',
    2,
    'Akdeniz''in bir ''Türk Gölü'' hâline gelmesini sağlayan ve Haçlı donanmasına karşı kazanılan ünlü deniz zaferi hangisidir?',
    '{"options": ["İnebahtı Deniz Savaşı", "Preveze Deniz Zaferi (1538)", "Cerbe Deniz Savaşı", "Çeşme Baskını", "Navarin Baskını"], "correctIndex": 1}'::jsonb,
    'Barbaros Hayreddin Paşa komutasındaki Osmanlı donanması, Andrea Doria komutasındaki Haçlı donanmasını 1538 Preveze''de bozguna uğratmıştır.'
  ),
  (
    'Tarih',
    'Osmanlı Kültür ve Medeniyeti',
    'multiple_choice',
    2,
    'Osmanlı Divan-ı Hümayun''unda dış yazışmalardan sorumlu olan ve zamanla günümüz Dışişleri Bakanı konumuna gelen görevli kimdir?',
    '{"options": ["Nişancı", "Reisülküttap", "Defterdar", "Sadrazam", "Kazasker"], "correctIndex": 1}'::jsonb,
    'Önceleri Nişancı''ya bağlı bürokrat olan Reisülküttap, XVII. yüzyıldan itibaren dış ilişkilerin yoğunlaşmasıyla Hariciye Nazırı konumuna yükselmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Kültür ve Medeniyeti',
    'multiple_choice',
    2,
    'Osmanlı Devleti''nde adalet, eğitim ve din işlerinden sorumlu olan, kadı ve müderrislerin atamasını yapan divan üyesi kimdir?',
    '{"options": ["Şeyhülislam", "Kazasker", "Kaptanıderya", "Subaşı", "Muhtesip"], "correctIndex": 1}'::jsonb,
    'Kazasker (Kadıasker), İlmiye sınıfının başında yer alır; şer''i davalara bakar ve kadı-müderris tayinlerini yürütürdü.'
  ),
  (
    'Tarih',
    'Osmanlı Kültür ve Medeniyeti',
    'multiple_choice',
    2,
    'Osmanlı toprak sisteminde geliri doğrudan devlet hazinesine giden arazilere ne ad verilir?',
    '{"options": ["Dirlik", "Mukaataa", "Vakıf", "Paşmaklık", "Malikâne"], "correctIndex": 1}'::jsonb,
    'Mukaataa; gelirleri doğrudan hazineye (Hazine-i Âmire) aktarılan, genellikle iltizam yoluyla kiralanan devlet arazileridir.'
  ),
  (
    'Tarih',
    'Osmanlı Kültür ve Medeniyeti',
    'multiple_choice',
    2,
    'Osmanlı Devleti''nde çarşı ve pazarlardaki fiyatları denetleyen, tartı ve ölçü aletlerini teftiş eden görevli kimdir?',
    '{"options": ["Kapan Emini", "Muhtesip", "Beylerbeyi", "Mültezim", "Cebecibaşı"], "correctIndex": 1}'::jsonb,
    'Muhtesip; çarşı ve pazar esnafını, narh kurallarını, ürün kalitesini ve tartı aletlerini denetleyen belediye zabıtası konumundadır.'
  ),
  (
    'Tarih',
    'Osmanlı Kültür ve Medeniyeti',
    'multiple_choice',
    2,
    'Mimar Sinan''ın ''Çıraklık'', ''Kalfalık'' ve ''Ustalık'' eserleri sırasıyla hangi şıkta doğru verilmiştir?',
    '{"options": ["Şehzade Camii - Süleymaniye Camii - Selimiye Camii", "Mihrimah Camii - Şehzade Camii - Süleymaniye Camii", "Süleymaniye Camii - Selimiye Camii - Sultanahmet Camii", "Rüstem Paşa Camii - Selimiye Camii - Şehzade Camii", "Sultanahmet Camii - Selimiye Camii - Süleymaniye Camii"], "correctIndex": 0}'::jsonb,
    'Mimar Sinan; Şehzade Camii''ni çıraklık, Süleymaniye''yi kalfalık, Edirne Selimiye Camii''ni ise ustalık eseri olarak nitelendirmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Kültür ve Medeniyeti',
    'multiple_choice',
    2,
    'Osmanlı minyatür sanatında ünlü el yazmalarını resimleyen ve ''Surnâme-i Vehbi'' eserini nakşeden sanatçı kimdir?',
    '{"options": ["Matrakçı Nasuh", "Levni", "Nakkaş Osman", "Şeyh Hamdullah", "Hafız Osman"], "correctIndex": 1}'::jsonb,
    'Lale Devri''nin ünlü minyatür ustası Levni (Abdülcelil Çelebi), III. Ahmed''in şehzadelerinin sünnet düğününü anlatan Surname-i Vehbi''yi resmetmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Duraklama ve Gerileme',
    'multiple_choice',
    2,
    'Osmanlı Devleti''nin batıda en geniş sınırlara ulaştığı antlaşma aşağıdakilerden hangisidir?',
    '{"options": ["Vasvar Antlaşması (1664)", "Bucaş Antlaşması (1672)", "Zitvatorok Antlaşması (1606)", "Karlofça Antlaşması (1699)", "Pasarofça Antlaşması (1718)"], "correctIndex": 1}'::jsonb,
    'Lehistan ile imzalanan 1672 Bucaş Antlaşması ile Podolya ve Ukrayna alınmış, Osmanlı batıda en geniş sınırlarına ulaşmıştır.'
  ),
  (
    'Tarih',
    'Osmanlı Duraklama ve Gerileme',
    'multiple_choice',
    2,
    'Osmanlı Devleti''nin ilk kez büyük çapta toprak kaybettiği ve Orta Avrupa egemenliğinin sona erdiği antlaşma hangisidir?',
    '{"options": ["Karlofça Antlaşması (1699)", "Pasarofça Antlaşması (1718)", "Belgrad Antlaşması (1739)", "Küçük Kaynarca Antlaşması (1774)", "Yaş Antlaşması (1792)"], "correctIndex": 0}'::jsonb,
    '1699 Karlofça Antlaşması ile Macaristan ve Erdel kaybedilmiş, Osmanlı Devleti ilk kez büyük çapta toprak kaybına uğramıştır.'
  ),
  (
    'Tarih',
    'Osmanlı Duraklama ve Gerileme',
    'multiple_choice',
    2,
    'Lale Devri''nde İbrahim Müteferrika ve Sait Efendi tarafından kurulan ilk Türk matbaasında basılan ilk eser hangisidir?',
    '{"options": ["Cihannüma", "Vankulu Lügati", "Tarih-i Seyyah", "Tuhfetü''l-Kibar", "Kamus-ı Türki"], "correctIndex": 1}'::jsonb,
    '1727 yılında açılan ilk resmi Türk matbaasında basılan ilk eser, Sıhah-ı Cevheri tercümesi olan ''Vankulu Lügati'' olmuştur.'
  ),
  (
    'Tarih',
    'Osmanlı Duraklama ve Gerileme',
    'multiple_choice',
    2,
    'Kırım''ın bağımsız olduğunu kabul ettiren ve Rusya''ya Karadeniz''de donanma bulundurma hakkı tanıyan 1774 tarihli antlaşma hangisidir?',
    '{"options": ["Küçük Kaynarca Antlaşması", "Aynalıkavak Tenkihnamesi", "Yaş Antlaşması", "Bükreş Antlaşması", "Edirne Antlaşması"], "correctIndex": 0}'::jsonb,
    '1774 Küçük Kaynarca Antlaşması ile halkı Müslüman ve Türk olan Kırım Osmanlı''dan ayrılmış, Rusya''ya savaş tazminatı ödenmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Dağılma Dönemi',
    'multiple_choice',
    2,
    '1808 yılında II. Mahmut ile Âyanlar arasında imzalanan ve padişahın yetkilerini ilk kez sınırlandıran belge hangisidir?',
    '{"options": ["Tanzimat Fermanı", "Sened-i İttifak", "Islahat Fermanı", "Kanun-i Esasi", "Gülhane Hatt-ı Hümayunu"], "correctIndex": 1}'::jsonb,
    'Sened-i İttifak (1808), merkezi otorite ile taşradaki güçlü ayanlar arasında imzalanmış olup padişah yetkilerini kısıtlayan ilk belgedir (Magna Carta benzetmesi).'
  ),
  (
    'Tarih',
    'Osmanlı Dağılma Dönemi',
    'multiple_choice',
    2,
    'Yeniçeri Ocağı''nın 1826 yılında II. Mahmut tarafından kaldırılması olayına tarihte ne ad verilir?',
    '{"options": ["Vaka-i Hayriye", "Vaka-i Vakvakiye", "31 Mart Vakası", "Kuleli Olayı", "Babıali Baskını"], "correctIndex": 0}'::jsonb,
    'Yeniçeri Ocağı''nın 1826''da topa tutularak lağvedilmesi olayına ''hayırlı olay'' anlamına gelen Vaka-i Hayriye denilmiştir.'
  ),
  (
    'Tarih',
    'Osmanlı Dağılma Dönemi',
    'multiple_choice',
    2,
    '1839 yılında Sadrazam Mustafa Reşit Paşa tarafından ilan edilen ve hukukun üstünlüğü ilkesini getiren ferman hangisidir?',
    '{"options": ["Islahat Fermanı", "Tanzimat Fermanı", "Halepa Fermanı", "Vilayet Nizamnamesi", "Adalet Fermanı"], "correctIndex": 1}'::jsonb,
    'Tanzimat Fermanı (Gülhane Hatt-ı Şerifi), padişah Abdülmecid döneminde ilan edilmiş; kanun önünde eşitlik ve can-mal güvenliğini güvenceye almıştır.'
  ),
  (
    'Tarih',
    'Osmanlı Dağılma Dönemi',
    'multiple_choice',
    2,
    'Türk tarihinin ilk yazılı anayasası olan 1876 Kanun-i Esasi hangi padişah döneminde ilan edilmiştir?',
    '{"options": ["Abdülaziz", "V. Murad", "II. Abdülhamit", "Sultan Reşad", "Vahdettin"], "correctIndex": 2}'::jsonb,
    'II. Abdülhamit, tahta çıkarken Genç Osmanlılara verdiği söz doğrultusunda 23 Aralık 1876''da Kanun-i Esasi''yi ilan etmiş ve I. Meşrutiyet başlamıştır.'
  ),
  (
    'Tarih',
    'XX. Yüzyıl Başları',
    'multiple_choice',
    2,
    'Mustafa Kemal''in Derne ve Tobruk''ta yerel halkı teşkilatlandırarak İtalyanlara karşı başarı sağladığı ilk askeri başarısı hangi savaştır?',
    '{"options": ["Trablusgarp Savaşı (1911-1912)", "I. Balkan Savaşı", "Çanakkale Savaşı", "Sakarya Meydan Muharebesi", "Kafkas Cephesi"], "correctIndex": 0}'::jsonb,
    'Mustafa Kemal, Enver Paşa ile birlikte gizlice gittiği Trablusgarp''ta İtalyanlara karşı gerilla mücadelesi vermiş, bu onun ilk askerî zaferi olmuştur.'
  ),
  (
    'Tarih',
    'XX. Yüzyıl Başları',
    'multiple_choice',
    2,
    'I. Dünya Savaşı''nda Osmanlı Devleti''nin taarruz amacıyla açtığı iki cephe hangileridir?',
    '{"options": ["Çanakkale ve Irak", "Kafkas ve Kanal", "Suriye-Filistin ve Hicaz-Yemen", "Galiçya ve Romanya", "Kafkas ve Çanakkale"], "correctIndex": 1}'::jsonb,
    'Osmanlı Devleti I. Dünya Savaşı''nda yalnızca iki taarruz cephesi açmıştır: Kafkas Cephesi ve Kanal (Süveyş) Cephesi.'
  ),
  (
    'Tarih',
    'XX. Yüzyıl Başları',
    'multiple_choice',
    2,
    'Mustafa Kemal''in Çanakkale Cephesi''nde ''Ben size taarruzu emretmiyorum, ölmeyi emrediyorum'' emrini verdiği tepe hangisidir?',
    '{"options": ["Kilitbahir", "Conkbayırı", "Alçıtepe", "Seddülbahir", "Kireçtepe"], "correctIndex": 1}'::jsonb,
    'Mustafa Kemal Conkbayırı''nda 57. Alay''a bu tarihi emri vererek Anzak birliklerinin ilerlemesini durdurmuştur.'
  ),
  (
    'Tarih',
    'XX. Yüzyıl Başları',
    'multiple_choice',
    2,
    'Osmanlı Devleti''nin I. Dünya Savaşı''nı fiilen sona erdiren ve ağır maddeler içeren mütarekesi hangisidir?',
    '{"options": ["Mudanya Ateşkes Antlaşması", "Mondros Ateşkes Antlaşması (30 Ekim 1918)", "Sevr Barış Antlaşması", "Uşi Antlaşması", "Brest-Litovsk Antlaşması"], "correctIndex": 1}'::jsonb,
    'Bahriye Nazırı Rauf Bey ile İngiliz Amiral Calthorpe arasında Limni Adası''nda imzalanan Mondros Ateşkesi ile Osmanlı ordusu terhis edilmiştir.'
  ),
  (
    'Tarih',
    'Milli Mücadele',
    'multiple_choice',
    2,
    'Kurtuluş Savaşı''nın gerekçesi, amacı ve yöntemi ilk kez hangi tarihî belgede açıklanmıştır?',
    '{"options": ["Havza Genelgesi", "Amasya Genelgesi (22 Haziran 1919)", "Erzurum Kongresi", "Sivas Kongresi", "Misak-ı Milli"], "correctIndex": 1}'::jsonb,
    'Amasya Genelgesi''ndeki ''Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır'' maddesi ihtilal beyannamesi niteliğindedir.'
  ),
  (
    'Tarih',
    'Milli Mücadele',
    'multiple_choice',
    2,
    'Manda ve himaye fikrinin kesin ve son olarak reddedildiği kongre hangisidir?',
    '{"options": ["Erzurum Kongresi", "Sivas Kongresi (4-11 Eylül 1919)", "Amasya Görüşmeleri", "Balıkesir Kongresi", "Pozantı Kongresi"], "correctIndex": 1}'::jsonb,
    'Manda ve himaye ilk kez Erzurum Kongresi''nde reddedilmiş; Sivas Kongresi''nde ise bir daha gündeme gelmemek üzere kesin olarak reddedilmiştir.'
  ),
  (
    'Tarih',
    'Milli Mücadele',
    'multiple_choice',
    2,
    'Son Osmanlı Mebusan Meclisi tarafından 28 Ocak 1920''de kabul edilen ve milli sınırları çizen manifesto hangisidir?',
    '{"options": ["Misak-ı Maarif", "Misak-ı Milli", "Tekalif-i Milliye", "Teşkilat-ı Esasiye", "Hıyanet-i Vataniye"], "correctIndex": 1}'::jsonb,
    'Misak-ı Milli (Milli Ant), Mondros imzalandığı tarihte işgal edilmemiş Türk topraklarının bölünmez bir bütün olduğunu ilan etmiştir.'
  ),
  (
    'Tarih',
    'Milli Mücadele',
    'multiple_choice',
    2,
    'Mustafa Kemal''e TBMM tarafından ''Gazi'' unvanı ve ''Mareşal'' rütbesi hangi savaştan sonra verilmiştir?',
    '{"options": ["I. İnönü Savaşı", "II. İnönü Savaşı", "Sakarya Meydan Muharebesi (1921)", "Büyük Taarruz", "Eskişehir-Kütahya Savaşı"], "correctIndex": 2}'::jsonb,
    '22 gün 22 gece süren Sakarya Meydan Muharebesi zaferinin ardından TBMM, Mustafa Kemal Paşa''ya Mareşallik rütbesi ve Gazilik unvanı vermiştir.'
  ),
  (
    'Tarih',
    'Milli Mücadele',
    'multiple_choice',
    2,
    'Kurtuluş Savaşı''nın askeri safhasını sona erdiren ve Doğu Trakya, Boğazlar ve İstanbul''un savaşsız kurtarılmasını sağlayan antlaşma hangisidir?',
    '{"options": ["Mudanya Ateşkes Antlaşması (11 Ekim 1922)", "Lozan Barış Antlaşması", "Gümrü Antlaşması", "Moskova Antlaşması", "Ankara Antlaşması"], "correctIndex": 0}'::jsonb,
    'İsmet İnönü''nün temsil ettiği Mudanya Mütarekesi ile İstanbul, Boğazlar ve Doğu Trakya tek bir kurşun sıkılmadan diplomatik yolla kurtarılmıştır.'
  ),
  (
    'Tarih',
    'Atatürk İlkeleri ve İnkılaplar',
    'multiple_choice',
    2,
    'Cumhuriyetçilik ilkesinin doğal bir sonucu olan ve sınıf ayrımını reddederek yasalar önünde eşitliği savunan Atatürk ilkesi hangisidir?',
    '{"options": ["Devletçilik", "Halkçılık", "Laiklik", "İnkılapçılık", "Milliyetçilik"], "correctIndex": 1}'::jsonb,
    'Halkçılık; egemenliğin halka ait olması, ayrıcalıksız eşit bir toplum düzeni ve sosyal adaleti temel alan ilkedir.'
  ),
  (
    'Tarih',
    'Atatürk İlkeleri ve İnkılaplar',
    'multiple_choice',
    2,
    'Türkiye''de Medeni Kanun (1926) hangi Avrupa ülkesinin medeni kanunu örnek alınarak hazırlanmıştır?',
    '{"options": ["Almanya", "İsviçre", "Fransa", "İtalya", "Avusturya"], "correctIndex": 1}'::jsonb,
    'Modern, laik ve dönemin en çağdaş kanunu olması sebebiyle İsviçre Medeni Kanunu esas alınarak 17 Şubat 1926''da Türk Medeni Kanunu kabul edilmiştir.'
  ),
  (
    'Tarih',
    'Atatürk İlkeleri ve İnkılaplar',
    'multiple_choice',
    2,
    'Lozan''da çözülemeyen Boğazlar meselesi, 1936 yılında imzalanan hangi antlaşma ile Türkiye''nin tam egemenliğine geçmiştir?',
    '{"options": ["Montrö Boğazlar Sözleşmesi", "Sadabat Paktı", "Balkan Antantı", "Ankara Sözleşmesi", "Cenevre Protokolü"], "correctIndex": 0}'::jsonb,
    '20 Temmuz 1936 Montrö Boğazlar Sözleşmesi ile Boğazlar Komisyonu kaldırılmış ve Türk ordusunun Boğazlar''a girişi onaylanmıştır.'
  ),
  (
    'Tarih',
    'Çağdaş Türk ve Dünya Tarihi',
    'multiple_choice',
    2,
    'II. Dünya Savaşı sonrasında Sovyet Rusya tehdidine karşı Batı Bloğu ülkeleri tarafından kurulan savunma paktı hangisidir?',
    '{"options": ["Varşova Paktı", "NATO (Kuzey Atlantik Antlaşması Örgütü)", "Bağdat Paktı", "SEATO", "Cominform"], "correctIndex": 1}'::jsonb,
    'NATO, 1949 yılında Sovyet yayılmacılığına karşı kurulmuştur. Türkiye 1952 yılında Kore Savaşı''ndaki başarısı sonrasında NATO''ya dâhil olmuştur.'
  ),
  (
    'Tarih',
    'Çağdaş Türk ve Dünya Tarihi',
    'multiple_choice',
    2,
    '1974 Kıbrıs Barış Harekâtı sırasında Başbakan ve Başbakan Yardımcısı olan devlet adamları sırasıyla kimlerdir?',
    '{"options": ["Bülent Ecevit - Necmettin Erbakan", "Süleyman Demirel - Alparslan Türkeş", "İsmet İnönü - Turhan Feyzioğlu", "Turgut Özal - Erdal İnönü", "Nihat Erim - Ferit Melen"], "correctIndex": 0}'::jsonb,
    '20 Temmuz 1974 Kıbrıs Barış Harekâtı; Başbakan Bülent Ecevit ve Başbakan Yardımcısı Necmettin Erbakan liderliğindeki koalisyon hükümeti döneminde yapılmıştır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Türkiye''nin matematik (mutlak) konumu aşağıdakilerden hangisidir?',
    '{"options": ["26°-45° Doğu Boylamları / 36°-42° Kuzey Paralelleri", "36°-42° Doğu Boylamları / 26°-45° Kuzey Paralelleri", "10°-20° Doğu Boylamları / 40°-50° Kuzey Paralelleri", "20°-40° Doğu Boylamları / 30°-40° Kuzey Paralelleri", "25°-45° Batı Boylamları / 36°-42° Güney Paralelleri"], "correctIndex": 0}'::jsonb,
    'Türkiye, Greenwich''in doğusunda 26°-45° Doğu meridyenleri ile Ekvator''un kuzeyinde 36°-42° Kuzey paralelleri arasında yer alır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Türkiye''de güneyden kuzeye doğru gidildikçe aşağıdakilerden hangisinin artması beklenir?',
    '{"options": ["Güneş ışınlarının düşme açısı", "Deniz suyu tuzluluk oranı", "Gece ile gündüz arasındaki süre farkı", "Kalıcı kar alt sınırı", "Çizgisel dönüş hızı"], "correctIndex": 2}'::jsonb,
    'Ekvator''dan kutuplara doğru (Türkiye''de güneyden kuzeye) gidildikçe gece-gündüz süre farkı ve alacakaranlık süresi artar.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Türkiye''de 21 Haziran tarihinde en uzun gündüz süresi hangi ilimizde yaşanır?',
    '{"options": ["Hatay", "Antalya", "Muğla", "Sinop", "Iğdır"], "correctIndex": 3}'::jsonb,
    '21 Haziran''da Kuzey Yarımküre''de kuzeye gidildikçe gündüz süresi uzar. Türkiye''nin en kuzey noktası Sinop İnceburun''dur.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Türkiye''de yerel saatin en ileri olduğu ilimiz hangisidir?',
    '{"options": ["Çanakkale", "İzmir", "Iğdır", "Trabzon", "Hakkâri"], "correctIndex": 2}'::jsonb,
    'Türkiye''nin en doğusundaki ilimiz Iğdır''dır (45° Doğu Meridyeni). Güneş en erken burada doğar ve batar, dolayısıyla yerel saat en ileridir.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Aşağıdakilerden hangisi Türkiye''nin özel (göreceli) konumunun bir sonucudur?',
    '{"options": ["Dört mevsimin belirgin olarak yaşanması", "Kuzeyden esen rüzgârların sıcaklığı düşürmesi", "Aynı anda farklı iklim özelliklerinin ve kış turizminin yaşanabilmesi", "Cephesel (frontal) yağışların görülmesi", "Dağların güney yamaçlarının bakı etkisinde kalması"], "correctIndex": 2}'::jsonb,
    'Kısa mesafelerde yer şekilleri, yükseklik ve denizellik sebebiyle aynı anda farklı mevsim özelliklerinin yaşanabilmesi özel (göreceli) konumun sonucudur.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Coğrafi Konumu',
    'multiple_choice',
    2,
    'Türkiye''nin en uzun kara sınırı hangi komşusu iledir?',
    '{"options": ["Yunanistan", "İran", "Suriye (911 km)", "Irak", "Gürcistan"], "correctIndex": 2}'::jsonb,
    'Türkiye''nin en uzun kara sınırı Suriye (911 km), en kısa kara sınırı ise Nahçıvan/Azerbaycan (yaklaşık 18 km) iledir.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Türkiye arazisinin büyük bölümünün III. ve IV. Jeolojik Zamanlarda oluşması hangi özelliğin ortaya çıkmasına neden olmuştur?',
    '{"options": ["Taş kömürü yataklarının yaygın olmasına", "Ortalama yükseltinin az ve düzlüklerin yaygın olmasına", "Genç, kırıklı dağ kuşağı ve zengin linyit yataklarına sahip olmasına", "Akarsuların denge profiline ulaşmış olmasına", "Deprem riskinin çok düşük olmasına"], "correctIndex": 2}'::jsonb,
    'Türkiye genç oluşumlu (Alp-Himalaya orojenezi) bir ülke olduğu için deprem riski yüksek, ortalama yükseltisi fazla ve linyit-jeotermal kaynakları zengindir.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Türkiye''nin en yüksek zirvesi olan Ağrı Dağı (5.137 m) oluşum kökeni bakımından hangi dağ türüdür?',
    '{"options": ["Kıvrım Dağ", "Kırık (Horst) Dağ", "Volkanik Dağ", "Tortul Dağ", "Muz Dağı"], "correctIndex": 2}'::jsonb,
    'Ağrı Dağı, Nemrut, Süphan ve Tendürek gibi Doğu Anadolu''da yer alan bir stratovolkan (volkanik dağ) kütlesidir.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Ege Bölgesi''nde horst ve graben sistemiyle oluşan kırık dağlar arasında aşağıdakilerden hangisi yer almaz?',
    '{"options": ["Madra Dağı", "Yunt Dağı", "Bozdağlar", "Aydın Dağları", "Kaçkar Dağları"], "correctIndex": 4}'::jsonb,
    'Kaçkar Dağları, Doğu Karadeniz''de yer alan Alp orojenezi ürünü kıvrım dağlarıdır; Ege kırık sistemi horstu değildir.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Akdeniz Bölgesi''nde kireçtaşı (kalker) arazisinin yaygın olması nedeniyle oluşan yer şekillerine ne ad verilir?',
    '{"options": ["Buzul şekilleri", "Karstik şekiller (Lapya, Dolin, Obruk, Polye)", "Rüzgâr aşınım şekilleri", "Volkanik şekiller", "Falez ve tombolo"], "correctIndex": 1}'::jsonb,
    'Kalker, jips ve kaya tuzu gibi suda kolay eriyebilen kayaçların aşınması ve birikmesiyle karstik yer şekilleri meydana gelir.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Bir adanın kıyı oku ve kordonu ile karaya bağlanması sonucu oluşan yarımadalara ''Tombolo'' (Saplı Ada) denir. Türkiye''deki en tipik iki örnek hangisidir?',
    '{"options": ["Kapıdağ Yarımadası ve Sinop Yarımadası", "Gelibolu ve Biga Yarımadaları", "Datça ve Bodrum Yarımadaları", "Çeşme ve Karaburun Yarımadaları", "Dilek ve Reşadiye Yarımadaları"], "correctIndex": 0}'::jsonb,
    'Balıkesir Kapıdağ Yarımadası ve Sinop İnceburun Yarımadası Türkiye''deki en karakteristik dalga birikim şekli tombololardır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Karadeniz ve Akdeniz kıyılarında dağların kıyıya paralel uzanması sebebiyle görülen kıyı tipi hangisidir?',
    '{"options": ["Enine Kıyı Tipi", "Boyuna Kıyı Tipi", "Ria Kıyı Tipi", "Dalmaçya Kıyı Tipi", "Fiyort Kıyı Tipi"], "correctIndex": 1}'::jsonb,
    'Dağların kıyı çizgisine paralel uzandığı yerlerde boyuna kıyı tipi görülür. Doğal liman sayısı az, falez yaygın, kıta sahanlığı dardır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Ege Bölgesi''nde dağların kıyıya dik uzanması sebebiyle görülen girintili-çıkıntılı kıyı tipi hangisidir?',
    '{"options": ["Boyuna Kıyı Tipi", "Enine Kıyı Tipi", "Limanlı Kıyı Tipi", "Haliç Tipi Kıyı", "Mercan Kıyıları"], "correctIndex": 1}'::jsonb,
    'Ege kıyılarında dağlar denize dik uzandığı için enine kıyı tipi görülür; koy, körfez ve doğal liman sayısı çok fazladır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Yer Şekilleri',
    'multiple_choice',
    2,
    'Türkiye''nin en büyük delta ovası olan ve Seyhan ile Ceyhan nehirlerinin taşıdığı alüvyonlarla oluşan ova hangisidir?',
    '{"options": ["Bafra Ovası", "Çarşamba Ovası", "Çukurova", "Silifke Ovası", "Gediz Ovası"], "correctIndex": 2}'::jsonb,
    'Akdeniz''de Seyhan ve Ceyhan nehirlerinin oluşturduğu Çukurova, Türkiye''nin en büyük ve verimli delta ovasıdır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin İklimi',
    'multiple_choice',
    2,
    'Türkiye''de kış mevsiminde Sibirya Termik Yüksek Basıncı etkili olduğunda hava durumu nasıl seyreder?',
    '{"options": ["Ilık ve bol yağışlı", "Aşırı soğuk, ayaz ve kar yağışlı", "Sıcak ve kurak", "Sisli ve serin", "Tropikal fırtınalı"], "correctIndex": 1}'::jsonb,
    'Sibirya Termik Antisiklonu kışın Türkiye''ye girdiğinde özellikle Doğu Anadolu ve İç Anadolu''da şiddetli ayaz ve dondurucu soğuklar yaşanır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin İklimi',
    'multiple_choice',
    2,
    'Türkiye''de kış mevsiminde cephesel yağışları getiren ve ılık-yağışlı hava oluşturan dinamik alçak basınç merkezi hangisidir?',
    '{"options": ["Basra Termik Alçak Basıncı", "İzlanda Dinamik Alçak Basıncı", "Asor Dinamik Yüksek Basıncı", "Sibirya Termik Yüksek Basıncı", "Muson Alçak Basıncı"], "correctIndex": 1}'::jsonb,
    'İzlanda Dinamik Alçak Basıncı kışın etkili olduğunda Türkiye''ye Balkanlar üzerinden bol nem ve ılık-yağışlı hava kütleleri taşır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin İklimi',
    'multiple_choice',
    2,
    'Türkiye''de yıllık toplam yağış miktarının en fazla olduğu il ve yöre hangisidir?',
    '{"options": ["Muğla - Menteşe Yöresi", "Rize - Doğu Karadeniz Kıyıları", "Zonguldak Kıyıları", "Antalya Körfezi", "Hakkâri Yöresi"], "correctIndex": 1}'::jsonb,
    'Rize ve Doğu Karadeniz kıyıları, dağların kıyıya çok yakın ve yüksek olması sebebiyle yılda 2.400 mm''yi aşan rekor yağış alır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin İklimi',
    'multiple_choice',
    2,
    'Rize''de turunçgil ve kivi, Çoruh Vadisi''nde zeytin yetişmesini sağlayan yerel rüzgâr hangisidir?',
    '{"options": ["Lodos", "Poyraz", "Fön Rüzgârı", "Karayel", "Etemyen"], "correctIndex": 2}'::jsonb,
    'Dağ yamacından aşağıya doğru inen havanın sürtünmeyle her 100 metrede 1°C ısınması sonucu oluşan Fön rüzgârı mikroklima alanları yaratır.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin İklimi',
    'multiple_choice',
    2,
    'İç Anadolu Bölgesi''nde ilkbahar aylarında ısınan havanın yükselmesiyle oluşan ve halk arasında ''Kırkikindi'' olarak bilinen yağış türü hangisidir?',
    '{"options": ["Yamaç (Orografik) Yağışları", "Konveksiyonel (Yükselim) Yağışları", "Cephesel (Frontal) Yağışlar", "Muson Yağışları", "Siklonik Yağışlar"], "correctIndex": 1}'::jsonb,
    'Isınan havanın dikey yükselerek soğumasıyla meydana gelen yağışlara konveksiyonel yağış denir; İç Anadolu''da baharda sıkça görülür.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin İklimi',
    'multiple_choice',
    2,
    'Akdeniz iklim bölgesinde kızılçam ormanlarının tahrip edilmesiyle ortaya çıkan bodur, sert yapraklı çalı topluluğuna ne ad verilir?',
    '{"options": ["Bozkır (Step)", "Maki", "Garig", "Tayga", "Tundra"], "correctIndex": 1}'::jsonb,
    'Akdeniz ikliminin karakteristik bitki örtüsü olan maki; zeytin, defne, mersin, kermes meşesi gibi her mevsim yeşil kalan çalılardan oluşur.'
  ),
  (
    'Coğrafya',
    'Bitki Örtüsü ve Toprak',
    'multiple_choice',
    2,
    'Erzurum-Kars Platosu''nda dağ çayırları altında oluşan ve ''kara toprak'' olarak bilinen dünyanın en verimli zonal toprak türü hangisidir?',
    '{"options": ["Podzol", "Çernezyom (Kara Toprak)", "Laterit", "Terra Rossa (Kırmızı Akdeniz Toprağı)", "Vertisol"], "correctIndex": 1}'::jsonb,
    'Çernezyom, yüksek organik madde (humus) içeriğiyle dünyanın en verimli yerli toprağıdır; yaz yağışlarıyla yeşeren çayırların altında gelişir.'
  ),
  (
    'Coğrafya',
    'Bitki Örtüsü ve Toprak',
    'multiple_choice',
    2,
    'Akdeniz Bölgesi''nde kalker (kireçtaşı) kayaçları üzerinde demir oksit birikmesi sebebiyle kırmızı renk alan toprak türü hangisidir?',
    '{"options": ["Terra Rossa", "Kahverengi Orman Toprağı", "Torf", "Alüvyal", "Regosol"], "correctIndex": 0}'::jsonb,
    'Terra Rossa (Kırmızı Akdeniz Toprağı), kalkerlerin çözünmesiyle oluşan ve bünyesindeki demir oksitten dolayı kırmızımsı olan topraktır.'
  ),
  (
    'Coğrafya',
    'Bitki Örtüsü ve Toprak',
    'multiple_choice',
    2,
    'Trakya (Ergene Havzası) ve Muş Ovası''nda yaygın olan, killi yapısı sebebiyle kurak dönemde çatlayan, yağışla dönen ''Dönen Toprak'' (Karakepir) hangisidir?',
    '{"options": ["Vertisol", "Rendzina", "Kalsimorfik", "Solonçak", "Litosol"], "correctIndex": 0}'::jsonb,
    'Vertisol topraklar yüksek montmorillonit kili içerir; kurak mevsimde yarılır, içine dökülen toprak yağışla şişip yukarı fırlar (dönen toprak).'
  ),
  (
    'Coğrafya',
    'Bitki Örtüsü ve Toprak',
    'multiple_choice',
    2,
    'Sadece belirli bir coğrafi bölgede yetişen, dünyada başka bir yerde doğal olarak bulunmayan bitki türlerine ne ad verilir?',
    '{"options": ["Relikt (Kalıntı) Bitki", "Endemik Bitki", "Kültür Bitkisi", "Kozmopolit Bitki", "Psödomaki"], "correctIndex": 1}'::jsonb,
    'Belirli bir sahaya özgü yerel bitkilere endemik denir. Türkiye''de yaklaşık 3.500 civarında endemik bitki türü bulunur (Toroslar çok zengindir).'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Su Varlığı',
    'multiple_choice',
    2,
    'Türkiye sınırları içinde doğup yurt dışında Hazar Denizi''ne dökülen kapalı havza nehirlerimiz hangileridir?',
    '{"options": ["Dicle ve Fırat", "Aras ve Kura", "Kızılırmak ve Yeşilırmak", "Çoruh ve Kelkit", "Seyhan ve Ceyhan"], "correctIndex": 1}'::jsonb,
    'Doğu Anadolu''dan doğan Aras ve Kura nehirleri Azerbaycan''da birleşerek kapalı bir göl olan Hazar Denizi''ne dökülür.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Su Varlığı',
    'multiple_choice',
    2,
    'Türkiye''nin en uzun nehri olan ve kollarıyla birlikte tamamen Türkiye sınırları içinde akıp denize dökülen akarsu hangisidir?',
    '{"options": ["Fırat", "Kızılırmak (1.355 km)", "Sakarya", "Yeşilırmak", "Dicle"], "correctIndex": 1}'::jsonb,
    'Kızılırmak (1.355 km), kaynağı ve denize döküldüğü yer Türkiye sınırları içinde olan en uzun nehirdir (Fırat ülke sınırları dışında daha uzundur).'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Su Varlığı',
    'multiple_choice',
    2,
    'Türkiye''nin en büyük tatlı su gölü aşağıdakilerden hangisidir?',
    '{"options": ["Van Gölü", "Tuz Gölü", "Beyşehir Gölü", "Eğirdir Gölü", "İznik Gölü"], "correctIndex": 2}'::jsonb,
    'Van Gölü sodalı, Tuz Gölü tuzludur; Türkiye''nin en büyük tatlı su (içilebilir ve tarımda kullanılabilir) gölü Beyşehir Gölü''dür.'
  ),
  (
    'Coğrafya',
    'Türkiye''nin Su Varlığı',
    'multiple_choice',
    2,
    'Volkanik patlama sonucu oluşan krater veya kalderaların suyla dolmasıyla meydana gelen maar göllerine Türkiye''deki en güzel örnek hangisidir?',
    '{"options": ["Meke Maar Gölü (Nazar Boncuğu)", "Köyceğiz Gölü", "Bafa (Çamiçi) Gölü", "Çıldır Gölü", "Sapanca Gölü"], "correctIndex": 0}'::jsonb,
    'Konya Karapınar''da yer alan Meke Gölü, ''Dünyanın Nazar Boncuğu'' olarak anılan volkanik bir maar gölüdür.'
  ),
  (
    'Coğrafya',
    'Doğal Afetler ve Çevre',
    'multiple_choice',
    2,
    'Türkiye''de en fazla can ve mal kaybına neden olan doğal afet türü hangisidir?',
    '{"options": ["Heyelan", "Deprem (Sismik Afet)", "Çığ", "Orman Yangını", "Kuraklık"], "correctIndex": 1}'::jsonb,
    'Türkiye Alp-Himalaya deprem kuşağında yer aldığından tarih boyunca en yıkıcı can ve mal kaybına depremler neden olmuştur.'
  ),
  (
    'Coğrafya',
    'Doğal Afetler ve Çevre',
    'multiple_choice',
    2,
    'Türkiye''de heyelan olaylarının en fazla görüldüğü bölge ve mevsim hangisidir?',
    '{"options": ["İç Anadolu - Yaz", "Doğu Karadeniz - İlkbahar", "Ege - Sonbahar", "Akdeniz - Kış", "Güneydoğu Anadolu - Yaz"], "correctIndex": 1}'::jsonb,
    'Doğu Karadeniz''de dik yamaçlar, killi toprak ve ilkbaharda eriyen karların suya doygunluk oluşturması nedeniyle heyelanlar en çok ilkbaharda yaşanır.'
  ),
  (
    'Coğrafya',
    'Doğal Afetler ve Çevre',
    'multiple_choice',
    2,
    'Türkiye''de erozyonla mücadele etmek ve çölleşmeyi önlemek amacıyla kurulan sivil toplum kuruluşu hangisidir?',
    '{"options": ["TEMA Vakfı", "ÇEVKO", "AKUT", "Yeşilay", "Kızılay"], "correctIndex": 0}'::jsonb,
    'Hayrettin Karaca ve Nihat Gökyiğit tarafından kurulan TEMA Vakfı, toprak erozyonu ve ağaçlandırma konusunda öncüdür.'
  ),
  (
    'Coğrafya',
    'Doğal Afetler ve Çevre',
    'multiple_choice',
    2,
    'Türkiye''de orman yangını riskinin en yüksek olduğu kıyı kuşağı hangisidir?',
    '{"options": ["Karadeniz Kıyı Kuşağı", "Akdeniz ve Ege Kıyı Kuşağı", "Marmara Kıyıları", "İç Anadolu Bozkırları", "Doğu Anadolu Dağları"], "correctIndex": 1}'::jsonb,
    'Yaz kuraklığı, yüksek sıcaklık ve kızılçam ormanlarının reçineli yapısı sebebiyle Akdeniz ve Ege kıyı kuşağı yangın riskinin en yüksek olduğu alandır.'
  ),
  (
    'Coğrafya',
    'Nüfus ve Yerleşme',
    'multiple_choice',
    2,
    'Türkiye''de aritmetik nüfus yoğunluğunun en fazla olduğu coğrafi bölge hangisidir?',
    '{"options": ["İç Anadolu", "Marmara Bölgesi", "Ege Bölgesi", "Akdeniz Bölgesi", "Güneydoğu Anadolu"], "correctIndex": 1}'::jsonb,
    'Marmara Bölgesi yüzölçümünün küçük, sanayi ve göç nedeniyle nüfusunun çok kalabalık olması sebebiyle km²''ye düşen kişi sayısında birinci sıradadır.'
  ),
  (
    'Coğrafya',
    'Nüfus ve Yerleşme',
    'multiple_choice',
    2,
    'Aşağıdaki yörelerden hangisi engebeli yer şekilleri ve karstik yapı sebebiyle nüfus yoğunluğunun az olduğu alanlardandır?',
    '{"options": ["Çatalca-Kocaeli", "Teke ve Taşeli Platoları", "Çukurova", "Gediz Havzası", "Yeşilırmak Deltası"], "correctIndex": 1}'::jsonb,
    'Antalya ve Mersin arasındaki Teke ve Taşeli Platoları engebeli karstik arazi ve su tutmayan kireçtaşı sebebiyle seyrek nüfusludur.'
  ),
  (
    'Coğrafya',
    'Nüfus ve Yerleşme',
    'multiple_choice',
    2,
    'Doğu Karadeniz Bölgesi''nde kırsal yerleşmelerin ''dağınık yerleşme'' tipinde olmasının temel nedenleri nelerdir?',
    '{"options": ["Düz araziler ve kurak iklim", "Engebeli arazi yapısı ve su kaynaklarının bol olması", "Toplu köylerin devlet eliyle kurulması", "Ulaşım ağının çok gelişmiş olması", "Maden ocaklarının varlığı"], "correctIndex": 1}'::jsonb,
    'Su kaynaklarının bol olması ve engebeli arazide tarım alanlarının parçalı olması dağınık köy yerleşmelerini zorunlu kılmıştır.'
  ),
  (
    'Coğrafya',
    'Nüfus ve Yerleşme',
    'multiple_choice',
    2,
    'İç Anadolu ve Güneydoğu Anadolu''da kırsal yerleşmelerin ''toplu yerleşme'' tipinde olmasının en temel nedeni nedir?',
    '{"options": ["Yer şekillerinin düz ve su kaynaklarının kısıtlı olması", "Ormanların çok sık olması", "Sürekli sel baskınları", "Kış aylarında turizmin gelişmesi", "Deprem riskinin yüksek olması"], "correctIndex": 0}'::jsonb,
    'Suyun yetersiz olduğu kurak/yarı kurak düzlüklerde halk su kuyularının ve çeşmelerin etrafında toplanarak toplu yerleşmeler kurmuştur.'
  ),
  (
    'Coğrafya',
    'Nüfus ve Yerleşme',
    'multiple_choice',
    2,
    'TÜİK verilerine göre Türkiye''de nüfus artış hızının tarihsel olarak en düşük seviyeye indiği dönem hangi olayla ilişkilidir?',
    '{"options": ["1940-1945 II. Dünya Savaşı Seferberlik Yılları", "1960 İhtilali", "1980 Dönemi", "1999 Marmara Depremi", "2008 Ekonomik Krizi"], "correctIndex": 0}'::jsonb,
    'Erkek nüfusun silah altına alınması ve savaş tehdidi nedeniyle 1940-1945 yılları arasında nüfus artış hızı binde 10.6''ya kadar gerilemiştir.'
  ),
  (
    'Coğrafya',
    'Nüfus ve Yerleşme',
    'multiple_choice',
    2,
    'Türkiye''de geçici köy altı yerleşmelerinden olan ve Toroslar''da göçebe hayvancılık yapan Yörüklerin kurduğu yerleşme hangisidir?',
    '{"options": ["Mezra", "Divan", "Yayla / Oba", "Kom", "Mahalle"], "correctIndex": 2}'::jsonb,
    'Oba ve yaylalar, hayvancılık amacıyla yaz aylarında geçici olarak kullanılan köy altı yerleşmeleridir.'
  ),
  (
    'Coğrafya',
    'Tarım ve Hayvancılık',
    'multiple_choice',
    2,
    'Türkiye''de fındık üretiminin yaklaşık %80''ini karşılayan ve dünya ihracatında birinci sırada olduğumuz coğrafi bölge hangisidir?',
    '{"options": ["Ege Bölgesi", "Karadeniz Bölgesi", "Marmara Bölgesi", "Akdeniz Bölgesi", "İç Anadolu"], "correctIndex": 1}'::jsonb,
    'Karadeniz kıyı kuşağı (özellikle Ordu, Giresun, Trabzon) dünyada fındık üretim ve ihracatının lideridir.'
  ),
  (
    'Coğrafya',
    'Tarım ve Hayvancılık',
    'multiple_choice',
    2,
    'Güneydoğu Anadolu Projesi (GAP) ile sulamanın yaygınlaşması sonucu bölgede üretimi patlama yaparak Türkiye birincisi olan sanayi bitkisi hangisidir?',
    '{"options": ["Pamuk", "Tütün", "Çay", "Şekerpancarı", "Zeytin"], "correctIndex": 0}'::jsonb,
    'Şanlıurfa ve Harran Ovası sulamaya açıldıktan sonra pamuk üretiminde Ege ve Çukurova''yı geçerek Türkiye birincisi olmuştur.'
  ),
  (
    'Coğrafya',
    'Tarım ve Hayvancılık',
    'multiple_choice',
    2,
    'Bozkır bitki örtüsünün yaygın olduğu İç Anadolu ve Güneydoğu''da en yaygın yapılan hayvancılık türü hangisidir?',
    '{"options": ["Büyükbaş mera hayvancılığı", "Küçükbaş (Koyun) Hayvancılığı", "İpekböcekçiliği", "Kültür balıkçılığı", "Manda yetiştiriciliği"], "correctIndex": 1}'::jsonb,
    'İlkbaharda yeşerip yazın kuruyan bozkır otları küçükbaş hayvanların (özellikle koyun) otlamasına uygundur.'
  ),
  (
    'Coğrafya',
    'Tarım ve Hayvancılık',
    'multiple_choice',
    2,
    'Erzurum-Kars ve Doğu Karadeniz yaylalarında yaz yağışlarıyla yeşeren gür çayırlar hangi hayvancılık türünün gelişmesini sağlamıştır?',
    '{"options": ["Kıl keçisi yetiştiriciliği", "Büyükbaş Sığır Hayvancılığı", "Kümes hayvancılığı", "Tiftik keçisi", "İpekböcekçiliği"], "correctIndex": 1}'::jsonb,
    'Yaz boyu yeşil kalan yüksek dağ çayırları büyükbaş hayvanların beslenmesi için en uygun doğal ortamdır.'
  ),
  (
    'Coğrafya',
    'Madenler ve Enerji',
    'multiple_choice',
    2,
    'Dünya rezervlerinin yaklaşık %73''ü Türkiye''de bulunan; roket yakıtı, cam, seramik ve nükleer sanayide kullanılan stratejik maden hangisidir?',
    '{"options": ["Demir", "Bor Mineralleri", "Bakır", "Krom", "Boksit"], "correctIndex": 1}'::jsonb,
    'Balıkesir (Bigadiç), Bursa (Mustafakemalpaşa), Kütahya (Emet) ve Eskişehir''de (Kırka) bulunan Bor minerallerinde Türkiye dünya lideridir.'
  ),
  (
    'Coğrafya',
    'Madenler ve Enerji',
    'multiple_choice',
    2,
    'Türkiye''de demir-çelik fabrikalarının Karabük ve Ereğli''de kurulmasında hangi faktör belirleyici olmuştur?',
    '{"options": ["Hammaddeye yakınlık", "Taş kömürü (Enerji Kaynağına) Yakınlık", "Pazar alanına yakınlık", "İş gücü bolluğu", "İklim şartları"], "correctIndex": 1}'::jsonb,
    'Demir filizi Sivas Divriği''den getirilmesine rağmen, demiri eritecek yüksek kalorili taş kömürü yatakları Zonguldak''ta olduğu için fabrikalar buraya kurulmuştur.'
  ),
  (
    'Coğrafya',
    'Madenler ve Enerji',
    'multiple_choice',
    2,
    'Denizli Sarayköy ve Aydın Germencik''te yeraltı sıcak su buharından elektrik enerjisi üreten santraller hangi enerji türüne örnektir?',
    '{"options": ["Hidroelektrik", "Jeotermal Enerji", "Termik Enerji", "Rüzgâr Enerjisi", "Nükleer Enerji"], "correctIndex": 1}'::jsonb,
    'Fay hatları boyunca çıkan yüksek sıcaklıktaki yeraltı buharından elektrik üreten santraller Jeotermal santrallerdir.'
  ),
  (
    'Coğrafya',
    'Madenler ve Enerji',
    'multiple_choice',
    2,
    'Türkiye''nin petrol çıkarılan ilk ve en önemli petrol sahası hangi dağımızda yer alır?',
    '{"options": ["Gabar Dağı", "Raman Dağı (Batman)", "Cudi Dağı", "Madra Dağı", "Süphan Dağı"], "correctIndex": 1}'::jsonb,
    'Türkiye''de 1940 yılında ilk petrol Raman Dağı''nda (Batman) bulunmuş ve üretime başlanmıştır.'
  ),
  (
    'Coğrafya',
    'Sanayi, Ulaşım ve Ticaret',
    'multiple_choice',
    2,
    'Art bölgesi (hinterlandı) dar olduğu ve dağlar kıyıdan hemen yükseldiği için demir yolu bağlantısı bulunmayan Karadeniz limanı hangisidir?',
    '{"options": ["Samsun Limanı", "Trabzon Limanı", "Zonguldak Limanı", "İskenderun Limanı", "Mersin Limanı"], "correctIndex": 1}'::jsonb,
    'Samsun ve Zonguldak''a demir yolu ulaşırken, Trabzon Dağları sebebiyle Trabzon Limanı''na demir yolu bağlantısı yapılamamıştır.'
  ),
  (
    'Coğrafya',
    'Sanayi, Ulaşım ve Ticaret',
    'multiple_choice',
    2,
    'Türkiye''nin ihracatında en büyük paya sahip olan sanayi sektörü hangisidir?',
    '{"options": ["Otomotiv ve Yan Sanayi", "Tarım ürünleri", "Tekstil ve konfeksiyon", "Madencilik", "Gıda sanayisi"], "correctIndex": 0}'::jsonb,
    'Türkiye''nin yıllık ihracat gelirlerinde uzun yıllardır birinci sırada Otomotiv Sanayisi yer almaktadır.'
  ),
  (
    'Coğrafya',
    'Sanayi, Ulaşım ve Ticaret',
    'multiple_choice',
    2,
    'Türkiye''nin en işlek ve ihracat-ithalat hacmi en yüksek sınır kapısı hangisidir?',
    '{"options": ["Sarp (Gürcistan)", "Kapıkule (Bulgaristan)", "Habur (Irak)", "Gürbulak (İran)", "İpsala (Yunanistan)"], "correctIndex": 1}'::jsonb,
    'Edirne''de bulunan Kapıkule Sınır Kapısı, Türkiye''nin Avrupa''ya açılan en yoğun kara ve demir yolu sınır kapısıdır.'
  ),
  (
    'Coğrafya',
    'Sanayi, Ulaşım ve Ticaret',
    'multiple_choice',
    2,
    'Akdeniz ile Ege''yi birbirine bağlayan Göksu Vadisi üzerinde yer alan ve İç Anadolu''yu Akdeniz''e bağlayan önemli geçit hangisidir?',
    '{"options": ["Sertavul Geçidi", "Ziganâ Geçidi", "Kop Geçidi", "Belen Geçidi", "G规范 Geçidi"], "correctIndex": 0}'::jsonb,
    'Sertavul Geçidi İç Anadolu''yu (Konya/Karaman) Mersin ve Silifke üzerinden Akdeniz''e bağlar. Gülek ise Adana''ya bağlar.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Toplum hayatını düzenleyen kurallardan hangisinin yaptırımı (müeyyidesi) maddi ve devlet gücüne dayalıdır?',
    '{"options": ["Din kuralları", "Ahlak kuralları", "Hukuk kuralları", "Görgü kuralları", "Örf ve âdetler"], "correctIndex": 2}'::jsonb,
    'Hukuk kuralları, diğer sosyal kurallardan farklı olarak kamu gücüyle desteklenen ''maddi yaptırımlı'' kurallardır.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Normlar hiyerarşisinde (Kelsen Piramidi) en üst basamakta yer alan hukuk kuralı hangisidir?',
    '{"options": ["Kanun", "Anayasa", "Cumhurbaşkanlığı Kararnamesi", "Yönetmelik", "Genelge"], "correctIndex": 1}'::jsonb,
    'Normlar hiyerarşisinin tepesinde Anayasa yer alır; hiçbir kanun veya alt norm Anayasa''ya aykırı olamaz.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Bir ülkede belirli bir dönemde yürürlükte bulunan yazılı ve yazısız hukuk kurallarının tamamına ne ad verilir?',
    '{"options": ["Mevzu Hukuk", "Pozitif (Müspet) Hukuk", "Tarihi Hukuk", "İdeal (Tabii) Hukuk", "Kamu Hukuku"], "correctIndex": 1}'::jsonb,
    'Pozitif Hukuk hem yazılı hem yazısız (örf-âdet) kuralları kapsar. Sadece yetkili makamlarca konulan yazılı kurallara ise Mevzu Hukuk denir.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Kanunda hem örf-âdet hukukunda hem de yazılı kaynaklarda bir uyuşmazlığa ilişkin hiçbir hükmün bulunmaması durumuna ne denir?',
    '{"options": ["Kural İçi Boşluk", "Hukuk Boşluğu", "Kanun Boşluğu", "Açık Boşluk", "Örtülü Boşluk"], "correctIndex": 1}'::jsonb,
    'Ne yazılı ne de yazısız kaynakta hüküm yoksa ''Hukuk Boşluğu'' vardır. Hâkim bu durumda Medeni Kanun m. 1 gereğince ''hukuk yaratır''.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Türk Medeni Kanunu''na göre hak ehliyeti ne zaman başlar?',
    '{"options": ["Ergin (18 yaş) olunduğunda", "Sağ ve tam doğum anında", "Ayırt etme gücünü kazandığında", "Evlenildiğinde", "Nüfus kütüğüne tescil ile"], "correctIndex": 1}'::jsonb,
    'Hak ehliyeti, çocuğun sağ ve tam doğması şartıyla ana rahmine düştüğü andan itibaren başlar.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Türk Medeni Kanunu''na göre olağan erginlik (rüşt) yaşı kaçtır?',
    '{"options": ["15 yaşını doldurmak", "17 yaşını doldurmak", "18 yaşını doldurmak", "20 yaşını doldurmak", "21 yaşını doldurmak"], "correctIndex": 2}'::jsonb,
    'Türk Medeni Kanunu m. 11''e göre erginlik 18 yaşın doldurulmasıyla başlar. Evlenme ve mahkeme kararıyla (kazai rüşt) da kazanılabilir.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Ayırt etme gücüne sahip fakat 18 yaşını doldurmamış (küçük) bir birey ehliyet gruplarından hangisine dâhildir?',
    '{"options": ["Tam Ehliyetliler", "Sınırlı Ehliyetsizler", "Tam Ehliyetsizler", "Sınırlı Ehliyetliler", "Vesayet Altındakiler"], "correctIndex": 1}'::jsonb,
    'Ayırt etme gücü olan küçükler ve kısıtlılar ''Sınırlı Ehliyetsiz'' grubundadır. Kendi başlarına kefil olamaz, bağış yapamazlar.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Hukuka aykırı bir fiille başkasına kasten veya ihmalle zarar veren kişinin bu zararı giderme yükümlülüğüne ne denir?',
    '{"options": ["Cebri İcra", "Tazminat", "İptal", "Yokluk", "Hapis"], "correctIndex": 1}'::jsonb,
    'Haksız fiil veya sözleşmeye aykırılık sonucu doğan maddi veya manevi zararın giderilmesine tazminat denir.'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Hukuki işlemin kanunun emrettiği kurucu unsurlardan birine sahip olmaması durumunda karşılaşılan geçersizlik türü hangisidir?',
    '{"options": ["Nisbi Butlan", "Mutlak Butlan", "Yokluk", "Tek Taraflı Bağlamazlık", "Fesih"], "correctIndex": 2}'::jsonb,
    'Kurucu unsurlardan biri eksikse (örn. resmi nikâh memuru olmadan yapılan evlilik) işlem hukuken hiç doğmamış sayılır (Yokluk).'
  ),
  (
    'Vatandaşlık',
    'Temel Hukuk Kavramları',
    'multiple_choice',
    2,
    'Borcun ifası (ödenmesi), takas, ibra, yenileme veya kusursuz imkânsızlık gibi durumlar aşağıdakilerden hangisine yol açar?',
    '{"options": ["Borcu sona erdiren hâller", "Borçlunun temerrüdü", "Alacaklının temerrüdü", "Def''i hakkı", "Hapis hakkı"], "correctIndex": 0}'::jsonb,
    'İfa, ibra, yenileme, birleşme, takas ve kusursuz imkânsızlık borcu sona erdiren genel sebeplerdir.'
  ),
  (
    'Vatandaşlık',
    'Devlet Biçimleri ve Demokrasi',
    'multiple_choice',
    2,
    'Devlet otoritesinin tek bir merkezde toplandığı, yasama, yürütme ve yargı organlarının tek olduğu devlet biçimi hangisidir?',
    '{"options": ["Federal Devlet", "Üniter Devlet", "Konfederasyon", "Bölgeli Devlet", "Monarşi"], "correctIndex": 1}'::jsonb,
    'Üniter devlette tek anayasa, tek yasama meclisi ve tek yargı sistemi bulunur (Türkiye Cumhuriyeti üniter bir devlettir).'
  ),
  (
    'Vatandaşlık',
    'Devlet Biçimleri ve Demokrasi',
    'multiple_choice',
    2,
    'Halkın temsilcilerini seçtiği, fakat aynı zamanda referandum, halk vetosu ve halk girişimi gibi araçlarla yönetime doğrudan katılabildiği demokrasi tipi hangisidir?',
    '{"options": ["Doğrudan Demokrasi", "Temsili Demokrasi", "Yarı Doğrudan Demokrasi", "Otokrasi", "Teokrasi"], "correctIndex": 2}'::jsonb,
    'Temsili meclisle halk oylaması (referandum) araçlarının bir arada uygulandığı sisteme Yarı Doğrudan Demokrasi denir.'
  ),
  (
    'Vatandaşlık',
    'Devlet Biçimleri ve Demokrasi',
    'multiple_choice',
    2,
    'Yasama ile yürütme erklerinin kesin ve sert bir biçimde birbirinden ayrıldığı hükümet sistemi hangisidir?',
    '{"options": ["Parlamenter Sistem", "Başkanlık Sistemi", "Meclis Hükümeti Sistemi", "Yarı Başkanlık Sistemi", "Mutlakiyet"], "correctIndex": 1}'::jsonb,
    'Başkanlık sisteminde yürütme halk tarafından doğrudan seçilir ve yasama ile yürütme arasında sert bir kuvvetler ayrılığı vardır.'
  ),
  (
    'Vatandaşlık',
    'Devlet Biçimleri ve Demokrasi',
    'multiple_choice',
    2,
    'Türkiye''de 2017 Anayasa değişikliği ile kabul edilen ve 2018''de yürürlüğe giren hükümet sistemi hangisidir?',
    '{"options": ["Parlamenter Sistem", "Cumhurbaşkanlığı Hükümet Sistemi", "Meclis Hükümeti Sistemi", "Yarı Başkanlık", "Kollektif Hükümet"], "correctIndex": 1}'::jsonb,
    '2017 halk oylamasıyla Başbakanlık kaldırılmış ve Cumhurbaşkanlığı Hükümet Sistemi''ne geçilmiştir.'
  ),
  (
    'Vatandaşlık',
    'Türk Anayasa Tarihi',
    'multiple_choice',
    2,
    'Türk tarihinin ilk yazılı anayasası aşağıdakilerden hangisidir?',
    '{"options": ["1876 Kanun-i Esasi", "1921 Teşkilat-ı Esasiye", "1924 Anayasası", "1961 Anayasası", "Sened-i İttifak"], "correctIndex": 0}'::jsonb,
    '23 Aralık 1876''da ilan edilen Kanun-i Esasi, Türk ve İslam tarihinin ilk anayasasıdır.'
  ),
  (
    'Vatandaşlık',
    'Türk Anayasa Tarihi',
    'multiple_choice',
    2,
    'Türkiye Cumhuriyeti''nin en kısa ve yumuşak tek anayasası hangisidir?',
    '{"options": ["1876 Anayasası", "1921 Anayasası (Teşkilat-ı Esasiye)", "1924 Anayasası", "1961 Anayasası", "1982 Anayasası"], "correctIndex": 1}'::jsonb,
    '1921 Anayasası (23 madde + 1 ek madde) olağanüstü savaş koşullarında hazırlanmış; değiştirilmesi kolay, çerçeve ve yumuşak tek anayasamızdır.'
  ),
  (
    'Vatandaşlık',
    'Türk Anayasa Tarihi',
    'multiple_choice',
    2,
    'Devletin şeklinin ''Cumhuriyet'' olduğu hükmü anayasa metnine ilk kez ne zaman girmiştir?',
    '{"options": ["23 Nisan 1920", "29 Ekim 1923 (1921 Anayasa Değişikliği)", "20 Nisan 1924", "5 Şubat 1937", "1961 Anayasası"], "correctIndex": 1}'::jsonb,
    '29 Ekim 1923''te yapılan 1921 Anayasası değişikliği ile ''Türkiye Devleti''nin hükümet şekli Cumhuriyettir'' hükmü eklenmiştir.'
  ),
  (
    'Vatandaşlık',
    'Türk Anayasa Tarihi',
    'multiple_choice',
    2,
    'Anayasa Mahkemesi ve Milli Güvenlik Kurulu ilk kez hangi anayasa ile Türk hukuk sistemine girmiştir?',
    '{"options": ["1921 Anayasası", "1924 Anayasası", "1961 Anayasası", "1982 Anayasası", "1876 Kanun-i Esasi"], "correctIndex": 2}'::jsonb,
    '1961 Anayasası ile kanunların anayasaya uygunluğunu denetlemek üzere Anayasa Mahkemesi ve MGK kurulmuştur.'
  ),
  (
    'Vatandaşlık',
    '1982 Anayasası İlkeleri',
    'multiple_choice',
    2,
    '1982 Anayasası''nın değiştirilemez, değiştirilmesi teklif dahi edilemez hükümleri hangi maddelerde yer alır?',
    '{"options": ["İlk 3 madde ve 4. madde", "Sadece 1. madde", "İlk 10 madde", "İlk 5 madde", "Hiçbir madde değiştirilemez değildir"], "correctIndex": 0}'::jsonb,
    'Anayasa''nın 1. (Cumhuriyet), 2. (Cumhuriyetin nitelikleri) ve 3. (Bütünlük, dil, bayrak, marş, başkent) maddeleri 4. maddeyle koruma altına alınmıştır.'
  ),
  (
    'Vatandaşlık',
    '1982 Anayasası İlkeleri',
    'multiple_choice',
    2,
    '1982 Anayasası m. 2''ye göre Türkiye Cumhuriyeti''nin temel nitelikleri arasında aşağıdakilerden hangisi yer almaz?',
    '{"options": ["Demokratik devlet", "Laik devlet", "Sosyal devlet", "Federal devlet", "Hukuk devleti"], "correctIndex": 3}'::jsonb,
    'Türkiye Cumhuriyeti üniter bir devlettir; federal devlet niteliği Anayasa''da kesinlikle yer almaz.'
  ),
  (
    'Vatandaşlık',
    '1982 Anayasası İlkeleri',
    'multiple_choice',
    2,
    'Devletin, vatandaşlarına asgari bir yaşam standardı sunması, gelir adaleti sağlaması ve güçsüzleri koruması hangi devlet ilkesinin gereğidir?',
    '{"options": ["Hukuk Devleti", "Sosyal Devlet", "Laik Devlet", "Demokratik Devlet", "Jandarma Devlet"], "correctIndex": 1}'::jsonb,
    'Sosyal devlet; fırsat eşitliği, sosyal güvenlik hakkı ve kamusal refahı koruyan devlettir.'
  ),
  (
    'Vatandaşlık',
    '1982 Anayasası İlkeleri',
    'multiple_choice',
    2,
    'Laiklik ilkesi Türkiye Cumhuriyeti anayasalarına ilk kez hangi yıl yapılan değişiklikle girmiştir?',
    '{"options": ["1923", "1928", "1937", "1961", "1982"], "correctIndex": 2}'::jsonb,
    'Atatürk ilkeleri 5 Şubat 1937''de yapılan anayasa değişikliği ile 1924 Anayasası''na girmiştir.'
  ),
  (
    'Vatandaşlık',
    'Temel Hak ve Ödevler',
    'multiple_choice',
    2,
    'Jellinek''in hak sınıflandırmasına göre ''kişiyi devlete karşı koruyan ve devletin müdahale edemeyeceği'' haklar (Negatif Statü Hakları) hangisidir?',
    '{"options": ["Kişi Hak ve Ödevleri", "Sosyal ve Ekonomik Haklar", "Siyasi Haklar", "Kollektif Haklar", "Katılma Hakları"], "correctIndex": 0}'::jsonb,
    'Kişi dokunulmazlığı, konut dokunulmazlığı, haberleşme hürriyeti gibi haklar Negatif Statü (Koruyucu / Kişi) haklarıdır.'
  ),
  (
    'Vatandaşlık',
    'Temel Hak ve Ödevler',
    'multiple_choice',
    2,
    'Aşağıdakilerden hangisi Anayasa''da ''Sosyal ve Ekonomik Haklar'' (İsteme Hakları) arasında yer alır?',
    '{"options": ["Seçme ve seçilme hakkı", "Dilekçe hakkı", "Eğitim ve öğretim hakkı", "Mülkiyet hakkı", "Kişi hürriyeti ve güvenliği"], "correctIndex": 2}'::jsonb,
    'Eğitim ve öğrenim hakkı, sağlık hakkı, sendika kurma hakkı Sosyal ve Ekonomik (Pozitif statü) haklardandır.'
  ),
  (
    'Vatandaşlık',
    'Temel Hak ve Ödevler',
    'multiple_choice',
    2,
    'Aşağıdakilerden hangisi vatandaşın devlete katılmasını sağlayan ''Siyasi Haklar'' (Aktif Statü Hakları) arasındadır?',
    '{"options": ["Yaşama hakkı", "Kamu hizmetine girme hakkı", "Çalışma ve sözleşme hürriyeti", "Konut dokunulmazlığı", "Din ve vicdan hürriyeti"], "correctIndex": 1}'::jsonb,
    'Vatandaşlık hakkı, seçme-seçilme, siyasi parti kurma ve kamu hizmetine girme (memurluk) siyasi haklardandır.'
  ),
  (
    'Vatandaşlık',
    'Temel Hak ve Ödevler',
    'multiple_choice',
    2,
    'Savaş, seferberlik veya olağanüstü hâllerde dahi dokunulamayan haklara ''Sert Çekirdek Haklar'' denir. Aşağıdakilerden hangisi bu haklardan biri değildir?',
    '{"options": ["Yaşama hakkı ve vücut bütünlüğü", "Din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamama", "Suç ve cezaların geçmişe yürütülememesi", "Suçluluğu mahkeme kararıyla sabit oluncaya kadar masum sayılma", "Mülkiyet ve seyahat hakkı"], "correctIndex": 4}'::jsonb,
    'Mülkiyet ve seyahat hakkı sert çekirdek hak değildir; OHAL veya milli güvenlik gerekçesiyle kanunla sınırlandırılabilir.'
  ),
  (
    'Vatandaşlık',
    'Yasama Organı (TBMM)',
    'multiple_choice',
    2,
    '1982 Anayasası''na göre Türkiye Büyük Millet Meclisi (TBMM) genel oyla seçilen kaç milletvekilinden oluşur?',
    '{"options": ["450", "550", "600", "650", "500"], "correctIndex": 2}'::jsonb,
    '2017 Anayasa değişikliği ile TBMM üye tamsayısı 550''den 600''e çıkarılmıştır.'
  ),
  (
    'Vatandaşlık',
    'Yasama Organı (TBMM)',
    'multiple_choice',
    2,
    'Milletvekili seçilme yaşı 2017 anayasa değişikliği ile kaç yaşa indirilmiştir?',
    '{"options": ["18 yaş", "21 yaş", "25 yaş", "30 yaş", "17 yaş"], "correctIndex": 0}'::jsonb,
    '2017 Anayasa değişikliği ile milletvekili seçilme yaşı 25''ten 18 yaşını doldurmuş olmaya indirilmiştir.'
  ),
  (
    'Vatandaşlık',
    'Yasama Organı (TBMM)',
    'multiple_choice',
    2,
    'TBMM ve Cumhurbaşkanlığı seçimleri kural olarak kaç yılda bir aynı günde yapılır?',
    '{"options": ["3 yılda bir", "4 yılda bir", "5 yılda bir", "6 yılda bir", "7 yılda bir"], "correctIndex": 2}'::jsonb,
    'Anayasa m. 77 gereğince TBMM ve Cumhurbaşkanlığı seçimleri 5 yılda bir aynı gün yapılır.'
  ),
  (
    'Vatandaşlık',
    'Yasama Organı (TBMM)',
    'multiple_choice',
    2,
    'TBMM''nin bir yasama yılı içinde yapabileceği tatil süresi en fazla ne kadardır?',
    '{"options": ["1 ay", "2 ay", "3 ay", "4 ay", "15 gün"], "correctIndex": 2}'::jsonb,
    'TBMM her yıl 1 Ekim''de kendiliğinden toplanır. Bir yasama yılında en çok 3 ay tatil yapabilir.'
  ),
  (
    'Vatandaşlık',
    'Yasama Organı (TBMM)',
    'multiple_choice',
    2,
    'Kanun teklif etmeye 2017 Anayasa değişikliğinden sonra yalnızca kimler yetkilidir?',
    '{"options": ["Cumhurbaşkanı", "Bakanlar", "Milletvekilleri", "Yüksek Yargı Organları", "Halk (imza toplayarak)"], "correctIndex": 2}'::jsonb,
    'Bütçe kanunu hariç kanun teklif etme yetkisi münhasıran Milletvekillerine aittir. Bütçe teklifini Cumhurbaşkanı sunar.'
  ),
  (
    'Vatandaşlık',
    'Yasama Organı (TBMM)',
    'multiple_choice',
    2,
    'Milletvekili dokunulmazlığının kaldırılması veya vekilliğin düşmesine karşı ilgili milletvekili kaç gün içinde Anayasa Mahkemesi''ne başvurabilir?',
    '{"options": ["7 gün", "10 gün", "15 gün", "30 gün", "60 gün"], "correctIndex": 0}'::jsonb,
    'Kararın alındığı tarihten itibaren 7 gün içinde AYM''ye iptal başvurusu yapılabilir. Mahkeme 15 gün içinde kesin kararını verir.'
  ),
  (
    'Vatandaşlık',
    'Yürütme Organı',
    'multiple_choice',
    2,
    'Cumhurbaşkanı seçilebilmek için hangi şartları taşımak zorunludur?',
    '{"options": ["40 yaşını doldurmuş, yükseköğrenim mezunu ve milletvekili seçilme yeterliliğine sahip Türk vatandaşı", "35 yaşını doldurmuş ve lise mezunu olmak", "Hâkim veya savcı olmak", "Eski milletvekili olmak", "50 yaşını doldurmuş olmak"], "correctIndex": 0}'::jsonb,
    'Anayasa m. 101 gereği Cumhurbaşkanı 40 yaşını doldurmuş, yükseköğrenim mezunu, milletvekili seçilme yeterliliğine sahip vatandaşlar arasından seçilir.'
  ),
  (
    'Vatandaşlık',
    'Yürütme Organı',
    'multiple_choice',
    2,
    'Bir kimse en fazla kaç defa Cumhurbaşkanı seçilebilir?',
    '{"options": ["1 kez", "En fazla 2 kez", "Sınırsız", "3 kez", "4 kez"], "correctIndex": 1}'::jsonb,
    'Cumhurbaşkanının görev süresi 5 yıldır. Bir kimse en fazla iki defa Cumhurbaşkanı seçilebilir (Meclisin erken seçim kararı istisnası hariç).'
  ),
  (
    'Vatandaşlık',
    'Yürütme Organı',
    'multiple_choice',
    2,
    'Cumhurbaşkanlığı makamının herhangi bir nedenle boşalması hâlinde yenisi seçilene kadar Cumhurbaşkanlığına kim vekâlet eder?',
    '{"options": ["TBMM Başkanı", "En yaşlı Cumhurbaşkanı Yardımcısı", "Adalet Bakanı", "Genelkurmay Başkanı", "İçişleri Bakanı"], "correctIndex": 1}'::jsonb,
    '2017 değişikliğiyle vekillik TBMM Başkanı''ndan alınmış ve Cumhurbaşkanı Yardımcısına verilmiştir.'
  ),
  (
    'Vatandaşlık',
    'Yürütme Organı',
    'multiple_choice',
    2,
    'Olağanüstü Hâl (OHAL) ilan etme yetkisi kime aittir ve en fazla kaç ay süreyle ilan edilebilir?',
    '{"options": ["TBMM - 1 yıl", "Cumhurbaşkanı - En fazla 6 ay", "İçişleri Bakanı - 3 ay", "Milli Güvenlik Kurulu - 1 yıl", "Genelkurmay - 6 ay"], "correctIndex": 1}'::jsonb,
    'Cumhurbaşkanı, tabii afet, salgın veya ağır kamu düzeni bozulmasında süresi 6 ayı geçmemek üzere OHAL ilan edebilir (TBMM onayına sunulur).'
  ),
  (
    'Vatandaşlık',
    'Yürütme Organı',
    'multiple_choice',
    2,
    'Aşağıdakilerden hangisi Cumhurbaşkanlığı Kararnamesi (CBK) ile düzenlenemez?',
    '{"options": ["Bakanlıkların kurulması ve kaldırılması", "Üst düzey kamu yöneticilerinin atanması usulü", "Anayasa''da yer alan Kişi Hakları ve Siyasi Haklar", "Devlet Denetleme Kurulu''nun işleyişi", "Milli Güvenlik Kurulu Genel Sekreterliği teşkilatı"], "correctIndex": 2}'::jsonb,
    'Anayasa m. 104: Temel haklar, kişi hakları ve siyasi haklar CBK ile düzenlenemez. Sadece Sosyal ve Ekonomik haklar düzenlenebilir.'
  ),
  (
    'Vatandaşlık',
    'Yürütme Organı',
    'multiple_choice',
    2,
    'Milli Güvenlik Kurulu''na (MGK) Cumhurbaşkanı katılamadığında kim başkanlık eder?',
    '{"options": ["TBMM Başkanı", "Cumhurbaşkanı Yardımcısı", "Milli Savunma Bakanı", "Genelkurmay Başkanı", "Dışişleri Bakanı"], "correctIndex": 1}'::jsonb,
    'MGK''nın başkanı Cumhurbaşkanıdır. Katılamadığı toplantılara Cumhurbaşkanı Yardımcısı başkanlık eder.'
  ),
  (
    'Vatandaşlık',
    'Yargı Organı',
    'multiple_choice',
    2,
    'Anayasa Mahkemesi kaç üyeden oluşur ve üyelerin görev süresi kaç yıldır?',
    '{"options": ["15 üye - 12 yıl", "17 üye - 9 yıl", "11 üye - 10 yıl", "12 üye - 6 yıl", "21 üye - Ömür boyu"], "correctIndex": 0}'::jsonb,
    'Anayasa Mahkemesi 15 üyeden oluşur (3''ü TBMM, 12''si Cumhurbaşkanı tarafından seçilir). Görev süreleri 12 yıldır, yeniden seçilemezler.'
  ),
  (
    'Vatandaşlık',
    'Yargı Organı',
    'multiple_choice',
    2,
    'Adliye mahkemelerince verilen ve kanunun başka bir yargı merciine bırakmadığı karar ve hükümlerin son inceleme mercii (temyiz) hangisidir?',
    '{"options": ["Danıştay", "Yargıtay", "Uyuşmazlık Mahkemesi", "Sayıştay", "Bölge Adliye Mahkemesi"], "correctIndex": 1}'::jsonb,
    'Yargıtay, adli yargı kolunun en yüksek temyiz mahkemesidir.'
  ),
  (
    'Vatandaşlık',
    'Yargı Organı',
    'multiple_choice',
    2,
    'İdari mahkemelerce verilen kararların son inceleme mercii olan ve aynı zamanda kamu hizmeti imtiyaz şartlaşmalarında görüş bildiren yüksek mahkeme hangisidir?',
    '{"options": ["Yargıtay", "Danıştay", "Anayasa Mahkemesi", "Sayıştay", "Hakimler ve Savcılar Kurulu"], "correctIndex": 1}'::jsonb,
    'Danıştay, idari yargının en yüksek temyiz organıdır; idari davaları sonuçlandırır.'
  ),
  (
    'Vatandaşlık',
    'Yargı Organı',
    'multiple_choice',
    2,
    'Adli ve idari yargı mercileri arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözmeye yetkili mahkeme hangisidir?',
    '{"options": ["Yargıtay", "Danıştay", "Uyuşmazlık Mahkemesi", "Anayasa Mahkemesi", "Yüksek Seçim Kurulu"], "correctIndex": 2}'::jsonb,
    'Uyuşmazlık Mahkemesi, adli ve idari yargı kolları arasındaki uyuşmazlıkları kesin karara bağlar.'
  ),
  (
    'Vatandaşlık',
    'Yargı Organı',
    'multiple_choice',
    2,
    'Hâkimler ve Savcılar Kurulu''nun (HSK) başkanı kimdir?',
    '{"options": ["Yargıtay Başkanı", "Adalet Bakanı", "Anayasa Mahkemesi Başkanı", "Danıştay Başkanı", "Cumhurbaşkanı"], "correctIndex": 1}'::jsonb,
    'HSK 13 üyeden oluşur. Kurulun başkanı Adalet Bakanı''dır. Adalet Bakanlığı Müsteşarı (Bakan Yardımcısı) da tabii üyedir.'
  ),
  (
    'Vatandaşlık',
    'Yargı Organı',
    'multiple_choice',
    2,
    'TBMM adına kamu idarelerinin gelir ve giderlerini denetleyen ve kesin hükme bağlayan anayasal denetim kuruluşu hangisidir?',
    '{"options": ["Devlet Denetleme Kurulu", "Sayıştay", "Kamu Denetçiliği Kurumu", "Maliye Müfettişliği", "BDDK"], "correctIndex": 1}'::jsonb,
    'Sayıştay, TBMM adına bütçe denetimi yapan ve hesap yargılaması yürüten bağımsız anayasal organdır.'
  ),
  (
    'Vatandaşlık',
    'İdare Hukuku',
    'multiple_choice',
    2,
    'Devlet tüzel kişiliğini temsil eden ve kamu hizmetlerinin başkentten tek elden yürütülmesini sağlayan idare ilkesi hangisidir?',
    '{"options": ["Yetki Genişliği", "Merkezden Yönetim", "Yerinden Yönetim", "Özerklik", "Hizmet Yerinden Yönetim"], "correctIndex": 1}'::jsonb,
    'Merkezden yönetim (başkent teşkilatı ve taşra teşkilatı), devlet tüzel kişiliği altında kamu hizmetlerinin merkezce yürütülmesidir.'
  ),
  (
    'Vatandaşlık',
    'İdare Hukuku',
    'multiple_choice',
    2,
    'Merkeze danışmadan, merkezin adına doğrudan karar alabilme yetkisi olan ''Yetki Genişliği'' Anayasa''ya göre yalnızca kime tanınmıştır?',
    '{"options": ["Kaymakam", "Vali", "Belediye Başkanı", "Muhtar", "Bölge Müdürü"], "correctIndex": 1}'::jsonb,
    'Yetki genişliği (m. 126), taşra teşkilatında yalnızca il genel yönetiminin başı olan Vali''ye tanınmış anayasal bir istisnadır.'
  ),
  (
    'Vatandaşlık',
    'İdare Hukuku',
    'multiple_choice',
    2,
    'Merkezi idarenin (Devlet tüzel kişiliğinin), yerel yönetimler (Belediye, Köy vb.) üzerindeki denetim yetkisine ne ad verilir?',
    '{"options": ["Hiyerarşik Denetim", "İdari Vesayet", "Yargısal Denetim", "Yasama Denetimi", "Siyasi Denetim"], "correctIndex": 1}'::jsonb,
    'Farklı kamu tüzel kişileri arasındaki denetime İdari Vesayet denir (örn: İçişleri Bakanlığı''nın belediyeyi denetlemesi).'
  ),
  (
    'Vatandaşlık',
    'İdare Hukuku',
    'multiple_choice',
    2,
    'Aşağıdakilerden hangisi bir ''Mahalli İdare'' (Yerel Yönetim) birimi değildir?',
    '{"options": ["İl Özel İdaresi", "Belediye", "Büyükşehir Belediyesi", "Köy", "İlçe Kaymakamlığı"], "correctIndex": 4}'::jsonb,
    'İlçe Kaymakamlığı merkezi yönetimin taşra teşkilatıdır; ayrı bir kamu tüzel kişiliği ve yerel yönetim organı değildir.'
  ),
  (
    'Vatandaşlık',
    'İdare Hukuku',
    'multiple_choice',
    2,
    '657 sayılı Devlet Memurları Kanunu''na göre memurların haftalık standart çalışma süresi kural olarak kaç saattir?',
    '{"options": ["35 saat", "40 saat", "45 saat", "48 saat", "50 saat"], "correctIndex": 1}'::jsonb,
    '657 sayılı Kanun m. 99 gereğince memurların haftalık çalışma süresi kural olarak Cumartesi ve Pazar günleri tatil olmak üzere 40 saattir.'
  ),
  (
    'Vatandaşlık',
    'İdare Hukuku',
    'multiple_choice',
    2,
    'Devlet Memurları Kanunu''nda yer alan disiplin cezaları hafiften ağıra doğru hangi şıkta doğru sıralanmıştır?',
    '{"options": ["Uyarma - Kınama - Aylıktan Kesme - Kademe İlerlemesinin Durdurulması - Memurluktan Çıkarma", "Kınama - Uyarma - Aylıktan Kesme - İhraç - Hapis", "Uyarma - Aylıktan Kesme - Kınama - Kademe Durdurma - İhraç", "Kınama - Görevden Uzaklaştırma - Uyarma - İhraç", "Uyarma - Kınama - Tenzil-i Rütbe - İhraç"], "correctIndex": 0}'::jsonb,
    '657 sayılı DMK m. 125''te düzenlenen 5 disiplin cezası sırasıyla: Uyarma, Kınama, Aylıktan Kesme, Kademe İlerlemesinin Durdurulması ve Devlet Memurluğundan Çıkarmadır.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Zirveler',
    'multiple_choice',
    2,
    '2024 yılı G20 Liderler Zirvesi hangi ülkede ve şehirde düzenlenmiştir?',
    '{"options": ["Hindistan - Yeni Delhi", "Brezilya - Rio de Janeiro", "Güney Afrika - Johannesburg", "İtalya - Roma", "Japonya - Osaka"], "correctIndex": 1}'::jsonb,
    '2024 G20 Dönem Başkanlığını yürüten Brezilya, zirveye Rio de Janeiro şehrinde ev sahipliği yapmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Zirveler',
    'multiple_choice',
    2,
    '2024 yılında düzenlenen 33. Yaz Olimpiyat Oyunları''na hangi şehir ev sahipliği yapmıştır?',
    '{"options": ["Tokyo", "Paris", "Londra", "Los Angeles", "Madrid"], "correctIndex": 1}'::jsonb,
    '2024 Yaz Olimpiyatları, Fransa''nın başkenti Paris''te Sen Nehri üzerindeki görkemli açılışla düzenlenmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    'Birleşmiş Milletler (BM) Genel Sekreterliği görevini yürüten Portekizli diplomat kimdir?',
    '{"options": ["Ban Ki-moon", "Antonio Guterres", "Kofi Annan", "Boutros Ghali", "Javier Perez"], "correctIndex": 1}'::jsonb,
    'Portekiz eski başbakanı António Guterres, 2017 yılından bu yana BM Genel Sekreteri olarak görev yapmaktadır.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    'Kuzey Atlantik Antlaşması Örgütü''ne (NATO) 2023 yılında 31. ve 2024 yılında 32. üye olarak katılan ülkeler sırasıyla hangileridir?',
    '{"options": ["İsveç ve Ukrayna", "Finlandiya ve İsveç", "Makedonya ve Karadağ", "Gürcistan ve Bosna", "Avusturya ve İsviçre"], "correctIndex": 1}'::jsonb,
    'Finlandiya Nisan 2023''te NATO''nun 31. üyesi, İsveç ise Mart 2024''te 32. üyesi olmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    'Türk Devletleri Teşkilatı''nın (TDT) genel sekreterlik merkezi hangi şehrimizde bulunmaktadır?',
    '{"options": ["Ankara", "İstanbul", "Bursa", "Semerkant", "Bakü"], "correctIndex": 1}'::jsonb,
    'Türk Devletleri Teşkilatı''nın (eski Türk Keneşi) Genel Sekreterlik binası İstanbul''da yer almaktadır.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    'Avrupa Birliği''nin yürütme organı olan Avrupa Komisyonu''nun merkezi hangi başkenttedir?',
    '{"options": ["Strazburg", "Brüksel", "Lüksemburg", "Cenevre", "Frankfurt"], "correctIndex": 1}'::jsonb,
    'Avrupa Birliği Komisyonu ve Konseyi''nin ana yönetim merkezi Belçika''nın başkenti Brüksel''dedir.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    '2024 yılında genişleme kararı alarak Mısır, Etiyopya, İran ve BAE''yi resmen üye yapan ekonomik iş birliği bloğu hangisidir?',
    '{"options": ["G7", "BRICS", "OECD", "EFTA", "NAFTA"], "correctIndex": 1}'::jsonb,
    'BRICS (Brezilya, Rusya, Hindistan, Çin, Güney Afrika), 1 Ocak 2024 itibarıyla yeni üyelerin katılımıyla genişlemiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Zirveler',
    'multiple_choice',
    2,
    '2024 yılı Birleşmiş Milletler İklim Değişikliği Konferansı (COP29) hangi ülkede düzenlenmiştir?',
    '{"options": ["Birleşik Arap Emirlikleri", "Azerbaycan (Bakü)", "Mısır", "İskoçya", "Almanya"], "correctIndex": 1}'::jsonb,
    'COP29 İklim Zirvesi, Kasım 2024''te kardeş ülke Azerbaycan''ın başkenti Bakü''de toplanmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    'Merkezi Cenevre''de bulunan ve uluslararası halk sağlığı koordinasyonunu sağlayan BM uzmanlık kuruluşu hangisidir?',
    '{"options": ["UNESCO", "UNICEF", "Dünya Sağlık Örgütü (WHO)", "FAO", "ILO"], "correctIndex": 2}'::jsonb,
    'Dünya Sağlık Örgütü (WHO - World Health Organization), küresel salgın ve halk sağlığını yöneten BM kuruluşudur.'
  ),
  (
    'Güncel Bilgiler',
    'Uluslararası Kuruluşlar',
    'multiple_choice',
    2,
    'Petrol İhraç Eden Ülkeler Örgütü''nün (OPEC) genel merkezi hangi şehirde yer alır?',
    '{"options": ["Riyad", "Kuveyt", "Viyana (Avusturya)", "Cenevre", "Doha"], "correctIndex": 2}'::jsonb,
    'OPEC''in genel merkezi kurucu üye olmamasına rağmen Avusturya''nın başkenti Viyana''da bulunmaktadır.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'UNESCO Dünya Mirası Listesi''ne 2023 yılında 20. varlığımız olarak kaydedilen antik kent hangisidir?',
    '{"options": ["Göbeklitepe", "Gordion Antik Kenti (Ankara)", "Afrodisias", "Çatalhöyük", "Ani Harabeleri"], "correctIndex": 1}'::jsonb,
    'Ankara''nın Polatlı ilçesinde yer alan Frigya Krallığı''nın başkenti Gordion Antik Kenti, 2023''te UNESCO Dünya Mirası olmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'UNESCO Dünya Mirası Listesi''ne 2023 yılında 21. varlığımız olarak seri tescil edilen tarihî eser grubu hangisidir?',
    '{"options": ["Anadolu''nun Orta Çağ Ahşap Hipostil Camileri", "Selçuklu Kervansarayları", "Osmanlı Saat Kuleleri", "Likya Kaya Mezarları", "Karadeniz Ahşap Konakları"], "correctIndex": 0}'::jsonb,
    'Konya Eşrefoğlu, Afyon Ulu Cami, Sivrihisar Ulu Cami, Ankara Arslanhane ve Kastamonu Mahmut Bey camileri Dünya Mirası listesine girmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'Dünyanın bilinen en eski kült (inanç) merkezi kabul edilen ve ''Tarihin Sıfır Noktası'' olarak anılan Şanlıurfa''daki ören yeri hangisidir?',
    '{"options": ["Çayönü", "Hacılar", "Göbeklitepe", "Karain", "Alacahöyük"], "correctIndex": 2}'::jsonb,
    'MÖ 10.000''lere tarihlenen Göbeklitepe, UNESCO Dünya Mirası Listesi''nde olup insanlık tarihinin bilinen en eski tapınak kompleksidir.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'UNESCO Somut Olmayan Kültürel Miras Listesi''ne Türkiye adına kaydedilen geleneksel açık hava gösterisi ve ata sporumuz hangisidir?',
    '{"options": ["Kırkpınar Yağlı Güreş Festivali", "Cirit Oyunu", "Okçuluk", "Aba Güreşi", "Kuşdili"], "correctIndex": 0}'::jsonb,
    'Edirne Kırkpınar Yağlı Güreşleri Festivali, UNESCO Somut Olmayan Kültürel Miras Temsili Listesi''nde tescillidir.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'Türkiye''de hem doğal hem kültürel (Karma Miras) olarak UNESCO Dünya Mirası Listesi''nde yer alan iki varlığımız hangileridir?',
    '{"options": ["Kapadokya ve Pamukkale (Hierapolis)", "Nemrut Dağı ve Truva", "Divriği Ulu Cami ve Safranbolu", "Efes ve Bergama", "Göreme ve Hattuşa"], "correctIndex": 0}'::jsonb,
    'Göreme Milli Parkı / Kapadokya ile Pamukkale-Hierapolis hem doğal traverten/peri bacası hem antik kalıntılarıyla karma mirastır.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'UNESCO Yaratıcı Şehirler Ağı''na Gastronomi (Mutfak Kültürü) alanında Türkiye''den dâhil olan ilk şehir hangisidir?',
    '{"options": ["Gaziantep", "Hatay", "Afyonkarahisar", "Adana", "Kayseri"], "correctIndex": 0}'::jsonb,
    'Gaziantep 2015 yılında UNESCO Gastronomi kenti unvanını alan ilk şehrimiz olmuştur (sonrasında Hatay ve Afyonkarahisar da katılmıştır).'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'Bitlis''in Ahlat ilçesinde bulunan ve Türk-İslam dünyasının en büyük tarihi mezarlığı olan anıtsal mezar alanı hangisidir?',
    '{"options": ["Şah-ı Zinde", "Ahlat Selçuklu Meydan Mezarlığı", "Divriği Külliyesi", "Seyit Battal Gazi Türbesi", "Mevlana Haziresi"], "correctIndex": 1}'::jsonb,
    'Ahlat Selçuklu Meydan Mezarlığı, üzerindeki kitabe ve kabartmalarla Orhun Abideleri''nin Anadolu''daki devamı niteliğindedir.'
  ),
  (
    'Güncel Bilgiler',
    'UNESCO ve Kültür',
    'multiple_choice',
    2,
    'Görkemli heykelleri ve Kommagene Krallığı''na ait anıt mezarlarıyla ünlü, Adıyaman ilinde yer alan UNESCO varlığı dağ hangisidir?',
    '{"options": ["Ağrı Dağı", "Nemrut Dağı", "Süphan Dağı", "Cilo Dağı", "Erciyes Dağı"], "correctIndex": 1}'::jsonb,
    'Kral I. Antiochos tarafından yaptırılan devasa tanrı ve kral heykelleri Adıyaman Nemrut Dağı''nda yer alır.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'Türkiye''nin ilk astronotu olarak Axiom-3 misyonuyla Uluslararası Uzay İstasyonu''na (ISS) giden ve 13 bilimsel deney gerçekleştiren isim kimdir?',
    '{"options": ["Tuva Cihangir Atasever", "Alper Gezeravcı", "Halil Kayıkçı", "Gökmen Uzay", "Caner Canpolat"], "correctIndex": 1}'::jsonb,
    'Alper Gezeravcı, Ocak 2024''te uzaya çıkan ilk Türk astronot olarak tarihe geçmiş ve ''İstikbal göklerdedir'' mesajını iletmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'Türkiye''nin yerli imkânlarla ürettiği ilk milli haberleşme uydusu olan ve 2024 yılında uzaya fırlatılan uydu hangisidir?',
    '{"options": ["TÜRKSAT 5A", "TÜRKSAT 5B", "TÜRKSAT 6A", "GÖKTÜRK-1", "RASAT"], "correctIndex": 2}'::jsonb,
    'TÜRKSAT 6A, ASELSAN, TUSAŞ ve TÜBİTAK iş birliğiyle üretilen Türkiye''nin ilk yerli ve milli haberleşme uydusudur.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'TUSAŞ tarafından geliştirilen, Türkiye''nin ilk yerli ve milli 5. nesil hayalet savaş uçağının adı nedir?',
    '{"options": ["HÜRJET", "KAAN", "ANKA-3", "KIZILELMA", "AKINCI"], "correctIndex": 1}'::jsonb,
    'Milli Muharip Uçak KAAN, ilk uçuşunu 21 Şubat 2024 tarihinde başarıyla gerçekleştirmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'Baykar tarafından geliştirilen, TCG Anadolu amfibi hücum gemisine iniş-kalkış yapabilen Türkiye''nin ilk insansız savaş uçağı hangisidir?',
    '{"options": ["Bayraktar TB2", "Bayraktar KIZILELMA", "HÜRKUŞ", "GÖKBEY", "AKSUNGUR"], "correctIndex": 1}'::jsonb,
    'Bayraktar KIZILELMA MİUS (Muharip İnsansız Uçak Sistemi), jet motorlu ilk insansız savaş uçağımızdır.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'Antarktika''da bilimsel araştırmalar yürütmek amacıyla kurulan Türkiye Geçici Bilim Kampı hangi adada yer almaktadır?',
    '{"options": ["Horseshoe Adası", "Kral George Adası", "Livingston Adası", "Deception Adası", "Ross Adası"], "correctIndex": 0}'::jsonb,
    'TÜBİTAK MAM Kutup Araştırmaları Enstitüsü koordinasyonundaki Ulusal Antarktika Bilim Seferleri Horseshoe Adası''nda üslenmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'DNA onarımı mekanizmaları alanındaki çalışmalarıyla 2015 yılında Nobel Kimya Ödülü''nü kazanan Türk bilim insanı kimdir?',
    '{"options": ["Oktay Sinanoğlu", "Aziz Sancar", "Cahit Arf", "Gazi Yaşargil", "Celal Şengör"], "correctIndex": 1}'::jsonb,
    'Prof. Dr. Aziz Sancar, hücrelerin hasar gören DNA''ları nasıl onardığını haritalandıran çalışmasıyla Nobel Kimya Ödülü''nü kazanmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'Dünyanın en büyük havacılık, uzay ve teknoloji festivali olan TEKNOFEST''in yönetim kurulu başkanı kimdir?',
    '{"options": ["İsmail Demir", "Selçuk Bayraktar", "Haluk Görgün", "Temel Kotil", "Mehmet Fatih Kacır"], "correctIndex": 1}'::jsonb,
    'T3 Vakfı Mütevelli Heyeti Başkanı Selçuk Bayraktar, TEKNOFEST Yönetim Kurulu Başkanlığı görevini yürütmektedir.'
  ),
  (
    'Güncel Bilgiler',
    'Bilim ve Teknoloji',
    'multiple_choice',
    2,
    'Yapay zekâ alanında devrim yaratan ChatGPT modelini geliştiren ABD merkezli teknoloji şirketi hangisidir?',
    '{"options": ["Google DeepMind", "OpenAI", "Microsoft", "Meta", "NVIDIA"], "correctIndex": 1}'::jsonb,
    'ChatGPT ve GPT dil modelleri, Sam Altman liderliğindeki OpenAI araştırma şirketi tarafından geliştirilmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    '2006 yılında Nobel Edebiyat Ödülü''nü kazanan ilk ve tek Türk yazar kimdir?',
    '{"options": ["Yaşar Kemal", "Orhan Pamuk", "Ahmet Hamdi Tanpınar", "Oğuz Atay", "Necip Fazıl Kısakürek"], "correctIndex": 1}'::jsonb,
    'Orhan Pamuk, ''Benim Adım Kırmızı'', ''Kara Kitap'' ve ''Kar'' romanlarının yazarı olup 2006 Nobel Edebiyat Ödülü sahibidir.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    'İstiklal Marşı''mızın şairi Mehmet Akif Ersoy, şiirlerini topladığı hangi eserine İstiklal Marşı''nı ''O milletimindir'' diyerek dâhil etmemiştir?',
    '{"options": ["Safahat", "Golgeler", "Asım", "Feryat", "Hatıralar"], "correctIndex": 0}'::jsonb,
    'Mehmet Akif, İstiklal Marşı''nı Türk milletine ve kahraman ordusuna hediye ettiği için ünlü eseri Safahat''a almamıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    'Türk edebiyatında ''Dede Korkut Kitabı''nın üçüncü nüshası 2019 yılında hangi ülkede bulunmuştur?',
    '{"options": ["Almanya (Dresden)", "İtalya (Vatikan)", "Kazakistan (Türkistan Nüshası)", "Rusya", "Azerbaycan"], "correctIndex": 2}'::jsonb,
    'Dresden ve Vatikan nüshalarından sonra Dede Korkut''un üçüncü nüshası (13. boy ile birlikte) Kazakistan''da bulunmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    'Cumhuriyet Dönemi Türk resim sanatının simge tablolarından ''Kaplumbağa Terbiyecisi'' adlı ünlü eser hangi ressamımıza aittir?',
    '{"options": ["İbrahim Çallı", "Osman Hamdi Bey", "Şeker Ahmet Paşa", "Hikmet Onat", "Abidin Dino"], "correctIndex": 1}'::jsonb,
    'Osman Hamdi Bey, aynı zamanda İstanbul Arkeoloji Müzesi ve Sanayi-i Nefise Mektebi''nin (MSGSÜ) kurucusudur.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    '''İnce Memed'', ''Yer Demir Gök Bakır'' ve ''Teneke'' romanlarıyla Çukurova insanının dramını dünyaya duyuran edebiyat çınarımız kimdir?',
    '{"options": ["Kemal Tahir", "Orhan Kemal", "Yaşar Kemal", "Fakir Baykurt", "Tarık Buğra"], "correctIndex": 2}'::jsonb,
    'Yaşar Kemal, edebiyatımızın en büyük ustalarından biri olup Fransa Légion d''Honneur nişanı sahibidir.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    '2014 yılında ''Kış Uykusu'' filmiyle Cannes Film Festivali''nde en büyük ödül olan ''Altın Palmiye''yi (Palme d''Or) kazanan Türk yönetmen kimdir?',
    '{"options": ["Semih Kaplanoğlu", "Fatih Akın", "Nuri Bilge Ceylan", "Zeki Demirkubuz", "Yılmaz Erdoğan"], "correctIndex": 2}'::jsonb,
    'Yılmaz Güney''in ''Yol'' filminden sonra Altın Palmiye kazanan ikinci yönetmenimiz Nuri Bilge Ceylan olmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    'UNESCO tarafından 2021 yılı hangi büyük Türk mutasavvıf ve düşünürünün vefatının 700. yıl dönümü anısına anma yılı ilan edilmiştir?',
    '{"options": ["Hacı Bektaş Veli", "Yunus Emre", "Mevlana Celaleddin Rumi", "Ahi Evran", "Ahmet Yesevi"], "correctIndex": 1}'::jsonb,
    '2021 yılı UNESCO ve Cumhurbaşkanlığı genelgesiyle ''Yunus Emre ve Türkçe Yılı'' olarak kutlanmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Kültür ve Sanat',
    'multiple_choice',
    2,
    'Dünyanın en prestijli mimarlık ödülü kabul edilen ve ''Mimarlığın Nobeli'' olarak anılan ödül hangisidir?',
    '{"options": ["Pritzker Mimarlık Ödülü", "Ağa Han Mimarlık Ödülü", "RIBA Altın Madalyası", "Mies van der Rohe", "Wolf Ödülü"], "correctIndex": 0}'::jsonb,
    'Pritzker Mimarlık Ödülü, Hyatt Vakfı tarafından her yıl yaşayan bir mimara verilen dünyanın en saygın mimarlık ödülüdür.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    '2024 Paris Olimpiyatları''nda atıcılık karma 10m havalı tabanca kategorisinde ekipman kullanmadan rahat duruşuyla dünya çapında viral olan milli atıcımız kimdir?',
    '{"options": ["Şevval İlayda Tarhan", "Yusuf Dikeç", "İsmail Keleş", "Ömer Akgün", "Buğra Ünal"], "correctIndex": 1}'::jsonb,
    'Yusuf Dikeç ve Şevval İlayda Tarhan gümüş madalya kazanmış; Dikeç''in eli cebindeki sakin atış pozu küresel ikon hâline gelmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    '2020 Tokyo Olimpiyatları şampiyonu ve 2024 Paris Olimpiyatları bronz madalya sahibi milli okçumuz kimdir?',
    '{"options": ["Mete Gazoz", "Ulaş Berkim Tümer", "Muhammed Abdullah Yıldırmış", "Samet Ak", "Ali Rıza Küçük"], "correctIndex": 0}'::jsonb,
    'Mete Gazoz, Türk spor tarihinin ilk olimpik okçuluk şampiyonudur; 2024 Paris''te ise Erkek Klasik Yay Takımı ile bronz madalya almıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    '2023 yılında hem CEV Avrupa Şampiyonu hem de FIVB Milletler Ligi (VNL) Şampiyonu olan kadın milli voleybol takımımızın lakabı nedir?',
    '{"options": ["Potanın Perileri", "Filenin Sultanları", "Altın Kızlar", "Rüzgârın Kızları", "Akdeniz Fırtınası"], "correctIndex": 1}'::jsonb,
    'A Milli Kadın Voleybol Takımımız (Filenin Sultanları), Melissa Vargas''ın MVP seçildiği 2023 yılında Avrupa ve Milletler Ligi şampiyonu olmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    'Olimpiyat, Dünya ve Avrupa şampiyonu olan ve güreşte ''Rıza Kayaalp'' ile birlikte Türk spor tarihinin en çok madalya kazanan efsanevi güreşçisi kimdir?',
    '{"options": ["Taha Akgül", "Hamza Yerlikaya", "Karamanoğlu Mehmet", "Yaşar Doğu", "Mahmut Atalay"], "correctIndex": 0}'::jsonb,
    'Serbest stil güreşçimiz Taha Akgül, 1 Olimpiyat, 3 Dünya ve 11 Avrupa şampiyonluğu ile 2024 Paris sonrasında jübile yapmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    'Real Madrid kulübünde forma giyen, UEFA Şampiyonlar Ligi kupasını kazanan ilk Türk milli futbolcu kimdir?',
    '{"options": ["Hakan Çalhanoğlu", "Arda Güler", "Salih Özcan", "Kerem Aktürkoğlu", "Kenan Yıldız"], "correctIndex": 1}'::jsonb,
    'Arda Güler, 2024 yılında Real Madrid ile UEFA Şampiyonlar Ligi şampiyonluğu madalyası alan ilk A Milli futbolcumuz olmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    'Dünya dalış rekortmeni olan ve Cumhuriyet''in 100. yılında tek nefeste 106 metreye dalarak dünya rekoru kıran milli serbest dalış sporcumuz kimdir?',
    '{"options": ["Şahika Ercümen", "Derya Can", "Fatma Uruk", "Yasemin Dalkılıç", "Birgül Erken"], "correctIndex": 0}'::jsonb,
    'Şahika Ercümen, paletsiz değişken ağırlık kategorisinde 106 metreye dalarak dünya rekoru kırmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    '2024 Avrupa Futbol Şampiyonası''na (EURO 2024) hangi ülke ev sahipliği yapmıştır?',
    '{"options": ["Fransa", "Almanya", "İngiltere", "İtalya", "İspanya"], "correctIndex": 1}'::jsonb,
    'EURO 2024 turnuvası Almanya''nın ev sahipliğinde düzenlenmiş; İspanya şampiyon olmuş, Türkiye ise çeyrek finale yükselmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Spor Başarıları',
    'multiple_choice',
    2,
    'Kariyerinde 3 kez üst üste Olimpiyat Şampiyonu olan ve ''Cep Herkülü'' lakabıyla anılan dünya rekortmeni efsane haltercimiz kimdir?',
    '{"options": ["Halil Mutlu", "Naim Süleymanoğlu", "Taner Sağır", "Sedat Artuç", "Hafız Süleymanoğlu"], "correctIndex": 1}'::jsonb,
    'Naim Süleymanoğlu, 1988 Seul, 1992 Barselona ve 1996 Atlanta olimpiyatlarında rekorlar kırarak 3 altın madalya kazanan spor efsanesidir.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Cumhurbaşkanlığı genelgesi ile 2024 yılı Türkiye''de hangi tema yılı olarak ilan edilmiştir?',
    '{"options": ["Ahi Evran Yılı", "Emekliler Yılı", "Gençlik Yılı", "Dijitalleşme Yılı", "Kültür Yılı"], "correctIndex": 1}'::jsonb,
    'Cumhurbaşkanlığı tarafından 2024 yılı sosyal refah ve kıdemi vurgulamak üzere ''Emekliler Yılı'' olarak ilan edilmiştir.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Türkiye Cumhuriyet Merkez Bankası''nın (TCMB) 2024 yılı itibarıyla görev yapan başkanı kimdir?',
    '{"options": ["Hafize Gaye Erkan", "Fatih Karahan", "Şahap Kavcıoğlu", "Naci Ağbal", "Murat Uysal"], "correctIndex": 1}'::jsonb,
    'Dr. Fatih Karahan, Şubat 2024 tarihinde Türkiye Cumhuriyet Merkez Bankası Başkanlığı görevine atanmıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Türkiye''nin 29 Ekim 2023 tarihinde kutladığı cumhuriyetimizin büyük yıl dönümü kaçıncı yıldır?',
    '{"options": ["90. Yıl", "100. Yıl (Asırlık Cumhuriyet)", "105. Yıl", "75. Yıl", "125. Yıl"], "correctIndex": 1}'::jsonb,
    'Türkiye Cumhuriyeti, 29 Ekim 2023 tarihinde görkemli törenlerle 100. kuruluş yıl dönümünü kutlamıştır.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Avrupa İnsan Hakları Mahkemesi''nin (AİHM) merkezi hangi şehirde yer almaktadır?',
    '{"options": ["Lahey", "Strazburg (Fransa)", "Brüksel", "Cenevre", "Lüksemburg"], "correctIndex": 1}'::jsonb,
    'Avrupa Konseyi''ne bağlı olan AİHM, Fransa''nın Strazburg şehrinde faaliyet göstermektedir.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Uluslararası Adalet Divanı''nın (Lahey Adalet Divanı) merkezi hangi ülkededir?',
    '{"options": ["İsviçre", "Hollanda (Lahey)", "Belçika", "Avusturya", "İsveç"], "correctIndex": 1}'::jsonb,
    'Birleşmiş Milletler''in başlıca yargı organı olan Uluslararası Adalet Divanı Hollanda''nın Lahey (Den Haag) kentindedir.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    '2026 Kış Olimpiyat Oyunları''na hangi ülke ve şehirler ortaklaşa ev sahipliği yapacaktır?',
    '{"options": ["İtalya (Milano - Cortina)", "Fransa (Nice)", "İsveç (Stockholm)", "İsviçre (Zürih)", "Kanada (Vancouver)"], "correctIndex": 0}'::jsonb,
    '2026 XXV. Kış Olimpiyat Oyunları, İtalya''nın Milano ve Cortina d''Ampezzo kentlerinde düzenlenecektir.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Türkiye''nin ilk yerli otomobil fabrikası olan Togg Teknoloji Kampüsü hangi ilimizin hangi ilçesinde kurulmuştur?',
    '{"options": ["Kocaeli - Gölcük", "Bursa - Gemlik", "Sakarya - Arifiye", "Eskişehir - İnönü", "İzmir - Torbalı"], "correctIndex": 1}'::jsonb,
    'Togg üretim kampüsü Bursa''nın Gemlik ilçesinde denize sıfır lojistik avantajlı konumda kurulmuştur.'
  ),
  (
    'Güncel Bilgiler',
    'Türkiye ve Dünya Gündemi',
    'multiple_choice',
    2,
    'Karadeniz''de Fatih Sondaj Gemisi tarafından keşfedilen ve Türkiye tarihindeki en büyük doğalgaz keşfi olan gaz sahası hangisidir?',
    '{"options": ["Tuna-1 / Sakarya Gaz Sahası", "Çaycuma-1", "Amasra-1", "Silivri Sahası", "Akçakoca Sahası"], "correctIndex": 0}'::jsonb,
    'Sakarya Gaz Sahası (Tuna-1 kuyusu), 710 milyar metreküplük rezerviyle Karadeniz''deki en büyük derin deniz doğalgaz keşfimizdir.'
  );
