-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Türkiye'nin Coğrafi Konumu
-- Kaynak: docs/konu_anlatimi/cografya/01_turkiyenin_cografi_konumu.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================

begin;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'cografya.turkiye_nin_cografi_konumu.01',
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  1,
  'Bölüm 1: Mutlak (Matematik) Konum, Enlem ve Etkileri',
  'Bir yerin Dünya üzerindeki paralel (enlem) ve meridyen (boylam) dereceleriyle ifade edilen konumuna mutlak (matematik) konum denir.  Türkiye, 36°–42° Kuzey paralelleri ile 26°–45° Doğu meridyenleri arasında yer almaktadır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir yerin Dünya üzerindeki paralel (enlem) ve meridyen (boylam) dereceleriyle ifade edilen konumuna **mutlak (matematik) konum** denir. Türkiye, **36°–42° Kuzey paralelleri** ile **26°–45° Doğu meridyenleri** arasında yer almaktadır. Yalnızca bu koordinatlara bakarak Türkiye''nin Başlangıç Meridyeni''nin (Greenwich) doğusunda, Ekvator''un kuzeyinde (Kuzey Yarım Küre''de), Yengeç Dönencesi''nin (23° 27'' K) kuzeyinde ve Orta Kuşak''ta yer aldığını kesin olarak söyleyebilirsin. Buna karşılık Türkiye''nin ortalama yükseltisinin fazla olması, batıdan doğuya doğru yükseltinin artması, üç tarafının denizlerle çevrili olması veya yer altı kaynakları paralel-meridyen derecelerinden çıkarılamaz; bunlar göreceli (özel) konumun sonuçlarıdır."
  },
  {
    "type": "paragraph",
    "text": "Türkiye''nin **Yengeç Dönencesi''nin kuzeyinde** bulunmasının iki mutlak matematiksel sonucu vardır: Güneş ışınları Türkiye''nin en güney noktası olan Hatay''a dahi yılın hiçbir gününde 90° dik açıyla düşmez (en büyük açısını 21 Haziran''da yaklaşık 77° ile alır); dolayısıyla düz zeminlerde yatay cisimlerin gölge boyu hiçbir zaman sıfır olmaz ve öğle vakti gölge yönü yılın 365 günü daima **kuzeyi** gösterir. Ayrıca Türkiye **Orta Kuşak**''ta yer aldığı için yıl içinde dört mevsim belirgin biçimde peş peşe yaşanır, Batı rüzgârlarının etkisinde kalır, cephe (frontal) yağışları görülür ve Akdeniz iklim kuşağı içinde yer alır."
  },
  {
    "type": "paragraph",
    "text": "Enlem derecesinin güneyden kuzeye (Hatay''dan Sinop''a) doğru artması da düzenli değişimler doğurur: Güneş ışınlarının geliş açısı daraldığı için sıcaklık ortalamaları azalır, deniz suyu sıcaklığı ve buharlaşma düştüğünden **Akdeniz''in tuzluluk oranı (yaklaşık ‰38)** kuzeydeki **Karadeniz''den (yaklaşık ‰18)** çok daha yüksektir. Dünya''nın ekseni etrafındaki **çizgisel dönüş hızı** Ekvator''dan kutuplara doğru azaldığı için Hatay''da en yüksek, Sinop''ta en düşüktür; bu nedenle Güneş''in ufuktan doğuş ve batış süresi olan **alacakaranlık (grup ve tan) süresi** çizgisel hızla ters orantılı olarak kuzeye gidildikçe uzar ve en uzun Sinop''ta yaşanır. Buna karşılık Dünya kutuplardan basık (geoit) olduğundan yerin merkezine yakınlaşan kutuplara doğru **yerçekimi** artar; yani Sinop''ta yerçekimi Hatay''dan fazladır. Kuzey Yarım Küre''de bulunmamız sebebiyle kuzeyden esen rüzgârlar (Karayel, Yıldız, Poyraz) sıcaklığı düşürürken, güneyden esen rüzgârlar (Samyeli, Kıble, Lodos) sıcaklığı artırır."
  },
  {
    "type": "table",
    "headers": [
      "Özellik",
      "Güneyden Kuzeye (Hatay → Sinop) Değişim",
      "Temel Neden"
    ],
    "rows": [
      [
        "Güneş Işınlarının Geliş Açısı",
        "Daralır (küçülür)",
        "Enlem / Dünya''nın şekli"
      ],
      [
        "Sıcaklık ve Deniz Tuzluluğu",
        "Azalır (Akdeniz ‰38 → Karadeniz ‰18)",
        "Enlem / buharlaşma farkı"
      ],
      [
        "Çizgisel Hız",
        "Azalır (Hatay en hızlı, Sinop en yavaş)",
        "Enlem / paralel çevresi"
      ],
      [
        "Grup ve Tan (Alacakaranlık) Süresi",
        "Uzar (en uzun Sinop''ta izlenir)",
        "Çizgisel hızın azalması"
      ],
      [
        "Yerçekimi ve Gölge Boyu",
        "Artar",
        "Geoit şekli / Güneş açısı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Türkiye''nin **Orta Kuşak**''ta yer almasının dört kesin sonucunu **A-B-C-D** şeklinde kodla: - **A**kdeniz iklim kuşağında yer alması - **B**atı rüzgârlarının etkisinde bulunması - **C**ephe (frontal) yağışlarının görülmesi - **D**ört mevsimin yıl içinde belirgin yaşanması"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Enlem çözümlemesi: Çizgisel hızı, grup-tan süresi, gece-gündüz süre farkı ve belirli bir tarihte Güneş ışınlarının geliş açısı eşit olan iki merkez mutlaka **aynı enlem** üzerindedir. Örneğin 36° K enlemindeki Hatay''da çizgisel hız en fazlayken, 42° K enlemindeki Sinop''ta gölge boyu daha uzun ve alacakaranlık süresi daha uzundur. Buna karşılık \"Aynı anda bir ilde kayak yapılırken diğer ilde denize girilebilmesi\" matematik konumun (A-B-C-D kuralının) değil, yer şekilleri ve yükseltinin yani **özel konumun** sonucudur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM matematik konumda üç ayrımı çok sık sınar: 1. **Yıl içinde** dört mevsimin belirgin yaşanması (Matematik Konum / Orta Kuşak) ile **aynı anda / aynı günde** dört mevsim özelliklerinin görülmesi (Özel Konum / yükselti-yer şekilleri) birbirine karıştırılır. 2. **Yerçekimi** ile **çizgisel hız** zıt yönde değişir: Kuzeye (Sinop''a) gidildikçe çizgisel hız azalırken yerçekimi artar. 3. Türkiye''nin en güneyine (Hatay''a) 21 Haziran''da bile Güneş ışınları **asla 90° dik açıyla gelmez**; çünkü Türkiye dönencelerin dışındadır."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye 36°–42° Kuzey paralelleri ile 26°–45° Doğu meridyenleri arasındadır; Yengeç Dönencesi''nin kuzeyinde olduğundan gölge boyu sıfır olmaz ve öğle gölgesi daima kuzeye düşer.",
      "Orta Kuşak sonuçları **A-B-C-D**''dir (Akdeniz iklimi, Batı rüzgârları, Cephe yağışları, Dört mevsim).",
      "Güneyden kuzeye gidildikçe çizgisel hız, sıcaklık ve deniz tuzluluğu azalır; grup-tan süresi, gölge boyu ve yerçekimi artar.",
      "Güneyden esen rüzgârların sıcaklığı artırması Kuzey Yarım Küre''de olmanın (enlemin) sonucudur."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'cografya.turkiye_nin_cografi_konumu.02',
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  2,
  'Bölüm 2: Boylam, Yerel Saat, Ulusal Saat ve Ekinoks-Gündönümleri',
  'Türkiye''nin doğusu ile batısı arasında 45° - 26° = 19 meridyen farkı vardır.  Ardışık iki meridyen arasında Dünya''nın günlük dönüşüne bağlı olarak 4 dakika yerel saat farkı bulunduğundan, Türkiye''nin en doğusu (Iğdır) ile en batısı (Gökçeada/Çanakkale) arasında `19 × 4 = 76 dakika` (1 saat 16 dakika) yerel saat farkı oluşur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''nin doğusu ile batısı arasında **45° - 26° = 19 meridyen** farkı vardır. Ardışık iki meridyen arasında Dünya''nın günlük dönüşüne bağlı olarak **4 dakika** yerel saat farkı bulunduğundan, Türkiye''nin en doğusu (Iğdır) ile en batısı (Gökçeada/Çanakkale) arasında `19 × 4 = 76 dakika` (1 saat 16 dakika) yerel saat farkı oluşur. Rusya, ABD veya Kanada gibi doğu-batı yönünde onlarca meridyen genişliğe sahip ülkeler birden fazla ortak saat dilimi kullanmak zorundayken, Türkiye''nin doğu-batı genişliği yalnızca 19 meridyen olduğu için **tek bir ulusal (ortak) saat** kullanılması resmi ve ticari hayatı aksatmaz."
  },
  {
    "type": "paragraph",
    "text": "Türkiye, günümüzde kalıcı yaz saati uygulaması kapsamında **45° Doğu meridyeni (Iğdır)** yerel saatini (GMT+3) ulusal saat olarak kullanmaktadır (eskiden kış aylarında kullanılan 30° Doğu İzmit saati artık uygulanmamaktadır). Bu nedenle Iğdır''ın yerel saati ile Türkiye''nin ulusal saati arasındaki fark **0 dakikadır**; ulusal saat ile yerel saat arasındaki farkın en fazla olduğu iller ise en batıdaki İzmir, Edirne ve Çanakkale''dir (yaklaşık 76 dakika). Aynı meridyen üzerindeki tüm noktalarda yılın 365 günü **yerel saat** ve Güneş''in en tepeye çıkıp gölgenin en kısa olduğu **öğle vakti** aynıdır. Ancak **Güneş''in doğuş ve batış saatleri** gece-gündüz süreleri enleme göre değiştiği için aynı boylamda yıl boyu aynı değildir; yalnızca aydınlanma çemberinin kutup noktalarından geçtiği **21 Mart ve 23 Eylül Ekinoks** tarihlerinde aynı boylamdaki tüm noktalarda Güneş aynı anda doğar (06.00) ve aynı anda batar (18.00)."
  },
  {
    "type": "paragraph",
    "text": "Özel tarihlerde gece-gündüz süreleri de enleme göre değişir: **21 Mart ve 23 Eylül** ekinokslarında Dünya''nın her yerinde gece ve gündüz süresi eşit olup tam **12 saattir** (Sinop''ta da Hatay''da da 12 saat gündüz yaşanır). **21 Haziran** yaz gündönümünde Kuzey Yarım Küre''de **kuzeye gidildikçe gündüz süresi uzar** (en uzun gündüz Sinop''ta). **21 Aralık** kış gündönümünde ise Güneş ışınları Oğlak Dönencesi''ne dik düştüğünden **güneye gidildikçe gündüz süresi uzar** (Mersin ve Hatay''da gündüz Sinop''tan uzundur). Harita üzerinde düşünürken, Türkiye''nin kuzeydoğu köşesine doğru gidildikçe yerel saatin daha ileri, güneybatı köşesine doğru gidildikçe ise yerel saatin daha geri olduğunu unutma."
  },
  {
    "type": "table",
    "headers": [
      "Tarih",
      "Güneş Işınlarının Dik Geldiği Yer",
      "Türkiye''de Gündüz Süresi Değişimi"
    ],
    "rows": [
      [
        "21 Mart & 23 Eylül (Ekinoks)",
        "Ekvator (0°)",
        "Her yerde eşit: **12 saat gündüz, 12 saat gece**"
      ],
      [
        "21 Haziran (Yaz Gündönümü)",
        "Yengeç Dönencesi (23° 27'' K)",
        "**Kuzeye** gidildikçe gündüz uzar (Sinop en uzun)"
      ],
      [
        "21 Aralık (Kış Gündönümü)",
        "Oğlak Dönencesi (23° 27'' G)",
        "**Güneye** gidildikçe gündüz uzar (Hatay/Mersin daha uzun)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Yön ve saat hesaplama örneği: 21 Haziran tarihinde bir araştırmacı bulunduğu merkezden harekete geçip gittiği yeni merkezde gündüz süresinin uzadığını ve yerel saatin daha ileri olduğunu gözlemliyor. 21 Haziran''da gündüzün uzaması için **kuzeye**, yerel saatin ileri olması için **doğuya** gitmesi gerekir; o halde hareket yönü kesinlikle **Kuzeydoğu**dur. Eğer aynı gözlem 21 Aralık''ta yapılsaydı gündüzün uzaması için **güneye** gidilmesi gerekeceğinden yön **Güneydoğu** olurdu. Yine 23 Eylül günü aynı boylamdaki Ankara ile Çorum karşılaştırıldığında, Ankara''da Güneş 06.00''da doğuyorsa ekinoks nedeniyle Çorum''da da tam 06.00''da doğar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Boylam ve saat sorularında üç tuzağa dikkat et: 1. **\"Aynı boylamda Güneş her gün aynı anda doğar\"** ezberi **yanlıştır**! Yalnızca **21 Mart ve 23 Eylül** ekinokslarında aynı anda doğup batar; diğer günlerde aydınlanma çemberi eğik geçtiği için doğuş saatleri farklıdır. 2. Ulusal saatimizi eskiden kalma alışkanlıkla 30° Doğu (İzmit) sanma; güncel ortak saatimiz **45° Doğu (Iğdır)** olup Iğdır''da yerel-ulusal saat farkı sıfırdır. 3. Gece-gündüz süre uzunluğunu **enlem**, yerel saati ise **boylam** belirler; 21 Mart''ta Türkiye''nin her yerinde gündüz 12 saattir; ama en batı (26° D) ile en doğu (45° D) uçları arasında yerel saat farkı 19 × 4 = **76 dakika**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye 19 meridyen genişliğindedir (`19 × 4 = 76 dk` yerel saat farkı) ve tek saat dilimi (`45° Doğu Iğdır`) kullanır.",
      "Aynı boylamda yılın 365 günü yerel saat ve öğle vakti aynıdır; Güneş''in doğuş-batış saatleri ise yalnız 21 Mart ve 23 Eylül''de aynıdır.",
      "Ekinokslarda tüm dünyada gece-gündüz 12 saattir.",
      "21 Haziran''da kuzeye, 21 Aralık''ta güneye gidildikçe gündüz süresi uzar."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'cografya.turkiye_nin_cografi_konumu.03',
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  3,
  'Bölüm 3: Göreceli (Özel) Konum ve Enlem-Özel Konum Çelişkileri',
  'Bir yerin denizlere, kıtalara, boğazlara, ticaret yollarına, yer şekillerine ve yükseltisine bağlı konumuna göreceli (özel) konum denir.  Türkiye''nin ortalama yükseltisinin fazla olması (yaklaşık 1132 m) ve yükseltinin batıdan doğuya doğru artması, dağların doğu-batı doğrultusunda uzanması, iç kesimlerin karasal kalması ve kısa mesafelerde yer şekillerinin değişerek aynı anda farklı mevsim özelliklerinin yaşanması tamamen özel konumun sonucudur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir yerin denizlere, kıtalara, boğazlara, ticaret yollarına, yer şekillerine ve yükseltisine bağlı konumuna **göreceli (özel) konum** denir. Türkiye''nin ortalama yükseltisinin fazla olması (yaklaşık 1132 m) ve yükseltinin **batıdan doğuya doğru artması**, dağların doğu-batı doğrultusunda uzanması, iç kesimlerin karasal kalması ve kısa mesafelerde yer şekillerinin değişerek aynı anda farklı mevsim özelliklerinin yaşanması tamamen özel konumun sonucudur. Örneğin Antalya kıyısı ile arkasındaki Toroslar arasında 30 km mesafede sıcaklığın 20°C''ye varan ölçüde değişebilmesi yükseltinin enlemi nasıl gölgelediğini gösterir. Benzer biçimde Erzurum-Kars platosunda ortalama 2000 m yükselti ve yaz yağışlarıyla gür alpin çayırların yetişmesi sonucunda büyükbaş hayvancılık ve yaylacılığın yaygın olması da özel konumla açıklanır."
  },
  {
    "type": "paragraph",
    "text": "Türkiye okyanuslara doğrudan kıyısı olmayan bir iç deniz (Akdeniz, Ege, Karadeniz) ülkesi olduğu için okyanus akıntılarından (örneğin Gulf Stream) etkilenmez ve kıyılarımızda gelgit genliği çok düşüktür. Öte yandan ÖSYM''nin en çok sevdiği soru kalıbı **enlem kuralına aykırı düşen özel konum örnekleridir**:"
  },
  {
    "type": "bullets",
    "items": [
      "**Aynı enlemdeki iki merkezin farklı olması:** İzmir ile Van yaklaşık aynı enlemde (38° K) yer aldıkları için Güneş ışınlarını aynı açıyla alırlar ve çizgisel hızları eşittir. Ancak Van''da kışın sıcaklığın çok düşük, don olayının fazla ve tarım hasadının geç olmasının nedeni enlem değil; Van''ın denizden uzak (karasal) ve çok daha yüksek olmasıdır.",
      "**Kuzeydeki ilin güneydekinden sıcak olması:** Normalde kuzeye gidildikçe sıcaklık düşmelidir; ancak kış aylarında kuzeydeki Samsun, deniz seviyesinde ve nemli olduğu için daha güneydeki yüksek ve karasal Ankara ve Sivas''tan daha sıcaktır.",
      "**Bakı kuralına aykırılık:** Kuzey Yarım Küre''de güney yamaçlar güneşe baktığı için (bakı etkisi) normalde daha sıcaktır; bu nedenle güney yamaçta **kalıcı kar alt sınırı** ile **tarım, orman ve yerleşme üst sınırı** daha yüksektir. Ancak **Karadeniz kıyı dağlarında** kış mevsiminde kuzey yamaçlar denize baktığı (denizellik) için güney yamaçlardan daha ılık olur ve ormanlar kuzey yamaçta daha gür gelişir; bu durum bakı kuralına özel konumun getirdiği en meşhur istisnadır. Benzer biçimde dağların kıyıya paralel uzandığı Karadeniz ve Akdeniz''de nemli hava iç kesimlere geçemediği için kıyı ile iç kesim arasında çok keskin sıcaklık ve yağış farkları oluşur; dağların kıyıya dik uzandığı Ege''de ise denizel etki oluklar boyunca iç kesimlere sokulabilir."
    ]
  },
  {
    "type": "table",
    "headers": [
      "Karşılaştırılan Durum",
      "Matematiksel Beklenti",
      "Gerçekleşen Özel Konum İstisnası"
    ],
    "rows": [
      [
        "İzmir ↔ Van (Aynı enlem)",
        "Sıcaklık ve hasat zamanı benzer olmalı",
        "Van çok yüksek ve karasal olduğu için daha soğuk ve hasadı geç"
      ],
      [
        "Samsun ↔ Ankara/Sivas",
        "Samsun kuzeyde olduğundan daha soğuk olmalı",
        "Kışın Samsun denizellik nedeniyle Ankara ve Sivas''tan sıcak"
      ],
      [
        "Karadeniz Dağları",
        "Güney yamaç bakıdan dolayı daha sıcak ve gür olmalı",
        "Kuzey yamaç denizellik ve yağış nedeniyle kışın daha ılık ve ormanı daha gür"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Bakı ve üst/alt sınır çözümlemesi: Bakı etkisindeki güney yamaç daha sıcak olduğu için kar daha yukarılarda erir (kalıcı kar alt sınırı yükselir) ve insanlar daha yükseklere kadar tarım ile yerleşme kurabilir (**tarım ve yerleşme üst sınırı yükselir**). Buna karşılık \"Güney yamaçta tarım üst sınırı daha alçaktır.\" ifadesi **yanlıştır**. Yine aynı enlemdeki iki ilin tarım ve sıcaklık farkı sorulduğunda cevabı \"enlem\" veya \"güneş açısı\" seçmek **yanlıştır**; doğru cevap mutlaka yükselti, denizellik/karasallık gibi **özel konum** unsurlarıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Özel konum sorularında iki önemli detaya dikkat et: 1. **\"Kalıcı kar alt sınırı\"** ile **\"yerleşme/tarım üst sınırı\"** ifadeleri karıştırılır: Sıcak yamaçta kar yukarı çekilir (alt sınır yükselir), tarım ve orman da yukarı tırmanır (üst sınır yükselir); yani sıcak yamaçta ikisi de daha yüksektedir! 2. Güneyden esen rüzgârlar (enlem) ile Antalya-Toroslar arası ani sıcaklık değişimi veya Erzurum-Kars yaylacılığı (özel konum) aynı şıklarda verilir; ekonomik faaliyetlerin çoğu (yaylacılık, madencilik, turizm) doğrudan özel konuma dayanır."
  },
  {
    "type": "key_points",
    "items": [
      "Yükseltinin batıdan doğuya artması ve aynı anda farklı mevsim özelliklerinin yaşanması özel konum sonucudur.",
      "Aynı enlemdeki İzmir ve Van arasındaki iklim farkı enlemle değil, yükselti ve karasallıkla açıklanır.",
      "Kışın Samsun''un Ankara''dan sıcak olması ve Karadeniz Dağları''nın kuzey yamacının daha ılık/gür olması enlem-bakı kuralına aykırı denizellik istisnalarıdır.",
      "Türkiye''de okyanus akıntıları görülmez ve gelgit genliği çok küçüktür."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'cografya.turkiye_nin_cografi_konumu.04',
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  4,
  'Bölüm 4: Türkiye''nin Jeopolitik Konumu, Sınırlar ve Sınır Kapıları',
  'Türkiye, Asya, Avrupa ve Afrika kıtalarının birbirine en çok yaklaştığı kavşak noktasında yer alması nedeniyle çok yüksek bir jeopolitik ve jeostratejik öneme sahiptir.  Jeopolitiği oluşturan unsurlar ikiye ayrılır: Zamanla kolay kolay değişmeyen statik (değişmeyen) unsurlar (coğrafi konum, jeolojik-jeomorfolojik yapı, kıtalar arası konum, ada/yarımada özelliği, boğazlar) ve zamana göre değişebilen dinamik (değişen) unsurlar (nüfus, askerî güç, ekonomik yapı, siyasi rejim, boru hatları).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye, Asya, Avrupa ve Afrika kıtalarının birbirine en çok yaklaştığı kavşak noktasında yer alması nedeniyle çok yüksek bir **jeopolitik** ve **jeostratejik** öneme sahiptir. Jeopolitiği oluşturan unsurlar ikiye ayrılır: Zamanla kolay kolay değişmeyen **statik (değişmeyen) unsurlar** (coğrafi konum, jeolojik-jeomorfolojik yapı, kıtalar arası konum, ada/yarımada özelliği, boğazlar) ve zamana göre değişebilen **dinamik (değişen) unsurlar** (nüfus, askerî güç, ekonomik yapı, siyasi rejim, boru hatları). Zengin petrol ve doğal gaz rezervlerine sahip Orta Doğu ve Kafkaslar ile enerji tüketicisi Avrupa arasında köprü olan Türkiye; **TANAP** (Trans Anadolu Doğal Gaz Boru Hattı), **TürkAkım** ve **BTC** (Bakü-Tiflis-Ceyhan) gibi projelerle küresel bir enerji koridoru ve ticaret merkezi haline gelmiştir."
  },
  {
    "type": "paragraph",
    "text": "Deniz ulaşımında **İstanbul ve Çanakkale boğazları** Karadeniz''e kıyısı olan ülkelerin açık denizlere tek çıkış kapısıdır: Karadeniz''den çıkan bir gemi boğazları geçerek Ege ve Akdeniz''e ulaşır; buradan batıda **Cebelitarık Boğazı** ile Atlas Okyanusu''na, güneydoğuda **Süveyş Kanalı** ve Kızıldeniz üzerinden Hint Okyanusu''na açılır. Buna karşılık Basra Körfezi çıkışındaki **Hürmüz Boğazı**, Türkiye''nin doğrudan boğazlar rotası üzerinde yer almaz. Kıyı limanlarında ise gelişimi **hinterland (art bölge)** genişliği belirler: Örneğin **Sinop Limanı** Karadeniz''deki tek doğal liman olmasına rağmen arkasındaki Küre Dağları ulaşımı kestiği ve demiryolu olmadığı için hinterlandı dar kalıp gelişememiştir; buna karşılık **Samsun Limanı** yapay bir liman olmasına rağmen Canik Dağları''nın alçak olması ve demiryolu bağlantısı sayesinde geniş bir hinterlanda kavuşarak gelişmiştir."
  },
  {
    "type": "paragraph",
    "text": "Kara sınırlarımızda en uzun sınırımız **911 km ile Suriye**, en eski sınırımız **1639 Kasr-ı Şirin Antlaşması ile İran**, en kısa sınırımız ise yaklaşık **18 km ile Nahçıvan Özerk Cumhuriyeti (Azerbaycan - Dilucu Sınır Kapısı)** iledir. Sınır kapılarında demiryolu bağlantısı olup olmaması sınavlarda sıkça test edilir. Harita konumu olarak batıdan doğuya sırayla Yunanistan ve Bulgaristan (Trakya), Gürcistan ve Ermenistan (Kuzeydoğu — Ermenistan kapıları kapalıdır), Nahçıvan ve İran (Doğu) ile Irak ve Suriye (Güneydoğu-Güney) ile komşuyuz. Türkiye''nin Asya ve Avrupa arasında köprü kuran bu kara ve deniz konumu, hem transit ticareti hem de enerji nakil hatlarının güvenliğini doğrudan belirler. Ayrıca Kuzey Kıbrıs Türk Cumhuriyeti ile Doğu Akdeniz''deki deniz yetki alanları da Türkiye''nin stratejik deniz jeopolitiğinin ayrılmaz bir parçasıdır. Son olarak harita üzerindeki sınır kapılarında batıda Bulgaristan''a açılan Kapıkule ve Hamzabeyli ile Yunanistan''a açılan İpsala''nın Avrupa karayolu ticaretinin ana kapıları olduğunu da aklında tutmalısın."
  },
  {
    "type": "table",
    "headers": [
      "Komşu Ülke",
      "Önemli Sınır Kapıları",
      "Demiryolu Bağlantısı Durumu"
    ],
    "rows": [
      [
        "Bulgaristan / Yunanistan",
        "Kapıkule, Hamzabeyli (Bulgaristan); İpsala, Uzunköprü (Yunanistan)",
        "**Kapıkule ve Uzunköprü**''de demiryolu **VAR**"
      ],
      [
        "Gürcistan / Nahçıvan",
        "Sarp, Aktaş, Türkgözü (Gürcistan); Dilucu (Nahçıvan)",
        "**Sarp''ta YOK**; Gürcistan''a demiryolu **Kars–Ardahan** üzerinden geçen **Bakü-Tiflis-Kars (BTK)** hattıyla **VAR**"
      ],
      [
        "İran",
        "Gürbulak (Ağrı), Esendere (Hakkâri), Kapıköy (Van)",
        "**Kapıköy**''de (Van Gölü feribot bağlantılı) demiryolu **VAR**"
      ],
      [
        "Irak / Suriye",
        "Habur (Şırnak-Irak); Cilvegözü, Öncüpınar, Nusaybin (Suriye)",
        "**Habur''da YOK**; **Nusaybin** (ve İslahiye/Çobanbey) hattında **VAR**"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sınır kapısı ve liman çözümlemesi: \"Aşağıdaki sınır kapılarından hangisinin demiryolu bağlantısı yoktur?\" sorusunda **Sarp** (Artvin-Gürcistan) ve **Habur** (Şırnak-Irak) kapılarında demiryolu hattı **yoktur** (**doğru**); oysa Kapıkule, Uzunköprü, Kapıköy ve Nusaybin demiryoluna bağlıdır. İran sınır kapısı sorulduğunda Habur''u İran''a bağlamak **yanlıştır**; Habur **Irak** sınır kapımızdır, İran kapılarımız Gürbulak, Esendere ve Kapıköy''dür."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Jeopolitik ve sınırlar konusunda üç klasik tuzağa dikkat et: 1. **En eski** sınırımız (İran, 1639) ile **en uzun** sınırımız (Suriye, 911 km) birbirine karıştırılır. 2. **Sarp Sınır Kapısı**''nda demiryolu olduğunu sanma; Doğu Karadeniz kıyısında demiryolu olmadığı için Sarp yalnız karayolu kapısıdır (Gürcistan tren bağlantısı **Kars–Ardahan** üzerinden geçen **BTK** hattıyla sağlanır). 3. **Sinop** doğal limandır ama hinterlandı dar olduğundan gelişememiştir; **Samsun** yapay limandır ama hinterlandı geniş olduğundan gelişmiştir."
  },
  {
    "type": "key_points",
    "items": [
      "Jeopolitikte coğrafi konum, boğazlar ve yer şekilleri **statik**; nüfus, ekonomi, askerî güç ve boru hatları **dinamik** unsurlardır.",
      "En uzun sınır Suriye (911 km), en eski sınır İran (1639), en kısa sınır Nahçıvan''dır (Dilucu, ~18 km).",
      "Sarp (Gürcistan) ve Habur (Irak) sınır kapılarında demiryolu bağlantısı yoktur.",
      "TANAP ve TürkAkım enerji koridorları Türkiye''nin dinamik jeopolitik gücünü artırır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

commit;
