-- ==========================================================================

-- KADRO SORU HAVUZU SUPABASE SQL MIGRATION (40 Soru)

-- ==========================================================================


insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Arkeolojik kazılar sonucunda Orta Asya’da MÖ 5000’lere kadar uzanan çeşitli kültür katmanları açığa çıkarılmıştır. Bu kültür merkezleri içerisinde tarım ve dokumacılığın izlerine rastlanan, Orta Asya’nın en eski kültürü kabul edilen merkez ile kalıntıları Türk ırkının prototipi sayılarak "Türklerin en eski kültür merkezi" kabul edilen yerleşim yeri aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Anav — Afanesyova", "Afanesyova — Andronova", "Anav — Tagar", "Karasuk — Kelteminar", "Andronova — Anav"], "correctIndex": 0}'::jsonb,
  'Aşkabat yakınlarında bulunan **Anav kültürü**, Orta Asya''nın bilinen en eski yerleşim ve kültür merkezidir (MÖ 5000). Ancak bu kültürün doğrudan Türklere ait olduğu kesinleşmiş değildir. Orta Asya''da kalıntıları brakisefal Türk tipine dayanan ve "Türklerin en eski kültür merkezi" kabul edilen yerleşim yeri ise Altay-Sayan Dağları çevresindeki **Afanesyova kültürüdür**.',
  'ÖSYM sınavda adayların "Orta Asya''nın en eski kültürü" ifadesini görünce doğrudan Afanesyova''yı, "Türklerin en eski kültürü" denince de en eski kültür olan Anav''ı işaretleme refleksini ölçer. Anav genel Orta Asya''nın en eskisidir; Afanesyova ise doğrudan Türklere ait kabul edilen en eski kültür merkezidir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Yenisey Irmağı havzasında gelişen, demir madeninin ilk kez işlendiği Karasuk kültürünün devamı niteliğindeki bu merkez; gelişmiş tunç ve demir silahları, hançer kabzalarındaki hayvan kabartmaları ve zengin kurgan buluntuları ile İslamiyet öncesi Orta Asya kültürlerinin **en gelişmiş ve en son evresi** kabul edilmektedir.

Hakkında bilgi verilen bu kültür merkezi aşağıdakilerden hangisidir?',
  '{"options": ["Anav", "Kelteminar", "Andronova", "Tagar", "Afanesyova"], "correctIndex": 3}'::jsonb,
  'Krasnoyarsk ve Abakan bölgesinde ortaya çıkarılan **Tagar kültürü**, Orta Asya bozkır kültürlerinin en gelişmiş ve kronolojik olarak en genç (son) aşamasıdır. Hayvan üslubuna ait en yetkin madeni sanat eserleri bu kültür katmanında bulunmuştur.',
  'ÖSYM "Türklerin atası kabul edilen kültür" ile "en gelişmiş kültür" kavramlarını sıklıkla çeldirici olarak karşılaştırır. Andronova (C şıkkı), yayılma alanı en geniş olan ve Türklerin atalarının yaşadığı düşünülen kültürdür; fakat madencilik ve sanat bakımından zirveyi temsil eden en gelişmiş merkez Tagar''dır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karadeniz’in kuzeyinden Hazar Denizi ve Orta Asya bozkırlarına kadar uzanan geniş sahada varlık gösteren İskitler (Sakalar), atlı göçebe bozkır kültürünün öncü topluluklarından biridir.

Aşağıdakilerden hangisi İskitlerin Türk ve dünya uygarlığına sağladığı katkılardan veya özelliklerinden biri **değildir**?',
  '{"options": ["Savaş aracı olarak atı evcilleştirip süvarilikte üzengiyi ilk kez kullanmaları", "Ölen savaşçıların mezarları başına öldürdüğü düşman sayısı kadar balbal dikme geleneğini başlatmaları", "Maden işletmeciliğinde ulaştıkları ileri seviye nedeniyle \"Bozkırın Kuyumcuları\" olarak anılmaları", "Orta Asya''da siyasi birliği sağlayarak ilk düzenli ordu teşkilatını (onlu sistem) kurmaları", "Sanat eserlerinde koç, geyik ve kurt gibi figürlerle \"hayvan üslubunu\" yaygınlaştırmaları"], "correctIndex": 3}'::jsonb,
  'İskitler siyasi olarak bir imparatorluk veya merkezi devlet yapısına ulaşamamış, federatif bir boy birliği şeklinde yaşamışlardır. Orta Asya''da Türk boylarını ilk kez tek bayrak altında toplayan ve dünya askeri tarihine geçen onlu teşkilatı (ilk düzenli ordu) kuran devlet **Asya Hun Devleti**, kurucusu ise **Mete Han**''dır.',
  'Adaylar üzengi ve balbal gibi ilkleri İskitlerle eşleştirmeyi unutarak bunların Göktürk veya Hunlara ait olduğunu düşünebilir. Diğer yandan İskitler bir "devlet" değil, "ilk Türk boy birliği"dir. Bu ayrım KPSS''de en çok puan kaybettiren nüanstır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Asya Hun Hükümdarı Mete Han, MÖ 201''de Baideng Kuşatması''nda 320 bin kişilik Çin ordusunu taktiksel sahte ricat ve hilal manevrasıyla kuşatıp teslim almasına ve Çin İmparatorluğu''nu dize getirmesine rağmen, Çin topraklarını doğrudan ele geçirmemiş; bölgeyi yalnızca yıllık vergiye bağlamakla yetinmiştir.

Mete Han’ın bu askerî ve siyasi stratejisinin **temel amacı** aşağıdakilerden hangisidir?',
  '{"options": ["İpek Yolu ticaretinin denetimini tamamen Çinli tüccarlara bırakmak", "Kalabalık Çin nüfusu karşısında Türk milletinin asimile olmasını ve benliğini kaybetmesini önlemek", "Hun ordusundaki asker sayısının taarruz harekâtı için yetersiz kalması", "Çin Seddi’ni aşabilecek kuşatma silahlarının henüz geliştirilememiş olması", "Batı Asya ve Roma İmparatorluğu üzerine yapılacak yeni seferlere yoğunlaşmak"], "correctIndex": 1}'::jsonb,
  'Mete Han, kalabalık Çin nüfusu içerisine yerleşilmesi halinde Türklerin yerleşik kültüre uyum sağlayarak örf, adet ve savaşçı kimliklerini kaybedip eriyeceklerini (asimilasyona uğrayacaklarını) öngörmüştür. Bu nedenle Çin''i sadece dışarıdan baskı ve vergi altında tutmayı tercih etmiştir.',
  'Adaylar "askeri gücün yetersizliği" (C şıkkı) veya "Çin Seddi engeli" (D şıkkı) gibi lojistik şıklara yönelebilir. Oysa soru kökünde Mete Han''ın orduyu zaten yendiği açıkça belirtilmiştir; gerekçe askeri değil, demografik ve kültürel korunma (milli benlik) refleksidir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Asya Hun Devleti''nde MÖ 58 yılında hükümdar olan Ho-han-ye, yaşanan ekonomik kriz ve kuraklık nedeniyle Çin egemenliğine (himayesine) girmeyi teklif etmiştir. Ancak kardeşi ve Batı Hun hükümdarı **Çi-çi**, Kurultay huzurunda bu teklife şiddetle karşı çıkarak:

*"Cesarete ve kahramanlığa dayanan atalarımızın töresini terk edip düşmana boyun eğmek utanç vericidir. Sayımız azalsa bile istiklali korumak uğruna savaşarak ölmek şereftir!"* demiştir.

Tarihsel kayıtlara geçen bu tutum, Türk siyasi düşüncesinde aşağıdakilerden hangisinin **en eski ve somut kanıtı** olarak kabul edilir?',
  '{"options": ["Bağımsızlık ve egemenlik (istiklal) tutkusunun her türlü maddi menfaatin üzerinde tutulduğunun", "İkili yönetim teşkilatının her zaman başarıyla sonuçlandığının", "Yerleşik hayata geçiş çabalarının kurultay kararıyla engellendiğinin", "Türk hükümdarlarının yetkilerini sınırsız biçimde kullanabildiğinin", "Töre kurallarının kurultay kararı olmaksızın değiştirilemeyeceğinin"], "correctIndex": 0}'::jsonb,
  'Çi-çi Yabgu''nun, kardeşi Ho-han-ye''nin Çin vasallığı altına girme teklifini "gülünç ve utanç verici" bularak bağımsızlık için savaşmayı tercih etmesi, Türk devlet geleneğinde "bağımsızlık / hürriyet" ülküsünün devletin bekasında temel ilke olduğunu kanıtlayan en çarpıcı tarihsel örnektir.',
  'ÖSYM burada ikili yönetim teşkilatını (B şıkkı) güçlü bir çeldirici olarak sunabilir; çünkü olay iki kardeş (Doğu-Batı idaresi) arasında geçmektedir. Ancak konuşmanın özü ve vurgulanan felsefe yönetim biçimi değil, tam bağımsızlık (istiklal) karakteridir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Asya Hun Devleti ile Han Hanedanlığı (Çin) arasında İpek Yolu''nun kontrolü ve sınır güvenliği için yapılan savaşların ardından MÖ 201 yılında imzalanan, Çin''in Hunlara yıllık ipek, tahıl ve şarap ödemesini hükme bağlayan ve **Türk tarihinin ilk yazılı antlaşması** kabul edilen belge aşağıdakilerden hangisidir?',
  '{"options": ["Kadeş Antlaşması", "Kuzey Şansi Antlaşması", "Margos Antlaşması", "Anatolyus Antlaşması", "Kasr-ı Şirin Antlaşması"], "correctIndex": 1}'::jsonb,
  'Türk tarihinin bilinen ilk yazılı antlaşması, Asya Hun Devleti ile Çin arasında imzalanan **Kuzey Şansi Antlaşması**dır (MÖ 201). Bu antlaşmayla Çin, Hun üstünlüğünü ve sınırlarını resmen tanımış, vergi ödemeyi kabul etmiştir.',
  'Adaylar dünya tarihindeki ilk yazılı antlaşma olan Kadeş (A) ile karıştırabilir ya da Avrupa Hun Devleti''nin Bizans''ı vergiye bağladığı meşhur Margos Antlaşması''na (C) gidebilir. Türk tarihinin *Orta Asya''daki ilk yazılı antlaşması* Kuzey Şansi''dir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  '375 yılında Balamir önderliğindeki Hunların Karadeniz’in kuzeyinden batıya ilerleyerek Ostrogot, Vizigot, Vandal ve Frank gibi kavimleri yerlerinden oynatmasıyla başlayan Kavimler Göçü, Avrupa kıtasında köklü dönüşümlere yol açmıştır.

Aşağıdakilerden hangisi Kavimler Göçü’nün Avrupa’da ortaya çıkardığı sonuçlar arasında **gösterilemez**?',
  '{"options": ["Roma İmparatorluğu''nun 395''te Batı ve Doğu olmak üzere ikiye ayrılması", "Avrupa''da merkezi krallıkların güçlenerek mutlak monarşilerin hâkim olması", "Şövalyelik ve toprak egemenliğine dayalı feodalite (derebeylik) rejiminin doğması", "Katolik Kilisesi ve papanın otoritesini artırarak skolastik düşüncenin yaygınlaşması", "İlk Çağ''ın kapanıp Orta Çağ''ın başlaması"], "correctIndex": 1}'::jsonb,
  'Kavimler Göçü sonrasında Avrupa''da merkezi krallıklar güçlenmemiş, tam tersine kralların halkı koruyamaması üzerine halk yerel güç odaklarına sığınmış ve merkezi krallıklar parçalanarak **feodalite (derebeylik)** rejimi doğmuştur. Merkezi krallıkların yeniden güçlenmesi ise yüzyıllar sonra, Orta Çağ sonunda barutun ateşli silahlarda kullanılmasıyla surların yıkılması sonucu olacaktır.',
  'ÖSYM sıklıkla "feodalite güçlendi" ifadesini "merkezi krallıklar güçlendi" şeklinde ters yüz ederek sorar. Krallıkların güçlenmesi Yeni Çağ başlarındadır; Kavimler Göçü doğrudan krallıkları zayıflatıp derebeyliği doğurmuştur.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Avrupa Hun Devleti''nde Balamir''den sonra tahta geçen; Doğu Roma''ya (Bizans) baskı kurarken Batı Roma ile dostane ilişkiler yürütme stratejisini belirleyen ve ordularına Kafkaslar üzerinden **Anadolu topraklarına (Erzurum, Malatya ve Çukurova)** ilk kez ayak bastıran hükümdar aşağıdakilerden hangisidir?',
  '{"options": ["Atilla", "Rua", "Uldız", "Dengizik", "İrnek"], "correctIndex": 2}'::jsonb,
  'Türklerin tarihte **Anadolu''ya ilk defa ayak basması**, Avrupa Hun hükümdarı **Uldız** döneminde (398 yılı civarında) gerçekleşmiştir. Uldız ayrıca Bizans Trakya valisine hitaben tarihe geçen *"Güneşin battığı yere kadar her yeri zapt edebilirim"* sözünü söyleyen hükümdardır.',
  'Adayların büyük çoğunluğu Avrupa Hun Devleti dendiğinde tüm askeri ve siyasi başarıları otomatikman Atilla''ya atfeder. Oysa Anadolu''ya ilk ayak basan hükümdar Atilla değil, Uldız''dır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Avrupa Hun Devleti''nin en parlak hükümdarı olan Atilla; Margos ve Anatolyus antlaşmalarıyla Doğu Roma''yı vergiye bağlamış, Galya ve İtalya seferleriyle Batı Roma''yı baskı altına almıştır.

Atilla ile ilgili olarak aşağıda verilen bilgilerden hangisi **yanlıştır**?',
  '{"options": ["Hristiyan dünyasında Tanrı''nın günahkâr kullarını cezalandırmak için gönderdiğine inanıldığı için kendisine \"Tanrının Kırbacı (Kamçısı)\" denilmiştir.", "Almanların meşhur \"Nibelungen Destanı\"nda iyiliksever ve kudretli hükümdar \"Etzel\" adıyla yer almıştır.", "Roma Seferi sırasında Papa I. Leo başkanlığındaki heyetin ricası ve Roma''nın Hristiyanlarca kutsal sayılması üzerine kenti yağmalamaktan vazgeçmiştir.", "İtalya Seferi sonrasında Hristiyanlığı resmi din olarak kabul ederek Avrupa Hunlarını tamamen yerleşik hayata geçirmiştir.", "Günümüz Macaristan devleti tarihsel ve kültürel köklerini Atilla ve Hunlara dayandırmaktadır."], "correctIndex": 3}'::jsonb,
  'Atilla hiçbir zaman Hristiyanlığı kabul etmemiştir; Gök Tanrı inancına bağlı kalmıştır. Avrupa Hun Devleti yerleşik hayata geçmemiş, bozkır göçebe savaşçı karakterini korumuştur.',
  'Papa I. Leo''nun Atilla''nın ayaklarına kapanıp af dilemesi olayını bazı adaylar "Atilla''nın Hristiyanlığa saygısından dolayı dine geçtiği" yanılgısıyla karıştırabilir. Atilla''nın Roma''yı almamasının gerçek nedenleri; Batı Roma''nın boyun eğdiğine inanması, ordusundaki salgın hastalıklar ve Doğu''daki Sasani tehlikesidir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Çin kaynaklarında "Juan-Juan" olarak adlandırılan, Göktürklerin baskısıyla batıya göç ederek Orta Avrupa''da devlet kuran ve **619 ile 626 yıllarında Sasanilerle ittifak yaparak dünya tarihinde İstanbul''u ilk kez kuşatan** Türk devleti aşağıdakilerden hangisidir?',
  '{"options": ["Peçenekler", "Avarlar", "Tuna Bulgarları", "Macarlar", "Hazarlar"], "correctIndex": 1}'::jsonb,
  'Bayan Han önderliğinde Orta Avrupa merkezli devlet kuran **Avarlar**, 619 ve 626 yıllarında Sasaniler ile iş birliği yaparak İstanbul''u kuşatan tarihteki ilk Türk devletidir. Ayrıca üzengiyi ve süvari kalkanlarını Slav ve Germen kavimlerine öğreterek Avrupa askeri teknolojisini derinden etkilemişlerdir.',
  'İstanbul''u kuşatan diğer Türk toplulukları Peçenekler ve Tuna Bulgarlarıdır. Soru kökünde "ilk kez kuşatan" ve "Sasanilerle ittifak kuran" ifadeleri doğrudan Avarlar''ı işaret eder.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karadeniz''in kuzeyinde ve Balkanlar''da etkili olan Peçenekler hakkında aşağıda verilen bilgilerden hangisi **doğrudur**?',
  '{"options": ["Tarihte hiçbir zaman merkezi bir devlet teşkilatına dönüşemeyip boy birliği (federasyon) halinde kalmışlardır.", "Musevilik dinini resmi din ilan ederek Hazar Barış Çağı''nı başlatmışlardır.", "Kendi adlarına madeni para bastırarak Türk tarihinde ilk para basan devlet olmuşlardır.", "Bögü Kağan döneminde Maniheizm dinini kabul ederek tapınak mimarisini başlatmışlardır.", "Rusların Karadeniz''e inmesini tamamen engelleyerek Altın Orda Devleti''nin temellerini atmışlardır."], "correctIndex": 0}'::jsonb,
  'Peçenekler, tarihte boy teşkilatlanmasını aşarak merkezi bir devlet kuramamış; boylar birliği şeklinde kalmışlardır. Bizans ordusunda ücretli askerlik yapmışlar, 1071 Malazgirt Savaşı''nda Selçuklu saflarına geçerek savaşın kazanılmasında kilit rol oynamışlardır. Danışma meclislerine ise "Komenton" denirdi.',
  'Birçok öğrenci Peçeneklerin de Hunlar veya Göktürkler gibi büyük bir "devlet" kurduğunu varsayar. Peçeneklerin en belirgin KPSS soru kalıbı "devletleşemeyip boy halinde kalmaları" ve "Bizans''ta ücretli askerlik yaparken Malazgirt''te taraf değiştirmeleri"dir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Türk dünyasının en kalabalık ve en faal boyu olan Oğuzların İslamiyeti kabul edenlerine "Türkmen", Hristiyanlığı kabul edip Bizans ordusunda paralı askerlik yapan ve günümüzde Moldova''ya bağlı özerk bir cumhuriyet olarak varlıklarını sürdüren koluna ise tarih boyunca ne ad verilmiştir?',
  '{"options": ["Kıpçak (Kuman)", "Uz (Gagavuz)", "Hazar", "Avar", "Karluk"], "correctIndex": 1}'::jsonb,
  'Oğuzların Müslüman olan koluna Türk veya Türkmen, Hristiyan olan koluna ise **Uz** denilmiştir. Uzlar, Peçeneklerle birlikte Malazgirt Savaşı''nda Bizans saflarından Selçuklu saflarına geçmişlerdir. Günümüzde Moldova''da yaşayan Hristiyan **Gagavuz (Gökoğuz) Türkleri** bu soyun devamıdır.',
  'ÖSYM sıklıkla Kıpçaklar (Kumanlar) ile Uzları çeldirici olarak birbirinin yanına koyar. Kıpçaklar Karadeniz''in kuzeyinde Deşt-i Kıpçak bölgesinde yaşamış farklı bir Türk boyudur; Hristiyan Oğuzlar ise doğrudan "Uz" olarak adlandırılır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Büyük Bulgar Devleti''nin Hazar baskısıyla yıkılmasından sonra iki kola ayrılan Bulgarlar hakkında;
I. İtil (Volga) Bulgarları, Almış Han döneminde İslamiyet''i kabul ederek Doğu Avrupa''da **İslamiyet''i devletin resmi dini ilan eden ilk Türk devleti** olmuştur.
II. Abbasiler tarafından İtil Bulgarlarına gönderilen İbn Fadlan, ünlü "Rihle (Yolculuk)" adlı seyahatnamesinde bu devletin kültür ve medeniyetini tasvir etmiştir.
III. Tuna Bulgarları, Boris Han döneminde Hristiyanlığı kabul ederek asimile olmuş ve liderleri Çar unvanını kullanmaya başlamıştır.

yargılarından hangileri **doğrudur**?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de tarihsel olarak tamamen doğrudur:
- İtil Bulgarları Almış Han döneminde (922) İslamiyet''i kabul eden ilk Türk devletidir (MEB müfredatında ilk Türk-İslam devleti kabul edilir).
- Abbasi halifesinin elçilik heyetinde yer alan İbn Fadlan, "Rihle" eserinde İtil Bulgarlarını anlatmıştır.
- Tuna Bulgarları ise Boris Han zamanında Hristiyanlaşmış, hükümdar Simon ilk kez "Çar" unvanını kullanmıştır.',
  'Adayların en büyük ezberi "İlk Müslüman Türk Devleti Karahanlılar" bilgisidir. Oysa Karahanlılar *Orta Asya''da* kurulan ilk Müslüman Türk devletidir. Genel Türk tarihinde İslamiyet''i resmi din olarak ilk kabul eden Türk devleti ise Doğu Avrupa''daki İtil Bulgarlarıdır (MEB kazanımı).'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde genel kural "ordu-millet" anlayışının hâkim olması ve eli silah tutan herkesin asker sayılmasıdır. Ancak Kafkaslar ve Karadeniz’in kuzeyinde hüküm süren bir Türk devleti bu kuralın dışına çıkarak **Türk tarihinde ilk kez ordusunda ücretli (paralı) askerler istihdam etmiştir.**

Kürk Yolu ticareti sayesinde büyük bir refaha ulaşan ve Musevilik dinini benimseyen tek Türk devleti olan bu siyasi teşekkül aşağıdakilerden hangisidir?',
  '{"options": ["Göktürkler", "Hazarlar", "Uygurlar", "Türgişler", "Kırgızlar"], "correctIndex": 1}'::jsonb,
  '**Hazarlar**, Kürk Yolu sayesinde çok büyük bir ticari zenginliğe ulaşmış, bünyesinde Musevilik, Hristiyanlık, İslamiyet ve Şamanizm''in bir arada barış içinde yaşadığı "Pax Hazaria (Hazar Barış Çağı)" ortamını kurmuşlardır. Türk tarihinde ordusuna maaşlı/ücretli asker alan ilk Türk devleti Hazarlar''dır. Günümüzde Polonya ve Litvanya''da yaşayan Karay / Karaim Türkleri Hazarların Musevi torunlarıdır.',
  'ÖSYM "Türklerde ordu-millet anlayışı vardır, ordu daima ücretsizdir" genellemesini Hazarların "ücretli asker istihdam etmesi" istisnası üzerinden çeldirici yapar. Bir diğer tuzak ise İslamlaşmayı engelleyen devlet sorulduğunda Türgişler ile Hazarların savaş alanlarını karıştırmaktır (Hazarlar Kafkasya''da Hz. Osman''la, Türgişler ise Maveraünnehir''de Emevilerle savaşmıştır).'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karadeniz''in kuzeyinde "Deşt-i Kıpçak" (Kıpçak Bozkırı) olarak bilinen geniş coğrafyada yaşayan Kıpçaklar (Kumanlar); sarışın, mavi gözlü fiziki yapıları ve savaşçı kimlikleriyle tanınmışlardır.

Aşağıdakilerden hangisi Kıpçakların Türk ve dünya kültür tarihindeki izlerinden biri **değildir**?',
  '{"options": ["Rus prenslikleriyle yaptıkları mücadelelerin Rusların ünlü \"İgor Destanı\"na konu olması", "Oğuz Türkleriyle giriştikleri egemenlik mücadelelerinin Türk edebiyatının başyapıtlarından \"Dede Korkut Hikayeleri\"nde işlenmesi", "İtalyan ve Alman tüccarların derlediği, Kıpçak Türkçesi-Latince-Farsça sözlük olan \"Codex Cumanicus\"u miras bırakmaları", "Mısır''da Eyyubiler ve Memlükler ordusunda görev alarak daha sonra bu coğrafyada hükümdarlık kurmaları", "Baga Tarkan döneminde kendi adlarına madeni para bastırarak serbest piyasa ekonomisine öncülük etmeleri"], "correctIndex": 4}'::jsonb,
  'Kendi adına madeni para bastıran ilk Türk hükümdarı Baga Tarkan olup, bu gelişme Kıpçaklara değil, **Türgişler** devletine aittir. Diğer tüm öncüller (İgor Destanı, Dede Korkut, Codex Cumanicus, Memlük ordusu) Kıpçaklara ait temel sınav kazanımlarıdır.',
  'ÖSYM Dede Korkut ve İgor Destanı''nı soru köküne koyarak sözlüğün adını (Codex Cumanicus) veya hükümdar/devlet eşleştirmesini sorar. Baga Tarkan ile Kıpçakları karıştırmak klasik bir sınav tuzağıdır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Orta Asya''da Çu ve İli nehirleri çevresinde kurulan Türgişler ile ilgili olarak aşağıda verilen bilgilerden hangisi **yanlıştır**?',
  '{"options": ["Hükümdarları Baga Tarkan kendi adına madeni para (yarmak) bastırmıştır.", "Sulu Kağan döneminde Emevi ordularıyla mücadele ederek (Haristan Savaşı) Orta Asya ve Maveraünnehir''in Arap hakimiyetine girmesini bir süre engellemişlerdir.", "Talas Savaşı sırasında Abbasilerin yanında yer alarak topluca İslamiyet''e geçen ilk Türk boyu olmuşlardır.", "Sarı ve Kara Türgişler olmak üzere iki ana kola ayrılarak iç mücadeleler sonucu zayıflamışlardır.", "Karlukların baskısıyla bağımsızlıklarını kaybederek siyasi varlıklarını yitirmişlerdir."], "correctIndex": 2}'::jsonb,
  '751 Talas Savaşı''nda Çinlilere karşı Abbasileri destekleyip kitleler halinde İslamiyet''e geçen ilk Türk boyu Türgişler değil, **Karluklar**dır. Türgişler ise tam aksine Emevilerle savaşarak Maveraünnehir ve Orta Asya''nın Araplaşmasına karşı direnmişlerdir.',
  'Adaylar Araplarla savaşan devletler (Hazarlar ve Türgişler) ile Araplarla ittifak kurup Müslüman olan boyları (Karluklar) birbirine karıştırma eğilimindedir. Soru bu kritik ayrımı hedefler.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Uygur Devleti''ni 840 yılında yıkarak Ötüken merkezli devlet kuran, ölülerini yakan, günümüzde 500 bini aşkın dizesiyle dünyanın en uzun yaşayan sözlü destanı kabul edilen **"Manas Destanı"**nın sahibi olan ve **Cengiz Han (Moğol) İmparatorluğu''na itaat eden ilk Türk devleti** unvanını taşıyan Türk topluluğu aşağıdakilerden hangisidir?',
  '{"options": ["Karluklar", "Kırgızlar", "Kimekler", "Başkırtlar", "Sibirler"], "correctIndex": 1}'::jsonb,
  'Manas Destanı''nın sahibi olan, Yenisey Kitabeleri''ni diken, ölülerini yakan ve Moğollara (Cengiz Han''a) itaat eden ilk Türk **devleti** **Kırgızlar**dır.',
  'ÖSYM''nin en meşhur ince ayrımı:
- Cengiz Han''a itaat eden ilk Türk **boyu**: **Karluklar**
- Cengiz Han''a itaat eden ilk Türk **devleti**: **Kırgızlar**
Adaylar "boy" ile "devlet" kelimesine dikkat etmezse Karluklar (A şıkkı) tuzağına düşer.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
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

özelliklerinden hangilerine **sahiptir**?',
  '{"options": ["I ve II", "I, II ve III", "II ve IV", "III ve IV", "I, II, III ve IV"], "correctIndex": 1}'::jsonb,
  'I, II ve III numaralı öncüller Karluklara aittir (Talas Savaşı''nda Abbasileri desteklemişler, İslamiyet''i kabul eden ilk Türk boyu olmuşlar ve Karahanlıların omurgasını oluşturmuşlardır). Ancak IV. öncül yanlıştır; Karluklar Cengiz Han''a itaat eden ilk Türk **boyudur**; ilk Türk devleti ise **Kırgızlar**dır.',
  'Soru öncüllerindeki "ilk Türk devleti" ile "ilk Türk boyu" kelime oyunudur. Aday IV. öncülü doğru kabul ederse E şıkkına gider ve elenir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'Türk boyları göç hareketleri sonucunda farklı coğrafyalarda çok sayıda devlet kurmuşlardır. Ancak bazı topluluklar hem ana yurtları olan Orta Asya''da hem de göç ettikleri Orta ve Doğu Avrupa''da teşkilatlı devletler tesis etmeyi başarmışlardır.

Buna göre, **hem Orta Asya’da hem de Avrupa’da devlet kurmuş olan** iki Türk topluluğu aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Hunlar – Avarlar", "Göktürkler – Uygurlar", "Hazarlar – Peçenekler", "Kıpçaklar – Karluklar", "Bulgarlar – Macarlar"], "correctIndex": 0}'::jsonb,
  '- **Hunlar**: Orta Asya''da Asya Hun Devleti''ni, Avrupa''da ise Kavimler Göçü sonrası Avrupa Hun Devleti''ni kurmuşlardır.
- **Avarlar**: Orta Asya''da Göktürklerden önce "Juan-Juan" devleti olarak hüküm sürmüş, Göktürklerin baskısıyla batıya göç ederek Orta Avrupa''da Avar Kağanlığı''nı kurmuşlardır.',
  'Göktürkler ve Uygurlar hiçbir zaman Avrupa''ya göç etmemiş, Orta Asya''da kalmışlardır. Peçenekler ve Kıpçaklar ise Avrupa''ya geçmiş fakat Orta Asya''da teşkilatlı bağımsız büyük devletler kurmamışlardır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Soylarını Avrupa Hun Hükümdarı Atilla''ya dayandıran, IX. yüzyılın sonlarında Arpad liderliğinde bugünkü yurtlarına yerleşen; Hristiyanlığı kabul ederek zamanla Slav ve Germen kültürleri içerisinde dillerini ve siyasi kimliklerini dönüştürseler de Türk köklerini unutmayarak **1870 yılında Budapeşte''de tarihin ilk Türkoloji Enstitüsü''nü kuran** ve 2008''den bu yana **Türk Kurultayı**''na ev sahipliği yapan topluluk aşağıdakilerden hangisidir?',
  '{"options": ["Bulgarlar", "Macarlar", "Peçenekler", "Hazarlar", "Uzlar"], "correctIndex": 1}'::jsonb,
  'Macarlar, Hristiyanlığı benimsemelerine rağmen milli benlik arayışlarını sürdürmüş ve 1870''te Vámbéry''nin gayretleriyle dünyanın ilk Türkoloji Enstitüsü''nü Budapeşte''de kurmuşlardır. Günümüzde her iki yılda bir Bugac''ta düzenlenen Hun-Türk Kurultayı''na ev sahipliği yapmaktadırlar.',
  'Adaylar Türkoloji Enstitüsü''nün Osmanlı İmparatorluğu''nda veya Türklerin yoğun yaşadığı Rusya/Kazan bölgesinde kurulduğunu düşünebilir. Kurulan ilk enstitü Macaristan''ın başkenti Budapeşte''dedir (Arminius Vámbéry).'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'I. Göktürk Devleti''nin batı kanadını yöneten İstemi Yabgu, İpek Yolu ticaretinin denetimini ele geçirmek amacıyla çok yönlü ve pragmatik bir dış politika izlemiştir.

Bu doğrultuda İstemi Yabgu''nun izlediği diplomatik ve askerî stratejiyle ilgili aşağıdakilerden hangisi **doğrudur**?',
  '{"options": ["Önce Bizans ile anlaşarak Akhunları yıkmış, ardından Sasanilerle ittifak kurarak Bizans''a saldırmıştır.", "Önce Sasaniler ile ittifak yaparak Akhun Devleti''ne son vermiş, ardından Sasanilerin İpek Yolu''nu kapatması üzerine Bizans İmparatorluğu ile diplomatik ittifak kurmuştur.", "Çin ile birleşerek Sasani Devleti''ni ortadan kaldırmış ve İpek Yolu''nu tamamen Çin denetimine bırakmıştır.", "Akhunlar ve Sasanilerle üçlü savunma paktı kurarak Bizans''ın Orta Asya''ya ilerlemesini durdurmuştur.", "Avarlar ile anlaşarak Karadeniz''in kuzeyinden Bizans''a karşı ortak bir ordu sevk etmiştir."], "correctIndex": 1}'::jsonb,
  'İstemi Yabgu İpek Yolu''na egemen olmak için önce **Sasanilerle iş birliği yaparak Akhunları** (Eftalitleri) yıkmış ve topraklarını paylaşmıştır. Ardından Sasanilerin İpek Yolu ipek ticaretini engellemesi üzerine **Bizans İmparatorluğu ile diplomatik ilişki kurmuş** (elçi Maniac gönderilmiş, Bizans''tan Zemarkhos gelmiştir) ve Sasanilere karşı Bizans ile ittifak yapmıştır. Bu olay Orta Asya''dan Bizans''a gönderilen ilk resmi Türk elçiliğidir.',
  'ÖSYM ittifakların sırasını (A şıkkı) veya muhatap devletleri ters yüz ederek sorar. Doğru formül: "Sasani ile anlaş $\rightarrow$ Akhun''u yık; Bizans ile anlaş $\rightarrow$ Sasani''yi baskı altına al."'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'I. Göktürk Devleti''nde Mukan Kağan''dan sonra tahta geçen; Hintli bir rahibin etkisi altında kalarak Budizm''i (Buda dinini) benimseyen, başkentte Budist bir tapınak inşa ettirmek isteyen ancak bu girişimi hem devlet erkanı hem de Kurultay tarafından "Türklerin savaşçılık karakterini ve töresini zayıflatacağı" gerekçesiyle reddedilerek halkıyla arası açılan Göktürk hükümdarı aşağıdakilerden hangisidir?',
  '{"options": ["Bumin Kağan", "Tapo (Taspar) Kağan", "İşbara Kağan", "Bögü Kağan", "Kapgan Kağan"], "correctIndex": 1}'::jsonb,
  'I. Göktürk hükümdarı **Tapo Kağan**, Budizm dinini kabul etmiş ve halkına da yaymak istemiştir. Ancak Kurultay ve vezirler, Budizm''in barışçıl ve pasifist öğretilerinin Türklerin dinamik göçebe savaşçılık ruhunu öldüreceğini belirterek tapınak yapımına karşı çıkmışlardır.',
  'Sınavda adayların en çok düştüğü çeldirici **Bögü Kağan**''dır (D şıkkı). Bögü Kağan Uygur hükümdarıdır ve benimsediği din Maniheizm''dir. Budizm''i benimseyip kurultay engeliyle karşılaşan Göktürk hükümdarı ise Tapo Kağan''dır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'I. Göktürk Devleti''nin 630 yılında Doğu ve Batı olarak Çin hâkimiyetine girmesiyle Türk tarihinde 50 yıl süren "Matem / Esaret Devri" başlamıştır. Bu esaret döneminde 639 yılında 39 silah arkadaşıyla birlikte Çin sarayını basarak imparatoru esir almayı ve Türk milletinin bağımsızlığını yeniden ilan etmeyi amaçlayan destansı istiklal girişiminin önderi aşağıdakilerden hangisidir?',
  '{"options": ["Vezir Tonyukuk", "Kürşad", "Baga Tarkan", "Kutluk Kağan", "İlteriş Kağan"], "correctIndex": 1}'::jsonb,
  '639 yılında Çin sarayına yönelik 40 kişilik baskını organize eden **Kürşad** (ve ardından gelen Nişufu isyanı), esaret altındaki Türk boylarının bağımsızlık ateşini yakmış ve 682''de II. Göktürk (Kutluk) Devleti''nin kurulmasına zemin hazırlamıştır.',
  'Adaylar bu isyanın liderini devleti yeniden toparlayan Kutluk Kağan ile karıştırabilir. Kürşad bağımsızlık isyanını başlatan fedakâr komutandır; devleti toparlayan ise Kutluk (İlteriş) Kağan''dır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  '682 yılında Çin esaretine son vererek II. Göktürk Devleti''ni kuran ve dağınık Türk boylarını bir araya toplayıp derlediği için Kurultay tarafından kendisine **"İlteriş" (derleyen, toplayan)** unvanı verilen hükümdar ile bu süreçte ona stratejik danışmanlık yapan, "Apa Tarkan" unvanlı ve Batılı tarihçilerce **"Türklerin Bismarck''ı"** olarak anılan ilk Türk tarihçisi ve veziri aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Bumin Kağan — İstemi Yabgu", "Kutluk Kağan — Vezir Tonyukuk", "Bilge Kağan — Kül Tigin", "Kapgan Kağan — Yolluk Tigin", "Kutluk Kağan — Yolluk Tigin"], "correctIndex": 1}'::jsonb,
  'II. Göktürk Devleti''nin kurucusu **Kutluk (İlteriş) Kağan**''dır. Bu devletin teşkilatlanmasında ve bağımsızlık stratejisinde en büyük pay sahibi olan, dört hükümdara (Kutluk, Kapgan, İnal, Bilge) vezirlik yapmış, Apa Tarkan unvanlı devlet adamı **Vezir Tonyukuk**''tur. Tonyukuk kendi anıt taşını bizzat dikip yazdırdığı için Türk tarihinin ilk tarihçisi ve hatibi kabul edilir.',
  'ÖSYM Tonyukuk ile Yolluk Tigin''i (E şıkkı) sıkça karşı karşıya getirir. Tonyukuk ilk devlet adamı ve anıt yazarıdır; Yolluk Tigin ise Bilge Kağan ve Kül Tigin anıtlarının metnini taşa kazıyan kâtip/yazardır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Bugünkü Moğolistan sınırları içinde Orhun Irmağı vadisinde yer alan Orhun (Göktürk) Abideleri, Türk dili, tarihi ve edebiyatının ilk yazılı şaheseridir.

Orhun Abideleri ile ilgili olarak aşağıda verilen bilgilerden hangisi **yanlıştır**?',
  '{"options": ["Vezir Tonyukuk (725), Kül Tigin (732) ve Bilge Kağan (735) adına olmak üzere üç ana dikilitaştan oluşur.", "Kül Tigin ve Bilge Kağan yazıtlarının kâtipliğini ve taş üzerine kazıma işini yeğenleri Yolluk Tigin yapmıştır.", "Danimarkalı dilbilimci Vilhelm Thomsen tarafından 1893 yılında çözülmüş olup yazıtlar üzerinde çözülen ilk kelime \"Tengri\" (Tanrı)dir.", "Türk hükümdarlarının halka, halkın da devlete karşı görevlerini anlatan, devleti yönetme sanatını işleyen Türk tarihinin ilk \"siyasetname\" örneğidir.", "Abidelerin bir yüzü Soğdca, diğer yüzü ise Uygur alfabesiyle kaleme alınmıştır."], "correctIndex": 4}'::jsonb,
  'Orhun Abideleri, 38 harfli milli **Göktürk (Orhun) alfabesi** ile yazılmıştır. Anıtların bir yüzü Türkçe, diğer yüzü ise o dönemin diplomatik dili ve Çin halkına da mesaj iletmek amacıyla **Çince** yazılmıştır. Soğdca ve Uygur alfabesiyle yazılmamıştır.',
  'Adaylar Soğd alfabesini veya Bugut Yazıtı''nın özelliklerini Orhun Abideleri ile karıştırabilir. Orhun Abideleri Türkçe ve Çince olarak Göktürk alfabesiyle yazılmıştır. Ayrıca ilk çözülen kelimenin "Tengri" olması ve siyasetname özelliği KPSS''nin klasik favori soru detaylarıdır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi döneme ait yazıtlar Türk tarihinin en önemli birincil kaynaklarıdır.
I. **Bugut Yazıtı:** Göktürklere ait bilinen en eski yazıt olup Soğdca harflerle yazılmıştır.
II. **Yenisey Yazıtları:** Kırgızlara ait olup mezar taşlarından oluşan ve Türk tarihinin bilinen en eski kitabeleridir.
III. **Karabalgasun ve Sine Uşu Yazıtları:** Uygurlara ait olup Maniheizm''in kabulünü ve kağanların icraatlarını anlatır.

Yukarıda verilen kitabe ve ait olduğu Türk topluluğu eşleştirmelerinden hangileri **doğrudur**?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Öncüllerin tamamı doğrudur:
- Bugut Yazıtı: I. Göktürk dönemine (Mahan Tigin) ait en eski Göktürk yazıtıdır ve dili Soğdca-Sanskritçedir.
- Yenisey Yazıtları: Kırgızlara aittir, mezar taşı niteliğindedir ve edebi yönden Orhun Abideleri kadar gelişmiş değildir.
- Karabalgasun ve Sine Uşu (Taryat): Uygur kağanlarına ait yazıtlardır.',
  'Adaylar en eski kitabe denince sadece Orhun Abideleri''ni düşünür. Oysa edebi olarak okunan ilk yazıt Orhun olsa da mezar taşı ve kitabe olarak Yenisey (Kırgız) ve Bugut (I. Göktürk) kronolojik olarak daha eskidir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  '744 yılında Kutluk Bilge Kül Kağan tarafından kurulan ve Türklerin geleneksel kutsal başkenti Ötüken''i terk ederek başkentini **Karabalgasun (Ordu-Balık)** kentine taşıyan, ardından **Bögü Kağan** döneminde 762 yılında kabul ettikleri din sebebiyle Türk tarihinde ilk kez yerleşik yaşama geçen devlet aşağıdakilerden hangisidir?',
  '{"options": ["Göktürkler", "Uygurlar", "Hazarlar", "Türgişler", "Akhunlar"], "correctIndex": 1}'::jsonb,
  'Uygurlar, Bögü Kağan zamanında Tibet Seferi dönüşünde Soğdlu tüccarların etkisiyle **Maniheizm (Mani)** dinini kabul etmişlerdir. Başkentlerini Karabalgasun''a taşımış ve yerleşik hayata geçen ilk Türk devleti olmuşlardır.',
  'ÖSYM burada dinin adını (Budizm - Maniheizm) veya hükümdarı (Kutluk Bilge Kül Kağan - Bögü Kağan) yer değiştirerek çeldirici üretir. Devleti kuran Kutluk Bilge Kül Kağan, Maniheizm''i getiren ise Bögü Kağan''dır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Uygurların Bögü Kağan döneminde benimsediği Maniheizm dini; et yemeyi, canlı öldürmeyi ve savaşmayı yasaklayan bir inanç sistemidir.

Aşağıdakilerden hangisi Maniheizm dininin Uygur toplumunda meydana getirdiği doğrudan değişimlerden biri **olamaz**?',
  '{"options": ["Beslenme alışkanlıklarının değişmesiyle birlikte tarım faaliyetlerinin ve sulama kanallarının (Tötö kanalı) artması", "Türklerin savaşçı ve mücadeleci özelliklerinin zamanla zayıflaması", "Şehirleşmenin başlaması ve \"balıg\" adı verilen surlarla çevrili kentlerin kurulması", "Hükümdarların ve hanedan üyelerinin kut inancını terk ederek teokratik monarşiyi sonlandırması", "Tapınak ve saray inşasıyla birlikte kubbe ve duvar resmi (fresko) sanatının gelişmesi"], "correctIndex": 3}'::jsonb,
  'Maniheizm dini kut inancını sona erdirmemiştir. Hükümdarlar yönetme yetkisini tanrısal kaynaklı görmeye devam etmiş, hatta Mani dininin etkisiyle hükümdar unvanlarının başına ışık/nur anlamına gelen **"Aytengri"** ve **"Kün"** gibi unvanlar eklemişlerdir.',
  'Adaylar yerleşik hayata geçince veya yeni dine girince hükümdarların kut anlayışını tamamen bıraktığını zanneder. Oysa kut inancı İslamiyet öncesinde tüm Türk devletlerinde kesintisiz devam etmiş, İslamiyet''ten sonra bile "Allah''ın nasibi / zıllullah" şeklinde form değiştirerek sürmüştür.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Uygurlar, yerleşik hayata geçişleriyle birlikte Türk kültür ve medeniyet tarihine çok sayıda "ilk" kazandırmışlardır.

Aşağıdakilerden hangisi Uygurların Türk uygarlık tarihine kazandırdığı yeniliklerden biri **değildir**?',
  '{"options": ["\"Çav\" adı verilen kağıt parayı basarak faizle borç verme usulüyle ilk bankacılık faaliyetlerini başlatmaları", "Tahta harflerden oluşan hareketli matbaayı ve kütüphaneleri kurup örgün eğitim kurumlarını açmaları", "Töre kurallarını yazılı hale getirerek borçlar, kiralama ve ticaret hukukunu kayıt altına almaları", "Minyatür ve fresko sanatını geliştirip orta oyunu ve pandomim ile Türk tiyatrosunun temellerini atmaları", "Türk tarihinde ilk kez düzenli posta teşkilatını (Berid Teşkilatı) kurarak merkezi otoriteyi güçlendirmeleri"], "correctIndex": 4}'::jsonb,
  'Düzenli posta ve istihbarat teşkilatı olan "Berid Teşkilatı", İslam tarihinde Hz. Ömer ve Emeviler döneminde kurulmuş, Türk-İslam devletlerinde (Gazneliler, Büyük Selçuklu) kurumsallaşmıştır. İslamiyet öncesi Türk devletlerinde ise haberleşme atlı ulaklarla sağlanmış, ayrı bir resmi posta bürokrasisi teşkilatı kurulmamıştır. Diğer şıkların tamamı (Çav, matbaa, yazılı töre, minyatür/tiyatro) Uygurlara ait tartışmasız ilklerdir.',
  '"Çav" adlı kağıt para ve faizli borç/ipotek sözleşmeleri adaya şaşırtıcı ve "fazla modern" gelebilir; ancak bunlar Ramazan Yetgin ve MEB notlarında özellikle altı çizilen kesin Uygur kazanımlarıdır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devlet anlayışında devleti yönetme yetkisinin Gök Tanrı tarafından hükümdara ve onun hanedanına verildiğine inanılırdı. Bu ilahi bağışa **"Kut"** adı verilmiştir.

Buna göre, kut anlayışının Türk devlet yapısında ortaya çıkardığı **en önemli siyasi sonuç** aşağıdakilerden hangisidir?',
  '{"options": ["Hükümdarların halk nezdinde tanrı-kral (yarı tanrı) olarak kabul edilmesi", "Belirli bir veraset kanunu olmadığı için hanedanın tüm erkek üyelerinin tahtta hak iddia etmesi ve sık sık taht kavgalarının yaşanması", "Kurultay meclisinin hükümdarı denetleme yetkisinin tamamen elinden alınması", "Türk hükümdarlarının yalnızca dini törenleri yöneten birer din adamı haline gelmesi", "Töre kurallarının hükümdarın tek taraflı iradesiyle her an iptal edilebilmesi"], "correctIndex": 1}'::jsonb,
  'Kut kan bağıyla tüm hanedan üyelerine (oğul, kardeş, yeğen, amca) geçtiği için "ülke hanedanın ortak malıdır" prensibi geçerliydi. Tahta kimin geçeceğine dair kesin bir kural (veraset düzeni) olmadığı için her kağan ölümünde taht kavgaları çıkmış, bu durum Türk devletlerinin kısa sürede parçalanıp yıkılmalarına neden olmuştur. Türk kağanları asla Mısır''daki gibi "tanrı-kral" olmamışlardır.',
  'Adaylar kut yetkisini Tanrı''nın vermesinden dolayı hükümdarın "Tanrı-kral" (A şıkkı) veya "Din adamı/rahip-kral" (D şıkkı) olduğunu zannedebilir. Eski Türklerde teokratik yapı ve tebaa üzerinde tanrılık iddiası yoktur; kut sadece siyasal meşruiyet aracıdır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türk devletlerinde sınırların çok geniş olması nedeniyle ülke Doğu ve Batı (veya Sağ-Sol, Kuzey-Güney) şeklinde iki idari bölgeye ayrılarak yönetilirdi. Güneşin doğduğu yön olan Doğu kutsal kabul edilir ve asıl Kağan doğuda otururdu. Batı kanadını ise Kağan’a bağlı olarak hanedandan bir prens (genellikle kardeşi) "Yabgu" unvanıyla yönetirdi.

Bu **"İkili Teşkilat"** sistemiyle ilgili olarak aşağıdakilerden hangisi **söylenemez**?',
  '{"options": ["Yönetimde federatif bir devlet anlayışının benimsendiğinin göstergesidir.", "Geniş coğrafyaların idaresini kolaylaştırma amacına hizmet etmiştir.", "Batı kanadı iç işlerinde serbest, dış işlerinde ise doğudaki büyük Kağana bağlıdır.", "Türk devletlerinde merkezi otoriteyi daima en üst seviyede tutarak devletin parçalanmasını kesin olarak önlemiştir.", "Tarihte ilk kez Asya Hun Devleti''nde uygulanmış, daha sonra Göktürklerde de devam ettirilmiştir."], "correctIndex": 3}'::jsonb,
  'İkili teşkilat sistemi geniş bozkır coğrafyasında yönetimi kolaylaştırsa da kriz anlarında batıdaki yabgunun bağımsızlığını ilan etmesine veya doğu ile taht mücadelesine girişmesine yol açmış; yani merkezi otoriteyi zayıflatarak devletin parçalanmasını ve yıkılışını kolaylaştırmıştır.',
  'ÖSYM "merkezi otoriteyi güçlendirir / parçalanmayı önler" ifadesini çok sık pozitif bir tuzak olarak seçeneklere koyar. Oysa ikili teşkilat merkezi otoritenin tam zıddıdır (federatiftir) ve bölünmeyi hızlandırmıştır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'İslamiyet öncesi Türk devletlerinde devlet ve toplum meselelerinin görüşülüp karara bağlandığı meclise "Kurultay", "Toy" veya "Kengeş" adı verilirdi. Kurultay üyelerine ise genel olarak **"Toygun"** denirdi.

Buna göre, aşağıdakilerden hangisi bir Kurultay''ın doğal üyeleri (Toygun) arasında **yer almaz**?',
  '{"options": ["Hakan (Kağan)", "Hatun (Katun)", "Boy Beyleri", "Şamanlar veya Kamlar (Din Adamları)", "Ayguclar (Vezirler) ve Ordu Komutanları"], "correctIndex": 3}'::jsonb,
  'Eski Türk devletlerinde din adamları (Kam / Baksı / Şaman) Kurultay''ın doğal ve daimi üyesi (Toygun) **değildir**. Bu durum eski Türk devlet teşkilatının teokratik bir ruhban sınıfının güdümünde olmadığını, dünyevi ve askeri-demokratik bir nitelik taşıdığını gösterir.',
  'Adaylar Hatun''un kurultaya katılamayacağını düşünerek B şıkkına gidebilir. Oysa Hatun elçi kabulünde ve kurultayda hakanın yanında bizzat yer alır. Kurultaya katılamayan zümre din adamlarıdır (şamanlar).'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Eski Türk devletlerinde kurultay meclisleri devletlerin siyasi ve kültürel yapılarına göre farklı isimlerle anılmıştır.

Aşağıdaki Türk devleti ve kullandığı meclis ismi eşleştirmelerinden hangisi **yanlıştır**?',
  '{"options": ["Peçenekler $\\rightarrow$ Komenton", "Tuna Bulgarları $\\rightarrow$ Millet Meclisi", "Avrupa Hunları $\\rightarrow$ Seçkinler Meclisi", "Hazarlar $\\rightarrow$ İhtiyarlar Meclisi", "Tabgaçlar $\\rightarrow$ Toy Meclisi"], "correctIndex": 4}'::jsonb,
  'Kuzey Çin''de 200 yıl egemen olan Türk devleti **Tabgaçlar**''ın meclisine **"Nazırlar Meclisi"** adı verilirdi. Toy Meclisi genel Türk kurultayıdır.
- Peçenekler: Komenton
- Tuna Bulgarları: Millet Meclisi
- Avrupa Hunları: Seçkinler Meclisi
- Hazarlar: İhtiyarlar Meclisi
- Tabgaçlar: Nazırlar Meclisi',
  'ÖSYM son yıllarda Peçeneklerin meclisi olan "Komenton"u veya Hazarların "İhtiyarlar Meclisi"ni doğrudan eşleştirme sorusu olarak sormaktadır. Tabgaçların Nazırlar Meclisi Ramazan Yetgin notlarında özel uyarıyla vurgulanan kritik bir detaydır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'İslamiyet öncesi Türk devlet geleneğinde hükümdarın siyasi hâkimiyetini ve meşruiyetini simgeleyen çeşitli semboller ve alametler kullanılmıştır.

Aşağıdakilerden hangisi İslamiyet öncesi Türk hükümdarlık sembolleri (alametleri) arasında **yer almaz**?',
  '{"options": ["Otağ (Hükümdar Çadırı)", "Örgin (Taht)", "Tuğ (Sancak) ve Nevbet (Davul)", "Berge (Kamçı) ve Kur (Kemer)", "Ok"], "correctIndex": 4}'::jsonb,
  'Eski Türklerde **"Yay"** hâkimiyet ve hükümdarlık sembolüdür; ancak **"Ok" kesinlikle bir hükümdarlık sembolü DEĞİLDİR!** Ok, bağlılığı, itaati ve kağana tabiiyeti (halkı ve boyları) temsil eder. Yay emreden, ok ise emre boyun eğendir.',
  'ÖSYM soru bankalarında ve sınavlarda "Hangisi hükümdarlık sembolü değildir?" sorusunun açık ara 1 numaralı yanıtı ve çeldiricisi **"Ok"**tur. Aday yay hükümdarlık sembolü olunca okun da sembol olduğunu zanneder; oysa ok bağlılık alametidir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devlet teşkilatında yer alan görevliler ve yürüttükleri hizmetlerle ilgili aşağıdaki eşleştirmelerden hangisi **yanlıştır**?',
  '{"options": ["Ayukı $\\rightarrow$ Hükümet", "Aygucı (Üge) $\\rightarrow$ Başbakan (Vezir)", "Tudun $\\rightarrow$ Vergi memuru / Mali denetçi", "Tutuk $\\rightarrow$ Askeri vali", "Tamgacı (Bitikçi) $\\rightarrow$ Hükümdarın özel doktoru ve hekimi"], "correctIndex": 4}'::jsonb,
  'Tamgacı (veya Bitikçi), devletin iç ve dış yazışmalarını yürüten, belgelere hükümdarın damgasını/mührünü basan **kâtip ve yazıcıdır**. Hükümdarın ve halkın sağlık işlerine bakan doktora/hekime ise eski Türklerde **"Otacı"** veya **"Emçi"** adı verilirdi.',
  'ÖSYM "Tudun" (vergi memuru) ile "Tutuk" (askeri vali) kelimelerini ya da "Bitikçi" ile "Otacı"yı birbirinin yerine yazarak adayı kavram kargaşasına düşürür.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Eski Türk toplumunun ve devlet teşkilatının temelini yazısız hukuk kuralları olan "Töre" oluştururdu. Töre; gelenekler, kurultay kararları ve kağanın buyrukları ile şekillenir ve gerektiğinde kurultay kararıyla değiştirilebilirdi. Ancak törenin hiçbir kağan veya meclis tarafından asla değiştirilemeyen dört temel evrensel ilkesi bulunmaktaydı.

Aşağıdakilerden hangisi törenin bu **değişmez dört temel ilkesi** arasında yer almaz?',
  '{"options": ["Könilik (Adalet)", "Uzluk (İyilik / Faydalılık)", "Tüzlük (Eşitlik)", "Kişilik / İnsanlık", "Kutluluk (Teokrasi)"], "correctIndex": 4}'::jsonb,
  'Törenin asla değişmeyen ve anayasal güvence niteliğindeki dört ilkesi şunlardır:
1. **Könilik:** Adalet
2. **Uzluk:** İyilik, faydalılık, kamu yararı
3. **Tüzlük:** Kanun önünde eşitlik
4. **Kişilik (İnsanlık):** İnsaniyet ve evrensel merhamet
"Kutluluk" törenin değişmez ilkelerinden biri değildir.',
  '2015 KPSS''de "Könilik (Adalet)" sorulmuştu. Şimdi adayların önüne "Uzluk" veya "Tüzlük" kavramları sıkça çeldirici olarak konulmaktadır. Kut inancıyla bu dört etik-hukuki ilke birbirine karıştırılmamalıdır.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  1,
  'İslamiyet öncesi Türk toplumsal yapısı kan bağına dayalı hiyerarşik bir piramit şeklinde örgütlenmiştir.

Bu toplumsal yapının en küçük yapı taşı olan **"Aile"den en üst örgütlenme olan "Devlet"e doğru küçükten büyüğe sıralanışı** aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Oğuş $\\rightarrow$ Urug $\\rightarrow$ Boy $\\rightarrow$ Bodun $\\rightarrow$ İl", "Urug $\\rightarrow$ Oğuş $\\rightarrow$ Bodun $\\rightarrow$ Boy $\\rightarrow$ İl", "Oğuş $\\rightarrow$ Boy $\\rightarrow$ Urug $\\rightarrow$ İl $\\rightarrow$ Bodun", "Boy $\\rightarrow$ Bodun $\\rightarrow$ Oğuş $\\rightarrow$ Urug $\\rightarrow$ İl", "Oğuş $\\rightarrow$ Urug $\\rightarrow$ Bodun $\\rightarrow$ Boy $\\rightarrow$ İl"], "correctIndex": 0}'::jsonb,
  'Eski Türk toplum yapısının çekirdeği ailedir. Sıralama şöyledir:
1. **Oğuş:** Aile
2. **Urug:** Sülale (Aileler birliği)
3. **Boy (Bod):** Kabile / Boy
4. **Bodun:** Millet (Boylar birliği)
5. **İl (El):** Devlet',
  'ÖSYM''nin her 2-3 yılda bir sorduğu klasik soru tipidir. Adaylar genellikle "Urug" (sülale) ile "Oğuş" (aile) sırasını karıştırır veya Boy ile Bodun''un yerini değiştirir (E şıkkı tuzağı).'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk orduları hızlı hareket eden süvari birliklerinden oluşurdu. Savaş meydanında düşmanı yanıltmak amacıyla sahte bir geri çekilme uygulayıp ardından pusu kurulan alanda düşmanı hilal şeklinde çembere alarak imha etme esasına dayanan Turan taktiği uygulanırdı.

Ayrıca Türk ordusunda ana ordu sefere çıkmadan önce ileriye gönderilen, düşmanın vaziyetini, coğrafi engelleri ve su kaynaklarını keşfederek merkeze haber getiren **öncü keşif birliğine** ne ad verilirdi?',
  '{"options": ["Tarkan", "Böri", "Yelme", "Cebelü", "Subaşı"], "correctIndex": 2}'::jsonb,
  'İslamiyet öncesi Türk ordusunda keşif ve istihbarat amaçlı ileri sürülen öncü akıncı birliğine **"Yelme"** denirdi. Yelmenin Osmanlı Devleti ordusundaki birebir karşılığı ise sınır boylarındaki **"Akıncılar"**dır. Böri (B şıkkı) ise Kağan''ın özel muhafız alayıdır.',
  'Adaylar Osmanlı''daki "Akıncı" kavramını bildiği halde İslamiyet öncesindeki karşılığı olan "Yelme" terimini gözden kaçırabilir veya komutan unvanı olan Subaşı / Tarkan ile karıştırabilir.'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türklerin dini inanışları ve defin gelenekleriyle ilgili çeşitli kavramlar bulunmaktadır.

Aşağıdakilerden hangisi eski Türklerde **ölümden sonra yaşamın (ahiret hayatının) varlığına doğrudan bir kanıt olarak GÖSTERİLEMEZ**?',
  '{"options": ["Ölen kişinin mezarına hayattayken öldürdüğü düşman sayısı kadar taştan yontulmuş \"Balbal\" dikilmesi", "Mezar odaları olan \"Kurgan\"lara ölünün eşyaları, silahları ve atıyla birlikte gömülmesi", "İyilerin gideceğine inanılan cennet kavramı için \"Uçmağ\", kötülerin gideceği cehennem için \"Tamu\" tabirlerinin kullanılması", "Cenazenin ardından ölen kişinin arkasından \"Yuğ\" adı verilen yas ve cenaze törenlerinin düzenlenmesi", "Ölen kişinin cesedinin kefenlenerek (\"eşük\") mezar odasında koruma altına alınması"], "correctIndex": 3}'::jsonb,
  '**Yuğ törenleri**, sadece bir cenaze ve matem merasimidir; ölen bir yakının ardından üzüntüyü ifade etmek için yapılır. Yuğ töreninin yapılması tek başına ölümden sonra bir yaşam (ahiret) olduğuna kanıt oluşturmaz; dünyevi bir keder ritüelidir. Oysa Kurgan''a eşya koymak, Uçmağ (cennet), Tamu (cehennem) ve Balbal (ahirette hizmet edeceğine inanılan heykeller) doğrudan **ahiret inancının** kanıtıdır.',
  'ÖSYM''nin en meşhur mantık sorusudur. Ramazan Yetgin notlarında da kural olarak belirtilmiştir: "Yuğ = Ahiret inancı kanıtı değildir! Kurgan, Balbal, Uçmağ, Tamu = Ahiret inancı kanıtıdır."'
);

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk edebiyatında sözlü gelenek destanlar, koşuklar ve sagular etrafında şekillenmiştir.

Aşağıdaki destan ve ait olduğu Türk devleti/boyu eşleştirmelerinden hangisi **yanlıştır**?',
  '{"options": ["Alp Er Tunga ve Şu Destanları $\\rightarrow$ İskitler (Sakalar)", "Oğuz Kağan Destanı $\\rightarrow$ Asya Hun Devleti", "Bozkurt ve Ergenekon Destanları $\\rightarrow$ Göktürkler", "Türeyiş ve Göç Destanları $\\rightarrow$ Kırgızlar", "Şan Kızı Destanı $\\rightarrow$ Bulgarlar"], "correctIndex": 3}'::jsonb,
  'Türeyiş ve Göç destanları Kırgızlara değil, **Uygurlara** aittir. Kırgızlara ait dünyaca ünlü destan ise **Manas Destanı**dır.',
  'Adaylar Uygurların "Türeyiş ve Göç" destanları ile Göktürklerin "Bozkurt ve Ergenekon" destanlarını birbirine karıştırabilmektedir. Her ikisinde de kurt motifi yer alsa da Göç ve Türeyiş Uygurlara aittir.'
);