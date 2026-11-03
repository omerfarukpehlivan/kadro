-- =====================================================================
-- ÜNİTE 7: Çağdaş Türk ve Dünya Tarihi (EK 40 SORU: Test 5, 6, 7, 8)
-- Toplam Soru: 40 Soru (Mevcut 40 + Bu Ek 40 = 80 Soru / 8 Test)
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 41 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''ndan sonra Çarlık Rusyası''nın yıkılmasıyla Türkistan''da kurulan Hokand Muhtariyeti''ni kanlı şekilde yıkan Bolşeviklere karşı başlayan ''Basmacı Hareketi''nin ilk kıvılcımını yakan ve yerel direniş liderlerine verilen tarihi unvan aşağıdakilerden hangisidir?',
  '{"options": ["Koranbaşı", "Ataman", "İnal", "Bahadır", "Subaşı"], "correctIndex": 0}'::jsonb,
  'Basmacı Hareketi''nde bağımsızlık için savaşan Türkistan direniş liderlerine ''Koranbaşı'' adı verilirdi (Ergaş Koranbaşı, Şir Muhammed Bek vb.).',
  'Koranbaşı Basmacı Hareketi''ne özgü askeri-sivil yerel lider unvanıdır. Enver Paşa bu liderleri birleştirmiştir.'
);

-- Soru 42 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Başkurt Türklerinin bağımsızlık mücadelesine öncülük eden, Başkurdistan Cumhuriyeti''nin ilk hükümet başkanı olan, Sovyet baskısı sebebiyle Türkiye''ye gelerek İstanbul Üniversitesi''nde Umumi Türk Tarihi kürsüsünü kuran dünyaca ünlü Türk tarihçisi kimdir?',
  '{"options": ["Zeki Velidi Togan", "Yusuf Akçura", "İsmail Gaspıralı", "Sadri Maksudi Arsal", "Mehmet Emin Resulzade"], "correctIndex": 0}'::jsonb,
  'Ord. Prof. Dr. Zeki Velidi Togan, hem Başkurt milli hükümet başkanı hem de ''Umumi Türk Tarihine Giriş'' eserinin yazarı olan büyük bir bilim insanıdır.',
  'Yusuf Akçura ''Üç Tarz-ı Siyaset''in yazarı ve Türk Tarih Kurumu başkanıdır; Başkurt lider ve kürsü kurucusu ise Zeki Velidi Togan''dır.'
);

-- Soru 43 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1904 yılında Kahire''de Türk gazetesinde yayımladığı ''Üç Tarz-ı Siyaset'' adlı ünlü makalesiyle Osmanlıcılık, İslamcılık ve Türkçülük fikirlerini karşılaştırmalı inceleyen ve Türkçülüğün manifestosunu yazan fikir adamı kimdir?',
  '{"options": ["Yusuf Akçura", "Ziya Gökalp", "İsmail Gaspıralı", "Mehmet Emin Yurdakul", "Ömer Seyfettin"], "correctIndex": 0}'::jsonb,
  'Kazan Türkü olan Yusuf Akçura, ''Üç Tarz-ı Siyaset'' eseriyle Türkçülük akımının en önemli teorisyenlerinden biri olmuş ve Türk Tarih Kurumu''nun da başkanlığını yürütmüştür.',
  'Ziya Gökalp ''Türkçülüğün Esasları''nı yazmıştır; ''Üç Tarz-ı Siyaset'' makalesini yazan ise Yusuf Akçura''dır.'
);

-- Soru 44 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Kırım Bahçesaray''da ''Dilde, fikirde, işte birlik'' prensibiyle 1883''te çıkarmaya başladığı ''Tercüman'' gazetesi ile tüm Türk dünyasının ortak bir İstanbul Türkçesinde anlaşmasını savunan büyük maarifçi kimdir?',
  '{"options": ["İsmail Gaspıralı", "Yusuf Akçura", "Zeki Velidi Togan", "Ali Merdan Topçubaşov", "Musa Carullah"], "correctIndex": 0}'::jsonb,
  'İsmail Gaspıralı (1851-1914), Tercüman gazetesi ve Usul-i Cedid (Yeni Metot) okulları ile tüm Türk dünyasında eğitim seferberliği başlatmıştır.',
  '''Dilde, fikirde, işte birlik'' sözü ve Tercüman gazetesi doğrudan İsmail Gaspıralı ile özdeştir.'
);

-- Soru 45 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1929 Dünya Ekonomik Bunalımı''ndan (Kara Perşembe) sonra Almanya''da iktidara gelen Adolf Hitler''in, Alman ırkının yaşayabilmesi için Doğu Avrupa ve Rusya topraklarının zorla ele geçirilmesini öngören jeopolitik doktrinine ne ad verilir?',
  '{"options": ["Lebensraum (Hayat Sahası)", "Mare Nostrum (Bizim Deniz)", "Blitzkrieg (Yıldırım Savaşı)", "Anschluss", "Drang nach Osten"], "correctIndex": 0}'::jsonb,
  'Lebensraum (Hayat Sahası), Hitler''in Kavgam kitabında formüle ettiği ve II. Dünya Savaşı''nda SSCB ve Polonya''ya saldırmasının ideolojik gerekçesini oluşturan yayılmacı doktrindir.',
  'Mare Nostrum Mussolini İtalyası''nın Akdeniz politikasıdır; Lebensraum ise Hitler Almanyası''nın Hayat Sahası doktrinidir.'
);

-- Soru 46 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1936-1939 İspanya İç Savaşı''nda Cumhuriyetçileri yenilgiye uğratarak İspanya''da 1975 yılına kadar sürecek diktatörlük rejimini kuran faşist general kimdir?',
  '{"options": ["Francisco Franco", "Benito Mussolini", "Antonio de Salazar", "Philippe Petain", "Paul von Hindenburg"], "correctIndex": 0}'::jsonb,
  'General Francisco Franco, Nazi Almanyası ve Faşist İtalya''nın desteğiyle İspanya İç Savaşı''nı kazanmış ve ülkeyi 1975''teki ölümüne kadar diktatörlükle yönetmiştir.',
  'Salazar Portekiz diktatörüdür; İspanya''da iç savaşı kazanan diktatör General Franco''dur.'
);

-- Soru 47 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'İki savaş arası dönemde Fransa''nın Almanya''dan gelebilecek olası bir işgali engellemek amacıyla doğu sınırına inşa ettiği, yer altı tünelleri, zırhlı sığınaklar ve ağır toplarla tahkim edilmiş aşılmaz kabul edilen devasa savunma hattına ne ad verilir?',
  '{"options": ["Maginot Hattı", "Siegfried Hattı", "Manerheim Hattı", "Bar-Lev Hattı", "Hindenburg Hattı"], "correctIndex": 0}'::jsonb,
  'Maginot Hattı, Fransa''nın Alman sınırına kurduğu betonarme savunma hattıdır. Ancak Almanlar 1940''ta bu hattı doğrudan geçmek yerine Belçika ve Ardenler Ormanları üzerinden dolaşarak aşmışlardır.',
  'Siegfried Almanların savunma hattıdır; Fransa''nın ünlü aşılmaz hattı ise Maginot Hattı''dır.'
);

-- Soru 48 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Japonya''da 1868 yılında feodal Şogunluk düzenine son vererek Batı tarzı modern sanayi, ordu, anayasa ve eğitim reformlarını başlatan İmparator Mutsuhito dönemine ne ad verilir?',
  '{"options": ["Meiji Restorasyonu", "Kültür Devrimi", "Samuray Çağı", "Edo Dönemi", "Boksör Reformu"], "correctIndex": 0}'::jsonb,
  'Meiji Restorasyonu (Aydınlanmış Yönetim), Japonya''yı feodal orta çağdan dünyanın önde gelen modern sanayi ve deniz gücüne dönüştüren tarihi devrimdir.',
  'Kültür Devrimi Çin''de Mao tarafından yapılmıştır; Japon modernleşmesi ise Meiji Restorasyonu''dur.'
);

-- Soru 49 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Kriz sadece bir borsa düşüşü değildir; Amerikan bankacılık sisteminin yapısal denetimsizliğinin bir sonucudur.'
);

-- Soru 50 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1929 Büyük Buhranı sırasında Türkiye Cumhuriyeti''nde tasarrufu teşvik etmek, yerli malı kullanımını yaygınlaştırmak amacıyla TBMM Başkanı Kazım Özalp öncülüğünde kurulan milli cemiyet hangisidir?',
  '{"options": ["Milli İktisat ve Tasarruf Cemiyeti", "Milli Kongre Cemiyeti", "Anadolu Kulübü", "Türk Maarif Cemiyeti", "Hilal-i Ahmer Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Milli İktisat ve Tasarruf Cemiyeti 1929 buhranının hemen ardından kurulmuş ve Yerli Malı Haftası''nın ilan edilmesini sağlayarak yerli üretimi canlandırmıştır.',
  'Kurucusu TBMM Başkanı Kazım Özalp''tir. 1929 krizine karşı iç tüketimi koruyan cemiyettir.'
);

-- Soru 51 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında 1941 yılında ABD Başkanı F. D. Roosevelt ile İngiltere Başbakanı Winston Churchill arasında bir savaş gemisinde imzalanan ve savaştan sonra toprak kazanılmayacağını, milletlerin kendi kaderini tayin edeceğini ilan eden ve ''Birleşmiş Milletler'' fikrinin temelini atan bildiri aşağıdakilerden hangisidir?',
  '{"options": ["Atlantik Bildirisi", "Balfour Deklarasyonu", "Kazablanka Bildirisi", "Helsinki Nihai Senedi", "Monroe Doktrini"], "correctIndex": 0}'::jsonb,
  'Ağustos 1941 Atlantik Bildirisi, I. Dünya Savaşı''ndaki Wilson İlkeleri''ne benzer şekilde II. Dünya Savaşı sonrasının barış vizyonunu belirlemiştir.',
  'Atlantik Bildirisi II. Dünya Savaşı''nın Wilson İlkeleri gibidir; BM teşkilatının da ilk tohumudur.'
);

-- Soru 52 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı''nda Pasifik Cephesi''nde Japonya''nın 7 Aralık 1941''de ABD üssü Pearl Harbor''ı bombalamasından sonra, Haziran 1942''de ABD donanmasının Japon uçak gemilerini batırarak Pasifik''te üstünlüğü ele geçirdiği dönüm noktası deniz muharebesi hangisidir?',
  '{"options": ["Midway Deniz Muharebesi", "Mercan Denizi Muharebesi", "Guadalcanal Savaşı", "Leyte Körfezi Muharebesi", "Okinawa Çıkarması"], "correctIndex": 0}'::jsonb,
  'Midway Deniz Muharebesi, ABD şifre çözücülerinin Japon planını önceden çözmesiyle kazanılmış ve Japon donanmasının Pasifik''teki ilerleyişini kesin olarak durdurmuştur.',
  'Pearl Harbor saldırıdır; savaşın kaderini ABD lehine çeviren Pasifik dönüm noktası ise Midway Deniz Muharebesi''dir.'
);

-- Soru 53 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında toplanan konferanslar ve içerikleriyle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Kazablanka Konferansı (1943) - Mihver devletlerin ''Kayıtsız Şartsız Teslim Alınması'' kararının alınması", "Yalta Konferansı (1945) - Almanya''nın 4 işgal bölgesine ayrılması ve BM kuruculuğu için Mihver''e savaş ilanı şartı", "San Francisco Konferansı (1945) - Birleşmiş Milletler Cemiyeti''nin resmen kurulması", "Potsdam Konferansı (1945) - Almanya''nın silahsızlandırılması ve savaş suçluları için Nürnberg Mahkemeleri kararı", "Kahire Konferansı (1943) - Türkiye''nin derhal savaşa girerek Balkanlar''a 500 bin asker göndermeyi taahhüt etmesi"], "correctIndex": 4}'::jsonb,
  'Kahire Konferansı''nda Cumhurbaşkanı İsmet İnönü savaşa hemen girmeyi taahhüt etmemiş; Türk ordusuna modern teçhizat ve silah verilmesi şartını koşarak Türkiye''yi fiilen savaşın dışında tutmayı başarmıştır.',
  'İnönü Kahire ve Adana görüşmelerinde Müttefiklerin tüm baskılarına ustaca direnmiş ve savaşa fiilen katılmamıştır.'
);

-- Soru 54 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı devam ederken Türkiye''de Cumhurbaşkanı İsmet İnönü ile İngiltere Başbakanı Winston Churchill arasında bir tren vagonunda gerçekleşen ve Churchill''in Türkiye''yi savaşa sokma baskısı yaptığı 1943 tarihli görüşme hangisidir?',
  '{"options": ["Adana Görüşmesi (Yenice Mülakatı)", "I. Kahire Konferansı", "Tahran Konferansı", "Moskova Mülakatı", "Bükreş Zirvesi"], "correctIndex": 0}'::jsonb,
  '30-31 Ocak 1943 Adana Yenice İstasyonu''nda vagon içinde gerçekleşen mülakatta Churchill Türkiye''yi savaşa davet etmiş, İnönü ise askeri eksiklikleri öne sürerek bu talebi savuşturmuştur.',
  'Adana Görüşmesi Türkiye topraklarında yapılmıştır; Kahire ise Mısır''da Roosevelt''in de katıldığı görüşmedir.'
);

-- Soru 55 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı yıllarında olası bir Alman işgaline karşı Trakya sınırında Çatalca hattı boyunca inşa edilen beton siperler ve sığınaklardan oluşan savunma hattına dönemin Genelkurmay Başkanı''nın adıyla ne denilmiştir?',
  '{"options": ["Çakmak Hattı", "İnönü Hattı", "Fevzi Paşa Savunması", "Trakya Tahkimatı", "Marmara Kordonu"], "correctIndex": 0}'::jsonb,
  'Mareşal Fevzi Çakmak''ın emriyle İstanbul''u korumak için kurulan savunma hattına ''Çakmak Hattı'' adı verilmiştir.',
  'Çakmak Hattı Mareşal Fevzi Çakmak''ın adını taşır ve Trakya sınırını Alman tanklarına karşı korumak için kurulmuştur.'
);

-- Soru 56 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sırasında Türkiye''nin iç politikasında ve ekonomisinde yaşanan olağanüstü gelişmeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Geceleri şehirlerde uygulanan ''Karartma'' geceleri", "Temel gıda maddeleri için ''Ekmek Karnesi'' uygulamasının başlatılması", "Milli Korunma Kanunu çıkarılarak fiyatlara narh konulması", "Varlık Vergisi ve Toprak Mahsulleri Vergisi''nin ihdas edilmesi", "Tüm üniversitelerin ve fabrikaların 5 yıl boyunca kapatılması"], "correctIndex": 4}'::jsonb,
  'Üniversiteler veya fabrikalar kapatılmamış, aksine sanayi üretimi ve eğitim olağanüstü şartlarda sürdürülmüştür. Hatta 1940 yılında Köy Enstitüleri açılmıştır.',
  'Karartma, ekmek karnesi, Varlık Vergisi ve Köy Enstitüleri II. Dünya Savaşı yıllarının temel olaylarıdır.'
);

-- Soru 57 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Türkiye Cumhuriyeti, San Francisco Konferansı''na kurucu üye sıfatıyla katılabilmek ve Yalta Konferansı kararları gereğince 23 Şubat 1945 tarihinde hangi iki devlete sembolik olarak savaş ilan etmiştir?',
  '{"options": ["Almanya - Japonya", "Almanya - İtalya", "İtalya - Japonya", "Almanya - Rusya", "Japonya - Avusturya"], "correctIndex": 0}'::jsonb,
  'Yalta Konferansı kararına göre 1 Mart 1945''e kadar Mihver devletlere savaş açanlar BM kurucusu olabilecekti. Türkiye 23 Şubat 1945''te sembolik olarak Almanya ve Japonya''ya savaş ilan etmiş ve San Francisco''ya kurucu üye olarak katılmıştır.',
  'İtalya 1943''te teslim olduğu için savaş ilanı sadece Almanya ve Japonya''ya yapılmıştır.'
);

-- Soru 58 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '6 ve 9 Ağustos 1945 tarihlerinde ABD Başkanı Harry Truman''ın emriyle Hiroşima ve Nagazaki şehirlerine atılan atom bombalarının kod isimleri sırasıyla aşağıdakilerden hangisidir?',
  '{"options": ["Little Boy (Küçük Çocuk) - Fat Man (Şişman Adam)", "Fat Man - Little Boy", "Enola Gay - Bockscar", "Trinity - Manhattan", "Overlord - Barbarossa"], "correctIndex": 0}'::jsonb,
  'Hiroşima''ya atılan uranyum bombası ''Little Boy''; Nagazaki''ye atılan plütonyum bombası ise ''Fat Man''dir. Bombayı taşıyan uçağın adı ise ''Enola Gay''dir.',
  'Little Boy Hiroşima''ya, Fat Man Nagazaki''ye atılmıştır. Enola Gay uçağın adıdır.'
);

-- Soru 59 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sonrasında Nazi savaş suçlularını yargılamak amacıyla uluslararası askeri mahkeme hangi Alman şehrinde kurulmuştur?',
  '{"options": ["Nürnberg", "Berlin", "Münih", "Frankfurt", "Köln"], "correctIndex": 0}'::jsonb,
  'Nürnberg Mahkemeleri, Nazi liderlerinin ''insanlığa karşı suçlar'' ve ''soykırım'' sebebiyle yargılandığı ilk uluslararası ceza mahkemesidir. Japon savaş suçluları ise Tokyo Mahkemesi''nde yargılanmıştır.',
  'Nürnberg Mahkemeleri modern uluslararası ceza hukukunun doğum yeridir.'
);

-- Soru 60 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sonrasında 1947 yılında imzalanan Paris Barış Antlaşması ile İtalya, elinde bulundurduğu On İki Ada''yı hangi devlete devretmek zorunda kalmıştır?',
  '{"options": ["Yunanistan", "Türkiye", "İngiltere", "Fransa", "Yugoslavya"], "correctIndex": 0}'::jsonb,
  '1947 Paris Barış Antlaşması ile İtalya On İki Ada''yı silahsızlandırılması şartıyla Yunanistan''a bırakmıştır.',
  'On İki Ada Trablusgarp Savaşı''nda İtalya''ya geçici verilmişti; 1947''de ise Türkiye''nin itirazlarına rağmen Yunanistan''a verilmiştir.'
);

-- Soru 61 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'II. Dünya Savaşı sonrasında SSCB lideri Stalin''in Türkiye''den Kars ve Ardahan''ı talep etmesi ve Boğazlarda askeri üs istemesi üzerine Türkiye dış politikasında köklü bir değişim yaşamıştır.

Türkiye''nin Batı Bloku''na yanaşması sürecinde 1947''de ABD Başkanı tarafından ilan edilen ve komünizm tehdidi altındaki Türkiye ile Yunanistan''a 400 milyon dolar askeri ve mali yardım yapılmasını öngören doktrin hangisidir?',
  '{"options": ["Truman Doktrini", "Monroe Doktrini", "Marshall Planı", "Eisenhower Doktrini", "Kennedy Doktrini"], "correctIndex": 0}'::jsonb,
  '12 Mart 1947 Truman Doktrini, ABD''nin Sovyet yayılmacılığını çevrelemek (Çevreleme Politikası) amacıyla Türkiye ve Yunanistan''a doğrudan askeri kalkan sağladığı ilk doktrindir.',
  'Marshall Planı tüm Avrupa''ya ekonomik yardımdır; doğrudan askeri yardım sağlayan ilk belge Truman Doktrini''dir.'
);

-- Soru 62 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Doğu Bloku ülkeleri arasında ideolojik birliği sağlamak ve Moskova''nın denetimini kurmak amacıyla kurulan teşkilat ile komünist ülkeler arası ekonomik iş birliği teşkilatı hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Kominform - Komekon", "Varşova Paktı - Kominform", "Komekon - Kominform", "Kominform - Varşova Paktı", "KGB - Komekon"], "correctIndex": 0}'::jsonb,
  'Kominform = İdeolojik birlik (Komünist partiler arası enformasyon bürosu); Komekon = Ekonomik yardımlaşma (Marshall Planı''na karşı); Varşova Paktı = Askeri savunma (NATO''ya karşı).',
  'Kominform ideolojik, Komekon ekonomik, Varşova Paktı ise askeri örgüttür.'
);

-- Soru 63 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1949 yılında Kuzey Atlantik Paktı (NATO) kurulurken kurucu üyeler arasında yer almayan, ancak 1950 Kore Savaşı''nda gösterdiği askeri kahramanlık üzerine 1952 yılında NATO''ya aynı anda üye kabul edilen iki devlet hangisidir?',
  '{"options": ["Türkiye - Yunanistan", "Almanya - İtalya", "Türkiye - İspanya", "Yunanistan - Portekiz", "İspanya - İtalya"], "correctIndex": 0}'::jsonb,
  'Türkiye ve Yunanistan 18 Şubat 1952 tarihinde TBMM onayıyla eş zamanlı olarak NATO''ya 13. ve 14. üyeler olarak katılmıştır.',
  'Türkiye tek başına değil, Yunanistan ile birlikte 1952 yılında NATO''ya girmiştir.'
);

-- Soru 64 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Kore Savaşı''nda (1950-1953) Tuğgeneral Tahsin Yazıcı komutasındaki Türk Tugayı''nın Amerikan 8. Ordusu''nu tamamen imha edilmekten kurtardığı ve savaşın seyrini değiştirdiği efsanevi muharebe hangisidir?',
  '{"options": ["Kunuri Muharebeleri", "Seul Kuşatması", "Pusan Savunması", "İnçon Çıkarması", "Yalu Zaferi"], "correctIndex": 0}'::jsonb,
  'Kunuri Muharebeleri''nde Türk askeri Çin kuvvetlerinin kuşatmasını yararak Müttefik ordusunu kurtarmış ve ABD Kongresi tarafından Mümtaz Birlik Madalyası ile ödüllendirilmiştir.',
  'Kunuri Muharebesi Türk Tugayı''nın Kore''deki en meşhur destanıdır.'
);

-- Soru 65 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1955 yılında Sovyet tehdidine karşı Orta Doğu''da güvenliği sağlamak amacıyla Türkiye, Irak, İran, Pakistan ve İngiltere arasında kurulan, ancak 1958''de Irak''ta yaşanan kanlı darbe sonrası merkezini Ankara''ya taşıyarak CENTO adını alan güvenlik paktı hangisidir?',
  '{"options": ["Bağdat Paktı", "Sadabad Paktı", "Balkan Paktı", "Arap Birliği", "SEATO"], "correctIndex": 0}'::jsonb,
  'Bağdat Paktı 1955''te Türkiye ve Irak öncülüğünde kurulmuş; Irak ayrılınca adı CENTO (Merkezi Antlaşma Örgütü) olmuş ve merkezi Ankara''ya taşınmıştır.',
  'Sadabad Paktı Atatürk dönemindedir (1937); Bağdat Paktı ise Menderes/Demokrat Parti dönemindedir (1955).'
);

-- Soru 66 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1945 yılında CHP içinde Toprak Reformu Kanunu tartışılırken Celal Bayar, Adnan Menderes, Fuat Köprülü ve Refik Koraltan tarafından parti yönetimine sunulan ve Demokrat Parti''nin kurulmasını tetikleyen tarihi muhalefet önergesi nedir?',
  '{"options": ["Dörtlü Takrir", "Dokuz Umde", "Misak-ı Maarif", "Hürriyet Bildirgesi", "Takrir-i Sükun"], "correctIndex": 0}'::jsonb,
  'Dörtlü Takrir, CHP içinde demokratikleşme talep eden 4 milletvekilinin (C-A-F-E-R) verdiği önergedir. Önerge reddedilince ihraçlar yaşanmış ve 7 Ocak 1946''da Demokrat Parti kurulmuştur.',
  'Dörtlü Takrir DP''nin doğum belgesidir; Takrir-i Sükun ile karıştırılmamalıdır.'
);

-- Soru 67 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '14 Mayıs 1950 seçimlerinde Demokrat Parti''nin %53 oyla 408 milletvekili kazanarak 27 yıllık tek parti iktidarına sandık yoluyla kansız son vermesi Türk siyasi tarihinde ne adla anılır?',
  '{"options": ["Beyaz İhtilal", "Kadife Devrim", "Hürriyet Devrimi", "Milli Birlik Günü", "Gül Devrimi"], "correctIndex": 0}'::jsonb,
  '1950 iktidar değişimi kansız ve demokratik bir sandık devrimi olduğu için ''Beyaz İhtilal'' olarak nitelendirilmiştir. Celal Bayar Cumhurbaşkanı, Adnan Menderes Başbakan olmuştur.',
  'Kadife Devrim Çekoslovakya''dadır; Türkiye''deki 1950 seçimi ise Beyaz İhtilal''dir.'
);

-- Soru 68 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Demokrat Parti iktidarının 16 Haziran 1950 tarihinde TBMM''den geçirdiği ilk yasa aşağıdakilerden hangisidir?',
  '{"options": ["Ezanın Arapça aslıyla okunması yasağının kaldırılması", "Kore''ye asker gönderilmesi", "Halkevlerinin kapatılması", "Köy Enstitüleri''nin birleştirilmesi", "ODTÜ''nün kurulması"], "correctIndex": 0}'::jsonb,
  'DP''nin ilk icraatı, 1932''den beri Türkçe okunan ezanın Arapça aslıyla okunmasını serbest bırakan kanunu CHP''nin de desteğiyle meclisten geçirmek olmuştur.',
  'DP''nin 1 numaralı ilk icraatı ezanın serbest bırakılmasıdır.'
);

-- Soru 69 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1955 yılında Selanik''te Atatürk''ün doğduğu evin bombalandığı yönündeki asılsız haberler üzerine İstanbul''da gayrimüslim vatandaşların ev ve iş yerlerinin yağmalanmasına yol açan ve sıkıyönetim ilan edilmesine sebep olan üzücü olaylar hangisidir?',
  '{"options": ["6-7 Eylül Olayları", "Razgrad Hadisesi", "Vagon-Li Olayı", "Menemen Olayı", "Kanlı Pazar"], "correctIndex": 0}'::jsonb,
  '6-7 Eylül 1955 Olayları, Kıbrıs meselesinin tırmandığı dönemde provokasyonlar sonucu İstanbul''da Rum ve gayrimüslim vatandaşların mallarına yönelik kitlesel şiddet eylemleridir.',
  '6-7 Eylül Olayları DP döneminde yaşanmış en büyük iç krizlerden biridir.'
);

-- Soru 70 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Soğuk Savaş yıllarında Doğu Bloku içinde yer almasına rağmen SSCB ve Stalin''in katı hegemonyasını reddederek Kominform''dan çıkarılan ve Bağlantısızlar Hareketi''ne öncülük eden komünist ülke ve lideri hangisidir?',
  '{"options": ["Yugoslavya - Josip Broz Tito", "Romanya - Nikolay Çavuşesku", "Macaristan - İmre Nagy", "Arnavutluk - Enver Hoca", "Polonya - Gomulka"], "correctIndex": 0}'::jsonb,
  'Yugoslavya lideri Mareşal Tito, Sovyet uydusu olmayı reddetmiş ve 1948''de Kominform''dan ihraç edilmiştir. Tito daha sonra Üçüncü Dünya / Bağlantısızlar Hareketi''nin liderliğini üstlenmiştir.',
  'Doğu Bloku''ndan ilk kopan ve bağlantısız kalan ülke Yugoslavya''dır.'
);

-- Soru 71 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1962 yılında ABD ile SSCB''yi nükleer bir 3. Dünya Savaşı''nın eşiğine getiren Küba Füze Krizi sırasında, ABD''nin Sovyetlerin Küba''daki nükleer füzeleri sökmesi karşılığında Türkiye''den gizlice sökmeyi taahhüt ettiği nükleer başlıklı füzeler hangileridir?',
  '{"options": ["Jüpiter Füzeleri", "Patriot Füzeleri", "Hawk Füzeleri", "Tomahawk Füzeleri", "Pershing Füzeleri"], "correctIndex": 0}'::jsonb,
  'ABD ile SSCB arasındaki gizli pazarlık sonucu İzmir Çiğli''de bulunan Amerikan ''Jüpiter Füzeleri'' sökülmüş; Türkiye müttefiki ABD''nin kendi güvenliğini pazarlık konusu yaptığını öğrenerek büyük hayal kırıklığı yaşamıştır.',
  'Küba Füze Krizi''nde Türkiye''den sökülen füzenin adı Jüpiter''dir. Çok popüler bir KPSS sorusudur.'
);

-- Soru 72 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1964 yılında Türkiye''nin Kıbrıs''taki Rum katliamlarını önlemek amacıyla adaya müdahale kararı alması üzerine, ABD Başkanı Lyndon Johnson''ın Başbakan İsmet İnönü''ye gönderdiği ve ''Türkiye ABD silahlarını Kıbrıs''ta kullanamaz, Sovyetler saldırırsa NATO Türkiye''yi korumaz'' tehdidini içeren tarihi mektuba ne ad verilir?',
  '{"options": ["Johnson Mektubu", "Truman Mektubu", "Eisenhower Muhtırası", "Kissinger Raporu", "Acheson Planı"], "correctIndex": 0}'::jsonb,
  'Haziran 1964 Johnson Mektubu, Türk-Amerikan ilişkilerinde kırılma noktası olmuş; İnönü mektuba ''Yeni bir dünya kurulur ve Türkiye de orada yerini alır'' tarihi cevabını vermiştir.',
  'Johnson Mektubu Kıbrıs krizi sebebiyle İnönü''ye gönderilen diplomatik şantaj mektubudur.'
);

-- Soru 73 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1964 yılında Kıbrıs''ta Erenköy direnişinde Türk köylerini bombalayan Rum hücumbotlarına hava harekatı düzenlerken uçağı isabet alan, paraşütle atladıktan sonra Rumlar tarafından işkenceyle şehit edilen ilk Türk Hava Harp şehidi yüzbaşımız kimdir?',
  '{"options": ["Cengiz Topel", "Fethi Bey", "Sadık Bey", "Nuri Demirağ", "Vecihi Hürkuş"], "correctIndex": 0}'::jsonb,
  'Yüzbaşı Cengiz Topel, Kıbrıs semalarında şehit düşen ilk Türk pilotudur. Adı Türkiye''nin dört bir yanındaki okul ve kışlalara verilmiştir.',
  'Kıbrıs davasının hava şehidi Cengiz Topel''dir.'
);

-- Soru 74 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '20 Temmuz 1974 tarihinde Başbakan Bülent Ecevit ve Başbakan Yardımcısı Necmettin Erbakan hükümeti tarafından Türk Silahlı Kuvvetleri''nin garantörlük hakkını kullanarak gerçekleştirdiği Kıbrıs Barış Harekâtı''nın ikinci aşamasını başlatan tarihi parola nedir?',
  '{"options": ["Ayşe Tatile Çıksın", "Akdeniz İleri", "Şafak Vakti", "Toroslar Hazır", "Zafer Türkündür"], "correctIndex": 0}'::jsonb,
  'Cenevre görüşmelerinin tıkanması üzerine Dışişleri Bakanı Turan Güneş''in kızı Ayşe Güneş''e atıfla Ankara''ya çektiği şifre ''Ayşe Tatile Çıksın''dır.',
  'Kıbrıs Barış Harekâtı''nın simge parolası ''Ayşe Tatile Çıksın''dır.'
);

-- Soru 75 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '15 Kasım 1983 tarihinde bağımsızlığını ilan eden Kuzey Kıbrıs Türk Cumhuriyeti''nin (KKTC) ilk Cumhurbaşkanı ve Kıbrıs Türk halkının unutulmaz milli lideri kimdir?',
  '{"options": ["Rauf Denktaş", "Dr. Fazıl Küçük", "Mehmet Ali Talat", "Derviş Eroğlu", "Ersin Tatar"], "correctIndex": 0}'::jsonb,
  'Rauf Denktaş, Türk Mukavemet Teşkilatı''nın (TMT) ''Toros'' kod adlı lideri ve 1983''te kurulan KKTC''nin kurucu ilk Cumhurbaşkanıdır.',
  'Dr. Fazıl Küçük ilk toplum lideridir; 1983 KKTC''nin ilk cumhurbaşkanı ise Rauf Denktaş''tır.'
);

-- Soru 76 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1970''li ve 1980''li yıllarda dünyanın dört bir yanında Türk diplomatlarına, büyükelçilerine ve ailelerine suikastlar düzenleyen Ermeni terör örgütü aşağıdakilerden hangisidir?',
  '{"options": ["ASALA", "Hınçak", "Taşnak", "EOKA", "Kızıl Tugaylar"], "correctIndex": 0}'::jsonb,
  'ASALA (Ermenistan''ın Kurtuluşu İçin Gizli Ermeni Ordusu), 40''a yakın Türk diplomatını şehit eden terör örgütüdür.',
  'EOKA Kıbrıs''taki Rum örgütüdür; Türk diplomatlarını hedef alan Ermeni terör örgütü ASALA''dır.'
);

-- Soru 77 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'SSCB''nin çöküşünü hazırlayan ve Mihail Gorbaçov tarafından uygulamaya konulan; ''Açıklık / Şeffaflık'' ve ''Yeniden Yapılanma'' anlamına gelen reform kavramları hangisinde doğru verilmiştir?',
  '{"options": ["Glasnost - Perestroyka", "Perestroyka - Glasnost", "Sputnik - Vostok", "Duma - Sovhoz", "Bolşevik - Menşevik"], "correctIndex": 0}'::jsonb,
  'Glasnost = Açıklık / İfade özgürlüğü; Perestroyka = Ekonomik ve kurumsal yeniden yapılanmadır.',
  'Glasnost ve Perestroyka''nın anlamlarının yer değiştirmesine dikkat edilmelidir.'
);

-- Soru 78 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  '1992-1995 Bosna Savaşı sırasında Srebrenitsa''da BM koruması altındaki 8 binden fazla Müslüman Boşnağın Sırplar tarafından katledildiği soykırım karşısında halkının bağımsızlığını savunan, ''Bilge Kral'' unvanıyla anılan ve Bosna Savaşı''nı bitiren Dayton Antlaşması''nı imzalayan lider kimdir?',
  '{"options": ["Aliya İzzetbegoviç", "Slobodan Milosevic", "Radovan Karadzic", "Franjo Tudjman", "Zoran Cindic"], "correctIndex": 0}'::jsonb,
  'Aliya İzzetbegoviç (1925-2003), ''Doğu ve Batı Arasında İslam'' eserinin yazarı, büyük Boşnak düşünür ve Bosna-Hersek''in ilk cumhurbaşkanıdır.',
  'Bilge Kral lakabı Aliya İzzetbegoviç''e aittir. KPSS''de çok sık sorulur.'
);

-- Soru 79 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Ekim 1991''de Sovyetler Birliği''nden bağımsızlığını ilan eden Azerbaycan Cumhuriyeti''nin ikinci cumhurbaşkanı olan, ''Biz bir millet, iki devletiz'' anlayışını benimseyen ve Türk milliyetçiliğinin büyük lideri olan şahsiyet kimdir?',
  '{"options": ["Ebulfez Elçibey", "Haydar Aliyev", "İlham Aliyev", "Ayaz Muttalibov", "Mehmet Emin Resulzade"], "correctIndex": 0}'::jsonb,
  'Ebulfez Elçibey, Azerbaycan Halk Cephesi lideri ve bağımsız Azerbaycan''ın seçilmiş cumhurbaşkanıdır. Rus ordusunu Azerbaycan''dan çıkaran liderdir.',
  'Mehmet Emin Resulzade 1918 ilk cumhuriyetin lideridir; 1992 bağımsız Azerbaycan''ın milli lideri ise Ebulfez Elçibey''dir.'
);

-- Soru 80 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  'multiple_choice',
  2,
  'Türkiye''nin öncülüğünde Türk Cumhuriyetleri arasındaki kardeşlik bağlarını, kalkınma projelerini ve kültürel iş birliğini yürütmek amacıyla 1992 yılında kurulan kalkınma ajansı aşağıdakilerden hangisidir?',
  '{"options": ["TİKA (Türk İşbirliği ve Koordinasyon Ajansı)", "TÜRKSOY", "Türk Konseyi", "Yurtdışı Türkler Başkanlığı", "Yunus Emre Enstitüsü"], "correctIndex": 0}'::jsonb,
  'TİKA (1992), Türk cumhuriyetleri ve akraba topluluklarda okul, hastane, restorasyon ve kalkınma projeleri yürüten devlet ajansımızdır.',
  'TÜRKSOY 1993''te kültür alanında kurulmuştur; teknik yardım ve kalkınma ajansı TİKA''dır.'
);

