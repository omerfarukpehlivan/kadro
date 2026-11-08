-- =============================================================
-- KPSS GÜNCEL BİLGİLER — KONU 5: UNESCO MIRAS LISTESI
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================
BEGIN;

-- Soru #01 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'UNESCO Dünya Miras Komitesi''nin 2023 yılı Eylül ayında Riyad''da düzenlenen 45. Genişletilmiş Oturumu''nda Türkiye''nin 20. DÜNYA MİRASI olarak listeye kabul edilen, Frigya Krallığı''nın başkenti ve Kral Midas''ın mezarının yer aldığı antik kent hangisidir?',
  '{"options": ["Gordion (Ankara - Polatlı)", "Arslantepe (Malatya)", "Göbeklitepe (Şanlıurfa)", "Afrodisias (Aydın)", "Aizanoi (Kütahya)"], "correctIndex": 0}'::jsonb,
  'Ankara''nın Polatlı ilçesinde yer alan Frig başkenti GORDİON, 2023 yılında Türkiye''nin 20. UNESCO Dünya Miras Alanı olarak tescil edilmiştir.',
  'Arslantepe 19. mirastır; 20. miras alanı GORDİON''dur; 21. miras ise Ahşap Direkli Camilerdir.'
);

-- Soru #02 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  '2023 yılında UNESCO Dünya Miras Listesi''ne Türkiye''nin 21. VARLIĞI olarak seri adaylık şeklinde kaydedilen ''Anadolu''nun Ortaçağ Dönemi Ahşap Hipostil Camileri'' arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Edirne Selimiye Camii", "Beyşehir Eşrefoğlu Camii (Konya)", "Afyonkarahisar Ulu Camii", "Sivrihisar Ulu Camii (Eskişehir)", "Kasaba Köyü Mahmut Bey Camii (Kastamonu)"], "correctIndex": 0}'::jsonb,
  'Ahşap Hipostil camileri seri mirasında 5 cami vardır: Konya Eşrefoğlu, Afyon Ulu Cami, Eskişehir Sivrihisar Ulu Cami, Kastamonu Mahmut Bey Cami ve Ankara Ahi Şerafettin (Arslanhane) Cami. Selimiye Camii ise Edirne''de Mimar Sinan eseridir ve 2011''de bağımsız olarak listeye girmiştir.',
  'Ahşap hipostil camileri arasında taş kubbeli Selimiye veya Sultanahmet YOKTUR; ahşap direkli 5 tarihi cami vardır.'
);

-- Soru #03 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'Türkiye''nin UNESCO Dünya Miras Listesi''nde yer alan varlıkları arasında hem ''DOĞAL'' hem de ''KÜLTÜREL'' kriterleri bir arada taşıyan ''KARMA MİRAS'' statüsündeki iki yer hangileridir?',
  '{"options": ["Göreme Milli Parkı ve Kapadokya — Pamukkale-Hierapolis", "Nemrut Dağı — Truva", "Efes — Bergama", "Ani Arkeolojik Alanı — Safranbolu", "Çatalhöyük — Göbeklitepe"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin 21 dünya mirasından 19''u kültürel mirastır; yalnızca 2 tanesi hem doğal güzelliği hem tarihi uygarlığı barındıran ''KARMA MİRAS''tır: 1) Göreme Milli Parkı ve Kapadokya (Nevşehir), 2) Pamukkale ve Hierapolis (Denizli).',
  'Türkiye''de saf doğal miras yoktur; sadece iki adet KARMA miras vardır: Kapadokya ve Pamukkale.'
);

-- Soru #04 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'Türkiye''nin UNESCO Dünya Miras Listesi''ne 1985 yılında DAHİL EDİLEN İLK ÜÇ VARLIĞI hangi seçenekte eksiksiz verilmiştir?',
  '{"options": ["İstanbul''un Tarihi Alanları — Divriği Ulu Camii ve Darüşşifası — Göreme ve Kapadokya", "Hattuşa — Nemrut Dağı — Xanthos-Letoon", "Safranbolu — Troya — Selimiye", "Çatalhöyük — Bergama — Efes", "Diyarbakır Surları — Ani — Göbeklitepe"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin 1985 yılında listeye ilk giren üç gözdesi: 1) İstanbul''un Tarihi Alanları, 2) Sivas Divriği Ulu Camii ve Darüşşifası, 3) Göreme Milli Parkı ve Kapadokya''dır.',
  'Listeye ilk giren cami Sivas Divriği Ulu Camii''dir (Selimiye 2011''de girmiştir).'
);

-- Soru #05 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'Tarihte bilinen ilk tapınak kompleksi kabul edilen, ''T'' biçimli dikilitaşları ve yabani hayvan kabartmalarıyla ''Tarihin Sıfır Noktası'' olarak anılan ve 2018''de UNESCO Dünya Miras Listesi''ne giren arkeolojik alan hangisidir?',
  '{"options": ["Göbeklitepe (Şanlıurfa)", "Çatalhöyük (Konya)", "Çayönü (Diyarbakır)", "Hacılar (Burdur)", "Alacahöyük (Çorum)"], "correctIndex": 0}'::jsonb,
  'Şanlıurfa''da Neolitik döneme ait 12 bin yıllık anıtsal tapınakları barındıran ve Alman arkeolog Klaus Schmidt''in gün yüzüne çıkardığı alan GÖBEKLİTEPE''dir.',
  'İlk köy yerleşimi Çayönü; ilk şehir yerleşimi Çatalhöyük; ilk tapınak kompleksi GÖBEKLİTEPE''dir.'
);

-- Soru #06 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  '2021 yılında UNESCO Dünya Miras Listesi''ne Türkiye''nin 19. varlığı olarak kaydedilen, kerpiç saray kompleksi ve dünyanın en eski kılıçlarının bulunduğu Malatya''daki höyük hangisidir?',
  '{"options": ["Arslantepe Höyüğü", "Gordion", "Kültepe Kaniş", "Yassıhöyük", "Karahantepe"], "correctIndex": 0}'::jsonb,
  'Malatya Battalgazi''deki ARSLANTEPE HÖYÜĞÜ, ilk devlet bürokrasisinin ve mühür baskılarının çıktığı kerpiç sarayıyla 2021''de 19. mirasımız olmuştur.',
  'Karahantepe Taş Tepeler projesindedir; UNESCO listesine giren Malatya höyüğü ARSLANTEPE''dir.'
);

-- Soru #07 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'Mimar Sinan''ın ''Ustalık Eserim'' dediği, 2011 yılında tekil anıt eser olarak UNESCO Dünya Miras Listesi''ne kabul edilen mimarlık şaheseri nerededir?',
  '{"options": ["Edirne (Selimiye Camii ve Külliyesi)", "İstanbul (Süleymaniye Camii)", "İstanbul (Şehzade Camii)", "Bursa (Ulu Cami)", "Manisa (Muradiye Camii)"], "correctIndex": 0}'::jsonb,
  'Mimar Sinan''ın ''çıraklık'' eseri Şehzade Camii, ''kalfalık'' eseri Süleymaniye Camii, ''ustalık'' eseri ise EDİRNE SELİMİYE CAMİİ''dir.',
  'Süleymaniye kalfalıktır; ustalık eseri ve UNESCO listesindeki cami Edirne SELİMİYE''dir.'
);

-- Soru #08 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'Güneşin doğuşu ve batışının devasa kral ve tanrı heykelleri arasında izlendiği, I. Antiochos''un tümülüsünün bulunduğu Kommagene Krallığı''na ait UNESCO Dünya Mirası alanı nerededir?',
  '{"options": ["Adıyaman (Nemrut Dağı)", "Bitlis (Nemrut Krater Gölü)", "Malatya", "Gaziantep", "Şanlıurfa"], "correctIndex": 0}'::jsonb,
  'Dev heykelleriyle ünlü UNESCO Dünya Mirası olan Nemrut Dağı ADIYAMAN il sınırları içerisindedir. (Bitlis''teki Nemrut ise volkanik krater gölüdür).',
  'Heykellerin olduğu UNESCO miras alanı ADIYAMAN''daki Nemrut Dağı''dır; Bitlis''teki krater gölü ile karıştırılmamalıdır.'
);

-- Soru #09 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'Anadolu''da kurulan ilk büyük imparatorluk olan Hititlerin başkenti olan, Yazılıkaya açık hava mabedi ve Boğazkale kalıntılarını barındıran UNESCO Dünya Miras Alanı hangi ilimizdedir?',
  '{"options": ["Çorum (Hattuşa)", "Yozgat", "Amasya", "Kayseri", "Kırşehir"], "correctIndex": 0}'::jsonb,
  'Hitit İmparatorluğu''nun başkenti HATTUŞA (Boğazköy), ÇORUM ili sınırlarında yer alır ve 1986''da listeye girmiştir.',
  'Hitit başkenti Hattuşa ÇORUM''dadır. Kültepe (Kayseri) Asur ticaret kolonisi merkezidir.'
);

-- Soru #10 (Zorluk: 1)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  1,
  'UNESCO Yaratıcı Şehirler Ağı''na (UCCN) ''GASTRONOMİ'' (Mutfak Kültürü) alanında Türkiye''den İLK KABUL EDİLEN şehir hangisidir?',
  '{"options": ["Gaziantep", "Hatay", "Afyonkarahisar", "Adana", "Şanlıurfa"], "correctIndex": 0}'::jsonb,
  '2015 yılında Gastronomi dalında Yaratıcı Şehirler Ağı''na Türkiye''den giren İLK şehir GAZİANTEP olmuştur. Ardından 2017''de Hatay, 2019''da Afyonkarahisar girmiştir.',
  'İLK giren Gaziantep''tir (2015); Hatay ikinci, Afyonkarahisar üçüncüdür.'
);

-- Soru #11 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO Yaratıcı Şehirler Ağı''na (UCCN) ''MÜZİK'' alanında Türkiye''den kabul edilen İLK ŞEHİR aşağıdakilerden hangisidir?',
  '{"options": ["Kırşehir", "Şanlıurfa", "Diyarbakır", "Sivas", "Trabzon"], "correctIndex": 0}'::jsonb,
  'Bozkırın tezenesi Neşet Ertaş ve Abdallık geleneğinin beşiği olan KIRŞEHİR, 2019 yılında Türkiye''nin Müzik alanındaki İLK Yaratıcı Şehri olmuştur. (Şanlıurfa 2023''te müzik dalında ikinci şehir olmuştur).',
  'Kırşehir İLK müzik şehridir (2019); Şanlıurfa ise ikinci müzik şehridir (2023).'
);

-- Soru #12 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  '2023 yılında UNESCO Yaratıcı Şehirler Ağı''na ''EDEBİYAT'' alanında Türkiye''den dahil edilen ilk kentimiz hangisidir?',
  '{"options": ["Kahramanmaraş", "İstanbul", "Diyarbakır", "Erzurum", "Kastamonu"], "correctIndex": 0}'::jsonb,
  '''Yedi Güzel Adam''ın şehri, şiir ve edebiyatın başkenti olarak anılan KAHRAMANMARAŞ, 2023''te Edebiyat alanında UNESCO Yaratıcı Şehir unvanını almıştır.',
  'Edebiyat alanındaki tek UNESCO yaratıcı şehrimiz KAHRAMANMARAŞ''tır.'
);

-- Soru #13 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO Yaratıcı Şehirler Ağı''na ''ZANAAT VE HALK SANATLARI'' alanında Türkiye''den giren ilk şehir hangisidir?',
  '{"options": ["Kütahya", "Bursa", "İznik", "Mardin", "Nevşehir"], "correctIndex": 0}'::jsonb,
  'Çinisi ve porseleniyle ünlü KÜTAHYA, 2017 yılında Zanaat ve Halk Sanatları dalında ağa katılan ilk Türk şehri olmuştur. (Bursa ise 2021''de ipek ve çinisiyle bu ağa girmiştir).',
  'İlk zanaat şehri KÜTAHYA''dır; Bursa ikinci zanaat şehridir.'
);

-- Soru #14 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO Yaratıcı Şehirler Ağı''na ''TASARIM'' alanında Türkiye''den dahil edilen metropol şehir hangisidir?',
  '{"options": ["İstanbul", "Ankara", "İzmir", "Eskişehir", "Antalya"], "correctIndex": 0}'::jsonb,
  '2017 yılında Tasarım (Design) kategorisinde Yaratıcı Şehirler Ağı''na dahil edilen şehrimiz İSTANBUL''dur.',
  'Tasarım kategorisindeki tek şehrimiz İSTANBUL''dur.'
);

-- Soru #15 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  '2023 yılı Aralık ayında Botsvana''nın Kasane kentinde toplanan UNESCO Somut Olmayan Kültürel Miras Komitesi toplantısında Türkiye adına listeye kaydedilen unsurlar arasında aşağıdakilerden hangisi YER ALMAZ?',
  '{"options": ["Kırkpınar Yağlı Güreşleri (2010)", "İftar ve İlgili Sosyo-Kültürel Gelenekler (2023)", "Tezhip Sanatı (2023)", "Sedef Kakma Sanatı (2023)", "Balaban / Mey Zanaatı ve İcrası (2023)"], "correctIndex": 0}'::jsonb,
  '2023 Kasane toplantısında İftar gelenekleri, Tezhip, Sedef Kakma ve Balaban/Mey icrası tescil edilmiştir. Kırkpınar Yağlı Güreşleri ise çok daha önce, 2010 yılında listeye alınmıştı.',
  '2023 yılında tescillenen 4 unsur: İftar, Tezhip, Sedef Kakma, Balaban/Mey''dir. Kırkpınar ise 2010 tarihlidir.'
);

-- Soru #16 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Anadolu''nun fethinde Alparslan''ın fethettiği ilk şehirlerden olan, ''1001 Kiliseli Şehir'' olarak anılan ve 2016''da UNESCO Dünya Mirası ilan edilen Ani Arkeolojik Alanı hangi ilimizdedir?',
  '{"options": ["Kars", "Ardahan", "Erzurum", "Ağrı", "Iğdır"], "correctIndex": 0}'::jsonb,
  'Türkiye-Ermenistan sınırında Arpaçay boyunda yer alan tarihi ANİ HARABELERİ ve Arkeolojik Alanı KARS ilindedir.',
  'Ani KARS''tadır. İshak Paşa ise Ağrı''dadır. Bu iki doğu eseri sıklıkla birbirine karıştırılır.'
);

-- Soru #17 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Dicle Nehri kıyısında 8 bin yıldır kesintisiz tarım yapılan ve 2015 yılında UNESCO Dünya Mirası olarak tescillenen Diyarbakır Kalesi ile birlikte korunan tarımsal peyzaj alanı hangisidir?',
  '{"options": ["Hevsel Bahçeleri", "Botan Vadisi", "Zerzevan Kalesi", "Hasankeyf", "Malabadi Köprüsü"], "correctIndex": 0}'::jsonb,
  '''Diyarbakır Kalesi ve Hevsel Bahçeleri Kültürel Peyzajı'' adıyla 2015 yılında UNESCO Dünya Miras Listesi''ne girmiştir.',
  'Hevsel Bahçeleri Dicle kenarındaki 8000 yıllık ekolojik tarım vahasıdır ve surlarla birlikte korunur.'
);

-- Soru #18 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Aşk ve güzellik tanrıçası Afrodit''e adanmış, Roma döneminin en ünlü heykelcilik okulu ve stadyumunu barındıran ve 2017''de UNESCO Miras Listesi''ne giren Afrodisias Antik Kenti nerededir?',
  '{"options": ["Aydın (Karacasu)", "Muğla", "Denizli", "İzmir", "Antalya"], "correctIndex": 0}'::jsonb,
  'Ara Güler''in köyde yolunu kaybedip tesadüfen fotoğraflamasıyla dünyaya duyurulan ve Prof. Kenan Erim''in kazdığı AFRODİSİAS, AYDIN''ın Karacasu ilçesindedir.',
  'Afrodisias AYDIN''dadır; Priene ve Milet de Aydın''dadır. Efes ise İZMİR''dedir.'
);

-- Soru #19 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Homeros''un İlyada Destanı''nda anlatılan ve Schliemann tarafından kazılan, 9 ayrı yerleşim katmanına sahip olan ve 1998''de UNESCO Miras Listesi''ne giren Troya (Truva) Antik Kenti nerededir?',
  '{"options": ["Çanakkale", "Balıkesir", "İzmir", "Manisa", "Bursa"], "correctIndex": 0}'::jsonb,
  'Çanakkale Tevfikiye köyü yakınlarında bulunan TROYA Arkeolojik Alanı, ÇANAKKALE ilindedir.',
  'Troya ÇANAKKALE''dedir; Assos da Çanakkale''dedir; Bergama ise İzmir''dedir.'
);

-- Soru #20 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Geleneksel ahşap konak mimarisini günümüze kadar bozulmadan koruyan, ''Korumanın Başkenti'' unvanıyla 1994 yılında UNESCO Dünya Miras Listesi''ne alınan ilçe hangisidir?',
  '{"options": ["Safranbolu (Karabük)", "Beypazarı (Ankara)", "Göynük (Bolu)", "Taraklı (Sakarya)", "Mudurnu (Bolu)"], "correctIndex": 0}'::jsonb,
  'Geleneksel Osmanlı sivil mimarisinin en güzel korunmuş örneği olan SAFRANBOLU, KARABÜK ilindedir ve 1994''te listeye girmiştir.',
  'Beypazarı ve Mudurnu aday listededir; ASIL listede yer alan yerleşim SAFRANBOLU''dur.'
);

-- Soru #21 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'İnsanlık tarihinin ilk toplu yerleşik hayata geçiş ve tarım toplumunun kanıtı olan, birbirine bitişik çatılardan girilen evleriyle bilinen Neolitik yerleşim Çatalhöyük hangi ilimizdedir?',
  '{"options": ["Konya (Çumra)", "Aksaray", "Karaman", "Niğde", "Kayseri"], "correctIndex": 0}'::jsonb,
  'James Mellaart ve Ian Hodder tarafından kazılan ÇATALHÖYÜK, KONYA''nın Çumra ilçesinde yer alır ve 2012''de UNESCO Dünya Miras Listesi''ne girmiştir.',
  'Çatalhöyük KONYA''dadır; Aşıklı Höyük ise Aksaray''dadır.'
);

-- Soru #22 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Helenistik dönemin en dik tiyatrosuna, Asklepion sağlık merkezine ve parşömen kağıdının icat edildiği kütüphaneye sahip olan ve 2014''te UNESCO Miras Listesi''ne giren antik kent hangisidir?',
  '{"options": ["Bergama (Pergamon - İzmir)", "Efes (İzmir)", "Milet (Aydın)", "Sardes (Manisa)", "Teos (İzmir)"], "correctIndex": 0}'::jsonb,
  'Parşömen kağıdının ana vatanı olan ve dik tiyatrosuyla ünlü olan BERGAMA (Pergamon), İZMİR''dedir.',
  'Parşömenin icat edildiği yer Bergama''dır; Efes ile karıştırılmamalıdır.'
);

-- Soru #23 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Celsus Kütüphanesi, Artemis Tapınağı, Meryem Ana Evi ve Yamaç Evleri ile 2015 yılında UNESCO Dünya Miras Listesi''ne giren büyük İyon liman kenti hangisidir?',
  '{"options": ["Efes (İzmir - Selçuk)", "Bergama", "Milet", "Knidos", "Klazomenai"], "correctIndex": 0}'::jsonb,
  'İzmir''in Selçuk ilçesinde yer alan EFES Antik Kenti, Celsus Kütüphanesi ve Artemis Tapınağı kalıntılarıyla 2015''te listeye girmiştir.',
  'Efes İZMİR Selçuk''tadır; Artemis Tapınağı Dünyanın Yedi Harikası''ndan biridir.'
);

-- Soru #24 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Likya Birliği''nin idari başkenti olan Xanthos ile dini merkezi olan Letoon tapınak alanı hangi iki ilimizin sınır bölgesinde yer alır?',
  '{"options": ["Antalya — Muğla", "İzmir — Aydın", "Muğla — Denizli", "Burdur — Isparta", "Mersin — Antalya"], "correctIndex": 0}'::jsonb,
  'Xanthos (Kaş/Antalya) ve Letoon (Seydikemer/Muğla), Likya uygarlığının en önemli merkezleri olarak 1988''de UNESCO Miras Listesi''ne ortak tescil edilmiştir.',
  'Xanthos Antalya tarafında, Letoon Muğla tarafındadır; ortak tescillidir.'
);

-- Soru #25 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO Dünya Belleği Kütüğü''nde (Memory of the World) Türkiye''den tescil edilen belgeler arasında aşağıdakilerden hangisi YER ALMAZ?',
  '{"options": ["Orhun Kitabeleri (Moğolistan tescili)", "Boğazköy Hitit Çivi Yazılı Tabletleri (2001)", "Kandilli Rasathanesi El Yazmaları (2001)", "Evliya Çelebi Seyahatnamesi (2013)", "Divanu Lugati''t-Türk El Yazması (2017)"], "correctIndex": 0}'::jsonb,
  'Orhun Abideleri Moğolistan''da yer alır. Türkiye''nin Dünya Belleği Kütüğü''nde Boğazköy Hitit tabletleri, Kandilli astronomi yazmaları, Evliya Çelebi Seyahatnamesi, Divanu Lugati''t-Türk ve Karatepe Aslantaş yazıtları kayıtlıdır.',
  'Orhun Yazıtları Türkiye sınırlarında değildir; Dünya Belleği Kütüğümüzde Boğazköy, Kandilli, Evliya Çelebi ve Divanu Lugati''t-Türk vardır.'
);

-- Soru #26 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Mengücekliler döneminde Ahmet Şah ve eşi Turan Melek tarafından yaptırılan, ''Taşın Nakış Gibi İşlendiği Eser'' olarak bilinen ve 1985''te Türkiye''den listeye giren ilk cami hangisidir?',
  '{"options": ["Divriği Ulu Camii ve Darüşşifası (Sivas)", "Eşrefoğlu Camii (Konya)", "Selimiye Camii (Edirne)", "Bursa Ulu Cami", "Diyarbakır Ulu Cami"], "correctIndex": 0}'::jsonb,
  'Kapılarındaki gölge ve motif oyunlarıyla ''Anadolu''nun El Hamrası'' sayılan DİVRİĞİ ULU CAMİİ VE DARÜŞŞİFASI, Sivas''tadır ve UNESCO listesindeki ilk mimari şaheserimizdir.',
  'Mengücek eseri Divriği Ulu Camii 1985''te İLK giren camidir; Selimiye ise 2011''de girmiştir.'
);

-- Soru #27 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nin ilk başkenti olan ve erken dönem Osmanlı mimarisinin doğuşunu simgeleyen Hanlar Bölgesi, Sultan Külliyeleri ve Cumalıkızık köyü hangi ilimizdedir?',
  '{"options": ["Bursa", "Bilecik", "Edirne", "İznik", "Kütahya"], "correctIndex": 0}'::jsonb,
  '''Bursa ve Cumalıkızık: Osmanlı İmparatorluğunun Doğuşu'' adıyla 2014 yılında UNESCO Dünya Miras Listesi''ne kaydedilmiştir.',
  'Cumalıkızık 700 yıllık yaşayan Osmanlı vakıf köyüdür ve BURSA''dadır.'
);

-- Soru #28 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO Somut Olmayan Kültürel Miras Temsili Listesi''ne 2021 yılında tescil edilen ve geleneksel Türk yazı sanatının zirvesi kabul edilen sanat dalı hangisidir?',
  '{"options": ["Hüsn-i Hat (Geleneksel Türk İslam Yazı Sanatı)", "Ebru (Geleneksel Türk Süsleme Sanatı)", "Minyatür Sanatı", "Çini Sanatı", "Tezhip Sanatı"], "correctIndex": 0}'::jsonb,
  'Kamış kalem ve is mürekkebiyle icra edilen HÜSN-İ HAT sanatı, 2021 yılında Türkiye''nin müstakil dosyası olarak UNESCO Somut Olmayan Miras Listesi''ne girmiştir.',
  'Ebru 2014, Minyatür 2020, Hüsn-i Hat 2021, Tezhip ise 2023 yılında tescil edilmiştir.'
);

-- Soru #29 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO Somut Olmayan Kültürel Miras Listesi''nde yer alan, Manisa''da 470 yılı aşkın süredir Sultan Camii kubbe ve minarelerinden halka saçılan geleneksel festival hangisidir?',
  '{"options": ["Mesir Macunu Festivali", "Kırkpınar Yağlı Güreşleri", "Kakava Hıdırellez Şenlikleri", "Ahilik Haftası Kutlamaları", "Ceviz Festivali"], "correctIndex": 0}'::jsonb,
  'Kanuni''nin annesi Hafsa Sultan''ın şifa bulması üzerine Merkez Efendi tarafından 41 çeşit baharatla hazırlanan MESİR MACUNU FESTİVALİ UNESCO listesindedir.',
  'Mesir Macunu Festivali MANİSA''dadır ve UNESCO tescillidir.'
);

-- Soru #30 (Zorluk: 2)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  2,
  'UNESCO tarafından 2021 yılında vefatının 700. yılı nedeniyle tüm dünyada anma programına dahil edilen ''Yaratılanı severiz, Yaratan''dan ötürü'' felsefesinin sahibi halk şairi kimdir?',
  '{"options": ["Yunus Emre", "Hacı Bektaş Veli", "Ahi Evran", "Aşık Veysel", "Mevlana Celaleddin Rumi"], "correctIndex": 0}'::jsonb,
  '2021 yılı UNESCO tarafından ve Cumhurbaşkanlığı genelgesiyle ''Yunus Emre ve Türkçe Yılı'' (700. vefat yılı) olarak kutlanmıştır. (Ayrıca Hacı Bektaş ve Ahi Evran da 2021 anma yılındaydı).',
  '2021 = Yunus Emre, Hacı Bektaş, Ahi Evran; 2023 = Aşık Veysel; 2024 = Ali Kuşçu ve Divanu Lugati''t-Türk yılıdır.'
);

-- Soru #31 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'UNESCO tarafından 2024 yılı Anma ve Kutlama Yıl Dönümleri Programı''na Türkiye''nin teklifiyle dahil edilen iki tarihi değerimiz hangi seçenekte doğru verilmiştir?',
  '{"options": ["Ali Kuşçu''nun Vefatının 550. Yılı — Divanu Lugati''t-Türk''ün Yazılışının 950. Yılı", "Aşık Veysel''in Vefatının 50. Yılı — Mevlana''nın 750. Vuslat Yılı", "Fuat Sezgin Yılı — Göbeklitepe Yılı", "Yunus Emre Yılı — Hacı Bektaş Veli Yılı", "Evliya Çelebi Yılı — Piri Reis Haritası Yılı"], "correctIndex": 0}'::jsonb,
  'UNESCO 42. Genel Konferansı''nda 2024 yılı için: 1) Ali Kuşçu''nun vefatının 550. yıl dönümü, 2) Kaşgarlı Mahmud''un Divanu Lugati''t-Türk eserinin yazılışının 950. yıl dönümü anma programına alınmıştır.',
  '2023 Mevlana ve Aşık Veysel idi; 2024 UNESCO anma yılı ALİ KUŞÇU ve DİVANU LUGATİ''T-TÜRK''tür.'
);

-- Soru #32 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'UNESCO Yaratıcı Şehirler Ağı''nda Türkiye''nin toplam kaç yaratıcı şehri yer almaktadır?',
  '{"options": ["7", "8", "9", "10", "12"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin UNESCO Yaratıcı Şehirler Ağı''nda tescilli 7 şehri vardır: Gaziantep (Gastronomi), Hatay (Gastronomi), Afyonkarahisar (Gastronomi), Kütahya (Zanaat), Bursa (Zanaat), İstanbul (Tasarım), Kırşehir (Müzik). (Şanlıurfa ve Maraş ile ilgili genişleme süreçleri devam etmektedir).',
  'Gastronomi (3), Zanaat (2), Tasarım (1), Müzik (1) olmak üzere ana listede 7 tescilli şehir öne çıkar.'
);

-- Soru #33 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'Türkiye''nin UNESCO Geçici Miras Listesi''nde yer alan, Roma İmparatorluğu''nun doğu sınırındaki en iyi korunmuş askeri garnizonu ve Mithras Tapınağı''na ev sahipliği yapan kale hangisidir?',
  '{"options": ["Zerzevan Kalesi (Diyarbakır - Çınar)", "Hoşap Kalesi (Van)", "Mamure Kalesi (Mersin)", "Zilkale (Rize)", "Harput Kalesi (Elazığ)"], "correctIndex": 0}'::jsonb,
  'Diyarbakır Çınar ilçesindeki ZERZEVAN KALESİ, yer altındaki gizemli Mithras Tapınağı ile dünya arkeolojisinin gözdesi olup UNESCO kalıcı listesine en güçlü adaylardandır.',
  'Mithras Tapınağı''nın bulunduğu askeri garnizon kalesi ZERZEVAN KALESİ''dir.'
);

-- Soru #34 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'UNESCO Dünya Miras Listesi''nde yer alan ''Gordion'' antik kentinde Gordios''un oğlu efsanevi kral Midas''ın mezarı olarak bilinen yapı mimari açıdan ne tür bir mezardır?',
  '{"options": ["Tümülüs (Yığma tepe mezar)", "Kaya mezarı", "Lahit", "Kurgan", "Kubbe kümbet"], "correctIndex": 0}'::jsonb,
  'Gordion''daki Midas Mezarı, dünyanın en büyük ikinci ahşap mezar odasına sahip devasa bir TÜMÜLÜS''tür (yığma toprak tepe mezar).',
  'Frig mezarları anıtsal ahşap odalı TÜMÜLÜSLERDİR. Likya''daki gibi kaya mezarı değildir.'
);

-- Soru #35 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'Anadolu''nun Ortaçağ Dönemi Ahşap Hipostil Camileri seri tescili kapsamında Ankara''nın Samanpazarı semtinde yer alan, devşirme sütunları ve ahşap direkleriyle ünlü Selçuklu camisi hangisidir?',
  '{"options": ["Ahi Şerafettin Camii (Arslanhane Camii)", "Hacı Bayram-ı Veli Camii", "Kocatepe Camii", "Melike Hatun Camii", "Cenabi Ahmet Paşa Camii"], "correctIndex": 0}'::jsonb,
  'Ahşap hipostil seri mirasında yer alan Ankara camisi, ceviz ağacından minberi ve ahşap sütunlarıyla ünlü AHİ ŞERAFETTİN (ARSLANHANE) CAMİİ''dir.',
  'Hacı Bayram Veli değildir; UNESCO Ahşap Cami listesindeki Ankara camisi ARSLANHANE (Ahi Şerafettin) Camii''dir.'
);

-- Soru #36 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'Beyşehir Gölü kıyısında yer alan, ahşap direkleri, çinili mihrabı ve ortasındaki karlık (ahşapların nemini dengeleyen kar kuyusu) havuzu ile UNESCO listesindeki Ahşap Hipostil camilerinin en büyüğü ve görkemlisi hangisidir?',
  '{"options": ["Eşrefoğlu Camii (Konya - Beyşehir)", "Afyonkarahisar Ulu Camii", "Mahmut Bey Camii", "Sivrihisar Ulu Camii", "Divriği Ulu Camii"], "correctIndex": 0}'::jsonb,
  'Eşrefoğulları Beyliği döneminden kalan EŞREFOĞLU CAMİİ (1296), tavanındaki karlık kuyusu ve çinili ahşap direkleriyle bu serinin şaheseridir.',
  'Beyşehir kıyısındaki karlık havuzlu ahşap cami EŞREFOĞLU CAMİİ''dir.'
);

-- Soru #37 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'Kastamonu''nun Kasaba köyünde bulunan, tek bir metal çivi dahi kullanılmadan ''KÜNDEKARİ'' (geçme tekniği) ile inşa edilen ahşap hipostil cami hangisidir?',
  '{"options": ["Mahmut Bey Camii", "İsmail Bey Camii", "Nasrullah Camii", "Atabeygazi Camii", "Yakup Ağa Camii"], "correctIndex": 0}'::jsonb,
  'Çivisiz cami olarak ünlenen ve ahşap oyma kapısı şaheser kabul edilen cami Kastamonu''daki MAHMUT BEY CAMİİ''dir (Candarogulları dönemi).',
  'Çivisiz ahşap geçme tekniğiyle ünlü UNESCO camisi KASTAMONU MAHMUT BEY CAMİİ''dir.'
);

-- Soru #38 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'UNESCO Dünya Biyosfer Rezervi Ağı''na Türkiye''den kabul edilen İLK VE TEK BİYOSFER REZERV ALANI neresidir?',
  '{"options": ["Artvin Camili (Macahel) Havzası", "Rize Kaçkar Dağları", "Muğla Köyceğiz-Dalyan", "Antalya Köprülü Kanyon", "Bolu Yedigöller"], "correctIndex": 0}'::jsonb,
  'Kafkas arı ırkının bozulmadan yaşadığı ve zengin bitki çeşitliliğine sahip ARTVİN BORÇKA CAMİLİ (MACAHEL) BÖLGESİ, Türkiye''nin ilk biyosfer rezerv alanıdır.',
  'Kaçkar veya Yedigöller değil; Türkiye''nin ilk UNESCO Biyosfer Rezervi ARTVİN CAMİLİ (MACAHEL)''dir.'
);

-- Soru #39 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'UNESCO tarafından Jeopark Ağı''na (Global Geoparks Network) Türkiye''den dahil edilen İLK VE TEK AVRUPA VE UNESCO JEOPARKI hangisidir?',
  '{"options": ["Kula-Salihli Jeoparkı (Manisa)", "Kızılcahamam Jeoparkı (Ankara)", "Nemrut Jeoparkı (Bitlis)", "Kapadokya Jeoparkı", "Pamukkale Traverten Jeoparkı"], "correctIndex": 0}'::jsonb,
  'Volkanik konileri ve lav akıntılarıyla Strabon''un ''Katakekaumene'' (Yanık Ülke) dediği MANİSA KULA-SALİHLİ JEOPARKI, Türkiye''nin ilk ve tek UNESCO Jeoparkıdır.',
  'Türkiye''nin resmi tescilli UNESCO Jeoparkı KULA-SALİHLİ''dir (Manisa).'
);

-- Soru #40 (Zorluk: 3)
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
  'Güncel Bilgiler',
  'UNESCO Miras Listesi',
  'multiple_choice',
  3,
  'UNESCO Genel Merkezi hangi dünya başkentinde yer almaktadır?',
  '{"options": ["Paris (Fransa)", "Cenevre (İsviçre)", "New York (ABD)", "Roma (İtalya)", "Viyana (Avusturya)"], "correctIndex": 0}'::jsonb,
  'Birleşmiş Milletler Eğitim, Bilim ve Kültür Örgütü''nün (UNESCO) ana karargahı ve genel merkezi Fransa''nın başkenti PARİS''tedir.',
  'UNESCO Paris''tedir; BM Ana Merkezi New York''ta; FAO Roma''da; DSÖ Cenevre''dedir.'
);

COMMIT;
