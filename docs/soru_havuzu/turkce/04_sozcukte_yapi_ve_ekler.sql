-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Sözcükte Yapı ve Ekler (10 soru) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140 pilot)
-- Not: Dosya yeniden çalıştırılırsa aynı sorular çoğalır; önce silmeden tekrar çalıştırma.
-- ==========================================================================

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  exam_scopes,
  education_level
) values
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisinde yapım eki yoktur?',
  '{"options":["evlerimiz","kitaplık","bilgili","sulak","çalışkan"],"correctIndex":0}'::jsonb,
  '"Evlerimiz" sözcüğü kök olan "ev"e çoğul (-ler) ve iyelik (-imiz) çekim eklerinin gelmesiyle oluşmuştur; yapım eki yoktur. Diğerlerinde -lık, -li, -ak, -kan yapım ekleri vardır.',
  'Sözcüğün uzun olması, aday için çok sayıda yapım eki varmış izlenimi verir. Oysa "evlerimiz"de tüm ekler çekim ekidir ve kök sözcüğün anlam veya türünü değiştirmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi birleşik sözcüktür?',
  '{"options":["yaşlılık","kitapçı","okuyucu","gözlük","hanımeli"],"correctIndex":4}'::jsonb,
  '"Hanımeli" iki ayrı sözcüğün (hanım + eli) birleşerek yeni bir anlam kazanmasıyla oluşmuştur. Diğerleri yapım ekiyle türemiştir.',
  'Uzun görünen "yaşlılık" ve "okuyucu" gibi sözcükler birleşik sanılabilir. Birleşik sözcükte iki bağımsız sözcük birleşir; türemişte ise bir köke yapım eki gelir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi fiilden türetilmiş bir addır?',
  '{"options":["kapıcı","gülüş","ağaçlık","yoksul","gözlük"],"correctIndex":1}'::jsonb,
  '"Gülüş", "gül-" fiil köküne -üş eki getirilerek türetilmiştir. Diğerleri addan türemiştir (kapı, ağaç, yok, göz).',
  '"Yoksul" ve "kapıcı" gibi sözcükler de ek aldığı için aday hepsini fiilden türemiş sanabilir. Kökün fiil mi ad mı olduğuna bakmak gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisi, diğerlerinden farklı olarak fiilden türemiştir?',
  '{"options":["kitapçı","sütlü","gözlük","çalışkan","tuzluk"],"correctIndex":3}'::jsonb,
  '"Çalışkan", "çalış-" fiil köküne -kan eki getirilerek türetilmiştir. Diğer sözcüklerin kökü addır: kitap, süt, göz, tuz.',
  'Hepsinin sonunda yapım eki bulunduğu için ayrım zorlaşır. Burada belirleyici olan, kökün hangi türde olduğudur: tek fiil kökü "çalış-"tır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  '"Gözlüklerimizden" sözcüğüyle ilgili aşağıdakilerden hangisi doğrudur?',
  '{"options":["İki yapım, iki çekim eki almıştır.","Yalnızca çekim eki almıştır.","Bir yapım, üç çekim eki almıştır.","Kökü \"gözlük\"tür.","Üç yapım, bir çekim eki almıştır."],"correctIndex":2}'::jsonb,
  'Sözcük göz + -lük (yapım) + -ler (çoğul) + -imiz (iyelik) + -den (ayrılma) biçiminde ayrılır. Kök "göz"dür; bir yapım, üç çekim eki vardır.',
  '"Gözlük" bugün tek bir sözcük gibi algılandığı için aday onu kök sanabilir. Oysa "göz" köküne -lük yapım ekinin gelmesiyle oluşmuş türemiş bir sözcüktür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki sözcük çiftlerinden hangisinde iki sözcük de birleşik yapılıdır?',
  '{"options":["kuşburnu - karayolu","bilgisayar - çiçekçi","ağaçlık - gözlük","evcil - kitaplık","okuyucu - güçlü"],"correctIndex":0}'::jsonb,
  '"Kuşburnu" (kuş + burnu) ve "karayolu" (kara + yolu) iki sözcüğün birleşmesiyle oluşmuştur. Diğer çiftlerde en az bir türemiş sözcük vardır.',
  '"Bilgisayar" birleşik olduğu için bu çift doğru sanılabilir; ancak çiftin ikinci üyesi "çiçekçi" türemiştir. Çiftin her iki üyesinin de birleşik olması gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi pekiştirmedir?',
  '{"options":["yavaş yavaş","göz göz","eski püskü","ev bark","tertemiz"],"correctIndex":4}'::jsonb,
  'Pekiştirme, sözcüğün ilk hecesinin ünsüzle birlikte sözcüğe eklenmesiyle (ter + temiz) anlamı kuvvetlendiren yapıdır. Diğerleri ikilemedir.',
  'Hepsi iki parçadan oluştuğu için ikileme ile pekiştirme karıştırılır. Pekiştirmede ilk parça anlamsız bir hece kalıbıdır ve sözcüğün anlamını güçlendirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde yapı bakımından basit (ek almamış) bir sıfat kullanılmıştır?',
  '{"options":["Çalışkan öğrenciler başardı.","Yeşil çimenlerde oturduk.","Güçlü bir rüzgâr çıktı.","Sevimli çocuk gülümsedi.","Gözlüklü adam kapıyı çaldı."],"correctIndex":1}'::jsonb,
  '"Yeşil" basit (kök) bir sözcüktür. Diğer sözcükler yapım ekiyle türemiştir: çalış-kan, güç-lü, sev-im-li, göz-lük-lü.',
  'Hepsinin sıfat olması, yapı bakımından da aynı sanılmasına yol açar. Soru yapıyı sorar; ek almamış tek sözcük "yeşil"dir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki fiillerden hangisi yapı bakımından basittir?',
  '{"options":["sevinmek","yazdırmak","düşünmek","uyumak","bilgilenmek"],"correctIndex":3}'::jsonb,
  '"Uyu-" fiil kökü ek almamıştır, basittir. Diğerlerinde yapım eki vardır: sev-in-, yaz-dır-, düş-ün-, bilgi-len-.',
  'Uzunluk, yapı ile karıştırılır. "Uyumak" kısa olduğu için basit olduğu doğru algılanır; ama aday "düşünmek" gibi kısa fiilleri de basit sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yapı bakımından birleşik sözcük kullanılmıştır?',
  '{"options":["Çalışkan bir öğrenciydi.","Bahçıvan güllere su verdi.","Gözyaşlarını silip gülümsedi.","Gelecek yıl yeniden buluşalım.","Kapıcı apartmanı süpürdü."],"correctIndex":2}'::jsonb,
  '"Gözyaşı", göz + yaş sözcüklerinin birleşmesiyle oluşan birleşik bir sözcüktür. Diğer cümlelerdeki sözcükler türemiş ya da basittir.',
  '"Bahçıvan" ve "kapıcı" gibi iki heceden fazla olan sözcükler birleşik sanılabilir. Ancak bunlar bir köke yapım eki getirilerek türetilmiştir.',
  array['lisans_gygk']::text[],
  'lisans'
);
