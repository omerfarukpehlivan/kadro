-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Çokgenler, Dörtgenler ve Çember-Daire
-- Kaynak: docs/konu_anlatimi/matematik/13_cokgenler_dortgenler_ve_cember_daire.md
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
  'matematik_geometri.cokgenler_dortgenler_ve_cember_daire.01',
  'Matematik & Geometri',
  'Çokgenler, Dörtgenler ve Çember-Daire',
  1,
  'Bölüm 1: Çokgenler ve Düzgün Çokgen Özellikleri',
  '$n \ge 3$ kenarlı bir dışbükey çokgende bütün köşelere ait açı ve köşegen formülleri kenar sayısı $n$''e bağlıdır:',
  4,
  '[
  {
    "type": "paragraph",
    "text": "$n \\ge 3$ kenarlı bir dışbükey çokgende bütün köşelere ait açı ve köşegen formülleri kenar sayısı $n$''e bağlıdır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Bir köşeden çizilen köşegen sayısı:** $n - 3$ (bu köşegenler çokgeni $n - 2$ adet üçgene ayırır).",
      "**Toplam köşegen sayısı:** Her köşeden $n - 3$ köşegen çıkar ama her köşegen iki kez sayıldığı için $\\dfrac{n(n - 3)}{2}$ olur.",
      "**İç açılar toplamı:** Çokgen $n - 2$ üçgene ayrıldığı için $(n - 2) \\cdot 180^\\circ$ formülü geçerlidir.",
      "**Dış açılar toplamı:** Kenar sayısı kaç olursa olsun her dışbükey çokgende **daima $360^\\circ$**''dir!"
    ]
  },
  {
    "type": "paragraph",
    "text": "Açıların ve kenarların değişken olduğu genel çokgen sorularında verilmeyen iç açıları önce $180^\\circ$''den çıkarıp dış açıya geçirmek toplamı sabit olan $360^\\circ$ üzerinden daha kolay denklem kurmanı sağlar; örneğin iki iç açısı $130^\\circ$ ve $140^\\circ$, diğer tüm iç açıları $150^\\circ$ olan çokgende dış açılar sırasıyla $50^\\circ$, $40^\\circ$ ve $30^\\circ$ alınarak $50 + 40 + (n - 2) \\cdot 30 = 360 \\Rightarrow n - 2 = 9 \\Rightarrow n = 11$ saniyeler içinde bulunur."
  },
  {
    "type": "heading",
    "text": "Düzgün Çokgenler ve Dış Açı Kısayolu"
  },
  {
    "type": "paragraph",
    "text": "Tüm kenarları ve tüm iç açıları eşit olan çokgenlere **düzgün çokgen** denir. Düzgün çokgen sorularında iç açı formülü yerine önce **bir dış açıyı** bulmak her zaman daha hızlıdır:"
  },
  {
    "type": "paragraph",
    "text": "$$\\text{Bir Dış Açı} = \\frac{360^\\circ}{n} \\qquad \\text{ve} \\qquad \\text{Bir İç Açı} = 180^\\circ - \\text{Dış Açı}$$"
  },
  {
    "type": "paragraph",
    "text": "KPSS''de en çok karşılaşılan düzgün çokgenler **düzgün beşgen** (bir dış açı $72^\\circ$, bir iç açı $108^\\circ$, bütün köşegenleri eşittir) ve **düzgün altıgendir** (bir dış açı $60^\\circ$, bir iç açı $120^\\circ$). Bir kenarı $a$ olan düzgün altıgen $6$ adet eşkenar üçgenden oluşur; kısa köşegeni $a\\sqrt{3}$, uzun simetri köşegeni $2a$ ve toplam alanı $6 \\cdot \\frac{a^2\\sqrt{3}}{4}$''tür. Bir düzgün çokgende eşit kenarları mutlaka işaretleyerek içeride oluşan ikizkenar üçgenleri bul."
  },
  {
    "type": "paragraph",
    "text": "Ayrıca dış açının $36^\\circ$ olduğu **düzgün ongen** ($144^\\circ$ iç açı) ve dış açının $45^\\circ$ olduğu **düzgün sekizgen** ($135^\\circ$ iç açı) ile ilgili \"ardışık kenarların uzantıları arasındaki açı\" sorularında uzantıların oluşturduğu dış üçgende dış açıları doğrudan $360^\\circ \\div n$ olarak yazmak tek adımda sonuca götürür. Bir düzgün çokgenin yalnızca belirli ardışık köşeleri verildiğinde de aynı dış açıyı kullan: her kenarın dışarıda yarattığı dönme açısı eşittir; örneğin bir kenar uzantısı ile diğer kenar arasındaki açı $2 \\cdot \\text{dış açı}$ ise $n$ hemen bulunur."
  },
  {
    "type": "table",
    "headers": [
      "Düzgün Çokgen",
      "Kenar ($n$)",
      "Bir Dış Açı",
      "Bir İç Açı"
    ],
    "rows": [
      [
        "Eşkenar Üçgen",
        "$3$",
        "$120^\\circ$",
        "$60^\\circ$"
      ],
      [
        "Kare",
        "$4$",
        "$90^\\circ$",
        "$90^\\circ$"
      ],
      [
        "Düzgün Beşgen",
        "$5$",
        "$72^\\circ$",
        "$108^\\circ$"
      ],
      [
        "Düzgün Altıgen",
        "$6$",
        "$60^\\circ$",
        "$120^\\circ$"
      ],
      [
        "Düzgün Sekizgen",
        "$8$",
        "$45^\\circ$",
        "$135^\\circ$"
      ]
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 290.9 260\" width=\"290.9\" height=\"260\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><polygon points=\"30,130 87.7,30 203.2,30 260.9,130 203.2,230 87.7,230\"/><polygon points=\"30,130 203.2,30 260.9,130\" fill=\"currentColor\" fill-opacity=\"0.16\"/><line x1=\"30\" y1=\"130\" x2=\"87.7\" y2=\"30\"/><text x=\"47.1\" y=\"77.7\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">4</text><text x=\"16\" y=\"134.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">A</text><text x=\"80.7\" y=\"22.8\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">B</text><text x=\"210.2\" y=\"22.8\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">C</text><text x=\"274.9\" y=\"134.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">D</text><text x=\"210.2\" y=\"247\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">E</text><text x=\"80.7\" y=\"247\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">F</text></svg>",
    "caption": "Şekil 1. Bir kenarı $4$ cm olan düzgün altıgende köşegen ve taralı $ACD$ dik üçgeni"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Bir dışbükey çokgenin iç açılarının ölçüleri toplamı, dış açılarının ölçüleri toplamının $4$ katı ise bu çokgenin toplam köşegen sayısı kaçtır? Dış açılar toplamı her zaman $360^\\circ$ olduğu için iç açılar toplamı $4 \\cdot 360^\\circ = 1440^\\circ$ olur. Formülden $(n - 2) \\cdot 180^\\circ = 1440^\\circ \\Rightarrow n - 2 = 8 \\Rightarrow n = 10$ (ongendir). Bizden kenar sayısı değil **köşegen sayısı** istendiği için $\\frac{10 \\cdot (10 - 3)}{2} = 35$ köşegen bulunur. Şekil 1''deki $ABCDEF$ düzgün altıgeninde ise $m(\\widehat{ACD}) = 90^\\circ$, $|CD| = 4$ ve kısa köşegen $|AC| = 4\\sqrt{3}$ olduğu için taralı $ACD$ dik üçgeninin alanı $\\frac{4 \\cdot 4\\sqrt{3}}{2} = 8\\sqrt{3}\\text{ cm}^2$''dir."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**ÖNCE DIŞ AÇIYI BUL ($360^\\circ \\div n$)**: Düzgün çokgenlerde karmaşık $(n-2)\\cdot 180 / n$ kesriyle uğraşma; $360^\\circ$''yi kenar sayısına bölüp dış açıyı bul, $180^\\circ$''den çıkarınca iç açı saniyede çıkar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Çokgen sorularında en yaygın tuzak, $n$''i (kenar sayısını) doğru bulduktan sonra sorunun kenar sayısını değil \"bir köşeden çizilen köşegen sayısını ($n - 3$)\" veya \"toplam köşegen sayısını ($\\frac{n(n-3)}{2}$)\" sorduğunu gözden kaçırıp doğrudan $n$''i işaretlemektir. Düzgün altıgende de kısa köşegen ($a\\sqrt{3}$) ile uzun köşegen ($2a$) birbirine karıştırılmamalıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Her dışbükey çokgende dış açılar toplamı sabittir ve $360^\\circ$''dir.",
      "Düzgün beşgende iç açı $108^\\circ$, düzgün altıgende iç açı $120^\\circ$''dir.",
      "Düzgün altıgen $6$ eş eşkenar üçgenden oluşur; kısa köşegen $a\\sqrt{3}$, uzun köşegen $2a$''dır.",
      "Toplam köşegen sayısı $\\frac{n(n-3)}{2}$, bir köşeden çıkan köşegen sayısı $n - 3$''tür."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0b8343ba-e9a9-5d15-bc39-1f54c982bca3",
      "1388423e-09d9-5fb5-91f5-9585107d942f"
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
  'matematik_geometri.cokgenler_dortgenler_ve_cember_daire.02',
  'Matematik & Geometri',
  'Çokgenler, Dörtgenler ve Çember-Daire',
  2,
  'Bölüm 2: Özel Dörtgenler (Paralelkenar, Eşkenar Dörtgen, Dikdörtgen, Kare, Yamuk)',
  'Her dörtgenin iç açılar ve dış açılar toplamı $360^\circ$''dir; köşegenleri dik kesişen herhangi bir dörtgenin alanı ise köşegenler çarpımının yarısıdır ($\frac{e \cdot f}{2}$).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Her dörtgenin iç açılar ve dış açılar toplamı $360^\\circ$''dir; köşegenleri dik kesişen herhangi bir dörtgenin alanı ise köşegenler çarpımının yarısıdır ($\\frac{e \\cdot f}{2}$). KPSS''de beş özel dörtgenin ayırt edici özellikleri sürekli test edilir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Paralelkenar:** Karşılıklı kenarlar paralel ve eşit, karşılıklı açılar eşit, komşu açılar bütünlerdir ($180^\\circ$). Komşu iki köşeden çizilen açıortaylar daima **$90^\\circ$ dik kesişir**! Köşegenler birbirini ortalar ve alanı $4$ eşit parçaya böler. Alanı taban çarpı o tabana ait yüksekliktir ($A = a \\cdot h_a = b \\cdot h_b$).",
      "**Eşkenar Dörtgen:** Tüm kenarları eşit bir paralelkenardır. Köşegenleri hem **dik kesişir** hem de **açıortaydır**. Alanı $a \\cdot h$ veya $\\frac{e \\cdot f}{2}$ ile hesaplanır.",
      "**Dikdörtgen:** Açıları $90^\\circ$''dir, köşegenleri eşit uzunluktadır ve birbirini ortalar. Dikdörtgen içinde veya dışında alınan bir nokta için karşılıklı köşelere uzaklıkların kareleri toplamı eşittir ($|PA|^2 + |PC|^2 = |PB|^2 + |PD|^2$).",
      "**Kare:** Hem dikdörtgen hem eşkenar dörtgendir: tüm kenarları $a$, köşegeni $a\\sqrt{2}$, köşegenler dik kesişir ve $45^\\circ-45^\\circ$ açıortaydır. Alanı $a^2 = \\frac{e^2}{2}$''dir. Karede köşegen çizildiğinde yanındaki parçalarla eş veya benzer dik üçgenler aranmalıdır.",
      "**Yamuk:** Yalnızca iki kenarı paraleldir ($AB \\parallel DC$); komşu yan açılar toplamı $180^\\circ$''dir. **Orta taban** uzunluğu alt ve üst taban toplamının yarısıdır ($\\frac{a + c}{2}$) ve alanı **$\\text{Orta Taban} \\cdot h = \\frac{a + c}{2} \\cdot h$**''dir. İkizkenar yamukta iki köşeden dikmeler indirildiğinde tabanda simetrik $\\frac{a - c}{2}$ parçaları oluşur; dik yamukta ise bir yan köşeden tabana dikme indirip dikdörtgen + dik üçgen ayrımı yapılır.",
      "**Deltoid:** Tabanları ortak iki ikizkenar üçgenin birleşimidir. Köşegenleri **dik kesişir**, simetri ekseni olan ana köşegen diğer köşegeni ortalar ve tepe açılarının açıortayıdır; alanı da $\\frac{e \\cdot f}{2}$ formülüyle hesaplanır."
    ]
  },
  {
    "type": "heading",
    "text": "Dörtgenlerde Alan Paylaşımı ve Köşegen Kesişimleri"
  },
  {
    "type": "paragraph",
    "text": "Herhangi bir paralelkenarda veya dikdörtgende köşegenler üzerinde alınan parçalara göre üçgen alanları taban oranıyla paylaşılır; örneğin bir karede $[AC]$ köşegeni alanı iki eşit parçaya böler ve üzerinde $|AE| = 2|EC|$ olacak biçimde $E$ noktası alınırsa oluşan $ABE$ ve $CBE$ üçgenlerinin alanları $2S$ ve $S$ olarak ayrılır. Yamukta ise köşegenler çizildiğinde yanlarda kalan iki üçgenin (kulakların) alanları her zaman eşittir ($S_1 = S_3$) ve karşılıklı alanların çarpımı birbirine eşittir ($S_1 \\cdot S_3 = S_{\\text{üst}} \\cdot S_{\\text{alt}}$)."
  },
  {
    "type": "table",
    "headers": [
      "Dörtgen",
      "Köşegenler Eşit mi",
      "Köşegenler Dik mi",
      "Alan Formülü"
    ],
    "rows": [
      [
        "Paralelkenar",
        "Hayır (ortalar)",
        "Hayır",
        "$a \\cdot h_a$"
      ],
      [
        "Eşkenar Dörtgen",
        "Hayır (ortalar, açıortay)",
        "Evet",
        "$\\frac{e \\cdot f}{2}$ veya $a \\cdot h$"
      ],
      [
        "Dikdörtgen",
        "Evet (ortalar)",
        "Hayır",
        "$a \\cdot b$"
      ],
      [
        "Kare",
        "Evet (ortalar, $45^\\circ$)",
        "Evet",
        "$a^2$ veya $\\frac{e^2}{2}$"
      ],
      [
        "Yamuk",
        "Yalnız ikizkenarda eşit",
        "Özel şartta",
        "$\\frac{a + c}{2} \\cdot h$"
      ]
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 340 189.2\" width=\"340\" height=\"189.2\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><polygon points=\"30,159.2 310,159.2 310,30 30,30\"/><line x1=\"30\" y1=\"159.2\" x2=\"116.2\" y2=\"30\"/><line x1=\"310\" y1=\"159.2\" x2=\"116.2\" y2=\"30\"/><polyline points=\"110.1,39.2 119.2,45.3 125.3,36.1\" stroke-width=\"1.4\"/><line x1=\"30\" y1=\"159.2\" x2=\"30\" y2=\"30\"/><text x=\"16.1\" y=\"99.2\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">6</text><line x1=\"30\" y1=\"30\" x2=\"116.2\" y2=\"30\"/><text x=\"73.1\" y=\"22.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">4</text><text x=\"19.5\" y=\"174.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">A</text><text x=\"320.5\" y=\"174.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">B</text><text x=\"320.5\" y=\"24.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">C</text><text x=\"19.5\" y=\"24.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">D</text><text x=\"116.2\" y=\"20.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">E</text></svg>",
    "caption": "Şekil 2. Dikdörtgen içinde Öklid ile taban bulma ($AE \\perp BE$, $|AD|=6$, $|DE|=4$)"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Şekil 2''deki $ABCD$ dikdörtgeninde $E \\in [DC]$, $AE \\perp BE$, $|AD| = 6$ cm ve $|DE| = 4$ cm ise dikdörtgenin alanı kaç $\\text{cm}^2$''dir? Önce $E$ noktasından $AB$ tabanına dikme indirdiğimizi düşünelim: bu dikme yükseklik olarak $h = |AD| = 6$ cm ve sol parçayı $p = |DE| = 4$ cm olarak ayırır. $AEB$ dik üçgeninde Öklid ($h^2 = p \\cdot k$) uygularsak $6^2 = 4 \\cdot k \\Rightarrow 36 = 4k \\Rightarrow k = |EC| = 9$ cm bulunur. Dikdörtgenin uzun kenarı $|DC| = 4 + 9 = 13$ cm olduğundan alan $6 \\cdot 13 = 78\\text{ cm}^2$ olur."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki nokta dörtgenlerde sürekli tuzak olur: Birincisi, Öklid ile $|EC| = 9$ bulduktan sonra $|DE| = 4$''ü eklemeyi unutup uzun kenarı $9$ alarak alanı $6 \\cdot 9 = 54$ işaretlemektir. İkincisi, dik yamukta yükseklik indirip Pisagorla gerçek yüksekliği bulmak yerine doğrudan eğik yan kenarı yükseklik sanıp yamuk alanını çarpmaktır."
  },
  {
    "type": "key_points",
    "items": [
      "Paralelkenar ve yamukta komşu iki açının açıortayları dik kesişir ($90^\\circ$); açıortay ile Z kuralı birleşince ikizkenar doğar.",
      "Dik yamukta dik olmayan üst köşeden tabana dikme indirip dikdörtgen ve dik üçgen kur.",
      "Kare ve eşkenar dörtgende köşegenler dik kesişir ve açıortaydır.",
      "Bir yamuk veya paralelkenar içinde tabanı tam kenar, tepesi karşı kenar üzerinde olan üçgenin alanı tüm alanın yarısıdır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "158d43cc-db6b-549e-97e8-68b35c0995ab",
      "159481c6-bf17-58ac-a225-d8d3b5ce7c8d"
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
  'matematik_geometri.cokgenler_dortgenler_ve_cember_daire.03',
  'Matematik & Geometri',
  'Çokgenler, Dörtgenler ve Çember-Daire',
  3,
  'Bölüm 3: Çemberde Açı, Uzunluk ve Dairede Alan',
  'Sabit bir merkez noktasına eşit uzaklıktaki ($r$ yarıçap) noktaların kümesine çember, içi dolu bölgesine ise daire denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sabit bir merkez noktasına eşit uzaklıktaki ($r$ yarıçap) noktaların kümesine **çember**, içi dolu bölgesine ise **daire** denir."
  },
  {
    "type": "heading",
    "text": "Çemberde Açı ve Teğet-Kiriş İlişkileri"
  },
  {
    "type": "paragraph",
    "text": "Çemberde açı hesapları dört temel ölçüye dayanır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Merkez Açı:** Köşesi merkezde olan açı, gördüğü yayın ölçüsüne eşittir ($\\alpha$).",
      "**Çevre Açı:** Köşesi çember üzerinde olan açı, gördüğü yayın ölçüsünün **yarısına** eşittir ($\\frac{\\text{yay}}{2}$). Aynı yayı gören bütün çevre açılar eşittir; özellikle **çapı gören çevre açı daima $90^\\circ$**''dir!",
      "**Teğet-Kiriş Açı:** Çembere teğet doğru ile kiriş arasındaki açı da çevre açı gibi gördüğü yayın yarısına eşittir.",
      "**İç ve Dış Açı:** Çember içinde kesişen iki kirişin oluşturduğu açı gördüğü iki yayın toplamının yarısı ($\\frac{\\alpha + \\beta}{2}$), çember dışındaki iki kesen veya teğetin oluşturduğu açı ise gördüğü büyük yay eksi küçük yayın yarısıdır ($\\frac{\\alpha - \\beta}{2}$). İki teğet arasında kalan açı ile önündeki küçük yayın toplamı daima $180^\\circ$''dir."
    ]
  },
  {
    "type": "heading",
    "text": "Çemberde Uzunluk ve Dairede Çevre-Alan"
  },
  {
    "type": "paragraph",
    "text": "Merkezden kirişe indirilen dikme **kirişi ortalar** ($r^2 = d^2 + (\\frac{\\text{kiriş}}{2})^2$ Pisagor''unu kur!). Merkezden teğetin değme noktasına çizilen yarıçap ise teğete **daima diktir ($90^\\circ$)**. Bir dış noktadan çembere çizilen iki teğet parçasının uzunlukları birbirine eşittir. Çemberde kuvvet kuralına göre içeride kesişen iki kirişte $a \\cdot b = c \\cdot d$, dışarıdaki bir noktadan kesenlerde yakın parça çarpı tamamı eşittir."
  },
  {
    "type": "paragraph",
    "text": "Yarıçapı $r$ olan dairede **çevre $= 2\\pi r$** ve **alan $= \\pi r^2$**''dir. Merkez açısı $\\alpha$ olan bir daire diliminin yay uzunluğu $2\\pi r \\cdot \\frac{\\alpha}{360^\\circ}$, alanı ise $\\pi r^2 \\cdot \\frac{\\alpha}{360^\\circ}$ formülüyle bulunur. Bir daire kesmesinin alanı sorulduğunda da daire diliminin alanından içindeki üçgenin alanı çıkarılır. Daire halkasının (iki eş merkezli çember arasındaki bölge) alanı ise $\\pi(R^2 - r^2)$ ile bulunur; eğer büyük çemberin küçük çembere teğet bir kirişinin uzunluğu $2a$ verilmişse Pisagor''dan $R^2 - r^2 = a^2$ olduğu için halka alanı doğrudan $\\pi a^2$ olarak hesaplanır!"
  },
  {
    "type": "paragraph",
    "text": "İki çember birbirine dıştan teğetse merkezleri arasındaki uzaklık $r_1 + r_2$, içten teğetse $\\lvert r_1 - r_2 \\rvert$''dir. Kesişen ya da teğet çemberler içeren sorularda daima merkezleri birleştir ve değme noktalarına yarıçap çizerek dik üçgen kur."
  },
  {
    "type": "table",
    "headers": [
      "Çember / Daire Kavramı",
      "Formül / Açı Kuralı",
      "Önemli Not"
    ],
    "rows": [
      [
        "Merkez açı / Çevre açı",
        "$\\alpha$ / $\\frac{\\text{yay}}{2}$",
        "Çapı gören çevre açı $90^\\circ$''dir"
      ],
      [
        "İç açı / Dış açı",
        "$\\frac{\\alpha + \\beta}{2}$ / $\\frac{\\alpha - \\beta}{2}$",
        "Teğet ile kiriş açısı da çevre açı gibidir"
      ],
      [
        "Daire dilimi yay / alan",
        "$2\\pi r \\frac{\\alpha}{360^\\circ}$ / $\\pi r^2 \\frac{\\alpha}{360^\\circ}$",
        "$\\alpha$ merkez açı olmalıdır"
      ],
      [
        "Daire halkası alanı",
        "$\\pi(R^2 - r^2)$",
        "Teğet kiriş $2a$ ise halka alanı $\\pi a^2$''dir"
      ]
    ]
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 260 260\" width=\"260\" height=\"260\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><circle cx=\"130\" cy=\"130\" r=\"100\"/><polygon points=\"30,130 230,130 190,50\"/><polyline points=\"180.2,54.9 185.1,64.8 194.9,59.8\" stroke-width=\"1.4\"/><line x1=\"30\" y1=\"130\" x2=\"190\" y2=\"50\"/><text x=\"104.3\" y=\"83.1\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">8</text><line x1=\"230\" y1=\"130\" x2=\"190\" y2=\"50\"/><text x=\"222.2\" y=\"88.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\">6</text><circle cx=\"130\" cy=\"130\" r=\"3\" fill=\"currentColor\" stroke=\"none\"/><text x=\"130\" y=\"148.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">O</text><text x=\"16\" y=\"134.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">A</text><text x=\"244\" y=\"134.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">B</text><text x=\"200.5\" y=\"44.4\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-weight=\"600\">C</text></svg>",
    "caption": "Şekil 3. Merkez, teğet ve çapı gören çevre açı ilişkisi"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Şekil 3''teki $O$ merkezli yarım çember veya tam çemberde $[AB]$ çap olmak üzere $|AC| = 8$ cm ve $|BC| = 6$ cm ise taralı yarım daireden $ABC$ üçgeni çıkarıldığında kalan bölgenin alanı kaç $\\text{cm}^2$''dir? Çapı gören çevre açı daima $90^\\circ$ olduğu için $m(\\widehat{ACB}) = 90^\\circ$''dir. $6-8-10$ dik üçgeninden çap $|AB| = 10$ cm, yarıçap $r = 5$ cm bulunur. Yarım dairenin alanı $\\frac{\\pi \\cdot 5^2}{2} = \\frac{25\\pi}{2}$, dik üçgenin alanı ise $\\frac{6 \\cdot 8}{2} = 24$''tür. Kalan alan $\\frac{25\\pi}{2} - 24$ olarak elde edilir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Çember sorularında en büyük iki tuzak şunlardır: Birincisi, çevre açıyı merkez açı sanıp gördüğü yaya eşit almak (oysa çevre açı yayın yarısıdır). İkincisi, yarım daire veya çeyrek daire alanlarını hesaplarken tam daire alanı $\\pi r^2$''yi sırasıyla $2$''ye veya $4$''e bölmeyi unutmaktır. Ayrıca teğet değme noktası varsa oraya mutlaka merkezden yarıçap çizerek $90^\\circ$''lik dik açıyı göster ve çevrel/iç teğet çemberlerde teğet uzunluklarının eşitliğini kenar üzerine yaz."
  },
  {
    "type": "key_points",
    "items": [
      "Çapı gören çevre açı daima $90^\\circ$''dir; dik üçgen kurarak yarıçapı bul.",
      "Merkezden teğete çizilen yarıçap teğete diktir ($90^\\circ$); kirişe inen dikme ise kirişi iki eşit parçaya böler.",
      "Çevre açı gördüğü yayın yarısına, merkez açı ise gördüğü yayın tamamına eşittir.",
      "Yarıçapı $r$ olan dairede çevre $2\\pi r$, alan $\\pi r^2$, $\\alpha^\\circ$''lik dilim oranı $\\frac{\\alpha}{360^\\circ}$''dir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "1f8f751c-90e7-5fcd-8fd6-d9572330098e",
      "234adf13-308d-5dd5-8e22-0882c9d05ac4"
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
