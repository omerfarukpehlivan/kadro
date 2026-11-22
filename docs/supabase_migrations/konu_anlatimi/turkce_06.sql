-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Ses Bilgisi ve Ses Olayları
-- Kaynak: docs/konu_anlatimi/turkce/06_ses_bilgisi_ve_ses_olaylari.md
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

commit;
