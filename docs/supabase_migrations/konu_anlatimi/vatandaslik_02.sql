-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · 1982 Anayasası ve Temel İlkeler
-- Kaynak: docs/konu_anlatimi/vatandaslik/02_1982_anayasasi_ve_temel_ilkeler.md
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.01',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  1,
  'Bölüm 1: Türk Anayasa Tarihi (1876''dan 1982''ye)',
  'Türk anayasacılık hareketleri, devlet iktidarının hukuk kurallarıyla sınırlandırılması ve temel hakların güvence altına alınması arayışıyla 19.  yüzyıl başında filizlendi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Türk anayasacılık hareketleri, devlet iktidarının hukuk kurallarıyla sınırlandırılması ve temel hakların güvence altına alınması arayışıyla 19. yüzyıl başında filizlendi. Padişahın mutlak yetkilerini ilk kez kısıtlayan belge **1808 Sened-i İttifak**tır; bunu hukukun üstünlüğünü tanıyan **1839 Tanzimat Fermanı** ve gayrimüslim tebaanın haklarını genişleten **1856 Islahat Fermanı** izlemiştir. Ancak teknik anlamda **ilk yazılı anayasa**, 1876''da II. Abdülhamit döneminde ilan edilen **Kanun-i Esasi**dir. Kanun-i Esasi ile iki kanatlı parlamento kurulmuştur: üyeleri halk tarafından çift dereceli seçimle 4 yıllığına seçilen **Heyet-i Mebusan** ve üyeleri bizzat padişah tarafından ömür boyu atanan **Heyet-i Ayan**. İlk dönemde padişaha tanınan meclisi fesih ve sürgün yetkileri, 1909 değişiklikleriyle daraltılarak gerçek parlamenter meşrutiyet güçlendirilmiştir."
  },
  {
    "type": "heading",
    "text": "Cumhuriyet Dönemi Anayasaları"
  },
  {
    "type": "paragraph",
    "text": "Milli Mücadele koşullarında TBMM tarafından kabul edilen **1921 Anayasası (Teşkilat-ı Esasiye Kanunu)**, yalnızca 23 ana madde ve 1 ek maddeden oluşan kısa bir metindir. Değiştirilmesi için özel nitelikli çoğunluk öngörmediği ve temel haklara yer vermediği için Türk anayasa tarihindeki **tek yumuşak** ve **tek çerçeve** anayasadır; bu anayasa dışındaki 1876, 1924, 1961 ve 1982 anayasalarının tamamı hem **sert (katı)** hem de **kazuistik (ayrıntıcı)** anayasalardır. Bu yapı, savaş koşullarında hızlı karar almayı sağlayan meclis hükümeti modelinin bir sonucudur."
  },
  {
    "type": "paragraph",
    "text": "1924 Anayasası sert ve kazuistik bir metin olarak meclis hükümeti ile parlamenter sistem arası karma bir hükümet modeli benimsemiş, ancak **Anayasa Mahkemesi''ni kurmadığı** için kanunların anayasaya uygunluk denetimini meclisin kendi takdirine bırakmıştır. 1924 Anayasası zaman içinde köklü demokratik ve laik değişiklikler görmüştür: **1928**''de \"Devletin dini İslam''dır\" ibaresi ile yeminlerdeki dini ifadeler çıkarılmış, **1934**''te kadınlara milletvekili seçme ve seçilme hakkı tanınmış, **5 Şubat 1937**''de ise Atatürk''ün altı temel ilkesi anayasa metnine eklenmiştir. Çok partili hayata geçişte **1946 seçimleri** \"açık oy, gizli sayım\" usulüyle ilk çok partili seçim olurken, **1950 seçimleri** ilk kez \"gizli oy, açık sayım\" ilkesiyle yapılan demokratik seçim olarak tarihe geçmiştir. Bu demokratik açılım, ilerleyen yıllarda yargı denetimi ve temel hak güvencelerinin anayasada güçlendirilmesi ihtiyacını doğurmuştur."
  },
  {
    "type": "table",
    "headers": [
      "Anayasa",
      "Meclis Yapısı",
      "Hükümet Sistemi",
      "Öne Çıkan Kurumsal Özellik"
    ],
    "rows": [
      [
        "1876 Kanun-i Esasi",
        "Çift meclis (Mebusan + Ayan)",
        "Meşruti monarşi",
        "İlk yazılı Türk anayasası"
      ],
      [
        "1921 Teşkilat-ı Esasiye",
        "Tek meclis (TBMM)",
        "Meclis hükümeti",
        "**Tek yumuşak** ve **tek çerçeve** anayasa"
      ],
      [
        "1924 Anayasası",
        "Tek meclis (TBMM)",
        "Karma sistem",
        "1928 laikleşme, 1937 ilkeler; AYM yok"
      ],
      [
        "1961 Anayasası",
        "Çift meclis (Millet Meclisi + Senato)",
        "Parlamenter sistem",
        "**AYM, MGK, DPT, YSK** ilk kez kuruldu"
      ],
      [
        "1982 Anayasası",
        "Tek meclis (TBMM)",
        "2017 sonrası CB Hükümet",
        "Yürütme güçlendirildi; Senato kaldırıldı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "1961 Anayasası, çoğulcu demokrasi ve kuvvetler ayrılığı anlayışıyla **Anayasa Mahkemesi (AYM)**, **Milli Güvenlik Kurulu (MGK)**, **Devlet Planlama Teşkilatı (DPT)** ve **Yüksek Seçim Kurulu (YSK)** gibi kurumları ilk kez anayasal düzene kazandırmıştır. Tarihimizde çift meclis uygulanan iki anayasa vardır: 1876 Kanun-i Esasi ve 1961 Anayasası (Millet Meclisi ve Cumhuriyet Senatosu). **1982 Anayasası** ise 1970''lerdeki koalisyon krizlerini ve meclis tıkanıklıklarını aşmak amacıyla Cumhuriyet Senatosunu kaldırıp tek meclise dönmüş ve yürütme organını güçlendirmiştir. Ayrıca **Anayasa m. 176** uyarınca anayasanın dayandığı temel görüş ve ilkeleri belirten **Başlangıç kısmı anayasa metnine dahildir**; buna karşılık **madde kenar başlıkları anayasa metnine dahil değildir**."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM anayasa karşılaştırmalarında iki ince farkı çok sık sorar: 1. **1961 Anayasası** \"insan haklarına **dayanan**\" devlet ifadesini kullanırken, **1982 Anayasası** \"insan haklarına **saygılı**\" devlet kavramını tercih etmiştir. 2. İlk anayasal belge 1808 Sened-i İttifak olsa da ilk **anayasa** 1876 Kanun-i Esasi''dir; AYM ise 1982''de değil **1961 Anayasası** ile kurulmuştur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1982 Anayasası''nın 176. maddesine göre aşağıdakilerden hangisi anayasa metnine dahil değildir?\" Seçeneklerde Başlangıç kısmı, ilk üç madde ve geçici maddeler yer alır; metne dahil olmayan yalnızca **madde kenar başlıkları**dır."
  },
  {
    "type": "key_points",
    "items": [
      "İlk anayasal belge 1808 Sened-i İttifak, ilk anayasa 1876 Kanun-i Esasi''dir.",
      "1921 Anayasası tek yumuşak ve tek çerçeve anayasadır; 1876 ve 1961 anayasaları çift meclislidir.",
      "AYM, MGK, DPT ve YSK ilk kez 1961 Anayasası ile kuruldu; 1961 \"dayanan\", 1982 \"saygılı\" kavramını kullandı.",
      "Anayasa m. 176''ya göre Başlangıç kısmı metne dahil, madde kenar başlıkları metne dahil değildir."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.02',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  2,
  'Bölüm 2: 1982 Anayasası''nın Değiştirilemez Hükümleri ve Temel İlkeleri',
  '1982 Anayasası''nın devletin temel yapısını ve rejimini güvenceye alan ilk üç maddesi, Anayasa''nın 4.  maddesi ile özel koruma altına alınmıştır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın devletin temel yapısını ve rejimini güvenceye alan **ilk üç maddesi**, Anayasa''nın **4. maddesi** ile özel koruma altına alınmıştır. Anayasa m. 4 uyarınca yalnızca **ilk 3 madde** (1. madde: Devletin şekli Cumhuriyettir; 2. madde: Cumhuriyetin nitelikleri; 3. madde: Devletin bütünlüğü, resmi dili Türkçe, bayrağı, milli marşı İstiklal Marşı ve başkenti Ankara) değiştirilemez ve **değiştirilmesi teklif dahi edilemez**. Dolayısıyla 4. maddenin kendisi koruyucu normdur; korunan hükümler ilk 3 maddedir. Anayasa koyucunun bu üç maddeyi değiştirilemez kılmasının temel nedeni, devletin cumhuriyet rejimini, laik-demokratik hukuk devleti niteliğini ve üniter bütünlüğünü siyasi çoğunlukların geçici kararlarına karşı güvence altına almaktır."
  },
  {
    "type": "heading",
    "text": "Cumhuriyetin Temel Nitelikleri (Anayasa m. 2)"
  },
  {
    "type": "paragraph",
    "text": "Anayasa''nın 2. maddesi Türkiye Cumhuriyeti''nin temel niteliklerini açıkça sayar ve devlet organlarının tüm işlemlerinde uyması gereken anayasal çerçeveyi çizer:"
  },
  {
    "type": "bullets",
    "items": [
      "**Demokratik Devlet ve Üniter Yapı:** Halkın kendi temsilcilerini serbest, genel ve eşit seçimlerle belirlemesine dayanır. Temsili demokrasinin yanında halkın yönetime doğrudan katıldığı **yarı doğrudan demokrasi**nin dört aracı vardır: **referandum (halkoylaması), halk vetosu, halk girişimi ve temsilcilerin geri çağrılması**. Ayrıca Türkiye **üniter bir devlettir**; ülke sınırları içinde tek bir egemenlik, tek bir parlamento, tek bir anayasa ve tek bir hukuk düzeni bulunur (federal devlette ise federe birimlerin kendi anayasası ve meclisi vardır).",
      "**Laik Devlet:** Din kurallarının devlet işlerine karışmamasını, devletin tüm inançlara eşit mesafede durmasını ve yasama organının kanun yaparken din kurallarına değil akıl, bilim ve anayasa ilkelerine dayanmasını gerektirir. Kanunlar hiçbir dini otoritenin onayına tabi tutulamaz.",
      "**Sosyal Devlet:** Devletin vatandaşlarına sosyal güvenlik sağlamasını, fırsat eşitliği yaratmasını ve vergi ile kamusal hizmetler yoluyla gelirin adil dağıtılmasını öngörür. Sosyal devlet, komünizm gibi özel mülkiyeti ortadan kaldırmaz; serbest piyasa içinde sosyal adaleti, çalışma hayatının korunmasını ve asgari refahı teminat altına alır.",
      "**Hukuk Devleti:** Devletin tüm eylem ve işlemlerinin hukuk kurallarıyla bağlı olması, yargı bağımsızlığının sağlanması ve idarenin yargısal denetime tabi tutulmasıdır. Hukuk devletinde yasama veya yürütme dahil hiçbir organ mahkeme kararlarını değiştiremez, iptal edemez veya uygulanmasını geciktiremez; idarenin her türlü eylem ve işlemine karşı yargı yolu açıktır.",
      "**Atatürk Milliyetçiliğine Bağlı ve İnsan Haklarına Saygılı Devlet:** Ulusal birliği ırk temeline değil ortak vatandaşlık ve kültür bağına dayandırır; bireyin temel haklarını devlet otoritesi karşısında korunan anayasal değerler olarak kabul eder."
    ]
  },
  {
    "type": "heading",
    "text": "Tabii Hakim İlkesi (Anayasa m. 37)"
  },
  {
    "type": "paragraph",
    "text": "Hukuk devletinin ceza ve yargılama alanındaki en önemli güvencelerinden biri **Anayasa m. 37**''de düzenlenen **Tabii (Doğal) Hakim İlkesi**dir. Bu ilkeye göre hiç kimse kanunen tabi olduğu mahkemeden başka bir merci önüne çıkarılamaz ve bir kimseyi kanunen tabi olduğu mahkemeden başka bir merci önüne çıkarma sonucunu doğuran yargı yetkisine sahip olağanüstü merciler kurulamaz. Başka bir ifadeyle, bir suç işlendiği veya uyuşmazlık doğduğu anda o davaya bakacak **görevli ve yetkili mahkemenin kanunla önceden belirlenmiş olması** zorunludur; olay gerçekleştikten sonra kişiye veya olaya özgü mahkeme kurulması hukuk devletine ve yargı bağımsızlığına aykırıdır. Bu güvence, bireylerin siyasi veya keyfi yargılamalarla karşılaşmasını engelleyerek hukuki güvenlik sağlar."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM değiştirilemez hükümler ve devlet nitelikleri sorularında iki tuzak kurar: 1. İlk 3 madde değiştirilemez; **4. madde** ise bu ilk 3 maddenin değiştirilemeyeceğini emreden koruyucu maddedir. 2. **Sosyal devlet** ilkesi \"özel mülkiyetin kaldırılması ve üretimin tamamen devletleştirilmesi\" anlamına gelmez; sosyal devlet mülkiyet hakkını koruyarak sosyal adalet sağlar."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Suç işlendikten sonra yalnızca o suça bakmak üzere yeni bir mahkeme kurulması hangi anayasal ilkeyi ihlal eder?\" Cevap **Anayasa m. 37 Tabii Hakim İlkesi**dir; yargılayacak mahkemenin olaydan önce kanunla belli olması şarttır."
  },
  {
    "type": "key_points",
    "items": [
      "Anayasa m. 4 yalnızca ilk 3 maddenin değiştirilemeyeceğini ve teklif dahi edilemeyeceğini güvence altına alır.",
      "Yarı doğrudan demokrasinin araçları referandum, halk vetosu, halk girişimi ve temsilcilerin geri çağrılmasıdır.",
      "Üniter devlette tek egemenlik ve tek anayasa vardır; hukuk devletinde yürütme mahkeme kararlarını değiştiremez veya geciktiremez.",
      "Tabii hakim ilkesi (m. 37), uyuşmazlık doğmadan önce görevli ve yetkili mahkemenin kanunla belirlenmiş olmasını zorunlu kılar."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.03',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  3,
  'Bölüm 3: Seçim İlkeleri, Yüksek Seçim Kurulu ve Siyasi Partiler',
  'Demokratik devlet ilkesinin hayata geçirilmesini sağlayan seçim kuralları Anayasa m.  67 ve devamında ayrıntılı olarak düzenlenmiştir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Demokratik devlet ilkesinin hayata geçirilmesini sağlayan seçim kuralları **Anayasa m. 67** ve devamında ayrıntılı olarak düzenlenmiştir. Seçimler yargı yönetim ve denetimi altında **serbest, eşit, gizli, tek dereceli, genel oy, açık sayım ve döküm** esaslarına göre yapılır. **Genel oy** servet, vergi, eğitim veya cinsiyet ayrımı gözetilmeksizin tüm vatandaşların oy kullanabilmesini; **eşit oy** ise her seçmenin yalnızca bir oya sahip olmasını (1 kişi = 1 oy) ve oyların eşit değerde sayılmasını ifade eder. Tek dereceli seçimde seçmen doğrudan kendi temsilcisine oy verirken, gizli oy seçmenin baskı altında kalmadan özgür iradesini kullanmasını, açık sayım ve döküm ise seçim sonuçlarının şeffaf biçimde denetlenmesini güvence altına alır."
  },
  {
    "type": "heading",
    "text": "Oy Kullanamayacaklar, Seçim Süreleri ve Erteleme"
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 67** uyarınca **18 yaşını dolduran** her Türk vatandaşı seçme ve halkoylamasına katılma hakkına sahiptir. Ancak üç grup oy kullanamaz:"
  },
  {
    "type": "bullets",
    "items": [
      "Silah altında bulunan **er ve erbaşlar** (subay ve astsubaylar oy kullanabilir)",
      "**Askeri öğrenciler**",
      "Taksirli suçlardan hüküm giyenler hariç **ceza infaz kurumlarında bulunan hükümlüler** (yani **kasıtlı suçtan hükümlüler** oy kullanamazken, **taksirli suçtan hükümlüler** cezaevinde olsalar dahi oy kullanabilirler; ayrıca tutuklular da hüküm giymedikleri için oy kullanır)."
    ]
  },
  {
    "type": "paragraph",
    "text": "**2017 anayasa değişikliği** ile **Anayasa m. 75** değiştirilerek TBMM üye tamsayısı **550''den 600 milletvekiline** çıkarılmış, milletvekili seçilme yaşı **18**''e indirilmiştir (1982''nin ilk halinde 30, 2006''da 25 idi; Cumhurbaşkanı seçilme yaşı ise **40**''tır). **Anayasa m. 77**''ye göre TBMM ve Cumhurbaşkanlığı seçimleri **5 yılda bir aynı gün** birlikte yapılır; bu eşzamanlılık yasama ve yürütme arasındaki uyumun sağlanmasını ve koalisyon dönemlerindeki erken seçim belirsizliğinin azaltılmasını hedefler. **Anayasa m. 78** uyarınca seçimlerin geriye bırakılmasının **tek bir anayasal sebebi** vardır, o da **Savaş**tır (deprem, afet veya salgın sebebiyle seçimler ertelenemez; savaş nedeniyle erteleme kararını da yalnızca TBMM 1 yıl için verebilir). Ara seçimler ise genel seçimlere **1 yıl kala** yapılamaz; bunun tek istisnası **bir ilin veya seçim çevresinin TBMM''de hiç milletvekilinin kalmaması**dır (bu durumda boşalmayı takip eden 90 günden sonraki ilk pazar günü ara seçim yapılır)."
  },
  {
    "type": "heading",
    "text": "Yüksek Seçim Kurulu (YSK) ve Siyasi Partiler"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 79** uyarınca seçimlerin genel yönetim ve denetimini **Yüksek Seçim Kurulu (YSK)** yürütür. YSK **7 asıl ve 4 yedek** üyeden oluşur; üyelerin 6''sı Yargıtay, 5''i Danıştay Genel Kurullarınca kendi üyeleri arasından gizli oyla seçilir. Seçim sürecinde itirazların hızla karara bağlanması ve seçim takviminin kesintiye uğramaması amacıyla **YSK''nın verdiği kararlar kesindir**; bu kararlar aleyhine **Anayasa Mahkemesi''ne bireysel başvuru dahil hiçbir yargı merciine başvurulamaz**."
  },
  {
    "type": "paragraph",
    "text": "Siyasi partilere ilişkin kurallarda ise güncel baraj oranlarını karıştırmamalısın:"
  },
  {
    "type": "bullets",
    "items": [
      "**Genel seçim barajı:** 2022 yılında yapılan kanun değişikliği ile yüzde 10''dan **%7''ye** indirilmiştir.",
      "**Devlet (Hazine) yardımı barajı:** Siyasi Partiler Kanunu uyarınca genel seçimlerde barajı geçemese dahi geçerli oyların en az **%3''ünü** alan siyasi partilere Hazine''den mali yardım yapılır.",
      "**Parti kapatma davası:** Siyasi partilerin kapatılması davası **Yargıtay Cumhuriyet Başsavcısı** tarafından açılır; davayı inceleyip kapatma veya devlet yardımından yoksun bırakma kararını ise **Anayasa Mahkemesi** (**m. 149** uyarınca toplantıya katılan üyelerin **2/3 nitelikli çoğunluğu** ile) verir."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Seçim kurallarında üç klasik ÖSYM tuzağı vardır: 1. Cezaevindeki **kasıtlı suç** hükümlüleri oy kullanamaz; ancak **taksirli suç** hükümlüleri oy kullanabilir! 2. Güncel genel seçim barajı **%7**, Hazine yardımı alma barajı ise **%3**tür. 3. Parti kapatma davasını **Yargıtay Cumhuriyet Başsavcısı** açar, kararı **Anayasa Mahkemesi** (2/3 çoğunlukla) verir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Bir doğal afet veya salgın durumunda TBMM seçimleri erteleyebilir mi?\" Anayasa m. 78''e göre seçimlerin ertelenmesinin tek anayasal sebebi **Savaş**tır; afet veya ekonomik kriz gerekçesiyle seçimler ertelenemez."
  },
  {
    "type": "key_points",
    "items": [
      "TBMM üye tamsayısı 600, seçilme yaşı 18, Cumhurbaşkanı seçilme yaşı 40''tır; seçimler 5 yılda bir aynı gün yapılır.",
      "Er/erbaşlar, askeri öğrenciler ve kasıtlı suç hükümlüleri oy kullanamaz; taksirli suç hükümlüleri oy kullanabilir.",
      "Seçimlerin tek erteleme sebebi savaştır; bir ilin hiç vekili kalmaması 1 yıl kala ara seçim yasağının tek istisnasıdır.",
      "YSK kararları kesindir ve AYM''ye dahi başvurulamaz; seçim barajı %7, Hazine yardımı barajı %3''tür."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.04',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  4,
  'Bölüm 4: Anayasanın Değiştirilmesi Usulü (m. 175) ve Anayasa Yargısı',
  '1982 Anayasası sert (katı) bir anayasa olduğu için değiştirilmesi olağan kanunlardan daha zor şartlara ve nitelikli çoğunluklara bağlanmıştır.  Anayasanın üstünlüğünü ve toplumsal uzlaşıyı korumak amacıyla öngörülen bu usul, basit bir parlamento çoğunluğunun temel anayasal kuralları tek taraflı biçimde değiştirmesini engeller.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası sert (katı) bir anayasa olduğu için değiştirilmesi olağan kanunlardan daha zor şartlara ve nitelikli çoğunluklara bağlanmıştır. Anayasanın üstünlüğünü ve toplumsal uzlaşıyı korumak amacıyla öngörülen bu usul, basit bir parlamento çoğunluğunun temel anayasal kuralları tek taraflı biçimde değiştirmesini engeller. **Anayasa m. 175** uyarınca bir anayasa değişikliği süreci üç aşamalı sıkı kurallara tabidir:"
  },
  {
    "type": "paragraph",
    "text": "1. **Teklif:** Anayasa değişikliği yalnızca TBMM üye tamsayısının en az **1/3''ü (200 milletvekili)** tarafından yazılı olarak teklif edilebilir (yürütme organı anayasa değişikliği teklif edemez). 2. **Görüşme ve Oylama:** Anayasa değişiklik teklifleri Genel Kurul''da **ivedilikle görüşülemez**; **iki defa** görüşülür ve iki görüşme arasında en az **48 saatlik** (\"serinleme süresi\") bir zaman geçmesi anayasal zorunluluktur. Bu bekleme süresi, milletvekillerinin değişiklik üzerinde yeniden düşünmesine ve kamuoyunun tartışmasına imkan tanır. Teklifin kabulü için en az TBMM üye tamsayısının **3/5''inin (360 milletvekili)** **gizli oyu** şarttır. 3. **Cumhurbaşkanı''nın Onay / Referandum Yetkisi:** Kabul oyu sayısına göre Cumhurbaşkanı''nın kullanabileceği yetkiler farklılaşır; mecliste daha düşük nitelikli çoğunlukla kabul edilen değişikliklerde halkoylaması zorunlu hale gelerek doğrudan halkın onayı aranır."
  },
  {
    "type": "table",
    "headers": [
      "Meclisteki Kabul Oyu",
      "Cumhurbaşkanı''nın Yetkisi",
      "Halkoylaması (Referandum) Durumu"
    ],
    "rows": [
      [
        "360 – 399 arası (3/5 ile 2/3 arası)",
        "Doğrudan **onaylayamaz**; Meclis''e geri gönderebilir",
        "Geri göndermezse **zorunlu halkoylamasına** sunar"
      ],
      [
        "400 ve üzeri (2/3 ve üzeri)",
        "Doğrudan **onaylayabilir** veya Meclis''e geri gönderebilir",
        "İsterse **ihtiyari halkoylamasına** sunabilir"
      ],
      [
        "360''ın altı (359 ve altı)",
        "Teklif reddedilmiş sayılır",
        "Cumhurbaşkanı''na gitmez"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Cumhurbaşkanı''nın Meclis''e geri gönderdiği bir anayasa değişikliğini TBMM üye tamsayısının **2/3''ü (400 milletvekili)** ile tekrar kabul etmesi halinde dahi Cumhurbaşkanı dilerse bu değişikliği halkoylamasına sunabilir; geri gönderilen metin 360–399 arası oyla yeniden kabul edilirse yine halkoylamasına gitmek zorundadır. Halkoylamasında geçerli oyların salt çoğunluğunun (%50''den fazlasının) \"evet\" oyu vermesi halinde anayasa değişikliği kabul edilmiş olur ve Resmi Gazete''de yayımlanarak yürürlüğe girer."
  },
  {
    "type": "heading",
    "text": "Anayasa Değişikliklerinin Yargısal Denetimi (m. 148)"
  },
  {
    "type": "paragraph",
    "text": "Anayasa değişikliklerinin Anayasa Mahkemesi tarafından denetlenmesi, normal kanunların denetiminden çok daha sınırlıdır; çünkü anayasa değişikliğini yapan iktidar tali kurucu iktidardır ve içeriğe yönelik siyasal tercih kural olarak yasamaya aittir. **Anayasa m. 148**''in açık hükmüne göre normal kanunlar hem şekil hem de esas bakımından denetlenebilirken, **anayasa değişiklikleri YALNIZCA ŞEKİL BAKIMINDAN denetlenebilir, esas (içerik) denetimi yapılamaz!**"
  },
  {
    "type": "paragraph",
    "text": "Anayasa Mahkemesi anayasa değişikliklerinde şekil denetimi yaparken yalnızca üç unsuru inceler: **teklif çoğunluğuna (200)** uyulup uyulmadığı, **oylama çoğunluğuna (360)** uyulup uyulmadığı ve **ivedilikle görüşülememe (iki görüşme ve 48 saat)** şartına uyulup uyulmadığı. Dava açma süresi normal kanunlarda 60 gün iken, **anayasa değişikliklerinde şekil bozukluğu nedeniyle iptal davası açma süresi YALNIZCA 10 GÜNDÜR!** Bu davayı yalnızca **Cumhurbaşkanı** veya **TBMM üye tamsayısının 1/5''i (120 milletvekili)** açabilir. Anayasa Mahkemesi''nin anayasa değişikliğini şekilden iptal edebilmesi için ise **Anayasa m. 149** gereği toplantıya katılan üyelerin **2/3 nitelikli çoğunluğu** gerekir (normal kanun iptallerinde salt çoğunluk yeterlidir)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Anayasa değişikliği usulünde üç sayı ve kural sıkça karıştırılır: - **Teklif** için 1/3 (**200**), **kabul** için en az 3/5 (**360**), doğrudan onay için 2/3 (**400**) milletvekili gerekir. - 360-399 arası oyla kabul edilen değişikliği Cumhurbaşkanı asla doğrudan onaylayamaz; veto etmezse referanduma sunmak zorundadır. - Anayasa değişikliğinde iptal davası süresi 60 gün değil **10 gün**dür ve yalnızca **şekil** yönünden denetim yapılır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"TBMM''de 375 milletvekilinin gizli oyuyla kabul edilen bir anayasa değişikliği hakkında Cumhurbaşkanı ne yapamaz?\" 375 oy 360–399 bandında kaldığı için Cumhurbaşkanı değişikliği **doğrudan onaylayarak Resmi Gazete''de yayımlayamaz**; ya Meclis''e geri gönderir ya da zorunlu referanduma sunar. Aynı şekilde Anayasa Mahkemesi de Anayasa m. 148 gereğince bu değişikliğin içeriğini esas yönünden denetleyemez, yalnızca teklif, oylama çoğunluğu ve iki görüşme arasındaki süreye ilişkin şekil şartlarını inceleyebilir."
  },
  {
    "type": "key_points",
    "items": [
      "Anayasa değişikliği teklifi 1/3 (200), kabulü en az 3/5 (360) gizli oyla yapılır; iki görüşme arasında en az 48 saat beklenir.",
      "360–399 oyda referandum zorunludur; 400+ oyda Cumhurbaşkanı doğrudan onaylayabilir veya ihtiyari referanduma götürebilir; halkoylamasında salt çoğunluk aranır.",
      "Anayasa değişiklikleri yalnızca şekil yönünden, 10 gün içinde ve 2/3 AYM çoğunluğuyla iptal edilebilir."
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
  'vatandaslik.1982_anayasasi_ve_temel_ilkeler.05',
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  5,
  'Bölüm 5: 2017 Anayasa Değişikliği ile Gelen Temel Dönüşüm',
  '16 Nisan 2017 halkoylamasıyla kabul edilen 6771 sayılı Kanun, 1982 Anayasası''nın hükümet sistemini kökten değiştirerek parlamenter sistemden Cumhurbaşkanlığı Hükümet Sistemine geçişi sağladı.  Bu reformla birlikte yürütme organındaki çift başlılık (Cumhurbaşkanı + Başbakan) ortadan kaldırılarak yürütme yetkisi ve görevi tek başına doğrudan halk tarafından seçilen Cumhurbaşkanına verildi; böylece yasama ve yürütme organlarının birbirinden kesin çizgilerle ayrıldığı sert kuvvetler ayrılığına geçildi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "16 Nisan 2017 halkoylamasıyla kabul edilen **6771 sayılı Kanun**, 1982 Anayasası''nın hükümet sistemini kökten değiştirerek parlamenter sistemden **Cumhurbaşkanlığı Hükümet Sistemi**ne geçişi sağladı. Bu reformla birlikte yürütme organındaki çift başlılık (Cumhurbaşkanı + Başbakan) ortadan kaldırılarak yürütme yetkisi ve görevi tek başına doğrudan halk tarafından seçilen **Cumhurbaşkanı**na verildi; böylece yasama ve yürütme organlarının birbirinden kesin çizgilerle ayrıldığı sert kuvvetler ayrılığına geçildi. Değişikliklerin önemli bir kısmı 24 Haziran 2018 genel seçimleriyle birlikte yürürlüğe girdi."
  },
  {
    "type": "heading",
    "text": "Kaldırılan ve Yeni Kurulan Kurumlar"
  },
  {
    "type": "paragraph",
    "text": "2017 reformuyla birlikte Türk anayasa ve idare hukukundan çıkarılan kurum ve kavramları bilmek sınav sorularını çözerken kritik önem taşır:"
  },
  {
    "type": "table",
    "headers": [
      "Kaldırılan Kurum / İşlem",
      "Yerine Gelen veya Kalan Düzenleme"
    ],
    "rows": [
      [
        "Başbakanlık ve Bakanlar Kurulu",
        "Yürütme tek başına **Cumhurbaşkanı** ve atadığı Cumhurbaşkanı yardımcıları ile bakanlara geçti"
      ],
      [
        "Kanun Tasarısı (Yürütmenin yasa teklifi)",
        "Kalktı; yalnızca milletvekilleri **kanun teklifi** verebilir (bütçe hariç)"
      ],
      [
        "Kanun Hükmünde Kararname (KHK) ve Tüzük",
        "Kalktı; **Cumhurbaşkanlığı Kararnamesi (CBK)** ve yönetmelikler getirildi"
      ],
      [
        "Gensoru ve Güvenoyu",
        "Kalktı; yürütme artık meclisten güvenoyu almaz (meclis denetimi yazılı soru, meclis araştırması, genel görüşme, meclis soruşturması)"
      ],
      [
        "Sıkıyönetim",
        "Kalktı; olağanüstü yönetim usulü olarak yalnızca **OHAL** kaldı"
      ],
      [
        "Askeri Yargıtay ve AYİM",
        "Kaldırıldı; disiplin mahkemeleri hariç askeri mahkemeler kurulamaz"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Bu dönüşüm kapsamında **2017 değişikliğinin** getirdiğini zannettiğin ancak kaldırılmayan kurumlara da dikkat etmelisin: Örneğin **Yüksek Seçim Kurulu (YSK)** 1961''den beri varlığını sürdürmektedir, kaldırılmamıştır. Aynı şekilde **Milli Güvenlik Kurulu (MGK)** ve **Anayasa Mahkemesi (AYM)** de varlığını korumaktadır (AYM üye sayısı Askeri Yargıtay ve AYİM''in kaldırılmasıyla **17''den 15''e** düşürülmüştür). Ayrıca Cumhurbaşkanı''nın partisiyle ilişiğinin kesilmesi zorunluluğu kaldırılarak \"partili cumhurbaşkanlığı\" yolu açılmış ve bakanların milletvekili olma şartı kaldırılmıştır (milletvekili iken bakan atanan kişinin milletvekilliği sona erer)."
  },
  {
    "type": "heading",
    "text": "Olağan CBK ile OHAL CBK Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Yeni sistemde yürütmenin düzenleyici işlemleri içinde **Cumhurbaşkanlığı Kararnamesi (CBK)** merkezi bir yere sahiptir. Ancak **olağan dönemde** çıkarılan CBK ile **Olağanüstü Hal (OHAL)** döneminde çıkarılan CBK arasında çok keskin yargısal denetim farkı vardır. Olağan CBK yalnızca yürütme yetkisine ilişkin konularda çıkarılabilir; temel hak ve siyasi hakları düzenleyemez, kanunla açıkça düzenlenen konularda çıkarılamaz, kanunla çelişmesi halinde kanun hükümleri uygulanır ve Anayasa Mahkemesi''nin hem şekil hem esas yönünden yargı denetimine tabidir. Buna karşılık **Anayasa m. 148**''in açık hükmü uyarınca **olağanüstü hallerde çıkarılan Cumhurbaşkanlığı kararnamelerinin şekil ve esas bakımından Anayasa''ya aykırılığı iddiasıyla Anayasa Mahkemesi''nde dava açılamaz**; yani OHAL CBK''ları Anayasa Mahkemesi denetimine kesinlikle kapalıdır ve çıkarıldığı gün TBMM onayına sunulur."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "2017 Anayasa Değişikliği ile kaldırılan temel başlıkları **B-K-T-G-S-A** şeklinde özetleyebilirsin: - **B**aşbakanlık ve Bakanlar Kurulu - **K**anun Tasarısı ve KHK - **T**üzük - **G**ensoru ve Güvenoyu - **S**ıkıyönetim - **A**skeri Yargıtay, AYİM ve askeri mahkemeler (disiplin mahkemeleri hariç)"
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM 2017 değişikliğinde iki noktayı tuzak olarak kullanır: 1. \"Hükümet kanun tasarısı verebilir\" ifadesi 2017 sonrası **yanlıştır**; yürütme (bütçe kanun teklifi hariç) artık yasa teklif edemez, yalnızca milletvekilleri **kanun teklifi** verir. 2. **Olağan CBK** AYM denetimine açıkken, **OHAL CBK** (m. 148) şekil ve esas bakımından AYM denetimine tamamen kapalıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"2017 Anayasa değişikliği ile aşağıdakilerden hangisi yürütmenin denetim araçları arasından çıkarılmıştır?\" Meclis araştırması, genel görüşme, meclis soruşturması ve yazılı soru devam etmektedir; çıkarılan ise Bakanlar Kurulu''nu düşürme aracı olan **gensoru**dur (ayrıca sözlü soru da kaldırılmıştır). Bunun yanında yeni sistemde Cumhurbaşkanı hakkında görevle ilgili suç işlediği iddiasıyla meclis soruşturması açılabilmesi için TBMM üye tamsayısının salt çoğunluğu (301) ile önerge verilmesi, 3/5 (360) gizli oyla soruşturma açılması ve 2/3 (400) gizli oyla Yüce Divan''a sevk kararı alınması gerekir."
  },
  {
    "type": "key_points",
    "items": [
      "2017 reformuyla Başbakanlık, Bakanlar Kurulu, Kanun Tasarısı, KHK, Tüzük, Gensoru, Güvenoyu, Sıkıyönetim, Askeri Yargıtay ve AYİM kaldırıldı.",
      "Yürütme bütçe dışında kanun teklif edemez; kanun teklifini yalnızca milletvekilleri verir.",
      "Olağan CBK AYM denetimine açıktır; OHAL CBK ise şekil ve esas bakımından AYM denetimine kapalıdır (m. 148).",
      "Askeri Yargıtay ve AYİM kalktığı için AYM üye sayısı 17''den 15''e inmiştir; YSK ve MGK varlığını sürdürmektedir; Cumhurbaşkanlığı Hükümet Sistemi''nde sert kuvvetler ayrılığı esas alınmıştır."
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
