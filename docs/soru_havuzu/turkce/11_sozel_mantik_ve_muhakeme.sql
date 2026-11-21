-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Sözel Mantık ve Muhakeme (10 soru) · SUPABASE SQL
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
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  1,
  'Ali, Banu, Cem, Deniz ve Elif''in boyları hakkında şunlar bilinmektedir: Ali, Banu''dan uzundur. Cem, Ali''den uzundur. Deniz, Banu''dan kısadır. Elif, Cem''den kısa ama Ali''den uzundur.

Buna göre en kısa kişi kimdir?',
  '{"options":["Deniz","Ali","Banu","Cem","Elif"],"correctIndex":0}'::jsonb,
  'Boy sırası Cem > Elif > Ali > Banu > Deniz''dir. En kısa kişi Deniz''dir.',
  'Banu''nun hem Ali''den kısa hem Deniz''den uzun olduğunu karıştıran aday, en kısa kişiyi Banu sanabilir. Deniz''in Banu''dan kısa olduğu bilgisi bunu çürütür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Matematikte başarılı olan herkes Fen''de de başarılıdır." Selin, Fen''de başarısızdır.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Selin matematikte başarılıdır.","Fen''de başarılı olan herkes matematikte başarılıdır.","Selin hiçbir derste başarılı değildir.","Matematikte başarısız olan kimse Fen''de başarılı değildir.","Selin matematikte başarılı değildir."],"correctIndex":4}'::jsonb,
  'Matematikte başarılı olsaydı Fen''de de başarılı olurdu. Fen''de başarısız olduğuna göre matematikte başarılı olamaz.',
  '"Fen''de başarılı olan herkes matematikte başarılıdır" ifadesi, kuralın tersini söyler ve bu yönde bir bilgi verilmemiştir. Koşul tek yönlüdür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  1,
  'Ayşe, Burak ve Can; Pazartesi, Salı ve Çarşamba günlerinde birer gün nöbet tutacaktır. Ayşe Salı günü nöbet tutmamaktadır. Burak, Ayşe''den önceki bir günde nöbet tutmaktadır. Can Pazartesi günü nöbet tutmamaktadır.

Buna göre Burak hangi gün nöbet tutmaktadır?',
  '{"options":["Salı","Pazartesi","Çarşamba","Belirlenemez","Hiçbir gün"],"correctIndex":1}'::jsonb,
  'Ayşe Salı değil; Burak ondan önce olduğu için Pazartesi olamaz. Ayşe Çarşamba''dır. Can Pazartesi olamayacağından Salı, Burak ise Pazartesi''dir.',
  'Burak''ın "Ayşe''den önce" olması, Pazartesi''yi akla getirmez gibi görünür. Ancak diğer koşullarla birlikte Burak''a kalan tek gün Pazartesi''dir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Üç arkadaştan yalnızca biri doğru söylüyor. Ahmet: "Anahtarı Berna aldı." Berna: "Ahmet yalan söylüyor." Cem: "Anahtarı ben almadım." Anahtarı bu üç kişiden biri almıştır.

Buna göre anahtarı kim almıştır?',
  '{"options":["Ahmet","Berna","Ahmet ya da Berna","Cem","Belirlenemez"],"correctIndex":3}'::jsonb,
  'Ahmet doğru söylüyorsa Cem de doğru söyler; iki doğru olamaz. Cem doğru söylüyorsa Berna da doğrudur. Bu nedenle yalnızca Berna doğru söylemektedir, Ahmet ve Cem yalan söylüyor; anahtarı Cem almıştır.',
  'Ahmet''in yalan söylediği bilgisi, anahtarı Berna''nın almadığını gösterir; aday bu durumda Ahmet''i alan sanabilir. Cem''in sözü yalan olduğu için anahtarı Cem almıştır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Roman, Şiir, Tarih, Bilim ve Sözlük kitapları bir rafta soldan sağa doğru sıralanmıştır. Roman, Şiir''in hemen solundadır. Tarih en solda değildir. Bilim, Tarih''in sağındadır. Sözlük ise Bilim''in sağındadır.

Buna göre soldan üçüncü kitap hangisidir?',
  '{"options":["Roman","Şiir","Tarih","Bilim","Sözlük"],"correctIndex":2}'::jsonb,
  'Roman-Şiir bir blok oluşturur; Tarih en solda olamayacağına göre blok en başta yer alır. Sıra Roman, Şiir, Tarih, Bilim, Sözlük olur. Üçüncü kitap Tarih''tir.',
  'Bilim ile Sözlük''ün yeri kolay belirlendiği için aday blokların yerini atlayabilir. Tarih en solda olamadığı için Roman-Şiir bloğu başa gelir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  1,
  'Bir ayın 5''i Cuma ise aynı ayın 29''u hangi gündür?',
  '{"options":["Pazartesi","Pazar","Salı","Cumartesi","Cuma"],"correctIndex":0}'::jsonb,
  '5, 12, 19 ve 26 Cuma''dır. 27 Cumartesi, 28 Pazar, 29 ise Pazartesi''dir.',
  'Yedişer gün sayma hatasıyla 29 yerine 28 veya 30''a bakılabilir. 26 Cuma olduğundan 29 Pazartesi''dir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  1,
  'Ece, Mert''ten 4 yaş büyüktür. Mert, Sena''dan 3 yaş küçüktür. Üçünün yaşları toplamı 49''dur.

Buna göre Ece kaç yaşındadır?',
  '{"options":["16","17","19","20","18"],"correctIndex":4}'::jsonb,
  'Mert x yaşında olsun. Ece x + 4, Sena x + 3 yaşındadır. Toplam 3x + 7 = 49 olduğundan x = 14 ve Ece 18''dir.',
  'Mert''in yaşını bulmak yerine Ece''nin yaşını doğrudan bulmaya çalışmak hatalara yol açar. Doğru yöntem, tek bilinmeyenle denklem kurmaktır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bütün doktorlar mezundur. Bazı mezunlar yazardır."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Bazı doktorlar yazardır.","Bazı yazarlar mezundur.","Her yazar doktordur.","Hiçbir doktor yazar değildir.","Her mezun doktordur."],"correctIndex":1}'::jsonb,
  '"Bazı mezunlar yazardır" ifadesinden, yazar olan mezunların bulunduğu çıkar; yani bazı yazarlar mezundur.',
  'Doktorlar mezun olduğu için bazı doktorların yazar olduğu sanılabilir. Ancak yazar olan mezunların doktor olup olmadığı bilinmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ada, Barış, Cem ve Defne dört ayrı odada (1, 2, 3 ve 4 numaralı) kalmaktadır. Ada 4. odada değildir. Barış, Ada''nın hemen bir önceki odadadır. Cem 1. odada değildir. Defne, Cem''den daha büyük numaralı bir odadadır.

Buna göre aşağıdakilerden hangisi doğrudur?',
  '{"options":["Ada 3. odadadır.","Barış 2. odadadır.","Cem 3. odadadır.","Defne 1. odadadır.","Defne 3. odadadır."],"correctIndex":2}'::jsonb,
  'Ada 2. ya da 3. odadadır. Ada 3. odadaysa Barış 2., Cem 4., Defne 1. olur ve Defne''nin Cem''den büyük numaralı olması koşulu bozulur. Bu nedenle Ada 2., Barış 1., Cem 3., Defne 4. odadadır.',
  'Ada''nın 3. odada olması ilk bakışta mümkün görünür. Ancak Defne-Cem koşulu bu seçeneği eler.',
  array['lisans_gygk']::text[],
  'lisans'
);
