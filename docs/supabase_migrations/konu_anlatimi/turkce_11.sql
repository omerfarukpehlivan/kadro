-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözel Mantık ve Muhakeme
-- Kaynak: docs/konu_anlatimi/turkce/11_sozel_mantik_ve_muhakeme.md
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
  'turkce.sozel_mantik_ve_muhakeme.01',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  1,
  'Bölüm 1: Sıralama ve Konum Soruları (Tek Boyutlu Diziliş ve Blok Kurma)',
  'Sözel mantık ve muhakeme soruları bilgi ezberi değil, verilen öncülleri görsel bir şemaya dönüştürme becerisini ölçer.  İlk ve en temel soru tipi tek boyutlu sıralama ve konum (raf, boy, puan, kat, oda) sorularıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözel mantık ve muhakeme soruları bilgi ezberi değil, verilen öncülleri **görsel bir şemaya dönüştürme** becerisini ölçer. İlk ve en temel soru tipi tek boyutlu **sıralama ve konum (raf, boy, puan, kat, oda)** sorularıdır. Bu soruları zihinden çözmeye çalışmak en büyük zaman kaybıdır; bunun yerine hemen `1 - 2 - 3 - 4 - 5` biçiminde numaralı yuvalar veya `> / <` yönlü bir şema çizmelisin."
  },
  {
    "type": "paragraph",
    "text": "Sıralama sorularında iki altın kural vardır: (1) Önce **kesin yer bildiren** veya **uçları sınırlayan** öncülleri (\"Tarih kitabı en solda değildir\", \"Ada 2. ya da 3. odadadır\") şemaya yaz; (2) Birbirinin hemen yanında veya bitişiğinde durduğu söylenen unsurları tek bir **blok** (`[Roman - Şiir]`) halinde kutula. Eğer \"A, B''nin hemen solundadır\" deniyorsa `[A - B]` ayrılmaz bir ikilidir; yalnızca \"A, B''nin solundadır\" deniyorsa aralarına başka eleman girebilir (`A ... B`). Ayrıca birden fazla olasılık ortaya çıkıyorsa iki ayrı satırda iki olasılığı paralel yürütmek, çelişen olasılığı son öncüllerle tek hamlede eleyebilmeni sağlar."
  },
  {
    "type": "paragraph",
    "text": "Bunun yanında sıralama sorularında **\"Kesinlikle doğrudur\"**, **\"Kesinlikle yanlıştır\"** ve **\"Doğru olabilir\"** soru köklerini ayırmak çok önemlidir. Birden fazla geçerli dizilişin ortaya çıktığı sorularda, tüm geçerli dizilişlerde aynı konumda kalan öge **kesinlikle doğrudur**; dizilişlerden en az birinde gerçekleşebilen durum **olabilir**; hiçbir geçerli dizilişte mümkün olmayan durum ise **kesinlikle yanlıştır**. Bu ayrımı yapabilmek için ilk bulduğun doğru sırayla yetinmeyip varsa ikinci olasılığı da mutlaka kenara yazmalısın."
  },
  {
    "type": "table",
    "headers": [
      "Öncül İfadesi",
      "Şema Karşılığı",
      "Dikkat Edilecek Nokta"
    ],
    "rows": [
      [
        "\"A, B''den hemen sonra gelir.\"",
        "`[B - A]` bitişik blok",
        "Araya hiçbir eleman giremez"
      ],
      [
        "\"A, B''den sonra gelir.\"",
        "`B ... A`",
        "Arada 0, 1 veya daha fazla eleman olabilir"
      ],
      [
        "\"A en başta / en sonda değildir.\"",
        "`1 ≠ A` / `5 ≠ A`",
        "Blokların başa veya sona kaymasını belirler"
      ],
      [
        "\"A ile B arasında yalnız 1 kişi var.\"",
        "`[A - _ - B]` veya `[B - _ - A]`",
        "İki yönlü olasılığı da kontrol et"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Boy Sıralaması): Ali, Banu, Cem, Deniz ve Elif''in boylarıyla ilgili şunlar bilinmektedir: - Cem en uzun kişidir. - Ali, Elif''ten kısa, Banu''dan uzundur. - Banu, Deniz''den uzundur. **Soru:** Buna göre en kısa kişi kimdir? **Adım Adım Çözüm:** 1. En uzun kişi kesindir: `Cem > _ > _ > _ > _` 2. İkinci öncül sırayı verir: `Elif > Ali > Banu` 3. Üçüncü öncül `Banu > Deniz` der; bunu zincire eklediğimizde tek ve kesin sıralama oluşur: **Cem > Elif > Ali > Banu > Deniz**. 4. Dolayısıyla en kısa kişi kesinlikle **Deniz**dir (Banu''yu en kısa sanmak **yanlıştır**). Özgün Çözümlü Soru 2 (Raftaki Kitaplar): Bir rafta soldan sağa 1''den 5''e kadar dizilen Bilim, Roman, Sözlük, Şiir ve Tarih kitapları hakkında: - Bilim 4., Sözlük ise 5. sıradadır. - Roman, Şiir''in hemen solundadır. - Tarih en solda (1. sırada) değildir. **Soru:** Buna göre soldan üçüncü kitap hangisidir? **Adım Adım Çözüm:** 1. Kesin yerleri yazalım: `1(_) - 2(_) - 3(_) - 4(Bilim) - 5(Sözlük)`. 2. `[Roman - Şiir]` bitişik bir bloktur ve 1-2 veya 2-3 konumuna yerleşebilir. 3. Tarih 1. sırada olamayacağı için blok 2-3''e konarsa 1. sıra Tarih''e kalır ve kural bozulur! Bu nedenle `[Roman - Şiir]` bloğu mecburen **1 ve 2. sıraya** yerleşir; 3. sıraya ise **Tarih** gelir. 4. Kesin sıra: **1: Roman, 2: Şiir, 3: Tarih, 4: Bilim, 5: Sözlük**. Soldan üçüncü kitap **Tarih**tir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sıralama sorularında iki klasik tuzağa dikkat et: 1. \"Hemen önce / hemen sonra\" ile \"önce / sonra\" ifadelerini aynı sanmak: Araya eleman girip giremeyeceği bütün olasılıkları değiştirir. 2. İki olasılık varken yalnızca ilk aklına gelen dizilişi deneyip cevabı işaretlemek: Örneğin Ada 2. veya 3. odada olabiliyorsa iki ihtimali de son koşula kadar test et; Defne > Cem gibi bir son koşul 3. oda ihtimalini eleyip tek doğru cevabı bırakabilir."
  },
  {
    "type": "key_points",
    "items": [
      "Sıralama sorularında mutlaka numaralı yuvalar veya `>` işaretiyle görsel şema çiz.",
      "Bitişik ögeleri `[A - B]` bloğu içine alarak tek parça gibi hareket ettir.",
      "Olumsuz öncüller (\"en solda değil\") blokların hangi uca yaslanacağını belirler.",
      "İki ihtimal ortaya çıkarsa iki satır açıp son öncülle eleme yap."
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
  'turkce.sozel_mantik_ve_muhakeme.02',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  2,
  'Bölüm 2: Tablo Oluşturma ve Çok Boyutlu Eşleştirme (Gün, Kişi, Etkinlik)',
  'Birden fazla değişkenin (örneğin kişi + gün + şehir, ya da kişi + oda numarası + meslek) eşleştirildiği sorularda düz çizgi yetmez; mutlaka iki boyutlu tablo kurmalısın.  Tabloyu kurarken sabit ve sıralı olan boyutu (günler: Pazartesi, Salı, Çarşamba veya numaralar: 1, 2, 3, 4) sütun başlığına yazmak her zaman en düzenli çözümü verir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Birden fazla değişkenin (örneğin kişi + gün + şehir, ya da kişi + oda numarası + meslek) eşleştirildiği sorularda düz çizgi yetmez; mutlaka **iki boyutlu tablo** kurmalısın. Tabloyu kurarken sabit ve sıralı olan boyutu (günler: *Pazartesi, Salı, Çarşamba* veya numaralar: *1, 2, 3, 4*) **sütun başlığına** yazmak her zaman en düzenli çözümü verir. Ardından kişileri ve diğer özellikleri satırlara yerleştirir, olumsuz bilgileri (\"Ayşe Salı değildir\") ilgili hücrenin altına `≠` veya çarpı işaretiyle not edersin."
  },
  {
    "type": "paragraph",
    "text": "Çok boyutlu eşleştirmede en önemli strateji **eleme ve zorunlu bırakma**dır. Bazen bir kişi hakkında doğrudan gün bilgisi verilmez; fakat diğer kişilerin yasaklı günleri birleştiğinde o kişiye tek bir boş gün kalır. Özellikle oda numarası veya sıralı gün sorularında \"X, Y''den büyük numaralıdır\" gibi büyüklük koşulları, olasılık dallarından birini tek hamlede çökertir."
  },
  {
    "type": "table",
    "headers": [
      "Tablo Kurma Adımı",
      "Uygulama",
      "Amaç"
    ],
    "rows": [
      [
        "1. Sabit Eksen",
        "Günleri veya oda numaralarını sütun yap",
        "Sıra ve büyüklük ilişkilerini görsel tutar"
      ],
      [
        "2. Kesin Kayıtlar",
        "Kesin eşleşmeleri tabloya direkt yaz",
        "Boş hücre sayısını azaltır"
      ],
      [
        "3. Yasaklı Notlar",
        "\"Salı değil\" bilgisini hücre altına `(-)` yaz",
        "Zorunlu kalan tek hücreyi görmeyi sağlar"
      ],
      [
        "4. Koşul Kontrolü",
        "Kalan adayları `< / >` şartıyla test et",
        "Çelişen olasılığı eler"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Sözel mantık tablolarını çözerken **Ş-K-E-D** dörtlüsünü izle: - **Ş**ema veya tablo kur (zihinden çözme) - **K**esin bilgileri yerleştir - **E**leme/olumsuz koşulları hücrelere işle - **D**allanan olasılıkları son öncülle doğrula"
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Nöbet Tablosu): Ayşe, Burak ve Can adlı üç çalışan Pazartesi, Salı ve Çarşamba günleri birer gün nöbet tutacaktır. Bilinenler: - Ayşe Salı günü nöbet tutmamaktadır. - Burak, Ayşe''den önceki bir günde nöbet tutmaktadır. - Can Pazartesi günü nöbet tutmamaktadır. **Soru:** Buna göre Burak hangi gün nöbet tutmaktadır? **Adım Adım Çözüm:** 1. Günleri yazalım: `Pazartesi | Salı | Çarşamba`. 2. Burak, Ayşe''den önceyse Ayşe **Pazartesi** olamaz. İlk öncüle göre Ayşe **Salı** da değildir. O halde Ayşe''ye kalan tek gün **Çarşamba**dır! 3. Kalan günler Pazartesi ve Salı''dır. Can Pazartesi olamayacağına göre Can **Salı**, Burak ise mecburen **Pazartesi** nöbet tutar. 4. Sağlama: Burak (Pzt) < Ayşe (Çar), Ayşe ≠ Salı, Can (Salı) ≠ Pzt. Tüm şartlar sağlandı; cevap **Pazartesi**dir. Özgün Çözümlü Soru 2 (Oda Yerleşimi): Ada, Barış, Cem ve Defne 1''den 4''e kadar numaralı dört odada kalmaktadır: - Ada 2. ya da 3. odadadır. - Barış, Ada''dan bir küçük numaralı odadadır (`Barış = Ada - 1`). - Defne''nin oda numarası Cem''inkinden büyüktür (`Defne > Cem`). - Cem 1. odada değildir (`Cem ≠ 1`). **Soru:** Buna göre Barış hangi odadadır? **Adım Adım Çözüm:** 1. *1. İhtimal (Ada = 3):* Bu durumda Barış = 2 olur. Geriye 1 ve 4 numaralı odalar kalır. `Defne > Cem` şartı gereği Cem = 1, Defne = 4 olmalıdır; ancak son öncüle göre `Cem ≠ 1` olduğundan bu ihtimal **çöker** ve elenir. 2. *2. İhtimal (Ada = 2):* Bu durumda Barış = 1 olur. Geriye 3 ve 4 numaralı odalar kalır. `Defne > Cem` şartı gereği Cem = 3, Defne = 4 olur ve `Cem ≠ 1` koşulu da sağlanır. 3. Kesin yerleşim: **1: Barış, 2: Ada, 3: Cem, 4: Defne**. Dolayısıyla Barış kesinlikle **1. odadadır**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Tablo sorularında iki hataya dikkat et: 1. \"Burak, Ayşe''den önceki bir günde\" ifadesini görünce Burak''ın Salı, Ayşe''nin Çarşamba olabileceğini varsayıp Pazartesi ihtimalini atlamak: Oysa Can''ın Pazartesi olamaması Burak''ı otomatik olarak Pazartesi''ye iter. 2. Tüm olasılıkları yazdıktan sonra son öncülle sağlama yapmamak: Her zaman bulduğun tabloyu baştan sona tüm öncüllerle tek tek kontrol et."
  },
  {
    "type": "key_points",
    "items": [
      "Sabit ve sıralı değişkenleri (gün, saat, kat, oda no) daima tablonun sütun başlığına koy.",
      "Olumsuz öncülleri (`X, Salı değil`) hücrelerin altına not ederek daralan seçenekleri gör.",
      "İki ihtimal kaldığında her iki durumu ayrı satırlarda yürüt ve kısıtlarla çelişeni ele."
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
  'turkce.sozel_mantik_ve_muhakeme.03',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  3,
  'Bölüm 3: Doğruluk-Yalan, Koşul Zinciri ve Küme/Çıkarım Muhakemesi',
  'KPSS sözel mantık sorularının bir diğer grubu tablo kurmaktan çok mantıksal çıkarım gerektirir.  Bunlar üçe ayrılır: 1.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS sözel mantık sorularının bir diğer grubu tablo kurmaktan çok **mantıksal çıkarım** gerektirir. Bunlar üçe ayrılır: 1. **Doğruluk-Yalan Soruları:** Genellikle 3 veya 4 kişinin söylediği ifadelerden \"yalnızca birinin doğru (veya yanlış) söylediği\" belirtilir. Çözüm yöntemi **varsayım testidir**: Sırayla \"Ahmet doğru söylüyor olsun\" deyip diğerlerinin ifadeleriyle çelişip çelişmediğine bakarsın; toplam doğru sayısı verilen sayıyı tutmazsa o varsayım çöker ve bir sonraki kişiye geçersin. 2. **Koşul Zinciri (`P -> Q`):** \"Matematikte başarılı olan herkes Fen''de de başarılıdır\" cümlesi **tek yönlü** bir koşuldur (`Mat -> Fen`). Bu kuraldan çıkacak **kesin sonuç** şudur (karşıt-ters kuralı): **Fen''de başarısız olan biri Matematikte kesinlikle başarısızdır** (`Fen değil -> Mat değil`). Buna karşılık \"Fen''de başarılı olan herkes Matematikte başarılıdır\" diyemezsin! 3. **Küme (Kıyas) Çıkarımları:** \"Bütün doktorlar mezundur. Bazı mezunlar yazardır.\" ifadelerinde iki küme arasındaki kesişim yalnızca ortak olan alanı garanti eder: `\"Bazı mezunlar yazardır\"` demek **kesinlikle \"Bazı yazarlar mezundur\"** demektir; fakat doktorlarla yazarların kesişip kesişmediği **bilinmez** (kesin değildir)."
  },
  {
    "type": "table",
    "headers": [
      "Mantık Kuralı",
      "Geçerli Kesin Çıkarım",
      "Geçersiz (Tuzak) Çıkarım"
    ],
    "rows": [
      [
        "`Eğer P ise Q` (`P -> Q`)",
        "`Q` yoksa `P` de **yoktur**",
        "`Q` varsa `P` de vardır (Yanlış! Tek yönlüdür)"
      ],
      [
        "`Bütün A''lar B''dir`",
        "`B` olmayan `A` değildir",
        "`B` olan her şey `A`dır (Yanlış!)"
      ],
      [
        "`Bazı A''lar B''dir`",
        "`Bazı B''ler A''dır`",
        "`Bazı A''lar B değildir` (Kesin değil; hepsi de olabilir!)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Doğruluk-Yalan): Bir ofisin anahtarını Ahmet, Berna veya Cem''den biri almıştır. Üçünün söyledikleri şöyledir: - Ahmet: \"Anahtarı Berna aldı.\" - Berna: \"Anahtarı ben almadım.\" - Cem: \"Anahtarı ben almadım.\" Bu üç kişiden **yalnızca biri doğru** söylediğine göre anahtarı kim almıştır? **Adım Adım Çözüm:** 1. *Ahmet aldıysa:* Ahmet \"Berna aldı\" dediği için **Yanlış**, Berna \"Ben almadım\" dediği için **Doğru**, Cem \"Ben almadım\" dediği için **Doğru** olur → 2 doğru çıkar, kurala aykırıdır (elendi). 2. *Berna aldıysa:* Ahmet \"Berna aldı\" dediği için **Doğru**, Berna \"Ben almadım\" dediği için **Yanlış**, Cem \"Ben almadım\" dediği için **Doğru** olur → 2 doğru çıkar, kurala aykırıdır (elendi). 3. *Cem aldıysa:* Ahmet \"Berna aldı\" dediği için **Yanlış**, Berna \"Ben almadım\" dediği için **Doğru**, Cem \"Ben almadım\" dediği için **Yanlış** olur → **Yalnızca 1 doğru (Berna)** çıkar! 4. Tüm şartlar tek bir noktada tutar: Anahtarı kesinlikle **Cem** almıştır. Özgün Çözümlü Soru 2 (Koşul Çıkarımı): \"Hafta sonu kütüphaneye giden her öğrenci mutlaka tarih notlarını da yanına alır.\" bilgisi verilmiştir. **Kesin Çıkarım:** Kerem bugün tarih notlarını yanına **almamışsa**, Kerem bugün hafta sonu kütüphaneye **gitmemiştir** (`Q değil -> P değil`). Buna karşılık \"Deniz bugün tarih notlarını yanına aldığına göre hafta sonu kütüphaneye gitmiştir.\" yargısı **kesin değildir** (evde çalışmak için de almış olabilir). Özgün Çözümlü Soru 3 (Küme / Kıyas Çıkarımı): \"Bütün doktorlar üniversite mezunudur. Bazı üniversite mezunları yazardır.\" bilgileri verilmiştir. **Adım Adım Çözüm:** 1. Doktorlar kümesi, üniversite mezunları kümesinin tamamen içindedir. 2. Yazarlar kümesi ise mezunlar kümesiyle kesişmektedir; ancak bu kesişim doktorlar kümesinin içinde de olabilir, tamamen dışında da kalabilir. 3. Bu nedenle *\"Bazı doktorlar yazardır.\"* veya *\"Hiçbir doktor yazar değildir.\"* yargıları **kesin değildir**; kesin olan tek çıkarım **\"Bazı yazarlar üniversite mezunudur.\"** yargısıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Çıkarım sorularında iki tuzağa dikkat et: 1. Koşul ifadelerini çift yönlü sanmak: `\"Matematikte başarılı olan Fen''de de başarılıdır\"` cümlesi `\"Fen''de başarılı olan Matematikte de başarılıdır\"` anlamına **gelmez**; yalnızca Fen''den kalanın Matematikten de kaldığını kesinleştirir. 2. Küme sorularında `\"Bazı mezunlar yazardır\"` ile `\"Bütün doktorlar mezundur\"` bilgisini birleştirip `\"Bazı doktorlar yazardır\"` sonucunu çıkarmak yanlıştır; doktor kümesi mezun kümesinin içinde ama yazar kümesinin tamamen dışında kalabilir."
  },
  {
    "type": "key_points",
    "items": [
      "Doğruluk-yalan sorularında her kişiyi tek tek \"doğru\" veya \"alan kişi\" varsayarak çelişki testi yap.",
      "`P -> Q` koşulunun tek kesin eşdeğeri **\"Q yoksa P de yoktur\"** (`~Q -> ~P`) çıkarımıdır.",
      "\"Bazı A''lar B''dir\" ifadesinin tek kesin dönüşümü \"Bazı B''ler A''dır\" şeklindedir."
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
  'turkce.sozel_mantik_ve_muhakeme.04',
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  4,
  'Bölüm 4: Gün-Tarih Hesaplama ve Sayısal-Sözel Denklem Muhakemesi',
  'Sözel mantık bölümünde zaman zaman takvim (gün sayma) ve basit tek bilinmeyenli sözel denklem soruları da yer alır.  Gün ve tarih hesaplama sorularında temel mantık `mod 7` (yedişer gün ilerleme) kuralıdır: Bir haftada 7 gün bulunduğu için, elindeki tarihin üzerine 7 ve 7''nin katlarını (`+7, +14, +21, +28`) eklediğinde her zaman aynı güne ulaşırsın.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Sözel mantık bölümünde zaman zaman takvim (gün sayma) ve basit tek bilinmeyenli sözel denklem soruları da yer alır. **Gün ve tarih hesaplama** sorularında temel mantık `mod 7` (yedişer gün ilerleme) kuralıdır: Bir haftada 7 gün bulunduğu için, elindeki tarihin üzerine 7 ve 7''nin katlarını (`+7, +14, +21, +28`) eklediğinde **her zaman aynı güne** ulaşırsın. Günleri tek tek parmakla saymak yerine hedef tarihe en yakın 7 katını sıçramak hem çok hızlıdır hem de sayma hatasını önler."
  },
  {
    "type": "paragraph",
    "text": "**Sözel denklem muhakemesinde** ise kişiler arasındaki yaş, boy veya miktar ilişkilerini kurarken sorulan kişiyi değil, **en küçük veya en çok bağlantı kurulan kişiyi** `x` olarak seçmek denklemi en sade hale getirir. Tüm verileri `x` cinsinden yazıp toplama veya fark denklemine dönüştürdüğünde hata payı kalmaz; `x`''i bulduktan sonra ise soru kökünün `x`''i mi yoksa `x + 4`''ü mü sorduğunu mutlaka kontrol etmelisin."
  },
  {
    "type": "paragraph",
    "text": "Aynı biçimde **gün hesaplama** sorularında ayın kaç gün çektiği bilgisi verilmişse ay sonu geçişlerine dikkat etmelisin (örneğin 30 gün çeken bir ayda 26''sından 6 gün sonraya geçerken `26 + 4 = 30`, kalan 2 gün yeni ayın 2''si olur). Haftanın günleri sürekli 7 günde bir devrettiği için, geçmişe doğru giderken de `-7, -14, -21` çıkararak aynı güne dönebilirsin; örneğin ayın 29''u Pazartesi ise 7 çıkararak `22, 15, 8, 1`''in de Pazartesi olduğunu anında görebilirsin. Sözlü olarak verilen yaş-fark ilişkilerinde ise kişilerin yaş farkının yıllar geçse de **hiç değişmediğini** aklında tutman gerekir; örneğin iki kardeşin yaşları toplamı her yıl 2 artarken farkları hep aynı kalır."
  },
  {
    "type": "table",
    "headers": [
      "Soru Türü",
      "Hızlı Yöntem",
      "Dikkat Edilecek Nokta"
    ],
    "rows": [
      [
        "Gün / Tarih Sayma",
        "Başlangıç gününe `+7, +14, +21, +28` ekle",
        "Hedef güne en yakın katı bul, kalanı tek tek say"
      ],
      [
        "Yaş / Miktar İlişkisi",
        "Referans kişiye `x` de, diğerlerini `x` ile yaz",
        "`x` bulunduktan sonra sorulan kişiyi hesapla"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Özgün Çözümlü Soru 1 (Gün Hesaplama): Bir ayın **5''i Cuma** ise aynı ayın **29''u** hangi gündür? **Adım Adım Çözüm:** 1. 5''i Cuma olduğuna göre üzerine 7''nin katlarını ekleyelim: `5 + 7 = 12` (Cuma), `12 + 7 = 19` (Cuma), `19 + 7 = 26` (Cuma). 2. 26 Cuma ise kalan 3 günü ilerletelim: `27` Cumartesi, `28` Pazar, **`29` Pazartesi**dir. 3. Sağlama: `(29 - 5) = 24` gün; `24 / 7 = 3` hafta + `3` gün kalan. Cuma + 3 gün = **Pazartesi** (Cumartesi/Salı işaretlemek **yanlıştır**). Özgün Çözümlü Soru 2 (Sözel Denklem): Ece, Sena''dan 1 yaş büyük; Sena da Mert''ten 3 yaş büyüktür. Üçünün yaşları toplamı **49** olduğuna göre **Ece** kaç yaşındadır? **Adım Adım Çözüm:** 1. En küçük olan Mert''e `x` diyelim: `Mert = x`. 2. Sena Mert''ten 3 yaş büyükse `Sena = x + 3`. 3. Ece Sena''dan 1 yaş büyükse `Ece = (x + 3) + 1 = x + 4`. 4. Toplamları: `x + (x + 3) + (x + 4) = 3x + 7 = 49` → `3x = 42` → `x = 14` (Mert''in yaşı). 5. Soru **Ece**''yi sorduğu için `Ece = 14 + 4 = 18` yaşındadır (14''ü işaretlemek **yanlıştır**)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Gün ve denklem sorularında iki yaygın hata görülür: 1. Gün sayarken başlangıç gününü (`5`i) sıfır yerine bir sayarak `29 - 5 + 1 = 25` günü `7`''ye bölmek: İki tarih arasındaki gün farkı daima **çıkarma** (`29 - 5 = 24`) ile bulunur; `+1` eklenmez! 2. Denklemde `x` değerini bulur bulmaz şıklarda `x`''i işaretlemek: ÖSYM genellikle referans olan `x`''i de (örneğin `14`) en güçlü çeldirici olarak seçeneklere koyar."
  },
  {
    "type": "key_points",
    "items": [
      "Aynı güne dönmek için tarihe 7 ve katlarını ekle; iki tarih arası fark için çıkarma yap (`+1` ekleme).",
      "Sözel yaş/miktar denklemlerinde en küçük ya da temel kişiye `x` de.",
      "`x` bulunduğunda soru kökünün hangi kişiyi sorduğunu tekrar kontrol et."
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
