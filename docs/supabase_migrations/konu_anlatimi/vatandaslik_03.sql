-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Vatandaşlık · Temel Hak ve Ödevler
-- Kaynak: docs/konu_anlatimi/vatandaslik/03_temel_hak_ve_odevler.md
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
  'vatandaslik.temel_hak_ve_odevler.01',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  1,
  'Bölüm 1: Temel Hakların Niteliği, Sınırlandırılması ve Durdurulması',
  '1982 Anayasası''nın İkinci Kısmı, bireyin devlet ve toplum karşısındaki hak ve ödevlerini Alman hukukçu Jellinek''in klasik sınıflandırmasını esas alarak üç bölümde düzenler: devletin bireyin özgürlük alanına müdahale etmemesini gerektiren Kişinin Hakları ve Ödevleri (Negatif Statü / Koruyucu Haklar), bireyin devletten hizmet ve sosyal güvence talep etmesini sağlayan Sosyal ve Ekonomik Haklar ve Ödevler (Pozitif Statü / İsteme Hakları) ve bireyin devlet yönetimine katılmasını sağlayan Siyasi Haklar ve Ödevler (Aktif Statü / Katılma Hakları).  Bu üçlü ayrım, devletin hangi hakta geri çekilmesi ve hangi hakta aktif görev üstlenmesi gerektiğini belirleyen temel anayasal ölçüttür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1982 Anayasası''nın İkinci Kısmı, bireyin devlet ve toplum karşısındaki hak ve ödevlerini Alman hukukçu Jellinek''in klasik sınıflandırmasını esas alarak üç bölümde düzenler: devletin bireyin özgürlük alanına müdahale etmemesini gerektiren **Kişinin Hakları ve Ödevleri (Negatif Statü / Koruyucu Haklar)**, bireyin devletten hizmet ve sosyal güvence talep etmesini sağlayan **Sosyal ve Ekonomik Haklar ve Ödevler (Pozitif Statü / İsteme Hakları)** ve bireyin devlet yönetimine katılmasını sağlayan **Siyasi Haklar ve Ödevler (Aktif Statü / Katılma Hakları)**. Bu üçlü ayrım, devletin hangi hakta geri çekilmesi ve hangi hakta aktif görev üstlenmesi gerektiğini belirleyen temel anayasal ölçüttür."
  },
  {
    "type": "heading",
    "text": "Temel Hakların Sınırlandırılması (Anayasa m. 13)"
  },
  {
    "type": "paragraph",
    "text": "Temel hak ve hürriyetler sınırsız değildir; ancak demokratik bir hukuk devletinde bu sınırlandırmanın da katı anayasal güvencelere bağlanması gerekir. 2001 anayasa değişikliğine kadar Anayasa''nın 13. maddesinde tüm haklar için geçerli sayılan \"kamu düzeni, milli güvenlik, genel sağlık\" gibi torba genel sınırlama sebepleri yer alıyordu. **2001 değişikliği** ile bu genel sınırlama sebepleri tamamen kaldırılmış ve hakların korunması güçlendirilmiştir. Güncel Anayasa **m. 13** uyarınca temel hak ve hürriyetler:"
  },
  {
    "type": "bullets",
    "items": [
      "**Özlerine dokunulmaksızın** (hakkın kullanımını tamamen imkansız hale getirmeden),",
      "Yalnızca **Anayasanın ilgili maddelerinde belirtilen özel sebeplere** bağlı olarak,",
      "**Ancak kanunla** (TBMM tarafından çıkarılan kanunla; olağan Cumhurbaşkanlığı Kararnamesiyle temel haklar sınırlanamaz) sınırlanabilir."
    ]
  },
  {
    "type": "paragraph",
    "text": "Ayrıca yapılacak her sınırlama; Anayasanın sözüne ve ruhuna, **demokratik toplum düzeninin** ve **laik Cumhuriyetin** gereklerine ve **ölçülülük ilkesine** aykırı olamaz. Anayasa Mahkemesi denetimlerinde temel ölçüt olan **ölçülülük ilkesi** üç alt ilkeden oluşur: sınırlama aracının ulaşılmak istenen amaca uygun olmasını ifade eden **elverişlilik**, amaca ulaşmak için en yumuşak aracın seçilmesini ifade eden **gereklilik (zorunluluk)** ve sınırlama ile elde edilecek kamu yararı arasında makul bir denge bulunmasını ifade eden **orantılılık**."
  },
  {
    "type": "heading",
    "text": "Temel Hakların Durdurulması ve Sert Çekirdek Haklar (Anayasa m. 15)"
  },
  {
    "type": "paragraph",
    "text": "Olağan dönemlerde uygulanan 13. madde güvencelerine karşılık, devletin varlığını tehdit eden ağır kriz hallerinde **Anayasa m. 15** devreye girer. Savaş, seferberlik veya olağanüstü hallerde, milletlerarası hukuktan doğan yükümlülükler ihlal edilmemek kaydıyla, durumun gerektirdiği ölçüde temel hak ve hürriyetlerin kullanılması kısmen veya tamamen durdurulabilir veya bunlar için Anayasada öngörülen güvencelere aykırı tedbirler alınabilir."
  },
  {
    "type": "paragraph",
    "text": "Ancak Anayasa m. 15''in ikinci fıkrası, savaş ve olağanüstü hal gibi en ağır dönemlerde dahi asla dokunulamayacak dört **sert çekirdek hak** belirlemiştir:"
  },
  {
    "type": "table",
    "headers": [
      "Sert Çekirdek Hak (m. 15/2)",
      "Anayasal Kapsamı",
      "İstisna / Sınav Notu"
    ],
    "rows": [
      [
        "Yaşama Hakkı ve Vücut Bütünlüğü",
        "Kişinin yaşama hakkına, maddi ve manevi varlığının bütünlüğüne dokunulamaz",
        "Savaş hukukuna uygun fiiller sonucu meydana gelen ölümler hariç"
      ],
      [
        "İnanç ve Düşünce Açıklamama",
        "Kimse din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamaz ve suçlanamaz",
        "Düşünceyi açıklama özgürlüğü sınırlanabilir ama zorla açıklatma yasaktır"
      ],
      [
        "Suç ve Cezaların Geriye Yürümezliği",
        "Suç ve cezalar geçmişe yürütülemez",
        "Aleyhe ceza kanunu geçmişe uygulanamaz"
      ],
      [
        "Masumiyet Karinesi",
        "Suçluluğu mahkeme kararıyla saptanıncaya kadar kimse suçlu sayılamaz",
        "Gözaltı veya tutuklulukta dahi masumiyet karinesi devam eder"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM sert çekirdek haklar sorularında şıklara mutlaka **mülkiyet hakkı**, **seyahat hürriyeti** veya **toplantı hakkı**nı koyar. Savaş ve olağanüstü halde dahi dokunulamayan haklar yalnızca yukarıdaki **dört haktır**; mülkiyet ve seyahat hürriyeti sert çekirdek hak değildir. Aynı şekilde 2001''den beri Anayasa''da genel sınırlama sebeplerinin bulunmadığını da unutma."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Temel hakların sınırlandırılması ve durdurulması arasındaki farkı **13-Ö / 15-4** şeklinde kodla: - **m. 13 (Olağan Dönem):** **Ö**züne dokunulmaz, yalnızca **ö**zel sebeplerle, kanunla ve **ö**lçülü biçimde sınırlanır. - **m. 15 (Savaş / OHAL):** Kısmen veya tamamen durdurulabilir; ancak **4** sert çekirdek hakka asla dokunulamaz."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Ölçülülük ilkesinin alt unsurları nelerdir?\" Cevap **elverişlilik, gereklilik ve orantılılık**tır; \"geriye yürümezlik\" veya \"kanunilik\" ölçülülük ilkesinin alt unsuru değildir."
  },
  {
    "type": "key_points",
    "items": [
      "Kişisel haklar negatif statü (karışma), sosyal haklar pozitif statü (hizmet ver), siyasi haklar aktif statü (yönetime kat) haklarıdır.",
      "2001 değişikliği sonrası genel sınırlama sebepleri kalkmıştır; haklar özüne dokunulmadan, ilgili maddedeki özel sebeplerle ve **ancak kanunla** sınırlanır.",
      "Ölçülülüğün üç alt ilkesi elverişlilik, gereklilik ve orantılılıktır.",
      "Savaşta bile dokunulamayan 4 sert çekirdek hak: yaşama hakkı ve vücut bütünlüğü, inanç/düşünce açıklamaya zorlanamama, suç-cezaların geriye yürümezliği ve masumiyet karinesidir."
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
  'vatandaslik.temel_hak_ve_odevler.02',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  2,
  'Bölüm 2: Kişinin Hakları ve Ödevleri (Negatif Statü Hakları)',
  'Anayasa''nın İkinci Kısmının İkinci Bölümünde düzenlenen Kişinin Hakları ve Ödevleri, bireyin maddi ve manevi varlığını devlet müdahalesinden koruyan temel güvencelerdir.  Bu bölümde yer alan süreler, hakim kararı şartı ve istisnalar KPSS sorularında doğrudan ölçülür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın İkinci Kısmının İkinci Bölümünde düzenlenen **Kişinin Hakları ve Ödevleri**, bireyin maddi ve manevi varlığını devlet müdahalesinden koruyan temel güvencelerdir. Bu bölümde yer alan süreler, hakim kararı şartı ve istisnalar KPSS sorularında doğrudan ölçülür."
  },
  {
    "type": "heading",
    "text": "Kişi Özgürlüğü, Özel Hayat ve Seyahat Güvenceleri"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 19** uyarınca yakalanan veya tutuklanan kişi, tutulma yerine en yakın mahkemeye gönderilmesi için gerekli süre (yol süresi) hariç en geç **kırk sekiz saat (48 saat)** ve toplu olarak işlenen suçlarda en çok **dört gün (4 gün)** içinde hakim önüne çıkarılır. **Anayasa m. 20** (özel hayatın gizliliği), **m. 21** (konut dokunulmazlığı) ve **m. 22** (haberleşme hürriyeti) kapsamında kişinin üstü, özel kağıtları, eşyası veya konutu aranamaz, bunlara el konulamaz ve haberleşmesi engellenemez. Bu işlemler kural olarak usulüne göre verilmiş **hakim kararı** ile yapılır; ancak gecikmesinde sakınca bulunan hallerde kanunla yetkili kılınmış merciin **yazılı emri** (sözlü emir kesinlikle geçersizdir!) bulunmadıkça yapılamaz. Yetkili merciin yazılı emri de yirmi dört saat içinde görevli hakimin onayına sunulur ve hakim kararını el koymadan itibaren kırk sekiz saat içinde açıklar."
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 23**''te düzenlenen yerleşme ve seyahat hürriyetinde iki önemli ayrım bulunur. Birincisi, sağlıklı ve düzenli kentleşmeyi gerçekleştirmek, kaçak yapılaşmayı önlemek ve kamu mallarını korumak yalnızca **yerleşme hürriyeti**nin sınırlandırma sebebidir; bu gerekçelerle seyahat hürriyeti sınırlandırılamaz. İkincisi, **2010 anayasa değişikliği** ile vatandaşın **yurt dışına çıkma hürriyeti**, ancak **suç soruşturması veya kovuşturması** sebebiyle ve **hakim kararına bağlı olarak** sınırlanabilir; dolayısıyla vergi borcu veya özel borç nedeniyle yurt dışı çıkış yasağı konulamaz."
  },
  {
    "type": "heading",
    "text": "Din, Basın, Örgütlenme ve Ceza Hukuku Güvenceleri"
  },
  {
    "type": "bullets",
    "items": [
      "**Din ve Vicdan Hürriyeti (m. 24):** Din ve ahlak eğitim ve öğretimi Devletin gözetim ve denetimi altında yapılır. **Din kültürü ve ahlak öğretimi** ilk ve ortaöğretim kurumlarında okutulan **zorunlu** dersler arasındadır; bunun dışındaki özel din eğitimi kişilerin kendi isteğine, küçüklerin de kanuni temsilcisinin talebine bağlıdır.",
      "**Basın Hürriyeti ve Basımevi Güvencesi (m. 28-32):** Basın hürdür, sansür edilemez. **Anayasa m. 29** gereği basımevi kurmak **izin alma ve mali teminat yatırma** şartına bağlanamaz. **Anayasa m. 30** uyarınca kanuna uygun şekilde basın işletmesi olarak kurulan basımevi ve eklentileri ile basın araçları suç aleti olduğu gerekçesiyle **zapt ve müsadere edilemez** veya işletilmekten alıkonulamaz. **Düzeltme ve cevap hakkı (tekzip, m. 32)** ise yalnızca kişilerin şeref ve haysiyetine dokunulması veya kendileriyle ilgili gerçeğe aykırı yayınlar yapılması hallerinde tanınır.",
      "**Dernek ve Toplantı Hakları (m. 33-34):** Herkes **önceden izin almaksızın** dernek kurma ve silahsız, saldırısız toplantı ve gösteri yürüyüşü düzenleme hakkına sahiptir (izin şartı yoktur, bildirim esastır). Dernekler Kanunu uyarınca dernek kurmak için en az **7 gerçek veya tüzel kişi** gerekir.",
      "**Mülkiyet Hakkı (m. 35) ve Hak Arama Hürriyeti (m. 36):** Mülkiyet ve miras hakları adında ekonomik çağrışım yapsa da Anayasa''da Sosyal Haklar içinde değil, **Kişinin Hakları (Negatif Statü)** bölümünde yer alır.",
      "**Suç ve Cezalara İlişkin Esaslar (m. 38):** Ceza sorumluluğu şahsidir; **genel müsadere cezası** ve ölüm cezası 2004 değişikliğiyle tamamen kaldırılmıştır. Kanuna aykırı olarak elde edilmiş bulgular (**hukuka aykırı deliller**) doğru bile olsa mahkemede **delil olarak kabul edilemez**. Kimse kendisini ve kanunda gösterilen yakınlarını suçlayan bir beyanda bulunmaya veya bu yolda delil göstermeye zorlanamaz."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Kişinin Hakları bölümünde dört ayrıntıyı sürekli ters sorar: 1. **Mülkiyet hakkı** sosyal-ekonomik haklarda değil, **Kişisel Haklar (Negatif Statü)** içindedir. 2. Arama ve el koymada gecikmesinde sakınca bulunan halde sözlü emir değil **yazılı emir** şarttır. 3. Yurt dışına çıkma yasağı vergi borcu gibi mali nedenlerle değil, 2010''dan beri yalnızca **suç soruşturması/kovuşturması** ve **hakim kararıyla** konulabilir. 4. Kanuna aykırı olarak elde edilmiş bulgular **delil olarak kabul edilemez** (m. 38, hukuka aykırı delil yasağı); bu yasak yalnızca ceza davasında değil tüm yargılamalarda geçerlidir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Dernek kurma ile toplantı ve gösteri yürüyüşü düzenleme hakkı için ortak anayasal kural nedir?\" Her ikisi de **önceden izin almaksızın** kullanılır; dernek kurmak için en az 7 kişi gerekirken toplantı ve gösteride yalnızca önceden bildirim usulü uygulanır."
  },
  {
    "type": "key_points",
    "items": [
      "Gözaltı/tutuklamada hakim önüne çıkarma süresi yol süresi hariç bireysel suçlarda **48 saat**, toplu suçlarda **4 gün**dür.",
      "Düzenli kentleşme ve kamu mallarını koruma yalnızca **yerleşme hürriyeti**ni sınırlar; yurt dışına çıkış yalnızca suç soruşturması/kovuşturmasında hakim kararıyla yasaklanabilir.",
      "Kanuna uygun basımevleri suç aleti sayılarak müsadere edilemez; genel müsadere tamamen yasaktır ve hukuka aykırı delil kullanılamaz.",
      "Mülkiyet hakkı kişisel haktır; dernek ve toplantı hakkı önceden izin alınmadan kullanılır (dernek en az 7 kişi)."
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
  'vatandaslik.temel_hak_ve_odevler.03',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  3,
  'Bölüm 3: Sosyal ve Ekonomik Haklar ve Ödevler (Pozitif Statü Hakları)',
  'Anayasa''nın İkinci Kısmının Üçüncü Bölümünde yer alan Sosyal ve Ekonomik Haklar ve Ödevler, sosyal devlet ilkesinin somut görünümüdür ve devletin bireye yönelik eğitim, sağlık, çalışma, sosyal güvenlik ve konut gibi alanlarda olumlu edimlerde bulunmasını gerektirir.  Ancak devletin bu alandaki ödevleri sınırsız bir mali yükümlülük doğurmaz; Anayasa m.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın İkinci Kısmının Üçüncü Bölümünde yer alan **Sosyal ve Ekonomik Haklar ve Ödevler**, sosyal devlet ilkesinin somut görünümüdür ve devletin bireye yönelik eğitim, sağlık, çalışma, sosyal güvenlik ve konut gibi alanlarda olumlu edimlerde bulunmasını gerektirir. Ancak devletin bu alandaki ödevleri sınırsız bir mali yükümlülük doğurmaz; **Anayasa m. 65**''e göre Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek **mali kaynaklarının yeterliliği ölçüsünde** yerine getirir. Bu hüküm, sosyal hakların uygulanmasındaki anayasal mali sınırı oluşturur."
  },
  {
    "type": "heading",
    "text": "Eğitim, Kamulaştırma ve Devletleştirme"
  },
  {
    "type": "bullets",
    "items": [
      "**Eğitim ve Öğrenim Hakkı ve Ödevi (m. 42):** Kimse eğitim ve öğrenim hakkından yoksun bırakılamaz. **İlköğretim, kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.**",
      "**Kamulaştırma (İstimlak, m. 46):** Devlet ve kamu tüzel kişileri, kamu yararının gerektirdiği hallerde gerçek karşılıklarını **peşin ödemek şartıyla**, özel mülkiyette bulunan **taşınmaz malların** (arsa, tarla, bina gibi) tamamını veya bir kısmını kanunla gösterilen esas ve usullere göre kamulaştırabilir. Kural bedelin **nakit ve peşin** ödenmesidir; ancak tarım reformunun uygulanması, büyük enerji ve sulama projeleri ile iskan projelerinin gerçekleştirilmesi, yeni ormanların yetiştirilmesi, kıyıların korunması ve turizm amacıyla kamulaştırılan toprakların bedelleri, kanunun gösterdiği şekilde ve **5 yılı geçmemek üzere** eşit taksitlerle ödenebilir.",
      "**Devletleştirme ve Özelleştirme (m. 47):** Kamu hizmeti niteliği taşıyan **özel teşebbüs ve şirketlerin** kamu yararının zorunlu kıldığı hallerde gerçek karşılığı üzerinden kamu mülkiyetine geçirilmesine **devletleştirme** denir (kamulaştırma taşınmaz mal için, devletleştirme ise özel teşebbüs ve işletmeler içindir)."
    ]
  },
  {
    "type": "heading",
    "text": "Çalışma Hayatı, Sendika, Grev ve Çevre Hakkı"
  },
  {
    "type": "paragraph",
    "text": "Çalışma yaşamına ilişkin haklar da Anayasa''da sosyal ve ekonomik haklar içinde düzenlenmiştir. **Anayasa m. 51** uyarınca çalışanlar ve işverenler, **önceden izin almaksızın** sendikalar ve üst kuruluşlar kurma, bunlara serbestçe üye olma ve üyelikten çekilme hakkına sahiptir. **2010 anayasa değişikliği** ile birlikte \"aynı zamanda ve aynı işkolunda birden fazla sendikaya üye olunamaz\" yasağı Anayasa''dan çıkarılmış, böylece çalışanların birden çok sendikaya üye olabilmesinin önü açılmıştır."
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 53 ve 54**''te düzenlenen toplu iş sözleşmesi, grev ve lokavt hakları da yine **sosyal ve ekonomik haklar** grubundadır (siyasi hak değildir). Toplu iş sözleşmesinin yapılması sırasında uyuşmazlık çıkması halinde **işçiler grev hakkına**, **işveren ise lokavt hakkına** sahiptir. Bununla birlikte kamu görevlileri (memurlar) için çok önemli bir anayasal ayrım geçerlidir: **2010 anayasa değişikliği** ile memurlara ve diğer kamu görevlilerine **toplu sözleşme yapma hakkı** verilmiştir (uyuşmazlık çıkması halinde **Kamu Görevlileri Hakem Kurulu**na başvurulur ve kurulun kararı kesindir); ancak **memurların grev hakkı Anayasa''da hala tanınmamıştır** ve yasaktır!"
  },
  {
    "type": "paragraph",
    "text": "Sosyal haklar içinde ayrıca iki önemli başlık sıkça sorulur: **Anayasa m. 56**''da düzenlenen **sağlıklı ve dengeli bir çevrede yaşama hakkı** gereği çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek yalnızca Devletin değil, **hem Devletin hem de vatandaşların anayasal ödevidir**. **Anayasa m. 60**''ta yer alan **sosyal güvenlik hakkı** ise her vatandaşın devlet tarafından sağlanan sosyal güvenlik şemsiyesi altında korunmasını güvence altına alır."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sosyal haklar bölümünde üç kritik farkı aklında tut: 1. **Kamulaştırma** özel taşınmaz mala, **devletleştirme** ise özel teşebbüse/şirkete yöneliktir; kamulaştırmada kural peşin ve nakit ödemedir (taksit istisnaidir ve en fazla 5 yıldır). 2. **Memurlar** 2010''dan beri **toplu sözleşme** yapabilirler, ancak memurların **grev hakkı kesinlikle yoktur**! 3. **Grev ve lokavt** hakkı siyasi değil, **sosyal ve ekonomik haklar** arasındadır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Devlet, Anayasa''da yer alan sosyal ve ekonomik ödevlerini hangi anayasal sınır ölçütüne göre yerine getirir?\" Cevap **Anayasa m. 65** uyarınca **mali kaynaklarının yeterliliği** ölçüsüdür; bu nedenle sosyal hakların kapsamı devletin bütçe imkanlarıyla orantılı olarak genişler."
  },
  {
    "type": "key_points",
    "items": [
      "Devlet sosyal ve ekonomik ödevlerini **mali kaynaklarının yeterliliği** ölçüsünde yerine getirir (m. 65).",
      "İlköğretim kız-erkek bütün vatandaşlar için zorunlu ve devlet okullarında parasızdır (m. 42).",
      "Kamulaştırma taşınmazlar içindir ve kural peşin ödemedir (istisnai büyük projelerde en fazla 5 yıl taksit); devletleştirme ise özel teşebbüsler içindir.",
      "2010 değişikliğiyle memurlara toplu sözleşme hakkı verildi ve çoklu sendika yasağı kalktı; ancak memurlara grev hakkı tanınmadı."
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
  'vatandaslik.temel_hak_ve_odevler.04',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  4,
  'Bölüm 4: Siyasi Haklar ve Ödevler (Aktif Statü Hakları)',
  'Anayasa''nın İkinci Kısmının Dördüncü Bölümünde yer alan Siyasi Haklar ve Ödevler, bireyin devlet yönetimine katılmasını sağlayan aktif statü haklarını ve devlete karşı temel vatandaşlık ödevlerini kapsar.  Bu bölümdeki süreler, yasaklar ve organ bağlantıları sınavların en yoğun soru alanıdır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Anayasa''nın İkinci Kısmının Dördüncü Bölümünde yer alan **Siyasi Haklar ve Ödevler**, bireyin devlet yönetimine katılmasını sağlayan aktif statü haklarını ve devlete karşı temel vatandaşlık ödevlerini kapsar. Bu bölümdeki süreler, yasaklar ve organ bağlantıları sınavların en yoğun soru alanıdır."
  },
  {
    "type": "heading",
    "text": "Vatandaşlık ve Siyasi Partiler (Anayasa m. 66, 68, 69)"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa m. 66** uyarınca Türk Devletine vatandaşlık bağı ile bağlı olan herkes Türktür. Türkiye''de çifte vatandaşlık serbesttir; yabancı bir devlet vatandaşlığını kazanan kişi doğrudan Türk vatandaşlığından çıkarılmaz. Vatandaşlıktan çıkarma cezası şahsidir (anne veya babanın çıkarılması eş ve çocukları etkilemez) ve **vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kapatılamaz**."
  },
  {
    "type": "paragraph",
    "text": "Siyasi partiler demokratik siyasi hayatın vazgeçilmez unsurlarıdır. Siyasi partiler **önceden izin almaksızın** en az **30 Türk vatandaşı** tarafından İçişleri Bakanlığı''na bildirimde bulunularak kurulur (TBMM''de siyasi parti grubu kurabilmek için ise en az **20 milletvekili** gerekir). Anayasa **m. 68**''e göre hakimler ve savcılar, Sayıştay dahil yüksek yargı organları mensupları, kamu kurum ve kuruluşlarının memur statüsündeki görevlileri, yaptıkları hizmet bakımından işçi niteliği taşımayan diğer kamu görevlileri, Silahlı Kuvvetler mensupları ile **yükseköğretim öncesi öğrenciler (lise ve dengi okul öğrencileri)** siyasi partilere **üye olamazlar**. Buna karşılık **yükseköğretim elemanları (üniversite öğretim üyeleri)** ve **üniversite öğrencileri** (kanunda belirtilen şartlar çerçevesinde) siyasi partilere üye olabilirler."
  },
  {
    "type": "paragraph",
    "text": "Anayasa **m. 69**''a göre siyasi partilerin **mali denetimi (gelir ve giderlerinin kanuna uygunluğu)** Danıştay veya TBMM tarafından değil, Sayıştay''ın teknik yardımıyla doğrudan **Anayasa Mahkemesi** tarafından yapılır. Siyasi partilerin kapatılması davasını ise **Yargıtay Cumhuriyet Başsavcısı** açar ve kapatma kararını **Anayasa Mahkemesi** verir. Temelli kapatılan bir partinin kapatılmasına beyan veya eylemleriyle sebep olan kurucuları dahil üyeleri, AYM''nin gerekçeli kararının Resmi Gazete''de yayımından başlayarak **5 yıl** süreyle bir başka partinin kurucusu, üyesi, yöneticisi ve denetçisi olamazlar (ancak **bağımsız milletvekili adayı** olarak seçime girebilirler!)."
  },
  {
    "type": "heading",
    "text": "Vatandaşlık Ödevleri ve Kamu Denetçiliği (m. 72-74)"
  },
  {
    "type": "bullets",
    "items": [
      "**Vatan Hizmeti (m. 72):** Her Türkün **hem hakkı hem ödevi**dir; askerlik hizmeti Silahlı Kuvvetler''de veya kamu kesiminde yerine getirilebilir (Anayasa''da hem hak hem ödev olarak sayılan tek hizmettir).",
      "**Vergi Ödevi (m. 73):** Herkes kamu giderlerini karşılamak üzere **mali gücüne göre** vergi ödemekle yükümlüdür (vergi adaleti herkesin eşit TL ödemesi değil, ödeme gücüne göre artan oranlı vergilendirmedir; vergi, resim ve harçlar ancak kanunla konulur).",
      "**Mal Bildirimi (3628 sayılı Kanun):** Kamu görevlileri ve memurlar, görev süreleri boyunca **sonu 0 ve 5 ile biten yıllarda** (2020, 2025, 2030 gibi) en geç **Şubat ayı sonuna kadar** mal bildirimlerini yenilemek zorundadırlar.",
      "**Dilekçe, Bilgi Edinme ve Kamu Denetçiliği (m. 74):** Vatandaşlar ve **karşılıklılık (mütekabiliyet) esası gözetilmek kaydıyla Türkiye''de ikamet eden yabancılar**, dilekçelerini **Türkçe** yazmak şartıyla yetkili makamlara ve TBMM''ye başvurabilirler. Dilekçe Kanunu''na göre idari makamların dilekçeye cevap verme süresi en geç **30 gün**, Bilgi Edinme Hakkı Kanunu''na göre ise kural olarak **15 iş günü**dür. Aynı maddeyle kurulan **Kamu Denetçiliği Kurumu (Ombudsmanlık)** **TBMM Başkanlığı''na bağlıdır**; kurumun başı olan **Kamu Başdenetçisi**, Cumhurbaşkanı tarafından değil, **TBMM Genel Kurulu tarafından gizli oyla ve 4 turlu seçimle** 4 yıllığına seçilir."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Siyasi haklarda sıkça karıştırılan üç sayı ve makam vardır: 1. Dernek kurma **7 kişi**, siyasi parti kurma **30 vatandaş**, TBMM''de parti grubu kurma **20 milletvekili**dir. 2. **Devlet Denetleme Kurulu (DDK)** Cumhurbaşkanlığına bağlıdır; **Kamu Denetçiliği Kurumu** ise **TBMM Başkanlığı''na** bağlıdır. 3. Siyasi partilerin mali denetimini Sayıştay yardımıyla **Anayasa Mahkemesi** yapar (kararı Sayıştay değil AYM verir)."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türkiye''de yaşayan bir yabancı vatandaşın TBMM''ye dilekçe verebilmesi için gereken iki şart nedir?\" Cevap **karşılıklılık (mütekabiliyet)** ve dilekçenin **Türkçe** yazılmış olmasıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Vatandaşlıktan çıkarma şahsidir ve yargı yolu kapatılamaz; çifte vatandaşlık serbesttir.",
      "Lise öğrencileri ve memurlar partiye üye olamaz; üniversite hocaları ve öğrencileri üye olabilir.",
      "Parti kurma 30 vatandaş, parti grubu 20 vekil; parti mali denetimi AYM''ye aittir; siyaset yasağı 5 yıldır (bağımsız adaylık serbest).",
      "İdari dilekçe cevap süresi 30 gün, bilgi edinme 15 iş günüdür; Kamu Denetçiliği Kurumu TBMM Başkanlığına bağlıdır; memurlar sonu 0 ve 5 biten yıllarda Şubat sonuna kadar mal bildirimi verir."
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
  'vatandaslik.temel_hak_ve_odevler.05',
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  5,
  'Bölüm 5: Hakların Korunması: AYM''ye Bireysel Başvuru ve AİHM',
  'Temel hak ve özgürlüklerin yalnızca anayasa metninde sayılması yeterli değildir; ihlal edilmeleri halinde bireyin başvurabileceği etkili ulusal ve uluslararası yargı yollarının da açık olması gerekir.  1982 Anayasası''nın 40.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Temel hak ve özgürlüklerin yalnızca anayasa metninde sayılması yeterli değildir; ihlal edilmeleri halinde bireyin başvurabileceği etkili ulusal ve uluslararası yargı yollarının da açık olması gerekir. 1982 Anayasası''nın 40. maddesi uyarınca anayasal hakları ihlal edilen herkesin yetkili makama geciktirilmeden başvurma hakkı vardır ve devlet, işlemlerinde ilgili kişilerin hangi kanun yolları ile mercilere hangi sürelerde başvurabileceğini göstermek zorundadır. Türkiye''de hak arama yollarının en üst halkalarını **Anayasa Mahkemesi''ne bireysel başvuru** ve **Avrupa İnsan Hakları Mahkemesi (AİHM)** başvurusu oluşturur."
  },
  {
    "type": "heading",
    "text": "Anayasa Mahkemesi''ne Bireysel Başvuru (m. 148)"
  },
  {
    "type": "paragraph",
    "text": "**Anayasa Mahkemesi''ne bireysel başvuru (anayasa şikayeti)** hakkı, **2010 anayasa referandumu** ile kabul edilerek 23 Eylül 2012''den itibaren uygulanmaya başlanmıştır. **Anayasa m. 148/3** uyarınca herkes, Anayasada güvence altına alınmış temel hak ve özgürlüklerinden **Avrupa İnsan Hakları Sözleşmesi (AİHS) kapsamındaki herhangi birinin** kamu gücü tarafından ihlal edildiği iddiasıyla Anayasa Mahkemesi''ne başvurabilir."
  },
  {
    "type": "paragraph",
    "text": "Bireysel başvurunun kabul edilebilmesi için şu şartların birlikte sağlanması zorunludur:"
  },
  {
    "type": "bullets",
    "items": [
      "**Çifte Koruma (Ortak Koruma Alanı):** İhlal edildiği iddia edilen hak, hem **1982 Anayasası**nda hem de **AİHS ve Türkiye''nin taraf olduğu ek protokollerde** güvence altına alınmış olmalıdır. Yalnızca Anayasa''da olup AİHS''te olmayan (veya yalnızca AİHS''te olup Anayasa''da olmayan) bir hak için AYM''ye bireysel başvuru yapılamaz.",
      "**İç Hukuk Yollarının Tüketilmesi:** Başvuruda bulunabilmek için olağan kanun yollarının (ilk derece mahkemesi, istinaf ve temyiz gibi tüm **iç hukuk yollarının**) tüketilmiş olması zorunlu dava şartıdır.",
      "**Başvuru Süresi:** 6216 sayılı Kanun m. 47/5 uyarınca bireysel başvuru, başvuru yollarının tüketildiği tarihten (başvuru yolu öngörülmemişse ihlalin öğrenildiği tarihten) itibaren **30 gün** içinde yapılmalıdır."
    ]
  },
  {
    "type": "paragraph",
    "text": "Yasama işlemleri (kanunlar) ile düzenleyici idari işlemler aleyhine doğrudan bireysel başvuru yapılamaz; ayrıca Anayasa''nın yargı denetimi dışında bıraktığı işlemler (örneğin **YSK kararları** veya **OHAL CBK''ları**) bireysel başvuruya konu edilemez. AYM incelemesi sonucunda hak ihlali tespit ederse ihlalin ve sonuçlarının ortadan kaldırılması için yeniden yargılama yapılmasına veya tazminata hükmedebilir; ancak idari eylem veya işlem niteliğinde karar veremez ve yerindelik denetimi yapamaz."
  },
  {
    "type": "heading",
    "text": "Avrupa İnsan Hakları Mahkemesi (AİHM) Başvurusu"
  },
  {
    "type": "paragraph",
    "text": "Ulusal düzeydeki tüm iç hukuk yolları (AYM''ye bireysel başvuru yolu dahil) tüketildikten sonra hakkının hala ihlal edildiğini düşünen birey, Strasbourg''da bulunan **Avrupa İnsan Hakları Mahkemesi (AİHM)**ne başvurabilir. Türkiye 1987 yılında AİHM''e bireysel başvuru hakkını, 1990 yılında ise mahkemenin zorunlu yargı yetkisini kabul etmiştir."
  },
  {
    "type": "paragraph",
    "text": "Başvuru süreleri konusunda güncel değişikliğe özellikle dikkat etmelisin: Eski düzenlemede AİHM''e başvuru süresi 6 ay iken, Avrupa İnsan Hakları Sözleşmesi''ne ek **15 No''lu Protokol**ün yürürlüğe girmesiyle birlikte kesinleşmiş nihai iç hukuk kararının tebliğinden itibaren **güncel AİHM başvuru süresi 4 ay**a indirilmiştir."
  },
  {
    "type": "table",
    "headers": [
      "Başvuru Merci",
      "Kabul / Güncellenme",
      "Başvuru Süresi",
      "Temel Dava Şartı"
    ],
    "rows": [
      [
        "AYM Bireysel Başvuru",
        "2010 Anayasa Değişikliği",
        "**30 gün**",
        "Olağan iç hukuk yollarının tüketilmesi + AİHS ortak alanı"
      ],
      [
        "AYM Norm Denetimi (İptal)",
        "1961 Anayasası",
        "**60 gün** (anayasa değ. şekil **10 gün**)",
        "Soyut veya somut norm denetimi"
      ],
      [
        "AİHM Bireysel Başvuru",
        "15 No''lu Protokol ile güncel",
        "**4 ay** (eski 6 ay)",
        "AYM bireysel başvurusu dahil tüm iç hukuk yollarının tüketilmesi"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Süre ve kapsam konusunda iki klasik tuzağa düşme: 1. AYM''de **norm denetimi iptal davası** açma süresi **60 gün**, vatandaşın **bireysel başvuru** süresi **30 gün**, AİHM''e güncel başvuru süresi ise **4 ay**dır! 2. Bireysel başvuru için \"yalnızca Anayasa''da yazması\" yetmez; hakkın hem Anayasa''da hem AİHS''te yer alması (**çifte koruma**) şarttır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Kesinleşmiş mahkeme kararının öğrenilmesinden sonra AYM''ye bireysel başvuru süresi ile tüm iç hukuk yolları tüketildikten sonra AİHM''e başvuru süresi sırasıyla nedir?\" Cevap: AYM için **30 gün**, AİHM için **4 ay**dır."
  },
  {
    "type": "key_points",
    "items": [
      "Bireysel başvuru 2010 anayasa referandumuyla gelmiştir; olağan iç hukuk yollarının tüketilmesi zorunludur.",
      "Bireysel başvuruda **çifte koruma** aranır: hak hem Anayasa''da hem AİHS''te yer almalıdır.",
      "AYM bireysel başvuru süresi **30 gün**, norm denetimi iptal davası süresi **60 gün**dür.",
      "15 No''lu Protokol sonrası güncel AİHM başvuru süresi **4 ay**dır (eski 6 ay kuralı değişmiştir)."
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
