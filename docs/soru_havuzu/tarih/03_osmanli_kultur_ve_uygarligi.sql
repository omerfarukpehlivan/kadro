-- ==========================================================================
-- KADRO SORU HAVUZU — TARİH (ÜNİTE 3: OSMANLI KÜLTÜR VE UYGARLIĞI)
-- Toplam 40 Çoktan Seçmeli Soru (ÖSYM Çeldirici Tuzağı Analizli)
-- ==========================================================================

-- Soru tar_oku_001
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde padişahın mutlak yasama ve yargılama yetkileri doğrultusunda yayımladığı çeşitli hukuki belgeler bulunmaktadır.

Padişahın haksız kazanç elde eden veya vefat eden devlet memurlarının mallarına devlet adına el koyması uygulamasını ifade eden ve Osmanlı''da özel mülkiyet ile miras hakkının gelişmesini uzun süre engelleyen hukuk kavramı aşağıdakilerden hangisidir?',
  '{"options": ["Adaletname", "Müsadere", "Amanname", "Beratname", "Hatt-ı Hümayun"], "correctIndex": 1}'::jsonb,
  'Müsadere, haksız kazanç sağlayan veya vefat eden devlet ricalinin mallarına devlet tarafından el konulması sistemidir. Fatih Sultan Mehmet döneminde Çandarlı Halil Paşa''ya uygulanarak kurumsallaşmıştır. II. Mahmut döneminde büyük ölçüde kaldırılmış, 1839 Tanzimat Fermanı ile tamamen son bulmuş ve özel mülkiyet anayasal güvenceye kavuşmuştur.',
  'ÖSYM Beratname (memur atama ve maaş bağlama belgesi) ile Müsadereyi sıklıkla çeldirici yapar. Müsadere doğrudan mülkiyete el koyma ve padişahın yargı yetkisinin bir tezahürüdür.'
);

-- Soru tar_oku_002
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde tahta çıkan padişahlar için Eyüp Sultan Türbesi''nde Şeyhülislam veya Nakibü''l-Eşraf tarafından kılıç kuşanma töreni (Kılıç Alayı) icra edilir ve çeşitli hükümdarlık sembolleri kullanılırdı.

Aşağıdakilerden hangisi Osmanlı Devleti''nde hükümdarlık sembolleri (alametleri) arasında yer almaz?',
  '{"options": ["Tuğ ve Sancak", "Nevbet (Bando / Davul)", "Hutbe okutmak ve Sikke bastırmak", "Otağ-ı Hümayun", "Ok"], "correctIndex": 4}'::jsonb,
  'İslamiyet öncesinde olduğu gibi Osmanlı Devleti''nde de "Yay" hâkimiyet ve hükümdarlık sembolüdür; ancak "Ok" kesinlikle bir hükümdarlık alameti değildir. Ok, hükümdara boyun eğmeyi, itaati ve halkın bağlılığını temsil eder. Osmanlı tuğralarında ve damgalarında da yay hâkimiyet simgesi olarak kalmıştır.',
  'ÖSYM soru bankalarının 1 numaralı tuzağıdır: Hükümdarlık sembolleri sayılırken "Ok ve Yay" bir arada düşünüldüğü için adaylar "Ok" seçeneğini hükümdarlık alameti zanneder. Yay emreden, ok emre boyun eğendir.'
);

-- Soru tar_oku_003
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı padişahları Bey, Gazi, Han, Hakan, Padişah ve Hüdavendigar gibi pek çok unvan kullanmışlardır.

MEB müfredatı ve tarihsel kaynaklara göre Osmanlı Devleti tarihinde ilk kez "Sultan" unvanını kullanan padişah ve kullandığı tam unvan aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["I. Murat – Sultanü''l-Azam", "Orhan Bey – Sultanü''l-Guzât (Gaziler Sultanı)", "Osman Bey – Fahrüddin", "Fatih Sultan Mehmet – Sultanü''l-Bahreyn", "Yıldırım Bayezid – Sultan-ı İklim-i Rum"], "correctIndex": 1}'::jsonb,
  '2015 MEB müfredat güncellemesi ve dönemin sikkeleri/kitabeleri doğrultusunda Osmanlı''da ilk kez ''Sultan'' unvanını kullanan padişah Orhan Bey''dir ve unvanı "Sultanü''l-Guzât" (Gazilerin Sultanı)dır. Yıldırım Bayezid ise Niğbolu Zaferi sonrasında halifeden "Sultan-ı İklim-i Rum" unvanını almıştır.',
  'Eski ders kitaplarında ilk sultan unvanı I. Murat olarak geçtiği için birçok aday doğrudan A şıkkına yönelir. Güncel akademik kaynaklarda ve KPSS''de ilk sultan unvanını kullanan Orhan Bey''dir.'
);

-- Soru tar_oku_004
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde taht kavgalarını önlemek ve merkezi otoriteyi en üst seviyede tutmak amacıyla kuruluş ve yükselme dönemlerinde veraset sisteminde köklü değişiklikler yapılmıştır.

Buna göre, Osmanlı veraset sistemiyle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Osman Bey $\ → $ Ülke hükümdar ve ailesinin ortak malıdır.", "I. Murat $\ → $ Ülke padişah ve oğullarınındır anlayışı getirilmiştir.", "Fatih Sultan Mehmet $\ → $ ''Ülke padişahındır'' ilkesi benimsenmiş ve kardeş katli yasalaşmıştır.", "I. Ahmet $\ → $ Hanedanın en yaşlı ve en olgun erkeğinin tahta geçmesini öngören ''Ekber ve Erşed'' sistemi getirilmiştir.", "II. Mahmut $\ → $ Padişahın halk oyuyla seçilmesini sağlayan meşruti seçim sistemine geçilmiştir."], "correctIndex": 4}'::jsonb,
  'II. Mahmut döneminde padişahın seçimle belirlenmesi gibi bir uygulama asla olmamıştır; monarşik veraset devam etmiştir. Osmanlı tarihinde verasetteki son kurumsal değişiklik I. Ahmet döneminde getirilen "Ekber ve Erşed" (en yaşlı ve aklı başında üye) sistemidir.',
  'ÖSYM I. Murat (padişah ve oğulları) ile Fatih (sadece padişahındır) ayrımını sıkça sorar. Her iki değişiklik de merkezi otoriteyi kademeli olarak tek elde toplamak için yapılmıştır.'
);

-- Soru tar_oku_005
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı şehzadeleri 7 yaşına geldiklerinde Harem''deki Şehzadegan Mektebi''nde "Bedi Besmele" töreniyle ilk derslerini alırlar; 12 yaşına geldiklerinde ise devlet tecrübesi kazanmaları amacıyla lalaları eşliğinde çeşitli şehzade sancaklarına vali olarak gönderilirlerdi.

Aşağıdakilerden hangisi Osmanlı Devleti''nde şehzadelerin gönderildiği sancak merkezleri arasında yer almaz?',
  '{"options": ["Manisa", "Amasya", "Kefe (Kırım)", "Trabzon", "Şam"], "correctIndex": 4}'::jsonb,
  'Şehzadeler güvenlik ve merkeziyetçilik gereği Anadolu''da yer alan sancaklara gönderilirdi. Anadolu dışındaki tek istisnai şehzade sancağı Kırım''daki Kefe sancağıdır (Yavuz Sultan Selim burada bulunmuştur). Şam, Kahire veya Bağdat gibi uzak Arap eyaletlerine hiçbir zaman şehzade gönderilmemiştir.',
  'ÖSYM "Anadolu dışındaki tek şehzade sancağı neresidir?" sorusunu Kefe üzerinden sorar. Şam veya Halep gibi büyük merkezlerin sancak olduğu sanılsa da buralar şehzade sancağı yapılmamıştır.'
);

-- Soru tar_oku_006
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin başkenti İstanbul''un yönetimi ve güvenliği imparatorluğun diğer eyaletlerinden tamamen farklı özel bir statüye tabi tutulmuştur.

Buna göre, İstanbul''un en yüksek mülki amiri ve başkentteki adalet işlerinden sorumlu en üst düzey yetkili aşağıdakilerden hangisidir?',
  '{"options": ["Şehremini", "Sadrazam", "Taht Kadısı (İstanbul Kadısı)", "Yeniçeri Ağası", "Subaşı"], "correctIndex": 2}'::jsonb,
  'İstanbul''un en yüksek mülki ve adli amiri doğrudan padişah tarafından atanan Taht Kadısı (İstanbul Kadısı)''dır. Protokolde vezirlerle eşit statüdedir. Şehremini ise belediye ve bayındırlık işlerine bakan görevlidir.',
  'Adaylar genel yönetici olan Sadrazam''a veya belediye başkanı olan Şehremini''ye gidebilir. İstanbul''un hem mülki hem adli en üst amiri Taht Kadısı''dır.'
);

-- Soru tar_oku_007
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Topkapı Sarayı idari ve fonksiyonel açıdan Birun, Enderun ve Harem olmak üzere üç ana kısımdan oluşmaktadır.

Hristiyan tebaadan devşirilen yetenekli çocukların saray terbiyesiyle eğitilerek sadrazam, vezir, beylerbeyi, hattat ve şair gibi üst düzey yönetici ve sanatkârların yetiştirildiği; II. Mahmut döneminde önemini kaybetmesiyle yerine "Mekteb-i Maarif-i Adliye"nin açıldığı saray bölümü aşağıdakilerden hangisidir?',
  '{"options": ["Birun", "Enderun", "Harem-i Hümayun", "Darüssaade", "Babüssaade"], "correctIndex": 1}'::jsonb,
  'Enderun (İç Saray), ilk kez I. Murat döneminde Edirne Sarayı''nda temelleri atılan, Fatih döneminde Topkapı Sarayı''nda kurumsallaşan elit devlet adamı yetiştirme mektebidir. Buraya Müslüman Türk ailelerin ve Yahudilerin çocukları alınmaz, devşirmeler alınırdı.',
  'Adaylar Birun (dış saray - elçilerin kabul edildiği, divanın toplandığı yer) ile Enderun''u karıştırabilir. Enderun doğrudan bir "yönetici okulu"dur.'
);

-- Soru tar_oku_008
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı mimarisinde saray yapıları dönemlerin siyasi ve kültürel özelliklerini yansıtır.

Ağrı''nın Doğubeyazıt ilçesinde bulunan; yapımında Selçuklu, Osmanlı ve Barok mimari üsluplarının harmanlandığı ve dünya mimarlık tarihinde ilk kez merkezi ısıtma (kalorifer/sıcak su kanalları) sisteminin uygulandığı 18. yüzyıl saray külliyesi aşağıdakilerden hangisidir?',
  '{"options": ["Topkapı Sarayı", "İshak Paşa Sarayı", "Dolmabahçe Sarayı", "Yıldız Sarayı", "Beylerbeyi Sarayı"], "correctIndex": 1}'::jsonb,
  'İshak Paşa Sarayı (Ağrı-Doğubeyazıt), Osmanlı Devleti''nin Lale Devri sonrasındaki batılılaşma etkilerini yansıtan, merkezi ısıtma teşkilatına sahip dünyadaki ilk saray örneğidir. UNESCO Dünya Mirası Geçici Listesi''ndedir.',
  'Adaylar Dolmabahçe Sarayı''nı (tamamen batı tarzı) işaretleyebilir. Dünyada ilk ısıtma sistemine sahip saray Doğu Anadolu''daki İshak Paşa Sarayı''dır.'
);

-- Soru tar_oku_009
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Orhan Bey döneminde temelleri atılan ve II. Mahmut döneminde kaldırılarak yerine "Heyet-i Vükela" (Bakanlar Kurulu) kurulan Divan-ı Hümayun''da alınan kararlar "hüküm" adını alırdı.

Divan-ı Hümayun kararlarının, fermanların ve padişah emirlerinin günü gününe kaydedildiği; Osmanlı devlet teşkilatının hafızası niteliğindeki en temel arşiv defterlerine ne ad verilirdi?',
  '{"options": ["Tahrir Defterleri", "Mühimme Defterleri", "Tereke Defterleri", "Ruznamçe Defterleri", "Esame Defterleri"], "correctIndex": 1}'::jsonb,
  'Divan-ı Hümayun''da görüşülen siyasi, askeri, mali ve toplumsal kararlar Beylikçi Kalemi tarafından Mühimme Defterlerine kaydedilirdi. Tahrir vergi-nüfus sayımı, Tereke miras, Ruznamçe kazaskerin günlük mahkeme kayıtları, Esame ise yeniçeri maaş kütüğüdür.',
  'ÖSYM Tahrir Defteri (Nişancının fethettiği yerlerin vergi ve toprak kaydı) ile Mühimme Defteri''ni (Divan kararları) sürekli karşılaştırır.'
);

-- Soru tar_oku_010
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Divan-ı Hümayun üyeleri Seyfiye, İlmiye ve Kalemiye olmak üzere üç ana bürokratik sınıftan oluşurdu.

Seyfiye (ehl-i seyf / kılıç ehli) sınıfı askerî ve idari yönetimi temsil etmekteydi. Buna göre, aşağıdakilerden hangisi Divan-ı Hümayun''da Seyfiye sınıfına mensup bir üye değildir?',
  '{"options": ["Sadrazam (Veziriazam)", "Kubbealtı Vezirleri", "Kaptan-ı Derya", "Yeniçeri Ağası", "Kazasker"], "correctIndex": 4}'::jsonb,
  'Kazasker, eğitim, din ve adalet bürokrasisini temsil eden İlmiye (Ulema) sınıfının üyesidir; Seyfiye değildir. Sadrazam, vezirler, donanma komutanı Kaptan-ı Derya ve Yeniçeri Ağası ise Seyfiye (askeri-idari) sınıfına mensuptur.',
  'Adaylar Kazasker kelimesindeki "asker" hecesinden dolayı onu Seyfiye (askeri sınıf) zanneder. Oysa Kazasker günümüzün Milli Eğitim ve Adalet Bakanı''dır ve medrese çıkışlı ilmiye sınıfındandır.'
);

-- Soru tar_oku_011
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Divan-ı Hümayun üyesi olan Kazaskerlik makamı ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["İmparatorluk sınırlarının genişlemesiyle Rumeli ve Anadolu Kazaskeri olmak üzere sayıları ikiye çıkarılmıştır.", "Divandaki en yüksek temyiz hâkimidir; kadı kararlarına yapılan itirazları sonuçlandırır ve verdiği karar bozulamaz.", "Ülkedeki kadıların ve medreselerdeki müderrislerin atama, terfi ve azil işlemlerini yürütür.", "Devşirme kökenli devlet adamları arasından padişah tarafından liyakatine göre atanır.", "Tuttuğu günlük mahkeme ve tayin dosyalarına ''Ruznamçe'' adı verilir."], "correctIndex": 3}'::jsonb,
  'İlmiye sınıfına mensup olan Kazasker ve Şeyhülislam olabilmek için kesinlikle Türk ve doğuştan Müslüman olma (ve medrese mezunu olma) şartı vardı. Devşirmeler ilmiye sınıfına (kazasker, şeyhülislam, müderris, kadı) asla giremezlerdi; devşirmeler Enderun''da yetişip Seyfiye ve Kalemiye''de görev alırlardı.',
  'ÖSYM''nin en kritik tuzaklarından biri: "Devşirmeler her makama gelebilir mi?" Sadrazam olabilirler ama asla Kazasker ve Şeyhülislam olamazlar! Doğuştan Müslüman olma şartı ilmiyenin kırmızı çizgisidir.'
);

-- Soru tar_oku_012
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ferman ve beratlara padişahın tuğrasını çeken, fethedilen toprakların sosyo-ekonomik tahrir kayıtlarını tutan ve örfi hukukun uzmanı kabul edilen Divan-ı Hümayun üyesi aşağıdakilerden hangisidir?',
  '{"options": ["Defterdar", "Nişancı", "Reisülküttab", "Şeyhülislam", "Kaptan-ı Derya"], "correctIndex": 1}'::jsonb,
  'Nişancı (Tevkii), ferman ve beratlara padişah tuğrasını çeker, fethedilen toprakları "Tahrir Defterleri"ne kaydeder, tımar topraklarını dağıtır ve kanunların örfi hukuka uygunluğunu denetlerdi. Kalemiye sınıfının başıdır.',
  'Adaylar tuğra çekme ve toprak kaydını Defterdar (maliye) veya Reisülküttab (dış işleri) ile karıştırabilir. Toprakların tahrir kaydı ve tuğra yetkisi münhasıran Nişancı''ya aittir.'
);

-- Soru tar_oku_013
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '17. yüzyıla kadar Nişancı''ya bağlı bir kâtip iken; Osmanlı Devleti''nin diplomaside savunmaya geçmesi ve yabancı devletlerle yazışmaların önem kazanması üzerine Nişancı''dan ayrılarak hariciye (dış işleri) işlerinden sorumlu bağımsız bir Divan üyesi haline gelen görevli kimdir?',
  '{"options": ["Defter emini", "Reisülküttab", "Sadaret Kethüdası", "Amedi", "Beylikçi"], "correctIndex": 1}'::jsonb,
  'Reisülküttab, 17. yüzyılda bürokrasiden ayrılarak hariciye nazırlığının (Dışişleri Bakanlığı) temeli haline gelmiştir. Divan gündemini hazırlar ve yabancı devletlerle diplomatik temasları yürütürdü. Karlofça başarısı sonrası Mehmet Rami Efendi reisülküttablıktan sadrazamlığa geçen ilk kişidir.',
  'Adaylar dış işlerinden Sadrazamın veya Nişancının sorumlu kaldığını düşünebilir. 17. yüzyıldan itibaren hariciyenin patronu Reisülküttab''dır.'
);

-- Soru tar_oku_014
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı klasik dönem taşra teşkilatında en büyük idari birim eyalet, en küçük birim ise köydür.

Buna göre, klasik dönem taşra idaresinde kazaları yöneten, aynı zamanda kaza merkezinde davalara bakarak adalet işlerini yürüten ve belediye hizmetlerini denetleyen görevli aşağıdakilerden hangisidir?',
  '{"options": ["Subaşı", "Beylerbeyi", "Kadı", "Sancakbeyi", "Kethüda"], "correctIndex": 2}'::jsonb,
  'Osmanlı''da kazaların hem idari yöneticisi (mülki amir) hem de mahkeme hakimi Kadı''dır. Güvenlikten ise Subaşı sorumludur. Kadıların idari yetki taşıması Osmanlı adalet mekanizmasının yerel otorite üzerindeki üstünlüğünü simgeler.',
  'Adaylar kazayı yöneten kişinin Subaşı veya Sancakbeyi olduğunu düşünebilir. Osmanlı kazalarında idare ve yargı tek elde, yani Kadı''da birleşmiştir.'
);

-- Soru tar_oku_015
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde merkeze uzak olan Mısır, Trablusgarp, Tunus, Cezayir, Yemen ve Habeş gibi eyaletlerde tımar sistemi uygulanmazdı. Bu eyaletlerin vergileri açık artırma yoluyla ihale edilir ve memurların maaşları doğrudan hazineden yıllık olarak ödenirdi.

Hakkında bilgi verilen bu eyalet grubu aşağıdakilerden hangisidir?',
  '{"options": ["Saliyanesiz (Yıllıksız) Eyaletler", "Saliyaneli (Yıllıklı) Eyaletler", "İmtiyazlı Eyaletler", "Yurtluk-Ocaklık Eyaletleri", "Muaf Eyaletler"], "correctIndex": 1}'::jsonb,
  'Merkeze uzak ve tımar uygulanmayan eyaletlere Saliyaneli (Yıllıklı) Eyaletler denir. Buradaki vergiler "İltizam" sistemiyle mültezimler aracılığıyla peşin toplanıp doğrudan hazineye aktarılırdı.',
  'ÖSYM saliyaneli ile saliyanesiz eyaletleri birbirinin yerine koyarak sorar. Şifre: Saliyaneli = Maaşlı/Yıllıklı = Merkeze uzak (Kuzey Afrika eyaletleri). Saliyanesiz = Tımarlı = Merkeze yakın (Anadolu ve Rumeli).'
);

-- Soru tar_oku_016
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde Saliyaneli eyaletlerde ve mukataa arazilerde uygulanan İltizam Sistemi ile ilgili kavramlar hakkında aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["İhaleyi kazanan vergi mültezimi $\ → $ Mültezim", "İltizam hakkının mültezime ömür boyu verilmesi usulü $\ → $ Malikhane", "İhaleye giriş bedeli veya peşin ödenen teminat bedeli $\ → $ Muaccele", "Tanzimat sonrasında iltizam kaldırılınca vergileri toplamakla görevlendirilen memur $\ → $ Muhassıl", "Vergi ihalesini kazanan kişinin devlete verdiği yıllık faizli borç $\ → $ Düyun"], "correctIndex": 4}'::jsonb,
  'İltizam sisteminde devlete verilen peşin paraya borç veya faiz denmez; açık artırma bedelidir. Ömür boyu iltizama "Malikhane", peşinata "Muaccele", vergi toplayan kişiye "Mültezim", iltizam kaldırıldıktan sonra kurulan vergi memurluğuna ise "Muhassıl" denir.',
  'Ramazan Yetgin notlarında özel uyarıyla geçen "KPSS Kesin Çıkar" konusudur: Muaccele (peşinat), Malikhane (ömür boyu iltizam), Muhassıl (sistem kalkınca vergiyi toplayan memur).'
);

-- Soru tar_oku_017
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı taşra teşkilatında iç işlerinde serbest, dış işlerinde merkeze bağlı olan "İmtiyazlı Eyaletler" bulunmaktadır.

Bu imtiyazlı eyaletler içerisinde yöneticisine "Emir" denilen; kutsal topraklara ev sahipliği yaptığı için Osmanlı Devleti''ne ne asker ne de vergi veren, aksine her yıl merkezden "Surre Alayları" ile hediye ve para gönderilen en ayrıcalıklı eyalet aşağıdakilerden hangisidir?',
  '{"options": ["Kırım", "Eflak", "Boğdan", "Hicaz", "Erdel"], "correctIndex": 3}'::jsonb,
  'Hicaz Eyaleti (Mekke-Medine), Osmanlı''nın en imtiyazlı eyaletidir; vergi ve asker vermez, aksine her yıl hac mevsiminde padişahın Surre Alayı ile hazineden yüklü mali yardım alırdı.',
  'Kırım ile Hicaz sıkça karıştırılır: Kırım vergi vermez ama savaşa asker (süvari) gönderirdi; Hicaz ise ne vergi ne de asker verirdi.'
);

-- Soru tar_oku_018
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde vefat eden kişilerin geride bıraktığı menkul ve gayrimenkul malların dökümünün yapıldığı, mirasçıların haklarının şer''i ve örfi hukuka göre tespit edildiği, ayrıca çift evlilikler ve aile yapısına dair paha biçilmez demografik kayıtlar içeren defterlere ne ad verilir?',
  '{"options": ["Tahrir Defterleri", "Tereke Defterleri", "Mühimme Defterleri", "Cizye Defterleri", "Avarız Defterleri"], "correctIndex": 1}'::jsonb,
  'Kadılar tarafından tutulan Tereke Defterleri (Kassâm Defterleri), ölen kişinin geride bıraktığı tüm eşya, giysi, kitap, alacak-verecek ve mirasçıların paylarını kaydeder. Sosyal ve ekonomik tarihin birincil kaynağıdır.',
  'ÖSYM Tereke Defterleri''ni aile yapısı, miras ve sosyal tabakalaşma sorularında sıklıkla sorar. Tahrir (nüfus/toprak) ile Tereke (miras/kişisel mülk) karıştırılmamalıdır.'
);

-- Soru tar_oku_019
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 19. yüzyılda Tanzimat Dönemi ile birlikte hukuk alanında Batı tarzı yeni mahkemeler açılmış, ancak eski klasik mahkemeler kapatılmadığı için ülkede hukuksal bir "ikilik" doğmuştur.

Aşağıdakilerden hangisi Tanzimat öncesi var olan Klasik Dönem mahkemeleri arasında yer almaz?',
  '{"options": ["Şer''i Mahkemeler", "Cemaat Mahkemeleri", "Konsolosluk Mahkemeleri", "Nizamiye Mahkemeleri", "Kadı Mahkemeleri"], "correctIndex": 3}'::jsonb,
  'Nizamiye Mahkemeleri, Tanzimat Dönemi''nde (1868) ceza ve ticaret davalarına bakmak üzere Fransız usulüyle kurulan, Müslüman ve gayrimüslim üyelerden oluşan Batı tarzı karma mahkemedir. Şer''i, Cemaat ve Konsolosluk mahkemeleri ise klasik dönem mahkemeleridir.',
  'Konsolosluk mahkemeleri kapitülasyonlarla (1535 Fransa) klasik dönemde kurulmuştur. Nizamiyeler ise Tanzimat yeniliğidir.'
);

-- Soru tar_oku_020
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde toplum ırk, dil veya soy esasına göre değil; mensup olunan din ve mezhep aidiyetine göre örgütlenmiştir. Müslümanlar hâkim unsur (millet-i hâkime) kabul edilirken, gayrimüslimler Ortodoks, Ermeni ve Musevi cemaatleri şeklinde kendi dini liderlerinin idaresine bırakılmıştır.

Osmanlı toplum yapısını şekillendiren bu geleneksel yönetim modeline ne ad verilir?',
  '{"options": ["Gulam Sistemi", "Millet Sistemi", "İstimalet Politikası", "İskân Politikası", "Devşirme Sistemi"], "correctIndex": 1}'::jsonb,
  'Osmanlı toplumundaki bu din merkezli tasnife Millet Sistemi denir. Millet sistemi ulusçuluk/milliyetçilik değil, inanç birliği esasına dayanır.',
  'Adaylar "Millet" kelimesini günümüzdeki Türk, Arap, Rum gibi etnik ulus kavramıyla karıştırabilir. Osmanlı''da millet kavramı doğrudan dini topluluğu (İslam milleti, Ortodoks milleti vb.) ifade eder.'
);

-- Soru tar_oku_021
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı Devleti''nde kamu hizmetlerinin, bayındırlık işlerinin ve sosyal yardımlaşmanın finansmanı büyük ölçüde vakıf sistemiyle karşılanırdı.

Deprem, yangın, sel gibi doğal afetlerde hasar gören cami ve köprülerin onarılması, savaş zamanı ordunun acil ihtiyaçlarının karşılanması ve olağanüstü durumlarda vergisini ödeyemeyen yoksul köylüye kredi verilmesi amacıyla kurulan özel vakıf türü aşağıdakilerden hangisidir?',
  '{"options": ["Mülk Vakfı", "Avarız Vakfı", "Zürri Vakıf", "Darüşşafaka Vakfı", "Gureba Vakfı"], "correctIndex": 1}'::jsonb,
  'Avarız, olağanüstü durum anlamına gelir. Mahalle ve köylerde olağanüstü zamanlarda ortaya çıkan acil harcamaları, afet zararlarını ve fakirlerin vergilerini karşılamak üzere kurulan sandıklara Avarız Vakfı / Avarız Sandığı denirdi.',
  'Avarız kelimesi sınavda genellikle "olağanüstü hal vergisi" olarak bilinir. Ramazan Yetgin notlarında vurgulanan Avarız Vakfı ise bu olağanüstü durumlara müdahale eden özel vakıf yapısıdır.'
);

-- Soru tar_oku_022
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde II. Abdülhamit döneminde açılan ve Osmanlı tarihindeki ilk çocuk hastanesi olma özelliğini taşıyan sağlık kurumu aşağıdakilerden hangisidir?',
  '{"options": ["Darülaceze", "Hamidiye Etfal Hastanesi", "Vakıf Gureba Hastanesi", "Haseki Hastanesi", "Cerrahpaşa Hastanesi"], "correctIndex": 1}'::jsonb,
  '1899 yılında II. Abdülhamit tarafından kızı Hatice Sultan''ın vefatı üzerine kurulan Hamidiye Etfal Hastanesi (Şişli Etfal), Osmanlı''nın ilk modern ihtisas çocuk hastanesidir.',
  'Darülaceze (düşkünler/huzurevi) ile Hamidiye Etfal (çocuk hastanesi) II. Abdülhamit''in en meşhur iki kurumudur. "İlk çocuk hastanesi" sorulduğunda cevap Hamidiye Etfal''dir.'
);

-- Soru tar_oku_023
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı toprak sisteminde mülkiyeti devlete ait olan "Mîrî Arazi" statü ve gelir tahsisine göre çeşitli kısımlara ayrılmıştır.

Buna göre, geliri doğrudan devlet hazinesine aktarılan ve üzerinde İltizam Sistemi uygulanan mîrî arazi türü aşağıdakilerden hangisidir?',
  '{"options": ["Paşmaklık", "Mukataa", "Malikhane", "Yurtluk", "Ocaklık"], "correctIndex": 1}'::jsonb,
  'Geliri doğrudan merkezi hazineye (Hazine-i Amire) giden topraklara Mukataa denir. İltizam sistemi mukataa arazilerde uygulanır.',
  'ÖSYM Mîrî arazi türlerini eşleştirme olarak çok sever: Paşmaklık = Hükümdar kadınlarına; Ocaklık = Tersane ve kale muhafızlarına; Yurtluk = Sınır boylarına; Mukataa = Doğrudan hazineye.'
);

-- Soru tar_oku_024
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Dirlik (Tımar) sisteminde topraklar gelirlerine göre Has, Zeamet ve Tımar olmak üzere üç kategoriye ayrılmıştır.

Buna göre, yıllık geliri 20.000 ile 100.000 akçe arasında olan ve kadı, müderris, subaşı gibi orta dereceli devlet memurlarına tahsis edilen dirlik arazisi aşağıdakilerden hangisidir?',
  '{"options": ["Has", "Zeamet", "Tımar", "Paşmaklık", "Yurtluk"], "correctIndex": 1}'::jsonb,
  'Geliri 20.000 - 100.000 akçe arası olan topraklar Zeamettir ve orta düzey bürokratlara verilir. 100.000''den fazlası Has (padişah ve divan üyelerine), 3.000 - 20.000 arası ise Tımar''dır (askerlere/küçük memurlara).',
  'Adaylar Has ile Zeamet''in gelir limitlerini karıştırabilir. 100 bin üstü Has, 20-100 bin arası Zeamet, 20 bin altı Tımar''dır.'
);

-- Soru tar_oku_025
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '17. yüzyıldan itibaren Osmanlı Tımar Sistemi''nin bozulmasıyla birlikte ordunun atlı sipahi gücü azalmış, devlet savaşlarda tüfek kullanan piyade ihtiyacını karşılamak amacıyla Anadolu gençlerinden ücretli askerler toplamaya başlamıştır.

Tımar sisteminin çöküşüyle orduda istihdam edilen, barış zamanlarında ise işsiz kalarak Anadolu''da Celali isyanlarına karışan bu ücretli asker zümresine ne ad verilirdi?',
  '{"options": ["Cebelü", "Sekban ve Saruca", "Bostancı", "Müsellem", "Humbaracı"], "correctIndex": 1}'::jsonb,
  'Tımar sistemi bozulunca devletin topladığı tüfekli geçici ücretli askerlere Sekban ve Saruca denirdi. Bu birlikler terhis edilince köylere eşkıya olarak musallat olmuş ve Celali isyanlarının vurucu gücüne dönüşmüştür.',
  'Cebelü tımarlı sipahinin beslemek zorunda olduğu atlı askerdir (sistem sağlıklıyken). Sistemin bozulmasıyla ortaya çıkan ücretli tüfekli birlikler Sekban ve Saruca''dır.'
);

-- Soru tar_oku_026
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Kapıkulu Piyadeleri içerisinde yer alan Acemi Ocağı''ndaki devşirme askerlerin eğitimlerini tamamlayarak Yeniçeri Ocağı veya diğer saray birliklerine atanması işlemine ne ad verilirdi?',
  '{"options": ["Cerre Çıkmak", "Kapıya Çıkma (Bedergâh)", "Gülbank", "Cülus", "Esame"], "correctIndex": 1}'::jsonb,
  'Acemi Ocağı''ndan yeniçeri veya süvari birliklerine geçişe Kapıya Çıkma veya Bedergâh denir. Cerre çıkmak ise medrese öğrencilerinin yaz tatilinde köylere vaaz ve staja gitmesidir.',
  'ÖSYM "Kapıya Çıkma" (askeri terim) ile "Cerre Çıkma" (eğitim terimi) kavramlarını sıklıkla seçeneklerde karşılaştırarak adayları eler.'
);

-- Soru tar_oku_027
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Kapıkulu Süvarileri (Altı Bölük Halkı) savaş sırasında merkezde padişahın ve ordunun en stratejik unsurlarını korumakla görevli seçkin atlı birliklerdir.

Buna göre, savaş meydanında saltanat sancağını korumakla görevli olan birlik aşağıdakilerden hangisidir?',
  '{"options": ["Sipahiler", "Silahtarlar", "Sağ ve Sol Ulufeciler", "Sağ ve Sol Garipler", "Tımarlı Sipahiler"], "correctIndex": 2}'::jsonb,
  'Sağ ve Sol Ulufeciler padişahın saltanat sancağını korur. Sipah ve Silahtarlar padişahın bizzat çadırını, Sağ ve Sol Garipler ise devlet hazinesini ve ordu ağırlıklarını korur.',
  'Şifreleme kuralı: "Garipler fakirdir, hazineyi korur." "Ulufeciler sancağı korur." "Sipah-Silahtar çadırı korur."'
);

-- Soru tar_oku_028
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı ordu teşkilatında savaş sırasında ordunun en önünde yer alan, düşman saflarını yararak ilk hücumu gerçekleştiren ve tamamen bekar Türk gençlerinden oluşturulan hafif piyade birliği aşağıdakilerden hangisidir?',
  '{"options": ["Deliler", "Azaplar", "Akıncılar", "Sakalar", "Beşliler"], "correctIndex": 1}'::jsonb,
  'Azaplar, bekar Türk erkeklerinden toplanan, ordunun ön saflarında savaşan hafif piyadelerdir (Azap kelimesi bekar anlamına gelir). Deliler ise süvaridir ve cesaretleriyle ünlüdür.',
  'ÖSYM Azaplar (bekar erkek piyade) ile Deliler (şok süvari) kavramlarını çok sık karşılaştırır.'
);

-- Soru tar_oku_029
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı donanması tarih boyunca dört büyük baskın sonucunda yakılarak ağır kayıplara uğramıştır.

Aşağıdakilerden hangisi Osmanlı donanmasının tarihte yakıldığı yerlerden biri değildir?',
  '{"options": ["İnebahtı (1571)", "Çeşme (1770)", "Navarin (1827)", "Preveze (1538)", "Sinop (1853)"], "correctIndex": 3}'::jsonb,
  'Preveze (1538), Barbaros Hayrettin Paşa komutasındaki Osmanlı donanmasının Haçlı donanmasını bozguna uğrattığı şanlı bir deniz zaferidir (Donanma Günü). Osmanlı donanmasının yakıldığı yerler ise İnebahtı (1571), Çeşme (1770), Navarin (1827) ve Sinop''tur (1853) [Şifre: İÇNES / İÇNEBİ].',
  'Adaylar tüm deniz savaşlarını felaket gibi algılayabilir; Preveze ve Cerbe büyük zaferlerdir, yakılma olayları değildir.'
);

-- Soru tar_oku_030
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Orhan Bey döneminde İznik''te açılan ilk Osmanlı medresesi "İznik Orhaniyesi"ne başmüderris (rektör) olarak atanan ilk Osmanlı müderrisi aşağıdakilerden hangisidir?',
  '{"options": ["Dursun Fakih", "Davud-ı Kayserî", "Molla Fenari", "Kadızade-i Rumi", "Akşemseddin"], "correctIndex": 1}'::jsonb,
  'Osmanlı Devleti''nin ilk medresesi İznik Orhaniyesi''dir ve bu medreseye atanan ilk müderris Davud-ı Kayserî''dir. İlk kadı ise Osman Bey döneminde Karacahisar''a atanan Dursun Fakih''tir.',
  'ÖSYM İlk Kadı (Dursun Fakih) ile İlk Müderris''i (Davud-ı Kayserî) sürekli çeldirici olarak birbirinin yanına koyar.'
);

-- Soru tar_oku_031
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı medreselerinde öğretim süresi 4 yıldı. Medreseye ilk başlayan öğrenciye "Softa (Suhte)", bir yıl sonra bilgili öğrenciye "Danişmend", mezun olup stajyer öğretmen olanlara "Muid" denirdi.

Muidlikten sonra müderrislik yapabilmek için atama sırası bekleyen aday öğretmenlere ne ad verilirdi?',
  '{"options": ["Muid", "Mülazım", "Müderris", "Muid-i Sani", "Müsteşar"], "correctIndex": 1}'::jsonb,
  'Medrese mezunu olup atama sırası bekleyen adaya Mülazım, bu bekleme sürecine ise Mülazemet Sistemi denirdi (Mülazemet süresi ortalama 21 gün ile birkaç ay arası değişirdi).',
  'Adaylar Muid (yeni mezun stajyer) ile Mülazım (atama bekleyen öğretmen) terimlerini karıştırır.'
);

-- Soru tar_oku_032
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Fatih Sultan Mehmet döneminde İstanbul''un fethinden sonra açılan, günümüzün ilahiyat ve yüksek İslam enstitüleri düzeyinde kabul edilen ve öğrenci yetiştirmek amacıyla Tetimme Medreseleri ile desteklenen ünlü Osmanlı yükseköğretim kurumu hangisidir?',
  '{"options": ["İznik Medresesi", "Sahn-ı Seman Medreseleri", "Süleymaniye Medreseleri", "Yağıbasan Medresesi", "Nizamiye Medresesi"], "correctIndex": 1}'::jsonb,
  'Fatih Sultan Mehmet tarafından Fatih Camii etrafında sekiz medrese olarak kurulan Sahn-ı Seman Medreseleri, dönemin en üst düzey üniversitesidir. Hazırlık ve lise kademesini Tetimme Medreseleri oluşturmuştur.',
  'Sahn-ı Seman Fatih dönemindedir; Süleymaniye Medreseleri ise Kanuni döneminde fen ve tıp alanında ihtisaslaşmıştır.'
);

-- Soru tar_oku_033
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı iktisadi anlayışında piyasada tüketicinin ihtiyacı olan malların mümkün olduğunca bol, kaliteli ve ucuz fiyata bulundurulması ilkesine ne ad verilir?',
  '{"options": ["Fiskalizm", "Gelenekçilik", "İaşecilik (Provizyonizm)", "Merkantilizm", "Liberalizm"], "correctIndex": 2}'::jsonb,
  'İaşecilik (Provizyonizm), piyasada tüketim mallarının bol, kaliteli ve ucuz bulundurulması prensibidir. Fiskalizm hazine gelirlerini maksimize etme, Gelenekçilik ise mevcut üretim kotalarını ve dengeleri koruma anlayışıdır.',
  'ÖSYM bu üç iktisat kavramını (İaşecilik, Fiskalizm, Gelenekçilik) doğrudan tanımlarını vererek sorar. "Bol ve ucuz mal bulundurma" her zaman İaşeciliktir.'
);

-- Soru tar_oku_034
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı esnaf teşkilatı olan Loncaların, Selçuklulardaki Ahilik teşkilatından ayrılan en belirgin iki temel farkı aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Loncaya gayrimüslim esnafın da üye olabilmesi ve lonca üyelerinin savaşa/cihada katılmaması", "Loncalarda narh sisteminin uygulanmaması ve usta-çırak eğitiminin verilmemesi", "Ahilikte esnaf sandığı bulunurken loncalarda orta sandığının tamamen kaldırılması", "Loncaların yalnızca saraya mal üretmesi ve halka satış yapamaması", "Ahilikte gayrimüslimlerin başkan olabilmesi"], "correctIndex": 0}'::jsonb,
  'Ahilik dini temelli bir Müslüman esnaf teşkilatıdır ve gaza faaliyetlerine katılır. Loncalar ise dini değil mesleki teşkilattır; bünyesine gayrimüslim esnaf da girebilir ve esnaf doğrudan savaşa çağrılmaz.',
  'ÖSYM''nin standart karşılaştırma sorusudur: Lonca = Gayrimüslim üye var + Cihat yok. Ahi = Sadece Müslüman + Gazaya destek var.'
);

-- Soru tar_oku_035
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
  'Adaylar Tağşiş kavramını Narh veya Müsadere ile karıştırabilir. Tağşiş doğrudan devalüasyon / paranın maden oranını kırpmadır.'
);

-- Soru tar_oku_036
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  '1863 yılında Mithat Paşa''nın gayretleriyle köylüye ve çiftçiye tefeciler karşısında ucuz faizli kredi sağlamak amacıyla kurulan ve 1888 yılında Ziraat Bankası''na dönüştürülen tarihi iktisadi kurum aşağıdakilerden hangisidir?',
  '{"options": ["Bank-ı Dersaadet", "Bank-ı Osmanî-i Şahane", "Memleket Sandıkları", "İtibar-ı Millî Bankası", "Emlak ve Eytam Bankası"], "correctIndex": 2}'::jsonb,
  'Ziraat Bankası''nın temeli Mithat Paşa tarafından Niş valiliği sırasında kurulan Memleket Sandıkları (ve daha sonra Menafi Sandıkları)na dayanır. 1888''de resmi olarak Ziraat Bankası adını almıştır.',
  'ÖSYM Ziraat Bankası''nın kökenini (Memleket Sandıkları - Mithat Paşa) ve Atatürk döneminde değil Osmanlı döneminde kurulduğu bilgisini çok sık sorar.'
);

-- Soru tar_oku_037
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde toprağın mazeretsiz olarak üst üste üç yıl ekilmeyip boş bırakılması durumunda üretimin aksamasını önlemek amacıyla köylüden tahsil edilen ceza vergisi aşağıdakilerden hangisidir?',
  '{"options": ["Çifthane Vergisi", "Çiftbozan Vergisi", "Avarız Vergisi", "İhtisap Vergisi", "Bac Vergisi"], "correctIndex": 1}'::jsonb,
  'Çiftbozan vergisi, toprağını mazeretsiz üç yıl terk eden veya ekmeyen köylüden alınan üretim güvenliği cezasıdır. Çifthane ise bir çift öküzle işlenebilen araziden alınan normal vergidir.',
  'Adaylar Çifthane ile Çiftbozan''ı karıştırır: Çifthane arazinin normal vergisi, Çiftbozan ise toprağı ekmeyene kesilen cezadır.'
);

-- Soru tar_oku_038
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Fatih Sultan Mehmet döneminde yaşayan; "Kitabü''l-Cerrahiyyeti''l-Haniyye" adlı ilk Türkçe resimli cerrahi eserini yazan ve hayvanlar üzerinde deneyler yaparak deneysel farmakolojinin öncüsü kabul edilen ünlü Osmanlı cerrahı kimdir?',
  '{"options": ["Akşemseddin", "Altuncuzade", "Sabuncuoğlu Şerafeddin", "Ayaşlı Şifai", "Mustafa Behçet Efendi"], "correctIndex": 2}'::jsonb,
  'Sabuncuoğlu Şerafeddin, Amasya Darüşşifası''nda çalışmış, cerrahi aletlerin resimlerini bizzat çizdiği Cerrahiyetü''l-Haniyye ve Mücerrebname eserlerini yazmış Osmanlı cerrahisidir.',
  'Akşemseddin mikropla, Altuncuzade idrar yolları/bevliye ile uğraşmıştır. İlk resimli cerrahi kitabı yazan cerrah ise Sabuncuoğlu Şerafeddin''dir.'
);

-- Soru tar_oku_039
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Avrupa''da "Hacı Kalfa" veya "Hacı Halife" olarak tanınan; 15 bine yakın kitap ve 10 bin müellifi tanıttığı ünlü bibliyografik eseri "Keşfü''z-Zunûn" ile ilk Türkçe dünya coğrafyası eseri olan "Cihannüma"yı kaleme alan 17. yüzyıl Osmanlı bilgini kimdir?',
  '{"options": ["Evliya Çelebi", "Kâtip Çelebi", "Koçi Bey", "Naima", "Ahmet Cevdet Paşa"], "correctIndex": 1}'::jsonb,
  'Kâtip Çelebi, 17. yüzyılın en büyük bibliyograf ve coğrafyacısıdır. Keşfü''z-Zunûn (Şüphelerin Aydınlanması) ve Cihannüma başyapıtlarıdır.',
  'Evliya Çelebi (Seyahatname) ile Kâtip Çelebi (Cihannüma/Keşfü''z-Zunûn) sürekli karşılaştırılır. Hacı Kalfa unvanı doğrudan Kâtip Çelebi''ye aittir.'
);

-- Soru tar_oku_040
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
  'Osmanlı Kültür ve Uygarlığı',
  'multiple_choice',
  3,
  'Osmanlı sanat ve musiki hayatı ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Şeyh Hamdullah $\ → $ Hat sanatında çığır açmış, ''Hattatların Kıblesi'' (Kıbletü''l-Hattatîn) lakabıyla anılmıştır.", "Levni $\ → $ Lale Devri''nin ünlü nakkaşı olup minyatür sanatının en büyük ustalarındandır.", "Itrî (Buhurizade Mustafa) $\ → $ Klasik Türk musikisinin dehası olup Segâh Tekbiri ve Salât-ı Ümmiye''nin bestecisidir.", "Osman Hamdi Bey $\ → $ Sanayi-i Nefise Mektebi''ni kurmuş ve ünlü ''Kaplumbağa Terbiyecisi'' tablosunu yapmıştır.", "Ahmet Karahisari $\ → $ Osmanlı Devleti''nde heykelini yaptıran ilk ve tek Osmanlı padişahıdır."], "correctIndex": 4}'::jsonb,
  'Ahmet Karahisari bir padişah değil, Süleymaniye Camii''nin yazılarını yazan ünlü bir hattattır. Osmanlı Devleti''nde kendi heykelini yaptıran ilk ve tek padişah ise Sultan Abdülaziz''dir.',
  'ÖSYM sanatçıların alanlarını ve lakaplarını sorar: Şeyh Hamdullah = Hattatların Kıblesi; Itrî = Segâh Tekbiri / 100 TL arkası; Sultan Abdülaziz = Heykel yaptıran tek padişah.'
);
