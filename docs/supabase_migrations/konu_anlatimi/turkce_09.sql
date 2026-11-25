-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Cümlenin Ögeleri ve Cümle Türleri
-- Kaynak: docs/konu_anlatimi/turkce/09_cumlenin_ogeleri_ve_cumle_turleri.md
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
    "question_ids": [
      "185bb52f-b9f6-402e-a98c-f2df33c37ed1",
      "1e589a7d-ac65-42f5-b43d-f0a35d65e459"
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
    "question_ids": [
      "2e1bfd22-14ce-4b58-8c83-cb6549f8da25",
      "4666532b-5ace-4666-a933-b6bc55927ec0"
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
    "question_ids": [
      "4c86914b-9bad-45d9-aa4d-a80008d9772f",
      "55f29566-4b28-4f2c-9436-0c119e68eb8c"
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
    "question_ids": [
      "5f8d5676-4a1a-4b49-9c2d-edfa6c91b9f0",
      "6ea01a2d-1c53-44b9-8145-b092f3ac0d81"
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
