-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · KARMA PARTİ 1 (yazım, noktalama, sözcükte anlam, sözel mantık) (30 soru, zorluk 2-3) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140)
-- Kullanıcı, partileri tek tek onaylamadan üretime devam talimatı verdi (2026-11-21); bu parti ayrıca gözden geçirilmedi. Supabase'e yüklenmedi.
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
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Hiçbir sorun yok.","Birkaç gün sonra döneceğim.","Herşey yolunda gidiyor.","Her şey hazır.","Herkes geldi."],"correctIndex":2}'::jsonb,
  '"Her şey" ayrı yazılır. "Herşey" yanlıştır. Diğer cümlelerde "hiçbir, birkaç, her şey, herkes" doğru yazılmıştır.',
  '"Herkes" ve "birkaç" bitişik yazıldığı için "her şey" de bitişik sanılabilir. Oysa "her şey" iki sözcüktür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde sayıların yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Sınıfta otuzbeş öğrenci vardı.","Sınıfta otuz beş öğrenci vardı.","Kitabın yüz yirminci sayfasına geldi.","Beş yüz lira ödedi.","Kırk yıllık dostum geldi."],"correctIndex":0}'::jsonb,
  'Sayılar rakamla yazılmıyorsa ayrı yazılır: "otuz beş". "Otuzbeş" yanlıştır.',
  'Günlük yazışmalarda bitişik yazılan sayılar doğru sanılabilir. Kurala göre her sözcük ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Yine de gelmek istedi.","Ne kadar çalışırsan çalış yinede başaramazsın.","Sen de bizimle gel.","Bunu herkes biliyor ki sen bilmiyorsun.","Ben de aynı şeyi düşünüyorum."],"correctIndex":1}'::jsonb,
  '"Yine de" iki ayrı sözcük olarak yazılır. "Yinede" yanlıştır.',
  '"Yine" ve "de" kısa sözcükler olduğu için bitişik yazılabilirmiş sanılır. Kurala göre bağlaç olan "de" ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "mi" soru ekinin yazımı yanlıştır?',
  '{"options":["Yarın gelecek misin?","Bu çanta senin mi?","Hasta mısın?","Bu kitabı sen mi okudun, yoksa kardeşinmi?","Sen de mi geliyorsun?"],"correctIndex":3}'::jsonb,
  'Soru eki "mi" her zaman ayrı yazılır: "kardeşin mi". "Kardeşinmi" yanlıştır.',
  'Cümlenin ilk yarısında "mi" doğru yazıldığı için aday ikinci kullanımı gözden kaçırabilir. Her "mi" ayrı ayrı kontrol edilmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Yarın sizi arayacağım.","Bu konuyu anlatabileceğim.","Yarın erken kalkacağız.","Onu görebileceksin.","Bu konuyu yarın detaylı anlatamıyacağım."],"correctIndex":4}'::jsonb,
  'Ünlüyle biten fiillere gelecek zaman eki -ecek/-acak gelirken araya "y" girer: "anlatamayacağım". "Anlatamıyacağım" yanlıştır.',
  '"Anlatamıyorum" gibi şimdiki zaman biçimleri bu hatayı çağrıştırır. Gelecek zamanda ek "-ya-" değil "-yacak"tır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde büyük harflerin kullanımı bakımından bir yanlışlık vardır?',
  '{"options":["Ankara''ya trenle gittik.","Kızılay Meydanı kalabalıktı.","Dün akşam anadolu''dan İstanbul''a geldik.","Karadeniz''in iklimi yağışlıdır.","Ahmet''in kitabı masada duruyordu."],"correctIndex":2}'::jsonb,
  'Özel adlar büyük harfle başlar: "Anadolu". "anadolu''dan" yanlıştır.',
  'Kesme işareti kullanıldığı için sözcüğün özel ad olduğu gözden kaçırılabilir. Kesme işaretiyle ayrılan ad, büyük harfle başlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı yoktur?',
  '{"options":["Herhangi biri gelebilir.","Birşeyler yemek istedi.","Pekçok kişi toplantıya katıldı.","Hiçbirşey söylemedi.","Yinede geldi."],"correctIndex":0}'::jsonb,
  'İlk cümledeki "herhangi" bitişik yazılmıştır ve doğrudur. Diğerlerinde "bir şeyler, pek çok, hiçbir şey, yine de" bitişik yazılmıştır; hepsi yanlıştır.',
  'Her şıkta bitişik-ayrı yazım karışıklığı olduğu için aday doğru olanı seçmekte zorlanır. "Herhangi" tek sözcüktür ve bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde birleşik fiil yanlış yazılmıştır?',
  '{"options":["Maçı kaybettik.","Teklifi red etti.","Önerimi reddetti.","Bu durumu hissediyorum.","Hatamı affetti."],"correctIndex":1}'::jsonb,
  'Ses olayına uğrayan birleşik fiiller bitişik yazılır: "reddetti". "Red etti" yanlıştır.',
  '"Kabul etmek" ve "yardım etmek" ayrı yazıldığı için "red etmek" de ayrı sanılabilir. Oysa "reddetmek" ünsüz ikizleşmesi nedeniyle bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde soru işareti yanlış kullanılmıştır?',
  '{"options":["Kaç yaşındasın?","Sen kaç yaşındasın?","Bunu kim yaptı?","Kaç yaşında olduğunu sordum?","Yarın gelecek misin?"],"correctIndex":3}'::jsonb,
  'Dolaylı sorularda soru işareti kullanılmaz; cümle nokta ile biter.',
  '"Kaç" soru sözcüğü içerdiği için cümle soru sanılabilir. Cümle soruyu aktarıyorsa nokta ile bitirilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?',
  '{"options":["Ankara''dan gelen tren geç kaldı.","Ahmet''in kitabı masadaydı.","1990''da doğdu.","Atatürk''ün sözleri hâlâ yol gösteriyor.","Türkiye''li turistler şehre geldi."],"correctIndex":4}'::jsonb,
  'Yapım ekleri özel adlardan sonra kesme işaretiyle ayrılmaz: "Türkiyeli". Diğer cümlelerde çekim ekleri doğru ayrılmıştır.',
  'Özel adlara gelen her ekin kesmeyle ayrıldığı sanılır. Yalnızca çekim ekleri kesmeyle ayrılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde hitap sözünden sonra yanlış noktalama kullanılmıştır?',
  '{"options":["Sevgili Ayşe, seni çok özledim.","Ahmet, buraya gel.","Sevgili Ayşe: Seni çok özledim.","Sayın Müdürüm, size bir şey soracağım.","Çocuklar, sessiz olun."],"correctIndex":2}'::jsonb,
  'Hitap sözünden sonra virgül konur. Doğru şıkta iki nokta kullanılması yanlıştır.',
  'İki nokta bir açıklama bekleyen yapılardan sonra kullanıldığı için hitap sonrası kullanılabilirmiş sanılır. Kurala göre hitap sözünden sonra virgül gelir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde nokta işareti yanlış kullanılmıştır?',
  '{"options":["Dr Ayşe Kaya muayeneye başladı.","Dr. Ayşe Kaya muayeneye başladı.","5. sınıfa geçti.","Toplantı saat 17.30''da başlayacak.","Prof. Dr. Ahmet Yılmaz konuştu."],"correctIndex":0}'::jsonb,
  'Kısaltmaların sonuna nokta konur: "Dr.". "Dr" yazılması noktalama yanlışıdır.',
  'Günlük yazışmalarda noktasız yazılan kısaltmalar doğru sanılabilir. Unvan kısaltmalarında nokta gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?',
  '{"options":["Merhaba; nasılsın?","Bahçede güller, laleler açmıştı; ağaçlar ise henüz çiçek açmamıştı.","Dün; çok yoruldum.","Gelirsen; seni beklerim.","Annem; yemek yaptı."],"correctIndex":1}'::jsonb,
  'Noktalı virgül, içinde virgül bulunan ya da birbirine yakın bağımsız yargıları ayırır. Doğru şıkta virgüllü ögeler noktalı virgülle birbirinden ayrılmıştır.',
  'Hitap, zaman ve özne sonrasında noktalı virgül kullanılabileceği sanılır. Oysa noktalı virgül bağımsız cümleleri ayırmak içindir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde virgül, hitap için kullanılmıştır?',
  '{"options":["Elma, armut, muz aldım.","Evet, haklısın.","Yarın, hava güzelse, gideriz.","Ahmet, buraya gel.","Geldi, gördü, gitti."],"correctIndex":3}'::jsonb,
  '"Ahmet" seslenilen kişidir; hitap sözünden sonra virgül konur. Diğer cümlelerde sıralama, cevap sözü, ara söz ve sıralı cümle virgülü vardır.',
  'Her cümlede virgül bulunduğu için işlevi ayırt etmek zordur. Hitap virgülü, seslenilen kişiyi cümleden ayırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde iki nokta yerinde kullanılmıştır?',
  '{"options":["Dün: sinemaya gittim.","Kitap: okumak güzeldir.","Annem: yemek yaptı.","Yarın: hava güzel olacak.","Sepetimde şunlar vardı: elma, armut, muz."],"correctIndex":4}'::jsonb,
  'İki nokta, açıklama yapılacağını bildirir; "şunlar vardı" ifadesinden sonra gelen sıralama için doğru kullanılmıştır.',
  'Zaman bildiren sözcüklerden sonra iki nokta konabileceği sanılır. Oysa iki nokta açıklama, sıralama ya da aktarma öncesinde kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?',
  '{"options":["Çocuk İstanbul''a gitti.","Ankara''nın havası soğuk.","Çocuk okul''a gitti.","Ayşe''nin kitabı masada.","1920''de açıldı."],"correctIndex":2}'::jsonb,
  'Cins adlara gelen ekler kesmeyle ayrılmaz: "okula". Özel adlara gelen ekler ise kesmeyle ayrılır.',
  'Her ekin kesmeyle ayrılabileceği sanılır. Kesme işareti yalnızca özel adlarda ve sayılarda kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "dil" sözcüğü bir iletişim sistemi anlamında kullanılmıştır?',
  '{"options":["Bir dili öğrenmek, yeni bir dünyanın kapısını açar.","Çocuk dilini çıkarıp kardeşine yüz yaptı.","Dilini ısırıp sustu.","Yemeğin tadını dilinde hissetti.","Doktor hastadan dilini göstermesini istedi."],"correctIndex":0}'::jsonb,
  'İlk cümlede "dil", insanların anlaşmasını sağlayan sistem anlamındadır. Diğer cümlelerde sözcük vücut organını bildirir.',
  '"Dil" sözcüğü organ anlamıyla çok kullanıldığı için aday ilk anlamı seçebilir. Soru, iletişim sistemi anlamını arar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi "önemsemek" sözcüğü ile yakın anlamlıdır?',
  '{"options":["hafife almak","ciddiye almak","göz ardı etmek","unutmak","reddetmek"],"correctIndex":1}'::jsonb,
  '"Önemsemek" ve "ciddiye almak", bir şeye değer vermek anlamında yakındır. Diğer sözcükler karşıt ya da ilgisiz anlamlar taşır.',
  '"Hafife almak" ve "göz ardı etmek" "önemsemek" sözcüğünün karşıt anlamlılarıdır; aday karşıtlıkla yakınlığı karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisinin karşıtı "gerçek"tir?',
  '{"options":["doğru","sahici","somut","hayal","kesin"],"correctIndex":3}'::jsonb,
  '"Gerçek" sözcüğünün karşıtı "hayal"dir. "Doğru, sahici, somut, kesin" gerçeklikle ilişkili ya da yakın anlamlı sözcüklerdir.',
  '"Doğru" sözcüğü bazen "gerçek"in karşıtı sanılan "yanlış"la ilişkilendirilir. Oysa "gerçek"in karşıtı gerçekdışı olan hayaldir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Ateş olmayan yerden duman çıkmaz." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Duman çıkan yerde ateş yoktur.","Ateşi yakan, dumanı da söndürür.","Dumansız yerde ateş yanmaz.","Ateş kullanırken dikkatli olunmalıdır.","Söylentilerin çoğu zaman bir dayanağı vardır."],"correctIndex":4}'::jsonb,
  'Atasözü, bir söylentinin ya da dedikodunun çoğu zaman gerçek bir nedene dayandığını anlatır.',
  'Atasözündeki ateş-duman sözcükleri doğrudan ateşle ilgili şıklara yönlendirir. Oysa atasözü mecazlı bir anlam taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Üzüm üzüme baka baka kararır." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Üzüm, güneşte çabuk kararır.","Her insan kendi yolunu seçer.","İnsanlar, çevrelerindekilerden etkilenerek onlara benzer.","Aynı bağdaki üzümler birbirinden farklıdır.","Çok bakmak, görmeyi azaltır."],"correctIndex":2}'::jsonb,
  'Atasözü, bir arada bulunanların birbirinden etkilendiğini söyler.',
  '"Üzümün kararması" gerçek bir olay gibi okunduğundan aday bunu tarımla ilgili sanabilir. Atasözü insanlar arasındaki etkileşimi anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi soyut anlamlıdır?',
  '{"options":["adalet","kapı","masa","elma","bulut"],"correctIndex":0}'::jsonb,
  '"Adalet" duyularla algılanamayan bir kavramdır; soyuttur. Diğerleri somut varlıklardır.',
  '"Bulut" elle tutulamadığı için soyut sanılabilir. Oysa bulut gözle görüldüğü için somuttur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Güneş çıkınca yola koyuldular." cümlesindeki "çıkmak" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Merdivenlerden hızla çıktı.","Dağın ardından ay çıktı.","Yeni kitabı bu yıl çıkacak.","Evden erkenden çıktı.","Tüm sınavlardan başarıyla çıktı."],"correctIndex":1}'::jsonb,
  'Soru kökünde "çıkmak", belirmek, ortaya görünmek anlamındadır. Aynı anlam "ay çıktı" ifadesinde de vardır.',
  '"Çıkmak" sözcüğü çok sık hareketle ilişkilendirildiği için aday yer değiştirme anlamlı şıklara yönelebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Alp, Bilge, Cansu, Derya, Eren adlı 5 kişi bir sırada beklemektedir. Bilge, Alp''tan öndedir. Eren, Derya''dan öndedir. Alp, Eren''in hemen arkasındadır. Derya en arkada değildir.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Alp","Cansu","Derya","Bilge","Eren"],"correctIndex":3}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Bilge - Eren - Alp - Derya - Cansu. Baştan 1. sırada Bilge vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Eren) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Furkan, Gökçe, Hülya, İsmail, Jale, Kerem adlı 6 kişi bir sırada beklemektedir. Furkan en önde değildir. Hülya 6. sıradadır. Kerem, Gökçe''nin hemen arkasındadır. Furkan, İsmail''den öndedir. Gökçe, Jale''nin hemen arkasındadır.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Furkan","Gökçe","İsmail","Jale","Hülya"],"correctIndex":3}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Jale - Gökçe - Kerem - Furkan - İsmail - Hülya. Baştan 1. sırada Jale vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Gökçe) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Mine, Nehir, Onur adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Onur, kedi beslemez. Onur kırmızıyı sevmez. Maviyi seven kişi kuş beslemez. Mine yeşili sever. Kırmızıyı seven kişi kedi beslemez.

Buna göre Nehir hangi hayvanı besler?',
  '{"options":["kedi","köpek","kuş","Belirlenemez","Hiçbir hayvan beslemez"],"correctIndex":2}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Mine yeşili sever ve kedi besler; Nehir kırmızıyı sever ve kuş besler; Onur maviyi sever ve köpek besler. Nehir kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Pınar, Rüya, Sarp adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Sarp yeşili sevmez. Yeşili seven kişi köpek beslemez. Pınar yeşili sevmez. Rüya, kuş beslemez. Kırmızıyı seven kişi kuş beslemez. Sarp kırmızıyı sevmez.

Buna göre Sarp hangi hayvanı besler?',
  '{"options":["kuş","kedi","köpek","Belirlenemez","Hiçbir hayvan beslemez"],"correctIndex":0}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Pınar kırmızıyı sever ve köpek besler; Rüya yeşili sever ve kedi besler; Sarp maviyi sever ve kuş besler. Sarp kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Çalışırsam sınavı geçerim. Sınavı geçersem tatile çıkarım." Tatile çıkmadım.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Sınavı geçtim ama tatile çıkmadım.","Sınavı geçmedim ve çalışmadım.","Çalıştım ama sınavı geçemedim.","Sınavı geçtim ve çalıştım.","Tatile çıkmadığım için çalışmadım."],"correctIndex":1}'::jsonb,
  'Tatile çıkmadığıma göre sınavı geçmemişimdir. Çalışsaydım sınavı geçecektim; bu nedenle çalışmamışımdır.',
  'Önermeler zincir hâlinde olduğu için aday tek adımda duran şıkları (yalnızca sınavı geçmedim) seçebilir. Zincir iki adım geriye izlenmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Hiçbir kedi köpek değildir. Her köpek hayvandır." Pamuk adlı hayvan bir kedidir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Pamuk hayvan değildir.","Pamuk bir köpek olabilir.","Her hayvan kedidir.","Hiçbir hayvan köpek değildir.","Pamuk köpek değildir."],"correctIndex":4}'::jsonb,
  'Hiçbir kedi köpek olmadığına göre kedi olan Pamuk köpek değildir.',
  '"Her köpek hayvandır" bilgisi, kedinin hayvan olup olmadığı hakkında bilgi vermez. Aday bunu "Pamuk hayvan değildir" sonucuyla karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
);
