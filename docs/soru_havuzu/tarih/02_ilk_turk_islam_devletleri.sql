-- ==========================================================================
-- KADRO SORU HAVUZU — TARİH (ÜNİTE 2: İLK TÜRK-İSLAM DEVLETLERİ)
-- Toplam 40 Çoktan Seçmeli Soru (ÖSYM Çeldirici Tuzağı Analizli)
-- ==========================================================================

-- Soru tar_ti_001
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '751 yılında Müslüman Abbasiler ile Çinliler arasında yapılan Talas Savaşı (Atlık Savaşı), Türk-İslam tarihinin başlangıcı kabul edilmektedir. Bu savaş sonucunda Karluk Türkleri kitleler halinde İslamiyet''i benimsemeye başlamış ve kültürel etkileşim hız kazanmıştır.

Aşağıdakilerden hangisi Talas Savaşı''nın Türk ve dünya kültür tarihi üzerindeki doğrudan sonuçlarından biri değildir?',
  '{"options": ["Kağıt üretiminin Çin sınırları dışına çıkarak ilk kez Semerkand''da üretilmeye başlanması", "Karluk, Yağma ve Çiğil Türklerinin desteğiyle Orta Asya''nın Çin egemenliğine girmesinin engellenmesi", "Uygurlara ait matbaa, minyatür ve fresk gibi sanat ürünlerinin Batı dünyasına taşınması", "Karasuk ve Tagar kültürlerine ait ilk demir silahların İslam orduları tarafından kopyalanması", "Semerkand kentinin ''Şehirlerin Şahı'', Kaşgar kentinin ise ''Işıldayan İnci'' unvanıyla İslam medeniyet merkezlerine dönüşmesi"], "correctIndex": 3}'::jsonb,
  'Karasuk ve Tagar kültürleri İslamiyet''ten binlerce yıl önceki tarih öncesi/tarih çağları Orta Asya bozkır kültürleridir; 8. yüzyıldaki Talas Savaşı ile doğrudan bir ilgisi yoktur. Talas Savaşı ile kağıt Çin dışında ilk kez Semerkand''da üretilmiş, Uygur sanat eserleri batıya taşınmış ve Türk-İslam şehirleri büyük ivme kazanmıştır.',
  'ÖSYM adayların "Semerkand = Şehirlerin Şahı" veya "Kaşgar = Işıldayan İnci" unvanlarını Talas Savaşı kazanımlarıyla bağdaştıramayacağını düşünerek bu şıkları çeldirici olarak kullanır. Asıl tuzak ise tarih öncesi kültürlerin (Tagar/Karasuk) sanki Orta Çağ savaşıyla aktarılmış gibi seçeneklere serpiştirilmesidir.'
);

-- Soru tar_ti_002
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Bilge Kül Kadir Han tarafından kurulan, Satuk Buğra Han döneminde İslamiyet''i kabul ederek hükümdarın ''Abdülkerim'' adını aldığı ve Türk tarihinde "Afrasiyapoğulları" adıyla da anılan, Orta Asya''da kurulan ilk Müslüman Türk devleti aşağıdakilerden hangisidir?',
  '{"options": ["Gazneliler", "Karahanlılar", "Büyük Selçuklu Devleti", "İtil Bulgarları", "Tolunoğulları"], "correctIndex": 1}'::jsonb,
  'Orta Asya topraklarında kurulan ilk Müslüman Türk devleti Karahanlılar''dır (840-1212). Satuk Buğra Han İslamiyet''i kabul edince Abdülkerim adını almıştır. Divan-ı Lügati''t-Türk''te Karahanlı hanedanı Alp Er Tunga''ya (Afrasiyap) dayandırıldığı için bu devlete Afrasiyapoğulları da denir.',
  'ÖSYM burada "İlk Müslüman Türk Devleti" tabiriyle İtil Bulgarları''nı (Doğu Avrupa), "Orta Asya''da kurulan ilk Müslüman Türk Devleti" tabiriyle ise Karahanlılar''ı ölçer. Aday coğrafi sınırlamaya (Orta Asya) dikkat etmezse İtil Bulgarları tuzağına düşer.'
);

-- Soru tar_ti_003
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar Devleti İslamiyet''i kabul etmelerine rağmen Arap ve Fars kültürünün etkisinde erimemiş, Türk kültür kimliğini titizlikle muhafaza etmişlerdir.

Aşağıdakilerden hangisi Karahanlılar Devleti''nin "milli / ulusçu" bir karaktere sahip olduğunun doğrudan bir kanıtı olamaz?',
  '{"options": ["Resmi yazışma ve edebi dillerinin Türkçe (Hakaniye Türkçesi) olması", "Yönetici hanedanının ve tebaasını oluşturan halk kitlelerinin tamamen Türk boylarından meydana gelmesi", "Hükümdarlarının Arslan Han, Buğra Han ve Kadir Han gibi kadim Türkçe unvanları kullanmaya devam etmesi", "Eski Türk ikili yönetim (Doğu-Batı) teşkilatını uygulamaları", "Devlet yönetiminde ilk kez Abbasi halifesinden menşur (atama onayı) alma geleneğini başlatmaları"], "correctIndex": 4}'::jsonb,
  'Halifeden menşur (onay) almak, hükümdarın meşruiyetini İslam hukuku ve hilafet makamına dayandırmasıyla ilgili teokratik/İslami bir uygulamadır; ulusçu karakteri değil, İslam dünyasıyla bütünleşmeyi gösterir. Resmi dilin Türkçe olması, boy federasyonu yapısı ve Türkçe unvanlar ise doğrudan ulusçu niteliğin kanıtıdır.',
  'Adaylar "ikili teşkilat"ın (D şıkkı) eski Türk devlet geleneğinden geldiğini unutup onu idari zafiyet olarak görebilir. Oysa ikili teşkilat ve Hakaniye lehçesi Karahanlıların milli/bozkır köklerine bağlılığının en somut delilleridir.'
);

-- Soru tar_ti_004
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
  'Ramazan Yetgin notlarında özel olarak vurgulanan kural: "Maristan derse Tolunoğulları, Bimarhane/Bimaristan derse Karahanlılar." Aday bu iki hastane ismini birbirine karıştırırsa I. öncülü eleyerek hata yapar.'
);

-- Soru tar_ti_005
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Afganistan''ın Gazne şehrinde Alp Tigin tarafından temelleri atılan ve Türk tarihinde adını kurulduğu coğrafi bölgeden/şehirden alan devlet aşağıdakilerden hangisidir?',
  '{"options": ["Karahanlılar", "Gazneliler", "İhşidler", "Tolunoğulları", "Harzemşahlar"], "correctIndex": 1}'::jsonb,
  'Gazneliler (963-1187), Afganistan''ın Gazne şehrinde kurulmuş ve adını bu şehirden almıştır. Karahanlılar hanedan unvanından, Tolunoğulları kurucusundan, Harzemşahlar ise Harzem bölgesinden almıştır. Kurulduğu şehrin adını taşıyan ilk büyük devlet Gaznelilerdir.',
  'ÖSYM Türk devletlerinin adını nereden aldığını (kurucusundan mı, boyundan mı, kurulduğu yerden mi) sıkça sorar. Tolunoğulları ve İhşidler kurucularının adını alırken, Gazneliler kurulduğu kentin adını almıştır.'
);

-- Soru tar_ti_006
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Gazneli Devleti''nin en kudretli hükümdarı olan Gazneli Mahmut; Abbasi halifesini Şii Büveyhoğulları baskısından kurtarmış, bunun üzerine Abbasi Halifesi el-Kadir Billah tarafından kendisine çeşitli unvanlar ve hilatlar tevdi edilmiştir.

Buna göre, dünya tarihinde "Sultan" unvanını resmi olarak kullanan ilk hükümdar olan Gazneli Mahmut''a halife tarafından verilen diğer unvanlar aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Ebu''l-Feth – Doğunun ve Batının Hükümdarı", "Zamanın Yeganesi – Alemin Aslanı", "Hadimü''l-Haremeyn – Seyfüddin", "İlteriş – Apa Tarkan", "Kutluğ – Şanyü"], "correctIndex": 1}'::jsonb,
  'Abbasi Halifesi, kendisini Şii tehlikesinden koruyan Gazneli Mahmut''a ''Sultan'' unvanının yanında MEB müfredatında yer alan ''Zamanın Yeganesi (Yeminü''d-Devle)'' ve ''Alemin Aslanı'' unvanlarını vermiştir. ''Ebu''l-Feth'' Sultan Alparslan''a, ''Doğunun ve Batının Hükümdarı'' Tuğrul Bey''e aittir.',
  'ÖSYM halifelerin Türk hükümdarlarına verdiği unvanları sıklıkla birbiriyle eşleştirerek sorar: Tuğrul Bey = Doğunun ve Batının Hükümdarı; Alparslan = Ebu''l-Feth; Gazneli Mahmut = Sultan / Zamanın Yeganesi / Alemin Aslanı.'
);

-- Soru tar_ti_007
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  1,
  'Gazneli Mahmut Hindistan üzerine tam 17 büyük sefer düzenlemiş ve bu seferler sonucunda İslamiyet bugünkü Pakistan, Bangladeş ve Hindistan coğrafyasına yayılmıştır. Gazneli Mahmut bu seferlerin ilk dördüne bizzat katılan ve bilim dünyasına eşsiz katkılar sunan ünlü bilgin için:

"Sarayımın en değerli hazinesidir!" ifadesini kullanmıştır.

Gazneli Mahmut''un bu övgüyle bahsettiği ve Asarü''l-Bakiye adlı eserin sahibi olan Türk-İslam bilgini aşağıdakilerden hangisidir?',
  '{"options": ["İbn Sina", "Farabi", "Biruni", "Harezmi", "Ali Kuşçu"], "correctIndex": 2}'::jsonb,
  'Gazneli Mahmut''un "Sarayımın en değerli hazinesi" dediği dahi bilgin Ebu Reyhan el-Biruni''dir. Biruni yerçekimini Newton''dan önce keşfetmiş, dünyanın çapını gerçeğe çok yakın hesaplamış ve jeodezi ilminin kurucusu kabul edilmiştir.',
  'Adaylar tıp ve felsefedeki şöhreti nedeniyle hemen İbn Sina (A şıkkı) veya Farabi''ye (B şıkkı) yönelebilir. Gazneli Mahmut sarayında himaye edilen ve Hindistan seferlerine katılan bilgin kesin olarak Biruni''dir.'
);

-- Soru tar_ti_008
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
  'Adaylar "Tapo Kağan Budizm''e girdi" bilgisini Gaznelilerle karıştırabilir veya III. öncülü dikkatsizce doğru sanabilir. Gaznelilerin Karahanlılardan temel farkı ulusçu değil, çok uluslu imparatorluk karakterinde olmalarıdır.'
);

-- Soru tar_ti_009
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1040 Dandanakan Savaşı sonrasında toplanan kurultayda bağımsızlığını resmen ilan eden Büyük Selçuklu Devleti; adını Selçuk Bey''den almakla birlikte devletin gerçek kurucusu Tuğrul Bey''dir.

Büyük Selçuklu Devleti ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Selçukluların bilinen en eski atası ''Demiryaylı'' lakaplı Dukak Bey''dir.", "Kuruluş döneminde başkent sırasıyla Nişabur, Rey ve İsfahan şehirlerine taşınmıştır.", "Devletin resmi yazışma dili ve edebiyat dili Farsça, bilim dili ise Arapça olmuştur.", "Oğuzların Üçoklar kolunun Kınık boyu tarafından kurulmuştur.", "Hükümdarları ilk kez ''Padişah'' unvanını kullanarak Orta Asya Türk unvanlarını tamamen terk etmiştir."], "correctIndex": 4}'::jsonb,
  'Tarihte ilk kez ''Padişah'' unvanını kullanan hükümdar Gazneli Alp Tigin''dir; Osmanlılar ve Selçuklular da bu unvandan yararlanmıştır. Ancak Selçuklu hükümdarları Tuğrul, Çağrı, Alparslan gibi saf Türkçe isimleri ve Yabgu/Sultan unvanlarını kullanmış, Orta Asya geleneklerini tamamen terk etmemiştir.',
  'Adaylar Selçukluların boyunu (Kınık) Osmanlıların boyu (Kayı) ile karıştırabilir. Selçuklular Oğuzların Üçok kolunun Kınık boyudur; Osmanlılar ise Bozok kolunun Kayı boyudur.'
);

-- Soru tar_ti_010
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti ile Bizans İmparatorluğu (ve müttefiki Gürcüler) arasında 1048 yılında yapılan, Gürcü Kralı Liparit''in esir alındığı ve tarihte Selçuklular ile Bizans arasındaki ilk büyük meydan savaşı kabul edilen muharebe aşağıdakilerden hangisidir?',
  '{"options": ["Malazgirt Savaşı", "Pasinler Savaşı", "Miryokefalon Savaşı", "Katvan Savaşı", "Yassı Çimen Savaşı"], "correctIndex": 1}'::jsonb,
  '1048 Pasinler Savaşı (Erzurum yakınları), Büyük Selçuklu ile Bizans arasındaki ilk büyük savaştır. Selçuklu ordusu İbrahim Yinal ve Kutalmış komutasında Bizans-Gürcü ordusunu mağlup etmiş ve Gürcü Kralı Liparit esir alınmıştır. Bu savaş Anadolu''ya yapılacak akınların kapısını aralamıştır.',
  'ÖSYM Bizans ile yapılan ilk savaşları kronolojik olarak tuzak yapar: Selçuklu-Bizans ilk savaşı = Pasinler (1048); Anadolu''nun kapısını açan = Malazgirt (1071); Anadolu''yu kesin Türk yurdu yapan = Miryokefalon (1176); Osmanlı-Bizans ilk savaşı = Koyunhisar/Bafeon (1302).'
);

-- Soru tar_ti_011
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Hükümdarı Tuğrul Bey, 1055 yılında gerçekleştirdiği Bağdat Seferi ile Abbasi halifesini esir tutan Şii Büveyhoğulları Devleti''ne tamamen son vermiştir.

Bu tarihi gelişmenin ardından Abbasi Halifesi Kaim Biemrillah''ın Tuğrul Bey''e ''Doğunun ve Batının Hükümdarı'' (Sultanü''l-Mağrib ve''l-Maşrık) unvanını verip altın taç giydirmesi, İslam dünyasında aşağıdakilerden hangisinin somut bir göstergesidir?',
  '{"options": ["Halifelik makamının resmen Büyük Selçuklu hanedanına geçtiğinin", "İslam dünyasındaki mezhep ayrılıklarının tamamen sona erdiğinin", "Siyasi ve askeri liderliğin Türklere geçtiği, halifenin ise yalnızca dini bir otorite olarak kaldığı laik/ikili iktidar yapısının doğduğunun", "Büyük Selçuklu Devleti''nin teokratik monarşiden meşruti monarşiye geçtiğinin", "Abbasi Devleti''nin hukuken ve fiilen tamamen yıkıldığının"], "correctIndex": 2}'::jsonb,
  'Tuğrul Bey''in Bağdat Seferi ile İslam dünyasının dünyevi/siyasi ve askeri liderliği Türklere geçmiştir. Halifelik unvanı Türklere geçmemiş, halife yalnızca dini/manevi lider olarak kalmıştır. Böylece din ile devlet işleri kurumsal olarak fiilen birbirinden ayrılmıştır.',
  'ÖSYM''nin en sevdiği klasik çeldirici: "Halifelik Selçuklulara / Tuğrul Bey''e geçti" (A şıkkı). Halifelik Selçuklulara asla geçmemiştir; Abbasi soyunda kalmıştır. Halifelik Türklere ilk kez 1517 Ridaniye Seferi ile Yavuz Sultan Selim zamanında geçecektir.'
);

-- Soru tar_ti_012
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Sultanı Alparslan, 1064 yılında Hristiyan dünyası için alınamaz kabul edilen Doğu Anadolu''daki müstahkem Ani (Kars) Kalesi ve şehrini fethetmiştir.

Bu büyük zaferin ardından Abbasi Halifesi tarafından Sultan Alparslan''a verilen ve "Fetihlerin Babası" anlamına gelen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Ebu''l-Feth", "Seyfüddin", "Ruknü''d-Din", "Melikü''l-Müluk", "Sultanü''l-Azam"], "correctIndex": 0}'::jsonb,
  'Kars Ani Kalesi''nin fethinden (1064) sonra Abbasi halifesi Sultan Alparslan''a ''Ebu''l-Feth'' (Fetihlerin Babası) unvanını tevcih etmiştir. Bu unvan doğrudan KPSS sınav sorularında defalarca yoklanmış kritik bir bilgidir.',
  'Adaylar bu unvanı Fatih Sultan Mehmet ile veya Tuğrul Bey''in unvanıyla karıştırabilir. Ani Kalesi fethi = Alparslan = Ebu''l-Feth eşleştirmesi kesindir.'
);

-- Soru tar_ti_013
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '26 Ağustos 1071 Malazgirt Meydan Muharebesi''nde Sultan Alparslan Bizans ordusunu mağlup etmiş ve Bizans İmparatoru Romen Diyojen esir alınmıştır.

Sultan Alparslan savaştan sonra komutanlarına hitaben "Toprak fethedenin malıdır ve fethedilen yer fetheden komutana kılıç hakkı olarak verilecektir" emrini vermiştir.

Alparslan''ın bu uygulamasının doğrudan sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu''da merkezi otoritenin tek bir merkezden eksiksiz yönetilmesi", "Anadolu''da I. Türk Beylikleri döneminin başlaması ve fethin hızlanması", "Bizans İmparatorluğu''nun Balkan topraklarına tamamen çekilerek yıkılması", "Türkmenlerin yerleşik hayata geçişinin Kurultay kararıyla yasaklanması", "Haçlı Seferleri tehlikesinin tamamen bertaraf edilmesi"], "correctIndex": 1}'::jsonb,
  'Kılıç hakkı politikası komutanları motive etmiş; Saltuklular, Mengücekliler, Danişmentliler ve Artuklular gibi I. Beylikler hızla kurularak Anadolu''nun fethi ve Türkleşmesi olağanüstü hızlanmıştır. Ancak beyliklerin kendi başına hareket etmesi merkezi otoriteyi zayıflatmıştır.',
  'Aday "merkezi otorite güçlendi" (A şıkkı) tuzağına düşebilir. "Toprak fethedenindir" kuralı fethi hızlandırır ama feodal beylikler ortaya çıkardığı için merkezi otoriteyi zayıflatır.'
);

-- Soru tar_ti_014
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
  'Bazı adaylar medreselerin sadece dini amaçla kurulduğunu zanneder; oysa I. öncüldeki "devlet memuru / bürokrat ihtiyacını karşılama" hedefi Nizamülmülk''ün Siyasetname''sinde bizzat belirttiği temel gayedir.'
);

-- Soru tar_ti_015
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
  'Adaylar "Oğuzlar Selçukluyu kurdu, devlete neden isyan etsin?" yanılgısına kapılabilir. Selçukluların Farsçayı resmi dil yapması ve İranlı bürokratları öne çıkarması kurucu Oğuzları küstürmüş ve büyük Oğuz İsyanı''na yol açmıştır.'
);

-- Soru tar_ti_016
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Abbasi Devleti''nin zayıflamasıyla merkezi otoriteden koparak İslam coğrafyasında kurulan küçük devletlere "Tevaif-i Mülük" denir.

868 yılında Abbasilerin Mısır valisi Tolunoğlu Ahmet tarafından kurulan, Mısır''da kurulan ilk Türk-İslam devleti olan ve halka din, ırk ayrımı gözetmeksizin ücretsiz sağlık hizmeti veren "Maristan" adlı hastaneleriyle ünlenen devlet aşağıdakilerden hangisidir?',
  '{"options": ["İhşidler (Akşitler)", "Tolunoğulları", "Eyyubiler", "Memlükler", "Fatimiler"], "correctIndex": 1}'::jsonb,
  'Mısır''da kurulan ilk Türk-İslam devleti Tolunoğulları''dır (868-905). Tolunoğlu Ahmet tarafından kurulmuş bir Tevaif-i Mülük devletidir. Maristan adı verilen hastane ve eczaneleri inşa etmişlerdir. Yöneticileri Türk, halkı ise yerli Arap ve Kıptilerden oluşmuştur.',
  'ÖSYM Mısır''da kurulan Türk devletlerinin kronolojisini ve ilklerini sorar: 1. Tolunoğulları (İlk kurulan / Maristan), 2. İhşidler (Hicaz''a hakim ilk Türk devleti), 3. Eyyubiler (Kudüs fatihi), 4. Memlükler (Moğolları yenen). Fatimiler ise Türk değil, Şii Arap devletidir.'
);

-- Soru tar_ti_017
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Ferganalı Muhammed bin Togaç tarafından kurulan; halife tarafından kendisine ak yüzlü, güneş gibi parlayan anlamına gelen "Akşit" unvanı verilen ve Türk tarihinde kutsal Hicaz bölgesine (Mekke ve Medine) egemen olan ilk Türk-İslam devleti aşağıdakilerden hangisidir?',
  '{"options": ["Tolunoğulları", "İhşidler (Akşitler)", "Eyyubiler", "Memlükler", "Osmanlı Devleti"], "correctIndex": 1}'::jsonb,
  'Hicaz bölgesine (Mekke, Medine, Taif, Hayber) egemen olan ilk Türk-İslam devleti İhşidler''dir (Akşitler). Kurucusu Muhammed bin Togaç''tır. İhşid kelime anlamı olarak "prens" veya "vali" demektir.',
  'Adaylar Hicaz denilince akıllarına ilk olarak Yavuz Sultan Selim ve Osmanlı Devleti''ni veya Memlükleri getirebilir. "Hicaz''a egemen olan İLK Türk devleti" sorulduğunda tartışmasız doğru cevap İhşidler''dir.'
);

-- Soru tar_ti_018
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1187 yılında Haçlı ordusuna karşı kazandığı Hıttin Savaşı ile 88 yıllık Haçlı işgaline son vererek Kudüs''ü geri alan, bu zaferiyle III. Haçlı Seferi''nin başlamasına yol açan ve "Kudüs Fatihi" olarak anılan Eyyubi hükümdarı aşağıdakilerden hangisidir?',
  '{"options": ["Sultan Baybars", "Selahaddin Eyyubi", "Seyfeddin Kutuz", "Nureddin Zengi", "Melikşah"], "correctIndex": 1}'::jsonb,
  '1187 Hıttin Savaşı ile Kudüs''ü Haçlılardan geri alan hükümdar Selahaddin Eyyubi''dir. Selahaddin Eyyubi Haçlılara karşı gösterdiği adalet ve merhametle hem Doğu''da hem Batı''da büyük saygı görmüş; Avrupalı şövalyeler arma (heraldik) sistemini Eyyubilerden örnek almıştır.',
  'Adaylar Moğolları yenen Sultan Baybars (A şıkkı) ile Kudüs fatihi Selahaddin Eyyubi''yi karıştırabilir. Hıttin Savaşı = Kudüs = Selahaddin Eyyubi ayrılmaz bir üçlüdür.'
);

-- Soru tar_ti_019
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Resmi yazışmalarında kendilerini "ed-Devletü''t-Türkiyye" (Türkiye Devleti) olarak tanımlayan Memlükler, Türk devlet geleneğindeki diğer devletlerden farklı özellikler göstermişlerdir.

Aşağıdakilerden hangisi Memlükler Devleti''nin diğer Türk-İslam devletlerinden ayrılan en belirgin özelliğidir?',
  '{"options": ["Hükümdarlığın saltanat usulüyle babadan oğula geçmeyip her güçlü ordu komutanının (emirin) sultan olma hakkına sahip olması", "Abbasi halifesini Moğol istilasından korumayarak halifelik makamını tamamen ortadan kaldırmaları", "Ordularında devşirme asker yerine yalnızca Moğol esirlerini istihdam etmeleri", "Hicaz bölgesine hiçbir zaman egemen olamamaları", "Resmi dillerini Türkçe ilan ederek Arapçanın kullanımını yasaklamaları"], "correctIndex": 0}'::jsonb,
  'Memlükler, "kut anlayışı ve kutun kan bağıyla hanedana geçmesi" kuralını uygulamayan tek Türk devletidir. Memlüklerde saltanat babadan oğula geçme kuralına bağlı kalmamış, ordunun desteğini arkasına alan her kudretli emir (komutan) sultan olabilmiştir.',
  'ÖSYM Memlüklerin bu "veraset sistemi istisnası"nı çok sever. Adaylar tüm Türk devletlerinde verasetin babadan oğula/hanedana geçtiğini ezberlediği için bu şıkkı şaşırtıcı bulabilir; oysa Memlüklerin en ayırt edici sınav kazanımı budur.'
);

-- Soru tar_ti_020
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  '1260 yılında Filistin''de yapılan Ayn Calud Savaşı ve 1277 yılındaki Elbistan Savaşı ile o güne kadar yenilmez kabul edilen Moğol (İlhanlı) ordularını dünya tarihinde ilk kez mağlup ederek durduran Türk-İslam devleti aşağıdakilerden hangisidir?',
  '{"options": ["Büyük Selçuklu Devleti", "Anadolu Selçuklu Devleti", "Memlükler", "Harzemşahlar", "Eyyubiler"], "correctIndex": 2}'::jsonb,
  'Moğolları tarihte ilk kez hezimete uğratan ve Batı''ya (Mısır ve Kuzey Afrika''ya) ilerleyişlerini durduran devlet Memlükler''dir. 1260 Ayn Calud Savaşı''nı Sultan Kutuz ve komutanı Baybars; 1277 Elbistan Savaşı''nı ise bizzat Sultan Baybars kazanmıştır.',
  'Adaylar Moğollarla savaşan Anadolu Selçuklu (Kösedağ''da yenildi) veya Harzemşahlar (Otrar''da yenildi) şıklarına yönelebilir. Moğolları yenen yegane Türk devleti Memlüklerdir.'
);

-- Soru tar_ti_021
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
  'Adaylar Dede Korkut''un Kıpçaklar veya Osmanlılar tarafından yazıya geçirildiğini zannedebilir. Dede Korkut''u derleyip kitaplaştıran Akkoyunlular''dır.'
);

-- Soru tar_ti_022
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
  'ÖSYM Timur''un "Türk dünyasına vurduğu iki zarar"ı sınavda çokça irdeler. Adaylar Altın Orda ve Osmanlı ile olan mücadelelerin sonuçlarını öncüllü sorularda ayırt etmelidir.'
);

-- Soru tar_ti_023
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Hindistan''da kurulan ve Yeni Çağ''da kurulup Yakın Çağ''da (1858) İngilizler tarafından yıkılan tek Türk-İslam devleti olan Babür İmparatorluğu''nda; Şah Cihan''ın genç yaşta vefat eden eşi Mümtaz Mahal (Ercüment Nurbanu Begüm) anısına Agra kentinde inşa ettirdiği, beyaz mermerden anıt mezar şaheseri aşağıdakilerden hangisidir?',
  '{"options": ["Taç Mahal", "Elhamra Sarayı", "İshak Paşa Sarayı", "Kuvvetü''l-İslam Camii", "Ribat-ı Mahi"], "correctIndex": 0}'::jsonb,
  'Hindistan''ın Agra kentindeki Taç Mahal, Babür Hükümdarı Şah Cihan tarafından eşi için yaptırılmış bir anıt mezardır. Mimarı Osmanlı mimarı Mimar İsa Efendi, hattatı ise Hattat Serdar Efendi''dir.',
  'Taç Mahal''in bir Türk-İslam devleti olan Babürler tarafından yaptırıldığı ve Osmanlı ustalarının (İsa Efendi) çalıştığı detayı adaylar tarafından Hindistan''a ait yerel bir tapınak zannedilerek gözden kaçırılabilir.'
);

-- Soru tar_ti_024
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Kendilerini Büyük Selçuklu Devleti''nin mirasçısı olarak gören Harzemşahlar; 1219 yılında Moğol kervanını casusluk iddiasıyla katlederek tarihte "Otrar Faciası"na yol açmış ve Cengiz Han ordularının İslam dünyasını istila etmesini tetiklemiştir.

Harzemşahlar Devleti''nin 1230 yılında Anadolu Selçuklu Sultanı I. Alaeddin Keykubad ile yaptığı Yassı Çimen Savaşı''nı kaybetmesinin Anadolu Türk tarihi açısından en ağır jeopolitik sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu Selçuklu Devleti''nin Moğollarla arasındaki tampon bölgenin ortadan kalkması ve Moğol istilasına açık hale gelmesi", "Bizans İmparatorluğu''nun Anadolu''yu tamamen geri alması", "Karamanoğulları Beyliği''nin bağımsızlığını ilan etmesi", "Anadolu Selçuklularında taht kavgalarının sona ermesi", "Haçlı Seferleri''nin sona ermesi"], "correctIndex": 0}'::jsonb,
  'Yassı Çimen Savaşı (1230) ile Anadolu Selçuklu Devleti Harzemşahları yenmiş ve Harzemşahlar kısa süre sonra İlhanlılar tarafından yıkılmıştır. Bu durum Anadolu ile Moğollar arasındaki koruyucu tampon bölgeyi yok etmiş ve 1243 Kösedağ Moğol İstilası''na doğrudan zemin hazırlamıştır.',
  'Adaylar zafer kazanıldığı için sonucun tamamen olumlu olduğunu zannedebilir; oysa Yassı Çimen zaferi stratejik olarak Selçukluları Moğol tehlikesiyle baş başa bırakan büyük bir jeopolitik hata olmuştur.'
);

-- Soru tar_ti_025
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  '1071 Malazgirt Zaferi''nden sonra Anadolu''da kurulan I. Dönem Türk Beylikleri ve mimari eserleri eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Danişmentliler $\ → $ Niksar Yağıbasan Medresesi (Anadolu''nun ilk Türk medresesi)", "Mengücekliler $\ → $ Divriği Ulu Camii ve Darüşşifası (UNESCO Mirası)", "Artuklular $\ → $ Diyarbakır Malabadi Köprüsü ve Cezeri''nin çalışmaları", "Saltuklular $\ → $ Erzurum Mama Hatun Kümbeti ve Kale Camii", "Çaka Beyliği $\ → $ Kayseri Gevher Nesibe Darüşşifası"], "correctIndex": 4}'::jsonb,
  'Kayseri Gevher Nesibe Darüşşifası ve Külliyesi, I. Gıyaseddin Keyhüsrev döneminde inşa edilmiş bir Anadolu Selçuklu Devleti eseridir; Çaka Beyliği''ne ait değildir. Çaka Beyliği İzmir ve çevresinde ilk denizci beyliktir.',
  'ÖSYM I. Beylikler ile eserlerini her yıl mutlaka sorar: Yağıbasan = Danişmentliler; Divriği = Mengücekliler; Malabadi/Cezeri = Artuklular; Mama Hatun = Saltuklular. Gevher Nesibe ise Anadolu Selçukluları''na aittir.'
);

-- Soru tar_ti_026
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Anadolu Selçuklu Sultanı II. Kılıç Arslan döneminde 1176 yılında Bizans İmparatoru Manuel Komnenos''a karşı kazanılan, tarihe "Kumdanlı" veya "Yurttutan Savaşı" olarak geçen Miryokefalon Zaferi''nin Türk tarihindeki en temel önemi aşağıdakilerden hangisidir?',
  '{"options": ["Anadolu''nun kapılarının Türklere ilk kez açılması", "Anadolu''nun kesin olarak Türk yurdu haline gelmesi ve Bizans''ın Türkleri Anadolu''dan atma ümidinin tamamen yok olması", "Osmanlı Devleti ile Bizans arasındaki ilk sınır çatışmasının başlaması", "Bizans İmparatorluğu''nun başkenti İstanbul''un kuşatılması", "Batı Anadolu''daki tüm denizci beyliklerin tek çatı altında birleştirilmesi"], "correctIndex": 1}'::jsonb,
  'Miryokefalon Zaferi (1176), Anadolu''nun tapusunun alındığı ve Anadolu''nun kesin Türk yurdu olduğunun tescillendiği savaştır. Bu zaferden sonra Batı ve Bizans kaynakları Anadolu için kalıcı olarak "Turchia (Türkiye)" adını kullanmaya başlamıştır.',
  'ÖSYM formülü: Pasinler = Keşif; Malazgirt = Yurt açan; Miryokefalon = Yurt tutan; Büyük Taarruz = Yurt kurtaran. Adaylar Malazgirt (kapı açan) ile Miryokefalon''u (kesinleştiren) karıştırmamalıdır.'
);

-- Soru tar_ti_027
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Anadolu Selçuklu Devleti ticareti canlandırmak ve Anadolu''yu uluslararası bir ticaret üssü haline getirmek amacıyla kapsamlı iktisadi politikalar uygulamıştır.

Aşağıdakilerden hangisi Anadolu Selçuklu Devleti''nin ticareti geliştirmeye yönelik uygulamalarından biri değildir?',
  '{"options": ["Kervanları haydutlarca soyulan veya batan tüccarların zararlarını devlet hazinesinden karşılayarak dünyada ilk kez devlet sigortacılığını başlatmaları", "Sinop, Antalya, Alanya (Alaiye) limanlarını fethedip Kırım''ın Sudak Limanı''na deniz aşırı sefer düzenlemeleri", "Venedik ve Kıbrıs Krallığı ile ticaret antlaşmaları yapıp düşük gümrük tarifesi uygulamaları", "Kayseri''de dünyanın ilk uluslararası fuarlarından biri olan ''Yabanlu Pazarı''nı kurmaları", "Düyun-u Umumiye İdaresi''ni kurarak yabancı tüccarların borçlarını tahsil etmelerine imkân tanımaları"], "correctIndex": 4}'::jsonb,
  'Düyun-u Umumiye (Genel Borçlar İdaresi), 1881 yılında Osmanlı Devleti''nin Muharrem Kararnamesi ile iflas etmesi üzerine Avrupalı alacaklı devletler tarafından kurulmuş 19. yüzyıl kurumudur; Selçuklularla ilgisi yoktur.',
  'Adaylar "devlet sigortacılığı" (A şıkkı) ve "Yabanlu Pazarı" (D şıkkı) gibi terimleri çok modern bulup seçeneklerde yanlış zannedebilir. Oysa bunlar Ramazan Yetgin notlarında ASD''nin ticari ilkleri olarak özel vurgulanan altın bilgilerdir.'
);

-- Soru tar_ti_028
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Anadolu Selçuklu Devleti''nde II. Gıyaseddin Keyhüsrev zamanında;
- 1240 yılında çıkan ve bastırılmasında devletin çok zorlanarak otoritesinin zayıfladığını açıkça gösteren Türk tarihinin ilk dini-sosyal nitelikli ayaklanması,
- Bu otorite boşluğunu fırsat bilen İlhanlı Moğollarının Selçuklu ordusunu hezimete uğrattığı ve Anadolu Türk siyasi birliğini parçalayan 1243 yılındaki savaş

aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Şeyh Bedrettin İsyanı – Otlukbeli Savaşı", "Baba İshak İsyanı – Kösedağ Savaşı", "Şahkulu İsyanı – Çaldıran Savaşı", "Bozoklu Celal İsyanı – Yassı Çimen Savaşı", "Canberdi Gazali İsyanı – Katvan Savaşı"], "correctIndex": 1}'::jsonb,
  '1240 Baba İshak İsyanı (Babailer Ayaklanması), Anadolu Selçuklu Devleti''nde çıkan ilk dini ve sosyal içerikli ayaklanmadır. İsyanın 2 yılda zor bastırılması Selçuklu zaafını ortaya çıkarmış ve 1243 Kösedağ Savaşı ile Moğollar Anadolu''yu istila ederek II. Beylikler dönemini başlatmıştır.',
  'ÖSYM Şeyh Bedrettin İsyanı (Osmanlı''nın ilk dini nitelikli isyanı) ile Baba İshak İsyanı''nı (Türk tarihinin ve Selçuklu''nun ilk dini nitelikli isyanı) sürekli çeldirici olarak karşılaştırır.'
);

-- Soru tar_ti_029
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
  'Adaylar "Türk tarihinde ilk kapitülasyonu Fatih veya Kanuni verdi" ezberine düşebilir. Oysa Türk tarihinde ilk kez yabancı bir devlete (Venedik) kapitülasyon tanıyan beylik Aydınoğulları''dır.'
);

-- Soru tar_ti_030
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Türklerin İslamiyet''i kabul etmesiyle birlikte hükümdarlık sembol ve unvanlarında köklü değişiklikler yaşanmıştır.

Aşağıdakilerden hangisi Türklerin İslamiyet''i kabul etmesinden SONRA kullanılmaya başlanan hükümdarlık alametlerinden biri değildir?',
  '{"options": ["Hutbe okutmak", "Kendi adına sikke (para) bastırmak", "Çetr (Ayetli hükümdarlık şemsiyesi)", "Hilat ve Tıraz giymek", "Kotuz (Sorguç) ve Otağ bulundurmak"], "correctIndex": 4}'::jsonb,
  'Kotuz (at veya yaban sığırı kuyruğu sorgucu) ve Otağ (hükümdar çadırı) İslamiyet öncesi dönemden beri var olan geleneksel bozkır sembolleridir. Hutbe, hilat (halifenin hediye ettiği cübbe), tıraz (halifenin adının işlendiği elbise) ve çetr ise İslamiyet''e geçişle birlikte gelen sembollerdir.',
  'ÖSYM "Hangisi İslamiyet''ten sonra gelmiştir / önce de vardır?" ayrımını çok sık yoklar. Para basmak İslam öncesinde Göktürk ve Türgişlerde de varken, İslam ile birlikte paranın üstüne İslam ibareleri ve halifenin adı (sikke) eklenmiştir. Otağ ve Kotuz ise İslam öncesine aittir.'
);

-- Soru tar_ti_031
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nde devlet işlerinin karara bağlandığı en yüksek yürütme ve danışma organı Divan-ı Saltanat''tır. Bu divana bağlı alt divanlar bulunmaktadır.

Aşağıdaki alt divan ve yürüttüğü temel görev eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Divan-ı İstifa $\ → $ Mali işlerden sorumlu olup başkanı Müstevfi''dir.", "Divan-ı Arz (Ceysü''l-Arz) $\ → $ Askeri işlerden ve ordunun ihtiyaçlarından sorumlu olup başkanı Emir-i Arz''dır.", "Divan-ı Tuğra (İnşa) $\ → $ Devletin iç ve dış yazışmalarını yürütüp fermanlara tuğra çeker; başkanı Tuğrai''dir.", "Divan-ı İşraf $\ → $ Askeri ve adli davaları temyiz eden mahkemedir; başkanı Kadıasker''dir.", "Niyabet-i Saltanat $\ → $ Sultan başkentte bulunmadığı zamanlarda devlet işlerini yürütür; başkanı Naib''dir."], "correctIndex": 3}'::jsonb,
  'Divan-ı İşraf bir mahkeme değildir; devletin mali ve idari işlerinin işleyişini, teşkilatın nizamını hükümdar adına teftiş eden genel denetim kuruludur ve başındaki görevliye Müşrif-i Memalik denir. Adli ve siyasi davalara Divan-ı Mezalim bakar.',
  'Adaylar Divan-ı İşraf (denetim) ile Divan-ı Mezalim (yargı) kavramlarını birbirine karıştırabilir. İşraf teftiş ve denetim organıdır.'
);

-- Soru tar_ti_032
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu ve Anadolu Selçuklu devletlerinde bizzat Sultanın başkanlık ettiği; ağır siyasi suçların (vatana ihanet), devlet memurları hakkındaki suiistimal şikayetlerinin, vakıfların denetiminin ve kadı kararlarına yapılan itirazların görüşülüp kesin hükme bağlandığı en üst yüksek yargı divanı aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı Pervane", "Divan-ı Berid", "Divan-ı Mezalim", "Divan-ı Has", "Divan-ı Mezarlık"], "correctIndex": 2}'::jsonb,
  'Divan-ı Mezalim, hükümdarın bizzat başkanlık ettiği, kadıların çözemediği veya itiraz edilen ağır davalara bakan, kamu görevlilerini denetleyen yüksek mahkemedir. Bu divan günümüzün Yargıtay ve Danıştay fonksiyonlarını icra eder.',
  'ÖSYM Divan-ı Mezalim''in başkanının Sultan olduğu bilgisini çok sorar. Birçok aday davalara Kadıü''l-Kudat''ın başkanlık ettiğini sanarak yanılır.'
);

-- Soru tar_ti_033
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Büyük Selçuklu Devleti''nde bulunmayıp yalnızca Anadolu Selçuklu Devleti''nde teşkilatlanan; ülke genelindeki ikta topraklarının dağıtımı, tahrir defterlerinin tutulması, mülk ve vakıf arazilerinin tahsisinden sorumlu olan ve Osmanlı Devleti''ndeki Nişancı makamının temeli kabul edilen divan ve başındaki görevli aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı İstifa – Müstevfi", "Divan-ı Pervane – Pervaneci", "Divan-ı Arz – Emir-i Arz", "Divan-ı Berid – Sahib-i Berid", "Divan-ı Tuğra – Münşi"], "correctIndex": 1}'::jsonb,
  'Divan-ı Pervane ve başındaki Pervaneci, yalnızca Anadolu Selçuklu Devleti''nde var olan özel bir divandır. İkta topraklarının kaydını tutar, dağıtır ve beratlarını hazırlar. Bu makam Osmanlı''daki Nişancı''nın Selçuklu karşılığıdır (Muineddin Pervane bu makamın en bilinen simasıdır).',
  'Ramazan Yetgin notlarında ünlemle belirtilen "KPSS Kesin Soru" başlığıdır. Aday Divan-ı Pervane''nin Büyük Selçuklu''da da olduğunu zanneder; oysa sadece Türkiye Selçukluları''na özgüdür.'
);

-- Soru tar_ti_034
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'İlk Türk-İslam devletlerinde hukuk sistemi şer''i ve örfi olmak üzere iki ana kola ayrılmıştır.

Buna göre, Türk-İslam hukuk yapısıyla ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Şer''i Mahkemelerin Başkanı $\ → $ Kadıü''l-Kudat", "Örfi Mahkemelerin Başkanı $\ → $ Emir-i Dad", "Askeri Davalara Bakan Hâkim $\ → $ Kadıasker (Kadıleşker)", "Şer''i Mahkemelerin Baktığı Davalar $\ → $ Miras, evlenme, boşanma, vakıf ve ticaret işleri", "Örfi Hukuk Kurallarının Kaynağı $\ → $ Yalnızca Kur''an-ı Kerim ve hadis hükümleri"], "correctIndex": 4}'::jsonb,
  'Örfi hukukun kaynağı Kur''an ve hadis değil; eski Türk töresi, kurultay kararları ve sultanların buyruklarıdır (Kur''an ve hadis şer''i hukukun kaynağıdır). Ancak örfi hukuk kuralları İslam dininin temel esaslarına aykırı olamaz.',
  'ÖSYM Emir-i Dad (örfi adalet başkanı) ile Kadıü''l-Kudat (şer''i adalet başkanı) ayrımını sıkça yoklar. Kadıasker ise ordudaki askerlerin davalarına bakar.'
);

-- Soru tar_ti_035
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Büyük Selçuklu Devleti''nde Vezir Nizamülmülk tarafından sistemli hale getirilen ve geliri devlet memurları ile komutanlara hizmetleri karşılığında tahsis edilen "İkta Sistemi" uygulanmıştır.

Aşağıdakilerden hangisi İkta Sistemi''nin devlete sağladığı faydalar arasında gösterilemez?',
  '{"options": ["Devlet hazinesinden doğrudan nakit para harcanmadan her an savaşa hazır devasa bir atlı ordu (cebelü) kurulması", "Tarımsal üretimin denetlenerek toprağın üst üste boş kalmasının engellenmesi ve üretimde sürekliliğin sağlanması", "Taşrada ikta sahipleri sayesinde merkezi otoritenin ve asayişin tesis edilmesi", "Toprakların mülkiyetinin şahıslara geçmesiyle özel mülkiyet ve toprak aristokrasisinin teşvik edilmesi", "Vergilerin düzenli ve yerinde toplanarak memur maaşlarının doğrudan karşılanması"], "correctIndex": 3}'::jsonb,
  'İkta sisteminde toprağın mülkiyeti daima devlete (Miri arazi) aittir; ikta sahibi toprağı satamaz, devredemez, miras bırakamaz. Bu sayede Avrupa''daki gibi toprak sahibi soylu bir sınıfın (aristokrasi / feodalite) doğması engellenmiştir.',
  'ÖSYM''nin en standart soru tipidir: "İkta sistemi feodaliteyi güçlendirir mi?" Hayır, aksine toprağın mülkiyeti devlette kaldığı için feodaliteyi engeller.'
);

-- Soru tar_ti_036
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'İlk Türk-İslam ordularında savaş esirlerinin veya satın alınan çocukların özel kışlalarda (gulamhane) yetiştirilerek doğrudan hükümdarın muhafız birliğine alınması esasına dayanan "Gulam Sistemi" uygulanmıştır.

Gulam Sistemi bünyesinde doğrudan sarayda hükümdarın şahsını koruyan ve üç ayda bir "Biştegani" adı verilen maaşı alan asker sınıfı aşağıdakilerden hangisidir?',
  '{"options": ["Gulaman-ı Saray", "Hassa Ordusu", "Sipahiler (Cebelüler)", "Yardımcı Kuvvetler", "Yiğitbaşılar"], "correctIndex": 0}'::jsonb,
  'Sarayda bizzat padişahı koruyan devşirme/esir kökenli maaşlı askerlere Gulaman-ı Saray denir ve 3 ayda bir aldıkları maaşa Biştegani denir. Bu sistem Osmanlı''daki Kapıkulu Ocağı''nın (Yeniçeriler) ve aldıkları "Ulufe" maaşının doğrudan öncüsüdür.',
  'Adaylar Hassa Ordusu ile Gulaman-ı Saray''ı karıştırabilir. Hassa ordusu vurucu asıl ordudur ve ikta gelirleriyle geçinir; Gulaman-ı Saray ise saray muhafızıdır ve Biştegani maaşı alır.'
);

-- Soru tar_ti_037
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Aristo''nun eserlerini şerh ederek Batı''da "Alpharabius", İslam felsefesinde ise Aristo''dan sonra gelen "İkinci Öğretmen" anlamında "Muallim-i Sani" unvanıyla tanınan; ilimleri ilk kez sınıflandıran (İhsaü''l-Ulum) ve "El-Medinetü''l-Fazıla" (Erdemli Şehir) adlı eserinde ideal devlet düzenini anlatan Türk-İslam filozofu kimdir?',
  '{"options": ["İbn Sina", "Farabi", "İbn Rüşd", "Gazali", "Biruni"], "correctIndex": 1}'::jsonb,
  'Farabi, İslam dünyasında pozitif bilimlerin ve felsefenin öncüsüdür. Muallim-i Sani (İkinci Öğretmen) olarak bilinir. Ayrıca dünyanın ilk modern müzik kitabı olan "Kitabü''l-Musiki"yi kaleme almıştır.',
  'ÖSYM "Muallim-i Sani" dendiğinde Farabi''yi, "Avicenna" dendiğinde İbn Sina''yı, "Averroes" dendiğinde İbn Rüşd''ü test eder. Üç unvan sınavların değişmez tuzak şıklarıdır.'
);

-- Soru tar_ti_038
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Avrupa''da "Avicenna" ve "Tıbbın Hükümdarı" olarak bilinen, mikropların varlığını ve bulaşıcı hastalıkları Newton ve Pasteur''den asırlar önce açıklayan, kaleme aldığı "El-Kanun fi''t-Tıb" (Tıbbın Kanunu) eseri yüzyıllarca Avrupa üniversitelerinde ders kitabı okutulan Türk-İslam bilgini aşağıdakilerden hangisidir?',
  '{"options": ["İbn Sina", "Zekeriya er-Razi", "İbnü''n-Nefs", "Cabir bin Hayyan", "Akşemseddin"], "correctIndex": 0}'::jsonb,
  'İbn Sina (Avicenna), tıp tarihinin en büyük dehalarındandır. El-Kanun fi''t-Tıb ve Kitabü''ş-Şifa en önemli eserleridir. Ayrıca fizikte ivme ve hareket konusunda "Kasr-ı Meyil" teorisini ortaya atmıştır.',
  'Zekeriya er-Razi (çiçek-kızamık farkı, El-Havi Ansiklopedisi) ile İbnü''n-Nefs (küçük kan dolaşımı) İbn Sina''nın en güçlü çeldiricileridir. Avicenna ve El-Kanun unvanları doğrudan İbn Sina''yı işaret eder.'
);

-- Soru tar_ti_039
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  3,
  'Artuklular döneminde Diyarbakır sarayında yaşayan; su saatleri, otomatik çalışan mekanik cihazlar ve şifreli kilitler geliştirerek dünya bilim tarihinde robotik ve sibernetik biliminin kurucusu kabul edilen ve mekanik çizimlerini "Kitabü''l-Hiyel" adlı eserinde toplayan bilim insanı kimdir?',
  '{"options": ["Ali Kuşçu", "Takiyüddin Mehmet", "El-Cezeri", "Harezmi", "Fezari"], "correctIndex": 2}'::jsonb,
  'El-Cezeri (İbnü''l-İzz), Cizreli dahi mühendistir. Artuklular himayesinde yaşamış, robotik ve otomatik kontrol (sibernetik) sisteminin temellerini atmıştır. Leonardo da Vinci''nin ilham kaynaklarındandır.',
  'Adaylar Osmanlı''da ilk rasathaneyi açan Takiyüddin Mehmet veya cebirin kurucusu Harezmi ile karıştırabilir. Sibernetik ve robotik denince tek isim Cezeri''dir.'
);

-- Soru tar_ti_040
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
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar döneminde yazılan ilk Türk-İslam yazılı edebi eserleri ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Yusuf Has Hacip $\ → $ Kutadgu Bilig (İlk siyasetname, Tamgaç Buğra Han''a sunulmuştur)", "Kaşgarlı Mahmut $\ → $ Divan-ı Lügati''t-Türk (İlk Türkçe sözlük, Halife el-Muktedi Billah''a sunulmuştur)", "Edip Ahmet Yükneki $\ → $ Atabetü''l-Hakayık (Hakikatlerin eşiği, ahlak ve tasavvuf kitabı)", "Ahmet Yesevi $\ → $ Divan-ı Hikmet (İlk Türk mutasavvıfı, Piri Türkistan)", "Ali Şir Nevai $\ → $ Şehname (Türk-İran mücadelelerini anlatan ilk Türkçe destan)"], "correctIndex": 4}'::jsonb,
  'Şehname, İranlı şair Firdevsi tarafından Gazneli Mahmut''a Farsça olarak sunulan bir eserdir (eserde Alp Er Tunga ''Afrasiyap'' olarak geçer). Ali Şir Nevai ise Timur döneminde Çağatay Türkçesiyle Türkçe''nin Farsça''dan üstün olduğunu savunan "Muhakemetü''l-Lügateyn"i yazmıştır.',
  'ÖSYM Ali Şir Nevai (Muhakemetü''l-Lügateyn) ile Kaşgarlı Mahmut''un (Divan-ı Lügati''t-Türk) amaçlarını birbirine karıştırarak sorar: Her ikisi de Türkçenin zenginliğini savunmuştur; Kaşgarlı Arapça''ya karşı, Ali Şir Nevai ise Farsça''ya karşı savunmuştur.'
);
