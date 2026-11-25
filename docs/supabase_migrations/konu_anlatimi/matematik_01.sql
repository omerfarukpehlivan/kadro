-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Temel Kavramlar ve Sayı Basamakları
-- Kaynak: docs/konu_anlatimi/matematik/01_temel_kavramlar_ve_sayi_basamaklari.md
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
  'matematik_geometri.temel_kavramlar_ve_sayi_basamaklari.01',
  'Matematik & Geometri',
  'Temel Kavramlar ve Sayı Basamakları',
  1,
  'Bölüm 1: Sayı Kümeleri, Rakam Kavramı ve İşlem Önceliği',
  'Matematik sorularının neredeyse tamamında doğru sonuca ulaşmanın ilk şartı, soru kökünde tanımlanan sayı kümesini dikkatle okumaktır.  Günlük konuşmada "sayı" ve "rakam" kelimeleri birbirinin yerine kullanılsa da sınav sorularında bu iki kavram kesin sınırlarla ayrılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Matematik sorularının neredeyse tamamında doğru sonuca ulaşmanın ilk şartı, soru kökünde tanımlanan **sayı kümesini** dikkatle okumaktır. Günlük konuşmada \"sayı\" ve \"rakam\" kelimeleri birbirinin yerine kullanılsa da sınav sorularında bu iki kavram kesin sınırlarla ayrılır. **Rakam**, sayıları yazmak için kullandığımız on semboldür: $\\{0, 1, 2, 3, 4, 5, 6, 7, 8, 9\\}$. Dolayısıyla her rakam aynı zamanda bir sayıdır ancak $12$ veya $-5$ gibi her sayı bir rakam değildir."
  },
  {
    "type": "paragraph",
    "text": "Sayı kümeleri iç içe geçmiş bir hiyerarşi oluşturur. **Doğal sayılar** ($\\mathbb{N}$) sıfırdan başlar: $\\{0, 1, 2, 3, \\ldots\\}$. **Sayma sayıları** ($\\mathbb{N}^+$) ise sıfırı dışarıda bırakır ve $1$''den başlar. **Tam sayılar** ($\\mathbb{Z}$) negatif tam sayıları, sıfırı ve pozitif tam sayıları birlikte içerir; burada $0$ ne pozitiftir ne de negatiftir, işaretsiz nötr tam sayıdır. İki tam sayının oranı biçiminde yazılabilen ($b \\neq 0$ iken $\\frac{a}{b}$) sayılar **rasyonel sayılar** ($\\mathbb{Q}$), kesir biçiminde yazılamayıp ondalık açılımı devirsiz olarak sonsuza giden sayılar ($\\sqrt{2}$, $\\pi$, $e$) **irrasyonel sayılar**, bu ikisinin birleşimi ise **gerçel (reel) sayılar** ($\\mathbb{R}$) kümesini oluşturur."
  },
  {
    "type": "table",
    "headers": [
      "Küme",
      "Sembol",
      "İçeriği ve Kritik Not"
    ],
    "rows": [
      [
        "Rakamlar",
        "-",
        "$0, 1, 2, \\ldots, 9$ (toplam 10 adet)"
      ],
      [
        "Doğal Sayılar",
        "$\\mathbb{N}$",
        "$0, 1, 2, 3, \\ldots$ ($0$ dahildir)"
      ],
      [
        "Sayma Sayıları",
        "$\\mathbb{N}^+$",
        "$1, 2, 3, \\ldots$ ($0$ dahil değildir)"
      ],
      [
        "Tam Sayılar",
        "$\\mathbb{Z}$",
        "$\\ldots, -2, -1, 0, 1, 2, \\ldots$ ($0$ işaretsizdir)"
      ],
      [
        "Gerçel Sayılar",
        "$\\mathbb{R}$",
        "Rasyonel ve irrasyonel tüm sayı doğrusu"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "En Büyük - En Küçük Değer Bulma Kuralları"
  },
  {
    "type": "paragraph",
    "text": "Soru kökünde \"$x$ ve $y$ birer tam sayıdır\" ifadesiyle \"$x$ ve $y$ birer gerçel sayıdır\" ifadesi tamamen farklı çözüm yolları gerektirir. Toplamları sabit iki doğal sayının çarpımının **en büyük** olması için sayılar birbirine en yakın, **en küçük** olması için birbirine en uzak seçilir. Buna karşılık çarpımları sabit iki pozitif tam sayının toplamının **en küçük** olması için sayılar birbirine en yakın, **en büyük** olması için en uzak seçilir. Eğer çarpımları verilen iki tam sayının \"tam sayı\" olduğu söylenip pozitif şartı konmamışsa, negatif tam sayı ikililerinin ($-1$ ve $-N$) toplamı çok daha küçük çıkarabilirsin. Sayılar gerçel ise değer vererek deneme yapmak yerine sınır veya tam kare yaklaşımı kullanmalısın."
  },
  {
    "type": "heading",
    "text": "İşlem Önceliği ve Parantez Açma"
  },
  {
    "type": "paragraph",
    "text": "İşlem önceliğinde sıralama her zaman şöyledir: önce en içteki parantezlerden başlanarak parantez içleri, ardından üslü ifadeler, sonra soldan sağa çarpma ve bölme işlemleri, en son soldan sağa toplama ve çıkarma işlemleri yapılır. Çarpma ile bölme birbirine üstün değildir; hangisi soldaysa önce o uygulanır. Örneğin $18 \\div 3 \\cdot 2$ işleminde önce $18 \\div 3 = 6$ yapılır, ardından $6 \\cdot 2 = 12$ bulunur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Rakamları sıfırdan ve birbirinden farklı iki basamaklı en büyük negatif tam sayı ile rakamları birbirinden farklı iki basamaklı en küçük pozitif tam sayının toplamını bulalım. Negatif sayılarda sıfıra yaklaştıkça sayı büyür; bu nedenle iki basamaklı en büyük negatif tam sayı $-10$''dur. Ancak \"sıfırdan ve birbirinden farklı\" şartı verildiği için $-10$ ($0$ içerir) ve $-11$ (rakamları aynı) elenir; aranan sayı $-12$''dir. İki basamaklı en küçük pozitif ve rakamları farklı tam sayı ise $10$''dur. Toplam: $-12 + 10 = -2$ elde edilir. Benzer biçimde, toplamları $19$ olan iki doğal sayının çarpımının en büyük değeri için sayıları $9$ ve $10$ seçerek $9 \\cdot 10 = 90$, en küçük değeri için $0$ ve $19$ seçerek $0 \\cdot 19 = 0$ buluruz."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**Ü-ÇB-TÇ** (Üs, Çarpma-Bölme, Toplama-Çıkarma): Parantez içini açtıktan sonra önce kuvvet al, sonra soldan sağa çarp/böl, en son topla/çıkar. Toplamı sabit pozitif sayılarda çarpım büyüsün istiyorsan sayıları **yaklaştır**, küçülsün istiyorsan **uzaklaştır**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki kritik kelime oyunu sınavda sıkça puan kaybettirir: Birincisi, iki basamaklı en büyük negatif tam sayı $-98$ değil $-10$''dur; çünkü negatif sayılarda mutlak değer küçüldükçe sayı büyür. İkincisi, \"tam sayı\" şartı verilmişken negatif değerleri unutmak ya da \"sayma sayısı\" denirken $0$''ı da dahil etmek yanlış şıkka götürür. Ayrıca $18 \\div 3 \\cdot 2$ gibi ifadelerde sağdaki çarpmayı önce yapmak $18 \\div 6 = 3$ sonucunu üretir ve doğrudan çeldirici şıktır."
  },
  {
    "type": "key_points",
    "items": [
      "$0$ bir doğal sayı ve tam sayıdır ama ne pozitif ne negatiftir.",
      "Toplamı verilen pozitif sayılar birbirine yaklaştıkça çarpımları büyür.",
      "Çarpımı verilen pozitif sayılar birbirine yaklaştıkça toplamları küçülür.",
      "Aynı öncelikteki çarpma-bölme ve toplama-çıkarma işlemleri daima soldan sağa yapılır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "1158394c-8521-5c5f-bc80-6049309e1780",
      "18092adc-7ebe-542b-85bb-4d728f848dcd"
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
  'matematik_geometri.temel_kavramlar_ve_sayi_basamaklari.02',
  'Matematik & Geometri',
  'Temel Kavramlar ve Sayı Basamakları',
  2,
  'Bölüm 2: Teklik-Çiftlik, İşaret İncelemesi ve Ardışık Sayılar',
  'Tam sayılar kümesinde teklik ve çiftlik analizi KPSS''nin en sık sorulan öncüllü ($I, II, III$) soru tipidir.  Her çift tam sayı $2k$, her tek tam sayı $2k + 1$ ($k \in \mathbb{Z}$) biçiminde yazılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Tam sayılar kümesinde **teklik ve çiftlik** analizi KPSS''nin en sık sorulan öncüllü ($I, II, III$) soru tipidir. Her çift tam sayı $2k$, her tek tam sayı $2k + 1$ ($k \\in \\mathbb{Z}$) biçiminde yazılır. Burada dikkat edilmesi gereken en temel nokta şudur: Teklik ve çiftlik yalnızca **tam sayılar** için anlamlıdır; $\\frac{3}{2}$ veya $\\sqrt{5}$ gibi sayılarda teklikten söz edilemez. Dolayısıyla bir kesir ifadesi tam sayıya eşitleniyorsa önce kesri içler-dışlar çarpımı ile düz denkleme dönüştürüp sonra inceleme yapmalısın."
  },
  {
    "type": "paragraph",
    "text": "Toplama ve çıkarmada aynı cins iki sayının sonucu çift (Tek ile Tek çift, Çift ile Çift çift), farklı cins iki sayının sonucu tektir (Tek ile Çift tek). Çarpmada ise tek bir çift çarpan bile sonucu çift yapar; çarpımın tek olması için **tüm çarpanların tek** olması şarttır. Üslü ifadelerde pozitif tam sayı üs ($n \\in \\mathbb{Z}^+$) tabanın tek-çift karakterini değiştirmez; ancak üs $0$ veya negatif olabiliyorsa $a^0 = 1$ ve rasyonel sayı oluşma ihtimali nedeniyle doğrudan yorum yapılmamalıdır."
  },
  {
    "type": "table",
    "headers": [
      "İşlem",
      "Tek ve Tek",
      "Çift ve Çift",
      "Tek ve Çift"
    ],
    "rows": [
      [
        "Toplama / Çıkarma",
        "Çift",
        "Çift",
        "Tek"
      ],
      [
        "Çarpma",
        "Tek",
        "Çift",
        "Çift"
      ],
      [
        "Pozitif Doğal Üs ($n \\ge 1$)",
        "Tek taban: Tek",
        "Çift taban: Çift",
        "Üs $0$ olursa sonuç $1$"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "İşaret İncelemesi ve Zincirleme Eşitsizlikler"
  },
  {
    "type": "paragraph",
    "text": "**İşaret incelemesi** sorularında en güçlü başlangıç noktası çift kuvvettir: sıfırdan farklı her gerçel sayının çift kuvveti ($x^2, x^4, \\ldots$) daima **pozitiftir**. Tek kuvvetler ise ($x^3, x^5, \\ldots$) tabanın işaretini aynen korur. Verilen eşitsizlik sisteminde önce çift kuvvetli terimi pozitif kabul ederek yanındaki çarpanın işaretini belirle, sonra zincirleme biçimde diğer harflerin işaretini çöz. İşaretler bulunduktan sonra \"kesinlikle pozitiftir / negatiftir\" soruluyorsa iki zıt işaretli sayının toplamının veya farkının işaretinin her zaman bilinemeyeceğine dikkat et; zıt işaretli iki sayıdan hangisinin mutlak değerce büyük olduğu verilmemişse $a + b$ belirsiz kalır."
  },
  {
    "type": "heading",
    "text": "Ardışık Sayılar ve Terim Sayısı Formülleri"
  },
  {
    "type": "paragraph",
    "text": "**Ardışık sayılar** sorularında sabit fark kuralı geçerlidir. Ardışık tam sayılar $1$''er, ardışık tek veya çift tam sayılar $2$''şer artar. Ardışık sayıların oluşturduğu bir dizide **terim sayısı** ve **terimler toplamı** formülleri bütün örüntü sorularını hızla çözer:"
  },
  {
    "type": "paragraph",
    "text": "$$\\text{Terim Sayısı} = \\frac{\\text{Son Terim} - \\text{İlk Terim}}{\\text{Artış Miktarı}} + 1$$"
  },
  {
    "type": "paragraph",
    "text": "$$\\text{Toplam} = \\text{Terim Sayısı} \\cdot \\frac{\\text{Son Terim} + \\text{İlk Terim}}{2}$$"
  },
  {
    "type": "paragraph",
    "text": "Eğer ardışık grupta **tek sayıda terim** varsa (örneğin $5$ veya $7$ sayı), sayıların toplamını terim sayısına böldüğünde doğrudan **ortanca sayıyı** elde edersin. Örneğin ardışık $5$ çift tam sayının toplamı $140$ ise ortanca sayı $\\frac{140}{5} = 28$''dir; sayılar $2$''şer arttığı için dizi $24, 26, 28, 30, 32$ olur. Çift sayıda ardışık terim varsa ortalama, ortadaki iki terimin tam ortasındaki sayıyı verir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$a, b, c$ tam sayıları için $3a + 4b = 5c + 1$ eşitliği verilsin. Burada $4b$ ifadesi $b$ hangi tam sayı olursa olsun **daima çifttir**; dolayısıyla $b$''nin tek mi çift mi olduğu bu denklemden kesin olarak belirlenemez. $4b$ çift olduğundan $3a$ ile $5c + 1$ aynı cins olmalıdır. Yani $3a$ tekse $5c + 1$ de tek ($5c$ çift, $c$ çift), $3a$ çiftse $5c + 1$ de çift ($5c$ tek, $c$ tek) olur. Bu durumda $a$ ile $c$ mutlaka farklı cinstedir; yani $a + c$ toplamı her zaman tek sayıdır, $a \\cdot c$ çarpımı ise her zaman çifttir. Ancak $b$ içeren $a + b$ gibi ifadelerde kesinlik yoktur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Denklemde $4b$ veya $2k$ gibi çift katsayılı bir terim gördüğünde $b$ ya da $k$''nin de çift olduğunu sanma. Çift katsayı, çarptığı tam sayının tekliğini de çiftliğini de örter; bu nedenle $b$ hakkında kesinlik sorulan öncüller yanlıştır. Ayrıca ardışık çift veya tek sayı dizilerinde sayıların $1$ değil $2$ farkla arttığını unutma. İşaret sorularında ise $x^2 \\cdot y < 0$ verildiğinde $x$''in pozitif mi negatif mi olduğu henüz belli değildir, yalnızca $y < 0$ kesindir."
  },
  {
    "type": "key_points",
    "items": [
      "Teklik-çiftlik yalnızca tam sayılarda tanımlıdır; kesirli ifadeleri önce düz çarpıma çevir.",
      "Çarpımın tek olması için her çarpan tek olmalıdır; eşitlikte çift katsayılı değişken belirsiz kalır.",
      "Sıfırdan farklı bir gerçel sayının çift kuvveti daima pozitiftir, tek kuvveti işareti korur.",
      "Tek sayıda ardışık sayının toplamı terim sayısına bölündüğünde doğrudan ortanca sayı bulunur."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "1ad55141-45e0-524b-be35-10d234525730",
      "20c6ac7c-9c0a-5fc0-bbd2-0819c3668ae6"
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
  'matematik_geometri.temel_kavramlar_ve_sayi_basamaklari.03',
  'Matematik & Geometri',
  'Temel Kavramlar ve Sayı Basamakları',
  3,
  'Bölüm 3: Asal Sayılar, Aralarında Asallık ve Faktöriyel',
  'Sadece $1$''e ve kendisine bölünebilen $1$''den büyük doğal sayılara asal sayı denir: $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, \ldots$ Bu kümede iki hayati istisna vardır: $1$ asal değildir ve en küçük asal sayı olan $2$, aynı zamanda tek çift asal sayıdır.  İki asal sayının toplamı veya farkı tek sayı çıkıyorsa sayılardan biri mutlaka $2$''dir; çünkü iki tek asalın toplamı da farkı da daima çift olur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sadece $1$''e ve kendisine bölünebilen $1$''den büyük doğal sayılara **asal sayı** denir: $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, \\ldots$ Bu kümede iki hayati istisna vardır: $1$ asal değildir ve **en küçük asal sayı olan $2$, aynı zamanda tek çift asal sayıdır**. İki asal sayının toplamı veya farkı tek sayı çıkıyorsa sayılardan biri mutlaka $2$''dir; çünkü iki tek asalın toplamı da farkı da daima çift olur. Örneğin $a + b = 25$ ve $a, b$ asal ise tek toplamı veren tek asal ikilisi olan $2$ mutlaka sayılardan biridir ve diğeri $23$''tür."
  },
  {
    "type": "heading",
    "text": "Aralarında Asal Sayılar ve Kesir Sadeleştirme"
  },
  {
    "type": "paragraph",
    "text": "$1$''den başka ortak pozitif tam sayı böleni olmayan tam sayılara **aralarında asal** sayılar denir. Aralarında asal sayıların kendilerinin asal olması gerekmez; örneğin $8$ ve $15$ asal değildir ama ortak bölenleri sadece $1$ olduğu için aralarında asaldırlar. Benzer biçimde ardışık iki pozitif tam sayı ($n$ ve $n+1$) ile ardışık iki pozitif tek tam sayı ($2n-1$ ve $2n+1$) her zaman aralarında asaldır; $1$ ile bütün pozitif tam sayılar da daima aralarında asaldır. Eğer $\\frac{a}{b} = \\frac{x}{y}$ eşitliğinde $(a, b)$ ve $(x, y)$ çiftleri ayrı ayrı aralarında asalsa doğrudan $a = x$ ve $b = y$ yazılabilir; aralarında asal değillerse önce kesir en sade hâline getirilmelidir."
  },
  {
    "type": "heading",
    "text": "Faktöriyel İşlemleri ve Sondan Sıfır Basamağı"
  },
  {
    "type": "paragraph",
    "text": "$1$''den $n$''ye kadar olan doğal sayıların çarpımına **faktöriyel** denir: $n! = 1 \\cdot 2 \\cdot 3 \\cdots n$. Özel olarak $0! = 1$ ve $1! = 1$ kabul edilir. $5!$ ve sonrasındaki her faktöriyelin içinde en az bir $2$ ve bir $5$ çarpanı bulunduğu için birler basamakları daima $0$''dır ve $2!$ sonrasındaki bütün faktöriyeller çifttir. Faktöriyel toplam ve fark sorularında büyük olan sayıyı küçük olana kadar açıp **ortak çarpan parantezine** almak standart yöntemdir:"
  },
  {
    "type": "paragraph",
    "text": "$$n! = n \\cdot (n - 1)! \\quad \\Rightarrow \\quad (n+1)! + n! = n!(n + 1 + 1) = n!(n + 2)$$"
  },
  {
    "type": "paragraph",
    "text": "Bir $n!$ sayısının içinde $p$ asal çarpanından kaç tane bulunduğunu bulmak için $n$ sayısı sürekli $p$''ye bölünür ve bölümler toplanır (kalanlara bakılmaz). Eğer soru $10$''un veya $6$''nın kuvvetini soruyorsa taban asal çarpanlarına ayrılır ($10 = 2 \\cdot 5$) ve içindeki **büyük asal çarpanın** ($5$ veya $3$) adedi belirleyici olur. Örneğin $43!$ sayısının sondan kaç basamağının sıfır olduğunu bulmak için içindeki $5$ sayısını hesaplarız: $43 \\div 5 = 8$ ve $8 \\div 5 = 1$ olduğundan $8 + 1 = 9$ sıfır vardır."
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 510 66\" width=\"510\" height=\"66\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><line x1=\"174\" y1=\"33\" x2=\"180.1\" y2=\"33\" stroke-width=\"1.4\"/><path d=\"M180.1 33 L172.7 36.1 M180.1 33 L172.7 29.9\" stroke-width=\"1.4\"/><text x=\"177.1\" y=\"46.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">÷5</text><line x1=\"330\" y1=\"33\" x2=\"336\" y2=\"33\" stroke-width=\"1.4\"/><path d=\"M336 33 L328.6 36.1 M336 33 L328.6 29.9\" stroke-width=\"1.4\"/><text x=\"333\" y=\"46.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"12\">topla</text><rect x=\"16\" y=\"16\" width=\"158\" height=\"34\" rx=\"6\" fill=\"currentColor\" fill-opacity=\"0.06\"/><text x=\"95\" y=\"37.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">43 ÷ 5 → Bölüm: 8</text><rect x=\"180.1\" y=\"16\" width=\"149.9\" height=\"34\" rx=\"6\" fill=\"currentColor\" fill-opacity=\"0.06\"/><text x=\"255\" y=\"37.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">8 ÷ 5 → Bölüm: 1</text><circle cx=\"415\" cy=\"33\" r=\"79\" fill=\"currentColor\" fill-opacity=\"0.06\"/><text x=\"415\" y=\"37.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">Toplam: 8 + 1 = 9</text></svg>",
    "caption": "Şekil 1. Büyük faktöriyelde asal çarpan sayısı bulma akışı ($43!$ içindeki $5$ çarpanı)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$a$ ve $b$ asal sayılar olmak üzere $a^2 - b^2 = 165$ eşitliğini çözelim. İki kare farkı uygularsak $(a - b)(a + b) = 165$ olur. $165 = 1 \\cdot 165 = 3 \\cdot 55 = 5 \\cdot 33 = 11 \\cdot 15$ çarpan çiftlerini inceleyelim. İlk olarak $(a - b) = 5$ ve $(a + b) = 33$ alırsak $2a = 38 \\Rightarrow a = 19$ ve $b = 14$ gelir; fakat $14$ asal değildir, elenir. Benzer şekilde $(a - b) = 3$ ve $(a + b) = 55$ için $a = 29, b = 26$ olur ve elenir; $(1, 165)$ için $a = 83, b = 82$ olur ve elenir. Son olarak $(a - b) = 11$ ve $(a + b) = 15$ alırsak $2a = 26 \\Rightarrow a = 13$ ve $b = 2$ çıkar. Hem $13$ hem $2$ asal olduğundan tek geçerli çarpım $13 \\cdot 2 = 26$ olur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki büyük hata sık yapılır: Birincisi, asal sayı sorularında bulduğun değerlerden biri asalken diğerinin asal olmadığını kontrol etmeden sonuca gitmektir (örnekte $a = 19$ asal çıkınca $b = 14$''ü asal sanıp $19 \\cdot 2 = 38$''i işaretlemek klasik çeldiricidir). İkincisi, \"aralarında asal\" ifadesini görünce sayıların tek tek asal olmasını aramaktır; oysa ortak bölenlerinin $1$ olması yeterlidir. Faktöriyelde ise $0! = 1$ değerini $0$ sanmak toplam sorularında $1$ farkla hata yaptırır."
  },
  {
    "type": "key_points",
    "items": [
      "$2$ en küçük ve tek çift asal sayıdır; $1$ asal değildir.",
      "$0! = 1$ ve $1! = 1$''dir; $5!$ ve sonrasında birler basamağı daima $0$''dır.",
      "Bir faktöriyelin sondan kaç basamağının sıfır olduğunu içindeki $5$ asal çarpanı sayısı belirler.",
      "Aralarında asal sayılar için sayıların kendisinin asal olması gerekmez; EBOB değerleri $1$ olmalıdır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "21342249-0b05-5095-b72c-e044b9280209",
      "235e16ea-0b01-5703-bb56-1fc519ed51d2"
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
  'matematik_geometri.temel_kavramlar_ve_sayi_basamaklari.04',
  'Matematik & Geometri',
  'Temel Kavramlar ve Sayı Basamakları',
  4,
  'Bölüm 4: Sayı Basamakları ve Çözümleme',
  'Basamak kavramı sorularında temel kural, çok basamaklı bir sayıyı basamak değerlerinin toplamı şeklinde yazabilmektir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Basamak kavramı sorularında temel kural, çok basamaklı bir sayıyı basamak değerlerinin toplamı şeklinde yazabilmektir. İki basamaklı $AB$ ve üç basamaklı $ABC$ doğal sayıları şu şekilde çözümlenir:"
  },
  {
    "type": "paragraph",
    "text": "$$AB = 10A + B, \\qquad ABC = 100A + 10B + C$$"
  },
  {
    "type": "paragraph",
    "text": "Soru kökünde \"$AB$ iki basamaklı sayıdır\" ifadesi geçiyorsa iki gizli kısıt otomatik olarak devreye girer: birincisi **en soldaki basamak $0$ olamaz** ($A \\in \\{1, 2, \\ldots, 9\\}$), ikincisi her harf yalnızca $0$''dan $9$''a kadar bir **rakamdır**. Çözümleme yaptıktan sonra denklem sadeleşir ve katsayı değerleri karşılaştırılarak uygun rakam ikilileri veya üçlüleri bulunur. Eğer soru içinde aynı sayının tersi olan $BA$ veya $CBA$ da geçiyorsa son basamaklar da en sol basamağa geçeceği için sıfır olamaz."
  },
  {
    "type": "heading",
    "text": "Pratik Basamak Özdeşlikleri ve Blok Çözümleme"
  },
  {
    "type": "paragraph",
    "text": "Sık kullanılan pratik kalıpları bilmek sınavda büyük hız kazandırır: İki basamaklı $AB$ ve $BA$ sayılarının toplamı $AB + BA = 11(A + B)$, farkı ise $AB - BA = 9(A - B)$ olur. Üç basamaklı $ABC$ ile $CBA$ sayılarının farkı daima $99(A - C)$''dir ve ortadaki $B$ rakamı farkta yok olur. Benzer şekilde üç basamaklı $ABC$ sayısında $A$ ve $C$ sabit kalıp yalnızca onlar basamağı $k$ artıyorsa sayının değeri $10k$ artar; yüzler basamağı $k$ artıyorsa sayı $100k$ büyür."
  },
  {
    "type": "paragraph",
    "text": "Bazen sayının tamamını çözümlemek yerine **blok hâlinde ayırmak** çok daha hızlıdır. Örneğin dört basamaklı $A34B$ sayısını $1000A + 340 + B$ şeklinde veya üç basamaklı $4AB$ sayısını $400 + AB$ şeklinde yazmak, özellikle bölünebilme ve sayı değiştirme problemlerinde tek satırda denklem çözmeyi sağlar. Yanlışlıkla rakamın basamak değerini kaydırarak yapılan çarpma hatalarında da ($AB$ sayısını $23$ ile çarparken ikinci satırı sola kaydırmayı unutma) blok mantığıyla $2 \\cdot AB + 3 \\cdot AB = 5 \\cdot AB$ yazılır; çünkü kaydırılmadığında onlar basamağındaki $2$, birler basamağının altına yazıldığı için sayıyı $20$ ile değil $2$ ile çarpmış olur. Ayrıca $AB$ iki basamaklı sayısının rakamları toplamının $k$ katına eşit olduğu sorularda $10A + B = k(A + B)$ yazılarak $A$ ile $B$ arasındaki oran hemen bulunur."
  },
  {
    "type": "table",
    "headers": [
      "İfade",
      "Çözümlenmiş Hâli",
      "Pratik Sonuç"
    ],
    "rows": [
      [
        "$AB + BA$",
        "$11(A + B)$",
        "Daima $11$''in katıdır"
      ],
      [
        "$AB - BA$",
        "$9(A - B)$",
        "Daima $9$''un katıdır"
      ],
      [
        "$ABC - CBA$",
        "$99(A - C)$",
        "Ortadaki $B$ basamağına bağlı değildir"
      ],
      [
        "$AB0$",
        "$10 \\cdot AB$",
        "Sayının $10$ ile çarpımıdır"
      ],
      [
        "$AB0AB$",
        "$1001 \\cdot AB$",
        "$AB \\cdot 1000 + AB$ biçiminde ayrılır"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir $ABC$ doğal sayısının yüzler basamağındaki rakamın basamak değeri $100A$, onlar basamağındaki $10B$ ve birler basamağındaki $C$''dir. Örneğin $ABC - CBA = 297$ ve $A + B + C = 10$ verilirse $99(A - C) = 297 \\Rightarrow A - C = 3$ bulunur. Rakamlar sıfırdan ve birbirinden farklı olduğu için $(C, A)$ çiftleri $(1, 4)$, $(2, 5)$, $(3, 6)$, $(4, 7)$, $(5, 8)$, $(6, 9)$ olabilir. Ancak $A + B + C = 10$ ve $B \\ge 1$ şartı nedeniyle $A + C \\le 9$ olmalıdır. Bu koşulu $(1, 4) \\Rightarrow B = 5$ ($451$), $(2, 5) \\Rightarrow B = 3$ ($532$) ve $(3, 6) \\Rightarrow B = 1$ ($613$) üçlüleri sağlar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Çözümleme sorularında üç klasik tuzak vardır: Birincisi, $AB$ iki basamaklı sayı iken tersi olan $BA$''nın da iki basamaklı olması isteniyorsa $B = 0$ değerini elemeyi unutmaktır. İkincisi, \"rakamları birbirinden farklı\" şartını denklem sonunda bulduğun tüm harflere uygulamamaktır. Üçüncüsü, $ABC$ çözümlerken yüzler, onlar ve birler basamaklarını doğru bulup sorunun istediği yeni sayıda onlar ve birler basamağının yerini karıştırarak $154$ yerine $145$ şıkkını işaretlemektir."
  },
  {
    "type": "key_points",
    "items": [
      "$AB$ sayısında $A \\neq 0$ ve tüm harfler $\\{0, \\ldots, 9\\}$ kümesinin elemanıdır.",
      "$AB + BA = 11(A+B)$, $AB - BA = 9(A-B)$ ve $ABC - CBA = 99(A-C)$ özdeşliklerini doğrudan kullan.",
      "Bazı sorularda tek tek çözümlemek yerine $4AB = 400 + AB$ gibi blok çözümleme işlemi kısaltır.",
      "Bulduğun rakamları \"sıfırdan farklı\" ve \"birbirinden farklı\" şartlarıyla mutlaka son kez kontrol et."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "3c0fc780-50bd-5c02-a542-51f9fba45fc7",
      "483328ea-d3f8-511f-a83a-a098d51dfae7"
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
