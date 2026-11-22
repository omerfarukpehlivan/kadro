-- =============================================================================
-- 📖 KADRO — KONU ANLATIMI ALTYAPISI VE ÖRNEK BÖLÜMLER (`TASK-168`)
-- Dosya: docs/supabase_migrations/10_topic_lessons.sql
-- Amaç:
--   1. `public.topic_lesson_units` tablosunda ders/konu anlatımı bölümlerini
--      (`blocks` JSONB şeması ile) herkesin okuyabileceği (`is_published = true`)
--      ve yalnızca yönetici/SQL ile yazılabilir RLS korumasıyla saklamak.
--   2. `public.user_topic_lesson_progress` tablosunda kullanıcının bölüm tamamlama
--      ve son açma ilerlemesini RLS korumasıyla saklamak.
--   3. `Tarih · İslamiyet Öncesi Türk Tarihi` konusu için her blok türünden
--      (`heading`, `paragraph`, `bullets`, `table`, `timeline`, `callout`,
--      `key_points`, `check_questions`) en az birer örnek içeren 2 yayınlanmış
--      örnek bölüm eklemek.
-- Not: Tamamen idempotenttir (tekrar çalıştırılabilir).
-- =============================================================================

begin;

-- 1. public.topic_lesson_units (Konu anlatımı bölümleri - herkese açık okuma)
create table if not exists public.topic_lesson_units (
  id text primary key
    constraint chk_topic_lesson_units_id_nonempty check (char_length(trim(id)) > 0),
  lesson text not null
    constraint chk_topic_lesson_units_lesson_nonempty check (char_length(trim(lesson)) > 0),
  topic text not null
    constraint chk_topic_lesson_units_topic_nonempty check (char_length(trim(topic)) > 0),
  unit_order int not null
    constraint chk_topic_lesson_units_order_positive check (unit_order >= 1),
  title text not null
    constraint chk_topic_lesson_units_title_nonempty check (char_length(trim(title)) > 0),
  summary text null,
  estimated_minutes int not null default 5
    constraint chk_topic_lesson_units_minutes_positive check (estimated_minutes >= 1),
  blocks jsonb not null default '[]'::jsonb
    constraint chk_topic_lesson_units_blocks_array check (jsonb_typeof(blocks) = 'array'),
  exam_scopes text[] not null default '{b_grubu_gk}'::text[],
  content_version int not null default 1,
  is_published boolean not null default false,
  updated_at timestamptz not null default timezone('utc'::text, now()),
  constraint uq_topic_lesson_units_lesson_topic_order unique (lesson, topic, unit_order)
);

create index if not exists idx_topic_lesson_units_lesson_topic
  on public.topic_lesson_units (lesson, topic, unit_order);

create index if not exists idx_topic_lesson_units_exam_scopes_gin
  on public.topic_lesson_units using gin (exam_scopes);

alter table public.topic_lesson_units enable row level security;

drop policy if exists "Yayınlanmış konu anlatımlarını herkes okuyabilir" on public.topic_lesson_units;
create policy "Yayınlanmış konu anlatımlarını herkes okuyabilir"
  on public.topic_lesson_units
  for select
  to anon, authenticated
  using (is_published = true);

revoke insert, update, delete on public.topic_lesson_units from anon, authenticated;

-- 2. public.user_topic_lesson_progress (Kullanıcı konu anlatımı ilerlemesi)
create table if not exists public.user_topic_lesson_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  unit_id text not null references public.topic_lesson_units(id) on delete cascade,
  exam_scope text not null default 'lisans_gygk'
    constraint chk_user_topic_lesson_progress_scope check (char_length(trim(exam_scope)) > 0),
  completed_at timestamptz null,
  last_opened_at timestamptz not null default timezone('utc'::text, now()),
  primary key (user_id, unit_id)
);

create index if not exists idx_user_topic_lesson_progress_user_scope
  on public.user_topic_lesson_progress (user_id, exam_scope);

alter table public.user_topic_lesson_progress enable row level security;

drop policy if exists "Kullanıcılar kendi konu anlatımı ilerlemesini yönetebilir" on public.user_topic_lesson_progress;
create policy "Kullanıcılar kendi konu anlatımı ilerlemesini yönetebilir"
  on public.user_topic_lesson_progress
  for all
  to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()));

-- 3. Örnek Yayınlanmış Bölümler (Tarih · İslamiyet Öncesi Türk Tarihi - 2 Bölüm)
insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'tarih.islamiyet_oncesi_turk_tarihi.01',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  1,
  'Bölüm 1: Orta Asya Kültür Merkezleri ve İlk Türk Devletleri',
  'Orta Asya kültür merkezlerini, Türk adının anlamlarını ve Asya Hun ile Göktürk devletlerinin temel siyasi özelliklerini inceler.',
  6,
  '[
    {
      "type": "paragraph",
      "text": "Türklerin ana yurdu olan **Orta Asya**, doğuda Kingan Dağları, batıda Hazar Denizi, kuzeyde Sibirya ovaları ve güneyde Hindikuş ile Karanlık Dağlar arasında uzanan geniş bozkır coğrafyasıdır. Sert karasal iklim nedeniyle bölge insanı **konargöçer** yaşam tarzını ve atlı bozkır kültürünü geliştirmiştir."
    },
    {
      "type": "heading",
      "text": "Orta Asya Kültür Merkezleri"
    },
    {
      "type": "table",
      "headers": ["Kültür Merkezi", "Bölge", "Ayırt Edici Özellik"],
      "rows": [
        ["Anav", "Aşkabat yakınları", "Orta Asya''nın bilinen en eski kültür merkezidir."],
        ["Afanesyova", "Altay-Sayan", "Türklere ait kabul edilen en eski kültür merkezidir."],
        ["Andronova", "Yenisey-Ural", "Coğrafi yayılım alanı en geniş olan ve tunç-altın eşyaların işlendiği kültürdür."],
        ["Karasuk", "Orta Sibirya", "Demir madeninin ilk kez işlendiği ve dört tekerlekli arabaların kullanıldığı kültürdür."],
        ["Tagar", "Abakan bölgesi", "Orta Asya kültürlerinin en genç ve en gelişmiş halkasıdır."]
      ]
    },
    {
      "type": "callout",
      "kind": "mnemonic",
      "text": "**AAA-KT** kodlamasıyla kültür merkezlerini eskiden yeniye sıralayabilirsin: **A**nav (en eski Orta Asya) -> **A**fanesyova (en eski Türk) -> **A**ndronova -> **K**arasuk (demir) -> **T**agar (en gelişmiş)."
    },
    {
      "type": "callout",
      "kind": "trap",
      "text": "ÖSYM **Orta Asya''nın en eski kültürü** ile **Türklerin en eski kültürü** ifadelerini birbirinin yerine çeldirici olarak kullanır. Orta Asya''nın en eskisi **Anav**, Türklere ait en eski kültür ise **Afanesyova**''dır."
    },
    {
      "type": "heading",
      "text": "Asya Hun ve Göktürk Siyasi Kronolojisi"
    },
    {
      "type": "timeline",
      "items": [
        { "label": "MÖ 220", "text": "Teoman liderliğinde tarihte bilinen ilk teşkilatlı Türk devleti olan **Asya Hun Devleti** kuruldu." },
        { "label": "MÖ 209", "text": "**Mete Han** tahta çıktı; onlu askerî sistemi kurdu ve 26 boyu tek bayrak altında topladı." },
        { "label": "375", "text": "Balamir önderliğindeki Hunların batıya yürüyüşüyle **Kavimler Göçü** başladı." },
        { "label": "552", "text": "**Bumin Kağan** Ötüken merkezli I. Göktürk Devleti''ni kurarak Türk adını ilk kez resmî devlet adı yaptı." },
        { "label": "744", "text": "Kutluk Bilge Kül Kağan önderliğinde yerleşik yaşama geçen **Uygur Devleti** kuruldu." }
      ]
    },
    {
      "type": "bullets",
      "items": [
        "**Türk** adı Çin kaynaklarında *miğfer*, Kaşgarlı Mahmut''ta *olgunluk çağı*, Ziya Gökalp''te *töre ve nizam sahibi* anlamında kullanılmıştır.",
        "Mete Han''ın Çin''i mağlup etmesine rağmen Çin topraklarına yerleşmemesi, **millî benliği ve kültürel kimliği koruma** amacına dayanır.",
        "II. Göktürk (Kutluk) Devleti, **İlteriş** unvanlı Kutluk Kağan ve vezir **Tonyukuk** tarafından bağımsızlık mücadelesiyle kurulmuştur."
      ]
    },
    {
      "type": "key_points",
      "items": [
        "Orta Asya''nın en eski kültürü Anav, Türklerin en eski kültürü Afanesyova''dır.",
        "Demir ilk kez Karasuk kültüründe işlenmiş, en gelişmiş kültür Tagar olmuştur.",
        "Onlu sistemi kuran ve vatan sevgisini devlet politikası haline getiren hükümdar Mete Han''dır.",
        "Türk adını resmî devlet adı olarak ilk kez Göktürkler, yerleşik yaşamı ise ilk kez Uygurlar benimsemiştir."
      ]
    },
    {
      "type": "check_questions",
      "question_ids": []
    }
  ]'::jsonb,
  '{b_grubu_gk}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do nothing;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'tarih.islamiyet_oncesi_turk_tarihi.02',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  2,
  'Bölüm 2: İlk Türk Devletlerinde Devlet Yönetimi, Töre ve Kültür',
  'Kut anlayışını, ikili teşkilatı, Kurultay yapısını, töre hukukunu ve Orhun Yazıtları başta olmak üzere yazılı edebiyat mirasını açıklar.',
  6,
  '[
    {
      "type": "paragraph",
      "text": "İlk Türk devletlerinde egemenliğin kaynağı **kut** anlayışına dayanır. Gök Tanrı tarafından hükümdar ailesine verildiğine inanılan bu siyasi yetki kan yoluyla tüm erkek hanedan üyelerine geçtiği için ülke **hanedanın ortak malı** sayılmıştır."
    },
    {
      "type": "callout",
      "kind": "info",
      "text": "Kut anlayışı hükümdara mutlak dokunulmazlık vermez; hükümdarın yetkileri **Türk töresi** ve **Kurultay (Toy)** tarafından sınırlandırılmıştır. Hükümdar halka karşı adil olmak, halkı doyurup giydirmek (sosyal devlet) zorundadır."
    },
    {
      "type": "heading",
      "text": "Devlet Teşkilatı Görevlileri ve Kavramlar"
    },
    {
      "type": "table",
      "headers": ["Kavram / Unvan", "Görevi ve Anlamı"],
      "rows": [
        ["Ayuki", "Hükümet (Bakanlar Kurulu)"],
        ["Ayguçı (Üge)", "Başvezir / Hükümet Başkanı"],
        ["Buyruk", "Bakan / Hükümet Üyesi"],
        ["Tigin ve Şad", "Hükümdar oğlu (Tigin) ve boy/bölge yönetimine atanan hanedan üyesi (Şad)"],
        ["İnal / Ataman", "Tiginlerin eğitiminden sorumlu hoca"],
        ["Tudun ve Tutuk", "Vergi memuru (Tudun) ve askerî vali (Tutuk)"]
      ]
    },
    {
      "type": "callout",
      "kind": "example",
      "text": "Örnek soru kurgusu: *İlk Türk devletlerinde ülke yönetimini kolaylaştırmak amacıyla doğu-batı şeklinde uygulanan yönetim modeli aşağıdakilerden hangisidir?* -> Doğru cevap **İkili Teşkilat** olup doğu kanadı kutsal merkez kabul edildiği için asıl kağan burada oturur, batı kanadını ise hanedandan **Yabgu** yönetirdi."
    },
    {
      "type": "callout",
      "kind": "trap",
      "text": "İslamiyet öncesi Türk devletlerindeki **Tigin / İnal (Ataman)** ikilisi ile Türk-İslam devletlerindeki **Melik / Atabey** ve Osmanlı''daki **Şehzade / Lala** kavramlarını dönemlerine göre eşleştir. ÖSYM bir dönemin kavramını diğer dönemdeymiş gibi vererek kronoloji tuzağı kurar."
    },
    {
      "type": "heading",
      "text": "Töre Hukuku ve Yazılı Kaynaklar"
    },
    {
      "type": "bullets",
      "items": [
        "Törenin değişmez dört temel ilkesi **Könilik** (adalet), **Uzluk** (iyilik/faydalılık), **Tüzlük** (eşitlik) ve **Kişilik** (insanlık/evrensellik) olarak sıralanır.",
        "Türk tarihinin ve edebiyatının ilk yazılı belgeleri II. Göktürk dönemine ait **Orhun Yazıtları**''dır (Tonyukuk, Kül Tigin ve Bilge Kağan adına dikilmiştir).",
        "Orhun Yazıtları''nı bilim dünyasına tanıtan İsveçli subay **Strahlenberg**, yazıtları 1893''te çözen Danimarkalı dilbilimci ise **Wilhelm Thomsen**''dir."
      ]
    },
    {
      "type": "key_points",
      "items": [
        "Kut anlayışı nedeniyle düzenli veraset sistemi oluşmamış, sık sık taht kavgaları yaşanmıştır.",
        "İkili teşkilatta doğu kanadı üstündür; batıdaki Yabgu iç işlerinde serbest, dış işlerinde doğudaki Kağan''a bağlıdır (federatif yapı).",
        "Törenin değişmez hükümleri Könilik (adalet), Tüzlük (eşitlik), Uzluk (iyilik) ve Kişilik (insanlık) ilkeleridir.",
        "Orhun Yazıtları Tonyukuk, Kül Tigin ve Bilge Kağan adına dikilmiş; Wilhelm Thomsen tarafından okunmuştur."
      ]
    },
    {
      "type": "check_questions",
      "question_ids": []
    }
  ]'::jsonb,
  '{b_grubu_gk}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do nothing;

commit;
