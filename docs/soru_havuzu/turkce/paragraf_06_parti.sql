-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 6 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Aile akşam yemeği, yalnızca karın doyurmak için bir araya gelmek değildir; gün içinde yaşananların paylaşıldığı, çocukların dinlendiğini hissettiği bir buluşmadır. Telefon ve televizyonun masaya girdiği evlerde bu paylaşım yerini sessiz bir birlikteliğe bırakır. Oysa birlikte yemek yemenin değeri, aynı masada oturmaktan çok birbirini duymaktan gelir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Aile yemeklerinde telefon kullanımı serbest olmalıdır.","Çocuklar yemeği ayrı yemelidir.","Ailede birlikte yemek yemenin değeri, aynı mekânda bulunmaktan çok karşılıklı dinleyip paylaşmaktan gelir.","Birlikte yemek yemek, yalnızca beslenme amacı taşır.","Televizyon, aile bağlarını güçlendirir."],"correctIndex":2}'::jsonb,
  'Yazar, yemeğin yalnızca doyurmakla kalmayıp paylaşım ve dinleme anı olduğunu söyler; telefon ve televizyonun bunu engellediğini belirtir.',
  '"Sessiz bir birliktelik" ifadesi aynı masada oturmayı yeterli sayma izlenimi verebilir. Oysa yazar asıl değerin birbirini duymak olduğunu vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Radyo, görsel gerektirmediği için insanlara başka işlerle uğraşırken eşlik edebilir. Araç kullanan, yemek yapan ya da çalışan biri, gözlerini ayırmadan dinleyebilir. Bu özelliği, radyoyu televizyonun yaygınlaştığı dönemde bile varlığını sürdüren bir araç yapmıştır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Radyo dinlemek için ekrana bakmak gerekir.","Radyo, başka işlerle birlikte dinlenebilir.","Araç kullanırken radyo dinlenebilir.","Radyo, televizyon döneminde de varlığını sürdürmüştür.","Radyonun görsel gerektirmemesi bir avantajdır."],"correctIndex":0}'::jsonb,
  'Parça, radyonun görsel gerektirmediğini söyler. Bu nedenle radyo dinlemek için ekrana bakmak gerektiği yargısı çıkarılamaz.',
  '"Televizyon" sözcüğü geçtiği için aday radyonun da ekranla ilişkili olduğunu sanabilir. Oysa parça radyonun görsel gerektirmediğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yer altı suyu, yağmurla beslendiği için yenilenebilir bir kaynak sayılır. ....... Çünkü bir kaynaktan, yenilenme hızından fazlasını çekmek, uzun vadede o kaynağı tüketir; kuyuların derinleşmesi bunun ilk işaretidir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle yer altı suyu her miktarda çekilebilir.","Ne var ki bu yenilenme sınırsız değildir; kullanım hızı yenilenme hızını aştığında kaynak azalır.","Yağmur yağdıkça kuyular kendiliğinden derinleşir.","Yer altı suyu yalnızca tarımda kullanılabilir.","Kaynakların tükenmesi yalnızca yüzey sularında görülür."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, yenilenme hızından fazla çekmenin kaynağı tükettiğini söyler. Bu gerekçeyi, yenilenmenin sınırsız olmadığını belirten cümle taşır.',
  'İlk cümledeki "yenilenebilir" sözcüğü sınırsızlık çağrışımı yaptığı için aday "her miktarda çekilebilir" şıkkına yönelebilir. Oysa "Çünkü" cümlesi bunun tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle devletler, para basma yetkisini kendi denetimlerine almıştır.
II. Ticaret geliştikçe takas, taşıması ve değer biçmesi zor bir yöntem hâline geldi.
III. İnsanlar zamanla herkesçe kabul gören bir değişim aracına ihtiyaç duydu.
IV. Madenden basılan ilk paralar bu ihtiyaca yanıt verdi.
V. Ancak paranın değeri, ona duyulan güvene bağlı olduğundan sahte para önemli bir tehdit sayıldı.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II takasın zorluğunu verir, III ortak bir araç ihtiyacını, IV paranın ortaya çıkışını, V ("Ancak") güven sorununu anlatır; I ("Bu nedenle") devletlerin yetkisini sonuç olarak bildirir. Baştan ikinci cümle III.''tür.',
  'IV. cümle paranın ortaya çıkışını anlattığı için ikinci sıraya uygun görünür. Ancak "bu ihtiyaca" ifadesi, ihtiyacı anlatan III''ün hemen öncesinde gelmesi gerektiğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Gökkuşağı, güneş ışığı yağmur damlalarından geçerken kırılıp renklerine ayrıldığında oluşur. Gözlemcinin güneşi arkasında, yağmuru ise karşısında bulması gerekir; bu yüzden gökkuşağı çoğunlukla yağmurdan hemen sonra, güneş açtığında görülür.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Işığın Hızı","Yağmur Bulutlarının Çeşitleri","Renklerin Psikolojik Etkileri","Gökkuşağının Oluşumu","Mevsimlerin Oluşumu"],"correctIndex":3}'::jsonb,
  'Parça, gökkuşağının ışığın kırılmasıyla nasıl oluştuğunu ve ne zaman görüldüğünü anlatır.',
  'Parçada yağmur ve ışık geçtiği için aday bunlarla ilgili geniş başlıklara yönelebilir. Oysa bunlar gökkuşağının oluşumunu açıklayan ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yaşlandıkça yeni bir şey öğrenmenin zorlaştığına dair yaygın bir inanç vardır. Oysa öğrenmeyi zorlaştıran, çoğu zaman yaş değil, "artık geç" diyerek denemeyi bırakmaktır. Yeni bir dil ya da enstrüman öğrenmeye başlayan yaşlılar, beyinlerinin bu çabaya yeniden bağlantılar kurarak yanıt verdiğini gösteriyor.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Yaşlılar yeni bir şey öğrenemez.","Genç beyin, yaşlı beyinden her zaman daha esnektir.","Yeni bir enstrüman öğrenmek yalnızca çocuklara uygundur.","Beyin bağlantıları yaşlandıkça yenilenmez.","Öğrenme becerisini sınırlayan, yaştan çok denemekten vazgeçmektir."],"correctIndex":4}'::jsonb,
  'Yazar, öğrenmeyi zorlaştıranın yaş değil "artık geç" diyerek denemeyi bırakmak olduğunu ve yaşlı beyinlerin de yeni bağlantılar kurduğunu söyler.',
  'İlk cümledeki yaygın inanç, yaşlıların öğrenemeyeceği yargısını çağrıştırır. Oysa yazar bu inancı "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Semt pazarları, üreticinin ürününü doğrudan tüketiciye sattığı yerlerdir. Ürünler genellikle mevsimine uygun ve tazedir; fiyatlar ise pazarlıkla değişebilir. Pazarlar ayrıca insanların birbirini tanıdığı, esnafla müşterinin sohbet ettiği toplumsal buluşma noktalarıdır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Ürünlerin tazeliğine","Fiyatların pazarlıkla değişebilmesine","Pazar yerlerinin kuruluş tarihine","Pazarların toplumsal işlevine","Üreticinin tüketiciyle doğrudan buluşmasına"],"correctIndex":2}'::jsonb,
  'Parçada üretici-tüketici ilişkisi, tazelik, pazarlık ve toplumsal işlev anlatılır. Kuruluş tarihine değinilmez.',
  'Parça pazarın özelliklerini sıraladığı için aday tarihsel bir bilginin de bulunduğunu sanabilir. Oysa metinde tarih ya da kuruluş bilgisi yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bazı bakteriler, bağırsaklarda sindirime yardımcı olur. (II) Hatta bu bakterilerin dengesi bozulduğunda bağışıklık bile etkilenebilir. (III) Bu nedenle bakterilerin tamamını düşman saymak, vücudun kendi dengesini bozmaya yol açabilir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümledeki bilgiyi güçlendiren ek bir bilgi vermek","Önceki bilgiye karşı çıkmak","Konunun tanımını yapmak","Parçanın sonucunu bildirmek","Konuyu başka bir alana taşımak"],"correctIndex":0}'::jsonb,
  'II. cümle, "Hatta" ile I. cümledeki yarar bilgisini genişletir ve bağışıklıkla ilişkisini ekler.',
  '"Hatta" bağlacı vurguyu artırdığı için aday cümleyi karşıtlık sanabilir. Oysa "hatta" önceki bilgiyi güçlendiren bir ek bilgi sunar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ses kayıtları, bir konuşmanın sözcüklerini saklar; ancak konuşmacının vurgusunu, bakışını ve ortamın havasını aynı ölçüde aktaramaz. Bu yüzden aynı kayıt, farklı dinleyiciler tarafından farklı biçimlerde yorumlanabilir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Ses kayıtları sözcükleri saklar.","Ses kayıtları, bir konuşmanın bütün unsurlarını eksiksiz biçimde saklar.","Vurgu ve bakış kayıtta aynı ölçüde aktarılamaz.","Aynı kayıt farklı biçimlerde yorumlanabilir.","Ortamın havası, ses kaydına tam olarak yansımaz."],"correctIndex":1}'::jsonb,
  'Parça, ses kayıtlarının vurguyu, bakışı ve ortamı aynı ölçüde aktaramadığını söyler. Bu nedenle her unsuru eksiksiz sakladığı yargısı parçayla çelişir.',
  '"Sözcüklerini saklar" ifadesi kayıtların her şeyi sakladığı izlenimini verebilir. Oysa "ancak" ile başlayan ifade bunu sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Elektrikli araçlar egzoz gazı çıkarmadığı için hava kirliliğini azaltan bir çözüm olarak görülür. ....... Çünkü araçların kullandığı elektrik kömür gibi kaynaklardan üretiliyorsa kirlilik yalnızca santrale taşınmış olur.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle elektrikli araçlar her koşulda çevre dostudur.","Elektrik üretimi hiç kirlilik yaratmaz.","Benzinli araçlar çevreye daha az zarar verir.","Ne var ki bu araçların çevreye katkısı, kullandıkları elektriğin nasıl üretildiğine de bağlıdır.","Elektrikli araçlar yalnızca şehir içinde kullanılabilir."],"correctIndex":3}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, elektriğin kömürden üretilmesi hâlinde kirliliğin santrale taşındığını söyler. Bu gerekçe, çevresel katkının elektriğin üretim biçimine bağlı olduğunu belirten cümleyle uyumludur.',
  'İlk cümledeki olumlu ifade aday için olumlu bir sonuç cümlesi çağrıştırır ("her koşulda çevre dostu"). Oysa "Çünkü" cümlesi bir sınırlama getirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Organik tarım, ürünün yalnızca kimyasalsız yetiştirilmesi değildir; toprağın uzun vadede verimini koruyan bir üretim anlayışını da içerir. Nöbetleşe ekim, doğal gübre ve zararlılarla biyolojik mücadele bu anlayışın araçlarıdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Organik tarım, her ürün için daha ucuz bir yöntemdir.","Nöbetleşe ekim, toprağın verimini düşürür.","Kimyasalsız her ürün organik sayılır.","Doğal gübre yalnızca bahçelerde kullanılır.","Organik tarım, kimyasaldan kaçınmanın ötesinde toprağın sürekliliğini gözeten bütüncül bir üretim biçimidir."],"correctIndex":4}'::jsonb,
  'Yazar, organik tarımın yalnızca kimyasalsız üretim olmadığını, toprağın verimini koruyan bütüncül bir anlayış olduğunu söyler.',
  '"Kimyasalsız yetiştirilmesi" ifadesi vurgulandığı için aday "kimyasalsız her ürün organiktir" yargısına yönelebilir. Oysa yazar "yalnızca ... değildir" diyerek bunu sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Stresli anlarda nefesimiz sığ ve hızlı hâle gelir. ....... Çünkü yavaş ve derin nefes, vücuda tehlikede olmadığımız mesajını göndererek kalp atışını sakinleştirir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Nefes alıp vermek stresi artırır.","Derin nefes yalnızca spor sırasında alınmalıdır.","Bu nedenle nefesi bilinçli olarak yavaşlatmak, gerginliği azaltmanın basit bir yoludur.","Hızlı nefes kalp atışını yavaşlatır.","Stres, nefesle hiçbir ilişkisi olmayan bir durumdur."],"correctIndex":2}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, yavaş ve derin nefesin kalbi sakinleştirdiğini söyler. Bu gerekçeyi, nefesi bilinçli yavaşlatmanın gerginliği azaltacağını belirten cümle taşır.',
  '"Hızlı nefes kalp atışını yavaşlatır" şıkkı parçadaki sözcükleri ters yönde kullanır. Oysa parça yavaş nefesin sakinleştirdiğini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle mühendisler, köprü tasarlarken yükü eşit dağıtan biçimleri tercih eder.
II. Bir köprü, yalnızca kendi ağırlığını değil, üzerinden geçen araçların yükünü de taşımak zorundadır.
III. Yük, taşıyıcı elemanlar arasında dengeli dağılmazsa bir noktada aşırı gerilim birikir.
IV. Kemer biçimi, yükü yanlara yayarak bu gerilimi azaltan klasik çözümlerden biridir.
V. Bu gerilim, uzun süre göz ardı edilirse yapıda çatlaklara yol açar.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra II - III - V - I - IV''tür. II yükü, III dengesiz dağılımı ve gerilimi, V ("Bu gerilim") sonucunu anlatır; I ("Bu nedenle") mühendislerin tercihini, IV kemer çözümünü bildirir. Baştan üçüncü cümle V.''tir.',
  'IV. cümle "bu gerilimi azaltan" dediği için III''ün hemen ardına konulabilir gibi görünür. Ancak V''teki "Bu gerilim" ifadesi de III''e bağlıdır; I''in ardından gelen IV ise çözümü verir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ders çalışırken müzik dinlemek çoğu kişiye verimli gelir; oysa sözlü müzik, okunan metinle aynı dil alanını kullandığı için dikkati böler. Müziğin keyif verdiği doğrudur; ama keyif, öğrenmenin verimiyle aynı şey değildir.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Ders çalışırken müzik dinlemenin verimli olduğu inancını sorgulamak","Müziğin insana keyif vermediğini savunmak","Ders çalışmanın gereksiz olduğunu göstermek","Müzik dinlemenin tamamen yasaklanmasını önermek","Sözlü müziğin dil öğrenimini kolaylaştırdığını kanıtlamak"],"correctIndex":0}'::jsonb,
  'Yazar, müzik dinleyerek çalışmanın verimli gelmesine karşın dikkati böldüğünü söyler; amacı bu inancı sorgulamaktır.',
  '"Müziğin keyif verdiği doğrudur" ifadesi yazarın müziği olumladığı izlenimini verebilir. Oysa yazar keyfi verimden ayırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Işık, yıldızlardan bize ulaşana kadar yıllar, hatta binlerce yıl yol alır. Bu yüzden gece gökyüzünde gördüğümüz bir yıldızın görüntüsü, o yıldızın şu anki hâlini değil geçmişteki hâlini yansıtır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yıldızların ışığı bize ulaşmak için zamana ihtiyaç duyar.","Gökyüzünde gördüğümüz yıldızlar, şu anki hâlleriyle görünür.","Gördüğümüz yıldız görüntüsü geçmişe ait olabilir.","Bazı yıldızların ışığı binlerce yıl yol alır.","Işığın yolculuğu anlık değildir."],"correctIndex":1}'::jsonb,
  'Parça, görülen yıldız görüntüsünün şu anki değil geçmişteki hâli yansıttığını söyler. Bu nedenle yıldızların şu anki hâliyle göründüğü yargısı çıkarılamaz.',
  '"Gece gökyüzünde gördüğümüz" ifadesi görüntünün şu an olduğunu düşündürür. Oysa parça bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bitkisel boyalar, kök, yaprak ve kabuk gibi doğal kaynaklardan elde edilir. (II) Kökboya bitkisi, kırmızı tonların ustalıkla elde edildiği geleneksel kaynaklardan biridir. (III) Bu boyalar, sentetik boyalara göre çevreye daha az zarar verir. (IV) Dokuma tezgâhlarının tarihi, Mezopotamya''ya kadar uzanır. (V) Bu nedenle geleneksel el sanatlarında doğal boya yeniden ilgi görmektedir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, bitkisel boyaların kaynaklarını ve çevresel üstünlüğünü anlatır. IV. cümle ise dokuma tezgâhlarının tarihine geçerek konunun dışına çıkar.',
  'IV. cümle de el sanatlarıyla ilgili olduğu için konu içinde gibi görünür. Ancak parçanın ekseni boyaların kaynağı ve etkisidir; tezgâh tarihi bu bütünlüğü bozar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir hediyenin değeri, çoğu zaman fiyatıyla ölçülür. Oysa hediye, alanın ihtiyacını ve zevkini ne kadar düşündüğümüzü gösterdiğinde anlam kazanır. Pahalı ama düşünülmeden alınmış bir hediye, ucuz ama kişiye özel bir hediyenin yanında soğuk kalır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Pahalı hediyeler her zaman daha anlamlıdır.","Hediye almak, ihtiyaç düşünülmeden yapılmalıdır.","Ucuz hediyeler değersizdir.","Bir hediyeyi değerli kılan, fiyatından çok alıcıyı ne kadar düşünerek seçildiğidir.","Hediyenin anlamı yalnızca ambalajına bağlıdır."],"correctIndex":3}'::jsonb,
  'Yazar, hediyenin değerini fiyatla değil, alıcıyı düşünerek seçilmesiyle ilişkilendirir.',
  'İlk cümledeki "fiyatla ölçülür" ifadesi pahalı hediyenin değerli olduğu izlenimini verir. Oysa yazar bunu "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Mektubun yerini hızlı mesajlaşma aldığında kaybolan şey, yalnızca yazı biçimi değil, beklemenin verdiği heyecandır. Bir cevabın günler sonra geleceğini bilmek, yazarken sözcükleri daha özenle seçtirirdi. Hızın getirdiği kolaylık elbette değerli; ama yavaşlığın öğrettiklerini de unutmamak gerekir.

Bu parçada yazarın mektup ve mesajlaşmaya yönelik yaklaşımı aşağıdakilerden hangisidir?',
  '{"options":["Mesajlaşmanın hiçbir yararı olmadığını düşünmektedir.","Mektubun yeniden yaygınlaşması gerektiğini savunmaktadır.","Hızın her zaman kaliteyi artırdığını ileri sürmektedir.","Mektup yazmanın zaman kaybı olduğunu söylemektedir.","Hızlı iletişimin yararını kabul etmekle birlikte yavaş iletişimin kattıklarını da değerli bulmaktadır."],"correctIndex":4}'::jsonb,
  'Yazar, hızlı iletişimin değerini kabul eder ama yavaşlığın kattığı özen ve heyecanı da değerli bulur.',
  '"Kaybolan şey" ifadesi mesajlaşmanın tümüyle olumsuz görüldüğü izlenimini verebilir. Oysa yazar "elbette değerli" diyerek hızı da kabul eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yetişkinler yeni bir dili öğrenirken çocuklardan daha yavaş ilerliyor gibi görünür. ....... Çünkü yetişkinler, kuralları bilinçli olarak çözümleyebilir ve öğrenme stratejilerini kendileri seçebilir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle yetişkinler yeni bir dili hiçbir zaman öğrenemez.","Çocuklar kuralları bilinçli olarak çözümler.","Oysa bu yavaşlık, öğrenme kapasitesinden çok kullanılan yöntemin farkından kaynaklanıyor olabilir.","Dil öğrenmek yalnızca çocukluk çağında mümkündür.","Yetişkinlerin öğrenme stratejileri yoktur."],"correctIndex":2}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, yetişkinlerin bilinçli çözümleme ve strateji seçme gücünü sayar. Bu gerekçe, yavaşlığın kapasiteden değil yöntemden kaynaklanabileceğini belirten cümleyi destekler.',
  'İlk cümledeki "daha yavaş" ifadesi yetişkinlerin öğrenemeyeceği sonucunu çağrıştırır. Oysa "Çünkü" cümlesi yetişkinlerin güçlü yönlerini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kutup ayıları, kalın yağ tabakası ve iki katmanlı kürkleri sayesinde aşırı soğukta hayatta kalır. Besinlerini büyük ölçüde deniz buzu üzerinde avlanarak sağlarlar; buzların erimesi, avlanma alanlarını daraltır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Kutup ayılarının yavrularını nasıl büyüttüğüne","Yağ tabakasının koruyucu işlevine","Kürk yapısına","Avlanma biçimine","Buzların erimesinin etkisine"],"correctIndex":0}'::jsonb,
  'Parçada yağ tabakası, kürk, avlanma biçimi ve buzların erimesinin etkisi anlatılır. Yavruların büyütülmesine değinilmez.',
  'Kutup ayıları denince yavru bakımı çağrışımı yapıldığı için aday bu bilginin de bulunduğunu sanabilir. Oysa metinde yavrulardan söz edilmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Dijital arşivler, bu koleksiyonları dünyanın her yerinden erişilebilir kılar.
II. Müzeler, sergileyebildiklerinden çok daha fazla esere sahiptir.
III. Deponun karanlığında kalan eserler, ziyaretçilerle hiç buluşamaz.
IV. Bu eserlerin tarandığı ve çevrimiçi yayımlandığı projeler, bu duruma çözüm getirmektedir.
V. Üstelik dijital kopya, kırılgan eserin gereksiz yere elle temas görmesini de önler.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıra II - III - IV - I - V''tir. II müzelerin çok sayıda eseri olduğunu, III depodaki eserlerin görülmediğini, IV çözümü (dijital projeler), I ("bu koleksiyonları") erişimi, V ("Üstelik") ek yararı anlatır. Baştan dördüncü cümle I.''dir.',
  'V. cümle de dijital kopyadan söz ettiği için dördüncü sırada olabilir gibi görünür. Ancak "Üstelik" ifadesi bir ek yarar bildirdiği için en sonda gelir; dördüncü sırada I yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir toplantının verimli geçmesi, katılımcıların gündemi önceden bilmesine bağlıdır. (II) Gündemi önceden paylaşılan toplantılarda kişiler hazırlıklı gelir ve konuşma dağılmaz. (III) Toplantı odasının renk seçimi, çalışanların yorgunluk düzeyini etkileyebilir. (IV) Gündem belirsizse tartışma, asıl konunun dışına kolayca kayar. (V) Bu nedenle toplantı çağrısıyla birlikte konu başlıklarının da gönderilmesi önerilir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Parça, gündemin toplantı verimine etkisini anlatır. III. cümle ise oda rengine geçerek gündem konusundan uzaklaşır ve akışı bozar.',
  'III. cümle de toplantıyla ilgili olduğu için konu içinde gibi görünür. Ancak parçanın ekseni gündemin paylaşılmasıdır; oda rengi bu bütünlüğün dışında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Cesaret, korkunun yokluğu değil, korkuya rağmen harekete geçebilmektir. Hiç korkmayan biri, aslında tehlikeyi görmeyen biridir; korkusunu bilen ve yine de adım atan ise cesur sayılır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Cesaret, korkuya rağmen harekete geçmektir.","Cesur kişiler hiçbir zaman korku duymaz.","Hiç korkmayan kişi tehlikeyi görmüyor olabilir.","Korkusunu bilen kişi de cesur olabilir.","Korku, cesaretin yokluğu anlamına gelmez."],"correctIndex":1}'::jsonb,
  'Parça, cesaretin korkunun yokluğu olmadığını söyler. Cesur kişilerin hiç korku duymadığı yargısı parçayla çelişir.',
  '"Hiç korkmayan biri" ifadesi cesur kişiyi çağrıştırır; aday bunu cesaretin tanımı sanabilir. Oysa yazar bu kişiyi tehlikeyi görmeyen biri olarak tanımlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Birçok kişi, sağlıklı beslenmenin pahalı olduğunu düşünür. (II) Oysa mevsiminde alınan sebze ve baklagiller, işlenmiş gıdalardan çoğu zaman daha ucuzdur. (III) Dolayısıyla sağlıklı beslenmenin önündeki asıl engel, para değil bilgi ve alışkanlıktır.

Bu parçadaki III. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Konunun tanımını yapmak","Önceki cümledeki görüşü örnekle desteklemek","Yeni bir konuya geçiş yapmak","Önceki cümlelerden bir sonuç çıkarmak","Önceki cümledeki bilgiyi aynen yinelemek"],"correctIndex":3}'::jsonb,
  'III. cümle "Dolayısıyla" ile başlar ve önceki cümlelerdeki bilgiden (sebze ve baklagiller ucuzdur) bir sonuç çıkarır.',
  'III. cümle de yeni bir yargı içerdiği için aday yeni bir konuya geçildiğini sanabilir. Oysa "Dolayısıyla" bağı bu yargının öncekilerden çıktığını gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ambalajlı gıdaların etiketinde içindekiler listesi, miktara göre azalan sırayla yazılır. İlk sırada yer alan bileşen, üründe en çok bulunandır. Bu yüzden etiketi okuyan bir tüketici, bir ürünün gerçekte neyle yapıldığını reklamlardan daha güvenilir biçimde anlayabilir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Ambalaj Malzemelerinin Geri Dönüşümü","Reklamların Tüketiciyi Etkileme Yöntemleri","Gıda Güvenliğinde Soğuk Zincir","Beslenme Alışkanlıklarının Tarihi","Gıda Etiketlerinin Okunması ve Önemi"],"correctIndex":4}'::jsonb,
  'Parça, gıda etiketindeki içindekiler listesinin nasıl okunacağını ve neden önemli olduğunu anlatır.',
  'Parçada "reklamlar" geçtiği için aday reklamlarla ilgili bir başlığa yönelebilir. Oysa reklam yalnızca etiketle karşılaştırılan bir ayrıntıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Yürüyen merdivenler, sürekli dönen bir zincir üzerine yerleştirilmiş basamaklarla çalışır. Basamaklar üst düzeyde düzleşerek yolcunun rahatça inmesini sağlar. Motor, zinciri sabit hızda çeker; bu yüzden yolcular ayakta durarak bile yukarı çıkabilir.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Yürüyen merdivenlerin çalışma düzeni","Yüksek binalarda güvenlik önlemleri","Motorların enerji tüketimi","Kentlerde ulaşım sorunları","Asansörlerin tarihçesi"],"correctIndex":0}'::jsonb,
  'Parça, yürüyen merdivenin zincir, basamak ve motorla nasıl çalıştığını anlatır.',
  'Parçada "motor" geçtiği için aday enerji tüketimiyle ilgili bir konu seçebilir. Oysa motor yalnızca çalışma düzeninin bir parçasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Çocukların ebeveynlerine benzemesi yalnızca genlerle açıklanamaz; birlikte yaşanan ortam, alışkanlıklar ve örnek alınan davranışlar da benzerliği artırır. Bu yüzden bir özelliğin ailede görülmesi, tek başına kalıtsal olduğunu göstermez.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Çocuklar ebeveynlerine yalnızca genler yoluyla benzer.","Ailedeki benzerlikler, yalnızca kalıtımla değil ortak çevre ve alışkanlıklarla da açıklanabilir.","Ortam, davranış benzerliğini etkilemez.","Ailede görülen her özellik kalıtsaldır.","Alışkanlıklar kalıtımla belirlenir."],"correctIndex":1}'::jsonb,
  'Yazar, benzerliğin genlerin yanı sıra ortam ve alışkanlıklarla da açıklandığını, ailede görülmenin tek başına kalıtsallık anlamına gelmediğini söyler.',
  '"Ebeveynlerine benzemesi" ifadesi kalıtımı çağrıştırdığı için aday "yalnızca genler" şıkkına yönelebilir. Oysa yazar bunu açıkça sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bazı insanlar bir kararın doğruluğunu, çok kişinin onu benimsemesine bakarak ölçer. Oysa kalabalığın bir şeyi onaylaması, onun doğru olduğunu garanti etmez; tarih, çoğunluğun yanıldığı pek çok örnekle doludur. Bu, çoğunluğu dinlememeyi değil, onu da sorgulayarak dinlemeyi gerektirir.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Çoğunluğun görüşünün hiçbir zaman dikkate alınmaması gerektiğini savunmak","Tarihte çoğunluğun hiç yanılmadığını kanıtlamak","Kalabalıkların her zaman haklı olduğunu açıklamak","Çoğunluğun görüşünü doğruluk ölçütü saymanın sakıncasını göstermek","Karar almanın gereksiz olduğunu ileri sürmek"],"correctIndex":3}'::jsonb,
  'Yazar, çoğunluğun onayının doğruluğu garanti etmediğini söyler ve çoğunluğu sorgulayarak dinlemeyi önerir.',
  '"Çoğunluğu dinlememeyi değil" ifadesi yazarın çoğunluğa karşı olmadığını gösterir. "Hiç dikkate alınmamalı" şıkkı bu ifadeyi gözden kaçırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Limanda sabahın ilk ışıklarıyla birlikte tekneler birer birer kıyıya yanaşıyordu. Balıkçıların elleri, nemli ağların arasında hızla çalışıyor; martılar, tezgâhların üzerinde dönüp duruyordu. Havada tuz ve taze balık kokusu vardı.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Açıklayıcı anlatım","Tartışmacı anlatım","Öyküleyici anlatım","Anlatım biçimlerinden hiçbiri ağır basmamaktadır.","Betimleyici anlatım"],"correctIndex":4}'::jsonb,
  'Parçada bir ortamın görüntü ve kokularıyla canlandırılması vardır; bu, betimleyici anlatımdır.',
  '"Yanaşıyordu", "çalışıyor" gibi fiiller hareket çağrışımı yaptığı için aday öyküleme sanabilir. Oysa parçada olay örgüsü değil, bir sahne anlatılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Başarı, çoğu zaman ödülle ölçülür; oysa ödül, çabanın tek göstergesi değildir. Bazı çabalar sonuç getirmez, ama kişiyi yeni bir bilgiye, yeni bir bakışa götürür. Çabayı yalnızca sonuca bağlamak, öğrenmeyi gözden kaçırmak demektir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Ödül, çabanın tek göstergesidir.","Çabanın değeri, yalnızca ödüle ulaşmasıyla değil, kişiye kazandırdıklarıyla da ölçülmelidir.","Sonuç getirmeyen çabalar boşa gider.","Başarı yalnızca şansa bağlıdır.","Öğrenme, her zaman sonuca endekslenmelidir."],"correctIndex":1}'::jsonb,
  'Yazar, ödülün çabanın tek göstergesi olmadığını, sonuç getirmeyen çabanın da öğrenme sağlayabileceğini söyler.',
  'İlk cümlede "başarı ödülle ölçülür" ifadesi genel bir kanıyı yansıtır; aday bunu yazarın görüşü sanabilir. Oysa yazar bunu "oysa" ile sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
);
