-- =============================================================
-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM COĞRAFYA SORULARI (MASTER)
-- Toplam: 6 Konu x 40 Soru = 240 Özgün Soru
-- Hedef Tablo: public.questions (Supabase)
-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap
-- =============================================================
BEGIN;


-- -------------------------------------------------------------
-- KONU 1: TÜRKIYE'NIN COĞRAFI KONUMU
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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


-- -------------------------------------------------------------
-- KONU 2: TÜRKIYE'NIN YER ŞEKILLERI VE İKLIMI
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Türkiye arazisinin büyük bir bölümü III. ve IV. jeolojik zamanlarda (Tersiyer ve Kuaterner) meydana gelen orojenik ve epirojenik hareketlerle şekillenmiş genç oluşumlu bir ülkedir.

Aşağıdakilerden hangisi Türkiye''nin genç oluşumlu bir arazi yapısına sahip olduğunun doğrudan bir göstergesi değildir?',
  '{"options": ["Linyit, bor, tuz ve petrol yataklarının yaygın olması", "Deprem riskinin ve fay hatlarının geniş alan kaplaması", "Akarsuların denge profiline henüz ulaşmamış olması", "Jeotermal enerji potansiyeli ve sıcak su kaynaklarının zenginliği", "Taş kömürü yataklarının Zonguldak ve çevresinde bulunması"], "correctIndex": 4}'::jsonb,
  'Taş kömürü I. Jeolojik Zaman''da (Paleozoyik) oluşmuş yaşlı bir karbon yatağıdır. Dolayısıyla taş kömürünün varlığı genç oluşumlu olmanın değil, arazide eski (masif/paleozoyik) arazilerin de bulunduğunun kanıtıdır. Linyit, petrol, bor, kaplıcalar ve denge profiline ulaşmamış dik vadiler ise III. ve IV. zamanın (genç oluşumun) kanıtlarıdır.',
  'ÖSYM linyit ile taş kömürünü sınavlarda sıkça karşılaştırır. Linyit III. Zaman (genç), taş kömürü I. Zaman (yaşlı) arazisidir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Türkiye''de dağların uzanış doğrultusu iklim, ulaşım ve yerleşme üzerinde derin etkiler bırakmıştır.

Karadeniz ve Akdeniz kıyılarında dağların kıyı çizgisine paralel uzanması sonucunda aşağıdakilerden hangisinin gerçekleştiği söylenemez?',
  '{"options": ["Kıyı ile iç kesimler arasında iklim farklılığının belirginleşmesi", "Kıta sahanlığının (şelf alanının) genel olarak dar olması", "Falez (yalıyar) oluşumlarının yaygın olarak görülmesi", "Kıyı ile iç kesimler arasındaki kara yolu ulaşımının doğal geçitlerle sağlanması", "Kıyılarda koy, körfez, doğal liman ve adacık sayısının çok fazla olması"], "correctIndex": 4}'::jsonb,
  'Dağların kıyıya paralel uzandığı boyuna kıyılarda kıyı oldukça düz ve sadedir; koy, körfez, ada ve doğal liman sayısı çok azdır. Koy, körfez ve ada sayısının en fazla olduğu bölge dağların kıyıya dik uzandığı Ege kıyılarıdır (enine kıyı tipi).',
  'Adaylar Karadeniz ve Akdeniz''in kıyı uzunluğunu düşünüp koy ve körfezlerin buralarda da çok olduğunu zannedebilir. Oysa boyuna kıyıda doğal liman kıtlığı vardır (Sinop hariç).'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Akarsuların taşıdığı alüvyonları denize döküldükleri kıyılarda biriktirmesiyle delta ovaları oluşur.

Aşağıdaki akarsu ve oluşturduğu delta ovası eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Kızılırmak — Bafra Ovası", "Yeşilırmak — Çarşamba Ovası", "Seyhan ve Ceyhan — Çukurova", "Göksu — Silifke Ovası", "Gediz — Balat Ovası"], "correctIndex": 4}'::jsonb,
  'Gediz Nehri ''Menemen Deltası''nı oluşturur. ''Balat Deltası'' ise Büyük Menderes Nehri tarafından oluşturulmuştur (Küçük Menderes ise Selçuk Deltasını oluşturur).',
  'Ege''deki delta eşleşmeleri ÖSYM''nin klasik yoklama noktasıdır: Bakırçay -> Dikili, Gediz -> Menemen, Küçük Menderes -> Selçuk, Büyük Menderes -> Balat.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Kalker, jips ve kaya tuzu gibi suda kolay çözünebilen kayaçların bulunduğu sahalarda kimyasal çözünme sonucu karstik yer şekilleri meydana gelir.

Türkiye''de karstik şekillerin (lapya, dolin, uvala, polye, obruk, mağara) en yaygın olarak görüldüğü coğrafi bölge aşağıdakilerden hangisidir?',
  '{"options": ["Güneydoğu Anadolu Bölgesi", "Akdeniz Bölgesi (Toroslar Kuşağı)", "Doğu Anadolu Bölgesi", "İç Anadolu Bölgesi", "Doğu Karadeniz Bölümü"], "correctIndex": 1}'::jsonb,
  'Türkiye''de kireç taşı (kalker) arazisinin ve dolayısıyla karstik aşınım-birikim şekillerinin en tipik ve yaygın görüldüğü saha Akdeniz Bölgesi''nde Batı ve Orta Toroslar (Teke ve Taşeli platoları çevresi) kuşağıdır.',
  'Sivas çevresinde jips (alçı taşı), Çankırı''da kaya tuzu yaygın olsa da, Türkiye''de karst topoğrafyası denince akla gelen ana ve en geniş kuşak Akdeniz kireç taşı platosudur.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Türkiye''de heyelan olaylarının yaklaşık %65''i ilkbahar aylarında ve en çok Karadeniz Bölgesi''nde meydana gelmektedir.

Heyelanların özellikle ilkbahar aylarında yoğunlaşmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Rüzgar hızının ve fırtınaların bu mevsimde artması", "Kar erimeleri ile toprağın suya aşırı doyması ve killi tabakanın kayganlaşması", "İlkbaharda tarımsal faaliyetlerin ve toprak sürümünün başlaması", "Bitki örtüsünün ilkbaharda yaprak dökmesi", "Deprem sıklığının ilkbaharda artış göstermesi"], "correctIndex": 1}'::jsonb,
  'Karadeniz en çok yağışı sonbaharda almasına rağmen, heyelanların ilkbaharda zirve yapmasının nedeni; kış boyu biriken karların ilkbaharda erimesi, toprağın aşırı derecede suya doygun hale gelmesi ve killi tabakaların kayganlaşarak tabaka eğimi yönünde kaymasıdır.',
  'ÖSYM ''Karadeniz en çok yağışı sonbaharda alır, o halde heyelan da sonbaharda çoktur'' yanılgısını sınar. Cevap eriyen kar sularından ötürü ilkbahardır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Türkiye''yi kış mevsiminde kuzeydoğudan etkileyen, Sibirya üzerinden gelerek aşırı soğuk ve ayaz getiren termik kökenli yüksek basınç merkezi aşağıdakilerden hangisidir?',
  '{"options": ["İzlanda Dinamik Alçak Basıncı", "Asor Dinamik Yüksek Basıncı", "Sibirya Termik Yüksek Basıncı", "Basra Termik Alçak Basıncı", "Güneydoğu Alçak Basıncı"], "correctIndex": 2}'::jsonb,
  'Sibirya Termik Yüksek Basıncı (TYB), kış aylarında karasal soğumaya bağlı olarak güçlenir ve Türkiye''ye kuzeydoğudan sokularak kışların kuru, dondurucu soğuk ve ayaz geçmesine neden olur.',
  'İzlanda Dinamik Alçak Basıncı kışın ılık ve yağışlı hava getirirken; Sibirya Termik Yüksek Basıncı açık, ayaz ve dondurucu kuru soğuk getirir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'İç Anadolu Bölgesi''nde ilkbahar aylarında öğleden sonraları ısınan havanın yükselerek soğuması sonucu meydana gelen ve halk arasında ''kırkikindi'' olarak adlandırılan yağışlar hangi oluşum türüne aittir?',
  '{"options": ["Orografik (Yamaç) Yağışları", "Konveksiyonel (Yükselim) Yağışları", "Cephesel (Frontal) Yağışlar", "Siklonik Kasırga Yağışları", "Muson Yağışları"], "correctIndex": 1}'::jsonb,
  'Güneş ışınlarıyla ısınan havanın dikey doğrultuda yükselmesi ve soğuyarak yoğuşması sonucu oluşan yağışlara konveksiyonel (yükselim) yağış denir. İç Anadolu''da ilkbaharda görülen ''kırkikindi'' yağışları bunun en belirgin örneğidir.',
  'Karadeniz kıyılarında dağlara çarparak yükselen yağışlar orografik (yamaç); Türkiye geneli kış yağışları ise cephesel (frontal) karakterlidir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Akdeniz iklim bölgesinde kızılçam ormanlarının tahrip edilmesiyle oluşan kısa boylu, sert yapraklı ve kuraklığa dayanıklı bodur ağaççıklardan oluşan bitki topluluğuna ne ad verilir?',
  '{"options": ["Bozkır (Step)", "Maki", "Garig", "Psödömaki", "Alpin Çayır"], "correctIndex": 1}'::jsonb,
  'Kızılçam ormanlarının tahribatıyla zeytin, defne, mersin, keçiboynuzu, kermes meşesi gibi türlerden oluşan ''maki'' topluluğu ortaya çıkar. Makilerin de tahrip edilmesiyle ''garig'' (frigana) oluşur.',
  'Maki kızılçamın tahribiyle; garig ise makinin tahribiyle oluşur. Karadeniz''deki orman tahribi ise ''psödömaki'' (yalancı maki) oluşturur.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Türkiye''de rüzgarların yönleri ve etkileri dikkate alındığında, ülkemizi güneybatıdan etkileyen, kışın ılık ve nemli hava getirerek kar erimelerine ve soba zehirlenmelerine yol açan yerel rüzgar aşağıdakilerden hangisidir?',
  '{"options": ["Karayel", "Poyraz", "Lodos", "Samyeli (Keşişleme)", "Etezyen"], "correctIndex": 2}'::jsonb,
  'KAYIP SAKAL şifresine göre: Karayel (KD), Yıldız (K), Poyraz (KD) kuzeyden eserken; Samyeli (GD), Kıble (G), Lodos (GB) güneyden eser. Güneybatıdan esen Lodos; sıcak, nemli ve denizel olup kışın kar erimelerine, deniz ulaşımında aksamalara ve baca gazı/soba zehirlenmelerine neden olur.',
  'Samyeli (Keşişleme) güneydoğudan eser ve kuraklık/buharlaşma getirir; Lodos ise güneybatıdan eser ve ılık/fırtınalı yağışlı hava getirir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  1,
  'Türkiye''de göller oluşum kökenlerine göre doğal ve yapay set gölleri, tektonik, karstik, volkanik ve buzul gölleri olarak sınıflandırılır.

Aşağıdaki göllerden hangisi tektonik çanaklarda biriken sularla oluşmuş tektonik göllerden biri değildir?',
  '{"options": ["Tuz Gölü", "İznik Gölü", "Salda Gölü", "Beyşehir Gölü", "Sapanca Gölü"], "correctIndex": 2}'::jsonb,
  'Salda Gölü karstik kökenli bir göldür (ayrıca magnezyum hidromanyezit çökelleri içerir). Tuz, İznik, Beyşehir ve Sapanca gölleri ise tektonik çöküntü alanlarında yer alır (Beyşehir gölü tektono-karstik olmakla birlikte tabanı tektonik çanaktır).',
  'Burdur havzasındaki Salda, Kestel ve Avlan gibi göller karstik çanaklarda oluşurken; Manyas, Ulubat, İznik, Sapanca Kuzey Anadolu Fay Hattı üzerindeki tektonik çöküntülerdir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''deki masif araziler I. Jeolojik Zaman''da (Paleozoyik) başkalaşıma uğramış sert ve oturmuş kütlelerdir. Bu alanlarda faylanma ve deprem riski genç arazilere oranla düşüktür.

Aşağıda verilen yörelerden hangisi Türkiye''deki masif alanlar arasında yer almaz?',
  '{"options": ["Yıldız Dağları (Istranca) Masifi", "Saruhan - Menteşe Masifi", "Kırşehir Masifi", "Gediz - Büyük Menderes Grabeni", "Bitlis ve Mardin Masifleri"], "correctIndex": 3}'::jsonb,
  'Gediz ve Büyük Menderes grabenleri, Batı Anadolu Fay Sistemi (BAFS) üzerinde yer alan son derece genç, kırıklı ve I. derece deprem bölgesidir. Masif araziler ise Yıldız, Menteşe, Kırşehir, Bitlis, Mardin-Derik, Daday-Devrekani, Alanya-Anamur gibi oturmuş sert bloklardır.',
  'Menteşe yöresi bir masiftir ancak hemen yanı başındaki horst-graben olukları (Gediz, Menderes) aktif fayı temsil eder; adaylar Ege''deki kütleler ile graben düzlüklerini birbirine karıştırabilir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'I. Kaz Dağı — Edremit Grabeni
II. Madra Dağı — Bakırçay Grabeni
III. Yunt Dağı — Gediz Grabeni
IV. Bozdağlar — Küçük Menderes Grabeni
V. Erciyes Dağı — Develi Ovası

Yukarıdaki dağ-çöküntü alanı eşleştirmelerinden hangisi horst-graben sistemiyle açıklanamaz?',
  '{"options": ["I", "II", "III", "IV", "V"], "correctIndex": 4}'::jsonb,
  'Kaz, Madra, Yunt, Bozdağlar ve Aydın dağları sert tabakaların kırılmasıyla yükselen horstlar, aralarındaki Bakırçay, Gediz, Küçük ve Büyük Menderes olukları ise grabenlerdir. Erciyes Dağı ise kırılma ile değil, volkanik püskürmeler sonucu oluşan stratovolkanik bir volkan konisidir.',
  'Erciyes''in eteğindeki Develi ovası tektonik kökenli bir çöküntü havzası olsa da Erciyes Dağı bir horst değil, sönmüş bir volkan dağıdır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de platolar farklı jeolojik ve jeomorfolojik süreçlerle oluşmuştur.

Buna göre;
• Lav akıntılarının kalın tabakalar oluşturmasıyla meydana gelen bazalt platoları,
• Kolay çözünebilen kireç taşı arazisinin yüzey sularını alta geçirmesiyle kurak kalan platolar
örnekleri sırasıyla aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Haymana — Cihanbeyli", "Erzurum-Kars — Teke ve Taşeli", "Çatalca-Kocaeli — Bozok", "Taşeli — Erzurum-Kars", "Obruk — Gaziantep"], "correctIndex": 1}'::jsonb,
  'Lav örtüleriyle kaplı volkanik platolar Erzurum-Kars ve Ardahan platolarıdır. Yüzeyinde çatlak ve obruklar barındıran, suyu tabana sızdırdığı için yüzey suları fakir olan karstik kireç taşı platoları ise Teke ve Taşeli platolarıdır.',
  'Çatalca-Kocaeli aşınım platosudur; Haymana, Cihanbeyli, Bozok ve Obruk ise tabaka düzlüğü (yatay duruşlu) platolardır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Karadeniz kıyısında yer almasına rağmen Samsun ve çevresinde dağların geride ve basık (Canik Dağları) olması aşağıdakilerden hangisine yol açmamıştır?',
  '{"options": ["İç kesimlerle kara yolu ve demir yolu ulaşımının daha kolay sağlanmasına", "Kıta sahanlığının Doğu Karadeniz''e göre daha geniş olmasına", "Kızılırmak ve Yeşilırmak''ın Bafra ve Çarşamba deltalarını oluşturabilmesine", "Samsun il merkezinin Doğu ve Batı Karadeniz kıyılarına göre daha fazla yıllık yağış almasına", "İklimin iç kesimlere doğru daha rahat sokulabilmesine"], "correctIndex": 3}'::jsonb,
  'Canik Dağları kıyıdan uzakta ve yükseltisi az olduğu için denizden gelen nemli hava kütleleri dik bir engele çarpamaz. Bu nedenle Samsun''un yıllık yağış miktarı (yaklaşık 700 mm), arkasında yüksek dağlar bulunan Rize (2300 mm) veya Zonguldak''a (1200 mm) göre çok daha düşüktür.',
  'Adaylar Samsun''un Karadeniz''in büyük kenti olması sebebiyle çok yağış aldığını varsayar. Canik dağlarının alçaklığı yağış miktarını ciddi şekilde düşürür.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Bir akarsuyun aşındırma ve taşıma gücü akış hızı ve debisiyle doğrudan orantılıdır.

Türkiye akarsularının genel özellikleri düşünüldüğünde aşağıdakilerden hangisi söylenemez?',
  '{"options": ["Yatak eğimleri ve akış hızları fazladır.", "Hidroelektrik enerji potansiyelleri yüksektir.", "Taşımacılık ve ulaşıma elverişli akarsu sayısı oldukça fazladır.", "Genellikle dar ve derin vadi profillerine (çentik/boğaz) sahiptirler.", "Akımları (debileri) mevsimden mevsime belirgin dalgalanmalar gösterir."], "correctIndex": 2}'::jsonb,
  'Türkiye yüksek ve engebeli bir ülke olduğu için akarsular denge profiline ulaşmamıştır; rejimleri düzensiz, akış hızları yüksek ve debileri değişkendir. Bu nedenle (Bartın Çayı''nın küçük bir kısmı hariç) Türkiye akarsularında su yolu taşımacılığı yapılamaz.',
  'Türkiye''de sadece Bartın Çayı''nın ağız kısmında ufak tonajlı tekneler işler; akarsular genel olarak ulaşıma tamamen elverişsizdir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Heyelan set gölleri, vadilerin önünün heyelan sonucu kayan kütlelerle kapanmasıyla meydana gelir.

Aşağıdaki göllerden hangisi heyelan set gölüne örnek gösterilemez?',
  '{"options": ["Tortum Gölü", "Sera Gölü", "Abant Gölü", "Yedigöller", "Çıldır Gölü"], "correctIndex": 4}'::jsonb,
  'Çıldır Gölü (Ardahan-Kars) lav akıntılarının vadi önünü kapatmasıyla oluşan bir ''lav/volkanik set gölü''dür. Tortum (Erzurum), Sera (Trabzon), Abant ve Yedigöller (Bolu) ise tipik heyelan set gölleridir.',
  'Doğu Anadolu''daki Van, Erçek, Nazik, Çıldır, Balık ve Haçlı gölleri lav (volkanik) set gölüdür; Karadeniz''dekiler (Tortum, Sera, Abant, Boraboy, Zinav) ise heyelan set gölüdür.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de iklim çeşitliliğinin fazla olması toprak türlerinin de zenginleşmesini sağlamıştır.

Erzurum-Kars platosunda yaz yağışlarıyla yeşeren gür çayır örtüsü altında gelişen, organik madde (humus) bakımından Türkiye''nin en verimli yerli (zonal) toprağı aşağıdakilerden hangisidir?',
  '{"options": ["Terra Rossa (Kırmızı Akdeniz Toprağı)", "Çernezyom (Kara Toprak)", "Podzol", "Kahverengi Bozkır Toprağı", "Rendzina"], "correctIndex": 1}'::jsonb,
  'Çernezyom (kara toprak), yaz yağışlarıyla boy atan alpin çayırların sonbaharda çürümesiyle humusça son derece zenginleşen topraktır. Erzurum-Kars-Ardahan yöresinde görülür. Ancak iklim koşulları aşırı soğuk olduğu için bu verimli toprak tarımdan ziyade büyükbaş hayvancılıkta değerlendirilir.',
  'ÖSYM Çernezyom''un en verimli toprak olduğunu ancak iklim sertliğinden dolayı tarımda yeterince kullanılamadığını sıkça sorar.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Doğu Anadolu''da dağların zirvelerinde buzul şekilleri (sirk, hörgüçkaya, buzul vadisi) görülürken, Karadeniz ve Akdeniz''in de yüksek dağlarında buzul izlerine rastlanır.

Buna karşılık Uludağ (2543 m) üzerinde buzul şekilleri ve sirk çanakları bulunmasına rağmen, günümüzde aktif buzul kütlesinin bulunmamasının nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Batı rüzgarlarına kapalı bir yamaçta yer alması", "Yükseltisinin güncel kalıcı kar (toktağan kar) sınırına ulaşamaması", "Volkanik kökenli bir dağ olması sebebiyle yüzey sıcaklığının yüksek olması", "Karstik kayaçlardan oluştuğu için suları emmesi", "Yaz mevsiminde kuraklığın etkili olması"], "correctIndex": 1}'::jsonb,
  'Uludağ''ın yükseltisi (2543 m) IV. Zaman''daki buzul döneminde buzul oluşumuna yetmiştir ve o döneme ait sirk gölleri (Aynalı, Kilimli, Karagöl) mevcuttur. Ancak günümüz iklim koşullarında Batı Anadolu''da kalıcı kar sınırı 3000 metrenin üzerinde olduğundan Uludağ''da güncel (aktif) buzul yoktur.',
  'Uludağ''da buzul şekli/izi vardır fakat GÜNCEL BUZUL yoktur! Güncel buzul Kaçkar, Bolkar, Aladağlar, Erciyes, Ağrı, Süphan ve özellikle Cilo (Reşko) dağlarında bulunur.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Dağların bir yamacını aşıp diğer yamacından aşağıya doğru alçalan hava kütlesi her 100 metrede yaklaşık 1°C ısınarak fön (foehn) etkisi oluşturur.

Türkiye''de fön rüzgarlarının kış aylarında Rize ve çevresinde turunçgil, Iğdır ovasında ise pamuk yetiştirilebilmesini sağlayan temel katkısı aşağıdakilerden hangisidir?',
  '{"options": ["Nem açığını azaltarak bağıl nemi yükseltmesi", "Yerel bir mikroklima alanı oluşturarak kış donlarını ve soğuklarını engellemesi", "Yamaç yağışlarının miktarını olağanüstü artırması", "Rüzgar erozyonunu minimum seviyeye indirmesi", "Toprağın taban suyu seviyesini yükseltmesi"], "correctIndex": 1}'::jsonb,
  'Fön rüzgarı sürtünmeyle her 100 metrede 1°C ısınır, havayı kurutur ve sıcaklığı belirgin biçimde artırır. Bu durum Rize kıyısında turunçgil ve çay, Iğdır havzasında ise pamuk yetiştirilmesini mümkün kılan mikroklima ortamını sağlar.',
  'Fön rüzgarı yağış getirmez, aksine havayı kurutur ve nem açığını artırır! Şıklarda ''yağışı artırır'' çeldiricisine düşmemek gerekir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de kıyı tipleri incelendiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Karadeniz ve Akdeniz kıyılarında dağların kıyıya paralel uzandığı ''Boyuna Kıyı Tipi'' yaygındır.", "Ege kıyılarında dağların kıyıya dik uzandığı ''Enine Kıyı Tipi'' görülür.", "İstanbul ve Çanakkale Boğazları ile Haliç eski akarsu vadilerinin sular altında kalmasıyla oluşan ''Ria Tipi'' kıyılardır.", "Antalya-Kaş kıyılarında denize paralel uzanan adacıkların oluşturduğu ''Dalmaçya Tipi'' kıyılar görülür.", "İzmir ve Mersin kıyılarında gel-git genliğinin yüksek olmasına bağlı olarak ''Haliç ve Watt Tipi'' kıyılar gelişmiştir."], "correctIndex": 4}'::jsonb,
  'Türkiye okyanusa kıyısı olmayan bir iç deniz ülkesidir. İç denizlerde gel-git genliği çok az (20-40 cm) olduğundan Türkiye kıyılarında Haliç ve Watt tipi kıyılar OLUŞAMAZ. İstanbul''daki Haliç bir kıyı tipi haliç değil, Ria tipi vadi boğulmasıdır.',
  'İstanbul''daki ''Haliç'' (Altın Boynuz) isim benzerliğinden dolayı tuzaktır. Okyanus kenarı haliç (estuary) jeomorfolojik olarak Türkiye''de hiç yoktur.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'I. Göksu Nehri — Taşeli Platosu''nu derin kanyonlarla yarması
II. Çoruh Nehri — Dünyanın en hızlı akan ve aşındırma gücü yüksek nehirlerinden olması
III. Fırat ve Dicle — Doğu Anadolu''dan doğup Basra Körfezi''ne dökülmesi
IV. Meriç Nehri — Kaynağını Bulgaristan''dan alıp Ege Denizi''ne dökülmesi

Yukarıda verilen akarsulardan hangileri açık havza özelliği gösterir?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I, II ve III", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'Sularını deniz veya okyanuslara ulaştırabilen tüm akarsular açık havzalıdır. Göksu (Akdeniz), Çoruh (Karadeniz), Fırat-Dicle (Basra Körfezi/Hint Okyanusu) ve Meriç (Ege Denizi) sularını açık denizlere ulaştırdıkları için hepsi açık havzadır.',
  'Kapalı havzalar sularını denize ulaştıramayan göl veya bataklık havzalarıdır (Tuz Gölü, Van Gölü, Aras-Kura Hazar havzası, Göller Yöresi). Fırat ve Dicle sınır dışına çıksa da açık havzadır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de rüzgar aşındırma ve biriktirme şekillerine (mantarkaya, tafoni, kumul) en çok İç Anadolu (özellikle Konya-Karapınar) ve Güneydoğu Anadolu bölgelerinde rastlanır.

Bu durum üzerinde aşağıdakilerden hangisinin etkisi bulunmaz?',
  '{"options": ["Bitki örtüsünün cılız ve seyrek (bozkır) olması", "Fiziksel (mekanik) ufalanmanın şiddetli olması", "Toprağın nem oranının düşük ve gevşek yapılı olması", "Karstik kireç taşlarının suda hızla çözünerek mağaralar açması", "Yıllık yağış miktarının az ve buharlaşmanın fazla olması"], "correctIndex": 3}'::jsonb,
  'Karstik kireç taşlarının suda çözünmesi yer altı ve yer üstü sularının kimyasal sürecidir (karstlaşma). Rüzgar erozyonu ve rüzgar şekilleri ise kurak/yarı kurak iklim, gevşek taneli örtü, cılız bitki örtüsü ve fiziksel çözünme sonucunda meydana gelir.',
  'Rüzgar aşınımı mekanik ve kurak alan olayıdır; karstik çözünme ise Akdeniz''e özgü nem/su ve kalker etkileşimidir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de kıyıdan iç kesimlere gidildikçe sıcaklık farkları artar, kış sıcaklıkları düşer ve don olaylı gün sayısı fazlalaşır.

Aşağıdaki şehir çiftlerinden hangisinin ocak ayı sıcaklık ortalamaları arasındaki fark temelde ''karasallık ve yükselti'' faktörleriyle açıklanır?',
  '{"options": ["İzmir — Van", "Antalya — Sinop", "Mersin — Samsun", "Muğla — Çanakkale", "Trabzon — Rize"], "correctIndex": 0}'::jsonb,
  'İzmir ile Van yaklaşık aynı enlem derecelerinde (yaklaşık 38° K) yer almalarına rağmen; İzmir''de ocak ayı ortalaması +8°C iken Van''da -4°C civarındadır. Enlemleri aynı olduğundan bu farkın tek ve kesin nedeni Van''ın denizden uzak (karasal) ve yaklaşık 1750 metre daha yüksek olmasıdır.',
  'Antalya-Sinop veya Mersin-Samsun kıyaslamasında enlem farkı belirleyicidir. İzmir-Van ise aynı enlemde oldukları için karasallık ve yükseltiyi net kanıtlar.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Akdeniz kıyılarında yaygın olarak görülen Terra Rossa (kırmızı renkli Akdeniz) topraklarının renginin karakteristik olarak kırmızı olmasının nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Bünyesinde bol miktarda kireç ve kalsiyum karbonat bulunması", "İçerdiği demir minerallerinin sıcak ve nemli koşullarda oksitlenmesi (paslanması)", "Organik madde ve humus oranının çok yüksek olması", "Volkanik bazalt küllerinden beslenmiş olması", "Aşırı tuz ve jips birikimi yaşaması"], "correctIndex": 1}'::jsonb,
  'Terra Rossa toprakları kalker (kireç taşı) üzerinde oluşur; ancak kırmızı rengini kireçten değil, bünyesindeki demir (Fe) bileşiklerinin sıcak ve oksijenli ortamda oksitlenerek pas rengini almasından kazanır. Humusça fakirdir.',
  'Adaylar kireç taşında oluştuğu için rengi kireçten alıyor sanabilir. Kireç beyazdır; kırmızı renk demir oksitten (Fe2O3) gelir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Aşağıdaki göllerden hangisi bir koy ya da körfez önünün dalga ve akıntıların taşıdığı kumullarla (kıyı kordonu) kapatılması sonucu oluşan ''kıyı set gölü'' (lagün) niteliğindedir?',
  '{"options": ["Büyükçekmece ve Terkos (Durusu)", "Mogan ve Eymir", "Bafa (Çamiçi) ve Köyceğiz", "Ulubat ve Manyas", "Hazar ve Nemrut"], "correctIndex": 0}'::jsonb,
  'Marmara kıyılarındaki Büyükçekmece, Küçükçekmece ve Terkos (Durusu) gölleri koyların önünün kıyı kordonuyla kapanmasıyla oluşan tipik kıyı set (lagün) gölleridir. Mogan, Eymir ve Bafa alüvyal settir; Manyas tektoniktir.',
  'Mogan-Eymir akarsuların kendi getirdiği alüvyonlarla oluşur (alüvyal set). Kıyı set göllerinde ise set dalga ve kıyı kordonudur.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'I. Çarşamba Ovası
II. Elmalı Ovası
III. Tefenni Ovası
IV. Erbaa Ovası

Yukarıda verilen ovalardan hangileri karstik erime sonucu oluşmuş ''polye'' (karstik ova) niteliğindedir?',
  '{"options": ["I ve IV", "II ve III", "I ve III", "II ve IV", "III ve IV"], "correctIndex": 1}'::jsonb,
  'Polye ovaları (karstik ovalar) TAKKE şifresiyle hatırlanır: Tefenni, Acıpayam, Korkuteli, Kestel, Elmalı, Muğla ovaları. Dolayısıyla II (Elmalı) ve III (Tefenni) polyedir. Çarşamba deltadır; Erbaa ise Kuzey Anadolu Fay Hattı üzerindeki tektonik çöküntü ovasıdır.',
  'ÖSYM TAKKE formülündeki polye ovalarını tektonik ovalarla karıştırmanızı bekler. Tefenni ve Elmalı kesinlikle karstik polyedir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de ormanların deniz seviyesinden başlayabildiği tek kıyı bölgesi Karadeniz Bölgesi''dir.

Karadeniz Bölgesi''nde orman alt sınırının deniz seviyesinden (0 metre) başlayabilmesini sağlayan temel etken aşağıdakilerden hangisidir?',
  '{"options": ["Güneşlenme süresinin fazla olması", "Yıllık yağış miktarının fazla ve her mevsimin yağışlı (bağıl nemin yüksek) olması", "Karasallık şiddetinin yüksek olması", "Kuzey rüzgarlarına tamamen kapalı bulunması", "Kalkerli arazinin yaygın yer tutması"], "correctIndex": 1}'::jsonb,
  'Orman ALT sınırını belirleyen temel faktör nem ve yağıştır. Karadeniz''de her mevsim yağışlı geçtiği ve bağıl nem yüksek olduğu için ağaçlar sıfır metreden itibaren yetişir. Akdeniz''de ise yaz kuraklığı yüzünden orman alt sınırı deniz seviyesinden değil, makilerden sonra (yaklaşık 600-800 m) başlar.',
  'Orman ÜST sınırını sıcaklık (enlem/yükselti) belirlerken; orman ALT sınırını nem ve yağış belirler! Bu ayrım ÖSYM''nin en sevdiği sorular arasındadır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de dağların zirvelerinde veya kıyılarında dalga aşındırmasıyla oluşan yeryüzü şekilleri bulunmaktadır.

Buna göre kıyı kordonunun bir adayı karaya bağlamasıyla oluşan ''saplı ada'' (tombolo) oluşumunun Türkiye''deki en tipik iki örneği aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Kapıdağ Yarımadası — Sinop İnceburun", "Gelibolu Yarımadası — Datça Yarımadası", "Bozburun — Çeşme Yarımadası", "Biga Yarımadası — Bodrum Yarımadası", "Dilek Yarımadası — Karaburun"], "correctIndex": 0}'::jsonb,
  'Dalgaların kıyı boyunca taşıdığı kumulların kıyıya yakın bir adayı anakaraya bağlamasıyla oluşan şekle ''tombolo'' (saplı ada) denir. Türkiye''deki en belirgin tombolo örnekleri Marmara Denizi''ndeki Kapıdağ Yarımadası ve Sinop Boztepe/İnceburun Yarımadası''dır.',
  'Kapıdağ ve Sinop yarımadaları aslında eskiden birer ada iken dalga biriktirmesi (tombolo) ile karaya bağlanmıştır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de akarsuların hidroelektrik enerji potansiyeli bölgelere göre büyük farklılıklar gösterir.

Aşağıdaki akarsulardan hangisinin üzerinde hidroelektrik enerji üretimi amacıyla büyük barajlar kurulması topoğrafik şartlar nedeniyle diğerlerine göre daha az uygundur?',
  '{"options": ["Fırat Nehri", "Çoruh Nehri", "Ergene Nehri", "Dicle Nehri", "Manavgat Çayı"], "correctIndex": 2}'::jsonb,
  'Ergene Nehri Marmara Bölgesi''nde (Trakya) yükseltisi 100 metreyi bile bulmayan çok düz bir tabanda, menderesler çizerek yavaş akar. Yatak eğimi ve akış hızı çok düşük olduğundan hidroelektrik enerji potansiyeli neredeyse sıfırdır.',
  'Fırat, Çoruh ve Dicle yüksek debili ve dik vadili nehirlerdir. Ergene ise Türkiye''de akış hızı ve eğimi en az olan nehirlerdendir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de kurak ve yarı kurak bölgelerde ilkbaharda yeşerip yaz kuraklığıyla sararan ot topluluklarına bozkır (step) adı verilir. Bozkır alanlarında yer yer antropojen bozkırlara da rastlanır.

''Antropojen bozkır'' kavramı aşağıdakilerden hangisini ifade eder?',
  '{"options": ["Yüksek dağ zirvelerinde soğuktan ötürü ağaç yetişmeyen alanları", "Ormanların insanlar tarafından tahrip edilmesi sonucu ağaçsız kalan yerlerde oluşan otsu örtüyü", "Tuzlu bataklık çevrelerinde yetişen kurakçıl bitkileri", "Akdeniz''de kızılçamların yanmasıyla çıkan bodur çalıları", "Volkanik arazilerde lav akıntılarının soğumasıyla oluşan bitki örtüsünü"], "correctIndex": 1}'::jsonb,
  'İç Anadolu, Doğu Anadolu ve Ergene gibi karasal bölgelerde geçmişte var olan ormanların aşırı otlatma, yakılma ve tarla açma amacıyla insanlar (antropo) tarafından tahrip edilmesi sonucu yerini alan bozkırlara ''antropojen bozkır'' denir.',
  'Maki Akdeniz ormanlarının tahribiyle; psödömaki Karadeniz ormanlarının tahribiyle; antropojen bozkır ise karasal iç kesim ormanlarının insan tahribiyle oluşur.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Türkiye''de akarsuların denge profiline ulaşmadığının en somut kanıtlarından biri vadilerinde görülen aşındırma basamakları ve mendereslerin içerisindeki gömük vadilerdir.

Ege Bölgesi''ndeki Büyük Menderes akarsuyu geniş tabanlı bir vadide kıvrımlar yaparak akarken, bazı kısımlarında yatağını derine doğru kazarak ''gömük menderes'' (epijenik vadi) profili kazanmıştır.

Bir akarsuyun menderes çizerken yeniden derine aşındırma yapmaya başlaması aşağıdakilerden hangisinin gerçekleştiğinin kesin kanıtıdır?',
  '{"options": ["Bölgede ani bir iklim değişikliğiyle yağışların kuraklaşmasının", "Akarsu havzasının epirojenik hareketlerle toptan yükselmesinin (taban seviyesinin düşmesinin)", "Havzada rüzgar erozyonunun şiddetlenmesinin", "Akarsuyun kapalı bir göle dökülmeye başlamasının", "Kıta sahanlığının genişleyerek denizin sığlaşmasının"], "correctIndex": 1}'::jsonb,
  'Menderes çizen bir akarsu taban seviyesine yaklaşmış demektir. Eğer menderes büklümleri korunarak vadi derine doğru yarılmaya başlıyorsa (gömük menderes / yarma vadi), arazi epirojenik olarak toptan yükselmiş (veya deniz seviyesi alçalmış), böylece akarsuyun aşındırma enerjisi yeniden canlanmıştır.',
  'Menderes görünce adaylar arazinin sadece düz olduğunu düşünür. Gömük menderes ise arazinin toptan yükseldiğinin (epirojenez) en güçlü jeomorfolojik delilidir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Karadeniz kıyı kuşağında yer almalarına rağmen Rize ile Sinop arasında yıllık yağış miktarı bakımından yaklaşık 3 kat fark (Rize ~2300 mm, Sinop ~700 mm) bulunmaktadır.

Sinop''un Rize''ye göre belirgin şekilde daha az yağış almasının temel morfolojik nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Sinop''un mutlak konum olarak daha batıda yer alması", "Sinop gerisindeki Küre Dağları''nın kıyıya dik uzanması", "Sinop gerisindeki İsfendiyar (Küre) Dağları''nın yükseltisinin Rize''deki Kaçkar Dağları''na göre çok daha basık olması ve nemli rüzgarları tutamaması", "Sinop''ta hakim rüzgar yönünün yalnızca güney sektörlü olması", "Sinop''ta bitki örtüsünün bozkır özelliği göstermesi"], "correctIndex": 2}'::jsonb,
  'Rize''nin arkasındaki Kaçkar Dağları hemen kıyıdan dimdik yükselir ve 4000 metreye yaklaşan heybetiyle denizden gelen tüm nemi yamaç yağışına dönüştürür. Sinop gerisindeki Küre Dağları ise kıyıdan daha içeride başlar ve yükseltisi Kaçkarların yarısı kadardır; bu yüzden hava kütleleri yükselip yoğunlaşamadan iç kesimlere süzülür.',
  'Küre Dağları kıyıya dik uzanmaz (paraleldir). Az yağışın nedeni dağların uzanış yönü değil; basık olması ve kıyı gerisindeki yükseltinin Kaçkarlar kadar olmamasıdır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Aşağıdaki göllerden hangisi hem tektonik hareketlerle çöken bir graben tabanında yer almakta hem de göl tabanından çıkan ve göle karışan karstik düden ve kaynaklarla beslenip boşalan ''tektono-karstik'' karma yapılı bir göldür?',
  '{"options": ["Meke Gölü", "Nemrut Gölü", "Eğirdir ve Beyşehir Gölleri", "Terkos Gölü", "Tortum Gölü"], "correctIndex": 2}'::jsonb,
  'Göller Yöresi''nde bulunan Beyşehir ve Eğirdir gölleri, tektonik çöküntü havzaları üzerinde oluşmuş olmalarına karşın kalker arazideki düdenler, yer altı kaynakları ve karstik erimelerle şekillenmiş karma yapılı (tektono-karstik) göllerdir.',
  'Göller Yöresi gölleri sadece tektonik veya sadece karstik olarak etiketlenemez; ÖSYM bunların karma (tektono-karstik) oluşumlu olduğunu sınar.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Türkiye''de kış mevsiminde kar örtüsünün yerde kalma süresi ve kar kalınlığı bölgeler arasında büyük tezatlar oluşturur.

Aşağıdaki merkezlerden hangisinde kışın kar örtüsünün yerde kalma süresinin en uzun olması beklenir?',
  '{"options": ["Bolu (1000 m)", "Kastamonu (800 m)", "Ardahan (1800 m)", "Konya (1020 m)", "Kayseri (1050 m)"], "correctIndex": 2}'::jsonb,
  'Ardahan, Kuzeydoğu Anadolu''da yaklaşık 1800 metre rakımda yer alan sert karasal iklim merkezidir. Sibirya Yüksek Basıncı''nın doğrudan etkisi altında kaldığı için kış sıcaklıkları -30°C''lere iner ve kar örtüsü yılda 120-150 gün yerde kalır.',
  'Konya ve Bolu soğuk olsa da Ardahan ve Kars''ın sert karasal yüksek platosu Türkiye''de karın yerde en uzun süre kaldığı sahadır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Güneydoğu Anadolu Bölgesi''nin yıllık yağış miktarı (yaklaşık 500-600 mm), İç Anadolu Bölgesi''nin yıllık yağış miktarından (yaklaşık 350-400 mm) belirgin şekilde daha fazladır.

Buna rağmen Güneydoğu Anadolu Bölgesi''nde kuraklığın ve tarımsal sulama ihtiyacının İç Anadolu''dan çok daha şiddetli hissedilmesinin temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Güneydoğu''da tarım alanlarının daha geniş yer kaplaması", "Güneydoğu''nun yazın Basra Termik Alçak Basıncı ve Samyeli etkisiyle aşırı sıcak olması ve potansiyel buharlaşmanın yağışın katbekat üzerine çıkması", "İç Anadolu''da yer altı su seviyesinin yüzeye çok yakın olması", "Güneydoğu Anadolu''da akarsu bulunmaması", "Güneydoğu''da kış aylarında kar yağışının hiç görülmemesi"], "correctIndex": 1}'::jsonb,
  'Güneydoğu Anadolu İç Anadolu''dan daha çok yağış almasına rağmen, yazın güneyden gelen Samyeli (Keşişleme) rüzgarı ve Basra Termik Alçak Basıncı''nın etkisiyle Türkiye''nin en yüksek yaz sıcaklıklarına ve en şiddetli buharlaşma oranına (şiddetli kuraklığa) maruz kalır.',
  'En az yağış alan yer İç Anadolu (Konya/Tuz Gölü çevresi) olmasına rağmen, en şiddetli buharlaşma ve kuraklık Güneydoğu Anadolu''dadır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'I. Çukurova Deltası''nda kış ılıklığı sayesinde yılda birden fazla ürün alınabilmesi
II. Ergene Havzası''nda kışların don olaylı ve sisli geçmesi
III. Doğu Karadeniz Dağları''nın kuzey yamaçlarının güney yamaçlarına göre daha yoğun orman örtüsüne sahip olması

Yukarıdaki durumlardan hangileri ''bakı'' faktörünün iklim ve bitki örtüsü üzerindeki genel kuralıyla ÇELİŞKİLİ bir durum ortaya koyar?',
  '{"options": ["Yalnız I", "Yalnız III", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'Normal bakı kuralına göre Kuzey Yarım Küre''de dağların güney yamaçları daha çok güneş alır, daha sıcaktır ve ağaç üst sınırı daha yüksektir. Ancak Karadeniz''de kuzey yamaçlar denize baktığı için nem ve yağış alır ve ormanlar kuzey yamaçta güneye göre çok daha gürdür. Bu durum bakı kuralına ters düşen denizellik-nemlilik istisnasıdır.',
  'ÖSYM Karadeniz dağlarının kuzey yamacının daha gür ormanla kaplı olmasını ''bakı kuralı ile açıklanamayan denizellik istisnası'' olarak sıkça sorar.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Türkiye''de relikt (kalıntı) ve endemik bitki türleri zengin bir çeşitlilik sunar. Jeolojik geçmişteki iklim koşullarından günümüze ulaşan kalıntı türlere ''relikt bitki'' denir.

Aşağıdakilerden hangisi Türkiye''de buzul ve buzul arası dönemlerin iklim koşullarından günümüze kadar ulaşmış relikt bir bitki örneğidir?',
  '{"options": ["Köknar ve ladin ormanlarının Karadeniz dışındaki Amanos ve Toros vadilerinde kalıntı olarak yaşaması", "İç Anadolu''daki geven ve sığırkuyruğu otları", "Ege kıyılarındaki zeytinlikler", "Güneydoğu Anadolu''daki fıstık ağaçları", "Trakya''daki ayçiçeği tarlaları"], "correctIndex": 0}'::jsonb,
  'Buzul çağlarında Anadolu''nun güneyine kadar inen soğuk ve nemli iklim bitkileri (kayın, ıhlamur, göknar), iklim ısındıktan sonra Toroslar ve Amanos dağlarının serin ve nemli derin kanyonlarında varlıklarını sürdürerek ''relikt'' (kalıntı) olarak kalmıştır.',
  'Endemik bitki dünyada sadece tek bir dar alanda yetişen türdür (Köyceğiz''de Sığla ağacı, Göller Yöresinde Kasnak meşesi). Relikt ise geçmiş iklimlerin kalıntısıdır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Türkiye arazisinde yer alan plato ve ova yüzeylerinde görülen toprak tipleri değerlendirildiğinde;

• Eski göl tabanlarında veya killi arazilerde kurak dönemde yarılan, yağışlı dönemde şişerek içindeki taşları yüzeye fırlatan ''dönen toprak'' (vertisol / karakepir),
• Genellikle volkanik tüf ve kumlu depolar üzerinde gelişen, tarımsal olarak patates ve yumrulu bitki yetiştiriciliğine çok uygun olan ''regosol''
topraklar en karakteristik olarak sırasıyla hangi yörelerimizde yaygındır?',
  '{"options": ["Ergene Havzası — Nevşehir-Kapadokya Yöresi", "Taşeli Platosu — Çukurova", "Bafra Deltası — Sivas Havzası", "Konya Ovası — Rize Kıyıları", "Menteşe Yöresi — Erzurum Platosu"], "correctIndex": 0}'::jsonb,
  'Vertisoller (dönen toprak / kepir / taş doğuran), killi depoların bulunduğu Trakya (Ergene Havzası), Muş Ovası ve Konya kapalı havzasında yaygındır. Volkanik tüf ve kum üzerinde gelişen aşırı geçirgen regosoller ise Nevşehir, Niğde ve Ürgüp yöresinde yaygın olup patates tarımı için çok elverişlidir.',
  'Vertisol = Ergene ve kepir; Regosol = Nevşehir volkanik tüfleri ve patates! Bu iki toprak ÖSYM''nin zor soru bankasının vazgeçilmezidir.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'Türkiye''de karstik arazilerde yer altı su seviyesinin tabana inmesiyle mağara tavanlarının aniden çökmesi sonucu devasa derinlikte çukurlar (obruk) meydana gelir.

Son yıllarda Konya-Karapınar ve Obruk Platosu çevresinde obruk oluşumlarının olağanüstü hızlanmasının temel beşeri ve hidrolojik sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede orman varlığının aşırı derecede artması", "Aşırı ve kaçak yer altı suyu çekimiyle taban suyunun hızla boşalması ve mağara tavanlarının dayanıksızlaşması", "Tuz Gölü''nün taşarak bölgeyi sular altında bırakması", "Bölgede sık sık volkanik magma patlamaları yaşanması", "Karasal iklimin yerini tropikal muson iklimine bırakması"], "correctIndex": 1}'::jsonb,
  'Konya kapalı havzasında yoğun su tüketen sanayi bitkilerinin (şeker pancarı, mısır, yonca) ekiminin artması sebebiyle yüz binlerce kaçak kuyuyla yer altı suları aşırı çekilmiştir. Boşalan karstik mağara tavanları üstündeki toprağı taşıyamayarak çökmekte ve tarım arazilerinde tehlikeli obruklar açılmaktadır.',
  'Doğal obruklar binlerce yılda oluşurken, günümüzdeki patlama tamamen bilinçsiz tarımsal sulama ve taban suyunun tüketilmesi kaynaklıdır.'
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
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  3,
  'I. Çoruh Nehri
II. Zap Suyu
III. Asi Nehri
IV. Meriç Nehri

Yukarıdaki akarsulardan hangileri Türkiye sınırları içinde doğup ülke sınırlarını aşarak yabancı bir devletin denizine veya körfezine dökülen nehirler grubundadır?',
  '{"options": ["I ve II", "III ve IV", "I ve III", "II ve IV", "I, II ve III"], "correctIndex": 0}'::jsonb,
  'Çoruh Nehri Türkiye''den doğar ve Gürcistan''dan Karadeniz''e dökülür. Zap Suyu Hakkari''den doğar ve Irak''a geçerek Dicle''ye karışır (Fırat, Dicle, Aras, Kura da böyledir). Buna karşılık Asi (Lübnan/Suriye''den doğar) ve Meriç (Bulgaristan''dan doğar) sınır dışından Türkiye''ye giren nehirlerdir.',
  'ÖSYM sınır aşan akarsularda yönü sınar: ''Bizden doğup dışarı gidenler'' (Fırat, Dicle, Çoruh, Aras, Kura, Zap) vs ''Dışarıdan doğup bize gelenler'' (Asi, Meriç).'
);


-- -------------------------------------------------------------
-- KONU 3: TÜRKIYE'DE NÜFUS VE YERLEŞME
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
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Cumhuriyet döneminde Türkiye''de ilk genel nüfus sayımı hangi yılda yapılmıştır?',
  '{"options": ["1923", "1927", "1935", "1940", "1950"], "correctIndex": 1}'::jsonb,
  'Cumhuriyet tarihinin ilk resmi genel nüfus sayımı 28 Ekim 1927 tarihinde gerçekleştirilmiş ve Türkiye nüfusu 13.6 milyon olarak tespit edilmiştir. İkinci sayım 1935''te yapılmış ve bundan sonra 1990''a kadar her 5 yılda bir tekrarlanmıştır.',
  'Cumhuriyet 1923''te ilan edilse de ilk nüfus sayımı savaştan yeni çıkmış ülkenin toparlanması beklenerek 1927 yılında yapılabilmiştir.'
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
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''nin nüfus artış hızı grafiği incelendiğinde, nüfus artış hızının Cumhuriyet tarihinin en düşük seviyesine (yaklaşık binde 10,5) gerilediği dönem aşağıdakilerden hangisidir?',
  '{"options": ["1927 - 1935 Dönemi", "1940 - 1945 Dönemi", "1955 - 1960 Dönemi", "1970 - 1975 Dönemi", "1995 - 2000 Dönemi"], "correctIndex": 1}'::jsonb,
  '1940-1945 yılları arasında II. Dünya Savaşı tehlikesi nedeniyle Türkiye savaşa fiilen girmese de genel seferberlik ilan etmiş, genç erkek nüfus uzun süre silah altına alınmıştır. Bu durum evlilik ve doğum oranlarını düşürmüş, nüfus artış hızını tarihi dip seviyeye çekmiştir.',
  'Nüfus artış hızı düşmüştür ancak toplam nüfus miktarı azalmamıştır! Artış hızı binde 10 bile olsa nüfus büyümeye devam etmiştir.'
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
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Toplam nüfusun ülkenin veya bir bölgenin yüz ölçümüne bölünmesiyle elde edilen nüfus yoğunluğuna ne ad verilir?',
  '{"options": ["Fizyolojik Nüfus Yoğunluğu", "Tarımsal Nüfus Yoğunluğu", "Aritmetik Nüfus Yoğunluğu", "Ekonomik Nüfus Yoğunluğu", "Kentsel Nüfus Yoğunluğu"], "correctIndex": 2}'::jsonb,
  'Toplam Nüfus / Toplam Yüzölçümü formülüyle hesaplanan ve km²''ye düşen kişi sayısını ifade eden kavrama ''Aritmetik Nüfus Yoğunluğu'' denir.',
  'Fizyolojik yoğunluk toplam nüfusun ''tarım alanlarına'' bölünmesiyle; tarımsal yoğunluk ise sadece ''tarımla uğraşan nüfusun'' tarım alanlarına bölünmesiyle bulunur.'
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
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''de aritmetik nüfus yoğunluğunun en fazla olduğu coğrafi bölge aşağıdakilerden hangisidir?',
  '{"options": ["Ege Bölgesi", "Akdeniz Bölgesi", "Marmara Bölgesi", "İç Anadolu Bölgesi", "Güneydoğu Anadolu Bölgesi"], "correctIndex": 2}'::jsonb,
  'Marmara Bölgesi, yüz ölçümü bakımından Türkiye''nin en küçük ikinci bölgesi olmasına rağmen İstanbul, Kocaeli, Bursa gibi dev metropol ve sanayi kentlerini barındırdığı için km²''ye düşen kişi sayısının (aritmetik nüfus yoğunluğunun) en yüksek olduğu bölgedir.',
  'İç Anadolu ve Doğu Anadolu yüz ölçümü çok geniş olduğu için nüfus yoğunlukları düşüktür; Doğu Anadolu aritmetik yoğunluğun en düşük olduğu bölgedir.'
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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


-- -------------------------------------------------------------
-- KONU 4: TÜRKIYE'DE TARIM VE HAYVANCILIK
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
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  1,
  'Türkiye''de tarımda verimi artırmanın ve üretimi iklim dalgalanmalarından kurtarmanın en temel yolu aşağıdakilerden hangisidir?',
  '{"options": ["Tarım arazilerinin yüz ölçümünü sürekli genişletmek", "Sulama imkanlarını yaygınlaştırmak", "Tarımsal ilaç kullanımını katbekat artırmak", "Kırsalda çalışan insan sayısını çoğaltmak", "Tarlaları iki yılda bir nadasa bırakmak"], "correctIndex": 1}'::jsonb,
  'Türkiye tarımının en kronik sorunu kuraklık ve yaz mevsiminde su yetersizliğidir. Sulama imkanları çözüldüğünde; üretimdeki yıllık dalgalanmalar sona erer, nadas uygulaması biter, birim alandan alınan verim tavan yapar ve yılda birden fazla hasat alınabilir.',
  'Tarım arazisini genişletmek (ekstansif) verimi artırmaz; modern tarımın (entansif) temel kilidi sulamadır.'
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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


-- -------------------------------------------------------------
-- KONU 5: MADENLER VE ENERJI KAYNAKLARI
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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


-- -------------------------------------------------------------
-- KONU 6: SANAYI, TICARET VE ULAŞIM
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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

insert into public.questions (
  lesson,
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
