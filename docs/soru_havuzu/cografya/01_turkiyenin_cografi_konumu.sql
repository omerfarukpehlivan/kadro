-- =============================================================
-- KPSS COĞRAFYA — KONU 1: TÜRKIYE'NIN COĞRAFI KONUMU
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

COMMIT;
