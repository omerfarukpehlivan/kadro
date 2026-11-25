-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Paragrafta Anlam ve Yapı
-- Kaynak: docs/konu_anlatimi/turkce/03_paragrafta_anlam_ve_yapi.md
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
    "question_ids": [
      "007121bb-21c5-486d-86e2-ccc0bd81d7b6",
      "02562b43-602d-4be4-b167-3d9a2b016e1c"
    ]
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
    "question_ids": [
      "02e69f83-454e-41d0-9c88-1a2e8b1fe4bb",
      "03e299c8-645e-4d17-ada7-05eaf9e81c27"
    ]
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
    "question_ids": [
      "07dd0864-064c-4523-ae5d-6f73140a11cd",
      "095ffd75-e479-46a8-946f-575742e32017"
    ]
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
    "question_ids": [
      "0f8cfd92-8397-4d75-a421-95a8349a3676",
      "0fd5028b-7439-4e98-8e6f-d560288b30cd"
    ]
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
