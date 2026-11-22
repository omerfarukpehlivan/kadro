-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · Yasama, Yürütme ve Yargı
-- Kaynak: docs/konu_anlatimi/vatandaslik/04_yasama_yurutme_ve_yargi.md
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
  'vatandaslik.yasama_yurutme_ve_yargi.01',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  1,
  'Bölüm 1: Yasama Organı: TBMM''nin Yapısı, Üyeliği ve Dokunulmazlıklar',
  '1982 Anayasası''nın 7.  maddesi uyarınca yasama yetkisi Türk Milleti adına Türkiye Büyük Millet Meclisi''nindir ve bu yetki devredilemez.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın 7. maddesi uyarınca yasama yetkisi Türk Milleti adına Türkiye Büyük Millet Meclisi''nindir ve bu yetki devredilemez. **Anayasa m. 75**''in 2017 anayasa değişikliği ile yenilenmiş hali gereğince TBMM genel oyla seçilen **600 milletvekilinden** oluşur (eski üye sayısı 550 idi) ve milletvekili seçilme yaşı **18**''dir. Meclis''te alınacak tüm toplantı ve karar yeter sayıları bu güncel **600 milletvekili** üzerinden hesaplanır. Milletvekili seçilmek için aday olan kamu görevlilerinden yalnızca **hakim ve savcılar** ile **yüksek yargı organları mensupları ve Silahlı Kuvvetler mensupları (askerler)** seçilemedikleri takdirde eski görevlerine geri dönemezler; çünkü yargı bağımsızlığı ve ordunun siyasetten uzak tutulması ilkesi bu kişilerin siyasete atıldıktan sonra tarafsız konumlarına dönmesine izin vermez. Diğer devlet memurları ise seçilemezlerse eski görevlerine dönebilirler."
  },
  {
    "type": "heading",
    "text": "Milletvekilliğinin Düşmesi ve Kendiliğinden Sona Ermesi"
  },
  {
    "type": "paragraph",
    "text": "Milletvekilleri seçildikleri bölgeyi veya kendilerini seçenleri değil, bütün milleti temsil ederler (milletin temsili ilkesi). Bu nedenle seçmenler milletvekillerine emir veremez ve görev süresi dolmadan vekili geri çağıramaz (emredici vekalet yasağı). Milletvekilliğinin sona erme biçimleri ise sebebine göre farklı hukuki sonuçlar doğurur:"
  },
  {
    "type": "bullets",
    "items": [
      "**Partiden İstifa veya İhraç:** Bir milletvekilinin partisinden istifa etmesi veya ihraç edilmesi milletvekilliğini **düşürmez**; vekil görevine bağımsız olarak devam eder.",
      "**Cumhurbaşkanı Yardımcısı veya Bakan Atanması (m. 106):** 2017 reformuyla getirilen sert kuvvetler ayrılığı gereği, TBMM üyesi olan bir kişi Cumhurbaşkanı yardımcısı veya bakan olarak atandığı anda milletvekilliği **meclis oylamasına gerek kalmaksızın kendiliğinden sona erer**.",
      "**Meclis Kararıyla Düşme (m. 84):** İstifa (Meclis Genel Kurulunca kabulüyle), milletvekilliğiyle bağdaşmayan bir görev veya hizmeti sürdürmekte ısrar etme ya da Meclis çalışmalarına **1 ay içinde izinsiz ve özürsüz toplam 5 birleşim günü** katılmama hallerinde TBMM Genel Kurulu kararıyla vekillik düşer. Kesin hüküm giyme veya kısıtlanma hallerinde ise mahkeme kararının Genel Kurul''a bildirilmesiyle vekillik düşer."
    ]
  },
  {
    "type": "heading",
    "text": "Yasama Sorumsuzluğu ve Yasama Dokunulmazlığı (m. 83)"
  },
  {
    "type": "paragraph",
    "text": "Milletvekillerinin yasama görevlerini yürütme organının ve yargısal baskıların etkisinde kalmadan özgürce yerine getirebilmeleri için Anayasa iki farklı güvence tanımıştır; bu iki güvence hem kapsam hem de kaldırılabilirlik bakımından birbirinden tamamen ayrılır:"
  },
  {
    "type": "table",
    "headers": [
      "Özellik",
      "Yasama Sorumsuzluğu (Kürsü Dokunulmazlığı)",
      "Yasama Dokunulmazlığı"
    ],
    "rows": [
      [
        "Kapsamı",
        "Meclis çalışmalarındaki oy, söz ve düşünceler",
        "Seçimden önce veya sonra suç işlediği ileri sürülen vekil"
      ],
      [
        "Niteliği",
        "**Mutlaktır**; milletvekilliği bitse de devam eder",
        "**Nisbidir**; yalnızca vekillik süresince korur"
      ],
      [
        "Kaldırılması",
        "**Asla kaldırılamaz**",
        "TBMM Genel Kurulu kararıyla **kaldırılabilir**"
      ],
      [
        "İstisnası",
        "Anayasa dışı istisna yoktur (meclis içi disiplin hariç)",
        "Ağır cezayı gerektiren **suçüstü** hali ve Anayasa m. 14 kapsamındaki haller"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 85** uyarınca yasama dokunulmazlığının kaldırılmasına veya milletvekilliğinin (istifa, devamsızlık, bağdaşmayan görev nedeniyle) düşürülmesine Meclisçe karar verilmesi halinde, karar tarihinden itibaren **7 gün** içinde ilgili milletvekili veya bir başka milletvekili Anayasa Mahkemesi''ne iptal başvurusunda bulunabilir. Anayasa Mahkemesi ise bu iptal istemini **15 gün** içinde kesin olarak karara bağlar (**7–15 gün kuralı**). Meclis''in seçimleri yenileme kararı alması veya görev süresinin dolması halinde yeni TBMM göreve başlayıncaya kadar mevcut Meclis''in ve milletvekillerinin yasama sıfatı devam eder."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM dokunulmazlık ve vekillik düşmesi sorularında üç ayrıntıyı sürekli test eder: 1. **Yasama sorumsuzluğu** asla kaldırılamaz ve vekillik bittikten sonra da sürer; **yasama dokunulmazlığı** ise TBMM kararıyla kaldırılabilir. 2. Milletvekili adayı olup seçilemediğinde eski görevine **geri dönemeyen** iki zümre **hakim-savcılar** ve **askerler**dir; memurlar geri dönebilir. 3. Bakan veya Cumhurbaşkanı yardımcısı atanan milletvekilinin vekilliği oylamasız **kendiliğinden** sona erer."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Dokunulmazlığı TBMM tarafından kaldırılan bir milletvekili kaç gün içinde hangi mahkemeye başvurabilir ve mahkeme kaç gün içinde karar verir?\" Cevap: **7 gün** içinde **Anayasa Mahkemesi**ne başvurulur; AYM **15 gün** içinde kesin karar verir."
  },
  {
    "type": "key_points",
    "items": [
      "TBMM üye tamsayısı **600**, milletvekili seçilme yaşı **18**''dir; hakim-savcılar ve askerler aday olup seçilemezlerse görevlerine dönemez.",
      "Partiden istifa vekilliği düşürmez; ancak Cumhurbaşkanı yardımcısı veya bakan atanan kişinin milletvekilliği kendiliğinden sona erer.",
      "Yasama sorumsuzluğu mutlak olup kaldırılamaz; yasama dokunulmazlığı ise kaldırılabilir.",
      "Dokunulmazlık kaldırılması veya vekilliğin düşmesine karşı **7 gün** içinde AYM''ye başvurulur, AYM **15 gün** içinde karar verir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
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
  'vatandaslik.yasama_yurutme_ve_yargi.02',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  2,
  'Bölüm 2: TBMM''nin Çalışma Düzeni, Kanun Yapımı ve Bütçe',
  'TBMM''nin yasama görevini düzenli yürütebilmesi için başkanlık seçimi, tatil süreleri ve oylama nisapları Anayasa''da açık sayılara bağlanmıştır.  Anayasa m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "TBMM''nin yasama görevini düzenli yürütebilmesi için başkanlık seçimi, tatil süreleri ve oylama nisapları Anayasa''da açık sayılara bağlanmıştır. **Anayasa m. 94** uyarınca TBMM Başkanı seçimi gizli oyla yapılır ve en çok **4 turda** tamamlanır: birinci ve ikinci turlarda üye tamsayısının 2/3''ü (**400 milletvekili**), üçüncü turda üye tamsayısının salt çoğunluğu (**301 milletvekili**) aranır; üçüncü turda da salt çoğunluk sağlanamazsa dördüncü tura üçüncü turda en çok oy alan iki aday katılır ve **en çok oyu alan** aday TBMM Başkanı seçilir. TBMM Başkanlık Divanı seçimleri bir yasama döneminde iki kez yapılır (ilk seçilenler 2 yıl, ikinci devre seçilenler yasama döneminin sonuna kadar görev yapar)."
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 93**''e göre TBMM her yıl Ekim ayının ilk günü kendiliğinden toplanır ve bir yasama yılında **en çok 3 ay tatil** yapabilir (ara verme ise 15 günü geçemez). Tatil veya ara verme sırasında Meclis''i doğrudan **Cumhurbaşkanı** veya **TBMM Başkanı** toplantıya çağırabilir; ayrıca TBMM Başkanı, **üyelerin 1/5''inin (120 milletvekilinin)** yazılı istemi üzerine de Meclis''i toplantıya çağırmak zorundadır. **Anayasa m. 96** uyarınca TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az 1/3''ü (**200 milletvekili**) ile toplanır (**toplantı yeter sayısı**) ve Anayasa''da başkaca hüküm yoksa toplantıya katılanların salt çoğunluğu ile karar verir; ancak **karar yeter sayısı hiçbir şekilde üye tamsayısının 1/4''ünün 1 fazlasından (151 milletvekili) az olamaz**."
  },
  {
    "type": "heading",
    "text": "Kanunların Kabulü, Veto, Af ve Bütçe (m. 87, 89, 161)"
  },
  {
    "type": "paragraph",
    "text": "2017 anayasa değişikliği ile hükümetin **kanun tasarısı** verme yetkisi kaldırıldığı için normal kanunları yalnızca milletvekilleri **kanun teklifi** şeklinde sunabilir (yürütmenin teklif edebildiği tek kanun **Bütçe Kanunu**dur). TBMM tarafından kabul edilen kanunları Cumhurbaşkanı **15 gün** içinde yayımlar veya bir daha görüşülmek üzere gerekçesiyle Meclis''e geri gönderir. **Anayasa m. 89** uyarınca Cumhurbaşkanı **Bütçe Kanunu''nu geri gönderemez (veto edemez)**. 2017 değişikliği ile veto aşılma şartı da zorlaştırılmıştır: Cumhurbaşkanı''nın geri gönderdiği kanunu Meclis''in değiştirmeden aynen kabul edebilmesi için artık basit çoğunluk yetmez, **üye tamsayısının salt çoğunluğu (en az 301 milletvekili)** şarttır."
  },
  {
    "type": "bullets",
    "items": [
      "**Genel ve Özel Af İlanı (m. 87):** TBMM üye tamsayısının **en az 3/5''inin (360 milletvekili)** kararı gerekir. Ancak **Anayasa m. 169** uyarınca **orman suçları** için genel ve özel af çıkarılamaz.",
      "**Bütçe Kanun Teklifi (m. 161):** Yürütmenin başı olan **Cumhurbaşkanı** tarafından hazırlanır ve mali yılbaşından en az **75 gün** önce TBMM''ye sunulur.",
      "**TBMM''nin Bilgi Edinme ve Denetim Yolları:** 2017 değişikliği ile gensoru ve sözlü soru kaldırılmıştır; yürürlükte kalan dört yol **yazılı soru** (en geç 15 gün içinde cevaplanır), **meclis araştırması**, **genel görüşme** ve **meclis soruşturması**dır. Cumhurbaşkanı yardımcıları ve bakanlar ile Cumhurbaşkanı hakkında görevle ilgili suç iddiasıyla **meclis soruşturması** açılabilmesi için teklif üye tamsayısının salt çoğunluğu (**301 vekil**), soruşturma açılması kararı **3/5 (360 vekil)** gizli oyu ve **Yüce Divan''a sevk** kararı ise **2/3 (400 vekil)** gizli oyu ile alınır."
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "TBMM''deki temel çoğunluk sayılarını 600 vekil üzerinden **2-3-36-4** kuralıyla hatırla: - **1/3 (200):** Toplantı yeter sayısı ve Anayasa değişikliği teklifi - **Salt çoğunluk (301):** Veto edilen kanunu aynen kabul, 3. tur Meclis Başkanı ve soruşturma teklifi - **3/5 (360):** Genel/özel af, seçimlerin TBMM''ce yenilenmesi, soruşturma açılması ve anayasa değişikliği kabul alt sınırı - **2/3 (400):** Yüce Divan''a sevk, 1-2. tur Meclis Başkanı ve referandumsuz anayasa değişikliği onayı"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM kanun yapımı ve denetimde iki noktayı tuzak yapar: 1. Cumhurbaşkanı''nın geri gönderdiği kanunu TBMM''nin aynen kabul edebilmesi için 2017''den beri **en az 301 oy** gerekir (toplantıya katılanların çoğunluğu yetmez). 2. Normal kanunları yürütme teklif edemez; Cumhurbaşkanı''nın teklif edebildiği tek kanun **Bütçe Kanunu**dur ve Cumhurbaşkanı Bütçe Kanunu''nu **veto edemez**."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Meclis soruşturması sürecinde Yüce Divan''a sevk için gereken oy sayısı kaçtır?\" Teklif **301**, soruşturma açılması kararı **360**, Yüce Divan''a sevk ise **400** milletvekilinin gizli oyuyla gerçekleşir."
  },
  {
    "type": "key_points",
    "items": [
      "TBMM Başkanı en çok 4 turda seçilir (400 - 400 - 301 - en çok oy); tatil yılda en çok 3 aydır.",
      "Toplantı yeter sayısı **200**, en az karar yeter sayısı **151**dir; veto edilen kanunu aynen kabul için **301** oy gerekir.",
      "Genel/özel af için **360** oy gerekir ve orman suçlarına af çıkarılamaz; Bütçe Kanunu''nu Cumhurbaşkanı 75 gün önce sunar ve veto edemez.",
      "Meclis denetim yolları yazılı soru, meclis araştırması, genel görüşme ve meclis soruşturmasıdır (gensoru ve sözlü soru yoktur)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
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
  'vatandaslik.yasama_yurutme_ve_yargi.03',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  3,
  'Bölüm 3: Yürütme Organı: Cumhurbaşkanı, Yardımcıları ve Bakanlar',
  '2017 anayasa değişikliği sonrasında yürütme yetkisi ve görevi tek başına Cumhurbaşkanı tarafından Anayasa''ya ve kanunlara uygun olarak kullanılır ve yerine getirilir.  Cumhurbaşkanı devletin başıdır; bu sıfatla Türkiye Cumhuriyeti''ni ve Türk Milletinin birliğini temsil eder; Anayasanın uygulanmasını, devlet organlarının düzenli ve uyumlu çalışmasını temin eder.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "2017 anayasa değişikliği sonrasında yürütme yetkisi ve görevi tek başına **Cumhurbaşkanı** tarafından Anayasa''ya ve kanunlara uygun olarak kullanılır ve yerine getirilir. Cumhurbaşkanı devletin başıdır; bu sıfatla Türkiye Cumhuriyeti''ni ve Türk Milletinin birliğini temsil eder; Anayasanın uygulanmasını, devlet organlarının düzenli ve uyumlu çalışmasını temin eder. **Anayasa m. 101** uyarınca Cumhurbaşkanı; **40 yaşını doldurmuş**, **yükseköğrenim yapmış**, milletvekili seçilme yeterliliğine sahip Türk vatandaşları arasından, doğrudan **halk tarafından 5 yıl için** seçilir. Genel oyla yapılacak seçimde geçerli oyların salt çoğunluğunu alan aday seçilmiş olur; ilk oylamada bu çoğunluk sağlanamazsa ikinci pazar günü en çok oy alan iki aday arasında ikinci oylama yapılır."
  },
  {
    "type": "heading",
    "text": "Cumhurbaşkanı Adaylığı, Seçim Yenileme ve Vekalet"
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 101**''e göre Cumhurbaşkanlığına üç yoldan aday gösterilebilir: 1. **Siyasi parti grupları** (TBMM''de en az 20 milletvekiline sahip gruplar), 2. En son yapılan milletvekili genel seçimlerinde toplam geçerli oyların tek başına veya birlikte **en az %5''ini** almış olan siyasi partiler, 3. En az **100.000 seçmenin** yazılı teklifiyle gösterilen adaylar."
  },
  {
    "type": "paragraph",
    "text": "Bir kimse **en fazla iki defa** Cumhurbaşkanı seçilebilir. Ancak **Anayasa m. 116/3** bunun tek anayasal istisnasını düzenlemiştir: **Cumhurbaşkanının ikinci döneminde Meclis tarafından (üye tamsayısının 3/5''i yani 360 milletvekili ile) seçimlerin yenilenmesine karar verilmesi halinde, Cumhurbaşkanı bir defa daha (üçüncü kez) aday olabilir**. Dikkat et: Cumhurbaşkanı kendisi seçim yenileme kararı alırsa üçüncü kez aday olamaz; ayrıca TBMM veya Cumhurbaşkanı tarafından seçimlerin yenilenmesine karar verildiğinde her iki seçim de birlikte yenilenir!"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 106** uyarınca Cumhurbaşkanlığı makamının herhangi bir nedenle boşalması halinde yenisi seçilinceye kadar Cumhurbaşkanlığına **Cumhurbaşkanı Yardımcısı** vekalet eder ve Cumhurbaşkanına ait yetkileri kullanır (2017 değişikliğinden önce TBMM Başkanı vekalet ediyordu). Seçim takvimi ise kalan süreye göre ikiye ayrılır:"
  },
  {
    "type": "bullets",
    "items": [
      "Genel seçime **1 yıldan fazla** süre kalmışsa boşalmadan itibaren **45 gün** içinde **yalnızca Cumhurbaşkanı seçimi** yapılır (seçilen Cumhurbaşkanı kalan süreyi tamamlar ve bu dönem görev süresinden sayılmaz).",
      "Genel seçime **1 yıl veya daha az** süre kalmışsa boşalmadan itibaren yine **45 gün** içinde **TBMM seçimi ile Cumhurbaşkanlığı seçimi birlikte** yenilenir."
    ]
  },
  {
    "type": "heading",
    "text": "Bakanlıklar ve Cumhurbaşkanlığı Kararnamesi (m. 104, 106)"
  },
  {
    "type": "paragraph",
    "text": "Cumhurbaşkanı, Cumhurbaşkanı yardımcıları ve bakanları milletvekili seçilme yeterliliğine sahip olanlar arasından atar ve görevden alır; atanan kişiler TBMM önünde ant içerek göreve başlar ve yalnızca Cumhurbaşkanı''na karşı sorumludur. **Anayasa m. 106/son** açık hükmü gereği **bakanlıkların kurulması, kaldırılması, görevleri ve yetkileri, teşkilat yapısı ile merkez ve taşra teşkilatlarının kurulması kanunla değil, Cumhurbaşkanlığı Kararnamesi (CBK) ile düzenlenir**. **Anayasa m. 104** uyarınca Cumhurbaşkanı yürütme yetkisine ilişkin konularda CBK çıkarabilir; ancak Anayasa''nın ikinci kısmının birinci ve ikinci bölümlerinde yer alan temel haklar, kişi hakları ve ödevleriyle dördüncü bölümde yer alan siyasi haklar ve ödevler CBK ile düzenlenemez. Ayrıca CBK ile kanunlarda farklı hükümler bulunması halinde **kanun hükümleri uygulanır**; TBMM''nin aynı konuda kanun çıkarması durumunda CBK hükümsüz hale gelir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Cumhurbaşkanlığı konusunda üç kritik farkı birbirine karıştırma: 1. Adaylık için parti oy oranı barajı **%5**tir (TBMM seçim barajı %7, Hazine yardımı barajı %3''tür). 2. Cumhurbaşkanına hastalık, yurt dışına çıkma veya makamın boşalması hallerinde TBMM Başkanı değil **Cumhurbaşkanı Yardımcısı** vekalet eder. 3. Bakanlıklar 2017''den beri kanunla değil **Cumhurbaşkanlığı Kararnamesi** ile kurulur ve kaldırılır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Genel seçimlere 1 yıl 8 ay kala Cumhurbaşkanlığı makamı boşalırsa nasıl bir seçim yapılır?\" 1 yıldan fazla süre kaldığı için **45 gün** içinde **yalnızca Cumhurbaşkanı seçimi** yapılır ve seçilen kişi kalan süreyi tamamlar."
  },
  {
    "type": "key_points",
    "items": [
      "Cumhurbaşkanı 40 yaşını doldurmuş, yükseköğrenimli Türk vatandaşları arasından halkça 5 yıl için seçilir; adaylık için parti grubu, %5 oy veya 100.000 imza gerekir.",
      "İkinci döneminde TBMM''nin 360 oyla seçimleri yenilemesi halinde Cumhurbaşkanı 3. kez aday olabilir (m. 116/3).",
      "Makam boşaldığında Cumhurbaşkanı Yardımcısı vekalet eder; 1 yıldan çok varsa 45 günde sadece CB seçimi, 1 yıl veya az varsa yine 45 günde ikisi birlikte yenilenir.",
      "Bakanlıklar CBK ile kurulur ve kaldırılır; kanunla CBK çatışırsa kanun hükümleri uygulanır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
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
  'vatandaslik.yasama_yurutme_ve_yargi.04',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  4,
  'Bölüm 4: Olağanüstü Hal (OHAL), MGK ve DDK (m. 108, 118, 119)',
  'Yürütme organının olağanüstü kriz durumlarındaki yetkileri, milli güvenlik danışma mekanizması ve idari denetim aracı Anayasa''da özel olarak düzenlenmiştir.  2017 değişikliği ile sıkıyönetim tamamen kaldırıldığı için tek olağanüstü yönetim usulü Olağanüstü Hal (OHAL)dir; böylece olağanüstü dönemlerde askeri makamların sivil yönetimi devralması uygulamasına son verilerek sivil yürütme otoritesi ve Meclis denetimi esas alınmıştır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Yürütme organının olağanüstü kriz durumlarındaki yetkileri, milli güvenlik danışma mekanizması ve idari denetim aracı Anayasa''da özel olarak düzenlenmiştir. 2017 değişikliği ile **sıkıyönetim** tamamen kaldırıldığı için tek olağanüstü yönetim usulü **Olağanüstü Hal (OHAL)**dir; böylece olağanüstü dönemlerde askeri makamların sivil yönetimi devralması uygulamasına son verilerek sivil yürütme otoritesi ve Meclis denetimi esas alınmıştır."
  },
  {
    "type": "heading",
    "text": "Olağanüstü Hal Yönetimi (Anayasa m. 119)"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 119** uyarınca **Cumhurbaşkanı**; savaş, savaşı gerektirecek bir durumun başgöstermesi, seferberlik, ayaklanma, vatan veya Cumhuriyete karşı kuvvetli ve eylemli bir kalkışma, ülkenin ve milletin bölünmezliğini içten veya dıştan tehlikeye düşüren şiddet hareketlerinin yaygınlaşması, anayasal düzeni veya temel hak ve hürriyetleri ortadan kaldırmaya yönelik yaygın şiddet hareketlerinin ortaya çıkması, şiddet olayları nedeniyle kamu düzeninin ciddi şekilde bozulması, **tabii afet veya tehlikeli salgın hastalık** ya da **ağır ekonomik bunalım** hallerinde yurdun tamamında veya bir bölgesinde **süresi 6 ayı geçmemek üzere** olağanüstü hal ilan edebilir."
  },
  {
    "type": "paragraph",
    "text": "OHAL ilan kararı verildiği gün Resmi Gazete''de yayımlanır ve aynı gün **TBMM''nin onayına** sunulur. TBMM tatilde ise derhal toplantıya çağrılır. **TBMM, gerekli gördüğü takdirde OHAL süresini kısaltabilir, uzatabilir veya olağanüstü hali kaldırabilir.** Cumhurbaşkanı''nın istemiyle TBMM **her defasında 4 ayı geçmemek üzere** OHAL süresini uzatabilir; ancak savaş hallerinde bu 4 aylık sınır aranmaz. Olağanüstü hallerde vatandaşlar için getirilecek para, mal ve çalışma yükümlülükleri ile temel hakların nasıl sınırlandırılacağı ve durdurulacağı kanunla düzenlenir. Cumhurbaşkanı''nın OHAL''in gerekli kıldığı konularda çıkardığı **OHAL Cumhurbaşkanlığı Kararnameleri** ise Resmi Gazete''de yayımlanır ve aynı gün Meclis onayına sunulur (savaş ve mücbir sebepler dışında 3 ay içinde TBMM''de görüşülüp karara bağlanmayan OHAL CBK''ları kendiliğinden yürürlükten kalkar). Bu üç aylık süre, yürütmenin olağanüstü yetkilerinin TBMM denetimi dışında kalıcılaşmasını önlemek için konulmuştur."
  },
  {
    "type": "heading",
    "text": "Milli Güvenlik Kurulu (m. 118) ve Devlet Denetleme Kurulu (m. 108)"
  },
  {
    "type": "bullets",
    "items": [
      "**Milli Güvenlik Kurulu (MGK, m. 118):** Devletin milli güvenlik siyasetinin tayini, tespiti ve uygulanması ile ilgili alınan tavsiye kararlarını ve gerekli koordinasyonun sağlanması konusundaki görüşlerini Cumhurbaşkanı''na bildirir. Kurul **iki ayda bir** toplanır; kararları icrai değil **tavsiye niteliğindedir**. Gündemi, Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanının önerileri dikkate alınarak **Cumhurbaşkanı** belirler; Cumhurbaşkanının katılamadığı zamanlarda toplantıya **Cumhurbaşkanı Yardımcısı** başkanlık eder. **MGK Üyeleri** şunlardır: Cumhurbaşkanı (Başkan), Cumhurbaşkanı Yardımcıları, Adalet, Milli Savunma, İçişleri ve Dışişleri Bakanları, Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanları.",
      "**Devlet Denetleme Kurulu (DDK, m. 108):** İdarenin hukuka uygunluğunun, düzenli ve verimli şekilde yürütülmesinin ve geliştirilmesinin sağlanması amacıyla **Cumhurbaşkanlığına bağlı** olarak kurulmuştur. Cumhurbaşkanının isteği üzerine tüm kamu kurum ve kuruluşlarında, sermayesinin yarısından fazlasına bu kurumların katıldığı kuruluşlarda, kamu kurumu niteliğindeki meslek kuruluşlarında, işçi-işveren meslek kuruluşlarında ve kamuya yararlı derneklerle vakıflarda her türlü inceleme, araştırma, denetleme ve **idari soruşturma** yapar. 2017 değişikliği ile **Türk Silahlı Kuvvetleri (TSK) de DDK denetimine dahil edilmiştir**; Anayasa m. 108 açık hükmü gereği **yargı organları, Devlet Denetleme Kurulunun görev alanı dışındadır**. Kurulun başkan ve üyeleri Cumhurbaşkanı tarafından atanır ve doğrudan Cumhurbaşkanı''na rapor sunar."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "MGK ve DDK sorularında ÖSYM''nin değişmez üç tuzağı vardır: 1. OHAL ilanını Cumhurbaşkanı **en çok 6 ay** için yapar; uzatmayı ise TBMM **her defasında en çok 4 ay** için yapar (6 ay ile 4 ayı ters verme!). 2. **TBMM Başkanı** ve **Jandarma Genel Komutanı** MGK üyesi **değildir**! 3. 2017 değişikliğinden sonra TSK da DDK tarafından denetlenebilir hale gelmiştir; DDK''nın denetleyemediği **tek alan yargı organlarıdır**."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Devlet Denetleme Kurulu aşağıdakilerden hangisini denetleyemez?\" Seçeneklerde TSK, KİT''ler, barolar/odalar ve vakıflar yer alır; doğru yanıt **yargı organları (mahkemeler)**dır. Ayrıca 2017 değişikliği ile DDK''ya yalnızca inceleme değil, doğrudan **idari soruşturma** yapma yetkisi de tanınmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "OHAL ilanı Cumhurbaşkanınca **en çok 6 ay** için yapılır; TBMM''ce **her defasında en çok 4 ay** uzatılabilir (savaşta 4 ay sınırı yoktur).",
      "MGK iki ayda bir toplanır ve kararları tavsiye niteliğindedir; TBMM Başkanı ve Jandarma Genel Komutanı MGK üyesi değildir.",
      "DDK Cumhurbaşkanlığına bağlıdır; 2017''den beri TSK''yı ve idari soruşturmaları kapsar, yalnızca **yargı organlarını** denetleyemez."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
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
  'vatandaslik.yasama_yurutme_ve_yargi.05',
  'Vatandaşlık',
  'Yasama, Yürütme ve Yargı',
  5,
  'Bölüm 5: Yargı Organı: Yüksek Mahkemeler, AYM ve HSK',
  '1982 Anayasası''nın 9.  maddesi uyarınca yargı yetkisi Türk Milleti adına bağımsız ve tarafsız mahkemelerce kullanılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın 9. maddesi uyarınca yargı yetkisi Türk Milleti adına bağımsız ve tarafsız mahkemelerce kullanılır. Anayasa''nın Yargı bölümünde düzenlenen **Yüksek Mahkemeler yalnızca 4 tanedir**: **Anayasa Mahkemesi (AYM), Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi**. **Sayıştay** ile **Hakimler ve Savcılar Kurulu (HSK)** Anayasa''nın Yargı bölümünde yer almalarına rağmen **yüksek mahkeme değildir**; Askeri Yargıtay ve Askeri Yüksek İdare Mahkemesi (AYİM) ise 2017 anayasa değişikliği ile kaldırılmıştır."
  },
  {
    "type": "heading",
    "text": "Anayasa Mahkemesi (m. 146-153)"
  },
  {
    "type": "paragraph",
    "text": "2017 değişikliği sonrası **Anayasa Mahkemesi 15 üyeden** oluşur: **12 üyeyi Cumhurbaşkanı**, **3 üyeyi TBMM** seçer. Üyeler **12 yıl** için seçilir ve bir kimse iki defa AYM üyesi seçilemez. AYM hem bireysel başvurulara bakar hem de kanunların, olağan CBK''ların ve TBMM İçtüzüğünün anayasaya uygunluğunu denetler. **Anayasa m. 150** uyarınca doğrudan iptal davası (**soyut norm denetimi**) açmaya yetkili yalnızca üç merci vardır: **Cumhurbaşkanı**, **TBMM''de en fazla üyeye sahip iki siyasi parti grubu** ve **TBMM üye tamsayısının en az 1/5''i (120 milletvekili)**. İptal davası açma süresi **60 gün**dür (anayasa değişikliği şekil denetiminde **10 gün**). **Anayasa m. 153**''ün temel ilkesine göre **AYM''nin iptal kararları geriye yürümez** (idari yargıdaki iptal kararlarından farklı olarak geçmişte tamamlanmış işlemleri geçersiz kılmaz)."
  },
  {
    "type": "paragraph",
    "text": "AYM aynı zamanda **Yüce Divan** sıfatıyla Cumhurbaşkanı''nı, TBMM Başkanı''nı, Cumhurbaşkanı yardımcılarını, bakanları, yüksek yargı başkan ve üyelerini, HSK ve Sayıştay başkan ve üyelerini, Genelkurmay Başkanı''nı ve Kara, Deniz, Hava Kuvvetleri Komutanlarını görevleriyle ilgili suçlardan dolayı yargılar (**milletvekilleri Yüce Divan''da yargılanmazlar**, görev suçları dışındaki suçlarda genel ceza mahkemelerinde yargılanırlar). **2010 anayasa değişikliği** ile Yüce Divan kararlarına karşı tebliğden itibaren **15 gün** içinde AYM Genel Kurulu''na **yeniden inceleme** başvurusu yapma hakkı getirilmiştir."
  },
  {
    "type": "heading",
    "text": "Yargıtay, Danıştay, Uyuşmazlık Mahkemesi, Sayıştay ve HSK"
  },
  {
    "type": "table",
    "headers": [
      "Kurum",
      "Temel Görevi",
      "Üye Seçimi ve Kritik Sınav Notu"
    ],
    "rows": [
      [
        "Yargıtay (m. 154)",
        "**Adli yargı** mahkemelerinin son inceleme mercii",
        "Üyelerinin tamamını **HSK** seçer; **Cumhuriyet Başsavcısını** 5 aday arasından **Cumhurbaşkanı** 4 yıl için seçer"
      ],
      [
        "Danıştay (m. 155)",
        "**İdari yargı** mahkemelerinin son inceleme mercii",
        "Üyelerinin **1/4''ünü Cumhurbaşkanı**, **3/4''ünü HSK** seçer"
      ],
      [
        "Uyuşmazlık Mahkemesi (m. 158)",
        "Adli ve idari yargı arasındaki görev/hüküm uyuşmazlıklarını kesin çözer",
        "Başkanını **AYM kendi üyeleri arasından** seçer"
      ],
      [
        "Sayıştay (m. 160)",
        "TBMM adına kamu idarelerinin mali denetimini yapar",
        "Yüksek mahkeme değildir; **vergi** konusunda Danıştay ile çatışırsa **Danıştay kararı** esas alınır"
      ],
      [
        "HSK (m. 159)",
        "Hakim ve savcıların atama, terfi ve disiplin işlerini yürütür",
        "**13 üye**: Adalet Bakanı (Başkan) + Bakan Yardımcısı (tabii üye) + **4 CB + 7 TBMM** seçer"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 159** uyarınca **Hakimler ve Savcılar Kurulu''nun Başkanı Adalet Bakanı**dır ve Adalet Bakan Yardımcısı kurulun tabii üyesidir. Kurul kararlarına karşı yargı yolu ilkesel olarak kapalıdır; tek istisnası **meslekten çıkarma cezasına ilişkin kararlar**dır (yalnızca meslekten çıkarma kararına karşı yargı yoluna başvurulabilir; atama, nakil, terfi veya kınama kararlarına karşı dava açılamaz)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Yargı bölümünde ÖSYM''nin en çok sorduğu dört tuzak şunlardır: 1. **Sayıştay** ve **HSK** yüksek mahkeme değildir; yüksek mahkemeler AYM, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi olmak üzere **4 tanedir**. 2. Vergi uyuşmazlıklarında Sayıştay ile Danıştay kararları çelişirse dosya Uyuşmazlık Mahkemesi''ne gitmez, doğrudan **Danıştay kararı** üstün tutulur (m. 160/son). 3. AYM iptal kararları **geriye yürümez** (idari yargıdaki iptal ise geriye yürür). 4. HSK''nın **yalnızca meslekten çıkarma** kararlarına karşı yargı yolu açıktır; diğer kararları yargı denetimi dışındadır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Danıştay üyelerini ve Yargıtay Cumhuriyet Başsavcısını kim seçer?\" Danıştay üyelerinin **1/4''ünü Cumhurbaşkanı, 3/4''ünü HSK** seçer; **Yargıtay Cumhuriyet Başsavcısını** ise Yargıtay Büyük Genel Kurulu''nun göstereceği 5 aday arasından **Cumhurbaşkanı** seçer."
  },
  {
    "type": "key_points",
    "items": [
      "4 Yüksek Mahkeme vardır: AYM, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi (Sayıştay ve HSK yüksek mahkeme değildir).",
      "AYM 15 üyedir (12 CB + 3 TBMM), görev süresi 12 yıldır; iptal kararları geriye yürümez; milletvekilleri Yüce Divan''da yargılanmaz.",
      "Yargıtay üyelerini HSK, Başsavcısını CB seçer; Danıştay üyelerinin 1/4''ünü CB, 3/4''ünü HSK seçer; Uyuşmazlık Mahkemesi Başkanını AYM seçer.",
      "HSK 13 üyedir (Başkanı Adalet Bakanı); yalnızca meslekten çıkarma kararlarına karşı yargı yolu açıktır."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": []
  }
]'::jsonb,
  '{"b_grubu_gk"}'::text[],
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
