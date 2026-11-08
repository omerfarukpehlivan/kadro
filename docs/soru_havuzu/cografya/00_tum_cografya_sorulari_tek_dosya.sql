-- ==========================================================================
-- KADRO KPSS COĞRAFYA MASTER SORU HAVUZU — TÜM KONULAR (360 SORU)
-- 6 Konu x 6 Test (36 Test, 360 Soru)
-- Tamamı '⚠️ ÖSYM Çeldirici Tuzağı' Rozetli
-- ==========================================================================
BEGIN;

-- =============================================================
-- KPSS COĞRAFYA — KONU 1: TÜRKIYE'NIN COĞRAFI KONUMU
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================


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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Türkiye, 36°-42° Kuzey paralelleri ile 26°-45° Doğu meridyenleri arasında yer almaktadır.

Yalnızca bu matematiksel koordinatlar dikkate alındığında Türkiye ile ilgili aşağıdaki yargılardan hangisine kesinlikle ulaşılamaz?',
  '{"options": ["Başlangıç Meridyeni''nin (Greenwich) doğusunda yer aldığına", "Kuzey Yarım Küre''de ve Yengeç Dönencesi''nin kuzeyinde bulunduğuna", "En doğusu ile en batısı arasında 76 dakikalık yerel saat farkı olduğuna", "Ortalama yükseltisinin batıdan doğuya doğru arttığına", "En kuzeyi ile en güneyi arasında kuş uçuşu yaklaşık 666 km mesafe olduğuna"], "correctIndex": 3}'::jsonb,
  'Türkiye''nin ortalama yükseltisinin fazla olması ve batıdan doğuya doğru artması jeolojik oluşum ve orojenik hareketlerle ilgili olup göreceli (özel) konumunun bir sonucudur. Paralel ve meridyen derecelerinden (matematiksel konum) yükselti profili çıkarılamaz.',
  'ÖSYM adayların ''doğu'' kelimesini görünce otomatik olarak meridyenlerle ilişkilendirme ön yargısını kullanır. Yükselti değişimi matematiksel değil, tamamen jeomorfolojik ve özel konum unsurudur.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Türkiye''nin Orta Kuşak''ta (Ilıman Kuşak) yer alması, iklim ve bitki örtüsü üzerinde belirleyici sonuçlar doğurmuştur.

Aşağıdakilerden hangisi Türkiye''nin Orta Kuşak''ta yer aldığının kesin bir kanıtı değildir?',
  '{"options": ["Akdeniz iklim kuşağında yer alması", "Batı rüzgarlarının etkisi altında bulunması", "Yıl içinde dört mevsimin belirgin olarak yaşanması", "Cephesel (frontal) yağışların yaygın görülmesi", "Aynı anda farklı iklim özelliklerinin yaşanabilmesi"], "correctIndex": 4}'::jsonb,
  'Yıl içinde dört mevsimin belirgin yaşanması (yıllık sıcaklık farkları) Orta Kuşak''ta olmanın (matematik konumun) kanıtıdır. Ancak ''aynı gün içinde / aynı anda'' bir yerde kayak yapılırken başka bir yerde denize girilebilmesi yer şekillerinin çeşitliliği, yükselti ve denizellik gibi özel (göreceli) konum faktörlerinin sonucudur.',
  'ÖSYM sınavda en çok ''yıl içinde 4 mevsimin belirgin yaşanması'' (Matematik/Orta Kuşak - A-B-C-D kuralı) ile ''aynı anda 4 mevsim özelliklerinin görülmesi'' (Özel konum/yer şekilleri) arasındaki farkı sorar.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Dünya''nın küresel şekli ve enlem etkisine bağlı olarak Ekvator''dan kutuplara gidildikçe çizgisel dönüş hızı azalır.

Buna göre Türkiye haritası üzerinde işaretlenen aşağıdaki merkezlerin hangisinde Dünya''nın kendi ekseni etrafındaki dönüş hızı (çizgisel hız) en fazladır?',
  '{"options": ["Sinop", "Samsun", "Ankara", "Hatay", "Trabzon"], "correctIndex": 3}'::jsonb,
  'Çizgisel dönüş hızı Ekvator''a en yakın noktalarda en yüksektir. Türkiye''nin en güney ucunda yer alan Hatay (36° K), Ekvator''a diğer illerden daha yakın olduğu için çizgisel hızın en fazla olduğu merkezdir. Sinop (42° K) ise çizgisel hızın en az olduğu ildir.',
  'Adaylar yerçekimi ile çizgisel hızı karıştırabilir. Yerçekimi kutuplara gidildikçe (kuzeye/Sinop''a) artarken, çizgisel hız Ekvator''a (güneye/Hatay''a) yaklaştıkça artar.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Güneş''in doğuşu (tan) ve batışı (grup) esnasında Güneş''in ufuk çizgisinde kalma süresi alacakaranlık süresi olarak adlandırılır. Bu süre çizgisel hızın azaldığı kutuplara doğru uzar.

Buna göre Türkiye''de gün batımını ve gün doğumunu en uzun süre seyretmek isteyen bir gözlemcinin aşağıdaki illerden hangisine gitmesi gerekir?',
  '{"options": ["Muğla", "Antalya", "Şanlıurfa", "Sinop", "Mersin"], "correctIndex": 3}'::jsonb,
  'Alacakaranlık (grup ve tan) süresi çizgisel hız ile ters orantılıdır. Çizgisel hızın en az olduğu en kuzeydeki ilimiz Sinop''ta Güneş''in ufuktan geçişi daha yavaş gerçekleştiği için gün doğumu ve batımı manzarası en uzun süre izlenir.',
  'Antalya veya Muğla turizm merkezi olduğu için adaylar psikolojik olarak gün batımının buralarda daha uzun sürdüğünü düşünebilir. Oysa coğrafi kural gereği kuzeye gidildikçe grup/tan süresi uzar.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Türkiye''de dağların güneye bakan yamaçları, yıl boyunca Güneş ışınlarını kuzey yamaçlara göre daha büyük açıyla alır. Bu durum ''bakı etkisi'' olarak adlandırılır.

Buna göre aşağıdakilerden hangisi Türkiye''deki bir dağın güney yamacında kuzey yamacına göre gözlemlenen bir durum olamaz?',
  '{"options": ["Güneşlenme süresinin daha uzun olması", "Tarım ürünlerinin daha erken olgunlaşması", "Kalıcı kar sınırının (kar başlama yükseltisi) daha yüksek olması", "Tarım ve yerleşme üst sınırının daha alçak olması", "Aynı tür bitkilerin daha erken çiçek açması"], "correctIndex": 3}'::jsonb,
  'Bakı etkisindeki güney yamaçlar daha sıcak olduğu için insanlar daha yükseklere kadar yerleşebilir ve tarım yapabilir. Dolayısıyla tarım, orman ve yerleşme üst sınırı güney yamaçta daha yüksektir (alçak değil).',
  'ÖSYM ''kalıcı kar alt sınırı'' ile ''yerleşme/tarım üst sınırı'' ifadelerini karıştırmayı sever. Sıcak yamaçta kar daha yukarıda erir (kar sınırı yükselir), tarım ise daha yükseklere kadar çıkabilir (tarım üst sınırı yükselir).'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Türkiye Yengeç Dönencesi''nin kuzeyinde (dönenceler dışında) yer almaktadır.

Bu durumun Türkiye üzerindeki doğrudan sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Güneş ışınlarının hiçbir zaman dik (90°) açıyla düşmemesi ve gölge boyunun asla sıfır olmaması", "Doğusu ile batısı arasında 76 dakikalık zaman farkı bulunması", "Maden çeşitliliğinin fazla olması", "Kıyı bölgelerinde nem oranının yüksek olması", "Akarsuların hidroelektrik enerji potansiyellerinin yüksek olması"], "correctIndex": 0}'::jsonb,
  'Güneş ışınları yalnızca dönenceler arasına (23° 27'' K - 23° 27'' G) dik açıyla düşer. Türkiye 36°-42° Kuzey enlemlerinde yani Yengeç Dönencesi''nin kuzeyinde yer aldığı için hiçbir zaman dik açı alamaz ve düz zeminlerde yatay cisimlerin gölgesi asla sıfır olmaz; öğle vakti gölge yönü daima kuzeyi gösterir.',
  'Adaylar dönenceler dışında olmayı bazen mevsim sayıları veya iklim kuşaklarıyla karıştırır. Dönenceler dışında olmanın matematiksel imzası: Dik açı alamama ve gölgenin sıfırlanamamasıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  '21 Mart ve 23 Eylül (Ekinoks) tarihlerinde Güneş ışınları Ekvator''a dik düşer ve tüm Dünya''da gece ile gündüz süreleri 12''şer saat olarak eşitlenir.

Buna göre 21 Mart tarihinde Türkiye ile ilgili olarak aşağıdakilerden hangisi söylenemez?',
  '{"options": ["Tüm illerde gece ve gündüz süresi birbirine eşittir.", "Aynı meridyen üzerinde bulunan merkezlerde Güneş aynı anda doğar ve aynı anda batar.", "Öğle vakti en büyük güneş açısı Hatay''da ölçülür.", "Kuzeye gidildikçe gündüz süresi güneye göre belirgin şekilde uzar.", "Aydınlanma çemberi kutup noktalarından teğet geçer."], "correctIndex": 3}'::jsonb,
  'Ekinoks tarihlerinde (21 Mart ve 23 Eylül) Dünya''nın her yerinde 12 saat gece, 12 saat gündüz yaşanır. Dolayısıyla kuzeye gidildikçe gündüz uzamaz; Sinop''ta da Hatay''da da gündüz süresi tam 12 saattir.',
  'Adaylar 21 Haziran ile Ekinoks tarihlerini karıştırabilir. 21 Haziran''da kuzeye gidildikçe gündüz uzarken, Ekinokslarda gece-gündüz farkı sıfırdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Türkiye''nin en doğusu (45° Doğu - Iğdır/Dilucu) ile en batısı (26° Doğu - Çanakkale/Gökçeada Avlaka Burnu) arasında kaç meridyen ve kaç dakikalık yerel saat farkı bulunmaktadır?',
  '{"options": ["19 meridyen — 76 dakika", "16 meridyen — 64 dakika", "20 meridyen — 80 dakika", "15 meridyen — 60 dakika", "19 meridyen — 95 dakika"], "correctIndex": 0}'::jsonb,
  '45° - 26° = 19 meridyen farkı vardır. İki meridyen arası zaman farkı 4 dakika olduğuna göre: 19 x 4 = 76 dakika (1 saat 16 dakika) yerel saat farkı bulunur.',
  'Meridyenler arası zaman farkının 4 dakika olduğu unutulup 5 dakika ile çarpılması veya paralel farkı olan 6 paralel (42-36) ile karıştırılması en yaygın sınav tuzağıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Türkiye''de kış saati uygulaması kaldırılarak tüm yıl boyunca 45° Doğu boylamının (Iğdır) yerel saati ulusal (ortak) saat olarak kullanılmaya başlanmıştır.

Buna göre ulusal saat ile yerel saat arasındaki zaman farkının en az olduğu ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["İzmir", "Edirne", "Iğdır", "Ankara", "Konya"], "correctIndex": 2}'::jsonb,
  'Ulusal saat olarak 45° Doğu boylamı (Iğdır) kullanıldığı için, Iğdır''ın yerel saati ile Türkiye''nin ulusal saati birbirine eşittir; aradaki zaman farkı 0 dakikadır. En batıdaki illerde (İzmir, Çanakkale, Edirne) ise fark en fazladır (yaklaşık 76 dakika).',
  'Eski 30° Doğu (İzmit) saat dilimi akılda kaldığı için adaylar Kocaeli/İzmit şıkkına yönelebilir. Güncel kalıcı saat dilimimiz 45° Doğu Iğdır (GMT+3)''tür.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi Türkiye''nin ''Göreceli (Özel) Konumu'' ile açıklanamaz?',
  '{"options": ["İstanbul ve Çanakkale boğazlarına sahip olması", "Ortalama yükseltisinin 1132 metre olması", "Üç tarafının denizlerle çevrili bir yarımada olması", "Zengin bor, linyit ve krom yataklarına sahip bulunması", "Güneş ışınlarının geliş açısının güneyden kuzeye doğru daralması"], "correctIndex": 4}'::jsonb,
  'Güneş ışınlarının güneyden kuzeye gidildikçe daha dar açıyla düşmesi Dünya''nın küresel şekli ve enlem derecelerinin (matematik/mutlak konumun) zorunlu bir sonucudur. Boğazlar, yükselti, denizellik ve madenler ise özel konumla ilgilidir.',
  'ÖSYM özel konum ile matematik konum unsurlarını aynı soruda seçeneklere dağıtarak enlem/boylam kökenli olanları ayırt etme becerisini ölçer.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aynı boylam (meridyen) üzerinde yer alan iki farklı merkezde yıl boyunca;
I. Yerel saat,
II. Öğle vakti (Güneş''in en tepeye çıktığı an),
III. Güneş''in doğuş ve batış anları,
IV. Gündüz ve gece süreleri

özelliklerinden hangileri kesinlikle aynıdır?',
  '{"options": ["I ve II", "I ve III", "II ve IV", "I, II ve III", "II, III ve IV"], "correctIndex": 0}'::jsonb,
  'Aynı boylam üzerindeki noktalarda yerel saat ve öğle vakti (günün en tepe anı ve gölgenin en kısa olduğu an) yılın 365 günü aynıdır. Ancak Güneş''in doğuş-batış saatleri ve gece-gündüz süreleri enleme göre değiştiği için sadece 21 Mart ve 23 Eylül (Ekinoks) tarihlerinde aynı olur.',
  'Adayların en büyük tuzağı ''Aynı boylamda Güneş aynı anda doğar'' ezberidir. Güneş aynı boylamda sadece 21 Mart ve 23 Eylül ekinokslarında aynı anda doğup batar; diğer günlerde aydınlanma çemberi eğik geçtiği için doğuş saatleri farklıdır!'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Haziran tarihinde Türkiye''de yaşayan bir araştırmacı, bulunduğu şehirden başka bir şehre gittiğinde hem gündüz süresinin uzadığını hem de yerel saatin daha ileri olduğunu gözlemlemiştir.

Buna göre araştırmacının hareket yönü aşağıdakilerden hangisidir?',
  '{"options": ["Kuzeydoğu", "Kuzeybatı", "Güneydoğu", "Güneybatı", "Yalnızca Doğu"], "correctIndex": 0}'::jsonb,
  '21 Haziran''da Kuzey Yarım Küre''de kuzeye gidildikçe gündüz süresi uzar (Demek ki kuzeye gitmiştir). Yerel saatin daha ileri olması için ise doğuya gidilmesi gerekir. İki bilgi birleştirildiğinde araştırmacının Kuzeydoğu yönünde hareket ettiği anlaşılır.',
  'Tarihe dikkat edilmelidir! Eğer tarih 21 Aralık olsaydı, gündüzün uzaması için güneye gidilmesi gerekirdi (Güneydoğu olurdu). 21 Haziran dediği için kuzeye gidilmelidir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'İzmir ile Van yaklaşık olarak aynı enlem (38° Kuzey) üzerinde yer almalarına rağmen;
- Van''da yıllık ortalama sıcaklık İzmir''den düşüktür.
- Van''da karın yerde kalma süresi ve don olaylı gün sayısı İzmir''den fazladır.
- Van''da tarım ürünleri İzmir''e göre çok daha geç olgunlaşır.

Bu farklılıkların temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Enlem etkisi ve çizgisel hız farkı", "Yükselti ve karasallık farkı", "Güneş ışınlarının geliş açısı", "Bakı yönlerinin farklı olması", "Ekvator''a olan kuş uçuşu uzaklık"], "correctIndex": 1}'::jsonb,
  'Aynı enlem üzerindeki merkezlere Güneş ışınları aynı açıyla gelir ve Ekvator''a uzaklıkları eşittir. İzmir ile Van arasındaki sıcaklık, don ve tarım olgunlaşma farkları enlemle açıklanamaz; Van''ın denizden uzak (karasal) ve ortalama 1700 m daha yüksek (özel konum) olmasıyla açıklanır.',
  'ÖSYM ''Aynı enlemde yer alan iki nokta'' sorusunu sorduğunda, aradaki farklılıkların cevabı ASLA enlem, güneş açısı veya çizgisel hız olamaz; cevap mutlaka yükselti, denizellik/karasallık gibi özel konum faktörleridir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de dağların uzanış doğrultusu incelendiğinde Karadeniz ve Akdeniz''de dağların kıyıya paralel, Ege''de ise kıyıya dik uzandığı görülür.

Bu durumun aşağıdakilerden hangisi üzerinde etkili olduğu savunulamaz?',
  '{"options": ["Ege''de denizel etkinin iç kesimlere kadar sokulabilmesi", "Karadeniz ve Akdeniz''de kıyı ile iç kesim arasındaki ulaşımın geçitlerle sağlanması", "Ege kıyılarının gerçek uzunluğu ile kuş uçuşu uzunluğu arasındaki farkın fazla olması", "Akdeniz kıyılarında Akdeniz ikliminin dar bir kıyı şeridinde sıkışıp kalması", "Türkiye''de güneyden esen rüzgarların sıcaklığı artırması"], "correctIndex": 4}'::jsonb,
  'Güneyden esen rüzgarların (Lodos, Kıble, Samyeli) sıcaklığı artırması, Türkiye''nin Kuzey Yarım Küre''de (matematiksel konumda) yer almasının sonucudur. Dağların kıyıya paralel veya dik uzanmasıyla bir ilgisi yoktur.',
  'Dağların kıyıya uzanış biçimi iklimin iç kesimlere yayılışını, girinti-çıkıntıyı ve ulaşımı belirler; ancak rüzgarların sıcaklık karakteri enlem kökenlidir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye sınırları içerisinde yer alan aşağıdaki sınır kapılarından hangisi Türkiye ile demiryolu bağlantısına sahip değildir?',
  '{"options": ["Kapıkule (Bulgaristan)", "Uzunköprü (Yunanistan)", "Kapıköy (İran)", "Sarp (Gürcistan)", "Nusaybin (Suriye)"], "correctIndex": 3}'::jsonb,
  'Sarp Sınır Kapısı (Artvin/Gürcistan) yalnızca karayolu taşımacılığına açıktır; Doğu Karadeniz''e demiryolu ulaşmadığı için Sarp''ta demiryolu bağlantısı yoktur. (Gürcistan ile demiryolu bağlantısı Kars/Canbaz İstasyonu ve Bakü-Tiflis-Kars hattı üzerinden sağlanır). Kapıkule, Uzunköprü, Kapıköy ve Nusaybin''de demiryolu hattı mevcuttur.',
  'ÖSYM sınır kapılarında demiryolu olan ve olmayan kapıları sormayı çok sever. Sarp ve Habur kapılarında demiryolu hattı YOKTUR.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin en uzun kara sınırı ile en kısa kara sınırına sahip olduğu komşu ülkeler aşağıdakilerin hangisinde sırasıyla doğru olarak verilmiştir?',
  '{"options": ["İran — Nahçıvan (Azerbaycan)", "Suriye — Nahçıvan (Azerbaycan)", "Suriye — Ermenistan", "Irak — Gürcistan", "Yunanistan — Bulgaristan"], "correctIndex": 1}'::jsonb,
  'Türkiye''nin en uzun kara sınırı 911 km ile Suriye iledir. En kısa kara sınırı ise yaklaşık 18 km uzunluk ile Nahçıvan Özerk Cumhuriyeti (Azerbaycan - Dilucu Sınır Kapısı) iledir.',
  'İran ile sınırımız en eski (1639 Kasr-ı Şirin) sınırımızdır ama en uzun sınırımız Suriye''dir. Adaylar eski sınır ile uzun sınırı karıştırabilmektedir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de 21 Aralık tarihinde en uzun gece ile en kısa gündüz yaşanır.

Buna göre 21 Aralık günü aşağıdaki illerden hangisinde gündüz süresi diğerlerine göre daha uzundur?',
  '{"options": ["Sinop", "Trabzon", "Ankara", "Konya", "Mersin"], "correctIndex": 4}'::jsonb,
  '21 Aralık''ta Güneş ışınları Oğlak Dönencesi''ne (Güney Yarım Küre) dik düşer. Bu tarihte güneye (Ekvator''a) doğru gidildikçe gündüz süresi uzar, gece kısalır. Seçenekler arasında en güneyde yer alan Mersin''de gündüz süresi Sinop veya Ankara''ya göre daha uzundur.',
  'Adayların aklında ''kuzeye gidildikçe gündüz uzar'' genellemesi kalır. Oysa bu kural yalnızca 21 Haziran için geçerlidir! 21 Aralık kış gün dönümünde güneye gidildikçe gündüz uzar.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de güneyden kuzeye doğru gidildikçe meydana gelen değişimlerle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Güneş ışınlarının geliş açısı — Daralır", "Cisimlerin öğle vakti gölge boyu — Uzar", "Denizlerin tuzluluk oranı — Azalır", "Yerçekimi kuvveti — Azalır", "Çizgisel dönüş hızı — Azalır"], "correctIndex": 3}'::jsonb,
  'Dünya kutuplardan basık (geoit) olduğu için kutuplar yerin merkezine daha yakındır. Bu nedenle Ekvator''dan kutuplara (güneyden kuzeye) gidildikçe yerçekimi kuvveti artar (azalmaz). Hatay''dan Sinop''a gidildikçe cisimlerin ağırlığı/yerçekimi artar.',
  'Tuzluluk, sıcaklık ve çizgisel hız kuzeye gidildikçe azalırken, yerçekimi ve gölge boyu kutuplara doğru ARTAR.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye üzerinden geçen Hazar ve Orta Doğu petrol ile doğal gaz boru hatları (BTC, TANAP, Kerkük-Yumurtalık, TürkAkım), Türkiye''yi uluslararası bir enerji koridoru ve enerji terminali hâline getirmiştir.

Bu durum Türkiye''nin coğrafi konumunun hangi boyutuyla doğrudan ilişkilidir?',
  '{"options": ["Jeopolitik ve jeostratejik konumu", "Mutlak matematiksel konumu", "Ilıman iklim kuşağında yer alması", "Dönencelerin dışında bulunması", "Yıllık yağış miktarının dengeli olması"], "correctIndex": 0}'::jsonb,
  'Zengin petrol ve doğal gaz yataklarına sahip Orta Doğu/Kafkaslar ile bu enerjiyi tüketen sanayileşmiş Avrupa kıtası arasında bir köprü görevi görmesi, Türkiye''nin jeopolitik, jeostratejik ve göreceli konumunun doğrudan sonucudur.',
  'Enerji koridoru olmak enlem ve boylam derecelerine değil, komşuluk ilişkilerine, kıtalar arasındaki kavşak noktası niteliğine ve siyasi-iktisadi jeopolitiğe bağlıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Karadeniz kıyısındaki dağların kuzey yamaçları deniz etkisiyle kış mevsiminde ılık geçerken, güney yamaçları karasal etkilerle daha soğuk olabilmektedir.

Bu durum aşağıdakilerden hangisine ''aykırı'' (istisnai) bir örnek oluşturur?',
  '{"options": ["Bakı kuralına", "Denizellik etkisine", "Yükselti kuralına", "Boylam etkisine", "Çizgisel hız kuralına"], "correctIndex": 0}'::jsonb,
  'Kuzey Yarım Küre''deki bakı kuralına göre güney yamaçların daima kuzey yamaçlardan daha sıcak olması beklenir. Ancak Karadeniz kıyı dağlarında kışın kuzey yamacın denizellik sayesinde güney yamaçtan daha ılık olması, genel bakı kuralına özel konumun getirdiği istisnai bir durumdur.',
  'ÖSYM ''Bakı kuralına aykırılık'' sorusunu tam olarak Karadeniz Dağları örneği üzerinden sormaktadır. Kış mevsiminde Karadeniz''in kuzey yamacının güneyden daha ılık olması bakı kuralını bozan özel konum örneğidir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de kış mevsiminde Akdeniz kıyılarında yağmur yağarken, aynı tarihte Erzurum-Kars Platosu''nda kar yağışı ve şiddetli don olayları görülmektedir.

Bu durum aşağıdakilerden hangisinin kanıtıdır?',
  '{"options": ["Türkiye''nin Doğu Yarım Küre''de yer aldığının", "Türkiye''de aynı anda farklı iklim ve hava koşullarının yaşanabildiğinin", "Türkiye''nin yıllık sıcaklık farklarının az olduğunun", "Meridyenler arası mesafenin kutuplara doğru daraldığının", "Türkiye''de yalnızca bir iklim tipinin etkili olduğunun"], "correctIndex": 1}'::jsonb,
  'Aynı anda bir bölgede ılık ve yağmurlu, başka bir bölgede dondurucu kar yağışlı havanın görülmesi kısa mesafelerde yer şekilleri, denizellik ve yükseltinin değiştiğini yani aynı anda farklı mevsim/hava özelliklerinin yaşandığını kanıtlar.',
  'Aynı anda farklı iklim özelliklerinin görülmesi ''Özel Konum''dur; yıl içinde dört mevsimin peş peşe yaşanması ise ''Matematik Konum''dur.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de gölge boyu ve gölge yönü ile ilgili aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Düz zeminlerdeki dikey cisimlerin öğle vakti gölge yönü daima kuzeyi gösterir.", "Yıl içinde en kısa gölge boyu 21 Haziran günü öğle vaktinde ölçülür.", "Yıl içinde en uzun gölge boyu 21 Aralık günü öğle vaktinde ölçülür.", "Güneş ışınları 21 Haziran''da Hatay''a dik (90°) açıyla geldiğinden gölge boyu sıfır olur.", "Aynı boy boylamındaki iki merkezden kuzeyde olanında öğle vakti gölge boyu daima daha uzundur."], "correctIndex": 3}'::jsonb,
  'Türkiye Yengeç Dönencesi''nin (23° 27'' K) kuzeyinde yer aldığı için en güneydeki ilimiz Hatay''a dahi Güneş ışınları hiçbir zaman 90° açıyla düşemez. En büyük açısını 21 Haziran''da yaklaşık 77° ile alır ve gölge boyu asla sıfır olmaz.',
  'Bazı adaylar 21 Haziran''da Türkiye''nin en güneyine güneşin dik geldiğini sanır. Türkiye''nin hiçbir yerine güneş asla 90 derece açıyla gelemez.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Akdeniz''in Karadeniz''e göre daha tuzlu olması ve deniz suyu sıcaklığının daha yüksek olması, temel olarak hangi coğrafi faktörle açıklanır?',
  '{"options": ["Akdeniz''in ortalama derinliğinin fazla olması", "Enlem etkisi nedeniyle buharlaşma şiddetinin güneyde daha fazla olması", "Karadeniz''e dökülen akarsu sayısının az olması", "Akdeniz''deki dalga ve akıntıların yönü", "Karadeniz kıyılarında orman örtüsünün yoğun olması"], "correctIndex": 1}'::jsonb,
  'Akdeniz Ekvator''a daha yakın olduğu için güneş ışınlarını daha büyük açıyla alır, sıcaklık ve buharlaşma fazladır. Buharlaşan su geride tuzu bıraktığı için güneydeki Akdeniz''in tuzluluğu (yaklaşık ‰38) kuzeydeki Karadeniz''e (yaklaşık ‰18) göre çok daha yüksektir. Bu durum doğrudan ''enlem'' etkisidir.',
  'Karadeniz''in tatlı suyla beslenmesi tuzluluğu azaltan bir etkendir ancak deniz suyu sıcaklığı ve buharlaşma farkının kök nedeni matematiksel enlem derecesidir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin aşağıdaki özelliklerinden hangisi ''Matematiksel (Mutlak) Konum''unun bir sonucu değildir?',
  '{"options": ["Güneyden esen rüzgarların hava sıcaklığını artırması", "Dağların güney yamaçlarında karların kuzey yamaçlara göre daha erken erimesi", "Kuzeydoğu Anadolu''da (Erzurum-Kars) yaylacılık faaliyetlerinin yaygın olması", "Cephe yağışlarının kış aylarında geniş alanlarda etkili olması", "Yıllık güneş ışınları geliş açısı farkının tropikal kuşağa göre daha belirgin olması"], "correctIndex": 2}'::jsonb,
  'Erzurum-Kars''ta yaylacılığın yaygın olması, bölgenin ortalama 2000 metre yükseltiye sahip olması ve yaz yağışlarıyla gür alpin çayırların yeşermesiyle (özel konumla) ilgilidir. Rüzgar yönü, bakı, cephe yağışları ve açı farkları enlemle ilgilidir.',
  'Ekonomik faaliyetlerin birçoğu (yaylacılık, madencilik, sanayi) doğrudan özel konum ve yer şekillerine dayanır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de doğu-batı doğrultusunda yaklaşık 19 boylam farkı olmasına rağmen ülke genelinde tek bir ulusal (ortak) saat kullanılmaktadır.

Aşağıdakilerden hangisi Türkiye''de birden fazla ortak saat kullanılmamasının temel gerekçesidir?',
  '{"options": ["Doğu-batı yönlü genişliğinin (meridyen farkının) az olması", "Kuzey-güney yönlü enlem farkının fazla olması", "Nüfusun büyük bölümünün batı illerinde toplanması", "Sanayi tesislerinin Marmara Bölgesi''nde yoğunlaşması", "Ekonomik tasarruf sağlamak amacıyla yaz saatinin kaldırılması"], "correctIndex": 0}'::jsonb,
  'Rusya, ABD ve Kanada gibi doğu-batı yönünde çok geniş olan ve onlarca meridyen farkı bulunan ülkelerde mecburen birden fazla ortak saat dilimi kullanılır. Türkiye''nin doğusu ile batısı arasında sadece 19 meridyen (1 saat 16 dakika) fark olduğu için tek bir ulusal saat kullanılması resmi ve ticari hayatı aksatmaz.',
  'Adaylar doğu-batı genişliği yerine kuzey-güney genişliğini işaretleyebilir. Saat boylamla (meridyenle) ilgilidir; enlem saat üzerinde etkili değildir!'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin jeopolitik önemini artıran aşağıdaki unsurlardan hangisi zaman içerisinde ''değişmeyen'' (statik) doğal unsurlar arasında yer alır?',
  '{"options": ["İstanbul ve Çanakkale boğazlarının coğrafi varlığı", "Bölgesel askeri ve siyasi paktlara üye olması", "Uluslararası petrol ve doğal gaz boru hatlarının güzergahı olması", "Nüfus miktarı ve genç nüfus oranı", "Ekonomik ve teknolojik kalkınma düzeyi"], "correctIndex": 0}'::jsonb,
  'Jeopolitiğin statik (değişmeyen) unsurları: Coğrafi konum, jeolojik-jeomorfolojik yapı, kıtalar arasındaki kara/deniz konumu ve boğazlardır. Nüfus, askeri güç, ekonomi ve boru hatları ise zamanla değişebilen dinamik unsurlardır.',
  'ÖSYM jeopolitik unsurları ''değişen'' (dinamik: ekonomi, askeri güç, boru hatları) ve ''değişmeyen'' (statik: coğrafi konum, ada/kıta yapısı, boğazlar) olarak gruplandırır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '23 Eylül tarihinde Samsun''da Güneş yerel saatle 06.00''da doğmuştur.

Aynı meridyen üzerinde yer alan ve Samsun''un güneyinde bulunan Çorum''da 23 Eylül günü Güneş yerel saatle kaçta doğar?',
  '{"options": ["05.40", "06.00", "06.20", "06.40", "07.00"], "correctIndex": 1}'::jsonb,
  '23 Eylül ekinoks günüdür. Ekinoks günlerinde aydınlanma çemberi kutup noktalarından geçtiği için AYNI MERİDYEN üzerindeki tüm noktalarda Güneş aynı yerel saatte doğar (06.00) ve aynı yerel saatte batar (18.00). Bu nedenle Çorum''da da Güneş tam 06.00''da doğar.',
  'Adaylar ekinoks tarihini atlayıp güneyde günün daha erken başladığını veya enlem hesabı yapmaları gerektiğini düşünür. Ekinoksta aynı boylamda doğuş saati kesinlikle aynıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aşağıdaki boğaz ve kanallardan hangisi Türkiye''nin Karadeniz üzerinden dünya deniz ticaretine açılmasında doğrudan bir geçiş noktası oluşturmaz?',
  '{"options": ["İstanbul Boğazı", "Çanakkale Boğazı", "Süveyş Kanalı", "Hürmüz Boğazı", "Cebelitarık Boğazı"], "correctIndex": 3}'::jsonb,
  'Karadeniz''den çıkan bir gemi İstanbul ve Çanakkale boğazlarını geçerek Ege ve Akdeniz''e ulaşır. Buradan Cebelitarık ile Atlas Okyanusu''na, Süveyş Kanalı ile Hint Okyanusu''na açılabilir. Ancak Hürmüz Boğazı Basra Körfezi''nin çıkışında (İran-Umman arası) yer alır; Karadeniz çıkışlı açık deniz rotasında zorunlu bir geçiş noktası değildir.',
  'Hürmüz Boğazı petrol sevkiyatı boğazıdır. Türkiye''nin deniz ulaşımı ve boğazlar bağlantı ekseninde doğrudan yer almaz.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi Türkiye''nin jeopolitik konumunun kazandırdığı avantajlardan biri değildir?',
  '{"options": ["Zengin Hazar havzası enerjisinin Avrupa''ya taşınmasında kilit transit ülke olması", "Karadeniz''e kıyısı olan ülkelerin Akdeniz ve açık denizlere tek çıkış kapısı olması", "Ortadoğu, Kafkasya ve Balkanlar gibi jeopolitik açıdan kritik üç bölgenin merkezinde yer alması", "Okyanus akıntılarının kıyılarında zengin balık popülasyonu oluşturması", "Doğu ile Batı kültür ve ticaret yollarının kavşağında bulunması"], "correctIndex": 3}'::jsonb,
  'Türkiye okyanuslara doğrudan kıyısı olmayan bir iç deniz (Akdeniz, Ege, Karadeniz) ülkesidir. Dolayısıyla Körfez Akıntısı (Gulf Stream) gibi büyük okyanus akıntılarından etkilenmez.',
  'Türkiye''nin okyanusa kıyısı olmadığı için ne gelgit genliği fazladır ne de okyanus akıntıları görülür. Bu tuzak sıkça karşımıza çıkar.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de rüzgarların sıcaklık üzerindeki etkisi incelendiğinde;
- Karayel, Yıldız ve Poyraz sıcaklığı düşürürken,
- Samyeli (Keşişleme), Kıble ve Lodos sıcaklığı yükseltmektedir.

Bu durum Türkiye''nin hangi özelliği ile doğrudan açıklanır?',
  '{"options": ["Kuzey Yarım Küre''de yer almasıyla", "Doğu Yarım Küre''de bulunmasıyla", "Etrafının denizlerle çevrili olmasıyla", "Genç oluşumlu bir arazi yapısına sahip olmasıyla", "Ortalama yükseltisinin fazla olmasıyla"], "correctIndex": 0}'::jsonb,
  'Kuzey Yarım Küre''de kutup bölgesi kuzeyde, Ekvator ise güneyde yer alır. Bu nedenle kuzeyden esen rüzgarlar kutup kaynaklı olup sıcaklığı düşürür; güneyden esen rüzgarlar ise Ekvator/çöl kaynaklı olup sıcaklığı yükseltir.',
  'Eğer Türkiye Güney Yarım Küre''de olsaydı bu durumun tam tersi gerçekleşirdi (kuzeyden esenler ısıtır, güneyden esenler soğuturdu). Bu tamamen KYK sonucudur.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''de yer alan iki farklı merkezin;
- Yıl boyunca gece-gündüz süre farklarının birbirine eşit olduğu,
- 21 Haziran günü öğle vaktinde Güneş ışınlarını aynı açıyla aldıkları,
- Çizgisel hızlarının ve grup-tan sürelerinin birebir aynı olduğu tespit edilmiştir.

Buna göre bu iki merkez hakkında kesin olarak yapılabilecek çıkarım aşağıdakilerden hangisidir?',
  '{"options": ["Aynı boylam üzerinde yer aldıkları", "Aynı enlem dairesi üzerinde yer aldıkları", "Aynı coğrafi bölge sınırları içerisinde bulundukları", "Deniz seviyesinden yükseltilerinin eşit olduğu", "Başlangıç Meridyeni''ne olan açısal mesafelerinin aynı olduğu"], "correctIndex": 1}'::jsonb,
  'Çizgisel hız, grup-tan süresi, gece-gündüz süre farkı ve belirli bir tarihte Güneş ışınlarının geliş açısı yalnızca ve yalnızca ''enlem'' derecesine bağlıdır. Bu özelliklerin tamamı eşitse iki merkez kesinlikle aynı enlem üzerindedir.',
  'Adaylar yerel saat veya öğle anı ile enlem özelliklerini karıştırabilir. Boylam yerel saati; enlem ise çizgisel hızı, gece-gündüz farkını ve güneş açısını belirler.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''nin jeomorfolojik ve topoğrafik yapısı dikkate alındığında, ''Kuzeye doğru gidildikçe sıcaklık düzenli olarak azalır'' şeklindeki enlem kuralına aşağıdaki örneklerden hangisi açıkça ters düşer?',
  '{"options": ["Sinop''un yıllık sıcaklık ortalamasının Mersin''den düşük olması", "Kış mevsiminde Samsun''un sıcaklık ortalamasının Ankara ve Sivas''tan daha yüksek olması", "Bursa''nın yaz sıcaklıklarının Antalya''dan düşük olması", "Trabzon''un yıllık güneşlenme süresinin Adana''dan az olması", "İstanbul''un çizgisel hızının Muğla''dan az olması"], "correctIndex": 1}'::jsonb,
  'Normal enlem kuralına göre daha kuzeyde olan Samsun''un daha güneydeki Ankara ve Sivas''tan soğuk olması gerekir. Ancak kış aylarında deniz seviyesinde ve nemli olan Samsun, denizellik sayesinde yüksek ve karasal olan Ankara ve Sivas''tan daha sıcaktır. Bu durum enlem-sıcaklık ilişkisine aykırıdır.',
  'Enlem çelişkisi sorularında her zaman kuzeyde olmasına rağmen denizellik sayesinde güneyindeki karasal/yüksek ilden daha sıcak olan merkezler aranmalıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'I. Kıyı Ege''de horst-graben sisteminin doğu-batı uzanması
II. Karadeniz''de fön rüzgarlarına bağlı olarak Rize''de turunçgil yetişmesi
III. Akdeniz kıyılarında cephe yağışlarının kış aylarında etkili olması
IV. Erzurum''da buğday hasadının Adana''dan yaklaşık 40 gün sonra yapılması

Yukarıda verilen durumlardan hangileri ''Göreceli (Özel) Konum'' faktörleri ile açıklanır?',
  '{"options": ["Yalnız I", "I ve II", "I, II ve IV", "II ve III", "I, II, III ve IV"], "correctIndex": 2}'::jsonb,
  'I (Kırık dağ yapısı), II (Rize mikrokliması ve fön rüzgarı) ve IV (Erzurum''un yüksekliğinden dolayı hasadın gecikmesi) özel konumdur. III numaralı öncüldeki cephe (frontal) yağışları ise Türkiye''nin Orta Kuşak''ta yer almasının (matematiksel mutlak konumun) zorunlu sonucudur.',
  'Cephe yağışları daima Akdeniz havzası ve Orta Kuşak göstergesidir; mutlak konumdur. Mikroklima ve hasat süresi ise yükselti ve yer şekillerine bağlı özel konumdur.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''de 21 Haziran tarihinde;
- Sinop''ta gündüz süresi yaklaşık 15 saat 15 dakika,
- Hatay''da ise gündüz süresi yaklaşık 14 saat 40 dakikadır.

Sinop ile Hatay arasındaki bu 35 dakikalık gündüz süresi farkının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Yerel saat farkı", "Eksen eğikliği ve enlem farkı", "Yükselti ve karasallık", "Boylam derecelerinin farklı olması", "Türkiye''nin jeolojik yaşı"], "correctIndex": 1}'::jsonb,
  'Dünya''nın eksen eğikliği (23° 27'') ve yıllık hareketi nedeniyle 21 Haziran''da Kuzey Yarım Küre''de kuzeye gidildikçe gündüz süresi uzar. Sinop daha kuzeyde yer aldığı için Hatay''dan daha uzun gündüz yaşar. Bu durum enlem ve eksen eğikliğinin sonucudur.',
  'Adaylar süre farkını meridyenle ilişkilendirip ''boylam'' diyebilir. Gece-gündüz süre UZUNLUĞU enlemle belirlenir; yerel saat ise boylamla belirlenir.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Aşağıdaki sınır kapılarından hangisi karşısında belirtilen komşu ülke ile olan bağlantıyı sağlamaz?',
  '{"options": ["Kapıkule — Bulgaristan", "İpsala — Yunanistan", "Gürbulak — İran", "Öncüpınar — Suriye", "Habur — İran"], "correctIndex": 4}'::jsonb,
  'Habur Sınır Kapısı (Şırnak/Silopi), Türkiye ile Irak arasındaki en önemli sınır kapısıdır. İran sınır kapılarımız ise Gürbulak (Ağrı), Esendere (Hakkari) ve Kapıköy''dür (Van).',
  'ÖSYM sınır kapılarında Habur (Irak) ile Gürbulak/Esendere (İran) eşleştirmelerini çeldirici olarak kullanmayı çok sever.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''nin topoğrafyası ve dağ sıraları dikkate alındığında, aşağıdaki limanlardan hangisinin ard bölgesiyle (hinterland) olan demiryolu ve karayolu bağlantısı doğal dağ engeli nedeniyle ''en dardır''?',
  '{"options": ["Mersin Limanı", "İzmir Limanı", "İskenderun Limanı", "Sinop Limanı", "Samsun Limanı"], "correctIndex": 3}'::jsonb,
  'Sinop Limanı Karadeniz''deki tek doğal liman olmasına rağmen, hemen arkasında yükselen Küre Dağları ulaşımı engellediği ve demiryolu bağlantısı olmadığı için hinterlandı son derece dardır ve gelişememiştir. Samsun Limanı ise Canik Dağları alçak olduğu ve Kızılırmak-Yeşilırmak vadileriyle iç kesimlere kolay bağlanıp demiryolu olduğu için çok geniş bir hinterlanda sahiptir.',
  'ÖSYM''nin en meşhur çeldiricisi ''Sinop doğal limandır ama hinterlandı dardır, Samsun ise yapay limandır ama Canik Dağları alçak olduğu için hinterlandı geniştir'' kıyaslamasıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''de yer alan bir cismin gölgesi yılın hiçbir döneminde güney yönünü göstermez ve hiçbir zaman sıfır olmaz.

Bu gözlem Türkiye''nin coğrafi konumu hakkında aşağıdaki yargılardan hangisini doğrudan kanıtlar?',
  '{"options": ["Kuzey Kutup Dairesi''nin kuzeyinde yer aldığını", "Yengeç Dönencesi''nin kuzeyinde bulunduğunu", "Ekvator ile Yengeç Dönencesi arasında yer aldığını", "Başlangıç Meridyeni''nin batısında olduğunu", "Doğu ve Batı yarım kürelerin kesişim noktasında bulunduğunu"], "correctIndex": 1}'::jsonb,
  'Güneş ışınları en son Yengeç Dönencesi''ne (23° 27'' K) dik açıyla gelir. Türkiye 36°-42° Kuzey paralellerinde yer aldığı için Güneş ışınları daima güneyden gelir ve yatay düzlemdeki cisimlerin gölgesi öğle vakti her zaman KUZEY yönüne düşer, hiçbir zaman da sıfır olmaz.',
  'Adaylar dönencenin kuzeyinde olmak ile kutup dairesinin güneyinde olmak kavramlarını birbirine karıştırabilir. Gölgenin sıfır olmaması ve daima kuzeyi göstermesi dönenceler dışında olmanın (Yengeç kuzeyinde olmanın) kuralıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''de Çanakkale (26° Doğu) ile Iğdır (45° Doğu) illeri incelendiğinde;
I. Başlangıç Meridyeni ile aralarındaki zaman farkı,
II. Çizgisel dönüş hızları,
III. Güneş''in tepe noktasına geldiği an (öğle vakti),
IV. 21 Mart günü gündüz süreleri

özelliklerinden hangilerinin bu iki ilde birbirine ''eşit'' olduğu söylenebilir?',
  '{"options": ["Yalnız IV", "I ve III", "II ve IV", "I, II ve III", "III ve IV"], "correctIndex": 0}'::jsonb,
  'Çanakkale (yaklaşık 40° K) ile Iğdır (yaklaşık 40° K) aynı enlem derecesine çok yakındır. Ancak boylamları farklıdır (26° D ve 45° D). 21 Mart günü Dünya''nın her yerinde gündüz 12 saattir (IV kesin eşittir). Iğdır''da yerel saat 76 dakika daha ileridir, öğle vakti daha önce yaşanır (I ve III farklıdır).',
  'Aynı ekinoks gününde tüm illerde gündüz süresi 12 saattir. Meridyen farkı saatleri değiştirir ama ekinokstaki gece-gündüz uzunluğunu değiştirmez.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Aşağıdakilerden hangisi Türkiye''nin ''Jeopolitik Konumu''nda son yıllarda stratejik değerini en çok artıran gelişmelerden biridir?',
  '{"options": ["Yerel saat farkının azaltılması", "Hazar ve Ortadoğu doğal gazını Avrupa''ya taşıyan TANAP ve TürkAkım gibi uluslararası boru hattı projelerinin hayata geçmesi", "İç Anadolu''da buğday tarımının yaygınlaşması", "Karadeniz''de balıkçılık kotasının artırılması", "Kış mevsiminde kar yağışlarının etkili olması"], "correctIndex": 1}'::jsonb,
  'TANAP (Trans Anadolu Doğal Gaz Boru Hattı) ve TürkAkım projeleri Türkiye''yi enerji arz güvenliğinde vazgeçilmez bir transit köprü ve enerji ticaret merkezi (hub) konumuna yükselterek jeopolitik ağırlığını küresel çapta artırmıştır.',
  'Boru hatları ve enerji koridoru projeleri güncel KPSS''de jeopolitik konumun en favori soru alanıdır.'
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  3,
  'Türkiye''de aynı anda farklı hava koşullarının yaşanabilmesi (örneğin Antalya kıyılarında denize girilirken Torosların zirvesinde kayak yapılabilmesi) aşağıdakilerden hangisiyle doğrudan çelişir gibi görünse de aslında özel konumun bir kanıtıdır?',
  '{"options": ["Meridyenler arası zaman farkının sabit olmasıyla", "Güneş ışınlarının geliş açısının yalnızca enleme bağlı olarak değiştiği kuralıyla", "Dünya''nın kendi ekseni etrafında batıdan doğuya dönmesiyle", "Yerel saatlerin boylama göre düzenlenmesiyle", "Ekinokslarda gece-gündüzün eşit olmasıyla"], "correctIndex": 1}'::jsonb,
  'Teorik kurala göre aynı enlemde ya da birbirine çok yakın mesafelerde sıcaklığın aynı olması gerekir. Ancak Antalya kıyısı ile Toroslar arasında 30 km mesafede sıcaklığın 20°C değişebilmesi, enlemin tek belirleyici olmadığını; yükselti ve yer şekillerinin (özel konumun) enlem kuralını tamamen değiştirebildiğini gösterir.',
  'Kısa mesafede yer şekillerinin ve sıcaklığın aniden değişmesi ''Özel Konum''un en klasik göstergesidir.'
);

-- =============================================================
-- KPSS COĞRAFYA — KONU 3: TÜRKIYE'DE NÜFUS VE YERLEŞME
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================


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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Cumhuriyet döneminde Türkiye''de ilk genel nüfus sayımı hangi yılda yapılmıştır?',
  '{"options": ["1923", "1927", "1935", "1940", "1950"], "correctIndex": 1}'::jsonb,
  'Cumhuriyet tarihinin ilk resmi genel nüfus sayımı 28 Ekim 1927 tarihinde gerçekleştirilmiş ve Türkiye nüfusu 13.6 milyon olarak tespit edilmiştir. İkinci sayım 1935''te yapılmış ve bundan sonra 1990''a kadar her 5 yılda bir tekrarlanmıştır.',
  'Cumhuriyet 1923''te ilan edilse de ilk nüfus sayımı savaştan yeni çıkmış ülkenin toparlanması beklenerek 1927 yılında yapılabilmiştir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''nin nüfus artış hızı grafiği incelendiğinde, nüfus artış hızının Cumhuriyet tarihinin en düşük seviyesine (yaklaşık binde 10,5) gerilediği dönem aşağıdakilerden hangisidir?',
  '{"options": ["1927 - 1935 Dönemi", "1940 - 1945 Dönemi", "1955 - 1960 Dönemi", "1970 - 1975 Dönemi", "1995 - 2000 Dönemi"], "correctIndex": 1}'::jsonb,
  '1940-1945 yılları arasında II. Dünya Savaşı tehlikesi nedeniyle Türkiye savaşa fiilen girmese de genel seferberlik ilan etmiş, genç erkek nüfus uzun süre silah altına alınmıştır. Bu durum evlilik ve doğum oranlarını düşürmüş, nüfus artış hızını tarihi dip seviyeye çekmiştir.',
  'Nüfus artış hızı düşmüştür ancak toplam nüfus miktarı azalmamıştır! Artış hızı binde 10 bile olsa nüfus büyümeye devam etmiştir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Toplam nüfusun ülkenin veya bir bölgenin yüz ölçümüne bölünmesiyle elde edilen nüfus yoğunluğuna ne ad verilir?',
  '{"options": ["Fizyolojik Nüfus Yoğunluğu", "Tarımsal Nüfus Yoğunluğu", "Aritmetik Nüfus Yoğunluğu", "Ekonomik Nüfus Yoğunluğu", "Kentsel Nüfus Yoğunluğu"], "correctIndex": 2}'::jsonb,
  'Toplam Nüfus / Toplam Yüzölçümü formülüyle hesaplanan ve km²''ye düşen kişi sayısını ifade eden kavrama ''Aritmetik Nüfus Yoğunluğu'' denir.',
  'Fizyolojik yoğunluk toplam nüfusun ''tarım alanlarına'' bölünmesiyle; tarımsal yoğunluk ise sadece ''tarımla uğraşan nüfusun'' tarım alanlarına bölünmesiyle bulunur.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''de aritmetik nüfus yoğunluğunun en fazla olduğu coğrafi bölge aşağıdakilerden hangisidir?',
  '{"options": ["Ege Bölgesi", "Akdeniz Bölgesi", "Marmara Bölgesi", "İç Anadolu Bölgesi", "Güneydoğu Anadolu Bölgesi"], "correctIndex": 2}'::jsonb,
  'Marmara Bölgesi, yüz ölçümü bakımından Türkiye''nin en küçük ikinci bölgesi olmasına rağmen İstanbul, Kocaeli, Bursa gibi dev metropol ve sanayi kentlerini barındırdığı için km²''ye düşen kişi sayısının (aritmetik nüfus yoğunluğunun) en yüksek olduğu bölgedir.',
  'İç Anadolu ve Doğu Anadolu yüz ölçümü çok geniş olduğu için nüfus yoğunlukları düşüktür; Doğu Anadolu aritmetik yoğunluğun en düşük olduğu bölgedir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''de kırsal yerleşmelerde konut yapımında kullanılan doğal malzemeler iklim ve jeolojik yapıya göre şekillenir.

Karadeniz Bölgesi''nin kırsal kesimlerinde ahşap, İç ve Güneydoğu Anadolu''da kerpiç kullanılırken, Akdeniz ve Doğu Anadolu kırsalında konut yapımında en yaygın kullanılan geleneksel doğal malzeme aşağıdakilerden hangisidir?',
  '{"options": ["Tuğla", "Betonarme", "Taş", "Çelik", "Kamış ve Saz"], "correctIndex": 2}'::jsonb,
  'Akdeniz''de kireç taşının (kalker), Doğu ve İç Anadolu''nun volkanik yörelerinde (Nevşehir, Kars vb.) ise volkanik tüf ve bazalt taşının bol olması nedeniyle geleneksel kırsal konutlarda temel malzeme ''taş''tır.',
  'Karadeniz = Ahşap (orman bol), İç ve Güneydoğu Anadolu = Kerpiç (kurak, yağış az), Akdeniz ve volkanik platolar = Taş (kalker ve volkanik kayaçlar).'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Ege kıyılarında Akdeniz iklimi görülmesine ve deniz kıyısında yer almasına rağmen Menteşe Yöresi''nin (Muğla ve çevresi) seyrek nüfuslu olmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Yıllık yağış miktarının yetersiz olması", "Arazinin çok dağlık ve engebeli olması, ana ulaşım hatlarına sapa kalması", "Yaz aylarında turizm faaliyetlerinin durması", "Bölgede deprem riskinin hiç bulunmaması", "Kış sıcaklıklarının sıfırın altına inmesi"], "correctIndex": 1}'::jsonb,
  'Menteşe Yöresi bol yağış almasına ve kıyıda olmasına rağmen çok engebeli ve kırıklı dağlık bir topoğrafyaya sahiptir. Tarım alanları dar ve parçalıdır, ayrıca ana ulaşım akslarının kenarında kaldığı için nüfusu seyrektir.',
  'Menteşe bol yağış alır (Türkiye''nin en çok yağış alan yerlerindendir); az nüfuslanmanın nedeni iklim değil, yer şekillerinin engebeli olmasıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Kırsal alanda evlerin birbirinden kilometrelerce uzakta, dağınık bir şekilde kurulduğu ''dağınık yerleşme dokusu'' Türkiye''de en belirgin olarak hangi bölgede görülür?',
  '{"options": ["İç Anadolu Bölgesi", "Doğu Karadeniz Bölümü", "Güneydoğu Anadolu Bölgesi", "Ergene Havzası", "Konya Kapalı Havzası"], "correctIndex": 1}'::jsonb,
  'Dağınık yerleşmenin görülebilmesi için iki temel şart gerekir: 1) Su kaynaklarının her yerde bol olması, 2) Yer şekillerinin çok engebeli ve tarım arazilerinin küçük parçalar halinde dağılmış olması. Bu şartların en kusursuz örneği Doğu Karadeniz''dir.',
  'Toplu yerleşme düzlük ve kurak alanlarda (İç Anadolu); dağınık yerleşme ise dağlık ve bol sulu alanlarda (Karadeniz) görülür.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi köyden kente yapılan iç göçlerin ''itici'' faktörleri arasında yer almaz?',
  '{"options": ["Tarımsal arazilerin miras yoluyla küçülüp aileleri geçindiremez hale gelmesi", "Tarımda makineleşmeyle birlikte kırsalda insan gücüne duyulan ihtiyacın azalması", "Kentlerde sanayi, ticaret ve hizmet sektörlerinde iş imkanlarının fazla olması", "Kırsal kesimde eğitim ve sağlık hizmetlerinin yetersiz kalması", "Kırsalda kuraklık ve erozyon nedeniyle toprak veriminin düşmesi"], "correctIndex": 2}'::jsonb,
  'Kentlerdeki geniş iş imkanları, zengin eğitim ve sağlık olanakları göçün ''çekici'' (kente çeken) faktörleridir. Kırsaldaki işsizlik, miras bölünmesi, makineleşme ve altyapı yetersizliği ise ''itici'' faktörlerdir.',
  'ÖSYM ''itici'' (kırsalın olumsuzlukları) ve ''çekici'' (kentin cazip olanakları) faktörleri eşleştirme sorularında sıkça karşı karşıya getirir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Köy altı yerleşmeleri yerleşme süresine göre sürekli (kalıcı) ve geçici yerleşmeler olarak ikiye ayrılır.

Aşağıdakilerden hangisi idari veya ekonomik yapısı itibarıyla ''sürekli (kalıcı)'' köy altı yerleşmeleri arasında yer alır?',
  '{"options": ["Yayla", "Ağıl", "Kom", "Mahalle", "Oba"], "correctIndex": 3}'::jsonb,
  'Mahalle, Divan, Mezra ve Çiftlik sürekli (kalıcı) köy altı yerleşmeleridir. Yayla, kom, ağıl, oba, dam ve dalyan ise genellikle hayvancılık veya mevsimlik amaçla kullanılan ''geçici'' köy altı yerleşmeleridir.',
  'Kalıcı olanlar 4 tanedir: Mahalle, Divan, Mezra, Çiftlik. Diğer hayvancılık barınakları (ağıl, kom, oba, yayla) geçicidir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Batı Karadeniz Bölümü''nde (Bolu, Karabük, Kastamonu, Sinop) birbirine uzak birkaç mahallenin birleşmesiyle oluşan ve tahıl-orman ekonomisine dayanan geleneksel kalıcı köy altı yerleşmesine ne ad verilir?',
  '{"options": ["Divan", "Dalyan", "Mezra", "Ağıl", "Oba"], "correctIndex": 0}'::jsonb,
  'Divan; özellikle Batı Karadeniz''de (Kastamonu, Sinop, Bolu, Düzce yörelerinde) birkaç mahallenin ortak idari ve ekonomik bağlarla bir araya gelmesiyle oluşan sürekli köy altı yerleşmesidir.',
  'Batı Karadeniz = Divan, Doğu/Güneydoğu Anadolu = Mezra, Ege/Akdeniz balıkçılık = Dalyan, Toroslar göçebe = Oba.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Aşağıdaki harita yörelerinden hangisinde nüfusun seyrek olması ''karstik arazi yapısı ve yer altı sularının derine sızması'' faktörüyle doğrudan ilişkilidir?',
  '{"options": ["Yıldız Dağları Yöresi", "Teke ve Taşeli Platoları", "Biga Yarımadası", "Ergene Havzası", "Tuz Gölü Çevresi"], "correctIndex": 1}'::jsonb,
  'Akdeniz''deki Teke ve Taşeli Platoları kalkerli (kireç taşı) karstik yapılıdır. Yağan yağmur suları yüzeyde akışa geçmeyip derin çatlaklardan yer altına sızar. Bu yüzden yüzey suyu fakirliği, terra rossa topraklarının zayıflığı ve engebe nedeniyle nüfus seyrektir.',
  'Tuz Gölü çevresi kuraklıktan seyrektir; Yıldız Dağları ana yollara uzak ve engebeli olduğu için seyrektir; Teke-Taşeli ise karstik kireç taşı yapısı yüzünden seyrektir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Fizyolojik nüfus yoğunluğu; bir ülkedeki toplam nüfusun, o ülkedeki mevcut toplam işlenen tarım alanına bölünmesiyle elde edilir.

Buna göre aşağıdaki yörelerin hangisinde fizyolojik nüfus yoğunluğunun diğerlerine göre çok daha yüksek olması beklenir?',
  '{"options": ["Konya Ovası", "Şanlıurfa Platosu", "Doğu Karadeniz Kıyı Kuşağı (Rize - Trabzon)", "Ergene Havzası", "Cihanbeyli Platosu"], "correctIndex": 2}'::jsonb,
  'Doğu Karadeniz kıyı kuşağında nüfus çok kalabalıktır ancak arazi son derece dik ve dağlık olduğu için işlenebilir tarım arazisi yok denecek kadar dar bir şerittir. Pay (nüfus) çok büyük, payda (tarım alanı) çok küçük olunca fizyolojik nüfus yoğunluğu olağanüstü yüksek çıkar.',
  'Konya ve Şanlıurfa''da nüfus çok olsa da tarım arazisi uçsuz bucaksız olduğu için fizyolojik nüfus yoğunluğu düşüktür!'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de tarımsal nüfus yoğunluğunun fazla olduğu yerlerde tarım arazileri dar, engebeli ve tarımda makine kullanımı kısıtlıdır.

Aşağıdaki illerden hangisinde tarımsal nüfus yoğunluğunun Konya iline göre daha yüksek olması beklenir?',
  '{"options": ["Edirne", "Artvin", "Tekirdağ", "Aksaray", "Kırşehir"], "correctIndex": 1}'::jsonb,
  'Artvin son derece engebeli ve dağlık bir araziye sahiptir. Tarım alanları çok dardır ve engebeden dolayı makineli tarım yapılamaz; tarlada insan gücüne bağımlılık yüksektir. Bu sebeple Artvin''de tarımsal nüfus yoğunluğu düz Konya veya Edirne''den çok daha yüksektir.',
  'Tarımsal nüfus yoğunluğunun yüksek olması o ilin çok gelişmiş bir tarım devi olduğu anlamına gelmez; aksine arazinin engebeli, makineli tarımın imkansız ve tarım arazisinin dar olduğunu gösterir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de mevsimlik (geçici) iç göçler, yılın belirli dönemlerinde tarım, turizm, inşaat veya yaylacılık amacıyla gerçekleşir.

Aşağıdaki şehirlerden hangisi yaz aylarında hem tarımsal hasat hem de turizm amacıyla yoğun mevsimlik iç göç almaktadır?',
  '{"options": ["Rize", "Antalya", "Nevşehir", "Ordu", "Sinop"], "correctIndex": 1}'::jsonb,
  'Antalya, yaz mevsiminde milyonlarca yerli-yabancı turisti ağırlamak için otel ve turizm personeli göçü alırken; aynı zamanda geniş sera alanları, narenciye ve pamuk hasadı için yoğun tarım işçisi göçü çeken nadir merkezlerdendir.',
  'Rize ve Ordu sadece tarım (çay ve fındık); Antalya ise hem dev turizm sektörü hem de narenciye/sera tarımıyla çifte mevsimlik göç mıknatısıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'I. Karadeniz Bölgesi kırsalı
II. İç Anadolu Bölgesi kırsalı
III. Güneydoğu Anadolu Bölgesi kırsalı

Yukarıda verilen bölgelerden hangilerinde ''toplu yerleşme dokusu''nun hakim olmasında yer şekillerinin düz ve su kaynaklarının yetersiz olması belirleyici olmuştur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 3}'::jsonb,
  'İç Anadolu ve Güneydoğu Anadolu bölgelerinde yarı kurak iklim nedeniyle su kaynakları kısıtlıdır. İnsanlar kuyu, çeşme veya tek bir akarsu kenarında birbirine bitişik evler inşa etmişlerdir; arazinin düzlüğü de toplu yerleşmeyi desteklemiştir.',
  'Karadeniz dağlık ve suyun bol olduğu yerdir (dağınık yerleşme); İç Anadolu ve Güneydoğu ise düz ve suyun kıt olduğu yerdir (toplu yerleşme).'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''nin son yıllardaki nüfus piramidi incelendiğinde tabanın giderek daraldığı, yaşlı nüfus oranının ise %10 eşiğini aşarak arttığı görülmektedir.

Bu demografik değişim Türkiye ile ilgili aşağıdakilerden hangisinin kesin bir göstergesidir?',
  '{"options": ["Doğum oranlarının hızla azaldığının ve ortalama yaşam süresinin uzadığının", "Ölüm oranlarının doğum oranlarını geçtiğinin", "Ülke nüfusunun mutlak olarak azalmaya başladığının", "Kırsal nüfus oranının kent nüfus oranını aştığının", "Dış göç alımının tamamen durduğunun"], "correctIndex": 0}'::jsonb,
  'Nüfus piramidinin tabanının daralması doğum oranlarının ve çocuk nüfusun azaldığını; tepesinin genişlemesi ve yaşlı oranının artması ise sağlık şartlarının iyileşmesi ve ortalama ömrün uzadığını gösterir.',
  'Piramit tabanının daralması nüfusun azaldığını değil, nüfus artış HIZININ azaldığını gösterir. Toplam nüfus halen artmaktadır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Göçebe yörüklerin Toros dağlarının yüksek yaylalarında çadırlarda kalarak keçi otlattığı, hayvancılığa dayalı geçici köy altı yerleşmesine ne ad verilir?',
  '{"options": ["Kom", "Oba", "Divan", "Mezra", "Dalyan"], "correctIndex": 1}'::jsonb,
  'Oba; özellikle Akdeniz Torosları''nda yörük aşiretlerinin kıl çadırlarda konaklayarak küçükbaş hayvancılık yaptığı geçici köy altı yerleşmesidir.',
  'Doğu Anadolu''daki taş-çit hayvancılık barınağı ''Kom''; Toroslar''daki çadırlı göçebe hayvancılık ise ''Oba''dır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Doğu Anadolu Bölgesi''nde özellikle Erzurum, Kars ve Muş yörelerinde bir ya da birkaç aileye ait, etrafı taş duvar veya çitlerle çevrili büyükbaş hayvancılık odaklı geçici yerleşmeye ne ad verilir?',
  '{"options": ["Kom", "Dam", "Dalyan", "Divan", "Mahalle"], "correctIndex": 0}'::jsonb,
  'Kom; Doğu Anadolu''da mera hayvancılığı (büyükbaş) yapan ailelerin yazın hayvanlarını barındırmak için taş ve ahşaptan kurduğu geçici köy altı yerleşmesidir.',
  'Ağıl İç Anadolu ve Güneydoğu''da küçükbaş için kullanılırken, Kom Doğu Anadolu''da genellikle büyükbaş hayvancılık barınağıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de kentlerin fonksiyonel özellikleri değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["İskenderun, Ereğli ve Karabük ağır sanayi fonksiyonuyla büyümüş kentlerdir.", "Batman, ham petrol bulunması ve rafineri kurulmasıyla hızlı kentleşen maden kentidir.", "Konya, Şanlıurfa ve Rize tarım ve tarıma dayalı sanayi fonksiyonu belirgin kentlerdir.", "Sinop, hinterlandı geniş ve ticaret hacmi devasa bir liman kenti olarak gelişmiştir.", "Eskişehir, eğitim ve üniversite fonksiyonu ile genç nüfusu çeken bir kültür kentidir."], "correctIndex": 3}'::jsonb,
  'Sinop doğal bir limana sahip olmasına karşın, gerisindeki Küre Dağları yüzünden iç kesimlerle ulaşım bağlantısı çok zayıftır (hinterlandı dardır). Bu nedenle gelişememiş, liman ve ticaret kenti fonksiyonu kazanamamıştır.',
  'Sinop Karadeniz''in tek doğal limanıdır ancak hinterlandı dar olduğu için gelişememiştir. Samsun ise yapay limandır ama Canik dağları basık olduğu için hinterlandı geniştir ve büyümüştür.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de nüfusun yaş gruplarına dağılımında ''ortanca yaş'' (medyan yaş), nüfusu tam ortadan ikiye bölen yaştır.

Türkiye''de 2000 yılında 24,8 olan ortanca yaşın günümüzde 34''ün üzerine çıkması aşağıdakilerden hangisinin doğrudan bir sonucudur?',
  '{"options": ["Bebek ölüm hızının olağanüstü artış göstermesinin", "Doğurganlık hızının düşmesi ve yaşlı nüfus oranının artmasının", "Dış ülkelere genç beyin göçünün tamamen sona ermesinin", "Tarım sektöründe çalışan nüfus oranının artmasının", "Köyden kente göçün tersine dönerek köylere akının başlamasının"], "correctIndex": 1}'::jsonb,
  'Ortanca yaşın yükselmesi bir toplumun yaşlandığını ifade eder. Türkiye''de kadın başına düşen çocuk sayısının (doğurganlık hızı) 1.5 seviyelerine inmesi ve yaşam kalitesiyle ortalama ömrün uzaması ortanca yaşı hızla yukarı taşımıştır.',
  'Ortanca yaşın yükselmesi gençleşme değil, tam tersine nüfusun yaşlanması (demografik yaşlanma) anlamına gelir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'I. Çanakkale Boğazı çevresi (Gelibolu Yarımadası)
II. Çatalca - Kocaeli Bölümü
III. Sinop Yöresi
IV. Çukurova Yöresi

Yukarıda verilen alanlardan hangileri uygun iklim şartlarına sahip olmalarına rağmen ana ulaşım akslarına sapa kalmaları ve engebeli arazi yapıları nedeniyle seyrek nüfuslanmıştır?',
  '{"options": ["I ve III", "II ve IV", "I ve II", "III ve IV", "II ve III"], "correctIndex": 0}'::jsonb,
  'Gelibolu Yarımadası (tarihi sit alanı ve sapa kalması) ile Sinop yöresi (Küre Dağları''nın arkasında sapa kalması), ılıman denizel iklime sahip olmalarına karşın ana ticaret ve transit yollarının dışında kaldıkları için seyrek nüfusludur. Çatalca-Kocaeli ve Çukurova ise aşırı yoğun nüfusludur.',
  'Adaylar deniz kenarındaki her yerin yoğun nüfuslu olduğunu sanır. Gelibolu ve Sinop bunun en meşhur iki istisnasıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de iç göç hareketlerine katılan nüfusun demografik yapısı incelendiğinde;

I. Göç edenlerin çoğunluğunu genç dinamik erkek nüfus oluşturur.
II. Göç veren kırsal yörelerde kadın nüfus oranı erkek nüfus oranından fazla çıkar.
III. Göç alan büyük sanayi kentlerinde erkek nüfus oranı kadın nüfustan belirgin fazladır.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Türkiye''de iç göçün lokomotifi iş arayan genç erkeklerdir. Bu sebeple göç veren Doğu Anadolu ve Karadeniz köylerinde kadın nüfus oranı yüksek çıkarken, sanayi ve inşaat kenti olan Kocaeli, Tekirdağ gibi yoğun göç alan yerlerde erkek nüfus oranı yüksektir.',
  'Tüm öncüller birbirini tamamlayan demografik gerçeklerdir. Göç cinsiyet dengesini bölgesel olarak bozar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Aşağıdaki göç türlerinden hangisi ''uluslararası bir anlaşma ve zorunlu nüfus takası'' esasına dayanan siyasi bir dış göçtür?',
  '{"options": ["1961 Türkiye - Almanya İş Gücü Göçü", "1923 Lozan Barış Antlaşması ile gerçekleşen Türk - Yunan Nüfus Mübadelesi", "1989 Bulgaristan''dan Türkiye''ye yapılan zorunlu sığınmacı göçü", "Suriye iç savaşından kaçan sığınmacıların gelişi", "Üniversite mezunlarının yurt dışına gitmesiyle oluşan beyin göçü"], "correctIndex": 1}'::jsonb,
  '1923 Lozan Antlaşması''na eklenen protokol uyarınca Türkiye''deki Rumlar ile Yunanistan''daki Müslüman Türkler karşılıklı olarak zorunlu yer değiştirmiştir. Bu olaya ''Mübadele Göçü'' denir.',
  'Mübadele iki devletin anlaşmasıyla yapılan yasal ve zorunlu takastır. Almanya göçü iş gücü göçüdür, mübadele değildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Ege Bölgesi''nde kıyılarda kurulan ve deniz ürünleri avcılığı ile kültür balıkçılığı yapılan geçici veya daimi köy altı yerleşmelerine ne ad verilir?',
  '{"options": ["Dalyan", "Mezra", "Kom", "Ağıl", "Yayla"], "correctIndex": 0}'::jsonb,
  'Dalyan; kıyılarda, lagün ve nehir ağızlarında balık üretimi ve avcılığı amacıyla kurulan balıkçı yerleşmeleridir (Muğla-Dalyan, İzmir kıyıları).',
  'Dalyan kelimesi balık kapanı ve balıkçı yerleşmesi demektir. Diğer şıkların tamamı hayvancılık veya tarım yerleşmesidir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de nüfusun kır-kent oranları tarihsel süreçte büyük bir değişim göstermiştir.

Cumhuriyetin ilk yıllarında nüfusun yaklaşık %75''i kırsalda yaşarken, günümüzde kent nüfus oranının %93''ün üzerine çıkmasında aşağıdakilerden hangisi doğrudan etkili OLMAMIŞTIR?',
  '{"options": ["Tarımsal arazilerin erozyon ve mirasla parçalanması", "Sanayileşme ile birlikte kentlerde cazip iş alanlarının doğması", "2012 yılında çıkarılan 6360 sayılı Büyükşehir Yasası ile belde ve köylerin mahalleye dönüştürülmesi", "Kırsal kesimde ölüm oranlarının doğum oranlarını geçerek nüfusun tükenmesi", "Eğitim ve sağlık imkanlarının kentlerde yoğunlaşması"], "correctIndex": 3}'::jsonb,
  'Kırsal kesimde ölüm oranları doğumları geçmemiştir; kırsalda doğal nüfus artışı halen pozitiftir. Ancak yoğun göç ve özellikle 2012''de 30 büyükşehirdeki tüm köylerin yasa ile ''mahalle'' statüsüne geçirilmesi istatistiksel olarak kent nüfusunu bir gecede zıplatmıştır.',
  'Büyükşehir yasası (idari faktör) kent nüfus oranının kağıt üstünde %75''lerden %93''e sıçramasının en büyük gizli nedenidir; köyde ölüm patlaması gibi bir durum söz konusu değildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Doğu Anadolu ve Güneydoğu Anadolu bölgelerinde geniş otlakların bulunduğu alanlarda kurulan, tarım ve hayvancılığın bir arada yapıldığı, zamanla kalıcı köye dönüşebilen en yaygın köy altı yerleşmesi hangisidir?',
  '{"options": ["Mezra", "Ağıl", "Dalyan", "Dam", "Oba"], "correctIndex": 0}'::jsonb,
  'Mezra; Doğu ve Güneydoğu Anadolu''da tarım ve hayvancılık yapılan, kalıcı (sürekli) nitelikteki en karakteristik köy altı yerleşmesidir. Çoğu mezra sonradan muhtarlık alarak bağımsız köye dönüşür.',
  'Divan Batı Karadeniz''e özgüyken, Mezra Doğu ve Güneydoğu Anadolu''ya özgü kalıcı yerleşmedir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Karadeniz Bölgesi''nde yaylacılık faaliyetleri geleneksel olarak hayvancılık amacıyla yapılırken, son yıllarda fonksiyon değiştirmiştir.

Günümüzde özellikle Doğu Karadeniz yaylalarında (Ayder, Uzungöl, Bektaş vb.) yaylacılığın temel ekonomik itici gücü aşağıdakilerden hangisine evrilmiştir?',
  '{"options": ["Maden arama ve sondaj faaliyetlerine", "Turizm ve dinlenme faaliyetlerine", "Sanayi tesisleri kurulumuna", "Büyükbaş süt çiftliklerinin sanayileşmesine", "Seracılık faaliyetlerine"], "correctIndex": 1}'::jsonb,
  'Doğu Karadeniz yaylaları günümüzde yeşil doğası, serin havası ve festivalleriyle eko-turizm, dağ turizmi ve yayla turizminin merkezine dönüşmüş; hayvancılığın önüne turizm geçmiştir.',
  'Akdeniz''de yaylacılık sıcaktan kaçıp dinlenme (sayfiye), Doğu Karadeniz''de ise hayvancılıktan turizme evrilen bir yapı gösterir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de çalışan nüfusun (faal nüfus) sektörel dağılımı ekonomik kalkınmışlığın en kritik göstergesidir.

Cumhuriyetin ilk yıllarından günümüze çalışan nüfusun sektörlere göre dağılımındaki değişim değerlendirildiğinde aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Tarımdaki çalışan oranı sürekli artış göstererek zirve yapmıştır.", "Hizmet ve sanayi sektöründe çalışanların payı sürekli artarken, tarım sektörünün payı hızla azalmıştır.", "Sanayi sektöründe çalışanların payı hizmet sektörünün çok önüne geçmiştir.", "Madencilik sektöründe çalışanların payı tüm sektörleri geride bırakmıştır.", "Hizmet sektöründe çalışanların oranı sürekli gerilemiştir."], "correctIndex": 1}'::jsonb,
  '1927''de çalışan nüfusun %80''den fazlası tarım sektöründeyken, günümüzde tarımın payı %15-16 bandına inmiş; hizmet sektörü %55-60 ile birinci, sanayi sektörü ise %25-27 ile ikinci sıraya yerleşmiştir.',
  'En çok çalışan sanayide değil ''hizmet'' (ticaret, ulaşım, bankacılık, eğitim vb.) sektöründedir! İkinci sanayi, üçüncü tarımdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Tarihi İpek Yolu üzerinde bulunan, zengin kervansaray ve ticaret mirasına sahip, günümüzde ise kavşak noktası olması ve modern organize sanayi bölgeleriyle büyüyen İç Anadolu kenti aşağıdakilerden hangisidir?',
  '{"options": ["Kayseri", "Karaman", "Yozgat", "Çankırı", "Niğde"], "correctIndex": 0}'::jsonb,
  'Kayseri; tarihsel ticaret kenti kimliğini (Kültepe Kaniş Karumu''ndan bu yana) korumuş, günümüzde zengin sanayisi, mobilya üretimi ve kavşak konumuyla İç Anadolu''nun en güçlü ticaret-sanayi metropollerinden biri olmuştur.',
  'Yozgat ve Çankırı göç veren küçük merkezlerken; Kayseri sanayi, ticaret ve kavşak özelliğiyle sürekli göç çeken bir ildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Gökçeada ve Bozcaada ile Ege kıyılarında küçükbaş hayvancılık ve bağcılık yapan ailelerin geçici barınaklarına verilen ad hangisidir?',
  '{"options": ["Dam", "Kom", "Divan", "Mahalle", "Dalyan"], "correctIndex": 0}'::jsonb,
  'Dam; Ege kıyılarında, Gökçeada ve Bozcaada''da hayvan barınağı ve kısmen tarım aletlerinin saklandığı geçici köy altı yerleşmesidir.',
  'Dam Ege bölgesine özgü bir geçici yerleşmedir. Doğu Anadolu''daki karşılığı Kom''dur.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Bir bölgede tarımsal nüfus yoğunluğu çok yüksek çıkıyorsa bu durum hakkında aşağıdakilerden hangisi kesin olarak söylenemez?',
  '{"options": ["Tarım arazilerinin dar ve parçalı olduğu", "Yer şekillerinin engebeli ve dağlık olduğu", "Tarımda makine kullanımının topoğrafya nedeniyle zor olduğu", "Birim alandan alınan tarımsal verim ve gelir düzeyinin olağanüstü yüksek olduğu", "Tarımsal üretimde insan ve hayvan gücüne yüksek oranda ihtiyaç duyulduğu"], "correctIndex": 3}'::jsonb,
  'Tarımsal nüfus yoğunluğu (Tarımla uğraşan nüfus / Tarım alanı) formülünde sonucun yüksek çıkması; arazinin dağlık, tarım alanının dar ve makineleşmenin yetersiz olduğunu gösterir (örneğin Rize, Hakkari). Bu alanlarda modern entansif tarım yapılmadığından tarımsal gelir olağanüstü yüksek DEĞİL, aksine kırsal fakirlik fazladır.',
  'Adaylar ''tarımsal yoğunluk fazlaysa tarımsal üretim ve zenginlik de fazladır'' yanılgısına düşer. Tarımsal yoğunluk coğrafi engebe ve makinesizlik göstergesidir, zenginlik göstergesi değildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'I. Hakkari Yöresi
II. Erzurum - Kars Platosu
III. Yıldız Dağları Yöresi
IV. Taşeli Platosu

Yukarıda verilen seyrek nüfuslu yörelerden hangilerinde nüfusun seyrek olmasında ''olumsuz iklim şartları (kış soğukları ve don olayları)'' birincil faktör konumundadır?',
  '{"options": ["I ve II", "II ve IV", "I ve III", "III ve IV", "II ve III"], "correctIndex": 0}'::jsonb,
  'Hakkari ve Erzurum-Kars yüksek rakım ve sert karasal iklim nedeniyle kışların aşırı soğuk, uzun ve karlı geçtiği yerlerdir; iklim nüfusu kısıtlayan ana etkendir. Yıldız Dağları''nda iklim ılımandır (ulaşıma sapa kalması etkilidir); Taşeli Platosu''nda ise karstik kireç taşı yapısı etkilidir.',
  'Taşeli Platosu Akdeniz''dedir, iklimi ılımandır; nüfusun az olma sebebi iklim değil karstik topoğrafyadır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de 1960-1965 döneminden itibaren devlet eliyle yürütülen nüfus politikalarında radikal bir eksen kayması yaşanmıştır.

1923-1960 arasında ''pronatalist'' (nüfus artışını teşvik edici) politikalar uygulanırken, 1965 sonrasında ''antinatalist'' (nüfus planlaması ve artış hızını düşürücü) politikalara geçilmesinin temel ekonomik nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Ülke yüz ölçümünün yeni nüfusu barındıramayacak kadar daralması", "Hızlı nüfus artışının kişi başına düşen milli geliri eritmesi ve kalkınma hızının üzerinde kalarak işsizlik yaratması", "Kırsal kesimde tarımsal üretimin tamamen durması", "Tüm komşu ülkelerle savaş tehlikesinin tamamen ortadan kalkması", "Türkiye''nin Avrupa Birliği''ne tam üye kabul edilmesi"], "correctIndex": 1}'::jsonb,
  '1950''lerden sonra sağlık ve beslenmenin iyileşmesiyle nüfus patlaması (%2.85) yaşanmış; devlet yatırımları okullar, hastaneler ve yollar gibi demografik yatırımlara aktarılmak zorunda kalmıştır. Kalkınma hızının düşmesi ve artan işsizlik üzerine 1965''te Nüfus Planlaması Kanunu çıkarılarak doğum kontrolü serbest bırakılmıştır.',
  '1923-1960 arası savaştan çıkan ülkeyi asker ve tarım işçisiyle güçlendirmek için teşvik; 1965 sonrası ise ekonomik kalkınmayı korumak için planlama uygulanmıştır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de nüfusun kıyılarda yoğunlaşıp iç kesimlerde seyrekleşmesi genel bir kuraldır. Ancak bu kurala uymayan iç kesimlerdeki bazı ''vaha'' kentler çevresine göre olağanüstü yoğun nüfus çekmiştir.

Aşağıdaki iç bölge kentlerinden hangisinin yoğun nüfuslanmasında ''demiryolu kavşağı olması, havacılık ve raylı sistem sanayisi ile üniversite kenti'' kimliği doğrudan etkili olmuştur?',
  '{"options": ["Eskişehir", "Kırşehir", "Amasya", "Yozgat", "Karaman"], "correctIndex": 0}'::jsonb,
  'Eskişehir, Cumhuriyet''in ilk yıllarından itibaren demiryollarının kilit kavşağı (TÜLOMSAŞ), ilk yerli lokomotif Karakurt ve Devrim otomobilinin üretildiği sanayi merkezi, havacılık sanayii (TUSAŞ/TEI) ve iki köklü üniversitesiyle İç Anadolu''nun en gelişmiş ve göç alan metropollerindendir.',
  'Kırşehir ve Yozgat tarım ağırlıklı ve göç veren kentlerdir. Eskişehir sanayi, ulaşım ve eğitim fonksiyonuyla pozitif ayrışır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Doğu Karadeniz kıyı şeridinde (Trabzon, Rize, Giresun) nüfus yoğunluğunun kilometre kareye 300 kişinin üzerine çıkmasında;

I. Arazinin iç kesimlerinin çok dağlık ve sarp olması nedeniyle halkın dar kıyı şeridine sıkışması,
II. Fındık ve çay tarımının yoğun insan emeğine dayalı olması,
III. Kıyıda devasa otomotiv ve demir-çelik ağır sanayi tesislerinin bulunması

faktörlerinden hangileri etkilidir?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'Doğu Karadeniz kıyısında arazinin dikliği yerleşmeyi zorunlu olarak sahil bandına ve vadi tabanlarına hapsetmiştir. Ayrıca çay ve fındık tarımı yoğun iş gücü ister. Ancak Doğu Karadeniz''de ağır demir-çelik veya otomotiv sanayii kesinlikle YOKTUR (Karabük ve Ereğli Batı Karadeniz''dedir).',
  'Doğu Karadeniz''de ağır sanayi yoktur! Nüfus yoğunluğu tamamen topografik sıkışma ve monokültür tarımdan (çay-fındık) kaynaklanır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de kırsal alanlardan şehirlere yapılan kontrolsüz ve hızlı göçlerin kentlerde yarattığı sorunlar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Gecekondulaşma ve çarpık kentleşmenin artması", "Trafik sıkışıklığı ve toplu taşıma yetersizlikleri", "Belediye altyapı hizmetlerinin (su, kanalizasyon, atık) yetersiz kalması", "Demografik yatırımların (okul, hastane) yükünün artması", "Kentlerde sanayi yatırımlarının iş gücü bulamayarak durma noktasına gelmesi"], "correctIndex": 4}'::jsonb,
  'Hızlı iç göç kentlerde iş gücü kıtlığı değil, tam aksine aşırı ucuz ve niteliksiz iş gücü fazlasına, yani kentsel gizli ve açık işsizliğe yol açar.',
  'Göç alan kentte iş gücü açığı oluşmaz; iş gücü arzı patlar ve işsizlik ile düşük ücret sorunu doğar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de nüfusun cinsiyet yapısı incelendiğinde ülke genelinde kadın ve erkek oranları birbirine çok yakın olmakla birlikte (%50.1 erkek, %49.9 kadın), bazı şehirlerde bu oran erkekler veya kadınlar lehine belirgin biçimde bozulur.

Aşağıdaki şehir çiftlerinin hangisinde erkek nüfus oranının kadın nüfus oranından belirgin derecede yüksek olması beklenir?',
  '{"options": ["Kastamonu — Sinop", "Rize — Giresun", "Tekirdağ — Kocaeli", "Artvin — Bayburt", "Gümüşhane — Kars"], "correctIndex": 2}'::jsonb,
  'Tekirdağ (Çorlu/Çerkezköy) ve Kocaeli (Gebze/İzmit) Türkiye''nin en büyük sanayi merkezleridir ve fabrikalarda çalışmak üzere Türkiye''nin her yerinden yoğun genç erkek göçü çekerler. Diğer şıklardaki iller ise erkeklerini dışarıya göç veren illerdir.',
  'Sanayi ve asker kışlası olan şehirlerde erkek oranı; göç veren kırsal illerde (Sinop, Kastamonu, Giresun) ise kadın oranı daha yüksek çıkar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de geçici köy altı yerleşmelerinin zamanla sürekli yerleşmeye (kalıcı köye) dönüşmesinde temel belirleyici faktör aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede heyelan riskinin artması", "Ekonomik faaliyetin sadece dönemsel hayvancılıktan çıkıp tarım ve daimi ziraat üretimine dönüşmesi", "Yerleşmenin deniz seviyesinden 2000 metre yukarıya taşınması", "Bölgede kerpiç yerine ahşap evlerin inşa edilmeye başlanması", "Yöre halkının dış ülkelere işçi olarak gitmesi"], "correctIndex": 1}'::jsonb,
  'Bir köy altı yerleşmesinin geçicilikten kalıcılığa geçmesini sağlayan ana etken; geçim kaynağının mevsime bağlı yaylacılık veya otlatmacılıktan çıkıp toprağa bağlı sürekli tarım ve ziraat faaliyetine dönüşmesidir. Tarım insanı yıl boyu tarlaya bağlar.',
  'Hayvancılık mevsimlik göçü gerektirirken; tarım ve bağ-bahçe faaliyeti yıl boyu orada kalmayı (kalıcı yerleşmeyi) zorunlu kılar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'I. Yaz aylarında Çukurova ve Amik ovalarına pamuk çapalamak ve toplamak için gidilmesi
II. Sonbaharda Ordu ve Giresun''a fındık hasadı için binlerce mevsimlik işçinin gitmesi
III. İlkbahar ve yaz aylarında Şanlıurfa ve Diyarbakır''dan İç Anadolu''ya şeker pancarı çapası için ailelerin göç etmesi

Yukarıda verilen mevsimlik göç hareketlerinin ortak özelliği aşağıdakilerden hangisidir?',
  '{"options": ["Gittikleri yerlerde aritmetik nüfus yoğunluğunu kalıcı olarak artırmaları", "Tarımsal ürünlerin hasat ve bakım dönemlerine bağlı geçici iş gücü hareketleri olmaları", "Tamamının kış mevsiminde yoğunlaşması", "Maden ocaklarında istihdam edilmek üzere yapılmaları", "Gittikleri illerde kentsel nüfus sayımına dahil edilmeleri"], "correctIndex": 1}'::jsonb,
  'Verilen üç örnek de Türkiye''de tarımsal hasat ve bakım takvimine göre hareket eden gezici mevsimlik tarım işçiliği hareketidir. İş bitiminde bu işçiler kendi memleketlerine geri dönerler.',
  'Mevsimlik tarım göçü geçicidir, kalıcı nüfusu artırmaz; sadece yaz ve sonbahar aylarında o illerin fiili nüfusunu geçici olarak şişirir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de demografik göstergeler değerlendirildiğinde aşağıdakilerden hangisi bir ilin ''net göç hızının pozitif'' (göç alan il) olduğunu en güçlü şekilde kanıtlar?',
  '{"options": ["İldeki fizyolojik nüfus yoğunluğunun aşırı yüksek olması", "İlin toplam nüfus artış hızının, ildeki doğal nüfus artış hızından (doğumlar - ölümler) belirgin derecede yüksek çıkması", "İldeki tarımsal üretimin tamamen geleneksel yöntemlerle yapılması", "İlde kadın nüfusunun erkek nüfusundan fazla olması", "İldeki yaşlı nüfus oranının Türkiye ortalamasının iki katı olması"], "correctIndex": 1}'::jsonb,
  'Doğal nüfus artışı (doğum eksi ölüm) bir ilin kendi içindeki üreme artışıdır. Eğer bir ilin gerçek nüfus artış hızı doğal artış hızından çok daha büyük çıkıyorsa; aradaki bu devasa fark kesinlikle dışarıdan gelen net göçün (pozitif göç hızı) göstergesidir.',
  'ÖSYM ''Doğal artış hızı'' ile ''Gerçek nüfus artış hızı'' arasındaki makası sorar: Gerçek artış > Doğal artış = Göç alıyor; Gerçek artış < Doğal artış = Göç veriyor!'
);

-- =============================================================
-- KPSS COĞRAFYA — KONU 4: TÜRKIYE'DE TARIM VE HAYVANCILIK
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================


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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de tarımda verimi artırmanın ve üretimi iklim dalgalanmalarından kurtarmanın en temel yolu aşağıdakilerden hangisidir?',
  '{"options": ["Tarım arazilerinin yüz ölçümünü sürekli genişletmek", "Sulama imkanlarını yaygınlaştırmak", "Tarımsal ilaç kullanımını katbekat artırmak", "Kırsalda çalışan insan sayısını çoğaltmak", "Tarlaları iki yılda bir nadasa bırakmak"], "correctIndex": 1}'::jsonb,
  'Türkiye tarımının en kronik sorunu kuraklık ve yaz mevsiminde su yetersizliğidir. Sulama imkanları çözüldüğünde; üretimdeki yıllık dalgalanmalar sona erer, nadas uygulaması biter, birim alandan alınan verim tavan yapar ve yılda birden fazla hasat alınabilir.',
  'Tarım arazisini genişletmek (ekstansif) verimi artırmaz; modern tarımın (entansif) temel kilidi sulamadır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Yağışın yetersiz olduğu yarı kurak alanlarda toprağın su ve mineral depolamasını sağlamak amacıyla bir yıl ekilip bir yıl boş bırakılmasına ''nadas'' denir.

Türkiye fiziki coğrafyası göz önüne alındığında nadas alanlarının en az olduğu bölge aşağıdakilerden hangisidir?',
  '{"options": ["İç Anadolu Bölgesi", "Güneydoğu Anadolu Bölgesi", "Karadeniz Bölgesi", "Doğu Anadolu Bölgesi", "Ege Bölgesi"], "correctIndex": 2}'::jsonb,
  'Karadeniz Bölgesi her mevsim düzenli yağış aldığı ve nem oranı yüksek olduğu için toprağın dinlendirilmesine (nadasa) gerek kalmaz; bu nedenle nadas alanlarının payı Türkiye''de en az Karadeniz''dedir.',
  'Nadasın en çok olduğu yer İç Anadolu ve Güneydoğu; en az olduğu yer ise her mevsim yağışlı geçen Karadeniz kıyı kuşağıdır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de bazı tarım ürünlerinin ekim alanları devlet tarafından özel kanunlarla sınırlandırılmıştır.

Aşağıdaki tarım ürünlerinden hangisinin ekim alanı ''sıtma hastalığına yol açan sivrisineklerin üremesini engellemek ve yerleşim alanlarını korumak'' amacıyla devlet kontrolü altındadır?',
  '{"options": ["Tütün", "Haşhaş", "Kenevir", "Çeltik (Pirinç)", "Şeker Pancarı"], "correctIndex": 3}'::jsonb,
  'Çeltik (pirinç) tarlaları sürekli su altında (bataklık şeklinde) tutulduğundan Anofel cinsi sıtma sivrisineklerinin üremesine yol açar. Bu yüzden Çeltik Ekimi Kanunu ile şehir ve kasaba merkezlerine belirli mesafeden yakın yerlerde çeltik ekimi devletçe yasaklanmıştır.',
  'Haşhaş ve kenevir uyuşturucu; tütün kalite standardı; şeker pancarı kota; çeltik ise doğrudan halk sağlığı (sıtma) sebebiyle devlet kontrolündedir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de en çok yetiştirilen tarım ürünü buğdaydır. Buğday ilkbaharda büyüme döneminde yağış, yaz mevsiminde ise olgunlaşma ve hasat için kurak ve sıcak bir hava ister.

Buna göre aşağıdaki yörelerin hangisinde yaz mevsiminin sürekli yağışlı ve bulutlu geçmesi buğday tarımını imkansız hale getirmiştir?',
  '{"options": ["Konya Kapalı Havzası", "Doğu Karadeniz Kıyı Kuşağı", "Cihanbeyli Platosu", "Şanlıurfa Ovası", "Ergene Havzası"], "correctIndex": 1}'::jsonb,
  'Doğu Karadeniz kıyılarında her mevsim yağışlıdır ve yaz kuraklığı yaşanmaz. Buğday ve arpa gibi tahıllar olgunlaşma döneminde güneşe ve kuraklığa ihtiyaç duyduğu için Karadeniz kıyılarında doğal olarak yetiştirilemez.',
  'Karadeniz kıyısında buğdayın yetişmeme sebebi soğukluk değil, yaz kuraklığının ve güneşlenme süresinin olmamasıdır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de üretilen fındığın yaklaşık %80''i Karadeniz Bölgesi''nde yetiştirilmekte olup Türkiye dünya fındık üretim ve ihracatında açık ara birinci sıradadır.

Fındık üretiminde Karadeniz Bölgesi içinde en yüksek paya sahip il aşağıdakilerden hangisidir?',
  '{"options": ["Rize", "Ordu", "Artvin", "Sinop", "Kastamonu"], "correctIndex": 1}'::jsonb,
  'Türkiye''de yıllık fındık rekoltesinde birinci sırada Ordu ili yer alır (Ordu ve Giresun fındığın anavatanı ve lideridir). Rize ise çay üretiminde liderdir.',
  'Rize çayda; Ordu fındıkta liderdir. Adaylar fındıkta Giresun veya Rize ile Ordu arasında tereddüt edebilir; üretim miktarında Ordu öndedir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Aşağıdaki meyvelerden hangisi kış donlarına karşı son derece hassas olduğu için Akdeniz ve Ege kıyı kuşağı dışında (mikroklima alanlar hariç) iç kesimlerde kesinlikle yetiştirilemez?',
  '{"options": ["Elma", "Üzüm", "Turunçgiller (Portakal, Mandalina, Limon)", "Armut", "Ceviz"], "correctIndex": 2}'::jsonb,
  'Turunçgiller subtropikal kökenli olup kış sıcaklığının 0°C''nin altına düşmesine tahammül edemez. Bu sebeple sadece kış ılıklığının belirgin olduğu Akdeniz ve Güney Ege kıyılarında (ve fön sayesinde Rize mikroklimasında) yetişir. Elma ve üzüm ise -30°C''ye kadar dayanıklıdır.',
  'Üzüm ve elma Türkiye''nin her bölgesinde kış soğuklarına meydan okuyarak yetişir; turunçgiller ise en ufak donda kurur.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de küçükbaş hayvancılık türleri bitki örtüsüyle doğrudan paralellik gösterir.

İç Anadolu, Doğu ve Güneydoğu Anadolu''nun bozkır (step) alanlarında en yaygın beslenen küçükbaş hayvan türü aşağıdakilerden hangisidir?',
  '{"options": ["Kıl Keçisi", "Koyun", "Manda", "Tiftik Keçisi", "İpek Böceği"], "correctIndex": 1}'::jsonb,
  'Karasal iklimin cılız ilkbahar otları (bozkır) koyunların küçük ağız yapısına tam uygundur. Bu nedenle Türkiye''de sayıca en fazla beslenen çiftlik hayvanı koyundur.',
  'Koyun = Bozkır; Kıl keçisi = Maki ve Toroslar dağlık alan; Sığır = Çayır ve mera.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Maki florasının sürgünleriyle, çalılarla ve engebeli kayalık arazilerle beslenebilen; bu yüzden Akdeniz Bölgesi''nde Toros Dağları kuşağında en çok beslenen hayvan türü hangisidir?',
  '{"options": ["Koyun", "Kıl Keçisi", "Manda", "Merinos Koyunu", "Büyükbaş Sığır"], "correctIndex": 1}'::jsonb,
  'Kıl keçisi tırmanma yeteneği yüksek, kayalık ve engebeli arazilerde rahatça yürüyebilen ve makinin sert yapraklarıyla beslenebilen bir hayvandır. En çok Akdeniz''de (Teke ve Taşeli platolarında) beslenir.',
  'Kıl keçisi orman filizlerini kemirip ormana zarar verdiği için orman köylerinde devlet kontrolü ve kısıtlaması uygulanmaktadır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de kümes hayvancılığı (tavuk, hindi, yumurta üretimi) tesislerinin coğrafi dağılışı incelendiğinde Marmara ve Ege bölgelerinde (Bolu, Sakarya, Manisa, Balıkesir) yoğunlaştığı görülür.

Kümes hayvancılığının bu alanlarda yoğunlaşmasının temel belirleyicisi aşağıdakilerden hangisidir?',
  '{"options": ["İklim şartlarının ve hava sıcaklığının tavuklara çok uygun olması", "Büyük tüketim merkezlerine (İstanbul, İzmir, Ankara) yakınlık ve pazar kolaylığı", "Bölgede yem bitkilerinin bedava temin edilmesi", "Geleneksel mera hayvancılığı yöntemlerinin kullanılması", "Karasallık şiddetinin yüksek olması"], "correctIndex": 1}'::jsonb,
  'Kümes hayvancılığı kapalı, klimalı ve modern çiftliklerde yapılır; bu yüzden doğal iklim ve bitki örtüsünden tamamen bağımsızdır. Tesislerin Marmara-Ege aksında kurulmasının tek sebebi dev tüketici nüfusa (büyük pazara) yakınlık ve et-yumurtanın bozulmadan hızla ulaştırılmasıdır.',
  'ÖSYM kümes hayvancılığında iklimin hiçbir etkisinin olmadığını, kuruluş yerini yalnızca ''büyük pazara yakınlığın'' belirlediğini defalarca sormuştur.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de deniz balıkçılığında avlanan toplam balık miktarının yaklaşık %70''i tek başına Karadeniz''den sağlanmaktadır.

Karadeniz''in balık üretim miktarında diğer denizlerimize açık ara fark atmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Deniz suyu sıcaklığının çok yüksek olması", "Tuzluluk oranının Akdeniz''den fazla olması", "Akarsuların bol besin maddesi taşıması, oksijen miktarının yüksekliği ve plankton zenginliği", "Karadeniz''in 200 metrenin altındaki derinliklerinin balık yuvası olması", "Bölgede kültür balıkçılığı havuzlarının çok yaygın olması"], "correctIndex": 2}'::jsonb,
  'Karadeniz''e dökülen devasa ırmaklar (Tuna, Dinyester, Dinyeper, Don, Kızılırmak) bol miktarda mineral ve besin taşır; su serin olduğu için oksijen çözünürlüğü yüksektir ve balıkların ana besini olan plankton bakımından son derece zengindir.',
  'Karadeniz''de balık MİKTARI çoktur ama balık TÜRÜ çeşidi azdır! En çok tür çeşidi sıcak Akdeniz''dedir. Ayrıca Karadeniz''in 200 m altında H2S gazı vardır, yaşam yoktur!'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Güneydoğu Anadolu Projesi''nin (GAP) hayata geçirilmesi ve Şanlıurfa Tünelleri ile Fırat''ın suyunun Harran Ovası''na akıtılması sonucunda, daha önce Ege ve Çukurova''nın lider olduğu hangi endüstriyel tarım ürününde Şanlıurfa açık ara Türkiye lideri konumuna yükselmiştir?',
  '{"options": ["Tütün", "Zeytin", "Pamuk", "Çay", "Fındık"], "correctIndex": 2}'::jsonb,
  'GAP ile sulama gelmeden önce Türkiye pamuk üretiminin merkezi Çukurova ve Ege (Büyük Menderes) idi. Sulamayla birlikte yüksek güneşlenme süresine sahip GAP sahası atağa geçmiş ve günümüzde Türkiye pamuğunun yarısından fazlasını tek başına Şanlıurfa üretir hale gelmiştir.',
  'GAP denince akla gelen bir numaralı ürün pamuktur. Çukurova ise pamuktan ziyade mısır ve narenciyeye yönelmiştir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Şeker pancarı hasat edildikten sonra çok kısa süre içerisinde işlenmek zorundadır; aksi takdirde içindeki şeker oranı hızla fermente olup buharlaşır.

Bu durum şeker fabrikalarının kuruluş yerlerinin belirlenmesinde aşağıdakilerden hangisini zorunlu kılmıştır?',
  '{"options": ["Enerji santrallerine yakınlığı", "Doğrudan tarım (hammadde) alanlarının hemen yanına kurulmasını", "Liman kentlerinde konumlanmasını", "Demiryolu ana hatları üzerinde olmasını", "Yalnızca büyükşehir tüketim merkezlerinde toplanmasını"], "correctIndex": 1}'::jsonb,
  'Şeker pancarı çabuk bozulabilen (narin) bir hammadde olduğundan fabrikalar tarlaların ve pancar ekim alanlarının hemen bitişiğine kurulmak zorundadır (hammaddeye bağımlılık). Ayrıca fabrikadan çıkan yaş pancar posası (küspe) besi sığırları için yem olduğundan fabrika çevresinde ahır hayvancılığı da gelişir.',
  'Şeker fabrikaları hammaddeye yakın kurulur; ayrıca kıyı bölgelerimizde çiftçiler daha çok kazandıran alternatif ürünlere yöneldiği için şeker pancarı iç bölgelerde kümelenmiştir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Mısırın doğal yetişme alanı her mevsim düzenli yağış alan Karadeniz Bölgesi''dir. Ancak Türkiye mısır üretim istatistikleri incelendiğinde Karadeniz Bölgesi''nin ticari üretim payının Akdeniz (Çukurova) ve İç Anadolu''nun (Konya) çok gerisinde kaldığı görülmektedir.

Bu tezat durumun temel nedenleri arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Karadeniz''de üretilen mısırın yöre halkı tarafından yerel gıda ve ekmek yapımında tüketilip pazara sunulamaması", "Akdeniz ve Konya''da sulama ile birlikte mısırın ticari yem sanayisi için endüstriyel ölçekte üretilmesi", "Karadeniz''de arazinin çok engebeli ve parçalı olması nedeniyle modern geniş mısır tarlalarının kurulamaması", "Karadeniz iklim koşullarının mısırın dane tutmasını tamamen engellemesi", "Çukurova ve Konya''da birim alandan alınan verimin modern tarımla çok daha yüksek olması"], "correctIndex": 3}'::jsonb,
  'Karadeniz iklimi mısırın doğal ana yurdudur; dane tutmasını engellemez. Ancak Karadeniz halkı mısırı kendi beslenmesinde (mısır unu, ekmek) tüketir. Çukurova ve Konya''da ise dev düz tarlalarda sulamayla endüstriyel boyutta yem sanayisi için ekilir ve tüm Türkiye pazarına satılır.',
  'Doğal yetişme alanı Karadeniz''dir fakat en çok üretilen yer Çukurova ve Konya''dır! Karadeniz''deki ürün iç tüketime gider, ticari payı düşüktür.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de yetiştirilen zeytin ağaçlarının genel özellikleri değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Tipik bir Akdeniz iklimi bitkisi olup maki formasyonuna aittir.", "Kış sıcaklıklarının sıfırın altına düştüğü ve don olaylarının yaşandığı iç bölgelerde yetişemez.", "Ege Bölgesi daha çok yağlık zeytin üretiminde; Güney Marmara (Gemlik) ise sofralık siyah zeytinde uzmanlaşmıştır.", "Zeytin ağacı fizyolojisi gereği ''periyodisite'' gösterir; bir yıl bol ürün verirken ertesi yıl verim belirgin şekilde düşer.", "Zeytin üretiminde en yüksek pay Doğu Anadolu Bölgesi''ne aittir."], "correctIndex": 4}'::jsonb,
  'Zeytin kış donlarına karşı dayanıksızdır. Doğu Anadolu kışların en dondurucu geçtiği bölge olduğundan zeytin üretimi kesinlikle bulunmaz (sadece Çoruh vadisinde ufak bir mikroklima hariç genel zeytincilik yoktur). Zeytinin tartışmasız lideri Ege ve Güney Marmara''dır.',
  'Periyodisite (var yılı - yok yılı) zeytinin karakteristik özelliğidir. Zeytin kış ılıklığı istediği için iç ve doğu bölgelerde yetişemez.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'I. Yaz yağışlarının gür alpin çayırları yeşertmesi
II. Kış mevsiminin çok sert geçmesi sebebiyle küçükbaş hayvanların telef olma riski
III. Arazinin geniş lav platolarından oluşması

Yukarıda verilen faktörler aşağıdaki bölümlerden hangisinde ''mera tipi büyükbaş hayvancılığın'' temel geçim kaynağı olmasını sağlamıştır?',
  '{"options": ["Ergene Bölümü", "Erzurum - Kars Bölümü", "Antalya Bölümü", "Kıyı Ege Bölümü", "Güney Marmara Bölümü"], "correctIndex": 1}'::jsonb,
  'Erzurum-Kars-Ardahan platolarında yaz aylarında görülen konveksiyonel yağışlar otların sararmasını engeller ve dev boylu gür alpin çayırlar oluşturur. Bu çayırlar koyunların değil sığırların beslenmesine uygundur; bu yüzden bölgede mera büyükbaş hayvancılığı hâkimdir.',
  'Mera tipi büyükbaş = Erzurum-Kars (çayır); Ahır/Besi tipi büyükbaş = Marmara ve İç Anadolu (pazara ve şeker fabrikasına yakınlık).'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de arıcılık faaliyetleri doğanın sunduğu bitki çeşitliliği, ormanlar ve kır çiçekleri ile doğrudan ilişkilidir.

Buna göre;
• Çam balı üretiminde kızılçam ormanlarının varlığıyla Türkiye ve dünya lideri olan yöremiz,
• Yüksek dağ çiçek florasıyla ünlü Anzer balının üretildiği yöremiz
sırasıyla aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Muğla — Rize", "Ordu — Kars", "Antalya — Hakkari", "Edirne — Artvin", "İzmir — Trabzon"], "correctIndex": 0}'::jsonb,
  'Çam balı çam pamuklu koşnil böceğinin salgısıyla üretilir ve dünyadaki çam balının %90''ı Muğla (Menteşe Yöresi) kızılçam ormanlarında üretilir. Dünyaca ünlü şifalı Anzer balı ise Rize''nin İkizdere ilçesi Anzer Yaylası''nın zengin çiçek florasından elde edilir.',
  'Çam balı = Muğla; Çiçek balı = Ordu, Rize, Kars, Hakkari. Arıcılık arazinin dağlık olmasından olumlu etkilenen nadir ekonomik kollardandır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de pamuk tarımı alüvyal tabanlı ovalarda, yüksek sıcaklık ve bol su ile yapılabilir. Ancak hasat mevsimi olan sonbaharda havanın kesinlikle açık, güneşli ve yağışsız olması gerekir; aksi takdirde kozalar çürür ve pamuk kirlenir.

Buna göre aşağıdaki ovalardan hangisi pamuk tarımı için kesinlikle elverişsizdir?',
  '{"options": ["Harran Ovası", "Çukurova", "Söke Ovası", "Çarşamba Ovası", "Gediz Ovası"], "correctIndex": 3}'::jsonb,
  'Çarşamba Ovası Karadeniz kıyısındadır (Samsun). Karadeniz''de sonbahar mevsimi yılın en çok yağış alan dönemidir. Sonbahar yağmurları pamuğun hasat edilmesini imkansız kılacağı için Çarşamba ve Karadeniz kıyılarında pamuk ekilemez.',
  'Harran, Çukurova, Söke ve Gediz ovaları Türkiye''nin pamuk üsleridir. Karadeniz''deki Çarşamba ise sonbahar yağışları yüzünden pamuğa tamamen kapalıdır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de tütün üretimi Osmanlı''dan günümüze hem ihracat gelirleri hem de uluslararası pazar payı açısından kritik bir yere sahiptir.

Türkiye''de tütün ekim alanlarının devlet tarafından izne bağlanmasının ve sınırlandırılmasının temel gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Tütün bitkisinin erozyona yol açması", "Kalitesiz tütün üretimini engellemek ve Türk tütününün dünya piyasasındaki yüksek kalite itibarını korumak", "Tütünün diğer sanayi bitkilerini yok etmesi", "Tütün tarımının sadece kış aylarında yapılabilmesi", "Ülkedeki sigara tüketimini sıfırlamak"], "correctIndex": 1}'::jsonb,
  'Türk tütünü (şark tipi tütün) dünyada aromasıyla ün yapmış kıymetli bir ihraç malıdır. Tütün eğer kontrolsüz ekilirse taban arazilerde aşırı iri yapraklı ve kalitesiz hale gelir. Devlet kaliteli tütünün yetiştiği kıraç ve yamaç arazilere izin vererek kalite standardını korumayı amaçlamıştır.',
  'Tütün kısıtlaması sigarayı bıraktırmak için değil, Türk tütününün kalitesini ve dünya ihracatındaki değerini korumak için konulmuştur.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de kültür balıkçılığı (çipura, levrek, alabalık yetiştiriciliği) son yıllarda dev bir ihracat sektörüne dönüşmüştür.

Deniz içi kafeslerde yapılan çipura ve levrek kültür balıkçılığında korunaklı koy ve körfezlerinin çokluğu sayesinde Türkiye üretiminin yaklaşık %65''ini gerçekleştiren ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Trabzon", "Mersin", "Muğla", "Zonguldak", "Sinop"], "correctIndex": 2}'::jsonb,
  'Muğla (Bodrum, Milas, Güllük körfezi kıyıları) girintili çıkıntılı koyları, dalgalara kapalı sakin suları ve uygun su sıcaklığıyla deniz kafes balıkçılığının (kültür balıkçılığının) Türkiye''deki mutlak lideridir.',
  'Açık deniz balık avcılığında lider Karadeniz (Trabzon, Samsun) iken; çiftlik/kültür kafes balıkçılığında lider Ege''dir (özellikle Muğla ve İzmir).'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Tiftik keçisi (Ankara keçisi), ipeksi ve parlak tiftik yünüyle dünyaca ünlü endemik bir keçi ırkımızdır.

Türkiye''de tiftik keçisi yetiştiriciliğinin en yoğun yapıldığı il ve coğrafi bölge aşağıdakilerden hangisidir?',
  '{"options": ["Ankara — İç Anadolu Bölgesi", "Antalya — Akdeniz Bölgesi", "Muğla — Ege Bölgesi", "Diyarbakır — Güneydoğu Anadolu Bölgesi", "Kars — Doğu Anadolu Bölgesi"], "correctIndex": 0}'::jsonb,
  'Tiftik keçisinin anavatanı Ankara ve İç Anadolu Bölgesi''dir (Siirt ve Mardin''de de kısmen görülür). Tiftiğinden değerli dokumalar üretilir.',
  'Kıl keçisi Toroslar/Akdeniz''de; Tiftik keçisi ise Ankara/İç Anadolu''da beslenir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de seracılık faaliyetleri kış sıcaklıklarının yüksek olduğu ve güneşli gün sayısının fazla olduğu kıyılarda yoğunlaşır. Kışın ısıtma giderlerinin az olması seracılıkta karlılığı belirler.

Buna göre seracılık faaliyetlerinin Akdeniz kıyılarında Ege kıyılarına göre daha erken hasat vermesinin ve daha karlı olmasının temel sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Toprak yapısının tamamen kumlu olması", "Enlem etkisiyle kış aylarının daha ılık geçmesi ve don olayının neredeyse hiç yaşanmaması", "Sulama sularının sıcak su kaynaklarından temin edilmesi", "Akdeniz''de tarımda makine kullanımının daha fazla olması", "Yaz aylarında turistlerin gelmesi"], "correctIndex": 1}'::jsonb,
  'Akdeniz kıyı kuşağı (Antalya, Mersin) enlem olarak daha güneydedir ve gerisindeki Toroslar kuzeyden gelen soğukları kestiği için kış sıcaklıkları 10°C civarındadır. Don olayı neredeyse hiç görülmez; böylece seraları sobayla/kömürle ısıtma maliyeti sıfıra yakın kalır.',
  'Seracılıkta belirleyici olan kış ılıklığı ve sera ısıtma masrafıdır. Bu yüzden Akdeniz (Antalya) seracılıkta Türkiye''nin başkentidir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de üretilen tarım ürünleri ve birinci sırada yer alan bölgeler eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Ayçiçeği — Marmara Bölgesi", "İncir — Ege Bölgesi", "Çay — Karadeniz Bölgesi", "Kırmızı Mercimek — Güneydoğu Anadolu Bölgesi", "Yeşil Mercimek — Akdeniz Bölgesi"], "correctIndex": 4}'::jsonb,
  'Yeşil mercimek kurak ve serin karasal iklimi sever; üretiminde lider bölge İç Anadolu''dur (Yozgat, Konya). Kırmızı mercimek ise kuraklığa ve sıcağa en dayanıklı baklagil olarak Güneydoğu Anadolu''da (Şanlıurfa, Diyarbakır) birinci sıradadır.',
  'Kırmızı mercimek = Güneydoğu Anadolu; Yeşil mercimek = İç Anadolu! Akdeniz mercimek üretiminde ilk sırada değildir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de tarım arazilerinin engebeli olduğu alanlarda tarımda makine kullanımı kısıtlıdır; buralarda insan ve hayvan gücüne ihtiyaç devam eder.

Aşağıdaki yörelerin hangisinde morfolojik engeller nedeniyle tarımda makineleşme oranı en düşüktür?',
  '{"options": ["Konya Ovası", "Çukurova", "Doğu Karadeniz Dağlık Kırsalı", "Harran Ovası", "Ergene Havzası"], "correctIndex": 2}'::jsonb,
  'Doğu Karadeniz''de arazinin dik, sarp ve teraslı olması traktör ve biçerdöver gibi makinelerin tarlaya girmesine izin vermez. Çay ve fındık tarımı tamamen el emeğiyle yapılır.',
  'Düz ovalarda (Konya, Harran, Çukurova, Ergene) makineleşme %100''e yakındır; Doğu Karadeniz, Hakkari ve Menteşe''de ise makineleşme topoğrafya engeline takılır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'İpek böcekçiliği, ipek böceği tırtılının dut yaprağı yiyerek salgıladığı liflerle koza örmesi prensibine dayanır. Son yıllarda yapay ipek ve sentetik elyaf üretiminin artması ipek böcekçiliğini geriletmiştir.

Buna rağmen geleneksel üretimin devam ettiği ve günümüzde yaş ipek kozası üretiminde ilk sırada yer alan ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Bursa", "Diyarbakır", "Balıkesir", "Yalova", "Bilecik"], "correctIndex": 1}'::jsonb,
  'Tarihsel olarak ipek böcekçiliği Bursa ile özdeşleşmiş olsa da günümüzde sanayileşme ve dutlukların azalması sebebiyle Bursa liderliğini kaybetmiştir. TÜİK verilerine göre yaş koza üretiminde Türkiye birincisi Diyarbakır''dır (Kulp ilçesi).',
  'Adayların çoğu refleks olarak ''Bursa'' şıkkına gider! Güncel TÜİK istatistiklerinde ipek böceği yaş koza üretiminde 1 numara Diyarbakır''dır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de modern ahır ve besi hayvancılığının büyük kentlerin çevresinde yoğunlaşması aşağıdakilerden hangisiyle açıklanamaz?',
  '{"options": ["Süt ve et ürünlerinin kolay bozulan hassas gıdalar olması", "Metropol kentlerin devasa bir tüketici pazarı oluşturması", "Besi hayvancılığının kapalı mekanlarda yapılması nedeniyle doğal çayır ve meralara bağımlı olmaması", "Geniş dağ çayırlarının yalnızca büyük kentlerin çevresinde yer alması", "Şeker fabrikalarından çıkan pancar küspesinin ucuz yem olarak kullanılması"], "correctIndex": 3}'::jsonb,
  'Besi (ahır) hayvancılığı kapalı tesislerde fenni yem ve küspe ile yapılır; meraya veya doğal çayırlara kesinlikle ihtiyaç duymaz. Büyük kentlerin çevresinde çayır olduğu için değil, pazar ve tüketici yakın olduğu için kurulur.',
  'Doğal çayırlar Erzurum-Kars ve Karadeniz dağlarındadır; metropol çevresindeki besi hayvancılığı meraya değil, tamamen yapay yem ve pazara bakar.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de üretilen kuru incir ve çekirdeksiz kuru üzüm (sultani üzüm) dünya ticaretinde Türkiye''nin en prestijli ihraç ürünleridir.

Bu iki ürünün üretim ve ihracatında Türkiye lideri olan bölgemiz ve başlıca illeri aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["İç Anadolu Bölgesi (Konya - Karaman)", "Ege Bölgesi (Aydın - Manisa)", "Güneydoğu Anadolu Bölgesi (Gaziantep - Kilis)", "Marmara Bölgesi (Tekirdağ - Edirne)", "Akdeniz Bölgesi (Mersin - Hatay)"], "correctIndex": 1}'::jsonb,
  'Kuru incir üretiminde Aydın, kuru üzüm üretiminde ise Manisa Ege Bölgesi''nin ve Türkiye''nin tartışmasız dünya lideri merkezleridir.',
  'İncir = Aydın/Büyük Menderes; Üzüm = Manisa/Gediz Havzası. İkisi de Ege''nin altın ürünleridir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de sulama imkanlarının gelişmesiyle birlikte tarım ürünlerinin ekim deseninde köklü değişimler meydana gelir.

Bir yörede modern sulama kanallarının faaliyete geçmesi durumunda aşağıdaki gelişmelerden hangisinin yaşanması beklenmez?',
  '{"options": ["Nadasa bırakılan tarla alanlarının hızla daralması", "Yılda birden fazla ürün (ikinci ürün) alma imkanının doğması", "Endüstriyel sanayi bitkilerinin (mısır, pamuk, sebze) ekim alanının genişlemesi", "Tarımsal üretimde iklim koşullarına bağlı yıllık dalgalanmaların artması", "Tarımsal gelirin artmasına bağlı olarak kırsaldan kente göçün azalması"], "correctIndex": 3}'::jsonb,
  'Sulama yapıldığında çiftçi yağmura bağımlı olmaktan kurtulur; kurak yıllarda bile barajdan su verilebildiği için üretimde yıldan yıla görülen dalgalanmalar ARTMAZ, tam tersine MİNİMUMA İNER ve istikrar sağlanır.',
  'Sulamayla üretimdeki dalgalanma azalır, üretim garantiye alınır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'I. Haşhaş — Afyonkarahisar, Konya
II. Kenevir — Samsun
III. Çay — Rize, Trabzon
IV. Muz — Mersin, Antalya

Yukarıda verilen tarım ürünlerinden hangilerinin yetiştirilme alanlarının dar olması ''doğal iklim isteklerinin aşırı seçici olmasından'' değil, ''tamamen devletin yasal kısıtlamasından'' kaynaklanır?',
  '{"options": ["I ve II", "III ve IV", "I ve III", "II ve IV", "I, II ve III"], "correctIndex": 0}'::jsonb,
  'Haşhaş ve kenevir Türkiye''nin hemen her bölgesinde iklim olarak rahatça yetişebilir. Ancak içerdikleri uyuşturucu ve keyif verici maddeler sebebiyle devlet izin vermediği için ekim alanları çok dardır. Çay ve muz ise iklim seçiciliği (mikroklima ihtiyacı) yüzünden dardır.',
  'ÖSYM ''İklim şartı sebebiyle dar olanlar'' (Muz, Çay) ile ''Yasal/Devlet kısıtlamasıyla dar olanlar'' (Haşhaş, Kenevir) ayrımını çok sever.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de göl balıkçılığı değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Beyşehir ve Eğirdir göllerinde tatlı su levreği ve sazan balıkçılığı yapılır.", "Van Gölü''nün sodalı sularında yaşayan ve üremek için akarsulara göç eden endemik tür ''inci kefali''dir.", "Tuz Gölü''nde balık üretimi Türkiye''nin en karlı tatlı su balıkçılığı sektörünü oluşturur.", "İznik ve Manyas göllerinde kerevit (tatlı su ıstakozu) avcılığı yapılmaktadır.", "Keban ve Atatürk baraj göllerinde alabalık kafes balıkçılığı önemli bir gelir kaynağıdır."], "correctIndex": 2}'::jsonb,
  'Tuz Gölü aşırı tuzlu (tuzluluk oranı %33) olduğu için içerisinde hiçbir balık türü yaşayamaz; Tuz Gölü''nde balıkçılık kesinlikle yapılamaz.',
  'Tuz Gölü ve Burdur Gölü gibi aşırı tuzlu/acı göllerde balık yaşamaz. Van Gölü ise sodalıdır ve sadece inci kefali yaşar.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'I. Baklagiller içerisinde kuraklığa en dayanıklı olan kırmızı mercimektir.
II. Ayçiçeği tohumlarının olgunlaşma evresinde bol güneş ışığı ve kuraklık gerekir.
III. Çeltik (pirinç) üretimi Türkiye''nin iç tüketimini karşılamaya yettiği için dışarıdan pirinç ithal edilmez.

Yukarıdaki ifadelerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'I ve II doğrudur. Ancak III numaralı öncül yanlıştır: Türkiye pirinç üretimini Edirne, Balıkesir ve Samsun''da yoğunlaştırsa da yıllık üretim iç tüketimi karşılayamaz; Türkiye düzenli olarak pirinç ithal eden bir ülkedir.',
  'Türkiye çay, fındık, incir, kayısıda kendine yeter ve ihraç eder; ancak pirinç, muz, kahve ve soya fasulyesinde iç tüketimi karşılayamaz ve ithal eder.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Şeker pancarı tarımı Akdeniz ve Ege''nin verimli delta ovalarında (Çukurova, Gediz, Büyük Menderes) iklim ve toprak şartları açısından çok rahat yapılabileceği halde, bu kıyı ovalarında şeker pancarı ekimi neredeyse hiç yapılmamaktadır.

Bu durumun temel iktisadi ve rasyonel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Kıyı ovalarında pancarın şeker oranının sıfıra düşmesi", "Kıyı ovalarında pamuk, mısır, narenciye ve turfanda sebze gibi ekonomik getirisi pancardan çok daha yüksek alternatif ticari ürünlerin tercih edilmesi", "Kıyı kentlerinde şeker fabrikası kurmanın kanunen yasaklanmış olması", "Kıyı çiftçilerinin kooperatifleşememiş olması", "Kıyı topraklarının aşırı kireçli olması"], "correctIndex": 1}'::jsonb,
  'Şeker pancarı kıyıda çok iyi yetişir; hatta sulamayla devasa verim alınır. Ancak Akdeniz ve Ege ovaları yılda 2-3 hasat alınan altın arazilerdir. Çiftçi 1 dönümden narenciye, muz, turfanda sebze veya pamuk ile çok büyük paralar kazanırken tarlasını 1 yıl boyunca düşük taban fiyatlı pancara bağlamaz.',
  'ÖSYM ''Şeker pancarı neden kıyıda ekilmez?'' sorusunu çok sorar: İklim engeli yoktur! Tek sebep çiftçinin daha karlı alternatif ürünleri tercih etmesidir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Doğu Karadeniz Bölümü''nde çay tarımı Cumhuriyet''in ilk yıllarında Zihni Derin''in öncülüğünde Gürcistan''dan (Batum) getirilen fidanlarla başlatılmış ve bugün bölgenin temel monokültür ürünü haline gelmiştir.

Türkiye''de çay tarımının yalnızca Doğu Karadeniz kıyı şeridinde tutunabilmesinin temel pedolojik ve mikroklimatik şartı aşağıdakilerden hangisidir?',
  '{"options": ["Kireçli ve alkali taban toprakları ile şiddetli yaz kuraklığı", "Aşırı yıkanmış kireçsiz asidik topraklar, her mevsim yüksek bağıl nem, bulutluluk ve kış donlarının olmaması", "Taban suyunun sıfır metrede olduğu tuzlu bataklıklar", "Volkanik tüf depoları ve sert karasal kış ayazı", "Günde 12 saat dik güneş ışığı alma zorunluluğu"], "correctIndex": 1}'::jsonb,
  'Çay bitkisi kireçli topraktan nefret eder; bol yağışla kireci tamamen yıkanmış asitli toprakları sever. Ayrıca her mevsim düzenli yağış, yüksek bulutluluk (güneşten yaprakların yanmaması) ve kış ılıklığı şarttır. Bu kombinasyon Türkiye''de yalnızca Doğu Karadeniz sahilinde vardır.',
  'Çay asidik toprak ister. Toprağın yıkanmış ve kireçsiz olması çayın olmazsa olmazıdır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'I. Karadeniz kıyılarında deniz suyunun 200 metreden daha derin kısımlarında balık yaşamaz.
II. Karadeniz''de avlanan balık miktarı Akdeniz''den katbekat fazladır.
III. Akdeniz''deki balık türü çeşitliliği Karadeniz''deki tür çeşitliliğinden fazladır.

Yukarıdaki yargılardan hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Her üç öncül de denizlerimizin temel biyolojik kanunlarıdır: Karadeniz''de 200 m altında kükürtlü hidrojen gazı (H2S) canlı hayatını yok eder. Plankton çokluğu yüzünden balık MİKTARI Karadeniz''de zirvedir. Ancak sıcaklık ve tuzluluk nedeniyle balık TÜR ÇEŞİTLİLİĞİ Akdeniz''de çok daha fazladır.',
  'Balık miktarı = Karadeniz; Balık tür çeşitliliği = Akdeniz! Bu ikisi birbirinin tersidir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Türkiye''de tarım ürünlerinin olgunlaşma ve hasat tarihleri bölgeler arasında farklılık gösterir.

Aynı tarihte ekilen buğdayın sırasıyla;
I. Çukurova
II. Konya Ovası
III. Erzurum Ovası
bölgelerinde hasat edilme sırası (en erkenden en geçe doğru) aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["I — II — III", "III — II — I", "II — I — III", "I — III — II", "II — III — I"], "correctIndex": 0}'::jsonb,
  'Tarım ürünlerinin olgunlaşma süresini sıcaklık belirler. Çukurova enlem ve denizellik sebebiyle en sıcak yerdir ve hasat ilk olarak Mayıs-Haziranda burada başlar (I). Konya karasaldır, Temmuz başında hasat edilir (II). Erzurum ise yüksek rakım ve soğuk nedeniyle en geç Ağustos sonunda hasat edilir (III).',
  'Hasat sırası: En erken Akdeniz (enlem/denizellik) -> Sonra İç Anadolu -> En geç Doğu Anadolu (yükselti/karasallık).'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'GAP''ın devreye girmesiyle Şanlıurfa ve çevresinde sulu tarıma geçilmiş, ancak çiftçilerin ''vahşi sulama'' (salma sulama) yöntemini aşırı uygulaması sonucunda topraklarda ciddi bir çevre ve verim felaketi baş göstermiştir.

Vahşi sulamanın kurak ve sıcak Harran Ovası''nda yol açtığı en büyük toprak bozunumu aşağıdakilerden hangisidir?',
  '{"options": ["Toprağın donarak taşlaşması", "Taban suyunun yükselmesi ve şiddetli buharlaşmayla yer altındaki tuz ve minerallerin toprak yüzeyinde birikerek toprağı çoraklaştırması (tuzlanma)", "Toprağın aşırı asitlenerek çöl kumuna dönüşmesi", "Toprakta humus oranının aşırı yükselmesi", "Toprakta heyelanların meydana gelmesi"], "correctIndex": 1}'::jsonb,
  'Sıcak ve buharlaşmanın şiddetli olduğu Harran Ovası''na kontrolsüzce su basıldığında taban suyu yukarı çıkar. Sıcak güneş suyu buharlaştırınca geriye yer altından çektiği kireç ve tuz kalır. Bu durum toprak yüzeyini beyaz bir tuz tabakasıyla kaplayarak arazileri çoraklaştırır.',
  'Güneydoğu''da aşırı sulamanın sonucu heyelan veya erozyon değil; ''toprakta tuzlanma ve çoraklaşma''dır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Aşağıdaki meyvelerden hangisi dünya pazarında yaş meyve olarak ihraç edildiğinde raf ömrünün kısalığı nedeniyle zorluk yaşandığı için daha çok güneşte kurutularak ''kuru meyve'' halinde dünya ihracat şampiyonu olmuştur?',
  '{"options": ["Kayısı ve İncir", "Karpuz ve Kavun", "Muz ve Kivi", "Portakal ve Mandalina", "Elma ve Armut"], "correctIndex": 0}'::jsonb,
  'Malatya kayısısı ve Aydın inciri taze iken çok çabuk bozulur ve ezilir. Akdeniz ve karasal iklimin şiddetli yaz güneşi altında kükürtlenerek kurutulan bu ürünler, kuru kayısı ve kuru incir olarak Türkiye''nin dünya ihracatında tekelleştiği ana ürünlerdir.',
  'Türkiye yaş meyvede değil, özellikle ''kuru incir'', ''kuru kayısı'', ''çekirdeksiz kuru üzüm'' ve ''fındık''ta dünya ihracat lideridir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Türkiye''de tarım işletmelerinin (çiftliklerin) yapısı incelendiğinde en büyük yapısal sorunun aşağıdakilerden hangisi olduğu görülür?',
  '{"options": ["Tarım arazilerinin dev şirketlerin elinde tekelleşmesi", "Miras hukuku nedeniyle tarım arazilerinin aşırı bölünerek küçük, parçalı ve birbirinden uzak parsellere dönüşmesi", "Tüm tarlalarda yalnızca tek tip tohum kullanılması", "Türkiye''de çiftçi sayısının nüfusun %50''sini oluşturması", "Gübre kullanımının yasaklanmış olması"], "correctIndex": 1}'::jsonb,
  'Geleneksel miras hukuku her kuşakta tarlaları kardeşler arasında bölmüştür. Bir çiftçinin toplam 40 dönüm arazisi 10 ayrı küçük parça halinde köyün farklı uçlarına dağılmış durumdadır. Bu durum traktör işletme maliyetini artırmakta ve verimi düşürmektedir. Çözüm ''arazi toplulaştırması''dır.',
  'Türkiye tarımının temel yapısal kangreni ''arazilerin mirasla parçalanmış ve dağınık olması''dır.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Sulak alanları, sazlıkları ve bataklık ortamları seven, lifli ve kaba otları süte dönüştürebilen, manda (camız) yetiştiriciliğinin Türkiye''de en yoğun yapıldığı il ve coğrafi alan aşağıdakilerden hangisidir?',
  '{"options": ["Konya — Cihanbeyli Platosu", "Samsun — Kızılırmak Deltası (Bafra Kuş Cenneti sulak alanları)", "Şanlıurfa — Harran Ovası", "Antalya — Teke Platosu", "İzmir — Bakırçay Ovası"], "correctIndex": 1}'::jsonb,
  'Manda suya bağımlı bir hayvandır; derisi kalın olduğu için terleyemez ve çamurlu göletlerde serinler. Türkiye''de manda varlığının en yoğun olduğu yer Samsun''daki Kızılırmak Deltası (Bafra sulak alanları) ve çevresidir (ayrıca Diyarbakır ve İstanbul kırsalı).',
  'Manda kurak yerde yaşayamaz. Bozkır platoları manda için uygun değildir; sulak delta ve göl kenarı (Samsun Bafra) manda merkezidir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Türkiye''de tarım ürünlerinin ihracat ve ithalat dengesi düşünüldüğünde aşağıdakilerden hangisi Türkiye''nin net İTHALATÇI (dışarıdan satın alan) olduğu ürünlerden biridir?',
  '{"options": ["Fındık", "Kuru İncir", "Kahve", "Kuru Kayısı", "Kiraz"], "correctIndex": 2}'::jsonb,
  'Kahve tropikal bir bitkidir ve Türkiye''de iklim şartları nedeniyle hiçbir yerde yetiştirilemez. ''Türk kahvesi'' bir pişirme ve sunum kültürüdür; hammadde olarak kahve çekirdeğinin %100''ü Brezilya ve Kolombiya gibi ülkelerden ithal edilir.',
  'Türk kahvesi ifadesi adayları yanıltabilir; Türkiye''de kahve üretimi sıfırdır, tamamen ithal edilir.'
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  3,
  'Karasal iklim bölgelerinde küçükbaş hayvancılık yapan üreticilerin karşılaştığı en temel doğal risk aşağıdakilerden hangisidir?',
  '{"options": ["Aşırı yaz yağışlarıyla otların çürümesi", "İlkbahar kuraklığı yaşandığında bozkır otlarının yetersiz kalması ve yem maliyetlerinin katlanması", "Koyunların sarp kayalıklara tırmanamayıp telef olması", "Akarsu taşkınlarının tüm meraları sular altında bırakması", "Sütlerin sıcaktan dolayı yolda kaynaması"], "correctIndex": 1}'::jsonb,
  'Mera tipi koyun yetiştiriciliği tamamen ilkbahar yağışlarıyla yeşeren doğal bozkır otlarına bağımlıdır. İlkbahar kurak geçtiğinde meralar yeşeremez, hayvanlar aç kalır ve üretici yüksek maliyetli fenni yem almak zorunda kalarak zarar eder.',
  'Karasal meralarda en büyük kriz ilkbahar kuraklığı ve bozkırın yeşerememesidir.'
);

-- =============================================================
-- KPSS COĞRAFYA — KONU 5: MADENLER VE ENERJI KAYNAKLARI
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================


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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Türkiye''de jeolojik zamanlar boyunca yoğun volkanik faaliyetler, kırılmalar ve başkalaşım (metamorfizma) süreçleri yaşanmıştır.

Türkiye''de maden çeşitliliği ve rezerv zenginliği bakımından ilk sırada yer alan coğrafi bölüm ve ilimiz aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Yukarı Fırat Bölümü — Elazığ", "Çatalca - Kocaeli Bölümü — İstanbul", "Kıyı Ege Bölümü — İzmir", "Antalya Bölümü — Antalya", "Konya Bölümü — Konya"], "correctIndex": 0}'::jsonb,
  'Türkiye''de maden çeşitliliğinin en fazla olduğu coğrafi bölge Doğu Anadolu, bölüm Yukarı Fırat Bölümü, il ise Elazığ''dır (Maden ilçesinde bakır, Guleman''da krom, Keban''da kurşun-çinko, Alacakaya''da mermer).',
  'Sanayi devi Marmara olsa da yer altı maden çeşitliliği birincisi Yukarı Fırat Bölümü ve Elazığ''dır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Dünya toplam rezervinin yaklaşık %72''sine Türkiye''nin sahip olduğu; roket yakıtı, cam, seramik, deterjan ve nükleer sanayide kullanılan stratejik maden aşağıdakilerden hangisidir?',
  '{"options": ["Boksit", "Krom", "Bor Mineralleri", "Barit", "Asbest"], "correctIndex": 2}'::jsonb,
  'Türkiye dünyadaki bor rezervlerinin yaklaşık %72-73''ünü elinde bulundurarak dünya tekeli konumundadır. Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa), Kütahya (Emet) ve Eskişehir (Seyitgazi/Kırka) başlıca çıkarım sahalarıdır.',
  'Dünya rezervinin dörtte üçüne sahip olduğumuz ve her sınavda potansiyel soru olan milli madenimiz Bordur.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Demirin çeliğe dönüştürülmesinde sertleştirici ve paslanmazlık sağlayıcı olarak kullanılan, Türkiye''nin önemli ihraç madenlerinden biri olan kromun en önemli çıkarım ve işleme merkezi aşağıdakilerden hangisidir?',
  '{"options": ["Elazığ (Guleman)", "Zonguldak (Ereğli)", "Artvin (Murgul)", "Konya (Seydişehir)", "Balıkesir (Bandırma)"], "correctIndex": 0}'::jsonb,
  'Kromun Türkiye''deki en zengin yatakları Elazığ-Guleman ve Muğla-Fethiye-Köyceğiz yörelerindedir. Elazığ''da çıkarılan krom yine Elazığ Ferrokrom Tesisleri''nde işlenir.',
  'Krom denince akla gelen iki ferrokrom tesisi Elazığ (hammaddeye yakın) ve Antalya''dır (limana/ihracata yakın).'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Alüminyumun hammaddesi olan boksit madeni Türkiye''de çıkarıldığı yerde işlenerek alüminyuma dönüştürülmektedir.

Türkiye''nin tek entegre boksit ve alüminyum tesisleri hangi ilçemizde yer almaktadır?',
  '{"options": ["Konya — Seydişehir", "İzmir — Aliağa", "Sivas — Divriği", "Manisa — Soma", "Mardin — Mazıdağı"], "correctIndex": 0}'::jsonb,
  'Boksit (alüminyum) yatakları Konya-Seydişehir ve Antalya-Akseki''de bulunur. Türkiye''nin tek alüminyum fabrikası Konya-Seydişehir''de kurulmuştur.',
  'Boksit = Alüminyum = Seydişehir! Bu eşleştirme ÖSYM sınavlarının demirbaş bilgisidir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Türkiye''de maden ihracatı gelirleri incelendiğinde, tek başına maden ihracatımızın yaklaşık yarısını oluşturan ve en yüksek döviz girdisi sağlayan maden türü aşağıdakilerden hangisidir?',
  '{"options": ["Krom", "Mermer (Doğal Taş)", "Bakır", "Linyit", "Fosfat"], "correctIndex": 1}'::jsonb,
  'Kalkerin yüksek sıcaklık ve basınç altında metamorfizmaya uğramasıyla oluşan mermer (özellikle Afyonkarahisar, Marmara Adası, Bilecik, Muğla ve Elazığ vişne mermeri), Türkiye''nin maden ihracat gelirlerinde açık ara birinci sıradadır.',
  'Adaylar bor veya kromun ihracatta birinci olduğunu düşünebilir; parasal getiri ve hacimde açık ara 1 numara işlenmiş ve blok mermerdir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Türkiye''de elektrik enerjisi üretiminde kullanılan kaynaklar arasında yer alan taş kömürü ile linyit arasındaki en temel jeolojik ve kimyasal fark aşağıdakilerden hangisidir?',
  '{"options": ["Taş kömürünün III. Zaman''da, linyitin I. Zaman''da oluşması", "Taş kömürünün I. Zaman''da (Paleozoyik) oluşmuş yüksek kalorili bir kömür olması; linyitin ise III. Zaman''da oluşmuş düşük kalorili genç bir kömür olması", "Linyitin sadece Karadeniz''de, taş kömürünün tüm bölgelerde bulunması", "Taş kömürünün evlerin ısıtılmasında, linyitin sadece demir-çelik sanayisinde kullanılması", "Linyitin çevreye hiç karbon salınımı yapmaması"], "correctIndex": 1}'::jsonb,
  'Taş kömürü I. Jeolojik Zaman''da (Paleozoyik) oluşmuş, karbon oranı ve kalorisi çok yüksek yaşlı bir kömürdür (Zonguldak). Linyit ise III. Jeolojik Zaman''da oluşmuş, kalorisi düşük, kükürt oranı yüksek genç bir kömürdür ve Türkiye''nin her yerine yayılmıştır.',
  'Demir-çelik fabrikalarında yüksek ısı sağladığı için taş kömürü (kok kömürü) kullanılır; linyitin kalorisi demiri eritmeye yetmez, sadece termik santrallerde yakılır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Türkiye''nin en büyük linyit rezervine sahip olan ve üzerinde devasa termik elektrik üretim santralleri kurulan yöresi aşağıdakilerden hangisidir?',
  '{"options": ["Kahramanmaraş — Afşin-Elbistan", "Manisa — Soma", "Kütahya — Tavşanlı", "Muğla — Yatağan", "Bursa — Orhaneli"], "correctIndex": 0}'::jsonb,
  'Türkiye''deki toplam linyit rezervinin yaklaşık yarısı tek başına Kahramanmaraş''taki Afşin-Elbistan linyit havzasında bulunmaktadır. Buradaki A ve B santralleri Türkiye''nin en büyük termik santrallerindendir.',
  'Soma ve Yatağan da linyitle çalışır ancak en büyük linyit rezervi tartışmasız Kahramanmaraş Afşin-Elbistan''dadır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Türkiye''de petrol ilk kez 1940 yılında hangi dağımızda açılarak üretime başlayan kuyudan çıkarılmıştır?',
  '{"options": ["Nemrut Dağı", "Raman Dağı (Batman)", "Cudi Dağı", "Gabar Dağı", "Tendürek Dağı"], "correctIndex": 1}'::jsonb,
  'Türkiye''de ilk ticari petrol keşfi 1940 yılında Batman sınırları içindeki Raman Dağı''nda (Raman-8 kuyusu) yapılmış ve burada Türkiye''nin ilk rafinerisi kurulmuştur.',
  'Son yıllarda Şırnak Gabar Dağı''nda büyük rezervler bulunsa da Türkiye''nin ilk petrol dağı tarihi olarak Raman Dağı''dır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Türkiye''de yer altındaki sıcak su ve su buharından elektrik üretilen jeotermal enerji santralleri (JES) en çok hangi coğrafi bölgemizde yoğunlaşmıştır?',
  '{"options": ["İç Anadolu Bölgesi", "Ege Bölgesi", "Karadeniz Bölgesi", "Doğu Anadolu Bölgesi", "Güneydoğu Anadolu Bölgesi"], "correctIndex": 1}'::jsonb,
  'Jeotermal enerji kırıklı fay hatlarına ve genç tektonik çöküntülere bağlıdır. Batı Anadolu Fay Sistemi''nin horst-graben oluklarında yer alan Ege Bölgesi (Denizli-Sarayköy, Aydın-Germencik, Manisa-Alaşehir) Türkiye''nin jeotermal enerji merkezidir.',
  'İlk jeotermal santral Denizli-Sarayköy''dedir; ardından Aydın-Germencik kurulmuştur. Lider bölge Ege''dir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  1,
  'Suni gübre sanayisinin temel girdisi olan fosfat kayası Türkiye''de en çok hangi ilimizin ilçesinde çıkarılmaktadır?',
  '{"options": ["Mardin — Mazıdağı", "Elazığ — Maden", "Kastamonu — Küre", "Sivas — Kangal", "Konya — Seydişehir"], "correctIndex": 0}'::jsonb,
  'Türkiye''deki en önemli fosfat yatakları ve fosfat işleme entegre tesisi Mardin''in Mazıdağı ilçesinde yer almaktadır. Ancak bu rezervler ülke gübre tüketimini karşılamaya yetmediğinden Fas ve Tunus''tan fosfat ithal edilir.',
  'Fosfat = Gübre = Mardin Mazıdağı. Çıkarıldığı halde tüketimimiz çok olduğu için fosfatta dışa bağımlıyız.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Karabük ve Ereğli Demir-Çelik Fabrikaları''nın (KARDEMİR ve ERDEMİR) kuruluş yeri belirlenirken hammadde olan demir cevherinin bölgede bulunmamasına rağmen buranın tercih edilmesinin temel sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede iş gücü maliyetlerinin çok düşük olması", "Demiri eritecek yüksek kalorili taş kömürü yataklarına (enerji kaynağına) yakınlık", "Karadeniz''in balıkçılık potansiyeli", "Bölgede deprem riskinin sıfır olması", "Geniş tarım arazilerinin varlığı"], "correctIndex": 1}'::jsonb,
  'Demir cevheri Sivas-Divriği ve Malatya''dan getirilmektedir. Karabük ve Ereğli''nin seçilme nedeni demir değil, demiri eritecek olan 2000°C ısıyı sağlayan taş kömürü yataklarının (Zonguldak havzası) hemen yanı başında olmasıdır (enerji kaynağına yakınlık).',
  'İskenderun liman/ulaşım için; Karabük-Ereğli ise enerji kaynağı (taş kömürü) için kurulmuştur!'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'İskenderun Demir-Çelik Fabrikası''nın (İSDEMİR) kuruluş yerinin belirlenmesinde ne demir madeni yatakları ne de taş kömürü yatakları bulunmaktadır.

Buna rağmen İskenderun''un Türkiye''nin en büyük entegre yassı çelik üretim tesisi olarak seçilmesinin temel coğrafi gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Akdeniz ikliminin ılıman olması", "Geniş ve korunaklı bir limana sahip olması, ithalat ve ihracat kolaylığı (ulaşım faktörü)", "Bölgede hidroelektrik santrallerinin çokluğu", "Çukurova''daki pamuk tarımına destek olmak", "Toros Dağları''ndan gelen kaynak sularının bolluğu"], "correctIndex": 1}'::jsonb,
  'İskenderun ne hammaddeye (demir) ne de enerjiye (kömür) yakındır. Seçilme sebebi; ithal kömür ve cevherin dev gemilerle doğrudan yanaşabileceği derin ve korunaklı bir limanının bulunması ve Akdeniz üzerinden dünyaya ihracat kolaylığıdır (ulaşım/liman avantajı).',
  'Karabük/Ereğli = Enerji kaynağına yakınlık; İskenderun = Ulaşım ve liman kolaylığı.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Kastamonu-Küre''den çıkarılan bakır madeni işlenmek üzere Samsun''daki bakır işletmelerine taşınmaktadır.

Bakır izabe tesislerinin Küre yerine Samsun''da kurulmasının temel sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Samsun''da bakır madeni rezervlerinin daha zengin olması", "Samsun''un gelişmiş bir limana ve iç kesimlerle kolay demir yolu bağlantısına (hinterlanda) sahip olması", "Samsun''da doğal gaz santralinin bulunması", "Kastamonu''da işçi bulunamaması", "Küre''de hava sıcaklığının bakırı eritmeye elverişsiz olması"], "correctIndex": 1}'::jsonb,
  'Küre dağlık ve limansızdır. Samsun ise Canik Dağları basık olduğu için iç kesimlerle demiryolu bağlantısı olan, geniş hinterlandlı bir liman kentidir. Madenin deniz yoluyla sevkiyatı ve pazarlanması için tesis Samsun Limanı''nda kurulmuştur (ulaşım faktörü).',
  'Samsun''da bakır madeni ÇIKMAZ; hammadde Kastamonu Küre ve Murgul''dan gelir. Samsun sadece liman/ulaşım avantajıyla işleme tesisidir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Petrol rafinerileri ham petrolü işleyerek benzin, motorin, LPG, gaz yağı ve zift gibi yan ürünlere ayrıştırır.

Türkiye''deki petrol rafinerileri ve kuruluş gerekçeleri eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Batman Rafinerisi — Hammaddeye (petrol kuyularına) yakınlık", "İzmit (Tüpraş) Rafinerisi — Büyük tüketim pazarına ve sanayiye yakınlık", "İzmir (Aliağa) Rafinerisi — Liman ve deniz yolu ulaşımı kolaylığı", "Kırıkkale (Orta Anadolu) Rafinerisi — Stratejik iç güvenlik ve tüketim merkezlerine dağıtım", "Mersin (ATAŞ) Rafinerisi — Taş kömürü yataklarına yakınlık"], "correctIndex": 4}'::jsonb,
  'Mersin ATAŞ Rafinerisi deniz yoluyla ham petrol ithalatı (liman) için kurulmuştur (günümüzde depolama tesisi olarak kullanılır); taş kömürü ile hiçbir ilişkisi yoktur.',
  'Türkiye''de tek hammaddeye yakın rafineri Batman''dır. Diğerleri (İzmit, İzmir, Mersin, Kırıkkale) pazar, liman ve stratejik konum nedeniyle kurulmuştur.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de çıkarılan süs taşları ve çıkarıldıkları iller eşleştirmelerinden hangisi doğrudur?',
  '{"options": ["Oltu Taşı (Siyah kehribar) — Erzurum", "Lületaşı — Diyarbakır", "Krom Taşı — Sinop", "Oltu Taşı — Eskişehir", "Lületaşı — Trabzon"], "correctIndex": 0}'::jsonb,
  'Oltu taşı Erzurum''un Oltu ilçesinde çıkarılır (tespih ve süs eşyası). Lületaşı ise Eskişehir''de çıkarılır (pipo ve biblo).',
  'Oltu = Erzurum; Lületaşı = Eskişehir! Bu ikisinin illerini birbirine çaprazlayıp şıklara koymak ÖSYM''nin en klasik tuzağıdır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Doğal gaz elektrik üretiminde yüksek verimli ve nispeten temiz bir fosil yakıttır. Ancak Türkiye doğal gaz tüketiminin %98''ini Rusya, Azerbaycan ve İran gibi ülkelerden boru hatları ve LNG ile ithal etmektedir.

Aşağıdaki termik santrallerden hangisi elektrik üretirken yakıt olarak ''ithal doğal gaz'' kullanmaktadır?',
  '{"options": ["Afşin - Elbistan Termik Santrali", "Çatalağzı Termik Santrali", "Hamitabat (Kırklareli) ve Ambarlı (İstanbul) Santralleri", "Soma Termik Santrali", "Yatağan Termik Santrali"], "correctIndex": 2}'::jsonb,
  'Hamitabat (Kırklareli), Ambarlı (İstanbul) ve Ovaakça (Bursa) termik santralleri doğal gaz ile elektrik üretir. Afşin-Elbistan, Soma ve Yatağan linyitle; Çatalağzı ise taş kömürüyle çalışır.',
  'Çatalağzı = Taş Kömürü; Soma/Yatağan = Linyit; Hamitabat/Ambarlı/Ovaakça = Doğal Gaz.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin hidroelektrik enerji potansiyeli bölgeler arasında büyük tezat gösterir. Doğu Anadolu ve Doğu Karadeniz''de potansiyel zirvede iken, Marmara ve Ege''de potansiyel son derece düşüktür.

Bu durum hidroelektrik potansiyelin doğrudan aşağıdakilerden hangisine bağlı olmasının bir sonucudur?',
  '{"options": ["Bölgedeki maden rezervlerinin zenginliğine", "Yatak eğimi, akarsu akış hızı ve ortalama yükselti basamaklarına", "Akarsuların boylarının uzunluğuna", "Bölgedeki nüfus yoğunluğuna", "Akarsuların açık ya da kapalı havza olmasına"], "correctIndex": 1}'::jsonb,
  'Hidroelektrik potansiyel; suyun düştüğü yükseklik (kot farkı), vadinin dikliği ve akış hızıyla doğru orantılıdır. Yüksek ve eğimli Doğu Anadolu ile Karadeniz''de hidroelektrik enerji tavan yaparken, düz ova ve tabanlardan oluşan Marmara''da (Ergene vb.) eğim sıfıra yakın olduğu için potansiyel dip seviyededir.',
  'Akarsuyun uzun olması hidroelektrik üretmez! Belirleyici olan debi ve yatak eğimidir (yükselti farkı).'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Rüzgar enerjisi santralleri (RES), yıl boyu düzenli ve şiddetli hava akımlarının olduğu kıyı ve boğaz koridorlarında kurulur.

Türkiye''de rüzgar enerjisinden elektrik üreten santrallerin en yoğun kümelendiği bölge ve ilk kurulan rüzgar santralinin bulunduğu yöre aşağıdakilerden hangisidir?',
  '{"options": ["Ege Bölgesi — İzmir (Alaçatı / Çeşme)", "Doğu Anadolu Bölgesi — Erzurum", "İç Anadolu Bölgesi — Konya", "Karadeniz Bölgesi — Trabzon", "Akdeniz Bölgesi — Antalya"], "correctIndex": 0}'::jsonb,
  'Türkiye''de rüzgar enerjisi kurulu gücünün en yüksek olduğu bölge Ege ve Marmara''dır (İzmir, Balıkesir, Çanakkale, Manisa). Türkiye''nin ilk rüzgar enerji santrali 1998 yılında İzmir Çeşme Alaçatı''da faaliyete geçmiştir.',
  'İlk rüzgar santrali İzmir Alaçatı''dır; lider bölgeler ise Ege ve Güney Marmara''dır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'I. Balıkesir (Bandırma)
II. Eskişehir (Kırka)
III. Kütahya (Emet)
IV. Zonguldak (Ereğli)

Yukarıda verilen yerlerden hangilerinde bor tuzlarını işleyen bor türevleri ve borik asit fabrikaları yer almaktadır?',
  '{"options": ["I, II ve III", "II, III ve IV", "I ve IV", "Yalnız I", "I, II, III ve IV"], "correctIndex": 0}'::jsonb,
  'Bandırma''da Borik Asit Fabrikası (limana yakınlık); Eskişehir Kırka''da Sodyum Borat Fabrikası ve Kütahya Emet''te Borik Asit Tesisleri (hammaddeye yakınlık) bulunmaktadır. Ereğli''de ise demir-çelik fabrikası vardır, bor tesisi yoktur.',
  'Bandırma, Kırka ve Emet Eti Maden''in üç ana bor entegre tesisidir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de petrol ve doğal gaz arama kuyularında sondaj çamurunun yoğunluğunu artırarak basınç kontrolü sağlamak amacıyla kullanılan ve en çok Antalya (Alanya-Gazipaşa) ile Maraş-Elbistan''da çıkarılan ağır mineral hangisidir?',
  '{"options": ["Barit", "Asbest", "Feldspat", "Zımpara Taşı", "Kükürt"], "correctIndex": 0}'::jsonb,
  'Barit yüksek özgül ağırlığı olan baryum sülfat mineralidir. Petrol ve gaz sondajlarında kuyu püskürmelerini önleyen sondaj çamurunun temel maddesidir. Alanya ve Gazipaşa en bilinen yataklarıdır.',
  'Sondaj çamuru ve petrol kuyusu denince coğrafyada tek cevap Barittir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin güneş enerjisi potansiyeli incelendiğinde Güneydoğu Anadolu ve Akdeniz bölgeleri yıllık güneşlenme süresi bakımından en yüksek potansiyele sahiptir.

Buna karşılık Karadeniz Bölgesi''nin güneş enerjisi potansiyelinin Türkiye''nin en düşük seviyesinde kalmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Yıllık ortalama bulutluluk oranının çok yüksek ve yağışlı gün sayısının fazla olması", "Enleminin Ekvator''a çok yakın olması", "Güneş ışınlarının yere düşme açısının kutup kuşağıyla aynı olması", "Bölgede dağların kıyıya dik uzanması", "Toprağın aşırı kireçli olması"], "correctIndex": 0}'::jsonb,
  'Güneş enerjisi üretimi açık ve güneşli gün sayısına bağlıdır. Karadeniz kıyı kuşağı her mevsim nemli ve yağışlı geçtiği için bulutluluk oranı Türkiye''nin en yükseğidir; dolayısıyla yıllık güneşlenme süresi (yaklaşık 1700 saat) en düşüktür.',
  'Güneş enerjisinde potansiyel: En fazla Güneydoğu ve Akdeniz; en az Karadeniz (bulutluluk yüzünden).'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin ilk nükleer enerji santrali olan Akkuyu Nükleer Güç Santrali Mersin ilinde inşa edilmektedir.

Santral yeri olarak Mersin-Gülnar/Akkuyu sahasının seçilmesinde aşağıdakilerden hangisi birincil faktör olmuştur?',
  '{"options": ["Bölgenin I. derece aktif deprem fay hatlarından uzak olması ve reaktör soğutması için Akdeniz suyunun kullanılabilmesi", "Bölgede zengin uranyum ve toryum madenlerinin bulunması", "Güneydoğu Anadolu''daki pamuk tarımına elektrik sağlamak istenmesi", "Bölgede rüzgar hızının çok düşük olması", "Bölgenin nüfus yoğunluğunun Türkiye''nin en yükseği olması"], "correctIndex": 0}'::jsonb,
  'Nükleer santraller için en kritik güvenlik kriteri sismik stabilitedir. Mersin (ve Sinop) Türkiye''de deprem riski en az olan masif/kararlı alanlardandır. Ayrıca reaktörlerin nükleer soğutma çevrimi için devasa miktarda deniz suyuna (Akdeniz kıyısına) ihtiyaç duyulur.',
  'Akkuyu''da uranyum çıktığı için DEĞİL; deprem riski düşük olduğu ve deniz suyu soğutması yapılabileceği için kurulmuştur!'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'I. Sivas — Divriği
II. Malatya — Hekimhan ve Hasançelebi
III. Sakarya — Çamdağı
IV. Elazığ — Guleman

Yukarıda verilen maden yataklarından hangileri Türkiye''nin en önemli ''demir'' madeni sahaları arasında yer alır?',
  '{"options": ["I, II ve III", "II, III ve IV", "I ve IV", "Yalnız I", "I, II, III ve IV"], "correctIndex": 0}'::jsonb,
  'Divriği (Sivas), Hasançelebi ve Hekimhan (Malatya) ile Çamdağı (Sakarya) Türkiye''nin başlıca demir cevheri yataklarıdır. Guleman (Elazığ) ise demir değil krom yatağıdır.',
  'Guleman kromdur; Divriği ve Hekimhan demirdir. Bu ikisi madencilik coğrafyasının en temel ayrımıdır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Seramik, porselen, cam ve kaynak elektrotları sanayisinin temel hammaddesi olan ve Ege Bölgesi''nde (Manisa, Aydın, Muğla) çıkarılarak Güllük Limanı''ndan dünyaya ihraç edilen maden aşağıdakilerden hangisidir?',
  '{"options": ["Feldspat", "Linyit", "Kükürt", "Asbest", "Cıva"], "correctIndex": 0}'::jsonb,
  'Feldspat, Türkiye''nin son yıllarda dünya ihracatında liderliğe oynadığı, seramik ve cam sektörünün vazgeçilmez mineralidir. Yatakları Batı Anadolu''da (Demirci, Milas, Çine) kümelenmiştir.',
  'Cam ve seramik sanayisi dendiğinde bor ile birlikte en kritik mineral feldspattır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Çoruh Nehri üzerinde inşa edilen ve 275 metre gövde yüksekliği ile Türkiye''nin en yüksek, dünyanın ise kendi sınıfında beşinci en yüksek kemer barajı olan dev hidroelektrik santrali aşağıdakilerden hangisidir?',
  '{"options": ["Yusufeli Barajı", "Atatürk Barajı", "Keban Barajı", "Karakaya Barajı", "Hirfanlı Barajı"], "correctIndex": 0}'::jsonb,
  'Artvin''de Çoruh Nehri üzerinde inşa edilen Yusufeli Barajı ve HES, 275 metrelik gövde yüksekliğiyle Türkiye''nin en yüksek barajı unvanını Deriner Barajı''ndan devralmıştır.',
  'Su tutma hacminde ve kurulu güçte en büyük barajımız Atatürk Barajı''dır; gövde yüksekliğinde (en yüksek duvar) ise Yusufeli Barajı''dır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Oda sıcaklığında sıvı halde bulunan tek metal maden cıvadır. Geçmişte termometre, ayna ve tarım ilaçlarında kullanılmış, ancak insan ve çevre sağlığına aşırı toksik (zehirli) etkileri nedeniyle Türkiye''deki tüm cıva maden ocakları kapatılmıştır.

Kapatılmadan önce Türkiye''nin en önemli cıva yatakları hangi ilimizin ilçelerinde (Ödemiş, Karaburun) bulunmaktaydı?',
  '{"options": ["İzmir", "Antalya", "Trabzon", "Sivas", "Adana"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin en ünlü cıva sahaları İzmir (Ödemiş ve Karaburun) ile Konya (Sarayönü) havzalarındaydı. Ağır cıva zehirlenmesi ve Minamata Sözleşmesi kapsamında bu ocaklar kapatılmıştır.',
  'Cıva sıvı metaldir; İzmir Ödemiş ve Konya Sarayönü yatakları artık çevre mevzuatı gereği kapalıdır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Toryum geleceğin nükleer enerji yakıtı olarak kabul edilmektedir. Türkiye, dünyanın en zengin ikinci toryum rezervine sahip ülkesidir.

Türkiye''de toryum rezervlerinin en zengin olduğu tespit edilen il ve yöremiz aşağıdakilerden hangisidir?',
  '{"options": ["Eskişehir — Sivrihisar (Beylikova)", "Zonguldak — Ereğli", "Artvin — Murgul", "Muğla — Fethiye", "Tekirdağ — Çorlu"], "correctIndex": 0}'::jsonb,
  'Eskişehir Sivrihisar-Beylikova yöresi kompleks cevher yatağı olup dünyanın en büyük toryum ve nadir toprak elementleri (NTE) rezervlerinden birini barındırır.',
  'Geleceğin nükleer madeni Toryum = Eskişehir Sivrihisar Beylikova!'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de taş kömürü yakılarak elektrik enerjisi üretilen Türkiye''nin ilk ve en eski termik santrali aşağıdakilerden hangisidir?',
  '{"options": ["Çatalağzı Termik Santrali (Zonguldak)", "Soma Termik Santrali (Manisa)", "Yatağan Termik Santrali (Muğla)", "Hamitabat Termik Santrali (Kırklareli)", "Kangal Termik Santrali (Sivas)"], "correctIndex": 0}'::jsonb,
  'Zonguldak''ta kurulu olan Çatalağzı Termik Santrali, yerli taş kömürü tozlarını yakarak elektrik üreten Türkiye''nin taş kömürüne dayalı tek köklü devlet termik santralidir.',
  'Çatalağzı = Taş Kömürü. Diğer tüm kömürlü yerli santraller linyit kullanır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Elektrik ve elektronik sanayisinde iletkenliği nedeniyle en çok aranan maden bakırdır.

Aşağıdakilerden hangisi Türkiye''nin aktif veya tarihi bakır madeni çıkarım sahalarından biri değildir?',
  '{"options": ["Artvin — Murgul", "Kastamonu — Küre", "Rize — Çayeli", "Elazığ — Maden", "Eskişehir — Seyitgazi"], "correctIndex": 4}'::jsonb,
  'Murgul, Küre, Çayeli ve Maden (Elazığ) Türkiye''nin dört büyük bakır merkezidir (şifresi: ''KADER'' - Kastamonu, Artvin, Diyarbakır, Elazığ, Rize). Eskişehir Seyitgazi ise bor madeni sahasıdır.',
  'Bakırın şifresi KADER''dir (Küre, Artvin/Murgul, Diyarbakır/Ergani, Elazığ/Maden, Rize/Çayeli). Eskişehir''de bakır değil bor çıkar.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'I. Jeotermal enerji
II. Taş kömürü
III. Doğal gaz
IV. Rüzgar enerjisi

Yukarıda verilen enerji kaynaklarından hangileri ''tükenmeyen / yenilenebilir ve temiz'' enerji kaynakları grubundadır?',
  '{"options": ["I ve IV", "II ve III", "I ve III", "II ve IV", "I, II ve IV"], "correctIndex": 0}'::jsonb,
  'Jeotermal ve rüzgar enerjisi doğanın sürekliliğinden faydalanan yenilenebilir (temiz) kaynaklardır. Taş kömürü ve doğal gaz ise yakıldıkça tükenen ve atmosfere karbon salan fosil yakıtlardır.',
  'Fosil yakıtlar (kömür, petrol, gaz) yenilenemez; su, rüzgar, güneş ve jeotermal ise yenilenebilir enerjidir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Türkiye''de sanayi tesislerinin kuruluş yeri belirlenirken ''hammaddeye yakınlık'', ''enerji kaynağına yakınlık'' ve ''ulaşım/pazara yakınlık'' temel belirleyicilerdir.

Buna göre aşağıdaki sanayi tesisi ve kuruluş yeri tercihi eşleştirmelerinden hangisi diğerlerinden farklı bir kritere dayanmaktadır?',
  '{"options": ["Seydişehir Alüminyum Tesisleri — Hammaddeye yakınlık", "Elazığ Ferrokrom Tesisleri — Hammaddeye yakınlık", "Murgul Bakır İşletmeleri — Hammaddeye yakınlık", "Samsun Bakır İzabe Tesisleri — Ulaşım ve liman kolaylığı", "Afyonkarahisar Mermer Fabrikaları — Hammaddeye yakınlık"], "correctIndex": 3}'::jsonb,
  'Seydişehir (boksit), Elazığ (krom), Murgul (bakır) ve Afyonkarahisar (mermer) fabrikaları madenin çıkarıldığı yerin hemen yanına kurulmuştur (hammaddeye yakınlık). Oysa Samsun''da bakır madeni çıkmaz; Kastamonu Küre''den kamyon ve gemilerle gelen cevher Samsun Limanı ve demiryolu sayesinde burada işlenir (ulaşım/pazar kriteri).',
  'Samsun Bakır Fabrikası ÖSYM''nin en meşhur ''ulaşım faktörü'' örneğidir; hammaddeye yakınlık değildir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Doğu Karadeniz Bölümü''nde zengin maden yatakları (Artvin Murgul bakırı, Rize Çayeli bakır ve çinkosu) ve dev hidroelektrik enerji potansiyeli bulunmasına rağmen, bölgede ağır demir-çelik sanayisinin kurulamamış olmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede taş kömürü bulunmaması ve arazinin çok engebeli olması sebebiyle geniş fabrika kuracak düz alan ile demiryolu ulaşım ağının bulunmaması", "Bölge halkının sanayiye izin vermemesi", "Bölgede tatlı su kaynaklarının yetersiz olması", "Karadeniz''in fırtınalı olması", "Bölgenin askeri yasak bölge olması"], "correctIndex": 0}'::jsonb,
  'Ağır sanayi binlerce dönüm düz arazi, yüksek kalorili taş kömürü ve en önemlisi ağır tonajlı tren yolu ağı ister. Doğu Karadeniz''de demiryolu hattı hiç yoktur; kıyı dik dağlarla çevrilidir ve taş kömürü yatakları Batı Karadeniz''dedir (Zonguldak).',
  'Doğu Karadeniz''de demiryolu ulaşımının olmaması ve topografik engebe sanayileşmenin önündeki en büyük coğrafi settir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Türkiye''de elektrik enerjisi üretiminde kurak geçen yıllarda hidroelektrik barajların su seviyesi düşmekte ve üretim payı gerilemektedir.

Böyle kurak dönemlerde oluşan enerji açığını kapatmak amacıyla payı en hızlı ve maliyetli şekilde artırılan elektrik kaynağı aşağıdakilerden hangisidir?',
  '{"options": ["Doğal Gaz Santralleri", "Rüzgar Santralleri", "Güneş Panelleri", "Jeotermal Santraller", "Taş Kömürü Santralleri"], "correctIndex": 0}'::jsonb,
  'Doğal gaz çevrim santralleri aç-kapa esnekliği en yüksek, anında devreye sokulabilen santrallerdir. Barajlarda su bitince enerji krizi yaşamamak için devlet doğal gaz santrallerine yüklenir; bu durum doğal gaz ithalat faturasını ve cari açığı aniden zıplatır.',
  'Barajlardaki su azaldığında açığı kapatan ilk kaynak doğal gazdır; bu yüzden kurak yıllarda enerji ithalat faturamız katlanır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Kırıkkale Orta Anadolu Petrol Rafinerisi deniz kenarında olmadığı halde Ankara''nın hemen yanı başında kurulmuştur.

Kırıkkale Rafinerisi''nin işlediği ham petrol rafineriye hangi yöntemle ulaştırılmaktadır?',
  '{"options": ["İskenderun ve Ceyhan Deniz Terminali''nden Kırıkkale''ye döşenen ham petrol boru hattı ile", "Sadece tanker kamyon filolarıyla", "Demiryolu sarnıçlı vagonlarıyla", "Karadeniz''den tanker gemilerle", "Kırıkkale''de petrol kuyusu açılarak"], "correctIndex": 0}'::jsonb,
  'Kırıkkale Rafinerisi deniz kıyısında değildir; petrol ihtiyacı Ceyhan (Adana/Yumurtalık) terminalinden Kırıkkale''ye çekilen Ceyhan-Kırıkkale Ham Petrol Boru Hattı vasıtasıyla pompalanarak karşılanır.',
  'Kırıkkale''de petrol çıkmaz! Petrol boru hattıyla Adana/Ceyhan''dan pompalanır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Güneydoğu Anadolu Projesi (GAP) kapsamında inşa edilen Atatürk Barajı ve Hidroelektrik Santrali Türkiye''nin elektrik üretiminde bir anıttır.

Atatürk Barajı ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Fırat Nehri üzerinde kurulmuş olup Türkiye''nin kurulu güç bakımından en büyük hidroelektrik santralidir.", "Gövde dolgu hacmi bakımından dünyanın en büyük barajları arasında yer alır.", "Göl aynasından Şanlıurfa Harran Ovası''na su aktarmak için dev Şanlıurfa Sulama Tünelleri inşa edilmiştir.", "Türkiye''nin gövde yüksekliği en yüksek (en derin) barajıdır.", "Gölünde tatlı su balıkçılığı ve su sporları yapılmaktadır."], "correctIndex": 3}'::jsonb,
  'Atatürk Barajı kurulu güç ve rezervuar alanı bakımından en büyüktür; ancak gövde yüksekliği bakımından Türkiye''nin en yüksek barajı Çoruh üzerindeki 275 metrelik Yusufeli Barajı''dır (ikinci Deriner''dir). Atatürk Barajı dolgu tipi yayvan bir barajdır.',
  'Atatürk Barajı en çok elektrik üreten ve en geniş alana yayılan barajdır; ancak EN YÜKSEK (en derin duvar) Yusufeli Barajı''dır!'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Türkiye''de son yıllarda Karadeniz açıklarında keşfedilen ''Sakarya Gaz Sahası''ndan (Filyos Limanı üzerinden sisteme bağlanan) çıkarılan yerli doğal gazın ekonomiye en temel katkısı aşağıdakilerden hangisidir?',
  '{"options": ["Türkiye''nin enerji ithalatı faturasını ve cari açığını azaltması", "Türkiye''deki tüm termik santrallerin kapatılmasını sağlaması", "Türkiye''nin petrol ihtiyacının tamamını karşılaması", "Nükleer santral ihtiyacını tamamen ortadan kaldırması", "Güneş enerjisi yatırımlarını durdurması"], "correctIndex": 0}'::jsonb,
  'Türkiye doğal gazda %98 oranında dışa bağımlıydı. Sakarya Gaz Sahası''ndan Filyos''a taşınan yerli Karadeniz gazı hane halkı tüketiminin önemli kısmını karşılayarak ülkenin en büyük kamburu olan enerji ithalatı kaynaklı cari açığı hafifletmektedir.',
  'Doğal gaz petrolün değil, kendi ithalat faturamızın yerini alır; nükleer veya güneşi durdurmaz, enerji sepetini çeşitlendirir.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'I. Taşkömürü — Zonguldak havzası
II. Linyit — Afşin-Elbistan havzası
III. Ham Petrol — Batman ve Şırnak havzası
IV. Doğal Gaz — Kırklareli Hamitabat ve Düzce Akçakoca

Yukarıdaki fosil enerji kaynaklarından hangilerinde Türkiye''nin yerli üretimi ülke tüketiminin %50''sinden fazlasını karşılayabilmektedir?',
  '{"options": ["Yalnız II", "I ve II", "II ve III", "I, III ve IV", "Hiçbiri"], "correctIndex": 0}'::jsonb,
  'Taş kömüründe tüketimimizin %90''ından fazlası ithaldir. Petrolde tüketimimizin %85-90''ı ithaldir. Doğal gazda %90''dan fazlası ithaldir. Ancak linyitte Türkiye''nin yerli rezervleri o kadar yaygındır ki termik santrallerde yakılan linyitin neredeyse tamamı yerli madenlerimizden temin edilir.',
  'Linyit yerli rezerv olarak en zengin olduğumuz fosil kaynaktır; petrol, taş kömürü ve gazda ise dışa bağımlıyız.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Türkiye''de ''maden zenginliği'' (rezerv ve çeşitlilik) ile ''sanayi gelişmişliği'' coğrafi olarak örtüşmez.

Bu tezat durumu kanıtlayan en somut bölgesel karşılaştırma aşağıdakilerden hangisidir?',
  '{"options": ["Doğu Anadolu Bölgesi''nin maden çeşitliliğinde birinci, sanayi üretiminde sonuncu olması; Marmara Bölgesi''nin ise maden fakiri olmasına rağmen sanayide açık ara birinci olması", "İç Anadolu''nun tarımda lider olması", "Karadeniz''in çayda lider olması", "Akdeniz''in seracılıkta birinci olması", "Ege''nin zeytinyağında birinci olması"], "correctIndex": 0}'::jsonb,
  'Maden çeşitliliğinin şampiyonu Doğu Anadolu (özellikle Elazığ) olmasına karşın sermaye, pazar ve ulaşım kısıtları nedeniyle sanayisi en geri kalmış bölgedir. Tersine Marmara maden bakımından çok fakir olmasına karşın sermaye, liman ve pazar gücüyle Türkiye sanayisinin kalbidir.',
  'ÖSYM hammadde coğrafyası ile sanayi coğrafyası arasındaki mekânsal ayrışmayı çok sık soru konusu yapar.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Türkiye''de jeotermal elektrik üretim tesislerinden çıkan sıcak suyun reenjeksiyon (tekrar yer altına basılma) yöntemiyle kuyuya geri gönderilmemesi durumunda ortaya çıkacak en büyük çevresel tehlike aşağıdakilerden hangisidir?',
  '{"options": ["İçerdiği yoğun kükürt, bor ve ağır metallerin tarım arazilerini ve içme sularını zehirleyerek çoraklaştırması", "Bölgede aniden buzulların oluşması", "Bölgedeki rüzgarların yön değiştirmesi", "Toprağın aşırı verimli hale gelip ormanları kurutması", "Denizlerin tuzluluk oranının sıfıra inmesi"], "correctIndex": 0}'::jsonb,
  'Jeotermal sular yer altından bor, arsenik ve kükürt gibi zehirli minerallerle çıkar. Eğer soğuduktan sonra yer altına geri basılmazsa Büyük Menderes ve Gediz nehirlerine karışarak Ege''nin incir ve zeytin bahçelerini tuzlayıp zehirler (çevre felaketi).',
  'Jeotermal temiz enerjidir ancak atık suyunun nehre bırakılması ağır kimyasal kirlilik (bor kirliliği) yaratır.'
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  3,
  'Dünya bor rezervlerinin %72''sini kontrol eden Türkiye''nin bor madenciliğinde dünya pazarlarındaki en büyük eksikliği ve katma değer yaratma hedefi aşağıdakilerden hangisidir?',
  '{"options": ["Bor madenini ham (tüvenan) cevher olarak satmak yerine lityum-iyon batarya, nükleer zırh ve savunma sanayi nihai yüksek teknolojili ürünlerine dönüştürerek ihraç etmek", "Bor rezervlerini tamamen yabancı şirketlere devretmek", "Bor maden ocaklarını kapatarak kömüre yönelmek", "Bor madenini sadece evlerde deterjan olarak tüketmek", "Bor madenini deniz yolu yerine sadece karayoluyla taşımak"], "correctIndex": 0}'::jsonb,
  'Türkiye boru tonu 200-300 dolara ham mineral olarak ihraç ettiğinde düşük gelir elde eder. Eğer bu bor Balıkesir Bandırma Bor Karbür tesisinde olduğu gibi işlenip zırh ve yüksek teknoloji parçasına dönüştürülürse tonu 40.000 dolara kadar satılabilir (katma değer artışı).',
  'Türkiye''nin madencilikteki genel sorunu cevheri ham satmasıdır; hedef katma değerli nihai teknolojik ürün üretmektir.'
);

-- =============================================================
-- KPSS COĞRAFYA — KONU 6: SANAYI, TICARET VE ULAŞIM
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================


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

-- ==========================================================================
-- KADRO COĞRAFYA EK TESTLER — TEST 5 & TEST 6 (120 YENİ SORU)
-- 6 Konu x 20 Soru (Her Konu İçin Test 5 ve Test 6)
-- Toplam Coğrafya Soru Havuzu: 240 + 120 = 360 Soru
-- ÖSYM Çeldirici Tuzağı (UWorld Modeli)
-- ==========================================================================


-- Soru #001 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Mart tarihinde Türkiye''de yer alan iki farklı merkezde Güneş aynı anda doğmuş ve aynı anda batmıştır.

Bu iki merkezin kesinlikle aynı olduğu özellik aşağıdakilerden hangisidir?',
  '{"options": ["Enlem dereceleri", "Boylam dereceleri", "Deniz seviyesinden yükseltileri", "Başlangıç Meridyeni''ne olan kuş uçuşu uzaklıkları", "Yıllık ortalama sıcaklık değerleri"], "correctIndex": 1}'::jsonb,
  '21 Mart ve 23 Eylül ekinoks tarihlerinde Dünya genelinde 12 saat gündüz, 12 saat gece yaşanır. Güneş sadece aynı boylam üzerindeki noktalarda aynı anda doğar ve tam 12 saat sonra aynı anda batar. Bu nedenle bu iki merkezin boylamları kesinlikle aynıdır.',
  'Adayların en büyük çeldiricisi enlemdir. Normal günlerde aynı boylamda güneş aynı anda doğmaz (aydınlanma çemberi eğik geçer). Ancak ekinokslarda aydınlanma çemberi kutup noktalarından geçtiği için aynı boylamdaki tüm noktalarda güneş aynı anda doğar ve batar.'
);

-- Soru #002 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin ''Orta Kuşak''ta (30°-60° enlemleri arasında) yer alması, ülkede çeşitli iklimsel ve fiziksel sonuçlar doğurmuştur.

Aşağıdakilerden hangisi Türkiye''nin yalnızca Orta Kuşak''ta yer almasıyla açıklanamaz, özel konumun da devreye girdiğini gösterir?',
  '{"options": ["Akdeniz iklim kuşağında yer alması", "Batı rüzgarlarının etki alanında bulunması", "Yıl içinde dört mevsimin belirgin olarak yaşanması", "Aynı anda farklı yörelerde farklı mevsim özelliklerinin hissedilmesi", "Kış aylarında cephesel (frontral) kökenli yağışların egemen olması"], "correctIndex": 3}'::jsonb,
  'Orta Kuşak''ta bulunmanın 4 temel göstergesi (A-B-C-D kuralı): Akdeniz iklimi, Batı rüzgarları, Cephesel yağışlar ve Dört mevsimin belirgin yaşanmasıdır. Fakat ''aynı anda'' Antalya''da denize girilirken Erzurum''da kayak yapılabilmesi yükselti ve yer şekilleri çeşitliliği ile ilgili olup kesinlikle ÖZEL KONUMUN bir sonucudur.',
  'ÖSYM ''yıl içinde dört mevsimin belirgin olması'' (matematiksel konum) ile ''aynı gün/anda farklı mevsim koşullarının yaşanması'' (özel konum) ifadelerini birbirine çeldirici olarak sürekli kullanır.'
);

-- Soru #003 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aynı enlem üzerinde bulunan Çanakkale, Bursa, Ankara, Sivas ve Erzurum illeri karşılaştırıldığında, batıdan doğuya doğru gidildikçe aşağıdakilerden hangisinin değişmesi beklenmez?',
  '{"options": ["Güneş''in ufukta ulaştığı maksimum yükselti açısı", "Karasallık derecesi ve yıllık sıcaklık farkı", "Tarım ürünlerinin olgunlaşma süresi", "Karların yerde kalma süresi", "Güneş''in doğuş ve batış yerel saati"], "correctIndex": 0}'::jsonb,
  'Aynı enlem üzerindeki tüm merkezlerde; Ekvator''a ve kutuplara uzaklık, çizgisel hız, yerçekimi, gece-gündüz süreleri ve Güneş ışınlarının geliş açısı YIL BOYUNCA BİREBİR AYNIDIR. Batıdan doğuya yükselti arttığı için sıcaklık, don günleri ve tarım süreleri değişirken Güneş ışınlarının geliş açısı değişmez.',
  'Adaylar Erzurum''un daha soğuk olmasından dolayı Güneş ışınlarını daha eğik açıyla aldığını varsayar. Oysa Güneş ışınlarının düşme açısı yükseltiye değil, sadece enleme ve mevsime bağlıdır.'
);

-- Soru #004 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Dünya''nın geoit şekline bağlı olarak Ekvator''dan kutuplara doğru gidildikçe yerçekimi artarken çizgisel hız azalır.

Buna göre Türkiye sınırları içerisinde yerçekiminin en fazla, çizgisel dönüş hızının ise en az olduğu merkez aşağıdakilerden hangisidir?',
  '{"options": ["Hatay — Yayladağı", "Sinop — İnceburun", "Iğdır — Dilucu", "Çanakkale — Avlaka Burnu", "Muğla — Datça"], "correctIndex": 1}'::jsonb,
  'Türkiye''nin en kuzey noktası Sinop İnceburun''dur (42° K). Kutuplara en yakın nokta olduğu için Dünya''nın merkezine daha yakındır ve yerçekimi en fazladır; aynı zamanda dönme eksenine yarıçapı daraldığı için çizgisel dönüş hızı en azdır.',
  'Adaylar yerçekimini çoğu zaman dağların yükseltisiyle (Erzurum/Ağrı) karıştırırlar. Coğrafyada yerçekiminin temel belirleyicisi enlem (Dünya''nın kutuplardan basık olması) derecesidir.'
);

-- Soru #005 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de yıl boyunca tek ulusal saat olarak 45° Doğu Meridyeni''nin (Iğdır) yerel saati kullanılmaktadır (+3 GMT).

Bu uygulamanın doğal bir sonucu olarak, kış mevsiminde aşağıdaki şehirlerin hangisinde yerel saat ile ulusal saat arasındaki fark en fazla olur ve sabah mesaiye başlarken havanın en karanlık olduğu hissedilir?',
  '{"options": ["Trabzon", "Gaziantep", "Sivas", "Edirne", "Van"], "correctIndex": 3}'::jsonb,
  'Ulusal saat 45° Doğu meridyenine göre ayarlandığında, 45° Doğu''dan en uzakta olan en batıdaki illerimizde yerel saat farkı en yüksek olur. Edirne (yaklaşık 26°30'' Doğu) ile Iğdır arasında yaklaşık 74 dakikalık zaman farkı oluşur ve kışın güneş çok geç doğduğu için karanlıkta güne başlanır.',
  'Adaylar ''yerel saat farkı en çok nerede hissedilir'' sorusunda Iğdır veya Van''ı işaretleme hatasına düşebilirler. Iğdır''da yerel saat zaten ulusal saatin ta kendisidir (fark sıfırdır).'
);

-- Soru #006 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin sahip olduğu jeopolitik güç unsurlarından biri de İstanbul ve Çanakkale boğazlarıdır. 1936 Montrö Boğazlar Sözleşmesi ile Boğazlar Komisyonu kaldırılarak tam egemenlik Türkiye''ye geçmiştir.

Boğazların jeopolitik önemini artıran temel coğrafi gerekçe aşağıdakilerden hangisidir?',
  '{"options": ["Karadeniz''e kıyısı olan ülkelerin açık denizlere ve dünya ticaretine tek çıkış kapısı olması", "Ege Denizi''ndeki kıta sahanlığı sorunlarını tamamen çözüme kavuşturması", "Boğazlar çevresinin Türkiye''nin en az nüfuslanmış alanı olması", "Akdeniz ile Kızıldeniz arasındaki Süveyş Kanalı bağlantısını doğrudan sağlaması", "Boğaz tabanında derin deniz petrol sondajlarının yoğun şekilde yapılması"], "correctIndex": 0}'::jsonb,
  'İstanbul ve Çanakkale boğazları, Karadeniz Havzası''ndaki ülkelerin (Rusya, Ukrayna, Romanya, Bulgaristan, Gürcistan) Akdeniz ve Cebelitarık/Süveyş üzerinden dünya okyanuslarına çıkabileceği tek doğal su yoludur. Bu durum Türkiye''ye stratejik bir kilit rol yükler.',
  'Adaylar Süveyş Kanalı ile Boğazlar arasında doğrudan coğrafi bir bağlantı kurabilirler; oysa Süveyş Akdeniz-Kızıldeniz arasındadır, Boğazlar ise Karadeniz-Marmara-Ege bağlantısını sağlar.'
);

-- Soru #007 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Kuzey Yarım Küre''de yer alan Türkiye''de dağların güney yamaçları bakı etkisi nedeniyle kuzey yamaçlara göre daha fazla ısınır, karlar daha erken erir ve yerleşmeler güney yamaçta yoğunlaşır.

Aşağıdaki durumlardan hangisi Türkiye''de bakı kuralına ters düşen bir istisnadır?',
  '{"options": ["Toros Dağları''nın Akdeniz''e bakan güney yamaçlarında tarım ürünlerinin erken olgunlaşması", "İç Anadolu''da konutların kapı ve pencerelerinin çoğunlukla güneye bakacak şekilde inşa edilmesi", "Kuzey Anadolu Dağları''nın Karadeniz''e bakan kuzey yamaçlarında kış sıcaklıklarının güney yamaçtan daha yüksek olması", "Güneydoğu Toroslar''ın güneyinde meraların daha erken yeşermesi", "Uludağ''ın güney yamacında orman üst sınırının kuzey yamaca göre daha yüksekte bulunması"], "correctIndex": 2}'::jsonb,
  'Karadeniz Dağları''nda güney yamaç bakı yönüdür ancak denizellik etkisi kuzey yamaçtadır. Kışın deniz geç soğuduğu ve nemli hava kütleleri kuzey yamaçta ılımanlaştırıcı etki yaptığı için, kuzey yamaçlar iç kısımdaki karasal ve donlu güney yamaçlardan daha ılıktır. Bu durum denizelliğin bakıyı alt ettiği klasik ÖSYM istisnasıdır.',
  'ÖSYM dağ yamaçları sorularında ''denizellik ile bakının çatıştığı'' Karadeniz kıyı kuşağını çeldirici olarak mutlaka sorar.'
);

-- Soru #008 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin komşularıyla olan sınır kapıları ve bu kapılardaki ulaşım altyapısı KPSS''de sıkça sorgulanmaktadır.

Aşağıdaki sınır kapılarından hangisi Türkiye ile komşu ülke arasında hem karayolu hem de aktif demiryolu bağlantısına sahiptir?',
  '{"options": ["Sarp Sınır Kapısı (Gürcistan)", "Gürbulak Sınır Kapısı (İran)", "Kapıkule Sınır Kapısı (Bulgaristan)", "Habur Sınır Kapısı (Irak)", "İpsala Sınır Kapısı (Yunanistan)"], "correctIndex": 2}'::jsonb,
  'Edirne''de bulunan Kapıkule Sınır Kapısı (Bulgaristan), Avrupa''ya açılan en işlek sınır kapımız olup hem karayolu hem de demiryolu hattına sahiptir. Sarp, İpsala ve Habur sınır kapılarında demiryolu bağlantısı bulunmaz.',
  'Adaylar İpsala (Yunanistan) sınır kapısını demiryolu zanneder; Yunanistan ile demiryolu kapımız ''Uzunköprü''dür. İran ile demiryolu kapımız ise Gürbulak değil ''Kapıköy''dür.'
);

-- Soru #009 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Haziran tarihinde Türkiye sınırları içinde bir araştırma gezisine çıkan coğrafyacı, gittiği merkezde gündüz süresinin hareket ettiği yere göre daha uzun olduğunu ve yerel saatin de daha ileri olduğunu gözlemlemiştir.

Bu araştırmacı hangi yöne doğru hareket etmiştir?',
  '{"options": ["Güneybatı", "Güneydoğu", "Kuzeydoğu", "Kuzeybatı", "Güney"], "correctIndex": 2}'::jsonb,
  '21 Haziran''da Kuzey Yarım Küre''de kuzeye gidildikçe gündüz süresi uzar (Sinop''ta en uzun). Yerel saatin daha ileri olması için ise doğuya gidilmesi gerekir. Dolayısıyla araştırmacı hem kuzeye hem doğuya, yani ''Kuzeydoğu'' yönüne hareket etmiştir.',
  '21 Aralık tarihiyle karıştırma tuzağı: 21 Aralık''ta güneye gidildikçe gündüz uzar; 21 Haziran''da ise tam tersine kuzeye gidildikçe gündüz uzar.'
);

-- Soru #010 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye, Hazar Havzası ve Orta Doğu''nun zengin enerji kaynakları ile Avrupa''nın yoğun enerji tüketen pazarları arasında bir ''Enerji Koridoru'' köprüsüdür.

Aşağıdaki boru hatlarından hangisi Azerbaycan doğalgazını Türkiye üzerinden Yunanistan sınırına ve oradan Avrupa''ya taşıyan Güney Gaz Koridoru''nun omurgasını oluşturur?',
  '{"options": ["Mavi Akım", "TürkAkım", "Bakü-Tiflis-Ceyhan (BTC)", "Trans Anadolu Doğal Gaz Boru Hattı (TANAP)", "Kerkük-Yumurtalık"], "correctIndex": 3}'::jsonb,
  'TANAP (Trans Anadolu Doğal Gaz Boru Hattı), Azerbaycan Şah Deniz sahasından çıkarılan doğalgazı Gürcistan üzerinden Türkiye''ye (Eskişehir ve Trakya çıkışları) ve oradan TAP (Trans Adriyatik) hattıyla Avrupa''ya taşıyan dev boru hattıdır. BTC ise doğalgaz değil petrol boru hattıdır.',
  'ÖSYM BTC (petrol) ile TANAP (doğalgaz) ayrımını sıkça sorar. BTC ham petrol taşır, TANAP ise doğalgaz taşır.'
);

-- Soru #011 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin kara sınırları ve komşuları ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["En uzun kara sınırımız Suriye iledir.", "En kısa kara sınırımız Nahçıvan (Azerbaycan) iledir.", "En eski kara sınırımız Kasr-ı Şirin Antlaşması''na dayanan İran sınırıdır.", "Demiryolu bağlantımızın bulunduğu en yeni sınır kapısı Gürcistan ile açılan Aktaş Kapısı''dır.", "Ermenistan sınırında bulunan Alican ve Akyaka sınır kapıları siyasi gerekçelerle fiilen kapalıdır."], "correctIndex": 3}'::jsonb,
  'Gürcistan ile demiryolu bağlantısı Bakü-Tiflis-Kars (BTK) hattı üzerinden ''Canbaz'' sınır kapısından sağlanmaktadır. Aktaş Sınır Kapısı yalnızca karayolu taşımacılığına açıktır.',
  'Adaylar Gürcistan ile yeni açılan Aktaş sınır kapısının demiryolu kapısı olduğunu düşünebilir; demiryolu istasyonu Canbaz İstasyonu''dur.'
);

-- Soru #012 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye 36°-42° Kuzey paralelleri arasında yer aldığı için Dönenceler''in (23°27'') kuzeyinde bulunur.

Bu durumun Türkiye''de ortaya çıkardığı kesin sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Cisimlerin gölge boyunun hiçbir zaman sıfır olmaması ve gölgenin daima kuzeye düşmesi", "Yıl boyunca sıcaklıkların sıfırın altına hiç düşmemesi", "Sadece kış aylarında yağış alması", "Yerel saatin daima Greenwich''ten geride olması", "Güneş''in batıdan doğup doğudan batması"], "correctIndex": 0}'::jsonb,
  'Dönenceler dışındaki alanlara güneş ışınları hiçbir zaman 90° dik açıyla düşemez. Bu yüzden Türkiye''de gölge boyu hiçbir tarihte sıfır olamaz ve öğle vaktinde cisimlerin gölgesi daima kuzeye düşer.',
  'Adaylar 21 Haziran''da Türkiye''ye güneşin dik geldiğini sanabilir; güneş sadece dönenceler arasına dik düşer, Türkiye''ye en dik açıyla gelse bile (yaklaşık 77°) gölge asla sıfır olmaz.'
);

-- Soru #013 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Akdeniz''den Karadeniz''e doğru gidildikçe deniz suyu sıcaklığı ve tuzluluk oranı düzenli olarak azalır (Akdeniz binde 38, Karadeniz binde 18).

Bu durum üzerinde etkili olan temel faktör aşağıdakilerden hangisidir?',
  '{"options": ["Kıyılardaki sanayi tesislerinin yoğunluğu", "Enlem etkisi ve buharlaşma şiddetinin kuzeye doğru azalması", "Karadeniz''deki dalga aşındırmasının daha fazla olması", "Akdeniz''e dökülen akarsu sayısının Karadeniz''den çok daha fazla olması", "Marmara Denizi''nin derin su akıntılarını engellemesi"], "correctIndex": 1}'::jsonb,
  'Ekvator''dan kutuplara doğru gidildikçe enleme bağlı olarak güneş ışınlarının açısı küçülür, sıcaklık ve buharlaşma azalır. Akdeniz çok sıcak ve buharlaşma yüksek olduğu için en tuzlu denizimizdir; Karadeniz ise serin hava ve bol tatlı su girdisi yüzünden az tuzludur.',
  'Adaylar deniz tuzluluğunu akarsu sayısıyla ilişkilendirebilir; oysa Karadeniz''e dökülen dev nehirler (Tuna, Dinyeper, Kızılırmak) tuzu seyreltir ama ana motor güç enlem ve buharlaşmadır.'
);

-- Soru #014 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Doğu Anadolu Bölgesi''ni Karadeniz limanlarına bağlayan dağlık geçitlerde son yıllarda yapılan modern tüneller transit ticareti ve kış ulaşımını güvenceye almıştır.

Rize''yi Erzurum''a bağlayan ve Türkiye''nin en uzun karayolu çift tüp tünellerinden biri olan tünel aşağıdakilerden hangisidir?',
  '{"options": ["Zigana Tüneli", "Ovit Tüneli", "Ilgaz 15 Temmuz İstiklal Tüneli", "Avrasya Tüneli", "Sabuncubeli Tüneli"], "correctIndex": 1}'::jsonb,
  'Rize (İkizdere) ile Erzurum (İspir) arasındaki Ovit Dağı Geçidi''ni baypas eden ''Ovit Tüneli'' (14.3 km), kış aylarında kar nedeniyle aylarca kapanan yolu kesintisiz ulaşıma açmıştır. Yeni Zigana Tüneli ise Trabzon ile Gümüşhane arasındadır.',
  'ÖSYM Zigana (Trabzon-Gümüşhane) ile Ovit (Rize-Erzurum) tünellerini birbirine alternatif çeldirici olarak kullanır.'
);

-- Soru #015 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de bazı dar vadilerde ve çukur havzalarda çevresindeki geniş iklim kuşağından farklı, dar alanlı iklim adacıkları (mikroklima) oluşmuştur.

Aşağıdakilerden hangisi Türkiye''de görülen bir mikroklima alanı ve bu alanda yetiştirilen tarım ürünü eşleştirmesi değildir?',
  '{"options": ["Rize kıyıları — Turunçgil (Mandalina)", "Iğdır Ovası — Pamuk", "Artvin / Çoruh Vadisi — Zeytin", "Gazipaşa / Anamur kıyıları — Muz", "Konya Ovası — Şeker pancarı"], "correctIndex": 4}'::jsonb,
  'Konya Ovası''nda şeker pancarı yetiştirilmesi bir mikroklima ürünü değildir; karasal iklim ve sulama ile geniş alanda yapılan tipik bir tarımsal faaliyettir. Rize''de turunçgil, Iğdır''da pamuk, Çoruh Vadisi''nde zeytin ve Anamur''da muz mikroklimanın en belirgin KPSS örnekleridir.',
  'Adaylar şeker pancarını yaygın bir ürün olduğu için mikroklima kavramıyla karıştırmaz ama sorularda diğer 4 klasik mikroklimayı ezbere bilmek şarttır.'
);

-- Soru #016 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Aralık tarihinde Türkiye''de en uzun gece Sinop''ta yaşanırken, en uzun gündüz ise Hatay''da yaşanır.

Bu durumun ortaya çıkmasındaki temel etken aşağıdakilerden hangisidir?',
  '{"options": ["Eksen eğikliği ve Dünya''nın Güneş etrafındaki yıllık hareketi", "Dünya''nın kendi ekseni etrafında batıdan doğuya dönmesi", "Türkiye''nin Asya ile Avrupa arasında yer alması", "Türkiye''nin ortalama yükseltisinin batıdan doğuya artması", "Karasallık ve denizellik farkları"], "correctIndex": 0}'::jsonb,
  '21 Aralık''ta Güneş ışınları Oğlak Dönencesi''ne dik gelir. Güney Yarım Küre''de yaz, Kuzey Yarım Küre''de kış başlar. Kuzeye gidildikçe geceler uzar (Sinop''ta en uzun gece), güneye gidildikçe gündüzler uzar. Gece-gündüz sürelerinin yıl içinde değişmesi Eksen Eğikliği ve Yıllık Hareket''in sonucudur.',
  'Günlük hareket (kendi ekseni etrafında dönme) gece ile gündüzün ''ardalanmasını'' sağlar; gece-gündüz sürelerinin ''farklılaşmasını ve değişmesini'' ise yıllık hareket/eksen eğikliği sağlar.'
);

-- Soru #017 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin doğusu ile batısı arasında 19 meridyen fark (26°-45° Doğu) ve 76 dakikalık zaman farkı bulunur.

Aşağıdakilerden hangisi meridyenlerin kutuplara doğru birbirine yaklaşmasının Türkiye üzerindeki bir sonucudur?',
  '{"options": ["Türkiye''de meridyenler arasındaki mesafenin Ekvator''daki 111 km''den daha az (yaklaşık 85-86 km) olması", "Türkiye''de doğuda güneşin batıdan önce doğması", "İki meridyen arasındaki zaman farkının 4 dakikadan az olması", "Türkiye''nin Greenwich''in doğusunda kalması", "Yerel saatin her yerde aynı olması"], "correctIndex": 0}'::jsonb,
  'Meridyenler Ekvator''da 111 km aralıklıyken kutuplara doğru daralır. Türkiye 36°-42° paralellerinde bulunduğu için iki meridyen arası mesafe yaklaşık 85-86 km''ye düşmüştür. Ancak iki meridyen arasındaki zaman farkı çizgisel hız azaldığı için DAİMA 4 DAKİKA kalır.',
  'Büyük çeldirici: Meridyenler daralınca iki meridyen arasındaki 4 dakikalık zaman farkının da kısaldığı sanılır. Zaman farkı asla değişmez, daima 4 dakikadır!'
);

-- Soru #018 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin kıyı uzunlukları incelendiğinde en uzun kıyı şeridine sahip bölgemiz Ege Bölgesi''dir.

Ege kıyılarının Karadeniz ve Akdeniz kıyılarından daha uzun olmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Dağların kıyıya dik uzanması sonucu oluşan çok sayıda koy, körfez, burun ve yarımada girintisi", "Ege Denizi''nin diğer denizlerden daha derin olması", "Ege kıyılarında rüzgar erozyonunun şiddetli olması", "Gelgit genliğinin çok yüksek olması", "Kıyıda lagün göllerinin hiç bulunmaması"], "correctIndex": 0}'::jsonb,
  'Ege Bölgesi''nde dağlar (horstlar) denize dik uzandığı için enine kıyı tipi görülür. Deniz iç kısımlara kadar sokulur, binlerce koy, körfez ve burun meydana gelir. Kuş uçuşu mesafe kısa olsa da gerçek kıyı uzunluğu Türkiye''nin en uzunu haline gelir.',
  'Adaylar yüzölçümü ve kıyı uzunluğunu karıştırıp Karadeniz veya Akdeniz''in kıyısını daha uzun sanabilirler; girinti-çıkıntı fazlalığı nedeniyle en uzun kıyı Ege''dedir.'
);

-- Soru #019 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aşağıdaki sınır kapısı ve eşleştiği komşu ülke ikililerinden hangisi yanlıştır?',
  '{"options": ["Dilucu Sınır Kapısı — Nahçıvan (Azerbaycan)", "Çobanbey Sınır Kapısı — Suriye", "Türkgözü Sınır Kapısı — Gürcistan", "Esendere Sınır Kapısı — Irak", "Dereköy (Aziziye) Sınır Kapısı — Bulgaristan"], "correctIndex": 3}'::jsonb,
  'Esendere Sınır Kapısı Hakkari''dedir ve İRAN sınırımızdadır. Irak sınırımızdaki ana sınır kapısı Şırnak''taki ''Habur'' ve Hakkari''deki ''Üzümlü'' sınır kapılarıdır.',
  'Esendere Hakkari''de olduğu için adaylar otomatikman Irak ile eşleştirir; oysa Esendere İran sınır kapısıdır.'
);

-- Soru #020 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
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
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de dağların uzanış doğrultusu (genellikle doğu-batı yönlü olması) ulaşım, iklim ve bitki örtüsü dağılışını doğrudan etkilemiştir.

Bu uzanış doğrultusunun doğal bir sonucu olarak aşağıdakilerden hangisi gerçekleşmiştir?',
  '{"options": ["Kuzey ve güney kıyılarımızda iç kesimlerle ulaşımın ancak geçit ve tünellerle sağlanabilmesi", "İç kesimlerde denizel iklimin geniş alanlara yayılması", "Ege kıyılarında liman hinterlantlarının çok dar kalması", "Karadeniz kıyılarında enine kıyı tipinin yaygın olması", "Akdeniz''de falezlerin (yalıyarların) hiç görülmemesi"], "correctIndex": 0}'::jsonb,
  'Karadeniz ve Akdeniz''de dağlar kıyıya paralel uzandığı için iç kesimlerle ulaşım zorlaşmış, geçitler (Kop, Zigana, Çubuk, Gülek vb.) zorunlu hale gelmiştir. Ege''de ise dağlar dik olduğu için iç kesimlere ulaşım son derece kolaydır.',
  'Adaylar dağların uzanışını Karadeniz/Akdeniz ile Ege arasında ters eşleştirebilir; Karadeniz ve Akdeniz''de paralel (boyuna kıyı), Ege''de diktir (enine kıyı).'
);

-- Soru #021 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Ege Bölgesi''nde kırılma (faylanma) hareketleri sonucu sert tabakalar kırılarak yükselen kısımlar horstları, çöken kısımlar ise graben ovalarını oluşturmuştur.

Aşağıdakilerden hangisi Ege Bölgesi''ndeki bu horst-graben sistemine ait bir horst (kırık dağı) değildir?',
  '{"options": ["Yunt Dağı", "Bozdağlar", "Madra Dağı", "Menteşe Dağları", "Canik Dağları"], "correctIndex": 4}'::jsonb,
  'Canik Dağları Orta Karadeniz''de (Samsun gerisinde) yer alan kıvrım dağlarıdır. Kaz, Madra, Yunt, Bozdağlar, Aydın ve Menteşe dağları ise Ege''deki kırık (horst) sistemleridir.',
  'Ege''deki dağlar ''KAZMA YUNTMIŞ BOZ AYI MELEDİ'' şifresiyle hatırlanır (Kaz, Madra, Yunt, Bozdağlar, Aydın, Menteşe). Canik ise Karadeniz kıvrım dağıdır.'
);

-- Soru #022 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de karstik aşınım şekillerinin (lapya, dolin, uvala, polye) ve karstik birikim şekillerinin (traverten, sarkıt, dikit) en yaygın olduğu coğrafi alan aşağıdakilerden hangisidir?',
  '{"options": ["Teke ve Taşeli Platoları (Batı ve Orta Toroslar)", "Ergene Havzası", "Güneydoğu Anadolu Platoları", "Doğu Karadeniz Kıyı Şeridi", "Erzurum-Kars Platosu"], "correctIndex": 0}'::jsonb,
  'Kalker (kireçtaşı) arazinin en yoğun olduğu yer Toros Dağları kuşağı, özellikle Teke ve Taşeli platolarıdır. Suda kolay çözünen bu kayaçlar üzerinde devasa polyeler (Elmalı, Kestel, Acıpayam, Muğla) ve mağaralar gelişmiştir.',
  'Adaylar karstik arazinin yalnızca Pamukkale''de olduğunu düşünebilir; jeomorfolojik plato ölçeğinde en belirgin saha Teke ve Taşeli''dir.'
);

-- Soru #023 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Kıyı tipleri bakımından Türkiye''de kıyılar ve jeolojik yapılar büyük çeşitlilik gösterir. Ancak bazı kıyı tipleri Türkiye''de mutlak (matematiksel) ya da göreceli konum koşulları nedeniyle kesinlikle görülmez.

Aşağıdaki kıyı tiplerinden hangisinin Türkiye''de görülmemesi MATEMATİKSEL KONUMUN (Enlem) bir sonucudur?',
  '{"options": ["Haliç tipi kıyılar", "Fiyort ve Skyer tipi kıyılar", "Dalmaçya tipi kıyılar", "Ria tipi kıyılar", "Kalanklı kıyılar"], "correctIndex": 1}'::jsonb,
  'Fiyort ve Skyer tipi kıyılar buzul aşındırması sonucu oluşur ve deniz seviyesine kadar inen buzullar yalnızca kutup ve kutup altı enlemlerde (İskandinavya vb.) görülür. Türkiye Orta Kuşak''ta yer aldığı için kıyılarında buzul etkisi hiç görülmemiştir (Matematiksel konum). Haliç ve vat tipi kıyıların görülmemesi ise okyanusa kıyımız olmaması ve gelgitin azlığıdır (Özel konum).',
  'ÖSYM''nin en meşhur tuzağı: Haliç''in görülmemesi ÖZEL KONUM (okyanusa kıyısı olmama/gelgit azlığı), Fiyort''un görülmemesi ise MATEMATİKSEL KONUMDUR (enlem/sıcaklık).'
);

-- Soru #024 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Akarsuların taşıdığı alüvyonları denize döküldükleri yerde biriktirmesiyle delta ovaları oluşur. Bir kıyıda delta ovası oluşabilmesi için kıyının sığ olması, akarsuyun bol alüvyon taşıması, kıyıda güçlü akıntı ve gelgit olmaması gerekir.

Aşağıdaki akarsu ve oluşturduğu delta ovası eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Kızılırmak — Bafra Deltası", "Yeşilırmak — Çarşamba Deltası", "Seyhan ve Ceyhan — Çukurova", "Göksu — Silifke Deltası", "Gediz — Balat Deltası"], "correctIndex": 4}'::jsonb,
  'Gediz Nehri Menemen Deltası''nı oluşturur. Balat Deltası''nı oluşturan akarsu ise Büyük Menderes''tir. Küçük Menderes Selçuk Deltası''nı, Bakırçay ise Dikili Deltası''nı oluşturur.',
  'Ege deltaları sıkça karıştırılır: Bakırçay-Dikili, Gediz-Menemen, Küçük Menderes-Selçuk, Büyük Menderes-Balat.'
);

-- Soru #025 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Oluşumlarına göre göller incelendiğinde; lav set gölleri özellikle Doğu Anadolu''da volkanizmanın akarsu vadilerini tıkaması sonucu yaygınlaşmıştır.

Aşağıdaki göllerden hangisi bir volkanik set gölü örneği değildir?',
  '{"options": ["Nazik Gölü", "Balık Gölü", "Çıldır Gölü", "Haçlı Gölü", "Eğirdir Gölü"], "correctIndex": 4}'::jsonb,
  'Eğirdir Gölü, Isparta sınırlarında yer alan bir TEKTONİK-KARSTİK göldür. Van Gölü çevresindeki Nazik, Balık, Çıldır, Haçlı ve Erçek gölleri ise volkanik set gölleridir.',
  'Eğirdir ve Beyşehir Göller Yöresi''nin tipik tektonik-karstik gölleridir; tatlı su gölü olup gideğenleri (kovada ve çarşamba kanalları) vardır.'
);

-- Soru #026 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de etkili olan yerel rüzgarlar sıcaklık ve yağış koşullarını doğrudan etkiler. Dağ yamacını aşarak diğer tarafa alçalan havanın her 100 metrede 1°C ısınmasıyla ''Föhn rüzgarları'' oluşur.

Türkiye''de kış ve ilkbahar aylarında Föhn rüzgarlarının etkili olduğu bir yörede aşağıdakilerden hangisinin gerçekleşmesi beklenmez?',
  '{"options": ["Havanın nem açığının ve buharlaşmanın artması", "Karların aniden eriyerek çığ ve heyelan riskini artırması", "Tarım ürünlerinin vaktinden önce olgunlaşması veya kuruması", "Havanın bağıl neminin yükselerek şiddetli sağanak yağışların başlaması", "Sıcaklığın kısa sürede birkaç derece birden yükselmesi"], "correctIndex": 3}'::jsonb,
  'Föhn rüzgarı alçaldıkça ısınan, kurutucu bir rüzgardır. Isınan havanın nem taşıma kapasitesi (maksimum nem) artar; bu yüzden bağıl nem düşer ve yağış ihtimali tamamen ORTADAN KALKAR. Yağış değil, kuruluk ve sıcaklık getirir.',
  'Adaylar ''Föhn rüzgarı dağdan esiyor, o halde yamaç yağışı bırakır'' yanılgısına düşerler. Föhn rüzgarı dağın arkasına ''inen'' rüzgardır, yağış bırakmaz; yağışı bırakan dağa ''tırmanan'' rüzgardır.'
);

-- Soru #027 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Toprak oluşumunda ana kayanın kimyasal bileşimi, iklim ve bitki örtüsü belirleyicidir. Kalsimorfik topraklar grubunda yer alan ve killi kireçli kireç taşları üzerinde oluşan, kurak dönemde çatlayarak içine dökülen taşları yağışlı dönemde yüzeye fırlattığı için halk arasında ''dönen toprak'' ya da ''taş doğuran'' olarak adlandırılan toprak tipi hangisidir?',
  '{"options": ["Terra Rossa", "Vertisol", "Rendzina", "Podzol", "Çernezyom"], "correctIndex": 1}'::jsonb,
  'Vertisol topraklar (kepir veya taş doğuran topraklar), killi yapısından dolayı kurak mevsimde derin çatlaklar oluşturur. Trakya''da Ergene Havzası''nda, Güney Marmara''da ve Muş Ovası''nda yaygındır ve ayçiçeği ile buğday tarımına çok elverişlidir.',
  'Rendzina ile Vertisol karıştırılır: Rendzina yumuşak kireçtaşları üzerinde oluşur; çatlayıp taş fırlatan ''dönen toprak'' ise Vertisol''dür.'
);

-- Soru #028 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Erzurum-Kars ve Ardahan platolarında dünyanın en verimli yerli (zonal) toprağı kabul edilen Çernezyom (kara toprak) geniş yer kaplar.

Bu platolarda toprağın son derece zengin humus ve mineral içermesine rağmen tarımsal verimin ve ürün çeşitliliğinin çok düşük kalmasının temel nedeni nedir?',
  '{"options": ["Toprağın aşırı derecede tuzlu ve çorak olması", "Yaz mevsiminin çok kısa, serin geçmesi ve don olaylarının erken başlaması", "Toprağın aşırı kireçli olması", "Sulama imkanlarının hiç bulunmaması", "Taban suyunun çok derinde olması"], "correctIndex": 1}'::jsonb,
  'Çernezyom zengin çayır örtüsü altında gelişen muazzam verimli bir topraktır. Ancak Erzurum-Kars''ta sert karasal iklim egemendir; kışlar 6-7 ay sürer, donlu gün sayısı çok fazladır ve yaz çok kısa sürer. İklim koşulları elvermediği için tarım yapılamaz, alan büyükbaş mera hayvancılığına ayrılır.',
  'ÖSYM ''Toprak verimli ise tarım neden gelişmemiştir?'' tezadını sormayı çok sever. Cevap toprağın yapısı değil, tamamen iklim yetersizliğidir.'
);

-- Soru #029 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Karadeniz Bölgesi''nde Doğu Karadeniz (Rize-Trabzon) ile Orta Karadeniz (Samsun) bölümleri karşılaştırıldığında; Orta Karadeniz''de yağış miktarının daha az olması, denizel etkinin iç kısımlara daha kolay girmesi ve delta ovalarının daha geniş yer kaplamasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Orta Karadeniz''de Canik Dağları''nın yükseltisinin daha az olması ve kıyının daha gerisinde uzanması", "Doğu Karadeniz''in Ekvator''a daha yakın olması", "Orta Karadeniz''de orman varlığının hiç bulunmaması", "Samsun''da buharlaşmanın Rize''den daha fazla olması", "Yeşilırmak''ın debisinin Çoruh''tan yüksek olması"], "correctIndex": 0}'::jsonb,
  'Doğu Karadeniz''de Kaçkar Dağları 4000 metreye yaklaşır ve hemen kıyıdan dimdik yükselir (falez çok, yağış 2400 mm, delta yok). Orta Karadeniz''de ise Canik Dağları alçaktır (1500 m) ve kıyının çok gerisindedir; bu sayede nemli hava içeri girer, yağış 700 mm''ye düşer ve devasa Bafra-Çarşamba deltaları oluşur.',
  'ÖSYM Canik Dağları''nın alçak ve geride olmasının sonuçlarını coğrafyada adeta bir klasik kural olarak sık sık sorar.'
);

-- Soru #030 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de akarsuların genel özellikleri göz önüne alındığında aşağıdakilerden hangisi doğru bir genelleme değildir?',
  '{"options": ["Genç olusumlu bir ülke olduğumuz için akarsuların akış hızları ve enerji potansiyelleri yüksektir.", "Akarsularımızın boyları yarımada olmamız ve dağların uzanışı nedeniyle genellikle kısadır.", "Rejimleri genellikle düzensizdir (Karadeniz akarsuları hariç).", "Denge profiline ulaşmadıkları için üzerlerinde taşımacılık ve ulaşım yapılamaz.", "Akarsularımızın tamamı açık havzalıdır ve sularını mutlaka denizlere ulaştırırlar."], "correctIndex": 4}'::jsonb,
  'Türkiye''deki akarsuların tamamı açık havzalı değildir. İç Anadolu''da Tuz Gölü Havzası ve Konya Kapalı Havzası, Doğu Anadolu''da Van Gölü Kapalı Havzası ve Hazar Denizi''ne dökülen Aras ile Kura nehirleri birer KAPALI HAVZA örneğidir.',
  'Aras ve Kura nehirleri Hazar Denizi''ne dökülür; Hazar göl statüsünde olduğu için Aras ve Kura açık havza değil kapalı havza akarsularıdır.'
);

-- Soru #031 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de görülen iklim tiplerinin en fazla yağış aldıkları mevsimler sınavda grafik ve eşleştirme olarak sıkça sorulur.

Aşağıdaki iklim tipi ve en çok yağış aldığı mevsim eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Karadeniz İklimi — Sonbahar", "Akdeniz İklimi — Kış", "İç Anadolu Karasal İklimi (Step) — İlkbahar", "Erzurum-Kars Sert Karasal İklimi — Yaz", "Güneydoğu Anadolu Karasal İklimi — Yaz"], "correctIndex": 4}'::jsonb,
  'Güneydoğu Anadolu Bölgesi yaz aylarında son derece kurak ve sıcaktır; yağışlarının neredeyse tamamını kış ve ilkbahar aylarında alır. Yaz yağışları Türkiye''de yalnızca Doğu Anadolu''nun yüksek platolarında (Erzurum-Kars-Ardahan) ve Doğu Karadeniz yaylalarında görülür.',
  'Adaylar Güneydoğu''nun karasal olduğunu düşünüp Erzurum-Kars gibi yazın yağış aldığını sanabilir. Oysa Güneydoğu yazın Türkiye''nin en kurak yeridir (buharlaşma tavan yapar).'
);

-- Soru #032 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de ilkbahar aylarında ısınan havanın yükselerek soğuması sonucu öğleden sonraları aniden başlayan gök gürültülü sağanak yağışlara halk arasında ''Kırkikindi Yağışları'' denir.

Bu yağışların klimatik kökeni aşağıdakilerden hangisidir?',
  '{"options": ["Orografik (Yamaç) Yağışları", "Cephesel (Frontal) Yağışlar", "Konveksiyonel (Yükselim) Yağışları", "Dinamik Siklon Yağışları", "Muson Yağışları"], "correctIndex": 2}'::jsonb,
  'Isınan havanın dikey doğrultuda kendiliğinden yükselmesiyle oluşan yağışlara Konveksiyonel (Yükselim) yağışlar denir. İç Anadolu''da ilkbaharda, Erzurum-Kars''ta ise yaz aylarında görülür.',
  'Yamaç yağışları bir dağ sırasına çarpan havayla oluşur (Karadeniz); Cephesel yağışlar sıcak ve soğuk havanın karşılaşmasıyla oluşur (Akdeniz); Kırkikindi ise termik yükselmedir (Konveksiyonel).'
);

-- Soru #033 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de heyelan (kütle hareketleri) olaylarının yaklaşık %65''i ilkbahar mevsiminde ve özellikle Doğu Karadeniz Bölümü''nde gerçekleşmektedir.

Heyelanların ilkbahar aylarında zirve yapmasında etkili olan temel doğa olayı aşağıdakilerden hangisidir?',
  '{"options": ["Bitki örtüsünün yaprak dökmesi", "İlkbaharda karların hızla erimesi ve toprağın suya aşırı doygun hale gelmesi", "Föhn rüzgarlarının kışın toprağı dondurması", "Deniz seviyesinin ilkbaharda aniden yükselmesi", "Tarımda aşırı gübre kullanımı"], "correctIndex": 1}'::jsonb,
  'Heyelanın Doğu Karadeniz''de yoğunlaşmasının sebepleri: Eğim fazlalığı, killi tabaka ve bol yağıştır. İlkbaharda ise bu faktörlere ''hızlı kar erimeleri'' eklenir; toprak suya doyar, ağırlaşır ve killi kaygan zemin üzerinde aşağıya doğru kayar.',
  'Adaylar Karadeniz en çok yağışı sonbaharda aldığı için heyelanın da sonbaharda en çok olacağını sanırlar; oysa karlar ilkbaharda eridiği için heyelan rekoru İLKBAHARDADIR.'
);

-- Soru #034 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Platolar akarsular tarafından derin vadilerle yarılmış geniş düzlüklerdir. Oluşum kökenlerine göre platolar farklı gruplara ayrılır.

Aşağıdaki plato ve oluşum kökeni eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Teke ve Taşeli — Karstik plato", "Erzurum-Kars — Volkanik (Lav örtüsü) plato", "Çatalca-Kocaeli — Aşınım (Peneplen) platosu", "Haymana ve Cihanbeyli — Tabaka düzlüğü (Yatay duruşlu) plato", "Yazılıkaya (Bayat) — Karstik plato"], "correctIndex": 4}'::jsonb,
  'Yazılıkaya Platosu (Ege-İç Anadolu sınırı), yatay duruşlu (tabaka düzlüğü) bir platodur. Türkiye''de karstik platolar Akdeniz''deki Teke ve Taşeli platolarıdır.',
  'Çatalca-Kocaeli platosu aşınarak deniz seviyesine kadar inmiş Türkiye''nin en alçak aşınım platosudur ve en gelişmiş sanayi/nüfus merkezidir.'
);

-- Soru #035 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de rüzgar erozyonunun ve rüzgar aşındırma/biriktirme şekillerinin (mantarkaya, kumul vb.) en etkili olduğu yer İç Anadolu''da Konya Karapınar çevresidir.

Bu yörede rüzgar erozyonunun bu denli şiddetli olmasının başlıca nedeni nedir?',
  '{"options": ["Bitki örtüsünün yok denecek kadar cılız olması, kuraklık ve arazinin düz/açık olması", "Bölgede sert kasırgaların ve tayfunların görülmesi", "Toprağın aşırı killi ve nemli olması", "Akarsu ağının çok sık olması", "Platoların ortalama yükseltisinin 3000 metreyi aşması"], "correctIndex": 0}'::jsonb,
  'Rüzgar erozyonu kurak, yarı kurak, bitki örtüsünün tahrip edildiği ve gevşek yapılı kumlu-tozlu arazilerde etkili olur. Karapınar Türkiye''nin en az yağış alan, düz ve bitkisiz sahalarından biri olduğu için rüzgar süpürmesi maksimumdur.',
  'Rüzgarın aşındırma yapabilmesi için rüzgarın çok hızlı esmesi tek başına yetmez; toprağın korumasız ve bitkisiz olması şarttır.'
);

-- Soru #036 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye akarsularının havzaları incelendiğinde; kaynağını Türkiye sınırları içerisinden alıp komşu ülkeler üzerinden açık denizlere dökülen akarsular bulunmaktadır.

Aşağıdaki akarsulardan hangisi Türkiye''den doğup başka bir ülkenin topraklarından denize dökülen nehirlerden biri değildir?',
  '{"options": ["Fırat", "Dicle", "Çoruh", "Aras", "Asi"], "correctIndex": 4}'::jsonb,
  'Asi Nehri kaynağını Lübnan''dan alır, Suriye''den geçer ve Hatay''dan Akdeniz''e dökülür (Dışarıdan doğup Türkiye''ye dökülür). Fırat ve Dicle ise Türkiye''den doğup Basra Körfezi''ne dökülür; Çoruh Türkiye''den doğup Gürcistan''dan Karadeniz''e dökülür.',
  'ÖSYM ''Türkiye''de doğup dışarı dökülenler'' (Fırat, Dicle, Çoruh, Aras, Kura) ile ''Dışarıda doğup Türkiye''ye dökülenler'' (Meriç, Asi) ayrımını sık sık test eder.'
);

-- Soru #037 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Görünür nem açığı ve bağıl nem coğrafyada yağış olasılığını belirler. Havanın nem taşıma kapasitesi (maksimum nem) yalnızca sıcaklığa bağlıyken; bağıl nem havadaki mutlak nemin maksimum neme oranıdır.

Buna göre Türkiye''de yaz mevsiminde ''maksimum nemin'' en yüksek olduğu bölge ile yıl boyunca ''bağıl nemin'' en yüksek olduğu bölge sırasıyla hangileridir?',
  '{"options": ["Güneydoğu Anadolu — Doğu Karadeniz", "Akdeniz — İç Anadolu", "Doğu Karadeniz — Güneydoğu Anadolu", "Ege — Marmara", "Doğu Anadolu — Akdeniz"], "correctIndex": 0}'::jsonb,
  'Maksimum nem havayı ısıttıkça büyür; yazın Türkiye''nin en sıcak yeri Güneydoğu Anadolu olduğu için maksimum nem burada zirvedir. Bağıl nem ise yağış ihtimalidir; yıl boyunca nemli ve yağışlı olan Doğu Karadeniz''de bağıl nem en yüksektir.',
  'Adaylar ''Karadeniz nemli, o zaman maksimum nem Karadeniz''dedir'' yanılgısına düşerler. Maksimum nem sıcaklıkla doğru orantılıdır, havadaki gerçek su buharı değil havanın ''kapasitesidir''.'
);

-- Soru #038 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de peri bacalarının (Kapadokya Yöresi) oluşumunda jeolojik ve jeomorfolojik birçok faktör birlikte rol oynamıştır.

Peri bacalarının oluşumunda doğrudan etkili olan volkanik materyal ile aşındırmayı başlatan temel dış kuvvet hangisinde doğru verilmiştir?',
  '{"options": ["Volkanik tüf ve bazalt — Akarsu ve sel suları", "Kalker ve jips — Rüzgarlar", "Granit blokları — Buzullar", "Kil ve marn — Dalgalar", "Kuvarsit — Yer altı suları"], "correctIndex": 0}'::jsonb,
  'Peri bacaları volkanlardan püsküren tüf tabakalarının üzerini örten sert bazalt lavlarının akarsu ve sel suları tarafından aşındırılmasıyla oluşur. Temel dış kuvvet akarsudur, rüzgar ise sadece şekillendirici dolaylı kuvvettir.',
  'En popüler ÖSYM tuzağı: Peri bacalarını yapan temel kuvvet rüzgar zannedilir! Birincil ve asıl kuvvet AKARSU/SEL SULARIDIR; rüzgar ikinci plandadır.'
);

-- Soru #039 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de kış mevsiminde Sibirya Termik Yüksek Basıncı etkili olduğunda ülke genelinde dondurucu kuru soğuklar, ayaz ve kar yağışları yaşanır.

Buna karşılık kış mevsiminde Türkiye''de havanın ılıklaşmasına, deniz üzerinden bol nem getirerek güney ve batı kıyılarımızda şiddetli cephesel fırtınalara ve yağışlara neden olan dinamik alçak basınç merkezi hangisidir?',
  '{"options": ["İzlanda Dinamik Alçak Basıncı", "Basra Termik Alçak Basıncı", "Asor Dinamik Yüksek Basıncı", "Muson Alçak Basıncı", "Kutup Yüksek Basıncı"], "correctIndex": 0}'::jsonb,
  'İzlanda Dinamik Alçak Basıncı kışın Türkiye''ye Balkanlar üzerinden sokulduğunda havanın ılık ve bol yağışlı geçmesini sağlar. Asor yüksek basıncı ise yazın kuraklık, kışın ayaz getirir.',
  'Basra yazın Güneydoğu''yu kavuran termik basınçtır; İzlanda ise kışın yağış ve ılıman hava getiren dinamik alçak basınç merkezidir.'
);

-- Soru #040 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
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
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de epirojenik (kıta oluşumu) hareketlerin günümüzde de devam ettiğinin en somut kanıtları arasında aşağıdakilerden hangisi gösterilemez?',
  '{"options": ["Çukurova ve Ergene Havzası''nın tortulanarak her yıl çökmesi", "Akarsu vadilerinde basamaklı seki (taraça) oluşumlarının görülmesi", "Karadeniz ve Toros Dağları''nın toptan yükselmeye devam etmesi", "Eski kordon boylarının ve kıyı taraçalarının deniz seviyesinden yüksekte kalması", "Ege kıyılarında kırıklı fay hatlarında sık sık depremler meydana gelmesi"], "correctIndex": 4}'::jsonb,
  'Ege''de fay hatlarının kırılması ve depremler OROJENEZ ve SEİZMA (deprem) ile ilgilidir. Epirojeniz ise tabakaların bozulmadan toptan kubbeleşmesi ya da toptan çökmesidir (seki/taraça oluşumu, Çukurova''nın çökmesi, dağların toptan yükselmesi).',
  'ÖSYM deprem ve orojenez (dağ oluşumu) ile epirojenez (toptan yükselme/alçalma) arasındaki kavram farkını sık sık çeldirici olarak kullanır.'
);

-- Soru #041 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'TÜİK''in son yıllardaki Adrese Dayalı Nüfus Kayıt Sistemi (ADNKS) verileri incelendiğinde, Türkiye''nin nüfus piramidinde tabanın belirgin şekilde daraldığı gözlenmektedir.

Nüfus piramidinin tabanının daralması Türkiye nüfusu ile ilgili kesin olarak hangi göstergeyi kanıtlar?',
  '{"options": ["Doğum oranlarının ve çocuk nüfus oranının azaldığını", "Toplam nüfus miktarının gerilemeye başladığını", "Dış ülkelere verilen göçlerin arttığını", "Tarımsal nüfus yoğunluğunun yükseldiğini", "Kırsal nüfus oranının kentsel nüfusu geçtiğini"], "correctIndex": 0}'::jsonb,
  'Piramidin en alt basamağı 0-4 yaş grubunu (yeni doğanları) temsil eder. Tabanın daralması, doğurganlık hızının düştüğünü, ailelerin daha az çocuk sahibi olduğunu ve nüfus artış hızının gerilediğini doğrudan kanıtlar.',
  'Adaylar nüfus artış hızı azalınca ''toplam nüfus da azaldı'' sanırlar. Nüfus artış hızı sıfırın altına düşmedikçe toplam nüfus artmaya devam eder, sadece artış hızı yavaşlar.'
);

-- Soru #042 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Tarımsal nüfus yoğunluğu, tarımla uğraşan nüfusun tarım alanlarına bölünmesiyle elde edilir. Dağlık ve engebeli arazilerde tarım arazisi dar olduğu için tarımsal nüfus yoğunluğu çok yüksek çıkar.

Buna göre aşağıdaki merkezlerin hangisinde tarımsal nüfus yoğunluğunun diğerlerine göre daha yüksek olması beklenir?',
  '{"options": ["Konya Ovası", "Şanlıurfa Platosu", "Doğu Karadeniz (Rize yöresi)", "Ergene Havzası", "Gaziantep Platosu"], "correctIndex": 2}'::jsonb,
  'Rize ve Doğu Karadeniz''de arazinin büyük bölümü sarp dağ ve ormanlarla kaplıdır; tarım arazisi son derece kısıtlıdır. Kırsal nüfus bu daracık tarım alanlarına sıkıştığı için tarımsal nüfus yoğunluğu Türkiye''nin en yüksek seviyelerindedir.',
  'Konya ve Şanlıurfa''da tarım yapan insan çoktur ama tarım arazisi uçsuz bucaksız olduğu için yoğunluk düşüktür.'
);

-- Soru #043 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye haritasında bazı alanlar fiziki ya da beşeri olumsuz koşullar nedeniyle çok seyrek nüfuslanmıştır.

Aşağıdaki alanlardan hangisinin seyrek nüfuslu olmasında arazinin ''karstik yapıda olması ve suyun yer altına sızması'' temel faktördür?',
  '{"options": ["Yıldız Dağları Yöresi", "Teke ve Taşeli Platoları", "Hakkari Yöresi", "Tuz Gölü ve Çevresi", "Biga Yarımadası"], "correctIndex": 1}'::jsonb,
  'Teke ve Taşeli platolarında karstik kalkerli arazi yaygındır. Yüzeye düşen yağmur suları çatlaklardan hemen yer altına sızar; yüzey suyu bulunamaz, toprak kireçlidir ve tarım yapılamaz. Bu yüzden Akdeniz kıyısında olmasına rağmen çok seyrektir.',
  'Yıldız Dağları ana ulaşım yollarına sapa kaldığı için, Hakkari engebe/soğuk yüzünden, Tuz Gölü ise kuraklık yüzünden seyrektir.'
);

-- Soru #044 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de belirli dönemlerde yapılan geçici (mevsimlik) işçi göçleri yörelerin nüfusunda dönemsel büyük dalgalanmalara yol açar.

Aşağıdakilerden hangisi tarımsal amaçlı mevsimlik göç alan yörelerimize örnek gösterilemez?',
  '{"options": ["Pamuk hasadı için Çukurova ve Şanlıurfa", "Fındık toplamak için Ordu ve Giresun", "Çay hasadı için Rize ve Artvin", "Kayısı hasadı için Malatya", "Kış aylarında kayak turizmi için Uludağ ve Palandöken"], "correctIndex": 4}'::jsonb,
  'Uludağ ve Palandöken''e kışın giden nüfus tarımsal değil ''turizm amaçlı'' geçici nüfus hareketidir. Soru kökünde ''tarımsal amaçlı'' mevsimlik göç sorulmaktadır.',
  'Sorularda mevsimlik göçün ''tarım mı'', ''turizm mi'' yoksa ''inşaat mı'' amaçlı olduğuna dikkat edilmelidir.'
);

-- Soru #045 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''nin Cumhuriyet tarihi boyunca uygulanan nüfus politikaları incelendiğinde; nüfus artış hızının tarihimizin en düşük seviyesine (%1,05 civarı) gerilediği dönem aşağıdakilerden hangisidir?',
  '{"options": ["1927 — 1935 Dönemi", "1940 — 1945 Dönemi", "1955 — 1960 Dönemi", "1970 — 1975 Dönemi", "1980 — 1985 Dönemi"], "correctIndex": 1}'::jsonb,
  '1940-1945 döneminde İkinci Dünya Savaşı tehlikesi nedeniyle eli silah tutan genç erkek nüfus askere alınmış (seferberlik), evlilikler ertelenmiş, ekonomik kriz ve kıtlık baş göstermiştir. Bu nedenle nüfus artış hızımız tarihin en sert düşüşünü yaşamıştır.',
  'Nüfus artış hızının ''en yüksek'' olduğu dönem 1955-1960 (binde 28); ''en düşük'' olduğu tarihi savaş dönemi ise 1940-1945''tir.'
);

-- Soru #046 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Köy altı yerleşmeleri yerleşme süresine göre sürekli ve geçici olarak ikiye ayrılır. Sürekli köy altı yerleşmelerinde temel ekonomik faaliyet genellikle tarımdır.

Aşağıdaki köy altı yerleşmelerinden hangisi ekonomik faaliyeti tarıma dayalı ''sürekli'' köy altı yerleşmelerinden biridir?',
  '{"options": ["Yayla", "Kom", "Mezra", "Ağıl", "Oba"], "correctIndex": 2}'::jsonb,
  'Mezra, Çiftlik, Mahalle ve Divan sürekli köy altı yerleşmeleridir. Yayla, kom, ağıl, oba ve dam ise hayvancılığa bağlı geçici yerleşmelerdir.',
  'Sürekli yerleşmeleri ''ÇİFTLİK-MAHALLE-MEZRA-DİVAN'' (ÇMMD) olarak kodlayabilirsiniz; diğerleri geçicidir.'
);

-- Soru #047 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Kırsal yerleşme dokuları incelendiğinde yer şekillerinin düz ve su kaynaklarının kısıtlı olduğu yerlerde evler tek bir su kuyusunun etrafında toplanarak ''toplu yerleşmeleri'' oluşturmuştur.

Buna göre aşağıdaki coğrafi bölümlerin hangisinde toplu kırsal yerleşmelerin en yaygın olması beklenir?',
  '{"options": ["Doğu Karadeniz Bölümü", "Batı Karadeniz Bölümü", "Menteşe Yöresi", "Konya Bölümü (İç Anadolu)", "Hakkari Bölümü"], "correctIndex": 3}'::jsonb,
  'Toplu yerleşmeler suyun az, yer şekillerinin düz olduğu İç Anadolu ve Güneydoğu Anadolu''da yaygındır. Karadeniz''de ise su her yerde olduğu ve yer şekilleri engebeli olduğu için ''dağınık yerleşme'' görülür.',
  'Dağınık yerleşme = Bol su + Engebeli arazi (Karadeniz); Toplu yerleşme = Az su + Düz arazi (İç Anadolu).'
);

-- Soru #048 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Kırsal meskenlerde kullanılan yapı malzemeleri yörenin doğal çevre koşulları ve iklimiyle doğrudan uyumludur.

İç Anadolu ve Güneydoğu Anadolu''da kırsal evlerde kerpiç malzemenin yaygın olarak kullanılmasının temel nedeni nedir?',
  '{"options": ["Bölgede orman örtüsünün az, toprağın killi ve iklimin kurak/yarı kurak olması", "Kerpiç evlerin depreme karşı en dayanıklı mesken türü olması", "Bölgede taş ocaklarının hiç bulunmaması", "Kerpiç malzemenin su geçirmeyen bir izolasyon sağlaması", "Bölge halkının sanayide çalışması"], "correctIndex": 0}'::jsonb,
  'Kerpiç saman ve killi çamurun kalıplara dökülüp güneşte kurutulmasıyla yapılır. Ağacın ve taşın az, kuraklığın ve killi toprağın bol olduğu step iklimlerinde doğal malzemedir; kışın sıcak, yazın serin tutar.',
  'Karadeniz''de ahşap, Akdeniz''de taş (kalker), Doğu Anadolu''da volkanik taş/bazalt, İç Anadolu''da kerpiç.'
);

-- Soru #049 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de iç göç hareketleri genellikle doğudan batıya, iç kesimlerden kıyılara ve kırsal alanlardan büyük metropollere doğru gerçekleşir.

Aşağıdakilerden hangisi Türkiye''de kırsal alandan kentlere yapılan iç göçleri tetikleyen ''itici faktörlerden'' biri değildir?',
  '{"options": ["Tarımsal arazilerin miras yoluyla parçalanarak aile geçimini sağlayamaz hale gelmesi", "Tarımda makineli tarıma geçilmesiyle kırsalda işgücü fazlalığı oluşması", "Kentlerde eğitim, sağlık ve sosyal yaşam olanaklarının çok daha çeşitli olması", "Kırsal alanda erozyon ve kuraklık nedeniyle verimin düşmesi", "Deprem, heyelan ve taşkın gibi doğal afetlerin geçim kaynaklarını yok etmesi"], "correctIndex": 2}'::jsonb,
  'Kentlerdeki eğitim, sağlık ve cazip iş imkanları göçü başlatan değil, insanları kente çeken ''ÇEKİCİ FAKTÖRDÜR''. Diğer şıklar kırsalın insanı oradan uzaklaştıran ''itici faktörleridir''.',
  'ÖSYM ''itici faktör'' (kırsalın olumsuzluğu) ile ''çekici faktör'' (kentin sunduğu avantajlar) ayrımını sık sık tuzak olarak kurar.'
);

-- Soru #050 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de 1980''lerden sonra sanayileşme ve kentleşmenin hızlanmasıyla kent nüfusu kırsal nüfusu geride bırakmıştır.

Türkiye''de kent nüfusunun kırsal nüfus oranını resmi olarak ilk kez geride bıraktığı genel nüfus sayımı yılı hangisidir?',
  '{"options": ["1950", "1965", "1985", "2000", "2010"], "correctIndex": 2}'::jsonb,
  '1985 nüfus sayımında kent nüfus oranı %53''e ulaşarak Türkiye tarihinde ilk kez kırsal nüfusu (%47) geride bırakmıştır. Günümüzde ise bu oran %93''ün üzerine çıkmıştır.',
  '1980 askeri darbesi sonrası 1985 sayımı kır-kent dengesinin resmen kente döndüğü dönüm noktasıdır.'
);

-- Soru #051 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Küreselleşmenin getirdiği tekdüze kent hayatına karşı, yerel üreticileri destekleyen, tarihi dokuyu koruyan ve nüfusu 50 binden az olan kentlere ''Sakin Şehir'' (Cittaslow) unvanı verilir.

Türkiye''nin 2009 yılında kabul edilen İLK Sakin Şehri aşağıdakilerden hangisidir?',
  '{"options": ["Halfeti (Şanlıurfa)", "Seferihisar (İzmir)", "Akyaka (Muğla)", "Taraklı (Sakarya)", "Eğirdir (Isparta)"], "correctIndex": 1}'::jsonb,
  'Türkiye''nin ilk Sakin Şehri (Cittaslow) İzmir''in Seferihisar ilçesidir (2009). Bu unvanla birlikte Türkiye''de sakin şehir ağı genişlemiş ve Halfeti, Akyaka, Perşembe, Göynük gibi birçok ilçe bu ağa katılmıştır.',
  'Adaylar batık şehir görüntüsüyle ünlü Halfeti''yi ilk sakin şehir zannedebilir; Halfeti daha sonra katılmıştır, ilki Seferihisar''dır.'
);

-- Soru #052 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Karadeniz Bölgesi''nde yer alan Sinop Limanı, Türkiye''nin en mükemmel doğal limanlarından biri olmasına rağmen tarih boyunca yeterince gelişememiş ve sönük kalmıştır.

Sinop Limanı''nın gelişememesindeki temel coğrafi engel aşağıdakilerden hangisidir?',
  '{"options": ["Kıyıda dalga aşındırmasının çok fazla olması", "Küre Dağları''nın kıyının hemen gerisinde uzanarak limanın art bölgesine (hinterlant) ulaşımını engellemesi", "Limanın derinliğinin büyük yük gemilerine elverişsiz olması", "Karasal iklimin kıyıda don olaylarına yol açması", "Liman çevresinde tarım arazisinin hiç olmaması"], "correctIndex": 1}'::jsonb,
  'Bir limanın büyümesi ''hinterlandının'' (art bölgesinin) genişliğine ve iç kesimlerle ulaşım kolaylığına bağlıdır. Sinop doğal bir limandır fakat Küre Dağları arkasında set çektiği için iç bölgelerle demiryolu ve kaliteli karayolu bağlantısı kurulamamış, bu yüzden gelişememiştir.',
  'ÖSYM ''Doğal liman olup gelişmeyen'' (Sinop) ile ''Yapay olup hinterlandı en geniş olan'' (İzmir, Mersin, İstanbul) liman karşılaştırmasını her sınavda sorar.'
);

-- Soru #053 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Şehirlerin gelişmesinde baskın olan fonksiyonlar farklıdır. Bazı şehirler yeraltı kaynağının bulunup işletilmesiyle hızla büyüyerek maden kenti kimliği kazanmıştır.

1940''lara kadar küçük bir köy iken Raman Dağı''nda petrol bulunmasıyla hızla büyüyüp il statüsü kazanan maden şehrimiz hangisidir?',
  '{"options": ["Batman", "Zonguldak", "Soma", "Seydişehir", "Yatağan"], "correctIndex": 0}'::jsonb,
  'Batman, 1940 yılında Raman Dağı''nda petrolün keşfedilmesi ve Türkiye''nin ilk rafinerisinin burada kurulmasıyla küçük bir köyden modern bir sanayi ve maden şehrine dönüşmüştür.',
  'Zonguldak taş kömürüyle, Batman petrolle büyüyen maden şehirlerimizdir.'
);

-- Soru #054 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Batı Karadeniz Bölümü''nde (özellikle Bolu, Sinop, Kastamonu çevrelerinde) yaygın olan; birbirinden bağımsız birkaç mahallenin birleşerek tek bir muhtarlık oluşturduğu sürekli köy altı yerleşmesi hangisidir?',
  '{"options": ["Divan", "Mezra", "Kom", "Dalyan", "Dam"], "correctIndex": 0}'::jsonb,
  'Divan yerleşmesi Batı Karadeniz''e özgüdür. Engebeli arazide mahalleler birbirinden kopuktur ve birkaç mahallenin bir idari çatı altında toplanmasıyla divan oluşur.',
  'Divan = Batı Karadeniz; Mezra = Doğu Anadolu ve Güneydoğu; Kom = Doğu Anadolu.'
);

-- Soru #055 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Ege ve Akdeniz kıyılarındaki koylarda ve göl kenarlarında kurulan, deniz hayvanlarının ve balıkların üretilip avlandığı geçici kırsal yerleşme türü aşağıdakilerden hangisidir?',
  '{"options": ["Dalyan", "Ağıl", "Oba", "Kışlak", "Güzle"], "correctIndex": 0}'::jsonb,
  'Dalyan su ürünleri ve balıkçılık yapılan kıyı köy altı yerleşmeleridir. Muğla Dalyan en bilinen örneğidir.',
  'Ağıl küçükbaş hayvan barınağıdır; Oba çadırlı göçebe Yörük yerleşmesidir; Dalyan ise su ürünleri yerleşmesidir.'
);

-- Soru #056 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Geniş tarım alanları üzerine kurulan, mülkiyeti genellikle tek bir şahsa ya da aileye ait olan, tarım ve hayvancılığın bir arada yapıldığı sürekli yerleşme türü hangisidir?',
  '{"options": ["Çiftlik", "Kom", "Yayla", "Oba", "Dam"], "correctIndex": 0}'::jsonb,
  'Çiftlik geniş ve düz arazilerde (Trakya, Ege, Akdeniz, İç Anadolu) tarım ve hayvancılık amacıyla kurulan sürekli köy altı yerleşmesidir.',
  'Çiftlik tek bir aile/şahıs mülkiyetindedir ve kalıcıdır.'
);

-- Soru #057 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'TÜİK''in son verilerine göre Türkiye''de nüfus miktarı en az olan ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Bayburt", "Tunceli", "Ardahan", "Gümüşhane", "Kilis"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin nüfusu en az olan ili Bayburt''tur (yaklaşık 84-85 bin nüfus). Tunceli ve Ardahan da nüfusu en az iller arasındadır ancak son yıllardaki birincilik Bayburt''tadır.',
  'Adaylar en küçük yüzölçümü olan Yalova ile en az nüfusu olan Bayburt''u karıştırabilirler.'
);

-- Soru #058 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Yükseköğrenim görmüş, nitelikli bilim insanı, doktor ve mühendislerin daha iyi çalışma koşulları için gelişmiş ülkelere gitmesine ''Beyin Göçü'' denir.

Beyin göçünün bir ülke üzerindeki en yıkıcı sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Tarımsal üretimde insan gücü açığı oluşması", "Ülkenin Ar-Ge, inovasyon ve teknolojik kalkınma hızının sekteye uğraması", "Kırsal nüfus oranının aniden artış göstermesi", "Ülkede kadın nüfusunun erkek nüfustan fazla çıkması", "Ulusal saat uygulamasının aksaması"], "correctIndex": 1}'::jsonb,
  'Beyin göçü bir ülkenin en yetenekli zihinlerini ve yetiştirdiği sermayeyi kaybetmesidir. Bu kayıp teknolojik inovasyon, tıp ve katma değerli sanayi üretiminde ülkeyi dışa bağımlı kılar.',
  'Beyin göçü fiziksel kas gücü açığı yaratmaz; zihinsel ve teknolojik kalkınma kapasitesini zayıflatır.'
);

-- Soru #059 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de nüfus artış hızının çok yüksek olduğu gelişmekte olan yörelerde devlete binen okul, hastane, altyapı ve konut gibi yatırımlara ''Demografik Yatırımlar'' denir.

Bir bölgede demografik yatırımların bütçeden çok büyük pay almasının kalkınma üzerindeki etkisi nedir?',
  '{"options": ["Tasarrufların ve doğrudan sanayiye dönük üretken yatırımların azalması nedeniyle ekonomik büyüme hızını yavaşlatması", "Bölgenin ihracat gelirlerini rekor seviyede artırması", "Nüfus artış hızını aniden sıfırlaması", "Bölgeye gelen yabancı turist sayısını katlaması", "Doğal kaynakların tamamen tükenmesini engellemesi"], "correctIndex": 0}'::jsonb,
  'Demografik yatırımlar hızlı nüfus artışının temel ihtiyaçlarını (ilave sınıflar, sağlık ocakları) karşılamak için yapılır; doğrudan gelir ve fabrika üretmez. Bu yüzden sermaye tüketime gider ve kişi başına düşen milli gelir artışı yavaşlar.',
  'Demografik yatırımların çok olması bir başarı göstergesi değil, yüksek nüfus artışının sermayeyi tüketici alanlara bağladığının göstergesidir.'
);

-- Soru #060 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Aşağıdaki şehirlerden hangisi gelişimini tarım ve sanayiden ziyade tamamen ''idari ve siyasi'' fonksiyonuna borçludur?',
  '{"options": ["Ankara", "Gaziantep", "Kocaeli", "Denizli", "İskenderun"], "correctIndex": 0}'::jsonb,
  'Ankara 1923 yılında başkent ilan edilene kadar İç Anadolu''da küçük bir kasaba görünümündeydi. Başkent olmasıyla birlikte bürokrasi, bakanlıklar, elçilikler ve kamu yatırımlarıyla Türkiye''nin 2. büyük metropolü haline gelmiştir.',
  'Ankara tipik bir ''idari fonksiyonlu'' şehirdir.'
);

-- Soru #061 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye tarımında kurak ve yarı kurak bölgelerde toprağın bir yıl ekilip bir yıl boş bırakılmasına ''nadas'' yöntemi denir.

Nadas alanlarının geniş yer kaplaması aşağıdakilerden hangisinin yetersiz olduğunu kanıtlar ve hangi çevre sorununu şiddetlendirir?',
  '{"options": ["Sulama imkanlarının yetersiz olduğunu — Rüzgar ve su erozyonunu", "Tohum ıslahının yetersiz olduğunu — Orman yangınlarını", "Makineleşmenin yetersiz olduğunu — Heyelanları", "Gübrelemenin yetersiz olduğunu — Asit yağmurlarını", "İlaçlamanın yetersiz olduğunu — Çığ felaketlerini"], "correctIndex": 0}'::jsonb,
  'Nadas tamamen su yetersizliğinden (toprağın bir yıl dinlenip nem biriktirmesi amacıyla) yapılır. Boş bırakılan toprak örtüsüz kaldığı için rüzgar ve sel suları toprağın en verimli üst katmanını süpürerek şiddetli erozyona yol açar. Sulama geliştikçe nadas biter.',
  'Nadas erozyonu tetikler. Nadası bitirmenin yolu sulama ve nöbetleşe ekimdir (münavebe).'
);

-- Soru #062 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de bazı tarım ürünleri iklim şartlarına karşı çok seçicidir ve yalnızca belirli mikroklimalarda ya da özel iklim kuşaklarında yetişebilir.

Aşağıdaki tarım ürünlerinden hangisinin yetişme alanı Türkiye''de en dardır?',
  '{"options": ["Çavdar", "Elma", "Muz", "Üzüm", "Buğday"], "correctIndex": 2}'::jsonb,
  'Muz tropikal bir üründür ve don olayına karşı aşırı hassastır. Türkiye''de yalnızca kış ılıklığının garanti olduğu Anamur, Alanya ve Gazipaşa kıyı şeridinde açıkta yetişebilir. Elma ve üzüm ise soğuğa dayanıklı olup Türkiye''nin hemen her yerinde yetişir.',
  'Muz ve çay Türkiye''de ekim alanı en dar ve en seçici ürünlerdir.'
);

-- Soru #063 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de bazı ürünlerin ekimi devlet kontrolü altındadır. Bu kontrol farklı ürünlerde halk sağlığı, uyuşturucu ile mücadele ya da kalite korunması gibi farklı gerekçelere dayanır.

Aşağıdaki ürünlerden hangisinin ekim alanlarının sınırlandırılmasında ''sıtma hastalığına yol açan sivrisineklerin yerleşim yerlerinde çoğalmasını engelleme'' gerekçesi rol oynar?',
  '{"options": ["Tütün", "Haşhaş", "Pirinç (Çeltik)", "Kenevir", "Şeker pancarı"], "correctIndex": 2}'::jsonb,
  'Pirinç (çeltik) bataklık ve sürekli su altında olan tarlalarda yetiştirilir. Durgun sular anofel cinsi sıtma sivrisineklerinin üreme alanıdır. Bu yüzden Çeltik Kanunu uyarınca şehir ve köy yerleşim yerlerinin yakınına pirinç ekilmesi yasaktır.',
  'Haşhaş ve kenevir uyuşturucu; tütün kalite kontrolü; şeker pancarı fabrika kapasitesi/kota; pirinç ise sıtma hastalığı nedeniyle devlet kontrolündedir.'
);

-- Soru #064 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Güneydoğu Anadolu Projesi (GAP) ile birlikte Fırat ve Dicle nehirlerinin suları Şanlıurfa ve Harran ovalarına ulaştırılmıştır.

Sulamanın başlamasıyla birlikte Güneydoğu Anadolu Bölgesi aşağıdaki tarım ürünlerinden hangisinin üretiminde Ege ve Akdeniz''i geride bırakarak Türkiye 1.si olmuştur?',
  '{"options": ["Pamuk", "Tütün", "Zeytin", "Fındık", "Çay"], "correctIndex": 0}'::jsonb,
  'GAP öncesi pamuk üretiminde Ege ve Çukurova liderdi. Şanlıurfa Tünelleri ile ovalara su verilince pamuk ekim alanı patlama yapmış ve Güneydoğu Anadolu Türkiye pamuk üretiminin yarıdan fazlasını tek başına karşılayarak 1. sıraya yerleşmiştir.',
  'ÖSYM GAP''ın tarım üzerindeki en somut sonucunu PAMUK ve MISIR üretimi üzerinden sıkça sorgular.'
);

-- Soru #065 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Şeker pancarı hasat edildikten sonra çok kısa sürede şeker oranını kaybettiği ve çürümeye başladığı için tarladan toplanır toplanmaz işlenmek zorundadır.

Bu durum şeker fabrikalarının yer seçiminde aşağıdakilerden hangisini zorunlu kılmıştır?',
  '{"options": ["Fabrikaların enerji santrallerinin yanına kurulmasını", "Fabrikaların doğrudan ekim alanlarının hemen yakınına kurulmasını", "Fabrikaların yalnızca liman şehirlerinde açılmasını", "Fabrikaların demiryolu kavşaklarında toplanmasını", "Fabrikaların sadece serbest bölgelerde inşa edilmesini"], "correctIndex": 1}'::jsonb,
  'Şeker pancarı çabuk bozulduğu için hammaddeye bağımlılığı en yüksek sanayi koludur; fabrikalar daima ekim alanlarının dibine kurulur. Ayrıca pancar küspesi harika bir hayvan yemidir; bu yüzden şeker fabrikalarının etrafında besi hayvancılığı gelişir.',
  'Şeker fabrikaları hammaddeye yakınlık ilkesinin Türkiye''deki 1 numaralı örneğidir.'
);

-- Soru #066 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de kıyı bölgelerimizde (Ege, Akdeniz) şeker pancarı tarımı iklimsel olarak rahatlıkla yapılabilmesine rağmen, bu kıyılarda şeker pancarı ekimi yok denecek kadar azdır.

Kıyı bölgelerimizin çiftçilerinin şeker pancarı yerine pamuk, sebze, meyve ve turunçgil ekmeyi tercih etmelerinin temel nedeni nedir?',
  '{"options": ["Kıyı topraklarının tuzlu olması", "Şeker pancarının kıyılarda hiç yetişememesi", "Alternatif ürünlerin (sebze, meyve, pamuk) ekonomik getirisinin ve kârlılığının çok daha yüksek olması", "Kıyılarda şeker fabrikası kurmanın yasak olması", "Kıyılarda hayvan yetiştiriciliğinin hiç yapılmaması"], "correctIndex": 2}'::jsonb,
  'Şeker pancarı kıyıda çok güzel yetişir; ancak Akdeniz ve Ege çiftçisi dönüm başına servet kazandıran muz, narenciye, seracılık veya pamuk varken daha düşük getirili olan şeker pancarını ekmez. Bu tamamen ekonomik rasyonelliktir.',
  'Adaylar ''iklim uygun değil'' diye düşünebilir. İklim uygundur ama ekonomik getiri düşüktür.'
);

-- Soru #067 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Doğal bitki örtüsü ile hayvancılık türleri arasında doğrudan bir paralellik vardır.

İlkbaharda yeşerip yaz kuraklığıyla sararan kısa boylu bozkır (step) ot topluluklarının yaygın olduğu İç Anadolu ve Doğu Anadolu platolarında en yaygın yapılan hayvancılık faaliyeti hangisidir?',
  '{"options": ["Küçükbaş (Koyun) Hayvancılığı", "Büyükbaş (Sığır) Mera Hayvancılığı", "İpek Böcekçiliği", "Kültür Balıkçılığı", "Besi ve Ahır Hayvancılığı"], "correctIndex": 0}'::jsonb,
  'Bozkırın cılız otları küçükbaş hayvanların (özellikle koyunun) beslenmesi için idealdir. Bu yüzden bozkır kuşağında milyonlarca küçükbaş hayvan yetiştirilir.',
  'Bozkır = Küçükbaş/Koyun; Dağ Çayırı = Büyükbaş Mera (Erzurum-Kars); Maki/Çalı = Kıl Keçisi (Toroslar).'
);

-- Soru #068 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Toros Dağları''nın engebeli ve kayalık yamaçlarında, maki ve çalı örtüsünün yaygın olduğu Akdeniz Bölgesi''nde yetiştirilen, ormanlara ve fidanlara zarar verdiği gerekçesiyle sayısı devlet tarafından kontrol altında tutulan hayvan türü hangisidir?',
  '{"options": ["Kıl Keçisi", "Tiftik Keçisi", "Merinos Koyunu", "Manda", "Kıvırcık Koyun"], "correctIndex": 0}'::jsonb,
  'Kıl keçisi kayalık ve sarp arazilere tırmanma yeteneğiyle bilinir, maki ve çalılarla beslenir. Özellikle Teke ve Taşeli platolarında Yörükler tarafından yetiştirilir. Ağaç sürgünlerini yiyip ormana zarar verdiği için orman alanlarında otlatılması kısıtlanmıştır.',
  'Tiftik keçisi İç Anadolu''da (Ankara) tiftik yünü için beslenir; Toros kayalıklarında yaşayan ise kıl keçisidir.'
);

-- Soru #069 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Besi ve ahır hayvancılığı modern yöntemlerle, kapalı tesislerde fenni yemlerle yapılan hayvancılıktır.

Besi hayvancılığının mera hayvancılığına göre en büyük avantajı ve yoğunlaştığı yerlerin temel özelliği aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["İklim ve otlak koşullarından bağımsız olması, et-süt veriminin yüksek olması — Büyük tüketim merkezlerine (metropollere) yakınlık", "Yem maliyetinin sıfır olması — Yüksek dağ platoları", "Sadece kış aylarında yapılabilmesi — Karadeniz kıyıları", "Tamamen ihraç edilmesi — Sınır kapılarına yakınlık", "Devlet teşvikinin olmaması — Karstik sahalar"], "correctIndex": 0}'::jsonb,
  'Besi ve ahır hayvancılığında hayvan dışarı çıkmaz, suni yem yer; bu yüzden kuraklıktan etkilenmez ve verim devasadır. İstanbul, İzmir, Ankara, Bursa gibi dev nüfuslu metropollerin et-süt talebini karşılamak için Marmara ve Ege''de kurulur.',
  'Mera hayvancılığı iklime bağımlıdır (yağış azalırsa et-süt çöker); Besi hayvancılığı iklimden tamamen bağımsızdır.'
);

-- Soru #070 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de yağ bitkileri üretimi son yıllarda sanayinin gelişmesiyle büyük önem kazanmıştır.

Türkiye ayçiçeği üretiminin yaklaşık yarısını tek başına karşılayan ve ''ayçiçeği deposu'' olarak bilinen coğrafi alanımız hangisidir?',
  '{"options": ["Ergene Havzası (Trakya)", "Gediz Ovası", "Çukurova", "Iğdır Ovası", "Bafra Deltası"], "correctIndex": 0}'::jsonb,
  'Tekirdağ, Edirne ve Kırklareli illerini kapsayan Trakya / Ergene Havzası Türkiye ayçiçeği üretiminin merkezidir. Vertisol topraklar ayçiçeği için çok elverişlidir.',
  'Ayçiçeği = Trakya (Tekirdağ/Edirne); Zeytin = Ege; Mısır ve Soya = Akdeniz ve Güneydoğu.'
);

-- Soru #071 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye zengin bitki örtüsü ve farklı çiçeklenme dönemleri sayesinde dünya arıcılık ve bal üretiminde ilk sıralarda yer alır.

Aşağıdaki yörelerden hangisi çam ormanlarında yaşayan basra böceğinin salgısıyla üretilen dünyaca ünlü ''Çam Balı'' üretiminin Türkiye''deki merkezidir?',
  '{"options": ["Muğla — Menteşe Yöresi", "Konya — Cihanbeyli", "Edirne — Meriç Deltası", "Şanlıurfa — Harran Ovası", "Kars — Sarıkamış"], "correctIndex": 0}'::jsonb,
  'Türkiye dünya çam balı üretiminin yaklaşık %90''ını tek başına karşılar ve bu üretimin kalbi Muğla (Menteşe Yöresi) kızılçam ormanlarıdır. Çiçek balında ise Ordu, Rize (Anzer) ve Doğu Anadolu öne çıkar.',
  'Çam balı denince akla Muğla/Ege gelir; Yayla/çiçek balı denince Doğu Karadeniz ve Doğu Anadolu gelir.'
);

-- Soru #072 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Kümes hayvancılığı (tavuk, hindi, yumurta) üretim tesisleri incelendiğinde; tesislerin Manisa, Bolu, Balıkesir, Sakarya ve İzmir gibi illerde yoğunlaştığı görülür.

Kümes hayvancılığı tesislerinin yer seçiminde rol oynayan temel faktör nedir?',
  '{"options": ["Büyük tüketim pazarlarına (metropollere) yakınlık ve pazarlama kolaylığı", "Bölgenin doğal orman örtüsünün tavuklar için uygun olması", "İklim koşullarının ılıman geçmesi zorunluluğu", "Tesislerin sadece kıyı kesimlerde ruhsat alabilmesi", "Tavukların açık alanda yayılması gerekliliği"], "correctIndex": 0}'::jsonb,
  'Kümes hayvancılığı tamamen kapalı, klimalı ve otomatik entegre tesislerde yapılır. İklimle ve yer şekilleriyle hiçbir ilgisi yoktur; tek kriter İstanbul, İzmir, Ankara gibi dev pazarlara hızla taze bozulmadan ulaştırma (pazara yakınlık) gereğidir.',
  'Adaylar ''Bolu''da tavuk çok, o zaman Bolu''nun doğası uygundur'' diyebilir; hayır, Bolu İstanbul ile Ankara''nın tam ortasında stratejik pazar kavşağındadır.'
);

-- Soru #073 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye denizlerinde yapılan balıkçılık faaliyetleri incelendiğinde, toplam avlanan balık miktarının yaklaşık %70-80''i tek başına Karadeniz''den sağlanmaktadır.

Karadeniz''in balık miktarı bakımından diğer denizlerimize göre ezici bir üstünlüğe sahip olmasının temel gerekçesi nedir?',
  '{"options": ["Suyun daha soğuk olması, oksijen miktarının ve plankton (balık yemi) zenginliğinin çok yüksek olması", "Karadeniz''de dalga boyunun Akdeniz''den küçük olması", "Karadeniz''in tabanında 200 metreden sonra hidrojen sülfür gazı bulunması", "Karadeniz kıyılarında liman sayısının daha az olması", "Akdeniz''de avlanma yasağının tüm yıla yayılması"], "correctIndex": 0}'::jsonb,
  'Karadeniz''e dökülen dev nehirler bol organik madde ve tatlı su taşır, soğuk su oksijeni daha fazla tutar ve muazzam bir plankton zenginliği yaratır. Bu yüzden balık sürüleri (hamsi, istavrit) Karadeniz''de çok yoğundur.',
  'Dikkat: Karadeniz''de 200 metrenin altında zehirli gaz vardır, dipte balık yaşamaz; ama yüzeydeki oksijen ve plankton balık miktarını zirveye taşır.'
);

-- Soru #074 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Seracılık kış sıcaklıklarının sıfırın altına düşmediği, don olaylarının yaşanmadığı ve güneşlenme süresinin uzun olduğu kıyılarda yapılır.

Buna göre Türkiye''de jeotermal (sıcak su) kaynaklarının kullanıldığı seralar hariç tutulduğunda, geleneksel seracılığın en yaygın olduğu ve hiç yapılamadığı bölgeler hangisinde doğru eşleştirilmiştir?',
  '{"options": ["En yaygın: Akdeniz — Yapılamayan: Doğu Anadolu", "En yaygın: İç Anadolu — Yapılamayan: Ege", "En yaygın: Karadeniz — Yapılamayan: Marmara", "En yaygın: Marmara — Yapılamayan: Akdeniz", "En yaygın: Güneydoğu — Yapılamayan: Ege"], "correctIndex": 0}'::jsonb,
  'Akdeniz kıyıları (Antalya, Mersin) kış ılıklığı ve bol güneşlenme ile seracılığın başkentidir (ısıtma maliyeti çok düşüktür). Doğu Anadolu''da ise kışın sıcaklık -30°C''lere iner; serayı ısıtmak için harcanacak yakıt seranın gelirini katbekat aşacağı için ekonomik olarak yapılamaz.',
  'Jeotermal seracılık son yıllarda Afyon, İzmir, Denizli ve Şanlıurfa''da gelişmiştir ancak geleneksel seracılık Akdeniz''dedir.'
);

-- Soru #075 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''nin orman varlığı incelendiğinde; orman alanlarının yaklaşık %25''i Karadeniz''de, %24''ü Akdeniz''de yer alır. Buna karşılık Güneydoğu Anadolu Bölgesi orman varlığı bakımından Türkiye''nin en fakir (%3 civarı) bölgesidir.

Güneydoğu Anadolu''nun İç Anadolu''dan daha fazla yağış almasına rağmen orman varlığının çok daha az olmasının temel nedeni nedir?',
  '{"options": ["Şiddetli yaz kuraklığı ve aşırı sıcaklıkların yol açtığı şiddetli buharlaşma", "Bölgede akarsu ağının hiç bulunmaması", "Bölge arazisinin tamamen dağlık ve sarp olması", "Bölge topraklarının tamamen çorak tuz bataklıklarından oluşması", "Bölgede sadece küçükbaş hayvancılık yapılması"], "correctIndex": 0}'::jsonb,
  'Güneydoğu Anadolu İç Anadolu''dan daha çok yağış alır (yıllık 500-600 mm). Ancak güneyden gelen Samyeli çöl rüzgarları ve aşırı sıcaklıklar nedeniyle buharlaşma o kadar korkunçtur ki düşen yağış anında uçar. Toprak nemi kalmadığı için orman yetişemez.',
  'ÖSYM''nin en meşhur çeldiricisi: ''Güneydoğu en az yağış alan yer değildir; ama kuraklığın ve buharlaşmanın en şiddetli olduğu yerdir''.'
);

-- Soru #076 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Soğuğa ve don olaylarına karşı en dayanıksız tarım ürünlerinden olan turunçgiller (portakal, mandalina, limon, greyfurt) en çok Akdeniz kıyılarında üretilir.

Ege Bölgesi''nde kıyıdan iç kesimlere gidildikçe turunçgil tarımının aniden ortadan kalkmasının nedeni nedir?',
  '{"options": ["Karasallığın ve kış don olaylarının başlaması", "Sulama imkanlarının iç kesimlerde bulunmaması", "İç kesimlerde fabrikaların yasaklanması", "İç kesim topraklarının verimsizleşmesi", "İç kesimlerde rüzgar erozyonunun olması"], "correctIndex": 0}'::jsonb,
  'Turunçgiller 0°C''nin altındaki sıcaklıklara dayanamaz ve meyveleri donar. Ege kıyılarında deniz etkisiyle kışlar ılıktır; ancak iç kesimlere (Uşak, Afyon) gidildikçe yükselti artar, donlu gün sayısı başlar ve turunçgil yaşayamaz.',
  'Turunçgiller eşittir ''kış ılıklığı'' şartıdır.'
);

-- Soru #077 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye incir ve kuru üzüm üretiminde dünya lideridir. İncir kış ılıklığı isterken, üzüm ise -30°C soğuğa kadar dayanabilir ve Türkiye''nin hemen hemen her bölgesinde yetişir.

Türkiye''de kuru incir üretiminin yaklaşık %70''ini tek başına karşılayan tarım havzamız hangisidir?',
  '{"options": ["Aydın — Büyük Menderes Havzası", "Adana — Çukurova", "Konya Ovası", "Trabzon — Değirmendere", "Edirne — Meriç Vadisi"], "correctIndex": 0}'::jsonb,
  'Aydın ve Büyük Menderes Havzası dünyanın en kaliteli incirlerinin yetiştirildiği yerdir. İncir soğuğa dayanamaz ve hasat döneminde yağış istemez.',
  'Kuru incir = Aydın; Kuru üzüm = Manisa (Gediz Havzası).'
);

-- Soru #078 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Mısır doğal yetişme koşulları gereği nemli ve bol su isteyen bir bitkidir. Doğal olarak en uygun yetişme ortamı Karadeniz kıyılarıdır.

Buna rağmen Türkiye mısır üretiminde Akdeniz (Çukurova) ve Güneydoğu Anadolu''nun (GAP sahası) Karadeniz''i açık ara geride bırakmasının temel nedeni nedir?',
  '{"options": ["Gelişmiş sulama sistemleri sayesinde birim alandan alınan verimin çok yüksek olması ve sanayide (yağ, yem) ticari talep görmesi", "Karadeniz''de mısır üretiminin yasaklanması", "Mısırın sadece sıcak çöl havasında tane tutabilmesi", "Güneydoğu''da işgücünün bulunmaması", "Akdeniz''de mısırın gübresiz yetişebilmesi"], "correctIndex": 0}'::jsonb,
  'Mısır Karadeniz''de halkın temel besin maddesidir ve ticari amaçla satılmaz. Akdeniz ve Güneydoğu''da ise sulama ve gübreleme ile dönüm başına rekor verim alınır, yılda iki ürün hasat edilir ve doğrudan sanayiye (mısırözü yağı ve hayvan yemi) satılır.',
  'Doğal yetişme ortamı Karadeniz''dir ama üretim şampiyonu Akdeniz ve Güneydoğu''dur.'
);

-- Soru #079 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Konya Ovası''nda aşırı yeraltı suyu kullanımı nedeniyle yeraltı su seviyesi onlarca metre çekilmiş ve zeminde derin çöküntüler (obruklar) oluşmaya başlamıştır.

Bu sorunu çözmek ve Konya Ovası''nı sulamak amacıyla Göksu Nehri''nin sularını Mavi Tünel ile ovaya aktaran devasa kalkınma projesi hangisidir?',
  '{"options": ["KOP (Konya Ovası Projesi)", "GAP (Güneydoğu Anadolu Projesi)", "DOKAP (Doğu Karadeniz Projesi)", "ZBK (Zonguldak-Bartın-Karabük)", "Yeşilırmak Havzası Gelişim Projesi"], "correctIndex": 0}'::jsonb,
  'KOP (Konya Ovası Projesi), Göksu Nehri''nin Akdeniz''e boşa akan sularını Mavi Tünel ile Konya Kapalı Havzası''na bağlayarak kuraklığı önlemeyi ve obruk oluşumlarını durdurmayı hedefler.',
  'Göksu Nehri + Mavi Tünel = KOP projesidir.'
);

-- Soru #080 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
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
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de yaş koza üretimi ve ipek böcekçiliği geleneksel olarak Bursa ile anılmasına rağmen son yıllarda yapay sentetik ipliklerin yaygınlaşmasıyla geleneksel merkezler gerilemiştir.

Günümüzde Türkiye''de yaş ipek böceği kozası üretiminde 1. sıraya yükselen ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Diyarbakır", "Bursa", "Bilecik", "Edirne", "Rize"], "correctIndex": 0}'::jsonb,
  'TÜİK verilerine göre Türkiye''de yaş ipek böceği kozası üretiminde 1. il Diyarbakır''dır (Kulp ilçesi). Antalya ve Batman da önemli üreticilerdendir. Bursa ise tarihi ününe rağmen ham koza üretiminde gerilemiştir.',
  'ÖSYM''nin en sevdiği güncel tarım tuzağı: ''İpek böcekçiliği Bursa''dadır'' algısı. Tarihi olarak Bursa''dır ama yaş koza üretim şampiyonu Diyarbakır''dır.'
);

-- Soru #081 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Dünya toplam bor rezervlerinin yaklaşık %73''ü Türkiye''de bulunmaktadır. Jet ve roket yakıtı, cam, seramik, deterjan ve nükleer sanayide kullanılan bu stratejik maden ülkemizin milli değeridir.

Aşağıdakilerden hangisi Türkiye''de bor madeninin çıkarıldığı havzalardan biri değildir?',
  '{"options": ["Balıkesir — Susurluk ve Bigadiç", "Bursa — Mustafakemalpaşa", "Kütahya — Emet", "Eskişehir — Seyitgazi (Kırka)", "Artvin — Murgul"], "correctIndex": 4}'::jsonb,
  'Bor madeni Güney Marmara ve İç Anadolu kuşağında (Balıkesir, Bursa, Kütahya, Eskişehir) çıkarılır ve Bandırma ile Kırka''daki bor asit fabrikalarında işlenir. Artvin Murgul ise Türkiye''nin en büyük BAKIR madeni sahalarından biridir.',
  'Bor sahaları: 4B kuralı (Balıkesir, Bursa, Kütahya, Eskişehir). Murgul ise bakırdır.'
);

-- Soru #082 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de demir madeni Sivas (Divriği) ve Malatya (Hekimhan, Hasançelebi) gibi Doğu Anadolu sahalarından çıkarılmaktadır.

Buna karşılık Türkiye''nin en büyük demir-çelik fabrikalarının Zonguldak Karabük ve Ereğli''de kurulmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Taş kömürü yataklarına (enerji kaynağına) yakınlık", "Bölgede zengin demir yataklarının bulunması", "Karadeniz''de demir tüketiminin çok yüksek olması", "Bölgenin deprem riskinin sıfır olması", "İşgücü maliyetlerinin çok düşük olması"], "correctIndex": 0}'::jsonb,
  '1 ton demiri eritmek için yüksek kalorili taş kömürüne ihtiyaç vardır. Karadeniz''de demir madeni yoktur; demir Sivas''tan vagonlarla taşınır. Buradaki kuruluş faktörü tamamen ENERJİ KAYNAĞINA (taş kömürüne) yakınlıktır.',
  'Karabük ve Ereğli = Enerji kaynağına yakınlık; İskenderun Demir-Çelik = Ulaşım ve liman kolaylığı.'
);

-- Soru #083 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Bakır madeni elektrik ve elektronik sanayisinin temel iletken maddesidir. Türkiye''de Artvin (Murgul), Rize (Çayeli) ve Kastamonu (Küre) çıkarım merkezleridir.

Samsun''da bakır madeni çıkarılmamasına rağmen, Türkiye''nin en büyük Karadeniz Bakır İşletmesi''nin Samsun''da kurulmasının nedeni nedir?',
  '{"options": ["Gelişmiş bir limana sahip olması ve iç bölgelerle demiryolu ulaşımının kolay olması", "Samsun''da hidroelektrik enerjinin bedava olması", "Samsun''un en az yağış alan yer olması", "Bakır tüketen fabrikaların tamamının Samsun''da olması", "Kentin serbest bölge ilan edilmesi"], "correctIndex": 0}'::jsonb,
  'Samsun limanı ve demiryolu hinterlandı sayesinde Murgul ve Küre''den getirilen bakır cevherini işleyip deniz yoluyla sevk etmek için en elverişli lojistik merkezdir. Kuruluş nedeni ULAŞIM VE LİMAN''dır.',
  'Samsun Bakır Fabrikası = Ulaşım/Liman; Küre ve Murgul = Hammadde.'
);

-- Soru #084 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Paslanmaz çelik yapımında, denizaltı, uçak ve zırh sanayisinde çeliğe sertlik ve dayanıklılık kazandırmak için kullanılan, Elazığ Guleman ve Muğla Fethiye''de zengin yatakları bulunan maden hangisidir?',
  '{"options": ["Krom", "Boksit", "Bor", "Linyit", "Kükürt"], "correctIndex": 0}'::jsonb,
  'Krom çeliği paslanmaz ve kırılmaz kılan en stratejik metaldir. Türkiye krom ihracatında dünyada ilk sıralardadır. İşlendiği tesisler Elazığ (hammaddeye yakın) ve Antalya (limana yakın) Ferro-Krom fabrikalarıdır.',
  'Paslanmaz çelik + Elazığ Guleman + Fethiye = KROM.'
);

-- Soru #085 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Hafif ve dayanıklı olması nedeniyle uçak ve otomotiv sanayisinde yaygın kullanılan alüminyumun hammaddesi olan ''Boksit'' madeni Türkiye''de çıkarıldığı yerde işlenir.

Türkiye''de boksit madeninin çıkarıldığı ve entegre Alüminyum Tesisleri''nin bulunduğu merkez neresidir?',
  '{"options": ["Konya — Seydişehir", "Batman — Kozluk", "Sivas — Divriği", "Kütahya — Emet", "Balıkesir — Susurluk"], "correctIndex": 0}'::jsonb,
  'Seydişehir (Konya) Türkiye''nin boksit ve alüminyum başkentidir; Akseki (Antalya) boksitleri de burada işlenir.',
  'Alüminyum = Boksit = Seydişehir.'
);

-- Soru #086 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  '1. Jeolojik zamanda (Paleozoik) oluşmuş yüksek kalorili bir kömür türü olan taş kömürü Türkiye''de sadece Zonguldak ve çevresinde dar bir alanda bulunur.

Türkiye''de taş kömürü ile çalışan ve deniz suyuyla soğutulan ilk ve en eski termik santralimiz hangisidir?',
  '{"options": ["Çatalağzı Termik Santrali", "Afşin-Elbistan Termik Santrali", "Hamitabat Termik Santrali", "Yatağan Termik Santrali", "Soma Termik Santrali"], "correctIndex": 0}'::jsonb,
  'Zonguldak''ta yer alan Çatalağzı Termik Santrali Türkiye''nin taş kömürü ile çalışan tek büyük santralidir. Soma, Yatağan ve Afşin-Elbistan ise linyitle çalışır.',
  'Taş kömürüyle çalışan = Çatalağzı; Doğalgazla çalışan = Hamitabat; Linyitle çalışan = Soma/Afşin.'
);

-- Soru #087 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye 3. Jeolojik zamanda (Tersiyer) toptan yükseldiği için linyit kömürü yatakları ülkenin hemen hemen her bölgesine yayılmıştır.

Türkiye''nin linyit rezervi bakımından en zengin havzası olan ve üzerinde devasa termik santrallerin kurulu olduğu linyit sahamız neresidir?',
  '{"options": ["Kahramanmaraş — Afşin-Elbistan", "Manisa — Soma", "Kütahya — Tunçbilek", "Muğla — Yatağan", "Bursa — Orhaneli"], "correctIndex": 0}'::jsonb,
  'Afşin-Elbistan Havzası (Kahramanmaraş) Türkiye linyit rezervlerinin yaklaşık yarısına sahiptir ve A-B termik santralleriyle dev bir elektrik üretim üssüdür.',
  'En büyük linyit rezervi Afşin-Elbistan''dadır.'
);

-- Soru #088 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de çıkarılan petrol ulusal ihtiyacımızın yalnızca %8-10''luk kısmını karşılamakta, kalan kısım ithal edilmektedir. İthal ve yerli petrol rafinerilerde işlenir.

Aşağıdaki petrol rafinerilerinden hangisinin kuruluş yeri doğrudan ''hammaddeye yakınlık'' ilkesine dayanır?',
  '{"options": ["Batman Rafinerisi", "Tüpraş İzmit Rafinerisi", "İzmir Aliağa Rafinerisi", "Kırıkkale Orta Anadolu Rafinerisi", "Star Rafinerisi (İzmir)"], "correctIndex": 0}'::jsonb,
  'Batman Rafinerisi Raman ve Garzan petrol kuyularının hemen yanına kurulmuştur (hammaddeye yakın). Aliağa ve İzmit liman ve pazara yakın, Kırıkkale ise stratejik iç bölge güvenliği ve tüketim merkezlerine boru hattıyla bağlıdır.',
  'Hammaddeye yakın tek rafineri Batman Rafinerisi''dir; diğerleri ithal petrole ve pazara yakındır.'
);

-- Soru #089 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Doğalgaz çevre kirliliği az ve verimi yüksek bir enerji kaynağıdır. Türkiye doğalgaz ihtiyacının büyük bölümünü Rusya, Azerbaycan ve İran''dan boru hatlarıyla ve LNG gemileriyle karşılar.

Türkiye sınırları içerisinde doğalgaz çıkarılan yerli sahalarımız arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Kırklareli — Hamitabat", "Tekirdağ — Hayrabolu", "Mardin — Çamurlu", "Karadeniz — Sakarya Gaz Sahası", "Artvin — Murgul"], "correctIndex": 4}'::jsonb,
  'Murgul''da bakır madeni vardır, doğalgaz bulunmaz. Trakya''da Hamitabat ve Hayrabolu, Güneydoğu''da Mardin Çamurlu ve Karadeniz Filyos açıklarındaki Sakarya Gaz Sahası yerli doğalgaz üretim merkezlerimizdir.',
  'Trakya (Hamitabat) + Mardin (Çamurlu) + Karadeniz (Sakarya) = Doğalgaz çıkarım alanları.'
);

-- Soru #090 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Yer kabuğunun kırıklı (fay) hatları boyunca yer altına sızan suların magmaya yaklaşarak ısınıp yüzeye buhar şeklinde çıkmasıyla jeotermal enerji elde edilir.

Türkiye''nin ilk jeotermal elektrik santralinin kurulduğu ve günümüzde jeotermal enerjinin elektrik, konut ve sera ısıtmasında en yoğun kullanıldığı bölgemiz hangisidir?',
  '{"options": ["Ege Bölgesi (Denizli — Sarayköy / Aydın — Germencik)", "Güneydoğu Anadolu Bölgesi", "Karadeniz Bölgesi", "Doğu Anadolu Bölgesi", "İç Anadolu Bölgesi"], "correctIndex": 0}'::jsonb,
  'Ege Bölgesi aktif graben fay hatlarıyla parçalandığı için jeotermal kaynaklar bakımından Türkiye''nin 1 numarasıdır. İlk santral Denizli Sarayköy''dedir, Aydın Germencik ise devasa jeotermal santrallere ev sahipliği yapar.',
  'Jeotermal enerji = Fay hatları = Ege (Denizli/Aydın).'
);

-- Soru #091 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de rüzgar enerjisi potansiyeli en yüksek olan coğrafi alanlarımız Ege ve Güney Marmara kıyılarıdır.

Türkiye''nin İLK rüzgar enerjisi santrali (RES) nerede faaliyete geçmiştir?',
  '{"options": ["İzmir — Çeşme (Alaçatı)", "Balıkesir — Bandırma", "Çanakkale — Bozcaada", "Manisa — Soma", "Hatay — Belen"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin ilk rüzgar enerji santrali 1998 yılında İzmir Çeşme Alaçatı''da kurulmuştur. Günümüzde Balıkesir, İzmir, Çanakkale ve Manisa en çok rüzgar enerjisi üreten illerimizdir.',
  'İlk RES = İzmir Alaçatı.'
);

-- Soru #092 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Güneş enerjisi santralleri (GES) geniş ve düz arazilere kurulur ve yıllık güneşlenme süresinin yüksek olmasını gerektirir.

Türkiye''nin ve Avrupa''nın tek bir alanda kurulu en büyük Güneş Enerjisi Santrali (GES) projesi nerede hayata geçirilmiştir?',
  '{"options": ["Konya — Karapınar Güneş İhtisas Endüstri Bölgesi", "Şanlıurfa — Harran", "Antalya — Manavgat", "Van — Tuşba", "Mersin — Mut"], "correctIndex": 0}'::jsonb,
  'Konya Karapınar GES, çölleşmiş eski göl tabanı üzerinde 20 milyon metrekare alana kurulan dev panelleriyle Türkiye''nin açık ara en büyük güneş enerjisi santralidir.',
  'Türkiye''nin en büyük GES yatırımı Konya Karapınar''dadır.'
);

-- Soru #093 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin akarsuları yüksek debi ve eğimleri sayesinde büyük hidroelektrik potansiyele sahiptir. Çoruh Nehri üzerinde inşa edilen ve çift eğrilikli beton kemer kategorisinde Türkiye''nin en yüksek, dünyanın 5. en yüksek barajı hangisidir?',
  '{"options": ["Yusufeli Barajı", "Deriner Barajı", "Atatürk Barajı", "Keban Barajı", "Ilısu Barajı"], "correctIndex": 0}'::jsonb,
  'Artvin''de Çoruh Nehri üzerinde tamamlanan Yusufeli Barajı 275 metre gövde yüksekliği ile Türkiye''nin en yüksek barajıdır. Deriner Barajı da Çoruh üzerindedir ama Yusufeli rekoru devralmıştır.',
  'En yüksek barajımız Yusufeli Barajı''dır (Artvin - Çoruh).'
);

-- Soru #094 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin maden ihracat gelirleri incelendiğinde, toplam madencilik ihracatımızın yaklaşık yarısını (%45-50) tek başına karşılayan başkalaşım (metamorfik) madeni hangisidir?',
  '{"options": ["Mermer", "Krom", "Bor", "Bakır", "Demir"], "correctIndex": 0}'::jsonb,
  'Kalkerin yüksek sıcaklık ve basınç altında başkalaşmasıyla oluşan Mermer, Türkiye''nin ihracat şampiyonu madenidir. Afyon, Marmara Adası, Bilecik, Muğla ve Elazığ (vişne mermeri) dünyaca ünlüdür.',
  'Adaylar ihracat şampiyonunu bor sanırlar; bor tonaj olarak kısıtlıdır, döviz gelirinde 1 numara MERMERDİR.'
);

-- Soru #095 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Petrol ve doğalgaz sondaj kuyularında açılan kuyunun çökmesini engellemek ve sondaj çamuruna ağırlık kazandırmak için kullanılan, Antalya (Alanya, Gazipaşa) ve Kahramanmaraş''ta çıkarılan ağır mineral hangisidir?',
  '{"options": ["Barit", "Asbest", "Fosfat", "Kükürt", "Zımpara taşı"], "correctIndex": 0}'::jsonb,
  'Barit yoğunluğu yüksek bir mineraldir ve petrol sondaj kuyularında sondaj çamurunun basıncını dengelemek için vazgeçilmezdir. Alanya ve Gazipaşa ana merkezlerdir.',
  'Petrol sondaj çamuru = Barit = Alanya/Gazipaşa.'
);

-- Soru #096 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Tarımda kullanılan suni kimyasal fosfatlı gübrelerin ana hammaddesi olan ve Türkiye''de Mardin (Mazıdağı) ve Adıyaman''da çıkarılan maden hangisidir?',
  '{"options": ["Fosfat", "Kükürt", "Manganez", "Cıva", "Antimon"], "correctIndex": 0}'::jsonb,
  'Mardin Mazıdağı Türkiye''nin en büyük fosfat tesislerine ev sahipliği yapar. Gübre hammaddesidir.',
  'Suni gübre hammaddesi = Fosfat = Mardin Mazıdağı.'
);

-- Soru #097 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Hediyelik süs eşyası, pipo ve takı yapımında kullanılan; ateşe dayanıklı, gözenekli ve beyaz renkli ''Lületaşı'' hangi ilimizin simgesidir?',
  '{"options": ["Eskişehir", "Erzurum", "Bilecik", "Kütahya", "Afyonkarahisar"], "correctIndex": 0}'::jsonb,
  'Lületaşı Eskişehir''de çıkarılır. Erzurum''da çıkarılan ise siyah renkli kehribar benzeri ''Oltutaşı''dır.',
  'Lületaşı = Eskişehir; Oltutaşı = Erzurum.'
);

-- Soru #098 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin ilk nükleer güç santrali olan Akkuyu Nükleer Güç Santrali Mersin''de inşa edilmektedir.

Nükleer santralin kuruluş yeri olarak Mersin Akkuyu sahilinin seçilmesinde aşağıdakilerden hangisi belirleyici olmuştur?',
  '{"options": ["Deprem riskinin (sismik aktivite) Türkiye ortalamasına göre çok düşük olması ve deniz suyu soğutma kaynağına sahip olması", "Bölgede zengin uranyum yataklarının bulunması", "Mersin''in Türkiye''nin en çok elektrik tüketen kenti olması", "Akdeniz''de fırtına riskinin hiç olmaması", "Bölgede sanayi tesislerinin yasaklanması"], "correctIndex": 0}'::jsonb,
  'Nükleer santrallerde güvenlik her şeydir. Mersin-Sinop sahaları Türkiye''nin fay hatlarından en uzak, deprem riski en düşük (1. derece deprem bölgesinden uzak) masif alanlarıdır. Ayrıca reaktörleri soğutmak için deniz suyu şarttır.',
  'Nükleer santral yeri seçiminde 1. kriter DEPREM RİSKİNİN AZLIĞIDIR.'
);

-- Soru #099 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Geleceğin nükleer reaktörlerinde temiz nükleer yakıt olarak kullanılması hedeflenen ve Türkiye''nin dünya rezervlerinde 2. sırada yer aldığı stratejik radyoaktif maden hangisidir?',
  '{"options": ["Toryum", "Uranyum", "Plütonyum", "Radyum", "Titanyum"], "correctIndex": 0}'::jsonb,
  'Eskişehir Sivrihisar havzası dünyanın en zengin Toryum yataklarına sahiptir. Türkiye toryum rezervinde dünya 2.sidir.',
  'Toryum = Eskişehir Sivrihisar = Dünya 2.liği.'
);

-- Soru #100 (Madenler ve Enerji Kaynakları)
insert into public.questions (
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
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Optik aletler, zımpara kağıdı ve aşındırıcı taşların yapımında kullanılan, Ege Bölgesi''nde (İzmir, Muğla, Aydın, Denizli) zengin yatakları bulunan maden hangisidir?',
  '{"options": ["Zımpara Taşı", "Krom", "Barit", "Linyit", "Asbest"], "correctIndex": 0}'::jsonb,
  'Zımpara taşı aşındırıcı sanayide kullanılır ve Ege Bölgesi dünya üretiminde ön saflardadır.',
  'Aşındırıcı sanayi + Ege = Zımpara Taşı.'
);

-- Soru #101 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Sanayi tesislerinin kuruluşunda en önemli faktörlerden biri hammaddeye yakınlıktır. Bazı hammaddeler çabuk bozulduğu ya da taşınması maliyetli olduğu için fabrikalar doğrudan tarlanın veya madenin yanına kurulur.

Aşağıdaki sanayi tesisi ve kuruluş yeri eşleştirmelerinden hangisinde ''hammaddeye yakınlık'' temel belirleyici faktör olmamıştır?',
  '{"options": ["Rize — Çay Fabrikaları", "Konya — Şeker Fabrikası", "Balıkesir (Edremit) — Zeytinyağı Fabrikası", "Çanakkale — Balık Konservesi Fabrikası", "İstanbul — Unlu Mamuller ve Bisküvi Fabrikaları"], "correctIndex": 4}'::jsonb,
  'İstanbul''da buğday tarımı yapılmaz; un ve tahıl Anadolu''dan gelir. İstanbul''da unlu mamul fabrikalarının kurulmasının nedeni hammadde değil, 16 milyonluk devasa nüfustur (PAZARA YAKINLIK).',
  'Büyükşehirlerdeki gıda ve konfeksiyon tesisleri hammaddeye değil ''tüketim pazarına'' yakındır.'
);

-- Soru #102 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Türkiye''nin ihracat şampiyonu olan otomotiv ve yan sanayisi Bursa, Kocaeli, Sakarya, İstanbul ve İzmir illerinde kümelenmiştir.

Otomotiv sanayisinin bu merkezlerde toplanmasında aşağıdakilerden hangisi etkili olmamıştır?',
  '{"options": ["Gelişmiş liman altyapısı ve Avrupa pazarına kolay ihracat", "Nitelikli teknik işgücünün ve mühendislik altyapısının bulunması", "Bölgede zengin demir cevheri madenlerinin çıkarılması", "Sermaye birikiminin ve finans kuruluşlarının bölgede yoğunlaşması", "Geniş tüketici pazarının ve yan sanayi tedarikçilerinin varlığı"], "correctIndex": 2}'::jsonb,
  'Marmara Bölgesi''nde demir madeni çıkarılmaz. Demir-çelik Karabük, Ereğli ve İskenderun''dan kütükler halinde getirilir. Otomotivin burada olma sebebi liman, işgücü, pazar ve sermayedir.',
  'Adaylar otomobil demirden yapılır, o zaman Marmara''da demir çıkarılır gibi yanlış bir çıkarım yapabilir; hammadde başka yerden taşınır.'
);

-- Soru #103 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Türkiye''nin yerli ve elektrikli otomobili TOGG''un üretim ve teknoloji kampüsü hangi il ve ilçemizde inşa edilerek seri üretime başlamıştır?',
  '{"options": ["Bursa — Gemlik", "Kocaeli — Gölcük", "Sakarya — Arifiye", "İzmir — Torbalı", "Eskişehir — Tepebaşı"], "correctIndex": 0}'::jsonb,
  'TOGG Teknoloji Kampüsü Bursa''nın Gemlik ilçesinde, doğrudan liman kıyısında inşa edilmiştir. Liman bağlantısı ihracat ve batarya sevkiyatı için stratejik avantaj sağlamaktadır.',
  'TOGG = Bursa Gemlik.'
);

-- Soru #104 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Geleneksel dokuma ve halıcılık merkezlerimiz yüzyıllardır kalitesini korumaktadır. El halıcılığı ve kilim dokumacılığı ile ünlü merkezler eşleştirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Hereke (Kocaeli) — İpekli ve Yünlü Saray Halıları", "Isparta — Gül ve Yün Halıları", "Uşak — Tarihi Türk Halıları", "Bünyan ve Develi — Kayseri Halıları", "Rize — Yünlü Halıcılık"], "correctIndex": 4}'::jsonb,
  'Rize''de halıcılık gelişmemiştir; Rize ''Feretiko'' (Rize bezi / keten dokumacılığı) ile meşhurdur. Hereke, Isparta, Uşak, Gördes, Demirci ve Bünyan Türkiye''nin önde gelen halı merkezleridir.',
  'Rize = Keten dokuma (Rize Bezi/Feretiko); Halı denince Isparta, Hereke, Uşak gelir.'
);

-- Soru #105 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Kimyasal gübre fabrikaları incelendiğinde; Bandırma, Mersin, İskenderun, Kocaeli ve Samsun gibi liman kentlerinde yoğunlaştıkları görülür.

Gübre fabrikalarının kıyı kentlerimizde kurulmasının temel nedeni nedir?',
  '{"options": ["Gübre üretiminde kullanılan fosfat ve doğalgazın büyük oranda deniz yoluyla ithal edilmesi", "Gübre tüketiminin sadece kıyılarda yapılması", "Gübrenin iç kesimlerde patlama riski taşıması", "Kıyı sularının gübreyle temizlenmesi", "Kıyılarda gübre kokusunun hissedilmemesi"], "correctIndex": 0}'::jsonb,
  'Türkiye suni gübre üretiminde kullanılan doğalgaz ve ham fosfatın büyük bölümünü Kuzey Afrika ve Körfez ülkelerinden deniz yoluyla ithal eder. Hammadde gemilerle geldiği için fabrikalar limanın hemen dibine kurulmuştur.',
  'Gübre fabrikaları ithal hammaddeye (limana) bağımlıdır.'
);

-- Soru #106 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Hammaddesi kil, kireçtaşı ve kum olan, inşaat sektörünün temel taşı kabul edilen ve hammadde her yerde bulunduğu için Türkiye''nin 7 coğrafi bölgesine de en dengeli dağılmış olan sanayi kolu hangisidir?',
  '{"options": ["Çimento Sanayisi", "Otomotiv Sanayisi", "Petrokimya Sanayisi", "Uçak Sanayisi", "Pamuklu Dokuma Sanayisi"], "correctIndex": 0}'::jsonb,
  'Çimentonun hammaddesi kireç ve kildir; doğada her yerde bulunur ve taşınması çok ağırdır. Bu yüzden Türkiye''nin hemen hemen her ilinde ya da bölgesinde bir çimento fabrikası mevcuttur.',
  'Türkiye''de en yaygın ve her bölgede olan sanayi dalı ÇİMENTODUR.'
);

-- Soru #107 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Savunma sanayisi tesisleri (TUSAŞ, ASELSAN, ROKETSAN, HAVELSAN, MKE) Ankara ve Kırıkkale''de kümelenmiştir.

Savunma sanayisinin kıyı şeridimiz yerine İç Anadolu''da kurulmasında etkili olan en temel tarihi ve coğrafi gerekçe nedir?',
  '{"options": ["Kıyıların denizden ve havadan gelebilecek askeri saldırılara açık olması, iç kesimlerin ise stratejik ve coğrafi güvenlik sağlaması", "İç Anadolu''da elektriğin daha ucuz olması", "Kırıkkale''de çelik madenlerinin çıkması", "Ankara''da nüfusun kıyılardan az olması", "Mühendislerin sadece Ankara''da yaşamayı tercih etmesi"], "correctIndex": 0}'::jsonb,
  'Cumhuriyet''in ilk yıllarından itibaren silah, mühimmat ve savunma sanayisi askeri güvenlik gerekçesiyle düşman donanmalarının menzili dışındaki korunaklı iç bölgeye (Kırıkkale ve Ankara) kurulmuştur.',
  'Savunma sanayisi = İç bölge güvenliği ve Başkent koruması.'
);

-- Soru #108 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Türkiye''de yük ve yolcu taşımacılığında karayollarının payı %85-90 seviyesindedir. Karayollarının bu derece baskın olmasının temel nedeni nedir?',
  '{"options": ["Kapıdan kapıya kesintisiz ulaşım sağlaması ve her yerleşim birimine ulaşabilen en yaygın ağ olması", "Karayolu taşımacılığının denizyolundan daha ucuz olması", "Karayolu araçlarının hiç kaza yapmaması", "Türkiye''de demiryolu ve havayolunun bulunmaması", "Karayollarının yakıt tüketiminin en düşük olması"], "correctIndex": 0}'::jsonb,
  'Karayolu en pahalı taşıma türlerinden biri olmasına rağmen ''kapıdan kapıya'' kesintisiz ulaşım sağladığı ve en ücra köye kadar yol ağı bulunduğu için yolcu ve yükte ezici paya sahiptir.',
  'En ucuz taşıma: Denizyolu > Demiryolu > Karayolu > Havayolu. Karayolunun üstünlüğü ucuzluğu değil esnekliğidir.'
);

-- Soru #109 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Yüksek Hızlı Tren (YHT) hatları Türkiye''de şehirlerarası yolcu taşımacılığında devrim yaratmıştır.

Aşağıdaki şehirlerden hangisi Türkiye''nin aktif Yüksek Hızlı Tren (YHT) ağı üzerinde doğrudan yer almaz?',
  '{"options": ["Eskişehir", "Konya", "Karaman", "Sivas", "Trabzon"], "correctIndex": 4}'::jsonb,
  'Ankara merkezli YHT hatları Eskişehir, İstanbul, Konya, Karaman, Kırıkkale, Yozgat ve Sivas illerine ulaşmıştır. Trabzon''a ise şu an hiçbir demiryolu hattı bulunmamaktadır.',
  'Trabzon ve Doğu Karadeniz''de demiryolu yoktur.'
);

-- Soru #110 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Kuzey Ege ve Marmara''yı birbirine bağlayan, Çanakkale Boğazı üzerinde inşa edilen ve 2023 metrelik orta açıklığıyla dünyanın en uzun asma köprüsü unvanını alan köprü hangisidir?',
  '{"options": ["1915 Çanakkale Köprüsü", "Yavuz Sultan Selim Köprüsü", "Osmangazi Köprüsü", "15 Temmuz Şehitler Köprüsü", "Fatih Sultan Mehmet Köprüsü"], "correctIndex": 0}'::jsonb,
  '1915 Çanakkale Köprüsü Gelibolu ile Lapseki arasında inşa edilmiş olup dünyanın en uzun orta açıklıklı asma köprüsüdür. Ege ve Marmara transit trafiğini İstanbul''a girmeden Avrupa''ya bağlar.',
  'Çanakkale Boğazı üzerindeki köprü 1915 Çanakkale Köprüsü''dür.'
);

-- Soru #111 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Türkiye''de dağlık yer şekilleri ve kıyı gerisindeki sarp dağ sıraları nedeniyle bazı illerimize demiryolu hattı hiç ulaşamamıştır.

Aşağıdaki kıyı illerimizden hangisine demiryolu bağlantısı bulunmaktadır?',
  '{"options": ["Antalya", "Muğla", "Trabzon", "İskenderun (Hatay)", "Bursa (Merkez)"], "correctIndex": 3}'::jsonb,
  'İskenderun limanı ve demiryolu hattına sahiptir; Adana ve İç Anadolu''ya doğrudan raylı bağlantısı vardır. Antalya, Muğla, Trabzon ve Bursa merkezde ise aktif demiryolu bağlantısı yoktur.',
  'KPSS Klasiği: Antalya, Muğla ve Trabzon''a demiryolu ULAŞMAZ! İskenderun ve Mersin''e ise ulaşır.'
);

-- Soru #112 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Akdeniz kıyı kuşağını İç Anadolu Bölgesi''ne bağlayan tarihi ve stratejik geçitler bulunmaktadır.

Adana ve Çukurova''yı İç Anadolu''ya (Niğde/Pozantı) bağlayan, otoyol ve demiryolunun geçtiği en kritik boğaz geçidi hangisidir?',
  '{"options": ["Gülek Boğazı / Geçidi", "Çubuk Geçidi", "Sertavul Geçidi", "Belen Geçidi", "Zigana Geçidi"], "correctIndex": 0}'::jsonb,
  'Gülek Boğazı Toroslar üzerindeki en önemli geçittir; Çukurova''yı İç Anadolu''ya bağlar. Çubuk Antalya''yı Göller Yöresi''ne, Sertavul Silifke/Mersin''i Karaman''a, Belen ise İskenderun''u Hatay ve Suriye''ye bağlar.',
  'Çukurova - İç Anadolu = Gülek Geçidi.'
);

-- Soru #113 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Konteyner taşımacılığında ve transit deniz ticaretinde Türkiye''nin en büyük konteyner limanları Marmara ve Akdeniz''de toplanmıştır.

Tekirdağ''da yer alan, Türkiye''nin ilk transit konteyner limanı (hub port) unvanına sahip olan ve dev gemilere hizmet veren özel liman hangisidir?',
  '{"options": ["Asyaport", "Ambarlı", "Haydarpaşa", "Derince", "Alsancak"], "correctIndex": 0}'::jsonb,
  'Asyaport (Tekirdağ), Karadeniz ve Akdeniz transit konteyner trafiğini yöneten Türkiye''nin en büyük transit aktarma limanıdır.',
  'Transit konteyner limanı = Asyaport (Tekirdağ).'
);

-- Soru #114 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Karadeniz''in sarp kıyı coğrafyasında kara alanı bulunamadığı için tamamen deniz doldurularak inşa edilen Türkiye''nin İLK deniz üzeri havalimanı hangisidir?',
  '{"options": ["Ordu — Giresun Havalimanı (OGU)", "Rize — Artvin Havalimanı", "Trabzon Havalimanı", "Samsun Çarşamba Havalimanı", "Zonguldak Çaycuma Havalimanı"], "correctIndex": 0}'::jsonb,
  'Ordu-Giresun Havalimanı (OGU) deniz dolgusuyla inşa edilen Türkiye''nin ve Avrupa''nın İLK deniz üzeri havalimanıdır. Rize-Artvin Havalimanı ise Türkiye''nin İKİNCİ deniz üzeri havalimanıdır.',
  'İlk deniz dolgusu havalimanı = Ordu-Giresun; İkincisi = Rize-Artvin.'
);

-- Soru #115 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Türkiye''nin dış ticaret yapısı incelendiğinde; Türkiye''nin en çok ihracat yaptığı ülke ile en çok ithalat yaptığı ülkeler doğru olarak hangisinde verilmiştir?',
  '{"options": ["En çok ihracat: Almanya — En çok ithalat: Rusya ve Çin", "En çok ihracat: ABD — En çok ithalat: İngiltere", "En çok ihracat: Irak — En çok ithalat: Fransa", "En çok ihracat: İtalya — En çok ithalat: Japonya", "En çok ihracat: Rusya — En çok ithalat: Almanya"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin geleneksel 1 numaralı ihracat pazarı Almanya''dır (otomotiv, tekstil, beyaz eşya). En çok ithalat yapılan ülkeler ise enerji (doğalgaz/petrol) nedeniyle Rusya ve sanayi ürünleri nedeniyle Çin''dir.',
  'İhracat şampiyonu pazarımız ALMANYA; İthalatta ise RUSYA ve ÇİN başı çeker.'
);

-- Soru #116 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Gümrük vergisi, harç ve fonlardan muaf tutularak yabancı sermayeyi çekmek ve ihracata dönük üretimi artırmak amacıyla kurulan Serbest Bölgelerden Türkiye''de İLK kurulan serbest bölge hangisidir?',
  '{"options": ["Mersin Serbest Bölgesi", "Ege Serbest Bölgesi (İzmir)", "İstanbul İhtisas Serbest Bölgesi", "Antalya Serbest Bölgesi", "Trabzon Serbest Bölgesi"], "correctIndex": 0}'::jsonb,
  '1985 yılında kurulan Mersin Serbest Bölgesi Türkiye''nin ilk serbest bölgesidir. Ticaret hacmi en büyük olan ise İzmir Ege Serbest Bölgesi''dir (ESBAŞ).',
  'İlk serbest bölge = Mersin; En yüksek ticaret hacmi = Ege (İzmir).'
);

-- Soru #117 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Şanlıurfa''da yer alan, MÖ 9600''lere tarihlenen ve üzerinde T biçimli dikilitaşların bulunduğu, insanlık tarihinin bilinen ''en eski anıtsal tapınak merkezi'' kabul edilerek UNESCO Dünya Mirası Listesi''ne giren alan hangisidir?',
  '{"options": ["Göbeklitepe", "Çatalhöyük", "Efes", "Nemrut Dağı", "Arslantepe"], "correctIndex": 0}'::jsonb,
  'Göbeklitepe Şanlıurfa''da yer alır ve yerleşik hayata geçiş ile dinler tarihini baştan yazan dünyanın en eski tapınak kompleksidir.',
  'En eski anıtsal inanç merkezi = Göbeklitepe (Şanlıurfa).'
);

-- Soru #118 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Bölgesel kalkınma projelerinden biri olan Yeşilırmak Havzası Gelişim Projesi (YHGP); Amasya, Çorum, Samsun ve Tokat illerini kapsamaktadır.

Bu projenin temel çıkış noktası ve öncelikli hedefi aşağıdakilerden hangisidir?',
  '{"options": ["Yeşilırmak''ın yol açtığı taşkın, sel ve erozyon felaketlerini önlemek, akarsu kirliliğini durdurmak", "Bölgede petrol kuyuları açmak", "Samsun Limanı''nı kapatmak", "Halkı başka bölgelere göç ettirmek", "Yalnızca kayak turizmi geliştirmek"], "correctIndex": 0}'::jsonb,
  'Yeşilırmak Havzası projesi taşkın ve erozyonla mücadele odaklıdır. Yeşilırmak''ın taşıdığı devasa alüvyon toprak kaybına ve Çarşamba ovasında sellere neden oluyordu.',
  'Yeşilırmak projesi = Sel, taşkın ve erozyonla mücadele.'
);

-- Soru #119 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Zonguldak-Bartın-Karabük (ZBK) Bölgesel Gelişme Projesi''nin ana eksenini demir-çelik sanayisinin modernize edilmesi ve Karadeniz''in devasa çıkış kapısı olan Filyos Vadisi Projesi oluşturur.

Bu projenin temel gerekçesi nedir?',
  '{"options": ["Bölgenin taş kömürü ve demir-çeliğe olan tek yönlü bağımlılığını azaltmak, yeni sanayi ve lojistik alanları yaratmak", "Bölgede tarımı tamamen yasaklamak", "Taş kömürü madenlerini tamamen kapatmak", "Karabük demir çelik fabrikasını Antalya''ya taşımak", "Bölge nüfusunu kırsala geri döndürmek"], "correctIndex": 0}'::jsonb,
  'ZBK bölgesi taş kömürü ve ağır sanayiye bağımlıdır. Kömür rezervlerinin derinleşmesi ve istihdam baskısı nedeniyle Filyos Limanı ve karma endüstri bölgeleriyle ekonomik çeşitlilik amaçlanır.',
  'ZBK = Taş kömürü modernizasyonu + Filyos Projesi.'
);

-- Soru #120 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
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
  'Doğu Karadeniz Projesi (DOKAP) kapsamında bölgenin turizm potansiyelini canlandırmak amacıyla Samsun''dan Hopa''ya kadar yaylaları birbirine bağlayan devasa karayolu projesi hangisidir?',
  '{"options": ["Yeşil Yol Projesi", "İpek Yolu Projesi", "Kral Yolu Projesi", "Mavi Yol Projesi", "Tarihi Göç Yolu"], "correctIndex": 0}'::jsonb,
  'Yeşil Yol Projesi DOKAP bünyesinde Doğu Karadeniz yaylalarını (Ayder, Pokut, Uzungöl vb.) yüksek rakımdan birbirine bağlayarak yayla ve doğa turizmini kesintisiz hale getirmeyi hedefler.',
  'DOKAP + Yaylaların birleştirilmesi = Yeşil Yol Projesi.'
);

COMMIT;