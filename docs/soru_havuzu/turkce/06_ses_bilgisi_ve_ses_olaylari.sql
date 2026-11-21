-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Ses Bilgisi ve Ses Olayları (10 soru) · SUPABASE SQL
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
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisinde ünlü daralması vardır?',
  '{"options":["diyorlar","okuyorlar","gelecekler","alıyorlar","yazdılar"],"correctIndex":0}'::jsonb,
  '"Diyorlar", "de-" fiiline -yor ekinin gelmesiyle ünlü daralmasına uğramıştır (de- → di-). Diğerlerinde daralma yoktur.',
  '"Okuyorlar" ve "alıyorlar" da -yor eki aldığı için aday bunları daralmış sanabilir. Ünlü daralması, geniş ünlünün dar ünlüye dönüşmesidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisinde ünlü düşmesi vardır?',
  '{"options":["kitabı","evi","kapıyı","sokağa","alnı"],"correctIndex":4}'::jsonb,
  '"Alın" sözcüğüne iyelik eki gelince "alnı" biçimine dönüşür; ikinci hecedeki ünlü düşmüştür. Diğerlerinde ünlü düşmesi yoktur.',
  '"Kitabı" ve "sokağa" ünsüz yumuşaması geçirdiği için ses olayı varmış gibi görünür. Ancak soruda sorulan ses olayı ünlü düşmesidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde ünsüz yumuşaması vardır?',
  '{"options":["Çocuklar bahçede oynuyordu.","Çocuk kitabı masaya bıraktı.","Kardeşim sabah erken kalktı.","Çorbayı masaya getirdi.","Okula yürüyerek gitti."],"correctIndex":1}'::jsonb,
  '"Kitap" sözcüğü ek alınca "kitabı" olur; sondaki "p", "b"ye dönüşür. Bu, ünsüz yumuşamasıdır. Diğer cümlelerde bu ses olayı görülmez.',
  '"Çorbayı" ve "okula" gibi ek almış sözcükler, ses olayı geçirmiş gibi görünür. Oysa bunlarda yalnızca kaynaştırma ünsüzü ya da basit ek birleşmesi vardır; sondaki ünsüzün yumuşaması yalnızca "p, ç, t, k" ile biten sözcüklerde görülür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisinde kaynaştırma ünsüzü kullanılmıştır?',
  '{"options":["evde","okula","kitabı","masayı","dağda"],"correctIndex":3}'::jsonb,
  '"Masa" sözcüğüne belirtme eki gelirken ünlüyle ünlü yan yana gelmesin diye araya "y" girmiştir; bu kaynaştırma ünsüzüdür.',
  '"Okula" ünlüyle biter ve ek alır, ancak kaynaştırma ünsüzü gerektirmez (-a eki "okul"a doğrudan eklenir). Aday sözcüğün ünlüyle bitip bitmediğine bakmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi büyük ünlü uyumuna uyar?',
  '{"options":["kalem","televizyon","okul","saat","misafir"],"correctIndex":2}'::jsonb,
  '"Okul" (o - u) kalın ünlülerden oluşur, büyük ünlü uyumuna uyar. Diğerlerinde kalın ve ince ünlüler bir arada bulunur.',
  'Yabancı kökenli sözcükler (kalem, saat, misafir) Türkçeleşmiş olduğu için aday büyük ünlü uyumuna uyduklarını sanabilir. Kural, Türkçe kökenli sözcüklerde aranır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisi küçük ünlü uyumuna uymaz?',
  '{"options":["tavuk","odun","kuzu","çocuk","gönül"],"correctIndex":0}'::jsonb,
  'Küçük ünlü uyumuna göre düz ünlüden sonra düz ünlü, yuvarlak ünlüden sonra ise dar yuvarlak ya da geniş düz ünlü gelir. "Tavuk" sözcüğünde düz "a" ünlüsünü yuvarlak "u" izlediği için uyum bozulmuştur.',
  '"Odun" ve "çocuk" gibi sözcüklerde yuvarlak ünlüyü yuvarlak ünlünün izlemesi uyumsuzluk sanılabilir. Oysa ihlal, düz ünlüden sonra yuvarlak ünlünün gelmesiyle ortaya çıkar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisinin bütün ünlüleri kalındır?',
  '{"options":["kalem","elma","keçi","misafir","dolap"],"correctIndex":4}'::jsonb,
  '"Dolap" sözcüğündeki ünlüler (o, a) kalın ünlüdür. Diğer sözcüklerde en az bir ince ünlü (e, i) vardır.',
  '"Kalem" ve "elma" gibi sözcüklerde kalın ünlüler çoğunlukta olduğu için aday hepsinin kalın olduğunu sanabilir. İnce ünlü (e, i, ö, ü) bulunan sözcük elenir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisinde ünsüz düşmesi vardır?',
  '{"options":["kitapçık","küçücük","çocuklar","evcik","bahçeye"],"correctIndex":1}'::jsonb,
  '"Küçük" sözcüğüne -cük eki gelince sondaki "k" düşer: küçücük. Diğerlerinde ünsüz düşmesi görülmez.',
  '"Kitapçık" gibi küçültme eki alan sözcükler benzer görünür; ancak burada kök sonundaki ünsüz düşmemiştir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisinde ünsüz benzeşmesi vardır?',
  '{"options":["sevecen","bahçıvan","göz","kitapçı","gelecek"],"correctIndex":3}'::jsonb,
  '"Kitap" sert ünsüzle bittiği için -cı eki, "ç" ile başlayan -çı biçimine dönüşmüştür; bu ünsüz benzeşmesidir.',
  '"Bahçıvan" gibi sözcüklerde de "ç" geçtiği için ses olayı varmış gibi görünür; ancak burada ek, sert ünsüzden sonra değişim göstermemiştir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerin hangisinde ses olayı yoktur?',
  '{"options":["kanadı","ağzı","dedi","gönlü","diyor"],"correctIndex":2}'::jsonb,
  '"Dedi" sözcüğünde "de-" fiiline -di eki ses değişimi olmadan eklenmiştir. "Kanadı" ünsüz yumuşaması, "ağzı" ve "gönlü" ünlü düşmesi, "diyor" ünlü daralmasıdır.',
  '"Dedi" ve "diyor" aynı fiilin çekimleri olduğu için aday ikisinde de ses olayı olduğunu sanabilir. Oysa daralma yalnızca -yor ekiyle gerçekleşir.',
  array['lisans_gygk']::text[],
  'lisans'
);
