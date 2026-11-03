-- =====================================================================
-- ÜNİTE 6: Atatürk İlke ve İnkılapları (EK 40 SORU: Test 5, 6, 7, 8)
-- Toplam Soru: 40 Soru (Mevcut 40 + Bu Ek 40 = 80 Soru / 8 Test)
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 41 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Barış Konferansı görüşmeleri sırasında İtilaf Devletleri''nin İstanbul Hükümeti ile TBMM Hükümeti''ni birlikte davet ederek Türk tarafında ikilik yaratmak istemesi üzerine 1 Kasım 1922 tarihinde TBMM tarafından alınan tarihi karar hangisidir?',
  '{"options": ["Saltanatın kaldırılması", "Cumhuriyetin ilan edilmesi", "Halifeliğin kaldırılması", "Ankara''nın başkent yapılması", "Takrir-i Sükun Kanunu''nun kabulü"], "correctIndex": 0}'::jsonb,
  '1 Kasım 1922''de TBMM saltanatı kaldırarak 623 yıllık Osmanlı Devleti''nin siyasi varlığına resmen son vermiştir. Halifelik ise siyasi yetkilerinden arındırılarak sembolik olarak devam ettirilmiştir.',
  'Saltanat 1 Kasım 1922''de; halifelik ise 3 Mart 1924''te kaldırılmıştır. İkisi aynı gün kaldırılmamıştır.'
);

-- Soru 42 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde ordunun siyasetten ayrılmasını sağlamak amacıyla 3 Mart 1924''te Erkan-ı Harbiye-i Umumiye Vekaleti lağvedilmiştir.

Bu vekaletin kaldırılmasıyla yerine kurulan sivil bakanlık ve bağımsız askeri makam eşleştirmesi hangisinde doğru verilmiştir?',
  '{"options": ["Milli Savunma Bakanlığı - Genelkurmay Başkanlığı", "İçişleri Bakanlığı - Jandarma Genel Komutanlığı", "Dışişleri Bakanlığı - Kuvvet Komutanlıkları", "Adalet Bakanlığı - Askeri Yargıtay", "Harbiye Nezareti - Seraskerlik"], "correctIndex": 0}'::jsonb,
  'Erkan-ı Harbiye Vekaleti hükümetten çıkarılmış; hükümette sivil ''Milli Savunma Bakanlığı'' kurulurken, askeri sevk ve idare siyaset üstü ''Genelkurmay Başkanlığı''na bırakılmıştır. İlk Genelkurmay Başkanı Mareşal Fevzi Çakmak''tır.',
  'Ordu mensuplarının meclise girmesi yasaklanmış; askerlik ile milletvekilliği birbirinden kesin olarak ayrılmıştır.'
);

-- Soru 43 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Türkiye Cumhuriyeti''nin ilk siyasi partisi olan Cumhuriyet Halk Fırkası (CHF), 9 Eylül 1923 tarihinde hangi teşkilatın partiye dönüştürülmesiyle resmen kurulmuştur?',
  '{"options": ["Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (A-RMHC)", "Karakol Cemiyeti", "Trakya-Paşaeli Cemiyeti", "Milli Kongre Cemiyeti", "Kilikyalılar Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Milli Mücadele''yi yürüten Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti, 9 Eylül 1923''te ''Halk Fırkası''na dönüştürülmüştür. Cumhuriyet ilan edildikten sonra adı ''Cumhuriyet Halk Fırkası'' olmuştur.',
  'CHF doğrudan sıfırdan kurulan bir parti değildir; Milli Mücadele''nin ana direniş teşkilatı olan A-RMHC''nin partileşmiş halidir.'
);

-- Soru 44 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1924 yılında kurulan ilk muhalefet partisi Terakkiperver Cumhuriyet Fırkası (TCF) ile 1930 yılında kurulan ikinci muhalefet partisi Serbest Cumhuriyet Fırkası''nın (SCF) ekonomi politikası açısından benimsedikleri ortak ilke aşağıdakilerden hangisidir?',
  '{"options": ["Liberalizm (Serbest Piyasa)", "Devletçilik", "Sosyalizm", "Merkantilizm", "Kapitalist Tekelcilik"], "correctIndex": 0}'::jsonb,
  'Her iki muhalefet partisi de CHP''nin uyguladığı devletçi politikalara muhalefet ederek serbest piyasa ekonomisini ve özel teşebbüsü (Liberalizm) savunmuşlardır.',
  'CHP''nin temel ilkesi Devletçilik iken; TCF ve SCF''nin ortak ekonomi politikası Liberalizm''dir.'
);

-- Soru 45 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930 yılında Menemen''de patlak veren ve Asteğmen Mustafa Fehmi Kubilay ile bekçiler Şevki ve Hasan Beylerin şehit edildiği rejim karşıtı irtica isyanını bastırmak ve suçluları cezalandırmak amacıyla kurulan mahkeme aşağıdakilerden hangisidir?',
  '{"options": ["Divan-ı Harp (Sıkıyönetim Askeri Mahkemesi)", "İstiklal Mahkemeleri", "Devlet Güvenlik Mahkemesi", "Yüce Divan", "Nizamiye Mahkemesi"], "correctIndex": 0}'::jsonb,
  'Menemen Olayı''nda suçlular ''Divan-ı Harp'' (askeri mahkeme) tarafından yargılanmıştır. Çünkü İstiklal Mahkemeleri 1927 yılında görevini tamamlayıp kaldırılmıştır!',
  'ÖSYM''nin en büyük çeldiricisidir: Menemen Olayı''nda İstiklal Mahkemesi YOKTUR; sanıklar Divan-ı Harp''te yargılanmıştır.'
);

-- Soru 46 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1933 yılında ezanın Türkçe okunmasına tepki olarak Bursa''da küçük bir grubun başlattığı ve Atatürk''ün ''Bu bir din meselesi değil, dil meselesidir.'' diyerek değerlendirdiği tarihi olay hangisidir?',
  '{"options": ["Bursa Olayı", "Menemen Olayı", "Razgrad Hadisesi", "Vagon-Li Olayı", "Bozkurt-Lotus Olayı"], "correctIndex": 0}'::jsonb,
  'Bursa Ulu Cami''de ezanın Türkçe okunması üzerine çıkan hadiseye ''Bursa Olayı'' denir. Atatürk Bursa''ya giderek yaptığı açıklamada hadisenin irtica boyutunu kınamış ve ''Mesele din değil, dil meselesidir'' demiştir.',
  'Razgrad Olayı Bulgaristan''da Türk mezarlarının tahrip edilmesidir; Vagon-Li Fransız şirketinde Türkçe konuşma yasağıdır; Türkçe ezan tepkisi ise Bursa Olayı''dır.'
);

-- Soru 47 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1933 yılında İstanbul''da Fransız yataklı vagon işletmesi olan Vagon-Li (Wagons-Lits) şirketinde çalışan Naci Bey isimli Türk memurun Türkçe konuştuğu için şirketten atılması üzerine üniversite gençliğinin başlattığı ve ''Vatandaş Türkçe Konuş!'' kampanyasına dönüşen milli tepki olayı aşağıdakilerden hangisidir?',
  '{"options": ["Vagon-Li Olayı", "Razgrad Olayı", "Bursa Olayı", "Bozkurt-Lotus Davası", "Menemen Vakası"], "correctIndex": 0}'::jsonb,
  'Vagon-Li Olayı, Fransız şirketinin Türkçe konuşmayı yasaklaması üzerine Türk gençliğinin şirketi protesto etmesi ve tüm yurtta ''Vatandaş Türkçe Konuş'' seferberliğini başlatması olayıdır.',
  'Vagon-Li Olayı doğrudan Türk diline ve milli egemenliğe sahip çıkma tepkisidir ve Milliyetçilik ilkesiyle yakından ilgilidir.'
);

-- Soru 48 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1926 yılında Türk gemisi Bozkurt ile Fransız vapuru Lotus''un Ege açıklarında çarpışması ve 8 Türk denizcisinin şehit olması üzerine Fransa''nın Türk kaptanı tutuklama yetkimize itiraz etmesiyle başlayan kriz Lahey Adalet Divanı''na taşınmıştır.

Lahey Uluslararası Adalet Divanı''nda Türkiye Cumhuriyeti''ni mükemmel bir hukuk savunmasıyla temsil eden ve Türkiye lehine tarihi bir zafer kazanan Adalet Bakanı kimdir?',
  '{"options": ["Mahmut Esat (Bozkurt)", "Şükrü Saraçoğlu", "Tevfik Rüştü Aras", "Cemal Hüsnü Taray", "Hamdullah Suphi"], "correctIndex": 0}'::jsonb,
  'Mahmut Esat Bey, Lahey''de Türkiye''nin egemenlik haklarını savunarak davayı kazanmıştır. Atatürk bu tarihi başarısından ötürü Soyadı Kanunu çıktığında kendisine bizzat ''Bozkurt'' soyadını vermiştir.',
  'Bozkurt-Lotus davasının mimarı Mahmut Esat Bozkurt''tur. Uluslararası deniz hukukunda emsal karar kabul edilir.'
);

-- Soru 49 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1924 Anayasası''nda 1937 yılında yapılan değişiklikle anayasa metnine eklenen en önemli kurumsal düzenleme aşağıdakilerden hangisidir?',
  '{"options": ["Atatürk''ün altı temel ilkesinin anayasaya dahil edilmesi", "''Devletin dini İslam''dır'' ibaresinin çıkarılması", "Kadınlara milletvekili seçilme hakkının verilmesi", "Milletvekili yemin metninin değiştirilmesi", "Çok partili sisteme geçilmesi"], "correctIndex": 0}'::jsonb,
  '5 Şubat 1937''de yapılan anayasa değişikliği ile Cumhuriyetçilik, Milliyetçilik, Halkçılık, Devletçilik, Laiklik ve İnkılapçılık ilkeleri 1924 Anayasası''nın 2. maddesine eklenmiştir.',
  '''Devletin dini İslam''dır'' maddesi 1928''de çıkarılmıştır; 6 ilkenin anayasaya girmesi ise 1937''dedir.'
);

-- Soru 50 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün cumhurbaşkanlığı döneminde (1923-1938) görev yapan TBMM Başkanları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Ali Fethi Okyar", "Kazım Özalp", "Abdülhalik Renda", "İsmet İnönü", "Fevzi Çakmak"], "correctIndex": 4}'::jsonb,
  'Fevzi Çakmak ordunun başındadır (Genelkurmay Başkanıdır), hiçbir zaman TBMM Başkanlığı yapmamıştır. Atatürk döneminde TBMM Başkanlığı yapanlar: Ali Fethi Okyar (ilk başkan), Kazım Özalp ve Abdülhalik Renda''dır.',
  'Mareşal Fevzi Çakmak 1921''den 1944''e kadar aralıksız Genelkurmay Başkanlığı yapmıştır; meclis başkanı olmamıştır.'
);

-- Soru 51 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Fransız kanunu karmaşık ve eski, Alman kanunu ağır ve katı bulundu; İsviçre kanunu ise en modern ve uygulanabilir olanıydı.'
);

-- Soru 52 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Türk Medeni Kanunu''nun kabulü ile Fener Rum Patrikhanesi ve Musevi Hahambaşılığı''nın dünyevi yetkileri sona ermiş, gayrimüslim cemaatler de kendi dini mahkemelerinden vazgeçerek Türk mahkemelerine tabi olmuşlardır.

Bu gelişme Türkiye''de hangi iki temel Atatürk ilkesinin hayata geçtiğini gösterir?',
  '{"options": ["Laiklik ve Halkçılık (Eşitlik)", "Devletçilik ve Cumhuriyetçilik", "İnkılapçılık ve Devletçilik", "Milliyetçilik ve Bağımsızlık", "Cumhuriyetçilik ve Barışçılık"], "correctIndex": 0}'::jsonb,
  'Dini cemaat mahkemelerinin kaldırılıp tek bir laik hukuk çatısı altında toplanması ''Laiklik''; tüm vatandaşların kanun önünde eşit haklara kavuşması ise ''Halkçılık''tır.',
  'Patrikhanenin elinden dünyevi ve hukuki yetkilerin alınması hukukta laikleşmenin en büyük adımıdır.'
);

-- Soru 53 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '3 Mart 1924 Tevhid-i Tedrisat Kanunu''ndan sonra 2 Mart 1926 tarihinde çıkarılan ve ilk, orta ve lise eğitiminin esaslarını belirleyen, müfredatı çağdaşlaştıran, yabancı dillerde eğitim veren okulları denetim altına alan kanun aşağıdakilerden hangisidir?',
  '{"options": ["Maarif Teşkilatı Hakkında Kanun", "Millet Mektepleri Kanunu", "Köy Enstitüleri Kanunu", "Tevhid-i Tedrisat Kanunu", "Harf İnkılabı Kanunu"], "correctIndex": 0}'::jsonb,
  'Maarif Teşkilatı Hakkında Kanun (1926), Türkiye''deki eğitim kademelerini, öğretmen atamalarını ve ders müfredatlarını laik ve milli esaslara bağlayan temel eğitim nizamnamesidir.',
  'Tevhid-i Tedrisat birlik kanunudur; maarifin iç teşkilatlanması ve müfredat yapısı ise 1926 Maarif Teşkilatı Kanunu iledir.'
);

-- Soru 54 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün ''Efendiler ve ey millet iyi biliniz ki Türkiye Cumhuriyeti şeyhler, dervişler, müritler ve mensuplar memleketi olamaz.'' sözü doğrultusunda 30 Kasım 1925''te tekke, zaviye ve türbeler kapatılmıştır.

Aşağıdaki tarihi şahsiyetlerden hangisinin türbesi bu kanunun istisnası sayılarak ziyarete açık tutulmuştur?',
  '{"options": ["Fatih Sultan Mehmet", "Yavuz Sultan Selim", "Kanuni Sultan Süleyman", "Osman Gazi", "Hiçbiri (Tüm türbeler kapatılmıştır)"], "correctIndex": 4}'::jsonb,
  '1925 tarihli 677 sayılı kanunla Türkiye''deki bütün tarikat tekkeleri, zaviyeler ve padişah türbeleri istisnasız kapatılmıştır. Tarihi ve manevi büyüklerin türbeleri ancak 1950 yılında çıkarılan yeni bir kanunla yeniden ziyarete açılmıştır.',
  'Adaylar Mevlana veya Fatih gibi isimlerin kapatılmadığını zannedebilir; kanun çıktığında TÜM türbeler mühürlenmiştir.'
);

-- Soru 55 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Soyadı Kanunu milli bir dil içerdiği için milliyetçilikle de ilişkilendirilebilir; ancak temel amacı ''ayrıcalıksız, sınıfsız eşit toplum'' yaratmak olduğu için ana ilke HALKÇILIK''tır.'
);

-- Soru 56 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nden kalan Sanayi-i Nefise Mektebi (Güzel Sanatlar Okulu), Cumhuriyet döneminde modernize edilerek 1928 yılında hangi saygın yükseköğretim kurumuna dönüştürülmüştür?',
  '{"options": ["Mimar Sinan Güzel Sanatlar Akademisi", "Marmara Güzel Sanatlar Fakültesi", "Gazi Eğitim Enstitüsü", "Musiki Muallim Mektebi", "Devlet Konservatuvarı"], "correctIndex": 0}'::jsonb,
  'Osman Hamdi Bey''in 1882''de kurduğu Sanayi-i Nefise Mektebi, Cumhuriyet döneminde ''Güzel Sanatlar Akademisi''ne (günümüzde Mimar Sinan Güzel Sanatlar Üniversitesi) dönüştürülmüştür.',
  'Musiki Muallim Mektebi müzik öğretmeni yetiştirmek için Ankara''da açılmıştır; Sanayi-i Nefise ise Mimar Sinan Güzel Sanatlar''a dönüşmüştür.'
);

-- Soru 57 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde müzik ve sahne sanatlarını geliştirmek amacıyla 1924 yılında Ankara''da açılan ve müzik öğretmeni yetiştiren kurum aşağıdakilerden hangisidir?',
  '{"options": ["Musiki Muallim Mektebi", "Darülelhan", "Darülbedayi", "Riyaset-i Cumhur Filarmoni", "Ankara Devlet Tiyatrosu"], "correctIndex": 0}'::jsonb,
  'Musiki Muallim Mektebi 1924''te Ankara''da açılmış ve daha sonra Ankara Devlet Konservatuvarı''nın çekirdeğini oluşturmuştur. Darülelhan konservatuvarın, Darülbedayi ise şehir tiyatrolarının Osmanlı''daki adıdır.',
  'Darülbedayi tiyatro, Darülelhan konservatuvardır. Cumhuriyet''in açtığı okul ise Musiki Muallim Mektebi''dir.'
);

-- Soru 58 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1932 yılında Milletler Cemiyeti''nin teşvikiyle başlatılan ve Türkiye''nin ilk güzellik kraliçesi seçildikten sonra Belçika''da düzenlenen yarışmada ''Dünya Güzellik Kraliçesi'' (Miss Universe) seçilen Türk kadını kimdir?',
  '{"options": ["Keriman Halis (Ece)", "Afife Jale", "Safiye Ayla", "Sabiha Gökçen", "Müfide İlhan"], "correctIndex": 0}'::jsonb,
  'Keriman Halis, 1932''de Belçika''da yapılan yarışmada Dünya Güzeli seçilmiştir. Atatürk kendisine ''Ece'' soyadını vermiştir.',
  'Afife Jale ilk kadın tiyatro oyuncusudur; Keriman Halis Ece ise ilk dünya güzellik kraliçemizdir.'
);

-- Soru 59 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1934 yılında kabul edilen kanunla kadınlara milletvekili seçme ve seçilme hakkı tanınmış ve 1935 genel seçimlerinde TBMM''ye kaç kadın milletvekili girmiştir?',
  '{"options": ["18", "12", "24", "9", "30"], "correctIndex": 0}'::jsonb,
  '1935 genel seçimlerinde meclise ilk kez 17 kadın milletvekili girmiş, ara seçimle bu sayı 18''e yükselmiştir. Bu oran (%4.5) o dönemde birçok Avrupa ülkesinin parlamentosundaki kadın vekil oranından yüksektir.',
  'ÖSYM 1935 meclisindeki kadın milletvekili sayısını (18) doğrudan rakam olarak sormayı sever.'
);

-- Soru 60 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde Türkiye''de modern heykeltıraşlık sanatının öncülerinden olan, Sarayburnu Atatürk Anıtı (ilk Atatürk heykeli), Taksim Cumhuriyet Anıtı ve Ankara Ulus Zafer Anıtı''nı yapan dünyaca ünlü Avusturyalı ve İtalyan heykeltıraşlar kimlerdir?',
  '{"options": ["Heinrich Krippel - Pietro Canonica", "Albert Malche - Herman Jansen", "Bruno Taut - Cleopas", "Picasso - Rodin", "Ernst Reuter - Von Papen"], "correctIndex": 0}'::jsonb,
  'Heinrich Krippel (Sarayburnu, Konya, Samsun ve Ulus anıtlarını yapmıştır) ve Pietro Canonica (Taksim Cumhuriyet Anıtı''nı yapmıştır) Atatürk dönemi anıtlarının büyük heykeltıraşlarıdır.',
  'Herman Jansen Ankara''nın şehir planını çizen mimardır; heykelleri yapanlar ise Heinrich Krippel ve Pietro Canonica''dır.'
);

-- Soru 61 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '17 Şubat 1923''te toplanan İzmir İktisat Kongresi''nde kabul edilen ''Misak-ı İktisadi'' (Milli Ekonomi Andı) kararları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Hammadde kaynağı yurt içinde olan sanayi kollarının kurulması", "El işçiliğinden ve küçük imalathanelerden derhal fabrika ve seri üretime geçilmesi", "Özel teşebbüse kredi sağlayacak milli bankaların kurulması", "Yabancı sermayenin ve tüm özel mülkiyetin devletleştirilerek komünist sisteme geçilmesi", "Yerli malı kullanımının ve tasarrufun özendirilmesi"], "correctIndex": 3}'::jsonb,
  'İzmir İktisat Kongresi''nde komünist model kesinlikle reddedilmiş; yabancı sermayeye kanunlara saygılı olmak ve tekelcilik yapmamak şartıyla kapıların açık olduğu belirtilmiştir. Özel sektör teşvik edilmiştir.',
  '1923 İzmir Kongresi liberal bir çizgidedir; devletçilik ilkesine ancak 1929 Büyük Buhranı sonrasında zorunlu olarak geçilmiştir.'
);

-- Soru 62 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1925 yılında köylünün üzerindeki en ağır mali yük olan ve devlet bütçe gelirlerinin yaklaşık beşte birini oluşturan hangi verginin kaldırılması, cumhuriyetin köylüye ve tarıma verdiği önemi gösterir?',
  '{"options": ["Aşar (Öşür) Vergisi", "Ağnam Vergisi", "Haraç", "Cizye", "Çiftbozan"], "correctIndex": 0}'::jsonb,
  '17 Şubat 1925''te Aşar vergisi kaldırılmıştır. Devlet bütçesinin %20''sinden feragat ederek köylüyü rahatlatmış ve bu inkılap ''Halkçılık'' ilkesinin en büyük kanıtı olmuştur.',
  'Aşar köylüden alınan şeri ürün vergisidir. Kaldırılması hem Laiklik hem de doğrudan Halkçılık ilkesidir.'
);

-- Soru 63 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1927 yılında özel sektörü sanayi yatırımları yapmaya teşvik etmek, bedelsiz arazi ve vergi muafiyeti sağlamak amacıyla çıkarılan ancak halkın sermaye birikimi yetersizliği ve 1929 Büyük Buhranı sebebiyle beklenen sonucu veremeyen kanun hangisidir?',
  '{"options": ["Teşvik-i Sanayi Kanunu", "Kabotaj Kanunu", "Milli Korunma Kanunu", "Men-i İsrafat Kanunu", "Gümrük Kanunu"], "correctIndex": 0}'::jsonb,
  '1927 Teşvik-i Sanayi Kanunu özel sektörü kalkındırmayı amaçlamış, fakat sermaye ve bilgi yetersizliği sebebiyle başarılı olamamıştır. Bunun üzerine devlet 1930''lu yıllarda ''Devletçilik'' ilkesini zorunlu olarak devreye sokmuştur.',
  'Teşvik-i Sanayi Kanunu''nun başarısız olması Türkiye''de ''Devletçilik'' ilkesinin ve planlı kamu sanayileşmesinin doğmasına yol açmıştır.'
);

-- Soru 64 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Türkiye Cumhuriyeti''nde sanayi yatırımlarını finanse etmek, tekstil, iplik ve basma fabrikalarını bizzat kurup işletmek amacıyla 1933 yılında kurulan dev kamu iktisadi kuruluşu aşağıdakilerden hangisidir?',
  '{"options": ["Sümerbank", "Etibank", "Halkbank", "Denizbank", "İlbank"], "correctIndex": 0}'::jsonb,
  'Sümerbank, 1933''te I. Beş Yıllık Sanayi Planı''nın finansmanını sağlamak ve tekstil sanayisini kurmak için açılmış Cumhuriyetin simge kurumudur.',
  'Maden ve enerji için Etibank (1935); tekstil ve genel sanayi planı için Sümerbank (1933) kurulmuştur.'
);

-- Soru 65 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün madencilik, petrol arama ve yer altı kaynaklarını işletmek amacıyla bizzat talimat vererek 1935 yılında kurdurduğu iki stratejik kurum hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Maden Tetkik ve Arama Enstitüsü (MTA) - Etibank", "Sümerbank - Petrol Ofisi", "Türkiye Kömür İşletmeleri - Denizbank", "İş Bankası - Ereğli Demir Çelik", "TPAO - Ziraat Bankası"], "correctIndex": 0}'::jsonb,
  '1935 yılında yer altı madenlerini aramak için MTA (Maden Tetkik ve Arama), bu madenleri finanse etmek ve işletmek için ise Etibank kurulmuştur.',
  'MTA arama yapar, Etibank finanse eder ve işletir. İkisi de 1935 yılında kurulmuştur.'
);

-- Soru 66 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet tarihinin ''ilk kamu şeker fabrikası'' 1926 yılında nerede üretime başlamıştır?',
  '{"options": ["Alpullu (Kırklareli)", "Uşak", "Turhal", "Konya", "Eskişehir"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin açılan ilk şeker fabrikası 26 Kasım 1926''da üretime geçen Kırklareli Alpullu Şeker Fabrikası''dır. (Uşak Şeker Fabrikası da aynı yıl Nuri Şeker öncülüğünde açılmıştır).',
  'İlk açılan ve şeker üreten fabrika Alpullu''dur; Uşak fabrikası da aynı yıl faaliyete geçmiştir.'
);

-- Soru 67 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde yerli sanayinin temeli olarak kurulan, temeli 1937''de atılan ve 1939''da faaliyete geçen Türkiye''nin ''ilk entegre demir-çelik fabrikası'' nerede kurulmuştur?',
  '{"options": ["Karabük", "İskenderun", "Ereğli", "Sivas", "Kırıkkale"], "correctIndex": 0}'::jsonb,
  'Karabük Demir Çelik Fabrikası (KARDEMİR), temeli 1937''de İsmet İnönü tarafından atılan Türkiye''nin ''ağır sanayi'' atılımının ilk büyük tesisidir.',
  'İskenderun ve Erdemir sonradan kurulmuştur; Türkiye''nin ilk demir-çelik fabrikası Karabük''tür.'
);

-- Soru 68 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde tarımda çiftçilere örnek olmak, modern ziraat yöntemlerini, tohum ıslahını ve hayvancılığı geliştirmek amacıyla bizzat Mustafa Kemal''in kendi parasıyla satın alıp kurduğu ve vasiyetiyle devlete bağışladığı tesis hangisidir?',
  '{"options": ["Atatürk Orman Çiftliği", "Dalaman Tarım İşletmesi", "Yalova Çiftliği", "Ceylanpınar Harası", "Silifke Çiftliği"], "correctIndex": 0}'::jsonb,
  'Mustafa Kemal Paşa 1925 yılında Ankara''da bataklık ve verimsiz bir araziyi ıslah ederek ''Gazi Orman Çiftliği''ni (AOÇ) kurmuş, 1937''de ise tüm çiftliklerini millete bağışlamıştır.',
  'Atatürk Orman Çiftliği bizzat Atatürk''ün şahsi gayretiyle modern tarım laboratuvarı olarak kurulmuştur.'
);

-- Soru 69 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930 yılında Dr. Refik Saydam''ın Sağlık Bakanlığı döneminde kurulan, aşı ve serum üreterek bulaşıcı hastalıklarla (tifo, kolera, kuduz) mücadelede dünyaca ünlü bir merkez haline gelen sağlık enstitüsü hangisidir?',
  '{"options": ["Refik Saydam Hıfzıssıhha Enstitüsü", "Numune Hastanesi", "Hilal-i Ahmer Cemiyeti", "Verem Savaş Dispanseri", "Yeşilay Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Refik Saydam Hıfzıssıhha Enstitüsü, Cumhuriyetin aşı ve koruyucu sağlık politikasının kalesidir. Çin''e dahi kolera aşısı gönderecek düzeyde uluslararası başarı sağlamıştır.',
  'Refik Saydam Türkiye Cumhuriyeti''nin ilk ve efsanevi Sağlık Bakanı''dır; enstitü onun adını taşır.'
);

-- Soru 70 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1934-1938 yılları arasında başarıyla uygulanan I. Beş Yıllık Sanayi Planı''nın hazırlanmasında ve finansmanında Türkiye''ye teknik ve mali destek sağlayan yabancı devlet aşağıdakilerden hangisidir?',
  '{"options": ["Sovyetler Birliği (SSCB)", "Almanya", "İngiltere", "Fransa", "Amerika Birleşik Devletleri"], "correctIndex": 0}'::jsonb,
  'I. Beş Yıllık Sanayi Planı, Sovyetler Birliği''nden Profesör Malışev başkanlığındaki heyetin hazırladığı rapor doğrultusunda hazırlanmış ve Sovyetlerden alınan 8 milyon dolarlık faizsiz krediyle finanse edilmiştir.',
  'Türkiye Sovyetler Birliği''nden teknik ve kredi desteği almış fakat komünist sistemi değil, karma ekonomi temelli Devletçilik modelini uygulamıştır.'
);

-- Soru 71 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk''ün ''Cumhuriyetçilik'' ilkesi ile doğrudan bağlantılı olan kavramlar ve anahtar kelimeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Milli irade ve ulusal egemenlik", "Çok partili demokratik rejim", "Seçimler ve parlamenter sistem", "Kadınlara siyasi seçme ve seçilme hakkı", "Ekonomik yatırımların kamu iktisadi teşebbüsleri (KİT) eliyle yürütülmesi"], "correctIndex": 4}'::jsonb,
  'Ekonomik yatırımların kamu veya devlet eliyle yapılması doğrudan ''Devletçilik'' ilkesidir. Cumhuriyetçilik ise siyasi rejim, oy kullanma, meclis ve seçimler ile ilgilidir.',
  'Devletçilik ekonomi ile; Cumhuriyetçilik ise yönetim ve sandık ile ilgilidir.'
);

-- Soru 72 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk ilkelerinden ''Milliyetçilik'' ve ''Halkçılık'' ile ilgili aşağıdaki inkılap eşleştirmelerinden hangisi doğrudur?',
  '{"options": ["Kabotaj Kanunu: Milliyetçilik — Aşar Vergisinin Kaldırılması: Halkçılık", "Medeni Kanun: Devletçilik — Türk Dil Kurumu: Cumhuriyetçilik", "Soyadı Kanunu: Devletçilik — Merkez Bankası: Halkçılık", "Tevhid-i Tedrisat: Barışçılık — Sümerbank: Laiklik", "İş Bankası: İnkılapçılık — Kılık Kıyafet: Milliyetçilik"], "correctIndex": 0}'::jsonb,
  'Kabotaj Kanunu karasularımızı millileştirdiği için Milliyetçilik; Aşar vergisinin kaldırılması köylüye eşitlik ve sosyal adalet getirdiği için Halkçılık ilkesidir.',
  'Kabotaj = Milliyetçilik; Aşar = Halkçılık en klasik ÖSYM eşleştirmesidir.'
);

-- Soru 73 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk ilkelerinden ''Laiklik'' anlayışına göre akılcılık ve bilimsellik esastır.

Buna göre aşağıdakilerden hangisi doğrudan Laiklik doğrultusunda atılmış bir adımdır?',
  '{"options": ["Şeriye ve Evkaf Vekaleti''nin kaldırılarak yerine Diyanet İşleri Başkanlığı''nın kurulması", "Merkez Bankası''nın kurulması", "I. Beş Yıllık Sanayi Planı''nın uygulanması", "Balkan Antantı''nın imzalanması", "İş Bankası''nın faaliyete geçmesi"], "correctIndex": 0}'::jsonb,
  'Şeriye ve Evkaf Vekaleti din ve vakıf işlerine bakan bakanlıktı. 3 Mart 1924''te kaldırılarak din işleri siyasetten arındırılmış ve Diyanet İşleri Başkanlığı kurularak laikliğe geçilmiştir.',
  'Diyanet İşleri Başkanlığı''nın kurulması laikleşme sürecinin en temel kurumsal adımıdır.'
);

-- Soru 74 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Antlaşması''ndan sonra Türkiye ile Yunanistan arasında uzun yıllar gerginliğe neden olan ''Nüfus Mübadelesi'' (Etabli Sorunu), 10 Haziran 1930 tarihinde imzalanan hangi antlaşma ile kesin çözüme kavuşturulmuştur?',
  '{"options": ["Ankara Ahali Sözleşmesi", "Atina Paktı", "Selanik Antlaşması", "Balkan Antantı", "Lozan Ek Protokolü"], "correctIndex": 0}'::jsonb,
  '10 Haziran 1930 Ankara Ahali Sözleşmesi ile İstanbul''daki Rumlar ile Batı Trakya''daki Türkler yerleşik (etabli) kabul edilmiş ve mübadele krizi çözülerek Türk-Yunan dostluk dönemi başlamıştır.',
  'Bu antlaşmadan sonra Yunan Başbakanı Venizelos Türkiye''yi ziyaret etmiş ve Atatürk''ü Nobel Barış Ödülü''ne aday göstermiştir.'
);

-- Soru 75 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930 yılında Türkiye''yi ziyaret eden ve Mustafa Kemal Atatürk''ü dünya barışına katkılarından ötürü ''Nobel Barış Ödülü''ne resmen aday gösteren yabancı devlet adamı kimdir?',
  '{"options": ["Elefterios Venizelos (Yunanistan Başbakanı)", "Franklin D. Roosevelt", "Winston Churchill", "General MacArthur", "Kral Edward"], "correctIndex": 0}'::jsonb,
  'Yunanistan Başbakanı Elefterios Venizelos, Türk-Yunan barışına öncülük eden Mustafa Kemal Atatürk''ü 1934 yılında Nobel Barış Ödülü Komitesi''ne resmi bir mektupla aday göstermiştir.',
  'Kurtuluş Savaşı''nda savaştığımız Yunanistan''ın lideri Venizelos''un Atatürk''ü Nobel''e aday göstermesi ''Yurtta sulh, cihanda sulh'' ilkesinin evrensel zaferidir.'
);

-- Soru 76 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1936 Montrö Boğazlar Sözleşmesi ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?',
  '{"options": ["Uluslararası Boğazlar Komisyonu lağvedilerek tüm yetkileri Türkiye Devleti''ne devredilmiştir.", "Türkiye''nin Boğazlar bölgesinde asker ve tahkimat bulundurma hakkı kabul edilmiştir.", "Ticaret gemilerinin Boğazlar''dan geçişi serbest bırakılmıştır.", "Karadeniz''e kıyısı olmayan devletlerin savaş gemilerinin geçişine tonaj ve süre sınırlaması (en fazla 21 gün) getirilmiştir.", "Boğazlar Sözleşmesi''nin süresi 99 yıl olarak belirlenmiş ve feshedilemez kılınmıştır."], "correctIndex": 4}'::jsonb,
  'Montrö Sözleşmesi 20 yıllık süreyle imzalanmıştır; ancak taraflar itiraz etmediği sürece kendiliğinden uzama maddesi içerdiği için günümüzde de aynen yürürlüktedir. 99 yıl değildir.',
  'Montrö 20 yıllık süreyle imzalanmıştır; fakat günümüzde hala yürürlükte olan tek kurucu deniz sözleşmesidir.'
);

-- Soru 77 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Balkan Antantı''na Bulgaristan, Sadabad Paktı''na ise Suriye katılmamıştır. Bu iki ''katılmayan ülke'' ÖSYM''nin en sevdiği çeldiricidir.'
);

-- Soru 78 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Milletler Cemiyeti tarafından Hatay meselesini araştırmak üzere bölgeye gönderilen ve hazırladığı raporda ''Hatay nüfusunun çoğunluğunun Türk olduğunu ve Hatay''ın Suriye''ye bağlanamayacağını'' belirten uluslararası raportör kimdir?',
  '{"options": ["Sandler (Sandler Raporu)", "General Harbord", "Amiral Bristol", "King-Crane", "Lord Curzon"], "correctIndex": 0}'::jsonb,
  'İsveçli diplomat Sandler''in hazırladığı ''Sandler Raporu'' doğrultusunda Milletler Cemiyeti Hatay''ın özerkliğini kabul etmiş ve 1938''de Bağımsız Hatay Cumhuriyeti kurulmuştur.',
  'Harbord Ermenilerle, Bristol İzmir işgaliyle, Sandler ise doğrudan Hatay meselesiyle ilgilidir.'
);

-- Soru 79 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '2 Eylül 1938''de kurulan Bağımsız Hatay Cumhuriyeti''nin Cumhurbaşkanı ve Başbakanı aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Tayfur Sökmen - Abdurrahman Melek", "Abdurrahman Melek - Tayfur Sökmen", "Şükrü Saraçoğlu - Suat Davaz", "Cemal Gürsel - Nihat Erim", "İsmet İnönü - Celal Bayar"], "correctIndex": 0}'::jsonb,
  'Bağımsız Hatay Cumhuriyeti''nin ilk ve tek Cumhurbaşkanı Tayfur Sökmen; Başbakanı ise Abdurrahman Melek''tir. Hatay Meclisi 23 Haziran 1939''da anavatana katılma kararı almıştır.',
  'Cumhurbaşkanı Tayfur Sökmen, Başbakan Abdurrahman Melek''tir. İsimlerin yer değiştirmesine dikkat edilmelidir.'
);

-- Soru 80 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Toprak kazanma ve soydaşları koruma gayreti tartışmasız biçimde Milliyetçiliktir.'
);

