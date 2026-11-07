-- =====================================================================
-- ÜNİTE 3: Osmanlı Kültür ve Uygarlığı (EK 20 RAFİNE SORU: Test 11, Test 12)
-- Toplam Soru: 20 Soru (Mevcut 100 + Bu Ek 20 = 120 Soru / 12 Test)
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 101 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı saray teşkilatında ''Birun'' (dış saray) bünyesinde yer alan ve sarayın mutfak işlerini, padişahın ve saray halkının yemeklerinin hazırlanmasını organize eden teşkilat aşağıdakilerden hangisidir?',
  '{"options": ["Matbah-ı Amire", "Darüssaade", "Ceyb-i Hümayun", "Hazine-i Hassa", "Enderun"], "correctIndex": 0}'::jsonb,
  'Matbah-ı Amire, Topkapı Sarayı''nın devasa mutfak teşkilatıdır. Helvahane, Aşhane, Kiler gibi birimlerden oluşur ve günde binlerce kişiye yemek çıkarırdı.',
  'Darüssaade Harem ağasının dairesidir; Hazine-i Hassa padişahın şahsi hazinesidir; saray mutfağı ise Matbah-ı Amire''dir.'
);

-- Soru 102 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Topkapı Sarayı''nda padişah ve saray için altın, gümüş, mücevher, çini, cilt, tezhip, minyatür ve kılıç gibi yüksek sanat eserlerini üreten saray sanatkarları loncasına / teşkilatına ne ad verilirdi?',
  '{"options": ["Ehl-i Hıref", "Ehl-i Şer", "Ehl-i Kalem", "Ehl-i Örf", "Ehl-i Seyf"], "correctIndex": 0}'::jsonb,
  'Ehl-i Hıref (Sanat Erbabı), sarayın resmi sanatçı ve zanaatkar loncasıdır. Maaş defterleri tutulur, dönemin en büyük nakkaşları, hattatları ve kuyumcuları burada istihdam edilirdi.',
  'Ehl-i Kalem bürokratlar, Ehl-i Seyf askerlerdir; saray sanatkar teşkilatı Ehl-i Hıref''tir.'
);

-- Soru 103 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Tanzimat Dönemi''nde 1864 Vilayet Nizamnamesi ile taşra teşkilatı yeniden düzenlenmiştir.

1864 Vilayet Nizamnamesi ile kurulan ve 1871 düzenlemesiyle eklenen taşra idari kademeleri büyükten küçüğe nasıl sıralanmıştır?',
  '{"options": ["Vilayet - Liva (Sancak) - Kaza - Nahiye - Köy", "Eyalet - Kaza - Sancak - Köy", "Vilayet - Kaza - Nahiye - Köy", "Liva - Vilayet - Kaza - Köy", "Vilayet - Nahiye - Kaza - Köy"], "correctIndex": 0}'::jsonb,
  '1864 Vilayet Nizamnamesi ile Eyalet sistemi kaldırılmış, yerine Vilayet (Vali), Liva/Sancak (Mutasarrıf), Kaza (Kaymakam), Nahiye (Nahiye Müdürü) ve Köy (Muhtar) hiyerarşisi getirilmiştir.',
  'Klasik dönem: Eyalet-Sancak-Kaza-Köy; Tanzimat dönemi ise: Vilayet-Liva-Kaza-Nahiye-Köy''dür.'
);

-- Soru 104 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '1864 Vilayet Nizamnamesi ilk kez hangi örnek pilot vilayette uygulanmış ve bu vilayetin valisi olan Mithat Paşa''nın başarılı uygulamaları sayesinde tüm imparatorluğa yayılmıştır?',
  '{"options": ["Tuna Vilayeti", "Selanik Vilayeti", "Halep Vilayeti", "Hüdavendigar Vilayeti", "Bosna Vilayeti"], "correctIndex": 0}'::jsonb,
  'Mithat Paşa''nın valiliği sırasında Tuna Vilayeti (Bulgaristan bölgesi) pilot bölge seçilmiş; yollar, okullar, emniyet sandıkları kurulmuş ve sistem tüm yurda buradan yayılmıştır.',
  'ÖSYM pilot vilayet sorusunu sıkça Tuna Vilayeti ve Mithat Paşa üzerinden sormaktadır.'
);

-- Soru 105 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde başkent İstanbul''un belediye hizmetlerini yürütmek, temizlik, su ve imar işlerine bakmak üzere 1854 Kırım Savaşı sırasında kurulan ilk modern belediye idaresine ne ad verilmiştir?',
  '{"options": ["Şehremaneti", "Darülaceze", "Hilal-i Ahmer", "Zaptiye Nezareti", "Meclis-i Vala"], "correctIndex": 0}'::jsonb,
  '1854 yılında İstanbul''da kurulan Şehremaneti, günümüzdeki İstanbul Büyükşehir Belediyesi''nin ilk kurumsal karşılığıdır. Belediye başkanına ''Şehremini'' denirdi.',
  'Klasik dönemde belediye işlerine Kadı bakardı; 1854''te ise modern Şehremaneti kurulmuştur.'
);

-- Soru 106 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı sarayında padişahın elbiselerini muhafaza eden, dikimini yaptıran ve padişahı törenlerde giydiren en güvenilir saray görevlisine ne ad verilirdi?',
  '{"options": ["Çuhadar Ağa", "Rikabdar Ağa", "Silahtar Ağa", "Tırnakçıbaşı", "İbrikdar Ağa"], "correctIndex": 0}'::jsonb,
  'Enderun Has Oda görevlilerinden Çuhadar Ağa, padişahın kaftan ve kumaşlarından sorumlu en yakın hizmetlilerindendir. Silahtar silahından, Rikabdar ise çizme ve at üzengisinden sorumludur.',
  'Silahtar silahla, Rikabdar ayakkabı/üzengi ile, Çuhadar ise kaftan ve elbiseyle ilgilidir.'
);

-- Soru 107 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Hz. Muhammed''in soyundan gelen seyyid ve şeriflerin nüfus kayıtlarını tutan, haklarını koruyan ve onların davalarına bakan ilmiye mensubu yüksek görevli kimdir?',
  '{"options": ["Nakibüleşraf", "Şeyhülislam", "Kazasker", "Kassam", "Müftü"], "correctIndex": 0}'::jsonb,
  'Nakibüleşraf, peygamber soyundan gelenlerin kaydını tutan ve Eyüp Sultan''daki kılıç alaylarında padişahlara kılıç kuşatan saygın makamdır.',
  'Miras taksimini Kassam yapar; peygamber soyunun kaydını ise Nakibüleşraf tutar.'
);

-- Soru 108 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ölen kişilerin geride bıraktığı mirası (tereke) tespit eden, paylaştıran ve yetimlerin hakkını koruyan adli görevliye ne ad verilirdi?',
  '{"options": ["Kassam", "Kadı", "Muhtesip", "Müstevfi", "Naib"], "correctIndex": 0}'::jsonb,
  'Kassam, kadıya bağlı olarak miras ve tereke defterlerini tutan ve şeri hukuka göre miras taksimi yapan görevlidir.',
  'Kassam miras paylaşımı memurudur. Tereke defterlerini tutar.'
);

-- Soru 109 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde taşradan başkente göçü önlemek ve asayişi sağlamak amacıyla şehre girişlerde pasaport niteliğinde uygulanan iç seyahat izin belgesine ne ad verilirdi?',
  '{"options": ["Mürur Tezkeresi", "Berat", "İcazetname", "Temessük", "İzn-i Sefine"], "correctIndex": 0}'::jsonb,
  'II. Mahmut döneminde İstanbul''a denetimsiz giriş ve yerleşmeyi önlemek amacıyla ''Mürur Tezkeresi'' (geçiş belgesi / iç pasaport) uygulaması başlatılmıştır.',
  'İzn-i Sefine gemi geçiş belgesidir; vatandaşın şehirler arası geçiş belgesi Mürur Tezkeresi''dir.'
);

-- Soru 110 (Test 11)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde posta ve haberleşme ağını sağlayan, at değiştirmek ve dinlenmek amacıyla ana ticaret yolları üzerinde kurulan menzil teşkilatına ve ulaklara ne ad verilirdi?',
  '{"options": ["Menzil Teşkilatı", "Derbent Teşkilatı", "Mekkari Taifesi", "Kapan Hanı", "Avarız Vakfı"], "correctIndex": 0}'::jsonb,
  'Menzil teşkilatı haberleşme, ferman nakli ve posta atlarının değişim merkezleridir. Derbentçiler yol/geçit güvenliğini sağlar; Mekkariler ise yük ve taşımacılık yapar.',
  'Derbent = Geçit güvenliği; Menzil = Posta/Haberleşme; Mekkari = Nakliye ve taşımacılıktır.'
);

-- Soru 111 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı ticaret hayatında toptan ticaretin yapıldığı, tek bir cins malın (un, yağ, pamuk vb.) tartılarak perakendeci esnafa adil şekilde dağıtıldığı büyük toptancı hallerine ne ad verilirdi?',
  '{"options": ["Kapan (Kapan Hanı)", "Bedesten", "Arasta", "Külliye", "Zaviye"], "correctIndex": 0}'::jsonb,
  'Kapan Hanları (Un Kapanı, Yağ Kapanı gibi), malların tartıldığı ve Kapan Emini gözetiminde esnafa paylaştırıldığı toptancı halleridir.',
  'Bedesten kıymetli kumaş ve mücevher çarşısıdır; Arasta aynı meslekten esnafın sıralı dükkanlarıdır; toptancı hali ise Kapan''dır.'
);

-- Soru 112 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde deve, at ve katırlarla kervan taşımacılığı yapan, tüccarların ve ordunun yüklerini ücret karşılığında bir şehirden diğerine nakleden meslek grubuna ne ad verilirdi?',
  '{"options": ["Mekkari Taifesi", "Derbentçiler", "Menzilciler", "Levendler", "Cebeciler"], "correctIndex": 0}'::jsonb,
  'Mekkari Taifesi, günümüzdeki kargo ve lojistik nakliye kooperatiflerinin karşılığı olan geleneksel taşımacılık teşkilatıdır.',
  'Mekkari taşımacıdır; Menzil haberleşmecidir; Derbent ise yol güvenlikçisidir.'
);

-- Soru 113 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Kağıt para (Kaime) ise Abdülmecit dönemindedir. Madeni sıralama: Bakır -> Gümüş -> Altın''dır.'
);

-- Soru 114 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde para ayarının düşürülmesi, yani sikkelerin içindeki değerli altın ve gümüş oranının azaltılarak içine bakır karıştırılması işlemine ne ad verilirdi?',
  '{"options": ["Tağşiş (Kırpma)", "Müsadere", "İltizam", "Narh", "Malikane"], "correctIndex": 0}'::jsonb,
  'Tağşiş, devletin bütçe açıklarını kapatmak için paranın değerini düşürmesidir (devalüasyon). Ayarı düşük akçeye ''Züyuf Akçe'' denmiş ve Yeniçeri isyanlarına yol açmıştır.',
  'Tağşiş = Paranın ayarını bozma/devalüasyon; Züyuf Akçe ise sahte/ayarı düşük akçedir.'
);

-- Soru 115 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı mimarisinde Batı etkisiyle (Barok ve Rokoko tarzı) inşa edilen ''ilk cami'' aşağıdakilerden hangisidir?',
  '{"options": ["Nuruosmaniye Camii", "Sultanahmet Camii", "Ortaköy Camii", "Dolmabahçe Camii", "Laleli Camii"], "correctIndex": 0}'::jsonb,
  'I. Mahmut döneminde başlanıp III. Osman döneminde tamamlanan Nuruosmaniye Camii (1755), Osmanlı''nın ilk Barok tarzı camisidir.',
  'Lale Devri''ndeki III. Ahmet Çeşmesi ilk sivil Batı eseridir; Batı tarzında yapılan İLK CAMİ ise Nuruosmaniye''dir.'
);

-- Soru 116 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Lale Devri''nde Topkapı Sarayı''nın önüne inşa edilen ve Türk-İslam ile Batı süsleme sanatlarının harmanlandığı ''ilk Batı etkili sivil mimari yapı'' hangisidir?',
  '{"options": ["III. Ahmet Çeşmesi", "İshak Paşa Sarayı", "Nuruosmaniye Camii", "Beylerbeyi Sarayı", "Yıldız Sarayı"], "correctIndex": 0}'::jsonb,
  '1728 yılında yapılan III. Ahmet Çeşmesi, Rokoko süslemeleri ve geniş saçaklarıyla Batı etkisinin görüldüğü ilk anıtsal sivil su yapısıdır.',
  'İlk dini Batı yapısı Nuruosmaniye Camii; ilk sivil Batı yapısı III. Ahmet Çeşmesi''dir.'
);

-- Soru 117 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Doğu Anadolu''da Ağrı Doğubayazıt''ta yer alan, inşası 99 yıl süren, Selçuklu, Osmanlı ve Barok mimarisinin harmanlandığı ve dünyada ilk kez ''merkezi kalorifer/ısıtma sisteminin'' uygulandığı tarihi saray hangisidir?',
  '{"options": ["İshak Paşa Sarayı", "Topkapı Sarayı", "Dolmabahçe Sarayı", "Beylerbeyi Sarayı", "Çırağan Sarayı"], "correctIndex": 0}'::jsonb,
  'İshak Paşa Sarayı, kartal yuvası gibi bir tepeye kurulmuş, içinde cami, kütüphane, harem ve zindanları bulunan, taş kanallarla sıcak su dolaştırılarak ısıtılan ilk saraydır.',
  'ÖSYM İshak Paşa Sarayı''nı hem mimari sentezi hem de dünyadaki ilk merkezi ısıtma sistemi özelliğiyle sıkça sorgular.'
);

-- Soru 118 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı hat sanatının piri kabul edilen, yazıya getirdiği estetik kurallar sebebiyle ''Kıbletü''l-Küttab'' (Hattatların Kıblesi) unvanıyla anılan II. Bayezid dönemi büyük hattatı kimdir?',
  '{"options": ["Şeyh Hamdullah", "Hafız Osman", "Ahmet Karahisari", "Mustafa Rakım Efendi", "Yesarizade Mustafa İzzet"], "correctIndex": 0}'::jsonb,
  'Amasyalı Şeyh Hamdullah, Osmanlı hat sanatının kurucusu ve ''Hattatların Kutbu/Kıblesi'' kabul edilir. Kanuni dönemi hattatı Karahisari, Hilye-i Şerif ustası ise Hafız Osman''dır.',
  'Şeyh Hamdullah hat sanatının piri ve ilk büyük ustasıdır.'
);

-- Soru 119 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet''in gül koklarken tasvir edildiği ünlü minyatür portresini çizen ve Türk resminde portreciliğin öncüsü olan Osmanlı nakkaşı kimdir?',
  '{"options": ["Nakkaş Sinan Bey", "Matrakçı Nasuh", "Levni", "Nigari", "Nakkaş Osman"], "correctIndex": 0}'::jsonb,
  'Nakkaş Sinan Bey, İtalya''da resim eğitimi almış ve Fatih''i bağdaş kurmuş vaziyette gül koklarken tasvir eden meşhur portreyi yapmıştır.',
  'Levni Lale Devri minyatürcüsüdür; Matrakçı Nasuh Kanuni devri topoğrafik minyatürcüsüdür; Fatih''in gül koklayan portresini çizen ise Sinan Bey''dir.'
);

-- Soru 120 (Test 12)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Lale Devri''nin en büyük nakkaşı olan, ''Surname-i Vehbi'' eserindeki minyatürleriyle dönemin eğlencelerini, sünnet düğünlerini ve kıyafetlerini resmeden sanatçı kimdir?',
  '{"options": ["Levni (Abdülcelil Çelebi)", "Nakkaş Sinan Bey", "Matrakçı Nasuh", "Şeker Ahmet Paşa", "Osman Hamdi Bey"], "correctIndex": 0}'::jsonb,
  'Levni, Lale Devri''nin renk ve hareket ustası baş nakkaşıdır. Minyatürde gölge ve derinlik denemeleri yapmıştır.',
  'Lale Devri şairi Nedim; Lale Devri nakkaşı ise Levni''dir.'
);

