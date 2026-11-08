-- =============================================================
-- KPSS GÜNCEL BİLGİLER — KONU 3: BILIM VE TEKNOLOJI GELIŞMELERI
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Türkiye''nin İnsanlı İlk Uzay Misyonu (Ax-3) kapsamında Ocak 2024''te Uluslararası Uzay İstasyonu''na (ISS) giderek uzayda 13 farklı bilimsel deney gerçekleştiren İLK TÜRK ASTRONOTU kimdir?',
  '{"options": ["Alper Gezeravcı", "Tuva Cihangir Atasever", "Halil Kayıkçı", "Gökhan Erdem", "Umut Yıldız"], "correctIndex": 0}'::jsonb,
  '18 Ocak 2024''te fırlatılan Axiom-3 misyonuyla Uluslararası Uzay İstasyonu''na çıkan ve uzaydan dünyaya ilk sözü ''İstikbal göklerdedir'' olan ilk Türk astronotu ALPER GEZERAVCI''dır.',
  'Alper Gezeravcı İLK astronotumuzdur (ISS''e giden); Tuva Cihangir Atasever ise İKİNCİ astronotumuzdur (yörünge altı uçuş yapan).'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Haziran 2024''te ABD New Mexico''daki Spaceport tesislerinden Virgin Galactic VSS Unity aracıyla ''yörünge altı araştırma uçuşu'' yaparak Türkiye''nin ikinci astronotu unvanını alan bilim insanı kimdir?',
  '{"options": ["Tuva Cihangir Atasever", "Alper Gezeravcı", "Canan Dağdeviren", "Feryal Özel", "Aziz Sancar"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin ikinci astronotu olarak mikro yerçekimi ortamında 7 farklı deney gerçekleştiren isim TUVA CİHANGİR ATASEVER''dir.',
  'İlk astronot = Alper Gezeravcı; Yörünge altı uçuş yapan ikinci astronot = Tuva Cihangir Atasever''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Türk Havacılık ve Uzay Sanayii (TUSAŞ) tarafından geliştirilen ve 21 Şubat 2024 tarihinde ilk test uçuşunu başarıyla gerçekleştiren Türkiye''nin 5. nesil Milli Muharip Uçağı''nın adı nedir?',
  '{"options": ["KAAN", "KIZILELMA", "HÜRJET", "ANKA-3", "HÜRKUŞ"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin 5. nesil savaş uçağı KAAN (Milli Muharip Uçak - MMU), 21 Şubat 2024''te ilk uçuşunu yaparak gökyüzüyle buluşmuştur.',
  'KAAN insanlı 5. nesil savaş uçağımızdır; KIZILELMA ve ANKA-3 ise İNSANSIZ savaş uçaklarıdır.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Baykar tarafından milli ve özgün olarak geliştirilen, teker kesme ve otomatik iniş testlerini tamamlayarak Türk havacılık tarihine geçen Türkiye''nin İLK İNSANSIZ SAVAŞ UÇAĞI hangisidir?',
  '{"options": ["Bayraktar KIZILELMA", "Bayraktar TB2", "Bayraktar AKINCI", "ANKA-3", "AKSUNGUR"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin ilk insansız savaş uçağı (MİUS) Bayraktar KIZILELMA''dır. Jet motoru ve düşük radar iziyle hava-hava muharebesi yapabilmektedir.',
  'TB2 ve Akıncı SİHA''dır (pervaneli); KIZILELMA ise jet motorlu ilk insansız SAVAŞ UÇAĞIDIR.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Dünyada üzerine SİHA ve insansız hava araçlarının iniş-kalkış yapabildiği ilk çok maksatlı amfibi hücum gemisi olan Türk Deniz Kuvvetleri''nin en büyük amiral gemisi hangisidir?',
  '{"options": ["TCG Anadolu", "TCG Derya", "TCG İstanbul", "TCG Kınalıada", "TCG Heybeliada"], "correctIndex": 0}'::jsonb,
  '2023 yılında Türk Donanması''na katılan TCG ANADOLU (L400), Türkiye''nin en büyük askeri gemisi ve dünyanın İLK SİHA GEMİSİ unvanına sahiptir.',
  'TCG Anadolu amiral hücum gemisidir; TCG Derya ise donanmanın ikinci büyük gemisi olan ikmal destek gemisidir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Temmuz 2024''te uzaya fırlatılan, Türkiye''yi dünyada kendi haberleşme uydusunu üretebilen ilk 11 ülke arasına sokan İLK YERLİ VE MİLLİ HABERLEŞME UYDUMUZ hangisidir?',
  '{"options": ["Türksat 6A", "Türksat 5B", "İMECE", "Göktürk-2", "Bilsat"], "correctIndex": 0}'::jsonb,
  'TÜBİTAK UZAY, ASELSAN, TUSAŞ ve C2TECH ortaklığıyla üretilen TÜRKSAT 6A, 8 Temmuz 2024''te fırlatılan ilk milli haberleşme uydumuzdur.',
  'Türksat 5A ve 5B yabancı firmalara ürettirilmişti; 6A ise tamamen YERLİ üretilen ilk uydudur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Hücrelerin hasar gören DNA''larını nasıl onardığını ve genetik bilgisini nasıl koruduğunu haritalandıran araştırmalarıyla 2015 yılında NOBEL KİMYA ÖDÜLÜ''nü kazanan Türk bilim insanı kimdir?',
  '{"options": ["Prof. Dr. Aziz Sancar", "Prof. Dr. Oktay Sinanoğlu", "Prof. Dr. Gazi Yaşargil", "Prof. Dr. Cahit Arf", "Prof. Dr. Celal Şengör"], "correctIndex": 0}'::jsonb,
  'Mardin Savur doğumlu olan PROF. DR. AZİZ SANCAR, DNA onarım mekanizması keşfiyle 2015 Nobel Kimya Ödülü''nü Tomas Lindahl ve Paul Modrich ile paylaşmıştır.',
  'Edebiyatta Orhan Pamuk (2006); Fen bilimlerinde ise ilk ve tek Nobel ödüllü Türk Aziz Sancar''dır (2015).'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Matematikte kendi adıyla anılan ''Arf Değişmezi'', ''Arf Halkaları'' ve ''Hasse-Arf Teoremi''ni dünya bilim literatürüne kazandıran, portresi 10 TL''lik banknotun arkasında yer alan matematikçi kimdir?',
  '{"options": ["Cahit Arf", "Aydın Sayılı", "Salih Zeki", "Ali Kuşçu", "Kerim Erim"], "correctIndex": 0}'::jsonb,
  '''Matematik de resim ve müzik gibi bir sanattır'' diyen ve 10 TL banknotumuzun arka yüzünde formülleriyle yer alan dahi CAHİT ARF''tır.',
  '5 TL: Aydın Sayılı (Bilim Tarihi); 10 TL: Cahit Arf (Matematik). Bu iki banknotu ÖSYM asla unutturmaz.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Harvard Üniversitesi''nde Bilim Tarihi kürsüsünde dünyada ilk doktora derecesini alan ve 5 TL''lik banknotun arka yüzünde portresi bulunan bilim insanımız kimdir?',
  '{"options": ["Aydın Sayılı", "Cahit Arf", "Fuat Sezgin", "Halil İnalcık", "Ekmeleddin İhsanoğlu"], "correctIndex": 0}'::jsonb,
  'Ord. Prof. Dr. AYDIN SAYILI, Atatürk''ün desteğiyle yurt dışına gönderilmiş, Harvard''da George Sarton''ın yanında bilim tarihi doktorası yapan dünyadaki ilk kişi olmuştur ve 5 TL banknotundadır.',
  '5 TL = Aydın Sayılı; İslam Bilim Tarihi Araştırmacısı Fuat Sezgin ile karıştırılmamalıdır.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  1,
  'Amerikan Beyin Cerrahları Birliği tarafından ''Yüzyılın Beyin Cerrahı'' seçilen, mikronöroşirürjinin (mikro beyin cerrahisi) kurucusu kabul edilen dünyaca ünlü Türk tıp doktoru kimdir?',
  '{"options": ["Prof. Dr. Gazi Yaşargil", "Prof. Dr. Mehmet Öz", "Prof. Dr. Münci Kalayoğlu", "Dr. Hulusi Behçet", "Prof. Dr. İhsan Doğramacı"], "correctIndex": 0}'::jsonb,
  'Kendi geliştirdiği mikroskop ve cerrahi aletlerle beyin tümörlerinin ameliyatında çığır açan ve ''Yüzyılın Nöroşirürjisyeni'' seçilen deha PROF. DR. GAZİ YAŞARGİL''dir.',
  'Karaciğer nakli uzmanı Münci Kalayoğlu''dur; Yüzyılın Beyin Cerrahı unvanı ise GAZİ YAŞARGİL''e aittir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  '2024 Nobel Fizik Ödülü; ''yapay sinir ağları ile makine öğrenimini mümkün kılan temel keşif ve icatları'' nedeniyle yapay zekanın öncülerinden olan hangi iki bilim insanına verilmiştir?',
  '{"options": ["John Hopfield ve Geoffrey Hinton", "Demis Hassabis ve John Jumper", "David Baker ve Katalin Kariko", "Pierre Agostini ve Ferenc Krausz", "Alain Aspect ve Anton Zeilinger"], "correctIndex": 0}'::jsonb,
  '2024 Nobel Fizik Ödülü, modern yapay zekanın ve derin öğrenmenin temelini atan Amerikalı John Hopfield ile İngiliz-Kanadalı Geoffrey Hinton''a verilmiştir.',
  'Fizik Ödülü = Hopfield & Hinton (Yapay Sinir Ağları); Kimya Ödülü = Baker, Hassabis & Jumper (Protein Tasarımı & AlphaFold).'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  '2024 Nobel Kimya Ödülü; hesaplamalı protein tasarımı ve yapay zeka (AlphaFold) kullanarak protein yapılarının 3 boyutlu tahmin edilmesini sağlayan hangi araştırmacılara verilmiştir?',
  '{"options": ["David Baker, Demis Hassabis ve John Jumper", "John Hopfield ve Geoffrey Hinton", "Victor Ambros ve Gary Ruvkun", "Moungi Bawendi ve Louis Brus", "Carolyn Bertozzi ve Morten Meldal"], "correctIndex": 0}'::jsonb,
  '2024 Nobel Kimya Ödülü''nün yarısı hesaplamalı protein tasarımı için David Baker''a, diğer yarısı ise AlphaFold yapay zeka modeliyle protein yapısını çözen Google DeepMind yöneticileri Demis Hassabis ve John Jumper''a verilmiştir.',
  '2024 yılı yapay zekanın yılı olmuştur: Fizik ödülü temel yapay sinir ağına, Kimya ödülü ise biyolojideki AlphaFold yapay zekasına verilmiştir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  '2024 Nobel Fizyoloji veya Tıp Ödülü; genlerin çalışmasını kontrol eden ''mikroRNA'' molekülünü keşfeden hangi iki bilim insanına verilmiştir?',
  '{"options": ["Victor Ambros ve Gary Ruvkun", "Katalin Kariko ve Drew Weissman", "Svante Pääbo", "David Julius ve Ardem Patapoutian", "Harvey Alter ve Michael Houghton"], "correctIndex": 0}'::jsonb,
  '2024 Nobel Tıp Ödülü, hücrelerin gen aktivitesini nasıl kontrol ettiğini gösteren ''mikroRNA'' keşifleri sebebiyle Victor Ambros ve Gary Ruvkun''a verilmiştir.',
  'Katalin Kariko ve Drew Weissman mRNA aşıları ile 2023 Nobel Tıp Ödülü''nü almıştı; 2024 kazananları Victor Ambros ve Gary Ruvkun''dur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Türk Havacılık ve Uzay Sanayii (TUSAŞ) tarafından geliştirilen, Türkiye''nin İLK JET MOTORLU EĞİTİM VE HAFİF TAARRUZ UÇAĞI olan hava aracımız hangisidir?',
  '{"options": ["HÜRJET", "HÜRKUŞ", "KAAN", "ANKA-3", "GÖKBEY"], "correctIndex": 0}'::jsonb,
  'TUSAŞ üretimi HÜRJET, ses hızının üzerine çıkabilen (süpersonik) Türkiye''nin ilk jet motorlu gelişmiş eğitim ve hafif taarruz uçağıdır.',
  'HÜRKUŞ turboprop (pervaneli) eğitim uçağıdır; jet motorlu olan ise HÜRJET''tir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'TUSAŞ tarafından geliştirilen, kuyruksuz ve uçan kanat (flying wing) tasarımı sayesinde düşük radar görünürlüğüne sahip Türkiye''nin İLK UÇAN KANAT SİHA''sı hangisidir?',
  '{"options": ["ANKA-3", "Bayraktar TB3", "AKSUNGUR", "ŞİMŞEK", "KARGI"], "correctIndex": 0}'::jsonb,
  'ANKA-3, kuyruksuz ''uçan kanat'' gövde mimarisi ve iç silah istasyonlarıyla Türkiye''nin ilk hayalet (stealth) insansız savaş uçağı prototipidir.',
  'ANKA-3 TUSAŞ''ın uçan kanat konseptidir; Kızılelma ise Baykar''ın delta kanatlı insansız jetidir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'TUSAŞ Motor Sanayii (TEİ) tarafından geliştirilen ve yerli genel maksat helikopterimiz GÖKBEY''de başarıyla uçuş testleri yapılan Türkiye''nin İLK MİLLİ HELİKOPTER MOTORU hangisidir?',
  '{"options": ["TEİ-TS1400", "TEİ-TF6000", "TEİ-PD170", "TEİ-TJ90", "KTJ-3200"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin ilk yerli turboşaft helikopter motoru TEİ-TS1400''dür (1400 beygir gücündedir ve Gökbey helikopterine güç vermektedir).',
  'PD170 İHA motorudur; Gökbey helikopterinin motoru TEİ-TS1400 turboşaft motorudur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'TÜBİTAK UZAY tarafından tasarlanıp üretilen ve Nisan 2023''te fırlatılan, metre-altı çözünürlüğe sahip Türkiye''nin İLK YERLİ VE MİLLİ YÜKSEK ÇÖZÜNÜRLÜKLÜ YER GÖZLEM UYDUSU hangisidir?',
  '{"options": ["İMECE", "Türksat 6A", "Rasat", "Göktürk-1", "Göktürk-2"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin metre-altı çözünürlüklü ilk yerli gözlem uydusu İMECE''dir. (Türksat 6A ise haberleşme uydusudur).',
  'İMECE = Yer Gözlem; Türksat 6A = Haberleşme uydusudur. Bu iki yerli uydunun görev alanı ÖSYM''nin favori çeldiricisidir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Tıpta kan damarlarının iltihaplanmasıyla seyreden ve kendi adıyla dünya tıp literatürüne giren ''Hastalık''ı (Trisemptom kompleksi) tanımlayan ilk Türk hekim kimdir?',
  '{"options": ["Hulusi Behçet", "Mazhar Osman", "Akil Muhtar Özden", "Tevfik Sağlam", "Besim Ömer Akalın"], "correctIndex": 0}'::jsonb,
  'Ağızda ve genital bölgede aftlar ile göz iltihabıyla karakterize ''Behçet Hastalığı''nı 1937''de tanımlayan ünlü dermatoloğumuz ORD. PROF. DR. HULUSİ BEHÇET''tir.',
  'Dünya tıp literatüründe bir Türk doktorun adıyla anılan en ünlü hastalık BEHÇET HASTALIĞI''dır.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Yale Üniversitesi''nde 26 yaşında profesör olarak ''dünyanın en genç profesörü'' unvanını alan, moleküler biyoloji ve kimya alanındaki çalışmaları ile Türkçe üzerine yazdığı ''Bye Bye Türkçe'' kitabıyla tanınan Türk bilgini kimdir?',
  '{"options": ["Oktay Sinanoğlu", "Aziz Sancar", "Cahit Arf", "Gazi Yaşargil", "Behram Kurşunoğlu"], "correctIndex": 0}'::jsonb,
  '''Türk Aynştaynı'' olarak anılan ve Yale Üniversitesi''nde 26 yaşında tam profesörlüğe yükselen deha PROF. DR. OKTAY SİNANOĞLU''dur.',
  'Aziz Sancar Nobel ödüllüdür; Yale''de en genç yaşta profesör olan isim ise OKTAY SİNANOĞLU''dur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'NASA''nın James Webb Uzay Teleskobu ve Hubble verilerini kullanarak ilk karadeliklerin oluşumu ve gökadaların evrimi üzerine dünya çapında çığır açıcı çalışmalara imza atan Türk astrofizikçi kadın bilim insanı kimdir?',
  '{"options": ["Prof. Dr. Feryal Özel", "Doç. Dr. Canan Dağdeviren", "Prof. Dr. Neva Çiftçioğlu", "Dr. Dilhan Eryurt", "Prof. Dr. Betül Kacar"], "correctIndex": 0}'::jsonb,
  'NASA Hubble doktora sonrası bursunu kazanan, Olay Ufku Teleskobu (EHT) Bilim Konseyi üyesi olan ve karadeliklerin ilk fotoğrafının çekilmesinde kilit rol oynayan astrofizikçimiz PROF. DR. FERYAL ÖZEL''dir.',
  'Giyilebilir kalp pilini icat eden Canan Dağdeviren''dir; Karadelik astrofiziği uzmanı ise FERYAL ÖZEL''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Giyilebilir esnek kalp pili (piezoelektrik nanogeneratör) ve meme kanserini erken teşhis eden elektronik sütyen projesini geliştiren MIT Media Lab öğretim üyesi Türk bilim insanı kimdir?',
  '{"options": ["Canan Dağdeviren", "Feryal Özel", "Betül Kacar", "Gözde Durmuş", "Hatice Zora"], "correctIndex": 0}'::jsonb,
  'Organların hareket enerjisini elektrik enerjisine çeviren piezoelektrik malzemeler üzerine öncü buluşlar yapan fizik mühendisimiz DOÇ. DR. CANAN DAĞDEVİREN''dir.',
  'Giyilebilir biyomedikal sensörler ve kalp pili = CANAN DAĞDEVİREN; Karadelik fiziği = Feryal Özel.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'NASA''nın astrobiyoloji araştırma merkezinde evrende yaşamın kökenlerini araştıran ve erken dönem Dünya''daki protein evrimini laboratuvarda canlandıran Türk astrobiyolog kimdir?',
  '{"options": ["Prof. Dr. Betül Kacar", "Canan Dağdeviren", "Feryal Özel", "Naşide Gözde Durmuş", "Sena Yaman"], "correctIndex": 0}'::jsonb,
  'NASA Erken Yaşam ve Evrim Araştırma Grubu lideri olan astrobiyoloğumuz PROF. DR. BETÜL KACAR''dır.',
  'Astrobiyoloji ve yaşamın kökeni denince akla Betül Kacar gelir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'İslam Bilim Tarihi Araştırmaları Vakfı''nı kuran, İstanbul Gülhane Parkı''nda İslam Bilim ve Teknoloji Tarihi Müzesi''nin açılmasına öncülük eden ve Cumhurbaşkanlığı tarafından 2019 yılı kendi adına ilan edilen büyük bilim tarihçimiz kimdir?',
  '{"options": ["Prof. Dr. Fuat Sezgin", "Prof. Dr. Halil İnalcık", "Prof. Dr. Aydın Sayılı", "Prof. Dr. Ekmeleddin İhsanoğlu", "Prof. Dr. İlber Ortaylı"], "correctIndex": 0}'::jsonb,
  'Arap-İslam bilimleri tarihini 17 ciltlik dev eserinde toplayan ve Gülhane''deki müzeyi kuran deha PROF. DR. FUAT SEZGİN''dir (2019 Fuat Sezgin Yılı ilan edilmişti).',
  'Fuat Sezgin İslam Bilim Tarihidir; Halil İnalcık ise Şeyh-ül Müverrihin (Tarihçilerin Şeyhi) olarak Osmanlı tarihi uzmanıdır.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'İlk Türk kadın astronomu unvanına sahip olan, Apollo projesinde görev alarak Güneş''in evrimini ve Ay atmosferini araştıran ve NASA''dan ''Apollo Başarı Ödülü'' alan bilim insanımız kimdir?',
  '{"options": ["Prof. Dr. Dilhan Eryurt", "Prof. Dr. Nüzhet Gökdoğan", "Prof. Dr. Paris Pişmiş", "Prof. Dr. Feryal Özel", "Prof. Dr. Remziye Hisar"], "correctIndex": 0}'::jsonb,
  'ODTÜ Astrofizik Anabilim Dalı kurucusu olan ve Apollo 11 Ay''a iniş misyonunda güneş modelleri geliştiren PROF. DR. DİLHAN ERYURT, NASA''dan ödül alan ilk Türk bilim insanıdır.',
  'Nüzhet Gökdoğan ilk kadın dekanımız ve astronomdur; NASA Apollo ödüllü kadın astrofizikçimiz ise DİLHAN ERYURT''tur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Sorbonne Üniversitesi''nden doktora derecesi alan İLK TÜRK KADIN KİMYAGER ve Madame Curie''nin öğrencisi olan bilim insanımız kimdir?',
  '{"options": ["Prof. Dr. Remziye Hisar", "Prof. Dr. Nüzhet Gökdoğan", "Sabiha Bengütaş", "Muazzez İlmiye Çığ", "Halet Çambel"], "correctIndex": 0}'::jsonb,
  'Fransa''da kimya doktorası yapan ilk Türk kadını olan ve dünyaca ünlü fizikçi Feza Gürsey''in annesi olan bilim insanı REMZİYE HİSAR''dır.',
  'Remziye Hisar ilk kadın kimyagerdir; Muazzez İlmiye Çığ ise ünlü Sümerologdur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  '2024 yılında hayatını kaybeden, Sümer, Hitit ve Akad uygarlıkları üzerine yazdığı sayısız eser ve çivi yazısı çözümleriyle ''Son Sümer Kraliçesi'' olarak anılan 110 yaşındaki dünyaca ünlü Türk Sümerolog kimdir?',
  '{"options": ["Muazzez İlmiye Çığ", "Halet Çambel", "Afet İnan", "Jale İnan", "Remziye Hisar"], "correctIndex": 0}'::jsonb,
  'İstanbul Arkeoloji Müzeleri''nde binlerce çivi yazılı tableti kataloglayan ve Kasım 2024''te 110 yaşında aramızdan ayrılan usta Sümerolog MUAZZEZ İLMİYE ÇIĞ''dır.',
  'Halet Çambel ve Jale İnan öncü arkeologlardır; Sümer tabletleri uzmanı ise MUAZZEZ İLMİYE ÇIĞ''dır.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Osmanlı döneminde Takiyüddin tarafından 1575 yılında Tophane sırtlarında kurulan ve kuyruklu yıldız gözlemleri yapılan İLK OSMANLI RASATHANESİ hangisidir?',
  '{"options": ["İstanbul Rasathanesi (Darü''r-Rasad)", "Kandilli Rasathanesi", "Semerkant Rasathanesi", "Maraga Rasathanesi", "Bağdat Rasathanesi"], "correctIndex": 0}'::jsonb,
  'III. Murad döneminde Takiyüddin er-Rasıd öncülüğünde Tophane''de kurulan rasathane İSTANBUL RASATHANESİ''dir (1580''de şeyhülislam fetvasıyla yıktırılmıştır).',
  'Kandilli Rasathanesi Fatin Gökmen öncülüğünde 1911''de kurulmuştur; Takiyüddin''in 1575''teki ilk rasathanesi İSTANBUL RASATHANESİ''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Matematik dünyasında ''Sıfır'' (0) rakamını ilk kez sistemli biçimde kullanan ve ''Cebir'' ilminin kurucusu kabul edilen ''El-Kitabü''l-Muhtasar fi Hisabi''l-Cebr ve''l-Mukabele'' eserinin müellifi kimdir?',
  '{"options": ["Harezmi", "Biruni", "Ömer Hayyam", "Ali Kuşçu", "Sabit bin Kurra"], "correctIndex": 0}'::jsonb,
  'Batı dillerindeki ''Algoritma'' ve ''Algebra'' (Cebir) kelimelerinin isim babası olan ve sıfır rakamını matematiğe kazandıran deha HAREZMİ''dir.',
  'Harezmi = Cebir ve Sıfır; Biruni = Yerkürenin çevresi ve enlem/boylam; Ömer Hayyam = Binom açılımı ve Celali Takvimi.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  'Gazneli Mahmud''un ''Sarayımın en değerli hazinesi'' dediği, dünyanın yarıçapını ve çevresini gerçeğe en yakın değerde hesaplayan ''El-Asarü''l-Bakiye'' adlı eserin yazarı Harezmli dahi kimdir?',
  '{"options": ["Biruni", "Harezmi", "İbn-i Sina", "Farabi", "İdrisi"], "correctIndex": 0}'::jsonb,
  'Gazneli Mahmud''un ''sarayımın hazinesi'' dediği, trigonometrinin kurucularından olan ve yerküre ölçümleri yapan bilgin BİRUNİ''dir.',
  'ÖSYM bu soruyu Gazneli Mahmud sözü üzerinden defalarca sormuştur; cevap kesinlikle BİRUNİ''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  2,
  '1928 yılında küf mantarından ''Penisilin'' antibiyotiğini tesadüfen bularak modern tıpta antibiyotik çağını başlatan İskoç biyolog kimdir?',
  '{"options": ["Alexander Fleming", "Louis Pasteur", "Robert Koch", "Edward Jenner", "Joseph Lister"], "correctIndex": 0}'::jsonb,
  'Penicillium notatum küfünden penisilini izole eden bilim insanı ALEXANDER FLEMING''dir.',
  'Kuduz aşısı = Louis Pasteur; Çiçek aşısı = Edward Jenner; Penisilin = ALEXANDER FLEMING''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  '1895 yılında Crookes tüpüyle çalışırken ''X-Işınları''nı (Röntgen ışınları) keşfeden ve 1901 yılında verilen TARİHTEKİ İLK NOBEL FİZİK ÖDÜLÜ''nün sahibi olan Alman fizikçi kimdir?',
  '{"options": ["Wilhelm Conrad Röntgen", "Max Planck", "Albert Einstein", "Heinrich Hertz", "Niels Bohr"], "correctIndex": 0}'::jsonb,
  'Tarihteki ilk Nobel Fizik Ödülü 1901''de X-ışınlarını keşfeden WILHELM CONRAD RÖNTGEN''e verilmiştir.',
  'Tarihteki İLK Nobel Fizik Ödülü Wilhelm Conrad Röntgen''e aittir (1901).'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Manastır bahçesinde bezelyeler üzerinde yaptığı çaprazlama deneyleriyle genetik biliminin ve modern kalıtım kurallarının kurucusu sayılan Avusturyalı biyolog kimdir?',
  '{"options": ["Gregor Mendel", "Charles Darwin", "Jean-Baptiste Lamarck", "Thomas Hunt Morgan", "Ernst Haeckel"], "correctIndex": 0}'::jsonb,
  'Bezelye tohumlarının şekli, rengi ve boyunu inceleyerek genlerin nesilden nesile aktarılma kanunlarını bulan deha GREGOR MENDEL''dir.',
  'Evrim kuramı Darwin; Genetik ve bezelye deneyleri MENDEL''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Antik Çağ''da İskenderiye''de yaşayan, ''Elementler'' (Stoikheia) adlı 13 ciltlik eseriyle iki bin yıl boyunca düzlem geometrisinin tek temel kaynağını oluşturan ''Geometrinin Babası'' kimdir?',
  '{"options": ["Öklid (Eukleides)", "Pisagor (Pythagoras)", "Tales (Thales)", "Arşimet (Arkhimedes)", "Apollonios"], "correctIndex": 0}'::jsonb,
  'Aksiyom ve postulatlara dayalı klasik düzlem geometrisinin kurucusu ve ''Elementler'' kitabının yazarı ÖKLİD''dir.',
  'Pisagor üçgen teoremiyle bilinir; ''Elementler'' kitabı ve geometri aksiyomları ÖKLİD''e aittir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  '1543 yılında yayımlanan ''Gök Cisimlerinin Dönüşleri Üzerine'' (De revolutionibus orbium coelestium) eseriyle Dünya merkezli Batlamyus modelini yıkarak ''GÜNEŞ MERKEZLİ'' (Heliosentrik) evren modelini kuran Polonyalı astronom kimdir?',
  '{"options": ["Nicolaus Copernicus (Kopernik)", "Johannes Kepler", "Galileo Galilei", "Tycho Brahe", "Giordano Bruno"], "correctIndex": 0}'::jsonb,
  'Güneş''in merkezde, Dünya ve gezegenlerin onun etrafında döndüğünü modern astronomiye kazandıran KOPERNİK''tir.',
  'Teleskopla gözlem yapan Galileo; Eliptik yörüngeleri bulan Kepler; Güneş merkezli modeli ilk kuran ise KOPERNİK''tir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Gezegenlerin Güneş etrafında daire değil, ''ELİPS'' şeklinde yörüngelerde döndüğünü matematiksel üç temel yasayla kanıtlayan ve ''Astronomia Nova'' kitabını yazan Alman gökbilimci kimdir?',
  '{"options": ["Johannes Kepler", "Nicolaus Copernicus", "Galileo Galilei", "Isaac Newton", "Christiaan Huygens"], "correctIndex": 0}'::jsonb,
  'Kepler Yasaları (Eliptik yörüngeler, Alanlar kanunu, Periyotlar kanunu) JOHANNES KEPLER tarafından formüle edilmiştir.',
  'Dairesel Güneş sistemi Kopernik; Elips yörüngeler yasası KEPLER''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Tarihte ilk mekanik bilgisayar kabul edilen ''Fark Motoru'' ve programlanabilir ''Analitik Motor'' tasarımlarıyla ''BİLGİSAYARIN BABASI'' kabul edilen İngiliz mucit ve matematikçi kimdir?',
  '{"options": ["Charles Babbage", "Alan Turing", "John von Neumann", "Blaise Pascal", "Ada Lovelace"], "correctIndex": 0}'::jsonb,
  'Analitik Motor tasarımıyla modern bilgisayarların işlemci ve bellek mantığını ilk tasarlayan dahi CHARLES BABBAGE''dir. (İlk programcı ise Ada Lovelace''tır).',
  'Turing modern bilgisayar kuramcısıdır; ilk mekanik bilgisayarı tasarlayan ise CHARLES BABBAGE''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  '1628 yılında ''Kalp ve Kanın Hareketi Üzerine Anatomik Çalışma'' adlı eseriyle tıpta kanın damarlar içinde kapalı bir sistemde dolaştığını (büyük kan dolaşımı) ilk kez deneysel olarak kanıtlayan İngiliz hekim kimdir?',
  '{"options": ["William Harvey", "Andreas Vesalius", "İbnü''n-Nefis", "Edward Jenner", "Antonie van Leeuwenhoek"], "correctIndex": 0}'::jsonb,
  'İbnü''n-Nefis küçük kan dolaşımını teorik olarak tanımlamıştı; büyük ve küçük kan dolaşımını modern anlamda deneylerle kanıtlayan ise WİLLİAM HARVEY''dir.',
  'Küçük dolaşım İslam bilgini İbnü''n-Nefis; modern dolaşım fizyolojisi WILLIAM HARVEY''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Elektrik ve manyetizmanın tek bir kuvvet (elektromanyetizma) olduğunu gösteren ve ışığın elektromanyetik bir dalga olduğunu kanıtlayan dört ünlü denklemin sahibi İskoç teorik fizikçi kimdir?',
  '{"options": ["James Clerk Maxwell", "Michael Faraday", "Heinrich Hertz", "Nikola Tesla", "Andre-Marie Ampere"], "correctIndex": 0}'::jsonb,
  'Maxwell Denklemleri ile klasik elektromanyetizma teorisini kuran fizikçi JAMES CLERK MAXWELL''dir.',
  'Deneysel indüksiyon Faraday''dır; matematiksel formülasyonu kuran MAXWELL''dir.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Türkiye''nin ilk yerli üretim otomobili olan ve 1961 yılında Cumhurbaşkanı Cemal Gürsel''in talimatıyla Eskişehir Cer Atölyeleri''nde Türk mühendisler tarafından üretilen ilk yerli otomobil hangisidir?',
  '{"options": ["Devrim", "Anadol", "TOGG", "Zafer", "Murat 124"], "correctIndex": 0}'::jsonb,
  '1961''de 129 günde Eskişehir Demiryolu Fabrikalarında üretilen ilk yerli otomobilimiz DEVRİM''dir. (İlk seri üretim otomobilimiz ise 1966''da Anadol olmuştur).',
  'İlk üretilen prototip = DEVRİM; İlk SERİ ÜRETİLEN yerli otomobil = ANADOL''dur.'
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
  'Bilim ve Teknoloji Gelişmeleri',
  'multiple_choice',
  3,
  'Cumhuriyet tarihinin ilk uçak fabrikasını (TOMTAŞ) Kayseri''de kuran, ilk yerli Türk yolcu ve eğitim uçağını (Nu.D-36 ve Nu.D-38) üreten ve ilk yerli paraşütü yapan cumhuriyet dönemi havacılık ve demiryolu öncüsü kimdir?',
  '{"options": ["Nuri Demirağ", "Vecihi Hürkuş", "Şakir Zümre", "Nuri Killigil", "Sabiha Gökçen"], "correctIndex": 0}'::jsonb,
  'Demiryolu müteahhidi ve Nu.D uçaklarının üreticisi olan, Divriği''de Büyük Gök Okulu''nu açan havacılık öncümüz NURİ DEMİRAĞ''dır.',
  'İlk Türk uçağını tek başına üreten ve pilot olan Vecihi Hürkuş''tur; ilk büyük özel uçak fabrikasını kurup Nu.D uçaklarını seri üreten ise NURİ DEMİRAĞ''dır.'
);

COMMIT;
