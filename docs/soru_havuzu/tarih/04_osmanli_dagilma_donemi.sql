-- ==========================================================================
-- KADRO SORU HAVUZU — TARİH (ÜNİTE 4: OSMANLI DAĞILMA DÖNEMİ VE SİYASİ TARİH)
-- Toplam 40 Çoktan Seçmeli Soru (ÖSYM Çeldirici Tuzağı Analizli)
-- ==========================================================================

-- Soru tar_odd_001
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Beyliği''nin kısa sürede büyüyüp cihanşümul bir imparatorluğa dönüşmesinde jeopolitik konumunun yanı sıra uyguladığı istimalet (hoşgörü) ve iskân siyaseti belirleyici olmuştur. Ayrıca kuruluş yıllarında özellikle Bizans tekfurları ile çatışmaktan kaçınarak ''görünüşte dostça geçinme'' anlamına gelen bir dış politika taktiği izlenmiştir.

Osmanlı Devleti''nin kuruluş döneminde Bizans yerel yöneticileriyle uyguladığı bu uzlaşmacı ve esnek diplomatik taktiğe ne ad verilirdi?',
  '{"options": ["İstimalet", "Müdârâ", "Müdahale", "İskân", "Dirlik"], "correctIndex": 1}'::jsonb,
  '**Müdârâ**, Osmanlı Devleti''nin kuruluş yıllarında henüz askeri gücünün yetersiz olduğu evrede Bizans tekfurları ile iyi geçinme, durumu idare etme ve görünüşte dostane diplomasi yürütme siyasetine verilen addır. İstimalet ise fethedilen gayrimüslim halkın gönlünü kazanmaya dönük adalet ve hoşgörü politikasıdır.',
  'ÖSYM İstimalet (hoşgörü/kalp kazanma) ile Müdârâ (tekfurlarla görünüşte dostça geçinme taktiği) kavramlarını karşılaştırarak adayları yanıltır. Ramazan Yetgin notlarında "Müdârâ = Görünüşte dostça geçinme" şeklinde özel bir uyarıyla vurgulanmıştır.'
);

-- Soru tar_odd_002
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osman Bey döneminde 1302 yılında Bizans tekfurlarının birleşik ordusuna karşı yapılan ve ünlü tarihçi Halil İnalcık tarafından Osmanlı Devleti''nin gerçek bağımsızlık tarihi ve hanedan kuruculuğunun tescili kabul edilen ilk Osmanlı-Bizans savaşı aşağıdakilerden hangisidir?',
  '{"options": ["Maltepe (Palekanon) Savaşı", "Koyunhisar (Bafeon) Savaşı", "Sazlıdere Savaşı", "Sırpsındığı Savaşı", "Çirmen Savaşı"], "correctIndex": 1}'::jsonb,
  '1302 **Koyunhisar (Bafeon) Savaşı**, Osmanlı Beyliği ile Bizans İmparatorluğu arasındaki ilk resmi meydan savaşıdır. Bu zaferle Bursa''nın üç taraftan kuşatılması kolaylaşmış ve Prof. Dr. Halil İnalcık''a göre Osmanlı Devleti bu zaferle gerçek anlamda kurulmuştur.',
  'Adaylar Maltepe/Palekanon Savaşı (1329 - Orhan Bey dönemi, İznik''in fethi öncesi) ile Koyunhisar Savaşı''nı (1302 - Osman Bey) birbirine karıştırmaktadır.'
);

-- Soru tar_odd_003
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Orhan Bey döneminde Balıkesir ve Çanakkale çevresinde hüküm süren Karesioğulları Beyliği''nin iç karışıklıklarından yararlanılarak savaş yapılmaksızın Osmanlı topraklarına katılması sağlanmıştır.

Karesioğulları Beyliği''nin Osmanlı Devleti''ne katılmasının Türk ve Osmanlı tarihi açısından en önemli iki sonucu aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Anadolu Türk siyasi birliğini sağlama yolunda ilk adımın atılması ve Karesi donanması sayesinde ilk kez Rumeli''ye (Çimpe Kalesi) geçilmesi", "Bizans İmparatorluğu''nun vergiye bağlanması ve ilk altın paranın basılması", "Bursa''nın başkent yapılması ve ilk kez Divan teşkilatının kurulması", "Anadolu Türk siyasi birliğinin kesin olarak tamamlanması ve Memlük ilişkilerinin bozulması", "Karadeniz''in bir Türk gölü haline gelmesi ve Kırım Hanlığı''nın bağlanması"], "correctIndex": 0}'::jsonb,
  'Karesioğulları''nın fethiyle; 1. Anadolu Türk siyasi birliği (ATSB) için ilk adım atılmıştır (son adım ise Dulkadiroğulları''dır), 2. Beyliğin güçlü deniz gücü ve komutanları (Evrenos Gazi, Hacı İlbeyi) Osmanlı hizmetine girmiş ve Gelibolu''da Çimpe Kalesi alınarak Rumeli''ye ilk kez ayak basılmıştır.',
  'Adaylar "Anadolu Türk siyasi birliğini sağlamada İLK adım" (Karesioğulları) ile "KESİN adım" (Turnadağ Savaşı ile Dulkadiroğulları) ayrımını karıştırabilir.'
);

-- Soru tar_odd_004
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'I. Murat döneminde 1389 yılında Haçlı ordusuna karşı kazanılan I. Kosova Savaşı ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Osmanlı ordusu savaş alanında ilk kez ateşli silah olarak top kullanmıştır.", "Savaş meydanında şehitlerin kanı üzerine yansıyan hilal ve yıldız görüntüsü modern Türk bayrağının ilham kaynağı kabul edilmiştir.", "Savaş meydanını gezerken yaralı Sırp asilzadesi Miloş Obiliç tarafından şehit edilen I. Murat, savaş meydanında şehit düşen ilk ve tek Osmanlı padişahıdır.", "Bu zafer sonucunda Balkanlar kesin olarak Türk yurdu haline gelmiş ve Avrupalılar savunmaya çekilmiştir.", "Bu suikasttan sonra Osmanlı saray protokol kuralları değiştirilerek padişahlara belirli bir mesafeden fazla yaklaşılması yasaklanmıştır."], "correctIndex": 3}'::jsonb,
  'Balkanların kesin olarak Türk yurdu haline geldiği ve Avrupalıların savunmaya çekildiği zafer I. Kosova değil; 1448 yılındaki **II. Kosova Savaşı**dır (II. Murat dönemi). I. Kosova Savaşı ise güney Slavlarının direncini kırmıştır fakat nihai tescil II. Kosova''dadır.',
  'ÖSYM I. Kosova (I. Murat) ile II. Kosova''nın (II. Murat) sonuçlarını sürekli birbirine karıştırarak sorar. Miryokefalon ile benzerlik gösterip Balkanları kesinleştiren II. Kosova''dır.'
);

-- Soru tar_odd_005
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'İstanbul''u tarihte ilk kez kuşatan Osmanlı padişahı olan, kuşatmaya denizden destek sağlamak için Anadolu Hisarı''nı (Güzelcehisar) yaptıran ve 1396 Niğbolu Zaferi''nden sonra Abbasi Halifesi I. el-Mütevekkil tarafından kendisine **"Sultan-ı İklim-i Rum"** (Anadolu Diyarının Sultanı) unvanı tevcih edilen Osmanlı padişahı aşağıdakilerden hangisidir?',
  '{"options": ["I. Murat", "Yıldırım Bayezid", "Fatih Sultan Mehmet", "Çelebi Mehmet", "II. Murat"], "correctIndex": 1}'::jsonb,
  '**Yıldırım Bayezid (I. Bayezid)**, İstanbul''u 4 kez kuşatmış, Anadolu Hisarı''nı inşa ettirmiş ve 1396 Niğbolu Zaferi''nin ganimetleriyle Bursa Ulu Camii''ni yaptırmıştır. Halife kendisine "Sultan-ı İklim-i Rum" unvanını vermiştir.',
  'Adaylar Anadolu Hisarı''nı (Yıldırım Bayezid) Rumeli Hisarı (Fatih Sultan Mehmet - Boğazkesen) ile karıştırabilir. Niğbolu zaferi ve Sultan-ı İklim-i Rum unvanı münhasıran Yıldırım''a aittir.'
);

-- Soru tar_odd_006
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1402 Ankara Savaşı''nda Yıldırım Bayezid''in Timur''a mağlup olarak esir düşmesiyle Osmanlı Devleti 1402-1413 yılları arasında 11 yıl süren ve kardeşler arasında taht kavgalarının yaşandığı "Fetret Devri"ne (Fasıla-i Saltanat) girmiştir.

Aşağıdakilerden hangisi Ankara Savaşı ve Fetret Devri''nin sonuçları arasında gösterilemez?',
  '{"options": ["Anadolu beyliklerinin yeniden bağımsızlıklarını ilan etmesiyle Anadolu Türk siyasi birliğinin bozulması", "Bizans''ın ömrünün ve İstanbul''un fethinin yaklaşık 50 yıl gecikmesi", "Balkan topraklarındaki gayrimüslim tebaanın adil tımar ve istimalet politikası sayesinde Osmanlı''ya sadık kalıp büyük çaplı isyan çıkarmaması", "Osmanlı Devleti''nin tarih sahnesinden tamamen silinerek yıkılması", "Yıldırım''ın oğlu Şehzade Mustafa''nın Timur tarafından rehin olarak Semerkant''a götürülmesi"], "correctIndex": 3}'::jsonb,
  'Osmanlı Devleti Ankara Savaşı ile yıkılmamış; 11 yıllık bir fetret ve kriz döneminden sonra Çelebi Mehmet''in kardeşlerini bertaraf etmesiyle toparlanarak varlığını sürdürmüştür.',
  'ÖSYM "Balkanlarda neden isyan çıkmadı?" sorusunu çok sever: Osmanlı''nın uyguladığı istimalet (hoşgörü) ve adil vergi/tımar siyaseti sayesinde Balkan halkları Fetret Devri''nde bile devlete sadık kalmıştır.'
);

-- Soru tar_odd_007
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Fetret Devri''ne son vererek devletin parçalanmasını önlediği için tarihçiler tarafından **"Osmanlı Devleti''nin İkinci Kurucusu"** olarak nitelendirilen; Venedik ile tarihteki ilk deniz savaşını (Çalı Bey Savaşı) yapan ve Osmanlı tarihindeki ilk dini-sosyal içerikli halk ayaklanması olan **Şeyh Bedrettin İsyanı**''nı bastıran padişah kimdir?',
  '{"options": ["II. Murat", "Çelebi Mehmet (I. Mehmet)", "Yıldırım Bayezid", "Fatih Sultan Mehmet", "Orhan Bey"], "correctIndex": 1}'::jsonb,
  '**Çelebi Mehmet (I. Mehmet)**, kardeşleri İsa, Musa ve Süleyman Çelebi''yi mağlup ederek Fetret Devri''ni bitirmiş ve ikinci kurucu sayılmıştır. Döneminde Venedik ile Çalı Bey deniz savaşı yapılmış, Şeyh Bedrettin İsyanı bastırılmıştır.',
  'Şeyh Bedrettin İsyanı (Osmanlı''nın ilk dini isyanı) ile Baba İshak İsyanı (Türk tarihinin ve Selçuklu''nun ilk dini isyanı) ayrımına dikkat edilmelidir.'
);

-- Soru tar_odd_008
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1444 yılında Macarlarla imzalanan Edirne-Segedin Antlaşması''nın ardından tahtı 12 yaşındaki oğlu II. Mehmet''e bırakan II. Murat döneminde; maaşlarının düşüklüğünü bahane eden yeniçerilerin Edirne''de başlattığı ve **Osmanlı tarihindeki ilk yeniçeri isyanı** kabul edilen ayaklanma aşağıdakilerden hangisidir?',
  '{"options": ["Çınar Vakası", "Buçuktepe İsyanı", "Şahkulu İsyanı", "Patrona Halil İsyanı", "Kabakçı Mustafa İsyanı"], "correctIndex": 1}'::jsonb,
  'Edirne''de çıkan **Buçuktepe İsyanı (1446)**, yeniçerilerin ulufe maaşlarına buçuk akçe zam almasıyla sonuçlanan tarihteki ilk yeniçeri isyanıdır. Bu isyan üzerine II. Murat tekrar tahta geçirilmiştir.',
  'Adaylar ilk yeniçeri isyanı olarak Genç Osman''ı öldüren isyanı veya Çınar Vakası''nı düşünebilir. İlk yeniçeri ayaklanması kuruluş dönemindeki Buçuktepe İsyanı''dır.'
);

-- Soru tar_odd_009
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
  'ÖSYM "Bizans''ın yeniden dirilmesini önleme amacı" sorularında şıklara Kırım veya Sinop''u çeldirici olarak koyar. Bu hedefe yönelik fetihler sadece Mora ve Trabzon Rum İmparatorluğu''dur.'
);

-- Soru tar_odd_010
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Fatih''in vefatından sonra tahta geçen II. Bayezid dönemi, kardeşi Cem Sultan''ın taht mücadelesini kaybederek önce Rodos Şövalyelerine, ardından Papalık ve Fransa''ya sığınmasıyla büyük bir iç ve dış buhrana sahne olmuştur.

Cem Sultan Olayı''nın Osmanlı Devleti dış politikası üzerindeki en temel olumsuz etkisi aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin Batı''da (Avrupa) fetih politikasını durdurarak pasif ve savunmacı bir siyaset izlemek zorunda kalması", "İran Safevileri ile ilk kez Amasya Antlaşması''nın imzalanması", "Anadolu Türk siyasi birliğinin tamamen parçalanması", "Osmanlı donanmasının Navarin''de yakılması", "Mısır Seferi''nin iptal edilerek Memlüklerle ittifak yapılması"], "correctIndex": 0}'::jsonb,
  'Cem Sultan''ın Avrupalıların elinde bir koz ve rehin olarak tutulması, II. Bayezid''in Batı''ya yönelik seferler yapmasını engellemiş; bu yüzden II. Bayezid dönemi "Yükselme dönemi içinde bir Duraklama dönemi" olarak anılmıştır.',
  'Cem Sultan olayı Osmanlı tarihinde "bir iç meselenin ilk kez uluslararası bir dış soruna dönüşmesi" örneğidir. Batı fetihlerinin durmasının ana gerekçesidir.'
);

-- Soru tar_odd_011
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Yavuz Sultan Selim 1515 yılında Maraş ve çevresinde hüküm süren Dulkadiroğulları Beyliği''ne karşı kazandığı hangi savaş ile bu beyliğe son vermiş ve böylece Anadolu Türk siyasi birliğini (ATSB) kesin olarak sağlamıştır?',
  '{"options": ["Çaldıran Savaşı", "Mercidabık Savaşı", "Turnadağ Savaşı", "Otlukbeli Savaşı", "Ridaniye Savaşı"], "correctIndex": 2}'::jsonb,
  '**1515 Turnadağ Savaşı**, Yavuz Sultan Selim''in Dulkadiroğulları Beyliği''ne son verdiği savaştır. Bu zaferle Anadolu''daki son bağımsız beylik de Osmanlı''ya katılmış ve Anadolu Türk siyasi birliği kesin olarak tamamlanmıştır.',
  'ÖSYM formülü: ATSB için ilk adım = Karesioğulları; ATSB''yi ilk kez geniş ölçüde sağlayan = Yıldırım Bayezid; ATSB''yi kesin olarak tamamlayan = Yavuz Sultan Selim (Turnadağ Zaferi).'
);

-- Soru tar_odd_012
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Yavuz Sultan Selim''in 1516 Mercidabık ve 1517 Ridaniye seferleriyle Memlük Devleti''ni ortadan kaldırmasının sonuçları ile ilgili aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Halifelik makamı Osmanlı hanedanına geçmiş ve Osmanlı Devleti''nin teokratik yapısı güçlenmiştir.", "Hicaz bölgesinin fethiyle Yavuz Sultan Selim ''Hadimü''l-Haremeyn'' (Mekke ve Medine''nin Hizmetkârı) unvanını almıştır.", "Baharat Yolu''nun denetimi tamamen Osmanlı Devleti''nin eline geçmiştir.", "Kutsal Emanetler İstanbul''a getirilerek Topkapı Sarayı Hırka-i Saadet Dairesi''nde muhafaza edilmiştir.", "Avrupa''da Martin Luther öncülüğünde başlayan Reform hareketleri Osmanlı''nın desteğiyle tamamen engellenmiştir."], "correctIndex": 4}'::jsonb,
  'Mısır Seferi devam ederken Almanya''da Martin Luther Reform hareketlerini başlatmıştır; Osmanlı Reform''a engel olmamış, aksine Şarlken''in ve Katolik kilisesinin parçalanmasını kendi lehine görerek Protestanları desteklemiştir.',
  'Ramazan Yetgin notlarında özel olarak geçen "Eş Zamanlı Tarih" bilgisidir: Ridaniye Savaşı yapıldığı sırada Avrupa''da Martin Luther Reform hareketini başlatmıştır.'
);

-- Soru tar_odd_013
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'Kanuni Sultan Süleyman döneminde 1533 yılında Avusturya ile imzalanan İstanbul Antlaşması''nda (İbrahim Paşa Antlaşması) yer alan;

"Avusturya Arşidükü (Kralı) protokol ve diplomatik statü bakımından Osmanlı Sadrazamına denk sayılacaktır." maddesinin uluslararası ilişkilerdeki doğrudan yorumu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin Orta Avrupa''da mutlak siyasi üstünlüğü ele geçirdiği", "Avusturya''nın Osmanlı topraklarına katıldığı", "Avusturya''nın tüm ordu birliklerini terhis ettiği", "Osmanlı Devleti''nin Avrupa diplomasisinde eşitlik (mütekabiliyet) ilkesini benimsediği", "Kutsal Roma Germen İmparatorluğu''nun yıkıldığı"], "correctIndex": 0}'::jsonb,
  'Bir devletin kralının Osmanlı''nın 2 numaralı adamı olan Sadrazama eşit sayılması, Osmanlı padişahının Avrupa''daki tüm kralların fevkinde bir "Cihan Hükümdarı" olduğunu ve Orta Avrupa''da ezici bir siyasi üstünlük kurduğunu kanıtlar. Bu üstünlük 1606 Zitvatorok Antlaşması''na kadar devam etmiştir.',
  'ÖSYM "Mütekabiliyet (karşılıklı eşitlik)" kavramını çeldirici olarak sunar. İstanbul Antlaşması''nda mütekabiliyet yoktur, tek taraflı Osmanlı üstünlüğü vardır. Mütekabiliyet 1606 Zitvatorok ile gelecektir.'
);

-- Soru tar_odd_014
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sokullu Mehmet Paşa''nın Sadrazamlığı döneminde ortaya atılan ancak Mimar Sinan''ın vefatı ve Kırım hanlarının ilgisizliği nedeniyle tamamlanamayan Don-Volga Kanal Projesi''nin temel amaçları arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Rusya''nın güneye inmesini ve Kafkaslara yayılmasını engellemek", "Kırım Hanlığı''nı Rus tehdidine karşı korumak", "Hazar Denizi ile Karadeniz''i birleştirerek Orta Asya Türkleri ile doğrudan irtibat kurmak", "İran üzerine yapılacak askeri seferlerde donanmadan faydalanmak ve İran''ı kuzeyden baskı altına almak", "Süveyş Kanalı üzerinden Baharat Yolu''nu yeniden canlandırmak"], "correctIndex": 4}'::jsonb,
  'Süveyş Kanalı Projesi, Akdeniz ile Kızıldeniz''i birleştirmeyi ve Baharat Yolu''nu canlandırmayı hedefleyen bambaşka bir güney projesidir; Don ve Volga ırmaklarıyla bir ilgisi yoktur.',
  'ÖSYM Don-Volga Projesi ile Süveyş Kanalı Projesi''nin hedeflerini birbirine katarak çeldirici hazırlar. Don-Volga = Rusya, Orta Asya Türkleri ve İran odaklıdır.'
);

-- Soru tar_odd_015
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı aydınlarının ve vakanüvislerinin 17. yüzyıl için "Tereddi ve Tegayyür" (Bozulma ve Yozlaşma) tabirini kullandıkları Duraklama Dönemi''ne girilmesinde;

Aşağıdakilerden hangisi devletin iç dinamiklerinden kaynaklanan bir neden değil, **dış (harici) bir neden** olarak kabul edilir?',
  '{"options": ["Sancağa çıkma usulünün kaldırılarak tecrübesiz şehzadelerin ve küçük yaştaki çocukların tahta geçmesi", "Beşik ulemalığı sisteminin getirilmesiyle medreselerde eğitimin bozulması", "İmparatorluğun sınırlarının okyanuslar, çöller ve güçlü devletler gibi doğal sınırlara ulaşması", "Tımar sisteminin bozulmasıyla eyalet ordusunun dağılması ve Celali isyanlarının çıkması", "Saray kadınlarının ve ocak ağalarının devlet yönetimine müdahale etmesi"], "correctIndex": 2}'::jsonb,
  'İmparatorluğun sınırlarının çöl, okyanus, dağlar veya güçlü Avusturya/İran gibi "doğal sınırlara ulaşması", duraklamanın iç bünyeden değil coğrafi ve jeopolitik dış koşullarından kaynaklanan dış nedenidir. Diğer şıklar iç nedenlerdir.',
  'Ramazan Yetgin notlarında özel uyarı: "Doğal sınırlara ulaşılması iç neden değil, dış nedendir!" Adaylar bu detayı gözden kaçırıp iç neden zannedebilir.'
);

-- Soru tar_odd_016
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti ile Avusturya arasında 1606 yılında imzalanan ve Osmanlı Devleti''nin 1533 İstanbul Antlaşması ile kazandığı Orta Avrupa''daki diplomatik ve siyasi üstünlüğünü sona erdiren antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Vasvar Antlaşması", "Zitvatorok Antlaşması", "Bucaş Antlaşması", "Karlofça Antlaşması", "Pasarofça Antlaşması"], "correctIndex": 1}'::jsonb,
  '**1606 Zitvatorok Antlaşması** ile Avusturya Arşidükü protokolde tekrar Osmanlı Padişahına eşit sayılmış (mütekabiliyet ilkesi), yıllık vergi kaldırılmış ve Osmanlı Devleti''nin Kanuni''den beri süren Orta Avrupa''daki siyasi üstünlüğü sona ermiştir.',
  'ÖSYM üstünlüğü kazandıran antlaşma (1533 İstanbul) ile üstünlüğü kaybettiren antlaşmayı (1606 Zitvatorok) sürekli karşılaştırır.'
);

-- Soru tar_odd_017
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '17. yüzyıl Osmanlı siyasi tarihi ve antlaşmaları ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["1590 Ferhat Paşa Antlaşması $\\rightarrow$ Osmanlı Devleti Doğu''da en geniş sınırlarına ulaşmıştır.", "1639 Kasr-ı Şirin Antlaşması $\\rightarrow$ Zağros Dağları sınır kabul edilmiş, günümüz Türkiye-İran sınırı büyük ölçüde çizilmiştir.", "1669 Girit''in Fethi $\\rightarrow$ 24 yıllık zorlu bir kuşatmanın ardından Venedik''ten alınmıştır.", "1672 Bucaş Antlaşması $\\rightarrow$ Lehistan''dan Podolya ve Kamaniçe alınarak Osmanlı Devleti Batı''da en geniş sınırlarına ulaşmıştır.", "1664 Vasvar Antlaşması $\\rightarrow$ Osmanlı Devleti ilk kez Batı''da büyük çapta toprak kaybetmiştir."], "correctIndex": 4}'::jsonb,
  '1664 Vasvar Antlaşması Osmanlı''nın 17. yüzyılda Avusturya''ya karşı kazandığı **son kazançlı** antlaşmadır (Uyvar ve Neograd kaleleri alınmıştır). Osmanlı''nın Batı''da ilk kez büyük çapta toprak kaybettiği antlaşma ise 1699 **Karlofça Antlaşması**dır.',
  'Adaylar Vasvar ile Karlofça''yı karıştırabilir. Vasvar 17. yüzyılda Avusturya''ya karşı son karlı antlaşmadır; Karlofça ise büyük felaket ve gerilemenin başlangıcıdır.'
);

-- Soru tar_odd_018
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1683 II. Viyana Kuşatması''nın bozgunla sonuçlanması üzerine Papa''nın çağrısıyla Osmanlı Devleti''ni Avrupa''dan tamamen atmak amacıyla kurulan "Kutsal İttifak" bünyesinde 16 yıl süren savaşlarda Osmanlı Devleti''ne karşı savaşan devletler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Avusturya", "Rusya", "Lehistan", "Venedik", "Fransa"], "correctIndex": 4}'::jsonb,
  'Kutsal İttifak devletleri: Avusturya, Rusya, Lehistan, Venedik ve Malta''dır [Şifre: MARVeL]. **Fransa**, kapitülasyon hakları ve Avusturya ile olan geleneksel rekabeti nedeniyle Kutsal İttifak''ta yer almamıştır.',
  'ÖSYM Kutsal İttifak üyelerini sorarken seçeneklere ısrarla Fransa veya İngiltere''yi koyar. Kutsal İttifak''ta Fransa yer almamıştır.'
);

-- Soru tar_odd_019
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1699 Karlofça Antlaşması sonrasında Rusya ile imzalanan 1700 İstanbul Antlaşması''nın Rusya açısından en stratejik tarihi önemi aşağıdakilerden hangisidir?',
  '{"options": ["Azak Kalesi''ni ele geçirerek tarihinde ilk kez Karadeniz''e inme fırsatı yakalaması ve İstanbul''da daimi elçi bulundurma hakkı elde etmesi", "Kırım''ı resmen kendi topraklarına ilhak etmesi", "Balkanlardaki Ortodoksların dini hamisi kabul edilmesi", "Boğazlar üzerinde ortak denetim hakkı kazanması", "Osmanlı Devleti''nden ilk kez kapitülasyon koparması"], "correctIndex": 0}'::jsonb,
  '1700 İstanbul Antlaşması ile **Azak Kalesi** Ruslara verilmiş ve Rusya Çarlığı tarihinde ilk kez Karadeniz''e çıkış kapısı elde etmiştir. Ayrıca Rusya ilk kez İstanbul''da elçilik açma hakkı kazanmıştır.',
  'Kırım''ın bağımsız olması (1774 Küçük Kaynarca) veya ilhakı (1783) ile Azak Kalesi''nin verilmesi (1700 İstanbul) karıştırılmamalıdır. Karadeniz''e ilk adım Azak Kalesi ile atılmıştır.'
);

-- Soru tar_odd_020
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'IV. Mehmet döneminde yeniçerilerin sarayı basarak istedikleri 30''a yakın devlet adamını Sultanahmet Meydanı''ndaki ulu bir çınar ağacına astıkları, mitolojideki meyveleri insan başı olan ağaca benzetilerek tarihe "Vakay-ı Vakvakiye" (Çınar Vakası) olarak geçen olay aşağıdakilerden hangisinin bir sonucudur?',
  '{"options": ["Celali İsyanları", "İstanbul (Yeniçeri) İsyanları", "Eyalet İsyanları", "Şeyh Sait İsyanı", "Patrona Halil İsyanı"], "correctIndex": 1}'::jsonb,
  '**Vakay-ı Vakvakiye (1656)**, ulufe maaşlarının düşük ayarlı akçe ile ödenmesine isyan eden yeniçerilerin sarayı basarak devlet adamlarını çınar ağacına astıkları en kanlı İstanbul/Merkez isyanıdır.',
  'Adaylar Çınar Vakası''nı Vaka-i Hayriye (Yeniçeri Ocağı''nın kaldırılması) ile karıştırabilir. Biri yeniçerilerin yaptığı darbe, diğeri yeniçerilerin imha edilmesidir.'
);

-- Soru tar_odd_021
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '17. yüzyıl (Duraklama Dönemi) ıslahat hareketlerinin genel özellikleri ile ilgili olarak aşağıda verilen yargılardan hangisi yanlıştır?',
  '{"options": ["Islahatlar şahısların ömrüyle sınırlı kalmış, devlet politikası haline gelememiştir.", "Sorunların kökenine inilememiş, yüzeysel ve askeri-mali tedbirlerle yetinilmiştir.", "Islahatlar padişah ve vezirlerin baskı ve şiddet politikasıyla halka benimsetilmek istenmiştir.", "Avrupa''daki bilimsel ve teknik gelişmeler yakından takip edilerek Batı kurumları örnek alınmıştır.", "Fatih ve Kanuni dönemleri ideal model kabul edilerek Kanun-ı Kadim''e dönülmeye çalışılmıştır."], "correctIndex": 3}'::jsonb,
  '17. yüzyıl ıslahatlarında **kesinlikle Avrupa etkisi YOKTUR!** Osmanlı bu yüzyılda kendini hala Batı''dan üstün görmüş, çareyi Kanun-ı Kadim''e (eski parlak günlere) dönmekte aramıştır. Avrupa ilk kez 18. yüzyılda (Lale Devri) örnek alınacaktır.',
  'ÖSYM''nin en çok düşürdüğü klasik kuraldır: 17. Yüzyıl = Avrupa etkisi YOK. 18. Yüzyıl = Avrupa etkisi VAR.'
);

-- Soru tar_odd_022
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı tarihinde ilk kez saray dışından (Türk kızıyla) evlenerek saray bürokrasisinin gücünü kırmaya çalışan, Şeyhülislam''ın yetkilerini kısıtlayan ve Hotin Seferi''ndeki disiplinsizlikleri üzerine Yeniçeri Ocağı''nı kaldırmayı düşündüğü için Yedikule Zindanları''nda yeniçerilerce boğdurulan ilk ıslahatçı padişah kimdir?',
  '{"options": ["Genç Osman (II. Osman)", "IV. Murat", "I. Ahmet", "Tarhuncu Ahmet Paşa", "III. Selim"], "correctIndex": 0}'::jsonb,
  '**Genç Osman (II. Osman)**, Osmanlı tarihinde ilk köklü ıslahat girişiminde bulunan padişahtır. Başkenti Anadolu''ya taşımayı ve Yeniçeri Ocağı''nı kaldırmayı planlamış, ancak yeniçeriler tarafından hunharca katledilmiştir.',
  'Adaylar Yeniçeri Ocağı''nı kaldıran II. Mahmut ile "kaldırmayı ilk kez düşünen" Genç Osman''ı karıştırabilmektedir.'
);

-- Soru tar_odd_023
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Bağdat Seferi''ndeki kahramanlıkları sebebiyle "Bağdat Fatihi" olarak anılan; ilk kez Şeyhülislam idam ettiren; Koçi Bey ve Kâtip Çelebi''ye devletin bozulma nedenlerini araştıran risaleler hazırlatan ve İstanbul yangınlarını önlemek amacıyla gece sokağa çıkma, tütün ve kahvehane yasakları getiren 17. yüzyıl padişahı kimdir?',
  '{"options": ["I. Ahmet", "II. Osman", "IV. Murat", "IV. Mehmet", "Köprülü Mehmet Paşa"], "correctIndex": 2}'::jsonb,
  '**IV. Murat**, sert otoritesiyle tanınan Bağdat Fatihi''dir. Koçi Bey Risalesi bu dönemin en ünlü raporudur. Kahvehaneleri kapatıp içki-tütün yasağı koymuştur.',
  'İlk içki yasağını getiren I. Ahmet''tir; fakat kahvehaneleri kapatıp sokak yasağı ve tütün yasağını şiddetle uygulayan IV. Murat''tır.'
);

-- Soru tar_odd_024
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1711 yılında Baltacı Mehmet Paşa komutasındaki Osmanlı ordusunun Prut Nehri kıyısında Rus Çarı I. Petro''yu kuşatarak mağlup etmesi ve imzalanan Prut Antlaşması ile Azak Kalesi''nin geri alınması Osmanlı Devleti''nde aşağıdakilerden hangisine yol açmıştır?',
  '{"options": ["Karlofça ve İstanbul antlaşmalarıyla kaybedilen toprakların geri alınabileceği umudunun doğmasına", "Avrupa''nın üstünlüğünün kabul edilerek Lale Devri''ne girilmesine", "Kırım''ın bağımsızlığının tanınmasına", "Rusya ile ilk kez dostluk antlaşması imzalanmasına", "Osmanlı Devleti''nin ilk kez dış borç almasına"], "correctIndex": 0}'::jsonb,
  '1711 Prut Zaferi, Osmanlı Devleti''nde 1699 Karlofça ile kaybedilen toprakların geri kazanılabileceğine dair büyük bir güven ve umut dalgası yaratmıştır. Ancak 1718 Pasarofça Antlaşması bu umudu söndürecektir.',
  'Prut umut doğurur; Pasarofça ise bu umutları bitirip Batı''nın üstünlüğünü kabul ettirir.'
);

-- Soru tar_odd_025
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1718 Pasarofça Antlaşması ile başlayan ve 1730 Patrona Halil İsyanı ile sona eren "Lale Devri" ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Dönemin padişahı III. Ahmet, sadrazamı ise Nevşehirli Damat İbrahim Paşa''dır.", "Bu dönemde askeri alanda köklü yenilikler yapılarak Nizam-ı Cedit ordusu kurulmuştur.", "İbrahim Müteferrika ve Said Efendi tarafından ilk özel Türk matbaası açılmıştır.", "Paris, Viyana, Moskova ve Varşova gibi Avrupa başkentlerinde ilk geçici elçilikler açılmıştır.", "Dönemin ünlü minyatür ustası Levni, şairi ise Nedim''dir."], "correctIndex": 1}'::jsonb,
  'Lale Devri''nde **kesinlikle ASKERİ ISLAHAT YAPILMAMIŞTIR!** Nizam-ı Cedit ordusu ise 18. yüzyılın sonunda III. Selim tarafından kurulacaktır. Lale Devri kültür, sanat, diplomasi ve sivil yaşam ağırlıklı bir dönemdir.',
  'ÖSYM Lale Devri sorularında şıklara "Batı tarzı ordu kuruldu" veya "askeri ıslahat yapıldı" çeldiricisini koyar. Lale Devri''nde askeri ıslahat yoktur!'
);

-- Soru tar_odd_026
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'Lale Devri''nde Osmanlı Devleti''ne getirilen matbaada ilk basılan eser Vankulu Mehmed Efendi''ye ait "Vankulu Lügatı"dır.

Matbaada tefsir, hadis ve fıkıh gibi dini kitapların basılmasının yasaklanarak yalnızca tarih, coğrafya, tıp ve sözlük gibi bilimsel eserlerin basılmasına izin verilmesinin temel gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Dini kitapların matbaa harfleriyle basılmasının günah sayılması", "Hattatların ve müstensihlerin (kitap çoğaltıcılarının) işsiz kalarak toplumsal isyan çıkarmasını önlemek", "Osmanlı ülkesinde dini kitaplara talebin olmaması", "Avrupa''dan ithal edilen kağıt miktarının yetersiz kalması", "Şeyhülislamın matbaanın açılmasına tamamen karşı çıkması"], "correctIndex": 1}'::jsonb,
  'Dini eserlerin elle yazılması geleneksel bir sektör olup binlerce hattat ve müstensih bu işten geçiniyordu. Hükümet hattatların işsiz kalıp isyan çıkarmasını önlemek amacıyla dini eser basımını matbaada yasaklamıştır.',
  'Adaylar bunun sadece dini tutuculuktan kaynaklandığını düşünür; oysa arkasındaki asıl neden binlerce lonca mensubu hattatın ekonomik geleceğini koruma kaygısıdır.'
);

-- Soru tar_odd_027
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Batı tarzında askeri ıslahatları başlatan ilk padişah I. Mahmut''tur.

I. Mahmut döneminde Fransa''dan getirilen, Humbaracı Ocağı''nı modernize eden, kendisine kont unvanına izafeten "Humbaracı Ahmet Paşa" adı verilen ve 1734''te Batı tarzı ilk askeri teknik okul olan "Hendesehane"yi kuran yabancı uzman kimdir?',
  '{"options": ["Baron de Tott", "Comte de Bonneval", "Melling", "Helmuth von Moltke", "Donizetti Paşa"], "correctIndex": 1}'::jsonb,
  'Comte de Bonneval Müslüman olarak **Humbaracı Ahmet Paşa** adını almıştır. Osmanlı''da Batı tarzı ilk teknik askeri okul olan Hendesehane''yi (mühendislik mektebi) açmıştır.',
  'Baron de Tott (III. Mustafa dönemi Sürat Topçuları) ile Comte de Bonneval (I. Mahmut dönemi Hendesehane) sıklıkla karıştırılır.'
);

-- Soru tar_odd_028
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nin 1768-1774 Osmanlı-Rus Savaşı''nda yenilmesi ve Çeşme''de donanmasının yakılması üzerine Rusya ile imzaladığı **1774 Küçük Kaynarca Antlaşması** ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Kırım bağımsız olmuş, böylece Osmanlı Devleti tarihinde ilk kez halkı tamamen Türk ve Müslüman olan bir coğrafyayı kaybetmiştir.", "Kırım halkı dini açıdan Osmanlı Halifesine bağlı kalmış, böylece halifelik makamı tarihte ilk kez siyasi bir güç olarak kullanılmıştır.", "Osmanlı Devleti tarihinde ilk defa bir yabancı devlete (Rusya) savaş tazminatı ödemek zorunda kalmıştır.", "Rusya Karadeniz''de donanma bulundurma ve boğazlardan serbest ticaret gemisi geçirme hakkı elde etmiştir.", "Kırım''ın doğrudan Rusya Çarlığı''na bağlandığı Osmanlı Devleti tarafından resmen kabul edilmiştir."], "correctIndex": 4}'::jsonb,
  'Küçük Kaynarca''da Kırım Rusya''ya bağlanmamış, **bağımsız** olmuştur. Kırım''ın Rusya''ya ait olduğu ise 1792 **Yaş Antlaşması** ile kabul edilecektir.',
  'ÖSYM Kırım''ın elden çıkış sürecini aşama aşama sorar: 1774 Küçük Kaynarca = Bağımsız; 1779 Aynalıkavak = Özerk; 1783 = Rus ilhakı; 1792 Yaş Antlaşması = Kırım Rusya''nındır.'
);

-- Soru tar_odd_029
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde III. Selim döneminde yapılan kapsamlı yenilik hareketlerine "Nizam-ı Cedit" adı verilmiştir.

Aşağıdakilerden hangisi III. Selim dönemi ıslahatları arasında yer almaz?',
  '{"options": ["Nizam-ı Cedit adıyla Batı tarzı modern bir ordu kurulması ve masrafları için İrad-ı Cedit hazinesinin ihdası", "Avrupa''da ilk kez daimi (kalıcı) elçiliklerin açılması ve ilk daimi elçinin Londra''ya (Yusuf Agah Efendi) atanması", "Matbaa-i Amire adıyla tarihteki ilk devlet matbaasının kurulması", "Akka Kalesi savunmasında Cezzar Ahmet Paşa komutasında Napolyon Bonapart''ın mağlup edilmesi", "İlk denk bütçenin hazırlanarak saray masraflarının kısılması"], "correctIndex": 4}'::jsonb,
  'İlk modern denk bütçeyi hazırlayan devlet adamı 17. yüzyılda IV. Mehmet dönemi sadrazamı **Tarhuncu Ahmet Paşa**dır; III. Selim değildir.',
  'Akka zaferi Nizam-ı Cedit ordusunun ilk ve tek askeri başarısıdır. İlk daimi elçi ise Londra elçisi Yusuf Agah Efendi''dir.'
);

-- Soru tar_odd_030
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1789 Fransız İhtilali''nin yaydığı milliyetçilik (ulusçuluk) akımının etkisiyle Osmanlı Devleti''ne karşı ilk kez isyan eden azınlık toplumu ile bağımsızlığını ilk kazanan azınlık devleti aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["İlk İsyan Eden: Sırplar – İlk Bağımsız Olan: Yunanistan (Rumlar)", "İlk İsyan Eden: Yunanistan – İlk Bağımsız Olan: Sırplar", "İlk İsyan Eden: Bulgarlar – İlk Bağımsız Olan: Karadağ", "İlk İsyan Eden: Sırplar – İlk Bağımsız Olan: Romanya", "İlk İsyan Eden: Ermeniler – İlk Bağımsız Olan: Arnavutluk"], "correctIndex": 0}'::jsonb,
  'İlk isyan eden toplum 1804''te Kara Yorgi önderliğinde **Sırplar**dır. Ancak bağımsızlığını ilk kazanan toplum 1829 Edirne Antlaşması ile **Yunanistan (Rumlar)** olmuştur. Sırplar ise 1878 Berlin Antlaşması''nda bağımsız olacaktır.',
  'ÖSYM''nin en çok puan getiren klasiğidir: "İlk isyan eden Sırplar, ilk bağımsız olan Rumlar (Yunanistan); son ayrılan Balkan devleti ise Arnavutluk''tur."'
);

-- Soru tar_odd_031
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1808 yılında II. Mahmut ile taşradaki yerel güç odakları olan Âyanlar arasında Sadrazam Alemdar Mustafa Paşa''nın gayretleriyle imzalanan; padişahın yetkilerini tarihte ilk kez sınırlandıran ve İngiltere''deki Magna Carta''ya (1215) benzetilen ilk demokratikleşme belgesi aşağıdakilerden hangisidir?',
  '{"options": ["Tanzimat Fermanı", "Islahat Fermanı", "Sened-i İttifak", "Kanun-i Esasi", "Gülhane Hatt-ı Hümayunu"], "correctIndex": 2}'::jsonb,
  '**Sened-i İttifak (1808)**, padişahın mutlak otoritesinin ilk kez ayanlar karşısında sınırlandığı ilk belgedir. Bir anayasa değildir ancak anayasal sürecin ilk kıvılcımıdır.',
  'Adaylar ilk anayasa olan Kanun-i Esasi veya hukukun üstünlüğünü tanıyan Tanzimat Fermanı ile karıştırır. Padişahın yetkisini ilk kısıtlayan belge Sened-i İttifak''tır.'
);

-- Soru tar_odd_032
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  'II. Mahmut döneminde 1826 yılında Yeniçeri Ocağı kaldırılarak yerine Asakir-i Mansure-i Muhammediye ordusu kurulmuştur (Vaka-i Hayriye).

Aşağıdakilerden hangisi II. Mahmut''un yönetim ve toplum alanında gerçekleştirdiği yeniliklerden biri değildir?',
  '{"options": ["Divan-ı Hümayun''u kaldırarak yerine nazırlıklardan (bakanlıklar) oluşan Heyet-i Vükela''yı kurması", "İlk resmi gazete olan Takvim-i Vekayi''yi yayımlatması", "İstanbul''a giriş ve çıkışları denetlemek için ''Mürur Tezkeresi'' (iç pasaport) uygulamasını başlatması", "Memurlara ceket, pantolon ve fes giyme zorunluluğu getirmesi", "Kanun-i Esasi''yi ilan ederek Mebusan Meclisi''ni açması"], "correctIndex": 4}'::jsonb,
  'Kanun-i Esasi ve Mebusan Meclisi II. Mahmut değil, **II. Abdülhamit** döneminde 1876 yılında I. Meşrutiyet ile ilan edilmiştir. Diğer şıkların tümü II. Mahmut''un radikal modernleşme hamleleridir.',
  'II. Mahmut birçok ilki yaptığı için adaylar Meşrutiyet''i de II. Mahmut''a atfedebilir. Meşrutiyet II. Abdülhamit dönemindedir.'
);

-- Soru tar_odd_033
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Mısır Valisi Mehmet Ali Paşa''nın ordusunun Kütahya''ya kadar ilerlemesi üzerine II. Mahmut''un "Denize düşen yılana sarılır" diyerek 1833 yılında Rusya ile imzaladığı, Boğazlar meselesini ilk kez uluslararası bir sorun haline getiren antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Kütahya Antlaşması", "Hünkar İskelesi Antlaşması", "Balta Limanı Antlaşması", "Londra Boğazlar Sözleşmesi", "Edirne Antlaşması"], "correctIndex": 1}'::jsonb,
  '**1833 Hünkar İskelesi Antlaşması**, Osmanlı ile Rusya arasında imzalanmış bir savunma paktıdır. Bu antlaşmayla Rus donanmasına boğazlar açılmış, İngiltere ve Fransa paniğe kapılarak boğazlar sorununu uluslararası boyuta taşımıştır.',
  'Kütahya Antlaşması Mehmet Ali Paşa ile imzalanırken, Rusya ile imzalanan antlaşma Hünkar İskelesi''dir.'
);

-- Soru tar_odd_034
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1838 yılında Osmanlı Devleti ile İngiltere arasında imzalanan **Balta Limanı Ticaret Antlaşması** ile yabancı tüccarlara iç ticaret serbestisi tanınmış, iç gümrük vergileri kaldırılmış ve ihracat vergisi %12, ithalat vergisi %5 olarak belirlenmiştir.

Bu antlaşmanın Osmanlı Devleti üzerindeki en yıkıcı iktisadi sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin dış borçlarını tamamen ödeyerek ekonomik bağımsızlığını kazanması", "Yerli esnaf ve lonca teşkilatının iflas etmesi, Osmanlı pazarının Avrupa sanayisinin açık pazarı ve yarı sömürgesi haline gelmesi", "Osmanlı Devleti''nin sanayi devrimini başarıyla tamamlayıp fabrikalaşmaya geçmesi", "Düyun-u Umumiye İdaresi''nin derhal lağvedilmesi", "İngiltere''nin Osmanlı donanmasını modernize etmesi"], "correctIndex": 1}'::jsonb,
  'Balta Limanı Antlaşması Osmanlı gümrük duvarlarını sıfırlamış, ucuz Avrupa sanayi malları ülkeye dolmuş, lonca esnafı rekabet edemeyerek batmış ve Osmanlı ekonomisi Batı''ya tam bağımlı hale gelmiştir.',
  'Adaylar ticaret antlaşmasının gelirleri artırdığını düşünebilir; oysa Balta Limanı Osmanlı iktisadi bağımsızlığının ölüm fermanıdır.'
);

-- Soru tar_odd_035
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sultan Abdülmecit döneminde Hariciye Nazırı Mustafa Reşit Paşa tarafından Gülhane Parkı''nda okunarak ilan edilen **1839 Tanzimat Fermanı (Gülhane Hatt-ı Hümayunu)** ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Padişah kendi gücünden başka kanun gücünün üstünlüğünü kabul etmiş ve anayasacılığa geçişin ilk aşaması sayılmıştır.", "Dil, din ve ırk ayrımı gözetmeksizin ''bütün tebaanın'' (herkesin) can, mal, namus ve mülkiyet güvenliği kanun teminatı altına alınmıştır.", "İlan edilmesinde Avrupalı devletlerin doğrudan askeri ve diplomatik bir baskısı bulunmamaktadır.", "İlanında temel hedef Osmanlıcılık fikriyle azınlıkların devlete bağlılığını artırmak ve Mısır meselesinde Londra Konferansı''nda Avrupa desteğini almaktır.", "Gayrimüslim tebaaya ilk kez il meclislerine üye seçilme ve siyasi parti kurma hakkı verilmiştir."], "correctIndex": 4}'::jsonb,
  'İl genel meclislerine üye olma hakkı Tanzimat Fermanı''nda değil, 1856 **Islahat Fermanı**''nda verilmiştir; siyasi parti hakkı ise 1908 II. Meşrutiyet sonrasıdır.',
  'Ramazan Yetgin şifresi: Metinde "Herkes / Bütün tebaa" diyorsa Tanzimat Fermanı; doğrudan "Gayrimüslim" diyorsa Islahat Fermanı''dır.'
);

-- Soru tar_odd_036
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1853-1856 Kırım Savaşı''nın Türk ve Osmanlı tarihi açısından taşıdığı ilkler ve önemli gelişmelerle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["İlk Dış Borç $\\rightarrow$ 1854 yılında İngiltere''den alınmıştır.", "İlk Telgraf Hattı $\\rightarrow$ İstanbul, Edirne ve Şumnu arasına çekilmiştir.", "Modern Hemşirelik $\\rightarrow$ Florance Nightingale (Lambalı Kadın) Selimiye Kışlası''nda görev yapmıştır.", "Mülteci Meselesi $\\rightarrow$ Avusturya ve Rusya''dan kaçan Macar ve Leh mülteciler Osmanlı''ya sığınmıştır.", "Savaşın Başlaması $\\rightarrow$ Osmanlı donanmasının Navarin''de yakılmasıyla patlak vermiştir."], "correctIndex": 4}'::jsonb,
  'Kırım Savaşı''nda Osmanlı donanması Navarin''de değil, 1853 yılında Ruslar tarafından **Sinop Baskını** ile yakılmıştır (Navarin 1827''de Yunan isyanı sırasındadır).',
  'ÖSYM donanmanın yakıldığı yerleri (Sinop - Kırım Savaşı; Navarin - Yunan İsyanı) olaylarla eşleştirerek sorar.'
);

-- Soru tar_odd_037
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1856 Paris Barış Antlaşması''nda yer alan;

"Osmanlı Devleti ile Rusya Karadeniz''de hiçbir savaş gemisi bulunduramayacak ve kıyılarında askeri tersane kuramayacaktır." hükmünün Osmanlı Devleti açısından doğurduğu en çarpıcı sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti savaştan galip çıktığı halde Karadeniz''de yenik bir devlet muamelesi görmüştür.", "Karadeniz''in yeniden bir Türk gölü haline gelmesi sağlanmıştır.", "Rusya''nın Karadeniz kıyısındaki tüm toprakları Osmanlı''ya devredilmiştir.", "İngiltere ve Fransa Karadeniz''e daimi donanma yerleştirme hakkı kazanmıştır.", "Boğazlar tamamen Rusya''nın askeri denetimine bırakılmıştır."], "correctIndex": 0}'::jsonb,
  'Osmanlı Devleti Kırım Savaşı''nı kazanmış olmasına rağmen kendi iç denizi olan Karadeniz''de donanma ve tersane bulundurmaktan men edilmiş; yani masada mağlup devlet muamelesine maruz kalmıştır.',
  'ÖSYM''nin en popüler yorum sorusudur: Paris Antlaşması''nın "Karadeniz''in silahsızlandırılması" maddesi Osmanlı''nın galipken mağlup sayıldığının kanıtıdır.'
);

-- Soru tar_odd_038
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1877-1878 Osmanlı-Rus Savaşı (93 Harbi) sırasında; Plevne Kalesi''nde 6 ay boyunca olağanüstü bir savunma yaparak Rus ordularına geçit vermeyen ve "Plevne Kahramanı" olarak anılan Osmanlı komutanı ile Erzurum Aziziye Tabyası''nda halkı örgütleyerek Rus işgaline direnen kadın kahramanımız aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Gazi Ahmet Muhtar Paşa – Kara Fatma", "Gazi Osman Paşa – Nene Hatun", "Mahmut Şevket Paşa – Gördesli Makbule", "Enver Paşa – Şerife Bacı", "Rauf Orbay – Tayyar Rahime"], "correctIndex": 1}'::jsonb,
  'Plevne Kahramanı **Gazi Osman Paşa**''dır. Erzurum''da Aziziye Tabyaları''nı savunan ise 93 Harbi''nin simgesi **Nene Hatun**''dur. Nene Hatun Milli Mücadele''de değil, 93 Harbi''nde yer almıştır.',
  'ÖSYM Nene Hatun''u sıklıkla Kurtuluş Savaşı kadın kahramanları arasına çeldirici olarak koyar. Nene Hatun yalnızca 1877-78 93 Harbi''nde mücadele etmiştir!'
);

-- Soru tar_odd_039
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '93 Harbi sonrasında imzalanan 1878 Berlin Antlaşması ile Osmanlı Devleti''nden ayrılarak bağımsızlıklarını kazanan Balkan devletleri aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Sırbistan – Karadağ – Romanya", "Yunanistan – Bulgaristan – Arnavutluk", "Sırbistan – Yunanistan – Bosna", "Karadağ – Arnavutluk – Makedonya", "Bulgaristan – Romanya – Eflak"], "correctIndex": 0}'::jsonb,
  '1878 Berlin Antlaşması ile **Sırbistan, Karadağ ve Romanya** (Şifre: SaKaR / S-K-R) bağımsızlıklarını kazanmıştır. Bulgaristan ise özerk bir prenslik haline getirilmiştir.',
  'ÖSYM''nin en çok sorduğu sorudur: "Hangi devletler Berlin Antlaşması ile bağımsız oldu?" Cevap: Sırbistan, Karadağ, Romanya.'
);

-- Soru tar_odd_040
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
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '13 Nisan 1909 (Rumi 31 Mart 1325) tarihinde II. Meşrutiyet rejimini yıkmak ve anayasal düzeni sonlandırmak amacıyla İstanbul''da patlak veren **31 Mart Vakası** ile ilgili olarak;

I. Türk demokrasi tarihinde rejime ve anayasal düzene karşı çıkan ilk ayaklanmadır.
II. İsyan, Selanik''ten gelen Mahmut Şevket Paşa komutasındaki Hareket Ordusu tarafından bastırılmıştır.
III. Mustafa Kemal, Hareket Ordusu''nda Kurmay Yüzbaşı olarak görev almış ve tarih sahnesine ilk kez çıkmıştır.
IV. İsyanın ardından II. Abdülhamit meclis kararıyla tahttan indirilmiş ve yerine V. Mehmet Reşat geçirilmiştir.

yargılarından hangileri doğrudur?',
  '{"options": ["I ve II", "I, II ve III", "II, III ve IV", "I, III ve IV", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'Verilen dört öncül de 31 Mart Vakası''na ait temel KPSS kazanımlarıdır. Rejime karşı ilk isyandır; bastıran Hareket Ordusu''dur; Mustafa Kemal''in tarih sahnesine ilk çıkışıdır ve II. Abdülhamit meclis kararıyla tahttan indirilmiştir.',
  'ÖSYM Mustafa Kemal''in tarih sahnesine ilk çıkışını sorar: Çanakkale veya Trablusgarp değil; 31 Mart Vakası''nda Hareket Ordusu kurmay yüzbaşısı olarak yer almasıdır.'
);
