-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Anlatım Bozuklukları
-- Kaynak: docs/konu_anlatimi/turkce/10_anlatim_bozukluklari.md
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
    "question_ids": [
      "0df5fc5b-9f10-45c9-b885-0ac63a49e9ed",
      "1c68866e-c03b-4253-91f8-40233d17c917"
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
    "question_ids": [
      "29b2d911-1102-49ad-a772-3d69a2fef82c",
      "30f18560-318d-44c1-baf0-a8f88e52e800"
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
    "question_ids": [
      "383dad32-4f3b-45d6-a5ac-bce51307cd95",
      "408be4b6-abbf-4cfc-9b67-fc70314d9e93"
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
    "question_ids": [
      "4a0b3f00-aae9-46b1-baef-0ca21e0c43df",
      "5ef6279a-23d6-43cd-b4cd-79456abd6b46"
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
