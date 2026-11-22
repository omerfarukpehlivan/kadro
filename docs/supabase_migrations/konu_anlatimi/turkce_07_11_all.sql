-- =============================================================================
-- KADRO KONU ANLATIMI - TURKCE 07-11 TOPLU MIGRATION
-- Toplam dosya: 5
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================

begin;

-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Yazım Kuralları
-- Kaynak: docs/konu_anlatimi/turkce/07_yazim_kurallari.md
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
  'turkce.yazim_kurallari.01',
  'Türkçe',
  'Yazım Kuralları',
  1,
  'Bölüm 1: Büyük Harflerin Kullanımı ve Tarih-Yer Adları',
  'Türkçede büyük harflerin kullanımı hem cümle başlangıcı hem de özel adların sınırlarını belirleme açısından kesin kurallara bağlıdır.  Cümleler, dizeler, iki noktadan sonra gelen bağımsız yargılar ve tırnak içine alınan tam cümleler büyük harfle başlar; buna karşılık iki noktadan sonra yalnızca örnekler sıralanıyorsa ilk sözcük küçük harfle yazılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede büyük harflerin kullanımı hem cümle başlangıcı hem de özel adların sınırlarını belirleme açısından kesin kurallara bağlıdır. Cümleler, dizeler, iki noktadan sonra gelen bağımsız yargılar ve tırnak içine alınan tam cümleler büyük harfle başlar; buna karşılık iki noktadan sonra yalnızca örnekler sıralanıyorsa ilk sözcük küçük harfle yazılır. Özel adlar, kişi ad ve soyadları, unvanlar (*Kaymakam Ahmet Bey*, *Prof. Dr. Ayşe Kaya*), millet, dil, din, mezhep adları, devlet adları ile kurum ve kuruluş adlarının her sözcüğü büyük harfle başlar; ancak akrabalık bildiren *dayı, teyze, hala, amca* gibi sözcükler özel adın önüne gelip unvan veya lakap olarak kalıplaşmadıkça küçük harfle yazılır (*Ayşe teyze*, *Mehmet dayı* küçük; *Nene Hatun*, *Baba Gündüz* büyük)."
  },
  {
    "type": "paragraph",
    "text": "Yer, yön, tarih ve gök bilimi adlarında da bağlam belirleyicidir. **Gün ve ay adları** tek başlarına kullanıldıklarında cins isim sayılır ve **her zaman küçük harfle** yazılır (*gelecek pazartesi*, *her haziran*); yalnızca yanında belirli bir gün sayısı veya yıl bulunduğunda büyük harfle başlar (*29 Ekim 1923*, *15 Temmuz Salı*). Yön adları (*doğu, batı, kuzey, güney*) tek başına veya bir özel adın ardından geldiğinde küçük (*Ankara''nın doğusu*), özel addan önce geldiğinde (*Doğu Anadolu*) veya bir medeniyet/kültür bölgesini karşıladığında (*Batı düşüncesi*) büyük yazılır. Benzer biçimde *dünya, güneş, ay* sözcükleri gök bilimi terimi olduğunda büyük, günlük anlamda kullanıldığında küçük harfle başlar. Kitap, dergi, gazete ve eser adlarında ise özel ada dahil olmayan *gazetesi, dergisi, tablosu* sözcükleri küçük yazılır (*Resmî Gazete* hariç); başlıktaki *ve, ile, de, mı* gibi bağlaç ve edatlar da tüm harfleri büyük yazılmadıkça küçük harfle yazılır (*Suç ve Ceza*)."
  },
  {
    "type": "paragraph",
    "text": "Coğrafi yer adlarında ise kural şudur: Kıta, bölge, il, ilçe, köy, semt, dağ, deniz, göl, ırmak ve boğaz adları büyük harfle başlar (*Ağrı Dağı, Van Gölü, Çanakkale Boğazı*); buna karşılık özel ada dahil olmayan *ili, ilçesi, köyü, beldesi* sözcükleri küçük harfle yazılır (*Ankara ili, Ürgüp ilçesi, Taşköprü köyü*). Mahalle, meydan, bulvar, cadde ve sokak adlarında geçen *mahalle, bulvar, cadde, sokak* kelimeleri ise özel ada dahil kabul edildiği için büyük harfle başlar (*Atatürk Bulvarı, Cumhuriyet Mahallesi*). Saray, köşk, han, kale, köprü, kule, anıt gibi yapı adlarının bütün kelimeleri de büyük yazılır (*Topkapı Sarayı, Galata Köprüsü*). Tarihi olay, çağ ve dönem adları (*Kurtuluş Savaşı, Lale Devri, İlk Çağ*) büyük harfle başlar; ancak tür bildiren dönem dışı kullanımlar küçük yazılır."
  },
  {
    "type": "table",
    "headers": [
      "Kategori",
      "Büyük Yazım (Doğru)",
      "Küçük Yazım (Doğru)"
    ],
    "rows": [
      [
        "Ay ve Gün Adları",
        "**29 Ekim 1923**, **14 Mayıs Pazar**",
        "Toplantıyı gelecek **pazartesi** veya **haziran**da yapacağız."
      ],
      [
        "Yön Adları",
        "**Doğu Karadeniz**, **Batı** edebiyatı",
        "İzmir''in **batısı**, rüzgâr **kuzey**den esiyor."
      ],
      [
        "Gök Cisimleri",
        "**Dünya**, **Güneş** etrafında döner.",
        "Evin odası hiç **güneş** almıyor."
      ],
      [
        "Eser ve Yayın Adları",
        "**Milliyet** gazetesi, **Varlık** dergisi, *Sefiller* romanı",
        "Bu **gazete**yi her sabah okurum. (Tür adı olarak kullanılan *gazete, dergi* küçük yazılır.)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Okullar bu yıl **Haziran** ayında kapanacak.\" cümlesinde ay adı belirli bir tarih sayısına bağlı olmadığı için büyük yazılması **yanlıştır**; doğrusu \"Okullar bu yıl **haziran** ayında kapanacak.\" biçimindedir. Aynı şekilde \"Sınav sonuçları **Pazartesi** günü açıklanacak.\" yazımı **yanlıştır**, doğrusu \"**pazartesi** günü\"dür; ancak \"Sınav **18 Haziran Pazartesi** günü yapılacak.\" cümlesinde belirli gün sayısına bağlandığı için büyük yazım **doğrudur**. Yine \"Mektubu **Ayşe Teyze**me gönderdim.\" yazımı akrabalık bildirdiği için **yanlıştır**, doğrusu \"**Ayşe teyzeme**\" olmalıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Büyük harf sorularında ÖSYM iki noktada çok sık çeldirici kurar: 1. \"Haziran, Salı\" gibi takvim adlarını cümlede belirgin oldukları için büyük yazmak: Belirli bir rakamlı tarih (gün sayısı) yoksa ay ve gün adları **daima küçük** yazılır. 2. Kurum, kuruluş ve eser adlarındaki *ve, ile, de* bağlaçlarını büyük harfle başlatmak: Eser adının tamamı büyük harfli yazılmadıysa bağlaçlar küçük kalır (*Vatan yahut Silistre*)."
  },
  {
    "type": "key_points",
    "items": [
      "Ay ve gün adları belirli bir tarihe bağlıysa büyük, tek başınaysa küçük yazılır.",
      "Yön adları özel isimden önce gelirse büyük, sonra gelirse küçük yazılır.",
      "Akrabalık bildiren sözcükler unvan/lakap olmadıkça küçük harfle başlar.",
      "`Resmî Gazete` dışında gazete, dergi, il, ilçe, köy sözcükleri özel ada dahil değilse küçük yazılır."
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
  'turkce.yazim_kurallari.02',
  'Türkçe',
  'Yazım Kuralları',
  2,
  'Bölüm 2: "de", "ki", "mi"nin Yazımı ve Sayıların Yazımı',
  'Yazım kuralları testlerinin en yüksek soru payını `de/da` bağlacı, `ki` bağlacı, `mi` soru eki ve sayıların yazımı oluşturur.  Bağlaç olan `de / da` ayrı bir sözcüktür ve eklendiği sözcüğün son ünlüsüne göre yalnızca büyük ünlü uyumuna uyar (evde değil ev de, sen de, kitap da); ünsüz benzeşmesine girmez, yani hiçbir zaman `te / ta` biçiminde yazılmaz!',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Yazım kuralları testlerinin en yüksek soru payını `de/da` bağlacı, `ki` bağlacı, `mi` soru eki ve sayıların yazımı oluşturur. Bağlaç olan **`de / da`** ayrı bir sözcüktür ve eklendiği sözcüğün son ünlüsüne göre yalnızca büyük ünlü uyumuna uyar (*evde değil ev de*, *sen de*, *kitap da*); ünsüz benzeşmesine girmez, yani hiçbir zaman `te / ta` biçiminde yazılmaz! Buna karşılık bulunma durum eki olan **`-de / -da / -te / -ta`** kendisinden önceki sözcüğe bitişik yazılır ve sert ünsüzden sonra `t`ye döner (*sokakta*, *bahçede*). İkisini ayırt etmenin en kesin yolu, `de`yi cümleden çıkarıp okumaktır: Anlam bozulmuyorsa (en fazla daralıyorsa) **bağlaçtır ve ayrı yazılır**; cümle anlamsızlaşıyorsa **hâl ekidir ve bitişik yazılır**."
  },
  {
    "type": "paragraph",
    "text": "Aynı biçimde Türkçede üç farklı **`ki`** vardır: bağlaç olan `ki` ayrı yazılır (*Duydum ki unutmuşsun*), sıfat yapan `-ki` ve ilgi zamiri olan `-ki` ise ek olduğu için bitişik yazılır (*masadaki kalem*, *seninki*). Sıfat veya zamir yapan `-ki` eki istisnai birkaç sözcükte ünlü uyumuna uyarak `-kü` olur (**dünkü, bugünkü, öbürkü**); bu kelimeleri *dünki* biçiminde yazmak hatadır. Bağlaç olduğu halde kalıplaşarak bitişik yazılan yedi sözcüğü kodlamak ise sınavda büyük hız kazandırır. Soru eki **`mı / mi / mu / mü`** ise kendisinden önceki sözcükten **her zaman ayrı**, kendisinden sonra gelen kişi ve ek-fiil ekleriyle ise **bitişik** yazılır (*gelecekler mi*, *okuyor musun*)."
  },
  {
    "type": "paragraph",
    "text": "Sayıların yazımında temel kural şudur: Sayılar harfle yazıldığında her basamak ayrı yazılır (*elli beş, yüz yirmi üç*); yalnızca çek, senet gibi ticari belgelerde araya rakam veya harf eklenmesini önlemek için bitişik yazılır. Birden fazla sözcükten oluşan üleştirme sayıları rakamla değil, **mutlaka yazıyla** yazılır (*2''şer* yanlıştır, doğrusu *ikişer*dir). Saat ve dakikalar arasına iki nokta değil **tek nokta** konur (`14.30` doğrudur, `14:30` yanlıştır); sıfırla biten saatlere gelen ekler saat rakamına göre okunur (`15.00''te` doğrudur, `15.00''da` yanlıştır)."
  },
  {
    "type": "table",
    "headers": [
      "Yazım Konusu",
      "Doğru Yazım",
      "Yanlış Yazım"
    ],
    "rows": [
      [
        "`de / da`",
        "Çiçekler **bahçede** açtı. / Sen **de** gel.",
        "Çiçekler **bahçe de** açtı. / Sen **te** gel."
      ],
      [
        "`ki`",
        "**Dünkü** sınav iyiydi. / Biliyorum **ki** gelecek.",
        "**Dünki** sınav iyiydi. / Biliyorum**ki** gelecek."
      ],
      [
        "`mi`",
        "Yarın **gelecekler mi**? / Sen **miydin**?",
        "Yarın **geleceklermi**? / Sen **mi ydin**?"
      ],
      [
        "Sayılar",
        "**elli beş**, **ikişer** kalem, saat **15.00''te**",
        "**ellibeş**, **2''şer** kalem, saat **15:00''da**"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Bağlaç olduğu halde kalıplaşarak bitişik yazılan `ki`li sözcükleri **S-O-M-B-H-Ç-M-İ** harfleriyle kodla: - **S**anki - **O**ysaki - **M**ademki - **B**elki - **H**albuki - **Ç**ünkü - **M**eğerki - **İ**llaki"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Çocuklar **bahçe de** oynuyordu.\" cümlesinde \"de\" çıkarıldığında \"Çocuklar bahçe oynuyordu.\" anlamsızlaştığı için buradaki `-de` bulunma hâl ekidir ve ayrı yazılması **yanlıştır**; doğrusu \"**bahçede** oynuyordu\" biçimindedir. Aynı biçimde \"Toplantıya **ellibeş** kişi katıldı.\" ve \"Öğrencilere **2''şer** kitap verildi.\" cümleleri TDK kurallarına göre **yanlıştır**; doğruları \"**elli beş** kişi\" ve \"**ikişer** kitap\"tır. `ki` ekinde ise \"**Dünki** notları temize çektim.\" cümlesi **yanlıştır**, ünlü uyumuna giren tekil zaman sözcüğü \"**Dünkü**\" şeklinde yazılır (**doğru**)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bu bölümde üç tuzağa dikkat et: 1. Aşırı dikkatli aday her `de`yi bağlaç sanıp ayırır; mutlaka cümleden çıkarma testini yapmalısın. 2. Saatlere gelen ekleri \"sıfır sıfır\"a göre değil **saate** göre getir: `13.00''te` (on üçte) doğrudur, `13.00''da` yanlıştır. 3. Üleştirme sayılarının rakamla (`5''er`, `2''şer`) yazılması TDK Yazım Kılavuzu''na göre kesinlikle **yanlıştır**; mutlaka yazıyla (`beşer`, `ikişer`) yazılmalıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Bağlaç `de` cümleden çıkarılabilir ve asla `te/ta` olmaz; hâl eki `-de` bitişiktir.",
      "`dünkü, bugünkü, öbürkü` sözcüklerinde `-ki` eki `-kü` biçimini alır.",
      "Soru eki `mi` önceki sözcükten ayrı, kendinden sonraki eklerle bitişik yazılır.",
      "Sayılar harfle yazıldığında ayrı, üleştirme sayıları ise yalnızca yazıyla yazılır."
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
  'turkce.yazim_kurallari.03',
  'Türkçe',
  'Yazım Kuralları',
  3,
  'Bölüm 3: Birleşik Sözcüklerin Yazımı (Bitişik ve Ayrı)',
  'Birleşik sözcüklerin bitişik mi yoksa ayrı mı yazılacağı, KPSS yazım sorularının en çok hata yapılan alanıdır.  TDK''nin temel ilkesi iki başlıkta toplanır: ses olayı ve anlam değişmesi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Birleşik sözcüklerin bitişik mi yoksa ayrı mı yazılacağı, KPSS yazım sorularının en çok hata yapılan alanıdır. TDK''nin temel ilkesi iki başlıkta toplanır: **ses olayı** ve **anlam değişmesi**. İsim ile yardımcı fiil (*etmek, olmak, kılmak, eylemek*) birleşirken ilk sözcükte bir **ünlü düşmesi** veya **ünsüz türemesi** meydana geliyorsa birleşik fiil **bitişik** yazılır (*kayıp + olmak -> kaybolmak*, *sabır + etmek -> sabretmek*, *af + etmek -> affetmek*, *his + etmek -> hissetmek*, *ret + etmek -> reddetmek*). Buna karşılık ilk sözcükte hiçbir ses olayı gerçekleşmiyorsa bu birleşik fiiller **ayrı** yazılır (*yardım etmek*, *kabul etmek*, *terk etmek*, *arz etmek*, *fark etmek*, *sağ olmak*). Kurallı birleşik fiiller (*yapabilmek, gidivermek, bakakalmak, düşeyazmak*) ise istisnasız **her zaman bitişik** yazılır."
  },
  {
    "type": "paragraph",
    "text": "İsim ve sıfat tamlaması yoluyla kurulan birleşik sözcüklerde ise **anlam kayması** aranır: Sözcüklerden her ikisi veya en az ikincisi kendi gerçek anlamını kaybedip bambaşka bir varlığı karşılar hale gelmişse sözcük **bitişik** yazılır (*aslanağzı*, *hanımeli*, *kuşburnu*, *suçiçeği*, *yavruağzı*, *imambayıldı*). İkinci sözcük kendi gerçek anlamını koruyorsa sözcük **ayrı** yazılır (*köpek balığı*, *deve kuşu*, *kuru fasulye*, *kutup yıldızı*, *çevre yolu*). Ancak anlam kayması olmadığı halde gelenekleşmiş olarak bitişik yazılan belirli sözcükler de vardır (*birçok, birkaç, hiçbir, herhangi, birdenbire, biraz, bugün*). Buna karşılık *\"şey\"* sözcüğü kendisinden önceki sözcükle **daima ayrı** yazılır (*bir şey, her şey, hiçbir şey, bir şeyler*)."
  },
  {
    "type": "paragraph",
    "text": "İkilemelerin tamamı **ayrı** yazılır ve aralarına kısa çizgi veya noktalama işareti konmaz (*çoluk çocuk, ağır ağır, aşağı yukarı, baş başa, el ele, yan yana, art arda*). Yalnızca pekiştirmeler (*tertemiz, sapasağlam, güpegündüz*) bitişik yazılır."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca *alt, üst, üzeri* sözcüklerinin sona gelmesiyle kurulan birleşiklerde somut yer belirtip belirtmediğine bakılır: Soyut anlam taşıyan *akşamüstü, ayaküstü, gerçeküstü, olağanüstü, suçüstü* bitişik yazılırken; somut olarak yer bildiren *yer altı* (toprağın altı), *su altı* gibi ifadeler ayrı yazılır. Buna karşılık *altyapı, üstyapı, altgeçit, üstgeçit* gibi TDK Güncel Sözlük''te kalıplaşmış terimler bitişik yazılır. Her zaman birleşik sözcükte emin olmadığında TDK''nin \"anlam kayması veya ses olayı var mı?\" ölçütünü esas almalısın."
  },
  {
    "type": "table",
    "headers": [
      "Bitişik Yazılanlar",
      "Ayrı Yazılanlar"
    ],
    "rows": [
      [
        "**affetmek, hissetmek, kaybolmak, emretmek** (ses olayı var)",
        "**yardım etmek, kabul etmek, terk etmek, fark etmek** (ses olayı yok)"
      ],
      [
        "**birçok, birkaç, hiçbir, herhangi, biraz**",
        "**bir şey, her şey, hiçbir şey, bir şeyler**"
      ],
      [
        "**aslanağzı, hanımeli, suçiçeği, yavruağzı** (anlam değişmiş)",
        "**köpek balığı, deve kuşu, kuru fasulye, hava yolu** (2. kelime anlamını korur)"
      ],
      [
        "**tertemiz, bembeyaz, sapasağlam** (pekiştirme)",
        "**çoluk çocuk, yan yana, baş başa, art arda** (ikileme)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Yaptığı hatadan dolayı arkadaşını **af etti**.\" cümlesinde `af` sözcüğüne `etmek` gelirken ünsüz türemesi (`f -> ff`) gerçekleştiği için ayrı yazım **yanlıştır**; doğrusu \"**affetti**\" biçimindedir. Buna karşılık \"Teklifimizi memnuniyetle **kabul etti**.\" cümlesinde ses olayı olmadığı için ayrı yazım **doğrudur**. Yine \"Sınavda **bir çok** soruyu kolayca çözdüm.\" ve \"Bu konuda **hiç birşey** bilmiyorum.\" cümleleri **yanlıştır**; doğruları \"**birçok** soru\" ve \"**hiçbir şey**\" olmalıdır. İkilemelerde ise \"**çoluk-çocuk** sahile indik\" yazımı tire yüzünden **yanlıştır**, doğrusu \"**çoluk çocuk**\"tur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bitişik-ayrı yazım sorularında şu üç tuzağa dikkat et: 1. `\"Bir şeyler\"` ayrı yazıldığı için `\"birçok\"` veya `\"birkaç\"` da ayrı sanılır; oysa `şey` sözcüğü **her zaman ayrı**, `birçok, birkaç, hiçbir, herhangi` ise **her zaman bitişik** yazılır. 2. `\"İçeri, dışarı, öte, beri, sıra\"` sözcükleriyle kurulan birleşikler (`yurt içi, hafta içi, hafta sonu, peşi sıra, yanı sıra, ardı sıra`) TDK''ye göre **ayrı** yazılır; *haftasonu* veya *peşisıra* yazımı yanlıştır. 3. `\"Ev\"` sözcüğüyle kurulan birleşikler (*öğretmenevi, yayınevi, polis evi* değil *polisevi, huzurevi*) bitişik yazılırken, yol ve ulaşım türleri (*hava yolu, kara yolu, deniz yolu*) **ayrı** yazılır."
  },
  {
    "type": "key_points",
    "items": [
      "Yardımcı fiillerde ses olayı (düşme/türeme) varsa bitişik, yoksa ayrı yazılır.",
      "`şey` sözcüğü her zaman ayrı; `birçok, birkaç, hiçbir, herhangi` bitişik yazılır.",
      "İkilemeler ayrı ve tiresiz, pekiştirmeler ise bitişik yazılır.",
      "`hafta sonu, hafta içi, yurt dışı, yanı sıra, art arda` ifadeleri daima ayrı yazılır."
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
  'turkce.yazim_kurallari.04',
  'Türkçe',
  'Yazım Kuralları',
  4,
  'Bölüm 4: Kısaltmaların Yazımı, Eklerin Getirilişi ve Sık Karıştırılan Sözcükler',
  'Kısaltmalara ek getirilirken büyük harfli kısaltmalar ile küçük harfli kısaltmalar farklı kurallara uyar.  Büyük harflerle yapılan kısaltmalara getirilen eklerde kısaltmanın açılımı değil, son harfin okunuşu esas alınır (`TDK''nin`, `TBMM''ye`, `THY''de`, `ABD''den`); özellikle `K` harfi Türkçede "ka" değil "ke" diye okunduğu için `TDK''nın` veya `SGK''ya` yazmak yanlıştır, doğrusu `TDK''nin` ve `SGK''ye`dir!',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Kısaltmalara ek getirilirken **büyük harfli kısaltmalar** ile **küçük harfli kısaltmalar** farklı kurallara uyar. Büyük harflerle yapılan kısaltmalara getirilen eklerde kısaltmanın açılımı değil, **son harfin okunuşu** esas alınır (`TDK''nin`, `TBMM''ye`, `THY''de`, `ABD''den`); özellikle `K` harfi Türkçede *\"ka\"* değil **\"ke\"** diye okunduğu için `TDK''nın` veya `SGK''ya` yazmak **yanlıştır**, doğrusu `TDK''nin` ve `SGK''ye`dir! Buna karşılık kelime gibi okunan büyük harfli kısaltmalarda okunuş kelimeye göre olur (`ASELSAN''da`, `TÜBİTAK''ın`, `NATO''ya`). Küçük harfli kısaltmalara ve ölçü birimlerine ek getirilirken ise kısaltmanın değil **kelimenin tam açılımının okunuşu** esas alınır (`kg''dan`, `cm''yi`, `kr.un`, `vb.leri`). Ayrıca küçük harfli kısaltmaların sonunda nokta varsa (`vb.`, `alm.`, `dr.`) kesme işareti **kullanılmaz**; nokta yoksa ölçü birimlerinde kesme konur (`kg''dan`)."
  },
  {
    "type": "paragraph",
    "text": "Kesme işaretinin kullanılmayacağı üç önemli yer vardır: (1) Kurum, kuruluş, kurul, birleşim ve iş yeri adlarına gelen ekler kesmeyle **ayrılmaz** (*Türkiye Büyük Millet Meclisine*, *Türk Dil Kurumunun*); (2) Özel adlara gelen **yapım ekleri**, çokluk eki `-ler` ve bunlardan sonra gelen ekler kesmeyle **ayrılmaz** (*İstanbullu*, *Türkçenin*, *Atatürkçülüğün*, *Ahmetler*); (3) Sonunda 3. tekil iyelik eki bulunan özel ada başka bir iyelik eki geldiğinde kesme konmaz (*Boğaz Köprümüzün*)."
  },
  {
    "type": "paragraph",
    "text": "Düzeltme işareti (`^`) de yazım sorularında kritik bir ayrımdır: Yazılışları aynı, anlamları ve söylenişleri farklı sözcükleri ayırt etmek için (*adem* yokluk / *âdem* insan, *adet* sayı / *âdet* gelenek, *hala* babanın kız kardeşi / *hâlâ* şimdiye kadar, *kar* yağış / *kâr* kazanç) ve Arapça-Farsçadan dilimize giren sözcüklerde ince `g, k, l` seslerinden sonra gelen `a, u` ünlülerini ince okutmak için (*rüzgâr, dergâh, hikâye, kâğıt, dükkân, lâle* değil *lale*—ancak *hâl, lâzım* değil *lazım*, *kâtip, mahkûm, sükût*) kullanılır. Ayrıca nispet eki olan `-î` ile iyelik/belirtme eki `-i`yi ayırmak için (*askeri* = askerin / *askerî* okul, *resmi* = resmi / *resmî* belge, *tarihi* = tarihi / *tarihî* roman) düzeltme işareti konur. Yabancı kökenli kelimelerde ise ikiz ünsüzlere ve ünlü uyumsuzluğuna dikkat ederek *espri, stajyer, laboratuvar, rastlantı, kravat, grup (küme) / gurup (gün batımı)* yazımlarını hatasız bilmek gerekir."
  },
  {
    "type": "table",
    "headers": [
      "Sık Yanlış Yazılan Sözcük",
      "TDK Doğru Yazımı",
      "Sık Karıştırılan Nokta"
    ],
    "rows": [
      [
        "`şöför` / `süpriz` / `yalnış`",
        "**şoför** / **sürpriz** / **yanlış**",
        "Ünlü/ünsüz kayması; *yalnız* (yalın-ız), *yanlış* (yanıl-ış)"
      ],
      [
        "`herkez` / `antreman` / `orjinal`",
        "**herkes** / **antrenman** / **orijinal**",
        "*herkes* `s` ile; *orijinal* ikinci `i` ile yazılır"
      ],
      [
        "`ön yargı` / `ön söz` / `alt geçit`",
        "**önyargı** / **önsöz** / **altgeçit**",
        "TDK Güncel Sözlük''te bitişik yazılan kalıplaşmış birleşikler"
      ],
      [
        "`traş` / `egsoz` / `klavuz`",
        "**tıraş** / **egzoz** / **kılavuz**",
        "İlk hecedeki ünlüleri düşürmeden yaz (`tıraş`, `kılavuz`)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**TDK''nın** yeni sözlüğü yayımlandı.\" cümlesi `K` harfinin yanlış okunmasından dolayı **yanlıştır**; doğrusu \"**TDK''nin** yeni sözlüğü yayımlandı.\" biçimindedir. Aynı şekilde \"**Türk Dil Kurumu''nun** açıklaması\" yazımı kurum adına kesme getirildiği için **yanlıştır**, doğrusu \"**Türk Dil Kurumunun** açıklaması\"dır. Yapım ekinde ise \"**İstanbul''lu** şairler\" yazımı **yanlıştır**; `-lu` yapım eki olduğu için \"**İstanbullu** şairler\" yazılır (**doğru**). Yabancı kökenli kelimelerde \"Yeni **şöför** **herkezi** selamladı.\" cümlesi **yanlıştır**, doğrusu \"Yeni **şoför** **herkesi** selamladı.\" olmalıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Kısaltma ve yazım sorularında iki tuzağa dikkat et: 1. `K` harfini `\"ka\"` okuyarak `RTÜK''a, SGK''ya, TDK''nın` yazmak en klasik ÖSYM çeldiricisidir; doğru okunuş `\"ke\"`dir (`RTÜK''e, SGK''ye, TDK''nin`). 2. `yalnız` (yalın → yalnız) ile `yanlış` (yanıl → yanlış) sözcüklerinin kökleri karıştırılır: `yalnız`da `l` önce, `yanlış`ta `n` önce gelir!"
  },
  {
    "type": "key_points",
    "items": [
      "Büyük harfli kısaltmalarda ek, son harfin okunuşuna (`TDK''nin`); küçük harfli kısaltmalarda kelimenin açılımına (`kg''dan`) göre gelir.",
      "Kurum-kuruluş adlarına ve özel adlara gelen yapım eklerine kesme işareti konmaz.",
      "Doğru yazımlar: *şoför, herkes, sürpriz, antrenör, yanlış, yalnız, orijinal, tıraş, egzoz, kılavuz*.",
      "*Önyargı, önsöz, altgeçit* TDK sözlüğünde bitişik yazılır."
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Noktalama İşaretleri
-- Kaynak: docs/konu_anlatimi/turkce/08_noktalama_isaretleri.md
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
  'turkce.noktalama_isaretleri.01',
  'Türkçe',
  'Noktalama İşaretleri',
  1,
  'Bölüm 1: Nokta, Virgül ve Noktalı Virgül',
  'Noktalama işaretleri cümledeki anlam ilişkilerini netleştirir ve yanlış duraklamaların önüne geçer.  Nokta (.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Noktalama işaretleri cümledeki anlam ilişkilerini netleştirir ve yanlış duraklamaların önüne geçer. **Nokta (.)**, tamamlanmış cümlelerin sonuna konur; ancak ayrıca bazı kısaltmaların sonuna (`Dr.`, `Prof.`, `vb.`), sayılardan sonra sıra bildirmek için (`15.`, `II.`), yalnızca rakamla yazılan tarihlerde gün-ay-yıl arasına (`29.10.1923`) ve saat-dakika arasına (`14.30`) konur. Tarihte ay adı yazıyla belirtilmişse araya nokta konmaz (`29 Ekim 1923` doğrudur, `29. Ekim 1923` yanlıştır)."
  },
  {
    "type": "paragraph",
    "text": "**Virgül (,)**, cümlede eş görevli sözcük ve söz öbeklerini ayırmak (*ekmek, süt, yumurta*), sıralı cümleleri birbirine bağlamak (*Geldi, gördü, güldü.*), uzun cümlelerde yüklemden uzak düşmüş özneyi belirtmek, ara sözlerin ve ara cümlelerin başına-sonuna konmak, tırnak içinde olmayan aktarma cümlelerini bildirmek (*Yarın geleceğim, dedi.*), onay-ret sözlerinden (`Evet, ...`, `Hayır, ...`) ve hitaplardan (`Değerli Arkadaşlar,`) sonra kullanılmak üzere görev yapar. Buna karşılık **virgülün konmayacağı yerler** de sınavda en az konacağı yerler kadar önemlidir: `ve, veya, yahut, ya ... ya, hem ... hem` bağlaçlarından önce ve sonra, şart eki `-sa/-se`den sonra, ikilemelerin arasına, isim tamlamalarında tamlayan ile tamlanan arasına ve tek zarf-fiil ekinden (`-ıp, -arak, -ınca`) sonra virgül konmaz (ancak art arda sıralanmış birden fazla zarf-fiil varsa aralarına virgül konabilir)."
  },
  {
    "type": "paragraph",
    "text": "**Noktalı virgül (;)** ise yalnızca üç durumda kullanılır ve her zaman kendisinden önce **virgül bulunan** bir yapı gerektirir: (1) Cümle içinde virgüllerle ayrılmış tür veya takımları birbirinden ayırmak (*Erkek çocuklara Doğan, Tuğrul; kız çocuklara ise İnci, Çiçek adları verilir.*); (2) Ögeleri arasında virgül bulunan sıralı cümleleri birbirinden ayırmak (*Sevinçten, heyecandan içim içime sığmıyor; bağırmak, kahkahalar atmak istiyorum.*); (3) İkiden fazla eş değer ögesi arasında virgül bulunan cümlelerde özneden sonra konmak (*Yeni usul şiirimiz; zevksiz, köksüz, acemice görünüyordu.*)."
  },
  {
    "type": "paragraph",
    "text": "Virgül kullanımında özellikle **öbek bütünlüğü**ne dikkat etmelisin: Uzun görünen bir zaman veya yer zarfı öbeğinden sonra (*\"Dün akşam geç saatte eve geldim.\"*) cümlenin akışı kesintiye uğramadığı sürece virgül koymaya gerek yoktur; gereksiz virgül cümlenin hızını ve anlam bağını bozar. Aynı şekilde tamlama kurmuş sıfat ile isim arasına veya zarf ile fiil arasına virgül konmaz (*\"Sıcak, ekmek aldım\"* yanlıştır). Yalnızca anlam karışıklığını gidermek amacıyla (*\"Genç, doktoru dikkatle dinledi.\"*) adlaşmış sıfattan veya özneden sonra virgül kullanılması zorunludur."
  },
  {
    "type": "table",
    "headers": [
      "İşaret",
      "Doğru Kullanım",
      "Yanlış Kullanım"
    ],
    "rows": [
      [
        "Nokta",
        "**29 Ekim 1923** tarihinde / Saat **09.15''te** (TDK iki noktayı da kabul eder: *09:15''te*)",
        "**29. Ekim 1923** tarihinde"
      ],
      [
        "Virgül",
        "Masadan **ekmek, süt, yumurta** aldı.",
        "Masadan ekmek, **ve** süt aldı. / Ev **de, bahçe de** genişti."
      ],
      [
        "Noktalı Virgül",
        "Pazardan elma, armut; manavdan ıspanak, pırasa aldı.",
        "Sınavı **kazanmazsa;** bir yıl daha çalışacak. (Şarttan sonra konmaz!)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Kalemini, **ve** defterini çantasına koydu.\" cümlesinde `ve` bağlacından önce virgül konması **yanlıştır**; doğrusu \"Kalemini ve defterini çantasına koydu.\"dur. Noktalı virgülde ise \"Zamanında **gelmezse;** toplantıyı bensiz başlatın.\" cümlesi **yanlıştır**, çünkü şart bildiren `-sa/-se` yapısından sonra noktalı virgül veya virgül konmaz; doğrusu \"Zamanında gelmezse toplantıyı bensiz başlatın.\" biçimindedir. Buna karşılık \"Sabahları kitap, dergi; akşamları ise gazete, makale okurum.\" cümlesinde tür ve zaman gruplarını ayırdığı için noktalı virgül **doğru** kullanılmıştır. Tarihlerde ise \"**29. Ekim** 1923\" yazımı **yanlıştır**, ay yazıyla verildiği için \"**29 Ekim** 1923\" yazılır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Virgül ve noktalı virgül sorularında iki tuzağa dikkat et: 1. Noktalı virgül, ögeleri arasında zaten virgül bulunan sıralı cümleleri veya tür grupları ayırmak için kullanılır; *ama, fakat, ancak* gibi bağlaçlardan önce de konabilir. Virgülün yeterli olduğu basit bir sıralamada noktalı virgül kullanmak yanlıştır. 2. `\"29. Ekim 1923\"` ifadesinde 29 sıra sayısı gibi göründüğü için nokta doğru sanılabilir; oysa tarihteki gün rakamı sıra sayısı değildir, nokta konmaz!"
  },
  {
    "type": "key_points",
    "items": [
      "`ve, veya, ya da, hem ... hem` bağlaçlarından önce ve sonra virgül konmaz.",
      "Şart kipinden (`-sa/-se`) ve tek zarf-fiilden sonra virgül veya noktalı virgül kullanılmaz.",
      "Noktalı virgül yalnızca içinde virgül bulunan sıralamaları, sıralı cümleleri veya eş değer ögelerden ayrılan özneyi böler.",
      "Tarihte ay adı yazıyla verilmişse gün rakamından sonra nokta konmaz (`29 Ekim 1923`)."
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
  'turkce.noktalama_isaretleri.02',
  'Türkçe',
  'Noktalama İşaretleri',
  2,
  'Bölüm 2: İki Nokta, Üç Nokta, Soru ve Ünlem İşaretleri',
  'İki nokta (:), kendisinden sonra örnek verilecek veya açıklama yapılacak cümlelerin sonuna ve karşılıklı konuşmalarda konuşan kişiyi belirten sözlerden sonra konur.  İki noktadan sonra tam bir cümle geliyorsa büyük harfle, yalnızca birbirini izleyen örnekler sıralanıyorsa küçük harfle başlanır (Masada üç şey vardı: kalem, silgi, defter.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "**İki nokta (:)**, kendisinden sonra **örnek verilecek** veya **açıklama yapılacak** cümlelerin sonuna ve karşılıklı konuşmalarda konuşan kişiyi belirten sözlerden sonra konur. İki noktadan sonra tam bir **cümle** geliyorsa büyük harfle, yalnızca birbirini izleyen **örnekler** sıralanıyorsa küçük harfle başlanır (*Masada üç şey vardı: kalem, silgi, defter.*). Buna karşılık açıklama ya da sıralama beklemeyen sıradan özne veya zaman zarflarından sonra iki nokta konmaz (*\"Dün akşam: eve geç geldik.\"* yanlıştır)."
  },
  {
    "type": "paragraph",
    "text": "**Üç nokta (...)**, anlatım olarak tamamlanmamış (eksiltili) cümlelerin sonuna (*Karşımızda masmavi bir deniz, uzakta beyaz yelkenliler...*), kaba sayıldığı için açık yazılmak istenmeyen sözlerin yerine ve benzer örneklerin sürdüğünü göstermek için (`vb.` yerine) konur. Burada önemli kural şudur: Eğer cümlede kaç örnek verileceği önceden sayı ile belirtilmişse (*Üç temel renk vardır: sarı, kırmızı, mavi.*) cümle tamamlandığı için sonuna üç nokta değil **nokta** konur!"
  },
  {
    "type": "paragraph",
    "text": "**Soru işareti (?)**, soru eki veya soru sözcüğü içeren gerçek soru cümlelerinin sonuna konur; ayrıca bilinmeyen, kesin olmayan veya şüpheyle karşılanan tarih ve yer bilgilerinin yanına yay ayraç içinde `(?)` şeklinde getirilir (*Yunus Emre (1240?-1320)*). Buna karşılık içinde soru sözcüğü bulunsa bile soru sormayan, soruyu başkasına veya kendi içine aktaran **dolaylı soru** (bildirme) cümlelerinin sonuna soru işareti değil **nokta** konur (*\"Nereye gittiğini sordum.\"*, *\"Neden suskun olduğunu bilmiyorum.\"*). **Ünlem işareti (!)** ise sevinç, kıvanç, acı, korku, şaşma gibi duyguları anlatan cümlelerin veya seslenme-hitap sözlerinin sonuna konur; ünlem sözcüğünden hemen sonra konabileceği gibi (`Eyvah! Geç kaldık.`), cümlenin sonuna da konabilir (`Eyvah, geç kaldık!`)."
  },
  {
    "type": "paragraph",
    "text": "Soru ve ünlem işaretlerinin **yay ayraç içinde** kullanıldığı özel durumlar da testlerde sorulur: Cümle içinde bir söze alay, kinaye veya küçümseme anlamı katmak istendiğinde o sözün hemen yanına yay ayraç içinde ünlem `(!)` konur (*\"İstese bir günde bütün kitabı bitirirmiş (!) ama vakti yokmuş.\"*). Soru işareti ise birden fazla soruyu sıralayan cümlelerde her sorunun sonuna ayrı ayrı konmak yerine, virgülle ayrılan soruların en sonuna tek bir kez konabilir (*\"Çok yakından mı bu sesler, çok uzaklardan mı?\"*). İki nokta ise kendisinden sonra açıklama yapılacağını kesinleştirdiğinden, tırnaklı alıntı veya konuşma çizgisi öncesinde (*Öğretmen şöyle dedi: \"...\") mutlaka yer alır."
  },
  {
    "type": "table",
    "headers": [
      "İşaret",
      "Doğru Kullanım",
      "Yanlış Kullanım"
    ],
    "rows": [
      [
        "İki Nokta",
        "Başarının sırrı şudur**:** Düzenli çalışmaktır.",
        "**Dün akşam:** sinemaya gittik. (Açıklama yok!)"
      ],
      [
        "Üç Nokta",
        "Bahçede neler yoktu ki: papatyalar, güller**...**",
        "Bahçede iki çiçek vardı: papatya, gül**...** (Sayı belli, nokta konmalı!)"
      ],
      [
        "Soru İşareti",
        "Yarın toplantıya **katılacak mısın?**",
        "Arkadaşıma **nereye gittiğini sordum?** (Dolaylı aktarım!)"
      ],
      [
        "Ünlem",
        "**Eyvah,** yine anahtarı unuttum**!**",
        "—"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Öğretmen sınıfa girince bize **nereye gittiğimizi sordu?**\" cümlesinde soru işareti **yanlıştır**; çünkü cümle okuyucuya soru sormuyor, bir durumu haber veriyor (dolaylı soru). Doğrusu \"Öğretmen sınıfa girince bize nereye gittiğimizi sordu**.**\" biçimindedir. İki noktada ise \"**Dün akşam:** sahilde uzun süre yürüdük.\" yazımı **yanlıştır**; çünkü zaman zarfından sonra açıklama yapılmamaktadır. Buna karşılık \"Bu alanda üç önemli ilke vardır**:** doğruluk, sabır, süreklilik**.**\" cümlesinde hem iki nokta hem de sayı belirtildiği için sonda nokta kullanımı **doğrudur**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Bu dört işarette ÖSYM iki tuzağı sık kullanır: 1. İçinde `kim, ne, nereye, nasıl` geçen her cümlenin sonuna soru işareti (`?`) konmaz; cümle yüklemde soru sormak yerine bir bilgiyi aktarıyorsa (*\"Neden gelmediğini anlamadım.\"*) mutlaka **nokta** gelir. 2. `\"Sıralayacağımız iki temel kural var...\"` gibi başında sayı verilen cümlelerin sonuna üç nokta (`...`) konmaz; çünkü örnekler sayıyla sınırlandırılmıştır ve cümle bitince **nokta** konur."
  },
  {
    "type": "key_points",
    "items": [
      "İki noktadan sonra tam cümle varsa büyük, örnek sırası varsa küçük harfle başlanır.",
      "Sayı ile sınırlandırılmış örnek dizilerinin sonuna üç nokta değil nokta konur.",
      "Dolaylı soru cümlelerinin sonuna soru işareti konmaz, nokta konur.",
      "Ünlem işareti seslenme/duygu kelimesinin hemen arkasına konursa sonraki sözcük büyük harfle, virgül konup cümlenin sonuna atılırsa küçük harfle devam edilir."
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
  'turkce.noktalama_isaretleri.03',
  'Türkçe',
  'Noktalama İşaretleri',
  3,
  'Bölüm 3: Kesme İşareti ve Tırnak İşareti',
  'Kesme işareti (''), özel adlara getirilen iyelik, durum (hâl) ve bildirme (ek-fiil) gibi çekim eklerini ayırmak için kullanılır (Ankara''ya, Mehmet''in, Kurtuluş Savaşı''nı, Türkiye''dir).  Kişi adlarından sonra gelen saygı ve unvan sözlerine getirilen ekler de kesmeyle ayrılır (Ayşe Hanım''a, Ahmet Bey''in).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "**Kesme işareti ('')**, özel adlara getirilen iyelik, durum (hâl) ve bildirme (ek-fiil) gibi **çekim eklerini** ayırmak için kullanılır (*Ankara''ya, Mehmet''in, Kurtuluş Savaşı''nı, Türkiye''dir*). Kişi adlarından sonra gelen saygı ve unvan sözlerine getirilen ekler de kesmeyle ayrılır (*Ayşe Hanım''a, Ahmet Bey''in*). Ancak kesme işaretinin kullanılmadığı istisnalar KPSS''de en çok test edilen alandır: Özel adlara getirilen **yapım ekleri**, çokluk eki `-ler/-lar` ve bunlardan sonra gelen hiçbir ek kesme işaretiyle **ayrılmaz** (*İstanbullu, İstanbulluların, Türkçenin, Atatürkçülük, Ahmetlere*). Aynı biçimde **kurum, kuruluş, kurul, birleşim, oturum ve iş yeri adlarına** getirilen ekler kesme işaretiyle ayrılmaz (*Türkiye Büyük Millet Meclisine, Türk Dil Kurumunun, Atatürk Orman Çiftliğine*). Yalnızca *Avrupa Birliği* adına gelen ekler kesmeyle ayrılır (`Avrupa Birliği''ne`)."
  },
  {
    "type": "paragraph",
    "text": "**Tırnak işareti (\" \")** ise üç temel görevde kullanılır: (1) Başka bir kimseden veya yazıdan olduğu gibi **aktarılan sözleri** belirtmek (*Öğretmen: \"Notlarınızı düzenli tutun.\" dedi.*); (2) Cümlede özellikle vurgulanmak istenen sözcüğü öne çıkarmak (*Yeni dönemde \"sürdürülebilirlik\" kavramı öne çıktı.*); (3) Cümle içinde geçen eser, kitap ve makale adları ile bölüm başlıklarını göstermek (*Bugünlerde \"Kuyucaklı Yusuf\"u okuyorum.*). Tırnak içindeki alıntının sonunda bulunan nokta, soru işareti veya ünlem işareti tırnağın **içinde** kalır; tırnaktan sonra gelen ekler için ayrıca kesme işareti kullanılmaz (`\"Çalıkuşu\"nu` doğrudur, `\"Çalıkuşu\"''nu` yanlıştır)."
  },
  {
    "type": "paragraph",
    "text": "Kesme işareti konusunda birkaç önemli ayrıntı daha vardır: Birincisi, **sayılara** ve **kısaltmalara** getirilen ekler kesme işaretiyle ayrılır (*1923''te*, *TBMM''nin*, *2''nci*); ancak sonunda nokta bulunan kısaltmalara ve üs işaretli birimlere ek gelirken kesme işareti kullanılmaz (*vb.leri*, *cm³e*, *m²ye*). İkincisi, belirli bir tarih bildiren **ay ve gün adlarına** gelen ekler kesmeyle ayrılır (*29 Ekim''de*, *15 Temmuz''un*); tarih yoksa küçük yazıldığı için kesme de konmaz (*haziranda*). Üçüncüsü, şiirde ölçü gereği ses düşmesini göstermek için kesme kullanılır (*Güzelliğin on par''etmez*). Son olarak, tırnak içinde verilen bir alıntı cümlesinin içine başka bir tırnak girmesi gerektiğinde içteki söz **tek tırnak ('' '')** içine alınır (*\"Edebiyat öğretmeni ''Şiir duygu işidir.'' sözünü sıkça tekrarlardı.\"*). Ayrıca unvan kısaltmalarına gelen eklerin kesmeyle ayrıldığını unutma (`Prof. Dr. Ahmet''e`)."
  },
  {
    "type": "table",
    "headers": [
      "İşaret / Kural",
      "Doğru Yazım",
      "Yanlış Yazım"
    ],
    "rows": [
      [
        "Özel Ad + Çekim Eki",
        "**Ankara''dan**, **Mehmet''i**, **2024''te**",
        "Ankaradan, Mehmeti"
      ],
      [
        "Özel Ad + Yapım Eki",
        "**İstanbullu**, **Türkçenin**, **Atatürkçü**",
        "**İstanbul''lu**, **Türkçe''nin**, **Atatürk''çü**"
      ],
      [
        "Kurum ve Kuruluş Adı",
        "**Türk Dil Kurumunun**, **Ankara Üniversitesine**",
        "**Türk Dil Kurumu''nun**, **Ankara Üniversitesi''ne**"
      ],
      [
        "Tırnak İşareti",
        "Öğretmen, **\"Yarın erken gelin.\"** dedi.",
        "Öğretmen, **\"Yarın erken gelin\"**. dedi."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**İstanbul''lu** şairler boğazı sıkça anlatır.\" cümlesinde `-lu` yapım eki olduğu için kesme işareti kullanılması **yanlıştır**; doğrusu \"**İstanbullu** şairler\"dir. Aynı biçimde \"**Türkçe''nin** kuralları\" yazımı da yapım eki (`Türk + -çe`) bulunduğu için **yanlıştır**, doğrusu \"**Türkçenin** kuralları\"dır. Buna karşılık \"**Ankara''nın** havası\" ve \"**Elif''e** haber verdim.\" cümlelerindeki kesme kullanımları yalnızca çekim eki ayrıldığı için **doğrudur**. Tırnak işaretinde ise: `Yazar, \"Eserlerimde günlük dili kullanırım.\" diyerek yaklaşımını özetledi.` cümlesi başkasının sözünü doğrudan aktardığı için **doğrudur**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Kesme ve tırnak işaretinde iki tuzağa dikkat et: 1. Özel adların her ekini kesmeyle ayırmak en yaygın hatadır: Özel ada önce **yapım eki** (`-lı, -lık, -cı, -ça`, `-gil`) gelmişse, ondan sonra gelen çekim ekleri de dâhil **hiçbir ek kesmeyle ayrılmaz** (*İzmirlilerin, Mehmetgilin, Türkçeden*). Buna karşılık özel ada doğrudan gelen çoğul eki `-ler` bir çekim ekidir ve **kesmeyle ayrılır** (*Ahmet''ler, Yunus Emre''ler*). 2. Tırnak içindeki her söz aktarma değildir! Vurgulama veya eser adı amacıyla tırnağa alınan tek sözcükler (*\"özgürlük\" kavramı*) aktarma cümlesi sayılmaz."
  },
  {
    "type": "key_points",
    "items": [
      "Özel ada gelen yalnızca **çekim ekleri** kesmeyle ayrılır; yapım ekleri ve `-ler` ayrılmaz.",
      "Kurum, kuruluş ve iş yeri adlarına gelen ekler (`Avrupa Birliği''ne` hariç) kesmeyle ayrılmaz.",
      "Tırnak içindeki alıntı cümlesinin noktalama işareti tırnağın içinde kalır.",
      "Tırnak kapatıldıktan sonra sözcüğe ek gelirse yeniden kesme işareti konmaz (`\"Sinekli Bakkal\"ı`)."
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
  'turkce.noktalama_isaretleri.04',
  'Türkçe',
  'Noktalama İşaretleri',
  4,
  'Bölüm 4: Kısa Çizgi, Uzun Çizgi, Yay Ayraç ve Eğik Çizgi',
  'Cümle içi ayraçlar ve yardımcı işaretler yazının düzenini sağlar.  Kısa çizgi (-), satıra sığmayan kelimeleri hecelerinden bölerken satır sonuna, cümle içindeki ara söz ve ara cümlelerin başına ve sonuna (virgül yerine), kelimelerin kök ve eklerini ayırırken (`göz-lük-çü`), `arasında, ve, ile, -den ...',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümle içi ayraçlar ve yardımcı işaretler yazının düzenini sağlar. **Kısa çizgi (-)**, satıra sığmayan kelimeleri hecelerinden bölerken satır sonuna, cümle içindeki **ara söz ve ara cümlelerin** başına ve sonuna (virgül yerine), kelimelerin kök ve eklerini ayırırken (`göz-lük-çü`), `arasında, ve, ile, -den ... -e` anlamlarını vermek için iki sözcük veya sayı arasına (`Ankara-İstanbul yolu`, `1919-1923`) konur. Buna karşılık ikilemelerin arasına kısa çizgi konması kesinlikle yanlıştır (*aşağı-yukarı* yanlıştır, *aşağı yukarı* doğrudur)."
  },
  {
    "type": "paragraph",
    "text": "**Uzun çizgi (—)**, yalnızca satır başında konuşmaları göstermek amacıyla kullanılan **konuşma çizgisi**dir; ancak konuşmalar tırnak içinde verilmişse uzun çizgiye gerek kalmaz. **Yay ayraç ( )**, cümledeki anlamı tamamlayan ek bilgileri, yabancı sözcüklerin okunuşunu veya bir sözcüğün eş anlamlısını göstermek, ayrıca alıntıların kaynağını ve tiyatro metinlerinde konuşanın hareketlerini belirtmek için kullanılır (*Sıfatlar (ön adlar) isimleri niteler.*). **Eğik çizgi (/)** ise yan yana yazılan şiir dizelerinin arasına, adres yazımında apartman ile daire numarası ve ilçe ile il arasına (`Çankaya / Ankara`), tarihlerde gün-ay-yıl arasına (`12/05/2025`) ve genel ağ adreslerine konur."
  },
  {
    "type": "paragraph",
    "text": "Ek olarak satır sonunda sözcüklerin kısa çizgiyle bölünmesi sırasında iki kurala dikkat edilmelidir: Birincisi, tek harfli heceler satır başında veya satır sonunda yalnız bırakılmaz (*a-raba* biçiminde satır sonunda `a-` tek başına kalamaz; *ara-ba* diye bölünür). İkincisi, kesme işareti satır sonuna geldiğinde yalnızca kesme işareti kullanılır, ayrıca kısa çizgi konmaz! Dil bilgisinde fiil kök ve gövdelerini göstermek için sonuna konan kısa çizgi (*gel-, yazdır-*) ile eklerin başına konan kısa çizgi (*-lık, -ci*) de kısa çizginin düzenli kullanım alanlarıdır. Yay ayraç içindeki açıklamalar ise cümleden çıkarıldığında cümlenin gramer yapısını bozmamalıdır. Ayrıca yay ayraç içinde yay ayraç kullanılması gerektiğinde dıştaki parantez **köşeli ayraç ([ ])** olarak açılır (*[Halikarnas Balıkçısı (Cevat Şakir Kabaağaçlı) 1890-1973]*). Son olarak telefon numaralarında alan kodları, saat ve adres bölütleri yazılırken TDK kurallarına uygun ayraç seçilmelidir."
  },
  {
    "type": "table",
    "headers": [
      "İşaret",
      "Temel Görev",
      "Doğru Örnek"
    ],
    "rows": [
      [
        "Kısa Çizgi (`-`)",
        "Ara söz, kök-ek ayırma, \"ile/arasında\"",
        "Bu konuyu **-**inanın bana**-** çok önemsiyorum. / `1920-1923`"
      ],
      [
        "Uzun Çizgi (`—`)",
        "Satır başı konuşma çizgisi",
        "**—** Yarın erken gelecek misin?"
      ],
      [
        "Yay Ayraç (`( )`)",
        "Ek açıklama, eş anlamlı, tiyatro hareketi",
        "Zarflar **(belirteçler)** fiilleri etkiler."
      ],
      [
        "Eğik Çizgi (`/`)",
        "Yan yana dizeler, adres, tarih",
        "Korkma, sönmez bu şafaklarda yüzen al sancak **/** Sönmeden..."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Dört yardımcı işaretin temel anahtar sözcüklerini **K-U-Y-E** şeklinde eşleştir: - **K**ısa çizgi: **K**ök-ek ve ara söz - **U**zun çizgi: **U**zun satır başı konuşması - **Y**ay ayraç: **Y**an/ek bilgi ve eş anlam - **E**ğik çizgi: **E**zgili dizeler ve adres/tarih"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Dün **çoluk-çocuk** parka gittik.\" cümlesinde ikilemenin arasına kısa çizgi konması **yanlıştır**; doğrusu \"Dün **çoluk çocuk** parka gittik.\" biçimindedir. Ara sözde ise \"Memleketimi **-**büyüdüğüm o küçük kasabayı**-** çok özledim.\" cümlesinde ara sözün hem başına hem sonuna kısa çizgi konması **doğrudur** (yalnızca bir tarafına koyup diğer tarafını virgülle kapatmak **yanlıştır**). Yay ayraçta ise \"Edebiyatımızda **destan (epope)** türü köklü bir geçmişe sahiptir.\" kullanımı eş anlam bildirdiği için **doğrudur**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yardımcı noktalama işaretlerinde iki yaygın hataya dikkat et: 1. Ara sözlerin başında kısa çizgi kullanıp sonunda virgül kullanmak ya da tersini yapmak yanlıştır: Ara söz ya **iki virgül** arasında ya da **iki kısa çizgi** arasında gösterilmelidir. 2. Konuşma çizgisi (`—`) ile ara söz kısa çizgisi (`-`) karıştırılır: Konuşma çizgisi satır başında konuşmayı başlatır ve cümle sonundaki gibi tekrarlanmaz; ara sözde ise kısa çizgi simetrik olarak başta ve sonda yer alır."
  },
  {
    "type": "key_points",
    "items": [
      "Ara sözler yalnızca iki virgül veya iki kısa çizgi arasında gösterilir; ikisi karıştırılmaz.",
      "İkilemelerin arasına kısa çizgi veya virgül konmaz.",
      "Uzun çizgi konuşma çizgisidir; tırnak içinde verilen konuşmalarda kullanılmaz.",
      "Şiir dizeleri yan yana yazıldığında aralarına eğik çizgi (`/`) konur."
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Cümlenin Ögeleri ve Cümle Türleri
-- Kaynak: docs/konu_anlatimi/turkce/09_cumlenin_ogeleri_ve_cumle_turleri.md
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
  'turkce.cumlenin_ogeleri_ve_cumle_turleri.01',
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  1,
  'Bölüm 1: Temel Ögeler (Yüklem ve Özne)',
  'Cümleyi ögelerine ayırırken izlenmesi gereken tek sağlıklı yöntem, ögeleri belirli bir sırayla bulmaktır.  İlk ve en önemli kural söz öbeklerinin bölünmemesidir: İsim tamlamaları, sıfat tamlamaları, deyimler, birleşik fiiller (yardım etmek, göze almak) ve fiilimsi grupları tek bir öge sayılır; hiçbir zaman parçalanmaz.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümleyi ögelerine ayırırken izlenmesi gereken tek sağlıklı yöntem, ögeleri belirli bir sırayla bulmaktır. İlk ve en önemli kural **söz öbeklerinin bölünmemesidir**: İsim tamlamaları, sıfat tamlamaları, deyimler, birleşik fiiller (*yardım etmek, göze almak*) ve fiilimsi grupları tek bir öge sayılır; hiçbir zaman parçalanmaz. Cümlenin temel direği olan **yüklem**, cümledeki yargıyı, işi veya durumu bildiren çekimli fiil ya da ek-fiil almış isim soylu sözcüktür. Cümlede birden fazla söz öbeği olsa bile önce yüklemi doğru tespit etmeden diğer ögeleri aramaya geçmemelisin."
  },
  {
    "type": "paragraph",
    "text": "Yüklemi bulduktan sonra ikinci adım **özne**yi bulmaktır. Özne, yüklemin bildirdiği işi yapan veya yüklemin bildirdiği durumda olan varlıktır; yükleme **\"Kim?\"** ve **\"Ne?\"** (fiil cümlelerinde *\"Yapan kim / olan ne?\"*) soruları sorularak bulunur. Özne cümlede dört farklı biçimde görünebilir: (1) Cümlede açıkça yazılmış olan **gerçek özne** (*Öğrenciler erken geldi.*); (2) Cümlede yazılmayıp yüklemin kişi ekinden anlaşılan **gizli özne** (*Yarın erken kalkacağım.* → Ben); (3) Edilgen çatılı fiillerde işi yapan belli olmadığı için işten etkilenen nesnenin özne yerine geçmesiyle oluşan **sözde özne** (*Pencere rüzgârdan açıldı.* — pencere işi kendi yapmaz, etkilenir); (4) Edilgen cümlede `tarafından` veya `-ca/-ce` ile belirtilen **örtülü özne** (*Yol belediyece temizlendi.*). Gizli özne cümlenin öge sıralamasında ve öge sayısında sayılmaz!"
  },
  {
    "type": "paragraph",
    "text": "Özne ve yüklemi bulurken özellikle **fiilimsi öbeklerine** ve **bağlaçlarla bağlanan eş görevli ögelere** dikkat etmelisin: Bir özne tek bir sözcükten oluşabileceği gibi, beş altı sözcüklük bir sıfat tamlamasından veya isim-fiil grubundan da oluşabilir (*\"Sabahları düzenli yürüyüş yapmak sağlığımızı korur.\"* cümlesinde özne yalnızca *\"yapmak\"* değil, *\"Sabahları düzenli yürüyüş yapmak\"* öbeğinin tamamıdır). Ayrıca ek-fiilin geniş zamanı (`-dır`) isim yüklemlerinde düştüğünde yüklemi gözden kaçırmamak için cümlenin yargı bildiren son ismine `-dır` getirerek kontrol yapabilirsin. Devrik cümlelerde ise yüklem başta veya ortada olabileceği için cümleyi önce kurallı (yüklem sonda) hale getirip ögeleri ondan sonra ayırmak, tamlama ve tümleç sınırlarını karıştırmanı kesinlikle önler."
  },
  {
    "type": "table",
    "headers": [
      "Özne Türü",
      "Nasıl Bulunur?",
      "Örnek Cümle"
    ],
    "rows": [
      [
        "Gerçek (Açık) Özne",
        "Cümlede açıkça yer alır; işi yapar",
        "**Yolcu**, çantasını bagaja yerleştirdi."
      ],
      [
        "Gizli Özne",
        "Cümlede yok; yüklemdeki kişi ekinden anlaşılır",
        "Yarın erkenden yola **çıkacağız**. (**Biz**)"
      ],
      [
        "Sözde Özne",
        "Edilgen fiilde (`-l/-n`) işten etkilenen varlıktır",
        "**Camlar** sabah erkenden **silindi**."
      ],
      [
        "Örtülü Özne",
        "Edilgen cümlede `tarafından / -ca` ile verilir",
        "Karar **kurul tarafından** onaylandı."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Öge bulma sırasını her cümlede aynı düzenle, **Y-Ö-N** sırasıyla uygula: - **Y**üklem (ilk önce bulunur, öbek bölünmez) - **Ö**zne (yükleme \"kim / ne?\" sorulur) - **N**esne ve **T**ümleçler (özne bulunduktan sonra sorulur; böylece belirtisiz nesne özneyle karışmaz!)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özne ve yüklem çözüm örneği: \"**Yarın** erken kalkacağım.\" cümlesinde \"yarın\" sözcüğü cümlenin başında yer alsa da özne değildir (**yanlış**); çünkü yükleme sorulan \"Ne zaman?\" sorusuna yanıt veren **zarf tümleci**dir, bu cümlenin öznesi yüklemin kişi ekinden anlaşılan **gizli özne** (*ben*)''dir (**doğru**). Yine \"Rüzgârın etkisiyle **pencere** aniden **açıldı**.\" cümlesinde `açıl-` edilgen fiilinin öznesi olan *pencere* eylemi kendi başına yapmadığı için **sözde özne**dir. Yüklemde öbek bölünmemesi için ise \"Ankara, Türkiye''nin en düzenli şehirlerinden biridir.\" cümlesinde yüklem yalnızca \"biridir\" değil, **\"Türkiye''nin en düzenli şehirlerinden biridir\"** öbeğinin tamamıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Temel öge sorularında iki tuzağa dikkat et: 1. **Belirtisiz nesne** ile **özne** aynı soruya (\"Ne?\") yanıt verir! Bu yüzden önce mutlaka **özneyi** bul, sonra nesneyi sor; aksi halde \"Masada kitap duruyor.\" cümlesindeki *kitap* öznesini nesne sanabilirsin. 2. Cümlenin en başında bulunan zaman veya yer sözcüklerini (`Yarın`, `Sabahları`, `Burada`) otomatik olarak özne kabul etme; her zaman yükleme doğru soruyu sor."
  },
  {
    "type": "key_points",
    "items": [
      "Cümlenin ögeleri **Yüklem → Özne → Nesne → Tümleçler** sırasıyla bulunur.",
      "Tamlamalar, deyimler, birleşik fiiller ve fiilimsi öbekleri asla bölünmez.",
      "Gizli özne cümlede yazılı olmadığı için öge dizilişinde ve öge sayısında sayılmaz.",
      "Edilgen çatılı cümlelerde özne **sözde özne**dir."
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
  'turkce.cumlenin_ogeleri_ve_cumle_turleri.02',
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  2,
  'Bölüm 2: Yardımcı Ögeler (Nesne, Dolaylı Tümleç, Zarf Tümleci, Edat Tümleci)',
  'Temel ögeler bulunduktan sonra yüklemi anlam bakımından tamamlayan yardımcı ögelere geçilir.  Yüklemin bildirdiği işten doğrudan etkilenen varlık nesnedir ve ikiye ayrılır: Belirtme hâl ekini (`-i/-ı/-u/-ü`) alarak yüklemin "Neyi?',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Temel ögeler bulunduktan sonra yüklemi anlam bakımından tamamlayan yardımcı ögelere geçilir. Yüklemin bildirdiği işten doğrudan etkilenen varlık **nesne**dir ve ikiye ayrılır: Belirtme hâl ekini (`-i/-ı/-u/-ü`) alarak yüklemin **\"Neyi? Kimi?\"** sorularını yanıtlayan **belirtili nesne** (*Yemeği pişirdi*, *Çantasını yerleştirdi*); hiç ek almadan özne bulunduktan sonra yüklemin **\"Ne?\"** sorusunu yanıtlayan **belirtisiz nesne** (*Bahçeden çiçek topladı*)."
  },
  {
    "type": "paragraph",
    "text": "Yüklemin yerini, yöneldiği veya ayrıldığı noktayı bildiren ve mutlaka `-e, -de, -den` hâl eklerinden birini alan ögeye **dolaylı tümleç (yer tamlayıcısı)** denir; yükleme sorulan **\"Kime, kimde, kimden? / Neye, neyde, neden? / Nereye, nerede, nereden?\"** sorularıyla bulunur. Yüklemin zamanını, durumunu, sebebini, miktarını veya yönünü bildiren öge ise **zarf tümleci**dir; **\"Nasıl, ne zaman, niçin, ne kadar, nereye (eksiz)?\"** sorularına yanıt verir. Bazı kaynaklarda *\"ne ile, kiminle, ne için\"* sorularının yanıtına **edat tümleci** dense de **ÖSYM''nin yerleşik yaklaşımı** edat tümleçlerini çoğunlukla **zarf tümleci** içinde değerlendirmektedir; ancak şıklarda edat tümleci açıkça verilmişse *\"ile / için\"* öbeğini ayrı düşünmen gerekir. Ayrıca cümlede öge dışında kalan seslenme ve bağlaçlar (*Arkadaşlar*, *bence*, *yani*) **cümle dışı unsur**dur."
  },
  {
    "type": "paragraph",
    "text": "Cümlede **vurgu** ise kural olarak fiil cümlelerinde yüklemden **bir önceki** ögede, isim cümlelerinde yüklemin **kendisinde**, devrik fiil cümlelerinde de yüklem başta değilse yine yüklemden bir önceki ögede (yüklem en baştaysa yüklemde) bulunur; soru sözcüğü içeren cümlelerde ise vurgu soru sözcüğündedir."
  },
  {
    "type": "paragraph",
    "text": "Sınavda sık gelen bir diğer soru kalıbı **\"Soru aşağıdaki ögelerden hangisini buldurmaya yöneliktir?\"** sorusudur. Bu soruyu çözmenin en pratik yolu soruya **tek cümlelik kısa bir yanıt** vermektir: Verdiğin yanıt hangi ögeyse soru o ögeyi buldurmaya yöneliktir. Örneğin *\"Bu kitabı sana kim verdi?\"* sorusuna *\"Ali verdi.\"* yanıtını verirsin; *Ali* özne olduğu için soru **özneyi** buldurur. Eğer cümlede `mı / mi` soru edatı varsa, soru edatı **hangi ögeden hemen sonra** gelmişse o ögeyi vurgular ve buldurmaya yöneliktir (*\"Sen mi geldin?\"* → özne; *\"Dün mü geldin?\"* → zarf tümleci). Ara sözler ise açıkladıkları ögenin içinde sayılır. Eğer ara söz herhangi bir ögeyi açıklamıyor, yalnızca konuşanın ek yorumunu veya duygusunu veriyorsa (örneğin *\"Bu konuyu —inanın bana— çok önemsiyorum.\"*) o zaman **cümle dışı unsur** kabul edilir."
  },
  {
    "type": "table",
    "headers": [
      "Yardımcı Öge",
      "Soruları",
      "Örnek"
    ],
    "rows": [
      [
        "Belirtili Nesne",
        "Neyi? Kimi? (Mutlaka `-i` eki alır)",
        "Annem **yemeği** erkenden hazırladı."
      ],
      [
        "Belirtisiz Nesne",
        "Ne? (Özneden sonra sorulur, ek almaz)",
        "Kitapçıdan iki **roman** aldım."
      ],
      [
        "Dolaylı Tümleç",
        "Kime, kimde, kimden / Nereye, nerede, nereden (`-e,-de,-den`)",
        "Yolcu çantasını **bagaja** koydu. / **Arkadaşıma** verdim."
      ],
      [
        "Zarf Tümleci",
        "Nasıl, ne zaman, niçin, ne kadar, nereye (eksiz)",
        "Çantasını **aceleyle** yerleştirdi. / **Dün** geldi."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Öge çözümlemesi: \"**Yolcu, çantasını aceleyle bagaja yerleştirdi.**\" cümlesini sırayla çözelim: `yerleştirdi` (**yüklem**); yerleştiren kim? → `Yolcu` (**özne**); neyi yerleştirdi? → `çantasını` (**belirtili nesne**); nasıl yerleştirdi? → `aceleyle` (**zarf tümleci**); nereye yerleştirdi? → `bagaja` (**dolaylı tümleç**). Bu cümlede **belirtisiz nesne yoktur** (**doğru**). Yine \"Kitabı **arkadaşıma** verdim.\" cümlesinde `kitabı` **belirtili nesne**, `arkadaşıma` **dolaylı tümleç**tir; cümlede zarf tümleci yoktur. Buna karşılık \"**Bahçeye** çıktı.\" cümlesindeki `bahçeye` sözcüğünü `-e` hâl eki aldığı halde belirtili nesne saymak **yanlıştır**; çünkü `-e/-de/-den` ekleri nesne değil **dolaylı tümleç** kurar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yardımcı ögelerde iki klasik tuzağa dikkat et: 1. `-de` ve `-den` eki alan her sözcük dolaylı tümleç değildir! Cümleye zaman veya neden anlamı katıyorsa (*Sabah**ta** kalktı*, *Korku**dan** sustu*, *Sıcak**tan** bunaldı*) **\"Ne zaman / Niçin?\"** sorularına yanıt verdiği için **zarf tümleci** olur! 2. Yer-yön sözcükleri (`içeri, dışarı, aşağı, yukarı`) ek almadan kullanılırsa **zarf tümleci** (*İçeri girdi*), `-e/-de/-den` eki alırsa **dolaylı tümleç** (*İçeriye girdi*) olur."
  },
  {
    "type": "key_points",
    "items": [
      "Belirtili nesne `-i` eki alır; dolaylı tümleç mutlaka `-e, -de, -den` eklerinden birini alır.",
      "`-de / -den` eki zaman veya sebep bildiriyorsa dolaylı tümleç değil zarf tümleci kurar.",
      "Cümlede vurgu kurallı fiil cümlelerinde yüklemden bir önceki ögededir.",
      "Hitaplar ve bağlaçlar cümle dışı unsur sayılır, öge dizilişine katılmaz."
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
  'turkce.cumlenin_ogeleri_ve_cumle_turleri.03',
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  3,
  'Bölüm 3: Yüklemin Türüne, Yerine ve Anlamına Göre Cümleler',
  'Cümle türleri dört ana ölçüte göre sınıflandırılır: yüklemin türüne, ögelerin dizilişine (yerine), anlamına ve yapısına göre.  Yüklemin türüne göre cümleler ikiye ayrılır: Yüklemi çekimli bir eylem olan fiil (eylem) cümlesi (Dün akşam erkenden eve geldik) ve yüklemi ek-fiil almış isim, zamir, edat veya fiilimsi olan isim (ad) cümlesi (Burası kentin en güzel yeridir, Tek amacım başarmaktır).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümle türleri dört ana ölçüte göre sınıflandırılır: **yüklemin türüne**, **ögelerin dizilişine (yerine)**, **anlamına** ve **yapısına** göre. Yüklemin türüne göre cümleler ikiye ayrılır: Yüklemi çekimli bir eylem olan **fiil (eylem) cümlesi** (*Dün akşam erkenden eve geldik*) ve yüklemi ek-fiil almış isim, zamir, edat veya **fiilimsi** olan **isim (ad) cümlesi** (*Burası kentin en güzel yeridir*, *Tek amacım başarmaktır*). Burada çok kritik bir kural vardır: Yüklemi fiilimsi (`-mak, -an, -acak`) olan cümleler fiil gibi görünse de sözcük türü bakımından fiilimsiler isim soylu sayıldığı için **isim cümlesi** kabul edilir! Ayrıca sesteş köklü kelimelere dikkat etmelisin: *\"Bahçedeki otları yoldum.\"* fiil cümlesiyken, *\"Burası uzun bir yoldu.\"* isim cümlesidir."
  },
  {
    "type": "paragraph",
    "text": "Yüklemin yerine (dizilişine) göre cümleler üçe ayrılır: Yüklemi sonda bulunan **kurallı (düz) cümle**, yüklemi başta veya ortada bulunan **devrik cümle** (*Geldim sonunda eve*) ve yüklemi söylenmeyip okuyucunun zihnine bırakılan **eksiltili cümle** (*Karşımızda masmavi bir gökyüzü...*). Anlamına göre cümlelerde ise **biçim** ile **anlam** arasındaki farka bakılır: Hem biçimce hem anlamca **olumlu** (*Seni anlıyorum*), biçimce olumlu ama **anlamca olumsuz** (*Ne aradı ne sordu* = aramadı, sormadı; *Sanki seni dinleyecek* = dinlemeyecek), biçimce olumsuz ama **anlamca olumlu** (*Seni bilmiyor değilim* = biliyorum)."
  },
  {
    "type": "paragraph",
    "text": "Anlamına göre cümlelerde ayrıca **soru cümlesi**, **ünlem cümlesi**, **emir cümlesi** ve **koşul cümlesi** başlıkları da görülür. Burada **gerçek soru cümlesi** ile yanıt beklemeyen **sözde soru cümlesini** (*\"Ben senin iyiliğini istemez miyim?\"* = isterim) ayırmak gerekir. İsim cümlelerinde ise yüklem bazen **ikileme** veya **edat öbeği** olabilir (*\"Her yer pırıl pırıldı.\"*, *\"O da herkes gibiydi.\"*): Bu cümlelerde yüklem çekimli fiil olmadığı için tamamı **isim cümlesi** sayılır. Cümlede `yok` ve `değil` sözcükleri yüklemde yer aldığında cümleyi hem isim cümlesi hem de anlamca olumsuz yapar (*\"Vaktim yok.\"*)."
  },
  {
    "type": "paragraph",
    "text": "Öge dizilişi açısından devrik cümleler genellikle günlük konuşma dilinde ve şiirde anlatımı canlandırmak için tercih edilir; sınavda *\"Hangisi kurallıdır?\"* diye sorulduğunda yalnızca yüklemin en sonda bulunup bulunmadığına bakmalısın. Eksiltili cümlelerde ise okuyucu yüklemi zihninden tamamlayabildiği için cümlenin sonuna üç nokta konur. Olumsuzluk testinde de biçimce olumlu-olumsuz ayrımını mutlaka anlamla birlikte değerlendir; özellikle `ne ... ne` bağlacının yüklemi olumlu bırakıp anlamı olumsuzlaştırdığını unutma."
  },
  {
    "type": "table",
    "headers": [
      "Sınıflandırma",
      "Alt Tür",
      "Örnek Cümle"
    ],
    "rows": [
      [
        "Yüklemin Türü",
        "İsim Cümlesi / Fiil Cümlesi",
        "Burası en güzel **yeridir** (İsim) / Çantasını **yerleştirdi** (Fiil)"
      ],
      [
        "Öge Dizilişi",
        "Kurallı / Devrik / Eksiltili",
        "**Geldim** sonunda eve. (Devrik) / Ufukta kızıl bir güneş... (Eksiltili)"
      ],
      [
        "Anlamı",
        "Biçimce Olumlu - Anlamca Olumsuz",
        "Ne seni **aradı** ne halini **sordu**. (Aramadı, sormadı)"
      ],
      [
        "Anlamı",
        "Biçimce Olumsuz - Anlamca Olumlu",
        "Bu konuyu **bilmiyor değilim**. (Biliyorum)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"Burası şehrin en sakin **yeridir**.\" cümlesi betimleme havası taşısa da yüklemi ek-fiil almış bir isim tamlaması olduğu için **isim cümlesidir** (**doğru**); bunu fiil cümlesi saymak **yanlıştır**. Yine \"Onun tek isteği bu sınavı **kazanmaktı**.\" cümlesinde yüklem `-mak` isim-fiil ekiyle kurulduğu için bu cümle de **isim cümlesi**dir. Devrik cümlede ise \"**Geldim** sonunda eve.\" cümlesi kısa olmasına rağmen yüklem en başta bulunduğu için **devrik**tir; çünkü devrikliği belirleyen cümlenin uzunluğu değil yüklemin sonda olmamasıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Cümle türlerinde iki yaygın yanılgıya dikkat et: 1. Olumsuzluk kavramını duyguya göre değerlendirmek: *\"Dün sevdiğim arkadaşım kaza geçirdi.\"* cümlesi üzücü bir olayı anlatsa da eylem gerçekleştiği ve yüklemde olumsuzluk eki olmadığı için dil bilgisi bakımından **olumlu cümle**dir! 2. Yüklemi fiilimsi olan cümleleri (*\"En sevdiği etkinlik kitap okumaktı.\"*) fiil cümlesi sanmak: Fiilimsiler çekimli fiil olmadığı için yüklemde yer aldıklarında **isim cümlesi** kurarlar."
  },
  {
    "type": "key_points",
    "items": [
      "Yüklemi ek-fiil almış isim, zamir veya fiilimsi olan cümleler **isim cümlesidir**.",
      "Yüklemi sonda olmayan her cümle devrik cümledir.",
      "Olumluluk-olumsuzluk duygusal anlama göre değil, eylemin/durumun gerçekleşip gerçekleşmediğine göre belirlenir.",
      "`\"Ne ... ne\"` bağlacı biçimce olumlu görünen cümleyi anlamca olumsuz yapar."
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
  'turkce.cumlenin_ogeleri_ve_cumle_turleri.04',
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  4,
  'Bölüm 4: Yapısına Göre Cümleler (Basit, Birleşik, Sıralı, Bağlı)',
  'Cümlenin yapısı sorulduğunda, cümlede kaç tane yüklem (temel yargı) ve kaç tane yan cümlecik (fiilimsi vb. ) bulunduğuna bakılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümlenin **yapısı** sorulduğunda, cümlede kaç tane yüklem (temel yargı) ve kaç tane yan cümlecik (fiilimsi vb.) bulunduğuna bakılır. Yapısına göre cümleler dörde ayrılır:"
  },
  {
    "type": "paragraph",
    "text": "1. **Basit Cümle:** İçinde yalnızca **tek yüklem** bulunan ve hiç fiilimsi (yan cümlecik) taşımayan cümledir (*Sabah erkenden sıcak çayı yudumladık.*). Bir cümlenin çok uzun olması veya içinde birden çok tamlama bulunması onu birleşik yapmaz; fiilimsi yoksa o cümle yine basittir. 2. **Birleşik Cümle:** Tek bir temel yüklemin yanında en az bir **yan cümlecik** bulunduran cümledir. Dört alt türü vardır: İçinde en az bir **fiilimsi** bulunan **girişik birleşik cümle** (*Gelip geçenler bu çeşmeden su içerdi.*); şart kipi (`-sa/-se`) taşıyan **şartlı birleşik cümle** (*Çalışırsan başarırsın.*); `ki` bağlacıyla iki yargıyı bağlayan **ki''li birleşik cümle** (*Duydum ki bizi unutmuşsun.*); bir cümlenin başka bir cümle içinde alıntı olarak yer aldığı **iç içe birleşik cümle** (*Öğretmen: \"Hemen başlayın.\" dedi.*). 3. **Sıralı Cümle:** Kendi başına yargı bildiren en az iki cümlenin (yüklemin) birbirine **virgül (,) veya noktalı virgül (;)** ile bağlanmasıdır (*Eve geldi, çantasını bıraktı, dinlendi.*). İki yüklem ortak bir özne veya tümleç paylaşıyorsa **bağımlı sıralı**, her yüklemin ögeleri ayrıysa **bağımsız sıralı** cümle olur. 4. **Bağlı Cümle:** En az iki yüklemin (cümlenin) birbirine **`ve, ama, fakat, çünkü, ancak, hem ... hem`** gibi bir **bağlaçla** bağlanmasıdır (*Çok çalıştı ama istediği sonucu alamadı.*). Burada bağlacın sözcükleri değil, mutlaka **yüklemleri** bağlaması şarttır!"
  },
  {
    "type": "paragraph",
    "text": "Sıralı ve bağlı cümlelerde **bağımlı** ve **bağımsız** ayrımı da önemli bir ölçüttür: İki yüklem arasında özne, nesne veya tümleçlerden en az biri ortaksa **bağımlı sıralı/bağlı** (*\"Annem meyveleri yıkadı, [annem meyveleri] masaya koydu.\"*), her cümlenin kendi ögeleri ayrıysa **bağımsız sıralı/bağlı** (*\"Güneş açtı, kuşlar ötmeye başladı.\"*) olur. Ayrıca `iç içe birleşik cümle` ile `dolaylı aktarım` arasındaki ince farka bakmalısın: *\"Öğretmen: ''Hemen gelin.'' dedi.\"* tırnaklı alıntı iç içe birleşiktir; *\"Öğretmen hemen gelmemizi istedi.\"* ise fiilimsi taşıdığı için girişik birleşiktir. Yapı sorularında önce cümledeki çekimli yüklem sayısını saymak her zaman en hızlı yoldur."
  },
  {
    "type": "table",
    "headers": [
      "Cümle Yapısı",
      "Yüklem / Yan Cümlecik Ölçütü",
      "Örnek"
    ],
    "rows": [
      [
        "Basit",
        "1 yüklem, fiilimsi **yok**",
        "Uzun ince yollardan akşam **geçtik**."
      ],
      [
        "Girişik Birleşik",
        "1 yüklem + en az 1 **fiilimsi**",
        "**Gelip geçenler** bu eski çeşmeden su **içerdi**."
      ],
      [
        "Sıralı",
        "En az 2 yüklem + **virgül / noktalı virgül**",
        "Kapıyı **açtı**, içeri **girdi**, ışığı **yaktı**."
      ],
      [
        "Bağlı",
        "En az 2 yüklem + **bağlaç**",
        "Erken **yola çıktı** **fakat** trene **yetişemedi**."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**Gelip geçenler** bu eski çeşmeden su **içerdi**.\" cümlesi tek yüklemli görünse de içinde zarf-fiil (`gelip`) ve sıfat-fiil (`geçenler`) bulunduğu için basit değil **girişik birleşik cümle**dir (**doğru**). Yine \"Ödevini **bitiren** öğrenci dışarı çıktı.\" cümlesi `bitiren` sıfat-fiilinden dolayı **birleşik**tir. Buna karşılık \"Masadaki **kitap ve defterleri** hemen **topladı**.\" cümlesinde `ve` bağlacı bulunmasına rağmen bu cümleyi **bağlı cümle** saymak **yanlıştır**; çünkü `ve` iki yüklemi değil, yalnızca aynı cümle içindeki iki nesneyi bağlamıştır, tek yüklem olduğu ve fiilimsi bulunmadığı için bu cümle **basit**tir!"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yapı sorularında iki tuzak adayları eler: 1. Uzun ve bol tamlamalı tek yüklemli cümleleri birleşik sanmak, ya da içinde `ve, ile, ama` geçen her cümleyi bağlı cümle saymak: Bir cümlenin **bağlı** olabilmesi için bağlacın sağında ve solunda ayrı birer **yüklem** bulunması zorunludur. 2. Virgülle ayrılmış her ifadeyi sıralı cümle sanmak: Eş görevli isimleri ayıran virgül sıralı cümle kurmaz (*Elma, armut, muz aldım* = basit cümle); sıralı cümle için en az iki ayrı **yüklem** gerekir."
  },
  {
    "type": "key_points",
    "items": [
      "Basit cümlede tek yüklem vardır ve fiilimsi bulunmaz.",
      "Cümledeki her fiilimsi bir yan cümlecik kurar ve cümleyi **girişik birleşik** yapar.",
      "Sıralı cümlede yüklemler virgülle/noktalı virgülle; bağlı cümlede ise bağlaçla ayrılır.",
      "Bağlacın veya virgülün yalnızca isimleri ayırdığı tek yüklemli cümleler sıralı ya da bağlı değildir."
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Anlatım Bozuklukları
-- Kaynak: docs/konu_anlatimi/turkce/10_anlatim_bozukluklari.md
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
  'turkce.anlatim_bozukluklari.01',
  'Türkçe',
  'Anlatım Bozuklukları',
  1,
  'Bölüm 1: Anlamsal Bozukluklar (Gereksiz Sözcük, Çelişen Sözcük, Yanlış Anlam/Yer)',
  'Anlatım bozuklukları iki ana eksende toplanır: anlama dayalı (bağdaşıklık) bozukluklar ve yapıya/dil bilgisine dayalı (bağlaşıklık) bozukluklar.  Anlamsal bozuklukların başında gereksiz sözcük kullanımı (duruluk ilkesine aykırılık) gelir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anlatım bozuklukları iki ana eksende toplanır: **anlama dayalı (bağdaşıklık) bozukluklar** ve **yapıya/dil bilgisine dayalı (bağlaşıklık) bozukluklar**. Anlamsal bozuklukların başında **gereksiz sözcük kullanımı (duruluk ilkesine aykırılık)** gelir. Bir cümlede aynı anlamı taşıyan eş anlamlı sözcüklerin birlikte kullanılması veya bir sözcüğün anlamının zaten cümledeki başka bir sözcüğün ya da ekin içinde yer alması gereksiz sözcük bozukluğuna yol açar (*\"daha önce\" ve \"önceden\"*, *\"yaklaşık ... civarında\"*, *\"karşılıklı mektuplaşmak\"*, *\"yüksek sesle bağırmak\"*). Cümleden bir sözcüğü çıkardığında anlamda hiçbir eksilme olmuyorsa o sözcük gereksizdir."
  },
  {
    "type": "paragraph",
    "text": "İkinci anlamsal bozukluk **anlamca çelişen sözcüklerin bir arada kullanılması**dır: Kesinlik bildiren bir ifadeyle olasılık veya azlık bildiren bir ifadenin aynı yargıda buluşması cümleyi çelişkili kılar (*\"Kesinlikle yarın gelebilir\"*, *\"Yalnızca birkaç kişi geldiği için salon tamamen doldu\"*). Üçüncü hata **sözcüğün yanlış anlamda kullanılması**dır: Yazılışları veya sesleri benzediği için karıştırılan sözcükler yanlış yerde kullanılır (*ücret* yerine *fiyat*, *öğretim* yerine *öğrenim*, *neden olmak* yerine olumlu durumlarda *sağlamak*, *çekimser* yerine *çekingen*, *büyümek* yerine *yetişmek*). Dördüncü hata ise **sözcüğün yanlış yerde kullanılması**dır: Sıfat olması gereken sözcük zarf gibi veya zarf olması gereken sözcük sıfat gibi yerleştirilir (*\"Çok başım ağrıyor\"* yerine *\"Başım çok ağrıyor\"*)."
  },
  {
    "type": "paragraph",
    "text": "Sözcüğün yanlış anlamda kullanılması sorularında özellikle şu çiftleri ezberlemeden mantığıyla ayır: *Özel* (kişiye/kuruma ait) ile *özgü* (birine/bir türe has); *ayrım* (fark) ile *ayrıntı* (detay); *küçümsemek* (değer vermemek) ile *azımsamak* (miktarı az bulmak); *karşılık* (bedel) ile *karşın* (rağmen); *etkin* (faal) ile *etkili* (iz bırakan). Örneğin *\"Bu kadar küçük bir maaşı küçümsüyorum.\"* demek yanlıştır, çünkü maaş sayısal bir miktardır ve **azımsanır**; *\"Onun yeteneğini azımsıyor.\"* demek de yanlıştır, çünkü yetenek **küçümsenir**. Aynı biçimde *\"Yeni yılın herkese sağlık getirmesini umut ediyorum.\"* doğruyken, *\"Sınavda başarısız olacağımı umut ediyorum.\"* yanlıştır; çünkü olumsuz beklentiler için *umut etmek* değil **endişelenmek / korkmak** kullanılır. Ayrıca *\"fotoğraf çekmek\"* yerine *\"resim çekmek\"* veya *\"fidan dikmek\"* yerine *\"fidan ekmek\"* gibi yanlış eşleştirmeler de sözcüğün yanlış anlamda kullanılmasından kaynaklanır."
  },
  {
    "type": "table",
    "headers": [
      "Bozukluk Türü",
      "Bozuk Cümle",
      "Düzeltilmiş Hâli ve Nedeni"
    ],
    "rows": [
      [
        "Gereksiz Sözcük",
        "Bu konuyu **daha önce önceden** konuşmuştuk.",
        "*Bu konuyu **önceden** konuşmuştuk.* (Aynı zaman anlamı iki kez verilmiş)"
      ],
      [
        "Çelişen Sözcükler",
        "Salona **yalnızca birkaç kişi** geldiği için **salon tamamen doldu**.",
        "*Salona **çok sayıda kişi** geldiği için salon tamamen doldu.* (Azlık ile tam doluluk çelişir)"
      ],
      [
        "Yanlış Anlam",
        "Pazarlık yapıp domatesin **ücretini** düşürdük.",
        "*...domatesin **fiyatını** düşürdük.* (Malın değeri **fiyat**, emeğin karşılığı **ücret**tir)"
      ],
      [
        "Yanlış Yer",
        "**Yeni** eve geldim ki telefon çaldı.",
        "*Eve **yeni** geldim ki telefon çaldı.* (\"Yeni\" evi değil, gelme zamanını nitelemelidir)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"İşçiler **hemen** **erkenden** tarlaya indiler.\" cümlesinde **gereksiz sözcük kullanımı yoktur**; çünkü *hemen* \"ardışıklık/çabukluk\", *erkenden* ise \"günün erken vakti\" anlamını taşır, ikisi farklı kavramlardır. Buna karşılık \"Bu kitabı **yaklaşık** olarak **on beş gün kadar** okudum.\" cümlesi **bozuktur**; çünkü \"yaklaşık\" ve \"kadar\" sözcüklerinin ikisi de tahmin/yaklaşıklık bildirir, birinin atılması gerekir. Aynı şekilde \"Yağmurlar tarlaların verimli olmasını **sağladı**.\" doğru iken, \"Kuraklık ürünlerin kurumasına **sağladı**.\" cümlesi **yanlıştır**; olumsuz sonuçlar için **neden oldu / yol açtı** kullanılır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Anlamsal bozukluklarda iki tuzağa dikkat et: 1. `\"Hemen\"` ve `\"erkenden\"` veya `\"sessizce\"` ve `\"yavaşça\"` gibi farklı nitelik bildiren ikili zarfları gereksiz sözcük sanma; gereksiz sözcük için iki ifadenin **aynı anlamı** taşıması ya da birinin diğerini kapsaması gerekir (*gizli sır, geçmiş anı, üç yıl süreyle*). 2. `\"Neden olmak\"` olumsuz, `\"sağlamak\"` ise yalnızca olumlu sonuçlar için kullanılır; `\"Başarısızlığımı düzenli çalışmamam sağladı.\"` cümlesi sözcüğün yanlış anlamda kullanımından doğan anlatım bozukluğudur!"
  },
  {
    "type": "key_points",
    "items": [
      "Eş anlamlı veya birbirini kapsayan sözcüklerin bir arada kullanılması duruluğu bozar.",
      "Kesinlik (`elbette, kesin`) ile ihtimal (`galiba, -ebilir`) aynı cümlede çelişir.",
      "Olumsuz durumlarda *sağlamak* değil *neden olmak / yol açmak* kullanılır; *fiyat* malın, *ücret* hizmetin karşılığıdır.",
      "Sıfat ile zarfın yer değiştirmesi cümlenin kastettiği anlamı kaydırır (`yeni eve` vs. `eve yeni`)."
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
  'turkce.anlatim_bozukluklari.02',
  'Türkçe',
  'Anlatım Bozuklukları',
  2,
  'Bölüm 2: Anlam Belirsizliği, Deyim Yanlışı ve Mantık-Sıralama Hatası',
  'Cümlenin iki farklı anlama gelecek biçimde kurulması anlam belirsizliği (açıklık ilkesine aykırılık) doğurur.  Anlam belirsizliği başlıca üç yoldan oluşur: (1) Kişi zamiri eksikliği: "Ehliyetini polis aldı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cümlenin iki farklı anlama gelecek biçimde kurulması **anlam belirsizliği (açıklık ilkesine aykırılık)** doğurur. Anlam belirsizliği başlıca üç yoldan oluşur: (1) **Kişi zamiri eksikliği:** *\"Ehliyetini polis aldı.\"* cümlesinde *senin* ehliyetin mi *onun* ehliyeti mi belli değildir; *\"Onu çok seven arkadaşıyla konuştu.\"* cümlesinde ise sevenin kim olduğu muğlaktır. (2) **Noktalama eksikliği:** *\"Genç doktoru dikkatle dinledi.\"* cümlesinde \"genç\"ten sonra virgül konmazsa genç olan doktor mu yoksa dinleyen kişi mi anlaşılmaz. (3) **Karşılaştırma belirsizliği:** *\"Kardeşimi senden çok seviyorum.\"* cümlesi \"senin kardeşimi sevdiğinden çok\" mu yoksa \"seni sevdiğimden çok\" mu anlamında belirsizdir."
  },
  {
    "type": "paragraph",
    "text": "**Deyim ve atasözü yanlışları**, kalıplaşmış sözlerin değiştirilmesiyle veya cümlenin bağlamına uymayan bir deyimin seçilmesiyle oluşur (*\"Konuyu masaya yattık\"* yerine doğrusu *\"masaya yatırdık\"*tır; *\"Çok sevindiği için etekleri tutuştu\"* yerine *\"etekleri zil çaldı\"* olmalıdır). **Mantık ve sıralama hataları** ise cümlenin genel akıl yürütmeye veya önem sırasına ters düşmesidir (*\"Bırak yürümeyi, koşamaz bile\"* yerine *\"Bırak koşmayı, yürüyemez bile\"*; *\"Köprü sağlam olmadığı için güvenle karşıya geçtik\"* yerine *\"Köprü sağlam olduğu için...\"* veya *\"sağlam olmadığı için geçemedik\"*)."
  },
  {
    "type": "paragraph",
    "text": "Anlam belirsizliğiyle ilgili bir başka sınav kalıbı da **virgül eksikliğinden doğan meslek veya sıfat karışıklığı**dır: *\"Yaşlı adama yol sordu.\"* cümlesinde yaşlı olan kişi yol soran mı yoksa kendisine yol sorulan adam mı belli değildir; yol soranın yaşlı olduğunu anlatmak için *\"Yaşlı, adama yol sordu.\"* biçiminde virgül konmalıdır. Benzer biçimde zamir eksikliği olan *\"Sesini kimse duymadı.\"* cümlesinde ise başına *\"senin\"* ya da *\"onun\"* getirilebildiği için cümle açık değildir; bu ikili okuma her zaman anlam belirsizliği oluşturur. Mantık hatalarında ise derece sıralamasının daima **zordan kolaya** veya **büyükten küçüğe** doğru akması gerektiğini unutmamalısın."
  },
  {
    "type": "paragraph",
    "text": "Anlam belirsizliği, deyim yanlışı ve mantık hatası içeren cümleleri tespit ederken cümleyi **iki farklı gözle** okumalısın: İlk okumada cümlede \"Kimin?\" veya \"Hangisinin?\" sorusu havada kalıyorsa **anlam belirsizliği** vardır; ikinci okumada ise eylem ile gerçek hayat mantığı çatışıyorsa (örneğin *\"Yüksekten korktuğu için balkonun en ucunda oturdu.\"*) **mantık hatası** vardır. Deyimlerde ise tek bir harfin veya ekin değişmesi (*\"gözünden düşmek\"* yerine *\"gözden inmek\"*) kalıbı doğrudan bozar."
  },
  {
    "type": "table",
    "headers": [
      "Bozukluk Türü",
      "Bozuk Cümle",
      "Düzeltilmiş Hâli ve Nedeni"
    ],
    "rows": [
      [
        "Anlam Belirsizliği",
        "**Onu çok seven arkadaşıyla** uzun süre dertleşti.",
        "*Arkadaşını çok seven biriyle...* veya *Kendisini çok seven arkadaşıyla...* (Kimin kimi sevdiği belirsiz)"
      ],
      [
        "Noktalama Belirsizliği",
        "**Küçük** çam ağacının arkasına saklandı.",
        "***Küçük,** çam ağacının arkasına saklandı.* (Virgül konmazsa \"küçük çam ağacı\" anlaşılır)"
      ],
      [
        "Deyim Yanlışı",
        "Sorunu çözmek için konuyu **masaya yattık**.",
        "*Sorunu çözmek için konuyu **masaya yatırdık**.* (Kalıplaşmış deyim *masaya yatırmak*tır)"
      ],
      [
        "Mantık / Sıralama",
        "Köprü **sağlam olmadığı için** güvenle geçtik.",
        "*Köprü **sağlam olduğu için** güvenle geçtik.* (Neden-sonuç akıl yürütmeye ters)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Mantık ve deyim çözümlemesi: \"Bu hızla giderse bırak yarışa **katılmayı**, **birinci olamaz** bile.\" cümlesinde mantık sıralaması **bozuktur**; çünkü \"bırak ... bile\" kalıbında \"bırak\"tan sonra **daha zor** olan, \"bile\"den önce ise **daha kolay** olan gelmelidir. Yarışa katılmak birinci olmaktan kolay olduğu için doğrusu \"Bu hızla giderse bırak **birinci olmayı**, yarışa **katılamaz** bile.\" biçimindedir (benzer biçimde \"Bırak **koşmayı**, **yürüyemez** bile.\"). Deyimlerde ise \"Sevinçten **etekleri tutuştu**.\" cümlesi **bozuktur**; çünkü \"etekleri tutuşmak\" telaş ve korku bildirir, sevinç için \"**etekleri zil çaldı**\" deyimi kullanılır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Anlam belirsizliği ve mantık sorularında iki noktayı gözden kaçırma: 1. `\"Kardeşini okulda gördüm.\"` gibi kısa ve akıcı cümlelerde aday bozukluk görmez; oysa başına hem **\"senin\"** hem **\"onun\"** gelebildiği için 2. ve 3. tekil iyelik belirsizliği vardır! 2. Mantık hatalarında `\"için\"` bağlacının kullanılması cümleyi doğru göstermez: `\"Yollar buzlu olduğu için araçlar hızla ilerledi.\"` cümlesinde neden-sonuç bağı biçimce kurulmuş gibi görünse de içerik mantığa aykırıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Başında *senin/onun* zamirlerinin ikisi de olabilen cümlelerde kişi zamiri eksikliğinden doğan belirsizlik vardır.",
      "Unvan veya sıfat niteliğindeki sözcüklerden sonra virgül konmazsa anlam karışır.",
      "Deyimler kalıplaşmıştır; kelimeleri değiştirilemez ve bağlamına aykırı kullanılamaz.",
      "\"Bırak X''i, Y bile...\" kalıbında önce zor olan durum, ardından daha kolay olan durum sıralanır (*\"Bırak koşmayı, yürüyemez bile\"* doğrudur; *\"Bırak yürümeyi, koşamaz bile\"* yanlıştır)."
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
  'turkce.anlatim_bozukluklari.03',
  'Türkçe',
  'Anlatım Bozuklukları',
  3,
  'Bölüm 3: Yapısal Bozukluklar — Özne-Yüklem Uyumsuzluğu ve Çatı Uyuşmazlığı',
  'Yapısal (dil bilgisel) anlatım bozuklukları, cümlenin ögeleri ve ekleri arasındaki gramer kurallarının ihlal edilmesidir.  Bunların başında özne-yüklem uyumsuzluğu gelir ve üç kurala dayanır: 1.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Yapısal (dil bilgisel) anlatım bozuklukları, cümlenin ögeleri ve ekleri arasındaki gramer kurallarının ihlal edilmesidir. Bunların başında **özne-yüklem uyumsuzluğu** gelir ve üç kurala dayanır: 1. **Kişi Uyumu:** Cümlede özne hangi kişiyse yüklem de o kişinin ekini almalıdır (*\"Ben bu konuda seninle görüşmek **istiyor**\"* yanlıştır; doğrusu ***\"istiyorum\"***dur). Özneyi birden fazla kişi oluşturuyorsa: *\"Ben ve sen\"* → **biz** (1. çoğul); *\"Sen ve o\"* → **siz** (2. çoğul) yüklem ister. 2. **Tekillik-Çoğulluk Uyumu:** Özne insan ve çoğulsa yüklem tekil de çoğul da olabilir (*Öğrenciler geldi / geldiler*). Ancak özne **insan dışı bir varlık** (hayvan, bitki, nesne, soyut kavram) ve çoğulsa yüklem mutlaka **tekil** olur (*\"Kuşlar gökyüzünde **uçuşuyorlar**\"* yanlıştır, doğrusu ***\"uçuşuyor\"***dur; yalnızca kişileştirme varsa çoğul olabilir). 3. **Olumluluk-Olumsuzluk Uyumu:** `Herkes, hepsi, tamamı` olumlu yüklem; `kimse, hiçbiri` ise olumsuz yüklem ister (*\"Kimse derse gelmedi, **herkes** evde oturuyordu\"* doğrudur; *\"Kimse derse gelmedi, evde oturdu\"* yanlıştır çünkü ikinci yükleme *\"herkes\"* öznesi eklenmelidir)."
  },
  {
    "type": "paragraph",
    "text": "Bir diğer önemli yapısal hata **çatı uyuşmazlığı**dır: Birleşik cümlelerde yan cümleciğin (fiilimsinin) çatısı ile temel cümlenin yükleminin çatısı uyumlu olmalıdır; biri etken diğeri edilgen olursa bozukluk doğar (*\"Bütün sorular dikkatle **çözülüp** öğretmene **teslim ettim**.\"* yanlıştır; doğrusu ya ***\"çözüp ... teslim ettim\"*** [ikisi de etken] ya da ***\"çözülüp ... teslim edildi\"*** [ikisi de edilgen] olmalıdır)."
  },
  {
    "type": "paragraph",
    "text": "Özne-yüklem uyumsuzluğunda ayrıca **topluluk isimleri** ve **sayı sıfatlı özneler** de sıkça sorulur: Özne çoğul eki almamış bir topluluk adıysa (*Halk, ordu, sürü*) yüklem tekil olur (*\"Halk meydanda toplandı\"* doğrudur; *\"Halk meydanda toplandılar\"* yanlıştır); ancak topluluk adı `-lar` çoğul eki alırsa (*Ordular ilerlediler*) yüklem çoğul olabilir. Sayı sıfatıyla kurulan öznelerde ise (*\"Beş öğrenci sınıfa geldi\"*) özne zaten çoğulluk bildirdiği için yüklem mutlaka **tekil** kalmalıdır (*\"Beş öğrenci sınıfa geldiler\"* yanlıştır). Bu kuralları tek tek yokladığında yapısal uyuşmazlıkları kolayca görürsün. Ayrıca zamir olan *\"Herkes\"* ve *\"Kimse\"* öznelerinde fiilin mutlaka 3. tekil şahsa göre çekimlendiğini (*Herkes burada toplandı*) unutma."
  },
  {
    "type": "table",
    "headers": [
      "Uyumsuzluk Türü",
      "Bozuk Cümle",
      "Düzeltilmiş Hâli ve Nedeni"
    ],
    "rows": [
      [
        "Kişi Uyumsuzluğu",
        "**Ben** de bu geziye katılmak **istiyor**.",
        "*Ben de bu geziye katılmak **istiyorum**.* (\"Ben\" 1. tekil kişi eki ister)"
      ],
      [
        "Tekillik-Çoğulluk",
        "Masadaki **çiçekler** susuzluktan **solmuşlar**.",
        "*Masadaki **çiçekler** susuzluktan **solmuş**.* (İnsan dışı çoğul öznede yüklem tekil olur)"
      ],
      [
        "Olumluluk-Olumsuzluk",
        "**Hiçbiri** sınava girmedi, evde **çalıştı**.",
        "*Hiçbiri sınava girmedi, **hepsi** evde çalıştı.* (\"Hiçbiri\" olumlu yüklemin öznesi olamaz)"
      ],
      [
        "Çatı Uyuşmazlığı",
        "Ödevler zamanında **yapılıp** masaya **bıraktım**.",
        "*Ödevleri zamanında **yapıp** masaya **bıraktım**.* (Yan ve temel yargı aynı çatıda olmalı)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**Ben** artık daha düzenli bir hayat **istiyor**.\" cümlesi özne `ben` iken yüklem 3. tekil kişi aldığı için **bozuktur**; doğrusu \"**istiyorum**\"dur. Yine \"Genç yazarı çok takdir **ediyor**, eserlerini ilgiyle **okuyoruz**.\" cümlesinde ilk yüklem 3. tekil (`o`), ikinci yüklem 1. çoğul (`biz`) olduğu için kişi uyumsuzluğu vardır; doğrusu \"takdir **ediyoruz**, ilgiyle **okuyoruz**\" olmalıdır. Çatı uyuşmazlığında ise \"Sabah erkenden **kalkılıp** kahvaltı **yaptık**.\" cümlesi **bozuktur**; doğrusu \"Sabah erkenden **kalkıp** kahvaltı **yaptık**.\"tır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Özne-yüklem uyumsuzluğunda iki ayrıntıya dikkat et: 1. `\"Kuşlar şarkı söylüyorlar.\"` cümlesinde **kişileştirme** (insana özgü eylem) bulunduğu için yüklemin `-lar` alması bozukluk sayılmaz; ancak kişileştirme olmayan *\"Kitaplar raflarda bekliyorlar.\"* gibi cümlelerde yüklem mutlaka tekil (`bekliyor`) olmalıdır. 2. `\"Sen ve ben\"` öznesinin yüklemi 2. çoğul (`-siniz`) değil, içinde `ben` olduğu için **1. çoğul (`-iz`)** olur (*Sen ve ben bu işi başaracağız*)."
  },
  {
    "type": "key_points",
    "items": [
      "İnsan dışı çoğul öznelerde (kişileştirme yoksa) yüklem daima tekil olur.",
      "`Kimse, hiçbiri` yalnızca olumsuz yükleme; `herkes, hepsi` yalnızca olumlu yükleme bağlanır.",
      "Bir cümlede yan cümleciğin fiilimsisi ile temel yüklemin çatısı (etken-etken veya edilgen-edilgen) uyumlu olmalıdır.",
      "Sıralı ve bağlı cümlelerde ilk yüklemin kişisi ile ikinci yüklemin kişisi uyuşmalıdır."
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
  'turkce.anlatim_bozukluklari.04',
  'Türkçe',
  'Anlatım Bozuklukları',
  4,
  'Bölüm 4: Yapısal Bozukluklar — Öge Eksikliği, Ek ve Tamlama Yanlışları',
  'Sıralı ve bağlı cümlelerde iki yüklemin aynı ögeye bağlanması sırasında yüklemlerden biri farklı bir hâl eki veya tümleç istiyorsa ortak öge eksikliği oluşur.  Örneğin "Seni çok seviyor ve saygı duyuyorum.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sıralı ve bağlı cümlelerde iki yüklemin aynı ögeye bağlanması sırasında yüklemlerden biri farklı bir hâl eki veya tümleç istiyorsa **ortak öge eksikliği** oluşur. Örneğin *\"Seni çok seviyor ve saygı duyuyorum.\"* cümlesinde `sevmek` fiili belirtili nesne (`seni`) isterken, `saygı duymak` fiili dolaylı tümleç (`sana`) ister; bu nedenle ikinci yüklemin önüne **\"sana\"** getirilmelidir (*\"Seni çok seviyor ve **sana** saygı duyuyorum.\"*). Aynı biçimde olumlu-olumsuz iki yargıda ek-fiil veya yüklem ortak kullanılırsa **yüklem/ek-fiil eksikliği** doğar (*\"Ben çay, o ise kahve içti.\"* → *\"Ben çay **içtim**, o ise kahve içti.\"*)."
  },
  {
    "type": "paragraph",
    "text": "**Tamlama yanlışları** ise farklı türdeki iki tamlayanın (isim ve sıfat) aynı tamlanana bağlanmasıyla ortaya çıkar (*\"Askerî ve devlet okulları\"* yanlıştır, çünkü *askerî* sıfattır, *devlet* isimdir; doğrusu ***\"Askerî okullar ve devlet okulları\"***dır). Buna karşılık aynı türden iki sıfat tek tamlanana bağlanabilir (*\"hem özel hem de devlet okulları\"* veya *\"büyük ve küçük evler\"* doğrudur, çünkü tamlanan eki ikisine de uyar). Son olarak **karşılaştırma mantığı hatası**nda kıyaslanan iki unsur aynı türden olmalıdır: *\"Bu yılki sorular geçen yılki sınavdan daha zordu.\"* cümlesinde sorular ile sınav kıyaslandığı için hata vardır; doğrusu ***\"...geçen yılki sınavdaki sorulardan daha zordu.\"*** olmalıdır."
  },
  {
    "type": "paragraph",
    "text": "Eklerle ilgili bozukluklarda ise iki durum öne çıkar: Birincisi **ek eksikliği**dir (*\"Bizim takımın oyunu kazanması herkesi mutlu etti.\"* yerine *\"Bizim takımın...\"* tamlayan eki unutulursa yapı kopar); ikincisi **ek fazlalığı**dır (*\"Kitap okumasını çok severim.\"* cümlesinde ikinci iyelik eki olan `-sı` gereksizdir, doğrusu *\"Kitap okumayı çok severim.\"* olmalıdır). Ayrıca edilgenlik eklerinin gereksiz yere üst üste kullanılması (*\"Bu yollar kısa sürede açılınıldı\"*) da ek yanlışlığına girer."
  },
  {
    "type": "table",
    "headers": [
      "Yapısal Bozukluk",
      "Bozuk Cümle",
      "Düzeltilmiş Hâli"
    ],
    "rows": [
      [
        "Ortak Öge Eksikliği",
        "Arkadaşını hem çok **seviyor** hem de **güveniyordu**.",
        "*Arkadaşını çok seviyor hem de **ona** güveniyordu.* (Dolaylı tümleç eksik)"
      ],
      [
        "Yüklem / Ek-Fiil Eksikliği",
        "Evimiz çok **küçük**, bahçesi de **geniş değildi**.",
        "*Evimiz çok **küçüktü**, bahçesi de geniş değildi.* (Olumsuz ek-fiil ilk yükleme bağlanamaz)"
      ],
      [
        "Tamlama Yanlışı",
        "**Doğa ve toplumsal** olayları inceledi.",
        "***Doğa olaylarını** ve toplumsal olayları inceledi.* (İsim ve sıfat aynı tamlanana bağlanamaz)"
      ],
      [
        "Karşılaştırma Hatası",
        "**Bu sorular** geçen yılki **sınavdan** daha kolaydı.",
        "*Bu sorular geçen yılki **sınavdaki sorulardan** daha kolaydı.* (Aynı türden varlıklar kıyaslanmalı)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Yapısal bozukluk kontrollerini **Ö-Ç-E-T** sırasıyla tara: - **Ö**zne-yüklem uyumu (kişi, sayı, olumluluk) - **Ç**atı uyuşmazlığı (etken-edilgen tutarlılığı) - **E**ksik öge / yüklem / ek-fiil (sıralı-bağlı cümlelerde) - **T**amlama ve ek yanlışları (isim+sıfat tamlayan ayrımı, ek fazlalığı)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Doğru ve yanlış karşılaştırması: \"**Hem özel hem de devlet okulları** bu yıl yeni programa geçti.\" cümlesinde anlatım bozukluğu **yoktur** (**doğru**); çünkü Türkçe kullanımda bu yapı doğaldır ve anlam bozulmaz. Buna karşılık \"**Ekonomik ve sağlık** sorunları masaya yatırıldı.\" cümlesi **bozuktur**; çünkü \"ekonomik sorunları\" olmayacağı için doğrusu \"**Ekonomik sorunlar ve sağlık sorunları**\" biçiminde olmalıdır. Ortak öge eksikliğinde ise \"Öğrencilere yardım ediyor ve **destekliyordu**.\" cümlesi **yanlıştır**; çünkü `desteklemek` dolaylı tümleç değil belirtili nesne ister, doğrusu \"Öğrencilere yardım ediyor ve **onları** destekliyordu.\"dur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yapısal bozukluk sorularında iki tuzağa dikkat et: 1. Sıralı cümlelerde (`ve, ama, ancak` ile bağlananlar dahil) yüklemlerin istediği hâl ekini mutlaka ayrı ayrı test et: İkinci fiilin önüne ilk ögeyi getirip oku; *\"Arkadaşını güveniyordu\"* kulağa bozuk geliyorsa orada mutlaka **dolaylı tümleç veya nesne eksikliği** vardır! 2. Karşılaştırma bozukluğunda cümle çok akıcı görünür (*\"Bugünkü konuşman dünkünden daha etkiliydi\"* doğrudur ama *\"Bugünkü konuşman dün akşamki toplantıdan daha etkiliydi\"* yanlıştır — konuşma ile toplantı değil, toplantıdaki konuşma kıyaslanmalıdır)."
  },
  {
    "type": "key_points",
    "items": [
      "Sıralı ve bağlı cümlelerde farklı ek isteyen yüklemler aynı ögeyi paylaşamaz (`seni seviyor, sana güveniyorum`).",
      "Olumlu ve olumsuz yargılar tek bir ortak yükleme veya ek-fiile bağlanamaz.",
      "Sıfat tamlaması ile isim tamlaması aynı tamlanana bağlanırsa tamlama yanlışı oluşur.",
      "Karşılaştırmanın her iki tarafı da mutlaka aynı türden kavramlar olmalıdır."
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
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözel Mantık ve Muhakeme
-- Kaynak: docs/konu_anlatimi/turkce/11_sozel_mantik_ve_muhakeme.md
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
  'turkce.sozel_mantik_ve_muhakeme.01',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  1,
  'Bölüm 1: Sıralama ve Konum Soruları (Tek Boyutlu Diziliş ve Blok Kurma)',
  'Sözel mantık ve muhakeme soruları bilgi ezberi değil, verilen öncülleri görsel bir şemaya dönüştürme becerisini ölçer.  İlk ve en temel soru tipi tek boyutlu sıralama ve konum (raf, boy, puan, kat, oda) sorularıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözel mantık ve muhakeme soruları bilgi ezberi değil, verilen öncülleri **görsel bir şemaya dönüştürme** becerisini ölçer. İlk ve en temel soru tipi tek boyutlu **sıralama ve konum (raf, boy, puan, kat, oda)** sorularıdır. Bu soruları zihinden çözmeye çalışmak en büyük zaman kaybıdır; bunun yerine hemen `1 - 2 - 3 - 4 - 5` biçiminde numaralı yuvalar veya `> / <` yönlü bir şema çizmelisin."
  },
  {
    "type": "paragraph",
    "text": "Sıralama sorularında iki altın kural vardır: (1) Önce **kesin yer bildiren** veya **uçları sınırlayan** öncülleri (\"Tarih kitabı en solda değildir\", \"Ada 2. ya da 3. odadadır\") şemaya yaz; (2) Birbirinin hemen yanında veya bitişiğinde durduğu söylenen unsurları tek bir **blok** (`[Roman - Şiir]`) halinde kutula. Eğer \"A, B''nin hemen solundadır\" deniyorsa `[A - B]` ayrılmaz bir ikilidir; yalnızca \"A, B''nin solundadır\" deniyorsa aralarına başka eleman girebilir (`A ... B`). Ayrıca birden fazla olasılık ortaya çıkıyorsa iki ayrı satırda iki olasılığı paralel yürütmek, çelişen olasılığı son öncüllerle tek hamlede eleyebilmeni sağlar."
  },
  {
    "type": "paragraph",
    "text": "Bunun yanında sıralama sorularında **\"Kesinlikle doğrudur\"**, **\"Kesinlikle yanlıştır\"** ve **\"Doğru olabilir\"** soru köklerini ayırmak çok önemlidir. Birden fazla geçerli dizilişin ortaya çıktığı sorularda, tüm geçerli dizilişlerde aynı konumda kalan öge **kesinlikle doğrudur**; dizilişlerden en az birinde gerçekleşebilen durum **olabilir**; hiçbir geçerli dizilişte mümkün olmayan durum ise **kesinlikle yanlıştır**. Bu ayrımı yapabilmek için ilk bulduğun doğru sırayla yetinmeyip varsa ikinci olasılığı da mutlaka kenara yazmalısın."
  },
  {
    "type": "table",
    "headers": [
      "Öncül İfadesi",
      "Şema Karşılığı",
      "Dikkat Edilecek Nokta"
    ],
    "rows": [
      [
        "\"A, B''den hemen sonra gelir.\"",
        "`[B - A]` bitişik blok",
        "Araya hiçbir eleman giremez"
      ],
      [
        "\"A, B''den sonra gelir.\"",
        "`B ... A`",
        "Arada 0, 1 veya daha fazla eleman olabilir"
      ],
      [
        "\"A en başta / en sonda değildir.\"",
        "`1 ≠ A` / `5 ≠ A`",
        "Blokların başa veya sona kaymasını belirler"
      ],
      [
        "\"A ile B arasında yalnız 1 kişi var.\"",
        "`[A - _ - B]` veya `[B - _ - A]`",
        "İki yönlü olasılığı da kontrol et"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Boy Sıralaması): Ali, Banu, Cem, Deniz ve Elif''in boylarıyla ilgili şunlar bilinmektedir: - Cem en uzun kişidir. - Ali, Elif''ten kısa, Banu''dan uzundur. - Banu, Deniz''den uzundur. **Soru:** Buna göre en kısa kişi kimdir? **Adım Adım Çözüm:** 1. En uzun kişi kesindir: `Cem > _ > _ > _ > _` 2. İkinci öncül sırayı verir: `Elif > Ali > Banu` 3. Üçüncü öncül `Banu > Deniz` der; bunu zincire eklediğimizde tek ve kesin sıralama oluşur: **Cem > Elif > Ali > Banu > Deniz**. 4. Dolayısıyla en kısa kişi kesinlikle **Deniz**dir (Banu''yu en kısa sanmak **yanlıştır**). Özgün Çözümlü Soru 2 (Raftaki Kitaplar): Bir rafta soldan sağa 1''den 5''e kadar dizilen Bilim, Roman, Sözlük, Şiir ve Tarih kitapları hakkında: - Bilim 4., Sözlük ise 5. sıradadır. - Roman, Şiir''in hemen solundadır. - Tarih en solda (1. sırada) değildir. **Soru:** Buna göre soldan üçüncü kitap hangisidir? **Adım Adım Çözüm:** 1. Kesin yerleri yazalım: `1(_) - 2(_) - 3(_) - 4(Bilim) - 5(Sözlük)`. 2. `[Roman - Şiir]` bitişik bir bloktur ve 1-2 veya 2-3 konumuna yerleşebilir. 3. Tarih 1. sırada olamayacağı için blok 2-3''e konarsa 1. sıra Tarih''e kalır ve kural bozulur! Bu nedenle `[Roman - Şiir]` bloğu mecburen **1 ve 2. sıraya** yerleşir; 3. sıraya ise **Tarih** gelir. 4. Kesin sıra: **1: Roman, 2: Şiir, 3: Tarih, 4: Bilim, 5: Sözlük**. Soldan üçüncü kitap **Tarih**tir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sıralama sorularında iki klasik tuzağa dikkat et: 1. \"Hemen önce / hemen sonra\" ile \"önce / sonra\" ifadelerini aynı sanmak: Araya eleman girip giremeyeceği bütün olasılıkları değiştirir. 2. İki olasılık varken yalnızca ilk aklına gelen dizilişi deneyip cevabı işaretlemek: Örneğin Ada 2. veya 3. odada olabiliyorsa iki ihtimali de son koşula kadar test et; Defne > Cem gibi bir son koşul 3. oda ihtimalini eleyip tek doğru cevabı bırakabilir."
  },
  {
    "type": "key_points",
    "items": [
      "Sıralama sorularında mutlaka numaralı yuvalar veya `>` işaretiyle görsel şema çiz.",
      "Bitişik ögeleri `[A - B]` bloğu içine alarak tek parça gibi hareket ettir.",
      "Olumsuz öncüller (\"en solda değil\") blokların hangi uca yaslanacağını belirler.",
      "İki ihtimal ortaya çıkarsa iki satır açıp son öncülle eleme yap."
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
  'turkce.sozel_mantik_ve_muhakeme.02',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  2,
  'Bölüm 2: Tablo Oluşturma ve Çok Boyutlu Eşleştirme (Gün, Kişi, Etkinlik)',
  'Birden fazla değişkenin (örneğin kişi + gün + şehir, ya da kişi + oda numarası + meslek) eşleştirildiği sorularda düz çizgi yetmez; mutlaka iki boyutlu tablo kurmalısın.  Tabloyu kurarken sabit ve sıralı olan boyutu (günler: Pazartesi, Salı, Çarşamba veya numaralar: 1, 2, 3, 4) sütun başlığına yazmak her zaman en düzenli çözümü verir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Birden fazla değişkenin (örneğin kişi + gün + şehir, ya da kişi + oda numarası + meslek) eşleştirildiği sorularda düz çizgi yetmez; mutlaka **iki boyutlu tablo** kurmalısın. Tabloyu kurarken sabit ve sıralı olan boyutu (günler: *Pazartesi, Salı, Çarşamba* veya numaralar: *1, 2, 3, 4*) **sütun başlığına** yazmak her zaman en düzenli çözümü verir. Ardından kişileri ve diğer özellikleri satırlara yerleştirir, olumsuz bilgileri (\"Ayşe Salı değildir\") ilgili hücrenin altına `≠` veya çarpı işaretiyle not edersin."
  },
  {
    "type": "paragraph",
    "text": "Çok boyutlu eşleştirmede en önemli strateji **eleme ve zorunlu bırakma**dır. Bazen bir kişi hakkında doğrudan gün bilgisi verilmez; fakat diğer kişilerin yasaklı günleri birleştiğinde o kişiye tek bir boş gün kalır. Özellikle oda numarası veya sıralı gün sorularında \"X, Y''den büyük numaralıdır\" gibi büyüklük koşulları, olasılık dallarından birini tek hamlede çökertir."
  },
  {
    "type": "table",
    "headers": [
      "Tablo Kurma Adımı",
      "Uygulama",
      "Amaç"
    ],
    "rows": [
      [
        "1. Sabit Eksen",
        "Günleri veya oda numaralarını sütun yap",
        "Sıra ve büyüklük ilişkilerini görsel tutar"
      ],
      [
        "2. Kesin Kayıtlar",
        "Kesin eşleşmeleri tabloya direkt yaz",
        "Boş hücre sayısını azaltır"
      ],
      [
        "3. Yasaklı Notlar",
        "\"Salı değil\" bilgisini hücre altına `(-)` yaz",
        "Zorunlu kalan tek hücreyi görmeyi sağlar"
      ],
      [
        "4. Koşul Kontrolü",
        "Kalan adayları `< / >` şartıyla test et",
        "Çelişen olasılığı eler"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Sözel mantık tablolarını çözerken **Ş-K-E-D** dörtlüsünü izle: - **Ş**ema veya tablo kur (zihinden çözme) - **K**esin bilgileri yerleştir - **E**leme/olumsuz koşulları hücrelere işle - **D**allanan olasılıkları son öncülle doğrula"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Nöbet Tablosu): Ayşe, Burak ve Can adlı üç çalışan Pazartesi, Salı ve Çarşamba günleri birer gün nöbet tutacaktır. Bilinenler: - Ayşe Salı günü nöbet tutmamaktadır. - Burak, Ayşe''den önceki bir günde nöbet tutmaktadır. - Can Pazartesi günü nöbet tutmamaktadır. **Soru:** Buna göre Burak hangi gün nöbet tutmaktadır? **Adım Adım Çözüm:** 1. Günleri yazalım: `Pazartesi | Salı | Çarşamba`. 2. Burak, Ayşe''den önceyse Ayşe **Pazartesi** olamaz. İlk öncüle göre Ayşe **Salı** da değildir. O halde Ayşe''ye kalan tek gün **Çarşamba**dır! 3. Kalan günler Pazartesi ve Salı''dır. Can Pazartesi olamayacağına göre Can **Salı**, Burak ise mecburen **Pazartesi** nöbet tutar. 4. Sağlama: Burak (Pzt) < Ayşe (Çar), Ayşe ≠ Salı, Can (Salı) ≠ Pzt. Tüm şartlar sağlandı; cevap **Pazartesi**dir. Özgün Çözümlü Soru 2 (Oda Yerleşimi): Ada, Barış, Cem ve Defne 1''den 4''e kadar numaralı dört odada kalmaktadır: - Ada 2. ya da 3. odadadır. - Barış, Ada''dan bir küçük numaralı odadadır (`Barış = Ada - 1`). - Defne''nin oda numarası Cem''inkinden büyüktür (`Defne > Cem`). - Cem 1. odada değildir (`Cem ≠ 1`). **Soru:** Buna göre Barış hangi odadadır? **Adım Adım Çözüm:** 1. *1. İhtimal (Ada = 3):* Bu durumda Barış = 2 olur. Geriye 1 ve 4 numaralı odalar kalır. `Defne > Cem` şartı gereği Cem = 1, Defne = 4 olmalıdır; ancak son öncüle göre `Cem ≠ 1` olduğundan bu ihtimal **çöker** ve elenir. 2. *2. İhtimal (Ada = 2):* Bu durumda Barış = 1 olur. Geriye 3 ve 4 numaralı odalar kalır. `Defne > Cem` şartı gereği Cem = 3, Defne = 4 olur ve `Cem ≠ 1` koşulu da sağlanır. 3. Kesin yerleşim: **1: Barış, 2: Ada, 3: Cem, 4: Defne**. Dolayısıyla Barış kesinlikle **1. odadadır**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Tablo sorularında iki hataya dikkat et: 1. \"Burak, Ayşe''den önceki bir günde\" ifadesini görünce Burak''ın Salı, Ayşe''nin Çarşamba olabileceğini varsayıp Pazartesi ihtimalini atlamak: Oysa Can''ın Pazartesi olamaması Burak''ı otomatik olarak Pazartesi''ye iter. 2. Tüm olasılıkları yazdıktan sonra son öncülle sağlama yapmamak: Her zaman bulduğun tabloyu baştan sona tüm öncüllerle tek tek kontrol et."
  },
  {
    "type": "key_points",
    "items": [
      "Sabit ve sıralı değişkenleri (gün, saat, kat, oda no) daima tablonun sütun başlığına koy.",
      "Olumsuz öncülleri (`X, Salı değil`) hücrelerin altına not ederek daralan seçenekleri gör.",
      "İki ihtimal kaldığında her iki durumu ayrı satırlarda yürüt ve kısıtlarla çelişeni ele."
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
  'turkce.sozel_mantik_ve_muhakeme.03',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  3,
  'Bölüm 3: Doğruluk-Yalan, Koşul Zinciri ve Küme/Çıkarım Muhakemesi',
  'KPSS sözel mantık sorularının bir diğer grubu tablo kurmaktan çok mantıksal çıkarım gerektirir.  Bunlar üçe ayrılır: 1.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS sözel mantık sorularının bir diğer grubu tablo kurmaktan çok **mantıksal çıkarım** gerektirir. Bunlar üçe ayrılır: 1. **Doğruluk-Yalan Soruları:** Genellikle 3 veya 4 kişinin söylediği ifadelerden \"yalnızca birinin doğru (veya yanlış) söylediği\" belirtilir. Çözüm yöntemi **varsayım testidir**: Sırayla \"Ahmet doğru söylüyor olsun\" deyip diğerlerinin ifadeleriyle çelişip çelişmediğine bakarsın; toplam doğru sayısı verilen sayıyı tutmazsa o varsayım çöker ve bir sonraki kişiye geçersin. 2. **Koşul Zinciri (`P -> Q`):** \"Matematikte başarılı olan herkes Fen''de de başarılıdır\" cümlesi **tek yönlü** bir koşuldur (`Mat -> Fen`). Bu kuraldan çıkacak **kesin sonuç** şudur (karşıt-ters kuralı): **Fen''de başarısız olan biri Matematikte kesinlikle başarısızdır** (`Fen değil -> Mat değil`). Buna karşılık \"Fen''de başarılı olan herkes Matematikte başarılıdır\" diyemezsin! 3. **Küme (Kıyas) Çıkarımları:** \"Bütün doktorlar mezundur. Bazı mezunlar yazardır.\" ifadelerinde iki küme arasındaki kesişim yalnızca ortak olan alanı garanti eder: `\"Bazı mezunlar yazardır\"` demek **kesinlikle \"Bazı yazarlar mezundur\"** demektir; fakat doktorlarla yazarların kesişip kesişmediği **bilinmez** (kesin değildir)."
  },
  {
    "type": "table",
    "headers": [
      "Mantık Kuralı",
      "Geçerli Kesin Çıkarım",
      "Geçersiz (Tuzak) Çıkarım"
    ],
    "rows": [
      [
        "`Eğer P ise Q` (`P -> Q`)",
        "`Q` yoksa `P` de **yoktur**",
        "`Q` varsa `P` de vardır (Yanlış! Tek yönlüdür)"
      ],
      [
        "`Bütün A''lar B''dir`",
        "`B` olmayan `A` değildir",
        "`B` olan her şey `A`dır (Yanlış!)"
      ],
      [
        "`Bazı A''lar B''dir`",
        "`Bazı B''ler A''dır`",
        "`Bazı A''lar B değildir` (Kesin değil; hepsi de olabilir!)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Doğruluk-Yalan): Bir ofisin anahtarını Ahmet, Berna veya Cem''den biri almıştır. Üçünün söyledikleri şöyledir: - Ahmet: \"Anahtarı Berna aldı.\" - Berna: \"Anahtarı ben almadım.\" - Cem: \"Anahtarı ben almadım.\" Bu üç kişiden **yalnızca biri doğru** söylediğine göre anahtarı kim almıştır? **Adım Adım Çözüm:** 1. *Ahmet aldıysa:* Ahmet \"Berna aldı\" dediği için **Yanlış**, Berna \"Ben almadım\" dediği için **Doğru**, Cem \"Ben almadım\" dediği için **Doğru** olur → 2 doğru çıkar, kurala aykırıdır (elendi). 2. *Berna aldıysa:* Ahmet \"Berna aldı\" dediği için **Doğru**, Berna \"Ben almadım\" dediği için **Yanlış**, Cem \"Ben almadım\" dediği için **Doğru** olur → 2 doğru çıkar, kurala aykırıdır (elendi). 3. *Cem aldıysa:* Ahmet \"Berna aldı\" dediği için **Yanlış**, Berna \"Ben almadım\" dediği için **Doğru**, Cem \"Ben almadım\" dediği için **Yanlış** olur → **Yalnızca 1 doğru (Berna)** çıkar! 4. Tüm şartlar tek bir noktada tutar: Anahtarı kesinlikle **Cem** almıştır. Özgün Çözümlü Soru 2 (Koşul Çıkarımı): \"Hafta sonu kütüphaneye giden her öğrenci mutlaka tarih notlarını da yanına alır.\" bilgisi verilmiştir. **Kesin Çıkarım:** Kerem bugün tarih notlarını yanına **almamışsa**, Kerem bugün hafta sonu kütüphaneye **gitmemiştir** (`Q değil -> P değil`). Buna karşılık \"Deniz bugün tarih notlarını yanına aldığına göre hafta sonu kütüphaneye gitmiştir.\" yargısı **kesin değildir** (evde çalışmak için de almış olabilir). Özgün Çözümlü Soru 3 (Küme / Kıyas Çıkarımı): \"Bütün doktorlar üniversite mezunudur. Bazı üniversite mezunları yazardır.\" bilgileri verilmiştir. **Adım Adım Çözüm:** 1. Doktorlar kümesi, üniversite mezunları kümesinin tamamen içindedir. 2. Yazarlar kümesi ise mezunlar kümesiyle kesişmektedir; ancak bu kesişim doktorlar kümesinin içinde de olabilir, tamamen dışında da kalabilir. 3. Bu nedenle *\"Bazı doktorlar yazardır.\"* veya *\"Hiçbir doktor yazar değildir.\"* yargıları **kesin değildir**; kesin olan tek çıkarım **\"Bazı yazarlar üniversite mezunudur.\"** yargısıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Çıkarım sorularında iki tuzağa dikkat et: 1. Koşul ifadelerini çift yönlü sanmak: `\"Matematikte başarılı olan Fen''de de başarılıdır\"` cümlesi `\"Fen''de başarılı olan Matematikte de başarılıdır\"` anlamına **gelmez**; yalnızca Fen''den kalanın Matematikten de kaldığını kesinleştirir. 2. Küme sorularında `\"Bazı mezunlar yazardır\"` ile `\"Bütün doktorlar mezundur\"` bilgisini birleştirip `\"Bazı doktorlar yazardır\"` sonucunu çıkarmak yanlıştır; doktor kümesi mezun kümesinin içinde ama yazar kümesinin tamamen dışında kalabilir."
  },
  {
    "type": "key_points",
    "items": [
      "Doğruluk-yalan sorularında her kişiyi tek tek \"doğru\" veya \"alan kişi\" varsayarak çelişki testi yap.",
      "`P -> Q` koşulunun tek kesin eşdeğeri **\"Q yoksa P de yoktur\"** (`~Q -> ~P`) çıkarımıdır.",
      "\"Bazı A''lar B''dir\" ifadesinin tek kesin dönüşümü \"Bazı B''ler A''dır\" şeklindedir."
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
  'turkce.sozel_mantik_ve_muhakeme.04',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  4,
  'Bölüm 4: Gün-Tarih Hesaplama ve Sayısal-Sözel Denklem Muhakemesi',
  'Sözel mantık bölümünde zaman zaman takvim (gün sayma) ve basit tek bilinmeyenli sözel denklem soruları da yer alır.  Gün ve tarih hesaplama sorularında temel mantık `mod 7` (yedişer gün ilerleme) kuralıdır: Bir haftada 7 gün bulunduğu için, elindeki tarihin üzerine 7 ve 7''nin katlarını (`+7, +14, +21, +28`) eklediğinde her zaman aynı güne ulaşırsın.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözel mantık bölümünde zaman zaman takvim (gün sayma) ve basit tek bilinmeyenli sözel denklem soruları da yer alır. **Gün ve tarih hesaplama** sorularında temel mantık `mod 7` (yedişer gün ilerleme) kuralıdır: Bir haftada 7 gün bulunduğu için, elindeki tarihin üzerine 7 ve 7''nin katlarını (`+7, +14, +21, +28`) eklediğinde **her zaman aynı güne** ulaşırsın. Günleri tek tek parmakla saymak yerine hedef tarihe en yakın 7 katını sıçramak hem çok hızlıdır hem de sayma hatasını önler."
  },
  {
    "type": "paragraph",
    "text": "**Sözel denklem muhakemesinde** ise kişiler arasındaki yaş, boy veya miktar ilişkilerini kurarken sorulan kişiyi değil, **en küçük veya en çok bağlantı kurulan kişiyi** `x` olarak seçmek denklemi en sade hale getirir. Tüm verileri `x` cinsinden yazıp toplama veya fark denklemine dönüştürdüğünde hata payı kalmaz; `x`''i bulduktan sonra ise soru kökünün `x`''i mi yoksa `x + 4`''ü mü sorduğunu mutlaka kontrol etmelisin."
  },
  {
    "type": "paragraph",
    "text": "Aynı biçimde **gün hesaplama** sorularında ayın kaç gün çektiği bilgisi verilmişse ay sonu geçişlerine dikkat etmelisin (örneğin 30 gün çeken bir ayda 26''sından 6 gün sonraya geçerken `26 + 4 = 30`, kalan 2 gün yeni ayın 2''si olur). Haftanın günleri sürekli 7 günde bir devrettiği için, geçmişe doğru giderken de `-7, -14, -21` çıkararak aynı güne dönebilirsin; örneğin ayın 29''u Pazartesi ise 7 çıkararak `22, 15, 8, 1`''in de Pazartesi olduğunu anında görebilirsin. Sözlü olarak verilen yaş-fark ilişkilerinde ise kişilerin yaş farkının yıllar geçse de **hiç değişmediğini** aklında tutman gerekir; örneğin iki kardeşin yaşları toplamı her yıl 2 artarken farkları hep aynı kalır."
  },
  {
    "type": "table",
    "headers": [
      "Soru Türü",
      "Hızlı Yöntem",
      "Dikkat Edilecek Nokta"
    ],
    "rows": [
      [
        "Gün / Tarih Sayma",
        "Başlangıç gününe `+7, +14, +21, +28` ekle",
        "Hedef güne en yakın katı bul, kalanı tek tek say"
      ],
      [
        "Yaş / Miktar İlişkisi",
        "Referans kişiye `x` de, diğerlerini `x` ile yaz",
        "`x` bulunduktan sonra sorulan kişiyi hesapla"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Gün Hesaplama): Bir ayın **5''i Cuma** ise aynı ayın **29''u** hangi gündür? **Adım Adım Çözüm:** 1. 5''i Cuma olduğuna göre üzerine 7''nin katlarını ekleyelim: `5 + 7 = 12` (Cuma), `12 + 7 = 19` (Cuma), `19 + 7 = 26` (Cuma). 2. 26 Cuma ise kalan 3 günü ilerletelim: `27` Cumartesi, `28` Pazar, **`29` Pazartesi**dir. 3. Sağlama: `(29 - 5) = 24` gün; `24 / 7 = 3` hafta + `3` gün kalan. Cuma + 3 gün = **Pazartesi** (Cumartesi/Salı işaretlemek **yanlıştır**). Özgün Çözümlü Soru 2 (Sözel Denklem): Ece, Sena''dan 1 yaş büyük; Sena da Mert''ten 3 yaş büyüktür. Üçünün yaşları toplamı **49** olduğuna göre **Ece** kaç yaşındadır? **Adım Adım Çözüm:** 1. En küçük olan Mert''e `x` diyelim: `Mert = x`. 2. Sena Mert''ten 3 yaş büyükse `Sena = x + 3`. 3. Ece Sena''dan 1 yaş büyükse `Ece = (x + 3) + 1 = x + 4`. 4. Toplamları: `x + (x + 3) + (x + 4) = 3x + 7 = 49` → `3x = 42` → `x = 14` (Mert''in yaşı). 5. Soru **Ece**''yi sorduğu için `Ece = 14 + 4 = 18` yaşındadır (14''ü işaretlemek **yanlıştır**)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Gün ve denklem sorularında iki yaygın hata görülür: 1. Gün sayarken başlangıç gününü (`5`i) sıfır yerine bir sayarak `29 - 5 + 1 = 25` günü `7`''ye bölmek: İki tarih arasındaki gün farkı daima **çıkarma** (`29 - 5 = 24`) ile bulunur; `+1` eklenmez! 2. Denklemde `x` değerini bulur bulmaz şıklarda `x`''i işaretlemek: ÖSYM genellikle referans olan `x`''i de (örneğin `14`) en güçlü çeldirici olarak seçeneklere koyar."
  },
  {
    "type": "key_points",
    "items": [
      "Aynı güne dönmek için tarihe 7 ve katlarını ekle; iki tarih arası fark için çıkarma yap (`+1` ekleme).",
      "Sözel yaş/miktar denklemlerinde en küçük ya da temel kişiye `x` de.",
      "`x` bulunduğunda soru kökünün hangi kişiyi sorduğunu tekrar kontrol et."
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

commit;
