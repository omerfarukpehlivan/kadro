-- =============================================================
-- KPSS VATANDAŞLIK — KONU 6: ULUSLARARASI KURULUŞLAR
-- Toplam Soru: 50 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Birleşmiş Milletler Güvenlik Konseyi''nde (BMGK) alınan kararları tek başına veto etme yetkisine sahip olan 5 daimi üye ülke aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Türkiye, Almanya, Japonya, ABD, Fransa", "Fransa, İngiltere, Rusya, Çin, Amerika Birleşik Devletleri (FİRÇA)", "ABD, Rusya, Çin, Almanya, İtalya", "İngiltere, Fransa, Almanya, Rusya, Çin", "ABD, İngiltere, Kanada, Avustralya, Japonya"], "correctIndex": 1}'::jsonb,
  'BM Güvenlik Konseyi''nin 5 daimi üyesi ''FİRÇA'' şifresiyle hatırlanır: Fransa, İngiltere, Rusya, Çin ve ABD. Bu beş ülkeden birinin olumsuz oy kullanması (veto hakkı) durumunda karar tasarısı kabul edilemez.',
  'Almanya ve Japonya ekonomik güç olmalarına rağmen daimi üye DEĞİLDİR! Daimi üyeler II. Dünya Savaşı''nın galip devletleridir (FİRÇA).'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Türkiye''nin Kuzey Atlantik Antlaşması Örgütü''ne (NATO) tam üye olarak kabul edildiği yıl ve hangi ülkeyle birlikte katıldığı aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["1949 — İtalya", "1952 — Yunanistan", "1955 — Almanya", "1960 — İspanya", "1945 — Fransa"], "correctIndex": 1}'::jsonb,
  'Türkiye, Kore Savaşı''na asker göndererek Batı bloğundaki yerini perçinlemiş ve 18 Şubat 1952 tarihinde Yunanistan ile birlikte NATO''ya resmen tam üye olmuştur.',
  'NATO 1949''da kurulmuştur; Türkiye ise kurucu üye değil, 1952''de Yunanistan ile birlikte katılan ilk genişleme üyesidir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Avrupa İnsan Hakları Mahkemesi (AİHM), hangi uluslararası kuruluşun yargı organı olarak görev yapmaktadır?',
  '{"options": ["Avrupa Birliği (AB)", "Avrupa Konseyi", "Birleşmiş Milletler (BM)", "Kuzey Atlantik İttifakı (NATO)", "Avrupa Güvenlik ve İşbirliği Teşkilatı (AGİT)"], "correctIndex": 1}'::jsonb,
  'AİHM, merkezi Strazburg''da bulunan ''Avrupa Konseyi''nin yargı organıdır. Avrupa Birliği''nin yargı organı ise Lüksemburg''daki ''Avrupa Birliği Adalet Divanı''dır (ABAD).',
  'AİHM Avrupa Birliği''nin değil, Türkiye''nin kurucusu olduğu AVRUPA KONSEYİ''nin mahkemesidir!'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  '2009 yılında Nahçıvan Anlaşması ile kurulan ve 2021 İstanbul Zirvesi''nde adını ''Türk Devletleri Teşkilatı'' (TDT) olarak değiştiren uluslararası örgütün genel merkezi hangi şehrimizdedir?',
  '{"options": ["Ankara", "İstanbul", "Bakü", "Taşkent", "Astana"], "correctIndex": 1}'::jsonb,
  'Türk Devletleri Teşkilatı''nın Genel Sekreterliği İstanbul''da bulunmaktadır.',
  'TDT''nin merkezi başkent Ankara değil, İstanbul''dur.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  '1992 yılında Türkiye''nin öncülüğünde İstanbul''da kurulan ve Karadeniz havzasındaki ülkelerin ekonomik iş birliğini hedefleyen Karadeniz Ekonomik İşbirliği Teşkilatı''nın (KEİ) daimi sekreteryası hangi şehirdedir?',
  '{"options": ["Samsun", "Trabzon", "İstanbul", "Bükreş", "Moskova"], "correctIndex": 2}'::jsonb,
  'Karadeniz Ekonomik İşbirliği Teşkilatı (KEİ) 1992''de İstanbul Zirvesi ile kurulmuş olup Genel Sekreterliği İstanbul''da (İstinye) yer almaktadır.',
  'KEİ''nin merkezi Karadeniz kıyısındaki bir Karadeniz ili (Trabzon/Samsun) değil, Boğaz kenti İstanbul''dur.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Birleşmiş Milletler''in eğitim, bilim ve kültür alanında dünya mirasını koruyan uzman kuruluşu aşağıdakilerden hangisidir?',
  '{"options": ["UNICEF", "UNESCO", "WHO", "FAO", "ILO"], "correctIndex": 1}'::jsonb,
  'UNESCO (Birleşmiş Milletler Eğitim, Bilim ve Kültür Örgütü), merkezi Paris''te bulunan ve Dünya Mirası Listesi''ni oluşturan kuruluştur. UNICEF çocuklara, WHO sağlığa, FAO gıda ve tarıma, ILO çalışma hayatına bakar.',
  'UNICEF çocuk fonudur; UNESCO ise bilim, kültür ve eğitim örgütüdür.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'İslam İşbirliği Teşkilatı (İİT), 1969 yılında hangi tarihi ve dini olayın ardından Fas''ın başkenti Rabat''ta toplanan zirve ile kurulmuştur?',
  '{"options": ["Körfez Savaşı''nın çıkması", "Kudüs''teki Mescid-i Aksa''nın bir fanatik tarafından kundaklanarak yakılması", "Sovyetler Birliği''nin Afganistan''ı işgali", "İran-Irak Savaşı''nın başlaması", "Kıbrıs Barış Harekatı"], "correctIndex": 1}'::jsonb,
  '21 Ağustos 1969''da Avustralyalı bir fanatik Yahudi''nin Kudüs''teki Mescid-i Aksa''yı kundaklaması İslam dünyasında büyük infial yaratmış ve Eylül 1969''da Rabat''ta İslam Zirvesi toplanarak İslam Konferansı Örgütü (bugünkü İİT) kurulmuştur. Merkezi Suudi Arabistan Cidde''dir.',
  'İİT''nin kuruluş kıvılcımı Mescid-i Aksa''nın kundaklanmasıdır; merkezi ise Cidde''dir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Gelişmekte olan sekiz Müslüman ülkenin ekonomik iş birliği için 1997 yılında Türkiye''nin öncülüğünde (Necmettin Erbakan) İstanbul''da kurulan uluslararası kuruluş hangisidir?',
  '{"options": ["G-20", "D-8 (Developing 8)", "OPEC", "KEİ", "ŞİÖ"], "correctIndex": 1}'::jsonb,
  'D-8 (Gelişen Sekiz Ülke); Türkiye, İran, Pakistan, Bangladeş, Malezya, Endonezya, Mısır ve Nijerya''dan oluşan ve genel sekreterliği İstanbul''da bulunan ekonomik örgüttür.',
  'D-8''in kurucusu Türkiye''dir ve merkezi İstanbul''dur. Üyeleri 8 büyük gelişmekte olan Müslüman devlettir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Kuzey Atlantik Antlaşması Örgütü''nün (NATO) genel idari merkezi ve karargahı hangi ülkede ve şehirde bulunmaktadır?',
  '{"options": ["ABD — Washington", "Fransa — Paris", "Belçika — Brüksel", "İsviçre — Cenevre", "Hollanda — Lahey"], "correctIndex": 2}'::jsonb,
  'NATO''nun genel siyasi ve idari merkezi Belçika''nın başkenti Brüksel''dedir. (AB kurumlarının da merkezi Brüksel''dir).',
  'NATO antlaşması Washington''da imzalanmıştır ancak karargahı Belçika Brüksel''dedir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Birleşmiş Milletler''in ana yargı organı olan ve devletler arasındaki hukuki uyuşmazlıkları karara bağlayan ''Uluslararası Adalet Divanı'' (UAD) hangi şehirde bulunmaktadır?',
  '{"options": ["New York (ABD)", "Cenevre (İsviçre)", "Lahey (Hollanda)", "Strazburg (Fransa)", "Viyana (Avusturya)"], "correctIndex": 2}'::jsonb,
  'BM''nin diğer tüm ana organları New York''ta bulunurken; tek istisna Uluslararası Adalet Divanı''dır (UAD). UAD Hollanda''nın Lahey (The Hague) kentindeki Barış Sarayı''nda görev yapar.',
  'BM ana organlarından merkezi New York''ta OLMAYAN tek organ Lahey''deki Uluslararası Adalet Divanı''dır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'NATO''ya son yıllarda katılarak üye sayısını artıran en son iki üye devlet aşağıdakilerden hangisinde kronolojik sırasıyla doğru verilmiştir?',
  '{"options": ["Karadağ — Kuzey Makedonya", "Finlandiya (31. üye) — İsveç (32. üye)", "Ukrayna — Gürcistan", "İsveç — İsviçre", "Bosna-Hersek — Kosova"], "correctIndex": 1}'::jsonb,
  'Rusya-Ukrayna savaşı sonrası geleneksel tarafsızlık politikasını terk eden Finlandiya 2023 yılında NATO''nun 31. üyesi; İsveç ise 2024 yılında NATO''nun 32. üyesi olmuştur.',
  'Finlandiya 31. üye, İsveç ise 32. üyedir. İsviçre ve Avusturya NATO üyesi değildir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '2022 yılında Özbekistan''ın Semerkant kentinde düzenlenen Türk Devletleri Teşkilatı (TDT) Liderler Zirvesi''nde teşkilata ''Gözlemci Üye'' olarak kabul edilen tarihi devlet hangisidir?',
  '{"options": ["Türkmenistan", "Macaristan", "Kuzey Kıbrıs Türk Cumhuriyeti (KKTC)", "Tacikistan", "Moğolistan"], "correctIndex": 2}'::jsonb,
  '11 Kasım 2022 Semerkant Zirvesi''nde Kuzey Kıbrıs Türk Cumhuriyeti (KKTC), anayasal adıyla Türk Devletleri Teşkilatı''na oy birliğiyle GÖZLEMCİ ÜYE olarak kabul edilmiştir (diplomatik bir dönüm noktasıdır).',
  'KKTC''nin TDT''ye gözlemci üye yapılması son yılların en önemli uluslararası siyasi kazanımıdır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa Birliği''nden (AB) halkoylaması (referandum) sonucu resmen ayrılarak ''Brexit'' sürecini tamamlayan ve birlikten ayrılan ilk tam üye ülke hangisidir?',
  '{"options": ["Norveç", "Birleşik Krallık (İngiltere)", "İsviçre", "İzlanda", "Danimarka"], "correctIndex": 1}'::jsonb,
  'Birleşik Krallık 2016 yılında yaptığı referandumla AB''den ayrılma kararı almış ve 31 Ocak 2020 tarihinde ''Brexit'' ile AB üyeliğinden resmen ayrılmıştır.',
  'Norveç ve İsviçre zaten hiçbir zaman AB üyesi olmamıştır; birlikten ayrılan tek ülke Birleşik Krallık''tır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'İslam İşbirliği Teşkilatı''nın (İİT) tarihinde ilk kez bir Türk vatandaşı 2004-2014 yılları arasında Genel Sekreterlik görevini üstlenmiştir.

İİT Genel Sekreterliği yapan bu Türk diplomat ve akademisyen kimdir?',
  '{"options": ["Ekmeleddin İhsanoğlu", "Volkan Bozkır", "Mevlüt Çavuşoğlu", "Hikmet Çetin", "İsmail Cem"], "correctIndex": 0}'::jsonb,
  'Prof. Dr. Ekmeleddin İhsanoğlu, seçimle işbaşına gelen ilk İİT Genel Sekreteri olmuş ve 2005-2014 arasında bu görevi başarıyla yürütmüştür.',
  'Ekmeleddin İhsanoğlu İİT Genel Sekreterliği yapmıştır; Volkan Bozkır ise BM 75. Genel Kurul Başkanlığı yapmıştır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa Birliği''ne üye olmak isteyen aday ülkelerin tam üyelik müzakerelerine başlayabilmesi için yerine getirmesi gereken demokrasi, hukukun üstünlüğü, insan hakları ve azınlıkların korunması şartlarını içeren siyasi kriterler bütününe ne ad verilir?',
  '{"options": ["Maastricht Kriterleri", "Kopenhag Kriterleri", "Schengen İlkeleri", "Madrid Şartı", "Lizbon Kriterleri"], "correctIndex": 1}'::jsonb,
  'AB''nin siyasi kriterlerine ''Kopenhag Kriterleri'' (demokrasi, insan hakları, hukuk devleti); parasal ve ekonomik kriterlerine (bütçe açığı, enflasyon, kamu borç stoku) ise ''Maastricht Kriterleri'' denir.',
  'Siyasi kriterler = Kopenhag; Parasal/Ekonomik kriterler = Maastricht.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Türkiye ile Avrupa Birliği arasındaki ilişkilerin tarihsel gelişimi değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Türkiye 1959 yılında dönemin Avrupa Ekonomik Topluluğu''na (AET) ortaklık başvurusu yapmıştır.", "1963 Ankara Anlaşması Türkiye ile AET arasında ortaklık ilişkisi kuran temel hukuki belgedir.", "Türkiye 1996 yılında AB ile Gümrük Birliği''ne girmiştir.", "Türkiye 1999 Helsinki Zirvesi''nde resmen ''Aday Ülke'' ilan edilmiştir.", "Türkiye Avrupa Birliği''nin kurucu üyeleri arasında yer almaktadır."], "correctIndex": 4}'::jsonb,
  'AB''nin (AET) 1957 Roma Antlaşması ile 6 kurucu üyesi vardır: Fransa, Batı Almanya, İtalya, Belçika, Hollanda, Lüksemburg. Türkiye kurucu üye değildir; 1999''da aday ülke olmuş, 2005''te müzakerelere başlamıştır.',
  'Türkiye BM, Avrupa Konseyi ve OECD''nin kurucusudur; ancak AB''nin kurucusu kesinlikle değildir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Uluslararası Polis Teşkilatı olan INTERPOL''ün genel sekreterliği ve merkezi hangi ülkede ve şehirdedir?',
  '{"options": ["Fransa — Lyon", "ABD — New York", "Hollanda — Lahey", "İsviçre — Cenevre", "Almanya — Berlin"], "correctIndex": 0}'::jsonb,
  'INTERPOL (Uluslararası Kriminal Polis Teşkilatı), 195 üye ülkesiyle dünyanın en büyük polis iş birliği örgütüdür ve genel merkezi Fransa''nın Lyon kentindedir.',
  'INTERPOL Paris''te değil, Fransa''nın Lyon kentindedir; EUROPOL ise Lahey''dedir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'D-8 (Gelişen Sekiz Ülke) teşkilatının kurucu üyeleri arasında aşağıdakilerden hangisi YER ALMAZ?',
  '{"options": ["Türkiye", "İran", "Mısır", "Suudi Arabistan", "Endonezya"], "correctIndex": 3}'::jsonb,
  'D-8 üyeleri: Türkiye, İran, Pakistan, Bangladeş, Malezya, Endonezya, Mısır ve Nijerya''dır. Suudi Arabistan, Irak veya Katar D-8 üyesi DEĞİLDİR.',
  'Suudi Arabistan D-8 üyesi değildir; adaylar Arap ülkelerinin tamamının üye olduğunu sanabilir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Türkiye''nin 2012 yılında ''Diyalog Ortağı'' statüsü kazandığı ve Çin ile Rusya''nın öncülüğünde Avrasya coğrafyasında güvenlik ve ekonomik iş birliği yürüten örgüt hangisidir?',
  '{"options": ["Şanghay İşbirliği Örgütü (ŞİÖ)", "Arap Birliği", "Körfez İşbirliği Konseyi", "Kuzey Konseyi", "Bağımsız Devletler Topluluğu"], "correctIndex": 0}'::jsonb,
  '1996''da Şanghay Beşlisi olarak kurulan ve 2001''de Şanghay İşbirliği Örgütü''ne dönüşen teşkilatta Türkiye 2012''den bu yana ''Diyalog Ortağı'' statüsündedir.',
  'Türkiye ŞİÖ''ye tam üye değildir; Diyalog Ortağıdır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa Konseyi üyeliğinden 2022 yılında Ukrayna''ya karşı başlattığı askeri harekat sebebiyle resmen çıkarılan (ihraç edilen) ülke hangisidir?',
  '{"options": ["Belarus", "Rusya Federasyonu", "Sırbistan", "Ermenistan", "Macaristan"], "correctIndex": 1}'::jsonb,
  'Avrupa Konseyi Bakanlar Komitesi, 16 Mart 2022 tarihinde Ukrayna''nın işgali nedeniyle Rusya Federasyonu''nu Avrupa Konseyi üyeliğinden ihraç etmiştir.',
  'Rusya ihraç edilmiş, böylece Rus vatandaşlarının AİHM''ye başvuru yolu da kapanmıştır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Karadeniz Ekonomik İşbirliği Teşkilatı''nın (KEİ) kurucu üyeleri arasında yer almasına rağmen Karadeniz''e doğrudan kıyısı BULUNMAYAN ülkeler aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Azerbaycan, Ermenistan, Yunanistan, Arnavutluk, Moldova, Sırbistan", "Türkiye, Rusya, Ukrayna", "Romanya, Bulgaristan, Gürcistan", "İtalya, Almanya, Macaristan", "İran, Irak, Suriye"], "correctIndex": 0}'::jsonb,
  'KEİ havza temelli bir örgüttür ancak Karadeniz''e sahili olmadığı halde KEİ kurucu/üyesi olan ülkeler vardır: Azerbaycan, Ermenistan, Yunanistan, Arnavutluk, Moldova, Sırbistan ve Kuzey Makedonya.',
  'Azerbaycan, Ermenistan ve Yunanistan''ın Karadeniz''e sahili yoktur fakat KEİ üyesidirler!'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa İnsan Hakları Mahkemesi''ne (AİHM) Türkiye aleyhine bireysel başvuru yapılabilmesi için iç hukukta son olarak hangi yargı merciine başvurulmuş ve tüketilmiş olması zorunludur?',
  '{"options": ["Yargıtay Ceza Genel Kurulu", "Danıştay İdari Dava Daireleri Kurulu", "Anayasa Mahkemesi (Bireysel Başvuru yolu)", "Uyuşmazlık Mahkemesi", "Adalet Bakanlığı İnsan Hakları Tazminat Komisyonu"], "correctIndex": 2}'::jsonb,
  '2010 yılında Türk Anayasa Mahkemesi''ne Bireysel Başvuru yolu getirildikten sonra, AİHM Türkiye''den doğrudan gelen başvuruları kabul etmemekte; öncelikle Anayasa Mahkemesi''ne bireysel başvuru yapılması ve bu yolun da tüketilmesi şartını aramaktadır.',
  'AYM''ye bireysel başvuru tüketilmeden AİHM''ye gidilemez; AİHM başvuruyu iç hukuk yolları tüketilmediği için usulden reddeder.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Dünya Ticaret Örgütü (DTÖ / WTO) hangi uluslararası anlaşmanın yerine 1995 yılında kurulmuştur?',
  '{"options": ["Bretton Woods Anlaşması", "GATT (Gümrük Tarifeleri ve Ticaret Genel Anlaşması)", "Varşova Paktı", "Marshall Planı", "Balkan Antantı"], "correctIndex": 1}'::jsonb,
  '1947 tarihli GATT (Genel Tarifeler ve Ticaret Anlaşması), 1994 Marakeş Zirvesi ile kurumsal bir yapıya bürünerek 1 Ocak 1995''te Dünya Ticaret Örgütü''ne (DTÖ) dönüşmüştür. Merkezi Cenevre''dedir.',
  'DTÖ, GATT''ın halefidir; merkezi İsviçre Cenevre''dir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Petrol İhraç Eden Ülkeler Örgütü (OPEC) 1960 yılında Bağdat Konferansı''nda kurulmuştur.

OPEC''in genel merkezi aşağıdaki şehirlerden hangisindedir?',
  '{"options": ["Riyad (Suudi Arabistan)", "Bağdat (Irak)", "Viyana (Avusturya)", "Cenevre (İsviçre)", "Kuveyt Şehri"], "correctIndex": 2}'::jsonb,
  'OPEC Bağdat''ta kurulmuş ve ilk merkezi Cenevre olmuşsa da, 1965 yılından bu yana genel merkezi Avusturya''nın başkenti Viyana''dadır (Avusturya petrol üreticisi olmadığı halde tarafsız merkez seçilmiştir).',
  'OPEC petrolcülerin örgütüdür ancak merkezi bir petrol ülkesinde değil, Viyana''dadır!'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Genel Kurulu Başkanlığı görevini üstlenen ilk Türk diplomat olan ve 75. BM Genel Kurul Başkanlığı''nı yürüten isim aşağıdakilerden hangisidir?',
  '{"options": ["Volkan Bozkır", "Rauf Denktaş", "Feridun Sinirlioğlu", "Ahmet Davutoğlu", "Şükrü Saraçoğlu"], "correctIndex": 0}'::jsonb,
  'Eski AB Bakanı ve Büyükelçi Volkan Bozkır, 2020-2021 yıllarında BM 75. Genel Kurul Başkanlığı görevini yürüterek bu makama seçilen ilk Türk vatandaşı olmuştur.',
  'BM Genel Kurul Başkanı seçilen tek Türk diplomat Volkan Bozkır''dır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Mülteciler Yüksek Komiserliği (UNHCR) ve Uluslararası Çalışma Örgütü (ILO) gibi dev BM uzman kuruluşlarının genel merkezi hangi şehirde bulunmaktadır?',
  '{"options": ["New York", "Cenevre", "Paris", "Londra", "Roma"], "correctIndex": 1}'::jsonb,
  'İsviçre''nin Cenevre kenti; UNHCR (Mülteciler), ILO (Çalışma), WHO (Sağlık), WIPO (Fikri Mülkiyet) ve ITU gibi BM kuruluşlarının küresel merkezidir.',
  'Gıda/Tarım örgütleri Roma''dadır (FAO, WFP); Sağlık, Çalışma ve Mülteciler Cenevre''dedir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'G-20 (Group of Twenty) zirvesi dünya ekonomisinin yaklaşık %85''ini temsil eder.

2023 Yeni Delhi Zirvesi''nde G-20''ye Avrupa Birliği''nden sonra ikinci bölgesel blok olarak daimi üye statüsüyle kabul edilen uluslararası birlik hangisidir?',
  '{"options": ["Afrika Birliği", "Arap Ligi", "ASEAN", "Türk Devletleri Teşkilatı", "Şanghay İşbirliği Örgütü"], "correctIndex": 0}'::jsonb,
  'G-20, 2023 yılında Hindistan''ın başkenti Yeni Delhi''de yapılan zirvede 55 Afrika ülkesini temsil eden ''Afrika Birliği''ni daimi üye olarak bünyesine katmıştır.',
  'G-20''ye en son daimi üye olarak katılan blok Afrika Birliği''dir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'NATO Antlaşması''nın ''Bir müttefike yapılan silahlı saldırı, tüm müttefiklere yapılmış sayılır ve ortak savunma devreye girer'' ilkesini düzenleyen meşhur maddesi hangisidir?',
  '{"options": ["1. Madde", "4. Madde", "5. Madde", "10. Madde", "51. Madde"], "correctIndex": 2}'::jsonb,
  'NATO''nun kolektif savunma ilkesi 5. Maddede düzenlenmiştir. Tarihte sadece bir kez, 11 Eylül 2001 ABD terör saldırılarından sonra yürürlüğe konulmuştur.',
  '4. Madde tehdit anında ''istişare'' maddesidir; 5. Madde ise fiili ''ortak askeri müdahale ve savunma'' maddesidir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Gıda ve Tarım Örgütü (FAO) ile Dünya Gıda Programı''nın (WFP) genel merkezi hangi ülkede ve şehirdedir?',
  '{"options": ["İtalya — Roma", "Fransa — Paris", "İsviçre — Cenevre", "Avusturya — Viyana", "Hollanda — Amsterdam"], "correctIndex": 0}'::jsonb,
  'Tarım, açlıkla mücadele ve gıda ile ilgili BM kuruluşları (FAO, WFP, IFAD) İtalya''nın başkenti Roma''da konuşlanmıştır.',
  'Tarım ve gıda kuruluşları Roma''dadır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'OECD (Ekonomik İşbirliği ve Kalkınma Örgütü) ile ilgili olarak aşağıda verilenlerden hangisi doğrudur?',
  '{"options": ["Merkezi Cenevre''dedir.", "Türkiye bu örgüte 2000''li yıllarda üye olmuştur.", "1961 yılında kurulan örgütün kurucu üyeleri arasında Türkiye de yer almaktadır ve genel merkezi Paris''tedir.", "Yalnızca petrol üreten ülkeler üye olabilir.", "Askeri bir pakt olarak faaliyet gösterir."], "correctIndex": 2}'::jsonb,
  'OECD 1961 yılında kurulmuş gelişmiş piyasa ekonomilerini bir araya getiren bir teşkilattır. Türkiye 20 kurucu ülkeden biridir ve merkezi Paris''tedir.',
  'Türkiye OECD''nin kurucu üyesidir; merkezi Fransa Paris''tedir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa İnsan Hakları Mahkemesi''ne (AİHM) yapılacak bireysel başvurularda, iç hukuk yollarının tüketildiği nihai kararın (Türkiye için Anayasa Mahkemesi Bireysel Başvuru kararının) tebliğinden itibaren geçerli olan ''başvuru süresi'' 15 No''lu Protokol ile kaça indirilmiştir?',
  '{"options": ["1 yıl", "6 aydan 4 aya indirilmiştir", "30 gün", "3 ay", "60 gün"], "correctIndex": 1}'::jsonb,
  'AİHM''ye başvuru süresi eskiden 6 aydı. Yürürlüğe giren AİHS 15 No''lu Ek Protokol ile kesin kararın tebliğinden itibaren başvuru süresi 6 AYDAN 4 AYA indirilmiştir.',
  'Eski süre 6 aydı; güncel kural 4 AYDIR! Bu süre değişikliği güncel sınavların eleyici noktasıdır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa İnsan Hakları Mahkemesi''nde (AİHM) her üye devlet adına bir yargıç görev yapar. AİHM yargıçlarının görev süresi ve seçim usulü aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Görev süreleri 9 yıldır, yeniden seçilemezler ve Avrupa Konseyi Parlamenter Meclisi (AKPM) tarafından seçilirler.", "Görev süreleri 5 yıldır, ömür boyu kalırlar.", "Doğrudan ilgili ülkenin Cumhurbaşkanı tarafından atanırlar.", "Görev süreleri 12 yıldır ve BM Genel Kurulu seçer.", "Her 3 yılda bir kura ile belirlenirler."], "correctIndex": 0}'::jsonb,
  'AİHM yargıçları, ilgili devletin gösterdiği üç aday arasından Avrupa Konseyi Parlamenter Meclisi (AKPM) tarafından 9 YILLIK süre için seçilirler ve görev süreleri bitince yeniden seçilemezler (Yaş haddi 70''tir).',
  'AİHM yargıçlarının görev süresi 9 yıldır ve YENİDEN SEÇİLEMEZLER!'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Türk Devletleri Teşkilatı''nın (TDT) güncel kurucu ve tam üye devletleri (5 ülke) aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan", "Türkiye, Türkmenistan, Macaristan, KKTC, Tacikistan", "Türkiye, Rusya, İran, Pakistan, Afganistan", "Türkiye, Azerbaycan, Gürcistan, Ukrayna, Moldova", "Türkiye, Kazakistan, Kırgızistan, Tataristan, Başkurdistan"], "correctIndex": 0}'::jsonb,
  'TDT''nin 5 tam üyesi: Türkiye, Azerbaycan, Kazakistan, Kırgızistan ve Özbekistan''dır (Özbekistan 2019''da tam üye oldu). Macaristan, Türkmenistan ve KKTC ise gözlemci üyelerdir.',
  'Türkmenistan ve KKTC tam üye DEĞİL, GÖZLEMCİ üyedir! Tam üyeler 5 tanedir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Uluslararası Ceza Mahkemesi (UCM / ICC); soykırım, insanlığa karşı suçlar, savaş suçları ve saldırı suçlarını yargılamak üzere kurulan ilk daimi uluslararası ceza mahkemesidir.

Uluslararası Ceza Mahkemesi''nin kuruluş belgesi olan ve Türkiye''nin henüz taraf olmadığı kurucu uluslararası antlaşma hangisidir?',
  '{"options": ["Roma Statüsü", "Versay Barış Antlaşması", "Cenevre Sözleşmeleri", "Viyana Sözleşmesi", "Madrid Protokolü"], "correctIndex": 0}'::jsonb,
  'Uluslararası Ceza Mahkemesi (UCM), 1998 yılında kabul edilen ve 2002''de yürürlüğe giren ''Roma Statüsü'' ile kurulmuştur. Mahkeme Lahey''dedir. Türkiye, ABD ve Rusya Roma Statüsü''ne taraf değildir.',
  'Uluslararası Ceza Mahkemesi''nin kurucu belgesi Roma Statüsü''dür.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Birleşmiş Milletler bünyesinde nükleer enerjinin barışçıl amaçlarla kullanılmasını denetleyen, nükleer silahların yayılmasını önlemek amacıyla denetim ve teftişler yürüten ve genel merkezi Viyana''da olan uzman kuruluş hangisidir?',
  '{"options": ["IAEA (Uluslararası Atom Enerjisi Ajansı)", "NATO Nükleer Planlama Grubu", "UNIDO", "UNFPA", "OPEC"], "correctIndex": 0}'::jsonb,
  'IAEA (International Atomic Energy Agency - Uluslararası Atom Enerjisi Ajansı), 1957''de nükleer denetim için kurulmuş BM uzman kuruluşudur. Merkezi Avusturya Viyana''dadır.',
  'Nükleer denetim örgütü = IAEA; Merkezi Viyana''dır.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Birliği''nin kurumsal yapısı değerlendirildiğinde ''Avrupa Birliği Adalet Divanı'' (ABAD) ile ''Avrupa İnsan Hakları Mahkemesi'' (AİHM) arasındaki temel fark aşağıdakilerden hangisidir?',
  '{"options": ["ABAD Avrupa Birliği''nin Lüksemburg''daki yargı organı olup AB hukukunun uygulanmasını denetler; AİHM ise Avrupa Konseyi''nin Strazburg''daki mahkemesi olup İnsan Hakları Sözleşmesi ihlallerini yargılar.", "İkisi aynı mahkemedir, isimleri farklıdır.", "ABAD''a sadece ceza davaları gider, AİHM''ye sadece boşanma davaları gider.", "Türkiye ABAD üyesidir, AİHM üyesi değildir.", "ABAD''ın kararları tavsiye niteliğindedir."], "correctIndex": 0}'::jsonb,
  'ABAD (Lüksemburg), Avrupa Birliği müktesebatını ve AB üyesi devletleri denetler. Türkiye AB üyesi olmadığı için ABAD yargı yetkisine tabi değildir. AİHM (Strazburg) ise Avrupa Konseyi organıdır ve Türkiye AİHM''nin zorunlu yargı yetkisini tanımıştır.',
  'Türkiye ABAD''a tabi DEĞİLDİR; AİHM''ye TABİDİR!'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Birliği''ne üye ülkeler arasında sınır kontrollerini kaldıran ve vatandaşların vizesiz serbestçe seyahat etmesine olanak tanıyan anlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Schengen Anlaşması", "Maastricht Anlaşması", "Nice Anlaşması", "Amsterdam Anlaşması", "Dublin Sözleşmesi"], "correctIndex": 0}'::jsonb,
  '1985 yılında Lüksemburg''un Schengen kasabasında imzalanan Schengen Anlaşması, taraf ülkeler arasındaki iç sınır kontrollerini kaldırmış ve ortak bir dış sınır vize rejimi kurmuştur.',
  'Schengen serbest dolaşım alanıdır. Dublin Sözleşmesi ise sığınmacı ve mülteci iltica başvurularını düzenler.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Birliği''nin yürütme organı olan, kanun tasarılarını hazırlayan, AB bütçesini yöneten ve ''AB''nin hükümeti'' gibi işlev gören organ hangisidir?',
  '{"options": ["Avrupa Komisyonu", "Avrupa Parlamentosu", "Avrupa Birliği Konseyi", "Avrupa Zirvesi", "Sayıştay"], "correctIndex": 0}'::jsonb,
  'Avrupa Komisyonu (merkezi Brüksel), her üye devletten birer komiserin katıldığı 27 üyeli yürütme kabinesidir. AB mevzuatını teklif eden ve antlaşmaların koruyuculuğunu üstlenen tek organdır.',
  'Avrupa Parlamentosu yasama organıdır; yürütme/hükümet organı ise Avrupa Komisyonu''dur.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'I. Birleşmiş Milletler (BM)
II. Avrupa Konseyi
III. Ekonomik İşbirliği ve Kalkınma Örgütü (OECD)
IV. Kuzey Atlantik Antlaşması Örgütü (NATO)

Yukarıda verilen uluslararası kuruluşlardan hangilerinin ''kurucu üyeleri'' arasında Türkiye Cumhuriyeti yer almaktadır?',
  '{"options": ["I, II ve III", "II, III ve IV", "I ve IV", "Yalnız I", "I, II, III ve IV"], "correctIndex": 0}'::jsonb,
  'Türkiye; 1945''te BM''nin, 1949''da Avrupa Konseyi''nin, 1961''de OECD''nin kurucu üyeleri arasında yer almıştır. Ancak NATO''nun kurucusu değildir; NATO''ya 1952 yılında sonradan katılmıştır.',
  'Türkiye NATO''nun kurucusu DEĞİLDİR! 1952''de katılmıştır. BM, Avrupa Konseyi ve OECD''nin ise kurucu üyesidir.'
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Güvenlik ve İşbirliği Teşkilatı''nın (AGİT / OSCE) temelini oluşturan ve Soğuk Savaş döneminde Doğu ile Batı blokları arasında sınırların değişmezliğini ve insan haklarını kabul eden tarihi belge aşağıdakilerden hangisidir?',
  '{"options": ["1975 Helsinki Nihai Senedi", "Yalta Konferansı Bildirisi", "Potsdam Anlaşması", "Paris Şartı", "Cenevre Sözleşmesi"], "correctIndex": 0}'::jsonb,
  '1975 Helsinki Nihai Senedi ile temeli atılan Avrupa Güvenlik ve İşbirliği Konferansı (AGİK), 1994 Budapeşte Zirvesi''nde kurumsallaşarak AGİT (OSCE) adını almıştır. Merkezi Viyana''dadır.',
  'AGİT''in temeli 1975 Helsinki Nihai Senedi''dir; merkezi Avusturya Viyana''dır.'
);

-- Soru #41 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 90. maddesine göre usulüne göre yürürlüğe konulmuş milletlerarası antlaşmalar hakkında anayasaya aykırılık iddiasıyla nereye başvurulabilir?',
  '{"options": ["Anayasa Mahkemesine iptal davası açılabilir.", "Danıştay''a başvurulabilir.", "Uyuşmazlık Mahkemesine gidilebilir.", "Bunlar hakkında anayasaya aykırılık iddiası ile Anayasa Mahkemesine BAŞVURULAMAZ (yargı yolu kapalıdır).", "Sayıştay inceleme yapar."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 90/son amir hükmüdür: ''Usulüne göre yürürlüğe konulmuş milletlerarası andlaşmalar kanun hükmündedir. Bunlar hakkında Anayasaya aykırılık iddiası ile Anayasa Mahkemesine başvurulamaz.''',
  'Milletlerarası andlaşmalar kanun gücündedir ama KANUNLARDAN FARKI: Anayasa Mahkemesi''ne iptal davası AÇILAMAZ!'
);

-- Soru #42 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Anayasa''nın 90. maddesinin son fıkrasına 2004 yılında eklenen kurala göre; usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası antlaşmalarla iç hukuk kanunlarının aynı konuda farklı hükümler içermesi (çatışması) durumunda hangisi esas alınır?',
  '{"options": ["TBMM''nin çıkaracağı yeni kanun esas alınır.", "Milletlerarası antlaşma hükümleri esas alınır.", "Cumhurbaşkanlığı Kararnamesi esas alınır.", "Her iki metin de geçersiz sayılarak genel ahlaka göre hüküm verilir.", "Hakim takdir yetkisini kullanır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 90: ''Usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalarla kanunların aynı konuda farklı hükümler içermesi nedeniyle çıkabilecek uyuşmazlıklarda MİLLETLERARASI ANDLAŞMA HÜKÜMLERİ ESAS ALINIR.''',
  'Temel haklarda kanun ile andlaşma çatışırsa MİLLETLERARASI ANDLAŞMA kanundan üstündür ve esas alınır!'
);

-- Soru #43 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler''in ana yargı organı olan ve Hollanda''nın Lahey kentindeki Barış Sarayı''nda görev yapan Uluslararası Adalet Divanı''na (UAD) ilişkin aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Sadece gerçek kişilerin ceza davalarına bakar.", "Yalnızca DEVLETLER arasındaki hukuki uyuşmazlıkları karara bağlar ve BM organlarına istişari görüş bildirir.", "Yargıç sayısı 27''dir ve 3 yıllığına seçilirler.", "Kararları temyizen İsviçre Federal Mahkemesi''ne götürülebilir.", "Türkiye divanın zorunlu yargı yetkisini şartsız kabul etmiştir."], "correctIndex": 1}'::jsonb,
  'UAD (ICJ), BM''nin ana yargı organıdır. 15 yargıçtan oluşur (görev süreleri 9 yıldır). UAD önüne gerçek kişiler dava açamaz; yalnızca DEVLETLER taraf olabilir.',
  'UAD''de kişiler değil DEVLETLER yargılanır; gerçek kişilerin savaş ve soykırım suçlarını ise Uluslararası Ceza Mahkemesi (UCM) yargılar.'
);

-- Soru #44 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '3 Ekim 2009 tarihinde Türkiye, Azerbaycan, Kazakistan ve Kırgızistan tarafından imzalanan Nahçıvan Anlaşması ile kurulan ve genel sekreterliği İstanbul''da bulunan teşkilat hangisidir?',
  '{"options": ["Türk Devletleri Teşkilatı (TDT)", "Ekonomik İşbirliği Teşkilatı (EİT)", "Karadeniz Ekonomik İşbirliği (KEİ)", "D-8 Teşkilatı", "TÜRKSOY"], "correctIndex": 0}'::jsonb,
  'TDT (eski adıyla Türk Keneşi / Türk Konseyi), 3 Ekim 2009 Nahçıvan Anlaşması ile kurulmuştur ve merkezi İSTANBUL''dadır. Bu nedenle 3 Ekim günü ''Türk Dünyası İşbirliği Günü'' olarak kutlanır.',
  'TÜRKSOY''un merkezi Ankara''dadır; Türk Devletleri Teşkilatı''nın (TDT) genel sekreterliği ise İSTANBUL''dadır.'
);

-- Soru #45 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1992 yılında İstanbul Zirvesi Bildirisi ile Türkiye''nin öncülüğünde kurulan ve daimi genel sekreterliği İstanbul Boğazı kıyısında yer alan bölgesel ekonomik kuruluş hangisidir?',
  '{"options": ["Karadeniz Ekonomik İşbirliği Teşkilatı (KEİ)", "Akdeniz İçin Birlik", "Avrupa Serbest Ticaret Birliği (EFTA)", "D-8 Teşkilatı", "Orta Avrupa Girişimi"], "correctIndex": 0}'::jsonb,
  'Karadeniz havzasındaki barış ve ekonomik entegrasyonu hedefleyen KEİ (BSEC), 1992 İstanbul Zirvesi ile kurulmuş ve daimi sekretaryası İSTANBUL''dadır.',
  'KEİ''nin kurucusu ve ev sahibi Türkiye''dir; merkezi İSTANBUL''dadır.'
);

-- Soru #46 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Türkiye, İran ve Pakistan tarafından 1985 yılında kurulan ve daha sonra Orta Asya Türk cumhuriyetleri ile Afganistan ve Azerbaycan''ın katıldığı, genel merkezi TAHRAN''da bulunan ekonomik örgüt hangisidir?',
  '{"options": ["Ekonomik İşbirliği Teşkilatı (EİT / ECO)", "D-8 Teşkilatı", "Arap Birliği", "Şanghay İşbirliği Örgütü", "Körfez İşbirliği Konseyi"], "correctIndex": 0}'::jsonb,
  '1985''te kurulan Ekonomik İşbirliği Teşkilatı''nın (EİT) genel sekreterliği İran''ın başkenti TAHRAN''dadır. 10 üyesi vardır.',
  'D-8 İstanbul''dadır; EİT (ECO) ise TAHRAN''dadır.'
);

-- Soru #47 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1995 yılında GATT''ın yerine kurulan, küresel ticaretin kurallarını belirleyen ve ticaret anlaşmazlıklarını çözen Dünya Ticaret Örgütü''nün (DTÖ / WTO) genel merkezi hangi şehirdedir?',
  '{"options": ["Cenevre (İsviçre)", "Brüksel (Belçika)", "New York (ABD)", "Viyana (Avusturya)", "Londra (İngiltere)"], "correctIndex": 0}'::jsonb,
  'Dünya Ticaret Örgütü (WTO), 1 Ocak 1995''te faaliyete geçmiş olup genel merkezi İsviçre''nin CENEVRE kentindedir.',
  'DTÖ (WTO) merkezi CENEVRE''dedir. Dünya Bankası ve IMF ise Washington''dadır.'
);

-- Soru #48 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1949 yılında kurulan, Türkiye''nin kurucu üyesi olduğu, genel merkezi Fransa''nın Strazburg kentinde yer alan ve 2022''de Rusya''nın üyelikten çıkarıldığı insan hakları kuruluşu hangisidir?',
  '{"options": ["Avrupa Konseyi", "Avrupa Birliği", "Avrupa Güvenlik ve İşbirliği Teşkilatı (AGİT)", "Kuzey Atlantik İttifakı (NATO)", "Batı Avrupa Birliği"], "correctIndex": 0}'::jsonb,
  'Avrupa Konseyi (Council of Europe - Strazburg), AİHM''nin de bağlı olduğu örgüttür. Rusya''nın ihracından sonra üye sayısı 46''dır. Türkiye kurucu üyesidir.',
  'Avrupa Konseyi ile Avrupa Birliği ayrı örgütlerdir! Türkiye AB üyesi değildir ama AVRUPA KONSEYİ''NİN KURUCUSUDUR.'
);

-- Soru #49 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Şanghay İşbirliği Örgütü''nün (ŞİÖ) kurumsal yapısı ve Türkiye''nin bu örgütle olan hukuki ilişkisi hakkında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Türkiye ŞİÖ''nün tam üyesidir.", "Türkiye ŞİÖ''de ''Gözlemci Üye'' statüsündedir.", "Türkiye ŞİÖ''de 2012 yılından bu yana ''DİYALOG ORTAĞI'' statüsündedir.", "Türkiye''nin ŞİÖ ile hiçbir resmi bağı yoktur.", "ŞİÖ genel sekreterliği Moskova''dadır."], "correctIndex": 2}'::jsonb,
  'Türkiye Şanghay İşbirliği Örgütü''ne tam üye veya gözlemci üye DEĞİLDİR; 2012 Pekin Zirvesi''nde onaylanan kararla ''DİYALOG ORTAĞI'' (Dialogue Partner) statüsündedir.',
  'ÖSYM''nin favori sorusudur: Türkiye ŞİÖ''de tam üye veya gözlemci DEĞİL, ''DİYALOG ORTAĞI''dır!'
);

-- Soru #50 (Zorluk: 2)
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
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Arap dünyasında dayanışmayı sağlamak amacıyla 1945 yılında kurulan ve 22 Arap ülkesinin üye olduğu Arap Devletleri Ligi''nin (Arap Birliği) genel merkezi hangi başkenttedir?',
  '{"options": ["Kahire (Mısır)", "Riyad (Suudi Arabistan)", "Doha (Katar)", "Bağdat (Irak)", "Amman (Ürdün)"], "correctIndex": 0}'::jsonb,
  'Arap Birliği''nin genel merkezi Mısır''ın başkenti KAHİRE''dedir.',
  'İslam İşbirliği Teşkilatı CIDDE''dedir; Arap Birliği ise KAHİRE''dedir.'
);

COMMIT;
