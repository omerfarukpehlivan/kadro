-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Basit Eşitsizlikler ve Mutlak Değer
-- Kaynak: docs/konu_anlatimi/matematik/04_basit_esitsizlikler_ve_mutlak_deger.md
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
  'matematik_geometri.basit_esitsizlikler_ve_mutlak_deger.01',
  'Matematik & Geometri',
  'Basit Eşitsizlikler ve Mutlak Değer',
  1,
  'Bölüm 1: Aralık Kavramı ve Basit Eşitsizliklerin Temel Kuralları',
  'Sayı doğrusunda iki sınır arasındaki tüm gerçel sayıları gösteren yapıya aralık denir.  Sınır değerleri aralığa dahilse kapalı parantez $[a, b]$ ve dolu nokta ($\le$ veya $\ge$), dahil değilse açık parantez $(a, b)$ ve boş çember ($<$ veya $>$) kullanılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sayı doğrusunda iki sınır arasındaki tüm gerçel sayıları gösteren yapıya **aralık** denir. Sınır değerleri aralığa dahilse kapalı parantez $[a, b]$ ve dolu nokta ($\\le$ veya $\\ge$), dahil değilse açık parantez $(a, b)$ ve boş çember ($<$ veya $>$) kullanılır. Eşitsizliklerin neredeyse tamamı denklem kurallarına benzer şekilde çözülür, ancak üç noktada keskin biçimde ayrılır:"
  },
  {
    "type": "paragraph",
    "text": "1. Eşitsizliğin her iki yanına aynı sayı eklenebilir veya çıkarılabilir; yön değişmez. 2. Eşitsizliğin her iki yanı **pozitif** bir sayıyla çarpılır veya bölünürse yön değişmez; ancak **negatif bir sayıyla çarpılır veya bölünürse eşitsizlik mutlaka yön değiştirir**. 3. Eşitsizliğin her iki yanında **aynı işaretli** ($a \\cdot b > 0$) iki sayı varsa ve ikisini de ters çevirirsen ($\\frac{1}{a}$ ve $\\frac{1}{b}$) eşitsizlik yön değiştirir ($2 < 4 \\Rightarrow \\frac{1}{2} > \\frac{1}{4}$). Ancak biri negatif biri pozitifken ters çevirmede yön değişmez ($-2 < 3 \\Rightarrow -\\frac{1}{2} < \\frac{1}{3}$)."
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 366 64\" width=\"366\" height=\"64\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><line x1=\"12\" y1=\"30\" x2=\"262.5\" y2=\"30\"/><line x1=\"273.5\" y1=\"30\" x2=\"358\" y2=\"30\"/><path d=\"M358 30 l-8 -4 m8 4 l-8 4\"/><path d=\"M12 30 l8 -4 m-8 4 l8 4\"/><line x1=\"98\" y1=\"30\" x2=\"262.5\" y2=\"30\" stroke-width=\"5\" stroke-opacity=\"0.55\"/><line x1=\"30\" y1=\"25\" x2=\"30\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"30\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-3</text><line x1=\"64\" y1=\"25\" x2=\"64\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"64\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-2</text><line x1=\"98\" y1=\"25\" x2=\"98\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"98\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-1</text><line x1=\"132\" y1=\"25\" x2=\"132\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"132\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">0</text><line x1=\"166\" y1=\"25\" x2=\"166\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"166\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">1</text><line x1=\"200\" y1=\"25\" x2=\"200\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"200\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">2</text><line x1=\"234\" y1=\"25\" x2=\"234\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"234\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">3</text><text x=\"268\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">4</text><line x1=\"302\" y1=\"25\" x2=\"302\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"302\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">5</text><line x1=\"336\" y1=\"25\" x2=\"336\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"336\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">6</text><circle cx=\"98\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"268\" cy=\"30\" r=\"5\" stroke-width=\"1.8\"/></svg>",
    "caption": "Şekil 1. Sayı doğrusunda açık ve kapalı uçlu aralık gösterimi ($-1 \\le x < 4$)"
  },
  {
    "type": "heading",
    "text": "Aralıklarla Toplama, Çıkarma, Kare Alma ve Çarpma"
  },
  {
    "type": "paragraph",
    "text": "İki eşitsizlik arasında **taraf tarafa toplama** yapılabilir; sınırların dahil olup olmadığını belirlerken yalnızca her iki uç da kapalı ($\\le$) ise sonuç kapalı kalır, uçlardan biri bile açıksa ($<$) sonuç açık uçlu olur. Buna karşılık **taraf tarafa çıkarma ve bölme kesinlikle yapılmaz!** Çıkarma sorulduğunda ($x - y$) önce ikinci eşitsizliği $-1$ ile çarpıp yönünü çevirir ($-y$''nin aralığını bulur), ardından taraf tarafa toplarsın."
  },
  {
    "type": "paragraph",
    "text": "Bir aralığın **karesi** ($x^2$) alınırken kritik bir kural vardır: eğer $x$ aralığı negatiften pozitife geçiyorsa ($-3 < x < 4$ gibi) aralık içinde $0$ bulunduğu için $x^2$''nin alabileceği en küçük değer **$0$ olur** ve $0 \\le x^2$ biçiminde dahil edilir; üst sınır ise sınırların karelerinden büyük olanı alınarak belirlenir ($0 \\le x^2 < 16$). İki gerçel aralığın **çarpım** aralığı ($x \\cdot y$) bulunurken de uçların tüm dört olası ikili çarpımı hesaplanır; bu dört sonuçtan en küçüğü alt sınır, en büyüğü üst sınır olur."
  },
  {
    "type": "paragraph",
    "text": "Bir sayının karesi kendisinden küçükse ($a^2 < a$), bu sayı mutlaka **$0 < a < 1$** aralığındaki pozitif bir basit kesirdir. Tersi olarak $a^2 > a$ ise $a < 0$ veya $a > 1$ olur. Bu kalıp KPSS''de hemen her yıl aralık daraltma veya kesinlik sorusu olarak karşımıza çıkar."
  },
  {
    "type": "table",
    "headers": [
      "İfade / İşlem",
      "Kural",
      "Kritik Örnek"
    ],
    "rows": [
      [
        "Negatif ile çarpma/bölme",
        "Yön kesinlikle değişir",
        "$\\frac{2x-5}{-3} \\ge 1 \\Rightarrow 2x-5 \\le -3$"
      ],
      [
        "$x \\in (-3, 4)$ iken $x^2$ aralığı",
        "$0$ aralıkta ise alt sınır $0 \\le x^2$ olur",
        "$-3 < x < 4 \\Rightarrow 0 \\le x^2 < 16$"
      ],
      [
        "$x - y$ aralığı bulma",
        "$-y$ aralığını bulup $x$ ile topla",
        "Taraf tarafa çıkarma yasaktır"
      ],
      [
        "$a^2 < a$ koşulu",
        "Sayı $0$ ile $1$ arasındadır",
        "$0 < a < 1$"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$x$ ve $y$ gerçel sayıları için $-3 < x < 4$ ve $-2 < y < 5$ olsun; $x^2 - 2y$ ifadesinin alabileceği en küçük ve en büyük tam sayı değerlerini inceleyelim. Burada $x$ ve $y$ **gerçel sayı** olduğu için başlangıçta $x$ veya $y$''ye tam sayı değeri seçmek yasaktır! Önce aralıkları üretiriz: $-3$ ile $4$ arasında $0$ bulunduğundan $0 \\le x^2 < 16$ olur (çünkü $(-3)^2 = 9$ ve $4^2 = 16$). Sonra $-2 < y < 5$ eşitsizliğini $-2$ ile çarpıp yön değiştiririz: $-10 < -2y < 4$. İkisini taraf tarafa toplarsak $-10 < x^2 - 2y < 20$ bulunur. Böylece aralıktaki en küçük tam sayı $-9$, en büyük tam sayı $19$ olur. Eğer $a^2 < a$ verilirse $0 < a < 1$ yazıp $6a - 1$ aralığını $-1 < 6a - 1 < 5$ şeklinde buluruz."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**TAM SAYI İSE SEÇ, GERÇEL SAYI İSE ARALIK KUR**: Soru kökünde \"tam sayı\" yazıyorsa doğrudan uygun tam sayıları seç; \"gerçel sayı\" yazıyorsa asla tekil değer seçme, istenen ifadeyi aralık işlemleriyle sıfırdan üret!"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Üç büyük hata sürekli tuzak olarak kurulur: Birincisi, $-3 < x < 4$ aralığının karesini alırken alt sınırı $(-3)^2 = 9$ yazıp $9 < x^2 < 16$ demektir; oysa aralıkta $0$ olduğu için $x^2$ en az $0$ olur ($0 \\le x^2 < 16$). İkincisi, \"gerçel sayı\" sorusunda tam sayı seçmeye çalışarak ara kesirli değerlerin ürettiği tam sayıları kaçırmaktır. Üçüncüsü, $\\frac{2x-5}{-3} \\ge 1$ işleminde $-3$ ile çarparken $\\ge$ işaretini $\\le$ yapmayı unutmaktır."
  },
  {
    "type": "key_points",
    "items": [
      "Eşitsizliği negatif sayıyla çarparken veya bölerken yön mutlaka ters döner.",
      "Taraf tarafa çıkarma yapılmaz; eksili eşitsizliği $-1$ ile çarpıp taraf tarafa topla.",
      "Negatiften pozitife geçen aralığın karesi alınırken alt sınır her zaman $0 \\le x^2$ olur.",
      "Tam sayı sorularında baştan değer seçilir; gerçel sayı sorularında önce aralık üretilir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0467e393-e83e-568a-9b94-c9796d20c159",
      "0feda377-f0b4-57cc-aa55-d1eb8f96e890"
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
  'matematik_geometri.basit_esitsizlikler_ve_mutlak_deger.02',
  'Matematik & Geometri',
  'Basit Eşitsizlikler ve Mutlak Değer',
  2,
  'Bölüm 2: Mutlak Değer Tanımı, Özellikleri ve Sıfır Eşitliği',
  'Bir $x$ gerçel sayısının sayı doğrusunda başlangıç noktası olan $0$''a uzaklığına $x$''in mutlak değeri denir ve $\lvert x \rvert$ ile gösterilir.  Uzaklık hiçbir zaman negatif olamayacağından $\lvert x \rvert \ge 0$''dır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir $x$ gerçel sayısının sayı doğrusunda başlangıç noktası olan $0$''a uzaklığına $x$''in **mutlak değeri** denir ve $\\lvert x \\rvert$ ile gösterilir. Uzaklık hiçbir zaman negatif olamayacağından $\\lvert x \\rvert \\ge 0$''dır. Mutlak değerin parçalı tanımı tüm mutlak değer sorularının anahtarıdır:"
  },
  {
    "type": "paragraph",
    "text": "$$\\lvert x \\rvert = x \\quad (x \\ge 0 \\text{ ise, aynen çıkar})$$"
  },
  {
    "type": "paragraph",
    "text": "$$\\lvert x \\rvert = -x \\quad (x < 0 \\text{ ise, eksi ile çarpılıp çıkar})$$"
  },
  {
    "type": "paragraph",
    "text": "Burada \"$-x$\" ifadesi sonucun negatif olduğu anlamına gelmez; $x$ zaten negatif olduğu için önündeki eksi onu pozitife çevirir (örneğin $x = -5$ iken $\\lvert x \\rvert = -(-5) = 5$). Bu nedenle mutlak değerin içini sıfırın sağında mı solunda mı olduğuna göre işaret inceleyip pozitifse **olduğu gibi**, negatifse **tüm terimlerin işaretini değiştirerek** dışarı çıkarmalısın."
  },
  {
    "type": "heading",
    "text": "Mutlak Değerin Temel Özellikleri ve İç İçe Mutlak Değer"
  },
  {
    "type": "paragraph",
    "text": "Mutlak değerin en çok kullanılan cebirsel özellikleri şunlardır:"
  },
  {
    "type": "bullets",
    "items": [
      "$\\lvert -x \\rvert = \\lvert x \\rvert$ ve $\\lvert x - y \\rvert = \\lvert y - x \\rvert$ (çıkarma işleminde sıra değişse bile uzaklık değişmez).",
      "$\\lvert x \\cdot y \\rvert = \\lvert x \\rvert \\cdot \\lvert y \\rvert$ ve $\\lvert \\frac{x}{y} \\rvert = \\frac{\\lvert x \\rvert}{\\lvert y \\rvert}$ ($y \\neq 0$).",
      "$\\sqrt{x^2} = \\lvert x \\rvert$ (çift dereceli kökten çıkan ifade mutlaka mutlak değerle çıkar).",
      "**Sıfır Toplam Özelliği:** $\\lvert A \\rvert + \\lvert B \\rvert = 0$ (veya mutlak değer ile çift kuvvet toplamı $0$) ise ikisi de negatif olamayacağından **hem $A = 0$ hem de $B = 0$** olmak zorundadır."
    ]
  },
  {
    "type": "paragraph",
    "text": "Eğer mutlak değerin içi başka bir mutlak değer içeriyorsa ya da harfli sıralama ($a < 0 < b$ ve $\\lvert a \\rvert > b$) verilmişse, sayı vererek değil kesin işaret ve büyüklük karşılaştırmasıyla ilerle: $\\lvert a \\rvert > b$ ve $a$ negatifse $a$''nın mutlak uzaklığı $b$''den fazladır, yani $a + b < 0$ kesindir!"
  },
  {
    "type": "table",
    "headers": [
      "İfade",
      "İçinin İşareti",
      "Dışarı Çıkış Biçimi"
    ],
    "rows": [
      [
        "$\\lvert x - y \\rvert$ ($x < y$ ise)",
        "Negatif",
        "$y - x$"
      ],
      [
        "$\\lvert x - y \\rvert$ ($x > y$ ise)",
        "Pozitif",
        "$x - y$"
      ],
      [
        "$\\lvert x \\rvert + \\lvert y \\rvert = 0$",
        "Her ikisi $\\ge 0$",
        "$x = 0$ ve $y = 0$"
      ],
      [
        "$\\lvert x - a \\rvert$ geometrik anlamı",
        "Uzaklık",
        "$x$''in $a$''ya olan uzaklığı"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$x < 0 < y$ olmak üzere $\\lvert x - y \\rvert + \\lvert x \\rvert - \\lvert y \\rvert$ ifadesini sadeleştirelim. Önce her mutlak değerin içinin işaretini belirleriz: $x$ negatif, $y$ pozitif olduğundan $x - y < 0$ (negatif), $x < 0$ (negatif), $y > 0$ (pozitif). Şimdi işaretlere göre dışarı çıkarırız: ilk mutlak değer eksi ile çarpılarak $-(x - y) = -x + y$, ikinci mutlak değer $-x$, üçüncü mutlak değer olduğu gibi $y$ çıkar. Başındaki eksiyle birleştirirsek $(-x + y) + (-x) - (y) = -2x$ sonucunu elde ederiz. Başka bir soru tipinde $\\lvert 2x - 6 \\rvert + \\lvert y + 4 \\rvert = 0$ verilseydi her iki mutlak değer sıfır olacağından $2x - 6 = 0 \\Rightarrow x = 3$ ve $y + 4 = 0 \\Rightarrow y = -4$ çıkar, çarpımları $3 \\cdot (-4) = -12$ olurdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "$x < 0 < y$ veriliyorken $\\lvert x \\rvert$ ifadesini sadece $x$ diye çıkarmak veya $-\\lvert y \\rvert$ önündeki eksiyi yok saymak en büyük işaretleme hatalarıdır. Mutlak değeri kaldırırken önüne normal parantez koyup dışındaki işareti paranteze dağıtarak yazarsan işaret hatası yapmazsın. Ayrıca $\\lvert a \\rvert > b$ gibi bir şart varken $a + b$''nin işaretini soran sorularda sayı denerken $\\lvert a \\rvert > \\lvert b \\rvert$ koşulunu sağlamayan sayılar seçmek yanlış yargıya götürür."
  },
  {
    "type": "key_points",
    "items": [
      "Mutlak değer bir uzaklıktır; sonucu asla negatif olamaz ($\\lvert A \\rvert \\ge 0$).",
      "Dışarı çıkarırken önce içerideki ifadenin işaretini test et: pozitifse aynen, negatifse eksiyle çarparak çıkar.",
      "İki mutlak değerin toplamı $0$ ise ayrı ayrı ikisinin de içi sıfırdır.",
      "Çift dereceli kökten çıkan ifade doğrudan $x$ değil $\\lvert x \\rvert$ olarak çıkar."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "1137f2b8-e8e0-57b6-9b5e-6a4f953c6c14",
      "2180a9a2-74b5-5dec-8ea2-0147321ccfc3"
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
  'matematik_geometri.basit_esitsizlikler_ve_mutlak_deger.03',
  'Matematik & Geometri',
  'Basit Eşitsizlikler ve Mutlak Değer',
  3,
  'Bölüm 3: Mutlak Değerli Denklemler ve Eşitsizlikler',
  'Mutlak değerli denklemlerde tek temel kural vardır: $a \ge 0$ iken $\lvert f(x) \rvert = a$ denklemi ya $f(x) = a$ ya da $f(x) = -a$ çözümlerini verir.  Eğer mutlak değer negatif bir sayıya eşitlenmişse ($\lvert x - 2 \rvert = -3$) çözüm kümesi boş kümedir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Mutlak değerli denklemlerde tek temel kural vardır: $a \\ge 0$ iken $\\lvert f(x) \\rvert = a$ denklemi **ya $f(x) = a$ ya da $f(x) = -a$** çözümlerini verir. Eğer mutlak değer negatif bir sayıya eşitlenmişse ($\\lvert x - 2 \\rvert = -3$) çözüm kümesi **boş kümedir**. Eğer $\\lvert f(x) \\rvert = g(x)$ biçiminde sağ tarafta da değişken varsa, bulduğun $x$ değerlerini $g(x) \\ge 0$ şartında mutlaka yerine koyup kontrol etmelisin; $g(x)$''i negatif yapan kök **alınmaz**. İki mutlak değer birbirine eşitse ($\\lvert f(x) \\rvert = \\lvert g(x) \\rvert$) yine $f(x) = g(x)$ veya $f(x) = -g(x)$ çözülür ve burada sağ taraf kontrolüne gerek yoktur."
  },
  {
    "type": "heading",
    "text": "Mutlak Değerli Eşitsizliklerin İki Kalıbı"
  },
  {
    "type": "paragraph",
    "text": "Mutlak değerli eşitsizliklerde iki temel kalıp vardır ($a > 0$):"
  },
  {
    "type": "bullets",
    "items": [
      "**Küçüktür kalıbı ($\\lvert f(x) \\rvert < a$ veya $\\le a$):** İfade $-a$ ile $+a$ arasına sıkışır: $-a < f(x) < a$.",
      "**Büyüktür kalıbı ($\\lvert f(x) \\rvert > a$ veya $\\ge a$):** İfade $a$''nın sağında veya $-a$''nın solunda iki ayrı bölgededir: $f(x) > a$ veya $f(x) < -a$."
    ]
  },
  {
    "type": "paragraph",
    "text": "Çift taraflı mutlak değer eşitsizliği ($2 < \\lvert x - 1 \\rvert \\le 5$ gibi) hem alttan hem üstten sınırlıdır. Bu durumda ya doğrudan $2 < x - 1 \\le 5$ veya $-5 \\le x - 1 < -2$ şeklinde **iki ayrı simetrik bölge** yazılır; ya da mutlak değerin uzaklık anlamı kullanılarak \"$1$ noktasına uzaklığı $2$''den büyük, en fazla $5$ birim olan sayılar\" düşünülür: sağ kolda $\\{4, 5, 6\\}$, sol kolda $\\{-4, -3, -2\\}$ olmak üzere toplam $6$ tam sayı elde edilir. Benzer şekilde $\\lvert x - a \\rvert + \\lvert x - b \\rvert$ toplamının alabileceği **en küçük değer**, $x$ değeri $a$ ile $b$ arasına seçildiğinde oluşan iki nokta arasındaki uzaklık yani $\\lvert a - b \\rvert$''dir. Eğer kesirli bir ifadede pay ve paydada aynı ifadenin mutlak değeri varsa ($\\frac{1}{\\lvert x - 2 \\rvert} > \\frac{1}{4}$ gibi) pozitif terimlerle içler-dışlar çarpımı yaparak doğrudan $\\lvert x - 2 \\rvert < 4$ ($x \\neq 2$ şartıyla) yazabilirsin."
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 468 64\" width=\"468\" height=\"64\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><line x1=\"12\" y1=\"30\" x2=\"160.5\" y2=\"30\"/><line x1=\"171.5\" y1=\"30\" x2=\"296.5\" y2=\"30\"/><line x1=\"307.5\" y1=\"30\" x2=\"460\" y2=\"30\"/><path d=\"M460 30 l-8 -4 m8 4 l-8 4\"/><path d=\"M12 30 l8 -4 m-8 4 l8 4\"/><line x1=\"64\" y1=\"30\" x2=\"160.5\" y2=\"30\" stroke-width=\"5\" stroke-opacity=\"0.55\"/><line x1=\"307.5\" y1=\"30\" x2=\"404\" y2=\"30\" stroke-width=\"5\" stroke-opacity=\"0.55\"/><line x1=\"30\" y1=\"25\" x2=\"30\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"30\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-5</text><line x1=\"64\" y1=\"25\" x2=\"64\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"64\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-4</text><line x1=\"98\" y1=\"25\" x2=\"98\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"98\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-3</text><line x1=\"132\" y1=\"25\" x2=\"132\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"132\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-2</text><text x=\"166\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-1</text><line x1=\"200\" y1=\"25\" x2=\"200\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"200\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">0</text><line x1=\"234\" y1=\"25\" x2=\"234\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"234\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">1</text><line x1=\"268\" y1=\"25\" x2=\"268\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"268\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">2</text><text x=\"302\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">3</text><line x1=\"336\" y1=\"25\" x2=\"336\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"336\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">4</text><line x1=\"370\" y1=\"25\" x2=\"370\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"370\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">5</text><line x1=\"404\" y1=\"25\" x2=\"404\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"404\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">6</text><line x1=\"438\" y1=\"25\" x2=\"438\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"438\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">7</text><circle cx=\"64\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"166\" cy=\"30\" r=\"5\" stroke-width=\"1.8\"/><circle cx=\"302\" cy=\"30\" r=\"5\" stroke-width=\"1.8\"/><circle cx=\"404\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/></svg>",
    "caption": "Şekil 2. $2 < \\lvert x - 1 \\rvert \\le 5$ eşitsizliğinin sayı doğrusundaki simetrik iki bölgesi"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sayı doğrusunda $3$ noktasına olan uzaklığı en fazla $5$ birim olan kaç tam sayı vardır? \"Uzaklığı en fazla $5$\" ifadesi mutlak değerle $\\lvert x - 3 \\rvert \\le 5$ şeklinde yazılır. Küçüktür kalıbı gereği $-5 \\le x - 3 \\le 5$ olur. Her tarafa $3$ eklersek $-2 \\le x \\le 8$ aralığı elde edilir. Bu aralıktaki tam sayıların sayısı $8 - (-2) + 1 = 11$ adettir. Başka bir örnekte $\\lvert x - 2 \\rvert < 3$ ve $2x + y = 7$ koşulları verilsin: önce $-3 < x - 2 < 3 \\Rightarrow -1 < x < 5$ yazarız. $y = 7 - 2x$ olduğundan $x$ aralığından $-2x$ üretiriz ($-10 < -2x < 2$), ardından $7$ ekleyerek $-3 < y < 9$ buluruz. Aralıktaki $y$ tam sayıları $-2$''den $8$''e kadar $11$ tanedir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki tuzak adayın yarısını eler: Birincisi, $\\lvert x - 2 \\rvert = 2x - 7$ gibi sağ tarafında bilinmeyen bulunan denklemde bulduğun her kökü kontrol etmemektir; örneğin $x = 3$ için sağ taraf $-1$ çıkıyorsa o kök **geçersizdir**. İkincisi, $2 < \\lvert x - 1 \\rvert \\le 5$ gibi çift eşitsizliklerde yalnızca pozitif kolu ($3 < x \\le 6$) alıp negatif simetrik kolu ($-4 \\le x < -1$) unutmak veya açık-kapalı sınırları karıştırıp boş çemberli uçları da tam sayı sayısına katmaktır."
  },
  {
    "type": "key_points",
    "items": [
      "$\\lvert A \\rvert = a$ ($a \\ge 0$) için $A = a$ veya $A = -a$ çözülür; $a < 0$ ise çözüm boş kümedir.",
      "Sağ tarafta $x$ varsa bulunan kökleri $g(x) \\ge 0$ şartıyla mutlaka doğrula.",
      "$\\lvert A \\rvert < a \\Leftrightarrow -a < A < a$; $\\lvert A \\rvert > a \\Leftrightarrow A > a \\text{ veya } A < -a$.",
      "$\\lvert x - c \\rvert \\le r$ ifadesi \"$c$ noktasına uzaklığı en fazla $r$ birim olan sayılar\" demektir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "265f37b2-2c1f-56bb-b27c-ec8a15a38699",
      "31086a42-4cb6-5f15-b037-629adf089941"
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
