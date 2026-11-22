-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözcükte Yapı ve Ekler
-- Kaynak: docs/konu_anlatimi/turkce/04_sozcukte_yapi_ve_ekler.md
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

commit;
