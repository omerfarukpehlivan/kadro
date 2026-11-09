-- =============================================================
-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM TARİH SORULARI (MASTER)
-- Toplam: 7 Konu x Değişen Test Sayısı = 620 Özgün Soru
-- Hedef Tablo: public.questions (Supabase)
-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap, order_index
-- =============================================================
BEGIN;


-- -------------------------------------------------------------
-- İSLAMIYET ÖNCESI TÜRK TARIHI (80 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Arkeolojik kazılar sonucunda Orta Asya’da MÖ 5000’lere kadar uzanan çeşitli kültür katmanları açığa çıkarılmıştır. Bu kültür merkezleri içerisinde tarım ve dokumacılığın izlerine rastlanan, Orta Asya’nın en eski kültürü kabul edilen merkez ile kalıntıları Türk ırkının prototipi sayılarak "Türklerin en eski kültür merkezi" kabul edilen yerleşim yeri aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Anav — Afanesyova", "Afanesyova — Andronova", "Anav — Tagar", "Karasuk — Kelteminar", "Andronova — Anav"], "correctIndex": 0}'::jsonb,
  'Aşkabat yakınlarında bulunan Anav kültürü, Orta Asya''nın bilinen en eski yerleşim ve kültür merkezidir (MÖ 5000). Ancak bu kültürün doğrudan Türklere ait olduğu kesinleşmiş değildir. Orta Asya''da kalıntıları brakisefal Türk tipine dayanan ve "Türklerin en eski kültür merkezi" kabul edilen yerleşim yeri ise Altay-Sayan Dağları çevresindeki Afanesyova kültürüdür.',
  'ÖSYM sınavda adayların "Orta Asya''nın en eski kültürü" ifadesini görünce doğrudan Afanesyova''yı, "Türklerin en eski kültürü" denince de en eski kültür olan Anav''ı işaretleme refleksini ölçer. Anav genel Orta Asya''nın en eskisidir; Afanesyova ise doğrudan Türklere ait kabul edilen en eski kültür merkezidir.',
  1
);

-- Soru #002 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Yenisey Irmağı havzasında gelişen, demir madeninin ilk kez işlendiği Karasuk kültürünün devamı niteliğindeki bu merkez; gelişmiş tunç ve demir silahları, hançer kabzalarındaki hayvan kabartmaları ve zengin kurgan buluntuları ile İslamiyet öncesi Orta Asya kültürlerinin en gelişmiş ve en son evresi kabul edilmektedir.

Hakkında bilgi verilen bu kültür merkezi aşağıdakilerden hangisidir?',
  '{"options": ["Anav", "Kelteminar", "Andronova", "Tagar", "Afanesyova"], "correctIndex": 3}'::jsonb,
  'Krasnoyarsk ve Abakan bölgesinde ortaya çıkarılan Tagar kültürü, Orta Asya bozkır kültürlerinin en gelişmiş ve kronolojik olarak en genç (son) aşamasıdır. Hayvan üslubuna ait en yetkin madeni sanat eserleri bu kültür katmanında bulunmuştur.',
  'ÖSYM "Türklerin atası kabul edilen kültür" ile "en gelişmiş kültür" kavramlarını sıklıkla çeldirici olarak karşılaştırır. Andronova (C şıkkı), yayılma alanı en geniş olan ve Türklerin atalarının yaşadığı düşünülen kültürdür; fakat madencilik ve sanat bakımından zirveyi temsil eden en gelişmiş merkez Tagar''dır.',
  2
);

-- Soru #003 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karadeniz’in kuzeyinden Hazar Denizi ve Orta Asya bozkırlarına kadar uzanan geniş sahada varlık gösteren İskitler (Sakalar), atlı göçebe bozkır kültürünün öncü topluluklarından biridir.

Aşağıdakilerden hangisi İskitlerin Türk ve dünya uygarlığına sağladığı katkılardan veya özelliklerinden biri değildir?',
  '{"options": ["Savaş aracı olarak atı evcilleştirip süvarilikte üzengiyi ilk kez kullanmaları", "Ölen savaşçıların mezarları başına öldürdüğü düşman sayısı kadar balbal dikme geleneğini başlatmaları", "Maden işletmeciliğinde ulaştıkları ileri seviye nedeniyle \"Bozkırın Kuyumcuları\" olarak anılmaları", "Orta Asya''da siyasi birliği sağlayarak ilk düzenli ordu teşkilatını (onlu sistem) kurmaları", "Sanat eserlerinde koç, geyik ve kurt gibi figürlerle \"hayvan üslubunu\" yaygınlaştırmaları"], "correctIndex": 3}'::jsonb,
  'İskitler siyasi olarak bir imparatorluk veya merkezi devlet yapısına ulaşamamış, federatif bir boy birliği şeklinde yaşamışlardır. Orta Asya''da Türk boylarını ilk kez tek bayrak altında toplayan ve dünya askeri tarihine geçen onlu teşkilatı (ilk düzenli ordu) kuran devlet Asya Hun Devleti, kurucusu ise Mete Han''dır.',
  'Adaylar üzengi ve balbal gibi ilkleri İskitlerle eşleştirmeyi unutarak bunların Göktürk veya Hunlara ait olduğunu düşünebilir. Diğer yandan İskitler bir "devlet" değil, "ilk Türk boy birliği"dir. Bu ayrım KPSS''de en çok puan kaybettiren nüanstır.',
  3
);

-- Soru #004 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Asya Hun Hükümdarı Mete Han, MÖ 201''de Baideng Kuşatması''nda 320 bin kişilik Çin ordusunu taktiksel sahte ricat ve hilal manevrasıyla kuşatıp teslim almasına ve Çin İmparatorluğu''nu dize getirmesine rağmen, Çin topraklarını doğrudan ele geçirmemiş; bölgeyi yalnızca yıllık vergiye bağlamakla yetinmiştir.

Mete Han’ın bu askerî ve siyasi stratejisinin temel amacı aşağıdakilerden hangisidir?',
  '{"options": ["İpek Yolu ticaretinin denetimini tamamen Çinli tüccarlara bırakmak", "Kalabalık Çin nüfusu karşısında Türk milletinin asimile olmasını ve benliğini kaybetmesini önlemek", "Hun ordusundaki asker sayısının taarruz harekâtı için yetersiz kalması", "Çin Seddi’ni aşabilecek kuşatma silahlarının henüz geliştirilememiş olması", "Batı Asya ve Roma İmparatorluğu üzerine yapılacak yeni seferlere yoğunlaşmak"], "correctIndex": 1}'::jsonb,
  'Mete Han, kalabalık Çin nüfusu içerisine yerleşilmesi halinde Türklerin yerleşik kültüre uyum sağlayarak örf, adet ve savaşçı kimliklerini kaybedip eriyeceklerini (asimilasyona uğrayacaklarını) öngörmüştür. Bu nedenle Çin''i sadece dışarıdan baskı ve vergi altında tutmayı tercih etmiştir.',
  'Adaylar "askeri gücün yetersizliği" (C şıkkı) veya "Çin Seddi engeli" (D şıkkı) gibi lojistik şıklara yönelebilir. Oysa soru kökünde Mete Han''ın orduyu zaten yendiği açıkça belirtilmiştir; gerekçe askeri değil, demografik ve kültürel korunma (milli benlik) refleksidir.',
  4
);

-- Soru #005 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Asya Hun Devleti''nde MÖ 58 yılında hükümdar olan Ho-han-ye, yaşanan ekonomik kriz ve kuraklık nedeniyle Çin egemenliğine (himayesine) girmeyi teklif etmiştir. Ancak kardeşi ve Batı Hun hükümdarı Çi-çi, Kurultay huzurunda bu teklife şiddetle karşı çıkarak:

*"Cesarete ve kahramanlığa dayanan atalarımızın töresini terk edip düşmana boyun eğmek utanç vericidir. Sayımız azalsa bile istiklali korumak uğruna savaşarak ölmek şereftir!"* demiştir.

Tarihsel kayıtlara geçen bu tutum, Türk siyasi düşüncesinde aşağıdakilerden hangisinin en eski ve somut kanıtı olarak kabul edilir?',
  '{"options": ["Bağımsızlık ve egemenlik (istiklal) tutkusunun her türlü maddi menfaatin üzerinde tutulduğunun", "İkili yönetim teşkilatının her zaman başarıyla sonuçlandığının", "Yerleşik hayata geçiş çabalarının kurultay kararıyla engellendiğinin", "Türk hükümdarlarının yetkilerini sınırsız biçimde kullanabildiğinin", "Töre kurallarının kurultay kararı olmaksızın değiştirilemeyeceğinin"], "correctIndex": 0}'::jsonb,
  'Çi-çi Yabgu''nun, kardeşi Ho-han-ye''nin Çin vasallığı altına girme teklifini "gülünç ve utanç verici" bularak bağımsızlık için savaşmayı tercih etmesi, Türk devlet geleneğinde "bağımsızlık / hürriyet" ülküsünün devletin bekasında temel ilke olduğunu kanıtlayan en çarpıcı tarihsel örnektir.',
  'ÖSYM burada ikili yönetim teşkilatını (B şıkkı) güçlü bir çeldirici olarak sunabilir; çünkü olay iki kardeş (Doğu-Batı idaresi) arasında geçmektedir. Ancak konuşmanın özü ve vurgulanan felsefe yönetim biçimi değil, tam bağımsızlık (istiklal) karakteridir.',
  5
);

-- Soru #006 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Asya Hun Devleti ile Han Hanedanlığı (Çin) arasında İpek Yolu''nun kontrolü ve sınır güvenliği için yapılan savaşların ardından MÖ 201 yılında imzalanan, Çin''in Hunlara yıllık ipek, tahıl ve şarap ödemesini hükme bağlayan ve Türk tarihinin ilk yazılı antlaşması kabul edilen belge aşağıdakilerden hangisidir?',
  '{"options": ["Kadeş Antlaşması", "Kuzey Şansi Antlaşması", "Margos Antlaşması", "Anatolyus Antlaşması", "Kasr-ı Şirin Antlaşması"], "correctIndex": 1}'::jsonb,
  'Türk tarihinin bilinen ilk yazılı antlaşması, Asya Hun Devleti ile Çin arasında imzalanan Kuzey Şansi Antlaşmasıdır (MÖ 201). Bu antlaşmayla Çin, Hun üstünlüğünü ve sınırlarını resmen tanımış, vergi ödemeyi kabul etmiştir.',
  'Adaylar dünya tarihindeki ilk yazılı antlaşma olan Kadeş (A) ile karıştırabilir ya da Avrupa Hun Devleti''nin Bizans''ı vergiye bağladığı meşhur Margos Antlaşması''na (C) gidebilir. Türk tarihinin *Orta Asya''daki ilk yazılı antlaşması* Kuzey Şansi''dir.',
  6
);

-- Soru #007 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  '375 yılında Balamir önderliğindeki Hunların Karadeniz’in kuzeyinden batıya ilerleyerek Ostrogot, Vizigot, Vandal ve Frank gibi kavimleri yerlerinden oynatmasıyla başlayan Kavimler Göçü, Avrupa kıtasında köklü dönüşümlere yol açmıştır.

Aşağıdakilerden hangisi Kavimler Göçü’nün Avrupa’da ortaya çıkardığı sonuçlar arasında gösterilemez?',
  '{"options": ["Roma İmparatorluğu''nun 395''te Batı ve Doğu olmak üzere ikiye ayrılması", "Avrupa''da merkezi krallıkların güçlenerek mutlak monarşilerin hâkim olması", "Şövalyelik ve toprak egemenliğine dayalı feodalite (derebeylik) rejiminin doğması", "Katolik Kilisesi ve papanın otoritesini artırarak skolastik düşüncenin yaygınlaşması", "İlk Çağ''ın kapanıp Orta Çağ''ın başlaması"], "correctIndex": 1}'::jsonb,
  'Kavimler Göçü sonrasında Avrupa''da merkezi krallıklar güçlenmemiş, tam tersine kralların halkı koruyamaması üzerine halk yerel güç odaklarına sığınmış ve merkezi krallıklar parçalanarak feodalite (derebeylik) rejimi doğmuştur. Merkezi krallıkların yeniden güçlenmesi ise yüzyıllar sonra, Orta Çağ sonunda barutun ateşli silahlarda kullanılmasıyla surların yıkılması sonucu olacaktır.',
  'ÖSYM sıklıkla "feodalite güçlendi" ifadesini "merkezi krallıklar güçlendi" şeklinde ters yüz ederek sorar. Krallıkların güçlenmesi Yeni Çağ başlarındadır; Kavimler Göçü doğrudan krallıkları zayıflatıp derebeyliği doğurmuştur.',
  7
);

-- Soru #008 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Avrupa Hun Devleti''nde Balamir''den sonra tahta geçen; Doğu Roma''ya (Bizans) baskı kurarken Batı Roma ile dostane ilişkiler yürütme stratejisini belirleyen ve ordularına Kafkaslar üzerinden Anadolu topraklarına (Erzurum, Malatya ve Çukurova) ilk kez ayak bastıran hükümdar aşağıdakilerden hangisidir?',
  '{"options": ["Atilla", "Rua", "Uldız", "Dengizik", "İrnek"], "correctIndex": 2}'::jsonb,
  'Türklerin tarihte Anadolu''ya ilk defa ayak basması, Avrupa Hun hükümdarı Uldız döneminde (398 yılı civarında) gerçekleşmiştir. Uldız ayrıca Bizans Trakya valisine hitaben tarihe geçen *"Güneşin battığı yere kadar her yeri zapt edebilirim"* sözünü söyleyen hükümdardır.',
  'Adayların büyük çoğunluğu Avrupa Hun Devleti dendiğinde tüm askeri ve siyasi başarıları otomatikman Atilla''ya atfeder. Oysa Anadolu''ya ilk ayak basan hükümdar Atilla değil, Uldız''dır.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Avrupa Hun Devleti''nin en parlak hükümdarı olan Atilla; Margos ve Anatolyus antlaşmalarıyla Doğu Roma''yı vergiye bağlamış, Galya ve İtalya seferleriyle Batı Roma''yı baskı altına almıştır.

Atilla ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Hristiyan dünyasında Tanrı''nın günahkâr kullarını cezalandırmak için gönderdiğine inanıldığı için kendisine \"Tanrının Kırbacı (Kamçısı)\" denilmiştir.", "Almanların meşhur \"Nibelungen Destanı\"nda iyiliksever ve kudretli hükümdar \"Etzel\" adıyla yer almıştır.", "Roma Seferi sırasında Papa I. Leo başkanlığındaki heyetin ricası ve Roma''nın Hristiyanlarca kutsal sayılması üzerine kenti yağmalamaktan vazgeçmiştir.", "İtalya Seferi sonrasında Hristiyanlığı resmi din olarak kabul ederek Avrupa Hunlarını tamamen yerleşik hayata geçirmiştir.", "Günümüz Macaristan devleti tarihsel ve kültürel köklerini Atilla ve Hunlara dayandırmaktadır."], "correctIndex": 3}'::jsonb,
  'Atilla hiçbir zaman Hristiyanlığı kabul etmemiştir; Gök Tanrı inancına bağlı kalmıştır. Avrupa Hun Devleti yerleşik hayata geçmemiş, bozkır göçebe savaşçı karakterini korumuştur.',
  'Papa I. Leo''nun Atilla''nın ayaklarına kapanıp af dilemesi olayını bazı adaylar "Atilla''nın Hristiyanlığa saygısından dolayı dine geçtiği" yanılgısıyla karıştırabilir. Atilla''nın Roma''yı almamasının gerçek nedenleri; Batı Roma''nın boyun eğdiğine inanması, ordusundaki salgın hastalıklar ve Doğu''daki Sasani tehlikesidir.',
  9
);

-- Soru #010 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Çin kaynaklarında "Juan-Juan" olarak adlandırılan, Göktürklerin baskısıyla batıya göç ederek Orta Avrupa''da devlet kuran ve 619 ile 626 yıllarında Sasanilerle ittifak yaparak dünya tarihinde İstanbul''u ilk kez kuşatan Türk devleti aşağıdakilerden hangisidir?',
  '{"options": ["Peçenekler", "Avarlar", "Tuna Bulgarları", "Macarlar", "Hazarlar"], "correctIndex": 1}'::jsonb,
  'Bayan Han önderliğinde Orta Avrupa merkezli devlet kuran Avarlar, 619 ve 626 yıllarında Sasaniler ile iş birliği yaparak İstanbul''u kuşatan tarihteki ilk Türk devletidir. Ayrıca üzengiyi ve süvari kalkanlarını Slav ve Germen kavimlerine öğreterek Avrupa askeri teknolojisini derinden etkilemişlerdir.',
  'İstanbul''u kuşatan diğer Türk toplulukları Peçenekler ve Tuna Bulgarlarıdır. Soru kökünde "ilk kez kuşatan" ve "Sasanilerle ittifak kuran" ifadeleri doğrudan Avarlar''ı işaret eder.',
  10
);

-- Soru #011 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karadeniz''in kuzeyinde ve Balkanlar''da etkili olan Peçenekler hakkında aşağıda verilen bilgilerden hangisi doğrudur?',
  '{"options": ["Tarihte hiçbir zaman merkezi bir devlet teşkilatına dönüşemeyip boy birliği (federasyon) halinde kalmışlardır.", "Musevilik dinini resmi din ilan ederek Hazar Barış Çağı''nı başlatmışlardır.", "Kendi adlarına madeni para bastırarak Türk tarihinde ilk para basan devlet olmuşlardır.", "Bögü Kağan döneminde Maniheizm dinini kabul ederek tapınak mimarisini başlatmışlardır.", "Rusların Karadeniz''e inmesini tamamen engelleyerek Altın Orda Devleti''nin temellerini atmışlardır."], "correctIndex": 0}'::jsonb,
  'Peçenekler, tarihte boy teşkilatlanmasını aşarak merkezi bir devlet kuramamış; boylar birliği şeklinde kalmışlardır. Bizans ordusunda ücretli askerlik yapmışlar, 1071 Malazgirt Savaşı''nda Selçuklu saflarına geçerek savaşın kazanılmasında kilit rol oynamışlardır. Danışma meclislerine ise "Komenton" denirdi.',
  'Birçok öğrenci Peçeneklerin de Hunlar veya Göktürkler gibi büyük bir "devlet" kurduğunu varsayar. Peçeneklerin en belirgin KPSS soru kalıbı "devletleşemeyip boy halinde kalmaları" ve "Bizans''ta ücretli askerlik yaparken Malazgirt''te taraf değiştirmeleri"dir.',
  11
);

-- Soru #012 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Türk dünyasının en kalabalık ve en faal boyu olan Oğuzların İslamiyeti kabul edenlerine "Türkmen", Hristiyanlığı kabul edip Bizans ordusunda paralı askerlik yapan ve günümüzde Moldova''ya bağlı özerk bir cumhuriyet olarak varlıklarını sürdüren koluna ise tarih boyunca ne ad verilmiştir?',
  '{"options": ["Kıpçak (Kuman)", "Uz (Gagavuz)", "Hazar", "Avar", "Karluk"], "correctIndex": 1}'::jsonb,
  'Oğuzların Müslüman olan koluna Türk veya Türkmen, Hristiyan olan koluna ise Uz denilmiştir. Uzlar, Peçeneklerle birlikte Malazgirt Savaşı''nda Bizans saflarından Selçuklu saflarına geçmişlerdir. Günümüzde Moldova''da yaşayan Hristiyan Gagavuz (Gökoğuz) Türkleri bu soyun devamıdır.',
  'ÖSYM sıklıkla Kıpçaklar (Kumanlar) ile Uzları çeldirici olarak birbirinin yanına koyar. Kıpçaklar Karadeniz''in kuzeyinde Deşt-i Kıpçak bölgesinde yaşamış farklı bir Türk boyudur; Hristiyan Oğuzlar ise doğrudan "Uz" olarak adlandırılır.',
  12
);

-- Soru #013 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Büyük Bulgar Devleti''nin Hazar baskısıyla yıkılmasından sonra iki kola ayrılan Bulgarlar hakkında;
I. İtil (Volga) Bulgarları, Almış Han döneminde İslamiyet''i kabul ederek Doğu Avrupa''da İslamiyet''i devletin resmi dini ilan eden ilk Türk devleti olmuştur.
II. Abbasiler tarafından İtil Bulgarlarına gönderilen İbn Fadlan, ünlü "Rihle (Yolculuk)" adlı seyahatnamesinde bu devletin kültür ve medeniyetini tasvir etmiştir.
III. Tuna Bulgarları, Boris Han döneminde Hristiyanlığı kabul ederek asimile olmuş ve liderleri Çar unvanını kullanmaya başlamıştır.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de tarihsel olarak tamamen doğrudur:
- İtil Bulgarları Almış Han döneminde (922) İslamiyet''i kabul eden ilk Türk devletidir (MEB müfredatında ilk Türk-İslam devleti kabul edilir).
- Abbasi halifesinin elçilik heyetinde yer alan İbn Fadlan, "Rihle" eserinde İtil Bulgarlarını anlatmıştır.
- Tuna Bulgarları ise Boris Han zamanında Hristiyanlaşmış, hükümdar Simon ilk kez "Çar" unvanını kullanmıştır.',
  'Adayların en büyük ezberi "İlk Müslüman Türk Devleti Karahanlılar" bilgisidir. Oysa Karahanlılar *Orta Asya''da* kurulan ilk Müslüman Türk devletidir. Genel Türk tarihinde İslamiyet''i resmi din olarak ilk kabul eden Türk devleti ise Doğu Avrupa''daki İtil Bulgarlarıdır (MEB kazanımı).',
  13
);

-- Soru #014 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde genel kural "ordu-millet" anlayışının hâkim olması ve eli silah tutan herkesin asker sayılmasıdır. Ancak Kafkaslar ve Karadeniz’in kuzeyinde hüküm süren bir Türk devleti bu kuralın dışına çıkarak Türk tarihinde ilk kez ordusunda ücretli (paralı) askerler istihdam etmiştir.

Kürk Yolu ticareti sayesinde büyük bir refaha ulaşan ve Musevilik dinini benimseyen tek Türk devleti olan bu siyasi teşekkül aşağıdakilerden hangisidir?',
  '{"options": ["Göktürkler", "Hazarlar", "Uygurlar", "Türgişler", "Kırgızlar"], "correctIndex": 1}'::jsonb,
  'Hazarlar, Kürk Yolu sayesinde çok büyük bir ticari zenginliğe ulaşmış, bünyesinde Musevilik, Hristiyanlık, İslamiyet ve Şamanizm''in bir arada barış içinde yaşadığı "Pax Hazaria (Hazar Barış Çağı)" ortamını kurmuşlardır. Türk tarihinde ordusuna maaşlı/ücretli asker alan ilk Türk devleti Hazarlar''dır. Günümüzde Polonya ve Litvanya''da yaşayan Karay / Karaim Türkleri Hazarların Musevi torunlarıdır.',
  'ÖSYM "Türklerde ordu-millet anlayışı vardır, ordu daima ücretsizdir" genellemesini Hazarların "ücretli asker istihdam etmesi" istisnası üzerinden çeldirici yapar. Bir diğer tuzak ise İslamlaşmayı engelleyen devlet sorulduğunda Türgişler ile Hazarların savaş alanlarını karıştırmaktır (Hazarlar Kafkasya''da Hz. Osman''la, Türgişler ise Maveraünnehir''de Emevilerle savaşmıştır).',
  14
);

-- Soru #015 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karadeniz''in kuzeyinde "Deşt-i Kıpçak" (Kıpçak Bozkırı) olarak bilinen geniş coğrafyada yaşayan Kıpçaklar (Kumanlar); sarışın, mavi gözlü fiziki yapıları ve savaşçı kimlikleriyle tanınmışlardır.

Aşağıdakilerden hangisi Kıpçakların Türk ve dünya kültür tarihindeki izlerinden biri değildir?',
  '{"options": ["Rus prenslikleriyle yaptıkları mücadelelerin Rusların ünlü \"İgor Destanı\"na konu olması", "Oğuz Türkleriyle giriştikleri egemenlik mücadelelerinin Türk edebiyatının başyapıtlarından \"Dede Korkut Hikayeleri\"nde işlenmesi", "İtalyan ve Alman tüccarların derlediği, Kıpçak Türkçesi-Latince-Farsça sözlük olan \"Codex Cumanicus\"u miras bırakmaları", "Mısır''da Eyyubiler ve Memlükler ordusunda görev alarak daha sonra bu coğrafyada hükümdarlık kurmaları", "Baga Tarkan döneminde kendi adlarına madeni para bastırarak serbest piyasa ekonomisine öncülük etmeleri"], "correctIndex": 4}'::jsonb,
  'Kendi adına madeni para bastıran ilk Türk hükümdarı Baga Tarkan olup, bu gelişme Kıpçaklara değil, Türgişler devletine aittir. Diğer tüm öncüller (İgor Destanı, Dede Korkut, Codex Cumanicus, Memlük ordusu) Kıpçaklara ait temel sınav kazanımlarıdır.',
  'ÖSYM Dede Korkut ve İgor Destanı''nı soru köküne koyarak sözlüğün adını (Codex Cumanicus) veya hükümdar/devlet eşleştirmesini sorar. Baga Tarkan ile Kıpçakları karıştırmak klasik bir sınav tuzağıdır.',
  15
);

-- Soru #016 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Orta Asya''da Çu ve İli nehirleri çevresinde kurulan Türgişler ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Hükümdarları Baga Tarkan kendi adına madeni para (yarmak) bastırmıştır.", "Sulu Kağan döneminde Emevi ordularıyla mücadele ederek (Haristan Savaşı) Orta Asya ve Maveraünnehir''in Arap hakimiyetine girmesini bir süre engellemişlerdir.", "Talas Savaşı sırasında Abbasilerin yanında yer alarak topluca İslamiyet''e geçen ilk Türk boyu olmuşlardır.", "Sarı ve Kara Türgişler olmak üzere iki ana kola ayrılarak iç mücadeleler sonucu zayıflamışlardır.", "Karlukların baskısıyla bağımsızlıklarını kaybederek siyasi varlıklarını yitirmişlerdir."], "correctIndex": 2}'::jsonb,
  '751 Talas Savaşı''nda Çinlilere karşı Abbasileri destekleyip kitleler halinde İslamiyet''e geçen ilk Türk boyu Türgişler değil, Karluklardır. Türgişler ise tam aksine Emevilerle savaşarak Maveraünnehir ve Orta Asya''nın Araplaşmasına karşı direnmişlerdir.',
  'Adaylar Araplarla savaşan devletler (Hazarlar ve Türgişler) ile Araplarla ittifak kurup Müslüman olan boyları (Karluklar) birbirine karıştırma eğilimindedir. Soru bu kritik ayrımı hedefler.',
  16
);

-- Soru #017 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Uygur Devleti''ni 840 yılında yıkarak Ötüken merkezli devlet kuran, ölülerini yakan, günümüzde 500 bini aşkın dizesiyle dünyanın en uzun yaşayan sözlü destanı kabul edilen "Manas Destanı"nın sahibi olan ve Cengiz Han (Moğol) İmparatorluğu''na itaat eden ilk Türk devleti unvanını taşıyan Türk topluluğu aşağıdakilerden hangisidir?',
  '{"options": ["Karluklar", "Kırgızlar", "Kimekler", "Başkırtlar", "Sibirler"], "correctIndex": 1}'::jsonb,
  'Manas Destanı''nın sahibi olan, Yenisey Kitabeleri''ni diken, ölülerini yakan ve Moğollara (Cengiz Han''a) itaat eden ilk Türk devleti Kırgızlardır.',
  'ÖSYM''nin en meşhur ince ayrımı:
- Cengiz Han''a itaat eden ilk Türk boyu: Karluklar
- Cengiz Han''a itaat eden ilk Türk devleti: Kırgızlar
Adaylar "boy" ile "devlet" kelimesine dikkat etmezse Karluklar (A şıkkı) tuzağına düşer.',
  17
);

-- Soru #018 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi dönemde Göktürk ve Uygur devletlerinin hâkimiyetinde yaşayan Karluk boyu;
I. 751 Talas Savaşı''nda Çinlilere karşı Müslüman Abbasileri desteklemeleri,
II. İslamiyet''i kabul eden ilk Türk boyu olmaları,
III. Yağma, Çiğil ve Tuhsi boylarıyla birleşerek Orta Asya''daki ilk Müslüman Türk devleti olan Karahanlıların temelini atmaları,
IV. Cengiz Han''a itaat eden ilk Türk devleti olmaları

özelliklerinden hangilerine sahiptir?',
  '{"options": ["I ve II", "I, II ve III", "II ve IV", "III ve IV", "I, II, III ve IV"], "correctIndex": 1}'::jsonb,
  'I, II ve III numaralı öncüller Karluklara aittir (Talas Savaşı''nda Abbasileri desteklemişler, İslamiyet''i kabul eden ilk Türk boyu olmuşlar ve Karahanlıların omurgasını oluşturmuşlardır). Ancak IV. öncül yanlıştır; Karluklar Cengiz Han''a itaat eden ilk Türk boyudur; ilk Türk devleti ise Kırgızlardır.',
  'Soru öncüllerindeki "ilk Türk devleti" ile "ilk Türk boyu" kelime oyunudur. Aday IV. öncülü doğru kabul ederse E şıkkına gider ve elenir.',
  18
);

-- Soru #019 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Türk boyları göç hareketleri sonucunda farklı coğrafyalarda çok sayıda devlet kurmuşlardır. Ancak bazı topluluklar hem ana yurtları olan Orta Asya''da hem de göç ettikleri Orta ve Doğu Avrupa''da teşkilatlı devletler tesis etmeyi başarmışlardır.

Buna göre, hem Orta Asya’da hem de Avrupa’da devlet kurmuş olan iki Türk topluluğu aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Hunlar – Avarlar", "Göktürkler – Uygurlar", "Hazarlar – Peçenekler", "Kıpçaklar – Karluklar", "Bulgarlar – Macarlar"], "correctIndex": 0}'::jsonb,
  '- Hunlar: Orta Asya''da Asya Hun Devleti''ni, Avrupa''da ise Kavimler Göçü sonrası Avrupa Hun Devleti''ni kurmuşlardır.
- Avarlar: Orta Asya''da Göktürklerden önce "Juan-Juan" devleti olarak hüküm sürmüş, Göktürklerin baskısıyla batıya göç ederek Orta Avrupa''da Avar Kağanlığı''nı kurmuşlardır.',
  'Göktürkler ve Uygurlar hiçbir zaman Avrupa''ya göç etmemiş, Orta Asya''da kalmışlardır. Peçenekler ve Kıpçaklar ise Avrupa''ya geçmiş fakat Orta Asya''da teşkilatlı bağımsız büyük devletler kurmamışlardır.',
  19
);

-- Soru #020 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Soylarını Avrupa Hun Hükümdarı Atilla''ya dayandıran, IX. yüzyılın sonlarında Arpad liderliğinde bugünkü yurtlarına yerleşen; Hristiyanlığı kabul ederek zamanla Slav ve Germen kültürleri içerisinde dillerini ve siyasi kimliklerini dönüştürseler de Türk köklerini unutmayarak 1870 yılında Budapeşte''de tarihin ilk Türkoloji Enstitüsü''nü kuran ve 2008''den bu yana Türk Kurultayı''na ev sahipliği yapan topluluk aşağıdakilerden hangisidir?',
  '{"options": ["Bulgarlar", "Macarlar", "Peçenekler", "Hazarlar", "Uzlar"], "correctIndex": 1}'::jsonb,
  'Macarlar, Hristiyanlığı benimsemelerine rağmen milli benlik arayışlarını sürdürmüş ve 1870''te Vámbéry''nin gayretleriyle dünyanın ilk Türkoloji Enstitüsü''nü Budapeşte''de kurmuşlardır. Günümüzde her iki yılda bir Bugac''ta düzenlenen Hun-Türk Kurultayı''na ev sahipliği yapmaktadırlar.',
  'Adaylar Türkoloji Enstitüsü''nün Osmanlı İmparatorluğu''nda veya Türklerin yoğun yaşadığı Rusya/Kazan bölgesinde kurulduğunu düşünebilir. Kurulan ilk enstitü Macaristan''ın başkenti Budapeşte''dedir (Arminius Vámbéry).',
  20
);

-- Soru #021 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'I. Göktürk Devleti''nin batı kanadını yöneten İstemi Yabgu, İpek Yolu ticaretinin denetimini ele geçirmek amacıyla çok yönlü ve pragmatik bir dış politika izlemiştir.

Bu doğrultuda İstemi Yabgu''nun izlediği diplomatik ve askerî stratejiyle ilgili aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Önce Bizans ile anlaşarak Akhunları yıkmış, ardından Sasanilerle ittifak kurarak Bizans''a saldırmıştır.", "Önce Sasaniler ile ittifak yaparak Akhun Devleti''ne son vermiş, ardından Sasanilerin İpek Yolu''nu kapatması üzerine Bizans İmparatorluğu ile diplomatik ittifak kurmuştur.", "Çin ile birleşerek Sasani Devleti''ni ortadan kaldırmış ve İpek Yolu''nu tamamen Çin denetimine bırakmıştır.", "Akhunlar ve Sasanilerle üçlü savunma paktı kurarak Bizans''ın Orta Asya''ya ilerlemesini durdurmuştur.", "Avarlar ile anlaşarak Karadeniz''in kuzeyinden Bizans''a karşı ortak bir ordu sevk etmiştir."], "correctIndex": 1}'::jsonb,
  'İstemi Yabgu İpek Yolu''na egemen olmak için önce Sasanilerle iş birliği yaparak Akhunları (Eftalitleri) yıkmış ve topraklarını paylaşmıştır. Ardından Sasanilerin İpek Yolu ipek ticaretini engellemesi üzerine Bizans İmparatorluğu ile diplomatik ilişki kurmuş (elçi Maniac gönderilmiş, Bizans''tan Zemarkhos gelmiştir) ve Sasanilere karşı Bizans ile ittifak yapmıştır. Bu olay Orta Asya''dan Bizans''a gönderilen ilk resmi Türk elçiliğidir.',
  'ÖSYM ittifakların sırasını (A şıkkı) veya muhatap devletleri ters yüz ederek sorar. Doğru formül: "Sasani ile anlaş  →  Akhun''u yık; Bizans ile anlaş  →  Sasani''yi baskı altına al."',
  21
);

-- Soru #022 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'I. Göktürk Devleti''nde Mukan Kağan''dan sonra tahta geçen; Hintli bir rahibin etkisi altında kalarak Budizm''i (Buda dinini) benimseyen, başkentte Budist bir tapınak inşa ettirmek isteyen ancak bu girişimi hem devlet erkanı hem de Kurultay tarafından "Türklerin savaşçılık karakterini ve töresini zayıflatacağı" gerekçesiyle reddedilerek halkıyla arası açılan Göktürk hükümdarı aşağıdakilerden hangisidir?',
  '{"options": ["Bumin Kağan", "Tapo (Taspar) Kağan", "İşbara Kağan", "Bögü Kağan", "Kapgan Kağan"], "correctIndex": 1}'::jsonb,
  'I. Göktürk hükümdarı Tapo Kağan, Budizm dinini kabul etmiş ve halkına da yaymak istemiştir. Ancak Kurultay ve vezirler, Budizm''in barışçıl ve pasifist öğretilerinin Türklerin dinamik göçebe savaşçılık ruhunu öldüreceğini belirterek tapınak yapımına karşı çıkmışlardır.',
  'Sınavda adayların en çok düştüğü çeldirici Bögü Kağan''dır (D şıkkı). Bögü Kağan Uygur hükümdarıdır ve benimsediği din Maniheizm''dir. Budizm''i benimseyip kurultay engeliyle karşılaşan Göktürk hükümdarı ise Tapo Kağan''dır.',
  22
);

-- Soru #023 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'I. Göktürk Devleti''nin 630 yılında Doğu ve Batı olarak Çin hâkimiyetine girmesiyle Türk tarihinde 50 yıl süren "Matem / Esaret Devri" başlamıştır. Bu esaret döneminde 639 yılında 39 silah arkadaşıyla birlikte Çin sarayını basarak imparatoru esir almayı ve Türk milletinin bağımsızlığını yeniden ilan etmeyi amaçlayan destansı istiklal girişiminin önderi aşağıdakilerden hangisidir?',
  '{"options": ["Vezir Tonyukuk", "Kürşad", "Baga Tarkan", "Kutluk Kağan", "İlteriş Kağan"], "correctIndex": 1}'::jsonb,
  '639 yılında Çin sarayına yönelik 40 kişilik baskını organize eden Kürşad (ve ardından gelen Nişufu isyanı), esaret altındaki Türk boylarının bağımsızlık ateşini yakmış ve 682''de II. Göktürk (Kutluk) Devleti''nin kurulmasına zemin hazırlamıştır.',
  'Adaylar bu isyanın liderini devleti yeniden toparlayan Kutluk Kağan ile karıştırabilir. Kürşad bağımsızlık isyanını başlatan fedakâr komutandır; devleti toparlayan ise Kutluk (İlteriş) Kağan''dır.',
  23
);

-- Soru #024 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  '682 yılında Çin esaretine son vererek II. Göktürk Devleti''ni kuran ve dağınık Türk boylarını bir araya toplayıp derlediği için Kurultay tarafından kendisine "İlteriş" (derleyen, toplayan) unvanı verilen hükümdar ile bu süreçte ona stratejik danışmanlık yapan, "Apa Tarkan" unvanlı ve Batılı tarihçilerce "Türklerin Bismarck''ı" olarak anılan ilk Türk tarihçisi ve veziri aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Bumin Kağan — İstemi Yabgu", "Kutluk Kağan — Vezir Tonyukuk", "Bilge Kağan — Kül Tigin", "Kapgan Kağan — Yolluk Tigin", "Kutluk Kağan — Yolluk Tigin"], "correctIndex": 1}'::jsonb,
  'II. Göktürk Devleti''nin kurucusu Kutluk (İlteriş) Kağan''dır. Bu devletin teşkilatlanmasında ve bağımsızlık stratejisinde en büyük pay sahibi olan, dört hükümdara (Kutluk, Kapgan, İnal, Bilge) vezirlik yapmış, Apa Tarkan unvanlı devlet adamı Vezir Tonyukuk''tur. Tonyukuk kendi anıt taşını bizzat dikip yazdırdığı için Türk tarihinin ilk tarihçisi ve hatibi kabul edilir.',
  'ÖSYM Tonyukuk ile Yolluk Tigin''i (E şıkkı) sıkça karşı karşıya getirir. Tonyukuk ilk devlet adamı ve anıt yazarıdır; Yolluk Tigin ise Bilge Kağan ve Kül Tigin anıtlarının metnini taşa kazıyan kâtip/yazardır.',
  24
);

-- Soru #025 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Bugünkü Moğolistan sınırları içinde Orhun Irmağı vadisinde yer alan Orhun (Göktürk) Abideleri, Türk dili, tarihi ve edebiyatının ilk yazılı şaheseridir.

Orhun Abideleri ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Vezir Tonyukuk (725), Kül Tigin (732) ve Bilge Kağan (735) adına olmak üzere üç ana dikilitaştan oluşur.", "Kül Tigin ve Bilge Kağan yazıtlarının kâtipliğini ve taş üzerine kazıma işini yeğenleri Yolluk Tigin yapmıştır.", "Danimarkalı dilbilimci Vilhelm Thomsen tarafından 1893 yılında çözülmüş olup yazıtlar üzerinde çözülen ilk kelime \"Tengri\" (Tanrı)dir.", "Türk hükümdarlarının halka, halkın da devlete karşı görevlerini anlatan, devleti yönetme sanatını işleyen Türk tarihinin ilk \"siyasetname\" örneğidir.", "Abidelerin bir yüzü Soğdca, diğer yüzü ise Uygur alfabesiyle kaleme alınmıştır."], "correctIndex": 4}'::jsonb,
  'Orhun Abideleri, 38 harfli milli Göktürk (Orhun) alfabesi ile yazılmıştır. Anıtların bir yüzü Türkçe, diğer yüzü ise o dönemin diplomatik dili ve Çin halkına da mesaj iletmek amacıyla Çince yazılmıştır. Soğdca ve Uygur alfabesiyle yazılmamıştır.',
  'Adaylar Soğd alfabesini veya Bugut Yazıtı''nın özelliklerini Orhun Abideleri ile karıştırabilir. Orhun Abideleri Türkçe ve Çince olarak Göktürk alfabesiyle yazılmıştır. Ayrıca ilk çözülen kelimenin "Tengri" olması ve siyasetname özelliği KPSS''nin klasik favori soru detaylarıdır.',
  25
);

-- Soru #026 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi döneme ait yazıtlar Türk tarihinin en önemli birincil kaynaklarıdır.
I. Bugut Yazıtı: Göktürklere ait bilinen en eski yazıt olup Soğdca harflerle yazılmıştır.
II. Yenisey Yazıtları: Kırgızlara ait olup mezar taşlarından oluşan ve Türk tarihinin bilinen en eski kitabeleridir.
III. Karabalgasun ve Sine Uşu Yazıtları: Uygurlara ait olup Maniheizm''in kabulünü ve kağanların icraatlarını anlatır.

Yukarıda verilen kitabe ve ait olduğu Türk topluluğu eşleştirmelerinden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Öncüllerin tamamı doğrudur:
- Bugut Yazıtı: I. Göktürk dönemine (Mahan Tigin) ait en eski Göktürk yazıtıdır ve dili Soğdca-Sanskritçedir.
- Yenisey Yazıtları: Kırgızlara aittir, mezar taşı niteliğindedir ve edebi yönden Orhun Abideleri kadar gelişmiş değildir.
- Karabalgasun ve Sine Uşu (Taryat): Uygur kağanlarına ait yazıtlardır.',
  'Adaylar en eski kitabe denince sadece Orhun Abideleri''ni düşünür. Oysa edebi olarak okunan ilk yazıt Orhun olsa da mezar taşı ve kitabe olarak Yenisey (Kırgız) ve Bugut (I. Göktürk) kronolojik olarak daha eskidir.',
  26
);

-- Soru #027 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  '744 yılında Kutluk Bilge Kül Kağan tarafından kurulan ve Türklerin geleneksel kutsal başkenti Ötüken''i terk ederek başkentini Karabalgasun (Ordu-Balık) kentine taşıyan, ardından Bögü Kağan döneminde 762 yılında kabul ettikleri din sebebiyle Türk tarihinde ilk kez yerleşik yaşama geçen devlet aşağıdakilerden hangisidir?',
  '{"options": ["Göktürkler", "Uygurlar", "Hazarlar", "Türgişler", "Akhunlar"], "correctIndex": 1}'::jsonb,
  'Uygurlar, Bögü Kağan zamanında Tibet Seferi dönüşünde Soğdlu tüccarların etkisiyle Maniheizm (Mani) dinini kabul etmişlerdir. Başkentlerini Karabalgasun''a taşımış ve yerleşik hayata geçen ilk Türk devleti olmuşlardır.',
  'ÖSYM burada dinin adını (Budizm - Maniheizm) veya hükümdarı (Kutluk Bilge Kül Kağan - Bögü Kağan) yer değiştirerek çeldirici üretir. Devleti kuran Kutluk Bilge Kül Kağan, Maniheizm''i getiren ise Bögü Kağan''dır.',
  27
);

-- Soru #028 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Uygurların Bögü Kağan döneminde benimsediği Maniheizm dini; et yemeyi, canlı öldürmeyi ve savaşmayı yasaklayan bir inanç sistemidir.

Aşağıdakilerden hangisi Maniheizm dininin Uygur toplumunda meydana getirdiği doğrudan değişimlerden biri olamaz?',
  '{"options": ["Beslenme alışkanlıklarının değişmesiyle birlikte tarım faaliyetlerinin ve sulama kanallarının (Tötö kanalı) artması", "Türklerin savaşçı ve mücadeleci özelliklerinin zamanla zayıflaması", "Şehirleşmenin başlaması ve \"balıg\" adı verilen surlarla çevrili kentlerin kurulması", "Hükümdarların ve hanedan üyelerinin kut inancını terk ederek teokratik monarşiyi sonlandırması", "Tapınak ve saray inşasıyla birlikte kubbe ve duvar resmi (fresko) sanatının gelişmesi"], "correctIndex": 3}'::jsonb,
  'Maniheizm dini kut inancını sona erdirmemiştir. Hükümdarlar yönetme yetkisini tanrısal kaynaklı görmeye devam etmiş, hatta Mani dininin etkisiyle hükümdar unvanlarının başına ışık/nur anlamına gelen "Aytengri" ve "Kün" gibi unvanlar eklemişlerdir.',
  'Adaylar yerleşik hayata geçince veya yeni dine girince hükümdarların kut anlayışını tamamen bıraktığını zanneder. Oysa kut inancı İslamiyet öncesinde tüm Türk devletlerinde kesintisiz devam etmiş, İslamiyet''ten sonra bile "Allah''ın nasibi / zıllullah" şeklinde form değiştirerek sürmüştür.',
  28
);

-- Soru #029 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Uygurlar, yerleşik hayata geçişleriyle birlikte Türk kültür ve medeniyet tarihine çok sayıda "ilk" kazandırmışlardır.

Aşağıdakilerden hangisi Uygurların Türk uygarlık tarihine kazandırdığı yeniliklerden biri değildir?',
  '{"options": ["\"Çav\" adı verilen kağıt parayı basarak faizle borç verme usulüyle ilk bankacılık faaliyetlerini başlatmaları", "Tahta harflerden oluşan hareketli matbaayı ve kütüphaneleri kurup örgün eğitim kurumlarını açmaları", "Töre kurallarını yazılı hale getirerek borçlar, kiralama ve ticaret hukukunu kayıt altına almaları", "Minyatür ve fresko sanatını geliştirip orta oyunu ve pandomim ile Türk tiyatrosunun temellerini atmaları", "Türk tarihinde ilk kez düzenli posta teşkilatını (Berid Teşkilatı) kurarak merkezi otoriteyi güçlendirmeleri"], "correctIndex": 4}'::jsonb,
  'Düzenli posta ve istihbarat teşkilatı olan "Berid Teşkilatı", İslam tarihinde Hz. Ömer ve Emeviler döneminde kurulmuş, Türk-İslam devletlerinde (Gazneliler, Büyük Selçuklu) kurumsallaşmıştır. İslamiyet öncesi Türk devletlerinde ise haberleşme atlı ulaklarla sağlanmış, ayrı bir resmi posta bürokrasisi teşkilatı kurulmamıştır. Diğer şıkların tamamı (Çav, matbaa, yazılı töre, minyatür/tiyatro) Uygurlara ait tartışmasız ilklerdir.',
  '"Çav" adlı kağıt para ve faizli borç/ipotek sözleşmeleri adaya şaşırtıcı ve "fazla modern" gelebilir; ancak bunlar Ramazan Yetgin ve MEB notlarında özellikle altı çizilen kesin Uygur kazanımlarıdır.',
  29
);

-- Soru #030 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devlet anlayışında devleti yönetme yetkisinin Gök Tanrı tarafından hükümdara ve onun hanedanına verildiğine inanılırdı. Bu ilahi bağışa "Kut" adı verilmiştir.

Buna göre, kut anlayışının Türk devlet yapısında ortaya çıkardığı en önemli siyasi sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Hükümdarların halk nezdinde tanrı-kral (yarı tanrı) olarak kabul edilmesi", "Belirli bir veraset kanunu olmadığı için hanedanın tüm erkek üyelerinin tahtta hak iddia etmesi ve sık sık taht kavgalarının yaşanması", "Kurultay meclisinin hükümdarı denetleme yetkisinin tamamen elinden alınması", "Türk hükümdarlarının yalnızca dini törenleri yöneten birer din adamı haline gelmesi", "Töre kurallarının hükümdarın tek taraflı iradesiyle her an iptal edilebilmesi"], "correctIndex": 1}'::jsonb,
  'Kut kan bağıyla tüm hanedan üyelerine (oğul, kardeş, yeğen, amca) geçtiği için "ülke hanedanın ortak malıdır" prensibi geçerliydi. Tahta kimin geçeceğine dair kesin bir kural (veraset düzeni) olmadığı için her kağan ölümünde taht kavgaları çıkmış, bu durum Türk devletlerinin kısa sürede parçalanıp yıkılmalarına neden olmuştur. Türk kağanları asla Mısır''daki gibi "tanrı-kral" olmamışlardır.',
  'Adaylar kut yetkisini Tanrı''nın vermesinden dolayı hükümdarın "Tanrı-kral" (A şıkkı) veya "Din adamı/rahip-kral" (D şıkkı) olduğunu zannedebilir. Eski Türklerde teokratik yapı ve tebaa üzerinde tanrılık iddiası yoktur; kut sadece siyasal meşruiyet aracıdır.',
  30
);

-- Soru #031 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türk devletlerinde sınırların çok geniş olması nedeniyle ülke Doğu ve Batı (veya Sağ-Sol, Kuzey-Güney) şeklinde iki idari bölgeye ayrılarak yönetilirdi. Güneşin doğduğu yön olan Doğu kutsal kabul edilir ve asıl Kağan doğuda otururdu. Batı kanadını ise Kağan’a bağlı olarak hanedandan bir prens (genellikle kardeşi) "Yabgu" unvanıyla yönetirdi.

Bu "İkili Teşkilat" sistemiyle ilgili olarak aşağıdakilerden hangisi söylenemez?',
  '{"options": ["Yönetimde federatif bir devlet anlayışının benimsendiğinin göstergesidir.", "Geniş coğrafyaların idaresini kolaylaştırma amacına hizmet etmiştir.", "Batı kanadı iç işlerinde serbest, dış işlerinde ise doğudaki büyük Kağana bağlıdır.", "Türk devletlerinde merkezi otoriteyi daima en üst seviyede tutarak devletin parçalanmasını kesin olarak önlemiştir.", "Tarihte ilk kez Asya Hun Devleti''nde uygulanmış, daha sonra Göktürklerde de devam ettirilmiştir."], "correctIndex": 3}'::jsonb,
  'İkili teşkilat sistemi geniş bozkır coğrafyasında yönetimi kolaylaştırsa da kriz anlarında batıdaki yabgunun bağımsızlığını ilan etmesine veya doğu ile taht mücadelesine girişmesine yol açmış; yani merkezi otoriteyi zayıflatarak devletin parçalanmasını ve yıkılışını kolaylaştırmıştır.',
  'ÖSYM "merkezi otoriteyi güçlendirir / parçalanmayı önler" ifadesini çok sık pozitif bir tuzak olarak seçeneklere koyar. Oysa ikili teşkilat merkezi otoritenin tam zıddıdır (federatiftir) ve bölünmeyi hızlandırmıştır.',
  31
);

-- Soru #032 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'İslamiyet öncesi Türk devletlerinde devlet ve toplum meselelerinin görüşülüp karara bağlandığı meclise "Kurultay", "Toy" veya "Kengeş" adı verilirdi. Kurultay üyelerine ise genel olarak "Toygun" denirdi.

Buna göre, aşağıdakilerden hangisi bir Kurultay''ın doğal üyeleri (Toygun) arasında yer almaz?',
  '{"options": ["Hakan (Kağan)", "Hatun (Katun)", "Boy Beyleri", "Şamanlar veya Kamlar (Din Adamları)", "Ayguclar (Vezirler) ve Ordu Komutanları"], "correctIndex": 3}'::jsonb,
  'Eski Türk devletlerinde din adamları (Kam / Baksı / Şaman) Kurultay''ın doğal ve daimi üyesi (Toygun) değildir. Bu durum eski Türk devlet teşkilatının teokratik bir ruhban sınıfının güdümünde olmadığını, dünyevi ve askeri-demokratik bir nitelik taşıdığını gösterir.',
  'Adaylar Hatun''un kurultaya katılamayacağını düşünerek B şıkkına gidebilir. Oysa Hatun elçi kabulünde ve kurultayda hakanın yanında bizzat yer alır. Kurultaya katılamayan zümre din adamlarıdır (şamanlar).',
  32
);

-- Soru #033 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Eski Türk devletlerinde kurultay meclisleri devletlerin siyasi ve kültürel yapılarına göre farklı isimlerle anılmıştır.

Aşağıdaki Türk devleti ve kullandığı meclis ismi eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Peçenekler $ → $ Komenton", "Tuna Bulgarları $ → $ Millet Meclisi", "Avrupa Hunları $ → $ Seçkinler Meclisi", "Hazarlar $ → $ İhtiyarlar Meclisi", "Tabgaçlar $ → $ Toy Meclisi"], "correctIndex": 4}'::jsonb,
  'Kuzey Çin''de 200 yıl egemen olan Türk devleti Tabgaçlar''ın meclisine "Nazırlar Meclisi" adı verilirdi. Toy Meclisi genel Türk kurultayıdır.
- Peçenekler: Komenton
- Tuna Bulgarları: Millet Meclisi
- Avrupa Hunları: Seçkinler Meclisi
- Hazarlar: İhtiyarlar Meclisi
- Tabgaçlar: Nazırlar Meclisi',
  'ÖSYM son yıllarda Peçeneklerin meclisi olan "Komenton"u veya Hazarların "İhtiyarlar Meclisi"ni doğrudan eşleştirme sorusu olarak sormaktadır. Tabgaçların Nazırlar Meclisi Ramazan Yetgin notlarında özel uyarıyla vurgulanan kritik bir detaydır.',
  33
);

-- Soru #034 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'İslamiyet öncesi Türk devlet geleneğinde hükümdarın siyasi hâkimiyetini ve meşruiyetini simgeleyen çeşitli semboller ve alametler kullanılmıştır.

Aşağıdakilerden hangisi İslamiyet öncesi Türk hükümdarlık sembolleri (alametleri) arasında yer almaz?',
  '{"options": ["Otağ (Hükümdar Çadırı)", "Örgin (Taht)", "Tuğ (Sancak) ve Nevbet (Davul)", "Berge (Kamçı) ve Kur (Kemer)", "Ok"], "correctIndex": 4}'::jsonb,
  'Eski Türklerde "Yay" hâkimiyet ve hükümdarlık sembolüdür; ancak "Ok" kesinlikle bir hükümdarlık sembolü DEĞİLDİR! Ok, bağlılığı, itaati ve kağana tabiiyeti (halkı ve boyları) temsil eder. Yay emreden, ok ise emre boyun eğendir.',
  'ÖSYM soru bankalarında ve sınavlarda "Hangisi hükümdarlık sembolü değildir?" sorusunun açık ara 1 numaralı yanıtı ve çeldiricisi "Ok"tur. Aday yay hükümdarlık sembolü olunca okun da sembol olduğunu zanneder; oysa ok bağlılık alametidir.',
  34
);

-- Soru #035 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devlet teşkilatında yer alan görevliler ve yürüttükleri hizmetlerle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Ayukı $ → $ Hükümet", "Aygucı (Üge) $ → $ Başbakan (Vezir)", "Tudun $ → $ Vergi memuru / Mali denetçi", "Tutuk $ → $ Askeri vali", "Tamgacı (Bitikçi) $ → $ Hükümdarın özel doktoru ve hekimi"], "correctIndex": 4}'::jsonb,
  'Tamgacı (veya Bitikçi), devletin iç ve dış yazışmalarını yürüten, belgelere hükümdarın damgasını/mührünü basan kâtip ve yazıcıdır. Hükümdarın ve halkın sağlık işlerine bakan doktora/hekime ise eski Türklerde "Otacı" veya "Emçi" adı verilirdi.',
  'ÖSYM "Tudun" (vergi memuru) ile "Tutuk" (askeri vali) kelimelerini ya da "Bitikçi" ile "Otacı"yı birbirinin yerine yazarak adayı kavram kargaşasına düşürür.',
  35
);

-- Soru #036 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Eski Türk toplumunun ve devlet teşkilatının temelini yazısız hukuk kuralları olan "Töre" oluştururdu. Töre; gelenekler, kurultay kararları ve kağanın buyrukları ile şekillenir ve gerektiğinde kurultay kararıyla değiştirilebilirdi. Ancak törenin hiçbir kağan veya meclis tarafından asla değiştirilemeyen dört temel evrensel ilkesi bulunmaktaydı.

Aşağıdakilerden hangisi törenin bu değişmez dört temel ilkesi arasında yer almaz?',
  '{"options": ["Könilik (Adalet)", "Uzluk (İyilik / Faydalılık)", "Tüzlük (Eşitlik)", "Kişilik / İnsanlık", "Kutluluk (Teokrasi)"], "correctIndex": 4}'::jsonb,
  'Törenin asla değişmeyen ve anayasal güvence niteliğindeki dört ilkesi şunlardır:
1. Könilik: Adalet
2. Uzluk: İyilik, faydalılık, kamu yararı
3. Tüzlük: Kanun önünde eşitlik
4. Kişilik (İnsanlık): İnsaniyet ve evrensel merhamet
"Kutluluk" törenin değişmez ilkelerinden biri değildir.',
  '2015 KPSS''de "Könilik (Adalet)" sorulmuştu. Şimdi adayların önüne "Uzluk" veya "Tüzlük" kavramları sıkça çeldirici olarak konulmaktadır. Kut inancıyla bu dört etik-hukuki ilke birbirine karıştırılmamalıdır.',
  36
);

-- Soru #037 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'İslamiyet öncesi Türk toplumsal yapısı kan bağına dayalı hiyerarşik bir piramit şeklinde örgütlenmiştir.

Bu toplumsal yapının en küçük yapı taşı olan "Aile"den en üst örgütlenme olan "Devlet"e doğru küçükten büyüğe sıralanışı aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Oğuş $ → $ Urug $ → $ Boy $ → $ Bodun $ → $ İl", "Urug $ → $ Oğuş $ → $ Bodun $ → $ Boy $ → $ İl", "Oğuş $ → $ Boy $ → $ Urug $ → $ İl $ → $ Bodun", "Boy $ → $ Bodun $ → $ Oğuş $ → $ Urug $ → $ İl", "Oğuş $ → $ Urug $ → $ Bodun $ → $ Boy $ → $ İl"], "correctIndex": 0}'::jsonb,
  'Eski Türk toplum yapısının çekirdeği ailedir. Sıralama şöyledir:
1. Oğuş: Aile
2. Urug: Sülale (Aileler birliği)
3. Boy (Bod): Kabile / Boy
4. Bodun: Millet (Boylar birliği)
5. İl (El): Devlet',
  'ÖSYM''nin her 2-3 yılda bir sorduğu klasik soru tipidir. Adaylar genellikle "Urug" (sülale) ile "Oğuş" (aile) sırasını karıştırır veya Boy ile Bodun''un yerini değiştirir (E şıkkı tuzağı).',
  37
);

-- Soru #038 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk orduları hızlı hareket eden süvari birliklerinden oluşurdu. Savaş meydanında düşmanı yanıltmak amacıyla sahte bir geri çekilme uygulayıp ardından pusu kurulan alanda düşmanı hilal şeklinde çembere alarak imha etme esasına dayanan Turan taktiği uygulanırdı.

Ayrıca Türk ordusunda ana ordu sefere çıkmadan önce ileriye gönderilen, düşmanın vaziyetini, coğrafi engelleri ve su kaynaklarını keşfederek merkeze haber getiren öncü keşif birliğine ne ad verilirdi?',
  '{"options": ["Tarkan", "Böri", "Yelme", "Cebelü", "Subaşı"], "correctIndex": 2}'::jsonb,
  'İslamiyet öncesi Türk ordusunda keşif ve istihbarat amaçlı ileri sürülen öncü akıncı birliğine "Yelme" denirdi. Yelmenin Osmanlı Devleti ordusundaki birebir karşılığı ise sınır boylarındaki "Akıncılar"dır. Böri (B şıkkı) ise Kağan''ın özel muhafız alayıdır.',
  'Adaylar Osmanlı''daki "Akıncı" kavramını bildiği halde İslamiyet öncesindeki karşılığı olan "Yelme" terimini gözden kaçırabilir veya komutan unvanı olan Subaşı / Tarkan ile karıştırabilir.',
  38
);

-- Soru #039 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türklerin dini inanışları ve defin gelenekleriyle ilgili çeşitli kavramlar bulunmaktadır.

Aşağıdakilerden hangisi eski Türklerde ölümden sonra yaşamın (ahiret hayatının) varlığına doğrudan bir kanıt olarak GÖSTERİLEMEZ?',
  '{"options": ["Ölen kişinin mezarına hayattayken öldürdüğü düşman sayısı kadar taştan yontulmuş \"Balbal\" dikilmesi", "Mezar odaları olan \"Kurgan\"lara ölünün eşyaları, silahları ve atıyla birlikte gömülmesi", "İyilerin gideceğine inanılan cennet kavramı için \"Uçmağ\", kötülerin gideceği cehennem için \"Tamu\" tabirlerinin kullanılması", "Cenazenin ardından ölen kişinin arkasından \"Yuğ\" adı verilen yas ve cenaze törenlerinin düzenlenmesi", "Ölen kişinin cesedinin kefenlenerek (\"eşük\") mezar odasında koruma altına alınması"], "correctIndex": 3}'::jsonb,
  'Yuğ törenleri, sadece bir cenaze ve matem merasimidir; ölen bir yakının ardından üzüntüyü ifade etmek için yapılır. Yuğ töreninin yapılması tek başına ölümden sonra bir yaşam (ahiret) olduğuna kanıt oluşturmaz; dünyevi bir keder ritüelidir. Oysa Kurgan''a eşya koymak, Uçmağ (cennet), Tamu (cehennem) ve Balbal (ahirette hizmet edeceğine inanılan heykeller) doğrudan ahiret inancının kanıtıdır.',
  'ÖSYM''nin en meşhur mantık sorusudur. Ramazan Yetgin notlarında da kural olarak belirtilmiştir: "Yuğ = Ahiret inancı kanıtı değildir! Kurgan, Balbal, Uçmağ, Tamu = Ahiret inancı kanıtıdır."',
  39
);

-- Soru #040 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk edebiyatında sözlü gelenek destanlar, koşuklar ve sagular etrafında şekillenmiştir.

Aşağıdaki destan ve ait olduğu Türk devleti/boyu eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Alp Er Tunga ve Şu Destanları $ → $ İskitler (Sakalar)", "Oğuz Kağan Destanı $ → $ Asya Hun Devleti", "Bozkurt ve Ergenekon Destanları $ → $ Göktürkler", "Türeyiş ve Göç Destanları $ → $ Kırgızlar", "Şan Kızı Destanı $ → $ Bulgarlar"], "correctIndex": 3}'::jsonb,
  'Türeyiş ve Göç destanları Kırgızlara değil, Uygurlara aittir. Kırgızlara ait dünyaca ünlü destan ise Manas Destanıdır.',
  'Adaylar Uygurların "Türeyiş ve Göç" destanları ile Göktürklerin "Bozkurt ve Ergenekon" destanlarını birbirine karıştırabilmektedir. Her ikisinde de kurt motifi yer alsa da Göç ve Türeyiş Uygurlara aittir.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde hükümdarın erkek çocuklarına ''tigin'' adı verilmiş ve bu şehzadeler devlet tecrübesi kazanmaları amacıyla boyların veya bölgelerin başına yönetici olarak gönderilmiştir.

Tiginleri eğitmek ve devlet idaresinde yetiştirmekle görevli bilge öğretmenlere ve danışmanlara verilen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Atabey", "İnal (Ataman)", "Lala", "Aygucı", "Tarkan"], "correctIndex": 1}'::jsonb,
  'İslamiyet öncesi Türk devletlerinde tiginleri eğiten görevlilere ''İnal'', ''İnanç'' veya ''Ataman'' denirdi. Bu unvan, Büyük Selçuklu Devleti''nde ''Atabey'', Osmanlı Devleti''nde ise ''Lala'' adını almıştır.',
  'ÖSYM Selçuklu''daki ''Atabey'' veya Osmanlı''daki ''Lala'' kavramını çeldirici olarak çok sık kullanır. İslamiyet öncesi dönemde bu hocaların adı ''İnal'' ya da ''Ataman''dır.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İlk Türk devletlerinde hükümdarın meşruiyet kaynağını ilahi güce dayandıran ''Kut'' inancı bulunmaktaydı.

Kut inancının Türk devlet yapısında yol açtığı en belirgin siyasi sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Teokratik bir monarşi düzeninin kurulması ve din adamlarının mecliste çoğunluk sağlaması", "Ülke topraklarının hanedanın ortak malı sayılması ve taht kavgalarının kaçınılmaz hale gelmesi", "Halkın sınıflara ayrılarak kölelik düzeninin yerleşmesi", "Hükümdarın kararlarının Kurultay tarafından hiçbir şekilde denetlenememesi", "Ordunun sadece hükümdarın öz soyundan gelen askerlerden oluşturulması"], "correctIndex": 1}'::jsonb,
  'Kut kan yoluyla hükümdar ailesinin tüm erkek fertlerine geçtiği kabul edildiğinden, hanedanın her erkek üyesi tahta geçme hakkına sahip olmuştur. Bu durum ''Ülke hanedanın ortak malıdır'' veraset anlayışını doğurmuş, sık sık taht kavgalarına ve devletlerin kısa sürede parçalanmasına yol açmıştır.',
  'Kut ilahi kaynaklı olduğu için adaylar devleti ''Teokratik (din devleti)'' sanabilmektedir. Oysa eski Türk devletleri teokratik değildir; kamlar/şamanlar devlet yönetimine katılamazdı. Asıl siyasi sonuç veraset belirsizliği ve taht kavgalarıdır.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türklerde hükümet (bakanlar kurulu) anlamına gelen ''Ayukı''nın başında bulunan ve günümüzdeki başbakanlık makamına karşılık gelen vezire verilen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Tudun", "Aygucı (Üge)", "Bitikçi", "Yargucı", "Buyruk"], "correctIndex": 1}'::jsonb,
  'İlk Türk devletlerinde hükümete ''Ayukı'', hükümet başkanına (vezir/başbakan) ise ''Aygucı'' veya ''Üge'' adı verilirdi. Vezir Tonyukuk Göktürkler döneminin en ünlü aygucısıdır.',
  'Tudun vergi memuru ve validir; Buyruk ise bakan demektir. Başbakan karşılığı olan unvan Aygucı''dır.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Orta Asya Türk kültürüne ait arkeolojik kazılarda ortaya çıkarılan kültür merkezleri tarih öncesi ve proto-Türk dönemine ışık tutmaktadır.

Orta Asya''nın en eski kültürü kabul edilen ve Türkmenistan''ın başkenti Aşkabat yakınlarında bulunan kültür bölgesi aşağıdakilerden hangisidir?',
  '{"options": ["Anav", "Afanasyevo", "Andronovo", "Karasuk", "Tagar"], "correctIndex": 0}'::jsonb,
  'Anav kültürü (MÖ 4000''ler), Aşkabat yakınlarında ortaya çıkarılan ve tüm Orta Asya''nın bilinen en eski kültür merkezidir. Türklerin en eski kültürü ise Afanasyevo''dur.',
  'En eski kültür sorulduğunda adayın aklı ''Afanasyevo''ya gidebilir. Ancak ''Orta Asya''nın en eski kültürü'' Anav kültürüdür; ''Türklerin (veya proto-Türklerin) en eski kültürü'' ise Afanasyevo''dur.',
  44
);

-- Soru #045 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karasuk kültürünü takip eden, MÖ 700 - 100 yılları arasına tarihlenen, demirin yanı sıra bronzdan mükemmel sanat eserlerinin üretildiği ve Orta Asya kültür merkezleri içerisinde en gelişmiş seviyeyi temsil eden kültür havzası aşağıdakilerden hangisidir?',
  '{"options": ["Kelteminar", "Anav", "Tagar", "Afanasyevo", "Andronovo"], "correctIndex": 2}'::jsonb,
  'Tagar kültürü, Yenisey Nehri civarında gelişen ve İslamiyet öncesi Orta Asya kültürleri arasında kronolojik olarak en son ve en gelişmiş olanıdır.',
  'Andronovo ilk tunç ve geniş yayılma alanı ile bilinir; en gelişmiş ve kronolojik olarak en geç kültür merkezi ise Tagar kültürüdür.',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Asya Hun Devleti''nde Mete Han döneminde Çin baskı altına alınmış, Pai-teng Savaşı ile Çin imparatoru mağlup edilmiş ancak Mete Han Çin''i topraklarına katmayıp sadece vergiye bağlamayı tercih etmiştir.

Mete Han''ın Çin''i doğrudan fethedebilecek güce sahip olmasına rağmen Çin topraklarına yerleşmekten kaçınmasının temel sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Çin Seddi''nin aşılamayacak kadar sağlam olması", "Yoğun Çin nüfusu karşısında Türk milletinin milli benliğini ve asimilasyona uğramasını önlemek", "İpek Yolu ticaretinin yönünü Batı''ya çevirmek istemesi", "Kurultayın Çin''e yerleşme fikrini veto etmesi", "Ordudaki askerlerin tarım hayatına geçmek istemesi"], "correctIndex": 1}'::jsonb,
  'Mete Han, kalabalık Çin nüfusu arasına Türklerin yerleşmesi durumunda Türklerin asimile olup milli kimliklerini kaybedeceklerini görmüş; bu nedenle Çin''i sadece vergiye bağlayarak dışarıdan kontrol etmiştir.',
  'Çin Seddi''nin engel olduğu düşüncesi en popüler ilkokul yanılgısıdır; Hunlar Çin Seddi''ni defalarca aşmıştır. Temel neden demografik ve kültürel asimilasyon tehlikesidir.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Avrupa Hun Devleti hükümdarı Attila döneminde Doğu Roma (Bizans) üzerine I. ve II. Balkan Seferleri düzenlenmiş ve Bizans ağır vergilere bağlanmıştır.

Attila''nın Doğu Roma İmparatorluğu ile imzaladığı ve Bizans''ın Hunlara ödediği yıllık vergiyi üç katına çıkaran 447 tarihli antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Margos Antlaşması", "Anatolius Antlaşması", "Karasu Antlaşması", "Edirne Antlaşması", "İstanbul Antlaşması"], "correctIndex": 1}'::jsonb,
  'Attila, I. Balkan Seferi sonunda Margos Antlaşması''nı (434); II. Balkan Seferi sonunda ise Bizans''ı dize getirerek yıllık vergiyi üçe katlayan Anatolius Antlaşması''nı (447) imzalamıştır.',
  'Attila''nın Bizans ile yaptığı iki büyük antlaşma vardır: İlki Margos, ikincisi vergiyi katlayan Anatolius''tur. Adaylar Margos ile Anatolius''u kronolojik olarak karıştırır.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk toplumunda sosyal yapıyı oluşturan unsurlar küçükten büyüğe hiyerarşik bir bağ ile teşekkül etmiştir.

Buna göre Türk toplumunda ''aileler birliği / sülale'' anlamına gelen sosyal basamak aşağıdakilerden hangisidir?',
  '{"options": ["Oguş", "Urug", "Bodun", "Boy (Ok)", "İl (El)"], "correctIndex": 1}'::jsonb,
  'Eski Türk toplum yapısı: Oguş (Aile) -> Urug (Aileler Birliği / Sülale) -> Boy/Ok (Boylar / Kabileler) -> Bodun (Millet) -> İl/El (Devlet). Dolayısıyla aileler birliği ''Urug''dur.',
  'Oguş çekirdek ailedir; Urug ise bu ailelerin bir araya gelmesiyle oluşan sülaledir. Karıştırılmaması için ''Oguş: Anne-baba-çocuk, Urug: Akraba/Sülale'' ayrımı bilinmelidir.',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Göktürk Devleti''nin kurucusu Bumin Kağan, devleti töre gereğince kardeşi İstemi Yabgu ile birlikte ikili teşkilat sistemiyle yönetmiştir.

İstemi Yabgu''nun İpek Yolu hakimiyeti ve ticaret kervanlarının güvenliği için Ak Hun Devleti''ne karşı ittifak kurduğu devlet aşağıdakilerden hangisidir?',
  '{"options": ["Bizans İmparatorluğu", "Sasani İmparatorluğu", "Çin", "Hazar Hakanlığı", "Emeviler"], "correctIndex": 1}'::jsonb,
  'İstemi Yabgu İpek Yolu''nu ele geçirmek için önce Sasanilerle ittifak yaparak Ak Hun Devleti''ne son vermiş; ardından güçlenen Sasanilere karşı Bizans İmparatorluğu ile diplomatik ittifak kurmuştur.',
  'İstemi Yabgu hem Bizans hem de Sasani ile ittifak kurmuştur. Ak Hunları yıkmak için Sasanilerle; daha sonra Sasanileri zayıflatmak için Bizans ile ittifak yapmıştır.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türklerde ölen kişinin ardından düzenlenen cenaze törenine, bu törenlerde okunan ağıtlara ve mezarın üzerine konulan mezar taşı niteliğindeki heykellere verilen isimler sırasıyla aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Yuğ - Sagu - Balbal", "Kurgan - Yuğ - Tamu", "Sagu - Balbal - Kurgan", "Uçmağ - Yuğ - Sagu", "Balbal - Sagu - Kurgan"], "correctIndex": 0}'::jsonb,
  'Cenaze törenine ''Yuğ'', bu törende okunan cenaze ağıtına ''Sagu'', kahramanın öldürdüğü düşman sayısı kadar mezarın başına dikilen heykelciklere ''Balbal'', mezara ise ''Kurgan'' denir.',
  'Kavramların birbirine benzemesi sebebiyle ''Yuğ'' (tören) ile ''Sagu'' (ağıt) ve ''Kurgan'' (mezar) sıklıkla karıştırılır.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  '375 yılında Hunların Balamir öncülüğünde Karadeniz''in kuzeyinden batıya doğru ilerleyerek Ostrogot, Vizigot, Vandal ve Frank gibi Cermen kavimlerini yerlerinden etmesiyle Kavimler Göçü başlamıştır.

Aşağıdakilerden hangisi Kavimler Göçü''nün dünya tarihi açısından doğurduğu sonuçlardan biri değildir?',
  '{"options": ["Roma İmparatorluğu''nun 395 yılında Doğu ve Batı olmak üzere ikiye ayrılması", "Avrupa''da merkezi krallıkların zayıflaması ve Feodalite (derebeylik) rejiminin ortaya çıkması", "Avrupa''da Hristiyanlığın tamamen terk edilerek Gök Tanrı inancının yaygınlaşması", "Avrupa milletlerinin ve günümüz Avrupa etnik haritasının temellerinin atılması", "Skolastik düşüncenin ve Katolik Kilisesi''nin otoritesinin güçlenmesi"], "correctIndex": 2}'::jsonb,
  'Kavimler Göçü sonrasında Hristiyanlık terk edilmemiş, tam tersine Avrupa''ya giden kavimler (ve sonrasında Avrupa Hunları ile diğer Türk boyları) zamanla Hristiyanlığı benimsemiştir. Kilisenin gücü artmış ve skolastik düşünce egemen olmuştur.',
  'Türklerin Avrupa''ya gitmesi kültürel etkileşim doğursa da dini anlamda Türk inancı Avrupa''ya hakim olmamış, aksine Türkler Hristiyanlaşarak benliklerini kaybetmiştir.',
  51
);

-- Soru #052 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Hazar Kağanlığı, 7. ve 9. yüzyıllar arasında Karadeniz''in kuzeyi ve Kafkaslar bölgesinde güçlü bir siyasi egemenlik kurmuş, ticaret yollarının güvenliğini sağlayarak bölgede istikrar ortamı tesis etmiştir.

Tarihte bu döneme ''Hazar Barış Çağı'' (Pax Chazarica) denmesinde ve Hazarların dini yapısında görülen en özgün özellik aşağıdakilerden hangisidir?',
  '{"options": ["Yöneticilerinin Museviliği benimsemesine rağmen ülkede İslamiyet, Hristiyanlık, Şamanizm ve Museviliğin bir arada barış içinde yaşayıp davalara 7 kişilik farklı dinlerden hakimler kurulunun bakması", "Sadece tek bir dini ibadethaneye izin verilip diğer inançların yasaklanması", "Tarihte ilk kez resmi devlet dinini Budizm olarak ilan etmeleri", "Bizans ile hiçbir ticari ve siyasi ilişkiye girmemeleri", "Ordularının tamamını sadece Musevi asıllı Türklerden oluşturmaları"], "correctIndex": 0}'::jsonb,
  'Hazarlar, yöneticileri Musevi olan tek Türk devletidir. Hazar ülkesinde Musevi, Hristiyan, Müslüman ve Şamanist halk tam bir hoşgörü içinde yaşamış; mahkemelerde her dinin temsilcisi olan 7 kişilik hakimler heyeti görev yapmıştır.',
  'Hazarların Musevi olduğu bilinir fakat teokratik bir baskı kurdukları yanılgısına düşülebilir. Pax Chazarica''nın temel özelliği dini hoşgörü ve karma hakimler heyetidir.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Doğu Avrupa''da Tuna boylarında hanlık kuran İtil (Volga) Bulgarları, Müslüman tüccarlar vasıtasıyla İslamiyet''i tanımış ve 10. yüzyılda hükümdarları Almış Han döneminde İslamiyet''i resmi devlet dini olarak kabul etmişlerdir.

İtil Bulgarlarının İslam dinini resmi olarak kabul etmesi üzerine Abbasi Halifesi Muktedir Billah''ın gönderdiği elçilik heyetinde yer alan ve seyahatnamesinde Türk coğrafyasını ayrıntılı tasvir eden ünlü seyyah kimdir?',
  '{"options": ["İbn-i Batuta", "İbn-i Fadlan", "Evliya Çelebi", "Marco Polo", "Priskos"], "correctIndex": 1}'::jsonb,
  'İbn-i Fadlan, Abbasi halifesinin 921-922 yıllarında İtil Bulgar Hanlığı''na gönderdiği elçilik heyetinde katip olarak bulunmuş ve gördüklerini dünyaca ünlü eseri ''Rihle'' (Seyahatname) adlı kitabında kaleme almıştır.',
  'İbn-i Batuta 14. yüzyıl seyyahıdır. İtil Bulgarlarını ve Almış Han''ı ziyaret eden 10. yüzyıl seyyahı İbn-i Fadlan''dır.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Türk tarihinde devlet kuramamış ancak güçlü bir askeri teşkilata sahip olarak 1071 Malazgirt Savaşı''nda Bizans ordusunda ücretli asker iken Selçuklu tarafına geçerek savaşın kaderini değiştiren Türk toplulukları aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Peçenekler - Uzlar (Oğuzlar)", "Avarlar - Bulgarlar", "Hazarlar - Macarlar", "Kumanlar - Kıpçaklar", "Türgişler - Kırgızlar"], "correctIndex": 0}'::jsonb,
  'Peçenekler ve Uzlar (Hristiyanlaşmış Oğuzlar) devlet kuramamış boy teşkilatı halinde yaşamışlardır. Bizans ordusunda paralı askerlik yaparken Malazgirt Meydan Muharebesi''nde Alparslan''ın safına geçerek Türklerin zaferinde kritik rol oynamışlardır.',
  'Kumanlar (Kıpçaklar) da Doğu Avrupa''da etkilidir ancak Malazgirt Savaşı sırasında saf değiştiren ikili Peçenekler ve Uzlar''dır.',
  54
);

-- Soru #055 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Hem Orta Asya''da hem de Orta Avrupa''da (Pannonia) devlet kuran, 626 yılında Sasanilerle ittifak kurarak İstanbul''u tarihte ilk kez kuşatan Türk devleti aşağıdakilerden hangisidir?',
  '{"options": ["Avarlar (Juan-Juan)", "Hunlar", "Hazarlar", "Bulgarlar", "Uygurlar"], "correctIndex": 0}'::jsonb,
  'Avarlar, Göktürklerin baskısıyla batıya göç ederek Orta Avrupa''da devlet kurmuş; 619 ve 626 yıllarında İstanbul''u kuşatan ilk Türk devleti olmuştur. Ayrıca Slav kavimlerini ordu ve devlet teşkilatlanması açısından derinden etkilemişlerdir.',
  'İstanbul''u kuşatan ilk Türk devleti Avarlar''dır. Kuşatan ilk Müslüman Türk devleti ise Çaka Beyliği''dir; Osmanlı ise fethedecektir. Bu ayrım ÖSYM klasiğidir.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Rusların ünlü ''İgor Destanı''na konu olan, sarışın ve mavi gözlü fiziki özellikleriyle bilinen, Karadeniz''in kuzeyindeki Deşt-i Kıpçak bölgesine adını veren ve günümüzde Codex Cumanicus adlı sözlükleriyle tanınan Türk boyu aşağıdakilerden hangisidir?',
  '{"options": ["Kumanlar (Kıpçaklar)", "Peçenekler", "Sabirler", "Başkurtlar", "Karluklar"], "correctIndex": 0}'::jsonb,
  'Kumanlar (Kıpçaklar), Ruslarla yaptıkları mücadelelerle İgor Destanı''na, Oğuzlarla yaptıkları mücadelelerle de Dede Korkut Hikayeleri''ne konu olmuşlardır. İki ciltlik Latince-Farsça-Kıpçakça sözlük olan ''Codex Cumanicus'' bu boya aittir.',
  'Dede Korkut ve İgor Destanı''nın ortak muhatabı Kumanlar/Kıpçaklar''dır. Peçeneklerle sıkça karıştırılır.',
  56
);

-- Soru #057 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Kendi adına bağımsız madeni para (yarmak) bastıran ilk Türk hükümdarı kimdir ve hangi Türk devletine mensuptur?',
  '{"options": ["Baga Tarkan - Türgişler", "Mete Han - Asya Hunları", "Bumin Kağan - Göktürkler", "Bögü Kağan - Uygurlar", "Bayyan Kağan - Avarlar"], "correctIndex": 0}'::jsonb,
  'Türgiş hükümdarı Baga Tarkan, 8. yüzyıl başlarında kendi adına madeni para (yarmak) bastıran ilk Türk hükümdarıdır. Bu durum Türgişlerde bağımsızlık anlayışını ve gelişmiş bir ticaret ekonomisini gösterir.',
  'Uygurlar kağıt para (çav) kullanmıştır; madeni parayı hükümdar adına ilk bastıran ise Türgiş hükümdarı Baga Tarkan''dır.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Cengiz Han önderliğinde kurulan Moğol İmparatorluğu''na itaat eden ilk Müslüman Türk topluluğu ile ilk gayrimüslim Türk devleti eşleştirmesi aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Karluklar - Kırgızlar", "Karluklar - Uygurlar", "Oğuzlar - Türgişler", "Yağmalar - Hazarlar", "Kıpçaklar - Bulgarlar"], "correctIndex": 0}'::jsonb,
  'Moğollara itaat eden ilk Türk devleti Kırgızlar (1207); Moğollara itaat eden ilk Müslüman Türk boyu/topluluğu ise Karluklar''dır. Uygurlar da Moğollara itaat ederek Moğol devlet kademesinde memur ve katiplik (Türkleşme) yapmışlardır.',
  'ÖSYM ''ilk itaat eden Türk devleti'' (Kırgızlar) ile ''ilk itaat eden Müslüman Türk topluluğu'' (Karluklar) ayrımını sık sık seçeneklere koyar.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Dünyanın en uzun destanı kabul edilen, günümüzde de canlılığını koruyan ve Kırgızların milli kimliğini, mücadelelerini ve kültürünü anlatan destan aşağıdakilerden hangisidir?',
  '{"options": ["Manas Destanı", "Oğuz Kağan Destanı", "Ergenekon Destanı", "Türeyiş Destanı", "Alp Er Tunga Destanı"], "correctIndex": 0}'::jsonb,
  'Manas Destanı Kırgızlara aittir ve 500 binden fazla dizesiyle dünyanın en uzun canlı destanı unvanına sahiptir.',
  'Oğuz Kağan Destanı Hunlara; Ergenekon ve Bozkurt Göktürklere; Türeyiş ve Göç Uygurlara aittir.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Orta Asya''da kurulan ilk Türk devletlerinde kağanın yanında yönetimde söz sahibi olan, yabancı elçileri kabul eden, kurultaya katılan ve fermanlara kağanla birlikte imza atan hükümdar eşine ne ad verilirdi?',
  '{"options": ["Hatun (Katun)", "Tigin", "Şad", "Yabgu", "Tarkan"], "correctIndex": 0}'::jsonb,
  'Hatun (Katun), eski Türklerde kadının devlet yönetimindeki yüksek statüsünü simgeler. Kurultaya katılır, kağan seferdeyken devleti temsil eder ve elçi kabul edebilirdi. ''Kağan ve Hatun emrediyor ki...'' ibaresi olmadan buyruklar geçerli sayılmazdı.',
  'Hatun makamı sadece bir hanedan eşi değil, protokolde kağanın yanında yer alan siyasi bir makamdır.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde toplum hayatını ve devlet işleyişini düzenleyen yazısız hukuk kurallarına ''Töre'' adı verilirdi.

Aşağıdakilerden hangisi törenin değişmez temel ilkeleri (esasları) arasında yer almaz?',
  '{"options": ["Könilik (Adalet)", "Uzluk (Faydalılık / İyilik)", "Tüzlük (Eşitlik)", "Kişilik (İnsanlık)", "Mutlakiyet (Sınırsız Kağan İradesi)"], "correctIndex": 4}'::jsonb,
  'Törenin 4 değişmez ilkesi vardır: Könilik (adalet), Uzluk (iyilik/faydalılık), Tüzlük (eşitlik) ve Kişilik/Kölilik (insanlık). Kağan dahi töreye uymak zorundadır; kağanın iradesi sınırsız (mutlakiyet) değildir.',
  'Adaylar eski Türk kağanlarını sınırsız yetkili sanabilir. Oysa töre kağanın üzerindedir ve töreye uymayan kağan kurultay tarafından tahttan indirilebilirdi.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde adli teşkilat ile ilgili;
I. Adi suçlara ve halk arasındaki davalara ''Yargu'' adı verilen yerel mahkemeler bakardı.
II. Devlete karşı işlenen siyasi suçlar ve vatana ihanet davaları kağanın başkanlığındaki Yüksek Mahkeme''de görüşülürdü.
III. Göçebe yaşam tarzı sebebiyle hapis cezaları genellikle 10 günü aşmayacak şekilde kısa süreli uygulanırdı.

Yukarıda verilen yargılardan hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de Türk töre hukukunun temel özellikleridir. Yerel mahkeme yargıcına ''Yargucı'' denirdi. Göçebelik uzun süreli hapsi engellediğinden cezalar kısa süreli hapis, tazminat veya ölüm şeklindeydi.',
  'Uygurlara kadar Türklerde uzun süreli hapis cezası yoktur; göçebe hayat hapis süresini 10 gün ile sınırlandırmıştır.',
  62
);

-- Soru #063 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türk ordusunun temel özellikleri arasında aşağıdakilerden hangisi gösterilemez?',
  '{"options": ["Mete Han tarafından kurulan ve günümüz dünya ordularında da uygulanan ''Onlu Sistem''in esas alınması", "Toplumun ''Ordu-Millet'' anlayışıyla eli silah tutan kadın-erkek her ferdinin asker sayılması", "Ordunun vur-kaç, sahte ricat (geri çekilme) ve Turan (Hilal/Kurt Kapanı) taktiklerini başarıyla uygulaması", "Hükümdar muhafız alaylarının tamamen maaşlı paralı lejyonerlerden teşkil edilmesi", "Ordunun temelini süvari (atlı) birliklerin oluşturması ve hafif ok-yay teçhizatının kullanılması"], "correctIndex": 3}'::jsonb,
  'Eski Türk devletlerinde (Hazarlar hariç) ordu paralı askerlerden oluşmazdı. ''Ordu-millet'' anlayışı vardı; her fert vatan savunmasında doğal askerdi. Paralı askerlik Türk geleneklerine aykırıdır.',
  'Hazarlar ordusunda ücretli asker bulunduran İSTİSNA Türk devletidir. Genel Türk devletleri için ''ücretli askerlik'' kesinlikle yanlıştır.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Türklerin göçebe bozkır kültüründen yerleşik kent kültürüne geçişi mimari, dini ve toplumsal alanda köklü değişimlere yol açmıştır.

Türk tarihinde yerleşik hayata geçen ilk Türk devleti ve bu dönemde Maniheizm tapınaklarına verilen isim aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Uygurlar - Stupa", "Göktürkler - Kümbet", "Hunlar - Kurgan", "Karluklar - Cami", "Avarlar - Katedral"], "correctIndex": 0}'::jsonb,
  'Bögü Kağan döneminde Maniheizm''i kabul eden Uygurlar yerleşik hayata geçen ilk Türk devletidir. Mani dini tapınaklarına ''Stupa'' adı verilmiş, fresk (duvar resmi) ve minyatür sanatı gelişmiştir.',
  'Kümbet Türk-İslam mimarisinin anıt mezarıdır; Uygurların Mani tapınakları ise Stupa''dır.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türk sanatında hayvanların birbirleriyle mücadelesini tasvir eden, kemer tokaları, kılıç kınları, at koşum takımları ve çadır örtülerine pars, kurt, kartal, geyik ve at figürlerinin işlendiği sanat üslubuna ne ad verilir?',
  '{"options": ["Hayvan Üslubu", "Barok Üslubu", "Gotik Sanat", "Fresk Ekolü", "Minyatür Sanatı"], "correctIndex": 0}'::jsonb,
  'İslamiyet öncesi bozkır Türk sanatının temeli ''Hayvan Üslubu''dur. İskitler ve Hunlar taşınabilir eşyalar üzerine maden işlemeciliğiyle hayvan figürlerini ustalıkla nakşetmişlerdir.',
  'Taşınabilir sanat eserleri göçebe yaşamın sonucudur. Türklerin dünya sanatına en özgün katkılarından biri ''Hayvan Üslubu''dur.',
  65
);

-- Soru #066 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Kazakistan''ın Almatı kenti yakınlarında Esik Kurganı''nda bulunan, MÖ 5. - 4. yüzyıllara ait saf altından zırhı ve miğferiyle dünya arkeoloji literatürüne geçen ''Altın Elbiseli Adam'' zırhı hangi erken dönem Türk topluluğuna aittir?',
  '{"options": ["İskitler (Sakalar)", "Uygurlar", "Göktürkler", "Türgişler", "Kırgızlar"], "correctIndex": 0}'::jsonb,
  'Esik Kurganı''nda çıkarılan Altın Elbiseli Adam zırhı İskitlere (Sakalara) aittir. İskitlerin maden işlemeciliğindeki yüksek dehası nedeniyle tarihte ''Bozkırın Kuyumcuları'' olarak adlandırılmışlardır.',
  'Esik Kurganı ve Altın Elbiseli Adam çoğu kaynakta Hunlar ile karıştırılır; arkeolojik olarak İskitlere aittir.',
  66
);

-- Soru #067 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Rus arkeolog Sergey Rudenko tarafından Altay Dağları eteklerinde buzullar içinde keşfedilen, MÖ 5. - 3. yüzyıllara ait dünyanın en eski düğümlü yün halısı (Pazırık Halısı) hangi kurganda bulunmuştur ve hangi Türk devletine aittir?',
  '{"options": ["Pazırık Kurganı - Asya Hun Devleti", "Esik Kurganı - İskitler", "Noin Ula Kurganı - Göktürkler", "Hoytu Tamır Kurganı - Uygurlar", "Şine Usu Kurganı - Avarlar"], "correctIndex": 0}'::jsonb,
  'Pazırık Kurganı''nda bulunan dünyanın en eski halısı olan ''Pazırık Halısı'' Asya Hun Devleti dönemine aittir. Gördes (Türk) çifte düğüm tekniğiyle dokunmuştur ve halen St. Petersburg Hermitage Müzesi''nde sergilenmektedir.',
  'Pazırık Halısı Hunlara; Altın Elbiseli Adam ise İskitlere aittir. ÖSYM bu iki arkeolojik buluntuyu birbirinin çeldiricisi olarak sıkça sorar.',
  67
);

-- Soru #068 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türklerde dini inanış ve kavramlarla ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Uçmağ - Cennet", "Tamu - Cehennem", "Kam (Baksı) - Din adamı / Şaman", "Balbal - Kurban edilen koç veya at", "Kült - Kutsal sayılan ata veya tabiat gücü inancı"], "correctIndex": 3}'::jsonb,
  'Balbal, kurban edilen hayvan değil; ölen savaşçının sağlığında öldürdüğü düşman sayısı kadar mezarının çevresine dikilen insan biçimli küçük taş heykellerdir.',
  'Balbalın heykelcik olduğu unutulup kurban veya mezar hediyesiyle karıştırılabilmektedir.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türklerde zamanı tespit etmek ve mevsimleri takip etmek amacıyla geliştirilen, her yıla bir hayvan adının verildiği ve güneş yılı esaslı olarak hazırlanan takvim aşağıdakilerden hangisidir?',
  '{"options": ["12 Hayvanlı Türk Takvimi", "Hicri Takvim", "Celali Takvim", "Rumi Takvim", "Miladi Takvim"], "correctIndex": 0}'::jsonb,
  '12 Hayvanlı Türk Takvimi Türklerin bizzat hazırladığı milli güneş takvimidir. 12 yılda bir devreder ve her yıl bir hayvan adıyla (Sıçan, Ud/Sığır, Pars, Tavşan, Ejder, Yılan, Yunt/At, Koyun, Biçin/Maymun, Tavuk, İt/Köpek, Domuz) anılır.',
  'Celali Takvim Büyük Selçuklu''da Ömer Hayyam tarafından hazırlanmıştır. Türklerin İslam öncesi milli takvimi 12 Hayvanlı Türk Takvimi''dir.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk edebiyatında sözlü dönem ürünleri arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Koşuk", "Sagu", "Sav", "Destan", "Mesnevi"], "correctIndex": 4}'::jsonb,
  'Mesnevi, İslamiyet''in kabulünden sonra Arap ve özellikle Fars edebiyatından Türk edebiyatına geçen aruz ölçülü bir nazım şeklidir. Koşuk (şiir), Sagu (ağıt), Sav (atasözü) ve Destan ise İslamiyet öncesi Türk sözlü edebiyat türleridir.',
  'Sav atasözü, Koşuk aşk-doğa şiiridir. Mesnevi ise İslami dönem divan edebiyatı türüdür.',
  70
);

-- Soru #071 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Türk adının geçtiği ilk Türkçe yazılı belgeler olan Orhun Abideleri (Göktürk Kitabeleri) ile ilgili;
I. Kitabeler Vezir Tonyukuk (726), Kül Tigin (732) ve Bilge Kağan (735) adına dikilmiştir.
II. Kitabelerde Türk milletine hesap verilmiş, sosyal devlet anlayışı (''Aç milleti doyurdum, çıplak milleti giydirdim'') vurgulanmıştır.
III. Kitabelerin metinleri ilk kez 1893 yılında Danimarkalı dilbilimci Vilhelm Thomsen tarafından okunmuştur.
IV. Kitabeler günümüzde Moğolistan sınırları içerisinde Orhun Irmağı vadisinde yer almaktadır.

Yukarıda verilen bilgilerden hangileri doğrudur?',
  '{"options": ["I ve II", "II ve IV", "I, II ve III", "I, III ve IV", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'Öncüllerin tamamı Orhun Kitabeleri hakkında tarihsel ve sınav odaklı kesin doğrulardır: Üç büyük kitabe vardır, siyasetname niteliğindedir, sosyal devlet anlatılır, Vilhelm Thomsen tarafından deşifre edilmiştir ve Moğolistan''dadır.',
  'ÖSYM bazen kitabelerin yazarı Yolluğ Tigin''i veya Danimarkalı Thomsen''i sorar. Öncüllerin hepsi kritik ÖSYM kazanımıdır.',
  71
);

-- Soru #072 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Orhun Kitabeleri''nde ilk dikilen ve bizzat kendi hatıralarını halk diliyle sade bir üslupla taşa kazıtan, Türk tarihinin ilk tarihçisi ve hatibi (yazarı) kabul edilen devlet adamı kimdir?',
  '{"options": ["Vezir Tonyukuk", "Kül Tigin", "Bilge Kağan", "Yolluğ Tigin", "Bumin Kağan"], "correctIndex": 0}'::jsonb,
  'Vezir Tonyukuk Abidesi 726 yılında dikilmiştir ve diğer iki kitabeden önce yer alır. Tonyukuk kendi anılarını ve Göktürk bağımsızlık mücadelesini bizzat kaleme aldığı için ''Türklerin ilk tarihçisi ve veziri'' sayılır.',
  'Kitabelerin edebi yazarı Yolluğ Tigin''dir; ancak kendi diktirdiği anıtı bizzat yazdıran ve ilk tarihçi kabul edilen devlet adamı Vezir Tonyukuk''tur.',
  72
);

-- Soru #073 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Uygurlara ait yazılı anıtlar arasında yer alan ve Uygurların Maniheizm dinini kabul edişini, kurdukları şehirleri ve kağanlarının kahramanlıklarını anlatan iki dilli (Türkçe ve Soğdca) kitabe aşağıdakilerden hangisidir?',
  '{"options": ["Karabalgasun Yazıtı", "Moyen-Çur (Şine Usu) Yazıtı", "Bugut Yazıtı", "Taryat (Terhin) Yazıtı", "Yenisey Kitabeleri"], "correctIndex": 0}'::jsonb,
  'Karabalgasun Yazıtı (821), Uygurların başkenti Ordubalık yakınlarında bulunmuştur ve Maniheizm''in kabulünü anlatan Türkçe, Soğdca ve Çince yazılmış tarihi belgedir.',
  'Bugut Yazıtı I. Göktürk dönemine aittir. Yenisey Kırgızlara aittir. Maniheizm''i anlatan Uygur yazıtı Karabalgasun''dur.',
  73
);

-- Soru #074 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Göktürk Devleti''nin 630-680 yılları arasında Çin esareti altında kaldığı 50 yıllık ''Matem Dönemi''nde bağımsızlığı kazanmak amacıyla 39 arkadaşıyla birlikte Çin İmparatorluk Sarayı''nı basan ve Türk milliyetçiliğinin abide kahramanı olan Türk komutan kimdir?',
  '{"options": ["Kürşad", "İlteriş Kağan", "Kül Tigin", "Baga Tarkan", "Kapgan Kağan"], "correctIndex": 0}'::jsonb,
  'Kürşad (Çin kaynaklarında Chieh-she-shuai), 639 yılında 39 yiğidi ile Çin sarayını basarak esaret altındaki Türk milletine bağımsızlık kıvılcımı yakan efsanevi komutandır.',
  'İlteriş Kağan bağımsızlığı sağlayan devleti kuran kağandır; esaret yıllarındaki saray baskınını gerçekleştiren komutan ise Kürşad''dır.',
  74
);

-- Soru #075 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'İslamiyet öncesi Türk devletlerinde ''Kurultay'' (Toy / Kengeş) meclisi ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Kurultay üyelerine ''Toygun'' adı verilirdi.", "Boy beyleri, hatun ve devlet ileri gelenleri kurultayın doğal üyeleriydi.", "Kağan seçiminde, savaş ve barış kararlarında kurultayın bağlayıcı veya danışma niteliğinde yetkileri vardı.", "Din adamları (kamlar/baksılar) kurultayda veto hakkına sahip daimi üye olarak bulunurdu.", "Kurultayda boy beylerinin oturma düzenine ''orun'', ziyafetteki et paylarına ise ''ülüş'' denirdi."], "correctIndex": 3}'::jsonb,
  'Eski Türklerde Kurultay''da din adamları (kam, şaman, baksı) ASLA yer almazdı. Bu durum Türk devletlerinin teokratik olmadığının ve laik bir yönetim anlayışının en somut kanıtıdır.',
  'Çok güçlü bir sınav tuzağıdır: Adaylar eski meclislerde ruhbanların bulunduğunu zanneder. Türk kurultaylarında din adamları üye DEĞİLDİR.',
  75
);

-- Soru #076 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Eski Türk devlet teşkilatında yer alan kavram ve görevli eşleştirmelerinden hangisi yanlış verilmiştir?',
  '{"options": ["Tudun - Vergi memuru ve sivil vali", "Bitikçi (Tamgacı) - Katip ve hükümdar mührünü basan görevli", "Yargucı - Adalet işlerinden sorumlu yargıç", "Tarkan - Ordu komutanı / General", "Ağılığ - Yabancı elçileri ağırlayan protokol şefi"], "correctIndex": 4}'::jsonb,
  'Ağılığ (veya Ağıcı), protokol şefi değil, devlet hazinesinden ve maliyeden sorumlu ''hazinedar''dır. Dolayısıyla eşleştirme yanlıştır.',
  'Ağılığ kelimesi ''ağırlamaktan'' türemiş gibi gelebilir ve adayı protokol/elçi ağırlama şıkkına çekebilir. Oysa ağılık hazinedir, ağılığ hazinedardır.',
  76
);

-- Soru #077 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'İslamiyet öncesi Türk hükümdarlarının kullandığı unvanlar ve hükümdarlık sembolleri (alametleri) konusunda;
I. Kağan, Yabgu, Han, Hakan, İlteber, İdikut ve Şanyü hükümdar unvanlarındandır.
II. Otağ (çadır), Kotuz (sorguç), Tuğ (sancak), Nevbet (davul) ve Kemer (kur) hükümdarlık sembollerindendir.
III. Hutbe okutmak ve hilat (halife giysisi) giymek İslamiyet öncesi Türk kağanlarının temel egemenlik alametlerindendir.

Yukarıdaki değerlendirmelerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'Hutbe okutmak ve halifeden hilat/menşur almak İSLAMİ DÖNEM egemenlik alametleridir. İslam öncesinde İslamiyet olmadığı için hutbe ve hilat bulunmaz! I ve II ise tamamen İslam öncesi alamet ve unvanlardır.',
  'ÖSYM''nin en sevdiği tuzak soru tipidir: ''Hangisi İslamiyet öncesi hükümdarlık sembolü değildir?'' -> Cevap: Hutbe, Hilat, Menşur, Çetr (İslamiyet sonrasıdır!).',
  77
);

-- Soru #078 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Sasaniler ile anlaşarak Ak Hun Devleti''ni ortadan kaldıran, ardından İpek Yolu hakimiyeti için Bizans İmparatorluğu''na Maniakh başkanlığında elçilik heyeti gönderen ve Türk tarihinde Bizans ile diplomatik ilişki kuran ilk devlet adamı kimdir?',
  '{"options": ["İstemi Yabgu", "Bumin Kağan", "Mete Han", "Attila", "Bayan Kağan"], "correctIndex": 0}'::jsonb,
  'Göktürk Devleti''nin batı kanadı yöneticisi İstemi Yabgu, Bizans''a Soğdlu tüccar Maniakh''ı elçi olarak göndermiş; Bizans İmparatoru II. Justinianos da buna karşılık Zemarchos başkanlığında bir heyeti Orta Asya''ya göndermiştir. Bu temas Türk-Bizans ilk resmi diplomatik ilişkisidir.',
  'Attila Bizans ile savaşmıştır fakat ilk diplomatik elçi teatisi ve İpek Yolu ittifakı Göktürk hükümdarı İstemi Yabgu zamanındadır.',
  78
);

-- Soru #079 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Türklerin tarih boyunca göçebe ve yarı göçebe bir hayat sürmeleri; ordu, mimari, sanat ve hukuk alanlarında pek çok sonuca yol açmıştır.

Aşağıdakilerden hangisi bozkır göçebe kültürünün Türk toplumu üzerindeki doğrudan sonuçlarından biri olamaz?',
  '{"options": ["Toprak mülkiyetinin devlete ait olması sebebiyle feodal derebeylik ve kölelik sınıflarının oluşmaması", "Kalıcı saray, tapınak ve taşınmaz anıt mimarisinin Uygurlara kadar gelişmemesi", "Hapis cezalarının kısa süreli tutulması", "Maden işlemeciliği ve deri sanatında taşınabilir eşyaların tercih edilmesi", "Yazılı hukuk kurallarının ve ticaret sözleşmelerinin Asya Hunları döneminde sistemleştirilmesi"], "correctIndex": 4}'::jsonb,
  'Yazılı hukuk kuralları ve ilk kira/ticaret/borç sözleşmeleri göçebe Asya Hunlarında değil, yerleşik hayata geçen UYGURLARDA ortaya çıkmıştır. Asya Hunlarında hukuk sözlü töredir.',
  'Yazılı hukuk ve sözleşme kültürü yerleşik hayatın getirisidir ve Türk tarihinde Uygurlarla başlar; göçebe dönemde sadece sözlü töre vardır.',
  79
);

-- Soru #080 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Oğuz Kağan Destanı''nda anlatılan ve Türk boylarını bir bayrak altında toplayan efsanevi Türk hükümdarı Oğuz Kağan''ın, tarihsel kişilik olarak aşağıdaki hükümdarlardan hangisiyle özdeşleştiği kabul edilmektedir?',
  '{"options": ["Mete Han", "Bumin Kağan", "Attila", "Alp Er Tunga", "Teoman"], "correctIndex": 0}'::jsonb,
  'Tarihçiler ve Türkologlar, Oğuz Kağan Destanı''ndaki doğum, tahta çıkış, ordu düzeni ve fetih anlatımlarının Asya Hun Hükümdarı Mete Han''ın hayatıyla birebir örtüştüğünü ve Oğuz Kağan''ın Mete Han olduğunu kabul etmektedirler.',
  'Alp Er Tunga İskitlerin efsanevi hükümdarıdır (Şehname''de Efrasiyab). Oğuz Kağan ise Asya Hun imparatoru Mete Han''dır.',
  80
);


-- -------------------------------------------------------------
-- İLK TÜRK-İSLAM DEVLETLERI (80 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '751 yılında Müslüman Abbasiler ile Çinliler arasında yapılan Talas Savaşı (Atlık Savaşı), Türk-İslam tarihinin başlangıcı kabul edilmektedir. Bu savaş sonucunda Karluk Türkleri kitleler halinde İslamiyet''i benimsemeye başlamış ve kültürel etkileşim hız kazanmıştır.

Aşağıdakilerden hangisi Talas Savaşı''nın Türk ve dünya kültür tarihi üzerindeki doğrudan sonuçlarından biri değildir?',
  '{"options": ["Kağıt üretiminin Çin sınırları dışına çıkarak ilk kez Semerkand''da üretilmeye başlanması", "Karluk, Yağma ve Çiğil Türklerinin desteğiyle Orta Asya''nın Çin egemenliğine girmesinin engellenmesi", "Uygurlara ait matbaa, minyatür ve fresk gibi sanat ürünlerinin Batı dünyasına taşınması", "Karasuk ve Tagar kültürlerine ait ilk demir silahların İslam orduları tarafından kopyalanması", "Semerkand kentinin ''Şehirlerin Şahı'', Kaşgar kentinin ise ''Işıldayan İnci'' unvanıyla İslam medeniyet merkezlerine dönüşmesi"], "correctIndex": 3}'::jsonb,
  'Karasuk ve Tagar kültürleri İslamiyet''ten binlerce yıl önceki tarih öncesi/tarih çağları Orta Asya bozkır kültürleridir; 8. yüzyıldaki Talas Savaşı ile doğrudan bir ilgisi yoktur. Talas Savaşı ile kağıt Çin dışında ilk kez Semerkand''da üretilmiş, Uygur sanat eserleri batıya taşınmış ve Türk-İslam şehirleri büyük ivme kazanmıştır.',
  'ÖSYM adayların "Semerkand = Şehirlerin Şahı" veya "Kaşgar = Işıldayan İnci" unvanlarını Talas Savaşı kazanımlarıyla bağdaştıramayacağını düşünerek bu şıkları çeldirici olarak kullanır. Asıl tuzak ise tarih öncesi kültürlerin (Tagar/Karasuk) sanki Orta Çağ savaşıyla aktarılmış gibi seçeneklere serpiştirilmesidir.',
  1
);

-- Soru #002 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Bilge Kül Kadir Han tarafından kurulan, Satuk Buğra Han döneminde İslamiyet''i kabul ederek hükümdarın ''Abdülkerim'' adını aldığı ve Türk tarihinde "Afrasiyapoğulları" adıyla da anılan, Orta Asya''da kurulan ilk Müslüman Türk devleti aşağıdakilerden hangisidir?',
  '{"options": ["Gazneliler", "Karahanlılar", "Büyük Selçuklu Devleti", "İtil Bulgarları", "Tolunoğulları"], "correctIndex": 1}'::jsonb,
  'Orta Asya topraklarında kurulan ilk Müslüman Türk devleti Karahanlılar''dır (840-1212). Satuk Buğra Han İslamiyet''i kabul edince Abdülkerim adını almıştır. Divan-ı Lügati''t-Türk''te Karahanlı hanedanı Alp Er Tunga''ya (Afrasiyap) dayandırıldığı için bu devlete Afrasiyapoğulları da denir.',
  'ÖSYM burada "İlk Müslüman Türk Devleti" tabiriyle İtil Bulgarları''nı (Doğu Avrupa), "Orta Asya''da kurulan ilk Müslüman Türk Devleti" tabiriyle ise Karahanlılar''ı ölçer. Aday coğrafi sınırlamaya (Orta Asya) dikkat etmezse İtil Bulgarları tuzağına düşer.',
  2
);

-- Soru #003 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar Devleti İslamiyet''i kabul etmelerine rağmen Arap ve Fars kültürünün etkisinde erimemiş, Türk kültür kimliğini titizlikle muhafaza etmişlerdir.

Aşağıdakilerden hangisi Karahanlılar Devleti''nin "milli / ulusçu" bir karaktere sahip olduğunun doğrudan bir kanıtı olamaz?',
  '{"options": ["Resmi yazışma ve edebi dillerinin Türkçe (Hakaniye Türkçesi) olması", "Yönetici hanedanının ve tebaasını oluşturan halk kitlelerinin tamamen Türk boylarından meydana gelmesi", "Hükümdarlarının Arslan Han, Buğra Han ve Kadir Han gibi kadim Türkçe unvanları kullanmaya devam etmesi", "Eski Türk ikili yönetim (Doğu-Batı) teşkilatını uygulamaları", "Devlet yönetiminde ilk kez Abbasi halifesinden menşur (atama onayı) alma geleneğini başlatmaları"], "correctIndex": 4}'::jsonb,
  'Halifeden menşur (onay) almak, hükümdarın meşruiyetini İslam hukuku ve hilafet makamına dayandırmasıyla ilgili teokratik/İslami bir uygulamadır; ulusçu karakteri değil, İslam dünyasıyla bütünleşmeyi gösterir. Resmi dilin Türkçe olması, boy federasyonu yapısı ve Türkçe unvanlar ise doğrudan ulusçu niteliğin kanıtıdır.',
  'Adaylar "ikili teşkilat"ın (D şıkkı) eski Türk devlet geleneğinden geldiğini unutup onu idari zafiyet olarak görebilir. Oysa ikili teşkilat ve Hakaniye lehçesi Karahanlıların milli/bozkır köklerine bağlılığının en somut delilleridir.',
  3
);

-- Soru #004 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Karahanlılar Dönemi''nde sosyal devlet ve kurumsal teşkilatlanma alanında birçok önemli müessese vücuda getirilmiştir.
I. Bimarhane adı verilen akıl ve ruh hastalıklarının da tedavi edildiği tam teşekküllü hastaneler inşa etmeleri
II. Tamgaç Buğra Han döneminde Semerkant''ta ilk Türk-İslam medresesini açarak dünya tarihinde ilk kez burslu öğrencilik sistemini başlatmaları
III. Yalnızca ticari konaklama değil; sınır güvenliği, gaza üssü ve İslamiyeti yayma merkezi işlevi gören "Ribat" kervansaraylarını kurmaları

Yukarıda verilen kurumsal gelişmelerden hangileri Karahanlılar Devleti''ne aittir?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de Karahanlılara aittir: Bimarhane (hastane), Semerkant Medresesi ve ilk burslu öğrencilik sistemi ile sınır boylarında çok işlevli Ribat kervansarayları Karahanlıların Türk-İslam medeniyetine kazandırdığı kurumsal anıtlardır.',
  'Ramazan Yetgin notlarında özel olarak vurgulanan kural: "Maristan derse Tolunoğulları, Bimarhane/Bimaristan derse Karahanlılar." Aday bu iki hastane ismini birbirine karıştırırsa I. öncülü eleyerek hata yapar.',
  4
);

-- Soru #005 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Afganistan''ın Gazne şehrinde Alp Tigin tarafından temelleri atılan ve Türk tarihinde adını kurulduğu coğrafi bölgeden/şehirden alan devlet aşağıdakilerden hangisidir?',
  '{"options": ["Karahanlılar", "Gazneliler", "İhşidler", "Tolunoğulları", "Harzemşahlar"], "correctIndex": 1}'::jsonb,
  'Gazneliler (963-1187), Afganistan''ın Gazne şehrinde kurulmuş ve adını bu şehirden almıştır. Karahanlılar hanedan unvanından, Tolunoğulları kurucusundan, Harzemşahlar ise Harzem bölgesinden almıştır. Kurulduğu şehrin adını taşıyan ilk büyük devlet Gaznelilerdir.',
  'ÖSYM Türk devletlerinin adını nereden aldığını (kurucusundan mı, boyundan mı, kurulduğu yerden mi) sıkça sorar. Tolunoğulları ve İhşidler kurucularının adını alırken, Gazneliler kurulduğu kentin adını almıştır.',
  5
);

-- Soru #006 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Gazneli Devleti''nin en kudretli hükümdarı olan Gazneli Mahmut; Abbasi halifesini Şii Büveyhoğulları baskısından kurtarmış, bunun üzerine Abbasi Halifesi el-Kadir Billah tarafından kendisine çeşitli unvanlar ve hilatlar tevdi edilmiştir.

Buna göre, dünya tarihinde "Sultan" unvanını resmi olarak kullanan ilk hükümdar olan Gazneli Mahmut''a halife tarafından verilen diğer unvanlar aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Ebu''l-Feth – Doğunun ve Batının Hükümdarı", "Zamanın Yeganesi – Alemin Aslanı", "Hadimü''l-Haremeyn – Seyfüddin", "İlteriş – Apa Tarkan", "Kutluğ – Şanyü"], "correctIndex": 1}'::jsonb,
  'Abbasi Halifesi, kendisini Şii tehlikesinden koruyan Gazneli Mahmut''a ''Sultan'' unvanının yanında MEB müfredatında yer alan ''Zamanın Yeganesi (Yeminü''d-Devle)'' ve ''Alemin Aslanı'' unvanlarını vermiştir. ''Ebu''l-Feth'' Sultan Alparslan''a, ''Doğunun ve Batının Hükümdarı'' Tuğrul Bey''e aittir.',
  'ÖSYM halifelerin Türk hükümdarlarına verdiği unvanları sıklıkla birbiriyle eşleştirerek sorar: Tuğrul Bey = Doğunun ve Batının Hükümdarı; Alparslan = Ebu''l-Feth; Gazneli Mahmut = Sultan / Zamanın Yeganesi / Alemin Aslanı.',
  6
);

-- Soru #007 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  1,
  'Gazneli Mahmut Hindistan üzerine tam 17 büyük sefer düzenlemiş ve bu seferler sonucunda İslamiyet bugünkü Pakistan, Bangladeş ve Hindistan coğrafyasına yayılmıştır. Gazneli Mahmut bu seferlerin ilk dördüne bizzat katılan ve bilim dünyasına eşsiz katkılar sunan ünlü bilgin için:

"Sarayımın en değerli hazinesidir!" ifadesini kullanmıştır.

Gazneli Mahmut''un bu övgüyle bahsettiği ve Asarü''l-Bakiye adlı eserin sahibi olan Türk-İslam bilgini aşağıdakilerden hangisidir?',
  '{"options": ["İbn Sina", "Farabi", "Biruni", "Harezmi", "Ali Kuşçu"], "correctIndex": 2}'::jsonb,
  'Gazneli Mahmut''un "Sarayımın en değerli hazinesi" dediği dahi bilgin Ebu Reyhan el-Biruni''dir. Biruni yerçekimini Newton''dan önce keşfetmiş, dünyanın çapını gerçeğe çok yakın hesaplamış ve jeodezi ilminin kurucusu kabul edilmiştir.',
  'Adaylar tıp ve felsefedeki şöhreti nedeniyle hemen İbn Sina (A şıkkı) veya Farabi''ye (B şıkkı) yönelebilir. Gazneli Mahmut sarayında himaye edilen ve Hindistan seferlerine katılan bilgin kesin olarak Biruni''dir.',
  7
);

-- Soru #008 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Gaznelilerin Selçuklular karşısında 1035 Nesa, 1038 Sarahs ve 1040 Dandanakan savaşlarını kaybederek çöküş sürecine girmesinde ve nihayetinde 1187 yılında yerli halk olan Gurlular tarafından yıkılmasında;

I. Ülke sınırları içerisinde Türklerin yanı sıra Hint, Afgan, Fars ve Tacik gibi çok farklı etnik toplulukların yaşaması (çok uluslu yapı),
II. Ordunun büyük kısmının ücretli askerlerden ve yerel unsurlardan teşekkül etmesi sebebiyle iç isyanlarda sadakatin sarsılması,
III. İslamiyet''i kabul etmeyip Budizm inancına bağlı kalmaları

durumlarından hangileri etkili olmuştur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'Gazneliler koyu bir Sünni Müslüman devlettir; Budizm ile hiçbir ilgileri yoktur (III. öncül yanlış). Gaznelilerin çabuk dağılmasının en büyük yapısal sebebi, Karahanlılar gibi homojen bir Türk toplumu olmaması; Hint, Fars, Afgan gibi çok uluslu bir imparatorluk olması ve toplumsal kaynaşmanın sağlanamamasıdır.',
  'Adaylar "Tapo Kağan Budizm''e girdi" bilgisini Gaznelilerle karıştırabilir veya III. öncülü dikkatsizce doğru sanabilir. Gaznelilerin Karahanlılardan temel farkı ulusçu değil, çok uluslu imparatorluk karakterinde olmalarıdır.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1040 Dandanakan Savaşı sonrasında toplanan kurultayda bağımsızlığını resmen ilan eden Büyük Selçuklu Devleti; adını Selçuk Bey''den almakla birlikte devletin gerçek kurucusu Tuğrul Bey''dir.

Büyük Selçuklu Devleti ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Selçukluların bilinen en eski atası ''Demiryaylı'' lakaplı Dukak Bey''dir.", "Kuruluş döneminde başkent sırasıyla Nişabur, Rey ve İsfahan şehirlerine taşınmıştır.", "Devletin resmi yazışma dili ve edebiyat dili Farsça, bilim dili ise Arapça olmuştur.", "Oğuzların Üçoklar kolunun Kınık boyu tarafından kurulmuştur.", "Hükümdarları ilk kez ''Padişah'' unvanını kullanarak Orta Asya Türk unvanlarını tamamen terk etmiştir."], "correctIndex": 4}'::jsonb,
  'Tarihte ilk kez ''Padişah'' unvanını kullanan hükümdar Gazneli Alp Tigin''dir; Osmanlılar ve Selçuklular da bu unvandan yararlanmıştır. Ancak Selçuklu hükümdarları Tuğrul, Çağrı, Alparslan gibi saf Türkçe isimleri ve Yabgu/Sultan unvanlarını kullanmış, Orta Asya geleneklerini tamamen terk etmemiştir.',
  'Adaylar Selçukluların boyunu (Kınık) Osmanlıların boyu (Kayı) ile karıştırabilir. Selçuklular Oğuzların Üçok kolunun Kınık boyudur; Osmanlılar ise Bozok kolunun Kayı boyudur.',
  9
);

-- Soru #010 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti ile Bizans İmparatorluğu (ve müttefiki Gürcüler) arasında 1048 yılında yapılan, Gürcü Kralı Liparit''in esir alındığı ve tarihte Selçuklular ile Bizans arasındaki ilk büyük meydan savaşı kabul edilen muharebe aşağıdakilerden hangisidir?',
  '{"options": ["Malazgirt Savaşı", "Pasinler Savaşı", "Miryokefalon Savaşı", "Katvan Savaşı", "Yassı Çimen Savaşı"], "correctIndex": 1}'::jsonb,
  '1048 Pasinler Savaşı (Erzurum yakınları), Büyük Selçuklu ile Bizans arasındaki ilk büyük savaştır. Selçuklu ordusu İbrahim Yinal ve Kutalmış komutasında Bizans-Gürcü ordusunu mağlup etmiş ve Gürcü Kralı Liparit esir alınmıştır. Bu savaş Anadolu''ya yapılacak akınların kapısını aralamıştır.',
  'ÖSYM Bizans ile yapılan ilk savaşları kronolojik olarak tuzak yapar: Selçuklu-Bizans ilk savaşı = Pasinler (1048); Anadolu''nun kapısını açan = Malazgirt (1071); Anadolu''yu kesin Türk yurdu yapan = Miryokefalon (1176); Osmanlı-Bizans ilk savaşı = Koyunhisar/Bafeon (1302).',
  10
);

-- Soru #011 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Hükümdarı Tuğrul Bey, 1055 yılında gerçekleştirdiği Bağdat Seferi ile Abbasi halifesini esir tutan Şii Büveyhoğulları Devleti''ne tamamen son vermiştir.

Bu tarihi gelişmenin ardından Abbasi Halifesi Kaim Biemrillah''ın Tuğrul Bey''e ''Doğunun ve Batının Hükümdarı'' (Sultanü''l-Mağrib ve''l-Maşrık) unvanını verip altın taç giydirmesi, İslam dünyasında aşağıdakilerden hangisinin somut bir göstergesidir?',
  '{"options": ["Halifelik makamının resmen Büyük Selçuklu hanedanına geçtiğinin", "İslam dünyasındaki mezhep ayrılıklarının tamamen sona erdiğinin", "Siyasi ve askeri liderliğin Türklere geçtiği, halifenin ise yalnızca dini bir otorite olarak kaldığı laik/ikili iktidar yapısının doğduğunun", "Büyük Selçuklu Devleti''nin teokratik monarşiden meşruti monarşiye geçtiğinin", "Abbasi Devleti''nin hukuken ve fiilen tamamen yıkıldığının"], "correctIndex": 2}'::jsonb,
  'Tuğrul Bey''in Bağdat Seferi ile İslam dünyasının dünyevi/siyasi ve askeri liderliği Türklere geçmiştir. Halifelik unvanı Türklere geçmemiş, halife yalnızca dini/manevi lider olarak kalmıştır. Böylece din ile devlet işleri kurumsal olarak fiilen birbirinden ayrılmıştır.',
  'ÖSYM''nin en sevdiği klasik çeldirici: "Halifelik Selçuklulara / Tuğrul Bey''e geçti" (A şıkkı). Halifelik Selçuklulara asla geçmemiştir; Abbasi soyunda kalmıştır. Halifelik Türklere ilk kez 1517 Ridaniye Seferi ile Yavuz Sultan Selim zamanında geçecektir.',
  11
);

-- Soru #012 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Sultanı Alparslan, 1064 yılında Hristiyan dünyası için alınamaz kabul edilen Doğu Anadolu''daki müstahkem Ani (Kars) Kalesi ve şehrini fethetmiştir.

Bu büyük zaferin ardından Abbasi Halifesi tarafından Sultan Alparslan''a verilen ve "Fetihlerin Babası" anlamına gelen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Ebu''l-Feth", "Seyfüddin", "Ruknü''d-Din", "Melikü''l-Müluk", "Sultanü''l-Azam"], "correctIndex": 0}'::jsonb,
  'Kars Ani Kalesi''nin fethinden (1064) sonra Abbasi halifesi Sultan Alparslan''a ''Ebu''l-Feth'' (Fetihlerin Babası) unvanını tevcih etmiştir. Bu unvan doğrudan KPSS sınav sorularında defalarca yoklanmış kritik bir bilgidir.',
  'Adaylar bu unvanı Fatih Sultan Mehmet ile veya Tuğrul Bey''in unvanıyla karıştırabilir. Ani Kalesi fethi = Alparslan = Ebu''l-Feth eşleştirmesi kesindir.',
  12
);

-- Soru #013 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '26 Ağustos 1071 Malazgirt Meydan Muharebesi''nde Sultan Alparslan Bizans ordusunu mağlup etmiş ve Bizans İmparatoru Romen Diyojen esir alınmıştır.

Sultan Alparslan savaştan sonra komutanlarına hitaben "Toprak fethedenin malıdır ve fethedilen yer fetheden komutana kılıç hakkı olarak verilecektir" emrini vermiştir.

Alparslan''ın bu uygulamasının doğrudan sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu''da merkezi otoritenin tek bir merkezden eksiksiz yönetilmesi", "Anadolu''da I. Türk Beylikleri döneminin başlaması ve fethin hızlanması", "Bizans İmparatorluğu''nun Balkan topraklarına tamamen çekilerek yıkılması", "Türkmenlerin yerleşik hayata geçişinin Kurultay kararıyla yasaklanması", "Haçlı Seferleri tehlikesinin tamamen bertaraf edilmesi"], "correctIndex": 1}'::jsonb,
  'Kılıç hakkı politikası komutanları motive etmiş; Saltuklular, Mengücekliler, Danişmentliler ve Artuklular gibi I. Beylikler hızla kurularak Anadolu''nun fethi ve Türkleşmesi olağanüstü hızlanmıştır. Ancak beyliklerin kendi başına hareket etmesi merkezi otoriteyi zayıflatmıştır.',
  'Aday "merkezi otorite güçlendi" (A şıkkı) tuzağına düşebilir. "Toprak fethedenindir" kuralı fethi hızlandırır ama feodal beylikler ortaya çıkardığı için merkezi otoriteyi zayıflatır.',
  13
);

-- Soru #014 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Devleti''nin en parlak hükümdarı Sultan Melikşah ve ünlü veziri Nizamülmülk döneminde devlet teşkilatı zirveye ulaşmıştır.

Bu dönemde Bağdat, Nişabur ve İsfahan gibi merkezlerde açılan "Nizamiye Medreseleri"nin kurulmasında;
I. Devletin genişleyen sınırları sebebiyle artan bürokrat, kadı ve müderris ihtiyacını karşılamak,
II. Hasan Sabbah liderliğindeki Bâtınilik (Haşhaşilik) ve Şii Fatımi propagandasına karşı Sünni İslam inancını ilmi ve fikri yönden savunmak,
III. İslam felsefesi ve pozitif ilimlerde üstün bilim insanları yetiştirmek

amaçlarından hangileri etkili olmuştur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Nizamiye Medreseleri hem ilk üniversite düzeyinde yükseköğretim kurumlarıdır hem de ideolojik olarak Şii Fatımi ve Bâtıni yıkıcı fikir akımlarına karşı devleti fikren savunacak ehli sünnet alimler (İmam Gazali gibi) yetiştirme misyonuyla kurulmuştur.',
  'Bazı adaylar medreselerin sadece dini amaçla kurulduğunu zanneder; oysa I. öncüldeki "devlet memuru / bürokrat ihtiyacını karşılama" hedefi Nizamülmülk''ün Siyasetname''sinde bizzat belirttiği temel gayedir.',
  14
);

-- Soru #015 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Devleti''nin çöküş sürecine girmesinde dış askeri mağlubiyetlerin yanında iç dinamikler ve suikastlar da belirleyici olmuştur.

Buna göre, Büyük Selçuklu Devleti''nin zayıflayıp dağılmasında;
I. 1141 yılında Karahitaylar ile yapılan Katvan Savaşı''nın kaybedilmesi,
II. Hasan Sabbah''ın yönlendirdiği Bâtınilerin Vezir Nizamülmülk başta olmak üzere devlet ricaline düzenlediği siyasi suikastlar,
III. Devleti kuran asıl unsur olan Oğuzların yönetim kadrolarına Farsların getirilmesine tepki göstererek isyan etmesi ve Sultan Sencer''i esir alması

gelişmelerinden hangileri doğrudan etkili olmuştur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Öncüllerin üçü de Büyük Selçuklu''nun yıkılışında kilit rol oynamıştır. 1141 Katvan hezimeti dış darbedir; Bâtınilik suikastları iç yapıyı felç etmiştir; Oğuzların (Türkmenlerin) devlete küsüp Sultan Sencer''i esir etmesi ise devleti fiilen bitirmiştir.',
  'Adaylar "Oğuzlar Selçukluyu kurdu, devlete neden isyan etsin?" yanılgısına kapılabilir. Selçukluların Farsçayı resmi dil yapması ve İranlı bürokratları öne çıkarması kurucu Oğuzları küstürmüş ve büyük Oğuz İsyanı''na yol açmıştır.',
  15
);

-- Soru #016 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Abbasi Devleti''nin zayıflamasıyla merkezi otoriteden koparak İslam coğrafyasında kurulan küçük devletlere "Tevaif-i Mülük" denir.

868 yılında Abbasilerin Mısır valisi Tolunoğlu Ahmet tarafından kurulan, Mısır''da kurulan ilk Türk-İslam devleti olan ve halka din, ırk ayrımı gözetmeksizin ücretsiz sağlık hizmeti veren "Maristan" adlı hastaneleriyle ünlenen devlet aşağıdakilerden hangisidir?',
  '{"options": ["İhşidler (Akşitler)", "Tolunoğulları", "Eyyubiler", "Memlükler", "Fatimiler"], "correctIndex": 1}'::jsonb,
  'Mısır''da kurulan ilk Türk-İslam devleti Tolunoğulları''dır (868-905). Tolunoğlu Ahmet tarafından kurulmuş bir Tevaif-i Mülük devletidir. Maristan adı verilen hastane ve eczaneleri inşa etmişlerdir. Yöneticileri Türk, halkı ise yerli Arap ve Kıptilerden oluşmuştur.',
  'ÖSYM Mısır''da kurulan Türk devletlerinin kronolojisini ve ilklerini sorar: 1. Tolunoğulları (İlk kurulan / Maristan), 2. İhşidler (Hicaz''a hakim ilk Türk devleti), 3. Eyyubiler (Kudüs fatihi), 4. Memlükler (Moğolları yenen). Fatimiler ise Türk değil, Şii Arap devletidir.',
  16
);

-- Soru #017 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Ferganalı Muhammed bin Togaç tarafından kurulan; halife tarafından kendisine ak yüzlü, güneş gibi parlayan anlamına gelen "Akşit" unvanı verilen ve Türk tarihinde kutsal Hicaz bölgesine (Mekke ve Medine) egemen olan ilk Türk-İslam devleti aşağıdakilerden hangisidir?',
  '{"options": ["Tolunoğulları", "İhşidler (Akşitler)", "Eyyubiler", "Memlükler", "Osmanlı Devleti"], "correctIndex": 1}'::jsonb,
  'Hicaz bölgesine (Mekke, Medine, Taif, Hayber) egemen olan ilk Türk-İslam devleti İhşidler''dir (Akşitler). Kurucusu Muhammed bin Togaç''tır. İhşid kelime anlamı olarak "prens" veya "vali" demektir.',
  'Adaylar Hicaz denilince akıllarına ilk olarak Yavuz Sultan Selim ve Osmanlı Devleti''ni veya Memlükleri getirebilir. "Hicaz''a egemen olan İLK Türk devleti" sorulduğunda tartışmasız doğru cevap İhşidler''dir.',
  17
);

-- Soru #018 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1187 yılında Haçlı ordusuna karşı kazandığı Hıttin Savaşı ile 88 yıllık Haçlı işgaline son vererek Kudüs''ü geri alan, bu zaferiyle III. Haçlı Seferi''nin başlamasına yol açan ve "Kudüs Fatihi" olarak anılan Eyyubi hükümdarı aşağıdakilerden hangisidir?',
  '{"options": ["Sultan Baybars", "Selahaddin Eyyubi", "Seyfeddin Kutuz", "Nureddin Zengi", "Melikşah"], "correctIndex": 1}'::jsonb,
  '1187 Hıttin Savaşı ile Kudüs''ü Haçlılardan geri alan hükümdar Selahaddin Eyyubi''dir. Selahaddin Eyyubi Haçlılara karşı gösterdiği adalet ve merhametle hem Doğu''da hem Batı''da büyük saygı görmüş; Avrupalı şövalyeler arma (heraldik) sistemini Eyyubilerden örnek almıştır.',
  'Adaylar Moğolları yenen Sultan Baybars (A şıkkı) ile Kudüs fatihi Selahaddin Eyyubi''yi karıştırabilir. Hıttin Savaşı = Kudüs = Selahaddin Eyyubi ayrılmaz bir üçlüdür.',
  18
);

-- Soru #019 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Resmi yazışmalarında kendilerini "ed-Devletü''t-Türkiyye" (Türkiye Devleti) olarak tanımlayan Memlükler, Türk devlet geleneğindeki diğer devletlerden farklı özellikler göstermişlerdir.

Aşağıdakilerden hangisi Memlükler Devleti''nin diğer Türk-İslam devletlerinden ayrılan en belirgin özelliğidir?',
  '{"options": ["Hükümdarlığın saltanat usulüyle babadan oğula geçmeyip her güçlü ordu komutanının (emirin) sultan olma hakkına sahip olması", "Abbasi halifesini Moğol istilasından korumayarak halifelik makamını tamamen ortadan kaldırmaları", "Ordularında devşirme asker yerine yalnızca Moğol esirlerini istihdam etmeleri", "Hicaz bölgesine hiçbir zaman egemen olamamaları", "Resmi dillerini Türkçe ilan ederek Arapçanın kullanımını yasaklamaları"], "correctIndex": 0}'::jsonb,
  'Memlükler, "kut anlayışı ve kutun kan bağıyla hanedana geçmesi" kuralını uygulamayan tek Türk devletidir. Memlüklerde saltanat babadan oğula geçme kuralına bağlı kalmamış, ordunun desteğini arkasına alan her kudretli emir (komutan) sultan olabilmiştir.',
  'ÖSYM Memlüklerin bu "veraset sistemi istisnası"nı çok sever. Adaylar tüm Türk devletlerinde verasetin babadan oğula/hanedana geçtiğini ezberlediği için bu şıkkı şaşırtıcı bulabilir; oysa Memlüklerin en ayırt edici sınav kazanımı budur.',
  19
);

-- Soru #020 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  '1260 yılında Filistin''de yapılan Ayn Calud Savaşı ve 1277 yılındaki Elbistan Savaşı ile o güne kadar yenilmez kabul edilen Moğol (İlhanlı) ordularını dünya tarihinde ilk kez mağlup ederek durduran Türk-İslam devleti aşağıdakilerden hangisidir?',
  '{"options": ["Büyük Selçuklu Devleti", "Anadolu Selçuklu Devleti", "Memlükler", "Harzemşahlar", "Eyyubiler"], "correctIndex": 2}'::jsonb,
  'Moğolları tarihte ilk kez hezimete uğratan ve Batı''ya (Mısır ve Kuzey Afrika''ya) ilerleyişlerini durduran devlet Memlükler''dir. 1260 Ayn Calud Savaşı''nı Sultan Kutuz ve komutanı Baybars; 1277 Elbistan Savaşı''nı ise bizzat Sultan Baybars kazanmıştır.',
  'Adaylar Moğollarla savaşan Anadolu Selçuklu (Kösedağ''da yenildi) veya Harzemşahlar (Otrar''da yenildi) şıklarına yönelebilir. Moğolları yenen yegane Türk devleti Memlüklerdir.',
  20
);

-- Soru #021 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Diyarbakır merkezli kurulan ve en parlak dönemini Uzun Hasan zamanında yaşayan Akkoyunlular;
I. Kur''an-ı Kerim''i ilk kez Türkçeye tercüme ettirmeleri,
II. Dede Korkut Hikayeleri''ni ilk kez yazılı hale getirmeleri,
III. Ali Kuşçu ve Celaleddin Devvani gibi ünlü astronom ve matematikçileri yetiştirmeleri

özelliklerinden hangilerine sahiptir?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de Akkoyunlulara aittir: Kur''an''ı Türkçeye çevirmişler, Dede Korkut''u yazıya geçirmişler ve Ali Kuşçu gibi bilginleri himaye etmişlerdir. Uzun Hasan ayrıca Avrupa saraylarında "Küçük Türk" (Fatih ise "Büyük Türk") olarak anılmıştır.',
  'Adaylar Dede Korkut''un Kıpçaklar veya Osmanlılar tarafından yazıya geçirildiğini zannedebilir. Dede Korkut''u derleyip kitaplaştıran Akkoyunlular''dır.',
  21
);

-- Soru #022 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  '14. yüzyılın sonunda Semerkant merkezli kurulan Timur İmparatorluğu''nun hükümdarı Timur;
I. 1395''te Karadeniz''in kuzeyindeki Altın Orda Devleti''ni parçalayarak Rus Çarlığı''nın güçlenmesine ve güneye inmesine zemin hazırlaması,
II. 1402 Ankara Savaşı''nda Yıldırım Bayezid''i mağlup ederek Osmanlı Devleti''ni 11 yıllık Fetret Devri''ne sokması,
III. Sarayında Ali Şir Nevai, Uluğ Bey ve Ali Kuşçu gibi isimleri barındırarak Semerkant merkezli parlak bir bilim-kültür rönesansı başlatması

tarihsel gelişmelerinden hangileriyle Türk dünyasını ve siyasi tarihini doğrudan etkilemiştir?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Timur askeri harekatlarıyla Türk dünyasına iki büyük darbe vurmuştur: Altın Orda''yı parçalayarak Rusların önünü açmış ve Osmanlı''yı Fetret''e sokmuştur. Bununla birlikte Semerkant''ı imar etmiş, torunu Uluğ Bey ve Ali Şir Nevai ile bilime büyük katkı yapmıştır.',
  'ÖSYM Timur''un "Türk dünyasına vurduğu iki zarar"ı sınavda çokça irdeler. Adaylar Altın Orda ve Osmanlı ile olan mücadelelerin sonuçlarını öncüllü sorularda ayırt etmelidir.',
  22
);

-- Soru #023 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Hindistan''da kurulan ve Yeni Çağ''da kurulup Yakın Çağ''da (1858) İngilizler tarafından yıkılan tek Türk-İslam devleti olan Babür İmparatorluğu''nda; Şah Cihan''ın genç yaşta vefat eden eşi Mümtaz Mahal (Ercüment Nurbanu Begüm) anısına Agra kentinde inşa ettirdiği, beyaz mermerden anıt mezar şaheseri aşağıdakilerden hangisidir?',
  '{"options": ["Taç Mahal", "Elhamra Sarayı", "İshak Paşa Sarayı", "Kuvvetü''l-İslam Camii", "Ribat-ı Mahi"], "correctIndex": 0}'::jsonb,
  'Hindistan''ın Agra kentindeki Taç Mahal, Babür Hükümdarı Şah Cihan tarafından eşi için yaptırılmış bir anıt mezardır. Mimarı Osmanlı mimarı Mimar İsa Efendi, hattatı ise Hattat Serdar Efendi''dir.',
  'Taç Mahal''in bir Türk-İslam devleti olan Babürler tarafından yaptırıldığı ve Osmanlı ustalarının (İsa Efendi) çalıştığı detayı adaylar tarafından Hindistan''a ait yerel bir tapınak zannedilerek gözden kaçırılabilir.',
  23
);

-- Soru #024 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Kendilerini Büyük Selçuklu Devleti''nin mirasçısı olarak gören Harzemşahlar; 1219 yılında Moğol kervanını casusluk iddiasıyla katlederek tarihte "Otrar Faciası"na yol açmış ve Cengiz Han ordularının İslam dünyasını istila etmesini tetiklemiştir.

Harzemşahlar Devleti''nin 1230 yılında Anadolu Selçuklu Sultanı I. Alaeddin Keykubad ile yaptığı Yassı Çimen Savaşı''nı kaybetmesinin Anadolu Türk tarihi açısından en ağır jeopolitik sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu Selçuklu Devleti''nin Moğollarla arasındaki tampon bölgenin ortadan kalkması ve Moğol istilasına açık hale gelmesi", "Bizans İmparatorluğu''nun Anadolu''yu tamamen geri alması", "Karamanoğulları Beyliği''nin bağımsızlığını ilan etmesi", "Anadolu Selçuklularında taht kavgalarının sona ermesi", "Haçlı Seferleri''nin sona ermesi"], "correctIndex": 0}'::jsonb,
  'Yassı Çimen Savaşı (1230) ile Anadolu Selçuklu Devleti Harzemşahları yenmiş ve Harzemşahlar kısa süre sonra İlhanlılar tarafından yıkılmıştır. Bu durum Anadolu ile Moğollar arasındaki koruyucu tampon bölgeyi yok etmiş ve 1243 Kösedağ Moğol İstilası''na doğrudan zemin hazırlamıştır.',
  'Adaylar zafer kazanıldığı için sonucun tamamen olumlu olduğunu zannedebilir; oysa Yassı Çimen zaferi stratejik olarak Selçukluları Moğol tehlikesiyle baş başa bırakan büyük bir jeopolitik hata olmuştur.',
  24
);

-- Soru #025 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1071 Malazgirt Zaferi''nden sonra Anadolu''da kurulan I. Dönem Türk Beylikleri ve mimari eserleri eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Danişmentliler $ → $ Niksar Yağıbasan Medresesi (Anadolu''nun ilk Türk medresesi)", "Mengücekliler $ → $ Divriği Ulu Camii ve Darüşşifası (UNESCO Mirası)", "Artuklular $ → $ Diyarbakır Malabadi Köprüsü ve Cezeri''nin çalışmaları", "Saltuklular $ → $ Erzurum Mama Hatun Kümbeti ve Kale Camii", "Çaka Beyliği $ → $ Kayseri Gevher Nesibe Darüşşifası"], "correctIndex": 4}'::jsonb,
  'Kayseri Gevher Nesibe Darüşşifası ve Külliyesi, I. Gıyaseddin Keyhüsrev döneminde inşa edilmiş bir Anadolu Selçuklu Devleti eseridir; Çaka Beyliği''ne ait değildir. Çaka Beyliği İzmir ve çevresinde ilk denizci beyliktir.',
  'ÖSYM I. Beylikler ile eserlerini her yıl mutlaka sorar: Yağıbasan = Danişmentliler; Divriği = Mengücekliler; Malabadi/Cezeri = Artuklular; Mama Hatun = Saltuklular. Gevher Nesibe ise Anadolu Selçukluları''na aittir.',
  25
);

-- Soru #026 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Anadolu Selçuklu Sultanı II. Kılıç Arslan döneminde 1176 yılında Bizans İmparatoru Manuel Komnenos''a karşı kazanılan, tarihe "Kumdanlı" veya "Yurttutan Savaşı" olarak geçen Miryokefalon Zaferi''nin Türk tarihindeki en temel önemi aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu''nun kapılarının Türklere ilk kez açılması", "Anadolu''nun kesin olarak Türk yurdu haline gelmesi ve Bizans''ın Türkleri Anadolu''dan atma ümidinin tamamen yok olması", "Osmanlı Devleti ile Bizans arasındaki ilk sınır çatışmasının başlaması", "Bizans İmparatorluğu''nun başkenti İstanbul''un kuşatılması", "Batı Anadolu''daki tüm denizci beyliklerin tek çatı altında birleştirilmesi"], "correctIndex": 1}'::jsonb,
  'Miryokefalon Zaferi (1176), Anadolu''nun tapusunun alındığı ve Anadolu''nun kesin Türk yurdu olduğunun tescillendiği savaştır. Bu zaferden sonra Batı ve Bizans kaynakları Anadolu için kalıcı olarak "Turchia (Türkiye)" adını kullanmaya başlamıştır.',
  'ÖSYM formülü: Pasinler = Keşif; Malazgirt = Yurt açan; Miryokefalon = Yurt tutan; Büyük Taarruz = Yurt kurtaran. Adaylar Malazgirt (kapı açan) ile Miryokefalon''u (kesinleştiren) karıştırmamalıdır.',
  26
);

-- Soru #027 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Anadolu Selçuklu Devleti ticareti canlandırmak ve Anadolu''yu uluslararası bir ticaret üssü haline getirmek amacıyla kapsamlı iktisadi politikalar uygulamıştır.

Aşağıdakilerden hangisi Anadolu Selçuklu Devleti''nin ticareti geliştirmeye yönelik uygulamalarından biri değildir?',
  '{"options": ["Kervanları haydutlarca soyulan veya batan tüccarların zararlarını devlet hazinesinden karşılayarak dünyada ilk kez devlet sigortacılığını başlatmaları", "Sinop, Antalya, Alanya (Alaiye) limanlarını fethedip Kırım''ın Sudak Limanı''na deniz aşırı sefer düzenlemeleri", "Venedik ve Kıbrıs Krallığı ile ticaret antlaşmaları yapıp düşük gümrük tarifesi uygulamaları", "Kayseri''de dünyanın ilk uluslararası fuarlarından biri olan ''Yabanlu Pazarı''nı kurmaları", "Düyun-u Umumiye İdaresi''ni kurarak yabancı tüccarların borçlarını tahsil etmelerine imkân tanımaları"], "correctIndex": 4}'::jsonb,
  'Düyun-u Umumiye (Genel Borçlar İdaresi), 1881 yılında Osmanlı Devleti''nin Muharrem Kararnamesi ile iflas etmesi üzerine Avrupalı alacaklı devletler tarafından kurulmuş 19. yüzyıl kurumudur; Selçuklularla ilgisi yoktur.',
  'Adaylar "devlet sigortacılığı" (A şıkkı) ve "Yabanlu Pazarı" (D şıkkı) gibi terimleri çok modern bulup seçeneklerde yanlış zannedebilir. Oysa bunlar Ramazan Yetgin notlarında ASD''nin ticari ilkleri olarak özel vurgulanan altın bilgilerdir.',
  27
);

-- Soru #028 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Anadolu Selçuklu Devleti''nde II. Gıyaseddin Keyhüsrev zamanında;
- 1240 yılında çıkan ve bastırılmasında devletin çok zorlanarak otoritesinin zayıfladığını açıkça gösteren Türk tarihinin ilk dini-sosyal nitelikli ayaklanması,
- Bu otorite boşluğunu fırsat bilen İlhanlı Moğollarının Selçuklu ordusunu hezimete uğrattığı ve Anadolu Türk siyasi birliğini parçalayan 1243 yılındaki savaş

aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Şeyh Bedrettin İsyanı – Otlukbeli Savaşı", "Baba İshak İsyanı – Kösedağ Savaşı", "Şahkulu İsyanı – Çaldıran Savaşı", "Bozoklu Celal İsyanı – Yassı Çimen Savaşı", "Canberdi Gazali İsyanı – Katvan Savaşı"], "correctIndex": 1}'::jsonb,
  '1240 Baba İshak İsyanı (Babailer Ayaklanması), Anadolu Selçuklu Devleti''nde çıkan ilk dini ve sosyal içerikli ayaklanmadır. İsyanın 2 yılda zor bastırılması Selçuklu zaafını ortaya çıkarmış ve 1243 Kösedağ Savaşı ile Moğollar Anadolu''yu istila ederek II. Beylikler dönemini başlatmıştır.',
  'ÖSYM Şeyh Bedrettin İsyanı (Osmanlı''nın ilk dini nitelikli isyanı) ile Baba İshak İsyanı''nı (Türk tarihinin ve Selçuklu''nun ilk dini nitelikli isyanı) sürekli çeldirici olarak karşılaştırır.',
  28
);

-- Soru #029 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Kösedağ Savaşı''ndan sonra Anadolu''da kurulan II. Dönem Türk Beylikleri ile ilgili olarak;
I. Karamanoğulları: Kendilerini Anadolu Selçuklu Devleti''nin mirasçısı görmüş, 1277''de Karamanoğlu Mehmet Bey Türkçeyi resmi dil ilan etmiştir.
II. Karesioğulları: Osmanlı Devleti''ne katılan ilk beylik olup Osmanlı donanmasının çekirdeğini oluşturmuş ve Rumeli''ye geçişi kolaylaştırmıştır.
III. Dulkadiroğulları: 1515 Turnadağ Savaşı ile Osmanlı Devleti''ne katılan son beylik olup Anadolu Türk siyasi birliğini kesinleştirmiştir.
IV. Aydınoğulları: Ege''de güçlü bir donanma kurmuş ve Türk tarihinde ilk kez Venedik''e ticari kapitülasyon tanımıştır.

yargılarından hangileri doğrudur?',
  '{"options": ["I ve II", "I, II ve III", "II, III ve IV", "I, III ve IV", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'Verilen dört öncül de II. Beyliklere ait en kilit KPSS kazanımlarıdır. Karamanoğulları (resmi dil Türkçe), Karesioğulları (ilk katılan), Dulkadiroğulları (son katılan) ve Aydınoğulları (Venedik''e ilk kapitülasyon) tamamen doğrudur.',
  'Adaylar "Türk tarihinde ilk kapitülasyonu Fatih veya Kanuni verdi" ezberine düşebilir. Oysa Türk tarihinde ilk kez yabancı bir devlete (Venedik) kapitülasyon tanıyan beylik Aydınoğulları''dır.',
  29
);

-- Soru #030 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Türklerin İslamiyet''i kabul etmesiyle birlikte hükümdarlık sembol ve unvanlarında köklü değişiklikler yaşanmıştır.

Aşağıdakilerden hangisi Türklerin İslamiyet''i kabul etmesinden SONRA kullanılmaya başlanan hükümdarlık alametlerinden biri değildir?',
  '{"options": ["Hutbe okutmak", "Kendi adına sikke (para) bastırmak", "Çetr (Ayetli hükümdarlık şemsiyesi)", "Hilat ve Tıraz giymek", "Kotuz (Sorguç) ve Otağ bulundurmak"], "correctIndex": 4}'::jsonb,
  'Kotuz (at veya yaban sığırı kuyruğu sorgucu) ve Otağ (hükümdar çadırı) İslamiyet öncesi dönemden beri var olan geleneksel bozkır sembolleridir. Hutbe, hilat (halifenin hediye ettiği cübbe), tıraz (halifenin adının işlendiği elbise) ve çetr ise İslamiyet''e geçişle birlikte gelen sembollerdir.',
  'ÖSYM "Hangisi İslamiyet''ten sonra gelmiştir / önce de vardır?" ayrımını çok sık yoklar. Para basmak İslam öncesinde Göktürk ve Türgişlerde de varken, İslam ile birlikte paranın üstüne İslam ibareleri ve halifenin adı (sikke) eklenmiştir. Otağ ve Kotuz ise İslam öncesine aittir.',
  30
);

-- Soru #031 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nde devlet işlerinin karara bağlandığı en yüksek yürütme ve danışma organı Divan-ı Saltanat''tır. Bu divana bağlı alt divanlar bulunmaktadır.

Aşağıdaki alt divan ve yürüttüğü temel görev eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Divan-ı İstifa $ → $ Mali işlerden sorumlu olup başkanı Müstevfi''dir.", "Divan-ı Arz (Ceysü''l-Arz) $ → $ Askeri işlerden ve ordunun ihtiyaçlarından sorumlu olup başkanı Emir-i Arz''dır.", "Divan-ı Tuğra (İnşa) $ → $ Devletin iç ve dış yazışmalarını yürütüp fermanlara tuğra çeker; başkanı Tuğrai''dir.", "Divan-ı İşraf $ → $ Askeri ve adli davaları temyiz eden mahkemedir; başkanı Kadıasker''dir.", "Niyabet-i Saltanat $ → $ Sultan başkentte bulunmadığı zamanlarda devlet işlerini yürütür; başkanı Naib''dir."], "correctIndex": 3}'::jsonb,
  'Divan-ı İşraf bir mahkeme değildir; devletin mali ve idari işlerinin işleyişini, teşkilatın nizamını hükümdar adına teftiş eden genel denetim kuruludur ve başındaki görevliye Müşrif-i Memalik denir. Adli ve siyasi davalara Divan-ı Mezalim bakar.',
  'Adaylar Divan-ı İşraf (denetim) ile Divan-ı Mezalim (yargı) kavramlarını birbirine karıştırabilir. İşraf teftiş ve denetim organıdır.',
  31
);

-- Soru #032 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu ve Anadolu Selçuklu devletlerinde bizzat Sultanın başkanlık ettiği; ağır siyasi suçların (vatana ihanet), devlet memurları hakkındaki suiistimal şikayetlerinin, vakıfların denetiminin ve kadı kararlarına yapılan itirazların görüşülüp kesin hükme bağlandığı en üst yüksek yargı divanı aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı Pervane", "Divan-ı Berid", "Divan-ı Mezalim", "Divan-ı Has", "Divan-ı Mezarlık"], "correctIndex": 2}'::jsonb,
  'Divan-ı Mezalim, hükümdarın bizzat başkanlık ettiği, kadıların çözemediği veya itiraz edilen ağır davalara bakan, kamu görevlilerini denetleyen yüksek mahkemedir. Bu divan günümüzün Yargıtay ve Danıştay fonksiyonlarını icra eder.',
  'ÖSYM Divan-ı Mezalim''in başkanının Sultan olduğu bilgisini çok sorar. Birçok aday davalara Kadıü''l-Kudat''ın başkanlık ettiğini sanarak yanılır.',
  32
);

-- Soru #033 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Devleti''nde bulunmayıp yalnızca Anadolu Selçuklu Devleti''nde teşkilatlanan; ülke genelindeki ikta topraklarının dağıtımı, tahrir defterlerinin tutulması, mülk ve vakıf arazilerinin tahsisinden sorumlu olan ve Osmanlı Devleti''ndeki Nişancı makamının temeli kabul edilen divan ve başındaki görevli aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı İstifa – Müstevfi", "Divan-ı Pervane – Pervaneci", "Divan-ı Arz – Emir-i Arz", "Divan-ı Berid – Sahib-i Berid", "Divan-ı Tuğra – Münşi"], "correctIndex": 1}'::jsonb,
  'Divan-ı Pervane ve başındaki Pervaneci, yalnızca Anadolu Selçuklu Devleti''nde var olan özel bir divandır. İkta topraklarının kaydını tutar, dağıtır ve beratlarını hazırlar. Bu makam Osmanlı''daki Nişancı''nın Selçuklu karşılığıdır (Muineddin Pervane bu makamın en bilinen simasıdır).',
  'Ramazan Yetgin notlarında ünlemle belirtilen "KPSS Kesin Soru" başlığıdır. Aday Divan-ı Pervane''nin Büyük Selçuklu''da da olduğunu zanneder; oysa sadece Türkiye Selçukluları''na özgüdür.',
  33
);

-- Soru #034 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'İlk Türk-İslam devletlerinde hukuk sistemi şer''i ve örfi olmak üzere iki ana kola ayrılmıştır.

Buna göre, Türk-İslam hukuk yapısıyla ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Şer''i Mahkemelerin Başkanı $ → $ Kadıü''l-Kudat", "Örfi Mahkemelerin Başkanı $ → $ Emir-i Dad", "Askeri Davalara Bakan Hâkim $ → $ Kadıasker (Kadıleşker)", "Şer''i Mahkemelerin Baktığı Davalar $ → $ Miras, evlenme, boşanma, vakıf ve ticaret işleri", "Örfi Hukuk Kurallarının Kaynağı $ → $ Yalnızca Kur''an-ı Kerim ve hadis hükümleri"], "correctIndex": 4}'::jsonb,
  'Örfi hukukun kaynağı Kur''an ve hadis değil; eski Türk töresi, kurultay kararları ve sultanların buyruklarıdır (Kur''an ve hadis şer''i hukukun kaynağıdır). Ancak örfi hukuk kuralları İslam dininin temel esaslarına aykırı olamaz.',
  'ÖSYM Emir-i Dad (örfi adalet başkanı) ile Kadıü''l-Kudat (şer''i adalet başkanı) ayrımını sıkça yoklar. Kadıasker ise ordudaki askerlerin davalarına bakar.',
  34
);

-- Soru #035 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nde Vezir Nizamülmülk tarafından sistemli hale getirilen ve geliri devlet memurları ile komutanlara hizmetleri karşılığında tahsis edilen "İkta Sistemi" uygulanmıştır.

Aşağıdakilerden hangisi İkta Sistemi''nin devlete sağladığı faydalar arasında gösterilemez?',
  '{"options": ["Devlet hazinesinden doğrudan nakit para harcanmadan her an savaşa hazır devasa bir atlı ordu (cebelü) kurulması", "Tarımsal üretimin denetlenerek toprağın üst üste boş kalmasının engellenmesi ve üretimde sürekliliğin sağlanması", "Taşrada ikta sahipleri sayesinde merkezi otoritenin ve asayişin tesis edilmesi", "Toprakların mülkiyetinin şahıslara geçmesiyle özel mülkiyet ve toprak aristokrasisinin teşvik edilmesi", "Vergilerin düzenli ve yerinde toplanarak memur maaşlarının doğrudan karşılanması"], "correctIndex": 3}'::jsonb,
  'İkta sisteminde toprağın mülkiyeti daima devlete (Miri arazi) aittir; ikta sahibi toprağı satamaz, devredemez, miras bırakamaz. Bu sayede Avrupa''daki gibi toprak sahibi soylu bir sınıfın (aristokrasi / feodalite) doğması engellenmiştir.',
  'ÖSYM''nin en standart soru tipidir: "İkta sistemi feodaliteyi güçlendirir mi?" Hayır, aksine toprağın mülkiyeti devlette kaldığı için feodaliteyi engeller.',
  35
);

-- Soru #036 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'İlk Türk-İslam ordularında savaş esirlerinin veya satın alınan çocukların özel kışlalarda (gulamhane) yetiştirilerek doğrudan hükümdarın muhafız birliğine alınması esasına dayanan "Gulam Sistemi" uygulanmıştır.

Gulam Sistemi bünyesinde doğrudan sarayda hükümdarın şahsını koruyan ve üç ayda bir "Biştegani" adı verilen maaşı alan asker sınıfı aşağıdakilerden hangisidir?',
  '{"options": ["Gulaman-ı Saray", "Hassa Ordusu", "Sipahiler (Cebelüler)", "Yardımcı Kuvvetler", "Yiğitbaşılar"], "correctIndex": 0}'::jsonb,
  'Sarayda bizzat padişahı koruyan devşirme/esir kökenli maaşlı askerlere Gulaman-ı Saray denir ve 3 ayda bir aldıkları maaşa Biştegani denir. Bu sistem Osmanlı''daki Kapıkulu Ocağı''nın (Yeniçeriler) ve aldıkları "Ulufe" maaşının doğrudan öncüsüdür.',
  'Adaylar Hassa Ordusu ile Gulaman-ı Saray''ı karıştırabilir. Hassa ordusu vurucu asıl ordudur ve ikta gelirleriyle geçinir; Gulaman-ı Saray ise saray muhafızıdır ve Biştegani maaşı alır.',
  36
);

-- Soru #037 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Aristo''nun eserlerini şerh ederek Batı''da "Alpharabius", İslam felsefesinde ise Aristo''dan sonra gelen "İkinci Öğretmen" anlamında "Muallim-i Sani" unvanıyla tanınan; ilimleri ilk kez sınıflandıran (İhsaü''l-Ulum) ve "El-Medinetü''l-Fazıla" (Erdemli Şehir) adlı eserinde ideal devlet düzenini anlatan Türk-İslam filozofu kimdir?',
  '{"options": ["İbn Sina", "Farabi", "İbn Rüşd", "Gazali", "Biruni"], "correctIndex": 1}'::jsonb,
  'Farabi, İslam dünyasında pozitif bilimlerin ve felsefenin öncüsüdür. Muallim-i Sani (İkinci Öğretmen) olarak bilinir. Ayrıca dünyanın ilk modern müzik kitabı olan "Kitabü''l-Musiki"yi kaleme almıştır.',
  'ÖSYM "Muallim-i Sani" dendiğinde Farabi''yi, "Avicenna" dendiğinde İbn Sina''yı, "Averroes" dendiğinde İbn Rüşd''ü test eder. Üç unvan sınavların değişmez tuzak şıklarıdır.',
  37
);

-- Soru #038 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Avrupa''da "Avicenna" ve "Tıbbın Hükümdarı" olarak bilinen, mikropların varlığını ve bulaşıcı hastalıkları Newton ve Pasteur''den asırlar önce açıklayan, kaleme aldığı "El-Kanun fi''t-Tıb" (Tıbbın Kanunu) eseri yüzyıllarca Avrupa üniversitelerinde ders kitabı okutulan Türk-İslam bilgini aşağıdakilerden hangisidir?',
  '{"options": ["İbn Sina", "Zekeriya er-Razi", "İbnü''n-Nefs", "Cabir bin Hayyan", "Akşemseddin"], "correctIndex": 0}'::jsonb,
  'İbn Sina (Avicenna), tıp tarihinin en büyük dehalarındandır. El-Kanun fi''t-Tıb ve Kitabü''ş-Şifa en önemli eserleridir. Ayrıca fizikte ivme ve hareket konusunda "Kasr-ı Meyil" teorisini ortaya atmıştır.',
  'Zekeriya er-Razi (çiçek-kızamık farkı, El-Havi Ansiklopedisi) ile İbnü''n-Nefs (küçük kan dolaşımı) İbn Sina''nın en güçlü çeldiricileridir. Avicenna ve El-Kanun unvanları doğrudan İbn Sina''yı işaret eder.',
  38
);

-- Soru #039 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Artuklular döneminde Diyarbakır sarayında yaşayan; su saatleri, otomatik çalışan mekanik cihazlar ve şifreli kilitler geliştirerek dünya bilim tarihinde robotik ve sibernetik biliminin kurucusu kabul edilen ve mekanik çizimlerini "Kitabü''l-Hiyel" adlı eserinde toplayan bilim insanı kimdir?',
  '{"options": ["Ali Kuşçu", "Takiyüddin Mehmet", "El-Cezeri", "Harezmi", "Fezari"], "correctIndex": 2}'::jsonb,
  'El-Cezeri (İbnü''l-İzz), Cizreli dahi mühendistir. Artuklular himayesinde yaşamış, robotik ve otomatik kontrol (sibernetik) sisteminin temellerini atmıştır. Leonardo da Vinci''nin ilham kaynaklarındandır.',
  'Adaylar Osmanlı''da ilk rasathaneyi açan Takiyüddin Mehmet veya cebirin kurucusu Harezmi ile karıştırabilir. Sibernetik ve robotik denince tek isim Cezeri''dir.',
  39
);

-- Soru #040 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar döneminde yazılan ilk Türk-İslam yazılı edebi eserleri ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Yusuf Has Hacip $ → $ Kutadgu Bilig (İlk siyasetname, Tamgaç Buğra Han''a sunulmuştur)", "Kaşgarlı Mahmut $ → $ Divan-ı Lügati''t-Türk (İlk Türkçe sözlük, Halife el-Muktedi Billah''a sunulmuştur)", "Edip Ahmet Yükneki $ → $ Atabetü''l-Hakayık (Hakikatlerin eşiği, ahlak ve tasavvuf kitabı)", "Ahmet Yesevi $ → $ Divan-ı Hikmet (İlk Türk mutasavvıfı, Piri Türkistan)", "Ali Şir Nevai $ → $ Şehname (Türk-İran mücadelelerini anlatan ilk Türkçe destan)"], "correctIndex": 4}'::jsonb,
  'Şehname, İranlı şair Firdevsi tarafından Gazneli Mahmut''a Farsça olarak sunulan bir eserdir (eserde Alp Er Tunga ''Afrasiyap'' olarak geçer). Ali Şir Nevai ise Timur döneminde Çağatay Türkçesiyle Türkçe''nin Farsça''dan üstün olduğunu savunan "Muhakemetü''l-Lügateyn"i yazmıştır.',
  'ÖSYM Ali Şir Nevai (Muhakemetü''l-Lügateyn) ile Kaşgarlı Mahmut''un (Divan-ı Lügati''t-Türk) amaçlarını birbirine karıştırarak sorar: Her ikisi de Türkçenin zenginliğini savunmuştur; Kaşgarlı Arapça''ya karşı, Ali Şir Nevai ise Farsça''ya karşı savunmuştur.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Mısır''da kurulan ilk Türk-İslam devleti olan ve Nil Nehri kıyısında ''Maristan'' adı verilen hastaneler açarak din, dil ve ırk ayrımı gözetmeksizin halka ücretsiz sağlık hizmeti sunan devlet aşağıdakilerden hangisidir?',
  '{"options": ["İhşidiler (Akşitler)", "Tolunoğulları", "Eyyubiler", "Memlükler", "Fatımiler"], "correctIndex": 1}'::jsonb,
  '868 yılında Tolunoğlu Ahmet tarafından Mısır''da kurulan Tolunoğulları, Mısır''da kurulan ilk Türk-İslam devletidir. Açtığı ''Maristan'' adlı hastaneler ve eczaneler ile sosyal devlet anlayışının en parlak örneklerinden birini sergilemiştir.',
  'İhşidiler de Mısır''da kurulmuştur ancak Tolunoğullarından sonradır (Mısır''da kurulan ikinci Türk devletidir). ''İlk Türk devleti'' ve Maristanların öncüsü Tolunoğulları''dır.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Mısır''da kurulan ve Hicaz bölgesine (Mekke ve Medine) egemen olan ''ilk Türk devleti'' aşağıdakilerden hangisidir?',
  '{"options": ["Tolunoğulları", "İhşidiler (Akşitler)", "Eyyubiler", "Memlükler", "Osmanlı Devleti"], "correctIndex": 1}'::jsonb,
  'Muhammed bin Toğaç tarafından 935''te kurulan İhşidiler (Akşitler), kutsal topraklar olan Hicaz bölgesine (Mekke ve Medine) hakim olan ilk Türk devletidir. Hükümdarına Abbasi halifesi tarafından ''Akşit'' (Nur yüzlü / Beyaz güneş) unvanı verilmiştir.',
  'Adaylar Hicaz hakimiyetini Yavuz Sultan Selim dönemiyle Osmanlı''ya veya Selahaddin Eyyubi''ye bağlayabilir. Kutsal topraklara hükmeden ''ilk Türk devleti'' İhşidiler''dir.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1187 yılında gerçekleştirdiği Hıttin Savaşı ile Haçlıları ağır bir hezimete uğratıp 88 yıllık Haçlı işgaline son vererek Kudüs''ü geri alan ve Mehmet Akif Ersoy tarafından ''Şark''ın en sevgili sultanı'' olarak nitelendirilen hükümdar kimdir?',
  '{"options": ["Selahaddin Eyyubi", "Sultan Baybars", "Nureddin Zengi", "Alparslan", "Kutuz"], "correctIndex": 0}'::jsonb,
  'Eyyubiler Devleti''nin kurucusu Selahaddin Eyyubi, 1187 Hıttin Savaşı ile Kudüs Krallığı''nı yıkarak Kudüs''ü Haçlılardan kurtarmış ve III. Haçlı Seferi''nin başlamasına neden olmuştur. ''Hadimü''l-Haremeyn'' unvanını kullanan ilk hükümdarlardandır.',
  'Baybars Ayn Calut zaferiyle Moğolları durduran Memlük sultanıdır; Kudüs fatihi ise Hıttin Savaşı ile Selahaddin Eyyubi''dir.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Tarihte Moğolların batıya doğru ilerleyişini ve yenilmezlik efsanesini 1260 Ayn Calut ve 1277 Elbistan savaşlarıyla sona erdiren Türk-İslam devleti aşağıdakilerden hangisidir?',
  '{"options": ["Memlükler (Devlet-i Türkiye)", "Büyük Selçuklu Devleti", "Eyyubiler", "Harzemşahlar", "Gazneliler"], "correctIndex": 0}'::jsonb,
  'Memlükler (Devlet-i Türkiye/Kölemenler), Sultan Kutuz ve Sultan Baybars komutasında İlhanlı Moğollarını 1260 Ayn Calut Savaşı''nda tarihte ilk kez mağlup ederek durdurmuştur.',
  'Harzemşahlar Moğollarla Otrar Faciası''nı yaşamış ve Moğol istilası altında ezilmiştir. Moğolları durduran ve hezimete uğratan yegane devlet Memlükler''dir.',
  44
);

-- Soru #045 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Memlük Devleti''nin diğer Türk-İslam devletlerinden ayrılan ve taht kavgalarının farklı bir yöntemle cereyan etmesine yol açan en belirgin veraset özelliği aşağıdakilerden hangisidir?',
  '{"options": ["Kut inancının tamamen terk edilerek cumhuriyet rejimine geçilmesi", "Tahta sadece hükümdarın en büyük kız çocuğunun geçebilmesi", "Saltanatın babadan oğula geçme zorunluluğunun olmaması; her başarılı emir ve komutanın tahta geçme hakkına sahip olması", "Hükümdarın Abbasi halifesi tarafından yapılan kura çekimiyle belirlenmesi", "Ülkenin dört hanedan arasında federatif kantonlara bölünmesi"], "correctIndex": 2}'::jsonb,
  'Memlüklerde ''kut'' kan bağı ile sınırlandırılmamıştır. Ordudaki her güçlü emir (komutan) sultan olma hakkına sahipti. Bu nedenle Memlükler kısa sürede en çok hükümdar değiştiren Türk devleti olmuştur.',
  'Memlüklerde saltanat veraset sistemi yoktur; ordu komutanları sultan olabilmiştir. Bu durum onları diğer tüm Türk devletlerinden ayıran temel özelliktir.',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar Devleti''nde Satuk Buğra Han İslamiyet''i kabul ettikten sonra ''Abdülkerim'' adını almış ve İslamiyet resmi devlet dini haline gelmiştir.

Karahanlıların Müslüman olmalarına rağmen Türkçeyi resmi dil ilan etmeleri ve hükümdarlarının Kadır Han, Buğra Han, Arslan Han gibi Türkçe unvanları kullanmaya devam etmeleri aşağıdakilerden hangisinin en somut kanıtıdır?',
  '{"options": ["Arap kültürünü tamamen benimsediklerinin", "Milli benliklerini ve Türk kültür kimliğini titizlikle koruduklarının", "İslamiyet''i zorla yaymak istediklerinin", "Yöneticileri ile halkı arasında derin bir uçurum oluştuğunun", "Gök Tanrı inancının prensiplerini İslamiyet''in üzerinde tuttuklarının"], "correctIndex": 1}'::jsonb,
  'Karahanlılar halkı, yöneticileri ve coğrafyası tamamen Türk olan bir devletti. Bu sebeple İslam dinine girmelerine rağmen Türkçeyi resmi dil yapmış, Uygur alfabesini kullanmış ve Türk kültürünü yaşatmışlardır.',
  'Gazneliler veya Selçuklular gibi Farsça ve Arapçanın etkisinde kalmamışlar; Karahanlılar milli kimliklerini en saf haliyle sürdürmüşlerdir.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Gazneli Mahmut, Abbasi halifesini Şii Büveyhoğulları''nın baskısından kurtarması üzerine halife tarafından ödüllendirilmiştir.

Abbasi Halifesi el-Kadir Billah tarafından Gazneli Mahmut''a verilen ve Türk tarihinde ilk kez bir Türk hükümdarı tarafından kullanılan unvan aşağıdakilerden hangisidir?',
  '{"options": ["Sultan", "Kağan", "Padişah", "Halife", "Şah"], "correctIndex": 0}'::jsonb,
  'Gazneli Mahmut, İslam dünyasına hizmetleri ve halifeyi koruması karşılığında halifeden ''Sultan'' unvanını alan ilk Türk hükümdarıdır.',
  'Tuğrul Bey''e halife tarafından ''Doğunun ve Batının Sultanı'' denmiştir; ancak genel anlamda ''Sultan'' unvanını ilk kullanan hükümdar Gazneli Mahmut''tur.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Gazneli Devleti''nin en parlak hükümdarı olan Gazneli Mahmut, Hindistan üzerine 17 büyük sefer düzenleyerek İslamiyet''in Hint alt kıtasında yayılmasını sağlamış ve bölgedeki katı ''Kast Sistemi''ne büyük darbe vurmuştur.

Gazneli Mahmut''un Hindistan''daki ünlü Şiva Tapınağı''nı ele geçirerek putları yıktığı ve ''Put Kırıcı'' unvanını aldığı en meşhur 16. seferi aşağıdakilerden hangisidir?',
  '{"options": ["Somnat Seferi", "Gucerat Seferi", "Pencap Seferi", "Multan Seferi", "Delhi Seferi"], "correctIndex": 0}'::jsonb,
  'Gazneli Mahmut 1025 yılında düzenlediği Somnat Seferi ile devasa Somnat Tapınağı''nı fethetmiş, putları imha etmiş ve İslam dünyasında büyük bir manevi itibar kazanarak ''Put Kırıcı'' lakabıyla anılmıştır.',
  'Somnat Seferi ÖSYM''nin Gazneli Mahmut sorularında doğrudan tapınak ismi ve sefer numarasıyla sorguladığı en meşhur seferdir.',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar döneminde ticaret yolları üzerinde yolcuların, tüccarların ve kervanların güvenliğini ve iaşesini sağlamak amacıyla inşa edilen, ilk dönemlerde askeri sınır karakolu iken sonradan kervansaraylara dönüşen yapılara ne ad verilirdi?',
  '{"options": ["Ribat", "Kümbet", "Külliye", "İmaret", "Bedesten"], "correctIndex": 0}'::jsonb,
  'Ribat, Karahanlılar tarafından geliştirilen sınır güvenliği ve ticaret konaklama merkezleridir (kervansarayların atasıdır). İçinde ahırlar, odalar, mescit ve muhafız birlikleri bulunurdu.',
  'Bedesten kapalı çarşıdır; İmaret aşevidir. Ticari ve askeri konaklama yeri Ribat''tır.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti ile Gazneliler arasında 1040 yılında meydana gelen, Gaznelilerin dağılma sürecine girmesine yol açarken Selçukluların resmen kurulmasını ve bağımsız devlet haline gelmesini sağlayan tarihi meydan savaşı aşağıdakilerden hangisidir?',
  '{"options": ["Dandanakan Savaşı", "Pasinler Savaşı", "Malazgirt Savaşı", "Nesa Savaşı", "Serahs Savaşı"], "correctIndex": 0}'::jsonb,
  '1040 Dandanakan Savaşı''nda Tuğrul ve Çağrı Beyler, Gazneli Sultan Mesut''un fillerle takviyeli ordusunu hezimete uğratmıştır. Bu zaferle Büyük Selçuklu Devleti resmen kurulmuş, Tuğrul Bey adına hutbe okutup para bastırmıştır.',
  'Nesa ve Serahs öncü savaşlardır; kuruluşu resmileştiren ve Gaznelileri yıkan ana meydan savaşı Dandanakan''dır.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti ile Bizans ve Gürcü kuvvetleri arasında 1048 yılında meydana gelen ve Türklerin Bizans imparatorluk ordusuna karşı kazandığı ''ilk büyük zafer'' kabul edilen muharebe aşağıdakilerden hangisidir?',
  '{"options": ["Pasinler Savaşı", "Malazgirt Savaşı", "Miryokefalon Savaşı", "Katvan Savaşı", "Yassıçemen Savaşı"], "correctIndex": 0}'::jsonb,
  '1048 Pasinler (Hasankale) Savaşı, Büyük Selçuklu Devleti ile Bizans İmparatorluğu arasındaki ilk büyük meydan savaşıdır. Gürcü Kralı Liparit esir alınmış ve Anadolu kapıları Türklere aralanmıştır.',
  'Malazgirt kapıları tamamen açan savaştır; Bizans ile yapılan İLK savaş ise Erzurum yakınlarındaki Pasinler Savaşı''dır.',
  51
);

-- Soru #052 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1055 yılında Bağdat''a girerek Şii Büveyhoğulları Devleti''ne son veren ve Abbasi halifesini esaretten kurtaran Tuğrul Bey''e halife el-Kaim bi-Emrillah tarafından takdim edilen tarihi unvan aşağıdakilerden hangisidir?',
  '{"options": ["Doğunun ve Batının Sultanı (Sultan-ı Mağrib ve Maşrık)", "Kudüs Fatihi", "Riyazü''s-Saltana", "Hadimü''l-Haremeyn", "Müdafi-i İslam"], "correctIndex": 0}'::jsonb,
  'Tuğrul Bey 1055 Bağdat Seferi ile hilafeti kurtarınca halife ona altın kılıçlar kuşatmış ve ''Doğunun ve Batının Hükümdarı'' unvanını vermiştir. Böylece siyasi liderlik tamamen Türklere geçmiş, halife sadece dini lider olarak kalmıştır.',
  'Adaylar Alparslan''a verilen ''Ebu''l-Feth'' unvanı ile karıştırabilir. Tuğrul Bey''in meşhur unvanı ''Doğunun ve Batının Sultanı''dır.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Sultan Alparslan, 1064 yılında Hristiyan dünyasının aşılmaz kabul ettiği muhkem Ani Kalesi''ni ve Kars''ı fethederek büyük bir askeri başarı kazanmıştır.

Bu fetih üzerine Abbasi halifesi tarafından Sultan Alparslan''a verilen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Ebu''l-Feth (Fetihlerin Babası)", "Gazi", "Seyfüddin", "İskender-i Sani", "Sultan-ı Azam"], "correctIndex": 0}'::jsonb,
  'Ani Kalesi''nin fethi İslam dünyasında büyük yankı uyandırmış ve halife Sultan Alparslan''a ''Ebu''l-Feth'' (Fetihlerin Babası) unvanını tevcih etmiştir.',
  'Sultan Alparslan''a Malazgirt''ten önce, Ani Kalesi''nin fethi sebebiyle ''Ebu''l-Feth'' unvanı verilmiştir.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '26 Ağustos 1071 Cuma günü Malazgirt Ovası''nda Bizans İmparatoru Romen Diyojen''i mağlup eden Sultan Alparslan, savaştan sonra komutanlarına ''Toprak fethedenin malıdır'' buyruğunu vermiştir.

Sultan Alparslan''ın bu fermanı vermesindeki temel amaç aşağıdakilerden hangisidir?',
  '{"options": ["Merkezi otoriteyi derhal Şam''a taşımak", "Komutanları teşvik ederek Anadolu''nun fethini ve Türkleşmesini hızlandırmak", "Bizans ile yeni bir ticaret antlaşması yapmak", "Haçlı Seferleri''ni diplomatik yollarla engellemek", "İkta sistemini tamamen yürürlükten kaldırmak"], "correctIndex": 1}'::jsonb,
  '''Kılıç hakkı'' (fetheden fethettiği yerin yöneticisidir) anlayışıyla komutanlar Anadolu içlerine akınlar düzenlemiş, böylece Danişmentliler, Saltuklular, Mengücekliler, Artuklular ve Çaka Beyliği kurularak Anadolu hızla Türk yurdu haline gelmiştir.',
  'Merkezi otoriteyi zayıflatma riski taşısa da buradaki asıl stratejik amaç fethi hızlandırmaktır.',
  54
);

-- Soru #055 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Devleti''nde Sultan Melikşah ve Vezir Nizamülmülk döneminde devleti içten çökertmek amacıyla Hasan Sabbah tarafından kurulan, Alamut Kalesi merkezli haşhaş ve suikast tarikatı olan yıkıcı hareket aşağıdakilerden hangisidir?',
  '{"options": ["Batınilik (İsmailiyye Hareketi)", "Babailer Hareketi", "Karmatiler", "Şeyh Bedreddin Hareketi", "Kızılbaşlık"], "correctIndex": 0}'::jsonb,
  'Hasan Sabbah''ın kurduğu Batınilik (Haşhaşiler), fedaileri aracılığıyla Vezir Nizamülmülk dahil pek çok Selçuklu devlet adamına suikast düzenleyerek devleti içten sarsmıştır.',
  'Babailer Türkiye Selçuklu Devleti dönemindeki isyandır; Şeyh Bedreddin ise Osmanlı dönemindedir. Selçuklu''yu yıpratan Hasan Sabbah hareketi Batınilik''tir.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nin 1141 yılında Karahitaylar ile yaptığı ve Sultan Sencer''in mağlup olmasıyla devletin çöküş ve yıkılış sürecine girmesine yol açan muharebe aşağıdakilerden hangisidir?',
  '{"options": ["Katvan Savaşı", "Yassıçemen Savaşı", "Kösedağ Savaşı", "Dandanakan Savaşı", "Ayn Calut Savaşı"], "correctIndex": 0}'::jsonb,
  '1141 Katvan Savaşı''nda Moğol kökenli Karahitaylara yenilen Selçuklular Orta Asya hakimiyetini kaybetmiş, ardından çıkan Oğuz İsyanı ile Sultan Sencer esir düşmüş ve devlet 1157''de yıkılmıştır.',
  'Kösedağ Savaşı Türkiye (Anadolu) Selçuklu Devleti''ni yıkan savaştır; Büyük Selçuklu''yu yıkan ise Katvan Savaşı''dır.',
  56
);

-- Soru #057 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nin parçalanmasıyla ortaya çıkan ''Atabeylikler'' (hanedan hocalarının kurduğu bölgesel devletler) arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Zengiler (Musul Atabeyliği)", "İldenizoğulları (Azerbaycan Atabeyliği)", "Salgurlular (Fars Atabeyliği)", "Böfiler / Tuğtekinliler (Şam Atabeyliği)", "Danişmentliler (Sivas Atabeyliği)"], "correctIndex": 4}'::jsonb,
  'Danişmentliler bir Atabeylik değil; Malazgirt sonrası Anadolu''da kurulan I. Dönem Türk Beyliğidir. Diğerleri ise Selçuklu şehzadelerini eğiten atabeylerin kurduğu atabeyliklerdir.',
  'ÖSYM ''Atabeylikler'' (Zengiler, İldenizliler, Salgurlular, Böritiginler, Erbilliler) ile ''Anadolu Beylikleri''ni (Danişment, Saltuk vb.) birbirinin çeldiricisi olarak sıkça sorar.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nde Sultan Melikşah''ın talebi doğrultusunda matematikçi ve astronom Ömer Hayyam başkanlığındaki bir heyet tarafından sadece tarım ve mali işleri düzenlemek amacıyla güneş yılı esaslı olarak hazırlanan takvim aşağıdakilerden hangisidir?',
  '{"options": ["Celali Takvim", "Rumi Takvim", "Hicri Takvim", "On İki Hayvanlı Türk Takvimi", "Kıpti Takvimi"], "correctIndex": 0}'::jsonb,
  'Celali Takvim, Sultan Melikşah (Celaleddin Melikşah) adına Ömer Hayyam tarafından hazırlanmıştır. Güneş yılı esaslıdır ve yılbaşı Nevruz (21 Mart) günüdür.',
  'Rumi takvim Osmanlı Devleti''nde 19. yüzyılda mali işler için düzenlenmiştir; Selçuklu''daki mali takvim ise Celali Takvim''dir.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu veziri Nizamülmülk tarafından Bağdat''ta kurulan, Şii Fatımi ve Batıni propagandalarına ilmi yoldan cevap vermek, devlet memuru yetiştirmek ve bilimi geliştirmek amacıyla açılan dönemin en büyük üniversitesi niteliğindeki medrese hangisidir?',
  '{"options": ["Nizamiye Medreseleri", "Yağıbasan Medresesi", "Karatay Medresesi", "Sahn-ı Seman Medresesi", "Gök Medrese"], "correctIndex": 0}'::jsonb,
  'Nizamiye Medreseleri (1067 Bağdat), dünyanın ilk planlı üniversite kampüsü kabul edilir. Başmüderrisliğini ünlü İslam bilgini İmam Gazali yürütmüştür.',
  'Yağıbasan Medresesi Anadolu''daki ilk medresedir (Danişmentliler); Nizamiye ise Bağdat merkezli Büyük Selçuklu medresesidir.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Vezir Nizamülmülk''ün Sultan Melikşah''a sunduğu, hükümdarlara adalet, devlet yönetimi, ordu ve teşkilat konularında öğütler veren ünlü Farsça siyasetname eseri aşağıdakilerden hangisidir?',
  '{"options": ["Siyasetname", "Kutadgu Bilig", "Kabusname", "Nasihatü''l-Müluk", "Tarih-i Cihangüşa"], "correctIndex": 0}'::jsonb,
  'Nizamülmülk''ün ''Siyasetname'' eseri, Türk-İslam devlet idaresinin kurallarını, adalet divanını ve istihbarat sistemini anlatan başyapıttır.',
  'Kutadgu Bilig Türkçe ve Karahanlı dönemidir; Siyasetname ise Farsça olup Nizamülmülk tarafından Büyük Selçuklu''da kaleme alınmıştır.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1071 Malazgirt Zaferi''nden sonra Anadolu''da kurulan ''ilk Türk beyliği'' olan, Erzurum merkezli kurularak Mama Hatun Türbesi ve Üç Kümbetler gibi eşsiz eserler bırakan beylik aşağıdakilerden hangisidir?',
  '{"options": ["Saltuklular", "Danişmentliler", "Mengücekliler", "Artuklular", "Çaka Beyliği"], "correctIndex": 0}'::jsonb,
  'Ebu''l-Kasım Saltuk Bey tarafından Erzurum ve civarında kurulan Saltuklular, Malazgirt sonrası Anadolu''da kurulan ilk Türk beyliğidir.',
  'Danişmentliler en güçlüsüdür, ancak ''ilk kurulan'' beylik Saltuklular''dır.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Anadolu''da kurulan I. Dönem Türk beyliklerinden Danişmentliler tarafından Tokat Niksar''da inşa edilen ve Anadolu''daki ''ilk Türk medresesi'' kabul edilen tarihi yapı aşağıdakilerden hangisidir?',
  '{"options": ["Yağıbasan Medresesi", "Karatay Medresesi", "İnce Minareli Medrese", "Çifte Minareli Medrese", "Caca Bey Medresesi"], "correctIndex": 0}'::jsonb,
  'Danişmentli Yağıbasan tarafından Tokat Niksar''da 1157 yılında yaptırılan Yağıbasan Medresesi (Çukur Medrese), Anadolu topraklarındaki ilk medrese olma özelliğine sahiptir.',
  'Caca Bey Medresesi Kırşehir''deki rasathanedir; Karatay Konya''dadır. Anadolu''daki ilk medrese Yağıbasan''dır.',
  62
);

-- Soru #063 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'UNESCO Dünya Miras Listesi''nde yer alan, Mengücekliler döneminde 1228 yılında inşa edilen ve taş işçiliğindeki muazzam geometrik kabartmaları sebebiyle ''Anadolu''nun Elhamrası'' olarak anılan Divriği Ulu Camii ve Darüşşifası hangi ilimizde bulunmaktadır?',
  '{"options": ["Sivas", "Erzurum", "Erzincan", "Kayseri", "Tokat"], "correctIndex": 0}'::jsonb,
  'Divriği Ulu Camii ve Darüşşifası Sivas''ın Divriği ilçesinde Mengücekli hükümdarı Ahmet Şah ve eşi Turan Melek tarafından yaptırılmıştır.',
  'Mengücekliler Erzincan merkezli kurulduğu için şehrin Erzincan olduğu sanılabilir; Divriği ilçesi Sivas sınırları içerisindedir.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1081 yılında İzmir''de bir donanma kurarak ilk Türk amirali unvanını alan ve Türk Deniz Kuvvetleri''nin kuruluş yılı olarak kabul edilen tarihin sahibi Türk beyi kimdir?',
  '{"options": ["Çaka Bey", "Karamürsel Alp", "Umur Bey", "Barbaros Hayrettin Paşa", "Piri Reis"], "correctIndex": 0}'::jsonb,
  'Çaka Bey, 1081 yılında İzmir''de ilk Türk donanmasını inşa etmiş, Midilli, Sakız, Sisam adalarını fethetmiştir. 1081 yılı Türk Deniz Kuvvetleri''nin kuruluş yılı kabul edilir.',
  'Karamürsel Alp Osmanlı''nın ilk kaptan-ı deryasıdır; ilk Türk amirali ve denizcisi ise Çaka Bey''dir.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Türkiye Selçuklu Devleti ile Bizans arasında 1176 yılında meydana gelen ve II. Kılıç Arslan''ın zaferiyle sonuçlanan Miryokefalon Savaşı''nın Türk ve dünya tarihi açısından en kritik sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu''nun tapusunun kesin olarak Türklerin eline geçmesi ve Bizans''ın Türkleri Anadolu''dan atma umudunun tamamen sona ermesi", "İstanbul''un Türkler tarafından fethedilmesi", "Bizans İmparatorluğu''nun resmen tarihten silinmesi", "Haçlı Seferleri''nin sona ermesi", "Anadolu Türk siyasi birliğinin kesin olarak sağlanması"], "correctIndex": 0}'::jsonb,
  'Miryokefalon Zaferi ile Anadolu''nun kesin bir Türk yurdu olduğu tescillenmiş; Batılı kaynaklar bu savaştan sonra Anadolu için ''Turchia'' (Türkiye) adını kullanmaya başlamıştır.',
  'Pasinler keşif, Malazgirt kapı açan, Miryokefalon ise tapuyu alan (yurt tutan) savaştır.',
  65
);

-- Soru #066 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Türkiye Selçuklu Devleti''nde uluslararası ticareti geliştirmek amacıyla uygulanan tedbirler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Dünyada ilk kez devlet destekli ''Mala Zarar Sigortası'' sisteminin uygulanması", "Kervansaraylarda yerli ve yabancı tüccarların 3 gün boyunca ücretsiz konaklatılması ve tedavi edilmesi", "Sinop, Alanya (Alaiye) ve Antalya gibi liman şehirlerinin fethedilerek deniz ticaret üsleri yapılması", "Venedik ve Cenevizli tüccarlara düşük gümrük tarifesi uygulanması", "Tüm yabancı tüccarların mallarına el konularak zorunlu müsadere uygulanması"], "correctIndex": 4}'::jsonb,
  'Selçuklular yabancı tüccarın malına el koymak bir yana, haydutların yağmaladığı malları hazineden karşılayan dünyadaki ilk ''sigortacılık'' sistemini uygulamışlardır.',
  'Selçuklular ticarette son derece liberal ve teşvik edici olmuşlardır. Müsadere (mala el koyma) ticareti baltalayacağı için asla uygulanmamıştır.',
  66
);

-- Soru #067 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1230 yılında Türkiye Selçuklu Sultanı I. Alâeddin Keykubad ile Harzemşahlar hükümdarı Celaleddin Harzemşah arasında meydana gelen ve Harzemşahların yıkılış sürecine girmesine yol açan Yassıçemen Savaşı''nın Türkiye Selçukluları açısından en olumsuz jeopolitik sonucu ne olmuştur?',
  '{"options": ["Anadolu ile Moğollar arasındaki tampon bölgenin ortadan kalkması ve Anadolu''nun doğrudan Moğol istilasına açık hale gelmesi", "Bizans''ın Konya''yı işgal etmesi", "Haçlıların Akdeniz kıyılarını tamamen ele geçirmesi", "İkta sisteminin çökmesi", "Karamanoğulları Beyliği''nin bağımsızlığını ilan etmesi"], "correctIndex": 0}'::jsonb,
  'Harzemşahların yıkılmasıyla Selçuklu ile Moğol İlhanlılar arasındaki tampon bölge yok olmuş, nitekim 1243''te Moğollar Kösedağ Savaşı ile Anadolu''yu istila etmiştir.',
  'Yassıçemen Savaşı askeri bir zaferdir ancak jeopolitik bir felakettir; tampon bölgeyi yok etmiştir.',
  67
);

-- Soru #068 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  '1240 yılında Türkiye Selçuklu Devleti''nde II. Gıyaseddin Keyhüsrev döneminde Adıyaman ve Güneydoğu Anadolu''da patlak veren, Türk tarihindeki ilk sosyo-dini nitelikli halk isyanı kabul edilen hareket aşağıdakilerden hangisidir?',
  '{"options": ["Baba İshak (Babailer) İsyanı", "Şeyh Bedreddin İsyanı", "Celali İsyanları", "Şahkulu İsyanı", "Cimri (Siyavuş) Olayı"], "correctIndex": 0}'::jsonb,
  '1240 Baba İshak İsyanı, devletin güçlükle bastırdığı ilk dini ve sosyal ayaklanmadır. Bu isyan Selçuklu''nun zaafını Moğollara göstermiş ve Kösedağ hezimetine zemin hazırlamıştır.',
  'Şeyh Bedreddin Osmanlı dönemindeki ilk dini-sosyal isyandır. Anadolu Selçuklu''daki ilk dini-sosyal isyan ise Baba İshak (Babailer) İsyanı''dır.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1277 yılında Konya''yı ele geçirerek ''Bugünden sonra divanda, dergahta, bargahta, mecliste ve meydanda Türkçeden başka dil kullanılmaya!'' fermanını yayınlayan ve Türkçeyi resmi dil ilan eden beylik ve lideri aşağıdakilerden hangisidir?',
  '{"options": ["Karamanoğulları - Karamanoğlu Mehmet Bey", "Germiyanoğulları - Yakup Bey", "Karesioğulları - Karesi Bey", "Candaroğulları - İsfendiyar Bey", "Aydınoğulları - Umur Bey"], "correctIndex": 0}'::jsonb,
  'Karamanoğlu Mehmet Bey, 13 Mayıs 1277 tarihinde yayınladığı tarihi fermanla Farsçanın yerine Türkçeyi devlet dili yapmıştır.',
  'Her yıl 13 Mayıs Türk Dil Bayramı olarak kutlanır. Bu ferman Karamanoğlu Mehmet Bey''e aittir.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Kırşehir''de Ahi Evran tarafından temelleri atılan, esnaf ve zanaatkarlar arasında dayanışmayı, mesleki ahlakı ve çırak-kalfa-usta hiyerarşisini kuran esnaf teşkilatına ve Ahi Evran''ın eşi Fatma Bacı tarafından kurulan dünyanın ilk kadın sivil toplum örgütüne verilen isimler hangisinde doğru verilmiştir?',
  '{"options": ["Ahilik Teşkilatı - Bacıyan-ı Rum", "Lonca - Gaziyan-ı Rum", "Fütüvvet - Abdalan-ı Rum", "Gedik - Ahiyan-ı Rum", "Kapan - Bacıyan-ı Rum"], "correctIndex": 0}'::jsonb,
  'Ahilik esnaf teşkilatıdır. Ahi Evran''ın eşi Fatma Bacı (Fatma Hatun) tarafından kurulan kadın koluna ise ''Bacıyan-ı Rum'' (Anadolu Bacıları) denir.',
  'Bacıyan-ı Rum dünyadaki ilk kadın teşkilatıdır. Gaziyan-ı Rum alpler, Abdalan-ı Rum ise dervişlerdir.',
  70
);

-- Soru #071 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Devleti''nde ve Türkiye Selçuklularında devlet işlerinin görüşüldüğü Divan-ı Saltanat''a bağlı alt divanlar ile görevleri eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Divan-ı İnşa (Tuğra) - Devletin iç ve dış yazışmalarını yürüten divan", "Divan-ı İstifa - Devletin mali işlerine ve bütçesine bakan divan (Başkanı: Müstevfi)", "Divan-ı İşraf - Devletin idari ve mali işlerini denetleyen teftiş divanı (Başkanı: Müşrif)", "Divan-ı Arz - Ordunun maaş, levazım ve teçhizat işlerine bakan divan (Başkanı: Emir-i Arz)", "Divan-ı Mezalim - Sadece esnaf arasındaki fiyat ve kalite ihtilaflarını çözen zabıta divanı"], "correctIndex": 4}'::jsonb,
  'Divan-ı Mezalim zabıta mahkemesi değildir; bizzat sultanın başkanlık ettiği, ağır siyasi suçların, devlet memurlarının yolsuzluklarının ve adaletsizliklerin karara bağlandığı ''Yüksek Yargı / Temyiz Mahkemesi''dir.',
  'Esnaf işlerine bakan görevli ''Muhtesip''tir. Divan-ı Mezalim ise en üst düzey devlet mahkemesidir.',
  71
);

-- Soru #072 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Türk-İslam devletlerinde hukuk ''Şeri Hukuk'' ve ''Örfi Hukuk'' olmak üzere iki ana koldan yürütülmüştür.

Buna göre şeri davalara bakan hakimlerin başı olan ''Kadi''l-Kudat'' ile örfi yargının başı olan görevli aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Kadi''l-Kudat - Emir-i Dad", "Kadi''l-Kudat - Müstevfi", "Emir-i Dad - Muhtesip", "Müşrif - Hacibü''l-Hüccab", "Kadi''l-Asker - Subaşı"], "correctIndex": 0}'::jsonb,
  'Şeri mahkemelerin en üst yetkilisi ''Kadi''l-Kudat'' (Baş Kadı); örfi hukukun başı ve adalet bakanı niteliğindeki görevli ise ''Emir-i Dad''dır.',
  'Emir-i Dad örfi adaletin başıdır; vezir veya sultan dahil herkesi tebaaya zulmettiğinde yargılama yetkisi vardır.',
  72
);

-- Soru #073 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu ve Anadolu Selçuklu devletlerinde geliri devlet memurlarına ve ordu komutanlarına hizmet karşılığı bırakılan, maaş yerine verilen ve karşılığında devlete ''Cebelü'' adı verilen atlı asker yetiştirilen toprak sistemi aşağıdakilerden hangisidir?',
  '{"options": ["İkta Sistemi", "Mülk Toprak", "Vakıf Toprak", "Yurtluk Toprak", "Ocaklık Toprak"], "correctIndex": 0}'::jsonb,
  'İkta sistemi (Osmanlı''daki Tımar sistemi), hazineden para harcamadan daimi bir atlı ordu (cebelü) beslenmesini, üretimin denetlenmesini ve taşrada asayişin sağlanmasını temin eden mükemmel bir toprak düzenidir.',
  'İkta arazisi satılamaz, devredilemez, miras bırakılamaz; mülkiyeti devlete aittir. Memur sadece vergisini toplar.',
  73
);

-- Soru #074 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Türkiye Selçuklu Devleti''nde hükümdar çocuklarına ''Melik'' adı verilirdi. Melikleri eyaletlerde devlet tecrübesi kazanmaları için eğiten tecrübeli hocalara ve devlet adamlarına ne ad verilirdi?',
  '{"options": ["Atabey", "Lala", "İnal", "Subaşı", "Müstevfi"], "correctIndex": 0}'::jsonb,
  'Selçuklularda hükümdar çocuğuna ''Melik'', hocasına ''Atabey'' denirdi. (İslam öncesi İnal/Ataman, Osmanlı''da ise Lala).',
  'Osmanlı''daki Lala ile Selçuklu''daki Atabey unvanları ÖSYM tarafından birbirine alternatif olarak test edilir.',
  74
);

-- Soru #075 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Avrupa''da ''Alpharabius'' olarak bilinen, Aristo felsefesini İslam dünyasında yeniden canlandırdığı için ''Muallim-i Sani'' (İkinci Öğretmen) unvanıyla anılan ve Birleşmiş Milletler fikrine benzeyen ''İdeal Devlet'' (El-Medinetü''l-Fazıla) eserini yazan Türk-İslam filozofu kimdir?',
  '{"options": ["Farabi", "İbn-i Sina", "İbn-i Rüşt", "Gazali", "Harezmi"], "correctIndex": 0}'::jsonb,
  'Farabi, Aristo''dan sonra ''İkinci Öğretmen'' unvanını almıştır. Kitabü''l-Musiki eseriyle müziği notaya dökmüş, kanun çalgısını geliştirmiş ve Medinetü''l-Fazıla''yı yazmıştır.',
  'İbn-i Sina ''Avicenna'' ve Tıbbın Hükümdarıdır; Muallim-i Sani ise Farabi''dir.',
  75
);

-- Soru #076 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Batı dünyasında ''Avicenna'' olarak tanınan, yazdığı ''El-Kanun fi''t-Tıbb'' (Tıbbın Kanunu) adlı eseri yüzyıllarca Avrupa üniversitelerinde temel tıp ders kitabı olarak okutulan büyük hekim ve filozof kimdir?',
  '{"options": ["İbn-i Sina", "Farabi", "Razi", "Akşemseddin", "İbn-i Heysem"], "correctIndex": 0}'::jsonb,
  'İbn-i Sina tıp sahasındaki devasa birikimiyle ''Şeyhü''r-Reis'' ve ''Avicenna'' olarak bilinir. El-Kanun fi''t-Tıbb eseri modern tıbbın öncüsüdür.',
  'Razi çiçek ve kızamık hastalığını ayıran hekimdir; El-Kanun''un yazarı ise İbn-i Sina''dır.',
  76
);

-- Soru #077 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Gazneli Mahmut''un sarayında ağırladığı ve kendisi için ''Sarayımın en değerli hazinesidir'' dediği; trigonometri, enlem-boylam hesaplamaları ve Dünya''nın yarıçapını gerçeğe çok yakın hesaplayan ''El-Asarü''l-Bakiye'' eserinin sahibi bilim insanı kimdir?',
  '{"options": ["Biruni", "Harezmi", "Uluğ Bey", "Ali Kuşçu", "Ömer Hayyam"], "correctIndex": 0}'::jsonb,
  'Biruni (973-1048), Gazneli Mahmut''un himayesinde yaşamış, yerçekiminden enlem-boylama kadar yüzlerce keşif yapmış ve Sultan Mahmut tarafından ''Sarayımın en değerli hazinesi'' olarak onurlandırılmıştır.',
  'Harezmi ''Cebir''in kurucusudur (sıfır rakamı). Gazneli Mahmut''un hazinem dediği deha ise Biruni''dir.',
  77
);

-- Soru #078 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Sıfır (0) rakamını ilk kez matematiksel işlemlerde kullanan, ''El-Kitabü''l-Muhtasar fi Hisabi''l-Cebr ve''l-Mukabele'' adlı eseriyle ''Cebir'' biliminin kurucusu kabul edilen Türk-İslam bilgini aşağıdakilerden hangisidir?',
  '{"options": ["Harezmi", "Biruni", "Farabi", "Ömer Hayyam", "Ali Kuşçu"], "correctIndex": 0}'::jsonb,
  'Harezmi sıfır rakamını ve algoritma (ismini Harezmi''den alır) kavramını matematiğe kazandıran büyük cebir dâhisidir.',
  'Algoritma terimi Harezmi''nin Batı dillerindeki söylenişinden türemiştir.',
  78
);

-- Soru #079 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Selçuklularda sarayın genel düzenini sağlayan, hükümdar ile halk ve hükümdar ile diğer devlet görevlileri arasındaki iletişimi düzenleyen en üst düzey saray görevlisine ne ad verilirdi?',
  '{"options": ["Hacibü''l-Hüccab (Ulu Hacip)", "Candar", "Silahtar", "Çaşnigir", "Abdar"], "correctIndex": 0}'::jsonb,
  'Hacip, hükümdarın özel yardımcısı ve teşrifatçısıdır. En kıdemlisine ''Hacibü''l-Hüccab'' veya ''Ulu Hacip'' denirdi. Kutadgu Bilig''de iyi bir hacibin nitelikleri genişçe anlatılır.',
  'Candar saray muhafızı, Çaşnigir yemek tadıcısıdır. Saray protokol şefi ise Hacip''tir.',
  79
);

-- Soru #080 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Türk-İslam mimarisinde hükümdar, hanedan üyeleri veya dönemin önde gelen devlet adamları için inşa edilen, alt katı cenazelik (kripta), üst katı ise kubbe veya külahla örtülü anıt mezar yapılarına ne ad verilir?',
  '{"options": ["Kümbet", "Türbe", "Külliye", "Kurgan", "Zaviye"], "correctIndex": 0}'::jsonb,
  'Kümbet, Türklerin çadır mimarisini (otağ) taşa yansıtarak geliştirdikleri konik/piramidal külahlı anıt mezar tipidir. Silindirik veya sekizgen gövdelidir (Ahlat mezar taşları, Döner Kümbet vb.).',
  'Kurgan İslamiyet öncesi toprak mezardır; Kümbet ise çadırdan esinlenilmiş taştan Türk-İslam anıt mezarıdır.',
  80
);


-- -------------------------------------------------------------
-- OSMANLI KÜLTÜR VE UYGARLIĞI (120 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde padişahın mutlak yasama ve yargılama yetkileri doğrultusunda yayımladığı çeşitli hukuki belgeler bulunmaktadır.

Padişahın haksız kazanç elde eden veya vefat eden devlet memurlarının mallarına devlet adına el koyması uygulamasını ifade eden ve Osmanlı''da özel mülkiyet ile miras hakkının gelişmesini uzun süre engelleyen hukuk kavramı aşağıdakilerden hangisidir?',
  '{"options": ["Adaletname", "Müsadere", "Amanname", "Beratname", "Hatt-ı Hümayun"], "correctIndex": 1}'::jsonb,
  'Müsadere, haksız kazanç sağlayan veya vefat eden devlet ricalinin mallarına devlet tarafından el konulması sistemidir. Fatih Sultan Mehmet döneminde Çandarlı Halil Paşa''ya uygulanarak kurumsallaşmıştır. II. Mahmut döneminde büyük ölçüde kaldırılmış, 1839 Tanzimat Fermanı ile tamamen son bulmuş ve özel mülkiyet anayasal güvenceye kavuşmuştur.',
  'ÖSYM Beratname (memur atama ve maaş bağlama belgesi) ile Müsadereyi sıklıkla çeldirici yapar. Müsadere doğrudan mülkiyete el koyma ve padişahın yargı yetkisinin bir tezahürüdür.',
  1
);

-- Soru #002 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde tahta çıkan padişahlar için Eyüp Sultan Türbesi''nde Şeyhülislam veya Nakibü''l-Eşraf tarafından kılıç kuşanma töreni (Kılıç Alayı) icra edilir ve çeşitli hükümdarlık sembolleri kullanılırdı.

Aşağıdakilerden hangisi Osmanlı Devleti''nde hükümdarlık sembolleri (alametleri) arasında yer almaz?',
  '{"options": ["Tuğ ve Sancak", "Nevbet (Bando / Davul)", "Hutbe okutmak ve Sikke bastırmak", "Otağ-ı Hümayun", "Ok"], "correctIndex": 4}'::jsonb,
  'İslamiyet öncesinde olduğu gibi Osmanlı Devleti''nde de "Yay" hâkimiyet ve hükümdarlık sembolüdür; ancak "Ok" kesinlikle bir hükümdarlık alameti değildir. Ok, hükümdara boyun eğmeyi, itaati ve halkın bağlılığını temsil eder. Osmanlı tuğralarında ve damgalarında da yay hâkimiyet simgesi olarak kalmıştır.',
  'ÖSYM soru bankalarının 1 numaralı tuzağıdır: Hükümdarlık sembolleri sayılırken "Ok ve Yay" bir arada düşünüldüğü için adaylar "Ok" seçeneğini hükümdarlık alameti zanneder. Yay emreden, ok emre boyun eğendir.',
  2
);

-- Soru #003 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı padişahları Bey, Gazi, Han, Hakan, Padişah ve Hüdavendigar gibi pek çok unvan kullanmışlardır.

MEB müfredatı ve tarihsel kaynaklara göre Osmanlı Devleti tarihinde ilk kez "Sultan" unvanını kullanan padişah ve kullandığı tam unvan aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["I. Murat – Sultanü''l-Azam", "Orhan Bey – Sultanü''l-Guzât (Gaziler Sultanı)", "Osman Bey – Fahrüddin", "Fatih Sultan Mehmet – Sultanü''l-Bahreyn", "Yıldırım Bayezid – Sultan-ı İklim-i Rum"], "correctIndex": 1}'::jsonb,
  '2015 MEB müfredat güncellemesi ve dönemin sikkeleri/kitabeleri doğrultusunda Osmanlı''da ilk kez ''Sultan'' unvanını kullanan padişah Orhan Bey''dir ve unvanı "Sultanü''l-Guzât" (Gazilerin Sultanı)dır. Yıldırım Bayezid ise Niğbolu Zaferi sonrasında halifeden "Sultan-ı İklim-i Rum" unvanını almıştır.',
  'Eski ders kitaplarında ilk sultan unvanı I. Murat olarak geçtiği için birçok aday doğrudan A şıkkına yönelir. Güncel akademik kaynaklarda ve KPSS''de ilk sultan unvanını kullanan Orhan Bey''dir.',
  3
);

-- Soru #004 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde taht kavgalarını önlemek ve merkezi otoriteyi en üst seviyede tutmak amacıyla kuruluş ve yükselme dönemlerinde veraset sisteminde köklü değişiklikler yapılmıştır.

Buna göre, Osmanlı veraset sistemiyle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Osman Bey $ → $ Ülke hükümdar ve ailesinin ortak malıdır.", "I. Murat $ → $ Ülke padişah ve oğullarınındır anlayışı getirilmiştir.", "Fatih Sultan Mehmet $ → $ ''Ülke padişahındır'' ilkesi benimsenmiş ve kardeş katli yasalaşmıştır.", "I. Ahmet $ → $ Hanedanın en yaşlı ve en olgun erkeğinin tahta geçmesini öngören ''Ekber ve Erşed'' sistemi getirilmiştir.", "II. Mahmut $ → $ Padişahın halk oyuyla seçilmesini sağlayan meşruti seçim sistemine geçilmiştir."], "correctIndex": 4}'::jsonb,
  'II. Mahmut döneminde padişahın seçimle belirlenmesi gibi bir uygulama asla olmamıştır; monarşik veraset devam etmiştir. Osmanlı tarihinde verasetteki son kurumsal değişiklik I. Ahmet döneminde getirilen "Ekber ve Erşed" (en yaşlı ve aklı başında üye) sistemidir.',
  'ÖSYM I. Murat (padişah ve oğulları) ile Fatih (sadece padişahındır) ayrımını sıkça sorar. Her iki değişiklik de merkezi otoriteyi kademeli olarak tek elde toplamak için yapılmıştır.',
  4
);

-- Soru #005 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı şehzadeleri 7 yaşına geldiklerinde Harem''deki Şehzadegan Mektebi''nde "Bedi Besmele" töreniyle ilk derslerini alırlar; 12 yaşına geldiklerinde ise devlet tecrübesi kazanmaları amacıyla lalaları eşliğinde çeşitli şehzade sancaklarına vali olarak gönderilirlerdi.

Aşağıdakilerden hangisi Osmanlı Devleti''nde şehzadelerin gönderildiği sancak merkezleri arasında yer almaz?',
  '{"options": ["Manisa", "Amasya", "Kefe (Kırım)", "Trabzon", "Şam"], "correctIndex": 4}'::jsonb,
  'Şehzadeler güvenlik ve merkeziyetçilik gereği Anadolu''da yer alan sancaklara gönderilirdi. Anadolu dışındaki tek istisnai şehzade sancağı Kırım''daki Kefe sancağıdır (Yavuz Sultan Selim burada bulunmuştur). Şam, Kahire veya Bağdat gibi uzak Arap eyaletlerine hiçbir zaman şehzade gönderilmemiştir.',
  'ÖSYM "Anadolu dışındaki tek şehzade sancağı neresidir?" sorusunu Kefe üzerinden sorar. Şam veya Halep gibi büyük merkezlerin sancak olduğu sanılsa da buralar şehzade sancağı yapılmamıştır.',
  5
);

-- Soru #006 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin başkenti İstanbul''un yönetimi ve güvenliği imparatorluğun diğer eyaletlerinden tamamen farklı özel bir statüye tabi tutulmuştur.

Buna göre, İstanbul''un en yüksek mülki amiri ve başkentteki adalet işlerinden sorumlu en üst düzey yetkili aşağıdakilerden hangisidir?',
  '{"options": ["Şehremini", "Sadrazam", "Taht Kadısı (İstanbul Kadısı)", "Yeniçeri Ağası", "Subaşı"], "correctIndex": 2}'::jsonb,
  'İstanbul''un en yüksek mülki ve adli amiri doğrudan padişah tarafından atanan Taht Kadısı (İstanbul Kadısı)''dır. Protokolde vezirlerle eşit statüdedir. Şehremini ise belediye ve bayındırlık işlerine bakan görevlidir.',
  'Adaylar genel yönetici olan Sadrazam''a veya belediye başkanı olan Şehremini''ye gidebilir. İstanbul''un hem mülki hem adli en üst amiri Taht Kadısı''dır.',
  6
);

-- Soru #007 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Topkapı Sarayı idari ve fonksiyonel açıdan Birun, Enderun ve Harem olmak üzere üç ana kısımdan oluşmaktadır.

Hristiyan tebaadan devşirilen yetenekli çocukların saray terbiyesiyle eğitilerek sadrazam, vezir, beylerbeyi, hattat ve şair gibi üst düzey yönetici ve sanatkârların yetiştirildiği; II. Mahmut döneminde önemini kaybetmesiyle yerine "Mekteb-i Maarif-i Adliye"nin açıldığı saray bölümü aşağıdakilerden hangisidir?',
  '{"options": ["Birun", "Enderun", "Harem-i Hümayun", "Darüssaade", "Babüssaade"], "correctIndex": 1}'::jsonb,
  'Enderun (İç Saray), ilk kez I. Murat döneminde Edirne Sarayı''nda temelleri atılan, Fatih döneminde Topkapı Sarayı''nda kurumsallaşan elit devlet adamı yetiştirme mektebidir. Buraya Müslüman Türk ailelerin ve Yahudilerin çocukları alınmaz, devşirmeler alınırdı.',
  'Adaylar Birun (dış saray - elçilerin kabul edildiği, divanın toplandığı yer) ile Enderun''u karıştırabilir. Enderun doğrudan bir "yönetici okulu"dur.',
  7
);

-- Soru #008 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı mimarisinde saray yapıları dönemlerin siyasi ve kültürel özelliklerini yansıtır.

Ağrı''nın Doğubeyazıt ilçesinde bulunan; yapımında Selçuklu, Osmanlı ve Barok mimari üsluplarının harmanlandığı ve dünya mimarlık tarihinde ilk kez merkezi ısıtma (kalorifer/sıcak su kanalları) sisteminin uygulandığı 18. yüzyıl saray külliyesi aşağıdakilerden hangisidir?',
  '{"options": ["Topkapı Sarayı", "İshak Paşa Sarayı", "Dolmabahçe Sarayı", "Yıldız Sarayı", "Beylerbeyi Sarayı"], "correctIndex": 1}'::jsonb,
  'İshak Paşa Sarayı (Ağrı-Doğubeyazıt), Osmanlı Devleti''nin Lale Devri sonrasındaki batılılaşma etkilerini yansıtan, merkezi ısıtma teşkilatına sahip dünyadaki ilk saray örneğidir. UNESCO Dünya Mirası Geçici Listesi''ndedir.',
  'Adaylar Dolmabahçe Sarayı''nı (tamamen batı tarzı) işaretleyebilir. Dünyada ilk ısıtma sistemine sahip saray Doğu Anadolu''daki İshak Paşa Sarayı''dır.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Orhan Bey döneminde temelleri atılan ve II. Mahmut döneminde kaldırılarak yerine "Heyet-i Vükela" (Bakanlar Kurulu) kurulan Divan-ı Hümayun''da alınan kararlar "hüküm" adını alırdı.

Divan-ı Hümayun kararlarının, fermanların ve padişah emirlerinin günü gününe kaydedildiği; Osmanlı devlet teşkilatının hafızası niteliğindeki en temel arşiv defterlerine ne ad verilirdi?',
  '{"options": ["Tahrir Defterleri", "Mühimme Defterleri", "Tereke Defterleri", "Ruznamçe Defterleri", "Esame Defterleri"], "correctIndex": 1}'::jsonb,
  'Divan-ı Hümayun''da görüşülen siyasi, askeri, mali ve toplumsal kararlar Beylikçi Kalemi tarafından Mühimme Defterlerine kaydedilirdi. Tahrir vergi-nüfus sayımı, Tereke miras, Ruznamçe kazaskerin günlük mahkeme kayıtları, Esame ise yeniçeri maaş kütüğüdür.',
  'ÖSYM Tahrir Defteri (Nişancının fethettiği yerlerin vergi ve toprak kaydı) ile Mühimme Defteri''ni (Divan kararları) sürekli karşılaştırır.',
  9
);

-- Soru #010 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Divan-ı Hümayun üyeleri Seyfiye, İlmiye ve Kalemiye olmak üzere üç ana bürokratik sınıftan oluşurdu.

Seyfiye (ehl-i seyf / kılıç ehli) sınıfı askerî ve idari yönetimi temsil etmekteydi. Buna göre, aşağıdakilerden hangisi Divan-ı Hümayun''da Seyfiye sınıfına mensup bir üye değildir?',
  '{"options": ["Sadrazam (Veziriazam)", "Kubbealtı Vezirleri", "Kaptan-ı Derya", "Yeniçeri Ağası", "Kazasker"], "correctIndex": 4}'::jsonb,
  'Kazasker, eğitim, din ve adalet bürokrasisini temsil eden İlmiye (Ulema) sınıfının üyesidir; Seyfiye değildir. Sadrazam, vezirler, donanma komutanı Kaptan-ı Derya ve Yeniçeri Ağası ise Seyfiye (askeri-idari) sınıfına mensuptur.',
  'Adaylar Kazasker kelimesindeki "asker" hecesinden dolayı onu Seyfiye (askeri sınıf) zanneder. Oysa Kazasker günümüzün Milli Eğitim ve Adalet Bakanı''dır ve medrese çıkışlı ilmiye sınıfındandır.',
  10
);

-- Soru #011 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Divan-ı Hümayun üyesi olan Kazaskerlik makamı ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["İmparatorluk sınırlarının genişlemesiyle Rumeli ve Anadolu Kazaskeri olmak üzere sayıları ikiye çıkarılmıştır.", "Divandaki en yüksek temyiz hâkimidir; kadı kararlarına yapılan itirazları sonuçlandırır ve verdiği karar bozulamaz.", "Ülkedeki kadıların ve medreselerdeki müderrislerin atama, terfi ve azil işlemlerini yürütür.", "Devşirme kökenli devlet adamları arasından padişah tarafından liyakatine göre atanır.", "Tuttuğu günlük mahkeme ve tayin dosyalarına ''Ruznamçe'' adı verilir."], "correctIndex": 3}'::jsonb,
  'İlmiye sınıfına mensup olan Kazasker ve Şeyhülislam olabilmek için kesinlikle Türk ve doğuştan Müslüman olma (ve medrese mezunu olma) şartı vardı. Devşirmeler ilmiye sınıfına (kazasker, şeyhülislam, müderris, kadı) asla giremezlerdi; devşirmeler Enderun''da yetişip Seyfiye ve Kalemiye''de görev alırlardı.',
  'ÖSYM''nin en kritik tuzaklarından biri: "Devşirmeler her makama gelebilir mi?" Sadrazam olabilirler ama asla Kazasker ve Şeyhülislam olamazlar! Doğuştan Müslüman olma şartı ilmiyenin kırmızı çizgisidir.',
  11
);

-- Soru #012 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ferman ve beratlara padişahın tuğrasını çeken, fethedilen toprakların sosyo-ekonomik tahrir kayıtlarını tutan ve örfi hukukun uzmanı kabul edilen Divan-ı Hümayun üyesi aşağıdakilerden hangisidir?',
  '{"options": ["Defterdar", "Nişancı", "Reisülküttab", "Şeyhülislam", "Kaptan-ı Derya"], "correctIndex": 1}'::jsonb,
  'Nişancı (Tevkii), ferman ve beratlara padişah tuğrasını çeker, fethedilen toprakları "Tahrir Defterleri"ne kaydeder, tımar topraklarını dağıtır ve kanunların örfi hukuka uygunluğunu denetlerdi. Kalemiye sınıfının başıdır.',
  'Adaylar tuğra çekme ve toprak kaydını Defterdar (maliye) veya Reisülküttab (dış işleri) ile karıştırabilir. Toprakların tahrir kaydı ve tuğra yetkisi münhasıran Nişancı''ya aittir.',
  12
);

-- Soru #013 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '17. yüzyıla kadar Nişancı''ya bağlı bir kâtip iken; Osmanlı Devleti''nin diplomaside savunmaya geçmesi ve yabancı devletlerle yazışmaların önem kazanması üzerine Nişancı''dan ayrılarak hariciye (dış işleri) işlerinden sorumlu bağımsız bir Divan üyesi haline gelen görevli kimdir?',
  '{"options": ["Defter emini", "Reisülküttab", "Sadaret Kethüdası", "Amedi", "Beylikçi"], "correctIndex": 1}'::jsonb,
  'Reisülküttab, 17. yüzyılda bürokrasiden ayrılarak hariciye nazırlığının (Dışişleri Bakanlığı) temeli haline gelmiştir. Divan gündemini hazırlar ve yabancı devletlerle diplomatik temasları yürütürdü. Karlofça başarısı sonrası Mehmet Rami Efendi reisülküttablıktan sadrazamlığa geçen ilk kişidir.',
  'Adaylar dış işlerinden Sadrazamın veya Nişancının sorumlu kaldığını düşünebilir. 17. yüzyıldan itibaren hariciyenin patronu Reisülküttab''dır.',
  13
);

-- Soru #014 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı klasik dönem taşra teşkilatında en büyük idari birim eyalet, en küçük birim ise köydür.

Buna göre, klasik dönem taşra idaresinde kazaları yöneten, aynı zamanda kaza merkezinde davalara bakarak adalet işlerini yürüten ve belediye hizmetlerini denetleyen görevli aşağıdakilerden hangisidir?',
  '{"options": ["Subaşı", "Beylerbeyi", "Kadı", "Sancakbeyi", "Kethüda"], "correctIndex": 2}'::jsonb,
  'Osmanlı''da kazaların hem idari yöneticisi (mülki amir) hem de mahkeme hakimi Kadı''dır. Güvenlikten ise Subaşı sorumludur. Kadıların idari yetki taşıması Osmanlı adalet mekanizmasının yerel otorite üzerindeki üstünlüğünü simgeler.',
  'Adaylar kazayı yöneten kişinin Subaşı veya Sancakbeyi olduğunu düşünebilir. Osmanlı kazalarında idare ve yargı tek elde, yani Kadı''da birleşmiştir.',
  14
);

-- Soru #015 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde merkeze uzak olan Mısır, Trablusgarp, Tunus, Cezayir, Yemen ve Habeş gibi eyaletlerde tımar sistemi uygulanmazdı. Bu eyaletlerin vergileri açık artırma yoluyla ihale edilir ve memurların maaşları doğrudan hazineden yıllık olarak ödenirdi.

Hakkında bilgi verilen bu eyalet grubu aşağıdakilerden hangisidir?',
  '{"options": ["Saliyanesiz (Yıllıksız) Eyaletler", "Saliyaneli (Yıllıklı) Eyaletler", "İmtiyazlı Eyaletler", "Yurtluk-Ocaklık Eyaletleri", "Muaf Eyaletler"], "correctIndex": 1}'::jsonb,
  'Merkeze uzak ve tımar uygulanmayan eyaletlere Saliyaneli (Yıllıklı) Eyaletler denir. Buradaki vergiler "İltizam" sistemiyle mültezimler aracılığıyla peşin toplanıp doğrudan hazineye aktarılırdı.',
  'ÖSYM saliyaneli ile saliyanesiz eyaletleri birbirinin yerine koyarak sorar. Şifre: Saliyaneli = Maaşlı/Yıllıklı = Merkeze uzak (Kuzey Afrika eyaletleri). Saliyanesiz = Tımarlı = Merkeze yakın (Anadolu ve Rumeli).',
  15
);

-- Soru #016 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde Saliyaneli eyaletlerde ve mukataa arazilerde uygulanan İltizam Sistemi ile ilgili kavramlar hakkında aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["İhaleyi kazanan vergi mültezimi $ → $ Mültezim", "İltizam hakkının mültezime ömür boyu verilmesi usulü $ → $ Malikhane", "İhaleye giriş bedeli veya peşin ödenen teminat bedeli $ → $ Muaccele", "Tanzimat sonrasında iltizam kaldırılınca vergileri toplamakla görevlendirilen memur $ → $ Muhassıl", "Vergi ihalesini kazanan kişinin devlete verdiği yıllık faizli borç $ → $ Düyun"], "correctIndex": 4}'::jsonb,
  'İltizam sisteminde devlete verilen peşin paraya borç veya faiz denmez; açık artırma bedelidir. Ömür boyu iltizama "Malikhane", peşinata "Muaccele", vergi toplayan kişiye "Mültezim", iltizam kaldırıldıktan sonra kurulan vergi memurluğuna ise "Muhassıl" denir.',
  'Ramazan Yetgin notlarında özel uyarıyla geçen "KPSS Kesin Çıkar" konusudur: Muaccele (peşinat), Malikhane (ömür boyu iltizam), Muhassıl (sistem kalkınca vergiyi toplayan memur).',
  16
);

-- Soru #017 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı taşra teşkilatında iç işlerinde serbest, dış işlerinde merkeze bağlı olan "İmtiyazlı Eyaletler" bulunmaktadır.

Bu imtiyazlı eyaletler içerisinde yöneticisine "Emir" denilen; kutsal topraklara ev sahipliği yaptığı için Osmanlı Devleti''ne ne asker ne de vergi veren, aksine her yıl merkezden "Surre Alayları" ile hediye ve para gönderilen en ayrıcalıklı eyalet aşağıdakilerden hangisidir?',
  '{"options": ["Kırım", "Eflak", "Boğdan", "Hicaz", "Erdel"], "correctIndex": 3}'::jsonb,
  'Hicaz Eyaleti (Mekke-Medine), Osmanlı''nın en imtiyazlı eyaletidir; vergi ve asker vermez, aksine her yıl hac mevsiminde padişahın Surre Alayı ile hazineden yüklü mali yardım alırdı.',
  'Kırım ile Hicaz sıkça karıştırılır: Kırım vergi vermez ama savaşa asker (süvari) gönderirdi; Hicaz ise ne vergi ne de asker verirdi.',
  17
);

-- Soru #018 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde vefat eden kişilerin geride bıraktığı menkul ve gayrimenkul malların dökümünün yapıldığı, mirasçıların haklarının şer''i ve örfi hukuka göre tespit edildiği, ayrıca çift evlilikler ve aile yapısına dair paha biçilmez demografik kayıtlar içeren defterlere ne ad verilir?',
  '{"options": ["Tahrir Defterleri", "Tereke Defterleri", "Mühimme Defterleri", "Cizye Defterleri", "Avarız Defterleri"], "correctIndex": 1}'::jsonb,
  'Kadılar tarafından tutulan Tereke Defterleri (Kassâm Defterleri), ölen kişinin geride bıraktığı tüm eşya, giysi, kitap, alacak-verecek ve mirasçıların paylarını kaydeder. Sosyal ve ekonomik tarihin birincil kaynağıdır.',
  'ÖSYM Tereke Defterleri''ni aile yapısı, miras ve sosyal tabakalaşma sorularında sıklıkla sorar. Tahrir (nüfus/toprak) ile Tereke (miras/kişisel mülk) karıştırılmamalıdır.',
  18
);

-- Soru #019 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 19. yüzyılda Tanzimat Dönemi ile birlikte hukuk alanında Batı tarzı yeni mahkemeler açılmış, ancak eski klasik mahkemeler kapatılmadığı için ülkede hukuksal bir "ikilik" doğmuştur.

Aşağıdakilerden hangisi Tanzimat öncesi var olan Klasik Dönem mahkemeleri arasında yer almaz?',
  '{"options": ["Şer''i Mahkemeler", "Cemaat Mahkemeleri", "Konsolosluk Mahkemeleri", "Nizamiye Mahkemeleri", "Kadı Mahkemeleri"], "correctIndex": 3}'::jsonb,
  'Nizamiye Mahkemeleri, Tanzimat Dönemi''nde (1868) ceza ve ticaret davalarına bakmak üzere Fransız usulüyle kurulan, Müslüman ve gayrimüslim üyelerden oluşan Batı tarzı karma mahkemedir. Şer''i, Cemaat ve Konsolosluk mahkemeleri ise klasik dönem mahkemeleridir.',
  'Konsolosluk mahkemeleri kapitülasyonlarla (1535 Fransa) klasik dönemde kurulmuştur. Nizamiyeler ise Tanzimat yeniliğidir.',
  19
);

-- Soru #020 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde toplum ırk, dil veya soy esasına göre değil; mensup olunan din ve mezhep aidiyetine göre örgütlenmiştir. Müslümanlar hâkim unsur (millet-i hâkime) kabul edilirken, gayrimüslimler Ortodoks, Ermeni ve Musevi cemaatleri şeklinde kendi dini liderlerinin idaresine bırakılmıştır.

Osmanlı toplum yapısını şekillendiren bu geleneksel yönetim modeline ne ad verilir?',
  '{"options": ["Gulam Sistemi", "Millet Sistemi", "İstimalet Politikası", "İskân Politikası", "Devşirme Sistemi"], "correctIndex": 1}'::jsonb,
  'Osmanlı toplumundaki bu din merkezli tasnife Millet Sistemi denir. Millet sistemi ulusçuluk/milliyetçilik değil, inanç birliği esasına dayanır.',
  'Adaylar "Millet" kelimesini günümüzdeki Türk, Arap, Rum gibi etnik ulus kavramıyla karıştırabilir. Osmanlı''da millet kavramı doğrudan dini topluluğu (İslam milleti, Ortodoks milleti vb.) ifade eder.',
  20
);

-- Soru #021 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde kamu hizmetlerinin, bayındırlık işlerinin ve sosyal yardımlaşmanın finansmanı büyük ölçüde vakıf sistemiyle karşılanırdı.

Deprem, yangın, sel gibi doğal afetlerde hasar gören cami ve köprülerin onarılması, savaş zamanı ordunun acil ihtiyaçlarının karşılanması ve olağanüstü durumlarda vergisini ödeyemeyen yoksul köylüye kredi verilmesi amacıyla kurulan özel vakıf türü aşağıdakilerden hangisidir?',
  '{"options": ["Mülk Vakfı", "Avarız Vakfı", "Zürri Vakıf", "Darüşşafaka Vakfı", "Gureba Vakfı"], "correctIndex": 1}'::jsonb,
  'Avarız, olağanüstü durum anlamına gelir. Mahalle ve köylerde olağanüstü zamanlarda ortaya çıkan acil harcamaları, afet zararlarını ve fakirlerin vergilerini karşılamak üzere kurulan sandıklara Avarız Vakfı / Avarız Sandığı denirdi.',
  'Avarız kelimesi sınavda genellikle "olağanüstü hal vergisi" olarak bilinir. Ramazan Yetgin notlarında vurgulanan Avarız Vakfı ise bu olağanüstü durumlara müdahale eden özel vakıf yapısıdır.',
  21
);

-- Soru #022 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde II. Abdülhamit döneminde açılan ve Osmanlı tarihindeki ilk çocuk hastanesi olma özelliğini taşıyan sağlık kurumu aşağıdakilerden hangisidir?',
  '{"options": ["Darülaceze", "Hamidiye Etfal Hastanesi", "Vakıf Gureba Hastanesi", "Haseki Hastanesi", "Cerrahpaşa Hastanesi"], "correctIndex": 1}'::jsonb,
  '1899 yılında II. Abdülhamit tarafından kızı Hatice Sultan''ın vefatı üzerine kurulan Hamidiye Etfal Hastanesi (Şişli Etfal), Osmanlı''nın ilk modern ihtisas çocuk hastanesidir.',
  'Darülaceze (düşkünler/huzurevi) ile Hamidiye Etfal (çocuk hastanesi) II. Abdülhamit''in en meşhur iki kurumudur. "İlk çocuk hastanesi" sorulduğunda cevap Hamidiye Etfal''dir.',
  22
);

-- Soru #023 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı toprak sisteminde mülkiyeti devlete ait olan "Mîrî Arazi" statü ve gelir tahsisine göre çeşitli kısımlara ayrılmıştır.

Buna göre, geliri doğrudan devlet hazinesine aktarılan ve üzerinde İltizam Sistemi uygulanan mîrî arazi türü aşağıdakilerden hangisidir?',
  '{"options": ["Paşmaklık", "Mukataa", "Malikhane", "Yurtluk", "Ocaklık"], "correctIndex": 1}'::jsonb,
  'Geliri doğrudan merkezi hazineye (Hazine-i Amire) giden topraklara Mukataa denir. İltizam sistemi mukataa arazilerde uygulanır.',
  'ÖSYM Mîrî arazi türlerini eşleştirme olarak çok sever: Paşmaklık = Hükümdar kadınlarına; Ocaklık = Tersane ve kale muhafızlarına; Yurtluk = Sınır boylarına; Mukataa = Doğrudan hazineye.',
  23
);

-- Soru #024 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Dirlik (Tımar) sisteminde topraklar gelirlerine göre Has, Zeamet ve Tımar olmak üzere üç kategoriye ayrılmıştır.

Buna göre, yıllık geliri 20.000 ile 100.000 akçe arasında olan ve kadı, müderris, subaşı gibi orta dereceli devlet memurlarına tahsis edilen dirlik arazisi aşağıdakilerden hangisidir?',
  '{"options": ["Has", "Zeamet", "Tımar", "Paşmaklık", "Yurtluk"], "correctIndex": 1}'::jsonb,
  'Geliri 20.000 - 100.000 akçe arası olan topraklar Zeamettir ve orta düzey bürokratlara verilir. 100.000''den fazlası Has (padişah ve divan üyelerine), 3.000 - 20.000 arası ise Tımar''dır (askerlere/küçük memurlara).',
  'Adaylar Has ile Zeamet''in gelir limitlerini karıştırabilir. 100 bin üstü Has, 20-100 bin arası Zeamet, 20 bin altı Tımar''dır.',
  24
);

-- Soru #025 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '17. yüzyıldan itibaren Osmanlı Tımar Sistemi''nin bozulmasıyla birlikte ordunun atlı sipahi gücü azalmış, devlet savaşlarda tüfek kullanan piyade ihtiyacını karşılamak amacıyla Anadolu gençlerinden ücretli askerler toplamaya başlamıştır.

Tımar sisteminin çöküşüyle orduda istihdam edilen, barış zamanlarında ise işsiz kalarak Anadolu''da Celali isyanlarına karışan bu ücretli asker zümresine ne ad verilirdi?',
  '{"options": ["Cebelü", "Sekban ve Saruca", "Bostancı", "Müsellem", "Humbaracı"], "correctIndex": 1}'::jsonb,
  'Tımar sistemi bozulunca devletin topladığı tüfekli geçici ücretli askerlere Sekban ve Saruca denirdi. Bu birlikler terhis edilince köylere eşkıya olarak musallat olmuş ve Celali isyanlarının vurucu gücüne dönüşmüştür.',
  'Cebelü tımarlı sipahinin beslemek zorunda olduğu atlı askerdir (sistem sağlıklıyken). Sistemin bozulmasıyla ortaya çıkan ücretli tüfekli birlikler Sekban ve Saruca''dır.',
  25
);

-- Soru #026 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Kapıkulu Piyadeleri içerisinde yer alan Acemi Ocağı''ndaki devşirme askerlerin eğitimlerini tamamlayarak Yeniçeri Ocağı veya diğer saray birliklerine atanması işlemine ne ad verilirdi?',
  '{"options": ["Cerre Çıkmak", "Kapıya Çıkma (Bedergâh)", "Gülbank", "Cülus", "Esame"], "correctIndex": 1}'::jsonb,
  'Acemi Ocağı''ndan yeniçeri veya süvari birliklerine geçişe Kapıya Çıkma veya Bedergâh denir. Cerre çıkmak ise medrese öğrencilerinin yaz tatilinde köylere vaaz ve staja gitmesidir.',
  'ÖSYM "Kapıya Çıkma" (askeri terim) ile "Cerre Çıkma" (eğitim terimi) kavramlarını sıklıkla seçeneklerde karşılaştırarak adayları eler.',
  26
);

-- Soru #027 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Kapıkulu Süvarileri (Altı Bölük Halkı) savaş sırasında merkezde padişahın ve ordunun en stratejik unsurlarını korumakla görevli seçkin atlı birliklerdir.

Buna göre, savaş meydanında saltanat sancağını korumakla görevli olan birlik aşağıdakilerden hangisidir?',
  '{"options": ["Sipahiler", "Silahtarlar", "Sağ ve Sol Ulufeciler", "Sağ ve Sol Garipler", "Tımarlı Sipahiler"], "correctIndex": 2}'::jsonb,
  'Sağ ve Sol Ulufeciler padişahın saltanat sancağını korur. Sipah ve Silahtarlar padişahın bizzat çadırını, Sağ ve Sol Garipler ise devlet hazinesini ve ordu ağırlıklarını korur.',
  'Şifreleme kuralı: "Garipler fakirdir, hazineyi korur." "Ulufeciler sancağı korur." "Sipah-Silahtar çadırı korur."',
  27
);

-- Soru #028 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı ordu teşkilatında savaş sırasında ordunun en önünde yer alan, düşman saflarını yararak ilk hücumu gerçekleştiren ve tamamen bekar Türk gençlerinden oluşturulan hafif piyade birliği aşağıdakilerden hangisidir?',
  '{"options": ["Deliler", "Azaplar", "Akıncılar", "Sakalar", "Beşliler"], "correctIndex": 1}'::jsonb,
  'Azaplar, bekar Türk erkeklerinden toplanan, ordunun ön saflarında savaşan hafif piyadelerdir (Azap kelimesi bekar anlamına gelir). Deliler ise süvaridir ve cesaretleriyle ünlüdür.',
  'ÖSYM Azaplar (bekar erkek piyade) ile Deliler (şok süvari) kavramlarını çok sık karşılaştırır.',
  28
);

-- Soru #029 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı donanması tarih boyunca dört büyük baskın sonucunda yakılarak ağır kayıplara uğramıştır.

Aşağıdakilerden hangisi Osmanlı donanmasının tarihte yakıldığı yerlerden biri değildir?',
  '{"options": ["İnebahtı (1571)", "Çeşme (1770)", "Navarin (1827)", "Preveze (1538)", "Sinop (1853)"], "correctIndex": 3}'::jsonb,
  'Preveze (1538), Barbaros Hayrettin Paşa komutasındaki Osmanlı donanmasının Haçlı donanmasını bozguna uğrattığı şanlı bir deniz zaferidir (Donanma Günü). Osmanlı donanmasının yakıldığı yerler ise İnebahtı (1571), Çeşme (1770), Navarin (1827) ve Sinop''tur (1853) [Şifre: İÇNES / İÇNEBİ].',
  'Adaylar tüm deniz savaşlarını felaket gibi algılayabilir; Preveze ve Cerbe büyük zaferlerdir, yakılma olayları değildir.',
  29
);

-- Soru #030 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Orhan Bey döneminde İznik''te açılan ilk Osmanlı medresesi "İznik Orhaniyesi"ne başmüderris (rektör) olarak atanan ilk Osmanlı müderrisi aşağıdakilerden hangisidir?',
  '{"options": ["Dursun Fakih", "Davud-ı Kayserî", "Molla Fenari", "Kadızade-i Rumi", "Akşemseddin"], "correctIndex": 1}'::jsonb,
  'Osmanlı Devleti''nin ilk medresesi İznik Orhaniyesi''dir ve bu medreseye atanan ilk müderris Davud-ı Kayserî''dir. İlk kadı ise Osman Bey döneminde Karacahisar''a atanan Dursun Fakih''tir.',
  'ÖSYM İlk Kadı (Dursun Fakih) ile İlk Müderris''i (Davud-ı Kayserî) sürekli çeldirici olarak birbirinin yanına koyar.',
  30
);

-- Soru #031 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı medreselerinde öğretim süresi 4 yıldı. Medreseye ilk başlayan öğrenciye "Softa (Suhte)", bir yıl sonra bilgili öğrenciye "Danişmend", mezun olup stajyer öğretmen olanlara "Muid" denirdi.

Muidlikten sonra müderrislik yapabilmek için atama sırası bekleyen aday öğretmenlere ne ad verilirdi?',
  '{"options": ["Muid", "Mülazım", "Müderris", "Muid-i Sani", "Müsteşar"], "correctIndex": 1}'::jsonb,
  'Medrese mezunu olup atama sırası bekleyen adaya Mülazım, bu bekleme sürecine ise Mülazemet Sistemi denirdi (Mülazemet süresi ortalama 21 gün ile birkaç ay arası değişirdi).',
  'Adaylar Muid (yeni mezun stajyer) ile Mülazım (atama bekleyen öğretmen) terimlerini karıştırır.',
  31
);

-- Soru #032 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet döneminde İstanbul''un fethinden sonra açılan, günümüzün ilahiyat ve yüksek İslam enstitüleri düzeyinde kabul edilen ve öğrenci yetiştirmek amacıyla Tetimme Medreseleri ile desteklenen ünlü Osmanlı yükseköğretim kurumu hangisidir?',
  '{"options": ["İznik Medresesi", "Sahn-ı Seman Medreseleri", "Süleymaniye Medreseleri", "Yağıbasan Medresesi", "Nizamiye Medresesi"], "correctIndex": 1}'::jsonb,
  'Fatih Sultan Mehmet tarafından Fatih Camii etrafında sekiz medrese olarak kurulan Sahn-ı Seman Medreseleri, dönemin en üst düzey üniversitesidir. Hazırlık ve lise kademesini Tetimme Medreseleri oluşturmuştur.',
  'Sahn-ı Seman Fatih dönemindedir; Süleymaniye Medreseleri ise Kanuni döneminde fen ve tıp alanında ihtisaslaşmıştır.',
  32
);

-- Soru #033 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı iktisadi anlayışında piyasada tüketicinin ihtiyacı olan malların mümkün olduğunca bol, kaliteli ve ucuz fiyata bulundurulması ilkesine ne ad verilir?',
  '{"options": ["Fiskalizm", "Gelenekçilik", "İaşecilik (Provizyonizm)", "Merkantilizm", "Liberalizm"], "correctIndex": 2}'::jsonb,
  'İaşecilik (Provizyonizm), piyasada tüketim mallarının bol, kaliteli ve ucuz bulundurulması prensibidir. Fiskalizm hazine gelirlerini maksimize etme, Gelenekçilik ise mevcut üretim kotalarını ve dengeleri koruma anlayışıdır.',
  'ÖSYM bu üç iktisat kavramını (İaşecilik, Fiskalizm, Gelenekçilik) doğrudan tanımlarını vererek sorar. "Bol ve ucuz mal bulundurma" her zaman İaşeciliktir.',
  33
);

-- Soru #034 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı esnaf teşkilatı olan Loncaların, Selçuklulardaki Ahilik teşkilatından ayrılan en belirgin iki temel farkı aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Loncaya gayrimüslim esnafın da üye olabilmesi ve lonca üyelerinin savaşa/cihada katılmaması", "Loncalarda narh sisteminin uygulanmaması ve usta-çırak eğitiminin verilmemesi", "Ahilikte esnaf sandığı bulunurken loncalarda orta sandığının tamamen kaldırılması", "Loncaların yalnızca saraya mal üretmesi ve halka satış yapamaması", "Ahilikte gayrimüslimlerin başkan olabilmesi"], "correctIndex": 0}'::jsonb,
  'Ahilik dini temelli bir Müslüman esnaf teşkilatıdır ve gaza faaliyetlerine katılır. Loncalar ise dini değil mesleki teşkilattır; bünyesine gayrimüslim esnaf da girebilir ve esnaf doğrudan savaşa çağrılmaz.',
  'ÖSYM''nin standart karşılaştırma sorusudur: Lonca = Gayrimüslim üye var + Cihat yok. Ahi = Sadece Müslüman + Gazaya destek var.',
  34
);

-- Soru #035 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde paranın değerinin korunması ve tedavüldeki para türleri ile ilgili;
I. Osman Bey döneminde ilk bakır para, Orhan Bey döneminde ise ilk gümüş para (akçe) basılmıştır.
II. Fatih Sultan Mehmet döneminde devletin ekonomik gücünün bir simgesi olarak ilk altın para (Sikke-i Hasene / Sultanî) bastırılmıştır.
III. Sultan Abdülmecit döneminde ilk kağıt para olan "Kaime" tedavüle sürülmüştür.
IV. Tedavüldeki madeni paraların içerisindeki değerli maden oranının düşürülerek paranın değer kaybettirilmesi işlemine "Tağşiş" denir.

yargılarından hangileri doğrudur?',
  '{"options": ["I ve II", "I, II ve III", "II, III ve IV", "I, III ve IV", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'Verilen dört öncül de Osmanlı para tarihine ait temel KPSS kazanımlarıdır (Bakır: Osman, Gümüş: Orhan, Altın: Fatih, Kağıt: Abdülmecit; Tağşiş: Paranın değerini düşürme).',
  'Adaylar Tağşiş kavramını Narh veya Müsadere ile karıştırabilir. Tağşiş doğrudan devalüasyon / paranın maden oranını kırpmadır.',
  35
);

-- Soru #036 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '1863 yılında Mithat Paşa''nın gayretleriyle köylüye ve çiftçiye tefeciler karşısında ucuz faizli kredi sağlamak amacıyla kurulan ve 1888 yılında Ziraat Bankası''na dönüştürülen tarihi iktisadi kurum aşağıdakilerden hangisidir?',
  '{"options": ["Bank-ı Dersaadet", "Bank-ı Osmanî-i Şahane", "Memleket Sandıkları", "İtibar-ı Millî Bankası", "Emlak ve Eytam Bankası"], "correctIndex": 2}'::jsonb,
  'Ziraat Bankası''nın temeli Mithat Paşa tarafından Niş valiliği sırasında kurulan Memleket Sandıkları (ve daha sonra Menafi Sandıkları)na dayanır. 1888''de resmi olarak Ziraat Bankası adını almıştır.',
  'ÖSYM Ziraat Bankası''nın kökenini (Memleket Sandıkları - Mithat Paşa) ve Atatürk döneminde değil Osmanlı döneminde kurulduğu bilgisini çok sık sorar.',
  36
);

-- Soru #037 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde toprağın mazeretsiz olarak üst üste üç yıl ekilmeyip boş bırakılması durumunda üretimin aksamasını önlemek amacıyla köylüden tahsil edilen ceza vergisi aşağıdakilerden hangisidir?',
  '{"options": ["Çifthane Vergisi", "Çiftbozan Vergisi", "Avarız Vergisi", "İhtisap Vergisi", "Bac Vergisi"], "correctIndex": 1}'::jsonb,
  'Çiftbozan vergisi, toprağını mazeretsiz üç yıl terk eden veya ekmeyen köylüden alınan üretim güvenliği cezasıdır. Çifthane ise bir çift öküzle işlenebilen araziden alınan normal vergidir.',
  'Adaylar Çifthane ile Çiftbozan''ı karıştırır: Çifthane arazinin normal vergisi, Çiftbozan ise toprağı ekmeyene kesilen cezadır.',
  37
);

-- Soru #038 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Fatih Sultan Mehmet döneminde yaşayan; "Kitabü''l-Cerrahiyyeti''l-Haniyye" adlı ilk Türkçe resimli cerrahi eserini yazan ve hayvanlar üzerinde deneyler yaparak deneysel farmakolojinin öncüsü kabul edilen ünlü Osmanlı cerrahı kimdir?',
  '{"options": ["Akşemseddin", "Altuncuzade", "Sabuncuoğlu Şerafeddin", "Ayaşlı Şifai", "Mustafa Behçet Efendi"], "correctIndex": 2}'::jsonb,
  'Sabuncuoğlu Şerafeddin, Amasya Darüşşifası''nda çalışmış, cerrahi aletlerin resimlerini bizzat çizdiği Cerrahiyetü''l-Haniyye ve Mücerrebname eserlerini yazmış Osmanlı cerrahisidir.',
  'Akşemseddin mikropla, Altuncuzade idrar yolları/bevliye ile uğraşmıştır. İlk resimli cerrahi kitabı yazan cerrah ise Sabuncuoğlu Şerafeddin''dir.',
  38
);

-- Soru #039 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Avrupa''da "Hacı Kalfa" veya "Hacı Halife" olarak tanınan; 15 bine yakın kitap ve 10 bin müellifi tanıttığı ünlü bibliyografik eseri "Keşfü''z-Zunûn" ile ilk Türkçe dünya coğrafyası eseri olan "Cihannüma"yı kaleme alan 17. yüzyıl Osmanlı bilgini kimdir?',
  '{"options": ["Evliya Çelebi", "Kâtip Çelebi", "Koçi Bey", "Naima", "Ahmet Cevdet Paşa"], "correctIndex": 1}'::jsonb,
  'Kâtip Çelebi, 17. yüzyılın en büyük bibliyograf ve coğrafyacısıdır. Keşfü''z-Zunûn (Şüphelerin Aydınlanması) ve Cihannüma başyapıtlarıdır.',
  'Evliya Çelebi (Seyahatname) ile Kâtip Çelebi (Cihannüma/Keşfü''z-Zunûn) sürekli karşılaştırılır. Hacı Kalfa unvanı doğrudan Kâtip Çelebi''ye aittir.',
  39
);

-- Soru #040 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı sanat ve musiki hayatı ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Şeyh Hamdullah $ → $ Hat sanatında çığır açmış, ''Hattatların Kıblesi'' (Kıbletü''l-Hattatîn) lakabıyla anılmıştır.", "Levni $ → $ Lale Devri''nin ünlü nakkaşı olup minyatür sanatının en büyük ustalarındandır.", "Itrî (Buhurizade Mustafa) $ → $ Klasik Türk musikisinin dehası olup Segâh Tekbiri ve Salât-ı Ümmiye''nin bestecisidir.", "Osman Hamdi Bey $ → $ Sanayi-i Nefise Mektebi''ni kurmuş ve ünlü ''Kaplumbağa Terbiyecisi'' tablosunu yapmıştır.", "Ahmet Karahisari $ → $ Osmanlı Devleti''nde heykelini yaptıran ilk ve tek Osmanlı padişahıdır."], "correctIndex": 4}'::jsonb,
  'Ahmet Karahisari bir padişah değil, Süleymaniye Camii''nin yazılarını yazan ünlü bir hattattır. Osmanlı Devleti''nde kendi heykelini yaptıran ilk ve tek padişah ise Sultan Abdülaziz''dir.',
  'ÖSYM sanatçıların alanlarını ve lakaplarını sorar: Şeyh Hamdullah = Hattatların Kıblesi; Itrî = Segâh Tekbiri / 100 TL arkası; Sultan Abdülaziz = Heykel yaptıran tek padişah.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde merkezi otoriteyi güçlendirmek ve taht kavgalarını önlemek amacıyla veraset sisteminde dönem dönem köklü değişiklikler yapılmıştır.

Buna göre, ''Ülke hükümdar ve oğullarının malıdır'' kuralını getirerek hanedanın diğer üyelerinin (amca, kardeş çocukları vb.) tahta ortak olmasını ilk kez engelleyen Osmanlı padişahı aşağıdakilerden hangisidir?',
  '{"options": ["Osman Bey", "I. Murat", "Fatih Sultan Mehmet", "I. Ahmet", "II. Mahmut"], "correctIndex": 1}'::jsonb,
  'Osman Gazi döneminde ''Ülke hanedanın ortak malıdır'' kuralı geçerli iken; I. Murat taht kavgalarını azaltmak ve merkezi otoriteyi pekiştirmek için ''Ülke hükümdar ve oğullarınındır'' anlayışını getirmiştir.',
  'Fatih Sultan Mehmet ''Ülke padişahın malıdır'' ve Kardeş Katli kanununu getirmiştir; I. Ahmet ise ''Ekber ve Erşed'' sistemini getirmiştir. ''Hükümdar ve oğulları'' kuralı I. Murat''a aittir.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'I. Ahmet döneminde getirilen ve hanedanın en yaşlı ve en olgun üyesinin tahta geçmesini öngören ''Ekber ve Erşed'' sisteminin Osmanlı devlet idaresindeki en olumsuz sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Taht kavgalarını tamamen artırması", "Şehzadelerin sancağa çıkma usulünün kaldırılarak ''Kafes Usulü''ne geçilmesi ve yönetim tecrübesinden yoksun padişahların tahta çıkması", "Divan-ı Hümayun''un yetkilerinin sınırlandırılması", "Yeniçeri Ocağı''nın kaldırılması", "Veraset sisteminin belirsiz hale gelmesi"], "correctIndex": 1}'::jsonb,
  'Ekber ve Erşed sistemi taht kavgalarını hukuken sona erdirmiş ancak şehzadelerin sancağa gönderilmeyip sarayda kafes hayatı yaşamasına yol açmıştır. Bu durum halkı ve orduyu tanımayan, psikolojisi bozuk ve tecrübesiz hükümdarların tahta çıkmasına sebep olmuştur.',
  'Ekber ve Erşed taht kavgalarını artırmamış, aksine tahta kimin geçeceğini kesinleştirerek taht kavgalarını BİTİRMİŞTİR. Olumsuz yönü şehzadelerin tecrübesiz kalmasıdır.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde şehzadelerin sancaklara yönetici olarak gönderildiği dönemde, onları devlet yönetimi, askerlik ve teşkilat konularında yetiştiren tecrübeli devlet adamlarına ne ad verilirdi?',
  '{"options": ["Lala", "Atabey", "İnal", "Subaşı", "Kadı"], "correctIndex": 0}'::jsonb,
  'Osmanlı''da şehzade eğitmenine ''Lala'' denirdi. Şehzade tahta çıktığında lalası da genellikle vezir veya danışman olarak yüksek makamlara getirilirdi.',
  'Selçuklu''da Atabey, İslam öncesinde İnal/Ataman, Osmanlı''da ise Lala''dır.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Aşağıdaki şehirlerden hangisi Osmanlı Devleti''nde şehzadelerin sancak eğitimi aldığı ''Şehzade Sancakları'' arasında yer almaz?',
  '{"options": ["Amasya", "Manisa", "Trabzon", "Kütahya", "Diyarbakır"], "correctIndex": 4}'::jsonb,
  'Diyarbakır bir eyalet merkezidir ancak şehzade sancağı olmamıştır. Amasya, Manisa (Darü''s-Saltana), Trabzon, Kütahya, Balıkesir, Kastamonu, Kefe önemli şehzade sancaklarındandır.',
  'Amasya ve Manisa en bilinenleridir; Kefe ise Anadolu dışındaki tek şehzade sancağıdır (Kırım''da). Diyarbakır şehzade sancağı değildir.',
  44
);

-- Soru #045 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde şehzadelerin sancağa çıktığı merkezler genellikle Anadolu''da yer almıştır.

Anadolu dışında yer alan ve Kanuni Sultan Süleyman''ın da bir dönem sancak beyliği yaptığı tek Rumeli/Kırım şehzade sancağı aşağıdakilerden hangisidir?',
  '{"options": ["Kefe", "Belgrad", "Selanik", "Manastır", "Üsküp"], "correctIndex": 0}'::jsonb,
  'Kırım yarımadasında bulunan ''Kefe'', Anadolu dışındaki yegane şehzade sancağıdır. Kanuni Sultan Süleyman babası Yavuz''un taht mücadelesi sırasında Kefe sancak beyliği yapmıştır.',
  'ÖSYM''nin en popüler tuzak bilgisidir: ''Anadolu dışındaki tek şehzade sancağı Kefe''dir.''',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet''in İstanbul''un fethinden sonra inşa ettirdiği ve yaklaşık 400 yıl boyunca Osmanlı Devleti''nin idare merkezi ve padişahların ikametgahı olan Topkapı Sarayı''nın bölümleri arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Birun (Dış Saray)", "Enderun (İç Saray)", "Harem", "Bab-ı Ali (Hükümet Konağı)", "Kubbealtı"], "correctIndex": 3}'::jsonb,
  'Topkapı Sarayı üç ana bölümden oluşur: Birun (dış saray), Enderun (iç saray ve mektep) ve Harem (padişahın özel aile hayatı). Bab-ı Ali ise 18. yüzyıldan itibaren sadrazam konağı (hükümet binası) olarak sarayın dışında ayrı bir binadır.',
  'Bab-ı Ali sarayın bir parçası değildir; Sadrazamın makamı ve Osmanlı hükümet merkezidir.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Topkapı Sarayı''nda devşirme kökenli yetenekli Hristiyan çocukların üstün bir eğitimden geçirilerek sadrazam, vezir, beylerbeyi ve ordu komutanı olarak yetiştirildiği saray mektebi aşağıdakilerden hangisidir?',
  '{"options": ["Enderun Mektebi", "Mekteb-i Maarif-i Adliye", "Darülfünun", "Mülkiye Mektebi", "Medrese"], "correctIndex": 0}'::jsonb,
  'II. Murat döneminde temelleri atılan ve Fatih Sultan Mehmet tarafından kurumsallaştırılan Enderun Mektebi, Osmanlı bürokrasisinin ve yönetici elitinin yetiştirildiği saray üniversitesidir.',
  'Medreselerde sadece Müslüman doğumlu öğrenciler eğitim görür ve ilmiye sınıfı (kadı, müderris) yetişir; devlet adamı ve paşa yetiştiren saray okulu ise devşirmelerin alındığı Enderun''dur.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde padişahın mutlak otoritesini ve yasama yetkisini kullandığını gösteren belgeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Ferman", "Berat", "Hatt-ı Hümayun", "Kanunname", "Fetva"], "correctIndex": 4}'::jsonb,
  'Fetva padişaha ait bir yetki belgesi değildir; Şeyhülislam veya müftüler tarafından verilen, bir işin veya kanunun İslam dinine uygun olup olmadığını belirten dini görüştür (İlmiye yetkisidir). Ferman, berat, adaletname, hatt-ı hümayun ve kanunname ise padişahın bizzat çıkardığı ferman ve yasalardır.',
  'Padişah dini fetva VEREMEZ. Şeyhülislam fetva verir, padişah ise ferman çıkarır.',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde padişahların göreve başladıklarında Eyüp Sultan Türbesi''nde şeyhülislam veya nakibüleşraf tarafından gerçekleştirilen, hükümdarın beline kılıç kuşanarak meşruiyetini tescil ettirdiği geleneksel merasime ne ad verilirdi?',
  '{"options": ["Kılıç Alayı", "Cülus Töreni", "Hırka-i Şerif Ziyareti", "Surre Alayı", "Cuma Selamlığı"], "correctIndex": 0}'::jsonb,
  'Osmanlı padişahları tahta çıktıklarında Eyüp Sultan Türbesi''ne gider ve burada ''Kılıç Alayı'' (Kılıç Kuşanma Merasimi) icra edilirdi. Bu tören Batı krallarının taç giyme töreninin Osmanlı''daki karşılığıdır.',
  'Cülus tahta çıkış anı ve bahşişin dağıtıldığı törendir; kılıcın kuşanıldığı geleneksel merasim ise Kılıç Alayı''dır.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde hükümdarın değişmesiyle birlikte yeniçerilere, kapıkulu sipahilerine ve saray görevlilerine tahta çıkış şerefine ödenen bir defalık nakit bahşişe ne ad verilirdi?',
  '{"options": ["Ulufe", "Cülus Bahşişi", "Hilat", "Avarız", "İane-i Cihadiye"], "correctIndex": 1}'::jsonb,
  'Cülus bahşişi padişah her tahta çıktığında askerlere ödenen bahşiştir. Yıldırım Bayezid döneminde gelenekleşmiş, Fatih Kanunnamesi ile yasal hale gelmiş, I. Abdülhamit döneminde ise kaldırılmıştır.',
  'Ulufe yeniçerilerin her 3 ayda bir aldıkları düzenli maaştır; Cülus ise sadece taht değiştiğinde bir defa ödenen bahşiştir.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Orhan Bey döneminde kurulan, Fatih dönemine kadar padişahın başkanlık ettiği, Fatih''ten itibaren ise sadrazamların başkanlığında toplanan en üst devlet idare ve yargı organı aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı Hümayun", "Bab-ı Ali", "Encümen-i Daniş", "Heyet-i Ayan", "Darü''ş-Şura-yı Askeri"], "correctIndex": 0}'::jsonb,
  'Divan-ı Hümayun, Osmanlı''da devlet işlerinin görüşüldüğü, aynı zamanda halkın şikayetlerinin dinlendiği en yüksek karar ve temyiz organıdır.',
  'Bab-ı Ali 18. yüzyıldan itibaren hükümet konağıdır; Divan-ı Hümayun ise kurucu divandır.',
  51
);

-- Soru #052 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet''in Divan-ı Hümayun toplantılarına bizzat başkanlık etmeyi bırakarak divan başkanlığını Sadrazama devretmesi ve görüşmeleri pencere arkasından (Kasr-ı Adil) izlemesinin temel gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Devlet işlerinden tamamen el çekmek istemesi", "Divan üyelerinin padişahın huzurunda çekinmeden fikirlerini serbestçe ifade edebilmelerini sağlamak ve sadrazamın yürütme yetkisini artırmak", "Yeniçerilerin baskısına boyun eğmesi", "Şeyhülislamın divana katılmasını engellemek", "Sadrazamlık makamını tamamen sembolik hale getirmek"], "correctIndex": 1}'::jsonb,
  'Fatih, üyelerin padişahın heybeti ve otoritesinden çekinmeden gerçek düşüncelerini tartışabilmeleri amacıyla divan başkanlığını sadrazama bırakmıştır. Padişah kubbealtındaki ''Kasr-ı Adil'' adı verilen kafesli parmaklık arkasından divanı gizlice dinlemiştir.',
  'Bu durum padişahın yetkilerini devrettiği anlamına gelmez; divan bir karar organından çok danışma kuruluna dönüşmüş, son onay yine padişahta kalmıştır.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Padişahın mutlak vekili olan, padişahın mührünü (Mühr-i Hümayun) taşıyan ve ordu başında sefere çıktığında ''Serdar-ı Ekrem'' unvanını alan Divan-ı Hümayun üyesi kimdir?',
  '{"options": ["Sadrazam (Veziriazam)", "Şeyhülislam", "Kaptanıderya", "Kazasker", "Nişancı"], "correctIndex": 0}'::jsonb,
  'Sadrazam padişahtan sonraki en yetkili kişidir. Padişah sefere çıkmadığında orduyu ''Serdar-ı Ekrem'' unvanıyla komuta eder.',
  'Vezirler sadrazamın yardımcılarıdır; mutlak vekil olan tek kişi Sadrazamdır.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Divan-ı Hümayun''da adalet ve eğitim işlerinden sorumlu olan, kadıların ve müderrislerin atama ve görevden alma işlemlerini yürüten, divandaki büyük davaları karara bağlayan görevli kimdir?',
  '{"options": ["Kazasker (Kadıasker)", "Şeyhülislam", "Nişancı", "Defterdar", "Reisülküttap"], "correctIndex": 0}'::jsonb,
  'Kazasker (Kadıasker), adalet bakanı ve milli eğitim bakanı niteliğindedir. Rumeli ve Anadolu Kazaskeri olmak üzere iki tanedir. Kıdemli olan Rumeli Kazaskeri''dir.',
  'Şeyhülislam kadı atamaz! Kadı ve müderrisleri Kazasker atar. Şeyhülislam sadece kanunların dine uygunluğu hakkında ''fetva'' verir.',
  54
);

-- Soru #055 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Divan-ı Hümayun''da padişah fermanlarına hükümdarın tuğrasını çeken, fethedilen toprakların tahrir (kayıt) defterlerini tutarak tımar arazilerinin dağıtımını kaydeden görevli aşağıdakilerden hangisidir?',
  '{"options": ["Nişancı (Tevkii)", "Defterdar", "Reisülküttap", "Kazasker", "Yeniçeri Ağası"], "correctIndex": 0}'::jsonb,
  'Nişancı, belgelere padişahın tuğrasını çeker, tahrir defterlerini tutar ve örfi hukukun uzmanıdır. Dış işlerini yürüten Reisülküttap da 17. yüzyıl sonuna kadar Nişancı''ya bağlı bir katipti.',
  'Defterdar maliye ve bütçe defterlerine bakar; Tahrir ve tapu-kadastro defterlerini tutan ve tuğra çeken ise Nişancı''dır.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 17. yüzyıl sonlarına kadar Nişancı''ya bağlı olarak çalışan, ancak devletin diplomasiye ve dış ilişkilere daha çok önem vermesiyle birlikte Divan''ın daimi üyesi ve günümüzün ''Dışişleri Bakanı'' konumuna yükselen görevli kimdir?',
  '{"options": ["Reisülküttap", "Defterdar", "Kaptanıderya", "Çavuşbaşı", "Vekayi-nüvis"], "correctIndex": 0}'::jsonb,
  'Reisülküttaplık makamı, özellikle 1699 Karlofça Antlaşması sonrasında diplomasinin önem kazanmasıyla dışişleri bakanlığına dönüşmüş ve 19. yüzyılda Hariciye Nezareti adını almıştır.',
  'Reisülküttap önceleri Nişancı''nın katibiydi; diplomasinin öne çıkmasıyla bağımsız bir makam haline gelmiştir.',
  56
);

-- Soru #057 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde yönetici zümre; Seyfiye (Kılıç Ehli / Askeri ve İdari), İlmiye (Din, Hukuk ve Eğitim) ve Kalemiye (Bürokrasi ve Maliye) olmak üzere üç sınıfa ayrılmıştır.

Buna göre aşağıdaki eşleştirmelerden hangisi ''İlmiye'' sınıfına mensuptur?',
  '{"options": ["Sadrazam - Beylerbeyi - Sancakbeyi", "Şeyhülislam - Kazasker - Kadı - Müderris", "Defterdar - Nişancı - Reisülküttap", "Yeniçeri Ağası - Subaşı - Kaptanıderya", "Tımarlı Sipahi - Silahtar - Sipahi"], "correctIndex": 1}'::jsonb,
  'İlmiye sınıfı üyeleri medrese çıkışlı ve Müslüman Türk kökenli olmak zorundadır. Şeyhülislam, Kazasker, Kadı, Müderris, Kassam, İmam ve Müftüler ilmiye sınıfındadır.',
  'Kazasker isminde ''asker'' geçmesine rağmen kesinlikle Seyfiye DEĞİLDİR; adalet ve eğitim işlerine baktığı için en yetkili İLMİYE sınıfı üyesidir.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı yönetici sınıflarından ''Seyfiye'' (Ehli Seyf) sınıfına mensup olan görevliler ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Yönetim ve askerlik işlerinden sorumludurlar.", "Sadrazam, vezirler, beylerbeyleri, sancakbeyleri ve yeniçeri ağası bu sınıftadır.", "Taşrada güvenliği sağlayan subaşılar seyfiye sınıfı içerisindedir.", "Bu sınıfa mensup olan görevlilerin tamamı medrese mezunu olmak zorundadır.", "Genellikle Enderun ve devşirme kökenli devlet adamlarından teşekkül etmiştir."], "correctIndex": 3}'::jsonb,
  'Medrese mezunu olma şartı İlmiye sınıfı için geçerlidir. Seyfiye sınıfı ise genellikle devşirme kökenli olup Acemi Ocağı ve Enderun Mektebi''nde yetişirdi.',
  'Devşirmeler Seyfiye ve Kalemiye olabilir; fakat İlmiye (kadı, şeyhülislam, müderris) asla devşirme olamaz, mutlaka doğuştan Müslüman olmak zorundadır.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Divan-ı Hümayun''da alınan kararların kaydedildiği ve kanun maddelerinin gerekçeleriyle birlikte yazıldığı resmi divan tutanak defterlerine ne ad verilirdi?',
  '{"options": ["Mühimme Defterleri", "Tahrir Defterleri", "Şeriyye Sicilleri", "Tereke Defterleri", "Salname"], "correctIndex": 0}'::jsonb,
  'Divan-ı Hümayun''da görüşülen siyasi, askeri, idari ve hukuki tüm kararlar ''Mühimme Defterleri''ne kaydedilirdi. Bu defterler günümüzde Osmanlı arşivlerinin en kıymetli belgeleridir.',
  'Şeriyye Sicilleri kadıların mahkeme kararlarıdır; Tahrir nüfus ve toprak kaydıdır; Divan kararları ise Mühimme Defteri''ne yazılır.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde sadrazam sefere çıktığında başkentin asayişini ve yönetimini sağlamak üzere İstanbul''da kalan ve sadrazama vekalet eden görevliye ne ad verilirdi?',
  '{"options": ["Sadaret Kaymakamı", "Kethüda", "Mimarbaşı", "Şehremini", "Bostancıbaşı"], "correctIndex": 0}'::jsonb,
  'Sadrazam ordu başında sefere gittiğinde yerine başkentte ''Sadaret Kaymakamı'' vekalet eder, hükümet ve başkent işlerini yürütürdü.',
  'Şehremini belediye başkanıdır; sadrazam vekili ise Sadaret Kaymakamı''dır.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Klasik Dönem Osmanlı taşra teşkilatının idari birimleri büyükten küçüğe doğru hiyerarşik olarak nasıl sıralanmıştır?',
  '{"options": ["Eyalet - Sancak - Kaza - Köy", "Eyalet - Kaza - Sancak - Köy", "Vilayet - Liva - Nahiye - Mahalle", "Sancak - Eyalet - Kaza - Köy", "Kaza - Eyalet - Sancak - Köy"], "correctIndex": 0}'::jsonb,
  'Klasik dönemde Osmanlı taşra teşkilatı hiyerarşisi: Eyalet (Beylerbeyi yönetir) -> Sancak (Sancakbeyi yönetir) -> Kaza (Kadı yönetir) -> Köy (Köy Kethüdası yönetir).',
  'Kaza sancaktan küçük, köyden büyüktür. Kazanın yöneticisi doğrudan Kadı''dır.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Klasik dönem Osmanlı taşra teşkilatında ''Kaza'' biriminin hem adli ve hukuki yargıcı hem de en üst düzey idari mülki amiri olan görevli kimdir?',
  '{"options": ["Kadı", "Subaşı", "Sancakbeyi", "Müderris", "Muhtesip"], "correctIndex": 0}'::jsonb,
  'Kazaları doğrudan ''Kadı'' yönetirdi. Kadı kazada sadece hakim değil, aynı zamanda belediye başkanı, noter ve en üst mülki idareciydi.',
  'Subaşı kazanın güvenlik komutanıdır; idari ve hukuki amiri ise bizzat Kadı''dır.',
  62
);

-- Soru #063 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde eyaletler mali yapılarına göre ''Salyaneli'' (yıllıklı) ve ''Salyanesiz'' (yıllıksız) olmak üzere ikiye ayrılmıştır.

Buna göre Tımar sisteminin UYGULANMADIĞI, vergilerin ''İltizam Sistemi'' (açık artırma yoluyla mültezimlere verilmesi) ile peşin toplandığı ve genellikle merkeze uzak Kuzey Afrika ve Arap coğrafyasındaki eyaletlere ne ad verilir?',
  '{"options": ["Salyaneli (Yıllıklı) Eyaletler", "Salyanesiz (Yıllıksız) Eyaletler", "Yurtluk-Ocaklık Eyaletleri", "İmtiyazlı Eyaletler", "Mukataa Eyaletleri"], "correctIndex": 0}'::jsonb,
  'Salyaneli (yıllıklı) eyaletler merkeze uzak olan Mısır, Trablusgarp, Tunus, Cezayir, Yemen ve Bağdat gibi eyaletlerdir. Buralarda tımar uygulanmaz; iltizam sistemiyle vergi toplanır ve yöneticilere maaş (salyane) ödenir.',
  'Tımar sisteminin uygulandığı eyaletler Salyanesiz''dir. İltizamın uygulandığı merkeze uzak eyaletler ise Salyaneli''dir.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Aşağıdaki eyaletlerden hangisi Tımar sisteminin eksiksiz uygulandığı ''Salyanesiz'' (yıllıksız) eyaletlerden biri değildir?',
  '{"options": ["Rumeli Eyaleti", "Anadolu Eyaleti", "Karaman Eyaleti", "Sivas Eyaleti", "Mısır Eyaleti"], "correctIndex": 4}'::jsonb,
  'Mısır, merkeze uzak olduğu için Salyaneli (yıllıklı / iltizamlı) bir eyalettir. Rumeli, Anadolu, Karaman ve Sivas ise merkeze yakın olup Tımar sisteminin uygulandığı Salyanesiz eyaletlerdir.',
  'Mısır Salyaneli eyaletlerin en klasik sınav örneğidir.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''ne iç işlerinde serbest, dış işlerinde bağımlı olan, yöneticileri padişah fermanıyla onaylanan, ayrıcalıklı statüye sahip eyaletlere ''İmtiyazlı Eyaletler'' denirdi.

Aşağıdaki imtiyazlı eyaletlerden hangisi ne devlete vergi öder ne de asker gönderirdi (tam muafiyet)?',
  '{"options": ["Hicaz Eyaleti", "Kırım Hanlığı", "Eflak Beyliği", "Boğdan Beyliği", "Erdel Prensliği"], "correctIndex": 0}'::jsonb,
  'Mekke ve Medine''yi kapsayan Hicaz bölgesi kutsal topraklar olduğu için Osmanlı Devleti Hicaz''dan ne asker almış ne de vergi toplamıştır; aksine her yıl Surre Alayları ile oraya para ve hediye göndermiştir.',
  'Kırım asker gönderir vergi vermezdi; Eflak ve Boğdan vergi verir asker vermezdi. Hicaz ise ne asker ne de vergi verirdi.',
  65
);

-- Soru #066 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'İmtiyazlı eyaletler içerisinde yer alan, Osmanlı ordusuna her savaşta yüz bine yakın mükemmel atlı süvari birliği gönderen ancak devlete yıllık nakit vergi ödemeyen hanlık aşağıdakilerden hangisidir?',
  '{"options": ["Kırım Hanlığı", "Hicaz Emirliği", "Eflak Beyliği", "Boğdan Beyliği", "Ramazanoğulları"], "correctIndex": 0}'::jsonb,
  'Kırım Hanlığı yöneticisi olan Giraylar, Cengiz Han soyundan geldikleri için Osmanlı protokolünde padişah ve sadrazamdan sonra gelirdi. Kırım orduya muazzam atlı süvari desteği sağlar, ancak nakit vergi ödemezdi.',
  'Kırım Hanlığı''nın askeri desteği Osmanlı''nın Doğu Avrupa fetihlerinde hayati önem taşımıştır.',
  66
);

-- Soru #067 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı taşra teşkilatında çarşı ve pazar yerlerini denetleyen, esnafın ürettiği malların kalitesini ve belirlenen azami satış fiyatı olan ''Narh'' sistemine uyup uymadığını teftiş eden görevliye ne ad verilirdi?',
  '{"options": ["Muhtesip", "Subaşı", "Kadı", "Kapan Emini", "Beytülmal Emini"], "correctIndex": 0}'::jsonb,
  'Muhtesip, günümüzdeki belediye zabıtası ve maliye denetmeni yetkilerine sahip esnaf teftiş görevlisidir. Eksik tartan, hileli mal satan veya narh fiyatını aşan esnafa ceza keserdi.',
  'Kapan Emini şehre gelen tek cins malın (un, yağ, pamuk) toptancı halindeki dağıtımını yapar; pazarı denetleyen ise Muhtesip''tir.',
  67
);

-- Soru #068 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Taşrada ve sınırlarda yer alan, gelirleri kale muhafızlarına ve tersane giderlerine tahsis edilen ''Miri'' arazi türü aşağıdakilerden hangisidir?',
  '{"options": ["Ocaklık", "Yurtluk", "Mukataa", "Paşmaklık", "Malikane"], "correctIndex": 0}'::jsonb,
  'Geliri kale muhafızlarına ve tersane giderlerine ayrılan topraklara ''Ocaklık'' denir. Geliri sınır boylarını koruyan akıncılara verilen topraklara ise ''Yurtluk'' adı verilir.',
  'Ocaklık kale/tersane için, Yurtluk sınır güvenliği içindir. Birbirinin çeldiricisi olarak çok sık kullanılır.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Gelirleri doğrudan devlet hazinesine (Hazine-i Amire) aktarılan, genellikle iltizam yoluyla mültezimlere kiralanan devlete ait verimli topraklara ne ad verilir?',
  '{"options": ["Mukataa", "Paşmaklık", "Dirlik", "Vakıf", "Haraci"], "correctIndex": 0}'::jsonb,
  'Mukataa, geliri hiçbir aracı kuruma veya memura maaş olarak bırakılmadan doğrudan nakit para olarak merkezi hazineye giren araziler ve işletmelerdir (tuzlalar, madenler, gümrükler vb.).',
  'Paşmaklık padişahın hanımları ve kızlarına ayrılan arazidir; doğrudan hazineye giren ise Mukataa''dır.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde gelirleri padişahın annesi, eşleri ve kızlarına ayrılan miri arazi çeşidi aşağıdakilerden hangisidir?',
  '{"options": ["Paşmaklık", "Malikane", "Yurtluk", "Ocaklık", "Metruk"], "correctIndex": 0}'::jsonb,
  'Paşmaklık arazilerin gelirleri saray kadınlarının (valide sultan, hasekiler ve hanım sultanlar) şahsi masraflarına tahsis edilirdi.',
  'Malikane devlete üstün hizmet gösterenlere mülk olarak verilen topraktır; saray hanımlarına ayrılan Paşmaklık''tır.',
  70
);

-- Soru #071 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde tarım arazilerinin büyük çoğunluğunu oluşturan ve mülkiyeti devlete ait olan arazilere ''Miri Arazi'' denirdi.

Miri arazi içerisinde yer alan ve gelirlerine göre ''Has'', ''Zeamet'' ve ''Tımar'' olmak üzere üç sınıfa ayrılan arazi türü aşağıdakilerden hangisidir?',
  '{"options": ["Dirlik Topraklar", "Vakıf Topraklar", "Mevat Topraklar", "Metruk Topraklar", "Mülk Topraklar"], "correctIndex": 0}'::jsonb,
  'Dirlik, devlet görevlilerine hizmet ve maaş karşılığı tahsis edilen arazidir. Yıllık geliri 100 bin akçeden fazla olanlar Has, 20 bin - 100 bin arası Zeamet, 20 bin akçeden az olanlar ise Tımar arazisidir.',
  'Dirlik ve Tımar kavramları bazen eş anlamlı gibi kullanılır; oysa Tımar, Dirlik sisteminin en küçük basamağıdır.',
  71
);

-- Soru #072 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Dirlik topraklarının yıllık gelirlerine göre ayrımı konusunda;
I. Has: Yıllık geliri 100.000 akçenin üzerinde olan, padişah, şehzadeler, sadrazam ve beylerbeylerine verilen arazilerdir.
II. Zeamet: Yıllık geliri 20.000 ile 100.000 akçe arasında olan, kadı, subaşı gibi orta kademe yöneticilere verilen arazilerdir.
III. Tımar: Yıllık geliri 20.000 akçeye kadar olan ve savaşlarda yararlılık gösteren sipahilere verilen arazilerdir.

Yukarıda verilen eşleştirmelerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç basamak ve gelir sınırları Klasik Dönem Osmanlı Dirlik sisteminin kesin ölçütleridir.',
  'Soru şıklarında Has ile Zeamet gelir sınırları yer değiştirilerek çeldirici üretilir; sıralama Has > Zeamet > Tımar şeklindedir.',
  72
);

-- Soru #073 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Tımar Sistemi''nin devlete ve ekonomiye sağladığı faydalar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Devlet hazinesinden tek kuruş çıkmadan yüz binlerce kişilik daimi atlı bir ordunun (Cebelü) savaşa hazır tutulması", "Tarımsal üretimin denetlenmesi ve toprakların peş peşe boş bırakılmasının önlenmesi", "Taşrada jandarma görevi görerek asayiş ve güvenliğin tesis edilmesi", "Vergilerin yerinde toplanarak nakliye ve tahsilat masraflarından tasarruf edilmesi", "Tımar sahiplerinin zamanla kendi özel ordularını kurarak toprağın özel mülkiyetini elde etmesi"], "correctIndex": 4}'::jsonb,
  'Tımar sisteminde toprak asla sipahinin özel mülkü olamaz. Mülkiyet devlete aittir; sipahi sadece vergi toplar. Toprağın özel mülk haline gelmesi feodalleşmedir ve Osmanlı merkezi otoritesi bunu kesinlikle yasaklamıştır.',
  'Tımar sisteminde Avrupa''daki gibi derebeylik (feodalite) YOKTUR. Toprak alınıp satılamaz, devredilemez.',
  73
);

-- Soru #074 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Müslüman çiftçilerden ürettikleri tarım ürünleri üzerinden alınan yüzde on (%10) oranındaki ayni şeri vergiye ne ad verilirdi?',
  '{"options": ["Öşür (Aşar)", "Haraç", "Cizye", "Ağnam", "Çiftbozan"], "correctIndex": 0}'::jsonb,
  'Öşür (Aşar), Müslüman reayadan alınan 1/10 oranındaki ürün vergisidir. Gayrimüslimlerden ise ürün vergisi olarak ''Haraç'' alınırdı.',
  'Müslümandan Öşür, Gayrimüslimden Haraç alınır. İkisi de ürün vergisidir.',
  74
);

-- Soru #075 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde askerlik çağına gelmiş sağlıklı gayrimüslim erkeklerden, askerlik yapmamaları ve can-mal güvenliklerinin devlet tarafından korunması karşılığında alınan şeri baş vergisi aşağıdakilerden hangisidir?',
  '{"options": ["Cizye", "Haraç", "Öşür", "Avarız", "Bennak"], "correctIndex": 0}'::jsonb,
  'Cizye, askere gitmeyen sağlıklı gayrimüslim erkeklerden alınan baş vergisidir. Kadınlar, çocuklar, din adamları, yaşlılar ve sakatlardan cizye alınmazdı.',
  'Haraç toprak/ürün vergisidir; Cizye ise askerlikten muafiyet karşılığı alınan kafa/şahıs vergisidir.',
  75
);

-- Soru #076 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Tımar arazisini sebepsiz yere üst üste üç yıl boyunca ekmeyip boş bırakan çiftçiden alınan ve üretimin sürekliliğini sağlamayı amaçlayan ceza niteliğindeki vergi aşağıdakilerden hangisidir?',
  '{"options": ["Çiftbozan Vergisi", "Ağnam Vergisi", "İmdadiye-i Seferiye", "Mücerred", "Resm-i Çift"], "correctIndex": 0}'::jsonb,
  'Çiftbozan vergisi, üretimin aksamasını önlemek için toprağını terk eden veya üç yıl işlemeyen çiftçiden alınan caydırıcı bir tazminat vergisidir.',
  'Çiftbozan mali gelir kazanmaktan ziyade tarımsal üretimin sürekliliğini teminat altına almayı hedefler.',
  76
);

-- Soru #077 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde küçükbaş hayvan (koyun ve keçi) sahiplerinden hayvan başına alınan ve Osmanlı''nın bütçesinde önemli bir yer tutan vergi aşağıdakilerden hangisidir?',
  '{"options": ["Ağnam Vergisi", "Avarız Vergisi", "Baç Vergisi", "Derbent Vergisi", "İhtisap"], "correctIndex": 0}'::jsonb,
  'Ağnam vergisi koyun ve keçi üzerinden alınırdı. TBMM 1920''de açıldığında çıkardığı 1 numaralı ilk kanun da ''Ağnam Vergisinin 4 katına çıkarılması kanunu''dur.',
  'Ağnam küçükbaş hayvan vergisidir. TBMM''nin ilk kanunu olması sebebiyle ÖSYM için çok kıymetlidir.',
  77
);

-- Soru #078 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'İlk kez II. Bayezid döneminde ''Küçük Kıyamet'' olarak anılan 1509 Büyük İstanbul Depremi sonrasında olağanüstü hallerde toplanmak üzere ihdas edilen, ancak 17. yüzyıldan itibaren sürekli hale gelen vergi türü aşağıdakilerden hangisidir?',
  '{"options": ["Avarız Vergisi", "Bennak Vergisi", "Cizye", "Öşür", "İane-i Milliye"], "correctIndex": 0}'::jsonb,
  'Avarız vergisi deprem, sel ve savaş gibi olağanüstü durumlarda toplanan olağanüstü hal vergisidir; duraklama döneminde bütçe açıkları sebebiyle düzenli bir vergiye dönüştürülmüştür.',
  'Avarız vergisinin ilk çıkışı 1509 İstanbul depremidir. Olağanüstü hal vergisi olarak kodlanmalıdır.',
  78
);

-- Soru #079 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde çarşı ve pazara getirilen ticari mallardan alınan ilk gümrük ve pazar vergisi niteliğindeki harç aşağıdakilerden hangisidir?',
  '{"options": ["Baç Vergisi (Bacıbazar)", "Ağnam", "Resm-i Arusane", "Derbent Vergisi", "İzn-i Sefine"], "correctIndex": 0}'::jsonb,
  'Baç vergisi, Osman Bey döneminde Karacahisar pazarında ilk kez toplanan ve Osmanlı tarihindeki ilk vergi kabul edilen pazar harcıdır.',
  'Osmanlı''da konulan ilk vergi Baç (Pazar) vergisidir. Osman Gazi döneminde uygulanmıştır.',
  79
);

-- Soru #080 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Gelirleri cami, medrese, hastane (darüşşifa), köprü ve kervansaray gibi kamu yararına çalışan sosyal kurumların masraflarına tahsis edilen, satılması, devredilmesi veya miras bırakılması kesinlikle yasak olan toprak türü aşağıdakilerden hangisidir?',
  '{"options": ["Vakıf Topraklar", "Mülk Topraklar", "Yurtluk", "Paşmaklık", "Mukataa"], "correctIndex": 0}'::jsonb,
  'Vakıf arazileri hayır kurumlarının finansmanı için bağışlanan dokunulmaz arazilerdir. Vakıf şartnamesine ''Vakfiye'', vakfı yöneten kişiye ise ''Mütevelli'' denirdi.',
  'Vakıf malları dokunulmazdır; devlet dahi olağanüstü haller dışında vakıf arazilerini kamulaştıramazdı.',
  80
);

-- Soru #081 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'I. Murat döneminde Çandarlı Kara Halil Paşa''nın teklifiyle kurulan, savaş esirlerinin beşte birinin devlete alınması esasına dayanan ve Kapıkulu Ordusu''nun insan kaynağını oluşturan ilk sistem aşağıdakilerden hangisidir?',
  '{"options": ["Pençik Sistemi", "Devşirme Sistemi", "İkta Sistemi", "Millet Sistemi", "Gulam Sistemi"], "correctIndex": 0}'::jsonb,
  'Farsça ''penç'' (beş) ve ''yek'' (bir) kelimelerinden türeyen Pençik sistemi, savaş esiri Hristiyan gençlerin 1/5''inin orduya kazandırılması sistemidir. Ankara Savaşı''ndan sonra esir gelmeyince yerine Devşirme sistemi getirilmiştir.',
  'Devşirme sistemi Pençik''in yetersiz kalması üzerine kendi gayrimüslim tebaamızdan gençlerin toplanmasıdır; savaş esirlerinin beşte biri ise Pençik sistemidir.',
  81
);

-- Soru #082 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Kapıkulu Piyadeleri (yaya askerler) arasında yer alan ve saray kapılarını, saray bahçelerini, padişahın kayıklarını korumakla görevli seçkin askeri ocak aşağıdakilerden hangisidir?',
  '{"options": ["Bostancılar", "Yeniçeriler", "Cebeciler", "Top Arabacıları", "Humbaracılar"], "correctIndex": 0}'::jsonb,
  'Bostancı Ocağı, sarayın ve Boğaziçi sahillerinin güvenliğini sağlayan, padişahın bindiği saltanat kayıklarını çeken özel saray muhafızlarıdır.',
  'Cebeciler silah yapan ve onaran ocaktır; saray ve kıyı emniyeti Bostancılar''a aittir.',
  82
);

-- Soru #083 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Kapıkulu Ordusu''nun atlı (süvari) birlikleri olan ''Altı Bölük Halkı'' arasında yer alan ve savaş sırasında ordunun ağırlıklarını, hazinesini ve ganimetleri korumakla görevli bölükler hangisinde doğru verilmiştir?',
  '{"options": ["Sağ ve Sol Garipler", "Sağ ve Sol Ulufeciler", "Sipah ve Silahtar", "Cebeciler ve Topçular", "Akıncılar ve Deliler"], "correctIndex": 0}'::jsonb,
  'Altı Bölük Halkı: 1) Sipah ve Silahtarlar padişahın çadırını korur. 2) Sağ ve Sol Ulufeciler saltanat sancaklarını korur. 3) Sağ ve Sol Garipler ise devlet hazinesini ve ordunun ağırlıklarını korur.',
  'ÖSYM''nin en meşhur süvari sorusudur: Sancağı Ulufeciler, ordu hazinesini ve ganimeti Garipler korur.',
  83
);

-- Soru #084 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Savaşta en ön safta giden, cesaretleri, kartal kanatlı miğferleri ve leopar kürkleriyle düşmana korku salan, Osmanlı ordusunun sınır boylarındaki en sıradışı hafif süvari birliği aşağıdakilerden hangisidir?',
  '{"options": ["Deliler", "Akıncılar", "Tatarlar", "Azaplar", "Yörükler"], "correctIndex": 0}'::jsonb,
  '''Deliler'' (Deli Süvarileri), korkusuzlukları sebebiyle bu adı alan, öncü keşif yapan ve psikolojik üstünlük sağlayan sınır atlı birlikleridir.',
  'Azaplar bekar Türk gençlerinden oluşan piyadelerdir; Deliler ise atlı süvarilerdir.',
  84
);

-- Soru #085 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ilk düzenli ordu teşkilatı olan ''Yaya ve Müsellem'' birliklerini kuran ve Bursa''yı fethederek devletin ilk başkenti yapan Osmanlı padişahı kimdir?',
  '{"options": ["Orhan Bey", "Osman Bey", "I. Murat", "Yıldırım Bayezid", "Çelebi Mehmet"], "correctIndex": 0}'::jsonb,
  'Orhan Bey döneminde vezir Alaeddin Paşa ve Çandarlı Halil''in önerisiyle Türk gençlerinden oluşan ilk düzenli ordu ''Yaya'' (piyade) ve ''Müsellem'' (atlı) kurulmuştur.',
  'Osman Gazi döneminde düzenli ordu yoktur, alpler ve aşiret kuvvetleri vardı. Düzenli ordu Orhan Gazi ile başlar.',
  85
);

-- Soru #086 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin denizcilik faaliyetleri ve donanması ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Osmanlı''nın denizcilikle tanışması Orhan Bey döneminde Karesioğulları Beyliği''nin fethiyle başlamıştır.", "İlk Osmanlı tersanesi Yıldırım Bayezid döneminde Gelibolu''da inşa edilmiştir.", "28 Eylül 1538 Preveze Deniz Zaferi Türk Deniz Kuvvetleri Günü olarak kutlanır.", "Osmanlı donanması tarihte ilk kez Çeşme''de Ruslar tarafından yakılmıştır.", "Osmanlı donanmasının en üst amiraline ve yöneticisine ''Kaptanıderya'' adı verilirdi."], "correctIndex": 3}'::jsonb,
  'Osmanlı donanması tarihte İLK KEZ Çeşme''de değil; 1571 yılında İnebahtı''da (Haçlılar tarafından) yakılmıştır. Kronolojik sıralama: 1571 İnebahtı (Haçlı), 1770 Çeşme (Rus), 1827 Navarin (İngiliz-Fransız-Rus), 1853 Sinop (Rus) baskınlarıdır.',
  'Donanmanın yakıldığı İLK yer İnebahtı''dır (Sokullu''nun ''Biz Kıbrıs''ı alarak sizin kolunuzu kestik...'' dediği olay).',
  86
);

-- Soru #087 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde donanma askerlerine ''Levent'' adı verilirdi.

Buna göre Kanuni Sultan Süleyman döneminde Osmanlı donanmasına katılarak Kaptanıderyalık makamına getirilen ve Preveze Deniz Zaferi ile Akdeniz''i bir ''Türk Gölü'' haline getiren ünlü Türk denizcisi kimdir?',
  '{"options": ["Barbaros Hayrettin Paşa (Hızır Reis)", "Turgut Reis", "Piri Reis", "Kılıç Ali Paşa", "Seydi Ali Reis"], "correctIndex": 0}'::jsonb,
  'Barbaros Hayrettin Paşa (Hızır Reis), Cezayir hükümdarı iken Osmanlı''ya bağlanmış ve Kaptanıderya olmuştur. 1538 Preveze Deniz Zaferi ile Haçlı donanmasını bozguna uğratmıştır.',
  'Piri Reis Hint Deniz Seferleri ve Kitab-ı Bahriye haritası ile ünlüdür; Preveze fatihi Barbaros''tur.',
  87
);

-- Soru #088 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'İlk dünya haritasını ceylan derisi üzerine çizen ve Akdeniz''in kıyılarını, limanlarını anlatan ''Kitab-ı Bahriye'' adlı muazzam coğrafya eserini Kanuni Sultan Süleyman''a sunan ünlü Osmanlı denizcisi kimdir?',
  '{"options": ["Piri Reis", "Seydi Ali Reis", "Murat Reis", "Ali Macar Reis", "Kemal Reis"], "correctIndex": 0}'::jsonb,
  'Piri Reis 1513 ve 1528 yıllarında iki dünya haritası çizmiş ve Kitab-ı Bahriye eserini kaleme almıştır.',
  'Seydi Ali Reis ''Mir''atü''l-Memalik'' (Ülkelerin Aynası) eserinin yazarıdır; Kitab-ı Bahriye ve ilk dünya haritası Piri Reis''e aittir.',
  88
);

-- Soru #089 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Portekizlilerin Basra Körfezi ve Kızıldeniz''deki ticari hegemonyasını kırmak amacıyla düzenlenen Hint Deniz Seferleri''ne katılan, fırtınaya yakalanarak Hindistan''a çıkan ve dönüş yolculuğunu ''Mir''atü''l-Memalik'' (Ülkelerin Aynası) adlı seyahatnamesinde anlatan denizci kimdir?',
  '{"options": ["Seydi Ali Reis", "Piri Reis", "Hadım Süleyman Paşa", "Koca Murat Reis", "Salih Reis"], "correctIndex": 0}'::jsonb,
  'Seydi Ali Reis Hint Deniz Seferleri dönüşünde ''Mir''atü''l-Memalik'' ve deniz astronomisi kitabı olan ''Kitabü''l-Muhit''i yazmıştır.',
  'Piri Reis Hint seferinde donanmayı Basra''da bıraktığı için idam edilmiştir; Mir''atü''l-Memalik''in yazarı ise Seydi Ali Reis''tir.',
  89
);

-- Soru #090 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı ordusunda kale kuşatmalarında surların altından gizlice tüneller kazarak patlayıcı yerleştiren ve kalelerin fethini kolaylaştıran özel istihkam birliğine ne ad verilirdi?',
  '{"options": ["Lağımcılar", "Humbaracılar", "Cebeciler", "Turnacılar", "Sakalar"], "correctIndex": 0}'::jsonb,
  'Lağımcılar Ocağı, yer altından tüneller kazıp surları havaya uçuran patlayıcı ve maden uzmanı askerlerdir.',
  'Humbaracılar havan topu ve el bombası atan ocaktır; tünel kazıcılar Lağımcılar''dır.',
  90
);

-- Soru #091 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Fatih Sultan Mehmet döneminde hazırlanan ve Osmanlı Devleti''nin ilk yazılı anayasal kanunnamesi kabul edilen ''Kanunname-i Ali Osman'' ile ilgili aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Devletin bekası için kardeş katline cevaz verilmiştir.", "Müsadere (haksız kazanç sağlayan devlet adamlarının mallarına el koyma) sistemi yasallaşmıştır.", "Cülus bahşişi verilmesi yasal bir kural haline getirilmiştir.", "Sancağa çıkma zorunluluğu tamamen kaldırılarak yerine doğrudan kafes usulü getirilmiştir.", "Divan-ı Hümayun başkanlığı sadrazamlara bırakılmıştır."], "correctIndex": 3}'::jsonb,
  'Sancağa çıkmayı kaldıran Fatih değildir; sancağa çıkma usulü III. Mehmet döneminde kaldırılmış, kafes usulü ise I. Ahmet döneminde kurumsallaşmıştır.',
  'Kanunname-i Ali Osman kardeş katlini, müsadereyi ve cülusu yasalaştıran temel kanundur.',
  91
);

-- Soru #092 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde esnaf ve zanaatkarların örgütlendiği Lonca Teşkilatı ile ilgili aşağıdaki terimlerden hangisi yanlış açıklanmıştır?',
  '{"options": ["Gedik - İş yeri açma ve mesleği icra etme ruhsatı", "Narh - Devletin ve loncanın belirlediği azami tavan satış fiyatı", "Orta Sandığı (Teavün) - Esnafın yardımlaşma ve kaza sandığı", "Yiğitbaşı - Loncanın güvenliğini ve disiplinini sağlayan görevli", "Ehli Hibre - Lonca üyelerinin tamamına verilen genel unvan"], "correctIndex": 4}'::jsonb,
  'Ehli Hibre loncanın genel üyeleri değil; üretilen malların kalitesini kontrol eden ve fiyatını takdir eden ''bilirkişi / uzman'' heyetidir.',
  'Gedik (ruhsat) ve Ehli Hibre (bilirkişi) ÖSYM''nin lonca sorularındaki iki büyük vazgeçilmezidir.',
  92
);

-- Soru #093 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Ahilik teşkilatından Lonca sistemine geçişte ortaya çıkan en belirgin fark aşağıdakilerden hangisidir?',
  '{"options": ["Ahilikte gayrimüslimler teşkilata alınmazken, Loncalarda gayrimüslim esnafın da kendi loncalarını kurabilmesi", "Loncalarda çıraklık eğitiminin tamamen kaldırılması", "Loncaların sadece askeri silah üretimi yapması", "Ahilikte ticaretin serbest olması, loncalarda yasaklanması", "Loncaların başında doğrudan Şeyhülislamın bulunması"], "correctIndex": 0}'::jsonb,
  'Ahilik İslami fütüvvet temelli olduğundan sadece Müslümanlar üye olabilirdi. Osmanlı Lonca sisteminde ise gayrimüslimler de esnaf teşkilatına dahil olmuş veya kendi loncalarını kurmuşlardır.',
  'Ahilik = Sadece Müslüman esnaf; Lonca = Hem Müslüman hem Gayrimüslim esnaf.',
  93
);

-- Soru #094 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet''in İstanbul''u fethettikten sonra Ayasofya ve Fatih Külliyesi çevresinde kurduğu, dönemin en yüksek seviyedeki ilahiyat ve pozitif bilimler akademisi niteliğindeki medrese aşağıdakilerden hangisidir?',
  '{"options": ["Sahn-ı Seman Medresesi", "Süleymaniye Medresesi", "İznik Orhaniyesi", "Gök Medrese", "Muradiye Medresesi"], "correctIndex": 0}'::jsonb,
  'Sahn-ı Seman (Sekiz Avlulu Medrese), Fatih tarafından kurulan ve müfredatını Ali Kuşçu ile hazırladığı Osmanlı''nın en seçkin yükseköğretim kurumudur.',
  'İznik Orhaniyesi Osmanlı''nın İLK medresesidir; en üst düzey akademi ise Fatih''in Sahn-ı Seman''ıdır.',
  94
);

-- Soru #095 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ilk medrese hangi padişah döneminde ve nerede açılmıştır?',
  '{"options": ["Orhan Bey - İznik", "Osman Bey - Söğüt", "I. Murat - Edirne", "Yıldırım Bayezid - Bursa", "Çelebi Mehmet - Amasya"], "correctIndex": 0}'::jsonb,
  'İlk Osmanlı medresesi 1331 yılında Orhan Bey tarafından İznik''te açılan ''İznik Orhaniyesi''dir (Süleyman Paşa Medresesi). İlk başmüderrisi ise Davud-ı Kayseri''dir.',
  'İlk müderris Davud-ı Kayseri, ilk medrese ise Orhan Bey döneminde İznik''tedir.',
  95
);

-- Soru #096 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Akkoyunlu Devleti elçisi olarak İstanbul''a gelen, Fatih Sultan Mehmet''in hayran kalarak sarayında kalmasını rica ettiği, Ayasofya Medresesi başmüderrisi olan ve İstanbul''un enlem ve boylamını kesin olarak hesaplayan ünlü matematik ve astronomi bilgini kimdir?',
  '{"options": ["Ali Kuşçu", "Uluğ Bey", "Kadızade-i Rumi", "Takiyüddin Mehmet", "Matrakçı Nasuh"], "correctIndex": 0}'::jsonb,
  'Ali Kuşçu, Semerkant ekolünün büyük temsilcisidir. Fatih''in davetiyle İstanbul''a gelmiş, Ayasofya müderrisi olmuş ve ''Fethiye'' adlı astronomi eserini Fatih''e sunmuştur.',
  'Takiyüddin Mehmet III. Murat döneminde ilk rasathaneyi kuran bilgindir; Fatih döneminin matematik dehası Ali Kuşçu''dur.',
  96
);

-- Soru #097 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet döneminde yaşayan, tıp sahasında ''Kitabü''l-Cerrahiyyetü''l-Haniyye'' adlı resimli cerrahi eserini yazan ve tıp tarihinde ilk kez hayvanlar ve kendi üzerinde deneysel farmakoloji deneyleri yapan ünlü Türk hekimi kimdir?',
  '{"options": ["Sabuncuoğlu Şerafeddin", "Akşemseddin", "Ahi Çelebi", "Altuncuzade", "Şanizade Ataullah"], "correctIndex": 0}'::jsonb,
  'Sabuncuoğlu Şerafeddin (Amasyalı hekim), cerrahi operasyonları minyatürlerle resmeden ilk tıp kitabının yazarıdır ve deneysel cerrahinin öncüsüdür.',
  'Akşemseddin mikrobu ilk tarif eden manevi hocadır; cerrahi çizimleri yapan Amasyalı hekim ise Sabuncuoğlu Şerafeddin''dir.',
  97
);

-- Soru #098 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  '17. yüzyılda yaşamış, 50 yıl boyunca Osmanlı coğrafyasını ve komşu ülkeleri gezerek ''Seyahat ya Resulallah'' rüyasıyla yola çıkan ve 10 ciltlik abidevi ''Seyahatname'' eserini kaleme alan ünlü seyyah kimdir?',
  '{"options": ["Evliya Çelebi", "Katip Çelebi", "Yirmisekiz Mehmet Çelebi", "Lale Devri Nedim", "Aşıkpaşazade"], "correctIndex": 0}'::jsonb,
  'Evliya Çelebi Türk tarihinin en büyük seyyahıdır. 17. yüzyıl Osmanlı coğrafyasının kültür, dil, folklor ve şehir yapısını anlatan eşsiz bir Seyahatname bırakmıştır.',
  'Katip Çelebi ''Cihannüma'' ve ''Keşfü''z-Zünun'' eserlerinin yazarıdır (Hacı Kalfa); seyyah olan ise Evliya Çelebi''dir.',
  98
);

-- Soru #099 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Batı dünyasında ''Hacı Kalfa'' (Hacı Halife) olarak tanınan, bibliyografik eseri ''Keşfü''z-Zünun'' ve dünyanın ilk Türkçe coğrafya ansiklopedisi kabul edilen ''Cihannüma''nın yazarı olan 17. yüzyıl Osmanlı alimi kimdir?',
  '{"options": ["Katip Çelebi", "Evliya Çelebi", "Naima", "Koçi Bey", "Hezarfen Ahmet Çelebi"], "correctIndex": 0}'::jsonb,
  'Katip Çelebi, 15 bin kitabı tanıttığı Keşfü''z-Zünun ve haritalarla donattığı Cihannüma eserleriyle Batı''da da büyük saygı görmüş bir bilgindir.',
  'Hacı Kalfa lakabı Katip Çelebi''ye aittir. ÖSYM bu lakabı doğrudan sormayı çok sever.',
  99
);

-- Soru #100 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Mimar Sinan''ın mimarlık kariyerindeki gelişimini ifade etmek üzere bizzat kendi ağzından nitelendirdiği ''Çıraklık'', ''Kalfalık'' ve ''Ustalık'' eserleri sırasıyla aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Şehzade Camii - Süleymaniye Camii - Selimiye Camii", "Süleymaniye Camii - Şehzade Camii - Selimiye Camii", "Selimiye Camii - Süleymaniye Camii - Şehzade Camii", "Mihrimah Sultan Camii - Rüstem Paşa Camii - Selimiye Camii", "Şehzade Camii - Sultanahmet Camii - Selimiye Camii"], "correctIndex": 0}'::jsonb,
  'Mimar Sinan: İstanbul Şehzade Camii için ''Çıraklık eserim'', İstanbul Süleymaniye Camii için ''Kalfalık eserim'', Edirne Selimiye Camii için ise ''Ustalık eserim'' demiştir. Edirne Selimiye Camii UNESCO Dünya Miras Listesi''ndedir.',
  'Sultanahmet Camii Mimar Sinan''ın değil, öğrencisi Sedefkar Mehmet Ağa''nın eseridir (Mavi Cami). Mimar Sinan üçlemesi: Şehzade -> Süleymaniye -> Selimiye.',
  100
);

-- Soru #101 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı saray teşkilatında ''Birun'' (dış saray) bünyesinde yer alan ve sarayın mutfak işlerini, padişahın ve saray halkının yemeklerinin hazırlanmasını organize eden teşkilat aşağıdakilerden hangisidir?',
  '{"options": ["Matbah-ı Amire", "Darüssaade", "Ceyb-i Hümayun", "Hazine-i Hassa", "Enderun"], "correctIndex": 0}'::jsonb,
  'Matbah-ı Amire, Topkapı Sarayı''nın devasa mutfak teşkilatıdır. Helvahane, Aşhane, Kiler gibi birimlerden oluşur ve günde binlerce kişiye yemek çıkarırdı.',
  'Darüssaade Harem ağasının dairesidir; Hazine-i Hassa padişahın şahsi hazinesidir; saray mutfağı ise Matbah-ı Amire''dir.',
  101
);

-- Soru #102 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Topkapı Sarayı''nda padişah ve saray için altın, gümüş, mücevher, çini, cilt, tezhip, minyatür ve kılıç gibi yüksek sanat eserlerini üreten saray sanatkarları loncasına / teşkilatına ne ad verilirdi?',
  '{"options": ["Ehl-i Hıref", "Ehl-i Şer", "Ehl-i Kalem", "Ehl-i Örf", "Ehl-i Seyf"], "correctIndex": 0}'::jsonb,
  'Ehl-i Hıref (Sanat Erbabı), sarayın resmi sanatçı ve zanaatkar loncasıdır. Maaş defterleri tutulur, dönemin en büyük nakkaşları, hattatları ve kuyumcuları burada istihdam edilirdi.',
  'Ehl-i Kalem bürokratlar, Ehl-i Seyf askerlerdir; saray sanatkar teşkilatı Ehl-i Hıref''tir.',
  102
);

-- Soru #103 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Tanzimat Dönemi''nde 1864 Vilayet Nizamnamesi ile taşra teşkilatı yeniden düzenlenmiştir.

1864 Vilayet Nizamnamesi ile kurulan ve 1871 düzenlemesiyle eklenen taşra idari kademeleri büyükten küçüğe nasıl sıralanmıştır?',
  '{"options": ["Vilayet - Liva (Sancak) - Kaza - Nahiye - Köy", "Eyalet - Kaza - Sancak - Köy", "Vilayet - Kaza - Nahiye - Köy", "Liva - Vilayet - Kaza - Köy", "Vilayet - Nahiye - Kaza - Köy"], "correctIndex": 0}'::jsonb,
  '1864 Vilayet Nizamnamesi ile Eyalet sistemi kaldırılmış, yerine Vilayet (Vali), Liva/Sancak (Mutasarrıf), Kaza (Kaymakam), Nahiye (Nahiye Müdürü) ve Köy (Muhtar) hiyerarşisi getirilmiştir.',
  'Klasik dönem: Eyalet-Sancak-Kaza-Köy; Tanzimat dönemi ise: Vilayet-Liva-Kaza-Nahiye-Köy''dür.',
  103
);

-- Soru #104 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '1864 Vilayet Nizamnamesi ilk kez hangi örnek pilot vilayette uygulanmış ve bu vilayetin valisi olan Mithat Paşa''nın başarılı uygulamaları sayesinde tüm imparatorluğa yayılmıştır?',
  '{"options": ["Tuna Vilayeti", "Selanik Vilayeti", "Halep Vilayeti", "Hüdavendigar Vilayeti", "Bosna Vilayeti"], "correctIndex": 0}'::jsonb,
  'Mithat Paşa''nın valiliği sırasında Tuna Vilayeti (Bulgaristan bölgesi) pilot bölge seçilmiş; yollar, okullar, emniyet sandıkları kurulmuş ve sistem tüm yurda buradan yayılmıştır.',
  'ÖSYM pilot vilayet sorusunu sıkça Tuna Vilayeti ve Mithat Paşa üzerinden sormaktadır.',
  104
);

-- Soru #105 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde başkent İstanbul''un belediye hizmetlerini yürütmek, temizlik, su ve imar işlerine bakmak üzere 1854 Kırım Savaşı sırasında kurulan ilk modern belediye idaresine ne ad verilmiştir?',
  '{"options": ["Şehremaneti", "Darülaceze", "Hilal-i Ahmer", "Zaptiye Nezareti", "Meclis-i Vala"], "correctIndex": 0}'::jsonb,
  '1854 yılında İstanbul''da kurulan Şehremaneti, günümüzdeki İstanbul Büyükşehir Belediyesi''nin ilk kurumsal karşılığıdır. Belediye başkanına ''Şehremini'' denirdi.',
  'Klasik dönemde belediye işlerine Kadı bakardı; 1854''te ise modern Şehremaneti kurulmuştur.',
  105
);

-- Soru #106 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı sarayında padişahın elbiselerini muhafaza eden, dikimini yaptıran ve padişahı törenlerde giydiren en güvenilir saray görevlisine ne ad verilirdi?',
  '{"options": ["Çuhadar Ağa", "Rikabdar Ağa", "Silahtar Ağa", "Tırnakçıbaşı", "İbrikdar Ağa"], "correctIndex": 0}'::jsonb,
  'Enderun Has Oda görevlilerinden Çuhadar Ağa, padişahın kaftan ve kumaşlarından sorumlu en yakın hizmetlilerindendir. Silahtar silahından, Rikabdar ise çizme ve at üzengisinden sorumludur.',
  'Silahtar silahla, Rikabdar ayakkabı/üzengi ile, Çuhadar ise kaftan ve elbiseyle ilgilidir.',
  106
);

-- Soru #107 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Hz. Muhammed''in soyundan gelen seyyid ve şeriflerin nüfus kayıtlarını tutan, haklarını koruyan ve onların davalarına bakan ilmiye mensubu yüksek görevli kimdir?',
  '{"options": ["Nakibüleşraf", "Şeyhülislam", "Kazasker", "Kassam", "Müftü"], "correctIndex": 0}'::jsonb,
  'Nakibüleşraf, peygamber soyundan gelenlerin kaydını tutan ve Eyüp Sultan''daki kılıç alaylarında padişahlara kılıç kuşatan saygın makamdır.',
  'Miras taksimini Kassam yapar; peygamber soyunun kaydını ise Nakibüleşraf tutar.',
  107
);

-- Soru #108 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ölen kişilerin geride bıraktığı mirası (tereke) tespit eden, paylaştıran ve yetimlerin hakkını koruyan adli görevliye ne ad verilirdi?',
  '{"options": ["Kassam", "Kadı", "Muhtesip", "Müstevfi", "Naib"], "correctIndex": 0}'::jsonb,
  'Kassam, kadıya bağlı olarak miras ve tereke defterlerini tutan ve şeri hukuka göre miras taksimi yapan görevlidir.',
  'Kassam miras paylaşımı memurudur. Tereke defterlerini tutar.',
  108
);

-- Soru #109 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde taşradan başkente göçü önlemek ve asayişi sağlamak amacıyla şehre girişlerde pasaport niteliğinde uygulanan iç seyahat izin belgesine ne ad verilirdi?',
  '{"options": ["Mürur Tezkeresi", "Berat", "İcazetname", "Temessük", "İzn-i Sefine"], "correctIndex": 0}'::jsonb,
  'II. Mahmut döneminde İstanbul''a denetimsiz giriş ve yerleşmeyi önlemek amacıyla ''Mürur Tezkeresi'' (geçiş belgesi / iç pasaport) uygulaması başlatılmıştır.',
  'İzn-i Sefine gemi geçiş belgesidir; vatandaşın şehirler arası geçiş belgesi Mürur Tezkeresi''dir.',
  109
);

-- Soru #110 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde posta ve haberleşme ağını sağlayan, at değiştirmek ve dinlenmek amacıyla ana ticaret yolları üzerinde kurulan menzil teşkilatına ve ulaklara ne ad verilirdi?',
  '{"options": ["Menzil Teşkilatı", "Derbent Teşkilatı", "Mekkari Taifesi", "Kapan Hanı", "Avarız Vakfı"], "correctIndex": 0}'::jsonb,
  'Menzil teşkilatı haberleşme, ferman nakli ve posta atlarının değişim merkezleridir. Derbentçiler yol/geçit güvenliğini sağlar; Mekkariler ise yük ve taşımacılık yapar.',
  'Derbent = Geçit güvenliği; Menzil = Posta/Haberleşme; Mekkari = Nakliye ve taşımacılıktır.',
  110
);

-- Soru #111 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı ticaret hayatında toptan ticaretin yapıldığı, tek bir cins malın (un, yağ, pamuk vb.) tartılarak perakendeci esnafa adil şekilde dağıtıldığı büyük toptancı hallerine ne ad verilirdi?',
  '{"options": ["Kapan (Kapan Hanı)", "Bedesten", "Arasta", "Külliye", "Zaviye"], "correctIndex": 0}'::jsonb,
  'Kapan Hanları (Un Kapanı, Yağ Kapanı gibi), malların tartıldığı ve Kapan Emini gözetiminde esnafa paylaştırıldığı toptancı halleridir.',
  'Bedesten kıymetli kumaş ve mücevher çarşısıdır; Arasta aynı meslekten esnafın sıralı dükkanlarıdır; toptancı hali ise Kapan''dır.',
  111
);

-- Soru #112 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde deve, at ve katırlarla kervan taşımacılığı yapan, tüccarların ve ordunun yüklerini ücret karşılığında bir şehirden diğerine nakleden meslek grubuna ne ad verilirdi?',
  '{"options": ["Mekkari Taifesi", "Derbentçiler", "Menzilciler", "Levendler", "Cebeciler"], "correctIndex": 0}'::jsonb,
  'Mekkari Taifesi, günümüzdeki kargo ve lojistik nakliye kooperatiflerinin karşılığı olan geleneksel taşımacılık teşkilatıdır.',
  'Mekkari taşımacıdır; Menzil haberleşmecidir; Derbent ise yol güvenlikçisidir.',
  112
);

-- Soru #113 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde basılan paralar konusunda;
I. İlk bakır para (Mangır): Osman Bey
II. İlk gümüş para (Akçe): Orhan Bey
III. İlk altın para (Sultani): Fatih Sultan Mehmet

Yukarıda verilen padişah-para eşleştirmelerinden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Osmanlı para kronolojisi: Bakır para Osman Gazi, Gümüş akçe Orhan Gazi, Altın para (Sultani / Sikke-i Hasene) ise Fatih Sultan Mehmet döneminde basılmıştır. Üçü de kesin doğrudur.',
  'Kağıt para (Kaime) ise Abdülmecit dönemindedir. Madeni sıralama: Bakır -> Gümüş -> Altın''dır.',
  113
);

-- Soru #114 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde para ayarının düşürülmesi, yani sikkelerin içindeki değerli altın ve gümüş oranının azaltılarak içine bakır karıştırılması işlemine ne ad verilirdi?',
  '{"options": ["Tağşiş (Kırpma)", "Müsadere", "İltizam", "Narh", "Malikane"], "correctIndex": 0}'::jsonb,
  'Tağşiş, devletin bütçe açıklarını kapatmak için paranın değerini düşürmesidir (devalüasyon). Ayarı düşük akçeye ''Züyuf Akçe'' denmiş ve Yeniçeri isyanlarına yol açmıştır.',
  'Tağşiş = Paranın ayarını bozma/devalüasyon; Züyuf Akçe ise sahte/ayarı düşük akçedir.',
  114
);

-- Soru #115 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı mimarisinde Batı etkisiyle (Barok ve Rokoko tarzı) inşa edilen ''ilk cami'' aşağıdakilerden hangisidir?',
  '{"options": ["Nuruosmaniye Camii", "Sultanahmet Camii", "Ortaköy Camii", "Dolmabahçe Camii", "Laleli Camii"], "correctIndex": 0}'::jsonb,
  'I. Mahmut döneminde başlanıp III. Osman döneminde tamamlanan Nuruosmaniye Camii (1755), Osmanlı''nın ilk Barok tarzı camisidir.',
  'Lale Devri''ndeki III. Ahmet Çeşmesi ilk sivil Batı eseridir; Batı tarzında yapılan İLK CAMİ ise Nuruosmaniye''dir.',
  115
);

-- Soru #116 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Lale Devri''nde Topkapı Sarayı''nın önüne inşa edilen ve Türk-İslam ile Batı süsleme sanatlarının harmanlandığı ''ilk Batı etkili sivil mimari yapı'' hangisidir?',
  '{"options": ["III. Ahmet Çeşmesi", "İshak Paşa Sarayı", "Nuruosmaniye Camii", "Beylerbeyi Sarayı", "Yıldız Sarayı"], "correctIndex": 0}'::jsonb,
  '1728 yılında yapılan III. Ahmet Çeşmesi, Rokoko süslemeleri ve geniş saçaklarıyla Batı etkisinin görüldüğü ilk anıtsal sivil su yapısıdır.',
  'İlk dini Batı yapısı Nuruosmaniye Camii; ilk sivil Batı yapısı III. Ahmet Çeşmesi''dir.',
  116
);

-- Soru #117 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Doğu Anadolu''da Ağrı Doğubayazıt''ta yer alan, inşası 99 yıl süren, Selçuklu, Osmanlı ve Barok mimarisinin harmanlandığı ve dünyada ilk kez ''merkezi kalorifer/ısıtma sisteminin'' uygulandığı tarihi saray hangisidir?',
  '{"options": ["İshak Paşa Sarayı", "Topkapı Sarayı", "Dolmabahçe Sarayı", "Beylerbeyi Sarayı", "Çırağan Sarayı"], "correctIndex": 0}'::jsonb,
  'İshak Paşa Sarayı, kartal yuvası gibi bir tepeye kurulmuş, içinde cami, kütüphane, harem ve zindanları bulunan, taş kanallarla sıcak su dolaştırılarak ısıtılan ilk saraydır.',
  'ÖSYM İshak Paşa Sarayı''nı hem mimari sentezi hem de dünyadaki ilk merkezi ısıtma sistemi özelliğiyle sıkça sorgular.',
  117
);

-- Soru #118 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı hat sanatının piri kabul edilen, yazıya getirdiği estetik kurallar sebebiyle ''Kıbletü''l-Küttab'' (Hattatların Kıblesi) unvanıyla anılan II. Bayezid dönemi büyük hattatı kimdir?',
  '{"options": ["Şeyh Hamdullah", "Hafız Osman", "Ahmet Karahisari", "Mustafa Rakım Efendi", "Yesarizade Mustafa İzzet"], "correctIndex": 0}'::jsonb,
  'Amasyalı Şeyh Hamdullah, Osmanlı hat sanatının kurucusu ve ''Hattatların Kutbu/Kıblesi'' kabul edilir. Kanuni dönemi hattatı Karahisari, Hilye-i Şerif ustası ise Hafız Osman''dır.',
  'Şeyh Hamdullah hat sanatının piri ve ilk büyük ustasıdır.',
  118
);

-- Soru #119 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet''in gül koklarken tasvir edildiği ünlü minyatür portresini çizen ve Türk resminde portreciliğin öncüsü olan Osmanlı nakkaşı kimdir?',
  '{"options": ["Nakkaş Sinan Bey", "Matrakçı Nasuh", "Levni", "Nigari", "Nakkaş Osman"], "correctIndex": 0}'::jsonb,
  'Nakkaş Sinan Bey, İtalya''da resim eğitimi almış ve Fatih''i bağdaş kurmuş vaziyette gül koklarken tasvir eden meşhur portreyi yapmıştır.',
  'Levni Lale Devri minyatürcüsüdür; Matrakçı Nasuh Kanuni devri topoğrafik minyatürcüsüdür; Fatih''in gül koklayan portresini çizen ise Sinan Bey''dir.',
  119
);

-- Soru #120 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Lale Devri''nin en büyük nakkaşı olan, ''Surname-i Vehbi'' eserindeki minyatürleriyle dönemin eğlencelerini, sünnet düğünlerini ve kıyafetlerini resmeden sanatçı kimdir?',
  '{"options": ["Levni (Abdülcelil Çelebi)", "Nakkaş Sinan Bey", "Matrakçı Nasuh", "Şeker Ahmet Paşa", "Osman Hamdi Bey"], "correctIndex": 0}'::jsonb,
  'Levni, Lale Devri''nin renk ve hareket ustası baş nakkaşıdır. Minyatürde gölge ve derinlik denemeleri yapmıştır.',
  'Lale Devri şairi Nedim; Lale Devri nakkaşı ise Levni''dir.',
  120
);


-- -------------------------------------------------------------
-- OSMANLI DAĞILMA DÖNEMI (100 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Beyliği''nin kısa sürede büyüyüp cihanşümul bir imparatorluğa dönüşmesinde jeopolitik konumunun yanı sıra uyguladığı istimalet (hoşgörü) ve iskân siyaseti belirleyici olmuştur. Ayrıca kuruluş yıllarında özellikle Bizans tekfurları ile çatışmaktan kaçınarak ''görünüşte dostça geçinme'' anlamına gelen bir dış politika taktiği izlenmiştir.

Osmanlı Devleti''nin kuruluş döneminde Bizans yerel yöneticileriyle uyguladığı bu uzlaşmacı ve esnek diplomatik taktiğe ne ad verilirdi?',
  '{"options": ["İstimalet", "Müdârâ", "Müdahale", "İskân", "Dirlik"], "correctIndex": 1}'::jsonb,
  'Müdârâ, Osmanlı Devleti''nin kuruluş yıllarında henüz askeri gücünün yetersiz olduğu evrede Bizans tekfurları ile iyi geçinme, durumu idare etme ve görünüşte dostane diplomasi yürütme siyasetine verilen addır. İstimalet ise fethedilen gayrimüslim halkın gönlünü kazanmaya dönük adalet ve hoşgörü politikasıdır.',
  'ÖSYM İstimalet (hoşgörü/kalp kazanma) ile Müdârâ (tekfurlarla görünüşte dostça geçinme taktiği) kavramlarını karşılaştırarak adayları yanıltır. Ramazan Yetgin notlarında "Müdârâ = Görünüşte dostça geçinme" şeklinde özel bir uyarıyla vurgulanmıştır.',
  1
);

-- Soru #002 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osman Bey döneminde 1302 yılında Bizans tekfurlarının birleşik ordusuna karşı yapılan ve ünlü tarihçi Halil İnalcık tarafından Osmanlı Devleti''nin gerçek bağımsızlık tarihi ve hanedan kuruculuğunun tescili kabul edilen ilk Osmanlı-Bizans savaşı aşağıdakilerden hangisidir?',
  '{"options": ["Maltepe (Palekanon) Savaşı", "Koyunhisar (Bafeon) Savaşı", "Sazlıdere Savaşı", "Sırpsındığı Savaşı", "Çirmen Savaşı"], "correctIndex": 1}'::jsonb,
  '1302 Koyunhisar (Bafeon) Savaşı, Osmanlı Beyliği ile Bizans İmparatorluğu arasındaki ilk resmi meydan savaşıdır. Bu zaferle Bursa''nın üç taraftan kuşatılması kolaylaşmış ve Prof. Dr. Halil İnalcık''a göre Osmanlı Devleti bu zaferle gerçek anlamda kurulmuştur.',
  'Adaylar Maltepe/Palekanon Savaşı (1329 - Orhan Bey dönemi, İznik''in fethi öncesi) ile Koyunhisar Savaşı''nı (1302 - Osman Bey) birbirine karıştırmaktadır.',
  2
);

-- Soru #003 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Orhan Bey döneminde Balıkesir ve Çanakkale çevresinde hüküm süren Karesioğulları Beyliği''nin iç karışıklıklarından yararlanılarak savaş yapılmaksızın Osmanlı topraklarına katılması sağlanmıştır.

Karesioğulları Beyliği''nin Osmanlı Devleti''ne katılmasının Türk ve Osmanlı tarihi açısından en önemli iki sonucu aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Anadolu Türk siyasi birliğini sağlama yolunda ilk adımın atılması ve Karesi donanması sayesinde ilk kez Rumeli''ye (Çimpe Kalesi) geçilmesi", "Bizans İmparatorluğu''nun vergiye bağlanması ve ilk altın paranın basılması", "Bursa''nın başkent yapılması ve ilk kez Divan teşkilatının kurulması", "Anadolu Türk siyasi birliğinin kesin olarak tamamlanması ve Memlük ilişkilerinin bozulması", "Karadeniz''in bir Türk gölü haline gelmesi ve Kırım Hanlığı''nın bağlanması"], "correctIndex": 0}'::jsonb,
  'Karesioğulları''nın fethiyle; 1. Anadolu Türk siyasi birliği (ATSB) için ilk adım atılmıştır (son adım ise Dulkadiroğulları''dır), 2. Beyliğin güçlü deniz gücü ve komutanları (Evrenos Gazi, Hacı İlbeyi) Osmanlı hizmetine girmiş ve Gelibolu''da Çimpe Kalesi alınarak Rumeli''ye ilk kez ayak basılmıştır.',
  'Adaylar "Anadolu Türk siyasi birliğini sağlamada İLK adım" (Karesioğulları) ile "KESİN adım" (Turnadağ Savaşı ile Dulkadiroğulları) ayrımını karıştırabilir.',
  3
);

-- Soru #004 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'I. Murat döneminde 1389 yılında Haçlı ordusuna karşı kazanılan I. Kosova Savaşı ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Osmanlı ordusu savaş alanında ilk kez ateşli silah olarak top kullanmıştır.", "Savaş meydanında şehitlerin kanı üzerine yansıyan hilal ve yıldız görüntüsü modern Türk bayrağının ilham kaynağı kabul edilmiştir.", "Savaş meydanını gezerken yaralı Sırp asilzadesi Miloş Obiliç tarafından şehit edilen I. Murat, savaş meydanında şehit düşen ilk ve tek Osmanlı padişahıdır.", "Bu zafer sonucunda Balkanlar kesin olarak Türk yurdu haline gelmiş ve Avrupalılar savunmaya çekilmiştir.", "Bu suikasttan sonra Osmanlı saray protokol kuralları değiştirilerek padişahlara belirli bir mesafeden fazla yaklaşılması yasaklanmıştır."], "correctIndex": 3}'::jsonb,
  'Balkanların kesin olarak Türk yurdu haline geldiği ve Avrupalıların savunmaya çekildiği zafer I. Kosova değil; 1448 yılındaki II. Kosova Savaşıdır (II. Murat dönemi). I. Kosova Savaşı ise güney Slavlarının direncini kırmıştır fakat nihai tescil II. Kosova''dadır.',
  'ÖSYM I. Kosova (I. Murat) ile II. Kosova''nın (II. Murat) sonuçlarını sürekli birbirine karıştırarak sorar. Miryokefalon ile benzerlik gösterip Balkanları kesinleştiren II. Kosova''dır.',
  4
);

-- Soru #005 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'İstanbul''u tarihte ilk kez kuşatan Osmanlı padişahı olan, kuşatmaya denizden destek sağlamak için Anadolu Hisarı''nı (Güzelcehisar) yaptıran ve 1396 Niğbolu Zaferi''nden sonra Abbasi Halifesi I. el-Mütevekkil tarafından kendisine "Sultan-ı İklim-i Rum" (Anadolu Diyarının Sultanı) unvanı tevcih edilen Osmanlı padişahı aşağıdakilerden hangisidir?',
  '{"options": ["I. Murat", "Yıldırım Bayezid", "Fatih Sultan Mehmet", "Çelebi Mehmet", "II. Murat"], "correctIndex": 1}'::jsonb,
  'Yıldırım Bayezid (I. Bayezid), İstanbul''u 4 kez kuşatmış, Anadolu Hisarı''nı inşa ettirmiş ve 1396 Niğbolu Zaferi''nin ganimetleriyle Bursa Ulu Camii''ni yaptırmıştır. Halife kendisine "Sultan-ı İklim-i Rum" unvanını vermiştir.',
  'Adaylar Anadolu Hisarı''nı (Yıldırım Bayezid) Rumeli Hisarı (Fatih Sultan Mehmet - Boğazkesen) ile karıştırabilir. Niğbolu zaferi ve Sultan-ı İklim-i Rum unvanı münhasıran Yıldırım''a aittir.',
  5
);

-- Soru #006 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1402 Ankara Savaşı''nda Yıldırım Bayezid''in Timur''a mağlup olarak esir düşmesiyle Osmanlı Devleti 1402-1413 yılları arasında 11 yıl süren ve kardeşler arasında taht kavgalarının yaşandığı "Fetret Devri"ne (Fasıla-i Saltanat) girmiştir.

Aşağıdakilerden hangisi Ankara Savaşı ve Fetret Devri''nin sonuçları arasında gösterilemez?',
  '{"options": ["Anadolu beyliklerinin yeniden bağımsızlıklarını ilan etmesiyle Anadolu Türk siyasi birliğinin bozulması", "Bizans''ın ömrünün ve İstanbul''un fethinin yaklaşık 50 yıl gecikmesi", "Balkan topraklarındaki gayrimüslim tebaanın adil tımar ve istimalet politikası sayesinde Osmanlı''ya sadık kalıp büyük çaplı isyan çıkarmaması", "Osmanlı Devleti''nin tarih sahnesinden tamamen silinerek yıkılması", "Yıldırım''ın oğlu Şehzade Mustafa''nın Timur tarafından rehin olarak Semerkant''a götürülmesi"], "correctIndex": 3}'::jsonb,
  'Osmanlı Devleti Ankara Savaşı ile yıkılmamış; 11 yıllık bir fetret ve kriz döneminden sonra Çelebi Mehmet''in kardeşlerini bertaraf etmesiyle toparlanarak varlığını sürdürmüştür.',
  'ÖSYM "Balkanlarda neden isyan çıkmadı?" sorusunu çok sever: Osmanlı''nın uyguladığı istimalet (hoşgörü) ve adil vergi/tımar siyaseti sayesinde Balkan halkları Fetret Devri''nde bile devlete sadık kalmıştır.',
  6
);

-- Soru #007 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Fetret Devri''ne son vererek devletin parçalanmasını önlediği için tarihçiler tarafından "Osmanlı Devleti''nin İkinci Kurucusu" olarak nitelendirilen; Venedik ile tarihteki ilk deniz savaşını (Çalı Bey Savaşı) yapan ve Osmanlı tarihindeki ilk dini-sosyal içerikli halk ayaklanması olan Şeyh Bedrettin İsyanı''nı bastıran padişah kimdir?',
  '{"options": ["II. Murat", "Çelebi Mehmet (I. Mehmet)", "Yıldırım Bayezid", "Fatih Sultan Mehmet", "Orhan Bey"], "correctIndex": 1}'::jsonb,
  'Çelebi Mehmet (I. Mehmet), kardeşleri İsa, Musa ve Süleyman Çelebi''yi mağlup ederek Fetret Devri''ni bitirmiş ve ikinci kurucu sayılmıştır. Döneminde Venedik ile Çalı Bey deniz savaşı yapılmış, Şeyh Bedrettin İsyanı bastırılmıştır.',
  'Şeyh Bedrettin İsyanı (Osmanlı''nın ilk dini isyanı) ile Baba İshak İsyanı (Türk tarihinin ve Selçuklu''nun ilk dini isyanı) ayrımına dikkat edilmelidir.',
  7
);

-- Soru #008 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1444 yılında Macarlarla imzalanan Edirne-Segedin Antlaşması''nın ardından tahtı 12 yaşındaki oğlu II. Mehmet''e bırakan II. Murat döneminde; maaşlarının düşüklüğünü bahane eden yeniçerilerin Edirne''de başlattığı ve Osmanlı tarihindeki ilk yeniçeri isyanı kabul edilen ayaklanma aşağıdakilerden hangisidir?',
  '{"options": ["Çınar Vakası", "Buçuktepe İsyanı", "Şahkulu İsyanı", "Patrona Halil İsyanı", "Kabakçı Mustafa İsyanı"], "correctIndex": 1}'::jsonb,
  'Edirne''de çıkan Buçuktepe İsyanı (1446), yeniçerilerin ulufe maaşlarına buçuk akçe zam almasıyla sonuçlanan tarihteki ilk yeniçeri isyanıdır. Bu isyan üzerine II. Murat tekrar tahta geçirilmiştir.',
  'Adaylar ilk yeniçeri isyanı olarak Genç Osman''ı öldüren isyanı veya Çınar Vakası''nı düşünebilir. İlk yeniçeri ayaklanması kuruluş dönemindeki Buçuktepe İsyanı''dır.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet 1453 yılında İstanbul''u fethederek Doğu Roma (Bizans) İmparatorluğu''na son vermiştir. Fatih, Bizans''ın gelecekte akrabalık veya miras bağıyla yeniden dirilme umutlarını tamamen yok etmek amacıyla;

I. Mora Yarımadası''ndaki Bizans Despotluklarını ortadan kaldırması,
II. 1461 yılında Trabzon Rum İmparatorluğu''nu fethetmesi,
III. Kırım''ı fethederek Karadeniz''i bir Türk gölü haline getirmesi

faaliyetlerinden hangilerini doğrudan bu amaçla (Bizans''ın yeniden canlanmasını önlemek) gerçekleştirmiştir?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'Bizans hanedan üyelerinin yönettiği Mora Despotluğu (1460) ve Trabzon Rum İmparatorluğu (1461) fethedilerek Bizans''ın yeniden canlanma ihtimali tamamen ortadan kaldırılmıştır. Kırım''ın fethi (1475) ise Karadeniz ticaret ve hakimiyetiyle ilgilidir.',
  'ÖSYM "Bizans''ın yeniden dirilmesini önleme amacı" sorularında şıklara Kırım veya Sinop''u çeldirici olarak koyar. Bu hedefe yönelik fetihler sadece Mora ve Trabzon Rum İmparatorluğu''dur.',
  9
);

-- Soru #010 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Fatih''in vefatından sonra tahta geçen II. Bayezid dönemi, kardeşi Cem Sultan''ın taht mücadelesini kaybederek önce Rodos Şövalyelerine, ardından Papalık ve Fransa''ya sığınmasıyla büyük bir iç ve dış buhrana sahne olmuştur.

Cem Sultan Olayı''nın Osmanlı Devleti dış politikası üzerindeki en temel olumsuz etkisi aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin Batı''da (Avrupa) fetih politikasını durdurarak pasif ve savunmacı bir siyaset izlemek zorunda kalması", "İran Safevileri ile ilk kez Amasya Antlaşması''nın imzalanması", "Anadolu Türk siyasi birliğinin tamamen parçalanması", "Osmanlı donanmasının Navarin''de yakılması", "Mısır Seferi''nin iptal edilerek Memlüklerle ittifak yapılması"], "correctIndex": 0}'::jsonb,
  'Cem Sultan''ın Avrupalıların elinde bir koz ve rehin olarak tutulması, II. Bayezid''in Batı''ya yönelik seferler yapmasını engellemiş; bu yüzden II. Bayezid dönemi "Yükselme dönemi içinde bir Duraklama dönemi" olarak anılmıştır.',
  'Cem Sultan olayı Osmanlı tarihinde "bir iç meselenin ilk kez uluslararası bir dış soruna dönüşmesi" örneğidir. Batı fetihlerinin durmasının ana gerekçesidir.',
  10
);

-- Soru #011 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Yavuz Sultan Selim 1515 yılında Maraş ve çevresinde hüküm süren Dulkadiroğulları Beyliği''ne karşı kazandığı hangi savaş ile bu beyliğe son vermiş ve böylece Anadolu Türk siyasi birliğini (ATSB) kesin olarak sağlamıştır?',
  '{"options": ["Çaldıran Savaşı", "Mercidabık Savaşı", "Turnadağ Savaşı", "Otlukbeli Savaşı", "Ridaniye Savaşı"], "correctIndex": 2}'::jsonb,
  '1515 Turnadağ Savaşı, Yavuz Sultan Selim''in Dulkadiroğulları Beyliği''ne son verdiği savaştır. Bu zaferle Anadolu''daki son bağımsız beylik de Osmanlı''ya katılmış ve Anadolu Türk siyasi birliği kesin olarak tamamlanmıştır.',
  'ÖSYM formülü: ATSB için ilk adım = Karesioğulları; ATSB''yi ilk kez geniş ölçüde sağlayan = Yıldırım Bayezid; ATSB''yi kesin olarak tamamlayan = Yavuz Sultan Selim (Turnadağ Zaferi).',
  11
);

-- Soru #012 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Yavuz Sultan Selim''in 1516 Mercidabık ve 1517 Ridaniye seferleriyle Memlük Devleti''ni ortadan kaldırmasının sonuçları ile ilgili aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Halifelik makamı Osmanlı hanedanına geçmiş ve Osmanlı Devleti''nin teokratik yapısı güçlenmiştir.", "Hicaz bölgesinin fethiyle Yavuz Sultan Selim ''Hadimü''l-Haremeyn'' (Mekke ve Medine''nin Hizmetkârı) unvanını almıştır.", "Baharat Yolu''nun denetimi tamamen Osmanlı Devleti''nin eline geçmiştir.", "Kutsal Emanetler İstanbul''a getirilerek Topkapı Sarayı Hırka-i Saadet Dairesi''nde muhafaza edilmiştir.", "Avrupa''da Martin Luther öncülüğünde başlayan Reform hareketleri Osmanlı''nın desteğiyle tamamen engellenmiştir."], "correctIndex": 4}'::jsonb,
  'Mısır Seferi devam ederken Almanya''da Martin Luther Reform hareketlerini başlatmıştır; Osmanlı Reform''a engel olmamış, aksine Şarlken''in ve Katolik kilisesinin parçalanmasını kendi lehine görerek Protestanları desteklemiştir.',
  'Ramazan Yetgin notlarında özel olarak geçen "Eş Zamanlı Tarih" bilgisidir: Ridaniye Savaşı yapıldığı sırada Avrupa''da Martin Luther Reform hareketini başlatmıştır.',
  12
);

-- Soru #013 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'Kanuni Sultan Süleyman döneminde 1533 yılında Avusturya ile imzalanan İstanbul Antlaşması''nda (İbrahim Paşa Antlaşması) yer alan;

"Avusturya Arşidükü (Kralı) protokol ve diplomatik statü bakımından Osmanlı Sadrazamına denk sayılacaktır." maddesinin uluslararası ilişkilerdeki doğrudan yorumu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin Orta Avrupa''da mutlak siyasi üstünlüğü ele geçirdiği", "Avusturya''nın Osmanlı topraklarına katıldığı", "Avusturya''nın tüm ordu birliklerini terhis ettiği", "Osmanlı Devleti''nin Avrupa diplomasisinde eşitlik (mütekabiliyet) ilkesini benimsediği", "Kutsal Roma Germen İmparatorluğu''nun yıkıldığı"], "correctIndex": 0}'::jsonb,
  'Bir devletin kralının Osmanlı''nın 2 numaralı adamı olan Sadrazama eşit sayılması, Osmanlı padişahının Avrupa''daki tüm kralların fevkinde bir "Cihan Hükümdarı" olduğunu ve Orta Avrupa''da ezici bir siyasi üstünlük kurduğunu kanıtlar. Bu üstünlük 1606 Zitvatorok Antlaşması''na kadar devam etmiştir.',
  'ÖSYM "Mütekabiliyet (karşılıklı eşitlik)" kavramını çeldirici olarak sunar. İstanbul Antlaşması''nda mütekabiliyet yoktur, tek taraflı Osmanlı üstünlüğü vardır. Mütekabiliyet 1606 Zitvatorok ile gelecektir.',
  13
);

-- Soru #014 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sokullu Mehmet Paşa''nın Sadrazamlığı döneminde ortaya atılan ancak Mimar Sinan''ın vefatı ve Kırım hanlarının ilgisizliği nedeniyle tamamlanamayan Don-Volga Kanal Projesi''nin temel amaçları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Rusya''nın güneye inmesini ve Kafkaslara yayılmasını engellemek", "Kırım Hanlığı''nı Rus tehdidine karşı korumak", "Hazar Denizi ile Karadeniz''i birleştirerek Orta Asya Türkleri ile doğrudan irtibat kurmak", "İran üzerine yapılacak askeri seferlerde donanmadan faydalanmak ve İran''ı kuzeyden baskı altına almak", "Süveyş Kanalı üzerinden Baharat Yolu''nu yeniden canlandırmak"], "correctIndex": 4}'::jsonb,
  'Süveyş Kanalı Projesi, Akdeniz ile Kızıldeniz''i birleştirmeyi ve Baharat Yolu''nu canlandırmayı hedefleyen bambaşka bir güney projesidir; Don ve Volga ırmaklarıyla bir ilgisi yoktur.',
  'ÖSYM Don-Volga Projesi ile Süveyş Kanalı Projesi''nin hedeflerini birbirine katarak çeldirici hazırlar. Don-Volga = Rusya, Orta Asya Türkleri ve İran odaklıdır.',
  14
);

-- Soru #015 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı aydınlarının ve vakanüvislerinin 17. yüzyıl için "Tereddi ve Tegayyür" (Bozulma ve Yozlaşma) tabirini kullandıkları Duraklama Dönemi''ne girilmesinde;

Aşağıdakilerden hangisi devletin iç dinamiklerinden kaynaklanan bir neden değil, dış (harici) bir neden olarak kabul edilir?',
  '{"options": ["Sancağa çıkma usulünün kaldırılarak tecrübesiz şehzadelerin ve küçük yaştaki çocukların tahta geçmesi", "Beşik ulemalığı sisteminin getirilmesiyle medreselerde eğitimin bozulması", "İmparatorluğun sınırlarının okyanuslar, çöller ve güçlü devletler gibi doğal sınırlara ulaşması", "Tımar sisteminin bozulmasıyla eyalet ordusunun dağılması ve Celali isyanlarının çıkması", "Saray kadınlarının ve ocak ağalarının devlet yönetimine müdahale etmesi"], "correctIndex": 2}'::jsonb,
  'İmparatorluğun sınırlarının çöl, okyanus, dağlar veya güçlü Avusturya/İran gibi "doğal sınırlara ulaşması", duraklamanın iç bünyeden değil coğrafi ve jeopolitik dış koşullarından kaynaklanan dış nedenidir. Diğer şıklar iç nedenlerdir.',
  'Ramazan Yetgin notlarında özel uyarı: "Doğal sınırlara ulaşılması iç neden değil, dış nedendir!" Adaylar bu detayı gözden kaçırıp iç neden zannedebilir.',
  15
);

-- Soru #016 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti ile Avusturya arasında 1606 yılında imzalanan ve Osmanlı Devleti''nin 1533 İstanbul Antlaşması ile kazandığı Orta Avrupa''daki diplomatik ve siyasi üstünlüğünü sona erdiren antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Vasvar Antlaşması", "Zitvatorok Antlaşması", "Bucaş Antlaşması", "Karlofça Antlaşması", "Pasarofça Antlaşması"], "correctIndex": 1}'::jsonb,
  '1606 Zitvatorok Antlaşması ile Avusturya Arşidükü protokolde tekrar Osmanlı Padişahına eşit sayılmış (mütekabiliyet ilkesi), yıllık vergi kaldırılmış ve Osmanlı Devleti''nin Kanuni''den beri süren Orta Avrupa''daki siyasi üstünlüğü sona ermiştir.',
  'ÖSYM üstünlüğü kazandıran antlaşma (1533 İstanbul) ile üstünlüğü kaybettiren antlaşmayı (1606 Zitvatorok) sürekli karşılaştırır.',
  16
);

-- Soru #017 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '17. yüzyıl Osmanlı siyasi tarihi ve antlaşmaları ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["1590 Ferhat Paşa Antlaşması $ → $ Osmanlı Devleti Doğu''da en geniş sınırlarına ulaşmıştır.", "1639 Kasr-ı Şirin Antlaşması $ → $ Zağros Dağları sınır kabul edilmiş, günümüz Türkiye-İran sınırı büyük ölçüde çizilmiştir.", "1669 Girit''in Fethi $ → $ 24 yıllık zorlu bir kuşatmanın ardından Venedik''ten alınmıştır.", "1672 Bucaş Antlaşması $ → $ Lehistan''dan Podolya ve Kamaniçe alınarak Osmanlı Devleti Batı''da en geniş sınırlarına ulaşmıştır.", "1664 Vasvar Antlaşması $ → $ Osmanlı Devleti ilk kez Batı''da büyük çapta toprak kaybetmiştir."], "correctIndex": 4}'::jsonb,
  '1664 Vasvar Antlaşması Osmanlı''nın 17. yüzyılda Avusturya''ya karşı kazandığı son kazançlı antlaşmadır (Uyvar ve Neograd kaleleri alınmıştır). Osmanlı''nın Batı''da ilk kez büyük çapta toprak kaybettiği antlaşma ise 1699 Karlofça Antlaşmasıdır.',
  'Adaylar Vasvar ile Karlofça''yı karıştırabilir. Vasvar 17. yüzyılda Avusturya''ya karşı son karlı antlaşmadır; Karlofça ise büyük felaket ve gerilemenin başlangıcıdır.',
  17
);

-- Soru #018 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1683 II. Viyana Kuşatması''nın bozgunla sonuçlanması üzerine Papa''nın çağrısıyla Osmanlı Devleti''ni Avrupa''dan tamamen atmak amacıyla kurulan "Kutsal İttifak" bünyesinde 16 yıl süren savaşlarda Osmanlı Devleti''ne karşı savaşan devletler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Avusturya", "Rusya", "Lehistan", "Venedik", "Fransa"], "correctIndex": 4}'::jsonb,
  'Kutsal İttifak devletleri: Avusturya, Rusya, Lehistan, Venedik ve Malta''dır [Şifre: MARVeL]. Fransa, kapitülasyon hakları ve Avusturya ile olan geleneksel rekabeti nedeniyle Kutsal İttifak''ta yer almamıştır.',
  'ÖSYM Kutsal İttifak üyelerini sorarken seçeneklere ısrarla Fransa veya İngiltere''yi koyar. Kutsal İttifak''ta Fransa yer almamıştır.',
  18
);

-- Soru #019 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1699 Karlofça Antlaşması sonrasında Rusya ile imzalanan 1700 İstanbul Antlaşması''nın Rusya açısından en stratejik tarihi önemi aşağıdakilerden hangisidir?',
  '{"options": ["Azak Kalesi''ni ele geçirerek tarihinde ilk kez Karadeniz''e inme fırsatı yakalaması ve İstanbul''da daimi elçi bulundurma hakkı elde etmesi", "Kırım''ı resmen kendi topraklarına ilhak etmesi", "Balkanlardaki Ortodoksların dini hamisi kabul edilmesi", "Boğazlar üzerinde ortak denetim hakkı kazanması", "Osmanlı Devleti''nden ilk kez kapitülasyon koparması"], "correctIndex": 0}'::jsonb,
  '1700 İstanbul Antlaşması ile Azak Kalesi Ruslara verilmiş ve Rusya Çarlığı tarihinde ilk kez Karadeniz''e çıkış kapısı elde etmiştir. Ayrıca Rusya ilk kez İstanbul''da elçilik açma hakkı kazanmıştır.',
  'Kırım''ın bağımsız olması (1774 Küçük Kaynarca) veya ilhakı (1783) ile Azak Kalesi''nin verilmesi (1700 İstanbul) karıştırılmamalıdır. Karadeniz''e ilk adım Azak Kalesi ile atılmıştır.',
  19
);

-- Soru #020 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'IV. Mehmet döneminde yeniçerilerin sarayı basarak istedikleri 30''a yakın devlet adamını Sultanahmet Meydanı''ndaki ulu bir çınar ağacına astıkları, mitolojideki meyveleri insan başı olan ağaca benzetilerek tarihe "Vakay-ı Vakvakiye" (Çınar Vakası) olarak geçen olay aşağıdakilerden hangisinin bir sonucudur?',
  '{"options": ["Celali İsyanları", "İstanbul (Yeniçeri) İsyanları", "Eyalet İsyanları", "Şeyh Sait İsyanı", "Patrona Halil İsyanı"], "correctIndex": 1}'::jsonb,
  'Vakay-ı Vakvakiye (1656), ulufe maaşlarının düşük ayarlı akçe ile ödenmesine isyan eden yeniçerilerin sarayı basarak devlet adamlarını çınar ağacına astıkları en kanlı İstanbul/Merkez isyanıdır.',
  'Adaylar Çınar Vakası''nı Vaka-i Hayriye (Yeniçeri Ocağı''nın kaldırılması) ile karıştırabilir. Biri yeniçerilerin yaptığı darbe, diğeri yeniçerilerin imha edilmesidir.',
  20
);

-- Soru #021 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '17. yüzyıl (Duraklama Dönemi) ıslahat hareketlerinin genel özellikleri ile ilgili olarak aşağıda verilen yargılardan hangisi yanlıştır?',
  '{"options": ["Islahatlar şahısların ömrüyle sınırlı kalmış, devlet politikası haline gelememiştir.", "Sorunların kökenine inilememiş, yüzeysel ve askeri-mali tedbirlerle yetinilmiştir.", "Islahatlar padişah ve vezirlerin baskı ve şiddet politikasıyla halka benimsetilmek istenmiştir.", "Avrupa''daki bilimsel ve teknik gelişmeler yakından takip edilerek Batı kurumları örnek alınmıştır.", "Fatih ve Kanuni dönemleri ideal model kabul edilerek Kanun-ı Kadim''e dönülmeye çalışılmıştır."], "correctIndex": 3}'::jsonb,
  '17. yüzyıl ıslahatlarında kesinlikle Avrupa etkisi YOKTUR! Osmanlı bu yüzyılda kendini hala Batı''dan üstün görmüş, çareyi Kanun-ı Kadim''e (eski parlak günlere) dönmekte aramıştır. Avrupa ilk kez 18. yüzyılda (Lale Devri) örnek alınacaktır.',
  'ÖSYM''nin en çok düşürdüğü klasik kuraldır: 17. Yüzyıl = Avrupa etkisi YOK. 18. Yüzyıl = Avrupa etkisi VAR.',
  21
);

-- Soru #022 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı tarihinde ilk kez saray dışından (Türk kızıyla) evlenerek saray bürokrasisinin gücünü kırmaya çalışan, Şeyhülislam''ın yetkilerini kısıtlayan ve Hotin Seferi''ndeki disiplinsizlikleri üzerine Yeniçeri Ocağı''nı kaldırmayı düşündüğü için Yedikule Zindanları''nda yeniçerilerce boğdurulan ilk ıslahatçı padişah kimdir?',
  '{"options": ["Genç Osman (II. Osman)", "IV. Murat", "I. Ahmet", "Tarhuncu Ahmet Paşa", "III. Selim"], "correctIndex": 0}'::jsonb,
  'Genç Osman (II. Osman), Osmanlı tarihinde ilk köklü ıslahat girişiminde bulunan padişahtır. Başkenti Anadolu''ya taşımayı ve Yeniçeri Ocağı''nı kaldırmayı planlamış, ancak yeniçeriler tarafından hunharca katledilmiştir.',
  'Adaylar Yeniçeri Ocağı''nı kaldıran II. Mahmut ile "kaldırmayı ilk kez düşünen" Genç Osman''ı karıştırabilmektedir.',
  22
);

-- Soru #023 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Bağdat Seferi''ndeki kahramanlıkları sebebiyle "Bağdat Fatihi" olarak anılan; ilk kez Şeyhülislam idam ettiren; Koçi Bey ve Kâtip Çelebi''ye devletin bozulma nedenlerini araştıran risaleler hazırlatan ve İstanbul yangınlarını önlemek amacıyla gece sokağa çıkma, tütün ve kahvehane yasakları getiren 17. yüzyıl padişahı kimdir?',
  '{"options": ["I. Ahmet", "II. Osman", "IV. Murat", "IV. Mehmet", "Köprülü Mehmet Paşa"], "correctIndex": 2}'::jsonb,
  'IV. Murat, sert otoritesiyle tanınan Bağdat Fatihi''dir. Koçi Bey Risalesi bu dönemin en ünlü raporudur. Kahvehaneleri kapatıp içki-tütün yasağı koymuştur.',
  'İlk içki yasağını getiren I. Ahmet''tir; fakat kahvehaneleri kapatıp sokak yasağı ve tütün yasağını şiddetle uygulayan IV. Murat''tır.',
  23
);

-- Soru #024 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1711 yılında Baltacı Mehmet Paşa komutasındaki Osmanlı ordusunun Prut Nehri kıyısında Rus Çarı I. Petro''yu kuşatarak mağlup etmesi ve imzalanan Prut Antlaşması ile Azak Kalesi''nin geri alınması Osmanlı Devleti''nde aşağıdakilerden hangisine yol açmıştır?',
  '{"options": ["Karlofça ve İstanbul antlaşmalarıyla kaybedilen toprakların geri alınabileceği umudunun doğmasına", "Avrupa''nın üstünlüğünün kabul edilerek Lale Devri''ne girilmesine", "Kırım''ın bağımsızlığının tanınmasına", "Rusya ile ilk kez dostluk antlaşması imzalanmasına", "Osmanlı Devleti''nin ilk kez dış borç almasına"], "correctIndex": 0}'::jsonb,
  '1711 Prut Zaferi, Osmanlı Devleti''nde 1699 Karlofça ile kaybedilen toprakların geri kazanılabileceğine dair büyük bir güven ve umut dalgası yaratmıştır. Ancak 1718 Pasarofça Antlaşması bu umudu söndürecektir.',
  'Prut umut doğurur; Pasarofça ise bu umutları bitirip Batı''nın üstünlüğünü kabul ettirir.',
  24
);

-- Soru #025 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1718 Pasarofça Antlaşması ile başlayan ve 1730 Patrona Halil İsyanı ile sona eren "Lale Devri" ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Dönemin padişahı III. Ahmet, sadrazamı ise Nevşehirli Damat İbrahim Paşa''dır.", "Bu dönemde askeri alanda köklü yenilikler yapılarak Nizam-ı Cedit ordusu kurulmuştur.", "İbrahim Müteferrika ve Said Efendi tarafından ilk özel Türk matbaası açılmıştır.", "Paris, Viyana, Moskova ve Varşova gibi Avrupa başkentlerinde ilk geçici elçilikler açılmıştır.", "Dönemin ünlü minyatür ustası Levni, şairi ise Nedim''dir."], "correctIndex": 1}'::jsonb,
  'Lale Devri''nde kesinlikle ASKERİ ISLAHAT YAPILMAMIŞTIR! Nizam-ı Cedit ordusu ise 18. yüzyılın sonunda III. Selim tarafından kurulacaktır. Lale Devri kültür, sanat, diplomasi ve sivil yaşam ağırlıklı bir dönemdir.',
  'ÖSYM Lale Devri sorularında şıklara "Batı tarzı ordu kuruldu" veya "askeri ıslahat yapıldı" çeldiricisini koyar. Lale Devri''nde askeri ıslahat yoktur!',
  25
);

-- Soru #026 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'Lale Devri''nde Osmanlı Devleti''ne getirilen matbaada ilk basılan eser Vankulu Mehmed Efendi''ye ait "Vankulu Lügatı"dır.

Matbaada tefsir, hadis ve fıkıh gibi dini kitapların basılmasının yasaklanarak yalnızca tarih, coğrafya, tıp ve sözlük gibi bilimsel eserlerin basılmasına izin verilmesinin temel gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Dini kitapların matbaa harfleriyle basılmasının günah sayılması", "Hattatların ve müstensihlerin (kitap çoğaltıcılarının) işsiz kalarak toplumsal isyan çıkarmasını önlemek", "Osmanlı ülkesinde dini kitaplara talebin olmaması", "Avrupa''dan ithal edilen kağıt miktarının yetersiz kalması", "Şeyhülislamın matbaanın açılmasına tamamen karşı çıkması"], "correctIndex": 1}'::jsonb,
  'Dini eserlerin elle yazılması geleneksel bir sektör olup binlerce hattat ve müstensih bu işten geçiniyordu. Hükümet hattatların işsiz kalıp isyan çıkarmasını önlemek amacıyla dini eser basımını matbaada yasaklamıştır.',
  'Adaylar bunun sadece dini tutuculuktan kaynaklandığını düşünür; oysa arkasındaki asıl neden binlerce lonca mensubu hattatın ekonomik geleceğini koruma kaygısıdır.',
  26
);

-- Soru #027 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Batı tarzında askeri ıslahatları başlatan ilk padişah I. Mahmut''tur.

I. Mahmut döneminde Fransa''dan getirilen, Humbaracı Ocağı''nı modernize eden, kendisine kont unvanına izafeten "Humbaracı Ahmet Paşa" adı verilen ve 1734''te Batı tarzı ilk askeri teknik okul olan "Hendesehane"yi kuran yabancı uzman kimdir?',
  '{"options": ["Baron de Tott", "Comte de Bonneval", "Melling", "Helmuth von Moltke", "Donizetti Paşa"], "correctIndex": 1}'::jsonb,
  'Comte de Bonneval Müslüman olarak Humbaracı Ahmet Paşa adını almıştır. Osmanlı''da Batı tarzı ilk teknik askeri okul olan Hendesehane''yi (mühendislik mektebi) açmıştır.',
  'Baron de Tott (III. Mustafa dönemi Sürat Topçuları) ile Comte de Bonneval (I. Mahmut dönemi Hendesehane) sıklıkla karıştırılır.',
  27
);

-- Soru #028 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nin 1768-1774 Osmanlı-Rus Savaşı''nda yenilmesi ve Çeşme''de donanmasının yakılması üzerine Rusya ile imzaladığı 1774 Küçük Kaynarca Antlaşması ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Kırım bağımsız olmuş, böylece Osmanlı Devleti tarihinde ilk kez halkı tamamen Türk ve Müslüman olan bir coğrafyayı kaybetmiştir.", "Kırım halkı dini açıdan Osmanlı Halifesine bağlı kalmış, böylece halifelik makamı tarihte ilk kez siyasi bir güç olarak kullanılmıştır.", "Osmanlı Devleti tarihinde ilk defa bir yabancı devlete (Rusya) savaş tazminatı ödemek zorunda kalmıştır.", "Rusya Karadeniz''de donanma bulundurma ve boğazlardan serbest ticaret gemisi geçirme hakkı elde etmiştir.", "Kırım''ın doğrudan Rusya Çarlığı''na bağlandığı Osmanlı Devleti tarafından resmen kabul edilmiştir."], "correctIndex": 4}'::jsonb,
  'Küçük Kaynarca''da Kırım Rusya''ya bağlanmamış, bağımsız olmuştur. Kırım''ın Rusya''ya ait olduğu ise 1792 Yaş Antlaşması ile kabul edilecektir.',
  'ÖSYM Kırım''ın elden çıkış sürecini aşama aşama sorar: 1774 Küçük Kaynarca = Bağımsız; 1779 Aynalıkavak = Özerk; 1783 = Rus ilhakı; 1792 Yaş Antlaşması = Kırım Rusya''nındır.',
  28
);

-- Soru #029 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde III. Selim döneminde yapılan kapsamlı yenilik hareketlerine "Nizam-ı Cedit" adı verilmiştir.

Aşağıdakilerden hangisi III. Selim dönemi ıslahatları arasında yer almaz?',
  '{"options": ["Nizam-ı Cedit adıyla Batı tarzı modern bir ordu kurulması ve masrafları için İrad-ı Cedit hazinesinin ihdası", "Avrupa''da ilk kez daimi (kalıcı) elçiliklerin açılması ve ilk daimi elçinin Londra''ya (Yusuf Agah Efendi) atanması", "Matbaa-i Amire adıyla tarihteki ilk devlet matbaasının kurulması", "Akka Kalesi savunmasında Cezzar Ahmet Paşa komutasında Napolyon Bonapart''ın mağlup edilmesi", "İlk denk bütçenin hazırlanarak saray masraflarının kısılması"], "correctIndex": 4}'::jsonb,
  'İlk modern denk bütçeyi hazırlayan devlet adamı 17. yüzyılda IV. Mehmet dönemi sadrazamı Tarhuncu Ahmet Paşadır; III. Selim değildir.',
  'Akka zaferi Nizam-ı Cedit ordusunun ilk ve tek askeri başarısıdır. İlk daimi elçi ise Londra elçisi Yusuf Agah Efendi''dir.',
  29
);

-- Soru #030 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1789 Fransız İhtilali''nin yaydığı milliyetçilik (ulusçuluk) akımının etkisiyle Osmanlı Devleti''ne karşı ilk kez isyan eden azınlık toplumu ile bağımsızlığını ilk kazanan azınlık devleti aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["İlk İsyan Eden: Sırplar – İlk Bağımsız Olan: Yunanistan (Rumlar)", "İlk İsyan Eden: Yunanistan – İlk Bağımsız Olan: Sırplar", "İlk İsyan Eden: Bulgarlar – İlk Bağımsız Olan: Karadağ", "İlk İsyan Eden: Sırplar – İlk Bağımsız Olan: Romanya", "İlk İsyan Eden: Ermeniler – İlk Bağımsız Olan: Arnavutluk"], "correctIndex": 0}'::jsonb,
  'İlk isyan eden toplum 1804''te Kara Yorgi önderliğinde Sırplardır. Ancak bağımsızlığını ilk kazanan toplum 1829 Edirne Antlaşması ile Yunanistan (Rumlar) olmuştur. Sırplar ise 1878 Berlin Antlaşması''nda bağımsız olacaktır.',
  'ÖSYM''nin en çok puan getiren klasiğidir: "İlk isyan eden Sırplar, ilk bağımsız olan Rumlar (Yunanistan); son ayrılan Balkan devleti ise Arnavutluk''tur."',
  30
);

-- Soru #031 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1808 yılında II. Mahmut ile taşradaki yerel güç odakları olan Âyanlar arasında Sadrazam Alemdar Mustafa Paşa''nın gayretleriyle imzalanan; padişahın yetkilerini tarihte ilk kez sınırlandıran ve İngiltere''deki Magna Carta''ya (1215) benzetilen ilk demokratikleşme belgesi aşağıdakilerden hangisidir?',
  '{"options": ["Tanzimat Fermanı", "Islahat Fermanı", "Sened-i İttifak", "Kanun-i Esasi", "Gülhane Hatt-ı Hümayunu"], "correctIndex": 2}'::jsonb,
  'Sened-i İttifak (1808), padişahın mutlak otoritesinin ilk kez ayanlar karşısında sınırlandığı ilk belgedir. Bir anayasa değildir ancak anayasal sürecin ilk kıvılcımıdır.',
  'Adaylar ilk anayasa olan Kanun-i Esasi veya hukukun üstünlüğünü tanıyan Tanzimat Fermanı ile karıştırır. Padişahın yetkisini ilk kısıtlayan belge Sened-i İttifak''tır.',
  31
);

-- Soru #032 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'II. Mahmut döneminde 1826 yılında Yeniçeri Ocağı kaldırılarak yerine Asakir-i Mansure-i Muhammediye ordusu kurulmuştur (Vaka-i Hayriye).

Aşağıdakilerden hangisi II. Mahmut''un yönetim ve toplum alanında gerçekleştirdiği yeniliklerden biri değildir?',
  '{"options": ["Divan-ı Hümayun''u kaldırarak yerine nazırlıklardan (bakanlıklar) oluşan Heyet-i Vükela''yı kurması", "İlk resmi gazete olan Takvim-i Vekayi''yi yayımlatması", "İstanbul''a giriş ve çıkışları denetlemek için ''Mürur Tezkeresi'' (iç pasaport) uygulamasını başlatması", "Memurlara ceket, pantolon ve fes giyme zorunluluğu getirmesi", "Kanun-i Esasi''yi ilan ederek Mebusan Meclisi''ni açması"], "correctIndex": 4}'::jsonb,
  'Kanun-i Esasi ve Mebusan Meclisi II. Mahmut değil, II. Abdülhamit döneminde 1876 yılında I. Meşrutiyet ile ilan edilmiştir. Diğer şıkların tümü II. Mahmut''un radikal modernleşme hamleleridir.',
  'II. Mahmut birçok ilki yaptığı için adaylar Meşrutiyet''i de II. Mahmut''a atfedebilir. Meşrutiyet II. Abdülhamit dönemindedir.',
  32
);

-- Soru #033 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Mısır Valisi Mehmet Ali Paşa''nın ordusunun Kütahya''ya kadar ilerlemesi üzerine II. Mahmut''un "Denize düşen yılana sarılır" diyerek 1833 yılında Rusya ile imzaladığı, Boğazlar meselesini ilk kez uluslararası bir sorun haline getiren antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Kütahya Antlaşması", "Hünkar İskelesi Antlaşması", "Balta Limanı Antlaşması", "Londra Boğazlar Sözleşmesi", "Edirne Antlaşması"], "correctIndex": 1}'::jsonb,
  '1833 Hünkar İskelesi Antlaşması, Osmanlı ile Rusya arasında imzalanmış bir savunma paktıdır. Bu antlaşmayla Rus donanmasına boğazlar açılmış, İngiltere ve Fransa paniğe kapılarak boğazlar sorununu uluslararası boyuta taşımıştır.',
  'Kütahya Antlaşması Mehmet Ali Paşa ile imzalanırken, Rusya ile imzalanan antlaşma Hünkar İskelesi''dir.',
  33
);

-- Soru #034 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1838 yılında Osmanlı Devleti ile İngiltere arasında imzalanan Balta Limanı Ticaret Antlaşması ile yabancı tüccarlara iç ticaret serbestisi tanınmış, iç gümrük vergileri kaldırılmış ve ihracat vergisi %12, ithalat vergisi %5 olarak belirlenmiştir.

Bu antlaşmanın Osmanlı Devleti üzerindeki en yıkıcı iktisadi sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin dış borçlarını tamamen ödeyerek ekonomik bağımsızlığını kazanması", "Yerli esnaf ve lonca teşkilatının iflas etmesi, Osmanlı pazarının Avrupa sanayisinin açık pazarı ve yarı sömürgesi haline gelmesi", "Osmanlı Devleti''nin sanayi devrimini başarıyla tamamlayıp fabrikalaşmaya geçmesi", "Düyun-u Umumiye İdaresi''nin derhal lağvedilmesi", "İngiltere''nin Osmanlı donanmasını modernize etmesi"], "correctIndex": 1}'::jsonb,
  'Balta Limanı Antlaşması Osmanlı gümrük duvarlarını sıfırlamış, ucuz Avrupa sanayi malları ülkeye dolmuş, lonca esnafı rekabet edemeyerek batmış ve Osmanlı ekonomisi Batı''ya tam bağımlı hale gelmiştir.',
  'Adaylar ticaret antlaşmasının gelirleri artırdığını düşünebilir; oysa Balta Limanı Osmanlı iktisadi bağımsızlığının ölüm fermanıdır.',
  34
);

-- Soru #035 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sultan Abdülmecit döneminde Hariciye Nazırı Mustafa Reşit Paşa tarafından Gülhane Parkı''nda okunarak ilan edilen 1839 Tanzimat Fermanı (Gülhane Hatt-ı Hümayunu) ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Padişah kendi gücünden başka kanun gücünün üstünlüğünü kabul etmiş ve anayasacılığa geçişin ilk aşaması sayılmıştır.", "Dil, din ve ırk ayrımı gözetmeksizin ''bütün tebaanın'' (herkesin) can, mal, namus ve mülkiyet güvenliği kanun teminatı altına alınmıştır.", "İlan edilmesinde Avrupalı devletlerin doğrudan askeri ve diplomatik bir baskısı bulunmamaktadır.", "İlanında temel hedef Osmanlıcılık fikriyle azınlıkların devlete bağlılığını artırmak ve Mısır meselesinde Londra Konferansı''nda Avrupa desteğini almaktır.", "Gayrimüslim tebaaya ilk kez il meclislerine üye seçilme ve siyasi parti kurma hakkı verilmiştir."], "correctIndex": 4}'::jsonb,
  'İl genel meclislerine üye olma hakkı Tanzimat Fermanı''nda değil, 1856 Islahat Fermanı''nda verilmiştir; siyasi parti hakkı ise 1908 II. Meşrutiyet sonrasıdır.',
  'Ramazan Yetgin şifresi: Metinde "Herkes / Bütün tebaa" diyorsa Tanzimat Fermanı; doğrudan "Gayrimüslim" diyorsa Islahat Fermanı''dır.',
  35
);

-- Soru #036 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1853-1856 Kırım Savaşı''nın Türk ve Osmanlı tarihi açısından taşıdığı ilkler ve önemli gelişmelerle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["İlk Dış Borç $ → $ 1854 yılında İngiltere''den alınmıştır.", "İlk Telgraf Hattı $ → $ İstanbul, Edirne ve Şumnu arasına çekilmiştir.", "Modern Hemşirelik $ → $ Florance Nightingale (Lambalı Kadın) Selimiye Kışlası''nda görev yapmıştır.", "Mülteci Meselesi $ → $ Avusturya ve Rusya''dan kaçan Macar ve Leh mülteciler Osmanlı''ya sığınmıştır.", "Savaşın Başlaması $ → $ Osmanlı donanmasının Navarin''de yakılmasıyla patlak vermiştir."], "correctIndex": 4}'::jsonb,
  'Kırım Savaşı''nda Osmanlı donanması Navarin''de değil, 1853 yılında Ruslar tarafından Sinop Baskını ile yakılmıştır (Navarin 1827''de Yunan isyanı sırasındadır).',
  'ÖSYM donanmanın yakıldığı yerleri (Sinop - Kırım Savaşı; Navarin - Yunan İsyanı) olaylarla eşleştirerek sorar.',
  36
);

-- Soru #037 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1856 Paris Barış Antlaşması''nda yer alan;

"Osmanlı Devleti ile Rusya Karadeniz''de hiçbir savaş gemisi bulunduramayacak ve kıyılarında askeri tersane kuramayacaktır." hükmünün Osmanlı Devleti açısından doğurduğu en çarpıcı sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti savaştan galip çıktığı halde Karadeniz''de yenik bir devlet muamelesi görmüştür.", "Karadeniz''in yeniden bir Türk gölü haline gelmesi sağlanmıştır.", "Rusya''nın Karadeniz kıyısındaki tüm toprakları Osmanlı''ya devredilmiştir.", "İngiltere ve Fransa Karadeniz''e daimi donanma yerleştirme hakkı kazanmıştır.", "Boğazlar tamamen Rusya''nın askeri denetimine bırakılmıştır."], "correctIndex": 0}'::jsonb,
  'Osmanlı Devleti Kırım Savaşı''nı kazanmış olmasına rağmen kendi iç denizi olan Karadeniz''de donanma ve tersane bulundurmaktan men edilmiş; yani masada mağlup devlet muamelesine maruz kalmıştır.',
  'ÖSYM''nin en popüler yorum sorusudur: Paris Antlaşması''nın "Karadeniz''in silahsızlandırılması" maddesi Osmanlı''nın galipken mağlup sayıldığının kanıtıdır.',
  37
);

-- Soru #038 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1877-1878 Osmanlı-Rus Savaşı (93 Harbi) sırasında; Plevne Kalesi''nde 6 ay boyunca olağanüstü bir savunma yaparak Rus ordularına geçit vermeyen ve "Plevne Kahramanı" olarak anılan Osmanlı komutanı ile Erzurum Aziziye Tabyası''nda halkı örgütleyerek Rus işgaline direnen kadın kahramanımız aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Gazi Ahmet Muhtar Paşa – Kara Fatma", "Gazi Osman Paşa – Nene Hatun", "Mahmut Şevket Paşa – Gördesli Makbule", "Enver Paşa – Şerife Bacı", "Rauf Orbay – Tayyar Rahime"], "correctIndex": 1}'::jsonb,
  'Plevne Kahramanı Gazi Osman Paşa''dır. Erzurum''da Aziziye Tabyaları''nı savunan ise 93 Harbi''nin simgesi Nene Hatun''dur. Nene Hatun Milli Mücadele''de değil, 93 Harbi''nde yer almıştır.',
  'ÖSYM Nene Hatun''u sıklıkla Kurtuluş Savaşı kadın kahramanları arasına çeldirici olarak koyar. Nene Hatun yalnızca 1877-78 93 Harbi''nde mücadele etmiştir!',
  38
);

-- Soru #039 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '93 Harbi sonrasında imzalanan 1878 Berlin Antlaşması ile Osmanlı Devleti''nden ayrılarak bağımsızlıklarını kazanan Balkan devletleri aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Sırbistan – Karadağ – Romanya", "Yunanistan – Bulgaristan – Arnavutluk", "Sırbistan – Yunanistan – Bosna", "Karadağ – Arnavutluk – Makedonya", "Bulgaristan – Romanya – Eflak"], "correctIndex": 0}'::jsonb,
  '1878 Berlin Antlaşması ile Sırbistan, Karadağ ve Romanya (Şifre: SaKaR / S-K-R) bağımsızlıklarını kazanmıştır. Bulgaristan ise özerk bir prenslik haline getirilmiştir.',
  'ÖSYM''nin en çok sorduğu sorudur: "Hangi devletler Berlin Antlaşması ile bağımsız oldu?" Cevap: Sırbistan, Karadağ, Romanya.',
  39
);

-- Soru #040 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '13 Nisan 1909 (Rumi 31 Mart 1325) tarihinde II. Meşrutiyet rejimini yıkmak ve anayasal düzeni sonlandırmak amacıyla İstanbul''da patlak veren 31 Mart Vakası ile ilgili olarak;

I. Türk demokrasi tarihinde rejime ve anayasal düzene karşı çıkan ilk ayaklanmadır.
II. İsyan, Selanik''ten gelen Mahmut Şevket Paşa komutasındaki Hareket Ordusu tarafından bastırılmıştır.
III. Mustafa Kemal, Hareket Ordusu''nda Kurmay Yüzbaşı olarak görev almış ve tarih sahnesine ilk kez çıkmıştır.
IV. İsyanın ardından II. Abdülhamit meclis kararıyla tahttan indirilmiş ve yerine V. Mehmet Reşat geçirilmiştir.

yargılarından hangileri doğrudur?',
  '{"options": ["I ve II", "I, II ve III", "II, III ve IV", "I, III ve IV", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'Verilen dört öncül de 31 Mart Vakası''na ait temel KPSS kazanımlarıdır. Rejime karşı ilk isyandır; bastıran Hareket Ordusu''dur; Mustafa Kemal''in tarih sahnesine ilk çıkışıdır ve II. Abdülhamit meclis kararıyla tahttan indirilmiştir.',
  'ÖSYM Mustafa Kemal''in tarih sahnesine ilk çıkışını sorar: Çanakkale veya Trablusgarp değil; 31 Mart Vakası''nda Hareket Ordusu kurmay yüzbaşısı olarak yer almasıdır.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1808 yılında Sadrazam Alemdar Mustafa Paşa''nın girişimiyle Padişah II. Mahmut ile Rumeli ve Anadolu ayanları arasında imzalanan, Türk tarihinde ilk kez padişahın mutlak yetkilerini sınırlandıran ve İngiltere''deki Magna Carta''ya (1215) benzetilen tarihi belge aşağıdakilerden hangisidir?',
  '{"options": ["Sened-i İttifak", "Tanzimat Fermanı", "Islahat Fermanı", "Kanun-i Esasi", "Gülhane Hatt-ı Hümayunu"], "correctIndex": 0}'::jsonb,
  'Sened-i İttifak (1808), padişahın yetkilerini kendi iradesiyle değil, taşra ayanlarının baskısıyla sınırlandıran ve ayanların varlığını resmen tanıyan ilk anayasal belgedir. Magna Carta ile büyük benzerlik gösterir.',
  'Tanzimat Fermanı hukukun üstünlüğünü getiren belgedir; padişahın yetkilerini ayanlara karşı ilk kez sınırlayan belge ise Sened-i İttifak''tır.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 1826 yılında bizzat Padişah II. Mahmut tarafından halkın ve ulemanın desteği alınarak Yeniçeri Ocağı''nın topa tutulup lağvedilmesi olayına Osmanlı tarihinde ne ad verilmiştir?',
  '{"options": ["Vaka-i Hayriye (Hayırlı Olay)", "Vaka-i Vakvakiye (Çınar Vakası)", "Edirne Vakası", "31 Mart Vakası", "Kuleli Vakası"], "correctIndex": 0}'::jsonb,
  '1826''da Yeniçeri Ocağı''nın kaldırılmasına ''Vaka-i Hayriye'' denmiştir. Bu ocağın yerine ''Asakir-i Mansure-i Muhammediye'' adıyla modern bir Batı tarzı ordu kurulmuştur.',
  'Vaka-i Vakvakiye (Çınar Vakası) IV. Mehmet döneminde 30 devlet adamının çınar ağacına asılmasıdır. Yeniçeri Ocağı''nın kaldırılması Vaka-i Hayriye''dir.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Mahmut döneminde gerçekleştirilen idari ve bürokratik ıslahatlar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Divan-ı Hümayun kaldırılarak yerine Bakanlıklar (Nazırlıklar) sisteminin kurulması", "Sadrazamlık makamının ''Başvekalet'' adını alması", "Müsadere (devletin memur mallarına el koyması) sisteminin fiilen kaldırılması", "Tımar sisteminin kaldırılarak memurlara düzenli maaş bağlanması", "İlk Osmanlı anayasası olan Kanun-i Esasi''nin ilan edilerek meclis açılması"], "correctIndex": 4}'::jsonb,
  'Kanun-i Esasi''nin ilanı ve meclisin (Meclis-i Mebusan) açılması II. Mahmut döneminde değil, 1876 yılında II. Abdülhamit döneminde gerçekleşmiştir.',
  'II. Mahmut devlet yönetimini kökten modernize etmiştir (Nazırlıklar, Başvekalet, memur maaşı, muhtarlıklar); fakat Anayasa ve Meclis II. Abdülhamit dönemindedir.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde modern anlamda askeri amaçlı ilk nüfus sayımı, mülk sayımı ve ilk resmi gazete olan ''Takvim-i Vekayi'' hangi padişah döneminde yayımlanmaya başlamıştır?',
  '{"options": ["II. Mahmut", "Abdülmecit", "Abdülaziz", "III. Selim", "II. Abdülhamit"], "correctIndex": 0}'::jsonb,
  'II. Mahmut döneminde 1831 yılında askeri ve vergi amaçlı ilk nüfus sayımı yapılmış (sadece erkekler ve mülkler sayılmıştır) ve aynı yıl ilk resmi gazete olan Takvim-i Vekayi çıkarılmıştır.',
  'Tanzimat fermanı Abdülmecit dönemindedir; ilk resmi gazete Takvim-i Vekayi ve ilk nüfus sayımı ise II. Mahmut dönemindedir.',
  44
);

-- Soru #045 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Mısır Valisi Mehmet Ali Paşa''nın isyan ederek Kütahya''ya kadar ilerlemesi üzerine Osmanlı Devleti çaresiz kalarak Rusya''dan yardım istemiştir. II. Mahmut''un bu durumu ''Denize düşen yılana sarılır'' sözüyle ifade ettiği bilinmektedir.

Osmanlı Devleti ile Rusya arasında 1833 yılında imzalanan, Boğazlar üzerinde Rusya''ya büyük ayrıcalıklar tanıyan ve Boğazlar Sorunu''nu ilk kez uluslararası bir mesele haline getiren antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Hünkar İskelesi Antlaşması", "Kütahya Antlaşması", "Balta Limanı Ticaret Sözleşmesi", "Edirne Antlaşması", "Londra Boğazlar Sözleşmesi"], "correctIndex": 0}'::jsonb,
  '1833 Hünkar İskelesi Antlaşması ile Osmanlı, bir saldırı halinde Boğazları Rusya lehine kapatmayı kabul etmiştir. Bu antlaşma Boğazlar Sorunu''nu başlatan ve Osmanlı''nın Boğazlar üzerinde tek başına egemenlik hakkını kullandığı son antlaşmadır.',
  'Kütahya Antlaşması Mehmet Ali Paşa ile imzalanmıştır; Rusya ile Boğazlar konusunda imzalanan ise Hünkar İskelesi Antlaşması''dır.',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin Mısır Sorunu''nda İngiltere''nin askeri ve diplomatik desteğini alabilmek amacıyla 1838 yılında İngiltere ile imzaladığı, iç ve dış gümrük vergilerini düşürerek Osmanlı ülkesini ''Avrupa''nın açık pazarı'' haline getiren ve yerli esnafı iflasa sürükleyen ekonomik sözleşme aşağıdakilerden hangisidir?',
  '{"options": ["Balta Limanı Ticaret Sözleşmesi", "Hünkar İskelesi Antlaşması", "Paris Antlaşması", "Berlin Antlaşması", "Uşi Antlaşması"], "correctIndex": 0}'::jsonb,
  '1838 Balta Limanı Ticaret Sözleşmesi ile ithalat gümrüğü %5''e düşürülmüş, ihracat gümrüğü ise %12''ye çıkarılmıştır. Yed-i Vahid (tekel) sistemi kalkmış, Osmanlı loncaları çökmüş ve sanayi çökmüştür.',
  'Balta Limanı kapitülasyonların çok ötesinde İngiltere''ye serbest ticaret hakkı tanıyan ve Osmanlı ekonomisini dışa bağımlı kılan antlaşmadır.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Hünkar İskelesi Antlaşması''nın 8 yıllık süresinin dolması üzerine İngiltere, Rusya, Fransa, Avusturya ve Prusya''nın katılımıyla 1841 yılında imzalanan ve Boğazların uluslararası statüsünü belirleyen ilk uluslararası sözleşme aşağıdakilerden hangisidir?',
  '{"options": ["Londra Boğazlar Sözleşmesi", "Hünkar İskelesi Antlaşması", "Paris Barış Antlaşması", "Kütahya Antlaşması", "Bükreş Antlaşması"], "correctIndex": 0}'::jsonb,
  '1841 Londra Boğazlar Sözleşmesi ile Boğazlar barış zamanında tüm devletlerin savaş gemilerine kapatılmış, ticaret gemilerine açık tutulmuştur. Böylece Boğazlar uluslararası bir komisyonun ve devletlerin ortak garantörlüğüne girmiştir.',
  'Boğazlar''ın Osmanlı tek taraflı kontrolünden çıkıp ''uluslararası statü'' kazandığı belge 1841 Londra Boğazlar Sözleşmesi''dir.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1829 yılında imzalanan Edirne Antlaşması ile bağımsızlığını kazanan ve Osmanlı Devleti''nden ayrılarak bağımsız olan ''ilk azınlık / Balkan milleti'' aşağıdakilerden hangisidir?',
  '{"options": ["Yunanistan (Rumlar)", "Sırbistan", "Karadağ", "Romanya", "Bulgaristan"], "correctIndex": 0}'::jsonb,
  '1829 Edirne Antlaşması ile Yunanistan bağımsızlığını kazanan ilk Balkan devleti olmuştur. (Sırplar ise 1804''te ilk isyan eden, 1812''de ilk ayrıcalık alan millettir).',
  'İlk isyan eden Sırplardır; ancak ilk BAĞIMSIZ olan devlet Yunanistan''dır (Edirne Antlaşması 1829).',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Mahmut döneminde açılan ve modern tıbbın temeli kabul edilen, hekim ve cerrah yetiştiren yüksekokul aşağıdakilerden hangisidir?',
  '{"options": ["Mekteb-i Tıbbiye", "Mekteb-i Harbiye", "Mekteb-i Mülkiye", "Darülmuallimin", "Sanayi-i Nefise"], "correctIndex": 0}'::jsonb,
  'II. Mahmut 1827 yılında askeri hekim ihtiyacını karşılamak için Tıbhane-i Amire ve Cerrahhane-i Mamure''yi (Mekteb-i Tıbbiye) kurmuştur. 14 Mart Tıp Bayramı bu okulun kuruluşuna dayanır.',
  'Mekteb-i Harbiye subay, Mekteb-i Mülkiye kaymakam ve bürokrat yetiştiren okuldur. Hekim mektebi Tıbbiye''dir.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Mahmut''un kılık-kıyafet alanında yaptığı düzenleme ile sarık ve cübbe yerine memurlara getirdiği başlık ve kıyafet zorunluluğu aşağıdakilerden hangisidir?',
  '{"options": ["Fes - Pantolon - Ceket", "Şapka - Kravat", "Kalpak - Çizme", "Sarık - Şalvar", "Kavuk - Kaftan"], "correctIndex": 0}'::jsonb,
  'II. Mahmut memurlara fes, ceket ve pantolon giyme zorunluluğu getirmiş ve kendi portresini devlet dairelerine astırmıştır. Gelenekçiler bu yenilikler sebebiyle padişaha ''Gavur Padişah'' lakabını takmışlardır.',
  'Şapka İnkılabı Cumhuriyet döneminde Atatürk tarafından yapılmıştır. II. Mahmut fes ve pantolonu getirmiştir.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '3 Kasım 1839 tarihinde Sadrazam Koca Mustafa Reşit Paşa tarafından Gülhane Parkı''nda halka ve yabancı elçilere okunan Gülhane Hatt-ı Hümayunu (Tanzimat Fermanı) hangi Osmanlı padişahı döneminde ilan edilmiştir?',
  '{"options": ["Sultan Abdülmecit", "II. Mahmut", "Sultan Abdülaziz", "V. Murat", "II. Abdülhamit"], "correctIndex": 0}'::jsonb,
  'Tanzimat Fermanı, II. Mahmut''un ölümü üzerine çok genç yaşta tahta çıkan oğlu Sultan Abdülmecit döneminde, Mustafa Reşit Paşa''nın çabalarıyla ilan edilmiştir.',
  'Fermanın hazırlıkları II. Mahmut devrinde başlamış olsa da resmen ilan eden padişah Sultan Abdülmecit''tir.',
  51
);

-- Soru #052 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Tanzimat Fermanı''nın Türk anayasa ve demokrasi tarihindeki en büyük önemi aşağıdakilerden hangisidir?',
  '{"options": ["Padişahın ilk kez kendi gücünün üzerinde bir ''Kanun Gücü'' (hukukun üstünlüğü) olduğunu kabul etmesi", "Halkın ilk kez genel seçimlerle parlamentoya girmesi", "Padişahlık makamının kaldırılarak cumhuriyetin ilan edilmesi", "Gayrimüslimlere devlet memuru olma hakkının tamamen yasaklanması", "Müslüman olmayan halktan alınan vergilerin iki katına çıkarılması"], "correctIndex": 0}'::jsonb,
  'Tanzimat Fermanı ile padişah bizzat kendisinin de kanunlara uyacağına yemin etmiştir. Böylece padişahın mutlak otoritesi kanun gücüyle sınırlandırılmış ve hukukun üstünlüğü ilkesi kabul edilmiştir.',
  'Tanzimat Fermanı''nda Meclis veya Anayasa YOKTUR. Sadece kanun üstünlüğü, can, mal, namus güvencesi ve vergi adaleti vardır.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin 1853-1856 Kırım Savaşı devam ederken Avrupalı devletlerin desteğini sürdürebilmek ve Paris Barış Konferansı kararlarını etkileyebilmek amacıyla 1856 yılında ilan ettiği, özellikle ''gayrimüslim tebaaya'' çok geniş haklar tanıyan ferman aşağıdakilerden hangisidir?',
  '{"options": ["Islahat Fermanı", "Tanzimat Fermanı", "Sened-i İttifak", "Vilayet Nizamnamesi", "Kanun-i Esasi"], "correctIndex": 0}'::jsonb,
  '1856 Islahat Fermanı, Sadrazam Mehmet Emin Ali Paşa tarafından hazırlanmış ve doğrudan gayrimüslim tebaanın haklarını genişletmeyi hedeflemiştir. Gayrimüslimlere küçük düşürücü söz söylenmesi (gavur denmesi), cizye vergisi ve iltizam usulü kaldırılmıştır.',
  'Tanzimat tüm Osmanlı tebaasını (Müslim-Gayrimüslim eşitliği) kapsarken; Islahat Fermanı ağırlıklı olarak Gayrimüslimlere yönelik taviz ve haklar içerir.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1853-1856 Kırım Savaşı''nda Rusya''nın Sinop''ta Osmanlı donanmasını yakması üzerine İngiltere, Fransa ve Piyemonte (İtalya) Osmanlı''nın yanında savaşa girmiştir.

Kırım Savaşı sırasında modern hemşireliğin temellerini atan, Üsküdar Selimiye Kışlası''nda yaralı askerleri gece elinde lambasıyla tedavi ettiği için ''Lambalı Kadın'' (The Lady with the Lamp) unvanını alan ünlü hekim kimdir?',
  '{"options": ["Florence Nightingale", "Clara Barton", "Safiye Ali", "Marie Curie", "Halide Edip Adıvar"], "correctIndex": 0}'::jsonb,
  'Florence Nightingale, Kırım Savaşı''nda Selimiye Kışlası''nda İngiliz ve Osmanlı yaralı askerlerine gönüllü hemşirelik yapmış, hijyen şartlarını düzelterek binlerce askerin hayatını kurtarmıştır.',
  'ÖSYM Kırım Savaşı''nda ''Lambalı Kadın'' lakaplı Florence Nightingale''i defalarca sınav sorusu yapmıştır.',
  54
);

-- Soru #055 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti, Kırım Savaşı''nın getirdiği ağır askeri masrafları karşılayabilmek amacıyla 1854 yılında tarihinde ilk kez hangi ülkeden dış borç almıştır?',
  '{"options": ["İngiltere", "Fransa", "Rusya", "Almanya", "Avusturya"], "correctIndex": 0}'::jsonb,
  'Osmanlı Devleti ilk dış borcunu 1854 yılında Kırım Savaşı sırasında Sultan Abdülmecit döneminde İngiltere''den almıştır.',
  'Fransa en çok borçlandığımız ülkedir; ancak İLK borç aldığımız devlet İngiltere''dir.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Kırım Savaşı''nın sonunda imzalanan 1856 Paris Barış Antlaşması''nın aşağıdaki maddelerinden hangisi Osmanlı Devleti''nin savaşı kazanmasına rağmen mağlup bir devlet gibi muamele gördüğünün en somut kanıtıdır?',
  '{"options": ["Osmanlı Devleti''nin bir Avrupa devleti sayılması ve Avrupa hukukundan yararlanması", "Osmanlı toprak bütünlüğünün Avrupalı büyük devletlerin ortak garantisi altında olması", "Karadeniz''in tarafsız hale getirilmesi; Osmanlı ve Rusya''nın Karadeniz''de tersane ve savaş gemisi bulundurmasının yasaklanması", "Tuna Nehri''nde ticaretin serbest olması", "Islahat Fermanı''nın antlaşma metnine dahil edilmesi"], "correctIndex": 2}'::jsonb,
  'Osmanlı galip tarafta yer almasına rağmen Karadeniz''de savaş gemisi ve tersane bulundurmaktan men edilmiştir. Kendi karasularında donanma bulunduramamak egemenlik haklarına açıkça aykırıdır.',
  'Bu madde hem Rusya''yı hem Osmanlı''yı kısıtlamıştır. Osmanlı galip olduğu halde kendi denizinde silahsızlandırılmıştır.',
  56
);

-- Soru #057 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sultan Abdülmecit döneminde 1840 yılında çıkarılan ve Osmanlı Devleti''nin ''ilk kağıt parası'' kabul edilen faizli devlet tahvili niteliğindeki para aşağıdakilerden hangisidir?',
  '{"options": ["Kaime-i Mutebere", "Mecidiye", "Sikke-i Hasene", "Akçe", "Yarmak"], "correctIndex": 0}'::jsonb,
  'İlk kağıt para ''Kaime'' (Kaime-i Nakdiye-i Mutebere) 1840''ta Abdülmecit devrinde basılmıştır. Madeni para olarak da altın ve gümüş ''Mecidiye'' çıkarılmıştır.',
  'Kağıt para Kaime, madeni para ise Mecidiye''dir.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1860 yılında Şinasi ve Agah Efendi tarafından çıkarılan ve Osmanlı Devleti''nin ''ilk özel gazetesi'' kabul edilen yayın organı aşağıdakilerden hangisidir?',
  '{"options": ["Tercüman-ı Ahval", "Tasvir-i Efkar", "Ceride-i Havadis", "Takvim-i Vekayi", "İkdam"], "correctIndex": 0}'::jsonb,
  'Tercüman-ı Ahval (1860) ilk özel Türk gazetesidir. İlk tiyatro eseri olan Şinasi''nin ''Şair Evlenmesi'' de bu gazetede tefrika edilmiştir.',
  'Takvim-i Vekayi ilk resmi gazetedir; Ceride-i Havadis yarı resmidir; ilk özel gazete ise Tercüman-ı Ahval''dir.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sultan Abdülaziz döneminde Mithat Paşa''nın öncülüğünde çiftçilere düşük faizli kredi sağlamak ve tefecilere karşı köylüyü korumak amacıyla kurulan, günümüz Ziraat Bankası''nın temeli kabul edilen sandık teşkilatı aşağıdakilerden hangisidir?',
  '{"options": ["Memleket Sandıkları", "Emniyet Sandığı", "Dersaadet Bankası", "Osmanlı Bankası", "İtibar-ı Milli Bankası"], "correctIndex": 0}'::jsonb,
  '1863 yılında Mithat Paşa tarafından Niş valiliği sırasında kurulan Memleket Sandıkları (ve Menafi Sandıkları), 1888 yılında II. Abdülhamit döneminde Ziraat Bankası''na dönüştürülmüştür.',
  'Memleket Sandıklarını kuran Mithat Paşa ve Abdülaziz''dir; Ziraat Bankası adını alması ise II. Abdülhamit dönemindedir.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı tarihinde ilk kez Avrupa''ya resmi ve barışçıl amaçlı bir gezi düzenleyerek Fransa, İngiltere, Belçika, Prusya ve Avusturya''yı ziyaret eden Osmanlı padişahı kimdir?',
  '{"options": ["Sultan Abdülaziz", "Sultan Abdülmecit", "II. Mahmut", "II. Abdülhamit", "V. Mehmet Reşat"], "correctIndex": 0}'::jsonb,
  'Sultan Abdülaziz 1867 yılında III. Napolyon''un davetiyle Paris Sanayi Sergisi''ne gitmiş ve Londra dahil birçok Avrupa başkentini ziyaret eden ilk Osmanlı padişahı olmuştur.',
  'Avrupa''ya seyahate giden ilk ve tek padişah Sultan Abdülaziz''dir.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Genç Osmanlılar (Jön Türkler) hareketinin baskısı ve Mithat Paşa''nın çabalarıyla 23 Aralık 1876 tarihinde Tersane (Tersane-i Amire) Konferansı''nın toplandığı gün ilan edilen Türk tarihinin ilk anayasası aşağıdakilerden hangisidir?',
  '{"options": ["Kanun-i Esasi", "Teşkilat-ı Esasiye", "Tanzimat Fermanı", "Sened-i İttifak", "1924 Anayasası"], "correctIndex": 0}'::jsonb,
  'Kanun-i Esasi (1876), Türk tarihinin ilk yazılı anayasasıdır. Böylece Osmanlı Devleti''nde mutlak monarşiden meşruti monarşiye geçilmiş ve halk ilk kez yönetime ortak olmuştur.',
  'Kanun-i Esasi ilk anayasadır; 1921 Teşkilat-ı Esasiye ise TBMM''nin ilk anayasasıdır.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1876 Kanun-i Esasi''ye göre kurulan Meclis-i Umumi (Osmanlı Parlamentosu) hangi iki alt meclisten oluşmaktaydı?',
  '{"options": ["Heyet-i Ayan - Heyet-i Mebusan", "Meclis-i Vükela - Meclis-i Has", "Millet Meclisi - Temsilciler Meclisi", "Divan-ı Hümayun - Meclis-i Ahkam-ı Adliye", "Senato - Temsilciler Kurulu"], "correctIndex": 0}'::jsonb,
  'Osmanlı Parlamentosu (Meclis-i Umumi): 1) Heyet-i Ayan (üyelerini ömür boyu padişah seçer), 2) Heyet-i Mebusan (üyelerini 4 yıllığına halk seçer).',
  'Ayan üyelerini halk değil, bizzat padişah seçer ve üyelik ömür boyudur; Mebusan üyelerini ise mülk sahibi erkek halk seçer.',
  62
);

-- Soru #063 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1877-1878 Osmanlı-Rus Savaşı''nda (93 Harbi) Kafkas cephesinde Erzurum''daki Aziziye Tabyaları''nı savunan, satır ve baltalarla Rus askerlerine karşı halk direnişini örgütleyen kadın kahramanımız kimdir?',
  '{"options": ["Nene Hatun", "Gördesli Makbule", "Halide Onbaşı", "Tayyar Rahmiye", "Kara Fatma"], "correctIndex": 0}'::jsonb,
  'Nene Hatun, 93 Harbi''nde kundaktaki bebeğini evde bırakıp ''Bebeğim anasız büyür ama vatansız büyüyemez'' diyerek Aziziye Tabyası savunmasına koşan milli kahramanımızdır.',
  'Kara Fatma ve Gördesli Makbule Kurtuluş Savaşı kadın kahramanlarıdır; 93 Harbi''nin sembolü Nene Hatun''dur.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '93 Harbi''nde Tuna/Balkan cephesinde Plevne Kalesi''ni 145 gün boyunca Rus ordusunun devasa kuşatmasına karşı kahramanca savunan ve düşman komutanı Grandük Nikola''nın dahi kılıcını teslim almayıp saygı duyduğu ünlü Türk mareşali kimdir?',
  '{"options": ["Gazi Osman Paşa", "Ahmet Muhtar Paşa", "Süleyman Hüsnü Paşa", "Mahmut Şevket Paşa", "Kazım Karabekir"], "correctIndex": 0}'::jsonb,
  'Gazi Osman Paşa (Plevne Kahramanı), Plevne Savunması ile askeri tarihe geçmiş büyük komutandır. Ahmet Muhtar Paşa ise Kafkas cephesinin komutanıdır.',
  'Kafkas cephesinde Ahmet Muhtar Paşa; Plevne ve Balkanlar''da ise Gazi Osman Paşa vardır.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '93 Harbi sonunda Rusya ile imzalanan ancak Avrupalı devletlerin çıkarlarına ters düştüğü için uygulanamayan ve tarihimizde ''ölü doğmuş antlaşma'' olarak bilinen Ayastefanos (Yeşilköy) Antlaşması yerine imzalanan uluslararası antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Berlin Antlaşması", "Paris Antlaşması", "Londra Antlaşması", "Bükreş Antlaşması", "Uşi Antlaşması"], "correctIndex": 0}'::jsonb,
  'Ayastefanos Antlaşması Rusya''yı aşırı güçlendirdiği için İngiltere ve Avusturya''nın müdahalesiyle iptal edilmiş; yerine 1878 Berlin Antlaşması imzalanmıştır.',
  'Osmanlı tarihinde yürürlüğe girmeyen iki antlaşma vardır: Biri Ayastefanos, diğeri ise Sevr Antlaşması''dır.',
  65
);

-- Soru #066 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Antlaşması ile Osmanlı Devleti''nden ayrılarak aynı anda tam bağımsızlıklarını kazanan üç Balkan devleti aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Sırbistan - Karadağ - Romanya", "Yunanistan - Bulgaristan - Arnavutluk", "Sırbistan - Yunanistan - Bulgaristan", "Bulgaristan - Bosna Hersek - Karadağ", "Romanya - Arnavutluk - Makedonya"], "correctIndex": 0}'::jsonb,
  '1878 Berlin Antlaşması ile ''S-A-Ka-R-ya'' veya ''S-K-R'' şifresiyle kodlanan Sırbistan, Karadağ ve Romanya bağımsız olmuştur.',
  'Bulgaristan Berlin''de bağımsız olmamış; üçe bölünerek Osmanlı''ya bağlı özerk bir prenslik yapılmıştır. Bağımsız olanlar Sırbistan, Karadağ ve Romanya''dır.',
  66
);

-- Soru #067 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Antlaşması''nın Türk ve dünya diplomasisi tarihindeki en kritik sonuçlarından biri aşağıdakilerden hangisidir?',
  '{"options": ["Ermeni Meselesi''nin tarihte ilk kez uluslararası bir konferans metnine girerek diplomasi alanına taşınması", "Mısır''ın bağımsızlığını ilan etmesi", "Boğazlar Komisyonu''nun resmen lağvedilmesi", "Yeniçeri Ocağı''nın kaldırılması", "Osmanlı Devleti''nin ilk kez dış borç alması"], "correctIndex": 0}'::jsonb,
  'Berlin Antlaşması''nın 61. maddesi Osmanlı''ya Doğu Anadolu''daki Ermeniler lehine ıslahat yapma zorunluluğu getirmiştir. Böylece Ermeni Sorunu uluslararası bir meseleye dönüşmüştür.',
  'Ermeni meselesinin doğduğu ve uluslararası belgeye girdiği ilk antlaşma 1878 Berlin Antlaşması''dır.',
  67
);

-- Soru #068 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Kongresi''nde Osmanlı Devleti''nin haklarını Rusya''ya karşı savunması karşılığında, İngiltere''ye yönetimi ''geçici olarak'' bırakılan ancak I. Dünya Savaşı''nda İngiltere tarafından tek taraflı ilhak edilen Akdeniz adası aşağıdakilerden hangisidir?',
  '{"options": ["Kıbrıs", "Girit", "Rodos", "On İki Ada", "Midilli"], "correctIndex": 0}'::jsonb,
  'İngiltere, Rus tehlikesine karşı Osmanlı''yı koruma bahanesiyle 1878''de Kıbrıs''ın yönetimini üs olarak devralmıştır. 1914''te Osmanlı I. Dünya Savaşı''na girince adayı ilhak ettiğini duyurmuştur.',
  'Kıbrıs satılmamış, geçici üs olarak verilmiştir ancak İngiltere bir daha adadan çıkmamıştır.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Antlaşması ile ''Elviye-i Selase'' (Üç Sancak) olarak bilinen ve savaş tazminatı karşılığı Rusya''ya bırakılan şehirlerimiz hangileridir?',
  '{"options": ["Kars - Ardahan - Batum", "Erzurum - Van - Muş", "Trabzon - Rize - Artvin", "Diyarbakır - Bitlis - Siirt", "Sivas - Kars - Bayburt"], "correctIndex": 0}'::jsonb,
  'Kars, Ardahan ve Batum (Elviye-i Selase), 1878 Berlin Antlaşması ile Rusya''ya bırakılmış, 1918 Brest-Litowsk ve 1921 Moskova/Kars antlaşmalarıyla tekrar anavatana katılmıştır.',
  'Doğubayazıt Berlin''de Osmanlı''ya geri verilmiştir; Rusya''da kalanlar Kars, Ardahan ve Batum''dur.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Ahmet Cevdet Paşa başkanlığındaki bir komisyon tarafından hazırlanan, İslam hukukuna dayalı (Hanefi fıkhı esaslı) Osmanlı Devleti''nin ilk medeni kanunu kabul edilen eser aşağıdakilerden hangisidir?',
  '{"options": ["Mecelle (Mecelle-i Ahkam-ı Adliye)", "Kanun-i Esasi", "Fatih Kanunnamesi", "Düstur", "Ceride-i Mahakim"], "correctIndex": 0}'::jsonb,
  'Mecelle, Ahmet Cevdet Paşa''nın başında bulunduğu heyet tarafından 1868-1876 yılları arasında hazırlanan Türk-İslam dünyasının ilk modern medeni kanunudur.',
  'Mecelle aile hukuku (evlenme-boşanma) konularını kapsamaz; borçlar, eşya ve yargılama usullerini içerir. 1926 Türk Medeni Kanunu ile yürürlükten kalkmıştır.',
  70
);

-- Soru #071 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1881 yılında ilan edilen ''Muharrem Kararnamesi'' ile Osmanlı Devleti''nin iflasını açıklaması üzerine, Avrupalı alacaklı devletlerin borçlarını doğrudan tahsil etmek amacıyla kurdukları ve devletin gelir kaynaklarına (tuz, tütün, ipek, damga pulu vb.) el koyan uluslararası teşkilat aşağıdakilerden hangisidir?',
  '{"options": ["Düyun-ı Umumiye İdaresi (Genel Borçlar İdaresi)", "Reji İdaresi", "Osmanlı Bankası", "Kapitülasyon Komisyonu", "Hilal-i Ahmer Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Düyun-ı Umumiye İdaresi (1881), Osmanlı maliyesini doğrudan yöneterek gelirleri haczeden ''devlet içinde devlet'' niteliğinde bir sömürge kurumuydu. Ekonomik bağımsızlığı tamamen yok etmiştir.',
  'Düyun-ı Umumiye''nin kuruluşu Muharrem Kararnamesi iledir. Ramazan Kararnamesi (1875) faizleri ödeyememe ilanıdır.',
  71
);

-- Soru #072 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Abdülhamit döneminde Alman mühendislerin ve sermayesinin iş birliğiyle inşa edilen, Berlin''den Bağdat''a ve Şam üzerinden Medine''ye kadar uzanan, Müslümanların hac yolculuğunu kolaylaştıran demir yolu projesi aşağıdakilerden hangisidir?',
  '{"options": ["Hicaz Demiryolu (Bağdat Demiryolu)", "Rumeli Demiryolu", "Anadolu-Bağdat Hattı", "İzmir-Aydın Hattı", "Şam-Beyrut Hattı"], "correctIndex": 0}'::jsonb,
  'Hicaz Demiryolu, İslam dünyasından toplanan bağışlarla finanse edilen, II. Abdülhamit''in İslamcılık (Panislamizm) politikasının en büyük prestij ve ulaşım projesidir.',
  'Anadolu''daki ilk demir yolu İzmir-Aydın hattıdır (İngilizler); II. Abdülhamit''in milli ve dini projesi ise Hicaz Demiryolu''dur.',
  72
);

-- Soru #073 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1908 yılında İngiltere Kralı VII. Edward ile Rus Çarı II. Nikola arasında Estonya''da gerçekleşen ve Osmanlı Devleti''nin Balkan ve Boğazlar topraklarının Rusya ve İngiltere arasında paylaşıldığı gizli diplomatik görüşme hangisidir?',
  '{"options": ["Reval Görüşmeleri", "Tilsit Görüşmeleri", "Bükreş Zirvesi", "Potsdam Zirvesi", "Tersane Konferansı"], "correctIndex": 0}'::jsonb,
  'Reval Görüşmeleri (Haziran 1908), Makedonya ve Boğazların Rusya''ya bırakılmasını kararlaştırmıştır. Bu görüşmeyi haber alan İttihatçılar meşrutiyeti yeniden ilan ettirmek için dağa çıkmıştır.',
  'Reval Görüşmeleri II. Meşrutiyet''in ilanını tetikleyen temel dış gelişmedir.',
  73
);

-- Soru #074 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '13 Nisan 1909 (Rumi 31 Mart 1325) tarihinde Meşrutiyet rejimine ve Anayasa''ya karşı gerici çevrelerin ve Avcı Taburları''nın kışkırtmasıyla İstanbul''da patlak veren ''31 Mart Vakası''nı bastırmak üzere Selanik''ten yola çıkan askeri güç aşağıdakilerden hangisidir?',
  '{"options": ["Hareket Ordusu", "Kuvayımilliye", "Asakir-i Mansure", "Hamidiye Alayları", "Yıldırım Orduları"], "correctIndex": 0}'::jsonb,
  'Hareket Ordusu, Mahmut Şevket Paşa komutasında ve Kurmay Başkanı Mustafa Kemal (önce Kolağası Mustafa Kemal) idaresinde İstanbul''a gelerek 31 Mart isyanını bastırmıştır. Türk tarihinde rejime karşı yapılan ilk isyandır.',
  'Hareket Ordusu''nun komutanı Mahmut Şevket Paşa''dır; Mustafa Kemal kurmay başkanıdır. İsyan bastırıldıktan sonra II. Abdülhamit tahttan indirilmiştir.',
  74
);

-- Soru #075 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin yıkılışını önlemek amacıyla ortaya atılan fikir akımları ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Osmanlıcılık - Din, dil, ırk farkı gözetmeksizin herkesi eşit Osmanlı vatandaşı sayma (Mithat Paşa, Namık Kemal)", "İslamcılık (Ümmetçilik) - Tüm Müslümanları halifenin sancağı altında birleştirme (II. Abdülhamit, Mehmet Akif)", "Türkçülük (Turancılık) - Bütün Türkleri bir çatı altında toplama ve milli kimliği güçlendirme (Ziya Gökalp, Yusuf Akçura)", "Batıcılık - Avrupa''nın bilim, teknik ve kurumlarını örnek alma (Tevfik Fikret, Celal Nuri)", "Adem-i Merkeziyetçilik - Bütün yetkilerin padişahın elinde toplandığı katı monarşiyi savunma (Prens Sabahattin)"], "correctIndex": 4}'::jsonb,
  'Prens Sabahattin''in savunduğu ''Adem-i Merkeziyetçilik'', merkeziyetçiliğin tam zıddıdır; yerel yönetimlerin yetkilerinin artırılmasını (federalizm) ve bireysel girişimciliği savunur.',
  'Adem-i Merkeziyetçilik yerinden yönetim ve serbest piyasa (liberalizm) demektir; merkeziyetçilik değildir.',
  75
);

-- Soru #076 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1911-1912 Trablusgarp Savaşı ile ilgili;
I. Savaş İtalya''nın sömürge arayışı ve hammadde ihtiyacı sebebiyle çıkmıştır.
II. Mustafa Kemal (Kolağası) ''Tüccar Şerif'', Enver Bey ise ''Kuyumcu Hamdi'' takma adlarıyla gizlice bölgeye gitmişlerdir.
III. Mustafa Kemal Derne ve Tobruk''ta yerli halkı örgütleyerek İtalyanlara karşı ilk askeri zaferini kazanmıştır.

Yukarıda verilen yargılardan hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Öncüllerin üçü de Trablusgarp Savaşı''nın en can alıcı sınav kazanımlarıdır. Mustafa Kemal ve Enver Bey gizlice Trablusgarp''a geçmiş, halkı teşkilatlandırarak gerilla savaşı vermişlerdir.',
  'Mustafa Kemal''in tarih sahnesine çıktığı ve sömürgeciliğe karşı ilk zaferini kazandığı yer Derne ve Tobruk''tur.',
  76
);

-- Soru #077 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Trablusgarp Savaşı sonunda İtalya ile 18 Ekim 1912''de imzalanan Uşi (Ouchy) Antlaşması''nın en önemli tarihi sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin Kuzey Afrika''daki son toprak parçasını (Trablusgarp ve Bingazi) kaybetmesi", "Mısır''ın İngiltere''ye bırakılması", "On İki Ada''nın kesin olarak Yunanistan''a devredilmesi", "İtalya''nın Boğazları işgal etmesi", "Kıbrıs''ın İtalyan yönetimine geçmesi"], "correctIndex": 0}'::jsonb,
  'Uşi Antlaşması ile Trablusgarp ve Bingazi İtalya''ya bırakılmış, böylece Osmanlı Devleti Kuzey Afrika''daki varlığını tamamen kaybetmiştir.',
  'Kuzey Afrika''da kaybedilen ilk yer Cezayir (1830 Fransa); son yer ise Trablusgarp''tır (1912 İtalya).',
  77
);

-- Soru #078 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nda (1912) Osmanlı Devleti''ne karşı ittifak kurarak savaş açan dört Balkan devleti aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Bulgaristan - Yunanistan - Sırbistan - Karadağ", "Romanya - Bulgaristan - Yunanistan - Sırbistan", "Bulgaristan - Arnavutluk - Karadağ - Sırbistan", "Yunanistan - Romanya - Karadağ - Bosna", "Bulgaristan - Sırbistan - Rusya - Karadağ"], "correctIndex": 0}'::jsonb,
  'I. Balkan Savaşı''nda Osmanlı''ya karşı savaşan devletler: Bulgaristan, Yunanistan, Sırbistan ve Karadağ''dır. Savaşı başlatan ilk devlet Karadağ''dır. ROMANYA I. Balkan Savaşı''nda YOKTUR!',
  'Romanya I. Balkan Savaşı''nda yer almamış; II. Balkan Savaşı''nda Bulgaristan''ın aşırı büyümesi üzerine savaşa dahil olmuştur.',
  78
);

-- Soru #079 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''ndaki kargaşa ve Osmanlı mağlubiyetinden faydalanarak bağımsızlığını ilan eden ve Osmanlı''dan ayrılan ''en son Balkan devleti'' aşağıdakilerden hangisidir?',
  '{"options": ["Arnavutluk", "Bulgaristan", "Sırbistan", "Makedonya", "Bosna-Hersek"], "correctIndex": 0}'::jsonb,
  'İsmail Kemal Bey önderliğinde 28 Kasım 1912''de bağımsızlığını ilan eden Arnavutluk, Osmanlı Devleti''nden ayrılan son Balkan milletidir. Bu ayrılık Osmanlıcılık fikrine son darbeyi vurmuştur.',
  'İlk ayrılan Yunanistan (1829), son ayrılan ise Arnavutluk''tur (1912).',
  79
);

-- Soru #080 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nın yarattığı hezimet ve Edirne''nin elden çıkması üzerine 23 Ocak 1913 tarihinde Enver Paşa ve İttihatçıların hükümet merkezini basarak Sadrazam Kamil Paşa''yı istifaya zorladığı ve Mahmut Şevket Paşa''yı sadrazam yaptığı hükümet darbesine ne ad verilir?',
  '{"options": ["Bab-ı Ali Baskını", "31 Mart Vakası", "Çırağan Baskını", "Kuleli Vakası", "Kütahya İsyanı"], "correctIndex": 0}'::jsonb,
  'Bab-ı Ali Baskını, Türk siyasi tarihindeki ilk modern askeri hükümet darbesidir. Bu darbeyle İttihat ve Terakki Cemiyeti I. Dünya Savaşı''nın sonuna kadar devlette mutlak iktidar (Talat-Enver-Cemal Paşalar dönemi) kurmuştur.',
  'Bab-ı Ali Baskını bir padişah değişikliği DEĞİLDİR; sadece hükümet darbesidir. Padişah V. Mehmet Reşat tahtında kalmıştır.',
  80
);

-- Soru #081 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 19. yüzyıl başında milliyetçilik akımının etkisiyle 1804 yılında ilk isyanı başlatan lider ile Sırplara ilk kez ayrıcalık (imtiyaz) tanıyan 1812 antlaşması aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Kara Yorgi - Bükreş Antlaşması", "Miloş Obrenoviç - Edirne Antlaşması", "Aleksandr İpsilanti - Yaş Antlaşması", "Tepedelenli Ali Paşa - Kütahya Antlaşması", "Dimitri Kantemir - Pasarofça Antlaşması"], "correctIndex": 0}'::jsonb,
  'Sırp isyanını 1804''te Kara Yorgi başlatmıştır. 1812 Bükreş Antlaşması ile Sırplara ilk imtiyaz verilmiş, 1829 Edirne ile özerklik, 1878 Berlin ile bağımsızlık verilmiştir.',
  'İlk isyan eden Sırplardır ve lideri Kara Yorgi''dir. İlk ayrıcalık 1812 Bükreş Antlaşması''dır.',
  81
);

-- Soru #082 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1821 yılında başlayan Rum (Yunan) İsyanı''nı kışkırtan, Fener Rum Patrikhanesi ve Rus çarlığı tarafından desteklenen gizli bağımsızlık cemiyeti aşağıdakilerden hangisidir?',
  '{"options": ["Etnik-i Eterya (Filiki Eterya)", "Hınçak Cemiyeti", "Taşnaksutyun", "Mavri Mira", "Kordos Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Filiki Eterya (Dostluk Cemiyeti), 1814''te Odessa''da kurulmuş ve Yunan bağımsızlık isyanını organize etmiştir.',
  'Mavri Mira I. Dünya Savaşı dönemi cemiyetidir; 1821 isyanını başlatan ise Etnik-i Eterya''dır.',
  82
);

-- Soru #083 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Yunan isyanını bastırmak amacıyla Osmanlı ve Mısır donanmalarının Mora kıyılarında bulunduğu sırada, 1827 yılında İngiliz, Fransız ve Rus birleşik donanmasının hiçbir savaş ilanı yapmadan Osmanlı donanmasını yaktığı liman baskını hangisidir?',
  '{"options": ["Navarin Baskını", "Sinop Baskını", "Çeşme Baskını", "İnebahtı Baskını", "Preveze Baskını"], "correctIndex": 0}'::jsonb,
  '1827 Navarin Baskını ile Osmanlı ve Mısır filosu tamamen yakılmış ve bu olay üzerine çıkan 1828-1829 Osmanlı-Rus Savaşı Yunanistan''ın bağımsızlığıyla sonuçlanmıştır.',
  'Osmanlı donanmasının yakıldığı 4 yer kronolojisi: İnebahtı (1571), Çeşme (1770), Navarin (1827), Sinop (1853).',
  83
);

-- Soru #084 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1859 yılında Sultan Abdülmecit''i tahttan indirerek yerine Şehzade Abdülaziz''i geçirmeyi hedefleyen ve Türk siyasi tarihindeki ''ilk başarısız darbe girişimi'' kabul edilen gizli örgütlenme olayı nedir?',
  '{"options": ["Kuleli Vakası", "Çırağan Baskını", "Bab-ı Ali Baskını", "Edirne Vakası", "Patrona Halil İsyanı"], "correctIndex": 0}'::jsonb,
  'Kuleli Vakası (1859), Fedailer Cemiyeti tarafından Abdülmecit''e karşı planlanan ancak önceden haber alınarak bastırılan ilk askeri darbe teşebbüsüdür.',
  'Çırağan Baskını II. Abdülhamit''e karşı yapılmıştır; Kuleli Vakası ise Abdülmecit dönemindedir.',
  84
);

-- Soru #085 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1878 yılında Ali Suavi önderliğindeki bir grubun, II. Abdülhamit''i devirerek akıl sağlığı bozuk olduğu gerekçesiyle tahttan indirilen V. Murat''ı yeniden tahta çıkarmak amacıyla gerçekleştirdiği kanlı saray baskını hangisidir?',
  '{"options": ["Çırağan Sarayı Baskını", "Kuleli Vakası", "Bab-ı Ali Baskını", "31 Mart Vakası", "Beylerbeyi Hadisesi"], "correctIndex": 0}'::jsonb,
  'Ali Suavi''nin Çırağan Sarayı Baskını, Beşiktaş Muhafızı Yedi Sekiz Hasan Paşa''nın Ali Suavi''yi başına sopayla vurarak öldürmesiyle bastırılmıştır.',
  'Çırağan Baskını Ali Suavi tarafından V. Murat''ı tahta geçirmek için yapılmıştır.',
  85
);

-- Soru #086 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1877-1878 Osmanlı-Rus Savaşı''nda (93 Harbi) Balkanlar''da Şıpka Geçidi''ni Rus kuvvetlerine ve Bulgar çetelerine karşı dondurucu kış şartlarında aylarca kahramanca savunan ve ''Şıpka Kahramanı'' unvanını alan Osmanlı generali kimdir?',
  '{"options": ["Süleyman Hüsnü Paşa", "Gazi Osman Paşa", "Ahmet Muhtar Paşa", "Hasan Tahsin Paşa", "Ethem Paşa"], "correctIndex": 0}'::jsonb,
  'Süleyman Hüsnü Paşa Şıpka Geçidi savunması ile tarihe geçmiştir. Plevne Kahramanı Gazi Osman Paşa; Kafkas Kahramanı ise Ahmet Muhtar Paşa''dır.',
  'Plevne = Gazi Osman Paşa; Şıpka Geçidi = Süleyman Hüsnü Paşa''dır.',
  86
);

-- Soru #087 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Abdülhamit döneminde Ermeni çetelerinin Doğu Anadolu''daki köylere ve Türk yerleşimlerine yönelik terör eylemlerini engellemek ve sınır güvenliğini sağlamak amacıyla Doğu''daki aşiretlerden kurulan süvari alaylarına ne ad verilmiştir?',
  '{"options": ["Hamidiye Alayları", "Asakir-i Mansure", "Kuvayımilliye", "Sekban-ı Cedit", "Başıbozuklar"], "correctIndex": 0}'::jsonb,
  'Hamidiye Süvari Alayları, II. Abdülhamit tarafından doğudaki Kürt ve Türkmen aşiretlerinden teşkil edilmiş, Rus ve Ermeni çetelerine karşı sınır güvenliğinde çok etkili olmuştur.',
  'Hamidiye Alayları II. Abdülhamit''in adını taşır ve düzenli süvari birlikleridir.',
  87
);

-- Soru #088 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1896 yılında Ermeni Taşnak komitacılarının Avrupa''nın dikkatini çekmek amacıyla başkent İstanbul''da bastıkları ve rehineler aldıkları uluslararası finans kurumu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Bankası (Bank-ı Osmani-i Şahane)", "Ziraat Bankası", "Düyun-ı Umumiye", "Dersaadet Bankası", "Reji İdaresi"], "correctIndex": 0}'::jsonb,
  'Osmanlı Bankası Baskını (1896), Ermeni teröristlerin Galata''daki bankayı dinamitlerle işgal ederek Avrupa devletlerinin müdahalesini sağlamaya çalıştığı uluslararası krizdir.',
  'Ermeni komitacılar Osmanlı Bankası''nı işgal etmiştir. Rus elçisinin araya girmesiyle teröristler Fransa''ya kaçırılmıştır.',
  88
);

-- Soru #089 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '21 Temmuz 1905 tarihinde Ermeni Taşnak komitacılarının II. Abdülhamit''e yönelik Cuma Namazı çıkışında Yıldız Camii önünde gerçekleştirdikleri bombalı suikast girişimi tarihe ne adla geçmiştir?',
  '{"options": ["Yıldız Suikastı", "Çırağan Olayı", "Kuleli Vakası", "Bab-ı Ali Baskını", "Selamlık Hadisesi"], "correctIndex": 0}'::jsonb,
  'Yıldız Suikastı''nda saatli bomba yüklü araba patlatılmış, Şeyhülislam ile birkaç dakika ayaküstü sohbet eden II. Abdülhamit ölümden kıl payı kurtulmuştur. Tevfik Fikret bu suikast için ''Bir Lahza-i Teahhur'' (Bir Anlık Gecikme) şiirini yazmıştır.',
  'Yıldız Suikastı II. Abdülhamit''e yöneliktir ve Tevfik Fikret''in ''Şanlı Avcı'' dediği olaydır.',
  89
);

-- Soru #090 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Tanzimat döneminde Ahmet Cevdet Paşa öncülüğünde kurulan, Osmanlı''nın ilk fen ve bilim akademisi niteliğinde olan, üniversite ders kitaplarını hazırlayan kurum hangisidir?',
  '{"options": ["Encümen-i Daniş", "Darülfünun", "Cemiyet-i İlmiye-i Osmaniye", "Tercüme Odası", "Mekteb-i Maarif"], "correctIndex": 0}'::jsonb,
  'Encümen-i Daniş (1851), Fransız Bilimler Akademisi örnek alınarak kurulan ilk Türk bilim akademisidir. Ahmet Cevdet Paşa ünlü ''Tarih-i Cevdet'' eserini bu kuruma sunmuştur.',
  'Encümen-i Daniş bilim akademisi ve ders kitabı telif heyetidir.',
  90
);

-- Soru #091 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1897 Osmanlı-Yunan Savaşı''nda Ethem Paşa komutasındaki Türk ordusunun Yunan ordusunu kesin bir hezimete uğrattığı, Mustafa Kemal''in Manastır Askeri İdadisi''nde öğrenci iken savaşa katılmak için okuldan kaçtığı tarihi meydan savaşı hangisidir?',
  '{"options": ["Dömeke Meydan Muharebesi", "Tesalya Savaşı", "Preveze Muharebesi", "Yanya Savaşı", "Kırkkilise Savaşı"], "correctIndex": 0}'::jsonb,
  '1897 Dömeke Meydan Savaşı, Osmanlı''nın meydanda kazandığı son büyük zaferdir. Mustafa Kemal 16 yaşındayken bu savaşa katılmak için arkadaşıyla okuldan kaçmış fakat yakalanarak geri getirilmiştir.',
  'Mustafa Kemal''in gençliğinde ''Gidip savaşmak için can attım'' dediği savaş 1897 Dömeke Savaşı''dır.',
  91
);

-- Soru #092 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 yılında Osmanlı Devleti''nin Girit''teki Rum isyanlarını yatıştırmak amacıyla Rumlara vergi muafiyeti, Hristiyan vali atanması ve Rumcanın resmi dil olmasını tanıdığı özerklik fermanı aşağıdakilerden hangisidir?',
  '{"options": ["Halepa Fermanı", "Tanzimat Fermanı", "Islahat Fermanı", "Vilayet Nizamnamesi", "Kanun-i Esasi"], "correctIndex": 0}'::jsonb,
  'Halepa Fermanı (1878), Girit''in adım adım Osmanlı''dan kopup Yunanistan''a bağlanmasına zemin hazırlayan özerklik belgesidir.',
  'Girit ile özdeşleşen ferman Halepa Fermanı''dır. 1908''de Girit Yunanistan''a katıldığını ilan etmiştir.',
  92
);

-- Soru #093 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Dünya harp tarihinde ''askeri uçak ve hava saldırısının'' ilk kez bir devlete karşı kullanıldığı savaş hangisidir ve hangi devlet tarafından kullanılmıştır?',
  '{"options": ["1911 Trablusgarp Savaşı - İtalya", "1914 I. Dünya Savaşı - Almanya", "1912 Balkan Savaşı - Bulgaristan", "1897 Osmanlı-Yunan Savaşı - Yunanistan", "1919 Kurtuluş Savaşı - İngiltere"], "correctIndex": 0}'::jsonb,
  'İtalya, 1911 Trablusgarp Savaşı''nda Türk mevzilerine karşı tarihte ilk kez askeri uçak kullanmış ve havadan bomba atmıştır. Türk askerleri ise tüfek ateşiyle tarihte ilk kez uçak düşürmeyi başarmıştır.',
  'Dünyada askeri uçağın ilk kullanıldığı savaş Trablusgarp Savaşı''dır (İtalya tarafından).',
  93
);

-- Soru #094 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1914 yılında İstanbul''dan Kahire''ye uzanan tarihi hava seferi sırasında Şam yakınlarında uçakları düşerek şehit olan ve Türk havacılık tarihinin ''ilk hava şehitleri'' kabul edilen pilotlarımız kimlerdir?',
  '{"options": ["Fethi Bey - Sadık Bey - Nuri Bey", "Cengiz Topel - Vecihi Hürkuş", "Ahmet Ali Çelikten - Vecihi Hürkuş", "Sabiha Gökçen - Vecihi Hürkuş", "Mehmet Ali Bey - Mazlum Keyüsk"], "correctIndex": 0}'::jsonb,
  'Yüzbaşı Fethi Bey ve Üsteğmen Sadık Bey Taberiye Gölü civarında şehit düşmüşlerdir. Muğla''nın Meğri kasabasına Fethi Bey''in anısına ''Fethiye'' adı verilmiştir.',
  'Fethiye ilçesinin adı ilk hava şehidimiz Fethi Bey''den gelmektedir.',
  94
);

-- Soru #095 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nda Osmanlı ordusunun hezimete uğraması üzerine 30 Mayıs 1913''te imzalanan Londra Antlaşması''na göre Osmanlı Devleti''nin batı sınırı hangi hat olarak belirlenmiştir?',
  '{"options": ["Midye - Enez Hattı", "Meriç Nehri", "Çatalca Hattı", "Karasu Hattı", "Tuna Hattı"], "correctIndex": 0}'::jsonb,
  'Londra Antlaşması ile Osmanlı Midye-Enez hattının batısındaki tüm topraklarını (Edirne, Kırklareli dahil tüm Doğu ve Batı Trakya ile Makedonya) kaybetmiştir.',
  'I. Balkan sonu sınırı Midye-Enez''dir. II. Balkan''da Edirne geri alınınca sınır Meriç Nehri olmuştur.',
  95
);

-- Soru #096 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı sırasında Yunan donanmasının Çanakkale Boğazı ablukasını kırarak Ege ve Akdeniz''de tek başına aylarca korsan savaşı yürüten, Yunan gemilerini batıran ve ''Hamidiye Kahramanı'' unvanını alan ünlü Türk denizcisi ve devlet adamı kimdir?',
  '{"options": ["Rauf Orbay", "Ali Çetinkaya", "Hasan Saka", "Fahrettin Altay", "Kazım Özalp"], "correctIndex": 0}'::jsonb,
  'Rauf Orbay, Hamidiye Kruvazörü ile dünya denizcilik tarihine geçen bir harekat icra etmiş ve halkın sevgilisi olarak ''Hamidiye Kahramanı'' unvanını almıştır.',
  'Hamidiye Kahramanı Rauf Orbay''dır; Mondros''u imzalayan ve Terakkiperver kurucusu olan liderdir.',
  96
);

-- Soru #097 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Balkan Savaşı''nın çıkış sebebi aşağıdakilerden hangisidir?',
  '{"options": ["I. Balkan Savaşı''nda Bulgaristan''ın en büyük payı (Ege kıyıları dahil) alması üzerine diğer Balkan devletlerinin (Yunanistan, Sırbistan, Karadağ ve Romanya) Bulgaristan''a saldırması", "Osmanlı''nın Atina''ya saldırması", "Rusya''nın Boğazları işgal etmesi", "Arnavutluk''un Sırbistan''ı işgal etmesi", "Avusturya''nın Bosna''yı ilhak etmesi"], "correctIndex": 0}'::jsonb,
  'Bulgaristan I. Balkan Savaşı''nda aslan payını alınca diğer müttefikleri Bulgaristan''a savaş açmıştır. Osmanlı da bu kargaşadan yararlanıp Edirne''yi savaşmadan geri almıştır.',
  'II. Balkan Savaşı Osmanlı''ya karşı değil; Bulgaristan''a karşı Balkan devletlerinin savaşıdır. Osmanlı fırsattan istifade Edirne''yi kurtarmıştır.',
  97
);

-- Soru #098 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Balkan Savaşı sırasında Osmanlı ordusunun başında Edirne ve Kırklareli''yi Bulgar işgalinden kurtararak ''Edirne Fatihi'' unvanını alan Osmanlı komutanı kimdir?',
  '{"options": ["Enver Paşa", "Mahmut Şevket Paşa", "Talat Paşa", "Cemal Paşa", "Mustafa Kemal Paşa"], "correctIndex": 0}'::jsonb,
  'Enver Paşa, II. Balkan Savaşı''nda Edirne''yi geri alarak büyük bir halk kahramanı olmuş, ''Edirne Fatihi'' unvanını almış ve ardından Harbiye Nazırı olmuştur.',
  'Edirne Fatihi unvanı Enver Paşa''ya aittir.',
  98
);

-- Soru #099 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Balkan Savaşı sonunda Balkan devletlerinin kendi aralarında sınırları yeniden çizmek amacıyla imzaladıkları ve Bulgaristan''ın mağlup olduğu antlaşma hangisidir?',
  '{"options": ["Bükreş Antlaşması (1913)", "İstanbul Antlaşması", "Atina Antlaşması", "Londra Antlaşması", "Belgrad Antlaşması"], "correctIndex": 0}'::jsonb,
  'Balkan devletleri kendi aralarında 1913 Bükreş Antlaşması''nı imzalamışlardır. Osmanlı bu antlaşmada yer almamış; ikili antlaşmalar yapmıştır.',
  'Balkan devletlerinin kendi aralarındaki antlaşma Bükreş''tir; Osmanlı''nın Bulgaristan''la yaptığı 1913 İstanbul, Yunanistan''la yaptığı 1913 Atina''dır.',
  99
);

-- Soru #100 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Balkan Savaşları''nın Osmanlı Devleti ve Türk toplumu üzerindeki en acı ve kalıcı sosyal sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Balkanlar''dan Anadolu''ya yüz binlerce Türk ve Müslümanın göç etmek zorunda kalması ve ''Balkan Muhacirleri'' sorununun doğması", "Anadolu''da tarımsal üretimin tamamen durması", "Gayrimüslimlerin askere alınmaya başlanması", "İstanbul''un başkentlikten çıkarılması", "Kapitülasyonların kendiliğinden kalkması"], "correctIndex": 0}'::jsonb,
  'Balkan Savaşları ile yüz binlerce soydaşımız katliamlardan kaçarak İstanbul ve Anadolu''ya sığınmış, bu göç Anadolu''da Türk nüfus oranını ciddi biçimde artırmış ve Türk milliyetçiliğini güçlendirmiştir.',
  'Balkan Savaşları Anadolu''daki Türk nüfus yoğunluğunu artırmış ve Türkçülük akımını devletin tek politikası haline getirmiştir.',
  100
);


-- -------------------------------------------------------------
-- KURTULUŞ SAVAŞI HAZIRLIK VE CEPHELER (80 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '1911-1912 Trablusgarp Savaşı öncesinde İtalya, Rusya ile imzaladığı gizli Racconigi Antlaşması ile Rusya''nın boğazlar üzerindeki emellerini serbest bırakırken Rusya da İtalya''nın Trablusgarp''ı işgaline onay vermiştir. Osmanlı Devleti donanması Haliç''te çürütüldüğü ve Mısır İngiliz işgalinde olduğu için bölgeye resmi ordu sevk edememiş; bunun üzerine genç subaylar gizlice Trablusgarp''a gitmiştir.

Mustafa Kemal''in ''Gazeteci Şerif Bey'' takma adıyla Derne ve Tobruk''ta, Enver Paşa''nın ise ''Kuyumcu Hamdi'' takma adıyla Bingazi''de yerli Berberi aşiretleri örgütleyerek İtalyanlara karşı gerilla direnişi başlattığı bu savaşın dünya askeri tarihindeki en önemli ilki aşağıdakilerden hangisidir?',
  '{"options": ["Tarihte ilk kez kimyasal gaz silahlarının kullanılması", "Dünya harp tarihinde ilk kez savaş uçağının (İtalya tarafından) keşif ve bombardıman amacıyla kullanılması", "İlk kez denizaltıların bir zırhlıyı batırması", "İlk kez telsiz ve radar teknolojisinin cephede denenmesi", "Tarihte ilk kez kadın savaşçıların muharip birlik kurması"], "correctIndex": 1}'::jsonb,
  '1911 Trablusgarp Savaşı''nda İtalyan ordusu dünya tarihinde ilk kez askeri amaçla tayyare (savaş uçağı) kullanmıştır. Türk direnişçileri tüfek ateşiyle bir İtalyan uçağını düşürerek dünya tarihinde uçak düşüren ilk güç olmuştur.',
  'ÖSYM Trablusgarp Savaşı''nın ilklerini çok sever: Mustafa Kemal''in ilk askeri başarısı ve sömürgeciliğe karşı ilk savaşıdır; İtalyanların tarihte ilk savaş uçağını kullandığı savaştır. Mustafa Kemal''in takma adı "Gazeteci Şerif Bey", Enver Paşa''nınki ise "Kuyumcu Hamdi"dir.',
  1
);

-- Soru #002 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Balkan Savaşları''nın patlak vermesi üzerine Osmanlı Devleti İtalya ile 1912 yılında İsviçre''de Uşi (Ouchy) Antlaşması''nı imzalamak zorunda kalmıştır.

Uşi Antlaşması''nda yer alan "Trablusgarp ve Bingazi halkı dini bakımdan Osmanlı Halifesine bağlı kalacaktır" maddesinin temel amacı aşağıdakilerden hangisidir?',
  '{"options": ["İtalya''nın İslamiyet''i resmi din olarak kabul etmesini sağlamak", "Bölge halkı ile kültürel ve manevi bağların koparılmasını engellemek", "Trablusgarp''tan düzenli vergi toplamaya devam etmek", "İtalya''nın Balkan Savaşları''nda Osmanlı yanında yer almasını sağlamak", "Rodos ve On İki Ada''yı kesin olarak Osmanlı toprağı yapmak"], "correctIndex": 1}'::jsonb,
  'Toprak kaybedilmesine rağmen halkın halifeye bağlı tutulması, bölge ile dini ve kültürel bağları sürdürme gayesidir. Osmanlı Devleti tarihinde hilafet makamını siyasi bir güç olarak sadece iki antlaşmada kullanmıştır: İlki 1774 Küçük Kaynarca (Kırım), ikincisi ve sonuncusu ise 1912 Uşi Antlaşması''dır (Trablusgarp).',
  'ÖSYM "Hilafet siyasi bir güç olarak hangi iki antlaşmada kullanılmıştır?" sorusunu sıkça yoklar: Küçük Kaynarca ve Uşi Antlaşması. Amaç toprak elden çıksa da kültürel bağı korumaktır.',
  2
);

-- Soru #003 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '1912 yılında Karadağ''ın saldırısıyla başlayan I. Balkan Savaşı''nda Bulgaristan, Yunanistan, Sırbistan ve Karadağ birleşerek Osmanlı Devleti''ne saldırmış ve Osmanlı ordusu çok kısa sürede ağır bir hezimete uğramıştır.

Aşağıdakilerden hangisi Osmanlı Devleti''nin I. Balkan Savaşı''nı kaybetmesinde doğrudan etkili olan en temel iç faktördür?',
  '{"options": ["Ordunun içine particilik ve siyasetin girmesi sonucu komutanlar arasındaki emir-komuta zincirinin kopması", "Osmanlı donanmasının Çanakkale Boğazı''ndan Ege Denizi''ne çıkamaması", "Padişah V. Mehmet Reşat''ın ordunun başında sefere çıkmaması", "Kutü''l-Amare''de ağır kayıplar verilmesi", "Kafkas Cephesi''ndeki Sarıkamış Harekatı''nın başarısızlıkla sonuçlanması"], "correctIndex": 0}'::jsonb,
  'I. Balkan Savaşı''nın kaybedilmesindeki 1 numaralı neden: İttihatçılar ve Hürriyet-İtilafçılar şeklinde ordunun içine particilik/siyaset girmesi ve bir fırkaya mensup subayın diğer fırkadaki subaya yardım etmemesidir. Mustafa Kemal bu faciayı görerek Cumhuriyet döneminde Erkan-ı Harbiye Kanunu ile orduyu siyasetten tamamen ayıracaktır.',
  'Adaylar savaşın kaybedilmesini sadece askeri sayı yetersizliğine bağlayabilir. Oysa temel iç neden savaştan hemen önce 65 bin tecrübeli askerin terhis edilmesi ve ordunun içine siyasetin (ikilik) girmesidir.',
  3
);

-- Soru #004 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Balkan Savaşı sırasında Osmanlı Devleti ile kara bağlantısı kopan ve bunu fırsat bilerek bağımsızlığını ilan eden; böylece Osmanlı Devleti''nden ayrılan son Balkan devleti olan ve ayrılışıyla Osmanlıcılık fikrinin tamamen iflas edip İslamcılık fikrinin ilk büyük darbeyi almasına yol açan devlet hangisidir?',
  '{"options": ["Bulgaristan", "Sırbistan", "Arnavutluk", "Karadağ", "Romanya"], "correctIndex": 2}'::jsonb,
  'Arnavutluk, 1912''de I. Balkan Savaşı devam ederken bağımsızlığını ilan ederek Osmanlı''dan ayrılan son Balkan devleti olmuştur. Halkının büyük kısmı Müslüman olmasına rağmen ayrılması İslamcılık (Ümmetçilik) fikrine vurulan ilk ağır darbedir.',
  'ÖSYM''nin en popüler sorusudur: İlk isyan eden = Sırplar; İlk bağımsız olan = Yunanlılar; Son bağımsız olan Balkan ülkesi = Arnavutluk. Bu ayrılıkla birlikte Osmanlıcılık tamamen çökmüş, Türkçülük yükselmiştir.',
  4
);

-- Soru #005 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nda yer almadığı halde, Bulgaristan''ın fazla toprak almasını kabullenemeyerek II. Balkan Savaşı''na katılan ve savaşı başlatan devlet ile bu kargaşadan yararlanarak Edirne ve Kırklareli''yi (Doğu Trakya) savaşarak geri alan ve "Edirne Fatihi" unvanını kazanan Osmanlı komutanı aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Romanya – Enver Paşa", "Karadağ – Rauf Orbay", "Sırbistan – Kazım Karabekir", "Yunanistan – Cemal Paşa", "Romanya – Mustafa Kemal"], "correctIndex": 0}'::jsonb,
  'I. Balkan Savaşı''nda olmayıp II. Balkan Savaşı''na katılan devlet Romanya''dır. Balkan devletleri kendi arasında savaşırken Enver Paşa komutasındaki Türk ordusu Midye-Enez hattını aşarak Edirne''yi geri almış ve Enver Paşa "Edirne Fatihi" olarak anılmıştır.',
  'ÖSYM "I. Balkan''da olmayıp II. Balkan''a katılan devlet kimdir?" (Romanya) ve "Edirne Fatihi kimdir?" (Enver Paşa) sorularını sıklıkla sorar. Mustafa Kemal ile Enver Paşa unvanları karıştırılmamalıdır.',
  5
);

-- Soru #006 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''nda Osmanlı Devleti''nin açtığı cepheler taarruz, savunma ve müttefiklere yardım cepheleri olarak üçe ayrılır.

Buna göre, Osmanlı Devleti''nin kendi sınırları dışında müttefiklerine yardım amacıyla savaştığı Yardım Cepheleri aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Kafkasya – Kanal – Çanakkale", "Galiçya – Makedonya – Romanya", "Irak – Suriye – Filistin", "Hicaz – Yemen – Trablusgarp", "Kafkasya – Galiçya – Romanya"], "correctIndex": 1}'::jsonb,
  'Osmanlı Devleti''nin kendi sınırları dışında savaştığı Yardım Cepheleri: Galiçya, Makedonya ve Romanya''dır (Sonları "-ya" ile biter). Taarruz cepheleri: Kafkasya ve Kanal''dır (KAKA). Diğerleri savunma cepheleridir.',
  'Şifreleme kuralı: Sonu "-ya" ile biten üç cephe (Galiçya, Makedonya, Romanya) sınır dışı yardım cepheleridir.',
  6
);

-- Soru #007 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''nda Enver Paşa komutasında açılan, Kars, Ardahan ve Batum''u geri almak, Turancılık (Pantürkizm) ülküsüyle Orta Asya Türkleri ile birleşmek ve Bakü petrollerine ulaşmak amacıyla taarruz edilen Kafkasya Cephesi ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Hasan İzzet Paşa''nın kış şartları uyarısına rağmen başlatılan Sarıkamış Harekâtı ağır bir donma felaketiyle sonuçlanmıştır.", "Ruslarla iş birliği yapan Ermenilerin katliamları üzerine 1915 yılında Sevk ve İskân (Tehcir) Kanunu çıkarılmıştır.", "16. Kolordu Komutanı Tuğgeneral Mustafa Kemal Muş ve Bitlis''i Rus işgalinden geri alarak Altın Kılıç madalyası kazanmıştır.", "1918 Brest-Litovsk Antlaşması ile Çarlık Rusyası savaştan çekilmiş ve Elviye-i Selase (Kars, Ardahan, Batum) Osmanlı''ya verilmiştir.", "Bu cephede Türk ordularına Doğu Cephesi Komutanı sıfatıyla Kazım Karabekir Paşa komuta etmiştir."], "correctIndex": 4}'::jsonb,
  'Kafkasya Cephesi''nde Kazım Karabekir yer almamıştır! Kazım Karabekir Kurtuluş Savaşı sırasında (1920) TBMM Doğu Cephesi Komutanı olarak 15. Kolordu''nun başında Ermenilerle savaşacaktır. Kafkas Cephesi komutanları Enver Paşa, Ahmet İzzet Paşa ve Mustafa Kemal''dir.',
  'Ramazan Yetgin notlarında kalın harflerle altı çizilen uyarı: "DİKKAT! Kafkasya Cephesi''nde Kazım Karabekir YOKTUR! Karabekir Kurtuluş Savaşı Doğu Cephesi''ndedir."',
  7
);

-- Soru #008 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '18 Mart 1915 Çanakkale Deniz Zaferi''nin mimarı olan, Boğaz''a döşettiği mayınlar ve top bataryaları ile müttefik armadasını püskürterek tarihe "18 Mart Kahramanı" olarak geçen Osmanlı komutanı aşağıdakilerden hangisidir?',
  '{"options": ["Mustafa Kemal Paşa", "Cevat Paşa (Çobanlı)", "Fevzi Çakmak", "Liman von Sanders", "Enver Paşa"], "correctIndex": 1}'::jsonb,
  'Çanakkale Deniz Savaşları''nın müstahkem mevkii komutanı ve "18 Mart Kahramanı" unvanlı komutanı Cevat Paşa (Çobanlı)''dır. Mustafa Kemal ise deniz savaşlarında değil, 25 Nisan''da başlayan Çanakkale Kara Savaşları''nda Anafartalar Grup Komutanı olarak efsaneleşmiştir.',
  'ÖSYM "18 Mart Kahramanı kimdir?" sorusunda doğrudan Cevat Paşa''yı sorar. Adayların ezbere Mustafa Kemal şıkkına gitmesi en büyük sınav tuzağıdır.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa''nın I. Dünya Savaşı boyunca mücadele ettiği üç cephe kronolojik sırasıyla aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Kafkasya $ → $ Çanakkale $ → $ Suriye-Filistin", "Çanakkale $ → $ Kafkasya $ → $ Suriye-Filistin", "Çanakkale $ → $ Irak $ → $ Hicaz", "Kanal $ → $ Çanakkale $ → $ Kafkasya", "Suriye-Filistin $ → $ Çanakkale $ → $ Kafkasya"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal I. Dünya Savaşı''nda sırasıyla: 1. Çanakkale Cephesi (Tekirdağ 19. Tümen / Anafartalar), 2. Kafkasya Cephesi (16. Kolordu / Muş ve Bitlis fethi), 3. Suriye-Filistin Cephesi (Yıldırım Orduları Grup Komutanlığı) olmak üzere üç cephede savaşmıştır [Şifre: ÇIKIŞ / Ç-K-S].',
  'ÖSYM cephelerin kronolojik sırasını ve Mustafa Kemal''in savaştığı yerleri çok sever. Mustafa Kemal Irak veya Kanal cephelerinde bulunmamıştır.',
  9
);

-- Soru #010 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '29 Nisan 1916 tarihinde Irak Cephesi''nde Halil Paşa komutasındaki Osmanlı ordusunun İngiliz tümenini kuşatarak General Townshend dahil 13 binden fazla İngiliz subay ve askerini esir aldığı ve İngiliz İmparatorluğu tarihinin en büyük askeri hezimetlerinden biri kabul edilen tarihi zafer aşağıdakilerden hangisidir?',
  '{"options": ["Kutü''l-Amare Zaferi", "Selman-ı Pak Zaferi", "Frenk Yazısı Zaferi", "Gazze Zaferi", "Dömeke Zaferi"], "correctIndex": 0}'::jsonb,
  'Kutü''l-Amare Zaferi (1916), Irak Cephesi''nde Halil Paşa (Kut) komutasında kazanılan muazzam bir askeri zaferdir. General Townshend esir alınmış ve Halil Paşa "Kutü''l-Amare Kahramanı" unvanını almıştır.',
  'Kutü''l-Amare Zaferi son yıllarda MEB ve KPSS müfredatında en çok öne çıkarılan zaferdir. Komutanı Halil Kut Paşa''dır.',
  10
);

-- Soru #011 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Hicaz-Yemen Cephesi''nde İngiliz ajanı Lawrence ile iş birliği yapan Şerif Hüseyin kabilelerine ve İngiliz kuşatmasına karşı Medine''yi 2 yıl 7 ay boyunca teslim etmeyen; askerlerine çekirge yedirerek Hz. Muhammed''in kabrini müdafaa eden ve tarihe "Çöl Aslanı", "Çöl Kaplanı" ve "Medine Müdafii" unvanlarıyla geçen kahraman komutanımız kimdir?',
  '{"options": ["Süleyman Askeri Bey", "Fahrettin Paşa (Türkkan)", "Ali Fuat Cebesoy", "Kazım Karabekir", "Refet Bele"], "correctIndex": 1}'::jsonb,
  'Medine Müdafii ve Çöl Kaplanı Fahrettin Paşa (Türkkan)''dır. Kuşatma altındayken Kutsal Emanetleri yağmalanmaktan kurtararak İstanbul''a göndermiştir. Yaşadıkları "Medine Müdafaası" kitabına konu olmuştur.',
  'ÖSYM Fahrettin Paşa''nın lakaplarını (Çöl Kaplanı / Çöl Aslanı / Medine Müdafii) doğrudan soru kökünde sorar.',
  11
);

-- Soru #012 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'I. Dünya Savaşı devam ederken İtilaf Devletleri Osmanlı topraklarını kendi aralarında paylaşmak amacıyla gizli antlaşmalar yapmışlardır.

1917 yılında Rusya''da meydana gelen Bolşevik İhtilali sonrasında iktidara gelen Sovyet hükümetinin Çarlık arşivlerindeki bu gizli paylaşım antlaşmalarını "Sarı Kitap" ile dünya kamuoyuna ifşa etmesinin ardından; İngiltere ve Fransa''nın İtalya''ya vaat ettiği İzmir ve çevresini 1919 Paris Barış Konferansı''nda Yunanistan''a devretmesi İtilaf Devletleri arasında aşağıdakilerden hangisine yol açmıştır?',
  '{"options": ["İttifak bloğunun savaşı kazanmasına", "İtilaf Devletleri arasında ilk kez derin bir görüş ayrılığı ve çıkar çatışmasının doğmasına", "İtalya''nın derhal Osmanlı safına geçerek savaşa girmesine", "Mondros Ateşkes Antlaşması''nın iptal edilmesine", "Amerika Birleşik Devletleri''nin Milletler Cemiyeti''ni feshetmesine"], "correctIndex": 1}'::jsonb,
  '1919 Paris Barış Konferansı''nda İngiltere, Doğu Akdeniz''de güçlü bir İtalya yerine kendi güdümünde zayıf bir Yunanistan görmeyi yeğlemiş ve İzmir''i İtalya''dan alıp Yunanlılara vermiştir. Bu durum İtilaf devletleri arasındaki ilk büyük çatlak ve görüş ayrılığı olmuştur (İtalya bu yüzden Kurtuluş Savaşı''nda TBMM ile çatışmamış ve ilk çekilen itilaf devleti olmuştur).',
  'ÖSYM "İtilaf devletleri arasındaki ilk görüş ayrılığı nerede yaşandı?" sorusunu sorar. Cevap kesinlikle 1919 Paris Barış Konferansı''dır (İzmir meselesi).',
  12
);

-- Soru #013 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '30 Ekim 1918 tarihinde Limni Adası''nın Mondros Limanı''nda Agamemnon zırhlısında imzalanan Mondros Ateşkes Antlaşması''nın;

"İtilaf Devletleri, güvenliklerini tehdit edecek bir durumun ortaya çıkması halinde herhangi bir stratejik noktayı işgal etme hakkına sahip olacaktır." şeklindeki 7. Maddesinin temel amacı aşağıdakilerden hangisidir?',
  '{"options": ["Doğu Anadolu''da bağımsız bir Ermenistan devleti kurmak", "Anadolu''nun tamamını hukuki gerekçe üreterek işgale açık hale getirmek", "Osmanlı ordusunun silahlarını denetim altına almak", "Boğazları Türk idaresine bırakmak", "Osmanlı padişahının otoritesini korumak"], "correctIndex": 1}'::jsonb,
  'Mondros''un 7. maddesi antlaşmanın en tehlikeli maddesidir; İtilaf devletleri istedikleri her yeri "güvenliğimiz tehdit altında" bahanesiyle işgal edebilmek için ucu açık bir işgal kılıfı hazırlamışlardır. 24. madde ise Vilayet-i Sitte''de Ermenistan kurma maddesidir.',
  'ÖSYM 7. Madde ile 24. Maddeyi karşılaştırır: 7. Madde = Tüm Anadolu''yu işgale açık hale getirme; 24. Madde = Megali Armenia (Büyük Ermenistan) kurma hedefidir.',
  13
);

-- Soru #014 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mondros Ateşkes Antlaşması''ndan sonra başlayan işgallere karşı Türk milletinin gösterdiği ilk tepkilerle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Mondros''tan sonra ilk işgal edilen Osmanlı toprağı $ → $ Musul (İngiltere)", "Mondros''tan sonra Anadolu sınırları içinde ilk işgal edilen yer $ → $ Hatay-Dörtyol (Fransa)", "İşgallere karşı ilk silahlı halk direnişinin başladığı yer $ → $ Hatay-Dörtyol (Kara Hasan Paşa)", "İzmir''in işgaline karşı ilk kurşunu atan gazeteci $ → $ Hasan Tahsin (Osman Nevres)", "İzmir''in işgalinin ilk protesto edildiği miting $ → $ Sultanahmet Mitingi"], "correctIndex": 4}'::jsonb,
  'İzmir''in işgalinin ilk protesto edildiği yer İstanbul değil; Mustafa Kemal''in talimatıyla düzenlenen Havza Mitingidir (Havza Genelgesi sonrası). Sultanahmet ve Kadıköy mitingleri (Halide Edip''in konuştuğu) Havza''dan sonra yapılmıştır.',
  'Ramazan Yetgin notlarında kalın altı çizili uyarı: "İzmir''in işgalinin ilk protesto edildiği yer Havza''dır!" Sultanahmet en kalabalık olanıdır ama ilk değildir.',
  14
);

-- Soru #015 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İzmir''in Yunanlılar tarafından işgal edilmesinden sonra bölgedeki katliam iddialarını incelemek üzere bölgeye gönderilen ve hazırladığı raporda;

"Bölgede Rumların değil Türklerin çoğunlukta olduğunu, katliamlardan Yunan ordusunun sorumlu olduğunu ve işgalin haksız olduğunu" belirterek Türk Milli Mücadelesi''nin haklılığını uluslararası alanda tescil eden ilk resmi belge aşağıdakilerden hangisidir?',
  '{"options": ["General Harbord Raporu", "Amiral Bristol Raporu", "Sandler Raporu", "Milne Raporu", "King-Crane Raporu"], "correctIndex": 1}'::jsonb,
  'Amiral Bristol Raporu, Batı Anadolu''daki Türk haklılığını dünyaya duyuran ilk uluslararası rapordur. General Harbord Raporu ise Doğu Anadolu''daki Ermeni iddialarını çürüten rapordur.',
  'ÖSYM Bristol (Batı Anadolu - Rum/Yunan haksızlığı) ile Harbord (Doğu Anadolu - Ermeni haksızlığı) raporlarını sürekli karşılaştırır.',
  15
);

-- Soru #016 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Milli Mücadele Dönemi''nde faaliyet gösteren cemiyetler ile ilgili;
I. Trakya Paşaeli Cemiyeti: Osmanlı''nın yıkılması halinde "Trakya Cumhuriyeti" adıyla yeni bir devlet kurmayı tüzüğüne koyan cemiyettir.
II. Milli Kongre Cemiyeti: Kurucusu Dr. Esat Işık olup milli mücadelede "Kuvay-ı Milliye" tabirini ilk kez kullanan ve basın-yayın yolunu benimseyen cemiyettir.
III. Kilikyalılar Cemiyeti: Adana ve Çukurova bölgesini Fransız ve Ermeni işgalinden kurtarmak amacıyla kurulan yararlı bir cemiyettir.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de yararlı cemiyetlere ait en kilit KPSS bilgileridir. Trakya Paşaeli devlet kurma fikri olan cemiyettir; Dr. Esat Işık Kuvay-ı Milliye tabirini ilk kullanan kişidir; Kilikyalılar ise adı yabancı gibi gelse de Adana''yı savunan milli bir cemiyettir.',
  'Kilikyalılar Cemiyeti isminden dolayı adaylar tarafından sıklıkla zararlı azınlık cemiyeti zannedilir. Kilikyalılar milli ve yararlı bir cemiyettir.',
  16
);

-- Soru #017 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  '21-22 Haziran 1919''da yayımlanan Amasya Genelgesi''nin hazırlanmasında ve onaylanmasında Mustafa Kemal Paşa''nın yanı sıra Rauf Orbay, Ali Fuat Cebesoy, Refet Bele bizzat bulunmuş; Kazım Karabekir ve Cemal Paşa ise telgrafla onay vermiştir.

Mustafa Kemal''in genelgeyi tek başına yayımlamak yerine ordu komutanlarının ortak imzasıyla yayımlamasının temel amacı ve genelgede yer almayan komutan aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Milli Mücadeleyi kişisellikten çıkarıp milletin malı haline getirmek – İsmet İnönü", "Padişahın onayını almak – Kazım Karabekir", "Sovyet Rusya''dan yardım sağlamak – Ali Fuat Cebesoy", "İstanbul Hükümeti ile anlaşmak – Rauf Orbay", "İtilaf devletlerine gözdağı vermek – Fevzi Çakmak"], "correctIndex": 0}'::jsonb,
  'Mustafa Kemal genelgeyi çok imzalı yaparak hareketi tek bir kişinin isyanı görüntüsünden çıkarmış ve kurumsallaştırmıştır. Bu metinde İsmet İnönü''nün imzası veya onayı YOKTUR! (İsmet Paşa o tarihte henüz İstanbul''dadır).',
  'ÖSYM Amasya Genelgesi''nde imzası olanları sorarken şıklara istisnasız İsmet İnönü''yü çeldirici koyar. İsmet İnönü Amasya Genelgesi''nde yoktur!',
  17
);

-- Soru #018 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Amasya Genelgesi''nde yer alan;

"Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır."

maddesi Kurtuluş Savaşı''nın hangi iki temel unsurunu ilk kez açıkça belirlemiştir?',
  '{"options": ["Gerekçesi ve Savaş Alanı", "Amacı ve Yöntemi", "Finansmanı ve Dış Desteği", "Lider kadrosu ve Ordusu", "Hukuki dayanağı ve İttifakları"], "correctIndex": 1}'::jsonb,
  '"Milletin bağımsızlığı" Kurtuluş Savaşı''nın Amacı; "milletin azim ve kararı" ise bu savaşın Yöntemidir (aynı zamanda üstü kapalı olarak halk egemenliğine/cumhuriyete geçileceğinin ilk müjdesidir). Gerekçe ise vatanın bütünlüğünün tehlikede olmasıdır.',
  'ÖSYM formülü: "Vatanın bütünlüğü tehlikededir" = Gerekçe; "Milletin bağımsızlığını milletin azim ve kararı kurtaracaktır" = Amaç ve Yöntem.',
  18
);

-- Soru #019 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa''nın çok sevdiği askerlik mesleğinden istifa ederek "Sine-i millete döndüğü" ve artık sivil bir fert olarak mücadeleye devam ettiği tarihsel dönüm noktası aşağıdakilerin hangisinde doğru belirtilmiştir?',
  '{"options": ["Havza Genelgesi''nden önce", "Amasya Genelgesi''nden sonra – Erzurum Kongresi''nden önce", "Sivas Kongresi''nden sonra", "Amasya Görüşmeleri sırasında", "TBMM açıldıktan hemen sonra"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal 7-8 Temmuz 1919 gecesi saraydan gelen azil telgrafı üzerine resmi görevinden ve askerlikten istifa etmiştir. Bu olay Amasya Genelgesi''nden sonra, Erzurum Kongresi''nden öncedir. Mustafa Kemal''in sivil bir vatandaş olarak yaptığı ilk çalışma Erzurum Kongresi''dir.',
  'ÖSYM istifanın yerini tam kronolojik aralık olarak sorar: Amasya''dan sonra, Erzurum''dan önce.',
  19
);

-- Soru #020 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Toplanış amacı ve delege yapısı bakımından bölgesel, aldığı kararlar ve temsil kabiliyeti bakımından ulusal olan Erzurum Kongresi (1919) ile ilgili aşağıdakilerden hangisi söylenemez?',
  '{"options": ["Milli sınırlardan (Misak-ı Milli) ilk kez bahsedilmiştir.", "Manda ve himaye fikri ilk kez açıkça reddedilmiştir.", "Tüm cemiyetler Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti adı altında birleştirilmiştir.", "Kuvay-ı Milliye''yi amil, milli iradeyi hakim kılmak esastır maddesiyle rejim değişikliği hedeflenmiştir.", "9 kişiden oluşan ve başkanlığını Mustafa Kemal''in yaptığı Temsil Heyeti kurulmuştur."], "correctIndex": 2}'::jsonb,
  'Tüm milli cemiyetlerin Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (ARMHC) çatısı altında birleştirilmesi Erzurum Kongresi''nde değil, Sivas Kongresi''nde gerçekleşmiştir. Erzurum''da sadece Doğu cemiyetleri birleştirilmiştir.',
  'ÖSYM Erzurum ile Sivas Kongresi kararlarını sürekli birbirine katar. Manda ve himayenin İLK reddi = Erzurum; KESİN reddi ve cemiyetlerin birleşmesi = Sivas.',
  20
);

-- Soru #021 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'Sivas Kongresi''nde (4-11 Eylül 1919) Temsil Heyeti''nin Ali Fuat Cebesoy Paşa''yı Batı Cephesi Kuvay-ı Milliye Genel Komutanlığı''na ataması, Temsil Heyeti''nin devlet yönetimi açısından hangi gücü ilk kez bir hükümet gibi kullandığının kanıtıdır?',
  '{"options": ["Yasama Gücü", "Yürütme Gücü", "Yargı Gücü", "Diplomasi Gücü", "Denetleme Gücü"], "correctIndex": 1}'::jsonb,
  'Bir komutanı veya memuru bir makama atamak Yürütme (icra) yetkisidir. Temsil Heyeti Ali Fuat Paşa''yı Batı Cephesi''ne atayarak bir yürütme organı (hükümet) gibi hareket ettiğini ilk kez göstermiştir.',
  'ÖSYM atama işlemlerinin doğrudan "Yürütme Yetkisi" olduğu yorumunu KPSS sınavlarında defalarca sorgulamıştır.',
  21
);

-- Soru #022 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Sivas Kongresi''nin başarıyla tamamlanmasının ardından Temsil Heyeti''nin İstanbul Hükümeti ile tüm resmi telgraf ve haberleşmeyi kesmesi üzerine, baskılara dayanamayan Damat Ferit Paşa istifa etmek zorunda kalmış ve yerine Milli Mücadele''ye ılımlı Ali Rıza Paşa hükümeti kurulmuştur.

Damat Ferit Paşa hükümetinin düşürülmesi, Temsil Heyeti''nin İstanbul Hükümeti karşısında kazandığı ne tür bir zaferdir?',
  '{"options": ["İlk askeri zafer", "İlk siyasi / diplomatik zafer", "İlk ekonomik zafer", "İlk uluslararası anlaşma zaferi", "İlk yargı zaferi"], "correctIndex": 1}'::jsonb,
  'Damat Ferit Paşa''nın istifa ettirilmesi, Temsil Heyeti''nin ve Mustafa Kemal''in İstanbul Hükümeti karşısında elde ettiği ilk siyasi zaferdir.',
  'İlk askeri zafer Gümrü veya I. İnönü''dür; Damat Ferit''in istifası ise doğrudan siyasi bir başarıdır.',
  22
);

-- Soru #023 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '20-22 Ekim 1919''da İstanbul Hükümeti adına Bahriye Nazırı Salih Paşa ile Temsil Heyeti adına Mustafa Kemal Paşa arasında gerçekleşen Amasya Görüşmeleri''nin (Amasya Protokolü) en temel tarihi önemi aşağıdakilerden hangisidir?',
  '{"options": ["İstanbul Hükümeti''nin Sevr Antlaşması''nı iptal ettiğini açıklaması", "İstanbul Hükümeti''nin Temsil Heyeti''ni ve Anadolu hareketini ilk kez resmen ve hukuken tanıması", "Kuvay-ı Milliye''nin lağvedilerek düzenli ordunun kurulması", "Mustafa Kemal''in İstanbul Hükümeti''ne sadrazam olarak atanması", "TBMM''nin açılmasına İtilaf devletlerinin onay vermesi"], "correctIndex": 1}'::jsonb,
  'İstanbul Hükümeti''nin bir bakanını Temsil Heyeti ile müzakereye göndermesi ve protokol imzalaması, Temsil Heyeti''nin İstanbul Hükümeti tarafından ilk kez resmen ve hukuken tanındığı anlamına gelir.',
  'ÖSYM ilk tanınmaları karşılaştırır: Temsil Heyeti''ni ilk tanıyan Osmanlı hükümeti = Amasya Görüşmeleri; TBMM''yi tanıyan ilk devlet = Ermenistan; ilk İtilaf devleti = Fransa.',
  23
);

-- Soru #024 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'Son Osmanlı Mebusan Meclisi''nde Felah-ı Vatan grubu tarafından 12 Ocak 1920''de kabul edilen ve Türk bağımsızlık mücadelesinin asgari şartlarını içeren Misak-ı Millî (Milli Yemin) kararlarında;

I. Kapitülasyonların kesinlikle kaldırılması,
II. Boğazların dünya ticaretine açılması şartının Marmara ve İstanbul''un güvenliğine bağlanması,
III. Kars, Ardahan, Batum (Elviye-i Selase), Batı Trakya ve Arap vilayetlerinde gerekirse halk oylaması (plebisit) yapılması,
IV. Milli iradenin hakim kılınması amacıyla Cumhuriyet rejimine geçilmesi

konularından hangileri yer almaz?',
  '{"options": ["Yalnız I", "Yalnız IV", "I ve II", "II ve III", "III ve IV"], "correctIndex": 1}'::jsonb,
  'Misak-ı Millî kararlarında ULUSAL EGEMENLİK VE CUMHURİYETLE İLGİLİ HİÇBİR HÜKÜM YOKTUR! Misak-ı Millî yalnızca ulusal bağımsızlık ve vatan sınırları ile ilgilidir. Padişaha bağlı mebusların da oyunu alabilmek için rejim tartışmasından kaçınılmıştır.',
  'ÖSYM''nin en büyük ters köşe sorusudur: Misak-ı Millî''de kapitülasyon, boğazlar, azınlık, sınırlar ve halk oylaması vardır; ancak "milli egemenlik / cumhuriyet" maddesi kesinlikle yoktur!',
  24
);

-- Soru #025 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İtilaf Devletleri''nin Misak-ı Millî kararlarına tepki olarak 16 Mart 1920''de İstanbul''u resmen işgal etmesi ve Mebusan Meclisi''ni basarak milletvekillerini Malta''ya sürgüne göndermesi üzerine;

Bu işgali Ankara''daki Mustafa Kemal''e canı pahasına mors alfabesiyle anbean bildiren ve daha sonra Mustafa Kemal tarafından kendisine "Martonaltı" soyadı verilen kahraman telgrafçı kimdir?',
  '{"options": ["Yahya Kaptan", "Manastırlı Hamdi Bey", "Sütçü İmam", "Şahin Bey", "Topal Osman"], "correctIndex": 1}'::jsonb,
  'İstanbul''un işgalini Ankara''ya ulaştıran kahraman telgrafçı Manastırlı Hamdi Bey''dir. Mustafa Kemal Soyadı Kanunu çıktığında kendisine 16 Mart işgal gününe izafeten "Martonaltı" soyadını vermiştir.',
  'Adaylar Nutuk''ta çokça adı geçen Yahya Kaptan ile telgrafçı Manastırlı Hamdi Bey''i karıştırabilir.',
  25
);

-- Soru #026 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '23 Nisan 1920''de açılan I. TBMM''nin özellikleri ile ilgili olarak aşağıda verilen yargılardan hangisi yanlıştır?',
  '{"options": ["Yeni bir devlet, düzenli bir ordu ve yeni bir anayasa kurduğu için ''Kurucu Meclis''tir.", "İstanbul Hükümeti ve işgalci İtilaf Devletleri''ne açıkça başkaldırdığı için ''İhtilalci Meclis''tir.", "Hızlı karar alabilmek amacıyla yasama, yürütme ve yargı erklerini kendisinde toplayarak ''Güçler Birliği'' ilkesini benimsemiştir.", "Toplumsal ve hukuki alanda köklü Batılılaşma inkılaplarını gerçekleştirdiği için ''Radikal İnkılapçı Meclis''tir.", "Üyelerinin tamamı Türk milletinin temsilcilerinden oluştuğu için ''Ulusçu (Milli) Meclis''tir."], "correctIndex": 3}'::jsonb,
  'I. TBMM inkılapçı bir meclis DEĞİLDİR! Önceliği vatanı düşmandan kurtarmak olduğu için toplumda bölünmeye yol açmamak adına inkılap yapmaktan kaçınmıştır. I. TBMM''nin yaptığı tek inkılap 1 Kasım 1922''de Saltanatı kaldırmaktır. Asıl inkılapçı meclis II. TBMM''dir (1923-1927).',
  'ÖSYM''nin en meşhur "I. Meclis inkılapçı mıdır?" sorusudur. I. Meclis savaşçı ve kurucudur, inkılapçı değildir (tek istisnası saltanattır).',
  26
);

-- Soru #027 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. TBMM bünyesinde farklı fikirleri temsil eden çeşitli gruplar bulunmaktaydı.

Aşağıdakilerden hangisi I. TBMM içerisinde yer alan siyasi gruplardan biri değildir?',
  '{"options": ["Müdafaa-i Hukuk Grubu", "Tesanüt Grubu", "Yeşil Ordu Grubu", "Felah-ı Vatan Grubu", "Halk Zümresi"], "correctIndex": 3}'::jsonb,
  'Felah-ı Vatan Grubu, Ankara''daki I. TBMM''de değil; son Osmanlı Mebusan Meclisi''nde Rauf Orbay başkanlığında kurulan ve Misak-ı Millî''yi kabul ettiren gruptur. I. TBMM''deki gruplar ise: Müdafaa-i Hukuk, Tesanüt, Yeşil Ordu, İstiklal, Islahat ve Halk Zümresi''dir.',
  'ÖSYM I. TBMM grupları arasına daima Felah-ı Vatan''ı çeldirici olarak yerleştirir. Felah-ı Vatan Osmanlı meclisindedir!',
  27
);

-- Soru #028 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa başkanlığında açılan I. TBMM''nin yasama faaliyeti olarak çıkardığı ilk kanun aşağıdakilerden hangisidir?',
  '{"options": ["Hıyanet-i Vataniye Kanunu", "Ağnam Vergisinin Dört Katına Çıkarılması Hakkında Kanun", "Firariler Kanunu", "Teşkilat-ı Esasiye Kanunu", "Men-i Müskirat Kanunu"], "correctIndex": 1}'::jsonb,
  'I. TBMM''nin kabul ettiği 1 Numaralı Kanun, mali kaynak yaratmak amacıyla çıkarılan Ağnam Vergisinin (küçükbaş hayvan vergisi) 4 katına çıkarılmasına dair kanundur. 2 numaralı kanun ise Hıyanet-i Vataniye Kanunu''dur.',
  'Adayların çoğu ilk kanunun Hıyanet-i Vataniye veya Teşkilat-ı Esasiye olduğunu düşünür. 1 Numaralı kanun Ağnam vergisidir.',
  28
);

-- Soru #029 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. TBMM''ye karşı çıkarılan isyanlar; İstanbul Hükümeti''nin bizzat çıkardığı, İtilaf Devletleri ile ortaklaşa çıkarılan, azınlıkların çıkardığı ve önceden Kuvay-ı Milliyeci olup sonradan ayaklananlar olmak üzere gruplandırılır.

Buna göre, başlangıçta milli mücadeleye hizmet ettiği halde düzenli ordunun emri altına girmeyi reddederek I. İnönü Savaşı sırasında TBMM''ye karşı ayaklanan Kuvay-ı Milliyeci lider kimdir?',
  '{"options": ["Ahmet Anzavur", "Çerkez Ethem", "Delibaş Mehmet", "Şeyh Recep", "Zeynel Abidin"], "correctIndex": 1}'::jsonb,
  'Kuvay-ı Seyyare komutanı Çerkez Ethem, düzenli ordunun disiplini altına girmek istemeyerek I. İnönü Savaşı sürerken TBMM''ye isyan etmiş; İsmet İnönü komutasındaki düzenli ordu hem Yunanlıları hem de Çerkez Ethem''i bertaraf etmiştir.',
  'Ahmet Anzavur İstanbul Hükümeti''nin paralı isyancısıdır. Eski Kuvay-ı Milliyeci olup sonradan isyan edenler Çerkez Ethem ve Demirci Mehmet Efe''dir.',
  29
);

-- Soru #030 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '10 Ağustos 1920 Sevr Barış Antlaşması''nı Osmanlı Devleti''ne zorla kabul ettirmek amacıyla İngilizlerin desteğiyle Yunan ordusunun Milne Hattı''nı aşarak Bursa ve Uşak''ı işgal etmesi üzerine;

Bursa''nın işgalinin yarattığı derin teessür ve matem sebebiyle TBMM riyaset (başkanlık) kürsüsüne örtülen ve Bursa kurtarılıncaya kadar kaldırılmayan simgesel örtüye ne ad verilmiştir?',
  '{"options": ["Puşide-i Siyah (Siyah Örtü)", "Gülbank Örtüsü", "Hilafet Sancağı", "İstiklal Bayrağı", "Matem-i Milli"], "correctIndex": 0}'::jsonb,
  'Bursa''nın işgali üzerine TBMM meclis kürsüsüne Puşide-i Siyah (Kara Örtü) örtülmüş ve 2 yıl boyunca kurtuluşa kadar orada tutulmuştur.',
  'Ramazan Yetgin notlarında özel olarak geçen bir KPSS soru kalıbıdır: "Bursa''nın işgali üzerine meclis kürsüsüne Puşide-i Siyah (siyah örtü) serilmiştir."',
  30
);

-- Soru #031 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Ekim 1920''de Kuvay-ı Milliye komutanı Ali Fuat Cebesoy''un emrindeki birliklerle Yunan işgal kuvvetlerine karşı icra ettiği, ancak hezimetle sonuçlanarak Kuvay-ı Milliye birliklerinin kaldırılarak düzenli ordunun kurulmasını zorunlu hale getiren askeri harekât aşağıdakilerden hangisidir?',
  '{"options": ["Büyük Taarruz", "Gediz Taarruzu", "Dumlupınar Muharebesi", "İnönü Taarruzu", "Aslıhanlar Muharebesi"], "correctIndex": 1}'::jsonb,
  'Gediz Taarruzu''nda Kuvay-ı Milliye disiplinsizliği sebebiyle ağır mağlubiyet alınmıştır. Bunun üzerine Ali Fuat Cebesoy Moskova Büyükelçiliği''ne atanmış, Kuvay-ı Milliye feshedilerek düzenli ordu kurulmuştur.',
  'ÖSYM Gediz Taarruzu''nun sonucunu ve Ali Fuat Cebesoy''un atandığı yeri (Moskova Büyükelçiliği) sınavda doğrudan sorgulamıştır.',
  31
);

-- Soru #032 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '3 Aralık 1920 tarihinde Kazım Karabekir komutasındaki 15. Kolordu''nun Ermenileri mağlup etmesiyle imzalanan Gümrü Barış Antlaşması''nın Türk diplomasisi ve TBMM açısından en temel önemi aşağıdakilerden hangisidir?',
  '{"options": ["TBMM Hükümeti''nin uluslararası alanda kazandığı ilk askeri ve siyasi zafer olması, Sevr''i geçersiz sayan ilk antlaşma olması", "Doğu sınırımızın nihai ve kesin olarak çizilmesi", "Ermenistan''ın Sovyet Rusya''ya katıldığını ilan etmesi", "Kafkasya''daki tüm petrol sahalarının Türkiye''ye devredilmesi", "Güney Cephesi''nin tamamen kapanması"], "correctIndex": 0}'::jsonb,
  'Gümrü Antlaşması ile Ermenistan Sevr''deki taleplerinden vazgeçmiş, Misak-ı Millî''yi tanımış ve TBMM''yi tanıyan ilk devlet olmuştur. Resmi bir antlaşma metninde ilk kez "Türkiye" tabiri yer almıştır.',
  'Adaylar doğu sınırının kesinleştiğini zannedebilir. Doğu sınırı Gümrü ile değil, Sakarya sonrası imzalanan 1921 Kars Antlaşması ile kesinleşecektir.',
  32
);

-- Soru #033 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Milli Mücadele Dönemi''nde düzenli ordunun bulunmadığı, tamamen yerel sivil direniş ve Kuvay-ı Milliye birlikleriyle Fransız ve Ermeni işgaline karşı destansı mücadeleler verilen Güney Cephesi kahramanları ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Maraş $ → $ Sütçü İmam ve Rıdvan Hoca", "Antep $ → $ Şahin Bey ve Şehit Kamil", "Urfa $ → $ Ali Saip Bey (Ursavaş)", "Adana $ → $ Tufan Bey (Yüzbaşı Osman)", "Dörtyol $ → $ Kazım Karabekir"], "correctIndex": 4}'::jsonb,
  'Kazım Karabekir Doğu Cephesi komutanıdır; Güney Cephesi''nde bulunmamıştır. Dörtyol''da ilk kurşunu atan Kara Hasan Paşa''dır.',
  'ÖSYM Güney Cephesi''ndeki kahramanların takma isimlerini ve şehirlerini sorar: Adana = Tufan Bey; Antep = Şahin Bey; Maraş = Sütçü İmam; Urfa = Ali Saip Bey.',
  33
);

-- Soru #034 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '6-10 Ocak 1921 tarihleri arasında Albay İsmet İnönü komutasındaki düzenli ordunun Yunan taarruzuna karşı kazandığı I. İnönü Zaferi sonrasında yaşanan ulusal ve uluslararası gelişmeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Teşkilat-ı Esasiye Kanunu''nun (1921 Anayasası) kabul edilmesi", "İstiklal Marşı''nın milli marş olarak kabul edilmesi", "Sovyet Rusya ile Moskova Antlaşması''nın imzalanması", "Afganistan ile Dostluk Antlaşması imzalanarak Türkiye''yi tanıyan ilk Müslüman devlet olması", "Fransa ile Ankara Antlaşması imzalanarak Güney Cephesi''nin kapanması"], "correctIndex": 4}'::jsonb,
  'Fransa ile Ankara Antlaşması I. İnönü sonrası değil, Sakarya Meydan Muharebesi sonrasında (Ekim 1921) imzalanmıştır. I. İnönü sonuçları ise [TALİM / MİLAT] kodlamasıdır (Teşkilat-ı Esasiye, Afganistan Dostluk, Londra Konferansı, İstiklal Marşı, Moskova Antlaşması).',
  'Adaylar İtilaf devletleriyle yapılan antlaşmaları karıştırır. I. İnönü''den sonra Londra Konferansı toplanmış ama Fransa ile kesin anlaşma Sakarya''dan sonraya kalmıştır.',
  34
);

-- Soru #035 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '12 Mart 1921''de kabul edilen İstiklal Marşı ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Milli Marş yarışması dönemin Maarif Vekaleti (Milli Eğitim Bakanlığı) tarafından düzenlenmiştir.", "Şiir TBMM kürsüsünde dönemin Maarif Vekili Hamdullah Suphi Tanrıöver tarafından coşkuyla okunmuştur.", "İstiklal Marşı''nın yayımlandığı ilk yerel gazete Kastamonu''da çıkan ''Açıksöz'' gazetesidir.", "İstiklal Marşı''nın ilk bestecisi Osman Zeki Üngör, günümüzdeki bestecisi ise Ali Rıfat Çağatay''dır.", "Mehmet Akif Ersoy kazandığı 500 liralık para ödülünü kadın ve yetimlere meslek öğreten ''Dârü''l-Mesâi'' vakfına bağışlamıştır."], "correctIndex": 3}'::jsonb,
  'İstiklal Marşı''nın ilk bestecisi Ali Rıfat Çağatay (1924-1930 arası çalınan alaturka beste), günümüzdeki bestecisi ise Osman Zeki Üngör''dür (1930''dan beri çalınan marş). İsimlerin sırası ters verilmiştir.',
  'ÖSYM ilk besteci (Ali Rıfat Çağatay) ile günümüz bestecisini (Osman Zeki Üngör) daima ters eşleştirerek sorar.',
  35
);

-- Soru #036 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '16 Mart 1921 tarihinde TBMM ile Sovyet Rusya arasında imzalanan Moskova Antlaşması''nda yer alan;

"Batum şehri ve limanı Gürcistan yönetimine bırakılacaktır." hükmünün Türk Kurtuluş Savaşı açısından en önemli tarihi niteliği aşağıdakilerden hangisidir?',
  '{"options": ["Misak-ı Millî sınırlarından verilen ilk taviz olması", "Kafkasya''da yeni bir cephe açılmasına neden olması", "Boğazların Rusya''ya devredilmesi", "Gürcistan ile savaşa son verilmesi", "Mustafa Kemal''in askerlikten istifasına yol açması"], "correctIndex": 0}'::jsonb,
  'Batum''un Gürcistan''a bırakılması, TBMM''nin Misak-ı Millî''den verdiği İLK tavizdir. İkinci taviz Hatay (1921 Ankara Antlaşması), üçüncü taviz ise Musul''dur (1926 Ankara Antlaşması).',
  'ÖSYM Misak-ı Millî tavizlerini sırasıyla sorar: 1. Batum (Moskova Ant.), 2. Hatay (1921 Ankara Ant.), 3. Musul (1926 Ankara Ant.).',
  36
);

-- Soru #037 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'Temmuz 1921''de Kütahya-Eskişehir Muharebeleri''nde Türk ordusunun yenilerek Sakarya Irmağı''nın doğusuna çekilmesi üzerine Meclis''te büyük bir kriz çıkmış ve Meclis''in Kayseri''ye taşınması tartışılmıştır.

Bu ağır kriz ortamında 5 Ağustos 1921''de çıkarılan Başkomutanlık Kanunu ile;
I. TBMM''nin yasama ve yürütme yetkileri üç aylığına doğrudan Mustafa Kemal Paşa''ya devredilmiştir.
II. Mustafa Kemal Paşa, Amasya Genelgesi sonrasında istifa ettiği askerlik mesleğine başkomutan sıfatıyla resmen geri dönmüştür.
III. Mustafa Kemal Paşa başkomutanlık yetkisine dayanarak ordunun acil ihtiyaçlarını halktan temin etmek amacıyla "Tekalif-i Milliye Emirleri"ni yayımlamıştır.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Üç öncül de tarihsel olarak tamamen doğrudur. Başkomutanlık Kanunu ile olağanüstü yetkiler Mustafa Kemal''de toplanmış, askerliğe dönmüş ve Tekalif-i Milliye emirlerini doğrudan yayımlamıştır.',
  'Tekalif-i Milliye Emirleri meclis tarafından değil, Mustafa Kemal''in başkomutanlık yetkisiyle doğrudan çıkardığı emirlerdir.',
  37
);

-- Soru #038 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '23 Ağustos - 13 Eylül 1921 tarihleri arasında 22 gün 22 gece aralıksız süren, Mustafa Kemal Paşa''nın "Hatt-ı müdafaa yoktur, sath-ı müdafaa vardır. O satıh bütün vatandır!" emrini verdiği, subay kaybının yüksekliği sebebiyle tarihe "Subaylar Savaşı" veya "Melhame-i Kübra" (Büyük Kıyım) olarak geçen ve 1683 II. Viyana Kuşatması''ndan beri süren Türk geri çekilişini durduran savaş aşağıdakilerden hangisidir?',
  '{"options": ["I. İnönü Savaşı", "II. İnönü Savaşı", "Kütahya-Eskişehir Savaşı", "Sakarya Meydan Muharebesi", "Büyük Taarruz"], "correctIndex": 3}'::jsonb,
  'Sakarya Meydan Muharebesi, Türk ordusunun son savunma savaşıdır. Bu zaferle 238 yıllık geri çekilme durmuş; Mustafa Kemal''e Gazilik unvanı ve Mareşallik rütbesi verilmiştir.',
  'Adaylar "Subaylar Savaşı" tabirini Çanakkale veya Büyük Taarruz ile karıştırabilir. Subaylar Savaşı ve Melhame-i Kübra Sakarya''dır.',
  38
);

-- Soru #039 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '26 Ağustos 1922''de Kocatepe''den başlayan ve 30 Ağustos''ta Dumlupınar Meydan Muharebesi ile Yunan ordusunun imha edilmesiyle sonuçlanan Büyük Taarruz''dan sonra;

Mustafa Kemal Paşa''nın "Ordular ilk hedefiniz Akdeniz''dir, ileri!" emriyle İzmir''e giren Türk ordusunun ardından İtilaf Devletleri ile imzalanan ve Doğu Trakya, İstanbul ve Boğazların savaş yapılmadan (diplomatik yolla) kurtarılmasını sağlayan ateşkes antlaşması aşağıdakilerden hangisidir?',
  '{"options": ["Mondros Ateşkesi", "Mudanya Ateşkes Antlaşması", "Gümrü Antlaşması", "Lozan Barış Antlaşması", "Ankara Antlaşması"], "correctIndex": 1}'::jsonb,
  'Mudanya Ateşkes Antlaşması (11 Ekim 1922) ile Doğu Trakya, İstanbul ve Boğazlar tek bir kurşun atılmadan kurtarılmıştır. TBMM adına görüşmeleri İsmet İnönü yürütmüş; Trakya Yüksek Komiseri Refet Bele Doğu Trakya''yı teslim almıştır.',
  'ÖSYM "Savaşsız kurtarılan yerler neresidir?" (Doğu Trakya, Boğazlar, İstanbul) ve "Trakya Yüksek Komiseri kimdir?" (Refet Bele) sorularını sıklıkla sorar.',
  39
);

-- Soru #040 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  '24 Temmuz 1923 tarihinde imzalanan Türkiye Cumhuriyeti''nin tapu senedi niteliğindeki Lozan Barış Antlaşması ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Kapitülasyonlar ve Düyun-u Umumiye İdaresi hiçbir taviz verilmeksizin tamamen kaldırılmıştır.", "Türkiye''deki tüm gayrimüslim azınlıklar Türk vatandaşı sayılarak Avrupalıların iç işlerimize karışması engellenmiştir.", "Suriye sınırı 1921 Ankara Antlaşması, Doğu sınırı ise 1921 Kars Antlaşması esas alınarak belirlenmiştir.", "Boğazların yönetimi, başkanı Türk olan uluslararası bir komisyona bırakılmış ve boğazın her iki yakası askersizleştirilmiştir.", "Türkiye ile İngiltere arasında yaşanan Musul (Irak Sınırı) sorunu Türkiye lehine çözülerek Musul Türkiye sınırlarına katılmıştır."], "correctIndex": 4}'::jsonb,
  'Musul Sorunu (Irak Sınırı) Lozan''da çözülememiştir! İkili görüşmelere bırakılmış; daha sonra Şeyh Sait İsyanı''nın çıkması üzerine 1926 Ankara Antlaşması ile Musul maalesef İngiliz mandasındaki Irak''a bırakılmak zorunda kalınmıştır.',
  'ÖSYM''nin en klasik Lozan sorusudur: "Lozan''da çözülemeyip sonraya bırakılan tek konu nedir?" Cevap: Musul (Irak Sınırı) Sorunu.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '30 Ekim 1918 tarihinde imzalanan Mondros Ateşkes Anlaşması''nda İtilaf Devletleri''nin Osmanlı topraklarını hukuki dayanaktan yoksun kalmadan işgal edebilmelerine zemin hazırlayan ve ''İtilaf Devletleri güvenliklerini tehdit edecek bir durum ortaya çıkarsa herhangi bir stratejik noktayı işgal edebilecektir'' hükmünü içeren en tehlikeli madde hangisidir?',
  '{"options": ["7. Madde", "24. Madde", "1. Madde", "10. Madde", "15. Madde"], "correctIndex": 0}'::jsonb,
  'Mondros''un 7. maddesi tüm Osmanlı vatanını işgale açık hale getiren en ucu açık ve tehlikeli maddedir. İtilaf Devletleri Anadolu''daki bütün haksız işgallerini bu 7. maddeye dayandırmışlardır.',
  '24. madde Vilayat-ı Sitte''de (6 doğu ili) karışıklık çıkarsa işgali öngörerek ''Ermeni Devleti'' kurmayı hedefler; tüm vatanı işgale açan ise 7. maddedir.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mondros Ateşkes Anlaşması''nın 24. maddesinde geçen ''Vilayat-ı Sitte'' (Altı Doğu İli) kapsamındaki şehirler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Van", "Erzurum", "Diyarbakır", "Trabzon", "Bitlis"], "correctIndex": 3}'::jsonb,
  'Vilayat-ı Sitte illeri ''B-E-S-E-V-D'' (Bitlis, Erzurum, Sivas, Elazığ/Harput, Van, Diyarbakır) şifresiyle kodlanır. Trabzon bu 6 il arasında yoktur; Karadeniz''de Pontus Rum iddialarının merkezidir.',
  'Trabzon Doğu Karadeniz''dedir ve Pontus iddiaları altındadır; Vilayat-ı Sitte Ermeni vilayetleri olarak tasarlanan 6 ildir.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mondros Ateşkesi''nden sonra başlayan haksız işgallere karşı Türk milletinin kurduğu ''Milli Varlığa Yararlı Cemiyetler'' arasında yer alan, silahlı mücadeleden ziyade basın ve yayın yoluyla uluslararası kamuoyunu aydınlatmayı ilke edinen ve ''Kuvayımilliye'' tabirini ilk kez kullanan cemiyet hangisidir?',
  '{"options": ["Milli Kongre Cemiyeti", "Trakya-Paşaeli Müdafaa-i Hukuk Cemiyeti", "Kilikyalılar Cemiyeti", "Trabzon Muhafaza-i Hukuk Cemiyeti", "Şark Vilayetleri Müdafaa-i Hukuk Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Dr. Esat Işık öncülüğünde İstanbul''da kurulan Milli Kongre Cemiyeti, propaganda ve basın-yayın yoluyla işgallerin haksızlığını dünyaya duyurmayı amaçlamış ve Kuvayımilliye terimini ilk kez raporlarında kullanmıştır.',
  'Bölgesel silahlı direniş yapan cemiyetlerin aksine, Milli Kongre Cemiyeti ulusal çapta ve basın-yayın yoluyla mücadele etmiştir.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Adana ve Çukurova bölgesinin Fransızlar ve Ermeniler tarafından işgal edilmesini önlemek amacıyla İstanbul''da kurulan, isminin yabancı gibi durması sebebiyle sık sık zararlı cemiyetlerle karıştırılan yararlı cemiyet aşağıdakilerden hangisidir?',
  '{"options": ["Kilikyalılar Cemiyeti", "Etnik-i Eterya", "Hınçak ve Taşnak", "Mavikent Cemiyeti", "Karakol Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Kilikyalılar Cemiyeti, Çukurova''nın antik adı Kilikya olduğu için bu ismi almıştır. Fransız ve Ermeni işgaline karşı kurulmuş tamamen ''Milli / Yararlı'' bir cemiyettir.',
  'ÖSYM''nin en klasik çeldiricisidir: Kilikyalılar ismi yabancı gibi algılandığı için adaylar tarafından zararlı cemiyet sanılır; oysa Adana Müdafaa-i Hukuk cemiyetidir.',
  44
);

-- Soru #045 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa, 19 Mayıs 1919''da Samsun''a çıktıktan sonra 28 Mayıs 1919''da yayınladığı Havza Genelgesi ile Türk milletinden ilk kez neyi talep etmiştir?',
  '{"options": ["İşgallerin haksız olduğunu duyurmak için mitingler ve protestolar düzenlenmesini, ancak Hristiyan azınlığa taşkınlık yapılmamasını", "TBMM''nin derhal toplanmasını", "Düzenli ordunun derhal kurulmasını", "Cumhuriyet rejimine geçilmesini", "Saltanatın kaldırılmasını"], "correctIndex": 0}'::jsonb,
  'Havza Genelgesi, Milli Mücadele''nin ilk genelgesidir ve milli bilinci uyandırmayı amaçlar. Mustafa Kemal mitinglerle halkın işgali protesto etmesini istemiş, ancak İtilaf Devletleri''nin Mondros''un 7. maddesini bahane etmemesi için azınlıklara zarar verilmemesini tembihlemiştir.',
  'Havza Genelgesi''nin temel amacı ''milli bilinci uyandırmaktır''. Meclis veya cumhuriyet fikirleri henüz telaffuz edilmemiştir.',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '22 Haziran 1919''da yayınlanan Amasya Genelgesi''nde yer alan;
''Vatanın bütünlüğü, milletin bağımsızlığı tehlikededir.''
hükmü, Milli Mücadele''nin hangi temel unsurunu ifade etmektedir?',
  '{"options": ["Gerekçesi (Nedeni)", "Amacı", "Yöntemi", "İlk Hükümeti", "Dış Politikası"], "correctIndex": 0}'::jsonb,
  'Amasya Genelgesi''nin 1. maddesi (''Vatanın bütünlüğü tehlikededir'') ve 2. maddesi (''İstanbul hükümeti görevini yapamamaktadır'') Milli Mücadele''nin ''GEREKÇESİ''dir (Neden savaşıyoruz?).',
  '3. madde olan ''Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır'' ise hem AMACI (bağımsızlık) hem de YÖNTEMİ (milletin azim ve kararı) ifade eder.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Amasya Genelgesi''nde yer alan;
''Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır.''
maddesi ilk kez aşağıdakilerden hangisinin işaretini vermiştir?',
  '{"options": ["Milli egemenliğe dayalı yeni bir rejim (Cumhuriyet) kurulacağının", "Manda ve himayenin kabul edileceğinin", "Halifeliğin güçlendirileceğinin", "İtilaf Devletleri ile barış yapılacağının", "İstanbul Hükümeti''ne tam itaat edileceğinin"], "correctIndex": 0}'::jsonb,
  '''Milletin azim ve kararı'' ifadesi, padişahın değil millet iradesinin belirleyici olacağını ilan ettiği için üstü kapalı olarak ilk kez ''Ulusal Egemenlik'' ve gelecekteki ''Cumhuriyet'' rejiminin ihtilal beyannamesidir.',
  'Bu madde hem ulusal bağımsızlığı (amaç) hem de ulusal egemenliği (yöntem) aynı anda içeren en kritik inkılap maddesidir.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa, Amasya Genelgesi''nden sonra İstanbul Hükümeti tarafından resmi görevinden alınınca 7/8 Temmuz 1919 gecesi çok sevdiği askerlik mesleğinden ve 9. Ordu Müfettişliği görevinden istifa etmiştir.

Mustafa Kemal''in askerlikten istifa ettikten sonra sivil bir vatandaş olarak katıldığı ''ilk kongre'' aşağıdakilerden hangisidir?',
  '{"options": ["Erzurum Kongresi", "Amasya Görüşmesi", "Sivas Kongresi", "Balıkesir Kongresi", "Afyon Kongresi"], "correctIndex": 0}'::jsonb,
  'Mustafa Kemal 7/8 Temmuz gecesi istifa etmiş, böylece ''Sine-i Millete'' (milletin sinesine) dönmüştür. Sivil olarak katıldığı ve başkanlığını yürüttüğü ilk kongre 23 Temmuz 1919 Erzurum Kongresi''dir.',
  'Mustafa Kemal Amasya''da henüz resmi üniformalı paşadır; Erzurum Kongresi''ne ise sivil olarak katılmıştır. Üniformasına ancak Sakarya Savaşı öncesinde Başkomutanlık ile dönecektir.',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa''nın istifa etmesi üzerine İstanbul Hükümeti onun tutuklanmasını emretmiştir. Ancak Erzurum''daki 15. Kolordu Komutanı Mustafa Kemal''in huzuruna çıkarak askeri selam vermiş ve ''Ben ve kolordum hepimiz emrinizdeyiz paşam!'' diyerek Milli Mücadele''nin kaderini değiştiren tarihi bağlılığı göstermiştir.

Bu büyük vatansever komutan kimdir?',
  '{"options": ["Kazım Karabekir Paşa", "Ali Fuat Cebesoy", "Rauf Orbay", "Refet Bele", "İsmet İnönü"], "correctIndex": 0}'::jsonb,
  'Kazım Karabekir Paşa, emrindeki dağıtılmamış 15. Kolordu ile Mustafa Kemal''e tabi olmuş ve Milli Mücadele''nin askeri omurgasını temin etmiştir.',
  'Kazım Karabekir''in bu tarihi tavrı olmasaydı Mustafa Kemal tutuklanabilir ve Milli Mücadele başlangıçta sönebilirdi.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Amasya Genelgesi metnini hazırlayan ve imzalayan liderler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Mustafa Kemal Paşa", "Rauf Orbay", "Ali Fuat Cebesoy", "Refet Bele", "İsmet İnönü"], "correctIndex": 4}'::jsonb,
  'Amasya Genelgesi''ni imzalayanlar: Mustafa Kemal, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele''dir. Telgrafla onaylayanlar ise Kazım Karabekir ve Cemal Paşa''dır. İsmet İnönü o sırada İstanbul''dadır ve Amasya Genelgesi''nde imzası YOKTUR.',
  'ÖSYM''nin en ünlü ''kim imzaladı/imzalamadı'' sorusudur: İsmet İnönü ve Fevzi Çakmak Amasya Genelgesi sırasında henüz Anadolu''ya geçmemiştir.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Erzurum Kongresi ile ilgili olarak;
''Toplanış şekli ve amacı bakımından bölgesel, aldığı kararlar bakımından ise tamamen ulusaldır.''
yargısını kanıtlayan en temel karar aşağıdakilerden hangisidir?',
  '{"options": ["Milli sınırlar içinde vatan bir bütündür, bölünemez.", "Trabzon ve Erzurum illeri ortak savunma yapacaktır.", "Doğu Anadolu''daki Ermeni tehlikesi bertaraf edilecektir.", "Kongreye sadece doğu illerinden delege katılacaktır.", "Toplantı başkanlığına Mustafa Kemal seçilmiştir."], "correctIndex": 0}'::jsonb,
  '''Milli sınırlar içinde vatan bir bütündür parçalanamaz'' kararı tüm vatanı kapsadığı için kongrenin bölgesel toplanıp ulusal kararlar aldığının en açık delilidir.',
  'Erzurum Kongresi Doğu Karadeniz ve Doğu Anadolu için toplanmış bölgesel bir kongredir; fakat ilk kez Misak-ı Milli sınırlarından bahsettiği için kararları ulusaldır.',
  51
);

-- Soru #052 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Milli Mücadele sürecinde ''Manda ve Himaye'' fikri ilk kez nerede reddedilmiş, nerede ise kesin ve son kez olarak bir daha gündeme gelmemek üzere reddedilmiştir?',
  '{"options": ["İlk kez Erzurum Kongresi''nde - Kesin olarak Sivas Kongresi''nde", "İlk kez Havza''da - Kesin olarak Amasya''da", "İlk kez Sivas''ta - Kesin olarak TBMM''de", "İlk kez Amasya''da - Kesin olarak Erzurum''da", "İlk kez Misak-ı Milli''de - Kesin olarak Lozan''da"], "correctIndex": 0}'::jsonb,
  'Manda ve himaye ilk kez Erzurum Kongresi''nde (''Manda ve himaye kabul olunamaz''); kesin ve son kez ise Sivas Kongresi''ndeki hararetli Amerikan mandası tartışmaları sonucunda reddedilmiştir.',
  'İlk red: Erzurum; Kesin/Son red: Sivas Kongresi. Bu ikili kronoloji ÖSYM''nin vazgeçilmez sorusudur.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '4-11 Eylül 1919 tarihleri arasında toplanan Sivas Kongresi''nde alınan kararlar doğrultusunda, Anadolu ve Rumeli''de faaliyet gösteren tüm bölgesel direniş cemiyetleri hangi ortak çatı altında birleştirilmiştir?',
  '{"options": ["Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (A-RMHC)", "Karakol Cemiyeti", "Kuvayımilliye Komutanlığı", "Milli Savunma Bakanlığı", "Felâh-ı Vatan Grubu"], "correctIndex": 0}'::jsonb,
  'Sivas Kongresi''nde bölgesel tüm direniş dernekleri ''Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti'' adı altında birleştirilerek Milli Mücadele tek merkezden yönetilmeye başlanmıştır.',
  'Erzurum''da sadece Doğu cemiyetleri birleştirilmiştir; tüm vatan cemiyetlerinin birleştiği yer ise Sivas Kongresi''dir.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Sivas Kongresi''nde Temsil Heyeti''nin Ali Fuat Paşa''yı ''Batı Cephesi Kuvayımilliye Genel Komutanlığı''na ataması, Temsil Heyeti''nin ilk kez hangi devlet yetkisini kullandığını gösterir?',
  '{"options": ["Yürütme Yetkisi (Hükümet Gibi Davranma)", "Yasama Yetkisi", "Yargı Yetkisi", "Diplomatik Yetki", "Temyiz Yetkisi"], "correctIndex": 0}'::jsonb,
  'Bir komutan veya memur atamak hükümetlere ait bir ''Yürütme'' görevidir. Temsil Heyeti Ali Fuat Paşa''yı atayarak fiilen bir hükümet gibi yürütme yetkisini kullanmıştır.',
  'Atama yapmak yürütmedir; kanun çıkarmak yasama, mahkeme kurmak ise yargıdır.',
  54
);

-- Soru #055 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Sivas Kongresi''nin engellenememesi üzerine Damat Ferit Paşa Hükümeti istifa etmek zorunda kalmış, yerine milli harekete daha ılımlı bakan Ali Rıza Paşa Hükümeti kurulmuştur.

Damat Ferit Hükümeti''nin istifaya zorlanması, Temsil Heyeti''nin hangi alandaki ''ilk siyasi başarısı'' kabul edilir?',
  '{"options": ["İstanbul Hükümeti''ne karşı kazandığı ilk siyasi zafer", "İtilaf Devletleri ile imzalanan ilk resmi barış", "Saltanatın fiilen kaldırılması", "İlk dış borcun iptal edilmesi", "Sevr Antlaşması''nın yırtılması"], "correctIndex": 0}'::jsonb,
  'Temsil Heyeti İstanbul ile tüm telgraf ve posta haberleşmesini keserek Damat Ferit''i istifa ettirmiştir. Bu olay Temsil Heyeti''nin İstanbul''a karşı kazandığı ilk büyük siyasi ve diplomatik başarıdır.',
  'Askeri değil SİYASİ bir başarıdır ve Temsil Heyeti''nin otoritesini kanıtlamıştır.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İstanbul Hükümeti adına Bahriye Nazırı Salih Paşa ile Temsil Heyeti adına Mustafa Kemal Paşa arasında 20-22 Ekim 1919''da gerçekleşen Amasya Görüşmeleri''nin (Protokolü) en önemli tarihi sonucu aşağıdakilerden hangisidir?',
  '{"options": ["İstanbul Hükümeti''nin Temsil Heyeti''ni ve Milli Mücadele''yi hukuken ve resmen ilk kez tanıması", "İstanbul Hükümeti''nin Sevr Antlaşması''nı imzalamayı reddetmesi", "Mustafa Kemal''in padişah vekili ilan edilmesi", "Kuvayımilliye birliklerinin terhis edilmesi", "İtilaf Devletleri''nin Anadolu''yu tamamen terk etmesi"], "correctIndex": 0}'::jsonb,
  'Amasya Görüşmeleri ile İstanbul Hükümeti Anadolu ihtilalini ve Temsil Heyeti''nin tüzel kişiliğini resmen ve hukuken tanımak zorunda kalmıştır.',
  'Amasya Genelgesi ile Amasya Görüşmeleri karıştırılmamalıdır. Genelge 1919 Haziran''ında bağımsızlık tamimidir; Görüşme ise Ekim''de Salih Paşa ile yapılan protokoldür.',
  56
);

-- Soru #057 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Amasya Protokolü''nde kabul edilen maddelerden yalnızca hangisi İstanbul Hükümeti tarafından hayata geçirilebilmiştir?',
  '{"options": ["Mebusan Meclisi''nin toplanması için seçimlerin yapılması", "Meclisin İstanbul dışında güvenli bir Anadolu şehrinde toplanması", "Temsil Heyeti''nin onayı olmadan hiçbir barış antlaşması imzalanmaması", "Kuvayımilliye''ye bütçeden maaş ödenmesi", "Zararlı cemiyetlerin derhal kapatılması"], "correctIndex": 0}'::jsonb,
  'İstanbul Hükümeti ve Padişah Vahdettin meclisin İstanbul dışında toplanmasını anayasaya aykırı bularak reddetmiş, sadece seçimlerin yapılıp Mebusan Meclisi''nin İstanbul''da açılmasını kabul etmiştir.',
  'Mustafa Kemal meclisin işgal altındaki İstanbul''da toplanmasının çok tehlikeli olduğunu söylemiştir; nitekim meclis basılmış ve dağıtılmıştır.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Temsil Heyeti''nin 27 Aralık 1919''da Ankara''ya gelerek burayı Milli Mücadele''nin merkezi ve karargahı seçmesinde Ankara''nın hangi özelliği etkili olmamıştır?',
  '{"options": ["Ali Fuat Paşa komutasındaki 20. Kolordu''nun burada bulunması", "Demir yolu hattının son durağı ve telgraf ağının merkezinde yer alması", "Batı Cephesi''ne yakın ve işgal edilmemiş güvenli bir konumda olması", "Şehrin resmen başkent ilan edilmiş olması", "Halkının Milli Mücadele yanlısı olması"], "correctIndex": 3}'::jsonb,
  'Ankara o tarihte başkent değildir. Ankara''nın başkent olması çok sonra, 13 Ekim 1923 tarihindedir.',
  'Adaylar Ankara''nın Milli Mücadele başından beri başkent olduğunu zannedebilir. 1919''da resmi başkent hala İstanbul''dur.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Son Osmanlı Mebusan Meclisi''nde Mustafa Kemal''in isteği üzerine kurulan ''Müdafaa-i Hukuk'' grubu yerine, padişahtan çekinen mebuslar tarafından kurulan ve Misak-ı Milli kararlarını kabul ettiren grubun adı nedir?',
  '{"options": ["Felâh-ı Vatan (Vatanın Kurtuluşu) Grubu", "Karakol Grubu", "Tesanüd Grubu", "Halk Zümresi", "İstiklal Grubu"], "correctIndex": 0}'::jsonb,
  'Milletvekilleri mecliste Mustafa Kemal''in istediği Müdafaa-i Hukuk grubu yerine Rauf Orbay başkanlığında ''Felâh-ı Vatan'' grubunu kurmuşlar ve 28 Ocak 1920''de Misak-ı Milli kararlarını oy birliğiyle kabul ettirmişlerdir.',
  'I. TBMM içindeki gruplar (Tesanüd, İstiklal, Halk Zümresi vb.) ile Son Osmanlı Mebusan Meclisi''ndeki ''Felâh-ı Vatan'' grubu karıştırılmamalıdır.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Son Osmanlı Mebusan Meclisi tarafından 28 Ocak 1920''de kabul edilen Misak-ı Milli kararları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Kapitülasyonların kesinlikle kaldırılması gerektiği", "Arap topraklarında, Kars-Ardahan-Batum''da ve Batı Trakya''da halk oylaması (plebisit) yapılması", "Boğazların ticaret gemilerine açılması şartıyla güvenliğinin sağlanması", "Azınlık haklarının komşu ülkelerdeki Müslümanların hakları kadar olması", "Cumhuriyet rejimine geçilerek padişahlığın kaldırılması"], "correctIndex": 4}'::jsonb,
  'Misak-ı Milli tamamen ''Ulusal Bağımsızlık ve Sınırlar'' belgesidir. İçinde rejim, cumhuriyet veya padişahlıkla ilgili tek bir siyasi madde dahi YOKTUR. Padişahın meclisinde böyle bir madde olması zaten düşünülemezdi.',
  'ÖSYM''nin en büyük çeldiricisidir: Misak-ı Milli''de ''Ulusal Egemenlik'' veya rejim değişikliği KESİNLİKLE YOKTUR, sadece ''Ulusal Bağımsızlık'' vardır.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '23 Nisan 1920 tarihinde Ankara''da açılan I. Türkiye Büyük Millet Meclisi''nin (TBMM) özellikleriyle ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Yasama, yürütme ve yargı yetkilerini tek elde toplayan ''Güçler Birliği'' ilkesini benimsemiştir.", "Meclis Hükümeti sistemini uygulamış; meclis başkanı aynı zamanda hükümetin de başkanı olmuştur.", "Savaş şartları sebebiyle siyasi partilerin kurulmasına izin verilmemiş, gruplar halinde çalışmıştır.", "Kurtuluş Savaşı''nı yönettiği için ''İhtilalci'' ve ''Gazi'' meclistir.", "Tüm üyelerini sadece üniversite mezunlarından ve askerlerden oluşturan elitist bir meclistir."], "correctIndex": 4}'::jsonb,
  'I. TBMM elitist değil, toplumun her kesiminden (çiftçi, din adamı, memur, subay, tüccar, aşiret reisi) temsilcilerin yer aldığı son derece ''halkçı ve çoğulcu'' bir halk meclisidir.',
  'I. TBMM''de parti yoktur, gruplar vardır. Güçler birliği vardır ve kurucu bir halk meclisidir.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '23 Nisan 1920''de açılan I. TBMM''nin çıkardığı 1 numaralı ilk kanun aşağıdakilerden hangisidir?',
  '{"options": ["Ağnam Resminin (Küçükbaş Hayvan Vergisinin) 4 Katına Çıkarılması Kanunu", "Hıyanet-i Vataniye Kanunu", "Firariler Kanunu", "İstiklal Marşı Kanunu", "Teşkilat-ı Esasiye Kanunu"], "correctIndex": 0}'::jsonb,
  'Meclisin ilk icraatı bütçeye kaynak yaratmak için 24 Nisan 1920''de çıkardığı ''Ağnam Vergisinin Arttırılması Hakkında Kanun''dur.',
  'Adaylar Hıyanet-i Vataniye veya Teşkilat-ı Esasiye''yi ilk kanun sanabilir; ilk çıkarılan kanun Ağnam vergisidir.',
  62
);

-- Soru #063 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. TBMM''ye karşı çıkan iç ayaklanmaları bastırmak, asker kaçaklarını cezalandırmak ve meclisin otoritesini korumak amacıyla 29 Nisan 1920''de çıkarılan kanun ve üyeleri milletvekillerinden oluşan olağanüstü mahkemeler hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Hıyanet-i Vataniye Kanunu - İstiklal Mahkemeleri", "Takrir-i Sükun Kanunu - Divan-ı Harp", "Teşvik-i Sanayi Kanunu - Yüce Divan", "Firariler Kanunu - Nizamiye Mahkemesi", "Men-i İsrafat Kanunu - Asliye Ceza"], "correctIndex": 0}'::jsonb,
  'I. TBMM Hıyanet-i Vataniye Kanunu''nu çıkarmış ve üyeleri bizzat milletvekillerinden oluşan İstiklal Mahkemeleri''ni kurarak ''Yargı'' yetkisini de doğrudan kullanmıştır.',
  'Takrir-i Sükun Kanunu ve İstiklal Mahkemeleri''nin ikinci dönemi 1925 Şeyh Sait İsyanı ile ilgilidir. I. TBMM''nin kurduğu ilk kanun Hıyanet-i Vataniye''dir.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Milli Mücadele aleyhine Şeyhülislam Dürrizade Abdullah Efendi''nin yayınladığı ölüm fetvasına karşı, 153 din adamının imzasıyla ''Milli Mücadele meşrudur ve vatan savunması farzdır'' fetvasını kaleme alan ve Ankara Müftüsü olan büyük vatanperver din bilgini kimdir?',
  '{"options": ["Rıfat Börekçi", "Mehmet Rifat Efendi", "Mustafa Fehmi Gerçeker", "Ahmet Hamdi Akseki", "Şemsettin Günaltay"], "correctIndex": 0}'::jsonb,
  'Ankara Müftüsü Mehmet Rıfat Börekçi, Ankara Fetvası''nı yayınlayarak milli hareketi dini açıdan aklamış ve Cumhuriyetin ilk Diyanet İşleri Başkanı olmuştur.',
  'Dürrizade hain fetvayı veren Osmanlı şeyhülislamıdır; Rıfat Börekçi ise Milli Mücadele''yi destekleyen ilk Diyanet İşleri Başkanı''dır.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. TBMM''ye karşı doğrudan İstanbul Hükümeti tarafından kurulan ve İngilizlerin finansmanıyla Boğazları korumak amacıyla teşkil edilen isyan/ordu hangisidir?',
  '{"options": ["Kuvay-ı İnzibatiye (Hilafet Ordusu)", "Kuvay-ı Seyyare", "Ahmet Anzavur İsyanı", "Demirci Mehmet Efe İsyanı", "Çerkez Ethem İsyanı"], "correctIndex": 0}'::jsonb,
  'Kuvay-ı İnzibatiye (Hilafet Ordusu) ve Ahmet Anzavur doğrudan Damat Ferit Hükümeti ve İngiltere destekli isyanlardır.',
  'Kuvay-ı Seyyare Çerkez Ethem''in birlikleridir; Hilafet Ordusu ise Kuvay-ı İnzibatiye''dir.',
  65
);

-- Soru #066 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '10 Ağustos 1920 tarihinde imzalanan Sevr Antlaşması''nı Osmanlı Devleti adına padişahın kurduğu ''Saltanat Şurası'' onaylamıştır.

Saltanat Şurası üyeleri arasında yer almasına rağmen ''Ben bu idam fermanına imza atmam!'' diyerek Sevr Antlaşması''nı imzalamayı reddeden tek yurtsever general/devlet adamı kimdir?',
  '{"options": ["Topçu Feriki Rıza Paşa", "Hadi Paşa", "Rıza Tevfik Bölükbaşı", "Reşat Halis Bey", "Damat Ferit Paşa"], "correctIndex": 0}'::jsonb,
  'Topçu Korgenerali Rıza Paşa, Saltanat Şurası''nda Sevr''i imzalamayı reddeden tek üyedir. Diğer üyeler Sevr''i onayladığı için TBMM tarafından ''Vatan Haini'' ilan edilmiştir.',
  'Rıza Tevfik, Hadi Paşa ve Reşat Halis Sevr''i imzalayan heyettir; imzalamayan tek kişi Topçu Rıza Paşa''dır.',
  66
);

-- Soru #067 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Sevr Antlaşması''nın hukuken ''geçersiz ve ölü doğmuş'' bir antlaşma sayılmasının anayasal gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Kanun-i Esasi''ye göre uluslararası antlaşmaların Mebusan Meclisi tarafından onaylanması zorunluluğu varken, meclisin kapalı olması sebebiyle meclis onayından geçmemiş olması", "Padişahın antlaşmayı imzalamaması", "İtilaf Devletleri parlamentolarının antlaşmayı reddetmesi", "Milletler Cemiyeti''nin antlaşmayı onaylamaması", "Sadrazamın istifa etmesi"], "correctIndex": 0}'::jsonb,
  'Kanun-i Esasi gereğince barış antlaşmaları meclis onayından geçmek zorundadır. Mebusan Meclisi 16 Mart 1920''de işgal edilip kapatıldığı için Sevr hiçbir zaman parlamentodan geçmemiş ve hukuken geçersiz kalmıştır.',
  'Ayastefanos gibi Sevr de hukuken ölü doğmuştur; sahada ise Türk ordusunun İstiklal Harbi zaferiyle tarihin çöplüğüne atılmıştır.',
  67
);

-- Soru #068 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '20 Ocak 1921 tarihinde kabul edilen ve Türkiye Devleti''nin ilk anayasası olan 1921 Teşkilat-ı Esasiye Kanunu''nun 1. maddesi aşağıdakilerden hangisidir?',
  '{"options": ["Egemenlik kayıtsız şartsız milletindir.", "Devletin dini İslam''dır.", "Türkiye Devleti bir Cumhuriyettir.", "Başkent Ankara''dır.", "Yürütme yetkisi Cumhurbaşkanına aittir."], "correctIndex": 0}'::jsonb,
  '1921 Anayasası''nın 1. maddesi ''Hakimiyet bila kaydü şart milletindir'' (Egemenlik kayıtsız şartsız milletindir). Rejim cumhuriyet olarak henüz adlandırılmamıştır.',
  'Cumhuriyetin ilanı 1923''tedir; 1921 Anayasası''nda rejim adı geçmez, ancak 1. madde doğrudan millet egemenliğini ilan eder.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İstiklal Marşı''mız 12 Mart 1921''de TBMM tarafından kabul edilmiştir.

İstiklal Marşı yarışmasını düzenleyen bakanlık, marşın ithaf edildiği muhatap ve Meclis kürsüsünde marşı ilk kez okuyan dönemin Milli Eğitim Bakanı eşleştirmesi hangisinde doğru verilmiştir?',
  '{"options": ["Maarif Vekaleti - Kahraman Türk Ordusu - Hamdullah Suphi Tanrıöver", "Milli Müdafaa Vekaleti - Türk Gençliği - Rıza Nur", "Dahiliye Vekaleti - Mustafa Kemal Paşa - İsmet İnönü", "Hariciye Vekaleti - Şehit Anneleri - Yusuf Kemal Tengirşenk", "Adliye Vekaleti - TBMM - Kazım Karabekir"], "correctIndex": 0}'::jsonb,
  'Yarışmayı Maarif Vekaleti (Milli Eğitim Bakanlığı) açmıştır. Mehmet Akif Ersoy marşı ''Kahraman Ordumuza'' ithaf etmiştir. Meclis kürsüsünde ayakta alkışlarla ilk kez okuyan Maarif Vekili Hamdullah Suphi Tanrıöver''dir.',
  'Marş halka veya gençliğe değil ''Kahraman Türk Ordusu''na ithaf edilmiştir. İlk okuyan ise Hamdullah Suphi''dir.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İstiklal Marşı''nın ilk bestesini yapan müzisyen ile 1930''dan itibaren günümüzde çalınan son bestesini yapan bestekar eşleştirmesi hangisinde doğru verilmiştir?',
  '{"options": ["Ali Rıfat Çağatay - Osman Zeki Üngör", "Osman Zeki Üngör - Ali Rıfat Çağatay", "İsmail Dede Efendi - Itri", "Cemal Reşit Rey - Adnan Saygun", "Zati Arca - Münir Nurettin Selçuk"], "correctIndex": 0}'::jsonb,
  'İstiklal Marşı''nın ilk bestesi 1924-1930 yılları arasında çalınan Ali Rıfat Çağatay''ın bestesidir (alaturka tarzda). 1930''dan itibaren günümüze kadar çalınan beste ise Cumhurbaşkanlığı Senfoni Orkestrası şefi Osman Zeki Üngör''e aittir.',
  'İlk beste Ali Rıfat Çağatay; günümüzdeki son beste Osman Zeki Üngör''dür. ÖSYM bu ayrımı sıkça test eder.',
  70
);

-- Soru #071 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Kurtuluş Savaşı''nda Doğu Cephesi''nde Ermenilere karşı kazanılan zafer sonrasında 3 Aralık 1920''de imzalanan Gümrü Antlaşması''nın en önemli tarihi niteliği aşağıdakilerden hangisidir?',
  '{"options": ["TBMM''nin uluslararası alanda imzaladığı ilk askeri ve siyasi antlaşma olması ve Sevr''i geçersiz sayan ilk yabancı devletin Ermenistan olması", "Sovyetler Birliği ile sınırların kesinleşmesi", "Güney sınırımızın tamamen güvenceye alınması", "Kapitülasyonların tüm dünyada sona ermesi", "İngiltere''nin Anadolu''dan çekilmesi"], "correctIndex": 0}'::jsonb,
  'Gümrü Antlaşması ile TBMM uluslararası alanda ilk zaferini kazanmış, Ermenistan TBMM''yi tanıyan ve Sevr''deki toprak iddialarından vazgeçen ilk devlet olmuştur. Doğu Cephesi kapanarak birlikler Batı''ya kaydırılmıştır.',
  'Ermenistan TBMM''yi tanıyan İLK devlettir; Afganistan ilk Müslüman devlettir; Sovyet Rusya ise ilk büyük Avrupalı devlettir.',
  71
);

-- Soru #072 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Güney Cephesi''nde Fransız işgaline ve Ermeni intikam alaylarına karşı kahramanca direnen şehirlere TBMM tarafından verilen unvanlar ve İstiklal Madalyası alma yılları konusunda;
I. Maraş''a ''Kahraman'' unvanı (1973)
II. Antep''e ''Gazi'' unvanı (1921)
III. Urfa''ya ''Şanlı'' unvanı (1984)

Yukarıda verilen unvanlardan hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Kurtuluş Savaşı sırasında bizzat savaşıyorken ilk unvanı alan 1921''de Antep''tir (Gazi). Maraş 1973''te Kahraman, Urfa ise 1984''te Şanlı unvanını almıştır. Her üç eşleştirme de doğrudur.',
  'Savaş sürerken unvan alan TEK şehir Gaziantep''tir (1921). Maraş ve Urfa Cumhuriyet döneminde unvan almıştır.',
  72
);

-- Soru #073 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Batı Cephesi''nde düzenli ordunun Yunan taarruzuna karşı kazandığı ilk askeri zafer olan I. İnönü Savaşı''nın (Ocak 1921) ulusal ve uluslararası sonuçları ''M-İ-L-A-T'' şifresiyle hatırlanır.

Buna göre aşağıdakilerden hangisi ''M-İ-L-A-T'' şifresinde yer alan gelişmelerden biri değildir?',
  '{"options": ["Moskova Antlaşması''nın imzalanması", "İstiklal Marşı''nın kabul edilmesi", "Londra Konferansı''nın toplanması", "Afganistan ile Dostluk Antlaşması", "Mudanya Ateşkes Antlaşması''nın imzalanması"], "correctIndex": 4}'::jsonb,
  'M-İ-L-A-T şifresi: M: Moskova Antlaşması, İ: İstiklal Marşı, L: Londra Konferansı, A: Afgan Dostluk Antlaşması, T: Teşkilat-ı Esasiye''dir. Mudanya Ateşkesi ise Büyük Taarruz sonrasındadır.',
  'M-İ-L-A-T I. İnönü''nün sonuçlarıdır. Mudanya ise Kurtuluş Savaşı''nı fiilen bitiren mütarekedir.',
  73
);

-- Soru #074 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. İnönü Zaferi sonrasında toplanan 1921 Londra Konferansı''nda İtilaf Devletleri Türk tarafı arasında ikilik çıkarmak için hem Osmanlı Hükümeti''ni hem de TBMM''yi davet etmiştir.

Konferansta Osmanlı Sadrazamı ve delegesi Tevfik Paşa''nın söz sırası kendine geldiğinde ''Söz milletin asıl vekilleri olan Ankara heyetine aittir'' diyerek sözü Bekir Sami Bey''e bırakmasının tarihi önemi nedir?',
  '{"options": ["İtilaf Devletleri''nin ikilik çıkarma planını çökerterek TBMM''nin milletin tek temsilcisi olduğunu tescillemesi", "Sevr Antlaşması''nın aynen kabul edilmesi", "Yunan ordusunun Anadolu''dan kaçması", "Saltanatın derhal ilga edilmesi", "İngiltere''nin savaştan çekilmesi"], "correctIndex": 0}'::jsonb,
  'Osmanlı Sadrazamı Tevfik Paşa bu onurlu tutumuyla İtilaf Devletleri''nin oyununu bozmuş ve TBMM''yi milletin gerçek temsilcisi ilan etmiştir.',
  'Lozan''da da benzer ikilik planı yapılmış, ancak bu kez TBMM 1 Kasım 1922''de Saltanatı kaldırarak oyunu kökten bozmuştur.',
  74
);

-- Soru #075 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Kurtuluş Savaşı Batı Cephesi''nde düzenli ordunun aldığı tek mağlubiyet olan Eskişehir-Kütahya Muharebeleri sonrasında ordunun Sakarya Nehri''nin doğusuna çekilmesi üzerine Mecliste büyük tartışmalar yaşanmıştır.

Bu kriz üzerine 5 Ağustos 1921''de çıkarılan kanunla Mustafa Kemal Paşa''ya meclisin tüm yetkilerini 3 ay süreyle kullanma hakkı veren makam aşağıdakilerden hangisidir?',
  '{"options": ["Başkomutanlık Yetkisi", "Reisicumhurluk", "Gazi Mareşallik", "Diyanet İşleri Başkanlığı", "Büyük Millet Meclisi Başkanlığı"], "correctIndex": 0}'::jsonb,
  '5 Ağustos 1921 Başkomutanlık Kanunu ile Meclis yasama ve yürütme yetkilerini üç aylığına Mustafa Kemal''e devretmiştir. Böylece Mustafa Kemal Erzurum''da istifa ettiği askerlik mesleğine Başkomutan olarak dönmüştür.',
  'Başkomutanlık süresiz değil, ilk etapta 3 aylığına verilmiş; zaferden sonra uzatılmıştır.',
  75
);

-- Soru #076 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa, Başkomutanlık yetkisini kullanarak ordunun silah, cephane, giysi, taşıt ve yiyecek ihtiyacını halktan karşılamak amacıyla 7-8 Ağustos 1921''de hangi tarihi emirleri yayınlamıştır?',
  '{"options": ["Tekalif-i Milliye Emirleri", "Teşvik-i Sanayi Kararları", "Misak-ı İktisadi", "Kanunname-i Milliye", "Milli Korunma Kararları"], "correctIndex": 0}'::jsonb,
  'Tekalif-i Milliye (Milli Yükümlülük) Emirleri ile her haneden bir kat çamaşır, çorap, çarık, silah ve taşıt istenmiş; bedelleri zaferden sonra ödenmek üzere kayıt altına alınmıştır. Bu emirler Sakarya Savaşı ve Büyük Taarruz''un lojistik omurgasıdır.',
  'Tekalif-i Milliye Sakarya Savaşı''ndan ÖNCE, Eskişehir hezimetinden HEMEN SONRA çıkarılmıştır.',
  76
);

-- Soru #077 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa''nın 22 gün 22 gece süren kanlı muharebede dünya harp literatürüne geçen;
''Hatt-ı müdafaa yoktur, sath-ı müdafaa vardır. O satıh bütün vatandır. Vatanın her karış toprağı vatandaşın kanıyla ıslanmadıkça terk olunamaz!''
tarihi emrini verdiği zafer aşağıdakilerden hangisidir?',
  '{"options": ["Sakarya Meydan Muharebesi", "Büyük Taarruz (Başkomutanlık Meydan Muharebesi)", "I. İnönü Savaşı", "II. İnönü Savaşı", "Dumlupınar Muharebesi"], "correctIndex": 0}'::jsonb,
  '23 Ağustos - 13 Eylül 1921 tarihlerindeki Sakarya Meydan Muharebesi, Türk ordusunun 1683 II. Viyana Kuşatması''ndan beri süregelen 238 yıllık geri çekilişini durduran kader savaşıdır. Mustafa Kemal bu savaştan sonra Gazi ve Mareşal unvanı almıştır.',
  '''Ordular ilk hedefiniz Akdeniz''dir ileri!'' sözü Büyük Taarruz''da; ''Hatt-ı müdafaa yoktur...'' sözü ise Sakarya Meydan Muharebesi''ndedir.',
  77
);

-- Soru #078 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Sakarya Zaferi''nin uluslararası diplomasideki en önemli yansımaları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Fransa ile 20 Ekim 1921 Ankara Antlaşması imzalanarak Güney Cephesi''nin kapanması", "Kafkas cumhuriyetleri (Azerbaycan, Ermenistan, Gürcistan) ile Kars Antlaşması imzalanarak doğu sınırımızın kesinleşmesi", "İtalya''nın Anadolu''daki işgal kuvvetlerini tamamen çekmesi", "İngiltere ile esir değişimi antlaşmasının yapılması", "Yunanistan''ın Sevr Antlaşması''nı tek taraflı olarak onaylaması"], "correctIndex": 4}'::jsonb,
  'Yunanistan Sakarya''da hezimete uğramış ve taarruz gücünü kaybederek savunmaya çekilmiştir. Sevr''i onaylamak değil, aksine toprakları boşaltma telaşına düşmüştür.',
  'Sakarya sonrası Fransa ile Ankara Antlaşması yapılarak İtilaf Bloku parçalanmış ve Güney cephesi resmen kapanmıştır.',
  78
);

-- Soru #079 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Büyük Taarruz''un zaferle sonuçlanması ve İzmir''in kurtarılmasından sonra 11 Ekim 1922''de imzalanan Mudanya Ateşkes Antlaşması ile tek bir kurşun dahi atılmadan (savaş yapılmadan) diplomatik yolla kurtarılan bölgelerimiz hangisinde doğru verilmiştir?',
  '{"options": ["Doğu Trakya - İstanbul - Boğazlar", "Batı Trakya - İzmir - Antalya", "Musul - Kerkük - Hatay", "Kars - Ardahan - Batum", "Adana - Urfa - Antep"], "correctIndex": 0}'::jsonb,
  'Mudanya Mütarekesi ile İsmet İnönü''nün diplomasisi sayesinde Doğu Trakya (Edirne, Tekirdağ, Kırklareli), İstanbul ve Boğazlar savaş yapılmadan teslim alınmıştır. Ayrıca Osmanlı Hükümeti hukuken yok sayılmıştır.',
  'Doğu Trakya, İstanbul ve Boğazlar ''savaşsız kurtarılan'' bölgelerdir. Trakya Yüksek Komiseri olarak teslim alan milli kahramanımız Refet Bele''dir.',
  79
);

-- Soru #080 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '24 Temmuz 1923''te imzalanan Lozan Barış Antlaşması''nda Misak-ı Milli sınırları dışında kalan ve çözümü Türkiye ile İngiltere''nin ikili müzakerelerine bırakılan tek sınır meselesi aşağıdakilerden hangisidir?',
  '{"options": ["Musul (Irak Sınırı)", "Hatay (Suriye Sınırı)", "Batı Trakya", "Karasu Sınırı", "On İki Ada"], "correctIndex": 0}'::jsonb,
  'Lozan''da çözülemeyip 9 ay içinde ikili müzakerelere bırakılan yegane konu Musul Sorunudur (Irak Sınırı). Hatay ise 1921 Ankara Antlaşması şartlarıyla Suriye mandasında kalmıştır.',
  'Lozan''da çözülemeyen TEK konu Musul''dur. Hatay çözülmüş fakat aleyhimize çözülmüştür.',
  80
);


-- -------------------------------------------------------------
-- ATATÜRK İLKE VE İNKILAPLARI (80 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal''in askeri idadi (lise) yıllarında vatan ve hürriyet şairi Namık Kemal''in şiirleriyle tanıştığı, edebiyat öğretmeni Mehmet Asım Efendi''nin hitabetine katkı sağladığı ve tarih öğretmeni Kolağası Mehmet Tevfik Bey sayesinde tarih bilincinin geliştiği şehir aşağıdakilerden hangisidir?',
  '{"options": ["Selanik", "Manastır", "Sofya", "Şam", "İstanbul"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal, 1896-1899 yılları arasında Manastır Askeri İdadisi''nde öğrenim görmüştür. Bu dönemde tarih öğretmeni Kolağası Mehmet Tevfik Bey''den tarih sevgisi kazanmış, Namık Kemal ve Mehmet Emin Yurdakul''un eserleriyle milliyetçilik ve hürriyet duygularını pekiştirmiştir. Ayrıca bu okulda Ömer Naci vesilesiyle edebiyata ve hitabete ilgi duymuştur.',
  'Adayların birçoğu Mustafa Kemal''in doğup ilkokul ve rüştiye eğitimini aldığı ''Selanik'' şıkkına veya yükseköğrenimini tamamladığı ''İstanbul'' şıkkına yönelebilmektedir. Ancak askeri lise (idadi) eğitimi ve Kolağası Mehmet Tevfik Bey ile tanışması Manastır''dadır.',
  1
);

-- Soru #002 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Mustafa Kemal, 1905 yılında Harp Akademisi''nden kurmay yüzbaşı rütbesiyle mezun olduktan sonra ilk görev yeri olan Şam''daki 5. Ordu''ya atanmıştır.

Mustafa Kemal''in Şam''da iken vatanın kurtuluşu ve hürriyet fikirlerini yaymak amacıyla kurduğu gizli cemiyet aşağıdakilerden hangisidir?',
  '{"options": ["İttihat ve Terakki Cemiyeti", "Vatan ve Hürriyet Cemiyeti", "Milli Kongre Cemiyeti", "Karakol Cemiyeti", "Hürriyet ve İtilaf Fırkası"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal, ilk görev yeri olan Şam 5. Ordu''da arkadaşlarıyla birlikte 1905 yılında ''Vatan ve Hürriyet Cemiyeti''ni kurmuştur. Daha sonra bu cemiyetin bir şubesini gizlice Selanik''te açmış, sonrasında ise İttihat ve Terakki Cemiyeti ile birleşmiştir.',
  'Mustafa Kemal daha sonra İttihat ve Terakki''ye üye olduğu için en güçlü çeldirici İttihat ve Terakki''dir. Ancak bizzat Şam''da kurduğu çekirdek teşkilat Vatan ve Hürriyet Cemiyeti''dir.',
  2
);

-- Soru #003 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün 1919-1927 yılları arasındaki Milli Mücadele ve inkılap sürecini bizzat kaleme aldığı, ''1919 yılı Mayısının 19''uncu günü Samsun''a çıktım.'' cümlesiyle başlayıp ''Gençliğe Hitabe'' ile sona eren abidevi eseri aşağıdakilerden hangisidir?',
  '{"options": ["Medeni Bilgiler", "Nutuk (Söylev)", "Zabit ve Kumandan ile Hasbihal", "Geometri Kılavuzu", "Cumalı Ordugahı"], "correctIndex": 1}'::jsonb,
  'Nutuk, Mustafa Kemal Atatürk tarafından 1927 yılında CHP 2. Kurultayı''nda 6 gün boyunca (36,5 saat) okunmuş tarihi bir belgedir. 1919 Samsun''a çıkıştan 1927 yılına kadarki gelişmeleri kapsar ve telif hakkı Türk Hava Kurumu''na (Türk Tayyare Cemiyeti) bağışlanmıştır.',
  'Nutuk''un kapsam tarihi 1919-1927 arasıdır. Sıklıkla 1938''e kadar olan dönemi de anlattığı sanılır; oysa 1927 sonrasındaki gelişmeler (örneğin Harf İnkılabı, Menemen Olayı, Montrö, Hatay) Nutuk''ta yer almaz!',
  3
);

-- Soru #004 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk, askerlik ve sivil yaşamı boyunca pek çok eser kaleme almıştır.

Aşağıdakilerden hangisi Atatürk''ün yazdığı veya katkı sağladığı eserlerden biri değildir?',
  '{"options": ["Zabit ve Kumandan ile Hasbihal", "Geometri", "Medeni Bilgiler", "Cumalı Ordugahı", "Zeytindağı"], "correctIndex": 4}'::jsonb,
  '''Zeytindağı'', Falih Rıfkı Atay''ın I. Dünya Savaşı''nda Cemal Paşa''nın karargahında iken Filistin ve Suriye cephesi anılarını anlattığı ünlü edebi/tarihi eseridir; Atatürk''e ait değildir. Zabit ve Kumandan ile Hasbihal, Geometri, Medeni Bilgiler (Afet İnan adına bastırılan kısımlar) ve Cumalı Ordugahı Atatürk''ün eserleridir.',
  'Geometri kitabı veya Cumalı Ordugahı adaylarca bilinmediğinde Atatürk''e ait olmadığı sanılabilir; oysa üçgen, açı, boyut gibi Türkçe terimleri bizzat Atatürk Geometri kitabıyla literatüre kazandırmıştır.',
  4
);

-- Soru #005 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'İtilaf Devletleri''nin Lozan Barış Konferansı''na TBMM Hükümeti''nin yanında İstanbul Hükümeti''ni de davet ederek Türk tarafı arasında ikilik çıkarmak istemesi üzerine, TBMM tarafından 1 Kasım 1922 tarihinde alınan tarihi karar aşağıdakilerden hangisidir?',
  '{"options": ["Cumhuriyetin ilan edilmesi", "Saltanatın kaldırılması", "Halifeliğin kaldırılması", "Tekke ve zaviyelerin kapatılması", "Takrir-i Sükun Kanunu''nun kabulü"], "correctIndex": 1}'::jsonb,
  'Lozan Konferansı''na hem TBMM hem de İstanbul Hükümeti davet edilince, ikiliği önlemek ve ulusal egemenliği tek elde toplamak amacıyla 1 Kasım 1922''de saltanat kaldırılmıştır. Böylece 623 yıllık Osmanlı Devleti resmen sona ermiştir.',
  'Adaylar 1 Kasım 1922''de hem saltanatın hem de halifeliğin aynı anda kaldırıldığını zannedebilir. Oysa 1 Kasım 1922''de sadece saltanat kaldırılmış; halifelik kurumuna ise toplumsal tepkileri önlemek amacıyla 3 Mart 1924''e kadar dokunulmamıştır.',
  5
);

-- Soru #006 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Milli Mücadele''nin sevk ve idare merkezi olan, jeopolitik, askeri ve coğrafi konumu itibarıyla güvenli bir noktada bulunan Ankara, İsmet İnönü ve arkadaşlarının verdiği kanun teklifinin kabul edilmesiyle hangi tarihte Türkiye Devleti''nin resmi başkenti olmuştur?',
  '{"options": ["23 Nisan 1920", "11 Ekim 1922", "13 Ekim 1923", "29 Ekim 1923", "3 Mart 1924"], "correctIndex": 2}'::jsonb,
  'Ankara, Cumhuriyetin ilanından 16 gün önce, 13 Ekim 1923 tarihinde TBMM kararıyla Türkiye Devleti''nin başkenti ilan edilmiştir.',
  'Adaylar başkentin Cumhuriyetin ilanıyla (29 Ekim 1923) aynı gün veya TBMM''nin açılışında (23 Nisan 1920) yasalaştığını düşünebilir. Başkent kanunu 13 Ekim 1923''tedir.',
  6
);

-- Soru #007 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyetin ilan edilmesinde; devlet başkanlığı sorununun çözülmesi ve rejim tartışmalarına son verilmesi gereğinin yanı sıra, Ali Fethi Okyar Hükümeti''nin istifasıyla patlak veren ve Meclis Hükümeti sisteminin tıkanmasına yol açan ''Ekim Bunalımı'' (Hükümet Krizi) etkili olmuştur.

29 Ekim 1923''te Cumhuriyetin ilanı ile birlikte Meclis Hükümeti sisteminden hangi yönetim sistemine geçilmiştir?',
  '{"options": ["Kabine Sistemi", "Başkanlık Sistemi", "Mutlakiyet Sistemi", "Yarı Başkanlık Sistemi", "Doğrudan Demokrasi Sistemi"], "correctIndex": 0}'::jsonb,
  'Cumhuriyetin ilanıyla birlikte Meclis Hükümeti sistemi (bakanların meclis tarafından tek tek oylanarak seçildiği ve kriz yaratan sistem) terk edilmiş, başbakanın bakanları belirleyip cumhurbaşkanına sunduğu ''Kabine Sistemi''ne geçilmiştir. İlk Başbakan İsmet İnönü, ilk Cumhurbaşkanı Mustafa Kemal, ilk Meclis Başkanı ise Ali Fethi Okyar olmuştur.',
  'Sistem ismi konusunda Başkanlık sistemi ile karıştırılabilir. Türkiye 1923''te parlamenter kabine sistemine geçmiştir.',
  7
);

-- Soru #008 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '29 Ekim 1923 tarihinde Cumhuriyetin ilan edilmesinin ardından Türkiye Cumhuriyeti Devleti''nin ilk kadroları teşekkül etmiştir.

Buna göre, Cumhuriyetin ilanından sonra seçilen ''ilk Cumhurbaşkanı'', ''ilk Başbakan'' ve ''ilk TBMM Başkanı'' eşleştirmesi aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["Mustafa Kemal Paşa - Fevzi Çakmak - Kazım Karabekir", "Mustafa Kemal Paşa - İsmet İnönü - Ali Fethi Okyar", "Mustafa Kemal Paşa - Rauf Orbay - Refet Bele", "İsmet İnönü - Mustafa Kemal Paşa - Celal Bayar", "Mustafa Kemal Paşa - Ali Fethi Okyar - İsmet İnönü"], "correctIndex": 1}'::jsonb,
  '29 Ekim 1923''te Cumhuriyet ilan edildikten sonra oy birliğiyle ilk Cumhurbaşkanı Gazi Mustafa Kemal Paşa seçilmiştir. Mustafa Kemal''in hükümeti kurmakla görevlendirdiği İsmet (İnönü) Paşa ilk Başbakan olmuş; boşalan TBMM Başkanlığına ise Ali Fethi (Okyar) Bey seçilmiştir.',
  'Cumhuriyetin ilanından önceki icra vekilleri heyeti başkanı olan Rauf Orbay veya Fethi Okyar ile ilk Başbakanlık makamı karıştırılmamalıdır. Cumhuriyetin ilk Başbakanı İsmet İnönü''dür.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '3 Mart 1924 tarihi Türk modernleşmesi ve laik hukuk devleti açısından en önemli dönüm noktalarından biridir.

Aşağıdakilerden hangisi 3 Mart 1924 tarihinde kabul edilen kanunlar veya gerçekleştirilen inkılaplardan biri değildir?',
  '{"options": ["Halifeliğin kaldırılması", "Tevhid-i Tedrisat Kanunu''nun kabul edilmesi", "Şeriye ve Evkaf Vekaleti''nin kaldırılması", "Erkan-ı Harbiye-i Umumiye Vekaleti''nin kaldırılması", "Tekke, zaviye ve türbelerin kapatılması"], "correctIndex": 4}'::jsonb,
  '3 Mart 1924 günü Mecliste kabul edilen kanunlar: 1) Halifeliğin kaldırılması ve Osmanlı Hanedanı''nın yurt dışına çıkarılması, 2) Tevhid-i Tedrisat Kanunu, 3) Şeriye ve Evkaf Vekaleti''nin kaldırılması (yerine Diyanet İşleri Başkanlığı ve Vakıflar Genel Müdürlüğü kuruldu), 4) Erkan-ı Harbiye Vekaleti''nin kaldırılması (ordunun siyasetten ayrılması, Genelkurmay Başkanlığı kurulması). Tekke, zaviye ve türbelerin kapatılması ise 30 Kasım 1925 tarihindedir.',
  '3 Mart 1924 kanunları ''devrim yasaları paketi'' olarak geçer. Tekke ve zaviyelerin kapatılması da dini alanla ilgili olduğu için sıklıkla bu tarihe dahil zannedilir; oysa Şeyh Sait İsyanı sonrasında, 1925 yılı sonundadır.',
  9
);

-- Soru #010 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  3,
  '1924 Anayasası, Türkiye Cumhuriyeti''nin en uzun süre yürürlükte kalan kurucu anayasasıdır. Dönemin şartları gereği meclis hükümeti sistemi ile parlamenter sistem arasında karma bir yapı benimsemiştir.

1924 Anayasası''nda laikleşme yolunda atılan ilk anayasal adım aşağıdakilerden hangisidir?',
  '{"options": ["Atatürk ilkelerinin anayasaya dahil edilmesi (1937)", "''Devletin dini İslam''dır'' ibaresinin anayasa metninden çıkarılması (1928)", "Kadınlara milletvekili seçme ve seçilme hakkının verilmesi (1934)", "Milletvekili yemin metnindeki dini ifadelerin kaldırılması (1928)", "Çok partili hayata geçişin anayasada güvenceye alınması (1946)"], "correctIndex": 1}'::jsonb,
  '10 Nisan 1928''de 1924 Anayasası''nda yapılan değişiklikle ''Devletin dini İslam''dır'' maddesi anayasadan çıkarılmış ve milletvekili yeminindeki ''vallahi'' kelimesi ''namusum ve şerefim üzerine ant içerim'' şeklinde değiştirilmiştir. Bu adım anayasanın laikleşmesinde temel dönüm noktasıdır. 1937''de ise Atatürk ilkeleri anayasaya eklenmiştir.',
  'ÖSYM bu soruda sıklıkla 1937''yi (Laiklik dahil 6 ilkenin anayasaya girişi) sorar. Ancak ''Devletin dini İslam''dır'' maddesinin çıkarılması 1928 yılındadır.',
  10
);

-- Soru #011 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminin ilk muhalefet partisi olan ve Kazım Karabekir, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele ile Adnan Adıvar gibi Milli Mücadele''nin önde gelen komutan ve devlet adamları tarafından kurulan parti aşağıdakilerden hangisidir?',
  '{"options": ["Serbest Cumhuriyet Fırkası", "Terakkiperver Cumhuriyet Fırkası", "Demokrat Parti", "Milli Kalkınma Partisi", "Ahali Cumhuriyet Fırkası"], "correctIndex": 1}'::jsonb,
  '17 Kasım 1924''te kurulan Terakkiperver Cumhuriyet Fırkası (TCF), Türkiye Cumhuriyeti''nin ilk muhalefet partisidir. Kurucuları ''K-A-R-A-R'' (Kazım Karabekir, Adnan Adıvar, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele) olarak kodlanır. Genel başkanı Kazım Karabekir''dir. Ekonomide liberalizmi savunmuş, tüzüğündeki ''Fırka, dini düşünce ve inançlara saygılıdır'' maddesi irtica yanlılarının partiye sızmasına yol açmıştır.',
  'Serbest Cumhuriyet Fırkası ikinci muhalefet partisidir (1930) ve Ali Fethi Okyar tarafından kurulmuştur. İlk muhalefet partisi Kazım Karabekir başkanlığındaki Terakkiperver Cumhuriyet Fırkası''dır.',
  11
);

-- Soru #012 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1925 yılında Doğu Anadolu''da saltanat ve hilafeti geri getirmek amacıyla patlak veren Şeyh Sait İsyanı''nı bastırmak amacıyla hükümet değişikliğine gidilmiş ve sert tedbirler içeren bir kanun çıkarılmıştır.

Bu bağlamda; isyan sürecinde istifa eden Ali Fethi Okyar yerine başbakanlığa getirilen devlet adamı ve 4 Mart 1925''te çıkarılan olağanüstü kanun aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["İsmet İnönü - Takrir-i Sükun Kanunu", "Rauf Orbay - Hıyanet-i Vataniye Kanunu", "Kazım Karabekir - Teşkilat-ı Esasiye Kanunu", "Celal Bayar - Firariler Kanunu", "Fevzi Çakmak - Men-i Müskirat Kanunu"], "correctIndex": 0}'::jsonb,
  'Şeyh Sait İsyanı bastırılamayınca Ali Fethi Okyar istifa etmiş, yerine hükümeti kuran İsmet İnönü 4 Mart 1925''te ''Takrir-i Sükun Kanunu''nu (Huzuru Sağlama Kanunu) meclisten geçirmiştir. İstiklal Mahkemeleri yeniden kurulmuş, isyan bastırılmış ve TCF kapatılmıştır.',
  'Adaylar Şeyh Sait İsyanı sırasında başbakanın baştan beri İsmet İnönü olduğunu sanabilir veya Hıyanet-i Vataniye Kanunu ile Takrir-i Sükun''u karıştırabilir. 1920''de TBMM''ye karşı ayaklanmalarda Hıyanet-i Vataniye; 1925 rejim karşıtı isyanda Takrir-i Sükun Kanunu çıkarılmıştır.',
  12
);

-- Soru #013 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1926 yılında Mustafa Kemal Atatürk''e karşı planlanan ancak Giritli Şevki''nin ihbarı sayesinde açığa çıkarılan suikast girişimi sonrasında Mustafa Kemal Paşa''nın söylediği tarihi söz aşağıdakilerden hangisidir?',
  '{"options": ["Ordular! İlk hedefiniz Akdeniz''dir, ileri!", "Geldikleri gibi giderler.", "Benim naçiz vücudum bir gün elbet toprak olacaktır fakat Türkiye Cumhuriyeti ilelebet payidar kalacaktır.", "Siz orada yalnız düşmanı değil, milletin makus talihini de yendiniz.", "Yurtta sulh, cihanda sulh."], "correctIndex": 2}'::jsonb,
  '16 Haziran 1926 İzmir Suikastı teşebbüsü sonrası Mustafa Kemal Atatürk, Anadolu Ajansı''na verdiği demeçte ''Benim naçiz vücudum bir gün elbet toprak olacaktır fakat Türkiye Cumhuriyeti ilelebet payidar kalacaktır.'' demiştir.',
  'Bu ünlü sözün nerede söylendiği ÖSYM tarafından sıkça sorulur. Genellikle Cumhuriyetin ilanı veya ölüm döşeğindeki bir vasiyetle karıştırılır; oysa İzmir Suikastı girişimi sonrasındaki demecidir.',
  13
);

-- Soru #014 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1929 Dünya Ekonomik Bunalımı''nın olumsuz etkilerini hafifletmek, hükümeti denetlemek ve çok partili yaşama geçmek amacıyla bizzat Atatürk''ün teşvikiyle Ali Fethi Okyar tarafından kurulan Serbest Cumhuriyet Fırkası''nın kapatılma/feshedilme süreciyle ilgili aşağıdaki ifadelerden hangisi doğrudur?',
  '{"options": ["Şeyh Sait İsyanı''na destek verdiği gerekçesiyle İstiklal Mahkemesi kararıyla kapatılmıştır.", "Menemen Olayı (Kubilay Hadisesi) sonrasında hükümet tarafından resmen kapatılmıştır.", "Parti içine rejim karşıtı mürtecilerin sızdığını gören Ali Fethi Okyar tarafından bizzat feshedilmiştir.", "İzmir Suikastı davası sonucunda kapatılmıştır.", "Anayasa Mahkemesi kararıyla laikliğe aykırı eylemlerden ötürü kapatılmıştır."], "correctIndex": 2}'::jsonb,
  'Serbest Cumhuriyet Fırkası (12 Ağustos 1930), partinin rejim karşıtlarının odağı haline geldiğini gören kurucusu Ali Fethi Okyar tarafından 17 Kasım 1930''da bizzat feshedilmiştir (kendi kendini kapatmıştır). Partinin feshinden yaklaşık bir ay sonra (23 Aralık 1930) Menemen Olayı meydana gelmiştir.',
  'EN BÜYÜK ÖSYM ÇELDİRİCİSİ: Menemen Olayı yüzünden SCF''nin kapatıldığı sanılır. Oysa Menemen Olayı gerçekleştiğinde SCF zaten kendini feshetmiş durumdaydı!',
  14
);

-- Soru #015 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '17 Şubat 1926 tarihinde kabul edilen ve İsviçre''den uyarlanan Türk Medeni Kanunu ile Türk aile yapısında ve sosyal hayatında köklü dönüşümler sağlanmıştır.

Aşağıdakilerden hangisi 1926 Türk Medeni Kanunu ile kadınlara sağlanan haklardan biri değildir?',
  '{"options": ["Miras paylaşımında kadın ve erkek eşitliğinin sağlanması", "Mahkemelerde kadın ve erkeğin şahitliğinin eşit kılınması", "Tek eşle evlilik (monogami) ve resmi nikah zorunluluğunun getirilmesi", "İstediği mesleğe serbestçe girebilme hakkı", "Belediye ve milletvekili seçimlerinde oy kullanma hakkı"], "correctIndex": 4}'::jsonb,
  '1926 Türk Medeni Kanunu yalnızca sosyal, hukuki ve ekonomik haklar düzenlemiştir. KADINLARA SİYASİ HAKLAR (seçme ve seçilme) MEDENİ KANUN İLE VERİLMEMİŞTİR! Siyasi haklar daha sonra 1930 (Belediye), 1933 (Muhtarlık) ve 1934 (Milletvekilliği) kanunlarıyla anayasal düzenlemeyle verilmiştir.',
  'ÖSYM''nin en sevdiği klasik sorudur: Medeni Kanun''da siyasi hak (seçme-seçilme) KESİNLİKLE YOKTUR. Adaylar kadın haklarının tümünün Medeni Kanun ile geldiğini zannederek yanılır.',
  15
);

-- Soru #016 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde modern ve laik bir hukuk düzeni kurmak amacıyla Avrupa''nın gelişmiş kanunları incelenerek Türk hukuk sistemine uyarlanmıştır.

Buna göre, 1926 yılında yürürlüğe giren ve ceza yargılamasında esas alınan Türk Ceza Kanunu aşağıdaki ülkelerin hangisinden iktibas edilerek (uyarlanarak) alınmıştır?',
  '{"options": ["İsviçre", "Almanya", "İtalya", "Fransa", "İsveç"], "correctIndex": 2}'::jsonb,
  'Türk Ceza Kanunu (1926) İtalya''dan; Medeni Kanun ve Borçlar Kanunu İsviçre''den; Ticaret Kanunu Almanya''dan; İdare Hukuku ve İdare Mahkemeleri teşkilatı Fransa''dan iktibas edilmiştir.',
  'Medeni Kanun İsviçre''den alındığı için tüm kanunların İsviçre''den alındığı yanılgısına düşülür. Ceza Kanunu İtalya''dan (Zanardelli Kanunu temel alınarak) uyarlanmıştır.',
  16
);

-- Soru #017 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '3 Mart 1924 tarihinde kabul edilen Tevhid-i Tedrisat (Öğretim Birliği) Kanunu ile;
I. Türkiye sınırları içindeki tüm okullar Maarif Vekaleti''ne (Milli Eğitim Bakanlığı) bağlanmıştır.
II. Eğitimde ikiliğe yol açan medreseler kapatılmıştır.
III. Eğitim ve öğretim laik, milli ve çağdaş bir yapıya kavuşturulmuştur.

Bu inkılap doğrudan aşağıdaki Atatürk ilkelerinden hangileriyle ilişkilidir?',
  '{"options": ["Yalnızca Devletçilik", "Milliyetçilik ve Laiklik", "Yalnızca Cumhuriyetçilik", "Cumhuriyetçilik ve Devletçilik", "Yalnızca Barışçılık"], "correctIndex": 1}'::jsonb,
  'Tevhid-i Tedrisat Kanunu tüm okulları tek çatı altında toplayıp yabancı okulların denetimsizliğini önleyerek milli bir müfredat getirdiği için ''Milliyetçilik''; medreseleri kapatıp akılcı ve bilime dayalı eğitime geçtiği için ''Laiklik'' ve imtiyazsız eşit eğitim sunduğu için ''Halkçılık'' ilkeleriyle doğrudan bağlantılıdır.',
  'Tevhid-i Tedrisat bir kanun olduğu için sadece devletle ilgili görülüp devletçilik sanılabilir; oysa eğitimde birlik ''Milliyetçilik'', akıl ve bilim ekseni ise ''Laiklik''tir.',
  17
);

-- Soru #018 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  '1 Kasım 1928 tarihinde Türk harflerinin kabul edilmesinin ardından, yeni harfleri halka öğretmek ve okuma-yazma seferberliğini yurt geneline yaymak amacıyla 24 Kasım 1928''de açılan ve Atatürk''e ''Başöğretmen'' unvanı verilen eğitim kurumları aşağıdakilerden hangisidir?',
  '{"options": ["Halkevleri", "Köy Enstitüleri", "Millet Mektepleri", "Darülfünun", "Musiki Muallim Mektebi"], "correctIndex": 2}'::jsonb,
  'Yeni Türk Harflerinin Kabulü Kanunu 1 Kasım 1928''de çıkmıştır. Harfleri yetişkin halka öğretmek amacıyla 24 Kasım 1928''de Millet Mektepleri açılmış ve Mustafa Kemal Atatürk bu kurumun ''Başöğretmeni'' ilan edilmiştir (Bu nedenle her 24 Kasım Öğretmenler Günü olarak kutlanır).',
  'Halkevleri (1932) ve Köy Enstitüleri (1940) ile karıştırılır. Harf inkılabı sonrası okuma yazma kursları niteliğinde açılan teşkilat Millet Mektepleri''dir.',
  18
);

-- Soru #019 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün ''Türk çocuğu ecdadını tanıdıkça daha büyük işler yapmak için kendinde kuvvet bulacaktır.'' sözü doğrultusunda, Türk tarihinin sadece Osmanlı ve Selçuklu''dan ibaret olmadığını, köklerinin Orta Asya ve Anadolu''nun kadim uygarlıklarına dayandığını ortaya koymak amacıyla 1931 yılında kurulan kurum ve yayın organı aşağıdakilerden hangisidir?',
  '{"options": ["Türk Tarih Kurumu - Belleten", "Türk Dil Kurumu - Türk Dili", "Halkevleri - Ülkü", "Tarih-i Osmani Encümeni - Mecmua", "Milletlerarası Şarkiyatçılar Birliği - Varlık"], "correctIndex": 0}'::jsonb,
  '1931''de Türk Tarihi Tetkik Cemiyeti (daha sonra Türk Tarih Kurumu - TTK) kurulmuştur. İlk başkanı Tevfik Bıyıklıoğlu''dur. Kurumun çıkardığı ve bizzat Atatürk''ün vefatından önceki son günlerinde okuduğu bilimsel yayın organı ''Belleten'' dergisidir.',
  'Halkevlerinin yayın organı ''Ülkü'', Türk Tarih Kurumu''nunki ise ''Belleten'' dergisidir. ÖSYM Belleten dergisini ve ilk başkanı Tevfik Bıyıklıoğlu''nu sıklıkla sorgulamaktadır.',
  19
);

-- Soru #020 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1932 yılında kurulan ve ilk başkanı Samih Rıfat olan Türk Dili Tetkik Cemiyeti (Türk Dil Kurumu), Türkçenin zenginliğini ortaya çıkarmak, yabancı kelimelerin istilasından korumak ve halk dili ile aydın dili arasındaki kopukluğu gidermek amacıyla çalışmalar yapmıştır.

Atatürk döneminde Türk dilinin dünyadaki en eski kültür dillerinden biri olduğunu kanıtlamak amacıyla savunulan ve uluslararası kurultaylarda tartışılan dil teorisi aşağıdakilerden hangisidir?',
  '{"options": ["Turan Tezi", "Güneş Dil Teorisi", "Ural-Altay Kuramı", "Öztürkçe İdeali", "Sümer-Akad Dil Ekolü"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal Atatürk''ün himayesinde 1935-1936 yıllarında geliştirilen ve Viyanalı dilbilimci Hermann Kvergic''in çalışmasından esinlenilen teori ''Güneş Dil Teorisi''dir. Bu teoriyle tüm insan dillerinin Türkçeden türediği savunularak aşırı tasfiyeciliğin (Türkçeleştirme sırasında dilin kısırlaşmasının) önüne geçilmeye çalışılmıştır.',
  'Ural-Altay dil kuramı genel dilbilim teorisidir. Atatürk''ün desteklediği ve Türkçenin kökenini güneşe ve doğaya bağlayan özel teori Güneş Dil Teorisi''dir.',
  20
);

-- Soru #021 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1932 yılında kapatılan Türk Ocakları''nın binaları ve mal varlığı devralınarak kurulan, halkı Cumhuriyet inkılapları etrafında bilinçlendirmek, kültürel ve sanatsal faaliyetleri tabana yaymak amacıyla faaliyet gösteren kurum ve resmi yayın organı aşağıdakilerden hangisidir?',
  '{"options": ["Millet Mektepleri - İkdam", "Halkevleri - Ülkü Dergisi", "Köy Muallim Mektebi - Kadro Dergisi", "Tercüme Odası - Ceride-i Havadis", "Anadolu Kulübü - Hakimiyet-i Milliye"], "correctIndex": 1}'::jsonb,
  'Halkevleri, 19 Şubat 1932''de kurulmuş ve 9 farklı çalışma şubesiyle (dil, tarih, edebiyat, güzel sanatlar, tiyatro, spor, içtimai yardım, halk dershaneleri, köycülük, müze ve sergi) halkın aydınlanmasına katkı sağlamıştır. Yayın organı ''Ülkü'' dergisidir.',
  'Kadro dergisi (Şevket Süreyya Aydemir, Yakup Kadri vb.) devleti ve Kemalizm''i kuramsallaştıran aydınların dergisidir; Halkevleri''nin resmi yayın organı Ülkü dergisidir.',
  21
);

-- Soru #022 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde yükseköğretimi modernleştirmek amacıyla İsviçreli pedagog Prof. Dr. Albert Malche Türkiye''ye davet edilmiş ve hazırladığı kapsamlı rapor doğrultusunda 1933 yılında bir reform gerçekleştirilmiştir.

Bu reform neticesinde Osmanlı''dan kalan Darülfünun kapatılarak yerine kurulan modern Türk üniversitesi aşağıdakilerden hangisidir?',
  '{"options": ["Ankara Üniversitesi", "İstanbul Üniversitesi", "Orta Doğu Teknik Üniversitesi", "İstanbul Teknik Üniversitesi", "Gazi Üniversitesi"], "correctIndex": 1}'::jsonb,
  '1933 Üniversite Reformu ile Osmanlı''dan kalan ve inkılaplara kayıtsız kalan Darülfünun lağvedilmiş, 1 Ağustos 1933''te Türkiye''nin ilk modern üniversitesi olan ''İstanbul Üniversitesi'' kurulmuştur. Nazi Almanyası''ndan kaçan pek çok Musevi asıllı bilim insanı da burada istihdam edilmiştir.',
  'Ankara Üniversitesi Cumhuriyetin bizzat kurduğu ilk fakültelerin (Hukuk Mektebi, Dil ve Tarih-Coğrafya Fakültesi) birleşimiyle 1946''da tüzel kişilik kazanmıştır. Darülfünun''un dönüştüğü üniversite ise İstanbul Üniversitesi''dir.',
  22
);

-- Soru #023 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Mustafa Kemal Paşa, 1925 yılında gerçekleştirdiği yurt gezisinde halkın karşısına başında panama şapka ile çıkmış, ''Buna şapka derler.'' diyerek modern kılık-kıyafet inkılabının ilk işaretini vermiştir.

Mustafa Kemal''in şapka inkılabını ilk kez tanıttığı ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["İzmir", "Kastamonu", "Konya", "Samsun", "Erzurum"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal, 23-31 Ağustos 1925 tarihlerinde Kastamonu ve İnebolu gezisinde şapkayı halka tanıtmış ve 25 Kasım 1925 tarihinde çıkarılan Şapka İktisası Hakkında Kanun ile fes, sarık vb. yerine şapka giyilmesi zorunlu kılınmıştır.',
  'Adaylar şapkanın batıya daha yakın olan İzmir veya İstanbul''da tanıtıldığını düşünebilir. Atatürk şapkayı bizzat Karadeniz''de, Kastamonu (İnebolu) gezisinde tanıtmıştır.',
  23
);

-- Soru #024 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün; ''Türkiye Cumhuriyeti şeyhler, dervişler, müritler ve mensuplar memleketi olamaz. En doğru, en hakiki tarikat medeniyet tarikatıdır.'' sözü, aşağıdaki inkılaplardan hangisinin gerekçesini oluşturmaktadır?',
  '{"options": ["Saltanatın kaldırılması", "Tevhid-i Tedrisat Kanunu", "Tekke, zaviye ve türbelerin kapatılması", "Soyadı Kanunu''nun kabul edilmesi", "Şeriye ve Evkaf Vekaleti''nin kaldırılması"], "correctIndex": 2}'::jsonb,
  'Mustafa Kemal''in bu ünlü sözü 30 Kasım 1925 tarihinde çıkarılan 677 sayılı ''Tekke, Zaviye ve Türbelerin Kapatılması Hakkında Kanun''un ruhunu ve temel felsefesini yansıtmaktadır.',
  'Bu söz sıklıkla Halifeliğin kaldırılması (1924) ile ilişkilendirilir. Oysa doğrudan tekke, zaviye ve türbelerin kapatılması (1925) sürecinde söylenmiştir.',
  24
);

-- Soru #025 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Türkiye Cumhuriyeti''nde Türk kadınına siyasal haklar aşamalı olarak tanınmıştır.

Buna göre Türk kadınlarına tanınan siyasi hakların kronolojik sırası aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["Belediye Seçimleri (1930) - Muhtarlık Seçimleri (1933) - Milletvekilliği (1934)", "Muhtarlık Seçimleri (1930) - Belediye Seçimleri (1933) - Milletvekilliği (1934)", "Milletvekilliği (1930) - Belediye Seçimleri (1933) - Muhtarlık Seçimleri (1934)", "Belediye Seçimleri (1926) - Muhtarlık Seçimleri (1930) - Milletvekilliği (1934)", "Köy İhtiyar Heyeti (1930) - Milletvekilliği (1933) - Belediye Seçimleri (1934)"], "correctIndex": 0}'::jsonb,
  'Kadınlara siyasi hakların veriliş sırası KPSS''de ''034 BMW'' (Belediye 1930, Muhtarlık 1933, Vekillik 1934) şeklinde kodlanır: 1930 Belediye, 1933 Muhtarlık (İlk kadın muhtar Gülesin Hanım), 1934 Milletvekili seçme ve seçilme hakkı (1935 seçimlerinde meclise 18 kadın milletvekili girmiştir).',
  'Adaylar 1926 Medeni Kanun ile siyasi hakların başladığını zannedebilir veya 1930 Belediye ile 1933 Muhtarlık sırasını karıştırabilir.',
  25
);

-- Soru #026 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde kadınların meslek hayatında etkin rol alması teşvik edilmiş ve birçok alanda ilk kadın öncüler yetişmiştir.

Buna göre aşağıdaki ''ilk Türk kadını'' ve ''meslek/görev'' eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Sabiha Gökçen - İlk kadın savaş pilotu", "Gül Esin - İlk kadın muhtar", "Afife Jale - İlk tiyatro sahnesine çıkan Müslüman Türk kadını", "Sadiye Hanım - İlk kadın belediye başkanı", "Türkan Akyol - İlk kadın hekim"], "correctIndex": 4}'::jsonb,
  'İlk Türk kadın hekim Safiye Ali''dir. Türkan Akyol ise Türkiye''nin ilk kadın bakanıdır (1971 Nihat Erim Hükümeti''nde Sağlık Bakanı). Bu nedenle eşleştirme yanlıştır.',
  'Safiye Ali (ilk hekim), Türkan Akyol (ilk bakan) ve Tansu Çiller (ilk başbakan) ÖSYM''nin karıştırmayı en çok sevdiği kadın öncülerdir.',
  26
);

-- Soru #027 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Barış görüşmelerine ara verildiği dönemde (17 Şubat - 4 Mart 1923) toplanan ve yeni Türkiye''nin ekonomi rotasını belirleyen İzmir İktisat Kongresi ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Kongre başkanlığını Kazım Karabekir Paşa yürütmüştür.", "Kongrede oy birliğiyle ''Misak-ı İktisadi'' (Milli Ekonomi Andı) kabul edilmiştir.", "Yabancı sermayeye, milli menfaatlere ve kanunlara saygılı olmak şartıyla kapılar tamamen kapatılmamıştır.", "Kongrede doğrudan Sovyet tipi katı kolektivist ve komünist bir ekonomi modeli benimsenmiştir.", "Kongreye tüccar, çiftçi, sanayici ve işçi temsilcileri katılarak geniş bir uzlaşı sağlanmıştır."], "correctIndex": 3}'::jsonb,
  'İzmir İktisat Kongresi''nde komünist/kolektivist model değil, milli ve bağımsız bir piyasa ekonomisi (özel sektörü destekleyen liberal eğilimli karma model) benimsenmiştir. Devletçilik ilkesine ancak 1929 Büyük Buhranı sonrasında zorunlu olarak geçilmiştir.',
  'İzmir İktisat Kongresi''nin Kazım Karabekir başkanlığında toplandığı sıklıkla unutulur ve doğrudan Devletçilik ilkesinin bu kongrede kabul edildiği sanılır; oysa 1923''te özel girişim teşvik edilmiş, devletçilik 1930''lu yıllarda öne çıkmıştır.',
  27
);

-- Soru #028 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  '1 Temmuz 1926 tarihinde yürürlüğe giren ve Türkiye karasularında, limanlarında yük ve yolcu taşıma hakkını yalnızca Türk bayraklı gemilere ve Türk vatandaşlarına tanıyan kanun aşağıdakilerden hangisidir?',
  '{"options": ["Kabotaj Kanunu", "Teşvik-i Sanayi Kanunu", "Gümrük Tarife Kanunu", "Men-i İsrafat Kanunu", "Toprak Mahsulleri Vergisi Kanunu"], "correctIndex": 0}'::jsonb,
  '1 Temmuz 1926''da yürürlüğe giren Kabotaj Kanunu ile denizlerimizdeki yabancı ayrıcalıklarına son verilmiş, deniz ticareti millileştirilmiştir. Bu nedenle her 1 Temmuz ''Denizcilik ve Kabotaj Bayramı'' olarak kutlanır ve bu kanun doğrudan Milliyetçilik ilkesiyle ilişkilidir.',
  'Kabotaj Kanunu''nun denizcilikle ilgili olduğu bilinse de hangi ilkeye girdiği sorulduğunda ''Devletçilik'' sanılabilir; Türk karasularında hakimiyet sağladığı ve kapitülasyon kalıntısını kaldırdığı için temel olarak ''Milliyetçilik''tir.',
  28
);

-- Soru #029 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün talimatıyla 1924 yılında kurulan, sermayesine bizzat Atatürk''ün Hindistan Müslümanları tarafından Milli Mücadele için gönderilen paradan pay ayırdığı ve ilk genel müdürlüğünü Celal Bayar''ın yaptığı Türkiye Cumhuriyeti''nin ilk özel ulusal bankası aşağıdakilerden hangisidir?',
  '{"options": ["Merkez Bankası", "Türkiye İş Bankası", "Sümerbank", "Etibank", "Halkbank"], "correctIndex": 1}'::jsonb,
  '26 Ağustos 1924''te kurulan Türkiye İş Bankası, Türkiye''nin ilk özel/ulusal bankasıdır. İlk Genel Müdürü Celal Bayar''dır. Atatürk vasiyetinde İş Bankası''ndaki hisselerinin gelirini Türk Dil Kurumu ve Türk Tarih Kurumu''na bırakmıştır.',
  'Türkiye İş Bankası özel sermayeli bir girişim olarak kurulmuştur. Türkiye Cumhuriyet Merkez Bankası ise para basma yetkisine sahip bağımsız kamu bankası olarak 1930''da kurulmuş, 1931''de faaliyete geçmiştir.',
  29
);

-- Soru #030 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Devlet yönetiminde milli egemenliği, millet iradesini, seçme ve seçilme hakkını, çok partili siyasi hayatı ve yöneticilerin halk tarafından belirli sürelerle seçilmesini esas alan temel Atatürk ilkesi aşağıdakilerden hangisidir?',
  '{"options": ["Devletçilik", "Cumhuriyetçilik", "Halkçılık", "Laiklik", "İnkılapçılık"], "correctIndex": 1}'::jsonb,
  'Cumhuriyetçilik ilkesinin anahtar kavramları: Ulusal/milli egemenlik, meclis, seçim, çok partili rejim, oy kullanma hakkı ve milli iradedir. TBMM''nin açılması, saltanatın kaldırılması, cumhuriyetin ilanı, fırkaların kurulması cumhuriyetçilik doğrultusundadır.',
  'Ulusal bağımsızlık (Milliyetçilik) ile ulusal egemenlik (Cumhuriyetçilik) birbirine karıştırılmamalıdır. Dışa karşı bağımsızlık Milliyetçilik; milletin kendi kendini yönetmesi Cumhuriyetçiliktir.',
  30
);

-- Soru #031 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk''ün benimsediği Milliyetçilik anlayışı; ırkçılığı, kafatası ölçümünü ve ümmetçiliği reddeden, kendini Türk hisseden ve Türkiye Cumhuriyeti''ne vatandaşlık bağıyla bağlı olan herkesi Türk kabul eden birleştirici ve bütünleştirici bir karaktere sahiptir.

Buna göre aşağıdakilerden hangisi doğrudan ''Milliyetçilik'' ilkesi doğrultusunda gerçekleştirilen faaliyetlerden biri değildir?',
  '{"options": ["Türk Tarih Kurumu''nun kurulması", "Kabotaj Kanunu''nun çıkarılması", "Kapitülasyonların tamamen kaldırılması", "Merkez Bankası''nın kurularak Türk parasının değerinin korunması", "Aşar vergisinin kaldırılarak köylünün rahatlatılması"], "correctIndex": 4}'::jsonb,
  'Aşar vergisinin kaldırılması, köylü üzerindeki ağır vergi yükünü hafifleterek fırsat eşitliği ve sosyal adaleti sağladığı için doğrudan ''Halkçılık'' ilkesiyle ilgilidir. TTK, Kabotaj, Kapitülasyonların kaldırılması ve Merkez Bankası milli iktisat ve kültürle ilgili olduğundan Milliyetçiliktir.',
  'Aşar vergisi köylüden alındığı için milli bir mesele gibi görülüp milliyetçilik sanılabilir. Oysa halkın refahı ve vergi adaleti ''Halkçılık'' ilkesinin en klasik örneğidir.',
  31
);

-- Soru #032 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Halkçılık ilkesi; toplumda hiçbir sınıf, zümre veya aileye ayrıcalık tanınmamasını, kanun önünde eşitliği, sosyal dayanışmayı ve devlet imkanlarından herkesin eşit faydalanmasını savunur.

Aşağıdaki inkılaplardan hangisi doğrudan ''Halkçılık'' ilkesiyle bağdaşmaktadır?',
  '{"options": ["Ağa, paşa, hacı, hoca, bey gibi unvan ve lakapların kaldırılması", "Madencilik için Etibank''ın kurulması", "Demir yolu hatlarının yabancı şirketlerden millileştirilmesi", "Balkan Antantı''nın imzalanması", "Diyanet İşleri Başkanlığı''nın kurulması"], "correctIndex": 0}'::jsonb,
  '1934 yılında kabul edilen kanunla hacı, hoca, hafız, molla, bey, beyefendi, paşa, hanımefendi gibi ayrıcalık belirten unvan ve lakapların kaldırılması, toplumda eşitliği pekiştirdiği için doğrudan Halkçılık ilkesidir.',
  'Unvanların kaldırılması bazen Laiklik ile karıştırılır (hacı, hoca kelimelerinden ötürü). Oysa buradaki temel amaç din değil, toplumsal zümre ve sınıf ayrımını yok edip kanun önünde ''eşitlik'' sağlamaktır (Halkçılık).',
  32
);

-- Soru #033 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Özel teşebbüsün sermaye, teknik ve bilgi yetersizliği sebebiyle gerçekleştiremediği büyük yatırımların bizzat devlet eliyle yapılması, ekonomik hayatın planlanması ve stratejik sanayi kollarının kamu tarafından işletilmesini öngören Atatürk ilkesi aşağıdakilerden hangisidir?',
  '{"options": ["Halkçılık", "Devletçilik", "İnkılapçılık", "Milliyetçilik", "Cumhuriyetçilik"], "correctIndex": 1}'::jsonb,
  'Devletçilik, özellikle 1929 Dünya Ekonomik Bunalımı sonrası benimsenen karma ekonomik kalkınma modelidir. I. Beş Yıllık Sanayi Planı, Sümerbank, Etibank, fabrikaların kamu eliyle açılması doğrudan Devletçiliktir.',
  'Devletçilik sosyalizm veya komünizm değildir; özel mülkiyeti ve bireysel teşebbüsü reddetmez, aksine özel teşebbüsü destekleyen ve onun yapamadığı ağır sanayi işlerini üstlenen Türkiye''ye özgü bir karma ekonomi modelidir.',
  33
);

-- Soru #034 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk ilkelerinden ''Laiklik'' ve ''İnkılapçılık'' ile ilgili aşağıdaki değerlendirmelerden hangisi yanlıştır?',
  '{"options": ["Laiklik yalnızca din ve devlet işlerinin ayrılması değil, aklın ve bilimin rehber edinilmesidir.", "İnkılapçılık durağanlığı reddeder; kurumların çağın gereksinimlerine göre sürekli dinamik ve yenilikçi olmasını şart koşar.", "Miladi takvim, saat ve uluslararası ölçü-tartı birimlerinin kabulü inkılapçılık ve çağdaşlaşma ile doğrudan ilgilidir.", "Tevhid-i Tedrisat Kanunu''nun çıkarılması ve Medeni Kanun laiklik doğrultusunda atılmış adımlardır.", "İnkılapçılık ilkesi, geçmişte kurulmuş tüm kurumların kökenine bakılmaksızın koşulsuz olarak muhafaza edilmesini savunur."], "correctIndex": 4}'::jsonb,
  'İnkılapçılık ilkesi eskiyi körü körüne muhafaza etmeyi (tutuculuk/muhafazakarlık) reddeder; ömrünü tamamlamış, çağın gerisinde kalmış kurumların yerine çağdaş ve dinamik müesseselerin getirilmesini savunur.',
  'İnkılapçılık statükocu değil, köklü reform ve sürekli gelişim yanlısıdır.',
  34
);

-- Soru #035 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Barış Antlaşması sonrasında Türkiye ile Fransa arasında en çok gerginliğe yol açan ve Türkiye''nin ''Bu konu bizim iç meselemizdir, hiçbir yabancı devletin iç işlerimize karışmasına müsaade edilemez.'' diyerek uluslararası konferanslara taşınmasını kesin bir dille reddettiği mesele aşağıdakilerden hangisidir?',
  '{"options": ["Musul Meselesi", "Yabancı Okullar Sorunu", "Boğazlar Meselesi", "Nüfus Mübadelesi", "Dış Borçlar Sorunu"], "correctIndex": 1}'::jsonb,
  'Fransa başta olmak üzere bazı devletler Türkiye''deki yabancı misyoner okullarının Türk kanunlarına ve müfredatına bağlanmasına itiraz etmiştir. Türkiye Cumhuriyeti, yabancı okulların iç mesele olduğunu vurgulayarak konuyu hiçbir devletle veya Milletler Cemiyeti ile müzakere etmemiştir.',
  'Fransa ile yaşanan diğer sorunlar Borçlar ve Adana-Mersin demiryollarıdır. Ancak ''iç mesele sayılarak uluslararası platforma taşınması kesinlikle reddedilen'' mesele Yabancı Okullar Sorunudur.',
  35
);

-- Soru #036 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan''da çözülemeyerek Türkiye ile İngiltere''nin ikili müzakerelerine bırakılan Musul Meselesi, Haliç Konferansı''nda da çözülememiş ve Milletler Cemiyeti''ne intikal etmiştir. Bu süreçte Doğu Anadolu''da çıkan Şeyh Sait İsyanı sebebiyle askeri harekat imkanı kalmayan Türkiye, 5 Haziran 1926 tarihinde İngiltere ile Ankara Antlaşması''nı imzalamıştır.

1926 Ankara Antlaşması ile ilgili aşağıdaki hükümlerden hangisi doğrudur?',
  '{"options": ["Musul ve Kerkük Türkiye''nin sınırlarına katılmıştır.", "Musul, İngiliz mandasındaki Irak''a bırakılmış; petrol gelirlerinin %10''u 25 yıllığına Türkiye''ye tahsis edilmiştir.", "Hatay özerk bir sancak haline getirilmiştir.", "Boğazlar Komisyonu lağvedilerek yönetim Türkiye''ye verilmiştir.", "Kıbrıs üzerindeki Türk hakları resmen tescil edilmiştir."], "correctIndex": 1}'::jsonb,
  '5 Haziran 1926 Ankara Antlaşması ile Musul ve Kerkük İngiliz mandası altındaki Irak yönetimine bırakılmış, Hakkari sınırı Türkiye lehine çizilmiştir. Irak petrollerinden elde edilecek gelirin %10''u 25 yıl süreyle Türkiye''ye bırakılmış, Türkiye sonradan 500 bin sterlin karşılığında bu hakkından feragat etmiştir.',
  'Musul Misak-ı Milli''den verilen tavizlerden biridir. 1926 Ankara Antlaşması ile kaybedilmiştir; 1921 Ankara Antlaşması (Fransa ile yapılan ve Sakarya sonrası imzalanan) ile karıştırılmamalıdır.',
  36
);

-- Soru #037 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'I. Dünya Savaşı sonrasında uluslararası barışı korumak amacıyla kurulan Milletler Cemiyeti''ne (Cemiyet-i Akvam), genellikle devletler bizzat başvurarak üye olurken; Türkiye barışçı dış politikası ve saygınlığı sebebiyle özel davetle üye olmuştur.

1932 yılında Türkiye''nin Milletler Cemiyeti''ne üyeliğini teklif eden ve destekleyen iki devlet aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["İngiltere - Fransa", "İspanya - Yunanistan", "İtalya - Almanya", "Sovyetler Birliği - İran", "Romanya - Yugoslavya"], "correctIndex": 1}'::jsonb,
  'Türkiye, Milletler Cemiyeti''nin Musul ve Mübadele kararlarındaki taraflı tutumunu bildiğinden üyelik için bizzat başvurmamış; İspanya''nın teklifi ve Yunanistan''ın desteği ile gelen davet üzerine 18 Temmuz 1932''de cemiyete üye olmuştur. İlk temsilcimiz Cemal Hüsnü Taray''dır.',
  'Adaylar cemiyetin baş aktörleri olan İngiltere veya Fransa''nın davet ettiğini sanır. Teklifi sunan İspanya, destekleyen Yunanistan''dır.',
  37
);

-- Soru #038 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930''lu yıllarda İtalya''nın Akdeniz''deki saldırgan politikaları ve Bulgaristan''ın sınırları değiştirme emelleri (revizyonist politika) karşısında batı sınırlarını güvenceye almak amacıyla Türkiye, Yunanistan, Yugoslavya ve Romanya arasında 9 Şubat 1934''te Balkan Antantı imzalanmıştır.

Balkanlar''da yer almasına rağmen yayılmacı emelleri sebebiyle Balkan Antantı''na katılmayan devlet aşağıdakilerden hangisidir?',
  '{"options": ["Romanya", "Yugoslavya", "Bulgaristan", "Yunanistan", "Arnavutluk"], "correctIndex": 2}'::jsonb,
  'Balkan Antantı''na üye ülkeler ''TAYYAR'' (Türkiye, Atina/Yunanistan, Yugoslavya, Romanya) şifresiyle hatırlanır. Bulgaristan I. Dünya Savaşı''nda kaybettiği Ege çıkışını ve toprakları geri almak istediği (revizyonist tutumu nedeniyle) antanta katılmamıştır. Arnavutluk ise İtalya''nın baskısı yüzünden yer alamamıştır.',
  'Bulgaristan''ın antanta katılmama sebebi revizyonist (statükoyu değiştirme yanlısı) olmasıdır. Sorularda en sık sorulan çeldiricidir.',
  38
);

-- Soru #039 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Boğazlar Sözleşmesi ile Boğazlar''ın yönetimi başkanı Türk olan uluslararası bir komisyona bırakılmış ve her iki yakası askersizleştirilmişti. 1930''lu yıllarda İtalya''nın Habeşistan''ı işgali ve Almanya''nın Ren bölgesini silahlandırması üzerine Türkiye Boğazlar sorununu gündeme getirmiştir.

20 Temmuz 1936''da imzalanan Montrö Boğazlar Sözleşmesi ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?',
  '{"options": ["Uluslararası Boğazlar Komisyonu kaldırılarak tüm yetkileri Türkiye Devleti''ne devredilmiştir.", "Türkiye''nin Boğazlar''ın her iki yakasında asker bulundurma ve tahkimat yapma hakkı tanınmıştır.", "Ticaret gemilerinin Boğazlar''dan geçişi serbest bırakılmıştır.", "Karadeniz''e kıyısı olmayan devletlerin savaş gemilerinin geçişine süre ve tonaj sınırlaması getirilmiştir.", "Boğazlar''ın kontrolü ve geçiş ücretleri Milletler Cemiyeti Genel Sekreterliği''ne bırakılmıştır."], "correctIndex": 4}'::jsonb,
  'Montrö ile Boğazlar Komisyonu tamamen feshedilmiş ve Boğazlar üzerinde mutlak Türk egemenliği tescil edilmiştir. Yönetim veya harçlar Milletler Cemiyeti''ne değil, bizzat Türkiye Cumhuriyeti''ne aittir.',
  'Lozan''daki kısıtlamalar (komisyon varlığı, askersiz alan) ile Montrö''nün kazanımları kıyaslanır. Montrö Türkiye''nin tam egemenliğini sağlayan diplomatik bir zaferdir.',
  39
);

-- Soru #040 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk''ün son yıllarındaki başarılı diplomasi hamleleri ile ilgili;
I. İtalya''nın Orta Doğu ve Doğu Akdeniz''e yönelik yayılmacı tehditlerine karşı doğu sınırlarını korumak amacıyla Türkiye, İran, Irak ve Afganistan arasında Sadabad Paktı (1937) kurulmuştur.
II. Mustafa Kemal Atatürk''ün ''Şahsi meselemdir.'' ve ''Kırk asırlık Türk yurdu düşman elinde esir kalamaz.'' dediği Hatay, bağımsız bir cumhuriyet olduktan sonra 1939''da TBMM kararıyla Türkiye''ye katılmıştır.
III. Suriye, Hatay üzerindeki iddiaları ve Irak ile olan sınır ihtilafları sebebiyle Sadabad Paktı''na katılmamıştır.

Yukarıda verilen bilgilerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de tarihsel olarak tamamen doğrudur. Sadabad Paktı Tahran''da imzalanmış; Türkiye, İran, Irak ve Afganistan katılmıştır (Suriye Hatay sorunu yüzünden katılmamıştır). Hatay 1938''de bağımsız devlet olmuş (İlk Cumhurbaşkanı Tayfur Sökmen, Başbakanı Abdurrahman Melek), 23 Haziran 1939''da anavatana katılmıştır.',
  'Suriye''nin Sadabad Paktı''nda yer almadığı ve Hatay''ın 1939''da (Atatürk''ün vefatından hemen sonra) anavatana katıldığı bilgisi ÖSYM''nin en çok üzerinde durduğu detaylardandır.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Barış Konferansı görüşmeleri sırasında İtilaf Devletleri''nin İstanbul Hükümeti ile TBMM Hükümeti''ni birlikte davet ederek Türk tarafında ikilik yaratmak istemesi üzerine 1 Kasım 1922 tarihinde TBMM tarafından alınan tarihi karar hangisidir?',
  '{"options": ["Saltanatın kaldırılması", "Cumhuriyetin ilan edilmesi", "Halifeliğin kaldırılması", "Ankara''nın başkent yapılması", "Takrir-i Sükun Kanunu''nun kabulü"], "correctIndex": 0}'::jsonb,
  '1 Kasım 1922''de TBMM saltanatı kaldırarak 623 yıllık Osmanlı Devleti''nin siyasi varlığına resmen son vermiştir. Halifelik ise siyasi yetkilerinden arındırılarak sembolik olarak devam ettirilmiştir.',
  'Saltanat 1 Kasım 1922''de; halifelik ise 3 Mart 1924''te kaldırılmıştır. İkisi aynı gün kaldırılmamıştır.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde ordunun siyasetten ayrılmasını sağlamak amacıyla 3 Mart 1924''te Erkan-ı Harbiye-i Umumiye Vekaleti lağvedilmiştir.

Bu vekaletin kaldırılmasıyla yerine kurulan sivil bakanlık ve bağımsız askeri makam eşleştirmesi hangisinde doğru verilmiştir?',
  '{"options": ["Milli Savunma Bakanlığı - Genelkurmay Başkanlığı", "İçişleri Bakanlığı - Jandarma Genel Komutanlığı", "Dışişleri Bakanlığı - Kuvvet Komutanlıkları", "Adalet Bakanlığı - Askeri Yargıtay", "Harbiye Nezareti - Seraskerlik"], "correctIndex": 0}'::jsonb,
  'Erkan-ı Harbiye Vekaleti hükümetten çıkarılmış; hükümette sivil ''Milli Savunma Bakanlığı'' kurulurken, askeri sevk ve idare siyaset üstü ''Genelkurmay Başkanlığı''na bırakılmıştır. İlk Genelkurmay Başkanı Mareşal Fevzi Çakmak''tır.',
  'Ordu mensuplarının meclise girmesi yasaklanmış; askerlik ile milletvekilliği birbirinden kesin olarak ayrılmıştır.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Türkiye Cumhuriyeti''nin ilk siyasi partisi olan Cumhuriyet Halk Fırkası (CHF), 9 Eylül 1923 tarihinde hangi teşkilatın partiye dönüştürülmesiyle resmen kurulmuştur?',
  '{"options": ["Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (A-RMHC)", "Karakol Cemiyeti", "Trakya-Paşaeli Cemiyeti", "Milli Kongre Cemiyeti", "Kilikyalılar Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Milli Mücadele''yi yürüten Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti, 9 Eylül 1923''te ''Halk Fırkası''na dönüştürülmüştür. Cumhuriyet ilan edildikten sonra adı ''Cumhuriyet Halk Fırkası'' olmuştur.',
  'CHF doğrudan sıfırdan kurulan bir parti değildir; Milli Mücadele''nin ana direniş teşkilatı olan A-RMHC''nin partileşmiş halidir.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1924 yılında kurulan ilk muhalefet partisi Terakkiperver Cumhuriyet Fırkası (TCF) ile 1930 yılında kurulan ikinci muhalefet partisi Serbest Cumhuriyet Fırkası''nın (SCF) ekonomi politikası açısından benimsedikleri ortak ilke aşağıdakilerden hangisidir?',
  '{"options": ["Liberalizm (Serbest Piyasa)", "Devletçilik", "Sosyalizm", "Merkantilizm", "Kapitalist Tekelcilik"], "correctIndex": 0}'::jsonb,
  'Her iki muhalefet partisi de CHP''nin uyguladığı devletçi politikalara muhalefet ederek serbest piyasa ekonomisini ve özel teşebbüsü (Liberalizm) savunmuşlardır.',
  'CHP''nin temel ilkesi Devletçilik iken; TCF ve SCF''nin ortak ekonomi politikası Liberalizm''dir.',
  44
);

-- Soru #045 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930 yılında Menemen''de patlak veren ve Asteğmen Mustafa Fehmi Kubilay ile bekçiler Şevki ve Hasan Beylerin şehit edildiği rejim karşıtı irtica isyanını bastırmak ve suçluları cezalandırmak amacıyla kurulan mahkeme aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı Harp (Sıkıyönetim Askeri Mahkemesi)", "İstiklal Mahkemeleri", "Devlet Güvenlik Mahkemesi", "Yüce Divan", "Nizamiye Mahkemesi"], "correctIndex": 0}'::jsonb,
  'Menemen Olayı''nda suçlular ''Divan-ı Harp'' (askeri mahkeme) tarafından yargılanmıştır. Çünkü İstiklal Mahkemeleri 1927 yılında görevini tamamlayıp kaldırılmıştır!',
  'ÖSYM''nin en büyük çeldiricisidir: Menemen Olayı''nda İstiklal Mahkemesi YOKTUR; sanıklar Divan-ı Harp''te yargılanmıştır.',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1933 yılında ezanın Türkçe okunmasına tepki olarak Bursa''da küçük bir grubun başlattığı ve Atatürk''ün ''Bu bir din meselesi değil, dil meselesidir.'' diyerek değerlendirdiği tarihi olay hangisidir?',
  '{"options": ["Bursa Olayı", "Menemen Olayı", "Razgrad Hadisesi", "Vagon-Li Olayı", "Bozkurt-Lotus Olayı"], "correctIndex": 0}'::jsonb,
  'Bursa Ulu Cami''de ezanın Türkçe okunması üzerine çıkan hadiseye ''Bursa Olayı'' denir. Atatürk Bursa''ya giderek yaptığı açıklamada hadisenin irtica boyutunu kınamış ve ''Mesele din değil, dil meselesidir'' demiştir.',
  'Razgrad Olayı Bulgaristan''da Türk mezarlarının tahrip edilmesidir; Vagon-Li Fransız şirketinde Türkçe konuşma yasağıdır; Türkçe ezan tepkisi ise Bursa Olayı''dır.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1933 yılında İstanbul''da Fransız yataklı vagon işletmesi olan Vagon-Li (Wagons-Lits) şirketinde çalışan Naci Bey isimli Türk memurun Türkçe konuştuğu için şirketten atılması üzerine üniversite gençliğinin başlattığı ve ''Vatandaş Türkçe Konuş!'' kampanyasına dönüşen milli tepki olayı aşağıdakilerden hangisidir?',
  '{"options": ["Vagon-Li Olayı", "Razgrad Olayı", "Bursa Olayı", "Bozkurt-Lotus Davası", "Menemen Vakası"], "correctIndex": 0}'::jsonb,
  'Vagon-Li Olayı, Fransız şirketinin Türkçe konuşmayı yasaklaması üzerine Türk gençliğinin şirketi protesto etmesi ve tüm yurtta ''Vatandaş Türkçe Konuş'' seferberliğini başlatması olayıdır.',
  'Vagon-Li Olayı doğrudan Türk diline ve milli egemenliğe sahip çıkma tepkisidir ve Milliyetçilik ilkesiyle yakından ilgilidir.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1926 yılında Türk gemisi Bozkurt ile Fransız vapuru Lotus''un Ege açıklarında çarpışması ve 8 Türk denizcisinin şehit olması üzerine Fransa''nın Türk kaptanı tutuklama yetkimize itiraz etmesiyle başlayan kriz Lahey Adalet Divanı''na taşınmıştır.

Lahey Uluslararası Adalet Divanı''nda Türkiye Cumhuriyeti''ni mükemmel bir hukuk savunmasıyla temsil eden ve Türkiye lehine tarihi bir zafer kazanan Adalet Bakanı kimdir?',
  '{"options": ["Mahmut Esat (Bozkurt)", "Şükrü Saraçoğlu", "Tevfik Rüştü Aras", "Cemal Hüsnü Taray", "Hamdullah Suphi"], "correctIndex": 0}'::jsonb,
  'Mahmut Esat Bey, Lahey''de Türkiye''nin egemenlik haklarını savunarak davayı kazanmıştır. Atatürk bu tarihi başarısından ötürü Soyadı Kanunu çıktığında kendisine bizzat ''Bozkurt'' soyadını vermiştir.',
  'Bozkurt-Lotus davasının mimarı Mahmut Esat Bozkurt''tur. Uluslararası deniz hukukunda emsal karar kabul edilir.',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1924 Anayasası''nda 1937 yılında yapılan değişiklikle anayasa metnine eklenen en önemli kurumsal düzenleme aşağıdakilerden hangisidir?',
  '{"options": ["Atatürk''ün altı temel ilkesinin anayasaya dahil edilmesi", "''Devletin dini İslam''dır'' ibaresinin çıkarılması", "Kadınlara milletvekili seçilme hakkının verilmesi", "Milletvekili yemin metninin değiştirilmesi", "Çok partili sisteme geçilmesi"], "correctIndex": 0}'::jsonb,
  '5 Şubat 1937''de yapılan anayasa değişikliği ile Cumhuriyetçilik, Milliyetçilik, Halkçılık, Devletçilik, Laiklik ve İnkılapçılık ilkeleri 1924 Anayasası''nın 2. maddesine eklenmiştir.',
  '''Devletin dini İslam''dır'' maddesi 1928''de çıkarılmıştır; 6 ilkenin anayasaya girmesi ise 1937''dedir.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün cumhurbaşkanlığı döneminde (1923-1938) görev yapan TBMM Başkanları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Ali Fethi Okyar", "Kazım Özalp", "Abdülhalik Renda", "İsmet İnönü", "Fevzi Çakmak"], "correctIndex": 4}'::jsonb,
  'Fevzi Çakmak ordunun başındadır (Genelkurmay Başkanıdır), hiçbir zaman TBMM Başkanlığı yapmamıştır. Atatürk döneminde TBMM Başkanlığı yapanlar: Ali Fethi Okyar (ilk başkan), Kazım Özalp ve Abdülhalik Renda''dır.',
  'Mareşal Fevzi Çakmak 1921''den 1944''e kadar aralıksız Genelkurmay Başkanlığı yapmıştır; meclis başkanı olmamıştır.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '17 Şubat 1926 tarihinde kabul edilen Türk Medeni Kanunu''nun İsviçre Medeni Kanunu''ndan uyarlanmasında (iktibas edilmesinde);
I. Avrupa''daki en çağdaş, pratik ve akılcı medeni kanun olması
II. Sorunlara hakimin takdir yetkisini kullanarak esnek çözümler üretmesi
III. Kadın-erkek eşitliğine ve demokratik aile yapısına uygun olması

gerekçelerinden hangileri etkili olmuştur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'İsviçre Medeni Kanunu Avrupa''daki en son hazırlanan, dili sade, hakime geniş takdir yetkisi tanıyan ve kadın-erkek eşitliğini en iyi düzenleyen kanun olduğu için tercih edilmiştir.',
  'Fransız kanunu karmaşık ve eski, Alman kanunu ağır ve katı bulundu; İsviçre kanunu ise en modern ve uygulanabilir olanıydı.',
  51
);

-- Soru #052 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Türk Medeni Kanunu''nun kabulü ile Fener Rum Patrikhanesi ve Musevi Hahambaşılığı''nın dünyevi yetkileri sona ermiş, gayrimüslim cemaatler de kendi dini mahkemelerinden vazgeçerek Türk mahkemelerine tabi olmuşlardır.

Bu gelişme Türkiye''de hangi iki temel Atatürk ilkesinin hayata geçtiğini gösterir?',
  '{"options": ["Laiklik ve Halkçılık (Eşitlik)", "Devletçilik ve Cumhuriyetçilik", "İnkılapçılık ve Devletçilik", "Milliyetçilik ve Bağımsızlık", "Cumhuriyetçilik ve Barışçılık"], "correctIndex": 0}'::jsonb,
  'Dini cemaat mahkemelerinin kaldırılıp tek bir laik hukuk çatısı altında toplanması ''Laiklik''; tüm vatandaşların kanun önünde eşit haklara kavuşması ise ''Halkçılık''tır.',
  'Patrikhanenin elinden dünyevi ve hukuki yetkilerin alınması hukukta laikleşmenin en büyük adımıdır.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '3 Mart 1924 Tevhid-i Tedrisat Kanunu''ndan sonra 2 Mart 1926 tarihinde çıkarılan ve ilk, orta ve lise eğitiminin esaslarını belirleyen, müfredatı çağdaşlaştıran, yabancı dillerde eğitim veren okulları denetim altına alan kanun aşağıdakilerden hangisidir?',
  '{"options": ["Maarif Teşkilatı Hakkında Kanun", "Millet Mektepleri Kanunu", "Köy Enstitüleri Kanunu", "Tevhid-i Tedrisat Kanunu", "Harf İnkılabı Kanunu"], "correctIndex": 0}'::jsonb,
  'Maarif Teşkilatı Hakkında Kanun (1926), Türkiye''deki eğitim kademelerini, öğretmen atamalarını ve ders müfredatlarını laik ve milli esaslara bağlayan temel eğitim nizamnamesidir.',
  'Tevhid-i Tedrisat birlik kanunudur; maarifin iç teşkilatlanması ve müfredat yapısı ise 1926 Maarif Teşkilatı Kanunu iledir.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün ''Efendiler ve ey millet iyi biliniz ki Türkiye Cumhuriyeti şeyhler, dervişler, müritler ve mensuplar memleketi olamaz.'' sözü doğrultusunda 30 Kasım 1925''te tekke, zaviye ve türbeler kapatılmıştır.

Aşağıdaki tarihi şahsiyetlerden hangisinin türbesi bu kanunun istisnası sayılarak ziyarete açık tutulmuştur?',
  '{"options": ["Fatih Sultan Mehmet", "Yavuz Sultan Selim", "Kanuni Sultan Süleyman", "Osman Gazi", "Hiçbiri (Tüm türbeler kapatılmıştır)"], "correctIndex": 4}'::jsonb,
  '1925 tarihli 677 sayılı kanunla Türkiye''deki bütün tarikat tekkeleri, zaviyeler ve padişah türbeleri istisnasız kapatılmıştır. Tarihi ve manevi büyüklerin türbeleri ancak 1950 yılında çıkarılan yeni bir kanunla yeniden ziyarete açılmıştır.',
  'Adaylar Mevlana veya Fatih gibi isimlerin kapatılmadığını zannedebilir; kanun çıktığında TÜM türbeler mühürlenmiştir.',
  54
);

-- Soru #055 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '21 Haziran 1934 tarihinde kabul edilen Soyadı Kanunu ile;
I. Her Türk vatandaşının öz adından başka bir soyadı taşıması zorunlu kılınmıştır.
II. Rütbe, memuriyet, aşiret, yabancı ırk ve millet belirten soyadları yasaklanmıştır.
III. 24 Kasım 1934''te TBMM çıkardığı özel bir kanunla Gazi Mustafa Kemal''e ''Atatürk'' soyadını vermiştir.

Bu inkılap doğrudan hangi Atatürk ilkesinin pekiştirilmesini sağlamıştır?',
  '{"options": ["Halkçılık (Ayrıcalıksız ve Eşit Toplum)", "Devletçilik", "Cumhuriyetçilik", "Barışçılık", "Akılcılık"], "correctIndex": 0}'::jsonb,
  'Soyadı Kanunu toplumda unvan ve lakaplardan kaynaklanan imtiyaz ve sınıfsal ayrımları yok ettiği, resmi işlemlerdeki karışıklıkları giderip eşit vatandaşlık sağladığı için doğrudan ''Halkçılık''tır.',
  'Soyadı Kanunu milli bir dil içerdiği için milliyetçilikle de ilişkilendirilebilir; ancak temel amacı ''ayrıcalıksız, sınıfsız eşit toplum'' yaratmak olduğu için ana ilke HALKÇILIK''tır.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nden kalan Sanayi-i Nefise Mektebi (Güzel Sanatlar Okulu), Cumhuriyet döneminde modernize edilerek 1928 yılında hangi saygın yükseköğretim kurumuna dönüştürülmüştür?',
  '{"options": ["Mimar Sinan Güzel Sanatlar Akademisi", "Marmara Güzel Sanatlar Fakültesi", "Gazi Eğitim Enstitüsü", "Musiki Muallim Mektebi", "Devlet Konservatuvarı"], "correctIndex": 0}'::jsonb,
  'Osman Hamdi Bey''in 1882''de kurduğu Sanayi-i Nefise Mektebi, Cumhuriyet döneminde ''Güzel Sanatlar Akademisi''ne (günümüzde Mimar Sinan Güzel Sanatlar Üniversitesi) dönüştürülmüştür.',
  'Musiki Muallim Mektebi müzik öğretmeni yetiştirmek için Ankara''da açılmıştır; Sanayi-i Nefise ise Mimar Sinan Güzel Sanatlar''a dönüşmüştür.',
  56
);

-- Soru #057 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde müzik ve sahne sanatlarını geliştirmek amacıyla 1924 yılında Ankara''da açılan ve müzik öğretmeni yetiştiren kurum aşağıdakilerden hangisidir?',
  '{"options": ["Musiki Muallim Mektebi", "Darülelhan", "Darülbedayi", "Riyaset-i Cumhur Filarmoni", "Ankara Devlet Tiyatrosu"], "correctIndex": 0}'::jsonb,
  'Musiki Muallim Mektebi 1924''te Ankara''da açılmış ve daha sonra Ankara Devlet Konservatuvarı''nın çekirdeğini oluşturmuştur. Darülelhan konservatuvarın, Darülbedayi ise şehir tiyatrolarının Osmanlı''daki adıdır.',
  'Darülbedayi tiyatro, Darülelhan konservatuvardır. Cumhuriyet''in açtığı okul ise Musiki Muallim Mektebi''dir.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1932 yılında Milletler Cemiyeti''nin teşvikiyle başlatılan ve Türkiye''nin ilk güzellik kraliçesi seçildikten sonra Belçika''da düzenlenen yarışmada ''Dünya Güzellik Kraliçesi'' (Miss Universe) seçilen Türk kadını kimdir?',
  '{"options": ["Keriman Halis (Ece)", "Afife Jale", "Safiye Ayla", "Sabiha Gökçen", "Müfide İlhan"], "correctIndex": 0}'::jsonb,
  'Keriman Halis, 1932''de Belçika''da yapılan yarışmada Dünya Güzeli seçilmiştir. Atatürk kendisine ''Ece'' soyadını vermiştir.',
  'Afife Jale ilk kadın tiyatro oyuncusudur; Keriman Halis Ece ise ilk dünya güzellik kraliçemizdir.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1934 yılında kabul edilen kanunla kadınlara milletvekili seçme ve seçilme hakkı tanınmış ve 1935 genel seçimlerinde TBMM''ye kaç kadın milletvekili girmiştir?',
  '{"options": ["18", "12", "24", "9", "30"], "correctIndex": 0}'::jsonb,
  '1935 genel seçimlerinde meclise ilk kez 17 kadın milletvekili girmiş, ara seçimle bu sayı 18''e yükselmiştir. Bu oran (%4.5) o dönemde birçok Avrupa ülkesinin parlamentosundaki kadın vekil oranından yüksektir.',
  'ÖSYM 1935 meclisindeki kadın milletvekili sayısını (18) doğrudan rakam olarak sormayı sever.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde Türkiye''de modern heykeltıraşlık sanatının öncülerinden olan, Sarayburnu Atatürk Anıtı (ilk Atatürk heykeli), Taksim Cumhuriyet Anıtı ve Ankara Ulus Zafer Anıtı''nı yapan dünyaca ünlü Avusturyalı ve İtalyan heykeltıraşlar kimlerdir?',
  '{"options": ["Heinrich Krippel - Pietro Canonica", "Albert Malche - Herman Jansen", "Bruno Taut - Cleopas", "Picasso - Rodin", "Ernst Reuter - Von Papen"], "correctIndex": 0}'::jsonb,
  'Heinrich Krippel (Sarayburnu, Konya, Samsun ve Ulus anıtlarını yapmıştır) ve Pietro Canonica (Taksim Cumhuriyet Anıtı''nı yapmıştır) Atatürk dönemi anıtlarının büyük heykeltıraşlarıdır.',
  'Herman Jansen Ankara''nın şehir planını çizen mimardır; heykelleri yapanlar ise Heinrich Krippel ve Pietro Canonica''dır.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '17 Şubat 1923''te toplanan İzmir İktisat Kongresi''nde kabul edilen ''Misak-ı İktisadi'' (Milli Ekonomi Andı) kararları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Hammadde kaynağı yurt içinde olan sanayi kollarının kurulması", "El işçiliğinden ve küçük imalathanelerden derhal fabrika ve seri üretime geçilmesi", "Özel teşebbüse kredi sağlayacak milli bankaların kurulması", "Yabancı sermayenin ve tüm özel mülkiyetin devletleştirilerek komünist sisteme geçilmesi", "Yerli malı kullanımının ve tasarrufun özendirilmesi"], "correctIndex": 3}'::jsonb,
  'İzmir İktisat Kongresi''nde komünist model kesinlikle reddedilmiş; yabancı sermayeye kanunlara saygılı olmak ve tekelcilik yapmamak şartıyla kapıların açık olduğu belirtilmiştir. Özel sektör teşvik edilmiştir.',
  '1923 İzmir Kongresi liberal bir çizgidedir; devletçilik ilkesine ancak 1929 Büyük Buhranı sonrasında zorunlu olarak geçilmiştir.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1925 yılında köylünün üzerindeki en ağır mali yük olan ve devlet bütçe gelirlerinin yaklaşık beşte birini oluşturan hangi verginin kaldırılması, cumhuriyetin köylüye ve tarıma verdiği önemi gösterir?',
  '{"options": ["Aşar (Öşür) Vergisi", "Ağnam Vergisi", "Haraç", "Cizye", "Çiftbozan"], "correctIndex": 0}'::jsonb,
  '17 Şubat 1925''te Aşar vergisi kaldırılmıştır. Devlet bütçesinin %20''sinden feragat ederek köylüyü rahatlatmış ve bu inkılap ''Halkçılık'' ilkesinin en büyük kanıtı olmuştur.',
  'Aşar köylüden alınan şeri ürün vergisidir. Kaldırılması hem Laiklik hem de doğrudan Halkçılık ilkesidir.',
  62
);

-- Soru #063 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1927 yılında özel sektörü sanayi yatırımları yapmaya teşvik etmek, bedelsiz arazi ve vergi muafiyeti sağlamak amacıyla çıkarılan ancak halkın sermaye birikimi yetersizliği ve 1929 Büyük Buhranı sebebiyle beklenen sonucu veremeyen kanun hangisidir?',
  '{"options": ["Teşvik-i Sanayi Kanunu", "Kabotaj Kanunu", "Milli Korunma Kanunu", "Men-i İsrafat Kanunu", "Gümrük Kanunu"], "correctIndex": 0}'::jsonb,
  '1927 Teşvik-i Sanayi Kanunu özel sektörü kalkındırmayı amaçlamış, fakat sermaye ve bilgi yetersizliği sebebiyle başarılı olamamıştır. Bunun üzerine devlet 1930''lu yıllarda ''Devletçilik'' ilkesini zorunlu olarak devreye sokmuştur.',
  'Teşvik-i Sanayi Kanunu''nun başarısız olması Türkiye''de ''Devletçilik'' ilkesinin ve planlı kamu sanayileşmesinin doğmasına yol açmıştır.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Türkiye Cumhuriyeti''nde sanayi yatırımlarını finanse etmek, tekstil, iplik ve basma fabrikalarını bizzat kurup işletmek amacıyla 1933 yılında kurulan dev kamu iktisadi kuruluşu aşağıdakilerden hangisidir?',
  '{"options": ["Sümerbank", "Etibank", "Halkbank", "Denizbank", "İlbank"], "correctIndex": 0}'::jsonb,
  'Sümerbank, 1933''te I. Beş Yıllık Sanayi Planı''nın finansmanını sağlamak ve tekstil sanayisini kurmak için açılmış Cumhuriyetin simge kurumudur.',
  'Maden ve enerji için Etibank (1935); tekstil ve genel sanayi planı için Sümerbank (1933) kurulmuştur.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün madencilik, petrol arama ve yer altı kaynaklarını işletmek amacıyla bizzat talimat vererek 1935 yılında kurdurduğu iki stratejik kurum hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Maden Tetkik ve Arama Enstitüsü (MTA) - Etibank", "Sümerbank - Petrol Ofisi", "Türkiye Kömür İşletmeleri - Denizbank", "İş Bankası - Ereğli Demir Çelik", "TPAO - Ziraat Bankası"], "correctIndex": 0}'::jsonb,
  '1935 yılında yer altı madenlerini aramak için MTA (Maden Tetkik ve Arama), bu madenleri finanse etmek ve işletmek için ise Etibank kurulmuştur.',
  'MTA arama yapar, Etibank finanse eder ve işletir. İkisi de 1935 yılında kurulmuştur.',
  65
);

-- Soru #066 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet tarihinin ''ilk kamu şeker fabrikası'' 1926 yılında nerede üretime başlamıştır?',
  '{"options": ["Alpullu (Kırklareli)", "Uşak", "Turhal", "Konya", "Eskişehir"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin açılan ilk şeker fabrikası 26 Kasım 1926''da üretime geçen Kırklareli Alpullu Şeker Fabrikası''dır. (Uşak Şeker Fabrikası da aynı yıl Nuri Şeker öncülüğünde açılmıştır).',
  'İlk açılan ve şeker üreten fabrika Alpullu''dur; Uşak fabrikası da aynı yıl faaliyete geçmiştir.',
  66
);

-- Soru #067 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde yerli sanayinin temeli olarak kurulan, temeli 1937''de atılan ve 1939''da faaliyete geçen Türkiye''nin ''ilk entegre demir-çelik fabrikası'' nerede kurulmuştur?',
  '{"options": ["Karabük", "İskenderun", "Ereğli", "Sivas", "Kırıkkale"], "correctIndex": 0}'::jsonb,
  'Karabük Demir Çelik Fabrikası (KARDEMİR), temeli 1937''de İsmet İnönü tarafından atılan Türkiye''nin ''ağır sanayi'' atılımının ilk büyük tesisidir.',
  'İskenderun ve Erdemir sonradan kurulmuştur; Türkiye''nin ilk demir-çelik fabrikası Karabük''tür.',
  67
);

-- Soru #068 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde tarımda çiftçilere örnek olmak, modern ziraat yöntemlerini, tohum ıslahını ve hayvancılığı geliştirmek amacıyla bizzat Mustafa Kemal''in kendi parasıyla satın alıp kurduğu ve vasiyetiyle devlete bağışladığı tesis hangisidir?',
  '{"options": ["Atatürk Orman Çiftliği", "Dalaman Tarım İşletmesi", "Yalova Çiftliği", "Ceylanpınar Harası", "Silifke Çiftliği"], "correctIndex": 0}'::jsonb,
  'Mustafa Kemal Paşa 1925 yılında Ankara''da bataklık ve verimsiz bir araziyi ıslah ederek ''Gazi Orman Çiftliği''ni (AOÇ) kurmuş, 1937''de ise tüm çiftliklerini millete bağışlamıştır.',
  'Atatürk Orman Çiftliği bizzat Atatürk''ün şahsi gayretiyle modern tarım laboratuvarı olarak kurulmuştur.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930 yılında Dr. Refik Saydam''ın Sağlık Bakanlığı döneminde kurulan, aşı ve serum üreterek bulaşıcı hastalıklarla (tifo, kolera, kuduz) mücadelede dünyaca ünlü bir merkez haline gelen sağlık enstitüsü hangisidir?',
  '{"options": ["Refik Saydam Hıfzıssıhha Enstitüsü", "Numune Hastanesi", "Hilal-i Ahmer Cemiyeti", "Verem Savaş Dispanseri", "Yeşilay Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Refik Saydam Hıfzıssıhha Enstitüsü, Cumhuriyetin aşı ve koruyucu sağlık politikasının kalesidir. Çin''e dahi kolera aşısı gönderecek düzeyde uluslararası başarı sağlamıştır.',
  'Refik Saydam Türkiye Cumhuriyeti''nin ilk ve efsanevi Sağlık Bakanı''dır; enstitü onun adını taşır.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1934-1938 yılları arasında başarıyla uygulanan I. Beş Yıllık Sanayi Planı''nın hazırlanmasında ve finansmanında Türkiye''ye teknik ve mali destek sağlayan yabancı devlet aşağıdakilerden hangisidir?',
  '{"options": ["Sovyetler Birliği (SSCB)", "Almanya", "İngiltere", "Fransa", "Amerika Birleşik Devletleri"], "correctIndex": 0}'::jsonb,
  'I. Beş Yıllık Sanayi Planı, Sovyetler Birliği''nden Profesör Malışev başkanlığındaki heyetin hazırladığı rapor doğrultusunda hazırlanmış ve Sovyetlerden alınan 8 milyon dolarlık faizsiz krediyle finanse edilmiştir.',
  'Türkiye Sovyetler Birliği''nden teknik ve kredi desteği almış fakat komünist sistemi değil, karma ekonomi temelli Devletçilik modelini uygulamıştır.',
  70
);

-- Soru #071 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk''ün ''Cumhuriyetçilik'' ilkesi ile doğrudan bağlantılı olan kavramlar ve anahtar kelimeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Milli irade ve ulusal egemenlik", "Çok partili demokratik rejim", "Seçimler ve parlamenter sistem", "Kadınlara siyasi seçme ve seçilme hakkı", "Ekonomik yatırımların kamu iktisadi teşebbüsleri (KİT) eliyle yürütülmesi"], "correctIndex": 4}'::jsonb,
  'Ekonomik yatırımların kamu veya devlet eliyle yapılması doğrudan ''Devletçilik'' ilkesidir. Cumhuriyetçilik ise siyasi rejim, oy kullanma, meclis ve seçimler ile ilgilidir.',
  'Devletçilik ekonomi ile; Cumhuriyetçilik ise yönetim ve sandık ile ilgilidir.',
  71
);

-- Soru #072 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk ilkelerinden ''Milliyetçilik'' ve ''Halkçılık'' ile ilgili aşağıdaki inkılap eşleştirmelerinden hangisi doğrudur?',
  '{"options": ["Kabotaj Kanunu: Milliyetçilik — Aşar Vergisinin Kaldırılması: Halkçılık", "Medeni Kanun: Devletçilik — Türk Dil Kurumu: Cumhuriyetçilik", "Soyadı Kanunu: Devletçilik — Merkez Bankası: Halkçılık", "Tevhid-i Tedrisat: Barışçılık — Sümerbank: Laiklik", "İş Bankası: İnkılapçılık — Kılık Kıyafet: Milliyetçilik"], "correctIndex": 0}'::jsonb,
  'Kabotaj Kanunu karasularımızı millileştirdiği için Milliyetçilik; Aşar vergisinin kaldırılması köylüye eşitlik ve sosyal adalet getirdiği için Halkçılık ilkesidir.',
  'Kabotaj = Milliyetçilik; Aşar = Halkçılık en klasik ÖSYM eşleştirmesidir.',
  72
);

-- Soru #073 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk ilkelerinden ''Laiklik'' anlayışına göre akılcılık ve bilimsellik esastır.

Buna göre aşağıdakilerden hangisi doğrudan Laiklik doğrultusunda atılmış bir adımdır?',
  '{"options": ["Şeriye ve Evkaf Vekaleti''nin kaldırılarak yerine Diyanet İşleri Başkanlığı''nın kurulması", "Merkez Bankası''nın kurulması", "I. Beş Yıllık Sanayi Planı''nın uygulanması", "Balkan Antantı''nın imzalanması", "İş Bankası''nın faaliyete geçmesi"], "correctIndex": 0}'::jsonb,
  'Şeriye ve Evkaf Vekaleti din ve vakıf işlerine bakan bakanlıktı. 3 Mart 1924''te kaldırılarak din işleri siyasetten arındırılmış ve Diyanet İşleri Başkanlığı kurularak laikliğe geçilmiştir.',
  'Diyanet İşleri Başkanlığı''nın kurulması laikleşme sürecinin en temel kurumsal adımıdır.',
  73
);

-- Soru #074 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Antlaşması''ndan sonra Türkiye ile Yunanistan arasında uzun yıllar gerginliğe neden olan ''Nüfus Mübadelesi'' (Etabli Sorunu), 10 Haziran 1930 tarihinde imzalanan hangi antlaşma ile kesin çözüme kavuşturulmuştur?',
  '{"options": ["Ankara Ahali Sözleşmesi", "Atina Paktı", "Selanik Antlaşması", "Balkan Antantı", "Lozan Ek Protokolü"], "correctIndex": 0}'::jsonb,
  '10 Haziran 1930 Ankara Ahali Sözleşmesi ile İstanbul''daki Rumlar ile Batı Trakya''daki Türkler yerleşik (etabli) kabul edilmiş ve mübadele krizi çözülerek Türk-Yunan dostluk dönemi başlamıştır.',
  'Bu antlaşmadan sonra Yunan Başbakanı Venizelos Türkiye''yi ziyaret etmiş ve Atatürk''ü Nobel Barış Ödülü''ne aday göstermiştir.',
  74
);

-- Soru #075 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930 yılında Türkiye''yi ziyaret eden ve Mustafa Kemal Atatürk''ü dünya barışına katkılarından ötürü ''Nobel Barış Ödülü''ne resmen aday gösteren yabancı devlet adamı kimdir?',
  '{"options": ["Elefterios Venizelos (Yunanistan Başbakanı)", "Franklin D. Roosevelt", "Winston Churchill", "General MacArthur", "Kral Edward"], "correctIndex": 0}'::jsonb,
  'Yunanistan Başbakanı Elefterios Venizelos, Türk-Yunan barışına öncülük eden Mustafa Kemal Atatürk''ü 1934 yılında Nobel Barış Ödülü Komitesi''ne resmi bir mektupla aday göstermiştir.',
  'Kurtuluş Savaşı''nda savaştığımız Yunanistan''ın lideri Venizelos''un Atatürk''ü Nobel''e aday göstermesi ''Yurtta sulh, cihanda sulh'' ilkesinin evrensel zaferidir.',
  75
);

-- Soru #076 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1936 Montrö Boğazlar Sözleşmesi ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?',
  '{"options": ["Uluslararası Boğazlar Komisyonu lağvedilerek tüm yetkileri Türkiye Devleti''ne devredilmiştir.", "Türkiye''nin Boğazlar bölgesinde asker ve tahkimat bulundurma hakkı kabul edilmiştir.", "Ticaret gemilerinin Boğazlar''dan geçişi serbest bırakılmıştır.", "Karadeniz''e kıyısı olmayan devletlerin savaş gemilerinin geçişine tonaj ve süre sınırlaması (en fazla 21 gün) getirilmiştir.", "Boğazlar Sözleşmesi''nin süresi 99 yıl olarak belirlenmiş ve feshedilemez kılınmıştır."], "correctIndex": 4}'::jsonb,
  'Montrö Sözleşmesi 20 yıllık süreyle imzalanmıştır; ancak taraflar itiraz etmediği sürece kendiliğinden uzama maddesi içerdiği için günümüzde de aynen yürürlüktedir. 99 yıl değildir.',
  'Montrö 20 yıllık süreyle imzalanmıştır; fakat günümüzde hala yürürlükte olan tek kurucu deniz sözleşmesidir.',
  76
);

-- Soru #077 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1937 yılında imzalanan Sadabad Paktı ile ilgili;
I. Pakt İtalya''nın Habeşistan''ı işgali ve Orta Doğu''ya yönelik tehditleri üzerine imzalanmıştır.
II. Pakt Tahran''da Türkiye, İran, Irak ve Afganistan arasında akdedilmiştir.
III. Suriye, Hatay üzerindeki hak iddiaları ve Irak ile sınır ihtilafları sebebiyle pakta katılmamıştır.

Yukarıda verilen bilgilerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Sadabad Paktı ile Türkiye doğu sınırlarını güvence altına almıştır. Suriye Hatay sorunu yüzünden pakta girmemiştir. Üç öncül de tarihsel olarak kesin doğrudur.',
  'Balkan Antantı''na Bulgaristan, Sadabad Paktı''na ise Suriye katılmamıştır. Bu iki ''katılmayan ülke'' ÖSYM''nin en sevdiği çeldiricidir.',
  77
);

-- Soru #078 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Milletler Cemiyeti tarafından Hatay meselesini araştırmak üzere bölgeye gönderilen ve hazırladığı raporda ''Hatay nüfusunun çoğunluğunun Türk olduğunu ve Hatay''ın Suriye''ye bağlanamayacağını'' belirten uluslararası raportör kimdir?',
  '{"options": ["Sandler (Sandler Raporu)", "General Harbord", "Amiral Bristol", "King-Crane", "Lord Curzon"], "correctIndex": 0}'::jsonb,
  'İsveçli diplomat Sandler''in hazırladığı ''Sandler Raporu'' doğrultusunda Milletler Cemiyeti Hatay''ın özerkliğini kabul etmiş ve 1938''de Bağımsız Hatay Cumhuriyeti kurulmuştur.',
  'Harbord Ermenilerle, Bristol İzmir işgaliyle, Sandler ise doğrudan Hatay meselesiyle ilgilidir.',
  78
);

-- Soru #079 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '2 Eylül 1938''de kurulan Bağımsız Hatay Cumhuriyeti''nin Cumhurbaşkanı ve Başbakanı aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Tayfur Sökmen - Abdurrahman Melek", "Abdurrahman Melek - Tayfur Sökmen", "Şükrü Saraçoğlu - Suat Davaz", "Cemal Gürsel - Nihat Erim", "İsmet İnönü - Celal Bayar"], "correctIndex": 0}'::jsonb,
  'Bağımsız Hatay Cumhuriyeti''nin ilk ve tek Cumhurbaşkanı Tayfur Sökmen; Başbakanı ise Abdurrahman Melek''tir. Hatay Meclisi 23 Haziran 1939''da anavatana katılma kararı almıştır.',
  'Cumhurbaşkanı Tayfur Sökmen, Başbakan Abdurrahman Melek''tir. İsimlerin yer değiştirmesine dikkat edilmelidir.',
  79
);

-- Soru #080 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün ölüm döşeğindeyken Hatay meselesi için söylediği;
''Kırk asırlık Türk yurdu düşman elinde esir kalamaz!'' ve ''Hatay benim şahsi meselemdir.''
sözleri aşağıdaki Atatürk ilkelerinden en çok hangisinin tavizsiz bir yansımasıdır?',
  '{"options": ["Milliyetçilik ve Bağımsızlık", "Devletçilik", "Laiklik", "İnkılapçılık", "Batıcılık"], "correctIndex": 0}'::jsonb,
  'Atatürk''ün sağlığını hiçe sayarak Adana ve Mersin''e gidip askeri tatbikat yaptırması, Hatay''daki Türk soydaşlarını kurtarma azmi doğrudan ''Milliyetçilik ve Milli Bağımsızlık'' ilkesinin şahikasıdır.',
  'Toprak kazanma ve soydaşları koruma gayreti tartışmasız biçimde Milliyetçiliktir.',
  80
);


-- -------------------------------------------------------------
-- ÇAĞDAŞ TÜRK VE DÜNYA TARIHI (80 SORU)
-- -------------------------------------------------------------

-- Soru #001 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Çarlık Rusyası''nda I. Dünya Savaşı''nın yarattığı ekonomik buhran ve askeri mağlubiyetler sonucunda Ekim 1917''de Lenin liderliğindeki Bolşevikler iktidarı ele geçirmiştir. Yeni rejim iç savaş sürecinde tarımı canlandırmak ve üretimi artırmak amacıyla ''NEP'' (Yeni Ekonomi Politikası) adını verdiği geçici serbest piyasa tedbirlerini uygulamıştır.

Lenin''in ölümünden sonra SSCB lideri olan ve köylülerin topraklarını zorla devletleştirerek kolhoz adı verilen kolektif çiftlikleri kuran Sovyet lideri aşağıdakilerden hangisidir?',
  '{"options": ["Lev Troçki", "Josef Stalin", "Nikita Kruşçev", "Leonid Brejnev", "Mihail Gorbaçov"], "correctIndex": 1}'::jsonb,
  'Lenin''in 1924''te ölümünden sonra iktidara gelen Josef Stalin, NEP politikasına son vermiş; ''Kolektifleştirme'' (Kolhoz) ve I. Beş Yıllık Sanayi Planı''nı yürürlüğe koymuştur. Direnen köylüler Gulag çalışma kamplarına sürülmüş veya cezalandırılmıştır.',
  'Kızıl Ordu''nun kurucusu olan Troçki, Stalin ile giriştiği iktidar mücadelesini kaybederek sürgüne gönderilmiştir. Kolektifleştirme ve katı devletçilik politikasının mimarı Stalin''dir.',
  1
);

-- Soru #002 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Çarlık Rusyası''nın yıkılmasının ardından Türkistan coğrafyasında Sovyet Rusya egemenliğine ve Bolşevik Kızıl Ordu''ya karşı 1918-1930''lu yıllar arasında yürütülen milli direniş hareketine ''Basmacı Harekâtı'' adı verilmiştir.

Bu harekete katılarak Türkistan Türklerini birleştirmek için mücadele eden ve 1922 yılında Tacikistan''da Bolşeviklerle girdiği çatışmada şehit düşen Osmanlı komutanı ve devlet adamı aşağıdakilerden hangisidir?',
  '{"options": ["Talat Paşa", "Cemal Paşa", "Enver Paşa", "Kazım Karabekir Paşa", "Mustafa Şokay"], "correctIndex": 2}'::jsonb,
  'Enver Paşa, I. Dünya Savaşı sonrası Türkistan''a geçerek Basmacı Harekâtı''nın başına geçmiş ve Türkistan bağımsızlık mücadelesini organize etmiştir. 4 Ağustos 1922''de Belhivan yakınlarında şehit düşmüştür.',
  'Talat Paşa Berlin''de, Cemal Paşa Tiflis''te Ermeni suikastçılar tarafından şehit edilmiştir. Türkistan''da Basmacı Harekâtı sırasında şehit olan komutan Enver Paşa''dır.',
  2
);

-- Soru #003 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'Kırım Türklerinin büyük fikir adamı olan, Usul-i Cedid (Yeni Metot) okullarını açarak eğitimde modernleşmeyi savunan, çıkardığı Tercüman Gazetesi ile bütün Türk dünyasını aydınlatmayı amaçlayan ve ''Dilde, fikirde, işte birlik'' şiarını ortaya koyan düşünür aşağıdakilerden hangisidir?',
  '{"options": ["Yusuf Akçura", "Zeki Velidi Togan", "İsmail Gaspıralı", "Mehmet Emin Resulzade", "Sadri Maksudi Arsal"], "correctIndex": 2}'::jsonb,
  'İsmail Gaspıralı (1851-1914), Kırım Bahçesaray''da ''Tercüman'' gazetesini yayımlamış ve Türk dünyasının ortak bir yazı dili ve milli şuurda birleşmesi için ''Dilde, fikirde, işte birlik'' prensibini savunmuştur.',
  'Yusuf Akçura ''Üç Tarz-ı Siyaset'' makalesiyle; Zeki Velidi Togan tarihçiliği ve Başkurt bağımsızlığıyla; Mehmet Emin Resulzade ise Azerbaycan Cumhuriyeti kuruculuğuyla tanınır. ''Dilde, fikirde, işte birlik'' sözü Gaspıralı''ya aittir.',
  3
);

-- Soru #004 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  '28 Mayıs 1918 tarihinde Tiflis''te kurulan, Doğu''da ve Türk-İslam dünyasında ilk demokratik cumhuriyet olma unvanını taşıyan devlet Azerbaycan Halk Cumhuriyeti''dir.

Azerbaycan Halk Cumhuriyeti''nin kurucusu olan ve ''Bir kere yükselen bayrak, bir daha inmez!'' tarihi sözünü söyleyen milli lider kimdir?',
  '{"options": ["Ebulfez Elçibey", "Haydar Aliyev", "Mehmet Emin Resulzade", "İlham Aliyev", "Neriman Nerimanov"], "correctIndex": 2}'::jsonb,
  'Mehmet Emin Resulzade, 1918''de bağımsızlığını ilan eden Azerbaycan Halk Cumhuriyeti''nin kurucu lideri ve Milli Şura başkanıdır. ''Bir kere yükselen bayrak bir daha inmez!'' vecizesi bağımsız Azerbaycan''ın sembolü olmuştur.',
  'Ebulfez Elçibey, 1991''de SSCB dağıldıktan sonraki bağımsız Azerbaycan''ın ikinci cumhurbaşkanı ve halk cephesi lideridir. 1918''deki ilk cumhuriyetin lideri ise Mehmet Emin Resulzade''dir.',
  4
);

-- Soru #005 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '19. yüzyılın sonlarında Japonya''da feodal derebeylik (Şogunluk) düzenine ve samuray sınıfının imtiyazlarına son verilmiş, İmparator Mutsuhito tahta geçerek Batı tarzı askeri, idari, hukuki ve teknolojik reformları başlatan aydınlanma sürecini başlatmıştır.

Japonya''yı Doğu Asya''nın en güçlü modern sanayi ve askeri devleti haline getiren bu tarihi dönüşüme ne ad verilir?',
  '{"options": ["Kültür Devrimi", "Meiji Restorasyonu", "Taiping İsyanı", "Boksör Ayaklanması", "Şintoizm Reformu"], "correctIndex": 1}'::jsonb,
  '1868 yılında İmparator Mutsuhito''nun başlattığı modernleşme hamlesine ''Meiji Dönemi / Meiji Restorasyonu'' (Aydınlanmış Yönetim) denir. Japonya bu süreçte geleneksel kültürünü korurken Batı''nın teknolojisini ve bilimini alarak küresel bir güce dönüşmüştür.',
  'Kültür Devrimi Çin''de Mao Zedong tarafından yapılmıştır. Boksör Ayaklanması ise Çin''deki yabancı karşıtı isyandır. Japonya''nın modernleşme hamlesi Meiji Restorasyonu''dur.',
  5
);

-- Soru #006 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  '24 Ekim 1929 tarihinde New York Wall Street Borsası''nın aniden çökmesiyle başlayan ve küresel ölçekte bankaların iflasına, fabrikaların kapanmasına ve milyonlarca insanın işsiz kalmasına yol açan kriz tarihe ''Kara Perşembe'' ve ''Büyük Buhran'' olarak geçmiştir.

ABD Başkanı F. D. Roosevelt''in bu derin buhrandan çıkmak amacıyla devlet müdahalesini, kamu yatırımlarını ve sosyal yardımları artıran ekonomik kurtarma programına ne ad verilir?',
  '{"options": ["Monroe Doktrini", "Marshall Planı", "New Deal (Yeni Düzen)", "Truman Doktrini", "Eisenhower Doktrini"], "correctIndex": 2}'::jsonb,
  'Franklin D. Roosevelt, 1933''te iktidara geldikten sonra Keynesyen iktisat modeline dayanan ''New Deal'' (Yeni Düzen) programını uygulamış; kamu harcamaları, istihdam projeleri ve bankacılık reformlarıyla ABD ekonomisini toparlamıştır.',
  'Marshall Planı ve Truman Doktrini II. Dünya Savaşı sonrasında (1947) Soğuk Savaş bağlamında ortaya çıkmıştır. 1929 Bunalımı''na karşı ABD''nin geliştirdiği iç ekonomik program ''New Deal''dir.',
  6
);

-- Soru #007 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1929 Dünya Ekonomik Bunalımı Türkiye''yi de derinden etkilemiş; ihraç edilen tarım ürünlerinin fiyatları düşmüş ve dış ticaret açığı büyümüştür.

Türkiye Cumhuriyeti''nin 1929 Buhranı''nın olumsuz etkilerini hafifletmek amacıyla aldığı tedbirler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Devletçi ekonomi politikasına ve planlı sanayileşmeye ağırlık verilmesi", "Kazım Özalp başkanlığında ''Milli İktisat ve Tasarruf Cemiyeti''nin kurulması", "Dış ticarette ''Kliring'' ve ''Takas'' (malımı alanın malını alırım) sistemine geçilmesi", "Yerli malı kullanımının teşvik edilmesi için Yerli Malı Haftası ilan edilmesi", "IMF (Uluslararası Para Fonu) ile ilk stand-by anlaşmasının imzalanması"], "correctIndex": 4}'::jsonb,
  'IMF (Uluslararası Para Fonu) 1944 Bretton Woods Konferansı ile kurulmuş, Türkiye 1947''de üye olmuş ve Türkiye''nin ilk IMF stand-by anlaşması 1961 yılında (Cemal Gürsel hükümeti döneminde) imzalanmıştır. 1929 yılında henüz IMF bulunmamaktadır.',
  'Kliring ve Takas sistemi 1929 buhranında Türkiye''nin uyguladığı çok önemli bir modeldir ve ÖSYM bunu sıklıkla seçeneklere koyar. IMF ise II. Dünya Savaşı sonrasının kurumudur.',
  7
);

-- Soru #008 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1928 yılında Fransa Dışişleri Bakanı Aristide Briand ile ABD Dışişleri Bakanı Frank Kellogg öncülüğünde Paris''te imzalanan, ''savunmaya dayanmayan savaşı kanun dışı ilan eden'' ve uluslararası anlaşmazlıkların çözümünde savaşı bir dış politika aracı olarak reddeden pakt aşağıdakilerden hangisidir?',
  '{"options": ["Locarno Antlaşması", "Briand-Kellogg Paktı", "Küçük Antant", "Balkan Antantı", "Sadabad Paktı"], "correctIndex": 1}'::jsonb,
  'Briand-Kellogg Paktı (1928), savaşı ulusal politikanın bir aracı olmaktan çıkaran ve barışçıl çözümleri zorunlu kılan evrensel bir anlaşmadır. Türkiye de 1929 yılında bu pakta katılmıştır.',
  'Locarno Antlaşması (1925) Almanya''nın batı sınırlarını güvence altına alan bölgesel bir anlaşmadır. ''Savaşı kanun dışı ilan eden'' küresel pakt ise Briand-Kellogg Paktı''dır.',
  8
);

-- Soru #009 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''ndan galip çıkmasına rağmen umduğunu bulamayan İtalya''da ekonomik ve sosyal kriz derinleşmiştir. 1922 yılında Benito Mussolini liderliğindeki faşistlerin Napoli''den başkent Roma''ya gerçekleştirdiği ''Kara Gömlekliler Yürüyüşü'' sonucunda Kral Vittorio Emanuele iktidarı Mussolini''ye devretmek zorunda kalmıştır.

Mussolini''nin Akdeniz''i İtalyan gölü haline getirme ülküsünü ifade eden tarihi Latince doktrin aşağıdakilerden hangisidir?',
  '{"options": ["Lebensraum (Hayat Sahası)", "Mare Nostrum (Bizim Deniz)", "Drang nach Osten (Doğuya Doğru)", "Status Quo Ante Bellum", "Pax Romana"], "correctIndex": 1}'::jsonb,
  'Mussolini liderliğindeki faşist İtalya, antik Roma İmparatorluğu''nu canlandırma hayaliyle Akdeniz''e ''Mare Nostrum'' (Bizim Deniz) demiş ve Balkanlar ile Kuzey Afrika ve Doğu Akdeniz''de saldırgan bir yayılmacılık izlemiştir.',
  'Lebensraum (Hayat Sahası) Hitler Almanyası''nın Alman ırkı için Doğu Avrupa''da toprak kazanma doktrinidir. İtalya ve Akdeniz denildiğinde cevap ''Mare Nostrum''dur.',
  9
);

-- Soru #010 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Weimar Cumhuriyeti''nin yaşadığı hiperenflasyon ve Versay Antlaşması''nın ağır şartlarını fırsat bilerek iktidara gelen Adolf Hitler liderliğindeki Nasyonal Sosyalist Alman İşçi Partisi (Nazi), 1933''te totaliter bir rejim kurmuştur.

Hitler''in hapishanede kaleme aldığı ve Alman ırkının yaşaması için özellikle Doğu Avrupa ve Rusya topraklarının ele geçirilmesini öngören ''Hayat Sahası'' (Lebensraum) teorisini anlattığı kitabı aşağıdakilerden hangisidir?',
  '{"options": ["Devlet", "Kavgam (Mein Kampf)", "Kapital", "Toplum Sözleşmesi", "Tarihin Sonu"], "correctIndex": 1}'::jsonb,
  'Hitler 1923 yılındaki başarısız Birahane Darbesi sonrası cezaevinde iken ''Kavgam'' (Mein Kampf) kitabını yazmış; antisemitizm, Alman ırkının üstünlüğü ve Lebensraum (Hayat Sahası) ideolojisinin temellerini burada formüle etmiştir.',
  'Kavgam kitabı Hitler''in siyasi manifestosudur. Sorularda Lebensraum ve Nasyonal Sosyalizm ilkelerinin yer aldığı temel kaynak olarak sorulur.',
  10
);

-- Soru #011 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1936-1939 yılları arasında İspanya''da Cumhuriyetçiler ile General Francisco Franco liderliğindeki Milliyetçiler arasında kanlı bir iç savaş yaşanmıştır. Nazi Almanyası''nın Kondor Lejyonu uçakları 1937''de Guernica kasabasını bombalayarak binlerce masum sivili katletmiştir.

Bu insanlık dramını ve savaşın vahşetini kübist tarzda ölümsüzleştiren ''Guernica'' tablosunun sahibi dünyaca ünlü İspanyol ressam kimdir?',
  '{"options": ["Salvador Dali", "Pablo Picasso", "Francisco Goya", "Claude Monet", "Vincent van Gogh"], "correctIndex": 1}'::jsonb,
  'Guernica tablosu, Pablo Picasso tarafından 1937 Paris Uluslararası Fuarı İspanya pavyonu için çizilmiştir. Tablo, savaşın yıkıcılığını ve faşizmin vahşetini anlatan modern sanatın en önemli başyapıtıdır.',
  'Sürrealist ressam Salvador Dali ile kübist Picasso sıkça karıştırılır. Guernica tablosu tartışmasız biçimde Pablo Picasso''ya aittir.',
  11
);

-- Soru #012 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'II. Dünya Savaşı, 1 Eylül 1939 tarihinde Nazi Almanyası''nın tank, zırhlı birlikler ve hava kuvvetlerini eş zamanlı olarak kullanarak başlattığı ''Blitzkrieg'' (Yıldırım Savaşı) taktiği ile hangi ülkeyi işgal etmesi sonucunda resmen başlamıştır?',
  '{"options": ["Avusturya", "Çekoslovakya", "Polonya", "Fransa", "Belçika"], "correctIndex": 2}'::jsonb,
  'Almanya''nın 1 Eylül 1939 sabahı Polonya''ya saldırması üzerine İngiltere ve Fransa 3 Eylül''de Almanya''ya savaş ilan etmiş ve II. Dünya Savaşı fiilen başlamıştır.',
  'Almanya savaştan önce Avusturya''yı ilhak etmiş (Anschluss) ve Çekoslovakya''nın Südet bölgesini almıştır. Ancak II. Dünya Savaşı''nı resmen başlatan kıvılcım ''Polonya''nın işgali''dir.',
  12
);

-- Soru #013 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı''nda Almanya''nın Maginot Hattı''nı Ardenler Ormanları üzerinden aşarak Fransa''yı kısa sürede mağlup etmesi üzerine, Fransa topraklarının güneyinde Almanya ile iş birliği yapan kukla bir hükümet kurulmuştur.

Başkenti Vichy olan ve Mareşal Philippe Petain başkanlığında kurulan bu işbirlikçi rejim karşısında Londra''da ''Özgür Fransa Hareketi''ni başlatan Fransız lider kimdir?',
  '{"options": ["Charles de Gaulle", "Georges Clemenceau", "Francois Mitterrand", "Aristide Briand", "Edouard Daladier"], "correctIndex": 0}'::jsonb,
  'Fransa''nın teslimiyetçi Vichy Hükümeti''ne karşı General Charles de Gaulle Londra''ya kaçmış, BBC radyosundan Fransız halkına direniş çağrısı yaparak Özgür Fransa Hareketi''ni (Özgür Fransız Kuvvetleri) teşkilatlandırmıştır.',
  'Vichy Hükümeti başkanı Petain''dir; buna karşı direnişi yöneten ve savaştan sonra Fransa Cumhurbaşkanı olan lider Charles de Gaulle''dür.',
  13
);

-- Soru #014 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Nazi Almanyası''nın 22 Haziran 1941''de SSCB''ye karşı başlattığı devasa askeri taarruz harekâtına ''Barbarossa Harekâtı'' adı verilmiştir.

Alman 6. Ordusu''nun Mareşal Paulus komutasında kuşattığı, tarihin en kanlı sokak çatışmalarına sahne olan ve Almanya''nın ilk büyük kesin mağlubiyetini alarak savaştaki üstünlüğünü kaybettiği II. Dünya Savaşı''nın doğu cephesindeki dönüm noktası muharebesi aşağıdakilerden hangisidir?',
  '{"options": ["Moskova Muharebesi", "Stalingrad Muharebesi", "Kursk Tank Muharebesi", "Leningrad Kuşatması", "Kırım Harekâtı"], "correctIndex": 1}'::jsonb,
  'Ağustos 1942 - Şubat 1943 arasındaki Stalingrad Muharebesi''nde Sovyet Kızıl Ordusu Mareşal Paulus komutasındaki Alman ordusunu imha etmiş veya esir almıştır. Bu muharebe II. Dünya Savaşı''nın genel gidişatını Müttefikler lehine çeviren en kritik dönüm noktasıdır.',
  'Kursk Muharebesi tarihin en büyük tank savaşıdır; ancak Almanların genel taarruz inisiyatifini tamamen kaybettiği ve psikolojik kırılmanın yaşandığı asıl dönüm noktası Stalingrad Muharebesi''dir.',
  14
);

-- Soru #015 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  '7 Aralık 1941 tarihinde Japon İmparatorluk Donanması''nın Hawaii Adaları''ndaki ABD Pasifik Filosu üssüne düzenlediği ve ABD Başkanı Roosevelt''in ''Utanç Günü'' (Day of Infamy) olarak nitelediği ani hava saldırısı aşağıdakilerden hangisidir?',
  '{"options": ["Midway Baskını", "Pearl Harbor Baskını", "Guadalcanal Harekâtı", "Okinawa Çıkarması", "Mercan Denizi Muharebesi"], "correctIndex": 1}'::jsonb,
  '7 Aralık 1941 Pearl Harbor Baskını ile Japonya ABD''nin Pasifik filosunu vurmuştur. Bu olay üzerine tarafsızlık politikasını terk eden ABD resmen II. Dünya Savaşı''na Müttefikler safında girmiştir.',
  'Midway Muharebesi Pearl Harbor''dan 6 ay sonra (Haziran 1942) Pasifik''te ABD''nin Japon donanmasını hezimete uğrattığı deniz muharebesidir. İlk baskın ise Pearl Harbor''dır.',
  15
);

-- Soru #016 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '6 Haziran 1944 tarihinde General Dwight D. Eisenhower başkomutanlığında Müttefik kuvvetlerinin Fransa kıyılarına başlattığı, tarihin en büyük amfibi (denizden karaya) askeri operasyonu olan ve Batı Avrupa''nın Nazi işgalinden kurtarılmasını sağlayan harekât aşağıdakilerden hangisidir?',
  '{"options": ["Overlord Harekâtı (Normandiya Çıkarması)", "Barbarossa Harekâtı", "Kartal Hücumu", "Meşale Harekâtı (Operation Torch)", "Merkür Harekâtı"], "correctIndex": 0}'::jsonb,
  '6 Haziran 1944 Normandiya Çıkarması (kod adı Overlord Harekâtı), Müttefiklerin Batı Cephesi''ni açarak Fransa''yı ve ardından tüm Batı Avrupa''yı kurtarmasını sağlamıştır. Başkomutan General Eisenhower''dır.',
  'Meşale Harekâtı Kuzey Afrika''ya yapılan çıkarmadır. Fransa kıyılarına yapılan tarihi büyük amfibi çıkarma ise Overlord / Normandiya Çıkarması''dır.',
  16
);

-- Soru #017 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Şubat 1945''te toplanan Yalta Konferansı''nda ''Üç Büyükler'' (Roosevelt, Churchill ve Stalin) bir araya gelerek savaş sonrası dünya düzenini görüşmüştür.

Aşağıdakilerden hangisi Yalta Konferansı''nda alınan kararlardan biri değildir?',
  '{"options": ["Almanya''nın dört ayrı işgal bölgesine (ABD, SSCB, İngiltere, Fransa) ayrılması", "Birleşmiş Milletler Güvenlik Konseyi''nde beş daimi üyeye veto hakkı tanınması", "1 Mart 1945''e kadar Mihver devletlere resmen savaş açan ülkelerin Birleşmiş Milletler''e kurucu üye olabilmesi", "SSCB''nin Almanya''nın tesliminden sonra Japonya''ya savaş açmayı kabul etmesi", "İsrail Devleti''nin kurulmasının oy birliğiyle onaylanması"], "correctIndex": 4}'::jsonb,
  'İsrail Devleti''nin kuruluşu Yalta Konferansı''nda kararlaştırılmamıştır. İsrail, II. Dünya Savaşı sonrasında 1947 BM Taksim Planı ve 1948 yılındaki ilanıyla kurulmuştur. Diğer tüm maddeler Yalta Konferansı''nın tarihi kararlarıdır.',
  'Yalta Konferansı''nda ''1 Mart 1945''e kadar Almanya''ya savaş ilan edenlerin BM kurucusu olabileceği'' kararı Türkiye''nin sembolik olarak Almanya''ya savaş ilan etmesine yol açan maddedir!',
  17
);

-- Soru #018 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'Nisan-Haziran 1945 tarihleri arasında toplanan ve 50 devletin katılımıyla Birleşmiş Milletler Antlaşması''nın (BM Şartı) imzalanarak BM teşkilatının resmen kurulduğu uluslararası konferans aşağıdakilerden hangisidir?',
  '{"options": ["San Francisco Konferansı", "Bretton Woods Konferansı", "Potsdam Konferansı", "Kazablanka Konferansı", "Dumbarton Oaks Konferansı"], "correctIndex": 0}'::jsonb,
  'Birleşmiş Milletler Cemiyeti, 25 Nisan - 26 Haziran 1945 tarihleri arasında toplanan San Francisco Konferansı ile resmen kurulmuştur. Türkiye de 51 kurucu devletten biri olarak antlaşmayı imzalamıştır.',
  'Bretton Woods para ve ekonomi (IMF/Dünya Bankası) konferansıdır. Potsdam ise Almanya''nın tasfiyesi konferansıdır. BM''nin bizzat kurulduğu konferans San Francisco''dur.',
  18
);

-- Soru #019 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'II. Dünya Savaşı''nın Pasifik Cephesi''nde Japonya''nın direncini kırmak ve kayıpları önlemek amacıyla ABD Başkanı Harry Truman''ın emriyle Ağustos 1945''te sırasıyla atom bombası atılan iki Japon şehri aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Tokyo - Osaka", "Hiroşima - Nagazaki", "Kyoto - Hiroşima", "Nagazaki - Yokohama", "Hiroşima - Kobe"], "correctIndex": 1}'::jsonb,
  'ABD, 6 Ağustos 1945''te ''Enola Gay'' isimli B-29 uçağıyla Hiroşima''ya uranyum bombası (Little Boy), 9 Ağustos 1945''te ise Nagazaki''ye plütonyum bombası (Fat Man) atmıştır. Japonya 2 Eylül 1945''te USS Missouri zırhlısında kayıtsız şartsız teslim belgesini imzalamıştır.',
  'Tokyo başkenttir ve geleneksel yangın bombalarıyla vurulmuştur; atom bombası ise Hiroşima ve Nagazaki şehirlerine atılmıştır.',
  19
);

-- Soru #020 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı yıllarında Cumhurbaşkanı İsmet İnönü ve Türk diplomasisi, ülkeyi fiilen savaşın yıkımından uzak tutabilmek amacıyla ''aktif tarafsızlık'' ve dengeli bir dış politika izlemiştir.

Bu süreçte İngiltere Başbakanı Winston Churchill ile Cumhurbaşkanı İsmet İnönü''nün bir tren vagonunda bir araya geldiği ve Türkiye''nin savaşa girmesi için yoğun baskı yapıldığı görüşme aşağıdakilerden hangisidir?',
  '{"options": ["1943 Adana Görüşmesi", "1943 I. Kahire Konferansı", "1941 Moskova Zirvesi", "1944 Tahran Zirvesi", "1945 Yalta Zirvesi"], "correctIndex": 0}'::jsonb,
  '30-31 Ocak 1943''te Adana Yenice tren istasyonunda (Adana Mülakatı) İsmet İnönü ile Churchill görüşmüştür. Churchill Türkiye''nin müttefikler safında savaşa girmesini istemiş; İnönü ise Türk ordusunun silah ve teçhizat yetersizliğini öne sürerek talebi ustaca ertelemiştir.',
  'Adana Görüşmesi doğrudan Türkiye topraklarında (Yenice istasyonu vagonunda) yapılmıştır. Kahire Konferansı ise Mısır''da Roosevelt, Churchill ve İnönü arasında gerçekleşmiştir.',
  20
);

-- Soru #021 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında Türkiye fiilen savaşa girmemesine rağmen bir milyona yakın genç erkeğin silah altına alınması üretimde büyük düşüşe yol açmış, karaborsacılık ve fahiş fiyat artışları baş göstermiştir.

Türkiye''de hükümetin bu olağanüstü dönemde fiyatları denetlemek, fabrikalara el koyabilmek ve çalışma zorunluluğu getirebilmek amacıyla 1940 yılında çıkardığı kapsamlı olağanüstü yetki kanunu aşağıdakilerden hangisidir?',
  '{"options": ["Takrir-i Sükun Kanunu", "Milli Korunma Kanunu", "Teşvik-i Sanayi Kanunu", "Hıyanet-i Vataniye Kanunu", "Varlık Vergisi Kanunu"], "correctIndex": 1}'::jsonb,
  '1940 yılında çıkarılan Milli Korunma Kanunu ile hükümete ekonomiyi doğrudan denetleme, ürünlere narh koyma, zorunlu çalışma mükellefiyeti getirme ve gerektiğinde işletmelere el koyma gibi olağanüstü geniş yetkiler tanınmıştır. Petrol Ofisi ve Et ve Balık Kurumu bu kanuna dayanılarak kurulmuştur.',
  'Varlık Vergisi (1942) savaş zenginlerinden ve tüccarlardan bir defaya mahsus alınan servet vergisidir; devletin ekonomiye genel müdahalesini düzenleyen temel çatı kanun ise ''Milli Korunma Kanunu''dur.',
  21
);

-- Soru #022 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1942 yılında Şükrü Saraçoğlu Hükümeti tarafından savaş zenginlerine, karaborsacılara ve özellikle büyük tüccarlara yönelik çıkarılan ve belirlenen olağanüstü vergiyi ödeyemeyenlerin Erzurum Aşkale''ye bedeni çalışma kampına gönderildiği mali uygulama aşağıdakilerden hangisidir?',
  '{"options": ["Aşar Vergisi", "Toprak Mahsulleri Vergisi", "Varlık Vergisi", "Tekalif-i Milliye", "Ağnam Vergisi"], "correctIndex": 2}'::jsonb,
  '11 Kasım 1942''de kabul edilen Varlık Vergisi Kanunu ile yüksek kazanç sahipleri ve tüccarlar vergilendirilmiş; vergisini belirlenen sürede ödemeyen mükellefler borçlarını bedenen ödemek üzere Erzurum Aşkale''deki çalışma kampına gönderilmiştir.',
  'Toprak Mahsulleri Vergisi doğrudan köylüden ayni olarak alınan tarım vergisidir. Aşkale çalışma kampı uygulaması ise ''Varlık Vergisi'' mükellefleri içindir.',
  22
);

-- Soru #023 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'II. Dünya Savaşı sonrasında ABD öncülüğündeki Batı Bloku ile SSCB öncülüğündeki Doğu Bloku arasında 1945-1990 yılları arasında yaşanan nükleer silahlanma yarışı, casusluk ve bölgesel vekalet savaşları dönemine ''Soğuk Savaş'' adı verilmiştir.

İngiltere Başbakanı Winston Churchill''in 1946 yılında ABD''de yaptığı Fulton konuşmasında Doğu Bloku ülkelerini Batı dünyasından ayıran ideolojik ve askeri sınırı tanımlamak için kullandığı ünlü ifade aşağıdakilerden hangisidir?',
  '{"options": ["Demir Perde (Iron Curtain)", "Berlin Duvarı", "Yeşil Hat", "Hayat Sahası", "Sıcak Hat"], "correctIndex": 0}'::jsonb,
  'Winston Churchill, 1946''da Missouri Fulton''da yaptığı konuşmada ''Baltık''taki Stettin''den Adriyatik''teki Trieste''ye kadar kıta boyunca bir Demir Perde inmiştir.'' diyerek Doğu Bloku''nu nitelemiştir. Bu ifade Soğuk Savaş terminolojisinin sembolü olmuştur.',
  'Berlin Duvarı 1961''de Doğu Almanya tarafından inşa edilmiş fiziksel bir duvardır. Churchill''in 1946''daki konuşmasında zikrettiği mecazi kavram ise ''Demir Perde''dir.',
  23
);

-- Soru #024 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1947 yılında ABD Başkanı Harry Truman tarafından ilan edilen ve SSCB''nin Akdeniz ve Orta Doğu''ya inmesini engellemek (Çevreleme Politikası) amacıyla doğrudan Türkiye ve Yunanistan''a askeri ve mali yardım yapılmasını öngören tarihi doktrin aşağıdakilerden hangisidir?',
  '{"options": ["Monroe Doktrini", "Truman Doktrini", "Eisenhower Doktrini", "Carter Doktrini", "Reagan Doktrini"], "correctIndex": 1}'::jsonb,
  '12 Mart 1947''de ilan edilen Truman Doktrini ile ABD, Sovyet tehdidi altındaki Türkiye ve Yunanistan''a 400 milyon dolar askeri ve mali yardım sağlamıştır. Bu doktrin ABD''nin geleneksel yalnızlık (Monroe) politikasını tamamen terk ettiğini gösterir.',
  'Marshall Planı (Haziran 1947) tüm savaştan çıkan Avrupa ülkelerine yönelik ekonomik kalkınma paketidir. Doğrudan Türkiye ve Yunanistan''a askeri destek sağlayan ilk doktrin ise ''Truman Doktrini''dir.',
  24
);

-- Soru #025 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Doğu Bloku''nda Batı''nın kurduğu NATO''ya (1949) askeri bir karşılık vermek ve Batı Almanya''nın NATO''ya dahil edilmesine karşı 1955 yılında SSCB öncülüğünde Doğu Bloku ülkeleri arasında kurulan askeri savunma paktı aşağıdakilerden hangisidir?',
  '{"options": ["Kominform", "Komekon", "Varşova Paktı", "Bağdat Paktı", "Şanghay İşbirliği Örgütü"], "correctIndex": 2}'::jsonb,
  'NATO''ya karşı Doğu Bloku''nun askeri kanadı olarak 1955''te ''Varşova Paktı'' kurulmuştur. Kominform ideolojik örgütlenme, Komekon ise ekonomik işbirliği örgütlenmesidir.',
  'Doğu Bloku kurumlarının işlevleri karıştırılır: Kominform = İdeolojik (Komünist partiler arası bağ), Komekon = Ekonomik (Marshall''a karşı Molotov Planı uzantısı), Varşova Paktı = Askeri (NATO''ya karşı).',
  25
);

-- Soru #026 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  '1950 yılında Kuzey Kore''nin 38. paraleli geçerek Güney Kore''ye saldırması üzerine patlak veren Kore Savaşı''na BM Güvenlik Konseyi çağrısıyla Türkiye de Tuğgeneral Tahsin Yazıcı komutasında bir tugay göndermiştir.

Türk Tugayı''nın Kunuri Muharebeleri''nde gösterdiği üstün kahramanlık ve direniş, Türkiye''nin aşağıdaki uluslararası güvenlik teşkilatlarından hangisine üye kabul edilmesinde belirleyici rol oynamıştır?',
  '{"options": ["Birleşmiş Milletler (1945)", "Avrupa Konseyi (1949)", "Kuzey Atlantik Antlaşması Örgütü - NATO (1952)", "Balkan Paktı (1953)", "Bağdat Paktı (1955)"], "correctIndex": 2}'::jsonb,
  'Türkiye, Sovyet tehdidine karşı NATO''ya girmek istemiş ancak başta İngiltere ve İskandinav ülkeleri direnmiştir. TBMM kararıyla Kore''ye gönderilen Türk tugayının Kunuri''deki başarısı üzerine Türkiye, 18 Şubat 1952''de Yunanistan ile birlikte NATO''ya üye kabul edilmiştir.',
  'Türkiye BM''ye 1945''te kurucu üye olmuştur. Kore Savaşı''ndaki fedakarlık Türkiye''nin 1952''de NATO''ya kabul edilmesini sağlamıştır.',
  26
);

-- Soru #027 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Türkiye''de II. Dünya Savaşı sonrasında çok partili siyasi hayata geçiş hızlanmıştır. 1945 yılında Nuri Demirağ tarafından Milli Kalkınma Partisi kurulmuş; ardından CHP içindeki muhalif milletvekilleri tarafından ''Dörtlü Takrir'' verilmiştir.

Aşağıdaki siyasetçilerden hangisi CHP''den ayrılarak 7 Ocak 1946''da Demokrat Parti''yi (DP) kuran ''Dörtlü Takrir'' imzacılarından biri değildir?',
  '{"options": ["Celal Bayar", "Adnan Menderes", "Fuat Köprülü", "Refik Koraltan", "Fevzi Çakmak"], "correctIndex": 4}'::jsonb,
  'Demokrat Parti''nin kurucuları olan Dörtlü Takrir heyeti ''C-A-F-E-R'' (Celal Bayar, Adnan Menderes, Fuat Köprülü, Refik Koraltan) olarak kodlanır. Mareşal Fevzi Çakmak ise 1948''de kurulan Millet Partisi''nin onursal başkanı olmuştur.',
  'Fevzi Çakmak DP listesinden bağımsız vekil seçilmiş olsa da Dörtlü Takrir''i veren ve DP''yi kuran dört isim arasında yer almaz; Millet Partisi kurucusudur.',
  27
);

-- Soru #028 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  '14 Mayıs 1950 genel seçimlerinde, ilk kez ''gizli oy - açık tasnif'' esası ve yargı denetimi uygulanmıştır. Seçimleri ezici bir çoğunlukla kazanan Demokrat Parti, 27 yıllık tek parti CHP iktidarına son vererek iktidara gelmiştir.

Demokrasi tarihimizde kansız ve barışçıl yolla hükümet değişimini simgeleyen bu tarihi olaya ne ad verilir?',
  '{"options": ["Kadife Devrim", "Beyaz İhtilal", "Gül Devrimi", "Milli İrade Hareketi", "Güneş Harekâtı"], "correctIndex": 1}'::jsonb,
  '14 Mayıs 1950 seçimleriyle iktidarın barışçıl ve demokratik sandık yoluyla CHP''den DP''ye geçmesi Türk siyasi tarihinde ''Beyaz İhtilal'' olarak adlandırılır. Celal Bayar Cumhurbaşkanı, Adnan Menderes Başbakan olmuştur.',
  'Kadife Devrim Çekoslovakya''da komünizmin kansız çöküşüdür. Türkiye''deki 1950 barışçıl iktidar değişimi ''Beyaz İhtilal'' olarak anılır.',
  28
);

-- Soru #029 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1962 yılında SSCB''nin Küba''ya nükleer başlıklı füzeler yerleştirmesi ve ABD''nin Küba adasını deniz ablukasına almasıyla patlak veren Küba Füze Krizi, dünyayı nükleer savaşın eşiğine getirmiştir.

ABD Başkanı J. F. Kennedy ile Sovyet lideri Nikita Kruşçev arasındaki gizli pazarlıklar sonucunda; SSCB''nin Küba''daki füzeleri sökmesi karşılığında ABD''nin aşağıdaki hangi ülkedeki ''Jüpiter'' füzelerini gizlice sökmesi kararlaştırılmıştır?',
  '{"options": ["Almanya", "İtalya", "Türkiye", "Yunanistan", "İran"], "correctIndex": 2}'::jsonb,
  'Küba Füze Krizi''nde Sovyetler, Küba''daki füzeleri kaldırmak için ABD''nin Türkiye''deki (İzmir Çiğli) Jüpiter nükleer füzelerini sökmesini şart koşmuş ve taraflar bu şekilde anlaşmıştır. Türkiye, kendi güvenliğini ilgilendiren bu pazarlığın dışarıdan yürütüldüğünü sonradan öğrenmiştir.',
  'ÖSYM''nin en çok sorduğu Soğuk Savaş sorularındandır: Küba''daki füzelere karşılık Türkiye''deki ''Jüpiter füzeleri'' sökülmüştür.',
  29
);

-- Soru #030 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Soğuk Savaş döneminde ne Batı Bloku''na ne de Doğu Bloku''na dahil olmak istemeyen, çoğunluğu Asya ve Afrika''daki bağımsızlığını yeni kazanmış sömürge sonrası ülkelerden oluşan ''Üçüncü Dünya'' devletleri Bağlantısızlar Hareketi''ni (Non-Aligned Movement) başlatmıştır.

1955 yılında Endonezya''da toplanan ve Bağlantısızlar Hareketi''nin doğuşunu simgeleyen tarihi konferans aşağıdakilerden hangisidir?',
  '{"options": ["Bandung Konferansı", "Kahire Konferansı", "Cenevre Konferansı", "Belgrad Konferansı", "Helsinki Konferansı"], "correctIndex": 0}'::jsonb,
  '1955 Bandung Konferansı ile sömürgeciliğe karşı barış içinde bir arada yaşama ilkeleri (Pancasila) belirlenmiştir. Hareketin liderliğini Yugoslavya (Tito), Mısır (Nasır) ve Hindistan (Nehru) üstlenmiştir.',
  'Bağlantısızlar''ın resmi ilk zirvesi 1961 Belgrad Zirvesi''dir; ancak hareketin fikirsel temelinin atıldığı ve doğduğu ilk toplantı 1955 ''Bandung Konferansı''dır.',
  30
);

-- Soru #031 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Doğu ve Batı blokları arasında Yumuşama (Detant) sürecinin en önemli diplomatik zirvesi olan ve 1975 yılında Avrupa''da mevcut sınırların dokunulmazlığını, insan haklarına saygıyı ve egemen eşitliği teyit eden ''Helsinki Nihai Senedi'' imzalanmıştır.

Bu nihai senet ile temelleri atılan ve daha sonra daimi bir uluslararası kuruluşa dönüşen teşkilat aşağıdakilerden hangisidir?',
  '{"options": ["Avrupa Birliği (AB)", "Avrupa Güvenlik ve İşbirliği Teşkilatı (AGİT / AGİK)", "Avrupa Konseyi", "Kuzey Atlantik Konseyi", "Milletler Cemiyeti"], "correctIndex": 1}'::jsonb,
  '1975 Helsinki Nihai Senedi ile Avrupa Güvenlik ve İşbirliği Konferansı (AGİK) kurulmuş, 1994 Budapeşte Zirvesi''nde ismi AGİT (Avrupa Güvenlik ve İşbirliği Teşkilatı) olarak değiştirilmiştir.',
  'Helsinki Zirvesi doğrudan insan hakları ve bloklar arası güvenlikle ilgilidir ve AGİT''i doğurmuştur. Avrupa Birliği''nin temeli ise Roma Antlaşması''na (1957) dayanır.',
  31
);

-- Soru #032 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1973 yılında patlak veren Yom Kippur (Dördüncü Arap-İsrail) Savaşı''nda ABD ve Batılı devletlerin İsrail''i açıkça desteklemesi üzerine, Arap Petrol İhraç Eden Ülkeler Örgütü (OAPEC) Batılı ülkelere petrol ambargosu uygulamış ve petrol üretimini kısarak fiyatları dört katına çıkarmıştır.

Dünya ekonomisinde ''Stagflasyon'' (aynı anda durgunluk ve yüksek enflasyon) kavramının doğmasına yol açan bu tarihi kriz aşağıdakilerden hangisidir?',
  '{"options": ["1929 Kara Perşembe", "1973 Petrol Krizi", "1997 Asya Kaplanları Krizi", "2008 Küresel Mortgage Krizi", "1979 İkinci Petrol Şoku"], "correctIndex": 1}'::jsonb,
  '1973 Petrol Krizi (I. Petrol Şoku), OAPEC''in petrolü siyasi bir silah olarak kullanmasıyla ortaya çıkmış ve sanayileşmiş Batı ülkelerinde derin bir ekonomik resesyon ile enflasyona (stagflasyon) yol açmıştır.',
  '1979 Petrol Krizi İran İslam Devrimi sonrası yaşanmıştır; Yom Kippur Savaşı kaynaklı Batı ambargosu ve ilk büyük kriz ise ''1973 Petrol Krizi''dir.',
  32
);

-- Soru #033 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'ABD Başkanı Jimmy Carter''ın arabuluculuğunda 1978 yılında imzalanan Camp David Sözleşmesi ile İsrail''i resmen tanıyan ve İsrail ile barış antlaşması imzalayan ''ilk Arap devleti'' aşağıdakilerden hangisidir?',
  '{"options": ["Ürdün", "Suriye", "Mısır", "Lübnan", "Irak"], "correctIndex": 2}'::jsonb,
  'Mısır Cumhurbaşkanı Enver Sedat ile İsrail Başbakanı Menahem Begin arasında imzalanan Camp David Sözleşmesi (ve 1979 Washington Barış Antlaşması) ile Mısır, İsrail''i resmen tanıyan ilk Arap ülkesi olmuş ve Sina Yarımadası''nı geri almıştır.',
  'Ürdün İsrail''i tanıyan ikinci Arap devletidir (1994 Vadi Araba Antlaşması). İlk tanıyan Arap devleti Enver Sedat dönemindeki Mısır''dır.',
  33
);

-- Soru #034 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'Kıbrıs''ta Yunan cuntasının desteklediği EOKA terör örgütünün darbe yaparak ENOSIS''i (adanın Yunanistan''a bağlanması) ilan etmesi üzerine, Türkiye Cumhuriyeti garantörlük hakkını kullanarak 20 Temmuz 1974''te adaya askeri harekât düzenlemiştir.

Kıbrıs Barış Harekâtı sırasında görev yapan Türkiye Cumhuriyeti Başbakanı ve Başbakan Yardımcısı ikilisi ile harekâtın ünlü şifresi aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Bülent Ecevit - Necmettin Erbakan / ''Ayşe Tatile Çıksın''", "Süleyman Demirel - Turhan Feyzioğlu / ''Akdeniz İleri''", "Nihat Erim - Ferit Melen / ''Toroslar Hazır''", "Turgut Özal - Kaya Erdem / ''Zafer Bizimdir''", "Adnan Menderes - Fatin Rüştü Zorlu / ''Ada Türkündür''"], "correctIndex": 0}'::jsonb,
  '1974 Kıbrıs Barış Harekâtı CHP-MSP koalisyonu döneminde Başbakan Bülent Ecevit ve Başbakan Yardımcısı Necmettin Erbakan hükümeti tarafından icra edilmiştir. İkinci Cenevre Konferansı tıkanınca Dışişleri Bakanı Turan Güneş''in Ankara''ya çektiği tarihi şifre ''Ayşe Tatile Çıksın''dır.',
  '1959-1960 Londra-Zürih garantörlük antlaşmaları Menderes dönemindedir; ancak 1974 Barış Harekâtı Bülent Ecevit ve Necmettin Erbakan hükümetindedir.',
  34
);

-- Soru #035 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  1,
  'Kıbrıs Türk halkının varoluş ve özgürlük mücadelesine ömrünü adayan, Türk Mukavemet Teşkilatı''nın (TMT) liderliğini yapan ve 15 Kasım 1983 tarihinde bağımsızlığını ilan eden Kuzey Kıbrıs Türk Cumhuriyeti''nin (KKTC) kurucu cumhurbaşkanı olan tarihi lider kimdir?',
  '{"options": ["Fazıl Küçük", "Rauf Denktaş", "Mehmet Ali Talat", "Derviş Eroğlu", "Cengiz Topel"], "correctIndex": 1}'::jsonb,
  'Rauf Denktaş (1924-2012), Kıbrıs davasının efsanevi lideri ve 1983''te kurulan KKTC''nin kurucu ilk Cumhurbaşkanıdır. Dr. Fazıl Küçük ise Kıbrıs Türk toplumunun ilk lideridir.',
  'Dr. Fazıl Küçük Kıbrıs Türk Federe Devleti öncesi ilk toplum lideri iken; 1983''te kurulan KKTC''nin ''kurucu cumhurbaşkanı'' Rauf Denktaş''tır.',
  35
);

-- Soru #036 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1985 yılında SSCB Komünist Partisi Genel Sekreterliği''ne getirilen Mihail Gorbaçov, çökmekte olan Sovyet ekonomisini ve yozlaşan bürokratik yapıyı kurtarmak amacıyla iki temel reform paketi açıklamıştır.

Gorbaçov''un açıkladığı ''Glasnost'' ve ''Perestroyka'' kavramlarının Türkçe karşılıkları aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["Açıklık / Şeffaflık - Yeniden Yapılanma", "Sosyalizm - Kamulaştırma", "Yeniden Yapılanma - Barış İçinde Bir Arada Yaşama", "Hürriyet - Kolektifleştirme", "Sansürsüzlük - Sanayileşme"], "correctIndex": 0}'::jsonb,
  'Mihail Gorbaçov''un Sovyet sistemini kurtarmak için getirdiği ''Glasnost'' açıklık ve şeffaflık (sansürün gevşetilmesi ve ifade özgürlüğü); ''Perestroyka'' ise yeniden yapılanma (ekonomik sistemin esnetilmesi) anlamına gelir. Ancak bu reformlar rejimi kurtaramamış, 1991''de birliğin dağılmasına yol açmıştır.',
  'Glasnost ve Perestroyka kelimelerinin yerleri ters verilerek sıkça çeldirici oluşturulur. Glasnost = Açıklık, Perestroyka = Yeniden Yapılanma.',
  36
);

-- Soru #037 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1991 yılında Sovyet Sosyalist Cumhuriyetler Birliği''nin (SSCB) resmen dağılmasıyla birlikte Kafkaslar ve Orta Asya''daki Türk devletleri bağımsızlıklarını kazanmış ve Türkiye bu cumhuriyetleri tanıyan ilk devlet olmuştur.

Buna göre aşağıdaki ''Türk Cumhuriyeti'' ve ''bağımsızlık dönemindeki ilk lider'' eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Kazakistan - Nursultan Nazarbayev", "Özbekistan - İslam Kerimov", "Türkmenistan - Sapar Murat Niyazov (Türkmenbaşı)", "Kırgızistan - Askar Akayev", "Azerbaycan - Haydar Aliyev"], "correctIndex": 4}'::jsonb,
  'Azerbaycan 1991''de bağımsızlığını kazandığında ilk cumhurbaşkanı Ayaz Muttalibov olmuş, ardından efsanevi milli lider Ebulfez Elçibey seçilmiştir. Haydar Aliyev ise 1993 yılında Elçibey''den sonra cumhurbaşkanı olmuştur.',
  'Haydar Aliyev Azerbaycan''ın çok etkili bir lideri olmakla birlikte bağımsızlığın ilk cumhurbaşkanı değildir; bağımsızlık mücadelesi Elçibey ve Halk Cephesi önderliğinde yürütülmüştür.',
  37
);

-- Soru #038 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1992-1995 yılları arasında Bosna-Hersek''te Sırp güçlerinin gerçekleştirdiği ve Srebrenitsa''da binlerce masum Boşnak Müslümanın katledildiği soykırım karşısında halkının bağımsızlığını savunan, ''Bilge Kral'' unvanıyla anılan ve Bosna Savaşı''nı sona erdiren Dayton Barış Antlaşması''na imza atan lider kimdir?',
  '{"options": ["Slobodan Milosevic", "Aliya İzzetbegoviç", "Radovan Karadzic", "Franjo Tudjman", "İbrahim Rugova"], "correctIndex": 1}'::jsonb,
  'Aliya İzzetbegoviç (1925-2003), Bosna-Hersek''in bağımsızlık lideri, düşünürü ve ilk cumhurbaşkanıdır. ''Doğu ve Batı Arasında İslam'' ve ''İslam Deklarasyonu'' eserlerinin sahibidir; dünya çapında ''Bilge Kral'' olarak tanınır.',
  'Slobodan Milosevic ve Karadzic Sırp savaş suçlularıdır; Tudjman Hırvat liderdir. Bilge Kral lakaplı Boşnak lider Aliya İzzetbegoviç''tir.',
  38
);

-- Soru #039 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Türkiye''nin Türk cumhuriyetleri ve akraba topluluklarla kültürel, ekonomik ve teknik iş birliğini geliştirmek amacıyla kurduğu kurumlara ilişkin;
I. TİKA (Türk İşbirliği ve Koordinasyon Ajansı Başkanlığı), 1992 yılında Dışişleri Bakanlığı''na bağlı olarak kurulmuş kalkınma ajansıdır.
II. TÜRKSOY (Uluslararası Türk Kültürü Teşkilatı), 1993 yılında Türk dili konuşan ülkelerin kültür bakanları tarafından kurulmuştur.
III. 2009 Nahçıvan Anlaşması ile temelleri atılan Türk Keneşi (Konseyi), 2021 İstanbul Zirvesi''nde ''Türk Devletleri Teşkilatı'' adını almıştır.

Yukarıda verilen bilgilerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de Türk dünyası entegrasyonuna ilişkin son derece güncel ve tarihsel olarak doğru bilgilerdir: 1992 TİKA, 1993 TÜRKSOY ve 2009''da kurulan Türk Konseyi''nin 2021''de Türk Devletleri Teşkilatı''na (TDT) dönüşmesi KPSS''de sıklıkla sorulur.',
  'Türk Devletleri Teşkilatı''nın eski adının Türk Dili Konuşan Ülkeler İşbirliği Konseyi (Türk Konseyi) olduğu ve kuruluş belgesinin Nahçıvan Anlaşması olduğu çok güncel bir sınav bilgisidir.',
  39
);

-- Soru #040 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Soğuk Savaş döneminde ABD ve SSCB arasında askeri rekabetin yanı sıra büyük bir uzay ve teknoloji yarışı yaşanmıştır.

Buna göre uzay yarışıyla ilgili aşağıdaki tarihi gelişmelerden hangisi yanlış eşleştirilmiştir?',
  '{"options": ["Sputnik 1 (1957) - SSCB tarafından uzaya fırlatılan dünyanın ilk yapay uydusu", "Yuri Gagarin (1961) - Vostok 1 aracıyla uzaya çıkan ve Dünya''nın yörüngesini dolaşan ilk insan", "Valentina Tereşkova (1963) - Uzaya giden ilk kadın kozmonot", "Neil Armstrong (1969) - Apollo 11 göreviyle Ay yüzeyine ilk ayak basan astronot", "Laika (1957) - ABD tarafından uzaya gönderilen ilk canlı maymun"], "correctIndex": 4}'::jsonb,
  'Laika, ABD tarafından değil, SSCB tarafından 3 Kasım 1957''de Sputnik 2 uydusuyla uzaya gönderilen dünyaca ünlü sokak köpeğidir. Dolayısıyla eşleştirme yanlıştır.',
  'Uzaya giden ilk canlı Laika bir köpektir ve Sovyetler Birliği tarafından gönderilmiştir; ABD''ye ait olduğu veya maymun olduğu yönündeki çeldiricilere dikkat edilmelidir.',
  40
);

-- Soru #041 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''ndan sonra Çarlık Rusyası''nın yıkılmasıyla Türkistan''da kurulan Hokand Muhtariyeti''ni kanlı şekilde yıkan Bolşeviklere karşı başlayan ''Basmacı Hareketi''nin ilk kıvılcımını yakan ve yerel direniş liderlerine verilen tarihi unvan aşağıdakilerden hangisidir?',
  '{"options": ["Koranbaşı", "Ataman", "İnal", "Bahadır", "Subaşı"], "correctIndex": 0}'::jsonb,
  'Basmacı Hareketi''nde bağımsızlık için savaşan Türkistan direniş liderlerine ''Koranbaşı'' adı verilirdi (Ergaş Koranbaşı, Şir Muhammed Bek vb.).',
  'Koranbaşı Basmacı Hareketi''ne özgü askeri-sivil yerel lider unvanıdır. Enver Paşa bu liderleri birleştirmiştir.',
  41
);

-- Soru #042 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Başkurt Türklerinin bağımsızlık mücadelesine öncülük eden, Başkurdistan Cumhuriyeti''nin ilk hükümet başkanı olan, Sovyet baskısı sebebiyle Türkiye''ye gelerek İstanbul Üniversitesi''nde Umumi Türk Tarihi kürsüsünü kuran dünyaca ünlü Türk tarihçisi kimdir?',
  '{"options": ["Zeki Velidi Togan", "Yusuf Akçura", "İsmail Gaspıralı", "Sadri Maksudi Arsal", "Mehmet Emin Resulzade"], "correctIndex": 0}'::jsonb,
  'Ord. Prof. Dr. Zeki Velidi Togan, hem Başkurt milli hükümet başkanı hem de ''Umumi Türk Tarihine Giriş'' eserinin yazarı olan büyük bir bilim insanıdır.',
  'Yusuf Akçura ''Üç Tarz-ı Siyaset''in yazarı ve Türk Tarih Kurumu başkanıdır; Başkurt lider ve kürsü kurucusu ise Zeki Velidi Togan''dır.',
  42
);

-- Soru #043 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1904 yılında Kahire''de Türk gazetesinde yayımladığı ''Üç Tarz-ı Siyaset'' adlı ünlü makalesiyle Osmanlıcılık, İslamcılık ve Türkçülük fikirlerini karşılaştırmalı inceleyen ve Türkçülüğün manifestosunu yazan fikir adamı kimdir?',
  '{"options": ["Yusuf Akçura", "Ziya Gökalp", "İsmail Gaspıralı", "Mehmet Emin Yurdakul", "Ömer Seyfettin"], "correctIndex": 0}'::jsonb,
  'Kazan Türkü olan Yusuf Akçura, ''Üç Tarz-ı Siyaset'' eseriyle Türkçülük akımının en önemli teorisyenlerinden biri olmuş ve Türk Tarih Kurumu''nun da başkanlığını yürütmüştür.',
  'Ziya Gökalp ''Türkçülüğün Esasları''nı yazmıştır; ''Üç Tarz-ı Siyaset'' makalesini yazan ise Yusuf Akçura''dır.',
  43
);

-- Soru #044 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Kırım Bahçesaray''da ''Dilde, fikirde, işte birlik'' prensibiyle 1883''te çıkarmaya başladığı ''Tercüman'' gazetesi ile tüm Türk dünyasının ortak bir İstanbul Türkçesinde anlaşmasını savunan büyük maarifçi kimdir?',
  '{"options": ["İsmail Gaspıralı", "Yusuf Akçura", "Zeki Velidi Togan", "Ali Merdan Topçubaşov", "Musa Carullah"], "correctIndex": 0}'::jsonb,
  'İsmail Gaspıralı (1851-1914), Tercüman gazetesi ve Usul-i Cedid (Yeni Metot) okulları ile tüm Türk dünyasında eğitim seferberliği başlatmıştır.',
  '''Dilde, fikirde, işte birlik'' sözü ve Tercüman gazetesi doğrudan İsmail Gaspıralı ile özdeştir.',
  44
);

-- Soru #045 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1929 Dünya Ekonomik Bunalımı''ndan (Kara Perşembe) sonra Almanya''da iktidara gelen Adolf Hitler''in, Alman ırkının yaşayabilmesi için Doğu Avrupa ve Rusya topraklarının zorla ele geçirilmesini öngören jeopolitik doktrinine ne ad verilir?',
  '{"options": ["Lebensraum (Hayat Sahası)", "Mare Nostrum (Bizim Deniz)", "Blitzkrieg (Yıldırım Savaşı)", "Anschluss", "Drang nach Osten"], "correctIndex": 0}'::jsonb,
  'Lebensraum (Hayat Sahası), Hitler''in Kavgam kitabında formüle ettiği ve II. Dünya Savaşı''nda SSCB ve Polonya''ya saldırmasının ideolojik gerekçesini oluşturan yayılmacı doktrindir.',
  'Mare Nostrum Mussolini İtalyası''nın Akdeniz politikasıdır; Lebensraum ise Hitler Almanyası''nın Hayat Sahası doktrinidir.',
  45
);

-- Soru #046 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1936-1939 İspanya İç Savaşı''nda Cumhuriyetçileri yenilgiye uğratarak İspanya''da 1975 yılına kadar sürecek diktatörlük rejimini kuran faşist general kimdir?',
  '{"options": ["Francisco Franco", "Benito Mussolini", "Antonio de Salazar", "Philippe Petain", "Paul von Hindenburg"], "correctIndex": 0}'::jsonb,
  'General Francisco Franco, Nazi Almanyası ve Faşist İtalya''nın desteğiyle İspanya İç Savaşı''nı kazanmış ve ülkeyi 1975''teki ölümüne kadar diktatörlükle yönetmiştir.',
  'Salazar Portekiz diktatörüdür; İspanya''da iç savaşı kazanan diktatör General Franco''dur.',
  46
);

-- Soru #047 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'İki savaş arası dönemde Fransa''nın Almanya''dan gelebilecek olası bir işgali engellemek amacıyla doğu sınırına inşa ettiği, yer altı tünelleri, zırhlı sığınaklar ve ağır toplarla tahkim edilmiş aşılmaz kabul edilen devasa savunma hattına ne ad verilir?',
  '{"options": ["Maginot Hattı", "Siegfried Hattı", "Manerheim Hattı", "Bar-Lev Hattı", "Hindenburg Hattı"], "correctIndex": 0}'::jsonb,
  'Maginot Hattı, Fransa''nın Alman sınırına kurduğu betonarme savunma hattıdır. Ancak Almanlar 1940''ta bu hattı doğrudan geçmek yerine Belçika ve Ardenler Ormanları üzerinden dolaşarak aşmışlardır.',
  'Siegfried Almanların savunma hattıdır; Fransa''nın ünlü aşılmaz hattı ise Maginot Hattı''dır.',
  47
);

-- Soru #048 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Japonya''da 1868 yılında feodal Şogunluk düzenine son vererek Batı tarzı modern sanayi, ordu, anayasa ve eğitim reformlarını başlatan İmparator Mutsuhito dönemine ne ad verilir?',
  '{"options": ["Meiji Restorasyonu", "Kültür Devrimi", "Samuray Çağı", "Edo Dönemi", "Boksör Reformu"], "correctIndex": 0}'::jsonb,
  'Meiji Restorasyonu (Aydınlanmış Yönetim), Japonya''yı feodal orta çağdan dünyanın önde gelen modern sanayi ve deniz gücüne dönüştüren tarihi devrimdir.',
  'Kültür Devrimi Çin''de Mao tarafından yapılmıştır; Japon modernleşmesi ise Meiji Restorasyonu''dur.',
  48
);

-- Soru #049 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1929 Dünya Ekonomik Bunalımı''nın ortaya çıkışında;
I. ABD borsasında aşırı spekülatif hisse senedi alımları ve ''Kara Perşembe'' günü borsa çöküşü
II. Bankaların karşılıksız ve kontrolsüz krediler dağıtması
III. Holdingleşen dev tröstlerin tekelleşerek piyasa dengesini bozması

nedenlerinden hangileri doğrudan etkili olmuştur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  '1929 Bunalımı; finansal balon, bankaların likidite krizi ve tekelleşmenin yol açtığı yapısal bir çöküştür. Üç faktör de krizin ana nedenleridir.',
  'Kriz sadece bir borsa düşüşü değildir; Amerikan bankacılık sisteminin yapısal denetimsizliğinin bir sonucudur.',
  49
);

-- Soru #050 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1929 Büyük Buhranı sırasında Türkiye Cumhuriyeti''nde tasarrufu teşvik etmek, yerli malı kullanımını yaygınlaştırmak amacıyla TBMM Başkanı Kazım Özalp öncülüğünde kurulan milli cemiyet hangisidir?',
  '{"options": ["Milli İktisat ve Tasarruf Cemiyeti", "Milli Kongre Cemiyeti", "Anadolu Kulübü", "Türk Maarif Cemiyeti", "Hilal-i Ahmer Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Milli İktisat ve Tasarruf Cemiyeti 1929 buhranının hemen ardından kurulmuş ve Yerli Malı Haftası''nın ilan edilmesini sağlayarak yerli üretimi canlandırmıştır.',
  'Kurucusu TBMM Başkanı Kazım Özalp''tir. 1929 krizine karşı iç tüketimi koruyan cemiyettir.',
  50
);

-- Soru #051 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında 1941 yılında ABD Başkanı F. D. Roosevelt ile İngiltere Başbakanı Winston Churchill arasında bir savaş gemisinde imzalanan ve savaştan sonra toprak kazanılmayacağını, milletlerin kendi kaderini tayin edeceğini ilan eden ve ''Birleşmiş Milletler'' fikrinin temelini atan bildiri aşağıdakilerden hangisidir?',
  '{"options": ["Atlantik Bildirisi", "Balfour Deklarasyonu", "Kazablanka Bildirisi", "Helsinki Nihai Senedi", "Monroe Doktrini"], "correctIndex": 0}'::jsonb,
  'Ağustos 1941 Atlantik Bildirisi, I. Dünya Savaşı''ndaki Wilson İlkeleri''ne benzer şekilde II. Dünya Savaşı sonrasının barış vizyonunu belirlemiştir.',
  'Atlantik Bildirisi II. Dünya Savaşı''nın Wilson İlkeleri gibidir; BM teşkilatının da ilk tohumudur.',
  51
);

-- Soru #052 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı''nda Pasifik Cephesi''nde Japonya''nın 7 Aralık 1941''de ABD üssü Pearl Harbor''ı bombalamasından sonra, Haziran 1942''de ABD donanmasının Japon uçak gemilerini batırarak Pasifik''te üstünlüğü ele geçirdiği dönüm noktası deniz muharebesi hangisidir?',
  '{"options": ["Midway Deniz Muharebesi", "Mercan Denizi Muharebesi", "Guadalcanal Savaşı", "Leyte Körfezi Muharebesi", "Okinawa Çıkarması"], "correctIndex": 0}'::jsonb,
  'Midway Deniz Muharebesi, ABD şifre çözücülerinin Japon planını önceden çözmesiyle kazanılmış ve Japon donanmasının Pasifik''teki ilerleyişini kesin olarak durdurmuştur.',
  'Pearl Harbor saldırıdır; savaşın kaderini ABD lehine çeviren Pasifik dönüm noktası ise Midway Deniz Muharebesi''dir.',
  52
);

-- Soru #053 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında toplanan konferanslar ve içerikleriyle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Kazablanka Konferansı (1943) - Mihver devletlerin ''Kayıtsız Şartsız Teslim Alınması'' kararının alınması", "Yalta Konferansı (1945) - Almanya''nın 4 işgal bölgesine ayrılması ve BM kuruculuğu için Mihver''e savaş ilanı şartı", "San Francisco Konferansı (1945) - Birleşmiş Milletler Cemiyeti''nin resmen kurulması", "Potsdam Konferansı (1945) - Almanya''nın silahsızlandırılması ve savaş suçluları için Nürnberg Mahkemeleri kararı", "Kahire Konferansı (1943) - Türkiye''nin derhal savaşa girerek Balkanlar''a 500 bin asker göndermeyi taahhüt etmesi"], "correctIndex": 4}'::jsonb,
  'Kahire Konferansı''nda Cumhurbaşkanı İsmet İnönü savaşa hemen girmeyi taahhüt etmemiş; Türk ordusuna modern teçhizat ve silah verilmesi şartını koşarak Türkiye''yi fiilen savaşın dışında tutmayı başarmıştır.',
  'İnönü Kahire ve Adana görüşmelerinde Müttefiklerin tüm baskılarına ustaca direnmiş ve savaşa fiilen katılmamıştır.',
  53
);

-- Soru #054 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı devam ederken Türkiye''de Cumhurbaşkanı İsmet İnönü ile İngiltere Başbakanı Winston Churchill arasında bir tren vagonunda gerçekleşen ve Churchill''in Türkiye''yi savaşa sokma baskısı yaptığı 1943 tarihli görüşme hangisidir?',
  '{"options": ["Adana Görüşmesi (Yenice Mülakatı)", "I. Kahire Konferansı", "Tahran Konferansı", "Moskova Mülakatı", "Bükreş Zirvesi"], "correctIndex": 0}'::jsonb,
  '30-31 Ocak 1943 Adana Yenice İstasyonu''nda vagon içinde gerçekleşen mülakatta Churchill Türkiye''yi savaşa davet etmiş, İnönü ise askeri eksiklikleri öne sürerek bu talebi savuşturmuştur.',
  'Adana Görüşmesi Türkiye topraklarında yapılmıştır; Kahire ise Mısır''da Roosevelt''in de katıldığı görüşmedir.',
  54
);

-- Soru #055 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı yıllarında olası bir Alman işgaline karşı Trakya sınırında Çatalca hattı boyunca inşa edilen beton siperler ve sığınaklardan oluşan savunma hattına dönemin Genelkurmay Başkanı''nın adıyla ne denilmiştir?',
  '{"options": ["Çakmak Hattı", "İnönü Hattı", "Fevzi Paşa Savunması", "Trakya Tahkimatı", "Marmara Kordonu"], "correctIndex": 0}'::jsonb,
  'Mareşal Fevzi Çakmak''ın emriyle İstanbul''u korumak için kurulan savunma hattına ''Çakmak Hattı'' adı verilmiştir.',
  'Çakmak Hattı Mareşal Fevzi Çakmak''ın adını taşır ve Trakya sınırını Alman tanklarına karşı korumak için kurulmuştur.',
  55
);

-- Soru #056 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında Türkiye''nin iç politikasında ve ekonomisinde yaşanan olağanüstü gelişmeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Geceleri şehirlerde uygulanan ''Karartma'' geceleri", "Temel gıda maddeleri için ''Ekmek Karnesi'' uygulamasının başlatılması", "Milli Korunma Kanunu çıkarılarak fiyatlara narh konulması", "Varlık Vergisi ve Toprak Mahsulleri Vergisi''nin ihdas edilmesi", "Tüm üniversitelerin ve fabrikaların 5 yıl boyunca kapatılması"], "correctIndex": 4}'::jsonb,
  'Üniversiteler veya fabrikalar kapatılmamış, aksine sanayi üretimi ve eğitim olağanüstü şartlarda sürdürülmüştür. Hatta 1940 yılında Köy Enstitüleri açılmıştır.',
  'Karartma, ekmek karnesi, Varlık Vergisi ve Köy Enstitüleri II. Dünya Savaşı yıllarının temel olaylarıdır.',
  56
);

-- Soru #057 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Türkiye Cumhuriyeti, San Francisco Konferansı''na kurucu üye sıfatıyla katılabilmek ve Yalta Konferansı kararları gereğince 23 Şubat 1945 tarihinde hangi iki devlete sembolik olarak savaş ilan etmiştir?',
  '{"options": ["Almanya - Japonya", "Almanya - İtalya", "İtalya - Japonya", "Almanya - Rusya", "Japonya - Avusturya"], "correctIndex": 0}'::jsonb,
  'Yalta Konferansı kararına göre 1 Mart 1945''e kadar Mihver devletlere savaş açanlar BM kurucusu olabilecekti. Türkiye 23 Şubat 1945''te sembolik olarak Almanya ve Japonya''ya savaş ilan etmiş ve San Francisco''ya kurucu üye olarak katılmıştır.',
  'İtalya 1943''te teslim olduğu için savaş ilanı sadece Almanya ve Japonya''ya yapılmıştır.',
  57
);

-- Soru #058 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '6 ve 9 Ağustos 1945 tarihlerinde ABD Başkanı Harry Truman''ın emriyle Hiroşima ve Nagazaki şehirlerine atılan atom bombalarının kod isimleri sırasıyla aşağıdakilerden hangisidir?',
  '{"options": ["Little Boy (Küçük Çocuk) - Fat Man (Şişman Adam)", "Fat Man - Little Boy", "Enola Gay - Bockscar", "Trinity - Manhattan", "Overlord - Barbarossa"], "correctIndex": 0}'::jsonb,
  'Hiroşima''ya atılan uranyum bombası ''Little Boy''; Nagazaki''ye atılan plütonyum bombası ise ''Fat Man''dir. Bombayı taşıyan uçağın adı ise ''Enola Gay''dir.',
  'Little Boy Hiroşima''ya, Fat Man Nagazaki''ye atılmıştır. Enola Gay uçağın adıdır.',
  58
);

-- Soru #059 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sonrasında Nazi savaş suçlularını yargılamak amacıyla uluslararası askeri mahkeme hangi Alman şehrinde kurulmuştur?',
  '{"options": ["Nürnberg", "Berlin", "Münih", "Frankfurt", "Köln"], "correctIndex": 0}'::jsonb,
  'Nürnberg Mahkemeleri, Nazi liderlerinin ''insanlığa karşı suçlar'' ve ''soykırım'' sebebiyle yargılandığı ilk uluslararası ceza mahkemesidir. Japon savaş suçluları ise Tokyo Mahkemesi''nde yargılanmıştır.',
  'Nürnberg Mahkemeleri modern uluslararası ceza hukukunun doğum yeridir.',
  59
);

-- Soru #060 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sonrasında 1947 yılında imzalanan Paris Barış Antlaşması ile İtalya, elinde bulundurduğu On İki Ada''yı hangi devlete devretmek zorunda kalmıştır?',
  '{"options": ["Yunanistan", "Türkiye", "İngiltere", "Fransa", "Yugoslavya"], "correctIndex": 0}'::jsonb,
  '1947 Paris Barış Antlaşması ile İtalya On İki Ada''yı silahsızlandırılması şartıyla Yunanistan''a bırakmıştır.',
  'On İki Ada Trablusgarp Savaşı''nda İtalya''ya geçici verilmişti; 1947''de ise Türkiye''nin itirazlarına rağmen Yunanistan''a verilmiştir.',
  60
);

-- Soru #061 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sonrasında SSCB lideri Stalin''in Türkiye''den Kars ve Ardahan''ı talep etmesi ve Boğazlarda askeri üs istemesi üzerine Türkiye dış politikasında köklü bir değişim yaşamıştır.

Türkiye''nin Batı Bloku''na yanaşması sürecinde 1947''de ABD Başkanı tarafından ilan edilen ve komünizm tehdidi altındaki Türkiye ile Yunanistan''a 400 milyon dolar askeri ve mali yardım yapılmasını öngören doktrin hangisidir?',
  '{"options": ["Truman Doktrini", "Monroe Doktrini", "Marshall Planı", "Eisenhower Doktrini", "Kennedy Doktrini"], "correctIndex": 0}'::jsonb,
  '12 Mart 1947 Truman Doktrini, ABD''nin Sovyet yayılmacılığını çevrelemek (Çevreleme Politikası) amacıyla Türkiye ve Yunanistan''a doğrudan askeri kalkan sağladığı ilk doktrindir.',
  'Marshall Planı tüm Avrupa''ya ekonomik yardımdır; doğrudan askeri yardım sağlayan ilk belge Truman Doktrini''dir.',
  61
);

-- Soru #062 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Doğu Bloku ülkeleri arasında ideolojik birliği sağlamak ve Moskova''nın denetimini kurmak amacıyla kurulan teşkilat ile komünist ülkeler arası ekonomik iş birliği teşkilatı hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Kominform - Komekon", "Varşova Paktı - Kominform", "Komekon - Kominform", "Kominform - Varşova Paktı", "KGB - Komekon"], "correctIndex": 0}'::jsonb,
  'Kominform = İdeolojik birlik (Komünist partiler arası enformasyon bürosu); Komekon = Ekonomik yardımlaşma (Marshall Planı''na karşı); Varşova Paktı = Askeri savunma (NATO''ya karşı).',
  'Kominform ideolojik, Komekon ekonomik, Varşova Paktı ise askeri örgüttür.',
  62
);

-- Soru #063 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1949 yılında Kuzey Atlantik Paktı (NATO) kurulurken kurucu üyeler arasında yer almayan, ancak 1950 Kore Savaşı''nda gösterdiği askeri kahramanlık üzerine 1952 yılında NATO''ya aynı anda üye kabul edilen iki devlet hangisidir?',
  '{"options": ["Türkiye - Yunanistan", "Almanya - İtalya", "Türkiye - İspanya", "Yunanistan - Portekiz", "İspanya - İtalya"], "correctIndex": 0}'::jsonb,
  'Türkiye ve Yunanistan 18 Şubat 1952 tarihinde TBMM onayıyla eş zamanlı olarak NATO''ya 13. ve 14. üyeler olarak katılmıştır.',
  'Türkiye tek başına değil, Yunanistan ile birlikte 1952 yılında NATO''ya girmiştir.',
  63
);

-- Soru #064 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Kore Savaşı''nda (1950-1953) Tuğgeneral Tahsin Yazıcı komutasındaki Türk Tugayı''nın Amerikan 8. Ordusu''nu tamamen imha edilmekten kurtardığı ve savaşın seyrini değiştirdiği efsanevi muharebe hangisidir?',
  '{"options": ["Kunuri Muharebeleri", "Seul Kuşatması", "Pusan Savunması", "İnçon Çıkarması", "Yalu Zaferi"], "correctIndex": 0}'::jsonb,
  'Kunuri Muharebeleri''nde Türk askeri Çin kuvvetlerinin kuşatmasını yararak Müttefik ordusunu kurtarmış ve ABD Kongresi tarafından Mümtaz Birlik Madalyası ile ödüllendirilmiştir.',
  'Kunuri Muharebesi Türk Tugayı''nın Kore''deki en meşhur destanıdır.',
  64
);

-- Soru #065 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1955 yılında Sovyet tehdidine karşı Orta Doğu''da güvenliği sağlamak amacıyla Türkiye, Irak, İran, Pakistan ve İngiltere arasında kurulan, ancak 1958''de Irak''ta yaşanan kanlı darbe sonrası merkezini Ankara''ya taşıyarak CENTO adını alan güvenlik paktı hangisidir?',
  '{"options": ["Bağdat Paktı", "Sadabad Paktı", "Balkan Paktı", "Arap Birliği", "SEATO"], "correctIndex": 0}'::jsonb,
  'Bağdat Paktı 1955''te Türkiye ve Irak öncülüğünde kurulmuş; Irak ayrılınca adı CENTO (Merkezi Antlaşma Örgütü) olmuş ve merkezi Ankara''ya taşınmıştır.',
  'Sadabad Paktı Atatürk dönemindedir (1937); Bağdat Paktı ise Menderes/Demokrat Parti dönemindedir (1955).',
  65
);

-- Soru #066 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1945 yılında CHP içinde Toprak Reformu Kanunu tartışılırken Celal Bayar, Adnan Menderes, Fuat Köprülü ve Refik Koraltan tarafından parti yönetimine sunulan ve Demokrat Parti''nin kurulmasını tetikleyen tarihi muhalefet önergesi nedir?',
  '{"options": ["Dörtlü Takrir", "Dokuz Umde", "Misak-ı Maarif", "Hürriyet Bildirgesi", "Takrir-i Sükun"], "correctIndex": 0}'::jsonb,
  'Dörtlü Takrir, CHP içinde demokratikleşme talep eden 4 milletvekilinin (C-A-F-E-R) verdiği önergedir. Önerge reddedilince ihraçlar yaşanmış ve 7 Ocak 1946''da Demokrat Parti kurulmuştur.',
  'Dörtlü Takrir DP''nin doğum belgesidir; Takrir-i Sükun ile karıştırılmamalıdır.',
  66
);

-- Soru #067 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '14 Mayıs 1950 seçimlerinde Demokrat Parti''nin %53 oyla 408 milletvekili kazanarak 27 yıllık tek parti iktidarına sandık yoluyla kansız son vermesi Türk siyasi tarihinde ne adla anılır?',
  '{"options": ["Beyaz İhtilal", "Kadife Devrim", "Hürriyet Devrimi", "Milli Birlik Günü", "Gül Devrimi"], "correctIndex": 0}'::jsonb,
  '1950 iktidar değişimi kansız ve demokratik bir sandık devrimi olduğu için ''Beyaz İhtilal'' olarak nitelendirilmiştir. Celal Bayar Cumhurbaşkanı, Adnan Menderes Başbakan olmuştur.',
  'Kadife Devrim Çekoslovakya''dadır; Türkiye''deki 1950 seçimi ise Beyaz İhtilal''dir.',
  67
);

-- Soru #068 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Demokrat Parti iktidarının 16 Haziran 1950 tarihinde TBMM''den geçirdiği ilk yasa aşağıdakilerden hangisidir?',
  '{"options": ["Ezanın Arapça aslıyla okunması yasağının kaldırılması", "Kore''ye asker gönderilmesi", "Halkevlerinin kapatılması", "Köy Enstitüleri''nin birleştirilmesi", "ODTÜ''nün kurulması"], "correctIndex": 0}'::jsonb,
  'DP''nin ilk icraatı, 1932''den beri Türkçe okunan ezanın Arapça aslıyla okunmasını serbest bırakan kanunu CHP''nin de desteğiyle meclisten geçirmek olmuştur.',
  'DP''nin 1 numaralı ilk icraatı ezanın serbest bırakılmasıdır.',
  68
);

-- Soru #069 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1955 yılında Selanik''te Atatürk''ün doğduğu evin bombalandığı yönündeki asılsız haberler üzerine İstanbul''da gayrimüslim vatandaşların ev ve iş yerlerinin yağmalanmasına yol açan ve sıkıyönetim ilan edilmesine sebep olan üzücü olaylar hangisidir?',
  '{"options": ["6-7 Eylül Olayları", "Razgrad Hadisesi", "Vagon-Li Olayı", "Menemen Olayı", "Kanlı Pazar"], "correctIndex": 0}'::jsonb,
  '6-7 Eylül 1955 Olayları, Kıbrıs meselesinin tırmandığı dönemde provokasyonlar sonucu İstanbul''da Rum ve gayrimüslim vatandaşların mallarına yönelik kitlesel şiddet eylemleridir.',
  '6-7 Eylül Olayları DP döneminde yaşanmış en büyük iç krizlerden biridir.',
  69
);

-- Soru #070 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Soğuk Savaş yıllarında Doğu Bloku içinde yer almasına rağmen SSCB ve Stalin''in katı hegemonyasını reddederek Kominform''dan çıkarılan ve Bağlantısızlar Hareketi''ne öncülük eden komünist ülke ve lideri hangisidir?',
  '{"options": ["Yugoslavya - Josip Broz Tito", "Romanya - Nikolay Çavuşesku", "Macaristan - İmre Nagy", "Arnavutluk - Enver Hoca", "Polonya - Gomulka"], "correctIndex": 0}'::jsonb,
  'Yugoslavya lideri Mareşal Tito, Sovyet uydusu olmayı reddetmiş ve 1948''de Kominform''dan ihraç edilmiştir. Tito daha sonra Üçüncü Dünya / Bağlantısızlar Hareketi''nin liderliğini üstlenmiştir.',
  'Doğu Bloku''ndan ilk kopan ve bağlantısız kalan ülke Yugoslavya''dır.',
  70
);

-- Soru #071 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1962 yılında ABD ile SSCB''yi nükleer bir 3. Dünya Savaşı''nın eşiğine getiren Küba Füze Krizi sırasında, ABD''nin Sovyetlerin Küba''daki nükleer füzeleri sökmesi karşılığında Türkiye''den gizlice sökmeyi taahhüt ettiği nükleer başlıklı füzeler hangileridir?',
  '{"options": ["Jüpiter Füzeleri", "Patriot Füzeleri", "Hawk Füzeleri", "Tomahawk Füzeleri", "Pershing Füzeleri"], "correctIndex": 0}'::jsonb,
  'ABD ile SSCB arasındaki gizli pazarlık sonucu İzmir Çiğli''de bulunan Amerikan ''Jüpiter Füzeleri'' sökülmüş; Türkiye müttefiki ABD''nin kendi güvenliğini pazarlık konusu yaptığını öğrenerek büyük hayal kırıklığı yaşamıştır.',
  'Küba Füze Krizi''nde Türkiye''den sökülen füzenin adı Jüpiter''dir. Çok popüler bir KPSS sorusudur.',
  71
);

-- Soru #072 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1964 yılında Türkiye''nin Kıbrıs''taki Rum katliamlarını önlemek amacıyla adaya müdahale kararı alması üzerine, ABD Başkanı Lyndon Johnson''ın Başbakan İsmet İnönü''ye gönderdiği ve ''Türkiye ABD silahlarını Kıbrıs''ta kullanamaz, Sovyetler saldırırsa NATO Türkiye''yi korumaz'' tehdidini içeren tarihi mektuba ne ad verilir?',
  '{"options": ["Johnson Mektubu", "Truman Mektubu", "Eisenhower Muhtırası", "Kissinger Raporu", "Acheson Planı"], "correctIndex": 0}'::jsonb,
  'Haziran 1964 Johnson Mektubu, Türk-Amerikan ilişkilerinde kırılma noktası olmuş; İnönü mektuba ''Yeni bir dünya kurulur ve Türkiye de orada yerini alır'' tarihi cevabını vermiştir.',
  'Johnson Mektubu Kıbrıs krizi sebebiyle İnönü''ye gönderilen diplomatik şantaj mektubudur.',
  72
);

-- Soru #073 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1964 yılında Kıbrıs''ta Erenköy direnişinde Türk köylerini bombalayan Rum hücumbotlarına hava harekatı düzenlerken uçağı isabet alan, paraşütle atladıktan sonra Rumlar tarafından işkenceyle şehit edilen ilk Türk Hava Harp şehidi yüzbaşımız kimdir?',
  '{"options": ["Cengiz Topel", "Fethi Bey", "Sadık Bey", "Nuri Demirağ", "Vecihi Hürkuş"], "correctIndex": 0}'::jsonb,
  'Yüzbaşı Cengiz Topel, Kıbrıs semalarında şehit düşen ilk Türk pilotudur. Adı Türkiye''nin dört bir yanındaki okul ve kışlalara verilmiştir.',
  'Kıbrıs davasının hava şehidi Cengiz Topel''dir.',
  73
);

-- Soru #074 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '20 Temmuz 1974 tarihinde Başbakan Bülent Ecevit ve Başbakan Yardımcısı Necmettin Erbakan hükümeti tarafından Türk Silahlı Kuvvetleri''nin garantörlük hakkını kullanarak gerçekleştirdiği Kıbrıs Barış Harekâtı''nın ikinci aşamasını başlatan tarihi parola nedir?',
  '{"options": ["Ayşe Tatile Çıksın", "Akdeniz İleri", "Şafak Vakti", "Toroslar Hazır", "Zafer Türkündür"], "correctIndex": 0}'::jsonb,
  'Cenevre görüşmelerinin tıkanması üzerine Dışişleri Bakanı Turan Güneş''in kızı Ayşe Güneş''e atıfla Ankara''ya çektiği şifre ''Ayşe Tatile Çıksın''dır.',
  'Kıbrıs Barış Harekâtı''nın simge parolası ''Ayşe Tatile Çıksın''dır.',
  74
);

-- Soru #075 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '15 Kasım 1983 tarihinde bağımsızlığını ilan eden Kuzey Kıbrıs Türk Cumhuriyeti''nin (KKTC) ilk Cumhurbaşkanı ve Kıbrıs Türk halkının unutulmaz milli lideri kimdir?',
  '{"options": ["Rauf Denktaş", "Dr. Fazıl Küçük", "Mehmet Ali Talat", "Derviş Eroğlu", "Ersin Tatar"], "correctIndex": 0}'::jsonb,
  'Rauf Denktaş, Türk Mukavemet Teşkilatı''nın (TMT) ''Toros'' kod adlı lideri ve 1983''te kurulan KKTC''nin kurucu ilk Cumhurbaşkanıdır.',
  'Dr. Fazıl Küçük ilk toplum lideridir; 1983 KKTC''nin ilk cumhurbaşkanı ise Rauf Denktaş''tır.',
  75
);

-- Soru #076 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1970''li ve 1980''li yıllarda dünyanın dört bir yanında Türk diplomatlarına, büyükelçilerine ve ailelerine suikastlar düzenleyen Ermeni terör örgütü aşağıdakilerden hangisidir?',
  '{"options": ["ASALA", "Hınçak", "Taşnak", "EOKA", "Kızıl Tugaylar"], "correctIndex": 0}'::jsonb,
  'ASALA (Ermenistan''ın Kurtuluşu İçin Gizli Ermeni Ordusu), 40''a yakın Türk diplomatını şehit eden terör örgütüdür.',
  'EOKA Kıbrıs''taki Rum örgütüdür; Türk diplomatlarını hedef alan Ermeni terör örgütü ASALA''dır.',
  76
);

-- Soru #077 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'SSCB''nin çöküşünü hazırlayan ve Mihail Gorbaçov tarafından uygulamaya konulan; ''Açıklık / Şeffaflık'' ve ''Yeniden Yapılanma'' anlamına gelen reform kavramları hangisinde doğru verilmiştir?',
  '{"options": ["Glasnost - Perestroyka", "Perestroyka - Glasnost", "Sputnik - Vostok", "Duma - Sovhoz", "Bolşevik - Menşevik"], "correctIndex": 0}'::jsonb,
  'Glasnost = Açıklık / İfade özgürlüğü; Perestroyka = Ekonomik ve kurumsal yeniden yapılanmadır.',
  'Glasnost ve Perestroyka''nın anlamlarının yer değiştirmesine dikkat edilmelidir.',
  77
);

-- Soru #078 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1992-1995 Bosna Savaşı sırasında Srebrenitsa''da BM koruması altındaki 8 binden fazla Müslüman Boşnağın Sırplar tarafından katledildiği soykırım karşısında halkının bağımsızlığını savunan, ''Bilge Kral'' unvanıyla anılan ve Bosna Savaşı''nı bitiren Dayton Antlaşması''nı imzalayan lider kimdir?',
  '{"options": ["Aliya İzzetbegoviç", "Slobodan Milosevic", "Radovan Karadzic", "Franjo Tudjman", "Zoran Cindic"], "correctIndex": 0}'::jsonb,
  'Aliya İzzetbegoviç (1925-2003), ''Doğu ve Batı Arasında İslam'' eserinin yazarı, büyük Boşnak düşünür ve Bosna-Hersek''in ilk cumhurbaşkanıdır.',
  'Bilge Kral lakabı Aliya İzzetbegoviç''e aittir. KPSS''de çok sık sorulur.',
  78
);

-- Soru #079 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Ekim 1991''de Sovyetler Birliği''nden bağımsızlığını ilan eden Azerbaycan Cumhuriyeti''nin ikinci cumhurbaşkanı olan, ''Biz bir millet, iki devletiz'' anlayışını benimseyen ve Türk milliyetçiliğinin büyük lideri olan şahsiyet kimdir?',
  '{"options": ["Ebulfez Elçibey", "Haydar Aliyev", "İlham Aliyev", "Ayaz Muttalibov", "Mehmet Emin Resulzade"], "correctIndex": 0}'::jsonb,
  'Ebulfez Elçibey, Azerbaycan Halk Cephesi lideri ve bağımsız Azerbaycan''ın seçilmiş cumhurbaşkanıdır. Rus ordusunu Azerbaycan''dan çıkaran liderdir.',
  'Mehmet Emin Resulzade 1918 ilk cumhuriyetin lideridir; 1992 bağımsız Azerbaycan''ın milli lideri ise Ebulfez Elçibey''dir.',
  79
);

-- Soru #080 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Türkiye''nin öncülüğünde Türk Cumhuriyetleri arasındaki kardeşlik bağlarını, kalkınma projelerini ve kültürel iş birliğini yürütmek amacıyla 1992 yılında kurulan kalkınma ajansı aşağıdakilerden hangisidir?',
  '{"options": ["TİKA (Türk İşbirliği ve Koordinasyon Ajansı)", "TÜRKSOY", "Türk Konseyi", "Yurtdışı Türkler Başkanlığı", "Yunus Emre Enstitüsü"], "correctIndex": 0}'::jsonb,
  'TİKA (1992), Türk cumhuriyetleri ve akraba topluluklarda okul, hastane, restorasyon ve kalkınma projeleri yürüten devlet ajansımızdır.',
  'TÜRKSOY 1993''te kültür alanında kurulmuştur; teknik yardım ve kalkınma ajansı TİKA''dır.',
  80
);

COMMIT;
