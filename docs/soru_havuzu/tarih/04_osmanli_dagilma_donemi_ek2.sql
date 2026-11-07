-- =====================================================================
-- ÜNİTE 4: Osmanlı Dağılma Dönemi (EK 20 RAFİNE SORU: Test 9, Test 10)
-- Toplam Soru: 20 Soru (Mevcut 80 + Bu Ek 20 = 100 Soru / 10 Test)
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 81 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde 19. yüzyıl başında milliyetçilik akımının etkisiyle 1804 yılında ilk isyanı başlatan lider ile Sırplara ilk kez ayrıcalık (imtiyaz) tanıyan 1812 antlaşması aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Kara Yorgi - Bükreş Antlaşması", "Miloş Obrenoviç - Edirne Antlaşması", "Aleksandr İpsilanti - Yaş Antlaşması", "Tepedelenli Ali Paşa - Kütahya Antlaşması", "Dimitri Kantemir - Pasarofça Antlaşması"], "correctIndex": 0}'::jsonb,
  'Sırp isyanını 1804''te Kara Yorgi başlatmıştır. 1812 Bükreş Antlaşması ile Sırplara ilk imtiyaz verilmiş, 1829 Edirne ile özerklik, 1878 Berlin ile bağımsızlık verilmiştir.',
  'İlk isyan eden Sırplardır ve lideri Kara Yorgi''dir. İlk ayrıcalık 1812 Bükreş Antlaşması''dır.'
);

-- Soru 82 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1821 yılında başlayan Rum (Yunan) İsyanı''nı kışkırtan, Fener Rum Patrikhanesi ve Rus çarlığı tarafından desteklenen gizli bağımsızlık cemiyeti aşağıdakilerden hangisidir?',
  '{"options": ["Etnik-i Eterya (Filiki Eterya)", "Hınçak Cemiyeti", "Taşnaksutyun", "Mavri Mira", "Kordos Cemiyeti"], "correctIndex": 0}'::jsonb,
  'Filiki Eterya (Dostluk Cemiyeti), 1814''te Odessa''da kurulmuş ve Yunan bağımsızlık isyanını organize etmiştir.',
  'Mavri Mira I. Dünya Savaşı dönemi cemiyetidir; 1821 isyanını başlatan ise Etnik-i Eterya''dır.'
);

-- Soru 83 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Yunan isyanını bastırmak amacıyla Osmanlı ve Mısır donanmalarının Mora kıyılarında bulunduğu sırada, 1827 yılında İngiliz, Fransız ve Rus birleşik donanmasının hiçbir savaş ilanı yapmadan Osmanlı donanmasını yaktığı liman baskını hangisidir?',
  '{"options": ["Navarin Baskını", "Sinop Baskını", "Çeşme Baskını", "İnebahtı Baskını", "Preveze Baskını"], "correctIndex": 0}'::jsonb,
  '1827 Navarin Baskını ile Osmanlı ve Mısır filosu tamamen yakılmış ve bu olay üzerine çıkan 1828-1829 Osmanlı-Rus Savaşı Yunanistan''ın bağımsızlığıyla sonuçlanmıştır.',
  'Osmanlı donanmasının yakıldığı 4 yer kronolojisi: İnebahtı (1571), Çeşme (1770), Navarin (1827), Sinop (1853).'
);

-- Soru 84 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1859 yılında Sultan Abdülmecit''i tahttan indirerek yerine Şehzade Abdülaziz''i geçirmeyi hedefleyen ve Türk siyasi tarihindeki ''ilk başarısız darbe girişimi'' kabul edilen gizli örgütlenme olayı nedir?',
  '{"options": ["Kuleli Vakası", "Çırağan Baskını", "Bab-ı Ali Baskını", "Edirne Vakası", "Patrona Halil İsyanı"], "correctIndex": 0}'::jsonb,
  'Kuleli Vakası (1859), Fedailer Cemiyeti tarafından Abdülmecit''e karşı planlanan ancak önceden haber alınarak bastırılan ilk askeri darbe teşebbüsüdür.',
  'Çırağan Baskını II. Abdülhamit''e karşı yapılmıştır; Kuleli Vakası ise Abdülmecit dönemindedir.'
);

-- Soru 85 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  3,
  '1878 yılında Ali Suavi önderliğindeki bir grubun, II. Abdülhamit''i devirerek akıl sağlığı bozuk olduğu gerekçesiyle tahttan indirilen V. Murat''ı yeniden tahta çıkarmak amacıyla gerçekleştirdiği kanlı saray baskını hangisidir?',
  '{"options": ["Çırağan Sarayı Baskını", "Kuleli Vakası", "Bab-ı Ali Baskını", "31 Mart Vakası", "Beylerbeyi Hadisesi"], "correctIndex": 0}'::jsonb,
  'Ali Suavi''nin Çırağan Sarayı Baskını, Beşiktaş Muhafızı Yedi Sekiz Hasan Paşa''nın Ali Suavi''yi başına sopayla vurarak öldürmesiyle bastırılmıştır.',
  'Çırağan Baskını Ali Suavi tarafından V. Murat''ı tahta geçirmek için yapılmıştır.'
);

-- Soru 86 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1877-1878 Osmanlı-Rus Savaşı''nda (93 Harbi) Balkanlar''da Şıpka Geçidi''ni Rus kuvvetlerine ve Bulgar çetelerine karşı dondurucu kış şartlarında aylarca kahramanca savunan ve ''Şıpka Kahramanı'' unvanını alan Osmanlı generali kimdir?',
  '{"options": ["Süleyman Hüsnü Paşa", "Gazi Osman Paşa", "Ahmet Muhtar Paşa", "Hasan Tahsin Paşa", "Ethem Paşa"], "correctIndex": 0}'::jsonb,
  'Süleyman Hüsnü Paşa Şıpka Geçidi savunması ile tarihe geçmiştir. Plevne Kahramanı Gazi Osman Paşa; Kafkas Kahramanı ise Ahmet Muhtar Paşa''dır.',
  'Plevne = Gazi Osman Paşa; Şıpka Geçidi = Süleyman Hüsnü Paşa''dır.'
);

-- Soru 87 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Abdülhamit döneminde Ermeni çetelerinin Doğu Anadolu''daki köylere ve Türk yerleşimlerine yönelik terör eylemlerini engellemek ve sınır güvenliğini sağlamak amacıyla Doğu''daki aşiretlerden kurulan süvari alaylarına ne ad verilmiştir?',
  '{"options": ["Hamidiye Alayları", "Asakir-i Mansure", "Kuvayımilliye", "Sekban-ı Cedit", "Başıbozuklar"], "correctIndex": 0}'::jsonb,
  'Hamidiye Süvari Alayları, II. Abdülhamit tarafından doğudaki Kürt ve Türkmen aşiretlerinden teşkil edilmiş, Rus ve Ermeni çetelerine karşı sınır güvenliğinde çok etkili olmuştur.',
  'Hamidiye Alayları II. Abdülhamit''in adını taşır ve düzenli süvari birlikleridir.'
);

-- Soru 88 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1896 yılında Ermeni Taşnak komitacılarının Avrupa''nın dikkatini çekmek amacıyla başkent İstanbul''da bastıkları ve rehineler aldıkları uluslararası finans kurumu aşağıdakilerden hangisidir?',
  '{"options": ["Osmanlı Bankası (Bank-ı Osmani-i Şahane)", "Ziraat Bankası", "Düyun-ı Umumiye", "Dersaadet Bankası", "Reji İdaresi"], "correctIndex": 0}'::jsonb,
  'Osmanlı Bankası Baskını (1896), Ermeni teröristlerin Galata''daki bankayı dinamitlerle işgal ederek Avrupa devletlerinin müdahalesini sağlamaya çalıştığı uluslararası krizdir.',
  'Ermeni komitacılar Osmanlı Bankası''nı işgal etmiştir. Rus elçisinin araya girmesiyle teröristler Fransa''ya kaçırılmıştır.'
);

-- Soru 89 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '21 Temmuz 1905 tarihinde Ermeni Taşnak komitacılarının II. Abdülhamit''e yönelik Cuma Namazı çıkışında Yıldız Camii önünde gerçekleştirdikleri bombalı suikast girişimi tarihe ne adla geçmiştir?',
  '{"options": ["Yıldız Suikastı", "Çırağan Olayı", "Kuleli Vakası", "Bab-ı Ali Baskını", "Selamlık Hadisesi"], "correctIndex": 0}'::jsonb,
  'Yıldız Suikastı''nda saatli bomba yüklü araba patlatılmış, Şeyhülislam ile birkaç dakika ayaküstü sohbet eden II. Abdülhamit ölümden kıl payı kurtulmuştur. Tevfik Fikret bu suikast için ''Bir Lahza-i Teahhur'' (Bir Anlık Gecikme) şiirini yazmıştır.',
  'Yıldız Suikastı II. Abdülhamit''e yöneliktir ve Tevfik Fikret''in ''Şanlı Avcı'' dediği olaydır.'
);

-- Soru 90 (Test 9)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde Tanzimat döneminde Ahmet Cevdet Paşa öncülüğünde kurulan, Osmanlı''nın ilk fen ve bilim akademisi niteliğinde olan, üniversite ders kitaplarını hazırlayan kurum hangisidir?',
  '{"options": ["Encümen-i Daniş", "Darülfünun", "Cemiyet-i İlmiye-i Osmaniye", "Tercüme Odası", "Mekteb-i Maarif"], "correctIndex": 0}'::jsonb,
  'Encümen-i Daniş (1851), Fransız Bilimler Akademisi örnek alınarak kurulan ilk Türk bilim akademisidir. Ahmet Cevdet Paşa ünlü ''Tarih-i Cevdet'' eserini bu kuruma sunmuştur.',
  'Encümen-i Daniş bilim akademisi ve ders kitabı telif heyetidir.'
);

-- Soru 91 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1897 Osmanlı-Yunan Savaşı''nda Ethem Paşa komutasındaki Türk ordusunun Yunan ordusunu kesin bir hezimete uğrattığı, Mustafa Kemal''in Manastır Askeri İdadisi''nde öğrenci iken savaşa katılmak için okuldan kaçtığı tarihi meydan savaşı hangisidir?',
  '{"options": ["Dömeke Meydan Muharebesi", "Tesalya Savaşı", "Preveze Muharebesi", "Yanya Savaşı", "Kırkkilise Savaşı"], "correctIndex": 0}'::jsonb,
  '1897 Dömeke Meydan Savaşı, Osmanlı''nın meydanda kazandığı son büyük zaferdir. Mustafa Kemal 16 yaşındayken bu savaşa katılmak için arkadaşıyla okuldan kaçmış fakat yakalanarak geri getirilmiştir.',
  'Mustafa Kemal''in gençliğinde ''Gidip savaşmak için can attım'' dediği savaş 1897 Dömeke Savaşı''dır.'
);

-- Soru 92 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1878 yılında Osmanlı Devleti''nin Girit''teki Rum isyanlarını yatıştırmak amacıyla Rumlara vergi muafiyeti, Hristiyan vali atanması ve Rumcanın resmi dil olmasını tanıdığı özerklik fermanı aşağıdakilerden hangisidir?',
  '{"options": ["Halepa Fermanı", "Tanzimat Fermanı", "Islahat Fermanı", "Vilayet Nizamnamesi", "Kanun-i Esasi"], "correctIndex": 0}'::jsonb,
  'Halepa Fermanı (1878), Girit''in adım adım Osmanlı''dan kopup Yunanistan''a bağlanmasına zemin hazırlayan özerklik belgesidir.',
  'Girit ile özdeşleşen ferman Halepa Fermanı''dır. 1908''de Girit Yunanistan''a katıldığını ilan etmiştir.'
);

-- Soru 93 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Dünya harp tarihinde ''askeri uçak ve hava saldırısının'' ilk kez bir devlete karşı kullanıldığı savaş hangisidir ve hangi devlet tarafından kullanılmıştır?',
  '{"options": ["1911 Trablusgarp Savaşı - İtalya", "1914 I. Dünya Savaşı - Almanya", "1912 Balkan Savaşı - Bulgaristan", "1897 Osmanlı-Yunan Savaşı - Yunanistan", "1919 Kurtuluş Savaşı - İngiltere"], "correctIndex": 0}'::jsonb,
  'İtalya, 1911 Trablusgarp Savaşı''nda Türk mevzilerine karşı tarihte ilk kez askeri uçak kullanmış ve havadan bomba atmıştır. Türk askerleri ise tüfek ateşiyle tarihte ilk kez uçak düşürmeyi başarmıştır.',
  'Dünyada askeri uçağın ilk kullanıldığı savaş Trablusgarp Savaşı''dır (İtalya tarafından).'
);

-- Soru 94 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  '1914 yılında İstanbul''dan Kahire''ye uzanan tarihi hava seferi sırasında Şam yakınlarında uçakları düşerek şehit olan ve Türk havacılık tarihinin ''ilk hava şehitleri'' kabul edilen pilotlarımız kimlerdir?',
  '{"options": ["Fethi Bey - Sadık Bey - Nuri Bey", "Cengiz Topel - Vecihi Hürkuş", "Ahmet Ali Çelikten - Vecihi Hürkuş", "Sabiha Gökçen - Vecihi Hürkuş", "Mehmet Ali Bey - Mazlum Keyüsk"], "correctIndex": 0}'::jsonb,
  'Yüzbaşı Fethi Bey ve Üsteğmen Sadık Bey Taberiye Gölü civarında şehit düşmüşlerdir. Muğla''nın Meğri kasabasına Fethi Bey''in anısına ''Fethiye'' adı verilmiştir.',
  'Fethiye ilçesinin adı ilk hava şehidimiz Fethi Bey''den gelmektedir.'
);

-- Soru 95 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nda Osmanlı ordusunun hezimete uğraması üzerine 30 Mayıs 1913''te imzalanan Londra Antlaşması''na göre Osmanlı Devleti''nin batı sınırı hangi hat olarak belirlenmiştir?',
  '{"options": ["Midye - Enez Hattı", "Meriç Nehri", "Çatalca Hattı", "Karasu Hattı", "Tuna Hattı"], "correctIndex": 0}'::jsonb,
  'Londra Antlaşması ile Osmanlı Midye-Enez hattının batısındaki tüm topraklarını (Edirne, Kırklareli dahil tüm Doğu ve Batı Trakya ile Makedonya) kaybetmiştir.',
  'I. Balkan sonu sınırı Midye-Enez''dir. II. Balkan''da Edirne geri alınınca sınır Meriç Nehri olmuştur.'
);

-- Soru 96 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'I. Balkan Savaşı sırasında Yunan donanmasının Çanakkale Boğazı ablukasını kırarak Ege ve Akdeniz''de tek başına aylarca korsan savaşı yürüten, Yunan gemilerini batıran ve ''Hamidiye Kahramanı'' unvanını alan ünlü Türk denizcisi ve devlet adamı kimdir?',
  '{"options": ["Rauf Orbay", "Ali Çetinkaya", "Hasan Saka", "Fahrettin Altay", "Kazım Özalp"], "correctIndex": 0}'::jsonb,
  'Rauf Orbay, Hamidiye Kruvazörü ile dünya denizcilik tarihine geçen bir harekat icra etmiş ve halkın sevgilisi olarak ''Hamidiye Kahramanı'' unvanını almıştır.',
  'Hamidiye Kahramanı Rauf Orbay''dır; Mondros''u imzalayan ve Terakkiperver kurucusu olan liderdir.'
);

-- Soru 97 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Balkan Savaşı''nın çıkış sebebi aşağıdakilerden hangisidir?',
  '{"options": ["I. Balkan Savaşı''nda Bulgaristan''ın en büyük payı (Ege kıyıları dahil) alması üzerine diğer Balkan devletlerinin (Yunanistan, Sırbistan, Karadağ ve Romanya) Bulgaristan''a saldırması", "Osmanlı''nın Atina''ya saldırması", "Rusya''nın Boğazları işgal etmesi", "Arnavutluk''un Sırbistan''ı işgal etmesi", "Avusturya''nın Bosna''yı ilhak etmesi"], "correctIndex": 0}'::jsonb,
  'Bulgaristan I. Balkan Savaşı''nda aslan payını alınca diğer müttefikleri Bulgaristan''a savaş açmıştır. Osmanlı da bu kargaşadan yararlanıp Edirne''yi savaşmadan geri almıştır.',
  'II. Balkan Savaşı Osmanlı''ya karşı değil; Bulgaristan''a karşı Balkan devletlerinin savaşıdır. Osmanlı fırsattan istifade Edirne''yi kurtarmıştır.'
);

-- Soru 98 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Balkan Savaşı sırasında Osmanlı ordusunun başında Edirne ve Kırklareli''yi Bulgar işgalinden kurtararak ''Edirne Fatihi'' unvanını alan Osmanlı komutanı kimdir?',
  '{"options": ["Enver Paşa", "Mahmut Şevket Paşa", "Talat Paşa", "Cemal Paşa", "Mustafa Kemal Paşa"], "correctIndex": 0}'::jsonb,
  'Enver Paşa, II. Balkan Savaşı''nda Edirne''yi geri alarak büyük bir halk kahramanı olmuş, ''Edirne Fatihi'' unvanını almış ve ardından Harbiye Nazırı olmuştur.',
  'Edirne Fatihi unvanı Enver Paşa''ya aittir.'
);

-- Soru 99 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'II. Balkan Savaşı sonunda Balkan devletlerinin kendi aralarında sınırları yeniden çizmek amacıyla imzaladıkları ve Bulgaristan''ın mağlup olduğu antlaşma hangisidir?',
  '{"options": ["Bükreş Antlaşması (1913)", "İstanbul Antlaşması", "Atina Antlaşması", "Londra Antlaşması", "Belgrad Antlaşması"], "correctIndex": 0}'::jsonb,
  'Balkan devletleri kendi aralarında 1913 Bükreş Antlaşması''nı imzalamışlardır. Osmanlı bu antlaşmada yer almamış; ikili antlaşmalar yapmıştır.',
  'Balkan devletlerinin kendi aralarındaki antlaşma Bükreş''tir; Osmanlı''nın Bulgaristan''la yaptığı 1913 İstanbul, Yunanistan''la yaptığı 1913 Atina''dır.'
);

-- Soru 100 (Test 10)
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'multiple_choice',
  2,
  'Balkan Savaşları''nın Osmanlı Devleti ve Türk toplumu üzerindeki en acı ve kalıcı sosyal sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Balkanlar''dan Anadolu''ya yüz binlerce Türk ve Müslümanın göç etmek zorunda kalması ve ''Balkan Muhacirleri'' sorununun doğması", "Anadolu''da tarımsal üretimin tamamen durması", "Gayrimüslimlerin askere alınmaya başlanması", "İstanbul''un başkentlikten çıkarılması", "Kapitülasyonların kendiliğinden kalkması"], "correctIndex": 0}'::jsonb,
  'Balkan Savaşları ile yüz binlerce soydaşımız katliamlardan kaçarak İstanbul ve Anadolu''ya sığınmış, bu göç Anadolu''da Türk nüfus oranını ciddi biçimde artırmış ve Türk milliyetçiliğini güçlendirmiştir.',
  'Balkan Savaşları Anadolu''daki Türk nüfus yoğunluğunu artırmış ve Türkçülük akımını devletin tek politikası haline getirmiştir.'
);

