-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Üslü ve Köklü İfadeler
-- Kaynak: docs/konu_anlatimi/matematik/05_uslu_ve_koklu_ifadeler.md
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
  'matematik_geometri.uslu_ve_koklu_ifadeler.01',
  'Matematik & Geometri',
  'Üslü ve Köklü İfadeler',
  1,
  'Bölüm 1: Üslü Sayıların Temel Kuralları ve Negatif Üs',
  'Bir $a$ gerçel sayısının kendisiyle $n$ kez çarpılmasına $a^n$ üslü ifadesi denir; $a$ taban, $n$ üstür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir $a$ gerçel sayısının kendisiyle $n$ kez çarpılmasına $a^n$ üslü ifadesi denir; $a$ taban, $n$ üstür. KPSS üslü sayı sorularının temeli beş değişmez kurala dayanır:"
  },
  {
    "type": "paragraph",
    "text": "1. **Sıfır ve Bir Kuvveti:** $a \\neq 0$ iken $a^0 = 1$ (ancak $0^0$ belirsizdir) ve her $a$ için $a^1 = a$, $1^n = 1$. 2. **Negatif Üs:** Negatif üs sayıyı negatif yapmaz; **yalnızca tabanı çarpmaya göre ters çevirir**: $a^{-n} = \\frac{1}{a^n}$ ve $\\left(\\frac{a}{b}\\right)^{-n} = \\left(\\frac{b}{a}\\right)^n$. 3. **Çarpma ve Bölme:** Tabanlar aynıysa çarpmada üsler toplanır ($a^x \\cdot a^y = a^{x+y}$), bölmede çıkarılır ($\\frac{a^x}{a^y} = a^{x-y}$). Üsler aynıysa tabanlar çarpılır veya bölünür ($a^x \\cdot b^x = (a \\cdot b)^x$). 4. **Üssün Üssü:** $(a^x)^y = a^{x \\cdot y} = (a^y)^x$. Üslerin yer değiştirebilmesi üslü denklem sorularında en güçlü hamledir. 5. **İşaret Kuralı:** Negatif bir tabanın çift parantez kuvveti pozitif, tek kuvveti negatiftir. Parantez yoksa eksi işaret kuvvetten etkilenmez: $(-2)^4 = +16$ iken $-2^4 = -16$ olur."
  },
  {
    "type": "heading",
    "text": "Toplama-Çıkarma ve Bileşik Taban Sadeleştirme"
  },
  {
    "type": "paragraph",
    "text": "Üslü ifadelerde toplama ve çıkarma yapılırken üsler doğrudan toplanmaz; **en küçük üslü terimin parantezine** alarak sadeleştirme yapılır. Örneğin $2^{-2} + 2^{-3}$ işleminde en küçük üs $-3$''tür: $2^{-3}(2^1 + 1) = 3 \\cdot 2^{-3}$. Bu yöntemin ikinci bir hızlı alternatifi de tüm kesri paydadaki kuvvetle veya $2^4$ ile genişletmektir: $\\dfrac{2^{-2} + 2^{-3}}{2^{-4}}$ ifadesinde pay ve paydayı $2^4$ ile çarparsak $2^2 + 2^1 = 6$ sonucu tek satırda çıkar. Kesirli ve bilinmeyenli ifadelerde ise bileşik tabanlar ($6, 10, 12, 18$) daima asal çarpanlara ayrılıp ortak çarpan parantezine alınır."
  },
  {
    "type": "heading",
    "text": "Bilimsel Gösterim ve Basamak Sayısı Soruları"
  },
  {
    "type": "paragraph",
    "text": "Çok büyük veya çok küçük sayıların basamak sayısını bulmak için $10$''un kuvvetleri kullanılır: $a \\cdot 10^n$ biçimindeki bir çarpımda ($1 \\le a < 10$ ve $n \\in \\mathbb{Z}^+$), sayının toplam basamak sayısı $n + 1$ olur; eğer $a$ sayısı $k$ basamaklı bir tam sayı ise $a \\cdot 10^n$ sayısının basamak sayısı $k + n$ olur. Bu kalıpta karşına $8^4 \\cdot 25^7$ gibi bir ifade çıktığında hemen tabanları $2$ ve $5$ asal tabanlarına çevir: $(2^3)^4 \\cdot (5^2)^7 = 2^{12} \\cdot 5^{14} = 5^2 \\cdot (2 \\cdot 5)^{12} = 25 \\cdot 10^{12}$. Buradan sayının $2 + 12 = 14$ basamaklı ve sondan $12$ basamağının sıfır olduğu anında görülür."
  },
  {
    "type": "heading",
    "text": "Ondalık Sayılarda Negatif ve Pozitif $10$ Kuvveti"
  },
  {
    "type": "paragraph",
    "text": "Ondalık sayı içeren üslü sorularda virgülü kaydırarak sayıyı tam sayı çarpı $10$''un kuvveti hâline getirmek işlem hatasını önler: örneğin $0{,}004 = 4 \\cdot 10^{-3}$ ve $0{,}25 = 25 \\cdot 10^{-2}$ yazılır. Virgül sağa kaydırıldıkça $10$''un üssü küçülür (negatif yönde artar), virgül sola kaydırıldıkça $10$''un üssü büyür. Özellikle $\\frac{0{,}008 \\cdot 10^5}{0{,}02 \\cdot 10^{-2}}$ gibi işlemlerde tüm katsayıları tam sayıya çevirdikten sonra $10$''un üslerini tek çatıda toplamak en güvenli yoldur."
  },
  {
    "type": "table",
    "headers": [
      "Kural",
      "Doğru Uygulama",
      "Sık Yapılan Hata"
    ],
    "rows": [
      [
        "Negatif kuvvet",
        "$2^{-3} = \\frac{1}{2^3} = \\frac{1}{8}$",
        "$-8$ veya $-6$ yazmak"
      ],
      [
        "Parantez farkı",
        "$(-3)^2 = 9$, $-3^2 = -9$",
        "İkisini de $+9$ sanmak"
      ],
      [
        "Toplama/Çıkarma",
        "$2^5 + 2^5 = 2 \\cdot 2^5 = 2^6$",
        "$2^{10}$ veya $4^5$ yazmak"
      ],
      [
        "Bileşik taban açılımı",
        "$6^{x+1} = 2^{x+1} \\cdot 3^{x+1}$",
        "Tabanları ayırmadan sadeleştirmek"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$$A = \\frac{6^{x+2} - 6^{x+1}}{3^x \\cdot 2^{x+1}}$$ ifadesini sadeleştirelim. Payda en küçük kuvvet olan $6^{x+1}$ parantezine alırsak $6^{x+1}(6^1 - 1) = 5 \\cdot 6^{x+1}$ olur. Paydada ise tabanları aynı üsse eşitlemek için $6^x$ yapısına benzetiriz: $3^x \\cdot 2^{x+1} = 3^x \\cdot 2^x \\cdot 2 = 6^x \\cdot 2$. Paydaki $6^{x+1}$ yerine $6^x \\cdot 6$ yazarsak: $\\frac{5 \\cdot 6^x \\cdot 6}{2 \\cdot 6^x} = \\frac{30}{2} = 15$ elde edilir. Benzer biçimde $\\dfrac{2^{-2} + 2^{-3}}{2^{-4}}$ sorusunda en küçük kuvvet olan $2^{-4}$ ile sadeleştirdiğimizde $\\frac{\\frac{1}{4} + \\frac{1}{8}}{\\frac{1}{16}} = \\frac{3}{8} \\cdot 16 = 6$ bulunur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki tuzak çok puan götürür: Birincisi, $-2^4$ ile $(-2)^4$ farkını gözden kaçırıp ikisini de $+16$ almaktır ($-2^4 = -16$). İkincisi, negatif üslerde ($2^{-2} + 2^{-3}$) hangisinin daha küçük olduğunu karıştırmaktır; $-3 < -2$ olduğundan küçük olan $-3$ parantezine alınmalıdır. Ayrıca tabanları farklı üstlü ifadeleri çarparken $(2^3) \\cdot (3^2)$ gibi üsleri toplamaya çalışmak da yasaktır."
  },
  {
    "type": "key_points",
    "items": [
      "Negatif üs işareti değil çarpmaya göre tersliği ifade eder ($a^{-n} = \\frac{1}{a^n}$).",
      "Toplama ve çıkarmada mutlaka en küçük üslü terimin parantezine al.",
      "$(a^x)^y = (a^y)^x$ özelliği sayesinde tabanla üssün yerini ihtiyaca göre değiştirebilirsin.",
      "Bileşik tabanları ($6, 12, 18$) daima asal tabanlara ($2, 3$) ayırarak ortak sadeleştirme yap."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0043c9f0-f174-5cd9-969c-52584d7682bb",
      "02983c40-1ad2-5062-a6a9-9b26e14b77a6"
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
  'matematik_geometri.uslu_ve_koklu_ifadeler.02',
  'Matematik & Geometri',
  'Üslü ve Köklü İfadeler',
  2,
  'Bölüm 2: Üslü Denklemler, Kuvvet Eşitleme ve Sıralama',
  'Üslü denklemler üç ana başlık altında çözülür:',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Üslü denklemler üç ana başlık altında çözülür:"
  },
  {
    "type": "bullets",
    "items": [
      "**Tabanlar eşitse:** $a \\notin \\{-1, 0, 1\\}$ olmak üzere $a^{f(x)} = a^{g(x)} \\Rightarrow f(x) = g(x)$.",
      "**Üsler tek ve eşitse:** $a^{2n+1} = b^{2n+1}$ denkleminde tek kuvvet işareti koruduğu için doğrudan $a = b$ yazılır.",
      "**Üsler çift ve eşitse:** $a^{2n} = b^{2n}$ denkleminde mutlak değer mantığıyla **$a = b$ veya $a = -b$** olmak üzere iki durum birden çözülür!"
    ]
  },
  {
    "type": "heading",
    "text": "$A^B = 1$ Özel Denklemi ve Karşılıklı Kuvvet Eşitleme"
  },
  {
    "type": "paragraph",
    "text": "KPSS''nin en sevdiği tuzaklı denklem tipi olan **$A^B = 1$** kalıbında **üç ayrı ihtimal** kontrol edilmelidir: birinci olarak taban $1$ olabilir ($A = 1$); ikinci olarak taban sıfır olmamak şartıyla üs $0$ olabilir ($B = 0$ ve $A \\neq 0$); üçüncü olarak taban $-1$ ve üs **çift** olabilir ($A = -1$ iken $B$ çift tam sayı)."
  },
  {
    "type": "paragraph",
    "text": "Farklı tabanlarda kuvvet verilip çarpım soruluyorsa ($2^a = 5$ ve $5^b = 16$ gibi) **yerine koyma veya aynı tabanları alt alta oranlama** uygulanır: $5 = 2^a$ olduğundan ikinci eşitlikte $(2^a)^b = 2^{ab} = 2^4 \\Rightarrow a \\cdot b = 4$ doğrudan çıkar. Eğer $2^x = 3^y$ ve $2^z = 3^t$ gibi iki denklem verilmişse aynı tabanların alt alta gelmesine dikkat edilerek üslerin oranları eşitlenir: $\\frac{x}{z} = \\frac{y}{t}$. Bazı sorularda ise $\\frac{1}{a} + \\frac{1}{b}$ gibi kesirli toplam istenir: $2^a = 15$ ve $3^b = 15$ verildiğinde her iki tarafın kuvvetleri $\\frac{1}{a}$ ve $\\frac{1}{b}$ olarak alınarak $2 = 15^{\\frac{1}{a}}$ ve $3 = 15^{\\frac{1}{b}}$ yazılır; taraf tarafa çarpıldığında $6 = 15^{\\frac{1}{a} + \\frac{1}{b}}$ elde edilir."
  },
  {
    "type": "paragraph",
    "text": "Üslü sayılarda **sıralama** yapılırken ya tabanlar eşitlenir (taban $> 1$ ise üssü büyük olan büyüktür; $0 < \\text{taban} < 1$ ise üssü küçük olan büyüktür) ya da üsler EBOB yardımıyla eşitlenir ($2^{40}, 3^{30}, 5^{20}$ sayılarında üsler $10$''un katı olduğundan $16^{10}, 27^{10}, 25^{10}$ yazılır). Negatif tabanlı sıralamalarda ise üssün tek mi çift mi olduğuna göre önce işaret belirlenir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$(x - 3)^{x^2 - 9} = 1$ denklemini sağlayan farklı $x$ tam sayılarını bulalım. Üç ihtimali sırayla deneyelim: Birincisi taban $= 1$ durumu, yani $x - 3 = 1 \\Rightarrow x = 4$ (sağlar: $1^7 = 1$). İkincisi üs $= 0$ durumu, yani $x^2 - 9 = 0 \\Rightarrow x = 3$ veya $x = -3$. Fakat $x = 3$ yazıldığında taban da $0$ olup $0^0$ belirsizliği doğar, bu yüzden **$x = 3$ elenir!** $x = -3$ için ise $(-6)^0 = 1$ sağlanır. Üçüncüsü taban $= -1$ durumu: $x - 3 = -1 \\Rightarrow x = 2$. Bu durumda üs $2^2 - 9 = -5$ (tek sayı) çıkar ve $(-1)^{-5} = -1 \\neq 1$ olduğu için **$x = 2$ de elenir**. Geçerli değerler yalnızca $4$ ve $-3$''tür; toplamları $4 + (-3) = 1$ olur. Bir başka örnekte $(3x - 7)^4 = (x - 1)^4$ denkleminde üs çift olduğundan hem $3x - 7 = x - 1 \\Rightarrow x = 3$ hem de $3x - 7 = -(x - 1) \\Rightarrow 4x = 8 \\Rightarrow x = 2$ çözülür."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**1''E EŞİTSE 3 KAPIYI ÇAL**: $A^B = 1$ gördüğünde tek tek kontrol et: birincisi $A = 1$, ikincisi $B = 0$ ($A \\neq 0$ kontrolüyle), üçüncüsü $A = -1$ ($B$ çift sayı kontrolüyle)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "$A^B = 1$ sorularında $0^0$ belirsizliğini kontrol etmeden $B = 0$ kökünü doğrudan kabul etmek ve $(3x - 7)^4 = (x - 1)^4$ gibi çift üslü denklemlerde negatif eşiti ($3x - 7 = -x + 1$) yazmayı unutmak klasik kayıp noktalarıdır. Üslü eşitsizliklerde de taban $0$ ile $1$ arasındaysa ($\\frac{1}{2}$ veya $0{,}5$) tabanları atarken eşitsizlik yönünün ters döneceğini unutma."
  },
  {
    "type": "key_points",
    "items": [
      "Çift kuvvet eşitliğinde ($A^{2n} = B^{2n}$) hem $A = B$ hem de $A = -B$ çözülür.",
      "$A^B = 1$ denkleminde $0^0$ durumunu mutlaka ele, $-1$ tabanında ise üssün çift olduğundan emin ol.",
      "Büyük üslü sayıları sıralarken üslerin EBOB''unu dışarı alıp içerideki tabanları karşılaştır.",
      "$0 < a < 1$ aralığındaki basit kesirlerin üssü büyüdükçe sayı küçülür."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0dd8e9d1-9a82-58c1-b8dc-ab015ac20d0a",
      "0e9eade2-81d1-5e0f-9636-1a940474fe95"
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
  'matematik_geometri.uslu_ve_koklu_ifadeler.03',
  'Matematik & Geometri',
  'Üslü ve Köklü İfadeler',
  3,
  'Bölüm 3: Köklü İfadeler, Eşlenik ve Kök Dışına Çıkarma',
  '$n \ge 2$ bir tam sayı olmak üzere $x^n = a$ eşitliğini sağlayan $x$ sayısına $a$''nın $n$.  dereceden kökü denir ve $\sqrt[n]{a}$ ile gösterilir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "$n \\ge 2$ bir tam sayı olmak üzere $x^n = a$ eşitliğini sağlayan $x$ sayısına $a$''nın $n$. dereceden kökü denir ve $\\sqrt[n]{a}$ ile gösterilir. Köklü ifadelerde **tanım kümesi** en temel başlangıç adımıdır: kök derecesi **çift** ($2, 4, 6, \\ldots$) ise kök içi negatif olamaz ($\\sqrt[2n]{f(x)}$ için $f(x) \\ge 0$ şarttır); kök derecesi **tek** ($3, 5, 7, \\ldots$) ise kök içi bütün gerçel sayılar olabilir."
  },
  {
    "type": "paragraph",
    "text": "Çift dereceli kökten ifade çıkarılırken mutlak değer zorunluluğunu asla unutma:"
  },
  {
    "type": "paragraph",
    "text": "$$\\sqrt[2n]{a^{2n}} = \\lvert a \\rvert \\qquad \\text{ve} \\qquad \\sqrt[2n+1]{a^{2n+1}} = a$$"
  },
  {
    "type": "heading",
    "text": "Köklerde İşlemler, Eşlenik ve $\\sqrt{a \\pm 2\\sqrt{b}}$ Kalıbı"
  },
  {
    "type": "paragraph",
    "text": "Köklü ifadeleri üslü biçime çevirmek ($a^{\\frac{m}{n}} = \\sqrt[n]{a^m}$) derece eşitleme ve sıralama sorularını zahmetsizce çözer. Kök içindeki sayılar çarpılır veya bölünürken **kök dereceleri aynı** olmalıdır ($\\sqrt[m]{a} \\cdot \\sqrt[m]{b} = \\sqrt[m]{a \\cdot b}$). Dereceler farklıysa EKOK''ta eşitlenir (bir kök derecesini $k$ ile çarparsan içindeki sayının üssünü de $k$ ile çarpmalısın). Toplama ve çıkarma içinse hem kök dereceleri hem de **kök içleri birebir aynı** olmalıdır ($5\\sqrt{3} - 2\\sqrt{3} = 3\\sqrt{3}$); bunun için önce $\\sqrt{75} = \\sqrt{25 \\cdot 3} = 5\\sqrt{3}$ biçiminde tam kare çarpanlar dışarı çıkarılır."
  },
  {
    "type": "paragraph",
    "text": "Paydada kök bulunması istenmediğinde pay ve payda **eşlenik** ile çarpılır: $\\sqrt{a}$''nın eşleniği $\\sqrt{a}$''dır ($\\sqrt{a} \\cdot \\sqrt{a} = a$); $\\sqrt{a} + \\sqrt{b}$''nin eşleniği ise $\\sqrt{a} - \\sqrt{b}$''dir ve çarpımları iki kare farkından $a - b$ tam sayısını verir. Özellikle $\\frac{1}{\\sqrt{n+1} + \\sqrt{n}} = \\sqrt{n+1} - \\sqrt{n}$ biçimindeki ardışık eşlenik toplamlarında da aradaki kökler birbirini sadeleştirir ve yalnızca en büyük kökle en küçük kök kalır."
  },
  {
    "type": "heading",
    "text": "Köklü Denklemler ve İç İçe Kökler"
  },
  {
    "type": "paragraph",
    "text": "Köklü bir denklemde ($\\frac{\\sqrt{x} + 2}{\\sqrt{x} - 2} = 3$ gibi) $\\sqrt{x} = t$ değişken değiştirmesi yapmak veya doğrudan içler-dışlar çarpımıyla $\\sqrt{x}$''i yalnız bırakmak en temiz çözümdür; ancak her iki tarafın karesini alırken eklenen **yalancı kökleri** önlemek için bulunan $x$ değeri mutlaka orijinal denklemde denenmelidir (çift dereceli kökün sonucu negatif bir sayıya eşit olamaz). İç içe çarpım veya bölüm hâlindeki köklerde ($\\sqrt{a \\sqrt[3]{a}}$ gibi) dışarıdaki $a$ sayısı içteki kökün derecesini üs olarak alıp içeri girer: $\\sqrt{\\sqrt[3]{a^3 \\cdot a}} = \\sqrt[6]{a^4}$."
  },
  {
    "type": "paragraph",
    "text": "**Özel İki Kareköklü Kalıp ($\\sqrt{a \\pm 2\\sqrt{b}}$):** İçteki kökün katsayısı mutlaka **$2$** olmalıdır! Çarpımları $b$''yi, toplamları $a$''yı veren iki pozitif sayı ($x > y$) bulunursa:"
  },
  {
    "type": "paragraph",
    "text": "$$\\sqrt{a + 2\\sqrt{b}} = \\sqrt{x} + \\sqrt{y} \\quad \\text{ve} \\quad \\sqrt{a - 2\\sqrt{b}} = \\sqrt{x} - \\sqrt{y}$$"
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 64\" width=\"300\" height=\"64\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><line x1=\"12\" y1=\"30\" x2=\"292\" y2=\"30\"/><path d=\"M292 30 l-8 -4 m8 4 l-8 4\"/><path d=\"M12 30 l8 -4 m-8 4 l8 4\"/><line x1=\"30\" y1=\"25\" x2=\"30\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"30\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">1</text><line x1=\"78\" y1=\"25\" x2=\"78\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"78\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">2</text><line x1=\"126\" y1=\"25\" x2=\"126\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"126\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">3</text><line x1=\"174\" y1=\"25\" x2=\"174\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"174\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">4</text><line x1=\"222\" y1=\"25\" x2=\"222\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"222\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">5</text><line x1=\"270\" y1=\"25\" x2=\"270\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"270\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">6</text><text x=\"126\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">√9</text><text x=\"152.4\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">A</text><text x=\"174\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">√16</text><circle cx=\"126\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"152.4\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"174\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/></svg>",
    "caption": "Şekil 1. Sayı doğrusunda karekök aralığı tahmini ($3 < \\sqrt{2n + 1} < 4$)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$\\sqrt{8 + 2\\sqrt{15}} - \\sqrt{8 - 2\\sqrt{15}}$ işleminin sonucunu bulalım. İçteki $\\sqrt{15}$''in önünde zaten $2$ katsayısı var. Çarpımları $15$, toplamları $8$ olan sayılar $5$ ve $3$''tür ($5 \\cdot 3 = 15$, $5 + 3 = 8$). Büyük sayıyı öne yazarak kuralı uygularız: $\\sqrt{8 + 2\\sqrt{15}} = \\sqrt{5} + \\sqrt{3}$ ve $\\sqrt{8 - 2\\sqrt{15}} = \\sqrt{5} - \\sqrt{3}$. İkisini çıkarırsak $(\\sqrt{5} + \\sqrt{3}) - (\\sqrt{5} - \\sqrt{3}) = 2\\sqrt{3}$ bulunur. Sayı doğrusu örneğinde ise $\\sqrt{2n+1}$ sayısı $3$ ($\\sqrt{9}$) ile $4$ ($\\sqrt{16}$) arasında verilmişse $9 < 2n + 1 < 16 \\Rightarrow 8 < 2n < 15 \\Rightarrow 4 < n < 7{,}5$ yazarak $n \\in \\{5, 6, 7\\}$ değerlerini elde ederiz."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki büyük tuzak vardır: Birincisi, $\\sqrt{x^2}$ ifadesini $x$ negatif iken mutlak değersiz doğrudan $x$ diye çıkarmaktır. İkincisi, $\\sqrt{a \\pm 2\\sqrt{b}}$ kalıbında aradaki eksi durumunda küçük sayıyı öne yazıp sonucu negatif çıkarmaktır ($\\sqrt{3} - \\sqrt{5}$ yanlıştır, karekökün sonucu negatif olamaz; büyük olan $\\sqrt{x}$ daima önde yazılır). Ayrıca içteki kökün önünde $2$ yoksa (örneğin $\\sqrt{7 + \\sqrt{40}}$) önce içeriden $4$ çarpanı çıkararak $2\\sqrt{10}$ yapmalı ya da ifadeyi $\\frac{\\sqrt{2}}{\\sqrt{2}}$ ile genişletmelisin."
  },
  {
    "type": "key_points",
    "items": [
      "Çift dereceli kökün içi $\\ge 0$ olmalıdır ve dışarı $\\lvert x \\rvert$ olarak çıkar.",
      "Köklü sayılarda toplama-çıkarma yalnızca kök derecesi ve kök içi aynı olan terimler arasında yapılır.",
      "Paydadaki $\\sqrt{a} \\pm \\sqrt{b}$ ifadesini yok etmek için eşleniğiyle çarp ($a - b$ tam sayısı oluşur).",
      "$\\sqrt{a \\pm 2\\sqrt{b}}$ kalıbında önce içteki kökün önünde $2$ katsayısını gör, büyük kökü daima öne yaz."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "21a468e1-1625-5213-a5a4-580c346a2411",
      "255823f8-9965-5ac3-bae2-37aa7a26abcf"
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
