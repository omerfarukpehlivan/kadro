-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil) (10 soru) · SUPABASE SQL
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
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "hızlı" sözcüğü zarf görevinde kullanılmıştır?',
  '{"options":["Yarışçı hızlı koştu.","Hızlı arabalar yola çıktı.","Hızlı bir çözüm buldu.","Hızlı adımlarla yürüdü.","Hızlı bir ses duydu."],"correctIndex":0}'::jsonb,
  '"Hızlı", "koştu" fiilinin nasıl yapıldığını bildirdiği için zarftır. Diğer cümlelerde "hızlı" bir adı niteleyen sıfattır.',
  'Sıfat ve zarf aynı sözcükle kurulabildiği için ayırt etmek zordur. Sözcüğün ad mı fiil mi nitelediğine bakılır: ad niteleniyorsa sıfat, fiil niteleniyorsa zarftır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "o" sözcüğü sıfat görevindedir?',
  '{"options":["O, her zaman haklıdır.","O gelmeden toplantı başlamaz.","Bunu o söyledi.","O da bizimle gelecek.","O çocuk bahçede oynuyor."],"correctIndex":4}'::jsonb,
  '"O çocuk" ifadesinde "o", bir adın (çocuk) önünde onu belirtir; işaret sıfatıdır. Diğer cümlelerde "o" tek başına bir kişinin yerini tutar (zamir).',
  '"O" sözcüğü hem zamir hem sıfat olabilir. Aday sözcüğü görünce zamir sanır; ancak bir adın önünde gelip onu belirtiyorsa sıfattır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "ile" sözcüğü bağlaç görevinde kullanılmıştır?',
  '{"options":["Mektubu kargo ile gönderdi.","Kitap ile defter masanın üzerinde duruyordu.","Çocuk annesi ile alışverişe çıktı.","Ahmet ile birlikte çalıştı.","Okula otobüs ile gitti."],"correctIndex":1}'::jsonb,
  'Bağlaç olan "ile", "ve" ile değiştirilebilir ve iki sözcüğü bağlar: kitap ve defter. Diğer cümlelerde araç, birliktelik anlamı veren edat görevindedir.',
  '"İle" hem edat hem bağlaç olabildiği için karıştırılır. "Ve" ile değiştirilip anlam bozulmuyorsa bağlaçtır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde yardımcı fiil kullanılmıştır?',
  '{"options":["Kapıyı açıp içeri girdi.","Kitabı masaya koydu.","Yürüyerek eve döndü.","Yarın seni ziyaret edeceğim.","Çiçekleri suladı."],"correctIndex":3}'::jsonb,
  '"Ziyaret etmek"te "etmek", ad soylu bir sözcükle birleşerek yeni bir anlam oluşturur; yardımcı fiildir. Diğer cümlelerde fiiller kendi anlamlarıyla kullanılmıştır.',
  '"Girdi", "koydu" gibi fiiller de başka sözcüklerle kullanıldığı için yardımcı fiil sanılabilir. Yardımcı fiil, kendi anlamını yitirip bir ad soylu sözcükle kalıplaşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde belgisiz sıfat kullanılmıştır?',
  '{"options":["Üç kitap aldı.","Şu çantayı bana ver.","Bahçede birkaç çocuk oynuyordu.","Kırmızı arabayı gördü.","Hangi yoldan gideceğiz?"],"correctIndex":2}'::jsonb,
  '"Birkaç", varlıkların sayısını kesin olarak bildirmeden belirtir; belgisiz sıfattır. "Üç" sayı, "şu" işaret, "kırmızı" niteleme, "hangi" soru sıfatıdır.',
  '"Üç" gibi sayı bildiren sıfatlar, "birkaç" ile karıştırılabilir. Sayı sıfatı kesin sayı, belgisiz sıfat ise belirsiz miktar bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde miktar zarfı kullanılmıştır?',
  '{"options":["Bu kitabı çok sevdi.","Dün gece erken yattık.","Buraya hemen gel.","Sakin sakin konuştu.","Yarın erkenden yola çıkacağız."],"correctIndex":0}'::jsonb,
  '"Çok", fiilin derecesini bildirir ve "ne kadar?" sorusuna yanıt verir; miktar zarfıdır. Diğerleri zaman, yer-yön ve durum zarfıdır.',
  '"Hemen" gibi hızı çağrıştıran zarflar miktar sanılabilir. Miktar zarfı "ne kadar?" sorusuna yanıt verir; "hemen" ise "ne zaman?" sorusunun yanıtıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde sıfat-fiil vardır?',
  '{"options":["Kitabı okuyarak öğrendi.","Sabah erken uyanmak zordur.","Eve dönünce yemek yedik.","Okumayı çok severim.","Çalışan insanlar her zaman saygı görür."],"correctIndex":4}'::jsonb,
  '"Çalışan", bir adı niteleyen (insanlar) fiilimsidir; sıfat-fiildir. "Okuyarak" ve "dönünce" zarf-fiil, "uyanmak" ve "okumayı" isim-fiildir.',
  'Hepsi fiilden türeyen yapılar olduğu için aday fiilimsi türlerini karıştırır. Sıfat-fiil, bir adın önünde gelip onu niteler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde dilek-şart kipi kullanılmıştır?',
  '{"options":["Yarın erkenden yola çıkacağız.","Havalar ısınırsa denize gireriz.","Çocuk sessizce odasına çekildi.","Bu işi mutlaka bitirmeliyim.","Her sabah erken kalkardı."],"correctIndex":1}'::jsonb,
  '"Isınırsa" yapısı, eylemin gerçekleşmesini bir şarta bağlar; -sa ekiyle kurulan şart kipidir. Diğer cümlelerde gelecek, di''li geçmiş, gereklilik ve geniş zaman hikâyesi vardır.',
  '"Kalkardı" gibi geçmişte tekrar eden eylemler koşul sanılabilir; ancak şart kipinin eki "-sa/-se"dir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "güzel" sözcüğü ad olarak kullanılmıştır?',
  '{"options":["Güzel kız hemen geldi.","Güzel konuştu ve herkesi etkiledi.","Güzel bir şarkıydı.","Bu güzeli bir daha göremeyeceğim.","Çok güzel sözler söyledi."],"correctIndex":3}'::jsonb,
  '"Güzeli" sözcüğü, belirtme hâl eki alarak adın yerine geçmiştir; adlaşmış sıfattır. Diğerlerinde "güzel" sıfat ya da zarf görevindedir.',
  '"Güzel bir şarkıydı" gibi cümlelerde sözcük ek-fiil aldığı için ad sanılabilir. Ancak burada "güzel" bir adı niteler; ad gibi çekim eki almaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bağlaç kullanılmıştır?',
  '{"options":["Kardeşim gibi erken kalkar.","Sınav için çok çalıştı.","Yağmur yağıyordu ama yola çıktık.","Sabaha kadar uyumadı.","Ders çıkışına dek bekledi."],"correctIndex":2}'::jsonb,
  '"Ama", iki cümleyi karşıtlık ilişkisiyle bağlayan bir bağlaçtır. "Gibi, için, kadar, dek" ise ad soylu sözcüklerle birlikte kullanılan edatlardır.',
  'Edat ve bağlaç ikisi de çekimsiz sözcüklerdir. Bağlaç, söz öbeklerini ya da cümleleri birbirine bağlar; edat ise bir adla birlikte anlam kazanır.',
  array['lisans_gygk']::text[],
  'lisans'
);
