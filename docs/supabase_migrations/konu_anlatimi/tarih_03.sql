-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Tarih · Osmanlı Kültür ve Uygarlığı
-- Kaynak: docs/konu_anlatimi/tarih/03_osmanli_kultur_ve_uygarligi.md
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
  'tarih.osmanli_kultur_ve_uygarligi.01',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  1,
  'Bölüm 1: Devlet Anlayışı, Veraset, Şehzade Eğitimi ve Saray',
  'Osmanlı Devleti hem eski Türk töresinden hem de İslam devlet geleneğinden beslenen güçlü bir merkeziyetçi yapı kurdu.  Beylikten imparatorluğa geçiş sürecinde fethedilen geniş toprakların tek merkezden yönetilebilmesi için devlet otoritesi, saray teşkilatı ve veraset kuralları zamanın ihtiyaçlarına göre sürekli yeniden düzenlendi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı Devleti hem eski Türk töresinden hem de İslam devlet geleneğinden beslenen güçlü bir merkeziyetçi yapı kurdu. Beylikten imparatorluğa geçiş sürecinde fethedilen geniş toprakların tek merkezden yönetilebilmesi için devlet otoritesi, saray teşkilatı ve veraset kuralları zamanın ihtiyaçlarına göre sürekli yeniden düzenlendi. Hükümdarlık sembolleri arasında **hutbe okutmak, sikke (para) bastırmak, tuğra, sancak, otağ, nevbet (mehter)** ve **yay** yer alırdı. Buna karşılık **ok** kesinlikle bir hakimiyet sembolü değildir; eski Türk geleneğinde bağlılık bildiren veya davet amacı taşıyan bir işarettir."
  },
  {
    "type": "paragraph",
    "text": "Güncel MEB müfredatı ve dönemin sikkeleri doğrultusunda Osmanlı''da ilk kez **Sultan** unvanını kullanan hükümdar **Orhan Gazi**dir (eski kaynaklarda I. Murat geçtiği için bu güncel ayrıma dikkat etmelisin). Padişahlar tahta çıktıklarında meşruiyetlerini dini ve töresel olarak pekiştirmek için Eyüp Sultan Türbesi''nde **Kılıç Alayı** ile kılıç kuşanır, askerlerin sadakatini sağlamak amacıyla da her taht değişikliğinde bir kez **Cülus Bahşişi** dağıtılırdı (Yıldırım Bayezid döneminde gelenekleşti, Fatih tarafından kanunlaştırıldı). Tahta çıkışta ayrıca **Müsadere** adı verilen uygulamayla haksız kazanç sağlayan veya vefat eden üst düzey yöneticilerin mallarına devletçe el konulabilirdi; bu uygulama özel mülkiyetin ve aristokrasinin padişah gücünü gölgelemesini engellemek içindi (atama ve maaş belgesi olan **Beratname** ile karıştırma)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM soru bankalarının en klasik iki tuzağı buradadır: Birincisi, \"Ok ve Yay\" günlük dilde birlikte anıldığı için **Ok**u hakimiyet sembolüymüş gibi şıklara koyarlar; **Yay hakimiyet sembolüdür, Ok değildir**. İkincisi, **Cülus Bahşişi** yalnızca taht değiştiğinde bir defa verilirken, **Ulufe** yeniçerilere her üç ayda bir ödenen düzenli maaştır."
  },
  {
    "type": "heading",
    "text": "Veraset Sistemindeki Değişimler"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı veraset anlayışı, taht kavgalarını azaltmak ve merkezi otoriteyi güçlendirmek amacıyla dört aşamalı bir dönüşüm geçirdi:"
  },
  {
    "type": "paragraph",
    "text": "1. **Osman ve Orhan Gazi dönemi:** \"Ülke hanedanın ortak malıdır\" anlayışı geçerliydi. 2. **I. Murat dönemi:** \"Ülke padişah ve oğullarınındır\" kuralı getirilerek amca ve kardeş çocuklarının hak iddiası engellendi. 3. **Fatih Sultan Mehmet (Kanunname-i Ali Osman):** \"Ülke yalnızca padişahındır\" ilkesi ve **Kardeş Katli** yasalaştı. 4. **I. Ahmet dönemi:** **Ekber ve Erşed** (en yaşlı ve en olgun hanedan üyesinin tahta çıkması) sistemi getirildi."
  },
  {
    "type": "paragraph",
    "text": "Dikkat et: Ekber ve Erşed sistemi taht kavgalarını artırmamış, aksine tahta kimin geçeceğini hukuken kesinleştirerek **taht kavgalarını bitirmiştir**. Ancak şehzadelerin sancağa gönderilmeden sarayda **Kafes Usulü**yle yetiştirilmesine yol açtığı için devlet tecrübesinden yoksun padişahların tahta çıkmasına neden olmuştur."
  },
  {
    "type": "heading",
    "text": "Şehzade Eğitimi ve Topkapı Sarayı"
  },
  {
    "type": "paragraph",
    "text": "Şehzadeler deneyimli eğitmenler olan **Lala**lar eşliğinde (Selçuklu''daki Atabey''in karşılığı) genellikle Anadolu''daki önemli sancaklara yönetici olarak gönderilirdi. **Amasya, Manisa (Darü''s-Saltana), Trabzon, Kütahya ve Konya** başlıca şehzade sancaklarıdır; **Diyarbakır** ise bir eyalet merkezi olup asla şehzade sancağı olmamıştır. **Anadolu dışındaki tek şehzade sancağı** ise Kırım''daki **Kefe**dir (Yavuz Sultan Selim ve Kanuni burada görev yapmıştır)."
  },
  {
    "type": "paragraph",
    "text": "Devletin yönetim merkezi olan **Topkapı Sarayı** üç ana bölümden oluşurdu:"
  },
  {
    "type": "bullets",
    "items": [
      "**Birun (Dış Saray):** Divan toplantılarının yapıldığı, elçilerin kabul edildiği ve dış hizmetlerin yürütüldüğü alandır.",
      "**Enderun (İç Saray):** Temelleri II. Murat döneminde Edirne''de atılan, Fatih tarafından Topkapı''da kurumsallaştırılan ve **devşirme kökenli** yetenekli çocukların devlet adamı olarak yetiştirildiği yüksekokul ve iç saraydır. Has Oda görevlilerinden **Çuhadar Ağa** padişahın kaftanından, **Silahtar** silahından, **Rikabdar** ise çizme ve üzengisinden sorumluydu.",
      "**Harem:** Padişahın özel aile yaşamının geçtiği ve cariyelere protokol ile sanat eğitimi verilen bölümdür."
    ]
  },
  {
    "type": "paragraph",
    "text": "Sarayın devasa mutfak teşkilatına **Matbah-ı Amire**, saraya bağlı çalışan resmi sanatçı ve zanaatkar loncasına ise **Ehl-i Hıref** denirdi. Buna karşılık **Bab-ı Ali** sarayın bir bölümü değil, 18. yüzyıldan itibaren Sadrazamın resmi makamı ve hükümet konağıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Fatih Sultan Mehmet''in Kardeş Katli yasasını çıkarması ve I. Ahmet''in Ekber ve Erşed sistemini getirmesinin ortak amacı nedir?\" Her iki düzenlemenin de ortak amacı **merkezi otoriteyi korumak ve taht kavgalarını önlemektir**; II. Mahmut döneminde bile padişahın seçimle belirlenmesi gibi bir uygulama asla olmamıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Yay hakimiyet sembolüdür, Ok değildir; ilk Sultan unvanını Orhan Gazi kullanmıştır.",
      "Ekber ve Erşed taht kavgalarını kesin olarak bitirdi, ancak Kafes Usulü yüzünden deneyimsiz padişahlara zemin hazırladı.",
      "Anadolu dışındaki tek şehzade sancağı Kırım''daki Kefe''dir; Diyarbakır şehzade sancağı değildir.",
      "Enderun devşirmelerin yetiştiği iç saray mektebidir; Bab-ı Ali ise sarayın değil sadrazamlığın merkezidir."
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
  'tarih.osmanli_kultur_ve_uygarligi.02',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  2,
  'Bölüm 2: Merkez Yönetimi: Divan-ı Hümayun ve Yönetici Sınıflar',
  'Orhan Gazi döneminde kurulan Divan-ı Hümayun, devletin siyasi, askeri, idari ve hukuki işlerinin görüşüldüğü en yüksek kurumdu; aynı zamanda halkın şikayetlerinin dinlendiği en üst yargı merciiydi.  Kuruluş yıllarında küçük bir danışma meclisi niteliğinde olan divan, devlet büyüdükçe yasama, yürütme ve yüksek yargı işlerinin yürütüldüğü kapsamlı bir kabineye dönüştü.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Orhan Gazi döneminde kurulan **Divan-ı Hümayun**, devletin siyasi, askeri, idari ve hukuki işlerinin görüşüldüğü en yüksek kurumdu; aynı zamanda halkın şikayetlerinin dinlendiği en üst yargı merciiydi. Kuruluş yıllarında küçük bir danışma meclisi niteliğinde olan divan, devlet büyüdükçe yasama, yürütme ve yüksek yargı işlerinin yürütüldüğü kapsamlı bir kabineye dönüştü. Fatih Sultan Mehmet dönemine kadar divana bizzat padişah başkanlık ederken, Fatih''ten itibaren üyelerin padişahın heybetinden çekinmeden fikirlerini özgürce tartışabilmesi için başkanlık **Sadrazam**a bırakıldı."
  },
  {
    "type": "paragraph",
    "text": "Bu değişiklik padişahın yetkilerini devrettiği anlamına gelmez; ancak padişahın görüşmeleri \"Kasr-ı Adl\" penceresinden izlemesi ve son sözü her zaman kendisinin söylemesi nedeniyle divanın bir karar organından çok padişaha sunulan bir **danışma organı** niteliği kazanmasına yol açtı. Divanda alınan tüm siyasi, askeri ve idari kararlar Beylikçi Kalemi tarafından **Mühimme Defterleri**ne kaydedilirdi. Böylece imparatorluğun dört bir yanına gönderilen hükümlerin resmi arşivi oluşturulur ve devlet yönetiminde kurumsal süreklilik sağlanırdı."
  },
  {
    "type": "table",
    "headers": [
      "Defter Türü",
      "Tutulduğu Yer / Görevli",
      "İçeriği"
    ],
    "rows": [
      [
        "Mühimme Defterleri",
        "Divan-ı Hümayun (Beylikçi Kalemi)",
        "Divan''da alınan tüm devlet kararları"
      ],
      [
        "Tahrir Defterleri",
        "Nişancı",
        "Fethedilen toprak, nüfus ve vergi kayıtları"
      ],
      [
        "Şeriyye Sicilleri",
        "Kadı",
        "Yerel mahkeme kararları, noter ve belediye işlemleri"
      ],
      [
        "Tereke (Kassam) Defterleri",
        "Kadı / Kassam",
        "Ölen kişinin mirası, borçları ve eşya dökümü"
      ]
    ]
  },
  {
    "type": "heading",
    "text": "Divan Üyeleri ve Görev Ayrımı"
  },
  {
    "type": "bullets",
    "items": [
      "**Sadrazam (Veziriazam):** Padişahın mutlak vekilidir, mührünü taşır. Padişah sefere çıkmadığında orduyu **Serdar-ı Ekrem** unvanıyla komuta eder; kendisi seferdeyken başkentteki işlere **Sadaret Kaymakamı** vekalet eder.",
      "**Kazasker (Kadıasker):** Rumeli ve Anadolu olmak üzere iki tanedir. Günümüzün Adalet ve Milli Eğitim bakanı gibi çalışır; **kadı ve müderrislerin atamasını yapar**.",
      "**Şeyhülislam:** Divanın sürekli üyesi olmayıp gerektiğinde çağrılır; çıkarılan kanunların ve yapılan işlerin dine uygunluğu hakkında **fetva** verir (padişah fetva veremez, ferman çıkarır; Şeyhülislam da kadı atayamaz!).",
      "**Nişancı (Tevkii):** Ferman ve beratlara padişahın tuğrasını çeker, tımar ve toprak kayıtlarını (**Tahrir Defterleri**) tutar, örfi hukukun başuzmanıdır.",
      "**Reisülküttab:** Başlangıçta Nişancı''ya bağlı bir katipti; ancak 17. yüzyılda özellikle **1699 Karlofça Antlaşması** sonrasında diplomasinin önem kazanmasıyla bürokrasiden ayrılarak **Dışişleri Bakanlığı (Hariciye)** niteliği kazandı.",
      "**Defterdar:** Devletin gelir ve giderlerini yöneten, bütçeyi hazırlayan ve mali disiplini sağlayan maliye bakanıdır (Rumeli ve Anadolu defterdarı olarak ikiye ayrılır).",
      "**Kaptan-ı Derya ve Yeniçeri Ağası:** Vezir rütbesinde olduklarında ve başkentte bulunduklarında kendi alanlarıyla ilgili görüşmeler için divan toplantılarına katılırlardı."
    ]
  },
  {
    "type": "paragraph",
    "text": "Merkez teşkilatında **Bab-ı Ali** (Paşa Kapısı) kavramının zamanla öne çıkması da yönetim tarihinin önemli bir dönüşümüdür. 17. ve 18. yüzyıllardan itibaren Sadrazamın resmi konağı olan Bab-ı Ali, divan toplantılarının seyrekleşmesiyle devlet işlerinin fiilen yürütüldüğü hükümet merkezine dönüşmüştür."
  },
  {
    "type": "heading",
    "text": "Yönetici Sınıflar: Seyfiye, İlmiye ve Kalemiye"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı yönetici sınıfı (Askeri sınıf) vergi vermeyen ve devlet hizmetinde çalışan üç ana koldan oluşurdu; buna karşılık yönetilen kesim olan **Reaya** ise tarım, ticaret ve zanaatla uğraşıp vergi öderdi. Yönetici sınıflar görev alanlarına göre net biçimde ayrılmıştı: kılıç ve yönetim erbabı **Seyfiye** (Sadrazam, Vezirler, Yeniçeri Ağası, Kaptan-ı Derya, Beylerbeyi), bürokrasi ve yazışma erbabı **Kalemiye** (Nişancı, Defterdar, Reisülküttab) ve din-eğitim-hukuk erbabı **İlmiye** (Şeyhülislam, Kazasker, Kadı, Müderris). Bu üçlü yapı, bir sınıfın diğerinin yetki alanına girmesini engelleyerek yönetim içinde doğal bir denge mekanizması oluştururdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin en sevdiği iki tuzak bu sınıflandırmadadır: Birincisi, **Kazasker** isminde \"asker\" kelimesi geçtiği için adaylar onu Seyfiye sanır; oysa Kazasker kesinlikle **İlmiye** sınıfının en yüksek üyelerindendir. İkincisi, devşirmeler Seyfiye ve Kalemiye sınıflarında Sadrazamlığa kadar yükselebilirken **asla İlmiye sınıfına giremezler**; Kazasker, Kadı ve Şeyhülislam olabilmek için mutlaka **doğuştan Müslüman ve medrese mezunu** olmak şarttır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Kadıların atanması, örfi hukuk belgelerine tuğra çekilmesi ve dış yazışmaların yürütülmesi görevleri sırasıyla kimlere aittir?\" Cevap: Kadı ataması **Kazasker**e (Şeyhülislam''a değil), tuğra ve tahrir **Nişancı**ya, 17. yüzyıl sonrası dış ilişkiler ise **Reisülküttab**a aittir."
  },
  {
    "type": "key_points",
    "items": [
      "Divan kararları Mühimme Defterine, toprak-vergi kayıtları Tahrir Defterine, miras kayıtları Tereke Defterine yazılır.",
      "Kazasker isminde asker geçse de İlmiye sınıfındadır; kadı ve müderrisleri Kazasker atar, Şeyhülislam yalnızca fetva verir.",
      "Devşirmeler Sadrazam olabilir ama asla Kazasker, Kadı veya Şeyhülislam olamaz.",
      "Reisülküttab 17. yüzyılda Nişancı''dan ayrılarak Dışişleri makamına dönüşmüştür."
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
  'tarih.osmanli_kultur_ve_uygarligi.03',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  3,
  'Bölüm 3: Taşra Yönetimi, Eyalet Türleri ve Hukuk Sistemi',
  'Klasik dönemde Osmanlı taşra teşkilatı yukarıdan aşağıya Eyalet (Beylerbeyi) -> Sancak (Sancakbeyi) -> Kaza (Kadı) -> Köy (Köy Kethüdası) biçiminde örgütlenmişti.  Geniş imparatorluk coğrafyasında merkezi otoriteyi korumak için idare, güvenlik ve yargı yetkileri birbirini denetleyecek şekilde dağıtılmıştı; beylerbeyi ve sancakbeyi asker toplar ve asayişi sağlar, ancak kadının hukuki kararı olmadan kimseye ceza veremezdi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Klasik dönemde Osmanlı taşra teşkilatı yukarıdan aşağıya **Eyalet (Beylerbeyi) -> Sancak (Sancakbeyi) -> Kaza (Kadı) -> Köy (Köy Kethüdası)** biçiminde örgütlenmişti. Geniş imparatorluk coğrafyasında merkezi otoriteyi korumak için idare, güvenlik ve yargı yetkileri birbirini denetleyecek şekilde dağıtılmıştı; beylerbeyi ve sancakbeyi asker toplar ve asayişi sağlar, ancak kadının hukuki kararı olmadan kimseye ceza veremezdi. Dikkat et: Kazaların hem mülki (idari) amiri hem belediye başkanı hem de mahkeme hakimi bizzat **Kadı**dır; **Subaşı** kazanın sadece güvenliğinden sorumludur."
  },
  {
    "type": "paragraph",
    "text": "Başkent İstanbul ise imparatorluğun vitrini ve güvenlik merkezi olduğu için özel bir yönetime sahipti: Genel düzeni Sadrazam sağlarken, İstanbul''un en yüksek mülki ve adli amiri **Taht Kadısı (İstanbul Kadısı)**, belediye işlerinin sorumlusu ise **Şehremini** idi. Güvenlik işlerini yeniçeri ağası yürütürdü. Tanzimat döneminde 1854''te modern belediyenin temeli olan **Şehremaneti** kuruldu; **1864 Vilayet Nizamnamesi** ile de eyalet sistemi kaldırılarak **Vilayet (Vali) -> Liva/Sancak (Mutasarrıf) -> Kaza (Kaymakam) -> Nahiye (Müdür) -> Köy (Muhtar)** düzenine geçildi (ilk pilot bölge **Mithat Paşa** yönetimindeki **Tuna Vilayeti** oldu; burada açılan yollar, okullar ve emniyet sandıkları tüm ülkeye örnek teşkil etti)."
  },
  {
    "type": "heading",
    "text": "Eyaletlerin Üçlü Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı eyaletlerini merkeze uzaklıkları, fetih şartları ve vergi toplama biçimlerine göre üç gruba ayırmak sınav sorularını kolayca çözmeni sağlar:"
  },
  {
    "type": "table",
    "headers": [
      "Eyalet Türü",
      "Temel Özelliği",
      "Örnekler"
    ],
    "rows": [
      [
        "Salyanesiz (Yıllıksız)",
        "Merkeze yakındır; **Tımar sistemi** uygulanır",
        "Rumeli, Anadolu, Karaman, Sivas, Diyarbakır"
      ],
      [
        "Salyaneli (Yıllıklı)",
        "Merkeze uzaktır; vergiler **İltizam** ile nakit toplanır",
        "Mısır, Bağdat, Yemen, Trablusgarp, Tunus, Cezayir"
      ],
      [
        "İmtiyazlı (Özel Yönetimli)",
        "İç işlerinde serbesttir; hükümdarı yerel beydir",
        "Kırım, Hicaz, Eflak, Boğdan, Erdel"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**İltizam sistemi**, merkeze uzak salyaneli eyaletlerdeki (ve doğrudan hazineye giden **Mukataa** arazilerindeki) vergi toplama hakkının açık artırmayla **Mültezim**lere peşin para karşılığı kiralanmasıdır. Bu yöntem başlangıçta devletin nakit ihtiyacını hızla karşılamak ve uzak eyaletlerden düzenli gelir akışı sağlamak için pratik bir çözüm sundu. İhalede devlete ödenen peşinata **Muaccele**, 17. yüzyıl sonunda getirilen ömür boyu iltizam uygulamasına ise **Malikane Sistemi** denir. Ancak mültezimlerin köylüden fazla vergi toplamaya yönelmesi, zamanla taşrada ayanların güçlenmesine ve merkezi otoritenin zayıflamasına zemin hazırladı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İmtiyazlı eyaletlerin yükümlülükleri sıkça birbirine karıştırılır: **Hicaz (Mekke-Medine)** kutsal topraklar olduğu için Osmanlı''ya **ne vergi ne de asker** verirdi; tersine her yıl hac mevsiminde **Surre Alayları** ile yardım gönderilirdi. **Kırım Hanlığı** (Cengiz soyundan gelen **Giraylar**) vergi vermez ama savaşa **asker gönderirdi**. **Eflak ve Boğdan** ise vergi verir ama asker vermezdi."
  },
  {
    "type": "heading",
    "text": "Hukuk Sistemi ve Toplumsal Yapı"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı toplumu etnik köken esasına göre değil, din ve mezhep esasına dayanan **Millet Sistemi** ile yönetildi; bu sistem milliyetçilik anlamına gelmez, inanç topluluklarının kendi iç hukuklarında, eğitimlerinde ve ibadetlerinde özerkliğini ifade eder. Hukuk ise **Şer''i Hukuk** (İslam hukuku) ve **Örfi Hukuk** (töre ve padişah kanunnameleri) olarak ikiye ayrılır; ancak örfi kurallar şer''i hukuka aykırı olamazdı. Fatih ve Kanuni dönemlerinde çıkarılan kanunnamelerle vergi, ceza ve idare kuralları yazılı hale getirilerek taşrada uygulama birliği sağlandı."
  },
  {
    "type": "paragraph",
    "text": "Mahkeme ve görevli ayrımında şu kavramları net tut:"
  },
  {
    "type": "bullets",
    "items": [
      "**Kassam:** Kadıya bağlı olarak şer''i hukuka göre miras paylaşımı yapan ve **Tereke Defterleri**ni tutan görevlidir.",
      "**Nakibüleşraf:** Peygamber soyundan gelen seyyid ve şeriflerin kaydını tutan ve Eyüp Sultan''daki kılıç alaylarında padişaha kılıç kuşatan görevlidir.",
      "**Konsolosluk Mahkemeleri:** Kapitülasyonlarla (1535 Fransa) yabancıların kendi aralarındaki davalar için açıldı.",
      "**Nizamiye Mahkemeleri:** Tanzimat döneminde (**1868**) ceza ve ticaret davalarına bakmak üzere Fransız usulüyle kurulan karma/seküler mahkemelerdir."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Mısır, Trablusgarp ve Yemen hangi eyalet grubuna girer ve vergileri nasıl toplanır?\" Cevap: Merkeze uzak oldukları için **Salyaneli (yıllıklı)** eyaletlerdir; tımar uygulanmaz, vergileri **İltizam** yöntemiyle peşin toplanır."
  },
  {
    "type": "key_points",
    "items": [
      "Klasik kazaları hem idari hem adli yönden Kadı yönetir; Subaşı sadece güvenliğe bakar.",
      "Salyanesiz eyaletlerde Tımar, Salyaneli eyaletlerde (Mısır vb.) İltizam uygulanır.",
      "Hicaz ne vergi ne asker verir; Kırım asker gönderip vergi vermez; Eflak-Boğdan vergi verip asker vermez.",
      "1864 Vilayet Nizamnamesi ile eyalet sistemi kalktı; Tuna Vilayeti Mithat Paşa ile pilot bölge seçildi."
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
  'tarih.osmanli_kultur_ve_uygarligi.04',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  4,
  'Bölüm 4: Ordu ve Deniz Gücü (Kapıkulu, Tımarlı Sipahiler ve Donanma)',
  'Osmanlı kara ordusu üç ana koldan oluşurdu: merkezde padişaha bağlı maaşlı Kapıkulu Askerleri, taşrada toprak gelirleriyle geçinen Eyalet Askerleri ve bağlı beyliklerden gelen Yardımcı Kuvvetler.  Bu yapı hem sınırları korur hem de merkez ile taşra arasında askeri denge kurardı; öyle ki merkezdeki Kapıkulu birlikleri eyalet beylerinin güçlenmesini dengelerken, taşradaki tımarlı sipahiler de yeniçerilerin tek güç haline gelmesini önlerdi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı kara ordusu üç ana koldan oluşurdu: merkezde padişaha bağlı maaşlı **Kapıkulu Askerleri**, taşrada toprak gelirleriyle geçinen **Eyalet Askerleri** ve bağlı beyliklerden gelen **Yardımcı Kuvvetler**. Bu yapı hem sınırları korur hem de merkez ile taşra arasında askeri denge kurardı; öyle ki merkezdeki Kapıkulu birlikleri eyalet beylerinin güçlenmesini dengelerken, taşradaki tımarlı sipahiler de yeniçerilerin tek güç haline gelmesini önlerdi."
  },
  {
    "type": "heading",
    "text": "Kapıkulu Ocakları ve Altı Bölük Halkı"
  },
  {
    "type": "paragraph",
    "text": "Kapıkulu ocaklarının insan kaynağı başlangıçta I. Murat döneminde savaş esirlerinin beşte birinin alındığı **Pençik Sistemi**, ardından Balkanlar''daki Hristiyan ailelerden çocukların devşirildiği **Devşirme Sistemi**ydi. Devşirilen çocuklar Anadolu''daki Türk ailelerin yanına verilip Türk-İslam kültürünü, dilini ve geleneklerini öğrendikten sonra **Acemi Ocağı**na alınırdı. Buradan yeniçeri veya süvari birliklerine geçişe **Kapıya Çıkma (Bedergah)** denirdi. Bu birlikler barış zamanında başkentte nöbet tutar, yangın söndürür ve asayişi sağlar; savaşta ise doğrudan padişahın çevresinde merkez kanadı oluştururdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM, askeri bir terim olan **Kapıya Çıkma (Bedergah)** ile medrese öğrencilerinin üç aylarda köylere ve kasabalara gidip dini eğitim vererek harçlık toplaması olan **Cerre Çıkma**yı aynı seçeneklerde yan yana koyarak karıştırmanı bekler. Ayrıca Kapıkulu askerlerinin 3 ayda bir aldıkları maaş **Ulufe**dir; **Cülus** yalnızca taht değişikliğinde dağıtılan bahşiştir."
  },
  {
    "type": "paragraph",
    "text": "Kapıkulu Piyadeleri içinde **Yeniçeriler** (en kalabalık vurucu güç), **Cebeciler** (silah bakım-onarım), **Topçular**, **Top Arabacıları**, **Lağımcılar** (kale kuşatmalarında tünel kazıcılar) ve **Humbaracılar** (havan topu ve el bombası) yer alırdı. Kapıkulu Süvarileri ise **Altı Bölük Halkı** olarak adlandırılırdı ve görevleri görev dağılımına göre şifrelenmiştir:"
  },
  {
    "type": "bullets",
    "items": [
      "**Sipah ve Silahtar:** Savaşta bizzat padişahın **çadırını** korurlar.",
      "**Sağ ve Sol Ulufeciler:** Saltanat **sancaklarını** korurlar.",
      "**Sağ ve Sol Garipler:** Ordunun **hazinesini** ve ağırlıklarını korurlar."
    ]
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Altı Bölük Halkının görevlerini üç kısa eşleştirmeyle aklında tut: - **Garipler** fakirdir: **Hazineyi** ve ağırlıkları bekler. - **Ulufeciler** ön saftadır: **Saltanat sancağını** korur. - **Sipah ve Silahtar** padişaha en yakındır: **Otağı (çadırı)** korur."
  },
  {
    "type": "heading",
    "text": "Eyalet Askerleri ve Donanma"
  },
  {
    "type": "paragraph",
    "text": "Ordunun sayıca en büyük kesimini oluşturan **Tımarlı Sipahiler**, hazineden maaş almadan dirlik gelirleriyle geçinir ve besledikleri **Cebelü** adlı atlı askerlerle savaşa katılırlardı. Barış dönemlerinde köylerin asayişini ve üretimin sürekliliğini koruyan bu birlikler, sefer çağrısı geldiğinde sancakbeyinin sancağı altında toplanarak merkeze büyük bir lojistik ve mali yük bindirmeden orduya katılırlardı. Eyalet askerleri arasında ayrıca bekar Türk erkeklerinden toplanıp ordunun ön safında savaşan hafif piyadeler olan **Azaplar**, sınır boylarında akın yapan **Akıncılar** ve korkusuzca düşman üzerine atılan şok süvarileri olan **Deliler** bulunurdu. 17. yüzyılda Tımar sisteminin bozulmasıyla devletin geçici olarak topladığı tüfekli ücretli askerlere ise **Sekban ve Saruca** adı verildi; ancak bu birlikler işsiz kalınca **Celali İsyanları**na katıldılar."
  },
  {
    "type": "paragraph",
    "text": "Osmanlı donanması Karesioğulları''nın katılmasıyla güçlendi; ilk tersane Karamürsel''de açıldı ve ilk **Kaptan-ı Derya** **Karamürsel Alp** oldu. Yıldırım Bayezid döneminde Gelibolu''da kurulan büyük tersane ile donanma Akdeniz ve Karadeniz''e açılma kapasitesi kazandı; Fatih döneminde ise Karadeniz bir Türk gölüne dönüştü. Yükselme döneminde **Barbaros Hayrettin Paşa** komutasındaki **1538 Preveze Deniz Zaferi** ve **1560 Cerbe Deniz Savaşı** Akdeniz''i bir Türk gölüne çevirdi; donanma komutanlarına genel olarak **Levent** denilen deniz erleri eşlik ederdi. Deniz gücünün zayıfladığı dönemlerde ise tersi yönde ağır darbeler alındı: **1571 İnebahtı, 1770 Çeşme, 1827 Navarin ve 1853 Sinop** olayları Osmanlı donanmasının yakıldığı felaketlerdir; Preveze ve Cerbe ile karıştırılmamalıdır. Bu donanma kayıplarının ardından 18. ve 19. yüzyıllarda deniz mühendisliği okulları ve modern tersane ıslahatları zorunlu hale geldi."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Tımarlı sipahilerin beslediği atlı askere ne ad verilir, tımar bozulunca toplanan ücretli askerler kimlerdir?\" Sistem sağlıklıyken yetiştirilen atlı asker **Cebelü**dür; sistem bozulunca toplanan ücretli tüfekliler ise **Sekban ve Saruca**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Acemi Ocağı''ndan yeniçeriliğe geçiş Kapıya Çıkma (Bedergah), medreselilerin tatil görevi ise Cerre Çıkma''dır.",
      "Altı Bölük Halkında Sipah-Silahtar çadırı, Ulufeciler sancağı, Garipler ise hazineyi korur.",
      "Azaplar bekar piyadelerdir; Deliler korkusuz süvarilerdir; Sekban ve Sarucalar ise tımar bozulunca alınan ücretli askerlerdir.",
      "Preveze (1538) ve Cerbe (1560) büyük deniz zaferleridir; İnebahtı, Çeşme, Navarin ve Sinop ise donanma baskınlarıdır."
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
  'tarih.osmanli_kultur_ve_uygarligi.05',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  5,
  'Bölüm 5: Toprak Sistemi, Vergiler ve Ekonomi',
  'Osmanlı toprak düzeninde tarım arazilerinin büyük çoğunluğu devlete ait olan Mîrî Araziydi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı toprak düzeninde tarım arazilerinin büyük çoğunluğu devlete ait olan **Mîrî Arazi**ydi. Özel mülkiyete konu olan **Mülk Arazi** (öşri ve haraci) ile gelirleri hayır kurumlarına bırakılan **Vakıf Arazi** dışında kalan mîrî topraklar, kullanım amacına göre farklı isimler alırdı:"
  },
  {
    "type": "table",
    "headers": [
      "Mîrî Arazi Türü",
      "Gelirin Aktarıldığı Yer",
      "Temel İşlevi"
    ],
    "rows": [
      [
        "Dirlik",
        "Devlet memuru ve askerlere maaş karşılığı",
        "**Has** (>100 bin akçe), **Zeamet** (20-100 bin), **Tımar** (<20 bin)"
      ],
      [
        "Mukataa",
        "Doğrudan **merkezi hazineye** (Hazine-i Amire)",
        "İltizam sistemiyle nakit gelir toplanır"
      ],
      [
        "Paşmaklık",
        "Padişahın annesi, eşleri ve kızlarına",
        "Saray kadınlarının şahsi masraflarını karşılar"
      ],
      [
        "Ocaklık",
        "Kale muhafızları ve tersane giderlerine",
        "Stratejik savunma ve donanma finansmanı"
      ],
      [
        "Yurtluk",
        "Sınır boylarını koruyan akıncı ve beylere",
        "Sınır güvenliğini sağlamak"
      ],
      [
        "Malikane",
        "Devlete üstün hizmet gösterenlere",
        "Başarı karşılığı mülk olarak tahsis edilir"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Dirlik (özellikle Tımar) sisteminde toprak asla sipahinin özel mülkü olmaz; mülkiyet devlette kalır, sipahi yalnızca vergiyi toplar. Sipahinin görevi yalnızca vergi tahsil etmek değil, aynı zamanda köyde güvenliği sağlamak, tarımsal üretimin sürekliliğini denetlemek ve savaş zamanı beslediği cebelülerle orduya katılmaktır. Bu nedenle Osmanlı''da Avrupa''daki gibi toprağa dayalı soylu bir derebeylik (**feodalite**) gelişmemiş, taşrada merkezi otorite uzun süre korunmuştur. Tımar sisteminin 17. yüzyıldan itibaren bozulup yerini iltizama bırakması ise hem tarımsal üretimi hem de eyalet ordusunu zayıflatarak duraklamanın en önemli iç nedenlerinden birini oluşturdu."
  },
  {
    "type": "heading",
    "text": "Vergiler: Şer''i ve Örfi Ayrımı"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı vergileri dini temelli **Şer''i Vergiler** ve devletin ihtiyacına göre konulan **Örfi Vergiler** olarak ikiye ayrılır:"
  },
  {
    "type": "bullets",
    "items": [
      "**Öşür (Aşar):** Müslüman çiftçiden alınan 1/10 oranındaki ürün vergisidir.",
      "**Haraç:** Gayrimüslim çiftçiden alınan ürün vergisidir (1/5 ile 1/2 arası).",
      "**Cizye:** Askere gitmeyen sağlıklı gayrimüslim erkeklerden alınan baş vergisidir (kadın, çocuk, yaşlı ve din adamları muaf).",
      "**Çiftbozan:** Toprağını mazeretsiz üst üste üç yıl ekmeyen veya terk eden köylüden alınan üretim güvenliği cezasıdır (normal arazi vergisi olan **Çifthane** ile karıştırma).",
      "**Avarız:** Savaş, deprem veya kıtlık gibi olağanüstü durumlarda toplanan vergidir (zamanla sürekli hale gelmiştir)."
    ]
  },
  {
    "type": "heading",
    "text": "Ekonomi İlkeleri, Ticaret ve Para Tarihi"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı iktisat politikası üç temel ilkeye dayanır: piyasada malın bol, kaliteli ve ucuz olmasını hedefleyen **İaşecilik (Provizyonizm)**, hazine gelirlerini daima artırmayı ve gideri kısmayı amaçlayan **Fiskalizm** ve mevcut ekonomik dengeyi korumayı esas alan **Gelenekçilik**."
  },
  {
    "type": "paragraph",
    "text": "Esnaf örgütlenmesinde ise ilk dönemdeki **Ahilik** (yalnızca Müslümanlar üye olabilir ve gaza anlayışı vardır) zamanla yerini gayrimüslimlerin de üye olabildiği ve cihat amacı taşımayan **Lonca Teşkilatı**na bıraktı. Çarşı-pazarı ve fiyatları (**Narh**) **Muhtesip** denetlerken; tek cins malların (un, yağ, bal) toptan tartılıp dağıtıldığı hallere **Kapan Hanı** (yöneticisi **Kapan Emini**), kıymetli kumaş ve mücevherlerin satıldığı kapalı çarşıya **Bedesten**, aynı meslekten esnafların yan yana sıralandığı sokaklara ise **Arasta** denirdi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Ulaşım ve güvenlik kavramlarını karıştırma: **Menzil Teşkilatı** posta ve haberleşme atlarının değişim merkezidir; **Derbent Teşkilatı** dağ geçitlerinin ve yolların güvenliğini sağlar; **Mekkari Taifesi** ise ticari yük ve kargo taşımacılığı yapan lojistik loncasıdır. II. Mahmut döneminde İstanbul''a kontrolsüz göçü önlemek için çıkarılan iç pasaport belgesi ise **Mürur Tezkeresi**dir (gemi geçiş belgesi olan **İzn-i Sefine** ile karıştırma)."
  },
  {
    "type": "paragraph",
    "text": "Para kronolojisinde ilk bakır para (**Mangır**) Osman Gazi, ilk gümüş para (**Akçe**) Orhan Gazi, ilk altın para (**Sultani / Sikke-i Hasene**) Fatih Sultan Mehmet, ilk kağıt para (**Kaime**) ise Abdülmecit döneminde basıldı. Bütçe açığını kapatmak için paranın değerli maden oranının düşürülmesine **Tağşiş** (devalüasyon), ayarı bozulmuş akçeye ise **Züyuf Akçe** denirdi. Ayrıca günümüz **Ziraat Bankası**nın temeli, Atatürk döneminde değil Osmanlı döneminde **Mithat Paşa** tarafından Niş valiliği sırasında kurulan **Memleket Sandıkları**dır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Müslümandan alınan ürün vergisi, gayrimüslimden alınan askerlik muafiyet vergisi ve toprağını 3 yıl ekmeyenden alınan ceza vergisi sırasıyla hangileridir?\" Cevap: **Öşür - Cizye - Çiftbozan**dır (Haraç ürün vergisidir, Cizye ise baş vergisidir)."
  },
  {
    "type": "key_points",
    "items": [
      "Dirlik sisteminde mülkiyet devlettedir; Has (>100 bin), Zeamet (20-100 bin), Tımar (<20 bin) şeklinde sıralanır.",
      "Müslüman ürün vergisi Öşür, gayrimüslim ürün vergisi Haraç, gayrimüslim baş vergisi Cizye, terk cezası Çiftbozan''dır.",
      "İaşecilik bol ve ucuz mal, Fiskalizm hazineyi büyütme, Gelenekçilik mevcut düzeni koruma ilkesidir.",
      "İlk bakır Osman, gümüş Orhan, altın Fatih, kağıt para Abdülmecit dönemindedir; Ziraat Bankası temeli Mithat Paşa''nın Memleket Sandıklarıdır."
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
  'tarih.osmanli_kultur_ve_uygarligi.06',
  'Tarih',
  'Osmanlı Kültür ve Uygarlığı',
  6,
  'Bölüm 6: Eğitim, Bilim, Sanat ve Mimari',
  'Osmanlı''da örgün eğitimin temeli Medreselere dayanırdı.  Vakıf gelirleriyle finanse edilen medreselerde öğrencilerin barınma, yemek ve eğitim giderleri ücretsiz karşılanır, böylece toplumsal hareketlilik ve fırsat eşitliği sağlanırdı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Osmanlı''da örgün eğitimin temeli **Medrese**lere dayanırdı. Vakıf gelirleriyle finanse edilen medreselerde öğrencilerin barınma, yemek ve eğitim giderleri ücretsiz karşılanır, böylece toplumsal hareketlilik ve fırsat eşitliği sağlanırdı. İlk Osmanlı medresesi **İznik Orhaniyesi**dir ve buraya atanan ilk müderris **Davud-ı Kayseri**dir (ilk kadı olan **Dursun Fakih** ile karıştırılmamalıdır). Fatih döneminde kurulan **Sahn-ı Seman Medreseleri** dönemin en yüksek bilim yuvası olurken, Kanuni döneminde kurulan **Süleymaniye Medreseleri** özellikle tıp ve fen bilimlerinde ihtisaslaşmayı sağladı. Medreseden mezun olup stajyerlik yapanlara **Muid**, atama sırası bekleyen adaylara ise **Mülazım** (bu sisteme **Mülazemet Sistemi**) denirdi; ancak 17. yüzyıldan itibaren müderris çocuklarına sınavsız unvan verilmesi (**Beşik Ulemalığı**) eğitim kalitesini bozdu."
  },
  {
    "type": "heading",
    "text": "Osmanlı Bilim İnsanları ve Sosyal Kurumlar"
  },
  {
    "type": "paragraph",
    "text": "Osmanlı bilim tarihinde pozitif bilimler, tıp, astronomi ve coğrafya alanlarında önemli eserler üretilmiştir. Bu isimlerin hangi dönemde yaşadığı ve hangi eserle öne çıktığı sınavda doğrudan test edilir:"
  },
  {
    "type": "table",
    "headers": [
      "Bilgin",
      "Dönemi / Alanı",
      "Temel Eser veya Başarı"
    ],
    "rows": [
      [
        "Sabuncuoğlu Şerafeddin",
        "15. yy / Tıp (Amasya)",
        "*Cerrahiyetü''l-Haniyye*: İlk resimli cerrahi eseri yazdı"
      ],
      [
        "Akşemseddin",
        "Fatih dönemi / Tıp",
        "Hastalıkların gözle görülmeyen mikroplarla bulaştığını açıkladı"
      ],
      [
        "Altuncuzade",
        "Fatih dönemi / Tıp",
        "Üroloji ve idrar yolları hastalıkları üzerine çalıştı"
      ],
      [
        "Takiyüddin Mehmet",
        "III. Murat / Astronomi",
        "İstanbul''da **ilk Osmanlı rasathanesini** (gözlemevini) kurdu"
      ],
      [
        "Katip Çelebi",
        "17. yy / Coğrafya-Bibliyografya",
        "*Keşfü''z-Zunûn* ve *Cihannüma*; Batı''da **Hacı Kalfa** olarak bilinir"
      ],
      [
        "Evliya Çelebi",
        "17. yy / Gezi-Kültür",
        "10 ciltlik dev gezi eseri *Seyahatname*"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Sosyal devlet kurumları arasında II. Abdülhamit tarafından kurulan iki yapı özellikle sorulur: kimsesizler, yoksullar ve yaşlılar için açılan **Darülaceze** ile kızı Hatice Sultan''ın anısına 1899''da açtığı ilk modern çocuk hastanesi olan **Hamidiye Etfal Hastanesi**. Vakıf geleneğinin 19. yüzyıl sonundaki bu kurumsal uzantıları, devletin sosyal yardım sorumluluğunu modern sağlık ve bakım kurumlarıyla sürdürdüğünü gösterir."
  },
  {
    "type": "heading",
    "text": "Sanat, Mimari ve Batı Etkisi"
  },
  {
    "type": "paragraph",
    "text": "Klasik Osmanlı mimarisinin zirvesi **Mimar Sinan**dır. Sinan hem mühendislik zekası hem de mekan bütünlüğüyle kubbe mimarisini en üst noktaya taşıdı ve kendi gelişimini **Şehzade Camii** (çıraklık), **Süleymaniye Camii** (kalfalık) ve Edirne''deki **Selimiye Camii** (ustalık) şeklinde üçledi. Buna karşılık İstanbul''daki ünlü **Sultanahmet Camii (Mavi Cami)** Mimar Sinan''ın değil, öğrencisi **Sedefkar Mehmet Ağa**nın eseridir!"
  },
  {
    "type": "paragraph",
    "text": "18. yüzyıldan itibaren Avrupa ile diplomatik ve kültürel temasların artmasıyla Osmanlı mimarisinde Batı (Barok ve Rokoko) etkileri görülmeye başlandı; geleneksel sade cephelerin yerini kıvrımlı hatlar, geniş saçaklar ve süslemeler aldı:"
  },
  {
    "type": "bullets",
    "items": [
      "**III. Ahmet Çeşmesi (1728):** Lale Devri''nde yapılan **ilk sivil** Batı tarzı eserdir.",
      "**Nuruosmaniye Camii (1755):** I. Mahmut döneminde başlanıp III. Osman döneminde tamamlanan **ilk Barok tarzı (dini)** camidir.",
      "**İshak Paşa Sarayı (Ağrı-Doğubeyazıt):** Türk, İran ve Batı tarzlarını birleştiren, içinde cami, kütüphane, harem ve divan odaları barındıran, ayrıca **dünyada ilk merkezi ısıtma sistemine** sahip saraydır."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM sanatçıların alanlarını ve dönemlerini karıştırarak çeldirici kurar: **Amasyalı Şeyh Hamdullah** hat sanatının kurucusu ve **\"Hattatların Kıblesi\"**dir; **Ahmet Karahisari** ise Süleymaniye Camii''nin yazılarını yazan büyük hattattır (padişah değildir!). Resim ve minyatürde **Nakkaş Sinan Bey** İtalya''da resim eğitimi almış ve Fatih''in gül koklayan portresini yapmıştır; **Matrakçı Nasuh** Kanuni döneminde topoğrafik şehir minyatürleri çizmiş, **Levni** ise Lale Devri''nin renk ve hareket ustası baş nakkaşı olmuştur (Lale Devri şairi **Nedim** ile karıştırma). Klasik Türk musikisinin en büyük bestekarı ise **Segah Tekbiri**nin sahibi **Itri**dir; günümüzde 100 TL banknotun üzerinde de Itri''nin portresi yer alır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Mimar Sinan''ın ustalık eseri hangisidir?\" Seçeneklerde mutlaka **Sultanahmet Camii** ve **Süleymaniye Camii** bulunur. Ustalık eseri Edirne''deki **Selimiye Camii**dir; Süleymaniye kalfalık eseri, Sultanahmet Camii ise Sedefkar Mehmet Ağa''nın eseridir."
  },
  {
    "type": "key_points",
    "items": [
      "İlk medrese İznik Orhaniyesi, ilk müderris Davud-ı Kayseri, ilk kadı Dursun Fakih''tir.",
      "Katip Çelebi Keşfü''z-Zunûn ve Cihannüma yazarıdır; Sabuncuoğlu Şerafeddin ise ilk resimli cerrahi kitabını yazmıştır.",
      "Mimar Sinan''ın ustalık eseri Selimiye Camii''dir; Sultanahmet Camii Sedefkar Mehmet Ağa''ya aittir.",
      "İlk sivil Batı yapısı III. Ahmet Çeşmesi, ilk Barok cami Nuruosmaniye, ilk merkezi ısıtmalı saray İshak Paşa Sarayı''dır."
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
