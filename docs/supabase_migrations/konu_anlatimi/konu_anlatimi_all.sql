-- =============================================================================
-- KADRO KONU ANLATIMI - TOPLU MIGRATION
-- Toplam dosya: 19
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================

begin;

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Tarih · İslamiyet Öncesi Türk Tarihi
-- Kaynak: docs/konu_anlatimi/tarih/01_islamiyet_oncesi_turk_tarihi.md
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
  'tarih.islamiyet_oncesi_turk_tarihi.01',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  1,
  'Bölüm 1: Orta Asya Kültür Merkezleri, İskitler ve Asya Hun Devleti',
  'Türk tarihinin ilk sahnesi olan Orta Asya, doğuda Kingan Dağları ile batıda Hazar Denizi arasında uzanır; kuzeyi Sibirya bozkırlarına, güneyi ise Hindikuş ve Karanlık Dağları''na yaslanır.  Sert karasal iklim ve geniş otlaklar, bölgedeki toplulukların konargöçer bir yaşam biçimi kurmasına ve atlı bozkır kültürünü geliştirmesine yol açmıştır.',
  5,
  '[
  {
    "type": "paragraph",
    "text": "Türk tarihinin ilk sahnesi olan Orta Asya, doğuda Kingan Dağları ile batıda Hazar Denizi arasında uzanır; kuzeyi Sibirya bozkırlarına, güneyi ise Hindikuş ve Karanlık Dağları''na yaslanır. Sert karasal iklim ve geniş otlaklar, bölgedeki toplulukların konargöçer bir yaşam biçimi kurmasına ve atlı bozkır kültürünü geliştirmesine yol açmıştır. Arkeolojik kazılar bu coğrafyada birbirini izleyen beş temel kültür katmanını ortaya koymuştur."
  },
  {
    "type": "heading",
    "text": "Orta Asya Kültür Merkezleri"
  },
  {
    "type": "table",
    "headers": [
      "Kültür",
      "Bölge",
      "Ayırt Edici Özellik"
    ],
    "rows": [
      [
        "Anav",
        "Aşkabat yakınları",
        "Orta Asya''nın bilinen en eski yerleşim kültürü"
      ],
      [
        "Afanesyova",
        "Altay-Sayan",
        "Türklere ait kabul edilen en eski kültür merkezi"
      ],
      [
        "Andronova",
        "Yenisey-Ural",
        "En geniş coğrafyaya yayılan proto-Türk kültürü"
      ],
      [
        "Karasuk",
        "Orta Sibirya",
        "Demirin ilk kez işlendiği bozkır kültürü"
      ],
      [
        "Tagar",
        "Abakan bölgesi",
        "En genç ve sanat açısından en gelişmiş kültür"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**\"AAA-KT\"** sıralaması kültürleri eskiden yeniye dizmeni sağlar: **A**nav (en eski Orta Asya) → **A**fanesyova (en eski Türk) → **A**ndronova (en geniş yayılım) → **K**arasuk (demir) → **T**agar (en gelişmiş)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM sınavda **\"Orta Asya''nın en eski kültürü\"** ile **\"Türklerin en eski kültürü\"** ifadelerini birbirinin yerine koyarak çeldirici kurar. Genel Orta Asya tarihinin en eski merkezi **Anav** iken, doğrudan Türklere ait kabul edilen en eski kültür **Afanesyova**''dır. Ayrıca yayılım alanı en geniş olan **Andronova** ile sanat ve madencilikte zirveye çıkan **Tagar**''ı birbirine karıştırma."
  },
  {
    "type": "heading",
    "text": "Türk Adının Anlamları ve İskitler (Sakalar)"
  },
  {
    "type": "paragraph",
    "text": "Tarih boyunca Türk adına farklı kültür ve düşünce çevrelerinde değişik anlamlar yüklenmiştir. Çin yıllıkları bu adı *miğfer* biçiminde kaydederken, Kaşgarlı Mahmut *olgunluk çağı*, Uygur metinleri *güç ve kuvvet*, Ziya Gökalp ise *töre ve nizam sahibi* karşılığını vermiştir. İran kaynaklarında geçen *güzel insan* tanımı ve Vambery''nin *türemek* açıklaması da aynı köke işaret eder."
  },
  {
    "type": "paragraph",
    "text": "Karadeniz''in kuzeyinden Tanrı Dağları''na kadar uzanan sahada yaşayan **İskitler (Sakalar)**, tarihte bilinen ilk Türk boy birliği kabul edilir. Atlı savaşçılıkta ustalaşan İskitler, maden işlemeciliğindeki ileri teknikleri yüzünden *\"Bozkırın Kuyumcuları\"* diye anılmıştır. Eserlerinde koç, geyik ve kurt figürlerini işleyen **hayvan üslubu** İskitlerle başlamıştır (mezar taşı geleneği olan **balbal** ise özellikle **Göktürkler** döneminde yaygınlaşmıştır)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İskitler bir imparatorluk ya da merkezi devlet değil, federatif bir **boy birliği**dir. Orta Asya''da siyasi birliği kurup düzenli ordu teşkilatını (**onlu sistem**) oluşturan ilk yapı İskitler değil, **Asya Hun Devleti**''dir."
  },
  {
    "type": "heading",
    "text": "Asya Hun Devleti ve Bağımsızlık İlkesi"
  },
  {
    "type": "paragraph",
    "text": "Tarihte teşkilatlı ilk Türk devleti, Ötüken merkezli olarak **Teoman** önderliğinde kurulan **Asya Hun Devleti**''dir. Çinliler, Hun akınlarını durdurmak amacıyla Teoman döneminde ünlü **Çin Seddi**''ni inşa etmiştir. Devlet en parlak çağını **Mete Han** döneminde yaşamıştır. Mete Han, 26 Türk boyunu tek bayrak altında toplamış ve orduyu onluk, yüzlük, binlik, tümenlik birimlere ayırarak **onlu sistemi** kurmuştur."
  },
  {
    "type": "paragraph",
    "text": "Mete Han, MÖ 201 yılında gerçekleşen **Baideng Kuşatması**''nda **taktiksel sahte ricat** ve hilal manevrasıyla kalabalık Çin ordusunu çembere almıştır. Bu zaferin ardından imzalanan **Kuzey Şansi Antlaşması**, Türk tarihinin bilinen ilk yazılı antlaşmasıdır ve Çin''i yıllık ipek, tahıl ile şarap vergisine bağlamıştır. Dikkat et: Mete Han askeri üstünlüğüne rağmen Çin topraklarına yerleşmemiştir. Çünkü kalabalık Çin nüfusu içinde Türklerin benliğini kaybedip **asimile olmasını** önlemek istemiştir."
  },
  {
    "type": "timeline",
    "items": [
      {
        "label": "MÖ 220",
        "text": "Teoman önderliğinde Asya Hun Devleti kuruldu."
      },
      {
        "label": "MÖ 209",
        "text": "Mete Han tahta çıktı ve onlu askerî sistemi oluşturdu."
      },
      {
        "label": "MÖ 201",
        "text": "Baideng zaferi sonrası Kuzey Şansi Antlaşması imzalandı."
      },
      {
        "label": "MÖ 58",
        "text": "Çi-çi, kardeşi Ho-han-ye''nin Çin himayesi teklifini reddetti."
      },
      {
        "label": "375",
        "text": "Balamir önderliğindeki Hunların batıya yürüyüşüyle Kavimler Göçü başladı."
      }
    ]
  },
  {
    "type": "paragraph",
    "text": "Asya Hun Devleti''nin parçalanma sürecinde yaşanan bir olay, Türk devlet geleneğindeki bağımsızlık anlayışını açıkça gösterir. MÖ 58''de **Ho-han-ye**, ekonomik sıkıntılar nedeniyle Çin himayesine girmeyi önermiş; ancak kardeşi Batı Hun hükümdarı **Çi-çi**, atalarının töresini terk edip boyun eğmeyi utanç sayarak bu teklifi reddetmiştir. Çi-çi''nin tutumu, Türk siyasi tarihinde **istiklal** ülküsünün maddi çıkarların üstünde tutulduğunu gösteren en eski kanıttır."
  },
  {
    "type": "callout",
    "kind": "info",
    "text": "Kuzey Hunlarının 375 yılında **Balamir** liderliğinde Karadeniz''in kuzeyinden batıya ilerlemesi **Kavimler Göçü**''nü başlatmıştır. Bu göç Roma İmparatorluğu''nun 395''te Doğu ve Batı olarak ikiye ayrılmasına, İlk Çağ''ın kapanıp Orta Çağ''ın başlamasına ve Kilise otoritesinin güçlenmesine zemin hazırlamıştır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Kavimler Göçü''nün Avrupa''daki siyasi sonucuna dikkat et: Göç sonrasında Avrupa''da merkezi krallıklar **güçlenmemiş**, aksine parçalanmıştır. Halkın yerel senyörlere sığınmasıyla **feodalite (derebeylik)** rejimi doğmuştur. Merkezi krallıkların yeniden güçlenmesi ancak Orta Çağ sonunda barutun surları yıkmasıyla gerçekleşecektir. Ayrıca dünya tarihinin ilk yazılı antlaşması **Kadeş** ile Türk tarihinin ilk yazılı antlaşması **Kuzey Şansi**''yi karıştırma."
  },
  {
    "type": "key_points",
    "items": [
      "Orta Asya''nın en eski kültürü **Anav**, Türklere ait en eski kültür ise **Afanesyova**''dır; en gelişmişi **Tagar**''dır.",
      "**İskitler** ilk Türk boy birliği olup **hayvan üslubunun** öncüsüdür; ancak merkezi devlet değildir.",
      "**Mete Han**, Baideng zaferi sonrası Çin''e yerleşmeyerek Türklerin **asimile olmasını** önlemiştir.",
      "**Kuzey Şansi Antlaşması** (MÖ 201) Türk tarihinin ilk yazılı antlaşmasıdır; **Çi-çi** ise bağımsızlık ilkesinin ilk somut örneğidir.",
      "**Kavimler Göçü** Avrupa''da merkezi krallıkları zayıflatıp **feodaliteyi** doğurmuştur."
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
  'tarih.islamiyet_oncesi_turk_tarihi.02',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  2,
  'Bölüm 2: Avrupa Hunları ve Orta Asya ile Avrupa''daki Diğer Türk Toplulukları',
  'Kavimler Göçü''nün ardından Avrupa''nın ortasında yeni bir siyasi güç doğmuştur.  Bugünkü Macaristan ovalarını merkez edinen Avrupa Hun Devleti, Balamir''den sonra tahta geçen Uldız döneminde net bir dış politika çizgisi izlemiştir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Kavimler Göçü''nün ardından Avrupa''nın ortasında yeni bir siyasi güç doğmuştur. Bugünkü Macaristan ovalarını merkez edinen **Avrupa Hun Devleti**, Balamir''den sonra tahta geçen **Uldız** döneminde net bir dış politika çizgisi izlemiştir. Uldız, Batı Roma ile dostane ilişkiler kurarken Doğu Roma''yı (Bizans) baskı altına almıştır. Türklerin tarihte **Anadolu topraklarına ilk kez ayak basması**, Uldız döneminde Kafkaslar üzerinden Erzurum, Malatya ve Çukurova yönüne düzenlenen akınlarla gerçekleşmiştir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Avrupa Hun Devleti denince adayların çoğu tüm askeri başarıları **Atilla**''ya bağlama eğilimindedir. Oysa Anadolu''ya ilk Türk akınlarını başlatan ve Bizans Trakya valisine *\"Güneşin battığı yere kadar her yeri zapt edebilirim\"* diyen hükümdar Atilla değil, **Uldız**''dır."
  },
  {
    "type": "heading",
    "text": "Atilla Dönemi ve Avrupa''daki İzler"
  },
  {
    "type": "paragraph",
    "text": "Avrupa Hun Devleti en güçlü dönemini **Atilla** ile yaşamıştır. Atilla, Balkan Seferleri sonucunda Bizans''ı **Margos** ve **Anatolyus** antlaşmalarıyla ağır yıllık vergiye bağlamıştır. Ardından Galya ve İtalya seferleriyle Batı Roma üzerine yürümüştür. Roma kapılarına dayandığında Papa I. Leo başkanlığındaki heyetin ricası, ordudaki salgın hastalıklar ve İtalya''daki kıtlık nedeniyle kenti yağmalamadan geri çekilmiştir."
  },
  {
    "type": "paragraph",
    "text": "Atilla, Hristiyan dünyasında *\"Tanrının Kırbacı\"* unvanıyla anılmış, Almanların ünlü **Nibelungen Destanı**''nda ise kudretli ve adil kral **Etzel** adıyla yer almıştır. Dikkat et: Atilla hiçbir zaman Hristiyanlığı kabul etmemiş, Gök Tanrı inancını ve bozkır savaşçı kimliğini korumuştur. Günümüz Macaristan toplumu da tarihsel köklerini Atilla ve Hun mirasına dayandırır."
  },
  {
    "type": "heading",
    "text": "Bozkırdan Avrupa''ya Diğer Türk Boyları ve Devletleri"
  },
  {
    "type": "paragraph",
    "text": "İslamiyet öncesi dönemde Orta Asya ile Doğu Avrupa sahasında etkili olan pek çok Türk devleti ve boyu, kendilerine özgü siyasi, dini ve kültürel özellikleriyle KPSS sorularının temel omurgasını oluşturur."
  },
  {
    "type": "table",
    "headers": [
      "Topluluk / Devlet",
      "Bölge ve Dönem",
      "Ayırt Edici KPSS Özelliği"
    ],
    "rows": [
      [
        "Avarlar (Juan-Juan)",
        "Orta Asya ve Orta Avrupa",
        "İstanbul''u Sasanilerle iki kez kuşattı; üzengiyi Avrupa''ya taşıdı"
      ],
      [
        "Peçenekler",
        "Karadeniz kuzeyi ve Balkanlar",
        "Devlet kuramadı; 1071 Malazgirt''te Selçuklu safına geçti"
      ],
      [
        "Oğuzlar (Uzlar)",
        "Orta Asya, Balkanlar ve İran",
        "En kalabalık boy; Hristiyanlaşanlar Uzlar (torunları Gagavuzlar), Müslümanlar Türkmen"
      ],
      [
        "Bulgarlar",
        "İtil (Volga) ve Tuna",
        "İtil Bulgarları İslamiyet''i resmen kabul eden ilk Türk devleti"
      ],
      [
        "Hazarlar",
        "Hazar kuzeyi ve Kafkaslar",
        "Museviliği benimseyen tek Türk devleti; Hazar Barış Çağı"
      ],
      [
        "Kıpçaklar (Kumanlar)",
        "Deşt-i Kıpçak",
        "Codex Cumanicus sözlüğü; Dede Korkut ve İgor Destanı''na konu"
      ],
      [
        "Türgişler",
        "Orta Asya (Maveraünnehir)",
        "Baga Tarkan kendi adına para bastırdı; Emevilerle savaştı"
      ],
      [
        "Kırgızlar",
        "Ötüken ve Tanrı Dağları",
        "Uygurları yıktı; Manas Destanı ve Yenisey Yazıtları"
      ],
      [
        "Karluklar",
        "Orta Asya (751 Talas)",
        "İslamiyet''i kabul eden ilk Türk boyu; Karahanlıların temel unsuru"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Bu tablodaki toplulukların bazıları hem Asya''da hem Avrupa''da varlık göstererek çift kıtalı bir tarih yazmıştır. **Hunlar** ve **Avarlar** hem Orta Asya''da hem de Avrupa''da devlet kurabilen iki topluluktur. Avarlar ayrıca Slav topluluklarını devlet ve ordu teşkilatı bakımından derinden etkilemiştir."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Hristiyanlığı benimseyerek zamanla Slavlaşan ya da kültürel asimilasyona uğrayan Türk topluluklarını **\"BUMPAK\"** şifresiyle hatırla: **B**ulgarlar (Tuna Bulgarları), **U**zlar (Hristiyan Oğuzlar), **M**acarlar, **P**eçenekler, **A**varlar, **K**umanlar (Kıpçaklar)."
  },
  {
    "type": "paragraph",
    "text": "Balkanlar''a göç edip Hristiyanlığı benimseyen **Uzların** (Hristiyan Oğuzlar) günümüzdeki torunları ise Moldova ve Balkan coğrafyasında yaşayan **Gagavuz (Gökoğuz) Türkleri**dir."
  },
  {
    "type": "paragraph",
    "text": "İnanç ve ekonomi alanında iki devlet özel bir yere sahiptir. **Hazarlar**, Museviliği benimseyen tek Türk devleti olmasının yanında ülkesinde farklı dinlerin yan yana yaşadığı bir hoşgörü ortamı (**Hazar Barış Çağı / Pax Khazarica**) kurmuştur. Ordularında kendi halkı yerine **ücretli askerlere** yer vermeleri, diğer Türk devletlerinden ayrılan en belirgin özellikleridir. **İtil Bulgarları** ise **Almış Han** döneminde İslamiyet''i resmen kabul ederek Doğu Avrupa''da İslam''ı devlet dini yapan ilk Türk devleti olmuştur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "**İlk Müslüman Türk boyu** ile **İslamiyet''i resmen kabul eden ilk Türk devleti** kavramlarını birbirine karıştırma. 751 **Talas Savaşı**''nda Arapların yanında yer alıp İslamiyet''i benimseyen ilk Türk **boyu Karluklar**dır. Buna karşılık Orta Asya''da İslamiyet''i kabul eden ilk Türk **devleti Karahanlılar**, Doğu Avrupa''da ise **İtil Bulgarları**''dır. Ayrıca Macarların Hristiyanlaşmasına karşın **Avrupa''daki ilk Türkoloji Enstitüsü**''nü 1870''te Budapeşte''de kurduğunu unutma."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Örnek soru kurgusu: *Kendi adına madeni para bastıran ilk Türk hükümdarı kimdir, hangi devlete mensuptur?* → Cevap: **Türgiş** hükümdarı **Baga Tarkan**''dır. Türgişler ayrıca **Sulu Kağan** önderliğinde Emevilerin Orta Asya''daki ilerleyişini durdurarak bölgenin Araplaşmasını engellemiştir."
  },
  {
    "type": "key_points",
    "items": [
      "**Uldız** Anadolu''ya ilk ayak basan Avrupa Hun hükümdarıdır; **Atilla** Hristiyan olmamış, **Nibelungen Destanı**''nda **Etzel** adıyla yer almıştır.",
      "**Hunlar** ve **Avarlar** hem Orta Asya''da hem Avrupa''da devlet kurmuştur; Avarlar İstanbul''u kuşatan ilk Türk devletidir.",
      "**Peçenekler** ve **Uzlar** 1071 Malazgirt Savaşı''nda Bizans ordusundan ayrılarak Büyük Selçuklu safına geçmiştir.",
      "**Hazarlar** Museviliği seçen tek Türk devleti olup orduda ücretli asker kullanmıştır; **İtil Bulgarları** Almış Han döneminde Müslüman olmuştur.",
      "**Kıpçaklar** *Codex Cumanicus* sözlüğünü bırakmış, **Türgişler**de Baga Tarkan kendi adına para bastırmıştır."
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
  'tarih.islamiyet_oncesi_turk_tarihi.03',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  3,
  'Bölüm 3: I. ve II. Göktürk Devletleri ile Uygur Uygarlığı',
  'Asya Hun Devleti''nin ardından Orta Asya bozkırlarındaki siyasi boşluğu Avarlar doldurmuş, ancak Avarlara bağlı yaşayan Töles boylarının isyanını bastıran Bumin Kağan, 552 yılında Avar egemenliğine son vererek I.  Göktürk Devleti''ni kurmuştur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Asya Hun Devleti''nin ardından Orta Asya bozkırlarındaki siyasi boşluğu Avarlar doldurmuş, ancak Avarlara bağlı yaşayan Töles boylarının isyanını bastıran **Bumin Kağan**, 552 yılında Avar egemenliğine son vererek **I. Göktürk Devleti**''ni kurmuştur. Bu devlet, tarihte **\"Türk\"** adını resmî devlet adı olarak kullanan ilk siyasi yapıdır. Başkent Ötüken''den doğuyu Bumin Kağan yönetirken, batı kanadının idaresi kardeşi **İstemi Yabgu**''ya verilmiştir."
  },
  {
    "type": "heading",
    "text": "İstemi Yabgu ve İpek Yolu Diplomasisi"
  },
  {
    "type": "paragraph",
    "text": "I. Göktürk dış politikasının temel ekseni **İpek Yolu** ticaretinin denetimiydi. İstemi Yabgu, bu hattı elinde tutan Akhunlara (Eftalitler) karşı önce **Sasanilerle** ittifak kurarak Akhun Devleti''ni yıktı. Ancak Sasaniler ticaret yolunu Türk kervanlarına kapatınca, İstemi Yabgu bu kez **Bizans** ile elçi teatisine girişip Sasanilere karşı yeni bir ittifak oluşturdu. Orta Asya''dan İstanbul''a ilk Türk elçilik heyetinin gönderilmesi bu dönemin ürünüdür."
  },
  {
    "type": "paragraph",
    "text": "I. Göktürk Devleti, Çin''in entrikaları ve iç bölünmeler sonucu 630''da Çin egemenliğine girdi. Bu esaret döneminde yaşanan **Kür Şad Ayaklanması**, 39 arkadaşıyla birlikte Çin sarayını basan Kür Şad''ın adı etrafında Türk bağımsızlık mücadelesinin simgesi haline gelmiştir."
  },
  {
    "type": "heading",
    "text": "II. Göktürk (Kutluk) Devleti ve Orhun Abideleri"
  },
  {
    "type": "paragraph",
    "text": "Yaklaşık yarım yüzyıllık Çin esaretinin ardından **Kutluk Kağan**, 682 yılında Ötüken''de **II. Göktürk (Kutluk) Devleti**''ni kurdu. Halkını yeniden derleyip topladığı için kendisine **\"İlteriş\"** (devleti derleyen) unvanı verildi. Devletin kuruluşunda ve yönetiminde ünlü vezir **Tonyukuk** başrol oynadı; *Apa Tarkan* unvanlı Tonyukuk aynı zamanda ilk Türk tarihçisi ve devlet adamı sayılır."
  },
  {
    "type": "paragraph",
    "text": "Devletin en parlak dönemi **Bilge Kağan** ve kardeşi **Kül Tigin** zamanıdır. Bu dönemin en kalıcı mirası, 38 harfli **Göktürk (Orhun) Alfabesi** ile yazılmış **Orhun Abideleri**''dir. Dikkat et: Abideler Türklerin ilk yazılı tarih ve edebiyat belgeleri olup hükümdarın halka hesap vermesini anlatması bakımından bir **siyasetname** niteliği taşır."
  },
  {
    "type": "callout",
    "kind": "info",
    "text": "Orhun Abideleri sırasıyla **Vezir Tonyukuk** (725), **Kül Tigin** (732) ve **Bilge Kağan** (735) adına dikilmiştir. Yazıtları bilim dünyasına tanıtan İsveçli subay **Strahlenberg**''dir. Anıtların üzerindeki yazıyı 1893 yılında çözen kişi ise Danimarkalı dilbilimci **Wilhelm Thomsen** olmuştur; okunan ilk kelime **Tengri (Tanrı)** sözcüğüdür."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, **Orhun Abideleri**''nin kimler adına dikildiğini sorarken **Bumin Kağan** ya da **İstemi Yabgu** isimlerini çeldirici olarak verir. Bumin ve İstemi **I. Göktürk** kurucularıdır; Orhun Abideleri ise **II. Göktürk (Kutluk)** dönemine ait olup yalnızca **Tonyukuk, Kül Tigin ve Bilge Kağan** adına dikilmiştir. Ayrıca Orta Asya''nın en eski Türkçe yazıtları kabul edilen ve **Kırgızlara** ait olan **Yenisey Yazıtları**''nı Orhun Abideleri ile karıştırma."
  },
  {
    "type": "heading",
    "text": "Uygur Devleti ve Yerleşik Yaşama Geçiş"
  },
  {
    "type": "paragraph",
    "text": "Basmil ve Karluk boylarıyla birleşen **Kutluk Bilge Kül Kağan**, 744 yılında II. Göktürk Devleti''ne son vererek **Orhun (Karabalgasun)** merkezli **Uygur Devleti**''ni kurdu. **Bögü Kağan** döneminde Çin seferi sırasında tanışılan **Maniheizm** dini resmî din olarak kabul edildi. Bu inanç değişikliği Türk tarihinde köklü bir medeniyet dönüşümü başlattı."
  },
  {
    "type": "paragraph",
    "text": "Maniheizm et yemeyi ve savaşmayı yasakladığı için Uygurlar zamanla savaşçı özelliklerini yitirdi; buna karşılık tarım, ticaret, şehircilik ve sanatta büyük atılım yaptılar. Böylece **yerleşik hayata geçen ilk Türk devleti** oldular. Ayrıca Budizm ve Maniheizm metinlerini Türkçeye çevirirken *Çuastuanift*, *Altun Yaruk*, *Sekiz Yükmek* ve *Irk Bitig* (fal kitabı) gibi önemli dinî ve edebî eserler kaleme aldılar."
  },
  {
    "type": "bullets",
    "items": [
      "**Şehircilik ve Mimari:** Ordu-Balık (Karabalgasun) başta olmak üzere surlarla çevrili kentler, **stupa** adı verilen tapınaklar ve kalıcı evler inşa ettiler.",
      "**Yazı, Kâğıt ve Matbaa:** 18 harfli **Uygur Alfabesi**''ni kullandılar; kâğıt ve tahta harflerden oluşan **hareketli matbaa** tekniğini geliştirerek ilk kütüphaneleri kurdular.",
      "**Töre ve Kültür:** Sözlü hukuk kuralları olan **töreyi yazılı hale getirdiler**; **fresk** (duvar resmi), **minyatür**, tezhip ve ilk **orta oyunu** örneklerini verdiler.",
      "**Siyasi Miras:** 840''ta Kırgız saldırısıyla yıkılan Uygurların bir kolu Kansu ve Turfan bölgelerine göç ederek varlığını sürdürdü."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Uygurların yerleşik hayata geçmesiyle **savaşçı kimliklerinin zayıfladığını** hatırla. ÖSYM sıkça *\"Maniheizm Uygurların askeri gücünü artırmıştır\"* şeklinde yanlış önerme kurar. Gerçekte et yeme ve kan dökme yasağı askeri dinamizmi düşürmüş, devlet 840 yılında **Kırgızlar** tarafından yıkılmıştır. Buna karşın Uygurlar daha sonra **Moğol** saraylarında kâtip ve bürokrat olarak görev alıp Moğolların Türkleşmesinde etkili olmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "**I. Göktürk Devleti** Türk adını devlet adı yapan ilk devlettir; **İstemi Yabgu** İpek Yolu için önce Sasanilerle, sonra Bizans''la ittifak kurmuştur.",
      "**II. Göktürk Devleti**''ni **Kutluk (İlteriş) Kağan** ve **Tonyukuk** kurmuştur; dönemin mirası **Orhun Abideleri** 1893''te **Wilhelm Thomsen** tarafından okunmuştur.",
      "**Uygurlar**, **Bögü Kağan** döneminde **Maniheizm**''i seçerek yerleşik hayata geçen ilk Türk devleti olmuştur.",
      "Uygurlar ilk kütüphaneleri kurmuş, **matbaa** kullanmış ve **töreyi yazılı hale getirmiştir**.",
      "Uygurlara ait **Karabalgasun** ve **Sine-Uşi (Moyen-Çor)** yazıtları önemli yazılı kaynaklardır."
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
  'tarih.islamiyet_oncesi_turk_tarihi.04',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  4,
  'Bölüm 4: Devlet Yönetimi, Töre Hukuku, Ordu ve Toplum Yapısı',
  'İslamiyet öncesi Türk devletlerinde egemenlik anlayışının merkezinde kut inancı yer alır.  Gök Tanrı tarafından hükümdara ve ailesine devlet yönetme yetkisi verildiğine inanılması, siyasi meşruiyetin temelidir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İslamiyet öncesi Türk devletlerinde egemenlik anlayışının merkezinde **kut** inancı yer alır. Gök Tanrı tarafından hükümdara ve ailesine devlet yönetme yetkisi verildiğine inanılması, siyasi meşruiyetin temelidir. Kut kan yoluyla hükümdar soyundan gelen tüm erkek üyelere geçtiği için ülke **hanedanın ortak malı** sayılmıştır."
  },
  {
    "type": "paragraph",
    "text": "Bu anlayış, iktidarı elinde tutan hanedana kutsiyet kazandırsa da düzenli bir **veraset sisteminin** oluşmasını engellemiştir. Her şehzadenin tahtta hak iddia edebilmesi sık sık **taht kavgalarına** ve Türk devletlerinin kısa sürede bölünmesine yol açmıştır. Ancak hükümdar sınırsız yetkilere sahip değildir; kağanın kararları **Türk töresi** ve **Kurultay** ile denetlenmiştir."
  },
  {
    "type": "callout",
    "kind": "info",
    "text": "Türk devlet anlayışında kağan, yalnızca fetih yapan bir komutan değil, halkı doyuran, giydiren ve adaleti sağlayan **sosyal devlet** lideridir. Orhun Abideleri''nde Bilge Kağan''ın *\"Aç milleti doyurdum, çıplak milleti giydirdim\"* sözü bu sorumluluğu vurgular."
  },
  {
    "type": "heading",
    "text": "İkili Teşkilat, Kurultay ve Hükümdarlık Alametleri"
  },
  {
    "type": "paragraph",
    "text": "Geniş bozkır coğrafyasında yönetimi kolaylaştırmak amacıyla devlet **doğu** ve **batı** olmak üzere iki kanada ayrılmıştır. Güneşin doğduğu **doğu kanadı** kutsal sayıldığı için asıl kağan burada oturur, batı kanadını ise genellikle hanedandan **Yabgu** unvanlı yönetici idare ederdi. Batı kanadı iç işlerinde serbest, dış işlerinde doğudaki kağana bağlı olduğu için bu yapı **federatif** bir nitelik taşır."
  },
  {
    "type": "paragraph",
    "text": "Devletin siyasi, ekonomik ve hukuki meselelerinin görüşüldüğü yüksek meclis **Kurultay (Toy / Kengeş)** adını alır. Kurultaya kağan, eşi **Hatun (Katun)**, hanedan üyeleri, boy beyleri ve üst düzey komutanlar (**Toygun**) katılırdı. Hatun''un mecliste söz sahibi olması ve yabancı elçileri karşılayabilmesi, Türklerde kadının siyasi statüsünün yüksek olduğunu gösterir."
  },
  {
    "type": "table",
    "headers": [
      "Devlet / Topluluk",
      "Danışma / Karar Meclisi Adı"
    ],
    "rows": [
      [
        "Genel Türk Devletleri",
        "Kurultay / Toy / Kengeş"
      ],
      [
        "Avrupa Hunları",
        "Seçkinler Meclisi"
      ],
      [
        "Hazarlar",
        "İhtiyarlar Meclisi"
      ],
      [
        "Peçenekler",
        "Komenton"
      ],
      [
        "Tabgaçlar",
        "Nazırlar Meclisi"
      ],
      [
        "Tuna Bulgarları",
        "Millet Meclisi"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Hükümdarların kullandığı **unvanlar** (*Kağan, Han, Hakan, Yabgu, Şanyü, Tanhu, İdikut, İlteber*) ve **egemenlik alametleri** KPSS''de sıkça yoklanır. **Örgin** (taht), **Otağ** (hükümdar çadırı), **Tuğ** (sancak), **Nevbet** (davul), **Kotuz** (sorguç), **Kemer (Kur)**, **Berge** (kamçı) ve **Yarlığ** (ferman) başlıca alametlerdir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İslamiyet öncesi Türklerde **hutbe okutmak**, **para üzerinde halife onayı (menşur) almak** ya da **tıraz (hilat) giymek** gibi uygulamalar **kesinlikle yoktur**. Bu semboller İslamiyet''in kabulünden sonraki Türk-İslam devletleriyle başlamıştır. ÖSYM egemenlik alametleri sorularında bu ayrımı sürekli çeldirici olarak kullanır."
  },
  {
    "type": "heading",
    "text": "Bürokrasi Görevlileri, Töre ve Toplum Basamakları"
  },
  {
    "type": "paragraph",
    "text": "Devlet idaresinde görev alan başlıca makamları dönemleriyle birlikte bilmelisin. **Ayuki** hükümeti (bakanlar kurulunu), **Ayguçı (Üge)** başveziri, **Buyruk** bakanı, **Bitikçi** kâtibi, **Tamgacı** mühürdarı, **Tudun** vergi memurunu, **Tutuk** askerî valiyi, **Subaşı** ordu komutanını, **Ağılıg** ise hazinedarı ifade eder. Hükümdar oğluna **Tigin**, boy yönetimine gönderilen hanedan üyesine **Şad**, tiginlerin eğitiminden sorumlu hocaya da **İnal** veya **Ataman** denirdi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Dönem eşleştirmesine dikkat et: İslamiyet öncesi **Tigin / Ataman (İnal)** ikilisi, Türk-İslam devletlerinde **Melik / Atabey**, Osmanlı''da ise **Şehzade / Lala** adını almıştır. Sınavda dönemler arası kavram kaydırması yapıldığında bu üçlü şemayı gözünün önüne getir."
  },
  {
    "type": "paragraph",
    "text": "Yazısız hukuk kuralları bütünü olan **törenin** kaynakları gelenekler, kurultay kararları ve kağan buyruklarıdır. Töre zamanın şartlarına göre kurultay kararıyla güncellenebilse de dört temel ilkesi **asla değiştirilemez**: **Könilik** (adalet), **Uzluk** (iyilik/faydalılık), **Tüzlük** (eşitlik) ve **Kişilik** (insanlık/evrensellik). Töreye kağan dahil herkes uymak zorundadır; bu yönüyle hukukun üstünlüğü ilkesi vardır."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Toplum yapısının küçükten büyüğe sıralamasını **\"O-U-B-B-İ\"** şeklinde kodlayabilirsin: **O**guş (Aile) → **U**rug (Sülale/Soy) → **B**oy (Kabile/Ok) → **B**udun (Millet/Boy Birliği) → **İ**l / El (Devlet)."
  },
  {
    "type": "paragraph",
    "text": "Türk ordusu **onlu sistem** üzerine kuruluydu; askerlik ücretli değil **vatan hizmeti** sayıldığı için **ordu-millet** anlayışı geçerliydi. Savaşlarda düşmanı sahte geri çekilmeyle çembere alan **Turan (Hilal / Kurt Kapanı)** taktiği uygulanır, düşman kuvvetlerini önceden gözetleyen keşif birliklerine ise **Yelme** adı verilirdi."
  },
  {
    "type": "key_points",
    "items": [
      "**Kut anlayışı** egemenliğe ilahi kaynak verirken, veraset belirsizliği yüzünden **taht kavgalarına** yol açmıştır.",
      "**İkili teşkilatta** doğu kanadı üstündür; batıdaki **Yabgu** iç işlerinde serbest, dış işlerinde doğuya bağlıdır.",
      "Törenin değişmez dört ilkesi **Könilik** (adalet), **Uzluk** (iyilik), **Tüzlük** (eşitlik) ve **Kişilik** (insanlık)tir.",
      "İslamiyet öncesinde **hutbe** ve **menşur** gibi İslami alametler yoktur.",
      "Toplum basamakları küçükten büyüğe **Oguş → Urug → Boy → Budun → İl** sırasıyla yükselir."
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
  'tarih.islamiyet_oncesi_turk_tarihi.05',
  'Tarih',
  'İslamiyet Öncesi Türk Tarihi',
  5,
  'Bölüm 5: İnanç, Ahiret Anlayışı, Bilim, Sanat ve Edebiyat',
  'İslamiyet öncesi Türklerin temel inancı tek yaratıcı esasına dayanan Gök Tanrı inancıdır.  Bunun yanında doğada gizli güçlerin varlığına inanan Tabiat Kuvvetleri kültü, ataların ruhlarına saygı duyan Atalar Kültü ve din adamları (Kam, Baksı, Şaman) etrafında şekillenen uygulamalar görülür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İslamiyet öncesi Türklerin temel inancı tek yaratıcı esasına dayanan **Gök Tanrı** inancıdır. Bunun yanında doğada gizli güçlerin varlığına inanan *Tabiat Kuvvetleri* kültü, ataların ruhlarına saygı duyan *Atalar Kültü* ve din adamları (*Kam, Baksı, Şaman*) etrafında şekillenen uygulamalar görülür. Türkler ölümden sonraki yaşama (**ahiret inancı**) kesin biçimde inanmıştır."
  },
  {
    "type": "heading",
    "text": "Ahiret İnancının Somut Kanıtları"
  },
  {
    "type": "paragraph",
    "text": "Ölülerin eşyaları, silahları ve atlarıyla birlikte gömüldüğü oda biçimindeki mezarlara **Kurgan** denir. Cenaze törenlerine **Yuğ**, ölülerin ardından yakılan ağıtlara ise **Sagu** adı verilir. İyi ruhların gideceği cennet **Uçmağ**, kötü ruhların cezalandırılacağı cehennem ise **Tamu** olarak adlandırılmıştır. Mezarların başına dikilen ve öldürülen düşmanları simgeleyen taş heykellere (**Balbal**) öteki dünyada hizmet edeceğine inanılması, ahiret inancının en güçlü kanıtları arasındadır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "**Kurgan, Balbal ve mezar içine eşya koyma** doğrudan ahiret inancının kanıtıdır. Buna karşılık yalnızca **Yuğ** (cenaze töreni) veya **Sagu** (ağıt) tek başına ölümden sonraki yaşamı değil, ölüye duyulan saygıyı gösterir. Sorularda \"hangisi ahiret inancının kesin kanıtıdır?\" dendiğinde Kurgan''daki eşyaları, Uçmağ-Tamu kavramlarını ve Balbal taşlarını ara."
  },
  {
    "type": "heading",
    "text": "Bilim, Sanat ve Günlük Yaşam"
  },
  {
    "type": "paragraph",
    "text": "Türklerin konargöçer yaşam tarzı nedeniyle uzun süreli kalıcı mimari eserler geç dönemde (Uygurlarla) ortaya çıkmıştır. Bozkır döneminde daha çok taşınabilir sanat eserleri —kemer tokaları, halı ve kilimler, at koşum takımları, çadır süslemeleri— gelişmiştir. Esik Kurganı''ndan çıkan **Altın Elbiseli Adam Zırhı** İskit (Saka) sanatının, dünya tarihinin bilinen en eski düğümlü halısı sayılan **Pazırık Halısı** (Altaylar) ise Asya Hun sanatının ulaştığı düzeyi gösterir."
  },
  {
    "type": "paragraph",
    "text": "Zaman ölçümünde **12 Hayvanlı Türk Takvimi** kullanılmıştır. Bu takvim güneş yılı esaslıdır ve her yıl bir hayvan adıyla anılır; bu durum Türklerin astronomi ve doğa gözlemi konusundaki birikimini kanıtlar. Ayrıca yılın belirli günlerinde halkın bir araya gelip yemek yediği, müzik eşliğinde eğlence ve spor müsabakaları düzenlediği büyük toplumsal şenliklere **Şölen** adı verilir; şölenler toplumsal dayanışmayı ve boylar arası birliği pekiştirirdi."
  },
  {
    "type": "paragraph",
    "text": "Bozkır kültüründe demircilik ve maden işçiliği de son derece ileriydi. Silah yapımı, üzengi, gem ve kemer tokaları başta olmak üzere \"hayvan üslubu\" adı verilen süsleme sanatı bütün Avrasya bozkırlarına yayıldı. Tıp alanında ise şifalı bitkilerden ilaç hazırlayan hekimlere **Otacı** veya **Emçi** denirdi."
  },
  {
    "type": "heading",
    "text": "Sözlü ve Yazılı Edebiyat Ürünleri"
  },
  {
    "type": "paragraph",
    "text": "Yazının yaygınlaşmasından önceki dönemde Türk kültürü **kopuz** eşliğinde söylenen sözlü ürünlerle aktarılmıştır. Kısa ve özlü atasözlerine **Sav**, doğa ve kahramanlık şiirlerine **Koşuk**, yas şiirlerine **Sagu** denir. Toplulukların derin iz bırakan olaylarını anlatan destanlar ise devletlere göre ayrılır."
  },
  {
    "type": "table",
    "headers": [
      "Devlet / Topluluk",
      "Sözlü ve Yazılı Edebiyat Eseri"
    ],
    "rows": [
      [
        "İskitler (Sakalar)",
        "Alper Tunga Destanı, Şu Destanı"
      ],
      [
        "Asya Hunları",
        "Oğuz Kağan Destanı"
      ],
      [
        "Avrupa Hunları",
        "Sihirli Geyik Efsanesi"
      ],
      [
        "Göktürkler",
        "Ergenekon Destanı, Bozkurt Destanı, Orhun Abideleri"
      ],
      [
        "Uygurlar",
        "Türeyiş Destanı, Göç Destanı, Karabalgasun ve Sine-Uşi Yazıtları"
      ],
      [
        "Kırgızlar",
        "Manas Destanı (en uzun destan), Yenisey Yazıtları"
      ],
      [
        "Kıpçaklar",
        "Dede Korkut Hikâyeleri (mücadeleleri), Codex Cumanicus"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Göktürk ve Uygur destanlarını karıştırmamak için **\"GEB-UTG\"** kısaltmasını kullan: **G**öktürk → **E**rgenekon ve **B**ozkurt; **U**ygur → **T**üreyiş ve **G**öç."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "**Alper Tunga** ve **Şu** destanlarının **İskitlere**, **Oğuz Kağan Destanı**''nın **Asya Hunlarına** (Mete Han''ı simgeler) ait olduğunu unutma. Ayrıca dünyanın hâlâ yaşayan en uzun destanı olan **Manas Destanı** Uygurlara değil, **Kırgızlara** aittir. Yazılı eserlerde ise **Yenisey Yazıtları**''nın Kırgızlara, **Orhun Abideleri**''nin II. Göktürklere, **Karabalgasun** ve **Sine-Uşi (Moyen-Çor)** yazıtlarının ise Uygurlara ait olduğunu net biçimde ayır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Örnek soru kurgusu: *İslamiyet öncesi Türklerde şaman veya din adamlarına verilen adlar ile şair-ozanlara verilen adlar nelerdir?* → Din adamlarına **Kam, Baksı, Şaman**, kopuz eşliğinde şiir söyleyen ozanlara ise **Ozan** denirdi; bu ozanlar halk edebiyatında önemli bir sözlü tarih taşıyıcısıydı."
  },
  {
    "type": "key_points",
    "items": [
      "**Kurgan**, **Balbal**, **Uçmağ** ve **Tamu** kavramları İslamiyet öncesi Türklerde **ahiret inancının** temel göstergeleridir.",
      "**Altın Elbiseli Adam Zırhı** İskitlere (Sakalar), **Pazırık Halısı** Asya Hunlarına aittir; **12 Hayvanlı Takvim** güneş yılı esaslıdır.",
      "Sözlü edebiyatta **Sav** (atasözü), **Koşuk** (şiir), **Sagu** (ağıt) ve **Destan** türleri **kopuz** eşliğinde yaşatılmıştır.",
      "**Ergenekon ve Bozkurt** Göktürklere; **Türeyiş ve Göç** Uygurlara; **Manas** ise Kırgızlara aittir."
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
-- 📖 KADRO KONU ANLATIMI — Tarih · İlk Türk-İslam Devletleri
-- Kaynak: docs/konu_anlatimi/tarih/02_ilk_turk_islam_devletleri.md
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
  'tarih.ilk_turk_islam_devletleri.01',
  'Tarih',
  'İlk Türk-İslam Devletleri',
  1,
  'Bölüm 1: İslamiyet''in Kabulü, Karahanlılar ve Gazneliler',
  'Türklerin İslamiyet''i tanıması Emeviler dönemindeki sınır çatışmalarıyla başlasa da kitleler halinde İslam''a giriş süreci Abbasilerin hoşgörülü mevali dışı siyaseti ve 751 Talas (Atlık) Savaşı ile hızlandı.  Abbasiler ile Çin arasında Orta Asya egemenliği için yapılan bu savaşta Karluk, Yağma ve Çiğil Türkleri Abbasilerin yanında yer aldı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türklerin İslamiyet''i tanıması Emeviler dönemindeki sınır çatışmalarıyla başlasa da kitleler halinde İslam''a giriş süreci Abbasilerin hoşgörülü mevali dışı siyaseti ve **751 Talas (Atlık) Savaşı** ile hızlandı. Abbasiler ile Çin arasında Orta Asya egemenliği için yapılan bu savaşta **Karluk, Yağma ve Çiğil** Türkleri Abbasilerin yanında yer aldı. Savaşın sonucunda Orta Asya Çin egemenliğine girmekten kurtuldu, Türkler arasında İslamiyet hızla yayıldı ve Türk-İslam tarihi resmen başladı."
  },
  {
    "type": "paragraph",
    "text": "Talas Savaşı yalnızca askeri bir dönüm noktası değil, dünya kültür ve bilim tarihini değiştiren bir kırılmadır. Çinlilerden öğrenilen kağıt yapımı Çin sınırları dışına çıkarak ilk kez **Semerkand** kentinde üretilmeye başlandı; ayrıca Uygurlara ait matbaa ve sanat birikimi batı dünyasına taşındı. Bu kültürel hareketlilik sonucunda Semerkand **\"Şehirlerin Şahı\"**, Kaşgar ise **\"Işıldayan İnci\"** unvanıyla İslam medeniyetinin doğudaki parlayan merkezlerine dönüştü."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, Talas Savaşı''nda tarafları ve sonuçları sıklıkla ters çevirir: Bu savaş doğrudan Türk-Çin savaşı değil, **Çin ile Abbasi Devleti** arasında yapılmış bir mücadeledir; **Karluk, Yağma ve Çiğil** Türkleri Abbasilerin yanında yer almıştır. Savaş sonrasında Karluklar kitleler halinde İslamiyet''i benimsemeye başlamış, Çinlilerden öğrenilen kağıt üretimi de **Semerkand** üzerinden İslam dünyasına geçmiştir."
  },
  {
    "type": "heading",
    "text": "İlk Müslüman Türk Devletleri: İtil Bulgarları ve Karahanlılar"
  },
  {
    "type": "paragraph",
    "text": "Sınav sorularında \"ilk Müslüman Türk devleti\" ifadesini gördüğünde coğrafi sınırlamaya mutlaka dikkat etmelisin. Doğu Avrupa''da **Almış Han** döneminde İslamiyet''i kabul eden **İtil Bulgarları** tarihteki ilk Müslüman Türk devleti sayılırken, **Orta Asya''da** kurulan ilk Müslüman Türk devleti **Karahanlılar**dır (840-1212). İbn Fadlan''ın seyahatnamesinde anlattığı İtil Bulgarları ile Orta Asya''daki Karahanlılar arasındaki bu coğrafi ayrım klasik bir sınav sorusudur."
  },
  {
    "type": "paragraph",
    "text": "**Bilge Kül Kadir Han** tarafından kurulan Karahanlılar, **Satuk Buğra Han** döneminde İslamiyet''i resmi din olarak benimsedi ve hükümdar **Abdülkerim** adını aldı. Divan-ı Lügati''t-Türk''te Afrasyab oğulları olarak da anılan Karahanlı hanedanı, halkı ve yöneticileri tamamen Türk olduğu için Arap ve Fars kültürünün içinde erimedi. **Hakaniye Türkçesini** resmi dil olarak kullanmaları ve **ikili teşkilat** gibi eski Türk devlet geleneklerini sürdürmeleri, milli kimliklerini koruduklarının en açık kanıtıdır."
  },
  {
    "type": "bullets",
    "items": [
      "**Kurumsallaşma ve sosyal devlet:** İlk **burslu öğrencilik** sistemini başlattılar ve **Semerkand Medresesini** açtılar.",
      "**Ribat:** Başlangıçta sınır güvenliği ve gözetleme için yaptıkları bu yapıları zamanla ticaret yolları üzerindeki kervansaraylara dönüştürdüler.",
      "**Bimarhane (Bimaristan):** Karahanlıların kurduğu hastanelere verilen addır."
    ]
  },
  {
    "type": "callout",
    "kind": "info",
    "text": "Türk-İslam devletlerinde hastane isimleri kurucusuna göre değişir. Soruda **Maristan** geçiyorsa Tolunoğulları, **Bimarhane / Bimaristan** geçiyorsa Karahanlılar, **Darüşşifa** geçiyorsa Selçuklular ve Anadolu beylikleri aklına gelmelidir."
  },
  {
    "type": "heading",
    "text": "Gazneliler (963-1187)"
  },
  {
    "type": "paragraph",
    "text": "**Alp Tigin** tarafından Afganistan''ın **Gazne** şehrinde kurulan devlet, adını kurucusundan veya boyundan değil, kurulduğu şehirden almıştır. Tarihte ilk kez **Padişah** unvanını kullanan hükümdar da Alp Tigin olarak bilinir. En parlak dönem ise **Gazneli Mahmut** zamanında yaşandı."
  },
  {
    "type": "paragraph",
    "text": "Gazneli Mahmut, Şii **Büveyhoğulları** baskısına karşı Abbasi halifesini koruduğu için halifeden **Sultan** unvanını alan ilk Türk hükümdarı oldu; ayrıca **Yeminü''d-Devle (Zamanın Yeganesi)** ve **Alemin Aslanı** unvanlarıyla onurlandırıldı. Hindistan üzerine tam **17 sefer** düzenleyerek bugünkü Pakistan, Bangladeş ve Kuzey Hindistan coğrafyasında İslamiyet''in yayılmasını ve kast sisteminin sarsılmasını sağladı. Bu seferlerin en ünlüsü **1025 Somnat Seferi**dir; ünlü bilim insanı **Biruni** de bu seferlere katılmış ve Sultan Mahmut tarafından **\"Sarayımın en değerli hazinesi\"** sözüyle övülmüştür."
  },
  {
    "type": "table",
    "headers": [
      "Devlet",
      "Adını Nereden Aldı?",
      "Öne Çıkan Hükümdar",
      "Kritik Unvan veya Kurum"
    ],
    "rows": [
      [
        "Karahanlılar",
        "Hanedan unvanından",
        "Satuk Buğra Han",
        "Abdülkerim / Bimarhane, Ribat"
      ],
      [
        "Gazneliler",
        "Kurulduğu Gazne şehrinden",
        "Gazneli Mahmut",
        "Sultan, Yeminü''d-Devle / Somnat Seferi"
      ],
      [
        "Tolunoğulları",
        "Kurucusu Tolunoğlu Ahmet''ten",
        "Tolunoğlu Ahmet",
        "Maristan (hastane)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Gazneliler, Karahanlıların aksine çok uluslu bir toplumsal yapıya sahipti. Yönetim ve ordu Türklerden oluşurken halk Hint, İran ve Afgan kökenliydi; resmi yazışmalarda Farsça ve edebiyatta Arapça öne çıktı. Bu etnik çeşitlilik, Selçuklular karşısında alınan **1035 Nesa**, **1038 Serahs** ve **1040 Dandanakan** yenilgilerinin ardından devletin hızla çözülmesine yol açtı."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Karahanlılarda halifeden menşur alınması mı yoksa Hakaniye Türkçesinin resmi dil yapılması mı ulusçu karakteri gösterir?\" Dikkat et: Halifeden menşur (onay) almak İslam hukuku ve hilafet makamıyla ilgili teokratik bir uygulamadır; milli kimliği koruma göstergesi olanlar Hakaniye Türkçesi ve ikili teşkilattır."
  },
  {
    "type": "key_points",
    "items": [
      "Talas Savaşı (751) ile Karluklar İslam''a girdi; kağıt üretimi Semerkand''da başladı.",
      "Doğu Avrupa''daki ilk Müslüman Türk devleti İtil Bulgarları, Orta Asya''daki ilk devlet Karahanlılardır.",
      "Karahanlılar Hakaniye Türkçesini ve ikili teşkilatı koruyarak milli kimliğini en saf haliyle yaşattı.",
      "Gazneli Mahmut halifeyi koruduğu için Sultan unvanını alan ilk Türk hükümdarıdır; sarayındaki büyük deha Biruni''dir."
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
  'tarih.ilk_turk_islam_devletleri.02',
  'Tarih',
  'İlk Türk-İslam Devletleri',
  2,
  'Bölüm 2: Mısır''da Kurulan Türk-İslam Devletleri ve Çağdaş Türk Devletleri',
  'Abbasi merkezi otoritesinin zayıfladığı 9.  yüzyıldan itibaren Mısır ve çevresinde art arda dört önemli Türk-İslam devleti kuruldu: Tolunoğulları, İhşidiler, Eyyubiler ve Memlükler.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Abbasi merkezi otoritesinin zayıfladığı 9. yüzyıldan itibaren Mısır ve çevresinde art arda dört önemli Türk-İslam devleti kuruldu: **Tolunoğulları, İhşidiler, Eyyubiler ve Memlükler**. Mısır''ın verimli tarım arazileri ve Kızıldeniz-Akdeniz ticaret yolları üzerindeki konumu bu devletlere büyük ekonomik güç sağladı; ancak yöneticilerin Türk, halkın Arap olması çoğunun ömrünü kısalttı. Bu dört devletin kronolojik sırası ve her birinin \"ilk\" özelliği KPSS''de sıkça sorulur."
  },
  {
    "type": "heading",
    "text": "Mısır''daki Dört Büyük Türk Devleti"
  },
  {
    "type": "paragraph",
    "text": "**Tolunoğulları (868-905)**, Tolunoğlu Ahmet tarafından kurulan ve **Mısır''da kurulan ilk Türk-İslam devleti** olan bir Tevaif-i Mülük devletidir. Yöneticileri Türk, halkı Arap olduğu için kısa sürede yıkılsa da Mısır''da önemli bayındırlık eserleri, **Tolunoğlu Ahmet Camii** ve ücretsiz hizmet veren **Maristan** adlı hastaneler bıraktılar."
  },
  {
    "type": "paragraph",
    "text": "**İhşidiler / Akşitler (935-969)**, Muhammed bin Toğaç tarafından Mısır''da kurulan ikinci Türk devletidir. Kurucusuna Abbasi halifesi tarafından \"Akşit (Prens / Beyaz Güneş)\" unvanı verilmiştir. En ayırt edici özellikleri ise **kutsal topraklar olan Hicaz bölgesine (Mekke, Medine, Taif) egemen olan ilk Türk-İslam devleti** olmalarıdır."
  },
  {
    "type": "paragraph",
    "text": "**Eyyubiler (1174-1250)**, Selahaddin Eyyubi tarafından kuruldu ve Haçlı seferlerine karşı İslam dünyasını savundu. Selahaddin Eyyubi **1187 Hıttin Savaşı** ile Kudüs Krallığı''nı bozguna uğratarak Kudüs''ü Haçlılardan geri aldı; bu büyük zaferi Batı dünyasında da derin iz bıraktı ve III. Haçlı Seferi''ne neden oldu."
  },
  {
    "type": "paragraph",
    "text": "**Memlükler / Kölemenler (1250-1517)** ise hem askeri başarıları hem de veraset sistemlerindeki büyük istisnalarıyla diğer tüm Türk devletlerinden ayrılır. Eyyubi ordusundaki Kıpçak ve Çerkes kökenli muhafız birliklerinin iktidarı devralmasıyla kurulan ve tarihte kendi devletlerine **Devlet-i Türkiye** adını veren Memlükler, **Sultan Kutuz ve Sultan Baybars** komutasında **1260 Ayn Calut Savaşı**nda Moğol İlhanlı ordularını yenerek tarihte Moğolları ilk kez durduran devlet oldular. Bu zafer yalnızca Mısır ve Kuzey Afrika''yı Moğol istilasından korumakla kalmadı, aynı zamanda Bağdat''ın 1258''de Moğollarca yakılmasının ardından dağılan İslam dünyasının siyasi merkezini Kahire''ye taşıdı. Memlükler Abbasi halifesini Kahire''de himaye ederek İslam dünyasındaki meşruiyetlerini ve saygınlıklarını uzun süre pekiştirdiler."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, Memlüklerin **veraset sistemi** istisnasını çok sever. Diğer Türk devletlerinde \"kut\" anlayışı gereği hükümdarlık yalnızca hanedan üyelerine (kan bağına) aitti. Memlüklerde ise kut kan bağıyla sınırlandırılmadı; ordudaki her güçlü **emir (komutan)** darbe veya seçimle sultan olma hakkına sahipti. Bu yüzden kısa sürede çok sık taht değişikliği yaşandı."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Mısır''da kurulan Türk-İslam devletlerini sırasıyla **T-İ-E-M** şeklinde aklında tut: - **T**olunoğulları: Mısır''da **ilk** Türk devleti (Maristan) - **İ**hşidiler (Akşitler): **Hicaz''a** hakim olan ilk Türk devleti - **E**yyubiler: **Hıttin** ile Kudüs''ü alan devlet (Selahaddin Eyyubi) - **M**emlükler: **Ayn Calut** ile Moğolları ilk durduran devlet ve veraset istisnası"
  },
  {
    "type": "heading",
    "text": "Harzemşahlar, Timur, Akkoyunlular ve Babürler"
  },
  {
    "type": "paragraph",
    "text": "Orta Asya ve Yakın Doğu''nun diğer önemli Türk-İslam güçleri de sınavda özel ayrıntılarıyla test edilir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Harzemşahlar (1097-1231):** Adını kurulduğu Harzem bölgesinden alır, kendilerini Büyük Selçuklu''nun varisi görürler. Moğol elçilerinin öldürüldüğü **Otrar Faciası** sonrasında Cengiz Han saldırısına uğradılar; **1230 Yassıçemen Savaşı**nda Türkiye Selçuklularına yenilince kısa süre sonra yıkıldılar.",
      "**Timur Devleti (1370-1507):** Büyük askeri başarılarının yanında **Türk dünyasına iki ağır darbe** vurmasıyla bilinir: **Altın Orda Devleti**ni parçalayarak Rus knezliklerinin güçlenip güneye inmesine zemin hazırladı ve **1402 Ankara Savaşı**nda Osmanlı''yı yenerek Fetret Devri''ne ve İstanbul''un fethinin gecikmesine yol açtı.",
      "**Akkoyunlular (1350-1502):** Uzun Hasan döneminde güçlendiler; **Kur''an-ı Kerim''i Türkçeye çevirdiler**, **Dede Korkut Hikayelerini** yazıya geçirdiler ve ünlü matematikçi **Ali Kuşçu**yu himaye ettiler.",
      "**Babür Devleti (1526-1858):** Hindistan''da Babür Şah tarafından kuruldu; **Şah Cihan** tarafından eşi Mümtaz Mahal adına Agra''da yaptırılan **Taç Mahal**, Türk-İslam mimarisinin dünyaca ünlü başyapıtıdır ve yapımında Osmanlı ustaları (İsa Efendi gibi) da görev almıştır."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Moğolları Ayn Calut Savaşı ile durduran devlet hangisidir?\" Seçeneklerde Harzemşahlar (Otrar Faciası ile yenildi) ve Anadolu Selçuklu (Kösedağ''da yenildi) mutlaka çeldirici olarak yer alır. Moğolları tarihte ilk kez durduran devlet kesinlikle **Memlükler**dir."
  },
  {
    "type": "key_points",
    "items": [
      "Mısır''da ilk Türk devleti Tolunoğulları, Hicaz''a ilk egemen olan İhşidiler, Kudüs''ü Hıttin ile alan Eyyubilerdir.",
      "Memlükler 1260 Ayn Calut ile Moğolları ilk kez durdurdu ve hanedan kan bağı olmadan her emirin sultan olabilmesiyle istisna oluşturdu.",
      "Akkoyunlular Dede Korkut''u yazıya geçirdi ve Kur''an''ı Türkçeye çevirdi; Taç Mahal ise Babür Şahı Cihan''ın eseridir.",
      "Timur, Altın Orda''yı yıkarak Rusların önünü açtı ve Ankara Savaşı ile Osmanlı''nın Balkan ilerleyişini geciktirdi."
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
  'tarih.ilk_turk_islam_devletleri.03',
  'Tarih',
  'İlk Türk-İslam Devletleri',
  3,
  'Bölüm 3: Büyük Selçuklu Devleti ve Yıkılış Süreci',
  'Oğuzların Üçok kolunun Kınık boyuna mensup olan Selçuklular, Tuğrul ve Çağrı Beyler önderliğinde devletleşme sürecini tamamladı.  Gaznelilere karşı kazanılan 1035 Nesa ve 1038 Serahs zaferlerinin ardından 1040 Dandanakan Savaşı ile Gazneli Sultan Mesut''un fillerle destekli ordusunu bozguna uğrattılar.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "**Oğuzların Üçok kolunun Kınık boyuna** mensup olan Selçuklular, **Tuğrul ve Çağrı Beyler** önderliğinde devletleşme sürecini tamamladı. Gaznelilere karşı kazanılan **1035 Nesa** ve **1038 Serahs** zaferlerinin ardından **1040 Dandanakan Savaşı** ile Gazneli Sultan Mesut''un fillerle destekli ordusunu bozguna uğrattılar. Dandanakan Savaşı ile Büyük Selçuklu Devleti resmen kurulurken Gazneliler yıkılış sürecine girdi; bu yüzden Nesa ve Serahs öncü savaşlar, Dandanakan ise kuruluşu resmileştiren ana meydan savaşıdır."
  },
  {
    "type": "heading",
    "text": "Yükseliş: Pasinler, Bağdat Seferi ve Malazgirt"
  },
  {
    "type": "paragraph",
    "text": "Tuğrul Bey döneminde batıya yönelen Selçuklular, **1048 Pasinler (Hasankale) Savaşı**nda Bizans ile ilk büyük meydan savaşını yaptı ve kazandı. Ardından **1055 Bağdat Seferi**ne çıkan Tuğrul Bey, Abbasi halifesini Şii **Büveyhoğulları** baskısından kurtardı. Halife bu hizmete karşılık Tuğrul Bey''e altın kılıçlar kuşatarak **\"Doğunun ve Batının Sultanı (Hükümdarı)\"** unvanını verdi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin en sevdiği klasik tuzaklardan biri şudur: \"1055 Bağdat Seferi ile halifelik Türklere (Tuğrul Bey''e) geçti.\" Bu bilgi **kesinlikle yanlıştır!** Tuğrul Bey ile birlikte İslam dünyasının **siyasi ve askeri liderliği** Türklere geçmiştir; ancak dini makam olan **halifelik** Abbasi soyunda kalmaya devam etmiştir. Halifelik ancak 1517 Ridaniye Seferi ile Yavuz Sultan Selim döneminde Osmanlı''ya geçecektir."
  },
  {
    "type": "paragraph",
    "text": "**Sultan Alparslan** döneminde Bizans sınırındaki güçlü **Ani Kalesi** fethedildi (1064). Bu fethin ardından Abbasi halifesi Alparslan''a **\"Ebu''l-Feth\" (Fetihlerin Babası)** unvanını verdi. 26 Ağustos **1071 Malazgirt Zaferi** ile Bizans İmparatoru Romen Diyojen esir alındı ve Anadolu''nun kapıları Türklere tamamen açıldı. Malazgirt yalnızca bir meydan savaşı zaferi değildir; Bizans''ın doğu sınır savunmasını çökerttiği için Orta Asya''dan gelen konargöçer Oğuz boylarının Anadolu''ya kitlesel göçünü başlattı ve Anadolu''nun etnik-kültürel çehresini kalıcı olarak değiştirdi. Sultan Alparslan fetihleri hızlandırmak için komutanlarına **\"kılıç hakkı\"** (fethedilen toprak fetheden komutanın yönetimindedir) politikasını uyguladı. Bu politika Anadolu''da I. Dönem Türk Beyliklerinin kurulmasını hızlandırsa da uzun vadede **merkezi otoriteyi zayıflatma** riski taşıdı."
  },
  {
    "type": "heading",
    "text": "Melikşah, Nizamülmülk ve Yıkılış Nedenleri"
  },
  {
    "type": "paragraph",
    "text": "**Sultan Melikşah** ve ünlü veziri **Nizamülmülk** dönemi Büyük Selçuklu''nun en parlak çağıdır. Sınırların Seyhun''dan Akdeniz''e uzanmasıyla birlikte devlet teşkilatının, vergi düzeninin ve ideolojik birliğin korunması zorunlu hale geldi. Bu dönemde kurulan **Nizamiye Medreseleri** (ilki 1067''de Bağdat''ta, başmüderrisi İmam Gazali) yalnızca dini eğitim verilen yerler değildi; aynı zamanda genişleyen imparatorluğun devlet memuru ve bürokrat ihtiyacını karşılamak ve Şii Fatımi ile **Batıni** propagandasına karşı Sünni İslam düşüncesini ideolojik olarak savunmak için kurulmuş ilk üniversite düzeyindeki yükseköğretim kurumlarıydı."
  },
  {
    "type": "paragraph",
    "text": "Yine Melikşah adına **Ömer Hayyam** başkanlığındaki heyet güneş yılı esaslı **Celali Takvim**i (mali işler için; Osmanlı''daki 19. yüzyıl Rumi takvimiyle karıştırma) hazırladı. Nizamülmülk ise devlet yönetiminin esaslarını, adalet ve istihbarat teşkilatını, ikta düzenini ve hükümdarın sorumluluklarını anlattığı Farsça **Siyasetname** adlı eserini kaleme aldı. Melikşah''ın ölümünün ardından başlayan taht kavgaları ve Haçlı Seferleri ise bu güçlü merkezi yapıyı hızla sarstı."
  },
  {
    "type": "timeline",
    "items": [
      {
        "label": "1040",
        "text": "Dandanakan Savaşı: Büyük Selçuklu kuruldu, Gazneliler çözüldü."
      },
      {
        "label": "1048",
        "text": "Pasinler Savaşı: Bizans ile yapılan ilk büyük savaş."
      },
      {
        "label": "1055",
        "text": "Bağdat Seferi: Tuğrul Bey \"Doğunun ve Batının Sultanı\" oldu."
      },
      {
        "label": "1064",
        "text": "Ani Kalesi Fethi: Alparslan''a \"Ebu''l-Feth\" unvanı verildi."
      },
      {
        "label": "1071",
        "text": "Malazgirt Zaferi: Anadolu''nun kapıları Türklere açıldı."
      },
      {
        "label": "1141",
        "text": "Katvan Savaşı: Karahitay yenilgisi, Büyük Selçuklu''nun dağılış süreci."
      }
    ]
  },
  {
    "type": "paragraph",
    "text": "Devletin çöküşü tek bir nedene değil, iç ve dış darbelerin birleşimine dayanır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Katvan Savaşı (1141):** Moğol kökenli Karahitaylara karşı alınan yenilgi Orta Asya hakimiyetini bitirdi.",
      "**Batınilik (Haşhaşiler):** Hasan Sabbah''ın kurduğu bu gizli örgüt, fedaileri aracılığıyla Nizamülmülk dahil pek çok devlet adamına suikast düzenledi.",
      "**Oğuz İsyanı:** Devletin Farsçayı resmi dil yapıp İran kökenli bürokratları öne çıkarmasına tepki gösteren kurucu unsur Oğuzlar isyan etti ve Sultan Sencer''i esir aldı.",
      "**Atabeyliklerin bağımsızlaşması:** Meliklerin eğitmeni olan atabeyler merkezi otorite zayıflayınca kendi devletçiklerini kurdular (**Zengiler, İldenizliler, Salgurlular, Böritiginler, Erbilliler**)."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, Selçuklu dağılınca ortaya çıkan **Atabeylikler** (Zengiler, İldenizliler, Salgurlular vb.) ile Malazgirt sonrası Anadolu''da kurulan **I. Beylikleri** (Saltuklular, Danişmentliler vb.) aynı şıklarda verip karıştırmanı bekler. Danişmentliler bir atabeylik değil, Anadolu beyliğidir!"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Sultan Alparslan''ın kılıç hakkı politikası aşağıdakilerden hangisine yol açmamıştır?\" Cevap genellikle \"merkezi otoritenin güçlenmesine\" olur; çünkü fethedenin yönetici olması fethi hızlandırır ama feodal bölünme riskini artırır."
  },
  {
    "type": "key_points",
    "items": [
      "Büyük Selçuklu''da halifelik Tuğrul Bey''e geçmedi; yalnızca siyasi/dünyevi liderlik Türklere geçti.",
      "Alparslan''a \"Ebu''l-Feth\" unvanı Malazgirt''ten önce, Ani Kalesi''nin fethinden sonra verildi.",
      "Nizamiye Medreseleri hem bürokrat yetiştirmek hem de Batıniliğe karşı ideolojik savunma kurmak için açıldı.",
      "Büyük Selçuklu''yu yıkan savaş 1141 Katvan (Karahitaylar), Anadolu Selçuklu''yu yıkan ise 1243 Kösedağ''dır."
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
  'tarih.ilk_turk_islam_devletleri.04',
  'Tarih',
  'İlk Türk-İslam Devletleri',
  4,
  'Bölüm 4: Anadolu''nun Türkleşmesi: I. Beylikler ve Türkiye Selçuklu',
  'Malazgirt Zaferi sonrası "kılıç hakkı" gereği Doğu ve Orta Anadolu''da kurulan ilk Türk beylikleri, Anadolu''yu cami, medrese, köprü ve darüşşifalarla bayındır hale getirip Haçlılara ve Bizans''a karşı savundular.  Anadolu''nun coğrafi yapısı ve Bizans''tan kalan boşluk, bu beyliklerin hem sınır muhafızı hem de imar gücü olarak hızla kök salmasına imkan tanıdı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Malazgirt Zaferi sonrası \"kılıç hakkı\" gereği Doğu ve Orta Anadolu''da kurulan ilk Türk beylikleri, Anadolu''yu cami, medrese, köprü ve darüşşifalarla bayındır hale getirip Haçlılara ve Bizans''a karşı savundular. Anadolu''nun coğrafi yapısı ve Bizans''tan kalan boşluk, bu beyliklerin hem sınır muhafızı hem de imar gücü olarak hızla kök salmasına imkan tanıdı. Bu beyliklerin kurulduğu yerler, kurucuları ve en ünlü mimari-bilimsel eserleri KPSS''nin her yıl yokladığı değişmez konularındandır."
  },
  {
    "type": "heading",
    "text": "I. Dönem Anadolu Beylikleri"
  },
  {
    "type": "table",
    "headers": [
      "Beylik",
      "Merkez / Bölge",
      "Ayırt Edici İlk veya Eser"
    ],
    "rows": [
      [
        "Saltuklular",
        "Erzurum",
        "Anadolu''da kurulan **ilk** beylik (Mama Hatun Külliyesi, Kale Camii)"
      ],
      [
        "Danişmentliler",
        "Sivas - Tokat - Niksar",
        "En güçlü beylik; **Yağıbasan Medresesi** (Anadolu''daki ilk medrese)"
      ],
      [
        "Mengücekliler",
        "Erzincan - Divriği",
        "**Divriği Ulu Camii ve Darüşşifası** (UNESCO mirası, Sivas sınırlarında)"
      ],
      [
        "Artuklular",
        "Mardin - Diyarbakır - Hasankeyf",
        "**Malabadi Köprüsü**; sibernetiğin kurucusu **El-Cezeri** bu dönemde yaşadı"
      ],
      [
        "Çaka Beyliği",
        "İzmir",
        "**1081** ilk Türk donanması; **Çaka Bey** ilk Türk amirali"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sınavda iki yer ve eseri özellikle birbirine karıştırılır: **Mengücekliler** Erzincan merkezli kurulsa da başyapıtları olan **Divriği Ulu Camii ve Darüşşifası** (Ahmet Şah ve eşi Turan Melek tarafından yaptırıldı) günümüzde **Sivas** il sınırları içindedir. Ayrıca Anadolu''daki **ilk medrese** Tokat Niksar''daki **Yağıbasan (Çukur) Medresesi**dir; Kırşehir''deki Caca Bey Medresesi ise Selçuklular dönemine ait bir rasathanedir."
  },
  {
    "type": "heading",
    "text": "Türkiye (Anadolu) Selçuklu Devleti (1077-1308)"
  },
  {
    "type": "paragraph",
    "text": "**Kutalmışoğlu Süleyman Şah** tarafından **İznik** merkezli kurulan devlet, I. Haçlı Seferi sırasında İznik elden çıkınca **I. Kılıç Arslan** tarafından **Konya** merkezli olarak yeniden yapılandırıldı. Başkentin iç bölgelere taşınması, Anadolu''nun batıdan gelen Haçlı dalgalarına karşı savunulmasını kolaylaştırdı. **II. Kılıç Arslan** döneminde Bizans ile yapılan **1176 Miryokefalon Savaşı** ise Anadolu tarihinin dönüm noktasıdır. Bu zaferle Bizans''ın Türkleri Anadolu''dan atma umudu kesin olarak bitti, Anadolu''nun Türk yurdu olduğu tescillendi ve Batılı kaynaklar Anadolu''ya **Türkiye** demeye başladı."
  },
  {
    "type": "callout",
    "kind": "info",
    "text": "ÖSYM savaşların Anadolu üzerindeki işlevini şu dört aşamayla test eder: - **1048 Pasinler:** Keşif savaşı (Bizans ile ilk büyük savaş). - **1071 Malazgirt:** Yurt açan savaş (kapılar açıldı). - **1176 Miryokefalon:** Yurt tutan savaş (Anadolu''nun tapusu alındı). - **1922 Büyük Taarruz:** Yurt kurtaran savaş."
  },
  {
    "type": "paragraph",
    "text": "Miryokefalon sonrasında sağlanan siyasi istikrar, Türkiye Selçuklularının yönünü ticarete ve denizlere çevirmesini sağladı. **I. Gıyaseddin Keyhüsrev** döneminde Antalya fethedilerek Akdeniz ticareti açıldı, yabancı tüccarlarla ticaret antlaşmaları yapıldı ve Kayseri''de ilk tıp medresesi olan **Gevher Nesibe Darüşşifası** inşa edildi. **I. Alaeddin Keykubat** ise Alanya''yı (Alaiye) alıp Suğdak seferiyle Karadeniz ötesine ulaştı, Sinop ve Antalya tersanelerini güçlendirdi ve Anadolu''yu kervansaraylarla ördü. Ancak Alaeddin Keykubat''ın **1230 Yassıçemen Savaşı**nda Harzemşahları yenmesi, askeri bir zafer olsa da **Moğol İlhanlılar ile arasındaki tampon bölgeyi ortadan kaldırdığı** için stratejik bir felakete dönüştü."
  },
  {
    "type": "paragraph",
    "text": "Devletin toplumsal dengesi **1240 Baba İshak (Babailer) İsyanı** ile sarsıldı; doğudan gelen Türkmen göçlerinin yarattığı toprak ve geçim sıkıntısı üzerine çıkan bu ayaklanma Türk ve Anadolu tarihindeki **ilk dini ve sosyal içerikli isyandır** (Osmanlı''daki ilk dini-sosyal isyan olan Şeyh Bedreddin ile karıştırılmamalıdır). Selçuklu''nun bu isyanı bastırmakta zorlandığını ve askeri gücünün yıprandığını gören Moğollar saldırıya geçti; **1243 Kösedağ Savaşı** ile Türkiye Selçuklu Moğol egemenliğine girdi ve Anadolu''da siyasi birlik dağıldı."
  },
  {
    "type": "paragraph",
    "text": "Kösedağ sonrası kurulan **II. Dönem Beylikleri** arasında şunlar öne çıkar:"
  },
  {
    "type": "bullets",
    "items": [
      "**Karamanoğulları:** Kendilerini Selçuklu''nun varisi gördüler; **Karamanoğlu Mehmet Bey 13 Mayıs 1277** fermanıyla Farsça yerine **Türkçeyi** resmi devlet dili ilan etti (13 Mayıs Türk Dil Bayramı).",
      "**Karesioğulları:** Çanakkale-Balıkesir bölgesinde kuruldular; Osmanlı''ya katılan ilk beyliktir.",
      "**Aydınoğulları ve Menteşeoğulları:** Denizcilikte ilerlediler ve Türk tarihinde **ilk kez Venedik ve Ceneviz''e ticari imtiyaz (kapitülasyon)** verdiler (ilk kapitülasyonların Fatih veya Kanuni döneminde verildiği yanılgısına düşme!)."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Anadolu''nun ilk denizci beyi kimdir?\" Seçeneklerde Osmanlı''nın ilk kaptan-ı deryası **Karamürsel Alp** çeldirici olarak bulunur; oysa ilk Türk amirali ve donanma kurucusu **Çaka Bey**dir (1081)."
  },
  {
    "type": "key_points",
    "items": [
      "Anadolu''da kurulan ilk beylik Saltuklular, en güçlüsü Danişmentliler, ilk denizci beylik Çaka Beyliğidir (1081).",
      "Miryokefalon (1176) Anadolu''nun tapusunu alan \"yurt tutan\" savaştır.",
      "1230 Yassıçemen zaferi Harzemşah tamponunu yok ettiği için Moğol tehlikesini doğrudan sınıra getirdi.",
      "Karamanoğlu Mehmet Bey 13 Mayıs 1277''de Türkçeyi resmi dil yaptı; Baba İshak (1240) Anadolu Selçuklu''daki ilk dini-sosyal isyandır."
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
  'tarih.ilk_turk_islam_devletleri.05',
  'Tarih',
  'İlk Türk-İslam Devletleri',
  5,
  'Bölüm 5: Devlet Yönetimi, Ordu, Toprak ve Sosyal Hayat',
  'Türk-İslam devletleri eski Türk töresi ile İslam hukuk ve teşkilat geleneğini harmanlamıştır.  Bozkır devlet geleneğindeki kut anlayışı ve boylar birliği yapısı, yerleşik İslam medeniyetinin gelişmiş bürokratik kurumlarıyla birleşerek daha kalıcı bir devlet mekanizması ortaya çıkardı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türk-İslam devletleri eski Türk töresi ile İslam hukuk ve teşkilat geleneğini harmanlamıştır. Bozkır devlet geleneğindeki kut anlayışı ve boylar birliği yapısı, yerleşik İslam medeniyetinin gelişmiş bürokratik kurumlarıyla birleşerek daha kalıcı bir devlet mekanizması ortaya çıkardı. Sınavlarda bir uygulamanın **İslamiyet öncesinden** mi geldiği, yoksa **İslamiyet ile** mi girdiği sıkça sorulur. **Otağ** (hükümdar çadırı), **kotuz** (at veya yaban sığırı kuyruğu sorgucu), kurultay geleneği ve kut anlayışı İslam öncesinden devam ederken; **hutbe okutmak, tıraz** (halifenin gönderdiği unvanlı giysi), **hilat** ve **menşur** (onay belgesi) İslamiyet''in kabulüyle eklenen hakimiyet sembolleridir."
  },
  {
    "type": "heading",
    "text": "Saray, Divanlar ve Taşra Eğitimi"
  },
  {
    "type": "paragraph",
    "text": "Saray görevlileri arasında hükümdarın özel yardımcısı, halkla ve devlet adamlarıyla iletişimi ile saray protokolünü yöneten görevli **Hacip**tir (en kıdemlisine **Hacibü''l-Hüccab** veya **Ulu Hacip** denir; Kutadgu Bilig''de iyi bir hacibin nitelikleri genişçe anlatılır). **Candar** sarayın güvenliğinden ve hükümdarın korunmasından, **Çaşnigir** ise hükümdarın yemeklerini tatmaktan sorumludur."
  },
  {
    "type": "paragraph",
    "text": "Hükümdar çocuklarına **Melik**, onları eyaletlerde devlet yönetimine hazırlayan tecrübeli eğitmenlere ise **Atabey** adı verilir (İslam öncesinde **İnal / Ataman**, Osmanlı''da **Lala**). Devlet işlerinin görüşüldüğü **Divan-ı Saltanat**a bağlı uzmanlık divanları ise görev alanlarıyla birbirinden ayrılır:"
  },
  {
    "type": "table",
    "headers": [
      "Divan / Görevli",
      "Temel Görev Alanı",
      "Kritik Sınav Notu"
    ],
    "rows": [
      [
        "Divan-ı Mezalim",
        "Ağır siyasi suçlar ve halkın şikayetleri",
        "Başkanı **bizzat Sultan**dır; yüksek temyiz mahkemesidir"
      ],
      [
        "Divan-ı İşraf",
        "Mali ve idari işlerin teftişi",
        "Yargı organı değil, **denetim** kurumudur"
      ],
      [
        "Divan-ı Pervane",
        "İkta topraklarının dağıtımı ve kayıtları",
        "**Yalnızca Anadolu Selçuklu**da görülür (Büyük Selçuklu''da yok!)"
      ],
      [
        "Kadıü''l-Kudat",
        "Şer''i hukukun en üst yöneticisi",
        "Kaynağı Kur''an ve hadistir"
      ],
      [
        "Emir-i Dad",
        "Örfi hukukun başı (Adalet Bakanı)",
        "Kaynağı töre ve sultan emridir; veziri bile yargılayabilir"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM adayların **Divan-ı Mezalim** ile **Divan-ı İşraf**ı ve **Muhtesip** görevini birbirine karıştırmasını hedefler. **Muhtesip**, çarşı ve pazarlarda esnafı, fiyatları ve tartıları denetleyen belediye/zabıta görevlisidir. **Divan-ı Mezalim** ise zabıta değil, bizzat sultanın başkanlık ettiği en üst düzey yargı organıdır; Kadıü''l-Kudat değil Sultan başkanlık eder."
  },
  {
    "type": "heading",
    "text": "Ordu, İkta Sistemi ve Ticaret"
  },
  {
    "type": "paragraph",
    "text": "Selçuklu ordusunun temelini **Hassa Ordusu** (bizzat sultana bağlı, ikta gelirleriyle geçinen vurucu güç) ile **Gulaman-ı Saray** (esir veya devşirme kökenli, sarayı koruyan ve 3 ayda bir **bistegani** adlı maaş alan askerler) oluştururdu. Sınır boylarında akın yapan Türkmen kuvvetleri ve bağlı beylik askerlerinin yanında ordunun en kalabalık kesimi ise **İkta Sistemi** sayesinde beslenen eyalet askerleriydi."
  },
  {
    "type": "paragraph",
    "text": "**İkta Sistemi**nde (Osmanlı''daki Tımar''ın atası) toprağın mülkiyeti daima **devlete (miri arazi)** aittir. İkta sahibi bu toprağı satamaz, devredemez ve miras bırakamaz; yalnızca vergisini toplar ve karşılığında **cebelü** denilen atlı asker yetiştirir. Bu yapı hazineden nakit çıkmadan güçlü bir ordu kurulmasını sağlar, taşrada asayişi ve üretimin sürekliliğini korur, köylünün toprağı terk etmesini önler ve **feodalitenin (derebeyliğin) ortaya çıkmasını engeller**. İkta düzeninin bozulduğu dönemlerde ise merkezi otorite sarsılmış ve taşrada yerel beyler güç kazanmıştır."
  },
  {
    "type": "paragraph",
    "text": "Ticarette ise Selçuklular son derece teşvik edici ve liberal davranmıştır. Anadolu''yu doğu-batı ve kuzey-güney ticaretinin kavşağına dönüştürmek için yollar üzerine kervansaraylar kurdular, gümrük vergilerini düşük tuttular ve yabancı tüccarların haydutlarca yağmalanan mallarını devlet hazinesinden ödeyerek tarihteki ilk **devlet sigortacılığını** uyguladılar. Ayrıca Kayseri yakınlarındaki **Yabanlu Pazarı** gibi uluslararası panayırları koruyarak ticareti canlandırdılar. Esnaf teşkilatı olan **Ahilik** (**Ahi Evran**) mesleki ahlakı, kalite denetimini ve çırak-kalfa-usta dayanışmasını sağlarken, Ahi Evran''ın eşi **Fatma Bacı** tarafından kurulan **Bacıyan-ı Rum (Anadolu Bacıları)** da dünyanın ilk örgütlü kadın teşkilatı olarak toplumsal üretime ve dayanışmaya yön vermiştir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Gaziyan-ı Rum alpler, Abdalan-ı Rum dervişler, Bacıyan-ı Rum ise esnaf kadınlar teşkilatıdır.\" İkta sisteminde ise \"mülkiyet devlette olduğu için feodaliteyi güçlendirir\" yargısı daima yanlıştır; tam tersine merkezi otoriteyi korur."
  },
  {
    "type": "key_points",
    "items": [
      "Hutbe, menşur, tıraz ve hilat İslamiyet sonrası hakimiyet sembolleridir; otağ ve kotuz ise İslam öncesinden gelir.",
      "Divan-ı Mezalim''in başkanı sultandır; Divan-ı Pervane ise yalnızca Anadolu Selçuklu''da bulunur.",
      "İkta sisteminde mülkiyet devlettedir; toprak satılamaz, miras bırakılamaz ve bu sayede feodalite önlenir.",
      "Ahilik esnaf teşkilatı, Bacıyan-ı Rum ilk kadın teşkilatı, Muhtesip ise çarşı-pazar denetçisidir."
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
  'tarih.ilk_turk_islam_devletleri.06',
  'Tarih',
  'İlk Türk-İslam Devletleri',
  6,
  'Bölüm 6: Türk-İslam Bilim, Edebiyat ve Sanat Mirası',
  'Türk-İslam dünyası 9.  ile 13.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türk-İslam dünyası 9. ile 13. yüzyıllar arasında bilim, felsefe, tıp ve mimaride dünya uygarlığına yön veren dehalar yetiştirdi. Bu bilimsel yükselişin arkasında yöneticilerin bilim insanlarını saraylarında himaye etmesi, medrese ağının kurulması ve Antik Yunan ile Hint kaynaklarının Arapçaya çevrilerek yeni deneysel yöntemlerle geliştirilmesi yatar. Sınavda bu bilginler genellikle Batı dillerindeki Latince unvanları, en meşhur eserleri ve kendilerini himaye eden koruyucu hükümdarlarıyla eşleştirilerek sorulur."
  },
  {
    "type": "heading",
    "text": "Öne Çıkan Bilim İnsanları"
  },
  {
    "type": "table",
    "headers": [
      "Bilgin",
      "Batıdaki Adı / Unvanı",
      "Temel Eser ve Katkısı"
    ],
    "rows": [
      [
        "Farabi",
        "Alpharabius / **Muallim-i Sani**",
        "*Medinetü''l-Fazıla*, *Kitabü''l-Musiki*; Aristo''dan sonra İkinci Öğretmen"
      ],
      [
        "İbn Sina",
        "Avicenna / **Şeyhü''r-Reis**",
        "*El-Kanun fi''t-Tıbb* (Avrupa''da asırlarca ders kitabı), *Kitabü''ş-Şifa*"
      ],
      [
        "Biruni",
        "\"Sarayımın en değerli hazinesi\"",
        "Gazneli Mahmut himayesinde; yerçekimi, enlem-boylam, jeodezi"
      ],
      [
        "Harezmi",
        "**Cebir''in kurucusu**",
        "Sıfır (0) rakamı; **algoritma** kavramı kendi adından türemiştir"
      ],
      [
        "El-Cezeri",
        "**Sibernetik ve robotik**",
        "Artuklular döneminde yaşamış Cizreli otomatik kontrol mühendisi"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Tıp alanında ayrıca çiçek ve kızamık hastalıklarını birbirinden ilk kez ayıran **Zekeriya er-Razi** (*El-Havi*) ile küçük kan dolaşımını keşfeden **İbnü''n-Nefs** de seçeneklerde sıkça karşına çıkar. Batı''da **Averroes** adıyla bilinen ve Aristo şerhleriyle Avrupa Rönesansı''nı etkileyen filozof ise **İbn Rüşd**dür. Farabi''nin *Kitabü''l-Musiki* eseriyle müziği notaya döküp kanun çalgısını geliştirmesi ve İbn Sina''nın tıp alanındaki gözlemlerinin yüzyıllarca Avrupa üniversitelerinde okutulması, İslam medeniyetinin Batı''daki bilimsel uyanışa doğrudan zemin hazırladığını gösterir."
  },
  {
    "type": "heading",
    "text": "İlk Türk-İslam Edebiyat Eserleri"
  },
  {
    "type": "paragraph",
    "text": "Karahanlılar döneminde **Hakaniye Türkçesiyle** yazılan dört temel eser, Türk-İslam edebiyatının çekirdeğini oluşturur. Göçebe sözlü kültürün İslamiyet ile birlikte yazılı şehir kültürüne dönüşmesini yansıtan bu eserlerin her biri farklı bir toplumsal ve idari ihtiyaca yanıt verir:"
  },
  {
    "type": "paragraph",
    "text": "1. **Kutadgu Bilig (Yusuf Has Hacib):** \"Mutluluk Veren Bilgi\" anlamına gelir ve Uygur/Hakaniye geleneğinden süzülen ilk Türk-İslam **siyasetname** örneğidir (Uluğ Kara Buğra Han''a sunuldu). 2. **Divan-ı Lügati''t-Türk (Kaşgarlı Mahmut):** Türkçenin Arapça kadar zengin bir dil olduğunu göstermek için yazılmış ilk Türkçe sözlük ve ansiklopedik eserdir (Halife El-Muktedi Billah''a sunuldu; içinde Türk dünyası haritası yer alır). 3. **Atabetü''l-Hakayık (Edip Ahmet Yükneki):** Hakikatlerin Eşiği anlamına gelen dini ve ahlaki öğüt kitabıdır; bilgili olmanın ve cömertliğin önemini işler. 4. **Divan-ı Hikmet (Hoca Ahmet Yesevi):** Türk tasavvuf edebiyatının ilk örneğidir; \"Piri Türkistan\" olarak bilinen Yesevi, İslamiyet''i bozkır Türklerine sevdirmek için sade bir Türkçe ile hikmetler söylemiştir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "**Kutadgu Bilig** ile **Siyasetname**yi birbirine karıştırma: Nizamülmülk''ün Büyük Selçuklu döneminde yazdığı **Siyasetname** **Farsça**dır; Yusuf Has Hacib''in Karahanlı döneminde yazdığı **Kutadgu Bilig** ise **Türkçe**dir. Ayrıca **Şehname**, İranlı şair Firdevsi tarafından Gazneli Mahmut''a **Farsça** olarak sunulmuştur (eserde Alp Er Tunga \"Afrasiyab\" adıyla geçer)."
  },
  {
    "type": "heading",
    "text": "Mimari ve Sosyal Yapı Kavramları"
  },
  {
    "type": "paragraph",
    "text": "Türk-İslam mimarisinde İslam öncesi gelenek ile yeni dini ihtiyaçlar birleşmiştir. Göçebe yaşamın merkezindeki çadır formu Anadolu ve Orta Asya''da kesme taş işçiliğiyle birleşerek özgün bir anıt mezar mimarisi doğurdu. **Kümbet**, Türklerin eski **otağ (çadır)** mimarisini taşa yansıtarak geliştirdikleri konik veya piramidal külahlı anıt mezarlardır (silindirik veya sekizgen gövdelidir; alt katta cenaze odası, üst katta mescit bölümü bulunur). İslam öncesindeki **kurgan** ise toprak yığma mezardır."
  },
  {
    "type": "paragraph",
    "text": "Sosyal yaşamı ve şehir ekonomisini ayakta tutan vakıf eserleri ise birbiriyle bağlantılı bir kent dokusu oluştururdu. Çarşı ve sosyal yapı kavramlarını bu işlevlerine göre ayırt etmelisin:"
  },
  {
    "type": "bullets",
    "items": [
      "**Bedesten:** Değerli kumaş ve mücevherlerin satıldığı kapalı çarşıdır.",
      "**İmaret:** Yoksullara, yolculara ve öğrencilere ücretsiz yemek dağıtan aşevidir.",
      "**Kervansaray (Ribat):** Ticaret yolları üzerinde konaklama, güvenlik ve ibadet ihtiyaçlarını karşılayan yapılardır.",
      "**Külliye:** Merkezinde cami bulunan; medrese, imaret, darüşşifa ve hamam gibi yapıları bir araya getiren yapılar topluluğudur."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Cebir ilminin kurucusu ve sıfır rakamını işlemlerde kullanan bilgin kimdir?\" Seçeneklerde Biruni (Gazneli Mahmut''un hazinesi) ve El-Cezeri (Artuklular, sibernetik) mutlaka yer alır. **Algoritma** kelimesinin kökeni olan **Harezmi**yi bu ikisinden ayırabilmelisin."
  },
  {
    "type": "key_points",
    "items": [
      "Muallim-i Sani Farabi, Avicenna (El-Kanun fi''t-Tıbb) İbn Sina, cebir ve sıfır Harezmi, sibernetik El-Cezeri''dir.",
      "Karahanlı döneminin dört temel eseri (Kutadgu Bilig, Divan-ı Lügati''t-Türk, Atabetü''l-Hakayık, Divan-ı Hikmet) Türkçe yazılmıştır; Siyasetname ve Şehname ise Farsçadır.",
      "Kümbet çadırdan esinlenen taş anıt mezardır; Bedesten kapalı çarşı, İmaret aşevidir."
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
-- 📖 KADRO KONU ANLATIMI — Tarih · Osmanlı Kültür ve Uygarlığı
-- Kaynak: docs/konu_anlatimi/tarih/03_osmanli_kultur_ve_uygarligi.md
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
  'tarih.osmanli_kultur_ve_uygarligi.01',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  1,
  'Bölüm 1: Devlet Anlayışı, Veraset, Şehzade Eğitimi ve Saray',
  'Osmanlı Devleti hem eski Türk töresinden hem de İslam devlet geleneğinden beslenen güçlü bir merkeziyetçi yapı kurdu.  Beylikten imparatorluğa geçiş sürecinde fethedilen geniş toprakların tek merkezden yönetilebilmesi için devlet otoritesi, saray teşkilatı ve veraset kuralları zamanın ihtiyaçlarına göre sürekli yeniden düzenlendi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı Devleti hem eski Türk töresinden hem de İslam devlet geleneğinden beslenen güçlü bir merkeziyetçi yapı kurdu. Beylikten imparatorluğa geçiş sürecinde fethedilen geniş toprakların tek merkezden yönetilebilmesi için devlet otoritesi, saray teşkilatı ve veraset kuralları zamanın ihtiyaçlarına göre sürekli yeniden düzenlendi. Hükümdarlık sembolleri arasında **hutbe okutmak, sikke (para) bastırmak, tuğra, sancak, otağ, nevbet (mehter)** ve **yay** yer alırdı. Buna karşılık **ok** kesinlikle bir hakimiyet sembolü değildir; eski Türk geleneğinde bağlılık bildiren veya davet amacı taşıyan bir işarettir."
  },
  {
    "type": "paragraph",
    "text": "Güncel MEB müfredatı ve dönemin sikkeleri doğrultusunda Osmanlı''da ilk kez **Sultan** unvanını kullanan hükümdar **Orhan Gazi**dir (eski kaynaklarda I. Murat geçtiği için bu güncel ayrıma dikkat etmelisin). Padişahlar tahta çıktıklarında meşruiyetlerini dini ve töresel olarak pekiştirmek için Eyüp Sultan Türbesi''nde **Kılıç Alayı** ile kılıç kuşanır, askerlerin sadakatini sağlamak amacıyla da her taht değişikliğinde bir kez **Cülus Bahşişi** dağıtılırdı (Yıldırım Bayezid döneminde gelenekleşti, Fatih tarafından kanunlaştırıldı). Tahta çıkışta ayrıca **Müsadere** adı verilen uygulamayla haksız kazanç sağlayan veya vefat eden üst düzey yöneticilerin mallarına devletçe el konulabilirdi; bu uygulama özel mülkiyetin ve aristokrasinin padişah gücünü gölgelemesini engellemek içindi (atama ve maaş belgesi olan **Beratname** ile karıştırma)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM soru bankalarının en klasik iki tuzağı buradadır: Birincisi, \"Ok ve Yay\" günlük dilde birlikte anıldığı için **Ok**u hakimiyet sembolüymüş gibi şıklara koyarlar; **Yay hakimiyet sembolüdür, Ok değildir**. İkincisi, **Cülus Bahşişi** yalnızca taht değiştiğinde bir defa verilirken, **Ulufe** yeniçerilere her üç ayda bir ödenen düzenli maaştır."
  },
  {
    "type": "heading",
    "text": "Veraset Sistemindeki Değişimler"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı veraset anlayışı, taht kavgalarını azaltmak ve merkezi otoriteyi güçlendirmek amacıyla dört aşamalı bir dönüşüm geçirdi:"
  },
  {
    "type": "paragraph",
    "text": "1. **Osman ve Orhan Gazi dönemi:** \"Ülke hanedanın ortak malıdır\" anlayışı geçerliydi. 2. **I. Murat dönemi:** \"Ülke padişah ve oğullarınındır\" kuralı getirilerek amca ve kardeş çocuklarının hak iddiası engellendi. 3. **Fatih Sultan Mehmet (Kanunname-i Ali Osman):** \"Ülke yalnızca padişahındır\" ilkesi ve **Kardeş Katli** yasalaştı. 4. **I. Ahmet dönemi:** **Ekber ve Erşed** (en yaşlı ve en olgun hanedan üyesinin tahta çıkması) sistemi getirildi."
  },
  {
    "type": "paragraph",
    "text": "Dikkat et: Ekber ve Erşed sistemi taht kavgalarını artırmamış, aksine tahta kimin geçeceğini hukuken kesinleştirerek **taht kavgalarını bitirmiştir**. Ancak şehzadelerin sancağa gönderilmeden sarayda **Kafes Usulü**yle yetiştirilmesine yol açtığı için devlet tecrübesinden yoksun padişahların tahta çıkmasına neden olmuştur."
  },
  {
    "type": "heading",
    "text": "Şehzade Eğitimi ve Topkapı Sarayı"
  },
  {
    "type": "paragraph",
    "text": "Şehzadeler deneyimli eğitmenler olan **Lala**lar eşliğinde (Selçuklu''daki Atabey''in karşılığı) genellikle Anadolu''daki önemli sancaklara yönetici olarak gönderilirdi. **Amasya, Manisa (Darü''s-Saltana), Trabzon, Kütahya ve Konya** başlıca şehzade sancaklarıdır; **Diyarbakır** ise bir eyalet merkezi olup asla şehzade sancağı olmamıştır. **Anadolu dışındaki tek şehzade sancağı** ise Kırım''daki **Kefe**dir (Yavuz Sultan Selim ve Kanuni burada görev yapmıştır)."
  },
  {
    "type": "paragraph",
    "text": "Devletin yönetim merkezi olan **Topkapı Sarayı** üç ana bölümden oluşurdu:"
  },
  {
    "type": "bullets",
    "items": [
      "**Birun (Dış Saray):** Divan toplantılarının yapıldığı, elçilerin kabul edildiği ve dış hizmetlerin yürütüldüğü alandır.",
      "**Enderun (İç Saray):** Temelleri II. Murat döneminde Edirne''de atılan, Fatih tarafından Topkapı''da kurumsallaştırılan ve **devşirme kökenli** yetenekli çocukların devlet adamı olarak yetiştirildiği yüksekokul ve iç saraydır. Has Oda görevlilerinden **Çuhadar Ağa** padişahın kaftanından, **Silahtar** silahından, **Rikabdar** ise çizme ve üzengisinden sorumluydu.",
      "**Harem:** Padişahın özel aile yaşamının geçtiği ve cariyelere protokol ile sanat eğitimi verilen bölümdür."
    ]
  },
  {
    "type": "paragraph",
    "text": "Sarayın devasa mutfak teşkilatına **Matbah-ı Amire**, saraya bağlı çalışan resmi sanatçı ve zanaatkar loncasına ise **Ehl-i Hıref** denirdi. Buna karşılık **Bab-ı Ali** sarayın bir bölümü değil, 18. yüzyıldan itibaren Sadrazamın resmi makamı ve hükümet konağıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Fatih Sultan Mehmet''in Kardeş Katli yasasını çıkarması ve I. Ahmet''in Ekber ve Erşed sistemini getirmesinin ortak amacı nedir?\" Her iki düzenlemenin de ortak amacı **merkezi otoriteyi korumak ve taht kavgalarını önlemektir**; II. Mahmut döneminde bile padişahın seçimle belirlenmesi gibi bir uygulama asla olmamıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Yay hakimiyet sembolüdür, Ok değildir; ilk Sultan unvanını Orhan Gazi kullanmıştır.",
      "Ekber ve Erşed taht kavgalarını kesin olarak bitirdi, ancak Kafes Usulü yüzünden deneyimsiz padişahlara zemin hazırladı.",
      "Anadolu dışındaki tek şehzade sancağı Kırım''daki Kefe''dir; Diyarbakır şehzade sancağı değildir.",
      "Enderun devşirmelerin yetiştiği iç saray mektebidir; Bab-ı Ali ise sarayın değil sadrazamlığın merkezidir."
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
  'tarih.osmanli_kultur_ve_uygarligi.02',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  2,
  'Bölüm 2: Merkez Yönetimi: Divan-ı Hümayun ve Yönetici Sınıflar',
  'Orhan Gazi döneminde kurulan Divan-ı Hümayun, devletin siyasi, askeri, idari ve hukuki işlerinin görüşüldüğü en yüksek kurumdu; aynı zamanda halkın şikayetlerinin dinlendiği en üst yargı merciiydi.  Kuruluş yıllarında küçük bir danışma meclisi niteliğinde olan divan, devlet büyüdükçe yasama, yürütme ve yüksek yargı işlerinin yürütüldüğü kapsamlı bir kabineye dönüştü.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Orhan Gazi döneminde kurulan **Divan-ı Hümayun**, devletin siyasi, askeri, idari ve hukuki işlerinin görüşüldüğü en yüksek kurumdu; aynı zamanda halkın şikayetlerinin dinlendiği en üst yargı merciiydi. Kuruluş yıllarında küçük bir danışma meclisi niteliğinde olan divan, devlet büyüdükçe yasama, yürütme ve yüksek yargı işlerinin yürütüldüğü kapsamlı bir kabineye dönüştü. Fatih Sultan Mehmet dönemine kadar divana bizzat padişah başkanlık ederken, Fatih''ten itibaren üyelerin padişahın heybetinden çekinmeden fikirlerini özgürce tartışabilmesi için başkanlık **Sadrazam**a bırakıldı."
  },
  {
    "type": "paragraph",
    "text": "Bu değişiklik padişahın yetkilerini devrettiği anlamına gelmez; ancak padişahın görüşmeleri \"Kasr-ı Adl\" penceresinden izlemesi ve son sözü her zaman kendisinin söylemesi nedeniyle divanın bir karar organından çok padişaha sunulan bir **danışma organı** niteliği kazanmasına yol açtı. Divanda alınan tüm siyasi, askeri ve idari kararlar Beylikçi Kalemi tarafından **Mühimme Defterleri**ne kaydedilirdi. Böylece imparatorluğun dört bir yanına gönderilen hükümlerin resmi arşivi oluşturulur ve devlet yönetiminde kurumsal süreklilik sağlanırdı."
  },
  {
    "type": "table",
    "headers": [
      "Defter Türü",
      "Tutulduğu Yer / Görevli",
      "İçeriği"
    ],
    "rows": [
      [
        "Mühimme Defterleri",
        "Divan-ı Hümayun (Beylikçi Kalemi)",
        "Divan''da alınan tüm devlet kararları"
      ],
      [
        "Tahrir Defterleri",
        "Nişancı",
        "Fethedilen toprak, nüfus ve vergi kayıtları"
      ],
      [
        "Şeriyye Sicilleri",
        "Kadı",
        "Yerel mahkeme kararları, noter ve belediye işlemleri"
      ],
      [
        "Tereke (Kassam) Defterleri",
        "Kadı / Kassam",
        "Ölen kişinin mirası, borçları ve eşya dökümü"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "Divan Üyeleri ve Görev Ayrımı"
  },
  {
    "type": "bullets",
    "items": [
      "**Sadrazam (Veziriazam):** Padişahın mutlak vekilidir, mührünü taşır. Padişah sefere çıkmadığında orduyu **Serdar-ı Ekrem** unvanıyla komuta eder; kendisi seferdeyken başkentteki işlere **Sadaret Kaymakamı** vekalet eder.",
      "**Kazasker (Kadıasker):** Rumeli ve Anadolu olmak üzere iki tanedir. Günümüzün Adalet ve Milli Eğitim bakanı gibi çalışır; **kadı ve müderrislerin atamasını yapar**.",
      "**Şeyhülislam:** Divanın sürekli üyesi olmayıp gerektiğinde çağrılır; çıkarılan kanunların ve yapılan işlerin dine uygunluğu hakkında **fetva** verir (padişah fetva veremez, ferman çıkarır; Şeyhülislam da kadı atayamaz!).",
      "**Nişancı (Tevkii):** Ferman ve beratlara padişahın tuğrasını çeker, tımar ve toprak kayıtlarını (**Tahrir Defterleri**) tutar, örfi hukukun başuzmanıdır.",
      "**Reisülküttab:** Başlangıçta Nişancı''ya bağlı bir katipti; ancak 17. yüzyılda özellikle **1699 Karlofça Antlaşması** sonrasında diplomasinin önem kazanmasıyla bürokrasiden ayrılarak **Dışişleri Bakanlığı (Hariciye)** niteliği kazandı.",
      "**Defterdar:** Devletin gelir ve giderlerini yöneten, bütçeyi hazırlayan ve mali disiplini sağlayan maliye bakanıdır (Rumeli ve Anadolu defterdarı olarak ikiye ayrılır).",
      "**Kaptan-ı Derya ve Yeniçeri Ağası:** Vezir rütbesinde olduklarında ve başkentte bulunduklarında kendi alanlarıyla ilgili görüşmeler için divan toplantılarına katılırlardı."
    ]
  },
  {
    "type": "paragraph",
    "text": "Merkez teşkilatında **Bab-ı Ali** (Paşa Kapısı) kavramının zamanla öne çıkması da yönetim tarihinin önemli bir dönüşümüdür. 17. ve 18. yüzyıllardan itibaren Sadrazamın resmi konağı olan Bab-ı Ali, divan toplantılarının seyrekleşmesiyle devlet işlerinin fiilen yürütüldüğü hükümet merkezine dönüşmüştür."
  },
  {
    "type": "heading",
    "text": "Yönetici Sınıflar: Seyfiye, İlmiye ve Kalemiye"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı yönetici sınıfı (Askeri sınıf) vergi vermeyen ve devlet hizmetinde çalışan üç ana koldan oluşurdu; buna karşılık yönetilen kesim olan **Reaya** ise tarım, ticaret ve zanaatla uğraşıp vergi öderdi. Yönetici sınıflar görev alanlarına göre net biçimde ayrılmıştı: kılıç ve yönetim erbabı **Seyfiye** (Sadrazam, Vezirler, Yeniçeri Ağası, Kaptan-ı Derya, Beylerbeyi), bürokrasi ve yazışma erbabı **Kalemiye** (Nişancı, Defterdar, Reisülküttab) ve din-eğitim-hukuk erbabı **İlmiye** (Şeyhülislam, Kazasker, Kadı, Müderris). Bu üçlü yapı, bir sınıfın diğerinin yetki alanına girmesini engelleyerek yönetim içinde doğal bir denge mekanizması oluştururdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin en sevdiği iki tuzak bu sınıflandırmadadır: Birincisi, **Kazasker** isminde \"asker\" kelimesi geçtiği için adaylar onu Seyfiye sanır; oysa Kazasker kesinlikle **İlmiye** sınıfının en yüksek üyelerindendir. İkincisi, devşirmeler Seyfiye ve Kalemiye sınıflarında Sadrazamlığa kadar yükselebilirken **asla İlmiye sınıfına giremezler**; Kazasker, Kadı ve Şeyhülislam olabilmek için mutlaka **doğuştan Müslüman ve medrese mezunu** olmak şarttır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Kadıların atanması, örfi hukuk belgelerine tuğra çekilmesi ve dış yazışmaların yürütülmesi görevleri sırasıyla kimlere aittir?\" Cevap: Kadı ataması **Kazasker**e (Şeyhülislam''a değil), tuğra ve tahrir **Nişancı**ya, 17. yüzyıl sonrası dış ilişkiler ise **Reisülküttab**a aittir."
  },
  {
    "type": "key_points",
    "items": [
      "Divan kararları Mühimme Defterine, toprak-vergi kayıtları Tahrir Defterine, miras kayıtları Tereke Defterine yazılır.",
      "Kazasker isminde asker geçse de İlmiye sınıfındadır; kadı ve müderrisleri Kazasker atar, Şeyhülislam yalnızca fetva verir.",
      "Devşirmeler Sadrazam olabilir ama asla Kazasker, Kadı veya Şeyhülislam olamaz.",
      "Reisülküttab 17. yüzyılda Nişancı''dan ayrılarak Dışişleri makamına dönüşmüştür."
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
  'tarih.osmanli_kultur_ve_uygarligi.03',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  3,
  'Bölüm 3: Taşra Yönetimi, Eyalet Türleri ve Hukuk Sistemi',
  'Klasik dönemde Osmanlı taşra teşkilatı yukarıdan aşağıya Eyalet (Beylerbeyi) -> Sancak (Sancakbeyi) -> Kaza (Kadı) -> Köy (Köy Kethüdası) biçiminde örgütlenmişti.  Geniş imparatorluk coğrafyasında merkezi otoriteyi korumak için idare, güvenlik ve yargı yetkileri birbirini denetleyecek şekilde dağıtılmıştı; beylerbeyi ve sancakbeyi asker toplar ve asayişi sağlar, ancak kadının hukuki kararı olmadan kimseye ceza veremezdi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Klasik dönemde Osmanlı taşra teşkilatı yukarıdan aşağıya **Eyalet (Beylerbeyi) -> Sancak (Sancakbeyi) -> Kaza (Kadı) -> Köy (Köy Kethüdası)** biçiminde örgütlenmişti. Geniş imparatorluk coğrafyasında merkezi otoriteyi korumak için idare, güvenlik ve yargı yetkileri birbirini denetleyecek şekilde dağıtılmıştı; beylerbeyi ve sancakbeyi asker toplar ve asayişi sağlar, ancak kadının hukuki kararı olmadan kimseye ceza veremezdi. Dikkat et: Kazaların hem mülki (idari) amiri hem belediye başkanı hem de mahkeme hakimi bizzat **Kadı**dır; **Subaşı** kazanın sadece güvenliğinden sorumludur."
  },
  {
    "type": "paragraph",
    "text": "Başkent İstanbul ise imparatorluğun vitrini ve güvenlik merkezi olduğu için özel bir yönetime sahipti: Genel düzeni Sadrazam sağlarken, İstanbul''un en yüksek mülki ve adli amiri **Taht Kadısı (İstanbul Kadısı)**, belediye işlerinin sorumlusu ise **Şehremini** idi. Güvenlik işlerini yeniçeri ağası yürütürdü. Tanzimat döneminde 1854''te modern belediyenin temeli olan **Şehremaneti** kuruldu; **1864 Vilayet Nizamnamesi** ile de eyalet sistemi kaldırılarak **Vilayet (Vali) -> Liva/Sancak (Mutasarrıf) -> Kaza (Kaymakam) -> Nahiye (Müdür) -> Köy (Muhtar)** düzenine geçildi (ilk pilot bölge **Mithat Paşa** yönetimindeki **Tuna Vilayeti** oldu; burada açılan yollar, okullar ve emniyet sandıkları tüm ülkeye örnek teşkil etti)."
  },
  {
    "type": "heading",
    "text": "Eyaletlerin Üçlü Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı eyaletlerini merkeze uzaklıkları, fetih şartları ve vergi toplama biçimlerine göre üç gruba ayırmak sınav sorularını kolayca çözmeni sağlar:"
  },
  {
    "type": "table",
    "headers": [
      "Eyalet Türü",
      "Temel Özelliği",
      "Örnekler"
    ],
    "rows": [
      [
        "Salyanesiz (Yıllıksız)",
        "Merkeze yakındır; **Tımar sistemi** uygulanır",
        "Rumeli, Anadolu, Karaman, Sivas, Diyarbakır"
      ],
      [
        "Salyaneli (Yıllıklı)",
        "Merkeze uzaktır; vergiler **İltizam** ile nakit toplanır",
        "Mısır, Bağdat, Yemen, Trablusgarp, Tunus, Cezayir"
      ],
      [
        "İmtiyazlı (Özel Yönetimli)",
        "İç işlerinde serbesttir; hükümdarı yerel beydir",
        "Kırım, Hicaz, Eflak, Boğdan, Erdel"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**İltizam sistemi**, merkeze uzak salyaneli eyaletlerdeki (ve doğrudan hazineye giden **Mukataa** arazilerindeki) vergi toplama hakkının açık artırmayla **Mültezim**lere peşin para karşılığı kiralanmasıdır. Bu yöntem başlangıçta devletin nakit ihtiyacını hızla karşılamak ve uzak eyaletlerden düzenli gelir akışı sağlamak için pratik bir çözüm sundu. İhalede devlete ödenen peşinata **Muaccele**, 17. yüzyıl sonunda getirilen ömür boyu iltizam uygulamasına ise **Malikane Sistemi** denir. Ancak mültezimlerin köylüden fazla vergi toplamaya yönelmesi, zamanla taşrada ayanların güçlenmesine ve merkezi otoritenin zayıflamasına zemin hazırladı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İmtiyazlı eyaletlerin yükümlülükleri sıkça birbirine karıştırılır: **Hicaz (Mekke-Medine)** kutsal topraklar olduğu için Osmanlı''ya **ne vergi ne de asker** verirdi; tersine her yıl hac mevsiminde **Surre Alayları** ile yardım gönderilirdi. **Kırım Hanlığı** (Cengiz soyundan gelen **Giraylar**) vergi vermez ama savaşa **asker gönderirdi**. **Eflak ve Boğdan** ise vergi verir ama asker vermezdi."
  },
  {
    "type": "heading",
    "text": "Hukuk Sistemi ve Toplumsal Yapı"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı toplumu etnik köken esasına göre değil, din ve mezhep esasına dayanan **Millet Sistemi** ile yönetildi; bu sistem milliyetçilik anlamına gelmez, inanç topluluklarının kendi iç hukuklarında, eğitimlerinde ve ibadetlerinde özerkliğini ifade eder. Hukuk ise **Şer''i Hukuk** (İslam hukuku) ve **Örfi Hukuk** (töre ve padişah kanunnameleri) olarak ikiye ayrılır; ancak örfi kurallar şer''i hukuka aykırı olamazdı. Fatih ve Kanuni dönemlerinde çıkarılan kanunnamelerle vergi, ceza ve idare kuralları yazılı hale getirilerek taşrada uygulama birliği sağlandı."
  },
  {
    "type": "paragraph",
    "text": "Mahkeme ve görevli ayrımında şu kavramları net tut:"
  },
  {
    "type": "bullets",
    "items": [
      "**Kassam:** Kadıya bağlı olarak şer''i hukuka göre miras paylaşımı yapan ve **Tereke Defterleri**ni tutan görevlidir.",
      "**Nakibüleşraf:** Peygamber soyundan gelen seyyid ve şeriflerin kaydını tutan ve Eyüp Sultan''daki kılıç alaylarında padişaha kılıç kuşatan görevlidir.",
      "**Konsolosluk Mahkemeleri:** Kapitülasyonlarla (1535 Fransa) yabancıların kendi aralarındaki davalar için açıldı.",
      "**Nizamiye Mahkemeleri:** Tanzimat döneminde (**1868**) ceza ve ticaret davalarına bakmak üzere Fransız usulüyle kurulan karma/seküler mahkemelerdir."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Mısır, Trablusgarp ve Yemen hangi eyalet grubuna girer ve vergileri nasıl toplanır?\" Cevap: Merkeze uzak oldukları için **Salyaneli (yıllıklı)** eyaletlerdir; tımar uygulanmaz, vergileri **İltizam** yöntemiyle peşin toplanır."
  },
  {
    "type": "key_points",
    "items": [
      "Klasik kazaları hem idari hem adli yönden Kadı yönetir; Subaşı sadece güvenliğe bakar.",
      "Salyanesiz eyaletlerde Tımar, Salyaneli eyaletlerde (Mısır vb.) İltizam uygulanır.",
      "Hicaz ne vergi ne asker verir; Kırım asker gönderip vergi vermez; Eflak-Boğdan vergi verip asker vermez.",
      "1864 Vilayet Nizamnamesi ile eyalet sistemi kalktı; Tuna Vilayeti Mithat Paşa ile pilot bölge seçildi."
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
  'tarih.osmanli_kultur_ve_uygarligi.04',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  4,
  'Bölüm 4: Ordu ve Deniz Gücü (Kapıkulu, Tımarlı Sipahiler ve Donanma)',
  'Osmanlı kara ordusu üç ana koldan oluşurdu: merkezde padişaha bağlı maaşlı Kapıkulu Askerleri, taşrada toprak gelirleriyle geçinen Eyalet Askerleri ve bağlı beyliklerden gelen Yardımcı Kuvvetler.  Bu yapı hem sınırları korur hem de merkez ile taşra arasında askeri denge kurardı; öyle ki merkezdeki Kapıkulu birlikleri eyalet beylerinin güçlenmesini dengelerken, taşradaki tımarlı sipahiler de yeniçerilerin tek güç haline gelmesini önlerdi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı kara ordusu üç ana koldan oluşurdu: merkezde padişaha bağlı maaşlı **Kapıkulu Askerleri**, taşrada toprak gelirleriyle geçinen **Eyalet Askerleri** ve bağlı beyliklerden gelen **Yardımcı Kuvvetler**. Bu yapı hem sınırları korur hem de merkez ile taşra arasında askeri denge kurardı; öyle ki merkezdeki Kapıkulu birlikleri eyalet beylerinin güçlenmesini dengelerken, taşradaki tımarlı sipahiler de yeniçerilerin tek güç haline gelmesini önlerdi."
  },
  {
    "type": "heading",
    "text": "Kapıkulu Ocakları ve Altı Bölük Halkı"
  },
  {
    "type": "paragraph",
    "text": "Kapıkulu ocaklarının insan kaynağı başlangıçta I. Murat döneminde savaş esirlerinin beşte birinin alındığı **Pençik Sistemi**, ardından Balkanlar''daki Hristiyan ailelerden çocukların devşirildiği **Devşirme Sistemi**ydi. Devşirilen çocuklar Anadolu''daki Türk ailelerin yanına verilip Türk-İslam kültürünü, dilini ve geleneklerini öğrendikten sonra **Acemi Ocağı**na alınırdı. Buradan yeniçeri veya süvari birliklerine geçişe **Kapıya Çıkma (Bedergah)** denirdi. Bu birlikler barış zamanında başkentte nöbet tutar, yangın söndürür ve asayişi sağlar; savaşta ise doğrudan padişahın çevresinde merkez kanadı oluştururdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, askeri bir terim olan **Kapıya Çıkma (Bedergah)** ile medrese öğrencilerinin üç aylarda köylere ve kasabalara gidip dini eğitim vererek harçlık toplaması olan **Cerre Çıkma**yı aynı seçeneklerde yan yana koyarak karıştırmanı bekler. Ayrıca Kapıkulu askerlerinin 3 ayda bir aldıkları maaş **Ulufe**dir; **Cülus** yalnızca taht değişikliğinde dağıtılan bahşiştir."
  },
  {
    "type": "paragraph",
    "text": "Kapıkulu Piyadeleri içinde **Yeniçeriler** (en kalabalık vurucu güç), **Cebeciler** (silah bakım-onarım), **Topçular**, **Top Arabacıları**, **Lağımcılar** (kale kuşatmalarında tünel kazıcılar) ve **Humbaracılar** (havan topu ve el bombası) yer alırdı. Kapıkulu Süvarileri ise **Altı Bölük Halkı** olarak adlandırılırdı ve görevleri görev dağılımına göre şifrelenmiştir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Sipah ve Silahtar:** Savaşta bizzat padişahın **çadırını** korurlar.",
      "**Sağ ve Sol Ulufeciler:** Saltanat **sancaklarını** korurlar.",
      "**Sağ ve Sol Garipler:** Ordunun **hazinesini** ve ağırlıklarını korurlar."
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Altı Bölük Halkının görevlerini üç kısa eşleştirmeyle aklında tut: - **Garipler** fakirdir: **Hazineyi** ve ağırlıkları bekler. - **Ulufeciler** ön saftadır: **Saltanat sancağını** korur. - **Sipah ve Silahtar** padişaha en yakındır: **Otağı (çadırı)** korur."
  },
  {
    "type": "heading",
    "text": "Eyalet Askerleri ve Donanma"
  },
  {
    "type": "paragraph",
    "text": "Ordunun sayıca en büyük kesimini oluşturan **Tımarlı Sipahiler**, hazineden maaş almadan dirlik gelirleriyle geçinir ve besledikleri **Cebelü** adlı atlı askerlerle savaşa katılırlardı. Barış dönemlerinde köylerin asayişini ve üretimin sürekliliğini koruyan bu birlikler, sefer çağrısı geldiğinde sancakbeyinin sancağı altında toplanarak merkeze büyük bir lojistik ve mali yük bindirmeden orduya katılırlardı. Eyalet askerleri arasında ayrıca bekar Türk erkeklerinden toplanıp ordunun ön safında savaşan hafif piyadeler olan **Azaplar**, sınır boylarında akın yapan **Akıncılar** ve korkusuzca düşman üzerine atılan şok süvarileri olan **Deliler** bulunurdu. 17. yüzyılda Tımar sisteminin bozulmasıyla devletin geçici olarak topladığı tüfekli ücretli askerlere ise **Sekban ve Saruca** adı verildi; ancak bu birlikler işsiz kalınca **Celali İsyanları**na katıldılar."
  },
  {
    "type": "paragraph",
    "text": "Osmanlı donanması Karesioğulları''nın katılmasıyla güçlendi; ilk tersane Karamürsel''de açıldı ve ilk **Kaptan-ı Derya** **Karamürsel Alp** oldu. Yıldırım Bayezid döneminde Gelibolu''da kurulan büyük tersane ile donanma Akdeniz ve Karadeniz''e açılma kapasitesi kazandı; Fatih döneminde ise Karadeniz bir Türk gölüne dönüştü. Yükselme döneminde **Barbaros Hayrettin Paşa** komutasındaki **1538 Preveze Deniz Zaferi** ve **1560 Cerbe Deniz Savaşı** Akdeniz''i bir Türk gölüne çevirdi; donanma komutanlarına genel olarak **Levent** denilen deniz erleri eşlik ederdi. Deniz gücünün zayıfladığı dönemlerde ise tersi yönde ağır darbeler alındı: **1571 İnebahtı, 1770 Çeşme, 1827 Navarin ve 1853 Sinop** olayları Osmanlı donanmasının yakıldığı felaketlerdir; Preveze ve Cerbe ile karıştırılmamalıdır. Bu donanma kayıplarının ardından 18. ve 19. yüzyıllarda deniz mühendisliği okulları ve modern tersane ıslahatları zorunlu hale geldi."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Tımarlı sipahilerin beslediği atlı askere ne ad verilir, tımar bozulunca toplanan ücretli askerler kimlerdir?\" Sistem sağlıklıyken yetiştirilen atlı asker **Cebelü**dür; sistem bozulunca toplanan ücretli tüfekliler ise **Sekban ve Saruca**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Acemi Ocağı''ndan yeniçeriliğe geçiş Kapıya Çıkma (Bedergah), medreselilerin tatil görevi ise Cerre Çıkma''dır.",
      "Altı Bölük Halkında Sipah-Silahtar çadırı, Ulufeciler sancağı, Garipler ise hazineyi korur.",
      "Azaplar bekar piyadelerdir; Deliler korkusuz süvarilerdir; Sekban ve Sarucalar ise tımar bozulunca alınan ücretli askerlerdir.",
      "Preveze (1538) ve Cerbe (1560) büyük deniz zaferleridir; İnebahtı, Çeşme, Navarin ve Sinop ise donanma baskınlarıdır."
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
  'tarih.osmanli_kultur_ve_uygarligi.05',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  5,
  'Bölüm 5: Toprak Sistemi, Vergiler ve Ekonomi',
  'Osmanlı toprak düzeninde tarım arazilerinin büyük çoğunluğu devlete ait olan Mîrî Araziydi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı toprak düzeninde tarım arazilerinin büyük çoğunluğu devlete ait olan **Mîrî Arazi**ydi. Özel mülkiyete konu olan **Mülk Arazi** (öşri ve haraci) ile gelirleri hayır kurumlarına bırakılan **Vakıf Arazi** dışında kalan mîrî topraklar, kullanım amacına göre farklı isimler alırdı:"
  },
  {
    "type": "table",
    "headers": [
      "Mîrî Arazi Türü",
      "Gelirin Aktarıldığı Yer",
      "Temel İşlevi"
    ],
    "rows": [
      [
        "Dirlik",
        "Devlet memuru ve askerlere maaş karşılığı",
        "**Has** (>100 bin akçe), **Zeamet** (20-100 bin), **Tımar** (<20 bin)"
      ],
      [
        "Mukataa",
        "Doğrudan **merkezi hazineye** (Hazine-i Amire)",
        "İltizam sistemiyle nakit gelir toplanır"
      ],
      [
        "Paşmaklık",
        "Padişahın annesi, eşleri ve kızlarına",
        "Saray kadınlarının şahsi masraflarını karşılar"
      ],
      [
        "Ocaklık",
        "Kale muhafızları ve tersane giderlerine",
        "Stratejik savunma ve donanma finansmanı"
      ],
      [
        "Yurtluk",
        "Sınır boylarını koruyan akıncı ve beylere",
        "Sınır güvenliğini sağlamak"
      ],
      [
        "Malikane",
        "Devlete üstün hizmet gösterenlere",
        "Başarı karşılığı mülk olarak tahsis edilir"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Dirlik (özellikle Tımar) sisteminde toprak asla sipahinin özel mülkü olmaz; mülkiyet devlette kalır, sipahi yalnızca vergiyi toplar. Sipahinin görevi yalnızca vergi tahsil etmek değil, aynı zamanda köyde güvenliği sağlamak, tarımsal üretimin sürekliliğini denetlemek ve savaş zamanı beslediği cebelülerle orduya katılmaktır. Bu nedenle Osmanlı''da Avrupa''daki gibi toprağa dayalı soylu bir derebeylik (**feodalite**) gelişmemiş, taşrada merkezi otorite uzun süre korunmuştur. Tımar sisteminin 17. yüzyıldan itibaren bozulup yerini iltizama bırakması ise hem tarımsal üretimi hem de eyalet ordusunu zayıflatarak duraklamanın en önemli iç nedenlerinden birini oluşturdu."
  },
  {
    "type": "heading",
    "text": "Vergiler: Şer''i ve Örfi Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı vergileri dini temelli **Şer''i Vergiler** ve devletin ihtiyacına göre konulan **Örfi Vergiler** olarak ikiye ayrılır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Öşür (Aşar):** Müslüman çiftçiden alınan 1/10 oranındaki ürün vergisidir.",
      "**Haraç:** Gayrimüslim çiftçiden alınan ürün vergisidir (1/5 ile 1/2 arası).",
      "**Cizye:** Askere gitmeyen sağlıklı gayrimüslim erkeklerden alınan baş vergisidir (kadın, çocuk, yaşlı ve din adamları muaf).",
      "**Çiftbozan:** Toprağını mazeretsiz üst üste üç yıl ekmeyen veya terk eden köylüden alınan üretim güvenliği cezasıdır (normal arazi vergisi olan **Çifthane** ile karıştırma).",
      "**Avarız:** Savaş, deprem veya kıtlık gibi olağanüstü durumlarda toplanan vergidir (zamanla sürekli hale gelmiştir)."
    ]
  },
  {
    "type": "heading",
    "text": "Ekonomi İlkeleri, Ticaret ve Para Tarihi"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı iktisat politikası üç temel ilkeye dayanır: piyasada malın bol, kaliteli ve ucuz olmasını hedefleyen **İaşecilik (Provizyonizm)**, hazine gelirlerini daima artırmayı ve gideri kısmayı amaçlayan **Fiskalizm** ve mevcut ekonomik dengeyi korumayı esas alan **Gelenekçilik**."
  },
  {
    "type": "paragraph",
    "text": "Esnaf örgütlenmesinde ise ilk dönemdeki **Ahilik** (yalnızca Müslümanlar üye olabilir ve gaza anlayışı vardır) zamanla yerini gayrimüslimlerin de üye olabildiği ve cihat amacı taşımayan **Lonca Teşkilatı**na bıraktı. Çarşı-pazarı ve fiyatları (**Narh**) **Muhtesip** denetlerken; tek cins malların (un, yağ, bal) toptan tartılıp dağıtıldığı hallere **Kapan Hanı** (yöneticisi **Kapan Emini**), kıymetli kumaş ve mücevherlerin satıldığı kapalı çarşıya **Bedesten**, aynı meslekten esnafların yan yana sıralandığı sokaklara ise **Arasta** denirdi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ulaşım ve güvenlik kavramlarını karıştırma: **Menzil Teşkilatı** posta ve haberleşme atlarının değişim merkezidir; **Derbent Teşkilatı** dağ geçitlerinin ve yolların güvenliğini sağlar; **Mekkari Taifesi** ise ticari yük ve kargo taşımacılığı yapan lojistik loncasıdır. II. Mahmut döneminde İstanbul''a kontrolsüz göçü önlemek için çıkarılan iç pasaport belgesi ise **Mürur Tezkeresi**dir (gemi geçiş belgesi olan **İzn-i Sefine** ile karıştırma)."
  },
  {
    "type": "paragraph",
    "text": "Para kronolojisinde ilk bakır para (**Mangır**) Osman Gazi, ilk gümüş para (**Akçe**) Orhan Gazi, ilk altın para (**Sultani / Sikke-i Hasene**) Fatih Sultan Mehmet, ilk kağıt para (**Kaime**) ise Abdülmecit döneminde basıldı. Bütçe açığını kapatmak için paranın değerli maden oranının düşürülmesine **Tağşiş** (devalüasyon), ayarı bozulmuş akçeye ise **Züyuf Akçe** denirdi. Ayrıca günümüz **Ziraat Bankası**nın temeli, Atatürk döneminde değil Osmanlı döneminde **Mithat Paşa** tarafından Niş valiliği sırasında kurulan **Memleket Sandıkları**dır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Müslümandan alınan ürün vergisi, gayrimüslimden alınan askerlik muafiyet vergisi ve toprağını 3 yıl ekmeyenden alınan ceza vergisi sırasıyla hangileridir?\" Cevap: **Öşür - Cizye - Çiftbozan**dır (Haraç ürün vergisidir, Cizye ise baş vergisidir)."
  },
  {
    "type": "key_points",
    "items": [
      "Dirlik sisteminde mülkiyet devlettedir; Has (>100 bin), Zeamet (20-100 bin), Tımar (<20 bin) şeklinde sıralanır.",
      "Müslüman ürün vergisi Öşür, gayrimüslim ürün vergisi Haraç, gayrimüslim baş vergisi Cizye, terk cezası Çiftbozan''dır.",
      "İaşecilik bol ve ucuz mal, Fiskalizm hazineyi büyütme, Gelenekçilik mevcut düzeni koruma ilkesidir.",
      "İlk bakır Osman, gümüş Orhan, altın Fatih, kağıt para Abdülmecit dönemindedir; Ziraat Bankası temeli Mithat Paşa''nın Memleket Sandıklarıdır."
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
  'tarih.osmanli_kultur_ve_uygarligi.06',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  6,
  'Bölüm 6: Eğitim, Bilim, Sanat ve Mimari',
  'Osmanlı''da örgün eğitimin temeli Medreselere dayanırdı.  Vakıf gelirleriyle finanse edilen medreselerde öğrencilerin barınma, yemek ve eğitim giderleri ücretsiz karşılanır, böylece toplumsal hareketlilik ve fırsat eşitliği sağlanırdı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı''da örgün eğitimin temeli **Medrese**lere dayanırdı. Vakıf gelirleriyle finanse edilen medreselerde öğrencilerin barınma, yemek ve eğitim giderleri ücretsiz karşılanır, böylece toplumsal hareketlilik ve fırsat eşitliği sağlanırdı. İlk Osmanlı medresesi **İznik Orhaniyesi**dir ve buraya atanan ilk müderris **Davud-ı Kayseri**dir (ilk kadı olan **Dursun Fakih** ile karıştırılmamalıdır). Fatih döneminde kurulan **Sahn-ı Seman Medreseleri** dönemin en yüksek bilim yuvası olurken, Kanuni döneminde kurulan **Süleymaniye Medreseleri** özellikle tıp ve fen bilimlerinde ihtisaslaşmayı sağladı. Medreseden mezun olup stajyerlik yapanlara **Muid**, atama sırası bekleyen adaylara ise **Mülazım** (bu sisteme **Mülazemet Sistemi**) denirdi; ancak 17. yüzyıldan itibaren müderris çocuklarına sınavsız unvan verilmesi (**Beşik Ulemalığı**) eğitim kalitesini bozdu."
  },
  {
    "type": "heading",
    "text": "Osmanlı Bilim İnsanları ve Sosyal Kurumlar"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı bilim tarihinde pozitif bilimler, tıp, astronomi ve coğrafya alanlarında önemli eserler üretilmiştir. Bu isimlerin hangi dönemde yaşadığı ve hangi eserle öne çıktığı sınavda doğrudan test edilir:"
  },
  {
    "type": "table",
    "headers": [
      "Bilgin",
      "Dönemi / Alanı",
      "Temel Eser veya Başarı"
    ],
    "rows": [
      [
        "Sabuncuoğlu Şerafeddin",
        "15. yy / Tıp (Amasya)",
        "*Cerrahiyetü''l-Haniyye*: İlk resimli cerrahi eseri yazdı"
      ],
      [
        "Akşemseddin",
        "Fatih dönemi / Tıp",
        "Hastalıkların gözle görülmeyen mikroplarla bulaştığını açıkladı"
      ],
      [
        "Altuncuzade",
        "Fatih dönemi / Tıp",
        "Üroloji ve idrar yolları hastalıkları üzerine çalıştı"
      ],
      [
        "Takiyüddin Mehmet",
        "III. Murat / Astronomi",
        "İstanbul''da **ilk Osmanlı rasathanesini** (gözlemevini) kurdu"
      ],
      [
        "Katip Çelebi",
        "17. yy / Coğrafya-Bibliyografya",
        "*Keşfü''z-Zunûn* ve *Cihannüma*; Batı''da **Hacı Kalfa** olarak bilinir"
      ],
      [
        "Evliya Çelebi",
        "17. yy / Gezi-Kültür",
        "10 ciltlik dev gezi eseri *Seyahatname*"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Sosyal devlet kurumları arasında II. Abdülhamit tarafından kurulan iki yapı özellikle sorulur: kimsesizler, yoksullar ve yaşlılar için açılan **Darülaceze** ile kızı Hatice Sultan''ın anısına 1899''da açtığı ilk modern çocuk hastanesi olan **Hamidiye Etfal Hastanesi**. Vakıf geleneğinin 19. yüzyıl sonundaki bu kurumsal uzantıları, devletin sosyal yardım sorumluluğunu modern sağlık ve bakım kurumlarıyla sürdürdüğünü gösterir."
  },
  {
    "type": "heading",
    "text": "Sanat, Mimari ve Batı Etkisi"
  },
  {
    "type": "paragraph",
    "text": "Klasik Osmanlı mimarisinin zirvesi **Mimar Sinan**dır. Sinan hem mühendislik zekası hem de mekan bütünlüğüyle kubbe mimarisini en üst noktaya taşıdı ve kendi gelişimini **Şehzade Camii** (çıraklık), **Süleymaniye Camii** (kalfalık) ve Edirne''deki **Selimiye Camii** (ustalık) şeklinde üçledi. Buna karşılık İstanbul''daki ünlü **Sultanahmet Camii (Mavi Cami)** Mimar Sinan''ın değil, öğrencisi **Sedefkar Mehmet Ağa**nın eseridir!"
  },
  {
    "type": "paragraph",
    "text": "18. yüzyıldan itibaren Avrupa ile diplomatik ve kültürel temasların artmasıyla Osmanlı mimarisinde Batı (Barok ve Rokoko) etkileri görülmeye başlandı; geleneksel sade cephelerin yerini kıvrımlı hatlar, geniş saçaklar ve süslemeler aldı:"
  },
  {
    "type": "bullets",
    "items": [
      "**III. Ahmet Çeşmesi (1728):** Lale Devri''nde yapılan **ilk sivil** Batı tarzı eserdir.",
      "**Nuruosmaniye Camii (1755):** I. Mahmut döneminde başlanıp III. Osman döneminde tamamlanan **ilk Barok tarzı (dini)** camidir.",
      "**İshak Paşa Sarayı (Ağrı-Doğubeyazıt):** Türk, İran ve Batı tarzlarını birleştiren, içinde cami, kütüphane, harem ve divan odaları barındıran, ayrıca **dünyada ilk merkezi ısıtma sistemine** sahip saraydır."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM sanatçıların alanlarını ve dönemlerini karıştırarak çeldirici kurar: **Amasyalı Şeyh Hamdullah** hat sanatının kurucusu ve **\"Hattatların Kıblesi\"**dir; **Ahmet Karahisari** ise Süleymaniye Camii''nin yazılarını yazan büyük hattattır (padişah değildir!). Resim ve minyatürde **Nakkaş Sinan Bey** İtalya''da resim eğitimi almış ve Fatih''in gül koklayan portresini yapmıştır; **Matrakçı Nasuh** Kanuni döneminde topoğrafik şehir minyatürleri çizmiş, **Levni** ise Lale Devri''nin renk ve hareket ustası baş nakkaşı olmuştur (Lale Devri şairi **Nedim** ile karıştırma). Klasik Türk musikisinin en büyük bestekarı ise **Segah Tekbiri**nin sahibi **Itri**dir; günümüzde 100 TL banknotun üzerinde de Itri''nin portresi yer alır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Mimar Sinan''ın ustalık eseri hangisidir?\" Seçeneklerde mutlaka **Sultanahmet Camii** ve **Süleymaniye Camii** bulunur. Ustalık eseri Edirne''deki **Selimiye Camii**dir; Süleymaniye kalfalık eseri, Sultanahmet Camii ise Sedefkar Mehmet Ağa''nın eseridir."
  },
  {
    "type": "key_points",
    "items": [
      "İlk medrese İznik Orhaniyesi, ilk müderris Davud-ı Kayseri, ilk kadı Dursun Fakih''tir.",
      "Katip Çelebi Keşfü''z-Zunûn ve Cihannüma yazarıdır; Sabuncuoğlu Şerafeddin ise ilk resimli cerrahi kitabını yazmıştır.",
      "Mimar Sinan''ın ustalık eseri Selimiye Camii''dir; Sultanahmet Camii Sedefkar Mehmet Ağa''ya aittir.",
      "İlk sivil Batı yapısı III. Ahmet Çeşmesi, ilk Barok cami Nuruosmaniye, ilk merkezi ısıtmalı saray İshak Paşa Sarayı''dır."
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
-- 📖 KADRO KONU ANLATIMI — Tarih · Osmanlı Dağılma Dönemi
-- Kaynak: docs/konu_anlatimi/tarih/04_osmanli_dagilma_donemi.md
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
  'tarih.osmanli_dagilma_donemi.01',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  1,
  'Bölüm 1: Osmanlı Kuruluş ve Yükselme Dönemi (1299-1595)',
  'Osmanlı Beyliği''nin kuruluş yıllarında uyguladığı iki temel siyaset sınavda sıkça karşılaştırılır: Balkan halklarının gönlünü kazanmaya dayalı hoşgörü politikasına İstimalet, henüz askeri gücün sınırlı olduğu dönemde Bizans tekfurlarıyla görünüşte dostça geçinme taktiğine ise Müdârâ denir.  Söğüt ve Domaniç çevresinde gaza ve cihat anlayışıyla büyüyen beylik, Bizans''ın iç karışıklıklarından yararlanarak batıya doğru ilerledi ve düzenli iskan politikasıyla fethettiği toprakları Türkleştirdi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı Beyliği''nin kuruluş yıllarında uyguladığı iki temel siyaset sınavda sıkça karşılaştırılır: Balkan halklarının gönlünü kazanmaya dayalı hoşgörü politikasına **İstimalet**, henüz askeri gücün sınırlı olduğu dönemde Bizans tekfurlarıyla görünüşte dostça geçinme taktiğine ise **Müdârâ** denir. Söğüt ve Domaniç çevresinde gaza ve cihat anlayışıyla büyüyen beylik, Bizans''ın iç karışıklıklarından yararlanarak batıya doğru ilerledi ve düzenli iskan politikasıyla fethettiği toprakları Türkleştirdi. Osmanlı ile Bizans arasındaki **ilk resmi meydan savaşı** **1302 Koyunhisar (Bafeon) Savaşı**dır (Orhan Gazi dönemindeki 1329 Maltepe/Palekanon Savaşı ile karıştırma)."
  },
  {
    "type": "paragraph",
    "text": "Anadolu Türk Siyasi Birliği''ni (ATSB) kurma süreci üç kilit adımdan oluşur: **ilk adım** Orhan Gazi döneminde **Karesioğulları**nın alınmasıdır, **geniş ölçüde sağlayan** **Yıldırım Bayezid**dir, **kesin olarak tamamlayan** ise Yavuz Sultan Selim döneminde Dulkadiroğulları''nın alındığı **1515 Turnadağ Savaşı**dır. Karesioğulları''nın katılımı yalnızca kara birliğini başlatmakla kalmadı, aynı zamanda Osmanlı''ya ilk donanma gücünü ve Rumeli''ye geçiş tecrübesini kazandırdı. Yıldırım Bayezid ayrıca İstanbul''u dört kez kuşatıp **Anadolu Hisarı**nı yaptırdı ve 1396 Niğbolu Zaferi''ni kazandı; ancak 1402 Ankara Savaşı ile Timur''a yenilince 11 yıllık **Fetret Devri** başladı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ankara Savaşı sonrası yaşanan 11 yıllık Fetret Devri''nde Anadolu beylikleri yeniden bağımsızlığını ilan ettiği halde Balkanlarda büyük bir kopuş ve isyan yaşanmamasının nedeni, Osmanlı''nın uyguladığı **istimalet (hoşgörü)** ve **adil vergi** düzenidir. Fetret''i bitiren **Çelebi Mehmet (I. Mehmet)** devletin ikinci kurucusu sayılır; döneminde Osmanlı''nın **ilk dini-sosyal isyanı** olan **Şeyh Bedrettin İsyanı** çıktı (Anadolu Selçuklu''daki Baba İshak ile karıştırma)."
  },
  {
    "type": "paragraph",
    "text": "II. Murat döneminde Edirne''de çıkan **1446 Buçuktepe İsyanı**, tarihteki **ilk yeniçeri ayaklanması**dır (ulufeye yarım akçe zamla sonuçlandı). Yine II. Murat döneminde Haçlılara karşı kazanılan **1448 II. Kosova Savaşı** ile Balkanların kesin Türk yurdu olduğu kanıtlandı ve Avrupalılar savunmaya çekildi (I. Kosova I. Murat dönemindedir). Bu zafer, İstanbul''un fethi öncesinde Balkan cephesindeki tehlikeyi ortadan kaldırarak Fatih dönemine güvenli bir zemin hazırladı."
  },
  {
    "type": "heading",
    "text": "Yükselme Döneminin Kritik Dönüm Noktaları"
  },
  {
    "type": "paragraph",
    "text": "İstanbul''un fethiyle birlikte Osmanlı Devleti bir beylikten cihanşümul bir imparatorluğa dönüştü. Fatih Sultan Mehmet''in Karadeniz''i Türk gölü haline getirmesi ve İtalya seferine kadar uzanan açılımları, Yavuz Sultan Selim''in doğu sınırlarını güvenceye alıp Baharat Yolu ile halifeliği Osmanlı''ya kazandırması ve Kanuni Sultan Süleyman''ın Orta Avrupa ile Akdeniz''de kurduğu hakimiyet bu yükselişin üç temel halkasını oluşturdu."
  },
  {
    "type": "bullets",
    "items": [
      "**Fatih Sultan Mehmet:** İstanbul''u kuşatma hazırlığı olarak **Rumeli Hisarı (Boğazkesen)**nı yaptırdı; fetihten sonra Bizans hanedanının yeniden dirilmesini önlemek için **1460 Mora Despotluğu** ve **1461 Trabzon Rum İmparatorluğu**nu fethetti.",
      "**II. Bayezid ve Cem Sultan:** Cem Sultan''ın Avrupalıların elinde koz olarak tutulması, Osmanlı''da **bir iç meselenin ilk kez uluslararası bir dış soruna dönüşmesi**dir ve Batı seferlerini durdurmuştur.",
      "**Yavuz Sultan Selim:** 1516 Mercidabık ve 1517 Ridaniye seferleriyle Memlüklere son verip halifeliği Osmanlı''ya getirdi; **eş zamanlı olarak** 1517''de Almanya''da Martin Luther **Reform** hareketini başlattı ve Osmanlı Avrupa''daki Hristiyan birliğini böldüğü için Reform''u destekledi.",
      "**Kanuni ve 1533 İstanbul Antlaşması:** Avusturya Arşidükü''nün Osmanlı Sadrazamına denk sayılması, Osmanlı''nın Avrupa''daki siyasi üstünlüğünün zirvesidir (**mütekabiliyet/karşılıklı eşitlik yoktur**). Coğrafi Keşiflerin Akdeniz ticaretini zayıflatması üzerine Sokullu Mehmet Paşa tarafından planlanan **Don-Volga Projesi** Karadeniz-Hazar bağlantısı ve İpek Yolu içinken, **Süveyş Kanalı Projesi** Akdeniz-Kızıldeniz bağlantısı ve Baharat Yolu içindir. İki projenin de hayata geçirilememesi ilerleyen yüzyıllarda ticari ve jeopolitik üstünlüğün Batı''ya kaymasına zemin hazırladı."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Bizans''ın yeniden dirilmesini önlemek amacıyla Fatih''in fethettiği yerler nerelerdir?\" Seçeneklerde Kırım veya Sinop çeldirici olarak bulunur; doğru yanıt Bizans hanedan üyelerinin yönettiği **Mora ve Trabzon**dur. Bu fetihlerle birlikte İstanbul''un fethiyle başlayan süreç siyasi olarak da tamamlanmış, Akdeniz ve Karadeniz ticaret yolları Osmanlı denetimine girmiştir. Aynı dönemde Kırım''ın fethi ise Karadeniz''i tamamen bir Türk gölüne dönüştürmüştür."
  },
  {
    "type": "key_points",
    "items": [
      "İlk Bizans meydan savaşı Koyunhisar (1302), ilk yeniçeri isyanı Buçuktepe (1446), ilk dini-sosyal isyan Şeyh Bedrettin''dir.",
      "ATSB''de ilk adım Karesioğulları, kesin tamamlanma 1515 Turnadağ Savaşı''dır; Balkanların tapusu 1448 II. Kosova ile alındı.",
      "Cem Sultan olayı iç sorunun dış soruna dönüşmesinin ilk örneğidir; 1533 İstanbul Antlaşması mütekabiliyetsiz üstünlüktür."
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
  'tarih.osmanli_dagilma_donemi.02',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  2,
  'Bölüm 2: 17. Yüzyıl Duraklama Dönemi, Antlaşmalar ve Islahatlar',
  '17.  yüzyılda Osmanlı Devleti''nin duraklamasına yol açan etkenler iç ve dış nedenler olarak ayrılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "17. yüzyılda Osmanlı Devleti''nin duraklamasına yol açan etkenler **iç** ve **dış** nedenler olarak ayrılır. Merkezi otoritenin zayıflaması, tımar sisteminin bozulması, saray entrikaları, mali açıklar ve beşik ulemalığı iç nedenlerken; Coğrafi Keşifler sonrası ticaret yollarının yön değiştirmesi, Avrupa''da bilim-teknik gelişimi ve imparatorluğun çöl, okyanus ile güçlü Avusturya/İran gibi **doğal sınırlara ulaşması** kesinlikle **dış neden**dir! Bu etkenler bir araya gelince devlet hem uzun süren doğu-batı savaşlarında yıprandı hem de artan ordu harcamalarını karşılayamaz hale geldi."
  },
  {
    "type": "heading",
    "text": "17. Yüzyılın Kritik Antlaşmaları"
  },
  {
    "type": "bullets",
    "items": [
      "**1606 Zitvatorok Antlaşması:** Uzun süren Osmanlı-Avusturya savaşları sonunda Avusturya Arşidükü protokolde tekrar Osmanlı Padişahına eşit sayıldı; böylece 1533 İstanbul Antlaşması''yla kazanılan üstünlük sona erdi ve **mütekabiliyet** geri geldi.",
      "**1664 Vasvar Antlaşması:** Osmanlı''nın 17. yüzyılda Avusturya''ya karşı kazandığı **son karlı antlaşma**dır (Uyvar ve Neograd kaleleri alındı).",
      "**Kutsal İttifak (1683-1699):** II. Viyana Kuşatması bozgunu sonrası Papa öncülüğünde Osmanlı''ya karşı kuruldu. Başlangıçta **Papalık, Avusturya, Lehistan, Venedik ve Malta**''dan oluşan ittifaka **1686 yılında Rusya** da katıldı (**Fransa ve İngiltere** bu ittifakta kesinlikle yoktur!).",
      "**1699 Karlofça ve 1700 İstanbul Antlaşmaları:** Kutsal İttifak savaşları sonunda imzalanan Karlofça, Osmanlı''nın Batı''da ilk kez büyük çapta toprak kaybettiği ve prestij yitirdiği antlaşmadır; Macaristan ve Erdel Avusturya''ya, Mora ve Dalmaçya Venedik''e, Podolya Lehistan''a bırakıldı. Ayrı imzalanan **1700 İstanbul Antlaşması** ile **Azak Kalesi** Ruslara bırakıldı ve Rusya tarihinde ilk kez **Karadeniz''e** çıkış kapısı elde etti."
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Kutsal İttifak devletlerini **VARMAL-P** şeklinde aklında tut: **V**enedik, **A**vusturya, **R**usya (1686''da katıldı), **Ma**lta, **L**ehistan, **P**apalık. Şıklarda **Fransa** görürsen hemen ele; Fransa kapitülasyon ayrıcalıkları nedeniyle Osmanlı''ya karşı bu ittifaka katılmamıştır."
  },
  {
    "type": "heading",
    "text": "17. Yüzyıl Islahatları (Avrupa Etkisi Yok!)"
  },
  {
    "type": "paragraph",
    "text": "17. yüzyıl ıslahatlarının en temel kuralı şudur: **Bu yüzyılda kesinlikle Avrupa etkisi yoktur!** Devlet hala kendini Batı''dan üstün gördüğü için sorunları eski Kanuni düzenine dönerek, kişilere bağlı kalarak ve baskıyla çözmeye çalışmıştır. Köklü yapısal reformlar yerine mali ve askeri düzeni geçici olarak toparlama çabası öne çıkmıştır."
  },
  {
    "type": "bullets",
    "items": [
      "**Genç Osman (II. Osman):** Köklü ıslahat girişiminde bulunan ilk padişahtır; Hotin Seferi''ndeki disiplinsizlik üzerine **Yeniçeri Ocağı''nı kaldırmayı ilk kez düşünen** (kaldıran II. Mahmut''tur!) ve başkenti Anadolu''ya taşımayı planlayan hükümdardır; bu girişimi hayatına mal olmuştur.",
      "**IV. Murat:** Bağdat Fatihi''dir; devletin aksaklıklarını analiz eden **Koçi Bey Risalesi** bu dönemde sunuldu. İlk içki yasağını I. Ahmet getirse de kahvehaneleri kapatıp tütün ve sokağa çıkma yasaklarını sert biçimde uygulayan IV. Murat''tır.",
      "**Tarhuncu Ahmet Paşa:** IV. Mehmet döneminde israfı önleyerek Osmanlı''nın **ilk modern denk bütçesi**ni hazırladı.",
      "**Vakay-ı Vakvakiye (Çınar Vakası, 1656):** Ulufe maaşlarının düşük ayarlı akçe ile ödenmesine isyan eden yeniçerilerin sarayı basarak 30 devlet adamını çınar ağacına asmasıdır (1826 Vaka-i Hayriye ile karıştırma!)."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM adayların **17. yüzyıl** ile **18. yüzyıl** ıslahatlarını karıştırmasını ister. 17. yüzyılda Avrupa örnek alınmaz, sorunlar kişilere bağlı ve geçicidir. Batı''nın örnek alınmaya başlanması 18. yüzyıldaki **1718 Pasarofça Antlaşması** sonrasına aittir."
  },
  {
    "type": "paragraph",
    "text": "Bu yüzyıldaki isyanlar da devlet düzenindeki çözülmenin habercisidir: Anadolu''da tımarın bozulması ve ağır vergiler yüzünden çıkan **Celali İsyanları** tarımı çökertip Büyük Kaçgun''a yol açarken, İstanbul''daki **Merkez (Yeniçeri) İsyanları** sık sık sadrazam ve padişah değişikliklerine neden oldu. Öte yandan Girit Kuşatması''nın tam yirmi dört yıl sürmesi Osmanlı donanmasının eski üstünlüğünü kaybettiğini gösterdi ve 17. yüzyıl sonunda imzalanan Karlofça Antlaşması imparatorluğu savunma konumuna itti. Böylece 18. yüzyıla girerken devlet hem mali hem askeri alanda köklü bir değişim arayışına girmek zorunda kaldı; Karlofça ile başlayan toprak kayıpları Gerileme Dönemi''nin ana gündemini belirledi."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Aşağıdakilerden hangisi duraklamanın iç nedenlerinden biri değildir?\" Seçeneklerde \"doğal sınırlara ulaşılması\" mutlaka yer alır; sınır komşuları ve coğrafi engellerle ilgili olduğu için bu madde **dış neden**dir."
  },
  {
    "type": "key_points",
    "items": [
      "1533 İstanbul''da üstünlük alındı, 1606 Zitvatorok''ta mütekabiliyete dönüldü; 1664 Vasvar Avusturya''ya karşı son kazançlı antlaşmadır.",
      "Kutsal İttifak üyeleri Malta, Avusturya, Rusya, Venedik ve Lehistan''dır (Fransa yok); 1700 İstanbul ile Azak Ruslara verildi.",
      "17. yüzyılda Avrupa etkisi yoktur; ilk denk bütçe Tarhuncu Ahmet Paşa''ya, Yeniçeri''yi kaldırma fikri Genç Osman''a aittir."
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
  'tarih.osmanli_dagilma_donemi.03',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  3,
  'Bölüm 3: 18. Yüzyıl Gerileme Dönemi ve Batı Etkili Islahatlar',
  '18.  yüzyıl Osmanlı dış politikası Karlofça''da kaybedilen toprakları geri alma umuduyla başladı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "18. yüzyıl Osmanlı dış politikası Karlofça''da kaybedilen toprakları geri alma umuduyla başladı. **1711 Prut Zaferi** Rus ordusunun Baltacı Mehmet Paşa tarafından kuşatılmasıyla bu umudu güçlendirdi ve Azak Kalesi geçici olarak geri alındı; ancak Avusturya ile yapılan savaşların ardından imzalanan **1718 Pasarofça Antlaşması** ile Belgrad dahil büyük topraklar kaybedilince Osmanlı bu umuttan vazgeçti, Avrupa''nın teknik üstünlüğünü kabul etti ve **Lale Devri (1718-1730)** başladı."
  },
  {
    "type": "heading",
    "text": "Lale Devri (1718-1730)"
  },
  {
    "type": "paragraph",
    "text": "Sadrazam **Nevşehirli Damat İbrahim Paşa** dönemindeki Lale Devri, **Batı tarzı ilk sivil ve kültürel ıslahatların** yapıldığı dönemdir; ancak **Lale Devri''nde kesinlikle askeri ıslahat yapılmamıştır!** İlk Türk matbaası **İbrahim Müteferrika** ve Sait Efendi tarafından açıldı; binlerce hattat ve müstensihin işsiz kalmasını ve toplumsal tepki doğmasını önlemek için dini eserlerin basımı matbaa kapsamı dışında bırakıldı. Ayrıca çiçek aşısı uygulandı, itfaiye örgütü (**Tulumbacılar**) kuruldu, Yalova''da kağıt fabrikası açıldı ve Batı''yı yakından tanımak için Viyana ile Paris gibi merkezlere geçici elçilikler gönderildi (Yirmisekiz Mehmet Çelebi). Lüks harcamaların artması ve İran savaşlarındaki başarısızlıklar üzerine çıkan **1730 Patrona Halil İsyanı** ile Lale Devri kapandı."
  },
  {
    "type": "heading",
    "text": "18. Yüzyıl Askeri Islahatları ve Kırım''ın Kaybı"
  },
  {
    "type": "paragraph",
    "text": "Lale Devri''nin ardından gelen padişahlar askeri yenilgilerin temel nedeninin ordu ve teknik yetersizlik olduğunu görerek Batı''dan askeri uzmanlar getirmeye yöneldi:"
  },
  {
    "type": "bullets",
    "items": [
      "**I. Mahmut:** Avrupa''dan getirilen **Comte de Bonneval**, Müslüman olarak **Humbaracı Ahmet Paşa** adını aldı ve Osmanlı''da Batı tarzı **ilk teknik askeri okul** olan **Hendesehane**yi açtı; bu hamle sayesinde 1739 Belgrad Antlaşması ile Belgrad geri alındı ve Karadeniz son kez Türk gölü sayıldı.",
      "**III. Mustafa ve I. Abdülhamit:** Macar asıllı **Baron de Tott** aracılığıyla **Sürat Topçuları Ocağı** kuruldu ve Çeşme Baskını''nda donanmanın yakılması üzerine **Mühendishane-i Bahr-i Hümayun** (Deniz Mühendishanesi) açıldı.",
      "**III. Selim:** İlk kez köklü ve programlı bir devlet politikası olan **Nizam-ı Cedit** ıslahatlarını başlattı. Nizam-ı Cedit ordusu Fransa''nın Mısır işgali sırasında **Akka Savunması**nda Cezzar Ahmet Paşa komutasında Napolyon''u durdurarak ilk ve tek büyük zaferini kazandı. Ayrıca Avrupa başkentlerinde kalıcı diplomasi kurmak için ilk **daimi elçilik** Londra''da açıldı ve ilk elçi **Yusuf Agah Efendi** oldu. (Dönem **1807 Kabakçı Mustafa İsyanı** ile son buldu.)"
    ]
  },
  {
    "type": "paragraph",
    "text": "18. yüzyılın son çeyreğinde Rusya ile yapılan savaşlar ise kuzeydeki en büyük kaybı doğurdu ve Kırım üç aşamada elden çıktı:"
  },
  {
    "type": "table",
    "headers": [
      "Tarih / Antlaşma",
      "Kırım''ın Statüsündeki Aşama",
      "Kritik Sonuç"
    ],
    "rows": [
      [
        "1774 Küçük Kaynarca",
        "Kırım **bağımsız** oldu",
        "İlk kez halkı Müslüman bir toprak elden çıktı; Rusya Ortodoksların koruyuculuğunu aldı"
      ],
      [
        "1779 Aynalıkavak Tenkihnamesi",
        "Kırım''da Rus yanlısı Şahin Giray hanlığı tanındı",
        "Özerk/yarı bağımlı ara aşama"
      ],
      [
        "1783",
        "Rusya Kırım''ı tek taraflı **ilhak** etti",
        "Osmanlı fiili kayba uğradı"
      ],
      [
        "1792 Yaş Antlaşması",
        "Kırım''ın **Rusya''ya ait olduğu** resmen kabul edildi",
        "Gerileme bitti, **Dağılma Dönemi** başladı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, **1774 Küçük Kaynarca Antlaşması**nda Kırım''ın doğrudan Rusya''ya verildiğini söyleyerek tuzak kurar. Küçük Kaynarca''da Kırım Rusya''ya bağlanmamış, **bağımsız** olmuştur (yalnızca dini bakımdan halifeye bağlı kalmıştır). Kırım''ın Rusya''ya ait olduğunun Osmanlı tarafından kabulü **1792 Yaş Antlaşması** iledir."
  },
  {
    "type": "paragraph",
    "text": "Küçük Kaynarca Antlaşması yalnızca toprak kaybı değil, aynı zamanda Osmanlı''nın ilk kez savaş tazminatı ödediği ve Rusya''ya Osmanlı topraklarındaki Ortodoksları koruma bahanesiyle iç işlerimize karışma fırsatı tanıdığı kırılma noktasıdır. Bu durum 19. yüzyıl boyunca sürecek \"Şark Meselesi\"nin diplomatik zeminini oluşturdu. III. Selim dönemindeki Nizam-ı Cedit reformları ise bu tehlikeye karşı devleti ayakta tutma çabasıydı; ancak yeniçeri ve ulema tepkisiyle yarım kaldı ve yenilik girişimleri II. Mahmut devrine miras kaldı."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Lale Devri''nde aşağıdakilerden hangisi yapılmamıştır?\" Cevap mutlaka askeri bir kurumdur (örneğin Nizam-ı Cedit veya Hendesehane); çünkü Lale Devri sivil, kültürel ve mimari yenilikler dönemidir."
  },
  {
    "type": "key_points",
    "items": [
      "1711 Prut umut doğurdu, 1718 Pasarofça Batı üstünlüğünü kabul ettirdi; Lale Devri''nde askeri ıslahat yoktur.",
      "Matbaada dini kitapların basılmama nedeni hattat ve müstensih loncalarının işsiz kalmasını önlemekti.",
      "I. Mahmut döneminde Humbaracı Ahmet Paşa (Hendesehane), III. Selim döneminde Nizam-ı Cedit ve Londra daimi elçiliği (Yusuf Agah) açıldı.",
      "Kırım 1774 Küçük Kaynarca ile bağımsız oldu, 1792 Yaş Antlaşması ile Rusya''ya ait olduğu kabul edildi."
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
  'tarih.osmanli_dagilma_donemi.04',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  4,
  'Bölüm 4: 19. Yüzyıl Dağılma Süreci, İsyanlar ve Savaşlar',
  'Fransız İhtilali''nin yaydığı milliyetçilik akımı çok uluslu Osmanlı İmparatorluğu''nda Balkan isyanlarını tetikledi.  İlk isyan eden toplum 1804''te Kara Yorgi önderliğinde Sırplardır (1812 Bükreş ile ilk imtiyaz).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Fransız İhtilali''nin yaydığı milliyetçilik akımı çok uluslu Osmanlı İmparatorluğu''nda Balkan isyanlarını tetikledi. **İlk isyan eden** toplum 1804''te **Kara Yorgi** önderliğinde **Sırplar**dır (1812 Bükreş ile ilk imtiyaz). Ancak **bağımsızlığını ilk kazanan** Balkan toplumu **Yunanlar (Rumlar)**dır: 1814''te Odessa''da kurulan **Filiki Eterya (Etnik-i Eterya)** isyanı örgütledi (I. Dünya Savaşı''ndaki Mavri Mira ile karıştırma), **1827 Navarin Baskını** ile Osmanlı-Mısır donanması yakıldı ve **1829 Edirne Antlaşması** ile Yunanistan bağımsız oldu. Osmanlı''dan **son ayrılan** Balkan ülkesi ise 1912''de Arnavutluk''tur."
  },
  {
    "type": "heading",
    "text": "Mısır, Boğazlar ve Kırım Savaşı"
  },
  {
    "type": "paragraph",
    "text": "Mısır Valisi Kavalalı Mehmet Ali Paşa''nın isyanı karşısında **1833 Kütahya Antlaşması** (Mehmet Ali Paşa ile) ve **1833 Hünkar İskelesi Antlaşması** (Rusya ile savunma paktı; Osmanlı Boğazları Rusya lehine kapatmayı kabul etti) imzalandı. İngiltere''nin desteğini almak için imzalanan **1838 Balta Limanı Ticaret Sözleşmesi** ile ithalat gümrüğü %5''e düşürülüp ihracat gümrüğü %12''ye çıkarılınca ucuz Avrupa malları yerli loncaları çökertti. Ardından **1841 Londra Boğazlar Sözleşmesi** ile Boğazlar barış zamanında tüm savaş gemilerine kapatılarak Osmanlı''nın tek taraflı egemenliğinden çıkıp **uluslararası statü** kazandı."
  },
  {
    "type": "paragraph",
    "text": "**1853-1856 Kırım Savaşı** sırasında Rusya **1853 Sinop Baskını** ile Osmanlı donanmasını bir kez daha yaktı (donanmanın yakıldığı 4 yer sırasıyla: **1571 İnebahtı, 1770 Çeşme, 1827 Navarin, 1853 Sinop**). Savaşta Selimiye Kışlası''nda yaralı askerlere bakan **\"Lambalı Kadın\" Florence Nightingale** modern hemşireliğin öncüsü oldu. Osmanlı ilk **dış borcunu** da bu savaşta **1854''te İngiltere''den** aldı (en çok borç Fransa''dan alınsa da ilk borç İngiltere''dendir). Savaş sonunda Osmanlı galip tarafta yer almasına rağmen **1856 Paris Antlaşması** ile **Karadeniz''de savaş gemisi ve tersane bulundurmaktan men edilerek** yenik devlet muamelesi gördü."
  },
  {
    "type": "timeline",
    "items": [
      {
        "label": "1804",
        "text": "İlk Balkan isyanı: Kara Yorgi önderliğinde Sırplar ayaklandı."
      },
      {
        "label": "1829",
        "text": "Edirne Antlaşması: Yunanistan bağımsız olan ilk Balkan devleti oldu."
      },
      {
        "label": "1838",
        "text": "Balta Limanı Sözleşmesi: Osmanlı ekonomisi dış rekabete açıldı."
      },
      {
        "label": "1841",
        "text": "Londra Boğazlar Sözleşmesi: Boğazlar uluslararası statü kazandı."
      },
      {
        "label": "1853",
        "text": "Sinop Baskını: Ruslar Kırım Savaşı''nda Osmanlı donanmasını yaktı."
      },
      {
        "label": "1878",
        "text": "Berlin Antlaşması: Sırbistan, Karadağ ve Romanya bağımsız oldu."
      }
    ]
  },
  {
    "type": "heading",
    "text": "93 Harbi (1877-1878), Berlin Antlaşması ve Dömeke"
  },
  {
    "type": "paragraph",
    "text": "93 Harbi''nde Batı cephesinde **Plevne Kahramanı Gazi Osman Paşa**, **Şıpka Geçidi** savunmasında **Süleyman Hüsnü Paşa**, Kafkas cephesinde ise **Ahmet Muhtar Paşa** ve Erzurum Aziziye Tabyaları''nda **Nene Hatun** öne çıktı (**Nene Hatun** kesinlikle Kurtuluş Savaşı değil, 93 Harbi kahramanıdır!)."
  },
  {
    "type": "paragraph",
    "text": "Savaş sonunda imzalanan **Ayastefanos Antlaşması** Rusya''yı aşırı güçlendirdiği için İngiltere ve Avusturya''nın müdahalesiyle **yürürlüğe girmeden iptal edildi** (Osmanlı tarihinde yürürlüğe girmeyen iki antlaşma: **Ayastefanos** ve **Sevr**). Yerine imzalanan **1878 Berlin Antlaşması** ile **Sırbistan, Karadağ ve Romanya** (şifre: **SaKaR**) bağımsız olurken, **Bulgaristan** özerk bırakıldı; **Kars, Ardahan ve Batum (Elviye-i Selase)** Rusya''ya verildi (**Doğubayazıt** Osmanlı''ya geri döndü). Ayrıca **Berlin''in 61. maddesi** ile **Ermeni meselesi** ilk kez uluslararası bir belgeye girdi ve aynı yıl İngiltere Rus tehdidini öne sürerek **Kıbrıs**''ı geçici üs olarak devraldı; Girit''e ise **Halepa Fermanı (1878)** ile özerklik verildi."
  },
  {
    "type": "paragraph",
    "text": "Yunanistan ile yapılan **1897 Dömeke Meydan Savaşı** ise Osmanlı''nın meydanda kazandığı **son büyük zafer**dir; 16 yaşındaki Mustafa Kemal bu savaşa katılmak için gönüllü olmak istemişti. Ancak büyük devletlerin diplomatik müdahalesi nedeniyle Osmanlı sahada kazandığı bu zaferi masa başında aynı ölçüde toprak kazancına dönüştürememiştir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin 1878 Berlin Antlaşması''ndaki iki klasik tuzağı vardır: Birincisi, **Bulgaristan** Berlin''de bağımsız olmamış, özerk bir prenslik yapılmıştır (bağımsız olanlar Sırbistan, Karadağ, Romanya). İkincisi, **Nene Hatun**''u Kara Fatma veya Gördesli Makbule ile karıştırıp Kurtuluş Savaşı şıklarına koyarlar; oysa Nene Hatun **93 Harbi (1877-78)** kahramanıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Osmanlı ilk dış borcunu hangi savaştan ve hangi ülkeden almıştır?\" En çok borçlandığımız ülke Fransa olsa da **ilk dış borç** 1854 Kırım Savaşı sırasında **İngiltere**den alınmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "İlk isyan eden Sırplar (1804), ilk bağımsız olan Yunanistan (1829 Edirne), son ayrılan Arnavutluk''tur.",
      "Donanmanın yakıldığı 4 yer: İnebahtı (1571), Çeşme (1770), Navarin (1827), Sinop (1853).",
      "1856 Paris''te galip olmamıza rağmen Karadeniz silahsızlandırıldı; 1878 Berlin''de Sırbistan, Karadağ ve Romanya bağımsız oldu.",
      "Yürürlüğe girmeyen iki antlaşma Ayastefanos ve Sevr''dir; Ermeni sorunu ilk kez 1878 Berlin Antlaşması''yla uluslararasılaştı."
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
  'tarih.osmanli_dagilma_donemi.05',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  5,
  'Bölüm 5: II. Mahmut ve Tanzimat-Islahat Dönemi Modernleşmesi',
  '19.  yüzyılın ilk köklü belgesi 1808 Sened-i İttifaktır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "19. yüzyılın ilk köklü belgesi **1808 Sened-i İttifak**tır. Alemdar Mustafa Paşa''nın aracılığıyla imzalanan bu belge ile padişahın mutlak otoritesi **ilk kez** taşra ayanları karşısında sınırlandı; ancak Sened-i İttifak bir anayasa veya halk hareketi değil, merkezi otoriteyi yeniden kurmaya çalışan padişah ile yerel güç odakları arasındaki bir sözleşmedir."
  },
  {
    "type": "heading",
    "text": "II. Mahmut Dönemi Yenilikleri (1808-1839)"
  },
  {
    "type": "paragraph",
    "text": "II. Mahmut devlet mekanizmasını merkezileştirerek kökten modernize eden padişahtır. Ayanların gücünü kırdıktan sonra ıslahatların önündeki en büyük engel olan Yeniçeri sorununu çözmeye yöneldi:"
  },
  {
    "type": "bullets",
    "items": [
      "**Askeri ve idari dönüşüm:** **1826 Vaka-i Hayriye** ile Yeniçeri Ocağı''nı kaldırıp yerine **Asakir-i Mansure-i Muhammediye** ordusunu kurdu. Divan-ı Hümayun''u kaldırarak **Nazırlıklar** (bakanlıklar) ve Başvekalet sistemini kurdu; taşrada merkezi denetimi artırmak için **muhtarlıklar** oluşturdu ve memurlara maaş bağlayarak **müsadere** uygulamasını kaldırdı.",
      "**Nüfus, basın ve kontrol:** **1831**''de askeri ve vergi amaçlı **ilk nüfus sayımını** yaptırdı (yalnızca erkekler ve mülkler sayıldı). Kamuoyunu bilgilendirmek için ilk resmi gazete **Takvim-i Vekayi** çıkarıldı. İstanbul''a kontrolsüz göçü önlemek için iç pasaport niteliğindeki **Mürur Tezkeresi** getirildi (gemi geçiş belgesi olan **İzn-i Sefine** ile karıştırma).",
      "**Eğitim ve kılık kıyafet:** **1827 Tıbhane-i Amire** (Mekteb-i Tıbbiye - askeri hekim okulu; Mekteb-i Harbiye subay, Mekteb-i Mülkiye ise kaymakam/bürokrat yetiştirir) açıldı. Memurlara **fes, ceket ve pantolon** zorunluluğu getirildi ve devlet dairelerine padişah portresi asıldı (Şapka İnkılabı Cumhuriyet döneminde Atatürk''e aittir!). İlköğretim İstanbul''da zorunlu hale getirildi ve Avrupa''ya öğrenci gönderildi."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "II. Mahmut o kadar çok ilk gerçekleştirdiği için adaylar sıkça **Kanun-i Esasi ve Meşrutiyet**i de ona bağlar. Oysa **II. Mahmut döneminde anayasa ve meclis yoktur**; Kanun-i Esasi ve Mebusan Meclisi **1876''da II. Abdülhamit** döneminde ilan edilmiştir."
  },
  {
    "type": "heading",
    "text": "Tanzimat ve Islahat Fermanları (Abdülmecit & Abdülaziz)"
  },
  {
    "type": "paragraph",
    "text": "**1839 Tanzimat Fermanı (Gülhane Hatt-ı Hümayunu)**, hazırlıkları II. Mahmut devrinde başlasa da oğlu **Sultan Abdülmecit** döneminde Mısır Sorunu''nda Avrupa desteğini kazanmak amacıyla **Mustafa Reşit Paşa** tarafından ilan edildi. Padişah ilk kez kanunların üstünlüğünü kendi iradesiyle kabul etti; tüm tebaanın can, mal, namus güvenliği ve vergi-askerlik adaleti güvence altına alındı. Ancak Tanzimat Fermanı''nda da **meclis veya anayasa yoktur**."
  },
  {
    "type": "paragraph",
    "text": "**1856 Islahat Fermanı** ise Sadrazam **Mehmet Emin Ali Paşa** tarafından hazırlanıp Kırım Savaşı sonrası toplanacak Paris Konferansı öncesinde ilan edildi ve Avrupalı devletlerin iç işlerimize karışmasını önlemek için doğrudan **gayrimüslim tebaanın haklarını** genişletmeyi hedefledi. Gayrimüslimlere küçük düşürücü ifadelerin yasaklanması, bedelli askerlik, banka-okul açma ve **il genel meclislerine üye olma** hakkı bu fermanla tanındı (ancak siyasi parti kurma hakkı verilmedi)."
  },
  {
    "type": "table",
    "headers": [
      "Belge / Kurum",
      "Dönem ve Padişah",
      "Ayırt Edici Sınav Özelliği"
    ],
    "rows": [
      [
        "Kaime",
        "1840 / Abdülmecit",
        "Osmanlı''nın ilk kağıt parası (Kaime-i Nakdiye-i Mutebere)"
      ],
      [
        "Mecidiye",
        "1844 / Abdülmecit",
        "Tashih-i Ayar düzenlemesiyle basılan gümüş madeni para"
      ],
      [
        "Encümen-i Daniş",
        "1851 / Abdülmecit",
        "İlk Türk bilim akademisi ve ders kitabı telif heyeti"
      ],
      [
        "Kuleli Vakası",
        "1859 / Abdülmecit",
        "Fedailer Cemiyeti''nin bastırılan darbe girişimi"
      ],
      [
        "Tercüman-ı Ahval",
        "1860 / Abdülmecit",
        "İlk özel gazete; Şinasi''nin *Şair Evlenmesi* burada yayımlandı"
      ],
      [
        "Memleket Sandıkları",
        "1863 / Abdülaziz",
        "Mithat Paşa kurdu; 1888''de **Ziraat Bankası** adını aldı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**Sultan Abdülaziz** döneminde ayrıca **1867** yılında Paris Sanayi Sergisi davetiyle gerçekleşen gezi önemlidir: Abdülaziz, **Avrupa''ya seyahate giden ilk ve tek Osmanlı padişahı**dır. Bu ziyaretin ardından Osmanlı donanması güçlendirilerek dünyanın sayılı deniz filolarından biri haline getirilmiş, ayrıca modern eğitim kurumları olarak Darüşşafaka ve Mekteb-i Sultani (Galatasaray Lisesi) açılmıştır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Tanzimat Fermanı ile Islahat Fermanı''nı metinden nasıl ayırırım?\" Metinde **\"herkes, bütün tebaa, Müslim-gayrimüslim eşitliği\"** geçiyorsa Tanzimat''tır; doğrudan **\"gayrimüslimlere il genel meclisi veya banka/okul hakkı\"** vurgulanıyorsa Islahat Fermanı''dır. Her iki belge de Osmanlı''nın dağılmasını önleme ve Avrupalı devletlerin iç işlerimize müdahalesini kesme amacı taşır."
  },
  {
    "type": "key_points",
    "items": [
      "Sened-i İttifak (1808) padişah yetkisini ayanlara karşı ilk kez sınırladı; 1826 Vaka-i Hayriye ile Yeniçeri kaldırıldı.",
      "İlk nüfus sayımı (1831), Takvim-i Vekayi, Mekteb-i Tıbbiye ve fes-pantolon II. Mahmut dönemindedir; Meşrutiyet yoktur.",
      "Tanzimat (1839) tüm tebaaya kanun üstünlüğü getirdi; Islahat (1856) gayrimüslimlere odaklandı.",
      "Kaime, Encümen-i Daniş, Kuleli Vakası ve Tercüman-ı Ahval Abdülmecit; Avrupa seyahati ise Sultan Abdülaziz dönemindedir."
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
  'tarih.osmanli_dagilma_donemi.06',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  6,
  'Bölüm 6: II. Abdülhamit, Meşrutiyetler ve Fikir Akımları',
  'Genç Osmanlıların (Jön Türkler) çabasıyla 23 Aralık 1876''da II.  Abdülhamit döneminde I.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Genç Osmanlıların (Jön Türkler) çabasıyla **23 Aralık 1876**''da **II. Abdülhamit** döneminde **I. Meşrutiyet** ilan edildi ve Türk tarihinin **ilk yazılı anayasası** olan **Kanun-i Esasi** yürürlüğe girdi. Tersane Konferansı''nın baskısını kırmayı ve azınlık ayrılıkçılığını önlemeyi amaçlayan bu adımla Osmanlı mutlak monarşiden meşruti monarşiye geçti. Kurulan **Meclis-i Umumi** iki kanatlıydı: üyelerini bizzat padişahın ömür boyu seçtiği **Heyet-i Ayan** ve mülk sahibi erkek halkın seçtiği **Heyet-i Mebusan**. Ancak 93 Harbi''nin patlak vermesi üzerine II. Abdülhamit anayasanın kendisine tanıdığı yetkiyle 1878''de meclisi süresiz tatil etti."
  },
  {
    "type": "paragraph",
    "text": "Bu dönemin dev hukuk eseri **Mecelle**dir (1868-1876). **Ahmet Cevdet Paşa** başkanlığındaki heyetçe hazırlanan Mecelle, Türk-İslam tarihinin ilk medeni kanunu sayılır; ancak **aile hukuku (evlenme, boşanma, miras)** konularını kapsamaz (yalnızca borçlar, eşya ve yargılama usullerini içerir; 1926 Türk Medeni Kanunu ile yürürlükten kalkmıştır)."
  },
  {
    "type": "heading",
    "text": "İç Olaylar, Mali İflas ve Siyasi Krizler"
  },
  {
    "type": "bullets",
    "items": [
      "**Mali iflas ve Düyun-ı Umumiye:** Kırım Savaşı''ndan beri biriken dış borçların altından kalkamayan Osmanlı **1875 Ramazan Kararnamesi** ile borç faizlerini ödeyemeyeceğini duyurdu; **1881 Muharrem Kararnamesi** ile de alacaklı devletlerin kurduğu ve tuz, tütün, damga gibi gelirleri haczeden **Düyun-ı Umumiye (Genel Borçlar İdaresi)** kuruldu.",
      "**II. Abdülhamit dönemi kurumları:** Doğu Anadolu''da Rus ve Ermeni tehdidine karşı aşiretlerden düzenli **Hamidiye Süvari Alayları** kuruldu; İslam dünyasından bağışlarla İslamcılık politikasının eseri olarak **Hicaz Demiryolu** inşa edildi (Anadolu''daki ilk demiryolu ise İngilizlerin yaptığı İzmir-Aydın hattıdır).",
      "**Suikast ve baskınlar:** **Ali Suavi**, V. Murat''ı tekrar tahta çıkarmak için **Çırağan Sarayı Baskını**nı düzenledi ancak Beşiktaş Muhafızı Yedi Sekiz Hasan Paşa tarafından bastırıldı. **1896 Osmanlı Bankası Baskını** Ermeni komitacılarca Avrupa''nın dikkatini çekmek için yapıldı. II. Abdülhamit''e yönelik **Yıldız Suikastı** ise Tevfik Fikret''in \"Şanlı Avcı\" şiirine konu oldu."
    ]
  },
  {
    "type": "heading",
    "text": "II. Meşrutiyet (1908) ve 31 Mart Vakası (1909)"
  },
  {
    "type": "paragraph",
    "text": "İngiltere ve Rusya arasındaki **Haziran 1908 Reval Görüşmeleri**nde Makedonya ve Boğazların paylaşılması konuşulunca İttihat ve Terakki Cemiyeti''nin Rumeli''deki baskısı arttı ve **23 Temmuz 1908**''de **II. Meşrutiyet** ilan edildi. Ancak yeni düzene karşı İstanbul''da **13 Nisan 1909**''da **31 Mart Vakası** patlak verdi. **Türk tarihinde mevcut anayasal rejime karşı çıkan ilk isyan** olan bu ayaklanmayı Selanik''ten gelen **Mahmut Şevket Paşa** komutasındaki **Hareket Ordusu** bastırdı. Bu ordunun Kurmay Başkanı olan **Mustafa Kemal**, **tarih sahnesine ilk kez burada çıktı** (Trablusgarp veya Çanakkale''den önce!). İsyan sonrası II. Abdülhamit tahttan indirilerek yerine **V. Mehmet Reşat** geçirildi ve 1909 anayasa değişiklikleriyle padişahın meclisi feshetme ve sürgün yetkileri kısıtlandı."
  },
  {
    "type": "heading",
    "text": "Kurtuluş Fikir Akımları"
  },
  {
    "type": "paragraph",
    "text": "Devleti dağılmaktan kurtarmak için dört ana akım savunuldu: **Osmanlıcılık** (din-dil ayrımı olmadan ortak vatandaşlık; Balkan Savaşları''yla bitti), **İslamcılık** (Halife etrafında birlik; I. Dünya Savaşı''nda Arap isyanlarıyla bitti), **Batıcılık** (çağdaşlaşma) ve **Türkçülük** (Balkan Savaşları''ndan sonra güçlendi ve Cumhuriyetin kuruluşuna giden fikri zemini besledi). Bu dört ana akımın yanında **Prens Sabahattin**''in savunduğu **Adem-i Merkeziyetçilik** ise merkeziyetçiliğin tam tersine **yerinden yönetim** ve **serbest piyasa (liberalizm)** esasını savunmuştur. Tüm bu fikir akımları, imparatorluğun farklı kriz dönemlerinde aydınların ve devlet adamlarının ürettiği kurtuluş reçeteleri olarak tarihe geçmiştir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sınavda **Meclis-i Umumi** üyelerinin seçimi sıkça sorulur: **Heyet-i Ayan** üyelerini halk değil, **bizzat padişah ömür boyu** seçer; halk yalnızca **Heyet-i Mebusan** üyelerini seçer. Ayrıca 31 Mart Vakası''nı bastıran Hareket Ordusu''nun **komutanı Mahmut Şevket Paşa**, **kurmay başkanı Mustafa Kemal**dir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Mecelle hakkında hangisi söylenemez?\" Seçeneklerde mutlaka \"Evlenme ve boşanma gibi aile hukuku konularını düzenlemiştir\" yer alır; Mecelle''de **aile hukuku yoktur**. Osmanlı''da aile hukuku alanındaki ilk modern düzenleme ise 1917 tarihli Hukuk-ı Aile Kararnamesi ile yapılacaktır."
  },
  {
    "type": "key_points",
    "items": [
      "1876 Kanun-i Esasi ilk yazılı anayasadır; Meclis Heyet-i Ayan (padişah atar) ve Heyet-i Mebusan''dan oluşur.",
      "Mecelle Ahmet Cevdet Paşa tarafından hazırlandı ancak aile hukukunu kapsamaz; 1881 Muharrem Kararnamesi ile Düyun-ı Umumiye kuruldu.",
      "1908 Reval Görüşmeleri II. Meşrutiyet''i tetikledi; 1909 31 Mart Vakası rejime karşı ilk isyandır ve Mustafa Kemal tarih sahnesine burada çıktı.",
      "Prens Sabahattin''in Adem-i Merkeziyetçiliği yerinden yönetim ve liberal ekonomi demektir."
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
  'tarih.osmanli_dagilma_donemi.07',
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  7,
  'Bölüm 7: Trablusgarp ve Balkan Savaşları (1911-1913)',
  'Sanayileşmesini geç tamamlayan İtalya, sömürge arayışıyla 1911''de Osmanlı''nın Kuzey Afrika''daki son toprağı olan Trablusgarp''a saldırdı.  Mısır İngiliz işgalinde olduğu için karadan, donanma Haliç''te çürüyüp yetersiz kaldığı için denizden ordu gönderemeyen Osmanlı, bölgeye Mustafa Kemal (Gazeteci Şerif takma adıyla) ve Enver Bey (Tüccar Hamdi) gibi gönüllü subayları gizlice yolladı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sanayileşmesini geç tamamlayan İtalya, sömürge arayışıyla 1911''de Osmanlı''nın Kuzey Afrika''daki son toprağı olan Trablusgarp''a saldırdı. Mısır İngiliz işgalinde olduğu için karadan, donanma Haliç''te çürüyüp yetersiz kaldığı için denizden ordu gönderemeyen Osmanlı, bölgeye **Mustafa Kemal** (Gazeteci Şerif takma adıyla) ve **Enver Bey** (Tüccar Hamdi) gibi gönüllü subayları gizlice yolladı."
  },
  {
    "type": "paragraph",
    "text": "Mustafa Kemal, **Derne ve Tobruk**''ta yerli halkı örgütleyerek İtalyanlara karşı **sömürgeciliğe karşı ilk askeri başarısını** kazandı. Bu savaş aynı zamanda dünya harp tarihinde İtalya''nın Türk mevzilerine karşı **ilk kez askeri uçak kullanması** ve havadan bomba atmasıyla bilinir. (İlk Türk hava şehitlerimiz ise 1914''te Taberiye Gölü yakınlarında düşen **Yüzbaşı Fethi Bey** ve Üsteğmen Sadık Bey''dir; Muğla''nın Meğri ilçesine bu nedenle **Fethiye** adı verilmiştir.)"
  },
  {
    "type": "paragraph",
    "text": "İtalya''nın Osmanlı''yı barışa zorlamak için Çanakkale Boğazı''nı abluka altına alması, Beyrut''u bombalaması ve aynı sırada Balkan devletlerinin Osmanlı''ya savaş açması üzerine imzalanan **1912 Uşi Antlaşması** ile Trablusgarp ve Bingazi İtalya''ya bırakıldı; böylece Osmanlı **Kuzey Afrika''daki varlığını tamamen kaybetti** (Kuzey Afrika''da ilk kaybedilen yer 1830 Cezayir, son yer 1912 Trablusgarp''tır). Oniki Ada ise Yunan işgaline karşı **geçici olarak** İtalya''ya bırakıldı; ancak adalar bir daha geri alınamadı ve bölge halkı dini bakımdan halifeye bağlı bırakıldı."
  },
  {
    "type": "heading",
    "text": "I. ve II. Balkan Savaşları (1912-1913)"
  },
  {
    "type": "paragraph",
    "text": "Balkan ittifakının kurulmasında Rusya''nın Panislavizm politikası ve Osmanlı ordusunun siyasete karışması etkili oldu:"
  },
  {
    "type": "bullets",
    "items": [
      "**I. Balkan Savaşı (1912-1913):** Bulgaristan, Yunanistan, Sırbistan ve Karadağ''ın saldırısıyla başladı; ordudaki subayların İttihatçı ve İtilafçı diye bölünüp siyasete karışması, lojistik yetersizlikler ve terhisler nedeniyle ağır yenilgi alındı. Denizde ise **Rauf Orbay**, **Hamidiye Kruvazörü** ile gerçekleştirdiği akınlarla **\"Hamidiye Kahramanı\"** olarak ünlendi. Savaş sürerken İttihat ve Terakki **23 Ocak 1913 Bab-ı Ali Baskını** ile hükümet darbesi yaptı (dikkat: bu bir padişah değişikliği değil, **hükümet darbesidir**; V. Mehmet Reşat tahtta kaldı). Savaş sonundaki **1913 Londra Antlaşması** ile Osmanlı **Midye-Enez** hattının batısını ve **Edirne**''yi kaybetti.",
      "**II. Balkan Savaşı (1913):** I. Balkan''da aslan payını Bulgaristan alınca Yunanistan, Sırbistan, Karadağ ve Romanya (I. Balkan''da yoktu!) Bulgaristan''a saldırdı. Osmanlı bu fırsattan yararlanarak Doğu Trakya''ya yürüdü; **Enver Paşa** Edirne''yi ve Kırklareli''ni geri alarak **\"Edirne Fatihi\"** unvanını kazandı."
    ]
  },
  {
    "type": "paragraph",
    "text": "Savaşın ardından Balkan devletleri kendi aralarında **1913 Bükreş Antlaşması**nı imzalarken, Osmanlı devleti ikili antlaşmalar yaptı: Bulgaristan ile **1913 İstanbul**, Yunanistan ile **1913 Atina** ve Sırbistan ile **1914 İstanbul Antlaşması**. Batı sınırımız **Meriç Nehri** oldu. Balkan Savaşları sonrasında yüz binlerce Türk''ün Anadolu''ya göç etmesi Anadolu''daki Türk nüfus yoğunluğunu artırdı, Osmanlıcılık fikrini tamamen bitirdi ve **Türkçülük** akımını devletin temel politikası haline getirdi. Ayrıca bu yenilgilerin ardından Osmanlı ordusu Alman askeri heyetlerinin desteğiyle yeniden yapılandırılmaya çalışıldı ve bu süreç I. Dünya Savaşı''na Almanya yanında girilmesinin zeminini hazırladı. Böylece Trablusgarp ve Balkan cephelerinde yaşanan ağır kayıplar, Osmanlı''nın Büyük Savaş öncesindeki askeri ve diplomatik tercihlerini doğrudan şekillendirdi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Balkan Savaşları''nda şu üç ayrımı mutlaka yoklar: - **Romanya** I. Balkan Savaşı''nda yoktur, **II. Balkan Savaşı**na katılmıştır. - **Bab-ı Ali Baskını** padişaha değil, hükümete yapılmış bir darbedir. - I. Balkan sonu sınırı **Midye-Enez**, II. Balkan sonu sınırı ise **Meriç Nehri**dir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"II. Balkan Savaşı''nın sonunda Balkan devletlerinin kendi aralarında imzaladığı antlaşma ile Osmanlı''nın Yunanistan''la imzaladığı antlaşma hangileridir?\" Balkan devletleri kendi aralarında **Bükreş**, Osmanlı ise Yunanistan ile **Atina** Antlaşması''nı imzalamıştır. Bu antlaşmalarla Osmanlı''nın Balkanlardaki yüzlerce yıllık hakimiyeti büyük ölçüde sona ermiş ve Batı Trakya''daki Türkler azınlık statüsüne düşmüştür. Adalar sorunu ve azınlık hakları ise ilerleyen yıllarda Cumhuriyet diplomasisine de miras kalmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Trablusgarp''ta Mustafa Kemal Derne ve Tobruk''ta savaştı; dünyada ilk askeri uçak bu savaşta İtalya tarafından kullanıldı.",
      "1912 Uşi Antlaşması ile Kuzey Afrika''daki son toprak kaybedildi (ilk kaybedilen 1830 Cezayir''di).",
      "I. Balkan''da Hamidiye Kahramanı Rauf Orbay, II. Balkan''da Edirne Fatihi Enver Paşa öne çıktı; Bab-ı Ali Baskını hükümet darbesidir.",
      "I. Balkan sonu sınır Midye-Enez (Londra), II. Balkan sonu sınır Meriç Nehri''dir; Balkan göçleri Türkçülüğü güçlendirdi."
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
-- 📖 KADRO KONU ANLATIMI — Tarih · Kurtuluş Savaşı Hazırlık ve Cepheler
-- Kaynak: docs/konu_anlatimi/tarih/05_kurtulus_savasi_hazirlik_ve_cepheler.md
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.01',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  1,
  'Bölüm 1: I. Dünya Savaşı Cepheleri ve Mondros Ateşkesi',
  'Osmanlı Devleti I.  Dünya Savaşı''na Almanya yanında girerek kaybettiği toprakları geri almayı, kapitülasyonlardan kurtulmayı ve siyasi yalnızlığını aşmayı hedefledi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı Devleti I. Dünya Savaşı''na Almanya yanında girerek kaybettiği toprakları geri almayı, kapitülasyonlardan kurtulmayı ve siyasi yalnızlığını aşmayı hedefledi. Savaş boyunca üç farklı cephe türünde mücadele edildi: **Taarruz cepheleri** (Kafkas ve Kanal), **Savunma cepheleri** (Çanakkale, Irak, Suriye-Filistin, Hicaz-Yemen) ve müttefiklere destek amacıyla sınır dışında savaşılan **Yardım cepheleri** (**Galiçya, Makedonya, Romanya**; sonu \"-ya\" ile biten bu üç cepheyi bu şekilde kodlayabilirsin). Almanya, Osmanlı''nın halifelik gücünü kullanarak sömürgelerdeki Müslümanları ayaklandırmak ve Avrupa''daki cephe yükünü hafifletmek istemişti; ancak beklenen etki doğmadı. Buna karşılık Osmanlı orduları Kafkasya''da ağır kış şartları ve Sarıkamış faciasıyla, Kanal''da ise çöl lojistiğiyle mücadele etmek zorunda kaldı."
  },
  {
    "type": "heading",
    "text": "Cephelerin Kritik Komutanları ve Mustafa Kemal"
  },
  {
    "type": "paragraph",
    "text": "Mustafa Kemal I. Dünya Savaşı''nda sırasıyla **1. Çanakkale Cephesi** (19. Tümen / Anafartalar), **2. Kafkasya Cephesi** (Muş ve Bitlis''i geri aldı) ve **3. Suriye-Filistin Cephesi** (Yıldırım Orduları) görevlerinde bulundu; **Irak veya Kanal Cephesi''nde kesinlikle savaşmamıştır**. Özellikle Çanakkale''deki başarıları onun yalnızca askeri dehasını değil, Anadolu halkı nezdindeki liderlik saygınlığını da pekiştirerek ilerideki Milli Mücadele önderliğinin yolunu açtı. Suriye cephesinin çöküşünün ardından İstanbul''a dönmesi ise işgallere karşı yeni bir örgütlenme arayışının başlangıcı oldu."
  },
  {
    "type": "bullets",
    "items": [
      "**Çanakkale Cephesi:** İtilaf Devletleri''nin Rusya''ya yardım götürmek için açtığı bu cephede deniz savaşlarının müstahkem mevki komutanı ve **\"18 Mart Kahramanı\"** unvanlı komutan **Cevat Paşa (Çobanlı)**dır; Mustafa Kemal ise kara savaşlarının kahramanıdır. Çanakkale Zaferi savaşın süresini uzatarak Çarlık Rusyası''nın yıkılışını hızlandırdı.",
      "**Irak Cephesi:** İngilizlerin Musul petrollerine ulaşmasını önlemek için savunulan cephede **1916 Kutü''l-Amare Zaferi**, **Halil Paşa (Kut)** komutasında kazanıldı ve İngiliz General Townshend esir alındı.",
      "**Hicaz-Yemen Cephesi:** **\"Medine Müdafii\"** ve **\"Çöl Kaplanı\"** olarak anılan **Fahrettin Paşa (Türkkan)**, kuşatma altındayken Kutsal Emanetlerin yağmalanmasını önleyerek İstanbul''a gönderdi ve Mondros''tan sonra dahi direnişini sürdürdü."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin cephe komutanlarında en sık kurduğu tuzak şudur: **Kazım Karabekir**, hem I. Dünya Savaşı''nın Kafkas Cephesi''nde (1917-1918''de kolordu komutanı olarak Erzincan, Erzurum ve Kars''ı geri almıştır) hem de Kurtuluş Savaşı''nın Doğu Cephesi''nde (1920) görev yapmıştır; bu iki dönemi birbirine karıştırma. Ayrıca Çanakkale''de **\"18 Mart Kahramanı\"** sorulduğunda doğrudan Mustafa Kemal''e değil, **Cevat Çobanlı Paşa**ya gitmelisin."
  },
  {
    "type": "heading",
    "text": "Mondros Ateşkesi ve Paris Barış Konferansı"
  },
  {
    "type": "paragraph",
    "text": "30 Ekim 1918''de Rauf Orbay tarafından imzalanan **Mondros Ateşkes Antlaşması**, Wilson İlkeleri''ne güvenerek masaya oturan Osmanlı''nın fiilen teslim olması anlamına geldi; ordu terhis edildi, haberleşme ve ulaşım hatları İtilaf denetimine bırakıldı. Antlaşmanın en tehlikeli iki maddesi sınavda sürekli karşılaştırılır: **7. Madde** İtilaf Devletleri''ne güvenliklerini tehdit eden herhangi bir stratejik noktayı işgal etme hakkı tanıyarak **tüm Anadolu''yu işgale açık hale getirdi**. **24. Madde** ise **Vilayat-ı Sitte** (Altı Doğu İli: **Bitlis, Erzurum, Sivas, Elazığ/Harput, Van, Diyarbakır**; şifre: **BESEVD**) bölgesinde karışıklık çıkarsa işgal hakkı vererek doğuda bir **Ermeni Devleti** kurmayı amaçladı (**Trabzon** bu altı il arasında değildir!)."
  },
  {
    "type": "paragraph",
    "text": "Savaş sonrası düzenlenen **1919 Paris Barış Konferansı**nda ise İngiltere, Doğu Akdeniz''de güçlü bir İtalya yerine kendi güdümünde zayıf bir Yunanistan görmek istediği için gizli antlaşmalarla İtalya''ya bırakılan İzmir ve çevresini Yunanistan''a verdi. Bu karar **İtilaf Devletleri arasındaki ilk görüş ayrılığını** başlattı ve İtalya''nın ilerleyen yıllarda Anadolu''daki Türk direnişine daha ılımlı yaklaşmasına zemin hazırladı. Ayrıca konferansta manda ve himaye fikri benimsenerek Ortadoğu''daki Arap toprakları İngiltere ve Fransa arasında paylaşıldı; Doğu Anadolu''da ise Ermeni devleti kurulması gündeme getirildi."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Aşağıdaki illerden hangisi Mondros''un 24. maddesindeki Vilayat-ı Sitte arasında yer almaz?\" Seçeneklerde **Trabzon** (Doğu Karadeniz / Pontus iddiası) veya **Kars** bulunur; altı il yalnızca Bitlis, Erzurum, Sivas, Elazığ, Van ve Diyarbakır''dır. Bu maddeyle İtilaf Devletleri doğrudan doğuda bağımsız bir Ermeni devletine zemin hazırlamayı amaçlamıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Sınır dışı yardım cepheleri Galiçya, Makedonya ve Romanya''dır; Mustafa Kemal Çanakkale, Kafkas ve Suriye''de savaştı.",
      "18 Mart Kahramanı Cevat Paşa, Kutü''l-Amare kahramanı Halil Kut Paşa, Medine Müdafii Fahrettin Paşa''dır.",
      "Kazım Karabekir hem I. Dünya Savaşı Kafkas Cephesi''nde (1917-1918) hem de Kurtuluş Savaşı Doğu Cephesi''nde (1920) görev yaptı.",
      "Mondros 7. madde tüm Anadolu''yu işgale açtı, 24. madde Ermeni devleti için Vilayat-ı Sitte''yi hedef aldı; Paris''te İtilaf bloku ilk kez çatladı."
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.02',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  2,
  'Bölüm 2: İşgallere Tepki: Raporlar, Cemiyetler ve Amasya Genelgesi',
  '15 Mayıs 1919''da İzmir''in Yunanlılarca işgaline karşı ilk kurşunu atan gazeteci Hasan Tahsinin ardından Anadolu''da tepki dalgası yükseldi.  İzmir''in işgali, işgallerin geçici olmadığını ve vatanın parçalanmak istendiğini açıkça ortaya koyarak halkta milli bilincin hızla uyanmasını ve silahlı direniş olan Kuvay-ı Milliye ruhunun doğmasını sağladı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "15 Mayıs 1919''da İzmir''in Yunanlılarca işgaline karşı ilk kurşunu atan gazeteci **Hasan Tahsin**in ardından Anadolu''da tepki dalgası yükseldi. İzmir''in işgali, işgallerin geçici olmadığını ve vatanın parçalanmak istendiğini açıkça ortaya koyarak halkta milli bilincin hızla uyanmasını ve silahlı direniş olan Kuvay-ı Milliye ruhunun doğmasını sağladı. Dikkat et: İzmir''in işgalinin **ilk protesto edildiği yer** İstanbul Sultanahmet değil, Mustafa Kemal''in 19 Mayıs''ta Samsun''a çıkıp iç bölgelere geçmesinin hemen ardından kendi talimatıyla düzenlenen **Havza Mitingi**dir. Havza Genelgesi ile halka işgalleri mitinglerle protesto etmesi, ancak bu gösteriler sırasında azınlıklara zarar verilerek İtilaf Devletleri''nin 7. maddeyi işletmesine fırsat tanınmaması bildirildi. Ayrıca komutanlıklara ordunun dağıtılmaması ve silahların teslim edilmemesi yönünde uyarılar yapıldı."
  },
  {
    "type": "paragraph",
    "text": "İşgallerle ilgili hazırlanan iki uluslararası raporu birbiriyle karıştırmamalısın; bu raporlar yerel direnişin haklılığını dünya kamuoyuna duyurma açısından büyük önem taşır ve emperyalist işgal tezlerini çürütür:"
  },
  {
    "type": "bullets",
    "items": [
      "**Amiral Bristol Raporu:** Batı Anadolu''daki Yunan işgalinin haksızlığını, bölgede Türk nüfusun çoğunlukta olduğunu ve Türklerin haklılığını dünyaya duyuran **ilk uluslararası belge**dir.",
      "**General Harbord Raporu:** Doğu Anadolu''da Ermeni nüfusunun çoğunlukta olmadığını, katliam iddialarının asılsız olduğunu ve Amerikan mandasının bölgeye uygulanamayacağını ortaya koyan ABD raporudur."
    ]
  },
  {
    "type": "paragraph",
    "text": "Bu iki rapor, Anadolu''daki mücadelenin yalnızca yerel bir direniş değil, uluslararası hukuk ve nüfus gerçekleri açısından da meşru olduğunu göstermiştir."
  },
  {
    "type": "heading",
    "text": "Milli (Yararlı) Cemiyetler"
  },
  {
    "type": "paragraph",
    "text": "Mondros sonrasında İstanbul Hükümeti''nin işgallere sessiz kalması üzerine Anadolu halkı kendi bölgesini savunmak için Müdafaa-i Hukuk örgütlenmelerine yöneldi. Yararlı cemiyetler genellikle bölgesel kurtuluşu amaçlar ve basını kullanarak haklılığı savunurken, azınlıkların kurduğu Mavri Mira, Pontus Rum ve Hınçak-Taşnak cemiyetleri ile Türklerin kurduğu Sulh ve Selamet-i Osmaniye, Hürriyet ve İtilaf, İngiliz Muhipleri ve Wilson Prensipleri gibi zararlı cemiyetler bağımsızlık mücadelesini engellemeye çalıştı. Yararlı cemiyetler arasından bazıları özel nitelikleriyle sınavda öne çıkar:"
  },
  {
    "type": "bullets",
    "items": [
      "**Trakya-Paşaeli Müdafaa-i Hukuk Cemiyeti:** Osmanlı yıkılırsa bağımsız bir Trakya devleti kurma fikrini de gündemine alan cemiyettir.",
      "**Kilikyalılar Cemiyeti:** İsmi yabancı gibi görünse de **Adana ve Çukurova** bölgesini Fransız ve Ermeni işgaline karşı savunmak için kurulmuş **tamamen yararlı** bir Türk cemiyetidir!",
      "**Milli Kongre Cemiyeti:** Dr. Esat Işık öncülüğünde İstanbul''da kuruldu; diğer cemiyetlerden farklı olarak **bölgesel değil ulusal çapta** ve **silahla değil basın-yayın yoluyla** mücadele etti (\"Kuvay-ı Milliye\" tabirini ilk kez kullandı).",
      "**Doğu Anadolu Müdafaa-i Hukuk Cemiyeti:** Erzurum Kongresi''nin toplanmasında öncü rol oynayarak doğu illerinin Ermenilere verilmesini engellemek için çalıştı."
    ]
  },
  {
    "type": "heading",
    "text": "Amasya Genelgesi (22 Haziran 1919)"
  },
  {
    "type": "paragraph",
    "text": "Mustafa Kemal''in hazırlayıp Rauf Orbay, Ali Fuat Cebesoy, Refet Bele ve telgrafla Kazım Karabekir ile Cemal Paşa''nın onayını aldığı **Amasya Genelgesi**, Kurtuluş Savaşı''nın programını, gerekçesini ve ihtilal beyannamesini ortaya koydu. Genelgenin tek başına değil çok imzalı hazırlanmasının amacı hareketi **kişisellikten çıkarıp halka mal etmek ve kurumsallaştırmak**tı. Ayrıca Sivas''ta ulusal bir kongre toplanması çağrısı yapılarak dağınık yerel direnişin tek merkezde birleştirilmesi hedeflendi. Genelgede İstanbul Hükümeti''nin sorumluluğunu yerine getiremediği açıkça ilan edilerek ilk kez mevcut otoriteye karşı çıkılmış, aynı zamanda her ilden halkın güvenini kazanmış üçer delegenin gizlice Sivas''a gelmesi istenmiştir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin Amasya Genelgesi''nde en sık kullandığı iki tuzak vardır: Birincisi, genelgede imzası/onayı olan komutanlar arasına **İsmet İnönü**''yü çeldirici olarak koyar; **İsmet İnönü''nün Amasya Genelgesi''nde imzası yoktur**. İkincisi, \"Vatanın bütünlüğü tehlikededir\" maddesi savaşın **gerekçesi**, \"Milletin bağımsızlığını\" ifadesi **amacı**, **\"milletin azim ve kararı\"** ifadesi ise hem **yöntemi** hem de üstü kapalı **ulusal egemenlik (cumhuriyet)** vurgusudur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Aşağıdaki cemiyetlerden hangisi adını tarihi bir bölgeden aldığı halde yararlı cemiyettir ve hangisi basın-yayın yoluyla ulusal mücadele yürütmüştür?\" İlk sorunun cevabı **Kilikyalılar**, ikincisinin cevabı **Milli Kongre Cemiyeti**dir. Sivas Kongresi''ne kadar bu cemiyetlerin tamamı bölgesel kurtuluşu savunmuş, ancak Sivas''ta tek çatı altında birleşerek ulusal bir karaktere kavuşmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "İzmir''in işgalinin ilk protesto edildiği yer Mustafa Kemal''in talimatıyla düzenlenen Havza Mitingi''dir.",
      "Amiral Bristol Raporu Batı Anadolu''daki (Yunan), General Harbord Raporu Doğu Anadolu''daki (Ermeni) Türk haklılığını kanıtlar.",
      "Kilikyalılar yararlı cemiyettir; Milli Kongre Cemiyeti ulusal çapta ve basın-yayın yoluyla çalışmıştır.",
      "Amasya Genelgesi''nde İsmet İnönü''nün imzası yoktur; \"milletin azim ve kararı\" yöntem ve ulusal egemenlik mesajıdır."
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.03',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  3,
  'Bölüm 3: Kongreler, Amasya Görüşmeleri ve Misak-ı Milli',
  'Mustafa Kemal, Amasya Genelgesi''nin ardından sarayın görevden alma telgrafı üzerine 7-8 Temmuz 1919 gecesi resmi görevinden ve çok sevdiği askerlik mesleğinden istifa etti ("sine-i millete dönüş").  Bu kritik anda Erzurum''daki 15.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Mustafa Kemal, Amasya Genelgesi''nin ardından sarayın görevden alma telgrafı üzerine **7-8 Temmuz 1919 gecesi** resmi görevinden ve çok sevdiği askerlik mesleğinden **istifa etti** (\"sine-i millete dönüş\"). Bu kritik anda Erzurum''daki 15. Kolordu Komutanı **Kazım Karabekir**''in \"Emrinizdeyim Paşam\" diyerek bağlılığını bildirmesi, sivil kalan Mustafa Kemal''in Milli Mücadele önderliğini sürdürmesini sağladı. Kronolojik sıralamada istifa kesinlikle **Amasya Genelgesi''nden sonra, Erzurum Kongresi''nden önce** gerçekleşti."
  },
  {
    "type": "heading",
    "text": "Erzurum ve Sivas Kongreleri Farkları"
  },
  {
    "type": "paragraph",
    "text": "Doğu Anadolu''daki Ermeni ve Karadeniz''deki Pontus tehlikesine karşı toplanan Erzurum Kongresi ile tüm yurdu kapsayan Sivas Kongresi, yerel direnişi ulusal iradeye dönüştüren iki temel basamaktır. Sivas Kongresi''nde manda tartışmalarının kesin biçimde kapatılmasıyla birlikte \"ya istiklal ya ölüm\" çizgisi hareketin değişmez ilkesi haline gelmiştir."
  },
  {
    "type": "table",
    "headers": [
      "Konu",
      "Erzurum Kongresi",
      "Sivas Kongresi"
    ],
    "rows": [
      [
        "Toplanış ve Karar",
        "Toplanışı **bölgesel**, kararları **ulusal**",
        "Hem toplanışı hem kararları **ulusal**"
      ],
      [
        "Manda ve Himaye",
        "**İlk kez** reddedildi",
        "**Kesin olarak** (son kez) reddedildi"
      ],
      [
        "Cemiyetler",
        "Doğu Anadolu cemiyetleri birleştirildi",
        "Tüm cemiyetler **ARMHC** çatısında birleştirildi"
      ],
      [
        "Temsil Heyeti",
        "Doğu illerini temsilen 9 kişiyle kuruldu",
        "Tüm yurdu temsil eder hale getirildi"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Sivas Kongresi''nin ardından halkı doğru bilgilendirmek amacıyla **İrade-i Milliye** gazetesi çıkarıldı (Ankara''da ise Hakimiyet-i Milliye ve Anadolu Ajansı kurulacaktır). Temsil Heyeti''nin **Ali Fuat Paşa''yı Batı Cephesi Komutanlığı''na ataması**, Temsil Heyeti''nin ilk kez bir hükümet gibi **yürütme (icra) yetkisini** kullandığını gösterir. Yine Sivas Kongresi''ni engellemeye çalışan (Ali Galip Olayı) İstanbul Hükümeti ile haberleşmenin kesilmesi üzerine **Damat Ferit Paşa Hükümeti''nin istifa etmesi**, Milli Mücadele''nin İstanbul Hükümeti karşısındaki **ilk siyasi başarısı**dır. Bu gelişme, Anadolu hareketinin artık İstanbul''daki siyasi dengeleri doğrudan etkileyebildiğini ortaya koydu."
  },
  {
    "type": "heading",
    "text": "Amasya Görüşmeleri ve Misak-ı Milli (1919-1920)"
  },
  {
    "type": "paragraph",
    "text": "Damat Ferit''in istifasının ardından kurulan ılımlı Ali Rıza Paşa Hükümeti, Bahriye Nazırı Salih Paşa''yı Temsil Heyeti ile görüşmeye gönderdi. İmzalanan **Amasya Görüşmeleri** protokolü, **İstanbul Hükümeti''nin Temsil Heyeti''ni hukuken ilk kez tanıdığını** gösterir; böylece Anadolu hareketi başkent nezdinde resmi bir muhatap haline geldi. Bu görüşmeler sonucunda **Son Osmanlı Mebusan Meclisi** İstanbul''da toplandı; güvenlik nedeniyle Ankara''da toplanması teklifi kabul edilmediyse de Mustafa Kemal meclise gidecek mebuslardan kendi adına meclis başkanı seçilmeyi, Müdafaa-i Hukuk grubu kurulmasını ve Misak-ı Milli''nin kabulünü istedi. Meclis''te Mustafa Kemal''in istediği Müdafaa-i Hukuk grubu yerine Rauf Orbay başkanlığında **Felah-ı Vatan Grubu** kuruldu ve **28 Ocak 1920**''de **Misak-ı Milli** kabul edildi. Bu karar, Türk milletinin kabul edebileceği asgari barış sınırlarını dünyaya ilan eden temel belge oldu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin en büyük ters köşe sorusu **Misak-ı Milli** üzerindendir: **Misak-ı Milli kararlarında ulusal egemenlik, meclis veya cumhuriyetle ilgili HİÇBİR hüküm yoktur!** Misak-ı Milli yalnızca **ulusal bağımsızlığı** (sınırlar, kapitülasyonların kaldırılması, Boğazlar, azınlık hakları ve Kars-Ardahan-Batum ile Batı Trakya''da halk oylaması) kapsar."
  },
  {
    "type": "paragraph",
    "text": "Misak-ı Milli''nin kabulüne öfkelenen İtilaf Devletleri **16 Mart 1920**''de İstanbul''u resmen işgal edip Mebusan Meclisi''ni bastılar ve aydınları Malta''ya sürgün ettiler. Bu acı haberi Ankara''ya ulaştıran kahraman telgrafçı ise **Manastırlı Hamdi Bey**dir (Soyadı Kanunu ile **Martönü** soyadını almıştır). İstanbul''da meclisin kapatılması ise Mustafa Kemal''e Ankara''da yeni bir meclis açma konusunda tarihi bir meşruiyet zemini kazandırdı. Böylece Milli Mücadele''nin yönetim merkezi kesin olarak Ankara''ya taşındı ve halk iradesini temsil edecek TBMM''nin açılışı için seçimler başlatıldı."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Temsil Heyeti''ni ilk tanıyan, TBMM''yi tanıyan ilk devlet, ilk Müslüman devlet ve ilk büyük Avrupalı devlet sırasıyla kimlerdir?\" Temsil Heyeti''ni ilk tanıyan **İstanbul Hükümeti** (Amasya Görüşmeleri), TBMM''yi tanıyan ilk devlet **Ermenistan** (Gümrü), ilk Müslüman devlet **Afganistan**, ilk büyük Avrupalı devlet **Sovyet Rusya** (Moskova) ve ilk İtilaf devleti **Fransa**dır (1921 Ankara). Bu sıralama Milli Mücadele''nin diplomatik meşruiyetinin adım adım nasıl güçlendiğini gösterir."
  },
  {
    "type": "key_points",
    "items": [
      "Mustafa Kemal Amasya Genelgesi''nden sonra, Erzurum Kongresi''nden önce askerlikten istifa etti.",
      "Manda ve himayenin ilk reddi Erzurum, kesin reddi ve tüm cemiyetlerin ARMHC altında birleşmesi Sivas Kongresi''ndedir.",
      "Temsil Heyeti Ali Fuat Paşa''yı atayarak yürütme yetkisi kullandı; Amasya Görüşmeleri ile İstanbul Hükümeti Temsil Heyeti''ni tanıdı.",
      "Misak-ı Milli''de ulusal egemenlik/cumhuriyet yoktur, yalnızca tam bağımsızlık vardır; İstanbul''un işgalini Manastırlı Hamdi Bey bildirdi."
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.04',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  4,
  'Bölüm 4: I. TBMM, İsyanlar ve Sevr Antlaşması',
  'İstanbul''daki Mebusan Meclisi''nin basılıp dağıtılmasının ardından kaçabilen mebuslar ve yeni seçilen temsilciler Ankara''da bir araya geldi.  23 Nisan 1920''de açılan I.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İstanbul''daki Mebusan Meclisi''nin basılıp dağıtılmasının ardından kaçabilen mebuslar ve yeni seçilen temsilciler Ankara''da bir araya geldi. **23 Nisan 1920**''de açılan **I. TBMM**nin kimliğini doğru bilmek zorundasın: I. TBMM **kurucu, olağanüstü yetkili (güçler birliği) ve savaşçı** bir meclistir; meclis hükümeti sistemiyle çalıştığı için meclis başkanı aynı zamanda hükümetin de başkanıydı. Meclisin açılışının ertesi günü Mustafa Kemal''in sunduğu 24 Nisan Önergesi ile \"TBMM''nin üstünde hiçbir güç yoktur\" ilkesi benimsenerek ulusal egemenlik fiilen ilan edildi. Ancak önceliği vatanı düşmandan kurtarmak olduğu için toplumda bölünmeye yol açacak adımlardan kaçındı ve **kesinlikle inkılapçı bir meclis değildir** (yaptığı **tek inkılap** 1 Kasım 1922''de **Saltanatın Kaldırılması**dır). Mecliste siyasi partiler değil; Müdafaa-i Hukuk, Tesanüt, İstiklal, Halk Zümresi ve Islahat gibi çeşitli fikir grupları vardır; bu grupların varlığı meclis içi çoğulculuğu ve tartışma kültürünü yansıtır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM I. TBMM gruplarını sorarken seçeneklere mutlaka **Felah-ı Vatan Grubu**nu koyar. **Felah-ı Vatan Grubu I. TBMM''de değil, Son Osmanlı Mebusan Meclisi''nde** Rauf Orbay başkanlığında kurulmuştu! Ayrıca I. TBMM''nin kabul ettiği **1 Numaralı İlk Kanun**, Hıyanet-i Vataniye değil, bütçeye gelir sağlamak için çıkarılan **Ağnam Vergisinin (küçükbaş hayvan vergisi) Artırılması Hakkındaki Kanun**dur."
  },
  {
    "type": "heading",
    "text": "İsyanlar, Fetvalar ve Sevr Antlaşması"
  },
  {
    "type": "paragraph",
    "text": "TBMM açılır açılmaz hem İstanbul Hükümeti''nin kışkırtmalarıyla hem de İtilaf Devletleri''nin Boğazları ve işgal alanlarını korumak için çıkardığı iç ayaklanmalarla yüzleşti. Meclis kendi otoritesini korumak ve asker kaçaklarını önlemek için **Hıyanet-i Vataniye Kanunu**nu çıkardı ve üyeleri bizzat milletvekillerinden oluşan **İstiklal Mahkemeleri**ni kurdu (**Takrir-i Sükun Kanunu** ise 1925 Şeyh Sait İsyanı''ndadır). Şeyhülislam Dürrizade Abdullah''ın Milli Mücadele aleyhindeki fetvasına karşı Ankara Müftüsü **Mehmet Rıfat Börekçi** (Cumhuriyetin ilk Diyanet İşleri Başkanı) ve Anadolu müftüleri **Ankara Fetvası**nı yayımlayarak halkın dini duygularının sömürülmesini engelledi; böylece Anadolu''daki direnişin meşruiyeti halk nezdinde güçlendirildi."
  },
  {
    "type": "paragraph",
    "text": "Meclise karşı çıkan isyanlarda **Kuvay-ı İnzibatiye (Hilafet Ordusu)** ve **Ahmet Anzavur** doğrudan Damat Ferit Hükümeti ile İngiltere destekliyken; Bolu-Düzce, Yozgat ve Afyon ayaklanmaları yerel kışkırtmalarla çıktı. Eski Kuvay-ı Milliyeci olup düzenli ordu emrine girmemek için sonradan isyan edenler ise **Çerkez Ethem (Kuvay-ı Seyyare)** ve **Demirci Mehmet Efe**dir. Tüm bu ayaklanmaların bastırılması düzenli ordunun kuruluşunu geciktirse de TBMM''nin Anadolu üzerindeki otoritesini kesin olarak pekiştirdi. Batı Anadolu''daki Yunan ilerleyişi sırasında **Bursa''nın işgali** üzerine ise TBMM kürsüsüne kurtuluşa kadar **Puşide-i Siyah (Kara Örtü)** örtülmüştür; bu sembolik karar meclisin vatan topraklarına duyduğu bağlılığı gösteriyordu."
  },
  {
    "type": "paragraph",
    "text": "Anadolu''daki direnişi kırmak isteyen İtilaf Devletleri **10 Ağustos 1920 Sevr Antlaşması**nı İstanbul Hükümeti''ne imzalattı. Bu antlaşma Osmanlı''yı yalnızca küçük bir Anadolu toprağına hapsediyor, Doğu''da Ermenistan ve Kürdistan kurulmasını öngörüyor, Boğazları uluslararası bir komisyona bırakıyor, maliyeyi tamamen dış denetime açıyor ve kapitülasyonları tüm müttefiklere yayıyordu. Antlaşmayı Rıza Tevfik, Hadi Paşa ve Reşat Halis imzalarken, **Saltanat Şurası''nda Sevr''i imzalamayı reddeden tek üye Topçu Korgenerali Rıza Paşa**dır. Kanun-i Esasi''ye göre barış antlaşmalarının Mebusan Meclisi''nden geçmesi zorunlu olduğu ve meclis kapalı bulunduğu için Sevr, tıpkı Ayastefanos gibi **hukuken geçersiz (ölü doğmuş)** bir belgedir; TBMM de imzalayanları vatan haini ilan etmiştir. Sevr''in bu ağır şartları, Anadolu halkının TBMM etrafında kenetlenmesini hızlandırdı ve bağımsızlık savaşını kaçınılmaz kıldı."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"I. TBMM''nin olağanüstü ve kurucu nitelik taşımasının kanıtları nelerdir?\" Yasama-yürütme-yargıyı (**güçler birliği**) kendinde toplaması savaş şartlarında hızlı karar alma zorunluluğundandır; yeni bir anayasa (1921 Teşkilat-ı Esasiye) yapması ise kurucu niteliğinin kanıtıdır. Aynı şekilde meclis hükümeti sisteminin uygulanması da yürütmenin doğrudan meclise bağlı kalmasını sağlamıştır. Bu olağanüstü yetkiler sayesinde meclis hem cepheyi yönetmiş hem de iç isyanları bastırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "I. TBMM savaşçı ve kurucudur, inkılapçı değildir (tek inkılabı Saltanatın Kaldırılması); Felah-ı Vatan I. TBMM''de değil Osmanlı Meclisi''ndedir.",
      "I. TBMM''nin 1 numaralı ilk kanunu Ağnam Vergisinin Artırılmasıdır; Ankara Fetvası Rıfat Börekçi''ye aittir.",
      "Kuvay-ı İnzibatiye Hilafet Ordusudur; Kuvay-ı Seyyare Çerkez Ethem''e aittir.",
      "Sevr''i Saltanat Şurası''nda reddeden tek üye Topçu Rıza Paşa''dır; meclis onayından geçmediği için Sevr hukuken ölü doğmuştur."
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.05',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  5,
  'Bölüm 5: Doğu ve Güney Cepheleri ile Düzenli Orduya Geçiş',
  'Kurtuluş Savaşı''nın ilk askeri başarısı Doğu Cephesi''nden geldi.  Komutan Kazım Karabekir, Osmanlı''dan kalan dağılmamış 15.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Kurtuluş Savaşı''nın ilk askeri başarısı Doğu Cephesi''nden geldi. Komutan **Kazım Karabekir**, Osmanlı''dan kalan dağılmamış 15. Kolordu ile Ermenilerin Doğu Anadolu''daki işgal girişimlerine karşı harekete geçti ve Ermeni birliklerini yenilgiye uğrattı. Sarıkamış, Kars ve Gümrü''nün alınmasının ardından **3 Aralık 1920 Gümrü Antlaşması** imzalandı. Gümrü Antlaşması ile Ermenistan Sevr''deki toprak taleplerinden vazgeçti ve **TBMM''yi uluslararası alanda tanıyan ilk devlet** oldu. Bu zafer yalnızca doğudaki tehdidi ortadan kaldırmakla kalmadı, aynı zamanda buradaki birliklerin ve silahların Batı Cephesi''ne kaydırılmasına da imkan verdi. Ayrıca TBMM''nin ilk askeri ve siyasi başarısı olması bakımından Anadolu halkının düzenli mücadeleye olan inancını da artırdı. Ancak dikkat: **Doğu sınırımız Gümrü ile değil, Sakarya sonrası 1921 Kars Antlaşması ile kesinleşti**."
  },
  {
    "type": "heading",
    "text": "Güney Cephesi (Kuvay-ı Milliye Zaferi)"
  },
  {
    "type": "paragraph",
    "text": "Mondros sonrası önce İngilizlerin, ardından gizli antlaşma gereği Fransızların Ermeni intikam alaylarıyla birlikte işgal ettiği Güney Anadolu''da düzenli ordu savaşmamış, bölge halkının oluşturduğu **Kuvay-ı Milliye** birlikleri destansı bir direniş göstermiştir (**Kazım Karabekir Güney Cephesi''nde yoktur!**). İlk direniş kurşunu Hatay Dörtyol''da **Kara Hasan Paşa** tarafından atıldı. Bölge halkının kendi imkanlarıyla yürüttüğü bu savunma, Fransa''nın Anadolu''daki direnişi kolayca kıramayacağını görmesini sağladı ve ileride imzalanacak 1921 Ankara Antlaşması''nın yolunu açtı. Güney Cephesi''ndeki direniş aynı zamanda şehirlerin yerel önderler etrafında nasıl örgütlendiğini göstermesi açısından da büyük önem taşır; nitekim bu direniş sayesinde Fransa Doğu''daki İngiliz siyasetinden ayrışmaya başlamıştır. Şehir kahramanlarını mutlaka eşleştirerek bilmelisin:"
  },
  {
    "type": "bullets",
    "items": [
      "**Adana:** **Tufan Bey** (Yüzbaşı Osman) — Pozantı Kongresi sonrası Çukurova direnişini örgütledi.",
      "**Antep:** **Şahin Bey** — Savaş henüz sürerken **1921** yılında **\"Gazi\"** unvanını alan **tek şehir** Gaziantep''tir!",
      "**Maraş:** **Sütçü İmam** — **1973**''te \"Kahraman\" unvanını aldı.",
      "**Urfa:** **Ali Saip Bey** (Ursavaş) — **1984**''te \"Şanlı\" unvanını aldı."
    ]
  },
  {
    "type": "paragraph",
    "text": "Bu dört şehirdeki halk savunması, düzenli ordunun Batı Cephesi''nde zaman kazanmasına da büyük katkı sağladı."
  },
  {
    "type": "heading",
    "text": "Batı Cephesi''nde Düzenli Orduya Geçiş"
  },
  {
    "type": "paragraph",
    "text": "Yunan işgaline karşı Batı Anadolu''da kurulan Kuvay-ı Milliye birlikleri başlangıçta düşmanı oyalamış olsa da tek merkezden emir almamaları, askeri disiplinden yoksun olmaları ve ihtiyaçlarını bazen halktan zorla karşılamaları sorun yaratmaya başladı. Özellikle Yunan ordusunun Milne Hattı''nı aşarak Bursa ve Uşak yönünde geniş çaplı taarruza geçmesi üzerine düzenli bir savunma hattı kurmak kaçınılmaz hale geldi. Batı Cephesi''nde **Ali Fuat Cebesoy** komutasındaki Kuvay-ı Milliye birliklerinin gerçekleştirdiği **Gediz Taarruzu (1920)** başarısız olunca, yalnızca milis güçlerle düzenli Yunan ordusunun yurttan atılamayacağı kesinleşti. Bunun üzerine Kuvay-ı Milliye kaldırılarak **düzenli ordu** kuruldu; **Ali Fuat Cebesoy** ise **Moskova Büyükelçiliği**ne atandı. Batı Cephesi ilk aşamada **İsmet Bey (İnönü)** ve **Refet Bey (Bele)** komutasında ikiye ayrıldı; ancak düzenli orduya katılmak istemeyen Çerkez Ethem''in çıkardığı isyan bastırıldıktan sonra cephede birlik sağlandı. Böylece TBMM, hem iç cephede otoritesini kurmuş hem de Batı''da disiplinli bir savunma ordusu oluşturarak İnönü zaferlerine hazır hale gelmiştir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin Güney Cephesi''ndeki iki kesin tuzağı vardır: Birincisi, \"Kurtuluş Savaşı devam ederken TBMM tarafından unvan verilen şehir hangisidir?\" Cevap yalnızca **Gaziantep (1921)**tir; Kahramanmaraş ve Şanlıurfa unvanlarını Cumhuriyet döneminde çok daha sonra almıştır. İkincisi, Batı''da ilk kurşun İzmir''de **Hasan Tahsin** tarafından, Güney''de ilk kurşun ise Dörtyol''da **Kara Hasan Paşa** tarafından atılmıştır. Ayrıca Güney Cephesi''nde düzenli ordu değil, tamamen yerel halk direnişi olan Kuvay-ı Milliye savaşmıştır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Gediz Taarruzu''nun sonucu nedir?\" Disiplinsizlik yüzünden yaşanan bu yenilginin ardından Kuvay-ı Milliye lağvedilerek düzenli ordu kurulmuş ve Ali Fuat Cebesoy Moskova Büyükelçisi olarak görevlendirilmiştir. Düzenli ordunun kurulmasıyla birlikte askeri emir-komuta zinciri sağlanmış ve İnönü savaşlarındaki ilk büyük zaferlerin yolu açılmıştır. Bu süreçte Genelkurmay ve Milli Savunma teşkilatları da cephe ihtiyaçlarına göre yeniden düzenlenmiştir."
  },
  {
    "type": "key_points",
    "items": [
      "Gümrü Antlaşması ile Ermenistan TBMM''yi tanıyan ilk devlet oldu; doğu sınırının kesinleşmesi ise 1921 Kars Antlaşması iledir.",
      "Güney Cephesi''nde yalnızca Kuvay-ı Milliye savaştı: Adana Tufan Bey, Antep Şahin Bey, Maraş Sütçü İmam, Urfa Ali Saip Bey.",
      "Savaş sürerken unvan alan tek şehir Gaziantep''tir (1921).",
      "Gediz Taarruzu sonrası düzenli orduya geçildi ve Ali Fuat Cebesoy Moskova''ya atandı."
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.06',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  6,
  'Bölüm 6: Batı Cephesi: İnönü Savaşları, Sakarya ve Büyük Taarruz',
  'Düzenli ordunun ilk zaferi olan I.  İnönü Savaşı (Ocak 1921), Çerkez Ethem isyanıyla aynı günlerde kazanıldığı için hem askeri güveni artırdı hem de içte ve dışta büyük siyasi sonuçlar doğurdu.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Düzenli ordunun ilk zaferi olan **I. İnönü Savaşı** (Ocak 1921), Çerkez Ethem isyanıyla aynı günlerde kazanıldığı için hem askeri güveni artırdı hem de içte ve dışta büyük siyasi sonuçlar doğurdu. Bu zaferle birlikte TBMM''nin düzenli ordusunun Yunan ilerleyişini durdurabileceği anlaşıldı ve İtilaf Devletleri Ankara''yı diplomatik muhatap kabul etmek zorunda kaldı. Bu sonuçları **M-İ-L-A-T** şifresiyle sırasız değil, tam içeriğiyle bilmelisin:"
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "I. İnönü Savaşı''nın sonuçlarını **M-İ-L-A-T** şeklinde kodla: - **M**oskova Antlaşması (16 Mart 1921): Sovyet Rusya TBMM''yi tanıyan **ilk büyük Avrupalı devlet** oldu; ancak **Batum** Gürcistan''a bırakılarak Misak-ı Milli''den **ilk taviz** verildi. - **İ**stiklal Marşı (12 Mart 1921): Maarif Vekaleti yarışmasını kazanan Mehmet Akif Ersoy marşı **\"Kahraman Ordumuza\"** ithaf etti; Meclis''te ilk okuyan Hamdullah Suphi Tanrıöver oldu. İlk beste **Ali Rıfat Çağatay**a, günümüzdeki beste **Osman Zeki Üngör**e aittir. - **L**ondra Konferansı: İtilaf Devletleri hem İstanbul''u hem TBMM''yi çağırarak ikilik çıkarmak istedi; ancak Sadrazam **Tevfik Paşa** \"Söz milletin hakiki temsilcisi TBMM''ye aittir\" diyerek oyunu bozdu ve İtilaf Devletleri TBMM''yi **hukuken** tanıdı. - **A**fgan Dostluk Antlaşması: Afganistan TBMM''yi tanıyan **ilk Müslüman devlet** oldu. - **T**eşkilat-ı Esasiye (1921 Anayasası): **\"Hakimiyet bila kaydü şart milletindir\"** (1. madde) ilkesi konuldu; ancak **rejim adı (Cumhuriyet)** henüz yer almadı."
  },
  {
    "type": "paragraph",
    "text": "II. İnönü Zaferi''nin ardından yaşanan **Eskişehir-Kütahya Muharebeleri**nde ordu daha fazla kayıp vermemek için Mustafa Kemal''in emriyle Sakarya''nın doğusuna çekildi. Bu geri çekiliş TBMM''de büyük tartışmalara ve ordunun Ankara''dan Kayseri''ye taşınması önerilerine yol açtı; ancak Mustafa Kemal sorumluluğu bizzat üstlenerek **5 Ağustos 1921 Başkomutanlık Kanunu** ile Meclis''in yasama ve yürütme yetkilerini **ilk etapta 3 aylığına** devraldı. Hemen ardından ordunun acil yiyecek, giyecek ve cephane ihtiyacını karşılamak için **Sakarya Savaşı''ndan önce** (Meclis değil bizzat kendi imzasıyla) **Tekalif-i Milliye (Milli Yükümlülük) Emirleri**ni yayımladı ve halk topyekun seferber edildi."
  },
  {
    "type": "heading",
    "text": "Sakarya Meydan Muharebesi ve Büyük Taarruz"
  },
  {
    "type": "paragraph",
    "text": "23 Ağustos - 13 Eylül 1921''deki **Sakarya Meydan Muharebesi** (\"Subaylar Savaşı\" ve \"Melhame-i Kübra\"), Türk ordusunun **1683 II. Viyana Kuşatması''ndan beri süren geri çekilişini bitiren son savunma savaşı**dır. Çok sayıda genç subayın şehit düşmesi nedeniyle Subaylar Savaşı olarak anılan bu muharebede Mustafa Kemal **\"Hatt-ı müdafaa yoktur, sath-ı müdafaa vardır\"** emrini vermiş ve savaş sonrası TBMM tarafından kendisine **Gazilik** ve **Mareşallik** rütbesi verilmiştir. Sakarya''dan sonra Kafkas Cumhuriyetleriyle **1921 Kars Antlaşması** (doğu sınırı kesinleşti) ve Fransa ile **1921 Ankara Antlaşması** imzalandı. Ankara Antlaşması ile İtilaf Bloku parçalandı, Güney Cephesi kapandı; ancak **Hatay** Fransa mandasındaki Suriye''ye bırakılarak Misak-ı Milli''den **ikinci taviz** verildi. İtalya da bu zaferin ardından Anadolu''dan tamamen çekildi ve Yunanistan sahada yalnız kaldı."
  },
  {
    "type": "paragraph",
    "text": "Yaklaşık bir yıl süren taarruz hazırlıklarının ardından başlatılan 26-30 Ağustos **1922 Büyük Taarruz (Başkomutanlık Meydan Muharebesi)** ise Türk ordusunun kesin zaferiyle sonuçlanan **\"yurt kurtaran\"** savaştır; Mustafa Kemal''in **\"Ordular, ilk hedefiniz Akdeniz''dir, ileri!\"** emri Sakarya''da değil, Büyük Taarruz''da verilmiştir ve 9 Eylül''de İzmir düşman işgalinden kurtarılmıştır. Böylece Batı Anadolu''daki Yunan işgali tamamen sona ermiş ve diplomatik masaya galip devlet olarak oturmanın şartları oluşmuştur. Ayrıca bu zafer, İngiltere''de Lloyd George hükümetinin düşmesine ve İtilaf Devletleri''nin Anadolu''daki işgal siyasetinden tamamen vazgeçmesine yol açmıştır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin sıkça karıştırdığı üç ayrıntıyı netleştir: - **Tekalif-i Milliye Emirleri**ni Meclis değil bizzat Başkomutan Mustafa Kemal çıkardı (Sakarya''dan hemen önce). - **\"Hatt-ı müdafaa yoktur\"** sözü **Sakarya**''da, **\"Ordular ilk hedefiniz Akdeniz''dir\"** sözü ise **Büyük Taarruz**da söylendi. - İstiklal Marşı''nın **ilk bestesi** Ali Rıfat Çağatay (1924-1930), **günümüzdeki bestesi** Osman Zeki Üngör''dür."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"TBMM''nin Misak-ı Milli''den verdiği üç taviz sırasıyla hangi antlaşmalardadır?\" 1. Taviz **Batum** (1921 Moskova), 2. Taviz **Hatay** (1921 Ankara), 3. Taviz **Musul** (1926 Ankara)."
  },
  {
    "type": "key_points",
    "items": [
      "I. İnönü sonuçları M-İ-L-A-T''tır; Batum ilk taviz, Tevfik Paşa Londra''da ikiliği önleyen sadrazamdır.",
      "Başkomutanlık Kanunu başlangıçta 3 aylığına verildi; Tekalif-i Milliye Sakarya''dan önce Mustafa Kemal tarafından çıkarıldı.",
      "Sakarya son savunma savaşıdır; ardından Kars (kesin doğu sınırı) ve 1921 Ankara (Fransa, Güney Cephesi kapandı, Hatay tavizi) imzalandı.",
      "Büyük Taarruz yurt kurtaran savaştır ve \"Ordular ilk hedefiniz Akdeniz''dir\" emri burada verildi."
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
  'tarih.kurtulus_savasi_hazirlik_ve_cepheler.07',
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  7,
  'Bölüm 7: Mudanya Ateşkesi ve Lozan Barış Antlaşması',
  'Büyük Taarruz''un ardından Türk ordusunun Çanakkale ve İstanbul yönüne ilerlemesi üzerine İngiltere''nin müttefiklerinden (Fransa ve İtalya) beklediği askeri desteği bulamaması ve dominyonlarının yeni bir savaşı reddetmesi, İtilaf Devletleri''ni ateşkes istemeye zorladı.  Çanakkale Krizi olarak bilinen bu gerginliğin ardından taraflar masaya oturdu.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Büyük Taarruz''un ardından Türk ordusunun Çanakkale ve İstanbul yönüne ilerlemesi üzerine İngiltere''nin müttefiklerinden (Fransa ve İtalya) beklediği askeri desteği bulamaması ve dominyonlarının yeni bir savaşı reddetmesi, İtilaf Devletleri''ni ateşkes istemeye zorladı. Çanakkale Krizi olarak bilinen bu gerginliğin ardından taraflar masaya oturdu. **11 Ekim 1922 Mudanya Ateşkes Antlaşması**nda TBMM''yi **İsmet İnönü** temsil etti. Bu diplomatik zafer sonucunda **Doğu Trakya (Edirne, Tekirdağ, Kırklareli), İstanbul ve Boğazlar** tek bir kurşun atılmadan (**savaşsız**) kurtarıldı! Doğu Trakya''yı **Trakya Yüksek Komiseri** sıfatıyla teslim alan komutan ise **Refet Bele** oldu. Mudanya ile İstanbul ve Boğazların yönetimi TBMM''ye bırakıldığı için **Osmanlı Devleti hukuken sona erdi** ve Milli Mücadele''nin silahlı safhası kapandı; böylece siyasi barış görüşmelerine geçildi."
  },
  {
    "type": "heading",
    "text": "Saltanatın Kaldırılması ve Lozan Konferansı"
  },
  {
    "type": "paragraph",
    "text": "Mudanya sonrası İtilaf Devletleri, barış görüşmeleri için Lozan''a hem TBMM''yi hem de İstanbul Hükümeti''ni davet ederek Londra Konferansı''ndaki ikilik oyununu tekrarlamak ve Türk tarafını zayıflatmak istedi. Bunun üzerine TBMM **1 Kasım 1922**''de **Saltanatı kaldırarak** bu oyunu kökten bozdu (I. TBMM''nin yaptığı **tek inkılap** budur) ve Lozan''da Türk milletinin tek meşru temsilcisi olarak yerini aldı. Son Osmanlı Padişahı Vahdettin''in yurt dışına çıkmasıyla birlikte 623 yıllık Osmanlı saltanatı fiilen de tarih sahnesinden çekilmiş oldu; halifelik makamı ise Abdülmecit Efendi''ye bırakılarak şimdilik korundu."
  },
  {
    "type": "paragraph",
    "text": "**24 Temmuz 1923 Lozan Barış Antlaşması**na TBMM adına İsmet İnönü, Rıza Nur ve Hasan Saka katıldı. Türk heyeti özellikle tam bağımsızlık, **kapitülasyonların kaldırılması** ve **Ermeni yurdu** kurulmaması konularında kesin taviz vermedi; bu yüzden ilk tur görüşmeler kesintiye uğrasa da ikinci turda uzlaşma sağlandı. Antlaşma ile kapitülasyonlar kesin olarak kaldırıldı, **Düyun-ı Umumiye**''nin siyasi ve mali denetimi bitirilip borçlar Osmanlı''dan ayrılan devletler arasında paylaştırıldı, Doğu''da Ermeni yurdu iddiaları tamamen kapandı ve Yunanistan''dan savaş tazminatı olarak **Karaağaç** alındı. Ayrıca Yunanistan ile nüfus mübadelesi kararlaştırıldı (İstanbul Rumları ve Batı Trakya Türkleri hariç tutuldu) ve yabancı okullar Türk kanunlarına tabi kılındı. Boğazlarda ise başkanlığını Türk temsilcinin yaptığı uluslararası bir komisyon kurularak geçiş serbestisi sağlandı; bu kısıtlama ancak 1936 Montrö Sözleşmesi ile tamamen kaldırılacaktır. Lozan Antlaşması, Türkiye Cumhuriyeti''nin uluslararası alanda bağımsız ve eşit bir devlet olarak tanındığı kurucu tapu senedidir ve sömürge altındaki diğer mazlum milletlere de örnek olmuştur. Antlaşmanın TBMM tarafından onaylanmasının ardından ittifak kuvvetleri Ekim 1923''te İstanbul''dan tamamen çekilmiştir ve Ankara hükümeti ülkenin tek hakimi konumuna yükselmiştir."
  },
  {
    "type": "table",
    "headers": [
      "Konu (Lozan''da)",
      "Çözüm Durumu",
      "Kritik Sınav Ayrıntısı"
    ],
    "rows": [
      [
        "Kapitülasyonlar",
        "**Kesin çözüldü**",
        "Tamamen kaldırıldı; ekonomik bağımsızlık sağlandı"
      ],
      [
        "Savaş Tazminatı",
        "**Çözüldü**",
        "Yunanistan tazminat olarak **Karaağaç**''ı Türkiye''ye verdi"
      ],
      [
        "Hatay (Suriye Sınırı)",
        "**Çözüldü** (Aleyhimize)",
        "1921 Ankara Antlaşması sınırları kabul edildi (1939''da katıldı)"
      ],
      [
        "Musul (Irak Sınırı)",
        "**Çözülemedi!**",
        "Lozan''da çözülemeyen **TEK** konudur; ikili görüşmelere bırakıldı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin en klasik Lozan tuzağı şudur: **\"Lozan''da çözülemeyip sonraya bırakılan tek konu hangisidir?\"** Birçok aday Hatay şıkkına gider; oysa **Hatay Lozan''da (aleyhimize de olsa) çözülmüştür**. Lozan''da çözülemeyip Türkiye ile İngiltere arasında 9 aylık ikili görüşmelere bırakılan **yegane konu Musul Sorunu (Irak Sınırı)**dır! Musul daha sonra Şeyh Sait İsyanı''nın yarattığı iç zayıflık nedeniyle **1926 Ankara Antlaşması** ile Irak''a (İngiltere mandasına) bırakıldı ve böylece Misak-ı Milli''den verilen bir taviz gerçekleşti."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Mudanya Ateşkesi ile savaş yapılmadan kurtarılan bölgeler nerelerdir ve Doğu Trakya''yı kim teslim almıştır?\" Savaşsız kurtarılan yerler **Doğu Trakya, İstanbul ve Boğazlar**dır; Doğu Trakya''yı teslim alan Trakya Yüksek Komiseri ise **Refet Bele**dir. Bu başarı İsmet İnönü''nün Lozan başdelegeliğine seçilmesinde de etkili olmuştur. Mudanya sonrasında İstanbul Hükümeti''nin tamamen devre dışı kalması ise Lozan''da tek temsilci olarak TBMM''nin oturmasını sağlamıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Mudanya Ateşkesi (11 Ekim 1922) ile Doğu Trakya (Refet Bele tarafından teslim alındı), İstanbul ve Boğazlar savaşsız kurtarıldı; Osmanlı hukuken sona erdi.",
      "Lozan''da ikilik çıkmasını önlemek için 1 Kasım 1922''de Saltanat kaldırıldı (I. TBMM''nin tek inkılabı).",
      "Lozan''da kapitülasyonlar kaldırıldı, Karaağaç alındı, Hatay aleyhimize çözüldü ve azınlıklar Türk vatandaşı sayıldı.",
      "Lozan''da çözülemeyip sonraya bırakılan TEK konu Musul Sorunu''dur (1926 Ankara ile kaybedildi)."
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
-- 📖 KADRO KONU ANLATIMI — Tarih · Atatürk İlke ve İnkılapları
-- Kaynak: docs/konu_anlatimi/tarih/06_ataturk_ilke_ve_inkilaplari.md
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
  'tarih.ataturk_ilke_ve_inkilaplari.01',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  1,
  'Bölüm 1: Mustafa Kemal''in Hayatı ve Siyasi Alandaki İnkılaplar',
  'Mustafa Kemal''in fikir dünyasının şekillendiği dönemleri ve görev yerlerini sınavda birbirine karıştırmamalısın.  Selanik''teki ilk ve orta öğreniminin ardından 1896-1899 yılları arasında okuduğu Manastır Askeri İdadisinde tarih öğretmeni Mehmet Tevfik Bilge''den tarih bilinci almış; Namık Kemal ve Mehmet Emin Yurdakul''un eserleriyle milliyetçilik ve hürriyet düşüncesini derinleştirmiştir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Mustafa Kemal''in fikir dünyasının şekillendiği dönemleri ve görev yerlerini sınavda birbirine karıştırmamalısın. Selanik''teki ilk ve orta öğreniminin ardından 1896-1899 yılları arasında okuduğu **Manastır Askeri İdadisi**nde tarih öğretmeni Mehmet Tevfik Bilge''den tarih bilinci almış; Namık Kemal ve Mehmet Emin Yurdakul''un eserleriyle milliyetçilik ve hürriyet düşüncesini derinleştirmiştir. Ayrıca Fransız aydınlanma düşünürleri Rousseau, Voltaire ve Montesquieu''nün eserlerini okuması, ileride kuracağı cumhuriyetin egemenlik ve hukuk anlayışına doğrudan yön vermiştir. Harp Okulu ve Harp Akademisi''ni tamamladıktan sonra atandığı **ilk görev yeri** olan **Şam 5. Ordu**da 1906 yılında arkadaşlarıyla **Vatan ve Hürriyet Cemiyeti**ni kurmuştur (İttihat ve Terakki''ye daha sonra üye olmuştur). Bu ilk örgütlenme deneyimi, onun meşrutiyet ve ulusal egemenlik fikirlerini erken yaşta sahaya taşıdığını gösterir."
  },
  {
    "type": "paragraph",
    "text": "Atatürk''ün kaleme aldığı eserler arasında **Nutuk** önemli bir yer tutar. 1927 yılında CHP 2. Kurultayı''nda 6 gün boyunca (36,5 saat) okunan Nutuk, Samsun''a çıkıştan gençliğe hitabeye kadar **1919-1927** yılları arasını kapsar; 1927 sonrası inkılapları ve 1938''e kadar olan dönemi içermez. Eser, Milli Mücadele''nin ve Cumhuriyetin kuruluş sürecinin bizzat kurucu lider tarafından belgelerle anlatıldığı temel kaynaktır. Atatürk''ün ayrıca **Geometri** kitabı (üçgen, açı, boyut gibi matematik terimlerini Türkçeleştirmiştir), **Cumalı Ordugahı**, **Bölüğün Muharebe Eğitimi** ve **Zabit ve Kumandan ile Hasbihal** gibi askeri eserleri vardır; **Zeytindağı** ise Falih Rıfkı Atay''a aittir. Bu eserlerin bilinmesi, Atatürk''ün yalnızca bir asker ve devlet adamı değil, aynı zamanda bilim ve dil konularında da öncü bir düşünür olduğunu ortaya koyar."
  },
  {
    "type": "heading",
    "text": "Siyasi İnkılaplar ve 3 Mart 1924 Paketi"
  },
  {
    "type": "paragraph",
    "text": "Cumhuriyetin ilanı ve öncesindeki siyasi düzenlemeler, ulusal egemenliği tek bir meclis çatısında toplamak ve devlet yapısını laik-çağdaş bir temele oturtmak için art arda hayata geçirildi. 1923 yazında kurulan II. TBMM''nin inkılapçı karakteri sayesinde bu dönüşüm hızlı bir yasama süreciyle gerçekleşti:"
  },
  {
    "type": "bullets",
    "items": [
      "**Saltanatın Kaldırılması (1 Kasım 1922):** Lozan Konferansı''na hem TBMM hem İstanbul Hükümeti çağrılınca ikiliği önlemek ve ulusal egemenliği tek elde toplamak için kaldırıldı. Dikkat: **1 Kasım 1922''de yalnızca saltanat kaldırıldı, halifelik henüz kaldırılmadı!** Bu ayrım, I. TBMM içindeki gelenekçi grupların tepkisini yumuşatarak kararın geçmesini kolaylaştırdı.",
      "**Ankara''nın Başkent Olması (13 Ekim 1923):** Cumhuriyetin ilanından 16 gün önce TBMM kararıyla yasalaştı; böylece yeni devletin siyasi merkezi İstanbul''daki eski monarşi mirasından ayrıştırıldı.",
      "**Cumhuriyetin İlanı (29 Ekim 1923):** Hükümet bunalımını aşmak için Meclis Hükümeti sisteminden **Kabine Sistemi**ne geçildi; ilk Cumhurbaşkanı Mustafa Kemal, ilk Başbakan **İsmet İnönü**, ilk Meclis Başkanı ise **Ali Fethi Okyar** oldu (Başkanlık sistemine değil, parlamenter kabine sistemine geçildi).",
      "**3 Mart 1924 Kanunları:** Aynı gün kabul edilen devrim paketiyle **Halifelik** kaldırılıp Osmanlı hanedanı yurt dışına çıkarıldı, **Tevhid-i Tedrisat Kanunu** kabul edildi, Şeriye ve Evkaf Vekaleti kaldırılıp **Diyanet İşleri Başkanlığı** kuruldu ve **Erkan-ı Harbiye Vekaleti** kaldırılarak hükümette sivil **Milli Savunma Bakanlığı** kurulurken askeri sevk ve idare için bağımsız **Genelkurmay Başkanlığı** oluşturuldu. Türkiye''nin ilk Genelkurmay Başkanı olan **Mareşal Fevzi Çakmak**, 1944 yılına kadar bu görevde kalarak ordunun siyasetten ayrı tutulmasında kilit rol oynadı.",
      "**1928 Anayasa Değişikliği:** **10 Nisan 1928**''de 1924 Anayasası''ndan **\"Devletin dini İslam''dır\"** maddesi çıkarıldı ve milletvekili yeminleri laikleştirildi (6 ilkenin anayasaya girişi ise **1937** yılındadır). Bu adımla devletin tüm inançlara eşit mesafede durması anayasal güvence altına alındı."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM adayların iki tarihi birbirine karıştırmasını ister: Saltanat **1 Kasım 1922**''de, Halifelik ise **3 Mart 1924**''te kaldırılmıştır. Ayrıca **Tekke ve Zaviyelerin Kapatılması** 3 Mart 1924 paketinde değil, **30 Kasım 1925**''tedir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Erkan-ı Harbiye Vekaleti''nin kaldırılıp Genelkurmay Başkanlığı ile Milli Savunma Bakanlığı''nın ayrılmasının temel amacı nedir?\" Cevap: Askerlik ile milletvekilliğini ayırarak **ordunun siyasete karışmasını kesin olarak önlemek**tir; ilk Genelkurmay Başkanı ise Mareşal Fevzi Çakmak''tır."
  },
  {
    "type": "key_points",
    "items": [
      "İlk görev yeri Şam''dır ve burada 1906''da Vatan ve Hürriyet Cemiyeti''ni kurdu; Nutuk 1919-1927 arasını anlatır.",
      "Saltanat 1922''de, Halifelik 3 Mart 1924''te kaldırıldı; Ankara Cumhuriyetten 16 gün önce başkent oldu.",
      "Cumhuriyet ile Meclis Hükümeti''nden Kabine Sistemi''ne geçildi; ilk Başbakan İsmet İnönü''dür.",
      "\"Devletin dini İslam''dır\" ibaresi 1928''de çıkarıldı; Atatürk ilkeleri 1937''de anayasaya girdi."
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
  'tarih.ataturk_ilke_ve_inkilaplari.02',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  2,
  'Bölüm 2: Çok Partili Hayat Denemeleri ve Rejim Karşıtı Olaylar',
  'Milli Mücadele''yi yürüten Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (ARMHC), 9 Eylül 1923''te sıfırdan değil, doğrudan teşkilatın partileşmesiyle Halk Fırkasına (sonradan CHP) dönüştü.  Atatürk, demokrasinin tek partiyle tam anlamıyla yerleşemeyeceğini, halkın farklı görüşlerinin mecliste temsil edilmesi ve hükümetin denetlenmesi gerektiğini düşündüğü için çok partili hayata geçişi destekledi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Milli Mücadele''yi yürüten Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (ARMHC), 9 Eylül 1923''te sıfırdan değil, doğrudan teşkilatın partileşmesiyle **Halk Fırkası**na (sonradan CHP) dönüştü. Atatürk, demokrasinin tek partiyle tam anlamıyla yerleşemeyeceğini, halkın farklı görüşlerinin mecliste temsil edilmesi ve hükümetin denetlenmesi gerektiğini düşündüğü için çok partili hayata geçişi destekledi. Bu amaçla Atatürk döneminde iki muhalefet partisi denemesi yapıldı; ancak her ikisi de inkılaplara ve laik cumhuriyet rejimine karşı çıkan çevrelerin sığınağı haline gelince sonlandırıldı ve Türkiye 1945''e kadar tek parti yönetimiyle inkılaplarını korudu."
  },
  {
    "type": "heading",
    "text": "Terakkiperver Cumhuriyet Fırkası ve Şeyh Sait İsyanı (1924-1925)"
  },
  {
    "type": "paragraph",
    "text": "**17 Kasım 1924**''te Kurtuluş Savaşı''nın önemli komutanlarından Kazım Karabekir, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele ve Adnan Adıvar tarafından kurulan **Terakkiperver Cumhuriyet Fırkası (TCF)**, Türkiye Cumhuriyeti''nin **ilk muhalefet partisi**dir. Ekonomide liberalizmi, tek dereceli seçim sistemini ve yerinden yönetimi savunan parti, tüzüğünde yer alan \"dini inançlara saygılıdır\" ifadesi nedeniyle kısa sürede saltanat ve hilafet yanlısı çevrelerin odağı haline geldi."
  },
  {
    "type": "paragraph",
    "text": "1925 başında Doğu''da **Şeyh Sait İsyanı** patlak verince mevcut Başbakan **Ali Fethi Okyar** isyanı bastırmakta yetersiz görülerek istifa etti. Yerine hükümeti kuran **İsmet İnönü**, **4 Mart 1925**''te hükümete basını denetleme ve olağanüstü önlemler alma yetkisi tanıyan **Takrir-i Sükun Kanunu**nu çıkardı ve **İstiklal Mahkemeleri**ni yeniden kurdu (isyan bölgesinde ve Ankara''da görev yaptı). İsyanla bağlantılı görülen TCF kapatıldı; ayrıca bu iç karışıklık nedeniyle Türkiye, İngiltere ile yürütülen Musul görüşmelerinde askeri gücünü masaya koyamadı ve **Musul Sorunu** 1926 Ankara Antlaşması''yla aleyhimize sonuçlandı. Böylece ilk çok partili hayat denemesi rejim güvenliği gerekçesiyle sona ermiş oldu ve ülke içi istikrarın sağlanmasına öncelik verildi."
  },
  {
    "type": "heading",
    "text": "İzmir Suikastı (1926), Serbest Cumhuriyet Fırkası ve Menemen (1930)"
  },
  {
    "type": "paragraph",
    "text": "**16 Haziran 1926**''da eski İttihatçıların Mustafa Kemal''e yönelik **İzmir Suikastı** girişimi önceden ortaya çıkarıldı; bu olay sonrası yapılan yargılamalarla eski İttihatçı muhalefet tasfiye edildi. Suikast girişimi, inkılaplara karşı yeraltı muhalefetinin sürdüğünü göstermiş ve cumhuriyet yönetiminin kararlılığını artırmıştır. Atatürk''ün Anadolu Ajansı''na verdiği **\"Benim naçiz vücudum elbet bir gün toprak olacaktır; fakat Türkiye Cumhuriyeti ilelebet payidar kalacaktır\"** ünlü sözü Cumhuriyetin ilanında değil, **İzmir Suikastı sonrasında** söylenmiştir."
  },
  {
    "type": "paragraph",
    "text": "1929 Dünya Ekonomik Bunalımı''nın yarattığı ekonomik sıkıntılar sırasında hükümetin ekonomi politikalarını denetlemek amacıyla **12 Ağustos 1930**''da Atatürk''ün isteğiyle arkadaşı **Ali Fethi Okyar** tarafından **Serbest Cumhuriyet Fırkası (SCF)** kuruldu (ekonomide devletçiliğe karşı liberalizmi savunan ikinci muhalefet partisi). Parti kısa sürede Ege Bölgesi''nde büyük bir ilgi gördü; ancak laiklik ve cumhuriyet karşıtlarının partiye sızarak odağı değiştirdiğini gören kurucusu Ali Fethi Okyar, yeni bir iç çatışmaya yol açmamak için partiyi **17 Kasım 1930''da kendiliğinden feshetti**. Fesih sonrasında ortaya çıkan siyasi boşlukta gerici çevrelerin kışkırtmaları sürdü."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "**EN BÜYÜK ÖSYM ÇELDİRİCİSİ:** Adayların çoğu İzmir Menemen''de Asteğmen Kubilay''ın şehit edildiği **Menemen Olayı (23 Aralık 1930)** yüzünden Serbest Cumhuriyet Fırkası''nın kapatıldığını zanneder! Kronolojiye dikkat et: SCF **Kasım 1930**''da kapandı; Menemen Olayı ise parti kapandıktan bir ay sonra **Aralık 1930**''da gerçekleşti! Bu iki olay toplumsal zeminde inkılapların henüz tam sindirilemediğini ve çok partili hayata geçişin erken olduğunu göstermiştir. Olay sonrası bölgede sıkıyönetim ilan edilmiş ve sorumlular Divan-ı Harp''te yargılanmıştır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Şeyh Sait İsyanı çıktığında başbakan kimdi ve isyanı bastırmak için hangi kanun çıkarıldı?\" İsyan başladığında başbakan **Ali Fethi Okyar**dı; istifası sonrası **İsmet İnönü** başbakan oldu ve **Takrir-i Sükun Kanunu** (1925) çıkarıldı (Hıyanet-i Vataniye 1920''dedir). Çok partili hayata kesin geçiş ise ancak II. Dünya Savaşı sonrası 1945-1946 yıllarında mümkün olabilecektir; bu tarihe kadar Türkiye tek parti hükümetiyle inkılaplarını yerleştirmiştir."
  },
  {
    "type": "key_points",
    "items": [
      "CHP, ARMHC''nin partileşmesiyle kuruldu; ilk muhalefet partisi TCF (1924), ikinci muhalefet partisi SCF''dir (1930).",
      "Şeyh Sait İsyanı sonrası Ali Fethi Okyar istifa etti, İsmet İnönü Takrir-i Sükun Kanunu''nu çıkardı; TCF kapatıldı ve Musul kaybedildi.",
      "\"Benim naçiz vücudum...\" sözü 1926 İzmir Suikastı sonrasında söylendi; bu olayla eski İttihatçı muhalefet tasfiye edildi.",
      "SCF kendi kendini feshettikten sonra Menemen Olayı (Aralık 1930) yaşandı."
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
  'tarih.ataturk_ilke_ve_inkilaplari.03',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  3,
  'Bölüm 3: Hukuk ve Eğitim-Kültür Alanındaki İnkılaplar',
  'Cumhuriyetin hukuk devriminde Osmanlı''dan kalan şer''i-örfi ikiliğinin ve kapitülasyon kalıntılarının ortadan kaldırılması hedeflendi; bu amaçla farklı Avrupa ülkelerinin en güncel, laik ve gelişmiş kanunları esas alındı.  Medeni Kanun ve Borçlar Kanunu (1926) İsviçre''den alınırken; Ceza Kanunu (1926) İtalya''dan, Ticaret Kanunu Almanya''dan, İdare Hukuku ise Fransa''dan alındı (tüm kanunların İsviçre''den alındığı yanılgısına düşme!',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cumhuriyetin hukuk devriminde Osmanlı''dan kalan şer''i-örfi ikiliğinin ve kapitülasyon kalıntılarının ortadan kaldırılması hedeflendi; bu amaçla farklı Avrupa ülkelerinin en güncel, laik ve gelişmiş kanunları esas alındı. **Medeni Kanun** ve **Borçlar Kanunu (1926)** **İsviçre**''den alınırken; **Ceza Kanunu (1926)** **İtalya**''dan, **Ticaret Kanunu** **Almanya**''dan, **İdare Hukuku** ise **Fransa**''dan alındı (tüm kanunların İsviçre''den alındığı yanılgısına düşme!). İsviçre Medeni Kanunu''nun seçilmesinde akılcı, pratik ve kadın-erkek eşitliğini esas alan en yeni metin olması etkili oldu."
  },
  {
    "type": "heading",
    "text": "Medeni Kanun ve Kadınlara Siyasi Haklar"
  },
  {
    "type": "paragraph",
    "text": "**17 Şubat 1926 Türk Medeni Kanunu** ile Mecelle yürürlükten kaldırıldı; tek eşlilik, resmi nikah, boşanmada ve mirasta kadın-erkek eşitliği, mahkemelerde şahitlik eşitliği ve meslek seçme özgürlüğü getirildi. Ayrıca azınlıkların kendi cemaat mahkemelerini kurma ayrıcalıkları sona erdirilerek tüm vatandaşlar tek bir hukuk sistemi altında eşitlendi ve patrikhanelerin dünyevi yetkileri kaldırıldı. Medeni Kanun ile toplumsal ve ailevi alanda sağlanan bu eşitlik, birkaç yıl sonra kadınlara tanınacak siyasi hakların da toplumsal temelini oluşturdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin hukuk inkılabındaki değişmez kuralı şudur: **1926 Türk Medeni Kanunu''nda kadınlara SİYASİ HAKLAR (seçme ve seçilme) KESİNLİKLE YOKTUR!** Medeni Kanun yalnızca sosyal, hukuki ve ekonomik hakları düzenler. Kadınlara siyasi haklar 1930-1934 arasında ayrı yasalarla verilmiştir."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Kadınlara siyasi hakların veriliş sırasını **B-M-M** (Belediye - Muhtarlık - Milletvekilliği) şeklinde kronolojik olarak aklında tut: - **1930:** **B**elediye seçimlerine katılma hakkı - **1933:** **M**uhtarlık seçimlerine katılma hakkı - **1934:** **M**illetvekili seçme ve seçilme hakkı Ayrıca öncü kadın isimleri de karıştırma: İlk Türk kadın hekim **Safiye Ali**, ilk Türk kadın bakan **Türkan Akyol** (1971), ilk Türk kadın başbakan ise **Tansu Çiller**dir."
  },
  {
    "type": "heading",
    "text": "Eğitim, Dil, Tarih ve Üniversite Reformu"
  },
  {
    "type": "paragraph",
    "text": "Eğitim ve kültür alanındaki yenilikler, yeni kurulan ulus-devletin fikri ve bilimsel altyapısını oluşturmak amacıyla birbirini tamamlayacak şekilde planlandı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Tevhid-i Tedrisat Kanunu (3 Mart 1924):** Tüm eğitim kurumları Milli Eğitim Bakanlığı çatısında toplandı, medreseler kapatıldı ve yabancı okulların denetimsizliğine son verildi (hem **Milliyetçilik** hem **Laiklik** ilkesidir; kanun olduğu için Devletçilik sanma!).",
      "**Harf İnkılabı (1 Kasım 1928) ve Millet Mektepleri (24 Kasım 1928):** Okuma yazmayı kolaylaştırmak ve Batı bilimiyle bütünleşmek için Latin esaslı yeni Türk harfleri kabul edildi; ardından yeni harfleri yetişkin halka öğretmek amacıyla **Millet Mektepleri** açıldı (**Halkevleri** 1932, **Köy Enstitüleri** ise 1940''ta kuruldu).",
      "**Türk Tarih Kurumu (TTK, 1931):** Ümmetçi ve hanedan merkezli tarih anlayışı yerine bilimsel ve milli Türk tarihini araştırmak için kuruldu. İlk adı Türk Tarihi Tetkik Cemiyeti''dir; **ilk başkanı Tevfik Bıyıklıoğlu**, resmi yayın organı ise **Belleten** dergisidir.",
      "**Türk Dil Kurumu (TDK, 1932) ve Güneş Dil Teorisi:** Türkçeyi yabancı kelimelerin etkisinden arındırıp bilim ve kültür dili haline getirmek için kuruldu; halk ağzından derlemeler yapılarak öz Türkçe kelimeler canlandırıldı. 1935-1936''da Viyanalı dilbilimci Hermann Kvergic''in çalışmasıyla Atatürk''ün desteklediği **Güneş Dil Teorisi**, Türkçenin kökenini doğaya ve güneşe bağlayan dil kuramıdır.",
      "**Halkevleri (19 Şubat 1932):** 9 farklı şubeyle kültür ve inkılapları halka yaydı; yayın organı **Ülkü** dergisidir (Şevket Süreyya Aydemir ve Yakup Kadri''nin çıkardığı **Kadro** dergisiyle karıştırma).",
      "**1933 Üniversite Reformu:** İsviçreli Prof. Albert Malche''nin raporu doğrultusunda Osmanlı''dan kalan ve çağın bilimsel gelişmelerine ayak uyduramayan **Darülfünun** kapatılarak **İstanbul Üniversitesi**ne dönüştürüldü (Ankara Üniversitesi ise sonradan kurulmuştur). Aynı dönemde Almanya''dan kaçan pek çok bilim insanı da Türkiye''ye davet edilerek üniversite kadroları güçlendirildi."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1926 Medeni Kanunu aşağıdakilerden hangisini sağlamamıştır?\" Doğru yanıt daima **\"Kadınlara seçme ve seçilme hakkı tanınması\"** veya siyasi temsille ilgili bir seçenek olur. Siyasi haklar 1930-1934 arasında aşamalı olarak tanınmıştır; böylece Türk kadını pek çok Avrupa ülkesinden daha önce seçme ve seçilme hakkına kavuşmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "Medeni/Borçlar İsviçre''den, Ceza İtalya''dan, Ticaret Almanya''dan, İdare Hukuku Fransa''dan alındı.",
      "Medeni Kanun''da siyasi hak yoktur; kadınlara siyasi haklar B-M-M (1930 Belediye, 1933 Muhtarlık, 1934 Milletvekilliği) sırasıyla verildi.",
      "Yetişkinlere okuma-yazma için Millet Mektepleri (1928) açıldı; TTK''nin ilk başkanı Tevfik Bıyıklıoğlu, dergisi Belleten, Halkevleri''nin dergisi Ülkü''dür.",
      "1933 Üniversite Reformu ile Darülfünun İstanbul Üniversitesi''ne dönüştürüldü."
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
  'tarih.ataturk_ilke_ve_inkilaplari.04',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  4,
  'Bölüm 4: Toplumsal ve Ekonomik Alandaki İnkılaplar',
  'Toplumsal alandaki düzenlemeler çağdaş görünümü sağlamak, laikleşmeyi pekiştirmek, günlük yaşamda ve uluslararası ticarette Avrupa ile uyumu yakalamak ve ayrıcalıksız bir toplum ku',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Toplumsal alandaki düzenlemeler çağdaş görünümü sağlamak, laikleşmeyi pekiştirmek, günlük yaşamda ve uluslararası ticarette Avrupa ile uyumu yakalamak ve ayrıcalıksız bir toplum kurmak amacıyla yapıldı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Şapka Kanunu (25 Kasım 1925):** Mustafa Kemal şapkayı İzmir veya İstanbul''da değil, **23-31 Ağustos 1925 Kastamonu ve İnebolu gezisi**nde bizzat halka tanıttı; kanunla birlikte kılık kıyafette ikilik ve statü göstergeleri kaldırıldı.",
      "**Tekke, Zaviye ve Türbelerin Kapatılması (30 Kasım 1925):** Atatürk''ün **\"Türkiye Cumhuriyeti şeyhler, dervişler, müritler, mensuplar memleketi olamaz\"** sözü Halifeliğin kaldırılmasında değil, **677 sayılı bu kanun** sırasında söylenmiştir.",
      "**Takvim, Saat, Ölçü ve Soyadı:** Batı ile ticari ve resmi işlemlerde yaşanan aksaklıkları gidermek için 1926''da miladi takvim ve uluslararası saat, 1931''de metre ve kilogram kabul edildi (1935''te ise hafta tatili cuma gününden pazara alındı). **1934 Soyadı Kanunu** ile resmi işlemlerdeki karışıklık önlenirken, **hacı, hoca, hafız, molla, bey, paşa** gibi ayrıcalık bildiren unvanlar yasaklandı."
    ]
  },
  {
    "type": "heading",
    "text": "Ekonomi Politikaları ve Kurumsal Yatırımlar"
  },
  {
    "type": "paragraph",
    "text": "**1923 İzmir İktisat Kongresi**nde belirlenen hedefler doğrultusunda özel girişimi destekleyen adımlar atıldı. **Kazım Karabekir** başkanlığında toplanan kongrede **Misak-ı İktisadi** kararları alındı; komünist/kolektivist model kesinlikle reddedilerek özel teşebbüsü destekleyen **liberal ve milli bir karma ekonomi** benimsendi (Devletçilik ilkesine henüz 1923''te değil, 1929 Dünya Ekonomik Bunalımı sonrasında geçilmiştir). Kongreye çiftçi, tüccar, sanayici ve işçi temsilcilerinin katılması da ekonomik kalkınmanın toplumsal uzlaşıyla planlandığını gösterir."
  },
  {
    "type": "table",
    "headers": [
      "Ekonomik Adım / Kurum",
      "Yıl",
      "Temel Amaç ve Sınav Notu"
    ],
    "rows": [
      [
        "Türkiye İş Bankası",
        "1924",
        "İlk özel/ulusal banka; ilk Genel Müdürü **Celal Bayar** (Merkez Bankası 1930''da kuruldu)"
      ],
      [
        "Aşar Vergisinin Kaldırılması",
        "1925",
        "Devlet gelirlerinin yaklaşık dörtte birinden vazgeçilerek köylü rahatlatıldı (**Halkçılık + Laiklik**)"
      ],
      [
        "Atatürk Orman Çiftliği",
        "1925",
        "Ankara''da bataklık kurutularak kurulan modern tarım laboratuvarı"
      ],
      [
        "Kabotaj Kanunu",
        "1926",
        "Karasularımızda yabancı ayrıcalıklarına son verildi (**Milliyetçilik**)"
      ],
      [
        "Alpullu Şeker Fabrikası",
        "1926",
        "Türkiye''nin **üretime geçen ilk** şeker fabrikası (Uşak aynı yıl açıldı)"
      ],
      [
        "Teşvik-i Sanayi Kanunu",
        "1927",
        "Özel sektörü kalkındırma denemesi; başarısız olunca **Devletçilik** doğdu"
      ],
      [
        "Sümerbank",
        "1933",
        "**I. Beş Yıllık Sanayi Planı**nı finanse etmek ve tekstil kurmak için açıldı"
      ],
      [
        "MTA ve Etibank",
        "1935",
        "**MTA** yer altı madenlerini arar; **Etibank** finanse eder ve işletir"
      ],
      [
        "Karabük Demir-Çelik",
        "1937",
        "Temelini İsmet İnönü''nün attığı **ilk ağır sanayi** yatırımı (KARDEMİR)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "1929 Dünya Ekonomik Bunalımı''nın tarım fiyatlarını düşürmesi ve özel sermayenin yetersiz kalması üzerine 1930''lardan itibaren planlı sanayileşmeye geçildi. **I. Beş Yıllık Sanayi Planı (1933)** hazırlanırken Sovyetler Birliği''nden **Prof. Malışev** başkanlığındaki heyetten teknik rapor ve kredi desteği alındı; ancak Türkiye Sovyet rejimini değil, özel mülkiyeti koruyan **karma ekonomi temelli Devletçilik** modelini uyguladı. II. Beş Yıllık Sanayi Planı ise II. Dünya Savaşı''nın çıkması nedeniyle tam uygulanamadı. Sağlık alanında da Cumhuriyetin ilk Sağlık Bakanı adını taşıyan **Refik Saydam Hıfzıssıhha Enstitüsü** kurularak salgın hastalıklarla mücadele edildi, aşı üretimi yapıldı ve yurt dışına dahi kolera aşısı ihraç edildi. Ayrıca ulaşım alanında demiryolu ağının devletleştirilip yaygınlaştırılmasıyla iç pazar bütünlüğü sağlandı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki ilke ve kurum eşleştirmesini karıştırma: **Kabotaj Kanunu** ekonomi/denizcilikle ilgili olsa da karasularını millileştirdiği için doğrudan **Milliyetçilik**tir; **Aşar Vergisi**nin kaldırılması ise köylüye eşitlik ve refah getirdiği için öncelikle **Halkçılık** (şer''i vergi olduğu için de Laiklik) ilkesidir. Ayrıca 1924''te kurulan İş Bankası özel sermayeli milli bir bankayken, 1930''da kurulan **Türkiye Cumhuriyet Merkez Bankası** para basma yetkisine sahip devlet bankasıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1927 Teşvik-i Sanayi Kanunu''ndan beklenen sonucun alınamaması aşağıdakilerden hangisini hızlandırmıştır?\" Cevap: Özel sermaye yetersizliği üzerine 1930''larda **Devletçilik** politikasına ve planlı kamu sanayileşmesine geçilmesini hızlandırmıştır. 1929 Buhranı da bu geçişi zorunlu kılan dış etkendir; böylece devlet doğrudan fabrika ve banka kurarak sanayileşmenin lokomotifi olmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "Atatürk şapkayı Kastamonu-İnebolu''da tanıttı; \"şeyhler, dervişler...\" sözü Tekke-Zaviye kanununda (1925) söylendi.",
      "1923 İzmir İktisat Kongresi Kazım Karabekir başkanlığında liberal/milli çizgide toplandı; devletçilik 1929 Buhranı sonrası başladı.",
      "İlk şeker fabrikası Alpullu (1926), ilk ağır sanayi Karabük Demir-Çelik (1937), tekstil bankası Sümerbank (1933), maden ikilisi MTA-Etibank''tır (1935).",
      "Kabotaj = Milliyetçilik; Aşar''ın kaldırılması ve unvanların yasaklanması = Halkçılık."
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
  'tarih.ataturk_ilke_ve_inkilaplari.05',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  5,
  'Bölüm 5: Atatürk İlkeleri (Kavram ve Eşleştirme Rehberi)',
  'KPSS sorularında inkılapların hangi Atatürk ilkesiyle doğrudan ilişkili olduğu sıkça sorulur.  Bir inkılabın birden fazla ilkeyle bağı olabilir; ancak soru kökündeki anahtar kelime seni doğru ilkeye götürür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS sorularında inkılapların hangi Atatürk ilkesiyle doğrudan ilişkili olduğu sıkça sorulur. Bir inkılabın birden fazla ilkeyle bağı olabilir; ancak soru kökündeki anahtar kelime seni doğru ilkeye götürür. Atatürk''ün altı temel ilkesi birbirinden kopuk değildir; aksine ulusal egemenliği, toplumsal eşitliği, akılcılığı ve ekonomik bağımsızlığı aynı potada eriten bütüncül bir modernleşme projesidir (1931''de CHP programına girmiş, 5 Şubat 1937''de ise Anayasa''ya eklenmiştir). Bu ilkeler aynı zamanda birbirini tamamlar: Örneğin Cumhuriyetçilik olmadan Halkçılık, Laiklik olmadan çağdaş hukuk, Milliyetçilik olmadan ekonomik bağımsızlık düşünülemez."
  },
  {
    "type": "bullets",
    "items": [
      "**Cumhuriyetçilik:** Anahtar kavramları **ulusal egemenlik, meclis, seçim, oy kullanma, çok partili rejim ve anayasa**dır. Yönetim biçimi ve sandıkla ilgilidir; egemenliğin bir kişiye veya zümreye değil millete ait olmasını esas alır (Saltanatın kaldırılması, Cumhuriyetin ilanı, kadınlara 1930-1934 siyasi hakları, ordunun siyasetten ayrılması).",
      "**Milliyetçilik:** Anahtar kavramları **ulusal bağımsızlık, milli tarih-dil, milli ekonomi ve yabancı tekelinin kaldırılması**dır. Irkçılığı ve ümmetçiliği reddeder; \"Ne mutlu Türk''üm diyene\" anlayışıyla ortak kültür, tarih ve vatandaşlık bilincine dayanır (Kabotaj Kanunu, TTK, TDK, Tevhid-i Tedrisat''ta yabancı okulların denetimi, Hatay mücadelesi).",
      "**Halkçılık:** Anahtar kavramları **eşitlik, sosyal adalet, ayrıcalıkların kaldırılması ve halka hizmet**tir. Sınıf çatışmasını ve imtiyazlı grupları reddeder; devletin her vatandaşa kanun önünde eşit mesafede durmasını esas alır (Medeni Kanun''la kadın-erkek eşitliği, Aşar vergisinin kaldırılması, Soyadı Kanunu ile hacı/hoca/paşa gibi unvanların yasaklanması, Millet Mektepleri).",
      "**Laiklik:** Anahtar kavramları **akıl, bilim, din ve devlet işlerinin ayrılması, vicdan ve inanç özgürlüğü**dür. İnsanı dogmalardan kurtarıp bilimsel düşünceyi devlet yönetiminin ve eğitimin temeli yapar (Halifeliğin kaldırılması, Diyanet''in kurulması, Tekke-Zaviyelerin kapatılması, 1928''de devletin dini maddesinin çıkarılması).",
      "**Devletçilik:** Anahtar kavramları **ekonomik kalkınma, kamu yatırımı, fabrika, banka ve beş yıllık sanayi planları**dır. Sosyalizm veya komünizm değildir; özel mülkiyeti ve bireysel girişimi reddetmez, özel sektörün gücünün yetmediği büyük yatırımları devlet eliyle yaparak kalkınmayı hızlandırır (Sümerbank, Etibank, MTA, Karabük Demir-Çelik).",
      "**İnkılapçılık:** Anahtar kavramları **çağdaşlaşma, dinamizm, sürekli yenilenme ve tutuculuğu reddetme**dir. Yapılan yeniliklerin donup kalmasını önler, aklın ve bilimin rehberliğinde toplumun çağın gereklerine göre sürekli gelişimini, yenilenmesini ve ilerlemesini savunur."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin ilke sorularında üç klasik tuzağı vardır: 1. **Ulusal egemenlik** (içeride halkın yönetimi) = **Cumhuriyetçilik**; **Ulusal bağımsızlık** (dışa karşı özgürlük) = **Milliyetçilik**tir. 2. Soyadı Kanunu''nda **\"hacı, hoca, hafız\"** unvanlarının kaldırılması din kelimeleri nedeniyle Laiklik sanılır; oysa toplumda sınıf/ayrıcalık farkını kaldırdığı için doğrudan **Halkçılık**tır. 3. Devletçilik kesinlikle ekonomiyle ilgilidir; siyasi veya eğitim kanunları devlet tarafından çıkarıldığı için Devletçilik sayılmaz!"
  },
  {
    "type": "paragraph",
    "text": "Ayrıca ilkelerin bütüncül yapısını anlamak için bütünleyici ilkelere de dikkat etmelisin: **Milli egemenlik** Cumhuriyetçiliği, **milli bağımsızlık** ve **milli birlik-beraberlik** Milliyetçiliği, **akılcılık ve bilimsellik** Laikliği, **çağdaşlık ve batılılaşma** İnkılapçılığı, **yurtta barış dünyada barış** ise hem Milliyetçiliği hem de insanlık sevgisini tamamlar. Soru kökünde bu bütünleyici kavramlar geçtiğinde doğrudan bağlı olduğu ana ilkeye yönelmelisin. Sınavlarda sıkça yapılan bir diğer hata, bir inkılabı yalnızca tek bir ilkeyle sınırlı sanmaktır: Örneğin Tevhid-i Tedrisat Kanunu yabancı okulları denetim altına aldığı için Milliyetçilik, eğitimi çağdaş ve akılcı temele oturttuğu için Laiklik, tüm yurttaşlara eşit eğitim hakkı tanıdığı için de Halkçılık ile ilişkilidir. Bu çok yönlü bakış açısı, öncüllü ilke sorularında yanılmanı önler."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1) Kabotaj Kanunu, 2) Aşar vergisinin kaldırılması, 3) Sümerbank''ın kurulması. Bu üç gelişme sırasıyla hangi ilkelerle doğrudan ilgilidir?\" Cevap: 1) **Milliyetçilik**, 2) **Halkçılık**, 3) **Devletçilik**tir. Buna karşılık 1928''de anayasadan devletin dini ibaresinin çıkarılması doğrudan Laiklik ilkesinin gereğidir; bütünleyici ilkeler arasında ise milli birlik ve beraberlik ile akılcılık ve bilimsellik öne çıkar. Ayrıca kadınlara 1930-1934 yılları arasında tanınan seçme ve seçilme hakları hem Cumhuriyetçilik hem de Halkçılık ilkelerini birlikte güçlendirir."
  },
  {
    "type": "key_points",
    "items": [
      "Cumhuriyetçilik yönetim ve sandık (ulusal egemenlik), Milliyetçilik dış özgürlük ve milli değerlerdir (ulusal bağımsızlık).",
      "Halkçılık eşitlik ve imtiyazsızlık demektir (Aşar, Soyadı/unvanlar, Medeni Kanun).",
      "Devletçilik karma ekonomik kalkınmadır; özel sektörü yasaklamaz, onu tamamlar.",
      "İnkılapçılık statükoyu reddeder ve sürekli çağdaşlaşmayı savunur; bütünleyici ilkeler ana ilkeleri anlamca pekiştirir."
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
  'tarih.ataturk_ilke_ve_inkilaplari.06',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  6,
  'Bölüm 6: Atatürk Dönemi Türk Dış Politikası (1923-1938)',
  'Atatürk dönemi dış politikasının temel ilkesi "Yurtta sulh, cihanda sulh" (barışçı, gerçekçi, eşitliğe ve uluslararası hukuka dayalı diplomasi) anlayışıdır.  Bu dış politika iki belirgin evrede şekillendi: 1923-1930 arası Lozan''dan kalan sorunların barışçı yollarla çözümüne, 1930-1938 arası ise Almanya ve İtalya''nın saldırganlaşmasıyla yaklaşan II.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Atatürk dönemi dış politikasının temel ilkesi **\"Yurtta sulh, cihanda sulh\"** (barışçı, gerçekçi, eşitliğe ve uluslararası hukuka dayalı diplomasi) anlayışıdır. Bu dış politika iki belirgin evrede şekillendi: 1923-1930 arası Lozan''dan kalan sorunların barışçı yollarla çözümüne, 1930-1938 arası ise Almanya ve İtalya''nın saldırganlaşmasıyla yaklaşan II. Dünya Savaşı tehlikesine karşı bölgesel güvenlik ittifaklarına odaklanıldı. Türkiye bu süreçte yayılmacı emeller gütmeyen, mevcut uluslararası sınırları koruyan ve sorunları güç kullanmadan hukuk yoluyla çözmeye çalışan bir dış politika izledi."
  },
  {
    "type": "heading",
    "text": "Lozan Sonrası Sorunların Çözümü"
  },
  {
    "type": "bullets",
    "items": [
      "**Yabancı Okullar Sorunu:** Fransa başta olmak üzere bazı devletlerin müdahale etmek istediği bu konuda Türkiye, yabancı okulları Türk kanunlarına, Türk müfettişlerine ve Milli Eğitim müfredatına bağlayarak meseleyi **iç mesele** saydı ve uluslararası görüşmeyi reddetti (Fransa ile ayrıca Osmanlı Borçları ve Adana-Mersin demiryolları da görüşüldü).",
      "**Musul Sorunu (5 Haziran 1926 Ankara Antlaşması):** Şeyh Sait İsyanı''nın yarattığı iç sıkıntı nedeniyle Türkiye askeri harekat yapamadı ve **Musul ile Kerkük** İngiliz mandasındaki Irak''a bırakıldı (Hakkari Türkiye''de kaldı). Böylece Misak-ı Milli''den **üçüncü taviz** verildi; Irak petrollerinin %10''unun 25 yıl Türkiye''ye verilmesi kararlaştırıldı.",
      "**Nüfus Mübadelesi (10 Haziran 1930 Ankara Ahali Sözleşmesi):** Lozan''da kararlaştırılan nüfus değişiminde \"yerleşik\" (etabli) tanımı yüzünden Yunanistan ile yaşanan ve mallara el koyma krizine kadar tırmanan gerilim 1930''da aşıldı; İstanbul''daki Rumlar ile Batı Trakya''daki Türkler yerleşme tarihine bakılmaksızın yerleşik (**etabli**) sayıldı. Bu barış sonrasında Yunan Başbakanı **Elefterios Venizelos**, 1934 yılında Atatürk''ü **Nobel Barış Ödülü**ne aday gösterdi ve iki ülke arasında uzun süreli bir dostluk dönemi başladı."
    ]
  },
  {
    "type": "heading",
    "text": "Uluslararası Üyelikler, Paktlar ve Hatay"
  },
  {
    "type": "paragraph",
    "text": "1930''larda İtalya''nın Akdeniz''de ve Habeşistan''da, Almanya''nın ise Avrupa''da yayılmacı bir çizgiye yönelmesi Türkiye''yi hem batı hem doğu sınırlarını güvenceye almaya itti:"
  },
  {
    "type": "table",
    "headers": [
      "Gelişme",
      "Yıl",
      "Katılanlar / Karar",
      "Kritik Sınav Tuzağı"
    ],
    "rows": [
      [
        "Milletler Cemiyeti",
        "1932",
        "Türkiye davet üzerine üye oldu",
        "Başvurmadık; **İspanya** teklif etti, **Yunanistan** destekledi"
      ],
      [
        "Balkan Antantı",
        "1934",
        "**TAYYAR** (Türkiye, Yunanistan, Yugoslavya, Romanya)",
        "**Bulgaristan** (revizyonist) ve Arnavutluk katılmadı"
      ],
      [
        "Montrö Boğazlar Söz.",
        "1936",
        "Boğazlar Komisyonu kalktı; tam Türk egemenliği",
        "20 yıllık imzalandı ama **hala yürürlüktedir**"
      ],
      [
        "Sadabad Paktı",
        "1937",
        "Tahran''da Türkiye, İran, Irak, Afganistan",
        "**Suriye** o tarihte Fransız mandası altında olduğu için yer almadı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**Hatay Sorunu**nda ise Fransa 1936''da Suriye üzerindeki manda yönetimini sonlandırma kararı alınca Türkiye, Sancak (Hatay) bölgesinin Suriye''ye bırakılmasına karşı çıkarak konuyu Milletler Cemiyeti''ne taşıdı. İsveçli diplomat **Sandler''in hazırladığı Sandler Raporu** doğrultusunda Hatay''a özerklik tanındı (**Bristol** ve **Harbord** raporlarıyla karıştırma). 1938''de kurulan **Bağımsız Hatay Cumhuriyeti**nin ilk ve tek Cumhurbaşkanı **Tayfur Sökmen**, Başbakanı ise **Abdurrahman Melek** oldu. Atatürk''ün hastalığına rağmen Adana ve Mersin''de tatbikat yaptırıp \"Kırk asırlık Türk yurdu düşman elinde esir kalamaz\" ve \"Benim şahsi meselemdir\" dediği Hatay, Atatürk''ün vefatından sonra **1939** yılında kendi meclis kararıyla anavatana katıldı; bu birleşme Türkiye''nin barışçı diplomasiyle sınırlarını genişlettiği tek örnektir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Dış politikadaki iki güvenlik paktının katılımcılarını karıştırma: **Balkan Antantı**na revizyonist (mevcut sınırları değiştirmek isteyen) politikaları nedeniyle **Bulgaristan** ve İtalya etkisindeki Arnavutluk katılmamıştır. **Sadabad Paktı** ise Türkiye, İran, Irak ve Afganistan arasında doğu sınırlarını korumak için imzalanmıştır; Suriye o dönemde henüz bağımsız bir devlet olmayıp Fransız mandası altında bulunduğu için paktta yer almamıştır. Her iki pakt da yaklaşan II. Dünya Savaşı öncesinde Türkiye''nin bölgesel barış girişimlerinin ürünüdür."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türkiye''yi Milletler Cemiyeti''ne üyelik için teklif eden devlet hangisidir?\" İngiltere veya Fransa değil, teklifi sunan **İspanya** ve destekleyen **Yunanistan**dır. Türkiye barışçı politikaları sayesinde ilk kez doğrudan davetle üye olan ülkelerden biri olmuştur; bu üyelik aynı zamanda Türkiye''nin uluslararası sistemle bütünleşerek Montrö ve Hatay gibi dosyalarda diplomatik meşruiyet kazanmasını kolaylaştırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Yabancı Okullar iç mesele sayılarak çözüldü; 1926 Ankara Antlaşması ile Musul Irak''a bırakıldı.",
      "1930 Mübadele Antlaşması sonrası Yunan lider Venizelos Atatürk''ü 1934''te Nobel Barış Ödülü''ne aday gösterdi.",
      "Balkan Antantı''nda Bulgaristan yoktur; Sadabad Paktı Türkiye, İran, Irak ve Afganistan arasında imzalandı; Montrö ile Boğazlar Komisyonu kaldırıldı.",
      "Hatay''da Sandler Raporu etkili oldu; Cumhurbaşkanı Tayfur Sökmen, Başbakan Abdurrahman Melek''tir (1939''da katıldı)."
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
-- 📖 KADRO KONU ANLATIMI — Tarih · Çağdaş Türk ve Dünya Tarihi
-- Kaynak: docs/konu_anlatimi/tarih/07_cagdas_turk_ve_dunya_tarihi.md
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
  'tarih.cagdas_turk_ve_dunya_tarihi.01',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  1,
  'Bölüm 1: İki Savaş Arası Dünya, Türk Dünyası ve 1929 Buhranı',
  'I.  Dünya Savaşı sonrası kurulan SSCB''de Lenin''in 1924''te ölümünün ardından iktidarı alan Josef Stalin, serbest piyasa esnekliği tanıyan NEP politikasına son verdi; tarımda Kolektifleştirme (Kolhoz) ve beş yıllık ağır sanayi planlarını başlattı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "I. Dünya Savaşı sonrası kurulan **SSCB**''de Lenin''in 1924''te ölümünün ardından iktidarı alan **Josef Stalin**, serbest piyasa esnekliği tanıyan NEP politikasına son verdi; tarımda **Kolektifleştirme (Kolhoz)** ve beş yıllık ağır sanayi planlarını başlattı. Bu sert devletçi dönüşüm, SSCB''nin 1929 ekonomik krizinden Batılı ülkeler kadar etkilenmemesini sağlarken milyonlarca köylünün ağır bedel ödemesine yol açtı. Kızıl Ordu''nun kurucusu **Troçki** ise Stalin ile giriştiği iktidar mücadelesini kaybederek sürgüne gönderildi."
  },
  {
    "type": "heading",
    "text": "Türkistan ve Türk Dünyası Mücadelesi"
  },
  {
    "type": "paragraph",
    "text": "Çarlık Rusyası''nın yıkılmasından sonra Sovyet yönetiminin Orta Asya üzerindeki baskısını artırmasıyla Türkistan''da bağımsızlık mücadelesi başladı. Bu direnişe **Basmacı Hareketi** adı verildi; yerel direniş önderlerine **Koranbaşı** denirdi (Ergaş Koranbaşı gibi). I. Dünya Savaşı sonrası Türkistan''a geçen **Enver Paşa**, Basmacı Hareketi''nin başına geçerek liderleri birleştirdi ve çarpışırken şehit düştü (Talat Paşa Berlin''de, Cemal Paşa ise Tiflis''te şehit edilmişti). Her ne kadar Basmacı Hareketi Sovyet Kızıl Ordusu karşısında askeri olarak bastırılsa da Türkistan halklarının bağımsızlık bilincini canlı tuttu."
  },
  {
    "type": "paragraph",
    "text": "Türk dünyasının uyanışında dört büyük isim sınavda sıkça karşılaştırılır; her biri eğitim, basın ve siyaset alanlarında kalıcı izler bırakmıştır:"
  },
  {
    "type": "bullets",
    "items": [
      "**İsmail Gaspıralı:** Kırım Bahçesaray''da *Tercüman* gazetesini çıkardı, *Usul-i Cedid* okullarını açtı ve **\"Dilde, fikirde, işte birlik\"** şiarını yaydı.",
      "**Yusuf Akçura:** Kazan Türküdür; *Üç Tarz-ı Siyaset* makalesiyle Türkçülüğün temel metnini yazdı (Ziya Gökalp *Türkçülüğün Esasları*nı yazmıştır).",
      "**Zeki Velidi Togan:** Başkurt milli hükümet başkanı ve *Umumi Türk Tarihine Giriş* eserinin yazarıdır.",
      "**Mehmet Emin Resulzade:** **1918**''de kurulan **Azerbaycan Halk Cumhuriyeti**nin kurucu lideridir (1991 sonrası bağımsızlığın lideri olan **Ebulfez Elçibey** ile karıştırma)."
    ]
  },
  {
    "type": "heading",
    "text": "Meiji, 1929 Buhranı ve Totaliter Rejimler"
  },
  {
    "type": "paragraph",
    "text": "Uzak Doğu''da **1868**''de Japon İmparatoru Mutsuhito''nun başlattığı ve Japonya''yı feodal yapıdan sanayi gücüne taşıyan modernleşme hamlesine **Meiji Restorasyonu** denir (Kültür Devrimi ise Çin''de Mao Zedong tarafından yapılmıştır); bu sayede Japonya 20. yüzyıla Asya''nın en güçlü devleti olarak girdi. Avrupa''da ise kalıcı barışı korumak için imzalanan **1928 Briand-Kellogg Paktı** savaşı ulusal politikanın aracı olmaktan çıkararak kanun dışı saydı (1925 Locarno ise yalnızca Almanya''nın batı sınırlarıyla ilgiliydi)."
  },
  {
    "type": "paragraph",
    "text": "**1929 Dünya Ekonomik Buhranı (Kara Perşembe)** New York Borsası''nın çökmesiyle başlayıp tüm dünyaya yayıldı, işsizliği artırdı, uluslararası ticareti daralttı ve Avrupa''da otoriter rejimlerin güç kazanmasını hızlandırdı. Bu kriz karşısında ABD Başkanı F. D. Roosevelt 1933''te devlet müdahalesini artıran Keynesyen **New Deal (Yeni Düzen)** paketini uyguladı (Marshall Planı 1947''dedir); Türkiye ise döviz kıtlığını aşmak için dış ticarette malın malla değişimine dayalı **Kliring ve Takas** sistemine geçti ve korumacı devletçiliğe yöneldi (**IMF** ise 1944 Bretton Woods ile kurulmuş, Türkiye 1947''de üye olmuştur). Aynı süreçte Avrupa''da faşist İtalya lideri Mussolini Akdeniz''i canlandırmak için **Mare Nostrum (Bizim Deniz)** derken, Hitler 1923 Birahane Darbesi sonrası yazdığı *Kavgam (Mein Kampf)* kitabında Alman ırkı için Doğu Avrupa''ya yayılma doktrini olan **Lebensraum (Hayat Sahası)**nı savundu. İspanya İç Savaşı''ndaki yıkımı ise kübist ressam **Pablo Picasso** 1937 tarihli **Guernica** tablosuyla ölümsüzleştirdi (Salvador Dali ile karıştırma). Tüm bu ideolojik ve ekonomik gerilimler, Versay Antlaşması''nın yarattığı hoşnutsuzlukla birleşerek II. Dünya Savaşı''nın zeminini hazırladı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sınavda **1929 Buhranı** ile **II. Dünya Savaşı sonrası (1947)** önlemler karıştırılır: **New Deal** ve **Kliring-Takas** 1929 krizi önlemleridir; **Marshall Planı, Truman Doktrini ve IMF üyeliği** ise II. Dünya Savaşı sonrasına aittir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Üç Tarz-ı Siyaset eseri kime aittir ve ''Dilde, fikirde, işte birlik'' ilkesini kim savunmuştur?\" İlk sorunun cevabı **Yusuf Akçura**, ikincisinin cevabı **İsmail Gaspıralı**dır. Gaspıralı''nın çıkardığı Tercüman gazetesi ve açtığı Usul-i Cedid okulları, Kırım''dan Türkistan''a kadar bütün Türk dünyasında ortak eğitim ve kültür bilinci oluşturmayı amaçlamıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Stalin NEP''i bitirip Kolhoz''a geçti, Troçki sürgüne gitti; Basmacı Hareketi''nin yerel önderleri Koranbaşı''dır.",
      "Gaspıralı Tercüman, Akçura Üç Tarz-ı Siyaset, Togan Başkurt lideri, Resulzade 1918 Azerbaycan kurucusudur.",
      "Japonya Meiji Restorasyonu (1868), Briand-Kellogg (1928) savaşı kanun dışı saydı; Picasso Guernica''yı çizdi.",
      "İtalya Mare Nostrum, Almanya Hayat Sahası (Lebensraum) politikası izledi; 1929''da ABD New Deal, Türkiye Kliring-Takas ve devletçilik uyguladı."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.02',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  2,
  'Bölüm 2: II. Dünya Savaşı (1939-1945) ve Türkiye''nin Savaş Yılları',
  'Almanya savaştan önce Avusturya''yı ilhak etmiş (Anschluss) ve Çekoslovakya''nın Südet bölgesini almıştı; ancak II.  Dünya Savaşı resmen 1 Eylül 1939''da Almanya''nın Polonya''ya saldırmasıyla başladı (İngiltere ve Fransa 3 Eylül''de savaş ilan etti).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Almanya savaştan önce Avusturya''yı ilhak etmiş (**Anschluss**) ve Çekoslovakya''nın Südet bölgesini almıştı; ancak **II. Dünya Savaşı** resmen **1 Eylül 1939**''da Almanya''nın **Polonya**''ya saldırmasıyla başladı (İngiltere ve Fransa 3 Eylül''de savaş ilan etti). Fransa, Almanya sınırına güvenerek inşa ettiği güçlü **Maginot Hattı** savunma sisteminin aşılamayacağını düşünüyordu; ancak Alman ordusu Belçika ve Ardenler üzerinden bu hattı arkadan kuşatarak Fransa''yı hızla işgal etti. İşgal sonrasında teslimiyetçi **Vichy Hükümeti** (Petain) kuruldu; ancak **General Charles de Gaulle** Londra''ya geçerek BBC radyosundan Fransız direnişini yönetti."
  },
  {
    "type": "heading",
    "text": "Savaşın Dönüm Noktaları ve Sonu"
  },
  {
    "type": "paragraph",
    "text": "Savaşın kaderini belirleyen muharebeler Avrupa, Doğu Cephesi ve Pasifik''te Müttefiklerin üstünlüğü ele geçirmesiyle sonuçlandı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Stalingrad Muharebesi (1942-1943):** Sovyet Kızıl Ordusu Alman Mareşal Paulus''u durdurdu ve Almanların genel taarruz inisiyatifi tamamen kırıldı (Kursk ise tarihin en büyük tank savaşıdır).",
      "**Pearl Harbor Baskını (7 Aralık 1941):** Japonya''nın ABD Pasifik filosunu vurmasıyla ABD tarafsızlığı bırakıp savaşa girdi (ABD 6 ay sonra Haziran 1942 Midway''de Japon donanmasını yendi).",
      "**Normandiya Çıkarması (6 Haziran 1944):** Kod adı **Overlord Harekatı**dır; Müttefikler Batı Cephesi''ni açarak Fransa''yı kurtardı ve Almanya''yı iki cephe arasında sıkıştırdı (Meşale Harekatı Kuzey Afrika çıkarmasıdır).",
      "**Atom Bombaları ve Savaş Sonu:** Avrupa''da savaşın bitmesine ve Almanya''nın teslim olmasına karşın Japonya Pasifik''te teslim olmayı reddedince ABD 6 Ağustos 1945''te *Enola Gay* uçağıyla **Hiroşima**''ya (uranyum bombası), 9 Ağustos''ta **Nagazaki**''ye (plütonyum bombası) atom bombası attı (Tokyo yangın bombalarıyla vuruldu). Bu yıkımın ardından Japonya 14 Ağustos''ta teslim oldu ve II. Dünya Savaşı resmen sona erdi."
    ]
  },
  {
    "type": "heading",
    "text": "Konferanslar ve Türkiye''nin İç Politikası"
  },
  {
    "type": "paragraph",
    "text": "Savaş boyunca Müttefik liderler hem savaş stratejisini hem de savaş sonrası dünya düzenini belirlemek için bir dizi konferans düzenledi; Türkiye ise denge politikası izleyerek savaşa fiilen girmekten kaçındı:"
  },
  {
    "type": "table",
    "headers": [
      "Konferans / Olay",
      "Tarih",
      "Temel Karar ve Sınav Tuzağı"
    ],
    "rows": [
      [
        "Adana Yenice Görüşmesi",
        "1943",
        "İnönü ile Churchill tren vagonunda görüştü; Kahire Konferansı daha sonra toplandı"
      ],
      [
        "Yalta Konferansı",
        "1945",
        "1 Mart 1945''e kadar Almanya''ya savaş açanlar BM kurucusu olabilecek"
      ],
      [
        "San Francisco Konferansı",
        "1945",
        "**Birleşmiş Milletler (BM)** resmen kuruldu (Bretton Woods ekonomi, Potsdam Almanya konferansıdır)"
      ],
      [
        "Nürnberg Mahkemeleri",
        "1945-46",
        "Nazi yöneticilerinin insanlığa karşı suçlardan yargılandığı ilk uluslararası ceza mahkemesi"
      ],
      [
        "Paris Barış Antlaşması",
        "1947",
        "İtalya **On İki Ada**''yı (1912''den beri elindeydi) silahsızlandırma şartıyla **Yunanistan**''a bıraktı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Türkiye savaş boyunca topraklarını korurken olası bir işgal ihtimaline karşı karartma uyguladı, ekmek karnesi dağıttı, Köy Enstitülerini açarak kırsal kalkınmayı destekledi ve ekonomiyi sıkı denetim altına aldı: **1940 Milli Korunma Kanunu** ile hükümete ürünlere narh koyma ve zorunlu çalışma yetkisi verildi. **11 Kasım 1942 Varlık Vergisi** ile savaş zenginlerinden ve tüccarlardan bir defaya mahsus servet vergisi istendi; vergiyi ödeyemeyenler Erzurum **Aşkale** çalışma kampına gönderildi (**Toprak Mahsulleri Vergisi** ise köylüden ayni alınan tarım vergisidir). Türkiye, 1945''te Yalta şartı gereği Almanya ve Japonya''ya kağıt üzerinde savaş ilan ederek BM''nin kurucu üyeleri arasında yerini aldı; böylece savaş dışı kalarak hem insan kaybını önledi hem de savaş sonrası uluslararası sisteme katıldı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki konferans tuzağına dikkat et: **İsrail Devleti**nin kuruluşu 1945 Yalta Konferansı''nda değil; 1947''de BM''de bölünme kararı alınmış, İsrail ise 1948''de kurulmuştur. Ayrıca **On İki Ada**, Trablusgarp''ta İtalya''ya geçici bırakılmıştı; Türkiye''nin itirazlarına rağmen **1947 Paris Antlaşması** ile Yunanistan''a devredilmiştir. Bu gelişme, II. Dünya Savaşı sonrası Ege Denizi''ndeki güç dengesini doğrudan etkilemiştir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Fransa''nın II. Dünya Savaşı öncesinde Almanya sınırına kurduğu savunma hattı hangisidir ve Fransa kıyılarına yapılan çıkarma hangisidir?\" Savunma hattı **Maginot Hattı**, Fransa kıyılarına yapılan büyük amfibi harekat ise **6 Haziran 1944 Normandiya Çıkarması (Overlord Harekatı)**dır. Normandiya''nın başarısı Avrupa''nın kurtuluşunu ve Almanya''nın teslimini hızlandırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Savaş 1 Eylül 1939''da Polonya işgaliyle başladı; de Gaulle Vichy''ye karşı direnişi yönetti.",
      "Doğu''da dönüm noktası Stalingrad, Pasifik''te ABD''yi sokan Pearl Harbor, Batı''yı açan Normandiya (Overlord)''dır.",
      "BM San Francisco''da kuruldu; Yalta''da Türkiye''nin BM kuruculuğu için savaş ilanı şartı kondu; On İki Ada 1947''de Yunanistan''a verildi.",
      "Türkiye''de 1940 Milli Korunma Kanunu ve 1942 Varlık Vergisi (Aşkale) uygulandı; İnönü-Churchill Adana''da görüştü."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.03',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  3,
  'Bölüm 3: Soğuk Savaş Dönemi ve Bloklaşma (1945-1960)',
  'II.  Dünya Savaşı sonrasında ABD önderliğindeki Batı (Kapitalist) Bloku ile SSCB önderliğindeki Doğu (Sosyalist) Bloku arasında sıcak çatışmaya dönüşmeyen ancak ideolojik, ekonomik, askeri ve teknolojik rekabete dayalı Soğuk Savaş başladı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "II. Dünya Savaşı sonrasında ABD önderliğindeki Batı (Kapitalist) Bloku ile SSCB önderliğindeki Doğu (Sosyalist) Bloku arasında sıcak çatışmaya dönüşmeyen ancak ideolojik, ekonomik, askeri ve teknolojik rekabete dayalı **Soğuk Savaş** başladı. SSCB''nin Boğazlar''dan üs, Kars ve Ardahan''dan toprak talep etmesi üzerine Türkiye güvenliğini sağlamak için Batı Bloku''na yaklaştı. Winston Churchill, 1946''da ABD''nin Fulton kentinde yaptığı konuşmada Sovyet etkisindeki Doğu Avrupa''yı tanımlamak için **\"Demir Perde\"** kavramını kullandı (**Berlin Duvarı** ise çok sonra, 1961''de inşa edilmiştir!)."
  },
  {
    "type": "heading",
    "text": "Batı Bloku, NATO ve 1953 Balkan Paktı"
  },
  {
    "type": "bullets",
    "items": [
      "**Truman Doktrini (12 Mart 1947):** ABD''nin Sovyet yayılmasını durdurmak (**Çevreleme Politikası**) amacıyla doğrudan **Türkiye ve Yunanistan**''a 400 milyon dolarlık askeri ve mali yardım sağladığı ilk belgedir; bu adımla ABD yalnızcılık politikasını (Monroe Doktrini) tamamen terk ederek Avrupa güvenliğinde başrolü üstlendi.",
      "**Marshall Planı (Haziran 1947):** Truman''dan farklı olarak tüm savaş mağduru Avrupa ülkelerine yönelik ekonomik kalkınma paketidir; Türkiye bu yardımla özellikle tarım, madencilik ve karayolu ulaşımında yatırımlar yaptı.",
      "**NATO (1949) ve Kore Savaşı:** Türkiye, Sovyet tehdidine karşı NATO''ya girmek istediyse de İngiltere ve İskandinav ülkeleri önce karşı çıktı. Bunun üzerine Türkiye 1950''de **Kore Savaşı**''na asker gönderdi; Türk Tugayı''nın **Kunuri Muharebeleri**ndeki başarısı ve fedakarlığı sonrasında Türkiye ve **Yunanistan** **18 Şubat 1952**''de eş zamanlı olarak NATO''ya kabul edildi. Böylece Türkiye Batı güvenlik şemsiyesi altına girmiş oldu.",
      "**1953 Balkan Paktı (Ankara Antlaşması):** Sovyet baskısına karşı **Türkiye, Yunanistan ve Yugoslavya** arasında imzalandı; 1954''te Bled İttifakı ile askeri ittifaka dönüştü ancak Kıbrıs sorununun çıkması ve Yugoslavya''nın SSCB ile ilişkilerini yumuşatmasıyla işlevini yitirdi (Atatürk dönemindeki 1934 **Balkan Antantı** ile karıştırma!)."
    ]
  },
  {
    "type": "heading",
    "text": "Doğu Bloku Kurumları, Uzay Yarışı ve Bağdat Paktı"
  },
  {
    "type": "paragraph",
    "text": "Doğu Bloku kurumlarının işlevlerini birbirine karıştırmamalısın: **Kominform** komünist partiler arasındaki **ideolojik** birliktir, **Komekon** Marshall Planı''na karşı kurulan **ekonomik** yardımlaşma örgütüdür, **Varşova Paktı (1955)** ise NATO''ya karşı kurulan **askeri** savunma ittifakıdır. Bu üç kurum aracılığıyla Sovyetler Birliği Doğu Avrupa ülkelerini hem siyaseten hem iktisaden hem de askeri olarak sıkı denetim altında tuttu. Yugoslavya lideri **Mareşal Tito** ise Sovyet uydusu olmayı reddedince 1948''de Kominform''dan ihraç edildi ve Doğu Bloku''ndan kopan ilk ülke oldu; ardından Türkiye ve Yunanistan ile 1953 Balkan Paktı''na yöneldi."
  },
  {
    "type": "paragraph",
    "text": "Uzay yarışında ilk büyük adımı ABD değil, **SSCB** attı: 3 Kasım **1957**''de fırlatılan **Sputnik 2** uydusuyla uzaya gönderilen ilk canlı, Sovyet sokak köpeği **Laika** oldu (maymun veya ABD yapımı değildir!). Ardından 1961''de Yuri Gagarin uzaya çıkan ilk insan oldu; ABD ise 1969''da Apollo 11 ile Ay''a ayak basarak yarışı dengeledi. Ortadoğu''da ise 1955''te Demokrat Parti döneminde Sovyetlerin güneye inmesini önlemek için Türkiye ve Irak öncülüğünde **Bağdat Paktı** kuruldu (İngiltere, İran ve Pakistan da katıldı); 1958 darbesiyle Irak pakttan ayrılınca örgütün merkezi Ankara''ya taşındı ve adı **CENTO** oldu (**1937 Sadabad Paktı** Atatürk dönemindedir, karıştırma!). Bu ittifakların tamamı Türkiye''nin Soğuk Savaş''ın ilk döneminde Batı güvenlik mimarisi içinde aktif rol aldığını gösterir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Soğuk Savaş''ta üç eşleştirmeyi sürekli ters sorar: 1. İlk **askeri** yardım belgesi **Truman Doktrini**, genel Avrupa **ekonomik** yardımı **Marshall Planı**dır. 2. **Kominform** ideolojik, **Komekon** ekonomik, **Varşova Paktı** askeri örgüttür. 3. Türkiye NATO''ya tek başına değil, **Yunanistan ile birlikte 1952''de** girmiştir; **1953 Balkan Paktı** ise 1934 Balkan Antantı''ndan farklı olarak Türkiye, Yunanistan ve Yugoslavya arasında kurulmuştur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Doğu Bloku''ndan Kominform''dan ihraç edilerek ilk kopan ülke hangisidir?\" Cevap: Mareşal Tito liderliğindeki **Yugoslavya**dır; Tito aynı zamanda 1953 Balkan Paktı''nda da yer almıştır ve Bağlantısızlar Hareketi''nin kurucu önderlerinden biri olmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "Churchill 1946''da \"Demir Perde\" dedi (Berlin Duvarı 1961''dedir); Truman askeri/mali, Marshall ekonomik yardımdır.",
      "Türkiye Kore''deki Kunuri başarısı sonrası 1952''de Yunanistan''la birlikte NATO''ya girdi; 1953 Balkan Paktı Türkiye-Yunanistan-Yugoslavya arasında kuruldu.",
      "Kominform ideolojik, Komekon ekonomik, Varşova Paktı askeridir; Sputnik 2 ile uzaya giden ilk canlı Sovyet köpeği Laika''dır.",
      "1955 Bağdat Paktı DP dönemindedir; Irak çıkınca merkezi Ankara''ya taşındı ve CENTO adını aldı."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.04',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  4,
  'Bölüm 4: Demokrat Parti Dönemi ve Çok Partili Siyaset (1945-1960)',
  'II.  Dünya Savaşı sonrası dünyada yükselen demokratikleşme rüzgarı, Birleşmiş Milletler Sözleşmesi''nin getirdiği çok partili yaşam beklentisi ve Türkiye''nin Batı Bloku ile bütünleşme arzusu, tek parti döneminden çok partili hayata geçişi hızlandırdı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "II. Dünya Savaşı sonrası dünyada yükselen demokratikleşme rüzgarı, Birleşmiş Milletler Sözleşmesi''nin getirdiği çok partili yaşam beklentisi ve Türkiye''nin Batı Bloku ile bütünleşme arzusu, tek parti döneminden çok partili hayata geçişi hızlandırdı. 1945''te Nuri Demirağ öncülüğünde Milli Kalkınma Partisi''nin kurulmasının ardından asıl büyük siyasi kırılma CHP içinden doğdu. Çiftçiyi Topraklandırma Kanunu görüşmeleri sırasında parti içi muhalefet belirginleşti ve CHP içindeki dört milletvekilinin (**C-A-F-R**: **C**elal Bayar, **A**dnan Menderes, **F**uat Köprülü, **R**efik Koraltan) parti içi demokrasi, anayasaya aykırı yasaların kaldırılması ve serbest seçim talep ederek verdiği **Dörtlü Takrir** önergesi reddedilince bu isimler partiden ayrılıp **7 Ocak 1946**''da **Demokrat Parti (DP)**yi kurdular (**Takrir-i Sükun** 1925 kanunudur, karıştırma!)."
  },
  {
    "type": "paragraph",
    "text": "1946 seçimleri iktidar kaygısıyla öne çekilip açık oy-gizli sayım usulüyle yapıldığı için muhalefetin tepkisini çekti ve **\"sopalı seçimler\"** olarak anıldı. Bu dönemde CHP içindeki yenilikçi kanat da seçim güvenliğinin artırılmasını savundu. Bu eleştiriler üzerine 1950 seçimleri öncesinde gizli oy-açık sayım, tek dereceli seçim ve Yüksek Seçim Kurulu aracılığıyla yargı denetimi ilkeleri kabul edilerek demokratik yarışın önü açıldı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM \"Dörtlü Takrir''i veren ve DP''yi kuran dört kurucu\" arasına mutlaka **Mareşal Fevzi Çakmak**ı çeldirici olarak koyar. Fevzi Çakmak 1946''da DP listesinden bağımsız milletvekili seçilmiş, ancak **Dörtlü Takrir imzacıları ve DP''nin kurucu dörtlüsü arasında yer almamıştır** (daha sonra 1948''de kurulan Millet Partisi''nin kurucu onursal başkanı olmuştur)."
  },
  {
    "type": "heading",
    "text": "1950 Beyaz İhtilali ve DP İktidarı"
  },
  {
    "type": "paragraph",
    "text": "**14 Mayıs 1950** genel seçimlerinde iktidarın kansız, barışçıl ve demokratik bir sandık değişimiyle CHP''den Demokrat Parti''ye geçmesi Türk siyasi tarihinde **\"Beyaz İhtilal\"** olarak adlandırıldı (**Kadife Devrim** ise 1989''da Çekoslovakya''daki barışçıl rejim değişimidir!). Cumhurbaşkanlığına **Celal Bayar**, Başbakanlığa ise **Adnan Menderes** getirildi. Böylece 27 yıllık kesintisiz CHP iktidarı demokratik seçimlerle devredilmiş ve Türkiye''de ilk kez barışçıl bir iktidar değişimi yaşanmış oldu. Bu değişim, çok partili demokratik düzenin sandık yoluyla işleyebildiğini göstermesi açısından Cumhuriyet tarihinde bir dönüm noktasıdır."
  },
  {
    "type": "paragraph",
    "text": "DP iktidarının ilk yıllarında Marshall yardımları, Kore Savaşı''nın yarattığı tarım talebi ve tarımda makineleşmenin etkisiyle hızlı bir ekonomik büyüme yaşandı; demiryolu ağırlıklı politikadan karayolu yapımına ve özel sektör teşvikine geçildi. DP hükümetinin mecliste gerçekleştirdiği **1 numaralı ilk icraat**, 1932''den beri yalnızca Türkçe okunan **ezanın Arapça aslıyla okunmasını serbest bırakan** kanunu (CHP''nin de oylarıyla) çıkarmak oldu. Ayrıca 1951''de **Atatürk Aleyhine İşlenen Suçlar Hakkında Kanun** çıkarıldı, Köy Enstitüleri öğretmen okullarına dönüştürüldü, Halkevleri kapatıldı ve Atatürk''ün naaşı 10 Kasım 1953''te Anıtkabir''e nakledildi. Aynı dönemde dış politikada NATO üyeliği, Balkan Paktı ve Bağdat Paktı gibi Batı yanlısı ittifaklara aktif katılım sağlandı; ayrıca 1954''te Türkiye Petrolleri Anonim Ortaklığı (TPAO) ve Vakıflar Bankası gibi önemli ekonomik kurumlar kuruldu. Dönemin en ağır iç bunalımlarından biri ise Kıbrıs meselesinin tırmandığı ortamda yaşanan ve İstanbul''daki gayrimüslim işyerlerinin tahrip edildiği **6-7 Eylül 1955 Olayları**dır. 1950''lerin sonuna doğru döviz darlığı, enflasyon, Tahkikat Komisyonu tartışmaları ve iktidar-muhalefet gerilimi arttı; bu süreç 27 Mayıs 1960 askeri müdahalesine giden yolu açtı ve 1961 Anayasası ile yeni bir döneme geçildi; bu anayasa ile temel haklar genişletilirken çift meclisli yapıya ve Anayasa Mahkemesi''ne geçildi."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1950 seçimlerinde iktidarın demokratik yolla el değiştirmesine ne ad verilir ve DP''nin ilk icraatı nedir?\" Cevap: **Beyaz İhtilal** ve **ezanın Arapça okunma yasağının kaldırılması**dır. 1950 seçimleri aynı zamanda gizli oy-açık sayım ilkesinin uygulandığı ilk genel seçim olması bakımından da dönüm noktasıdır; 1946 seçimleri ise açık oy-gizli sayım tartışmaları nedeniyle sopalı seçim olarak anılmıştır. Bu dönüşüm Türk demokrasisinin çok partili işleyişini kalıcılaştırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "DP''nin kurucuları Dörtlü Takrir''i veren Celal Bayar, Adnan Menderes, Fuat Köprülü ve Refik Koraltan''dır (Fevzi Çakmak kurucu dörtlüde yok).",
      "1950 iktidar değişimi \"Beyaz İhtilal\"dir (Kadife Devrim Çekoslovakya''dadır); ilk kez gizli oy-açık sayım ve yargı denetimi uygulandı.",
      "DP''nin ilk icraatı ezanın Arapça aslıyla okunmasını serbest bırakmaktır; 6-7 Eylül 1955 Olayları Kıbrıs geriliminde yaşandı ve dönemin iç siyasetini sarstı."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.05',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  5,
  'Bölüm 5: Yumuşama (Detant) Dönemi ve Kıbrıs Sorunu',
  '1960''lardan itibaren süper güçler arasındaki nükleer dehşet dengesi, doğrudan çatışma yerine sınırlı işbirliği ve diyalog dönemini (Yumuşama / Detant) başlattı.  Sömürgeciliğe karşı iki bloktan da bağımsız üçüncü bir yol arayan Asya ve Afrika ülkeleri 1955 Bandung Konferansında barış içinde bir arada yaşama ilkelerini (Pancasila) belirledi ve 1961 Belgrad Zirvesiyle Bağlantısızlar Hareketi resmen kuruldu (Tito, Nasır, Nehru).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1960''lardan itibaren süper güçler arasındaki nükleer dehşet dengesi, doğrudan çatışma yerine sınırlı işbirliği ve diyalog dönemini (**Yumuşama / Detant**) başlattı. Sömürgeciliğe karşı iki bloktan da bağımsız üçüncü bir yol arayan Asya ve Afrika ülkeleri **1955 Bandung Konferansı**nda barış içinde bir arada yaşama ilkelerini (**Pancasila**) belirledi ve **1961 Belgrad Zirvesi**yle **Bağlantısızlar Hareketi** resmen kuruldu (Tito, Nasır, Nehru)."
  },
  {
    "type": "paragraph",
    "text": "1962 **Küba Füze Krizi**nde dünya nükleer savaşın eşiğine geldi; ABD ile SSCB arasındaki gizli pazarlık sonucunda SSCB Küba''daki füzeleri sökerken ABD de Türkiye''de (İzmir Çiğli) konuşlu **Jüpiter Füzeleri**ni söktü. Bu olay Türkiye''nin dış politikada tek taraflı ABD bağımlılığını sorgulamasına ve çok yönlü diplomasi arayışına yönelmesine neden oldu. **1973 Petrol Krizi** ise Arap-İsrail (Yom Kippur) Savaşı sırasında OAPEC''in petrolü siyasi silah olarak kullanmasıyla ortaya çıktı ve dünya ekonomisinde durgunluğa yol açtı (1979 krizi İran Devrimi kaynaklıdır). Bloklar arası güvenlik ve insan hakları alanında **1975 Helsinki Nihai Senedi** imzalanarak **AGİK** (1994 Budapeşte Zirvesi''nde **AGİT**) kuruldu. Ortadoğu''da ise Mısır lideri **Enver Sedat** ile İsrail Başbakanı Begin''in imzaladığı **1978 Camp David Sözleşmesi** sonucunda **İsrail''i tanıyan ilk Arap devleti Mısır** oldu (ikincisi 1994''te Ürdün''dür)."
  },
  {
    "type": "heading",
    "text": "Kıbrıs Davası, Johnson Mektubu ve Barış Harekatı"
  },
  {
    "type": "paragraph",
    "text": "Kıbrıs''ta Rumların adayı Yunanistan''a bağlama (Enosis) çabalarına karşı Türk toplumunun varoluş mücadelesinde ilk toplum lideri **Dr. Fazıl Küçük**, Türk Mukavemet Teşkilatı''nın (TMT) **\"Toros\"** kod adlı lideri ise **Rauf Denktaş**tı. 1959 Zürih ve Londra Antlaşmaları ile kurulan ortak Kıbrıs Cumhuriyeti, Rumların 1963 \"Kanlı Noel\" saldırılarıyla fiilen çöktü. 1964''te Türkiye müdahale kararı alınca ABD Başkanı Lyndon Johnson, **Haziran 1964 Johnson Mektubu**nu göndererek Amerikan silahlarının kullanılmasına izin vermedi. Başbakan **İsmet İnönü** bu şantaja **\"Yeni bir dünya kurulur, Türkiye de orada yerini alır\"** sözleriyle yanıt verdi. Aynı yıl **Yüzbaşı Cengiz Topel** Kıbrıs semalarında düşerek ilk hava şehidimiz oldu."
  },
  {
    "type": "paragraph",
    "text": "**20 Temmuz 1974 Kıbrıs Barış Harekatı** ise adada Yunanistan destekli Nikos Sampson darbesinin gerçekleşmesi üzerine **CHP-MSP koalisyonu** döneminde Başbakan **Bülent Ecevit** ve Başbakan Yardımcısı **Necmettin Erbakan** hükümeti tarafından gerçekleştirildi (**1959-1960 Zürih-Londra Antlaşmaları** Adnan Menderes dönemindedir!). Türkiye, Zürih ve Londra antlaşmalarının kendisine verdiği garantörlük hakkını kullanarak adaya müdahale etti; Cenevre görüşmeleri tıkanınca Dışişleri Bakanı **Turan Güneş**''in kızı Ayşe''ye atıfla çektiği **\"Ayşe tatile çıksın\"** parolasıyla II. Harekat başlatıldı. Harekat sonrası uygulanan ABD silah ambargosu ise Türkiye''de **ASELSAN** gibi milli savunma sanayii kuruluşlarının temellerinin atılmasını hızlandırdı. **1983**''te kurulan **Kuzey Kıbrıs Türk Cumhuriyeti (KKTC)**nin kurucu ilk Cumhurbaşkanı **Rauf Denktaş** oldu."
  },
  {
    "type": "paragraph",
    "text": "Aynı yıllarda yurtdışında 40''a yakın Türk diplomatını şehit eden Ermeni terör örgütü **ASALA**ya karşı mücadele verildi (**EOKA** ise Kıbrıs''taki Rum terör örgütüdür). 1980''lerde güvenlik güçlerinin kararlı operasyonları sayesinde ASALA''nın eylem kapasitesi tamamen kırıldı ve Türkiye uluslararası terörle mücadelede kararlı bir duruş sergiledi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Kıbrıs tarihinde üç ismi ve dönemi ters eşleştirir: - Zürih ve Londra Antlaşmaları (1959-1960) **Menderes**, Johnson Mektubu (1964) **İnönü**, Barış Harekatı (1974) **Ecevit-Erbakan** dönemindedir. - İlk toplum lideri **Dr. Fazıl Küçük**, 1983 KKTC''nin ilk Cumhurbaşkanı **Rauf Denktaş**tır. - Türk diplomatlarını hedef alan Ermeni örgütü **ASALA**, Kıbrıs''taki Rum örgütü **EOKA**dır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Küba Füze Krizi''nde Türkiye''den sökülen füze hangisidir ve İsrail''i tanıyan ilk Arap devleti kimdir?\" Türkiye''den sökülen füze **Jüpiter**, İsrail''i Camp David ile tanıyan ilk Arap devleti **Mısır**dır. Aynı dönemde ABD-SSCB arasında stratejik silahların sınırlandırılması için imzalanan SALT antlaşmaları da Yumuşama döneminin önemli diplomatik adımlarıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Bağlantısızların fikri 1955 Bandung''da doğdu, 1961 Belgrad''da kuruldu; Küba kriziyle Türkiye''den Jüpiter füzeleri söküldü.",
      "1975 Helsinki Senedi ile AGİK (AGİT) kuruldu; Camp David (1978) ile İsrail''i tanıyan ilk Arap devleti Mısır oldu.",
      "1964 Johnson Mektubu''na İnönü yanıt verdi; ilk hava şehidi Cengiz Topel''dir; 1974 Barış Harekatı Ecevit-Erbakan döneminde \"Ayşe tatile çıksın\" parolasıyla yapıldı.",
      "1983 KKTC ilk Cumhurbaşkanı Rauf Denktaş''tır; diplomatlarımızı hedef alan örgüt ASALA''dır."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.06',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  6,
  'Bölüm 6: Küreselleşen Dünya, SSCB''nin Dağılması ve Türk Dünyası',
  '1980''lerin sonunda Sovyetler Birliği''ni içinde bulunduğu ağır ekonomik durgunluktan, Afganistan yenilgisinin yarattığı yıpranmadan, Çernobil felaketinin sarsıntısından ve siyasi kr',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1980''lerin sonunda Sovyetler Birliği''ni içinde bulunduğu ağır ekonomik durgunluktan, Afganistan yenilgisinin yarattığı yıpranmadan, Çernobil felaketinin sarsıntısından ve siyasi krizden kurtarmak isteyen **Mihail Gorbaçov**, iki temel reform başlattı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Glasnost:** Siyasi ve toplumsal yaşamda **açıklık ve şeffaflık** (basın ve ifade özgürlüğü üzerindeki sansürün gevşetilmesi).",
      "**Perestroyka:** Ekonomik ve kurumsal **yeniden yapılanma** (merkezi planlamanın esnetilmesi)."
    ]
  },
  {
    "type": "paragraph",
    "text": "Ancak bu reformlar Sovyet sisteminin çözülmesini durdurmak yerine hızlandırdı; Doğu Avrupa''daki uydu devletlerde tek parti yönetimleri birer birer çöktü, 1989''da Berlin Duvarı yıkıldı, Varşova Paktı dağıldı ve **1991**''de SSCB resmen dağılarak iki kutuplu Soğuk Savaş düzeni sona erdi. Bu dağılma, Kafkasya ve Orta Asya''daki Türk cumhuriyetlerinin (Azerbaycan, Kazakistan, Kırgızistan, Özbekistan, Türkmenistan) bağımsızlıklarını kazanmasını sağladı ve Türkiye için Balkanlardan Orta Asya''ya uzanan yeni bir dış politika ufku açtı. Aynı dönemde Avrupa''da 1992 Maastricht Antlaşması ile Avrupa Birliği kurularak ekonomik ve siyasi bütünleşme yeni bir aşamaya taşındı; eski Doğu Bloku ülkelerinin bir kısmı da NATO ve AB''ye yöneldi."
  },
  {
    "type": "heading",
    "text": "Bosna-Hersek, Azerbaycan ve Türk Dünyası Kurumları"
  },
  {
    "type": "paragraph",
    "text": "Soğuk Savaş sonrası dönemde Balkanlar ve Kafkasya''da yaşanan çatışmalar bölgesel istikrarı derinden etkiledi. Yugoslavya''nın kanlı biçimde parçalanması sürecinde Sırp saldırılarına ve etnik temizliğe karşı Bosna-Hersek halkının bağımsızlık mücadelesine önderlik eden, *Doğu ve Batı Arasında İslam* eserinin yazarı ve bağımsız Bosna-Hersek''in ilk Cumhurbaşkanı **\"Bilge Kral\" Aliya İzzetbegoviç**tir. 1995 Dayton Antlaşması ile Bosna-Hersek''in bağımsızlığı uluslararası alanda tanındı; ancak bölgedeki etnik gerilimlerin sürmesi üzerine NATO ve uluslararası barış güçleri istikrarı korumak için görev aldı."
  },
  {
    "type": "paragraph",
    "text": "Kafkasya''da **Azerbaycan** 1991''de bağımsızlığını ilan ettiğinde ilk cumhurbaşkanı Ayaz Muttalibov oldu; hemen ardından **1992**''de demokratik seçimle başa geçen Azerbaycan Halk Cephesi lideri ve Rus ordusunu Azerbaycan''dan çıkaran milli önder ise **Ebulfez Elçibey**dir (sonrasında Haydar Aliyev cumhurbaşkanı olmuştur). Bu süreçte yaşanan Karabağ işgali ve Hocalı Katliamı ise Kafkasya''daki en ağır insani trajedi olarak tarihe geçti. Türkiye, bağımsızlığını kazanan tüm Türk cumhuriyetlerini tanıyan ilk ülke olarak bölgede eğitim, kültür, medya ve ekonomik işbirliği kurumları oluşturdu; bu işbirliği enerji ve ulaşım koridorlarıyla (Bakü-Tiflis-Ceyhan gibi) stratejik ortaklığa dönüştü. Ayrıca Avrupa ile bütünleşme sürecinde Türkiye 1996''da Gümrük Birliği''ne girdi ve 1999 Helsinki Zirvesi''nde Avrupa Birliği''ne aday ülke statüsü kazandı."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Soğuk Savaş sonrası Türk dünyası kurumlarını işlevlerine göre ayırt et: - **TİKA (1992):** Türk İşbirliği ve Koordinasyon Ajansı — Okul, hastane, restorasyon ve **kalkınma/teknik yardım** projeleri yürütür. - **TÜRKSOY (1993):** Uluslararası Türk Kültürü Teşkilatı — Ortak **kültür ve sanat** işbirliği örgütüdür. - **Türk Devletleri Teşkilatı:** Eski adı Türk Dili Konuşan Ülkeler İşbirliği Konseyi (**Türk Konseyi**) olan siyasi-ekonomik entegrasyon örgütüdür."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM iki eşleştirmeyi çok sever: **Glasnost** (açıklık) ile **Perestroyka** (yeniden yapılanma) kavramlarının anlamlarını ters verir; ayrıca **1918** ilk Azerbaycan Cumhuriyeti lideri **Mehmet Emin Resulzade** ile **1992** bağımsız Azerbaycan''ın seçilmiş milli lideri **Ebulfez Elçibey**i aynı şıklarda karşılaştırır. Ayrıca Bosna-Hersek lideri Aliya İzzetbegoviç''i Sırp veya Hırvat liderlerle karıştırmamalısın; oysa Dayton Antlaşması sürecinde Bosna''nın bağımsızlığını savunan lider odur. Aynı şekilde 1990 sonrası süreçte Orta Asya''da Kazakistan (Nursultan Nazarbayev) ve diğer Türk cumhuriyetleri de bağımsız devletler olarak uluslararası sisteme katılmıştır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türk cumhuriyetlerinde okul, hastane ve teknik kalkınma projeleri yürüten kuruluş hangisidir?\" Kültür-sanat örgütü olan TÜRKSOY değil, teknik ve kalkınma ajansı **TİKA (1992)**dır. Ortak alfabe, kültürel miras ve sanat etkinlikleri ise TÜRKSOY''un görev alanına girer. Küreselleşme sürecinde bu kurumlar Türkiye''nin yumuşak güç kapasitesini artırmıştır; TİKA''nın günümüzde pek çok kıtada kalkınma ve insani yardım projeleri yürütmesi de bunun en somut göstergesidir."
  },
  {
    "type": "key_points",
    "items": [
      "Gorbaçov''un Glasnost''u açıklık/şeffaflık, Perestroyka''sı ise ekonomik-kurumsal yeniden yapılanmadır; 1991''de SSCB dağıldı.",
      "\"Bilge Kral\" Aliya İzzetbegoviç Bosna-Hersek''in ilk Cumhurbaşkanıdır; Ebulfez Elçibey 1992''de seçilen Azerbaycan lideridir.",
      "TİKA (1992) teknik ve kalkınma yardımı, TÜRKSOY (1993) kültür-sanat, Türk Devletleri Teşkilatı (eski Türk Konseyi) ise bölgesel entegrasyon kurumudur.",
      "SSCB''nin dağılmasının ardından Türkiye, Türk dünyasıyla hem enerji-ulaşım koridorları hem de ortak kurumlar aracılığıyla çok boyutlu işbirliği kurmuştur; ayrıca 1996''da Avrupa Birliği ile Gümrük Birliği''ne girmiştir."
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözcükte Anlam
-- Kaynak: docs/konu_anlatimi/turkce/01_sozcukte_anlam.md
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
  'turkce.sozcukte_anlam.01',
  'Türkçe',
  'Sözcükte Anlam',
  1,
  'Bölüm 1: Gerçek (Temel), Yan ve Mecaz Anlam İlişkisi',
  'Türkçede bir sözcüğün tek başına sabit ve değişmez bir anlamı olduğunu düşünmek sınavda en sık yapılan hatadır.  Sözcükler zaman içinde yeni kavramları karşılayarak çok anlamlılık kazanır; bu nedenle bir sözcüğün hangi anlam katmanında kullanıldığını belirlemek için mutlaka cümlenin bütününe bakman gerekir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede bir sözcüğün tek başına sabit ve değişmez bir anlamı olduğunu düşünmek sınavda en sık yapılan hatadır. Sözcükler zaman içinde yeni kavramları karşılayarak **çok anlamlılık** kazanır; bu nedenle bir sözcüğün hangi anlam katmanında kullanıldığını belirlemek için mutlaka cümlenin bütününe bakman gerekir. Bir sözcüğün akla ilk gelen, herkesçe bilinen ve sözlükteki ilk anlamını karşılayan kullanımına **gerçek (temel) anlam** denir. Sözcüğün temel anlamından tamamen kopmadan, şekil veya işlev benzerliğiyle kazandığı yeni anlama **yan anlam**, temel anlamından bütünüyle uzaklaşarak soyut veya bambaşka bir kavramı karşılamasına ise **mecaz anlam** adı verilir."
  },
  {
    "type": "paragraph",
    "text": "Bilim, sanat, spor veya meslek dallarına özgü belirli bir kavramı karşılayan sözcükler ise **terim anlamlı** sayılır. Ancak bir sözcüğün sözlükte terim olarak yer alması, geçtiği her cümlede terim anlamlı olduğu anlamına gelmez; günlük yaşamda genel anlamıyla kullanıldığında terim özelliğini yitirir. Benzer biçimde beş duyu organımızdan en az biriyle algılanabilen varlıkları karşılayan sözcükler **somut**, duyularla algılanamayıp yalnızca zihin ve sezgi yoluyla kavranabilen sözcükler ise **soyut** anlamlıdır. Somut anlamlı bir sözcüğün mecazlaşarak soyut bir kavramı anlatmasına **soyutlama** (örneğin *yürekli* sözcüğünün cesur anlamında kullanılması veya *kafası almamak* deyimi), soyut bir kavramın somut bir varlık ya da hareket üzerinden anlatılmasına ise **somutlama** (örneğin *zamanın su gibi akması*, *sevginin kalpte filizlenmesi* veya *düşüncelerini masaya yatırması*) denir."
  },
  {
    "type": "paragraph",
    "text": "Sınav sorularında sözcüğün hangi anlamda kullanıldığını çözerken \"bağlam testi\" uygulamalısın: Aynı sözcüğü beş farklı cümlede gördüğünde önce kelimenin tek başına akla gelen ilk somut anlamını zihninde canlandır. Eğer cümlede kelimenin gerçek ağırlığı, sıcaklığı veya fiziksel parçası değil de duygusal veya zihinsel bir etkisi anlatılıyorsa orada **mecaz anlam** vardır; buna karşılık şekil veya işlev benzerliğiyle yeni bir somut nesneye ad olmuşsa **yan anlam** oluşmuştur. Örneğin *göz* sözcüğü insanda organ adı iken **gerçek anlam**, masanın çekmecesini veya dolabın bölmesini anlattığında şekil/işlev benzerliğiyle **yan anlam**, \"Olaylara dar bir pencereden değil geniş bir *göz*le bakıyor.\" dendiğinde ise bakış açısı anlamıyla **mecaz anlam** kazanır."
  },
  {
    "type": "table",
    "headers": [
      "Anlam Türü",
      "Temel Ölçüt",
      "Örnek Kullanım"
    ],
    "rows": [
      [
        "Gerçek (Temel) Anlam",
        "Sözlükte ilk akla gelen somut/ilk anlam",
        "Masanın **ayağı** yerine **Çocuğun ayağı** burkuldu. (Hayvan/insan ayağı temel; masa ayağı işlev benzerliğiyle **yan anlam**)"
      ],
      [
        "Yan Anlam",
        "Temel anlamla şekil veya işlev bağı sürer",
        "Geminin **burnu** dalgaları yararak limana yaklaştı. / Dağın **eteği** karla kaplandı."
      ],
      [
        "Mecaz Anlam",
        "Temel anlamdan tamamen uzaklaşma",
        "Toplantıdaki **soğuk** tavrı herkesi şaşırttı. / **Keskin** bakışlarla odayı süzdü."
      ],
      [
        "Terim Anlam",
        "Bilim, sanat, spor veya meslek dalına özgü",
        "Tiyatro oyununun ikinci **perdesi** oldukça tempoluydu. / **Kök** ve **ek** uyumu önemlidir."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Bu **ağır** sözleri hak etmediğimi herkes biliyor.\" cümlesinde \"ağır\" sözcüğü tartılabilen fiziksel bir kütleyi değil, \"incitici, kırıcı\" niteliğini anlattığı için **mecaz** anlamdadır. Buna karşılık \"Yaşlı adam **ağır ağır** yürüyerek yokuşu çıktı.\" cümlesindeki kullanım, fiziksel hareketin yavaşlığını anlattığından temel anlamla bağını koruyan bir **yan anlam**dır; bu kullanımı mecaz saymak **yanlıştır**. Yine \"Gemi **ağır** yükünün altında limana yanaştı.\" cümlesinde ise tartılabilir kütle söz konusu olduğu için **gerçek anlam** vardır. Aynı şekilde \"Pencerenin **perdesini** güneş ışığı girmesin diye çekti.\" cümlesinde \"perde\" günlük ev eşyasıdır ve terim değildir; \"Oyunun son **perdesi** alkışlarla kapandı.\" cümlesinde ise tiyatro **terimidir**."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Anlam katmanlarını merkezden dışa açılan üç halka gibi **G-Y-M** sırasıyla aklında tut: - **G**erçek anlam (çekirdek, ilk akla gelen anlam) - **Y**an anlam (çekirdekle biçim/işlev bağı süren anlam) - **M**ecaz anlam (çekirdekten tamamen kopmuş yeni anlam)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM iki noktada çok güçlü çeldirici kurar: 1. \"Ağır ağır yürümek\", \"masanın ayağı\" veya \"çaydanlığın kulpu\" gibi ifadelerdeki yan anlamları aday mecaz sanabilir. Yan anlamda gerçek anlamla somut bir bağ veya işlev ilişkisi devam eder; mecazda ise sözcük tamamen soyutlaşır ya da bambaşka bir alana geçer. 2. \"Perde, kök, açı, nota\" gibi sözcükler her zaman terim değildir; yalnızca kendi bilim veya sanat dalıyla ilgili bir cümlede kullanıldığında terim anlamı taşır."
  },
  {
    "type": "key_points",
    "items": [
      "Sözcüğün anlamı tek başına değil, mutlaka içinde bulunduğu cümlenin bağlamıyla belirlenir.",
      "Yan anlam temel anlamla bağını korur; mecaz anlam temel anlamdan tamamen uzaklaşır.",
      "Terim anlamlı sözcüklerin alan dışı günlük kullanımları terim sayılmaz.",
      "Somut sözcükler mecazlaşarak soyutlama, soyut kavramlar benzetme yoluyla somutlama oluşturabilir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcukte_anlam.02',
  'Türkçe',
  'Sözcükte Anlam',
  2,
  'Bölüm 2: Sözcükler Arası Anlam İlişkileri (Eş, Yakın, Karşıt, Eş Sesli)',
  'Sözcüklerin birbirleriyle kurduğu anlam ilişkileri hem doğrudan kelime sorularında hem de anlatım bozukluğu sorularının temelinde yer alır.  Yazılışları ve okunuşları farklı olduğu halde aynı kavramı karşılayan sözcüklere eş anlamlı (anlamdaş) sözcükler denir; ancak Türkçede mutlak eş anlamlılık yerine çoğu zaman bağlama göre birbirinin yerini tutabilen kullanımlar öne çıkar.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözcüklerin birbirleriyle kurduğu anlam ilişkileri hem doğrudan kelime sorularında hem de anlatım bozukluğu sorularının temelinde yer alır. Yazılışları ve okunuşları farklı olduğu halde aynı kavramı karşılayan sözcüklere **eş anlamlı (anlamdaş)** sözcükler denir; ancak Türkçede mutlak eş anlamlılık yerine çoğu zaman bağlama göre birbirinin yerini tutabilen kullanımlar öne çıkar. Anlamca aynı gibi görünse de aralarında ince bir nüans veya kapsam farkı bulunan sözcüklere ise **yakın anlamlı** sözcükler denir. Örneğin \"yazar\" ve \"şair\" edebiyat alanında kesişse de biri düz yazı dahil genel yazı yazarını, öteki şiir yazan kişiyi anlattığı için eş anlamlı değildir."
  },
  {
    "type": "paragraph",
    "text": "Anlam bakımından birbirinin tam tersi olan sözcükler **karşıt (zıt) anlamlı** sözcüklerdir. Burada dikkat edilmesi gereken temel ilke, zıt anlamın ancak aynı anlam düzleminde kurulabileceğidir; söz gelimi \"acı kahve\" ile \"tatlı söz\" zıt anlamlı kabul edilmez, çünkü biri tat duyusuna, öteki mecazi davranışa aittir. Yazılışları ve okunuşları aynı olduğu halde aralarında hiçbir anlam bağı bulunmayan sözcükler ise **eş sesli (sesteş)** sözcüklerdir. Eş sesli sözcüklerde ses biçimi tesadüfen ortaktır; buna karşılık aynı kökten gelip aralarında anlam ilişkisi bulunan sözcükler sesteş değil, **çok anlamlı** veya **ortak köklü (kökteş)** sözcüklerdir."
  },
  {
    "type": "paragraph",
    "text": "Sesteşlik ve eş anlamlılık sorularında en güvenilir yöntem, sözcükleri **cümlenin bağlamında birbirinin yerine koymaktır**. İki sözcük gerçek anlamda eş anlamlıysa aynı cümlede yer değiştirdiklerinde cümlenin anlamı bozulmaz; yakın anlamlı sözcüklerde ise cümlenin verdiği duygu veya kapsam mutlaka biraz kayar. Benzer şekilde aynı kelimenin iki farklı cümlede sesteş olup olmadığını anlamak için aralarında ortak bir köken veya anlam sıçraması bulunup bulunmadığına bakmalısın; bir kelimenin temel anlamından türemiş yan veya mecaz anlamları sesteşlik oluşturmaz."
  },
  {
    "type": "table",
    "headers": [
      "İlişki Türü",
      "Ayırt Edici Özellik",
      "Örnek Çift"
    ],
    "rows": [
      [
        "Eş Anlamlı",
        "Yazılış farklı, anlam aynı; cümlede birbirinin yerini tutar",
        "**yanıt - cevap**, **öneri - teklif**, **özgün - orijinal**"
      ],
      [
        "Yakın Anlamlı",
        "Tam olarak aynı değil; aralarında derece veya kapsam farkı var",
        "**küsmek - darılmak**, **bakmak - seyretmek**, **istemek - dilemek**"
      ],
      [
        "Karşıt (Zıt) Anlamlı",
        "Anlamca birbirinin tersi; aynı anlam düzleminde olmalı",
        "**sıcak - soğuk**, **geniş - dar**, **ödül - ceza**"
      ],
      [
        "Eş Sesli (Sesteş)",
        "Yazılış ve okunuş aynı, anlamlar arasında hiçbir bağ yok",
        "**yüz** (sayı) - **yüz** (surat) - **yüz-** (suda ilerlemek)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**Gelmek** fiilinin zıt anlamlısı **gelmemek**tir.\" yargısı **yanlıştır**; çünkü `-ma/-me` eki bir sözcüğün zıddını değil **olumsuzunu** yapar. \"Gelmek\" sözcüğünün zıt anlamlısı **gitmek**tir. Yine \"**Yazar** ile **şair** eş anlamlıdır.\" yargısı **yanlıştır**; ikisi de edebiyatla uğraşsa da biri her türde yazı yazanı, öteki yalnızca şiir yazanı karşılar. Sesteşlik sorularında ise \"**Çay** kıyısında oturduk.\" ile \"Sabahları bir bardak **çay** içerim.\" cümlelerindeki \"çay\" sözcükleri tamamen farklı varlıkları (akarsu ve içecek) gösterdiği için **sesteştir**. Buna karşılık \"Bu telefon **çalışmıyor**.\" ile \"Radyo pili bitince **çalışmadı**.\" cümlelerindeki \"çalışmak\" aynı anlam alanındadır (işler durumda olmak); fakat \"İki gündür bu **sınavda** çok **çalıştı**.\" cümlesiyle karşılaştırıldığında tek bir fiilin farklı anlam katmanları söz konusu olduğundan bu durum sesteşlik değil **çok anlamlılık**tır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM eş seslilik ve karşıtlık sorularında iki klasik tuzak kullanır: 1. Bir sözcüğün olumsuzu (örneğin **tatlı - tatsız** veya **açık - açık değil**) kesinlikle zıt anlamlısı değildir; zıtlık için ayrı bir kavram (**tatlı - acı**, **açık - kapalı**) gerekir. 2. Yazılışı aynı görünen her sözcük sesteş değildir: \"kuru\" (ıslak olmayan) ile \"kuru-\" (kurumak eylemi) arasında anlam bağı vardır, bunlar kökteştir; ancak \"gül\" (çiçek) ile \"gül-\" (eylem) arasında hiçbir anlam bağı yoktur, bunlar sesteştir. Ayrıca düzeltme işareti bulunan **kar** (yağış) ile **kâr** (kazanç) okunuşları farklı olduğu için sesteş sayılmaz."
  },
  {
    "type": "key_points",
    "items": [
      "Olumsuzluk ekleri (`-ma/-me`, `-sız/-siz`) karşıt anlam değil, olumsuz anlam üretir.",
      "Eş anlamlılık için sözcüklerin aynı cümlede birbirinin yerini anlam bozulmadan tutabilmesi gerekir.",
      "Sesteş sözcüklerde yazılış ve okunuş aynı, anlamlar tamamen ilişkisizdir; aynı sözcüğün mecaz/yan anlamları sesteşlik oluşturmaz.",
      "Zıt anlam ilişkisi kurulurken iki sözcüğün de gerçek veya mecaz aynı düzlemde kullanılıp kullanılmadığı kontrol edilmelidir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcukte_anlam.03',
  'Türkçe',
  'Sözcükte Anlam',
  3,
  'Bölüm 3: Ad Aktarması, Dolaylama, Güzel Adlandırma ve Nicel-Nitel Anlam',
  'Sözcükte anlam sorularının önemli bir bölümü, sözcüğün benzetme amacı olmadan başka bir kavramın yerine geçmesine veya varlığın ölçülebilir özelliklerine dayanır.  Benzetme amacı güdülmeksizin, aralarında parça-bütün, iç-dış, yazar-eser veya yer-insan ilgisi bulunan bir sözcüğün başka bir sözcük yerine kullanılmasına ad aktarması (mecaz-ı mürsel) denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözcükte anlam sorularının önemli bir bölümü, sözcüğün benzetme amacı olmadan başka bir kavramın yerine geçmesine veya varlığın ölçülebilir özelliklerine dayanır. Benzetme amacı güdülmeksizin, aralarında parça-bütün, iç-dış, yazar-eser veya yer-insan ilgisi bulunan bir sözcüğün başka bir sözcük yerine kullanılmasına **ad aktarması (mecaz-ı mürsel)** denir. Örneğin \"Bütün **salon** sanatçıyı ayakta alkışladı.\" cümlesinde alkışlayan fiziksel duvarlar değil, salonun içindeki izleyicilerdir; burada iç-dış ilgisiyle ad aktarması yapılmıştır."
  },
  {
    "type": "paragraph",
    "text": "Tek bir sözcükle anlatılabilecek bir kavramı, birden fazla sözcükle ve genellikle daha etkileyici biçimde ifade etmeye **dolaylama** denir (\"ormanlar kralı\" = aslan, \"kara elmas\" = kömür). Söylenmesi kaba, korkutucu veya üzücü bulunan durumları daha yumuşak ve kibar sözlerle anlatmaya ise **güzel adlandırma** adı verilir (\"verem\" yerine \"ince hastalık\", \"ölmek\" yerine \"hayata gözlerini yummak\"). Doğadaki seslerin taklit edilmesiyle oluşan sözcüklere **yansıma sözcükler** denir; bu sözcükler isim, sıfat, zarf ya da fiil kökünde yer alabilir (\"şırıl şırıl\", \"çıt\", \"horlamak\", \"gıcırdamak\")."
  },
  {
    "type": "paragraph",
    "text": "Varlıkların sayılabilen, ölçülebilen, azalıp çoğalabilen özelliklerini bildiren sözcükler **nicel**, sayılamayan ve ölçülemeyen özelliklerini (duygu, renk, nitelik, değerlendirme) bildiren sözcükler ise **nitel** anlamlıdır. Aynı sözcük kullanıldığı yere göre hem nicel hem nitel anlam kazanabilir; bu ayrımı yalnızca bağlam belirler. Örneğin bir evin veya bahçenin metreyle ölçülebilen büyüklüğünden söz ediliyorsa **nicel** anlam; buna karşılık bir insanın duygusal derinliği veya düşünce dünyası anlatılıyorsa **nitel** anlam söz konusudur."
  },
  {
    "type": "paragraph",
    "text": "Sözcükte anlamın bir diğer boyutu olan **genel ve özel anlamlılık** ilişkisi ise kavramların kapsayıcılığıyla ilgilidir: *Varlık -> canlı -> bitki -> ağaç -> çınar* dizilişi genelden özele doğru giderken, *çınar -> ağaç -> bitki* dizilişi özelden genele doğru ilerler. Aynı sözcük tek başına bir türü temsil ettiğinde genel (*Kitap insanın en iyi dostudur*), tek bir nesneyi gösterdiğinde ise özel (*Masadaki kitabı bana uzat*) anlamda kullanılmış olur. Bu ayrım özellikle cümle yorumunda genelleme sınırlarını belirlerken işine yarar."
  },
  {
    "type": "table",
    "headers": [
      "Kavram",
      "Temel İlke",
      "Örnek"
    ],
    "rows": [
      [
        "Ad Aktarması",
        "Benzetme yok; parça-bütün, iç-dış, yazar-eser ilgisi var",
        "Akşamları mutlaka **Orhan Kemal** okurum. (Yazarın kitapları)"
      ],
      [
        "Dolaylama",
        "Tek sözcüklü kavramı birden çok sözcükle anlatma",
        "Turizm sektörüne yıl boyunca **bacasız sanayi** denir."
      ],
      [
        "Güzel Adlandırma",
        "Olumsuz/korkutucu ifadeyi yumuşatma",
        "Yaşlı komşumuz geçen hafta **son yolculuğuna çıktı**."
      ],
      [
        "Yansıma Sözcük",
        "Doğadaki sesin doğrudan taklit edilmesi",
        "Dere kenarında sular **şırıl şırıl** akıyordu."
      ],
      [
        "Nicel / Nitel",
        "Ölçülebilen miktar (nicel) vs. ölçülemeyen özellik (nitel)",
        "**Üç kilo** elma, **geniş** oda (nicel) / **Geniş** bakış açısı (nitel)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış ayrımı: \"Rüzgâr yapraklara bir şeyler **fısıldıyordu**.\" cümlesinde **ad aktarması** değil **kişileştirme** vardır; çünkü cansız bir varlığa insana özgü konuşma özelliği verilmiştir. Buna karşılık \"Uçak birazdan **Ankara**''ya inecek.\" veya \"Soba yanmayınca bütün **ev** üşüdü.\" cümlelerinde sırasıyla şehir yerine havalimanı ve ev yerine evdekiler kastedildiği için **ad aktarması** vardır. Yansıma konusunda ise \"Bahçedeki çocukların **gülüşmeleri** sokağı doldurdu.\" cümlesindeki \"gülüşme\" sözcüğü ses çağrışımı yapsa da doğadaki bir sesin taklidi olmadığı için **yansıma değildir**; \"Kuru dallar ayağımızın altında **çıtırdıyordu**.\" cümlesindeki \"çıt-\" kökü ise ses taklididir ve yansımadır. Nicel-nitel ayrımında ise \"Pazardan **üç kilo** domates aldı.\" ve \"**Dar** sokaktan geçtik.\" cümleleri ölçülebilir olduğu için **nicel**; \"Bu **zor** karar herkesi etkiledi.\" cümlesindeki \"zor\" sözcüğü ise metre veya teraziyle ölçülemediği için **nitel** anlamlıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM bu bölümde üç detayı çeldirici olarak kullanır: 1. **Ad aktarması** ile **kişileştirme/benzetme** karıştırılır: Ad aktarmasında asla benzetme amacı yoktur, gerçek hayattaki somut ilgi (kap-içindeki, yazar-eseri, parça-bütün) yeterlidir. 2. \"Zor, etkileyici, başarılı\" gibi derece bildiren sözcükler nicel sanılır; ancak **nicel anlam** yalnızca cetvel, terazi, saat veya sayıyla ölçülebilen durumlar içindir. 3. \"Kuşlar ötüşüyor\" veya \"Çocuklar gülüşüyor\" ifadeleri ses bildirse de taklit köküne dayanmadığı için **yansıma sözcük değildir**; yansıma için \"cıvıl, miyav, pat, şırıl\" gibi doğrudan ses taklidi gerekir."
  },
  {
    "type": "key_points",
    "items": [
      "Ad aktarmasında benzetme yoktur; iç-dış, parça-bütün, sanatçı-eser ilgisi bulunur.",
      "Dolaylama tek kavramı birden çok sözcükle, güzel adlandırma ise rahatsız edici durumu yumuşatarak anlatır.",
      "Yansıma sözcükler mutlaka doğadaki bir sesi taklit eden kökten türemelidir (\"ötmek, gülmek, parlamak\" yansıma değildir).",
      "Bir sözcük cümleye göre nicel (ölçülebilir) veya nitel (ölçülemez) anlam taşıyabilir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcukte_anlam.04',
  'Türkçe',
  'Sözcükte Anlam',
  4,
  'Bölüm 4: Söz Öbekleri, İkilemeler, Deyimler ve Atasözleri',
  'KPSS Türkçe sorularında yalnızca tekil sözcüklerin değil, birden fazla sözcüğün bir araya gelerek oluşturduğu söz öbeklerinin cümleye kattığı anlam da sıkça sorulur.  Bir söz öbeğinin anlamını çözerken öbeği cümleden çıkarıp bağlamın akışını bozmayacak en yakın ifadeyi düşünmek gerekir; sözcüklerin tek tek sözlük anlamlarına takılmak yerine tüm öbeğin mecazi bütünlüğüne odaklanmalısın.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS Türkçe sorularında yalnızca tekil sözcüklerin değil, birden fazla sözcüğün bir araya gelerek oluşturduğu **söz öbeklerinin** cümleye kattığı anlam da sıkça sorulur. Bir söz öbeğinin anlamını çözerken öbeği cümleden çıkarıp bağlamın akışını bozmayacak en yakın ifadeyi düşünmek gerekir; sözcüklerin tek tek sözlük anlamlarına takılmak yerine tüm öbeğin mecazi bütünlüğüne odaklanmalısın. Anlatımı pekiştirmek amacıyla iki sözcüğün yan yana gelmesiyle kurulan **ikilemeler** ise farklı yollarla oluşturulur: aynı sözcüğün tekrarı (*koşa koşa*), eş veya yakın anlamlı sözcükler (*doğru dürüst*), zıt anlamlı sözcükler (*aşağı yukarı*), biri anlamlı biri anlamsız (*eski püskü*), ikisi de anlamsız (*mırın kırın*) ve yansıma sözcükler (*tıkır tıkır*)."
  },
  {
    "type": "paragraph",
    "text": "Genellikle gerçek anlamından uzaklaşmış, en az iki sözcükten oluşan ve bir durumu ya da duyguyu çarpıcı biçimde anlatan kalıplaşmış söz gruplarına **deyim** denir. Uzun deneyim ve gözlemlere dayanarak toplumun ortak yargısını, öğüt veya dersini bildiren kalıplaşmış cümlelere ise **atasözü** adı verilir. Deyimler çoğunlukla bir kavramı veya anlık durumu ifade ederken (mastar veya öbek halindedir), atasözleri yargı bildiren tam cümlelerdir ve genel geçer bir kural ortaya koyar. Hem deyimler hem atasözleri kalıplaşmış olduğu için içindeki sözcükler eş anlamlısıyla bile değiştirilemez; örneğin \"sütten ağzı yanmak\" deyimindeki *süt* yerine *ayran* ya da \"ak akçe kara gün içindir\" atasözündeki *kara* yerine *siyah* yazılamaz."
  },
  {
    "type": "paragraph",
    "text": "KPSS''de deyim soruları çoğu zaman \"verilen açıklamayla uyuşmayan deyim\" veya \"parçadaki boşluğa anlamca en uygun deyim\" kalıbıyla gelir. Bu soruları çözerken deyimin olumlu mu olumsuz mu bir tutum taşıdığını, öznede kasıt mı çaresizlik mi bulunduğunu kontrol etmek doğru seçeneği hızla ortaya çıkarır. Aynı biçimde ikilemelerin kuruluş yollarını soran testlerde sözcüklerin ikilemeyi hangi anlam bağıyla oluşturduğuna dikkat etmelisin: Örneğin *abuk sabuk* ile *mırın kırın* ikisi de anlamsız sözcüklerden kurulurken, *eski püskü* biri anlamlı biri anlamsız, *doğru dürüst* yakın anlamlı, *er geç* ise zıt anlamlı sözcüklerden oluşur. Üstelik bazı deyimler nadiren de olsa gerçek anlamını koruyabilir (*hem suçlu hem güçlü*, *çoğu gitti azı kaldı*); ancak deyimlerin büyük çoğunluğu mecazlı bir anlatım gücüne sahiptir."
  },
  {
    "type": "table",
    "headers": [
      "Özellik",
      "Deyim",
      "Atasözü"
    ],
    "rows": [
      [
        "Yapı ve Biçim",
        "Genellikle söz öbeği veya mastar halindedir (*göz boyamak*)",
        "Tam ve yargı bildiren cümledir (*Damlaya damlaya göl olur.*)"
      ],
      [
        "Amaç",
        "Bir durumu, tutumu veya olayı çarpıcı biçimde betimler",
        "Ders, öğüt verir veya genel bir doğa/toplum kuralı bildirir"
      ],
      [
        "Değiştirilebilirlik",
        "Kalıplaşmıştır; sözcükleri değiştirilemez",
        "Kalıplaşmıştır; sözcükleri değiştirilemez"
      ],
      [
        "Öznellik / Genellik",
        "Kişiye ve zamana göre çekimlenebilir (*göz yumdu*)",
        "Genel geçer kural bildirir; çekimi sabittir"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Deyim ve atasözü çözüm örneği: \"Eski rakibine uzun süredir **diş biliyordu**.\" cümlesinde deyimin açıklaması olarak \"ona içten bir destek veriyordu\" ifadesini yazmak **yanlıştır**; çünkü \"diş bilemek\", \"bir kimseden öç almak için fırsat kollamak\" demektir. Buna karşılık \"Çalışanların küçük hatalarına **göz yumdu** (görmezden geldi).\" ve \"Taşınma konusunda **ayak diriyor** (ısrarla karşı çıkıyor).\" eşleştirmeleri **doğrudur**. Atasözlerinde ise \"**Damlaya damlaya göl olur.**\" atasözü, parayı harcamadan önce düşünmeyi değil, **küçük ve sürekli birikimlerin zamanla büyük sonuçlar doğurduğunu** anlatır; bu nedenle her gün beş sayfa okuyarak yıl sonunda onlarca kitap bitiren bir öğrencinin durumu bu atasözüyle tam örtüşür. İkilemelerde ise \"Aşağı yukarı üç saat bekledik.\" cümlesinde ikileme \"yaklaşık\" anlamı katan bir zıt anlamlı ikilemedir ve **her zaman ayrı yazılır**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Söz öbekleri ve deyim sorularında iki yanılgı adayları eler: 1. Deyim içindeki tek bir sözcüğün günlük çağrışımına kapılmak: Örneğin \"diş bilemek\" deyiminde \"bilemek\" fiili \"hazırlamak\" çağrışımı yaptığı için masum bir hazırlık sanılabilir; oysa deyim düşmanlık ve öç alma anlamı taşır. 2. Atasözü eşleştirme sorularında yüzeysel kelime benzerliğine kanmak: \"Sakla samanı gelir zamanı\" ile \"Damlaya damlaya göl olur\" benzer görünse de ilki *gereksiz sanılan şeylerin bir gün işe yarayacağını*, ikincisi ise *küçük birikimlerin büyüyerek sonuç vereceğini* anlatır."
  },
  {
    "type": "key_points",
    "items": [
      "Söz öbeği sorularında öbeği oluşturan tek tek kelimeler değil, cümlenin bağlamında oluşan bütün anlam esas alınır.",
      "İkilemeler ayrı yazılır ve araya noktalama işareti konmaz.",
      "Deyimler durum betimler, atasözleri genel kural veya öğüt veren tam cümlelerdir; ikisinin de sözcükleri eş anlamlılarıyla değiştirilemez.",
      "Atasözü eşleştirmelerinde konu benzerliğine değil, verilmek istenen temel iletiye bakılır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Cümlede Anlam
-- Kaynak: docs/konu_anlatimi/turkce/02_cumlede_anlam.md
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
  'turkce.cumlede_anlam.01',
  'Türkçe',
  'Cümlede Anlam',
  1,
  'Bölüm 1: Neden-Sonuç, Amaç-Sonuç ve Koşul-Sonuç Cümleleri',
  'Cümleler arasındaki anlam ilişkilerinin başında eylemin hangi gerekçeyle, hangi hedefle veya hangi şarta bağlı olarak gerçekleştiğini gösteren üçlü yapı gelir.  Bir yargının gerçekleşme gerekçesini, yani olaydan önce var olan sebebi bildiren cümlelere neden-sonuç (sebep-sonuç) cümleleri denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümleler arasındaki anlam ilişkilerinin başında eylemin hangi gerekçeyle, hangi hedefle veya hangi şarta bağlı olarak gerçekleştiğini gösteren üçlü yapı gelir. Bir yargının gerçekleşme gerekçesini, yani olaydan önce var olan sebebi bildiren cümlelere **neden-sonuç (sebep-sonuç)** cümleleri denir. Eylemin hangi hedefe ulaşmak için yapıldığını bildiren cümlelere **amaç-sonuç**, bir eylemin gerçekleşmesini başka bir olayın veya durumun gerçekleşmesine bağlayan cümlelere ise **koşul-sonuç (şart)** cümleleri adı verilir."
  },
  {
    "type": "paragraph",
    "text": "Bu üç ilişki biçimi günlük dilde çoğu zaman aynı edat ve eklerle (`için`, `-diğinden`, `-mek üzere`, `-sa/-se`, `diye`) kurulduğu için adaylar tarafından sıkça karıştırılır. Ayrımı kesinleştirmenin en pratik yolu cümleye doğru soruyu yöneltmektir: \"Hangi amaçla?\" sorusuna yanıt alıyorsan ve amaç bölümünün gerçekleşip gerçekleşmediği cümlede henüz belli değilse orada **amaç-sonuç** ilişkisi vardır. Buna karşılık hem neden hem sonuç kısmı gerçekleşmiş (veya gerçekleşmesi kesinleşmiş) bir olguya dayanıyorsa **neden-sonuç** ilişkisi söz konusudur. Ayrıca cümlede \"amacıyla\" sözcüğünü getirip cümleyi okuduğunda anlam bozulmuyorsa amaç-sonuç, \"nedeniyle / yüzünden\" getirdiğinde anlam oturuyorsa neden-sonuç ilişkisi kurulmuştur."
  },
  {
    "type": "paragraph",
    "text": "Koşul-sonuç ilişkisi ise yalnızca `-sa/-se` şart kipiyle kurulmaz; `-dikçe`, `-madan`, `yeter ki`, `ancak ... şartıyla`, `ama` ve `mi` soru edatı da (\"Yağmur yağdı mı toprak kokar.\") iki yargı arasında şart bağı kurabilir. Ancak iki eylemin yalnızca peş peşe gerçekleştiğini bildiren zaman ifadelerini koşul cümlesiyle karıştırmamak gerekir. Sınavda bu üç ilişkiyi ayırt ederken cümledeki yüklemin ne zaman ve hangi motivasyonla gerçekleştiğini kendine sorman yeterlidir: Eğer birinci bölüm gerçekleşmiş bir olay olup ikinci bölümü tetiklemişse **neden-sonuç**, birinci bölüm zihindeki bir hedef olup henüz gerçekleşmemişse **amaç-sonuç**, birinci bölüm gerçekleşmeden ikinci bölümün ortaya çıkması imkânsızsa **koşul-sonuç** ilişkisi vardır. Ayrıca \"O kadar çok çalıştı ki sınavı kazandı.\" gibi `ki` bağlacıyla kurulan cümlelerde de güçlü bir neden-sonuç ilişkisi bulunabileceğini unutma."
  },
  {
    "type": "table",
    "headers": [
      "Cümle Türü",
      "Temel Ayırt Edici Test",
      "Örnek Cümle"
    ],
    "rows": [
      [
        "Neden-Sonuç",
        "\"Neden?\" sorusuna yanıt verir; **neden gerçekleşmiştir** (+)",
        "Yoğun kar yağdığı **için** köy yolları kapandı. (Kar yağmış +, yol kapanmış +)"
      ],
      [
        "Amaç-Sonuç",
        "\"Hangi amaçla?\" sorusuna yanıt verir; **amaç henüz belirsizdir** (?)",
        "Karanlıktan önce eve dönmek **için** adımlarını hızlandırdı. (Dönüp dönmediği ?)"
      ],
      [
        "Koşul-Sonuç",
        "Bir olayın gerçekleşmesi diğer şarta bağlıdır (`-sa/-se`, `-dikçe`, `-madıkça`)",
        "Notlarını düzenli tutar**san** sınavda çok rahat edersin. / Kitabı geri getirmek **üzere** alabilirsin."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Karşılaştırmalı çözüm: \"Hava erken karardığı **için** yürüyüşü yarıda kestik.\" cümlesi **neden-sonuç**tur; çünkü havanın kararması gerçekleşmiş bir gerekçedir. Buna karşılık \"Sağlıklı kalmak **için** her sabah yarım saat yürür.\" cümlesinde \"için\" edatı kullanılsa da sağlıklı kalıp kalmadığı belli değildir, yürüyüş bu hedefle yapıldığı için cümle **amaç-sonuç**tur; \"Sağlıklı kalmak amacıyla\" dediğimizde anlam tam oturur. Koşul ilişkisinde ise \"Eve **gelir gelmez** ödevine başladı.\" cümlesini koşul saymak **yanlıştır**; burada eylemlerin peş peşe gerçekleştiğini bildiren bir **zaman** ilişkisi vardır. Koşul olması için \"Ödevini bitirirsen dışarı çıkabilirsin.\" veya \"Düzenli çalıştıkça netlerin artar.\" örneklerindeki gibi bir bağlayıcılık şarttır."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Neden-Sonuç ve Amaç-Sonuç farkını **G-B** işaretlemesiyle ayır: - **G**erçekleşmişsebep = Neden-Sonuç (`+` ve `+`) - **B**elirsiz hedef = Amaç-Sonuç (`?` ve `+`)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM iki noktada çeldirici hazırlar: 1. \"İçin\" ve \"diye\" sözcüklerinin geçtiği her cümle neden-sonuç sanılır. Oysa `\"-mak için\"` ve `\"-mek üzere\"` kalıpları cümleye neredeyse her zaman **amaç-sonuç** anlamı katar; mutlaka \"amacıyla\" sözcüğünü yerine koyarak test etmelisin. 2. \"Gelir gelmez\", \"görünce\" gibi zaman bildiren ikileme veya zarf-fiiller koşul sanılabilir. Koşul anlamı için iki yargı arasında zaman sırası değil, birbirine bağlı bir **şart ilişkisi** bulunmalıdır (`-sa/-se`, `-dikçe`, `-madıkça`, `yeter ki`, `ancak ... şartıyla`)."
  },
  {
    "type": "key_points",
    "items": [
      "Neden-sonuç cümlelerinde gerekçe gerçekleşmiş bir olgudur (`+` / `+`).",
      "Amaç-sonuç cümlelerinde amaç bölümünün gerçekleşip gerçekleşmediği belirsizdir (`?` / `+`).",
      "Koşul cümlelerinde yalnız `-sa/-se` değil; `-dikçe`, `-madan`, `yeter ki`, `ama` gibi yapılar da şart kurabilir.",
      "Ardışık zaman bildiren ifadeler (\"gelir gelmez\") koşul-sonuç sayılmaz."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.cumlede_anlam.02',
  'Türkçe',
  'Cümlede Anlam',
  2,
  'Bölüm 2: Öznel-Nesnel Yargılar, Karşılaştırma ve Anlatım Tutumları',
  'Cümlede anlamın ikinci temel ekseni, konuşucunun veya yazarın ifade ettiği yargının kanıtlanabilirlik derecesi ve taşıdığı duygusal tutumdur.  Doğruluğu veya yanlışlığı kişiden kişiye değişmeyen, gözlem, belge ya da bilimsel verilerle herkesçe kanıtlanabilen yargılara nesnel (objektif) yargı denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümlede anlamın ikinci temel ekseni, konuşucunun veya yazarın ifade ettiği yargının kanıtlanabilirlik derecesi ve taşıdığı duygusal tutumdur. Doğruluğu veya yanlışlığı kişiden kişiye değişmeyen, gözlem, belge ya da bilimsel verilerle herkesçe kanıtlanabilen yargılara **nesnel (objektif) yargı** denir. Konuşanın kendi beğenisini, yorumunu, duygusunu veya değer yargısını yansıtan, bu nedenle herkes tarafından aynı biçimde kanıtlanamayan yargılara ise **öznel (sübjektif) yargı** adı verilir. Bir cümlede tek bir öznel sözcük (\"etkileyici\", \"güzel\", \"sıradan\", \"büyüleyici\") bile yer alsa o cümlenin tamamı öznel sayılır."
  },
  {
    "type": "paragraph",
    "text": "İki varlığı, kavramı veya durumu ortak ya da farklı bir yönüyle kıyaslayan cümlelere **karşılaştırma cümlesi** denir (\"daha\", \"en\", \"kadar\", \"göre\", \"ise\", \"oranla\"). Gerçekleşmesi mümkün olmayan bir durumu veya duyguyu olduğundan çok büyük ya da çok küçük göstererek anlatan cümlelerde **abartma (mübalağa)**, eylemin gerçekleşmesinin kesin olmadığını ve ihtimal taşıdığını bildiren cümlelerde ise **olasılık (ihtimal)** anlamı vardır. Bunların yanında geçmişte yapılmayan bir iş için duyulan üzüntüyü bildiren **hayıflanma** ile yapılan bir hatadan duyulan üzüntüyü bildiren **pişmanlık**, ayrıca bir kişiye veya olaya dair henüz kanıtlanmadan peşin hüküm vermeyi anlatan **ön yargı** sık sorulan tutum kavramlarıdır. Ayrıca bir durumun sürekli değiştiğini veya aynı kaldığını anlatan **aşamalı durum** cümleleri (\"günden güne\", \"gitgide\") ile bir kimsenin kendi durumundan başkasının yanında yakınmasını anlatan **sitem** ve **yakınma** farkı da sıkça sorulur: Kişi kırgınlığını doğrudan muhatabının yüzüne söylüyorsa **sitem**, durumu üçüncü kişilere anlatıyorsa **yakınma** söz konusudur."
  },
  {
    "type": "paragraph",
    "text": "Cümlede anlatım tutumlarını çözerken **doğrudan ve dolaylı anlatım** ile **tanım ve değerlendirme** cümlelerini de ayırmak gerekir. Başkasının sözünü hiçbir değişikliğe uğratmadan, genellikle tırnak içinde veya virgülle ayırarak *\"dedi\"* yüklemiyle aktarmaya **doğrudan anlatım**, kendi cümlemizin içine katarak *\"söyledi / belirtti\"* biçiminde aktarmaya ise **dolaylı anlatım** denir. Yine bir eserin veya kişinin olumlu-olumsuz yanlarını ölçütlere göre inceleyen cümlelere **eleştiri** (hem olumlu hem olumsuz olabilir), yalnızca kendi fikrini kesinleştiren cümlelere ise **öznel yargı** adı verilir."
  },
  {
    "type": "table",
    "headers": [
      "Tutum / Anlam Özelliği",
      "Ayırt Edici İpucu",
      "Örnek Cümle"
    ],
    "rows": [
      [
        "Nesnel Yargı",
        "Kanıtlanabilir olgu; kişisel yorum yok",
        "Türkiye''nin en uzun nehri Kızılırmak, Sivas''tan doğar."
      ],
      [
        "Öznel Yargı",
        "Kişisel beğeni, değerlendirme, yorum",
        "Sanatçının son sergisi **büyüleyici** bir atmosfere sahip."
      ],
      [
        "Karşılaştırma",
        "İki varlık/durum kıyaslanır (\"daha, en, göre\")",
        "Kardeşim **benden daha hızlı** kitap okuyor."
      ],
      [
        "Olasılık / Varsayım",
        "Olasılık: ihtimal (`-ebilir`); Varsayım: olmamışı olmuş sayma (`diyelim ki`)",
        "Yarın yağmur **yağabilir**. / **Tut ki** sınavı kazandın."
      ],
      [
        "Pişmanlık / Hayıflanma",
        "Pişmanlık: **yapılan** hata; Hayıflanma: **yapılamayan** iş",
        "Keşke o sözü **söylemeseydim** (pişmanlık). / Keşke zamanında **çalışsaydım** (hayıflanma)."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış ayrımı: \"Bu bölgede **çok geniş** bir orman alanı var.\" cümlesinde \"çok\" sözcüğü bulunsa da **karşılaştırma yoktur**; çünkü sözcük yalnızca ormanın derecesini bildirir, başka bir ormanla kıyas yapmaz. Oysa \"Bu bölge, komşu ilden **daha geniş** ormanlara sahiptir.\" cümlesinde iki bölge kıyaslandığı için **karşılaştırma** vardır. Abartma konusunda ise \"Hava bugün **biraz serinledi**.\" cümlesinde derece bildiren olağan bir ifade vardır, abartma yoktur; ancak \"Korkudan **kalbim yerinden çıkacaktı**.\" cümlesi gerçekte olamayacak bir şiddeti anlattığı için **abartma**dır. Benzer şekilde \"Keşke tatilde biraz dinlenseydim.\" cümlesi **olasılık değil**, gerçekleşmemiş bir isteğe duyulan üzüntüyü bildiren **hayıflanma** cümlesidir; olasılık için \"Bu akşam misafirler erken **gelebilir**.\" örneğindeki gibi eylemin gerçekleşme ihtimalinin belirtilmesi gerekir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM tutum ve yargı sorularında üç ayrımı sıklıkla test eder: 1. \"En güzel\" veya \"herkesin beğendiği\" gibi kesin görünen ifadeler **nesnel değildir**; \"güzel\" sözcüğü kişisel değerlendirme içerdiğinden cümleyi öznel yapar. 2. \"Çok\", \"oldukça\", \"pek\" gibi derece zarfları tek başına **karşılaştırma** oluşturmaz; karşılaştırma için en az iki varlık, zaman veya durumun birbirine oranlanması gerekir. 3. **Pişmanlık** ile **hayıflanma** karıştırılır: Kişi *yaptığı* bir davranıştan üzüntü duyuyorsa pişmanlık, *yapmadığı / kaçırdığı* bir fırsattan üzüntü duyuyorsa hayıflanma söz konusudur."
  },
  {
    "type": "key_points",
    "items": [
      "Cümlede tek bir değerlendirme sıfatı veya zarfı bile varsa o cümle nesnel değil, özneldir.",
      "Karşılaştırmada iki unsurun kıyaslanması şarttır; tek bir varlığın derecesini belirtmek karşılaştırma değildir.",
      "Olasılık eylemin ihtimalini (`-ebilir`, `galiba`), varsayım ise gerçekte olmayan bir durumu geçici olarak olmuş kabul etmeyi (`varsayalım`, `diyelim ki`) anlatır.",
      "Yapılan hataya üzülme pişmanlık, yapılamayan işe üzülme hayıflanmadır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.cumlede_anlam.03',
  'Türkçe',
  'Cümlede Anlam',
  3,
  'Bölüm 3: Cümle Yorumlama, Yakın Anlamlı ve Çelişen Cümleler',
  'KPSS Genel Yetenek testinin belirleyici soru tiplerinden biri, verilen bir cümleyle anlamca en yakın olanı bulmak veya birbirine anlamca ters düşen (çelişen) cümleyi tespit etmektir.  Yakın anlamlı cümle sorularında aynı sözcüklerin tekrarlanıp tekrarlanmadığına değil, cümledeki ana yargının ve mantıksal ilişkinin korunup korunmadığına bakmalısın.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS Genel Yetenek testinin belirleyici soru tiplerinden biri, verilen bir cümleyle **anlamca en yakın** olanı bulmak veya birbirine **anlamca ters düşen (çelişen)** cümleyi tespit etmektir. Yakın anlamlı cümle sorularında aynı sözcüklerin tekrarlanıp tekrarlanmadığına değil, cümledeki **ana yargının ve mantıksal ilişkinin** korunup korunmadığına bakmalısın. Nitekim çeldirici şıklar genellikle soru kökündeki anahtar kelimelerin tamamını taşır; ancak neden ile sonucun yerini değiştirir, koşulu ortadan kaldırır ya da kesinlik derecesini bozar."
  },
  {
    "type": "paragraph",
    "text": "Anlamca çelişen cümlelerde ise bir cümle bir yargıyı savunurken diğer cümle o yargının tam tersini veya kapsamını dışlayan bir görüşü ileri sürer. Bu sorularda cümlenin içindeki **\"yalnızca, sadece, hiçbir, bütün, yanı sıra, -a rağmen, değil ... de\"** gibi odaklayıcı bağlaç ve edatları belirlemek çözümü saniyeler içinde netleştirir. Çünkü cümlenin yönünü belirleyen yüklemden çok bu küçük anlam bağlarıdır."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca cümlenin **özne ve kapsam sınırını** da kontrol etmelisin: Örneğin dört seçenekte bir işin \"yalnızca Ali\" veya \"Ali''den başka kimse\" tarafından yapılamayacağı anlatılırken, beşinci seçenekte \"Ali''nin **yanı sıra** başkaları da bu işi yapabilir\" deniyorsa o cümle diğer dördünden anlamca tamamen farklılaşır. Benzer biçimde \"anlamca özdeşlik\" ararken etken-edilgen dönüşümlerini ve olumlu-olumsuz yapıları dikkatle eşleştirmen gerekir."
  },
  {
    "type": "paragraph",
    "text": "Yakın anlam ve çelişki sorularında üçüncü bir kontrol noktası da **koşul ve sınırlılık derecesidir**. Örneğin soru kökünde *\"Düzenli tekrar yapılmadıkça öğrenilen bilgiler kalıcı olmaz.\"* deniyorsa, bu cümle *\"Düzenli tekrar yapılırsa bilgiler kesinlikle kalıcı olur.\"* anlamına gelmez; yalnızca kalıcılık için düzenli tekrarın zorunlu bir ön şart olduğunu söyler. Aynı şekilde *\"İyi bir yazar kendi yaşadığı çağın tanığıdır.\"* cümlesiyle çelişen cümle *\"İyi yazarlar yaşadığı dönemden bağımsız, tamamen hayal dünyasında yazar.\"* yargısıdır; çünkü ilki yazar ile çağı arasında bağ kurarken ikincisi bu bağı bütünüyle koparmaktadır. Bu tür sorularda cümleyi kısa bir formüle dönüştürmek (*A -> B* veya *A yoksa B yok*) seçenekleri saniyeler içinde elemeni sağlar; ayrıca yüklemdeki kipin olumlu-olumsuz yapısını da mutlaka eşleştirmen gerekir. Örneğin iki olumsuzluğun (\"olmaz değil\") olumlu bir anlam doğurduğunu gözden kaçırmamalısın."
  },
  {
    "type": "table",
    "headers": [
      "Soru Tipi",
      "Çözüm Stratejisi",
      "Dikkat Edilecek Tuzak"
    ],
    "rows": [
      [
        "Yakın Anlamlı Cümle",
        "Yargı + neden/koşul yönünü eşleştir; eş anlamlı ifadeye çevir",
        "Aynı kelimeleri kullanıp neden ile sonucu yer değiştiren şıklar"
      ],
      [
        "Anlamca Farklı Cümle",
        "4 şık aynı mantık ekseninde buluşur; 1 şık kapsamı daraltır/genişletir",
        "\"Yalnızca Ali\" vs. \"Ali''nin yanı sıra başkaları da\" farkını kaçırmak"
      ],
      [
        "Çelişen Cümle",
        "Ana iddianın zıddını veya \"hiç/asla\" karşıtlığını ara",
        "\"Yalnızca yetenekle değil\" sözünü \"yetenek gereksiz\" diye okumak"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Mantık çözümlemesi: \"Erken yatma kararım, yarın çok erken kalkmam gerekmesinden kaynaklanıyor.\" cümlesiyle yakın anlamlı cümleyi ararken nedeni (**yarın erken kalkma zorunluluğu**) ve sonucu (**erken yatma kararı**) sabit tutmalısın. \"Yarın çok erken kalkacağım için bu gece erken yatmaya karar verdim.\" cümlesi anlamca özdeştir (**doğru**); ancak \"Erken yattığım için yarın erken kalkabileceğim.\" cümlesi neden ve sonucu **ters çevirdiği** için **yanlıştır**. Aynı biçimde \"Başarı, **yalnızca** yetenekle değil, yetenekle birlikte süreklilik gösteren çabayla da gelir.\" cümlesi yeteneği reddetmez; \"Başarı için yetenek hiç gerekli değildir.\" yargısı bu cümleyle **çelişir**, buna karşılık \"Yetenek tek başına başarıyı garantilemez.\" yargısı cümleyle **örtüşür**. Anlamca farklı cümle sorularında ise \"Bu raporu **yalnızca** Zeynep hazırlayabilir.\" ile \"Zeynep **dışında** kimse bu raporu hazırlayamaz.\" aynı yargıyı verirken, \"Zeynep''in **yanı sıra** ekip arkadaşları da bu raporu hazırlayabilir.\" cümlesi kapsamı genişleterek diğerlerinden ayrılır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yakın anlam ve çelişme sorularında en büyük tehlike **kelime avcılığıdır**: 1. Şıklarda soru kökündeki sözcüklerin aynısının geçmesi doğru cevap garantisi değildir; aksine ÖSYM en güçlü çeldiricileri aynı kelimelerin yerini veya neden-sonuç yönünü değiştirerek kurar. 2. `\"Yalnızca X ile değil, Y ile de...\"` kalıbı X''i yok saymaz; X''in tek başına **yetersiz** olduğunu, Y ile tamamlanması gerektiğini söyler."
  },
  {
    "type": "key_points",
    "items": [
      "Yakın anlamlı cümlede kelimelerin aynılığı değil, mantıksal ilişkinin (neden, amaç, koşul) yönü korunur.",
      "Cümledeki **\"yalnızca, sadece, yanı sıra, da\"** gibi küçük kelimeler cümlenin bütün anlamını değiştirir.",
      "\"X tek başına yetmez\" yargısı \"X önemsizdir\" anlamına gelmez."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.cumlede_anlam.04',
  'Türkçe',
  'Cümlede Anlam',
  4,
  'Bölüm 4: Cümleden Kesin Olarak Çıkarılabilecek Yargılar',
  '"Bu cümleden kesin olarak çıkarılabilecek yargı aşağıdakilerden hangisidir? " kalıbı, KPSS''nin en yüksek dikkat gerektiren mantıksal yorum sorusudur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "\"Bu cümleden **kesin olarak çıkarılabilecek** yargı aşağıdakilerden hangisidir?\" kalıbı, KPSS''nin en yüksek dikkat gerektiren mantıksal yorum sorusudur. Bu soru tipinde senden cümlenin konusunu yorumlaman veya günlük hayat bilgini kullanman **istenmez**; istenen tek şey, cümlede **açıkça söylenen veya mantıksal olarak zorunlu kılınan** dar ve kesin sonucu bulmandır. Cümlede geçmeyen bir tarih, sebep, amaç veya genelleme içeren hiçbir seçenek doğru olamaz."
  },
  {
    "type": "paragraph",
    "text": "Bu soruları çözerken \"kesinlik testi\" uygulamalısın: Cümledeki her kelimeyi tek tek kontrol et ve seçeneğin cümleden **bir adım bile öteye gidip gitmediğine** bak. Örneğin cümlede \"Okuma alışkanlığı, bir toplumun kültür düzeyini belirleyen ölçütler**den biri**dir.\" deniyorsa, bu cümleden toplumun kültür düzeyini belirleyen **başka ölçütlerin de bulunduğu** kesin olarak çıkarılır; buna karşılık \"Okuma alışkanlığı kültür düzeyinin **tek** ölçütüdür.\" ya da \"Okumayan toplumların kültürü **hiç** yoktur.\" yargıları aşırı genelleme olduğu için kesinlikle çıkarılamaz."
  },
  {
    "type": "paragraph",
    "text": "KPSS''de bu başlık altında **cümle birleştirme** ve **cümle tamamlama** soruları da sıkça sorulur. İki ayrı cümleyi anlamca eksiksiz ve doğru biçimde tek cümlede birleştirirken, verilen iki cümledeki hiçbir bilgiyi eksiltmemeli ve cümlelerde bulunmayan yeni bir neden-sonuç veya karşılaştırma ilişkisi eklememelisin. Cümle tamamlamada ise boşluktan önceki ve sonraki sözcüklerin olumlu-olumsuz tutumunu ve zamir uyumunu izlemek gerekir."
  },
  {
    "type": "paragraph",
    "text": "Kesin yargı sorularında dikkat etmen gereken bir başka nokta da **zaman ve sıra bildiren sözcüklerdir**. Cümlede *\"Bu yıl düzenlenen yarışmaya katılım geçen yıla göre iki kat arttı.\"* deniyorsa şu üç bilgi kesindir: (1) Yarışma geçen yıl da düzenlenmiştir; (2) Geçen yıl da sıfırdan büyük bir katılım olmuştur; (3) Bu yılki sayı geçen yılın iki katıdır. Buna karşılık *\"Yarışma gelecek yıl daha da kalabalık olacaktır.\"* veya *\"Katılımcıların tamamı yeni başvuranlardan oluşmaktadır.\"* gibi yargılar cümleden **çıkarılamaz**. Benzer şekilde *\"Sanatçının en çok ses getiren sergisi bu oldu.\"* cümlesinden sanatçının daha önce de sergiler açtığı çıkarılır, fakat önceki sergilerinin hiç beğenilmediği çıkarılamaz; çünkü \"en çok\" ifadesi diğerlerinin de belirli ölçüde ilgi gördüğünü gösterebilir. Her zaman yalnızca cümlenin doğrudan zorunlu kıldığı bilgiye tutunmalısın; cümlede geçmeyen her ek yorum çeldiricidir. Özellikle neden-sonuç bağlarının ters çevrilip çevrilmediğini ve kapsayıcılık sınırlarını mutlaka son kez kontrol et."
  },
  {
    "type": "table",
    "headers": [
      "Cümledeki İpucu",
      "Kesin Çıkarılan Yargı",
      "Çıkarılamayan Aşırı Yorum"
    ],
    "rows": [
      [
        "\"...ölçütlerden **biri**dir.\"",
        "Başka ölçütler de vardır",
        "Tek ölçüt budur"
      ],
      [
        "\"...**ilk kez** bu yıl uygulanmıştır.\"",
        "Daha önceki yıllarda uygulanmamıştır",
        "Önümüzdeki yıllarda da sürecektir"
      ],
      [
        "\"...son romanında da **yine**...\"",
        "Yazarın daha önce yayımlanmış başka romanları vardır",
        "Son romanı en başarılı eseridir"
      ],
      [
        "\"...eskiye **göre daha** yaygındır.\"",
        "Eskiden de belirli ölçüde vardı",
        "Gelecekte herkesçe benimsenecektir"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış çıkarım örneği: \"Yazar, **son** kitabında **da** Anadolu kasabalarındaki gündelik yaşamı sade bir dille ele almış.\" cümlesinden şu iki yargı **kesin** çıkarılır: (1) Yazarın bu kitaptan önce yayımlanmış en az bir kitabı daha vardır (\"son\" ve \"da\"). (2) Yazar önceki kitabında/kitaplarında da aynı konuyu veya benzer yaklaşımı işlemiştir (\"da\"). Buna karşılık \"Yazarın en çok okunan eseri son kitabıdır.\" veya \"Yazar bundan sonra başka kitap yazmayacaktır.\" yargıları cümlede hiçbir dayanağı olmadığı için **çıkarılamaz**. Benzer şekilde \"Araştırmaya katılanların **çoğu** sabah yürüyüşünü tercih etmiştir.\" cümlesinden \"Katılımcıların **tamamı** sabah yürüyüşü yapar.\" yargısını çıkarmak **yanlıştır**; çıkarılabilecek kesin yargı \"Sabah yürüyüşünü tercih etmeyen azınlık da vardır.\" bilgisidir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Kesin yargı sorularında ÖSYM adayları iki yolla yanıltır: 1. **Aşırı genelleme tuzağı:** Cümledeki \"bazı, biri, çoğunlukla\" gibi sınırlandırıcı sözcükleri şıkta **\"yalnızca, her zaman, bütün, tamamen\"** sözcüklerine dönüştürmek. 2. **Dış bilgi ekleme tuzağı:** Günlük hayatta doğru bildiğin ama verilen cümlede yer almayan bir sonucu (örneğin bir sanatçının başarılı olduğu için ödül aldığını) doğru sanmak. Yalnızca cümlenin izin verdiği kadarıyla yetinmelisin."
  },
  {
    "type": "key_points",
    "items": [
      "Kesin yargı sorularında kendi genel kültür bilgini değil, yalnızca cümledeki kelimeleri kullan.",
      "`\"da\"`, `\"yine\"`, `\"daha\"`, `\"ilk kez\"`, `\"son\"`, `\"biri\"` sözcükleri cümlede gizli ön kabuller taşır ve doğru cevabın anahtarıdır.",
      "`\"Tek, yalnızca, her zaman, hiçbir\"` gibi mutlak ifadeler cümlede geçmiyorsa o seçeneği doğrudan ele."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Paragrafta Anlam ve Yapı
-- Kaynak: docs/konu_anlatimi/turkce/03_paragrafta_anlam_ve_yapi.md
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
  'turkce.paragrafta_anlam_ve_yapi.01',
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  1,
  'Bölüm 1: Konu, Başlık, Ana Düşünce ve Yardımcı Düşünceler',
  'KPSS Türkçe testinin en geniş bölümünü oluşturan paragraf sorularını hızlı ve hatasız çözmek, paragrafın katmanlarını birbirinden ayırmaktan geçer.  Bir paragrafta üzerinde durulan, hakkında söz söylenen olay, kavram veya duruma konu denir ("Parçada neyden söz edilmektedir?',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS Türkçe testinin en geniş bölümünü oluşturan paragraf sorularını hızlı ve hatasız çözmek, paragrafın katmanlarını birbirinden ayırmaktan geçer. Bir paragrafta üzerinde durulan, hakkında söz söylenen olay, kavram veya duruma **konu** denir (\"Parçada neyden söz edilmektedir?\" sorusunun yanıtıdır). Yazarın o konu üzerinden okuyucuya iletmek istediği temel mesaja, yani parçanın yazılış amacına ise **ana düşünce** adı verilir (\"Yazar bu parçayı niçin yazmıştır?\" sorusunun yanıtıdır). **Başlık** ise parçanın hem konusunu hem de ana düşüncesini en kısa ve kapsayıcı biçimde özetleyen etiket niteliğindeki ifadedir."
  },
  {
    "type": "paragraph",
    "text": "Ana düşüncenin okuyucu tarafından anlaşılmasını sağlamak için parçada sıralanan örnekler, açıklamalar ve alt yargılar **yardımcı düşünceler**dir. \"Bu parçadan aşağıdakilerden hangisine **ulaşılamaz / değinilmemiştir**?\" biçimindeki olumsuz köklü sorular doğrudan yardımcı düşünceleri ölçer. Bu sorularda tüm parçayı defalarca okumak yerine, önce seçeneklerdeki **anahtar sözcükleri** belirleyip ardından paragraf içinde tarayarak eleme yapmak hem zaman kazandırır hem de dikkatsizlik hatalarını önler."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca KPSS''de ana düşünce soruları bazen **\"Bu parçada asıl anlatılmak istenen nedir?\"** veya **\"Bu parçada aşağıdaki sorulardan hangisinin yanıtı vardır?\"** biçiminde gelir. İlk cümledeki genel kabulü ya da karşı çıkılan fikri bir kenara bırakıp yazarın son cümlede yaptığı vurguya ve **\"kısacası, asıl, oysa, bundan ötürü\"** bağlaçlarının hemen sonrasına odaklanmak doğru yanıtı kesinleştirir. \"Hangi soruya yanıt olarak yazılmıştır?\" sorularında ise cevabın yalnızca parçanın bir ayrıntısına değil, **bütününe** karşılık gelmesi gerekir."
  },
  {
    "type": "paragraph",
    "text": "Yardımcı düşünce sorularında bir başka pratik yöntem de **\"ikili eşleştirme\"**dir. Seçenekleri okurken her seçenekteki temel iddiayı (örneğin *ekonomik etki, tarihsel köken, bireysel çaba*) tek bir anahtar kavrama indirgeyip parçada karşılığını gördüğün anda üzerine küçük bir işaret koyabilirsin. Parçayla birebir aynı kelimeleri kullanmasa bile eş anlamlı ifadelerle verilen bilgileri eşleştirmek (örneğin parçadaki *\"yazılı olmayan kurallar\"* ifadesini seçenekteki *\"sözlü gelenek\"* ile bağlamak) doğru eleme yapmanı sağlar. Buna karşılık parçada tek bir örnek olarak geçen bir durumu tüm gruba genelleyen seçenek (\"bütün sanatçılar...\", \"her zaman...\") neredeyse daima **ulaşılamaz** olan yanlış seçenektir. Parçanın **anlatım tonunu** (eleştirel mi, onaylayıcı mı, bilgilendirici mi) doğru yakalamak da çıkarılamayacak yargıyı bulmada sana güçlü bir pusula verir."
  },
  {
    "type": "table",
    "headers": [
      "Paragraf Ögesi",
      "Temel Soru",
      "Kapsam Özelliği"
    ],
    "rows": [
      [
        "Konu",
        "Yazar ne anlatıyor?",
        "Kavram/durum bildirir; yargı içermez (Ör: *Arıların doğadaki rolü*)"
      ],
      [
        "Ana Düşünce",
        "Yazar neyi savunuyor / iletmek istiyor?",
        "Tam ve kapsayıcı yargıdır; bütün parçayı kucaklar"
      ],
      [
        "Başlık",
        "Parçanın vitrini nedir?",
        "Konuyu ve ana vurgusunu birkaç sözcükle özetler"
      ],
      [
        "Yardımcı Düşünce",
        "Parçada hangi ayrıntılar var?",
        "Ana düşünceyi destekleyen alt yargılardır (çoğuldur)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Çözüm mantığı: Bir parçanın ilk cümlesinde \"Bal üretimi arıcılığın en bilinen çıktısıdır.\" denip sonraki dört cümlede arıların bitkilerin tozlaşmasını sağlayarak tarımsal devamlılığı ve doğal dengeyi nasıl koruduğu anlatılıyorsa, parçanın en uygun başlığı \"Bal Üretiminin Aşamaları\" **olamaz** (**yanlış**); çünkü bal yalnızca konuya giriş aracıdır. Doğru başlık \"Arıların Ekosistemdeki Önemi\" olmalıdır (**doğru**). Benzer biçimde bir parçada \"Kısa yazmak her zaman özlü yazmak değildir; özlülük gereksiz tek bir sözcüğün bile bulunmamasıdır.\" deniyorsa, \"Kısa yazılan her metin özlüdür.\" yargısına **ulaşılamaz**. Yine \"Günümüzde bilginin değerini yitirdiği sanılıyor; **oysa** değerini yitiren bilgi değil, bilgiyle kurulan yüzeysel ilişkidir.\" parçasında asıl anlatılmak istenen, bilginin değersizleştiği değil **bilgiye yaklaşım biçimimizin yüzeyselleştiği**dir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ana düşünce ve başlık sorularında ÖSYM''nin en yaygın tuzağı **ilk cümle çeldiricisidir**: 1. Yazar çoğu zaman eleştireceği veya yetersiz bulacağı yaygın görüşü (\"Değerini yitiren bilginin kendisi olduğu sanılıyor...\") ilk cümleye koyar, hemen ardından **\"Oysa / Ne var ki / Ancak\"** diyerek kendi asıl düşüncesini açıklar. İlk cümleyi ana düşünce sanmamalısın. 2. Yardımcı düşünce sorularında parçada geçen sözcüklerin şıkta kullanılması, o şıkkın doğru olduğunu göstermez; yargının olumlu-olumsuz yönünü ve sınırını kontrol etmelisin."
  },
  {
    "type": "key_points",
    "items": [
      "Konu \"ne anlatıldığı\", ana düşünce \"asıl verilmek istenen mesaj\"dır.",
      "Parçada \"Oysa, ancak, ne var ki, kısacası\" ifadelerinden sonra gelen cümleler genellikle ana düşünceyi taşır.",
      "Başlık parçanın yalnızca bir bölümünü değil, tamamını kapsamalıdır.",
      "Olumsuz köklü yardımcı düşünce sorularında önce şıkları tarayıp anahtar kelime eşleştirmesi yapmak hız kazandırır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.paragrafta_anlam_ve_yapi.02',
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  2,
  'Bölüm 2: Paragrafın Yapısı: Giriş, Gelişme, Sonuç ve Akışı Bozan Cümle',
  'Bir paragraf gelişigüzel yan yana getirilmiş cümleler topluluğu değil, mantıksal bir zincirle birbirine bağlanan düşünce birimidir.  Giriş cümlesi, konuyu tanıtan ve kendisinden önce başka bir cümlenin varlığını gerektirmeyen bağımsız bir cümledir; bu nedenle "Ancak, bu yüzden, oysa, çünkü, bundan dolayı, böylece, kısacası" gibi önceki cümleye atıf yapan bağlayıcı unsurlarla başlayamaz.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir paragraf gelişigüzel yan yana getirilmiş cümleler topluluğu değil, mantıksal bir zincirle birbirine bağlanan düşünce birimidir. **Giriş cümlesi**, konuyu tanıtan ve kendisinden önce başka bir cümlenin varlığını gerektirmeyen bağımsız bir cümledir; bu nedenle \"Ancak, bu yüzden, oysa, çünkü, bundan dolayı, böylece, kısacası\" gibi önceki cümleye atıf yapan bağlayıcı unsurlarla **başlayamaz**. **Gelişme bölümü**, girişte ortaya konan fikri örneklerle, açıklamalarla ve karşılaştırmalarla açar. **Sonuç cümlesi** ise anlatılanları toparlar ve yargıyı kesinleştirir."
  },
  {
    "type": "paragraph",
    "text": "Yapı sorularının önemli bir bölümü **düşüncenin akışını bozan cümle**, **boşluk doldurma** ve **paragrafı ikiye bölme** üzerine kurulur. Akışı bozan cümle, konudan tamamen kopuk olmak zorunda değildir; genellikle aynı ana konuyla ilgili olsa da konunun farklı bir yönüne (örneğin oyunun çocuk gelişimine katkısını anlatan parçada aniden oyuncak fabrikalarının maliyetine) geçerek zinciri kırar. Paragrafı ikiye bölme sorularında ise ikinci paragrafın ilk cümlesi mutlaka yeni bir giriş cümlesi niteliği taşımalı, önceki cümleye zamir veya bağlaçla yaslanmamalıdır."
  },
  {
    "type": "paragraph",
    "text": "Paragrafın bütününde zaman kiplerinin ve anlatıcı bakış açısının (birinci kişi mi üçüncü kişi mi) tutarlılığı da yapı ipucudur. Boşluk doldurma sorularında boşluğa gelecek cümlenin yalnızca anlamca değil, **dil bilgisel ve anlatım tutumu bakımından** da bir önceki ve bir sonraki cümleyle uyumlu olması gerekir; örneğin boşluktan sonra \"Bu iki etken...\" deniyorsa, boşlukta mutlaka iki farklı unsur sayılmış olmalıdır."
  },
  {
    "type": "paragraph",
    "text": "**Paragrafı ikiye bölme** sorularında ise dikkat etmen gereken iki temel işaret vardır. İlk olarak, ikinci paragrafın ilk cümlesi asla *\"Ancak bu durum...\"*, *\"Buna ek olarak...\"* veya *\"Öte yandan söz konusu eser...\"* gibi kendisinden önceki cümleye sırtını yaslayan bir ifade olamaz; çünkü her yeni paragraf kendi içinde bağımsız bir giriş cümlesiyle başlamak zorundadır. İkinci olarak, ilk paragrafta genellikle bir kavramın tanımı veya tarihsel arka planı verilirken, ikinci paragrafın başladığı cümlede konunun **günümüzdeki yansıması, farklı bir yönü veya uygulama alanı** ele alınır. İkiye bölme noktasını bulduğunda, o cümleyi yeni bir metnin ilk cümlesi gibi okuyup tek başına ayakta durup duramadığını mutlaka test etmelisin."
  },
  {
    "type": "paragraph",
    "text": "**Numaralanmış yerlerden hangisine getirilmelidir?** soru tipinde ise verilen cümlenin içindeki zamir ve bağlaçların yönüne bakılır: Cümle *\"Bu nedenle...\"* diyorsa bir sebebin hemen sonrasına, *\"Oysa...\"* diyorsa karşıt bir iddianın hemen arkasına yerleşir."
  },
  {
    "type": "table",
    "headers": [
      "Yapı Sorusu",
      "Çözüm Anahtarı",
      "Kontrol Edilecek Öge"
    ],
    "rows": [
      [
        "Boşluk Doldurma",
        "Boşluktan **önceki** ve özellikle **sonraki** cümleyi oku",
        "\"Çünkü, bu nedenle, oysa\" gibi bağların yönü"
      ],
      [
        "Akışı Bozan Cümle",
        "Çıkarıldığında önceki ve sonraki cümle birbirine bağlanır",
        "Konu aynı kalsa bile **odak/bakış açısı** değişimi"
      ],
      [
        "Paragrafı İkiye Bölme",
        "Konunun başka bir boyutuna geçilen cümleyi bul",
        "Bölünen cümlede bağlayıcı öge (\"bu fark, ancak\") olmamalı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Boşluk doldurma ve akış örneği: \"(I) Çocuklar için oyun, yalnızca vakit geçirilen bir eğlence değildir. (II) Çocuk kitaplarının kapak tasarımları da yayıncılıkta dikkat çekici bir alandır. (III) Çocuk, oyun kurarken kurallara uymayı ve paylaşmayı öğrenir.\" dizisinde II. cümle çocuklarla ilgili olsa da parçanın odak noktası olan \"oyunun çocuk gelişimine katkısı\" dışına çıktığı için **akışı bozar**; II çıkarıldığında I ile III doğrudan bağlanır. Boşluk doldurmada ise: \"Dijital mesajlaşma iletişimde hız kazandırdı. [ --- ] Çünkü ses tonu, bakış ve mimik kaybolunca duygu aktarımı zayıflıyor.\" yapısında boşluktan sonraki **\"Çünkü\"** gerekçe bildirdiği için boşluğa \"Mesafeleri tamamen ortadan kaldırdı.\" gibi salt övgü cümlesi getirmek **yanlıştır**; bunun yerine \"Ancak yüz yüze iletişimin anlam zenginliğini tam olarak karşılayamadı.\" gibi eksiklik bildiren bir cümle (**doğru**) gelmelidir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yapı sorularında iki tuzak çok sık görülür: 1. Akışı bozan cümle sorularında aday yalnızca \"konu kelimesi\" arar; oysa akışı bozan cümlede de aynı anahtar sözcükler geçebilir, belirleyici olan **anlatılan boyutun değişmesi**dir. 2. Boşluk doldurmada yalnızca boşluktan önceki cümleye bakıp uyumlu bir devam seçmek yanıltıcıdır; boşluktan **sonraki** cümlenin (\"Çünkü...\", \"Bu yüzden...\") hangi yargıyı açıkladığını mutlaka kontrol etmelisin."
  },
  {
    "type": "key_points",
    "items": [
      "Giriş cümlesi kendisinden önceki bir yargıya bağlanan sözcüklerle (\"ama, bu durum, çünkü, oysa\") başlayamaz.",
      "Paragrafı ikiye bölme noktasındaki cümle yeni bir giriş cümlesi niteliğinde olmalıdır.",
      "Akışı bozan cümle çıkarıldığında, kendisinden önceki ve sonraki cümle anlamca ve dilce birbirine kenetlenir.",
      "Boşluk doldurmada asıl ipucu çoğu zaman boşluğun hemen sonrasındaki cümlededir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.paragrafta_anlam_ve_yapi.03',
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  3,
  'Bölüm 3: Paragraf Oluşturma (Cümle Sıralama) ve Yer Değiştirme',
  'Numaralanmış cümlelerden anlamlı bir paragraf oluşturma veya hangi iki cümlenin yer değiştirmesi gerektiğini bulma soruları, metnin dil bilgisel ve mantıksal dokusunu izlemeyi gerektirir.  İlk adım her zaman giriş cümlesini bulmaktır: İçinde gönderme yapan işaret zamiri/sıfatı ("bu yaklaşım", "onların", "böyle bir tutum") veya bağlaç ("oysa, ise, ancak, bundan dolayı") bulunmayan, genel bir tanım ya da durum bildiren cümle ilk sıraya yerleşir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Numaralanmış cümlelerden anlamlı bir paragraf oluşturma veya hangi iki cümlenin yer değiştirmesi gerektiğini bulma soruları, metnin dil bilgisel ve mantıksal dokusunu izlemeyi gerektirir. İlk adım her zaman **giriş cümlesini** bulmaktır: İçinde gönderme yapan işaret zamiri/sıfatı (\"bu yaklaşım\", \"onların\", \"böyle bir tutum\") veya bağlaç (\"oysa, ise, ancak, bundan dolayı\") bulunmayan, genel bir tanım ya da durum bildiren cümle ilk sıraya yerleşir. Ardından her cümlenin sonundaki anahtar kavramın, bir sonraki cümlenin başında hangi kelimeyle veya bağlaçla devam ettiğini takip etmelisin."
  },
  {
    "type": "paragraph",
    "text": "Özellikle **\"ise, aksine, oysa, buna karşılık\"** gibi karşılaştırma ve karşıtlık bağlaçları cümleler arası kilidi oluşturur. Örneğin bir cümle \"ezber\" kavramını tanımlıyorsa, \"anlama **ise**...\" diye başlayan cümle mutlaka hemen onun ardından gelmek zorundadır. Kurduğun dizilişi belirledikten sonra baştan sona sesliymiş gibi bir kez okuyup zaman akışının ve zamir göndermelerinin pürüzsüz işlediğini doğrulamak hatayı sıfıra indirir."
  },
  {
    "type": "paragraph",
    "text": "**Cümlelerin yerini değiştirme** sorularında ise önce dizinin başından sonuna kadar cümleleri oku ve akışın **tam olarak hangi noktada kırıldığını** işaretle. Genellikle yer değiştirmesi gereken iki cümleden biri bağlayıcı bir ögeyle (*bu sorunlar, öte yandan*) erken gelmiş, diğeri ise konuyu açan genel bir cümle olarak geride kalmıştır. Seçeneklerde verilen ikili değişimleri zihninde uygulayıp yalnızca kırılma noktasındaki geçişi değil, bir önceki ve bir sonraki cümleyle olan bütünlüğü de test etmelisin."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca cümle sıralama sorularında **genelden özele veya kronolojik zamana** doğru ilerleyen doğal akışı da kullanabilirsin. Örneğin bir cümle tarihî bir sorunun ortaya çıkışından, bir diğeri bu sorunun çözüm önerisinden, sonuncusu da çözümün günümüzdeki sonucundan söz ediyorsa sıralama mutlaka *sorun -> çözüm önerisi -> sonuç* ekseninde kurulur. Eğer iki cümle arasında kararsız kalırsan cümle sonundaki son sözcük veya kavramın, bir sonraki cümlenin ilk iki sözcüğünde nasıl yankılandığına bak; Türkçede iyi kurulmuş paragraflar \"düşünce kancaları\" ile birbirine tutunur. Sıralamayı seçeneklerdeki başlangıç numaralarını eleyerek çözmek de hızını artırır; giriş cümlesini kesinleştirdiğin anda seçeneklerin yarısından fazlasını zaten elemiş olursun. Son olarak yer değiştirmesi gereken cümlelerde zamir uyumunu mutlaka baştan sona tekrar kontrol et."
  },
  {
    "type": "table",
    "headers": [
      "Bağlantı Aracı",
      "Gösterdiği Yön",
      "Sıralama İpucu"
    ],
    "rows": [
      [
        "\"Bu durum / Bu yaklaşım\"",
        "Önceki cümlede açıklanan olguya döner",
        "Mutlaka olgunun anlatıldığı cümleden **sonra** gelir"
      ],
      [
        "\"...ise / Buna karşılık\"",
        "Önceki cümledeki kavramın karşıtını/eşini açar",
        "Önceki kavram cümlesinin **hemen arkasına** konur"
      ],
      [
        "\"Çünkü / Zira\"",
        "Önceki yargının nedenini açıklar",
        "Gerekçelendirdiği yargı cümlesinden **sonra** gelir"
      ],
      [
        "\"Sonuç olarak / Kısacası\"",
        "Önceki tüm anlatımı toparlar",
        "Paragrafın **son** cümlesi olmaya adaydır"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sıralama örneği: (I) Bu yüzden yalnızca kuralları ezberlemek yeterli olmaz. (II) Öğrenme süreci iki temel basamaktan oluşur: ezber ve anlama. (III) Ezber, bilgiyi kısa süreli olarak zihinde tutmaya yarar. (IV) Anlama **ise** bilginin nedenlerini kavrayarak kalıcı hale getirmektir. (V) Kalıcı başarı, ancak bu iki basamağın ikincisine ağırlık verildiğinde sağlanır. Burada II genel giriş cümlesidir; III \"ezber\"i açar; IV **\"ise\"** bağıyla hemen III''ün ardından gelir; V kalıcı başarıyı ikincisine bağlar; I **\"bu yüzden\"** diyerek sonucu pekiştirir. Doğru sıra **II - III - IV - V - I** olur; dolayısıyla \"baştan üçüncü cümle hangisidir?\" sorusunun cevabı **IV**''tür (III''ü işaretlemek **yanlıştır**). İkinci bir örnekte, bir temel bilgi cümlesinin ardından \"Oysa bu ayrıntı çoğu zaman gözden kaçırılır.\" diyen cümle diğer açıklayıcı cümlelerden **önce** gelmelidir; çünkü olumsuz sonuçlar ancak o \"Oysa\" dönüşümünden sonra sıralanabilir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Cümle sıralama sorularında adaylar sıkça iki yanlışa düşer: 1. \"Baştan üçüncü cümle hangisidir?\" kökünde doğru sırayı bulup seçeneklerdeki **orijinal cümle numarasını** değil, sıralamadaki 3 rakamını işaretlemek (örneğin sıradaki 3. cümle IV ise cevap IV olmalıdır). 2. `\"Oysa\"` veya `\"ise\"` içeren bir cümleyi anlam yakınlığına göre uzağa atmak; oysa bu bağlaçlar genellikle bir önceki cümledeki spesifik kavrama doğrudan tutunur."
  },
  {
    "type": "key_points",
    "items": [
      "İlk cümlede gönderme yapan zamir (\"bu, şu, o\") ve geçiş bağlacı (\"ancak, oysa, çünkü\") bulunmaz.",
      "Cümle sonundaki anahtar sözcük, bir sonraki cümlenin başında tekrarlanır veya zamirle karşılanır.",
      "Diziliş bittikten sonra soru kökünün \"baştan kaçıncı\" cümleyi sorduğunu mutlaka tekrar kontrol et."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.paragrafta_anlam_ve_yapi.04',
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  4,
  'Bölüm 4: Anlatım Biçimleri ve Düşünceyi Geliştirme Yolları',
  'Yazarın konuyu ele alış amacına göre seçtiği temel aktarım yöntemine anlatım biçimi denir.  Dört temel anlatım biçimi vardır: Okuyucuya bilgi vermek ve bir konuyu öğretmek amacıyla nesnel ağırlıklı yazılan açıklayıcı anlatım; bir görüşü çürütüp kendi fikrini kabul ettirmeye çalışan, soru ve karşı çıkışlar içeren tartışmacı anlatım; bir olayı zaman, mekân ve kişi unsurlarıyla hareket halinde aktaran öyküleyici anlatım; varlıkları ve manzaraları görme, işitme, dokunma gibi duyu ayrıntılarıyla okuyucunun zihninde resim gibi canlandıran betimleyici anlatım.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Yazarın konuyu ele alış amacına göre seçtiği temel aktarım yöntemine **anlatım biçimi** denir. Dört temel anlatım biçimi vardır: Okuyucuya bilgi vermek ve bir konuyu öğretmek amacıyla nesnel ağırlıklı yazılan **açıklayıcı anlatım**; bir görüşü çürütüp kendi fikrini kabul ettirmeye çalışan, soru ve karşı çıkışlar içeren **tartışmacı anlatım**; bir olayı zaman, mekân ve kişi unsurlarıyla hareket halinde aktaran **öyküleyici anlatım**; varlıkları ve manzaraları görme, işitme, dokunma gibi duyu ayrıntılarıyla okuyucunun zihninde resim gibi canlandıran **betimleyici anlatım**."
  },
  {
    "type": "paragraph",
    "text": "Yazar anlatım biçimini güçlendirmek için **düşünceyi geliştirme yollarına** başvurur: Bir kavramın ne olduğunu bildiren (\"... nedir?\" sorusunu yanıtlayan) **tanımlama**; soyut düşünceyi somut ve tekil bir durumla destekleyen **örnekleme**; düşüncesini alanında yetkin bir kişinin sözüyle (tırnak içinde veya doğrudan aktarımla) pekiştiren **tanık gösterme**; iki varlık veya görüş arasındaki benzerlik/farklılığı ortaya koyan **karşılaştırma**; bir varlığı başka bir varlığın özellikleriyle anlatan **benzetme** ve araştırma, anket veya istatistik rakamlarını kanıt olarak sunan **sayısal verilerden yararlanma**."
  },
  {
    "type": "paragraph",
    "text": "Sınavda sıkça **\"Bu parçada ağır basan anlatım biçimi hangisidir?\"** veya **\"Düşüncesini geliştirirken hangisine başvurmuştur?\"** soruları yöneltilir. Bir parçada birden fazla anlatım biçimi (örneğin hem öyküleme hem betimleme) bir arada bulunabilir; burada belirleyici olan parçanın **genel yazılış amacıdır**. Yazar okuyucuyu bir olayın içinde gezdiriyorsa öyküleme, bir mekânı veya kişiyi göz önünde canlandırıp duruyorsa betimleme ağır basar. Aynı biçimde tartışmacı anlatımda yazar mutlaka karşısında bir muhatap varmış gibi soru sorar ve yerleşik bir düşünceye itiraz eder; açıklayıcı anlatımda ise sakin, öğretici ve nesnel bir dil hâkimdir."
  },
  {
    "type": "paragraph",
    "text": "Anlatım niteliklerinden **özlülük, yalınlık, duruluk, açıklık ve akıcılık** kavramları da zaman zaman sorulur: Az sözle çok anlam ifade etmeye **özlülük**, süsten ve gereksiz sanattan uzak durmaya **yalınlık**, gereksiz sözcük kullanmamaya **duruluk**, cümleden herkesin aynı anlamı çıkarmasına **açıklık**, metnin pürüzsüz ve kolay okunmasına ise **akıcılık** denir. Bu kavramlar anlatım bozukluğu sorularının da temelini oluşturur."
  },
  {
    "type": "table",
    "headers": [
      "Yöntem / Biçim",
      "Ayırt Edici Özellik",
      "Sık Karıştırılan Nokta"
    ],
    "rows": [
      [
        "Öyküleme vs. Betimleme",
        "Öyküleme: **olay ve zaman akışı** (hareketli); Betimleme: **durgun sahne, sıfat ve duyu ayrıntısı**",
        "Betimlemede de çekimli fiil olabilir; olay örgüsü yoksa betimlemedir"
      ],
      [
        "Örnekleme vs. Tanık Gösterme",
        "Örnekleme: isim/durum anma; Tanık gösterme: **kişinin sözünü aktarma**",
        "Yalnızca ünlü bir yazarın adını anmak tanık gösterme değil **örnekleme**dir"
      ],
      [
        "Tanımlama",
        "\"Bu nedir?\" sorusuna \"…dır / …denir\" ile net yanıt verir",
        "Her açıklayıcı cümle tanım değildir"
      ],
      [
        "Sayısal Verilerden Yararlanma",
        "Araştırma, oran, istatistik verisi sunar",
        "Örnek içindeki \"dört beş kitap\" gibi sayılar veri **sayılmaz**"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ayrım: \"Sabahın erken saatlerinde dar sokaklar taş duvarlara vuran güneşle aydınlanıyor, fırından taze ekmek kokusu yayılıyordu.\" parçasında \"aydınlanıyor, yayılıyordu\" gibi fiiller geçse de zaman içinde gelişen bir olay örgüsü yoktur; görsel ve kokusal ayrıntılarla bir ortam çizildiği için ağır basan anlatım biçimi **betimleme**dir (**öyküleme demek yanlıştır**). Düşünceyi geliştirme yollarında ise \"Okuma alışkanlığı küçük adımlarla kazanılır. Örneğin günde yalnızca on sayfa okuyan bir kişi yılda dört beş kitap bitirebilir.\" parçasında \"on sayfa, dört beş kitap\" sayıları bilimsel bir anket verisi değil, **\"Örneğin\"** sözünü somutlaştıran günlük örneklerdir; dolayısıyla burada **örnekleme** vardır, sayısal verilerden yararlanma yoktur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Dört temel anlatım biçimini **A-T-Ö-B** şeklinde kodla: - **A**çıklama (bilgi verir) - **T**artışma (fikir çürütür, ikna eder) - **Ö**yküleme (olay ve zaman akışı anlatır) - **B**etimleme (duyularla zihinde resim çizer)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bu bölümde ÖSYM''nin en sevdiği iki çeldirici şunlardır: 1. **Tanık gösterme** ile **örnekleme** ayrımı: Parçada \"Mevlana, Yunus Emre, Tolstoy\" gibi isimlerin sadece sayılması örneklemedir; tanık gösterme olabilmesi için o kişinin **sözünün (görüşünün)** doğrudan veya dolaylı olarak cümlede yer alması şarttır. 2. **Sayısal veri** tuzağı: Paragrafta herhangi bir rakam veya sayı geçmesi sayısal verilerden yararlanma anlamına gelmez; sayıların araştırma, ölçüm veya istatistiksel kanıt niteliği taşıması gerekir."
  },
  {
    "type": "key_points",
    "items": [
      "Öykülemede olay ve zaman akışı, betimlemede duyu ayrıntıları ve durağan manzara öne çıkar.",
      "Tanık göstermede yalnızca kişi adı yetmez; o kişinin sözü veya görüşü de aktarılmalıdır.",
      "Tanımlama \"Nedir?\" sorusuna kesin yanıt veren cümlelerle yapılır.",
      "Örnek verirken kullanılan sıradan sayılar sayısal verilerden yararlanma sayılmaz."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözcükte Yapı ve Ekler
-- Kaynak: docs/konu_anlatimi/turkce/04_sozcukte_yapi_ve_ekler.md
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
  'turkce.sozcukte_yapi_ve_ekler.01',
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  1,
  'Bölüm 1: Kök Türleri (İsim Kökü, Fiil Kökü, Sesteş ve Ortak Kök)',
  'Sözcüğün anlamlı en küçük ve ek almamış parçasına kök denir.  Bir sözcüğün kökünü bulurken yalnızca sondan ekleri atmak yetmez; bulduğun kök ile sözcüğün son hali arasında mutlaka anlam ilişkisi bulunmalıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözcüğün anlamlı en küçük ve ek almamış parçasına **kök** denir. Bir sözcüğün kökünü bulurken yalnızca sondan ekleri atmak yetmez; bulduğun kök ile sözcüğün son hali arasında mutlaka **anlam ilişkisi** bulunmalıdır. Örneğin \"balık\" sözcüğünün kökü \"bal\" olamaz; çünkü bal ile balık arasında anlam bağı yoktur. Kökler sözcük türü bakımından temel olarak **isim (ad) kökü** ve **fiil (eylem) kökü** olmak üzere ikiye ayrılır. Sonuna `-mak / -mek` mastar ekini getirebildiğin kökler fiil kökü, getiremediklerin ise isim köküdür."
  },
  {
    "type": "paragraph",
    "text": "Bazı kökler ise hem isim hem fiil biçiminde karşımıza çıkabilir; bu noktada iki farklı kavramı ayırmak gerekir. Yazılışları aynı olduğu halde aralarında **hiçbir anlam bağı bulunmayan** ve biri isim biri fiil olan köklere **sesteş kök** denir (*yaz* mevsimi ile *yaz-* eylemi). Buna karşılık aralarında **açık bir anlam ilişkisi bulunan** ve hem isim hem fiil olarak kullanılabilen köklere **ortak kök (kökteş)** adı verilir (*boya* ile *boya-*, *barış* ile *barış-*, *eski* ile *eski-*, *güven* ile *güven-*). Yansıma kökler ise doğadaki sesi taklit ettikleri için TDK ve ÖSYM yaklaşımında **isim kökü** kabul edilir (*çıt-, şır-, hor-*)."
  },
  {
    "type": "paragraph",
    "text": "Sözcüğün kökünü doğru belirlemek, sonraki bütün ek çözümlemesinin temelidir. Örneğin bir sözcüğün sonundaki yapım ekini doğru tespit etsen bile kökü yanlış seçersen \"addan mı fiilden mi türediği\" sorusunda elenirsin. Özellikle ses olayına uğramış köklerde (örneğin *uyku* sözcüğünde kökü *uyu-* fiili olarak görmek, *benzi* sözcüğünde kökü *beniz* ismi olarak görmek veya *çevresi* sözcüğünde kökü *çevir-* fiili olarak yakalamak) ünlünün ya da ünsüzün düştüğünü fark edip kökün ilk hâline dönmen gerekir."
  },
  {
    "type": "paragraph",
    "text": "İki kök türü olan **sesteş kök** ile **ortak kök (kökteş)** ayrımı da sıkça karıştırılır. Sesteş kökte isim ve fiil arasında yalnızca tesadüfi bir ses benzerliği vardır; örneğin çiçek olan *gül* ile *gül-* eylemi arasında hiçbir anlam ilgisi bulunmaz. Oysa ortak kökte (*güven / güven-*, *boya / boya-*, *ekşi / ekşi-*, *kuru / kuru-*, *göç / göç-*) isimle fiil birbirinin doğrudan anlam uzantısıdır. Sözcüğün cümlede isim mi fiil mi olduğunu belirledikten sonra üzerine gelen eklerin türünü de buna göre adlandırmalısın."
  },
  {
    "type": "paragraph",
    "text": "Yansıma köklerin de daima **isim kökü** sayıldığını unutma: Örneğin *\"Dallar rüzgârdan çatırdıyordu.\"* cümlesinde *çatır* yansıma isim köküdür ve `-da` isimden fiil yapım ekiyle fiile dönüşmüştür."
  },
  {
    "type": "table",
    "headers": [
      "Kök Türü",
      "Temel Ölçüt",
      "Örnek"
    ],
    "rows": [
      [
        "İsim (Ad) Kökü",
        "`-mak/-mek` almaz; varlık veya kavram karşılar",
        "*göz, kitap, süt, tuz, yok, kapı*"
      ],
      [
        "Fiil (Eylem) Kökü",
        "`-mak/-mek` alır; iş, oluş, hareket bildirir",
        "*gül-, çalış-, yaz-, uyu-, sev-*"
      ],
      [
        "Sesteş Kök",
        "Yazılış aynı, anlam bağı **yok**",
        "*gül* (çiçek) / *gül-* (eylem); *kır* (doğa) / *kır-* (parçalamak)"
      ],
      [
        "Ortak Kök (Kökteş)",
        "Yazılış aynı, anlam bağı **var**",
        "*boya* (madde) / *boya-* (eylem); *savaş* / *savaş-*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış kök analizi: \"**Çalışkan** sözcüğü fiilden türemiştir.\" yargısı **doğrudur**; çünkü sözcüğün kökü `-mak` alabilen **çalış-** fiil köküdür ve üzerine `-kan` fiilden isim yapım eki gelmiştir. Buna karşılık \"**Yoksul** ve **kapıcı** sözcükleri fiilden türemiştir.\" yargısı **yanlıştır**; çünkü \"yok\" ve \"kapı\" sözcükleri mastar eki alamayan **isim kökleridir**. Yine \"**Gülüş** sözcüğü addan türemiştir.\" demek **yanlıştır**; çünkü kökü **gül-** fiilidir ve `-üş` ekiyle fiilden isim (ad) yapılmıştır. Ses olaylı köklerde ise \"*Kavşak*\" sözcüğünün kökü *kavuş-* fiili, \"*Adım*\" sözcüğünün kökü ise *at-* fiilidir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Kök bulma sorularında ÖSYM iki noktayı tuzak olarak kullanır: 1. \"Gözlük\" veya \"yaşlı\" gibi sözcükler günlük dilde tek parça gibi algılandığı için aday \"gözlük\"ü kök sanabilir; oysa kök **göz**dür, `-lük` ise yapım ekidir. 2. Yansıma köklü fiilleri (örneğin *patladı, gıcırdadı, fısıldadı*) aday fiil köklü sanır; oysa yansıma sözcükler (*pat, gıcır, fıs*) **isim kökü** sayılır ve `-la / -da` ekleriyle isimden fiile dönüşür."
  },
  {
    "type": "key_points",
    "items": [
      "Kök ile türemiş sözcük arasında mutlaka anlam bağı olmalıdır.",
      "`-mak/-mek` alan kökler fiil, almayanlar ve yansıma kökler isim köküdür.",
      "Sesteş kökte anlam bağı yoktur; ortak kökte (kökteş) ise iki kullanım arasında anlam bağı sürer.",
      "Sözcüğün hangi türden türediğini bulmak için önce ekleri atıp ilk köke inilmelidir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcukte_yapi_ve_ekler.02',
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  2,
  'Bölüm 2: Yapım Ekleri ve Dört Yapım Eki Türü',
  'Sözcüklerin kök veya gövdelerine gelerek onlardan yeni anlamlı veya yeni türde sözcükler üreten eklere yapım eki denir.  Bir köke en az bir yapım eki gelmesiyle oluşan yeni yapıya gövde adı verilir; gövdeye ikinci bir yapım eki gelirse "gövdeden türemiş sözcük" oluşur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözcüklerin kök veya gövdelerine gelerek onlardan **yeni anlamlı veya yeni türde** sözcükler üreten eklere **yapım eki** denir. Bir köke en az bir yapım eki gelmesiyle oluşan yeni yapıya **gövde** adı verilir; gövdeye ikinci bir yapım eki gelirse \"gövdeden türemiş sözcük\" oluşur. Türkçede yapım ekleri, geldikleri sözcüğün türüne ve ortaya çıkardıkları yeni sözcüğün türüne göre dört gruba ayrılır: **isimden isim**, **isimden fiil**, **fiilden isim** ve **fiilden fiil** yapım ekleri."
  },
  {
    "type": "paragraph",
    "text": "Bu sınıflandırmada özellikle iki ayrıntı önemlidir. Birincisi, ÖSYM''nin yerleşik dil bilgisi yaklaşımında tüm **fiilimsi (eylemsi) ekleri** (`-ma, -ış, -mak, -an, -acak, -dık, -erek, -ınca...`) fiil kök veya gövdelerine gelerek onları isim, sıfat ya da zarf görevine soktuğu için **fiilden isim yapım eki** kabul edilir; bu nedenle fiilimsi eki alan her sözcük yapı bakımından **türemiş**tir. İkincisi, bir fiilin **çatı ekleri** (`-l, -n, -ş, -t, -dır, -r`) fiilin anlamını ve nesne-özne ilişkisini değiştirdiği için **fiilden fiil yapım eki** sayılır."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca yapım eklerinin en önemli özelliği **işlek** veya **kalıplaşmış** biçimde yeni kavramlar üretmesidir; bazen aynı sözcüğün üzerinde birden fazla tür değiştirme gerçekleşebilir. Örneğin bir isim köküne önce isimden fiil yapım eki, ardından fiilden isim yapım eki gelebilir (*baş-la-n-gıç*). Sınavda \"türünü değiştirmiştir\" veya \"gövdeden türemiştir\" gibi ifadeler gördüğünde her ekin solundaki ve sağındaki sözcük türünü tek tek test etmelisin."
  },
  {
    "type": "paragraph",
    "text": "Burada **gövdeden türeme** kavramını da netleştirmek gerekir: Bir sözcüğün \"gövdeden türemiş\" sayılabilmesi için köke en az **iki yapım eki** gelmiş olması şarttır. Örneğin *göz-lük* sözcüğü tek yapım eki aldığı için yalnızca **gövde**dir; ancak *göz-lük-çü* veya *sev-in-ç* sözcükleri bir gövdeye ikinci bir yapım eki eklendiği için **gövdeden türemiş** sözcüklerdir. Aynı şekilde *ev-siz-ler* sözcüğünde tek yapım eki (`-siz`) ve bir çekim eki (`-ler`) bulunduğundan bu sözcük türemiş olsa da gövdeden türemiş sayılmaz; çekim ekleri gövdeyi ikinci kez türetmez."
  },
  {
    "type": "table",
    "headers": [
      "Yapım Eki Türü",
      "Görevi",
      "Örnekler"
    ],
    "rows": [
      [
        "İsimden İsim (İİYE)",
        "İsimden yeni bir isim/sıfat türetir",
        "*göz-lük*, *tuz-lu*, *kitap-lık*, *ev-siz*, *Türk-çe*, *üç-er*"
      ],
      [
        "İsimden Fiil (İFYE)",
        "İsim kök/gövdesinden fiil türetir",
        "*baş-la-*, *su-sa-*, *mor-ar-*, *yaş-a-*, *iyi-leş-*"
      ],
      [
        "Fiilden İsim (FİYE)",
        "Fiilden isim, sıfat veya zarf türetir",
        "*bil-gi*, *gül-üş*, *çalış-kan*, *yaz-ı*, *oku-yucu*"
      ],
      [
        "Fiilden Fiil (FFYE)",
        "Fiilden yeni anlamlı veya çatılı fiil türetir",
        "*sev-in-*, *yaz-dır-*, *gör-üş-*, *kaz-ı-*, *kop-ar-*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Ek analizi örneği: \"**Gözlüklerimizden** sözcüğünde kaç yapım ve kaç çekim eki vardır?\" Sözcüğü kökünden itibaren ayırdığımızda: `göz` (isim kökü) + `-lük` (isimden isim yapım eki) + `-ler` (çoğul çekim eki) + `-imiz` (iyelik çekim eki) + `-den` (ayrılma hâl eki) elde edilir. Dolayısıyla bu sözcükte **1 yapım eki, 3 çekim eki** vardır. Yine \"**Bilgi-len-mek**\" örneğinde: `bil-` (fiil kökü) + `-gi` (FİYE, gövde) + `-len` (İFYE, gövdeden türemiş fiil) + `-mek` (FİYE, isim-fiil eki) sırasıyla üç yapım eki kullanılmıştır. Buna karşılık \"**Okulları**\" sözcüğünde `-lar` ve `-ı` çekim eki olduğu için gövde oluşmamıştır; \"gövdeden türemiş\" demek **yanlıştır**."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Sözcük çözümlemede ek sırasını **K-Y-Ç** (Kök + Yapım Eki + Çekim Eki) şeklinde hatırla: Türkçede olağan dizilim önce yapım eklerinin, ardından çekim eklerinin gelmesidir. İstisna: çekim ekinden sonra yapım eki gelebilir (*anne-m-siz, gün-de-lik, top-tan-cı*)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yapım eki sorularında iki hata çok sık yapılır: 1. Bir sözcüğün uzun olması çok sayıda yapım eki aldığı anlamına gelmez; örneğin *evlerimizdekilerden* sözcüğünde `-ler`, `-imiz`, `-de` çekim ekidir, yalnızca sıfat yapan `-ki` yapım ekidir. 2. Fiillerin çatı eklerini (`sev-in-`, `yaz-dır-`, `düş-ün-`) çekim eki sanmak yanlıştır; bu ekler yeni fiil türettiği için **fiilden fiil yapım eki**dir ve sözcüğü türemiş yapar."
  },
  {
    "type": "key_points",
    "items": [
      "Yapım eki sözcüğün anlamını veya türünü değiştirir; çekim eki ise yalnızca cümle içi görevini belirler.",
      "Bir yapım eki almış sözcüğe **gövde** denir.",
      "Tüm fiilimsi ekleri **fiilden isim yapım eki**, tüm çatı ekleri **fiilden fiil yapım eki** sayılır.",
      "Sözcüğün yapısını bulmak için çekim eklerini değil, yalnızca **yapım eki** olup olmadığını kontrol etmelisin."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcukte_yapi_ve_ekler.03',
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  3,
  'Bölüm 3: Çekim Ekleri (İsim ve Fiil Çekim Ekleri)',
  'Sözcüğün anlamını ve türünü değiştirmeden cümle içindeki diğer sözcüklerle ilişkisini kuran, yerini, sayısını, zamanını veya kişisini bildiren eklere çekim eki denir.  Çekim ekleri isim çekim ekleri ve fiil çekim ekleri olarak iki ana grupta incelenir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözcüğün anlamını ve türünü değiştirmeden cümle içindeki diğer sözcüklerle ilişkisini kuran, yerini, sayısını, zamanını veya kişisini bildiren eklere **çekim eki** denir. Çekim ekleri **isim çekim ekleri** ve **fiil çekim ekleri** olarak iki ana grupta incelenir. İsim çekim ekleri başlıca şunlardır: çoğul eki (`-ler/-lar`), durum (hâl) ekleri (`-i` belirtme, `-e` yönelme, `-de` bulunma, `-den` ayrılma), iyelik (aitlik) ekleri (`-m, -n, -i, -miz, -niz, -leri`), tamlayan (ilgi) eki (`-ın/-in/-un/-ün`) ve vasıta/eşitlik ekleri (`-le/-la`, `-ce/-ca`). Fiil çekim ekleri ise haber ve dilek **kip ekleri**, **kişi (şahıs) ekleri** ve **ek-fiil** ekleridir (`idi, imiş, ise, -dır`)."
  },
  {
    "type": "paragraph",
    "text": "Sınavlarda en çok ölçülen nokta, **aynı ses biçimine sahip eklerin** yapım eki mi çekim eki mi olduğunu ya da hangi çekim eki görevini üstlendiğini ayırt etmektir. Örneğin `-i / -ı` eki cümlede \"neyi, kimi?\" sorusuna yanıt veriyorsa **belirtme hâl eki**, \"kimin / neyin?\" aitliğini bildiriyorsa **3. tekil kişi iyelik eki**dir. Benzer biçimde `-de` ve `-den` ekleri normalde durum (çekim) eki iken, bir ismi sıfat ya da yeni bir kavram haline getirdiklerinde (\"gözde öğrenci\", \"sıradan bir gün\") **yapım eki** görevine geçerler; `-ki` eki de ilgi zamiri olduğunda çekim eki, sıfat yaptığında (\"evdeki hesap\") yapım eki kabul edilir."
  },
  {
    "type": "paragraph",
    "text": "Fiil çekim eklerinde ise iki durumu ayırmak gerekir: Kip eklerinden `-mış, -ecek, -ar, -mez` çekimli fiilin yükleminde zaman bildirdiğinde **çekim eki**, bir ismin önüne gelip onu nitelediğinde ise sıfat-fiil yani **yapım eki** görevindedir. Olumsuzluk eki `-ma/-me` ise dil bilgisinde tartışmalı olmakla birlikte ÖSYM tarafından yaygın biçimde **fiil çekim eki** (veya anlam değiştirmeyen olumsuzluk eki) çerçevesinde değerlendirilir ve sözcüğü tek başına türemiş yapmaz."
  },
  {
    "type": "paragraph",
    "text": "Son olarak, isim çekim eklerinden **ilgi (tamlayan) eki `-ın/-in/-un/-ün`** ile **2. tekil iyelik eki `-ın/-in`** arasındaki farkı da cümledeki tamlama yapısına göre ayırmalısın: *\"Senin kitab-ın\"* ifadesinde baştaki `-in` tamlayan (ilgi) eki, sondaki `-ın` ise 2. tekil iyelik ekidir. Ayrıca yönelme (`-e`), bulunma (`-de`) ve ayrılma (`-den`) ekleri eklendikleri ismin türünü değiştirmeden onu dolaylı tümleç veya zarf tümleci görevine sokar; ancak kalıplaşarak yeni bir sıfat ya da isim kurduklarında (*gözde*, *sıradan*, *yüzde*) yapım ekine dönüşürler."
  },
  {
    "type": "table",
    "headers": [
      "Karıştırılan Ek",
      "Çekim Eki Kullanımı",
      "Yapım Eki veya Farklı Görev"
    ],
    "rows": [
      [
        "`-i / -ı`",
        "**Evi** dün boyadık. (Belirtme hâl eki) / **Evi** çok genişmiş. (3. tekil iyelik)",
        "**Yapı**, **ölçü**, **gezi** (Fiilden isim yapım eki)"
      ],
      [
        "`-de / -den`",
        "Kitabım **masada** kaldı. / **Evden** çıktım. (Hâl ekleri)",
        "**Sözde** dostlar, **sıradan** olaylar (Yapım eki)"
      ],
      [
        "`-im`",
        "Benim **evim** (1. tekil iyelik) / **Benim** kitabım (Tamlayan) / Gel**dim** (Kişi eki)",
        "**Seçim**, **üretim**, **yatırım** (Fiilden isim yapım eki)"
      ],
      [
        "`-mış / -ecek`",
        "Dün çok yağmur yağ**mış**. (Duyulan geçmiş kip)",
        "**Yanmış** ekmek, **gelecek** yıl (Sıfat-fiil = yapım eki)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "İkili ayrım örneği: \"**Evlerimiz** çok geniş.\" cümlesinde `ev` köküne yalnızca `-ler` (çoğul) ve `-imiz` (1. çoğul iyelik) çekim ekleri gelmiştir; sözcükte **yapım eki yoktur** ve yapıca **basit**tir. Buna karşılık \"**Evimiz**i geçindirmek için çok çalıştı.\" ile \"**Evi** sokağın başındaydı.\" cümlelerindeki `-i` eklerini karşılaştırdığımızda: \"Evi sokağın başındaydı.\" cümlesinde \"(onun) evi\" anlamı olduğu için `-i` **iyelik eki**dir; \"Evi dün sattık.\" cümlesinde ise \"neyi sattık?\" sorusuna cevap verdiği için **belirtme hâl eki**dir. Aynı şekilde \"Masada **sıradan** bir defter vardı.\" cümlesindeki `-dan` sıfat yaptığı için **yapım eki**dir; bunu ayrılma hâl eki saymak **yanlıştır**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Çekim eki sorularında iki klasik tuzağa dikkat et: 1. \"Onun evi\" ile \"evi temizledi\" yapılarındaki `-i` ekleri aynı görünür; başına **\"onun\"** getirebiliyorsan iyelik eki, **\"neyi / kimi\"** sorusuna yanıt veriyorsa belirtme hâl ekidir. İkisi arka arkaya da gelebilir: `ev-i-n-i` (ilk `-i` iyelik, ikinci `-i` belirtme hâl eki). 2. `-yor, -acak, -mış` gibi kip ekleri veya `-ler, -imiz` çekim ekleri bir sözcüğü asla türemiş yapmaz; örneğin *gideceklerdi* sözcüğü uzun olmasına rağmen yapım eki almadığı için **basit yapılı**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Çekim ekleri sözcüğün temel anlamını değiştirmez, yalnızca cümle içi bağ kurar.",
      "Belirtme hâl eki `-i` ile 3. tekil iyelik eki `-i` \"onun\" zamiriyle birbirinden ayrılır.",
      "`-de, -den, -mış, -ecek` ekleri sıfat görevinde yeni kavram kurduğunda yapım ekine dönüşebilir.",
      "Yalnızca çekim eki almış sözcükler uzun bile olsalar yapı bakımından **basit** kalır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcukte_yapi_ve_ekler.04',
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  4,
  'Bölüm 4: Yapı Bakımından Sözcükler (Basit, Türemiş, Birleşik ve Pekiştirme)',
  'Bir sözcüğün türü (isim, sıfat, fiil) ile yapısı (basit, türemiş, birleşik) birbirinden tamamen farklı iki sorudur.  Yapı bakımından sözcükler üçe ayrılır: Hiç yapım eki almamış (kök halinde veya yalnızca çekim eki almış) sözcüklere basit sözcük, en az bir yapım eki almış sözcüklere türemiş sözcük, en az iki bağımsız sözcüğün yeni bir kavram karşılamak üzere kalıplaşmasıyla oluşan sözcüklere ise birleşik sözcük denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir sözcüğün türü (isim, sıfat, fiil) ile **yapısı** (basit, türemiş, birleşik) birbirinden tamamen farklı iki sorudur. Yapı bakımından sözcükler üçe ayrılır: Hiç yapım eki almamış (kök halinde veya yalnızca çekim eki almış) sözcüklere **basit sözcük**, en az bir yapım eki almış sözcüklere **türemiş sözcük**, en az iki bağımsız sözcüğün yeni bir kavram karşılamak üzere kalıplaşmasıyla oluşan sözcüklere ise **birleşik sözcük** denir."
  },
  {
    "type": "paragraph",
    "text": "Birleşik sözcükler kendi içinde hem isimler hem fiiller için farklı yollarla kurulur: İki ismin tamlama yoluyla birleşmesi (*hanımeli, kuşburnu, gözyaşı*), sıfat tamlaması yoluyla birleşmesi (*karayolu, sivrisinek*), isim ile fiilin birleşmesi (*bilgisayar, ateşkes*) veya iki fiilin birleşmesi (*çekyat, uyurgezer*) birleşik isimleri oluşturur. Birleşik fiiller ise üç gruptur: **yardımcı fiille kurulanlar** (*etmek, olmak, kılmak, eylemek*: *yardım etmek, hissetmek*), **kurallı birleşik fiiller** (*-ebilmek* yeterlilik, *-ivermek* tezlik, *-eyazmak* yaklaşma, *-edurmak/-ekalmak* sürerlik) ve **anlamca kaynaşmış birleşik fiiller** (*vazgeçmek, el koymak, gözden düşmek*)."
  },
  {
    "type": "paragraph",
    "text": "Pekiştirme sözcükler ise yapıca özel bir gruptur: Sözcüğün ilk ünlüsüne kadar olan kısmı alınıp sonuna `m, p, r, s` ünsüzlerinden biri getirilerek sözcüğün başına eklenir (*tertemiz, masmavi, sapsarı, bembeyaz*). Bunlar iki ayrı sözcüğün yan yana gelmesiyle kurulan ikilemelerden (*ağır ağır, doğru dürüst*) farklıdır. Pekiştirmelerin oluşumunda bazen araya ünlü veya ünsüz girebilir (*sapasağlam, güpegündüz, çırılçıplak*); ancak hepsi tek bir sözcük gibi bitişik yazılır."
  },
  {
    "type": "paragraph",
    "text": "Birleşik sözcükler oluşturulurken ses düşmesi (*kahvaltı < kahve altı*, *cumartesi < cuma ertesi*), ses türemesi (*hissetmek*) veya sözcük türü kayması (*uyurgezer*, *dedikodu*) görülebilir; ancak bu ses değişimleri kelimenin **birleşik** yapısını değiştirmez. Aynı biçimde **kurallı birleşik fiiller** her zaman bitişik yazılır (*gelebildi, bakakaldı, düşeyazdı, gidiverdi*), yardımcı fiille kurulanlarda ise ses olayı varsa bitişik (*reddetti, kayboldu*), ses olayı yoksa ayrı yazılır (*yardım etti, teşekkür etti*); ayrı yazılmış olmaları onların tek bir **birleşik fiil** olduğu gerçeğini ortadan kaldırmaz."
  },
  {
    "type": "paragraph",
    "text": "Öte yandan anlamca kaynaşmış birleşik fiillerin büyük bölümü deyimleşmiş ifadelerdir (*gözden düşmek, kulak asmamak, baş vurmak* değil *başvurmak*); bunların bir kısmı bitişik (*varsaymak, öngörmek, elvermek*), bir kısmı ise ayrı yazılır (*göze almak, dile getirmek*). Sınavda fiilin yapısını soran bir soruda her zaman yüklemi bir bütün olarak okumalı, yardımcı fiili veya deyimi tek başına parçalamamalısın."
  },
  {
    "type": "table",
    "headers": [
      "Yapı Türü",
      "Kural",
      "Örnekler"
    ],
    "rows": [
      [
        "Basit Sözcük",
        "Yapım eki yok (çekim eki alabilir)",
        "*yeşil, uyu-, evlerimiz, gideceklerdi*"
      ],
      [
        "Türemiş Sözcük",
        "En az 1 yapım eki var",
        "*çalışkan, yaşlılık, okuyucu, sevin-, bahçıvan*"
      ],
      [
        "Birleşik İsim",
        "En az 2 sözcük kalıplaşır",
        "*hanımeli, kuşburnu, karayolu, gözyaşı, bilgisayar*"
      ],
      [
        "Birleşik Fiil",
        "Yardımcı fiil / Kurallı / Anlamca kaynaşmış",
        "*ziyaret etmek, yapabilmek, gidedurmak, vazgeçmek*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**Bahçıvan** ve **kapıcı** sözcükleri uzun olduğu için birleşik yapılıdır.\" yargısı **yanlıştır**; çünkü \"bahçe + -van\" ve \"kapı + -cı\" yalnızca birer köke yapım eki getirilerek oluşturulmuş **türemiş** sözcüklerdir. Buna karşılık \"**Kuşburnu** ve **karayolu**\" çifti ikişer bağımsız sözcükten (*kuş + burun*, *kara + yol*) oluştuğu için **birleşik yapılıdır** (**doğru**). Sıfatlarda da durum aynıdır: \"**Yeşil** ev\" ifadesinde \"yeşil\" yapım eki almadığı için **basit sıfat**tır; \"**çalışkan** öğrenci\" ve \"**gözlüklü** adam\" ifadelerindeki sıfatlar ise **türemiş sıfat**tır. Fiillerde ise \"**Uyu-du-k**\" basit fiil, \"**düş-ün-dü-k**\" türemiş fiil, \"**konuş-a-ma-dı-k**\" (`konuşabil-`) ise **birleşik fiil**dir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yapı sorularında ÖSYM üç noktada adayları yanıltır: 1. Uzun sözcükleri birleşik, kısa sözcükleri basit sanmak: *düşün-* (düş-ün-) kısa olmasına rağmen türemiş fiildir; *kitaplarımızdan* uzun olmasına rağmen basit isimdir. 2. Yeterlilik fiilinin olumsuzu olan **\"-ememek / -amamak\"** yapısını basit fiil sanmak: Örneğin *\"yapamadım\"* fiilinin olumlusu *\"yapabildim\"* olduğu için bu fiil yapıca **kurallı birleşik fiil**dir! 3. Pekiştirme (*tertemiz*) ile ikilemeyi (*temiz temiz*) karıştırmak: Pekiştirmede ilk parça anlamlı bir kelime değil, `m-p-r-s` ile kurulan anlamsız bir hece kalıbıdır ve bitişik yazılır."
  },
  {
    "type": "key_points",
    "items": [
      "Basit sözcükte yapım eki yoktur; çekim eki sayısı sözcüğü türemiş veya birleşik yapmaz.",
      "Birleşik fiiller yardımcı fiil, kurallı birleşik fiil ve anlamca kaynaşmış birleşik fiil olmak üzere üçe ayrılır.",
      "`-ama- / -eme-` yeterlilik olumsuzunu gördüğünde fiili olumluya (`-ebil-`) çevirerek birleşik yapısını hemen yakala.",
      "Pekiştirmeler `m-p-r-s` ünsüzleriyle tek sözcük halinde bitişik, ikilemeler ise ayrı yazılır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)
-- Kaynak: docs/konu_anlatimi/turkce/05_sozcuk_turleri.md
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.01',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  1,
  'Bölüm 1: İsim (Ad) ve Sıfat (Ön Ad) Türleri',
  'Türkçede sözcüklerin türünü belirlerken tek bir kural vardır: Sözcüğün sözlükte hangi türde göründüğüne değil, cümlede hangi görevi üstlendiğine bakılır.  Varlıkları, kavramları ve duyguları karşılayan sözcüklere isim (ad) denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede sözcüklerin türünü belirlerken tek bir kural vardır: Sözcüğün sözlükte hangi türde göründüğüne değil, **cümlede hangi görevi üstlendiğine** bakılır. Varlıkları, kavramları ve duyguları karşılayan sözcüklere **isim (ad)** denir. İsimler verilişlerine göre *özel/cins*, varlıkların oluşlarına göre *somut/soyut*, sayılarına göre ise *tekil, çoğul ve topluluk ismi* (`ordu, sürü, meclis`) olarak ayrılır. İsimlerin birbirleriyle iyelik ve tamlayan ekleri aracılığıyla kurduğu öbeklere **isim tamlaması** denir: Her iki ögesi de ek alan **belirtili isim tamlaması** (*kapının kolu*), yalnız tamlananın ek aldığı **belirtisiz isim tamlaması** (*okul bahçesi*) ve en az üç ismin iç içe geçtiği **zincirleme isim tamlaması** (*okul bahçesinin kapısı*)."
  },
  {
    "type": "paragraph",
    "text": "İsimlerin önüne gelerek onları renk, şekil, durum bakımından niteleyen veya işaret, sayı, belgisizlik, soru yoluyla belirten sözcüklere **sıfat (ön ad)** denir. Sıfatlar hiçbir zaman çekim eki almaz; bir sıfatın nitelediği isim düşüp sıfat o ismin çekim ekini alırsa **adlaşmış sıfat** oluşur (örneğin *\"güzel insanları\"* yerine *\"güzelleri\"* demek). Sıfat konusundaki tartışmalı noktalardan biri adlaşmış sıfatın türüdür: Bazı dil bilimciler bunları sıfat başlığı altında işlese de **ÖSYM''nin yerleşik yaklaşımı adlaşmış sıfatı sözcük türü bakımından isim (ad) kabul etmektir**. Aynı biçimde sıfat tamlamalarıyla takısız isim tamlamaları da dil bilgisinde tartışmalıdır; ÖSYM genellikle *\"altın yüzük, taş duvar\"* gibi yapıları madde/ham madde ilişkisi kursa bile **sıfat tamlaması** olarak değerlendirmeye yatkındır."
  },
  {
    "type": "paragraph",
    "text": "Sıfatların isim tamlamalarıyla kurduğu ilişkiye de dikkat etmelisin: Bir isim tamlamasında tamlayan, tamlanan veya tamlamanın bütünü bir sıfat tarafından nitelenebilir (*eski okulun bahçesi*, *okulun büyük bahçesi*). Ayrıca \"bir\" sözcüğü sayı anlamında kullanıldığında **asıl sayı sıfatı** (*Bir gün daha bekledik*), \"herhangi bir\" anlamında kullanıldığında ise **belgisiz sıfat** (*Bir gün elbet görüşürüz*) olur."
  },
  {
    "type": "paragraph",
    "text": "Sıfatlarda **pekiştirme** ve **küçültme** de sıkça sorulur: `m, p, r, s` harfleriyle yapılan pekiştirmeler (*masmavi gökyüzü*) veya ikilemeler (*sıcak sıcak ekmekler*) bir ismin önünde kullanıldığında **pekiştirme sıfatı** olur; `-cik, -ce, -(ı)msı, -(ı)mtrak` ekleriyle kurulan yapılar (*küçücük oda*, *ekşimsi elma*, *mavimtırak gömlek*) ise **küçültme sıfatı** sayılır. Ayrıca sıfatların yapıları bakımından da basit (*yeşil ev*), türemiş (*çalışkan öğrenci*) ve birleşik (*vurdumduymaz tavır*, *açıkgöz esnaf*) olarak üçe ayrıldığını unutma. Bir cümlede sıfat varsa orada mutlaka **sıfat tamlaması** da vardır."
  },
  {
    "type": "table",
    "headers": [
      "Sıfat Türü",
      "Sorduğu Soru / İşlevi",
      "Örnek"
    ],
    "rows": [
      [
        "Niteleme Sıfatı",
        "İsme sorulan **\"Nasıl?\"** sorusuna yanıt verir",
        "**kırmızı** kalem, **çalışkan** öğrenci"
      ],
      [
        "İşaret Sıfatı",
        "İsmi işaret yoluyla belirtir (\"Hangi?\")",
        "**bu** kitap, **şu** masa, **o** çocuk"
      ],
      [
        "Sayı Sıfatı",
        "Asıl, sıra, üleştirme, kesir sayısı bildirir",
        "**üç** elma, **beşinci** kat, **ikişer** kalem"
      ],
      [
        "Belgisiz Sıfat",
        "İsmi kesin olmayan miktarla belirtir",
        "**birkaç** gün, **bazı** insanlar, **hiçbir** sorun"
      ],
      [
        "Soru Sıfatı",
        "İsmi soru yoluyla belirtir (yanıtı da sıfattır)",
        "**hangi** yol, **kaç** kişi, **nasıl** bir ev"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sıfat ve adlaşmış sıfat ayrımı: \"**Güzel** bir şarkıydı.\" cümlesinde \"güzel\" sözcüğü \"şarkı\" adını nitelediği için **niteleme sıfatı**dır; ek-fiilin yükleme gelmesi (\"şarkıydı\") \"güzel\" sözcüğünü ad yapmaz. Buna karşılık \"**Güzeli** her zaman takdir ederiz.\" cümlesinde \"güzel\" sözcüğü önündeki adı (örneğin *eseri, insanı*) düşürüp belirtme hâl ekini (`-i`) aldığı için **adlaşmış sıfat**, yani sözcük türü bakımından **ad (isim)** görevindedir (**doğru**). Yine \"Sınavda **üç** soruyu boş bıraktım.\" cümlesindeki *üç* **sayı sıfatı**, \"Sınavda **birkaç** soruyu boş bıraktım.\" cümlesindeki *birkaç* ise kesin sayı vermediği için **belgisiz sıfat**tır (*birkaç*ı sayı sıfatı saymak **yanlıştır**)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İsim ve sıfat sorularında iki ayrıma dikkat et: 1. **Belgisiz sıfat** ile **sayı sıfatı** karıştırılır: *Üç* kesin sayı sıfatıdır, *birkaç* ise kesinlik bildirmediği için **belgisiz sıfat**tır. 2. Niteleme sıfatında `\"Nasıl?\"` sorusu **isme** sorulur; aynı soru **fiile** sorulursa alınan yanıt sıfat değil **durum zarfı** olur (*hızlı araba* = sıfat; *hızlı koştu* = zarf)."
  },
  {
    "type": "key_points",
    "items": [
      "Sözcük türü tek başına kelimeye bakılarak değil, cümle içindeki görevine göre belirlenir.",
      "Sıfatlar mutlaka bir isimden önce gelir ve çekim eki almaz; çekim eki alıp ismin yerini tutarsa **adlaşmış sıfat (isim)** olur.",
      "Adlaşmış sıfatlar ÖSYM yaklaşımında isim sayılır.",
      "Belgisiz sıfatlarda sayı veya miktar kesin değildir (`birkaç, kimi, her, bazı`)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.02',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  2,
  'Bölüm 2: Zamir (Adıl) ve Zarf (Belirteç) Türleri',
  'İsimlerin yerini geçici olarak tutan ve isimler gibi çekim eki alabilen sözcüklere zamir (adıl) denir.  Sözcük halindeki zamirler beşe ayrılır: kişi zamirleri (ben, sen, o, biz, siz, onlar ve dönüşlülük zamiri kendi), işaret zamirleri (bu, şu, o, bunlar, öteki), belgisiz zamirler (biri, herkes, kimse, bazıları, çoğu, şey), soru zamirleri (kim, ne, hangisi, kaçı).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İsimlerin yerini geçici olarak tutan ve isimler gibi çekim eki alabilen sözcüklere **zamir (adıl)** denir. Sözcük halindeki zamirler beşe ayrılır: **kişi zamirleri** (*ben, sen, o, biz, siz, onlar* ve dönüşlülük zamiri *kendi*), **işaret zamirleri** (*bu, şu, o, bunlar, öteki*), **belgisiz zamirler** (*biri, herkes, kimse, bazıları, çoğu, şey*), **soru zamirleri** (*kim, ne, hangisi, kaçı*). Ek halindeki zamirler ise **iyelik ekleri** ile tamlananın yerini tutan **ilgi zamiri `-ki`**dir (*Seninki geldi = Senin kalemin geldi*). Zamirle sıfat arasındaki temel fark şudur: İşaret, belgisizlik veya soru bildiren sözcük bir ismin önündeyse **sıfat**, ismin yerini tek başına tutuyorsa **zamir**dir."
  },
  {
    "type": "paragraph",
    "text": "Fiillerin, fiilimsilerin, sıfatların ve kendi türünden zarfların anlamını durum, zaman, yer-yön, miktar veya soru bakımından sınırlayan sözcüklere ise **zarf (belirteç)** denir. Zarflar da tıpkı sıfatlar gibi çekim eki almaz; özellikle **yer-yön zarfları** (*ileri, geri, içeri, dışarı, aşağı, yukarı*) yalın halde fiili etkilerken zarftır, `-e/-de/-den` gibi hâl eki aldıkları anda **isim** olurlar."
  },
  {
    "type": "paragraph",
    "text": "Soru zamiri, soru sıfatı ve soru zarfını birbirinden ayırmanın en kolay yolu soruya kısa ve mantıklı bir **yanıt vermektir**. Verdiğin yanıt isim ya da zamirse soru sözcüğü **soru zamiri** (*Kim geldi? -> Ali*), yanıt sıfatsa **soru sıfatı** (*Hangi kitabı okudun? -> Bu kitabı*), yanıt zarfsa **soru zarfı**dır (*Neden sustun? -> Yorulduğum için*). Aynı şekilde miktar zarfı olan *en, daha, çok, pek* sözcükleri sıfatları veya diğer zarfları derecelendirerek cümlede üstünlük anlamı kurar (*en güzel çiçek*, *daha hızlı koştu*)."
  },
  {
    "type": "table",
    "headers": [
      "Aynı Sözcüğün Görev Değişimi",
      "Sıfat Görevi",
      "Zamir veya Zarf Görevi"
    ],
    "rows": [
      [
        "**O**",
        "**O** çocuk dün erken geldi. (İşaret sıfatı)",
        "**O**, dün erken geldi. (Kişi zamiri) / **O**nu masaya bırak. (İşaret zamiri)"
      ],
      [
        "**Hızlı**",
        "**Hızlı** araba virajı döndü. (Niteleme sıfatı)",
        "Sporcu çok **hızlı** koştu. (Durum zarfı)"
      ],
      [
        "**Çok**",
        "Sınavda **çok** soru vardı. (Belgisiz sıfat)",
        "Bu kitabı **çok** beğendim. (Miktar zarfı) / **Çoğu** gitti. (Belgisiz zamir)"
      ],
      [
        "**İçeri**",
        "**İçeri** oda serinmiş. (Sıfat)",
        "Misafirleri **içeri** aldık. (Yer-yön zarfı) / **İçeriye** girdik. (İsim!)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Zamir ve zarf çözüm örneği: \"Dün **hemen** dışarı çıktı.\" cümlesinde \"hemen\" sözcüğü \"Ne kadar?\" sorusuna değil **\"Ne zaman?\"** sorusuna yanıt verdiği için miktar zarfı değil **zaman zarfı**dır; buna karşılık \"Projeyi **çok** beğendik.\" cümlesindeki \"çok\" sözcüğü \"Ne kadar?\" sorusuna yanıt veren **miktar (azlık-çokluk) zarfı**dır (**doğru**). Yer-yön zarfında ise \"Çocuklar **aşağı** indi.\" cümlesinde \"aşağı\" **zarf** iken, \"Çocuklar **aşağıya** indi.\" cümlesindeki \"aşağıya\" yönelme hâl eki aldığı için artık **isim**dir (bunu zarf saymak **yanlıştır**). Ayrıca \"**O** kitabı masadan al.\" ile \"**O**, sınıfın en çalışkanıdır.\" cümlelerinde ilk \"o\" **işaret sıfatı**, ikincisi ise insan adı yerine geçtiği için **kişi zamiri**dir."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Zarf çeşitlerini **Z-D-M-Y-S** harfleriyle kodlayabilirsin: - **Z**aman zarfı (*Ne zaman?*) - **D**urum zarfı (*Nasıl?*) - **M**iktar zarfı (*Ne kadar?*) - **Y**er-yön zarfı (*Nereye? — ek almamış yalın halde*) - **S**oru zarfı (*Neden, niçin, ne zaman, nasıl?*)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Zamir ve zarf sorularında ÖSYM üç tuzağı sık kullanır: 1. `\"O\"` ve `\"bu\"` sözcüklerini görür görmez zamir sanmak: Önünde bir isim varsa ve o ismi gösteriyorsa (*o kitap*) mutlaka **işaret sıfatı**dır. 2. `\"Ne\"` sözcüğü cümleye göre üç farklı tür olabilir: *Ne gün geleceksin?* (**sıfat**), *Marketten ne aldın?* (**zamir**), *Ne ağlayıp duruyorsun?* (**zarf** — \"niçin\" anlamında). 3. Yer-yön bildiren sözcükler (*içeri, dışarı, ileri, geri*) ancak **ek almadan** kullanıldığında yer-yön zarfıdır; `-e, -de, -den, -i` eklerinden birini alırsa zarf olmaktan çıkar, **isim** olur."
  },
  {
    "type": "key_points",
    "items": [
      "Sıfat isimden önce gelir; zamir ismin yerini tutar; zarf fiili, fiilimsiyi, sıfatı veya başka bir zarfı etkiler.",
      "Yer-yön zarfları ek almaz; ek alırsa isimleşir.",
      "\"Hemen, şimdi, artık\" gibi sözcükler hız değil **zaman** zarfıdır; miktar zarfı yalnızca \"Ne kadar?\" sorusunu yanıtlar.",
      "\"Kendi\" sözcüğü her zaman dönüşlülük zamiridir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.03',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  3,
  'Bölüm 3: Edat (İlgeç), Bağlaç ve Ünlem',
  'Tek başlarına anlamları bulunmayan, cümledeki diğer sözcüklerle öbekleşerek anlam ilgisi kuran sözcüklere edat (ilgeç), eş görevli sözcükleri, söz öbeklerini veya cümleleri birbirine bağlayan sözcüklere ise bağlaç denir.  Seslenme, şaşırma, korku, sevinç gibi duyguları anlatan sözcüklere de ünlem adı verilir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Tek başlarına anlamları bulunmayan, cümledeki diğer sözcüklerle öbekleşerek anlam ilgisi kuran sözcüklere **edat (ilgeç)**, eş görevli sözcükleri, söz öbeklerini veya cümleleri birbirine bağlayan sözcüklere ise **bağlaç** denir. Seslenme, şaşırma, korku, sevinç gibi duyguları anlatan sözcüklere de **ünlem** adı verilir. Edat ve bağlaçların ikisi de çekim eki almayan (çekimsiz) görevli sözcüklerdir; ancak edatlar kendisinden önceki sözcükle öbek kurup cümleye *benzerlik, araç, amaç, ölçü, karşılaştırma* anlamları katarken, bağlaçlar yalnızca unsurları birbirine bağlar ve cümleden çıkarıldıklarında cümlenin anlamı daralsa bile yapı bozulmaz."
  },
  {
    "type": "paragraph",
    "text": "Sözcük türü sınıflandırmalarında bazı edatların konumu dil bilimciler arasında tartışmalıdır (örneğin *göre, doğru, karşı, rağmen, dolayı* gibi kendisinden önceki isimde hâl eki isteyen sözcüklerin edat mı yoksa zarf/sıfat öbeği kuran unsurlar mı olduğu zaman zaman tartışılır). Ancak **ÖSYM''nin yerleşik yaklaşımı**, geleneksel Türkçe dil bilgisi doğrultusunda `gibi, için, kadar, sanki, üzere, -e göre, -e doğru, -e karşı, -den dolayı, -den beri, -e rağmen` yapılarını **edat**; `ve, veya, ya da, ama, fakat, lakin, ancak, çünkü, oysa, meğer, ki, de` sözcüklerini ise **bağlaç** kabul etmektir."
  },
  {
    "type": "paragraph",
    "text": "Edatların oluşturduğu öbekler (örneğin *\"buz gibi su\"*, *\"sabaha kadar çalıştı\"*) cümle içinde sıfat veya zarf görevine girebilir; ancak o öbeğin içindeki *gibi, kadar* sözcüklerinin kendi türü yine **edat** olarak kalır. Bağlaçlardan **\"de\"** ve **\"ki\"** ise daima ayrı yazılır ve kendilerinden önceki sözcükten kesme işaretiyle ayrılmaz; buna karşılık durum eki olan `-de` ve sıfat/zamir yapan `-ki` ekleri bitişik yazılır."
  },
  {
    "type": "paragraph",
    "text": "Bağlaçların cümleye kattığı anlam ilgileri de testlerde doğrudan sorulur: `ama, fakat, lakin, oysa, halbuki` cümleler arasında **karşıtlık (karşılaştırma)** ilgisi kurarken; `çünkü, zira` kendinden önceki yargının **gerekçesini** açıklar; `üstelik, hatta, ayrıca` ise anlatımı **pekiştirir**. Ünlemler konusunda ise *ey, hey, vah, ay, of* gibi asıl ünlemlerin yanında, seslenme ya da heyecan bildirerek ünlem değeri kazanan sözcüklerin de (*Dikkat!*, *Komşular!*) cümlede ünlem görevi üstlenebileceğini bilmelisin; ancak bunlar çekim eki aldığında (*ahları, ofları*) artık isim sayılır."
  },
  {
    "type": "paragraph",
    "text": "Soru edatı olan **\"mı / mi / mu / mü\"** daima ayrı yazılır ve cümleye soru anlamı dışında pekiştirme (*Güzel mi güzel bir ev*) veya zaman (*Eve geldi mi bizi arar*) anlamı da katabilir."
  },
  {
    "type": "table",
    "headers": [
      "Çift Görevli Sözcük",
      "Edat Kullanımı",
      "Bağlaç / Sıfat / Zarf Kullanımı"
    ],
    "rows": [
      [
        "**ile**",
        "Kalem **ile** not aldı. (Araç/birliktelik; \"ve\" konamaz)",
        "Kitap **ile** defter aldı. (**Bağlaç**; yerine **\"ve\"** konabilir)"
      ],
      [
        "**yalnız / ancak**",
        "Bu işi **yalnız** sen çözersin. (\"Sadece\" anlamında edat)",
        "Gelirim **yalnız/ancak** erken dönerim. (**Bağlaç**; \"ama\" anlamında)"
      ],
      [
        "**doğru**",
        "Akşama **doğru** hava serinledi. (`-e doğru` edat)",
        "**Doğru** söz (sıfat) / **Doğru** konuş (zarf)"
      ],
      [
        "**gibi / için / kadar**",
        "Buz **gibi** su, senin **için**, dağ **kadar** (Her zaman edat)",
        "—"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Ayırt etme örneği: \"Masada kitap **ile** defter yan yana duruyordu.\" cümlesinde \"ile\" yerine **\"ve\"** koyduğumuzda anlam bozulmadığı için \"ile\" **bağlaç**tır (**doğru**). Buna karşılık \"Sabah tren **ile** Ankara''ya gitti.\" cümlesinde \"tren ve Ankara''ya\" anlamsız olacağı için buradaki \"ile\" araç anlamı katan **edat**tır (bunu bağlaç saymak **yanlıştır**). Yine \"Ödevini bitirdi **ama** dışarı çıkmadı.\" cümlesinde \"ama\" iki cümleyi karşıtlık ilgisiyle bağlayan **bağlaç**tır; \"Su **gibi** berrak, gece **kadar** sessiz, çalışmak **için** geldi, eve **dek** yürüdü\" örneklerindeki *gibi, kadar, için, dek* ise isim ve fiilimsilerle öbek kuran **edat**lardır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Edat ve bağlaç sorularında iki klasik tuzak öne çıkar: 1. `\"Yalnız\"` ve `\"ancak\"` sözcüklerini her yerde aynı tür sanmak: Yerine **\"sadece\"** geliyorsa **edat**, yerine **\"ama / fakat\"** geliyorsa **bağlaç**, bir ismi niteliyorsa (*yalnız adam*) **sıfat**, fiili etkiliyorsa (*yalnız yaşadı*) **zarf**tır. 2. `\"İle\"` sözcüğü bitişik yazıldığında (`kalemle`, `annesiyle`) aday onu sadece ek sanıp edat olduğunu gözden kaçırabilir; oysa yerine **\"ve\"** gelmiyorsa o da edattır."
  },
  {
    "type": "key_points",
    "items": [
      "Bağlaçlar sözcükleri veya cümleleri bağlar; edatlar bir sözcükle öbekleşerek yeni anlam ilgisi kurar.",
      "`\"İle\"` yerine `\"ve\"` getirilebiliyorsa bağlaç, getirilemiyorsa edattır.",
      "`\"Yalnız / ancak\"` yerine `\"sadece\"` gelirse edat, `\"ama\"` gelirse bağlaçtır.",
      "Ünlemler çekim eki alırsa isimleşir (*Ahları tuttu*)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.04',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  4,
  'Bölüm 4: Fiil (Eylem), Kip, Kişi, Ek-Fiil ve Anlam Kayması',
  'İş, oluş veya durum bildiren, kip ve kişi ekleriyle çekimlenebilen sözcüklere fiil (eylem) denir.  Fiiller anlamlarına göre üç grupta toplanır: Nesne alabilen (okumak, yazmak) iş (kılış) fiilleri, nesne alamayıp öznenin kendi durumunu gösteren (uyumak, gülmek) durum fiilleri ve öznenin iradesi dışında kendiliğinden gerçekleşen değişimi anlatan (sararmak, büyümek, paslanmak) oluş fiilleri.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İş, oluş veya durum bildiren, kip ve kişi ekleriyle çekimlenebilen sözcüklere **fiil (eylem)** denir. Fiiller anlamlarına göre üç grupta toplanır: Nesne alabilen (*okumak, yazmak*) **iş (kılış) fiilleri**, nesne alamayıp öznenin kendi durumunu gösteren (*uyumak, gülmek*) **durum fiilleri** ve öznenin iradesi dışında kendiliğinden gerçekleşen değişimi anlatan (*sararmak, büyümek, paslanmak*) **oluş fiilleri**. Fiil çekiminde zaman anlamı taşıyan ekler **haber (bildirme) kipleri**dir (`-yor`, `-dı`, `-mış`, `-ecek`, `-r/-ar`); zaman anlamı taşımayıp tasarlama bildirenler ise **dilek kipleri**dir: gereklilik (`-malı`), şart (`-sa/-se`), istek (`-a/-e`) ve emir (eki yoktur)."
  },
  {
    "type": "paragraph",
    "text": "Fiil sisteminde çok sık sorulan iki yapı **ek-fiil (ek eylem)** ve **anlam (kip) kayması**dır. Ek-fiilin (`i-`) iki temel görevi vardır: (1) İsim soylu sözcükleri cümlede yüklem yapmak (*Hava çok güzeldi / Öğrenciyim*), (2) Basit zamanlı fiillere gelerek onları **birleşik zamanlı (çekimli) fiil** yapmak (*geliyordu* = hikâye, *gelmişmiş* = rivayet, *gelirse* = şart). **Anlam (kip) kayması** ise bir kip ekinin kendi zaman veya dilek anlamı dışında başka bir kipin yerine kullanılmasıdır (*Yarın İstanbul''a gidiyorum* cümlesinde şimdiki zaman ekinin gelecek zaman yerine kullanılması)."
  },
  {
    "type": "paragraph",
    "text": "Ek-fiilin geniş zamanı olan `-dır/-dir` eki isimlere geldiğinde çoğu zaman düşebilir (*Bugün hava çok güzel [dir]*); buna rağmen o yüklemde ek-fiilin varlığı kabul edilir. Ayrıca yardımcı fiillerle (*etmek, olmak, kılmak, eylemek*) kurulan birleşik fiillerde, yardımcı fiilin kendi gerçek anlamını yitirip önündeki isimle tek bir eylem oluşturması şarttır; aksi halde o sözcük bağımsız bir asıl fiildir."
  },
  {
    "type": "paragraph",
    "text": "Fiillerin çekimi sırasında dikkat edilmesi gereken bir diğer nokta da **kişi (şahıs) ekleri** ile **iyelik eklerinin** birbirine karıştırılmamasıdır: Kişi ekleri yalnızca fiillere gelerek eylemi kimin yaptığını bildirir (*geldi-m, okudu-k*), iyelik ekleri ise isimlere gelerek varlığın kime ait olduğunu gösterir (*kitab-ım, ev-imiz*). Ayrıca ek-fiilin olumsuzunun **\"değil\"** edatıyla (*Sınav zor değilmiş*), fiillerin olumsuzunun ise `-ma/-me` ekiyle (*gelmedi*) yapıldığını aklında tutmalısın. Birleşik zamanlı fiillerde de üç tür olduğunu unutma: hikâye (`-di` -> *geliyordu*), rivayet (`-miş` -> *geliyormuş*) ve şart (`-se` -> *geliyorsa*)."
  },
  {
    "type": "table",
    "headers": [
      "Kip / Yapı",
      "Ek",
      "Örnek ve Açıklama"
    ],
    "rows": [
      [
        "Haber Kipleri (Zaman var)",
        "`-yor, -dı, -mış, -ecek, -r`",
        "*okuyor, geldi, görmüş, yazacak, koşar*"
      ],
      [
        "Dilek Kipleri (Zaman yok)",
        "`-malı, -sa/-se, -e, emir`",
        "*çalışmalı, ısınırsa, gidelim, bekle*"
      ],
      [
        "Birleşik Zamanlı Fiil",
        "1 kip + ek-fiil (`idi, imiş, ise`)",
        "*kalkardı* (geniş zamanın hikâyesi), *gelecekmiş* (gelecek zamanın rivayeti)"
      ],
      [
        "Ek-Fiil (İsme gelen)",
        "`-di, -miş, -se, -dir`",
        "*Sınav kolaydı. / Bu kitap benimdir.*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Kip ve ek-fiil ayrımı: \"Hava **ısınırsa** pikniğe gideriz.\" cümlesinde `ısın-` fiili geniş zaman (`-ır`) + şart (`-sa`) almış birleşik zamanlı ve **koşul-şart** anlamlı yapıdır (**doğru**); buna karşılık \"Sabahları erken **kalkardı**.\" cümlesinde `kalk-` fiili geniş zaman (`-ar`) + hikâye (`-dı`) ek-fiilini almıştır ve burada şart kipi **yoktur**, geçmişte tekrarlanan alışkanlık anlatılmaktadır (bunu şart kipi saymak **yanlıştır**). Yardımcı fiillerde ise \"**Ziyaret etmek**\" ifadesindeki *etmek* kendi tekil anlamını yitirip \"ziyaret\" ismiyle kaynaştığı için **yardımcı fiildir**; oysa \"Kitabı masaya **koydu**.\" veya \"Odaya sessizce **girdi**.\" cümlelerindeki fiiller kendi temel anlamlarını koruduğundan yardımcı fiil değildir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Fiil konusunda ÖSYM şu iki noktayı tuzak yapar: 1. **Birleşik zamanlı fiil** ile **birleşik yapılı fiil** birbirine karıştırılır: *Geliyordu* (kip + ek-fiil) **birleşik zamanlı** ama yapıca basit bir fiildir; *gelebildi* ise **birleşik yapılı** ama basit zamanlı bir fiildir! 2. Geçmişte tekrarlanan eylemler (*kalkardı, okurdu*) şart kipi sanılabilir; şart anlamı için mutlaka `-sa/-se` kipi bulunmalıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Haber kipleri zaman bildirir; dilek kiplerinde zaman anlamı yoktur.",
      "Ek-fiil hem isimleri yüklem yapar hem de basit zamanlı fiilleri birleşik zamanlıya çevirir.",
      "Birleşik zaman (2 kip/ek-fiil) ile birleşik yapı (2 sözcük) tamamen farklı kavramlardır.",
      "Anlam kayması cümlede anlatım bozukluğu sayılmaz."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.05',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  5,
  'Bölüm 5: Fiilimsiler (Eylemsiler) ve Fiilde Çatı',
  'Fiil kök veya gövdelerine özel yapım ekleri getirilerek türetilen, cümlede isim, sıfat veya zarf görevinde kullanılan, olumsuzları `-ma/-me` ile yapılabilen ancak kip ve kişi eki alamayan sözcüklere fiilimsi (eylemsi) denir.  Fiilimsiler üç gruba ayrılır: İsim-fiil (ad-eylem) ekleri `-ma/-ış/-mak`tır (uyanmak, okumayı, gülüş); sıfat-fiil (ortaç) ekleri `-an, -ası, -mez, -ar, -dik, -ecek, -miş`tir (çalışan insanlar, tanıdık yüz); zarf-fiil (bağ-fiil/ulaç) ekleri ise `-ken, -alı, -asıya, -e...',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Fiil kök veya gövdelerine özel yapım ekleri getirilerek türetilen, cümlede **isim, sıfat veya zarf** görevinde kullanılan, olumsuzları `-ma/-me` ile yapılabilen ancak **kip ve kişi eki alamayan** sözcüklere **fiilimsi (eylemsi)** denir. Fiilimsiler üç gruba ayrılır: **İsim-fiil (ad-eylem)** ekleri `-ma/-ış/-mak`tır (*uyanmak, okumayı, gülüş*); **sıfat-fiil (ortaç)** ekleri `-an, -ası, -mez, -ar, -dik, -ecek, -miş`tir (*çalışan insanlar, tanıdık yüz*); **zarf-fiil (bağ-fiil/ulaç)** ekleri ise `-ken, -alı, -asıya, -e...-e, -arak, -ınca, -ıp, -madan, -dıkça, -r...-maz, -casına`dır (*okuyarak, dönünce, gülüp*)."
  },
  {
    "type": "paragraph",
    "text": "İsim-fiil ve sıfat-fiil eklerini alan bazı sözcükler zamanla fiilimsi özelliğini tamamen kaybederek bir varlığın veya nesnenin **kalıcı adı** haline gelir (*dondurma, sarma, dolma, kazma, ekmek, çakmak, çağlayan*); bu sözcükler `-ma/-me` ile olumsuz yapılamıyorsa artık fiilimsi değil, sıradan birer **isim**dir. Fiilde **çatı** ise yüklemi fiil olan cümlelerde (isim cümlelerinde çatı aranmaz!) fiilin özne ve nesneyle kurduğu ilişkidir: Öznesine göre *etken* (gerçek özne), *edilgen* (`-l/-n` eki + sözde özne), *dönüşlü* (`-l/-n` + işi yapan ve etkilenen aynı özne) ve *işteş* (`-ş` + karşılıklı veya birlikte); nesnesine göre *geçişli* (\"neyi, kimi?\" alır), *geçişsiz* (almaz), *oldurgan* (geçişsizi `-r/-t/-dır` ile geçişli yapma) ve *ettirgen* (geçişliyi `-r/-t/-dır` ile başkasına yaptırma)."
  },
  {
    "type": "paragraph",
    "text": "Fiilimsiler cümlede yan cümlecik kurdukları için bir cümlede kaç fiilimsi varsa kural olarak o kadar yan cümlecik var demektir. Öte yandan çatı sorularında cümlenin anlamına değil mutlaka **yüklemdeki fiilin aldığı çatı ekine ve özne-nesne ilişkisine** bakmalısın; örneğin nesnesi cümlede açıkça yazılmamış olsa bile başına \"onu\" zamirini getirebiliyorsan o fiil yine **geçişli** sayılır (*Dün akşam sabaha kadar [onu] okudum*)."
  },
  {
    "type": "paragraph",
    "text": "Fiilde çatı başlığında sıkça test edilen bir başka ayrıntı da **oldurgan** ile **ettirgen** çatının farkıdır. Bir fiilin `-r, -t, -dır` eklerini almadan önceki kök hâline `\"onu\"` zamirini getir: Eğer ekten önce `\"onu\"` almıyorsa (geçişsizse) ve ek sayesinde geçişli olmuşsa **oldurgan**dır (*uyu-mak -> onu uyut-mak*, *piş-mek -> onu pişir-mek*); eğer ekten önce de `\"onu\"` alıyorsa (zaten geçişliyse) ve ekle birlikte geçişlilik derecesi artmışsa **ettirgen**dir (*oku-mak -> onu okut-mak*, *yaz-mak -> onu yazdır-mak*). İşteş çatılı fiillerde ise eylemin birden fazla özne tarafından **karşılıklı** (*selamlaşmak, yazışmak*) ya da **birlikte** (*uçuşmak, gülüşmek*) yapıldığına dikkat etmelisin."
  },
  {
    "type": "table",
    "headers": [
      "Fiilimsi / Çatı",
      "Ayırt Edici İpucu",
      "Örnek"
    ],
    "rows": [
      [
        "İsim-Fiil",
        "`-ma, -ış, -mak`; cümlede isim gibi ek alabilir",
        "Kitap **okumayı** çok seviyor. (**dondurma** = kalıcı ad, fiilimsi değil!)"
      ],
      [
        "Sıfat-Fiil",
        "`-an, -ası, -mez, -ar, -dik, -ecek, -miş`; ismi niteler",
        "**Çalışan** insanlar başarır. (Adlaşabilir: *Çalışanlar*)"
      ],
      [
        "Zarf-Fiil",
        "Fiile \"Nasıl?\" veya \"Ne zaman?\" sorusunu yanıtlar",
        "Ders **çalışarak** öğrendi. / Eve **dönünce** aradı."
      ],
      [
        "Edilgen vs. Dönüşlü",
        "Edilgen: işi yapan belirsiz (**sözde özne**); Dönüşlü: özne kendi yapar, kendi etkilenir",
        "Camlar **silindi** (edilgen). / Çocuk **süslendi** (dönüşlü)."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Fiilimsi ve çekimli fiil ayrımı: \"**Çalışan** insanlar mutlaka karşılığını alır.\" cümlesinde \"çalışan\" sözcüğü \"insanlar\" adını nitelediği için **sıfat-fiil**dir (**doğru**); aynı bağlamda \"okuyarak\" ve \"dönünce\" **zarf-fiil**, \"uyanmak\" ve \"okumayı\" ise **isim-fiil**dir. Sıfat-fiil eklerinden `-mez, -ar, -dik, -ecek, -miş` ekleri yüklemde zaman bildirdiğinde fiilimsi değil **çekimli fiil** olur: \"Yarın erkenden **gelecek**.\" cümlesindeki *gelecek* **çekimli fiil**dir (bunu sıfat-fiil saymak **yanlıştır**); \"**Gelecek** yıl sınava girecek.\" cümlesindeki *gelecek* ise \"yıl\" adını nitelediği için **sıfat-fiil**dir. Çatıda ise \"Öğretmen konuyu öğrenciye **anlattırdı**.\" cümlesinde `anlat-` geçişli fiili `-tır` ekini alarak işi başkasına yaptırma anlamı kazandığı için **ettirgen** çatılıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Fiilimsi ve çatı sorularında üç kritik tuzağa dikkat et: 1. Kalıcı adları fiilimsi sanmak: *\"Masadaki **dolma** çok lezzetliydi.\"* cümlesinde \"dolmama\" diyemediğimiz için *dolma* fiilimsi değil kalıcı isimdir; ancak *\"Bardağın **dolması** uzun sürdü.\"* cümlesinde olumsuzu (*dolmaması*) yapılabildiği için fiilimsidir. 2. **İsim cümlelerinde çatı aranmaz!** Yüklemi isim veya fiilimsi olan cümlelerde \"edilgen mi etken mi\" diye bakılmaz. 3. Edilgen çatıda işi yapan belli değildir ve özne **sözde özne**dir (*Yol temizlendi*); dönüşlü çatıda ise özne işi hem yapar hem etkilenir (*Annem sevindi*)."
  },
  {
    "type": "key_points",
    "items": [
      "Fiilimsiler fiilden türeyen ama kip-kişi eki almayan sözcüklerdir; olumsuzları `-ma/-me` ile yapılır.",
      "Sıfat-fiil ekleri yüklemde kip eki olarak kullanılırsa fiilimsi sayılmaz.",
      "Kalıcı adlar fiilimsi özelliğini yitirmiş isimlerdir.",
      "Çatı özelliği yalnızca yüklemi **çekimli fiil** olan cümlelerde aranır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Ses Bilgisi ve Ses Olayları
-- Kaynak: docs/konu_anlatimi/turkce/06_ses_bilgisi_ve_ses_olaylari.md
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
  'turkce.ses_bilgisi_ve_ses_olaylari.01',
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  1,
  'Bölüm 1: Ünlüler, Büyük ve Küçük Ünlü Uyumu',
  'Türkçede 8 ünlü harf bulunur ve bu ünlüler dilin konumuna, dudakların biçimine ve ağız açıklığına göre sınıflandırılır: kalın ünlüler (`a, ı, o, u`) ile ince ünlüler (`e, i, ö, ü`); düz ünlüler (`a, e, ı, i`) ile yuvarlak ünlüler (`o, ö, u, ü`); geniş ünlüler (`a, e, o, ö`) ile dar ünlüler (`ı, i, u, ü`).  Türkçe sözcüklerin ses yapısını belirleyen iki temel kural, bu sınıflandırma üzerine kurulan büyük ve küçük ünlü uyumlarıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede 8 ünlü harf bulunur ve bu ünlüler dilin konumuna, dudakların biçimine ve ağız açıklığına göre sınıflandırılır: **kalın ünlüler** (`a, ı, o, u`) ile **ince ünlüler** (`e, i, ö, ü`); **düz ünlüler** (`a, e, ı, i`) ile **yuvarlak ünlüler** (`o, ö, u, ü`); **geniş ünlüler** (`a, e, o, ö`) ile **dar ünlüler** (`ı, i, u, ü`). Türkçe sözcüklerin ses yapısını belirleyen iki temel kural, bu sınıflandırma üzerine kurulan büyük ve küçük ünlü uyumlarıdır."
  },
  {
    "type": "paragraph",
    "text": "**Büyük ünlü uyumu (kalınlık-incelik uyumu)** kuralına göre Türkçe bir sözcüğün ilk hecesinde kalın ünlü varsa sonraki heceler de kalın ünlüyle; ilk hecesinde ince ünlü varsa sonraki heceler de ince ünlüyle devam etmelidir (*okul, dolap, pencere*). Ancak tek heceli sözcüklerde ve birleşik sözcüklerde (*bilgisayar, hanımeli*) büyük ünlü uyumu aranmaz. Ayrıca Türkçedeki yedi ek (`-yor, -ken, -ki, -leyin, -mtırak, -gil, -daş`) değişmediği için eklendiği sözcüğün uyumunu bozabilir (*geliyor, akşamki*). Yabancı kökenli sözcükler (*kalem, saat, misafir, elma*) Türkçeleşmiş olsalar dahi büyük ünlü uyumuna uymaz."
  },
  {
    "type": "paragraph",
    "text": "**Küçük ünlü uyumu (düzlük-yuvarlaklık uyumu)** ise heceler arasındaki dudak ve genişlik dengesini düzenler: (1) Düz ünlüden (`a, e, ı, i`) sonra **düz ünlü** (`a, e, ı, i`) gelmelidir. (2) Yuvarlak ünlüden (`o, ö, u, ü`) sonra ya **dar yuvarlak** (`u, ü`) ya da **geniş düz** (`a, e`) ünlü gelmelidir; Türkçe sözcüklerde ilk heceden sonra `o` ve `ö` ünlüleri bulunmaz. Örneğin *odun* (`o -> u`) ve *çocuk* (`o -> u`) küçük ünlü uyumuna uyarken, *tavuk* (`a -> u`), *kavun* (`a -> u`), *yağmur* (`a -> u`), *çamur* (`a -> u`) ve *avuç* (`a -> u`) düz ünlüden sonra yuvarlak ünlü geldiği için küçük ünlü uyumuna **uymaz**."
  },
  {
    "type": "table",
    "headers": [
      "Uyum Türü",
      "Temel Kural",
      "Uyan Örnekler",
      "Uymayan Örnekler"
    ],
    "rows": [
      [
        "Büyük Ünlü Uyumu",
        "Kalından sonra kalın; inceden sonra ince",
        "*dolap, okul, çiçekler*",
        "*kalem, elma, geliyor, sabahki*"
      ],
      [
        "Küçük Ünlü Uyumu (1)",
        "Düzden (`a,e,ı,i`) sonra düz (`a,e,ı,i`)",
        "*kapı, bilezik, ayak*",
        "*tavuk, kavun, yağmur, çamur*"
      ],
      [
        "Küçük Ünlü Uyumu (2)",
        "Yuvarlaktan (`o,ö,u,ü`) sonra `u, ü` veya `a, e`",
        "*odun, çocuk, güvercin*",
        "*horoz, doktor, motor* (2. hecede `o`)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sınav çözümü: \"Aşağıdaki sözcüklerden hangisinin bütün ünlüleri kalındır?\" sorusunda **dolap** (`o - a`) doğru yanıttır; buna karşılık *kalem* (`a - e`) ve *elma* (`e - a`) sözcüklerinde kalın ünlü bulunsa da ince ünlü (`e`) de yer aldığı için tüm ünlüleri kalın değildir. Küçük ünlü uyumunda ise **odun** (`o - u`) ve **çocuk** (`o - u`) sözcüklerinde yuvarlak ünlüyü dar yuvarlak (`u`) izlediği için uyum vardır; ancak **tavuk** (`a -> u`) düz ünlüden sonra yuvarlak ünlü aldığı için uyumsuzdur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Büyük ünlü uyumunu bozan yedi eki (**-yor, -ken, -ki, -leyin, -mtırak, -gil, -daş**) şu anlamlı cümleyle hatırla: *\"Sabah**leyin** teyzem**gil**deki yeşil**imtırak** kapıdan geçer**ken** arka**daş**ım gel**iyor**du.\"*"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ünlü uyumlarında iki yanılgıya düşme: 1. Yabancı kökenli ama günlük dilde çok kullanılan *kalem, saat, misafir, elma* gibi sözcükler büyük ünlü uyumuna uyuyor sanılır; heceleri kontrol ettiğinde kalın ve ince ünlülerin bir arada olduğu hemen görülür. 2. Küçük ünlü uyumunda *odun, çocuk, koyun* gibi iki yuvarlak ünlülü sözcükleri uyumsuz sanmak yanlıştır; yuvarlak ünlüden sonra dar yuvarlak (`u, ü`) gelmesi kurala tam uygundur. Asıl ihlal, düz ünlüden (`a, e, ı, i`) sonra yuvarlak (`u, ü`) gelmesidir (*tavuk, kavun, yağmur*)."
  },
  {
    "type": "key_points",
    "items": [
      "Büyük ünlü uyumunda kalın (`a, ı, o, u`) ile ince (`e, i, ö, ü`) ünlüler aynı sözcükte birleşmez.",
      "Birleşik sözcüklerde ve tek heceli sözcüklerde büyük ünlü uyumu aranmaz.",
      "Küçük ünlü uyumunda düzden sonra düz; yuvarlaktan sonra yalnızca `u, ü` veya `a, e` gelebilir (`o, ö` ilk hece dışında bulunmaz).",
      "*Tavuk, kavun, yağmur, çamur, avuç* sözcükleri küçük ünlü uyumuna aykırıdır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.ses_bilgisi_ve_ses_olaylari.02',
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  2,
  'Bölüm 2: Ünlü Olayları (Ünlü Düşmesi, Daralması, Türemesi, Değişimi)',
  'Türkçede sözcükler ek alırken veya birleşirken ünlülerde dört temel ses olayı meydana gelir: ünlü düşmesi, ünlü daralması, ünlü türemesi ve ünlü değişimi.  İkinci hecesinde dar ünlü (`ı, i, u, ü`) bulunan bazı iki heceli sözcükler, ünlüyle başlayan bir ek aldığında veya başka bir sözcükle birleştiğinde ikinci hecedeki dar ünlü düşer; buna ünlü düşmesi (hece düşmesi) denir (alın -> alnı, ağız -> ağzı, gönül -> gönlü, beyin -> beyni, kayıp + olmak -> kaybolmak, sabır + etmek -> sabretmek).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede sözcükler ek alırken veya birleşirken ünlülerde dört temel ses olayı meydana gelir: **ünlü düşmesi**, **ünlü daralması**, **ünlü türemesi** ve **ünlü değişimi**. İkinci hecesinde dar ünlü (`ı, i, u, ü`) bulunan bazı iki heceli sözcükler, ünlüyle başlayan bir ek aldığında veya başka bir sözcükle birleştiğinde ikinci hecedeki dar ünlü düşer; buna **ünlü düşmesi (hece düşmesi)** denir (*alın -> alnı, ağız -> ağzı, gönül -> gönlü, beyin -> beyni, kayıp + olmak -> kaybolmak, sabır + etmek -> sabretmek*). Ayrıca yapım eki alırken türeme sırasında ünlü düşmesi de görülür (*uyu-ku -> uyku, oyun-a- -> oyna-, ileri-le- -> ilerle-*)."
  },
  {
    "type": "paragraph",
    "text": "Düz geniş ünlüyle (`a, e`) biten bir fiil kök veya gövdesi `-yor` şimdiki zaman ekini aldığında sondaki `a, e` ünlüsü daralarak `ı, i, u, ü` ünlülerine dönüşür; buna **ünlü daralması** denir (*bekle-yor -> bekliyor, başla-yor -> başlıyor, ağla-yor -> ağlıyor*). Türkçede `de-` ve `ye-` fiillerinde ise `-yor` eki dışında `y` kaynaştırma ünsüzüyle de daralma gerçekleşir (*de-yecek -> diyecek, ye-yecek -> yiyecek, de-ye -> diye*)."
  },
  {
    "type": "paragraph",
    "text": "Tek heceli bazı sözcüklere `-cık/-cik` küçültme eki veya pekiştirme geldiğinde araya yeni bir ünlü girmesi **ünlü türemesi**dir (*az-cık -> azıcık, bir-cik -> biricik, genç-cik -> gencecik, dar-cık -> daracık, sap-sağlam -> sapasağlam*). Son olarak `ben` ve `sen` kişi zamirleri `-e` yönelme hâl ekini aldığında kök ünlüsünün kalınlaşmasına **ünlü değişimi (kökte ünlü kalınlaşması)** denir (*ben-e -> bana, sen-e -> sana*)."
  },
  {
    "type": "paragraph",
    "text": "Ünlü düşmesi konusunda iki ince ayrıntıyı da gözden kaçırmamalısın: Birincisi, bazı birleşik fiillerde (*kayıp + etmek -> kaybetmek*, *hapis + etmek -> hapsetmek*) veya ek-fiil birleşmelerinde (*geldi ise -> geldiyse*, *ile -> babamla*) ünlü düşmesi gerçekleşir. İkincisi, organ veya akrabalık adlarında ünlü düşmesi gerçekleşmezse yazım yanlışı doğar (*burnu* doğrudur, *burunu* yanlıştır); ancak bu sözcükler ikileme kurduğunda ünlü düşmesi olmaz (*burun buruna*, *omuz omuza*, *gönül gönüle*)."
  },
  {
    "type": "table",
    "headers": [
      "Ünlü Olayı",
      "Oluşum Kuralı",
      "Örnekler"
    ],
    "rows": [
      [
        "Ünlü Düşmesi",
        "İkinci hecedeki dar ünlü ek/birleşmeyle düşer",
        "*alın -> alnı, ağız -> ağzı, gönül -> gönlü, kayıp -> kaybol-*"
      ],
      [
        "Ünlü Daralması",
        "`a/e` ile biten fiil + `-yor` (ve `de-/ye-` + `y`)",
        "*bekliyor, başlıyor, diyorlar, yiyecek, diye*"
      ],
      [
        "Ünlü Türemesi",
        "`-cık` veya pekiştirmede araya ünlü girer",
        "*azıcık, biricik, gencecik, sapasağlam, güpegündüz*"
      ],
      [
        "Ünlü Değişimi",
        "Yalnızca `ben` ve `sen` + `-e`",
        "*bana, sana*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Daralma ve düşme testi: \"**Diyorlar**\" sözcüğü `de-` fiiline `-yor` eki gelmesiyle ünlü daralmasına uğramıştır (`de- -> di-`, **doğru**). Buna karşılık \"**Okuyorlar**\" ve \"**Alıyorlar**\" sözcüklerinde `-yor` eki bulunmasına rağmen **ünlü daralması yoktur**; çünkü fiil kökleri zaten `oku-` (dar ünlü) ve `al-` (ünsüz; `ı` ise yardımcı/bağlantı ünlüsüdür) biçimindedir (bunlarda daralma olduğunu söylemek **yanlıştır**). Aynı biçimde \"**Dedi**\" sözcüğünde de `-yor` olmadığı için daralma yoktur; ses olayı gerçekleşmeden doğrudan `de-di` şeklinde kurulmuştur. Ünlü düşmesinde ise \"*Alnı*\" (`alın-ı`) ve \"*Ağzı*\" (`ağız-ı`) sözcüklerinde ikinci hecedeki dar ünlü düşmüştür."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ünlü olaylarında ÖSYM iki çok güçlü çeldirici kullanır: 1. `-yor` ekini alan her fiilde daralma olduğunu sanmak: Daralma olup olmadığını anlamak için `-yor` ekini ve önceki dar ünlüyü atıp fiilin sonuna `-mak/-mek` getir. *Geliyor* → `gel-mek` (kök `gel-`, daralma yok!); *bekliyor* → `bekle-mek` (kök `bekle-`, `e -> i` daralma var!). 2. *Kitabı* veya *sokağa* gibi sözcüklerde ünlü düşmesi aramak: Bunlarda kökteki dar ünlünün düşmesi değil, sondaki sert ünsüzün yumuşaması (**ünsüz yumuşaması**) vardır; ünlü düşmesi için kökte yer alan bir ünlünün (*alın → alnı*, *ağız → ağzı*) ek alırken kaybolması gerekir."
  },
  {
    "type": "key_points",
    "items": [
      "Ünlü daralması yalnızca `a/e` ile biten fiiller `-yor` aldığında (ve `de-/ye-` fiillerinin `y` ile çekiminde) görülür.",
      "`oku-yor`, `al-ıyor`, `gel-iyor` ve `de-di` sözcüklerinde ünlü daralması yoktur.",
      "İkinci hecesinde dar ünlü olan organ ve soyut isimlerde (`alın, ağız, burun, gönül, beyin, fikir`) ünlü düşmesi sık görülür; ikilemelerde (*burun buruna, omuz omuza*) ünlü düşmez.",
      "Ünlü değişimi Türkçede yalnızca *bana* ve *sana* sözcüklerinde bulunur."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.ses_bilgisi_ve_ses_olaylari.03',
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  3,
  'Bölüm 3: Ünsüz Olayları (Yumuşama, Sertleşme/Benzeşme, Düşme, Türeme)',
  'Türkçedeki ünsüzler ses tellerinin titreşimine göre sert (ötümsüz) ünsüzler (`f, s, t, k, ç, ş, h, p`) ve yumuşak (ötümlü) ünsüzler olarak ikiye ayrılır.  Sert ünsüzlerden biriyle biten bir sözcüğe yumuşak ünsüzle (`c, d, g`) başlayan bir ek geldiğinde, ekin başındaki ünsüz sertleşerek `ç, t, k` sesine dönüşür; buna ünsüz benzeşmesi (sertleşme) denir (kitap-cı -> kitapçı, sokak-da -> sokakta, seç-gin -> seçkin, 1923''te, 3''ten).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçedeki ünsüzler ses tellerinin titreşimine göre **sert (ötümsüz)** ünsüzler (`f, s, t, k, ç, ş, h, p`) ve **yumuşak (ötümlü)** ünsüzler olarak ikiye ayrılır. Sert ünsüzlerden biriyle biten bir sözcüğe yumuşak ünsüzle (`c, d, g`) başlayan bir ek geldiğinde, ekin başındaki ünsüz sertleşerek `ç, t, k` sesine dönüşür; buna **ünsüz benzeşmesi (sertleşme)** denir (*kitap-cı -> kitapçı, sokak-da -> sokakta, seç-gin -> seçkin, 1923''te, 3''ten*). Sayılara ve kısaltmalara getirilen eklerde benzeşmeye uyulmaması aynı zamanda bir yazım yanlışıdır."
  },
  {
    "type": "paragraph",
    "text": "Sert ünsüzlerden `p, ç, t, k` ile biten bir sözcüğe ünlüyle başlayan bir ek geldiğinde ise sondaki sert ünsüz yumuşayarak `b, c, d, g/ğ` seslerine dönüşür; buna **ünsüz yumuşaması (ünsüz değişimi)** adı verilir (*kitap-ı -> kitabı, ağaç-a -> ağaca, kanat-ı -> kanadı, sokak-a -> sokağa, renk-i -> rengi*). Ancak özel adlarda (*Ahmet''i* yazılır, okunuşta yumuşasa bile yazıda gösterilmez), bazı tek heceli Türkçe sözcüklerde (*et -> eti, süt -> sütü, top -> topu*) ve çoğu yabancı kökenli kelimede (*hukuk -> hukuku, millet -> milleti, evrak -> evrakı*) yumuşama gerçekleşmez; buna **ünsüz yumuşamasına aykırılık** denir."
  },
  {
    "type": "paragraph",
    "text": "Sonu `k` ünsüzüyle biten bazı sözcükler `-cık/-cik` küçültme ekini veya `-l` yapım ekini aldığında sondaki `k` düşer; buna **ünsüz düşmesi** denir (*küçük-cük -> küçücük, minik-cik -> minicik, ufak-cık -> ufacık, yüksek-l- -> yükselmek, alçak-l- -> alçalmak*). Arapça kökenli tek heceli bazı sözcüklere ünlüyle başlayan ek geldiğinde veya yardımcı fiille birleştiğinde sondaki ünsüzün ikizleşmesine ise **ünsüz türemesi (ikizleşmesi)** adı verilir (*af + etmek -> affetmek, his + etmek -> hissetmek, hak + ı -> hakkı, sır + ı -> sırrı, zannetmek*)."
  },
  {
    "type": "paragraph",
    "text": "Bazı birleşik kelimelerde ve yapım eklerinde de ünsüz düşmesi görülebilir: Örneğin *ast + teğmen -> asteğmen* ve *üst + teğmen -> üsteğmen* sözcüklerinde `t` ünsüzü düşerken, *gül-üş-cük -> gülücük* ve *öp-üş-cük -> öpücük* sözcüklerinde de `ş` ünsüzü düşmüştür. Ayrıca `n, k` ile biten sıfatlardan türetilen *büyük-cek -> büyücek* örneğinde de ünsüz düşmesi vardır."
  },
  {
    "type": "table",
    "headers": [
      "Ünsüz Olayı",
      "Kural Özeti",
      "Örnekler"
    ],
    "rows": [
      [
        "Ünsüz Benzeşmesi",
        "`f,s,t,k,ç,ş,h,p` + `c,d,g` → `ç,t,k`",
        "*kitapçı, dolapta, çalışkan, 1923''te, 3''ten*"
      ],
      [
        "Ünsüz Yumuşaması",
        "`p,ç,t,k` + ünlü → `b,c,d,g/ğ`",
        "*kitabı, ağacı, kanadı, sokağa, rengi, gidiyor*"
      ],
      [
        "Ünsüz Düşmesi",
        "`k` ile biten sözcük + `-cık / -l` → `k` düşer",
        "*küçücük, minicik, ufacık, yükselmek, seyrelmek*"
      ],
      [
        "Ünsüz Türemesi",
        "İkizleşme (ek veya yardımcı fiille)",
        "*affetmek, hissetmek, hakkı, sırrı, reddetmek*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Benzeşme ve düşme testi: \"**Kitapçı**\" sözcüğünde `kitap` (`p` sert ünsüzü) sonuna gelen `-cı` eki benzeşerek `-çı` olduğu için **ünsüz benzeşmesi** vardır (**doğru**). Buna karşılık \"**Bahçıvan**\" sözcüğünde de `ç` sesi bulunmasına rağmen bu sözcükte benzeşme yoktur; çünkü `ç` sesi ekten değil sözcüğün kendi köken yapısından (`bağçe/bahçe`) gelir (bunu benzeşme saymak **yanlıştır**). Yine \"**Küçücük**\" sözcüğünde `küçük` sonundaki `k` düştüğü için **ünsüz düşmesi** vardır; oysa \"**Kitapçık**\" sözcüğünde kök sonundaki `p` düşmediği için yalnızca **ünsüz benzeşmesi** bulunur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ünsüz olaylarında iki kelime oyunu adayları tuzağa düşürür: 1. İki aynı ünsüzün yan yana geldiği her sözcük ünsüz türemesi değildir! *Sessiz* (`ses + siz`), *ıssız* (`ıs + sız`), *elli* (kök) ve *madde* (kök) sözcüklerinde **ünsüz türemesi yoktur**; türeme olabilmesi için sözcüğün eksiz halinde o ikinci ünsüzün bulunmaması gerekir (*his -> hissetmek, hak -> hakkı*). 2. *Gidiyor* (`git-iyor`) ve *ediyor* (`et-iyor`) fiillerinde de `t -> d` **ünsüz yumuşaması** vardır; aday yumuşamayı yalnızca isimlerde aradığı için fiillerdeki `t -> d` değişimini gözden kaçırabilir."
  },
  {
    "type": "key_points",
    "items": [
      "Sert ünsüzler (**Fıstıkçı Şahap**) yanına `c, d, g` geldiğinde onları `ç, t, k`ye dönüştürür (benzeşme).",
      "`p, ç, t, k` ünlüyle başlayan ek alınca `b, c, d, g/ğ` olur (yumuşama); *gitmek -> gidiyor* örneğindeki gibi fiillerde de görülür.",
      "`küçücük, ufacık, yükselmek, alçalmak` sözcüklerinde `k` düşmesi vardır.",
      "*Sessiz* (`ses+siz`) sözcüğünde ünsüz türemesi yoktur; türeme için kökte tek ünsüz olmalı (*hak -> hakkı*)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
  'turkce.ses_bilgisi_ve_ses_olaylari.04',
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  4,
  'Bölüm 4: Kaynaştırma, Ulama ve Dudak Ünsüzleri Benzeşmesi (n-b)',
  'Türkçede iki ünlü yan yana bulunmadığı için, ünlüyle biten bir sözcüğe ünlüyle başlayan bir ek getirildiğinde araya y, ş, s, n kaynaştırma (koruyucu) ünsüzlerinden biri girer (masa-y-ı, iki-ş-er, kapı-s-ı, araba-n-ın).  Ancak her `y, ş, s, n` sesi kaynaştırma değildir: Ek veya kök zaten o ünsüzle bitiyorsa arada kaynaştırma bulunmaz.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede iki ünlü yan yana bulunmadığı için, ünlüyle biten bir sözcüğe ünlüyle başlayan bir ek getirildiğinde araya **y, ş, s, n** kaynaştırma (koruyucu) ünsüzlerinden biri girer (*masa-y-ı, iki-ş-er, kapı-s-ı, araba-n-ın*). Ancak her `y, ş, s, n` sesi kaynaştırma değildir: Ek veya kök zaten o ünsüzle bitiyorsa arada kaynaştırma bulunmaz. Örneğin *okula* sözcüğünde `okul` ünsüzle bittiği için kaynaştırma yoktur; *senin evin* ifadesindeki `n` ise kaynaştırma değil **2. tekil iyelik eki**dir! Ayrıca `ile` edatı veya `idi, imiş, ise` ek-fiilleri ünlüyle biten bir sözcüğe bitiştiğinde de araya `y` kaynaştırma ünsüzü girer (*araba-y-la, hasta-y-dı, evde-y-miş*)."
  },
  {
    "type": "paragraph",
    "text": "Cümle içinde ünsüzle biten bir sözcüğün ardından ünlüyle başlayan bir sözcük geldiğinde iki sözcüğün birbirine bağlanarak okunmasına **ulama** denir (*Akşam oldu -> Akşa-moldu, Dün akşam -> Dü-nakşam*). Ancak iki sözcük arasında virgül, noktalı virgül gibi herhangi bir **noktalama işareti** varsa ulama gerçekleşmez! Ayrıca Türkçede `b` dudak ünsüzünden önce gelen `n` sesi söyleyişte `m`ye döner (örneğin *İstanbul* söyleyişte *\"İstambul\"* gibi okunur ama `n` ile yazılır; *sonbahar, binbaşı, onbaşı* gibi birleşik sözcükler de `n` ile yazılır). Buna karşılık *pembe, tembel, çember, saklambaç, ambar, sümbül* gibi sözcüklerin yazımı zamanla `m` ile kalıplaşmıştır (*penbe* değil *pembe* yazılır)."
  },
  {
    "type": "paragraph",
    "text": "Ses bilgisi sorularında **kaynaştırma ile ulama arasındaki farkı** da net tutmalısın: Kaynaştırma tek bir sözcüğün içinde kök ve ek arasında gerçekleşir ve yazıda harf olarak görünür; ulama ise iki ayrı sözcüğün sınırında yalnızca okunuşta ortaya çıkar ve yazıda birleşmeye yol açmaz. Bir sözcükte birden fazla ses olayı da aynı anda bulunabilir; örneğin *kayboldu* sözcüğünde hem ünlü düşmesi (`kayıp -> kayp`) hem ünsüz yumuşaması (`p -> b`) vardır."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca karma ses bilgisi sorularında şu pratik kontrol sırasını izlemek hatayı önler: Önce sözcüğü kök ve eklerine ayırarak ünlü düşmesi veya daralması olup olmadığına bak; ardından kök sonunda `p, ç, t, k -> b, c, d, g/ğ` yumuşaması ya da ek başında `c, d, g -> ç, t, k` sertleşmesi bulunup bulunmadığını kontrol et; en son olarak iki ünlü arasında `y, ş, s, n` kaynaştırması veya cümle içinde sözcük sınırlarında ulama araması yap. Özellikle *diyor, yiyecek, neyden* gibi kelimelerde daralma ile kaynaştırmanın yan yana gelebileceğini, *gideceği* kelimesinde ise ünsüz yumuşaması olduğunu unutmamalısın. Kök ve ek sınırını doğru çizdiğin sürece ses olaylarını birbirine karıştırman imkânsız hale gelir."
  },
  {
    "type": "table",
    "headers": [
      "Ses Olayı",
      "Kural",
      "Örnek ve İstisna"
    ],
    "rows": [
      [
        "Kaynaştırma (`y,ş,s,n`)",
        "İki ünlü arasına girer",
        "*masa-y-ı, kapı-s-ı, altı-ş-ar* (**okula, evin** kaynaştırma değil!)"
      ],
      [
        "Ulama",
        "Ünsüzle biten + ünlüyle başlayan",
        "*Dün akşam eve geldi.* (Araya virgül girerse **ulama olmaz**!)"
      ],
      [
        "`n-b` Benzeşmesi",
        "`n` sesi `b` önünde söyleyişte `m`ye döner, yazıya yansımaz; bazı sözcükler kalıplaşmıştır",
        "*pembe, tembel, çember* (kalıplaşmış yazım); *İstanbul, binbaşı, sonbahar* (`n` ile yazılır)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Kaynaştırma ve ulama testi: \"**Masayı**\" sözcüğünde `masa` ünlüyle bitip `-ı` belirtme hâl ekini aldığı için araya `y` **kaynaştırma ünsüzü** girmiştir (**doğru**). Buna karşılık \"**Okula**\" sözcüğü `okul` ünsüzüyle bittiğinden `-a` ekini doğrudan alır; burada kaynaştırma olduğunu söylemek **yanlıştır**. \"**Çorbayı**\" (`çorba-y-ı`) ve \"**Sokağa**\" (`sokak-a`) karşılaştırmasında ise ilkinde kaynaştırma (`y`), ikincisinde ünsüz yumuşaması (`k -> ğ`) vardır. Ulama açısından ise \"Bahar**dan** **e**rken döndük.\" cümlesinde ünsüz + ünlü temasıyla ulama varken, \"Bahardan**,** erken döndük.\" cümlesinde virgül bulunduğu için ulama **yoktur**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Kaynaştırma ve ulama sorularında iki ince ayrıntı belirleyicidir: 1. `\"Senin evin\"` ile `\"Onun evini\"` ifadelerindeki `n` harflerini karıştırma: *Senin evin*deki `n` **2. tekil iyelik eki**dir (`ev-in`), kaynaştırma değildir. *Onun evi-n-i* sözcüğünde ise 3. tekil iyelik eki `-i` ile belirtme hâl eki `-i` arasına giren `n` **kaynaştırma ünsüzü**dür. 2. `\"Dün, akşamki toplantıya katıldım.\"` cümlesinde `dün` ünsüzle bitip `akşamki` ünlüyle başlasa da arada **virgül** olduğu için ulama **yoktur**!"
  },
  {
    "type": "key_points",
    "items": [
      "Kaynaştırma ünsüzleri **YaŞaSıN** (`y, ş, s, n`) olarak kodlanır ve yalnızca iki ünlü arasına (veya `ile` / ek-fiil öncesi `y` olarak) gelir.",
      "Ünsüzle biten kelimelere gelen eklerde (`okul-a, ev-i`) kaynaştırma aranmaz.",
      "İki sözcük arasında noktalama işareti varsa ulama yapılmaz.",
      "`n-b` benzeşmesinde `n` sesi `b` önünde söyleyişte `m`ye döner ama yazıya yansımaz (*İstanbul, sonbahar, binbaşı* `n` ile yazılır); *pembe, tembel, çember* ise `m` ile kalıplaşmıştır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
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
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · Temel Hukuk Kavramları
-- Kaynak: docs/konu_anlatimi/vatandaslik/01_temel_hukuk_kavramlari.md
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
  'vatandaslik.temel_hukuk_kavramlari.01',
  'Vatandaşlık',
  'Temel Hukuk Kavramları',
  1,
  'Bölüm 1: Toplumsal Düzen Kuralları, Hukuk Kuralları ve Yaptırımlar',
  'İnsanların bir arada barış ve güvenlik içinde yaşayabilmesi için davranışlarını sınırlayan toplumsal düzen kurallarına ihtiyaç vardır.  Bu kurallar din, ahlak, görgü ve hukuk kuralları olarak dört grupta toplanır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İnsanların bir arada barış ve güvenlik içinde yaşayabilmesi için davranışlarını sınırlayan toplumsal düzen kurallarına ihtiyaç vardır. Bu kurallar **din, ahlak, görgü ve hukuk kuralları** olarak dört grupta toplanır. Din kuralları günah ve sevap ekseninde ilahi iradeye, ahlak kuralları iyilik ve kötülük ölçütüne, görgü kuralları ise toplum içindeki nezaket ve saygı kalıplarına dayanır. Din, ahlak ve görgü kurallarına aykırı davranıldığında kişi günahkar sayılma, vicdan azabı duyma, kınanma veya toplumdan dışlanma gibi **manevi yaptırımlarla** karşılaşır. Buna karşılık **hukuk kuralları**nı diğerlerinden ayıran temel özellik, devlet gücüyle desteklenen **maddi yaptırıma** sahip olmasıdır."
  },
  {
    "type": "paragraph",
    "text": "Hukuk kurallarının yazılı olması çoğu zaman görülen bir özelliktir; ancak maddi yaptırımın tek koşulu yazılılık değildir. Nitekim yazısız bir hukuk kaynağı olan **örf ve adet hukuku** da devlet tarafından tanındığı ve mahkemelerce uygulandığı için maddi yaptırıma sahiptir. Toplumsal yaşamın değişmesiyle birlikte devlet, düzeni sağlamak için kuralları üç farklı nitelikte düzenler: uyulması mutlak zorunlu olan **emredici hukuk kuralları**, tanımlama yapan **tanımlayıcı hukuk kuralları** ve tarafların aksini kararlaştırabildiği **yedek hukuk kuralları**. Yedek hukuk kuralları kendi içinde ikiye ayrılır: tarafların sözleşmede düzenlemediği boşlukları dolduran **tamamlayıcı kurallar** ile tarafların kullandığı ama anlamını netleştirmediği ifadeleri (örneğin \"ayın başı\" veya \"ayın ortası\" gibi) açıklığa kavuşturan **yorumlayıcı kurallar**."
  },
  {
    "type": "heading",
    "text": "Hukuki Yaptırım Türleri"
  },
  {
    "type": "paragraph",
    "text": "Hukuk kurallarının ihlal edilmesi durumunda ihlalin niteliğine göre beş farklı maddi yaptırım uygulanır:"
  },
  {
    "type": "table",
    "headers": [
      "Yaptırım Türü",
      "Uygulandığı Alan",
      "Temel Sonucu"
    ],
    "rows": [
      [
        "Ceza",
        "Ceza hukuku (suçlar)",
        "Hapis veya adli para cezası gibi yaptırımlar uygulanır"
      ],
      [
        "Cebri İcra",
        "Özel hukuk borç ilişkileri",
        "Yerine getirilmeyen edim icra dairelerince zorla yerine getirilir"
      ],
      [
        "Tazminat",
        "Haksız fiil veya sözleşme ihlali",
        "Verilen maddi ya da manevi zarar para ile karşılanır"
      ],
      [
        "İptal",
        "İdare hukuku",
        "Hukuka aykırı idari işlem yargı kararıyla ortadan kaldırılır"
      ],
      [
        "Hükümsüzlük",
        "Özel hukuk işlemleri",
        "İşlem geçerlilik kazanamaz (yokluk, butlan, tek taraflı bağlamazlık)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Hükümsüzlük türleri kendi içinde birbirinden kesin çizgilerle ayrılır ve sınavda sıkça test edilir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Yokluk:** İşlemin kurucu unsurlarının eksik olmasıdır; işlem hukuk aleminde hiç doğmamıştır (örneğin resmi evlendirme memuru önünde yapılmayan imam nikahı).",
      "**Mutlak Butlan:** Kurucu unsurlar tamamlanmış olsa da işlemin emredici hukuk kurallarına, kamu düzenine, ahlaka aykırı olması veya **tam ehliyetsiz** bir kişi tarafından yapılmasıdır; işlem baştan itibaren geçersizdir ve hakim tarafından re''sen dikkate alınır (ancak butlanla sakat bir **evlilik**, mahkeme kararıyla iptal edilinceye kadar geçerli bir evliliğin sonuçlarını doğurur).",
      "**Nisbi Butlan:** Sözleşmenin başlangıçta geçerli olarak doğmasına karşın **hata, hile veya korkutma (ikrah)** gibi irade sakatlığı hallerinde mağdur olan tarafa belirli bir süre içinde (öğrenmeden veya korkunun kalkmasından itibaren **1 yıl**) işlemi iptal etme hakkı tanıyan geçersizlik türüdür.",
      "**Tek Taraflı Bağlamazlık (Askıda Hükümsüzlük):** Ayırt etme gücüne sahip küçük veya kısıtlıların (**sınırlı ehliyetsizlerin**) yasal temsilcilerinin izni olmadan kendilerini borç altına sokan işlemleri yapması halinde doğar; yasal temsilci onay verirse işlem geçerli hale gelir, onay vermezse geçersiz kalır."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM hükümsüzlük sorularında **yokluk** ile **mutlak butlanı** ve **iptal** ile **tazminatı** sürekli karşılaştırır. Ayırt etme gücü olmayan tam ehliyetsizin yaptığı sözleşmede kurucu unsurlar (irade açıklaması gibi) şeklen var olduğu için işlem yokluk değil **mutlak butlan**dır. Aynı şekilde idarenin hukuka aykırı bir işleminin mahkemece ortadan kaldırılması tazminat değil **iptal** yaptırımıdır; tazminat ise doğan zararın parayla karşılanmasıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Yerine getirilmeyen bir özel hukuk borcunun devlet gücüyle zorla yerine getirilmesi hangi yaptırım türüdür ve ceza hukukuyla ilişkisi nasıldır?\" Cevap **cebri icra**dır; cebri icra bir ceza hukuku yaptırımı değil, icra ve iflas daireleri eliyle yürütülen özel hukuk yaptırımıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Hukuk kurallarını din, ahlak ve görgüden ayıran temel ölçüt devlet destekli **maddi yaptırım**dır; yazısız örf ve adet hukuku da maddi yaptırıma sahiptir.",
      "Yedek hukuk kuralları **tamamlayıcı** ve **yorumlayıcı** kurallardan oluşur; tanımlayıcı kurallar yedek kural değildir.",
      "Kurucu unsur eksikse **yokluk**, emredici kurala aykırılık varsa **mutlak butlan**, irade sakatlığı varsa **nisbi butlan** söz konusudur.",
      "Sınırlı ehliyetsizin onaysız borçlandırıcı işlemi askıda hükümsüzdür (**tek taraflı bağlamazlık**)."
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
  'vatandaslik.temel_hukuk_kavramlari.02',
  'Vatandaşlık',
  'Temel Hukuk Kavramları',
  2,
  'Bölüm 2: Hukukun Kaynakları, Normlar Hiyerarşisi ve Boşluk Türleri',
  'Bir hukuk düzeninde hakimin önüne gelen uyuşmazlığı çözerken başvurduğu kurallar bütününü hukukun kaynakları oluşturur.  Türk hukukunda kaynaklar asli (bağlayıcı) kaynaklar ve yardımcı kaynaklar olarak ikiye ayrılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir hukuk düzeninde hakimin önüne gelen uyuşmazlığı çözerken başvurduğu kurallar bütününü **hukukun kaynakları** oluşturur. Türk hukukunda kaynaklar **asli (bağlayıcı) kaynaklar** ve **yardımcı kaynaklar** olarak ikiye ayrılır. Asli kaynaklar da kendi içinde **yazılı kaynaklar** ve **yazısız kaynak (örf ve adet hukuku)** biçiminde düzenlenir. Yazılı kaynakların tamamı devletin yetkili organları tarafından konulur ve yürürlüğe girmesi için kural olarak **Resmi Gazete**de yayımlanır. Örf ve adet hukuku ise toplum içinde uzun süredir tekrarlanan (**süreklilik**), uyulması gerektiğine dair genel inanç oluşan (**genel inanç**) ve devletçe yaptırımla desteklenen yazısız kurallardır; Resmi Gazete''de yayımlanma şartı yalnızca yazılı normlar içindir. Yardımcı kaynaklar olan **bilimsel görüşler (doktrin)** ve **yargı kararları (içtihatlar)** ise hakime karar verirken yol gösterir ancak kural olarak bağlayıcı değildir; yalnızca yüksek mahkemelerin **İçtihadı Birleştirme Kararları** benzer davalarda bağlayıcı nitelik taşır."
  },
  {
    "type": "heading",
    "text": "Normlar Hiyerarşisi ve Ceza Hukukunun İlkeleri"
  },
  {
    "type": "paragraph",
    "text": "Yazılı hukuk kuralları gelişigüzel yan yana durmaz; **Hans Kelsen** tarafından sistemleştirilen **Normlar Hiyerarşisi**ne göre alt basamaktaki her norm, geçerliliğini üstündeki normdan alır ve ona aykırı olamaz. 1982 Anayasası''nın **11. maddesi** uyarınca piramidin en tepesinde **Anayasa** yer alır (**Anayasanın Üstünlüğü** ilkesi). Anayasa''nın hemen altında **Kanunlar, Olağanüstü Hal Cumhurbaşkanlığı Kararnameleri** ve usulüne göre yürürlüğe konulmuş **Milletlerarası Antlaşmalar** bulunur; ancak Anayasa **m. 90** uyarınca temel hak ve özgürlüklere ilişkin milletlerarası antlaşmalarla kanunların aynı konuda farklı hükümler içermesi halinde milletlerarası antlaşma hükümleri esas alınır. Bunların altında sırasıyla olağan **Cumhurbaşkanlığı Kararnameleri**, **Yönetmelikler** ve genelge-yönerge gibi adsız düzenleyici işlemler gelir."
  },
  {
    "type": "paragraph",
    "text": "Kamu hukukunun önemli dallarından biri olan **Ceza Hukuku**nda ise yazılı kaynaklara sıkı sıkıya bağlılık zorunludur. Suçta ve cezada kanunilik ilkesi gereği **ceza hukukunda kıyas yasaktır** ve örf ve adet kurallarına dayanılarak suç veya ceza ihdas edilemez; suç ve cezalar yalnızca TBMM tarafından çıkarılan kanunla konulabilir ve kimse işlendiği zaman yürürlükte bulunan kanunun suç saymadığı bir fiilden dolayı cezalandırılamaz. Yer bakımından uygulamada ise devletin egemenlik sınırları içinde işlenen tüm suçlara, failin veya mağdurun uyruğuna bakılmaksızın Türk kanunlarının uygulanması **mülkilik ilkesi** olarak adlandırılır; **şahsilik ilkesi** ise vatandaşlık bağına göre yurt dışında işlenen bazı suçlarda uygulanır. Zaman bakımından ise kural olarak sonraki ceza kanunu failin lehineyse geriye yürür, aleyhineyse geriye yürümez."
  },
  {
    "type": "heading",
    "text": "Hukukta Boşluk Türleri ve Hakimin Rolü"
  },
  {
    "type": "paragraph",
    "text": "Türk Medeni Kanunu''nun **1. maddesi**, hakimin önüne gelen davayı \"kanunda hüküm yok\" diyerek reddedemeyeceğini ve uyuşmazlığı çözmekle yükümlü olduğunu hükme bağlar. Hakimin uygulayacağı yöntem, karşılaştığı boşluğun türüne göre değişir:"
  },
  {
    "type": "table",
    "headers": [
      "Boşluk Türü",
      "Tanımı",
      "Hakimin Uygulayacağı Yöntem"
    ],
    "rows": [
      [
        "Kanun Boşluğu",
        "Yazılı kaynaklarda uygulanabilir hüküm bulunmaması",
        "Yazısız kaynak olan **örf ve adet hukuku**na başvurur"
      ],
      [
        "Hukuk Boşluğu",
        "Hem yazılı kaynaklarda hem örf ve adette hüküm olmaması",
        "Kanun koyucu gibi davranarak **hukuk yaratır**"
      ],
      [
        "Kural İçi Boşluk",
        "Kanun koyucunun bilerek (\"haklı sebepler\", \"uygun tazminat\" gibi) bıraktığı boşluk",
        "TMK m. 4 gereği **takdir yetkisi** kullanır"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM **hukuk yaratma** ile **kanun yapmayı** sıkça birbirine karıştırır. Hakim hukuk boşluğu durumunda hukuk yarattığında ortaya çıkan kural bir TBMM kanunu değildir; bu kural genel ve soyut bir norm olarak **diğer mahkemeleri bağlamaz**, yalnızca önüne gelen somut uyuşmazlık için geçerli olur. Ayrıca kural içi boşlukta hakim hukuk yaratmaz, kanunun kendisine bilerek verdiği **takdir yetkisini** kullanır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Bir davada yazılı kanunlarda hüküm bulunamamış ancak örf ve adette çözüm varsa ne tür bir boşluk vardır?\" Yazılı kural olmadığı için **kanun boşluğu** vardır; hakim örf ve adet hukukuna gider. Hem yazılı hukukta hem örf ve adette hüküm yoksa **hukuk boşluğu** doğar ve hakim hukuk yaratır."
  },
  {
    "type": "key_points",
    "items": [
      "Normlar hiyerarşisi: Anayasa > Kanun ve Milletlerarası Antlaşmalar (temel haklarda antlaşma üstündür) > CBK > Yönetmelik > Genelge.",
      "Örf ve adet hukuku yazısız asıl kaynaktır; Resmi Gazete''de yayımlanmaz ve ceza hukukunda asla suç/ceza kaynağı olamaz.",
      "Kanun boşluğunda **örf ve adet**, hukuk boşluğunda **hukuk yaratma**, kural içi boşlukta **takdir yetkisi** uygulanır.",
      "Hakimin yarattığı hukuk diğer mahkemeleri bağlamaz; ceza hukukunda kıyas kesinlikle yasaktır."
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
  'vatandaslik.temel_hukuk_kavramlari.03',
  'Vatandaşlık',
  'Temel Hukuk Kavramları',
  3,
  'Bölüm 3: Kişilik, Ehliyetler ve Kişiliğin Sona Ermesi',
  'Hukuk düzeninde haklara ve borçlara sahip olabilen varlıklara kişi denir; hukukumuzda gerçek kişiler (insanlar) ve tüzel kişiler (dernek, vakıf, şirket, devlet, belediye gibi kişi veya mal toplulukları) olmak üzere iki tür kişi vardır.  Türk Medeni Kanunu m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Hukuk düzeninde haklara ve borçlara sahip olabilen varlıklara **kişi** denir; hukukumuzda **gerçek kişiler** (insanlar) ve **tüzel kişiler** (dernek, vakıf, şirket, devlet, belediye gibi kişi veya mal toplulukları) olmak üzere iki tür kişi vardır. Türk Medeni Kanunu **m. 28**''e göre gerçek kişilik çocuğun **sağ ve tam** olarak doğduğu anda başlar; ancak çocuk sağ ve tam doğmak koşuluyla ana rahmine düştüğü (**cenin**) andan itibaren geriye etkili olarak **hak ehliyeti**ni elde eder. Yani tek başına sağ doğum yetmez, tam doğum da şarttır. **Tüzel kişiler** ise TMK **m. 49** uyarınca kuruldukları anda **hak ehliyeti**ni, kanuna ve kuruluş belgelerine göre **zorunlu organlarını** oluşturdukları anda ise **fiil ehliyeti**ni kazanırlar."
  },
  {
    "type": "heading",
    "text": "Fiil Ehliyeti, Şartları ve Ehliyet Grupları"
  },
  {
    "type": "paragraph",
    "text": "Hak ehliyeti pasif bir ehliyet olup herkes için eşitken, kişinin kendi fiilleriyle hak kazanabilmesi ve borç altına girebilmesi için **fiil ehliyeti**ne sahip olması gerekir. Fiil ehliyetinin üç temel şartı vardır: **ayırt etme gücüne sahip olmak**, **ergin olmak** ve **kısıtlı olmamak**."
  },
  {
    "type": "bullets",
    "items": [
      "**Erginlik (Rüşt):** TMK **m. 11** uyarınca olağan erginlik **18 yaşın doldurulmasıyla** (yani 19''dan gün alınmasıyla) başlar. Bunun iki istisnası vardır: **Evlenme** kişiyi ergin kılar (olağan evlenme yaşı **17**, olağanüstü hallerde hakim izniyle **16** yaşın doldurulmasıdır). İkinci istisna olan **kazai rüşt (yargısal erginlik, TMK m. 12)** için ise **15 yaşın doldurulması**, küçüğün istemi, velinin izni (vesayet altındaysa vesayet makamının izni) ve mahkeme kararı şarttır.",
      "**Kısıtlı Olmamak:** TMK **m. 405-408** uyarınca akıl hastalığı veya akıl zayıflığı, savurganlık, alkol veya uyuşturucu madde bağımlılığı, kötü yaşama tarzı, kötü yönetim, **1 yıl veya daha uzun süreli** özgürlüğü bağlayıcı hapis cezası alınması ya da kişinin yaşlılığı, engelliliği veya deneyimsizliği nedeniyle kendi isteğiyle başvurması hallerinde mahkemece kısıtlama kararı verilir ve vasi atanır."
    ]
  },
  {
    "type": "paragraph",
    "text": "Bu üç şartın varlığına göre gerçek kişiler dört ehliyet grubuna ayrılır:"
  },
  {
    "type": "table",
    "headers": [
      "Ehliyet Grubu",
      "Kapsadığı Kişiler",
      "İşlem Yapma Yetkisi"
    ],
    "rows": [
      [
        "Tam Ehliyetliler",
        "Ayırt etme gücü var + ergin + kısıtlı değil",
        "Her türlü hukuki işlemi tek başına yapabilirler"
      ],
      [
        "Sınırlı Ehliyetliler",
        "Tam ehliyet şartlarını taşır ancak yasal danışman atanmıştır",
        "Kural olarak tam ehliyetlidirler; bazı önemli işlemlerde danışman oyu gerekir"
      ],
      [
        "Sınırlı Ehliyetsizler",
        "Ayırt etme gücüne sahip küçükler ve kısıtlılar",
        "Yararlarına karşılıksız kazanımları tek başına yapar; borçlandırıcı işlemler için yasal temsilci izni gerekir"
      ],
      [
        "Tam Ehliyetsizler",
        "Ayırt etme gücü (temyiz kudreti) olmayanlar",
        "Yaptıkları hukuki işlemler kural olarak **mutlak butlan**la batıldır"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM ehliyet konusunda iki noktayı ısrarla yoklar: 1. **Sınırlı Ehliyetli** (yasal danışman atanan kişi) ile **Sınırlı Ehliyetsiz** (küçük veya kısıtlı) kavramlarını birbirinin yerine koyar. 2. **Sınırlı ehliyetsizler** yasal temsilcileri izin veya onay verse dahi başkasına **kefil olamaz, vakıf kuramaz ve önemli bağışlarda bulunamazlar**! Bu üç yasak işlem mutlak yasaktır."
  },
  {
    "type": "heading",
    "text": "Kişiliğin Sona Ermesi: Ölüm, Ölüm Karinesi ve Gaiplik"
  },
  {
    "type": "paragraph",
    "text": "Gerçek kişilik **ölüm** ile kendiliğinden sona erer. Ancak cesedin bulunamadığı özel durumlarda **ölüm karinesi** veya **gaiplik** kurumları devreye girer. Bir kimse **ölümüne kesin gözle bakılacak** bir durumda (örneğin düşen uçakta veya batan gemide yolcu listesinde olduğu halde cesedi bulunamıyorsa) kaybolursa **mahkeme kararına gerek kalmaksızın**, o yerin en büyük mülki amirinin (**Vali veya Kaymakam**) emriyle nüfus kütüğüne ölü kaydı düşülür; buna **ölüm karinesi** denir ve evlilik kendiliğinden sona erer."
  },
  {
    "type": "paragraph",
    "text": "Buna karşılık **gaiplik**te kesin ölüm değil, şüpheli bir kaybolma vardır ve mutlaka **mahkeme kararı** gerekir. **Ölüm tehlikesi içinde kaybolma**da en az **1 yıl**, **kendisinden uzun süre haber alınamama** durumunda ise en az **5 yıl** geçtikten sonra mahkemeden gaiplik istenebilir. Önemli ayrım şudur: **Gaiplik kararında evlilik kendiliğinden sona ermez!** Geride kalan eşin evliliği bitirebilmesi için ayrıca mahkemeden **evliliğin feshini** talep etmesi şarttır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"15 yaşını doldurmuş bir küçük kendi isteği ve velisinin rızasıyla mahkeme kararı sonucu ergin kılınmıştır. Bu kişi aşağıdakilerden hangisini yasal temsilcisi izin verse bile yapamaz?\" Sorunun çeldiricisi \"kazai rüşt oldu artık tam ehliyetli sayılır\" düşüncesidir; oysa kazai rüşt kişiyi **ergin** kılar. Tam ehliyetli hale gelen bu kişi işlemlerini yapabilirken, henüz ergin kılınmamış bir **sınırlı ehliyetsiz** ise veli izin verse dahi kefil olamaz ve vakıf kuramaz."
  },
  {
    "type": "key_points",
    "items": [
      "Gerçek kişi sağ ve tam doğmak şartıyla cenin anında hak ehliyeti kazanır; tüzel kişi kurulunca hak ehliyeti, zorunlu organlarıyla fiil ehliyeti kazanır.",
      "Olağan erginlik 18 yaşını doldurmakla başlar; evlenme yaşı olağan 17, olağanüstü 16; kazai rüşt yaşı ise 15''tir.",
      "Sınırlı ehliyetsizler yasal temsilci onayıyla bile **kefil olamaz, vakıf kuramaz ve önemli bağış yapamaz**.",
      "Ölüm karinesinde mahkeme kararı yoktur (mülki amir emri) ve evlilik kendiliğinden biter; gaiplikte (1 yıl / 5 yıl) mahkeme kararı şarttır ve evlilik kendiliğinden bitmez."
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
  'vatandaslik.temel_hukuk_kavramlari.04',
  'Vatandaşlık',
  'Temel Hukuk Kavramları',
  4,
  'Bölüm 4: Hısımlık, Hak Kavramı, Kazanma ve Koruma',
  'Medeni hukukta bireyler arasındaki aile ve kan bağları hısımlık kavramıyla düzenlenir ve üç ana türe ayrılır: kan hısımlığı, kayın (sıhri) hısımlığı ve evlat edinmeden doğan yapay (akdi) hısımlık.  Kan hısımlığının derecesi, hısımları birbirine bağlayan doğum sayısı ile hesaplanır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Medeni hukukta bireyler arasındaki aile ve kan bağları **hısımlık** kavramıyla düzenlenir ve üç ana türe ayrılır: **kan hısımlığı**, **kayın (sıhri) hısımlığı** ve **evlat edinmeden doğan yapay (akdi) hısımlık**. Kan hısımlığının derecesi, hısımları birbirine bağlayan **doğum sayısı** ile hesaplanır. Örneğin anne, baba ve çocuklar birbirinin 1. derece üstsoy-altsoy kan hısımıdır. İki kardeş arasında ise ortak köke (anne veya babaya) çıkılıp inildiği için iki doğum bulunur ve kardeşler **2. derece yansoy** kan hısımıdır; amca, dayı, hala, teyze ile yeğen **3. derece yansoy**, kuzenler (amca-hala-dayı-teyze çocukları) ise **4. derece yansoy** kan hısımıdır."
  },
  {
    "type": "paragraph",
    "text": "**Kayın hısımlığı**, evlilik sözleşmesinin kurulmasıyla birlikte eşlerden biri ile diğer eşin kan hısımları arasında aynı tür ve dereceden doğar; örneğin bir eşin kardeşi (2. derece yansoy kan hısımı), diğer eşin **2. derece yansoy kayın hısımı**dır (ancak iki eşin akrabaları birbirinin kayın hısımı olmaz). TMK **m. 18** uyarınca **evliliğin boşanma veya ölümle sona ermesi, kurulmuş olan kayın hısımlığını ortadan kaldırmaz**. **Evlat edinme** ise mahkeme kararıyla kurulan yapay bir hısımlıktır ve yalnızca evlat edinen (ve onun altsoyu) ile evlatlık arasında doğar; evlat edinenin kardeşleri veya anne-babası gibi diğer akrabalarıyla evlatlık arasında hısımlık bağı kurulmaz."
  },
  {
    "type": "heading",
    "text": "Hak Türleri, Kazanılması ve Kullanılması"
  },
  {
    "type": "paragraph",
    "text": "Hukuk düzeninin kişilere tanıdığı ve koruduğu menfaatlere **hak** denir. Para ile ölçülebilen ve devredilebilen **malvarlığı hakları** (mülkiyet gibi **ayni haklar** ve alacak hakları) mirasçılara geçebilirken, kişiye sıkı sıkıya bağlı **kişilik hakları** devredilemez ve mirasla geçmez. Bir kişinin tek taraflı irade açıklamasıyla yeni bir hukuki durum yaratan, mevcut durumu değiştiren veya ortadan kaldıran haklara ise **yenilik doğuran (inşai) haklar** denir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Kurucu yenilik doğuran haklar:** Yeni bir hukuki ilişki kurarlar (alım, önalım hakkı gibi).",
      "**Değiştirici yenilik doğuran haklar:** Mevcut hukuki durumu değiştirirler (ayıplı malda **bedel indirimi** isteme gibi).",
      "**Bozucu yenilik doğuran haklar:** Mevcut hukuki ilişkiyi sona erdirirler (sözleşmenin **feshi**, **istifa** gibi)."
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Hakların kazanılması ile kullanılması arasındaki iki temel ilkeyi **K-İ / K-D** şeklinde eşleştir: - Hak **K**azanılırken **İ**yiniyet (TMK m. 3 — subjektif iyiniyet, hakkın kazanılmasına engel durumu bilmemek) - Hak **K**ullanılırken ve borç yerine getirilirken **D**ürüstlük (TMK m. 2 — objektif dürüstlük, orta zekalı dürüst insan ölçütü)"
  },
  {
    "type": "paragraph",
    "text": "Mülkiyetin zamanaşımı yoluyla kazanılmasında da üç farklı süre uygulanır: **taşınır mallarda** iyiniyetle davasız ve aralıksız **5 yıl**, **tapulu taşınmazlarda** olağan zamanaşımıyla (TMK m. 712) **10 yıl**, **tapusuz taşınmazlarda** ise olağanüstü zamanaşımıyla **20 yıl** zilyetlik gerekir."
  },
  {
    "type": "heading",
    "text": "Hakların Korunması ve Hukuka Uygunluk Sebepleri"
  },
  {
    "type": "paragraph",
    "text": "Modern hukukta kişinin kendi hakkını kendi gücüyle zorla alması (**ihkak-ı hak**) kural olarak yasaktır; hak devlet mahkemeleri ve icra organları aracılığıyla korunur. Ancak kişinin acil durumlarda bizzat hakkını koruyabildiği üç istisna (hukuka uygunluk sebebi) vardır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Meşru Müdafaa (Haklı Savunma):** Kişinin kendisine veya başkasına yönelmiş haksız ve devam eden bir saldırıyı o anda hal ve koşullara göre orantılı bir şekilde defetmesidir. Saldırgana verilen zarardan dolayı fail **tazminat ödemez**.",
      "**Zaruret (Iztırar) Hali:** Kişinin kendisini veya yakınını ağır ve derhal gerçekleşecek bir tehlikeden (örneğin bir hayvan saldırısından veya doğal afetten) kurtarmak için **masum üçüncü bir kişinin malına zarar vermesidir**. Eylem hukuka uygundur ancak hakim hakkaniyet gereği üçüncü kişinin zararının **tazmin edilmesine** hükmedebilir.",
      "**Kuvvet Kullanma:** Hükümet müdahalesinin zamanında yetişemeyeceği durumlarda hakkın kaybolmasını önlemek için ölçülü güç kullanılmasıdır."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM **meşru müdafaa** ile **zaruret halini** iki noktadan ayırmanı bekler: Meşru müdafaada doğrudan **saldırganın kendisine** karşı savunma yapılır ve **tazminat ödenmez**; zaruret halinde ise tehlikeden kaçarken **masum üçüncü kişinin malına** zarar verilir ve **tazminat ödeme yükümlülüğü** doğabilir. Ayrıca boşanmayla **kayın hısımlığının bittiği** düşüncesi de en sık düşülen hısımlık tuzağıdır; kayın hısımlığı asla sona ermez."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Ahmet, kendi dayısının kızı olan Ayşe ile kaçıncı dereceden ve ne tür hısımdır?\" Ahmet -> Annesi (1) -> Dedesi (2) -> Dayısı (3) -> Ayşe (4) şeklinde 4 doğum bulunduğu için **4. derece yansoy kan hısımı**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Hısımlık derecesi doğum sayısıyla hesaplanır: kardeşler 2., amca-yeğen 3., kuzenler 4. derece yansoy kan hısımıdır.",
      "TMK m. 18 gereği **kayın hısımlığı boşanma veya ölümle sona ermez**; evlat edinme ise yalnızca evlat edinenle (ve altsoyuyla) sınırlı kalır.",
      "Hak **kazanılırken iyiniyet** (TMK m. 3), **kullanılırken dürüstlük** (TMK m. 2) uygulanır; zamanaşımıyla kazanım taşınırda 5, tapulu taşınmazda 10, tapusuzda 20 yıldır.",
      "İhkak-ı hak yasaktır; meşru müdafaada saldırgana karşı savunma yapılır ve tazminat ödenmez, zaruret halinde ise üçüncü kişinin zararı tazmin edilebilir."
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
  'vatandaslik.temel_hukuk_kavramlari.05',
  'Vatandaşlık',
  'Temel Hukuk Kavramları',
  5,
  'Bölüm 5: Borçlar Hukukunun Temel Kavramları',
  'İki taraf arasında bir tarafın (borçlu) diğer tarafa (alacaklı) karşı belirli bir davranışta bulunma (edim: verme, yapma veya yapmama) yükümlülüğü altına girdiği hukuki bağa borç ilişkisi denir.  Borç ilişkisi üç temel kaynaktan doğar: hukuki işlemler (sözleşmeler), haksız fiiller ve sebepsiz zenginleşme.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İki taraf arasında bir tarafın (**borçlu**) diğer tarafa (**alacaklı**) karşı belirli bir davranışta bulunma (**edim**: verme, yapma veya yapmama) yükümlülüğü altına girdiği hukuki bağa **borç ilişkisi** denir. Borç ilişkisi üç temel kaynaktan doğar: **hukuki işlemler (sözleşmeler)**, **haksız fiiller** ve **sebepsiz zenginleşme**. Sözleşme tarafların karşılıklı ve birbirine uygun irade açıklamalarıyla kurulurken; **haksız fiil** sözleşme dışı bir sorumluluk kaynağıdır ve taraflar arasında önceden bir sözleşme bulunması şartı aranmaz. Haksız fiilin doğabilmesi için dört unsurun birlikte gerçekleşmesi gerekir: **hukuka aykırı fiil, zarar, kusur ve illiyet (nedensellik) bağı**. Sebepsiz zenginleşme ise haklı bir neden olmaksızın bir kimsenin malvarlığının başka bir kimsenin malvarlığı aleyhine artmasıdır."
  },
  {
    "type": "paragraph",
    "text": "Borç ilişkisi kurulduktan sonra kural olarak **ifa** (borcun gereği gibi yerine getirilmesi) ile sona erer. İfa dışında borcu sona erdiren başlıca hukuki sebepler şunlardır:"
  },
  {
    "type": "bullets",
    "items": [
      "**İbra (Aklama):** Alacaklının borçlu ile anlaşarak alacağından tamamen veya kısmen vazgeçmesidir.",
      "**Tecdit (Yenileme):** Mevcut eski borcun sona erdirilerek yerine yeni bir borç ilişkisinin kurulmasıdır.",
      "**Takas:** Aynı türden karşılıklı ve muaccel (vadesi gelmiş) borçların tek taraflı beyanla birbirini karşıladığı ölçüde sona erdirilmesidir.",
      "**Birleşme:** Alacaklı ve borçlu sıfatlarının aynı kişide toplanmasıdır (örneğin borçlunun alacaklıya mirasçı olması).",
      "**Kusursuz İmkansızlık:** Borçlunun kusuru olmaksızın borcun ifasının objektif olarak imkansız hale gelmesidir."
    ]
  },
  {
    "type": "heading",
    "text": "Zamanaşımı, Hak Düşürücü Süre ve Borcun Ödenmemesi"
  },
  {
    "type": "paragraph",
    "text": "Sürelerin haklar ve borçlar üzerindeki etkisi sınavlarda en çok karıştırılan konulardan biridir. Kanunun öngördüğü süre geçtikten sonra alacaklının dava açma ve zorla tahsil etme gücünü zayıflatan **zamanaşımı**, **borcu sona erdiren bir sebep değildir!** Zamanaşımına uğrayan borç ortadan kalkmaz, yalnızca **eksik borç (tabii borç)** haline gelir. Borçlu borcu kendi rızasıyla öderse geçerli bir ifa yapmış sayılır ve \"zamanaşımına uğramıştı\" diyerek geri isteyemez; ancak alacaklı dava açarsa borçlu **zamanaşımı def''ini** ileri sürerek ödemekten kaçınabilir. Hakim zamanaşımını kendiliğinden (re''sen) dikkate almaz, borçlunun ileri sürmesini bekler."
  },
  {
    "type": "paragraph",
    "text": "Buna karşılık **hak düşürücü süre** (örneğin boşanmada veya irade sakatlığında iptal davası süreleri), sürenin dolmasıyla birlikte **hakkın kendisini tamamen ortadan kaldırır** (öldürür). Hak düşürücü süre bir def''i değil itirazdır; bu nedenle taraflar ileri sürmese bile hakim tarafından **re''sen (kendiliğinden)** dikkate alınır."
  },
  {
    "type": "table",
    "headers": [
      "Özellik",
      "Zamanaşımı",
      "Hak Düşürücü Süre"
    ],
    "rows": [
      [
        "Hakkın Durumu",
        "Hak sona ermez; **eksik borç** haline gelir",
        "Hak tamamen ortadan kalkar"
      ],
      [
        "Hakimin Tutumu",
        "Re''sen dikkate **almaz**; borçlu ileri sürmelidir",
        "Taraflar söylemese de **re''sen** dikkate alır"
      ],
      [
        "Hukuki Niteliği",
        "Def''idir (borçlu isterse kullanır)",
        "İtirazdır (kamu düzenindendir)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Bir diğer önemli anayasal ve hukuki ilke de özel hukuk borçlarının ödenememesinin sonucudur. 1982 Anayasası''nın **38. maddesi** uyarınca **\"Hiç kimse, yalnızca sözleşmeden doğan bir yükümlülüğü yerine getirememesinden dolayı özgürlüğünden alıkonulamaz.\"** Dolayısıyla kredi kartı borcu, kira bedeli veya senet gibi özel hukuk borçlarının ödenememesi suç değildir ve doğrudan hapis cezasıyla cezalandırılamaz; alacaklı yalnızca cebri icra yoluna başvurabilir (icra dairesine verilen ödeme taahhüdünü ihlal veya nafaka borcunu ödememe gibi kanuni disiplin hapsi istisnaları hariç)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM borcu sona erdiren sebepler sorusunda şıklara mutlaka **zamanaşımı**nı koyar. Unutma: İfa, ibra, tecdit, takas, birleşme ve kusursuz imkansızlık borcu **bitirir**; ancak **zamanaşımı borcu bitirmez**, onu yalnızca eksik borca dönüştürür. Aynı şekilde **ibra** (alacaktan vazgeçme) ile **tecdit** (eski borcu yeni borçla değiştirme) kavramları da birbirinin yerine verilerek çeldirici oluşturulur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Bir alacaklı 10 yıllık genel zamanaşımı süresi geçtikten sonra borçlusuna dava açmıştır. Borçlu duruşmada zamanaşımı savunması yapmazsa hakim ne yapmalıdır?\" Zamanaşımını hakim **re''sen dikkate alamayacağı** için borçlu savunma (**def''i**) yapmadıkça davaya devam eder ve borçluyu ödemeye mahkum edebilir."
  },
  {
    "type": "key_points",
    "items": [
      "Haksız fiilin dört unsuru hukuka aykırı fiil, zarar, kusur ve illiyet bağıdır; önceden sözleşme bulunması şart değildir.",
      "İfa, ibra (alacaktan vazgeçme), tecdit (yenileme), takas, birleşme ve kusursuz imkansızlık borcu sona erdirir; **zamanaşımı borcu bitirmez**, eksik borç yapar.",
      "Zamanaşımını hakim re''sen gözetmez; **hak düşürücü süreyi** ise hakim re''sen dikkate alır.",
      "Anayasa m. 38 gereği sözleşmeden doğan özel borcun ödenememesi nedeniyle kural olarak hapis cezası verilemez."
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
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · 1982 Anayasası ve Temel İlkeler
-- Kaynak: docs/konu_anlatimi/vatandaslik/02_1982_anayasasi_ve_temel_ilkeler.md
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.01',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  1,
  'Bölüm 1: Türk Anayasa Tarihi (1876''dan 1982''ye)',
  'Türk anayasacılık hareketleri, devlet iktidarının hukuk kurallarıyla sınırlandırılması ve temel hakların güvence altına alınması arayışıyla 19.  yüzyıl başında filizlendi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türk anayasacılık hareketleri, devlet iktidarının hukuk kurallarıyla sınırlandırılması ve temel hakların güvence altına alınması arayışıyla 19. yüzyıl başında filizlendi. Padişahın mutlak yetkilerini ilk kez kısıtlayan belge **1808 Sened-i İttifak**tır; bunu hukukun üstünlüğünü tanıyan **1839 Tanzimat Fermanı** ve gayrimüslim tebaanın haklarını genişleten **1856 Islahat Fermanı** izlemiştir. Ancak teknik anlamda **ilk yazılı anayasa**, 1876''da II. Abdülhamit döneminde ilan edilen **Kanun-i Esasi**dir. Kanun-i Esasi ile iki kanatlı parlamento kurulmuştur: üyeleri halk tarafından çift dereceli seçimle 4 yıllığına seçilen **Heyet-i Mebusan** ve üyeleri bizzat padişah tarafından ömür boyu atanan **Heyet-i Ayan**. İlk dönemde padişaha tanınan meclisi fesih ve sürgün yetkileri, 1909 değişiklikleriyle daraltılarak gerçek parlamenter meşrutiyet güçlendirilmiştir."
  },
  {
    "type": "heading",
    "text": "Cumhuriyet Dönemi Anayasaları"
  },
  {
    "type": "paragraph",
    "text": "Milli Mücadele koşullarında TBMM tarafından kabul edilen **1921 Anayasası (Teşkilat-ı Esasiye Kanunu)**, yalnızca 23 ana madde ve 1 ek maddeden oluşan kısa bir metindir. Değiştirilmesi için özel nitelikli çoğunluk öngörmediği ve temel haklara yer vermediği için Türk anayasa tarihindeki **tek yumuşak** ve **tek çerçeve** anayasadır; bu anayasa dışındaki 1876, 1924, 1961 ve 1982 anayasalarının tamamı hem **sert (katı)** hem de **kazuistik (ayrıntıcı)** anayasalardır. Bu yapı, savaş koşullarında hızlı karar almayı sağlayan meclis hükümeti modelinin bir sonucudur."
  },
  {
    "type": "paragraph",
    "text": "1924 Anayasası sert ve kazuistik bir metin olarak meclis hükümeti ile parlamenter sistem arası karma bir hükümet modeli benimsemiş, ancak **Anayasa Mahkemesi''ni kurmadığı** için kanunların anayasaya uygunluk denetimini meclisin kendi takdirine bırakmıştır. 1924 Anayasası zaman içinde köklü demokratik ve laik değişiklikler görmüştür: **1928**''de \"Devletin dini İslam''dır\" ibaresi ile yeminlerdeki dini ifadeler çıkarılmış, **1934**''te kadınlara milletvekili seçme ve seçilme hakkı tanınmış, **5 Şubat 1937**''de ise Atatürk''ün altı temel ilkesi anayasa metnine eklenmiştir. Çok partili hayata geçişte **1946 seçimleri** \"açık oy, gizli sayım\" usulüyle ilk çok partili seçim olurken, **1950 seçimleri** ilk kez \"gizli oy, açık sayım\" ilkesiyle yapılan demokratik seçim olarak tarihe geçmiştir. Bu demokratik açılım, ilerleyen yıllarda yargı denetimi ve temel hak güvencelerinin anayasada güçlendirilmesi ihtiyacını doğurmuştur."
  },
  {
    "type": "table",
    "headers": [
      "Anayasa",
      "Meclis Yapısı",
      "Hükümet Sistemi",
      "Öne Çıkan Kurumsal Özellik"
    ],
    "rows": [
      [
        "1876 Kanun-i Esasi",
        "Çift meclis (Mebusan + Ayan)",
        "Meşruti monarşi",
        "İlk yazılı Türk anayasası"
      ],
      [
        "1921 Teşkilat-ı Esasiye",
        "Tek meclis (TBMM)",
        "Meclis hükümeti",
        "**Tek yumuşak** ve **tek çerçeve** anayasa"
      ],
      [
        "1924 Anayasası",
        "Tek meclis (TBMM)",
        "Karma sistem",
        "1928 laikleşme, 1937 ilkeler; AYM yok"
      ],
      [
        "1961 Anayasası",
        "Çift meclis (Millet Meclisi + Senato)",
        "Parlamenter sistem",
        "**AYM, MGK, DPT, YSK** ilk kez kuruldu"
      ],
      [
        "1982 Anayasası",
        "Tek meclis (TBMM)",
        "2017 sonrası CB Hükümet",
        "Yürütme güçlendirildi; Senato kaldırıldı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "1961 Anayasası, çoğulcu demokrasi ve kuvvetler ayrılığı anlayışıyla **Anayasa Mahkemesi (AYM)**, **Milli Güvenlik Kurulu (MGK)**, **Devlet Planlama Teşkilatı (DPT)** ve **Yüksek Seçim Kurulu (YSK)** gibi kurumları ilk kez anayasal düzene kazandırmıştır. Tarihimizde çift meclis uygulanan iki anayasa vardır: 1876 Kanun-i Esasi ve 1961 Anayasası (Millet Meclisi ve Cumhuriyet Senatosu). **1982 Anayasası** ise 1970''lerdeki koalisyon krizlerini ve meclis tıkanıklıklarını aşmak amacıyla Cumhuriyet Senatosunu kaldırıp tek meclise dönmüş ve yürütme organını güçlendirmiştir. Ayrıca **Anayasa m. 176** uyarınca anayasanın dayandığı temel görüş ve ilkeleri belirten **Başlangıç kısmı anayasa metnine dahildir**; buna karşılık **madde kenar başlıkları anayasa metnine dahil değildir**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM anayasa karşılaştırmalarında iki ince farkı çok sık sorar: 1. **1961 Anayasası** \"insan haklarına **dayanan**\" devlet ifadesini kullanırken, **1982 Anayasası** \"insan haklarına **saygılı**\" devlet kavramını tercih etmiştir. 2. İlk anayasal belge 1808 Sened-i İttifak olsa da ilk **anayasa** 1876 Kanun-i Esasi''dir; AYM ise 1982''de değil **1961 Anayasası** ile kurulmuştur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1982 Anayasası''nın 176. maddesine göre aşağıdakilerden hangisi anayasa metnine dahil değildir?\" Seçeneklerde Başlangıç kısmı, ilk üç madde ve geçici maddeler yer alır; metne dahil olmayan yalnızca **madde kenar başlıkları**dır."
  },
  {
    "type": "key_points",
    "items": [
      "İlk anayasal belge 1808 Sened-i İttifak, ilk anayasa 1876 Kanun-i Esasi''dir.",
      "1921 Anayasası tek yumuşak ve tek çerçeve anayasadır; 1876 ve 1961 anayasaları çift meclislidir.",
      "AYM, MGK, DPT ve YSK ilk kez 1961 Anayasası ile kuruldu; 1961 \"dayanan\", 1982 \"saygılı\" kavramını kullandı.",
      "Anayasa m. 176''ya göre Başlangıç kısmı metne dahil, madde kenar başlıkları metne dahil değildir."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.02',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  2,
  'Bölüm 2: 1982 Anayasası''nın Değiştirilemez Hükümleri ve Temel İlkeleri',
  '1982 Anayasası''nın devletin temel yapısını ve rejimini güvenceye alan ilk üç maddesi, Anayasa''nın 4.  maddesi ile özel koruma altına alınmıştır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın devletin temel yapısını ve rejimini güvenceye alan **ilk üç maddesi**, Anayasa''nın **4. maddesi** ile özel koruma altına alınmıştır. Anayasa m. 4 uyarınca yalnızca **ilk 3 madde** (1. madde: Devletin şekli Cumhuriyettir; 2. madde: Cumhuriyetin nitelikleri; 3. madde: Devletin bütünlüğü, resmi dili Türkçe, bayrağı, milli marşı İstiklal Marşı ve başkenti Ankara) değiştirilemez ve **değiştirilmesi teklif dahi edilemez**. Dolayısıyla 4. maddenin kendisi koruyucu normdur; korunan hükümler ilk 3 maddedir. Anayasa koyucunun bu üç maddeyi değiştirilemez kılmasının temel nedeni, devletin cumhuriyet rejimini, laik-demokratik hukuk devleti niteliğini ve üniter bütünlüğünü siyasi çoğunlukların geçici kararlarına karşı güvence altına almaktır."
  },
  {
    "type": "heading",
    "text": "Cumhuriyetin Temel Nitelikleri (Anayasa m. 2)"
  },
  {
    "type": "paragraph",
    "text": "Anayasa''nın 2. maddesi Türkiye Cumhuriyeti''nin temel niteliklerini açıkça sayar ve devlet organlarının tüm işlemlerinde uyması gereken anayasal çerçeveyi çizer:"
  },
  {
    "type": "bullets",
    "items": [
      "**Demokratik Devlet ve Üniter Yapı:** Halkın kendi temsilcilerini serbest, genel ve eşit seçimlerle belirlemesine dayanır. Temsili demokrasinin yanında halkın yönetime doğrudan katıldığı **yarı doğrudan demokrasi**nin dört aracı vardır: **referandum (halkoylaması), halk vetosu, halk girişimi ve temsilcilerin geri çağrılması**. Ayrıca Türkiye **üniter bir devlettir**; ülke sınırları içinde tek bir egemenlik, tek bir parlamento, tek bir anayasa ve tek bir hukuk düzeni bulunur (federal devlette ise federe birimlerin kendi anayasası ve meclisi vardır).",
      "**Laik Devlet:** Din kurallarının devlet işlerine karışmamasını, devletin tüm inançlara eşit mesafede durmasını ve yasama organının kanun yaparken din kurallarına değil akıl, bilim ve anayasa ilkelerine dayanmasını gerektirir. Kanunlar hiçbir dini otoritenin onayına tabi tutulamaz.",
      "**Sosyal Devlet:** Devletin vatandaşlarına sosyal güvenlik sağlamasını, fırsat eşitliği yaratmasını ve vergi ile kamusal hizmetler yoluyla gelirin adil dağıtılmasını öngörür. Sosyal devlet, komünizm gibi özel mülkiyeti ortadan kaldırmaz; serbest piyasa içinde sosyal adaleti, çalışma hayatının korunmasını ve asgari refahı teminat altına alır.",
      "**Hukuk Devleti:** Devletin tüm eylem ve işlemlerinin hukuk kurallarıyla bağlı olması, yargı bağımsızlığının sağlanması ve idarenin yargısal denetime tabi tutulmasıdır. Hukuk devletinde yasama veya yürütme dahil hiçbir organ mahkeme kararlarını değiştiremez, iptal edemez veya uygulanmasını geciktiremez; idarenin her türlü eylem ve işlemine karşı yargı yolu açıktır.",
      "**Atatürk Milliyetçiliğine Bağlı ve İnsan Haklarına Saygılı Devlet:** Ulusal birliği ırk temeline değil ortak vatandaşlık ve kültür bağına dayandırır; bireyin temel haklarını devlet otoritesi karşısında korunan anayasal değerler olarak kabul eder."
    ]
  },
  {
    "type": "heading",
    "text": "Tabii Hakim İlkesi (Anayasa m. 37)"
  },
  {
    "type": "paragraph",
    "text": "Hukuk devletinin ceza ve yargılama alanındaki en önemli güvencelerinden biri **Anayasa m. 37**''de düzenlenen **Tabii (Doğal) Hakim İlkesi**dir. Bu ilkeye göre hiç kimse kanunen tabi olduğu mahkemeden başka bir merci önüne çıkarılamaz ve bir kimseyi kanunen tabi olduğu mahkemeden başka bir merci önüne çıkarma sonucunu doğuran yargı yetkisine sahip olağanüstü merciler kurulamaz. Başka bir ifadeyle, bir suç işlendiği veya uyuşmazlık doğduğu anda o davaya bakacak **görevli ve yetkili mahkemenin kanunla önceden belirlenmiş olması** zorunludur; olay gerçekleştikten sonra kişiye veya olaya özgü mahkeme kurulması hukuk devletine ve yargı bağımsızlığına aykırıdır. Bu güvence, bireylerin siyasi veya keyfi yargılamalarla karşılaşmasını engelleyerek hukuki güvenlik sağlar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM değiştirilemez hükümler ve devlet nitelikleri sorularında iki tuzak kurar: 1. İlk 3 madde değiştirilemez; **4. madde** ise bu ilk 3 maddenin değiştirilemeyeceğini emreden koruyucu maddedir. 2. **Sosyal devlet** ilkesi \"özel mülkiyetin kaldırılması ve üretimin tamamen devletleştirilmesi\" anlamına gelmez; sosyal devlet mülkiyet hakkını koruyarak sosyal adalet sağlar."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Suç işlendikten sonra yalnızca o suça bakmak üzere yeni bir mahkeme kurulması hangi anayasal ilkeyi ihlal eder?\" Cevap **Anayasa m. 37 Tabii Hakim İlkesi**dir; yargılayacak mahkemenin olaydan önce kanunla belli olması şarttır."
  },
  {
    "type": "key_points",
    "items": [
      "Anayasa m. 4 yalnızca ilk 3 maddenin değiştirilemeyeceğini ve teklif dahi edilemeyeceğini güvence altına alır.",
      "Yarı doğrudan demokrasinin araçları referandum, halk vetosu, halk girişimi ve temsilcilerin geri çağrılmasıdır.",
      "Üniter devlette tek egemenlik ve tek anayasa vardır; hukuk devletinde yürütme mahkeme kararlarını değiştiremez veya geciktiremez.",
      "Tabii hakim ilkesi (m. 37), uyuşmazlık doğmadan önce görevli ve yetkili mahkemenin kanunla belirlenmiş olmasını zorunlu kılar."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.03',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  3,
  'Bölüm 3: Seçim İlkeleri, Yüksek Seçim Kurulu ve Siyasi Partiler',
  'Demokratik devlet ilkesinin hayata geçirilmesini sağlayan seçim kuralları Anayasa m.  67 ve devamında ayrıntılı olarak düzenlenmiştir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Demokratik devlet ilkesinin hayata geçirilmesini sağlayan seçim kuralları **Anayasa m. 67** ve devamında ayrıntılı olarak düzenlenmiştir. Seçimler yargı yönetim ve denetimi altında **serbest, eşit, gizli, tek dereceli, genel oy, açık sayım ve döküm** esaslarına göre yapılır. **Genel oy** servet, vergi, eğitim veya cinsiyet ayrımı gözetilmeksizin tüm vatandaşların oy kullanabilmesini; **eşit oy** ise her seçmenin yalnızca bir oya sahip olmasını (1 kişi = 1 oy) ve oyların eşit değerde sayılmasını ifade eder. Tek dereceli seçimde seçmen doğrudan kendi temsilcisine oy verirken, gizli oy seçmenin baskı altında kalmadan özgür iradesini kullanmasını, açık sayım ve döküm ise seçim sonuçlarının şeffaf biçimde denetlenmesini güvence altına alır."
  },
  {
    "type": "heading",
    "text": "Oy Kullanamayacaklar, Seçim Süreleri ve Erteleme"
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 67** uyarınca **18 yaşını dolduran** her Türk vatandaşı seçme ve halkoylamasına katılma hakkına sahiptir. Ancak üç grup oy kullanamaz:"
  },
  {
    "type": "bullets",
    "items": [
      "Silah altında bulunan **er ve erbaşlar** (subay ve astsubaylar oy kullanabilir)",
      "**Askeri öğrenciler**",
      "Taksirli suçlardan hüküm giyenler hariç **ceza infaz kurumlarında bulunan hükümlüler** (yani **kasıtlı suçtan hükümlüler** oy kullanamazken, **taksirli suçtan hükümlüler** cezaevinde olsalar dahi oy kullanabilirler; ayrıca tutuklular da hüküm giymedikleri için oy kullanır)."
    ]
  },
  {
    "type": "paragraph",
    "text": "**2017 anayasa değişikliği** ile **Anayasa m. 75** değiştirilerek TBMM üye tamsayısı **550''den 600 milletvekiline** çıkarılmış, milletvekili seçilme yaşı **18**''e indirilmiştir (1982''nin ilk halinde 30, 2006''da 25 idi; Cumhurbaşkanı seçilme yaşı ise **40**''tır). **Anayasa m. 77**''ye göre TBMM ve Cumhurbaşkanlığı seçimleri **5 yılda bir aynı gün** birlikte yapılır; bu eşzamanlılık yasama ve yürütme arasındaki uyumun sağlanmasını ve koalisyon dönemlerindeki erken seçim belirsizliğinin azaltılmasını hedefler. **Anayasa m. 78** uyarınca seçimlerin geriye bırakılmasının **tek bir anayasal sebebi** vardır, o da **Savaş**tır (deprem, afet veya salgın sebebiyle seçimler ertelenemez; savaş nedeniyle erteleme kararını da yalnızca TBMM 1 yıl için verebilir). Ara seçimler ise genel seçimlere **1 yıl kala** yapılamaz; bunun tek istisnası **bir ilin veya seçim çevresinin TBMM''de hiç milletvekilinin kalmaması**dır (bu durumda boşalmayı takip eden 90 günden sonraki ilk pazar günü ara seçim yapılır)."
  },
  {
    "type": "heading",
    "text": "Yüksek Seçim Kurulu (YSK) ve Siyasi Partiler"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 79** uyarınca seçimlerin genel yönetim ve denetimini **Yüksek Seçim Kurulu (YSK)** yürütür. YSK **7 asıl ve 4 yedek** üyeden oluşur; üyelerin 6''sı Yargıtay, 5''i Danıştay Genel Kurullarınca kendi üyeleri arasından gizli oyla seçilir. Seçim sürecinde itirazların hızla karara bağlanması ve seçim takviminin kesintiye uğramaması amacıyla **YSK''nın verdiği kararlar kesindir**; bu kararlar aleyhine **Anayasa Mahkemesi''ne bireysel başvuru dahil hiçbir yargı merciine başvurulamaz**."
  },
  {
    "type": "paragraph",
    "text": "Siyasi partilere ilişkin kurallarda ise güncel baraj oranlarını karıştırmamalısın:"
  },
  {
    "type": "bullets",
    "items": [
      "**Genel seçim barajı:** 2022 yılında yapılan kanun değişikliği ile yüzde 10''dan **%7''ye** indirilmiştir.",
      "**Devlet (Hazine) yardımı barajı:** Siyasi Partiler Kanunu uyarınca genel seçimlerde barajı geçemese dahi geçerli oyların en az **%3''ünü** alan siyasi partilere Hazine''den mali yardım yapılır.",
      "**Parti kapatma davası:** Siyasi partilerin kapatılması davası **Yargıtay Cumhuriyet Başsavcısı** tarafından açılır; davayı inceleyip kapatma veya devlet yardımından yoksun bırakma kararını ise **Anayasa Mahkemesi** (**m. 149** uyarınca toplantıya katılan üyelerin **2/3 nitelikli çoğunluğu** ile) verir."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Seçim kurallarında üç klasik ÖSYM tuzağı vardır: 1. Cezaevindeki **kasıtlı suç** hükümlüleri oy kullanamaz; ancak **taksirli suç** hükümlüleri oy kullanabilir! 2. Güncel genel seçim barajı **%7**, Hazine yardımı alma barajı ise **%3**tür. 3. Parti kapatma davasını **Yargıtay Cumhuriyet Başsavcısı** açar, kararı **Anayasa Mahkemesi** (2/3 çoğunlukla) verir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Bir doğal afet veya salgın durumunda TBMM seçimleri erteleyebilir mi?\" Anayasa m. 78''e göre seçimlerin ertelenmesinin tek anayasal sebebi **Savaş**tır; afet veya ekonomik kriz gerekçesiyle seçimler ertelenemez."
  },
  {
    "type": "key_points",
    "items": [
      "TBMM üye tamsayısı 600, seçilme yaşı 18, Cumhurbaşkanı seçilme yaşı 40''tır; seçimler 5 yılda bir aynı gün yapılır.",
      "Er/erbaşlar, askeri öğrenciler ve kasıtlı suç hükümlüleri oy kullanamaz; taksirli suç hükümlüleri oy kullanabilir.",
      "Seçimlerin tek erteleme sebebi savaştır; bir ilin hiç vekili kalmaması 1 yıl kala ara seçim yasağının tek istisnasıdır.",
      "YSK kararları kesindir ve AYM''ye dahi başvurulamaz; seçim barajı %7, Hazine yardımı barajı %3''tür."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.04',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  4,
  'Bölüm 4: Anayasanın Değiştirilmesi Usulü (m. 175) ve Anayasa Yargısı',
  '1982 Anayasası sert (katı) bir anayasa olduğu için değiştirilmesi olağan kanunlardan daha zor şartlara ve nitelikli çoğunluklara bağlanmıştır.  Anayasanın üstünlüğünü ve toplumsal uzlaşıyı korumak amacıyla öngörülen bu usul, basit bir parlamento çoğunluğunun temel anayasal kuralları tek taraflı biçimde değiştirmesini engeller.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası sert (katı) bir anayasa olduğu için değiştirilmesi olağan kanunlardan daha zor şartlara ve nitelikli çoğunluklara bağlanmıştır. Anayasanın üstünlüğünü ve toplumsal uzlaşıyı korumak amacıyla öngörülen bu usul, basit bir parlamento çoğunluğunun temel anayasal kuralları tek taraflı biçimde değiştirmesini engeller. **Anayasa m. 175** uyarınca bir anayasa değişikliği süreci üç aşamalı sıkı kurallara tabidir:"
  },
  {
    "type": "paragraph",
    "text": "1. **Teklif:** Anayasa değişikliği yalnızca TBMM üye tamsayısının en az **1/3''ü (200 milletvekili)** tarafından yazılı olarak teklif edilebilir (yürütme organı anayasa değişikliği teklif edemez). 2. **Görüşme ve Oylama:** Anayasa değişiklik teklifleri Genel Kurul''da **ivedilikle görüşülemez**; **iki defa** görüşülür ve iki görüşme arasında en az **48 saatlik** (\"serinleme süresi\") bir zaman geçmesi anayasal zorunluluktur. Bu bekleme süresi, milletvekillerinin değişiklik üzerinde yeniden düşünmesine ve kamuoyunun tartışmasına imkan tanır. Teklifin kabulü için en az TBMM üye tamsayısının **3/5''inin (360 milletvekili)** **gizli oyu** şarttır. 3. **Cumhurbaşkanı''nın Onay / Referandum Yetkisi:** Kabul oyu sayısına göre Cumhurbaşkanı''nın kullanabileceği yetkiler farklılaşır; mecliste daha düşük nitelikli çoğunlukla kabul edilen değişikliklerde halkoylaması zorunlu hale gelerek doğrudan halkın onayı aranır."
  },
  {
    "type": "table",
    "headers": [
      "Meclisteki Kabul Oyu",
      "Cumhurbaşkanı''nın Yetkisi",
      "Halkoylaması (Referandum) Durumu"
    ],
    "rows": [
      [
        "360 – 399 arası (3/5 ile 2/3 arası)",
        "Doğrudan **onaylayamaz**; Meclis''e geri gönderebilir",
        "Geri göndermezse **zorunlu halkoylamasına** sunar"
      ],
      [
        "400 ve üzeri (2/3 ve üzeri)",
        "Doğrudan **onaylayabilir** veya Meclis''e geri gönderebilir",
        "İsterse **ihtiyari halkoylamasına** sunabilir"
      ],
      [
        "360''ın altı (359 ve altı)",
        "Teklif reddedilmiş sayılır",
        "Cumhurbaşkanı''na gitmez"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Cumhurbaşkanı''nın Meclis''e geri gönderdiği bir anayasa değişikliğini TBMM üye tamsayısının **2/3''ü (400 milletvekili)** ile tekrar kabul etmesi halinde dahi Cumhurbaşkanı dilerse bu değişikliği halkoylamasına sunabilir; geri gönderilen metin 360–399 arası oyla yeniden kabul edilirse yine halkoylamasına gitmek zorundadır. Halkoylamasında geçerli oyların salt çoğunluğunun (%50''den fazlasının) \"evet\" oyu vermesi halinde anayasa değişikliği kabul edilmiş olur ve Resmi Gazete''de yayımlanarak yürürlüğe girer."
  },
  {
    "type": "heading",
    "text": "Anayasa Değişikliklerinin Yargısal Denetimi (m. 148)"
  },
  {
    "type": "paragraph",
    "text": "Anayasa değişikliklerinin Anayasa Mahkemesi tarafından denetlenmesi, normal kanunların denetiminden çok daha sınırlıdır; çünkü anayasa değişikliğini yapan iktidar tali kurucu iktidardır ve içeriğe yönelik siyasal tercih kural olarak yasamaya aittir. **Anayasa m. 148**''in açık hükmüne göre normal kanunlar hem şekil hem de esas bakımından denetlenebilirken, **anayasa değişiklikleri YALNIZCA ŞEKİL BAKIMINDAN denetlenebilir, esas (içerik) denetimi yapılamaz!**"
  },
  {
    "type": "paragraph",
    "text": "Anayasa Mahkemesi anayasa değişikliklerinde şekil denetimi yaparken yalnızca üç unsuru inceler: **teklif çoğunluğuna (200)** uyulup uyulmadığı, **oylama çoğunluğuna (360)** uyulup uyulmadığı ve **ivedilikle görüşülememe (iki görüşme ve 48 saat)** şartına uyulup uyulmadığı. Dava açma süresi normal kanunlarda 60 gün iken, **anayasa değişikliklerinde şekil bozukluğu nedeniyle iptal davası açma süresi YALNIZCA 10 GÜNDÜR!** Bu davayı yalnızca **Cumhurbaşkanı** veya **TBMM üye tamsayısının 1/5''i (120 milletvekili)** açabilir. Anayasa Mahkemesi''nin anayasa değişikliğini şekilden iptal edebilmesi için ise **Anayasa m. 149** gereği toplantıya katılan üyelerin **2/3 nitelikli çoğunluğu** gerekir (normal kanun iptallerinde salt çoğunluk yeterlidir)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Anayasa değişikliği usulünde üç sayı ve kural sıkça karıştırılır: - **Teklif** için 1/3 (**200**), **kabul** için en az 3/5 (**360**), doğrudan onay için 2/3 (**400**) milletvekili gerekir. - 360-399 arası oyla kabul edilen değişikliği Cumhurbaşkanı asla doğrudan onaylayamaz; veto etmezse referanduma sunmak zorundadır. - Anayasa değişikliğinde iptal davası süresi 60 gün değil **10 gün**dür ve yalnızca **şekil** yönünden denetim yapılır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"TBMM''de 375 milletvekilinin gizli oyuyla kabul edilen bir anayasa değişikliği hakkında Cumhurbaşkanı ne yapamaz?\" 375 oy 360–399 bandında kaldığı için Cumhurbaşkanı değişikliği **doğrudan onaylayarak Resmi Gazete''de yayımlayamaz**; ya Meclis''e geri gönderir ya da zorunlu referanduma sunar. Aynı şekilde Anayasa Mahkemesi de Anayasa m. 148 gereğince bu değişikliğin içeriğini esas yönünden denetleyemez, yalnızca teklif, oylama çoğunluğu ve iki görüşme arasındaki süreye ilişkin şekil şartlarını inceleyebilir."
  },
  {
    "type": "key_points",
    "items": [
      "Anayasa değişikliği teklifi 1/3 (200), kabulü en az 3/5 (360) gizli oyla yapılır; iki görüşme arasında en az 48 saat beklenir.",
      "360–399 oyda referandum zorunludur; 400+ oyda Cumhurbaşkanı doğrudan onaylayabilir veya ihtiyari referanduma götürebilir; halkoylamasında salt çoğunluk aranır.",
      "Anayasa değişiklikleri yalnızca şekil yönünden, 10 gün içinde ve 2/3 AYM çoğunluğuyla iptal edilebilir."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.05',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  5,
  'Bölüm 5: 2017 Anayasa Değişikliği ile Gelen Temel Dönüşüm',
  '16 Nisan 2017 halkoylamasıyla kabul edilen 6771 sayılı Kanun, 1982 Anayasası''nın hükümet sistemini kökten değiştirerek parlamenter sistemden Cumhurbaşkanlığı Hükümet Sistemine geçişi sağladı.  Bu reformla birlikte yürütme organındaki çift başlılık (Cumhurbaşkanı + Başbakan) ortadan kaldırılarak yürütme yetkisi ve görevi tek başına doğrudan halk tarafından seçilen Cumhurbaşkanına verildi; böylece yasama ve yürütme organlarının birbirinden kesin çizgilerle ayrıldığı sert kuvvetler ayrılığına geçildi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "16 Nisan 2017 halkoylamasıyla kabul edilen **6771 sayılı Kanun**, 1982 Anayasası''nın hükümet sistemini kökten değiştirerek parlamenter sistemden **Cumhurbaşkanlığı Hükümet Sistemi**ne geçişi sağladı. Bu reformla birlikte yürütme organındaki çift başlılık (Cumhurbaşkanı + Başbakan) ortadan kaldırılarak yürütme yetkisi ve görevi tek başına doğrudan halk tarafından seçilen **Cumhurbaşkanı**na verildi; böylece yasama ve yürütme organlarının birbirinden kesin çizgilerle ayrıldığı sert kuvvetler ayrılığına geçildi. Değişikliklerin önemli bir kısmı 24 Haziran 2018 genel seçimleriyle birlikte yürürlüğe girdi."
  },
  {
    "type": "heading",
    "text": "Kaldırılan ve Yeni Kurulan Kurumlar"
  },
  {
    "type": "paragraph",
    "text": "2017 reformuyla birlikte Türk anayasa ve idare hukukundan çıkarılan kurum ve kavramları bilmek sınav sorularını çözerken kritik önem taşır:"
  },
  {
    "type": "table",
    "headers": [
      "Kaldırılan Kurum / İşlem",
      "Yerine Gelen veya Kalan Düzenleme"
    ],
    "rows": [
      [
        "Başbakanlık ve Bakanlar Kurulu",
        "Yürütme tek başına **Cumhurbaşkanı** ve atadığı Cumhurbaşkanı yardımcıları ile bakanlara geçti"
      ],
      [
        "Kanun Tasarısı (Yürütmenin yasa teklifi)",
        "Kalktı; yalnızca milletvekilleri **kanun teklifi** verebilir (bütçe hariç)"
      ],
      [
        "Kanun Hükmünde Kararname (KHK) ve Tüzük",
        "Kalktı; **Cumhurbaşkanlığı Kararnamesi (CBK)** ve yönetmelikler getirildi"
      ],
      [
        "Gensoru ve Güvenoyu",
        "Kalktı; yürütme artık meclisten güvenoyu almaz (meclis denetimi yazılı soru, meclis araştırması, genel görüşme, meclis soruşturması)"
      ],
      [
        "Sıkıyönetim",
        "Kalktı; olağanüstü yönetim usulü olarak yalnızca **OHAL** kaldı"
      ],
      [
        "Askeri Yargıtay ve AYİM",
        "Kaldırıldı; disiplin mahkemeleri hariç askeri mahkemeler kurulamaz"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Bu dönüşüm kapsamında **2017 değişikliğinin** getirdiğini zannettiğin ancak kaldırılmayan kurumlara da dikkat etmelisin: Örneğin **Yüksek Seçim Kurulu (YSK)** 1961''den beri varlığını sürdürmektedir, kaldırılmamıştır. Aynı şekilde **Milli Güvenlik Kurulu (MGK)** ve **Anayasa Mahkemesi (AYM)** de varlığını korumaktadır (AYM üye sayısı Askeri Yargıtay ve AYİM''in kaldırılmasıyla **17''den 15''e** düşürülmüştür). Ayrıca Cumhurbaşkanı''nın partisiyle ilişiğinin kesilmesi zorunluluğu kaldırılarak \"partili cumhurbaşkanlığı\" yolu açılmış ve bakanların milletvekili olma şartı kaldırılmıştır (milletvekili iken bakan atanan kişinin milletvekilliği sona erer)."
  },
  {
    "type": "heading",
    "text": "Olağan CBK ile OHAL CBK Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Yeni sistemde yürütmenin düzenleyici işlemleri içinde **Cumhurbaşkanlığı Kararnamesi (CBK)** merkezi bir yere sahiptir. Ancak **olağan dönemde** çıkarılan CBK ile **Olağanüstü Hal (OHAL)** döneminde çıkarılan CBK arasında çok keskin yargısal denetim farkı vardır. Olağan CBK yalnızca yürütme yetkisine ilişkin konularda çıkarılabilir; temel hak ve siyasi hakları düzenleyemez, kanunla açıkça düzenlenen konularda çıkarılamaz, kanunla çelişmesi halinde kanun hükümleri uygulanır ve Anayasa Mahkemesi''nin hem şekil hem esas yönünden yargı denetimine tabidir. Buna karşılık **Anayasa m. 148**''in açık hükmü uyarınca **olağanüstü hallerde çıkarılan Cumhurbaşkanlığı kararnamelerinin şekil ve esas bakımından Anayasa''ya aykırılığı iddiasıyla Anayasa Mahkemesi''nde dava açılamaz**; yani OHAL CBK''ları Anayasa Mahkemesi denetimine kesinlikle kapalıdır ve çıkarıldığı gün TBMM onayına sunulur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "2017 Anayasa Değişikliği ile kaldırılan temel başlıkları **B-K-T-G-S-A** şeklinde özetleyebilirsin: - **B**aşbakanlık ve Bakanlar Kurulu - **K**anun Tasarısı ve KHK - **T**üzük - **G**ensoru ve Güvenoyu - **S**ıkıyönetim - **A**skeri Yargıtay, AYİM ve askeri mahkemeler (disiplin mahkemeleri hariç)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM 2017 değişikliğinde iki noktayı tuzak olarak kullanır: 1. \"Hükümet kanun tasarısı verebilir\" ifadesi 2017 sonrası **yanlıştır**; yürütme (bütçe kanun teklifi hariç) artık yasa teklif edemez, yalnızca milletvekilleri **kanun teklifi** verir. 2. **Olağan CBK** AYM denetimine açıkken, **OHAL CBK** (m. 148) şekil ve esas bakımından AYM denetimine tamamen kapalıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"2017 Anayasa değişikliği ile aşağıdakilerden hangisi yürütmenin denetim araçları arasından çıkarılmıştır?\" Meclis araştırması, genel görüşme, meclis soruşturması ve yazılı soru devam etmektedir; çıkarılan ise Bakanlar Kurulu''nu düşürme aracı olan **gensoru**dur (ayrıca sözlü soru da kaldırılmıştır). Bunun yanında yeni sistemde Cumhurbaşkanı hakkında görevle ilgili suç işlediği iddiasıyla meclis soruşturması açılabilmesi için TBMM üye tamsayısının salt çoğunluğu (301) ile önerge verilmesi, 3/5 (360) gizli oyla soruşturma açılması ve 2/3 (400) gizli oyla Yüce Divan''a sevk kararı alınması gerekir."
  },
  {
    "type": "key_points",
    "items": [
      "2017 reformuyla Başbakanlık, Bakanlar Kurulu, Kanun Tasarısı, KHK, Tüzük, Gensoru, Güvenoyu, Sıkıyönetim, Askeri Yargıtay ve AYİM kaldırıldı.",
      "Yürütme bütçe dışında kanun teklif edemez; kanun teklifini yalnızca milletvekilleri verir.",
      "Olağan CBK AYM denetimine açıktır; OHAL CBK ise şekil ve esas bakımından AYM denetimine kapalıdır (m. 148).",
      "Askeri Yargıtay ve AYİM kalktığı için AYM üye sayısı 17''den 15''e inmiştir; YSK ve MGK varlığını sürdürmektedir; Cumhurbaşkanlığı Hükümet Sistemi''nde sert kuvvetler ayrılığı esas alınmıştır."
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
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · Temel Hak ve Ödevler
-- Kaynak: docs/konu_anlatimi/vatandaslik/03_temel_hak_ve_odevler.md
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
  'vatandaslik.temel_hak_ve_odevler.01',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  1,
  'Bölüm 1: Temel Hakların Niteliği, Sınırlandırılması ve Durdurulması',
  '1982 Anayasası''nın İkinci Kısmı, bireyin devlet ve toplum karşısındaki hak ve ödevlerini Alman hukukçu Jellinek''in klasik sınıflandırmasını esas alarak üç bölümde düzenler: devletin bireyin özgürlük alanına müdahale etmemesini gerektiren Kişinin Hakları ve Ödevleri (Negatif Statü / Koruyucu Haklar), bireyin devletten hizmet ve sosyal güvence talep etmesini sağlayan Sosyal ve Ekonomik Haklar ve Ödevler (Pozitif Statü / İsteme Hakları) ve bireyin devlet yönetimine katılmasını sağlayan Siyasi Haklar ve Ödevler (Aktif Statü / Katılma Hakları).  Bu üçlü ayrım, devletin hangi hakta geri çekilmesi ve hangi hakta aktif görev üstlenmesi gerektiğini belirleyen temel anayasal ölçüttür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın İkinci Kısmı, bireyin devlet ve toplum karşısındaki hak ve ödevlerini Alman hukukçu Jellinek''in klasik sınıflandırmasını esas alarak üç bölümde düzenler: devletin bireyin özgürlük alanına müdahale etmemesini gerektiren **Kişinin Hakları ve Ödevleri (Negatif Statü / Koruyucu Haklar)**, bireyin devletten hizmet ve sosyal güvence talep etmesini sağlayan **Sosyal ve Ekonomik Haklar ve Ödevler (Pozitif Statü / İsteme Hakları)** ve bireyin devlet yönetimine katılmasını sağlayan **Siyasi Haklar ve Ödevler (Aktif Statü / Katılma Hakları)**. Bu üçlü ayrım, devletin hangi hakta geri çekilmesi ve hangi hakta aktif görev üstlenmesi gerektiğini belirleyen temel anayasal ölçüttür."
  },
  {
    "type": "heading",
    "text": "Temel Hakların Sınırlandırılması (Anayasa m. 13)"
  },
  {
    "type": "paragraph",
    "text": "Temel hak ve hürriyetler sınırsız değildir; ancak demokratik bir hukuk devletinde bu sınırlandırmanın da katı anayasal güvencelere bağlanması gerekir. 2001 anayasa değişikliğine kadar Anayasa''nın 13. maddesinde tüm haklar için geçerli sayılan \"kamu düzeni, milli güvenlik, genel sağlık\" gibi torba genel sınırlama sebepleri yer alıyordu. **2001 değişikliği** ile bu genel sınırlama sebepleri tamamen kaldırılmış ve hakların korunması güçlendirilmiştir. Güncel Anayasa **m. 13** uyarınca temel hak ve hürriyetler:"
  },
  {
    "type": "bullets",
    "items": [
      "**Özlerine dokunulmaksızın** (hakkın kullanımını tamamen imkansız hale getirmeden),",
      "Yalnızca **Anayasanın ilgili maddelerinde belirtilen özel sebeplere** bağlı olarak,",
      "**Ancak kanunla** (TBMM tarafından çıkarılan kanunla; olağan Cumhurbaşkanlığı Kararnamesiyle temel haklar sınırlanamaz) sınırlanabilir."
    ]
  },
  {
    "type": "paragraph",
    "text": "Ayrıca yapılacak her sınırlama; Anayasanın sözüne ve ruhuna, **demokratik toplum düzeninin** ve **laik Cumhuriyetin** gereklerine ve **ölçülülük ilkesine** aykırı olamaz. Anayasa Mahkemesi denetimlerinde temel ölçüt olan **ölçülülük ilkesi** üç alt ilkeden oluşur: sınırlama aracının ulaşılmak istenen amaca uygun olmasını ifade eden **elverişlilik**, amaca ulaşmak için en yumuşak aracın seçilmesini ifade eden **gereklilik (zorunluluk)** ve sınırlama ile elde edilecek kamu yararı arasında makul bir denge bulunmasını ifade eden **orantılılık**."
  },
  {
    "type": "heading",
    "text": "Temel Hakların Durdurulması ve Sert Çekirdek Haklar (Anayasa m. 15)"
  },
  {
    "type": "paragraph",
    "text": "Olağan dönemlerde uygulanan 13. madde güvencelerine karşılık, devletin varlığını tehdit eden ağır kriz hallerinde **Anayasa m. 15** devreye girer. Savaş, seferberlik veya olağanüstü hallerde, milletlerarası hukuktan doğan yükümlülükler ihlal edilmemek kaydıyla, durumun gerektirdiği ölçüde temel hak ve hürriyetlerin kullanılması kısmen veya tamamen durdurulabilir veya bunlar için Anayasada öngörülen güvencelere aykırı tedbirler alınabilir."
  },
  {
    "type": "paragraph",
    "text": "Ancak Anayasa m. 15''in ikinci fıkrası, savaş ve olağanüstü hal gibi en ağır dönemlerde dahi asla dokunulamayacak dört **sert çekirdek hak** belirlemiştir:"
  },
  {
    "type": "table",
    "headers": [
      "Sert Çekirdek Hak (m. 15/2)",
      "Anayasal Kapsamı",
      "İstisna / Sınav Notu"
    ],
    "rows": [
      [
        "Yaşama Hakkı ve Vücut Bütünlüğü",
        "Kişinin yaşama hakkına, maddi ve manevi varlığının bütünlüğüne dokunulamaz",
        "Savaş hukukuna uygun fiiller sonucu meydana gelen ölümler hariç"
      ],
      [
        "İnanç ve Düşünce Açıklamama",
        "Kimse din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamaz ve suçlanamaz",
        "Düşünceyi açıklama özgürlüğü sınırlanabilir ama zorla açıklatma yasaktır"
      ],
      [
        "Suç ve Cezaların Geriye Yürümezliği",
        "Suç ve cezalar geçmişe yürütülemez",
        "Aleyhe ceza kanunu geçmişe uygulanamaz"
      ],
      [
        "Masumiyet Karinesi",
        "Suçluluğu mahkeme kararıyla saptanıncaya kadar kimse suçlu sayılamaz",
        "Gözaltı veya tutuklulukta dahi masumiyet karinesi devam eder"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM sert çekirdek haklar sorularında şıklara mutlaka **mülkiyet hakkı**, **seyahat hürriyeti** veya **toplantı hakkı**nı koyar. Savaş ve olağanüstü halde dahi dokunulamayan haklar yalnızca yukarıdaki **dört haktır**; mülkiyet ve seyahat hürriyeti sert çekirdek hak değildir. Aynı şekilde 2001''den beri Anayasa''da genel sınırlama sebeplerinin bulunmadığını da unutma."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Temel hakların sınırlandırılması ve durdurulması arasındaki farkı **13-Ö / 15-4** şeklinde kodla: - **m. 13 (Olağan Dönem):** **Ö**züne dokunulmaz, yalnızca **ö**zel sebeplerle, kanunla ve **ö**lçülü biçimde sınırlanır. - **m. 15 (Savaş / OHAL):** Kısmen veya tamamen durdurulabilir; ancak **4** sert çekirdek hakka asla dokunulamaz."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Ölçülülük ilkesinin alt unsurları nelerdir?\" Cevap **elverişlilik, gereklilik ve orantılılık**tır; \"geriye yürümezlik\" veya \"kanunilik\" ölçülülük ilkesinin alt unsuru değildir."
  },
  {
    "type": "key_points",
    "items": [
      "Kişisel haklar negatif statü (karışma), sosyal haklar pozitif statü (hizmet ver), siyasi haklar aktif statü (yönetime kat) haklarıdır.",
      "2001 değişikliği sonrası genel sınırlama sebepleri kalkmıştır; haklar özüne dokunulmadan, ilgili maddedeki özel sebeplerle ve **ancak kanunla** sınırlanır.",
      "Ölçülülüğün üç alt ilkesi elverişlilik, gereklilik ve orantılılıktır.",
      "Savaşta bile dokunulamayan 4 sert çekirdek hak: yaşama hakkı ve vücut bütünlüğü, inanç/düşünce açıklamaya zorlanamama, suç-cezaların geriye yürümezliği ve masumiyet karinesidir."
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
  'vatandaslik.temel_hak_ve_odevler.02',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  2,
  'Bölüm 2: Kişinin Hakları ve Ödevleri (Negatif Statü Hakları)',
  'Anayasa''nın İkinci Kısmının İkinci Bölümünde düzenlenen Kişinin Hakları ve Ödevleri, bireyin maddi ve manevi varlığını devlet müdahalesinden koruyan temel güvencelerdir.  Bu bölümde yer alan süreler, hakim kararı şartı ve istisnalar KPSS sorularında doğrudan ölçülür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın İkinci Kısmının İkinci Bölümünde düzenlenen **Kişinin Hakları ve Ödevleri**, bireyin maddi ve manevi varlığını devlet müdahalesinden koruyan temel güvencelerdir. Bu bölümde yer alan süreler, hakim kararı şartı ve istisnalar KPSS sorularında doğrudan ölçülür."
  },
  {
    "type": "heading",
    "text": "Kişi Özgürlüğü, Özel Hayat ve Seyahat Güvenceleri"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 19** uyarınca yakalanan veya tutuklanan kişi, tutulma yerine en yakın mahkemeye gönderilmesi için gerekli süre (yol süresi) hariç en geç **kırk sekiz saat (48 saat)** ve toplu olarak işlenen suçlarda en çok **dört gün (4 gün)** içinde hakim önüne çıkarılır. **Anayasa m. 20** (özel hayatın gizliliği), **m. 21** (konut dokunulmazlığı) ve **m. 22** (haberleşme hürriyeti) kapsamında kişinin üstü, özel kağıtları, eşyası veya konutu aranamaz, bunlara el konulamaz ve haberleşmesi engellenemez. Bu işlemler kural olarak usulüne göre verilmiş **hakim kararı** ile yapılır; ancak gecikmesinde sakınca bulunan hallerde kanunla yetkili kılınmış merciin **yazılı emri** (sözlü emir kesinlikle geçersizdir!) bulunmadıkça yapılamaz. Yetkili merciin yazılı emri de yirmi dört saat içinde görevli hakimin onayına sunulur ve hakim kararını el koymadan itibaren kırk sekiz saat içinde açıklar."
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 23**''te düzenlenen yerleşme ve seyahat hürriyetinde iki önemli ayrım bulunur. Birincisi, sağlıklı ve düzenli kentleşmeyi gerçekleştirmek, kaçak yapılaşmayı önlemek ve kamu mallarını korumak yalnızca **yerleşme hürriyeti**nin sınırlandırma sebebidir; bu gerekçelerle seyahat hürriyeti sınırlandırılamaz. İkincisi, **2010 anayasa değişikliği** ile vatandaşın **yurt dışına çıkma hürriyeti**, ancak **suç soruşturması veya kovuşturması** sebebiyle ve **hakim kararına bağlı olarak** sınırlanabilir; dolayısıyla vergi borcu veya özel borç nedeniyle yurt dışı çıkış yasağı konulamaz."
  },
  {
    "type": "heading",
    "text": "Din, Basın, Örgütlenme ve Ceza Hukuku Güvenceleri"
  },
  {
    "type": "bullets",
    "items": [
      "**Din ve Vicdan Hürriyeti (m. 24):** Din ve ahlak eğitim ve öğretimi Devletin gözetim ve denetimi altında yapılır. **Din kültürü ve ahlak öğretimi** ilk ve ortaöğretim kurumlarında okutulan **zorunlu** dersler arasındadır; bunun dışındaki özel din eğitimi kişilerin kendi isteğine, küçüklerin de kanuni temsilcisinin talebine bağlıdır.",
      "**Basın Hürriyeti ve Basımevi Güvencesi (m. 28-32):** Basın hürdür, sansür edilemez. **Anayasa m. 29** gereği basımevi kurmak **izin alma ve mali teminat yatırma** şartına bağlanamaz. **Anayasa m. 30** uyarınca kanuna uygun şekilde basın işletmesi olarak kurulan basımevi ve eklentileri ile basın araçları suç aleti olduğu gerekçesiyle **zapt ve müsadere edilemez** veya işletilmekten alıkonulamaz. **Düzeltme ve cevap hakkı (tekzip, m. 32)** ise yalnızca kişilerin şeref ve haysiyetine dokunulması veya kendileriyle ilgili gerçeğe aykırı yayınlar yapılması hallerinde tanınır.",
      "**Dernek ve Toplantı Hakları (m. 33-34):** Herkes **önceden izin almaksızın** dernek kurma ve silahsız, saldırısız toplantı ve gösteri yürüyüşü düzenleme hakkına sahiptir (izin şartı yoktur, bildirim esastır). Dernekler Kanunu uyarınca dernek kurmak için en az **7 gerçek veya tüzel kişi** gerekir.",
      "**Mülkiyet Hakkı (m. 35) ve Hak Arama Hürriyeti (m. 36):** Mülkiyet ve miras hakları adında ekonomik çağrışım yapsa da Anayasa''da Sosyal Haklar içinde değil, **Kişinin Hakları (Negatif Statü)** bölümünde yer alır.",
      "**Suç ve Cezalara İlişkin Esaslar (m. 38):** Ceza sorumluluğu şahsidir; **genel müsadere cezası** ve ölüm cezası 2004 değişikliğiyle tamamen kaldırılmıştır. Kanuna aykırı olarak elde edilmiş bulgular (**hukuka aykırı deliller**) doğru bile olsa mahkemede **delil olarak kabul edilemez**. Kimse kendisini ve kanunda gösterilen yakınlarını suçlayan bir beyanda bulunmaya veya bu yolda delil göstermeye zorlanamaz."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Kişinin Hakları bölümünde dört ayrıntıyı sürekli ters sorar: 1. **Mülkiyet hakkı** sosyal-ekonomik haklarda değil, **Kişisel Haklar (Negatif Statü)** içindedir. 2. Arama ve el koymada gecikmesinde sakınca bulunan halde sözlü emir değil **yazılı emir** şarttır. 3. Yurt dışına çıkma yasağı vergi borcu gibi mali nedenlerle değil, 2010''dan beri yalnızca **suç soruşturması/kovuşturması** ve **hakim kararıyla** konulabilir. 4. Kanuna aykırı olarak elde edilmiş bulgular **delil olarak kabul edilemez** (m. 38, hukuka aykırı delil yasağı); bu yasak yalnızca ceza davasında değil tüm yargılamalarda geçerlidir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Dernek kurma ile toplantı ve gösteri yürüyüşü düzenleme hakkı için ortak anayasal kural nedir?\" Her ikisi de **önceden izin almaksızın** kullanılır; dernek kurmak için en az 7 kişi gerekirken toplantı ve gösteride yalnızca önceden bildirim usulü uygulanır."
  },
  {
    "type": "key_points",
    "items": [
      "Gözaltı/tutuklamada hakim önüne çıkarma süresi yol süresi hariç bireysel suçlarda **48 saat**, toplu suçlarda **4 gün**dür.",
      "Düzenli kentleşme ve kamu mallarını koruma yalnızca **yerleşme hürriyeti**ni sınırlar; yurt dışına çıkış yalnızca suç soruşturması/kovuşturmasında hakim kararıyla yasaklanabilir.",
      "Kanuna uygun basımevleri suç aleti sayılarak müsadere edilemez; genel müsadere tamamen yasaktır ve hukuka aykırı delil kullanılamaz.",
      "Mülkiyet hakkı kişisel haktır; dernek ve toplantı hakkı önceden izin alınmadan kullanılır (dernek en az 7 kişi)."
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
  'vatandaslik.temel_hak_ve_odevler.03',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  3,
  'Bölüm 3: Sosyal ve Ekonomik Haklar ve Ödevler (Pozitif Statü Hakları)',
  'Anayasa''nın İkinci Kısmının Üçüncü Bölümünde yer alan Sosyal ve Ekonomik Haklar ve Ödevler, sosyal devlet ilkesinin somut görünümüdür ve devletin bireye yönelik eğitim, sağlık, çalışma, sosyal güvenlik ve konut gibi alanlarda olumlu edimlerde bulunmasını gerektirir.  Ancak devletin bu alandaki ödevleri sınırsız bir mali yükümlülük doğurmaz; Anayasa m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın İkinci Kısmının Üçüncü Bölümünde yer alan **Sosyal ve Ekonomik Haklar ve Ödevler**, sosyal devlet ilkesinin somut görünümüdür ve devletin bireye yönelik eğitim, sağlık, çalışma, sosyal güvenlik ve konut gibi alanlarda olumlu edimlerde bulunmasını gerektirir. Ancak devletin bu alandaki ödevleri sınırsız bir mali yükümlülük doğurmaz; **Anayasa m. 65**''e göre Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek **mali kaynaklarının yeterliliği ölçüsünde** yerine getirir. Bu hüküm, sosyal hakların uygulanmasındaki anayasal mali sınırı oluşturur."
  },
  {
    "type": "heading",
    "text": "Eğitim, Kamulaştırma ve Devletleştirme"
  },
  {
    "type": "bullets",
    "items": [
      "**Eğitim ve Öğrenim Hakkı ve Ödevi (m. 42):** Kimse eğitim ve öğrenim hakkından yoksun bırakılamaz. **İlköğretim, kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.**",
      "**Kamulaştırma (İstimlak, m. 46):** Devlet ve kamu tüzel kişileri, kamu yararının gerektirdiği hallerde gerçek karşılıklarını **peşin ödemek şartıyla**, özel mülkiyette bulunan **taşınmaz malların** (arsa, tarla, bina gibi) tamamını veya bir kısmını kanunla gösterilen esas ve usullere göre kamulaştırabilir. Kural bedelin **nakit ve peşin** ödenmesidir; ancak tarım reformunun uygulanması, büyük enerji ve sulama projeleri ile iskan projelerinin gerçekleştirilmesi, yeni ormanların yetiştirilmesi, kıyıların korunması ve turizm amacıyla kamulaştırılan toprakların bedelleri, kanunun gösterdiği şekilde ve **5 yılı geçmemek üzere** eşit taksitlerle ödenebilir.",
      "**Devletleştirme ve Özelleştirme (m. 47):** Kamu hizmeti niteliği taşıyan **özel teşebbüs ve şirketlerin** kamu yararının zorunlu kıldığı hallerde gerçek karşılığı üzerinden kamu mülkiyetine geçirilmesine **devletleştirme** denir (kamulaştırma taşınmaz mal için, devletleştirme ise özel teşebbüs ve işletmeler içindir)."
    ]
  },
  {
    "type": "heading",
    "text": "Çalışma Hayatı, Sendika, Grev ve Çevre Hakkı"
  },
  {
    "type": "paragraph",
    "text": "Çalışma yaşamına ilişkin haklar da Anayasa''da sosyal ve ekonomik haklar içinde düzenlenmiştir. **Anayasa m. 51** uyarınca çalışanlar ve işverenler, **önceden izin almaksızın** sendikalar ve üst kuruluşlar kurma, bunlara serbestçe üye olma ve üyelikten çekilme hakkına sahiptir. **2010 anayasa değişikliği** ile birlikte \"aynı zamanda ve aynı işkolunda birden fazla sendikaya üye olunamaz\" yasağı Anayasa''dan çıkarılmış, böylece çalışanların birden çok sendikaya üye olabilmesinin önü açılmıştır."
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 53 ve 54**''te düzenlenen toplu iş sözleşmesi, grev ve lokavt hakları da yine **sosyal ve ekonomik haklar** grubundadır (siyasi hak değildir). Toplu iş sözleşmesinin yapılması sırasında uyuşmazlık çıkması halinde **işçiler grev hakkına**, **işveren ise lokavt hakkına** sahiptir. Bununla birlikte kamu görevlileri (memurlar) için çok önemli bir anayasal ayrım geçerlidir: **2010 anayasa değişikliği** ile memurlara ve diğer kamu görevlilerine **toplu sözleşme yapma hakkı** verilmiştir (uyuşmazlık çıkması halinde **Kamu Görevlileri Hakem Kurulu**na başvurulur ve kurulun kararı kesindir); ancak **memurların grev hakkı Anayasa''da hala tanınmamıştır** ve yasaktır!"
  },
  {
    "type": "paragraph",
    "text": "Sosyal haklar içinde ayrıca iki önemli başlık sıkça sorulur: **Anayasa m. 56**''da düzenlenen **sağlıklı ve dengeli bir çevrede yaşama hakkı** gereği çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek yalnızca Devletin değil, **hem Devletin hem de vatandaşların anayasal ödevidir**. **Anayasa m. 60**''ta yer alan **sosyal güvenlik hakkı** ise her vatandaşın devlet tarafından sağlanan sosyal güvenlik şemsiyesi altında korunmasını güvence altına alır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sosyal haklar bölümünde üç kritik farkı aklında tut: 1. **Kamulaştırma** özel taşınmaz mala, **devletleştirme** ise özel teşebbüse/şirkete yöneliktir; kamulaştırmada kural peşin ve nakit ödemedir (taksit istisnaidir ve en fazla 5 yıldır). 2. **Memurlar** 2010''dan beri **toplu sözleşme** yapabilirler, ancak memurların **grev hakkı kesinlikle yoktur**! 3. **Grev ve lokavt** hakkı siyasi değil, **sosyal ve ekonomik haklar** arasındadır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Devlet, Anayasa''da yer alan sosyal ve ekonomik ödevlerini hangi anayasal sınır ölçütüne göre yerine getirir?\" Cevap **Anayasa m. 65** uyarınca **mali kaynaklarının yeterliliği** ölçüsüdür; bu nedenle sosyal hakların kapsamı devletin bütçe imkanlarıyla orantılı olarak genişler."
  },
  {
    "type": "key_points",
    "items": [
      "Devlet sosyal ve ekonomik ödevlerini **mali kaynaklarının yeterliliği** ölçüsünde yerine getirir (m. 65).",
      "İlköğretim kız-erkek bütün vatandaşlar için zorunlu ve devlet okullarında parasızdır (m. 42).",
      "Kamulaştırma taşınmazlar içindir ve kural peşin ödemedir (istisnai büyük projelerde en fazla 5 yıl taksit); devletleştirme ise özel teşebbüsler içindir.",
      "2010 değişikliğiyle memurlara toplu sözleşme hakkı verildi ve çoklu sendika yasağı kalktı; ancak memurlara grev hakkı tanınmadı."
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
  'vatandaslik.temel_hak_ve_odevler.04',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  4,
  'Bölüm 4: Siyasi Haklar ve Ödevler (Aktif Statü Hakları)',
  'Anayasa''nın İkinci Kısmının Dördüncü Bölümünde yer alan Siyasi Haklar ve Ödevler, bireyin devlet yönetimine katılmasını sağlayan aktif statü haklarını ve devlete karşı temel vatandaşlık ödevlerini kapsar.  Bu bölümdeki süreler, yasaklar ve organ bağlantıları sınavların en yoğun soru alanıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın İkinci Kısmının Dördüncü Bölümünde yer alan **Siyasi Haklar ve Ödevler**, bireyin devlet yönetimine katılmasını sağlayan aktif statü haklarını ve devlete karşı temel vatandaşlık ödevlerini kapsar. Bu bölümdeki süreler, yasaklar ve organ bağlantıları sınavların en yoğun soru alanıdır."
  },
  {
    "type": "heading",
    "text": "Vatandaşlık ve Siyasi Partiler (Anayasa m. 66, 68, 69)"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 66** uyarınca Türk Devletine vatandaşlık bağı ile bağlı olan herkes Türktür. Türkiye''de çifte vatandaşlık serbesttir; yabancı bir devlet vatandaşlığını kazanan kişi doğrudan Türk vatandaşlığından çıkarılmaz. Vatandaşlıktan çıkarma cezası şahsidir (anne veya babanın çıkarılması eş ve çocukları etkilemez) ve **vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kapatılamaz**."
  },
  {
    "type": "paragraph",
    "text": "Siyasi partiler demokratik siyasi hayatın vazgeçilmez unsurlarıdır. Siyasi partiler **önceden izin almaksızın** en az **30 Türk vatandaşı** tarafından İçişleri Bakanlığı''na bildirimde bulunularak kurulur (TBMM''de siyasi parti grubu kurabilmek için ise en az **20 milletvekili** gerekir). Anayasa **m. 68**''e göre hakimler ve savcılar, Sayıştay dahil yüksek yargı organları mensupları, kamu kurum ve kuruluşlarının memur statüsündeki görevlileri, yaptıkları hizmet bakımından işçi niteliği taşımayan diğer kamu görevlileri, Silahlı Kuvvetler mensupları ile **yükseköğretim öncesi öğrenciler (lise ve dengi okul öğrencileri)** siyasi partilere **üye olamazlar**. Buna karşılık **yükseköğretim elemanları (üniversite öğretim üyeleri)** ve **üniversite öğrencileri** (kanunda belirtilen şartlar çerçevesinde) siyasi partilere üye olabilirler."
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 69**''a göre siyasi partilerin **mali denetimi (gelir ve giderlerinin kanuna uygunluğu)** Danıştay veya TBMM tarafından değil, Sayıştay''ın teknik yardımıyla doğrudan **Anayasa Mahkemesi** tarafından yapılır. Siyasi partilerin kapatılması davasını ise **Yargıtay Cumhuriyet Başsavcısı** açar ve kapatma kararını **Anayasa Mahkemesi** verir. Temelli kapatılan bir partinin kapatılmasına beyan veya eylemleriyle sebep olan kurucuları dahil üyeleri, AYM''nin gerekçeli kararının Resmi Gazete''de yayımından başlayarak **5 yıl** süreyle bir başka partinin kurucusu, üyesi, yöneticisi ve denetçisi olamazlar (ancak **bağımsız milletvekili adayı** olarak seçime girebilirler!)."
  },
  {
    "type": "heading",
    "text": "Vatandaşlık Ödevleri ve Kamu Denetçiliği (m. 72-74)"
  },
  {
    "type": "bullets",
    "items": [
      "**Vatan Hizmeti (m. 72):** Her Türkün **hem hakkı hem ödevi**dir; askerlik hizmeti Silahlı Kuvvetler''de veya kamu kesiminde yerine getirilebilir (Anayasa''da hem hak hem ödev olarak sayılan tek hizmettir).",
      "**Vergi Ödevi (m. 73):** Herkes kamu giderlerini karşılamak üzere **mali gücüne göre** vergi ödemekle yükümlüdür (vergi adaleti herkesin eşit TL ödemesi değil, ödeme gücüne göre artan oranlı vergilendirmedir; vergi, resim ve harçlar ancak kanunla konulur).",
      "**Mal Bildirimi (3628 sayılı Kanun):** Kamu görevlileri ve memurlar, görev süreleri boyunca **sonu 0 ve 5 ile biten yıllarda** (2020, 2025, 2030 gibi) en geç **Şubat ayı sonuna kadar** mal bildirimlerini yenilemek zorundadırlar.",
      "**Dilekçe, Bilgi Edinme ve Kamu Denetçiliği (m. 74):** Vatandaşlar ve **karşılıklılık (mütekabiliyet) esası gözetilmek kaydıyla Türkiye''de ikamet eden yabancılar**, dilekçelerini **Türkçe** yazmak şartıyla yetkili makamlara ve TBMM''ye başvurabilirler. Dilekçe Kanunu''na göre idari makamların dilekçeye cevap verme süresi en geç **30 gün**, Bilgi Edinme Hakkı Kanunu''na göre ise kural olarak **15 iş günü**dür. Aynı maddeyle kurulan **Kamu Denetçiliği Kurumu (Ombudsmanlık)** **TBMM Başkanlığı''na bağlıdır**; kurumun başı olan **Kamu Başdenetçisi**, Cumhurbaşkanı tarafından değil, **TBMM Genel Kurulu tarafından gizli oyla ve 4 turlu seçimle** 4 yıllığına seçilir."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Siyasi haklarda sıkça karıştırılan üç sayı ve makam vardır: 1. Dernek kurma **7 kişi**, siyasi parti kurma **30 vatandaş**, TBMM''de parti grubu kurma **20 milletvekili**dir. 2. **Devlet Denetleme Kurulu (DDK)** Cumhurbaşkanlığına bağlıdır; **Kamu Denetçiliği Kurumu** ise **TBMM Başkanlığı''na** bağlıdır. 3. Siyasi partilerin mali denetimini Sayıştay yardımıyla **Anayasa Mahkemesi** yapar (kararı Sayıştay değil AYM verir)."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türkiye''de yaşayan bir yabancı vatandaşın TBMM''ye dilekçe verebilmesi için gereken iki şart nedir?\" Cevap **karşılıklılık (mütekabiliyet)** ve dilekçenin **Türkçe** yazılmış olmasıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Vatandaşlıktan çıkarma şahsidir ve yargı yolu kapatılamaz; çifte vatandaşlık serbesttir.",
      "Lise öğrencileri ve memurlar partiye üye olamaz; üniversite hocaları ve öğrencileri üye olabilir.",
      "Parti kurma 30 vatandaş, parti grubu 20 vekil; parti mali denetimi AYM''ye aittir; siyaset yasağı 5 yıldır (bağımsız adaylık serbest).",
      "İdari dilekçe cevap süresi 30 gün, bilgi edinme 15 iş günüdür; Kamu Denetçiliği Kurumu TBMM Başkanlığına bağlıdır; memurlar sonu 0 ve 5 biten yıllarda Şubat sonuna kadar mal bildirimi verir."
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
  'vatandaslik.temel_hak_ve_odevler.05',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  5,
  'Bölüm 5: Hakların Korunması: AYM''ye Bireysel Başvuru ve AİHM',
  'Temel hak ve özgürlüklerin yalnızca anayasa metninde sayılması yeterli değildir; ihlal edilmeleri halinde bireyin başvurabileceği etkili ulusal ve uluslararası yargı yollarının da açık olması gerekir.  1982 Anayasası''nın 40.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Temel hak ve özgürlüklerin yalnızca anayasa metninde sayılması yeterli değildir; ihlal edilmeleri halinde bireyin başvurabileceği etkili ulusal ve uluslararası yargı yollarının da açık olması gerekir. 1982 Anayasası''nın 40. maddesi uyarınca anayasal hakları ihlal edilen herkesin yetkili makama geciktirilmeden başvurma hakkı vardır ve devlet, işlemlerinde ilgili kişilerin hangi kanun yolları ile mercilere hangi sürelerde başvurabileceğini göstermek zorundadır. Türkiye''de hak arama yollarının en üst halkalarını **Anayasa Mahkemesi''ne bireysel başvuru** ve **Avrupa İnsan Hakları Mahkemesi (AİHM)** başvurusu oluşturur."
  },
  {
    "type": "heading",
    "text": "Anayasa Mahkemesi''ne Bireysel Başvuru (m. 148)"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa Mahkemesi''ne bireysel başvuru (anayasa şikayeti)** hakkı, **2010 anayasa referandumu** ile kabul edilerek 23 Eylül 2012''den itibaren uygulanmaya başlanmıştır. **Anayasa m. 148/3** uyarınca herkes, Anayasada güvence altına alınmış temel hak ve özgürlüklerinden **Avrupa İnsan Hakları Sözleşmesi (AİHS) kapsamındaki herhangi birinin** kamu gücü tarafından ihlal edildiği iddiasıyla Anayasa Mahkemesi''ne başvurabilir."
  },
  {
    "type": "paragraph",
    "text": "Bireysel başvurunun kabul edilebilmesi için şu şartların birlikte sağlanması zorunludur:"
  },
  {
    "type": "bullets",
    "items": [
      "**Çifte Koruma (Ortak Koruma Alanı):** İhlal edildiği iddia edilen hak, hem **1982 Anayasası**nda hem de **AİHS ve Türkiye''nin taraf olduğu ek protokollerde** güvence altına alınmış olmalıdır. Yalnızca Anayasa''da olup AİHS''te olmayan (veya yalnızca AİHS''te olup Anayasa''da olmayan) bir hak için AYM''ye bireysel başvuru yapılamaz.",
      "**İç Hukuk Yollarının Tüketilmesi:** Başvuruda bulunabilmek için olağan kanun yollarının (ilk derece mahkemesi, istinaf ve temyiz gibi tüm **iç hukuk yollarının**) tüketilmiş olması zorunlu dava şartıdır.",
      "**Başvuru Süresi:** 6216 sayılı Kanun m. 47/5 uyarınca bireysel başvuru, başvuru yollarının tüketildiği tarihten (başvuru yolu öngörülmemişse ihlalin öğrenildiği tarihten) itibaren **30 gün** içinde yapılmalıdır."
    ]
  },
  {
    "type": "paragraph",
    "text": "Yasama işlemleri (kanunlar) ile düzenleyici idari işlemler aleyhine doğrudan bireysel başvuru yapılamaz; ayrıca Anayasa''nın yargı denetimi dışında bıraktığı işlemler (örneğin **YSK kararları** veya **OHAL CBK''ları**) bireysel başvuruya konu edilemez. AYM incelemesi sonucunda hak ihlali tespit ederse ihlalin ve sonuçlarının ortadan kaldırılması için yeniden yargılama yapılmasına veya tazminata hükmedebilir; ancak idari eylem veya işlem niteliğinde karar veremez ve yerindelik denetimi yapamaz."
  },
  {
    "type": "heading",
    "text": "Avrupa İnsan Hakları Mahkemesi (AİHM) Başvurusu"
  },
  {
    "type": "paragraph",
    "text": "Ulusal düzeydeki tüm iç hukuk yolları (AYM''ye bireysel başvuru yolu dahil) tüketildikten sonra hakkının hala ihlal edildiğini düşünen birey, Strasbourg''da bulunan **Avrupa İnsan Hakları Mahkemesi (AİHM)**ne başvurabilir. Türkiye 1987 yılında AİHM''e bireysel başvuru hakkını, 1990 yılında ise mahkemenin zorunlu yargı yetkisini kabul etmiştir."
  },
  {
    "type": "paragraph",
    "text": "Başvuru süreleri konusunda güncel değişikliğe özellikle dikkat etmelisin: Eski düzenlemede AİHM''e başvuru süresi 6 ay iken, Avrupa İnsan Hakları Sözleşmesi''ne ek **15 No''lu Protokol**ün yürürlüğe girmesiyle birlikte kesinleşmiş nihai iç hukuk kararının tebliğinden itibaren **güncel AİHM başvuru süresi 4 ay**a indirilmiştir."
  },
  {
    "type": "table",
    "headers": [
      "Başvuru Merci",
      "Kabul / Güncellenme",
      "Başvuru Süresi",
      "Temel Dava Şartı"
    ],
    "rows": [
      [
        "AYM Bireysel Başvuru",
        "2010 Anayasa Değişikliği",
        "**30 gün**",
        "Olağan iç hukuk yollarının tüketilmesi + AİHS ortak alanı"
      ],
      [
        "AYM Norm Denetimi (İptal)",
        "1961 Anayasası",
        "**60 gün** (anayasa değ. şekil **10 gün**)",
        "Soyut veya somut norm denetimi"
      ],
      [
        "AİHM Bireysel Başvuru",
        "15 No''lu Protokol ile güncel",
        "**4 ay** (eski 6 ay)",
        "AYM bireysel başvurusu dahil tüm iç hukuk yollarının tüketilmesi"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Süre ve kapsam konusunda iki klasik tuzağa düşme: 1. AYM''de **norm denetimi iptal davası** açma süresi **60 gün**, vatandaşın **bireysel başvuru** süresi **30 gün**, AİHM''e güncel başvuru süresi ise **4 ay**dır! 2. Bireysel başvuru için \"yalnızca Anayasa''da yazması\" yetmez; hakkın hem Anayasa''da hem AİHS''te yer alması (**çifte koruma**) şarttır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Kesinleşmiş mahkeme kararının öğrenilmesinden sonra AYM''ye bireysel başvuru süresi ile tüm iç hukuk yolları tüketildikten sonra AİHM''e başvuru süresi sırasıyla nedir?\" Cevap: AYM için **30 gün**, AİHM için **4 ay**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Bireysel başvuru 2010 anayasa referandumuyla gelmiştir; olağan iç hukuk yollarının tüketilmesi zorunludur.",
      "Bireysel başvuruda **çifte koruma** aranır: hak hem Anayasa''da hem AİHS''te yer almalıdır.",
      "AYM bireysel başvuru süresi **30 gün**, norm denetimi iptal davası süresi **60 gün**dür.",
      "15 No''lu Protokol sonrası güncel AİHM başvuru süresi **4 ay**dır (eski 6 ay kuralı değişmiştir)."
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
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · Yasama, Yürütme ve Yargı
-- Kaynak: docs/konu_anlatimi/vatandaslik/04_yasama_yurutme_ve_yargi.md
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
  'vatandaslik.yasama_yurutme_ve_yargi.01',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  1,
  'Bölüm 1: Yasama Organı: TBMM''nin Yapısı, Üyeliği ve Dokunulmazlıklar',
  '1982 Anayasası''nın 7.  maddesi uyarınca yasama yetkisi Türk Milleti adına Türkiye Büyük Millet Meclisi''nindir ve bu yetki devredilemez.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın 7. maddesi uyarınca yasama yetkisi Türk Milleti adına Türkiye Büyük Millet Meclisi''nindir ve bu yetki devredilemez. **Anayasa m. 75**''in 2017 anayasa değişikliği ile yenilenmiş hali gereğince TBMM genel oyla seçilen **600 milletvekilinden** oluşur (eski üye sayısı 550 idi) ve milletvekili seçilme yaşı **18**''dir. Meclis''te alınacak tüm toplantı ve karar yeter sayıları bu güncel **600 milletvekili** üzerinden hesaplanır. Milletvekili seçilmek için aday olan kamu görevlilerinden yalnızca **hakim ve savcılar** ile **yüksek yargı organları mensupları ve Silahlı Kuvvetler mensupları (askerler)** seçilemedikleri takdirde eski görevlerine geri dönemezler; çünkü yargı bağımsızlığı ve ordunun siyasetten uzak tutulması ilkesi bu kişilerin siyasete atıldıktan sonra tarafsız konumlarına dönmesine izin vermez. Diğer devlet memurları ise seçilemezlerse eski görevlerine dönebilirler."
  },
  {
    "type": "heading",
    "text": "Milletvekilliğinin Düşmesi ve Kendiliğinden Sona Ermesi"
  },
  {
    "type": "paragraph",
    "text": "Milletvekilleri seçildikleri bölgeyi veya kendilerini seçenleri değil, bütün milleti temsil ederler (milletin temsili ilkesi). Bu nedenle seçmenler milletvekillerine emir veremez ve görev süresi dolmadan vekili geri çağıramaz (emredici vekalet yasağı). Milletvekilliğinin sona erme biçimleri ise sebebine göre farklı hukuki sonuçlar doğurur:"
  },
  {
    "type": "bullets",
    "items": [
      "**Partiden İstifa veya İhraç:** Bir milletvekilinin partisinden istifa etmesi veya ihraç edilmesi milletvekilliğini **düşürmez**; vekil görevine bağımsız olarak devam eder.",
      "**Cumhurbaşkanı Yardımcısı veya Bakan Atanması (m. 106):** 2017 reformuyla getirilen sert kuvvetler ayrılığı gereği, TBMM üyesi olan bir kişi Cumhurbaşkanı yardımcısı veya bakan olarak atandığı anda milletvekilliği **meclis oylamasına gerek kalmaksızın kendiliğinden sona erer**.",
      "**Meclis Kararıyla Düşme (m. 84):** İstifa (Meclis Genel Kurulunca kabulüyle), milletvekilliğiyle bağdaşmayan bir görev veya hizmeti sürdürmekte ısrar etme ya da Meclis çalışmalarına **1 ay içinde izinsiz ve özürsüz toplam 5 birleşim günü** katılmama hallerinde TBMM Genel Kurulu kararıyla vekillik düşer. Kesin hüküm giyme veya kısıtlanma hallerinde ise mahkeme kararının Genel Kurul''a bildirilmesiyle vekillik düşer."
    ]
  },
  {
    "type": "heading",
    "text": "Yasama Sorumsuzluğu ve Yasama Dokunulmazlığı (m. 83)"
  },
  {
    "type": "paragraph",
    "text": "Milletvekillerinin yasama görevlerini yürütme organının ve yargısal baskıların etkisinde kalmadan özgürce yerine getirebilmeleri için Anayasa iki farklı güvence tanımıştır; bu iki güvence hem kapsam hem de kaldırılabilirlik bakımından birbirinden tamamen ayrılır:"
  },
  {
    "type": "table",
    "headers": [
      "Özellik",
      "Yasama Sorumsuzluğu (Kürsü Dokunulmazlığı)",
      "Yasama Dokunulmazlığı"
    ],
    "rows": [
      [
        "Kapsamı",
        "Meclis çalışmalarındaki oy, söz ve düşünceler",
        "Seçimden önce veya sonra suç işlediği ileri sürülen vekil"
      ],
      [
        "Niteliği",
        "**Mutlaktır**; milletvekilliği bitse de devam eder",
        "**Nisbidir**; yalnızca vekillik süresince korur"
      ],
      [
        "Kaldırılması",
        "**Asla kaldırılamaz**",
        "TBMM Genel Kurulu kararıyla **kaldırılabilir**"
      ],
      [
        "İstisnası",
        "Anayasa dışı istisna yoktur (meclis içi disiplin hariç)",
        "Ağır cezayı gerektiren **suçüstü** hali ve Anayasa m. 14 kapsamındaki haller"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 85** uyarınca yasama dokunulmazlığının kaldırılmasına veya milletvekilliğinin (istifa, devamsızlık, bağdaşmayan görev nedeniyle) düşürülmesine Meclisçe karar verilmesi halinde, karar tarihinden itibaren **7 gün** içinde ilgili milletvekili veya bir başka milletvekili Anayasa Mahkemesi''ne iptal başvurusunda bulunabilir. Anayasa Mahkemesi ise bu iptal istemini **15 gün** içinde kesin olarak karara bağlar (**7–15 gün kuralı**). Meclis''in seçimleri yenileme kararı alması veya görev süresinin dolması halinde yeni TBMM göreve başlayıncaya kadar mevcut Meclis''in ve milletvekillerinin yasama sıfatı devam eder."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM dokunulmazlık ve vekillik düşmesi sorularında üç ayrıntıyı sürekli test eder: 1. **Yasama sorumsuzluğu** asla kaldırılamaz ve vekillik bittikten sonra da sürer; **yasama dokunulmazlığı** ise TBMM kararıyla kaldırılabilir. 2. Milletvekili adayı olup seçilemediğinde eski görevine **geri dönemeyen** iki zümre **hakim-savcılar** ve **askerler**dir; memurlar geri dönebilir. 3. Bakan veya Cumhurbaşkanı yardımcısı atanan milletvekilinin vekilliği oylamasız **kendiliğinden** sona erer."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Dokunulmazlığı TBMM tarafından kaldırılan bir milletvekili kaç gün içinde hangi mahkemeye başvurabilir ve mahkeme kaç gün içinde karar verir?\" Cevap: **7 gün** içinde **Anayasa Mahkemesi**ne başvurulur; AYM **15 gün** içinde kesin karar verir."
  },
  {
    "type": "key_points",
    "items": [
      "TBMM üye tamsayısı **600**, milletvekili seçilme yaşı **18**''dir; hakim-savcılar ve askerler aday olup seçilemezlerse görevlerine dönemez.",
      "Partiden istifa vekilliği düşürmez; ancak Cumhurbaşkanı yardımcısı veya bakan atanan kişinin milletvekilliği kendiliğinden sona erer.",
      "Yasama sorumsuzluğu mutlak olup kaldırılamaz; yasama dokunulmazlığı ise kaldırılabilir.",
      "Dokunulmazlık kaldırılması veya vekilliğin düşmesine karşı **7 gün** içinde AYM''ye başvurulur, AYM **15 gün** içinde karar verir."
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
  'vatandaslik.yasama_yurutme_ve_yargi.02',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  2,
  'Bölüm 2: TBMM''nin Çalışma Düzeni, Kanun Yapımı ve Bütçe',
  'TBMM''nin yasama görevini düzenli yürütebilmesi için başkanlık seçimi, tatil süreleri ve oylama nisapları Anayasa''da açık sayılara bağlanmıştır.  Anayasa m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "TBMM''nin yasama görevini düzenli yürütebilmesi için başkanlık seçimi, tatil süreleri ve oylama nisapları Anayasa''da açık sayılara bağlanmıştır. **Anayasa m. 94** uyarınca TBMM Başkanı seçimi gizli oyla yapılır ve en çok **4 turda** tamamlanır: birinci ve ikinci turlarda üye tamsayısının 2/3''ü (**400 milletvekili**), üçüncü turda üye tamsayısının salt çoğunluğu (**301 milletvekili**) aranır; üçüncü turda da salt çoğunluk sağlanamazsa dördüncü tura üçüncü turda en çok oy alan iki aday katılır ve **en çok oyu alan** aday TBMM Başkanı seçilir. TBMM Başkanlık Divanı seçimleri bir yasama döneminde iki kez yapılır (ilk seçilenler 2 yıl, ikinci devre seçilenler yasama döneminin sonuna kadar görev yapar)."
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 93**''e göre TBMM her yıl Ekim ayının ilk günü kendiliğinden toplanır ve bir yasama yılında **en çok 3 ay tatil** yapabilir (ara verme ise 15 günü geçemez). Tatil veya ara verme sırasında Meclis''i doğrudan **Cumhurbaşkanı** veya **TBMM Başkanı** toplantıya çağırabilir; ayrıca TBMM Başkanı, **üyelerin 1/5''inin (120 milletvekilinin)** yazılı istemi üzerine de Meclis''i toplantıya çağırmak zorundadır. **Anayasa m. 96** uyarınca TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az 1/3''ü (**200 milletvekili**) ile toplanır (**toplantı yeter sayısı**) ve Anayasa''da başkaca hüküm yoksa toplantıya katılanların salt çoğunluğu ile karar verir; ancak **karar yeter sayısı hiçbir şekilde üye tamsayısının 1/4''ünün 1 fazlasından (151 milletvekili) az olamaz**."
  },
  {
    "type": "heading",
    "text": "Kanunların Kabulü, Veto, Af ve Bütçe (m. 87, 89, 161)"
  },
  {
    "type": "paragraph",
    "text": "2017 anayasa değişikliği ile hükümetin **kanun tasarısı** verme yetkisi kaldırıldığı için normal kanunları yalnızca milletvekilleri **kanun teklifi** şeklinde sunabilir (yürütmenin teklif edebildiği tek kanun **Bütçe Kanunu**dur). TBMM tarafından kabul edilen kanunları Cumhurbaşkanı **15 gün** içinde yayımlar veya bir daha görüşülmek üzere gerekçesiyle Meclis''e geri gönderir. **Anayasa m. 89** uyarınca Cumhurbaşkanı **Bütçe Kanunu''nu geri gönderemez (veto edemez)**. 2017 değişikliği ile veto aşılma şartı da zorlaştırılmıştır: Cumhurbaşkanı''nın geri gönderdiği kanunu Meclis''in değiştirmeden aynen kabul edebilmesi için artık basit çoğunluk yetmez, **üye tamsayısının salt çoğunluğu (en az 301 milletvekili)** şarttır."
  },
  {
    "type": "bullets",
    "items": [
      "**Genel ve Özel Af İlanı (m. 87):** TBMM üye tamsayısının **en az 3/5''inin (360 milletvekili)** kararı gerekir. Ancak **Anayasa m. 169** uyarınca **orman suçları** için genel ve özel af çıkarılamaz.",
      "**Bütçe Kanun Teklifi (m. 161):** Yürütmenin başı olan **Cumhurbaşkanı** tarafından hazırlanır ve mali yılbaşından en az **75 gün** önce TBMM''ye sunulur.",
      "**TBMM''nin Bilgi Edinme ve Denetim Yolları:** 2017 değişikliği ile gensoru ve sözlü soru kaldırılmıştır; yürürlükte kalan dört yol **yazılı soru** (en geç 15 gün içinde cevaplanır), **meclis araştırması**, **genel görüşme** ve **meclis soruşturması**dır. Cumhurbaşkanı yardımcıları ve bakanlar ile Cumhurbaşkanı hakkında görevle ilgili suç iddiasıyla **meclis soruşturması** açılabilmesi için teklif üye tamsayısının salt çoğunluğu (**301 vekil**), soruşturma açılması kararı **3/5 (360 vekil)** gizli oyu ve **Yüce Divan''a sevk** kararı ise **2/3 (400 vekil)** gizli oyu ile alınır."
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "TBMM''deki temel çoğunluk sayılarını 600 vekil üzerinden **2-3-36-4** kuralıyla hatırla: - **1/3 (200):** Toplantı yeter sayısı ve Anayasa değişikliği teklifi - **Salt çoğunluk (301):** Veto edilen kanunu aynen kabul, 3. tur Meclis Başkanı ve soruşturma teklifi - **3/5 (360):** Genel/özel af, seçimlerin TBMM''ce yenilenmesi, soruşturma açılması ve anayasa değişikliği kabul alt sınırı - **2/3 (400):** Yüce Divan''a sevk, 1-2. tur Meclis Başkanı ve referandumsuz anayasa değişikliği onayı"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM kanun yapımı ve denetimde iki noktayı tuzak yapar: 1. Cumhurbaşkanı''nın geri gönderdiği kanunu TBMM''nin aynen kabul edebilmesi için 2017''den beri **en az 301 oy** gerekir (toplantıya katılanların çoğunluğu yetmez). 2. Normal kanunları yürütme teklif edemez; Cumhurbaşkanı''nın teklif edebildiği tek kanun **Bütçe Kanunu**dur ve Cumhurbaşkanı Bütçe Kanunu''nu **veto edemez**."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Meclis soruşturması sürecinde Yüce Divan''a sevk için gereken oy sayısı kaçtır?\" Teklif **301**, soruşturma açılması kararı **360**, Yüce Divan''a sevk ise **400** milletvekilinin gizli oyuyla gerçekleşir."
  },
  {
    "type": "key_points",
    "items": [
      "TBMM Başkanı en çok 4 turda seçilir (400 - 400 - 301 - en çok oy); tatil yılda en çok 3 aydır.",
      "Toplantı yeter sayısı **200**, en az karar yeter sayısı **151**dir; veto edilen kanunu aynen kabul için **301** oy gerekir.",
      "Genel/özel af için **360** oy gerekir ve orman suçlarına af çıkarılamaz; Bütçe Kanunu''nu Cumhurbaşkanı 75 gün önce sunar ve veto edemez.",
      "Meclis denetim yolları yazılı soru, meclis araştırması, genel görüşme ve meclis soruşturmasıdır (gensoru ve sözlü soru yoktur)."
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
  'vatandaslik.yasama_yurutme_ve_yargi.03',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  3,
  'Bölüm 3: Yürütme Organı: Cumhurbaşkanı, Yardımcıları ve Bakanlar',
  '2017 anayasa değişikliği sonrasında yürütme yetkisi ve görevi tek başına Cumhurbaşkanı tarafından Anayasa''ya ve kanunlara uygun olarak kullanılır ve yerine getirilir.  Cumhurbaşkanı devletin başıdır; bu sıfatla Türkiye Cumhuriyeti''ni ve Türk Milletinin birliğini temsil eder; Anayasanın uygulanmasını, devlet organlarının düzenli ve uyumlu çalışmasını temin eder.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "2017 anayasa değişikliği sonrasında yürütme yetkisi ve görevi tek başına **Cumhurbaşkanı** tarafından Anayasa''ya ve kanunlara uygun olarak kullanılır ve yerine getirilir. Cumhurbaşkanı devletin başıdır; bu sıfatla Türkiye Cumhuriyeti''ni ve Türk Milletinin birliğini temsil eder; Anayasanın uygulanmasını, devlet organlarının düzenli ve uyumlu çalışmasını temin eder. **Anayasa m. 101** uyarınca Cumhurbaşkanı; **40 yaşını doldurmuş**, **yükseköğrenim yapmış**, milletvekili seçilme yeterliliğine sahip Türk vatandaşları arasından, doğrudan **halk tarafından 5 yıl için** seçilir. Genel oyla yapılacak seçimde geçerli oyların salt çoğunluğunu alan aday seçilmiş olur; ilk oylamada bu çoğunluk sağlanamazsa ikinci pazar günü en çok oy alan iki aday arasında ikinci oylama yapılır."
  },
  {
    "type": "heading",
    "text": "Cumhurbaşkanı Adaylığı, Seçim Yenileme ve Vekalet"
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 101**''e göre Cumhurbaşkanlığına üç yoldan aday gösterilebilir: 1. **Siyasi parti grupları** (TBMM''de en az 20 milletvekiline sahip gruplar), 2. En son yapılan milletvekili genel seçimlerinde toplam geçerli oyların tek başına veya birlikte **en az %5''ini** almış olan siyasi partiler, 3. En az **100.000 seçmenin** yazılı teklifiyle gösterilen adaylar."
  },
  {
    "type": "paragraph",
    "text": "Bir kimse **en fazla iki defa** Cumhurbaşkanı seçilebilir. Ancak **Anayasa m. 116/3** bunun tek anayasal istisnasını düzenlemiştir: **Cumhurbaşkanının ikinci döneminde Meclis tarafından (üye tamsayısının 3/5''i yani 360 milletvekili ile) seçimlerin yenilenmesine karar verilmesi halinde, Cumhurbaşkanı bir defa daha (üçüncü kez) aday olabilir**. Dikkat et: Cumhurbaşkanı kendisi seçim yenileme kararı alırsa üçüncü kez aday olamaz; ayrıca TBMM veya Cumhurbaşkanı tarafından seçimlerin yenilenmesine karar verildiğinde her iki seçim de birlikte yenilenir!"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 106** uyarınca Cumhurbaşkanlığı makamının herhangi bir nedenle boşalması halinde yenisi seçilinceye kadar Cumhurbaşkanlığına **Cumhurbaşkanı Yardımcısı** vekalet eder ve Cumhurbaşkanına ait yetkileri kullanır (2017 değişikliğinden önce TBMM Başkanı vekalet ediyordu). Seçim takvimi ise kalan süreye göre ikiye ayrılır:"
  },
  {
    "type": "bullets",
    "items": [
      "Genel seçime **1 yıldan fazla** süre kalmışsa boşalmadan itibaren **45 gün** içinde **yalnızca Cumhurbaşkanı seçimi** yapılır (seçilen Cumhurbaşkanı kalan süreyi tamamlar ve bu dönem görev süresinden sayılmaz).",
      "Genel seçime **1 yıl veya daha az** süre kalmışsa boşalmadan itibaren yine **45 gün** içinde **TBMM seçimi ile Cumhurbaşkanlığı seçimi birlikte** yenilenir."
    ]
  },
  {
    "type": "heading",
    "text": "Bakanlıklar ve Cumhurbaşkanlığı Kararnamesi (m. 104, 106)"
  },
  {
    "type": "paragraph",
    "text": "Cumhurbaşkanı, Cumhurbaşkanı yardımcıları ve bakanları milletvekili seçilme yeterliliğine sahip olanlar arasından atar ve görevden alır; atanan kişiler TBMM önünde ant içerek göreve başlar ve yalnızca Cumhurbaşkanı''na karşı sorumludur. **Anayasa m. 106/son** açık hükmü gereği **bakanlıkların kurulması, kaldırılması, görevleri ve yetkileri, teşkilat yapısı ile merkez ve taşra teşkilatlarının kurulması kanunla değil, Cumhurbaşkanlığı Kararnamesi (CBK) ile düzenlenir**. **Anayasa m. 104** uyarınca Cumhurbaşkanı yürütme yetkisine ilişkin konularda CBK çıkarabilir; ancak Anayasa''nın ikinci kısmının birinci ve ikinci bölümlerinde yer alan temel haklar, kişi hakları ve ödevleriyle dördüncü bölümde yer alan siyasi haklar ve ödevler CBK ile düzenlenemez. Ayrıca CBK ile kanunlarda farklı hükümler bulunması halinde **kanun hükümleri uygulanır**; TBMM''nin aynı konuda kanun çıkarması durumunda CBK hükümsüz hale gelir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Cumhurbaşkanlığı konusunda üç kritik farkı birbirine karıştırma: 1. Adaylık için parti oy oranı barajı **%5**tir (TBMM seçim barajı %7, Hazine yardımı barajı %3''tür). 2. Cumhurbaşkanına hastalık, yurt dışına çıkma veya makamın boşalması hallerinde TBMM Başkanı değil **Cumhurbaşkanı Yardımcısı** vekalet eder. 3. Bakanlıklar 2017''den beri kanunla değil **Cumhurbaşkanlığı Kararnamesi** ile kurulur ve kaldırılır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Genel seçimlere 1 yıl 8 ay kala Cumhurbaşkanlığı makamı boşalırsa nasıl bir seçim yapılır?\" 1 yıldan fazla süre kaldığı için **45 gün** içinde **yalnızca Cumhurbaşkanı seçimi** yapılır ve seçilen kişi kalan süreyi tamamlar."
  },
  {
    "type": "key_points",
    "items": [
      "Cumhurbaşkanı 40 yaşını doldurmuş, yükseköğrenimli Türk vatandaşları arasından halkça 5 yıl için seçilir; adaylık için parti grubu, %5 oy veya 100.000 imza gerekir.",
      "İkinci döneminde TBMM''nin 360 oyla seçimleri yenilemesi halinde Cumhurbaşkanı 3. kez aday olabilir (m. 116/3).",
      "Makam boşaldığında Cumhurbaşkanı Yardımcısı vekalet eder; 1 yıldan çok varsa 45 günde sadece CB seçimi, 1 yıl veya az varsa yine 45 günde ikisi birlikte yenilenir.",
      "Bakanlıklar CBK ile kurulur ve kaldırılır; kanunla CBK çatışırsa kanun hükümleri uygulanır."
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
  'vatandaslik.yasama_yurutme_ve_yargi.04',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  4,
  'Bölüm 4: Olağanüstü Hal (OHAL), MGK ve DDK (m. 108, 118, 119)',
  'Yürütme organının olağanüstü kriz durumlarındaki yetkileri, milli güvenlik danışma mekanizması ve idari denetim aracı Anayasa''da özel olarak düzenlenmiştir.  2017 değişikliği ile sıkıyönetim tamamen kaldırıldığı için tek olağanüstü yönetim usulü Olağanüstü Hal (OHAL)dir; böylece olağanüstü dönemlerde askeri makamların sivil yönetimi devralması uygulamasına son verilerek sivil yürütme otoritesi ve Meclis denetimi esas alınmıştır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Yürütme organının olağanüstü kriz durumlarındaki yetkileri, milli güvenlik danışma mekanizması ve idari denetim aracı Anayasa''da özel olarak düzenlenmiştir. 2017 değişikliği ile **sıkıyönetim** tamamen kaldırıldığı için tek olağanüstü yönetim usulü **Olağanüstü Hal (OHAL)**dir; böylece olağanüstü dönemlerde askeri makamların sivil yönetimi devralması uygulamasına son verilerek sivil yürütme otoritesi ve Meclis denetimi esas alınmıştır."
  },
  {
    "type": "heading",
    "text": "Olağanüstü Hal Yönetimi (Anayasa m. 119)"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 119** uyarınca **Cumhurbaşkanı**; savaş, savaşı gerektirecek bir durumun başgöstermesi, seferberlik, ayaklanma, vatan veya Cumhuriyete karşı kuvvetli ve eylemli bir kalkışma, ülkenin ve milletin bölünmezliğini içten veya dıştan tehlikeye düşüren şiddet hareketlerinin yaygınlaşması, anayasal düzeni veya temel hak ve hürriyetleri ortadan kaldırmaya yönelik yaygın şiddet hareketlerinin ortaya çıkması, şiddet olayları nedeniyle kamu düzeninin ciddi şekilde bozulması, **tabii afet veya tehlikeli salgın hastalık** ya da **ağır ekonomik bunalım** hallerinde yurdun tamamında veya bir bölgesinde **süresi 6 ayı geçmemek üzere** olağanüstü hal ilan edebilir."
  },
  {
    "type": "paragraph",
    "text": "OHAL ilan kararı verildiği gün Resmi Gazete''de yayımlanır ve aynı gün **TBMM''nin onayına** sunulur. TBMM tatilde ise derhal toplantıya çağrılır. **TBMM, gerekli gördüğü takdirde OHAL süresini kısaltabilir, uzatabilir veya olağanüstü hali kaldırabilir.** Cumhurbaşkanı''nın istemiyle TBMM **her defasında 4 ayı geçmemek üzere** OHAL süresini uzatabilir; ancak savaş hallerinde bu 4 aylık sınır aranmaz. Olağanüstü hallerde vatandaşlar için getirilecek para, mal ve çalışma yükümlülükleri ile temel hakların nasıl sınırlandırılacağı ve durdurulacağı kanunla düzenlenir. Cumhurbaşkanı''nın OHAL''in gerekli kıldığı konularda çıkardığı **OHAL Cumhurbaşkanlığı Kararnameleri** ise Resmi Gazete''de yayımlanır ve aynı gün Meclis onayına sunulur (savaş ve mücbir sebepler dışında 3 ay içinde TBMM''de görüşülüp karara bağlanmayan OHAL CBK''ları kendiliğinden yürürlükten kalkar). Bu üç aylık süre, yürütmenin olağanüstü yetkilerinin TBMM denetimi dışında kalıcılaşmasını önlemek için konulmuştur."
  },
  {
    "type": "heading",
    "text": "Milli Güvenlik Kurulu (m. 118) ve Devlet Denetleme Kurulu (m. 108)"
  },
  {
    "type": "bullets",
    "items": [
      "**Milli Güvenlik Kurulu (MGK, m. 118):** Devletin milli güvenlik siyasetinin tayini, tespiti ve uygulanması ile ilgili alınan tavsiye kararlarını ve gerekli koordinasyonun sağlanması konusundaki görüşlerini Cumhurbaşkanı''na bildirir. Kurul **iki ayda bir** toplanır; kararları icrai değil **tavsiye niteliğindedir**. Gündemi, Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanının önerileri dikkate alınarak **Cumhurbaşkanı** belirler; Cumhurbaşkanının katılamadığı zamanlarda toplantıya **Cumhurbaşkanı Yardımcısı** başkanlık eder. **MGK Üyeleri** şunlardır: Cumhurbaşkanı (Başkan), Cumhurbaşkanı Yardımcıları, Adalet, Milli Savunma, İçişleri ve Dışişleri Bakanları, Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanları.",
      "**Devlet Denetleme Kurulu (DDK, m. 108):** İdarenin hukuka uygunluğunun, düzenli ve verimli şekilde yürütülmesinin ve geliştirilmesinin sağlanması amacıyla **Cumhurbaşkanlığına bağlı** olarak kurulmuştur. Cumhurbaşkanının isteği üzerine tüm kamu kurum ve kuruluşlarında, sermayesinin yarısından fazlasına bu kurumların katıldığı kuruluşlarda, kamu kurumu niteliğindeki meslek kuruluşlarında, işçi-işveren meslek kuruluşlarında ve kamuya yararlı derneklerle vakıflarda her türlü inceleme, araştırma, denetleme ve **idari soruşturma** yapar. 2017 değişikliği ile **Türk Silahlı Kuvvetleri (TSK) de DDK denetimine dahil edilmiştir**; Anayasa m. 108 açık hükmü gereği **yargı organları, Devlet Denetleme Kurulunun görev alanı dışındadır**. Kurulun başkan ve üyeleri Cumhurbaşkanı tarafından atanır ve doğrudan Cumhurbaşkanı''na rapor sunar."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "MGK ve DDK sorularında ÖSYM''nin değişmez üç tuzağı vardır: 1. OHAL ilanını Cumhurbaşkanı **en çok 6 ay** için yapar; uzatmayı ise TBMM **her defasında en çok 4 ay** için yapar (6 ay ile 4 ayı ters verme!). 2. **TBMM Başkanı** ve **Jandarma Genel Komutanı** MGK üyesi **değildir**! 3. 2017 değişikliğinden sonra TSK da DDK tarafından denetlenebilir hale gelmiştir; DDK''nın denetleyemediği **tek alan yargı organlarıdır**."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Devlet Denetleme Kurulu aşağıdakilerden hangisini denetleyemez?\" Seçeneklerde TSK, KİT''ler, barolar/odalar ve vakıflar yer alır; doğru yanıt **yargı organları (mahkemeler)**dır. Ayrıca 2017 değişikliği ile DDK''ya yalnızca inceleme değil, doğrudan **idari soruşturma** yapma yetkisi de tanınmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "OHAL ilanı Cumhurbaşkanınca **en çok 6 ay** için yapılır; TBMM''ce **her defasında en çok 4 ay** uzatılabilir (savaşta 4 ay sınırı yoktur).",
      "MGK iki ayda bir toplanır ve kararları tavsiye niteliğindedir; TBMM Başkanı ve Jandarma Genel Komutanı MGK üyesi değildir.",
      "DDK Cumhurbaşkanlığına bağlıdır; 2017''den beri TSK''yı ve idari soruşturmaları kapsar, yalnızca **yargı organlarını** denetleyemez."
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
  'vatandaslik.yasama_yurutme_ve_yargi.05',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  5,
  'Bölüm 5: Yargı Organı: Yüksek Mahkemeler, AYM ve HSK',
  '1982 Anayasası''nın 9.  maddesi uyarınca yargı yetkisi Türk Milleti adına bağımsız ve tarafsız mahkemelerce kullanılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın 9. maddesi uyarınca yargı yetkisi Türk Milleti adına bağımsız ve tarafsız mahkemelerce kullanılır. Anayasa''nın Yargı bölümünde düzenlenen **Yüksek Mahkemeler yalnızca 4 tanedir**: **Anayasa Mahkemesi (AYM), Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi**. **Sayıştay** ile **Hakimler ve Savcılar Kurulu (HSK)** Anayasa''nın Yargı bölümünde yer almalarına rağmen **yüksek mahkeme değildir**; Askeri Yargıtay ve Askeri Yüksek İdare Mahkemesi (AYİM) ise 2017 anayasa değişikliği ile kaldırılmıştır."
  },
  {
    "type": "heading",
    "text": "Anayasa Mahkemesi (m. 146-153)"
  },
  {
    "type": "paragraph",
    "text": "2017 değişikliği sonrası **Anayasa Mahkemesi 15 üyeden** oluşur: **12 üyeyi Cumhurbaşkanı**, **3 üyeyi TBMM** seçer. Üyeler **12 yıl** için seçilir ve bir kimse iki defa AYM üyesi seçilemez. AYM hem bireysel başvurulara bakar hem de kanunların, olağan CBK''ların ve TBMM İçtüzüğünün anayasaya uygunluğunu denetler. **Anayasa m. 150** uyarınca doğrudan iptal davası (**soyut norm denetimi**) açmaya yetkili yalnızca üç merci vardır: **Cumhurbaşkanı**, **TBMM''de en fazla üyeye sahip iki siyasi parti grubu** ve **TBMM üye tamsayısının en az 1/5''i (120 milletvekili)**. İptal davası açma süresi **60 gün**dür (anayasa değişikliği şekil denetiminde **10 gün**). **Anayasa m. 153**''ün temel ilkesine göre **AYM''nin iptal kararları geriye yürümez** (idari yargıdaki iptal kararlarından farklı olarak geçmişte tamamlanmış işlemleri geçersiz kılmaz)."
  },
  {
    "type": "paragraph",
    "text": "AYM aynı zamanda **Yüce Divan** sıfatıyla Cumhurbaşkanı''nı, TBMM Başkanı''nı, Cumhurbaşkanı yardımcılarını, bakanları, yüksek yargı başkan ve üyelerini, HSK ve Sayıştay başkan ve üyelerini, Genelkurmay Başkanı''nı ve Kara, Deniz, Hava Kuvvetleri Komutanlarını görevleriyle ilgili suçlardan dolayı yargılar (**milletvekilleri Yüce Divan''da yargılanmazlar**, görev suçları dışındaki suçlarda genel ceza mahkemelerinde yargılanırlar). **2010 anayasa değişikliği** ile Yüce Divan kararlarına karşı tebliğden itibaren **15 gün** içinde AYM Genel Kurulu''na **yeniden inceleme** başvurusu yapma hakkı getirilmiştir."
  },
  {
    "type": "heading",
    "text": "Yargıtay, Danıştay, Uyuşmazlık Mahkemesi, Sayıştay ve HSK"
  },
  {
    "type": "table",
    "headers": [
      "Kurum",
      "Temel Görevi",
      "Üye Seçimi ve Kritik Sınav Notu"
    ],
    "rows": [
      [
        "Yargıtay (m. 154)",
        "**Adli yargı** mahkemelerinin son inceleme mercii",
        "Üyelerinin tamamını **HSK** seçer; **Cumhuriyet Başsavcısını** 5 aday arasından **Cumhurbaşkanı** 4 yıl için seçer"
      ],
      [
        "Danıştay (m. 155)",
        "**İdari yargı** mahkemelerinin son inceleme mercii",
        "Üyelerinin **1/4''ünü Cumhurbaşkanı**, **3/4''ünü HSK** seçer"
      ],
      [
        "Uyuşmazlık Mahkemesi (m. 158)",
        "Adli ve idari yargı arasındaki görev/hüküm uyuşmazlıklarını kesin çözer",
        "Başkanını **AYM kendi üyeleri arasından** seçer"
      ],
      [
        "Sayıştay (m. 160)",
        "TBMM adına kamu idarelerinin mali denetimini yapar",
        "Yüksek mahkeme değildir; **vergi** konusunda Danıştay ile çatışırsa **Danıştay kararı** esas alınır"
      ],
      [
        "HSK (m. 159)",
        "Hakim ve savcıların atama, terfi ve disiplin işlerini yürütür",
        "**13 üye**: Adalet Bakanı (Başkan) + Bakan Yardımcısı (tabii üye) + **4 CB + 7 TBMM** seçer"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 159** uyarınca **Hakimler ve Savcılar Kurulu''nun Başkanı Adalet Bakanı**dır ve Adalet Bakan Yardımcısı kurulun tabii üyesidir. Kurul kararlarına karşı yargı yolu ilkesel olarak kapalıdır; tek istisnası **meslekten çıkarma cezasına ilişkin kararlar**dır (yalnızca meslekten çıkarma kararına karşı yargı yoluna başvurulabilir; atama, nakil, terfi veya kınama kararlarına karşı dava açılamaz)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yargı bölümünde ÖSYM''nin en çok sorduğu dört tuzak şunlardır: 1. **Sayıştay** ve **HSK** yüksek mahkeme değildir; yüksek mahkemeler AYM, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi olmak üzere **4 tanedir**. 2. Vergi uyuşmazlıklarında Sayıştay ile Danıştay kararları çelişirse dosya Uyuşmazlık Mahkemesi''ne gitmez, doğrudan **Danıştay kararı** üstün tutulur (m. 160/son). 3. AYM iptal kararları **geriye yürümez** (idari yargıdaki iptal ise geriye yürür). 4. HSK''nın **yalnızca meslekten çıkarma** kararlarına karşı yargı yolu açıktır; diğer kararları yargı denetimi dışındadır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Danıştay üyelerini ve Yargıtay Cumhuriyet Başsavcısını kim seçer?\" Danıştay üyelerinin **1/4''ünü Cumhurbaşkanı, 3/4''ünü HSK** seçer; **Yargıtay Cumhuriyet Başsavcısını** ise Yargıtay Büyük Genel Kurulu''nun göstereceği 5 aday arasından **Cumhurbaşkanı** seçer."
  },
  {
    "type": "key_points",
    "items": [
      "4 Yüksek Mahkeme vardır: AYM, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi (Sayıştay ve HSK yüksek mahkeme değildir).",
      "AYM 15 üyedir (12 CB + 3 TBMM), görev süresi 12 yıldır; iptal kararları geriye yürümez; milletvekilleri Yüce Divan''da yargılanmaz.",
      "Yargıtay üyelerini HSK, Başsavcısını CB seçer; Danıştay üyelerinin 1/4''ünü CB, 3/4''ünü HSK seçer; Uyuşmazlık Mahkemesi Başkanını AYM seçer.",
      "HSK 13 üyedir (Başkanı Adalet Bakanı); yalnızca meslekten çıkarma kararlarına karşı yargı yolu açıktır."
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
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · İdare Hukuku
-- Kaynak: docs/konu_anlatimi/vatandaslik/05_idare_hukuku.md
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
  'vatandaslik.idare_hukuku.01',
  'Vatandaşlık',
  'İdare Hukuku',
  1,
  'Bölüm 1: İdare Hukukunun Temel İlkeleri, Teşkilat ve Denetim',
  'İdare hukuku, devletin yürütme organı içinde yer alan idari teşkilatın kuruluşunu, işleyişini ve bireylerle olan ilişkilerini düzenleyen genç ve dinamik bir kamu hukuku dalıdır.  İdarenin bireylerle kurduğu ilişkilerde kamu gücüne dayanması, idari işlemlere özel hukuk sözleşmelerinden farklı nitelikler kazandırır: idari işlemler tek yanlıdır (muhatabın rızası aranmaz), doğrudan uygulanabilir (icrai) niteliktedir ve mahkemece iptal edilinceye kadar hukuka uygunluk karinesinden yararlanır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İdare hukuku, devletin yürütme organı içinde yer alan idari teşkilatın kuruluşunu, işleyişini ve bireylerle olan ilişkilerini düzenleyen genç ve dinamik bir kamu hukuku dalıdır. İdarenin bireylerle kurduğu ilişkilerde kamu gücüne dayanması, idari işlemlere özel hukuk sözleşmelerinden farklı nitelikler kazandırır: idari işlemler **tek yanlıdır** (muhatabın rızası aranmaz), **doğrudan uygulanabilir (icrai)** niteliktedir ve mahkemece iptal edilinceye kadar **hukuka uygunluk karinesinden** yararlanır. Her idari işlem **yetki, şekil, sebep, konu ve maksat (amaç)** olmak üzere beş unsurdan oluşur; diğer dört unsur işlemin türüne göre değişebilirken **maksat unsuru daima tektir ve değişmez: Kamu Yararı**. Kişisel çıkar veya siyasi saikle yapılan bir işlem amaç yönünden hukuka aykırı sayılır."
  },
  {
    "type": "heading",
    "text": "Devlet Tüzel Kişiliği, Hiyerarşi ve İdari Vesayet"
  },
  {
    "type": "paragraph",
    "text": "Türkiye Cumhuriyeti idari teşkilatı **merkezden yönetim** (başkent ve taşra) ve **yerinden yönetim** (mahalli idareler ve hizmet yerinden yönetim kuruluşları) ilkelerinin bir arada uygulanmasıyla kurulmuştur. Bu yapıyı anlamanın anahtarı **kamu tüzel kişiliği** ayrımıdır: **Bakanlıklar, Emniyet Genel Müdürlüğü, Valilikler ve Kaymakamlıklar** genel idarenin parçasıdır ve **ayrı kamu tüzel kişilikleri yoktur**; hepsi tek bir **Devlet Tüzel Kişiliği**nin kollarıdır. Buna karşılık il özel idareleri, belediyeler, köyler, üniversiteler, TRT ve meslek odaları ayrı kamu tüzel kişiliğine sahiptir."
  },
  {
    "type": "table",
    "headers": [
      "Denetim Türü",
      "Kimler Arasında Uygulanır?",
      "Yetkinin Kapsamı",
      "Örnek"
    ],
    "rows": [
      [
        "Hiyerarşi",
        "**Aynı** kamu tüzel kişiliği içinde ast ile üst arasında",
        "Emir-talimat verme, işlemi düzeltme ve **yerine geçip işlem yapma** vardır",
        "Bakan – Vali; Vali – Kaymakam; Vali – İl Milli Eğitim Müdürü"
      ],
      [
        "İdari Vesayet",
        "**Farklı** iki kamu tüzel kişiliği arasında (merkezi idare – yerel/hizmet kuruluşu)",
        "İstisnai ve kanunla sınırlıdır; emir veremez, kural olarak **işlemi değiştiremez** (onaylar veya iptal ister)",
        "İçişleri Bakanlığı – Belediye; Devlet – Üniversite"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "Merkezden Yönetim ve Yetki Genişliği (Anayasa m. 126)"
  },
  {
    "type": "paragraph",
    "text": "Merkezi idarenin taşra teşkilatında işlerin merkeze sorulmadan hızla çözülebilmesi için **Anayasa m. 126** gereği **illerin idaresi \"yetki genişliği\" esasına** dayanır. Türkiye''de yetki genişliğine sahip **tek makam Vali**dir; ilçe idaresinin başı olan **Kaymakamda yetki genişliği yoktur**. Vali hem devleti hem de Cumhurbaşkanını ilde temsil eder ve **Cumhurbaşkanı Kararı** ile atanan **istisnai memur** statüsündedir (Cumhurbaşkanı genel memurluk şartları dışında takdirle atayabilir ve görevden alabilir). Buna karşılık **Kaymakam**, meslek sınavını ve stajını tamamlayarak **Cumhurbaşkanı Onayı** ile atanan **kariyer/meslek memuru**dur."
  },
  {
    "type": "paragraph",
    "text": "İlde Vali''nin başkanlığında toplanan ve idari işlerin yürütülmesinde görev alan **İl İdare Kurulu**, Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim Müdürü, İl Sağlık Müdürü, İl Tarım ve Orman Müdürü ile Çevre, Şehircilik ve İklim Değişikliği İl Müdürü gibi tamamen merkezi idarenin il idare şube başkanlarından oluşur; **Belediye Başkanı veya Garnizon Komutanı İl İdare Kurulu''nda kesinlikle yer almaz**."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "İdari denetimdeki iki temel kavramı **A-H / F-V** şeklinde ayır: - **A**ynı kamu tüzel kişiliği içindeysen: **H**iyerarşi (Vali – Kaymakam; Vali – İl Müdürleri; Bakan – Bakan Yardımcısı/Genel Müdür) - **F**arklı iki kamu tüzel kişiliği arasındaysan: İdari **V**esayet (İçişleri Bakanlığı – Belediye; Vali – İl Özel İdaresi/Köy)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Taşra teşkilatında üç ayrım sınavlarda sürekli test edilir: 1. **Yetki genişliği** yalnızca **il** idaresinde ve yalnızca **Vali**ye aittir; Kaymakamda yetki genişliği yoktur. 2. **Vali** Cumhurbaşkanı **Kararı** ile atanan istisnai memur, **Kaymakam** Cumhurbaşkanı **Onayı** ile atanan meslek memurudur. 3. **Bakanlıkların ayrı tüzel kişiliği yoktur**; bu nedenle Bakanlığın Valiyi denetlemesi **hiyerarşi**, Belediyeyi denetlemesi ise **idari vesayet**tir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Valinin ildeki İl Milli Eğitim Müdürünün bir işlemini denetlemesi ile aynı valinin ildeki ilçe belediyesi üzerindeki denetimi sırasıyla hangi yetkiye dayanır?\" Vali ve İl Müdürü aynı Devlet Tüzel Kişiliği içinde olduğundan ilk denetim **hiyerarşi**; belediye ayrı bir kamu tüzel kişisi olduğundan ikinci denetim **idari vesayet**tir."
  },
  {
    "type": "key_points",
    "items": [
      "İdari işlemler tek yanlı ve icraidir; tüm idari işlemlerin değişmez amacı **Kamu Yararı**dır.",
      "Bakanlıklar, Valilikler ve Kaymakamlıklar Devlet Tüzel Kişiliği içindedir; ayrı tüzel kişilikleri yoktur.",
      "Yetki genişliği yalnızca Valide vardır; Vali CB Kararı (istisnai memur), Kaymakam CB Onayı (meslek memuru) ile atanır.",
      "İl İdare Kurulu tamamen il müdürlerinden oluşur; Belediye Başkanı ve Garnizon Komutanı bu kurulda bulunmaz."
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
  'vatandaslik.idare_hukuku.02',
  'Vatandaşlık',
  'İdare Hukuku',
  2,
  'Bölüm 2: Mahalli İdareler (Yerel Yönetimler) ve KİT''ler',
  'Merkezi idarenin dışında kalan ve yerel ortak ihtiyaçları karşılamak üzere kurulan yerel yönetimlere mahalli idareler denir.  Anayasa m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Merkezi idarenin dışında kalan ve yerel ortak ihtiyaçları karşılamak üzere kurulan yerel yönetimlere **mahalli idareler** denir. **Anayasa m. 127** uyarınca Türkiye''de mahalli idareler yalnızca **üç tanedir**: **İl Özel İdaresi, Belediye ve Köy** (Büyükşehir belediyesi de belediye türlerinden biridir). Buna karşılık **ilçe idaresi (kaymakamlık) bir mahalli idare değildir**, merkezi idarenin taşra uzantısıdır. Ayrıca 6360 sayılı Kanun sonrası **büyükşehir belediyesi bulunan 30 ilde İl Özel İdareleri, köyler ve belde belediyeleri kaldırılmış**, İl Özel İdaresinin yerine valiliğe bağlı merkezi idare birimi olan **YİKOB (Yatırım İzleme ve Koordinasyon Başkanlığı)** kurulmuştur."
  },
  {
    "type": "heading",
    "text": "İl Özel İdaresi, Belediye ve Köy Kuruluş Kuralları"
  },
  {
    "type": "paragraph",
    "text": "Mahalli idarelerin kuruluş nüfusları, kuruluş biçimleri ve organları birbirinden farklıdır:"
  },
  {
    "type": "table",
    "headers": [
      "Mahalli İdare",
      "Asgari Nüfus Şartı",
      "Kuruluş Aracı",
      "Karar ve Yürütme Organı"
    ],
    "rows": [
      [
        "İl Özel İdaresi",
        "İl kurulmasıyla (30 büyükşehirde yok)",
        "**Kanunla** (il kurulmasıyla)",
        "Karar: **İl Genel Meclisi** (halk seçer) / Yürütme: **Vali** (çift şapkalı)"
      ],
      [
        "Normal Belediye",
        "En az **5.000** nüfus (il-ilçe merkezlerinde şartsız)",
        "**Cumhurbaşkanı Kararı**",
        "Karar: Belediye Meclisi / Yürütme: Belediye Başkanı"
      ],
      [
        "Büyükşehir Belediyesi",
        "Toplam il nüfusu en az **750.000**",
        "**TBMM Kanunuyla**",
        "Karar: Büyükşehir Belediye Meclisi / Yürütme: Büyükşehir Bld. Başkanı"
      ],
      [
        "Köy İdaresi",
        "**150 – 2.000** arası nüfus",
        "**İçişleri Bakanlığı Kararıyla**",
        "Köy Derneği, Muhtar ve **İhtiyar Meclisi**"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Köy yönetiminde iki özel kurum ve iki gelir-çalışma kavramı KPSS''de sıkça sorulur: **Köy Derneği** bir sivil toplum kuruluşu değil, köyde oturan ve oy kullanma hakkına sahip tüm kadın ve erkek köylülerin oluşturduğu **resmi anayasal doğrudan demokrasi organıdır**. Köy muhtarını ve ihtiyar meclisinin seçilmiş üyelerini Köy Derneği seçer; ayrıca **köyün imamı ve ilkokul öğretmeni** İhtiyar Meclisi''nin kanuni **doğal (tabii) üyeleridir**. Köyün zorunlu ortak işlerinde köylünün bedenen çalışmasına **imece**, ortak giderlerin karşılanması için İhtiyar Meclisi kararıyla hane reislerinin gelirine göre toplanan paraya ise **salma** denir."
  },
  {
    "type": "heading",
    "text": "Mahalli İdare Organlarının Görevden Uzaklaştırılması ve KİT''ler"
  },
  {
    "type": "paragraph",
    "text": "Seçimle göreve gelen yerel yöneticilerin görevden alınması anayasal yargı güvencesi altındadır. **Anayasa m. 127/4** uyarınca mahalli idarelerin seçilmiş organlarının organlık sıfatını kazanmalarına ilişkin itirazların çözümü ve kaybetmeleri konusundaki denetim **yargı yoluyla** olur. Görevleriyle ilgili bir suç sebebiyle hakkında soruşturma veya kovuşturma açılan belediye başkanı veya meclis üyelerini **geçici bir tedbir olarak görevden uzaklaştırma** yetkisi **İçişleri Bakanı**na aittir; ancak başkanlık sıfatına **kesin olarak son verme** ve belediye/il genel meclisini süresinden önce **feshetme** yetkisi yalnızca yüksek idare mahkemesi olan **Danıştay**a aittir!"
  },
  {
    "type": "paragraph",
    "text": "Hizmet yerinden yönetim kuruluşları içinde yer alan **Kamu İktisadi Teşebbüsleri (KİT)** ise 233 sayılı KHK ile ikiye ayrılır: sermayesinin tamamı devlete ait olup iktisadi alanda ticari esaslara göre çalışan ve **kar amacı güden** kuruluşlara **İktisadi Devlet Teşekkülü (İDT)**; sermayesinin tamamı devlete ait olup **tekel** niteliğindeki mal ve hizmetleri kamu hizmeti odaklı üreten kuruluşlara ise **Kamu İktisadi Kuruluşu (KİK)** denir. Her iki KİT türü de ayrı kamu tüzel kişiliğine sahiptir ve Sayıştay ile TBMM denetimine tabidir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yerel yönetimlerde üç net farkı karıştırma: 1. Normal belediye en az **5.000** nüfusla **Cumhurbaşkanı Kararı**yla; **Büyükşehir belediyesi** ise en az **750.000** nüfusla mutlaka **KANUNLA** kurulur! 2. Belediye başkanını **geçici** uzaklaştıran **İçişleri Bakanı**, kesin olarak düşüren ve yerel meclisleri fesheden ise **Danıştay**dır. 3. **Büyükşehir olan 30 ilde** İl Özel İdaresi ve Köy yoktur; onların yerine valiliğe bağlı YİKOB görev yapar."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Köy İhtiyar Meclisi''nin seçim yapılmaksızın görev gereği yer alan doğal üyeleri kimlerdir ve köyün parayla yapılan katkısına ne ad verilir?\" İhtiyar Meclisi''nin doğal üyeleri **köy imamı ve ilkokul öğretmeni**dir; parayla katkı **salma**, bedenle çalışma ise **imece**dir."
  },
  {
    "type": "key_points",
    "items": [
      "Anayasa''da sayılan 3 mahalli idare İl Özel İdaresi, Belediye ve Köy''dür; ilçe idaresi mahalli idare değildir.",
      "Belediye 5.000 nüfus + Cumhurbaşkanı Kararı; Büyükşehir 750.000 nüfus + Kanun; Köy 150-2.000 nüfus + İçişleri Bakanlığı kararıyla kurulur.",
      "Geçici uzaklaştırma İçişleri Bakanı''na, kesin görevden alma ve meclis feshi Danıştay''a aittir.",
      "İDT ticari ve kar amaçlı KİT, KİK ise tekel ve kamu hizmeti odaklı KİT''tir."
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
  'vatandaslik.idare_hukuku.03',
  'Vatandaşlık',
  'İdare Hukuku',
  3,
  'Bölüm 3: Kamu Görevlileri Hukuku (657 Sayılı DMK)',
  'Devlet ve diğer kamu tüzel kişiliklerinin genel idare esaslarına göre yürütmekle yükümlü oldukları asli ve sürekli kamu hizmetlerini yerine getiren personele memur denir ve statüleri ağırlıklı olarak 657 sayılı Devlet Memurları Kanunu (DMK) ile düzenlenir.  Kamu hizmetine girmede serbestlik, eşitlik ve liyakat ilkeleri esastır; hizmetin gerektirdiği niteliklerden başka hiçbir ayrım gözetilemez.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Devlet ve diğer kamu tüzel kişiliklerinin genel idare esaslarına göre yürütmekle yükümlü oldukları asli ve sürekli kamu hizmetlerini yerine getiren personele **memur** denir ve statüleri ağırlıklı olarak **657 sayılı Devlet Memurları Kanunu (DMK)** ile düzenlenir. Kamu hizmetine girmede serbestlik, eşitlik ve **liyakat** ilkeleri esastır; hizmetin gerektirdiği niteliklerden başka hiçbir ayrım gözetilemez."
  },
  {
    "type": "heading",
    "text": "Adaylık, Göreve Başlama, Çekilmiş Sayılma ve İzinler"
  },
  {
    "type": "paragraph",
    "text": "657 sayılı DMK''ya göre memurluğa ilk girişte temel süreler sınavlarda doğrudan sorulur:"
  },
  {
    "type": "bullets",
    "items": [
      "**Aday Memurluk (m. 54):** Adaylık süresi **en az 1 yıl, en çok 2 yıl**dır; bu süre içinde aday memurun başka kurumlara nakli yapılamaz ve devamsızlık veya başarısızlık halinde ilişiği kesilir.",
      "**Göreve Başlama Süreleri (m. 62):** İlk defa veya yeniden memurluğa atananlardan **aynı yerdeki** (aynı belediye/büyükşehir sınırları) görevlere atananlar atama emrinin kendilerine tebliğ gününü **izleyen iş günü** içinde; **başka yerdeki** görevlere atananlar ise tebliğ tarihinden itibaren **15 gün** içinde o yere hareket ederek belli yol süresi sonunda işe başlamak zorundadırlar.",
      "**Çekilmiş (Müstafi) Sayılma (m. 94):** İzinsiz veya kurumunca kabul edilen mazereti olmaksızın görevin terk edilmesi ve bu terkin **kesintisiz 10 gün** devam etmesi halinde, yazılı müracaat şartı aranmaksızın memur çekilmiş (**müstafi**) sayılır ve 1 yıl süreyle devlet memurluğuna geri dönemez.",
      "**İzin Hakları (m. 102, 104):** Hizmeti **1 yıldan 10 yıla kadar (10 yıl dahil)** olan memurların yıllık izin süresi **20 gün**, hizmeti **10 yıldan fazla** olanların yıllık izin süresi **30 gün**dür. Mazeret izinlerinden **babalık izni 10 gün**, **evlilik ve ölüm izinleri ise 7 gün**dür."
    ]
  },
  {
    "type": "heading",
    "text": "Kanunsuz Emir ve Disiplin Rejimi (Anayasa m. 137, DMK m. 125)"
  },
  {
    "type": "paragraph",
    "text": "Kamu yönetiminde hiyerarşi ilkesi memurun amirinin emirlerine uymasını gerektirir; ancak hukuk devleti gereği bu itaat körü körüne değildir. **Anayasa m. 137** uyarınca kamu hizmetlerinde herhangi bir sıfat ve suretle çalışmakta olan kimse, üstünden aldığı emri, yönetmelik, Cumhurbaşkanlığı kararnamesi, kanun veya Anayasa hükümlerine aykırı görürse **yerine getirmez** ve bu aykırılığı o emri verene bildirir. Ancak üstü emrinde ısrar eder ve bu emrini **yazı ile yenilerse**, emir yerine getirilir; bu halde emri yerine getiren sorumlu olmaz, sorumluluk emri verene ait olur. Buna karşılık **konusu suç teşkil eden emir, hiçbir suretle yerine getirilmez; yerine getiren kimse yazılı emir almış olsa dahi sorumluluktan kurtulamaz!**"
  },
  {
    "type": "paragraph",
    "text": "Disiplin hukukunda **657 sayılı DMK m. 125** uyarınca memurlara verilebilecek **disiplin cezaları 5 tanedir**: **1) Uyarma, 2) Kınama, 3) Aylıktan kesme, 4) Kademe ilerlemesinin durdurulması, 5) Devlet memurluğundan çıkarma**."
  },
  {
    "type": "table",
    "headers": [
      "Disiplin Cezası",
      "Cezayı Vermeye Yetkili Merci",
      "Kritik Sınav Notu"
    ],
    "rows": [
      [
        "Uyarma, Kınama, Aylıktan Kesme",
        "**Disiplin amirleri**",
        "Doğrudan soruşturma sonrası disiplin amirince verilir"
      ],
      [
        "Kademe İlerlemesinin Durdurulması",
        "Disiplin kurulunun kararı alındıktan sonra **atamaya yetkili amir**",
        "1-3 yıl arası uygulanır"
      ],
      [
        "Devlet Memurluğundan Çıkarma",
        "Yalnızca **Yüksek Disiplin Kurulu**",
        "Disiplin amiri tek başına ihraç kararı veremez!"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**DMK m. 130** gereği devlet memuru hakkında **savunması alınmadan disiplin cezası verilemez**; soruşturmayı yapanın veya yetkili disiplin kurulunun memura tanıyacağı savunma süresi **en az 7 gün**dür (7 günden az süre tanınamaz). Buna karşılık **görevden uzaklaştırma** bir disiplin cezası değil, soruşturmanın selameti için alınan geçici bir **ihtiyati tedbir**dir (bu sürede memurluk devam eder ve memura maaşının **2/3''ü** ödenir; soruşturma sonunda aklanırsa kesilen 1/3 geri ödenir). Aynı şekilde **yer değiştirme (tayin/sürgün)** de 657 sayılı Kanunda disiplin cezası olarak yer almaz."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Memuriyet hukukunda üç klasik ÖSYM tuzağı vardır: 1. **Görevden uzaklaştırma** ve **sürgün/tayin** disiplin cezası değildir! Görevden uzaklaştırılan kişi hala memurdur ve maaşının 2/3''ünü alır. 2. **Babalık izni 10 gün**, **evlilik ve ölüm izinleri 7 gün**dür; yıllık izinler ise 1-10 yıl **20 gün**, 10 yıl üstü **30 gün**dür. 3. Kanuna aykırı emir yazılı tekrarlanırsa yapılır ve sorumluluk amire geçer; ancak **konusu suç teşkil eden emir** yazılı verilse bile asla yapılmaz!"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Disiplin soruşturması yürütülen bir memura savunma yapması için verilecek süre en az kaç gündür ve memurluktan çıkarma cezasını kim verir?\" Savunma süresi **en az 7 gün**dür; memurluktan çıkarma cezasını ise yalnızca **Yüksek Disiplin Kurulu** verir."
  },
  {
    "type": "key_points",
    "items": [
      "Adaylık süresi en az 1, en çok 2 yıldır; aynı yerde ertesi iş günü, başka yerde 15 gün içinde göreve başlanır; kesintisiz 10 gün işe gelmeyen müstafi sayılır.",
      "Yıllık izin 1-10 yıl arası 20, 10 yıl üstü 30 gündür; babalık izni 10, evlilik/ölüm izni 7 gündür; disiplin savunma süresi en az 7 gündür.",
      "Konusu suç teşkil eden emir yazılı tekrarlansa dahi yerine getirilmez; yerine getiren sorumluluktan kurtulamaz.",
      "5 disiplin cezası vardır; görevden uzaklaştırma disiplin cezası değil ihtiyati tedbirdir, memurluktan çıkarmayı Yüksek Disiplin Kurulu verir."
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
  'vatandaslik.idare_hukuku.04',
  'Vatandaşlık',
  'İdare Hukuku',
  4,
  'Bölüm 4: İdarenin Düzenleyici İşlemleri, Mal Edinme ve Sorumluluğu',
  'İdare kamu hizmetlerini yürütürken yalnızca bireysel işlemler (atama, ruhsat, ceza gibi) yapmaz; aynı zamanda genel, soyut ve sürekli kurallar koyan düzenleyici işlemler de yapar.  2017 anayasa değişikliği ile tüzük ve KHK''nın kaldırılması sonucunda yürütmenin ve idarenin başlıca düzenleyici işlemleri Cumhurbaşkanlığı Kararnamesi (CBK), Yönetmelik ve adsız düzenleyici işlemler (genelge, tamim, yönerge, tebliğ) haline gelmiştir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İdare kamu hizmetlerini yürütürken yalnızca bireysel işlemler (atama, ruhsat, ceza gibi) yapmaz; aynı zamanda genel, soyut ve sürekli kurallar koyan **düzenleyici işlemler** de yapar. 2017 anayasa değişikliği ile tüzük ve KHK''nın kaldırılması sonucunda yürütmenin ve idarenin başlıca düzenleyici işlemleri **Cumhurbaşkanlığı Kararnamesi (CBK)**, **Yönetmelik** ve **adsız düzenleyici işlemler (genelge, tamim, yönerge, tebliğ)** haline gelmiştir. **Anayasa m. 124** uyarınca Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri, kendi görev alanlarını ilgilendiren kanunların ve Cumhurbaşkanlığı kararnamelerinin uygulanmasını sağlamak üzere ve bunlara aykırı olmamak şartıyla **yönetmelikler** çıkarabilir. Hangi yönetmeliklerin Resmi Gazete''de yayımlanacağı kanunla belirlenir; yani **bütün yönetmeliklerin Resmi Gazete''de yayımlanma zorunluluğu yoktur** (yalnızca ülke çapında uygulanacak genel nitelikli yönetmelikler yayımlanır). Yönetmeliklerin altında yer alan genelge ve yönergeler ise kurum içi uygulamayı açıklayan ve üst normlara aykırı olamayan düzenlemelerdir."
  },
  {
    "type": "heading",
    "text": "Mal Edinme Usulleri ve İmtiyaz Sözleşmeleri"
  },
  {
    "type": "paragraph",
    "text": "İdare kamu hizmetlerini yürütebilmek için ihtiyaç duyduğu malları bazen özel kişilerden rıza dışı yöntemlerle edinebilir; ancak bu yetkiler Anayasa ve kanunlarla sıkı biçimde sınırlandırılmıştır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Kamulaştırma (m. 46):** Olağan dönemlerde kamu yararı amacıyla özel mülkiyetteki **taşınmaz malların** (arsa, arazi, bina) bedeli kural olarak peşin ve nakit ödenerek kamu mülkiyetine geçirilmesidir.",
      "**İstimval:** Seferberlik, savaş veya olağanüstü hal gibi istisnai dönemlerde idarenin özel kişilere ait **taşınır malları** (araç, gıda, yakıt gibi) ve gerektiğinde çalışma gücünü bedeli karşılığında zorla almasıdır.",
      "**Geçici İşgal:** Bayındırlık işlerinin (yol, köprü, baraj yapımı) yürütülmesi sırasında yakınlardaki boş bir özel taşınmazın geçici süreyle malzeme deposu veya şantiye olarak kullanılmasıdır."
    ]
  },
  {
    "type": "paragraph",
    "text": "İdare ayrıca kamu hizmetlerini özel hukuk kişilerine gördürürken **kamu hizmeti imtiyaz sözleşmeleri** imzalayabilir. **Anayasa m. 155** uyarınca kamu hizmetleri ile ilgili imtiyaz şartlaşma ve sözleşmeleri hakkında **iki ay içinde düşüncesini bildirmek** görevi **Danıştay**a aittir (Sayıştay yalnızca mali denetim yapar, imtiyaz sözleşmelerinde inceleme görevi yoktur)."
  },
  {
    "type": "heading",
    "text": "İdarenin Mali Sorumluluğu ve Kolluk Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Hukuk devleti ilkesi gereği **Anayasa m. 125** \"İdare, kendi eylem ve işlemlerinden doğan zararı ödemekle yükümlüdür\" hükmünü koyar. İdarenin mali sorumluluğu iki başlıkta toplanır: 1. **Kusurlu Sorumluluk (Hizmet Kusuru):** Kamu hizmetinin hiç işlememesi, geç işlemesi veya kötü işlemesi nedeniyle doğan zararların idarece ödenmesidir. 2. **Kusursuz Sorumluluk:** İdarenin hiçbir kusuru, ihmali veya hukuka aykırılığı bulunmasa dahi zararı tazmin etmek zorunda kalmasıdır; **Risk (Tehlike) İlkesi** (örneğin cephanelik patlaması veya tehlikeli enerji tesisi kazası) ve **Kamu Külfetleri Karşısında Eşitlik / Fedakarlığın Denkleştirilmesi İlkesi** (örneğin yol yapımı nedeniyle bir dükkanın müşterisiz kalıp özel zarara uğraması) kusursuz sorumluluk ilkeleridir."
  },
  {
    "type": "paragraph",
    "text": "Kamu düzeninin korunmasında görev yapan **kolluk** kuvvetleri de görev zamanı ve bağlı oldukları makam bakımından ikiye ayrılır: **İdari kolluk** henüz suç işlenmeden önce genel güvenliği, dirlik-esenliği ve genel sağlığı korumak için önleyici tedbir alır; **Vali, Kaymakam** gibi idari amirlere bağlıdır (polis devriyesi, trafik denetimi). **Adli kolluk** ise suç işlendikten sonra harekete geçer, faili ve delilleri araştırır ve **Cumhuriyet Savcısı**na bağlı olarak görev yapar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bu bölümde dört kavram çifti sıkça birbirine karıştırılır: 1. Taşınmaz malın olağan dönemde alınması **kamulaştırma**; taşınır malın ve çalışma gücünün savaş/OHAL''de alınması **istimval**dir. 2. Kamu hizmeti imtiyaz sözleşmeleri hakkında **2 ay** içinde görüş bildiren organ **Danıştay**dır (Sayıştay değil). 3. **Hizmet kusuru** kusurlu sorumluluktur; **Risk** ve **Fedakarlığın Denkleştirilmesi** ise kusursuz sorumluluktur. 4. İdari işlem idarenin **tek yanlı** iradesiyle doğarken, **idari sözleşme** idare ile karşı tarafın **karşılıklı rızası ve irade uyuşmasıyla** kurulur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Suç işlenmeden önce önleyici tedbir alan kolluk hangisidir ve kime bağlıdır; suç işlendikten sonra delil toplayan kolluk kime bağlıdır?\" İlk durum **idari kolluk** (idari amir: Vali/Kaymakam), ikinci durum ise **adli kolluk**tur (Cumhuriyet Savcısı). Ayrıca belediye zabıtası ve köy korucuları da kendi görev alanlarında özel idari kolluk faaliyeti yürütürler."
  },
  {
    "type": "key_points",
    "items": [
      "Yönetmelikleri Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri çıkarır; tüm yönetmeliklerin Resmi Gazete''de yayımlanması zorunlu değildir (m. 124).",
      "İmtiyaz sözleşmeleri hakkında **Danıştay** 2 ay içinde görüş bildirir; taşınır mal ve çalışma gücü alımı **istimval**dir.",
      "Risk ve fedakarlığın denkleştirilmesi kusursuz sorumluluktur; hizmet kusuru kusurlu sorumluluktur.",
      "İdari kolluk suç öncesi önleyici (idari amire bağlı), adli kolluk suç sonrası bastırıcıdır (Cumhuriyet Savcısına bağlı)."
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
  'vatandaslik.idare_hukuku.05',
  'Vatandaşlık',
  'İdare Hukuku',
  5,
  'Bölüm 5: İdari Yargı: İptal, Tam Yargı Davaları ve Süreler',
  'Anayasa''nın 125.  maddesi uyarınca "İdarenin her türlü eylem ve işlemlerine karşı yargı yolu açıktır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın 125. maddesi uyarınca **\"İdarenin her türlü eylem ve işlemlerine karşı yargı yolu açıktır.\"** Bu kural hukuk devleti ilkesinin temel güvencesidir; ancak idarenin yargı denetimine tabi olması, mahkemelerin idare yerine geçerek karar alabileceği anlamına gelmez. İdari yargı düzeni; ilk derece mahkemeleri olarak **İdare Mahkemeleri** ve **Vergi Mahkemeleri**, istinaf mercii olarak **Bölge İdare Mahkemeleri** ve temyiz mercii olarak yüksek idare mahkemesi olan **Danıştay**dan oluşur. İdarenin hukuka aykırı işlem ve eylemlerine karşı **2577 sayılı İdari Yargılama Usulü Kanunu (İYUK)** uyarınca açılabilen iki temel dava türü vardır; bu iki dava türü hem amaçları hem de davacıda aranan nitelik bakımından birbirinden ayrılır."
  },
  {
    "type": "heading",
    "text": "İptal Davası ve Tam Yargı Davası Ayrımı"
  },
  {
    "type": "bullets",
    "items": [
      "**İptal Davası:** İdari işlemler hakkında **yetki, şekil, sebep, konu ve maksat** yönlerinden biri ile hukuka aykırı olduklarından dolayı iptalleri için **menfaatleri ihlal edilenler** tarafından açılan davadır. İptal davası yalnızca idari işlemlerin hukuka uygunluğunu denetler; mahkeme işlemin iptaline karar verirse o işlem yapıldığı andan itibaren (geçmişe etkili olarak) hukuk aleminden silinir. İptal davası açabilmek için kişisel bir hakkın ihlali şart değildir, güncel ve meşru bir **menfaat ihlali** yeterlidir.",
      "**Tam Yargı Davası:** İdari eylem ve işlemlerden dolayı **kişisel hakları doğrudan muhtel olanlar (zarara uğrayanlar)** tarafından açılan maddi veya manevi **tazminat** davasıdır. İdare hukukunun bu davasında amaç işlemin ortadan kaldırılması değil, uğranılan zararın parasal olarak karşılanmasıdır; bu nedenle yalnızca menfaat ihlali yetmez, **kişisel hakkın ihlal edilmiş olması** şarttır."
    ]
  },
  {
    "type": "table",
    "headers": [
      "Özellik",
      "İptal Davası",
      "Tam Yargı Davası"
    ],
    "rows": [
      [
        "Konusu",
        "Yalnızca idari **işlemler**",
        "İdari **eylemler**, işlemler veya idari sözleşmeler"
      ],
      [
        "Kim Açabilir?",
        "**Menfaati** ihlal edilenler",
        "**Kişisel hakkı** doğrudan muhtel olanlar"
      ],
      [
        "Sonucu",
        "İşlem baştan itibaren ortadan kalkar",
        "Uğranılan maddi/manevi zarar **tazmin** edilir"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "Dava Açma Süreleri ve Kamulaştırma İstisnası"
  },
  {
    "type": "paragraph",
    "text": "**2577 sayılı İYUK m. 7** uyarınca idari yargıda dava açma süresi, özel kanunlarda ayrı bir süre gösterilmemişse yazılı bildirimin yapıldığı tarihi izleyen günden itibaren:"
  },
  {
    "type": "bullets",
    "items": [
      "**İdare Mahkemelerinde ve Danıştay''da: 60 gün**",
      "**Vergi Mahkemelerinde: 30 gün**dür."
    ]
  },
  {
    "type": "paragraph",
    "text": "Yargı kolu ayrımında dikkat edilmesi gereken en önemli istisna **kamulaştırma davaları**dır. Kamulaştırma idare tarafından yapılan tek yanlı bir idari işlem olmasına rağmen, **kamulaştırmada \"bedel tespiti ve tescil\" davası adli yargı kolunda yer alan Asliye Hukuk Mahkemesi''nde görülür!** Buna karşılık vatandaş kamulaştırma işleminin kendisinin hukuka aykırı (örneğin kamu yararı bulunmadığı) iddiasıyla işlemin **iptalini** istiyorsa bu davayı **idari yargıda (İdare Mahkemesi''nde)** açmalıdır. Ayrıca idari yargıda yargı yetkisi hukuka uygunluk denetimi ile sınırlıdır; idare mahkemeleri **yerindelik denetimi** yapamaz, idari eylem ve işlem niteliğinde karar veremez veya idarenin takdir yetkisini ortadan kaldıracak biçimde yargı kararı veremez. İdari yargı kararlarının idare tarafından geciktirilmeksizin uygulanması ise hukuk devletinin temel şartıdır; idare mahkeme kararını uygulamazsa tazminat sorumluluğu doğar. Ayrıca dava sonuçlanıncaya kadar idari işlemin uygulanmasını durdurabilmek için idari yargı mercii, işlemin uygulanması halinde **telafisi güç veya imkânsız zararların doğması** ve işlemin **açıkça hukuka aykırı olması** şartlarının birlikte gerçekleşmesi durumunda gerekçeli olarak **yürütmenin durdurulması** kararı verebilir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İdari yargıda iki süre ve iki görev ayrımını kesinlikle karıştırma: 1. Dava açma süresi **İdare Mahkemesi ve Danıştay''da 60 gün**, **Vergi Mahkemesi''nde 30 gün**dür. 2. Kamulaştırmada işlemin **iptali** davası **İdare Mahkemesi**nde, **bedel tespiti ve tescil** davası ise adli yargıdaki **Asliye Hukuk Mahkemesi**nde görülür! 3. İptal davasında **menfaat ihlali**, tam yargı davasında ise **kişisel hak ihlali** aranır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Bir vatandaşın arazisi belediye tarafından kamulaştırılmıştır. Vatandaş belirlenen kamulaştırma bedelinin düşük olduğu gerekçesiyle bedelin artırılması veya tespiti için hangi mahkemeye başvurmalıdır?\" Kamulaştırma idari işlem olsa da **bedel tespiti ve tescil** davası adli yargıda yer alan **Asliye Hukuk Mahkemesi**nde görülür; kamulaştırma kararının kendisinin iptali istenirse İdare Mahkemesi''ne gidilir."
  },
  {
    "type": "key_points",
    "items": [
      "İptal davası menfaati ihlal edilenlerce hukuka aykırı işlemin ortadan kaldırılması için, tam yargı davası ise hakkı ihlal edilenlerce tazminat için açılır.",
      "Genel dava açma süresi İdare Mahkemesi ve Danıştay''da **60 gün**, Vergi Mahkemelerinde **30 gün**dür (İYUK m. 7).",
      "Kamulaştırmanın iptali idari yargıda, kamulaştırma bedel tespiti ve tescil davası ise **Asliye Hukuk Mahkemesi**nde görülür.",
      "İdari yargı yalnızca hukuka uygunluk denetimi yapar; yerindelik denetimi yapamaz ve idare yerine geçerek işlem tesis edemez."
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
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · Uluslararası Kuruluşlar
-- Kaynak: docs/konu_anlatimi/vatandaslik/06_uluslararasi_kuruluslar.md
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
  'vatandaslik.uluslararasi_kuruluslar.01',
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  1,
  'Bölüm 1: Uluslararası Hukuk, Antlaşmalar ve Birleşmiş Milletler (BM)',
  'Devletler arası ilişkilerin hukuki temelini uluslararası antlaşmalar ve küresel örgütler oluşturur.  Anayasa m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Devletler arası ilişkilerin hukuki temelini uluslararası antlaşmalar ve küresel örgütler oluşturur. **Anayasa m. 90** uyarınca milletlerarası antlaşmaların onaylanması Türkiye Büyük Millet Meclisi''nin onaylamayı bir kanunla uygun bulmasına bağlıdır ve usulüne göre yürürlüğe konulmuş milletlerarası antlaşmalar **kanun hükmündedir**. Ancak normal kanunlardan çok önemli bir farkla ayrılır: **milletlerarası antlaşmalar hakkında Anayasa''ya aykırılık iddiasıyla Anayasa Mahkemesi''ne iptal davası açılamaz**. Ayrıca 2004 anayasa değişikliği ile eklenen hükme göre **temel hak ve özgürlüklere ilişkin milletlerarası antlaşmalarla kanunların aynı konuda farklı hükümler içermesi nedeniyle çıkabilecek uyuşmazlıklarda milletlerarası antlaşma hükümleri esas alınır**; yani temel haklarda antlaşmalar kanuna üstündür. Bu düzenleme, uluslararası insan hakları standartlarının iç hukukta doğrudan uygulanabilmesini sağlar."
  },
  {
    "type": "heading",
    "text": "Birleşmiş Milletler (BM) ve Güvenlik Konseyi"
  },
  {
    "type": "paragraph",
    "text": "II. Dünya Savaşı''nın ardından uluslararası barış ve güvenliği korumak, ülkeler arasında ekonomik ve sosyal işbirliğini geliştirmek amacıyla 1945 San Francisco Konferansı ile kurulan **Birleşmiş Milletler (BM)**nin Türkiye de **kurucu üyeleri** arasında yer alır. BM''nin tüm üye devletlerin eşit biçimde birer oyla temsil edildiği **Genel Kurul** organı tavsiye niteliğinde kararlar alır; bu organın 2020-2021 döneminde **BM 75. Genel Kurul Başkanlığı** görevini yürüterek bu makama seçilen ilk ve tek Türk diplomat ise **Volkan Bozkır**dır."
  },
  {
    "type": "paragraph",
    "text": "BM''nin altı ana organından beşi (Genel Kurul, Güvenlik Konseyi, Ekonomik ve Sosyal Konsey, Vesayet Konseyi, Genel Sekreterlik) ABD''nin **New York** kentinde bulunurken, merkezi New York''ta olmayan **tek ana organ** Hollanda''nın **Lahey** kentinde yer alan **Uluslararası Adalet Divanı (UAD)**dır. UAD **15 yargıçtan** oluşur (görev süreleri 9 yıldır) ve önünde yalnızca **devletler** taraf olabilir; gerçek kişilerin işlediği savaş suçları ve soykırım suçlarını ise 1998 **Roma Statüsü** ile kurulup 2002''de yürürlüğe giren ve Lahey''de bulunan **Uluslararası Ceza Mahkemesi (UCM)** yargılar."
  },
  {
    "type": "paragraph",
    "text": "BM''nin bağlayıcı karar alabilen ve askeri müdahale yetkisine sahip tek organı **BM Güvenlik Konseyi**dir. Konseyin ikişer yıllığına seçilen 10 geçici üyesinin yanında kararları tek başına durdurabilen veto yetkisine sahip **5 daimi üyesi** vardır (II. Dünya Savaşı''nın galip devletleri):"
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "BM Güvenlik Konseyi''nin veto yetkili 5 daimi üyesini **F-İ-R-Ç-A** şeklinde aklında tut: - **F**ransa - **İ**ngiltere (Birleşik Krallık) - **R**usya - **Ç**in - **A**BD"
  },
  {
    "type": "paragraph",
    "text": "Ekonomik açıdan çok güçlü olmalarına rağmen **Almanya ve Japonya** Güvenlik Konseyi''nin daimi üyesi değildir; çünkü daimi üyelik statüsü II. Dünya Savaşı sonundaki güç dengesine göre yalnızca savaşın galip devletlerine tanınmıştır. Bu adaletsiz yapı günümüzde de küresel reform tartışmalarının odak noktasını oluşturur."
  },
  {
    "type": "heading",
    "text": "BM Uzmanlık Kuruluşları ve Önemli Merkezler"
  },
  {
    "type": "table",
    "headers": [
      "Kuruluş / Örgüt",
      "Temel Görev Alanı",
      "Genel Merkezi"
    ],
    "rows": [
      [
        "UNESCO",
        "Eğitim, bilim, kültür; Dünya Mirası Listesi",
        "**Paris** (Fransa)"
      ],
      [
        "DTÖ (WTO), WHO, ILO, UNHCR",
        "Ticaret (1947 GATT devamı, 1995), sağlık, çalışma, mülteciler",
        "**Cenevre** (İsviçre)"
      ],
      [
        "FAO ve WFP",
        "Gıda ve tarım (Dünya Gıda Programı)",
        "**Roma** (İtalya)"
      ],
      [
        "IAEA ve OPEC",
        "Nükleer denetim (IAEA) ve petrol ihraç edenler (1965''ten beri)",
        "**Viyana** (Avusturya)"
      ],
      [
        "IMF ve Dünya Bankası",
        "Uluslararası para fonu ve kalkınma finansmanı",
        "**Washington** (ABD)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "BM organları ve uzmanlık kuruluşlarında üç nokta sıkça karıştırılır: 1. BM''nin merkezi New York''ta olmayan tek ana organı Lahey''deki **Uluslararası Adalet Divanı**dır; burada bireyler değil **devletler** yargılanır (bireyleri yargılayan **Uluslararası Ceza Mahkemesi**dir). 2. Petrol ihraç eden ülkeler örgütü **OPEC** Bağdat''ta kurulmuş olsa da 1965''ten beri merkezi bir petrol ülkesinde değil **Viyana**dadır. 3. Çocuklara yardım fonu **UNICEF** iken, Dünya Mirası Listesi''ni oluşturan eğitim-bilim-kültür örgütü **UNESCO**dur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Anayasa m. 90''a göre temel hak ve özgürlüklere ilişkin bir milletlerarası antlaşma ile TBMM''nin çıkardığı bir kanun aynı konuda çelişirse hangisi uygulanır ve antlaşmaya karşı AYM''ye gidilebilir mi?\" Çelişki halinde **milletlerarası antlaşma** esas alınır; ayrıca usulüne göre yürürlüğe giren antlaşmalara karşı AYM''de iptal davası açılamaz."
  },
  {
    "type": "key_points",
    "items": [
      "Anayasa m. 90''a göre milletlerarası antlaşmalara karşı AYM''ye gidilemez; temel haklarda antlaşmalar kanuna üstündür.",
      "BM Güvenlik Konseyi''nin 5 daimi üyesi **FİRÇA**''dır; Türkiye BM kurucu üyesidir ve Volkan Bozkır 75. Genel Kurul Başkanı seçilmiştir.",
      "New York dışında bulunan tek BM ana organı Lahey''deki UAD''dır (devletleri yargılar); UCM ise Roma Statüsü ile bireyleri yargılar.",
      "UNESCO Paris''te, DTÖ/WHO/ILO/UNHCR Cenevre''de, FAO/WFP Roma''da, IAEA ve OPEC Viyana''da, IMF/Dünya Bankası Washington''dadır."
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
  'vatandaslik.uluslararasi_kuruluslar.02',
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  2,
  'Bölüm 2: Avrupa Konseyi, AİHM ve Avrupa Birliği (AB)',
  'Türkiye''nin Avrupa kurumlarıyla olan ilişkilerini anlayabilmek için sınavlarda sürekli birbirine karıştırılan iki ayrı örgütü kesin çizgilerle ayırmak gerekir: Avrupa Konseyi ve Avrupa Birliği (AB).  Bu iki örgüt ne kurumsal olarak aynıdır ne de yargı organları ortaktır; ancak ortak insan hakları, hukukun üstünlüğü ve demokrasi değerleri nedeniyle sıklıkla karıştırılırlar.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye''nin Avrupa kurumlarıyla olan ilişkilerini anlayabilmek için sınavlarda sürekli birbirine karıştırılan iki ayrı örgütü kesin çizgilerle ayırmak gerekir: **Avrupa Konseyi** ve **Avrupa Birliği (AB)**. Bu iki örgüt ne kurumsal olarak aynıdır ne de yargı organları ortaktır; ancak ortak insan hakları, hukukun üstünlüğü ve demokrasi değerleri nedeniyle sıklıkla karıştırılırlar. Türkiye''nin bu iki kuruluştaki konumu da tamamen farklıdır: Türkiye Avrupa Konseyi''nin kurucusu iken, Avrupa Birliği''ne aday ülke statüsündedir."
  },
  {
    "type": "heading",
    "text": "Avrupa Konseyi ve AİHM (Strazburg)"
  },
  {
    "type": "paragraph",
    "text": "1949 yılında insan hakları, çoğulcu demokrasi ve hukukun üstünlüğünü savunmak amacıyla Londra Antlaşması ile kurulan **Avrupa Konseyi**nin merkezi Fransa''nın **Strazburg** kentindedir. Türkiye **Avrupa Konseyi''nin kurucu üyeleri** arasında yer alır (1949''da katılmıştır). Konsey, 16 Mart 2022 tarihinde Ukrayna''nın işgali nedeniyle **Rusya Federasyonu**nu üyelikten ihraç etmiş ve üye sayısı **46**ya inmiştir (böylece Rus vatandaşlarının da AİHM''ye başvuru yolu kapanmıştır)."
  },
  {
    "type": "paragraph",
    "text": "**Avrupa İnsan Hakları Mahkemesi (AİHM)**, Avrupa Birliği''nin değil, doğrudan **Avrupa Konseyi**nin yargı organıdır ve merkezi **Strazburg**dadır. AİHM, Avrupa İnsan Hakları Sözleşmesi''nden (AİHS) doğan hak ihlallerini inceler. AİHM yargıçları, ilgili devletin gösterdiği üç aday arasından **Avrupa Konseyi Parlamenter Meclisi (AKPM)** tarafından **9 yıl** için seçilirler ve **yeniden seçilemezler**. 2010''da Türk Anayasa Mahkemesi''ne bireysel başvuru yolu getirildikten sonra tüm iç hukuk yolları (AYM dahil) tüketilmeden AİHM''ye başvuru yapılamaz; ayrıca **15 No''lu Ek Protokol**ün yürürlüğe girmesiyle birlikte kesinleşmiş nihai iç hukuk kararının tebliğinden itibaren **AİHM''ye başvuru süresi 6 aydan 4 aya indirilmiştir**."
  },
  {
    "type": "heading",
    "text": "Avrupa Birliği (AB) ve Kurumsal Yapısı (Brüksel)"
  },
  {
    "type": "paragraph",
    "text": "Temelleri II. Dünya Savaşı sonrası Avrupa''da kalıcı ekonomik bütünleşme sağlamak amacıyla 1951 Paris (AKÇT) ve 1957 **Roma Antlaşması** ile 6 kurucu ülke (**Fransa, Batı Almanya, İtalya, Belçika, Hollanda, Lüksemburg**) tarafından Avrupa Ekonomik Topluluğu (AET) olarak atılan **Avrupa Birliği**nin idari merkezi **Brüksel**dir; buna karşın Avrupa Parlamentosu''nun resmi oturum merkezi **Strazburg**, Avrupa Merkez Bankası''nın merkezi **Frankfurt**, Avrupa Birliği Adalet Divanı''nın (ABAD) merkezi ise **Lüksemburg**dur. Türkiye Avrupa Konseyi''nin kurucu üyesi olmasına karşın **AB''nin kurucusu veya üyesi değildir**; bu nedenle AB müktesebatını denetleyen Lüksemburg''daki **Avrupa Birliği Adalet Divanı (ABAD)** yargısına tabi değildir (Türkiye AİHM''ye tabidir!). Türkiye 1996''da AB ile Gümrük Birliği''ne girmiş, 1999 Helsinki Zirvesi''nde ise aday ülke ilan edilmiştir. Avrupa Konseyi''nin karar ve yürütme organı olan **Bakanlar Komitesi** ise AİHM kararlarının üye devletlerce uygulanıp uygulanmadığını denetler."
  },
  {
    "type": "table",
    "headers": [
      "AB Kavramı / Kurumu",
      "Temel İşlevi ve Sınav Notu"
    ],
    "rows": [
      [
        "Avrupa Komisyonu (Brüksel)",
        "Her üye devletten bir komiserin katıldığı AB''nin **yürütme/hükümet** organıdır (mevzuat teklifi yapar)"
      ],
      [
        "Avrupa Parlamentosu",
        "Doğrudan AB vatandaşlarınca seçilen **yasama** organıdır"
      ],
      [
        "Kopenhag Kriterleri",
        "AB''ye üyelik için gereken **siyasi** kriterlerdir (demokrasi, insan hakları, hukuk devleti)"
      ],
      [
        "Maastricht Kriterleri",
        "Ekonomik ve Parasal Birliğe (Euro) geçiş için aranan **ekonomik/parasal** kriterlerdir"
      ],
      [
        "Schengen Anlaşması (1985)",
        "Taraf ülkeler arasındaki iç sınır kontrollerini kaldıran **serbest dolaşım** alanıdır (mülteci ilticası **Dublin Sözleşmesi**dir)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "AB tarihindeki tek ayrılık örneği **Brexit**tir: **Birleşik Krallık**, 2016 referandumunun ardından **31 Ocak 2020**''de AB''den resmen ayrılmıştır (Norveç ve İsviçre ise hiçbir zaman AB üyesi olmamıştır)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Avrupa örgütlerinde üç klasik tuzağa dikkat et: 1. **AİHM** Avrupa Birliği''ne değil, Türkiye''nin kurucu üyesi olduğu **Avrupa Konseyi**ne bağlıdır; Türkiye ABAD''a değil AİHM''ye tabidir. 2. **AİHM başvuru süresi** 15 No''lu Protokol sonrası **4 ay**dır; AİHM yargıçları 9 yıllığına seçilir ve **yeniden seçilemez**. 3. AB''nin siyasi şartları **Kopenhag**, parasal şartları **Maastricht** Kriterleridir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türkiye''nin kurucu üyesi olduğu ve Rusya''nın 2022''de ihraç edildiği Avrupa örgütü hangisidir?\" Cevap Avrupa Birliği değil, Strazburg merkezli **Avrupa Konseyi**dir."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye **Avrupa Konseyi**nin kurucu üyesidir; AB''nin kurucusu veya üyesi değildir.",
      "AİHM Avrupa Konseyi''nin mahkemesidir (Strazburg); yargıçları 9 yıl için seçilir, yeniden seçilemez ve başvuru süresi güncel olarak **4 ay**dır.",
      "AB''den ayrılan tek ülke **Birleşik Krallık**tır (Brexit, 31 Ocak 2020); AB''nin yürütmesi Avrupa Komisyonu, yasaması Avrupa Parlamentosu''dur.",
      "Siyasi kriterler Kopenhag, parasal kriterler Maastricht; serbest dolaşım Schengen, iltica kuralları Dublin Sözleşmesi''dir."
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
  'vatandaslik.uluslararasi_kuruluslar.03',
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  3,
  'Bölüm 3: Güvenlik ve Ekonomi Örgütleri (NATO, AGİT, OECD, G-20, INTERPOL)',
  'Soğuk Savaş döneminden küreselleşmeye uzanan süreçte Türkiye yalnızca Avrupa Konseyi içinde değil, aynı zamanda Batı güvenlik mimarisi ve gelişmiş piyasa ekonomileriyle de kurumsal bağlar kurmuştur.  II.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Soğuk Savaş döneminden küreselleşmeye uzanan süreçte Türkiye yalnızca Avrupa Konseyi içinde değil, aynı zamanda Batı güvenlik mimarisi ve gelişmiş piyasa ekonomileriyle de kurumsal bağlar kurmuştur. II. Dünya Savaşı sonrası ortaya çıkan iki kutuplu dünya düzeni, Sovyet tehdidine karşı ortak savunma paktlarının doğmasına; küreselleşme ise ekonomik işbirliği ve sınır aşan suçlarla mücadele örgütlerinin güçlenmesine zemin hazırlamıştır. Bu örgütlerin kuruluş yılları, Türkiye''nin üyelik statüleri (kurucu üye mi, sonradan katılan üye mi) ve merkez şehirleri sınavlarda sıkça karşılaştırılır."
  },
  {
    "type": "heading",
    "text": "NATO (Kuzey Atlantik Antlaşması Örgütü)"
  },
  {
    "type": "paragraph",
    "text": "1949 yılında **Washington**''da imzalanan Kuzey Atlantik Antlaşması ile kurulan **NATO**nun siyasi ve idari genel merkezi Belçika''nın başkenti **Brüksel**dir. Türkiye, BM, Avrupa Konseyi ve OECD''nin aksine **NATO''nun kurucu üyesi değildir**; II. Dünya Savaşı sonrasında Sovyetler Birliği''nin Türkiye''den toprak ve Boğazlar üzerinde üs talebinde bulunması üzerine Batı blokuyla güvenlik şemsiyesi kurma ihtiyacı doğmuş, Kore Savaşı''na asker göndererek gösterdiği askeri dayanışmanın ardından Türkiye **18 Şubat 1952** tarihinde **Yunanistan ile birlikte** ittifakın ilk genişleme üyeleri olarak NATO''ya katılmıştır."
  },
  {
    "type": "paragraph",
    "text": "NATO''nun temel güvenlik mekanizması iki maddede yoğunlaşır: **4. Madde** bir üye ülkenin toprak bütünlüğü, siyasi bağımsızlığı veya güvenliği tehdit altında olduğunda tarafların **istişarede** bulunmasını düzenler; **5. Madde** ise bir müttefike yapılan silahlı saldırıyı tüm üyelere yapılmış sayan **kolektif savunma ve ortak askeri müdahale** maddesidir (5. madde tarihte yalnızca bir kez, **11 Eylül 2001** ABD terör saldırılarının ardından işletilmiştir). Rusya-Ukrayna savaşı sonrasında geleneksel tarafsızlık politikasını terk eden **Finlandiya 2023 yılında NATO''nun 31. üyesi**, **İsveç ise 2024 yılında 32. üyesi** olmuştur (İsviçre ve Avusturya NATO üyesi değildir)."
  },
  {
    "type": "heading",
    "text": "AGİT, OECD, G-20 ve INTERPOL"
  },
  {
    "type": "table",
    "headers": [
      "Kuruluş",
      "Kuruluş / Dönüm Yılı",
      "Genel Merkezi",
      "Türkiye''nin Durumu ve Kritik Bilgi"
    ],
    "rows": [
      [
        "AGİT (OSCE)",
        "1975 Helsinki Senedi -> 1994 Budapeşte",
        "**Viyana** (Avusturya)",
        "Kurucu katılımcıdır; Avrupa güvenlik ve insan hakları işbirliği"
      ],
      [
        "OECD",
        "1961 (OEEC devamı)",
        "**Paris** (Fransa)",
        "**20 kurucu ülkeden biridir**; gelişmiş piyasa ekonomileri örgütü"
      ],
      [
        "G-20",
        "1999 (2008 sonrası liderler zirvesi)",
        "Daimi sekreteryası yok",
        "Türkiye kurucu üyedir; **2023 Yeni Delhi''de Afrika Birliği** daimi üye oldu"
      ],
      [
        "INTERPOL",
        "1923 (modern yapı 1956)",
        "**Lyon** (Fransa)",
        "195 üyeli polis işbirliği örgütü (**EUROPOL** ise Lahey''dedir)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "G-20, dünyanın en büyük ekonomilerini ve Avrupa Birliği''ni bir araya getirerek küresel finansal krizlere karşı koordinasyon sağlar; 2023 yılında Hindistan''ın başkenti Yeni Delhi''de yapılan zirvede 55 Afrika ülkesini temsil eden **Afrika Birliği**''nin daimi üye olarak kabul edilmesi, küresel ekonomik yönetişimdeki güncel gelişmeler arasında öne çıkar. Aynı şekilde polis işbirliği örgütlerinde **INTERPOL**ün Fransa''nın başkenti Paris''te değil **Lyon** kentinde bulunduğu detayı da önemli bir ayırt edici bilgidir. **AGİT** ise 1975''te Soğuk Savaş blokları arasında güven artırıcı önlemler geliştirmek için konferans olarak doğmuş, 1994''te kalıcı örgüte dönüşerek askeri güvenliğin yanı sıra seçim gözlemciliği ve insan hakları alanlarında da faaliyet yürütmeye başlamıştır. Türkiye''nin kurucu üyesi olduğu **OECD** ise üye ülkelerin ekonomik büyüme, eğitim (PISA raporları gibi) ve kalkınma politikalarını karşılaştırmalı verilerle değerlendirerek politika önerileri üretir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Örgütlerin kurucu üyelik ve merkezlerinde üç klasik tuzağa dikkat et: 1. Türkiye BM (1945), Avrupa Konseyi (1949) ve OECD''nin (1961) **kurucu üyesidir**; ancak **NATO''nun kurucusu değildir** (1952''de Yunanistan''la katıldı). 2. NATO''nun 4. maddesi **istişare**, 5. maddesi ise **kolektif savunma** maddesidir. 3. **INTERPOL**ün merkezi Paris değil **Lyon**dur; **NATO** Washington''da imzalandı ama merkezi **Brüksel**dedir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"NATO''nun en son katılan 31. ve 32. üyeleri kimlerdir ve G-20''ye en son daimi üye olarak hangi bölgesel birlik katılmıştır?\" NATO''nun 31. üyesi **Finlandiya (2023)**, 32. üyesi **İsveç (2024)**tir; G-20''ye 2023''te katılan ise **Afrika Birliği**dir."
  },
  {
    "type": "key_points",
    "items": [
      "Türkiye NATO''nun kurucusu değildir; 18 Şubat 1952''de Yunanistan''la birlikte katılmıştır (merkezi Brüksel).",
      "NATO 5. madde kolektif savunmadır (yalnızca 11 Eylül 2001 sonrası işletildi); 31. üye Finlandiya, 32. üye İsveç''tir.",
      "AGİT 1975 Helsinki Nihai Senedi''yle doğdu (Viyana); Türkiye OECD''nin 20 kurucu ülkesinden biridir (Paris).",
      "G-20''ye son katılan daimi üye Afrika Birliği''dir; INTERPOL Lyon''dadır."
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
  'vatandaslik.uluslararasi_kuruluslar.04',
  'Vatandaşlık',
  'Uluslararası Kuruluşlar',
  4,
  'Bölüm 4: Türkiye''nin Öncü Olduğu Bölgesel ve İslam Dünyası Örgütleri',
  'Türkiye coğrafi, tarihi ve kültürel konumu gereği yalnızca Batı örgütlerinde değil; Sovyetler Birliği''nin dağılmasının ardından bağımsızlığını kazanan Türk dünyası, Karadeniz havzası, İslam dünyası ve Avrasya eksenindeki bölgesel örgütlerde de kurucu veya öncü rol üstlenmiştir.  Bu örgütlerin genel merkezleri, üye sayıları ve Türkiye''nin statüsü güncel KPSS sorularında doğrudan test edilir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkiye coğrafi, tarihi ve kültürel konumu gereği yalnızca Batı örgütlerinde değil; Sovyetler Birliği''nin dağılmasının ardından bağımsızlığını kazanan Türk dünyası, Karadeniz havzası, İslam dünyası ve Avrasya eksenindeki bölgesel örgütlerde de kurucu veya öncü rol üstlenmiştir. Bu örgütlerin genel merkezleri, üye sayıları ve Türkiye''nin statüsü güncel KPSS sorularında doğrudan test edilir."
  },
  {
    "type": "heading",
    "text": "Türk Devletleri Teşkilatı (TDT) ve Karadeniz Ekonomik İşbirliği (KEİ)"
  },
  {
    "type": "bullets",
    "items": [
      "**Türk Devletleri Teşkilatı (TDT):** Eski adıyla Türk Dili Konuşan Ülkeler İşbirliği Konseyi (Türk Konseyi), **3 Ekim 2009 Nahçıvan Anlaşması** ile kurulmuş, **2021 İstanbul Zirvesi**nde bugünkü adını almıştır ve Genel Sekreterliği **İstanbul**dadır (kültür örgütü olan TÜRKSOY''un merkezi Ankara''dadır!). TDT''nin **5 tam üyesi** vardır: **Türkiye, Azerbaycan, Kazakistan, Kırgızistan ve Özbekistan** (2019''da tam üye oldu). **Macaristan, Türkmenistan** ve **11 Kasım 2022 Semerkant Zirvesi**nde anayasal adıyla kabul edilen **Kuzey Kıbrıs Türk Cumhuriyeti (KKTC)** ise TDT''de **gözlemci üye** statüsündedir. TDT, üye devletler arasında ulaştırma koridorları, ticaret kolaylaştırma, enerji ve ortak kültürel miras alanlarında kurumsal entegrasyonu güçlendirmeyi hedefler.",
      "**Karadeniz Ekonomik İşbirliği Teşkilatı (KEİ):** Soğuk Savaş sonrasında Karadeniz havzasında barış, istikrar ve ekonomik entegrasyonu sağlamak amacıyla Türkiye''nin öncülüğünde **1992 İstanbul Zirvesi** ile kurulmuş olup daimi Genel Sekreterliği **İstanbul**dadır (Trabzon veya Samsun değildir!). KEİ havza temelli bir işbirliği örgütüdür; bu nedenle **Karadeniz''e kıyısı olmadığı halde Azerbaycan, Ermenistan ve Yunanistan** da KEİ üyesidir."
    ]
  },
  {
    "type": "heading",
    "text": "İslam Dünyası ve Avrasya Örgütleri (İİT, D-8, EİT, ŞİÖ)"
  },
  {
    "type": "table",
    "headers": [
      "Örgüt",
      "Kuruluş / Öne Çıkan Olay",
      "Genel Merkezi",
      "Kritik Sınav Detayı"
    ],
    "rows": [
      [
        "İslam İşbirliği Teşkilatı (İİT)",
        "1969 (Mescid-i Aksa kundaklanması)",
        "**Cidde** (Suudi Arabistan)",
        "Seçimle ilk Genel Sekreter **Prof. Dr. Ekmeleddin İhsanoğlu** (Arap Birliği **Kahire**dedir)"
      ],
      [
        "D-8 (Gelişen Sekiz Ülke)",
        "1997 (Türkiye öncülüğünde)",
        "**İstanbul**",
        "8 üye: Türkiye, İran, Pakistan, Bangladeş, Malezya, Endonezya, Mısır, Nijerya (**Suudi Arabistan yok!**)"
      ],
      [
        "Ekonomik İşbirliği Teşkilatı (EİT)",
        "1985 (10 üye)",
        "**Tahran** (İran)",
        "Türkiye, İran ve Pakistan kurucudur; Türk cumhuriyetleri üyedir"
      ],
      [
        "Şanghay İşbirliği Örgütü (ŞİÖ)",
        "1996 Şanghay Beşlisi -> 2001 ŞİÖ",
        "Pekin",
        "Türkiye tam üye veya gözlemci değil, 2012''den beri **Diyalog Ortağı**dır"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "İslam İşbirliği Teşkilatı''nın kurulmasındaki tarihi kıvılcım, 21 Ağustos 1969''da Kudüs''teki **Mescid-i Aksa''nın kundaklanması**dır; bu olay İslam ülkelerini Filistin davası ve ortak dayanışma ekseninde bir çatı altında buluşturmuş ve BM''den sonra en fazla üyeye sahip uluslararası örgütlerden birini ortaya çıkarmıştır. Türkiye hem İİT içinde aktif rol oynamış (Prof. Dr. Ekmeleddin İhsanoğlu 2005-2014 arasında seçimle gelen ilk Genel Sekreter olarak görev yapmıştır) hem de 1997''de **D-8** oluşumuna öncülük ederek gelişmekte olan sekiz Müslüman ülke arasında ticari, sanayi ve kalkınma odaklı işbirliği zemini kurmuştur. Ayrıca 1985''te Türkiye, İran ve Pakistan tarafından kurulan **Ekonomik İşbirliği Teşkilatı (EİT)**, 1992''de Orta Asya Türk cumhuriyetleri ile Azerbaycan ve Afganistan''ın katılımıyla 10 üyeli geniş bir bölgesel kalkınma platformuna dönüşmüştür. Öte yandan Avrasya ekseninde 2001''de güvenlik ve sınır istikrarı amacıyla kurulan Şanghay İşbirliği Örgütü ile Türkiye 2012 Pekin Zirvesi''nden bu yana **Diyalog Ortağı** statüsünde temaslarını sürdürmektedir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bölgesel örgütlerde dört ayrıntı sıkça karıştırılır: 1. **TDT** ve **KEİ** ve **D-8**''in merkezi **İstanbul**dur; **TÜRKSOY** Ankara''da, **EİT** Tahran''da, **İİT** Cidde''de, **Arap Birliği** Kahire''dedir. 2. **Türkmenistan ve KKTC** TDT''nin tam üyesi değil, **gözlemci** üyesidir (5 tam üye: Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan). 3. **Suudi Arabistan** D-8 üyesi **değildir**; **Azerbaycan, Ermenistan ve Yunanistan** ise Karadeniz''e kıyısı olmadan **KEİ** üyesidir. 4. Türkiye **Şanghay İşbirliği Örgütü**nde tam üye veya gözlemci değil, **Diyalog Ortağı**dır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1992''de İstanbul''da kurulan, merkezi İstanbul olan ve Karadeniz''e kıyısı olmayan Azerbaycan, Ermenistan ve Yunanistan''ın da üyesi bulunduğu örgüt hangisidir?\" Cevap **Karadeniz Ekonomik İşbirliği Teşkilatı (KEİ)**dır."
  },
  {
    "type": "key_points",
    "items": [
      "TDT (2009 Nahçıvan) merkezi İstanbul''dadır; 5 tam üyesi Türkiye, Azerbaycan, Kazakistan, Kırgızistan ve Özbekistan; gözlemcileri Macaristan, Türkmenistan ve KKTC''dir.",
      "KEİ (1992) merkezi İstanbul''dadır; kıyısı olmayan Azerbaycan, Ermenistan ve Yunanistan da üyedir.",
      "İİT (1969, Mescid-i Aksa) merkezi Cidde''dir (ilk seçilmiş Genel Sekreter Ekmeleddin İhsanoğlu); Arap Birliği Kahire''de, EİT Tahran''dadır.",
      "D-8''in merkezi İstanbul''dadır (Suudi Arabistan üye değildir); Türkiye ŞİÖ''de 2012''den beri **Diyalog Ortağı**dır."
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
