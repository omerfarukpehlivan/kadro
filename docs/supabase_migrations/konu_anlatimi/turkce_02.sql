-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Cümlede Anlam
-- Kaynak: docs/konu_anlatimi/turkce/02_cumlede_anlam.md
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

commit;
