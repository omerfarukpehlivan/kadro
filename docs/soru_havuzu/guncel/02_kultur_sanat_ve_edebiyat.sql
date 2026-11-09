-- =============================================================
-- KPSS GÜNCEL BİLGİLER — KONU 2: KÜLTÜR, SANAT VE EDEBIYAT
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı + order_index
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '2024 Nobel Edebiyat Ödülü''ne ''tarihsel travmalarla yüzleşen ve insan hayatının kırılganlığını ortaya koyan yoğun lirik düzyazısı'' gerekçesiyle layık görülen, ''Vejetaryen'' adlı romanıyla tanınan Güney Koreli yazar aşağıdakilerden hangisidir?',
  '{"options": ["Han Kang", "Haruki Murakami", "Jon Fosse", "Annie Ernaux", "Mo Yan"], "correctIndex": 0}'::jsonb,
  'İsveç Akademisi 2024 Nobel Edebiyat Ödülü''nü Güney Koreli kadın yazar HAN KANG''a vermiştir. Han Kang, bu ödülü kazanan ilk Güney Koreli ve ilk Asyalı kadın yazar olmuştur.',
  'Jon Fosse 2023 Nobel Edebiyat Ödülü sahibidir; 2024 yılı kazananı ise Han Kang''dır.',
  1
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Uluslararası Türk Kültürü Teşkilatı (TÜRKSOY) tarafından ''2024 Türk Dünyası Kültür Başkenti'' ilan edilen ve Mahtumkulu Firaki yılı kutlamalarına ev sahipliği yapan Anev kenti hangi Türk cumhuriyetindedir?',
  '{"options": ["Türkmenistan", "Azerbaycan", "Özbekistan", "Kazakistan", "Kırgızistan"], "correctIndex": 0}'::jsonb,
  'TÜRKSOY Kültür Bakanları Daimi Konseyi, 2024 Türk Dünyası Kültür Başkenti olarak TÜRKMENİSTAN''ın tarihi ANEV şehrini seçmiştir.',
  '2023 Şuşa (Azerbaycan); 2024 Anev (Türkmenistan); 2025 ise Aktau (Kazakistan) olmuştur.',
  2
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'TÜRKSOY tarafından ''2025 Türk Dünyası Kültür Başkenti'' olarak ilan edilen Hazar Denizi kıyısındaki liman kenti Aktau hangi ülkededir?',
  '{"options": ["Kazakistan", "Özbekistan", "Azerbaycan", "Türkmenistan", "Kırgızistan"], "correctIndex": 0}'::jsonb,
  'TÜRKSOY 2025 yılı için Türk Dünyası Kültür Başkenti unvanını KAZAKİSTAN''ın Mangıstau eyaletinde yer alan AKTAU kentine vermiştir.',
  '2024 Anev (Türkmenistan), 2025 Aktau (Kazakistan). Bu iki başkent ÖSYM''nin peş peşe soracağı güncel kültür ikilisidir.',
  3
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '96. Akademi Ödülleri''nde (Oscar 2024) En İyi Film, En İyi Yönetmen (Christopher Nolan) ve En İyi Erkek Oyuncu (Cillian Murphy) dahil olmak üzere 7 dalda ödül kazanan biyografik yapım hangisidir?',
  '{"options": ["Oppenheimer", "Barbie", "Poor Things (Zavallılar)", "Killers of the Flower Moon", "The Zone of Interest"], "correctIndex": 0}'::jsonb,
  '2024 Mart ayında düzenlenen 96. Oscar Töreni''nde atom bombasının babası J. Robert Oppenheimer''ın hayatını anlatan ''OPPENHEIMER'' filmi 7 heykelcikle geceye damga vurmuştur.',
  'Barbie gişede yarışsa da Oscar''ı silip süpüren film Oppenheimer''dır.',
  4
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '2024 Nobel Barış Ödülü; ''nükleer silahlardan arındırılmış bir dünya için yürüttüğü çabalar ve nükleer silahların bir daha asla kullanılmaması gerektiğine dair tanıklıkları'' nedeniyle hangi kuruluşa verilmiştir?',
  '{"options": ["Nihon Hidankyo (Japonya)", "Uluslararası Kızılhaç Komitesi", "Dünya Gıda Programı (WFP)", "Nergis Muhammedi", "Uluslararası Af Örgütü"], "correctIndex": 0}'::jsonb,
  'Norveç Nobel Komitesi, 2024 Barış Ödülü''nü 1945 Hiroşima ve Nagazaki atom bombası mağdurlarının (Hibakuşa) kurduğu Japon taban hareketi NİHON HİDANKYO''ya vermiştir.',
  'Nergis Muhammedi 2023 Barış Ödülü''nü almıştır; 2024 yılı kazananı Japon barış hareketi Nihon Hidankyo''dur.',
  5
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Batı dünyasında ''Avicenna'' adıyla bilinen, tıp dünyasının temel başvuru kaynağı olan ''El-Kanun fi''t-Tıbb'' (Tıbbın Kanunu) ve felsefe-bilim ansiklopedisi ''Kitabü''ş-Şifa'' eserlerinin yazarı İslam bilgini kimdir?',
  '{"options": ["İbn-i Sina", "Farabi", "İbn-i Rüşd", "Harezmi", "Biruni"], "correctIndex": 0}'::jsonb,
  'Avrupa üniversitelerinde yüzyıllarca okutulan El-Kanun fi''t-Tıbb''ın ve Kitabü''ş-Şifa''nın müellifi, Batı''da ''Avicenna'' olarak anılan büyük hekim ve filozof İBN-İ SİNA''dır.',
  'Avicenna = İbn-i Sina; Averroes = İbn-i Rüşd; Alpharabius = Farabi''dir. ÖSYM bu Latince lakapları her yıl dönüşümlü sorar.',
  6
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Felsefede Aristo''dan sonra ''Muallim-i Sani'' (İkinci Öğretmen) unvanıyla tanınan ve ideal bir toplum düzenini anlattığı ''El-Medinetü''l-Fazıla'' (Erdemli Şehir) eseriyle bilinen Türk-İslam düşünürü kimdir?',
  '{"options": ["Farabi", "İbn-i Sina", "Gazali", "İbn-i Haldun", "Nizamülmülk"], "correctIndex": 0}'::jsonb,
  'Aristo ''Muallim-i Evvel'' (Birinci Öğretmen), FARABİ ise ''Muallim-i Sani'' (İkinci Öğretmen) olarak anılır. En meşhur eseri ''El-Medinetü''l-Fazıla''dır (Erdemli Şehir).',
  'Muallim-i Sani unvanı sadece FARABİ''ye aittir. İbn-i Sina ile karıştırılmamalıdır.',
  7
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Tarih felsefesinin ve modern sosyolojinin kurucusu kabul edilen, 7 ciltlik ''Kitabü''l-İber'' adlı dünya tarihinin giriş kısmı olarak kaleme aldığı meşhur eseri ''Mukaddime'' olan düşünür kimdir?',
  '{"options": ["İbn-i Haldun", "İbn-i Sina", "Farabi", "Biruni", "Evliya Çelebi"], "correctIndex": 0}'::jsonb,
  '''Coğrafya kaderdir'' sözüyle özdeşleştirilen ve devletlerin insanlar gibi doğup, büyüyüp, yaşlanıp öleceğini savunduğu eseri ''Mukaddime'' olan 14. yüzyıl Tunuslu düşünürü İBN-İ HALDUN''dur.',
  'Mukaddime ve Asabiyyet teorisi doğrudan İBN-İ HALDUN''a aittir.',
  8
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Fatih Sultan Mehmet döneminde İstanbul''a gelerek Ayasofya Medresesi''nin ilk müderrisi olan, matematik ve astronomi alanındaki ''Fethiye'' adlı eseriyle bilinen Semerkantlı bilgin kimdir?',
  '{"options": ["Ali Kuşçu", "Uluğ Bey", "Kadızade-i Rumi", "Takiyüddin", "Mirim Çelebi"], "correctIndex": 0}'::jsonb,
  'Uluğ Bey''in öğrencisi olan ALİ KUŞÇU, Fatih''in davetiyle İstanbul''a gelmiş, Ayasofya Başmüderrisi olmuş ve Otlukbeli Zaferi''ne ithafen ''Fethiye'' adlı astronomi eserini Fatih''e sunmuştur.',
  'Uluğ Bey Semerkant''ta hükümdar ve rasathane kurucusudur; Fatih devrinde İstanbul''a gelip Ayasofya''da ders veren ise ALİ KUŞÇU''dur.',
  9
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '2024 yılı Ekim ayında düzenlenen 61. Antalya Altın Portakal Film Festivali''nde ''En İyi Film Ödülü''nü kazanan sinema filmi aşağıdakilerden hangisidir?',
  '{"options": ["Mukadderat", "Kuru Otlar Üstüne", "Balık Kraker", "Döngü", "Evcilik"], "correctIndex": 0}'::jsonb,
  '61. Antalya Altın Portakal Film Festivali''nde En İyi Film Ödülü''nü Nadim Güç''ün yönettiği ve başrolünde Nur Sürer''in oynadığı ''MUKADDERAT'' filmi kazanmıştır.',
  'Kuru Otlar Üstüne Nuri Bilge Ceylan''ın bir önceki festival filmidir; 61. Altın Portakal''ın En İyi Filmi ''Mukadderat''tır.',
  10
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  '2024 yılında 77. Cannes Film Festivali''nde jüri başkanlığını Greta Gerwig''in yaptığı yarışmada festivalin en büyük ödülü olan ''Altın Palmiye''yi (Palme d''Or) kazanan film hangisidir?',
  '{"options": ["Anora (Yönetmen: Sean Baker)", "All We Imagine as Light", "The Seed of the Sacred Fig", "Emilia Perez", "Anatomy of a Fall"], "correctIndex": 0}'::jsonb,
  '2024 Cannes Film Festivali''nde Altın Palmiye ödülü ABD''li yönetmen Sean Baker''ın yönettiği ''ANORA'' filmine verilmiştir.',
  'Anatomy of a Fall 2023 Altın Palmiye kazananıydı; 2024 yılı kazananı ''Anora''dır.',
  11
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Nuri Bilge Ceylan''ın ''Kuru Otlar Üstüne'' filmindeki ''Nuray'' rolüyle 2023 Cannes Film Festivali''nde ''En İyi Kadın Oyuncu'' ödülünü alarak Türkiye sinema tarihinde bu ödülü kazanan ilk kadın oyuncu kimdir?',
  '{"options": ["Merve Dizdar", "Nur Sürer", "Bihter Dinçel", "Demet Evgar", "Songül Öden"], "correctIndex": 0}'::jsonb,
  'MERVE DİZDAR, 76. Cannes Film Festivali''nde En İyi Kadın Oyuncu ödülünü kazanarak Türk sinemasında bir ilki başarmıştır.',
  'Türkiye''de daha önce Muzaffer Özdemir ve Mehmet Emin Toprak (Uzak filmiyle) En İyi Erkek Oyuncu ödülü almıştı; kadın oyuncu olarak ilk kazanan ise Merve Dizdar''dır.',
  12
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Avrupa Birliği tarafından ''2025 Avrupa Kültür Başkenti'' unvanı verilen iki Avrupa kenti hangi seçenekte doğru eşleştirilmiştir?',
  '{"options": ["Chemnitz (Almanya) — Nova Gorica (Slovenya)", "Bad Ischl (Avusturya) — Bodø (Norveç)", "Tartu (Estonya) — Veszprem (Macaristan)", "Oulu (Finlandiya) — Trenčín (Slovakya)", "Elefsina (Yunanistan) — Timisoara (Romanya)"], "correctIndex": 0}'::jsonb,
  '2024 yılı başkentleri Bad Ischl, Bodø ve Tartu idi. 2025 yılı Avrupa Kültür Başkentleri ise Almanya''nın CHEMNITZ ve Slovenya''nın NOVA GORICA kentleridir.',
  'Bad Ischl ve Bodø 2024 yılındaydı; 2025 başkentleri Chemnitz ve Nova Gorica''dır.',
  13
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Edebiyatta ''İnce Memed'', ''Yer Demir Gök Bakır'' ve ''Yaşar Ne Yaşar Ne Yaşamaz'' gibi başyapıtlarıyla tanınan, Türkiye''den Nobel Edebiyat Ödülü''ne ilk aday gösterilen büyük yazar kimdir?',
  '{"options": ["Yaşar Kemal", "Orhan Pamuk", "Ahmet Hamdi Tanpınar", "Sabahattin Ali", "Kemal Tahir"], "correctIndex": 0}'::jsonb,
  'Çukurova''yı ve Torosları destansı bir dille anlatan YAŞAR KEMAL, 1973''te Nobel Edebiyat Ödülü''ne Türkiye''den aday gösterilen ilk edebiyatçımızdır. (Nobel''i kazanan ilk ve tek yazarımız ise 2006''da Orhan Pamuk''tur).',
  'Ödülü ilk KAZANAN Orhan Pamuk''tur; Nobel''e ilk ADAY GÖSTERİLEN ise Yaşar Kemal''dir.',
  14
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Kurtuluş Savaşı yıllarını ilk elden anlatan, edebiyatımızda Kurtuluş Savaşı''nı işleyen ilk roman olan ''Ateşten Gömlek'' ve ''Vurun Kahpeye'' romanlarının yazarı kadın edebiyatçımız kimdir?',
  '{"options": ["Halide Edip Adıvar", "Fatma Aliye Hanım", "Şukufe Nihal", "Nezihe Muhiddin", "Samiha Ayverdi"], "correctIndex": 0}'::jsonb,
  'Milli Mücadele''de bizzat onbaşı ve üstçavuş rütbeleriyle görev yapan ve Sultanahmet Mitingi''ndeki tarihi konuşmasıyla bilinen HALİDE EDİP ADIVAR, ilk Kurtuluş Savaşı romanı ''Ateşten Gömlek''in yazarıdır.',
  'Fatma Aliye ilk kadın romancımızdır (50 TL banknotu üzerindedir); Ateşten Gömlek''in yazarı ise Halide Edip Adıvar''dır.',
  15
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Selçuklu ve Osmanlı tıp tarihinde akıl ve ruh hastalıklarının su sesi ve Türk musikisi makamlarıyla tedavi edildiği, 2004 yılında Avrupa Konseyi Müze Ödülü''nü alan tarihi şifahane nerededir?',
  '{"options": ["Edirne II. Bayezid Külliyesi Sağlık Müzesi", "Kayseri Gevher Nesibe Medresesi", "Sivas Divriği Şifahanesi", "Amasya Darüşşifası", "Bursa Yıldırım Darüşşifası"], "correctIndex": 0}'::jsonb,
  'Su sesi, musiki makamları ve güzel kokularla tedavi uygulayan ünlü şifahane EDİRNE II. BAYEZİD KÜLLİYESİ''dir (bugün Trakya Üniversitesi Sağlık Müzesi olarak hizmet vermektedir).',
  'Gevher Nesibe dünyadaki ilk tıp fakültesidir (Kayseri); Müzikle tedavi denince akla EDİRNE II. Bayezid Külliyesi gelir.',
  16
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Dünyanın bilinen ilk tıp fakültesi ve şifahanesi kabul edilen, 13. yüzyılda Anadolu Selçuklu Hükümdarı I. Gıyaseddin Keyhüsrev tarafından kız kardeşi adına Kayseri''de yaptırılan tarihi yapı hangisidir?',
  '{"options": ["Gevher Nesibe Medresesi ve Şifahanesi", "Melikgazi Türbesi", "Hunat Hatun Külliyesi", "Karatay Medresesi", "Çifte Minareli Medrese"], "correctIndex": 0}'::jsonb,
  'Kayseri''deki GEVHER NESİBE ŞİFAHANESİ VE MEDRESESİ, hem hasta tedavi edilen hem de hekim yetiştirilen dünyadaki ilk tıp okulu (fakültesi) niteliğindedir.',
  'Hunat Hatun da Kayseri''dedir ancak ilk tıp fakültesi ve müzesi Gevher Nesibe''dir.',
  17
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Gaziantep''te Fırat Nehri kıyısında yer alan antik kentten çıkarılan ve ''Çingene Kızı'' mozaiğiyle dünyaca ün kazanan dünyanın en büyük mozaik müzesi hangisidir?',
  '{"options": ["Zeugma Mozaik Müzesi", "Hatay Arkeoloji Müzesi", "Haleplibahçe Mozaik Müzesi (Şanlıurfa)", "Efes Müzesi", "Hierapolis Arkeoloji Müzesi"], "correctIndex": 0}'::jsonb,
  'Gaziantep''teki ZEUGMA MOZAİK MÜZESİ, kapalı alan ve mozaik büyüklüğü bakımından dünyanın en büyük mozaik müzeleri arasında yer alır ve simgesi ''Çingene Kızı'' mozaiğidir.',
  'Hatay ve Şanlıurfa''da da büyük mozaik müzeleri vardır ancak ''Çingene Kızı'' ve Zeugma doğrudan GAZİANTEP''tedir.',
  18
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Dünya mimarlık tarihinde merkezi ısıtma (kalorifer) sisteminin ve kanalizasyon altyapısının saray içinde kurulduğu ilk mimari yapı olarak bilinen Doğu Anadolu''daki şaheser hangisidir?',
  '{"options": ["Ağrı Doğubayazıt İshak Paşa Sarayı", "Kars Ani Kalesi", "Van Kalesi ve Sarayı", "Diyarbakır İçkale Sarayı", "Erzurum Paşa Sarayı"], "correctIndex": 0}'::jsonb,
  'Ağrı''nın Doğubayazıt ilçesinde bulunan İSHAK PAŞA SARAYI, duvarların içine döşenen sıcak su boruları ile ısıtılan dünyadaki İLK KALORİFERLİ SARAYDIR.',
  'Topkapı veya Dolmabahçe değil, dünyada kalorifer tesisatının ilk kullanıldığı saray Ağrı Doğubayazıt''taki İSHAK PAŞA SARAYI''dır.',
  19
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ilk modern Türk tiyatrosunu (Güllü Agop Tiyatrosu / Osmanlı Tiyatrosu) kuran ve ilk yerli tiyatro eseri olan Şinasi''nin ''Şair Evlenmesi''ni sahneleyen tiyatro öncüsü kimdir?',
  '{"options": ["Güllü Agop (Agop Vartovyan)", "Muhsin Ertuğrul", "İsmail Dümbüllü", "Afife Jale", "Haldun Taner"], "correctIndex": 0}'::jsonb,
  'Gediktepe''de ilk düzenli Türkçe tiyatro oyunlarını sahneleyen ve Şinasi''nin Şair Evlenmesi piyesini oynayan tiyatro kurucusu GÜLLÜ AGOP''tur.',
  'Şair Evlenmesi''ni YAZAN Şinasi''dir; sahneleyen ve tiyatro topluluğunu kuran ise GÜLLÜ AGOP''tur.',
  20
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türk sinema ve tiyatrosunda sahneye çıkan İLK MÜSLÜMAN TÜRK KADIN OYUNCU kimdir?',
  '{"options": ["Afife Jale", "Bedia Muvahhit", "Cahide Sonku", "Neyyire Neyir", "Türkan Şoray"], "correctIndex": 0}'::jsonb,
  '1920 yılında ''Tatlı Sır'' oyununda Emel rolüyle sahneye çıkan AFİFE JALE, tiyatro sahnesine adım atan ilk Müslüman Türk kadınıdır. (Bedia Muvahhit ise ilk sinema oyuncularımızdandır).',
  'Tiyatro sahnesine ilk çıkan = AFİFE JALE; Sinemada ilk rol alan kadın oyuncu = Bedia Muvahhit''tir.',
  21
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türk sinema tarihinin İLK KADIN FİLM YÖNETMENİ ve ilk kadın yapımcısı olan sinemacı kimdir?',
  '{"options": ["Cahide Sonku", "Türkan Şoray", "Bilge Olgaç", "Fatma Girik", "Lütfi Akad"], "correctIndex": 0}'::jsonb,
  '''Fedakar Ana'' (1949) filmiyle yönetmenlik koltuğuna oturan ve Sonku Film''i kuran CAHİDE SONKU, Türk sinemasının ilk kadın yönetmenidir.',
  'Türkan Şoray ve Bilge Olgaç da önemli kadın yönetmenlerdir ancak ''ilk kadın yönetmen'' unvanı CAHİDE SONKU''ya aittir.',
  22
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Cumhuriyet tarihinin 50 TL banknotunun arka yüzünde portresi yer alan, ilk Türk kadın felsefeci ve romancısı kabul edilen edebiyatçımız kimdir?',
  '{"options": ["Fatma Aliye Hanım", "Halide Edip Adıvar", "Afife Jale", "Sabiha Gökçen", "Suat Derviş"], "correctIndex": 0}'::jsonb,
  'Ahmet Cevdet Paşa''nın kızı olan FATMA ALİYE HANIM, ''Muhadarat'' romanının yazarı, ilk Türk kadın romancısıdır ve 50 TL banknotu arkasında yer alır.',
  '5 TL: Aydın Sayılı; 10 TL: Cahit Arf; 20 TL: Mimar Kemaleddin; 50 TL: FATMA ALİYE HANIM; 100 TL: Itri; 200 TL: Yunus Emre.',
  23
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türk Klasik Musikisi''nin kurucusu sayılan, ''Segâh Tekbiri'' ve ''Salat-ı Ümmiye'' besteleriyle bilinen ve 100 TL''lik banknotun arka yüzünde portresi bulunan bestekâr kimdir?',
  '{"options": ["Buhurizade Mustafa Itri", "Dede Efendi", "Hacı Arif Bey", "Tamburi Cemil Bey", "Sadettin Kaynak"], "correctIndex": 0}'::jsonb,
  '100 TL''lik banknotun arka yüzünde portresi bulunan ve Segah Tekbiri bestekarı olan klasik musiki dehası BUHURİZADE MUSTAFA ITRİ''dir.',
  'Dede Efendi 19. yüzyıldır; Segah Tekbiri''nin bestecisi ve 100 TL üzerindeki isim ITRİ''dir.',
  24
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  '200 TL''lik banknotun arka yüzünde ''Sevelim sevilelim'' dizesiyle portresi yer alan, ''Risaletü''n-Nushiyye'' mesnevisiyle bilinen büyük mutasavvıf kimdir?',
  '{"options": ["Yunus Emre", "Mevlana Celaleddin-i Rumi", "Hacı Bektaş-ı Veli", "Ahi Evran", "Şeyh Edebali"], "correctIndex": 0}'::jsonb,
  '200 TL''lik en büyük banknotumuzun arkasında ''Sevelim sevilelim'' felsefesiyle tasavvuf şairimiz YUNUS EMRE yer alır.',
  'Mevlana ile Yunus Emre banknot konusunda karıştırılmamalıdır; banknotta YUNUS EMRE yer alır.',
  25
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  '20 TL''lik banknotun arka yüzünde portresi yer alan, ''Birinci Ulusal Mimarlık Akımı''nın öncülerinden olan ve Gazi Eğitim Enstitüsü binasının mimarı kimdir?',
  '{"options": ["Mimar Kemaleddin", "Vedat Tek", "Mimar Sinan", "Sedad Hakkı Eldem", "Seyfi Arkan"], "correctIndex": 0}'::jsonb,
  '20 TL banknotunun arkasında Birinci Ulusal Mimarlık akımının lideri MİMAR KEMALEDDİN yer almaktadır.',
  'Vedat Tek de Birinci Ulusal Mimarlık akımı mimarıdır (TBMM 2. bina); ancak banknotta resmi olan MİMAR KEMALEDDİN''dir.',
  26
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'UNESCO tarafından Somut Olmayan Kültürel Miras Temsili Listesi''ne Türkiye adına kaydedilen ve her yıl Edirne''de 650 yılı aşkın süredir düzenlenen ata sporu geleneği hangisidir?',
  '{"options": ["Kırkpınar Yağlı Güreş Festivali", "Geleneksel Türk Okçuluğu", "Atlı Cirit Oyunu", "Aba Güreşi", "Şalvar Güreşi"], "correctIndex": 0}'::jsonb,
  'Edirne Sarayiçi''nde her yaz düzenlenen TARİHİ KIRKPINAR YAĞLI GÜREŞLERİ, UNESCO Somut Olmayan Kültürel Miras Temsili Listesi''nde tescillidir.',
  'Cirit de geleneksel spordur ancak UNESCO tescilli en eski ata sporu festivalimiz KIRKPINAR''dır.',
  27
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türkiye''nin ilk kadın heykeltıraşı unvanına sahip olan ve Atatürk heykelleriyle tanınan sanatçı kimdir?',
  '{"options": ["Sabiha Bengütaş", "Füreya Koral", "Aliye Berger", "Mihri Müşfik Hanım", "Hale Asaf"], "correctIndex": 0}'::jsonb,
  'Sanayi-i Nefise Mektebi''nin heykel bölümünden mezun olan ve İtalya''da eğitim alan SABİHA BENGÜTAŞ, Türkiye''nin ilk kadın heykeltıraşıdır.',
  'Füreya Koral ilk kadın seramik sanatçımızdır; ilk kadın heykeltıraş ise SABİHA BENGÜTAŞ''tır.',
  28
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türkiye''nin İLK KADIN SERAMİK SANATÇISI olan, Koret Seramik Atölyesi''ni kuran ve eserleri binaların duvar panolarında yer alan usta isim kimdir?',
  '{"options": ["Füreya Koral", "Sabiha Bengütaş", "Aliye Berger", "Fahrelnissa Zeid", "Tomris Uyar"], "correctIndex": 0}'::jsonb,
  'Şakir Paşa ailesine mensup olan ve modern Türk seramik sanatının öncüsü kabul edilen sanatçı FÜREYA KORAL''dır.',
  'İlk kadın ressam Mihri Müşfik, ilk gravür sanatçısı Aliye Berger, ilk seramik sanatçısı FÜREYA KORAL''dır.',
  29
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Edebiyatımızda ''Yedi Meşaleciler'' topluluğunun kurucuları arasında yer alan, ''Geçtiğim Yol'' şiir kitabı ve edebi araştırmalarıyla tanınan akademisyen kimdir?',
  '{"options": ["Ali Canip Yöntem", "Cevdet Kudret", "Vasfi Mahir Kocatürk", "Ziya Osman Saba", "Sabri Esat Siyavuşgil"], "correctIndex": 0}'::jsonb,
  '''Geçtiğim Yol'' adlı meşhur eserin sahibi Milli Edebiyat akımının ve Genç Kalemler dergisinin kurucusu ALİ CANİP YÖNTEM''dir.',
  'Ali Canip Yöntem Milli Edebiyat kurucularındandır; Ziya Osman Saba ise Yedi Meşaleciler''in şiire en sadık ismidir.',
  30
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '2024 yılında Venedik Uluslararası Film Festivali''nde en büyük ödül olan ''Altın Aslan''ı kazanan ''The Room Next Door'' (Yandaki Oda) filminin ünlü İspanyol yönetmeni kimdir?',
  '{"options": ["Pedro Almodóvar", "Alejandro Gonzalez Inarritu", "Guillermo del Toro", "Alfonso Cuaron", "Paolo Sorrentino"], "correctIndex": 0}'::jsonb,
  '81. Venedik Film Festivali''nde büyük ödül Altın Aslan''ı ilk kez İngilizce bir film çeken usta İspanyol yönetmen PEDRO ALMODÓVAR kazanmıştır.',
  'ÖSYM Venedik ve Cannes festivallerinin Altın Aslan ve Altın Palmiye yönetmenlerini doğrudan sorar. 2024 Venedik galibi Pedro Almodóvar''dır.',
  31
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'UNESCO tarafından 2023 yılı için vefatının 50. yıl dönümünde anma ve kutlama programına alınan büyük halk ozanımız kimdir?',
  '{"options": ["Aşık Veysel", "Neşet Ertaş", "Aşık Mahzuni Şerif", "Karacaoğlan", "Dadaloğlu"], "correctIndex": 0}'::jsonb,
  'UNESCO, vefatının 50. yıl dönümü münasebetiyle 2023 yılını ''AŞIK VEYSEL YILI'' olarak ilan etmiş ve tüm dünyada anma etkinlikleri düzenlenmiştir.',
  '2021 Yunus Emre, Ahi Evran ve Hacı Bektaş yılı idi; 2023 yılı ise UNESCO tarafından AŞIK VEYSEL yılı ilan edilmiştir.',
  32
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '11. yüzyılda Kaşgarlı Mahmud tarafından Abbasi Halifesi El-Muktedi Billah''a sunulan, Araplara Türkçe öğretmeyi amaçlayan ilk Türkçe sözlük ve ilk Türk dünyası haritasını içeren eser hangisidir?',
  '{"options": ["Divanu Lugati''t-Türk", "Kutadgu Bilig", "Atabetü''l-Hakayık", "Divan-ı Hikmet", "Muhakemetü''l-Lugateyn"], "correctIndex": 0}'::jsonb,
  'İlk Türkçe sözlük, ansiklopedi ve harita içeren eser KAŞGARLI MAHMUD''un kaleme aldığı DİVANU LUGATİ''T-TÜRK''tür.',
  'Muhakemetü''l-Lugateyn Ali Şir Nevai''nin Farsça ile Türkçeyi kıyasladığı eseridir; ilk sözlük ve harita ise Kaşgarlı Mahmud''un Divanu Lugati''t-Türk''üdür.',
  33
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Yusuf Has Hacib tarafından Karahanlı Hükümdarı Tabgaç Buğra Han''a sunulan, Türk-İslam edebiyatının İLK SİYASETNAMESİ ve ilk mesnevisi kabul edilen başyapıt hangisidir?',
  '{"options": ["Kutadgu Bilig (Mutluluk Veren Bilgi)", "Divanu Lugati''t-Türk", "Siyasetname (Nizamülmülk)", "Risaletü''n-Nushiyye", "Kabusname"], "correctIndex": 0}'::jsonb,
  'YUSUF HAS HACİB''in 1069''da yazdığı KUTADGU BİLİG (Mutluluk Veren Bilgi); ilk Türkçe siyasetname, ilk aruz ölçüsü ve ilk mesnevi örneğimizdir.',
  'Nizamülmülk''ün Siyasetname''si Farsçadır; Türk-İslam edebiyatının İLK siyasetnamesi ise Karahanlılar dönemindeki KUTADGU BİLİG''dir.',
  34
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '2024 yılında 96. Oscar Ödülleri''nde ''En İyi Uluslararası Film'' ödülünü kazanan, Auschwitz toplama kampının komutanı Rudolf Höss''ün aile yaşamını konu alan sarsıcı film hangisidir?',
  '{"options": ["The Zone of Interest (İlgi Alanı)", "Society of the Snow (Kar Kardeşliği)", "Perfect Days", "Io Capitano", "The Teachers'' Lounge"], "correctIndex": 0}'::jsonb,
  'Jonathan Glazer''ın yönettiği ve En İyi Uluslararası Film Oscar''ını kazanan İngiltere yapımı başyapıt ''THE ZONE OF INTEREST''tir.',
  'Oppenheimer ''En İyi Film'' (ana kategori) kazandı; ''En İyi Uluslararası Film'' ödülünü ise The Zone of Interest kazandı.',
  35
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Osmanlı döneminde saray ressamı olan, ''Kaplumbağa Terbiyecisi'' ve ''Silah Tacirleri'' tablolarıyla tanınan, aynı zamanda Sanayi-i Nefise Mektebi''nin ve İstanbul Arkeoloji Müzesi''nin kurucusu olan sanatçı kimdir?',
  '{"options": ["Osman Hamdi Bey", "Şeker Ahmet Paşa", "İbrahim Çallı", "Hoca Ali Rıza", "Hüseyin Avni Lifij"], "correctIndex": 0}'::jsonb,
  'Sayda kazılarında İskender Lahdi''ni bulan, Arkeoloji Müzesi''ni kuran ve Kaplumbağa Terbiyecisi''ni yapan deha OSMAN HAMDİ BEY''dir.',
  'İlk resim sergisini açan Şeker Ahmet Paşa''dır; müzeciliğin babası ve Kaplumbağa Terbiyecisi''nin ressamı ise OSMAN HAMDİ BEY''dir.',
  36
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Türkiye''de çekilen İLK RENKLİ TÜRK FİLMİ olma özelliğine sahip olan ve Muhsin Ertuğrul tarafından 1953 yılında yönetilen film hangisidir?',
  '{"options": ["Halıcı Kız", "Susuz Yaz", "Ateşten Gömlek", "Bir Millet Uyanıyor", "Beyaz Geceler"], "correctIndex": 0}'::jsonb,
  'Muhsin Ertuğrul''un yönettiği 1953 yapımı ''HALICI KIZ'' filmi, Türk sinemasının ilk uzun metrajlı renkli filmidir.',
  'Susuz Yaz ilk uluslararası ödülü (Berlin Altın Ayı) alan filmdir; İLK RENKLİ Türk filmi ise HALICI KIZ''dır.',
  37
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Metin Erksan''ın yönettiği, 1964 Berlin Uluslararası Film Festivali''nde büyük ödül olan ''Altın Ayı''yı (Golden Bear) kazanarak Türk sinemasına ilk uluslararası büyük ödülü getiren film hangisidir?',
  '{"options": ["Susuz Yaz", "Yol", "Umut", "Halıcı Kız", "Kuru Otlar Üstüne"], "correctIndex": 0}'::jsonb,
  'Necati Cumalı''nın eserinden uyarlanan ve başrolünde Erol Taş ile Hülya Koçyiğit''in yer aldığı ''SUSUZ YAZ'' filmi, Berlin''de Altın Ayı kazanan ilk filmimizdir.',
  'Yol filmi Cannes Altın Palmiye kazanmıştır (1982); Berlin Altın Ayı kazanan ilk film ise SUSUZ YAZ''dır (1964).',
  38
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Cumhurbaşkanlığı Kültür ve Sanat Büyük Ödülleri''nde ''Edebiyat'' alanında ödüllendirilen, ''Bozkırın Tezenesi'' lakaplı büyük halk ozanı Neşet Ertaş''ın babası ve ustası olan halk ozanı kimdir?',
  '{"options": ["Muharrem Ertaş", "Aşık Veysel", "Davut Sulari", "Aşık Daimi", "Ali Ekber Çiçek"], "correctIndex": 0}'::jsonb,
  'Neşet Ertaş''ın ''Benim babam bu dünyada sazıyla sözüyle bir ekoldü'' dediği ustası ve Abdallık geleneğinin piri MUHARREM ERTAŞ''tır.',
  'Neşet Ertaş Bozkırın Tezenesidir; onun ustası ve babası MUHARREM ERTAŞ''tır.',
  39
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
  distractor_trap,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '2024 yılında hayatını kaybeden, ''Mihriban'', ''Hak Yol İslam Yazacağız'' ve ''Hasan''a Mektuplar'' gibi unutulmaz şiirlerin şairi olan Türk edebiyatının usta hiciv ve halk şairi kimdir?',
  '{"options": ["Abdurrahim Karakoç", "Sezai Karakoç", "Bahaettin Karakoç", "Cahit Zarifoğlu", "Erdem Bayazıt"], "correctIndex": 0}'::jsonb,
  '''Mihriban'' ve ''Hasan''a Mektuplar'' şiirlerinin şairi ABDURRAHİM KARAKOÇ''tur. (Monna Rosa''nın şairi Sezai Karakoç''tur).',
  'Sezai Karakoç = Monna Rosa; Abdurrahim Karakoç = Mihriban. Bu iki şair ÖSYM''nin en popüler tuzak ikilisidir.',
  40
);

COMMIT;
