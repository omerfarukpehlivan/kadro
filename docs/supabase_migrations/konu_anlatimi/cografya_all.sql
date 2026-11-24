-- =============================================================================
-- KADRO KONU ANLATIMI - COGRAFYA 01-06 TOPLU MIGRATION
-- Toplam dosya: 6
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================

begin;

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Türkiye'nin Coğrafi Konumu
-- Kaynak: docs/konu_anlatimi/cografya/01_turkiyenin_cografi_konumu.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================
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

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Türkiye'nin Yer Şekilleri ve İklimi
-- Kaynak: docs/konu_anlatimi/cografya/02_turkiyenin_yer_sekilleri_ve_iklimi.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================
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
  'cografya.turkiye_nin_yer_sekilleri_ve_iklimi.01',
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  1,
  'Bölüm 1: Jeolojik Zamanlar, İç Kuvvetler ve Dağlar-Platolar-Ovalar',
  'Türkiye''nin yer şekilleri uzun bir jeolojik geçmişin ve genç tektonik hareketlerin ürünüdür.  I.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''nin yer şekilleri uzun bir jeolojik geçmişin ve genç tektonik hareketlerin ürünüdür. **I. Jeolojik Zaman (Paleozoyik)** dönemine ait sertleşmiş eski kütlelere **masif arazi** denir (Yıldız Dağları, Menteşe Yöresi, Kırşehir, Bitlis, Mardin-Derik, Daday-Devrekani ve Alanya-Anamur masifleri); Zonguldak havzasındaki **taş kömürü** yatakları da I. Zaman''da oluşmuştur. Buna karşılık Türkiye topraklarının bugünkü yüksek ve engebeli görünümünü kazanması asıl olarak **III. Zaman (Senozoyik/Neojen)** ve **IV. Zaman (Kuvaterner)** dönemlerindeki Alp-Himalaya orojenezi, toptan yükselme (epirojenez), kırılma ve volkanizma ile gerçekleşmiştir. Bu nedenle **linyit, petrol, bor, tuz, kaplıca suları, yüksek platolar, boğazlar ve denge profiline ulaşmamış dik vadiler** Türkiye''nin genç oluşumlu bir ülke olduğunun kanıtlarıdır."
  },
  {
    "type": "paragraph",
    "text": "İç kuvvetlerin etkisiyle Türkiye''de üç tür dağ oluşmuştur: Yan basınçlarla tortul tabakaların kıvrılmasıyla oluşan **kıvrım dağları** (Kuzey Anadolu Dağları ve Toroslar), sert kütlelerin kırılmasıyla oluşan **kırık dağları (horst)** (Ege''de kuzeyden güneye **Kaz, Madra, Yunt, Bozdağlar, Aydın** dağları ile aralarındaki **Bakırçay, Gediz, Küçük Menderes, Büyük Menderes grabenleri** ve Akdeniz''de Nur/Amanos Dağları) ve **volkanik dağlar** (Doğu Anadolu''da *Ağrı, Tendürek, Süphan, Nemrut*; İç Anadolu''da *Erciyes, Melendiz, Hasan, Karadağ, Karacadağ*; Güneydoğu''da kalkan biçimli *Karacadağ*). Türkiye''deki akarsular tarafından derince yarılmış yüksek düzlükler olan **platolar** da oluşumlarına göre ayrılır: **Tabaka düzlüğü** (*Haymana, Cihanbeyli, Bozok, Obruk, Yazılıkaya, Gaziantep, Şanlıurfa*), **lav/volkanik** (*Erzurum-Kars, Ardahan*), **karstik** (*Teke, Taşeli*) ve **aşınım** (*Çatalca-Kocaeli, Perşembe*)."
  },
  {
    "type": "paragraph",
    "text": "Karstik (kireç taşı/kalker) arazinin en yaygın olduğu alan Batı ve Orta Toroslar kuşağıdır; buradaki geniş karstik ovalara **polye** denir. Ayrıca Konya kapalı havzasında yer altı sularının aşırı çekilmesi sonucu mağara tavanlarının çökmesiyle son yıllarda çok sayıda tehlikeli **obruk** oluşmaktadır. Bunun yanında Türkiye''nin en yaygın ova türü fay hatları boyunca çöken **tektonik ovalar**dır (*Erbaa, Niksar, Tosya, Amik, Muş, Iğdır, Pasinler, Bursa, Adapazarı*). Volkanizmanın ve tektonizmanın gençliği nedeniyle Türkiye I. derece deprem kuşağında yer alır; başlıca aktif fay hatları Kuzey Anadolu (KAF), Doğu Anadolu (DAF) ve Batı Anadolu (BAF) fay sistemleridir. Buna karşılık Tuz Gölü güneyi–Mersin (Taşeli) arası ile Mardin–Şanlıurfa güneyi ve Doğu Karadeniz kıyı şeridi deprem riskinin daha düşük olduğu sahalardır."
  },
  {
    "type": "table",
    "headers": [
      "Yer Şekli Grubu",
      "Örnekler",
      "Kritik Sınav Özelliği"
    ],
    "rows": [
      [
        "Masif Araziler (I. Zaman)",
        "Yıldız, Menteşe, Kırşehir, Bitlis, Mardin, Alanya",
        "Yaşlı sert bloklar; ancak Menteşe yanı başındaki **grabenler** I. derece deprem alanıdır"
      ],
      [
        "Ege Horst ve Grabenleri",
        "Horst: Kaz, Madra, Yunt, Boz, Aydın · Graben: Bakırçay, Gediz, K. ve B. Menderes",
        "Batı Anadolu Fay Sistemi (BAFS) üzerindeki genç kırıklı yapılar"
      ],
      [
        "Karstik Polye Ovaları",
        "**Tefenni, Acıpayam, Korkuteli, Kestel, Elmalı, Muğla**",
        "Kalker çözünmesiyle oluşmuş en geniş karstik ovalar"
      ],
      [
        "Platolar",
        "Volkanik: Erzurum-Kars · Karstik: Teke-Taşeli · Aşınım: Çatalca-Kocaeli",
        "Teke-Taşeli yüzey suyu bakımından fakirdir"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Türkiye''deki başlıca karstik **polye** ovalarını **T-A-K-K-E** (+ Muğla) şeklinde kodla: - **T**efenni - **A**cıpayam - **K**orkuteli - **K**estel - **E**lmalı (ve Muğla Ovası)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Jeolojik zaman ve dağ ayrımı: \"Aşağıdakilerden hangisi Türkiye''nin genç oluşumlu (III.–IV. Zaman) olduğunun kanıtı değildir?\" sorusunda **taş kömürü yatakları** I. Zaman''a (Paleozoyik) ait olduğu için genç oluşum kanıtı değildir (**doğru**); oysa linyit, bor ve kaplıcalar genç oluşum kanıtıdır. Aynı biçimde Ege''deki kırık dağları arasına **Erciyes Dağı**''nı koymak **yanlıştır**; çünkü Erciyes kırılma ile değil volkanik püskürmeyle oluşmuş bir stratovolkandır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bu bölümde iki klasik tuzağa dikkat et: 1. **Taş kömürü (I. Zaman)** ile **linyiti (III. Zaman)** karıştırma: Taş kömürünün varlığı eski (masif) arazi bulunduğunu gösterir, genç oluşumu değil! 2. Konya Ovası''ndaki güncel **obruk** patlamasının nedeni doğal yağışlar değil, su isteyen bitkiler (şeker pancarı, mısır, yonca) için açılan kuyularla **yer altı suyunun aşırı çekilmesidir**."
  },
  {
    "type": "key_points",
    "items": [
      "Masif araziler ve taş kömürü I. Zaman; linyit, bor, kaplıca, yüksek platolar ve boğazlar III.–IV. Zaman ürünüdür.",
      "Ege horstları kuzeyden güneye Kaz, Madra, Yunt, Bozdağlar ve Aydın Dağları''dır; Erciyes volkaniktir.",
      "Polye ovaları **TAKKE**''dir (Tefenni, Acıpayam, Korkuteli, Kestel, Elmalı); Çarşamba delta, Erbaa ise tektonik ovadır.",
      "Karst topoğrafyasının ana kuşağı Akdeniz kireç taşı platosudur (Sivas çevresi ise jipslidir)."
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
  'cografya.turkiye_nin_yer_sekilleri_ve_iklimi.02',
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  2,
  'Bölüm 2: Dış Kuvvetler, Kıyı Tipleri ve Akarsu-Göl Oluşumları',
  'Türkiye yüksek ve engebeli bir ülke olduğu için akarsular denge profiline ulaşmamıştır; yatak eğimleri ve akış hızları yüksektir, rejimleri genellikle düzensizdir.  Bu nedenle (Bartın Çayı''nın ağız kısmı hariç) Türkiye akarsularında su yolu taşımacılığı yapılamaz.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye yüksek ve engebeli bir ülke olduğu için akarsular **denge profiline ulaşmamıştır**; yatak eğimleri ve akış hızları yüksektir, rejimleri genellikle düzensizdir. Bu nedenle (Bartın Çayı''nın ağız kısmı hariç) Türkiye akarsularında **su yolu taşımacılığı yapılamaz**. Marmara''daki **Ergene Nehri** ise eğimin çok az olduğu düz tabanda menderesler çizerek aktığından hidroelektrik potansiyeli en düşük akarsularımızdandır. Menderes çizen bir akarsu büklümlerini koruyarak yatağını derine doğru kazıyorsa (**gömük menderes**), bu durum arazinin **epirojenik olarak toptan yükseldiğinin** en güçlü delilidir."
  },
  {
    "type": "paragraph",
    "text": "Akarsuların deniz kıyısında taşıdığı alüvyonları biriktirmesiyle oluşan **delta ovaları** Ege kıyılarında kuzeyden güneye şöyle sıralanır: **Bakırçay → Dikili**, **Gediz → Menemen**, **Küçük Menderes → Selçuk**, **Büyük Menderes → Balat**; Karadeniz''de Kızılırmak **Bafra**''yı, Yeşilırmak **Çarşamba**''yı; Akdeniz''de Seyhan-Ceyhan **Çukurova**''yı, Göksu ise **Silifke** deltasını oluşturur. Dalgaların kıyıdaki bir adayı kumul okuyla karaya bağlamasıyla oluşan **tombolo (saplı ada)** örnekleri **Kapıdağ Yarımadası** ve **Sinop**''tur. Dağların kıyıya paralel uzandığı Karadeniz ve Akdeniz''de **boyuna kıyı tipi** (koy, körfez ve doğal liman az), dik uzandığı Ege''de ise **enine kıyı tipi** (koy, körfez ve ada çok) görülür. İç deniz ülkesi olduğumuzdan gelgit genliği çok küçüktür (20–40 cm); bu yüzden Türkiye kıyılarında **Haliç ve Watt tipi kıyılar oluşamaz** (İstanbul''daki Haliç vadi boğulmasıyla oluşmuş **Ria tipi** kıyıdır)."
  },
  {
    "type": "paragraph",
    "text": "Akarsu havzalarında sularını denize ulaştıran **Fırat, Dicle, Çoruh, Meriç, Göksu, Asi** açık havzadır; denize ulaşamayan **Tuz Gölü, Van Gölü, Göller Yöresi ve Aras-Kura (Hazar)** kapalı havzadır. Sınır aşan akarsularda **Fırat, Dicle, Çoruh, Aras, Kura ve Zap** bizden doğup dışarı giderken; **Asi ve Meriç** dışarıdan doğup ülkemize girer. Ayrıca IV. Zaman buzul döneminde **Uludağ**''da sirk gölleri oluşmuş olsa da günümüzde kalıcı kar sınırı 3000 m''nin üzerinde olduğundan Uludağ''da **güncel buzul yoktur** (güncel buzullar *Ağrı, Cilo/Reşko, Kaçkar, Erciyes, Süphan, Bolkar, Aladağlar*da bulunur). Kurak iç kesimlerde ise (Konya Karapınar, Tuz Gölü çevresi) cılız bitki örtüsü nedeniyle **rüzgâr aşınım ve birikim şekilleri** (mantarkaya, tafoni, barkan, lös) görülür; ancak Türkiye''de yer şekillerini şekillendiren en etkili dış kuvvet açık ara **akarsular**dır. Özellikle akarsuların dik yamaçları aşındırarak oluşturduğu çentik vadiler Doğu Anadolu ve Karadeniz''de çok yaygınken, boğaz vadiler (yarma vadiler) Sakarya, Kızılırmak ve Yeşilırmak''ın kıyı dağlarını yararak denize ulaştığı geçiş koridorlarını oluşturur."
  },
  {
    "type": "table",
    "headers": [
      "Göl Oluşum Türü",
      "Başlıca Türkiye Örnekleri"
    ],
    "rows": [
      [
        "Tektonik Göller",
        "**Tuz, İznik, Sapanca, Manyas (Kuş), Ulubat**, Hazar, Akşehir, Eber"
      ],
      [
        "Karstik ve Karma (Tektono-Karstik)",
        "Karstik: **Salda, Kestel, Avlan** · Tektono-Karstik: **Beyşehir, Eğirdir**, Burdur"
      ],
      [
        "Volkanik (Lav) Set Gölleri",
        "**Van, Çıldır, Erçek, Nazik, Balık, Haçlı** (Doğu Anadolu yoğun)"
      ],
      [
        "Heyelan Set Gölleri",
        "**Tortum, Sera, Abant, Yedigöller**, Boraboy, Zinav (Karadeniz yoğun)"
      ],
      [
        "Kıyı Set (Lagün) ve Alüvyal Set",
        "Kıyı Set: **Büyükçekmece, Küçükçekmece, Terkos** · Alüvyal Set: **Mogan, Eymir, Bafa, Köyceğiz**"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Havza, delta ve göl ayrımı: \"Gediz Nehri''nin oluşturduğu delta hangisidir?\" sorusunda cevap **Menemen Deltası**dır (**doğru**); Balat Büyük Menderes''in, Selçuk ise Küçük Menderes''in deltasıdır. Göl oluşumlarında **Salda Gölü** karstik, **Çıldır Gölü** lav (volkanik) set, **Tortum ve Abant** heyelan set, **Büyükçekmece ve Terkos** ise kıyı set (lagün) gölüdür; Mogan-Eymir''i kıyı set gölü saymak **yanlıştır** (akarsu biriktirmesiyle oluşan alüvyal settir)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Dış kuvvetler ve göllerde üç tuzağa dikkat et: 1. İstanbul''daki **\"Haliç\"** isim benzerliği nedeniyle okyanus kenarı haliç (estuary) kıyı tipi sanılır; Türkiye''de **Haliç ve Watt kıyısı yoktur**, İstanbul Haliç **Ria tipi**dir. 2. **Uludağ**''da eski buzul izleri (sirk gölleri) vardır ama **güncel buzul yoktur**! 3. **Beyşehir ve Eğirdir** gölleri tektonik çanak + karstik erime birleşimi olduğu için ÖSYM tarafından **karma (tektono-karstik)** yapılı kabul edilir."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye akarsuları denge profiline ulaşmamıştır; Bartın Çayı''nın ağız kısmı dışında taşımacılığa elverişsizdir.",
      "Ege deltaları: Bakırçay–Dikili, Gediz–Menemen, K.Menderes–Selçuk, B.Menderes–Balat.",
      "Dışarıdan gelip Türkiye''ye giren akarsular **Asi ve Meriç**tir; Fırat ve Dicle sınır dışına çıksa da açık havzadır.",
      "Doğu Anadolu set gölleri (Van, Çıldır, Erçek) volkanik set; Karadeniz set gölleri (Tortum, Sera, Abant) heyelan settir."
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
  'cografya.turkiye_nin_yer_sekilleri_ve_iklimi.03',
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  3,
  'Bölüm 3: Türkiye''de İklim Elemanları, Basınç Merkezleri ve Rüzgarlar',
  'Türkiye iklimini matematik konumun yanında çevresindeki basınç merkezleri, denizler ve dağların uzanışı şekillendirir.  Sıcaklık dağılışında kışın en soğuk bölge yüksek rakım ve karasallık nedeniyle Kuzeydoğu Anadolu (Ardahan–Kars–Erzurum) olup kar örtüsü burada yılda 120–150 gün yerde kalır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye iklimini matematik konumun yanında çevresindeki basınç merkezleri, denizler ve dağların uzanışı şekillendirir. Sıcaklık dağılışında kışın en soğuk bölge yüksek rakım ve karasallık nedeniyle **Kuzeydoğu Anadolu (Ardahan–Kars–Erzurum)** olup kar örtüsü burada yılda 120–150 gün yerde kalır. Buna karşılık yaz aylarında en yüksek sıcaklıklar ve **en şiddetli buharlaşma/kuraklık** Samyeli rüzgârı ve Basra Basıncı etkisiyle **Güneydoğu Anadolu**''da görülür (en az yağış İç Anadolu''da olmasına rağmen en şiddetli kuraklık Güneydoğu''dadır!)."
  },
  {
    "type": "paragraph",
    "text": "Türkiye''yi etkileyen dört ana basınç merkezi vardır: Kışın kuzeydoğudan gelerek dondurucu kuru soğuk ve ayaz getiren **Sibirya Termik Yüksek Basıncı (TYB)**; kışın kuzeybatıdan gelerek ılık ve yağışlı hava getiren **İzlanda Dinamik Alçak Basıncı (DAB)**; yazın güneybatıdan gelerek sıcak-kurak hava getiren **Asor Dinamik Yüksek Basıncı (DYB)** ve yazın güneydoğudan sokularak aşırı sıcak ve kuraklığa yol açan **Basra Termik Alçak Basıncı (TAB)**. Yerel rüzgârlarda ise kuzeyden esen soğuk rüzgârlar (**Karayel, Yıldız, Poyraz**) ile güneyden esen sıcak rüzgârlar (**Samyeli/Keşişleme, Kıble, Lodos**) etkilidir; güneybatıdan esen **Lodos** kışın kar erimelerine, deniz ulaşımında aksamalara ve soba zehirlenmelerine yol açarken, güneydoğudan esen **Samyeli** kurutucu etki yapar. Dağ yamaçlarından aşağı inerken sürtünmeyle her 100 m''de 1°C ısınan **Fön rüzgârı** ise havayı kurutur (yağış getirmez!); **Rize** kıyısında turunçgil-çay ve **Iğdır** ovasında pamuk yetiştirilebilen **mikroklima** ortamlarını oluşturur."
  },
  {
    "type": "paragraph",
    "text": "Yağış tiplerinde Karadeniz ve Toros yamaçlarında **orografik (yamaç)**, İç Anadolu''da ilkbaharda (kırkikindi) ve Erzurum-Kars''ta yazın **konveksiyonel (yükselim)**, Akdeniz ve kış aylarında Türkiye genelinde **cephe (frontal)** yağışları hâkimdir. Karadeniz kıyısında **Samsun**, gerisindeki **Canik Dağları** alçak ve içeride olduğu için nemli hava yükselemez ve Rize''den (~2300 mm) çok daha az yağış (~700 mm) alır; **Sinop**''ta da Küre Dağları Kaçkarlar kadar yüksek olmadığı için yağış Rize''ye göre düşüktür. Ayrıca Karadeniz en çok yağışı **sonbaharda** almasına rağmen **heyelanlar en çok ilkbaharda** görülür; çünkü kışın biriken karlar ilkbaharda eriyerek toprağı suya doyurur ve killi tabakayı kaydırır. Türkiye''de en çok yağış alan yerler harita üzerinde Rize–Artvin kıyıları, Batı Karadeniz, Menteşe (Muğla) ve Antalya çevresidir; en az yağış alan yerler ise etrafı dağlarla çevrili İç Anadolu (Tuz Gölü–Konya) ve Iğdır Ovası''dır. Ayrıca denizel kıyılarda nem fazla olduğu için günlük ve yıllık sıcaklık farkları çok düşükken, yüksek ve karasal Doğu Anadolu''da nem azlığı yüzünden gündüz ile gece arasındaki sıcaklık farkı çok büyür."
  },
  {
    "type": "table",
    "headers": [
      "Basınç Merkezi / Rüzgâr",
      "Mevsimi ve Yönü",
      "İklime Etkisi"
    ],
    "rows": [
      [
        "Sibirya TYB",
        "Kış · Kuzeydoğu",
        "Kuru, dondurucu soğuk ve ayaz"
      ],
      [
        "İzlanda DAB",
        "Kış · Kuzeybatı",
        "Ilık, yağışlı ve cephesel sistemler"
      ],
      [
        "Basra TAB",
        "Yaz · Güneydoğu",
        "Aşırı sıcaklık, şiddetli buharlaşma ve kuraklık"
      ],
      [
        "Fön Rüzgârı",
        "Dağdan aşağı iniş",
        "Her 100 m''de +1°C ısınır, havayı **kurutur** (Rize ve Iğdır mikrokliması)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Türkiye''ye etki eden başlıca yerel rüzgârları **kuzeyden gelen soğuk** ve **güneyden gelen sıcak** rüzgârlar olarak iki grupta **KA-YI-P / SA-K-L** şeklinde kodla: - Kuzeyden (soğuk): **Ka**rayel (KB) – **Yı**ldız (K) – **P**oyraz (KD) - Güneyden (sıcak): **Sa**myeli (GD) – **K**ıble (G) – **L**odos (GB)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Yağış ve rüzgâr çözümlemesi: \"Karadeniz en çok yağışı sonbaharda aldığına göre heyelanlar da en çok sonbaharda olur.\" yargısı **yanlıştır**; çünkü kar erimesinin toprağı suya doyurmasıyla heyelanlar **ilkbaharda** zirve yapar. Yine \"Fön rüzgârı estiği yerde yağışı artırır.\" yargısı **yanlıştır**; fön havayı ısıtıp **kuruttuğu** için nem açığını artırır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İklim elemanlarında iki kritik ayrıntıya dikkat et: 1. En az yağış alan yer **İç Anadolu** (Konya/Tuz Gölü) iken, yüksek sıcaklık ve Samyeli sebebiyle **en şiddetli kuraklık ve buharlaşma Güneydoğu Anadolu**''dadır. 2. **Samsun**''un Karadeniz''deki diğer kıyılardan az yağış almasının nedeni dağların dik uzanması değil, **Canik Dağları''nın alçak ve kıyıdan uzakta** olmasıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye''nin yerel rüzgârları **KAYIP SAKAL**''dır (kuzeyden gelenler soğutur, güneyden gelenler ısıtır).",
      "Fön rüzgârı yağış getirmez, havayı ısıtıp kurutur; Rize ve Iğdır mikroklimasını oluşturur.",
      "Kışın Sibirya TYB ayaz ve don, İzlanda DAB ise ılık ve yağışlı hava getirir.",
      "Karadeniz''de heyelanlar kar erimesine bağlı olarak en çok **ilkbaharda** yaşanır."
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
  'cografya.turkiye_nin_yer_sekilleri_ve_iklimi.04',
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  4,
  'Bölüm 4: Türkiye İklim Tipleri, Topraklar ve Doğal Bitki Örtüsü',
  'Türkiye''de dört ana iklim tipi görülür: Her mevsim yağışlı, en çok yağışı sonbaharda alan, yıllık sıcaklık farkının en az olduğu Karadeniz İklimi; yazları sıcak ve kurak, kışları ılık ve yağışlı (en çok yağış kışın) Akdeniz İklimi; yazları sıcak ve kurak, kışları soğuk, en çok yağışı ilkbaharda (kırkikindi) alan Ilıman Karasal İklim (İç ve Güneydoğu Anadolu ile Ergene); en çok yağışı yazın alan ve kışları çok sert geçen Sert Karasal İklim (Erzurum-Kars-Ardahan).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''de dört ana iklim tipi görülür: Her mevsim yağışlı, en çok yağışı sonbaharda alan, yıllık sıcaklık farkının en az olduğu **Karadeniz İklimi**; yazları sıcak ve kurak, kışları ılık ve yağışlı (en çok yağış kışın) **Akdeniz İklimi**; yazları sıcak ve kurak, kışları soğuk, en çok yağışı ilkbaharda (kırkikindi) alan **Ilıman Karasal İklim** (İç ve Güneydoğu Anadolu ile Ergene); en çok yağışı **yazın** alan ve kışları çok sert geçen **Sert Karasal İklim** (Erzurum-Kars-Ardahan)."
  },
  {
    "type": "paragraph",
    "text": "Doğal bitki örtüsü iklime sıkı sıkıya bağlıdır. **Orman üst sınırını sıcaklık** (enlem ve yükselti) belirlerken, **orman alt sınırını nem ve yağış** belirler: Karadeniz''de her mevsim nem bol olduğu için orman sıfır metreden başlar; Akdeniz''de ise yaz kuraklığı nedeniyle orman alt sınırı makilerden sonra (yaklaşık 600–800 m) başlar. Bitki tahribatı sonucunda yeni topluluklar ortaya çıkar: Akdeniz''de **kızılçam** ormanlarının tahribiyle **maki** (zeytin, defne, mersin, keçiboynuzu, kermes meşesi), makilerin de tahribiyle **garig (frigana)** oluşur; Karadeniz ormanlarının tahribiyle **psödömaki (yalancı maki)**; iç kesimlerdeki ormanların insan tarafından tahribiyle ise **antropojen bozkır** meydana gelir. Geçmiş buzul dönemlerinden günümüze korunaklı vadilerde (Toroslar, Amanoslar) kalmış bitkilere **relikt (kalıntı)**, dünyada yalnızca Türkiye''deki dar bir sahada yetişenlere ise **endemik bitki** denir (Köyceğiz''de *Sığla ağacı*, Göller Yöresi''nde *Kasnak meşesi*, Kaz Dağları''nda *Kazdağı göknarı*)."
  },
  {
    "type": "paragraph",
    "text": "Türkiye toprakları da iklim ve ana kayaya göre çeşitlenir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Çernozyom (Kara Toprak):** Erzurum-Kars-Ardahan platolarında yaz yağışlarıyla gürleşen alpin çayırların altında oluşan, humusça **en zengin ve en verimli** topraktır; ancak iklim çok soğuk olduğu için tarımdan ziyade büyükbaş mera hayvancılığında kullanılır.",
      "**Terra Rossa (Kırmızı Akdeniz Toprağı):** Kalker (kireç taşı) üzerinde oluşur; kırmızı rengini kireçten değil, bünyesindeki **demir oksitten ($\\mathrm{Fe_2O_3}$)** alır ve humusça fakirdir.",
      "**Vertisol (Dönen / Taş Doğuran / Kepir):** Killi depolar üzerinde Ergene Havzası, Muş Ovası ve Konya''da görülür; ayçiçeği tarımına uygundur.",
      "**Regosol:** Volkanik tüf ve kumlu depolar üzerinde **Nevşehir–Niğde–Ürgüp** çevresinde yaygındır; geçirgen yapısıyla **patates** tarımı için elverişlidir.",
      "**Alüvyal ve Kahverengi Orman Toprakları:** Akarsuların taşıyıp delta ve taban ovalarında biriktirdiği **alüvyal topraklar** (Çukurova, Bafra, Çarşamba, Gediz) mineralce zengin taşınmış (azonal) topraklardır ve her türlü tarıma uygundur. **Kahverengi orman toprakları** ise nemli Karadeniz ormanlarının altında humusça zengin olarak gelişir. Kurak İç Anadolu''da ise tuzlu göl kıyılarında tarıma elverişsiz **halomorfik (tuzlu)** topraklar görülür."
    ]
  },
  {
    "type": "table",
    "headers": [
      "Toprak / Bitki",
      "Görüldüğü Başlıca Yer",
      "Öne Çıkan Sınav Özelliği"
    ],
    "rows": [
      [
        "Çernozyom",
        "Erzurum – Kars – Ardahan",
        "En verimli (humuslu) toprak; iklim sertliğinden dolayı tarım sınırlı"
      ],
      [
        "Terra Rossa",
        "Akdeniz ve Güney Ege kıyıları",
        "Kalker üzerinde oluşur; kırmızı rengi **demir oksitten** gelir"
      ],
      [
        "Vertisol / Regosol",
        "Vertisol: Ergene, Muş · Regosol: Nevşehir",
        "Vertisol = *dönen/kepir*; Regosol = *volkanik tüf / patates*"
      ],
      [
        "Maki / Psödömaki / Antropojen",
        "Akdeniz / Karadeniz / İç Kesimler",
        "Sırasıyla kızılçam, Karadeniz ormanı ve iç orman **tahribatıyla** oluşur"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Bitki ve toprak çözümlemesi: \"Terra Rossa toprakları kireç taşı üzerinde oluştuğu için kırmızı rengini kireçten alır.\" yargısı **yanlıştır**; kireç beyaz renktedir, toprağa kiremit kırmızısı rengi veren bileşen **demir oksittir**. Aynı şekilde \"Çernozyom en verimli toprak olduğu için Türkiye''nin tahıl ambarı Erzurum-Kars''tır.\" demek **yanlıştır**; aşırı soğuk ve kısa tarım mevsimi yüzünden bu verimli toprak **mera hayvancılığında** değerlendirilir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bitki ve toprak sorularında iki tuzağa dikkat et: 1. **Orman üst sınırını sıcaklık**, **orman alt sınırını nem ve yağış** belirler! Bu iki sınırın etkeni sıklıkla yer değiştirilir. 2. **Endemik** (yalnız o dar alana özgü: Sığla ağacı, Kasnak meşesi) ile **Relikt** (eski iklimlerden kalıntı: Toros kanyonlarındaki kayın/ıhlamur) kavramlarını karıştırma."
  },
  {
    "type": "key_points",
    "items": [
      "Orman üst sınırını sıcaklık, alt sınırını ise nem ve yağış belirler.",
      "Kızılçam tahribi → **Maki**; maki tahribi → **Garig**; Karadeniz orman tahribi → **Psödömaki**; iç orman tahribi → **Antropojen bozkır**.",
      "Çernozyom humusça en zengin topraktır ancak soğuk iklim yüzünden tarımda yeterince kullanılamaz.",
      "Terra Rossa kırmızı rengini demir oksitten alır; Vertisol Ergene''de, Regosol ise Nevşehir volkanik tüflerinde yaygındır."
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

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Türkiye'de Nüfus ve Yerleşme
-- Kaynak: docs/konu_anlatimi/cografya/03_turkiyede_nufus_ve_yerlesme.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================
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
  'cografya.turkiye_de_nufus_ve_yerlesme.01',
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  1,
  'Bölüm 1: Nüfus Sayımları, Tarihsel Seyir ve Nüfus Politikaları',
  'Cumhuriyet tarihinin ilk resmî genel nüfus sayımı 28 Ekim 1927 tarihinde yapılmış ve Türkiye nüfusu 13,6 milyon olarak belirlenmiştir.  İkinci sayım 1935''te gerçekleştirilmiş, bu tarihten 1990''a kadar her 5 yılda bir tekrarlanmış, 2007 yılından itibaren ise Adrese Dayalı Nüfus Kayıt Sistemi (ADNKS) uygulanmaya başlamıştır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cumhuriyet tarihinin ilk resmî genel nüfus sayımı **28 Ekim 1927** tarihinde yapılmış ve Türkiye nüfusu **13,6 milyon** olarak belirlenmiştir. İkinci sayım 1935''te gerçekleştirilmiş, bu tarihten 1990''a kadar her 5 yılda bir tekrarlanmış, 2007 yılından itibaren ise **Adrese Dayalı Nüfus Kayıt Sistemi (ADNKS)** uygulanmaya başlamıştır. Türkiye nüfusu 1927''den günümüze sürekli artmıştır (ancak artış hızı dönemlere göre dalgalanmıştır). Özellikle **1940–1945** yılları arasında II. Dünya Savaşı tehlikesi nedeniyle genel seferberlik ilan edilip genç erkek nüfus silah altına alındığı için evlilik ve doğum oranları düşmüş, **nüfus artış hızı tarihi dip seviyeye** gerilemiştir; buna rağmen artış hızı sıfırın üzerinde kaldığı için **toplam nüfus miktarı azalmamıştır**."
  },
  {
    "type": "paragraph",
    "text": "Cumhuriyet''in nüfus politikaları üç ana evreden geçmiştir:"
  },
  {
    "type": "bullets",
    "items": [
      "**1923–1960 (Nüfus Artışını Teşvik Dönemi):** Savaşlardan çıkmış ülkenin iş gücü ve asker ihtiyacını karşılamak amacıyla çok çocuklu aileler desteklenmiş, 1950''lerde sağlık ve beslenmenin iyileşmesiyle nüfus artış hızı binde 28,5 ile zirve yapmıştır.",
      "**1965–2005 (Nüfus Planlaması / Artış Hızını Düşürme Dönemi):** Hızlı nüfus artışının yatırımları okul, hastane ve yol gibi demografik harcamalara yöneltip kalkınmayı yavaşlatması üzerine **1965 Nüfus Planlaması Kanunu** çıkarılarak doğum kontrolü serbest bırakılmıştır.",
      "**2005 Sonrası (Nüfus Artışını Destekleme ve Niteliği Yükseltme):** Doğurganlık hızının yenilenme düzeyi olan 2,1''in altına (1,5 bandına) inmesi ve toplumun yaşlanmasıyla birlikte yeniden doğurganlığı teşvik eden politikalara geçilmiştir."
    ]
  },
  {
    "type": "paragraph",
    "text": "Günümüzde Türkiye''nin nüfus piramidinin **tabanının daralması** (doğum oranlarının azalması) ve **tepesinin genişlemesi** (ortalama yaşam süresinin uzaması) **ortanca yaşı (medyan yaş)** yukarı çekerek **demografik yaşlanma**yı göstermektedir. Çalışan nüfusun sektörlere dağılımı da köklü biçimde değişmiştir: 1927''de çalışanların %80''inden fazlası tarımdayken, günümüzde TÜİK verilerine göre **1. sırada Hizmet sektörü (~%55–60)**, **2. sırada Sanayi sektörü (~%25–27)**, **3. sırada ise Tarım sektörü (~%15–16)** yer almaktadır."
  },
  {
    "type": "paragraph",
    "text": "Nüfusun yaş gruplarına dağılımında ise 0–14 yaş çocuk nüfus oranı kademeli biçimde düşerken, 15–64 yaş **çalışma çağı (aktif) nüfus** ile 65 yaş üzeri **yaşlı nüfus** oranı artış göstermektedir. Genç nüfus oranının hâlâ Avrupa ortalamasının üzerinde olması Türkiye''ye \"demografik fırsat penceresi\" sunsa da eğitim ve istihdam kalitesi artırılmadığında bu durum işsizlik baskısına dönüşebilir. Okuryazarlık oranı Cumhuriyet''in ilk yıllarındaki %10''luk seviyeden günümüzde %97''nin üzerine çıkmış, kadın-erkek okuryazarlık farkı da büyük ölçüde kapanmıştır. Ayrıca Türkiye''de ortalama yaşam süresi kadınlarda yaklaşık 80, erkeklerde 75 yılın üzerine çıkarak gelişmişlik göstergelerini yukarı taşımış; buna bağlı olarak bağımlı yaşlı nüfus oranı da giderek artmaya başlamıştır. Bu durum gelecekte sosyal güvenlik ve sağlık harcamalarının artacağına işaret eder; dolayısıyla aktif çalışan nüfusun niteliğinin yükseltilmesi önem kazanır."
  },
  {
    "type": "table",
    "headers": [
      "Dönem / Gösterge",
      "Yaşanan Değişim",
      "Temel Nedeni"
    ],
    "rows": [
      [
        "1940–1945 Dönemi",
        "Nüfus artış hızı en düşük seviyeye indi",
        "II. Dünya Savaşı seferberliği (toplam nüfus **azalmadı**)"
      ],
      [
        "1965 Nüfus Planlaması",
        "Artış hızını düşürme politikasına geçildi",
        "Demografik yatırımların kalkınma hızını düşürmesi"
      ],
      [
        "Piramit Tabanının Daralması",
        "Çocuk oranı azaldı, ortanca yaş yükseldi",
        "Doğurganlık hızının düşmesi ve ortalama ömrün uzaması"
      ],
      [
        "Çalışanların Sektör Dağılımı",
        "**1. Hizmet → 2. Sanayi → 3. Tarım**",
        "Sanayileşme, kentleşme ve hizmet ekonomisine geçiş"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Nüfus verisi yorumlama: \"Nüfus piramidinin tabanı daraldığına göre Türkiye''nin toplam nüfusu azalmaktadır.\" yargısı **yanlıştır**; tabanın daralması yalnızca **nüfus artış hızının düştüğünü** ve çocuk nüfus payının azaldığını gösterir, toplam nüfus artmayı sürdürür. Aynı şekilde \"Çalışan nüfusun en büyük bölümü sanayi sektöründedir.\" yargısı da **yanlıştır**; en yüksek istihdam payı açık ara **hizmet** sektöründedir (ticaret, ulaşım, eğitim, sağlık, turizm)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Nüfus politikaları ve istatistiklerde iki yanılgıya düşme: 1. **Nüfus artış hızının düşmesi** ile **nüfus miktarının azalması** aynı şey değildir: 1940–1945 arasında da 1985 sonrasında da artış hızı düşmüştür ama toplam nüfus büyümeye devam etmiştir. 2. **Ortanca yaşın yükselmesi** nüfusun gençleştiğini değil, **yaşlandığını** (çocuk oranının azalıp yaşlı oranının arttığını) gösterir."
  },
  {
    "type": "key_points",
    "items": [
      "İlk resmî nüfus sayımı **28 Ekim 1927**''dir (13,6 milyon); 2007''den beri ADNKS uygulanmaktadır.",
      "1940–1945 seferberliğinde artış hızı dip yaptı ancak toplam nüfus azalmadı.",
      "1965''te teşvikten nüfus planlamasına geçildi; günümüzde ortanca yaş yükselmekte (nüfus yaşlanmakta)dır.",
      "Çalışan nüfusun sektörel sıralaması: **1. Hizmet, 2. Sanayi, 3. Tarım**."
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
  'cografya.turkiye_de_nufus_ve_yerlesme.02',
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  2,
  'Bölüm 2: Nüfus Yoğunlukları ve Dağılışını Etkileyen Faktörler',
  'Nüfusun mekânsal dağılışını ölçmek için üç farklı yoğunluk formülü kullanılır: 1.  Aritmetik Nüfus Yoğunluğu (`Toplam Nüfus / Toplam Yüz Ölçümü`): Kilometrekareye düşen kişi sayısını verir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Nüfusun mekânsal dağılışını ölçmek için üç farklı yoğunluk formülü kullanılır: 1. **Aritmetik Nüfus Yoğunluğu** (`Toplam Nüfus / Toplam Yüz Ölçümü`): Kilometrekareye düşen kişi sayısını verir. Yüz ölçümü küçük olmasına rağmen dev metropol ve sanayi kentlerini barındıran **Marmara Bölgesi** en yüksek, yüz ölçümü geniş ve nüfusu daha az olan **Doğu Anadolu Bölgesi** ise en düşük aritmetik yoğunluğa sahiptir. 2. **Fizyolojik Nüfus Yoğunluğu** (`Toplam Nüfus / Tarım Alanları`): Kalabalık nüfusa karşılık tarım alanının çok dar olduğu **Doğu Karadeniz kıyı kuşağı** ve **İstanbul**''da çok yüksek; nüfusu kalabalık olsa da uçsuz bucaksız tarım arazilerine sahip **Konya** ve **Şanlıurfa**''da ise düşüktür. 3. **Tarımsal Nüfus Yoğunluğu** (`Tarımla Uğraşan Nüfus / Tarım Alanları`): Dağlık, tarım alanı dar ve makineleşmenin yapılamadığı **Artvin, Rize ve Hakkâri** gibi illerde çok yüksektir; düz ve makineli tarımın yapıldığı **Konya ve Edirne**''de düşüktür. Tarımsal yoğunluğun yüksek çıkması zenginlik göstergesi değil, tam tersine **engebe ve makinesizliğin** göstergesidir!"
  },
  {
    "type": "paragraph",
    "text": "Türkiye''de nüfusun **yoğun** olduğu alanların (Çatalca-Kocaeli, Çukurova, İzmir-Manisa, Doğu Karadeniz kıyı şeridi) yanında **seyrek** nüfuslu alanların nedenlerini ayırmak çok önemlidir: **Menteşe Yöresi** bol yağış almasına rağmen çok engebeli ve sapa kaldığı için; **Teke ve Taşeli Platoları** ılıman iklime rağmen karstik kireç taşı suyu alta sızdırdığı için; **Tuz Gölü çevresi** kuraklık için; **Yıldız Dağları, Gelibolu Yarımadası ve Sinop** ılıman kıyıda olmalarına rağmen ana ulaşım yollarına sapa kaldıkları için; **Hakkâri ve Erzurum-Kars** ise sert karasal iklim ve yüksek rakım yüzünden seyrektir. Doğu Karadeniz kıyı kuşağındaki yüksek nüfus yoğunluğu ise **ağır sanayiden değil** (ağır sanayi Batı Karadeniz''deki Karabük-Ereğli''dedir), dağların kıyıya sıkıştırması ve çay-fındık tarımının yoğun el emeği istemesinden kaynaklanır."
  },
  {
    "type": "paragraph",
    "text": "Harita üzerinde düşündüğünde yoğun nüfuslu alanların kıyı ovaları, verimli deltalar (Çukurova, Bafra, Çarşamba, Gediz) ve sanayi-ulaşım kavşakları (İstanbul–Kocaeli–Bursa, Ankara, İzmir, Gaziantep) üzerinde toplandığı görülür. Seyrek nüfuslu sahalar ise üç ana engele takılır: kuraklık (Tuz Gölü), yer şekli-karst (Menteşe, Teke-Taşeli, Hakkâri) ve ana yollara sapa kalma (Sinop, Gelibolu, Yıldız Dağları). Bu nedenle aynı kıyıda yer alan İzmir ile Muğla''nın Menteşe kıyıları tamamen farklı nüfus yoğunluklarına sahiptir. Harita sorularında seyrek nüfuslu bir yerin hemen gerisinde yüksek bir dağ sırası veya karstik plato olup olmadığını kontrol etmek doğru nedeni bulmanı kolaylaştırır. Türkiye genelinde kilometrekareye düşen ortalama kişi sayısı da 1927''den bu yana sürekli artış göstermiştir."
  },
  {
    "type": "table",
    "headers": [
      "Seyrek Nüfuslu Saha",
      "Asıl Seyreklik Nedeni",
      "Yanıltıcı Çeldirici"
    ],
    "rows": [
      [
        "Menteşe Yöresi (Muğla)",
        "Çok engebeli yer şekilleri ve dar tarım alanları",
        "Yağışı az sanmak (Oysa Türkiye''nin en çok yağış alan yerlerindendir!)"
      ],
      [
        "Teke ve Taşeli Platoları",
        "Karstik kireç taşı yapısı (yüzey suyu fakirliği)",
        "İklimi soğuk sanmak (Akdeniz''dedir, iklimi ılımandır)"
      ],
      [
        "Yıldız Dağları / Gelibolu / Sinop",
        "Ana ticaret ve ulaşım hatlarına sapa kalma",
        "Deniz kıyısında her yerin yoğun olduğunu sanmak"
      ],
      [
        "Hakkâri / Erzurum-Kars",
        "Yüksek rakım, engebe ve sert karasal iklim",
        "—"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Yoğunluk yorumlama örneği: \"Artvin''de tarımsal nüfus yoğunluğunun Konya''dan yüksek olması, Artvin''de modern tarım üretiminin ve tarımsal gelirin çok yüksek olduğunu kanıtlar.\" yargısı **yanlıştır**; aksine Artvin''de arazinin çok dağlık ve tarım alanlarının dar olduğunu, makine kullanılamadığı için insan gücüne bağımlılığın arttığını gösterir (**doğru**). Yine \"Doğu Karadeniz kıyısında yoğun nüfusun nedeni gelişmiş demir-çelik sanayisidir.\" demek **yanlıştır**; neden topografik sıkışma ve çay-fındık tarımıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yoğunluk kavramlarında iki klasik tuzağa dikkat et: 1. **Tarımsal nüfus yoğunluğu** paydasında yalnız tarım alanı, payında ise yalnız **tarım işçisi** vardır; bu oranın yüksekliği tarımsal gelişmişliği değil, **dağlık arazi ve makine eksikliğini** gösterir. 2. **Teke-Taşeli** ve **Menteşe** kıyı Akdeniz/Ege ikliminde yer almalarına rağmen seyrek nüfusludur; ilki **karstik**, ikincisi **engebeli** olduğu için nüfusu çekemez."
  },
  {
    "type": "key_points",
    "items": [
      "Aritmetik yoğunlukta Marmara en yüksek, Doğu Anadolu en düşüktür.",
      "Fizyolojik yoğunluk Doğu Karadeniz ve İstanbul''da yüksek; tarım alanı geniş Konya ve Şanlıurfa''da düşüktür.",
      "Tarımsal yoğunluk engebeli ve makinesiz illerde (Artvin, Rize, Hakkâri) yüksektir.",
      "Sinop ve Gelibolu ılıman kıyı olmalarına karşın ana yollara sapa kaldıkları için seyrek nüfusludur."
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
  'cografya.turkiye_de_nufus_ve_yerlesme.03',
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  3,
  'Bölüm 3: Göçler, Kentleşme ve Cinsiyet-Nüfus Dengesi',
  'Türkiye''de nüfus hareketlerinin ana eksenini kırdan kente ve doğudan batıya doğru gerçekleşen iç göçler oluşturur.  Göçü doğuran faktörler ikiye ayrılır: Kırsaldaki işsizlik, tarım topraklarının mirasla bölünmesi, makineleşme ve eğitim-sağlık yetersizliği itici faktörler; kentlerdeki geniş iş imkânları, yüksek ücret ve sosyal olanaklar ise çekici faktörlerdir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''de nüfus hareketlerinin ana eksenini kırdan kente ve doğudan batıya doğru gerçekleşen iç göçler oluşturur. Göçü doğuran faktörler ikiye ayrılır: Kırsaldaki işsizlik, tarım topraklarının mirasla bölünmesi, makineleşme ve eğitim-sağlık yetersizliği **itici faktörler**; kentlerdeki geniş iş imkânları, yüksek ücret ve sosyal olanaklar ise **çekici faktörler**dir. Bir ilin **doğal nüfus artış hızı** (doğumlar eksi ölümler) ile **gerçek nüfus artış hızı** arasındaki fark göç yönünü kesin olarak ortaya koyar: Eğer gerçek artış hızı doğal artış hızından **büyükse** o il net **göç alıyor** (Kocaeli, Tekirdağ, İstanbul), **küçükse** net **göç veriyor** (Kastamonu, Sinop, Giresun, Ağrı) demektir."
  },
  {
    "type": "paragraph",
    "text": "İç göçlerde iş arayan genç erkek nüfus öncü olduğu için göç veren kırsal illerde **kadın nüfus oranı**, Tekirdağ (Çorlu-Çerkezköy) ve Kocaeli (Gebze-İzmit) gibi yoğun sanayi göçü alan yerlerde ise **erkek nüfus oranı** daha yüksek çıkar. Ayrıca hızlı iç göç alan metropollerde iş gücü açığı değil, tam tersine vasıfsız ucuz iş gücü fazlası, **işsizlik**, gecekondulaşma ve altyapı yetersizliği doğar. **Mevsimlik göçlerde** ise Rize-Ordu (çay ve fındık hasadı) yalnız tarım işçisi çekerken, **Antalya** hem otel-turizm çalışanı hem de sera-narenciye tarım işçisi çekerek çifte mevsimlik göç merkezi olur; mevsimlik göç kalıcı (adrese dayalı) nüfusu artırmaz. Dış göçlerde ise 1923 Lozan Antlaşması ile Türkiye''deki Rumlar ve Yunanistan''daki Türklerin zorunlu yer değiştirmesi **Mübadele Göçü**dür (Almanya''ya giden işçiler iş gücü göçüdür)."
  },
  {
    "type": "paragraph",
    "text": "Türkiye''de kent nüfus oranının 2012 sonrası %75''lerden %93 bandına hızla sıçramasının temel nedeni kırsalda ölüm oranlarının patlaması değil, **2012 Büyükşehir Yasası (6360 sayılı Kanun)** ile 30 büyükşehir sınırlarındaki tüm köylerin idari olarak **\"mahalle\"** statüsüne geçirilmesidir."
  },
  {
    "type": "paragraph",
    "text": "Bunun yanında Türkiye son yıllarda yoğun **dış göç** de almaktadır; özellikle bölgesel savaş ve istikrarsızlıklar nedeniyle gelen sığınmacılar sınır illerinde ve büyükşehirlerde nüfus baskısı yaratmaktadır. İç göçlerde ise büyükşehirlere yönelik tek yönlü akışın yanında, son yıllarda emeklilerin kıyı bölgelerine dönüşü ve büyükşehirlerdeki yaşam pahalılığı nedeniyle sınırlı da olsa **kentten kıra (tersine göç)** hareketleri de gözlenmektedir. Göçü önlemenin temel yolu ise kırsalda tarıma dayalı sanayiyi, sulamayı ve eğitim-sağlık altyapısını güçlendirmektir. Ayrıca Türkiye''de iç göçlerin önemli bir bölümü eğitim (üniversite) ve tayin/atama nedeniyle de gerçekleşmekte olup, bu hareketlilik özellikle büyük kentler ile bölgesel merkezler arasındaki nüfus akışını canlı tutmaktadır. Kırsal kesimden göç eden genç nüfus nedeniyle birçok köyde yalnız yaşlı nüfus kalmaktadır; bu da kırsalda tarımsal iş gücü kaybına ve tarlaların ekilmeden boş kalmasına yol açmaktadır."
  },
  {
    "type": "table",
    "headers": [
      "Göç / Kentsel Özellik",
      "Görüldüğü Yerler",
      "Demografik Sonuç"
    ],
    "rows": [
      [
        "Gerçek Artış > Doğal Artış",
        "Kocaeli, Tekirdağ, Antalya, İstanbul",
        "Net **göç alan** merkez; erkek oranı ve işsizlik baskısı artar"
      ],
      [
        "Gerçek Artış < Doğal Artış",
        "Sinop, Kastamonu, Giresun, Kars",
        "Net **göç veren** merkez; geride yaşlı ve kadın oranı yükselir"
      ],
      [
        "Çifte Mevsimlik Göç",
        "**Antalya**",
        "Yazın turizm + yıl boyu sera/narenciye tarım işçisi çeker"
      ],
      [
        "2012 Büyükşehir Yasası",
        "30 Büyükşehir Belediyesi",
        "Köylerin mahalleye dönüşmesiyle kent nüfus oranı istatistiksel olarak sıçradı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Göç ve kentleşme çözümlemesi: \"Yoğun iç göç alan metropollerde iş gücü kıtlığı yaşanır.\" yargısı **yanlıştır**; göç iş gücü açığını kapatmakla kalmaz, niteliksiz iş gücü fazlası ve **işsizlik** doğurur. Aynı şekilde kentsel fonksiyon açısından **Eskişehir** (demiryolu kavşağı, havacılık sanayii ve üniversiteleriyle) ve **Kayseri** (ticaret, mobilya ve sanayi gücüyle) İç Anadolu''nun göç çeken gelişmiş merkezleri iken, Yozgat ve Çankırı göç veren tarım illeridir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Göç sorularında iki tuzağa dikkat et: 1. Kent nüfus oranının %93''e çıkması \"köylerde insanların ölmesiyle\" değil, büyük oranda **2012 Büyükşehir Yasası**''nın köyleri idari olarak mahalle saymasıyla ilgilidir. 2. **Mübadele göçü** devletler arası antlaşmaya dayalı zorunlu nüfus değişimidir (1923 Lozan); 1960''larda Avrupa''ya gidiş ise gönüllü **iş gücü göçü**dür."
  },
  {
    "type": "key_points",
    "items": [
      "Gerçek artış > Doğal artış = Göç alıyor; Gerçek artış < Doğal artış = Göç veriyor.",
      "Göç alan sanayi kentlerinde (Kocaeli, Tekirdağ) erkek oranı; göç veren kırsalda kadın oranı yüksektir.",
      "Antalya hem turizm hem tarım nedeniyle çifte mevsimlik göç alır.",
      "2012 Büyükşehir Yasası, 30 ildeki köyleri mahalle yaparak kent nüfus oranını artırmıştır."
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
  'cografya.turkiye_de_nufus_ve_yerlesme.04',
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  4,
  'Bölüm 4: Yerleşme Dokusu, Konut Malzemeleri ve Köy Altı Yerleşmeleri',
  'Kırsal yerleşmelerin dokusunu yer şekilleri ve su kaynakları belirler.  Su kaynaklarının her yerde bol, arazinin ise çok engebeli ve tarım topraklarının küçük parçalar halinde dağınık olduğu Doğu Karadeniz''de dağınık yerleşme görülür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Kırsal yerleşmelerin dokusunu **yer şekilleri** ve **su kaynakları** belirler. Su kaynaklarının her yerde bol, arazinin ise çok engebeli ve tarım topraklarının küçük parçalar halinde dağınık olduğu **Doğu Karadeniz**''de **dağınık yerleşme** görülür. Buna karşılık arazinin düz, kurak ve su kaynaklarının sınırlı olduğu **İç Anadolu ve Güneydoğu Anadolu**''da insanlar kuyu veya çeşme etrafında toplandığından **toplu yerleşme** hâkimdir. Geleneksel kırsal konut malzemesi de doğrudan doğal çevreye uyumludur: Ormanın bol olduğu Karadeniz''de **ahşap**, kurak ve killi topraklı İç Anadolu ile Güneydoğu''da **kerpiç**, kalkerin yaygın olduğu Akdeniz''de ve volkanik tüf-bazaltın bulunduğu Nevşehir–Kars yörelerinde ise **taş** meskenler yaygındır."
  },
  {
    "type": "paragraph",
    "text": "Köyden küçük idari birimlere **köy altı yerleşmeleri** denir ve geçim kaynağına göre ikiye ayrılır. Geçim kaynağı **tarıma** döndüğünde insan yıl boyu toprağa bağlandığından yerleşme **kalıcı (sürekli)** hale gelir; bu dört kalıcı yerleşme **Mahalle, Divan, Mezra ve Çiftlik**tir. **Hayvancılık** veya mevsimlik avcılık ağırlıklı olan **Yayla, Kom, Ağıl, Oba, Dam ve Dalyan** ise **geçici** yerleşmelerdir. Doğu Karadeniz yaylaları günümüzde hayvancılıktan ziyade **eko-turizm ve yayla turizmi** merkezine dönüşmüşken, Akdeniz yaylaları daha çok yaz sıcağından kaçılan dinlenme (sayfiye) alanı olarak kullanılır."
  },
  {
    "type": "paragraph",
    "text": "Kentlerin baskın ekonomik işlevlerine göre sınıflandırılması da sınavda sıkça çıkar: **İstanbul, İzmir, Bursa, Kocaeli** sanayi ve ticaret; **Ankara** idari (başkent) ve eğitim; **Antalya, Muğla** turizm; **Zonguldak, Soma, Batman** madencilik; **Kayseri ve Gaziantep** ticaret-sanayi; **Eskişehir** ise ulaşım kavşağı, havacılık sanayii ve üniversite kenti kimliğiyle öne çıkar. Bir kentin fonksiyon sayısı arttıkça etki alanı ve göç çekim gücü de büyür. Örneğin İstanbul yalnızca sanayi ve ticaret değil, aynı zamanda turizm, finans, eğitim ve kültür merkezi olduğu için etki alanı tüm ülkeyi hatta komşu coğrafyaları kapsar; buna karşılık yalnız madencilik veya tek bir tarım ürününe dayalı küçük ilçe merkezlerinin etki alanı yerel düzeyde kalır. Kentsel dokuda da verimli tarım alanlarının ve aktif fay hatlarının imara açılmaması sürdürülebilir yerleşme planlamasının temel ilkesidir. Ayrıca büyük şehirlerin çevresindeki verimli alüvyal ovaların sanayi ve konut alanı altında kalması tarımsal üretim açısından önemli bir kayıp doğurur; bu nedenle kent planlaması verimli toprakları korumalıdır."
  },
  {
    "type": "table",
    "headers": [
      "Köy Altı Yerleşmesi",
      "Kalıcı / Geçici",
      "Görüldüğü Bölge ve Temel İşlevi"
    ],
    "rows": [
      [
        "**Mahalle / Çiftlik**",
        "Kalıcı (Sürekli)",
        "Tarım ve bağ-bahçe; Çiftlik düz ovalarda (Marmara, Ege, Çukurova)"
      ],
      [
        "**Divan**",
        "Kalıcı (Sürekli)",
        "**Batı Karadeniz** (Kastamonu, Sinop, Bolu, Düzce); mahallelerin birleşimi"
      ],
      [
        "**Mezra**",
        "Kalıcı (Sürekli)",
        "**Doğu ve Güneydoğu Anadolu**; tarım ve hayvancılık (zamanla köye dönüşür)"
      ],
      [
        "**Kom / Ağıl**",
        "Geçici",
        "**Kom:** Doğu Anadolu (büyükbaş) · **Ağıl:** İç ve Güneydoğu Anadolu (küçükbaş)"
      ],
      [
        "**Oba / Dam / Dalyan**",
        "Geçici",
        "**Oba:** Toroslar kıl çadır · **Dam:** Ege ve adalar · **Dalyan:** Ege-Akdeniz balıkçı yerleşmesi"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Yıl boyu insanların sürekli yaşadığı dört **kalıcı (sürekli)** köy altı yerleşmesini, geçici olan kom, ağıl ve obadan ayırmak için **M-D-M-Ç** harfleriyle eşleştir: - **M**ahalle - **D**ivan (Batı Karadeniz) - **M**ezra (Doğu-Güneydoğu Anadolu) - **Ç**iftlik (Geniş tarım işletmeleri)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Yerleşme eşleştirmesi: \"Batı Karadeniz''de birkaç mahallenin birleşmesiyle oluşan sürekli köy altı yerleşmesi hangisidir?\" sorusunun yanıtı **Divan**dır (**doğru**); Mezra demek **yanlıştır**, çünkü Mezra Doğu ve Güneydoğu Anadolu''ya özgüdür. Aynı şekilde \"Toroslar''da yörüklerin kıl çadır kurarak küçükbaş hayvancılık yaptığı geçici yerleşme\" **Oba**dır (**doğru**); **Dalyan** ise hayvancılık değil, lagün ve kıyılardaki balıkçı yerleşmesidir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Köy altı yerleşmelerinde iki ayrım sürekli yoklanır: 1. Bir yerleşmenin geçicilikten **kalıcılığa** geçmesini sağlayan temel etken **tarım** faaliyetinin başlamasıdır (tarım yıl boyu yerleşmeyi zorunlu kılar). 2. **Kom** (Doğu Anadolu, taş/ahşap büyükbaş barınağı), **Ağıl** (İç/Güneydoğu küçükbaş çevrili alan) ve **Oba** (Toroslar göçebe kıl çadırı) birbirinin yerine çeldirici olarak konur."
  },
  {
    "type": "key_points",
    "items": [
      "Dağınık yerleşme engebe + bol su (Doğu Karadeniz); toplu yerleşme düzlük + kıt su (İç ve Güneydoğu Anadolu) sonucudur.",
      "Kalıcı köy altı yerleşmeleri yalnız 4 tanedir: **Mahalle, Divan, Mezra, Çiftlik**.",
      "Divan Batı Karadeniz''de, Mezra Doğu/Güneydoğu''da, Dam Ege''de, Oba Toroslar''da, Dalyan kıyılarda görülür.",
      "Konut malzemesi Karadeniz''de ahşap, İç/Güneydoğu''da kerpiç, Akdeniz ve volkanik platolarda taştır."
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

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Türkiye'de Tarım ve Hayvancılık
-- Kaynak: docs/konu_anlatimi/cografya/04_turkiyede_tarim_ve_hayvancilik.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================
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
  'cografya.turkiye_de_tarim_ve_hayvancilik.01',
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  1,
  'Bölüm 1: Türkiye Tarımını Etkileyen Faktörler, Sorunlar ve Yöntemler',
  'Türkiye tarımının verimliliğini belirleyen en temel sorun sulama yetersizliği ve yaz kuraklığıdır.  Kıyı ovaları dışındaki geniş iç tarım alanlarında çiftçi yağışa bağımlı kaldığında, kurak yıllarda üretim düşer ve yıllar arasında büyük dalgalanmalar yaşanır; ayrıca toprağın nem toplamak amacıyla bir yıl boş bırakıldığı nadas yöntemi uygulanır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye tarımının verimliliğini belirleyen en temel sorun **sulama yetersizliği ve yaz kuraklığıdır**. Kıyı ovaları dışındaki geniş iç tarım alanlarında çiftçi yağışa bağımlı kaldığında, kurak yıllarda üretim düşer ve yıllar arasında büyük dalgalanmalar yaşanır; ayrıca toprağın nem toplamak amacıyla bir yıl boş bırakıldığı **nadas** yöntemi uygulanır. **Sulama** imkânı sağlandığında ise üretimdeki yıllık dalgalanmalar **azalır ve istikrar sağlanır**, nadasa gerek kalmaz, birim alandan alınan verim artar ve aynı tarladan yılda birden fazla hasat alınabilir. Her mevsim düzenli yağış alan **Karadeniz kıyı kuşağında** nadasa hiç ihtiyaç duyulmadığı için nadas alanlarının oranı en düşüktür; nadasın en yaygın olduğu yerler ise kurak **İç Anadolu ve Güneydoğu Anadolu**''dur."
  },
  {
    "type": "paragraph",
    "text": "Ancak sıcak ve buharlaşmanın çok şiddetli olduğu sahalarda (örneğin **Harran Ovası / GAP**) tarlalara kontrolsüz ve aşırı su basılması ciddi bir çevre sorununa yol açar: Taban suyu yükselir, şiddetli güneş suyu buharlaştırdığında toprak altındaki tuz ve kireç yüzeye çıkarak **toprakta tuzlanma ve çoraklaşma** meydana getirir. Türkiye tarımının bir diğer yapısal sorunu ise geleneksel miras bölünmesi nedeniyle tarım arazilerinin çok küçük ve dağınık parçalara ayrılmış olmasıdır; bu da traktör ve sulama maliyetini artırır, çözümü ise **arazi toplulaştırması**dır."
  },
  {
    "type": "paragraph",
    "text": "Tarım yöntemlerinde az emek ve düşük girdiyle geniş alanlardan doğaya bağlı üretim yapmaya **ekstansif (yaygın) tarım**, sulama, gübreleme, kaliteli tohum ve modern tekniklerle birim alandan yüksek verim almaya ise **entansif (yoğun) tarım** denir. **Makineleşme** düz ovalarda (Konya, Harran, Çukurova, Ergene) çok yüksek iken, dik ve engebeli **Doğu Karadeniz, Hakkâri ve Menteşe** yörelerinde topoğrafya engeline takılır. Tarım ürünlerinin **hasat (olgunlaşma) zamanı** da sıcaklığa bağlıdır: İlk olarak enlem ve denizellik sebebiyle **Akdeniz''de (Çukurova)** başlar, ardından **İç Anadolu''ya (Konya)** geçer, en geç ise yüksek rakım ve soğukluk nedeniyle **Doğu Anadolu''da (Erzurum)** gerçekleşir."
  },
  {
    "type": "paragraph",
    "text": "Türkiye''nin büyük bölümünde yaygın olan **nöbetleşe ekim (münavebe)** uygulaması ise toprağı boş bırakan nadasa karşı en çevreci çözümdür: Aynı tarlaya bir yıl toprağın azotunu tüketen tahıl, ertesi yıl toprağa azot bağlayan baklagil (nohut, mercimek) ekilerek hem erozyon önlenir hem de üretim kesintisiz sürer. Ayrıca kıyı bölgelerimizde serinletici rüzgârların kesilmesi ve doğal dengenin korunması için tarım arazilerinin **erozyona** karşı ağaçlandırılması büyük önem taşır. Gübreleme ve zirai ilaçlamanın bilinçli yapılması da birim alandan alınan verimi artıran temel entansif tarım adımlarıdır. Ayrıca devletin sunduğu mazot, gübre ve sertifikalı tohum destekleri ile tarım sigortası (TARSİM) uygulamaları çiftçinin doğal afetlere karşı üretimini sürdürmesine katkı sağlar."
  },
  {
    "type": "table",
    "headers": [
      "Tarım Kavramı / Sorunu",
      "En Belirgin Görüldüğü Saha",
      "Temel Neden ve Sonuç"
    ],
    "rows": [
      [
        "Nadas Alanı En Az / En Çok",
        "En az: **Karadeniz** · En çok: **İç ve Güneydoğu Anadolu**",
        "Karadeniz her mevsim yağışlı; iç kesimler yarı kurak"
      ],
      [
        "Aşırı Sulama Sorunu",
        "**GAP / Harran Ovası**",
        "Buharlaşma nedeniyle **toprakta tuzlanma ve çoraklaşma**"
      ],
      [
        "Miras Bölünmesi",
        "Türkiye geneli (özellikle kırsal)",
        "Küçük-dağınık parseller; çözüm **arazi toplulaştırması**"
      ],
      [
        "Makineleşme Düşüklüğü",
        "**Doğu Karadeniz, Hakkâri, Menteşe**",
        "Aşırı engebe ve dik yamaçlar nedeniyle el emeği hâkim"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Tarım mantığı çözümlemesi: \"Sulama imkânlarının gelişmesiyle birlikte tarımsal üretimdeki yıldan yıla dalgalanmalar artar.\" yargısı **yanlıştır**; sulama çiftçiyi yağışa bağımlılıktan kurtardığı için yıllık üretim dalgalanmalarını **en aza indirir** ve üretimi güvenceye alır (**doğru**). Aynı şekilde \"Türkiye''de makineleşmenin en az olduğu Doğu Karadeniz''de verimlilik her üründe makineleşmeyle artırılabilir.\" demek **yanlıştır**; dik yamaçlara traktör ve biçerdöver giremez."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Tarım yöntemlerinde iki klasik tuzağa dikkat et: 1. Tarımsal üretimi artırmanın yolu tarla alanını genişletmek (ekstansif) değil, sulama, gübre ve ıslah edilmiş tohumla birim alandan verimi artırmaktır (**entansif tarım**). 2. Güneydoğu Anadolu''da (Harran) yanlış ve aşırı sulamanın yol açtığı sorun heyelan veya sel değil, **toprakta tuzlanma ve çoraklaşma**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Sulama; nadası azaltır, yıllık dalgalanmayı bitirir, verimi ve ürün çeşitliliğini artırır.",
      "Nadas en az Karadeniz''de, en çok İç Anadolu ve Güneydoğu''dadır.",
      "Mirasla bölünen tarlaların çözümü **arazi toplulaştırması**dır.",
      "Hasat olgunlaşma sırası: En erken **Akdeniz (Çukurova)** → **İç Anadolu** → En geç **Doğu Anadolu (Erzurum)**."
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
  'cografya.turkiye_de_tarim_ve_hayvancilik.02',
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  2,
  'Bölüm 2: Tahıllar, Baklagiller ve Meyvecilik',
  'Türkiye''nin iklim ve yer şekli çeşitliliği, ürün desenini doğrudan belirler.  Buğday ve arpa gibi tahıllar ilkbaharda yağış, yazın ise olgunlaşma döneminde güneşlenme ve kuraklık ister; bu nedenle yazları kurak geçen İç, Güneydoğu ve Doğu Anadolu ile Trakya''da yaygınken, her mevsim yağışlı olan Doğu Karadeniz kıyılarında doğal olarak yetiştirilemez (nedeni soğukluk değil, yaz kuraklığının olmamasıdır).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''nin iklim ve yer şekli çeşitliliği, ürün desenini doğrudan belirler. **Buğday ve arpa** gibi tahıllar ilkbaharda yağış, yazın ise olgunlaşma döneminde **güneşlenme ve kuraklık** ister; bu nedenle yazları kurak geçen İç, Güneydoğu ve Doğu Anadolu ile Trakya''da yaygınken, her mevsim yağışlı olan **Doğu Karadeniz kıyılarında doğal olarak yetiştirilemez** (nedeni soğukluk değil, yaz kuraklığının olmamasıdır). **Mısırın** doğal yetişme alanı nemli Karadeniz''dir; ancak Karadeniz''de halk mısırı kendi beslenmesinde tüketirken, **Çukurova ve Konya**''da sulama ile endüstriyel/yem amaçlı çok yüksek miktarda üretilir ve ticarete sunulur. **Çeltik (pirinç)** üretimi ise bataklık ortamında sıtma sivrisineği üremesine yol açtığı için **Çeltik Ekimi Kanunu** ile yerleşim yerlerine yakın alanlarda devlet kontrolündedir (Edirne, Balıkesir, Samsun yoğunlaşsa da iç tüketimi karşılayamadığımız için düzenli pirinç **ithal** edilir)."
  },
  {
    "type": "paragraph",
    "text": "Baklagillerde **kırmızı mercimek** yüksek sıcaklık ve kuraklığa dayanıklılığıyla **Güneydoğu Anadolu (Şanlıurfa, Diyarbakır)**''da, **yeşil mercimek** ise daha serin karasal **İç Anadolu (Yozgat, Konya)**''da öne çıkar. Meyvecilikte iklim seçiciliği belirleyicidir: **Turunçgiller** kışın 0°C''nin altındaki donlara dayanamadığı için yalnız kışların ılık geçtiği Akdeniz, Güney Ege kıyıları ve fön mikroklimasıyla Rize''de yetişir. **Zeytin** de kış ılıklığı istediğinden dondurucu **Doğu Anadolu''da yetişemez** (Ege ve Güney Marmara liderdir; bir yıl çok bir yıl az ürün verme özelliği olan **periyodisite** gösterir). Buna karşılık **elma ve üzüm** -30°C''ye kadar soğuğa dayandığı için Türkiye''nin hemen her bölgesinde yetişir. **Çay** bol yağış ve kireci yıkanmış **asidik toprak** istediğinden yalnız **Doğu Karadeniz''de (Rize)** yetişir; **fındıkta** ise yıllık üretimde **Ordu** ili öne çıkar. **Kuru incirde Aydın**, **çekirdeksiz kuru üzümde Manisa**, **kayısıda Malatya** Türkiye''nin dünya ihracat lideri olduğu ürünlerdir. **Kahve** ise tropikal bir bitki olduğundan Türkiye''de hiç yetiştirilmez, %100 ithal edilir."
  },
  {
    "type": "paragraph",
    "text": "Taze meyveler çabuk bozulup ezildiği için Türkiye, ihracat gelirini asıl olarak şiddetli yaz güneşi altında kurutulan ürünlerden (**kuru incir, kuru kayısı, çekirdeksiz kuru üzüm ve fındık**) elde eder. Buna karşılık tropikal kökenli **muz** yalnız don olayının görülmediği Alanya–Anamur–Mersin hattındaki dar mikroklima kuşağında ve seralarda üretilebilir; ancak iç tüketimi karşılamadığı için ithalat da yapılır. Yağlı tohumlardan **ayçiçeği** ise Trakya (Ergene) ve İç Anadolu''da yaygınlaşmıştır. Özellikle sulama imkânlarının artmasıyla İç Anadolu''da ayçiçeği ve mısır ekim alanları son yıllarda belirgin biçimde genişlemiştir."
  },
  {
    "type": "table",
    "headers": [
      "Ürün",
      "Başlıca Üretim Sahası",
      "Kritik Sınav Notu"
    ],
    "rows": [
      [
        "Buğday / Mısır",
        "Buğday: İç Anadolu · Mısır: Çukurova, Konya, Karadeniz",
        "Buğday yaz yağışlı Karadeniz kıyısında yetişmez; Mısır Karadeniz''de iç tüketime gider"
      ],
      [
        "Çeltik (Pirinç)",
        "Edirne, Balıkesir, Samsun",
        "**Sıtma** riski nedeniyle devlet kontrolünde; buna rağmen **ithal** edilir"
      ],
      [
        "Mercimek",
        "Kırmızı: **Güneydoğu (Şanlıurfa)** · Yeşil: **İç Anadolu (Yozgat)**",
        "Kırmızı sıcak-kurak, yeşil serin karasal sever"
      ],
      [
        "Çay / Fındık / Zeytin",
        "Çay: **Rize** · Fındık: **Ordu** · Zeytin: **Ege**",
        "Çay **asidik/kireçsiz** toprak ister; Zeytin **periyodisite** gösterir"
      ],
      [
        "Kuru İncir / Üzüm / Kayısı",
        "İncir: **Aydın** · Üzüm: **Manisa** · Kayısı: **Malatya**",
        "Türkiye''nin dünya ihracatında tekel olduğu kurutulmuş ürünler"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Ürün-iklim çözümlemesi: \"Karadeniz kıyılarında buğday yetişmemesinin nedeni kışların çok soğuk geçmesidir.\" yargısı **yanlıştır**; buğday donlara dayanıklıdır, Karadeniz kıyısında yetişmeme nedeni **yaz kuraklığının olmaması**dır (**doğru**). Yine \"Türk kahvesi Türkiye''nin önde gelen tarımsal ihraç ürünlerindendir.\" demek **yanlıştır**; kahve iklimimiz nedeniyle hiç yetişmez, çekirdeği tamamen ithaldir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Tarım ürünlerinde üç tuzağa dikkat et: 1. **Çay** (Rize) ile **fındık** (Ordu) üretim liderliklerini karıştırma; ayrıca çayın kireçsiz ve yıkanmış **asidik** toprak istediğini unutma. 2. **Kırmızı mercimek** Güneydoğu Anadolu''da, **yeşil mercimek** ise İç Anadolu''da yoğunlaşır. 3. Türkiye çay, fındık, incir, kayısıda kendine yeter ve ihraç eder; ancak **pirinç, muz, kahve ve soya fasulyesinde** iç tüketimi karşılayamaz ve ithalat yapar."
  },
  {
    "type": "key_points",
    "items": [
      "Buğday yaz kuraklığı istediğinden Doğu Karadeniz kıyısında yetişmez; mısır Karadeniz''in doğal bitkisi olsa da ticari üretim Çukurova ve Konya''dadır.",
      "Çeltik (pirinç) sıtma nedeniyle devlet kontrolündedir ve ithal edilir; kahve ise Türkiye''de hiç yetişmez.",
      "Turunçgil ve zeytin kış ılıklığı ister (Doğu Anadolu''da yok); elma ve üzüm soğuğa çok dayanıklıdır.",
      "Kırmızı mercimek Güneydoğu, yeşil mercimek İç Anadolu; kuru incir Aydın, kuru üzüm Manisa, kayısı Malatya lideridir."
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
  'cografya.turkiye_de_tarim_ve_hayvancilik.03',
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  3,
  'Bölüm 3: Sanayi Bitkileri, Seracılık ve Devlet Kontrolündeki Ürünler',
  'Sanayi bitkileri ve seracılık, Türkiye''de tarımsal gelirin en yüksek olduğu alanı oluşturur.  Pamuk, yetişme döneminde su, olgunlaşma (koza açma) döneminde ise yüksek sıcaklık ve kuraklık ister.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sanayi bitkileri ve seracılık, Türkiye''de tarımsal gelirin en yüksek olduğu alanı oluşturur. **Pamuk**, yetişme döneminde su, olgunlaşma (koza açma) döneminde ise yüksek sıcaklık ve kuraklık ister. GAP projesiyle sulamanın başlamasından önce Çukurova ve Ege (Büyük Menderes) öne çıkarken, günümüzde sulanan **GAP sahası ve yüksek güneşlenme sayesinde Şanlıurfa**, Türkiye pamuğunun çok büyük bölümünü tek başına üretmektedir. Buna karşılık **Çarşamba Ovası (Samsun)** verimli bir delta olmasına rağmen Karadeniz''de **sonbahar yağışları** çok yüksek olduğu için pamuk kozaları çürür; bu nedenle Karadeniz kıyılarında pamuk ekilemez."
  },
  {
    "type": "paragraph",
    "text": "**Şeker pancarı**, çabuk bozulan ve ağır bir hammadde olduğundan şeker fabrikaları tarlaların hemen yanına kurulur (**hammaddeye yakınlık**); ayrıca fabrikadan çıkan yaş pancar küspesi besi hayvanları için mükemmel bir yem olduğundan şeker fabrikası çevresinde **ahır/besi hayvancılığı** gelişir. Şeker pancarı kıyılarda da iklim olarak rahatlıkla yetişebilir; ancak Akdeniz ve Ege kıyılarında çiftçiler aynı tarladan yılda 2–3 kez ürün alabildikleri daha kârlı ürünleri (turunçgil, turfanda sebze, muz, pamuk) tercih ettikleri için şeker pancarı tarımı iç bölgelerde yoğunlaşmıştır."
  },
  {
    "type": "paragraph",
    "text": "Türkiye''de bazı ürünlerin ekim alanı **doğal şartlar** nedeniyle (muz ve çay yalnız dar mikroklima/iklim alanlarında yetişebilir), bazılarının ekim alanı ise **yasal/devlet kontrolü** nedeniyle dardır: **Haşhaş ve kenevir** iklim olarak her bölgede yetişebildiği halde uyuşturucu ham maddesi içerdiklerinden yalnız devletin izin verdiği illerde ekilir; **tütün** ise taban arazilerde irileşip kalitesi bozulmasın diye Türk tütününün ihraç değerini ve **kalite standardını korumak** amacıyla kıraç ve yamaçlarda devlet kotasına tabidir. **Seracılık**ta ise belirleyici unsur kış ılıklığı ve ısıtma maliyetidir: Kışın Toroslar soğuk rüzgârları kestiği ve güneşlenme fazla olduğu için seraları ısıtma maliyeti en düşük olan **Akdeniz kıyı kuşağı (Antalya ve Mersin)** seracılığın başkentidir. İç ve doğu bölgelerde kış soğuğu nedeniyle seraların yakıt maliyeti çok yüksek olduğundan seracılık gelişememiş, yalnız jeotermal sıcak suyun bulunduğu Denizli–Afyonkarahisar–Kütahya gibi sınırlı sahalarda jeotermal seracılık kurulabilmiştir. Ayrıca Ege kıyılarında da İzmir ve Muğla çevresinde örtü altı sebze-çiçek yetiştiriciliği yapılmaktadır; kış güneşi burada da maliyetleri düşürür."
  },
  {
    "type": "table",
    "headers": [
      "Ürün",
      "Devlet Kontrol / Dağılış Nedeni",
      "Kritik İklim / Ekonomi Notu"
    ],
    "rows": [
      [
        "**Pamuk**",
        "Şanlıurfa (GAP) lider; Çukurova, Ege",
        "Karadeniz kıyısında (Çarşamba) **sonbahar yağışları** yüzünden yetişmez"
      ],
      [
        "**Şeker Pancarı**",
        "İç bölgelerde kümelenmiş (kota uygulanır)",
        "Kıyıda iklim engeli **yok**; çiftçi daha kârlı ürünler seçtiği için ekilmez"
      ],
      [
        "**Tütün**",
        "Kalite standardını koruma amaçlı devlet kontrolü",
        "Kıyıda ve kıraç yamaçlarda (Ege, Karadeniz, Güneydoğu) kaliteli yetişir"
      ],
      [
        "**Haşhaş / Kenevir**",
        "Uyuşturucu ham maddesi nedeniyle yasal kısıtlama",
        "İklim engeli yok; yasal izinle Afyonkarahisar, Samsun vb. illerde ekilir"
      ],
      [
        "**Seracılık**",
        "Kış ılıklığı ve düşük ısıtma maliyeti",
        "**Antalya ve Mersin** lider; iç kesimlerde ısıtma maliyeti çok yüksektir"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Devlet kontrolündeki başlıca tarım ürünlerini **Ç-H-K-T-Ş** şeklinde kodla: - **Ç**eltik (sıtma / halk sağlığı) - **H**aşhaş (uyuşturucu ham maddesi) - **K**enevir (uyuşturucu ham maddesi) - **T**ütün (kalite standardı) - **Ş**eker pancarı (kota / planlama)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Neden-sonuç çözümlemesi: \"Şeker pancarı Akdeniz ve Ege kıyılarında iklim elverişsiz olduğu için yetiştirilmez.\" yargısı **yanlıştır**; şeker pancarı kıyıda da çok iyi yetişir ancak çiftçi narenciye, muz ve sebzeden çok daha yüksek gelir elde ettiği için pancar ekmez (**doğru**). Yine \"Tütün ekimine getirilen devlet denetimi, vatandaşlara sigarayı bıraktırmak içindir.\" yargısı **yanlıştır**; asıl amaç **kaliteli Türk tütününün ihracat değerini korumaktır**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sanayi bitkilerinde iki ayrıma dikkat et: 1. Ekim alanı **iklim seçiciliği** yüzünden dar olan ürünler (**muz, çay**) ile **devlet kısıtlaması** yüzünden dar olan ürünler (**haşhaş, kenevir**) aynı grupta değildir! 2. Karadeniz''deki **Çarşamba Ovası** çok verimli olmasına rağmen **sonbahar yağışları** yüzünden pamuk tarımına kapalıdır."
  },
  {
    "type": "key_points",
    "items": [
      "GAP sulamaları sonrası Türkiye pamuğunun lideri Şanlıurfa olmuştur; Karadeniz kıyısında pamuk yetişmez.",
      "Şeker pancarı kıyıda iklimden dolayı değil, daha kârlı alternatif ürünler yüzünden ekilmez; fabrika çevresinde küspeden dolayı besi hayvancılığı gelişir.",
      "Çeltik sıtma, haşhaş ve kenevir uyuşturucu, tütün ise kalite standardı nedeniyle devlet kontrolündedir.",
      "Seracılıkta Antalya, kış ılıklığı ve düşük ısıtma maliyeti sayesinde birinci sıradadır."
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
  'cografya.turkiye_de_tarim_ve_hayvancilik.04',
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  4,
  'Bölüm 4: Hayvancılık Türleri, Arıcılık ve Balıkçılık',
  'Türkiye''de hayvancılığın dağılışını iklim, bitki örtüsü ve tüketici pazarı belirler.  Karasal iklimin yaygın olduğu İç Anadolu ve Doğu Anadolu''da ilkbahar yağışlarıyla yeşeren kısa bozkır otlarına en iyi uyum sağlayan hayvan koyundur; bu nedenle Türkiye''de sayıca en fazla beslenen çiftlik hayvanı koyundur (meraya dayalı koyunculuğun en büyük krizi ise ilkbahar kuraklığıdır).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''de hayvancılığın dağılışını iklim, bitki örtüsü ve tüketici pazarı belirler. Karasal iklimin yaygın olduğu İç Anadolu ve Doğu Anadolu''da ilkbahar yağışlarıyla yeşeren kısa **bozkır** otlarına en iyi uyum sağlayan hayvan **koyun**dur; bu nedenle Türkiye''de sayıca en fazla beslenen çiftlik hayvanı koyundur (meraya dayalı koyunculuğun en büyük krizi ise ilkbahar kuraklığıdır). Akdeniz''in dik ve kayalık Toros yamaçlarında **maki** yapraklarıyla beslenen **kıl keçisi** orman filizlerine zarar verdiği için orman köylerinde kısıtlanmıştır; değerli tiftik dokuması için beslenen **tiftik keçisi (Ankara keçisi)** ise İç Anadolu (Ankara) ve kısmen Güneydoğu''da görülür."
  },
  {
    "type": "paragraph",
    "text": "**Büyükbaş hayvancılık** iki farklı yöntemle yapılır: (1) Yaz yağışlarıyla gür **alpin çayırların** yetiştiği **Erzurum-Kars-Ardahan** platolarında doğal **mera büyükbaş hayvancılığı** hâkimdir; (2) Marmara ve İç Anadolu''daki büyük kentlerin ve şeker fabrikalarının çevresinde ise meraya ihtiyaç duymadan fenni yem ve küspeyle yapılan **besi (ahır) hayvancılığı** gelişmiştir (burada kuruluş nedeni çayır değil, **büyük pazara ve yeme yakınlık**tır). Suya bağımlı kalın derili **manda** ise sulak delta ve göl kenarlarında, özellikle **Samsun Kızılırmak Deltası (Bafra)** çevresinde yoğunlaşır. İklim ve bitki örtüsünden tamamen bağımsız kapalı tesislerde yapılan **kümes hayvancılığı** ise et ve yumurtanın bozulmadan hızla ulaştırılması için dev tüketici pazarı olan **Marmara ve Ege** ekseninde toplanmıştır."
  },
  {
    "type": "paragraph",
    "text": "**İpek böcekçiliğinde** tarihsel olarak Bursa bilinse de günümüzde sanayileşmeyle dutlukların azalması sonucu TÜİK verilerine göre yaş koza üretiminde **Diyarbakır (Kulp ilçesi)** Türkiye birincisi konumundadır. Engebeli ve çiçekli dağlık arazilerden olumlu etkilenen **arıcılık**ta ise Muğla kızılçam ormanlarından dünya çapında **çam balı** üretilirken, **Ordu, Rize (Anzer), Kars ve Hakkâri** zengin çiçek balıyla öne çıkar. **Balıkçılık**ta iki ters orantı vardır: Karadeniz''e dökülen büyük nehirlerin taşıdığı besin ve serin sudaki oksijen nedeniyle plankton bol olduğundan **balık miktarında Karadeniz** (Trabzon, Samsun) açık ara liderdir (ancak Karadeniz''in 200 m altında zehirli $\\mathrm{H_2S}$ gazı bulunduğundan yaşam yalnız üst katmandadır). Buna karşılık sıcak ve tuzlu **Akdeniz''de balık tür çeşitliliği** daha fazladır. Denizlerdeki **kültür (kafes) balıkçılığı**nda ise girintili koylarıyla **Muğla ve İzmir** liderdir. İç sulardan **Tuz Gölü** aşırı tuzluluktan dolayı hiçbir balığa izin vermezken, sodalı **Van Gölü**''nde yalnızca **inci kefali** yaşar. Ayrıca hayvancılıktan elde edilen et ve süt verimini artırmanın yolu hayvan sayısını artırmak değil, **yerli ırkların ıslahı**, erken kesimin önlenmesi, **mera ıslahı** ve ahır besiciliğinin yaygınlaştırılmasıdır. Süt ve besi hayvancılığında soğuk zincir taşımacılığının gelişmesi de hayvansal ürünlerin pazar değerini yükseltmektedir."
  },
  {
    "type": "table",
    "headers": [
      "Hayvancılık Kolu",
      "Önde Gelen Saha",
      "Temel Sebep"
    ],
    "rows": [
      [
        "Koyun / Kıl Keçisi / Tiftik",
        "Koyun: İç Anadolu · Kıl: Toroslar · Tiftik: Ankara",
        "Bozkır otu / Maki ve kayalık / Karasal step"
      ],
      [
        "Mera Büyükbaş vs. Besi",
        "Mera: **Erzurum-Kars** · Besi: **Marmara / İç Anadolu**",
        "Alpin çayır vs. **Büyük pazar ve şeker küspesi**"
      ],
      [
        "Kümes / İpek Böceği",
        "Kümes: **Marmara-Ege** · İpek: **Diyarbakır**",
        "İklimden bağımsız pazara yakınlık / Güncel TÜİK lideri"
      ],
      [
        "Arıcılık / Balıkçılık",
        "Çam balı: **Muğla** · Avcılık: **Karadeniz** · Kafes: **Muğla-İzmir**",
        "Plankton çokluğu (miktar) vs. Girintili koylar (kültür)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Hayvancılık çözümlemesi: \"Kümes hayvancılığı ve besi hayvancılığının Marmara''da yoğunlaşmasının nedeni bölgedeki geniş doğal çayırlardır.\" yargısı **yanlıştır**; ikisi de kapalı tesislerde yemle yapılır, kuruluş nedeni **büyük tüketici pazarına yakınlık**tır (**doğru**). Aynı şekilde \"İpek böceği yaş koza üretiminde Türkiye birincisi Bursa''dır.\" yargısı güncel TÜİK verilerine göre **yanlıştır**, birinci il **Diyarbakır**dır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Hayvancılık ve balıkçılıkta üç tuzağa dikkat et: 1. **Balık miktarı (Karadeniz)** ile **balık tür çeşitliliği (Akdeniz)** ve **kafes kültür balıkçılığı (Muğla/İzmir)** birbirine karıştırılır. 2. **Tuz Gölü** ve Burdur gibi aşırı tuzlu/acı göllerde balıkçılık **yapılamaz**; Van Gölü''nde ise endemik **inci kefali** avlanır. 3. **Manda** kurak bozkırlarda yaşayamaz; sulak delta ve gölet kenarlarını (Samsun Bafra) sever."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye''de en çok koyun beslenir; kıl keçisi Akdeniz/Toroslar''da, tiftik keçisi Ankara''dadır.",
      "Mera büyükbaş Erzurum-Kars''ta (çayır); besi büyükbaş ve kümes hayvancılığı Marmara-Ege''de (pazar) yoğunlaşır.",
      "Güncel yaş koza (ipek böceği) lideri Diyarbakır''dır; çam balında Muğla öne çıkar.",
      "Balık miktarında Karadeniz, tür çeşitliliğinde Akdeniz, kültür kafes balıkçılığında Muğla ve İzmir liderdir."
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

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Madenler ve Enerji Kaynakları
-- Kaynak: docs/konu_anlatimi/cografya/05_madenler_ve_enerji_kaynaklari.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================
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
  'cografya.madenler_ve_enerji_kaynaklari.01',
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  1,
  'Bölüm 1: Türkiye''de Madencilik, Rezervler ve Metalik Madenler',
  'Türkiye jeolojik yapısının çok çeşitli olması nedeniyle maden türü bakımından zengin bir ülkedir; ancak yatakların bir kısmı dağınık ve düşük tenörlüdür.  Türkiye''de maden çeşitliliğinin en fazla olduğu bölge Doğu Anadolu, bölüm Yukarı Fırat Bölümü, il ise Elazığ''dır (Maden''de bakır, Guleman''da krom, Keban''da kurşun-çinko, Alacakaya''da vişne mermeri).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye jeolojik yapısının çok çeşitli olması nedeniyle maden türü bakımından zengin bir ülkedir; ancak yatakların bir kısmı dağınık ve düşük tenörlüdür. Türkiye''de **maden çeşitliliğinin en fazla olduğu bölge Doğu Anadolu**, bölüm **Yukarı Fırat Bölümü**, il ise **Elazığ**''dır (Maden''de bakır, Guleman''da krom, Keban''da kurşun-çinko, Alacakaya''da vişne mermeri). Buna karşılık sanayinin kalbi olan Marmara, yer altı maden çeşitliliği bakımından oldukça fakirdir. Türkiye''nin maden ihracat gelirlerinde açık ara birinci sırada ise işlenmiş ve blok **mermer** yer alır (Afyonkarahisar, Marmara Adası, Bilecik, Muğla, Elazığ)."
  },
  {
    "type": "paragraph",
    "text": "Bir maden yatağının işletmeye açılabilmesi için belirli ekonomik şartların bir arada bulunması gerekir: Rezervin (toplam miktarın) yeterli olması, cevher içindeki saf metal oranı olan **tenörün** yüksek olması, çıkarım derinliğinin maliyetleri kurtarması, ulaşım ağlarına yakınlık ve sermaye imkânı. Bu kriterleri taşımayan küçük yataklar ekonomik olmadığı için işletilmez. Ayrıca hammaddeyi ham cevher olarak satmak yerine işleyerek ihraç etmek ülke ekonomisine çok daha yüksek gelir sağlar."
  },
  {
    "type": "paragraph",
    "text": "Başlıca metalik madenlerimiz ve çıkarıldıkları sahalar şunlardır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Demir:** Çelik sanayisinin ana ham maddesidir; **Sivas (Divriği)**, **Malatya (Hekimhan, Hasançelebi)** ve **Sakarya (Çamdağı)** başlıca yataklardır.",
      "**Bakır:** Elektrik-elektronik sanayisinde kullanılır; **Kastamonu (Küre)**, **Artvin (Murgul)**, **Diyarbakır (Ergani)**, **Elazığ (Maden)** ve **Rize (Çayeli)** ana yataklardır.",
      "**Krom:** Paslanmaz çelik üretiminde sertleştirici olarak kullanılır; Türkiye dünya krom rezervinde önemli paya sahiptir. En zengin yataklar **Elazığ (Guleman)** ve **Muğla (Fethiye–Köyceğiz–Dalaman)** yörelerindedir; **Elazığ** (hammaddeye yakın) ve **Antalya**''da (liman-ihracata yakın) ferrokrom tesisleri vardır.",
      "**Boksit (Alüminyum):** Hafif metal sanayisinin ham maddesidir; **Konya (Seydişehir)** ve **Antalya (Akseki)**''de çıkarılır, Türkiye''nin tek alüminyum fabrikası **Konya–Seydişehir**''dedir.",
      "**Kurşun-Çinko ve Cıva:** Kurşun-çinko **Elazığ (Keban)** ve Kayseri''de çıkarılır. Doğadaki tek sıvı metal olan **cıva** yatakları **İzmir (Ödemiş, Karaburun)** ve **Konya (Sarayönü)**''nde bulunmasına rağmen ağır zehirlenme riski ve **Minamata Sözleşmesi** nedeniyle günümüzde çevre mevzuatı gereği kapatılmıştır. Harita üzerinde metalik madenlerin özellikle Doğu Anadolu (Elazığ–Malatya–Sivas ekseni) ve Karadeniz kuşağında yoğunlaştığı görülür. Türkiye''de maden çeşitliliğinin fazla olmasının temel nedeni ise farklı jeolojik dönemlere ait kıvrım, kırık ve volkanik süreçlerin aynı topraklarda yaşanmış olmasıdır; ayrıca volkanik sokulumlar ve metamorfizma metalik cevher damarlarının oluşumunu kolaylaştırmıştır. Buna karşılık yatakların küçük parçalara bölünmüş olması işletme maliyetini artırabilmektedir. Örneğin yüksek kaliteli demir cevherimizin bir kısmı Sivas ve Malatya''dan çıkarılsa da demir-çelik fabrikalarının artan ihtiyacını karşılamak amacıyla yurt dışından da demir cevheri ve hurda demir ithal edilmektedir. Bakırda ise Türkiye kendi ihtiyacının önemli bir bölümünü karşılayıp ihracat da yapabilen üretici ülkeler arasındadır; aynı şekilde krom da önemli ihraç madenlerimizdendir ve dış satımda öne çıkar."
    ]
  },
  {
    "type": "table",
    "headers": [
      "Metalik Maden",
      "Başlıca Çıkarım Sahaları",
      "İşleme Tesisi / Kritik Not"
    ],
    "rows": [
      [
        "**Demir**",
        "Sivas (Divriği), Malatya (Hekimhan, Hasançelebi)",
        "**Karabük, Ereğli** (enerjiye yakın), **İskenderun** (liman/ulaşım)"
      ],
      [
        "**Bakır**",
        "Küre, Murgul, Ergani, Maden, Çayeli (**KADER**)",
        "**Samsun** (liman/ulaşım — Samsun''da bakır çıkmaz!), Murgul, Ergani"
      ],
      [
        "**Krom**",
        "Elazığ (Guleman), Muğla (Fethiye-Köyceğiz)",
        "**Elazığ** (hammaddeye yakın), **Antalya** (limana yakın)"
      ],
      [
        "**Boksit**",
        "Konya (Seydişehir), Antalya (Akseki)",
        "**Konya–Seydişehir** (tek alüminyum tesisi)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Türkiye''nin beş büyük **bakır** çıkarım merkezini **K-A-D-E-R** şeklinde kodla: - **K**astamonu (Küre) - **A**rtvin (Murgul) - **D**iyarbakır (Ergani) - **E**lazığ (Maden) - **R**ize (Çayeli)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Maden eşleştirme örneği: \"Sivas–Divriği ve Malatya–Hekimhan''da krom, Elazığ–Guleman''da ise demir çıkarılır.\" yargısı **yanlıştır**; tam tersine Divriği ve Hekimhan başlıca **demir** yatakları, Guleman ise Türkiye''nin en önemli **krom** yatağıdır (**doğru**). Yine bakır madeni sahaları arasına **Eskişehir–Seyitgazi**''yi koymak **yanlıştır**; Seyitgazi bakır değil **bor** merkezidir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Metalik madenlerde iki tuzağa dikkat et: 1. **Guleman (krom)** ile **Divriği–Hekimhan (demir)** sahalarını birbirine karıştırma. 2. **İzmir Ödemiş** ve **Konya Sarayönü** cıva ocaklarının çevre sağlığı ve uluslararası sözleşmeler nedeniyle **kapalı** olduğunu unutma."
  },
  {
    "type": "key_points",
    "items": [
      "Maden çeşitliliği en fazla Doğu Anadolu (Yukarı Fırat / Elazığ); maden ihracat gelirinde 1. sıra ise **mermer**dir.",
      "Demir: Divriği, Hekimhan, Hasançelebi; Krom: Guleman, Fethiye-Köyceğiz; Boksit: Seydişehir, Akseki.",
      "Bakır çıkarım merkezleri **KADER**''dir (Küre, Artvin/Murgul, Diyarbakır/Ergani, Elazığ/Maden, Rize/Çayeli).",
      "Cıva yatakları çevre mevzuatı gereği günümüzde işletilmemektedir."
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
  'cografya.madenler_ve_enerji_kaynaklari.02',
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  2,
  'Bölüm 2: Endüstriyel Hammaddeler, Nadir Elementler ve Kuruluş Faktörleri',
  'Türkiye özellikle metal dışı endüstriyel madenlerde stratejik bir güce sahiptir.  Bunların başında dünya rezervlerinin yaklaşık %72–73''ünü elinde bulundurduğumuz bor gelir: Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa), Kütahya (Emet) ve Eskişehir (Seyitgazi/Kırka) başlıca çıkarım sahalarıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye özellikle metal dışı endüstriyel madenlerde stratejik bir güce sahiptir. Bunların başında dünya rezervlerinin yaklaşık **%72–73**''ünü elinde bulundurduğumuz **bor** gelir: **Balıkesir (Bigadiç, Susurluk)**, **Bursa (Mustafakemalpaşa)**, **Kütahya (Emet)** ve **Eskişehir (Seyitgazi/Kırka)** başlıca çıkarım sahalarıdır. Eti Maden''in üç ana bor işleme tesisi ise **Kırka** (Sodyum Borat), **Emet** (Borik Asit — hammaddeye yakın) ve **Bandırma**''dadır (Borik Asit ve Bor Karbür — limana yakın). Borun ham mineral olarak tonu birkaç yüz dolara satılması yerine **Bandırma Bor Karbür** tesisinde zırh ve yüksek teknoloji parçasına dönüştürülmesi, madencilikte **katma değer artışı**nın en somut örneğidir."
  },
  {
    "type": "paragraph",
    "text": "Diğer önemli endüstriyel madenlerimiz şunlardır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Fosfat:** Gübre sanayisinin ham maddesidir; **Mardin (Mazıdağı)**''nda çıkarılıp işlenir ancak tüketimi karşılamadığı için ithal edilir.",
      "**Barit:** Yüksek özgül ağırlığı nedeniyle petrol ve doğal gaz kuyularında püskürmeyi önleyen **sondaj çamuru** yapımında kullanılır (**Antalya–Alanya/Gazipaşa**).",
      "**Feldspat:** Cam ve seramik sanayisinin temel mineralidir; Batı Anadolu''da (**Manisa–Demirci, Muğla–Milas, Aydın–Çine**) yoğunlaşır ve Türkiye''nin başlıca ihraç madenlerindendir.",
      "**Süs Taşları ve Nadir Toprak Elementleri:** Siyah tespih ve takı taşı **oltu taşı Erzurum**''da; pipo ve biblo yapımında kullanılan beyaz **lületaşı Eskişehir**''de çıkarılır. Geleceğin nükleer yakıtı **toryum** ve nadir toprak elementleri (NTE) bakımından ise **Eskişehir (Sivrihisar–Beylikova)** dünyanın en büyük rezervlerinden birini barındırır."
    ]
  },
  {
    "type": "paragraph",
    "text": "Sanayi tesislerinin yer seçiminde **hammadde** ile **enerji/ulaşım** faktörlerini mutlaka ayırmalısın: **Seydişehir Alüminyum**, **Elazığ Ferrokrom**, **Murgul Bakır** ve **Afyon Mermer** tesisleri doğrudan **hammaddeye yakınlık**la kurulurken; **Karabük ve Ereğli Demir-Çelik** demiri eritecek yüksek kalorili taş kömürü nedeniyle **enerji kaynağına yakınlık**la, **İskenderun Demir-Çelik** ve **Samsun Bakır** tesisleri ise gemi ve demiryolu bağlantısı nedeniyle **ulaşım ve liman** avantajıyla kurulmuştur (Samsun''da bakır çıkmaz, Küre''den gelir!)."
  },
  {
    "type": "paragraph",
    "text": "Diğer önemli endüstriyel mineraller arasında cam sanayisinin ham maddesi **kuvars kumu** (İstanbul–Şile, Sinop), kâğıt-boya-lastikte kullanılan **kaolin**, ateşe dayanıklı tuğlada kullanılan **manyezit** (Eskişehir–Kütahya) ve göl kıyıları ile Çankırı–Kars–Kırşehir''de üretilen **kaya tuzu / göl tuzu** (Tuz Gölü, İzmir Çamaltı Tuzlası) yer alır. Türkiye bu tuz kaynakları sayesinde kendi ihtiyacını rahatlıkla karşılar. Harita dağılışında bor ve feldspatın Batı Anadolu''da, fosfatın ise Güneydoğu''da (Mazıdağı) toplandığını aklında tutmalısın. Ayrıca mermer ve traverten gibi doğal taşların kesilip işlenerek blok veya plaka halinde ihraç edilmesi, Türkiye madencilik dış ticaretinde en yüksek döviz girdisini sağlamaya devam etmektedir. Benzer biçimde yapı sektörünün temel girdisi olan alçı taşı (jips) Sivas ve Ankara çevresinde, perlit ve pomza ise volkanik arazilerin yaygın olduğu Nevşehir, Bitlis ve İzmir yörelerinde bolca çıkarılmaktadır; bu çeşitlilik inşaat sanayisini destekler ve yapı malzemesi üretimini kolaylaştırır. Türkiye''de maden çeşitliliği bu sayede hem iç pazarı hem de ihracatı besler."
  },
  {
    "type": "table",
    "headers": [
      "Maden",
      "Başlıca Yatağı",
      "Kuruluş / Kullanım Özelliği"
    ],
    "rows": [
      [
        "**Bor**",
        "Bigadiç, Susurluk, Mustafakemalpaşa, Emet, Kırka",
        "Dünya rezervinin ~%72-73''ü; tesisler: Kırka, Emet, **Bandırma**"
      ],
      [
        "**Fosfat / Barit**",
        "Fosfat: **Mardin (Mazıdağı)** · Barit: **Alanya-Gazipaşa**",
        "Gübre (ithal edilir) / Petrol kuyusu **sondaj çamuru**"
      ],
      [
        "**Oltu Taşı / Lületaşı**",
        "Oltu: **Erzurum** · Lületaşı: **Eskişehir**",
        "İlleri sıkça çaprazlanarak sorulur"
      ],
      [
        "**Toryum / Feldspat**",
        "Toryum: **Eskişehir (Beylikova)** · Feldspat: **Batı Anadolu**",
        "Geleceğin nükleer yakıtı / Cam ve seramik ihracatı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Kuruluş faktörü çözümlemesi: \"Samsun Bakır İşletmesi ve İskenderun Demir-Çelik Fabrikası hammaddeye yakınlık ilkesiyle kurulmuştur.\" yargısı **yanlıştır**; Samsun''da bakır, İskenderun''da demir ve taş kömürü çıkmaz, ikisi de **liman ve ulaşım** kolaylığıyla kurulmuştur (**doğru**). Yine Karabük ve Ereğli demire değil, **enerji kaynağına (taş kömürü)** yakın kurulmuştur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Endüstriyel madenlerde iki tuzağa dikkat et: 1. **Oltu taşı (Erzurum)** ile **Lületaşı (Eskişehir)** merkezlerini çaprazlama tuzağına düşme. 2. **Ereğli**''de demir-çelik fabrikası vardır, bor tesisi yoktur; Eti Maden''in bor tesisleri **Kırka, Emet ve Bandırma**''dadır."
  },
  {
    "type": "key_points",
    "items": [
      "Bor rezervinde dünya lideriyiz; ham satış yerine Bandırma Bor Karbür gibi tesislerle katma değer artırılmaktadır.",
      "Fosfat Mardin–Mazıdağı''nda çıkar (yetersiz olduğu için ithal edilir); Barit sondaj çamurudur; Feldspat cam-seramikte kullanılır.",
      "Oltu taşı Erzurum''da, Lületaşı Eskişehir''de, Toryum Eskişehir–Beylikova''da bulunur.",
      "Karabük–Ereğli enerjiye; İskenderun ve Samsun Bakır liman/ulaşıma; Seydişehir ve Elazığ Ferrokrom ise hammaddeye yakındır."
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
  'cografya.madenler_ve_enerji_kaynaklari.03',
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  3,
  'Bölüm 3: Fosil Enerji Kaynakları ve Termik Santraller',
  'Enerji kaynakları tükenen (fosil / yenilenemeyen: kömür, petrol, doğal gaz) ve tükenmeyen (yenilenebilir: su, rüzgâr, güneş, jeotermal) olmak üzere ikiye ayrılır.  Türkiye fosil kaynaklardan özellikle linyit bakımından çok zengindir: III.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Enerji kaynakları tükenen (**fosil / yenilenemeyen**: kömür, petrol, doğal gaz) ve tükenmeyen (**yenilenebilir**: su, rüzgâr, güneş, jeotermal) olmak üzere ikiye ayrılır. Türkiye fosil kaynaklardan özellikle **linyit** bakımından çok zengindir: III. Jeolojik Zaman''da oluşmuş, kalorisi taş kömürüne göre düşük olan linyit Türkiye''nin hemen her bölgesine yayılmıştır ve elektrik santrallerinde yakılan linyitin neredeyse tamamı **yerli** yataklarımızdan sağlanır. Türkiye''deki toplam linyit rezervinin yaklaşık yarısı tek başına **Kahramanmaraş (Afşin–Elbistan)** havzasındadır; ayrıca Manisa (**Soma**), Muğla (**Yatağan**), Kütahya (**Tunçbilek, Tavşanlı, Seyitömer**) ve Ankara (**Çayırhan**) başlıca linyit santralleridir."
  },
  {
    "type": "paragraph",
    "text": "Buna karşılık I. Jeolojik Zaman ürünü olan yüksek kalorili **taş kömürü** yalnız **Zonguldak** havzasında çıkarılır ve tüketimin %90''ından fazlası **ithal** edilir. Taş kömürü yüksek ısı verdiği için Karabük-Ereğli demir-çelik fabrikalarında kok kömürü olarak kullanılır (linyitin kalorisi demiri eritmeye yetmez); ayrıca Zonguldak''taki **Çatalağzı Termik Santrali** yerli taş kömürüyle elektrik üreten köklü santraldir."
  },
  {
    "type": "paragraph",
    "text": "**Petrolde** Türkiye''nin ilk ticari keşfi 1940 yılında **Batman–Raman Dağı**''nda yapılmıştır (son yıllarda **Şırnak–Gabar Dağı**''nda yeni büyük rezervler keşfedilmiş olsa da tüketimin büyük kısmı ithaldir). Rafinerilerden yalnız **Batman Rafinerisi** **hammaddeye yakın**dır; **İzmit (İpraş/TÜPRAŞ)** ve **İzmir (Aliağa)** liman/pazar, **Kırıkkale (Orta Anadolu)** ise stratejik iç güvenlik nedeniyle (petrol Adana/Ceyhan''dan boru hattıyla pompalanır) kurulmuştur; **Mersin ATAŞ** günümüzde depolama/dağıtım terminali olarak işlev görür. **Doğal gazda** Hamitabat (Kırklareli), Ambarlı (İstanbul) ve Ovaakça (Bursa) santralleri doğal gazla çalışır. Kurak yıllarda hidroelektrik barajlarında su azaldığında açığı kapatmak için anında devreye sokulabilen **doğal gaz santrallerine** yüklenildiğinden, kurak yıllarda doğal gaz ithalat faturamız ve cari açık yükselir; **Karadeniz Sakarya Gaz Sahası**''ndan Filyos''a taşınan yerli gaz bu dışa bağımlılığı azaltmayı hedefler."
  },
  {
    "type": "paragraph",
    "text": "Fosil yakıtların ortak sorunu atmosfere yoğun karbon salımı yapmaları ve hava kirliliğini artırmalarıdır; özellikle kalorisi düşük ve kükürt oranı yüksek linyit santrallerinde baca filtresi kullanılmaması çevre ve insan sağlığı açısından ciddi risk oluşturur. Buna karşılık yüksek kalorili taş kömürü yalnızca Zonguldak''taki Çatalağzı''nda elektrik üretirken, demir-çelik fırınlarında eritme amacıyla da kullanıldığı için stratejik sanayi girdisidir. Doğal gaz ise çevreyi kömüre kıyasla daha az kirletir ancak dışa bağımlılık nedeniyle maliyeti yüksektir. Bu nedenle son yıllarda yerli linyit santrallerinde baca gazı arıtma sistemlerinin zorunlu hale getirilmesi ve yerli petrol ile doğal gaz arama-üretim yatırımlarının (Gabar ve Sakarya sahaları) hızlandırılması enerji politikamızın temel eksenini oluşturmaktadır. Ayrıca asfaltit yataklarının ise Şırnak–Silopi çevresinde çıkarılıp termik santralde değerlendirildiğini bilmek gerekir; bu da bölge enerji üretimine katkı sağlar."
  },
  {
    "type": "table",
    "headers": [
      "Enerji Kaynağı",
      "Başlıca Çıkarım / Santral",
      "Kritik Sınav Detayı"
    ],
    "rows": [
      [
        "**Taş Kömürü**",
        "Zonguldak (Çatalağzı Santrali)",
        "I. Zaman ürünü, yüksek kalori (demir-çelikte yalnız bu kullanılır); büyük kısmı ithal"
      ],
      [
        "**Linyit**",
        "**Afşin-Elbistan** (~yarısı), Soma, Yatağan, Tunçbilek",
        "III. Zaman ürünü; **yerli** rezervimizin en güçlü olduğu fosil kaynak"
      ],
      [
        "**Petrol**",
        "Batman (Raman), Şırnak (Gabar)",
        "Tek hammaddeye yakın rafineri **Batman**; Kırıkkale Ceyhan''dan boru hattıyla beslenir"
      ],
      [
        "**Doğal Gaz**",
        "Hamitabat, Ambarlı, Ovaakça santralleri",
        "**Sakarya Gaz Sahası** (Filyos); kurak yıllarda tüketimi ve ithalat faturası artar"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Termik santral çözümlemesi: \"Türkiye''deki kömürlü termik santrallerin tamamı linyitle çalışmaktadır.\" yargısı **yanlıştır**; Zonguldak''taki **Çatalağzı Termik Santrali** taş kömürü ile elektrik üretir (**doğru**). Aynı şekilde \"Kırıkkale Rafinerisi çevrede çıkan petrolü işlemek için kurulmuştur.\" yargısı **yanlıştır**; Kırıkkale''de petrol çıkmaz, ham petrol Ceyhan''dan boru hattıyla gelir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Fosil yakıtlarda iki tuzağa dikkat et: 1. Taş kömürü, petrol ve doğal gazda Türkiye büyük oranda **dışa bağımlıdır (ithalatçıdır)**; neredeyse tamamen yerli kaynakla beslenen fosil yakıtımız **linyit**tir. 2. **Çatalağzı** (taş kömürü), **Soma / Yatağan / Afşin-Elbistan** (linyit) ve **Hamitabat / Ambarlı / Ovaakça** (doğal gaz) santrallerinin yakıt türlerini karıştırma."
  },
  {
    "type": "key_points",
    "items": [
      "Taş kömürü I. Zaman (Zonguldak / Çatalağzı); linyit III. Zaman (en büyük rezerv Kahramanmaraş Afşin-Elbistan).",
      "İlk petrol Raman Dağı''nda bulunmuştur; tek hammaddeye yakın rafineri Batman''dır.",
      "Doğal gaz santralleri (Hamitabat, Ambarlı, Ovaakça) aç-kapa esnekliği nedeniyle kurak yıllarda baraj açığını kapatır.",
      "Sakarya Gaz Sahası (Filyos) yerli doğal gazla enerji ithalat yükünü hafifletir."
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
  'cografya.madenler_ve_enerji_kaynaklari.04',
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  4,
  'Bölüm 4: Yenilenebilir Enerji Kaynakları, Barajlar ve Nükleer Enerji',
  'Türkiye yüksek, engebeli ve güneşli bir ülke olması nedeniyle yenilenebilir enerji potansiyeli açısından oldukça zengindir.  Hidroelektrik enerji potansiyeli akarsuyun uzunluğuna değil, debiye (su miktarına) ve yatak eğimine (yükselti/kot farkına) bağlıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye yüksek, engebeli ve güneşli bir ülke olması nedeniyle **yenilenebilir enerji** potansiyeli açısından oldukça zengindir. **Hidroelektrik enerji** potansiyeli akarsuyun uzunluğuna değil, **debiye (su miktarına)** ve **yatak eğimine (yükselti/kot farkına)** bağlıdır. Bu nedenle dik ve yüksek vadilere sahip **Doğu Anadolu** ve **Karadeniz** bölgelerinde hidroelektrik potansiyel çok yüksekken, düz ovada akan **Marmara (Ergene Nehri)**''nda potansiyel dip seviyededir. Barajlarımızda iki rekoru ayırmak gerekir: Su tutma hacmi, göl alanı ve elektrik üretim kapasitesi (kurulu güç) bakımından Türkiye''nin en büyük barajı Fırat Nehri üzerindeki **Atatürk Barajı** iken; **275 metre gövde (duvar) yüksekliğiyle** Türkiye''nin en yüksek barajı Artvin''de Çoruh Nehri üzerindeki **Yusufeli Barajı**''dır (ikincisi yine Çoruh''taki Deriner Barajı''dır)."
  },
  {
    "type": "paragraph",
    "text": "**Jeotermal enerji**, genç kırıklı fay hatlarına bağlı sıcak su kaynaklarından elde edilir ve Batı Anadolu Fay Sistemi''nin yer aldığı **Ege Bölgesi** açık ara liderdir: Türkiye''nin ilk jeotermal santrali **Denizli–Sarayköy**''de kurulmuş, ardından **Aydın–Germencik** ve Manisa–Alaşehir tesisleri gelmiştir. Ancak jeotermal akışkanlar bor, arsenik ve kükürt içerdiğinden, soğuyan atık sular yer altına geri basılmayıp akarsulara (Büyük Menderes, Gediz) bırakılırsa tarım alanlarında ağır **bor ve kimyasal kirlilik** yaratır."
  },
  {
    "type": "paragraph",
    "text": "**Rüzgâr enerjisi**nde ilk santral 1998''de **İzmir–Çeşme/Alaçatı**''da kurulmuştur; rüzgâr kurulu gücünde **Ege ve Güney Marmara** (İzmir, Balıkesir, Çanakkale, Manisa) liderdir. **Güneş enerjisi**nde ise bulutsuz gün sayısına bağlı olarak **Güneydoğu Anadolu ve Akdeniz** potansiyelde zirvedeyken, her mevsim nemli ve bulutlu olan **Karadeniz kıyı kuşağı** en düşük güneşlenme süresine (~1700 saat) sahiptir. **Nükleer enerji** yatırımları için seçilen **Mersin–Akkuyu** ve planlanan **Sinop** sahalarının temel seçilme nedeni buralarda uranyum bulunması **değildir**; iki temel kriter **deprem riskinin çok düşük olması (sismik stabilite)** ve reaktörlerin soğutulması için **deniz suyuna (kıyıya)** yakınlıktır."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca organik bitki ve hayvansal atıklardan elde edilen **biyokütle (biyoenerji)** de Türkiye''de hızla yaygınlaşan yenilenebilir kaynaklardandır. Türkiye''nin enerji stratejisinde temel hedef, yenilenebilir kaynakların (hidroelektrik, rüzgâr, güneş, jeotermal) elektrik üretimindeki payını artırarak hem fosil yakıt ithalatından doğan cari açığı düşürmek hem de karbon salımını azaltmaktır. Güneş ve rüzgâr kesintili üretim yaptığı için baz yük sağlayan hidroelektrik ve jeotermal ile dengelenir. Ayrıca Türkiye elektrik tüketiminin büyük bölümü sanayi ve nüfusun yoğunlaştığı Marmara ve Ege bölgelerinde gerçekleşirken, hidroelektrik üretimin önemli kısmı Doğu ve Güneydoğu Anadolu barajlarından sağlanarak yüksek gerilim hatlarıyla batıya iletilir. Bu durum enerji iletim hatlarının önemini artırır."
  },
  {
    "type": "table",
    "headers": [
      "Yenilenebilir / Nükleer Enerji",
      "Lider Bölge / Merkez",
      "Kuruluş Kriteri / Kritik Not"
    ],
    "rows": [
      [
        "**Hidroelektrik**",
        "Doğu Anadolu (Fırat-Dicle), Karadeniz (Çoruh)",
        "Yatak eğimi ve debi yüksek (**Atatürk** en büyük güç; **Yusufeli** en yüksek gövde)"
      ],
      [
        "**Jeotermal**",
        "**Ege** (Denizli–Sarayköy, Aydın–Germencik)",
        "Kırıklı fay hatları; atık su re-enjekte edilmezse **bor kirliliği** yapar"
      ],
      [
        "**Rüzgâr**",
        "**Ege ve Güney Marmara** (İlk: İzmir–Alaçatı)",
        "Sürekli rüzgâr koridorları ve tüketim merkezlerine yakınlık"
      ],
      [
        "**Güneş**",
        "En yüksek: **Güneydoğu ve Akdeniz** · En düşük: **Karadeniz**",
        "Bulutluluk oranı arttıkça güneşlenme süresi düşer"
      ],
      [
        "**Nükleer**",
        "**Mersin (Akkuyu)**, Sinop",
        "**Deprem riski azlığı** + **soğutma için deniz suyu** (uranyum çıktığı için değil!)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Baraj ve nükleer çözümlemesi: \"Mersin Akkuyu Nükleer Santrali''nin yer seçiminde bölgede zengin uranyum yataklarının bulunması etkili olmuştur.\" yargısı **yanlıştır**; Akkuyu''nun seçilme nedeni **düşük deprem riski** ve **Akdeniz''in soğutma suyu** sağlamasıdır (**doğru**). Barajlarda ise \"Türkiye''nin gövde yüksekliği en fazla olan barajı Atatürk Barajı''dır.\" yargısı **yanlıştır**; Atatürk en büyük hacimli ve en çok elektrik üreten barajımızdır, **en yüksek gövde** (275 m) **Yusufeli Barajı**''dır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yenilenebilir ve nükleer enerjide iki klasik tuzağa dikkat et: 1. Akarsuyun uzunluğu hidroelektrik potansiyelini artırmaz (Ergene uzun/menderesli ama potansiyeli çok düşük); belirleyici olan **eğim ve debi**dir. 2. **Atatürk Barajı** (en büyük kurulu güç ve rezervuar) ile **Yusufeli Barajı** (en yüksek gövde duvarı) sıkça birbirinin yerine çeldirici olarak konur."
  },
  {
    "type": "key_points",
    "items": [
      "Hidroelektrik potansiyel Doğu Anadolu ve Karadeniz''de yüksek, Marmara''da çok düşüktür.",
      "En büyük kurulu güç Atatürk Barajı; en yüksek gövde Yusufeli Barajı''dır.",
      "Jeotermal enerjide Ege (Denizli-Sarayköy, Aydın-Germencik); rüzgârda Ege-Marmara; güneşte Güneydoğu-Akdeniz liderdir.",
      "Mersin Akkuyu nükleer sahası düşük deprem riski ve deniz soğutması nedeniyle seçilmiştir."
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

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Sanayi, Ticaret ve Ulaşım
-- Kaynak: docs/konu_anlatimi/cografya/06_sanayi_ticaret_ve_ulasim.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================
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
  'cografya.sanayi_ticaret_ve_ulasim.01',
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  1,
  'Bölüm 1: Sanayinin Dağılışını Etkileyen Faktörler ve Başlıca Sanayi Kolları',
  'Türkiye''de sanayi tesislerinin dağılışı yalnız yer altı kaynaklarına göre değil; sermaye, büyük pazar, ulaşım, nitelikli iş gücü, hammadde ve askerî güvenlik ölçütlerine göre şekillenmiştir.  Marmara Bölgesi, maden ve enerji kaynakları bakımından Türkiye''nin en fakir bölgelerinden biri olmasına karşın sermaye birikimi, dev tüketim pazarı, limanları ve kavşak konumu sayesinde Türkiye sanayisinin tartışmasız merkezidir (İstanbul sanayisi Tekirdağ''da Çorlu–Çerkezköy ve Kocaeli''de Gebze–Dilovası''na; İzmir sanayisi ise Manisa OSB''ye taşmıştır).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''de sanayi tesislerinin dağılışı yalnız yer altı kaynaklarına göre değil; **sermaye, büyük pazar, ulaşım, nitelikli iş gücü, hammadde ve askerî güvenlik** ölçütlerine göre şekillenmiştir. **Marmara Bölgesi**, maden ve enerji kaynakları bakımından Türkiye''nin en fakir bölgelerinden biri olmasına karşın sermaye birikimi, dev tüketim pazarı, limanları ve kavşak konumu sayesinde Türkiye sanayisinin tartışmasız merkezidir (İstanbul sanayisi Tekirdağ''da **Çorlu–Çerkezköy** ve Kocaeli''de **Gebze–Dilovası**''na; İzmir sanayisi ise **Manisa OSB**''ye taşmıştır). Buna karşılık maden çeşitliliğinin lideri **Doğu Anadolu**, sermaye, pazar ve ulaşım kısıtları nedeniyle sanayisi en az gelişmiş bölgedir."
  },
  {
    "type": "paragraph",
    "text": "Sanayi kollarını kuruluş faktörlerine göre ayırmak sınavlarda belirleyicidir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Hammaddeye Yakınlık:** Çabuk bozulan veya hacimli ürünler işleneceği yerde kurulur: **Çay** (Rize), **şeker pancarı** (iç bölgeler), **zeytinyağı** (Ege–Güney Marmara), **konserve/salça** (Marmara–Ege) ve selüloza dayalı **kâğıt fabrikaları (SEKA)** (orman varlığı bol Karadeniz, Akdeniz ve Ege kıyıları).",
      "**Pazara, Sermayeye ve Ulaşıma Yakınlık:** **Otomotiv sanayisi** hammaddeye değil, yan sanayi, sermaye ve liman ihracatı nedeniyle **Marmara''da** (Bursa, Kocaeli, Sakarya, İstanbul) toplanmıştır. **Tekstil ve hazır giyim**de İstanbul ve Kayseri pamuk yetiştirmedikleri halde büyük merkezlerdir. **Mobilya**da orman fakiri **Kayseri ve Ankara** Türkiye''nin devleridir (kereste kolay taşınabilir). **Gübre fabrikaları** (Bandırma, Mersin, Kocaeli, İskenderun, Samsun) ithal fosfat ve gaz gemilerle geldiği için **liman kentlerinde** kurulmuştur (yalnız Mardin–Mazıdağı hammaddeye yakındır).",
      "**Askerî Güvenlik:** **Ankara ve Kırıkkale**''deki savunma ve mühimmat sanayisi dış saldırılardan uzak kalmak için **stratejik güvenlik** gerekçesiyle iç kesimde kurulmuştur.",
      "**Her Yere Yaygın Sanayi:** Ham maddesi (kalker, kil, jips) her ilde bulunduğu ve nakliyesi pahalı olduğu için **çimento** Türkiye''de dağılışı en yaygın sanayi koludur. Planlama yapılmadan büyüyen **Dilovası (Kocaeli), Ergene Havzası (Tekirdağ) ve Aliağa (İzmir)** ise Türkiye''nin sanayi kaynaklı en ağır çevre kirliliği sıcak noktalarıdır."
    ]
  },
  {
    "type": "paragraph",
    "text": "Sanayileşme sürecinde Cumhuriyet''in ilk yıllarından itibaren kurulan Organize Sanayi Bölgeleri (OSB) planlı üretimi hedeflerken, özellikle tarıma dayalı gıda sanayisinin (un, makarna, yağ, konserve) ham maddenin çıktığı İç Anadolu, Ege ve Güneydoğu ovalarına yayılması bölgesel kalkınmayı desteklemiştir. Harita üzerinde büyük sanayi aksının İstanbul–Kocaeli–Sakarya–Bursa hattından Eskişehir–Ankara ve İzmir–Manisa–Denizli koridorlarına doğru genişlediği görülür. Buna karşılık Doğu Karadeniz''de hem engebe hem demiryolu yokluğu yüzünden ağır sanayi gelişmemiştir. Aynı şekilde petrokimya ve rafineri tesisleri Aliağa (İzmir) ve İzmit (Kocaeli) gibi liman sahalarında yoğunlaşırken, dokuma ve gıda sanayii iç kesimlerdeki tarım kentlerine (Gaziantep, Kayseri, Denizli, Konya) yayılmıştır. Denizli''de tekstil ve kablo, Gaziantep''te ise gıda ve halı sanayisi öne çıkar. Savunma ve havacılık sanayisinde ise Ankara (TUSAŞ, ASELSAN, ROKETSAN) ve Eskişehir (TEI) Türkiye''nin yüksek teknolojili üretim üsleri olarak son yıllarda ihracat payını hızla büyütmektedir."
  },
  {
    "type": "table",
    "headers": [
      "Sanayi Kolu",
      "Başlıca Merkezleri",
      "Ana Kuruluş Faktörü"
    ],
    "rows": [
      [
        "Çay / Şeker / Kâğıt",
        "Rize / İç Bölgeler / Kıyı Orman Kuşağı",
        "**Hammaddeye yakınlık** (bozulma veya hacim)"
      ],
      [
        "Otomotiv / Tekstil / Mobilya",
        "Marmara / İstanbul-Kayseri / Kayseri-Ankara",
        "**Pazar, sermaye ve liman** (pamuk/orman şart değil!)"
      ],
      [
        "Gübre Sanayii",
        "Bandırma, Mersin, Kocaeli, Samsun",
        "**Liman/ulaşım** (ithal hammadde); yalnız Mazıdağı hammadde"
      ],
      [
        "Savunma Sanayii",
        "Ankara, Kırıkkale",
        "**Askerî güvenlik ve stratejik derinlik**"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sanayi kuruluşu çözümlemesi: \"Kayseri''de büyük mobilya ve tekstil fabrikalarının kurulmasının temel nedeni ilin geniş ormanlara ve pamuk tarlalarına sahip olmasıdır.\" yargısı **yanlıştır**; Kayseri orman ve pamuk açısından fakirdir, sanayisi **sermaye, ticaret kültürü ve pazara erişim** sayesinde gelişmiştir (**doğru**). Yine Antalya, İzmir veya Çukurova dışında **Dilovası, Ergene ve Aliağa** sanayi atıkları nedeniyle ağır hava-su kirliliği yaşayan sanayi bölgeleridir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sanayide iki klasik tuzağa dikkat et: 1. Bir bölgede maden veya tarım ürünü çıkması sanayinin de orada gelişeceğini garanti etmez: **Marmara** hammadde fakiridir ama sanayi devidir; **İstanbul** pamuk yetiştirmez ama tekstilin başkentidir. 2. **Gübre fabrikaları** genellikle kıyılardaki limanlara kurulur (ithal fosfat için); iç kesimdeki tek istisna fosfat madeni bulunan **Mardin–Mazıdağı**''dır."
  },
  {
    "type": "key_points",
    "items": [
      "Çay, şeker pancarı, zeytinyağı, konserve ve kâğıt **hammaddeye**; otomotiv, tekstil, mobilya **pazar/sermaye/limana** yakın kurulur.",
      "Savunma sanayii (Ankara, Kırıkkale) askerî güvenlik nedeniyle iç Anadolu''dadır.",
      "Çimento ham maddesi her yerde bulunduğu için Türkiye''ye en yaygın dağılan sanayidir.",
      "Dilovası, Ergene ve Aliağa sanayi kaynaklı çevre kirliliğinin en yoğun olduğu merkezlerdir."
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
  'cografya.sanayi_ticaret_ve_ulasim.02',
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  2,
  'Bölüm 2: Türkiye''de Ulaşım Sistemleri, Geçitler ve Limanlar',
  'Türkiye''de ulaşım ağlarının şekillenmesinde yer şekilleri belirleyicidir: Kuzey Anadolu ve Toros dağları doğu-batı yönünde uzandığı için ana kara yolu ve demir yolu akslarımız doğu-batı doğrultusundadır; kuzey-güney yönlü bağlantılar ise yüksek geçitler ve uzun tünellerle sağlanır.  Akdeniz''deki başlıca geçitler batıdan doğuya Çubuk (Antalya–Göller Yöresi), Sertavul (Silifke–Karaman), Gülek (Adana/Pozantı–İç Anadolu) ve Belen (İskenderun–Hatay)''dir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''de ulaşım ağlarının şekillenmesinde yer şekilleri belirleyicidir: Kuzey Anadolu ve Toros dağları doğu-batı yönünde uzandığı için ana kara yolu ve demir yolu akslarımız **doğu-batı** doğrultusundadır; kuzey-güney yönlü bağlantılar ise yüksek geçitler ve uzun tünellerle sağlanır. Akdeniz''deki başlıca geçitler batıdan doğuya **Çubuk** (Antalya–Göller Yöresi), **Sertavul** (Silifke–Karaman), **Gülek** (Adana/Pozantı–İç Anadolu) ve **Belen** (İskenderun–Hatay)''dir. Son yıllarda açılan tünellerden Trabzon–Gümüşhane arasındaki **Yeni Zigana Tüneli** (~14,5 km) Türkiye''nin ve Avrupa''nın en uzun çift tüplü karayolu tünelidir (**Ovit Tüneli** ise Rize–Erzurum hattındadır). Antalya''yı Konya''ya bağlayan **Demirkapı Tüneli** (~5 km) ise iç kesimle Akdeniz arasındaki iklim geçişini dakikalara indirmiştir."
  },
  {
    "type": "paragraph",
    "text": "Ulaşım türlerinde **yurt içi yolcu taşımacılığının ~%90''ı** ve **yurt içi yük taşımacılığının ~%85''i** kapıdan kapıya esnekliği nedeniyle **kara yolu** ile yapılır. Buna karşılık **dış ticarette (ithalat-ihracat)** en çok yük **deniz yolu** ile taşınır; çünkü tek seferde dev tonaj taşıması ve yol bakım maliyeti olmaması nedeniyle birim taşıma maliyeti en ucuzdan pahalıya **Deniz yolu < Demir yolu < Kara yolu < Hava yolu** şeklinde sıralanır. Yol yapım maliyeti ise düz **Konya–Karaman, Şanlıurfa ve Ergene** platolarında en düşük; tünel ve viyadük isteyen **Karadeniz, Toroslar ve Doğu Anadolu**''da en yüksektir."
  },
  {
    "type": "paragraph",
    "text": "**Demir yolu** ağında büyük boşluklar vardır: Doğu Karadeniz kıyısında (Ordu''dan Sarp''a kadar) hiç demiryolu yoktur; bu nedenle **Trabzon, Rize, Giresun, Sinop** limanlarının yanında Batı Toroslar engeli yüzünden **Antalya** ve **Çanakkale** limanlarının da demiryolu bağlantısı **yoktur** (İzmir–Antalya arasında da tren hattı yoktur!). Doğu''da ise Elazığ–Muş demiryolu **Tatvan**''da biter, vagonlar **Van Gölü üzerinden feribotla Van''a** taşınıp Kapıköy''e devam eder. Deniz ulaşımında İstanbul **Ambarlı Limanı** konteyner hacminde devleşirken, **Mersin ve İzmir** geniş hinterlandıyla öne çıkar. Hava ulaşımında ise deniz doldurularak inşa edilen ilk havalimanı **Ordu–Giresun**, ikincisi **Rize–Artvin** Havalimanı''dır. Yüksek Hızlı Tren (YHT) hatları ise Ankara merkezli olarak İstanbul, Eskişehir, Konya, Karaman ve Sivas yönlerinde işletilmektedir. Karadeniz kıyısı boyunca uzanan Karadeniz Sahil Yolu ise çok sayıda tünel ve viyadükle bölgenin doğu-batı ulaşımını hızlandırmıştır; buna karşılık İzmir–Antalya ve Doğu Karadeniz kıyı şeridinde demiryolu bulunmaması ulaşım planlamasında hâlâ önemli bir eksikliktir. İstanbul Boğazı''ndaki Marmaray ve Avrasya Tüneli de iki kıta arası kesintisiz geçiş sağlamıştır."
  },
  {
    "type": "table",
    "headers": [
      "Ulaşım / Geçit",
      "Konumu ve Bağlantısı",
      "Kritik Sınav Detayı"
    ],
    "rows": [
      [
        "Akdeniz Geçitleri",
        "**Çubuk** (Antalya), **Sertavul** (Silifke), **Gülek** (Adana), **Belen** (Hatay)",
        "Kuzey-güney yönlü Toros geçişleri"
      ],
      [
        "Önemli Tüneller",
        "**Yeni Zigana** (14,5 km), **Ovit** (14 km), **Demirkapı** (5 km)",
        "Zigana Trabzon–Gümüşhane; Demirkapı Antalya–Konya"
      ],
      [
        "Demiryolu Olmayan Limanlar",
        "**Antalya, Trabzon, Rize, Giresun, Sinop, Çanakkale**",
        "Samsun, İzmir, Mersin, İskenderun''da tren **VAR**"
      ],
      [
        "Deniz Dolgu Havalimanları",
        "1. **Ordu–Giresun** · 2. **Rize–Artvin**",
        "Engebeli Doğu Karadeniz''de düz alan olmaması nedeniyle"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Akdeniz''deki dört ana geçidi batıdan doğuya doğru **Ç-S-G-B** (\"**Ç**ok **S**ayıda **G**eçit **B**ulunur\") şeklinde kodla: - **Ç**ubuk (Antalya – Burdur/Isparta) - **S**ertavul (Silifke/Mersin – Karaman) - **G**ülek (Adana/Pozantı – Niğde/İç Anadolu) - **B**elen (İskenderun – Hatay/Amik)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Ulaşım çözümlemesi: \"Antalya büyük bir turizm ve ticaret limanı olduğu için gelişmiş bir demiryolu ağına sahiptir.\" yargısı **yanlıştır**; Antalya''da ve İzmir–Antalya hattında demiryolu kesinlikle **yoktur** (**doğru**). Yine \"Türkiye''de yurt içi yük taşımacılığında en yüksek pay deniz yolundadır.\" demek **yanlıştır**; deniz yolu dış ticarette ve ucuzlukta 1. sıradadır, **yurt içinde** lider açık ara **kara yolu**dur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ulaşım sorularında iki klasik tuzağa dikkat et: 1. **Antalya** ve **Trabzon** gibi büyük liman kentlerinde tren yolu olduğu sanılır; oysa ikisinin de (ayrıca Sinop, Rize, Giresun ve Çanakkale''nin) demiryolu bağlantısı **yoktur**! 2. Gürcistan sınırında **Sarp** kapısında tren yoktur; tren bağlantısı **Kars–Ardahan** üzerinden geçen **Bakü-Tiflis-Kars (BTK)** demiryolu hattıyla sağlanır."
  },
  {
    "type": "key_points",
    "items": [
      "Birim taşıma maliyeti en ucuzdan pahalıya: **Deniz < Demir < Kara < Hava**; yurt içi taşımada ise kara yolu açık ara liderdir.",
      "Antalya, Doğu Karadeniz kıyıları ve Çanakkale''de demiryolu yoktur; Van Gölü''nde Tatvan–Van arası tren feribotu çalışır.",
      "Akdeniz geçitleri batıdan doğuya **Ç-S-G-B**''dir (Çubuk, Sertavul, Gülek, Belen); en uzun karayolu tüneli Yeni Zigana''dır.",
      "İlk deniz dolgu havalimanı Ordu–Giresun, ikincisi Rize–Artvin''dir."
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
  'cografya.sanayi_ticaret_ve_ulasim.03',
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  3,
  'Bölüm 3: İç ve Dış Ticaret, Serbest Bölgeler ve Boru Hatları',
  'Türkiye ekonomisinde dış ticaret yapısı yıllar içinde tarım ürünleri ihracatından sanayi ürünleri ihracatına dönüşmüştür.  Günümüzde TÜİK verilerine göre Türkiye''nin toplam ihracatının yaklaşık %94–95''ini imalat sanayisi ürünleri (motorlu kara taşıtları/otomotiv, makine ve aksamları, hazır giyim/tekstil, demir-çelik, kimyasallar) oluştururken, tarım ve ormancılığın ihracattaki payı %3–4 bandındadır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye ekonomisinde **dış ticaret** yapısı yıllar içinde tarım ürünleri ihracatından sanayi ürünleri ihracatına dönüşmüştür. Günümüzde TÜİK verilerine göre Türkiye''nin toplam ihracatının yaklaşık **%94–95''ini imalat sanayisi ürünleri** (motorlu kara taşıtları/otomotiv, makine ve aksamları, hazır giyim/tekstil, demir-çelik, kimyasallar) oluştururken, tarım ve ormancılığın ihracattaki payı **%3–4** bandındadır. İhracatımızda (en çok mal sattığımız ülke) uzun yıllardır birinci sırada **Almanya** yer alır (ardından ABD, İngiltere, İtalya gelir); ithalatımızda (en çok mal aldığımız ülkeler) ise enerji ve ara malı nedeniyle **Rusya ve Çin** ilk sıralardadır."
  },
  {
    "type": "paragraph",
    "text": "Türkiye''nin **dış ticaret açığı ve cari açığının** yaklaşık **%60–70**''ini yurt dışından ithal edilen ham petrol, doğal gaz ve taş kömürü gibi **enerji faturaları** oluşturur; dolayısıyla yerli enerji üretiminin artması cari açığı doğrudan hafifletir. Ticareti canlandırmak amacıyla 1985''te çıkarılan kanunla gümrük vergisi muafiyeti tanınan **ilk serbest bölge Mersin Serbest Bölgesi** olmuştur (ardından Antalya açılmıştır). Komşu illerle yapılan **sınır ticareti** ise kaçakçılığı önlemek için getirilen kotalı ve denetimli bir sistemdir; silah, uyuşturucu, tütün ve petrol gibi maddeler sınır ticareti dışındadır. **Trabzon Limanı** ise Zigana ve Kop geçitleri ile Gürbulak üzerinden **İran transit ticaret yolu**nun Karadeniz kapısıdır."
  },
  {
    "type": "paragraph",
    "text": "Enerji taşımacılığında Türkiye dev uluslararası **boru hatlarının** kavşağıdır: **BTC (Bakü–Tiflis–Ceyhan)** ham petrol boru hattı Azerbaycan petrolünü Gürcistan üzerinden **Adana–Ceyhan Deniz Terminali**''ne taşır. **TANAP (Trans Anadolu Doğal Gaz Boru Hattı)** ise Azerbaycan gazını Ardahan–Türkgözü''nden alıp 20 ilden geçirerek Edirne–İpsala''dan TAP hattıyla Avrupa''ya ulaştırır (**Güney Gaz Koridoru**); buna karşılık **Mavi Akım ve TürkAkım** hatları Rus doğal gazını Karadeniz altından Türkiye''ye getirir."
  },
  {
    "type": "paragraph",
    "text": "İç ticarette ise bölgeler arasındaki iklim, üretim ve nüfus farkları temel belirleyicidir: Kıyılardan iç kesimlere narenciye, zeytin, çay, fındık ve sanayi mamulleri giderken; iç ve doğu bölgelerden kıyılara tahıl, şeker pancarı ve canlı hayvan/et ürünleri sevk edilir. Büyük kentlerin nüfus yoğunluğu, iç ticaretin merkezini Marmara (İstanbul) ve Ankara–İzmir ekseninde toplamıştır. Dış ticaret hacmini büyütmek ve katma değerli ihracatı artırmak için teknoloji yoğun sektörlerin payı artırılmaya çalışılmaktadır. Ayrıca Türkiye''nin ihracatının ithalatını karşılama oranı enerji fiyatlarındaki dalgalanmalara doğrudan bağlıdır; petrol ve doğal gaz fiyatlarının yükseldiği yıllarda dış ticaret açığımız büyürken, turizm gelirleri ve hizmet ihracatı cari açığın kapatılmasında dengeleyici rol üstlenir. İhracatta birim kilogram değerini yükseltmek için savunma sanayii, yazılım ve beyaz eşya gibi katma değerli sektörlerin desteklenmesi temel ticaret stratejisidir; böylece dış ticaret açığının kalıcı biçimde azaltılması ve rekabet gücünün artırılması hedeflenir."
  },
  {
    "type": "table",
    "headers": [
      "Ticaret / Boru Hattı",
      "Güzergâh veya Sıralama",
      "Kritik Sınav Notu"
    ],
    "rows": [
      [
        "İhracat Yapısı ve Lider Ülke",
        "~%94–95 **İmalat Sanayii** · 1. Ülke: **Almanya**",
        "Tarım payı %3–4''tür; otomotiv ve tekstil ihracatın lokomotifidir"
      ],
      [
        "İthalat ve Cari Açık",
        "1. Ülke: **Rusya / Çin** · Ana sebep: **Enerji ithalatı**",
        "Petrol, doğal gaz ve taş kömürü dış açığın başlıca kaynağıdır"
      ],
      [
        "İlk Serbest Bölge",
        "**Mersin Serbest Bölgesi** (1985)",
        "İstanbul değil, liman ve Ortadoğu ticareti nedeniyle Mersin"
      ],
      [
        "Boru Hatları",
        "**BTC** (Petrol → Ceyhan) · **TANAP** (Azeri gazı → Avrupa)",
        "**TürkAkım / Mavi Akım** ise Rusya gazını getirir"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Ticaret ve boru hattı çözümlemesi: \"Türkiye bir tarım ülkesi olduğu için ihracat gelirinin yarısından fazlasını tarım ürünleri sağlar.\" yargısı **yanlıştır**; ihracatımızın %94–95''i **sanayi mamullerinden** oluşur (**doğru**). Yine \"BTC petrol boru hattının son durağı İzmir Aliağa veya Mersin''dir.\" yargısı **yanlıştır**; BTC''nin terminali **Adana–Ceyhan**''dır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Dış ticaret ve boru hatlarında iki tuzağa dikkat et: 1. İhracatta (sattığımız) 1. ülke **Almanya**, ithalatta (aldığımız) 1. ülkeler **Rusya ve Çin**dir; iki sıralamayı ters çevirme. 2. **TANAP** Azerbaycan gazını Avrupa''ya taşırken, **TürkAkım ve Mavi Akım** Karadeniz''in altından Rus gazını taşır."
  },
  {
    "type": "key_points",
    "items": [
      "İhracatın ~%95''i sanayi ürünleridir; en çok ihracat yapılan ülke Almanya, en çok ithalat yapılan ülkeler Rusya ve Çin''dir.",
      "Dış ticaret ve cari açığın en büyük nedeni **enerji (petrol, gaz) ithalatıdır**.",
      "İlk serbest bölge 1985''te **Mersin**''de açılmıştır; Trabzon Limanı İran transit ticaret kapısıdır.",
      "BTC petrolü Adana–Ceyhan''a, TANAP ise Azerbaycan gazını Avrupa''ya taşır."
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
  'cografya.sanayi_ticaret_ve_ulasim.04',
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  4,
  'Bölüm 4: Bölgesel Kalkınma Projeleri',
  'Bölgeler arası gelişmişlik farklarını azaltmak, göçü önlemek ve yerel kaynakları ekonomiye kazandırmak amacıyla Türkiye''de altı büyük Bölgesel Kalkınma Projesi yürütülmektedir: 1.  GAP (Güneydoğu Anadolu Projesi): Fırat ve Dicle nehirleri üzerine kurulan barajlar (Atatürk Barajı) ve Şanlıurfa Tünelleri ile Harran gibi kurak ovaları sulayan en kapsamlı projedir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bölgeler arası gelişmişlik farklarını azaltmak, göçü önlemek ve yerel kaynakları ekonomiye kazandırmak amacıyla Türkiye''de altı büyük **Bölgesel Kalkınma Projesi** yürütülmektedir: 1. **GAP (Güneydoğu Anadolu Projesi):** Fırat ve Dicle nehirleri üzerine kurulan barajlar (Atatürk Barajı) ve **Şanlıurfa Tünelleri** ile Harran gibi kurak ovaları sulayan en kapsamlı projedir. Sulamayla birlikte pamuk, mısır ve mercimek üretimi katlanmış; buna bağlı olarak Gaziantep ve Şanlıurfa''da **tarıma dayalı gıda, iplik, çırçır ve dokuma sanayisi** patlama yapmıştır. 2. **KOP (Konya Ovası Projesi):** Su kıtlığı ve yer altı suyu tükenmesi (obruk) yaşayan Konya, Karaman, Aksaray ve Niğde illerini kapsar. Projenin kalbi olan **Mavi Tünel**, Göksu Nehri''nin sularını Toroslar''ın altından 17 km''lik tünelle Bağbaşı Barajı üzerinden Konya Ovası''na akıtarak sulamayı güvenceye alır. 3. **DOKAP (Doğu Karadeniz Projesi):** Dik engebe nedeniyle tarım alanı kısıtlı olan Doğu Karadeniz''de yayla ve eko-turizmi geliştirmeyi amaçlar; Samsun''dan Artvin''e uzanan yaylaları üst kottan birbirine bağlayan **Yeşil Yol Projesi** bu kapsamdadır. 4. **ZBK (Zonguldak–Bartın–Karabük Projesi):** Kömür işletmelerinin ve demir-çelik sektörünün daralmasına bağlı işsizliği önlemek, **Filyos Limanı ve Endüstri Bölgesi** ile yeni yatırımlar çekerek **bölge ekonomisini kömür bağımlılığından kurtarıp çeşitlendirmek** amacıyla hazırlanmıştır. 5. **DAP (Doğu Anadolu Projesi):** Tarım sezonunun kısa olduğu yüksek ve soğuk Doğu Anadolu''da gür alpin çayırlara dayalı **modern büyükbaş hayvancılık, mera ıslahı ve et-süt sanayisini** geliştirmeyi hedefler. 6. **YHGP (Yeşilırmak Havzası Gelişim Projesi):** Çorum, Amasya, Tokat ve Samsun''u kapsar; temel amacı Yeşilırmak havzasındaki şiddetli **erozyon, nehir taşkınları ve akarsu kirliliğini** önlemektir."
  },
  {
    "type": "paragraph",
    "text": "Bölgesel kalkınma projelerinin ortak amacı yalnızca ekonomik üretimi artırmak değil, aynı zamanda yerel istihdam yaratarak büyükşehirlere (özellikle İstanbul ve Marmara''ya) yönelen **zorunlu iç göçü yerinde durdurmaktır**. Örneğin GAP sayesinde Şanlıurfa ve Gaziantep''te tarıma dayalı fabrikaların kurulması bölge içi istihdamı büyütürken, KOP kapsamındaki Mavi Tünel yatırımı İç Anadolu çiftçisinin kuraklık nedeniyle toprağını terk etmesini önlemeyi amaçlar. Bu projelerin başarısı Türkiye''nin bölgeler arası sosyoekonomik dengesini doğrudan güçlendirir. Özellikle GAP ile güneydoğuda pamuğa ve gıdaya dayalı sanayi kümelenirken, KOP''un Mavi Tünel yatırımıyla İç Anadolu''da tarımsal verim ve ürün çeşitliliği korunmakta; DOKAP ve DAP ise doğu bölgelerinde turizm ve hayvancılık gelirlerini yükselterek refah farkını azaltmaktadır. YHGP ve ZBK ile birlikte Türkiye''nin tüm dezavantajlı havza ve bölgeleri planlı kalkınma ağına alınmıştır; böylece yerel kaynakların yerinde değerlendirilmesi, istihdam artışı ve ülke genelinde dengeli bölgesel gelişim sağlanmaktadır."
  },
  {
    "type": "table",
    "headers": [
      "Proje",
      "Kapsadığı Başlıca Alan",
      "Ana Hedef ve İmza Yatırımı"
    ],
    "rows": [
      [
        "**GAP**",
        "Güneydoğu Anadolu (9 il)",
        "Sulama (**Şanlıurfa Tünelleri**), hidroelektrik ve **tarıma dayalı sanayi**"
      ],
      [
        "**KOP**",
        "Konya, Karaman, Aksaray, Niğde, Nevşehir vb.",
        "Göksu sularını Konya''ya taşıyan **Mavi Tünel** ile sulama ve obruk önleme"
      ],
      [
        "**DOKAP**",
        "Doğu Karadeniz (+ Samsun, Ordu, Çorum, Amasya)",
        "Yayla turizmi (**Yeşil Yol**), arıcılık ve ulaşım"
      ],
      [
        "**ZBK**",
        "Zonguldak, Bartın, Karabük",
        "**Filyos** projesiyle ekonomiyi **kömüre bağımlılıktan kurtarıp çeşitlendirme**"
      ],
      [
        "**DAP**",
        "Doğu Anadolu illeri",
        "**Mera ıslahı ve modern hayvancılık** (et-süt sanayii)"
      ],
      [
        "**YHGP**",
        "Amasya, Çorum, Samsun, Tokat",
        "**Erozyon, taşkın ve nehir kirliliğiyle mücadele**"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Proje çözümlemesi: \"ZBK Projesi yalnızca bölgedeki taş kömürü çıkarımını artırmak için hazırlanmıştır.\" yargısı **yanlıştır**; ZBK''nin ana amacı bölgeyi tek başına kömüre bağımlı olmaktan çıkarıp Filyos ile yeni sanayi dalları kazandırmaktır (**doğru**). Yine \"Fırat sularını Harran''a taşıyan Mavi Tünel''dir.\" demek **yanlıştır**; Harran''a su taşıyan **Şanlıurfa Tünelleri** (GAP), Göksu''yu Konya''ya taşıyan ise **Mavi Tünel**dir (KOP)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bölgesel kalkınma projelerinde iki ayrıntıya dikkat et: 1. **Yeşil Yol** (DOKAP — yaylaları üst kottan bağlayan turizm yolu) ile **Karadeniz Sahil Yolu**''nu (kıyı ulaşımı) birbirine karıştırma. 2. **Mavi Tünel** (KOP — Göksu → Konya) ile **Şanlıurfa Tünelleri**''ni (GAP — Fırat → Harran) yer değiştirme."
  },
  {
    "type": "key_points",
    "items": [
      "GAP (Şanlıurfa Tünelleri) sulama ve tarıma dayalı sanayiyi; KOP (Mavi Tünel) ise Göksu sularıyla Konya Ovası sulamasını hedefler.",
      "DOKAP (Yeşil Yol) yayla turizmine; DAP ise Doğu Anadolu''da modern büyükbaş hayvancılığa odaklanır.",
      "ZBK (Filyos) ekonomiyi kömüre bağımlılıktan kurtarmayı; YHGP ise Yeşilırmak''ta taşkın, erozyon ve kirliliği önlemeyi amaçlar."
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
