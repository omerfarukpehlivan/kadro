-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Sözcükte Anlam (10 soru) · SUPABASE SQL
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
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "ağır" sözcüğü mecaz anlamda kullanılmıştır?',
  '{"options":["Bu ağır sözleri hak etmediğimi biliyorsun.","Ağır çantayı sırtlayıp merdivenleri çıktı.","Ağır ağır yürüyerek tepeye ulaştı.","Gemi, ağır yükünün altında yavaşça limana yanaştı.","Kamyonun ağır kasası yoldaki çukurda sallandı."],"correctIndex":0}'::jsonb,
  '"Ağır sözler" ifadesinde sözcük, ağırlığı ölçülen bir nesneyi değil "incitici, kırıcı" anlamını bildirir; gerçek anlamdan uzaklaştığı için mecazdır. Diğer şıklarda sözcük ya gerçek ağırlığı ya da "yavaş" anlamını verir.',
  'ÖSYM "ağır ağır" ifadesini en güçlü çeldirici yapar: sözcük burada "yavaş" anlamı kazanmıştır, bu yüzden mecaz sanılır. Oysa "yavaş" anlamı temel anlamla bağlantılı bir yan anlamdır; mecazda ise sözcük temel anlamdan tamamen uzaklaşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Yüz kişilik salon bir anda doldu." cümlesindeki "yüz" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Çocuğun yüzü sevinçten kıpkırmızı olmuştu.","Yüzünü ekşitip yemeğe dokunmadı.","Bu yüzü kara işi bir daha yapmam.","Dönüp baktığında yüzünde kocaman bir gülümseme vardı.","Havuzda yüz metre serbest yüzdü."],"correctIndex":4}'::jsonb,
  'Soru kökündeki "yüz" sayı bildirir (100). Yalnızca "yüz metre" ifadesinde sözcük sayı anlamındadır; diğerlerinde "surat" anlamında kullanılmıştır. İki sözcük sesteştir (eş sesli).',
  'Aday, "yüzdü" fiilini ve "yüz" sözcüğünün her şıkta geçmesini görünce anlam yakınlığı arar. Oysa eş sesli sözcüklerde ses aynı, anlam farklıdır; doğru şık yalnızca sayı anlamı taşıyan ifadedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde deyimin parantez içindeki açıklaması yanlış verilmiştir?',
  '{"options":["Çalışanların yaptığı hatalara göz yumdu. (Görmezden geldi.)","Eski rakibine uzun süredir diş biliyordu. (Ona içten bir destek veriyordu.)","Uyarılara kulak asmadan yola çıktı. (Aldırış etmeden)","Taşınma konusunda ayak diriyor. (Israrla karşı çıkıyor.)","Kardeşinin sözlerine içerleyip dudak büktü. (Beğenmediğini belli etti.)"],"correctIndex":1}'::jsonb,
  '"Diş bilemek", bir kimseden öç almak için fırsat kollamak anlamına gelir; "içten destek vermek" anlamı yoktur. Diğer deyimlerin açıklamaları doğrudur.',
  '"Diş bilemek" ifadesi, "bilemek" sözcüğünün "keskinleştirmek, hazırlamak" çağrışımı yüzünden masum bir hazırlık gibi algılanır. Aday bu çağrışımla açıklamayı "olumlu bir tutum"a bağlayabilir; oysa deyim düşmanlık içerir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde terim anlamlı bir sözcük kullanılmıştır?',
  '{"options":["Evin perdelerini yıkayıp astı.","Tabaktaki yemek soğumuştu.","Eski dostumuzla uzun süre konuştuk.","Fiil kökünü bulup ekleri tek tek ayırdı.","Soğanı kızartıp etin üzerine ekledi."],"correctIndex":3}'::jsonb,
  '"Kök" ve "ek", dil bilgisi alanına özgü kavramlardır; bu cümlede terim anlamı taşırlar. Diğer şıklardaki sözcükler günlük yaşamdaki gerçek anlamlarıyla kullanılmıştır.',
  '"Perde" sözcüğü tiyatroda terim olarak da kullanıldığı için aday onu seçebilir; ancak bu cümlede sözcük pencere perdesi anlamındadır ve alanına özgü bir kavram bildirmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki sözcük çiftlerinden hangisi eş ya da yakın anlamlı değildir?',
  '{"options":["yurt - vatan","cesaret - yüreklilik","yazar - şair","saygı - hürmet","ödev - görev"],"correctIndex":2}'::jsonb,
  'Yazar ve şair farklı edebî kimlikleri anlatır; biri her türde yazı yazan, öteki şiir yazan kişidir. Diğer çiftler anlamca birbirine çok yakındır.',
  'İki sözcüğün de "edebiyatla uğraşan kişi" çağrışımı yapması, aday için yanıltıcıdır. Eş anlam, bir sözcüğün diğerinin yerine kullanılabilmesiyle belirlenir; yazar ile şair birbirinin yerine geçemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde nicel (sayılıp ölçülebilir) anlam taşıyan bir sözcük kullanılmıştır?',
  '{"options":["Çarşıdan üç kilo elma aldık.","Konserden sonra hepimiz mutlu ayrıldık.","Zor bir sınavdı ama başardık.","Odada tatlı bir koku vardı.","Etkileyici bir şiir okudu."],"correctIndex":0}'::jsonb,
  'Nicel anlam; sayı, ölçü ve miktar bildirir. "Üç kilo" ölçülebilir bir miktardır. Diğer şıklardaki sözcükler niteliği (duygu, izlenim) anlatır.',
  '"Zor" ve "etkileyici" gibi sözcükler derece bildirdiği için aday bunları ölçülebilir sanabilir. Ancak nicel anlam yalnızca sayı ve ölçüyle ifade edilebilen miktar bildiren sözcüklerde vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ad aktarması (düz değişmece) vardır?',
  '{"options":["Rüzgâr, ağaçların arasında fısıldıyordu.","Zaman, su gibi akıp geçti.","Çocuklar bahçede top oynuyordu.","Kitaplar rafta sıra sıra duruyordu.","Bütün salon ayağa kalkıp alkışladı."],"correctIndex":4}'::jsonb,
  '"Salon" sözcüğü, mekânı değil mekândakileri (izleyicileri) anlatır. Bir adın başka bir varlığın yerine kullanılmasına ad aktarması denir.',
  '"Rüzgâr fısıldıyordu" mecazlı olduğu için ad aktarması sanılır. Oysa bu söz kişileştirmedir; ad aktarmasında bir varlığın adı, ilişkili başka bir varlığın yerine kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yansıma sözcük kullanılmamıştır?',
  '{"options":["Dereden şırıl şırıl su akıyordu.","Sokaktan çocukların gülüşmeleri geliyordu.","Kapı çat diye açıldı.","Ağaçta kuşlar cıvıldıyordu.","Çatıdan damlayan sular tıp tıp ses çıkarıyordu."],"correctIndex":1}'::jsonb,
  'Yansıma sözcükler doğadaki bir sesi taklit ederek oluşur: "şırıl şırıl, çat, cıvıl, tıp tıp". "Gülüşmeler" ses bildirse de bir taklit sözcüğü değildir.',
  'Çocuk sesi, ses çağrışımı yaptığı için yansıma sanılabilir. Yansıma sözcük ise sesi taklit eden kök taşır; "gülmek" fiili bir sesi taklit etmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Bu telefon bir türlü çalışmıyor." cümlesindeki "çalışmak" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Sınava çalışmak için kütüphaneye gitti.","Annem bir bankada çalışıyor.","Ahmet haftada altı gün çalışıyor.","Eski radyo yeniden çalışmaya başladı.","Ödevine çalışırken kardeşi yanına geldi."],"correctIndex":3}'::jsonb,
  'Soru kökünde "çalışmak", bir aletin "işler durumda olması" anlamındadır. Aynı anlam yalnızca radyo cümlesinde vardır; diğerlerinde insanın bir işle uğraşması söz konusudur.',
  '"Çalışmak" sözcüğünün çok sayıda cümlede geçmesi, aday için "bir işte bulunmak" anlamını öne çıkarır. Oysa soruda sözcük bir makinenin işlemesini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  '"Damlaya damlaya göl olur." atasözünün anlattığı düşünce aşağıdakilerin hangisinde vardır?',
  '{"options":["Başladığı işi yarıda bırakan biri hiçbir yere varamaz.","Parayı harcamadan önce iki kez düşünmek gerekir.","Her gün birkaç sayfa okuyan Elif, yıl sonunda onlarca kitabı bitirmişti.","Başkasının işine karışmayan, kendi işinde başarılı olur.","Herkes yaptığının karşılığını eninde sonunda görür."],"correctIndex":2}'::jsonb,
  'Atasözü, küçük birikimlerin zamanla büyük sonuç doğurduğunu söyler. Her gün birkaç sayfa okuyarak onlarca kitaba ulaşan Elif bunun örneğidir.',
  '"Parayı harcamadan önce düşünmek" gibi tasarruf çağrışımı yapan şık, atasözündeki "birikim" fikriyle karıştırılır; ancak atasözü harcamayı değil, küçük adımların birikerek büyümesini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
);
