-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Coğrafya · Türkiye'de Tarım ve Hayvancılık
-- Kaynak: docs/konu_anlatimi/cografya/04_turkiyede_tarim_ve_hayvancilik.md
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
    "question_ids": [
      "41a951e7-28ea-4c22-89dd-1783c31a74dc",
      "7a5615c1-0c9c-42db-b806-5459ce23b3ae"
    ]
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
    "question_ids": [
      "1a567c94-fdd1-4048-a3dd-04251c6e60f0",
      "07d26735-ae2f-4467-b184-72be10ef9cf9"
    ]
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
    "question_ids": [
      "0713e304-6cc9-45fe-a219-40b2c24e1a07",
      "6f303384-8062-49c5-bfe0-d0896e16dad0"
    ]
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
    "question_ids": [
      "239e8d30-cef6-48e8-bdda-1712a46b5f0b",
      "a27df9fc-631e-4f46-83b0-8f346fe3ee4a"
    ]
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
