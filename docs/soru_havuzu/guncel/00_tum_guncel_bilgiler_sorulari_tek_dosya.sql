-- =============================================================
-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM GÜNCEL BİLGİLER VE GENEL KÜLTÜR SORULARI (MASTER)
-- Toplam: 6 Konu x 40 Soru = 240 Özgün Soru
-- Hedef Tablo: public.questions (Supabase)
-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap
-- =============================================================
BEGIN;


-- -------------------------------------------------------------
-- KONU 1: TÜRKIYE VE DÜNYA GÜNDEMI
-- -------------------------------------------------------------

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


-- -------------------------------------------------------------
-- KONU 2: KÜLTÜR, SANAT VE EDEBIYAT
-- -------------------------------------------------------------

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '2024 Nobel Edebiyat Ödülü''ne ''tarihsel travmalarla yüzleşen ve insan hayatının kırılganlığını ortaya koyan yoğun lirik düzyazısı'' gerekçesiyle layık görülen, ''Vejetaryen'' adlı romanıyla tanınan Güney Koreli yazar aşağıdakilerden hangisidir?',
  '{"options": ["Han Kang", "Haruki Murakami", "Jon Fosse", "Annie Ernaux", "Mo Yan"], "correctIndex": 0}'::jsonb,
  'İsveç Akademisi 2024 Nobel Edebiyat Ödülü''nü Güney Koreli kadın yazar HAN KANG''a vermiştir. Han Kang, bu ödülü kazanan ilk Güney Koreli ve ilk Asyalı kadın yazar olmuştur.',
  'Jon Fosse 2023 Nobel Edebiyat Ödülü sahibidir; 2024 yılı kazananı ise Han Kang''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Uluslararası Türk Kültürü Teşkilatı (TÜRKSOY) tarafından ''2024 Türk Dünyası Kültür Başkenti'' ilan edilen ve Mahtumkulu Firaki yılı kutlamalarına ev sahipliği yapan Anev kenti hangi Türk cumhuriyetindedir?',
  '{"options": ["Türkmenistan", "Azerbaycan", "Özbekistan", "Kazakistan", "Kırgızistan"], "correctIndex": 0}'::jsonb,
  'TÜRKSOY Kültür Bakanları Daimi Konseyi, 2024 Türk Dünyası Kültür Başkenti olarak TÜRKMENİSTAN''ın tarihi ANEV şehrini seçmiştir.',
  '2023 Şuşa (Azerbaycan); 2024 Anev (Türkmenistan); 2025 ise Aktau (Kazakistan) olmuştur.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'TÜRKSOY tarafından ''2025 Türk Dünyası Kültür Başkenti'' olarak ilan edilen Hazar Denizi kıyısındaki liman kenti Aktau hangi ülkededir?',
  '{"options": ["Kazakistan", "Özbekistan", "Azerbaycan", "Türkmenistan", "Kırgızistan"], "correctIndex": 0}'::jsonb,
  'TÜRKSOY 2025 yılı için Türk Dünyası Kültür Başkenti unvanını KAZAKİSTAN''ın Mangıstau eyaletinde yer alan AKTAU kentine vermiştir.',
  '2024 Anev (Türkmenistan), 2025 Aktau (Kazakistan). Bu iki başkent ÖSYM''nin peş peşe soracağı güncel kültür ikilisidir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '96. Akademi Ödülleri''nde (Oscar 2024) En İyi Film, En İyi Yönetmen (Christopher Nolan) ve En İyi Erkek Oyuncu (Cillian Murphy) dahil olmak üzere 7 dalda ödül kazanan biyografik yapım hangisidir?',
  '{"options": ["Oppenheimer", "Barbie", "Poor Things (Zavallılar)", "Killers of the Flower Moon", "The Zone of Interest"], "correctIndex": 0}'::jsonb,
  '2024 Mart ayında düzenlenen 96. Oscar Töreni''nde atom bombasının babası J. Robert Oppenheimer''ın hayatını anlatan ''OPPENHEIMER'' filmi 7 heykelcikle geceye damga vurmuştur.',
  'Barbie gişede yarışsa da Oscar''ı silip süpüren film Oppenheimer''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '2024 Nobel Barış Ödülü; ''nükleer silahlardan arındırılmış bir dünya için yürüttüğü çabalar ve nükleer silahların bir daha asla kullanılmaması gerektiğine dair tanıklıkları'' nedeniyle hangi kuruluşa verilmiştir?',
  '{"options": ["Nihon Hidankyo (Japonya)", "Uluslararası Kızılhaç Komitesi", "Dünya Gıda Programı (WFP)", "Nergis Muhammedi", "Uluslararası Af Örgütü"], "correctIndex": 0}'::jsonb,
  'Norveç Nobel Komitesi, 2024 Barış Ödülü''nü 1945 Hiroşima ve Nagazaki atom bombası mağdurlarının (Hibakuşa) kurduğu Japon taban hareketi NİHON HİDANKYO''ya vermiştir.',
  'Nergis Muhammedi 2023 Barış Ödülü''nü almıştır; 2024 yılı kazananı Japon barış hareketi Nihon Hidankyo''dur.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Batı dünyasında ''Avicenna'' adıyla bilinen, tıp dünyasının temel başvuru kaynağı olan ''El-Kanun fi''t-Tıbb'' (Tıbbın Kanunu) ve felsefe-bilim ansiklopedisi ''Kitabü''ş-Şifa'' eserlerinin yazarı İslam bilgini kimdir?',
  '{"options": ["İbn-i Sina", "Farabi", "İbn-i Rüşd", "Harezmi", "Biruni"], "correctIndex": 0}'::jsonb,
  'Avrupa üniversitelerinde yüzyıllarca okutulan El-Kanun fi''t-Tıbb''ın ve Kitabü''ş-Şifa''nın müellifi, Batı''da ''Avicenna'' olarak anılan büyük hekim ve filozof İBN-İ SİNA''dır.',
  'Avicenna = İbn-i Sina; Averroes = İbn-i Rüşd; Alpharabius = Farabi''dir. ÖSYM bu Latince lakapları her yıl dönüşümlü sorar.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Felsefede Aristo''dan sonra ''Muallim-i Sani'' (İkinci Öğretmen) unvanıyla tanınan ve ideal bir toplum düzenini anlattığı ''El-Medinetü''l-Fazıla'' (Erdemli Şehir) eseriyle bilinen Türk-İslam düşünürü kimdir?',
  '{"options": ["Farabi", "İbn-i Sina", "Gazali", "İbn-i Haldun", "Nizamülmülk"], "correctIndex": 0}'::jsonb,
  'Aristo ''Muallim-i Evvel'' (Birinci Öğretmen), FARABİ ise ''Muallim-i Sani'' (İkinci Öğretmen) olarak anılır. En meşhur eseri ''El-Medinetü''l-Fazıla''dır (Erdemli Şehir).',
  'Muallim-i Sani unvanı sadece FARABİ''ye aittir. İbn-i Sina ile karıştırılmamalıdır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Tarih felsefesinin ve modern sosyolojinin kurucusu kabul edilen, 7 ciltlik ''Kitabü''l-İber'' adlı dünya tarihinin giriş kısmı olarak kaleme aldığı meşhur eseri ''Mukaddime'' olan düşünür kimdir?',
  '{"options": ["İbn-i Haldun", "İbn-i Sina", "Farabi", "Biruni", "Evliya Çelebi"], "correctIndex": 0}'::jsonb,
  '''Coğrafya kaderdir'' sözüyle özdeşleştirilen ve devletlerin insanlar gibi doğup, büyüyüp, yaşlanıp öleceğini savunduğu eseri ''Mukaddime'' olan 14. yüzyıl Tunuslu düşünürü İBN-İ HALDUN''dur.',
  'Mukaddime ve Asabiyyet teorisi doğrudan İBN-İ HALDUN''a aittir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  'Fatih Sultan Mehmet döneminde İstanbul''a gelerek Ayasofya Medresesi''nin ilk müderrisi olan, matematik ve astronomi alanındaki ''Fethiye'' adlı eseriyle bilinen Semerkantlı bilgin kimdir?',
  '{"options": ["Ali Kuşçu", "Uluğ Bey", "Kadızade-i Rumi", "Takiyüddin", "Mirim Çelebi"], "correctIndex": 0}'::jsonb,
  'Uluğ Bey''in öğrencisi olan ALİ KUŞÇU, Fatih''in davetiyle İstanbul''a gelmiş, Ayasofya Başmüderrisi olmuş ve Otlukbeli Zaferi''ne ithafen ''Fethiye'' adlı astronomi eserini Fatih''e sunmuştur.',
  'Uluğ Bey Semerkant''ta hükümdar ve rasathane kurucusudur; Fatih devrinde İstanbul''a gelip Ayasofya''da ders veren ise ALİ KUŞÇU''dur.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  1,
  '2024 yılı Ekim ayında düzenlenen 61. Antalya Altın Portakal Film Festivali''nde ''En İyi Film Ödülü''nü kazanan sinema filmi aşağıdakilerden hangisidir?',
  '{"options": ["Mukadderat", "Kuru Otlar Üstüne", "Balık Kraker", "Döngü", "Evcilik"], "correctIndex": 0}'::jsonb,
  '61. Antalya Altın Portakal Film Festivali''nde En İyi Film Ödülü''nü Nadim Güç''ün yönettiği ve başrolünde Nur Sürer''in oynadığı ''MUKADDERAT'' filmi kazanmıştır.',
  'Kuru Otlar Üstüne Nuri Bilge Ceylan''ın bir önceki festival filmidir; 61. Altın Portakal''ın En İyi Filmi ''Mukadderat''tır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  '2024 yılında 77. Cannes Film Festivali''nde jüri başkanlığını Greta Gerwig''in yaptığı yarışmada festivalin en büyük ödülü olan ''Altın Palmiye''yi (Palme d''Or) kazanan film hangisidir?',
  '{"options": ["Anora (Yönetmen: Sean Baker)", "All We Imagine as Light", "The Seed of the Sacred Fig", "Emilia Perez", "Anatomy of a Fall"], "correctIndex": 0}'::jsonb,
  '2024 Cannes Film Festivali''nde Altın Palmiye ödülü ABD''li yönetmen Sean Baker''ın yönettiği ''ANORA'' filmine verilmiştir.',
  'Anatomy of a Fall 2023 Altın Palmiye kazananıydı; 2024 yılı kazananı ''Anora''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Nuri Bilge Ceylan''ın ''Kuru Otlar Üstüne'' filmindeki ''Nuray'' rolüyle 2023 Cannes Film Festivali''nde ''En İyi Kadın Oyuncu'' ödülünü alarak Türkiye sinema tarihinde bu ödülü kazanan ilk kadın oyuncu kimdir?',
  '{"options": ["Merve Dizdar", "Nur Sürer", "Bihter Dinçel", "Demet Evgar", "Songül Öden"], "correctIndex": 0}'::jsonb,
  'MERVE DİZDAR, 76. Cannes Film Festivali''nde En İyi Kadın Oyuncu ödülünü kazanarak Türk sinemasında bir ilki başarmıştır.',
  'Türkiye''de daha önce Muzaffer Özdemir ve Mehmet Emin Toprak (Uzak filmiyle) En İyi Erkek Oyuncu ödülü almıştı; kadın oyuncu olarak ilk kazanan ise Merve Dizdar''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Avrupa Birliği tarafından ''2025 Avrupa Kültür Başkenti'' unvanı verilen iki Avrupa kenti hangi seçenekte doğru eşleştirilmiştir?',
  '{"options": ["Chemnitz (Almanya) — Nova Gorica (Slovenya)", "Bad Ischl (Avusturya) — Bodø (Norveç)", "Tartu (Estonya) — Veszprem (Macaristan)", "Oulu (Finlandiya) — Trenčín (Slovakya)", "Elefsina (Yunanistan) — Timisoara (Romanya)"], "correctIndex": 0}'::jsonb,
  '2024 yılı başkentleri Bad Ischl, Bodø ve Tartu idi. 2025 yılı Avrupa Kültür Başkentleri ise Almanya''nın CHEMNITZ ve Slovenya''nın NOVA GORICA kentleridir.',
  'Bad Ischl ve Bodø 2024 yılındaydı; 2025 başkentleri Chemnitz ve Nova Gorica''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Edebiyatta ''İnce Memed'', ''Yer Demir Gök Bakır'' ve ''Yaşar Ne Yaşar Ne Yaşamaz'' gibi başyapıtlarıyla tanınan, Türkiye''den Nobel Edebiyat Ödülü''ne ilk aday gösterilen büyük yazar kimdir?',
  '{"options": ["Yaşar Kemal", "Orhan Pamuk", "Ahmet Hamdi Tanpınar", "Sabahattin Ali", "Kemal Tahir"], "correctIndex": 0}'::jsonb,
  'Çukurova''yı ve Torosları destansı bir dille anlatan YAŞAR KEMAL, 1973''te Nobel Edebiyat Ödülü''ne Türkiye''den aday gösterilen ilk edebiyatçımızdır. (Nobel''i kazanan ilk ve tek yazarımız ise 2006''da Orhan Pamuk''tur).',
  'Ödülü ilk KAZANAN Orhan Pamuk''tur; Nobel''e ilk ADAY GÖSTERİLEN ise Yaşar Kemal''dir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Kurtuluş Savaşı yıllarını ilk elden anlatan, edebiyatımızda Kurtuluş Savaşı''nı işleyen ilk roman olan ''Ateşten Gömlek'' ve ''Vurun Kahpeye'' romanlarının yazarı kadın edebiyatçımız kimdir?',
  '{"options": ["Halide Edip Adıvar", "Fatma Aliye Hanım", "Şukufe Nihal", "Nezihe Muhiddin", "Samiha Ayverdi"], "correctIndex": 0}'::jsonb,
  'Milli Mücadele''de bizzat onbaşı ve üstçavuş rütbeleriyle görev yapan ve Sultanahmet Mitingi''ndeki tarihi konuşmasıyla bilinen HALİDE EDİP ADIVAR, ilk Kurtuluş Savaşı romanı ''Ateşten Gömlek''in yazarıdır.',
  'Fatma Aliye ilk kadın romancımızdır (50 TL banknotu üzerindedir); Ateşten Gömlek''in yazarı ise Halide Edip Adıvar''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Selçuklu ve Osmanlı tıp tarihinde akıl ve ruh hastalıklarının su sesi ve Türk musikisi makamlarıyla tedavi edildiği, 2004 yılında Avrupa Konseyi Müze Ödülü''nü alan tarihi şifahane nerededir?',
  '{"options": ["Edirne II. Bayezid Külliyesi Sağlık Müzesi", "Kayseri Gevher Nesibe Medresesi", "Sivas Divriği Şifahanesi", "Amasya Darüşşifası", "Bursa Yıldırım Darüşşifası"], "correctIndex": 0}'::jsonb,
  'Su sesi, musiki makamları ve güzel kokularla tedavi uygulayan ünlü şifahane EDİRNE II. BAYEZİD KÜLLİYESİ''dir (bugün Trakya Üniversitesi Sağlık Müzesi olarak hizmet vermektedir).',
  'Gevher Nesibe dünyadaki ilk tıp fakültesidir (Kayseri); Müzikle tedavi denince akla EDİRNE II. Bayezid Külliyesi gelir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Dünyanın bilinen ilk tıp fakültesi ve şifahanesi kabul edilen, 13. yüzyılda Anadolu Selçuklu Hükümdarı I. Gıyaseddin Keyhüsrev tarafından kız kardeşi adına Kayseri''de yaptırılan tarihi yapı hangisidir?',
  '{"options": ["Gevher Nesibe Medresesi ve Şifahanesi", "Melikgazi Türbesi", "Hunat Hatun Külliyesi", "Karatay Medresesi", "Çifte Minareli Medrese"], "correctIndex": 0}'::jsonb,
  'Kayseri''deki GEVHER NESİBE ŞİFAHANESİ VE MEDRESESİ, hem hasta tedavi edilen hem de hekim yetiştirilen dünyadaki ilk tıp okulu (fakültesi) niteliğindedir.',
  'Hunat Hatun da Kayseri''dedir ancak ilk tıp fakültesi ve müzesi Gevher Nesibe''dir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Gaziantep''te Fırat Nehri kıyısında yer alan antik kentten çıkarılan ve ''Çingene Kızı'' mozaiğiyle dünyaca ün kazanan dünyanın en büyük mozaik müzesi hangisidir?',
  '{"options": ["Zeugma Mozaik Müzesi", "Hatay Arkeoloji Müzesi", "Haleplibahçe Mozaik Müzesi (Şanlıurfa)", "Efes Müzesi", "Hierapolis Arkeoloji Müzesi"], "correctIndex": 0}'::jsonb,
  'Gaziantep''teki ZEUGMA MOZAİK MÜZESİ, kapalı alan ve mozaik büyüklüğü bakımından dünyanın en büyük mozaik müzeleri arasında yer alır ve simgesi ''Çingene Kızı'' mozaiğidir.',
  'Hatay ve Şanlıurfa''da da büyük mozaik müzeleri vardır ancak ''Çingene Kızı'' ve Zeugma doğrudan GAZİANTEP''tedir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Dünya mimarlık tarihinde merkezi ısıtma (kalorifer) sisteminin ve kanalizasyon altyapısının saray içinde kurulduğu ilk mimari yapı olarak bilinen Doğu Anadolu''daki şaheser hangisidir?',
  '{"options": ["Ağrı Doğubayazıt İshak Paşa Sarayı", "Kars Ani Kalesi", "Van Kalesi ve Sarayı", "Diyarbakır İçkale Sarayı", "Erzurum Paşa Sarayı"], "correctIndex": 0}'::jsonb,
  'Ağrı''nın Doğubayazıt ilçesinde bulunan İSHAK PAŞA SARAYI, duvarların içine döşenen sıcak su boruları ile ısıtılan dünyadaki İLK KALORİFERLİ SARAYDIR.',
  'Topkapı veya Dolmabahçe değil, dünyada kalorifer tesisatının ilk kullanıldığı saray Ağrı Doğubayazıt''taki İSHAK PAŞA SARAYI''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Osmanlı Devleti''nde ilk modern Türk tiyatrosunu (Güllü Agop Tiyatrosu / Osmanlı Tiyatrosu) kuran ve ilk yerli tiyatro eseri olan Şinasi''nin ''Şair Evlenmesi''ni sahneleyen tiyatro öncüsü kimdir?',
  '{"options": ["Güllü Agop (Agop Vartovyan)", "Muhsin Ertuğrul", "İsmail Dümbüllü", "Afife Jale", "Haldun Taner"], "correctIndex": 0}'::jsonb,
  'Gediktepe''de ilk düzenli Türkçe tiyatro oyunlarını sahneleyen ve Şinasi''nin Şair Evlenmesi piyesini oynayan tiyatro kurucusu GÜLLÜ AGOP''tur.',
  'Şair Evlenmesi''ni YAZAN Şinasi''dir; sahneleyen ve tiyatro topluluğunu kuran ise GÜLLÜ AGOP''tur.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türk sinema ve tiyatrosunda sahneye çıkan İLK MÜSLÜMAN TÜRK KADIN OYUNCU kimdir?',
  '{"options": ["Afife Jale", "Bedia Muvahhit", "Cahide Sonku", "Neyyire Neyir", "Türkan Şoray"], "correctIndex": 0}'::jsonb,
  '1920 yılında ''Tatlı Sır'' oyununda Emel rolüyle sahneye çıkan AFİFE JALE, tiyatro sahnesine adım atan ilk Müslüman Türk kadınıdır. (Bedia Muvahhit ise ilk sinema oyuncularımızdandır).',
  'Tiyatro sahnesine ilk çıkan = AFİFE JALE; Sinemada ilk rol alan kadın oyuncu = Bedia Muvahhit''tir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türk sinema tarihinin İLK KADIN FİLM YÖNETMENİ ve ilk kadın yapımcısı olan sinemacı kimdir?',
  '{"options": ["Cahide Sonku", "Türkan Şoray", "Bilge Olgaç", "Fatma Girik", "Lütfi Akad"], "correctIndex": 0}'::jsonb,
  '''Fedakar Ana'' (1949) filmiyle yönetmenlik koltuğuna oturan ve Sonku Film''i kuran CAHİDE SONKU, Türk sinemasının ilk kadın yönetmenidir.',
  'Türkan Şoray ve Bilge Olgaç da önemli kadın yönetmenlerdir ancak ''ilk kadın yönetmen'' unvanı CAHİDE SONKU''ya aittir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Cumhuriyet tarihinin 50 TL banknotunun arka yüzünde portresi yer alan, ilk Türk kadın felsefeci ve romancısı kabul edilen edebiyatçımız kimdir?',
  '{"options": ["Fatma Aliye Hanım", "Halide Edip Adıvar", "Afife Jale", "Sabiha Gökçen", "Suat Derviş"], "correctIndex": 0}'::jsonb,
  'Ahmet Cevdet Paşa''nın kızı olan FATMA ALİYE HANIM, ''Muhadarat'' romanının yazarı, ilk Türk kadın romancısıdır ve 50 TL banknotu arkasında yer alır.',
  '5 TL: Aydın Sayılı; 10 TL: Cahit Arf; 20 TL: Mimar Kemaleddin; 50 TL: FATMA ALİYE HANIM; 100 TL: Itri; 200 TL: Yunus Emre.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türk Klasik Musikisi''nin kurucusu sayılan, ''Segâh Tekbiri'' ve ''Salat-ı Ümmiye'' besteleriyle bilinen ve 100 TL''lik banknotun arka yüzünde portresi bulunan bestekâr kimdir?',
  '{"options": ["Buhurizade Mustafa Itri", "Dede Efendi", "Hacı Arif Bey", "Tamburi Cemil Bey", "Sadettin Kaynak"], "correctIndex": 0}'::jsonb,
  '100 TL''lik banknotun arka yüzünde portresi bulunan ve Segah Tekbiri bestekarı olan klasik musiki dehası BUHURİZADE MUSTAFA ITRİ''dir.',
  'Dede Efendi 19. yüzyıldır; Segah Tekbiri''nin bestecisi ve 100 TL üzerindeki isim ITRİ''dir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  '200 TL''lik banknotun arka yüzünde ''Sevelim sevilelim'' dizesiyle portresi yer alan, ''Risaletü''n-Nushiyye'' mesnevisiyle bilinen büyük mutasavvıf kimdir?',
  '{"options": ["Yunus Emre", "Mevlana Celaleddin-i Rumi", "Hacı Bektaş-ı Veli", "Ahi Evran", "Şeyh Edebali"], "correctIndex": 0}'::jsonb,
  '200 TL''lik en büyük banknotumuzun arkasında ''Sevelim sevilelim'' felsefesiyle tasavvuf şairimiz YUNUS EMRE yer alır.',
  'Mevlana ile Yunus Emre banknot konusunda karıştırılmamalıdır; banknotta YUNUS EMRE yer alır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  '20 TL''lik banknotun arka yüzünde portresi yer alan, ''Birinci Ulusal Mimarlık Akımı''nın öncülerinden olan ve Gazi Eğitim Enstitüsü binasının mimarı kimdir?',
  '{"options": ["Mimar Kemaleddin", "Vedat Tek", "Mimar Sinan", "Sedad Hakkı Eldem", "Seyfi Arkan"], "correctIndex": 0}'::jsonb,
  '20 TL banknotunun arkasında Birinci Ulusal Mimarlık akımının lideri MİMAR KEMALEDDİN yer almaktadır.',
  'Vedat Tek de Birinci Ulusal Mimarlık akımı mimarıdır (TBMM 2. bina); ancak banknotta resmi olan MİMAR KEMALEDDİN''dir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'UNESCO tarafından Somut Olmayan Kültürel Miras Temsili Listesi''ne Türkiye adına kaydedilen ve her yıl Edirne''de 650 yılı aşkın süredir düzenlenen ata sporu geleneği hangisidir?',
  '{"options": ["Kırkpınar Yağlı Güreş Festivali", "Geleneksel Türk Okçuluğu", "Atlı Cirit Oyunu", "Aba Güreşi", "Şalvar Güreşi"], "correctIndex": 0}'::jsonb,
  'Edirne Sarayiçi''nde her yaz düzenlenen TARİHİ KIRKPINAR YAĞLI GÜREŞLERİ, UNESCO Somut Olmayan Kültürel Miras Temsili Listesi''nde tescillidir.',
  'Cirit de geleneksel spordur ancak UNESCO tescilli en eski ata sporu festivalimiz KIRKPINAR''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türkiye''nin ilk kadın heykeltıraşı unvanına sahip olan ve Atatürk heykelleriyle tanınan sanatçı kimdir?',
  '{"options": ["Sabiha Bengütaş", "Füreya Koral", "Aliye Berger", "Mihri Müşfik Hanım", "Hale Asaf"], "correctIndex": 0}'::jsonb,
  'Sanayi-i Nefise Mektebi''nin heykel bölümünden mezun olan ve İtalya''da eğitim alan SABİHA BENGÜTAŞ, Türkiye''nin ilk kadın heykeltıraşıdır.',
  'Füreya Koral ilk kadın seramik sanatçımızdır; ilk kadın heykeltıraş ise SABİHA BENGÜTAŞ''tır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Türkiye''nin İLK KADIN SERAMİK SANATÇISI olan, Koret Seramik Atölyesi''ni kuran ve eserleri binaların duvar panolarında yer alan usta isim kimdir?',
  '{"options": ["Füreya Koral", "Sabiha Bengütaş", "Aliye Berger", "Fahrelnissa Zeid", "Tomris Uyar"], "correctIndex": 0}'::jsonb,
  'Şakir Paşa ailesine mensup olan ve modern Türk seramik sanatının öncüsü kabul edilen sanatçı FÜREYA KORAL''dır.',
  'İlk kadın ressam Mihri Müşfik, ilk gravür sanatçısı Aliye Berger, ilk seramik sanatçısı FÜREYA KORAL''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  2,
  'Edebiyatımızda ''Yedi Meşaleciler'' topluluğunun kurucuları arasında yer alan, ''Geçtiğim Yol'' şiir kitabı ve edebi araştırmalarıyla tanınan akademisyen kimdir?',
  '{"options": ["Ali Canip Yöntem", "Cevdet Kudret", "Vasfi Mahir Kocatürk", "Ziya Osman Saba", "Sabri Esat Siyavuşgil"], "correctIndex": 0}'::jsonb,
  '''Geçtiğim Yol'' adlı meşhur eserin sahibi Milli Edebiyat akımının ve Genç Kalemler dergisinin kurucusu ALİ CANİP YÖNTEM''dir.',
  'Ali Canip Yöntem Milli Edebiyat kurucularındandır; Ziya Osman Saba ise Yedi Meşaleciler''in şiire en sadık ismidir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '2024 yılında Venedik Uluslararası Film Festivali''nde en büyük ödül olan ''Altın Aslan''ı kazanan ''The Room Next Door'' (Yandaki Oda) filminin ünlü İspanyol yönetmeni kimdir?',
  '{"options": ["Pedro Almodóvar", "Alejandro Gonzalez Inarritu", "Guillermo del Toro", "Alfonso Cuaron", "Paolo Sorrentino"], "correctIndex": 0}'::jsonb,
  '81. Venedik Film Festivali''nde büyük ödül Altın Aslan''ı ilk kez İngilizce bir film çeken usta İspanyol yönetmen PEDRO ALMODÓVAR kazanmıştır.',
  'ÖSYM Venedik ve Cannes festivallerinin Altın Aslan ve Altın Palmiye yönetmenlerini doğrudan sorar. 2024 Venedik galibi Pedro Almodóvar''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'UNESCO tarafından 2023 yılı için vefatının 50. yıl dönümünde anma ve kutlama programına alınan büyük halk ozanımız kimdir?',
  '{"options": ["Aşık Veysel", "Neşet Ertaş", "Aşık Mahzuni Şerif", "Karacaoğlan", "Dadaloğlu"], "correctIndex": 0}'::jsonb,
  'UNESCO, vefatının 50. yıl dönümü münasebetiyle 2023 yılını ''AŞIK VEYSEL YILI'' olarak ilan etmiş ve tüm dünyada anma etkinlikleri düzenlenmiştir.',
  '2021 Yunus Emre, Ahi Evran ve Hacı Bektaş yılı idi; 2023 yılı ise UNESCO tarafından AŞIK VEYSEL yılı ilan edilmiştir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '11. yüzyılda Kaşgarlı Mahmud tarafından Abbasi Halifesi El-Muktedi Billah''a sunulan, Araplara Türkçe öğretmeyi amaçlayan ilk Türkçe sözlük ve ilk Türk dünyası haritasını içeren eser hangisidir?',
  '{"options": ["Divanu Lugati''t-Türk", "Kutadgu Bilig", "Atabetü''l-Hakayık", "Divan-ı Hikmet", "Muhakemetü''l-Lugateyn"], "correctIndex": 0}'::jsonb,
  'İlk Türkçe sözlük, ansiklopedi ve harita içeren eser KAŞGARLI MAHMUD''un kaleme aldığı DİVANU LUGATİ''T-TÜRK''tür.',
  'Muhakemetü''l-Lugateyn Ali Şir Nevai''nin Farsça ile Türkçeyi kıyasladığı eseridir; ilk sözlük ve harita ise Kaşgarlı Mahmud''un Divanu Lugati''t-Türk''üdür.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Yusuf Has Hacib tarafından Karahanlı Hükümdarı Tabgaç Buğra Han''a sunulan, Türk-İslam edebiyatının İLK SİYASETNAMESİ ve ilk mesnevisi kabul edilen başyapıt hangisidir?',
  '{"options": ["Kutadgu Bilig (Mutluluk Veren Bilgi)", "Divanu Lugati''t-Türk", "Siyasetname (Nizamülmülk)", "Risaletü''n-Nushiyye", "Kabusname"], "correctIndex": 0}'::jsonb,
  'YUSUF HAS HACİB''in 1069''da yazdığı KUTADGU BİLİG (Mutluluk Veren Bilgi); ilk Türkçe siyasetname, ilk aruz ölçüsü ve ilk mesnevi örneğimizdir.',
  'Nizamülmülk''ün Siyasetname''si Farsçadır; Türk-İslam edebiyatının İLK siyasetnamesi ise Karahanlılar dönemindeki KUTADGU BİLİG''dir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '2024 yılında 96. Oscar Ödülleri''nde ''En İyi Uluslararası Film'' ödülünü kazanan, Auschwitz toplama kampının komutanı Rudolf Höss''ün aile yaşamını konu alan sarsıcı film hangisidir?',
  '{"options": ["The Zone of Interest (İlgi Alanı)", "Society of the Snow (Kar Kardeşliği)", "Perfect Days", "Io Capitano", "The Teachers'' Lounge"], "correctIndex": 0}'::jsonb,
  'Jonathan Glazer''ın yönettiği ve En İyi Uluslararası Film Oscar''ını kazanan İngiltere yapımı başyapıt ''THE ZONE OF INTEREST''tir.',
  'Oppenheimer ''En İyi Film'' (ana kategori) kazandı; ''En İyi Uluslararası Film'' ödülünü ise The Zone of Interest kazandı.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Osmanlı döneminde saray ressamı olan, ''Kaplumbağa Terbiyecisi'' ve ''Silah Tacirleri'' tablolarıyla tanınan, aynı zamanda Sanayi-i Nefise Mektebi''nin ve İstanbul Arkeoloji Müzesi''nin kurucusu olan sanatçı kimdir?',
  '{"options": ["Osman Hamdi Bey", "Şeker Ahmet Paşa", "İbrahim Çallı", "Hoca Ali Rıza", "Hüseyin Avni Lifij"], "correctIndex": 0}'::jsonb,
  'Sayda kazılarında İskender Lahdi''ni bulan, Arkeoloji Müzesi''ni kuran ve Kaplumbağa Terbiyecisi''ni yapan deha OSMAN HAMDİ BEY''dir.',
  'İlk resim sergisini açan Şeker Ahmet Paşa''dır; müzeciliğin babası ve Kaplumbağa Terbiyecisi''nin ressamı ise OSMAN HAMDİ BEY''dir.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Türkiye''de çekilen İLK RENKLİ TÜRK FİLMİ olma özelliğine sahip olan ve Muhsin Ertuğrul tarafından 1953 yılında yönetilen film hangisidir?',
  '{"options": ["Halıcı Kız", "Susuz Yaz", "Ateşten Gömlek", "Bir Millet Uyanıyor", "Beyaz Geceler"], "correctIndex": 0}'::jsonb,
  'Muhsin Ertuğrul''un yönettiği 1953 yapımı ''HALICI KIZ'' filmi, Türk sinemasının ilk uzun metrajlı renkli filmidir.',
  'Susuz Yaz ilk uluslararası ödülü (Berlin Altın Ayı) alan filmdir; İLK RENKLİ Türk filmi ise HALICI KIZ''dır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Metin Erksan''ın yönettiği, 1964 Berlin Uluslararası Film Festivali''nde büyük ödül olan ''Altın Ayı''yı (Golden Bear) kazanarak Türk sinemasına ilk uluslararası büyük ödülü getiren film hangisidir?',
  '{"options": ["Susuz Yaz", "Yol", "Umut", "Halıcı Kız", "Kuru Otlar Üstüne"], "correctIndex": 0}'::jsonb,
  'Necati Cumalı''nın eserinden uyarlanan ve başrolünde Erol Taş ile Hülya Koçyiğit''in yer aldığı ''SUSUZ YAZ'' filmi, Berlin''de Altın Ayı kazanan ilk filmimizdir.',
  'Yol filmi Cannes Altın Palmiye kazanmıştır (1982); Berlin Altın Ayı kazanan ilk film ise SUSUZ YAZ''dır (1964).'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  'Cumhurbaşkanlığı Kültür ve Sanat Büyük Ödülleri''nde ''Edebiyat'' alanında ödüllendirilen, ''Bozkırın Tezenesi'' lakaplı büyük halk ozanı Neşet Ertaş''ın babası ve ustası olan halk ozanı kimdir?',
  '{"options": ["Muharrem Ertaş", "Aşık Veysel", "Davut Sulari", "Aşık Daimi", "Ali Ekber Çiçek"], "correctIndex": 0}'::jsonb,
  'Neşet Ertaş''ın ''Benim babam bu dünyada sazıyla sözüyle bir ekoldü'' dediği ustası ve Abdallık geleneğinin piri MUHARREM ERTAŞ''tır.',
  'Neşet Ertaş Bozkırın Tezenesidir; onun ustası ve babası MUHARREM ERTAŞ''tır.'
);

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
  'Kültür, Sanat ve Edebiyat',
  'multiple_choice',
  3,
  '2024 yılında hayatını kaybeden, ''Mihriban'', ''Hak Yol İslam Yazacağız'' ve ''Hasan''a Mektuplar'' gibi unutulmaz şiirlerin şairi olan Türk edebiyatının usta hiciv ve halk şairi kimdir?',
  '{"options": ["Abdurrahim Karakoç", "Sezai Karakoç", "Bahaettin Karakoç", "Cahit Zarifoğlu", "Erdem Bayazıt"], "correctIndex": 0}'::jsonb,
  '''Mihriban'' ve ''Hasan''a Mektuplar'' şiirlerinin şairi ABDURRAHİM KARAKOÇ''tur. (Monna Rosa''nın şairi Sezai Karakoç''tur).',
  'Sezai Karakoç = Monna Rosa; Abdurrahim Karakoç = Mihriban. Bu iki şair ÖSYM''nin en popüler tuzak ikilisidir.'
);


-- -------------------------------------------------------------
-- KONU 3: BILIM VE TEKNOLOJI GELIŞMELERI
-- -------------------------------------------------------------

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


-- -------------------------------------------------------------
-- KONU 4: SPOR VE OLIMPIYATLAR
-- -------------------------------------------------------------

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2024 Paris Yaz Olimpiyat Oyunları''nda 10 metre havalı tabanca karma takım kategorisinde Şevval İlayda Tarhan ile birlikte GÜMÜŞ MADALYA kazanarak Türkiye''ye atıcılık tarihindeki ilk olimpiyat madalyasını getiren ve ekipmansız doğal atış tarzıyla dünyada viral olan milli atıcımız kimdir?',
  '{"options": ["Yusuf Dikeç", "İsmail Keleş", "Mete Gazoz", "Ömer Faruk Planat", "Taha Akgül"], "correctIndex": 0}'::jsonb,
  '2024 Paris Olimpiyatları''nda özel lens veya kulaklık kullanmadan, eli cebinde rahat atış tarzıyla tüm dünyanın hayranlığını kazanan ve gümüş madalya alan atıcımız YUSUF DİKEÇ''tir.',
  'Yusuf Dikeç bu madalyayı Şevval İlayda Tarhan ile birlikte ''karma takım'' kategorisinde kazanmıştır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Almanya''da düzenlenen 2024 Avrupa Futbol Şampiyonası''nda (EURO 2024) finalde İngiltere''yi mağlup ederek şampiyonluğa ulaşan ve kupayı 4. kez müzesine götüren ülke hangisidir?',
  '{"options": ["İspanya", "Almanya", "Fransa", "İtalya", "Portekiz"], "correctIndex": 0}'::jsonb,
  'EURO 2024 finalinde İngiltere''yi 2-1 yenen İSPANYA, turnuvayı namağlup tamamlayarak 4. Avrupa şampiyonluğunu kazanmış ve turnuva tarihinin en çok kazanan takımı olmuştur.',
  'İngiltere üst üste ikinci kez finalde kaybetmiştir; şampiyon İSPANYA''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'UEFA tarafından resmi olarak açıklanan karara göre, 2032 Avrupa Futbol Şampiyonası (EURO 2032) hangi iki ülkenin ortak ev sahipliğinde düzenlenecektir?',
  '{"options": ["Türkiye ve İtalya", "İspanya ve Portekiz", "İngiltere ve İrlanda", "Almanya ve Avusturya", "Fransa ve Belçika"], "correctIndex": 0}'::jsonb,
  'UEFA İcra Komitesi, EURO 2032''nin TÜRKİYE ve İTALYA ortaklığıyla düzenleneceğini resmen duyurmuştur. (EURO 2028 ise Birleşik Krallık ve İrlanda''da yapılacaktır).',
  '2028 = İngiltere & İrlanda; 2032 = TÜRKİYE ve İTALYA''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2023 yılında FIVB Milletler Ligi (VNL) ve CEV Avrupa Voleybol Şampiyonası''nda altın madalya kazanarak dünya 1 numarası olan ''Filenin Sultanları'' Türkiye Kadın Voleybol Milli Takımı''nın başantrenörü kimdir?',
  '{"options": ["Daniele Santarelli", "Giovanni Guidetti", "Ferhat Akbaş", "Massimo Barbolini", "Vital Heynen"], "correctIndex": 0}'::jsonb,
  '2023 yılında göreve gelerek Türk kadın voleybol tarihine altın çağını yaşatan İtalyan başantrenör DANIELE SANTARELLI''dir.',
  'Guidetti VakıfBank ve eski milli takım hocasıydı; 2023 şampiyonluklarını getiren antrenör SANTARELLI''dir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2020 Tokyo Olimpiyatları''nda bireysel klasik yayda altın madalya alarak Türk okçuluk tarihinin ilk olimpiyat şampiyonu olan ve 2024 Paris''te erkek takımında bronz madalya kazanan okçumuz kimdir?',
  '{"options": ["Mete Gazoz", "Ulaş Berkim Tümer", "Abdullah Yıldırmış", "Göksel Taşçı", "Demir Elmaağaçlı"], "correctIndex": 0}'::jsonb,
  'Tokyo 2020 Olimpiyat Şampiyonu ve 2023 Berlin Dünya Şampiyonu olan milli okçumuz METE GAZOZ''dur.',
  'Ulaş Berkim Tümer ve Abdullah Yıldırmış Paris 2024''te Mete Gazoz ile birlikte takım bronz madalyası alan milli okçulardır; ilk altın Mete Gazoz''undur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Güreş kariyerinde 1 kez Olimpiyat Şampiyonluğu, 3 kez Dünya Şampiyonluğu ve 11 kez Avrupa Şampiyonluğu elde eden ve 2024 Paris Olimpiyatları''nda bronz madalya kazanarak aktif sporculuk hayatını noktalayan serbest stil efsane güreşçimiz kimdir?',
  '{"options": ["Taha Akgül", "Rıza Kayaalp", "Hamza Yerlikaya", "Yaşar Doğu", "Ali Cengiz"], "correctIndex": 0}'::jsonb,
  '125 kg serbest stilde dünyanın en başarılı güreşçilerinden biri olan TAHA AKGÜL, 2024 Paris Olimpiyatları''nda kürsüye çıkarak mindere veda etmiştir.',
  'Rıza Kayaalp grekoromen stildedir; serbest stilde 11 Avrupa şampiyonu olan ve 2024''te jübile yapan isim TAHA AKGÜL''dür.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Grekoromen güreşte 12. kez Avrupa Şampiyonu olarak efsanevi Rus güreşçi Aleksandr Karelin''in rekorunu egale eden Türk güreşçi kimdir?',
  '{"options": ["Rıza Kayaalp", "Taha Akgül", "Burhan Akbudak", "Cebi Selçuk", "Kerem Kamal"], "correctIndex": 0}'::jsonb,
  'Grekoromen 130 kiloda 12 Avrupa ve 5 Dünya şampiyonluğu bulunan milli güreşçimiz RIZA KAYAALP''tir.',
  'Karelin''in rekorunu kıran/egale eden grekoromen ağır sıklet Rıza Kayaalp''tir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2024 Paris Paralimpik Oyunları''nda yüzmede hem 50 metre serbest hem de 200 metre serbestte 2 ALTIN MADALYA birden kazanarak aynı olimpiyatta iki altın kazanan ilk Türk sporcu unvanını alan paralimpik yüzücümüz kimdir?',
  '{"options": ["Umut Ünlü", "Koral Berkin Kutlu", "Sevilay Öztürk", "Sümeyye Boyacı", "Turgut Aslanyar"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te S3 kategorisinde iki altın madalya birden alarak tarihe geçen yüzücümüz UMUT ÜNLÜ''dür.',
  'Sümeyye Boyacı ve Sevilay Öztürk de başarılı yüzücülerimizdir; Paris 2024''te 2 altın birden kazanan isim UMUT ÜNLÜ''dür.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Paralimpik Oyunları tarihinde Rio 2016, Tokyo 2020 ve Paris 2024''te üst üste ÜÇ KEZ PARALİMPİK ŞAMPİYONU olarak kırılması güç bir rekora imza atan milli takımımız hangisidir?',
  '{"options": ["Kadın Golbol (Goalball) Milli Takımı", "Tekerlekli Sandalye Basketbol Takımı", "Ampute Futbol Milli Takımı", "Kadın Voleybol Takımı", "Para Masa Tenisi Takımı"], "correctIndex": 0}'::jsonb,
  'Sevda Altunoluk liderliğindeki KADIN GOLBOL MİLLİ TAKIMIMIZ, üst üste 3 olimpiyatta (2016, 2020, 2024) altın madalya kazanarak dünya tarihine geçmiştir.',
  'Ampute futbol paralimpik branş değildir (Dünya ve Avrupa şampiyonumuzdur); Paralimpikte 3 kez üst üste şampiyon olan KADIN GOLBOL TAKIMIDIR.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Halter sporunda kendi vücut ağırlığının üç katından fazlasını kaldırabilen dünyadaki tek sporculardan olan, 1988 Seul, 1992 Barselona ve 1996 Atlanta''da üst üste 3 kez Olimpiyat Şampiyonu olan ''Cep Herkülü'' lakaplı efsane kimdir?',
  '{"options": ["Naim Süleymanoğlu", "Halil Mutlu", "Taner Sağır", "Sedat Artuç", "Daniyar İsmayilov"], "correctIndex": 0}'::jsonb,
  'Kırdığı 46 dünya rekoru ve Time dergisine kapak olan başarılarıyla ''Cep Herkülü'' NAİM SÜLEYMANOĞLU''dur.',
  'Halil Mutlu da 3 kez olimpiyat şampiyonudur (''Dinamit''); ''Cep Herkülü'' ise NAİM SÜLEYMANOĞLU''dur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Yaz Olimpiyat Oyunları''nda Türkiye''ye kadınlar boksta gümüş madalya kazandıran iki milli boksörümüz hangi seçenekte doğru verilmiştir?',
  '{"options": ["Buse Naz Çakıroğlu ve Hatice Akbaş", "Busenaz Sürmeneli ve Esra Yıldız", "Hatice Akbaş ve Şennur Demir", "Buse Naz Çakıroğlu ve Gizem Özer", "Elif Güneri ve Sema Çalışkan"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te kadınlar boksta 50 kg''da BUSE NAZ ÇAKIROĞLU ve 54 kg''da HATİCE AKBAŞ gümüş madalya kazanarak kürsüye çıkmışlardır.',
  'Busenaz Sürmeneli Tokyo 2020 şampiyonudur; Paris 2024''te gümüş madalya alan ikili Buse Naz Çakıroğlu ve Hatice Akbaş''tır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2026 FIFA Dünya Kupası, tarihte ilk kez 48 takımın katılımıyla hangi üç ülkenin ortak ev sahipliğinde düzenlenecektir?',
  '{"options": ["ABD — Kanada — Meksika", "İspanya — Portekiz — Fas", "Brezilya — Arjantin — Uruguay", "Almanya — İtalya — Fransa", "Suudi Arabistan — Katar — BAE"], "correctIndex": 0}'::jsonb,
  '2026 Dünya Kupası Kuzey Amerika kıtasında ABD, KANADA ve MEKSİKA ortaklığında gerçekleştirilecektir. (Meksika 3. kez ev sahipliği yapan ilk ülke olacaktır).',
  '2030 Dünya Kupası İspanya-Portekiz-Fas; 2034 Suudi Arabistan; 2026 ise ABD-Kanada-Meksika''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2028 Yaz Olimpiyat Oyunları hangi şehir ve ülkede düzenlenecektir?',
  '{"options": ["Los Angeles (ABD)", "Brisbane (Avustralya)", "Madrid (İspanya)", "Roma (İtalya)", "Tokyo (Japonya)"], "correctIndex": 0}'::jsonb,
  '2024 Paris''in ardından 2028 Yaz Olimpiyatları ABD''nin LOS ANGELES şehrinde düzenlenecektir. 2032 ise Avustralya''nın Brisbane kentindedir.',
  '2028 = Los Angeles; 2032 = Brisbane. Bu iki olimpiyat kenti sıklıkla seçeneklerde yer değiştirir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Modern Olimpiyat Oyunları''nda Türkiye adına güreş dışındaki bir branşta İLK ALTIN MADALYAYI kazandıran kadın sporcumuz kimdir?',
  '{"options": ["Nurcan Taylan (Halter)", "Nur Tatar (Tekvando)", "Busenaz Sürmeneli (Boks)", "Yasemin Adar (Güreş)", "Süreyya Ayhan (Atletizm)"], "correctIndex": 0}'::jsonb,
  '2004 Atina Olimpiyatları''nda 48 kiloda altın madalya kazanan halterci NURCAN TAYLAN, olimpiyatlarda altın madalya kazanan İLK TÜRK KADIN SPORCUDUR.',
  'İlk kadın olimpiyat şampiyonumuz NURCAN TAYLAN''dır (2004 Atina Halter). Boksör Busenaz Sürmeneli 2020 Tokyo''da şampiyon olmuştur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türk spor tarihinde hem A Milli Futbol Takımı''nda hem de A Milli Basketbol Takımı''nda forma giyen, Fenerbahçe ve Fiorentina efsanesi olan ''Sinyor'' lakaplı sporcu kimdir?',
  '{"options": ["Can Bartu", "Lefter Küçükandonyadis", "Metin Oktay", "Hakkı Yeten", "Süleyman Seba"], "correctIndex": 0}'::jsonb,
  'Hem futbolda hem basketbolda milli formayı giyen, İtalya''da Fiorentina ile Avrupa Kupa Galipleri Kupası finalinde oynayan tek sporcumuz CAN BARTU''dur.',
  'Ordinaryüs Lefter Küçükandonyadis; Taçsız Kral Metin Oktay; ''Sinyor'' ve iki branşta milli olan isim ise CAN BARTU''dur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Avrupa kupalarında (UEFA Kupası ve UEFA Süper Kupa) şampiyonluk kazanan İLK VE TEK TÜRK FUTBOL TAKIMI hangisidir?',
  '{"options": ["Galatasaray", "Fenerbahçe", "Beşiktaş", "Trabzonspor", "Başakşehir"], "correctIndex": 0}'::jsonb,
  '17 Mayıs 2000''de Arsenal''i yenerek UEFA Kupası''nı, ardından Real Madrid''i yenerek UEFA Süper Kupa''yı kazanan takım GALATASARAY''dır.',
  'Avrupa''da kupa kaldıran tek Türk takımı Galatasaray''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türkiye''de 1905 yılında kurulan İLK TÜRK FUTBOL KULÜBÜ hangisidir?',
  '{"options": ["Galatasaray", "Beşiktaş Jimnastik Kulübü", "Fenerbahçe", "Altay", "Karşıyaka"], "correctIndex": 0}'::jsonb,
  'Ali Sami Yen ve arkadaşları tarafından Mekteb-i Sultani''de 1905''te kurulan GALATASARAY ilk Türk futbol kulübüdür. (1903''te kurulan Beşiktaş ilk spor/jimnastik kulübüdür; futbol şubesi daha sonra açılmıştır).',
  'İlk jimnastik kulübü Beşiktaş (1903); İlk FUTBOL KULÜBÜ ise Galatasaray''dır (1905).'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Paralimpik Oyunları''nda Para Okçuluk Makaralı Yay Karma Takım kategorisinde Sadık Savaş ile birlikte altın madalya kazanan dünya rekortmeni kadın okçumuz kimdir?',
  '{"options": ["Öznur Cüre Girdi", "Gizem Girişmen", "Yağmur Şengül", "Merve Nur Eroğlu", "Büşra Ün"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te dünya rekoru kırarak altın madalyaya uzanan para okçumuz ÖZNUR CÜRE GİRDİ''dir.',
  'Gizem Girişmen 2008 Pekin şampiyonudur; Paris 2024 altın madalyası Öznur Cüre Girdi''ye aittir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Tekvando branşında 2012 Londra Olimpiyatları''nda altın madalya kazanarak Türk tekvando tarihinin ilk erkek olimpiyat şampiyonu olan sporcumuz kimdir?',
  '{"options": ["Servet Tazegül", "Bahri Tanrıkulu", "Hakan Reçber", "Rıza Doğangün", "Emre Kutalmış Ateşli"], "correctIndex": 0}'::jsonb,
  '2012 Londra''da fırtına gibi eserek altın madalya kazanan ve adına tekvando salonları açılan sporcumuz SERVET TAZEGÜL''dür.',
  'Hakan Reçber Tokyo 2020 bronz madalyalıdır; ilk altın madalyalı tekvandocumuz SERVET TAZEGÜL''dür.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Kadın güreşinde Türkiye''ye TARİHİN İLK DÜNYA ŞAMPİYONLUĞUNU ve ilk olimpiyat madalyasını (Tokyo 2020 bronz) kazandıran, 7 kez Avrupa Şampiyonu olan efsane kadın güreşçimiz kimdir?',
  '{"options": ["Yasemin Adar Yiğit", "Buse Tosun Çavuşoğlu", "Evin Demirhan", "Zeynep Yetgil", "Elif Jale Yeşilırmak"], "correctIndex": 0}'::jsonb,
  'Türk kadın güreşinin öncüsü olan ve 2017''de Paris''te ilk dünya şampiyonluğunu kazanan sporcumuz YASEMİN ADAR YİĞİT''tir.',
  'Buse Tosun Çavuşoğlu 2023 Dünya Şampiyonu ve 2024 Paris bronz madalyalıdır; kadın güreşinde İLK yolu açan ve ilk dünya şampiyonu olan YASEMİN ADAR''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyatları''nda kadınlar güreş 68 kiloda mindere çıkarak bronz madalya kazanan ve 2023 Dünya Şampiyonu olan milli güreşçimiz kimdir?',
  '{"options": ["Buse Tosun Çavuşoğlu", "Yasemin Adar Yiğit", "Evin Demirhan", "Nesrin Baş", "Zeynep Yetgil"], "correctIndex": 0}'::jsonb,
  'Kadınlar 68 kg''da Paris 2024''te bronz madalya kazanan güreşçimiz BUSE TOSUN ÇAVUŞOĞLU''dur.',
  '76 kg Yasemin Adar; 68 kg Buse Tosun Çavuşoğlu''dur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyatları''nda erkekler klasik yay takımında bronz madalya alarak Türkiye''ye takım okçuluk tarihindeki ilk olimpiyat madalyasını kazandıran üçlü milli kadro hangi seçenektir?',
  '{"options": ["Mete Gazoz — Ulaş Berkim Tümer — Abdullah Yıldırmış", "Mete Gazoz — Samet Ak — Efe Çırış", "Mete Gazoz — Bilal Gürkaynak — Ali Aydın", "Ulaş Berkim Tümer — Göksel Taşçı — Demir Elmaağaçlı", "Mete Gazoz — Muhammed Abdullah — Kerem Özmen"], "correctIndex": 0}'::jsonb,
  'Tarihi bronz madalyayı kazanan Klasik Yay Erkek Takımımız METE GAZOZ, ULAŞ BERKİM TÜMER ve ABDULLAH YILDIRMIŞ''tan oluşmuştur.',
  'Mete Gazoz''un yanındaki genç takım arkadaşları Ulaş Berkim Tümer ve Abdullah Yıldırmış''tır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türkiye Ampute Futbol Milli Takımı; 2022 yılında İstanbul''da düzenlenen Dünya Kupası finalinde hangi ülkeyi yenerek DÜNYA ŞAMPİYONU olmuştur?',
  '{"options": ["Angola", "İspanya", "Polonya", "Brezilya", "İngiltere"], "correctIndex": 0}'::jsonb,
  'Nef Stadyumu''nda oynanan tarihi finalde Türkiye, Angola''yı 4-1 mağlup ederek Ampute Futbol Dünya Kupası''nı kazanmıştır.',
  '2018''de Angola''ya penaltılarla kaybedilmişti; 2022''de rövanş alınarak ANGOLA mağlup edilmiş ve şampiyon olunmuştur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyatları''nda 10 metre havalı tabanca karma takımında Yusuf Dikeç ile birlikte gümüş madalya alarak kürsüye çıkan kadın milli atıcımız kimdir?',
  '{"options": ["Şevval İlayda Tarhan", "Damla Köse", "Elif Beyza Malkoç", "Rüveyda Gülsüm", "Yasemin Ecem Anagöz"], "correctIndex": 0}'::jsonb,
  'Kulaklıklı ve saçındaki Türk bayraklı bandanasıyla kararlı atışlar yapan ve Yusuf Dikeç''in partneri olan genç milli atıcımız ŞEVVAL İLAYDA TARHAN''dır.',
  'Yusuf Dikeç tek başına yarışmamıştır; karma takımda ŞEVVAL İLAYDA TARHAN ile birlikte gümüş madalya kazanmıştır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Basketbolda 2024-2025 sezonu itibarıyla NBA''de Houston Rockets formasıyla gösterdiği ''Triple-Double'' performanslarıyla adından söz ettiren ve All-Star seçilme başarısı gösteren Türk pivot kimdir?',
  '{"options": ["Alperen Şengün", "Cedi Osman", "Furkan Korkmaz", "Ömer Faruk Yurtseven", "Ersan İlyasova"], "correctIndex": 0}'::jsonb,
  'Houston Rockets formasıyla olağanüstü pas yeteneği ve pota altı dominasyonuyla NBA''in en parlak genç yıldızları arasına giren ALPEREN ŞENGÜN''dür.',
  'Hidayet Türkoğlu ve Mehmet Okur eski nesildir; günümüzün NBA süperstarı ALPEREN ŞENGÜN''dür.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Dünya serbest dalış rekortmeni olan, tek nefeste paletsiz ve değişken ağırlıklı kategorilerde kırdığı rekorlarla tanınan ''Sualtı Perisi'' lakaplı kadın milli sporcumuz kimdir?',
  '{"options": ["Şahika Ercümen", "Derya Can", "Fatma Uruk", "Merve Çoban", "İlke Özyüksel"], "correctIndex": 0}'::jsonb,
  'Antarktika''da dalış yapan ilk Türk kadın sporcu olan ve 100 metreyi aşan dalış rekorlarına imza atan sporcumuz ŞAHİKA ERCÜMEN''dir.',
  'Derya Can da başarılı bir dalgıçtır; ancak Antarktika dalışı ve 100+ metre rekorlarıyla tanınan isim ŞAHİKA ERCÜMEN''dir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyat Oyunları''nın açılış töreni olimpiyatlar tarihinde bir ilk olarak bir stadyumda değil, şehrin hangi ünlü nehrinde tekneler üzerinde yapılmıştır?',
  '{"options": ["Sen (Seine) Nehri", "Ren Nehri", "Tuna Nehri", "Thames Nehri", "Tiber Nehri"], "correctIndex": 0}'::jsonb,
  'Paris 2024 Olimpiyatları''nın açılış töreni stadyum dışında, SEN NEHRİ üzerinde 85 teknelik geçit töreniyle açık havada yapılmıştır.',
  'Paris''in içinden geçen nehir SEN (Seine) nehridir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türkiye Milli Olimpiyat Komitesi''nin (TMOK) kurucusu olan ve Türkiye''nin ilk spor dergisini (İdman) çıkaran, ''Beden Terbiyesi'' dersinin okullara girmesini sağlayan spor adamı kimdir?',
  '{"options": ["Selim Sırrı Tarcan", "Ali Sami Yen", "Şeref Bey", "Burhan Felek", "Sinan Erdem"], "correctIndex": 0}'::jsonb,
  'Türkiye Milli Olimpiyat Komitesi''nin kurucusu ve Türk sporunun babası SELİM SIRRI TARCAN''dır.',
  'Ali Sami Yen GS kurucusudur; Türkiye Milli Olimpiyat Komitesi''nin kurucusu SELİM SIRRI TARCAN''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Modern Pentatlon branşında Türkiye''yi olimpiyatlarda temsil eden İLK TÜRK SPORCU olan ve Tokyo 2020''de olimpiyat 5.si olan kadın sporcumuz kimdir?',
  '{"options": ["İlke Özyüksel", "Büşra Ün", "Busenaz Sürmeneli", "Yasemin Can", "Meryem Akdağ"], "correctIndex": 0}'::jsonb,
  'Yüzme, eskrim, binicilik, koşu ve atıcılıktan oluşan modern pentatlonda dünya rekorları kıran öncü sporcumuz İLKE ÖZYÜKSEL''dir.',
  'Modern Pentatlon denince tek bir isim akla gelir: İLKE ÖZYÜKSEL.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Paralimpik Oyunları''nda Para Tekvando kadınlar 47 kiloda ALTIN MADALYA kazanan milli sporcumuz kimdir?',
  '{"options": ["Mahmut Bozteke", "Gamze Gürdal", "Meryem Betül Çavdar", "Feryal Özel", "Şeyma Nur Emeksiz"], "correctIndex": 0}'::jsonb,
  'Para tekvandoda Mahmut Bozteke erkeklerde altın madalya kazanırken, kadınlar K44 57 kg''da Feryal/Gamze mücadele etmiş; MAHMUT BOZTEKE tarihi altın madalyayı boynuna takmıştır.',
  'Para tekvandoda Türkiye ilk kez olimpiyat altını kazanmıştır; erkeklerde Mahmut Bozteke şampiyon olmuştur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye''nin olimpiyat tarihindeki İLK MADALYASINI (Bronz) 1936 Berlin Olimpiyatları''nda kazanan güreşçimiz kimdir?',
  '{"options": ["Ahmet Kireççi (Mersinli Ahmet)", "Yaşar Erkan", "Gazanfer Bilge", "Celal Atik", "Nasuh Akar"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin olimpiyatlardaki İLK MADALYASINI (Bronz) Mersinli AHMET KİREÇÇİ kazanmıştır. (Aynı olimpiyatta birkaç gün sonra Yaşar Erkan İLK ALTIN madalyayı kazanmıştır).',
  'ÖSYM''nin en meşhur tuzağı: İlk MADALYA (Bronz) = Ahmet Kireççi; İlk ALTIN MADALYA = Yaşar Erkan''dır!'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye''nin olimpiyat tarihindeki İLK ALTIN MADALYASINI 1936 Berlin Olimpiyatları''nda grekoromen güreşte kazanan efsane sporcumuz kimdir?',
  '{"options": ["Yaşar Erkan", "Ahmet Kireççi", "Yaşar Doğu", "Hamza Yerlikaya", "Mehmet Oktav"], "correctIndex": 0}'::jsonb,
  '1936 Berlin''de Türk bayrağını göndere çektirip İstiklal Marşı''mızı ilk kez çaldıran İLK ALTIN MADALYALI olimpiyat şampiyonumuz YAŞAR ERKAN''dır.',
  'İlk madalya = Ahmet Kireççi; İlk ALTIN = YAŞAR ERKAN''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  '17 yaşında 1993 yılında Büyükler Dünya Güreş Şampiyonu olarak FILA tarafından ''Asrın Güreşçisi'' unvanı verilen ve 1996 Atlanta ile 2000 Sidney''de iki altın olimpiyat madalyası kazanan güreşçimiz kimdir?',
  '{"options": ["Hamza Yerlikaya", "Mahmut Demir", "Harun Doğan", "Nazmi Avluca", "Şeref Eroğlu"], "correctIndex": 0}'::jsonb,
  'FILA (Dünya Güreş Birliği) tarafından ''Asrın Güreşçisi'' ilan edilen isim HAMZA YERLİKAYA''dır.',
  'Yüzyılın Haltercisi Naim Süleymanoğlu; Asrın Güreşçisi HAMZA YERLİKAYA''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Avrupa Voleybol Konfederasyonu (CEV) Şampiyonlar Ligi''ni kadınlarda EN ÇOK KAZANAN (6 kez) ve aynı zamanda FIVB Kadınlar Kulüpler Dünya Şampiyonası''nı en çok kazanan Türk voleybol kulübü hangisidir?',
  '{"options": ["VakıfBank", "Eczacıbaşı", "Fenerbahçe", "Galatasaray", "Türk Hava Yolları"], "correctIndex": 0}'::jsonb,
  'Guinness Rekorlar Kitabı''na giren üst üste galibiyet serisi ve 6 CEV Şampiyonlar Ligi zaferiyle kadın voleybolunun zirvesi VAKIFBANK''tır.',
  'Eczacıbaşı ilk şampiyon kulüptür; en çok kazanan ve rekorlar kıran kulüp VAKIFBANK''tır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  '2024 Paris Olimpiyatları''nda 57 kg boks kategorisinde mücadele ederek bronz madalya kazanan kadın milli boksörümüz kimdir?',
  '{"options": ["Esra Yıldız Kahraman", "Buse Naz Çakıroğlu", "Hatice Akbaş", "Busenaz Sürmeneli", "Gizem Özer"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te kadınlar 57 kiloda yarı finale yükselerek bronz madalya kazanan boksörümüz ESRA YILDIZ KAHRAMAN''dır.',
  'Gümüşler: Buse Naz Çakıroğlu ve Hatice Akbaş; Bronz: Esra Yıldız Kahraman''dır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye Futbol Federasyonu (TFF) resmi olarak kaç yılında kurulmuş ve FIFA''ya hangi yıl üye olmuştur?',
  '{"options": ["1923 yılında kuruldu — 1923 yılında FIFA''ya üye oldu", "1905 yılında kuruldu — 1920''de üye oldu", "1938 yılında kuruldu — 1954''te üye oldu", "1924 yılında kuruldu — 1928''de üye oldu", "1914 yılında kuruldu — 1930''da üye oldu"], "correctIndex": 0}'::jsonb,
  'TFF, 1923 yılında ''Futbol Heyet-i Müttehidesi'' adıyla kurulmuş ve aynı yıl 21 Mayıs 1923''te FIFA''nın 26. üyesi olmuştur.',
  'TFF Cumhuriyet ile yaşıttır: 1923''te kurulmuş ve aynı yıl FIFA''ya girmiştir.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye A Milli Futbol Takımı, tarihinde İLK RESMİ MAÇINI 26 Ekim 1923''te İstanbul Taksim Stadı''nda hangi ülkeye karşı oynamış ve 2-2 berabere kalmıştır?',
  '{"options": ["Romanya", "Yunanistan", "Bulgaristan", "Macaristan", "Rusya"], "correctIndex": 0}'::jsonb,
  'Türkiye milli futbol takımı ilk resmi karşılaşmasını 26 Ekim 1923''te ROMANYA ile oynamış ve milli takımın tarihteki ilk golünü Zeki Rıza Sporel atmıştır.',
  'İlk milli maç Romanya ile yapılmıştır ve ilk golü Zeki Rıza Sporel atmıştır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Olimpiyat Oyunları bayrağında yer alan 5 iç içe geçmiş halkanın renkleri ve temsil ettiği 5 kıta değerlendirildiğinde aşağıdakilerden hangisi bu renklerden biri DEĞİLDİR?',
  '{"options": ["Turuncu", "Mavi", "Sarı", "Siyah", "Yeşil"], "correctIndex": 0}'::jsonb,
  'Olimpiyat halkalarının 5 rengi vardır: Mavi (Avrupa), Sarı (Asya), Siyah (Afrika), Yeşil (Okyanusya) ve Kırmızı (Amerika). Turuncu renk olimpiyat halkalarında YOKTUR.',
  'Olimpiyat halkalarında TURUNCU veya MOR yoktur; Mavi, Sarı, Siyah, Yeşil, Kırmızı vardır.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  '2024 Paris Olimpiyatları''nda madalya sıralamasında 40 altın madalyayla zirveyi paylaşan iki süper güç ülke hangileridir?',
  '{"options": ["Amerika Birleşik Devletleri (ABD) ve Çin", "ABD ve Fransa", "Çin ve Japonya", "Büyük Britanya ve Avustralya", "ABD ve Almanya"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te hem ABD hem Çin 40''ar altın madalya kazanmış; toplam madalya sayısı daha fazla olan ABD (126 madalya) olimpiyat lideri olmuştur.',
  'Altın sayısı eşittir (40-40); toplam madalya sayısı ile ABD birinci olmuştur.'
);

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
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Dünya güreş tarihinde ''Yenilmeyen Türk'' olarak tanınan, Amerika ve Avrupa turnelerinde tüm rakiplerini tuş eden ve 1898''de La Bourgogne gemisinin batması sonucu Atlas Okyanusu''nda boğularak vefat eden efsanevi Türk pehlivanı kimdir?',
  '{"options": ["Koca Yusuf", "Adalı Halil", "Kel Aliço", "Filiz Nurullah", "Kurtdereli Mehmet Pehlivan"], "correctIndex": 0}'::jsonb,
  'Dünyada ''Terrible Turk'' (Korkunç Türk) lakabıyla tanınan ve mindere çıkan en güçlü pehlivan sayılan KOCA YUSUF, Amerika dönüşü batan gemide hayatını kaybetmiştir.',
  '''Güreşirken arkamda Türk milletinin bulunduğunu düşünürüm'' diyen Kurtdereli''dir; Atlas Okyanusu''nda vefat eden ''Yenilmeyen Türk'' ise KOCA YUSUF''tur.'
);


-- -------------------------------------------------------------
-- KONU 5: UNESCO MIRAS LISTESI
-- -------------------------------------------------------------

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


-- -------------------------------------------------------------
-- KONU 6: ÖNEMLI GÜNLER VE ZIRVELER
-- -------------------------------------------------------------

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  'NATO liderlerinin 2024 Washington Zirvesi''nde aldığı tarihi kararla, 2026 yılı NATO Devlet ve Hükümet Başkanları Zirvesi hangi ülkede ve şehirde düzenlenecektir?',
  '{"options": ["Türkiye / Ankara", "Hollanda / Lahey", "İspanya / Madrid", "Belçika / Brüksel", "İngiltere / Londra"], "correctIndex": 0}'::jsonb,
  'NATO''nun 75. yıl zirvesinde alınan kararla, 2025 Zirvesi Hollanda''nın Lahey kentinde; 2026 NATO Zirvesi ise TÜRKİYE''nin başkenti ANKARA''da gerçekleştirilecektir.',
  '2025 = Lahey (Hollanda); 2026 = ANKARA (Türkiye). Bu iki ev sahibi ÖSYM''nin en garanti soru adayıdır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  '2025 yılı G20 Liderler Zirvesi Dönem Başkanlığı hangi ülkededir?',
  '{"options": ["Güney Afrika Cumhuriyeti", "Brezilya", "Hindistan", "Endonezya", "ABD"], "correctIndex": 0}'::jsonb,
  'G20 Liderler Zirvesi 2023''te Hindistan''da, 2024''te Brezilya''da (Rio) toplanmış; 2025 dönem başkanlığını ise GÜNEY AFRİKA CUMHURİYETİ devralmıştır.',
  '2024 Brezilya; 2025 GÜNEY AFRİKA; 2026 ABD.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  'Kasım 2024''te Birleşmiş Milletler İklim Değişikliği Konferansı''na (COP29) ev sahipliği yapan kardeş ülke hangisidir?',
  '{"options": ["Azerbaycan (Bakü)", "Birleşik Arap Emirlikleri (Dubai)", "Brezilya (Belém)", "Mısır (Şarm El-Şeyh)", "Kazakistan (Astana)"], "correctIndex": 0}'::jsonb,
  'COP29 İklim Zirvesi 11-22 Kasım 2024''te AZERBAYCAN''ın başkenti BAKÜ''de düzenlenmiştir.',
  'COP28 Dubai; COP29 BAKÜ; COP30 ise Brezilya''dır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  '2025 yılında düzenlenecek olan Birleşmiş Milletler İklim Değişikliği 30. Taraflar Konferansı (COP30) Amazon ormanlarının kapısı sayılan hangi şehirde yapılacaktır?',
  '{"options": ["Belém (Brezilya)", "Rio de Janeiro (Brezilya)", "Bakü (Azerbaycan)", "Doha (Katar)", "Sidney (Avustralya)"], "correctIndex": 0}'::jsonb,
  '2025 COP30 İklim Zirvesi, yağmur ormanlarının korunmasına dikkat çekmek amacıyla Brezilya''nın BELÉM kentinde düzenlenecektir.',
  'COP30 Brezilya''nın Belém kentindedir; Rio de Janeiro ile karıştırılmamalıdır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  'Türkiye''de Cumhurbaşkanlığı genelgesiyle ''2024 Yılı'' ne yılı olarak ilan edilmiştir?',
  '{"options": ["Emekliler Yılı", "Aşık Veysel Yılı", "Yunus Emre Yılı", "Gönüllülük Yılı", "İstiklal Marşı Yılı"], "correctIndex": 0}'::jsonb,
  'Cumhurbaşkanı Recep Tayyip Erdoğan tarafından 2024 yılı ''EMEKLİLER YILI'' olarak ilan edilmiştir.',
  '2021 Yunus Emre & İstiklal Marşı yılıydı; 2023 Aşık Veysel yılıydı; 2024 ise EMEKLİLER YILI ilan edilmiştir.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  'Uluslararası Türk Kültürü Teşkilatı (TÜRKSOY) tarafından 2024 yılı, 300. doğum yılı münasebetiyle hangi büyük Türkmen şair ve düşünürünün yılı ilan edilmiştir?',
  '{"options": ["Mahtumkulu Firaki Yılı", "Abay Kunanbayev Yılı", "Nizami Gencevi Yılı", "Cengiz Aytmatov Yılı", "Ali Şir Nevai Yılı"], "correctIndex": 0}'::jsonb,
  'TÜRKSOY, Türkmen edebiyatının kurucusu MAHTUMKULU FİRAKİ''nin 300. doğum yılı vesilesiyle 2024 yılını ''Mahtumkulu Firaki Yılı'' ilan etmiştir.',
  '2024 TÜRKSOY anma yılı MAHTUMKULU FİRAKİ''dir (Anev de kültür başkentidir).'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  'Birleşmiş Milletler Genel Kurulu tarafından kabul edilen İnsan Hakları Evrensel Beyannamesi''nin kabul tarihi olan 10 Aralık günü her yıl dünyada ne olarak kutlanır?',
  '{"options": ["Dünya İnsan Hakları Günü", "Dünya Barış Günü", "Dünya Mülteciler Günü", "Uluslararası Hoşgörü Günü", "Dünya Demokrasi Günü"], "correctIndex": 0}'::jsonb,
  '10 Aralık 1948''de kabul edilen İnsan Hakları Evrensel Beyannamesi anısına her yıl 10 Aralık ''DÜNYA İNSAN HAKLARI GÜNÜ'' olarak kutlanır.',
  '10 Aralık İnsan Hakları Günüdür; 1 Eylül Dünya Barış Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  'Türkiye''de 5 Aralık 1934 tarihinde Anayasa değişikliği ile Türk kadınlarına milletvekili seçme ve seçilme hakkı tanınması dolayısıyla her yıl 5 Aralık günü ne olarak kutlanmaktadır?',
  '{"options": ["Dünya Kadın Hakları Günü", "Dünya Emekçi Kadınlar Günü", "Kadına Yönelik Şiddete Karşı Uluslararası Mücadele Günü", "Anneler Günü", "Uluslararası Kız Çocukları Günü"], "correctIndex": 0}'::jsonb,
  '5 Aralık, Türkiye''de kadınlara genel seçimlerde seçme ve seçilme hakkının verildiği gün olup DÜNYA KADIN HAKLARI GÜNÜ olarak anılır.',
  '8 Mart = Dünya Emekçi Kadınlar Günü; 5 Aralık = Türk Kadınına Seçme-Seçilme Hakkının Verildiği Dünya Kadın Hakları Günü''dür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  '2024 yılında 50. G7 Liderler Zirvesi, Katolik dünyasının ruhani lideri Papa Franciscus''un da yapay zeka oturumuna ilk kez katıldığı hangi Akdeniz ülkesinde (Puglia) düzenlenmiştir?',
  '{"options": ["İtalya", "Fransa", "Almanya", "Japonya", "Kanada"], "correctIndex": 0}'::jsonb,
  '50. G7 Zirvesi İtalya Başbakanı Giorgia Meloni ev sahipliğinde İTALYA''nın Puglia bölgesindeki Borgo Egnazia tesislerinde toplanmıştır.',
  '2024 G7 İtalya''da yapılmıştır; 2025 G7 Zirvesi ise Kanada''da yapılacaktır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  1,
  '2024 yılı Ekim ayında Rusya''nın Tataristan Özerk Cumhuriyeti''nin başkenti Kazan''da düzenlenen 16. Liderler Zirvesi hangi uluslararası topluluğa aittir?',
  '{"options": ["BRICS", "G20", "ŞİÖ", "BDT (Bağımsız Devletler Topluluğu)", "Avrasya Ekonomik Birliği"], "correctIndex": 0}'::jsonb,
  'Kazan''da toplanan ve yeni üyelerin ilk kez tam katılım gösterdiği 16. Liderler Zirvesi BRICS Zirvesi''dir.',
  'Kazan Zirvesi BRICS''in tarihi genişleme zirvesidir.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Birleşmiş Milletler (BM) tarafından ''2024 Yılı'' tüm dünyada hangi hayvan türünün ekosistem ve gıda güvenliğindeki önemine dikkat çekmek için tematik yıl ilan edilmiştir?',
  '{"options": ["Uluslararası Devegiller (Camelids) Yılı", "Uluslararası Arıcılık Yılı", "Uluslararası Deniz Kaplumbağaları Yılı", "Uluslararası Balıkçılık Yılı", "Uluslararası Kuş Göçleri Yılı"], "correctIndex": 0}'::jsonb,
  'BM Genel Kurulu, deve, lama ve alpakaların kurak bölgelerdeki rolü nedeniyle 2024 yılını ''ULUSLARARASI DEVEGİLLER YILI'' ilan etmiştir.',
  'BM 2024 teması Uluslararası Devegiller (Camelids) Yılı''dır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Birleşmiş Milletler tarafından ''2025 Yılı'' küresel düzeyde hangi iki alana dikkat çekmek için tematik yıl olarak kabul edilmiştir?',
  '{"options": ["Uluslararası Kooperatifler Yılı ve Uluslararası Buzulların Korunması Yılı", "Uluslararası Ormanlar ve Su Yılı", "Uluslararası Yapay Zeka ve Çip Yılı", "Uluslararası Yenilenebilir Enerji Yılı", "Uluslararası Göçmenler Yılı"], "correctIndex": 0}'::jsonb,
  'BM Genel Kurulu, 2025 yılını hem ''Uluslararası Kooperatifler Yılı'' hem de Tacikistan''ın önerisiyle ''Uluslararası Buzulların Korunması Yılı'' ilan etmiştir.',
  '2025 = Kooperatifler ve Buzulların Korunması Yılıdır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Türk Devletleri Teşkilatı''nın (TDT) 2024 yılı Temmuz ayında Azerbaycan''ın kültür başkentinde gerçekleştirdiği ve ''Karabağ Bildirisi''nin imzalandığı Gayriresmi Zirve nerede toplanmıştır?',
  '{"options": ["Şuşa (Azerbaycan)", "Bakü", "Hankendi", "Gence", "Nahçıvan"], "correctIndex": 0}'::jsonb,
  'TDT Gayriresmi Devlet Başkanları Zirvesi, 5-6 Temmuz 2024''te işgalden kurtarılan tarihi ŞUŞA kentinde toplanmıştır.',
  'Resmi 11. Zirve Bişkek''te yapıldı; Karabağ Bildirisi''nin imzalandığı gayriresmi zirve ise ŞUŞA''da yapıldı.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Türk Devletleri Teşkilatı (TDT) tarihinde İLK KEZ bir gözlemci üyenin ev sahipliğinde düzenlenecek olan 2025 Gayriresmi Liderler Zirvesi hangi ülkede yapılacaktır?',
  '{"options": ["Macaristan (Budapeşte)", "Türkmenistan (Aşkabat)", "KKTC (Lefkoşa)", "Moğolistan (Ulanbator)", "Özbekistan (Taşkent)"], "correctIndex": 0}'::jsonb,
  'TDT liderleri, 2025 yılı gayriresmi zirvesinin gözlemci üye olan MACARİSTAN''ın başkenti Budapeşte''de toplanmasını kararlaştırmıştır.',
  'TDT tarihinde ilk kez bir Avrupa ve gözlemci ülkesinde zirve yapılacaktır; o ülke MACARİSTAN''dır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Baharın gelişi, doğanın uyanışı olarak kabul edilen ve UNESCO Somut Olmayan Miras Listesi''nde yer alan ''Nevruz Bayramı'' her yıl hangi gün kutlanır?',
  '{"options": ["21 Mart", "21 Haziran", "23 Eylül", "6 Mayıs", "23 Nisan"], "correctIndex": 0}'::jsonb,
  'Gece ile gündüzün eşitlendiği ekinoks günü olan 21 MART, Türk dünyasında ve Ortadoğu''da ''Nevruz Bayramı'' olarak kutlanır.',
  '6 Mayıs Hıdırellez''dir; 21 Mart ise NEVRUZ''dur.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Hızır ve İlyas peygamberlerin yeryüzünde buluştuğu gün olarak kabul edilen, baharın gelişini simgeleyen ve UNESCO İnsanlığın Somut Olmayan Kültürel Mirası Temsili Listesi''nde kayıtlı olan ''Hıdırellez'' her yıl hangi gün kutlanır?',
  '{"options": ["6 Mayıs", "21 Mart", "23 Nisan", "1 Mayıs", "21 Haziran"], "correctIndex": 0}'::jsonb,
  'Hıdırellez geleneği her yıl 5 Mayıs''ı 6 MAYIS''a bağlayan gece ve gün kutlanır.',
  '21 Mart Nevruz; 6 Mayıs HIDIRELLEZ''dir.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  '1972 Stockholm Birleşmiş Milletler İnsan Çevresi Konferansı''nın açılış günü anısına her yıl uluslararası düzeyde kutlanan ''Dünya Çevre Günü'' hangi tarihtir?',
  '{"options": ["5 Haziran", "22 Mart", "22 Nisan", "16 Eylül", "4 Ekim"], "correctIndex": 0}'::jsonb,
  'Her yıl 5 HAZİRAN, Birleşmiş Milletler Çevre Programı (UNEP) öncülüğünde DÜNYA ÇEVRE GÜNÜ olarak kutlanır.',
  '22 Nisan Dünya Günü; 22 Mart Dünya Su Günü; 5 HAZİRAN ise Dünya Çevre Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Temiz su kaynaklarının korunması ve su krizine dikkat çekmek amacıyla Birleşmiş Milletler tarafından ilan edilen ''Dünya Su Günü'' hangi tarihte idrak edilir?',
  '{"options": ["22 Mart", "5 Haziran", "22 Nisan", "21 Mart", "16 Ekim"], "correctIndex": 0}'::jsonb,
  'Dünya Su Günü her yıl 22 MART tarihinde kutlanmaktadır.',
  '21 Mart Ormancılık/Nevruz; 22 Mart ise DÜNYA SU GÜNÜ''dür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Gıda ve Tarım Örgütü''nün (FAO) 1945 yılındaki kuruluş günü vesilesiyle her yıl açlıkla mücadeleye dikkat çekmek için kutlanan ''Dünya Gıda Günü'' hangi gündür?',
  '{"options": ["16 Ekim", "5 Haziran", "10 Aralık", "20 Kasım", "24 Ekim"], "correctIndex": 0}'::jsonb,
  'FAO''nun kuruluş yıldönümü olan 16 EKİM günü, her yıl DÜNYA GIDA GÜNÜ olarak kutlanır.',
  '16 Ekim Dünya Gıda Günü; 24 Ekim BM Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  '24 Ekim 1945''te Birleşmiş Milletler Şartı''nın yürürlüğe girmesi anısına tüm üye ülkelerde her yıl kutlanan gün hangisidir?',
  '{"options": ["Birleşmiş Milletler Günü", "Dünya Barış Günü", "Dünya İnsan Hakları Günü", "Uluslararası Adalet Günü", "Dünya Demokrasi Günü"], "correctIndex": 0}'::jsonb,
  'BM Şartı 24 Ekim 1945''te yürürlüğe girmiş olup her yıl 24 EKİM ''BİRLEŞMİŞ MİLLETLER GÜNÜ'' olarak kutlanır.',
  '24 Ekim BM Günüdür; 10 Aralık İnsan Hakları Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'UNESCO tarafından 1995 yılında alınan kararla Cervantes, Shakespeare ve Garcilaso de la Vega''nın vefat günü olan 23 Nisan günü tüm dünyada ne olarak kutlanır?',
  '{"options": ["Dünya Kitap ve Telif Hakkı Günü", "Dünya Şiir Günü", "Dünya Tiyatro Günü", "Dünya Felsefe Günü", "Dünya Sanat Günü"], "correctIndex": 0}'::jsonb,
  '23 Nisan, Türkiye''de Çocuk Bayramı iken, UNESCO tarafından tüm dünyada DÜNYA KİTAP VE TELİF HAKKI GÜNÜ olarak kutlanır.',
  '21 Mart Dünya Şiir Günü; 27 Mart Dünya Tiyatro Günü; 23 NİSAN ise Dünya Kitap Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Leonardo da Vinci''nin doğum günü olan 15 Nisan günü, Uluslararası Sanat Derneği ve UNESCO tarafından ne olarak kutlanmaktadır?',
  '{"options": ["Dünya Sanat Günü", "Dünya Tasarım Günü", "Dünya Müzeler Günü", "Dünya Kültür Günü", "Dünya Mimarlık Günü"], "correctIndex": 0}'::jsonb,
  'Türk heykeltıraş Bedri Baykam''ın önerisiyle kabul edilen 15 NİSAN, Leonardo da Vinci''nin doğum günü vesilesiyle DÜNYA SANAT GÜNÜ olarak kutlanır.',
  'Dünya Sanat Günü önerisini bir Türk sanatçı (Bedri Baykam) vermiştir ve tarih 15 Nisan''dır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Her yıl 18-24 Mayıs tarihleri arasında müzelerin toplumdaki rolünü vurgulamak amacıyla ICOM (Müzeler Konseyi) öncülüğünde kutlanan hafta hangisidir?',
  '{"options": ["Müzeler Haftası", "Kütüphaneler Haftası", "Kültür Varlıkları Haftası", "Turizm Haftası", "Vakıflar Haftası"], "correctIndex": 0}'::jsonb,
  '18 Mayıs Uluslararası Müzeler Günü ve devam eden hafta MÜZELER HAFTASI olarak kutlanır.',
  'Mart ayının son haftası Kütüphaneler Haftası; 18-24 Mayıs MÜZELER HAFTASI''dır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Kütüphanecilik mesleğini ve kitap okuma alışkanlığını teşvik etmek için Türkiye''de her yıl MART AYININ SON PAZARTESİ günü başlayan hafta hangisidir?',
  '{"options": ["Kütüphane Haftası", "Kitap Haftası", "Yazarlar Haftası", "Okuma Haftası", "Edebiyat Haftası"], "correctIndex": 0}'::jsonb,
  '1964''ten beri Mart ayının son pazartesi günüyle başlayan hafta KÜTÜPHANE HAFTASI olarak kutlanır.',
  'Mart son pazartesi = KÜTÜPHANE HAFTASI.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Türkiye''de esnaf ve sanatkarların birlik, dayanışma ve ahlak anlayışını yaşatmak için her yıl EYLÜL AYININ ÜÇÜNCÜ HAFTASINDA Kırşehir merkezli olarak kutlanan resmi hafta hangisidir?',
  '{"options": ["Ahilik Haftası", "Esnaf Bayramı", "Lonca Haftası", "Girişimcilik Haftası", "Tüketiciyi Koruma Haftası"], "correctIndex": 0}'::jsonb,
  'Ahi Evran-ı Veli''nin anısına her yıl Eylül ayının üçüncü haftasında AHİLİK HAFTASI kutlanır.',
  'Ahilik Haftası Kırşehir merkezli olarak EYLÜL ayında kutlanır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  '2024 yılında Avrupa Birliği Dönem Başkanlıklarını üstlenen iki ülke hangi seçenekte sırasıyla doğru verilmiştir?',
  '{"options": ["Belçika — Macaristan", "İspanya — Belçika", "Polonya — Danimarka", "Kıbrıs Rum Kesimi — İrlanda", "Fransa — Çekya"], "correctIndex": 0}'::jsonb,
  '2024 yılının ilk 6 ayında BELÇİKA, ikinci 6 ayında ise MACARİSTAN AB Dönem Başkanlığı yapmıştır.',
  '2024: 1. yarı Belçika, 2. yarı Macaristan. 2025: Polonya ve Danimarka.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  '2025 yılında Avrupa Birliği Dönem Başkanlıklarını sırasıyla üstlenecek iki ülke hangileridir?',
  '{"options": ["Polonya — Danimarka", "Belçika — Macaristan", "Kıbrıs Rum Kesimi — İrlanda", "Litvanya — Yunanistan", "İtalya — Letonya"], "correctIndex": 0}'::jsonb,
  '1 Ocak - 30 Haziran 2025 arasında POLONYA, 1 Temmuz - 31 Aralık 2025 arasında ise DANİMARKA AB dönem başkanlığını yürütecektir.',
  '2025 = Polonya & Danimarka; 2026 = Kıbrıs Rum Kesimi & İrlanda.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  '2026 yılında Avrupa Birliği Dönem Başkanlıklarını sırasıyla devralacak ülkeler hangileridir?',
  '{"options": ["Kıbrıs Rum Kesimi — İrlanda", "Polonya — Danimarka", "Belçika — Macaristan", "Litvanya — Yunanistan", "İspanya — Portekiz"], "correctIndex": 0}'::jsonb,
  '2026''nın ilk yarısında KIBRIS RUM KESİMİ, ikinci yarısında İRLANDA AB dönem başkanı olacaktır.',
  '2026 AB başkanlık ikilisi Kıbrıs Rum Kesimi ve İrlanda''dır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Dünya genelinde Down Sendromlu bireylerin haklarına ve 21. kromozomun 3 tane olmasına atıfla her yıl 21. günün 3. ayında kutlanan farkındalık günü hangisidir?',
  '{"options": ["21 Mart Dünya Down Sendromu Farkındalık Günü", "2 Nisan Otizm Farkındalık Günü", "3 Aralık Dünya Engelliler Günü", "10 Ekim Dünya Ruh Sağlığı Günü", "1 Aralık AIDS Günü"], "correctIndex": 0}'::jsonb,
  '21. kromozomun 3 adet olmasını simgelemek üzere 21 MART (21/3) günü Dünya Down Sendromu Günü ilan edilmiştir.',
  '2 Nisan Otizm Günü; 21 Mart ise DOWN SENDROMU Günüdür (21/3 simgesi).'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  2,
  'Birleşmiş Milletler tarafından otizm spektrumundaki bireylerin yaşam kalitesini artırmak için ilan edilen ''Dünya Otizm Farkındalık Günü'' hangi tarihtir?',
  '{"options": ["2 Nisan", "21 Mart", "3 Aralık", "10 Ekim", "15 Mayıs"], "correctIndex": 0}'::jsonb,
  'Her yıl 2 NİSAN günü ''Mavi Işık Yak'' kampanyasıyla bilinen DÜNYA OTİZM FARKINDALIK GÜNÜ olarak kutlanır.',
  '21 Mart Down Sendromu; 2 NİSAN Otizm Farkındalık Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  '2024 yılında 24. Şanghay İşbirliği Örgütü (ŞİÖ) Liderler Zirvesi ''Çok Taraflı Diyaloğun Güçlendirilmesi: Sürdürülebilir Barış ve Kalkınma'' temasıyla hangi Orta Asya başkentinde yapılmıştır?',
  '{"options": ["Astana (Kazakistan)", "Taşkent (Özbekistan)", "Bişkek (Kırgızistan)", "Duşanbe (Tacikistan)", "Semerkant (Özbekistan)"], "correctIndex": 0}'::jsonb,
  'Temmuz 2024''te ŞİÖ Liderler Zirvesi Kazakistan Cumhurbaşkanı Kasım Cömert Tokayev ev sahipliğinde ASTANA''da toplanmış ve Belarus bu zirvede tam üye olmuştur.',
  '2024 ŞİÖ Zirvesi Kazakistan''ın başkenti ASTANA''da yapılmıştır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  'Her yıl 3 Aralık günü engelli bireylerin haklarına, toplumsal entegrasyonuna ve erişilebilirliğe dikkat çekmek amacıyla Birleşmiş Milletler öncülüğünde kutlanan gün hangisidir?',
  '{"options": ["Dünya Engelliler Günü", "Dünya İnsan Hakları Günü", "Dünya Yaşlılar Günü", "Uluslararası Dayanışma Günü", "Dünya Sağlık Günü"], "correctIndex": 0}'::jsonb,
  '3 ARALIK günü 1992 yılından bu yana DÜNYA ENGELLİLER GÜNÜ olarak tüm dünyada idrak edilir.',
  '3 Aralık Dünya Engelliler Günü; 10 Aralık İnsan Hakları Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  '1948 yılında Dünya Sağlık Örgütü''nün (DSÖ) anayasasının yürürlüğe girdiği tarih olan 7 Nisan günü her yıl dünyada ne olarak kutlanır?',
  '{"options": ["Dünya Sağlık Günü", "Dünya Tıp Bayramı", "Dünya Kanser Günü", "Dünya Kalp Günü", "Dünya Hemşireler Günü"], "correctIndex": 0}'::jsonb,
  '7 Nisan, Dünya Sağlık Örgütü''nün kuruluş günü olup her yıl DÜNYA SAĞLIK GÜNÜ olarak kutlanır.',
  'Türkiye''de 14 Mart Tıp Bayramı''dır; tüm dünyada ise 7 NİSAN Dünya Sağlık Günü''dür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  'Türkiye''de II. Mahmut döneminde 14 Mart 1827 tarihinde ilk modern tıp okulu olan ''Tıphane-i Amire ve Cerrahhane-i Amire''nin kurulması vesilesiyle her yıl 14 Mart ne olarak kutlanır?',
  '{"options": ["Tıp Bayramı", "Dünya Sağlık Günü", "Eczacılık Günü", "Hekimler Günü", "Darüşşifa Günü"], "correctIndex": 0}'::jsonb,
  '14 Mart 1827''de Tıphane-i Amire''nin açılışı ve 1919''da İstanbul''un işgaline karşı tıbbiyelilerin direnişi anısına her yıl 14 MART ''TIP BAYRAMI'' olarak kutlanır.',
  '14 Mart Türkiye''ye özgü TIP BAYRAMI''dır; 7 Nisan uluslararası Dünya Sağlık Günüdür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  '2024 yılında 29 Ekim Cumhuriyet Bayramı''nda Türkiye Cumhuriyeti kaçıncı kuruluş yıl dönümünü kutlamıştır?',
  '{"options": ["101. Yıl", "100. Yıl", "102. Yıl", "99. Yıl", "105. Yıl"], "correctIndex": 0}'::jsonb,
  '29 Ekim 1923''te kurulan Cumhuriyetimiz, 2023 yılında 100. yılını kutlamış; 2024 yılında ise 101. KURULUŞ YILDÖNÜMÜNÜ kutlamıştır.',
  '2023 yılı 100. yıldı; 2024 yılı 101. YILDIR.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  '1994 yılından bu yana UNESCO ve ILO tavsiyesiyle kutlanan, Türkiye''de ise Atatürk''ün Millet Mektepleri Başöğretmenliğini kabul ettiği gün olan 24 Kasım ne olarak kutlanır?',
  '{"options": ["Öğretmenler Günü", "Maarif Günü", "Eğitim Günü", "Mektep Bayramı", "Harf İnkılabı Günü"], "correctIndex": 0}'::jsonb,
  '24 Kasım 1928''de Atatürk Millet Mektepleri Başöğretmenliğini kabul etmiştir. Bu vesileyle 1981''den bu yana 24 KASIM ''ÖĞRETMENLER GÜNÜ'' olarak kutlanmaktadır.',
  '5 Ekim Dünya Öğretmenler Günüdür; Türkiye''de ise 24 KASIM Öğretmenler Günü''dür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  'Basın özgürlüğünün temel ilkelerini savunmak ve görevi başında hayatını kaybeden gazetecileri anmak amacıyla UNESCO öncülüğünde her yıl 3 Mayıs günü ne olarak kutlanır?',
  '{"options": ["Dünya Basın Özgürlüğü Günü", "Çalışan Gazeteciler Günü", "Radyo Günü", "Dünya Medya Günü", "Sansürle Mücadele Günü"], "correctIndex": 0}'::jsonb,
  'Windhoek Deklarasyonu anısına 3 MAYIS, tüm dünyada DÜNYA BASIN ÖZGÜRLÜĞÜ GÜNÜ olarak kutlanır.',
  'Türkiye''de 10 Ocak Çalışan Gazeteciler Günüdür; 3 MAYIS ise uluslararası DÜNYA BASIN ÖZGÜRLÜĞÜ GÜNÜ''dür.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  'Türkiye''de gazetecilere özlük hakları sağlayan 212 sayılı Kanun''un 1961''de yürürlüğe girmesi vesilesiyle her yıl 10 Ocak günü ne olarak kutlanmaktadır?',
  '{"options": ["Çalışan Gazeteciler Günü", "Dünya Basın Özgürlüğü Günü", "Sansürün Kaldırılışı Günü", "Türk Basın Günü", "Haberleşme Günü"], "correctIndex": 0}'::jsonb,
  'Türkiye''de 10 OCAK günü ''ÇALIŞAN GAZETECİLER GÜNÜ'' olarak kutlanır.',
  '10 Ocak Çalışan Gazeteciler Günü (Türkiye); 3 Mayıs Dünya Basın Özgürlüğü Günü (Uluslararası).'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  '2024 yılında düzenlenen 3. Antalya Diplomasi Forumu''nun (ADF 2024) ana teması aşağıdakilerden hangisi olmuştur?',
  '{"options": ["Krizler Döneminde Diplomasiyi Öne Çıkarmak", "Birlikte Düşünmek, Birlikte Hareket Etmek", "Diplomasiyi Yeniden Kurgulamak", "Daha Adil Bir Dünya Mümkün", "Küresel Barış İçin Çok Taraflılık"], "correctIndex": 0}'::jsonb,
  '1-3 Mart 2024''te düzenlenen 3. Antalya Diplomasi Forumu''nun ana teması ''KRİZLER DÖNEMİNDE DİPLOMASİYİ ÖNE ÇIKARMAK'' olmuştur.',
  '2022 Diplomasiyi Yeniden Kurgulamak idi; 2024 ADF ana teması ''Krizler Döneminde Diplomasiyi Öne Çıkarmak''tır.'
);

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
  'Önemli Günler ve Zirveler',
  'multiple_choice',
  3,
  '2024 yılında G20 Liderler Zirvesi ''Adil Bir Dünya ve Sürdürülebilir Bir Gezegen İnşa Etmek'' ana temasıyla hangi Güney Amerika şehrinde düzenlenmiştir?',
  '{"options": ["Rio de Janeiro (Brezilya)", "Brasilia (Brezilya)", "Buenos Aires (Arjantin)", "Santiago (Şili)", "Sao Paulo (Brezilya)"], "correctIndex": 0}'::jsonb,
  '18-19 Kasım 2024 tarihlerinde G20 Liderler Zirvesi Brezilya Devlet Başkanı Lula da Silva ev sahipliğinde RİO DE JANEİRO''daki Modern Sanat Müzesi''nde toplanmıştır.',
  '2024 G20 Zirvesi Brezilya''nın RİO DE JANEİRO kentinde yapılmıştır; Brasilia başkent olsa da zirve Rio''da yapılmıştır.'
);

COMMIT;
