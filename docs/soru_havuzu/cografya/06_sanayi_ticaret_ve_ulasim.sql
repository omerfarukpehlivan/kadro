-- =============================================================
-- KPSS COĞRAFYA — KONU 6: SANAYI, TICARET VE ULAŞIM
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Türkiye''de sanayi tesislerinin coğrafi dağılışı incelendiğinde Marmara Bölgesi''nin (özellikle Çatalca-Kocaeli ve Güney Marmara) sanayi üretiminde açık ara lider olduğu görülür.

Marmara Bölgesi''nin sanayide lider konuma gelmesinde aşağıdakilerden hangisi doğrudan bir etken DEĞİLDİR?',
  '{"options": ["Zengin yer altı maden yataklarına ve kömür havzalarına sahip olması", "Ulaşım ağlarının (kara, deniz, hava, demiryolu) olağanüstü gelişmiş olması", "Sermaye birikiminin ve finans merkezlerinin bölgede toplanması", "Nitelikli ve kalifiye iş gücünün bölgede bulunması", "Geniş bir tüketici pazarına yakın olması"], "correctIndex": 0}'::jsonb,
  'Marmara Bölgesi maden ve enerji kaynakları bakımından Türkiye''nin en fakir bölgelerindendir. Marmara''nın sanayi devi olmasının sebebi yer altı zenginliği değil; sermaye, dev tüketim pazarı, nitelikli iş gücü ve dünyaya açılan kavşak ulaşım ağıdır.',
  'Maden çeşitliliği Doğu Anadolu''dadır. Marmara hammadde zengini olduğu için değil, pazar ve ulaşım merkezi olduğu için sanayileşmiştir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Türkiye''de yurt içi yük ve yolcu taşımacılığında en yüksek paya sahip olan ulaşım sektörü aşağıdakilerden hangisidir?',
  '{"options": ["Demir yolu ulaşımı", "Kara yolu ulaşımı", "Deniz yolu ulaşımı", "Hava yolu ulaşımı", "Boru hattı taşımacılığı"], "correctIndex": 1}'::jsonb,
  'Türkiye''de yurt içi yolcu taşımacılığının yaklaşık %90''ı, yurt içi yük taşımacılığının ise %85''i esnekliği ve kapıdan kapıya teslimat kolaylığı nedeniyle kara yolu ile gerçekleştirilmektedir.',
  'Dış ticarette en çok yük deniz yolu ile taşınırken; YURT İÇİNDE tartışmasız şampiyon kara yoludur.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Uluslararası dış ticarette birim taşıma maliyeti en ucuz olan ulaşım türü aşağıdakilerden hangisidir?',
  '{"options": ["Kara yolu", "Demir yolu", "Deniz yolu", "Hava yolu", "Teleferik"], "correctIndex": 2}'::jsonb,
  'Deniz yolu taşımacılığında devasa konteyner gemileriyle tek seferde binlerce ton yük taşınabilmesi, güzergâh yapım ve bakım maliyetinin sıfır olması ve sürtünmenin azlığı sebebiyle dünyada ve Türkiye''de birim maliyeti en ucuz ulaşım türüdür.',
  'Ulaşım maliyet sıralaması (ucuzdan pahalıya): Deniz yolu < Demir yolu < Kara yolu < Hava yolu.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Türkiye''nin ihracatında (dış satımında) sektör bazında en yüksek paya sahip olan ana sektör aşağıdakilerden hangisidir?',
  '{"options": ["Tarımsal ham ürünler", "Madencilik ve taş ocakçılığı", "İmalat Sanayisi (Otomotiv, Makine, Tekstil, Kimya)", "Ormancılık ve balıkçılık ürünleri", "Canlı hayvan ticareti"], "correctIndex": 2}'::jsonb,
  'Türkiye''nin toplam ihracatının yaklaşık %94-95''i imalat sanayisi ürünlerinden oluşmaktadır. Motorlu kara taşıtları (otomotiv), makine parçaları, hazır giyim/tekstil ve kimyasal maddeler en büyük paya sahiptir. Tarımın ihracattaki payı %3-4 civarındadır.',
  'Türkiye bir tarım ülkesi olarak bilinse de ihracat gelirinin neredeyse tamamı sanayi mamullerinden sağlanır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Türkiye''nin en çok ihracat yaptığı (en büyük dış pazarımız olan) ülke aşağıdakilerden hangisidir?',
  '{"options": ["Rusya", "Almanya", "Çin", "Amerika Birleşik Devletleri", "Irak"], "correctIndex": 1}'::jsonb,
  'Türkiye''nin ihracatında uzun yıllardır açık ara birinci sırada yer alan ülke Almanya''dır (Almanya''yı ABD, İngiltere ve İtalya takip eder). İthalatta ise birinci Rusya veya Çin''dir.',
  'İhracatta (sattığımız) 1 numara = Almanya; İthalatta (aldığımız) 1 numara = Rusya / Çin!'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Karadeniz''i Doğu ve Güneydoğu Anadolu''ya bağlayan Zigana Geçidi üzerinde inşa edilen ve 14,5 kilometre uzunluğu ile Türkiye''nin ve Avrupa''nın en uzun çift tüplü kara yolu tüneli aşağıdakilerden hangisidir?',
  '{"options": ["Ovit Tüneli", "Yeni Zigana Tüneli", "Ilgaz 15 Temmuz İstiklal Tüneli", "Avrasya Tüneli", "Bolu Dağı Tüneli"], "correctIndex": 1}'::jsonb,
  'Trabzon ile Gümüşhane arasında açılan Yeni Zigana Tüneli 14.5 km uzunluğuyla Türkiye''nin ve Avrupa''nın en uzun çift tüplü karayolu tünelidir. Trabzon Limanı''nı İran transit yoluna bağlayan hayati bir projedir.',
  'Ovit Tüneli Rize-İkizdere ile İspir arasındadır (14 km); Yeni Zigana Tüneli ise 14.5 km ile rekoru elinde tutmaktadır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Çukurova''yı ve Akdeniz kıyılarını İç Anadolu Bölgesi''ne (Niğde/Konya) bağlayan en işlek tarihi doğal Toros geçidi aşağıdakilerden hangisidir?',
  '{"options": ["Çubuk Boğazı", "Gülek Boğazı", "Sertavul Geçidi", "Belen Geçidi", "Kop Geçidi"], "correctIndex": 1}'::jsonb,
  'Adana ve Çukurova''yı Pozantı üzerinden İç Anadolu''ya bağlayan kapı Gülek Boğazı''dır. Sertavul Silifke-Karaman''ı; Çubuk Antalya-Göller Yöresi''ni; Belen ise İskenderun-Hatay''ı bağlar.',
  'Akdeniz geçitleri: Çubuk (Antalya), Sertavul (Silifke), Gülek (Adana/Pozantı), Belen (İskenderun). Şifresi: Ç-S-G-B (Çok Sayıda Geçit Bulunur).'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Denize dolgu yapılarak (deniz yüzeyi taş ve kayalarla doldurularak) inşa edilen Türkiye''nin ve Avrupa''nın ilk deniz dolgu havalimanı aşağıdakilerden hangisidir?',
  '{"options": ["Trabzon Havalimanı", "Ordu - Giresun Havalimanı", "Rize - Artvin Havalimanı", "Çukurova Uluslararası Havalimanı", "Sabiha Gökçen Havalimanı"], "correctIndex": 1}'::jsonb,
  'Karadeniz''in dik ve engebeli arazisinde düz alan bulunamadığı için deniz doldurularak inşa edilen ilk havalimanı Ordu-Giresun Havalimanı''dır. Rize-Artvin Havalimanı ise Türkiye''nin ikinci deniz dolgu havalimanıdır.',
  'İlk deniz dolgu havalimanı = Ordu-Giresun; İkincisi = Rize-Artvin.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Türkiye''de otomotiv sanayisi (otomobil, otobüs, kamyon ve traktör montaj ve üretimi) en çok hangi coğrafi bölgede yoğunlaşmıştır?',
  '{"options": ["Marmara Bölgesi", "İç Anadolu Bölgesi", "Ege Bölgesi", "Akdeniz Bölgesi", "Karadeniz Bölgesi"], "correctIndex": 0}'::jsonb,
  'Bursa (TOGG, Renault, Tofaş/Fiat), Kocaeli (Ford Otosan, Hyundai), Sakarya (Toyota, Otokar) ve İstanbul ile otomotiv sanayisinin açık ara merkezi Marmara Bölgesi''dir.',
  'Otomotiv sanayisi hammaddeye değil; sermaye, yan sanayi ve liman ihracat avantajına bağlı olarak Marmara''da toplanmıştır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  1,
  'Türkiye''nin en büyük konteyner limanı olup İstanbul ve Trakya sanayisinin dünya ticaret kapısı olan liman aşağıdakilerden hangisidir?',
  '{"options": ["Sinop Limanı", "Ambarlı Limanı", "Trabzon Limanı", "Giresun Limanı", "Bandırma Limanı"], "correctIndex": 1}'::jsonb,
  'İstanbul Avcılar/Beylikdüzü kıyısında yer alan Ambarlı Limanı, elleçlenen konteyner hacmi bakımından Türkiye''nin en büyük liman komplekslerindendir.',
  'Sinop doğal limandır ama en küçüğüdür; Ambarlı ise konteyner hacminde devdir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de demiryolu hatları genellikle vadi tabanlarını ve doğal çöküntü oluklarını takip ederek uzanır. Arazinin çok engebeli olduğu veya dağların denize paralel uzandığı kıyılarda demiryolu ağı kurulması olağanüstü maliyetlidir.

Aşağıdaki liman kentlerinden hangisinin iç kesimlerle ''demir yolu bağlantısı BULUNMAZ''?',
  '{"options": ["Samsun", "İzmir", "Mersin", "Antalya", "İskenderun"], "correctIndex": 3}'::jsonb,
  'Antalya, Türkiye''nin en büyük turizm ve ticaret limanlarından biri olmasına karşın gerisindeki dik Batı Toroslar (Beydağları) aşılamadığı için demiryolu bağlantısı kesinlikle YOKTUR. Samsun, İzmir, Mersin ve İskenderun''un ise demiryolu bağlantısı mevcuttur.',
  'ÖSYM demiryolu bağlantısı olmayan limanları sürekli yoklar: Trabzon, Rize, Giresun, Sinop, ANTALYA, Çanakkale! Antalya''da tren yoktur.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Bir limanın ekonomik olarak büyüyebilmesi ve ticaret hacmini artırabilmesi ''hinterlandı'' (art bölgesi) ile doğrudan ilişkilidir.

Sinop Limanı Karadeniz''in en korunaklı ve mükemmel doğal limanı olmasına rağmen ticari olarak gelişememiş ve sönük kalmıştır.

Sinop Limanı''nın gelişememesinin temel coğrafi sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Deniz suyu sıcaklığının çok düşük olması", "Liman gerisinde yükselen Küre Dağları''nın iç kesimlerle kara ve demir yolu ulaşımını engellemesi (hinterlandının dar olması)", "Limanın fırtınalara açık olması", "Sinop''ta balıkçılık yapılamaması", "Sinop''un bir ada üzerinde yer alması"], "correctIndex": 1}'::jsonb,
  'Sinop doğal limandır ancak arkasındaki Küre Dağları kıyıyı iç Anadolu''dan koparmıştır. Demiryolu yoktur, karayolu bağlantısı zayıftır; dolayısıyla hinterlandı dardır. Samsun ise arkasındaki Canik Dağları basık ve geçit verdiği için yapay olmasına rağmen Karadeniz''in en işlek limanı olmuştur.',
  'Doğal liman olmak gelişmeyi garanti etmez; limanı liman yapan şey arkasındaki ulaşım ağı ve hinterland genişliğidir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de savunma sanayisi tesisleri (ASELSAN, ROKETSAN, TUSAŞ, MKEK Fişek ve Silah Fabrikaları) ağırlıklı olarak Ankara, Kırıkkale ve Çankırı gibi iç bölge illerimizde toplanmıştır.

Savunma sanayisinin kuruluş yeri olarak iç bölgelerin tercih edilmesindeki en temel stratejik faktör aşağıdakilerden hangisidir?',
  '{"options": ["Hammadde olan demirin sadece bu illerde çıkması", "Kıyı bölgelerden gelebilecek askeri saldırı ve bombardımanlara karşı iç güvenliğin ve savunma derinliğinin yüksek olması", "Bölgede deniz turizminin sanayiyi engellemesi", "İç Anadolu''da su kaynaklarının bol olması", "Karasal iklimin mühimmatların soğumasını kolaylaştırması"], "correctIndex": 1}'::jsonb,
  'Cumhuriyet''in stratejik planlamasında askeri mühimmat, silah ve roket fabrikaları savaş halinde düşman donanmalarının ve hava harekatlarının menzilinden uzak kalması için ''jeopolitik ve askeri güvenlik'' gerekçesiyle Anadolu''nun ortasında (Ankara, Kırıkkale) kurulmuştur.',
  'Savunma sanayiinde kuruluş faktörü pazar veya hammadde değil; tamamen ''askeri güvenlik ve stratejik derinlik''tir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'I. Balıkesir — Bandırma
II. Mersin
III. Kocaeli — İzmit
IV. Konya

Yukarıda verilen merkezlerden hangilerinde ''suni gübre'' fabrikalarının kurulmasında ithal edilen fosfat ve doğal gazın deniz yoluyla kolay getirilmesi (ulaşım ve liman) etkili olmuştur?',
  '{"options": ["I, II ve III", "II ve IV", "I ve IV", "Yalnız III", "I, II, III ve IV"], "correctIndex": 0}'::jsonb,
  'Türkiye fosfat ve doğal gazda dışa bağımlı olduğundan gübre fabrikaları (Bandırma, Mersin, Kocaeli, İskenderun) hammaddeyi gemilerle limana indirmek için kıyılarda kurulmuştur. Konya ise iç kesimdedir.',
  'Gübre fabrikaları liman kentlerindedir (Bandırma, Mersin, Kocaeli, Samsun); tek hammaddeye yakın yer Mardin Mazıdağı''dır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Doğu Karadeniz Bölümü''nün kıyı şeridinde yer alan illerimiz (Trabzon, Rize, Artvin, Giresun) demiryolu haritası açısından değerlendirildiğinde aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Doğu Karadeniz kıyı kuşağında demiryolu hattı ve tren ulaşımı kesinlikle YOKTUR.", "Trabzon ile Rize arasında yüksek hızlı tren hattı çalışmaktadır.", "Bölgedeki tüm madenler tren vagonlarıyla taşınır.", "Artvin''den Gürcistan''a uzanan tarihi bir demiryolu mevcuttur.", "Demiryolu yük taşımacılığında Doğu Karadeniz Türkiye lideridir."], "correctIndex": 0}'::jsonb,
  'Doğu Karadeniz kıyısında (Ordu''dan Sarp Sınır Kapısı''na kadar) tek bir metre bile demiryolu hattı yoktur! Dağların hemen denizden dimdik yükselmesi ve sarp topoğrafya demiryolu inşasını engellemiştir.',
  'Adaylar Trabzon gibi büyük bir kentte tren olduğunu sanabilir. Doğu Karadeniz sahilinde demiryolu KESİNLİKLE YOKTUR!'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de pamuklu dokuma sanayisi hem pamuğun üretildiği hammadde yörelerinde (Adana, Aydın, Manisa, Gaziantep) hem de pamuk üretilmeyen ancak büyük pazar ve ulaşım imkanlarına sahip metropollerde kurulmuştur.

Aşağıdaki illerin hangisinde pamuk tarımı yapılmadığı halde devasa pamuklu dokuma ve tekstil sanayisi gelişmiştir?',
  '{"options": ["Şanlıurfa", "Adana", "İstanbul", "Aydın", "Hatay"], "correctIndex": 2}'::jsonb,
  'İstanbul ve çevresinde iklim nedeniyle pamuk tarımı kesinlikle yapılamaz. Ancak İstanbul hazır giyim ve tekstil sanayisinin sermaye, pazar ve moda merkezidir; hammadde güneyden getirilerek işlenir (pazara yakınlık). Kayseri de böyledir.',
  'İstanbul ve Kayseri pamuk yetiştiremez ama dev tekstil sanayisine sahiptir (pazar ve sermaye faktörü).'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de kağıt fabrikalarının (Kastamonu-Taşköprü, Zonguldak-Çaycuma, Giresun-Aksu, Balıkesir, Muğla-Dalaman) kuruluş yeri tercihlerinde birincil etken aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede demir yolu ağının bulunması", "Kağıdın hammaddesi olan orman varlığına (odun/selüloz) yakınlık", "Bölgede tüketici nüfusunun fazla olması", "Doğal gaz boru hatlarının geçmesi", "İş gücünün ucuz olması"], "correctIndex": 1}'::jsonb,
  'Kağıt sanayisi selüloz ve tomruk hammaddesine dayandığı için SEKA fabrikaları orman zenginliğinin bol olduğu Karadeniz, Akdeniz ve Ege kıyı kuşağında (hammaddeye yakınlık) kurulmuştur.',
  'Kağıt fabrikaları = Orman varlığına ve hammaddeye yakınlık!'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Konya Ovası Projesi (KOP) kapsamında Göksu Nehri''nin Akdeniz''e boşa akan sularını Toros Dağları''nın altından delerek Konya Kapalı Havzası''na aktaran dev sulama tüneli aşağıdakilerden hangisidir?',
  '{"options": ["Mavi Tünel", "Şanlıurfa Tüneli", "Ovit Tüneli", "Zigana Tüneli", "Avrasya Tüneli"], "correctIndex": 0}'::jsonb,
  'KOP''un kalbi olan ''Mavi Tünel'', Göksu Nehri ve kolları üzerindeki barajlarda toplanan suları Toroslar''ın altından 17 km uzunluğundaki tünelle Konya Ovası''na (Bağbaşı Barajı üzerinden) akıtarak yer altı sularının tükenmesini önlemeyi amaçlar.',
  'Fırat''ı Harran''a akıtan Şanlıurfa Tüneli''dir; Göksu''yu Konya''ya akıtan Mavi Tünel''dir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de Yüksek Hızlı Tren (YHT) hatlarının faaliyette olduğu güzergâhlar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Ankara — Eskişehir — İstanbul", "Ankara — Konya", "Konya — Karaman", "Ankara — Kırıkkale — Yozgat — Sivas", "İzmir — Antalya"], "correctIndex": 4}'::jsonb,
  'İzmir ile Antalya arasında ne hızlı tren ne de normal konvansiyonel demiryolu hattı mevcuttur. Diğer tüm hatlar ise fiilen açılmış ve çalışan YHT hatlarıdır.',
  'İzmir-Antalya arasında tren yolu yoktur; dağlık topoğrafya nedeniyle bu hat mevcut değildir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Zonguldak - Bartın - Karabük (ZBK) Bölgesel Gelişme Projesi''nin temel çıkış noktası ve ana hedefi aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede pamuk ve narenciye tarımını yaygınlaştırmak", "Bölgenin taş kömürü ve demir-çeliğe bağımlı tek yönlü ekonomik yapısını Filyos Vadisi Projesi, liman ve yeni sanayi kollarıyla çeşitlendirmek ve istihdam yaratmak", "Bölgedeki tüm kömür madenlerini kamulaştırıp kapatmak", "Bölgede sera alanlarını genişletmek", "Bölgeyi Türkiye''nin en büyük buğday ambarı haline getirmek"], "correctIndex": 1}'::jsonb,
  'ZBK projesinin amacı; Kardemir ve kömür işletmelerinin küçülmesiyle yaşanan işsizliği önlemek, Filyos Vadisi ve Mega Endüstri Bölgesi ile bölgeye yeni yatırımcılar çekerek ekonomiyi kömür tekelinden kurtarıp çeşitlendirmektir.',
  'ZBK sadece kömür çıkarmak için değil; bölge ekonomisini kömüre bağımlılıktan kurtarıp çeşitlendirmek için hazırlanmıştır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Bir ülkenin ithalat giderlerinin (dış alım), ihracat gelirlerinden (dış satım) daha fazla olması durumuna ''Dış Ticaret Açığı'' denir.

Türkiye''nin dış ticaret açığı vermesindeki en büyük kalem aşağıdakilerden hangisidir?',
  '{"options": ["Fosil enerji kaynakları (Ham Petrol ve Doğal Gaz) ithalatı", "Tarım ve canlı hayvan ithalatı", "Tekstil ve konfeksiyon ithalatı", "Gıda ve un mamulleri ithalatı", "İnşaat malzemeleri ithalatı"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin dış ticaret açığının ve cari açığının yaklaşık %60-70''i yurt dışından ithal edilen ham petrol, doğal gaz ve taş kömürü gibi enerji faturalarından kaynaklanmaktadır.',
  'Cari açığın ve dış ticaret açığının tartışmasız 1 numaralı müsebbibi enerji (petrol ve doğal gaz) ithalatıdır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Doğu Karadeniz Projesi (DOKAP) kapsamında bölgedeki yaylaları birbirine bağlayarak yayla turizmini canlandırmayı ve turistlerin vadilere inmeden dağ sırtlarından seyahat etmesini hedefleyen büyük yol projesine ne ad verilir?',
  '{"options": ["Mavi Yol", "Yeşil Yol Projesi", "İpek Yolu", "Kral Yolu", "Karadeniz Sahil Yolu"], "correctIndex": 1}'::jsonb,
  'DOKAP kapsamında Samsun''dan Artvin''e kadar olan Karadeniz yaylalarını üst kottan birbirine entegre eden turizm güzergâhı projesine ''Yeşil Yol Projesi'' adı verilir.',
  'Sahil boyunca uzanan Karadeniz Sahil Yolu''dur; yaylaları bağlayan ise ''Yeşil Yol''dur.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de serbest bölgeler; yabancı sermayeli yatırımları çekmek, ihracata dönük üretimi artırmak ve gümrük-vergi muafiyetleriyle ticareti hızlandırmak amacıyla kurulmuştur.

Türkiye''de ilk kurulan serbest bölge aşağıdakilerden hangisidir?',
  '{"options": ["Mersin Serbest Bölgesi", "İstanbul Atatürk Havalimanı Serbest Bölgesi", "İzmir Serbest Bölgesi", "Trabzon Serbest Bölgesi", "Gaziantep Serbest Bölgesi"], "correctIndex": 0}'::jsonb,
  'Türkiye''de 1985 yılında çıkarılan Serbest Bölgeler Kanunu ile faaliyete geçen ilk serbest bölge Mersin Serbest Bölgesi''dir (hemen ardından Antalya açılmıştır).',
  'İlk serbest bölge İstanbul değil, liman kolaylığı nedeniyle Mersin''dir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye ile komşu ülkeler arasındaki sınır kapıları ve demiryolu bağlantıları incelendiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Kapıkule Sınır Kapısı (Edirne - Bulgaristan) Türkiye''nin en işlek demir ve kara yolu sınır kapısıdır.", "Sarp Sınır Kapısı (Artvin - Gürcistan) üzerinden aktif demiryolu seferleri yapılmaktadır.", "Uzunköprü Sınır Kapısı (Edirne - Yunanistan) demiryolu bağlantısına sahiptir.", "Kapıköy Sınır Kapısı (Van - İran) demiryolu bağlantısına sahiptir.", "Nusaybin Sınır Kapısı (Mardin - Suriye) demiryolu bağlantısına sahiptir."], "correctIndex": 1}'::jsonb,
  'Sarp Sınır Kapısı sadece karayolu sınır kapısıdır; Artvin kıyısında demiryolu olmadığı için Sarp''tan tren geçişi imkansızdır. Gürcistan ile demiryolu bağlantımız Ardahan üzerindeki ''Canbaz Sınır Kapısı'' (Bakü-Tiflis-Kars Demiryolu) ile sağlanır.',
  'Sarp Sınır Kapısı''nda tren YOLU YOKTUR! Gürcistan''a demiryolu BTK hattı ile Canbaz''dan (Ardahan) geçer.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'I. Tekirdağ — Çorlu ve Çerkezköy
II. Kocaeli — Gebze ve Dilovası
III. Manisa — Organize Sanayi Bölgesi
IV. Sinop — Boyabat

Yukarıda verilen merkezlerden hangileri son 30 yılda metropollerin (İstanbul ve İzmir) aşırı sanayi yoğunluğunu dışarı kaydırmasıyla patlama yaşayan sanayi üsleridir?',
  '{"options": ["I, II ve III", "II, III ve IV", "I ve IV", "Yalnız II", "I, II, III ve IV"], "correctIndex": 0}'::jsonb,
  'İstanbul sanayisi Çorlu-Çerkezköy (Tekirdağ) ve Gebze-Dilovası (Kocaeli) aksına taşmış; İzmir sanayisi ise hemen yanı başındaki Manisa OSB''ye genişlemiştir. Sinop''ta ise sanayi gelişmemiştir.',
  'Çorlu, Gebze ve Manisa Türkiye''nin en dinamik sanayi ilçeleridir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Antalya ile Konya arasındaki Alacabel Geçidi üzerinde inşa edilen ve kışın kar fırtınaları yüzünden günlerce kapanan İç Anadolu - Akdeniz transit trafiğini kesintisiz hale getiren tünel aşağıdakilerden hangisidir?',
  '{"options": ["Demirkapı Tüneli", "Zigana Tüneli", "Ovit Tüneli", "Bolu Dağı Tüneli", "Eraslan Tüneli"], "correctIndex": 0}'::jsonb,
  'Antalya''yı Konya ve İç Anadolu''ya bağlayan Toroslar hattında açılan 5 km''lik Demirkapı Tüneli; iç kesimdeki karasal iklim ile kıyıdaki Akdeniz iklimi arasındaki geçişi dakikalara indirmiştir.',
  'Demirkapı Tüneli ''bir tüpten girince karasal kış, diğer tüpten çıkınca Akdeniz baharı'' mottosuyla bilinen Toros tünelidir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Yeşilırmak Havzası Gelişim Projesi (YHGP); Amasya, Çorum, Samsun ve Tokat illerini kapsamaktadır.

Bu projenin hayata geçirilmesindeki temel çevre ve su sorunu aşağıdakilerden hangisidir?',
  '{"options": ["Yeşilırmak ve kollarında yaşanan şiddetli su kirliliği, nehir taşkınları ve aşırı toprak erozyonunu önlemek", "Bölgede kuraklıktan ötürü akarsuların tamamen kuruması", "Bölgede volkanik patlamaların engellenmesi", "Karadeniz''in su seviyesinin yükselmesini durdurmak", "Bölgedeki çeltik tarımını tamamen sonlandırmak"], "correctIndex": 0}'::jsonb,
  'Yeşilırmak havzası Türkiye''de erozyonun ve nehir taşkınlarının en şiddetli yaşandığı, sanayi ve tarımsal atıklarla nehir kirliliğinin zirve yaptığı havzalardandır. YHGP''nin önceliği taşkın, erozyon ve kirlilik kontrolüdür.',
  'YHGP = Yeşilırmak = Erozyon, taşkın ve kirlilikle mücadele projesi.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Güneydoğu Anadolu Projesi (GAP) kapsamında sulama ve enerji yatırımları ile birlikte bölgede sanayinin lokomotifi haline gelen sektör aşağıdakilerden hangisidir?',
  '{"options": ["Gemi yapım ve tersane sanayisi", "Tarım ve hayvancılığa dayalı sanayi (Çırçır pamuk, tekstil, un, yağ, makarna)", "Uçak motoru ve havacılık sanayisi", "Kağıt ve kereste sanayisi", "Taş kömürü zenginleştirme sanayisi"], "correctIndex": 1}'::jsonb,
  'GAP ile sulanan tarlalarda rekor kıran pamuk, mısır, buğday ve kırmızı mercimek sayesinde Güneydoğu''da (özellikle Gaziantep ve Şanlıurfa) tarıma dayalı gıda, iplik, çırçır, dokuma ve makarna sanayisi patlama yapmıştır.',
  'GAP''ın tetiklediği sanayi kolu ''tarıma dayalı imalat sanayisi''dir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de transit ticaret taşımacılığında Trabzon Limanı''nın tarihsel ve güncel önemini korumasını sağlayan uluslararası transit ticaret koridoru hangi ülkeye bağlanmaktadır?',
  '{"options": ["İran", "Yunanistan", "İtalya", "Mısır", "Romanya"], "correctIndex": 0}'::jsonb,
  'Tarihi İpek Yolu''ndan bu yana Karadeniz üzerinden Avrupa''dan gelen mallar Trabzon Limanı''na iner; buradan Zigana ve Kop geçitleri aşılarak Erzurum ve Doğubayazıt/Gürbulak kapısı üzerinden İran pazarına ulaştırılır.',
  'Trabzon Limanı = İran Transit Ticaret Yolu! Bu iki kavram birbirinden ayrılamaz.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de demiryolu taşımacılığında Van Gölü üzerinde demiryolu vagonlarının gemilere bindirilerek taşındığı ''feribotlu demiryolu geçişi'' hangi iki istasyon arasında gerçekleşmektedir?',
  '{"options": ["Tatvan — Van", "Erciş — Ahlat", "Gevaş — Muradiye", "Başkale — Özalp", "Doğubayazıt — Çaldıran"], "correctIndex": 0}'::jsonb,
  'Elazığ-Muş üzerinden gelen demiryolu Tatvan İskelesi''nde biter. Vagonlar feribotlara yüklenerek Van Gölü''nün üzerinden Van İskelesi''ne taşınır ve oradan Kapıköy sınır kapısına (İran''a) demiryoluyla devam eder.',
  'Van Gölü üzerindeki tren feribot hattı Tatvan ile Van arasındadır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Türkiye''de bazı sanayi kolları doğrudan bozulabilir taze tarımsal hammaddeye bağımlı olduğu için hammadde alanının uzağına kesinlikle kurulamazken, bazı sanayi kolları ise hammaddesi bozulmaz olduğu için liman veya büyük tüketim pazarlarının yanına kurulabilmektedir.

Buna göre aşağıdaki sanayi kollarından hangisinin kuruluş yerinin belirlenmesinde ''pazara yakınlık'' veya ''ulaşım kolaylığı'' belirleyici olmuştur (hammaddeye yakınlık aranmamıştır)?',
  '{"options": ["Rize''deki Çay Fabrikaları", "Balıkesir''deki Salça ve Konserve Fabrikaları", "Konya''daki Şeker Pancarı Fabrikası", "Kayseri ve Manisa''daki Mobilya Fabrikaları", "Aydın''daki Zeytinyağı Tesisleri"], "correctIndex": 3}'::jsonb,
  'Çay toplandıktan birkaç saat sonra çürür; şeker pancarı beklerse şekeri buharlaşır; domates ve zeytin hızla ezilir ve asitlenir. Dolayısıyla çay, şeker, konserve ve zeytinyağı zorunlu olarak hammaddeye bitişik kurulur. Mobilya sanayisi için ise ağaç ormandan kereste olarak kolayca taşınabilir; Kayseri orman fakiridir ama dev mobilya kentidir (pazara yakınlık ve sermaye faktörü).',
  'Kayseri ve Ankara orman zengini olmamalarına rağmen Türkiye''nin mobilya devleridir; çünkü mobilya hammaddeye değil pazara yakındır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Doğu Anadolu Projesi (DAP) kapsamındaki illerde sanayi ve kalkınmayı hızlandırmak amacıyla yürütülen en rasyonel strateji aşağıdakilerden hangisidir?',
  '{"options": ["Otomotiv ve gemi tersaneleri inşa etmek", "Bölgenin geniş çayır ve meralarına dayalı modern et-süt entegre tesislerini kurmak ve yem bitkileri üretimini desteklemek", "Pamuklu dokuma fabrikaları açmak", "Muz ve narenciye tarlaları oluşturmak", "Zeytin işleme tesisleri kurmak"], "correctIndex": 1}'::jsonb,
  'Doğu Anadolu yüksek, soğuk ve engebelidir; tarım sezonu kısadır. Ancak dev alpin çayırlar ve mera varlığı nedeniyle Türkiye''nin en büyük büyükbaş hayvan potansiyeline sahiptir. DAP''ın kalbi modern besicilik, et kombinaları, süt toz/peynir fabrikaları ve meraların ıslahıdır.',
  'DAP''ın birincil sektörel motoru hayvancılık ve hayvansal ürünler sanayisidir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Türkiye''de kara yolu ve demir yolu güzergâhlarının maliyetleri topoğrafyaya göre şekillenir.

Aşağıdaki şehir çiftleri arasında 100 kilometrelik bir demir yolu veya otoyol inşa edilmek istendiğinde km başına düşen viyadük, köprü ve tünel maliyetinin (yol yapım maliyetinin) en düşük olması beklenir?',
  '{"options": ["Trabzon — Gümüşhane", "Rize — Erzurum", "Antalya — Burdur", "Konya — Karaman", "Muğla — Fethiye"], "correctIndex": 3}'::jsonb,
  'Konya ile Karaman arası uçsuz bucaksız, dümdüz ova ve tabaka düzlüğüdür (İç Anadolu platosu). Eğim neredeyse sıfırdır; tünel, viyadük veya derin yarma gerektirmez; dolayısıyla yol yapım maliyeti en ucuzdur. Karadeniz ve Toroslar''da ise kilometre başına milyonlarca dolar tünel maliyeti biner.',
  'Yol yapım maliyeti: Düz iç platolarda (Konya, Şanlıurfa, Ergene) en düşük; Karadeniz, Akdeniz ve Doğu Anadolu''da en yüksektir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Bakü - Tiflis - Ceyhan (BTC) Ham Petrol Boru Hattı dünya enerji jeopolitiğinde Türkiye''yi kilit bir enerji koridoru ve terminali haline getirmiştir.

BTC boru hattı ile Hazar Denizi (Azerbaycan) petrolleri Türkiye üzerinden hangi limanımıza taşınarak dünya tankerlerine yüklenmektedir?',
  '{"options": ["İzmir (Aliağa)", "Kocaeli (Derince)", "Adana (Ceyhan - Haydar Aliyev Deniz Terminali)", "Samsun Limanı", "Mersin Limanı"], "correctIndex": 2}'::jsonb,
  'BTC hattı Azerbaycan petrollerini Gürcistan üzerinden geçirip Adana Ceyhan''daki deniz terminaline ulaştırır. Buradan dev süpertankerlerle dünya pazarlarına sevk edilir (Ceyhan Enerji İhtisas Bölgesi).',
  'BTC''nin son durağı Adana Ceyhan Deniz Terminali''dir; Mersin veya Aliağa değildir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Türkiye''de transit boru hatları düşünüldüğünde Azerbaycan''ın Şahdeniz sahasından çıkarılan doğal gazı Türkiye''den geçirerek Avrupa''ya (Yunanistan ve İtalya sınırına) ulaştıran dev doğal gaz boru hattı projesi hangisidir?',
  '{"options": ["Mavi Akım", "TürkAkım", "TANAP (Trans Anadolu Doğal Gaz Boru Hattı)", "İran - Türkiye Boru Hattı", "Kerkük - Yumurtalık Boru Hattı"], "correctIndex": 2}'::jsonb,
  'TANAP (Trans Anadolu Doğal Gaz Boru Hattı), Azerbaycan gazını Türkiye''nin doğusundan (Ardahan-Türkgözü) girip batısına (Edirne-İpsala) kadar 20 ilden geçerek TAP (Trans Adriyatik) hattıyla Avrupa''ya bağlayan ''Güney Gaz Koridoru''nun omurgasıdır.',
  'TANAP Azerbaycan gazını Avrupa''ya taşır; TürkAkım ve Mavi Akım ise Rusya gazını Karadeniz altından Türkiye''ye getirir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Bir limanın ardındaki hinterlandında yer alan demiryolu ve karayolu ağları ile dağların kıyıya dik ya da paralel uzanışı limanın büyümesini doğrudan belirler.

Aşağıdaki limanlardan hangisi hinterlandı en GENİŞ olan limanlarımızdan biridir?',
  '{"options": ["Sinop Limanı", "Giresun Limanı", "Mersin Uluslararası Limanı", "İnebolu Limanı", "Bartın Limanı"], "correctIndex": 2}'::jsonb,
  'Mersin Limanı; arkasındaki Gülek Boğazı ve gelişmiş demiryolu-otoyol ağı ile tüm İç Anadolu, Doğu ve Güneydoğu Anadolu ile Ortadoğu transit ticaretine bağlıdır. Bu devasa coğrafi etki alanı Mersin''i Türkiye''nin hinterlandı en geniş mega limanlarından biri yapmıştır.',
  'Sinop, Giresun ve İnebolu dağlar nedeniyle dar hinterlandlıdır; Mersin ve İzmir ise dev hinterlandlıdır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'I. Ege Bölgesi''nde dağların kıyıya dik uzanması kara ve demir yolu yapımını kıyıdan iç kesimlere doğru çok kolaylaştırmıştır.
II. Karadeniz ve Akdeniz''de dağların kıyıya paralel uzanması kıyı ile iç kesimler arasında tünel ve geçit ihtiyacını zorunlu kılmıştır.
III. Doğu Anadolu''da yükseltinin batıdan doğuya artması tren ve otoyol yapım maliyetlerini tırmandırmıştır.

Yukarıdaki morfolojik tespitlerden hangileri Türkiye''de ''ulaşım sistemlerinin yer şekillerine bağımlı olduğunu'' kanıtlar?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Her üç öncül de Türkiye''de dağların uzanış doğrultusunun ve engebenin ulaşım koridorlarını doğrudan dikte ettiğini gösteren temel fiziki-beşeri coğrafya gerçekleridir.',
  'Türkiye''de ana ulaşım aksları batı-doğu yönlüdür; çünkü dağlar batı-doğu doğrultusunda uzanır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Türkiye''de çimento fabrikalarının neredeyse her il ve coğrafi bölgeye dengeli ve yaygın olarak dağılmış olmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Çimentonun hammaddesi olan kalker ve kilin Türkiye arazisinde her yerde bolca bulunması ve inşaat sektörünün yerel talebi", "Çimentonun sadece kış aylarında üretilebilmesi", "Çimento fabrikalarının hiç elektrik tüketmemesi", "Devletin çimento üretimini zorunlu kılması", "Çimento ihracatının hava yoluyla yapılması"], "correctIndex": 0}'::jsonb,
  'Çimentonun hammaddesi kireç taşı (kalker), kil ve jipstir. Bu kayaçlar Türkiye''nin hemen her ilinde bolca mevcuttur. Ayrıca çimento ağır ve nakliyesi pahalı bir malzeme olduğundan her bölge kendi fabrikasını kurarak yerel inşaat ihtiyacını karşılar.',
  'Türkiye''de dağılışı en yaygın olan sanayi kolu çimentodur; çünkü hammaddesi (taş/toprak/kil) her yerde vardır.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Türkiye''nin dış ticaretinde önemli bir yer tutan ''sınır ticareti'' (komşu ülkelerle yapılan yerel takas ve ticaret) ile ilgili aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Sınır ticareti sadece sınır illerinde yaşayan vatandaşların ve yerel tüccarların belirli kotalar dahilinde yapabildiği özel bir rejimdir.", "Bölgesel kalkınmayı ve sınır kentlerinde sınır güvenliği ile ekonomik refahı artırmayı hedefler.", "Gümrük vergilerinde özel muafiyetler ve indirimler uygulanır.", "Sınır ticaretinde her türlü ürünün ve silahın sınırsızca alınıp satılması serbesttir.", "Sınır ticareti belgesi valilikler ve ticaret bakanlığı koordinasyonunda verilir."], "correctIndex": 3}'::jsonb,
  'Sınır ticareti sınırsız ve kontrolsüz bir ticaret değildir; kota sistemine tabidir ve uyuşturucu, silah, tütün, petrol gibi stratejik veya tehlikeli maddeler sınır ticareti kapsamı dışındadır.',
  'Sınır ticareti kaçakçılıkla mücadele için getirilen kontrollü ve kotalı bir yerel ticaret sistemidir.'
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
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  3,
  'Türkiye''de sanayileşmiş merkezlerin hava kalitesi ve çevre dengesi incelendiğinde Dilovası (Kocaeli), Ergene Havzası (Tekirdağ) ve Aliağa (İzmir) yörelerinde en büyük ortak çevre felaketi aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede kuraklığa bağlı çölleşme yaşanması", "Aşırı kimyasal, metalurjik ve petrokimya atıklarının akarsulara ve havaya kontrolsüz salınması sonucu ağır sanayi kirliliği", "Bölgede orman alanlarının aşırı genişleyip şehri yutması", "Bölgede obrukların oluşması", "Buzul erimelerinin şehri su altında bırakması"], "correctIndex": 1}'::jsonb,
  'Dilovası (kimya, boya, demir sanayi), Ergene (deri, tekstil boyahaneleri) ve Aliağa (rafineri, petrokimya, demir-çelik cürufu); Türkiye''de sanayi atıklarının toprak, akarsu ve havayı ağır şekilde kirlettiği en riskli çevre kirliliği sıcak noktalarıdır.',
  'Ergene nehrinin renginin siyaha dönmesi ve Dilovası''ndaki hava kirliliği sanayinin plansız ve arıtmasız büyümesinin çevre faturasıdır.'
);

COMMIT;
