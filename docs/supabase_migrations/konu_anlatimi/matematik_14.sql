-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Analitik Geometri ve Katı Cisimler
-- Kaynak: docs/konu_anlatimi/matematik/14_analitik_geometri_ve_kati_cisimler.md
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
  'matematik_geometri.analitik_geometri_ve_kati_cisimler.01',
  'Matematik & Geometri',
  'Analitik Geometri ve Katı Cisimler',
  1,
  'Bölüm 1: Nokta Analitiği, Uzaklık, Orta Nokta ve Ağırlık Merkezi',
  'Dik koordinat düzleminde bir $P(x, y)$ noktasının birinci bileşeni ($x$) apsis, ikinci bileşeni ($y$) ordinat adını alır.  Bir noktanın $x$-eksenine olan uzaklığı $\lvert y \rvert$, $y$-eksenine olan uzaklığı $\lvert x \rvert$ birimdir (eksene uzaklıklar daima ters koordinatın mutlak değeridir!',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Dik koordinat düzleminde bir $P(x, y)$ noktasının birinci bileşeni ($x$) **apsis**, ikinci bileşeni ($y$) **ordinat** adını alır. Bir noktanın **$x$-eksenine olan uzaklığı $\\lvert y \\rvert$**, **$y$-eksenine olan uzaklığı $\\lvert x \\rvert$** birimdir (eksene uzaklıklar daima ters koordinatın mutlak değeridir!). İşaretlere göre dört bölge oluşur: I. Bölge $(+, +)$, II. Bölge $(-, +)$, III. Bölge $(-, -)$, IV. Bölge $(+, -)$; eksenler üzerindeki noktalar hiçbir bölgeye dahil edilmez."
  },
  {
    "type": "heading",
    "text": "İki Nokta Arası Uzaklık, Orta Nokta ve Paralelkenar Kuralı"
  },
  {
    "type": "paragraph",
    "text": "$A(x_1, y_1)$ ve $B(x_2, y_2)$ noktaları arasında en çok kullanılan dört temel bağıntı şunlardır:"
  },
  {
    "type": "bullets",
    "items": [
      "**İki Nokta Arası Uzaklık:** Koordinat farklarının kareleri toplamının kareköküdür (Pisagor):"
    ]
  },
  {
    "type": "paragraph",
    "text": "$$\\lvert AB \\rvert = \\sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$"
  },
  {
    "type": "bullets",
    "items": [
      "**Orta Nokta:** Koordinatların aritmetik ortalamasıdır: $M\\left(\\frac{x_1 + x_2}{2}, \\frac{y_1 + y_2}{2}\\right)$.",
      "**Paralelkenar (Kare / Dikdörtgen) Karşılıklı Köşeler Kuralı:** Köşeleri sırayla $A, B, C, D$ olan paralelkenarda köşegenler birbirini ortaladığı için **karşılıklı köşelerin** apsisler toplamı ile ordinatlar toplamı birbirine eşittir:"
    ]
  },
  {
    "type": "paragraph",
    "text": "$$x_A + x_C = x_B + x_D \\qquad \\text{ve} \\qquad y_A + y_C = y_B + y_D$$"
  },
  {
    "type": "bullets",
    "items": [
      "**Üçgenin Ağırlık Merkezi:** Köşeleri $A, B, C$ olan üçgenin ağırlık merkezi $G$, üç köşenin koordinatlarının üçe bölünmesiyle bulunur: $G\\left(\\frac{x_A + x_B + x_C}{3}, \\frac{y_A + y_B + y_C}{3}\\right)$. Doğru parçasını içten belirli oranda bölen nokta sorularında ise $x$ ve $y$ koordinatlarının artış miktarları toplam parçaya orantılı olarak paylaşılır.",
      "**Analitik Düzlemde Simetri (Yansıma):** Bir $P(a, b)$ noktasının $x$-eksenine göre simetriği $P''(a, -b)$, $y$-eksenine göre simetriği $P''(-a, b)$, orijine göre simetriği $P''(-a, -b)$ ve $y = x$ birinci açıortay doğrusuna göre simetriği $P''(b, a)$''dır. Simetri alırken yalnızca değişen eksenlerin işaretini veya sırasını değiştirmen yeterlidir."
    ]
  },
  {
    "type": "table",
    "headers": [
      "İstenen Kavram",
      "Formül",
      "Dikkat Edilecek Nokta"
    ],
    "rows": [
      [
        "$P(x, y)$''nin $x$ / $y$ eksenine uzaklığı",
        "$\\lvert y \\rvert$ / $\\lvert x \\rvert$",
        "Uzaklık her zaman pozitiftir ve ters eksen alınır"
      ],
      [
        "İki nokta arası uzaklık",
        "$\\sqrt{(\\Delta x)^2 + (\\Delta y)^2}$",
        "Eksili koordinatlarda çıkarma işaretine dikkat et"
      ],
      [
        "Orta nokta",
        "$\\left(\\frac{x_1+x_2}{2}, \\frac{y_1+y_2}{2}\\right)$",
        "İşaretleriyle birlikte toplayıp $2$''ye böl"
      ],
      [
        "Paralelkenar $ABCD$",
        "$A + C = B + D$",
        "Köşelerin sırasını ($A, B, C, D$) mutlaka kontrol et"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Köşe koordinatları sırasıyla $A(1, 2)$, $B(5, 4)$, $C(7, 8)$ ve $D(x, y)$ olan $ABCD$ paralelkenarı için $x + y$ toplamını bulalım. Karşılıklı köşeler $A$ ile $C$ ve $B$ ile $D$''dir. Kural gereği $x_A + x_C = x_B + x_D \\Rightarrow 1 + 7 = 5 + x \\Rightarrow x = 3$ bulunur. Ordinatlar için $y_A + y_C = y_B + y_D \\Rightarrow 2 + 8 = 4 + y \\Rightarrow y = 6$ olur. Sonuç olarak $D(3, 6)$ ve $x + y = 9$ elde edilir. İki nokta uzaklığı örneğinde ise $K(-2, 5)$ ve $L(4, -3)$ arası uzaklık $\\sqrt{(4 - (-2))^2 + (-3 - 5)^2} = \\sqrt{6^2 + (-8)^2} = \\sqrt{36 + 64} = 10$ birim çıkar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki tuzak adayın en kolay soruyu kaçırmasına yol açar: Birincisi, paralelkenar kuralında karşılıklı köşeleri ($A + C = B + D$) eşitlemek yerine komşu köşeleri ($A + B = C + D$) toplamaktır. İkincisi, koordinat farkı alırken $(-3 - 5)$ veya $(4 - (-2))$ işlemlerinde eksi işaretini unutup $2$ ya da $4$ gibi yanlış farklar bulmaktır; bu nedenle eksili sayıları mutlaka parantezle çıkar ve bölgelerin işaretlerini ($II: (-,+)$, $IV: (+,-)$) kontrol et."
  },
  {
    "type": "key_points",
    "items": [
      "$P(x, y)$ noktasının $x$-eksenine uzaklığı $\\lvert y \\rvert$, $y$-eksenine uzaklığı $\\lvert x \\rvert$''tir.",
      "Uzaklık formülü Pisagor''dur; $3-4-5$ veya $6-8-10$ üçgenleri yakalandığında doğrudan yazılır.",
      "Sıralı $ABCD$ paralelkenarında daima $A + C = B + D$ sağlanır.",
      "Ağırlık merkezi üç köşenin, orta nokta ise iki ucun aritmetik ortalamasıdır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0590b24b-1eee-5e76-a924-2bc486c8e6e3",
      "149fd090-438c-52e7-8cbf-4f02cf677f19"
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
  'matematik_geometri.analitik_geometri_ve_kati_cisimler.02',
  'Matematik & Geometri',
  'Analitik Geometri ve Katı Cisimler',
  2,
  'Bölüm 2: Doğrunun Analitiği, Eğim ve Kesişim Noktaları',
  'Bir doğrunun $x$-ekseniyle pozitif yönde yaptığı açının tanjantına eğim ($m$) denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Bir doğrunun $x$-ekseniyle pozitif yönde yaptığı açının tanjantına **eğim ($m$)** denir. İki noktası bilinen doğrunun eğimi, ordinatlar farkının apsisler farkına bölümüdür:"
  },
  {
    "type": "paragraph",
    "text": "$$m = \\frac{y_2 - y_1}{x_2 - x_1}$$"
  },
  {
    "type": "paragraph",
    "text": "Eğim sağa yatık doğrularda pozitif ($m > 0$), sola yatık doğrularda negatiftir ($m < 0$). $x$-eksenine paralel doğruların ($y = c$) eğimi **$0$**, $y$-eksenine paralel doğruların ($x = c$) eğimi ise **tanımsızdır**. Denklemi verilen bir doğrudan eğimi iki şekilde doğrudan okuyabilirsin:"
  },
  {
    "type": "bullets",
    "items": [
      "**$y = mx + n$ biçiminde:** $x$''in katsayısı $m$ doğrudan eğimdir.",
      "**$ax + by + c = 0$ biçiminde:** $m = -\\frac{a}{b}$''dir."
    ]
  },
  {
    "type": "heading",
    "text": "Paralel ve Dik Doğrular ile Eksenleri Kesen Doğrular"
  },
  {
    "type": "bullets",
    "items": [
      "**Paralel İki Doğru ($d_1 \\parallel d_2$):** Eğimleri **eşittir** ($m_1 = m_2$).",
      "**Dik Kesişen İki Doğru ($d_1 \\perp d_2$):** Eğimleri çarpımı **$-1$**''dir ($m_1 \\cdot m_2 = -1$, yani biri diğerinin ters işaretli çarpmaya göre tersidir).",
      "**Doğru Denklemi Yazma:** Eğimi $m$ ve geçtiği bir noktası $A(x_1, y_1)$ bilinen doğrunun denklemi $y - y_1 = m(x - x_1)$ formülüyle kurulur.",
      "**Kesişim Noktası ve Eksene Göre Alan:** İki doğrunun kesişim noktasını bulmak için denklemler **ortak çözülür** (yok etme veya eşitleme ile $x$ ve $y$ bulunur). Bir doğrunun eksenleri kestiği noktaları bulmak için $x = 0$ verip $y$ eksenini kestiği yeri, $y = 0$ verip $x$ eksenini kestiği yeri bul; oluşan dik üçgenin alanı daima eksen uzunluklarının çarpımının yarısıdır. Örneğin $3x + 4y = 12$ doğrusunda $x = 0 \\Rightarrow y = 3$ ve $y = 0 \\Rightarrow x = 4$ çıktığından eksenlerle oluşan dik üçgenin dik kenarları $3$ ve $4$, hipotenüsü $5$, çevresi $3 + 4 + 5 = 12$ ve alanı $\\frac{3 \\cdot 4}{2} = 6$ olur.",
      "**Bir Noktanın Bir Doğruya Uzaklığı:** $P(x_0, y_0)$ noktasının $ax + by + c = 0$ doğrusuna en kısa dik uzaklığı $d = \\frac{\\lvert ax_0 + by_0 + c \\rvert}{\\sqrt{a^2 + b^2}}$ formülüyle bulunur; paralel iki doğru arasındaki uzaklıkta ise katsayılar eşitlendikten sonra $\\frac{\\lvert c_1 - c_2 \\rvert}{\\sqrt{a^2 + b^2}}$ yazılır."
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 367.9 260\" width=\"367.9\" height=\"260\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><g stroke-width=\"0.6\" stroke-opacity=\"0.25\"><line x1=\"30\" y1=\"230\" x2=\"30\" y2=\"30\"/><line x1=\"63.3\" y1=\"230\" x2=\"63.3\" y2=\"30\"/><line x1=\"96.7\" y1=\"230\" x2=\"96.7\" y2=\"30\"/><line x1=\"130\" y1=\"230\" x2=\"130\" y2=\"30\"/><line x1=\"163.3\" y1=\"230\" x2=\"163.3\" y2=\"30\"/><line x1=\"196.7\" y1=\"230\" x2=\"196.7\" y2=\"30\"/><line x1=\"230\" y1=\"230\" x2=\"230\" y2=\"30\"/><line x1=\"263.3\" y1=\"230\" x2=\"263.3\" y2=\"30\"/><line x1=\"296.7\" y1=\"230\" x2=\"296.7\" y2=\"30\"/><line x1=\"30\" y1=\"230\" x2=\"296.7\" y2=\"230\"/><line x1=\"30\" y1=\"196.7\" x2=\"296.7\" y2=\"196.7\"/><line x1=\"30\" y1=\"163.3\" x2=\"296.7\" y2=\"163.3\"/><line x1=\"30\" y1=\"130\" x2=\"296.7\" y2=\"130\"/><line x1=\"30\" y1=\"96.7\" x2=\"296.7\" y2=\"96.7\"/><line x1=\"30\" y1=\"63.3\" x2=\"296.7\" y2=\"63.3\"/><line x1=\"30\" y1=\"30\" x2=\"296.7\" y2=\"30\"/></g><line x1=\"24\" y1=\"196.7\" x2=\"306.7\" y2=\"196.7\"/><line x1=\"63.3\" y1=\"236\" x2=\"63.3\" y2=\"20\"/><path d=\"M306.7 196.7 l-7 -4 m7 4 l-7 4\"/><path d=\"M63.3 20 l-4 7 m4 -7 l4 7\"/><text x=\"310.7\" y=\"213.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-style=\"italic\">x</text><text x=\"75.3\" y=\"22.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"start\" font-style=\"italic\">y</text><g stroke-width=\"1.2\"><line x1=\"30\" y1=\"193.7\" x2=\"30\" y2=\"199.7\"/><text x=\"30\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">-1</text><line x1=\"96.7\" y1=\"193.7\" x2=\"96.7\" y2=\"199.7\"/><text x=\"96.7\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">1</text><line x1=\"130\" y1=\"193.7\" x2=\"130\" y2=\"199.7\"/><text x=\"130\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">2</text><line x1=\"163.3\" y1=\"193.7\" x2=\"163.3\" y2=\"199.7\"/><text x=\"163.3\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">3</text><line x1=\"196.7\" y1=\"193.7\" x2=\"196.7\" y2=\"199.7\"/><text x=\"196.7\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">4</text><line x1=\"230\" y1=\"193.7\" x2=\"230\" y2=\"199.7\"/><text x=\"230\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">5</text><line x1=\"263.3\" y1=\"193.7\" x2=\"263.3\" y2=\"199.7\"/><text x=\"263.3\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">6</text><line x1=\"296.7\" y1=\"193.7\" x2=\"296.7\" y2=\"199.7\"/><text x=\"296.7\" y=\"214.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">7</text><line x1=\"60.3\" y1=\"230\" x2=\"66.3\" y2=\"230\"/><text x=\"57.3\" y=\"233.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">-1</text><line x1=\"60.3\" y1=\"163.3\" x2=\"66.3\" y2=\"163.3\"/><text x=\"57.3\" y=\"167.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">1</text><line x1=\"60.3\" y1=\"130\" x2=\"66.3\" y2=\"130\"/><text x=\"57.3\" y=\"133.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">2</text><line x1=\"60.3\" y1=\"96.7\" x2=\"66.3\" y2=\"96.7\"/><text x=\"57.3\" y=\"100.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">3</text><line x1=\"60.3\" y1=\"63.3\" x2=\"66.3\" y2=\"63.3\"/><text x=\"57.3\" y=\"67.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">4</text><line x1=\"60.3\" y1=\"30\" x2=\"66.3\" y2=\"30\"/><text x=\"57.3\" y=\"33.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">5</text><text x=\"55.3\" y=\"212.5\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"end\" font-size=\"11\">O</text></g><path d=\"M46.7 230L47.1 229.2L47.5 228.4L47.9 227.6L48.3 226.8L48.7 226L49.1 225.2L49.5 224.4L49.9 223.6L50.3 222.8L50.7 221.9L51.1 221.1L51.5 220.3L51.9 219.5L52.3 218.7L52.7 217.9L53.1 217.1L53.5 216.3L53.9 215.5L54.3 214.7L54.7 213.9L55.1 213.1L55.5 212.3L55.9 211.5L56.3 210.7L56.7 209.9L57.1 209.1L57.5 208.3L57.9 207.4L58.3 206.6L58.8 205.8L59.2 205L59.6 204.2L60 203.4L60.4 202.6L60.8 201.8L61.2 201L61.6 200.2L62 199.4L62.4 198.6L62.8 197.8L63.2 197L63.6 196.2L64 195.4L64.4 194.6L64.8 193.8L65.2 192.9L65.6 192.1L66 191.3L66.4 190.5L66.8 189.7L67.2 188.9L67.6 188.1L68 187.3L68.4 186.5L68.8 185.7L69.2 184.9L69.6 184.1L70 183.3L70.4 182.5L70.8 181.7L71.2 180.9L71.6 180.1L72 179.3L72.4 178.4L72.8 177.6L73.3 176.8L73.7 176L74.1 175.2L74.5 174.4L74.9 173.6L75.3 172.8L75.7 172L76.1 171.2L76.5 170.4L76.9 169.6L77.3 168.8L77.7 168L78.1 167.2L78.5 166.4L78.9 165.6L79.3 164.8L79.7 163.9L80.1 163.1L80.5 162.3L80.9 161.5L81.3 160.7L81.7 159.9L82.1 159.1L82.5 158.3L82.9 157.5L83.3 156.7L83.7 155.9L84.1 155.1L84.5 154.3L84.9 153.5L85.3 152.7L85.7 151.9L86.1 151.1L86.5 150.3L86.9 149.4L87.3 148.6L87.8 147.8L88.2 147L88.6 146.2L89 145.4L89.4 144.6L89.8 143.8L90.2 143L90.6 142.2L91 141.4L91.4 140.6L91.8 139.8L92.2 139L92.6 138.2L93 137.4L93.4 136.6L93.8 135.8L94.2 134.9L94.6 134.1L95 133.3L95.4 132.5L95.8 131.7L96.2 130.9L96.6 130.1L97 129.3L97.4 128.5L97.8 127.7L98.2 126.9L98.6 126.1L99 125.3L99.4 124.5L99.8 123.7L100.2 122.9L100.6 122.1L101 121.3L101.4 120.4L101.8 119.6L102.3 118.8L102.7 118L103.1 117.2L103.5 116.4L103.9 115.6L104.3 114.8L104.7 114L105.1 113.2L105.5 112.4L105.9 111.6L106.3 110.8L106.7 110L107.1 109.2L107.5 108.4L107.9 107.6L108.3 106.8L108.7 105.9L109.1 105.1L109.5 104.3L109.9 103.5L110.3 102.7L110.7 101.9L111.1 101.1L111.5 100.3L111.9 99.5L112.3 98.7L112.7 97.9L113.1 97.1L113.5 96.3L113.9 95.5L114.3 94.7L114.7 93.9L115.1 93.1L115.5 92.3L115.9 91.4L116.3 90.6L116.8 89.8L117.2 89L117.6 88.2L118 87.4L118.4 86.6L118.8 85.8L119.2 85L119.6 84.2L120 83.4L120.4 82.6L120.8 81.8L121.2 81L121.6 80.2L122 79.4L122.4 78.6L122.8 77.8L123.2 76.9L123.6 76.1L124 75.3L124.4 74.5L124.8 73.7L125.2 72.9L125.6 72.1L126 71.3L126.4 70.5L126.8 69.7L127.2 68.9L127.6 68.1L128 67.3L128.4 66.5L128.8 65.7L129.2 64.9L129.6 64.1L130 63.3L130.4 62.4L130.8 61.6L131.3 60.8L131.7 60L132.1 59.2L132.5 58.4L132.9 57.6L133.3 56.8L133.7 56L134.1 55.2L134.5 54.4L134.9 53.6L135.3 52.8L135.7 52L136.1 51.2L136.5 50.4L136.9 49.6L137.3 48.8L137.7 47.9L138.1 47.1L138.5 46.3L138.9 45.5L139.3 44.7L139.7 43.9L140.1 43.1L140.5 42.3L140.9 41.5L141.3 40.7L141.7 39.9L142.1 39.1L142.5 38.3L142.9 37.5L143.3 36.7\" stroke-width=\"2.2\"/><text x=\"149.3\" y=\"31.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"start\" font-style=\"italic\">y = 2x</text><path d=\"M96.7 30L97.4 30.8L98.2 31.5L98.9 32.3L99.7 33L100.4 33.7L101.2 34.5L101.9 35.2L102.7 36L103.4 36.8L104.2 37.5L104.9 38.3L105.7 39L106.4 39.8L107.2 40.5L107.9 41.3L108.7 42L109.4 42.8L110.2 43.5L110.9 44.3L111.7 45L112.4 45.8L113.2 46.5L113.9 47.3L114.7 48L115.4 48.8L116.2 49.5L116.9 50.3L117.7 51L118.4 51.8L119.2 52.5L119.9 53.2L120.7 54L121.4 54.7L122.2 55.5L122.9 56.2L123.7 57L124.4 57.7L125.2 58.5L125.9 59.2L126.7 60L127.4 60.7L128.2 61.5L128.9 62.3L129.7 63L130.4 63.8L131.2 64.5L131.9 65.3L132.7 66L133.4 66.8L134.2 67.5L134.9 68.3L135.7 69L136.4 69.8L137.2 70.5L137.9 71.3L138.7 72L139.4 72.8L140.2 73.5L140.9 74.3L141.7 75L142.4 75.8L143.2 76.5L143.9 77.3L144.7 78L145.4 78.8L146.2 79.5L146.9 80.3L147.7 81L148.4 81.8L149.2 82.5L149.9 83.3L150.7 84L151.4 84.8L152.2 85.5L152.9 86.3L153.7 87L154.4 87.8L155.2 88.5L155.9 89.3L156.7 90L157.4 90.8L158.2 91.5L158.9 92.3L159.7 93L160.4 93.8L161.2 94.5L161.9 95.3L162.7 96L163.4 96.8L164.2 97.5L164.9 98.3L165.7 99L166.4 99.8L167.2 100.5L167.9 101.3L168.7 102L169.4 102.8L170.2 103.5L170.9 104.3L171.7 105L172.4 105.8L173.2 106.5L173.9 107.3L174.7 108L175.4 108.8L176.2 109.5L176.9 110.3L177.7 111L178.4 111.8L179.2 112.5L179.9 113.3L180.7 114L181.4 114.8L182.2 115.5L182.9 116.3L183.7 117L184.4 117.8L185.2 118.5L185.9 119.3L186.7 120L187.4 120.8L188.2 121.5L188.9 122.3L189.7 123L190.4 123.8L191.2 124.5L191.9 125.3L192.7 126L193.4 126.8L194.2 127.5L194.9 128.3L195.7 129L196.4 129.8L197.2 130.5L197.9 131.3L198.7 132L199.4 132.8L200.2 133.5L200.9 134.3L201.7 135L202.4 135.8L203.2 136.5L203.9 137.3L204.7 138L205.4 138.8L206.2 139.5L206.9 140.3L207.7 141L208.4 141.8L209.2 142.5L209.9 143.3L210.7 144L211.4 144.8L212.2 145.5L212.9 146.3L213.7 147L214.4 147.8L215.2 148.5L215.9 149.3L216.7 150L217.4 150.8L218.2 151.5L218.9 152.3L219.7 153L220.4 153.8L221.2 154.5L221.9 155.3L222.7 156L223.4 156.8L224.2 157.5L224.9 158.3L225.7 159L226.4 159.8L227.2 160.5L227.9 161.3L228.7 162L229.4 162.8L230.2 163.5L230.9 164.3L231.7 165L232.4 165.8L233.2 166.5L233.9 167.3L234.7 168L235.4 168.8L236.2 169.5L236.9 170.3L237.7 171L238.4 171.8L239.2 172.5L239.9 173.3L240.7 174L241.4 174.8L242.2 175.5L242.9 176.3L243.7 177L244.4 177.8L245.2 178.5L245.9 179.3L246.7 180L247.4 180.8L248.2 181.5L248.9 182.3L249.7 183L250.4 183.8L251.2 184.5L251.9 185.3L252.7 186L253.4 186.8L254.2 187.5L254.9 188.3L255.7 189L256.4 189.8L257.2 190.5L257.9 191.3L258.7 192L259.4 192.8L260.2 193.5L260.9 194.3L261.7 195L262.4 195.8L263.2 196.5L263.9 197.3L264.7 198L265.4 198.8L266.2 199.5L266.9 200.3L267.7 201L268.4 201.8L269.2 202.5L269.9 203.3L270.7 204L271.4 204.8L272.2 205.5L272.9 206.3L273.7 207L274.4 207.8L275.2 208.5L275.9 209.3L276.7 210\" stroke-width=\"2.2\"/><text x=\"282.7\" y=\"204.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"start\" font-style=\"italic\">y = -x + 6</text><polygon points=\"63.3,196.7 130,63.3 263.3,196.7\" fill=\"currentColor\" fill-opacity=\"0.14\"/><circle cx=\"130\" cy=\"63.3\" r=\"3\" fill=\"currentColor\" stroke=\"none\"/><text x=\"130\" y=\"54.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">A</text><circle cx=\"263.3\" cy=\"196.7\" r=\"3\" fill=\"currentColor\" stroke=\"none\"/><text x=\"273.8\" y=\"212.1\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">B</text></svg>",
    "caption": "Şekil 1. Dik koordinat düzleminde iki doğrunun kesişimi ve eksenle oluşturduğu üçgen"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Şekil 1''deki dik koordinat düzleminde $y = 2x$ ve $y = -x + 6$ doğruları $A$ noktasında kesişmektedir. Taralı $OAB$ üçgeninin alanını bulalım. Önce iki doğrunun kesişim noktası olan $A$''yı ortak çözümle buluruz: $2x = -x + 6 \\Rightarrow 3x = 6 \\Rightarrow x = 2$. Yerine yazarsak $y = 2(2) = 4$ çıkar; yani $A(2, 4)$ noktasıdır. $y = -x + 6$ doğrusunun $x$-eksenini kestiği $B$ noktasını bulmak için $y = 0$ veririz ve $x = 6$ ($B(6, 0)$) elde edilir. Taralı $OAB$ üçgeninin tabanı $|OB| = 6$ birim, yüksekliği ise $A$ noktasının ordinatı olan $4$ birimdir; dolayısıyla alan $\\frac{6 \\cdot 4}{2} = 12$ birimkare olur. Dik kesişen doğru örneğinde ise $A(-2, 0)$ ve $B(0, 4)$''ten geçen doğrunun eğimi $m_1 = \\frac{4 - 0}{0 - (-2)} = 2$ ise buna dik doğrunun eğimi $m_2 = -\\frac{1}{2}$ olur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**DİKSE ÇARPIMLARI EKSİ BİR ($m_1 \\cdot m_2 = -1$)**: Bir doğruya dik doğrunun eğimini bulurken sadece işaret değiştirmekle kalma ($2 \\to -2$ yanlıştır!), kesri hem ters çevir hem işaretini değiştir ($2 \\to -\\frac{1}{2}$)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki hata çok sık görülür: Birincisi, $ax + by + c = 0$ doğrusunun eğimini $-\\frac{a}{b}$ yerine doğrudan $a$ sanmaktır ($y$''yi yalnız bırakmadan $x$''in katsayısı eğim olmaz). İkincisi, Şekil 1 gibi taralı alan sorularında kesişim noktasının yüksekliği olarak $y$ koordinatı yerine $x$ koordinatını alıp alanı yanlış hesaplamaktır; taban $x$-ekseni üzerindeyse yükseklik daima noktanın $y$ değeridir."
  },
  {
    "type": "key_points",
    "items": [
      "İki nokta arası eğim $m = \\frac{y_2 - y_1}{x_2 - x_1}$, doğru denkleminde ise $y = mx + n$ formunda $m$ eğimdir.",
      "Paralel doğruların eğimleri eşit ($m_1 = m_2$), dik doğruların eğimleri çarpımı $-1$''dir ($m_1 \\cdot m_2 = -1$).",
      "Kesişim noktası iki doğrunun ortak çözümüyle bulunur.",
      "Eksenleri kesen noktalar için sırasıyla $x = 0$ ve $y = 0$ değerlerini ver."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "2a4f1d37-4b2d-5f9d-a5f4-f03238266221",
      "2d2f9536-142e-542a-99d0-c36aef2f646e"
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
  'matematik_geometri.analitik_geometri_ve_kati_cisimler.03',
  'Matematik & Geometri',
  'Analitik Geometri ve Katı Cisimler',
  3,
  'Bölüm 3: Katı Cisimler (Prizmalar, Küp, Silindir, Piramit ve Koni)',
  'Katı cisimler üç boyutlu hacim ve yüzey alanı sorularıdır ve KPSS''de formülleri oldukça düzenli bir mantığa oturur.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Katı cisimler üç boyutlu hacim ve yüzey alanı sorularıdır ve KPSS''de formülleri oldukça düzenli bir mantığa oturur. Bütün dik prizma ve silindirler tek bir çatı altında özetlenebilir: **Tabanı ile tavanı eş olan bütün dik cisimlerde:**"
  },
  {
    "type": "paragraph",
    "text": "$$\\text{Hacim} = \\text{Taban Alanı} \\cdot \\text{Yükseklik} \\qquad \\text{ve} \\qquad \\text{Yanal Alan} = \\text{Taban Çevresi} \\cdot \\text{Yükseklik}$$"
  },
  {
    "type": "paragraph",
    "text": "Toplam yüzey alanı ise **$\\text{Yanal Alan} + 2 \\cdot \\text{Taban Alanı}$** ile bulunur (çünkü hem alt hem üst taban vardır; üstü açık kaplarda yalnızca $1$ taban alanı eklenir!)."
  },
  {
    "type": "heading",
    "text": "Küp, Dikdörtgenler Prizması ve Dik Dairesel Silindir"
  },
  {
    "type": "bullets",
    "items": [
      "**Dikdörtgenler Prizması:** Ayrıtları $a, b, c$ ise toplam ayrıt uzunluğu $4(a + b + c)$, yüzey alanı $2(ab + ac + bc)$, hacmi $a \\cdot b \\cdot c$ ve cisim köşegeni $\\sqrt{a^2 + b^2 + c^2}$''dir.",
      "**Küp:** $12$ ayrıtının her biri $a$, $6$ yüzünün her biri $a^2$ alanlı karedir. Toplam yüzey alanı $6a^2$, hacmi $a^3$, cisim köşegeni $a\\sqrt{3}$''tür.",
      "**Dik Dairesel Silindir:** Taban yarıçapı $r$, yüksekliği $h$ olan silindir açıldığında yan yüzeyi bir kenarı $2\\pi r$ diğer kenarı $h$ olan bir **dikdörtgen** oluşur! Hacmi $\\pi r^2 h$, yanal alanı $2\\pi r h$, tüm alanı ise $2\\pi r h + 2\\pi r^2$''dir. Silindir yüzeyinden en kısa yol sorularında silindiri açıp o dikdörtgen üzerinde **Pisagor** uygulanır!"
    ]
  },
  {
    "type": "heading",
    "text": "Tepesi Sivri Cisimler (Piramit ve Koni) ile Küre"
  },
  {
    "type": "paragraph",
    "text": "Tepesi sivri birleşen bütün düzgün piramit ve konilerde hacim, aynı tabanlı ve aynı yüksekliğe sahip prizma veya silindirin **üçte birine** eşittir:"
  },
  {
    "type": "paragraph",
    "text": "$$V_{\\text{piramit / koni}} = \\frac{1}{3} \\cdot \\text{Taban Alanı} \\cdot h$$"
  },
  {
    "type": "paragraph",
    "text": "Dik dairesel konide ana doğru $l$, yarıçap $r$ ve yükseklik $h$ olmak üzere $l^2 = r^2 + h^2$ Pisagor''u ve yan yüzey açınımında merkez açı $\\alpha$ ile $\\frac{r}{l} = \\frac{\\alpha}{360^\\circ}$ ilişkisi geçerlidir; yanal alanı $\\pi r l$''dir. **Kürenin** hacmi $\\frac{4}{3}\\pi r^3$, yüzey alanı ise $4\\pi r^2$ olarak hesaplanır. Sıvı boşaltma ve doldurma sorularında ise daima **hacimlerin eşitliği** ($V_1 = V_2$) kurulur; bir prizma veya silindir eğik konumda tutulsa dahi içindeki suyun hacmi sabit kaldığından yamuk prizma kesitinde ortalama yükseklik ($\\frac{h_1 + h_2}{2}$) kullanılarak hacim korunur. Bir dikdörtgeni kendi kenarlarından biri etrafında $360^\\circ$ döndürürsen oluşan cisim her zaman bir **dik dairesel silindir**, bir dik üçgeni dik kenarı etrafında döndürürsen oluşan cisim ise bir **dik dairesel koni** olur (etrafında dönülen kenar yükseklik $h$, diğer dik kenar yarıçap $r$ alınır!)."
  },
  {
    "type": "table",
    "headers": [
      "Katı Cisim",
      "Hacim",
      "Yüzey Alanı / Kritik Not"
    ],
    "rows": [
      [
        "Küp (ayrıt $a$)",
        "$a^3$",
        "Alan $6a^2$, $12$ eşit ayrıt toplamı $12a$"
      ],
      [
        "Dikdörtgenler Prizması ($a, b, c$)",
        "$a \\cdot b \\cdot c$",
        "Alan $2(ab + ac + bc)$"
      ],
      [
        "Silindir ($r, h$)",
        "$\\pi r^2 h$",
        "Yanal alan $2\\pi r h$, toplam $2\\pi r h + 2\\pi r^2$"
      ],
      [
        "Koni / Piramit",
        "$\\frac{1}{3} \\cdot \\text{Taban Alanı} \\cdot h$",
        "Koni yanal alanı $\\pi r l$"
      ],
      [
        "Küre ($r$)",
        "$\\frac{4}{3} \\pi r^3$",
        "Yüzey alanı $4\\pi r^2$"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Bir küpün tüm ayrıtlarının uzunlukları toplamı $48$ cm olduğuna göre bu küpün hacmini ve yüzey alanını bulalım. Küpte birbirine eşit toplam $12$ ayrıt bulunduğu için bir ayrıt uzunluğu $a = \\frac{48}{12} = 4$ cm bulunur. Küpün hacmi $a^3 = 4^3 = 64\\text{ cm}^3$, toplam yüzey alanı ise $6a^2 = 6 \\cdot 4^2 = 96\\text{ cm}^2$ olur. İkinci bir örnekte taban yarıçapı $3$ cm, yüksekliği $8$ cm olan dolu bir silindirin içindeki suyun tamamı taban yarıçapı $6$ cm olan boş bir silindire boşaltılırsa su yüksekliği ne olur? Hacimler eşit olacağından $\\pi \\cdot 3^2 \\cdot 8 = \\pi \\cdot 6^2 \\cdot h \\Rightarrow 72\\pi = 36\\pi h \\Rightarrow h = 2$ cm bulunur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Üç klasik hata katı cisimlerde puan kaybettirir: Birincisi, küpün ayrıt sayısını $12$ yerine $8$ (köşe sayısı) ya da $6$ (yüz sayısı) sanmaktır. İkincisi, koni ve piramit hacminde baştaki **$\\frac{1}{3}$** çarpanını unutmaktır. Üçüncüsü, küp veya silindirde hacim ($a^3$) yerine yanlışlıkla alan ($6a^2$) hesaplayıp işaretlemektir."
  },
  {
    "type": "key_points",
    "items": [
      "Tüm prizma ve silindirlerde hacim $\\text{Taban Alanı} \\cdot h$; piramit ve konide ise $\\frac{1}{3} \\cdot \\text{Taban Alanı} \\cdot h$''dir.",
      "Küpte $12$ ayrıt ($12a$), $6$ kare yüz ($6a^2$) ve $8$ köşe vardır.",
      "Silindirin yan yüzü açıldığında $2\\pi r$ uzunluğunda ve $h$ yüksekliğinde bir dikdörtgen oluşur; en kısa yol buradan Pisagorla bulunur.",
      "Su aktarma veya cisim eritip yeni cisim dökme sorularında değişmeyen tek büyüklük hacimdir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "4a00e6bb-e425-51a4-8c7d-de8b2858a34a",
      "6e25644f-8016-5784-8c35-2c7cbb5e4eee"
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
