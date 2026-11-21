-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · SÖZEL MANTIK PARTİSİ 1 (30 soru, zorluk 2-3) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140)
-- Kullanıcı onayladı (2026-11-21); henüz Supabase'e yüklenmedi. Yeniden çalıştırılırsa sorular çoğalır.
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
  2,
  'Ece, Fikret, Gül, Hakan, İlkay adlı 5 kişi bir sırada beklemektedir. İlkay, Fikret''in hemen arkasındadır. Ece, Gül''den öndedir. Hakan, İlkay''dan öndedir. İlkay, Ece''den öndedir.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Ece","Fikret","İlkay","Gül","Hakan"],"correctIndex":2}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Hakan - Fikret - İlkay - Ece - Gül. Baştan 3. sırada İlkay vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Ece) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ali, Banu, Cem, Deniz, Elif adlı 5 kişi bir sırada beklemektedir. Ali, Deniz''den öndedir. Ali, Cem''in hemen arkasındadır. Cem en önde değildir. Banu, Elif''ten öndedir. Deniz en arkada değildir.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Ali","Banu","Cem","Deniz","Elif"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Banu - Cem - Ali - Deniz - Elif. Baştan 3. sırada Ali vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Deniz) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Kaan, Leyla, Mert, Nil, Oya, Pelin adlı 6 kişi bir sırada beklemektedir. Kaan, Leyla''nın hemen arkasındadır. Pelin, Kaan''dan öndedir. Mert, Kaan''ın hemen arkasındadır. Nil, Pelin''den öndedir. Nil en önde değildir.

Buna göre baştan 2. sırada kim vardır?',
  '{"options":["Kaan","Nil","Leyla","Mert","Oya"],"correctIndex":1}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Oya - Nil - Pelin - Leyla - Kaan - Mert. Baştan 2. sırada Nil vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Pelin) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Arda, Berk, Ceren, Duru, Emre adlı 5 kişi bir sırada beklemektedir. Emre, Duru''nun hemen arkasındadır. Ceren, Emre''den öndedir. Berk, Emre''nin hemen arkasındadır. Emre, Arda''dan öndedir.

Buna göre baştan 5. sırada kim vardır?',
  '{"options":["Berk","Ceren","Duru","Arda","Emre"],"correctIndex":3}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Ceren - Duru - Emre - Berk - Arda. Baştan 5. sırada Arda vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Ceren) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Selim, Tuna, Umut, Yasemin, Zeynep adlı 5 kişi bir sırada beklemektedir. Selim 1. sıradadır. Umut 5. sıradadır. Umut, Zeynep''in hemen arkasındadır. Tuna, Yasemin''den öndedir.

Buna göre baştan 2. sırada kim vardır?',
  '{"options":["Tuna","Umut","Yasemin","Zeynep","Selim"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Selim - Tuna - Yasemin - Zeynep - Umut. Baştan 2. sırada Tuna vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Yasemin) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Barış, Dilara, Erkan, Funda, Gökhan adlı 5 kişi bir sırada beklemektedir. Funda, Gökhan''ın hemen arkasındadır. Funda, Erkan''dan öndedir. Dilara 5. sıradadır. Erkan, Barış''tan öndedir.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Barış","Erkan","Dilara","Funda","Gökhan"],"correctIndex":4}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Gökhan - Funda - Erkan - Barış - Dilara. Baştan 1. sırada Gökhan vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Funda) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Hande, İrem, Kerem, Lale, Murat, Naz adlı 6 kişi bir sırada beklemektedir. Murat, Lale''den öndedir. İrem, Hande''nin hemen arkasındadır. Naz, Murat''ın hemen arkasındadır. Kerem 6. sıradadır. İrem, Naz''dan öndedir.

Buna göre baştan 5. sırada kim vardır?',
  '{"options":["Lale","Hande","İrem","Kerem","Murat"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Hande - İrem - Murat - Naz - Lale - Kerem. Baştan 5. sırada Lale vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Kerem) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ada, Burcu, Cem adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Burcu yeşili sevmez. Cem yeşili sevmez. Ada, köpek beslemez. Burcu, kedi beslemez. Kırmızıyı seven kişi kedi besler.

Buna göre Burcu hangi hayvanı besler?',
  '{"options":["kedi","köpek","kuş","Belirlenemez","Hiçbir hayvan beslemez"],"correctIndex":1}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Ada yeşili sever ve kuş besler; Burcu maviyi sever ve köpek besler; Cem kırmızıyı sever ve kedi besler. Burcu köpek besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Deniz, Ece, Fatih adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Fatih maviyi sever. Deniz kırmızıyı sever. Maviyi seven kişi kuş besler. Kırmızıyı seven kişi köpek beslemez.

Buna göre Fatih hangi hayvanı besler?',
  '{"options":["kedi","köpek","Belirlenemez","kuş","Hiçbir hayvan beslemez"],"correctIndex":3}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Deniz kırmızıyı sever ve kedi besler; Ece yeşili sever ve köpek besler; Fatih maviyi sever ve kuş besler. Fatih kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Gizem, Halil, İpek adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Yeşili seven kişi köpek beslemez. Gizem, kedi beslemez. İpek yeşili sevmez. Gizem yeşili sevmez. Kırmızıyı seven kişi kedi besler.

Buna göre Halil hangi hayvanı besler?',
  '{"options":["kedi","köpek","Belirlenemez","Hiçbir hayvan beslemez","kuş"],"correctIndex":4}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Gizem maviyi sever ve köpek besler; Halil yeşili sever ve kuş besler; İpek kırmızıyı sever ve kedi besler. Halil kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Kar yağarsa okul tatil edilir. Okul tatil edilirse servis çalışmaz." Servis çalışmaktadır.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Okul tatil edilmiştir.","Kar yağmış, ama okul tatil edilmemiştir.","Kar yağmamıştır.","Kar yağmışsa servis de çalışmıştır.","Okul tatil edilmediği hâlde kar yağmıştır."],"correctIndex":2}'::jsonb,
  'Servis çalıştığına göre okul tatil edilmemiştir. Kar yağsaydı okul tatil edilecekti; bu nedenle kar yağmamıştır.',
  '"Servis çalışıyor" bilgisinden doğrudan kar durumuna geçmek zordur; aday zinciri tersten izlemelidir. Kar yağıp okulun tatil edilmemesi, ilk koşulla çelişir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Tüm yöneticiler toplantıya katılır. Toplantıya katılan hiç kimse izinli değildir."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Hiçbir yönetici izinli değildir.","İzinli olmayan herkes yöneticidir.","Toplantıya katılmayan herkes izinlidir.","Bazı yöneticiler izinlidir.","Yönetici olmayan herkes toplantıya katılmaz."],"correctIndex":0}'::jsonb,
  'Her yönetici toplantıya katılır; toplantıya katılan hiç kimse izinli değildir. Bu nedenle hiçbir yönetici izinli olamaz.',
  'İzinli olmayan herkesin yönetici olduğu sanılabilir. Oysa yalnızca yöneticilerin izinli olmadığı bilinir; yönetici olmayanların durumu hakkında bilgi verilmemiştir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Toplantıya Ali ile Berk''ten en az biri gelecek, ancak ikisi birlikte gelmeyecektir. Berk gelirse Can da gelecektir. Can gelmeyecektir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Berk gelecektir.","Ali gelecektir.","Ali ile Berk birlikte gelecektir.","Ali gelmeyecektir.","Can, Ali geldiği için gelmeyecektir."],"correctIndex":1}'::jsonb,
  'Can gelmeyeceğine göre Berk gelemez (Berk gelirse Can da gelirdi). Ali ile Berk''ten en az biri geleceğine göre Ali gelecektir.',
  'İki kişiden "en az biri" ifadesi, Berk''in de gelebileceğini düşündürür. Ancak Berk''in gelmesi Can''ı gerektirdiği için Berk elenir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Hiçbir kuş sürüngen değildir. Bazı sürüngenler zehirlidir."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Bazı kuşlar zehirlidir.","Zehirli olan her hayvan sürüngendir.","Hiçbir zehirli hayvan kuş değildir.","Zehirli olan bazı hayvanlar kuş değildir.","Her sürüngen zehirlidir."],"correctIndex":3}'::jsonb,
  'Zehirli olan bazı sürüngenler vardır ve hiçbir sürüngen kuş değildir. Bu nedenle zehirli olan bazı hayvanlar kuş değildir.',
  '"Zehirli" özelliğini taşıyan başka hayvanlar da olabileceği için aday, zehirli her hayvanın sürüngen olduğunu sanabilir. Oysa yalnızca bazı sürüngenlerin zehirli olduğu bilinir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bütün öğrenciler çalışkandır." önermesinin olumsuzu aşağıdakilerden hangisidir?',
  '{"options":["Hiçbir öğrenci çalışkan değildir.","Bütün öğrenciler çalışkan değildir.","Çalışkan olan bazı öğrenciler vardır.","Bazı çalışkanlar öğrenci değildir.","Çalışkan olmayan en az bir öğrenci vardır."],"correctIndex":4}'::jsonb,
  '"Hepsi ...dır" önermesinin olumsuzu, en az bir istisnanın bulunduğunu söyleyen "çalışkan olmayan en az bir öğrenci vardır" önermesidir.',
  '"Hiçbir öğrenci çalışkan değildir" sözü olumsuza en yakın gibi görünür; oysa bu, önermeye zıt değil uç bir karşıt yargıdır. Olumsuzlama için tek bir örnek yeterlidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bir sayı 6''ya tam bölünüyorsa 3''e de tam bölünür." Bir sayı 3''e tam bölünmemektedir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Sayı 2''ye tam bölünmez.","Sayı 9''a tam bölünür.","Sayı 6''ya tam bölünmez.","Sayı 6''ya tam bölünür.","Sayı tek sayıdır."],"correctIndex":2}'::jsonb,
  '6''ya bölünen her sayı 3''e bölünür. Sayı 3''e bölünmediğine göre 6''ya da bölünemez.',
  'Sayının tek ya da çift olduğu hakkında bilgi yoktur. Aday 3''e bölünmeme bilgisini 2''ye bölünme durumuyla karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Ali, Berk ve Cem''in söyledikleri aşağıda verilmiştir. Her biri ya her zaman doğru ya da her zaman yalan söylemektedir.

Ali: "Berk yalan söylüyor."
Berk: "Cem yalan söylüyor."
Cem: "Ali ile Berk yalan söylüyor."

Buna göre doğru söyleyen kimdir?',
  '{"options":["Berk","Ali","Cem","Ali ile Cem","Hiçbiri"],"correctIndex":0}'::jsonb,
  'Ali doğru söylüyorsa Berk yalancıdır; Berk''in "Cem yalan söylüyor" sözü yalan olduğundan Cem doğrucudur. Ancak Cem "Ali yalan söylüyor" dediği için Ali ile çelişir. Ali yalancıysa Berk doğru söyler, Cem yalancı olur ve Cem''in sözü de yalan çıkar; bu durum tutarlıdır. Doğru söyleyen Berk''tir.',
  'Üç kişinin sözleri birbirine bağlı olduğu için aday rastgele bir kişiyi doğru sayıp devam edebilir. Doğru yol, her seçeneği deneyip çelişkiyi bulmaktır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Üç kutudan birinde ödül vardır. Kutuların üzerindeki yazılar şöyledir:

1. kutu: "Ödül bu kutudadır."
2. kutu: "Ödül bu kutuda değildir."
3. kutu: "Ödül 1. kutuda değildir."

Yazılardan yalnızca biri doğru olduğuna göre ödül hangi kutudadır?',
  '{"options":["1. kutuda","2. kutuda","3. kutuda","Belirlenemez","Hiçbir kutuda"],"correctIndex":1}'::jsonb,
  'Ödül 1. kutudaysa 1. ve 2. yazı doğru olur (iki doğru). Ödül 3. kutudaysa 2. ve 3. yazı doğru olur (iki doğru). Ödül 2. kutudaysa yalnızca 3. yazı doğrudur; koşul sağlanır.',
  '"Belirlenemez" şıkkı, üç yazının birbirine bağlı olduğu bu tür sorularda çekici görünür. Oysa her seçeneği doğru yazı sayısıyla sınadığınızda tek çözüm bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Dört kişi aşağıdaki gibi konuşmaktadır:

Ayşe: "Aramızda tam 1 kişi yalan söylüyor."
Burak: "Aramızda tam 2 kişi yalan söylüyor."
Can: "Aramızda tam 3 kişi yalan söylüyor."
Defne: "Aramızda tam 4 kişi yalan söylüyor."

Buna göre doğru söyleyen kimdir?',
  '{"options":["Ayşe","Burak","Defne","Can","Hiçbiri"],"correctIndex":3}'::jsonb,
  'Sözler birbirini dışladığı için en fazla biri doğru olabilir. Yalnızca biri doğruysa üç kişi yalan söylüyordur; bu durumda "tam 3 kişi" diyen Can doğrudur.',
  '"Hiçbiri doğru söylemiyor" ihtimali, dört yalanın hepsinin tutarlı olabileceği izlenimi verir. Oysa hepsi yalansa tam dört yalancı vardır ve Defne doğru söylemiş olur; bu bir çelişkidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir camı Ayşe, Berk, Ceren ya da Deniz''den biri kırmıştır. Dördünün söyledikleri şöyledir:

Ayşe: "Camı ben kırmadım."
Berk: "Camı Ceren kırdı."
Ceren: "Camı Deniz kırdı."
Deniz: "Camı ben kırmadım."

Dört kişiden yalnızca biri doğru söylediğine göre camı kim kırmıştır?',
  '{"options":["Berk","Ceren","Deniz","Belirlenemez","Ayşe"],"correctIndex":4}'::jsonb,
  'Camı Ayşe kırdıysa yalnızca Deniz doğru söyler (üç yalan, bir doğru). Camı Berk ya da Deniz kırdıysa iki kişi, Ceren kırdıysa üç kişi doğru söyler; yalnızca biri doğru söylediğine göre cam kıran Ayşe''dir.',
  'Ayşe ile Deniz aynı sözü söylediği için sözlerin birbirini desteklediği sanılır. Oysa tek doğru söyleyenin Deniz olması, camı Ayşe''nin kırdığı durumda gerçekleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir okulda her futbolcu öğrencidir. Bazı müzisyenler öğrencidir. Hiçbir müzisyen futbolcu değildir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Bazı futbolcular müzisyendir.","Her öğrenci müzisyendir.","Bazı öğrenciler futbolcu değildir.","Her müzisyen öğrencidir.","Hiçbir öğrenci müzisyen değildir."],"correctIndex":2}'::jsonb,
  'Öğrenci olan bazı müzisyenler vardır ve hiçbir müzisyen futbolcu değildir. Bu nedenle öğrenci olup futbolcu olmayanlar vardır.',
  '"Her futbolcu öğrencidir" bilgisi, her öğrencinin futbolcu olduğu şeklinde tersine çevrilebilir. Oysa bu mantıksal bir hatadır; öğrencilerin hepsi futbolcu değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Bazı mühendisler yazardır. Hiçbir yazar sporcu değildir."

Buna göre aşağıdakilerden hangisi kesinlikle yanlıştır?',
  '{"options":["Bazı mühendisler sporcudur.","Hem sporcu hem yazar olan bazı mühendisler vardır.","Bazı yazarlar mühendis değildir.","Bazı sporcular mühendistir.","Bazı mühendisler sporcu değildir."],"correctIndex":1}'::jsonb,
  'Hiçbir yazar sporcu olmadığına göre hem yazar hem sporcu olan kimse yoktur; bu nedenle ilk yargı kesinlikle yanlıştır. Diğerleri doğru ya da olasıdır.',
  '"Bazı mühendisler sporcudur" yargısı da aday için yanlış gibi görünebilir. Oysa mühendisler yazar olmayan sporcular da olabilir; bu yargı olasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  1,
  '"Hiçbir doktor sigara içmez." Selin sigara içmektedir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Selin hemşiredir.","Sigara içen herkes doktordur.","Selin sigarayı bırakırsa doktor olur.","Selin doktor değildir.","Doktor olmayan herkes sigara içer."],"correctIndex":3}'::jsonb,
  'Hiçbir doktor sigara içmediğine göre sigara içen Selin doktor olamaz.',
  'Selin''in mesleği hakkında başka bir bilgi verilmediği için "hemşire" gibi bir meslek çıkarımı yapılamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Bir ayın 3''ü Salı olduğuna ve bu ay 30 gün çektiğine göre ayın son günü hangi gündür?',
  '{"options":["Pazartesi","Salı","Pazar","Cumartesi","Perşembe"],"correctIndex":0}'::jsonb,
  '3, 10, 17 ve 24 Salı''dır. 24''ten 30''a 6 gün vardır; Salı''dan 6 gün sonrası Pazartesi''dir.',
  'Ay sonu için 31''i baz almak ya da haftanın günlerini ardışık saymak hata yaptırır. 24 Salı ise 30 Pazartesi olur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Naz, Oğuz, Pelin, Rıza, Sevgi adlı 5 kişi bir sırada beklemektedir. Oğuz, Naz''dan öndedir. Sevgi, Rıza''dan öndedir. Naz, Sevgi''nin hemen arkasındadır. Rıza en arkada değildir.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Oğuz","Naz","Pelin","Rıza","Sevgi"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Oğuz - Sevgi - Naz - Rıza - Pelin. Baştan 1. sırada Oğuz vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Sevgi) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Tolga, Ufuk, Vildan, Yaren, Zeki adlı 5 kişi bir sırada beklemektedir. Ufuk, Vildan''ın hemen arkasındadır. Zeki en arkada değildir. Yaren 1. sıradadır. Vildan, Tolga''nın hemen arkasındadır.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Tolga","Ufuk","Vildan","Yaren","Zeki"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Yaren - Zeki - Tolga - Vildan - Ufuk. Baştan 3. sırada Tolga vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Vildan) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ahmet, Belgin, Caner, Demet, Emin, Funda adlı 6 kişi bir sırada beklemektedir. Funda, Caner''den öndedir. Emin en arkada değildir. Emin, Belgin''in hemen arkasındadır. Caner, Belgin''den öndedir. Caner, Ahmet''in hemen arkasındadır.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Caner","Ahmet","Belgin","Demet","Emin"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Funda - Ahmet - Caner - Belgin - Emin - Demet. Baştan 3. sırada Caner vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Belgin) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Gamze, Hasan, Işık, Jülide, Kadir, Lütfi adlı 6 kişi bir sırada beklemektedir. Jülide, Lütfi''nin hemen arkasındadır. Işık en arkada değildir. Jülide, Kadir''den öndedir. Kadir, Işık''tan öndedir. Hasan 1. sıradadır.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Jülide","Gamze","Hasan","Işık","Kadir"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Hasan - Lütfi - Jülide - Kadir - Işık - Gamze. Baştan 3. sırada Jülide vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Kadir) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Mehmet, Nalan, Okan, Pınar, Rabia adlı 5 kişi bir sırada beklemektedir. Rabia, Mehmet''ten öndedir. Rabia, Okan''ın hemen arkasındadır. Nalan 1. sıradadır. Pınar, Rabia''nın hemen arkasındadır.

Buna göre baştan 4. sırada kim vardır?',
  '{"options":["Pınar","Mehmet","Nalan","Okan","Rabia"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Nalan - Okan - Rabia - Pınar - Mehmet. Baştan 4. sırada Pınar vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Mehmet) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Proje onaylanırsa bütçe artırılır. Bütçe artırılırsa yeni personel alınır." Yeni personel alınmamıştır.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Proje onaylanmamıştır.","Bütçe artırılmıştır.","Proje onaylanmış, bütçe de artırılmıştır.","Proje onaylanmış ama bütçe artırılmamıştır.","Bütçe artırılmış ama yeni personel alınmamıştır."],"correctIndex":0}'::jsonb,
  'Yeni personel alınmadığına göre bütçe artırılmamıştır. Proje onaylansaydı bütçe artırılacaktı; bu nedenle proje onaylanmamıştır.',
  'Zincirin ilk halkası olan proje bilgisi doğrudan verilmediği için aday, projenin onaylanıp onaylanmadığını yanlış çıkarabilir. Zincir, son halkadan başa doğru izlenmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Mert, sinemaya ya da tiyatroya gidecektir; ancak ikisine birden gitmeyecektir. Mert tiyatroya giderse Selin de tiyatroya gidecektir. Selin tiyatroya gitmeyecektir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Mert sinemaya gidecektir.","Mert tiyatroya gidecektir.","Mert hem sinemaya hem tiyatroya gidecektir.","Mert hiçbir yere gitmeyecektir.","Selin sinemaya gidecektir."],"correctIndex":0}'::jsonb,
  'Selin tiyatroya gitmediğine göre Mert de tiyatroya gitmez (gitseydi Selin de giderdi). Mert''in sinemaya ya da tiyatroya gideceği bilindiğine göre sinemaya gidecektir.',
  '"Selin gitmeyecek" bilgisi Mert''in hiçbir yere gitmeyeceği izlenimi verebilir. Oysa Mert''in iki seçenekten birine gideceği baştan verilmiştir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir camı Ali, Berk ya da Cem''den biri kırmıştır. Üçünün söyledikleri şöyledir:

Ali: "Camı ben kırmadım."
Berk: "Camı Ali kırdı."
Cem: "Berk yalan söylüyor."

Üçünden yalnızca biri doğru söylediğine göre camı kim kırmıştır?',
  '{"options":["Ali","Berk","Cem","Berk ile Cem","Belirlenemez"],"correctIndex":0}'::jsonb,
  'Camı Ali kırdıysa yalnızca Berk doğru söyler (Ali yalan söyler, Cem''in "Berk yalan söylüyor" sözü de yalan olur): tek doğru vardır. Camı Berk ya da Cem kırdıysa iki kişi doğru söyler. Bu nedenle camı Ali kırmıştır.',
  'Cem''in sözü Berk''e bağlı olduğu için aday zinciri yanlış kurabilir. Her olasılık için doğru söyleyenlerin sayısını sayarak tek çözüm bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bütün kuşlar hayvandır. Bazı hayvanlar uçar. Hiçbir balık kuş değildir."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Hiçbir kuş balık değildir.","Bazı hayvanlar balıktır.","Her hayvan kuştur.","Bazı kuşlar uçmaz.","Uçan her hayvan kuştur."],"correctIndex":0}'::jsonb,
  '"Hiçbir balık kuş değildir" önermesinin tersi de doğrudur: hiçbir kuş balık değildir. Diğer yargılar önermelerden çıkarılamaz.',
  '"Bazı hayvanlar uçar" bilgisi uçan hayvanların kuş olduğu izlenimini verebilir. Oysa uçan hayvanların hangi gruba ait olduğu bilinmez.',
  array['lisans_gygk']::text[],
  'lisans'
);
