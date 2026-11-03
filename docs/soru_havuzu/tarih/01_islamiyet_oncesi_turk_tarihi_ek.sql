-- =====================================================================
-- ÜNİTE 1: İslamiyet Öncesi Türk Tarihi (EK 40 SORU: Test 5, 6, 7, 8)
-- Toplam Soru: 40 Soru (Mevcut 40 + Bu Ek 40 = 80 Soru / 8 Test)
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 41 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde hükümdarın erkek çocuklarına ''tigin'' adı verilmiş ve bu şehzadeler devlet tecrübesi kazanmaları amacıyla boyların veya bölgelerin başına yönetici olarak gönderilmiştir.

Tiginleri eğitmek ve devlet idaresinde yetiştirmekle görevli bilge öğretmenlere ve danışmanlara verilen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Atabey", "İnal (Ataman)", "Lala", "Aygucı", "Tarkan"], "correctIndex": 1}'::jsonb,
  'İslamiyet öncesi Türk devletlerinde tiginleri eğiten görevlilere ''İnal'', ''İnanç'' veya ''Ataman'' denirdi. Bu unvan, Büyük Selçuklu Devleti''nde ''Atabey'', Osmanlı Devleti''nde ise ''Lala'' adını almıştır.',
  'ÖSYM Selçuklu''daki ''Atabey'' veya Osmanlı''daki ''Lala'' kavramını çeldirici olarak çok sık kullanır. İslamiyet öncesi dönemde bu hocaların adı ''İnal'' ya da ''Ataman''dır.'
);

-- Soru 42 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İlk Türk devletlerinde hükümdarın meşruiyet kaynağını ilahi güce dayandıran ''Kut'' inancı bulunmaktaydı.

Kut inancının Türk devlet yapısında yol açtığı en belirgin siyasi sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Teokratik bir monarşi düzeninin kurulması ve din adamlarının mecliste çoğunluk sağlaması", "Ülke topraklarının hanedanın ortak malı sayılması ve taht kavgalarının kaçınılmaz hale gelmesi", "Halkın sınıflara ayrılarak kölelik düzeninin yerleşmesi", "Hükümdarın kararlarının Kurultay tarafından hiçbir şekilde denetlenememesi", "Ordunun sadece hükümdarın öz soyundan gelen askerlerden oluşturulması"], "correctIndex": 1}'::jsonb,
  'Kut kan yoluyla hükümdar ailesinin tüm erkek fertlerine geçtiği kabul edildiğinden, hanedanın her erkek üyesi tahta geçme hakkına sahip olmuştur. Bu durum ''Ülke hanedanın ortak malıdır'' veraset anlayışını doğurmuş, sık sık taht kavgalarına ve devletlerin kısa sürede parçalanmasına yol açmıştır.',
  'Kut ilahi kaynaklı olduğu için adaylar devleti ''Teokratik (din devleti)'' sanabilmektedir. Oysa eski Türk devletleri teokratik değildir; kamlar/şamanlar devlet yönetimine katılamazdı. Asıl siyasi sonuç veraset belirsizliği ve taht kavgalarıdır.'
);

-- Soru 43 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türklerde hükümet (bakanlar kurulu) anlamına gelen ''Ayukı''nın başında bulunan ve günümüzdeki başbakanlık makamına karşılık gelen vezire verilen unvan aşağıdakilerden hangisidir?',
  '{"options": ["Tudun", "Aygucı (Üge)", "Bitikçi", "Yargucı", "Buyruk"], "correctIndex": 1}'::jsonb,
  'İlk Türk devletlerinde hükümete ''Ayukı'', hükümet başkanına (vezir/başbakan) ise ''Aygucı'' veya ''Üge'' adı verilirdi. Vezir Tonyukuk Göktürkler döneminin en ünlü aygucısıdır.',
  'Tudun vergi memuru ve validir; Buyruk ise bakan demektir. Başbakan karşılığı olan unvan Aygucı''dır.'
);

-- Soru 44 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Orta Asya Türk kültürüne ait arkeolojik kazılarda ortaya çıkarılan kültür merkezleri tarih öncesi ve proto-Türk dönemine ışık tutmaktadır.

Orta Asya''nın en eski kültürü kabul edilen ve Türkmenistan''ın başkenti Aşkabat yakınlarında bulunan kültür bölgesi aşağıdakilerden hangisidir?',
  '{"options": ["Anav", "Afanasyevo", "Andronovo", "Karasuk", "Tagar"], "correctIndex": 0}'::jsonb,
  'Anav kültürü (MÖ 4000''ler), Aşkabat yakınlarında ortaya çıkarılan ve tüm Orta Asya''nın bilinen en eski kültür merkezidir. Türklerin en eski kültürü ise Afanasyevo''dur.',
  'En eski kültür sorulduğunda adayın aklı ''Afanasyevo''ya gidebilir. Ancak ''Orta Asya''nın en eski kültürü'' Anav kültürüdür; ''Türklerin (veya proto-Türklerin) en eski kültürü'' ise Afanasyevo''dur.'
);

-- Soru 45 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Karasuk kültürünü takip eden, MÖ 700 - 100 yılları arasına tarihlenen, demirin yanı sıra bronzdan mükemmel sanat eserlerinin üretildiği ve Orta Asya kültür merkezleri içerisinde en gelişmiş seviyeyi temsil eden kültür havzası aşağıdakilerden hangisidir?',
  '{"options": ["Kelteminar", "Anav", "Tagar", "Afanasyevo", "Andronovo"], "correctIndex": 2}'::jsonb,
  'Tagar kültürü, Yenisey Nehri civarında gelişen ve İslamiyet öncesi Orta Asya kültürleri arasında kronolojik olarak en son ve en gelişmiş olanıdır.',
  'Andronovo ilk tunç ve geniş yayılma alanı ile bilinir; en gelişmiş ve kronolojik olarak en geç kültür merkezi ise Tagar kültürüdür.'
);

-- Soru 46 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Asya Hun Devleti''nde Mete Han döneminde Çin baskı altına alınmış, Pai-teng Savaşı ile Çin imparatoru mağlup edilmiş ancak Mete Han Çin''i topraklarına katmayıp sadece vergiye bağlamayı tercih etmiştir.

Mete Han''ın Çin''i doğrudan fethedebilecek güce sahip olmasına rağmen Çin topraklarına yerleşmekten kaçınmasının temel sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Çin Seddi''nin aşılamayacak kadar sağlam olması", "Yoğun Çin nüfusu karşısında Türk milletinin milli benliğini ve asimilasyona uğramasını önlemek", "İpek Yolu ticaretinin yönünü Batı''ya çevirmek istemesi", "Kurultayın Çin''e yerleşme fikrini veto etmesi", "Ordudaki askerlerin tarım hayatına geçmek istemesi"], "correctIndex": 1}'::jsonb,
  'Mete Han, kalabalık Çin nüfusu arasına Türklerin yerleşmesi durumunda Türklerin asimile olup milli kimliklerini kaybedeceklerini görmüş; bu nedenle Çin''i sadece vergiye bağlayarak dışarıdan kontrol etmiştir.',
  'Çin Seddi''nin engel olduğu düşüncesi en popüler ilkokul yanılgısıdır; Hunlar Çin Seddi''ni defalarca aşmıştır. Temel neden demografik ve kültürel asimilasyon tehlikesidir.'
);

-- Soru 47 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Avrupa Hun Devleti hükümdarı Attila döneminde Doğu Roma (Bizans) üzerine I. ve II. Balkan Seferleri düzenlenmiş ve Bizans ağır vergilere bağlanmıştır.

Attila''nın Doğu Roma İmparatorluğu ile imzaladığı ve Bizans''ın Hunlara ödediği yıllık vergiyi üç katına çıkaran 447 tarihli antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Margos Antlaşması", "Anatolius Antlaşması", "Karasu Antlaşması", "Edirne Antlaşması", "İstanbul Antlaşması"], "correctIndex": 1}'::jsonb,
  'Attila, I. Balkan Seferi sonunda Margos Antlaşması''nı (434); II. Balkan Seferi sonunda ise Bizans''ı dize getirerek yıllık vergiyi üçe katlayan Anatolius Antlaşması''nı (447) imzalamıştır.',
  'Attila''nın Bizans ile yaptığı iki büyük antlaşma vardır: İlki Margos, ikincisi vergiyi katlayan Anatolius''tur. Adaylar Margos ile Anatolius''u kronolojik olarak karıştırır.'
);

-- Soru 48 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk toplumunda sosyal yapıyı oluşturan unsurlar küçükten büyüğe hiyerarşik bir bağ ile teşekkül etmiştir.

Buna göre Türk toplumunda ''aileler birliği / sülale'' anlamına gelen sosyal basamak aşağıdakilerden hangisidir?',
  '{"options": ["Oguş", "Urug", "Bodun", "Boy (Ok)", "İl (El)"], "correctIndex": 1}'::jsonb,
  'Eski Türk toplum yapısı: Oguş (Aile) -> Urug (Aileler Birliği / Sülale) -> Boy/Ok (Boylar / Kabileler) -> Bodun (Millet) -> İl/El (Devlet). Dolayısıyla aileler birliği ''Urug''dur.',
  'Oguş çekirdek ailedir; Urug ise bu ailelerin bir araya gelmesiyle oluşan sülaledir. Karıştırılmaması için ''Oguş: Anne-baba-çocuk, Urug: Akraba/Sülale'' ayrımı bilinmelidir.'
);

-- Soru 49 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Göktürk Devleti''nin kurucusu Bumin Kağan, devleti töre gereğince kardeşi İstemi Yabgu ile birlikte ikili teşkilat sistemiyle yönetmiştir.

İstemi Yabgu''nun İpek Yolu hakimiyeti ve ticaret kervanlarının güvenliği için Ak Hun Devleti''ne karşı ittifak kurduğu devlet aşağıdakilerden hangisidir?',
  '{"options": ["Bizans İmparatorluğu", "Sasani İmparatorluğu", "Çin", "Hazar Hakanlığı", "Emeviler"], "correctIndex": 1}'::jsonb,
  'İstemi Yabgu İpek Yolu''nu ele geçirmek için önce Sasanilerle ittifak yaparak Ak Hun Devleti''ne son vermiş; ardından güçlenen Sasanilere karşı Bizans İmparatorluğu ile diplomatik ittifak kurmuştur.',
  'İstemi Yabgu hem Bizans hem de Sasani ile ittifak kurmuştur. Ak Hunları yıkmak için Sasanilerle; daha sonra Sasanileri zayıflatmak için Bizans ile ittifak yapmıştır.'
);

-- Soru 50 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türklerde ölen kişinin ardından düzenlenen cenaze törenine, bu törenlerde okunan ağıtlara ve mezarın üzerine konulan mezar taşı niteliğindeki heykellere verilen isimler sırasıyla aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Yuğ - Sagu - Balbal", "Kurgan - Yuğ - Tamu", "Sagu - Balbal - Kurgan", "Uçmağ - Yuğ - Sagu", "Balbal - Sagu - Kurgan"], "correctIndex": 0}'::jsonb,
  'Cenaze törenine ''Yuğ'', bu törende okunan cenaze ağıtına ''Sagu'', kahramanın öldürdüğü düşman sayısı kadar mezarın başına dikilen heykelciklere ''Balbal'', mezara ise ''Kurgan'' denir.',
  'Kavramların birbirine benzemesi sebebiyle ''Yuğ'' (tören) ile ''Sagu'' (ağıt) ve ''Kurgan'' (mezar) sıklıkla karıştırılır.'
);

-- Soru 51 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  '375 yılında Hunların Balamir öncülüğünde Karadeniz''in kuzeyinden batıya doğru ilerleyerek Ostrogot, Vizigot, Vandal ve Frank gibi Cermen kavimlerini yerlerinden etmesiyle Kavimler Göçü başlamıştır.

Aşağıdakilerden hangisi Kavimler Göçü''nün dünya tarihi açısından doğurduğu sonuçlardan biri değildir?',
  '{"options": ["Roma İmparatorluğu''nun 395 yılında Doğu ve Batı olmak üzere ikiye ayrılması", "Avrupa''da merkezi krallıkların zayıflaması ve Feodalite (derebeylik) rejiminin ortaya çıkması", "Avrupa''da Hristiyanlığın tamamen terk edilerek Gök Tanrı inancının yaygınlaşması", "Avrupa milletlerinin ve günümüz Avrupa etnik haritasının temellerinin atılması", "Skolastik düşüncenin ve Katolik Kilisesi''nin otoritesinin güçlenmesi"], "correctIndex": 2}'::jsonb,
  'Kavimler Göçü sonrasında Hristiyanlık terk edilmemiş, tam tersine Avrupa''ya giden kavimler (ve sonrasında Avrupa Hunları ile diğer Türk boyları) zamanla Hristiyanlığı benimsemiştir. Kilisenin gücü artmış ve skolastik düşünce egemen olmuştur.',
  'Türklerin Avrupa''ya gitmesi kültürel etkileşim doğursa da dini anlamda Türk inancı Avrupa''ya hakim olmamış, aksine Türkler Hristiyanlaşarak benliklerini kaybetmiştir.'
);

-- Soru 52 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Hazar Kağanlığı, 7. ve 9. yüzyıllar arasında Karadeniz''in kuzeyi ve Kafkaslar bölgesinde güçlü bir siyasi egemenlik kurmuş, ticaret yollarının güvenliğini sağlayarak bölgede istikrar ortamı tesis etmiştir.

Tarihte bu döneme ''Hazar Barış Çağı'' (Pax Chazarica) denmesinde ve Hazarların dini yapısında görülen en özgün özellik aşağıdakilerden hangisidir?',
  '{"options": ["Yöneticilerinin Museviliği benimsemesine rağmen ülkede İslamiyet, Hristiyanlık, Şamanizm ve Museviliğin bir arada barış içinde yaşayıp davalara 7 kişilik farklı dinlerden hakimler kurulunun bakması", "Sadece tek bir dini ibadethaneye izin verilip diğer inançların yasaklanması", "Tarihte ilk kez resmi devlet dinini Budizm olarak ilan etmeleri", "Bizans ile hiçbir ticari ve siyasi ilişkiye girmemeleri", "Ordularının tamamını sadece Musevi asıllı Türklerden oluşturmaları"], "correctIndex": 0}'::jsonb,
  'Hazarlar, yöneticileri Musevi olan tek Türk devletidir. Hazar ülkesinde Musevi, Hristiyan, Müslüman ve Şamanist halk tam bir hoşgörü içinde yaşamış; mahkemelerde her dinin temsilcisi olan 7 kişilik hakimler heyeti görev yapmıştır.',
  'Hazarların Musevi olduğu bilinir fakat teokratik bir baskı kurdukları yanılgısına düşülebilir. Pax Chazarica''nın temel özelliği dini hoşgörü ve karma hakimler heyetidir.'
);

-- Soru 53 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Doğu Avrupa''da Tuna boylarında hanlık kuran İtil (Volga) Bulgarları, Müslüman tüccarlar vasıtasıyla İslamiyet''i tanımış ve 10. yüzyılda hükümdarları Almış Han döneminde İslamiyet''i resmi devlet dini olarak kabul etmişlerdir.

İtil Bulgarlarının İslam dinini resmi olarak kabul etmesi üzerine Abbasi Halifesi Muktedir Billah''ın gönderdiği elçilik heyetinde yer alan ve seyahatnamesinde Türk coğrafyasını ayrıntılı tasvir eden ünlü seyyah kimdir?',
  '{"options": ["İbn-i Batuta", "İbn-i Fadlan", "Evliya Çelebi", "Marco Polo", "Priskos"], "correctIndex": 1}'::jsonb,
  'İbn-i Fadlan, Abbasi halifesinin 921-922 yıllarında İtil Bulgar Hanlığı''na gönderdiği elçilik heyetinde katip olarak bulunmuş ve gördüklerini dünyaca ünlü eseri ''Rihle'' (Seyahatname) adlı kitabında kaleme almıştır.',
  'İbn-i Batuta 14. yüzyıl seyyahıdır. İtil Bulgarlarını ve Almış Han''ı ziyaret eden 10. yüzyıl seyyahı İbn-i Fadlan''dır.'
);

-- Soru 54 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Türk tarihinde devlet kuramamış ancak güçlü bir askeri teşkilata sahip olarak 1071 Malazgirt Savaşı''nda Bizans ordusunda ücretli asker iken Selçuklu tarafına geçerek savaşın kaderini değiştiren Türk toplulukları aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Peçenekler - Uzlar (Oğuzlar)", "Avarlar - Bulgarlar", "Hazarlar - Macarlar", "Kumanlar - Kıpçaklar", "Türgişler - Kırgızlar"], "correctIndex": 0}'::jsonb,
  'Peçenekler ve Uzlar (Hristiyanlaşmış Oğuzlar) devlet kuramamış boy teşkilatı halinde yaşamışlardır. Bizans ordusunda paralı askerlik yaparken Malazgirt Meydan Muharebesi''nde Alparslan''ın safına geçerek Türklerin zaferinde kritik rol oynamışlardır.',
  'Kumanlar (Kıpçaklar) da Doğu Avrupa''da etkilidir ancak Malazgirt Savaşı sırasında saf değiştiren ikili Peçenekler ve Uzlar''dır.'
);

-- Soru 55 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Hem Orta Asya''da hem de Orta Avrupa''da (Pannonia) devlet kuran, 626 yılında Sasanilerle ittifak kurarak İstanbul''u tarihte ilk kez kuşatan Türk devleti aşağıdakilerden hangisidir?',
  '{"options": ["Avarlar (Juan-Juan)", "Hunlar", "Hazarlar", "Bulgarlar", "Uygurlar"], "correctIndex": 0}'::jsonb,
  'Avarlar, Göktürklerin baskısıyla batıya göç ederek Orta Avrupa''da devlet kurmuş; 619 ve 626 yıllarında İstanbul''u kuşatan ilk Türk devleti olmuştur. Ayrıca Slav kavimlerini ordu ve devlet teşkilatlanması açısından derinden etkilemişlerdir.',
  'İstanbul''u kuşatan ilk Türk devleti Avarlar''dır. Kuşatan ilk Müslüman Türk devleti ise Çaka Beyliği''dir; Osmanlı ise fethedecektir. Bu ayrım ÖSYM klasiğidir.'
);

-- Soru 56 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Rusların ünlü ''İgor Destanı''na konu olan, sarışın ve mavi gözlü fiziki özellikleriyle bilinen, Karadeniz''in kuzeyindeki Deşt-i Kıpçak bölgesine adını veren ve günümüzde Codex Cumanicus adlı sözlükleriyle tanınan Türk boyu aşağıdakilerden hangisidir?',
  '{"options": ["Kumanlar (Kıpçaklar)", "Peçenekler", "Sabirler", "Başkurtlar", "Karluklar"], "correctIndex": 0}'::jsonb,
  'Kumanlar (Kıpçaklar), Ruslarla yaptıkları mücadelelerle İgor Destanı''na, Oğuzlarla yaptıkları mücadelelerle de Dede Korkut Hikayeleri''ne konu olmuşlardır. İki ciltlik Latince-Farsça-Kıpçakça sözlük olan ''Codex Cumanicus'' bu boya aittir.',
  'Dede Korkut ve İgor Destanı''nın ortak muhatabı Kumanlar/Kıpçaklar''dır. Peçeneklerle sıkça karıştırılır.'
);

-- Soru 57 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Kendi adına bağımsız madeni para (yarmak) bastıran ilk Türk hükümdarı kimdir ve hangi Türk devletine mensuptur?',
  '{"options": ["Baga Tarkan - Türgişler", "Mete Han - Asya Hunları", "Bumin Kağan - Göktürkler", "Bögü Kağan - Uygurlar", "Bayyan Kağan - Avarlar"], "correctIndex": 0}'::jsonb,
  'Türgiş hükümdarı Baga Tarkan, 8. yüzyıl başlarında kendi adına madeni para (yarmak) bastıran ilk Türk hükümdarıdır. Bu durum Türgişlerde bağımsızlık anlayışını ve gelişmiş bir ticaret ekonomisini gösterir.',
  'Uygurlar kağıt para (çav) kullanmıştır; madeni parayı hükümdar adına ilk bastıran ise Türgiş hükümdarı Baga Tarkan''dır.'
);

-- Soru 58 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Cengiz Han önderliğinde kurulan Moğol İmparatorluğu''na itaat eden ilk Müslüman Türk topluluğu ile ilk gayrimüslim Türk devleti eşleştirmesi aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Karluklar - Kırgızlar", "Karluklar - Uygurlar", "Oğuzlar - Türgişler", "Yağmalar - Hazarlar", "Kıpçaklar - Bulgarlar"], "correctIndex": 0}'::jsonb,
  'Moğollara itaat eden ilk Türk devleti Kırgızlar (1207); Moğollara itaat eden ilk Müslüman Türk boyu/topluluğu ise Karluklar''dır. Uygurlar da Moğollara itaat ederek Moğol devlet kademesinde memur ve katiplik (Türkleşme) yapmışlardır.',
  'ÖSYM ''ilk itaat eden Türk devleti'' (Kırgızlar) ile ''ilk itaat eden Müslüman Türk topluluğu'' (Karluklar) ayrımını sık sık seçeneklere koyar.'
);

-- Soru 59 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Dünyanın en uzun destanı kabul edilen, günümüzde de canlılığını koruyan ve Kırgızların milli kimliğini, mücadelelerini ve kültürünü anlatan destan aşağıdakilerden hangisidir?',
  '{"options": ["Manas Destanı", "Oğuz Kağan Destanı", "Ergenekon Destanı", "Türeyiş Destanı", "Alp Er Tunga Destanı"], "correctIndex": 0}'::jsonb,
  'Manas Destanı Kırgızlara aittir ve 500 binden fazla dizesiyle dünyanın en uzun canlı destanı unvanına sahiptir.',
  'Oğuz Kağan Destanı Hunlara; Ergenekon ve Bozkurt Göktürklere; Türeyiş ve Göç Uygurlara aittir.'
);

-- Soru 60 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Orta Asya''da kurulan ilk Türk devletlerinde kağanın yanında yönetimde söz sahibi olan, yabancı elçileri kabul eden, kurultaya katılan ve fermanlara kağanla birlikte imza atan hükümdar eşine ne ad verilirdi?',
  '{"options": ["Hatun (Katun)", "Tigin", "Şad", "Yabgu", "Tarkan"], "correctIndex": 0}'::jsonb,
  'Hatun (Katun), eski Türklerde kadının devlet yönetimindeki yüksek statüsünü simgeler. Kurultaya katılır, kağan seferdeyken devleti temsil eder ve elçi kabul edebilirdi. ''Kağan ve Hatun emrediyor ki...'' ibaresi olmadan buyruklar geçerli sayılmazdı.',
  'Hatun makamı sadece bir hanedan eşi değil, protokolde kağanın yanında yer alan siyasi bir makamdır.'
);

-- Soru 61 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk devletlerinde toplum hayatını ve devlet işleyişini düzenleyen yazısız hukuk kurallarına ''Töre'' adı verilirdi.

Aşağıdakilerden hangisi törenin değişmez temel ilkeleri (esasları) arasında yer almaz?',
  '{"options": ["Könilik (Adalet)", "Uzluk (Faydalılık / İyilik)", "Tüzlük (Eşitlik)", "Kişilik (İnsanlık)", "Mutlakiyet (Sınırsız Kağan İradesi)"], "correctIndex": 4}'::jsonb,
  'Törenin 4 değişmez ilkesi vardır: Könilik (adalet), Uzluk (iyilik/faydalılık), Tüzlük (eşitlik) ve Kişilik/Kölilik (insanlık). Kağan dahi töreye uymak zorundadır; kağanın iradesi sınırsız (mutlakiyet) değildir.',
  'Adaylar eski Türk kağanlarını sınırsız yetkili sanabilir. Oysa töre kağanın üzerindedir ve töreye uymayan kağan kurultay tarafından tahttan indirilebilirdi.'
);

-- Soru 62 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Uygurlara kadar Türklerde uzun süreli hapis cezası yoktur; göçebe hayat hapis süresini 10 gün ile sınırlandırmıştır.'
);

-- Soru 63 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türk ordusunun temel özellikleri arasında aşağıdakilerden hangisi gösterilemez?',
  '{"options": ["Mete Han tarafından kurulan ve günümüz dünya ordularında da uygulanan ''Onlu Sistem''in esas alınması", "Toplumun ''Ordu-Millet'' anlayışıyla eli silah tutan kadın-erkek her ferdinin asker sayılması", "Ordunun vur-kaç, sahte ricat (geri çekilme) ve Turan (Hilal/Kurt Kapanı) taktiklerini başarıyla uygulaması", "Hükümdar muhafız alaylarının tamamen maaşlı paralı lejyonerlerden teşkil edilmesi", "Ordunun temelini süvari (atlı) birliklerin oluşturması ve hafif ok-yay teçhizatının kullanılması"], "correctIndex": 3}'::jsonb,
  'Eski Türk devletlerinde (Hazarlar hariç) ordu paralı askerlerden oluşmazdı. ''Ordu-millet'' anlayışı vardı; her fert vatan savunmasında doğal askerdi. Paralı askerlik Türk geleneklerine aykırıdır.',
  'Hazarlar ordusunda ücretli asker bulunduran İSTİSNA Türk devletidir. Genel Türk devletleri için ''ücretli askerlik'' kesinlikle yanlıştır.'
);

-- Soru 64 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Türklerin göçebe bozkır kültüründen yerleşik kent kültürüne geçişi mimari, dini ve toplumsal alanda köklü değişimlere yol açmıştır.

Türk tarihinde yerleşik hayata geçen ilk Türk devleti ve bu dönemde Maniheizm tapınaklarına verilen isim aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Uygurlar - Stupa", "Göktürkler - Kümbet", "Hunlar - Kurgan", "Karluklar - Cami", "Avarlar - Katedral"], "correctIndex": 0}'::jsonb,
  'Bögü Kağan döneminde Maniheizm''i kabul eden Uygurlar yerleşik hayata geçen ilk Türk devletidir. Mani dini tapınaklarına ''Stupa'' adı verilmiş, fresk (duvar resmi) ve minyatür sanatı gelişmiştir.',
  'Kümbet Türk-İslam mimarisinin anıt mezarıdır; Uygurların Mani tapınakları ise Stupa''dır.'
);

-- Soru 65 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türk sanatında hayvanların birbirleriyle mücadelesini tasvir eden, kemer tokaları, kılıç kınları, at koşum takımları ve çadır örtülerine pars, kurt, kartal, geyik ve at figürlerinin işlendiği sanat üslubuna ne ad verilir?',
  '{"options": ["Hayvan Üslubu", "Barok Üslubu", "Gotik Sanat", "Fresk Ekolü", "Minyatür Sanatı"], "correctIndex": 0}'::jsonb,
  'İslamiyet öncesi bozkır Türk sanatının temeli ''Hayvan Üslubu''dur. İskitler ve Hunlar taşınabilir eşyalar üzerine maden işlemeciliğiyle hayvan figürlerini ustalıkla nakşetmişlerdir.',
  'Taşınabilir sanat eserleri göçebe yaşamın sonucudur. Türklerin dünya sanatına en özgün katkılarından biri ''Hayvan Üslubu''dur.'
);

-- Soru 66 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Kazakistan''ın Almatı kenti yakınlarında Esik Kurganı''nda bulunan, MÖ 5. - 4. yüzyıllara ait saf altından zırhı ve miğferiyle dünya arkeoloji literatürüne geçen ''Altın Elbiseli Adam'' zırhı hangi erken dönem Türk topluluğuna aittir?',
  '{"options": ["İskitler (Sakalar)", "Uygurlar", "Göktürkler", "Türgişler", "Kırgızlar"], "correctIndex": 0}'::jsonb,
  'Esik Kurganı''nda çıkarılan Altın Elbiseli Adam zırhı İskitlere (Sakalara) aittir. İskitlerin maden işlemeciliğindeki yüksek dehası nedeniyle tarihte ''Bozkırın Kuyumcuları'' olarak adlandırılmışlardır.',
  'Esik Kurganı ve Altın Elbiseli Adam çoğu kaynakta Hunlar ile karıştırılır; arkeolojik olarak İskitlere aittir.'
);

-- Soru 67 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Rus arkeolog Sergey Rudenko tarafından Altay Dağları eteklerinde buzullar içinde keşfedilen, MÖ 5. - 3. yüzyıllara ait dünyanın en eski düğümlü yün halısı (Pazırık Halısı) hangi kurganda bulunmuştur ve hangi Türk devletine aittir?',
  '{"options": ["Pazırık Kurganı - Asya Hun Devleti", "Esik Kurganı - İskitler", "Noin Ula Kurganı - Göktürkler", "Hoytu Tamır Kurganı - Uygurlar", "Şine Usu Kurganı - Avarlar"], "correctIndex": 0}'::jsonb,
  'Pazırık Kurganı''nda bulunan dünyanın en eski halısı olan ''Pazırık Halısı'' Asya Hun Devleti dönemine aittir. Gördes (Türk) çifte düğüm tekniğiyle dokunmuştur ve halen St. Petersburg Hermitage Müzesi''nde sergilenmektedir.',
  'Pazırık Halısı Hunlara; Altın Elbiseli Adam ise İskitlere aittir. ÖSYM bu iki arkeolojik buluntuyu birbirinin çeldiricisi olarak sıkça sorar.'
);

-- Soru 68 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türklerde dini inanış ve kavramlarla ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Uçmağ - Cennet", "Tamu - Cehennem", "Kam (Baksı) - Din adamı / Şaman", "Balbal - Kurban edilen koç veya at", "Kült - Kutsal sayılan ata veya tabiat gücü inancı"], "correctIndex": 3}'::jsonb,
  'Balbal, kurban edilen hayvan değil; ölen savaşçının sağlığında öldürdüğü düşman sayısı kadar mezarının çevresine dikilen insan biçimli küçük taş heykellerdir.',
  'Balbalın heykelcik olduğu unutulup kurban veya mezar hediyesiyle karıştırılabilmektedir.'
);

-- Soru 69 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'Eski Türklerde zamanı tespit etmek ve mevsimleri takip etmek amacıyla geliştirilen, her yıla bir hayvan adının verildiği ve güneş yılı esaslı olarak hazırlanan takvim aşağıdakilerden hangisidir?',
  '{"options": ["12 Hayvanlı Türk Takvimi", "Hicri Takvim", "Celali Takvim", "Rumi Takvim", "Miladi Takvim"], "correctIndex": 0}'::jsonb,
  '12 Hayvanlı Türk Takvimi Türklerin bizzat hazırladığı milli güneş takvimidir. 12 yılda bir devreder ve her yıl bir hayvan adıyla (Sıçan, Ud/Sığır, Pars, Tavşan, Ejder, Yılan, Yunt/At, Koyun, Biçin/Maymun, Tavuk, İt/Köpek, Domuz) anılır.',
  'Celali Takvim Büyük Selçuklu''da Ömer Hayyam tarafından hazırlanmıştır. Türklerin İslam öncesi milli takvimi 12 Hayvanlı Türk Takvimi''dir.'
);

-- Soru 70 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  2,
  'İslamiyet öncesi Türk edebiyatında sözlü dönem ürünleri arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Koşuk", "Sagu", "Sav", "Destan", "Mesnevi"], "correctIndex": 4}'::jsonb,
  'Mesnevi, İslamiyet''in kabulünden sonra Arap ve özellikle Fars edebiyatından Türk edebiyatına geçen aruz ölçülü bir nazım şeklidir. Koşuk (şiir), Sagu (ağıt), Sav (atasözü) ve Destan ise İslamiyet öncesi Türk sözlü edebiyat türleridir.',
  'Sav atasözü, Koşuk aşk-doğa şiiridir. Mesnevi ise İslami dönem divan edebiyatı türüdür.'
);

-- Soru 71 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'ÖSYM bazen kitabelerin yazarı Yolluğ Tigin''i veya Danimarkalı Thomsen''i sorar. Öncüllerin hepsi kritik ÖSYM kazanımıdır.'
);

-- Soru 72 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Orhun Kitabeleri''nde ilk dikilen ve bizzat kendi hatıralarını halk diliyle sade bir üslupla taşa kazıtan, Türk tarihinin ilk tarihçisi ve hatibi (yazarı) kabul edilen devlet adamı kimdir?',
  '{"options": ["Vezir Tonyukuk", "Kül Tigin", "Bilge Kağan", "Yolluğ Tigin", "Bumin Kağan"], "correctIndex": 0}'::jsonb,
  'Vezir Tonyukuk Abidesi 726 yılında dikilmiştir ve diğer iki kitabeden önce yer alır. Tonyukuk kendi anılarını ve Göktürk bağımsızlık mücadelesini bizzat kaleme aldığı için ''Türklerin ilk tarihçisi ve veziri'' sayılır.',
  'Kitabelerin edebi yazarı Yolluğ Tigin''dir; ancak kendi diktirdiği anıtı bizzat yazdıran ve ilk tarihçi kabul edilen devlet adamı Vezir Tonyukuk''tur.'
);

-- Soru 73 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Uygurlara ait yazılı anıtlar arasında yer alan ve Uygurların Maniheizm dinini kabul edişini, kurdukları şehirleri ve kağanlarının kahramanlıklarını anlatan iki dilli (Türkçe ve Soğdca) kitabe aşağıdakilerden hangisidir?',
  '{"options": ["Karabalgasun Yazıtı", "Moyen-Çur (Şine Usu) Yazıtı", "Bugut Yazıtı", "Taryat (Terhin) Yazıtı", "Yenisey Kitabeleri"], "correctIndex": 0}'::jsonb,
  'Karabalgasun Yazıtı (821), Uygurların başkenti Ordubalık yakınlarında bulunmuştur ve Maniheizm''in kabulünü anlatan Türkçe, Soğdca ve Çince yazılmış tarihi belgedir.',
  'Bugut Yazıtı I. Göktürk dönemine aittir. Yenisey Kırgızlara aittir. Maniheizm''i anlatan Uygur yazıtı Karabalgasun''dur.'
);

-- Soru 74 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Göktürk Devleti''nin 630-680 yılları arasında Çin esareti altında kaldığı 50 yıllık ''Matem Dönemi''nde bağımsızlığı kazanmak amacıyla 39 arkadaşıyla birlikte Çin İmparatorluk Sarayı''nı basan ve Türk milliyetçiliğinin abide kahramanı olan Türk komutan kimdir?',
  '{"options": ["Kürşad", "İlteriş Kağan", "Kül Tigin", "Baga Tarkan", "Kapgan Kağan"], "correctIndex": 0}'::jsonb,
  'Kürşad (Çin kaynaklarında Chieh-she-shuai), 639 yılında 39 yiğidi ile Çin sarayını basarak esaret altındaki Türk milletine bağımsızlık kıvılcımı yakan efsanevi komutandır.',
  'İlteriş Kağan bağımsızlığı sağlayan devleti kuran kağandır; esaret yıllarındaki saray baskınını gerçekleştiren komutan ise Kürşad''dır.'
);

-- Soru 75 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'İslamiyet öncesi Türk devletlerinde ''Kurultay'' (Toy / Kengeş) meclisi ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Kurultay üyelerine ''Toygun'' adı verilirdi.", "Boy beyleri, hatun ve devlet ileri gelenleri kurultayın doğal üyeleriydi.", "Kağan seçiminde, savaş ve barış kararlarında kurultayın bağlayıcı veya danışma niteliğinde yetkileri vardı.", "Din adamları (kamlar/baksılar) kurultayda veto hakkına sahip daimi üye olarak bulunurdu.", "Kurultayda boy beylerinin oturma düzenine ''orun'', ziyafetteki et paylarına ise ''ülüş'' denirdi."], "correctIndex": 3}'::jsonb,
  'Eski Türklerde Kurultay''da din adamları (kam, şaman, baksı) ASLA yer almazdı. Bu durum Türk devletlerinin teokratik olmadığının ve laik bir yönetim anlayışının en somut kanıtıdır.',
  'Çok güçlü bir sınav tuzağıdır: Adaylar eski meclislerde ruhbanların bulunduğunu zanneder. Türk kurultaylarında din adamları üye DEĞİLDİR.'
);

-- Soru 76 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Eski Türk devlet teşkilatında yer alan kavram ve görevli eşleştirmelerinden hangisi yanlış verilmiştir?',
  '{"options": ["Tudun - Vergi memuru ve sivil vali", "Bitikçi (Tamgacı) - Katip ve hükümdar mührünü basan görevli", "Yargucı - Adalet işlerinden sorumlu yargıç", "Tarkan - Ordu komutanı / General", "Ağılığ - Yabancı elçileri ağırlayan protokol şefi"], "correctIndex": 4}'::jsonb,
  'Ağılığ (veya Ağıcı), protokol şefi değil, devlet hazinesinden ve maliyeden sorumlu ''hazinedar''dır. Dolayısıyla eşleştirme yanlıştır.',
  'Ağılığ kelimesi ''ağırlamaktan'' türemiş gibi gelebilir ve adayı protokol/elçi ağırlama şıkkına çekebilir. Oysa ağılık hazinedir, ağılığ hazinedardır.'
);

-- Soru 77 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'ÖSYM''nin en sevdiği tuzak soru tipidir: ''Hangisi İslamiyet öncesi hükümdarlık sembolü değildir?'' -> Cevap: Hutbe, Hilat, Menşur, Çetr (İslamiyet sonrasıdır!).'
);

-- Soru 78 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Sasaniler ile anlaşarak Ak Hun Devleti''ni ortadan kaldıran, ardından İpek Yolu hakimiyeti için Bizans İmparatorluğu''na Maniakh başkanlığında elçilik heyeti gönderen ve Türk tarihinde Bizans ile diplomatik ilişki kuran ilk devlet adamı kimdir?',
  '{"options": ["İstemi Yabgu", "Bumin Kağan", "Mete Han", "Attila", "Bayan Kağan"], "correctIndex": 0}'::jsonb,
  'Göktürk Devleti''nin batı kanadı yöneticisi İstemi Yabgu, Bizans''a Soğdlu tüccar Maniakh''ı elçi olarak göndermiş; Bizans İmparatoru II. Justinianos da buna karşılık Zemarchos başkanlığında bir heyeti Orta Asya''ya göndermiştir. Bu temas Türk-Bizans ilk resmi diplomatik ilişkisidir.',
  'Attila Bizans ile savaşmıştır fakat ilk diplomatik elçi teatisi ve İpek Yolu ittifakı Göktürk hükümdarı İstemi Yabgu zamanındadır.'
);

-- Soru 79 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Türklerin tarih boyunca göçebe ve yarı göçebe bir hayat sürmeleri; ordu, mimari, sanat ve hukuk alanlarında pek çok sonuca yol açmıştır.

Aşağıdakilerden hangisi bozkır göçebe kültürünün Türk toplumu üzerindeki doğrudan sonuçlarından biri olamaz?',
  '{"options": ["Toprak mülkiyetinin devlete ait olması sebebiyle feodal derebeylik ve kölelik sınıflarının oluşmaması", "Kalıcı saray, tapınak ve taşınmaz anıt mimarisinin Uygurlara kadar gelişmemesi", "Hapis cezalarının kısa süreli tutulması", "Maden işlemeciliği ve deri sanatında taşınabilir eşyaların tercih edilmesi", "Yazılı hukuk kurallarının ve ticaret sözleşmelerinin Asya Hunları döneminde sistemleştirilmesi"], "correctIndex": 4}'::jsonb,
  'Yazılı hukuk kuralları ve ilk kira/ticaret/borç sözleşmeleri göçebe Asya Hunlarında değil, yerleşik hayata geçen UYGURLARDA ortaya çıkmıştır. Asya Hunlarında hukuk sözlü töredir.',
  'Yazılı hukuk ve sözleşme kültürü yerleşik hayatın getirisidir ve Türk tarihinde Uygurlarla başlar; göçebe dönemde sadece sözlü töre vardır.'
);

-- Soru 80 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  'multiple_choice',
  3,
  'Oğuz Kağan Destanı''nda anlatılan ve Türk boylarını bir bayrak altında toplayan efsanevi Türk hükümdarı Oğuz Kağan''ın, tarihsel kişilik olarak aşağıdaki hükümdarlardan hangisiyle özdeşleştiği kabul edilmektedir?',
  '{"options": ["Mete Han", "Bumin Kağan", "Attila", "Alp Er Tunga", "Teoman"], "correctIndex": 0}'::jsonb,
  'Tarihçiler ve Türkologlar, Oğuz Kağan Destanı''ndaki doğum, tahta çıkış, ordu düzeni ve fetih anlatımlarının Asya Hun Hükümdarı Mete Han''ın hayatıyla birebir örtüştüğünü ve Oğuz Kağan''ın Mete Han olduğunu kabul etmektedirler.',
  'Alp Er Tunga İskitlerin efsanevi hükümdarıdır (Şehname''de Efrasiyab). Oğuz Kağan ise Asya Hun imparatoru Mete Han''dır.'
);

