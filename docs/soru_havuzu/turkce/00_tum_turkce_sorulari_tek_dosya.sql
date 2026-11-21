-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Tüm konular (109 soru) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140 pilot)
-- UYARI: Bu dosya 01_–11_ dosyalarının birleşimidir; ikisi birlikte yüklenirse sorular çiftlenir. Yalnızca birini yükleyin.
-- ==========================================================================


-- ---- Sözcükte Anlam ----
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

-- ---- Cümlede Anlam ----
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
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde neden-sonuç ilişkisi yoktur?',
  '{"options":["Hava kararmadan eve dönmek için acele etti.","Yağmur şiddetini artırdığı için maç ertelendi.","Eğitimini tamamladığından işe hemen alındı.","Sınava yeterince çalışmadığından beklediği notu alamadı.","Aşırı trafik yüzünden toplantıya geç kaldı."],"correctIndex":0}'::jsonb,
  'İlk cümlede "için" bağlacı amaç bildirir: acele etmenin amacı eve karanlıktan önce dönmektir. Diğer cümlelerde eylemin gerekçesi (neden) belirtilmiştir.',
  '"-için" bağlacı hem neden hem amaç bildirir. Aday ilk cümleyi de neden-sonuç sanabilir; oysa burada eylem henüz gerçekleşmemiş bir hedefe yöneliktir, bu yüzden ilişki amaç-sonuçtur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde koşul (şart) anlamı vardır?',
  '{"options":["Gelir gelmez işe koyuldu.","Yorulduğu hâlde çalışmayı sürdürdü.","Çocuk, görmek için parmaklarının ucuna yükseldi.","Kitabı okurken notlar aldı.","Erken kalkarsan treni kaçırmazsın."],"correctIndex":4}'::jsonb,
  '"Kalkarsan" ifadesindeki şart eki, treni kaçırmamanın erken kalkmaya bağlı olduğunu gösterir. Diğer cümlelerde sırasıyla zaman, karşıtlık, amaç ve zaman anlamı vardır.',
  '"Gelir gelmez" gibi ardışık eylemler, zamansal bağ nedeniyle koşul sanılabilir. Koşul anlamı, bir işin gerçekleşmesinin başka bir duruma bağlı olmasıdır; zaman bildiren yapılar bunu belirtmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir karşılaştırma yapılmıştır?',
  '{"options":["Bu kitap kardeşime aittir.","Bu yıl kardeşim, benden daha çok kitap okudu.","Okulun bahçesi çok geniş bir alanı kaplıyor.","Sınavdan bir hafta önce tüm konuları bitirdim.","Annem her sabah erkenden kalkar."],"correctIndex":1}'::jsonb,
  '"Benden daha çok" ifadesi iki kişinin okuma miktarını kıyaslar. Diğer cümlelerde herhangi bir kıyas yoktur.',
  '"Çok geniş bir alan" gibi derece bildiren ifadeler karşılaştırma gibi görünebilir; ancak karşılaştırma için iki varlığın ya da durumun birbirine göre değerlendirilmesi gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Okuma alışkanlığı, bir toplumun kültür düzeyini belirleyen ölçütlerden biridir." cümlesinden aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Kültür düzeyi tek bir ölçütle belirlenmez.","Okuma alışkanlığı kültür düzeyinin göstergelerindendir.","Okumayan toplumlarda kültür düzeyi düşük kalabilir.","Toplumların kültür düzeyini yalnızca okuma alışkanlığı belirler.","Kültür düzeyini belirleyen başka ölçütler de olabilir."],"correctIndex":3}'::jsonb,
  'Cümle, okuma alışkanlığının "ölçütlerden biri" olduğunu söyler. "Yalnızca" ifadesi, tek ölçüt olduğunu ileri sürer; bu yargıya cümleden ulaşılamaz.',
  '"Kültür düzeyi" ve "okuma alışkanlığı" ilişkisi vurgulandığı için aşırı genelleme içeren şık doğru sanılır. Oysa cümledeki "biri" sözü başka ölçütlerin de var olduğunu gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde nesnel bir yargı vardır?',
  '{"options":["İstanbul''un manzarası dünyanın en güzel manzarasıdır.","Bu film, yılın en etkileyici yapımıdır.","Türkiye''nin başkenti Ankara''dır.","Sabah yürüyüşü herkes için çok keyifli bir alışkanlıktır.","Çay, kahveden çok daha lezzetlidir."],"correctIndex":2}'::jsonb,
  'Nesnel yargı kişiden kişiye değişmeyen, doğrulanabilen bilgidir. Başkentin Ankara olması bir olgudur; diğerleri kişisel beğeni bildirir.',
  '"En güzel", "en etkileyici" gibi kesin görünen ifadeler genel kabul gibi algılanabilir. Oysa bunlar kişisel değerlendirmedir ve kanıtlanamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde abartma (mübalağa) vardır?',
  '{"options":["Korkudan kalbi yerinden çıkacaktı.","Sınavdan sonra okul bahçesinde buluştuk.","Yağmurdan sonra hava biraz serinledi.","Annem akşam yemeği için çorba pişirdi.","Toplantı iki saat sürdü."],"correctIndex":0}'::jsonb,
  'Kalbin yerinden çıkması gerçekte olamayacağı hâlde korkunun şiddetini anlatmak için büyütülmüştür; bu abartmadır.',
  '"Hava biraz serinledi" gibi derece bildiren ifadeler abartı sanılabilir. Abartıda gerçek olamayacak ölçüde büyütme vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Erken yatma kararım, yarın çok erken kalkmam gerekmesinden kaynaklanıyor." cümlesiyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Yarın erken kalkacağım için bu akşam geç yatabilirim.","Bu akşam erken yatacağım, çünkü yarın geç kalkacağım.","Erken yatmam gerektiğinden yarın erken kalkamayacağım.","Yarın erken kalkmak için bu akşam hiç uyumayacağım.","Yarın çok erken kalkmam gerektiği için bu akşam erken yatacağım."],"correctIndex":4}'::jsonb,
  'Soru kökünde erken yatmanın nedeni yarın erken kalkma zorunluluğudur. Aynı neden-sonuç ilişkisi yalnızca doğru şıkta korunur.',
  'Diğer şıklar da "erken yatmak" ve "erken kalkmak" sözcüklerini taşıdığı için benzer görünür. Ancak neden ve sonucun yerini değiştirir ya da ilişkiyi tersine çevirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde olasılık anlamı vardır?',
  '{"options":["Mutlaka zamanında gelmeliydi.","Yarın yağmur yağabilir.","Kapıyı kapat.","Ah, keşke daha erken gelseydi.","Çok güzel konuştu."],"correctIndex":1}'::jsonb,
  '"-ebilir" ekiyle kurulan yapı, eylemin gerçekleşmesinin kesin olmadığını, mümkün olduğunu bildirir. Diğer cümlelerde gereklilik, emir, istek ve olumlu bir yargı vardır.',
  '"Keşke gelseydi" gibi dilek bildiren yapılar, kesinlik taşımadığı için olasılıkla karıştırılabilir. Olasılıkta eylemin gerçekleşme ihtimali söz konusudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi diğerlerinden anlamca farklıdır?',
  '{"options":["Bu işi Ali''den başkası yapamaz.","Bu işi yalnızca Ali yapabilir.","Bu işi ancak Ali yapabilir.","Bu işi Ali''nin yanı sıra başkaları da yapabilir.","Bu işi Ali dışında kimse beceremez."],"correctIndex":3}'::jsonb,
  'Dört cümle de işin yalnızca Ali tarafından yapılabileceğini söyler. "Yanı sıra başkaları da" ifadesi ise başka kişilerin de yapabileceğini bildirir.',
  'Bütün cümleler aynı fiil ve aynı kişiyle kurulduğu için aday farkı yakalamakta zorlanır. Anlamı belirleyen, "yalnızca, ancak, başkası yapamaz" gibi sınırlayıcı sözlerdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Başarı, yalnızca yetenekle değil, yetenekle birlikte süreklilik gösteren çabayla da gelir." cümlesine göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Yetenek, başarıda tek başına yeterli sayılmaz.","Çabanın sürekli olması önemlidir.","Başarı için yetenek hiçbir zaman gerekli değildir.","Yetenek ve çaba birlikte başarıya katkı sağlar.","Başarıyı etkileyen birden çok etken vardır."],"correctIndex":2}'::jsonb,
  'Cümle yeteneği reddetmez; yetenekle çabanın birlikte gerekli olduğunu söyler. Yeteneğin hiç gerekli olmadığını ileri süren yargı cümleyle çelişir.',
  '"Yalnızca yetenekle değil" ifadesi, yeteneğin önemsiz olduğu şeklinde yanlış okunabilir. Oysa bu sözde yetenek yadsınmaz, yetersiz bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
);

-- ---- Paragrafta Anlam ve Yapı ----
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
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir kentin kimliği yalnızca tarihî yapılarından ya da meydanlarından oluşmaz. Sokaklarında yankılanan sesler, pazarlarının kokusu, insanların birbirine selam verme biçimi de o kentin ruhunu oluşturur. Kenti anlamak isteyen kişi, rehberlerin gösterdiği yerlerle yetinmemeli, günlük yaşamın içinde dolaşmalıdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Bir kenti tanımak için günlük yaşamın içindeki ayrıntılara da bakmak gerekir.","Tarihî yapılar, bir kentin en önemli özelliğidir.","Rehberler, kenti en iyi tanıtan kişilerdir.","Pazarlar, kentlerin kimliğini belirleyen tek unsurdur.","Kentlerin ruhu zamanla değişir."],"correctIndex":0}'::jsonb,
  'Parçada kentin kimliğinin yalnızca tarihî yapılarla sınırlı olmadığı, günlük yaşamın da onu oluşturduğu vurgulanır. Son cümle bu düşünceyi öneri biçiminde toplar.',
  'İlk cümledeki "tarihî yapılar" ifadesi dikkat çektiği için aday ilk şıkka yönelebilir. Oysa parça bu ifadeyi yetersiz bulur; asıl vurgu günlük yaşamın ayrıntılarındadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle ikisini birlikte düşünmek gerekir.
II. Eğitimde kimileri ezberi, kimileri anlamayı öne çıkarır.
III. Ezber, bilginin kalıcı hâle gelmesine yardımcı olur.
IV. Anlama ise bilgiyi kullanabilmeyi sağlar.
V. Bu yaklaşımlardan yalnızca birine yaslanan öğrenci, eksik bir birikimle yetinmek zorunda kalır.

Numaralanmış cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II. cümle konuyu açar, III ezberi, IV ise "anlama ise" bağlantısıyla anlamayı anlatır. V. cümle yalnızca birine yaslanmanın sonucunu verir, I. cümle ("Bu nedenle") sonuca bağlar. Baştan üçüncü cümle IV.''dür.',
  'III. cümle ezberi anlattığı için baştan üçüncü gibi durur. Ancak IV. cümledeki "ise" bağı onun hemen III.''ten sonra geldiğini gösterir; bu nedenle üçüncü sırada anlamayı anlatan IV. cümle yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  1,
  'Arılar yalnızca bal üretmekle kalmaz; çiçekli bitkilerin üremesini sağlayarak doğal dengenin sürmesine de katkıda bulunur. Dünyadaki gıda ürünlerinin büyük bölümü, tozlaşma için arıların çalışmasına bağlıdır. Bu nedenle arı popülasyonundaki azalma, yalnızca arıcıları değil, bütün canlıları ilgilendiren bir sorun hâline gelmiştir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Bal Üretiminin İncelikleri","Arıların Ekosistemdeki Önemi","Arıcılığın Tarihçesi","Gıda Üretiminde Yeni Teknolojiler","Çiçekli Bitkilerin Sınıflandırılması"],"correctIndex":1}'::jsonb,
  'Parça arıların bal üretiminin ötesinde tozlaşma ve doğal denge açısından taşıdığı önemi anlatır. Bu nedenle en uygun başlık "Arıların Ekosistemdeki Önemi"dir.',
  'Parçanın ilk cümlesinde "bal" geçtiği için aday bal üretimine yönelik bir başlık seçebilir. Oysa parça, balı sadece başlangıç noktası olarak kullanır ve asıl konusu arıların doğadaki rolüdür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  1,
  'Sabahın ilk ışıkları, Boğaz''ın üzerindeki sisi usulca dağıtıyordu. Sahildeki eski yalıların camları pembeye boyanmış, uzaktan gelen vapur düdüğü suyun üstünde yankılanmıştı. Martılar, usta bir ressamın fırça darbeleri gibi gökte gelip gidiyordu.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Öyküleme","Açıklama","Tartışma","Betimleme","Karşılaştırma"],"correctIndex":3}'::jsonb,
  'Parçada olay örgüsü yoktur; görsel ve işitsel ayrıntılarla bir manzara canlandırılır. Bu, betimleyici anlatımdır.',
  '"Gelip gidiyordu", "yankılanmıştı" gibi fiiller hareket çağrışımı yaptığı için aday öyküleme sanabilir. Öykülemede zaman içinde gelişen bir olay örgüsü bulunur; parçada ise yalnızca bir görünüm anlatılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kitap okuma alışkanlığı kazanmak çoğu zaman düşünüldüğü kadar zor değildir. Örneğin her gün yatmadan önce yalnızca on sayfa okuyan biri, bir yılda dört beş kitabı bitirebilir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangisine başvurmuştur?',
  '{"options":["Tanık gösterme","Karşılaştırma","Örnekleme","Tanımlama","Sayısal verilerden yararlanma"],"correctIndex":2}'::jsonb,
  'Yazar "Örneğin" sözüyle somut bir durum gösterip düşüncesini destekler; bu örneklemedir. Sayılar yalnızca örneği somutlaştırır.',
  'Parçada "on sayfa", "dört beş kitap" gibi sayılar geçtiği için sayısal verilerden yararlanma çeldiricisi güçlüdür. Oysa bu sayılar araştırma verisi değil, örneği somutlaştıran ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kısa ve öz yazmak, her zaman az yazmak anlamına gelmez; asıl hüner, gereksiz sözcükleri ayıklayıp anlatılmak isteneni eksiksiz iletebilmektir. Uzun bir metin de gereksiz sözcük içermiyorsa özlü sayılabilir.

Bu parçadan aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Kısa yazılar her zaman özlüdür.","Özlü yazı, gereksiz sözcüklerden arındırılmış yazıdır.","Uzun yazılar da özlü olabilir.","Özlü yazmak, anlatılmak isteneni eksiksiz vermeyi gerektirir.","Özlülük, yazının uzunluğuyla tek başına ölçülmez."],"correctIndex":0}'::jsonb,
  'Parça, özlülüğü uzunluğa değil gereksiz sözcüğün bulunmamasına bağlar. Bu nedenle kısa her yazının özlü olduğu söylenemez.',
  'Başlangıçtaki "kısa ve öz yazmak" ifadesi, kısalık ile özlülüğü eşit tutuyormuş izlenimi verir. Oysa parça hemen ardından bu eşitliği reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Yeni teknolojiler iletişimi hızlandırdı; ancak hızın bedelini yüz yüze konuşmaların azalması olarak ödüyoruz. ....... Çünkü bir mesajın içindeki ses tonu, bakış, jest ve mimikler ekranda kaybolup gidiyor.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Teknoloji, insanlar arasındaki mesafeyi tamamen ortadan kaldırdı.","Yüz yüze görüşmeler artık tamamen gereksiz hâle geldi.","Mesajlaşma, konuşmaya göre daha masrafsız bir yöntemdir.","İletişim araçları her yaştan insan tarafından benzer biçimde kullanılıyor.","Hızlanan iletişim, çoğu zaman anlam zenginliğini yitiriyor."],"correctIndex":4}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, bir önceki yargının gerekçesidir: ses tonu, bakış ve mimikler kaybolduğu için iletişimin anlam zenginliği azalır.',
  '"Mesafeyi ortadan kaldırdı" gibi teknoloji övgüsü içeren şıklar, parçanın ilk cümlesiyle uyumlu görünür. Ancak boşluktan sonra gelen "Çünkü" cümlesi olumsuz bir sonucu gerekçelendirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Çocukların oyun oynaması, yalnızca eğlenmelerini değil sosyal beceriler kazanmalarını da sağlar. (II) Çocuk kitaplarının kapak tasarımları son yıllarda oldukça renklenmiştir. (III) Oyun sırasında paylaşmayı, sırasını beklemeyi ve kurallara uymayı öğrenirler. (IV) Bu nedenle oyun zamanını gereksiz görmek yanlıştır. (V) Oyun, çocuğun hayal gücünü de besleyen en doğal öğrenme yoludur.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":1}'::jsonb,
  'Parça çocuklar için oyunun önemini anlatır. II. cümle ise kitap kapaklarından söz ederek konudan uzaklaşır ve akışı bozar.',
  'II. cümle de çocuklarla ilgili olduğu için konu içinde gibi görünür. Ancak parçanın konusu oyunun çocuk gelişimine katkısıdır; kitap kapağı tasarımı bu bütünlüğün dışında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Üstelik uzun süre uykusuz kalan kişilerde bağışıklık sistemi de zayıflar.
II. Yetersiz uyku, dikkat ve bellek üzerinde olumsuz etki yaratır.
III. Uyku, vücudun kendini yenilediği temel bir ihtiyaçtır.
IV. Bu nedenle uzmanlar, günde en az yedi saat uyumayı önerir.
V. Oysa pek çok kişi bu ihtiyacı küçümseyerek geç saatlere kadar uyanık kalır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra III - V - II - I - IV''tür. III temel bilgiyi verir, V ("Oysa") bunun gözden kaçırıldığını söyler, II ve I olumsuz sonuçları sıralar, IV ("Bu nedenle") sonuç ve öneridir. Baştan ikinci cümle V.''dir.',
  '"Oysa" bağlacı yanlış okunduğunda II. cümle, III.''ün hemen ardından gelen açıklama gibi görünür. Ancak "Oysa" ile başlayan V. cümle III.''ün karşıtı bir durumu belirttiği için hemen onun arkasına yerleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Günümüzde bilgi, ulaşılması kolay bir şey olduğu için değerinin düştüğü sanılıyor. Oysa değerini yitiren bilgi değil, bilgiyle kurulan ilişkidir. Parmak ucundaki sonsuz arşiv, çoğumuza araştırma sabrını değil, hızlı yargıda bulunma alışkanlığını kazandırdı. Bilgiyi bulmak kolaylaştıkça onu sorgulayan ve birleştiren zihinlere duyulan ihtiyaç da artıyor.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Bilgiye erişim kolaylaştığı için bilgi artık değerini yitirmiştir.","Hızlı karar vermek, bilgi çağının en önemli gereğidir.","Bilgiye erişimin kolaylaşması, bilgiyi sorgulama ve yorumlama becerisini daha değerli kılmıştır.","Bilgi miktarı arttıkça insanların araştırma sabrı da artmıştır.","Arşivler, insanları eskisinden daha dikkatli kılmıştır."],"correctIndex":2}'::jsonb,
  'Yazar, "değerini yitiren bilgi değil, bilgiyle kurulan ilişkidir" diyerek asıl sorunu belirler ve son cümlede sorgulayan zihinlere duyulan ihtiyacın arttığını söyler.',
  'İlk cümle ("değerinin düştüğü sanılıyor") bilginin değersizleştiğini düşündürür. Ancak yazar bu görüşü "Oysa" ile hemen reddeder; aday ilk cümleye takılırsa parçanın tersini seçer.',
  array['lisans_gygk']::text[],
  'lisans'
);

-- ---- Sözcükte Yapı ve Ekler ----
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

-- ---- Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil) ----
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

-- ---- Ses Bilgisi ve Ses Olayları ----
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

-- ---- Yazım Kuralları ----
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
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Bir çok kişi toplantıya katıldı.","Birkaç gündür hiçbir haber alamadık.","Her şeyi unutup yeni bir sayfa açtı.","Hiçbir şey olmamış gibi konuştu.","Bugünlerde herkes bir şeyler yapıyor."],"correctIndex":0}'::jsonb,
  '"Birçok" bitişik yazılır. Diğer cümlelerde "birkaç, her şey, hiçbir şey, bir şeyler" doğru yazılmıştır.',
  '"Bir şeyler" ayrı yazıldığı için "bir çok" da ayrı yazılabilirmiş gibi düşünülür. Oysa "birçok" tek sözcüktür ve bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "de/da" bağlacı ya da eki yanlış yazılmıştır?',
  '{"options":["Ankara''da yaşıyor.","Ders çalış da başarılı ol.","Sen de benim gibi düşünüyorsun.","Bugün de erken kalktı.","Çocuklar bahçe de oynuyordu."],"correctIndex":4}'::jsonb,
  '"Bahçe de oynuyordu" cümlesindeki "de" bulunma hâl ekidir ve bitişik yazılmalıdır (bahçede). Diğer cümlelerde doğru kullanım vardır.',
  'Aşırı dikkatli aday her "de"yi ayrı yazılması gereken bağlaç sanabilir. Ancak ek olan "-de" sözcüğe bitişik yazılır; yerine "dahi" konulamıyorsa ektir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "ki" yanlış yazılmıştır?',
  '{"options":["Duydum ki sınav ertelenmiş.","Dünki toplantı çok verimliydi.","Sanki hiçbir şey olmamış gibi konuştu.","Mademki geldin, birlikte yemek yiyelim.","O kadar yorgundu ki hemen uyudu."],"correctIndex":1}'::jsonb,
  'Zaman bildiren "dün" sözcüğüne gelen ek "-kü" biçimindedir: "dünkü". "Dünki" yanlıştır. Diğerlerinde bağlaç olan "ki" ayrı, "sanki" ve "mademki" bitişik yazılmıştır.',
  '"Ki" ilgi eki olduğu için bitişik yazıldığı bilinse de, ünlü uyumuna girip "-kü" olduğu gözden kaçar. Aday "dünki"yi doğru sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde büyük harflerin kullanımı bakımından bir yanlışlık vardır?',
  '{"options":["Ankara''dan İstanbul''a trenle gittik.","Karadeniz''in iklimi nemlidir.","Atatürk Orman Çiftliği''ni gezdik.","Yarın Pazartesi toplantı var.","Türk Dil Kurumu yeni bir sözlük yayımladı."],"correctIndex":3}'::jsonb,
  'Gün ve ay adları özel isim sayılmaz, küçük harfle başlar: "pazartesi". Diğer cümlelerde özel adlar doğru yazılmıştır.',
  'Takvimle ilgili adlar belirgin olduğu için büyük harfle yazılabileceği sanılır. TDK kurallarına göre gün ve ay adları küçük harfle yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde sayıların yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Yirmi beş kişi toplantıya katıldı.","Kitabın yüz kırkıncı sayfasını okudu.","Ellibeş kişi toplantıya katıldı.","On altı yaşındaki genç, ödülü aldı.","Üç yüz yirmi lira ödedi."],"correctIndex":2}'::jsonb,
  'Sayılar, rakamla yazılmıyorsa ayrı yazılır: "elli beş". "Ellibeş" yanlıştır.',
  '"Yirmibeş" gibi bitişik yazımlar günlük yazışmada sık görüldüğü için doğru sanılabilir. Kurala göre sayıların her bir sözcüğü ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Yeni şöför araçla ilgili bilgi verdi.","Herkes toplantıya zamanında geldi.","Sürpriz parti herkesi şaşırttı.","Yanlış anlaşılma hemen giderildi.","Antrenör takımın çalışmalarını izledi."],"correctIndex":0}'::jsonb,
  'Doğru yazım "şoför"dür. Diğer sözcükler (herkes, sürpriz, yanlış, antrenör) doğru yazılmıştır.',
  'Yabancı kökenli sözcüklerin telaffuza göre yazılması sık yapılan bir hatadır. "Şöför" okunuşa yakın görünse de TDK yazımı "şoför"dür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı vardır?',
  '{"options":["Önerisini kabul etmedi.","Bu durumu hissetti.","Yardım etmek istedi.","Dosyayı reddetti.","Hatayı af etti ve konuyu kapattı."],"correctIndex":4}'::jsonb,
  'Ses olayına (ünsüz ikizleşmesine) uğrayan birleşik fiiller bitişik yazılır: "affetti". "Af etti" yanlıştır. "Kabul etmek" ve "yardım etmek" ise ayrı yazılır.',
  '"Yardım etmek" ve "kabul etmek" ayrı yazıldığı için "af etmek" de ayrı yazılabilirmiş sanılır. Oysa "af" sözcüğünün sonundaki ünsüz ikileşerek birleşik fiil oluşturur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ikilemelerin yazımında yanlışlık vardır?',
  '{"options":["Kös kös oturup bekledi.","Çoluk-çocuk bayramda büyüklerinin ellerini öptü.","Eski püskü elbiseler giymişti.","Yavaş yavaş yürüyüp köye ulaştı.","Hızlı hızlı konuşmaya başladı."],"correctIndex":1}'::jsonb,
  'İkilemeler ayrı yazılır, arasına tire konmaz: "çoluk çocuk". Diğer şıklarda ikilemeler doğru yazılmıştır.',
  'Birbirini tamamlayan sözcükler arasına tire konabileceği sanılır. TDK kurallarına göre ikilemeler ayrı yazılır, tire kullanılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "mi" soru ekinin yazımı yanlıştır?',
  '{"options":["Gelecek misin?","Sen mi söyledin?","Güzel mi güzel bir manzaraydı.","Yarın bize geleceklermi?","Yorgun musunuz?"],"correctIndex":3}'::jsonb,
  'Soru eki "mi" her zaman ayrı yazılır: "gelecekler mi". Diğer cümlelerde ek doğru yazılmıştır.',
  'Ek gibi görünen "mi" sözcüğünün çekim eki sanılması yaygın hatadır. Soru eki ayrı yazılsa da ses uyumuna uyar ve kendinden önceki sözcüğe bitişmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı yoktur?',
  '{"options":["Birşey söylemeden ayrıldı.","Hiç bir zaman pes etmedi.","Herkes bir şeyler söylemek istiyordu.","Her hangi bir sorun çıkmadı.","Bir kaç gün sonra döneceğini söyledi."],"correctIndex":2}'::jsonb,
  'Doğru yazımlar "bir şey", "hiçbir", "herhangi" ve "birkaç"tır. Diğer cümlelerde bu sözcükler yanlış yazılmıştır; yalnızca "bir şeyler" doğru yazılmıştır.',
  'Her şıkta bitişik-ayrı yazım karışıklığı olduğu için aday doğru olanı seçmekte zorlanır. "Birşey, hiç bir, her hangi, bir kaç" ifadelerinin tamamı hatalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
);

-- ---- Noktalama İşaretleri ----
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
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde virgül yanlış kullanılmıştır?',
  '{"options":["Sınıfa girdi, ve sessizce yerine oturdu.","Sevgili Ayşe, seni çok özledim.","Yarın, hava güzel olursa, pikniğe gideceğiz.","Elma, armut, portakal ve muz aldık.","Gitti ama dönmedi."],"correctIndex":0}'::jsonb,
  '"Ve" bağlacından önce virgül konmaz. Diğer cümlelerde virgül hitap, ara söz ve sıralama için doğru kullanılmıştır.',
  'Bağlaçlardan önce virgül konabileceği düşünülür. "Ve" gibi sıralayıcı bağlaçlardan önce virgül gerekmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?',
  '{"options":["Yarın gelmezse; ona haber veririm.","Çiçekler; gül, lale ve karanfildi.","Dün; çok yoruldum.","Ahmet; evde kalmak istedi.","Bahçede güller, laleler açmıştı; ağaçlar ise henüz çiçek açmamıştı."],"correctIndex":4}'::jsonb,
  'Noktalı virgül, içinde virgül bulunan ya da birbirine yakın bağımsız yargıları ayırır. Doğru şıkta virgüllü ögeler noktalı virgülle birbirinden ayrılmıştır.',
  'Şart bildiren yapılardan sonra noktalı virgül konabileceği sanılır. Oysa "gelmezse" gibi şart ifadesi, cümle bütünlüğünü bozmaz ve ayırmaya gerek duyurmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde iki nokta yanlış kullanılmıştır?',
  '{"options":["Ayşe: Yarın gelecek misin?","Dün akşam: çok yoruldum.","Çiçekler: gül, lale, karanfil.","Annem şöyle dedi: \"Erken dön.\"","Şunu unutma: sözünü tut."],"correctIndex":1}'::jsonb,
  'İki nokta, açıklama yapılacağını ya da örnek verileceğini bildirir. "Dün akşam" bir açıklama beklemediği için iki nokta kullanılmaz.',
  'Zaman bildiren sözcüklerden sonra iki nokta gelebileceği düşünülür. Oysa iki nokta açıklama, sıralama veya aktarma öncesinde kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?',
  '{"options":["Ankara''da yaşıyor.","Atatürk''ün fikirleri hâlâ yol gösteriyor.","Ahmet''in kitabı masada duruyordu.","İstanbul''lu bir arkadaşım var.","1920''de açıldı."],"correctIndex":3}'::jsonb,
  'Yapım ekleri özel adlardan sonra kesme işaretiyle ayrılmaz: "İstanbullu". Diğer cümlelerde çekim ekleri doğru kesmeyle ayrılmıştır.',
  'Özel adlara gelen her ekin kesmeyle ayrıldığı sanılır. Oysa yalnızca çekim ekleri kesmeyle ayrılır; yapım ekleri ayrılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde soru işareti yanlış kullanılmıştır?',
  '{"options":["Nereye gidiyorsun?","Saat kaç?","Nereye gittiğini sordum?","Bunu sen mi yaptın?","Yarın gelecek misin?"],"correctIndex":2}'::jsonb,
  'Dolaylı sorularda soru işareti kullanılmaz. "Nereye gittiğini sordum" haber cümlesidir ve nokta ile biter.',
  'İçinde "nereye" gibi soru sözcüğü bulunduğu için cümle soru sanılır. Cümle soruyu aktarıyorsa nokta ile bitirilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde nokta işareti yanlış kullanılmıştır?',
  '{"options":["Cumhuriyet, 29. Ekim 1923''te ilan edildi.","5. sınıfa geçti.","Toplantı saat 17.30''da başlayacak.","Dr. Ayşe Kaya muayeneye başladı.","Kitabın 3. bölümünü okudu."],"correctIndex":0}'::jsonb,
  'Tarihte gün ve ay arasına nokta konmaz. "29 Ekim 1923" biçiminde yazılır. Diğer cümlelerde sıra sayısı, saat ve kısaltma noktaları doğrudur.',
  '"29." sıra sayısı olduğu için "29. Ekim" doğru görünebilir. Ancak tarihin içindeki gün rakamı sıra sayısı değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde tırnak işareti, başkasından aktarılan söz için kullanılmıştır?',
  '{"options":["\"Cimri\" sözcüğünün anlamını sordu.","Roman, \"Çalıkuşu\" adını taşıyor.","Sözcüğü \"anlam\" olarak yazdı.","\"Güzel\" sözcüğü bu cümlede zarftır.","Öğretmen: \"Yarın sınav var.\" dedi."],"correctIndex":4}'::jsonb,
  'Tırnak işareti doğru şıkta öğretmenin sözünü aynen aktarmak için kullanılmıştır. Diğerlerinde sözcük vurgulama, eser adı belirtme amacı vardır.',
  'Tırnakla yazılan her sözün aktarma olduğu sanılır. Aktarmada bir kişinin söylediği söz değiştirilmeden verilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde virgül kullanılması gerekmez?',
  '{"options":["Evet, bu konuda haklısın.","Dün akşam geç saatte yola çıktık.","Ali, bana kitabı getir.","Kitap okumayı severim, ancak vaktim yok.","Sevgili dostum, mektubunu aldım."],"correctIndex":1}'::jsonb,
  'Doğru şıkta sıralama, hitap ya da ara söz yoktur; cümle bütün olarak akar ve virgül gerektirmez. Diğer cümlelerde hitap, evet ve bağlaç öncesi virgül gerekir.',
  '"Dün akşam geç saatte" gibi zaman bildiren öbekler uzun olduğu için sonrasına virgül konabileceği düşünülür. Oysa cümlenin akışı bozulmadığı sürece virgül gerekmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde noktalama yönünden bir yanlışlık yoktur?',
  '{"options":["Ayşe''ye sordum, nereye gidiyorsun?","Ankara''dan İstanbul''a, geldim.","Ne güzel bir gün; diye düşündü.","Sevgili dostum, mektubunu aldım.","Dün gece: erkenden yattık."],"correctIndex":3}'::jsonb,
  'Hitap sözünden sonra virgül konur; doğru şıkta noktalama kurala uygundur. Diğer cümlelerde soru işareti, virgül, noktalı virgül ve iki nokta yanlış kullanılmıştır.',
  'Her şıkta bir noktalama işareti bulunduğu için aday hepsinin doğru olduğunu sanabilir. Yanlış kullanımlar şıkların içinde gizlidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde virgül, eş görevli sözcükleri ayırmak için kullanılmıştır?',
  '{"options":["Sevgili dostum, nasılsın?","Yarın, hava güzelse, geleceğim.","Çarşıdan ekmek, süt, yumurta aldım.","Kitabı okudum, ama beğenmedim.","Evet, bu doğru."],"correctIndex":2}'::jsonb,
  'Doğru şıkta "ekmek, süt, yumurta" aynı görevdeki sözcükleri sıralar. Diğer cümlelerde virgül hitap, ara söz, bağlaç öncesi ve cevap sözü için kullanılmıştır.',
  'Her cümlede virgül bulunduğu için işlevi ayırt etmek zordur. Sıralama virgülü, aynı türden öğeleri art arda getirir.',
  array['lisans_gygk']::text[],
  'lisans'
);

-- ---- Cümlenin Ögeleri ve Cümle Türleri ----
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

-- ---- Anlatım Bozuklukları ----
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
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde gereksiz sözcük kullanımı vardır?',
  '{"options":["Toplantıya daha önceden herkesi çağırdık.","Yarın sabah erkenden kalkıp işe gideceğim.","Kitabı okuduktan sonra bana ver.","Çocuklar parkta uzun süre oynadı.","Yeni evimiz oldukça geniş."],"correctIndex":0}'::jsonb,
  '"Daha önce" ve "önceden" aynı anlamı taşır; birlikte kullanılması gereksiz tekrardır.',
  '"Daha" sözcüğü derece bildirdiği için gerekli görünür. Oysa "önceden" ile birlikte kullanıldığında aynı zaman anlamı iki kez verilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde özne-yüklem uyumsuzluğu vardır?',
  '{"options":["Biz bu işi yapmak istiyoruz.","O, bu işi yapmak istiyor.","Siz bu işi yapmak istiyorsunuz.","Sen bu işi yapmak istiyorsun.","Ben bu işi yapmak istiyor."],"correctIndex":4}'::jsonb,
  '"Ben" öznesi birinci tekil kişidir; yüklemin "istiyorum" olması gerekir. "İstiyor" üçüncü tekil kişidir. Diğer şıklarda özne ile yüklemin kişi ekleri uyumludur.',
  'Cümleler birbirine çok benzediği için aday kişi eklerini hızlıca okuyup geçebilir. Her şıkta öznenin kişisi ile yüklemin kişi ekini tek tek karşılaştırmak gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde anlam çelişkisi vardır?',
  '{"options":["Salon küçük olduğu için herkes sığmadı.","Yalnızca birkaç kişi geldi, salon tamamen doldu.","Birkaç kişi geldi, bu yüzden toplantı ertelendi.","Sınıf kalabalıktı, herkes zor oturdu.","Toplantıya çok kişi katıldı."],"correctIndex":1}'::jsonb,
  '"Yalnızca birkaç kişi" ile "salon tamamen doldu" ifadeleri birbiriyle çelişir.',
  'Salonun dolması için çok kişi gelmesi gerekir. "Birkaç kişi" ifadesi bunu desteklemediği için çelişki oluşur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde anlam belirsizliği vardır?',
  '{"options":["Sabah erkenden kalkıp işe gitti.","Kitabı okuduktan sonra bana verdi.","Dün akşam arkadaşım bize geldi.","Onu çok seven arkadaşıyla gezmeye çıktı.","Annem bana yeni bir elbise aldı."],"correctIndex":3}'::jsonb,
  '"Onu çok seven arkadaşıyla" ifadesinde sevenin kim olduğu belirsizdir: arkadaşı mı, kendisi mi? Bu anlam belirsizliği yaratır.',
  'Cümle düzgün kurulmuş gibi göründüğü için aday belirsizliği fark etmeyebilir. İfade iki farklı biçimde okunabiliyorsa belirsizlik vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ortak öge kullanımından kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Ahmet''i hem severim hem sayarım.","Ahmet''i çok severim ve ona saygı duyarım.","Ahmet''i çok severim ve saygı duyarım.","Ahmet''e hem sevgi duyarım hem saygı beslerim.","Ahmet''i ve Mehmet''i ziyaret ettim."],"correctIndex":2}'::jsonb,
  '"Sevmek" fiili belirtili nesne (-i) ister, "saygı duymak" ise dolaylı tümleç (-e) ister. Tek öğeyle iki yüklem kullanılırsa ortak öge hatası oluşur.',
  'Cümleler akıcı göründüğü için hata fark edilmeyebilir. Yüklemlerin istediği ekler farklı olduğunda aynı ögeyi ortak kullanmak bozukluğa yol açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde deyim yanlış kullanılmıştır?',
  '{"options":["Bu konuyu yönetim kurulunda masaya yattık.","Çocuğun sözlerine kulak verdi.","Önceki hatalarına göz yumdu.","Yeni göreve başlayınca işlerin başını çekti.","Verilen sözü tutmak için elinden geleni yaptı."],"correctIndex":0}'::jsonb,
  'Doğru deyim "masaya yatırmak"tır; yani bir konuyu derinlemesine ele almak. "Masaya yattık" bu hâliyle yanlış kullanılmıştır.',
  '"Masaya yatmak" ifadesi deyim gibi görünür. Ancak kalıplaşmış deyim "masaya yatırmak"tır ve çekimi bu şekilde yapılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde karşılaştırmadan kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Bu yılın soruları geçen yılın sorularından daha zordu.","Bu yılın sınavı geçen yılınkinden daha zordu.","Bu yıl sorulan sorular, geçen yılkilerden daha zordu.","Bu yılın sınavı, geçen yılın sınavından daha zordu.","Bu yılın soruları geçen yılın sınavından daha zordu."],"correctIndex":4}'::jsonb,
  'Karşılaştırmada aynı türden varlıklar kıyaslanmalıdır. "Sorular" ile "sınav" farklı varlıklardır; bu nedenle kıyas mantıksızdır.',
  'Cümle akıcı olduğu için hata fark edilmez. Karşılaştırmanın iki tarafı da aynı türden olmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde anlatım bozukluğu yoktur?',
  '{"options":["Kimse bir şey söylemedi, ancak herkes konuşuyordu.","Yarın sabah erkenden evden çıkıp hemen işe gideceğim.","Ben bu soruları çözmek istiyorsun.","Daha önceden haberimiz olsaydı gelirdik.","Geri geri geriye döndü."],"correctIndex":1}'::jsonb,
  'Doğru şık anlam, uyum ve tekrar bakımından sorunsuzdur. Diğer cümlelerde çelişki, uyumsuzluk ve gereksiz sözcük vardır.',
  '"Hemen" ve "erkenden" birlikte kullanıldığı için tekrar sanılabilir. Ancak ikisi farklı kavramları anlatır: zaman ve ardışıklık.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde neden-sonuç mantığı bakımından bir bozukluk vardır?',
  '{"options":["Yağmur yağdığı için sokaklar ıslandı.","Sınava çalıştığı için başarılı oldu.","Çok yorulduğundan erken yattı.","Çok sağlam olmadığı için bu köprüden geçmek tehlikeli değildir.","Hava soğuk olduğu için montunu giydi."],"correctIndex":3}'::jsonb,
  'Köprünün sağlam olmaması geçmenin tehlikeli olduğunu gösterir. Cümle bunun tersini söylediği için neden-sonuç ilişkisi mantıksızdır.',
  'Cümlede "için" bağlacı kullanıldığı için neden-sonuç bağı kurulmuş gibi görünür. Ancak bağın içeriği çelişkilidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisi anlatım bozukluğu bakımından diğerlerinden farklıdır?',
  '{"options":["Geri geri geriye döndü.","Daha önceden herkesi uyarmıştı.","Ben bu soruları çözmek istiyorsun.","Ortalama olarak yaklaşık yüz kişi geldi.","Ayrıca ek olarak bir de ödül verdiler."],"correctIndex":2}'::jsonb,
  'Diğer cümlelerde gereksiz sözcük kullanımı vardır. Doğru şıkta ise özne ile yüklem arasında kişi uyumsuzluğu vardır.',
  'Hepsinde bir hata bulunduğu için aday ayrım yapmakta zorlanır. Soru, hata türünün farklı olduğu cümleyi ister.',
  array['lisans_gygk']::text[],
  'lisans'
);

-- ---- Sözel Mantık ve Muhakeme ----
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

