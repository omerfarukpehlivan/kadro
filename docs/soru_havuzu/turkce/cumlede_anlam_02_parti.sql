-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · CÜMLEDE ANLAM PARTİSİ 2 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bir işin başarısı, ona ayrılan emeğin miktarıyla değil, o emeğin doğru yere harcanmasıyla ölçülür."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Emek harcamadan başarı elde edilebilir.","Başarı, harcanan emekle doğru orantılıdır.","İşteki başarı, emeğin miktarından çok yönlendirildiği yere bağlıdır.","Emeğin yönü, başarıyla ilgisizdir.","Doğru yeri bulmak, emek harcamaktan daha kolaydır."],"correctIndex":2}'::jsonb,
  'Cümle, başarıyı emeğin miktarına değil doğru yere harcanmasına bağlar. Doğru şık bu düşünceyi korur.',
  '"Başarı harcanan emekle doğru orantılıdır" şıkkı, cümledeki "emek" ve "başarı" sözcüklerini kullanır; ancak cümle tam tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Söz gümüşse sükût altındır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bazı durumlarda konuşmaktan çok susmak değerlidir.","Gümüş, altından daha değerlidir.","Her zaman susmak gerekir.","Konuşmak, her durumda susmaktan iyidir.","Altın ile gümüş birbirinin yerine kullanılabilir."],"correctIndex":0}'::jsonb,
  'Atasözü, susmanın bazı durumlarda konuşmaktan daha değerli olduğunu anlatır.',
  '"Her zaman susmak gerekir" şıkkı atasözünü genelleştirdiği için çeldiricidir. Oysa atasözü yalnızca bazı durumları kapsar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Sınav kaygısı, yalnızca hazırlıksız olmaktan değil, iyi hazırlanmış olup da başarısız olma korkusundan da doğabilir."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Hazırlıksızlık, sınav kaygısına yol açabilir.","Sınav kaygısı yalnızca hazırlıksız öğrencilerde görülür.","İyi hazırlanan öğrenciler de kaygı yaşayabilir.","Başarısızlık korkusu, kaygının nedenlerinden biridir.","Sınav kaygısının birden çok nedeni olabilir."],"correctIndex":1}'::jsonb,
  'Cümle, kaygının iyi hazırlanmış kişilerde de görülebildiğini söyler. Bu nedenle yalnızca hazırlıksız öğrencilerde görüldüğü yargısı çıkarılamaz.',
  '"Yalnızca hazırlıksız olmaktan değil" ifadesi hazırlıksızlığı vurguladığı için aday uç yargıya yönelebilir. Oysa ifade, tek nedeni reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde gerçekleşmemiş bir durum anlatılmaktadır?',
  '{"options":["Yağmur yağınca pikniği ertelediler.","Yağmur yağdığı için eve döndük.","Yağmur yağarken şemsiye açtı.","Yağmur yağmasaydı pikniğe gidecektik.","Yağmurdan sonra hava serinledi."],"correctIndex":3}'::jsonb,
  '"Yağmasaydı ... gidecektik" yapısı, gerçekte yağmurun yağdığını ve pikniğe gidilmediğini ima eder; gerçekleşmemiş bir koşul bildirir.',
  'Diğer cümlelerde de yağmur geçtiği için aday hepsini aynı sanabilir. Gerçekleşmemiş koşul, "-saydı" gibi dilek-şart yapısıyla kurulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi bir tanım cümlesidir?',
  '{"options":["Bu mercek çok pahalıydı.","Mercekler camdan mı yapılır?","Dün yeni bir mercek aldım.","Mercek almak için çarşıya gitti.","Mercek, ışığı kırarak odaklayan şeffaf bir cisimdir."],"correctIndex":4}'::jsonb,
  'Doğru şık, merceğin ne olduğunu açıklar; tanım cümlesidir. Diğerleri bilgi, soru ve olay bildirir.',
  'Hepsinde "mercek" sözcüğü geçtiği için aday ayrım yapmakta zorlanabilir. Tanım cümlesi, bir şeyin ne olduğunu belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Hiçbir öğrenci sınavdan geçemedi."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bazı öğrenciler sınavı geçti.","Her öğrenci sınavı geçti.","Sınavı geçen öğrenci olmadı.","Yalnızca birkaç öğrenci sınavı geçemedi.","Sınavı geçen öğrenci sayısı azdı."],"correctIndex":2}'::jsonb,
  '"Hiçbir öğrenci geçemedi" demek, geçen öğrenci olmadığını söylemektir.',
  '"Sınavı geçen sayısı azdı" şıkkı hiç geçen olmadığı anlamını zayıflatır. Oysa "hiçbir" sözü sayıyı sıfıra indirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Başvuru yapabilmek için yaşın 18''den büyük olması gerekir."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["18 yaşından büyük olan herkesin başvurusu kabul edilir.","18 yaşından küçük biri başvuru yapamaz.","Başvuru için yaş koşulunun aranması gerekir.","Yaş, başvurunun koşullarından biridir.","18 yaşın altındakiler başvuru koşulunu sağlamaz."],"correctIndex":0}'::jsonb,
  'Cümle, yaşın gerekli bir koşul olduğunu söyler; yeterli olduğunu söylemez. Bu nedenle 18 yaşından büyük herkesin başvurusunun kabul edildiği yargısı çıkarılamaz.',
  'Koşulun tersini kabul sanmak yaygın hatadır. Gerekli koşul, yeterli koşul değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde benzetme vardır?',
  '{"options":["Çocuk hafif bir çantayı taşıdı.","Çocuk, kuş gibi hafifti.","Çocuk bahçede koştu.","Çocuk hafif bir yemek yedi.","Çocuk erkenden uyudu."],"correctIndex":1}'::jsonb,
  '"Kuş gibi hafif" ifadesinde çocuk, kuşa benzetilmiştir. Diğer cümlelerde benzetme yoktur.',
  '"Hafif" sözcüğü her cümlede bulunduğu için aday benzetme arayabilir. Benzetme, "gibi" gibi bir edatla iki varlığın birbirine yaklaştırılmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi diğerlerinden anlamca farklıdır?',
  '{"options":["Bu işi ancak sabırlı biri yapabilir.","Bu işi sabırsız biri yapamaz.","Bu işi yalnızca sabırlı biri yapabilir.","Bu işi sabırlı biri de yapabilir.","Bu işi sabırlı olmayan biri yapamaz."],"correctIndex":3}'::jsonb,
  'Diğer dört cümle işi yalnızca sabırlı kişilerin yapabileceğini söyler. Doğru şıkta ise sabırlı kişinin de yapabileceği, başkalarının da yapabileceği anlamı çıkar.',
  'Hepsinde "sabırlı" ve "yapabilir" geçtiği için ayrım zorlaşır. Anlamı belirleyen "ancak, yalnızca, yapamaz" gibi sınırlayıcı sözlerdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde hem neden hem amaç belirtilmiştir?',
  '{"options":["Hasta olduğu için izin aldı.","Dinlenmek amacıyla izin aldı.","İzin alırsa dinlenir.","İzin aldı ve dinlendi.","Hasta olduğu için dinlenmek amacıyla izin aldı."],"correctIndex":4}'::jsonb,
  'Doğru şıkta izin almanın nedeni (hasta olmak) ve amacı (dinlenmek) birlikte verilmiştir.',
  'Diğer şıklarda yalnızca neden ya da yalnızca amaç bulunur. İki ilişkinin birlikte arandığı soruda bu fark gözden kaçabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir kitap herkes için aynı anlamı taşımaz; çünkü okur, kitabı kendi yaşantısıyla birlikte okur."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Okurun yaşantısı, kitabın anlamını etkiler.","Aynı kitap farklı okurlar için farklı anlamlar taşıyabilir.","Bir kitabın anlamı yalnızca yazarın niyetiyle belirlenir.","Anlam, okuma sürecinde de oluşur.","Okur, kitabı kendi deneyimiyle yorumlar."],"correctIndex":2}'::jsonb,
  'Cümle, anlamın okurun yaşantısıyla birlikte oluştuğunu söyler. Anlamın yalnızca yazarın niyetine bağlı olduğu yargısı cümleyle çelişir.',
  'Yazarın niyeti önemli görüldüğü için aday bu şıkkı doğru sanabilir. Oysa cümle anlamın okura göre değiştiğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Bilgi sahibi olmak yetmez; .......

Bu cümlenin devamına aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["onu doğru yerde ve zamanda kullanabilmek de gerekir.","bu nedenle bilgi edinmekten vazgeçilmelidir.","bilgi yalnızca kitaplardan edinilir.","herkes aynı bilgiyi paylaşmalıdır.","bilgili olanlar hiç hata yapmaz."],"correctIndex":0}'::jsonb,
  '"Yetmez" ifadesi, bilginin tek başına yeterli olmadığını söyler. Devamı, bilginin kullanımına işaret etmelidir.',
  '"Bilgi edinmekten vazgeçilmelidir" şıkkı "yetmez" ifadesini yanlış yorumlar. Oysa cümle bilgiyi gerekli ama yetersiz sayar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Yağmur başlamıştı; ....... maçı ertelemediler.

Bu cümlede boş bırakılan yere aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["bu yüzden","yine de","çünkü","ayrıca","dolayısıyla"],"correctIndex":1}'::jsonb,
  'Yağmur başladığı hâlde maç ertelenmemiştir; ikisi arasında karşıtlık vardır. Bu karşıtlığı "yine de" kurar.',
  '"Bu yüzden" ve "dolayısıyla" neden-sonuç bağı kurar; aday yağmurun maçı ertelemeyi gerektirdiğini düşünerek bunlara yönelebilir. Oysa cümle karşıtlık bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"İnsan, bildiğini sandığı konuda en çok yanılandır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["İnsan bilmediği konularda hiç yanılmaz.","Bilgili insanlar hiçbir zaman yanılmaz.","Bir konuyu bilmek, yanılma olasılığını artırır.","Bir konuyu bildiğini düşünen kişi, çoğu zaman o konuda hata yapar.","Yanılmak, yalnızca bilgisiz kişilere özgüdür."],"correctIndex":3}'::jsonb,
  'Cümle, bildiğini sanmanın yanılgıya yol açtığını söyler. Doğru şık bunu korur.',
  '"Bilmek yanılmayı artırır" şıkkı bilgi ile yanılgı arasında doğrudan bir ilişki kurar. Oysa cümle, bildiğini sanmayı (yanlış bir güveni) eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde öneri vardır?',
  '{"options":["Kararını dün akşam verdi.","Karar vermek her zaman zordur.","Kararını açıklayınca herkes şaşırdı.","Karar vermek için toplantı düzenlendi.","Kararını vermeden önce biraz daha düşünsen iyi olur."],"correctIndex":4}'::jsonb,
  'Doğru şık "iyi olur" yapısıyla bir öneri bildirir. Diğer cümlelerde olay, genel yargı ve amaç vardır.',
  '"Karar vermek her zaman zordur" cümlesi genel bir yargı olduğu için uyarı sanılabilir. Oysa öneri, kişiye yönelik bir yönlendirmedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Doğru bilgiye ulaşmak kadar, o bilginin güvenilir bir kaynaktan geldiğini doğrulamak da önemlidir."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Bilginin güvenilir bir kaynaktan gelmesi önemlidir.","Kaynağı doğrulamak, bilgiyle ilgili önemli bir adımdır.","Bilginin kaynağını doğrulamak, doğru bilgiye ulaşmaktan daha az önemlidir.","Doğru bilgiye ulaşmak önemlidir.","Kaynak doğrulaması, bilgiyi değerlendirmede rol oynar."],"correctIndex":2}'::jsonb,
  '"Kadar" ifadesi, iki durumun eşit derecede önemli olduğunu söyler. Kaynağı doğrulamanın daha az önemli olduğu yargısı cümleyle çelişir.',
  '"Doğru bilgiye ulaşmak" ifadesi başta geldiği için aday ona öncelik verildiğini sanabilir. Oysa "kadar" bağı eşitlik kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde olumsuz bir yargı vardır?',
  '{"options":["Bu soruyu kimse çözemedi.","Bu soruyu herkes çözdü.","Bu soruyu birkaç kişi çözdü.","Bu soru çok kolaydı.","Bu soruyu çözmek için çok çalıştı."],"correctIndex":0}'::jsonb,
  '"Kimse çözemedi", çözen kimsenin olmadığını söyler; olumsuz bir yargıdır.',
  '"Birkaç kişi çözdü" gibi cümleler az sayıyı bildirdiği için aday olumsuz sanabilir. Olumsuzluk, çözenin hiç olmamasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Kendine gülebilen insan, başkalarının gülüşünden incinmez."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["İnsan kendine güldüğü için başkalarını da güldürmelidir.","Kendi hatalarını mizahla karşılayabilen kişi, başkalarının alaylarından kolay etkilenmez.","Başkalarının gülüşü, kişiyi her zaman incitir.","Kendine gülmek, başkalarına gülmeyi gerektirir.","Gülmek, incinmenin tek çaresidir."],"correctIndex":1}'::jsonb,
  'Cümle, kendine gülebilmenin başkalarının gülüşünden incinmemeyi sağladığını söyler.',
  '"Başkalarını güldürmek" ifadesi cümledeki "gülmek" fiilini yeni bir bağlamda kullandığı için çeldiricidir. Oysa cümle gülen kişiyle gülünen kişi arasında ilişki kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde zaman anlamı vardır?',
  '{"options":["Çok yoruldukları için hemen uyudular.","Ders çalışırsan başarılı olursun.","Ders çalışmasına rağmen sınavı geçemedi.","Ders biter bitmez kapıya koştular.","Ders çalışmak için kütüphaneye gitti."],"correctIndex":3}'::jsonb,
  '"Biter bitmez", iki eylemin art arda gerçekleştiğini bildirir; zaman anlamı taşır.',
  'Diğer cümlelerde de "ders" geçtiği için aday ayrım yapmakta zorlanabilir. İlişki türü, bağlaç ve eklerle belirlenir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Gürültünün yoğun olduğu bir ortamda kişi, hem dikkatini toplamakta hem de karşısındakini anlamakta güçlük çeker."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Gürültü dikkati dağıtabilir.","Gürültülü ortamda anlamak zorlaşabilir.","Gürültü iletişimi güçleştirebilir.","Ortamın sessiz olması anlamayı kolaylaştırabilir.","Gürültü, yalnızca dikkati etkiler; anlamayı etkilemez."],"correctIndex":4}'::jsonb,
  'Cümle, gürültünün hem dikkati hem anlamayı olumsuz etkilediğini söyler. Yalnızca dikkati etkilediği yargısı çelişkilidir.',
  '"Dikkatini toplamakta" ifadesi önce geldiği için aday asıl etkinin dikkatte olduğunu düşünebilir. Oysa cümle "hem ... hem" ile iki etkiyi birlikte verir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Ne ekersen onu biçersin."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Ekin biçmek, tarımın tek amacıdır.","Her iş, aynı sonucu doğurur.","Yaptığımız işlerin karşılığını sonunda biz görürüz.","Çiftçiler daima ekeceklerini biçer.","Yapılan işin karşılığı alınmaz."],"correctIndex":2}'::jsonb,
  'Atasözü, yaptığımız işlerin sonuçlarıyla karşılaşacağımızı anlatır.',
  'Atasözündeki tarımsal sözcükler aday için gerçek bir tarım cümlesini çağrıştırır. Oysa atasözü mecazlı bir anlam taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde abartma vardır?',
  '{"options":["Bu sıcakta bir dakika bile dışarıda kalsak eriyip yok olacağız.","Bu sıcakta dışarıda uzun süre kalmak zordu.","Hava bugün oldukça sıcak.","Sıcak yüzünden geç kalktık.","Sıcaktan korunmak için gölgeye çekildik."],"correctIndex":0}'::jsonb,
  'Eriyip yok olmak gerçekte olamayacağı için sıcağın şiddetini büyütmek amacıyla kullanılmıştır; abartmadır.',
  '"Oldukça sıcak" gibi derece bildiren ifadeler abartı sanılabilir. Abartıda gerçeğin ötesinde bir büyütme vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Fırtınaya yakalanan gemiyi kaptanın soğukkanlılığı kurtarır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Gemiler yalnızca fırtınada batar.","Tehlike anında sakin kalabilmek, çoğu zaman en önemli güvencedir.","Kaptanlar her zaman soğukkanlıdır.","Soğukkanlılık, fırtınanın şiddetini azaltır.","Tehlike anında telaş etmek gereklidir."],"correctIndex":1}'::jsonb,
  'Cümle, kaptanın soğukkanlılığının gemiyi kurtardığını söyler. Doğru şık, bu düşünceyi genel bir yargı olarak ifade eder.',
  '"Fırtınanın şiddetini azaltır" şıkkı soğukkanlılığa olağanüstü bir etki yükler. Oysa cümle yalnızca kurtuluşu sağlayan davranışı vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde koşul anlamı vardır?',
  '{"options":["Zamanında geldiği için onu da götürdük.","Zamanında gelsin diye telefon etti.","Zamanında gelmesine rağmen geç kaldı.","Zamanında gelirsen seni de götürürüz.","Zamanında geldi ve beklemeden çıktık."],"correctIndex":3}'::jsonb,
  '"Gelirsen" şart eki, götürülmenin zamanında gelmeye bağlı olduğunu bildirir.',
  'Diğer cümlelerde "zamanında gelmek" geçtiği için aday koşulu ayırt edemeyebilir. Koşul, -sa/-se ekiyle belirtilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Tarih, yalnızca geçmişte olanların anlatısı değil, bugünü anlamak için başvurulan bir kaynaktır."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Tarih, geçmişte olanları anlatır.","Tarih, bugünü anlamada bir kaynak olabilir.","Tarihin işlevi, yalnızca geçmişi anlatmakla sınırlı değildir.","Bugünü anlamak için tarihe başvurulabilir.","Tarih, bugünle hiçbir ilişkisi olmayan bir alandır."],"correctIndex":4}'::jsonb,
  'Cümle, tarihin bugünü anlamada da başvurulan bir kaynak olduğunu söyler. Bugünle ilişkisinin olmadığı yargısı cümleyle çelişir.',
  '"Geçmişte olanların anlatısı" ifadesi tarihin yalnızca geçmişle ilgili olduğu izlenimini verir. Oysa "yalnızca ... değil" ifadesi bunu sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde karşılaştırma vardır?',
  '{"options":["Bu kitabı bir günde bitirdim.","Bu kitap çok ilgi çekici.","Bu kitap, ötekinden daha ilgi çekici.","Bu kitabı arkadaşım önerdi.","Bu kitap raflarda uzun süre kaldı."],"correctIndex":2}'::jsonb,
  '"Ötekinden daha" ifadesi iki kitabı birbiriyle kıyaslar.',
  '"Çok ilgi çekici" ifadesi dereceyi bildirdiği için karşılaştırma sanılabilir. Karşılaştırma için ikinci bir varlık gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bir yanlışı düzeltmenin yolu, onu yapanı suçlamaktan değil, nasıl oluştuğunu anlamaktan geçer."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Hataları düzeltmek için suçlu aramak yerine nedenlerini kavramak gerekir.","Hata yapanlar mutlaka cezalandırılmalıdır.","Yanlışlar, anlaşılmadan da düzeltilebilir.","Suçlamak, hataları önlemenin en etkili yoludur.","Hataların nedenini araştırmak zaman kaybıdır."],"correctIndex":0}'::jsonb,
  'Cümle, yanlışı düzeltmenin suçlamadan değil nedenini anlamaktan geçtiğini söyler.',
  '"Hata yapanlar cezalandırılmalıdır" şıkkı, cümlede olumsuzlanan davranışı savunur. Aday cümleyi hızlı okursa karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde öznel bir yargı vardır?',
  '{"options":["Bu şehir, 1923 yılında kuruldu.","Bu şehirde yaşamak, dünyanın en büyük ayrıcalığıdır.","Şehrin nüfusu yarım milyondur.","Şehir, denize kıyıdır.","Şehirde üç üniversite bulunur."],"correctIndex":1}'::jsonb,
  '"En büyük ayrıcalık" kişisel bir değerlendirmedir; kanıtlanamaz. Diğer cümleler doğrulanabilir bilgi verir.',
  'Sayı ve tarih içeren cümleler kesin göründüğü için aday hepsini nesnel sanabilir. Soru, kişisel değerlendirme içeren cümleyi arar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde amaç bildirilmiştir?',
  '{"options":["Notlarını yeniden okuyunca daha iyi anladı.","Notlarını yeniden okuduğu için daha iyi anladı.","Notlarını yeniden okusaydı daha iyi anlardı.","Daha iyi anlamak için notlarını yeniden okudu.","Notlarını yeniden okumasına rağmen anlamadı."],"correctIndex":3}'::jsonb,
  'Doğru şıkta yeniden okumanın amacı daha iyi anlamaktır. Diğer cümlelerde zaman, neden, varsayım ve karşıtlık vardır.',
  'Bütün cümlelerde okuma ve anlama sözcükleri geçtiği için aday ilişkiyi karıştırabilir. Amaç, "için" ve "-mek için" yapısıyla belirtilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir toplumun gelişmişliği, yalnızca ekonomik büyümeyle değil, bireylerin yaşam kalitesiyle de ölçülür."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Ekonomik büyüme, gelişmişliğin ölçütlerinden biridir.","Yaşam kalitesi, gelişmişlik açısından önemlidir.","Gelişmişlik birden çok ölçütle değerlendirilir.","Bireylerin yaşam kalitesi toplumsal gelişmişliği yansıtabilir.","Gelişmişlik yalnızca ekonomik büyümeyle ölçülür."],"correctIndex":4}'::jsonb,
  'Cümle, gelişmişliğin yalnızca ekonomik büyümeyle ölçülmediğini söyler. Bu nedenle tek ölçütün ekonomik büyüme olduğu yargısı çıkarılamaz.',
  '"Ekonomik büyüme" ilk sırada anıldığı için aday onu tek ölçüt sanabilir. Oysa "yalnızca ... değil" ifadesi bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
);
