-- =============================================================
-- KPSS GÜNCEL BİLGİLER — KONU 1: TÜRKIYE VE DÜNYA GÜNDEMI
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  'Kuzey Atlantik Antlaşması Örgütü''nün (NATO) 2024 yılı Mart ayında katılım sürecini tamamlayarak ittifakın 32. resmi üyesi olan ülke aşağıdakilerden hangisidir?',
  '{"options": ["Finlandiya", "İsveç", "Ukrayna", "Avusturya", "İsviçre"], "correctIndex": 1}'::jsonb,
  'NATO''ya 2023 yılında 31. üye olarak Finlandiya katılmış; 2024 yılı Mart ayında ise İSVEÇ tüm onay süreçlerini tamamlayarak ittifakın resmen 32. üyesi olmuştur.',
  'Finlandiya 31. üyedir, İSVEÇ ise 32. (en son katılan) üyedir. Bu iki İskandinav ülkesinin katılım sırası ÖSYM''nin en sevdiği çeldiricidir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  'Ekim 2024''te görev süresi dolan Jens Stoltenberg''in yerine NATO Genel Sekreterliği görevine seçilen eski Hollanda Başbakanı aşağıdakilerden hangisidir?',
  '{"options": ["Mark Rutte", "Emmanuel Macron", "Olaf Scholz", "Alain Berset", "Alexander De Croo"], "correctIndex": 0}'::jsonb,
  '1 Ekim 2024 itibarıyla Jens Stoltenberg''den NATO Genel Sekreterliği görevini devralan isim eski Hollanda Başbakanı MARK RUTTE''dir.',
  'Alain Berset 2024''te Avrupa Konseyi Genel Sekreteri seçilmiştir. NATO''nun başına geçen isim ise Mark Rutte''dir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  '2024 yılı başında genişleme kararı alarak Mısır, Etiyopya, İran ve Birleşik Arap Emirlikleri''ni bünyesine katan ve 2024 Liderler Zirvesi''ni Rusya''nın Kazan şehrinde düzenleyen uluslararası ekonomik blok aşağıdakilerden hangisidir?',
  '{"options": ["G7", "BRICS", "D-8", "OECD", "ASEAN"], "correctIndex": 1}'::jsonb,
  'Brezilya, Rusya, Hindistan, Çin ve Güney Afrika''nın kurduğu BRICS grubu, 2024 başında yeni üyelerle genişlemiş ve 16. Liderler Zirvesi''ni Ekim 2024''te Rusya''nın Kazan kentinde gerçekleştirmiştir.',
  'D-8 gelişmekte olan 8 Müslüman ülkeyi kapsar; küresel Güney''in yükselen en büyük bloku ve 2024''te genişleyen topluluk BRICS''tir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  'Irak''ın Basra Körfezi''ndeki Büyük Fav Limanı''ndan başlayıp Türkiye üzerinden Avrupa''ya kesintisiz kara ve demiryolu bağlantısı kurmayı hedefleyen stratejik ulaştırma koridoru projesinin adı nedir?',
  '{"options": ["Kuzey-Güney Koridoru", "Kalkınma Yolu Projesi", "Zengezur Koridoru", "İpek Demiryolu Hattı", "Trans-Hazar Projesi"], "correctIndex": 1}'::jsonb,
  'Türkiye, Irak, Katar ve BAE arasında Nisan 2024''te Bağdat''ta imzalanan ve Basra Körfezi''ni Türkiye üzerinden Avrupa''ya bağlayan dev koridorun adı ''KALKINMA YOLU PROJESİ''dir (Kuru Kanal).',
  'Zengezur Koridoru Azerbaycan-Nahçıvan-Türkiye hattıdır; Irak Fav Limanı''ndan Türkiye''ye uzanan hat ise Kalkınma Yolu''dur.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  '2024 yılı Temmuz ayında Kazakistan''ın başkenti Astana''da düzenlenen zirvede Şanghay İşbirliği Örgütü''ne (ŞİÖ) 10. tam üye olarak kabul edilen ülke hangisidir?',
  '{"options": ["İran", "Belarus (Beyaz Rusya)", "Pakistan", "Moğolistan", "Türkiye"], "correctIndex": 1}'::jsonb,
  'Şanghay İşbirliği Örgütü''ne 2023''te İran (9. üye), Temmuz 2024 Astana Zirvesi''nde ise BELARUS tam üye olarak katılmış ve örgütün üye sayısı 10''a yükselmiştir.',
  'İran 2023 yılında katılmıştı (9. üye); 2024 yılında en son tam üye olan ülke BELARUS''tur (10. üye).'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  'Eylül 2024''te Azerbaycan''ın başkenti Bakü''de toplanan Ortak Alfabe Komisyonu''nda Türk dünyasının kültürel ve dilsel birliğini güçlendirmek amacıyla kaç harften oluşan ''Ortak Türk Alfabesi'' modeli üzerinde uzlaşmaya varılmıştır?',
  '{"options": ["29", "32", "34", "36", "40"], "correctIndex": 2}'::jsonb,
  'Türk Akademisi ve Türk Dil Kurumu öncülüğünde Eylül 2024''te Bakü''de gerçekleştirilen toplantıda, Türk dillerindeki ortak sesleri kapsayan 34 HARFLİ Ortak Türk Alfabesi taslağı üzerinde tarihi bir uzlaşma sağlanmıştır.',
  'Türkiye Türkçesi alfabesi 29 harflidir; tüm Türk dünyasını kapsayan ortak alfabe projesi 34 HARFLİDİR.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  '2024 yılında Avrupa Konseyi Parlamenter Meclisi (AKPM) tarafından Avrupa Konseyi Genel Sekreterliği görevine seçilen İsviçreli siyasetçi aşağıdakilerden hangisidir?',
  '{"options": ["Alain Berset", "Marija Pejcinovic Buric", "Ursula von der Leyen", "Charles Michel", "Roberta Metsola"], "correctIndex": 0}'::jsonb,
  'Eski İsviçre Konfederasyonu Başkanı ALAIN BERSET, Haziran 2024''te yapılan oylamada Avrupa Konseyi''nin yeni Genel Sekreteri olarak seçilmiş ve göreve başlamıştır.',
  'Ursula von der Leyen Avrupa Komisyonu Başkanıdır; Avrupa Konseyi Genel Sekreteri seçilen isim ise Alain Berset''tir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  'Türkiye ile Somali arasında 2024 yılında imzalanan Savunma ve Ekonomik İşbirliği Çerçeve Anlaşması kapsamında, Somali açıklarında petrol ve doğalgaz sismik araştırmaları yapmak üzere Ekim 2024''te uğurlanan Türkiye''nin sismik araştırma gemisi hangisidir?',
  '{"options": ["Oruç Reis", "Barbaros Hayrettin Paşa", "Fatih", "Yavuz", "Kanuni"], "correctIndex": 0}'::jsonb,
  'Somali ile yapılan tarihi hidrokarbon anlaşması uyarınca Somali deniz yetki alanlarında üç boyutlu sismik araştırma yapmak üzere Ekim 2024''te İstanbul''dan uğurlanan gemimiz ORUÇ REİS''tir.',
  'Fatih, Yavuz, Kanuni ve Abdülhamid Han ''sondaj'' gemileridir; Somali''ye sismik arama için giden gemi ORUÇ REİS''tir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  'Lahey''de bulunan Uluslararası Adalet Divanı''nda (UAD) İsrail aleyhine açılan soykırım davasına 2024 yılı Ağustos ayında resmi olarak müdahillik başvurusunda bulunan ülke aşağıdakilerden hangisidir?',
  '{"options": ["Türkiye", "Almanya", "Japonya", "İngiltere", "Kanada"], "correctIndex": 0}'::jsonb,
  'Güney Afrika Cumhuriyeti''nin UAD''de açtığı davaya Türkiye, TBMM Hukuk Heyeti ve Dışişleri Bakanlığı koordinasyonunda 7 Ağustos 2024 tarihinde resmi müdahillik dosyasını sunmuştur.',
  'Davayı ilk açan Güney Afrika''dır; Türkiye ise davaya resmi müdahil (katılan taraf) olarak başvurmuştur.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  1,
  '2024 yılında Hollanda''nın Lahey kentindeki Uluslararası Ceza Mahkemesi''nin (UCM) başkanlığına seçilen Japon yargıç kimdir?',
  '{"options": ["Tomoko Akane", "Nawaf Salam", "Piotr Hofmanski", "Tedros Ghebreyesus", "António Guterres"], "correctIndex": 0}'::jsonb,
  'Mart 2024''te Uluslararası Ceza Mahkemesi (UCM) yargıçları tarafından yeni mahkeme başkanı olarak Japon Yargıç TOMOKO AKANE seçilmiştir.',
  'Nawaf Salam Uluslararası Adalet Divanı (UAD) Başkanıdır; UCM Başkanı ise Tomoko Akane''dir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  '2024 yılının ilk yarısında Belçika''nın yürüttüğü Avrupa Birliği (AB) Dönem Başkanlığını, 1 Temmuz 2024 itibarıyla 6 aylık süre için devralan Doğu Avrupa ülkesi hangisidir?',
  '{"options": ["Macaristan", "Polonya", "Avusturya", "Romanya", "Slovakya"], "correctIndex": 0}'::jsonb,
  '2024 yılının ilk 6 ayında AB Dönem Başkanlığı Belçika''da idi; 1 Temmuz - 31 Aralık 2024 tarihleri arasındaki ikinci 6 aylık dönem başkanlığını MACARİSTAN yürütmüştür. 2025 ilk yarısında ise Polonya devralacaktır.',
  '2024 ikinci dönem başkanı Macaristan''dır; Polonya ise 1 Ocak 2025''te görevi devralacaktır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  '2025 yılı G20 Liderler Zirvesi Dönem Başkanlığını üstlenerek zirveye ev sahipliği yapacak olan Afrika kıtası ülkesi aşağıdakilerden hangisidir?',
  '{"options": ["Nijerya", "Güney Afrika Cumhuriyeti", "Mısır", "Kenya", "Fas"], "correctIndex": 1}'::jsonb,
  '2024 G20 Zirvesi Brezilya''da (Rio de Janeiro) yapılmıştır. 2025 yılında G20 dönem başkanlığını Afrika kıtasının tek tam üyesi olan GÜNEY AFRİKA CUMHURİYETİ üstlenmiştir.',
  '2024 = Brezilya; 2025 = Güney Afrika Cumhuriyeti; 2026 = ABD''dir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Birleşmiş Milletler İklim Değişikliği Çerçeve Sözleşmesi 29. Taraflar Konferansı (COP29), Kasım 2024 tarihinde hangi ülkede ve şehirde düzenlenmiştir?',
  '{"options": ["Birleşik Arap Emirlikleri / Dubai", "Azerbaycan / Bakü", "Brezilya / Belém", "Mısır / Şarm El-Şeyh", "Katar / Doha"], "correctIndex": 1}'::jsonb,
  'COP29 İklim Zirvesi 11-22 Kasım 2024 tarihlerinde kardeş ülke AZERBAYCAN''ın başkenti BAKÜ''de düzenlenmiştir. COP30 ise 2025 yılında Brezilya''da (Belém) yapılacaktır.',
  'COP28 Dubai''de yapıldı; COP29 BAKÜ''de yapıldı; COP30 ise Brezilya''da yapılacaktır. Sıralamaya dikkat edilmelidir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  '2024 yılı Kasım ayında Kırgızistan''ın başkenti Bişkek''te ''Türk Dünyasının Güçlendirilmesi: Ekonomik Entegrasyon ve Sürdürülebilir Kalkınma'' temasıyla toplanan 11. Devlet Başkanları Zirvesi hangi teşkilata aittir?',
  '{"options": ["Türk Devletleri Teşkilatı (TDT)", "Ekonomik İşbirliği Teşkilatı (EİT)", "D-8 Teşkilatı", "İslam İşbirliği Teşkilatı (İİT)", "Karadeniz Ekonomik İşbirliği (KEİ)"], "correctIndex": 0}'::jsonb,
  'Türk Devletleri Teşkilatı (TDT) 11. Liderler Zirvesi, 6 Kasım 2024''te Kırgızistan''ın başkenti Bişkek''te gerçekleştirilmiştir.',
  'EİT (İran, Pakistan, Türkiye vb.) ile TDT birbirine karıştırılmamalıdır; Bişkek Zirvesi doğrudan Türk Devletleri Teşkilatı''nın zirvesidir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Avrupa Güvenlik ve İşbirliği Teşkilatı''nın (AGİT) daimi sekretaryası ve merkezi hangi Avrupa başkentinde bulunmaktadır?',
  '{"options": ["Cenevre", "Viyana", "Brüksel", "Strazburg", "Lahey"], "correctIndex": 1}'::jsonb,
  'AGİT''in (OSCE) genel merkezi Avusturya''nın başkenti VİYANA''dadır.',
  'Brüksel AB ve NATO merkezidir; Cenevre BM Avrupa merkezidir; AGİT''in merkezi ise VİYANA''dır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  '2024 yılı Mayıs ayında Gambiya''nın başkenti Banjul''da ''Sürdürülebilir Kalkınma İçin Birlik ve Dayanışma Yoluyla Diyaloğun Güçlendirilmesi'' temasıyla 15. Liderler Zirvesi''ni gerçekleştiren uluslararası kuruluş hangisidir?',
  '{"options": ["İslam İşbirliği Teşkilatı (İİT)", "Arap Birliği", "Afrika Birliği", "D-8 Teşkilatı", "Bağlantısızlar Hareketi"], "correctIndex": 0}'::jsonb,
  '57 üyesi bulunan İslam İşbirliği Teşkilatı''nın (İİT) 15. İslam Zirvesi, 4-5 Mayıs 2024 tarihlerinde Batı Afrika ülkesi Gambiya''nın başkenti Banjul''da düzenlenmiştir.',
  'Afrika Birliği Zirvesi Etiyopya''da (Addis Ababa) toplanır; Gambiya/Banjul''daki zirve İslam İşbirliği Teşkilatı zirvesidir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Birleşmiş Milletler''in New York''taki Genel Kurulu''nda Eylül 2024''te başlayan 79. Genel Kurul Başkanlığı görevine seçilen Kamerunlu diplomat ve eski başbakan kimdir?',
  '{"options": ["Philemon Yang", "Dennis Francis", "Volkan Bozkır", "Abdulla Shahid", "Csaba Körösi"], "correctIndex": 0}'::jsonb,
  'BM 79. Genel Kurul Başkanı olarak Kamerun eski Başbakanı PHILEMON YANG seçilmiştir. (75. Başkan Volkan Bozkır, 78. Başkan Dennis Francis idi).',
  'Dennis Francis 78. Dönem Başkanıydı; 79. Dönem Başkanı ise Afrika grubundan seçilen Philemon Yang''dır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Gelişmekte olan sekiz ülkenin ekonomik işbirliğini hedefleyen D-8 Teşkilatı''nın daimi sekretaryası hangi şehirde bulunmaktadır?',
  '{"options": ["İstanbul", "Cakarta", "Kahir e", "Tahran", "İslamabad"], "correctIndex": 0}'::jsonb,
  '1997 yılında Necmettin Erbakan öncülüğünde kurulan D-8 Teşkilatı''nın (Gelişen Sekiz Ülke) Genel Sekreterliği ve merkezi İSTANBUL''dadır.',
  'D-8''in merkezi Türkiye''de, İSTANBUL''dadır. İslam İşbirliği Teşkilatı''nın merkezi ise Cidde''dedir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  '2024 yılı Şubat ayında Uluslararası Adalet Divanı (UAD) Başkanlığına seçilerek göreve başlayan Lübnanlı hukukçu ve diplomat kimdir?',
  '{"options": ["Nawaf Salam", "Joan Donoghue", "Karim Khan", "Tomoko Akane", "Fouad Siniora"], "correctIndex": 0}'::jsonb,
  'Uluslararası Adalet Divanı''nın (UAD) yeni başkanı Lübnanlı Yargıç NAWAF SALAM olmuştur.',
  'Karim Khan UCM Başsavcısıdır; Nawaf Salam ise BM''nin ana yargı organı olan Uluslararası Adalet Divanı''nın Başkanıdır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Nisan 2025 - Ekim 2025 tarihleri arasında ''Geleceğin Toplumunu Tasarlamak, Hayatlarımızı Güçlendirmek'' temasıyla düzenlenecek olan EXPO 2025 dünya sergisi hangi Asya şehrinde gerçekleşecektir?',
  '{"options": ["Osaka (Japonya)", "Şanghay (Çin)", "Busan (Güney Kore)", "Riyad (Suudi Arabistan)", "Doha (Katar)"], "correctIndex": 0}'::jsonb,
  'EXPO 2025 dünya sergisi Japonya''nın OSAKA şehrinde (Yumeshima yapay adasında) düzenlenecektir. EXPO 2030 ise Suudi Arabistan''ın Riyad kentinde yapılacaktır.',
  'EXPO 2025 Osaka''dadır; EXPO 2030 Riyad''dadır. Sınavda bu iki ev sahibi şehir sıkça karıştırılır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Azerbaycan''ın batı bölgeleri ile Nahçıvan Özerk Cumhuriyeti''ni Ermenistan toprakları üzerinden doğrudan birbirine ve dolayısıyla Türkiye''ye bağlaması planlanan stratejik ulaşım koridoru hangisidir?',
  '{"options": ["Zengezur Koridoru", "Laçin Koridoru", "Kuzey-Güney Koridoru", "Vahan Koridoru", "Kalkınma Koridoru"], "correctIndex": 0}'::jsonb,
  'Ermenistan''ın Syunik (Zengezur) bölgesinden geçerek Azerbaycan anakarasını Nahçıvan ve Türkiye ile kara-demiryoluyla bağlayacak jeopolitik koridorun adı ZENGEZUR KORİDORU''dur.',
  'Laçin Koridoru Karabağ ile Ermenistan arasındaki eski bağlantıydı; Nahçıvan ile Azerbaycan''ı Türkiye''ye bağlayan hat Zengezur Koridoru''dur.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Dünya Ekonomik Forumu''nun (WEF) her yıl küresel siyasi liderleri, iş insanlarını ve akademisyenleri bir araya getirdiği ünlü yıllık zirvesine ev sahipliği yapan Davos kasabası hangi ülkededir?',
  '{"options": ["İsviçre", "Avusturya", "Lüksemburg", "Lihtenştayn", "Almanya"], "correctIndex": 0}'::jsonb,
  'Dünya Ekonomik Forumu (WEF) her kış İSVİÇRE''nin Graubünden kantonundaki DAVOS kasabasında toplanır.',
  'WEF Zirvesi İsviçre''nin Davos kasabasında yapılır; merkez teşkilatı ise yine İsviçre''nin Cenevre kantonundaki Cologny''dedir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Türkiye''nin en uzun deniz altı ve kara doğalgaz boru hatlarından biri olan, Azerbaycan Şah Deniz 2 sahasından çıkan doğalgazı Türkiye üzerinden Avrupa''ya ulaştıran Güney Gaz Koridoru''nun Türkiye içindeki ana boru hattı hangisidir?',
  '{"options": ["TANAP (Trans Anadolu Doğalgaz Boru Hattı)", "TAP (Trans Adriyatik Boru Hattı)", "TürkAkım", "Mavi Akım", "Bakü-Tiflis-Ceyhan"], "correctIndex": 0}'::jsonb,
  'Gürcistan sınırından başlayıp Yunanistan sınırına kadar Türkiye''yi baştan başa kat eden ve Şah Deniz gazını taşıyan hat TANAP''tır. Yunanistan''dan İtalya''ya uzanan Avrupa ayağı ise TAP''tır.',
  'Türkiye içi = TANAP; Avrupa kısmı = TAP; Rusya''dan Karadeniz altından Trakya''ya gelen hat ise TürkAkım''dır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Petrol İhraç Eden Ülkeler Örgütü''nün (OPEC) genel merkezi hangi şehirde yer almaktadır?',
  '{"options": ["Viyana", "Riyad", "Kuveyt", "Abu Dabi", "Cenevre"], "correctIndex": 0}'::jsonb,
  'OPEC üyeleri Orta Doğu, Afrika ve Güney Amerika ülkelerinden oluşmasına rağmen, örgütün genel merkezi Avusturya''nın başkenti VİYANA''dadır (Avusturya üye olmadığı halde ev sahibidir).',
  'Örgütün merkezi Arap yarımadasında değil, Avrupa''da, VİYANA''dadır. ÖSYM''nin en klasik ters köşe sorularındandır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  '2024 yılında Avrupa Birliği''nin ortak para birimi Euro bölgesine (Eurozone) ve Şengen Alanı''na tam üye olan son Balkan ülkesi Hırvatistan''ın ardından, 2025 başında Euro''ya geçiş hazırlığı yapan komşu ülke hangisidir?',
  '{"options": ["Bulgaristan", "Sırbistan", "Kuzey Makedonya", "Arnavutluk", "Bosna-Hersek"], "correctIndex": 0}'::jsonb,
  'Hırvatistan 1 Ocak 2023''te Euro ve Şengen''e girmişti. Şengen''e hava ve deniz yoluyla Mart 2024''te dahil edilen ve 2025 hedefiyle Euro bölgesine girmeyi planlayan komşumuz BULGARİSTAN''dır.',
  'Bulgaristan AB üyesidir ve Euro bölgesine girmek üzeredir; Sırbistan ve Kuzey Makedonya ise henüz AB üyesi bile değildir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Asya-Pasifik Ekonomik İşbirliği (APEC) 2024 Liderler Zirvesi Latin Amerika''nın hangi ülkesinde (Lima) gerçekleştirilmiştir?',
  '{"options": ["Peru", "Şili", "Meksika", "Brezilya", "Kolombiya"], "correctIndex": 0}'::jsonb,
  'APEC 2024 Zirvesi Kasım 2024''te PERU''nun başkenti Lima''da yapılmıştır. 2025 APEC Zirvesi ise Güney Kore''de yapılacaktır.',
  'Brezilya G20 Zirvesi''ne ev sahipliği yaptı; APEC Zirvesi ise Peru''nun başkenti Lima''da yapıldı.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Güneydoğu Asya Ülkeleri Birliği''nin (ASEAN) genel sekreterliği ve merkezi aşağıdaki şehirlerden hangisindedir?',
  '{"options": ["Cakarta (Endonezya)", "Kuala Lumpur (Malezya)", "Bangkok (Tayland)", "Singapur", "Manila (Filipinler)"], "correctIndex": 0}'::jsonb,
  'ASEAN''ın idari merkezi ve sekreteryası Endonezya''nın başkenti CAKARTA''da bulunmaktadır.',
  'ASEAN Bangkok Deklarasyonu ile kurulmuştur ancak daimi merkezi ve sekretaryası CAKARTA''dadır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Mülteciler Yüksek Komiserliği''nin (UNHCR) genel merkezi hangi şehirde bulunmaktadır?',
  '{"options": ["Cenevre", "New York", "Roma", "Paris", "Londra"], "correctIndex": 0}'::jsonb,
  'UNHCR''nin (BM Mülteciler Yüksek Komiserliği) genel merkezi İsviçre''nin CENEVRE kentindedir.',
  'BM Ana Merkezi New York''tadır; ancak Mülteciler (UNHCR), Sağlık (DSÖ) ve Çalışma (ILO) örgütleri CENEVRE''dedir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'BM Gıda ve Tarım Örgütü (FAO) ve Dünya Gıda Programı''nın (WFP) genel merkezleri hangi Avrupa başkentindedir?',
  '{"options": ["Roma (İtalya)", "Paris (Fransa)", "Cenevre (İsviçre)", "Viyana (Avusturya)", "Madrid (İspanya)"], "correctIndex": 0}'::jsonb,
  'BM bünyesindeki tarım ve gıda kuruluşları (FAO, WFP, IFAD) İtalya''nın başkenti ROMA''da toplanmıştır.',
  'UNESCO Paris''tedir; Gıda kuruluşları (FAO ve WFP) ise ROMA''dadır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  2,
  'Uluslararası Atom Enerjisi Ajansı (UAEA) ve Birleşmiş Milletler Sınai Kalkınma Örgütü (UNIDO) hangi şehirde konuşlanmıştır?',
  '{"options": ["Viyana", "Cenevre", "Brüksel", "Bern", "Helsinki"], "correctIndex": 0}'::jsonb,
  'Uluslararası Atom Enerjisi Ajansı (UAEA) ve UNIDO, Avusturya''nın başkenti VİYANA''daki BM merkezinde (Vienna International Centre) faaliyet gösterir.',
  'Nükleer denetim ve enerji ajansı UAEA VİYANA''dadır; Cenevre''deki CERN nükleer araştırma laboratuvarı ile karıştırılmamalıdır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Türk Devletleri Teşkilatı''nda (TDT) tam üye olmayıp ''Gözlemci Üye'' statüsünde bulunan ülkeler hangi seçenekte eksiksiz ve doğru verilmiştir?',
  '{"options": ["Macaristan — Kuzey Kıbrıs Türk Cumhuriyeti (KKTC) — Türkmenistan", "Macaristan — Ukrayna — Moğolistan", "KKTC — Bosna-Hersek — Gürcistan", "Türkmenistan — Moğolistan — Tacikistan", "Katar — Pakistan — KKTC"], "correctIndex": 0}'::jsonb,
  'TDT''nin 5 tam üyesi (Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan) ve 3 gözlemci üyesi vardır: MACARİSTAN (2018), TÜRKMENİSTAN (2021) ve KKTC (2022 Semerkant Zirvesi).',
  'KKTC 2022''de, Macaristan 2018''de, Türkmenistan 2021''de Gözlemci Üye olmuştur. Bu üçlüyü bilmek ÖSYM''nin en favori eleme sorusudur.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Türkiye''nin 2024 yılında resmen üyelik başvurusunda bulunduğu, Güneydoğu Asya ve Asya-Pasifik''te geniş etki alanı olan ve merkezi Pekin''de bulunan çok taraflı kalkınma bankası hangisidir?',
  '{"options": ["Asya Altyapı Yatırım Bankası (AIIB) — Türkiye kurucu üyedir", "Yeni Kalkınma Bankası (NDB - BRICS Bankası)", "İslam Kalkınma Bankası (İsKB)", "Avrupa İmar ve Kalkınma Bankası (EBRD)", "Karadeniz Ticaret ve Kalkınma Bankası (BSTDB)"], "correctIndex": 1}'::jsonb,
  'Türkiye, Asya Altyapı Yatırım Bankası''nın (AIIB) zaten kurucu üyesidir. 2024 yılında Şanghay merkezli BRICS Yeni Kalkınma Bankası''na (NDB) katılım iradesi ve resmi başvurusu gündeme gelmiştir.',
  'AIIB''ye Türkiye 2015''te kurucu üye olmuştur; BRICS''in Yeni Kalkınma Bankası (NDB) ise Şanghay merkezli olup son katılım sürecindedir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  '2024 yılında düzenlenen 60. Münih Güvenlik Konferansı''nın (MSC) yayımladığı yıllık güvenlik raporunda dünya siyasetindeki gerilemeyi ve parçalanmayı ifade etmek için kullanılan ana kavram hangisidir?',
  '{"options": ["Lose-Lose (Kaybet-Kaybet)", "Zero-Sum Game (Sıfır Toplamlı Oyun)", "De-risking (Riskten Arındırma)", "Decoupling (Bağları Koparma)", "Multipolarity (Çok Kutupluluk)"], "correctIndex": 0}'::jsonb,
  '2024 Münih Güvenlik Raporu''nun başlığı ve ana teması ''Lose-Lose?'' (Kaybet-Kaybet?) olmuştur. Raporda jeopolitik çatışmaların herkes için kayba yol açtığı vurgulanmıştır.',
  'ÖSYM uluslararası rapor mottolarını sormayı çok sever; 2024 Münih mottosu ''Lose-Lose''dur.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Birleşmiş Milletler Güvenlik Konseyi''nin (BMGK) daimi 5 üyesi (Veto yetkisi olan ''Fırça'' ülkeleri: ABD, Rusya, Çin, İngiltere, Fransa) dışındaki 10 geçici üyesi kaç yıllığına seçilmektedir?',
  '{"options": ["1 yıl", "2 yıl", "3 yıl", "4 yıl", "5 yıl"], "correctIndex": 1}'::jsonb,
  'BMGK''nın 10 geçici üyesi BM Genel Kurulu tarafından 2 YILLIK süre için seçilir. Her yıl bu üyelerin 5''i yenilenir.',
  'Geçici üyelerin görev süresi 2 yıldır; art arda iki dönem seçilemezler.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Türkiye''nin diplomatik arabuluculuğunda Somali ile Etiyopya arasındaki deniz erişimi ve toprak bütünlüğü anlaşmazlığını çözmek üzere 2024 yılında Ankara''da başlatılan müzakere sürecine ne ad verilmiştir?',
  '{"options": ["Ankara Süreci", "İstanbul İstişareleri", "Mogadişu Paktı", "Boynuz Barışı Girişimi", "Antalya Diyaloğu"], "correctIndex": 0}'::jsonb,
  'Etiyopya''nın Somaliland ile imzaladığı mutabakata karşı Somali ile yaşadığı krizde Türkiye devreye girmiş ve Dışişleri Bakanlığı ev sahipliğinde Temmuz ve Ağustos 2024''te ''ANKARA SÜRECİ'' toplantıları gerçekleştirilmiştir.',
  'Türkiye''nin Doğu Afrika''da yürüttüğü bu tarihi diplomatik mekanizmanın resmi adı ''Ankara Süreci''dir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Avrupa İnsan Hakları Mahkemesi''nin (AİHM) yargıç sayısı neye göre belirlenir ve bir yargıcın görev süresi kaç yıldır?',
  '{"options": ["Avrupa Konseyi üye sayısı kadardır (46 yargıç) — Görev süresi 9 yıldır ve yeniden seçilemezler.", "AB üye sayısı kadardır (27 yargıç) — Görev süresi 6 yıldır.", "15 yargıçtan oluşur — Görev süresi 12 yıldır.", "21 yargıçtan oluşur — Görev süresi 5 yıldır.", "Sabit 40 yargıçtır — Görev süresi ömür boyudur."], "correctIndex": 0}'::jsonb,
  'AİHM''de Avrupa Konseyi''ne üye devlet sayısı kadar (Rusya''nın ihracından sonra 46 üye devlet = 46 yargıç) yargıç bulunur. Yargıçlar 9 YILLIK süre için seçilir ve tekrar seçilemezler (görev yaşı 70''te biter).',
  'AİHM Avrupa Konseyi organıdır (AB değil!); bu yüzden yargıç sayısı 27 değil 46''dır ve görev süreleri 9 yıldır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Türkiye''nin ilk yerli ve milli haberleşme uydusu olan ve Temmuz 2024''te ABD Florida''daki Cape Canaveral üssünden SpaceX Falcon 9 roketiyle uzaya fırlatılan uydu hangisidir?',
  '{"options": ["Türksat 6A", "Türksat 5B", "İMECE", "Göktürk-1", "Rasat"], "correctIndex": 0}'::jsonb,
  '8 Temmuz 2024''te fırlatılan TÜRKSAT 6A, Türkiye''nin yerli imkanlarla (TÜBİTAK UZAY, TUSAŞ, ASELSAN, C2TECH) ürettiği İLK MİLLİ HABERLEŞME UYDUSUDUR.',
  'İMECE yer gözlem uydusudur (2023); Türksat 6A ise ilk yerli HABERLEŞME uydusudur.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  '2024 yılında Avrupa Birliği Konseyi Başkanlığı''na (AB Liderler Zirvesi Başkanlığı) seçilen eski Portekiz Başbakanı kimdir?',
  '{"options": ["António Costa", "Charles Michel", "Josep Borrell", "Kaja Kallas", "Pedro Sanchez"], "correctIndex": 0}'::jsonb,
  'Charles Michel''den AB Konseyi Başkanlığı (European Council President) görevini devralmak üzere eski Portekiz Başbakanı ANTÓNIO COSTA seçilmiştir. Kaja Kallas ise AB Dış İlişkiler Yüksek Temsilcisi olmuştur.',
  'Kaja Kallas Dış Politika şefidir; Konsey Başkanı seçilen lider António Costa''dır.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Uluslararası Para Fonu (IMF) ve Dünya Bankası''nın (World Bank) genel merkezleri hangi şehirde yer almaktadır?',
  '{"options": ["Washington D.C.", "New York", "Londra", "Basel", "Cenevre"], "correctIndex": 0}'::jsonb,
  'Bretton Woods ikizleri olarak bilinen IMF ve Dünya Bankası''nın genel merkezleri ABD''nin başkenti WASHINGTON D.C.''dedir.',
  'BM Ana Merkezi New York''tadır; küresel finans kuruluşları IMF ve Dünya Bankası ise WASHINGTON D.C.''dedir.'
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
  'Türkiye ve Dünya Gündemi',
  'multiple_choice',
  3,
  'Türkiye''nin kurucu üyesi olduğu, merkezi İstanbul''da bulunan Karadeniz Ekonomik İşbirliği Teşkilatı''nın (KEİ) Karadeniz''e kıyısı OLMADIĞI halde kurucu üyesi olan ülkeler hangi seçenekte doğru verilmiştir?',
  '{"options": ["Yunanistan — Arnavutluk — Ermenistan — Azerbaycan — Sırbistan — Moldova", "İran — Irak — Suriye", "Macaristan — Polonya — Çekya", "Belarus — Kazakistan — Özbekistan", "Avusturya — İsviçre — İtalya"], "correctIndex": 0}'::jsonb,
  'KEİ''nin 13 üyesi vardır. Karadeniz''e kıyısı olmamasına rağmen üye olan ülkeler: Azerbaycan, Ermenistan, Arnavutluk, Yunanistan, Moldova, Sırbistan ve Kuzey Makedonya''dır.',
  'Azerbaycan, Ermenistan, Yunanistan ve Arnavutluk''un Karadeniz''e kıyısı YOKTUR ama KEİ üyesidirler! ÖSYM bu coğrafi mantık tuzağını sıkça sorar.'
);

COMMIT;
