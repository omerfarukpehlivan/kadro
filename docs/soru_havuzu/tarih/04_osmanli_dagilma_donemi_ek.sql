-- =====================================================================
-- ÜNİTE 4: Osmanlı Dağılma Dönemi (EK 40 SORU: Test 5, 6, 7, 8)
-- Toplam Soru: 40 Soru (Mevcut 40 + Bu Ek 40 = 80 Soru / 8 Test)
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 41 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1808 yılında Sadrazam Alemdar Mustafa Paşa''nın girişimiyle Padişah II. Mahmut ile Rumeli ve Anadolu ayanları arasında imzalanan, Türk tarihinde ilk kez padişahın mutlak yetkilerini sınırlandıran ve İngiltere''deki Magna Carta''ya (1215) benzetilen tarihi belge aşağıdakilerden hangisidir?',
  '{"options": ["Sened-i İttifak", "Tanzimat Fermanı", "Islahat Fermanı", "Kanun-i Esasi", "Gülhane Hatt-ı Hümayunu"], "correctIndex": 0}'::jsonb,
  'Sened-i İttifak (1808), padişahın yetkilerini kendi iradesiyle değil, taşra ayanlarının baskısıyla sınırlandıran ve ayanların varlığını resmen tanıyan ilk anayasal belgedir. Magna Carta ile büyük benzerlik gösterir.',
  'Tanzimat Fermanı hukukun üstünlüğünü getiren belgedir; padişahın yetkilerini ayanlara karşı ilk kez sınırlayan belge ise Sened-i İttifak''tır.'
);

-- Soru 42 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 1826 yılında bizzat Padişah II. Mahmut tarafından halkın ve ulemanın desteği alınarak Yeniçeri Ocağı''nın topa tutulup lağvedilmesi olayına Osmanlı tarihinde ne ad verilmiştir?',
  '{"options": ["Vaka-i Hayriye (Hayırlı Olay)", "Vaka-i Vakvakiye (Çınar Vakası)", "Edirne Vakası", "31 Mart Vakası", "Kuleli Vakası"], "correctIndex": 0}'::jsonb,
  '1826''da Yeniçeri Ocağı''nın kaldırılmasına ''Vaka-i Hayriye'' denmiştir. Bu ocağın yerine ''Asakir-i Mansure-i Muhammediye'' adıyla modern bir Batı tarzı ordu kurulmuştur.',
  'Vaka-i Vakvakiye (Çınar Vakası) IV. Mehmet döneminde 30 devlet adamının çınar ağacına asılmasıdır. Yeniçeri Ocağı''nın kaldırılması Vaka-i Hayriye''dir.'
);

-- Soru 43 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Mahmut döneminde gerçekleştirilen idari ve bürokratik ıslahatlar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Divan-ı Hümayun kaldırılarak yerine Bakanlıklar (Nazırlıklar) sisteminin kurulması", "Sadrazamlık makamının ''Başvekalet'' adını alması", "Müsadere (devletin memur mallarına el koyması) sisteminin fiilen kaldırılması", "Tımar sisteminin kaldırılarak memurlara düzenli maaş bağlanması", "İlk Osmanlı anayasası olan Kanun-i Esasi''nin ilan edilerek meclis açılması"], "correctIndex": 4}'::jsonb,
  'Kanun-i Esasi''nin ilanı ve meclisin (Meclis-i Mebusan) açılması II. Mahmut döneminde değil, 1876 yılında II. Abdülhamit döneminde gerçekleşmiştir.',
  'II. Mahmut devlet yönetimini kökten modernize etmiştir (Nazırlıklar, Başvekalet, memur maaşı, muhtarlıklar); fakat Anayasa ve Meclis II. Abdülhamit dönemindedir.'
);

-- Soru 44 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde modern anlamda askeri amaçlı ilk nüfus sayımı, mülk sayımı ve ilk resmi gazete olan ''Takvim-i Vekayi'' hangi padişah döneminde yayımlanmaya başlamıştır?',
  '{"options": ["II. Mahmut", "Abdülmecit", "Abdülaziz", "III. Selim", "II. Abdülhamit"], "correctIndex": 0}'::jsonb,
  'II. Mahmut döneminde 1831 yılında askeri ve vergi amaçlı ilk nüfus sayımı yapılmış (sadece erkekler ve mülkler sayılmıştır) ve aynı yıl ilk resmi gazete olan Takvim-i Vekayi çıkarılmıştır.',
  'Tanzimat fermanı Abdülmecit dönemindedir; ilk resmi gazete Takvim-i Vekayi ve ilk nüfus sayımı ise II. Mahmut dönemindedir.'
);

-- Soru 45 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Mısır Valisi Mehmet Ali Paşa''nın isyan ederek Kütahya''ya kadar ilerlemesi üzerine Osmanlı Devleti çaresiz kalarak Rusya''dan yardım istemiştir. II. Mahmut''un bu durumu ''Denize düşen yılana sarılır'' sözüyle ifade ettiği bilinmektedir.

Osmanlı Devleti ile Rusya arasında 1833 yılında imzalanan, Boğazlar üzerinde Rusya''ya büyük ayrıcalıklar tanıyan ve Boğazlar Sorunu''nu ilk kez uluslararası bir mesele haline getiren antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Hünkar İskelesi Antlaşması", "Kütahya Antlaşması", "Balta Limanı Ticaret Sözleşmesi", "Edirne Antlaşması", "Londra Boğazlar Sözleşmesi"], "correctIndex": 0}'::jsonb,
  '1833 Hünkar İskelesi Antlaşması ile Osmanlı, bir saldırı halinde Boğazları Rusya lehine kapatmayı kabul etmiştir. Bu antlaşma Boğazlar Sorunu''nu başlatan ve Osmanlı''nın Boğazlar üzerinde tek başına egemenlik hakkını kullandığı son antlaşmadır.',
  'Kütahya Antlaşması Mehmet Ali Paşa ile imzalanmıştır; Rusya ile Boğazlar konusunda imzalanan ise Hünkar İskelesi Antlaşması''dır.'
);

-- Soru 46 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin Mısır Sorunu''nda İngiltere''nin askeri ve diplomatik desteğini alabilmek amacıyla 1838 yılında İngiltere ile imzaladığı, iç ve dış gümrük vergilerini düşürerek Osmanlı ülkesini ''Avrupa''nın açık pazarı'' haline getiren ve yerli esnafı iflasa sürükleyen ekonomik sözleşme aşağıdakilerden hangisidir?',
  '{"options": ["Balta Limanı Ticaret Sözleşmesi", "Hünkar İskelesi Antlaşması", "Paris Antlaşması", "Berlin Antlaşması", "Uşi Antlaşması"], "correctIndex": 0}'::jsonb,
  '1838 Balta Limanı Ticaret Sözleşmesi ile ithalat gümrüğü %5''e düşürülmüş, ihracat gümrüğü ise %12''ye çıkarılmıştır. Yed-i Vahid (tekel) sistemi kalkmış, Osmanlı loncaları çökmüş ve sanayi çökmüştür.',
  'Balta Limanı kapitülasyonların çok ötesinde İngiltere''ye serbest ticaret hakkı tanıyan ve Osmanlı ekonomisini dışa bağımlı kılan antlaşmadır.'
);

-- Soru 47 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Hünkar İskelesi Antlaşması''nın 8 yıllık süresinin dolması üzerine İngiltere, Rusya, Fransa, Avusturya ve Prusya''nın katılımıyla 1841 yılında imzalanan ve Boğazların uluslararası statüsünü belirleyen ilk uluslararası sözleşme aşağıdakilerden hangisidir?',
  '{"options": ["Londra Boğazlar Sözleşmesi", "Hünkar İskelesi Antlaşması", "Paris Barış Antlaşması", "Kütahya Antlaşması", "Bükreş Antlaşması"], "correctIndex": 0}'::jsonb,
  '1841 Londra Boğazlar Sözleşmesi ile Boğazlar barış zamanında tüm devletlerin savaş gemilerine kapatılmış, ticaret gemilerine açık tutulmuştur. Böylece Boğazlar uluslararası bir komisyonun ve devletlerin ortak garantörlüğüne girmiştir.',
  'Boğazlar''ın Osmanlı tek taraflı kontrolünden çıkıp ''uluslararası statü'' kazandığı belge 1841 Londra Boğazlar Sözleşmesi''dir.'
);

-- Soru 48 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1829 yılında imzalanan Edirne Antlaşması ile bağımsızlığını kazanan ve Osmanlı Devleti''nden ayrılarak bağımsız olan ''ilk azınlık / Balkan milleti'' aşağıdakilerden hangisidir?',
  '{"options": ["Yunanistan (Rumlar)", "Sırbistan", "Karadağ", "Romanya", "Bulgaristan"], "correctIndex": 0}'::jsonb,
  '1829 Edirne Antlaşması ile Yunanistan bağımsızlığını kazanan ilk Balkan devleti olmuştur. (Sırplar ise 1804''te ilk isyan eden, 1812''de ilk ayrıcalık alan millettir).',
  'İlk isyan eden Sırplardır; ancak ilk BAĞIMSIZ olan devlet Yunanistan''dır (Edirne Antlaşması 1829).'
);

-- Soru 49 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Mahmut döneminde açılan ve modern tıbbın temeli kabul edilen, hekim ve cerrah yetiştiren yüksekokul aşağıdakilerden hangisidir?',
  '{"options": ["Mekteb-i Tıbbiye", "Mekteb-i Harbiye", "Mekteb-i Mülkiye", "Darülmuallimin", "Sanayi-i Nefise"], "correctIndex": 0}'::jsonb,
  'II. Mahmut 1827 yılında askeri hekim ihtiyacını karşılamak için Tıbhane-i Amire ve Cerrahhane-i Mamure''yi (Mekteb-i Tıbbiye) kurmuştur. 14 Mart Tıp Bayramı bu okulun kuruluşuna dayanır.',
  'Mekteb-i Harbiye subay, Mekteb-i Mülkiye kaymakam ve bürokrat yetiştiren okuldur. Hekim mektebi Tıbbiye''dir.'
);

-- Soru 50 (Test 5)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Mahmut''un kılık-kıyafet alanında yaptığı düzenleme ile sarık ve cübbe yerine memurlara getirdiği başlık ve kıyafet zorunluluğu aşağıdakilerden hangisidir?',
  '{"options": ["Fes - Pantolon - Ceket", "Şapka - Kravat", "Kalpak - Çizme", "Sarık - Şalvar", "Kavuk - Kaftan"], "correctIndex": 0}'::jsonb,
  'II. Mahmut memurlara fes, ceket ve pantolon giyme zorunluluğu getirmiş ve kendi portresini devlet dairelerine astırmıştır. Gelenekçiler bu yenilikler sebebiyle padişaha ''Gavur Padişah'' lakabını takmışlardır.',
  'Şapka İnkılabı Cumhuriyet döneminde Atatürk tarafından yapılmıştır. II. Mahmut fes ve pantolonu getirmiştir.'
);

-- Soru 51 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '3 Kasım 1839 tarihinde Sadrazam Koca Mustafa Reşit Paşa tarafından Gülhane Parkı''nda halka ve yabancı elçilere okunan Gülhane Hatt-ı Hümayunu (Tanzimat Fermanı) hangi Osmanlı padişahı döneminde ilan edilmiştir?',
  '{"options": ["Sultan Abdülmecit", "II. Mahmut", "Sultan Abdülaziz", "V. Murat", "II. Abdülhamit"], "correctIndex": 0}'::jsonb,
  'Tanzimat Fermanı, II. Mahmut''un ölümü üzerine çok genç yaşta tahta çıkan oğlu Sultan Abdülmecit döneminde, Mustafa Reşit Paşa''nın çabalarıyla ilan edilmiştir.',
  'Fermanın hazırlıkları II. Mahmut devrinde başlamış olsa da resmen ilan eden padişah Sultan Abdülmecit''tir.'
);

-- Soru 52 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Tanzimat Fermanı''nın Türk anayasa ve demokrasi tarihindeki en büyük önemi aşağıdakilerden hangisidir?',
  '{"options": ["Padişahın ilk kez kendi gücünün üzerinde bir ''Kanun Gücü'' (hukukun üstünlüğü) olduğunu kabul etmesi", "Halkın ilk kez genel seçimlerle parlamentoya girmesi", "Padişahlık makamının kaldırılarak cumhuriyetin ilan edilmesi", "Gayrimüslimlere devlet memuru olma hakkının tamamen yasaklanması", "Müslüman olmayan halktan alınan vergilerin iki katına çıkarılması"], "correctIndex": 0}'::jsonb,
  'Tanzimat Fermanı ile padişah bizzat kendisinin de kanunlara uyacağına yemin etmiştir. Böylece padişahın mutlak otoritesi kanun gücüyle sınırlandırılmış ve hukukun üstünlüğü ilkesi kabul edilmiştir.',
  'Tanzimat Fermanı''nda Meclis veya Anayasa YOKTUR. Sadece kanun üstünlüğü, can, mal, namus güvencesi ve vergi adaleti vardır.'
);

-- Soru 53 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin 1853-1856 Kırım Savaşı devam ederken Avrupalı devletlerin desteğini sürdürebilmek ve Paris Barış Konferansı kararlarını etkileyebilmek amacıyla 1856 yılında ilan ettiği, özellikle ''gayrimüslim tebaaya'' çok geniş haklar tanıyan ferman aşağıdakilerden hangisidir?',
  '{"options": ["Islahat Fermanı", "Tanzimat Fermanı", "Sened-i İttifak", "Vilayet Nizamnamesi", "Kanun-i Esasi"], "correctIndex": 0}'::jsonb,
  '1856 Islahat Fermanı, Sadrazam Mehmet Emin Ali Paşa tarafından hazırlanmış ve doğrudan gayrimüslim tebaanın haklarını genişletmeyi hedeflemiştir. Gayrimüslimlere küçük düşürücü söz söylenmesi (gavur denmesi), cizye vergisi ve iltizam usulü kaldırılmıştır.',
  'Tanzimat tüm Osmanlı tebaasını (Müslim-Gayrimüslim eşitliği) kapsarken; Islahat Fermanı ağırlıklı olarak Gayrimüslimlere yönelik taviz ve haklar içerir.'
);

-- Soru 54 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1853-1856 Kırım Savaşı''nda Rusya''nın Sinop''ta Osmanlı donanmasını yakması üzerine İngiltere, Fransa ve Piyemonte (İtalya) Osmanlı''nın yanında savaşa girmiştir.

Kırım Savaşı sırasında modern hemşireliğin temellerini atan, Üsküdar Selimiye Kışlası''nda yaralı askerleri gece elinde lambasıyla tedavi ettiği için ''Lambalı Kadın'' (The Lady with the Lamp) unvanını alan ünlü hekim kimdir?',
  '{"options": ["Florence Nightingale", "Clara Barton", "Safiye Ali", "Marie Curie", "Halide Edip Adıvar"], "correctIndex": 0}'::jsonb,
  'Florence Nightingale, Kırım Savaşı''nda Selimiye Kışlası''nda İngiliz ve Osmanlı yaralı askerlerine gönüllü hemşirelik yapmış, hijyen şartlarını düzelterek binlerce askerin hayatını kurtarmıştır.',
  'ÖSYM Kırım Savaşı''nda ''Lambalı Kadın'' lakaplı Florence Nightingale''i defalarca sınav sorusu yapmıştır.'
);

-- Soru 55 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti, Kırım Savaşı''nın getirdiği ağır askeri masrafları karşılayabilmek amacıyla 1854 yılında tarihinde ilk kez hangi ülkeden dış borç almıştır?',
  '{"options": ["İngiltere", "Fransa", "Rusya", "Almanya", "Avusturya"], "correctIndex": 0}'::jsonb,
  'Osmanlı Devleti ilk dış borcunu 1854 yılında Kırım Savaşı sırasında Sultan Abdülmecit döneminde İngiltere''den almıştır.',
  'Fransa en çok borçlandığımız ülkedir; ancak İLK borç aldığımız devlet İngiltere''dir.'
);

-- Soru 56 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Kırım Savaşı''nın sonunda imzalanan 1856 Paris Barış Antlaşması''nın aşağıdaki maddelerinden hangisi Osmanlı Devleti''nin savaşı kazanmasına rağmen mağlup bir devlet gibi muamele gördüğünün en somut kanıtıdır?',
  '{"options": ["Osmanlı Devleti''nin bir Avrupa devleti sayılması ve Avrupa hukukundan yararlanması", "Osmanlı toprak bütünlüğünün Avrupalı büyük devletlerin ortak garantisi altında olması", "Karadeniz''in tarafsız hale getirilmesi; Osmanlı ve Rusya''nın Karadeniz''de tersane ve savaş gemisi bulundurmasının yasaklanması", "Tuna Nehri''nde ticaretin serbest olması", "Islahat Fermanı''nın antlaşma metnine dahil edilmesi"], "correctIndex": 2}'::jsonb,
  'Osmanlı galip tarafta yer almasına rağmen Karadeniz''de savaş gemisi ve tersane bulundurmaktan men edilmiştir. Kendi karasularında donanma bulunduramamak egemenlik haklarına açıkça aykırıdır.',
  'Bu madde hem Rusya''yı hem Osmanlı''yı kısıtlamıştır. Osmanlı galip olduğu halde kendi denizinde silahsızlandırılmıştır.'
);

-- Soru 57 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sultan Abdülmecit döneminde 1840 yılında çıkarılan ve Osmanlı Devleti''nin ''ilk kağıt parası'' kabul edilen faizli devlet tahvili niteliğindeki para aşağıdakilerden hangisidir?',
  '{"options": ["Kaime-i Mutebere", "Mecidiye", "Sikke-i Hasene", "Akçe", "Yarmak"], "correctIndex": 0}'::jsonb,
  'İlk kağıt para ''Kaime'' (Kaime-i Nakdiye-i Mutebere) 1840''ta Abdülmecit devrinde basılmıştır. Madeni para olarak da altın ve gümüş ''Mecidiye'' çıkarılmıştır.',
  'Kağıt para Kaime, madeni para ise Mecidiye''dir.'
);

-- Soru 58 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1860 yılında Şinasi ve Agah Efendi tarafından çıkarılan ve Osmanlı Devleti''nin ''ilk özel gazetesi'' kabul edilen yayın organı aşağıdakilerden hangisidir?',
  '{"options": ["Tercüman-ı Ahval", "Tasvir-i Efkar", "Ceride-i Havadis", "Takvim-i Vekayi", "İkdam"], "correctIndex": 0}'::jsonb,
  'Tercüman-ı Ahval (1860) ilk özel Türk gazetesidir. İlk tiyatro eseri olan Şinasi''nin ''Şair Evlenmesi'' de bu gazetede tefrika edilmiştir.',
  'Takvim-i Vekayi ilk resmi gazetedir; Ceride-i Havadis yarı resmidir; ilk özel gazete ise Tercüman-ı Ahval''dir.'
);

-- Soru 59 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Sultan Abdülaziz döneminde Mithat Paşa''nın öncülüğünde çiftçilere düşük faizli kredi sağlamak ve tefecilere karşı köylüyü korumak amacıyla kurulan, günümüz Ziraat Bankası''nın temeli kabul edilen sandık teşkilatı aşağıdakilerden hangisidir?',
  '{"options": ["Memleket Sandıkları", "Emniyet Sandığı", "Dersaadet Bankası", "Osmanlı Bankası", "İtibar-ı Milli Bankası"], "correctIndex": 0}'::jsonb,
  '1863 yılında Mithat Paşa tarafından Niş valiliği sırasında kurulan Memleket Sandıkları (ve Menafi Sandıkları), 1888 yılında II. Abdülhamit döneminde Ziraat Bankası''na dönüştürülmüştür.',
  'Memleket Sandıklarını kuran Mithat Paşa ve Abdülaziz''dir; Ziraat Bankası adını alması ise II. Abdülhamit dönemindedir.'
);

-- Soru 60 (Test 6)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı tarihinde ilk kez Avrupa''ya resmi ve barışçıl amaçlı bir gezi düzenleyerek Fransa, İngiltere, Belçika, Prusya ve Avusturya''yı ziyaret eden Osmanlı padişahı kimdir?',
  '{"options": ["Sultan Abdülaziz", "Sultan Abdülmecit", "II. Mahmut", "II. Abdülhamit", "V. Mehmet Reşat"], "correctIndex": 0}'::jsonb,
  'Sultan Abdülaziz 1867 yılında III. Napolyon''un davetiyle Paris Sanayi Sergisi''ne gitmiş ve Londra dahil birçok Avrupa başkentini ziyaret eden ilk Osmanlı padişahı olmuştur.',
  'Avrupa''ya seyahate giden ilk ve tek padişah Sultan Abdülaziz''dir.'
);

-- Soru 61 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Genç Osmanlılar (Jön Türkler) hareketinin baskısı ve Mithat Paşa''nın çabalarıyla 23 Aralık 1876 tarihinde Tersane (Tersane-i Amire) Konferansı''nın toplandığı gün ilan edilen Türk tarihinin ilk anayasası aşağıdakilerden hangisidir?',
  '{"options": ["Kanun-i Esasi", "Teşkilat-ı Esasiye", "Tanzimat Fermanı", "Sened-i İttifak", "1924 Anayasası"], "correctIndex": 0}'::jsonb,
  'Kanun-i Esasi (1876), Türk tarihinin ilk yazılı anayasasıdır. Böylece Osmanlı Devleti''nde mutlak monarşiden meşruti monarşiye geçilmiş ve halk ilk kez yönetime ortak olmuştur.',
  'Kanun-i Esasi ilk anayasadır; 1921 Teşkilat-ı Esasiye ise TBMM''nin ilk anayasasıdır.'
);

-- Soru 62 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1876 Kanun-i Esasi''ye göre kurulan Meclis-i Umumi (Osmanlı Parlamentosu) hangi iki alt meclisten oluşmaktaydı?',
  '{"options": ["Heyet-i Ayan - Heyet-i Mebusan", "Meclis-i Vükela - Meclis-i Has", "Millet Meclisi - Temsilciler Meclisi", "Divan-ı Hümayun - Meclis-i Ahkam-ı Adliye", "Senato - Temsilciler Kurulu"], "correctIndex": 0}'::jsonb,
  'Osmanlı Parlamentosu (Meclis-i Umumi): 1) Heyet-i Ayan (üyelerini ömür boyu padişah seçer), 2) Heyet-i Mebusan (üyelerini 4 yıllığına halk seçer).',
  'Ayan üyelerini halk değil, bizzat padişah seçer ve üyelik ömür boyudur; Mebusan üyelerini ise mülk sahibi erkek halk seçer.'
);

-- Soru 63 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1877-1878 Osmanlı-Rus Savaşı''nda (93 Harbi) Kafkas cephesinde Erzurum''daki Aziziye Tabyaları''nı savunan, satır ve baltalarla Rus askerlerine karşı halk direnişini örgütleyen kadın kahramanımız kimdir?',
  '{"options": ["Nene Hatun", "Gördesli Makbule", "Halide Onbaşı", "Tayyar Rahmiye", "Kara Fatma"], "correctIndex": 0}'::jsonb,
  'Nene Hatun, 93 Harbi''nde kundaktaki bebeğini evde bırakıp ''Bebeğim anasız büyür ama vatansız büyüyemez'' diyerek Aziziye Tabyası savunmasına koşan milli kahramanımızdır.',
  'Kara Fatma ve Gördesli Makbule Kurtuluş Savaşı kadın kahramanlarıdır; 93 Harbi''nin sembolü Nene Hatun''dur.'
);

-- Soru 64 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '93 Harbi''nde Tuna/Balkan cephesinde Plevne Kalesi''ni 145 gün boyunca Rus ordusunun devasa kuşatmasına karşı kahramanca savunan ve düşman komutanı Grandük Nikola''nın dahi kılıcını teslim almayıp saygı duyduğu ünlü Türk mareşali kimdir?',
  '{"options": ["Gazi Osman Paşa", "Ahmet Muhtar Paşa", "Süleyman Hüsnü Paşa", "Mahmut Şevket Paşa", "Kazım Karabekir"], "correctIndex": 0}'::jsonb,
  'Gazi Osman Paşa (Plevne Kahramanı), Plevne Savunması ile askeri tarihe geçmiş büyük komutandır. Ahmet Muhtar Paşa ise Kafkas cephesinin komutanıdır.',
  'Kafkas cephesinde Ahmet Muhtar Paşa; Plevne ve Balkanlar''da ise Gazi Osman Paşa vardır.'
);

-- Soru 65 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '93 Harbi sonunda Rusya ile imzalanan ancak Avrupalı devletlerin çıkarlarına ters düştüğü için uygulanamayan ve tarihimizde ''ölü doğmuş antlaşma'' olarak bilinen Ayastefanos (Yeşilköy) Antlaşması yerine imzalanan uluslararası antlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Berlin Antlaşması", "Paris Antlaşması", "Londra Antlaşması", "Bükreş Antlaşması", "Uşi Antlaşması"], "correctIndex": 0}'::jsonb,
  'Ayastefanos Antlaşması Rusya''yı aşırı güçlendirdiği için İngiltere ve Avusturya''nın müdahalesiyle iptal edilmiş; yerine 1878 Berlin Antlaşması imzalanmıştır.',
  'Osmanlı tarihinde yürürlüğe girmeyen iki antlaşma vardır: Biri Ayastefanos, diğeri ise Sevr Antlaşması''dır.'
);

-- Soru 66 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Antlaşması ile Osmanlı Devleti''nden ayrılarak aynı anda tam bağımsızlıklarını kazanan üç Balkan devleti aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Sırbistan - Karadağ - Romanya", "Yunanistan - Bulgaristan - Arnavutluk", "Sırbistan - Yunanistan - Bulgaristan", "Bulgaristan - Bosna Hersek - Karadağ", "Romanya - Arnavutluk - Makedonya"], "correctIndex": 0}'::jsonb,
  '1878 Berlin Antlaşması ile ''S-A-Ka-R-ya'' veya ''S-K-R'' şifresiyle kodlanan Sırbistan, Karadağ ve Romanya bağımsız olmuştur.',
  'Bulgaristan Berlin''de bağımsız olmamış; üçe bölünerek Osmanlı''ya bağlı özerk bir prenslik yapılmıştır. Bağımsız olanlar Sırbistan, Karadağ ve Romanya''dır.'
);

-- Soru 67 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Antlaşması''nın Türk ve dünya diplomasisi tarihindeki en kritik sonuçlarından biri aşağıdakilerden hangisidir?',
  '{"options": ["Ermeni Meselesi''nin tarihte ilk kez uluslararası bir konferans metnine girerek diplomasi alanına taşınması", "Mısır''ın bağımsızlığını ilan etmesi", "Boğazlar Komisyonu''nun resmen lağvedilmesi", "Yeniçeri Ocağı''nın kaldırılması", "Osmanlı Devleti''nin ilk kez dış borç alması"], "correctIndex": 0}'::jsonb,
  'Berlin Antlaşması''nın 61. maddesi Osmanlı''ya Doğu Anadolu''daki Ermeniler lehine ıslahat yapma zorunluluğu getirmiştir. Böylece Ermeni Sorunu uluslararası bir meseleye dönüşmüştür.',
  'Ermeni meselesinin doğduğu ve uluslararası belgeye girdiği ilk antlaşma 1878 Berlin Antlaşması''dır.'
);

-- Soru 68 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Kongresi''nde Osmanlı Devleti''nin haklarını Rusya''ya karşı savunması karşılığında, İngiltere''ye yönetimi ''geçici olarak'' bırakılan ancak I. Dünya Savaşı''nda İngiltere tarafından tek taraflı ilhak edilen Akdeniz adası aşağıdakilerden hangisidir?',
  '{"options": ["Kıbrıs", "Girit", "Rodos", "On İki Ada", "Midilli"], "correctIndex": 0}'::jsonb,
  'İngiltere, Rus tehlikesine karşı Osmanlı''yı koruma bahanesiyle 1878''de Kıbrıs''ın yönetimini üs olarak devralmıştır. 1914''te Osmanlı I. Dünya Savaşı''na girince adayı ilhak ettiğini duyurmuştur.',
  'Kıbrıs satılmamış, geçici üs olarak verilmiştir ancak İngiltere bir daha adadan çıkmamıştır.'
);

-- Soru 69 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 Berlin Antlaşması ile ''Elviye-i Selase'' (Üç Sancak) olarak bilinen ve savaş tazminatı karşılığı Rusya''ya bırakılan şehirlerimiz hangileridir?',
  '{"options": ["Kars - Ardahan - Batum", "Erzurum - Van - Muş", "Trabzon - Rize - Artvin", "Diyarbakır - Bitlis - Siirt", "Sivas - Kars - Bayburt"], "correctIndex": 0}'::jsonb,
  'Kars, Ardahan ve Batum (Elviye-i Selase), 1878 Berlin Antlaşması ile Rusya''ya bırakılmış, 1918 Brest-Litowsk ve 1921 Moskova/Kars antlaşmalarıyla tekrar anavatana katılmıştır.',
  'Doğubayazıt Berlin''de Osmanlı''ya geri verilmiştir; Rusya''da kalanlar Kars, Ardahan ve Batum''dur.'
);

-- Soru 70 (Test 7)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Ahmet Cevdet Paşa başkanlığındaki bir komisyon tarafından hazırlanan, İslam hukukuna dayalı (Hanefi fıkhı esaslı) Osmanlı Devleti''nin ilk medeni kanunu kabul edilen eser aşağıdakilerden hangisidir?',
  '{"options": ["Mecelle (Mecelle-i Ahkam-ı Adliye)", "Kanun-i Esasi", "Fatih Kanunnamesi", "Düstur", "Ceride-i Mahakim"], "correctIndex": 0}'::jsonb,
  'Mecelle, Ahmet Cevdet Paşa''nın başında bulunduğu heyet tarafından 1868-1876 yılları arasında hazırlanan Türk-İslam dünyasının ilk modern medeni kanunudur.',
  'Mecelle aile hukuku (evlenme-boşanma) konularını kapsamaz; borçlar, eşya ve yargılama usullerini içerir. 1926 Türk Medeni Kanunu ile yürürlükten kalkmıştır.'
);

-- Soru 71 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1881 yılında ilan edilen ''Muharrem Kararnamesi'' ile Osmanlı Devleti''nin iflasını açıklaması üzerine, Avrupalı alacaklı devletlerin borçlarını doğrudan tahsil etmek amacıyla kurdukları ve devletin gelir kaynaklarına (tuz, tütün, ipek, damga pulu vb.) el koyan uluslararası teşkilat aşağıdakilerden hangisidir?',
  '{"options": ["Düyun-ı Umumiye İdaresi (Genel Borçlar İdaresi)", "Reji İdaresi", "Osmanlı Bankası", "Kapitülasyon Komisyonu", "Hilal-i Ahmer Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Düyun-ı Umumiye İdaresi (1881), Osmanlı maliyesini doğrudan yöneterek gelirleri haczeden ''devlet içinde devlet'' niteliğinde bir sömürge kurumuydu. Ekonomik bağımsızlığı tamamen yok etmiştir.',
  'Düyun-ı Umumiye''nin kuruluşu Muharrem Kararnamesi iledir. Ramazan Kararnamesi (1875) faizleri ödeyememe ilanıdır.'
);

-- Soru 72 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Abdülhamit döneminde Alman mühendislerin ve sermayesinin iş birliğiyle inşa edilen, Berlin''den Bağdat''a ve Şam üzerinden Medine''ye kadar uzanan, Müslümanların hac yolculuğunu kolaylaştıran demir yolu projesi aşağıdakilerden hangisidir?',
  '{"options": ["Hicaz Demiryolu (Bağdat Demiryolu)", "Rumeli Demiryolu", "Anadolu-Bağdat Hattı", "İzmir-Aydın Hattı", "Şam-Beyrut Hattı"], "correctIndex": 0}'::jsonb,
  'Hicaz Demiryolu, İslam dünyasından toplanan bağışlarla finanse edilen, II. Abdülhamit''in İslamcılık (Panislamizm) politikasının en büyük prestij ve ulaşım projesidir.',
  'Anadolu''daki ilk demir yolu İzmir-Aydın hattıdır (İngilizler); II. Abdülhamit''in milli ve dini projesi ise Hicaz Demiryolu''dur.'
);

-- Soru 73 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1908 yılında İngiltere Kralı VII. Edward ile Rus Çarı II. Nikola arasında Estonya''da gerçekleşen ve Osmanlı Devleti''nin Balkan ve Boğazlar topraklarının Rusya ve İngiltere arasında paylaşıldığı gizli diplomatik görüşme hangisidir?',
  '{"options": ["Reval Görüşmeleri", "Tilsit Görüşmeleri", "Bükreş Zirvesi", "Potsdam Zirvesi", "Tersane Konferansı"], "correctIndex": 0}'::jsonb,
  'Reval Görüşmeleri (Haziran 1908), Makedonya ve Boğazların Rusya''ya bırakılmasını kararlaştırmıştır. Bu görüşmeyi haber alan İttihatçılar meşrutiyeti yeniden ilan ettirmek için dağa çıkmıştır.',
  'Reval Görüşmeleri II. Meşrutiyet''in ilanını tetikleyen temel dış gelişmedir.'
);

-- Soru 74 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '13 Nisan 1909 (Rumi 31 Mart 1325) tarihinde Meşrutiyet rejimine ve Anayasa''ya karşı gerici çevrelerin ve Avcı Taburları''nın kışkırtmasıyla İstanbul''da patlak veren ''31 Mart Vakası''nı bastırmak üzere Selanik''ten yola çıkan askeri güç aşağıdakilerden hangisidir?',
  '{"options": ["Hareket Ordusu", "Kuvayımilliye", "Asakir-i Mansure", "Hamidiye Alayları", "Yıldırım Orduları"], "correctIndex": 0}'::jsonb,
  'Hareket Ordusu, Mahmut Şevket Paşa komutasında ve Kurmay Başkanı Mustafa Kemal (önce Kolağası Mustafa Kemal) idaresinde İstanbul''a gelerek 31 Mart isyanını bastırmıştır. Türk tarihinde rejime karşı yapılan ilk isyandır.',
  'Hareket Ordusu''nun komutanı Mahmut Şevket Paşa''dır; Mustafa Kemal kurmay başkanıdır. İsyan bastırıldıktan sonra II. Abdülhamit tahttan indirilmiştir.'
);

-- Soru 75 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin yıkılışını önlemek amacıyla ortaya atılan fikir akımları ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Osmanlıcılık - Din, dil, ırk farkı gözetmeksizin herkesi eşit Osmanlı vatandaşı sayma (Mithat Paşa, Namık Kemal)", "İslamcılık (Ümmetçilik) - Tüm Müslümanları halifenin sancağı altında birleştirme (II. Abdülhamit, Mehmet Akif)", "Türkçülük (Turancılık) - Bütün Türkleri bir çatı altında toplama ve milli kimliği güçlendirme (Ziya Gökalp, Yusuf Akçura)", "Batıcılık - Avrupa''nın bilim, teknik ve kurumlarını örnek alma (Tevfik Fikret, Celal Nuri)", "Adem-i Merkeziyetçilik - Bütün yetkilerin padişahın elinde toplandığı katı monarşiyi savunma (Prens Sabahattin)"], "correctIndex": 4}'::jsonb,
  'Prens Sabahattin''in savunduğu ''Adem-i Merkeziyetçilik'', merkeziyetçiliğin tam zıddıdır; yerel yönetimlerin yetkilerinin artırılmasını (federalizm) ve bireysel girişimciliği savunur.',
  'Adem-i Merkeziyetçilik yerinden yönetim ve serbest piyasa (liberalizm) demektir; merkeziyetçilik değildir.'
);

-- Soru 76 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
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
  'Mustafa Kemal''in tarih sahnesine çıktığı ve sömürgeciliğe karşı ilk zaferini kazandığı yer Derne ve Tobruk''tur.'
);

-- Soru 77 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Trablusgarp Savaşı sonunda İtalya ile 18 Ekim 1912''de imzalanan Uşi (Ouchy) Antlaşması''nın en önemli tarihi sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Devleti''nin Kuzey Afrika''daki son toprak parçasını (Trablusgarp ve Bingazi) kaybetmesi", "Mısır''ın İngiltere''ye bırakılması", "On İki Ada''nın kesin olarak Yunanistan''a devredilmesi", "İtalya''nın Boğazları işgal etmesi", "Kıbrıs''ın İtalyan yönetimine geçmesi"], "correctIndex": 0}'::jsonb,
  'Uşi Antlaşması ile Trablusgarp ve Bingazi İtalya''ya bırakılmış, böylece Osmanlı Devleti Kuzey Afrika''daki varlığını tamamen kaybetmiştir.',
  'Kuzey Afrika''da kaybedilen ilk yer Cezayir (1830 Fransa); son yer ise Trablusgarp''tır (1912 İtalya).'
);

-- Soru 78 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nda (1912) Osmanlı Devleti''ne karşı ittifak kurarak savaş açan dört Balkan devleti aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Bulgaristan - Yunanistan - Sırbistan - Karadağ", "Romanya - Bulgaristan - Yunanistan - Sırbistan", "Bulgaristan - Arnavutluk - Karadağ - Sırbistan", "Yunanistan - Romanya - Karadağ - Bosna", "Bulgaristan - Sırbistan - Rusya - Karadağ"], "correctIndex": 0}'::jsonb,
  'I. Balkan Savaşı''nda Osmanlı''ya karşı savaşan devletler: Bulgaristan, Yunanistan, Sırbistan ve Karadağ''dır. Savaşı başlatan ilk devlet Karadağ''dır. ROMANYA I. Balkan Savaşı''nda YOKTUR!',
  'Romanya I. Balkan Savaşı''nda yer almamış; II. Balkan Savaşı''nda Bulgaristan''ın aşırı büyümesi üzerine savaşa dahil olmuştur.'
);

-- Soru 79 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''ndaki kargaşa ve Osmanlı mağlubiyetinden faydalanarak bağımsızlığını ilan eden ve Osmanlı''dan ayrılan ''en son Balkan devleti'' aşağıdakilerden hangisidir?',
  '{"options": ["Arnavutluk", "Bulgaristan", "Sırbistan", "Makedonya", "Bosna-Hersek"], "correctIndex": 0}'::jsonb,
  'İsmail Kemal Bey önderliğinde 28 Kasım 1912''de bağımsızlığını ilan eden Arnavutluk, Osmanlı Devleti''nden ayrılan son Balkan milletidir. Bu ayrılık Osmanlıcılık fikrine son darbeyi vurmuştur.',
  'İlk ayrılan Yunanistan (1829), son ayrılan ise Arnavutluk''tur (1912).'
);

-- Soru 80 (Test 8)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nın yarattığı hezimet ve Edirne''nin elden çıkması üzerine 23 Ocak 1913 tarihinde Enver Paşa ve İttihatçıların hükümet merkezini basarak Sadrazam Kamil Paşa''yı istifaya zorladığı ve Mahmut Şevket Paşa''yı sadrazam yaptığı hükümet darbesine ne ad verilir?',
  '{"options": ["Bab-ı Ali Baskını", "31 Mart Vakası", "Çırağan Baskını", "Kuleli Vakası", "Kütahya İsyanı"], "correctIndex": 0}'::jsonb,
  'Bab-ı Ali Baskını, Türk siyasi tarihindeki ilk modern askeri hükümet darbesidir. Bu darbeyle İttihat ve Terakki Cemiyeti I. Dünya Savaşı''nın sonuna kadar devlette mutlak iktidar (Talat-Enver-Cemal Paşalar dönemi) kurmuştur.',
  'Bab-ı Ali Baskını bir padişah değişikliği DEĞİLDİR; sadece hükümet darbesidir. Padişah V. Mehmet Reşat tahtında kalmıştır.'
);

