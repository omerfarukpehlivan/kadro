-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Cümlenin Ögeleri ve Cümle Türleri (10 soru) · SUPABASE SQL
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
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde belirtili nesne vardır?',
  '{"options":["Annem yemeği hazırladı.","Çocuk bahçeye koştu.","Yolcular geç geldi.","Kardeşim ağlıyor.","Sınıf sessizdi."],"correctIndex":0}'::jsonb,
  '"Yemeği", yüklemin etkilediği varlıktır ve belirtme hâl eki (-i) almıştır; belirtili nesnedir. Diğer cümlelerde belirtili nesne bulunmaz.',
  '"Bahçeye" gibi hâl eki alan öğeler aday için nesne sanılabilir. Ancak -e hâli dolaylı tümleç, -i hâli belirtili nesne kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde zarf tümleci yoktur?',
  '{"options":["Yarın erkenden yola çıkacağız.","Çocuklar sessizce odaya girdi.","Çok yorulduğu için erken yattı.","Hızlı hızlı yürüdü.","Kitabı arkadaşıma verdim."],"correctIndex":4}'::jsonb,
  'Doğru şıkta belirtili nesne (kitabı) ve dolaylı tümleç (arkadaşıma) vardır; zarf tümleci yoktur. Diğer şıklarda zaman, durum ve neden bildiren zarf tümleçleri bulunur.',
  'Zarf tümleci ile dolaylı tümleç karıştırılır. Dolaylı tümleç "kime, neye, nerede, nereden" sorularına, zarf tümleci "nasıl, ne zaman, niçin" sorularına yanıt verir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi devrik cümledir?',
  '{"options":["Dün çok güzel bir film izledik.","Geldim sonunda eve.","Annem akşam yemeği hazırladı.","Çocuklar bahçede oynuyor.","Sınava ciddi çalıştı."],"correctIndex":1}'::jsonb,
  'Devrik cümlede yüklem sonda yer almaz. "Geldim sonunda eve" cümlesinde yüklem başa kaymıştır.',
  'Kısa cümleler devrik sanılabilir. Devrik cümleyi belirleyen, yüklemin sonda olmamasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi isim cümlesidir?',
  '{"options":["Sınav sonuçları yarın açıklanacak.","Çocuklar bahçede oynuyor.","Annem akşam yemeğini hazırladı.","Bu bahçe, mahallenin en güzel yeridir.","Sabahleyin yağmur yağdı."],"correctIndex":3}'::jsonb,
  'İsim cümlesinde yüklem ad soyludur; "yeridir" ek-fiil almıştır. Diğer cümlelerde yüklemler eylemdir.',
  '"En güzel yeri" ifadesi cümleye betimleme havası verir; ancak yüklem ad soylu olduğu için bu bir isim cümlesidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi birleşik cümledir?',
  '{"options":["Güneş batıyor.","Çocuk bahçede top oynuyor.","Sınavı bitiren öğrenciler dışarı çıktı.","Hava soğudu.","Kapı sessizce kapandı."],"correctIndex":2}'::jsonb,
  '"Bitiren" bir sıfat-fiildir ve cümleye yan cümlecik katar; bu nedenle cümle birleşiktir. Diğerleri tek yargılı basit cümlelerdir.',
  'Uzun cümle birleşik sanılabilir. Birleşik cümlede fiilimsi, "ki" ya da yan cümlecik bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi sıralı cümledir?',
  '{"options":["Güneş battı, hava serinledi, herkes eve döndü.","Yağmur yağdığı için yola çıkmadık.","Kitabı okuyup kütüphaneye iade etti.","Ders bitti ve herkes dışarı çıktı.","Sınavı kazanan öğrenci sevindi."],"correctIndex":0}'::jsonb,
  'Sıralı cümle, virgülle ayrılmış bağımsız yargılardan oluşur. İlk şıkta üç yargı birbirinden bağımsızdır.',
  '"Ve" ile bağlanan cümleler bağlı cümledir; aday bunu sıralı cümleyle karıştırır. Sıralı cümlede bağlaç yerine virgül kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde özne gizlidir?',
  '{"options":["Çocuklar bahçeye çıktı.","Annem yemek yapıyor.","Kitap masada duruyor.","Bu çanta benim.","Yarın erken kalkacağım."],"correctIndex":4}'::jsonb,
  '"Yarın erken kalkacağım" cümlesinde özne ("ben") açıkça yazılmamıştır, yüklemin kişi ekinden anlaşılır. Diğer cümlelerde özne belirtilmiştir.',
  '"Yarın" gibi bir sözcük öznenin yerine geçemez. Gizli özne, cümlede açıkça bulunmayan ama eklerden anlaşılan öznedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  '"Yolcu, çantasını aceleyle bagaja yerleştirdi." cümlesinde aşağıdaki ögelerden hangisi yoktur?',
  '{"options":["Özne","Belirtisiz nesne","Belirtili nesne","Zarf tümleci","Dolaylı tümleç"],"correctIndex":1}'::jsonb,
  'Cümlede özne (yolcu), belirtili nesne (çantasını), zarf tümleci (aceleyle), dolaylı tümleç (bagaja) ve yüklem vardır. Belirtisiz nesne bulunmaz.',
  '"Aceleyle" ve "bagaja" gibi öğeler tümleç olduğu için nesne yokmuş gibi görünür. Ancak "çantasını" belirtme eki aldığı için belirtili nesnedir; bu nedenle yok olan belirtisiz nesnedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi edilgendir?',
  '{"options":["Çocuk bahçede yürüdü.","Ayşe saçlarını taradı.","Annem çorba pişirdi.","Pencere rüzgârla açıldı.","Ahmet kapıyı çaldı."],"correctIndex":3}'::jsonb,
  'Edilgen yüklemin öznesi eylemi yapan değil, eylemden etkilenendir. "Pencere" eylemi kendisi yapmaz; rüzgâr açmıştır.',
  '"Açıldı" gibi -ıl ekli yapılar edilgenlik belirtir; aday özne olan "pencere"yi eylemi yapan sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  '"Gelip geçenler bu eski çeşmeden su içerdi." cümlesi, yapısına göre aşağıdakilerden hangisidir?',
  '{"options":["Basit cümle","Sıralı cümle","Birleşik cümle","Bağlı cümle","Şartlı cümle"],"correctIndex":2}'::jsonb,
  '"Gelip" bir zarf-fiil, "geçenler" ise bir sıfat-fiilden oluşan öğedir. Cümle fiilimsi içerdiği için birleşiktir.',
  'Cümlenin tek bir yüklemi olduğu için basit sanılabilir. Fiilimsiler cümle içinde yan yargı oluşturduğu için cümleyi birleşik yapar.',
  array['lisans_gygk']::text[],
  'lisans'
);
