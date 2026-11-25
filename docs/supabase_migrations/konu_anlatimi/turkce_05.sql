-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Türkçe · Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)
-- Kaynak: docs/konu_anlatimi/turkce/05_sozcuk_turleri.md
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.01',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  1,
  'Bölüm 1: İsim (Ad) ve Sıfat (Ön Ad) Türleri',
  'Türkçede sözcüklerin türünü belirlerken tek bir kural vardır: Sözcüğün sözlükte hangi türde göründüğüne değil, cümlede hangi görevi üstlendiğine bakılır.  Varlıkları, kavramları ve duyguları karşılayan sözcüklere isim (ad) denir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türkçede sözcüklerin türünü belirlerken tek bir kural vardır: Sözcüğün sözlükte hangi türde göründüğüne değil, **cümlede hangi görevi üstlendiğine** bakılır. Varlıkları, kavramları ve duyguları karşılayan sözcüklere **isim (ad)** denir. İsimler verilişlerine göre *özel/cins*, varlıkların oluşlarına göre *somut/soyut*, sayılarına göre ise *tekil, çoğul ve topluluk ismi* (`ordu, sürü, meclis`) olarak ayrılır. İsimlerin birbirleriyle iyelik ve tamlayan ekleri aracılığıyla kurduğu öbeklere **isim tamlaması** denir: Her iki ögesi de ek alan **belirtili isim tamlaması** (*kapının kolu*), yalnız tamlananın ek aldığı **belirtisiz isim tamlaması** (*okul bahçesi*) ve en az üç ismin iç içe geçtiği **zincirleme isim tamlaması** (*okul bahçesinin kapısı*)."
  },
  {
    "type": "paragraph",
    "text": "İsimlerin önüne gelerek onları renk, şekil, durum bakımından niteleyen veya işaret, sayı, belgisizlik, soru yoluyla belirten sözcüklere **sıfat (ön ad)** denir. Sıfatlar hiçbir zaman çekim eki almaz; bir sıfatın nitelediği isim düşüp sıfat o ismin çekim ekini alırsa **adlaşmış sıfat** oluşur (örneğin *\"güzel insanları\"* yerine *\"güzelleri\"* demek). Sıfat konusundaki tartışmalı noktalardan biri adlaşmış sıfatın türüdür: Bazı dil bilimciler bunları sıfat başlığı altında işlese de **ÖSYM''nin yerleşik yaklaşımı adlaşmış sıfatı sözcük türü bakımından isim (ad) kabul etmektir**. Aynı biçimde sıfat tamlamalarıyla takısız isim tamlamaları da dil bilgisinde tartışmalıdır; ÖSYM genellikle *\"altın yüzük, taş duvar\"* gibi yapıları madde/ham madde ilişkisi kursa bile **sıfat tamlaması** olarak değerlendirmeye yatkındır."
  },
  {
    "type": "paragraph",
    "text": "Sıfatların isim tamlamalarıyla kurduğu ilişkiye de dikkat etmelisin: Bir isim tamlamasında tamlayan, tamlanan veya tamlamanın bütünü bir sıfat tarafından nitelenebilir (*eski okulun bahçesi*, *okulun büyük bahçesi*). Ayrıca \"bir\" sözcüğü sayı anlamında kullanıldığında **asıl sayı sıfatı** (*Bir gün daha bekledik*), \"herhangi bir\" anlamında kullanıldığında ise **belgisiz sıfat** (*Bir gün elbet görüşürüz*) olur."
  },
  {
    "type": "paragraph",
    "text": "Sıfatlarda **pekiştirme** ve **küçültme** de sıkça sorulur: `m, p, r, s` harfleriyle yapılan pekiştirmeler (*masmavi gökyüzü*) veya ikilemeler (*sıcak sıcak ekmekler*) bir ismin önünde kullanıldığında **pekiştirme sıfatı** olur; `-cik, -ce, -(ı)msı, -(ı)mtrak` ekleriyle kurulan yapılar (*küçücük oda*, *ekşimsi elma*, *mavimtırak gömlek*) ise **küçültme sıfatı** sayılır. Ayrıca sıfatların yapıları bakımından da basit (*yeşil ev*), türemiş (*çalışkan öğrenci*) ve birleşik (*vurdumduymaz tavır*, *açıkgöz esnaf*) olarak üçe ayrıldığını unutma. Bir cümlede sıfat varsa orada mutlaka **sıfat tamlaması** da vardır."
  },
  {
    "type": "table",
    "headers": [
      "Sıfat Türü",
      "Sorduğu Soru / İşlevi",
      "Örnek"
    ],
    "rows": [
      [
        "Niteleme Sıfatı",
        "İsme sorulan **\"Nasıl?\"** sorusuna yanıt verir",
        "**kırmızı** kalem, **çalışkan** öğrenci"
      ],
      [
        "İşaret Sıfatı",
        "İsmi işaret yoluyla belirtir (\"Hangi?\")",
        "**bu** kitap, **şu** masa, **o** çocuk"
      ],
      [
        "Sayı Sıfatı",
        "Asıl, sıra, üleştirme, kesir sayısı bildirir",
        "**üç** elma, **beşinci** kat, **ikişer** kalem"
      ],
      [
        "Belgisiz Sıfat",
        "İsmi kesin olmayan miktarla belirtir",
        "**birkaç** gün, **bazı** insanlar, **hiçbir** sorun"
      ],
      [
        "Soru Sıfatı",
        "İsmi soru yoluyla belirtir (yanıtı da sıfattır)",
        "**hangi** yol, **kaç** kişi, **nasıl** bir ev"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Sıfat ve adlaşmış sıfat ayrımı: \"**Güzel** bir şarkıydı.\" cümlesinde \"güzel\" sözcüğü \"şarkı\" adını nitelediği için **niteleme sıfatı**dır; ek-fiilin yükleme gelmesi (\"şarkıydı\") \"güzel\" sözcüğünü ad yapmaz. Buna karşılık \"**Güzeli** her zaman takdir ederiz.\" cümlesinde \"güzel\" sözcüğü önündeki adı (örneğin *eseri, insanı*) düşürüp belirtme hâl ekini (`-i`) aldığı için **adlaşmış sıfat**, yani sözcük türü bakımından **ad (isim)** görevindedir (**doğru**). Yine \"Sınavda **üç** soruyu boş bıraktım.\" cümlesindeki *üç* **sayı sıfatı**, \"Sınavda **birkaç** soruyu boş bıraktım.\" cümlesindeki *birkaç* ise kesin sayı vermediği için **belgisiz sıfat**tır (*birkaç*ı sayı sıfatı saymak **yanlıştır**)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İsim ve sıfat sorularında iki ayrıma dikkat et: 1. **Belgisiz sıfat** ile **sayı sıfatı** karıştırılır: *Üç* kesin sayı sıfatıdır, *birkaç* ise kesinlik bildirmediği için **belgisiz sıfat**tır. 2. Niteleme sıfatında `\"Nasıl?\"` sorusu **isme** sorulur; aynı soru **fiile** sorulursa alınan yanıt sıfat değil **durum zarfı** olur (*hızlı araba* = sıfat; *hızlı koştu* = zarf)."
  },
  {
    "type": "key_points",
    "items": [
      "Sözcük türü tek başına kelimeye bakılarak değil, cümle içindeki görevine göre belirlenir.",
      "Sıfatlar mutlaka bir isimden önce gelir ve çekim eki almaz; çekim eki alıp ismin yerini tutarsa **adlaşmış sıfat (isim)** olur.",
      "Adlaşmış sıfatlar ÖSYM yaklaşımında isim sayılır.",
      "Belgisiz sıfatlarda sayı veya miktar kesin değildir (`birkaç, kimi, her, bazı`)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "03baf5e8-df83-435c-94b0-88ae2d1fc300",
      "1a42555f-29ce-4f73-bae2-7462c4d7a4e2"
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.02',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  2,
  'Bölüm 2: Zamir (Adıl) ve Zarf (Belirteç) Türleri',
  'İsimlerin yerini geçici olarak tutan ve isimler gibi çekim eki alabilen sözcüklere zamir (adıl) denir.  Sözcük halindeki zamirler beşe ayrılır: kişi zamirleri (ben, sen, o, biz, siz, onlar ve dönüşlülük zamiri kendi), işaret zamirleri (bu, şu, o, bunlar, öteki), belgisiz zamirler (biri, herkes, kimse, bazıları, çoğu, şey), soru zamirleri (kim, ne, hangisi, kaçı).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İsimlerin yerini geçici olarak tutan ve isimler gibi çekim eki alabilen sözcüklere **zamir (adıl)** denir. Sözcük halindeki zamirler beşe ayrılır: **kişi zamirleri** (*ben, sen, o, biz, siz, onlar* ve dönüşlülük zamiri *kendi*), **işaret zamirleri** (*bu, şu, o, bunlar, öteki*), **belgisiz zamirler** (*biri, herkes, kimse, bazıları, çoğu, şey*), **soru zamirleri** (*kim, ne, hangisi, kaçı*). Ek halindeki zamirler ise **iyelik ekleri** ile tamlananın yerini tutan **ilgi zamiri `-ki`**dir (*Seninki geldi = Senin kalemin geldi*). Zamirle sıfat arasındaki temel fark şudur: İşaret, belgisizlik veya soru bildiren sözcük bir ismin önündeyse **sıfat**, ismin yerini tek başına tutuyorsa **zamir**dir."
  },
  {
    "type": "paragraph",
    "text": "Fiillerin, fiilimsilerin, sıfatların ve kendi türünden zarfların anlamını durum, zaman, yer-yön, miktar veya soru bakımından sınırlayan sözcüklere ise **zarf (belirteç)** denir. Zarflar da tıpkı sıfatlar gibi çekim eki almaz; özellikle **yer-yön zarfları** (*ileri, geri, içeri, dışarı, aşağı, yukarı*) yalın halde fiili etkilerken zarftır, `-e/-de/-den` gibi hâl eki aldıkları anda **isim** olurlar."
  },
  {
    "type": "paragraph",
    "text": "Soru zamiri, soru sıfatı ve soru zarfını birbirinden ayırmanın en kolay yolu soruya kısa ve mantıklı bir **yanıt vermektir**. Verdiğin yanıt isim ya da zamirse soru sözcüğü **soru zamiri** (*Kim geldi? -> Ali*), yanıt sıfatsa **soru sıfatı** (*Hangi kitabı okudun? -> Bu kitabı*), yanıt zarfsa **soru zarfı**dır (*Neden sustun? -> Yorulduğum için*). Aynı şekilde miktar zarfı olan *en, daha, çok, pek* sözcükleri sıfatları veya diğer zarfları derecelendirerek cümlede üstünlük anlamı kurar (*en güzel çiçek*, *daha hızlı koştu*)."
  },
  {
    "type": "table",
    "headers": [
      "Aynı Sözcüğün Görev Değişimi",
      "Sıfat Görevi",
      "Zamir veya Zarf Görevi"
    ],
    "rows": [
      [
        "**O**",
        "**O** çocuk dün erken geldi. (İşaret sıfatı)",
        "**O**, dün erken geldi. (Kişi zamiri) / **O**nu masaya bırak. (İşaret zamiri)"
      ],
      [
        "**Hızlı**",
        "**Hızlı** araba virajı döndü. (Niteleme sıfatı)",
        "Sporcu çok **hızlı** koştu. (Durum zarfı)"
      ],
      [
        "**Çok**",
        "Sınavda **çok** soru vardı. (Belgisiz sıfat)",
        "Bu kitabı **çok** beğendim. (Miktar zarfı) / **Çoğu** gitti. (Belgisiz zamir)"
      ],
      [
        "**İçeri**",
        "**İçeri** oda serinmiş. (Sıfat)",
        "Misafirleri **içeri** aldık. (Yer-yön zarfı) / **İçeriye** girdik. (İsim!)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Zamir ve zarf çözüm örneği: \"Dün **hemen** dışarı çıktı.\" cümlesinde \"hemen\" sözcüğü \"Ne kadar?\" sorusuna değil **\"Ne zaman?\"** sorusuna yanıt verdiği için miktar zarfı değil **zaman zarfı**dır; buna karşılık \"Projeyi **çok** beğendik.\" cümlesindeki \"çok\" sözcüğü \"Ne kadar?\" sorusuna yanıt veren **miktar (azlık-çokluk) zarfı**dır (**doğru**). Yer-yön zarfında ise \"Çocuklar **aşağı** indi.\" cümlesinde \"aşağı\" **zarf** iken, \"Çocuklar **aşağıya** indi.\" cümlesindeki \"aşağıya\" yönelme hâl eki aldığı için artık **isim**dir (bunu zarf saymak **yanlıştır**). Ayrıca \"**O** kitabı masadan al.\" ile \"**O**, sınıfın en çalışkanıdır.\" cümlelerinde ilk \"o\" **işaret sıfatı**, ikincisi ise insan adı yerine geçtiği için **kişi zamiri**dir."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Zarf çeşitlerini **Z-D-M-Y-S** harfleriyle kodlayabilirsin: - **Z**aman zarfı (*Ne zaman?*) - **D**urum zarfı (*Nasıl?*) - **M**iktar zarfı (*Ne kadar?*) - **Y**er-yön zarfı (*Nereye? — ek almamış yalın halde*) - **S**oru zarfı (*Neden, niçin, ne zaman, nasıl?*)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Zamir ve zarf sorularında ÖSYM üç tuzağı sık kullanır: 1. `\"O\"` ve `\"bu\"` sözcüklerini görür görmez zamir sanmak: Önünde bir isim varsa ve o ismi gösteriyorsa (*o kitap*) mutlaka **işaret sıfatı**dır. 2. `\"Ne\"` sözcüğü cümleye göre üç farklı tür olabilir: *Ne gün geleceksin?* (**sıfat**), *Marketten ne aldın?* (**zamir**), *Ne ağlayıp duruyorsun?* (**zarf** — \"niçin\" anlamında). 3. Yer-yön bildiren sözcükler (*içeri, dışarı, ileri, geri*) ancak **ek almadan** kullanıldığında yer-yön zarfıdır; `-e, -de, -den, -i` eklerinden birini alırsa zarf olmaktan çıkar, **isim** olur."
  },
  {
    "type": "key_points",
    "items": [
      "Sıfat isimden önce gelir; zamir ismin yerini tutar; zarf fiili, fiilimsiyi, sıfatı veya başka bir zarfı etkiler.",
      "Yer-yön zarfları ek almaz; ek alırsa isimleşir.",
      "\"Hemen, şimdi, artık\" gibi sözcükler hız değil **zaman** zarfıdır; miktar zarfı yalnızca \"Ne kadar?\" sorusunu yanıtlar.",
      "\"Kendi\" sözcüğü her zaman dönüşlülük zamiridir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "2f07b317-cf7f-403e-9dc6-c209d66cd6e6",
      "341478ee-9c73-4e36-83fc-7d6f9f0c2fc2"
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.03',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  3,
  'Bölüm 3: Edat (İlgeç), Bağlaç ve Ünlem',
  'Tek başlarına anlamları bulunmayan, cümledeki diğer sözcüklerle öbekleşerek anlam ilgisi kuran sözcüklere edat (ilgeç), eş görevli sözcükleri, söz öbeklerini veya cümleleri birbirine bağlayan sözcüklere ise bağlaç denir.  Seslenme, şaşırma, korku, sevinç gibi duyguları anlatan sözcüklere de ünlem adı verilir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Tek başlarına anlamları bulunmayan, cümledeki diğer sözcüklerle öbekleşerek anlam ilgisi kuran sözcüklere **edat (ilgeç)**, eş görevli sözcükleri, söz öbeklerini veya cümleleri birbirine bağlayan sözcüklere ise **bağlaç** denir. Seslenme, şaşırma, korku, sevinç gibi duyguları anlatan sözcüklere de **ünlem** adı verilir. Edat ve bağlaçların ikisi de çekim eki almayan (çekimsiz) görevli sözcüklerdir; ancak edatlar kendisinden önceki sözcükle öbek kurup cümleye *benzerlik, araç, amaç, ölçü, karşılaştırma* anlamları katarken, bağlaçlar yalnızca unsurları birbirine bağlar ve cümleden çıkarıldıklarında cümlenin anlamı daralsa bile yapı bozulmaz."
  },
  {
    "type": "paragraph",
    "text": "Sözcük türü sınıflandırmalarında bazı edatların konumu dil bilimciler arasında tartışmalıdır (örneğin *göre, doğru, karşı, rağmen, dolayı* gibi kendisinden önceki isimde hâl eki isteyen sözcüklerin edat mı yoksa zarf/sıfat öbeği kuran unsurlar mı olduğu zaman zaman tartışılır). Ancak **ÖSYM''nin yerleşik yaklaşımı**, geleneksel Türkçe dil bilgisi doğrultusunda `gibi, için, kadar, sanki, üzere, -e göre, -e doğru, -e karşı, -den dolayı, -den beri, -e rağmen` yapılarını **edat**; `ve, veya, ya da, ama, fakat, lakin, ancak, çünkü, oysa, meğer, ki, de` sözcüklerini ise **bağlaç** kabul etmektir."
  },
  {
    "type": "paragraph",
    "text": "Edatların oluşturduğu öbekler (örneğin *\"buz gibi su\"*, *\"sabaha kadar çalıştı\"*) cümle içinde sıfat veya zarf görevine girebilir; ancak o öbeğin içindeki *gibi, kadar* sözcüklerinin kendi türü yine **edat** olarak kalır. Bağlaçlardan **\"de\"** ve **\"ki\"** ise daima ayrı yazılır ve kendilerinden önceki sözcükten kesme işaretiyle ayrılmaz; buna karşılık durum eki olan `-de` ve sıfat/zamir yapan `-ki` ekleri bitişik yazılır."
  },
  {
    "type": "paragraph",
    "text": "Bağlaçların cümleye kattığı anlam ilgileri de testlerde doğrudan sorulur: `ama, fakat, lakin, oysa, halbuki` cümleler arasında **karşıtlık (karşılaştırma)** ilgisi kurarken; `çünkü, zira` kendinden önceki yargının **gerekçesini** açıklar; `üstelik, hatta, ayrıca` ise anlatımı **pekiştirir**. Ünlemler konusunda ise *ey, hey, vah, ay, of* gibi asıl ünlemlerin yanında, seslenme ya da heyecan bildirerek ünlem değeri kazanan sözcüklerin de (*Dikkat!*, *Komşular!*) cümlede ünlem görevi üstlenebileceğini bilmelisin; ancak bunlar çekim eki aldığında (*ahları, ofları*) artık isim sayılır."
  },
  {
    "type": "paragraph",
    "text": "Soru edatı olan **\"mı / mi / mu / mü\"** daima ayrı yazılır ve cümleye soru anlamı dışında pekiştirme (*Güzel mi güzel bir ev*) veya zaman (*Eve geldi mi bizi arar*) anlamı da katabilir."
  },
  {
    "type": "table",
    "headers": [
      "Çift Görevli Sözcük",
      "Edat Kullanımı",
      "Bağlaç / Sıfat / Zarf Kullanımı"
    ],
    "rows": [
      [
        "**ile**",
        "Kalem **ile** not aldı. (Araç/birliktelik; \"ve\" konamaz)",
        "Kitap **ile** defter aldı. (**Bağlaç**; yerine **\"ve\"** konabilir)"
      ],
      [
        "**yalnız / ancak**",
        "Bu işi **yalnız** sen çözersin. (\"Sadece\" anlamında edat)",
        "Gelirim **yalnız/ancak** erken dönerim. (**Bağlaç**; \"ama\" anlamında)"
      ],
      [
        "**doğru**",
        "Akşama **doğru** hava serinledi. (`-e doğru` edat)",
        "**Doğru** söz (sıfat) / **Doğru** konuş (zarf)"
      ],
      [
        "**gibi / için / kadar**",
        "Buz **gibi** su, senin **için**, dağ **kadar** (Her zaman edat)",
        "—"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Ayırt etme örneği: \"Masada kitap **ile** defter yan yana duruyordu.\" cümlesinde \"ile\" yerine **\"ve\"** koyduğumuzda anlam bozulmadığı için \"ile\" **bağlaç**tır (**doğru**). Buna karşılık \"Sabah tren **ile** Ankara''ya gitti.\" cümlesinde \"tren ve Ankara''ya\" anlamsız olacağı için buradaki \"ile\" araç anlamı katan **edat**tır (bunu bağlaç saymak **yanlıştır**). Yine \"Ödevini bitirdi **ama** dışarı çıkmadı.\" cümlesinde \"ama\" iki cümleyi karşıtlık ilgisiyle bağlayan **bağlaç**tır; \"Su **gibi** berrak, gece **kadar** sessiz, çalışmak **için** geldi, eve **dek** yürüdü\" örneklerindeki *gibi, kadar, için, dek* ise isim ve fiilimsilerle öbek kuran **edat**lardır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Edat ve bağlaç sorularında iki klasik tuzak öne çıkar: 1. `\"Yalnız\"` ve `\"ancak\"` sözcüklerini her yerde aynı tür sanmak: Yerine **\"sadece\"** geliyorsa **edat**, yerine **\"ama / fakat\"** geliyorsa **bağlaç**, bir ismi niteliyorsa (*yalnız adam*) **sıfat**, fiili etkiliyorsa (*yalnız yaşadı*) **zarf**tır. 2. `\"İle\"` sözcüğü bitişik yazıldığında (`kalemle`, `annesiyle`) aday onu sadece ek sanıp edat olduğunu gözden kaçırabilir; oysa yerine **\"ve\"** gelmiyorsa o da edattır."
  },
  {
    "type": "key_points",
    "items": [
      "Bağlaçlar sözcükleri veya cümleleri bağlar; edatlar bir sözcükle öbekleşerek yeni anlam ilgisi kurar.",
      "`\"İle\"` yerine `\"ve\"` getirilebiliyorsa bağlaç, getirilemiyorsa edattır.",
      "`\"Yalnız / ancak\"` yerine `\"sadece\"` gelirse edat, `\"ama\"` gelirse bağlaçtır.",
      "Ünlemler çekim eki alırsa isimleşir (*Ahları tuttu*)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "3cd7a125-12de-4774-850a-1fca3e405aa8",
      "483179bb-56e6-4225-be35-83f3a583bf90"
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.04',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  4,
  'Bölüm 4: Fiil (Eylem), Kip, Kişi, Ek-Fiil ve Anlam Kayması',
  'İş, oluş veya durum bildiren, kip ve kişi ekleriyle çekimlenebilen sözcüklere fiil (eylem) denir.  Fiiller anlamlarına göre üç grupta toplanır: Nesne alabilen (okumak, yazmak) iş (kılış) fiilleri, nesne alamayıp öznenin kendi durumunu gösteren (uyumak, gülmek) durum fiilleri ve öznenin iradesi dışında kendiliğinden gerçekleşen değişimi anlatan (sararmak, büyümek, paslanmak) oluş fiilleri.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "İş, oluş veya durum bildiren, kip ve kişi ekleriyle çekimlenebilen sözcüklere **fiil (eylem)** denir. Fiiller anlamlarına göre üç grupta toplanır: Nesne alabilen (*okumak, yazmak*) **iş (kılış) fiilleri**, nesne alamayıp öznenin kendi durumunu gösteren (*uyumak, gülmek*) **durum fiilleri** ve öznenin iradesi dışında kendiliğinden gerçekleşen değişimi anlatan (*sararmak, büyümek, paslanmak*) **oluş fiilleri**. Fiil çekiminde zaman anlamı taşıyan ekler **haber (bildirme) kipleri**dir (`-yor`, `-dı`, `-mış`, `-ecek`, `-r/-ar`); zaman anlamı taşımayıp tasarlama bildirenler ise **dilek kipleri**dir: gereklilik (`-malı`), şart (`-sa/-se`), istek (`-a/-e`) ve emir (eki yoktur)."
  },
  {
    "type": "paragraph",
    "text": "Fiil sisteminde çok sık sorulan iki yapı **ek-fiil (ek eylem)** ve **anlam (kip) kayması**dır. Ek-fiilin (`i-`) iki temel görevi vardır: (1) İsim soylu sözcükleri cümlede yüklem yapmak (*Hava çok güzeldi / Öğrenciyim*), (2) Basit zamanlı fiillere gelerek onları **birleşik zamanlı (çekimli) fiil** yapmak (*geliyordu* = hikâye, *gelmişmiş* = rivayet, *gelirse* = şart). **Anlam (kip) kayması** ise bir kip ekinin kendi zaman veya dilek anlamı dışında başka bir kipin yerine kullanılmasıdır (*Yarın İstanbul''a gidiyorum* cümlesinde şimdiki zaman ekinin gelecek zaman yerine kullanılması)."
  },
  {
    "type": "paragraph",
    "text": "Ek-fiilin geniş zamanı olan `-dır/-dir` eki isimlere geldiğinde çoğu zaman düşebilir (*Bugün hava çok güzel [dir]*); buna rağmen o yüklemde ek-fiilin varlığı kabul edilir. Ayrıca yardımcı fiillerle (*etmek, olmak, kılmak, eylemek*) kurulan birleşik fiillerde, yardımcı fiilin kendi gerçek anlamını yitirip önündeki isimle tek bir eylem oluşturması şarttır; aksi halde o sözcük bağımsız bir asıl fiildir."
  },
  {
    "type": "paragraph",
    "text": "Fiillerin çekimi sırasında dikkat edilmesi gereken bir diğer nokta da **kişi (şahıs) ekleri** ile **iyelik eklerinin** birbirine karıştırılmamasıdır: Kişi ekleri yalnızca fiillere gelerek eylemi kimin yaptığını bildirir (*geldi-m, okudu-k*), iyelik ekleri ise isimlere gelerek varlığın kime ait olduğunu gösterir (*kitab-ım, ev-imiz*). Ayrıca ek-fiilin olumsuzunun **\"değil\"** edatıyla (*Sınav zor değilmiş*), fiillerin olumsuzunun ise `-ma/-me` ekiyle (*gelmedi*) yapıldığını aklında tutmalısın. Birleşik zamanlı fiillerde de üç tür olduğunu unutma: hikâye (`-di` -> *geliyordu*), rivayet (`-miş` -> *geliyormuş*) ve şart (`-se` -> *geliyorsa*)."
  },
  {
    "type": "table",
    "headers": [
      "Kip / Yapı",
      "Ek",
      "Örnek ve Açıklama"
    ],
    "rows": [
      [
        "Haber Kipleri (Zaman var)",
        "`-yor, -dı, -mış, -ecek, -r`",
        "*okuyor, geldi, görmüş, yazacak, koşar*"
      ],
      [
        "Dilek Kipleri (Zaman yok)",
        "`-malı, -sa/-se, -e, emir`",
        "*çalışmalı, ısınırsa, gidelim, bekle*"
      ],
      [
        "Birleşik Zamanlı Fiil",
        "1 kip + ek-fiil (`idi, imiş, ise`)",
        "*kalkardı* (geniş zamanın hikâyesi), *gelecekmiş* (gelecek zamanın rivayeti)"
      ],
      [
        "Ek-Fiil (İsme gelen)",
        "`-di, -miş, -se, -dir`",
        "*Sınav kolaydı. / Bu kitap benimdir.*"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Kip ve ek-fiil ayrımı: \"Hava **ısınırsa** pikniğe gideriz.\" cümlesinde `ısın-` fiili geniş zaman (`-ır`) + şart (`-sa`) almış birleşik zamanlı ve **koşul-şart** anlamlı yapıdır (**doğru**); buna karşılık \"Sabahları erken **kalkardı**.\" cümlesinde `kalk-` fiili geniş zaman (`-ar`) + hikâye (`-dı`) ek-fiilini almıştır ve burada şart kipi **yoktur**, geçmişte tekrarlanan alışkanlık anlatılmaktadır (bunu şart kipi saymak **yanlıştır**). Yardımcı fiillerde ise \"**Ziyaret etmek**\" ifadesindeki *etmek* kendi tekil anlamını yitirip \"ziyaret\" ismiyle kaynaştığı için **yardımcı fiildir**; oysa \"Kitabı masaya **koydu**.\" veya \"Odaya sessizce **girdi**.\" cümlelerindeki fiiller kendi temel anlamlarını koruduğundan yardımcı fiil değildir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Fiil konusunda ÖSYM şu iki noktayı tuzak yapar: 1. **Birleşik zamanlı fiil** ile **birleşik yapılı fiil** birbirine karıştırılır: *Geliyordu* (kip + ek-fiil) **birleşik zamanlı** ama yapıca basit bir fiildir; *gelebildi* ise **birleşik yapılı** ama basit zamanlı bir fiildir! 2. Geçmişte tekrarlanan eylemler (*kalkardı, okurdu*) şart kipi sanılabilir; şart anlamı için mutlaka `-sa/-se` kipi bulunmalıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Haber kipleri zaman bildirir; dilek kiplerinde zaman anlamı yoktur.",
      "Ek-fiil hem isimleri yüklem yapar hem de basit zamanlı fiilleri birleşik zamanlıya çevirir.",
      "Birleşik zaman (2 kip/ek-fiil) ile birleşik yapı (2 sözcük) tamamen farklı kavramlardır.",
      "Anlam kayması cümlede anlatım bozukluğu sayılmaz."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "509ad596-dcbd-427d-9a8d-83283f935fd8",
      "6c155989-a096-4a24-ac5d-3a572063719f"
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
  'turkce.sozcuk_turleri_isim_sifat_zamir_zarf_edat_fiil.05',
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  5,
  'Bölüm 5: Fiilimsiler (Eylemsiler) ve Fiilde Çatı',
  'Fiil kök veya gövdelerine özel yapım ekleri getirilerek türetilen, cümlede isim, sıfat veya zarf görevinde kullanılan, olumsuzları `-ma/-me` ile yapılabilen ancak kip ve kişi eki alamayan sözcüklere fiilimsi (eylemsi) denir.  Fiilimsiler üç gruba ayrılır: İsim-fiil (ad-eylem) ekleri `-ma/-ış/-mak`tır (uyanmak, okumayı, gülüş); sıfat-fiil (ortaç) ekleri `-an, -ası, -mez, -ar, -dik, -ecek, -miş`tir (çalışan insanlar, tanıdık yüz); zarf-fiil (bağ-fiil/ulaç) ekleri ise `-ken, -alı, -asıya, -e...',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Fiil kök veya gövdelerine özel yapım ekleri getirilerek türetilen, cümlede **isim, sıfat veya zarf** görevinde kullanılan, olumsuzları `-ma/-me` ile yapılabilen ancak **kip ve kişi eki alamayan** sözcüklere **fiilimsi (eylemsi)** denir. Fiilimsiler üç gruba ayrılır: **İsim-fiil (ad-eylem)** ekleri `-ma/-ış/-mak`tır (*uyanmak, okumayı, gülüş*); **sıfat-fiil (ortaç)** ekleri `-an, -ası, -mez, -ar, -dik, -ecek, -miş`tir (*çalışan insanlar, tanıdık yüz*); **zarf-fiil (bağ-fiil/ulaç)** ekleri ise `-ken, -alı, -asıya, -e...-e, -arak, -ınca, -ıp, -madan, -dıkça, -r...-maz, -casına`dır (*okuyarak, dönünce, gülüp*)."
  },
  {
    "type": "paragraph",
    "text": "İsim-fiil ve sıfat-fiil eklerini alan bazı sözcükler zamanla fiilimsi özelliğini tamamen kaybederek bir varlığın veya nesnenin **kalıcı adı** haline gelir (*dondurma, sarma, dolma, kazma, ekmek, çakmak, çağlayan*); bu sözcükler `-ma/-me` ile olumsuz yapılamıyorsa artık fiilimsi değil, sıradan birer **isim**dir. Fiilde **çatı** ise yüklemi fiil olan cümlelerde (isim cümlelerinde çatı aranmaz!) fiilin özne ve nesneyle kurduğu ilişkidir: Öznesine göre *etken* (gerçek özne), *edilgen* (`-l/-n` eki + sözde özne), *dönüşlü* (`-l/-n` + işi yapan ve etkilenen aynı özne) ve *işteş* (`-ş` + karşılıklı veya birlikte); nesnesine göre *geçişli* (\"neyi, kimi?\" alır), *geçişsiz* (almaz), *oldurgan* (geçişsizi `-r/-t/-dır` ile geçişli yapma) ve *ettirgen* (geçişliyi `-r/-t/-dır` ile başkasına yaptırma)."
  },
  {
    "type": "paragraph",
    "text": "Fiilimsiler cümlede yan cümlecik kurdukları için bir cümlede kaç fiilimsi varsa kural olarak o kadar yan cümlecik var demektir. Öte yandan çatı sorularında cümlenin anlamına değil mutlaka **yüklemdeki fiilin aldığı çatı ekine ve özne-nesne ilişkisine** bakmalısın; örneğin nesnesi cümlede açıkça yazılmamış olsa bile başına \"onu\" zamirini getirebiliyorsan o fiil yine **geçişli** sayılır (*Dün akşam sabaha kadar [onu] okudum*)."
  },
  {
    "type": "paragraph",
    "text": "Fiilde çatı başlığında sıkça test edilen bir başka ayrıntı da **oldurgan** ile **ettirgen** çatının farkıdır. Bir fiilin `-r, -t, -dır` eklerini almadan önceki kök hâline `\"onu\"` zamirini getir: Eğer ekten önce `\"onu\"` almıyorsa (geçişsizse) ve ek sayesinde geçişli olmuşsa **oldurgan**dır (*uyu-mak -> onu uyut-mak*, *piş-mek -> onu pişir-mek*); eğer ekten önce de `\"onu\"` alıyorsa (zaten geçişliyse) ve ekle birlikte geçişlilik derecesi artmışsa **ettirgen**dir (*oku-mak -> onu okut-mak*, *yaz-mak -> onu yazdır-mak*). İşteş çatılı fiillerde ise eylemin birden fazla özne tarafından **karşılıklı** (*selamlaşmak, yazışmak*) ya da **birlikte** (*uçuşmak, gülüşmek*) yapıldığına dikkat etmelisin."
  },
  {
    "type": "table",
    "headers": [
      "Fiilimsi / Çatı",
      "Ayırt Edici İpucu",
      "Örnek"
    ],
    "rows": [
      [
        "İsim-Fiil",
        "`-ma, -ış, -mak`; cümlede isim gibi ek alabilir",
        "Kitap **okumayı** çok seviyor. (**dondurma** = kalıcı ad, fiilimsi değil!)"
      ],
      [
        "Sıfat-Fiil",
        "`-an, -ası, -mez, -ar, -dik, -ecek, -miş`; ismi niteler",
        "**Çalışan** insanlar başarır. (Adlaşabilir: *Çalışanlar*)"
      ],
      [
        "Zarf-Fiil",
        "Fiile \"Nasıl?\" veya \"Ne zaman?\" sorusunu yanıtlar",
        "Ders **çalışarak** öğrendi. / Eve **dönünce** aradı."
      ],
      [
        "Edilgen vs. Dönüşlü",
        "Edilgen: işi yapan belirsiz (**sözde özne**); Dönüşlü: özne kendi yapar, kendi etkilenir",
        "Camlar **silindi** (edilgen). / Çocuk **süslendi** (dönüşlü)."
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Fiilimsi ve çekimli fiil ayrımı: \"**Çalışan** insanlar mutlaka karşılığını alır.\" cümlesinde \"çalışan\" sözcüğü \"insanlar\" adını nitelediği için **sıfat-fiil**dir (**doğru**); aynı bağlamda \"okuyarak\" ve \"dönünce\" **zarf-fiil**, \"uyanmak\" ve \"okumayı\" ise **isim-fiil**dir. Sıfat-fiil eklerinden `-mez, -ar, -dik, -ecek, -miş` ekleri yüklemde zaman bildirdiğinde fiilimsi değil **çekimli fiil** olur: \"Yarın erkenden **gelecek**.\" cümlesindeki *gelecek* **çekimli fiil**dir (bunu sıfat-fiil saymak **yanlıştır**); \"**Gelecek** yıl sınava girecek.\" cümlesindeki *gelecek* ise \"yıl\" adını nitelediği için **sıfat-fiil**dir. Çatıda ise \"Öğretmen konuyu öğrenciye **anlattırdı**.\" cümlesinde `anlat-` geçişli fiili `-tır` ekini alarak işi başkasına yaptırma anlamı kazandığı için **ettirgen** çatılıdır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Fiilimsi ve çatı sorularında üç kritik tuzağa dikkat et: 1. Kalıcı adları fiilimsi sanmak: *\"Masadaki **dolma** çok lezzetliydi.\"* cümlesinde \"dolmama\" diyemediğimiz için *dolma* fiilimsi değil kalıcı isimdir; ancak *\"Bardağın **dolması** uzun sürdü.\"* cümlesinde olumsuzu (*dolmaması*) yapılabildiği için fiilimsidir. 2. **İsim cümlelerinde çatı aranmaz!** Yüklemi isim veya fiilimsi olan cümlelerde \"edilgen mi etken mi\" diye bakılmaz. 3. Edilgen çatıda işi yapan belli değildir ve özne **sözde özne**dir (*Yol temizlendi*); dönüşlü çatıda ise özne işi hem yapar hem etkilenir (*Annem sevindi*)."
  },
  {
    "type": "key_points",
    "items": [
      "Fiilimsiler fiilden türeyen ama kip-kişi eki almayan sözcüklerdir; olumsuzları `-ma/-me` ile yapılır.",
      "Sıfat-fiil ekleri yüklemde kip eki olarak kullanılırsa fiilimsi sayılmaz.",
      "Kalıcı adlar fiilimsi özelliğini yitirmiş isimlerdir.",
      "Çatı özelliği yalnızca yüklemi **çekimli fiil** olan cümlelerde aranır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "7029870d-a073-4961-9434-5485d400f88f",
      "738ad015-3814-4145-9c2c-3f5c3c3819ef"
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
