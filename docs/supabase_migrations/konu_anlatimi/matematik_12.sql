-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Doğruda ve Üçgende Açılar, Üçgenler
-- Kaynak: docs/konu_anlatimi/matematik/12_dogruda_ve_ucgende_acilar_ucgenler.md
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
  'matematik_geometri.dogruda_ve_ucgende_acilar_ucgenler.01',
  'Matematik & Geometri',
  'Doğruda ve Üçgende Açılar, Üçgenler',
  1,
  'Bölüm 1: Doğruda Açılar ve Paralel Doğru Kuralları',
  'Geometri sorularında ilk adım şeklin yanındaki metni okuyarak hangi doğruların paralel ($\parallel$) ve hangi açıların eşit olduğunu işaretlemektir.  Doğru üzerinde oluşan tam açının ölçüsü $360^\circ$, doğru açının ölçüsü $180^\circ$ ve dik açının ölçüsü $90^\circ$''dir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Geometri sorularında ilk adım şeklin yanındaki metni okuyarak hangi doğruların paralel ($\\parallel$) ve hangi açıların eşit olduğunu işaretlemektir. Doğru üzerinde oluşan tam açının ölçüsü $360^\\circ$, doğru açının ölçüsü $180^\\circ$ ve dik açının ölçüsü $90^\\circ$''dir. Toplamları $90^\\circ$ olan iki açıya **tümler**, toplamları $180^\\circ$ olan iki açıya **bütünler** açılar denir. Kesişen iki doğrunun karşılıklı açıları (**ters açılar**) birbirine eşittir."
  },
  {
    "type": "heading",
    "text": "Paralel İki Doğru Arasındaki Pratik Kurallar"
  },
  {
    "type": "paragraph",
    "text": "$d_1 \\parallel d_2$ iki paralel doğru bir kesen ile kesildiğinde üç ana açı ilişkisi doğar: **yöndeş açılar** aynı yöne baktıkları için eşittir, **iç ters açılar (Z kuralı)** eşittir ve aynı tarafta içte kalan **karşı durumlu açılar (U kuralı)** toplamı $180^\\circ$''dir. Doğruda açı sorularında bilinmeyen açıya geçmeden önce verilen bütün $180^\\circ$ doğrusal açıları (örneğin bir doğrunun üzerinde yan yana duran açıları) ve ters açıları yaz; çoğu zaman paralel çizgi çekmeye bile gerek kalmadan üçgen veya dörtgenin iç açılarından sonuca ulaşılır."
  },
  {
    "type": "paragraph",
    "text": "Kırık çizgiler içeren sorularda kuralı göremiyorsan kırılma köşesinden **paralellere yeni bir paralel doğru** çiz; bütün karışık sorular anında Z ve U kurallarına bölünür! Eğer soru içinde $90^\\circ$''lik diklik ve açıortaylar aynı köşeden çıkıyorsa iki komşu bütünler açının açıortayları arasındaki açının daima **$90^\\circ$** olduğunu hatırla: $2a + 2b = 180^\\circ \\Rightarrow a + b = 90^\\circ$. Bu bilgi paralel kenar ve yamuk sorularında da sıkça işe yarar."
  },
  {
    "type": "paragraph",
    "text": "Sık kullanılan hızlandırıcı kalıplar şunlardır:"
  },
  {
    "type": "bullets",
    "items": [
      "**M Kuralı ($d_1 \\parallel d_2$):** Sola bakan açıların toplamı, sağa bakan açının ölçüsüne eşittir. Çok kırıklı **zikzak kuralında** da aynı şekilde sola bakan tüm dar açıların toplamı sağa bakan tüm dar açıların toplamına eşittir.",
      "**Kalem Ucu Kuralı:** Paralel iki doğru arasında tek yönde kırılan üç açının toplamı $360^\\circ$''dir. Genel olarak iki paralel doğru arasında $n$ tane iç açı oluşuyorsa bu açıların toplamı daima $(n - 1) \\cdot 180^\\circ$ kuralına uyar (örneğin $3$ açıda $360^\\circ$, $4$ açıda $540^\\circ$).",
      "**Paralel ve Açıortay Birlikteliği:** Paralel iki doğru arasında açıortay çizilmişse Z kuralından dolayı mutlaka bir **ikizkenar üçgen** gizlidir!",
      "**Bütünler ve Ters Açı Zinciri:** Kesişen doğruların bulunduğu şekillerde yan yana duran açılar $180^\\circ$''ye tamamlanırken karşılıklı açıların eşitliği doğrudan yazılır. Özellikle ışın yönlerine dikkat et: $[BA \\parallel [DE$ ifadesinde iki ışının aynı yöne mi yoksa zıt yöne mi baktığı hangi U veya Z kuralının çalışacağını belirler."
    ]
  },
  {
    "type": "table",
    "headers": [
      "Kural Adı",
      "Şekil Yapısı",
      "Açı Bağıntısı"
    ],
    "rows": [
      [
        "Z Kuralı (İç Ters)",
        "Paralel doğrular arası ters köşeler",
        "Açılar birbirine eşittir"
      ],
      [
        "U Kuralı (Karşı Durumlu)",
        "Aynı yöne bakan iki iç açı",
        "Toplamları $180^\\circ$''dir"
      ],
      [
        "M Kuralı / Zikzak",
        "Sağa ve sola kıvrılan ışınlar",
        "Sola bakanlar toplamı = Sağa bakanlar"
      ],
      [
        "Kalem Ucu",
        "Aynı tarafa kıvrılan $3$ açı",
        "Üçünün toplamı $360^\\circ$''dir"
      ]
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 340 228\" width=\"340\" height=\"228\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><line x1=\"30\" y1=\"30\" x2=\"310\" y2=\"30\"/><line x1=\"30\" y1=\"198\" x2=\"310\" y2=\"198\"/><line x1=\"119.6\" y1=\"30\" x2=\"214.8\" y2=\"114\"/><line x1=\"130.8\" y1=\"198\" x2=\"214.8\" y2=\"114\"/><path d=\"M119.6 30 L143.6 30 A24 24 0 0 1 137.6 45.9 Z\" stroke=\"none\" fill=\"currentColor\" fill-opacity=\"0.15\"/><path d=\"M143.6 30 A24 24 0 0 1 137.6 45.9\" stroke-width=\"1.4\"/><text x=\"156.4\" y=\"48.1\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">38°</text><path d=\"M130.8 198 L147.8 181 A24 24 0 0 1 154.8 198 Z\" stroke=\"none\" fill=\"currentColor\" fill-opacity=\"0.15\"/><path d=\"M147.8 181 A24 24 0 0 1 154.8 198\" stroke-width=\"1.4\"/><text x=\"167.1\" y=\"187.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">47°</text><path d=\"M214.8 114 L198.3 99.4 A22 22 0 0 0 199.2 129.6 Z\" stroke=\"none\" fill=\"currentColor\" fill-opacity=\"0.15\"/><path d=\"M198.3 99.4 A22 22 0 0 0 199.2 129.6\" stroke-width=\"1.4\"/><text x=\"177.5\" y=\"119.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">85°</text><text x=\"119.6\" y=\"20.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">P</text><text x=\"228.8\" y=\"118.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">E</text><text x=\"130.8\" y=\"216.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">Q</text></svg>",
    "caption": "Şekil 1. Paralel doğrular arasında M kuralı ve kırılma köşesi"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Şekil 1''de $d_1 \\parallel d_2$ olmak üzere $m(\\widehat{BPE}) = 38^\\circ$ ve $m(\\widehat{PEQ}) = 85^\\circ$ verilsin; $m(\\widehat{EQD})$ açısını bulalım. M kuralına göre sağa bakan köşelerdeki iki açının toplamı, ortadaki sola bakan açıya eşittir: $38^\\circ + m(\\widehat{EQD}) = 85^\\circ \\Rightarrow m(\\widehat{EQD}) = 47^\\circ$. Başka bir soruda $[BA \\parallel [DE$ iken kalem ucu şeklinde $m(\\widehat{ABC}) = 115^\\circ$ ve $m(\\widehat{BCD}) = 105^\\circ$ verilirse üç açının toplamı $360^\\circ$ olacağından $m(\\widehat{CDE}) = 360^\\circ - (115^\\circ + 105^\\circ) = 140^\\circ$ bulunur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**KIRILMA KÖŞESİNE PARALEL ÇİZ**: Zikzak veya M kuralı aklından çıktığında ya da çizgi karmaşıklaştığında her kırılma köşesinden tabanlara paralel yardımcı çizgi çek; şekil tek hamlede Z ve U kuralına dönüşür."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Zikzak kuralını uygularken paralel doğruların dışında kalan geniş açıyı değil mutlaka **içte kalan dar açıyı** toplama dahil etmelisin. Ayrıca kalem ucu kuralında toplamı $360^\\circ$ almak yerine üçgen gibi $180^\\circ$ sanmak ya da $[BA \\parallel [DE$ veriliyorken ters yönlü M ile aynı yönlü kalem ucu şekillerini karıştırmak klasik çeldiricilerdir."
  },
  {
    "type": "key_points",
    "items": [
      "Tümler açıların toplamı $90^\\circ$, bütünler açıların toplamı $180^\\circ$''dir.",
      "Paralel doğrularda Z kuralı açıları eşitler, U kuralı iki açıyı $180^\\circ$''ye tamamlar.",
      "M kuralında zıt yöne bakan açıların toplamları birbirine eşittir.",
      "İki paralel doğru arasında açıortay varsa Z kuralından gizli ikizkenar üçgen aramalısın."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "019d55bd-2b95-51c9-af72-90824015dacd",
      "08ea2fc0-1b0e-572a-a99c-c19aa3933b0b"
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
  'matematik_geometri.dogruda_ve_ucgende_acilar_ucgenler.02',
  'Matematik & Geometri',
  'Doğruda ve Üçgende Açılar, Üçgenler',
  2,
  'Bölüm 2: Üçgende Açılar, İkizkenar-Eşkenar Üçgen ve Açı-Kenar Bağıntıları',
  'Her üçgende iç açılar toplamı $180^\circ$, dış açılar toplamı ise $360^\circ$''dir.  Üçgen açısı sorularının yüzde seksenini çözen en kritik kural şudur: bir dış açının ölçüsü, kendisine komşu olmayan iki iç açının ölçüleri toplamına eşittir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Her üçgende **iç açılar toplamı $180^\\circ$**, **dış açılar toplamı ise $360^\\circ$**''dir. Üçgen açısı sorularının yüzde seksenini çözen en kritik kural şudur: **bir dış açının ölçüsü, kendisine komşu olmayan iki iç açının ölçüleri toplamına eşittir**. Bu kuralı kullandığında ek denklem kurmadan doğrudan bilinmeyene geçersin."
  },
  {
    "type": "heading",
    "text": "İkizkenar, Eşkenar Üçgen ve Açıortay Formülleri"
  },
  {
    "type": "bullets",
    "items": [
      "**İkizkenar Üçgen:** Eşit iki kenarın karşısındaki taban açıları da eşittir. İki ikizkenar parça uç uca eklenmişse ($|AB| = |BD| = |DC|$ gibi) taban açılarına harf ($a$) verip dış açıyı $2a$ yazarak zincirleme ilerle. **DAKİ** kuralını unutma: ikizkenar üçgende tepeden indirilen Dikme aynı zamanda Açıortay, Kenarortaydır (ikizkenar varsa bu dörtlüden ikisi geldiğinde diğer ikisi kendiliğinden oluşur).",
      "**Eşkenar Üçgen:** Üç kenarı eşit, her iç açısı **$60^\\circ$** ve bütün kenarlara çizilen yükseklik, açıortay ve kenarortaylar aynı doğru parçasıdır. Eşkenar üçgenle başka bir eşit kenar birleşmişse ($|BD| = |BC|$ gibi) aynı uzunlukları çizgilerle işaretleyip gizli ikizkenar üçgenleri mutlaka gör! Çünkü eşkenarın bütün kenarları eşit olduğundan dışarıdaki eşitlik diğer iki kenarla da otomatik olarak ikizkenar üçgen kurar ($|AB| = |BD|$ gibi).",
      "**İç ve Dış Açıortaylar:** İki iç açıortayın kesiştiği açının ölçüsü $90^\\circ + \\frac{A}{2}$, iki dış açıortayın kesiştiği açının ölçüsü $90^\\circ - \\frac{A}{2}$, bir iç ve bir dış açıortayın kesiştiği açının ölçüsü ise $\\frac{A}{2}$''dir. Bir üçgenin köşesindeki açıortay ile yükseklik arasındaki dar açı ise diğer iki açının farkının yarısına eşittir ($\\frac{\\lvert B - C \\rvert}{2}$)."
    ]
  },
  {
    "type": "heading",
    "text": "Açı-Kenar Bağıntıları ve Üçgen Eşitsizliği"
  },
  {
    "type": "paragraph",
    "text": "Bir üçgende büyük açının karşısında büyük kenar, küçük açının karşısında küçük kenar bulunur. Üç kenarı $a, b, c$ olan bir üçgenin çizilebilmesi için her kenar diğer iki kenarın farkının mutlak değerinden büyük, toplamından küçük olmalıdır:"
  },
  {
    "type": "paragraph",
    "text": "$$\\lvert b - c \\rvert < a < b + c$$"
  },
  {
    "type": "paragraph",
    "text": "Eğer soruda özel bir açı koşulu verilmişse ($m(\\widehat{A}) > 90^\\circ$ geniş açı gibi) Pisagor kıyaslaması da devreye girer: geniş açının karşısı için $a^2 > b^2 + c^2$, dar açının karşısı için $a^2 < b^2 + c^2$ sınırları daraltıcı olarak eklenir. Ayrıca çevresi tam sayı verilen ya da iki kenarı bilinen bir üçgenin üçüncü kenarının alabileceği tam sayı değerleri sayılırken bu iki koşulun kesişimi alınır; kenar uzunluğu tam sayı denmemişse yalnızca üçgen eşitsizliği uç değerlerinden tam sayı toplamına geçilir."
  },
  {
    "type": "table",
    "headers": [
      "Koşul",
      "Kenar Bağıntısı",
      "Kullanım Yeri"
    ],
    "rows": [
      [
        "Genel üçgen",
        "$\\lvert b - c \\rvert < a < b + c$",
        "Her kenar diğer ikisinin farkından büyük, toplamından küçüktür"
      ],
      [
        "$\\widehat{A} = 90^\\circ$ (Dik açı)",
        "$a^2 = b^2 + c^2$",
        "Pisagor eşitliği"
      ],
      [
        "$\\widehat{A} > 90^\\circ$ (Geniş açı)",
        "$a^2 > b^2 + c^2$",
        "En büyük kenar alt sınırını daraltır"
      ],
      [
        "$\\widehat{A} < 90^\\circ$ (Dar açı)",
        "$a^2 < b^2 + c^2$",
        "Kenar üst sınırını daraltır"
      ]
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 340 209.2\" width=\"340\" height=\"209.2\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><polygon points=\"30,179.2 95.2,30 310,179.2\"/><line x1=\"95.2\" y1=\"30\" x2=\"170\" y2=\"179.2\"/><line x1=\"138\" y1=\"101.9\" x2=\"127.3\" y2=\"107.3\"/><line x1=\"30\" y1=\"179.2\" x2=\"95.2\" y2=\"30\"/><line x1=\"57.1\" y1=\"102.2\" x2=\"68.1\" y2=\"107\"/><line x1=\"170\" y1=\"179.2\" x2=\"310\" y2=\"179.2\"/><line x1=\"240\" y1=\"173.2\" x2=\"240\" y2=\"185.2\"/><path d=\"M310 179.2 L288.6 164.4 A26 26 0 0 0 284 179.2 Z\" stroke=\"none\" fill=\"currentColor\" fill-opacity=\"0.15\"/><path d=\"M288.6 164.4 A26 26 0 0 0 284 179.2\" stroke-width=\"1.4\"/><text x=\"270.6\" y=\"171.1\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">34°</text><path d=\"M95.2 30 L86.4 50.2 A22 22 0 0 0 105.1 49.7 Z\" stroke=\"none\" fill=\"currentColor\" fill-opacity=\"0.15\"/><path d=\"M86.4 50.2 A22 22 0 0 0 105.1 49.7\" stroke-width=\"1.4\"/><text x=\"96.1\" y=\"66.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">x</text><text x=\"19.5\" y=\"194.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">A</text><text x=\"95.2\" y=\"20.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">B</text><text x=\"320.5\" y=\"194.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">C</text><text x=\"170\" y=\"198.1\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">D</text></svg>",
    "caption": "Şekil 2. İki dış açı ve ikizkenar üçgen zinciri ($|AB| = |BD| = |DC|$)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Şekil 2''deki $ABC$ üçgeninde $D \\in [AC]$, $|AB| = |BD| = |DC|$ ve $m(\\widehat{ACB}) = 34^\\circ$ olduğuna göre $m(\\widehat{ABD}) = x$ kaç derecedir? Önce $|BD| = |DC|$ ikizkenarlığından $m(\\widehat{DBC}) = 34^\\circ$ yazarız. Ardından $BDC$ üçgeninde iki iç açının toplamı kendisine komşu olmayan dış açı olan $m(\\widehat{ADB})$''yi verir: $34^\\circ + 34^\\circ = 68^\\circ$. Şimdi $ABD$ üçgenine geçeriz: $|AB| = |BD|$ olduğu için taban açısı $m(\\widehat{BAD}) = 68^\\circ$ olur. Son olarak $ABD$ üçgeninin iç açılar toplamından $x = 180^\\circ - (68^\\circ + 68^\\circ) = 44^\\circ$ elde edilir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki nokta üçgen açılarında en çok puan götürür: Birincisi, ikizkenarlıkta hangi iki açının eşit olduğunu kenarların **karşısındaki açılara** bakmadan tahmin etmektir; eşit kenarların karşısındaki açılar eşittir. İkincisi, üçgen eşitsizliği sorularında kenarın tam sayı olduğu belirtilmişken diğer ek dar/geniş açı kısıtını gözden kaçırmaktır."
  },
  {
    "type": "key_points",
    "items": [
      "Bir dış açı, kendisine komşu olmayan iki iç açının toplamına eşittir.",
      "Eşkenar üçgenin bir kenarına eşit başka bir kenar verilmişse diğer iki kenara da aynı işareti koyarak gizli ikizkenarı gör.",
      "İkizkenar üçgende **DAKİ** (Dikme-Açıortay-Kenarortay-İkizkenar) dörtlüsünden ikisi varsa diğer ikisi de vardır.",
      "Üçgen eşitsizliğinde $\\lvert b - c \\rvert < a < b + c$ her kenar için geçerlidir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0c6291f1-6556-5210-8b15-48208a22050f",
      "0e6dba2c-6703-5cf6-90e3-ddd1b146185a"
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
  'matematik_geometri.dogruda_ve_ucgende_acilar_ucgenler.03',
  'Matematik & Geometri',
  'Doğruda ve Üçgende Açılar, Üçgenler',
  3,
  'Bölüm 3: Dik Üçgen, Özel Üçgenler ve Öklid Bağıntıları',
  'Bir açısı $90^\circ$ olan üçgene dik üçgen, $90^\circ$''lik açının karşısındaki en uzun kenara ise hipotenüs denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir açısı $90^\\circ$ olan üçgene **dik üçgen**, $90^\\circ$''lik açının karşısındaki en uzun kenara ise **hipotenüs** denir. Dik kenarları $a, b$ ve hipotenüsü $c$ olan her dik üçgende **Pisagor teoremi** geçerlidir:"
  },
  {
    "type": "paragraph",
    "text": "$$a^2 + b^2 = c^2$$"
  },
  {
    "type": "paragraph",
    "text": "KPSS sorularında sayıları kare alıp toplamak yerine şu beş tam sayı ve açı dik üçgenini hızla tanımalısın:"
  },
  {
    "type": "bullets",
    "items": [
      "**Kenarlarına Göre Özel Dik Üçgenler:** $(3 - 4 - 5)$ ve katları ($6-8-10, 9-12-15, 12-16-20$); $(5 - 12 - 13)$ ve katları ($10-24-26$); $(8 - 15 - 17)$; $(7 - 24 - 25)$.",
      "**Açılarına Göre Özel Dik Üçgenler:** $30^\\circ-60^\\circ-90^\\circ$ üçgeninde $30^\\circ$''nin karşısı $a$ ise hipotenüs $2a$, $60^\\circ$''nin karşısı $a\\sqrt{3}$''tür. $45^\\circ-45^\\circ-90^\\circ$ ikizkenar dik üçgeninde dik kenarlar $a$, hipotenüs $a\\sqrt{2}$''dir. $15^\\circ-75^\\circ-90^\\circ$ üçgeninde ise hipotenüse inen yükseklik $h$ ise hipotenüs $4h$''dir."
    ]
  },
  {
    "type": "heading",
    "text": "Muhteşem Üçlü ve Öklid Bağıntıları"
  },
  {
    "type": "paragraph",
    "text": "Dik üçgende $90^\\circ$''lik köşeden hipotenüse çizilen **kenarortay**, hipotenüsü böldüğü iki eş parçaya eşittir (**Muhteşem Üçlü**); herhangi bir soruda eşitlik bu üçlüden ikisini veriyorsa o köşe mutlaka $90^\\circ$''dir. Dik köşeden hipotenüse indirilen **yükseklik ($h$)** hipotenüsü $p$ ve $k$ uzunluklarına ayırıyorsa **Öklid bağıntıları** çalışır ($c = p + k$):"
  },
  {
    "type": "bullets",
    "items": [
      "$h^2 = p \\cdot k$ (yükseklik bağıntısı)",
      "$a^2 = p \\cdot c$ ve $b^2 = k \\cdot c$ (dik kenar bağıntıları)",
      "$a \\cdot b = c \\cdot h$ (alan eşitliği sayesinde hem yükseklik hem dik kenarlar kolayca birbirine bağlanır)",
      "$\\frac{1}{h^2} = \\frac{1}{a^2} + \\frac{1}{b^2}$ (dik üçgende yüksekliğin dik kenarlarla doğrudan ilişkisi)"
    ]
  },
  {
    "type": "paragraph",
    "text": "Geniş ya da dar açılı bir üçgende $30^\\circ$, $45^\\circ$ veya $60^\\circ$ açısı gördüğünde o açının **karşısına** bir dikme indirerek özel dik üçgen oluştur; asla $30^\\circ$ veya $45^\\circ$ gibi özel açıyı bölmeye çalışma! Eğer şeklin içinde hem dik üçgen hem de eşit açı veya tümler açılar ($90^\\circ - \\alpha$) varsa kenarlar özel üçgen çıkmadığında benzerliği düşünerek açıları $\\alpha$ ve $\\beta$ ($\\alpha + \\beta = 90^\\circ$) diye harflendir."
  },
  {
    "type": "table",
    "headers": [
      "Özel Üçgen",
      "Kenar / Açı Oranları",
      "Hızlı Kontrol"
    ],
    "rows": [
      [
        "$3 - 4 - 5$ ve katları",
        "$3k, 4k, 5k$ ($6-8-10, 9-12-15$)",
        "Hipotenüs daima $5k$''dır"
      ],
      [
        "$5 - 12 - 13$ ve katları",
        "$5k, 12k, 13k$ ($10-24-26$)",
        "Hipotenüs $13k$ olmalıdır"
      ],
      [
        "$8 - 15 - 17$ ve $7 - 24 - 25$",
        "$8, 15, 17$ ve $7, 24, 25$",
        "İki dik kenar farkı küçük olanlar"
      ],
      [
        "$30^\\circ - 60^\\circ - 90^\\circ$",
        "$a : a\\sqrt{3} : 2a$",
        "$60^\\circ$ karşısı $30^\\circ$''nin $\\sqrt{3}$ katıdır"
      ],
      [
        "$45^\\circ - 45^\\circ - 90^\\circ$",
        "$a : a : a\\sqrt{2}$",
        "Hipotenüs dik kenarın $\\sqrt{2}$ katıdır"
      ]
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 310 260\" width=\"310\" height=\"260\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><polygon points=\"30,155 30,230 130,230\"/><polygon points=\"30,155 130,230 280,30\"/><polyline points=\"30,219 41,219 41,230\" stroke-width=\"1.4\"/><polyline points=\"121.2,223.4 127.8,214.6 136.6,221.2\" stroke-width=\"1.4\"/><line x1=\"30\" y1=\"155\" x2=\"30\" y2=\"230\"/><text x=\"16.1\" y=\"197.1\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">3</text><line x1=\"30\" y1=\"230\" x2=\"130\" y2=\"230\"/><text x=\"80\" y=\"246.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">4</text><line x1=\"130\" y1=\"230\" x2=\"280\" y2=\"30\"/><text x=\"217\" y=\"143.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">12</text><line x1=\"30\" y1=\"155\" x2=\"280\" y2=\"30\"/><text x=\"149.3\" y=\"85.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">x</text><text x=\"16\" y=\"159.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">A</text><text x=\"19.5\" y=\"245.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">B</text><text x=\"130\" y=\"248.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">C</text><text x=\"290.5\" y=\"24.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">D</text></svg>",
    "caption": "Şekil 3. İki bitişik dik üçgen ve özel üçgen zinciri ($3-4-5$ ve $5-12-13$)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Şekil 3''teki $ABC$ ve $ACD$ birer dik üçgendir; $AB \\perp BC$, $AC \\perp CD$, $|AB| = 3$ cm, $|BC| = 4$ cm ve $|CD| = 12$ cm verilmişse $|AD| = x$ kaç cm''dir? Önce $ABC$ dik üçgeninde $3 - 4 - 5$ özel üçgeninden $|AC| = 5$ cm bulunur. Ardından $ACD$ dik üçgeninde dik kenarlar $|AC| = 5$ cm ve $|CD| = 12$ cm olduğu için $5 - 12 - 13$ özel üçgeninden $|AD| = 13$ cm elde edilir. Bir başka özel açı sorusunda $m(\\widehat{B}) = 45^\\circ$, $m(\\widehat{C}) = 30^\\circ$ ve $|AB| = 6\\sqrt{2}$ cm ise $A$''dan $BC$''ye dikme indiririz: $45^\\circ-45^\\circ-90^\\circ$ üçgeninden yükseklik $\\frac{6\\sqrt{2}}{\\sqrt{2}} = 6$ cm çıkar, $30^\\circ-60^\\circ-90^\\circ$ üçgeninde $30^\\circ$''nin karşısı $6$ olduğundan $|AC| = 12$ cm bulunur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki klasik hata sık yapılır: Birincisi, bir üçgende kenarları $3$ ve $5$ görünce hipotenüsü aramadan doğrudan $3-4-5$ üçgeni sanıp diğer kenara $4$ yazmaktır; eğer $5$ dik kenar ve $3$ diğer dik kenarsa hipotenüs $\\sqrt{34}$ çıkar! İkincisi, $30^\\circ-60^\\circ-90^\\circ$ üçgeninde $30^\\circ$ ile $60^\\circ$''nin karşısındaki katları ($\\sqrt{3}$ ve $2$) ters kullanmaktır."
  },
  {
    "type": "key_points",
    "items": [
      "$3-4-5$, $5-12-13$, $8-15-17$ ve $7-24-25$ özel dik üçgenlerinde en büyük sayı daima hipotenüstür.",
      "$30^\\circ, 45^\\circ, 60^\\circ$ gördüğünde bu açıları bozmadan karşılarına dikme indir.",
      "Dik köşeden hipotenüse inen dikme varsa Öklid ($h^2 = p \\cdot k$); kenarortay varsa Muhteşem Üçlü uygula.",
      "$30^\\circ-60^\\circ-90^\\circ$''de oranlar $1 : \\sqrt{3} : 2$, $45^\\circ-45^\\circ-90^\\circ$''de ise $1 : 1 : \\sqrt{2}$''dir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "20de0cb1-82f7-5644-82ea-c4dc2b242cef",
      "21232c15-93cc-507c-88dd-3bf0603617ba"
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
  'matematik_geometri.dogruda_ve_ucgende_acilar_ucgenler.04',
  'Matematik & Geometri',
  'Doğruda ve Üçgende Açılar, Üçgenler',
  4,
  'Bölüm 4: Üçgende Alan, Benzerlik, Açıortay ve Kenarortay',
  'Üçgenlerde uzunluk ve alan sorularının ikinci yarısı alan taşıma, benzerlik (Tales), iç açıortay ve ağırlık merkezi (kenarortay) kurallarına dayanır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Üçgenlerde uzunluk ve alan sorularının ikinci yarısı **alan taşıma**, **benzerlik (Tales)**, **iç açıortay** ve **ağırlık merkezi (kenarortay)** kurallarına dayanır."
  },
  {
    "type": "heading",
    "text": "Açıortay ve Kenarortay (Ağırlık Merkezi)"
  },
  {
    "type": "bullets",
    "items": [
      "**İç Açıortay Teoremi:** Bir üçgende çizilen iç açıortay, karşı kenarı komşu yan kenarlarla **orantılı** böler: $\\frac{\\lvert AB \\rvert}{\\lvert AC \\rvert} = \\frac{\\lvert BD \\rvert}{\\lvert DC \\rvert}$. Aynı zamanda açıortay doğrusu üzerindeki bir noktadan açının kollarına inilen dikmeler birbirine eşittir.",
      "**Kenarortay ve Ağırlık Merkezi ($G$):** Üç kenarortayın kesiştiği noktaya **ağırlık merkezi ($G$)** denir. $G$ noktası her kenarortayı **tabandan $1$ birim ($k$), köşeden $2$ birim ($2k$)** oranında böler! Ayrıca üç kenarortay üçgenin alanını **$6$ eş alana** böler; yalnızca $G$''yi üç köşeye birleştirirsen üçgen **$3$ eş alana** ayrılır."
    ]
  },
  {
    "type": "heading",
    "text": "Benzerlik ve Alan Oranları"
  },
  {
    "type": "paragraph",
    "text": "İki üçgenin karşılıklı açıları eşitse (**Açı-Açı benzerliği**) kenarları aynı oranda (**benzerlik oranı $k$**) orantılıdır. Paralel doğrularla kesilen üçgenlerde **Tales (Temel Benzerlik)** ve **Kelebek** modelleri oluşur:"
  },
  {
    "type": "bullets",
    "items": [
      "Benzer iki üçgenin çevreleri, yükseklikleri, açıortayları ve kenarortayları oranı doğrudan **$k$**''dır.",
      "Benzer iki üçgenin **alanları oranı benzerlik oranının karesi olan $k^2$**''ye eşittir! Örneğin bir kenarı tabana paralel orta tabanla böldüğünde $1 : 2$ benzerlik oranı doğar; alan oranı $\\left(\\frac{1}{2}\\right)^2 = \\frac{1}{4}$ olduğu için üst küçük üçgen $S$, alttaki yamuk $3S$ alanına sahip olur."
    ]
  },
  {
    "type": "heading",
    "text": "Üçgende Alan Formülleri ve Yükseklik Paylaşımı"
  },
  {
    "type": "paragraph",
    "text": "Tabanı $a$, yüksekliği $h$ olan üçgenin alanı $\\frac{a \\cdot h}{2}$''dir. Aynı tepe noktasını paylaşan (yükseklikleri eşit) iki üçgenin **alanları oranı tabanlarının oranına eşittir!** Örneğin taban $2 : 3$ oranında bölünmüşse alanlar da $2S$ ve $3S$ paylaşır. İki kenarı $b, c$ ve aradaki açısı $\\alpha$ verilen üçgenlerde ise $\\frac{1}{2} \\cdot b \\cdot c \\cdot \\sin\\alpha$ formülü (özellikle $30^\\circ, 45^\\circ, 60^\\circ$ veya ortak köşeden kenar oranlı alan bölünmelerinde $\\frac{S_1}{S_2} = \\frac{a_1 \\cdot b_1}{a_2 \\cdot b_2}$) çok hızlı sonuç verir. Eşkenar üçgende bir kenar $a$ iken alan daima $\\frac{a^2\\sqrt{3}}{4}$ formülüyle, yükseklik ise $\\frac{a\\sqrt{3}}{2}$ ile hesaplanır."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca dış açıortay teoremi sorulduğunda ($ABC$ üçgeninde $A$ köşesinin dış açıortayı $[BC]$ uzantısını $D$ noktasında kesiyorsa), $D$ noktasından başlayarak $\\frac{\\lvert DC \\rvert}{\\lvert DB \\rvert} = \\frac{\\lvert AC \\rvert}{\\lvert AB \\rvert}$ oranı yazılır; bu oranı kurarken küçük parçayı ($\\lvert DC \\rvert$) kenarın tamamına ($\\lvert DB \\rvert$) oranlamaya dikkat et. İç teğet çemberin merkezi iç açıortayların, çevrel çemberin merkezi ise kenar orta dikmelerin kesişim noktasıdır."
  },
  {
    "type": "table",
    "headers": [
      "Kavram",
      "Oran Kuralı",
      "Alan Etkisi"
    ],
    "rows": [
      [
        "Eş yüksekli üçgenler",
        "Tabanlar $m : n$",
        "Alanlar $mS : nS$"
      ],
      [
        "Benzer üçgenler",
        "Kenar oranı $k$",
        "Alanlar oranı $k^2$"
      ],
      [
        "Orta taban",
        "Tabanlar $1 : 2$",
        "Üst üçgen $S$, alt yamuk $3S$"
      ],
      [
        "Ağırlık merkezi ($G$)",
        "Köşeden $2k$, tabandan $k$",
        "$3$ köşe birleşince $3$ eş alan ($S, S, S$)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Bir $ABC$ üçgeninde $[DE] \\parallel [BC]$ olmak üzere $D \\in [AB]$, $E \\in [AC]$, $|AD| = 4$ cm ve $|DB| = 6$ cm verilmiş olsun; $ADE$ üçgeninin alanı $16\\text{ cm}^2$ ise $DBCE$ yamuğunun alanı kaç $\\text{cm}^2$''dir? Temel benzerlik oranı $k = \\frac{|AD|}{|AB|} = \\frac{4}{4 + 6} = \\frac{4}{10} = \\frac{2}{5}$ bulunur. Benzer üçgenlerin alanları oranı $k^2 = \\left(\\frac{2}{5}\\right)^2 = \\frac{4}{25}$''tir. Küçük üçgenin alanı $4S = 16 \\Rightarrow S = 4$ alındığında büyük $ABC$ üçgeninin toplam alanı $25S = 100\\text{ cm}^2$ olur. Dolayısıyla alttaki yamuğun alanı $100 - 16 = 84\\text{ cm}^2$''dir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Temel benzerlik sorularında benzerlik oranını $\\frac{|AD|}{|DB|} = \\frac{4}{6}$ şeklinde parçayı parçaya oranlamak en büyük tuzaktır; benzerlikte her zaman **küçük üçgenin kenarı ($\\lvert AD \\rvert$) bölü büyük üçgenin kenarı ($\\lvert AB \\rvert = \\lvert AD \\rvert + \\lvert DB \\rvert$)** alınmalıdır! Ayrıca $k$ oranı alan sorularında karesi ($k^2$) alınmadan doğrudan alana oranlanmamalıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Benzerlikte küçük parçayı parçaya değil, daima küçük üçgeni **büyük üçgene** oranla.",
      "Benzerlik oranı $k$ iken uzunluklar $k$, alanlar ise **$k^2$** oranındadır.",
      "Aynı tepe noktasını paylaşan üçgenlerin alanları doğrudan tabanlarıyla orantılıdır.",
      "Ağırlık merkezi $G$, kenarortayı köşeye $2$, tabana $1$ oranında böler ($2k : k$)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "23dafe34-58de-53cd-84bb-046addd226b3",
      "297b8dc9-2bd9-5cd5-b8a4-e398fd86f23b"
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
