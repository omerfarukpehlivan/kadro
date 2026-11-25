-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Bölme-Bölünebilme ve EBOB-EKOK
-- Kaynak: docs/konu_anlatimi/matematik/02_bolme_bolunebilme_ve_ebob_ekok.md
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
  'matematik_geometri.bolme_bolunebilme_ve_ebob_ekok.01',
  'Matematik & Geometri',
  'Bölme-Bölünebilme ve EBOB-EKOK',
  1,
  'Bölüm 1: Bölme Algoritması ve Kalan Özellikleri',
  'Bir $A$ doğal sayısı sıfırdan farklı bir $B$ pozitif tam sayısına bölündüğünde bölüm $C$, kalan $K$ ise bölme algoritması iki temel bağıntı ile ifade edilir:',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir $A$ doğal sayısı sıfırdan farklı bir $B$ pozitif tam sayısına bölündüğünde bölüm $C$, kalan $K$ ise **bölme algoritması** iki temel bağıntı ile ifade edilir:"
  },
  {
    "type": "paragraph",
    "text": "$$A = B \\cdot C + K \\quad \\text{ve} \\quad 0 \\le K < B$$"
  },
  {
    "type": "paragraph",
    "text": "Bu iki koşuldan ikincisi en az birincisi kadar önemlidir. Çünkü bir bölme işleminde **kalan daima bölenden kesinlikle küçüktür** ve negatif olamaz. Örneğin kalan $7$ verilmişse bölen $B$ en az $8$ olmak zorundadır. Tersinden bakıldığında kalanın alabileceği en büyük tam sayı değeri bölenin $1$ eksiğidir ($B - 1$). Ayrıca $K < C$ gibi bir durum varsa, yani kalan bölümden küçükse, bölen ile bölümün yeri değiştirilse bile kalan değişmez."
  },
  {
    "type": "heading",
    "text": "Zincirleme Bölme İşlemleri"
  },
  {
    "type": "paragraph",
    "text": "İki farklı bölme işleminin birbirine bağlandığı zincirleme sorularda ($A$ sayısı $12$''ye bölünür, bölüm $B$ ise $B$ de $5$''e bölünür gibi) sayıyı doğrudan alttan yukarıya **yerine koyarak** yazmak hatayı önler. Örneğin $A = 12B + 5$ ve $B = 5C + 3$ verildiyse ikinci denklem ilk denklemde yerine konur:"
  },
  {
    "type": "paragraph",
    "text": "$$A = 12(5C + 3) + 5 = 60C + 41$$"
  },
  {
    "type": "paragraph",
    "text": "Buradan $A$''nın $60$ ile bölümünden kalan doğrudan $41$ olarak okunur. Eğer aynı $A$ sayısının $15$ ile bölümünden kalan sorulsaydı $60C$ zaten $15$''in katı olduğu için yalnızca $41$''i $15$''e bölerek kalanın $11$ olduğunu görürdük. Bir diğer sık kalıp ise bölen ile bölüm veya kalan arasında ek bağıntı verilmesidir: $A$, $8$''e bölünce bölüm $B$, kalan $0$ ve $A + 4B = 60$ ise $A = 8B$ yazılarak $8B + 4B = 12B = 60 \\Rightarrow B = 5$ bulunur."
  },
  {
    "type": "heading",
    "text": "Kalanlarla İşlem Yapma Kuralı"
  },
  {
    "type": "paragraph",
    "text": "**Kalanlarla işlem yapma** özelliği büyük sayıları ve kuvvet ifadelerini saniyeler içinde küçültür. Bir $x$ sayısının $m$ ile bölümünden kalan $r_1$, $y$ sayısının $m$ ile bölümünden kalan $r_2$ ise sayıların kendisi yerine kalanları koyarak işlem yapabilirsin: $x + y$, $x - y$, $x \\cdot y$ ve $x^n$ ifadelerinin $m$ ile bölümünden kalan, sırasıyla $r_1 + r_2$, $r_1 - r_2$, $r_1 \\cdot r_2$ ve $r_1^n$ sayılarının $m$ ile bölümünden kalana eşittir. Çıkarma sonucunda negatif değer elde edersen sonuca $m$ veya $m$''nin katını ekleyerek $0 \\le K < m$ aralığına taşıman yeterlidir."
  },
  {
    "type": "table",
    "headers": [
      "İstenen",
      "$m$ ile Bölümünden Kalan Hesabı",
      "Dikkat Edilecek Durum"
    ],
    "rows": [
      [
        "$x + y$",
        "$r_1 + r_2$ toplamını $m$''ye böl",
        "Toplam $\\ge m$ ise $m$ çıkar"
      ],
      [
        "$x - y$",
        "$r_1 - r_2$ farkını $m$''ye böl",
        "Sonuç negatifse $+m$ ekle"
      ],
      [
        "$x \\cdot y$",
        "$r_1 \\cdot r_2$ çarpımını $m$''ye böl",
        "Sayı büyütmeden önce kalanları al"
      ],
      [
        "$x^2 + 3y$",
        "$r_1^2 + 3r_2$ değerini $m$''ye böl",
        "$x$''in karesini almayı unutma"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$x$ doğal sayısının $11$ ile bölümünden kalan $7$, $y$ doğal sayısının $11$ ile bölümünden kalan $9$ olsun. $x^2 + 3y$ ifadesinin $11$ ile bölümünden kalanı bulmak için doğrudan kalanları yerine yazarız: $7^2 + 3 \\cdot 9 = 49 + 27 = 76$. Ardından $76$''yı $11$''e böleriz: $76 = 11 \\cdot 6 + 10$. Dolayısıyla kalan $10$''dur. İkinci bir yol olarak kalanları daha da küçültmek için $9$ yerine $9 - 11 = -2$ ve $7$ yerine $7 - 11 = -4$ negatif denklerini de kullanabilirsin: $(-4)^2 + 3(-2) = 16 - 6 = 10$ yine aynı sonucu verir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Zincirleme bölme sorularında (\"$A$, $12$''ye bölününce bölüm $B$, kalan $5$; $B$, $5$''e bölününce kalan $3$\") kalanları doğrudan toplayıp $5 + 3 = 8$ demek en yaygın tuzaktır. $B$''den gelen kalan $12$ ile çarpıldığı için katkısı $12 \\cdot 3 = 36$''dır ve toplam kalan $36 + 5 = 41$ olur. Ayrıca $x^2 + 3y$ gibi işlemlerde $x$''in karesini almayı unutup $7 + 3 \\cdot 9 = 34 \\equiv 1$ işaretlemek de sık rastlanan dikkat hatasıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Bölme işleminde $A = B \\cdot C + K$ eşitliğinin yanında daima $0 \\le K < B$ şartı vardır.",
      "Kalanın alabileceği en büyük değer bölenin $1$ eksiğidir.",
      "Kalanlarla toplama, çıkarma, çarpma ve kuvvet alma işlemleri sayıların kendisi yerine kalanlarla yapılabilir.",
      "Kalan hesabında negatif sayı çıkarsa böleni ekleyerek pozitif yap."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "01fb139a-3274-5524-a902-6ddeb01cbbb7",
      "0cebc50b-08f6-5aed-a761-26a18f7cd955"
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
  'matematik_geometri.bolme_bolunebilme_ve_ebob_ekok.02',
  'Matematik & Geometri',
  'Bölme-Bölünebilme ve EBOB-EKOK',
  2,
  'Bölüm 2: Bölünebilme Kuralları ve Bileşik Bölenler',
  'KPSS sorularında sayının tamamını bölmeden kalanı bulmamızı sağlayan bölünebilme kuralları, sayının hangi basamaklarına bakıldığına göre üç gruba ayrılır.  İlk grup yalnızca son basamaklara bakan kurallardır: $2$ için birler basamağının çift olması, $4$ için son iki basamağının $4$''ün katı olması, $8$ için son üç basamağının $8$''in katı olması, $5$ için birler basamağının $0$ veya $5$ olması, $25$ için son iki basamağının $25$''in katı ($00, 25, 50, 75$) olması ve $10$ için birler basamağının $0$ olması gerekir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS sorularında sayının tamamını bölmeden kalanı bulmamızı sağlayan **bölünebilme kuralları**, sayının hangi basamaklarına bakıldığına göre üç gruba ayrılır. İlk grup yalnızca **son basamaklara** bakan kurallardır: $2$ için birler basamağının çift olması, $4$ için son iki basamağının $4$''ün katı olması, $8$ için son üç basamağının $8$''in katı olması, $5$ için birler basamağının $0$ veya $5$ olması, $25$ için son iki basamağının $25$''in katı ($00, 25, 50, 75$) olması ve $10$ için birler basamağının $0$ olması gerekir."
  },
  {
    "type": "paragraph",
    "text": "İkinci grup **rakamları toplamına** bakan kurallardır: $3$ ile tam bölünebilmek için rakamlar toplamı $3$''ün katı, $9$ ile tam bölünebilmek için rakamlar toplamı $9$''un katı olmalıdır. İkisinde de kalan doğrudan rakamlar toplamının $3$''e veya $9$''a bölümünden kalan kadardır. Üçüncü grup ise **işaretli toplam** kuralıdır: **$11$ ile bölünebilmede** sayının en sağından (birler basamağından) başlanarak sırasıyla $+, -, +, -, \\ldots$ işaretleri verilir ve oluşan toplamın $11$ ile bölümünden kalana bakılır."
  },
  {
    "type": "table",
    "headers": [
      "Bölen",
      "Kural",
      "Kalan Nasıl Bulunur"
    ],
    "rows": [
      [
        "$2, 4, 8$",
        "Son $1, 2, 3$ basamak",
        "Son $1, 2, 3$ basamağın bölünmesiyle"
      ],
      [
        "$5, 25$",
        "Son $1, 2$ basamak",
        "Son $1, 2$ basamağın bölünmesiyle"
      ],
      [
        "$3, 9$",
        "Tüm rakamların toplamı",
        "Rakamlar toplamının $3$ veya $9$''a bölünmesiyle"
      ],
      [
        "$11$",
        "Sağdan sola $+, -, +, -$ toplamı",
        "Çıkan değerin $11$''e bölünmesiyle ($<0$ ise $+11$)"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "Bileşik Sayılar ve Kalan Paylaştırma"
  },
  {
    "type": "paragraph",
    "text": "Soru $6, 12, 15, 30, 36, 45, 55, 88, 90$ gibi bileşik bir sayı ile bölünebilmeyi soruyorsa, o sayı **aralarında asal** iki çarpanına ayrılır ve her iki kural ayrı ayrı uygulanır. Örneğin $12$ için $3$ ve $4$, $15$ için $3$ ve $5$, $36$ için $4$ ve $9$, $45$ için $5$ ve $9$, $55$ için $5$ ve $11$, $88$ için $8$ ve $11$ seçilir. Burada kritik sıralama kuralı şudur: **önce son basamakları ilgilendiren kural** ($2, 4, 5, 8, 10$), sonra rakamlar toplamı ($3, 9$) veya $11$ kuralı uygulanır."
  },
  {
    "type": "paragraph",
    "text": "Eğer soru tam bölünme yerine \"$45$ ile bölündüğünde $12$ kalanını veriyor\" gibi bir kalan veriyorsa, o kalan hem $5$''e hem $9$''a bölünerek yeni kalanlar üretilir: $12$ sayısı $5$''e bölününce kalan $2$, $9$''a bölününce kalan $3$ olur. Önce $5$''ten $2$ kalanını verdiği için birler basamağı $2$ veya $7$ olarak sabitlenir, ardından $9$''dan $3$ kalanı veren diğer basamak bulunur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Rakamları birbirinden farklı beş basamaklı $4A81B$ sayısı $45$ ile bölündüğünde $12$ kalanını versin. Önce $45 = 5 \\cdot 9$ yazarız ve kalan $12$''yi çarpanlara böleriz: $12$''nin $5$ ile bölümünden kalan $2$, $9$ ile bölümünden kalan $3$''tür. Birler basamağı $B$, $5$ ile bölümünden $2$ kalanı vereceğinden $B \\in \\{2, 7\\}$ olur. İlk durum ($B = 2$): rakamlar toplamı $4 + A + 8 + 1 + 2 = 15 + A$ değerinin $9$ ile bölümünden kalan $3$ olmalıdır; $15 + A = 12$ ($A < 0$ olmaz) veya $21$ olacağından $A = 6$ bulunur. Sayı $46812$ (rakamları farklı). İkinci durum ($B = 7$): $4 + A + 8 + 1 + 7 = 20 + A$ değerinin $9$''dan kalanı $3$ olmalı, yani $20 + A = 21 \\Rightarrow A = 1$; ancak sayıda zaten $1$ rakamı var! Bu nedenle $A = 1$ elenir. Tek geçerli değer $A = 6$ olur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**SON BASAMAK ÖNCE GELİR**: Bileşik bölenlerde ($12, 36, 45, 88$) daima önce birler veya son basamağı kilitleyen kuralı ($4, 5, 8, 10$) çöz, sonra rakam toplamına ($3, 9$) veya $11$''e geç; aksi hâlde onlarca gereksiz deneme yaparsın."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "$12$ ile bölünebilme için $2$ ve $6$ çarpanlarını seçmek büyük bir hatadır; çünkü $2$ ve $6$ aralarında asal değildir (örneğin $18$ hem $2$''ye hem $6$''ya bölünür ama $12$''ye bölünmez). Seçilen çarpanlar mutlaka aralarında asal olmalıdır. Ayrıca $11$ kuralında işaret vermeye en soldan değil en sağdan ($+$ ile) başlamalısın. Çözümün sonunda da \"rakamları birbirinden farklı\" şartını mevcut sabit rakamlarla ($4, 8, 1$ gibi) çakışma olup olmadığını kontrol ederek uygulamayı unutma."
  },
  {
    "type": "key_points",
    "items": [
      "Bileşik sayılar mutlaka **aralarında asal** çarpanlara ayrılır ($36 \\to 4 \\cdot 9$, $88 \\to 8 \\cdot 11$).",
      "Kalan verilmişse önce verilen kalanı yeni çarpanlara bölerek gerçek kalanları bul.",
      "Çözüm sırasında son basamağı belirleyen kuralı önce kullan, ardından toplam kuralına geç.",
      "Bulduğun basamak değerlerini \"rakamları birbirinden farklı\" şartıyla mutlaka ele."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0f9ff225-630c-5800-8933-99e9bc6fcedf",
      "254ea35e-d9a0-5853-b3c5-92188208f26e"
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
  'matematik_geometri.bolme_bolunebilme_ve_ebob_ekok.03',
  'Matematik & Geometri',
  'Bölme-Bölünebilme ve EBOB-EKOK',
  3,
  'Bölüm 3: Asal Çarpanlara Ayırma, Tam Bölen Sayısı ve EBOB-EKOK',
  '$1$''den büyük her tam sayı, asal sayıların kuvvetlerinin çarpımı biçiminde tek türlü yazılabilir:',
  4,
  '[
  {
    "type": "paragraph",
    "text": "$1$''den büyük her tam sayı, asal sayıların kuvvetlerinin çarpımı biçiminde tek türlü yazılabilir:"
  },
  {
    "type": "paragraph",
    "text": "$$N = p_1^{a} \\cdot p_2^{b} \\cdot p_3^{c}$$"
  },
  {
    "type": "paragraph",
    "text": "Bu asal çarpanlara ayrılmış biçim üzerinden bir sayının kaç farklı bölene sahip olduğu doğrudan üsler yardımıyla hesaplanır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Pozitif tam bölen sayısı (PTBS):** $(a + 1)(b + 1)(c + 1)$ formülü ile bulunur.",
      "**Tam sayı bölenlerinin sayısı:** Negatif bölenler de pozitiflerle aynı sayıda olduğu için $2 \\cdot (a + 1)(b + 1)(c + 1)$ olur.",
      "**Asal olmayan tam bölen sayısı:** Tüm tam bölen sayısından asal çarpan adedini çıkarırsın; pozitif asal olmayan tam bölen sayısı sorulursa PTBS''den asal çarpan sayısını çıkarırsın (çünkü $1$ de asal değildir ve pozitif bölenler içinde kalır).",
      "**Tam bölenlerin toplamı:** Her pozitif bölenin bir negatif karşılığı olduğu için bir sayının tüm tam sayı bölenlerinin toplamı daima $0$''dır."
    ]
  },
  {
    "type": "heading",
    "text": "EBOB ve EKOK Temel Bağıntıları"
  },
  {
    "type": "paragraph",
    "text": "**EBOB (En Büyük Ortak Bölen)**, iki veya daha fazla sayıyı aynı anda bölebilen en büyük pozitif tam sayıdır; asal çarpanlara ayrılmış biçimde **ortak tabanların en küçük üslüleri** alınarak çarpılır. Ortak asal tabanı olmayan sayıların EBOB''u $1$''dir. **EKOK (En Küçük Ortak Kat)** ise verilen sayıların tamamına tam bölünebilen en küçük pozitif tam sayıdır; **tüm tabanların en büyük üslüleri** çarpılır. İki pozitif $A$ ve $B$ tam sayısı için şu altın eşitlik her zaman geçerlidir:"
  },
  {
    "type": "paragraph",
    "text": "$$\\mathrm{EBOB}(A, B) \\cdot \\mathrm{EKOK}(A, B) = A \\cdot B$$"
  },
  {
    "type": "paragraph",
    "text": "Ayrıca $\\mathrm{EBOB}(A, B) = d$ ise $A = d \\cdot x$ ve $B = d \\cdot y$ yazılabilir; burada $x$ ve $y$ **aralarında asal** olmak zorundadır. Bu gösterim sayesinde $\\mathrm{EKOK}(A, B) = d \\cdot x \\cdot y$ olur ve toplamları ya da EKOK''u verilen sorularda tek denklemle tüm sayı ikilileri bulunur. Örneğin $\\mathrm{EBOB}(A, B) = 6$ ve $A + B = 42$ verilmişse $6(x + y) = 42 \\Rightarrow x + y = 7$ yazılır; $x$ ve $y$ aralarında asal olduğundan yalnızca $(1, 6)$, $(2, 5)$ ve $(3, 4)$ çiftleri seçilerek üç farklı sayı ikilisi üretilir. İki sayının biri diğerinin tam katı ise küçük olan sayı daima EBOB''a, büyük olan sayı daima EKOK''a eşittir."
  },
  {
    "type": "table",
    "headers": [
      "Kavram",
      "Asal Çarpanlardan Nasıl Alınır",
      "İki Sayı İçin Temel Özellik"
    ],
    "rows": [
      [
        "$\\mathrm{EBOB}(A, B)$",
        "Ortak asal tabanların en küçük üssü",
        "$A$ ve $B$''nin ikisini de tam böler"
      ],
      [
        "$\\mathrm{EKOK}(A, B)$",
        "Tüm asal tabanların en büyük üssü",
        "Hem $A$''nın hem $B$''nin tam katıdır"
      ],
      [
        "Aralarında Asal $A, B$",
        "Ortak asal çarpan yok",
        "$\\mathrm{EBOB} = 1$ ve $\\mathrm{EKOK} = A \\cdot B$"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$180$ sayısının pozitif tam bölen sayısını, tek pozitif bölen sayısını ve asal olmayan tam bölen sayısını bulalım. Önce $180$''i asal çarpanlarına ayırırız: $180 = 2^2 \\cdot 3^2 \\cdot 5^1$. Toplam pozitif tam bölen sayısı $(2+1)(2+1)(1+1) = 3 \\cdot 3 \\cdot 2 = 18$''dir. Tek pozitif bölenleri bulmak için $2$ çarpanını tamamen dışarıda bırakırız ($3^2 \\cdot 5^1$): $(2+1)(1+1) = 6$ tek pozitif böleni vardır. Geri kalan $18 - 6 = 12$ pozitif bölen ise çifttir. Tüm tam bölenlerin sayısı $2 \\cdot 18 = 36$ olur; asal çarpanlar $\\{2, 3, 5\\}$ ($3$ adet) çıkarıldığında asal olmayan tam bölen sayısı $36 - 3 = 33$ bulunur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "\"Çift tam bölen sayısı\" sorulduğunda $2^a$''yı ayırıp bir $2$ çarpanını kenara ayırdıktan sonra kalan ifadenin pozitif bölen sayısını bulup, \"tam bölen\" deniyorsa $2$ ile çarpmayı unutmamalısın. Ayrıca $\\mathrm{EBOB}(A, B) = d$ kullanırken $A = d \\cdot x$ ve $B = d \\cdot y$ yazdıktan sonra $x$ ve $y$''nin aralarında asal olmadığı çiftleri elemezsen fazla çözüm üretirsin. Son olarak $\\mathrm{EBOB} \\cdot \\mathrm{EKOK} = A \\cdot B$ formülünü üç sayıya uygulamaya çalışma; yalnızca iki sayı için geçerlidir."
  },
  {
    "type": "key_points",
    "items": [
      "Pozitif bölen sayısı için asal çarpan üslerini $1$ artırıp çarp: $(a+1)(b+1)(c+1)$.",
      "Tek bölenler için $2$ tabanını kapatıp kalan üslerle aynı formülü uygula.",
      "$\\mathrm{EBOB}(A,B) \\cdot \\mathrm{EKOK}(A,B) = A \\cdot B$ bağıntısı yalnızca **iki** sayı için kesin doğrudur.",
      "Aralarında asal iki sayının EBOB''u $1$, EKOK''u ise çarpımlarına eşittir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "2855a7f3-8435-5d19-850e-f989b2238ba0",
      "29ae701a-c312-5001-892d-3de24c5223ea"
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
  'matematik_geometri.bolme_bolunebilme_ve_ebob_ekok.04',
  'Matematik & Geometri',
  'Bölme-Bölünebilme ve EBOB-EKOK',
  4,
  'Bölüm 4: EBOB-EKOK Problemleri ve Kalanlı Ortak Katlar',
  'Günlük hayat kurgusuna sahip bölme-bölünebilme problemlerinde ilk karar, sorunun EBOB (bütünden parçaya gitme) mu yoksa EKOK (parçadan bütüne gitme) mu istediğini ayırt etmektir.  Eğer büyük uzunluklar, alanlar veya hacimler eşit parçalara bölünüyorsa, ağaç dikiliyorsa, çuvallar eşit kaplara dolduruluyorsa burada ortak bölen yani EBOB aranır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Günlük hayat kurgusuna sahip bölme-bölünebilme problemlerinde ilk karar, sorunun **EBOB** (bütünden parçaya gitme) mu yoksa **EKOK** (parçadan bütüne gitme) mu istediğini ayırt etmektir. Eğer büyük uzunluklar, alanlar veya hacimler **eşit parçalara bölünüyorsa**, ağaç dikiliyorsa, çuvallar eşit kaplara dolduruluyorsa burada ortak bölen yani **EBOB** aranır. Buna karşılık küçük fayanslar bir araya getirilip büyük kare yapılıyorsa, farklı periyotlarla çalan ziller ya da nöbetler aynı anda buluşuyorsa, cevizler $4$''er, $6$''şar sayıldığında artıyorsa burada ortak kat yani **EKOK** kullanılır."
  },
  {
    "type": "heading",
    "text": "Kalanlı Ortak Katlarda Üç Standart Kalıp"
  },
  {
    "type": "paragraph",
    "text": "Kalanlı ortak kat sorularında üç standart durumla karşılaşılır:"
  },
  {
    "type": "paragraph",
    "text": "$$A = m \\cdot x + r = n \\cdot y + r \\quad \\Rightarrow \\quad A = \\mathrm{EKOK}(m, n) \\cdot k + r$$"
  },
  {
    "type": "paragraph",
    "text": "İlk durum olan **aynı kalan** kalıbında her taraftan $r$ çıkarıldığında $A - r$ ortak kat olur. İkinci durum olan **aynı eksik** kalıbında ise ($A = 6x + 4 = 8y + 6$ gibi) bölenle kalan arasındaki fark her ikisinde de sabittir ($6 - 4 = 8 - 6 = 2$). Her tarafa $2$ eklendiğinde $A + 2 = 24k \\Rightarrow A = 24k - 2$ yazılır. Üçüncü durumda ne kalan ne de fark aynıysa ($A = 5x + 2 = 7y + 4$ gibi), küçük denemeyle ilk ortak sayıyı ($32$) bulup üzerine $\\mathrm{EKOK}(5, 7) = 35$''in katını ekleyerek $A = 32 + 35k$ yazmak en hızlı çözümdür."
  },
  {
    "type": "heading",
    "text": "Geometrik EBOB ve EKOK Uygulamaları"
  },
  {
    "type": "paragraph",
    "text": "Geometrik EBOB-EKOK sorularında boyutu bir alt veya üst boyuta taşırken **çevre, alan ve hacim oranlarına** dikkat edilmelidir: Boyutları $a$ ve $b$ olan bir dikdörtgenden en az sayıda **eş kare** kesmek için karenin kenarı $d = \\mathrm{EBOB}(a, b)$ alınır ve kare sayısı $\\frac{a \\cdot b}{d^2}$ olur. Eğer \"kareler eş olmak zorunda değil, en az kaç kare kesilir\" diye sorulursa her adımda çıkarılabilecek en büyük kare kesilir; ikisi farklı sorulardır. Boyutları $a$ ve $b$ olan dikdörtgen fayanslardan en küçük kare yapmak için ise karenin kenarı $L = \\mathrm{EKOK}(a, b)$ seçilir ve fayans adedi $\\frac{L^2}{a \\cdot b}$ bulunur."
  },
  {
    "type": "table",
    "headers": [
      "Problem Tipi",
      "Yön",
      "Formül / Yöntem"
    ],
    "rows": [
      [
        "Çuval / kumaş / bidon bölme",
        "Büyükten Küçüğe",
        "$\\mathrm{EBOB}$ parça boyutunu verir"
      ],
      [
        "Dikdörtgeni eş karelere ayırma",
        "Büyükten Küçüğe",
        "Kenar $d = \\mathrm{EBOB}(a,b)$, adet $\\frac{a \\cdot b}{d^2}$"
      ],
      [
        "Fayanslardan en küçük kare yapma",
        "Küçükten Büyüğe",
        "Kenar $L = \\mathrm{EKOK}(a,b)$, adet $\\frac{L^2}{a \\cdot b}$"
      ],
      [
        "Nöbet / zil / tur buluşması",
        "Küçükten Büyüğe",
        "Buluşma periyodu $\\mathrm{EKOK}$ ile bulunur"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Boyutları $24$ metre ve $36$ metre olan dikdörtgen biçimindeki bir tarlanın kenarlarına ve köşelerine eşit aralıklarla en az sayıda ağaç dikilmek isteniyor. Aralıklar eşit olacağı için iki ağaç arası mesafe $24$ ve $36$''nın en büyük ortak böleni olan $\\mathrm{EBOB}(24, 36) = 12$ metre seçilir. Dikdörtgenin çevresi $2 \\cdot (24 + 36) = 120$ metre olduğundan toplam ağaç sayısı $\\frac{120}{12} = 10$ ağaç bulunur. Eğer soru \"tarlanın içine eşit kare parseller ayrılacaktır\" deseydi her karenin kenarı $12$ metre olurdu ve parsel sayısı $\\frac{24 \\cdot 36}{12^2} = 2 \\cdot 3 = 6$ çıkardı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki nokta sınavda en çok hata yaptırır: Birincisi, dikdörtgenin **çevresine** ağaç dikerken alanı değil çevreyi EBOB''a bölmektir; köşelere $+4$ ağaç eklemeye kalkarsan köşeleri ikişer kez saymış olursun (kapalı şekillerde doğrudan $\\frac{\\text{Çevre}}{\\mathrm{EBOB}}$ formülü köşeleri zaten içerir; yalnızca açık doğru boyunca ağaç dikerken $+1$ eklenir). İkincisi, kalanlı ortak kat sorularında sorunun verdiği alt sınırı (örneğin \"$3$ basamaklı en küçük sayı\") unutup ilk küçük $k$ değerini işaretlemektir."
  },
  {
    "type": "key_points",
    "items": [
      "Bütünü eş parçalara ayırıyorsan **EBOB**, parçalardan tekrarlı bütün veya buluşma kuruyorsan **EKOK** kullan.",
      "Kapalı bir dikdörtgen çevresine köşeler dahil eşit aralıkla ağaç dikme adedi doğrudan $\\frac{\\text{Çevre}}{\\mathrm{EBOB}}$ formülünden bulunur.",
      "$A = m \\cdot x + r = n \\cdot y + r$ yapısında kalan eşitse $A = \\mathrm{EKOK}(m, n) \\cdot k + r$ yazılır.",
      "Bölenle kalan arasındaki farklar eşitse ($\\text{bölen} - \\text{kalan} = f$), sayı $\\mathrm{EKOK}(m, n) \\cdot k - f$ biçimindedir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "2af36cd8-5c20-56a5-8384-443f73a3ca20",
      "2db27a62-6378-5d00-bb52-fee5fbde2779"
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
